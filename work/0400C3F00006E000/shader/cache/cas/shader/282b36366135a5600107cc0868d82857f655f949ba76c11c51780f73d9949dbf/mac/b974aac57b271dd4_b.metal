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
int _56(thread const int& _3653, thread const int& _3654, constant _10& support_buffer)
{
    int _3657 = 1 + _3654;
    float _3659 = support_buffer._m5[_3657].x;
    bool _3661 = _3659 == 1.0;
    if (_3661)
    {
        return _3653;
    }
    float _3663 = float(_3653);
    float _3665 = _3663 * _3659;
    int _3667 = int(_3665);
    return _3667;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3688, thread const int& _3689, thread const int& _3690, thread int& _3691, thread uint& gl_SubgroupInvocationID)
{
    int _3694 = _3690 & 31;
    uint _3696 = uint(int(uint(_3690) >> uint(8)));
    int _3698 = int(_3696) & 31;
    float _3700 = as_type<float>(gl_SubgroupInvocationID);
    int _3702 = as_type<int>(_3700) & _3698;
    int _3704 = ~_3698;
    int _3706 = _3694 & _3704;
    int _3708 = _3706 | _3702;
    int _3710 = ~_3698;
    int _3712 = _3689 & _3710;
    int _3714 = _3712 | _3702;
    bool _3716 = uint(_3714) <= uint(_3708);
    _3691 = _3716 ? (-1) : 0;
    float _3718 = spvSubgroupShuffle(as_type<float>(_3688), uint(_3714));
    uint _3720 = uint(_3716 ? as_type<int>(_3718) : _3688);
    return int(_3720);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1084 = false;
    bool _594 = false;
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
        int3 _1736 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1736.xy), uint(_1736.z), 0).xyz;
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
        int3 _1764 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1764.xy), uint(_1764.z), 0).xyz;
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
        int3 _1795 = int3(_247, _253, as_type<int>(_153));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1795.xy), uint(_1795.z), 0).xyz;
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
        int3 _1823 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1823.xy), uint(_1823.z), 0).xyz;
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
        int3 _1851 = int3(_313, _319, as_type<int>(_167));
        float4 _322 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1851.xy), uint(_1851.z), 0).xyzw;
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
    float _350 = 0.0;
    float _352 = _344;
    float _354 = _346;
    if (!_129)
    {
        _348 = 0.0;
        _350 = 0.0;
    }
    float _356 = _348;
    float _358 = _350;
    float _360 = 0.0;
    float _362 = _356;
    float _364 = _358;
    if (!_129)
    {
        _360 = 0.0;
    }
    float _366 = _360;
    float _368 = 0.0;
    float _370 = _366;
    if (!_129)
    {
        _368 = 0.0;
    }
    float _372 = _368;
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
        int3 _1932 = int3(_404, _410, 2);
        float3 _412 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1932.xy), uint(_1932.z), 0).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _338 * 2.0;
        _370 = _332;
        _392 = _336;
        _376 = _334;
        _352 = _295;
        _354 = _297;
        _362 = _418;
        _384 = _414;
        _386 = _416;
        _364 = _299;
        _398 = _420;
    }
    float _422 = _370;
    float _424 = _392;
    float _426 = _376;
    float _428 = _352;
    float _430 = _354;
    float _432 = _362;
    float _434 = _384;
    float _436 = _386;
    float _438 = _364;
    float _440 = _398;
    bool _442 = !_125;
    float _444 = _428;
    float _446 = _438;
    float _448 = _436;
    float _450 = _432;
    float _572;
    float _574;
    float _576;
    float _578;
    float _580;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    float _592;
    if (!_442)
    {
        int _452 = _101 + 28;
        uint _454 = uint(int(uint(_452) >> uint(2)));
        uint _456 = uint(int(uint(int(_454)) >> uint(2)));
        int _458 = int(_454) & 3;
        float _460 = (*spvDescriptorSet0.cp_c5)._m0[int(_456)][_458];
        int _462 = _101 + 20;
        uint _464 = uint(int(uint(_462) >> uint(2)));
        uint _466 = uint(int(uint(int(_464)) >> uint(2)));
        int _468 = int(_464) & 3;
        float _470 = (*spvDescriptorSet0.cp_c5)._m0[int(_466)][_468];
        float _472 = _199 * _460;
        float _474 = _203 * _460;
        float _476 = _201 * _460;
        float _478 = _231 * _460;
        float _480 = _233 * _460;
        float _482 = fma(_422, _470, _472);
        float _484 = fma(_424, _470, _474);
        float _486 = fma(_426, _470, _476);
        float _488 = fma(_428, _470, _478);
        float _490 = _482 * 0.15915493667125701904296875;
        float _492 = _484 * 0.15915493667125701904296875;
        float _494 = _486 * 0.15915493667125701904296875;
        float _496 = fma(_430, _470, _480);
        float _498 = _490 * 6.283185482025146484375;
        float _500 = cos(_498);
        float _502 = _267 * _460;
        float _504 = fma(_432, _470, _502);
        float _506 = _492 * 6.283185482025146484375;
        float _508 = sin(_506);
        float _510 = _492 * 6.283185482025146484375;
        float _512 = cos(_510);
        float _514 = _490 * 6.283185482025146484375;
        float _516 = sin(_514);
        float _518 = _494 * 6.283185482025146484375;
        float _520 = cos(_518);
        float _522 = _263 * _460;
        float _524 = _265 * _460;
        float _526 = _235 * _460;
        float _528 = _500 * _512;
        float _530 = fma(_434, _470, _522);
        float _532 = fma(_436, _470, _524);
        float _534 = fma(_438, _470, _526);
        float _536 = _494 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = _508 * _500;
        float _542 = _516 * _508;
        float _544 = _500 * _520;
        float _546 = _520 * _512;
        float _548 = _508 * _520;
        float _550 = _516 * _520;
        float _552 = _516 * _512;
        float _554 = _516 * _538;
        float _556 = -_540;
        float _558 = fma(_512, _554, _556);
        float _560 = fma(_508, _554, _528);
        float _562 = -_552;
        float _564 = fma(_538, _540, _562);
        float _566 = fma(_538, _528, _542);
        float _568 = -_538;
        float _570 = _568 + (-0.0);
        _444 = _488;
        _572 = _546;
        _574 = _570;
        _446 = _534;
        _576 = _566;
        _578 = _548;
        _580 = _564;
        _582 = _496;
        _584 = _558;
        _586 = _560;
        _588 = _550;
        _590 = _544;
        _592 = _530;
        _448 = _532;
        _450 = _504;
        _594 = true;
    }
    else
    {
        float _596 = _422 * 2.0;
        float _598 = _424 * _440;
        float _600 = _426 * _440;
        float _602 = _422 * _440;
        float _604 = -_598;
        float _606 = fma(_596, _426, _604);
        float _608 = fma(_596, _426, _598);
        float _610 = _426 * _426;
        float _612 = fma(_596, _424, _600);
        float _614 = -_600;
        float _616 = fma(_596, _424, _614);
        float _618 = _422 * _422;
        float _620 = _426 * 2.0;
        float _622 = _424 * _424;
        float _624 = fma(_610, -2.0, 1.0);
        float _626 = fma(_618, -2.0, 1.0);
        float _628 = -_602;
        float _630 = fma(_620, _424, _628);
        float _632 = fma(_620, _424, _602);
        float _634 = fma(_622, -2.0, _624);
        float _636 = fma(_622, -2.0, _626);
        float _638 = fma(_610, -2.0, _626);
        _572 = _634;
        _574 = _616;
        _576 = _612;
        _578 = _608;
        _580 = _630;
        _582 = _430;
        _584 = _606;
        _586 = _636;
        _588 = _632;
        _590 = _638;
        _592 = _434;
    }
    _594 = false;
    float _640 = _444;
    float _642 = _572;
    float _644 = _574;
    float _646 = _446;
    float _648 = _576;
    float _650 = _578;
    float _652 = _580;
    float _654 = _582;
    float _656 = _584;
    float _658 = _586;
    float _660 = _588;
    float _662 = _590;
    float _664 = _592;
    float _666 = _448;
    float _668 = _450;
    float _670 = _640 * _642;
    float _672 = _640 * _644;
    float _674 = _646 * _648;
    bool _676 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _678 = _640 * _650;
    float _680 = _646 * _652;
    bool _682 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _684 = _654 * _656;
    float _686 = _654 * _658;
    float _688 = _654 * _660;
    float _690 = _646 * _662;
    float _692 = _674;
    float _694 = _664;
    if (!_676)
    {
        int _696 = _68 * 48;
        int _698 = _696 + 16;
        uint _700 = uint(int(uint(_696) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_700)] = as_type<uint>(_670);
        int _702 = _696 + 4;
        uint _704 = uint(int(uint(_702) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_704)] = as_type<uint>(_684);
        int _706 = _696 + 8;
        uint _708 = uint(int(uint(_706) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_708)] = as_type<uint>(_674);
        int _710 = _696 + 12;
        uint _712 = uint(int(uint(_710) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_712)] = as_type<uint>(_664);
        int _714 = _696 + 32;
        uint _716 = uint(int(uint(_698) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_716)] = as_type<uint>(_678);
        int _718 = _698 + 4;
        uint _720 = uint(int(uint(_718) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_720)] = as_type<uint>(_686);
        int _722 = _698 + 8;
        uint _724 = uint(int(uint(_722) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_724)] = as_type<uint>(_680);
        int _726 = _698 + 12;
        uint _728 = uint(int(uint(_726) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_728)] = as_type<uint>(_666);
        uint _730 = uint(int(uint(_714) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_730)] = as_type<uint>(_672);
        int _732 = _714 + 4;
        uint _734 = uint(int(uint(_732) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_734)] = as_type<uint>(_688);
        int _736 = _714 + 8;
        uint _738 = uint(int(uint(_736) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_738)] = as_type<uint>(_690);
        int _740 = _714 + 12;
        uint _742 = uint(int(uint(_740) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_742)] = as_type<uint>(_668);
    }
    int _744 = _68 * 112;
    bool _746 = !_682;
    float _1064;
    float _1066;
    float _1068;
    float _1070;
    float _1072;
    float _1074;
    float _1076;
    float _1078;
    float _1080;
    float _1082;
    if (!_746)
    {
        int _748 = 0;
        float _750 = _670;
        float _752 = _684;
        float _754 = _674;
        float _756 = _664;
        float _758 = _678;
        float _760 = _686;
        float _762 = _680;
        float _764 = _666;
        float _766 = _672;
        float _768 = _688;
        float _770 = _690;
        float _772 = _668;
        bool _774;
        int _822;
        int _832;
        int _842;
        int _852;
        int _862;
        int _872;
        int _882;
        int _892;
        int _902;
        int _912;
        int _922;
        int _932;
        int _1040;
        int _1044;
        int _1046;
        int _1050;
        int _1052;
        int _1054;
        int _1058;
        int _1060;
        int _1062;
        do
        {
            int _776 = _748;
            int _778 = as_type<int>(_750);
            int _780 = as_type<int>(_752);
            int _782 = as_type<int>(_754);
            int _784 = as_type<int>(_756);
            int _786 = as_type<int>(_758);
            int _788 = as_type<int>(_760);
            int _790 = as_type<int>(_762);
            int _792 = as_type<int>(_764);
            int _794 = as_type<int>(_766);
            int _796 = as_type<int>(_768);
            int _798 = as_type<int>(_770);
            int _800 = as_type<int>(_772);
            uint _802 = uint(int(uint(_744) >> uint(2)));
            uint _804 = uint(int(uint(int(_802)) >> uint(2)));
            int _806 = int(_802) & 3;
            float _808 = (*spvDescriptorSet0.cp_c6)._m0[int(_804)][_806];
            bool _810 = _68 != 0;
            int _812 = _776 + 1;
            bool _814 = uint(_812) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _816 = _778;
            int _818 = as_type<int>(_808);
            int _820 = 31;
            int _2513 = _58(_816, _818, _820, _822, gl_SubgroupInvocationID);
            int _824 = _2513;
            int _826 = _780;
            int _828 = as_type<int>(_808);
            int _830 = 31;
            int _2517 = _58(_826, _828, _830, _832, gl_SubgroupInvocationID);
            int _834 = _2517;
            int _836 = _782;
            int _838 = as_type<int>(_808);
            int _840 = 31;
            int _2521 = _58(_836, _838, _840, _842, gl_SubgroupInvocationID);
            int _844 = _2521;
            int _846 = _784;
            int _848 = as_type<int>(_808);
            int _850 = 31;
            int _2525 = _58(_846, _848, _850, _852, gl_SubgroupInvocationID);
            int _854 = _2525;
            int _856 = _786;
            int _858 = as_type<int>(_808);
            int _860 = 31;
            int _2529 = _58(_856, _858, _860, _862, gl_SubgroupInvocationID);
            int _864 = _2529;
            int _866 = _788;
            int _868 = as_type<int>(_808);
            int _870 = 31;
            int _2533 = _58(_866, _868, _870, _872, gl_SubgroupInvocationID);
            int _874 = _2533;
            int _876 = _790;
            int _878 = as_type<int>(_808);
            int _880 = 31;
            int _2537 = _58(_876, _878, _880, _882, gl_SubgroupInvocationID);
            int _884 = _2537;
            int _886 = _792;
            int _888 = as_type<int>(_808);
            int _890 = 31;
            int _2541 = _58(_886, _888, _890, _892, gl_SubgroupInvocationID);
            int _894 = _2541;
            int _896 = _794;
            int _898 = as_type<int>(_808);
            int _900 = 31;
            int _2545 = _58(_896, _898, _900, _902, gl_SubgroupInvocationID);
            int _904 = _2545;
            int _906 = _796;
            int _908 = as_type<int>(_808);
            int _910 = 31;
            int _2549 = _58(_906, _908, _910, _912, gl_SubgroupInvocationID);
            int _914 = _2549;
            int _916 = _798;
            int _918 = as_type<int>(_808);
            int _920 = 31;
            int _2553 = _58(_916, _918, _920, _922, gl_SubgroupInvocationID);
            int _924 = _2553;
            int _926 = _800;
            int _928 = as_type<int>(_808);
            int _930 = 31;
            int _2557 = _58(_926, _928, _930, _932, gl_SubgroupInvocationID);
            int _934 = _2557;
            bool _936 = !_810;
            _748 = _812;
            int _938 = _778;
            int _940 = _780;
            int _942 = _782;
            int _944 = _784;
            int _946 = _786;
            int _948 = _788;
            int _950 = _790;
            int _952 = _792;
            int _954 = _794;
            int _956 = _796;
            int _958 = _798;
            int _960 = _800;
            if (!_936)
            {
                float _962 = as_type<float>(_834) * _666;
                float _964 = _678 * as_type<float>(_834);
                float _966 = _686 * as_type<float>(_834);
                float _968 = _680 * as_type<float>(_834);
                float _970 = as_type<float>(_874) * _666;
                float _972 = _678 * as_type<float>(_874);
                float _974 = fma(as_type<float>(_824), _664, _962);
                float _976 = fma(_670, as_type<float>(_824), _964);
                float _978 = fma(_684, as_type<float>(_824), _966);
                float _980 = fma(_674, as_type<float>(_824), _968);
                float _982 = _686 * as_type<float>(_874);
                float _984 = _680 * as_type<float>(_874);
                float _986 = fma(as_type<float>(_864), _664, _970);
                float _988 = as_type<float>(_914) * _666;
                float _990 = fma(_670, as_type<float>(_864), _972);
                float _992 = _686 * as_type<float>(_914);
                float _994 = _678 * as_type<float>(_914);
                float _996 = fma(_684, as_type<float>(_864), _982);
                float _998 = fma(_674, as_type<float>(_864), _984);
                float _1000 = _680 * as_type<float>(_914);
                float _1002 = fma(as_type<float>(_904), _664, _988);
                float _1004 = fma(_684, as_type<float>(_904), _992);
                float _1006 = fma(_670, as_type<float>(_904), _994);
                float _1008 = fma(_688, as_type<float>(_844), _978);
                float _1010 = fma(_690, as_type<float>(_844), _980);
                float _1012 = fma(_672, as_type<float>(_844), _976);
                float _1014 = fma(_672, as_type<float>(_884), _990);
                float _1016 = fma(_688, as_type<float>(_884), _996);
                float _1018 = fma(_690, as_type<float>(_884), _998);
                float _1020 = fma(_674, as_type<float>(_904), _1000);
                float _1022 = fma(as_type<float>(_844), _668, _974);
                float _1024 = fma(as_type<float>(_884), _668, _986);
                float _1026 = fma(as_type<float>(_924), _668, _1002);
                float _1028 = fma(_688, as_type<float>(_924), _1004);
                float _1030 = fma(_672, as_type<float>(_924), _1006);
                float _1032 = fma(_690, as_type<float>(_924), _1020);
                float _1034 = as_type<float>(_854) + _1022;
                float _1036 = as_type<float>(_894) + _1024;
                float _1038 = as_type<float>(_934) + _1026;
                _938 = as_type<int>(_1012);
                _940 = as_type<int>(_1008);
                _942 = as_type<int>(_1010);
                _944 = as_type<int>(_1034);
                _946 = as_type<int>(_1014);
                _948 = as_type<int>(_1016);
                _950 = as_type<int>(_1018);
                _952 = as_type<int>(_1036);
                _954 = as_type<int>(_1030);
                _956 = as_type<int>(_1028);
                _958 = as_type<int>(_1032);
                _960 = as_type<int>(_1038);
            }
            _1040 = _938;
            int _1042 = _940;
            _1044 = _942;
            _1046 = _944;
            int _1048 = _946;
            _1050 = _948;
            _1052 = _950;
            _1054 = _952;
            int _1056 = _954;
            _1058 = _956;
            _1060 = _958;
            _1062 = _960;
            _774 = !_814;
            _750 = as_type<float>(_1040);
            _752 = as_type<float>(_1042);
            _754 = as_type<float>(_1044);
            _756 = as_type<float>(_1046);
            _758 = as_type<float>(_1048);
            _760 = as_type<float>(_1050);
            _762 = as_type<float>(_1052);
            _764 = as_type<float>(_1054);
            _766 = as_type<float>(_1056);
            _768 = as_type<float>(_1058);
            _770 = as_type<float>(_1060);
            _772 = as_type<float>(_1062);
            _1064 = as_type<float>(_1042);
            _1066 = as_type<float>(_1048);
            _1068 = as_type<float>(_1056);
        } while (_774);
        _1070 = as_type<float>(_1050);
        _1072 = as_type<float>(_1058);
        _1074 = as_type<float>(_1040);
        _692 = as_type<float>(_1044);
        _1076 = as_type<float>(_1052);
        _1078 = as_type<float>(_1060);
        _1080 = as_type<float>(_1054);
        _1082 = as_type<float>(_1062);
        _694 = as_type<float>(_1046);
        _1084 = true;
    }
    else
    {
        _1064 = _684;
        _1070 = _686;
        _1072 = _688;
        _1074 = _670;
        _1066 = _678;
        _1068 = _672;
        _1076 = _680;
        _1078 = _690;
        _1080 = _666;
        _1082 = _668;
    }
    _1084 = false;
    float _1086 = _1064;
    float _1088 = _1070;
    float _1090 = _1072;
    float _1092 = _1074;
    float _1094 = _1066;
    float _1096 = _1068;
    float _1098 = _692;
    float _1100 = _1076;
    float _1102 = _1078;
    float _1104 = _1080;
    float _1106 = _1082;
    float _1108 = _694;
    int _1110 = _744 + 80;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    uint _1114 = uint(int(uint(int(_1112)) >> uint(2)));
    int _1116 = int(_1112) & 3;
    float _1118 = (*spvDescriptorSet0.cp_c6)._m0[int(_1114)][_1116];
    int _1120 = int(_1112) + 1;
    uint _1122 = uint(int(uint(_1120) >> uint(2)));
    int _1124 = _1120 & 3;
    float _1126 = (*spvDescriptorSet0.cp_c6)._m0[int(_1122)][_1124];
    int _1128 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1130 = _1128 + _68;
    int _1132 = _744 + 64;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.cp_c6)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.cp_c6)._m0[int(_1144)][_1146];
    int _1150 = _744 + 88;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.cp_c6)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.cp_c6)._m0[int(_1162)][_1164];
    int _1168 = _744 + 72;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
    int _1174 = int(_1170) & 3;
    float _1176 = (*spvDescriptorSet0.cp_c6)._m0[int(_1172)][_1174];
    int _1178 = int(_1170) + 1;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    int _1182 = _1178 & 3;
    float _1184 = (*spvDescriptorSet0.cp_c6)._m0[int(_1180)][_1182];
    int _1186 = _744 + 96;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
    int _1192 = int(_1188) & 3;
    float _1194 = (*spvDescriptorSet0.cp_c6)._m0[int(_1190)][_1192];
    int _1196 = int(_1188) + 1;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    int _1200 = _1196 & 3;
    float _1202 = (*spvDescriptorSet0.cp_c6)._m0[int(_1198)][_1200];
    int _1204 = _744 + 104;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.cp_c6)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.cp_c6)._m0[int(_1216)][_1218];
    float _1222 = _1086 * _1118;
    float _1224 = _1088 * _1118;
    float _1226 = _1090 * _1118;
    int _1228 = _744 + 16;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.cp_c6)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
    float _1246 = _1086 * _1126;
    float _1248 = _1090 * _1126;
    float _1250 = fma(_1092, _1140, _1222);
    float _1252 = fma(_1094, _1140, _1224);
    float _1254 = fma(_1096, _1140, _1226);
    float _1256 = _1088 * _1126;
    int _1258 = _744 + 32;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
    int _1264 = int(_1260) & 3;
    float _1266 = (*spvDescriptorSet0.cp_c6)._m0[int(_1262)][_1264];
    int _1268 = int(_1260) + 1;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    int _1272 = _1268 & 3;
    float _1274 = (*spvDescriptorSet0.cp_c6)._m0[int(_1270)][_1272];
    float _1276 = fma(_1092, _1148, _1246);
    float _1278 = fma(_1096, _1148, _1248);
    float _1280 = fma(_1094, _1148, _1256);
    float _1282 = _1086 * _1158;
    float _1284 = _1088 * _1158;
    float _1286 = _1090 * _1158;
    float _1288 = _1090 * _1166;
    int _1290 = _744 + 48;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.cp_c6)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.cp_c6)._m0[int(_1302)][_1304];
    float _1308 = _1086 * _1166;
    float _1310 = _1088 * _1166;
    float _1312 = fma(_1092, _1176, _1282);
    float _1314 = fma(_1094, _1176, _1284);
    float _1316 = fma(_1092, _1184, _1308);
    float _1318 = fma(_1094, _1184, _1310);
    int _1320 = _744 + 40;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.cp_c6)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.cp_c6)._m0[int(_1332)][_1334];
    float _1338 = fma(_1096, _1176, _1286);
    float _1340 = fma(_1096, _1184, _1288);
    float _1342 = fma(_1098, _1194, _1250);
    float _1344 = fma(_1100, _1194, _1252);
    float _1346 = fma(_1102, _1194, _1254);
    float _1348 = fma(_1100, _1202, _1280);
    int _1350 = _744 + 24;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.cp_c6)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.cp_c6)._m0[int(_1362)][_1364];
    float _1368 = fma(_1098, _1202, _1276);
    float _1370 = fma(_1102, _1202, _1278);
    float _1372 = fma(_1098, _1212, _1312);
    float _1374 = fma(_1100, _1220, _1318);
    float _1376 = fma(_1102, _1220, _1340);
    float _1378 = fma(_1098, _1220, _1316);
    int _1380 = _744 + 56;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
    int _1386 = int(_1382) & 3;
    float _1388 = (*spvDescriptorSet0.cp_c6)._m0[int(_1384)][_1386];
    int _1390 = int(_1382) + 1;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    int _1394 = _1390 & 3;
    float _1396 = (*spvDescriptorSet0.cp_c6)._m0[int(_1392)][_1394];
    float _1398 = fma(_1100, _1212, _1314);
    float _1400 = _1374 + _1104;
    float _1402 = fma(_1102, _1212, _1338);
    float _1404 = _1376 + _1106;
    float _1406 = _1378 + _1108;
    float _1408 = _1344 * _1244;
    float _1410 = _1348 * _1244;
    float _1412 = _1398 * _1244;
    float _1414 = _1400 * _1244;
    float _1416 = fma(_1342, _1236, _1408);
    float _1418 = fma(_1368, _1236, _1410);
    float _1420 = fma(_1372, _1236, _1412);
    float _1422 = fma(_1406, _1236, _1414);
    float _1424 = _1344 * _1274;
    float _1426 = _1348 * _1274;
    float _1428 = _1398 * _1274;
    float _1430 = _1400 * _1274;
    float _1432 = fma(_1342, _1266, _1424);
    float _1434 = fma(_1368, _1266, _1426);
    float _1436 = fma(_1372, _1266, _1428);
    float _1438 = fma(_1406, _1266, _1430);
    float _1440 = _1344 * _1306;
    float _1442 = _1348 * _1306;
    float _1444 = _1398 * _1306;
    float _1446 = _1400 * _1306;
    float _1448 = fma(_1342, _1298, _1440);
    float _1450 = fma(_1368, _1298, _1442);
    float _1452 = fma(_1372, _1298, _1444);
    float _1454 = fma(_1406, _1298, _1446);
    float _1456 = fma(_1404, _1328, _1438);
    float _1458 = fma(_1346, _1328, _1432);
    float _1460 = fma(_1370, _1328, _1434);
    float _1462 = fma(_1402, _1328, _1436);
    float _1464 = _1456 + _1336;
    int _1466 = _1130 * 48;
    float _1468 = fma(_1404, _1358, _1422);
    float _1470 = fma(_1346, _1358, _1416);
    float _1472 = fma(_1370, _1358, _1418);
    float _1474 = fma(_1402, _1358, _1420);
    float _1476 = _1468 + _1366;
    int _1478 = _1466 + 16;
    int _1480 = _1466 + 32;
    float _1482 = fma(_1404, _1388, _1454);
    float _1484 = fma(_1346, _1388, _1448);
    float _1486 = fma(_1370, _1388, _1450);
    float _1488 = fma(_1402, _1388, _1452);
    float _1490 = _1482 + _1396;
    int _1492 = _1466 + 48;
    uint _1494 = uint(int(uint(_1478) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1494)] = as_type<uint>(_1470);
    int _1496 = _1478 + 4;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1498)] = as_type<uint>(_1472);
    int _1500 = _1478 + 8;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1502)] = as_type<uint>(_1474);
    int _1504 = _1478 + 12;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1506)] = as_type<uint>(_1476);
    uint _1508 = uint(int(uint(_1480) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1508)] = as_type<uint>(_1458);
    int _1510 = _1480 + 4;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1512)] = as_type<uint>(_1460);
    int _1514 = _1480 + 8;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1516)] = as_type<uint>(_1462);
    int _1518 = _1480 + 12;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1520)] = as_type<uint>(_1464);
    uint _1522 = uint(int(uint(_1492) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1522)] = as_type<uint>(_1484);
    int _1524 = _1492 + 4;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1526)] = as_type<uint>(_1486);
    int _1528 = _1492 + 8;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1530)] = as_type<uint>(_1488);
    int _1532 = _1492 + 12;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1534)] = as_type<uint>(_1490);
}

