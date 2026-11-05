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
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2855, thread const int& _2856, constant _10& support_buffer)
{
    int _2859 = 1 + _2856;
    float _2861 = support_buffer._m5[_2859].x;
    bool _2863 = _2861 == 1.0;
    if (_2863)
    {
        return _2855;
    }
    float _2865 = float(_2855);
    float _2867 = _2865 * _2861;
    int _2869 = int(_2867);
    return _2869;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2890, thread const int& _2891, thread const int& _2892, thread int& _2893, thread uint& gl_SubgroupInvocationID)
{
    int _2896 = _2892 & 31;
    uint _2898 = uint(int(uint(_2892) >> uint(8)));
    int _2900 = int(_2898) & 31;
    float _2902 = as_type<float>(gl_SubgroupInvocationID);
    int _2904 = as_type<int>(_2902) & _2900;
    int _2906 = ~_2900;
    int _2908 = _2896 & _2906;
    int _2910 = _2908 | _2904;
    int _2912 = ~_2900;
    int _2914 = _2891 & _2912;
    int _2916 = _2914 | _2904;
    bool _2918 = uint(_2916) <= uint(_2910);
    _2893 = _2918 ? (-1) : 0;
    float _2920 = spvSubgroupShuffle(as_type<float>(_2890), uint(_2916));
    uint _2922 = uint(_2918 ? as_type<int>(_2920) : _2890);
    return int(_2922);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _680 = false;
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
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = as_type<int>(_97) & as_type<int>(_109);
    bool _113 = _111 != 0;
    float _115 = 0.0;
    float _117 = 0.0;
    float _119 = _97;
    float _121 = _109;
    if (!_113)
    {
        _115 = 0.0;
        _117 = 0.0;
    }
    float _123 = _115;
    float _125 = _117;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _123;
    float _133 = _125;
    if (!_113)
    {
        _127 = 0.0;
        _129 = 0.0;
    }
    float _135 = _127;
    float _137 = _129;
    float _139 = _135;
    float _141 = _137;
    if (!_113)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _143 = _119;
    float _145 = _121;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = _143;
    float _153 = _145;
    if (!_113)
    {
        _147 = 0.0;
        _149 = 0.0;
    }
    float _155 = _147;
    float _157 = _149;
    float _159 = 0.0;
    float _161 = 0.0;
    float _163 = _155;
    float _165 = _157;
    if (!_113)
    {
        _159 = 0.0;
        _161 = 0.0;
    }
    float _167 = _159;
    float _169 = _161;
    bool _171 = !_113;
    float _173 = _167;
    float _175 = _169;
    if (!_171)
    {
        uint _177 = uint(int(uint(_99) >> uint(2)));
        uint _179 = uint(int(uint(int(_177)) >> uint(2)));
        int _181 = int(_177) & 3;
        float _183 = (*spvDescriptorSet0.cp_c5)._m0[int(_179)][_181];
        int _185 = _66;
        int _187 = 0;
        int _189 = _54(_185, _187, (*spvDescriptorSet0.support_buffer));
        int _191 = as_type<int>(_183);
        int _193 = 0;
        int _195 = _54(_191, _193, (*spvDescriptorSet0.support_buffer));
        int3 _1351 = int3(_189, _195, 1);
        float4 _198 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1351.xy), uint(_1351.z), 0).xyzw;
        float _200 = _198.x;
        float _202 = _198.y;
        float _204 = _198.z;
        float _206 = _198.w;
        int _208 = _66;
        int _210 = 0;
        int _212 = _54(_208, _210, (*spvDescriptorSet0.support_buffer));
        int _214 = as_type<int>(_183);
        int _216 = 0;
        int _218 = _54(_214, _216, (*spvDescriptorSet0.support_buffer));
        int3 _1371 = int3(_212, _218, 0);
        float3 _222 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1371.xy), uint(_1371.z), 0).xyz;
        float _224 = _222.x;
        float _226 = _222.y;
        float _228 = _222.z;
        int _230 = _66;
        int _232 = 0;
        int _234 = _54(_230, _232, (*spvDescriptorSet0.support_buffer));
        int _236 = as_type<int>(_183);
        int _238 = 0;
        int _240 = _54(_236, _238, (*spvDescriptorSet0.support_buffer));
        int3 _1389 = int3(_234, _240, 2);
        float3 _242 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1389.xy), uint(_1389.z), 0).xyz;
        float _244 = _242.x;
        float _246 = _242.y;
        float _248 = _242.z;
        float _250 = _206 * 2.0;
        _173 = _200;
        _139 = _204;
        _141 = _250;
        _175 = _202;
        _151 = _224;
        _153 = _226;
        _131 = _228;
        _133 = _248;
        _163 = _246;
        _165 = _244;
    }
    float _252 = _173;
    float _254 = _139;
    float _256 = _141;
    float _258 = _175;
    float _260 = _151;
    float _262 = _153;
    float _264 = _131;
    float _266 = _133;
    float _268 = _163;
    float _270 = _165;
    float _272 = _252 * 2.0;
    float _274 = _254 * _256;
    bool _276 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _278 = _252 * _252;
    float _280 = _252 * _256;
    float _282 = _258 * _256;
    float _284 = _258 * _258;
    float _286 = -_274;
    float _288 = fma(_272, _258, _286);
    float _290 = fma(_272, _258, _274);
    float _292 = _258 * 2.0;
    float _294 = _254 * _254;
    float _296 = fma(_278, -2.0, 1.0);
    float _298 = fma(_284, -2.0, 1.0);
    float _300 = fma(_272, _254, _282);
    float _302 = -_282;
    float _304 = fma(_272, _254, _302);
    float _306 = -_280;
    float _308 = fma(_292, _254, _306);
    float _310 = fma(_292, _254, _280);
    float _312 = fma(_294, -2.0, _296);
    float _314 = fma(_294, -2.0, _298);
    float _316 = fma(_284, -2.0, _296);
    float _318 = _304 * _260;
    float _320 = _310 * _262;
    float _322 = _290 * _260;
    float _324 = _312 * _262;
    float _326 = _300 * _264;
    float _328 = _308 * _264;
    float _330 = _314 * _260;
    float _332 = _288 * _262;
    float _334 = _316 * _264;
    int _336 = _66 * 112;
    bool _338 = !_276;
    float _340 = _330;
    float _342 = _322;
    float _344 = _324;
    float _346 = _268;
    float _348 = _318;
    float _350 = _320;
    float _352 = _334;
    float _354 = _266;
    float _672;
    float _674;
    float _676;
    float _678;
    if (!_338)
    {
        int _356 = 0;
        float _358 = _330;
        float _360 = _332;
        float _362 = _326;
        float _364 = _270;
        float _366 = _322;
        float _368 = _324;
        float _370 = _328;
        float _372 = _268;
        float _374 = _318;
        float _376 = _320;
        float _378 = _334;
        float _380 = _266;
        bool _382;
        int _430;
        int _440;
        int _450;
        int _460;
        int _470;
        int _480;
        int _490;
        int _500;
        int _510;
        int _520;
        int _530;
        int _540;
        float _648;
        float _650;
        float _652;
        int _654;
        float _656;
        int _658;
        int _660;
        int _662;
        int _664;
        float _666;
        float _668;
        float _670;
        do
        {
            int _384 = _356;
            float _386 = _358;
            float _388 = _360;
            float _390 = _362;
            int _392 = as_type<int>(_364);
            float _394 = _366;
            int _396 = as_type<int>(_368);
            int _398 = as_type<int>(_370);
            int _400 = as_type<int>(_372);
            int _402 = as_type<int>(_374);
            float _404 = _376;
            float _406 = _378;
            float _408 = _380;
            uint _410 = uint(int(uint(_336) >> uint(2)));
            uint _412 = uint(int(uint(int(_410)) >> uint(2)));
            int _414 = int(_410) & 3;
            float _416 = (*spvDescriptorSet0.cp_c6)._m0[int(_412)][_414];
            bool _418 = _66 != 0;
            int _420 = _384 + 1;
            bool _422 = uint(_420) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _424 = as_type<int>(_386);
            int _426 = as_type<int>(_416);
            int _428 = 31;
            int _1599 = _56(_424, _426, _428, _430, gl_SubgroupInvocationID);
            int _432 = _1599;
            int _434 = as_type<int>(_388);
            int _436 = as_type<int>(_416);
            int _438 = 31;
            int _1604 = _56(_434, _436, _438, _440, gl_SubgroupInvocationID);
            int _442 = _1604;
            int _444 = as_type<int>(_390);
            int _446 = as_type<int>(_416);
            int _448 = 31;
            int _1609 = _56(_444, _446, _448, _450, gl_SubgroupInvocationID);
            int _452 = _1609;
            int _454 = _392;
            int _456 = as_type<int>(_416);
            int _458 = 31;
            int _1613 = _56(_454, _456, _458, _460, gl_SubgroupInvocationID);
            int _462 = _1613;
            int _464 = as_type<int>(_394);
            int _466 = as_type<int>(_416);
            int _468 = 31;
            int _1618 = _56(_464, _466, _468, _470, gl_SubgroupInvocationID);
            int _472 = _1618;
            int _474 = _396;
            int _476 = as_type<int>(_416);
            int _478 = 31;
            int _1622 = _56(_474, _476, _478, _480, gl_SubgroupInvocationID);
            int _482 = _1622;
            int _484 = _398;
            int _486 = as_type<int>(_416);
            int _488 = 31;
            int _1626 = _56(_484, _486, _488, _490, gl_SubgroupInvocationID);
            int _492 = _1626;
            int _494 = _400;
            int _496 = as_type<int>(_416);
            int _498 = 31;
            int _1630 = _56(_494, _496, _498, _500, gl_SubgroupInvocationID);
            int _502 = _1630;
            int _504 = _402;
            int _506 = as_type<int>(_416);
            int _508 = 31;
            int _1634 = _56(_504, _506, _508, _510, gl_SubgroupInvocationID);
            int _512 = _1634;
            int _514 = as_type<int>(_404);
            int _516 = as_type<int>(_416);
            int _518 = 31;
            int _1639 = _56(_514, _516, _518, _520, gl_SubgroupInvocationID);
            int _522 = _1639;
            int _524 = as_type<int>(_406);
            int _526 = as_type<int>(_416);
            int _528 = 31;
            int _1644 = _56(_524, _526, _528, _530, gl_SubgroupInvocationID);
            int _532 = _1644;
            int _534 = as_type<int>(_408);
            int _536 = as_type<int>(_416);
            int _538 = 31;
            int _1649 = _56(_534, _536, _538, _540, gl_SubgroupInvocationID);
            int _542 = _1649;
            bool _544 = !_418;
            _356 = _420;
            float _546 = _386;
            float _548 = _388;
            float _550 = _390;
            int _552 = _392;
            float _554 = _394;
            int _556 = _396;
            int _558 = _398;
            int _560 = _400;
            int _562 = _402;
            float _564 = _404;
            float _566 = _406;
            float _568 = _408;
            if (!_544)
            {
                float _570 = _324 * as_type<float>(_442);
                float _572 = as_type<float>(_442) * _268;
                float _574 = _328 * as_type<float>(_442);
                float _576 = _324 * as_type<float>(_482);
                float _578 = fma(_332, as_type<float>(_432), _570);
                float _580 = fma(as_type<float>(_432), _270, _572);
                float _582 = _322 * as_type<float>(_482);
                float _584 = _322 * as_type<float>(_442);
                float _586 = _328 * as_type<float>(_482);
                float _588 = fma(_326, as_type<float>(_432), _574);
                float _590 = fma(_330, as_type<float>(_472), _582);
                float _592 = as_type<float>(_482) * _268;
                float _594 = fma(_332, as_type<float>(_472), _576);
                float _596 = _322 * as_type<float>(_522);
                float _598 = as_type<float>(_522) * _268;
                float _600 = fma(_330, as_type<float>(_432), _584);
                float _602 = fma(_326, as_type<float>(_472), _586);
                float _604 = _324 * as_type<float>(_522);
                float _606 = _328 * as_type<float>(_522);
                float _608 = fma(as_type<float>(_472), _270, _592);
                float _610 = fma(_330, as_type<float>(_512), _596);
                float _612 = fma(as_type<float>(_512), _270, _598);
                float _614 = fma(_332, as_type<float>(_512), _604);
                float _616 = fma(_318, as_type<float>(_452), _600);
                float _618 = fma(_320, as_type<float>(_452), _578);
                float _620 = fma(_334, as_type<float>(_452), _588);
                float _622 = fma(_326, as_type<float>(_512), _606);
                float _624 = fma(as_type<float>(_452), _266, _580);
                float _626 = fma(_318, as_type<float>(_492), _590);
                float _628 = fma(_320, as_type<float>(_492), _594);
                float _630 = fma(_334, as_type<float>(_492), _602);
                float _632 = fma(as_type<float>(_492), _266, _608);
                float _634 = fma(as_type<float>(_532), _266, _612);
                float _636 = fma(_320, as_type<float>(_532), _614);
                float _638 = fma(_318, as_type<float>(_532), _610);
                float _640 = fma(_334, as_type<float>(_532), _622);
                float _642 = as_type<float>(_462) + _624;
                float _644 = as_type<float>(_502) + _632;
                float _646 = as_type<float>(_542) + _634;
                _546 = _616;
                _548 = _618;
                _550 = _620;
                _552 = as_type<int>(_642);
                _554 = _626;
                _556 = as_type<int>(_628);
                _558 = as_type<int>(_630);
                _560 = as_type<int>(_644);
                _562 = as_type<int>(_638);
                _564 = _636;
                _566 = _640;
                _568 = _646;
            }
            _648 = _546;
            _650 = _548;
            _652 = _550;
            _654 = _552;
            _656 = _554;
            _658 = _556;
            _660 = _558;
            _662 = _560;
            _664 = _562;
            _666 = _564;
            _668 = _566;
            _670 = _568;
            _382 = !_422;
            _358 = _648;
            _360 = _650;
            _362 = _652;
            _364 = as_type<float>(_654);
            _366 = _656;
            _368 = as_type<float>(_658);
            _370 = as_type<float>(_660);
            _372 = as_type<float>(_662);
            _374 = as_type<float>(_664);
            _376 = _666;
            _378 = _668;
            _380 = _670;
        } while (_382);
        _340 = _648;
        _672 = _650;
        _674 = _652;
        _676 = as_type<float>(_654);
        _342 = _656;
        _344 = as_type<float>(_658);
        _678 = as_type<float>(_660);
        _346 = as_type<float>(_662);
        _348 = as_type<float>(_664);
        _350 = _666;
        _352 = _668;
        _354 = _670;
        _680 = true;
    }
    else
    {
        _672 = _332;
        _674 = _326;
        _676 = _270;
        _678 = _328;
    }
    _680 = false;
    float _682 = _340;
    float _684 = _672;
    float _686 = _674;
    float _688 = _676;
    float _690 = _342;
    float _692 = _344;
    float _694 = _678;
    float _696 = _346;
    float _698 = _348;
    float _700 = _350;
    float _702 = _352;
    float _704 = _354;
    int _706 = _336 + 80;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    uint _710 = uint(int(uint(int(_708)) >> uint(2)));
    int _712 = int(_708) & 3;
    float _714 = (*spvDescriptorSet0.cp_c6)._m0[int(_710)][_712];
    int _716 = int(_708) + 1;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    int _720 = _716 & 3;
    float _722 = (*spvDescriptorSet0.cp_c6)._m0[int(_718)][_720];
    bool _724 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _726 = _336 + 64;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    uint _730 = uint(int(uint(int(_728)) >> uint(2)));
    int _732 = int(_728) & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    int _736 = int(_728) + 1;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    int _740 = _736 & 3;
    float _742 = (*spvDescriptorSet0.cp_c6)._m0[int(_738)][_740];
    int _744 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _746 = _744 + _66;
    int _748 = _336 + 88;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.cp_c6)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.cp_c6)._m0[int(_760)][_762];
    int _766 = _336 + 72;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    uint _770 = uint(int(uint(int(_768)) >> uint(2)));
    int _772 = int(_768) & 3;
    float _774 = (*spvDescriptorSet0.cp_c6)._m0[int(_770)][_772];
    int _776 = int(_768) + 1;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    int _780 = _776 & 3;
    float _782 = (*spvDescriptorSet0.cp_c6)._m0[int(_778)][_780];
    int _784 = _336 + 96;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.cp_c6)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.cp_c6)._m0[int(_796)][_798];
    int _802 = _336 + 104;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    uint _806 = uint(int(uint(int(_804)) >> uint(2)));
    int _808 = int(_804) & 3;
    float _810 = (*spvDescriptorSet0.cp_c6)._m0[int(_806)][_808];
    int _812 = int(_804) + 1;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    int _816 = _812 & 3;
    float _818 = (*spvDescriptorSet0.cp_c6)._m0[int(_814)][_816];
    int _820 = _336 + 16;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    if (!_724)
    {
        int _838 = _66 * 48;
        int _840 = _838 + 16;
        uint _842 = uint(int(uint(_838) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_842)] = as_type<uint>(_682);
        int _844 = _838 + 4;
        uint _846 = uint(int(uint(_844) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_846)] = as_type<uint>(_684);
        int _848 = _838 + 8;
        uint _850 = uint(int(uint(_848) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_850)] = as_type<uint>(_686);
        int _852 = _838 + 12;
        uint _854 = uint(int(uint(_852) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_854)] = as_type<uint>(_688);
        int _856 = _838 + 32;
        uint _858 = uint(int(uint(_840) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_858)] = as_type<uint>(_690);
        int _860 = _840 + 4;
        uint _862 = uint(int(uint(_860) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_862)] = as_type<uint>(_692);
        int _864 = _840 + 8;
        uint _866 = uint(int(uint(_864) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_866)] = as_type<uint>(_694);
        int _868 = _840 + 12;
        uint _870 = uint(int(uint(_868) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_870)] = as_type<uint>(_696);
        uint _872 = uint(int(uint(_856) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_872)] = as_type<uint>(_698);
        int _874 = _856 + 4;
        uint _876 = uint(int(uint(_874) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_876)] = as_type<uint>(_700);
        int _878 = _856 + 8;
        uint _880 = uint(int(uint(_878) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_880)] = as_type<uint>(_702);
        int _882 = _856 + 12;
        uint _884 = uint(int(uint(_882) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_884)] = as_type<uint>(_704);
    }
    float _886 = _700 * _714;
    float _888 = _684 * _714;
    float _890 = _692 * _714;
    int _892 = _336 + 32;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    uint _896 = uint(int(uint(int(_894)) >> uint(2)));
    int _898 = int(_894) & 3;
    float _900 = (*spvDescriptorSet0.cp_c6)._m0[int(_896)][_898];
    int _902 = int(_894) + 1;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    int _906 = _902 & 3;
    float _908 = (*spvDescriptorSet0.cp_c6)._m0[int(_904)][_906];
    float _910 = fma(_698, _734, _886);
    float _912 = _684 * _722;
    float _914 = fma(_682, _734, _888);
    float _916 = fma(_690, _734, _890);
    float _918 = _692 * _722;
    float _920 = fma(_682, _742, _912);
    float _922 = _684 * _756;
    float _924 = _684 * _764;
    float _926 = _700 * _722;
    int _928 = _336 + 48;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    uint _932 = uint(int(uint(int(_930)) >> uint(2)));
    int _934 = int(_930) & 3;
    float _936 = (*spvDescriptorSet0.cp_c6)._m0[int(_932)][_934];
    int _938 = int(_930) + 1;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    int _942 = _938 & 3;
    float _944 = (*spvDescriptorSet0.cp_c6)._m0[int(_940)][_942];
    float _946 = _692 * _756;
    float _948 = _692 * _764;
    float _950 = fma(_690, _742, _918);
    float _952 = fma(_698, _742, _926);
    float _954 = _700 * _756;
    float _956 = _700 * _764;
    float _958 = fma(_682, _774, _922);
    float _960 = fma(_682, _782, _924);
    float _962 = fma(_690, _774, _946);
    int _964 = _336 + 24;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.cp_c6)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
    float _982 = fma(_690, _782, _948);
    float _984 = fma(_698, _782, _956);
    float _986 = fma(_698, _774, _954);
    float _988 = fma(_686, _792, _914);
    float _990 = fma(_694, _818, _982);
    float _992 = fma(_694, _792, _916);
    float _994 = fma(_702, _792, _910);
    int _996 = _336 + 40;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
    int _1002 = int(_998) & 3;
    float _1004 = (*spvDescriptorSet0.cp_c6)._m0[int(_1000)][_1002];
    int _1006 = int(_998) + 1;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    int _1010 = _1006 & 3;
    float _1012 = (*spvDescriptorSet0.cp_c6)._m0[int(_1008)][_1010];
    float _1014 = fma(_686, _800, _920);
    float _1016 = fma(_686, _810, _958);
    float _1018 = fma(_686, _818, _960);
    float _1020 = fma(_694, _800, _950);
    float _1022 = fma(_694, _810, _962);
    float _1024 = fma(_702, _818, _984);
    float _1026 = _990 + _696;
    int _1028 = _336 + 56;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    uint _1032 = uint(int(uint(int(_1030)) >> uint(2)));
    int _1034 = int(_1030) & 3;
    float _1036 = (*spvDescriptorSet0.cp_c6)._m0[int(_1032)][_1034];
    int _1038 = int(_1030) + 1;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    int _1042 = _1038 & 3;
    float _1044 = (*spvDescriptorSet0.cp_c6)._m0[int(_1040)][_1042];
    float _1046 = fma(_702, _800, _952);
    float _1048 = fma(_702, _810, _986);
    float _1050 = _1024 + _704;
    float _1052 = _1018 + _688;
    float _1054 = _992 * _836;
    float _1056 = _1020 * _836;
    float _1058 = _1022 * _836;
    float _1060 = _1026 * _836;
    float _1062 = fma(_988, _828, _1054);
    float _1064 = fma(_1014, _828, _1056);
    float _1066 = fma(_1016, _828, _1058);
    float _1068 = _1026 * _908;
    float _1070 = fma(_1052, _828, _1060);
    float _1072 = _992 * _908;
    float _1074 = _1020 * _908;
    float _1076 = _1022 * _908;
    float _1078 = fma(_1052, _900, _1068);
    float _1080 = fma(_988, _900, _1072);
    float _1082 = fma(_1014, _900, _1074);
    float _1084 = fma(_1016, _900, _1076);
    int _1086 = _746 * 48;
    float _1088 = _1026 * _944;
    float _1090 = _992 * _944;
    float _1092 = _1020 * _944;
    float _1094 = _1022 * _944;
    float _1096 = fma(_1052, _936, _1088);
    float _1098 = fma(_988, _936, _1090);
    float _1100 = fma(_1014, _936, _1092);
    float _1102 = fma(_1016, _936, _1094);
    float _1104 = fma(_1050, _972, _1070);
    float _1106 = fma(_994, _972, _1062);
    float _1108 = fma(_1046, _972, _1064);
    float _1110 = fma(_1048, _972, _1066);
    float _1112 = _1104 + _980;
    float _1114 = fma(_1050, _1004, _1078);
    float _1116 = fma(_994, _1004, _1080);
    float _1118 = fma(_1046, _1004, _1082);
    float _1120 = fma(_1048, _1004, _1084);
    float _1122 = _1114 + _1012;
    int _1124 = _1086 + 16;
    int _1126 = _1086 + 32;
    float _1128 = fma(_1050, _1036, _1096);
    float _1130 = fma(_994, _1036, _1098);
    float _1132 = fma(_1046, _1036, _1100);
    float _1134 = fma(_1048, _1036, _1102);
    float _1136 = _1128 + _1044;
    int _1138 = _1086 + 48;
    uint _1140 = uint(int(uint(_1124) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1140)] = as_type<uint>(_1106);
    int _1142 = _1124 + 4;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1144)] = as_type<uint>(_1108);
    int _1146 = _1124 + 8;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1148)] = as_type<uint>(_1110);
    int _1150 = _1124 + 12;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1152)] = as_type<uint>(_1112);
    uint _1154 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1154)] = as_type<uint>(_1116);
    int _1156 = _1126 + 4;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1158)] = as_type<uint>(_1118);
    int _1160 = _1126 + 8;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1162)] = as_type<uint>(_1120);
    int _1164 = _1126 + 12;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1166)] = as_type<uint>(_1122);
    uint _1168 = uint(int(uint(_1138) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1168)] = as_type<uint>(_1130);
    int _1170 = _1138 + 4;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1172)] = as_type<uint>(_1132);
    int _1174 = _1138 + 8;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1176)] = as_type<uint>(_1134);
    int _1178 = _1138 + 12;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1180)] = as_type<uint>(_1136);
}

