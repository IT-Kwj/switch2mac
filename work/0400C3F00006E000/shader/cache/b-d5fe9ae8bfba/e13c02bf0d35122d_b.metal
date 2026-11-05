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
int _54(thread const int& _2630, thread const int& _2631, constant _10& support_buffer)
{
    int _2634 = 1 + _2631;
    float _2636 = support_buffer._m5[_2634].x;
    bool _2638 = _2636 == 1.0;
    if (_2638)
    {
        return _2630;
    }
    float _2640 = float(_2630);
    float _2642 = _2640 * _2636;
    int _2644 = int(_2642);
    return _2644;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2665, thread const int& _2666, thread const int& _2667, thread int& _2668, thread uint& gl_SubgroupInvocationID)
{
    int _2671 = _2667 & 31;
    uint _2673 = uint(int(uint(_2667) >> uint(8)));
    int _2675 = int(_2673) & 31;
    float _2677 = as_type<float>(gl_SubgroupInvocationID);
    int _2679 = as_type<int>(_2677) & _2675;
    int _2681 = ~_2675;
    int _2683 = _2671 & _2681;
    int _2685 = _2683 | _2679;
    int _2687 = ~_2675;
    int _2689 = _2666 & _2687;
    int _2691 = _2689 | _2679;
    bool _2693 = uint(_2691) <= uint(_2685);
    _2668 = _2693 ? (-1) : 0;
    float _2695 = spvSubgroupShuffle(as_type<float>(_2665), uint(_2691));
    uint _2697 = uint(_2693 ? as_type<int>(_2695) : _2665);
    return int(_2697);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _614 = false;
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
    bool _148 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x);
    bool _150 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _152 = _104 * 2.0;
    float _154 = _98 * 2.0;
    float _156 = _100 * 2.0;
    float _158 = _102 * 2.0;
    float _160 = _102 * _152;
    float _162 = _98 * _152;
    float _164 = _100 * _152;
    float _166 = -_154;
    float _168 = fma(_98, _166, 1.0);
    float _170 = -_156;
    float _172 = fma(_100, _170, 1.0);
    float _174 = -_160;
    float _176 = fma(_100, _154, _174);
    float _178 = fma(_102, _154, _164);
    float _180 = fma(_100, _154, _160);
    float _182 = -_164;
    float _184 = fma(_102, _154, _182);
    float _186 = -_158;
    float _188 = fma(_102, _186, _172);
    float _190 = -_158;
    float _192 = fma(_102, _190, _168);
    float _194 = -_162;
    float _196 = fma(_102, _156, _194);
    float _198 = fma(_102, _156, _162);
    float _200 = -_156;
    float _202 = fma(_100, _200, _168);
    float _204 = _122 * _188;
    float _206 = _122 * _180;
    float _208 = _122 * _184;
    float _210 = _124 * _198;
    float _212 = _126 * _178;
    float _214 = _126 * _196;
    float _216 = _124 * _176;
    float _218 = _124 * _192;
    float _220 = _126 * _202;
    float _222 = _214;
    float _224 = _212;
    if (!_148)
    {
        int _226 = _66 * 48;
        int _228 = _226 + 16;
        uint _230 = uint(int(uint(_226) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_230)] = as_type<uint>(_204);
        int _232 = _226 + 4;
        uint _234 = uint(int(uint(_232) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_234)] = as_type<uint>(_216);
        int _236 = _226 + 8;
        uint _238 = uint(int(uint(_236) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_238)] = as_type<uint>(_212);
        int _240 = _226 + 12;
        uint _242 = uint(int(uint(_240) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_242)] = as_type<uint>(_142);
        int _244 = _226 + 32;
        uint _246 = uint(int(uint(_228) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_246)] = as_type<uint>(_206);
        int _248 = _228 + 4;
        uint _250 = uint(int(uint(_248) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_250)] = as_type<uint>(_218);
        int _252 = _228 + 8;
        uint _254 = uint(int(uint(_252) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_254)] = as_type<uint>(_214);
        int _256 = _228 + 12;
        uint _258 = uint(int(uint(_256) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_258)] = as_type<uint>(_144);
        uint _260 = uint(int(uint(_244) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_260)] = as_type<uint>(_208);
        int _262 = _244 + 4;
        uint _264 = uint(int(uint(_262) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_264)] = as_type<uint>(_210);
        int _266 = _244 + 8;
        uint _268 = uint(int(uint(_266) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_268)] = as_type<uint>(_220);
        int _270 = _244 + 12;
        uint _272 = uint(int(uint(_270) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_272)] = as_type<uint>(_146);
    }
    int _274 = _66 * 112;
    bool _276 = !_150;
    float _594;
    float _596;
    float _598;
    float _600;
    float _602;
    float _604;
    float _606;
    float _608;
    float _610;
    float _612;
    if (!_276)
    {
        int _278 = 0;
        float _280 = _204;
        float _282 = _216;
        float _284 = _212;
        float _286 = _142;
        float _288 = _206;
        float _290 = _218;
        float _292 = _214;
        float _294 = _144;
        float _296 = _208;
        float _298 = _210;
        float _300 = _220;
        float _302 = _146;
        bool _304;
        int _352;
        int _362;
        int _372;
        int _382;
        int _392;
        int _402;
        int _412;
        int _422;
        int _432;
        int _442;
        int _452;
        int _462;
        float _570;
        float _574;
        int _576;
        int _580;
        int _582;
        int _584;
        int _588;
        int _590;
        int _592;
        do
        {
            int _306 = _278;
            float _308 = _280;
            int _310 = as_type<int>(_282);
            float _312 = _284;
            int _314 = as_type<int>(_286);
            int _316 = as_type<int>(_288);
            int _318 = as_type<int>(_290);
            int _320 = as_type<int>(_292);
            int _322 = as_type<int>(_294);
            int _324 = as_type<int>(_296);
            int _326 = as_type<int>(_298);
            int _328 = as_type<int>(_300);
            int _330 = as_type<int>(_302);
            uint _332 = uint(int(uint(_274) >> uint(2)));
            uint _334 = uint(int(uint(int(_332)) >> uint(2)));
            int _336 = int(_332) & 3;
            float _338 = (*spvDescriptorSet0.cp_c6)._m0[int(_334)][_336];
            bool _340 = _66 != 0;
            int _342 = _306 + 1;
            bool _344 = uint(_342) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _346 = as_type<int>(_308);
            int _348 = as_type<int>(_338);
            int _350 = 31;
            int _1494 = _56(_346, _348, _350, _352, gl_SubgroupInvocationID);
            int _354 = _1494;
            int _356 = _310;
            int _358 = as_type<int>(_338);
            int _360 = 31;
            int _1498 = _56(_356, _358, _360, _362, gl_SubgroupInvocationID);
            int _364 = _1498;
            int _366 = as_type<int>(_312);
            int _368 = as_type<int>(_338);
            int _370 = 31;
            int _1503 = _56(_366, _368, _370, _372, gl_SubgroupInvocationID);
            int _374 = _1503;
            int _376 = _314;
            int _378 = as_type<int>(_338);
            int _380 = 31;
            int _1507 = _56(_376, _378, _380, _382, gl_SubgroupInvocationID);
            int _384 = _1507;
            int _386 = _316;
            int _388 = as_type<int>(_338);
            int _390 = 31;
            int _1511 = _56(_386, _388, _390, _392, gl_SubgroupInvocationID);
            int _394 = _1511;
            int _396 = _318;
            int _398 = as_type<int>(_338);
            int _400 = 31;
            int _1515 = _56(_396, _398, _400, _402, gl_SubgroupInvocationID);
            int _404 = _1515;
            int _406 = _320;
            int _408 = as_type<int>(_338);
            int _410 = 31;
            int _1519 = _56(_406, _408, _410, _412, gl_SubgroupInvocationID);
            int _414 = _1519;
            int _416 = _322;
            int _418 = as_type<int>(_338);
            int _420 = 31;
            int _1523 = _56(_416, _418, _420, _422, gl_SubgroupInvocationID);
            int _424 = _1523;
            int _426 = _324;
            int _428 = as_type<int>(_338);
            int _430 = 31;
            int _1527 = _56(_426, _428, _430, _432, gl_SubgroupInvocationID);
            int _434 = _1527;
            int _436 = _326;
            int _438 = as_type<int>(_338);
            int _440 = 31;
            int _1531 = _56(_436, _438, _440, _442, gl_SubgroupInvocationID);
            int _444 = _1531;
            int _446 = _328;
            int _448 = as_type<int>(_338);
            int _450 = 31;
            int _1535 = _56(_446, _448, _450, _452, gl_SubgroupInvocationID);
            int _454 = _1535;
            int _456 = _330;
            int _458 = as_type<int>(_338);
            int _460 = 31;
            int _1539 = _56(_456, _458, _460, _462, gl_SubgroupInvocationID);
            int _464 = _1539;
            bool _466 = !_340;
            _278 = _342;
            float _468 = _308;
            int _470 = _310;
            float _472 = _312;
            int _474 = _314;
            int _476 = _316;
            int _478 = _318;
            int _480 = _320;
            int _482 = _322;
            int _484 = _324;
            int _486 = _326;
            int _488 = _328;
            int _490 = _330;
            if (!_466)
            {
                float _492 = _144 * as_type<float>(_364);
                float _494 = _214 * as_type<float>(_404);
                float _496 = _218 * as_type<float>(_404);
                float _498 = _144 * as_type<float>(_404);
                float _500 = fma(_142, as_type<float>(_354), _492);
                float _502 = _206 * as_type<float>(_404);
                float _504 = _206 * as_type<float>(_364);
                float _506 = _218 * as_type<float>(_364);
                float _508 = _214 * as_type<float>(_364);
                float _510 = fma(_212, as_type<float>(_394), _494);
                float _512 = fma(_204, as_type<float>(_394), _502);
                float _514 = fma(_216, as_type<float>(_394), _496);
                float _516 = fma(_142, as_type<float>(_394), _498);
                float _518 = _206 * as_type<float>(_444);
                float _520 = _218 * as_type<float>(_444);
                float _522 = _144 * as_type<float>(_444);
                float _524 = fma(_204, as_type<float>(_354), _504);
                float _526 = fma(_216, as_type<float>(_354), _506);
                float _528 = fma(_212, as_type<float>(_354), _508);
                float _530 = fma(_204, as_type<float>(_434), _518);
                float _532 = _214 * as_type<float>(_444);
                float _534 = fma(_216, as_type<float>(_434), _520);
                float _536 = fma(_142, as_type<float>(_434), _522);
                float _538 = fma(_208, as_type<float>(_374), _524);
                float _540 = fma(_210, as_type<float>(_374), _526);
                float _542 = fma(_220, as_type<float>(_374), _528);
                float _544 = fma(_146, as_type<float>(_374), _500);
                float _546 = fma(_208, as_type<float>(_414), _512);
                float _548 = fma(_210, as_type<float>(_414), _514);
                float _550 = fma(_220, as_type<float>(_414), _510);
                float _552 = fma(_208, as_type<float>(_454), _530);
                float _554 = fma(_212, as_type<float>(_434), _532);
                float _556 = fma(_146, as_type<float>(_414), _516);
                float _558 = fma(_146, as_type<float>(_454), _536);
                float _560 = fma(_210, as_type<float>(_454), _534);
                float _562 = fma(_220, as_type<float>(_454), _554);
                float _564 = as_type<float>(_384) + _544;
                float _566 = as_type<float>(_424) + _556;
                float _568 = as_type<float>(_464) + _558;
                _468 = _538;
                _470 = as_type<int>(_540);
                _472 = _542;
                _474 = as_type<int>(_564);
                _476 = as_type<int>(_546);
                _478 = as_type<int>(_548);
                _480 = as_type<int>(_550);
                _482 = as_type<int>(_566);
                _484 = as_type<int>(_552);
                _486 = as_type<int>(_560);
                _488 = as_type<int>(_562);
                _490 = as_type<int>(_568);
            }
            _570 = _468;
            int _572 = _470;
            _574 = _472;
            _576 = _474;
            int _578 = _476;
            _580 = _478;
            _582 = _480;
            _584 = _482;
            int _586 = _484;
            _588 = _486;
            _590 = _488;
            _592 = _490;
            _304 = !_344;
            _280 = _570;
            _282 = as_type<float>(_572);
            _284 = _574;
            _286 = as_type<float>(_576);
            _288 = as_type<float>(_578);
            _290 = as_type<float>(_580);
            _292 = as_type<float>(_582);
            _294 = as_type<float>(_584);
            _296 = as_type<float>(_586);
            _298 = as_type<float>(_588);
            _300 = as_type<float>(_590);
            _302 = as_type<float>(_592);
            _594 = as_type<float>(_572);
            _596 = as_type<float>(_578);
            _598 = as_type<float>(_586);
        } while (_304);
        _600 = as_type<float>(_580);
        _602 = as_type<float>(_588);
        _604 = _570;
        _222 = as_type<float>(_582);
        _224 = _574;
        _606 = as_type<float>(_590);
        _608 = as_type<float>(_584);
        _610 = as_type<float>(_576);
        _612 = as_type<float>(_592);
        _614 = true;
    }
    else
    {
        _594 = _216;
        _600 = _218;
        _602 = _210;
        _604 = _204;
        _596 = _206;
        _598 = _208;
        _606 = _220;
        _608 = _144;
        _610 = _142;
        _612 = _146;
    }
    _614 = false;
    float _616 = _594;
    float _618 = _600;
    float _620 = _602;
    float _622 = _604;
    float _624 = _596;
    float _626 = _598;
    float _628 = _222;
    float _630 = _224;
    float _632 = _606;
    float _634 = _608;
    float _636 = _610;
    float _638 = _612;
    int _640 = _274 + 80;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.cp_c6)._m0[int(_644)][_646];
    int _650 = int(_642) + 1;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    int _654 = _650 & 3;
    float _656 = (*spvDescriptorSet0.cp_c6)._m0[int(_652)][_654];
    int _658 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _660 = _658 + _66;
    int _662 = _274 + 64;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    uint _666 = uint(int(uint(int(_664)) >> uint(2)));
    int _668 = int(_664) & 3;
    float _670 = (*spvDescriptorSet0.cp_c6)._m0[int(_666)][_668];
    int _672 = int(_664) + 1;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    int _676 = _672 & 3;
    float _678 = (*spvDescriptorSet0.cp_c6)._m0[int(_674)][_676];
    int _680 = _660 * 48;
    int _682 = _274 + 88;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    uint _686 = uint(int(uint(int(_684)) >> uint(2)));
    int _688 = int(_684) & 3;
    float _690 = (*spvDescriptorSet0.cp_c6)._m0[int(_686)][_688];
    int _692 = int(_684) + 1;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    int _696 = _692 & 3;
    float _698 = (*spvDescriptorSet0.cp_c6)._m0[int(_694)][_696];
    int _700 = _274 + 72;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    uint _704 = uint(int(uint(int(_702)) >> uint(2)));
    int _706 = int(_702) & 3;
    float _708 = (*spvDescriptorSet0.cp_c6)._m0[int(_704)][_706];
    int _710 = int(_702) + 1;
    uint _712 = uint(int(uint(_710) >> uint(2)));
    int _714 = _710 & 3;
    float _716 = (*spvDescriptorSet0.cp_c6)._m0[int(_712)][_714];
    int _718 = _274 + 96;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.cp_c6)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    int _736 = _274 + 104;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.cp_c6)._m0[int(_740)][_742];
    int _746 = int(_738) + 1;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    int _750 = _746 & 3;
    float _752 = (*spvDescriptorSet0.cp_c6)._m0[int(_748)][_750];
    float _754 = _616 * _648;
    float _756 = _618 * _648;
    float _758 = _620 * _648;
    int _760 = _274 + 16;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    uint _764 = uint(int(uint(int(_762)) >> uint(2)));
    int _766 = int(_762) & 3;
    float _768 = (*spvDescriptorSet0.cp_c6)._m0[int(_764)][_766];
    int _770 = int(_762) + 1;
    uint _772 = uint(int(uint(_770) >> uint(2)));
    int _774 = _770 & 3;
    float _776 = (*spvDescriptorSet0.cp_c6)._m0[int(_772)][_774];
    float _778 = _620 * _656;
    float _780 = fma(_622, _670, _754);
    float _782 = fma(_624, _670, _756);
    float _784 = fma(_626, _670, _758);
    float _786 = _616 * _656;
    int _788 = _274 + 32;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    uint _792 = uint(int(uint(int(_790)) >> uint(2)));
    int _794 = int(_790) & 3;
    float _796 = (*spvDescriptorSet0.cp_c6)._m0[int(_792)][_794];
    int _798 = int(_790) + 1;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    int _802 = _798 & 3;
    float _804 = (*spvDescriptorSet0.cp_c6)._m0[int(_800)][_802];
    float _806 = fma(_626, _678, _778);
    float _808 = _618 * _656;
    float _810 = fma(_622, _678, _786);
    float _812 = _616 * _690;
    float _814 = _618 * _690;
    float _816 = _616 * _698;
    float _818 = _618 * _698;
    int _820 = _274 + 48;
    uint _822 = uint(int(uint(_820) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    float _838 = _620 * _690;
    float _840 = _620 * _698;
    float _842 = fma(_624, _678, _808);
    float _844 = fma(_622, _708, _812);
    float _846 = fma(_622, _716, _816);
    float _848 = fma(_624, _708, _814);
    float _850 = fma(_624, _716, _818);
    float _852 = fma(_626, _708, _838);
    float _854 = fma(_626, _716, _840);
    int _856 = _274 + 24;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.cp_c6)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.cp_c6)._m0[int(_868)][_870];
    float _874 = fma(_628, _726, _782);
    float _876 = fma(_630, _726, _780);
    float _878 = fma(_632, _726, _784);
    float _880 = fma(_630, _734, _810);
    float _882 = fma(_628, _734, _842);
    float _884 = fma(_632, _734, _806);
    int _886 = _274 + 56;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.cp_c6)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.cp_c6)._m0[int(_898)][_900];
    float _904 = fma(_628, _752, _850);
    float _906 = fma(_630, _744, _844);
    float _908 = fma(_630, _752, _846);
    float _910 = fma(_628, _744, _848);
    float _912 = fma(_632, _752, _854);
    float _914 = _904 + _634;
    int _916 = _274 + 40;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    uint _920 = uint(int(uint(int(_918)) >> uint(2)));
    int _922 = int(_918) & 3;
    float _924 = (*spvDescriptorSet0.cp_c6)._m0[int(_920)][_922];
    int _926 = int(_918) + 1;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    int _930 = _926 & 3;
    float _932 = (*spvDescriptorSet0.cp_c6)._m0[int(_928)][_930];
    float _934 = fma(_632, _744, _852);
    float _936 = _908 + _636;
    float _938 = _912 + _638;
    float _940 = _874 * _776;
    float _942 = _882 * _776;
    float _944 = _910 * _776;
    float _946 = _914 * _776;
    float _948 = fma(_876, _768, _940);
    float _950 = fma(_880, _768, _942);
    float _952 = fma(_906, _768, _944);
    float _954 = fma(_936, _768, _946);
    float _956 = _914 * _804;
    float _958 = _882 * _804;
    float _960 = _874 * _804;
    float _962 = _910 * _804;
    float _964 = fma(_936, _796, _956);
    float _966 = fma(_880, _796, _958);
    float _968 = fma(_876, _796, _960);
    float _970 = fma(_906, _796, _962);
    float _972 = _914 * _836;
    float _974 = _882 * _836;
    float _976 = _874 * _836;
    float _978 = _910 * _836;
    float _980 = fma(_936, _828, _972);
    float _982 = fma(_880, _828, _974);
    float _984 = fma(_876, _828, _976);
    float _986 = fma(_906, _828, _978);
    float _988 = fma(_938, _864, _954);
    float _990 = fma(_878, _864, _948);
    float _992 = fma(_884, _864, _950);
    float _994 = fma(_934, _864, _952);
    float _996 = _988 + _872;
    float _998 = fma(_938, _894, _980);
    float _1000 = fma(_884, _894, _982);
    float _1002 = fma(_878, _894, _984);
    float _1004 = fma(_934, _894, _986);
    int _1006 = _680 + 16;
    float _1008 = fma(_938, _924, _964);
    float _1010 = fma(_884, _924, _966);
    float _1012 = _998 + _902;
    float _1014 = fma(_878, _924, _968);
    float _1016 = fma(_934, _924, _970);
    float _1018 = _1008 + _932;
    int _1020 = _680 + 32;
    uint _1022 = uint(int(uint(_1006) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1022)] = as_type<uint>(_990);
    int _1024 = _1006 + 4;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1026)] = as_type<uint>(_992);
    int _1028 = _1006 + 8;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1030)] = as_type<uint>(_994);
    int _1032 = _1006 + 12;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1034)] = as_type<uint>(_996);
    int _1036 = _680 + 48;
    uint _1038 = uint(int(uint(_1020) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1038)] = as_type<uint>(_1014);
    int _1040 = _1020 + 4;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1042)] = as_type<uint>(_1010);
    int _1044 = _1020 + 8;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1046)] = as_type<uint>(_1016);
    int _1048 = _1020 + 12;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1050)] = as_type<uint>(_1018);
    uint _1052 = uint(int(uint(_1036) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1052)] = as_type<uint>(_1002);
    int _1054 = _1036 + 4;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1056)] = as_type<uint>(_1000);
    int _1058 = _1036 + 8;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1060)] = as_type<uint>(_1004);
    int _1062 = _1036 + 12;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1064)] = as_type<uint>(_1012);
}

