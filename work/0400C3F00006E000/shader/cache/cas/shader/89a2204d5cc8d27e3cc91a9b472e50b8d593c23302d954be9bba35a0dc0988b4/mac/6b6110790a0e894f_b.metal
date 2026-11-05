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
int _52(thread const int& _2690, thread const int& _2691, constant _10& support_buffer)
{
    int _2694 = 1 + _2691;
    float _2696 = support_buffer._m5[_2694].x;
    bool _2698 = _2696 == 1.0;
    if (_2698)
    {
        return _2690;
    }
    float _2700 = float(_2690);
    float _2702 = _2700 * _2696;
    int _2704 = int(_2702);
    return _2704;
}

static inline __attribute__((always_inline))
int _54(thread const int& _2725, thread const int& _2726, thread const int& _2727, thread int& _2728, thread uint& gl_SubgroupInvocationID)
{
    int _2731 = _2727 & 31;
    uint _2733 = uint(int(uint(_2727) >> uint(8)));
    int _2735 = int(_2733) & 31;
    float _2737 = as_type<float>(gl_SubgroupInvocationID);
    int _2739 = as_type<int>(_2737) & _2735;
    int _2741 = ~_2735;
    int _2743 = _2731 & _2741;
    int _2745 = _2743 | _2739;
    int _2747 = ~_2735;
    int _2749 = _2726 & _2747;
    int _2751 = _2749 | _2739;
    bool _2753 = uint(_2751) <= uint(_2745);
    _2728 = _2753 ? (-1) : 0;
    float _2755 = spvSubgroupShuffle(as_type<float>(_2725), uint(_2751));
    uint _2757 = uint(_2753 ? as_type<int>(_2755) : _2725);
    return int(_2757);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _678 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = _64 & 31;
    bool _72 = _70 == 0;
    bool _74 = uint(_70) < 32u;
    int _76 = 32 - _70;
    int _78 = _70 - 32;
    int _80 = 1 << _70;
    uint _83 = uint(int(uint(0) >> uint(_76)));
    int _85 = _80 | int(_83);
    int _87 = _72 ? 1 : _85;
    bool _89 = uint(_78) < 32u;
    int _91 = 0 << _78;
    int _93 = _89 ? _91 : 0;
    int _95 = _74 ? _87 : _93;
    int _97 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _99 = _97 + 32;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = _95 & as_type<int>(_107);
    bool _111 = _109 != 0;
    float _113 = 0.0;
    float _115 = _107;
    if (!_111)
    {
        _113 = 0.0;
    }
    float _117 = _113;
    float _119 = 0.0;
    float _121 = 0.0;
    float _123 = _117;
    if (!_111)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _125 = _119;
    float _127 = _121;
    float _129 = 0.0;
    float _131 = 0.0;
    float _133 = _127;
    float _135 = _125;
    if (!_111)
    {
        _129 = 0.0;
        _131 = 0.0;
    }
    float _137 = _129;
    float _139 = _131;
    float _141 = 0.0;
    float _143 = _137;
    float _145 = _139;
    if (!_111)
    {
        _115 = 0.0;
        _141 = 0.0;
    }
    float _147 = _115;
    float _149 = _141;
    float _151 = 0.0;
    float _153 = 0.0;
    float _155 = _147;
    float _157 = _149;
    if (!_111)
    {
        _151 = 0.0;
        _153 = 0.0;
    }
    float _159 = _151;
    float _161 = _153;
    float _163 = 0.0;
    float _165 = _159;
    float _167 = _161;
    if (!_111)
    {
        _163 = 0.0;
    }
    float _169 = _163;
    bool _171 = !_111;
    float _173 = _169;
    if (!_171)
    {
        uint _175 = uint(int(uint(_97) >> uint(2)));
        uint _177 = uint(int(uint(int(_175)) >> uint(2)));
        int _179 = int(_175) & 3;
        float _181 = (*spvDescriptorSet0.cp_c5)._m0[int(_177)][_179];
        int _183 = _64;
        int _185 = 0;
        int _187 = _52(_183, _185, (*spvDescriptorSet0.support_buffer));
        int _189 = as_type<int>(_181);
        int _191 = 0;
        int _193 = _52(_189, _191, (*spvDescriptorSet0.support_buffer));
        int3 _1299 = int3(_187, _193, 1);
        float4 _196 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1299.xy), uint(_1299.z), 0).xyzw;
        float _198 = _196.x;
        float _200 = _196.y;
        float _202 = _196.z;
        float _204 = _196.w;
        int _206 = _64;
        int _208 = 0;
        int _210 = _52(_206, _208, (*spvDescriptorSet0.support_buffer));
        int _212 = as_type<int>(_181);
        int _214 = 0;
        int _216 = _52(_212, _214, (*spvDescriptorSet0.support_buffer));
        int3 _1319 = int3(_210, _216, 0);
        float3 _220 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1319.xy), uint(_1319.z), 0).xyz;
        float _222 = _220.x;
        float _224 = _220.y;
        float _226 = _220.z;
        int _228 = _64;
        int _230 = 0;
        int _232 = _52(_228, _230, (*spvDescriptorSet0.support_buffer));
        int _234 = as_type<int>(_181);
        int _236 = 0;
        int _238 = _52(_234, _236, (*spvDescriptorSet0.support_buffer));
        int3 _1337 = int3(_232, _238, 2);
        float3 _240 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1337.xy), uint(_1337.z), 0).xyz;
        float _242 = _240.x;
        float _244 = _240.y;
        float _246 = _240.z;
        float _248 = _204 * 2.0;
        _165 = _198;
        _173 = _202;
        _133 = _248;
        _167 = _200;
        _143 = _222;
        _145 = _224;
        _123 = _226;
        _135 = _246;
        _155 = _244;
        _157 = _242;
    }
    float _250 = _165;
    float _252 = _173;
    float _254 = _133;
    float _256 = _167;
    float _258 = _143;
    float _260 = _145;
    float _262 = _123;
    float _264 = _135;
    float _266 = _155;
    float _268 = _157;
    float _270 = _250 * 2.0;
    float _272 = _252 * _254;
    bool _274 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _276 = _256 * _256;
    float _278 = _250 * _250;
    float _280 = _256 * _254;
    float _282 = -_272;
    float _284 = fma(_270, _256, _282);
    float _286 = fma(_270, _256, _272);
    float _288 = _250 * _254;
    float _290 = _256 * 2.0;
    float _292 = _252 * _252;
    float _294 = fma(_276, -2.0, 1.0);
    float _296 = fma(_278, -2.0, 1.0);
    float _298 = fma(_270, _252, _280);
    float _300 = -_280;
    float _302 = fma(_270, _252, _300);
    float _304 = -_288;
    float _306 = fma(_290, _252, _304);
    float _308 = fma(_290, _252, _288);
    float _310 = fma(_292, -2.0, _294);
    float _312 = fma(_292, -2.0, _296);
    float _314 = fma(_276, -2.0, _296);
    float _316 = _286 * _258;
    float _318 = _302 * _258;
    float _320 = _310 * _258;
    float _322 = _284 * _260;
    float _324 = _308 * _260;
    float _326 = _298 * _262;
    float _328 = _306 * _262;
    float _330 = _312 * _260;
    float _332 = _314 * _262;
    int _334 = _64 * 112;
    bool _336 = !_274;
    float _338 = _326;
    float _656;
    float _658;
    float _660;
    float _662;
    float _664;
    float _666;
    float _668;
    float _670;
    float _672;
    float _674;
    float _676;
    if (!_336)
    {
        int _340 = 0;
        float _342 = _320;
        float _344 = _322;
        float _346 = _326;
        float _348 = _268;
        float _350 = _316;
        float _352 = _330;
        float _354 = _328;
        float _356 = _266;
        float _358 = _318;
        float _360 = _324;
        float _362 = _332;
        float _364 = _264;
        bool _366;
        int _414;
        int _424;
        int _434;
        int _444;
        int _454;
        int _464;
        int _474;
        int _484;
        int _494;
        int _504;
        int _514;
        int _524;
        int _636;
        int _638;
        int _640;
        int _642;
        int _644;
        int _646;
        float _650;
        int _652;
        int _654;
        do
        {
            int _368 = _340;
            int _370 = as_type<int>(_342);
            int _372 = as_type<int>(_344);
            int _374 = as_type<int>(_346);
            int _376 = as_type<int>(_348);
            int _378 = as_type<int>(_350);
            int _380 = as_type<int>(_352);
            int _382 = as_type<int>(_354);
            int _384 = as_type<int>(_356);
            int _386 = as_type<int>(_358);
            float _388 = _360;
            int _390 = as_type<int>(_362);
            int _392 = as_type<int>(_364);
            uint _394 = uint(int(uint(_334) >> uint(2)));
            uint _396 = uint(int(uint(int(_394)) >> uint(2)));
            int _398 = int(_394) & 3;
            float _400 = (*spvDescriptorSet0.cp_c6)._m0[int(_396)][_398];
            bool _402 = _64 != 0;
            int _404 = _368 + 1;
            bool _406 = uint(_404) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _408 = _370;
            int _410 = as_type<int>(_400);
            int _412 = 31;
            int _1545 = _54(_408, _410, _412, _414, gl_SubgroupInvocationID);
            int _416 = _1545;
            int _418 = _372;
            int _420 = as_type<int>(_400);
            int _422 = 31;
            int _1549 = _54(_418, _420, _422, _424, gl_SubgroupInvocationID);
            int _426 = _1549;
            int _428 = _374;
            int _430 = as_type<int>(_400);
            int _432 = 31;
            int _1553 = _54(_428, _430, _432, _434, gl_SubgroupInvocationID);
            int _436 = _1553;
            int _438 = _376;
            int _440 = as_type<int>(_400);
            int _442 = 31;
            int _1557 = _54(_438, _440, _442, _444, gl_SubgroupInvocationID);
            int _446 = _1557;
            int _448 = _378;
            int _450 = as_type<int>(_400);
            int _452 = 31;
            int _1561 = _54(_448, _450, _452, _454, gl_SubgroupInvocationID);
            int _456 = _1561;
            int _458 = _380;
            int _460 = as_type<int>(_400);
            int _462 = 31;
            int _1565 = _54(_458, _460, _462, _464, gl_SubgroupInvocationID);
            int _466 = _1565;
            int _468 = _382;
            int _470 = as_type<int>(_400);
            int _472 = 31;
            int _1569 = _54(_468, _470, _472, _474, gl_SubgroupInvocationID);
            int _476 = _1569;
            int _478 = _384;
            int _480 = as_type<int>(_400);
            int _482 = 31;
            int _1573 = _54(_478, _480, _482, _484, gl_SubgroupInvocationID);
            int _486 = _1573;
            int _488 = _386;
            int _490 = as_type<int>(_400);
            int _492 = 31;
            int _1577 = _54(_488, _490, _492, _494, gl_SubgroupInvocationID);
            int _496 = _1577;
            int _498 = as_type<int>(_388);
            int _500 = as_type<int>(_400);
            int _502 = 31;
            int _1582 = _54(_498, _500, _502, _504, gl_SubgroupInvocationID);
            int _506 = _1582;
            int _508 = _390;
            int _510 = as_type<int>(_400);
            int _512 = 31;
            int _1586 = _54(_508, _510, _512, _514, gl_SubgroupInvocationID);
            int _516 = _1586;
            int _518 = _392;
            int _520 = as_type<int>(_400);
            int _522 = 31;
            int _1590 = _54(_518, _520, _522, _524, gl_SubgroupInvocationID);
            int _526 = _1590;
            bool _528 = !_402;
            _340 = _404;
            int _530 = _370;
            int _532 = _372;
            int _534 = _374;
            int _536 = _376;
            int _538 = _378;
            int _540 = _380;
            int _542 = _382;
            int _544 = _384;
            int _546 = _386;
            float _548 = _388;
            int _550 = _390;
            int _552 = _392;
            if (!_528)
            {
                float _554 = _316 * as_type<float>(_426);
                float _556 = _330 * as_type<float>(_426);
                float _558 = as_type<float>(_426) * _266;
                float _560 = _330 * as_type<float>(_466);
                float _562 = fma(_320, as_type<float>(_416), _554);
                float _564 = fma(_322, as_type<float>(_416), _556);
                float _566 = fma(as_type<float>(_416), _268, _558);
                float _568 = _316 * as_type<float>(_466);
                float _570 = _328 * as_type<float>(_466);
                float _572 = as_type<float>(_466) * _266;
                float _574 = as_type<float>(_506) * _266;
                float _576 = fma(_322, as_type<float>(_456), _560);
                float _578 = _330 * as_type<float>(_506);
                float _580 = _328 * as_type<float>(_426);
                float _582 = fma(_320, as_type<float>(_456), _568);
                float _584 = fma(_326, as_type<float>(_456), _570);
                float _586 = fma(as_type<float>(_456), _268, _572);
                float _588 = _316 * as_type<float>(_506);
                float _590 = _328 * as_type<float>(_506);
                float _592 = fma(as_type<float>(_496), _268, _574);
                float _594 = fma(_322, as_type<float>(_496), _578);
                float _596 = fma(_324, as_type<float>(_436), _564);
                float _598 = fma(_326, as_type<float>(_416), _580);
                float _600 = fma(as_type<float>(_436), _264, _566);
                float _602 = fma(_318, as_type<float>(_476), _582);
                float _604 = fma(_324, as_type<float>(_476), _576);
                float _606 = fma(_332, as_type<float>(_476), _584);
                float _608 = fma(_320, as_type<float>(_496), _588);
                float _610 = fma(_326, as_type<float>(_496), _590);
                float _612 = fma(as_type<float>(_476), _264, _586);
                float _614 = fma(as_type<float>(_516), _264, _592);
                float _616 = fma(_332, as_type<float>(_436), _598);
                float _618 = as_type<float>(_446) + _600;
                float _620 = fma(_318, as_type<float>(_436), _562);
                float _622 = fma(_318, as_type<float>(_516), _608);
                float _624 = fma(_324, as_type<float>(_516), _594);
                float _626 = fma(_332, as_type<float>(_516), _610);
                float _628 = as_type<float>(_486) + _612;
                float _630 = as_type<float>(_526) + _614;
                _530 = as_type<int>(_620);
                _532 = as_type<int>(_596);
                _534 = as_type<int>(_616);
                _536 = as_type<int>(_618);
                _538 = as_type<int>(_602);
                _540 = as_type<int>(_604);
                _542 = as_type<int>(_606);
                _544 = as_type<int>(_628);
                _546 = as_type<int>(_622);
                _548 = _624;
                _550 = as_type<int>(_626);
                _552 = as_type<int>(_630);
            }
            int _632 = _530;
            int _634 = _532;
            _636 = _534;
            _638 = _536;
            _640 = _538;
            _642 = _540;
            _644 = _542;
            _646 = _544;
            int _648 = _546;
            _650 = _548;
            _652 = _550;
            _654 = _552;
            _366 = !_406;
            _342 = as_type<float>(_632);
            _344 = as_type<float>(_634);
            _346 = as_type<float>(_636);
            _348 = as_type<float>(_638);
            _350 = as_type<float>(_640);
            _352 = as_type<float>(_642);
            _354 = as_type<float>(_644);
            _356 = as_type<float>(_646);
            _358 = as_type<float>(_648);
            _360 = _650;
            _362 = as_type<float>(_652);
            _364 = as_type<float>(_654);
            _656 = as_type<float>(_634);
            _658 = as_type<float>(_632);
            _660 = as_type<float>(_648);
        } while (_366);
        _662 = as_type<float>(_642);
        _664 = _650;
        _666 = as_type<float>(_640);
        _668 = as_type<float>(_644);
        _670 = as_type<float>(_646);
        _338 = as_type<float>(_636);
        _672 = as_type<float>(_652);
        _674 = as_type<float>(_638);
        _676 = as_type<float>(_654);
        _678 = true;
    }
    else
    {
        _656 = _322;
        _662 = _330;
        _664 = _324;
        _658 = _320;
        _666 = _316;
        _660 = _318;
        _668 = _328;
        _670 = _266;
        _672 = _332;
        _674 = _268;
        _676 = _264;
    }
    _678 = false;
    float _680 = _656;
    float _682 = _662;
    float _684 = _664;
    float _686 = _658;
    float _688 = _666;
    float _690 = _660;
    float _692 = _668;
    float _694 = _670;
    float _696 = _338;
    float _698 = _672;
    float _700 = _674;
    float _702 = _676;
    int _704 = _334 + 80;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.cp_c6)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.cp_c6)._m0[int(_716)][_718];
    int _722 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _724 = _722 + _64;
    int _726 = _334 + 64;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    uint _730 = uint(int(uint(int(_728)) >> uint(2)));
    int _732 = int(_728) & 3;
    float _734 = (*spvDescriptorSet0.cp_c6)._m0[int(_730)][_732];
    int _736 = int(_728) + 1;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    int _740 = _736 & 3;
    float _742 = (*spvDescriptorSet0.cp_c6)._m0[int(_738)][_740];
    int _744 = _724 * 48;
    int _746 = _334 + 88;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.cp_c6)._m0[int(_750)][_752];
    int _756 = int(_748) + 1;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    int _760 = _756 & 3;
    float _762 = (*spvDescriptorSet0.cp_c6)._m0[int(_758)][_760];
    int _764 = _334 + 72;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.cp_c6)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.cp_c6)._m0[int(_776)][_778];
    int _782 = _334 + 104;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    uint _786 = uint(int(uint(int(_784)) >> uint(2)));
    int _788 = int(_784) & 3;
    float _790 = (*spvDescriptorSet0.cp_c6)._m0[int(_786)][_788];
    int _792 = int(_784) + 1;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    int _796 = _792 & 3;
    float _798 = (*spvDescriptorSet0.cp_c6)._m0[int(_794)][_796];
    int _800 = _334 + 96;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    uint _804 = uint(int(uint(int(_802)) >> uint(2)));
    int _806 = int(_802) & 3;
    float _808 = (*spvDescriptorSet0.cp_c6)._m0[int(_804)][_806];
    int _810 = int(_802) + 1;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    int _814 = _810 & 3;
    float _816 = (*spvDescriptorSet0.cp_c6)._m0[int(_812)][_814];
    float _818 = _680 * _712;
    float _820 = _682 * _712;
    float _822 = _684 * _712;
    float _824 = _680 * _720;
    float _826 = _684 * _720;
    int _828 = _334 + 16;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    uint _832 = uint(int(uint(int(_830)) >> uint(2)));
    int _834 = int(_830) & 3;
    float _836 = (*spvDescriptorSet0.cp_c6)._m0[int(_832)][_834];
    int _838 = int(_830) + 1;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    int _842 = _838 & 3;
    float _844 = (*spvDescriptorSet0.cp_c6)._m0[int(_840)][_842];
    float _846 = fma(_686, _734, _818);
    float _848 = fma(_688, _734, _820);
    float _850 = fma(_690, _734, _822);
    float _852 = _682 * _720;
    float _854 = fma(_686, _742, _824);
    int _856 = _334 + 32;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.cp_c6)._m0[int(_860)][_862];
    int _866 = int(_858) + 1;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    int _870 = _866 & 3;
    float _872 = (*spvDescriptorSet0.cp_c6)._m0[int(_868)][_870];
    float _874 = fma(_690, _742, _826);
    float _876 = fma(_688, _742, _852);
    float _878 = _680 * _754;
    float _880 = _680 * _762;
    float _882 = _682 * _754;
    float _884 = _682 * _762;
    float _886 = _684 * _754;
    int _888 = _334 + 48;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.cp_c6)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.cp_c6)._m0[int(_900)][_902];
    float _906 = _684 * _762;
    float _908 = fma(_686, _772, _878);
    float _910 = fma(_686, _780, _880);
    float _912 = fma(_688, _772, _882);
    float _914 = fma(_688, _780, _884);
    float _916 = fma(_690, _772, _886);
    int _918 = _334 + 24;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    uint _922 = uint(int(uint(int(_920)) >> uint(2)));
    int _924 = int(_920) & 3;
    float _926 = (*spvDescriptorSet0.cp_c6)._m0[int(_922)][_924];
    int _928 = int(_920) + 1;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    int _932 = _928 & 3;
    float _934 = (*spvDescriptorSet0.cp_c6)._m0[int(_930)][_932];
    float _936 = fma(_690, _780, _906);
    float _938 = fma(_692, _798, _914);
    float _940 = fma(_692, _790, _912);
    float _942 = _938 + _694;
    int _944 = _334 + 40;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    uint _948 = uint(int(uint(int(_946)) >> uint(2)));
    int _950 = int(_946) & 3;
    float _952 = (*spvDescriptorSet0.cp_c6)._m0[int(_948)][_950];
    int _954 = int(_946) + 1;
    uint _956 = uint(int(uint(_954) >> uint(2)));
    int _958 = _954 & 3;
    float _960 = (*spvDescriptorSet0.cp_c6)._m0[int(_956)][_958];
    float _962 = fma(_696, _808, _846);
    float _964 = fma(_696, _790, _908);
    float _966 = fma(_696, _798, _910);
    float _968 = fma(_692, _808, _848);
    float _970 = fma(_692, _816, _876);
    int _972 = _334 + 56;
    uint _974 = uint(int(uint(_972) >> uint(2)));
    uint _976 = uint(int(uint(int(_974)) >> uint(2)));
    int _978 = int(_974) & 3;
    float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
    int _982 = int(_974) + 1;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    int _986 = _982 & 3;
    float _988 = (*spvDescriptorSet0.cp_c6)._m0[int(_984)][_986];
    float _990 = fma(_696, _816, _854);
    float _992 = fma(_698, _808, _850);
    float _994 = fma(_698, _816, _874);
    float _996 = fma(_698, _798, _936);
    float _998 = fma(_698, _790, _916);
    float _1000 = _966 + _700;
    float _1002 = _968 * _844;
    float _1004 = _970 * _844;
    float _1006 = _940 * _844;
    float _1008 = _942 * _844;
    float _1010 = fma(_962, _836, _1002);
    float _1012 = fma(_990, _836, _1004);
    float _1014 = fma(_964, _836, _1006);
    float _1016 = fma(_1000, _836, _1008);
    float _1018 = _942 * _872;
    float _1020 = _968 * _872;
    float _1022 = _996 + _702;
    float _1024 = _970 * _872;
    float _1026 = _940 * _872;
    float _1028 = fma(_1000, _864, _1018);
    float _1030 = fma(_962, _864, _1020);
    float _1032 = fma(_990, _864, _1024);
    float _1034 = _942 * _904;
    float _1036 = _968 * _904;
    float _1038 = _970 * _904;
    float _1040 = _940 * _904;
    float _1042 = fma(_1000, _896, _1034);
    float _1044 = fma(_964, _864, _1026);
    float _1046 = fma(_962, _896, _1036);
    float _1048 = fma(_990, _896, _1038);
    float _1050 = fma(_1022, _926, _1016);
    float _1052 = fma(_964, _896, _1040);
    float _1054 = fma(_994, _926, _1012);
    float _1056 = fma(_992, _926, _1010);
    float _1058 = fma(_998, _926, _1014);
    float _1060 = _1050 + _934;
    float _1062 = fma(_1022, _952, _1028);
    float _1064 = fma(_992, _952, _1030);
    float _1066 = fma(_994, _952, _1032);
    int _1068 = _744 + 16;
    float _1070 = fma(_998, _952, _1044);
    float _1072 = _1062 + _960;
    int _1074 = _744 + 32;
    float _1076 = fma(_1022, _980, _1042);
    float _1078 = fma(_992, _980, _1046);
    float _1080 = fma(_994, _980, _1048);
    float _1082 = fma(_998, _980, _1052);
    float _1084 = _1076 + _988;
    int _1086 = _744 + 48;
    uint _1088 = uint(int(uint(_1068) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1088)] = as_type<uint>(_1056);
    int _1090 = _1068 + 4;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1092)] = as_type<uint>(_1054);
    int _1094 = _1068 + 8;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1096)] = as_type<uint>(_1058);
    int _1098 = _1068 + 12;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1100)] = as_type<uint>(_1060);
    uint _1102 = uint(int(uint(_1074) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1102)] = as_type<uint>(_1064);
    int _1104 = _1074 + 4;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1106)] = as_type<uint>(_1066);
    int _1108 = _1074 + 8;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1110)] = as_type<uint>(_1070);
    int _1112 = _1074 + 12;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1114)] = as_type<uint>(_1072);
    uint _1116 = uint(int(uint(_1086) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1116)] = as_type<uint>(_1078);
    int _1118 = _1086 + 4;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1120)] = as_type<uint>(_1080);
    int _1122 = _1086 + 8;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1124)] = as_type<uint>(_1082);
    int _1126 = _1086 + 12;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1128)] = as_type<uint>(_1084);
}

