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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
};

static inline __attribute__((always_inline))
int _52(thread const int& _2447, thread const int& _2448, constant _10& support_buffer)
{
    int _2451 = 1 + _2448;
    float _2453 = support_buffer._m5[_2451].x;
    bool _2455 = _2453 == 1.0;
    if (_2455)
    {
        return _2447;
    }
    float _2457 = float(_2447);
    float _2459 = _2457 * _2453;
    int _2461 = int(_2459);
    return _2461;
}

static inline __attribute__((always_inline))
int _54(thread const int& _2482, thread const int& _2483, thread const int& _2484, thread int& _2485, thread uint& gl_SubgroupInvocationID)
{
    int _2488 = _2484 & 31;
    uint _2490 = uint(int(uint(_2484) >> uint(8)));
    int _2492 = int(_2490) & 31;
    float _2494 = as_type<float>(gl_SubgroupInvocationID);
    int _2496 = as_type<int>(_2494) & _2492;
    int _2498 = ~_2492;
    int _2500 = _2488 & _2498;
    int _2502 = _2500 | _2496;
    int _2504 = ~_2492;
    int _2506 = _2483 & _2504;
    int _2508 = _2506 | _2496;
    bool _2510 = uint(_2508) <= uint(_2502);
    _2485 = _2510 ? (-1) : 0;
    float _2512 = spvSubgroupShuffle(as_type<float>(_2482), uint(_2508));
    uint _2514 = uint(_2510 ? as_type<int>(_2512) : _2482);
    return int(_2514);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _562 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.cp_c5)._m0[int(_75)][_77];
    int _81 = _64;
    int _83 = 0;
    int _85 = _52(_81, _83, (*spvDescriptorSet0.support_buffer));
    int _87 = as_type<int>(_79);
    int _89 = 0;
    int _91 = _52(_87, _89, (*spvDescriptorSet0.support_buffer));
    int3 _1071 = int3(_85, _91, 1);
    float4 _94 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1071.xy), uint(_1071.z), 0).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    int _104 = _64;
    int _106 = 0;
    int _108 = _52(_104, _106, (*spvDescriptorSet0.support_buffer));
    int _110 = as_type<int>(_79);
    int _112 = 0;
    int _114 = _52(_110, _112, (*spvDescriptorSet0.support_buffer));
    int3 _1091 = int3(_108, _114, 0);
    float3 _118 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1091.xy), uint(_1091.z), 0).xyz;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    int _126 = _64;
    int _128 = 0;
    int _130 = _52(_126, _128, (*spvDescriptorSet0.support_buffer));
    int _132 = as_type<int>(_79);
    int _134 = 0;
    int _136 = _52(_132, _134, (*spvDescriptorSet0.support_buffer));
    int3 _1109 = int3(_130, _136, 2);
    float3 _138 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1109.xy), uint(_1109.z), 0).xyz;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    bool _146 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _148 = _102 * 2.0;
    float _150 = _98 * 2.0;
    float _152 = _96 * 2.0;
    float _154 = _100 * 2.0;
    float _156 = _100 * _148;
    float _158 = _96 * _148;
    float _160 = _98 * _148;
    float _162 = -_150;
    float _164 = fma(_98, _162, 1.0);
    float _166 = -_152;
    float _168 = fma(_96, _166, 1.0);
    float _170 = -_156;
    float _172 = fma(_98, _152, _170);
    float _174 = fma(_98, _152, _156);
    float _176 = fma(_100, _152, _160);
    float _178 = -_160;
    float _180 = fma(_100, _152, _178);
    float _182 = -_154;
    float _184 = fma(_100, _182, _164);
    float _186 = -_154;
    float _188 = fma(_100, _186, _168);
    float _190 = -_158;
    float _192 = fma(_100, _150, _190);
    float _194 = fma(_100, _150, _158);
    float _196 = -_150;
    float _198 = fma(_98, _196, _168);
    float _200 = _120 * _184;
    float _202 = _122 * _172;
    float _204 = _122 * _188;
    float _206 = _124 * _176;
    float _208 = _124 * _192;
    float _210 = _120 * _174;
    float _212 = _120 * _180;
    float _214 = _122 * _194;
    float _216 = _124 * _198;
    int _218 = _64 * 112;
    bool _220 = !_146;
    float _222 = _206;
    float _540;
    float _542;
    float _544;
    float _546;
    float _548;
    float _550;
    float _552;
    float _554;
    float _556;
    float _558;
    float _560;
    if (!_220)
    {
        int _224 = 0;
        float _226 = _200;
        float _228 = _202;
        float _230 = _206;
        float _232 = _140;
        float _234 = _210;
        float _236 = _204;
        float _238 = _208;
        float _240 = _142;
        float _242 = _212;
        float _244 = _214;
        float _246 = _216;
        float _248 = _144;
        bool _250;
        int _298;
        int _308;
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
        int _516;
        int _520;
        int _522;
        float _524;
        float _526;
        int _530;
        int _534;
        int _536;
        int _538;
        do
        {
            int _252 = _224;
            int _254 = as_type<int>(_226);
            int _256 = as_type<int>(_228);
            int _258 = as_type<int>(_230);
            int _260 = as_type<int>(_232);
            float _262 = _234;
            float _264 = _236;
            int _266 = as_type<int>(_238);
            int _268 = as_type<int>(_240);
            int _270 = as_type<int>(_242);
            int _272 = as_type<int>(_244);
            int _274 = as_type<int>(_246);
            int _276 = as_type<int>(_248);
            uint _278 = uint(int(uint(_218) >> uint(2)));
            uint _280 = uint(int(uint(int(_278)) >> uint(2)));
            int _282 = int(_278) & 3;
            float _284 = (*spvDescriptorSet0.cp_c6)._m0[int(_280)][_282];
            bool _286 = _64 != 0;
            int _288 = _252 + 1;
            bool _290 = uint(_288) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _292 = _254;
            int _294 = as_type<int>(_284);
            int _296 = 31;
            int _1303 = _54(_292, _294, _296, _298, gl_SubgroupInvocationID);
            int _300 = _1303;
            int _302 = _256;
            int _304 = as_type<int>(_284);
            int _306 = 31;
            int _1307 = _54(_302, _304, _306, _308, gl_SubgroupInvocationID);
            int _310 = _1307;
            int _312 = _258;
            int _314 = as_type<int>(_284);
            int _316 = 31;
            int _1311 = _54(_312, _314, _316, _318, gl_SubgroupInvocationID);
            int _320 = _1311;
            int _322 = _260;
            int _324 = as_type<int>(_284);
            int _326 = 31;
            int _1315 = _54(_322, _324, _326, _328, gl_SubgroupInvocationID);
            int _330 = _1315;
            int _332 = as_type<int>(_262);
            int _334 = as_type<int>(_284);
            int _336 = 31;
            int _1320 = _54(_332, _334, _336, _338, gl_SubgroupInvocationID);
            int _340 = _1320;
            int _342 = as_type<int>(_264);
            int _344 = as_type<int>(_284);
            int _346 = 31;
            int _1325 = _54(_342, _344, _346, _348, gl_SubgroupInvocationID);
            int _350 = _1325;
            int _352 = _266;
            int _354 = as_type<int>(_284);
            int _356 = 31;
            int _1329 = _54(_352, _354, _356, _358, gl_SubgroupInvocationID);
            int _360 = _1329;
            int _362 = _268;
            int _364 = as_type<int>(_284);
            int _366 = 31;
            int _1333 = _54(_362, _364, _366, _368, gl_SubgroupInvocationID);
            int _370 = _1333;
            int _372 = _270;
            int _374 = as_type<int>(_284);
            int _376 = 31;
            int _1337 = _54(_372, _374, _376, _378, gl_SubgroupInvocationID);
            int _380 = _1337;
            int _382 = _272;
            int _384 = as_type<int>(_284);
            int _386 = 31;
            int _1341 = _54(_382, _384, _386, _388, gl_SubgroupInvocationID);
            int _390 = _1341;
            int _392 = _274;
            int _394 = as_type<int>(_284);
            int _396 = 31;
            int _1345 = _54(_392, _394, _396, _398, gl_SubgroupInvocationID);
            int _400 = _1345;
            int _402 = _276;
            int _404 = as_type<int>(_284);
            int _406 = 31;
            int _1349 = _54(_402, _404, _406, _408, gl_SubgroupInvocationID);
            int _410 = _1349;
            bool _412 = !_286;
            _224 = _288;
            int _414 = _254;
            int _416 = _256;
            int _418 = _258;
            int _420 = _260;
            float _422 = _262;
            float _424 = _264;
            int _426 = _266;
            int _428 = _268;
            int _430 = _270;
            int _432 = _272;
            int _434 = _274;
            int _436 = _276;
            if (!_412)
            {
                float _438 = _210 * as_type<float>(_310);
                float _440 = _204 * as_type<float>(_310);
                float _442 = _208 * as_type<float>(_310);
                float _444 = _142 * as_type<float>(_310);
                float _446 = _210 * as_type<float>(_350);
                float _448 = _204 * as_type<float>(_350);
                float _450 = _142 * as_type<float>(_350);
                float _452 = fma(_200, as_type<float>(_300), _438);
                float _454 = fma(_202, as_type<float>(_300), _440);
                float _456 = fma(_206, as_type<float>(_300), _442);
                float _458 = fma(_140, as_type<float>(_300), _444);
                float _460 = _208 * as_type<float>(_350);
                float _462 = fma(_200, as_type<float>(_340), _446);
                float _464 = fma(_202, as_type<float>(_340), _448);
                float _466 = fma(_140, as_type<float>(_340), _450);
                float _468 = _210 * as_type<float>(_390);
                float _470 = _204 * as_type<float>(_390);
                float _472 = _208 * as_type<float>(_390);
                float _474 = _142 * as_type<float>(_390);
                float _476 = fma(_206, as_type<float>(_340), _460);
                float _478 = fma(_200, as_type<float>(_380), _468);
                float _480 = fma(_202, as_type<float>(_380), _470);
                float _482 = fma(_206, as_type<float>(_380), _472);
                float _484 = fma(_140, as_type<float>(_380), _474);
                float _486 = fma(_212, as_type<float>(_320), _452);
                float _488 = fma(_214, as_type<float>(_320), _454);
                float _490 = fma(_216, as_type<float>(_320), _456);
                float _492 = fma(_144, as_type<float>(_320), _458);
                float _494 = fma(_212, as_type<float>(_360), _462);
                float _496 = fma(_214, as_type<float>(_360), _464);
                float _498 = fma(_216, as_type<float>(_360), _476);
                float _500 = fma(_144, as_type<float>(_360), _466);
                float _502 = fma(_144, as_type<float>(_400), _484);
                float _504 = fma(_216, as_type<float>(_400), _482);
                float _506 = fma(_212, as_type<float>(_400), _478);
                float _508 = fma(_214, as_type<float>(_400), _480);
                float _510 = as_type<float>(_330) + _492;
                float _512 = as_type<float>(_370) + _500;
                float _514 = as_type<float>(_410) + _502;
                _414 = as_type<int>(_486);
                _416 = as_type<int>(_488);
                _418 = as_type<int>(_490);
                _420 = as_type<int>(_510);
                _422 = _494;
                _424 = _496;
                _426 = as_type<int>(_498);
                _428 = as_type<int>(_512);
                _430 = as_type<int>(_506);
                _432 = as_type<int>(_508);
                _434 = as_type<int>(_504);
                _436 = as_type<int>(_514);
            }
            _516 = _414;
            int _518 = _416;
            _520 = _418;
            _522 = _420;
            _524 = _422;
            _526 = _424;
            int _528 = _426;
            _530 = _428;
            int _532 = _430;
            _534 = _432;
            _536 = _434;
            _538 = _436;
            _250 = !_290;
            _226 = as_type<float>(_516);
            _228 = as_type<float>(_518);
            _230 = as_type<float>(_520);
            _232 = as_type<float>(_522);
            _234 = _524;
            _236 = _526;
            _238 = as_type<float>(_528);
            _240 = as_type<float>(_530);
            _242 = as_type<float>(_532);
            _244 = as_type<float>(_534);
            _246 = as_type<float>(_536);
            _248 = as_type<float>(_538);
            _540 = as_type<float>(_518);
            _542 = as_type<float>(_532);
            _544 = as_type<float>(_528);
        } while (_250);
        _546 = _526;
        _548 = as_type<float>(_534);
        _550 = as_type<float>(_516);
        _552 = _524;
        _554 = as_type<float>(_536);
        _556 = as_type<float>(_530);
        _558 = as_type<float>(_538);
        _222 = as_type<float>(_520);
        _560 = as_type<float>(_522);
        _562 = true;
    }
    else
    {
        _540 = _202;
        _546 = _204;
        _548 = _214;
        _550 = _200;
        _552 = _210;
        _542 = _212;
        _544 = _208;
        _554 = _216;
        _556 = _142;
        _558 = _144;
        _560 = _140;
    }
    _562 = false;
    float _564 = _540;
    float _566 = _546;
    float _568 = _548;
    float _570 = _550;
    float _572 = _552;
    float _574 = _542;
    float _576 = _544;
    float _578 = _554;
    float _580 = _556;
    float _582 = _558;
    float _584 = _222;
    float _586 = _560;
    int _588 = _218 + 80;
    uint _590 = uint(int(uint(_588) >> uint(2)));
    uint _592 = uint(int(uint(int(_590)) >> uint(2)));
    int _594 = int(_590) & 3;
    float _596 = (*spvDescriptorSet0.cp_c6)._m0[int(_592)][_594];
    int _598 = int(_590) + 1;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    int _602 = _598 & 3;
    float _604 = (*spvDescriptorSet0.cp_c6)._m0[int(_600)][_602];
    int _606 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _608 = _606 + _64;
    int _610 = _218 + 64;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    uint _614 = uint(int(uint(int(_612)) >> uint(2)));
    int _616 = int(_612) & 3;
    float _618 = (*spvDescriptorSet0.cp_c6)._m0[int(_614)][_616];
    int _620 = int(_612) + 1;
    uint _622 = uint(int(uint(_620) >> uint(2)));
    int _624 = _620 & 3;
    float _626 = (*spvDescriptorSet0.cp_c6)._m0[int(_622)][_624];
    int _628 = _608 * 48;
    int _630 = _218 + 88;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.cp_c6)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.cp_c6)._m0[int(_642)][_644];
    int _648 = _218 + 72;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    uint _652 = uint(int(uint(int(_650)) >> uint(2)));
    int _654 = int(_650) & 3;
    float _656 = (*spvDescriptorSet0.cp_c6)._m0[int(_652)][_654];
    int _658 = int(_650) + 1;
    uint _660 = uint(int(uint(_658) >> uint(2)));
    int _662 = _658 & 3;
    float _664 = (*spvDescriptorSet0.cp_c6)._m0[int(_660)][_662];
    int _666 = _218 + 104;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.cp_c6)._m0[int(_670)][_672];
    int _676 = int(_668) + 1;
    uint _678 = uint(int(uint(_676) >> uint(2)));
    int _680 = _676 & 3;
    float _682 = (*spvDescriptorSet0.cp_c6)._m0[int(_678)][_680];
    int _684 = _218 + 96;
    uint _686 = uint(int(uint(_684) >> uint(2)));
    uint _688 = uint(int(uint(int(_686)) >> uint(2)));
    int _690 = int(_686) & 3;
    float _692 = (*spvDescriptorSet0.cp_c6)._m0[int(_688)][_690];
    int _694 = int(_686) + 1;
    uint _696 = uint(int(uint(_694) >> uint(2)));
    int _698 = _694 & 3;
    float _700 = (*spvDescriptorSet0.cp_c6)._m0[int(_696)][_698];
    float _702 = _564 * _596;
    float _704 = _566 * _596;
    float _706 = _568 * _596;
    float _708 = _564 * _604;
    float _710 = _568 * _604;
    int _712 = _218 + 16;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.cp_c6)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.cp_c6)._m0[int(_724)][_726];
    float _730 = fma(_570, _618, _702);
    float _732 = fma(_572, _618, _704);
    float _734 = fma(_574, _618, _706);
    float _736 = _566 * _604;
    float _738 = fma(_570, _626, _708);
    int _740 = _218 + 32;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.cp_c6)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.cp_c6)._m0[int(_752)][_754];
    float _758 = fma(_574, _626, _710);
    float _760 = fma(_572, _626, _736);
    float _762 = _564 * _638;
    float _764 = _564 * _646;
    float _766 = _566 * _638;
    float _768 = _566 * _646;
    float _770 = _568 * _638;
    int _772 = _218 + 48;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.cp_c6)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.cp_c6)._m0[int(_784)][_786];
    float _790 = _568 * _646;
    float _792 = fma(_570, _656, _762);
    float _794 = fma(_570, _664, _764);
    float _796 = fma(_572, _656, _766);
    float _798 = fma(_572, _664, _768);
    float _800 = fma(_574, _656, _770);
    int _802 = _218 + 24;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    uint _806 = uint(int(uint(int(_804)) >> uint(2)));
    int _808 = int(_804) & 3;
    float _810 = (*spvDescriptorSet0.cp_c6)._m0[int(_806)][_808];
    int _812 = int(_804) + 1;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    int _816 = _812 & 3;
    float _818 = (*spvDescriptorSet0.cp_c6)._m0[int(_814)][_816];
    float _820 = fma(_574, _664, _790);
    float _822 = fma(_576, _682, _798);
    float _824 = fma(_578, _682, _820);
    float _826 = _822 + _580;
    int _828 = _218 + 40;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    int _838 = int(_830) + 1;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    int _842 = _838 & 3;
    float _844 = (*spvDescriptorSet0.cp_c6)._m0[int(_840)][_842];
    float _846 = _824 + _582;
    float _848 = fma(_584, _692, _730);
    float _850 = fma(_584, _674, _792);
    float _852 = fma(_576, _692, _732);
    float _854 = fma(_578, _692, _734);
    float _856 = fma(_584, _682, _794);
    int _858 = _218 + 56;
    uint _860 = uint(int(uint(_858) >> uint(2)));
    uint _862 = uint(int(uint(int(_860)) >> uint(2)));
    int _864 = int(_860) & 3;
    float _866 = (*spvDescriptorSet0.cp_c6)._m0[int(_862)][_864];
    int _868 = int(_860) + 1;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    int _872 = _868 & 3;
    float _874 = (*spvDescriptorSet0.cp_c6)._m0[int(_870)][_872];
    float _876 = fma(_576, _700, _760);
    float _878 = fma(_576, _674, _796);
    float _880 = fma(_584, _700, _738);
    float _882 = fma(_578, _700, _758);
    float _884 = fma(_578, _674, _800);
    float _886 = _856 + _586;
    float _888 = _852 * _728;
    float _890 = _876 * _728;
    float _892 = _878 * _728;
    float _894 = _826 * _728;
    float _896 = fma(_848, _720, _888);
    float _898 = fma(_880, _720, _890);
    float _900 = fma(_850, _720, _892);
    float _902 = fma(_886, _720, _894);
    float _904 = _826 * _756;
    float _906 = _852 * _756;
    float _908 = _876 * _756;
    float _910 = _878 * _756;
    float _912 = fma(_886, _748, _904);
    float _914 = fma(_848, _748, _906);
    float _916 = fma(_880, _748, _908);
    float _918 = fma(_850, _748, _910);
    float _920 = _826 * _788;
    float _922 = _852 * _788;
    float _924 = _876 * _788;
    float _926 = _878 * _788;
    float _928 = fma(_886, _780, _920);
    float _930 = fma(_848, _780, _922);
    float _932 = fma(_880, _780, _924);
    float _934 = fma(_850, _780, _926);
    float _936 = fma(_846, _810, _902);
    float _938 = fma(_882, _810, _898);
    float _940 = fma(_854, _810, _896);
    float _942 = fma(_884, _810, _900);
    float _944 = _936 + _818;
    float _946 = fma(_846, _836, _912);
    float _948 = fma(_854, _836, _914);
    float _950 = fma(_882, _836, _916);
    int _952 = _628 + 16;
    float _954 = fma(_884, _836, _918);
    float _956 = _946 + _844;
    int _958 = _628 + 32;
    float _960 = fma(_846, _866, _928);
    float _962 = fma(_854, _866, _930);
    float _964 = fma(_882, _866, _932);
    float _966 = fma(_884, _866, _934);
    float _968 = _960 + _874;
    int _970 = _628 + 48;
    uint _972 = uint(int(uint(_952) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_972)] = as_type<uint>(_940);
    int _974 = _952 + 4;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_976)] = as_type<uint>(_938);
    int _978 = _952 + 8;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_980)] = as_type<uint>(_942);
    int _982 = _952 + 12;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_984)] = as_type<uint>(_944);
    uint _986 = uint(int(uint(_958) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_986)] = as_type<uint>(_948);
    int _988 = _958 + 4;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_990)] = as_type<uint>(_950);
    int _992 = _958 + 8;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_994)] = as_type<uint>(_954);
    int _996 = _958 + 12;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_998)] = as_type<uint>(_956);
    uint _1000 = uint(int(uint(_970) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1000)] = as_type<uint>(_962);
    int _1002 = _970 + 4;
    uint _1004 = uint(int(uint(_1002) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1004)] = as_type<uint>(_964);
    int _1006 = _970 + 8;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1008)] = as_type<uint>(_966);
    int _1010 = _970 + 12;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1012)] = as_type<uint>(_968);
}

