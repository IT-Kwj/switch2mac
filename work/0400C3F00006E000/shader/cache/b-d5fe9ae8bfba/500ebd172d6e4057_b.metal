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
int _54(thread const int& _3461, thread const int& _3462, constant _10& support_buffer)
{
    int _3465 = 1 + _3462;
    float _3467 = support_buffer._m5[_3465].x;
    bool _3469 = _3467 == 1.0;
    if (_3469)
    {
        return _3461;
    }
    float _3471 = float(_3461);
    float _3473 = _3471 * _3467;
    int _3475 = int(_3473);
    return _3475;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3496, thread const int& _3497, thread const int& _3498, thread int& _3499, thread uint& gl_SubgroupInvocationID)
{
    int _3502 = _3498 & 31;
    uint _3504 = uint(int(uint(_3498) >> uint(8)));
    int _3506 = int(_3504) & 31;
    float _3508 = as_type<float>(gl_SubgroupInvocationID);
    int _3510 = as_type<int>(_3508) & _3506;
    int _3512 = ~_3506;
    int _3514 = _3502 & _3512;
    int _3516 = _3514 | _3510;
    int _3518 = ~_3506;
    int _3520 = _3497 & _3518;
    int _3522 = _3520 | _3510;
    bool _3524 = uint(_3522) <= uint(_3516);
    _3499 = _3524 ? (-1) : 0;
    float _3526 = spvSubgroupShuffle(as_type<float>(_3496), uint(_3522));
    uint _3528 = uint(_3524 ? as_type<int>(_3526) : _3496);
    return int(_3528);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1032 = false;
    bool _592 = false;
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
    float _133 = _119;
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
        int3 _1685 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1685.xy), uint(_1685.z), 0).xyz;
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
        int3 _1713 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1713.xy), uint(_1713.z), 0).xyz;
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
        int3 _1744 = int3(_247, _253, as_type<int>(_153));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1744.xy), uint(_1744.z), 0).xyz;
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
        int3 _1772 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1772.xy), uint(_1772.z), 0).xyz;
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
        int3 _1800 = int3(_313, _319, as_type<int>(_167));
        float4 _322 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1800.xy), uint(_1800.z), 0).xyzw;
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
    float _370 = 0.0;
    float _372 = _366;
    if (!_127)
    {
        _368 = 0.0;
        _370 = 0.0;
    }
    float _374 = _368;
    float _376 = _370;
    float _378 = 0.0;
    float _380 = _374;
    float _382 = _376;
    if (!_127)
    {
        _378 = 0.0;
    }
    float _384 = _378;
    float _386 = _384;
    if (!_127)
    {
        _175 = 0.0;
        _133 = 0.0;
    }
    float _388 = _175;
    float _390 = _133;
    bool _392 = !_127;
    float _394 = _388;
    float _396 = _390;
    if (!_392)
    {
        int _398 = _66;
        int _400 = 1;
        int _402 = _54(_398, _400, (*spvDescriptorSet0.support_buffer));
        int _404 = _165;
        int _406 = 1;
        int _408 = _54(_404, _406, (*spvDescriptorSet0.support_buffer));
        int3 _1877 = int3(_402, _408, 2);
        float3 _410 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1877.xy), uint(_1877.z), 0).xyz;
        float _412 = _410.x;
        float _414 = _410.y;
        float _416 = _410.z;
        float _418 = _338 * 2.0;
        _372 = _332;
        _380 = _336;
        _386 = _334;
        _394 = _412;
        _352 = _295;
        _362 = _299;
        _396 = _414;
        _364 = _416;
        _354 = _297;
        _382 = _418;
    }
    float _420 = _372;
    float _422 = _380;
    float _424 = _386;
    float _426 = _394;
    float _428 = _352;
    float _430 = _362;
    float _432 = _396;
    float _434 = _364;
    float _436 = _354;
    float _438 = _382;
    bool _440 = !_123;
    float _442 = _432;
    float _564;
    float _566;
    float _568;
    float _570;
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
    if (!_440)
    {
        int _444 = _99 + 28;
        uint _446 = uint(int(uint(_444) >> uint(2)));
        uint _448 = uint(int(uint(int(_446)) >> uint(2)));
        int _450 = int(_446) & 3;
        float _452 = (*spvDescriptorSet0.cp_c5)._m0[int(_448)][_450];
        int _454 = _99 + 20;
        uint _456 = uint(int(uint(_454) >> uint(2)));
        uint _458 = uint(int(uint(int(_456)) >> uint(2)));
        int _460 = int(_456) & 3;
        float _462 = (*spvDescriptorSet0.cp_c5)._m0[int(_458)][_460];
        float _464 = _199 * _452;
        float _466 = _203 * _452;
        float _468 = _201 * _452;
        float _470 = _263 * _452;
        float _472 = _231 * _452;
        float _474 = _233 * _452;
        float _476 = _235 * _452;
        float _478 = fma(_420, _462, _464);
        float _480 = fma(_422, _462, _466);
        float _482 = fma(_424, _462, _468);
        float _484 = fma(_426, _462, _470);
        float _486 = _478 * 0.15915493667125701904296875;
        float _488 = _480 * 0.15915493667125701904296875;
        float _490 = _482 * 0.15915493667125701904296875;
        float _492 = _265 * _452;
        float _494 = _486 * 6.283185482025146484375;
        float _496 = sin(_494);
        float _498 = _267 * _452;
        float _500 = fma(_428, _462, _472);
        float _502 = fma(_430, _462, _476);
        float _504 = fma(_432, _462, _492);
        float _506 = fma(_434, _462, _498);
        float _508 = _486 * 6.283185482025146484375;
        float _510 = cos(_508);
        float _512 = _488 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _488 * 6.283185482025146484375;
        float _518 = cos(_516);
        float _520 = _490 * 6.283185482025146484375;
        float _522 = sin(_520);
        float _524 = fma(_436, _462, _474);
        float _526 = _514 * _510;
        float _528 = _496 * _514;
        float _530 = _490 * 6.283185482025146484375;
        float _532 = cos(_530);
        float _534 = _496 * _518;
        float _536 = _496 * _522;
        float _538 = _510 * _518;
        float _540 = _510 * _532;
        float _542 = _532 * _518;
        float _544 = _514 * _532;
        float _546 = _496 * _532;
        float _548 = fma(_514, _536, _538);
        float _550 = -_534;
        float _552 = fma(_522, _526, _550);
        float _554 = -_526;
        float _556 = fma(_518, _536, _554);
        float _558 = fma(_522, _538, _528);
        float _560 = -_522;
        float _562 = _560 + (-0.0);
        _564 = _524;
        _566 = _548;
        _568 = _502;
        _570 = _558;
        _572 = _552;
        _574 = _540;
        _576 = _500;
        _578 = _542;
        _580 = _544;
        _582 = _562;
        _584 = _556;
        _586 = _546;
        _588 = _506;
        _442 = _504;
        _590 = _484;
        _592 = true;
    }
    else
    {
        float _594 = _420 * 2.0;
        float _596 = _422 * _438;
        float _598 = _424 * _438;
        float _600 = _420 * _438;
        float _602 = -_596;
        float _604 = fma(_594, _424, _602);
        float _606 = fma(_594, _424, _596);
        float _608 = fma(_594, _422, _598);
        float _610 = -_598;
        float _612 = fma(_594, _422, _610);
        float _614 = _424 * _424;
        float _616 = _420 * _420;
        float _618 = _424 * 2.0;
        float _620 = _422 * _422;
        float _622 = fma(_614, -2.0, 1.0);
        float _624 = fma(_616, -2.0, 1.0);
        float _626 = -_600;
        float _628 = fma(_618, _422, _626);
        float _630 = fma(_618, _422, _600);
        float _632 = fma(_620, -2.0, _622);
        float _634 = fma(_620, -2.0, _624);
        float _636 = fma(_614, -2.0, _624);
        _564 = _436;
        _566 = _634;
        _568 = _430;
        _570 = _608;
        _572 = _628;
        _574 = _636;
        _576 = _428;
        _578 = _632;
        _580 = _606;
        _582 = _612;
        _584 = _604;
        _586 = _630;
        _588 = _434;
        _590 = _426;
    }
    _592 = false;
    float _638 = _564;
    float _640 = _566;
    float _642 = _568;
    float _644 = _570;
    float _646 = _572;
    float _648 = _574;
    float _650 = _576;
    float _652 = _578;
    float _654 = _580;
    float _656 = _582;
    float _658 = _584;
    float _660 = _586;
    float _662 = _588;
    float _664 = _442;
    float _666 = _590;
    bool _668 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _670 = _638 * _640;
    float _672 = _642 * _644;
    float _674 = _642 * _646;
    float _676 = _642 * _648;
    float _678 = _650 * _652;
    float _680 = _650 * _654;
    float _682 = _650 * _656;
    float _684 = _638 * _658;
    float _686 = _638 * _660;
    int _688 = _66 * 112;
    bool _690 = !_668;
    float _1008;
    float _1010;
    float _1012;
    float _1014;
    float _1016;
    float _1018;
    float _1020;
    float _1022;
    float _1024;
    float _1026;
    float _1028;
    float _1030;
    if (!_690)
    {
        int _692 = 0;
        float _694 = _678;
        float _696 = _684;
        float _698 = _672;
        float _700 = _666;
        float _702 = _680;
        float _704 = _670;
        float _706 = _674;
        float _708 = _664;
        float _710 = _682;
        float _712 = _686;
        float _714 = _676;
        float _716 = _662;
        bool _718;
        int _766;
        int _776;
        int _786;
        int _796;
        int _806;
        int _816;
        int _826;
        int _836;
        int _846;
        int _856;
        int _866;
        int _876;
        int _984;
        int _988;
        int _990;
        int _994;
        float _996;
        int _998;
        float _1002;
        int _1004;
        int _1006;
        do
        {
            int _720 = _692;
            int _722 = as_type<int>(_694);
            int _724 = as_type<int>(_696);
            int _726 = as_type<int>(_698);
            int _728 = as_type<int>(_700);
            int _730 = as_type<int>(_702);
            int _732 = as_type<int>(_704);
            float _734 = _706;
            int _736 = as_type<int>(_708);
            int _738 = as_type<int>(_710);
            float _740 = _712;
            int _742 = as_type<int>(_714);
            int _744 = as_type<int>(_716);
            uint _746 = uint(int(uint(_688) >> uint(2)));
            uint _748 = uint(int(uint(int(_746)) >> uint(2)));
            int _750 = int(_746) & 3;
            float _752 = (*spvDescriptorSet0.cp_c6)._m0[int(_748)][_750];
            bool _754 = _66 != 0;
            int _756 = _720 + 1;
            bool _758 = uint(_756) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _760 = _722;
            int _762 = as_type<int>(_752);
            int _764 = 31;
            int _2319 = _56(_760, _762, _764, _766, gl_SubgroupInvocationID);
            int _768 = _2319;
            int _770 = _724;
            int _772 = as_type<int>(_752);
            int _774 = 31;
            int _2323 = _56(_770, _772, _774, _776, gl_SubgroupInvocationID);
            int _778 = _2323;
            int _780 = _726;
            int _782 = as_type<int>(_752);
            int _784 = 31;
            int _2327 = _56(_780, _782, _784, _786, gl_SubgroupInvocationID);
            int _788 = _2327;
            int _790 = _728;
            int _792 = as_type<int>(_752);
            int _794 = 31;
            int _2331 = _56(_790, _792, _794, _796, gl_SubgroupInvocationID);
            int _798 = _2331;
            int _800 = _730;
            int _802 = as_type<int>(_752);
            int _804 = 31;
            int _2335 = _56(_800, _802, _804, _806, gl_SubgroupInvocationID);
            int _808 = _2335;
            int _810 = _732;
            int _812 = as_type<int>(_752);
            int _814 = 31;
            int _2339 = _56(_810, _812, _814, _816, gl_SubgroupInvocationID);
            int _818 = _2339;
            int _820 = as_type<int>(_734);
            int _822 = as_type<int>(_752);
            int _824 = 31;
            int _2344 = _56(_820, _822, _824, _826, gl_SubgroupInvocationID);
            int _828 = _2344;
            int _830 = _736;
            int _832 = as_type<int>(_752);
            int _834 = 31;
            int _2348 = _56(_830, _832, _834, _836, gl_SubgroupInvocationID);
            int _838 = _2348;
            int _840 = _738;
            int _842 = as_type<int>(_752);
            int _844 = 31;
            int _2352 = _56(_840, _842, _844, _846, gl_SubgroupInvocationID);
            int _848 = _2352;
            int _850 = as_type<int>(_740);
            int _852 = as_type<int>(_752);
            int _854 = 31;
            int _2357 = _56(_850, _852, _854, _856, gl_SubgroupInvocationID);
            int _858 = _2357;
            int _860 = _742;
            int _862 = as_type<int>(_752);
            int _864 = 31;
            int _2361 = _56(_860, _862, _864, _866, gl_SubgroupInvocationID);
            int _868 = _2361;
            int _870 = _744;
            int _872 = as_type<int>(_752);
            int _874 = 31;
            int _2365 = _56(_870, _872, _874, _876, gl_SubgroupInvocationID);
            int _878 = _2365;
            bool _880 = !_754;
            _692 = _756;
            int _882 = _722;
            int _884 = _724;
            int _886 = _726;
            int _888 = _728;
            int _890 = _730;
            int _892 = _732;
            float _894 = _734;
            int _896 = _736;
            int _898 = _738;
            float _900 = _740;
            int _902 = _742;
            int _904 = _744;
            if (!_880)
            {
                float _906 = _680 * as_type<float>(_778);
                float _908 = _670 * as_type<float>(_778);
                float _910 = _674 * as_type<float>(_818);
                float _912 = _674 * as_type<float>(_778);
                float _914 = fma(_678, as_type<float>(_768), _906);
                float _916 = fma(_684, as_type<float>(_768), _908);
                float _918 = _680 * as_type<float>(_818);
                float _920 = _670 * as_type<float>(_818);
                float _922 = as_type<float>(_778) * _664;
                float _924 = as_type<float>(_818) * _664;
                float _926 = fma(_678, as_type<float>(_808), _918);
                float _928 = fma(_684, as_type<float>(_808), _920);
                float _930 = fma(_672, as_type<float>(_808), _910);
                float _932 = _680 * as_type<float>(_858);
                float _934 = _670 * as_type<float>(_858);
                float _936 = _674 * as_type<float>(_858);
                float _938 = as_type<float>(_858) * _664;
                float _940 = fma(_672, as_type<float>(_768), _912);
                float _942 = fma(as_type<float>(_768), _666, _922);
                float _944 = fma(as_type<float>(_808), _666, _924);
                float _946 = fma(_678, as_type<float>(_848), _932);
                float _948 = fma(_684, as_type<float>(_848), _934);
                float _950 = fma(_672, as_type<float>(_848), _936);
                float _952 = fma(as_type<float>(_848), _666, _938);
                float _954 = fma(_676, as_type<float>(_788), _940);
                float _956 = fma(_682, as_type<float>(_788), _914);
                float _958 = fma(_686, as_type<float>(_788), _916);
                float _960 = fma(_682, as_type<float>(_828), _926);
                float _962 = fma(_686, as_type<float>(_828), _928);
                float _964 = fma(_676, as_type<float>(_828), _930);
                float _966 = fma(as_type<float>(_788), _662, _942);
                float _968 = fma(as_type<float>(_828), _662, _944);
                float _970 = fma(as_type<float>(_868), _662, _952);
                float _972 = fma(_682, as_type<float>(_868), _946);
                float _974 = fma(_686, as_type<float>(_868), _948);
                float _976 = fma(_676, as_type<float>(_868), _950);
                float _978 = as_type<float>(_798) + _966;
                float _980 = as_type<float>(_838) + _968;
                float _982 = as_type<float>(_878) + _970;
                _882 = as_type<int>(_956);
                _884 = as_type<int>(_958);
                _886 = as_type<int>(_954);
                _888 = as_type<int>(_978);
                _890 = as_type<int>(_960);
                _892 = as_type<int>(_962);
                _894 = _964;
                _896 = as_type<int>(_980);
                _898 = as_type<int>(_972);
                _900 = _974;
                _902 = as_type<int>(_976);
                _904 = as_type<int>(_982);
            }
            _984 = _882;
            int _986 = _884;
            _988 = _886;
            _990 = _888;
            int _992 = _890;
            _994 = _892;
            _996 = _894;
            _998 = _896;
            int _1000 = _898;
            _1002 = _900;
            _1004 = _902;
            _1006 = _904;
            _718 = !_758;
            _694 = as_type<float>(_984);
            _696 = as_type<float>(_986);
            _698 = as_type<float>(_988);
            _700 = as_type<float>(_990);
            _702 = as_type<float>(_992);
            _704 = as_type<float>(_994);
            _706 = _996;
            _708 = as_type<float>(_998);
            _710 = as_type<float>(_1000);
            _712 = _1002;
            _714 = as_type<float>(_1004);
            _716 = as_type<float>(_1006);
            _1008 = as_type<float>(_986);
            _1010 = as_type<float>(_992);
            _1012 = as_type<float>(_1000);
        } while (_718);
        _1014 = as_type<float>(_994);
        _1016 = _1002;
        _1018 = as_type<float>(_984);
        _1020 = _996;
        _1022 = as_type<float>(_998);
        _1024 = as_type<float>(_988);
        _1026 = as_type<float>(_1004);
        _1028 = as_type<float>(_990);
        _1030 = as_type<float>(_1006);
        _1032 = true;
    }
    else
    {
        _1008 = _684;
        _1014 = _670;
        _1016 = _686;
        _1018 = _678;
        _1010 = _680;
        _1012 = _682;
        _1020 = _674;
        _1022 = _664;
        _1024 = _672;
        _1026 = _676;
        _1028 = _666;
        _1030 = _662;
    }
    _1032 = false;
    float _1034 = _1008;
    float _1036 = _1014;
    float _1038 = _1016;
    float _1040 = _1018;
    float _1042 = _1010;
    float _1044 = _1012;
    float _1046 = _1020;
    float _1048 = _1022;
    float _1050 = _1024;
    float _1052 = _1026;
    float _1054 = _1028;
    float _1056 = _1030;
    int _1058 = _688 + 80;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.cp_c6)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.cp_c6)._m0[int(_1070)][_1072];
    int _1076 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1078 = _1076 + _66;
    int _1080 = _688 + 64;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    uint _1084 = uint(int(uint(int(_1082)) >> uint(2)));
    int _1086 = int(_1082) & 3;
    float _1088 = (*spvDescriptorSet0.cp_c6)._m0[int(_1084)][_1086];
    int _1090 = int(_1082) + 1;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    int _1094 = _1090 & 3;
    float _1096 = (*spvDescriptorSet0.cp_c6)._m0[int(_1092)][_1094];
    int _1098 = _1078 * 48;
    int _1100 = _688 + 88;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.cp_c6)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.cp_c6)._m0[int(_1112)][_1114];
    int _1118 = _688 + 72;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.cp_c6)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.cp_c6)._m0[int(_1130)][_1132];
    int _1136 = _688 + 104;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.cp_c6)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.cp_c6)._m0[int(_1148)][_1150];
    int _1154 = _688 + 96;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
    int _1160 = int(_1156) & 3;
    float _1162 = (*spvDescriptorSet0.cp_c6)._m0[int(_1158)][_1160];
    int _1164 = int(_1156) + 1;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    int _1168 = _1164 & 3;
    float _1170 = (*spvDescriptorSet0.cp_c6)._m0[int(_1166)][_1168];
    float _1172 = _1034 * _1066;
    float _1174 = _1036 * _1066;
    float _1176 = _1038 * _1066;
    int _1178 = _688 + 16;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.cp_c6)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.cp_c6)._m0[int(_1190)][_1192];
    float _1196 = _1038 * _1074;
    float _1198 = fma(_1040, _1088, _1172);
    float _1200 = fma(_1042, _1088, _1174);
    float _1202 = fma(_1044, _1088, _1176);
    float _1204 = _1034 * _1074;
    int _1206 = _688 + 32;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    uint _1210 = uint(int(uint(int(_1208)) >> uint(2)));
    int _1212 = int(_1208) & 3;
    float _1214 = (*spvDescriptorSet0.cp_c6)._m0[int(_1210)][_1212];
    int _1216 = int(_1208) + 1;
    uint _1218 = uint(int(uint(_1216) >> uint(2)));
    int _1220 = _1216 & 3;
    float _1222 = (*spvDescriptorSet0.cp_c6)._m0[int(_1218)][_1220];
    float _1224 = _1036 * _1074;
    float _1226 = fma(_1044, _1096, _1196);
    float _1228 = fma(_1040, _1096, _1204);
    float _1230 = _1034 * _1108;
    float _1232 = _1034 * _1116;
    float _1234 = _1036 * _1108;
    float _1236 = _1036 * _1116;
    int _1238 = _688 + 48;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    uint _1242 = uint(int(uint(int(_1240)) >> uint(2)));
    int _1244 = int(_1240) & 3;
    float _1246 = (*spvDescriptorSet0.cp_c6)._m0[int(_1242)][_1244];
    int _1248 = int(_1240) + 1;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    int _1252 = _1248 & 3;
    float _1254 = (*spvDescriptorSet0.cp_c6)._m0[int(_1250)][_1252];
    float _1256 = _1038 * _1108;
    float _1258 = _1038 * _1116;
    float _1260 = fma(_1042, _1096, _1224);
    float _1262 = fma(_1040, _1126, _1230);
    float _1264 = fma(_1040, _1134, _1232);
    float _1266 = fma(_1042, _1126, _1234);
    float _1268 = fma(_1042, _1134, _1236);
    int _1270 = _688 + 24;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    float _1288 = fma(_1044, _1126, _1256);
    float _1290 = fma(_1044, _1134, _1258);
    float _1292 = fma(_1046, _1152, _1268);
    int _1294 = _688 + 40;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.cp_c6)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.cp_c6)._m0[int(_1306)][_1308];
    float _1312 = _1292 + _1048;
    float _1314 = fma(_1050, _1162, _1198);
    float _1316 = fma(_1046, _1162, _1200);
    float _1318 = fma(_1052, _1162, _1202);
    float _1320 = fma(_1050, _1170, _1228);
    int _1322 = _688 + 56;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.cp_c6)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    float _1340 = fma(_1050, _1144, _1262);
    float _1342 = fma(_1050, _1152, _1264);
    float _1344 = fma(_1052, _1152, _1290);
    float _1346 = fma(_1046, _1170, _1260);
    float _1348 = fma(_1046, _1144, _1266);
    float _1350 = fma(_1052, _1144, _1288);
    float _1352 = _1342 + _1054;
    float _1354 = _1344 + _1056;
    float _1356 = _1312 * _1194;
    float _1358 = _1316 * _1194;
    float _1360 = _1346 * _1194;
    float _1362 = _1348 * _1194;
    float _1364 = fma(_1352, _1186, _1356);
    float _1366 = fma(_1314, _1186, _1358);
    float _1368 = fma(_1320, _1186, _1360);
    float _1370 = _1312 * _1222;
    float _1372 = fma(_1340, _1186, _1362);
    float _1374 = _1316 * _1222;
    float _1376 = fma(_1052, _1170, _1226);
    float _1378 = _1346 * _1222;
    float _1380 = _1348 * _1222;
    float _1382 = fma(_1352, _1214, _1370);
    float _1384 = fma(_1314, _1214, _1374);
    float _1386 = _1312 * _1254;
    float _1388 = _1316 * _1254;
    float _1390 = _1346 * _1254;
    float _1392 = _1348 * _1254;
    float _1394 = fma(_1352, _1246, _1386);
    float _1396 = fma(_1320, _1214, _1378);
    float _1398 = fma(_1340, _1214, _1380);
    float _1400 = fma(_1314, _1246, _1388);
    float _1402 = fma(_1354, _1278, _1364);
    float _1404 = fma(_1320, _1246, _1390);
    float _1406 = fma(_1340, _1246, _1392);
    float _1408 = fma(_1318, _1278, _1366);
    float _1410 = _1402 + _1286;
    float _1412 = fma(_1376, _1278, _1368);
    float _1414 = fma(_1350, _1278, _1372);
    float _1416 = fma(_1354, _1302, _1382);
    float _1418 = fma(_1318, _1302, _1384);
    float _1420 = fma(_1376, _1302, _1396);
    int _1422 = _1098 + 16;
    float _1424 = fma(_1350, _1302, _1398);
    float _1426 = _1416 + _1310;
    int _1428 = _1098 + 32;
    float _1430 = fma(_1354, _1330, _1394);
    float _1432 = fma(_1318, _1330, _1400);
    float _1434 = fma(_1376, _1330, _1404);
    float _1436 = fma(_1350, _1330, _1406);
    float _1438 = _1430 + _1338;
    int _1440 = _1098 + 48;
    uint _1442 = uint(int(uint(_1422) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1442)] = as_type<uint>(_1408);
    int _1444 = _1422 + 4;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1446)] = as_type<uint>(_1412);
    int _1448 = _1422 + 8;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1450)] = as_type<uint>(_1414);
    int _1452 = _1422 + 12;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1454)] = as_type<uint>(_1410);
    uint _1456 = uint(int(uint(_1428) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1456)] = as_type<uint>(_1418);
    int _1458 = _1428 + 4;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1460)] = as_type<uint>(_1420);
    int _1462 = _1428 + 8;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1464)] = as_type<uint>(_1424);
    int _1466 = _1428 + 12;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1468)] = as_type<uint>(_1426);
    uint _1470 = uint(int(uint(_1440) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1470)] = as_type<uint>(_1432);
    int _1472 = _1440 + 4;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1474)] = as_type<uint>(_1434);
    int _1476 = _1440 + 8;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1478)] = as_type<uint>(_1436);
    int _1480 = _1440 + 12;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1482)] = as_type<uint>(_1438);
}

