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
int _54(thread const int& _2615, thread const int& _2616, constant _10& support_buffer)
{
    int _2619 = 1 + _2616;
    float _2621 = support_buffer._m5[_2619].x;
    bool _2623 = _2621 == 1.0;
    if (_2623)
    {
        return _2615;
    }
    float _2625 = float(_2615);
    float _2627 = _2625 * _2621;
    int _2629 = int(_2627);
    return _2629;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2650, thread const int& _2651, thread const int& _2652, thread int& _2653, thread uint& gl_SubgroupInvocationID)
{
    int _2656 = _2652 & 31;
    uint _2658 = uint(int(uint(_2652) >> uint(8)));
    int _2660 = int(_2658) & 31;
    float _2662 = as_type<float>(gl_SubgroupInvocationID);
    int _2664 = as_type<int>(_2662) & _2660;
    int _2666 = ~_2660;
    int _2668 = _2656 & _2666;
    int _2670 = _2668 | _2664;
    int _2672 = ~_2660;
    int _2674 = _2651 & _2672;
    int _2676 = _2674 | _2664;
    bool _2678 = uint(_2676) <= uint(_2670);
    _2653 = _2678 ? (-1) : 0;
    float _2680 = spvSubgroupShuffle(as_type<float>(_2650), uint(_2676));
    uint _2682 = uint(_2678 ? as_type<int>(_2680) : _2650);
    return int(_2682);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _564 = false;
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
    int _83 = _66;
    int _85 = 0;
    int _87 = _54(_83, _85, (*spvDescriptorSet0.support_buffer));
    int _89 = as_type<int>(_81);
    int _91 = 0;
    int _93 = _54(_89, _91, (*spvDescriptorSet0.support_buffer));
    int3 _1123 = int3(_87, _93, 1);
    float4 _96 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1123.xy), uint(_1123.z), 0).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    int _106 = _66;
    int _108 = 0;
    int _110 = _54(_106, _108, (*spvDescriptorSet0.support_buffer));
    int _112 = as_type<int>(_81);
    int _114 = 0;
    int _116 = _54(_112, _114, (*spvDescriptorSet0.support_buffer));
    int3 _1143 = int3(_110, _116, 0);
    float3 _120 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1143.xy), uint(_1143.z), 0).xyz;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    int _128 = _66;
    int _130 = 0;
    int _132 = _54(_128, _130, (*spvDescriptorSet0.support_buffer));
    int _134 = as_type<int>(_81);
    int _136 = 0;
    int _138 = _54(_134, _136, (*spvDescriptorSet0.support_buffer));
    int3 _1161 = int3(_132, _138, 2);
    float3 _140 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1161.xy), uint(_1161.z), 0).xyz;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    bool _148 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _150 = _104 * 2.0;
    float _152 = _98 * 2.0;
    float _154 = _100 * 2.0;
    float _156 = _102 * 2.0;
    float _158 = _102 * _150;
    float _160 = _98 * _150;
    float _162 = _100 * _150;
    float _164 = -_152;
    float _166 = fma(_98, _164, 1.0);
    float _168 = -_154;
    float _170 = fma(_100, _168, 1.0);
    float _172 = -_158;
    float _174 = fma(_100, _152, _172);
    float _176 = fma(_100, _152, _158);
    float _178 = fma(_102, _152, _162);
    float _180 = -_162;
    float _182 = fma(_102, _152, _180);
    float _184 = -_156;
    float _186 = fma(_102, _184, _170);
    float _188 = -_156;
    float _190 = fma(_102, _188, _166);
    float _192 = fma(_102, _154, _160);
    float _194 = -_160;
    float _196 = fma(_102, _154, _194);
    float _198 = -_154;
    float _200 = fma(_100, _198, _166);
    float _202 = _122 * _186;
    float _204 = _124 * _174;
    float _206 = _124 * _190;
    float _208 = _124 * _192;
    float _210 = _122 * _176;
    float _212 = _126 * _178;
    float _214 = _126 * _196;
    float _216 = _122 * _182;
    float _218 = _126 * _200;
    int _220 = _66 * 112;
    bool _222 = !_148;
    float _224 = _202;
    float _226 = _204;
    float _228 = _212;
    float _230 = _210;
    float _232 = _206;
    float _234 = _144;
    float _236 = _216;
    float _238 = _208;
    float _240 = _218;
    float _242 = _146;
    float _560;
    float _562;
    if (!_222)
    {
        int _244 = 0;
        float _246 = _202;
        float _248 = _204;
        float _250 = _212;
        float _252 = _142;
        float _254 = _210;
        float _256 = _206;
        float _258 = _214;
        float _260 = _144;
        float _262 = _216;
        float _264 = _208;
        float _266 = _218;
        float _268 = _146;
        bool _270;
        int _318;
        int _328;
        int _338;
        int _348;
        int _358;
        int _368;
        int _378;
        int _388;
        int _398;
        int _408;
        int _418;
        int _428;
        float _536;
        float _538;
        float _540;
        int _542;
        float _544;
        int _546;
        int _548;
        int _550;
        int _552;
        float _554;
        float _556;
        float _558;
        do
        {
            int _272 = _244;
            float _274 = _246;
            float _276 = _248;
            float _278 = _250;
            int _280 = as_type<int>(_252);
            float _282 = _254;
            int _284 = as_type<int>(_256);
            int _286 = as_type<int>(_258);
            int _288 = as_type<int>(_260);
            int _290 = as_type<int>(_262);
            float _292 = _264;
            float _294 = _266;
            float _296 = _268;
            uint _298 = uint(int(uint(_220) >> uint(2)));
            uint _300 = uint(int(uint(int(_298)) >> uint(2)));
            int _302 = int(_298) & 3;
            float _304 = (*spvDescriptorSet0.cp_c6)._m0[int(_300)][_302];
            bool _306 = _66 != 0;
            int _308 = _272 + 1;
            bool _310 = uint(_308) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _312 = as_type<int>(_274);
            int _314 = as_type<int>(_304);
            int _316 = 31;
            int _1360 = _56(_312, _314, _316, _318, gl_SubgroupInvocationID);
            int _320 = _1360;
            int _322 = as_type<int>(_276);
            int _324 = as_type<int>(_304);
            int _326 = 31;
            int _1365 = _56(_322, _324, _326, _328, gl_SubgroupInvocationID);
            int _330 = _1365;
            int _332 = as_type<int>(_278);
            int _334 = as_type<int>(_304);
            int _336 = 31;
            int _1370 = _56(_332, _334, _336, _338, gl_SubgroupInvocationID);
            int _340 = _1370;
            int _342 = _280;
            int _344 = as_type<int>(_304);
            int _346 = 31;
            int _1374 = _56(_342, _344, _346, _348, gl_SubgroupInvocationID);
            int _350 = _1374;
            int _352 = as_type<int>(_282);
            int _354 = as_type<int>(_304);
            int _356 = 31;
            int _1379 = _56(_352, _354, _356, _358, gl_SubgroupInvocationID);
            int _360 = _1379;
            int _362 = _284;
            int _364 = as_type<int>(_304);
            int _366 = 31;
            int _1383 = _56(_362, _364, _366, _368, gl_SubgroupInvocationID);
            int _370 = _1383;
            int _372 = _286;
            int _374 = as_type<int>(_304);
            int _376 = 31;
            int _1387 = _56(_372, _374, _376, _378, gl_SubgroupInvocationID);
            int _380 = _1387;
            int _382 = _288;
            int _384 = as_type<int>(_304);
            int _386 = 31;
            int _1391 = _56(_382, _384, _386, _388, gl_SubgroupInvocationID);
            int _390 = _1391;
            int _392 = _290;
            int _394 = as_type<int>(_304);
            int _396 = 31;
            int _1395 = _56(_392, _394, _396, _398, gl_SubgroupInvocationID);
            int _400 = _1395;
            int _402 = as_type<int>(_292);
            int _404 = as_type<int>(_304);
            int _406 = 31;
            int _1400 = _56(_402, _404, _406, _408, gl_SubgroupInvocationID);
            int _410 = _1400;
            int _412 = as_type<int>(_294);
            int _414 = as_type<int>(_304);
            int _416 = 31;
            int _1405 = _56(_412, _414, _416, _418, gl_SubgroupInvocationID);
            int _420 = _1405;
            int _422 = as_type<int>(_296);
            int _424 = as_type<int>(_304);
            int _426 = 31;
            int _1410 = _56(_422, _424, _426, _428, gl_SubgroupInvocationID);
            int _430 = _1410;
            bool _432 = !_306;
            _244 = _308;
            float _434 = _274;
            float _436 = _276;
            float _438 = _278;
            int _440 = _280;
            float _442 = _282;
            int _444 = _284;
            int _446 = _286;
            int _448 = _288;
            int _450 = _290;
            float _452 = _292;
            float _454 = _294;
            float _456 = _296;
            if (!_432)
            {
                float _458 = _144 * as_type<float>(_330);
                float _460 = _206 * as_type<float>(_370);
                float _462 = _214 * as_type<float>(_370);
                float _464 = _210 * as_type<float>(_330);
                float _466 = fma(_142, as_type<float>(_320), _458);
                float _468 = _210 * as_type<float>(_370);
                float _470 = _206 * as_type<float>(_330);
                float _472 = _214 * as_type<float>(_330);
                float _474 = fma(_204, as_type<float>(_360), _460);
                float _476 = fma(_202, as_type<float>(_360), _468);
                float _478 = fma(_212, as_type<float>(_360), _462);
                float _480 = fma(_202, as_type<float>(_320), _464);
                float _482 = fma(_204, as_type<float>(_320), _470);
                float _484 = fma(_212, as_type<float>(_320), _472);
                float _486 = _210 * as_type<float>(_410);
                float _488 = _206 * as_type<float>(_410);
                float _490 = _214 * as_type<float>(_410);
                float _492 = _144 * as_type<float>(_370);
                float _494 = _144 * as_type<float>(_410);
                float _496 = fma(_204, as_type<float>(_400), _488);
                float _498 = fma(_208, as_type<float>(_340), _482);
                float _500 = fma(_142, as_type<float>(_360), _492);
                float _502 = fma(_142, as_type<float>(_400), _494);
                float _504 = fma(_202, as_type<float>(_400), _486);
                float _506 = fma(_212, as_type<float>(_400), _490);
                float _508 = fma(_216, as_type<float>(_340), _480);
                float _510 = fma(_218, as_type<float>(_340), _484);
                float _512 = fma(_216, as_type<float>(_380), _476);
                float _514 = fma(_146, as_type<float>(_340), _466);
                float _516 = fma(_146, as_type<float>(_380), _500);
                float _518 = fma(_146, as_type<float>(_420), _502);
                float _520 = fma(_208, as_type<float>(_380), _474);
                float _522 = fma(_218, as_type<float>(_380), _478);
                float _524 = fma(_216, as_type<float>(_420), _504);
                float _526 = fma(_208, as_type<float>(_420), _496);
                float _528 = fma(_218, as_type<float>(_420), _506);
                float _530 = as_type<float>(_350) + _514;
                float _532 = as_type<float>(_390) + _516;
                float _534 = as_type<float>(_430) + _518;
                _434 = _508;
                _436 = _498;
                _438 = _510;
                _440 = as_type<int>(_530);
                _442 = _512;
                _444 = as_type<int>(_520);
                _446 = as_type<int>(_522);
                _448 = as_type<int>(_532);
                _450 = as_type<int>(_524);
                _452 = _526;
                _454 = _528;
                _456 = _534;
            }
            _536 = _434;
            _538 = _436;
            _540 = _438;
            _542 = _440;
            _544 = _442;
            _546 = _444;
            _548 = _446;
            _550 = _448;
            _552 = _450;
            _554 = _452;
            _556 = _454;
            _558 = _456;
            _270 = !_310;
            _246 = _536;
            _248 = _538;
            _250 = _540;
            _252 = as_type<float>(_542);
            _254 = _544;
            _256 = as_type<float>(_546);
            _258 = as_type<float>(_548);
            _260 = as_type<float>(_550);
            _262 = as_type<float>(_552);
            _264 = _554;
            _266 = _556;
            _268 = _558;
        } while (_270);
        _224 = _536;
        _226 = _538;
        _228 = _540;
        _560 = as_type<float>(_542);
        _230 = _544;
        _232 = as_type<float>(_546);
        _562 = as_type<float>(_548);
        _234 = as_type<float>(_550);
        _236 = as_type<float>(_552);
        _238 = _554;
        _240 = _556;
        _242 = _558;
        _564 = true;
    }
    else
    {
        _560 = _142;
        _562 = _214;
    }
    _564 = false;
    float _566 = _224;
    float _568 = _226;
    float _570 = _228;
    float _572 = _560;
    float _574 = _230;
    float _576 = _232;
    float _578 = _562;
    float _580 = _234;
    float _582 = _236;
    float _584 = _238;
    float _586 = _240;
    float _588 = _242;
    int _590 = _220 + 80;
    uint _592 = uint(int(uint(_590) >> uint(2)));
    uint _594 = uint(int(uint(int(_592)) >> uint(2)));
    int _596 = int(_592) & 3;
    float _598 = (*spvDescriptorSet0.cp_c6)._m0[int(_594)][_596];
    int _600 = int(_592) + 1;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    int _604 = _600 & 3;
    float _606 = (*spvDescriptorSet0.cp_c6)._m0[int(_602)][_604];
    bool _608 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _610 = _220 + 64;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    uint _614 = uint(int(uint(int(_612)) >> uint(2)));
    int _616 = int(_612) & 3;
    float _618 = (*spvDescriptorSet0.cp_c6)._m0[int(_614)][_616];
    int _620 = int(_612) + 1;
    uint _622 = uint(int(uint(_620) >> uint(2)));
    int _624 = _620 & 3;
    float _626 = (*spvDescriptorSet0.cp_c6)._m0[int(_622)][_624];
    int _628 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _630 = _628 + _66;
    int _632 = _220 + 88;
    uint _634 = uint(int(uint(_632) >> uint(2)));
    uint _636 = uint(int(uint(int(_634)) >> uint(2)));
    int _638 = int(_634) & 3;
    float _640 = (*spvDescriptorSet0.cp_c6)._m0[int(_636)][_638];
    int _642 = int(_634) + 1;
    uint _644 = uint(int(uint(_642) >> uint(2)));
    int _646 = _642 & 3;
    float _648 = (*spvDescriptorSet0.cp_c6)._m0[int(_644)][_646];
    int _650 = _220 + 72;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    uint _654 = uint(int(uint(int(_652)) >> uint(2)));
    int _656 = int(_652) & 3;
    float _658 = (*spvDescriptorSet0.cp_c6)._m0[int(_654)][_656];
    int _660 = int(_652) + 1;
    uint _662 = uint(int(uint(_660) >> uint(2)));
    int _664 = _660 & 3;
    float _666 = (*spvDescriptorSet0.cp_c6)._m0[int(_662)][_664];
    int _668 = _220 + 96;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    uint _672 = uint(int(uint(int(_670)) >> uint(2)));
    int _674 = int(_670) & 3;
    float _676 = (*spvDescriptorSet0.cp_c6)._m0[int(_672)][_674];
    int _678 = int(_670) + 1;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    int _682 = _678 & 3;
    float _684 = (*spvDescriptorSet0.cp_c6)._m0[int(_680)][_682];
    int _686 = _220 + 104;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    uint _690 = uint(int(uint(int(_688)) >> uint(2)));
    int _692 = int(_688) & 3;
    float _694 = (*spvDescriptorSet0.cp_c6)._m0[int(_690)][_692];
    int _696 = int(_688) + 1;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    int _700 = _696 & 3;
    float _702 = (*spvDescriptorSet0.cp_c6)._m0[int(_698)][_700];
    int _704 = _220 + 16;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.cp_c6)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.cp_c6)._m0[int(_716)][_718];
    if (!_608)
    {
        int _722 = _66 * 48;
        int _724 = _722 + 16;
        uint _726 = uint(int(uint(_722) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_726)] = as_type<uint>(_566);
        int _728 = _722 + 4;
        uint _730 = uint(int(uint(_728) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_730)] = as_type<uint>(_568);
        int _732 = _722 + 8;
        uint _734 = uint(int(uint(_732) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_734)] = as_type<uint>(_570);
        int _736 = _722 + 12;
        uint _738 = uint(int(uint(_736) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_738)] = as_type<uint>(_572);
        int _740 = _722 + 32;
        uint _742 = uint(int(uint(_724) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_742)] = as_type<uint>(_574);
        int _744 = _724 + 4;
        uint _746 = uint(int(uint(_744) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_746)] = as_type<uint>(_576);
        int _748 = _724 + 8;
        uint _750 = uint(int(uint(_748) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_750)] = as_type<uint>(_578);
        int _752 = _724 + 12;
        uint _754 = uint(int(uint(_752) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_754)] = as_type<uint>(_580);
        uint _756 = uint(int(uint(_740) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_756)] = as_type<uint>(_582);
        int _758 = _740 + 4;
        uint _760 = uint(int(uint(_758) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_760)] = as_type<uint>(_584);
        int _762 = _740 + 8;
        uint _764 = uint(int(uint(_762) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_764)] = as_type<uint>(_586);
        int _766 = _740 + 12;
        uint _768 = uint(int(uint(_766) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_768)] = as_type<uint>(_588);
    }
    float _770 = _584 * _598;
    float _772 = _568 * _598;
    float _774 = _576 * _598;
    int _776 = _220 + 32;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    uint _780 = uint(int(uint(int(_778)) >> uint(2)));
    int _782 = int(_778) & 3;
    float _784 = (*spvDescriptorSet0.cp_c6)._m0[int(_780)][_782];
    int _786 = int(_778) + 1;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    int _790 = _786 & 3;
    float _792 = (*spvDescriptorSet0.cp_c6)._m0[int(_788)][_790];
    float _794 = fma(_582, _618, _770);
    float _796 = _568 * _606;
    float _798 = fma(_566, _618, _772);
    float _800 = fma(_574, _618, _774);
    float _802 = _576 * _606;
    float _804 = fma(_566, _626, _796);
    float _806 = _568 * _640;
    float _808 = _568 * _648;
    float _810 = _584 * _606;
    int _812 = _220 + 48;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.cp_c6)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
    float _830 = _576 * _640;
    float _832 = _576 * _648;
    float _834 = fma(_574, _626, _802);
    float _836 = fma(_582, _626, _810);
    float _838 = _584 * _640;
    float _840 = _584 * _648;
    float _842 = fma(_566, _658, _806);
    float _844 = fma(_566, _666, _808);
    float _846 = fma(_574, _658, _830);
    int _848 = _220 + 24;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    uint _852 = uint(int(uint(int(_850)) >> uint(2)));
    int _854 = int(_850) & 3;
    float _856 = (*spvDescriptorSet0.cp_c6)._m0[int(_852)][_854];
    int _858 = int(_850) + 1;
    uint _860 = uint(int(uint(_858) >> uint(2)));
    int _862 = _858 & 3;
    float _864 = (*spvDescriptorSet0.cp_c6)._m0[int(_860)][_862];
    float _866 = fma(_574, _666, _832);
    float _868 = fma(_582, _666, _840);
    float _870 = fma(_582, _658, _838);
    float _872 = fma(_570, _676, _798);
    float _874 = fma(_578, _702, _866);
    float _876 = fma(_578, _676, _800);
    float _878 = fma(_586, _676, _794);
    int _880 = _220 + 40;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.cp_c6)._m0[int(_884)][_886];
    int _890 = int(_882) + 1;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    int _894 = _890 & 3;
    float _896 = (*spvDescriptorSet0.cp_c6)._m0[int(_892)][_894];
    float _898 = fma(_570, _684, _804);
    float _900 = fma(_570, _694, _842);
    float _902 = fma(_570, _702, _844);
    float _904 = fma(_578, _684, _834);
    float _906 = fma(_578, _694, _846);
    float _908 = fma(_586, _702, _868);
    float _910 = _874 + _580;
    int _912 = _220 + 56;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.cp_c6)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.cp_c6)._m0[int(_924)][_926];
    float _930 = fma(_586, _684, _836);
    float _932 = fma(_586, _694, _870);
    float _934 = _908 + _588;
    float _936 = _902 + _572;
    float _938 = _876 * _720;
    float _940 = _904 * _720;
    float _942 = _906 * _720;
    float _944 = _910 * _720;
    float _946 = fma(_872, _712, _938);
    float _948 = fma(_898, _712, _940);
    float _950 = fma(_900, _712, _942);
    float _952 = _910 * _792;
    float _954 = fma(_936, _712, _944);
    float _956 = _876 * _792;
    float _958 = _904 * _792;
    float _960 = _906 * _792;
    float _962 = fma(_936, _784, _952);
    float _964 = fma(_872, _784, _956);
    float _966 = fma(_898, _784, _958);
    float _968 = fma(_900, _784, _960);
    int _970 = _630 * 48;
    float _972 = _910 * _828;
    float _974 = _876 * _828;
    float _976 = _904 * _828;
    float _978 = _906 * _828;
    float _980 = fma(_936, _820, _972);
    float _982 = fma(_872, _820, _974);
    float _984 = fma(_898, _820, _976);
    float _986 = fma(_900, _820, _978);
    float _988 = fma(_934, _856, _954);
    float _990 = fma(_878, _856, _946);
    float _992 = fma(_930, _856, _948);
    float _994 = fma(_932, _856, _950);
    float _996 = _988 + _864;
    float _998 = fma(_934, _888, _962);
    float _1000 = fma(_878, _888, _964);
    float _1002 = fma(_930, _888, _966);
    float _1004 = fma(_932, _888, _968);
    float _1006 = _998 + _896;
    int _1008 = _970 + 16;
    int _1010 = _970 + 32;
    float _1012 = fma(_934, _920, _980);
    float _1014 = fma(_878, _920, _982);
    float _1016 = fma(_930, _920, _984);
    float _1018 = fma(_932, _920, _986);
    float _1020 = _1012 + _928;
    int _1022 = _970 + 48;
    uint _1024 = uint(int(uint(_1008) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1024)] = as_type<uint>(_990);
    int _1026 = _1008 + 4;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1028)] = as_type<uint>(_992);
    int _1030 = _1008 + 8;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1032)] = as_type<uint>(_994);
    int _1034 = _1008 + 12;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1036)] = as_type<uint>(_996);
    uint _1038 = uint(int(uint(_1010) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1038)] = as_type<uint>(_1000);
    int _1040 = _1010 + 4;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1042)] = as_type<uint>(_1002);
    int _1044 = _1010 + 8;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1046)] = as_type<uint>(_1004);
    int _1048 = _1010 + 12;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1050)] = as_type<uint>(_1006);
    uint _1052 = uint(int(uint(_1022) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1052)] = as_type<uint>(_1014);
    int _1054 = _1022 + 4;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1056)] = as_type<uint>(_1016);
    int _1058 = _1022 + 8;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1060)] = as_type<uint>(_1018);
    int _1062 = _1022 + 12;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1064)] = as_type<uint>(_1020);
}

