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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2918, thread const int& _2919, constant _10& support_buffer)
{
    int _2922 = 1 + _2919;
    float _2924 = support_buffer._m5[_2922].x;
    bool _2926 = _2924 == 1.0;
    if (_2926)
    {
        return _2918;
    }
    float _2928 = float(_2918);
    float _2930 = _2928 * _2924;
    int _2932 = int(_2930);
    return _2932;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2953, thread const int& _2954, thread const int& _2955, thread int& _2956, thread uint& gl_SubgroupInvocationID)
{
    int _2959 = _2955 & 31;
    uint _2961 = uint(int(uint(_2955) >> uint(8)));
    int _2963 = int(_2961) & 31;
    float _2965 = as_type<float>(gl_SubgroupInvocationID);
    int _2967 = as_type<int>(_2965) & _2963;
    int _2969 = ~_2963;
    int _2971 = _2959 & _2969;
    int _2973 = _2971 | _2967;
    int _2975 = ~_2963;
    int _2977 = _2954 & _2975;
    int _2979 = _2977 | _2967;
    bool _2981 = uint(_2979) <= uint(_2973);
    _2956 = _2981 ? (-1) : 0;
    float _2983 = spvSubgroupShuffle(as_type<float>(_2953), uint(_2979));
    uint _2985 = uint(_2981 ? as_type<int>(_2983) : _2953);
    return int(_2985);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _698 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = int(_75) + 1;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    int _87 = _83 & 3;
    float _89 = (*spvDescriptorSet0.cp_c5)._m0[int(_85)][_87];
    int _91 = _66;
    int _93 = 0;
    int _95 = _54(_91, _93, (*spvDescriptorSet0.support_buffer));
    int _97 = as_type<int>(_81);
    int _99 = 0;
    int _101 = _54(_97, _99, (*spvDescriptorSet0.support_buffer));
    int3 _1270 = int3(_95, _101, 1);
    float4 _104 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1270.xy), uint(_1270.z), 0).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    int _114 = _66;
    int _116 = 0;
    int _118 = _54(_114, _116, (*spvDescriptorSet0.support_buffer));
    int _120 = as_type<int>(_89);
    int _122 = 0;
    int _124 = _54(_120, _122, (*spvDescriptorSet0.support_buffer));
    int3 _1290 = int3(_118, _124, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1290.xy), uint(_1290.z), 0).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    int _136 = _66;
    int _138 = 0;
    int _140 = _54(_136, _138, (*spvDescriptorSet0.support_buffer));
    int _142 = as_type<int>(_81);
    int _144 = 0;
    int _146 = _54(_142, _144, (*spvDescriptorSet0.support_buffer));
    int3 _1310 = int3(_140, _146, 0);
    float3 _150 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1310.xy), uint(_1310.z), 0).xyz;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    int _158 = _66;
    int _160 = 0;
    int _162 = _54(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = as_type<int>(_89);
    int _166 = 0;
    int _168 = _54(_164, _166, (*spvDescriptorSet0.support_buffer));
    int3 _1328 = int3(_162, _168, 0);
    float3 _170 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1328.xy), uint(_1328.z), 0).xyz;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    int _178 = _66;
    int _180 = 0;
    int _182 = _54(_178, _180, (*spvDescriptorSet0.support_buffer));
    int _184 = as_type<int>(_81);
    int _186 = 0;
    int _188 = _54(_184, _186, (*spvDescriptorSet0.support_buffer));
    int3 _1346 = int3(_182, _188, 2);
    float3 _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1346.xy), uint(_1346.z), 0).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    int _198 = _66;
    int _200 = 0;
    int _202 = _54(_198, _200, (*spvDescriptorSet0.support_buffer));
    int _204 = as_type<int>(_89);
    int _206 = 0;
    int _208 = _54(_204, _206, (*spvDescriptorSet0.support_buffer));
    int3 _1364 = int3(_202, _208, 2);
    float3 _210 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1364.xy), uint(_1364.z), 0).xyz;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    int _218 = _72 + 16;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    uint _222 = uint(int(uint(int(_220)) >> uint(2)));
    int _224 = int(_220) & 3;
    float _226 = (*spvDescriptorSet0.cp_c5)._m0[int(_222)][_224];
    bool _228 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _230 = -_112;
    float _232 = _230 + _134;
    float _234 = -_106;
    float _236 = _234 + _128;
    float _238 = -_108;
    float _240 = _238 + _130;
    float _242 = -_110;
    float _244 = _242 + _132;
    float _246 = fma(_232, _226, _112);
    float _248 = fma(_236, _226, _106);
    float _250 = fma(_240, _226, _108);
    float _252 = fma(_244, _226, _110);
    float _254 = _246 * 2.0;
    float _256 = _248 * 2.0;
    float _258 = _250 * 2.0;
    float _260 = -_156;
    float _262 = _260 + _176;
    float _264 = _250 * _254;
    float _266 = _252 * _254;
    float _268 = _248 * _254;
    float _270 = fma(_262, _226, _156);
    float _272 = fma(_252, _256, _264);
    float _274 = -_266;
    float _276 = fma(_250, _256, _274);
    float _278 = fma(_250, _256, _266);
    float _280 = -_264;
    float _282 = fma(_252, _256, _280);
    float _284 = _248 * _248;
    float _286 = _250 * _250;
    float _288 = -_268;
    float _290 = fma(_252, _258, _288);
    float _292 = fma(_252, _258, _268);
    float _294 = -_152;
    float _296 = _294 + _172;
    float _298 = _252 * _252;
    float _300 = fma(_284, -2.0, 1.0);
    float _302 = fma(_286, -2.0, 1.0);
    float _304 = -_154;
    float _306 = _304 + _174;
    float _308 = fma(_296, _226, _152);
    float _310 = fma(_298, -2.0, _300);
    float _312 = fma(_298, -2.0, _302);
    float _314 = fma(_306, _226, _154);
    float _316 = fma(_286, -2.0, _300);
    float _318 = _308 * _278;
    float _320 = _308 * _312;
    float _322 = _308 * _282;
    float _324 = _314 * _292;
    float _326 = -_192;
    float _328 = _326 + _212;
    float _330 = -_194;
    float _332 = _330 + _214;
    float _334 = -_196;
    float _336 = _334 + _216;
    float _338 = _314 * _310;
    float _340 = fma(_328, _226, _192);
    float _342 = fma(_332, _226, _194);
    float _344 = fma(_336, _226, _196);
    float _346 = _314 * _276;
    float _348 = _270 * _272;
    float _350 = _270 * _290;
    float _352 = _270 * _316;
    int _354 = _66 * 112;
    bool _356 = !_228;
    float _358 = _348;
    float _360 = _340;
    float _362 = _318;
    float _364 = _338;
    float _366 = _322;
    float _368 = _324;
    float _370 = _352;
    float _372 = _344;
    float _690;
    float _692;
    float _694;
    float _696;
    if (!_356)
    {
        int _374 = 0;
        float _376 = _320;
        float _378 = _346;
        float _380 = _348;
        float _382 = _340;
        float _384 = _318;
        float _386 = _338;
        float _388 = _350;
        float _390 = _342;
        float _392 = _322;
        float _394 = _324;
        float _396 = _352;
        float _398 = _344;
        bool _400;
        int _448;
        int _458;
        int _468;
        int _478;
        int _488;
        int _498;
        int _508;
        int _518;
        int _528;
        int _538;
        int _548;
        int _558;
        float _666;
        float _668;
        float _670;
        int _672;
        float _674;
        int _676;
        int _678;
        int _680;
        int _682;
        float _684;
        float _686;
        float _688;
        do
        {
            int _402 = _374;
            float _404 = _376;
            float _406 = _378;
            float _408 = _380;
            int _410 = as_type<int>(_382);
            float _412 = _384;
            int _414 = as_type<int>(_386);
            int _416 = as_type<int>(_388);
            int _418 = as_type<int>(_390);
            int _420 = as_type<int>(_392);
            float _422 = _394;
            float _424 = _396;
            float _426 = _398;
            uint _428 = uint(int(uint(_354) >> uint(2)));
            uint _430 = uint(int(uint(int(_428)) >> uint(2)));
            int _432 = int(_428) & 3;
            float _434 = (*spvDescriptorSet0.cp_c6)._m0[int(_430)][_432];
            bool _436 = _66 != 0;
            int _438 = _402 + 1;
            bool _440 = uint(_438) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _442 = as_type<int>(_404);
            int _444 = as_type<int>(_434);
            int _446 = 31;
            int _1662 = _56(_442, _444, _446, _448, gl_SubgroupInvocationID);
            int _450 = _1662;
            int _452 = as_type<int>(_406);
            int _454 = as_type<int>(_434);
            int _456 = 31;
            int _1667 = _56(_452, _454, _456, _458, gl_SubgroupInvocationID);
            int _460 = _1667;
            int _462 = as_type<int>(_408);
            int _464 = as_type<int>(_434);
            int _466 = 31;
            int _1672 = _56(_462, _464, _466, _468, gl_SubgroupInvocationID);
            int _470 = _1672;
            int _472 = _410;
            int _474 = as_type<int>(_434);
            int _476 = 31;
            int _1676 = _56(_472, _474, _476, _478, gl_SubgroupInvocationID);
            int _480 = _1676;
            int _482 = as_type<int>(_412);
            int _484 = as_type<int>(_434);
            int _486 = 31;
            int _1681 = _56(_482, _484, _486, _488, gl_SubgroupInvocationID);
            int _490 = _1681;
            int _492 = _414;
            int _494 = as_type<int>(_434);
            int _496 = 31;
            int _1685 = _56(_492, _494, _496, _498, gl_SubgroupInvocationID);
            int _500 = _1685;
            int _502 = _416;
            int _504 = as_type<int>(_434);
            int _506 = 31;
            int _1689 = _56(_502, _504, _506, _508, gl_SubgroupInvocationID);
            int _510 = _1689;
            int _512 = _418;
            int _514 = as_type<int>(_434);
            int _516 = 31;
            int _1693 = _56(_512, _514, _516, _518, gl_SubgroupInvocationID);
            int _520 = _1693;
            int _522 = _420;
            int _524 = as_type<int>(_434);
            int _526 = 31;
            int _1697 = _56(_522, _524, _526, _528, gl_SubgroupInvocationID);
            int _530 = _1697;
            int _532 = as_type<int>(_422);
            int _534 = as_type<int>(_434);
            int _536 = 31;
            int _1702 = _56(_532, _534, _536, _538, gl_SubgroupInvocationID);
            int _540 = _1702;
            int _542 = as_type<int>(_424);
            int _544 = as_type<int>(_434);
            int _546 = 31;
            int _1707 = _56(_542, _544, _546, _548, gl_SubgroupInvocationID);
            int _550 = _1707;
            int _552 = as_type<int>(_426);
            int _554 = as_type<int>(_434);
            int _556 = 31;
            int _1712 = _56(_552, _554, _556, _558, gl_SubgroupInvocationID);
            int _560 = _1712;
            bool _562 = !_436;
            _374 = _438;
            float _564 = _404;
            float _566 = _406;
            float _568 = _408;
            int _570 = _410;
            float _572 = _412;
            int _574 = _414;
            int _576 = _416;
            int _578 = _418;
            int _580 = _420;
            float _582 = _422;
            float _584 = _424;
            float _586 = _426;
            if (!_562)
            {
                float _588 = _342 * as_type<float>(_500);
                float _590 = _318 * as_type<float>(_500);
                float _592 = _338 * as_type<float>(_500);
                float _594 = _350 * as_type<float>(_500);
                float _596 = _318 * as_type<float>(_460);
                float _598 = _338 * as_type<float>(_460);
                float _600 = _350 * as_type<float>(_460);
                float _602 = fma(_340, as_type<float>(_490), _588);
                float _604 = _342 * as_type<float>(_460);
                float _606 = _342 * as_type<float>(_540);
                float _608 = fma(_320, as_type<float>(_490), _590);
                float _610 = fma(_346, as_type<float>(_490), _592);
                float _612 = fma(_348, as_type<float>(_490), _594);
                float _614 = _318 * as_type<float>(_540);
                float _616 = _338 * as_type<float>(_540);
                float _618 = _350 * as_type<float>(_540);
                float _620 = fma(_320, as_type<float>(_450), _596);
                float _622 = fma(_346, as_type<float>(_450), _598);
                float _624 = fma(_348, as_type<float>(_450), _600);
                float _626 = fma(_340, as_type<float>(_450), _604);
                float _628 = fma(_340, as_type<float>(_530), _606);
                float _630 = fma(_320, as_type<float>(_530), _614);
                float _632 = fma(_346, as_type<float>(_530), _616);
                float _634 = fma(_348, as_type<float>(_530), _618);
                float _636 = fma(_322, as_type<float>(_470), _620);
                float _638 = fma(_324, as_type<float>(_470), _622);
                float _640 = fma(_352, as_type<float>(_470), _624);
                float _642 = fma(_322, as_type<float>(_510), _608);
                float _644 = fma(_344, as_type<float>(_470), _626);
                float _646 = fma(_344, as_type<float>(_510), _602);
                float _648 = fma(_344, as_type<float>(_550), _628);
                float _650 = fma(_324, as_type<float>(_510), _610);
                float _652 = fma(_352, as_type<float>(_510), _612);
                float _654 = fma(_322, as_type<float>(_550), _630);
                float _656 = fma(_324, as_type<float>(_550), _632);
                float _658 = fma(_352, as_type<float>(_550), _634);
                float _660 = as_type<float>(_480) + _644;
                float _662 = as_type<float>(_520) + _646;
                float _664 = as_type<float>(_560) + _648;
                _564 = _636;
                _566 = _638;
                _568 = _640;
                _570 = as_type<int>(_660);
                _572 = _642;
                _574 = as_type<int>(_650);
                _576 = as_type<int>(_652);
                _578 = as_type<int>(_662);
                _580 = as_type<int>(_654);
                _582 = _656;
                _584 = _658;
                _586 = _664;
            }
            _666 = _564;
            _668 = _566;
            _670 = _568;
            _672 = _570;
            _674 = _572;
            _676 = _574;
            _678 = _576;
            _680 = _578;
            _682 = _580;
            _684 = _582;
            _686 = _584;
            _688 = _586;
            _400 = !_440;
            _376 = _666;
            _378 = _668;
            _380 = _670;
            _382 = as_type<float>(_672);
            _384 = _674;
            _386 = as_type<float>(_676);
            _388 = as_type<float>(_678);
            _390 = as_type<float>(_680);
            _392 = as_type<float>(_682);
            _394 = _684;
            _396 = _686;
            _398 = _688;
        } while (_400);
        _690 = _666;
        _692 = _668;
        _358 = _670;
        _360 = as_type<float>(_672);
        _362 = _674;
        _364 = as_type<float>(_676);
        _694 = as_type<float>(_678);
        _696 = as_type<float>(_680);
        _366 = as_type<float>(_682);
        _368 = _684;
        _370 = _686;
        _372 = _688;
        _698 = true;
    }
    else
    {
        _690 = _320;
        _692 = _346;
        _694 = _350;
        _696 = _342;
    }
    _698 = false;
    float _700 = _690;
    float _702 = _692;
    float _704 = _358;
    float _706 = _360;
    float _708 = _362;
    float _710 = _364;
    float _712 = _694;
    float _714 = _696;
    float _716 = _366;
    float _718 = _368;
    float _720 = _370;
    float _722 = _372;
    int _724 = _354 + 80;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    uint _728 = uint(int(uint(int(_726)) >> uint(2)));
    int _730 = int(_726) & 3;
    float _732 = (*spvDescriptorSet0.cp_c6)._m0[int(_728)][_730];
    int _734 = int(_726) + 1;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    int _738 = _734 & 3;
    float _740 = (*spvDescriptorSet0.cp_c6)._m0[int(_736)][_738];
    bool _742 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _744 = _354 + 64;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    uint _748 = uint(int(uint(int(_746)) >> uint(2)));
    int _750 = int(_746) & 3;
    float _752 = (*spvDescriptorSet0.cp_c6)._m0[int(_748)][_750];
    int _754 = int(_746) + 1;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    int _758 = _754 & 3;
    float _760 = (*spvDescriptorSet0.cp_c6)._m0[int(_756)][_758];
    int _762 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _764 = _762 + _66;
    int _766 = _354 + 88;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    uint _770 = uint(int(uint(int(_768)) >> uint(2)));
    int _772 = int(_768) & 3;
    float _774 = (*spvDescriptorSet0.cp_c6)._m0[int(_770)][_772];
    int _776 = int(_768) + 1;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    int _780 = _776 & 3;
    float _782 = (*spvDescriptorSet0.cp_c6)._m0[int(_778)][_780];
    int _784 = _354 + 72;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.cp_c6)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.cp_c6)._m0[int(_796)][_798];
    int _802 = _354 + 96;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    uint _806 = uint(int(uint(int(_804)) >> uint(2)));
    int _808 = int(_804) & 3;
    float _810 = (*spvDescriptorSet0.cp_c6)._m0[int(_806)][_808];
    int _812 = int(_804) + 1;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    int _816 = _812 & 3;
    float _818 = (*spvDescriptorSet0.cp_c6)._m0[int(_814)][_816];
    int _820 = _354 + 104;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    int _838 = _354 + 16;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.cp_c6)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.cp_c6)._m0[int(_850)][_852];
    if (!_742)
    {
        int _856 = _66 * 48;
        int _858 = _856 + 16;
        uint _860 = uint(int(uint(_856) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_860)] = as_type<uint>(_700);
        int _862 = _856 + 4;
        uint _864 = uint(int(uint(_862) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_864)] = as_type<uint>(_702);
        int _866 = _856 + 8;
        uint _868 = uint(int(uint(_866) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_868)] = as_type<uint>(_704);
        int _870 = _856 + 12;
        uint _872 = uint(int(uint(_870) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_872)] = as_type<uint>(_706);
        int _874 = _856 + 32;
        uint _876 = uint(int(uint(_858) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_876)] = as_type<uint>(_708);
        int _878 = _858 + 4;
        uint _880 = uint(int(uint(_878) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_880)] = as_type<uint>(_710);
        int _882 = _858 + 8;
        uint _884 = uint(int(uint(_882) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_884)] = as_type<uint>(_712);
        int _886 = _858 + 12;
        uint _888 = uint(int(uint(_886) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_888)] = as_type<uint>(_714);
        uint _890 = uint(int(uint(_874) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_890)] = as_type<uint>(_716);
        int _892 = _874 + 4;
        uint _894 = uint(int(uint(_892) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_894)] = as_type<uint>(_718);
        int _896 = _874 + 8;
        uint _898 = uint(int(uint(_896) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_898)] = as_type<uint>(_720);
        int _900 = _874 + 12;
        uint _902 = uint(int(uint(_900) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_902)] = as_type<uint>(_722);
    }
    float _904 = _718 * _732;
    float _906 = _702 * _732;
    float _908 = _710 * _732;
    int _910 = _354 + 32;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.cp_c6)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.cp_c6)._m0[int(_922)][_924];
    float _928 = fma(_716, _752, _904);
    float _930 = _702 * _740;
    float _932 = fma(_700, _752, _906);
    float _934 = fma(_708, _752, _908);
    float _936 = _710 * _740;
    float _938 = fma(_700, _760, _930);
    float _940 = _702 * _774;
    int _942 = _354 + 48;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.cp_c6)._m0[int(_946)][_948];
    int _952 = int(_944) + 1;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    int _956 = _952 & 3;
    float _958 = (*spvDescriptorSet0.cp_c6)._m0[int(_954)][_956];
    float _960 = _702 * _782;
    float _962 = _718 * _740;
    float _964 = _710 * _774;
    float _966 = _710 * _782;
    float _968 = _718 * _774;
    float _970 = fma(_708, _760, _936);
    float _972 = fma(_716, _760, _962);
    float _974 = _718 * _782;
    float _976 = fma(_700, _792, _940);
    int _978 = _354 + 24;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    uint _982 = uint(int(uint(int(_980)) >> uint(2)));
    int _984 = int(_980) & 3;
    float _986 = (*spvDescriptorSet0.cp_c6)._m0[int(_982)][_984];
    int _988 = int(_980) + 1;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    int _992 = _988 & 3;
    float _994 = (*spvDescriptorSet0.cp_c6)._m0[int(_990)][_992];
    float _996 = fma(_700, _800, _960);
    float _998 = fma(_708, _792, _964);
    float _1000 = fma(_708, _800, _966);
    float _1002 = fma(_716, _800, _974);
    float _1004 = fma(_716, _792, _968);
    float _1006 = fma(_704, _810, _932);
    float _1008 = fma(_712, _836, _1000);
    int _1010 = _354 + 40;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    uint _1014 = uint(int(uint(int(_1012)) >> uint(2)));
    int _1016 = int(_1012) & 3;
    float _1018 = (*spvDescriptorSet0.cp_c6)._m0[int(_1014)][_1016];
    int _1020 = int(_1012) + 1;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    int _1024 = _1020 & 3;
    float _1026 = (*spvDescriptorSet0.cp_c6)._m0[int(_1022)][_1024];
    float _1028 = fma(_712, _810, _934);
    float _1030 = fma(_720, _810, _928);
    float _1032 = fma(_704, _818, _938);
    float _1034 = fma(_704, _828, _976);
    float _1036 = fma(_704, _836, _996);
    float _1038 = fma(_712, _818, _970);
    float _1040 = fma(_712, _828, _998);
    int _1042 = _354 + 56;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.cp_c6)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.cp_c6)._m0[int(_1054)][_1056];
    float _1060 = fma(_720, _836, _1002);
    float _1062 = _1008 + _714;
    float _1064 = fma(_720, _818, _972);
    float _1066 = fma(_720, _828, _1004);
    float _1068 = _1060 + _722;
    float _1070 = _1036 + _706;
    float _1072 = _1028 * _854;
    float _1074 = _1038 * _854;
    float _1076 = _1040 * _854;
    float _1078 = _1062 * _854;
    float _1080 = fma(_1006, _846, _1072);
    float _1082 = fma(_1032, _846, _1074);
    float _1084 = fma(_1034, _846, _1076);
    float _1086 = fma(_1070, _846, _1078);
    float _1088 = _1028 * _926;
    float _1090 = _1038 * _926;
    float _1092 = _1040 * _926;
    float _1094 = _1062 * _926;
    float _1096 = fma(_1006, _918, _1088);
    float _1098 = fma(_1032, _918, _1090);
    float _1100 = fma(_1034, _918, _1092);
    float _1102 = _1062 * _958;
    float _1104 = _1028 * _958;
    float _1106 = fma(_1070, _918, _1094);
    float _1108 = _1038 * _958;
    float _1110 = _1040 * _958;
    float _1112 = fma(_1070, _950, _1102);
    int _1114 = _764 * 48;
    float _1116 = fma(_1006, _950, _1104);
    float _1118 = fma(_1032, _950, _1108);
    float _1120 = fma(_1034, _950, _1110);
    float _1122 = fma(_1068, _986, _1086);
    float _1124 = fma(_1064, _986, _1082);
    float _1126 = fma(_1030, _986, _1080);
    float _1128 = fma(_1066, _986, _1084);
    float _1130 = _1122 + _994;
    float _1132 = fma(_1068, _1018, _1106);
    float _1134 = fma(_1030, _1018, _1096);
    float _1136 = fma(_1064, _1018, _1098);
    float _1138 = fma(_1066, _1018, _1100);
    int _1140 = _1114 + 16;
    float _1142 = _1132 + _1026;
    float _1144 = fma(_1068, _1050, _1112);
    float _1146 = fma(_1030, _1050, _1116);
    int _1148 = _1114 + 32;
    float _1150 = fma(_1064, _1050, _1118);
    float _1152 = fma(_1066, _1050, _1120);
    float _1154 = _1144 + _1058;
    int _1156 = _1114 + 48;
    uint _1158 = uint(int(uint(_1140) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1158)] = as_type<uint>(_1126);
    int _1160 = _1140 + 4;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1162)] = as_type<uint>(_1124);
    int _1164 = _1140 + 8;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1166)] = as_type<uint>(_1128);
    int _1168 = _1140 + 12;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1170)] = as_type<uint>(_1130);
    uint _1172 = uint(int(uint(_1148) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1172)] = as_type<uint>(_1134);
    int _1174 = _1148 + 4;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1176)] = as_type<uint>(_1136);
    int _1178 = _1148 + 8;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1180)] = as_type<uint>(_1138);
    int _1182 = _1148 + 12;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1184)] = as_type<uint>(_1142);
    uint _1186 = uint(int(uint(_1156) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1186)] = as_type<uint>(_1146);
    int _1188 = _1156 + 4;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1190)] = as_type<uint>(_1150);
    int _1192 = _1156 + 8;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1194)] = as_type<uint>(_1152);
    int _1196 = _1156 + 12;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1198)] = as_type<uint>(_1154);
}

