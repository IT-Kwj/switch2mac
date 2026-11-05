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
int _54(thread const int& _3197, thread const int& _3198, constant _10& support_buffer)
{
    int _3201 = 1 + _3198;
    float _3203 = support_buffer._m5[_3201].x;
    bool _3205 = _3203 == 1.0;
    if (_3205)
    {
        return _3197;
    }
    float _3207 = float(_3197);
    float _3209 = _3207 * _3203;
    int _3211 = int(_3209);
    return _3211;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3232, thread const int& _3233, thread const int& _3234, thread int& _3235, thread uint& gl_SubgroupInvocationID)
{
    int _3238 = _3234 & 31;
    uint _3240 = uint(int(uint(_3234) >> uint(8)));
    int _3242 = int(_3240) & 31;
    float _3244 = as_type<float>(gl_SubgroupInvocationID);
    int _3246 = as_type<int>(_3244) & _3242;
    int _3248 = ~_3242;
    int _3250 = _3238 & _3248;
    int _3252 = _3250 | _3246;
    int _3254 = ~_3242;
    int _3256 = _3233 & _3254;
    int _3258 = _3256 | _3246;
    bool _3260 = uint(_3258) <= uint(_3252);
    _3235 = _3260 ? (-1) : 0;
    float _3262 = spvSubgroupShuffle(as_type<float>(_3232), uint(_3258));
    uint _3264 = uint(_3260 ? as_type<int>(_3262) : _3232);
    return int(_3264);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _870 = false;
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
    int _97 = _76 ? _89 : _95;
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    bool _101 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _103 = _99 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _97 & as_type<int>(_111);
    bool _115 = _113 != 0;
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    if (!_115)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _123 = _117;
    float _125 = _119;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _123;
    float _133 = _125;
    if (!_115)
    {
        _127 = 0.0;
        _129 = 0.0;
    }
    float _135 = _127;
    float _137 = _129;
    float _139 = 0.0;
    float _141 = _135;
    float _143 = _137;
    if (!_115)
    {
        _139 = 0.0;
    }
    float _145 = _139;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = _145;
    if (!_115)
    {
        _147 = 0.0;
        _149 = 0.0;
    }
    float _153 = _147;
    float _155 = _149;
    float _157 = _153;
    float _159 = _155;
    if (!_115)
    {
        _121 = 0.0;
    }
    float _161 = _121;
    float _163 = 0.0;
    float _165 = _161;
    if (!_115)
    {
        _163 = 0.0;
    }
    float _167 = _163;
    float _169 = 0.0;
    float _171 = _167;
    if (!_115)
    {
        _169 = 0.0;
    }
    float _173 = _169;
    bool _175 = !_115;
    float _177 = _173;
    if (!_175)
    {
        uint _179 = uint(int(uint(_99) >> uint(2)));
        uint _181 = uint(int(uint(int(_179)) >> uint(2)));
        int _183 = int(_179) & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = int(_179) + 1;
        uint _189 = uint(int(uint(_187) >> uint(2)));
        int _191 = _187 & 3;
        float _193 = (*spvDescriptorSet0.cp_c5)._m0[int(_189)][_191];
        int _195 = _66;
        int _197 = 0;
        int _199 = _54(_195, _197, (*spvDescriptorSet0.support_buffer));
        int _201 = as_type<int>(_185);
        int _203 = 0;
        int _205 = _54(_201, _203, (*spvDescriptorSet0.support_buffer));
        int3 _1516 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1516.xy), uint(_1516.z), 0).xyzw;
        float _210 = _208.x;
        float _212 = _208.y;
        float _214 = _208.z;
        float _216 = _208.w;
        int _218 = _66;
        int _220 = 0;
        int _222 = _54(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = as_type<int>(_193);
        int _226 = 0;
        int _228 = _54(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _1536 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1536.xy), uint(_1536.z), 0).xyzw;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        float _238 = _230.w;
        int _240 = _66;
        int _242 = 0;
        int _244 = _54(_240, _242, (*spvDescriptorSet0.support_buffer));
        int _246 = as_type<int>(_185);
        int _248 = 0;
        int _250 = _54(_246, _248, (*spvDescriptorSet0.support_buffer));
        int3 _1556 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1556.xy), uint(_1556.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _66;
        int _264 = 0;
        int _266 = _54(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _54(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _1574 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1574.xy), uint(_1574.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _66;
        int _284 = 0;
        int _286 = _54(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _54(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _1592 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1592.xy), uint(_1592.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _66;
        int _304 = 0;
        int _306 = _54(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _54(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _1610 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1610.xy), uint(_1610.z), 0).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        int _322 = _99 + 16;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        uint _326 = uint(int(uint(int(_324)) >> uint(2)));
        int _328 = int(_324) & 3;
        float _330 = (*spvDescriptorSet0.cp_c5)._m0[int(_326)][_328];
        float _332 = -_210;
        float _334 = _332 + _232;
        float _336 = -_212;
        float _338 = _336 + _234;
        float _340 = fma(_334, _330, _210);
        float _342 = fma(_338, _330, _212);
        float _344 = -_214;
        float _346 = _344 + _236;
        float _348 = -_256;
        float _350 = _348 + _276;
        float _352 = -_216;
        float _354 = _352 + _238;
        float _356 = -_258;
        float _358 = _356 + _278;
        float _360 = -_260;
        float _362 = _360 + _280;
        float _364 = fma(_350, _330, _256);
        float _366 = fma(_354, _330, _216);
        float _368 = -_296;
        float _370 = _368 + _316;
        float _372 = -_298;
        float _374 = _372 + _318;
        float _376 = -_300;
        float _378 = _376 + _320;
        float _380 = fma(_346, _330, _214);
        float _382 = fma(_358, _330, _258);
        float _384 = fma(_362, _330, _260);
        float _386 = fma(_370, _330, _296);
        float _388 = fma(_374, _330, _298);
        float _390 = fma(_378, _330, _300);
        float _392 = _366 * 2.0;
        _131 = _340;
        _157 = _380;
        _165 = _392;
        _141 = _342;
        _133 = _364;
        _143 = _382;
        _151 = _384;
        _171 = _386;
        _177 = _388;
        _159 = _390;
    }
    float _394 = _131;
    float _396 = _157;
    float _398 = _165;
    float _400 = _141;
    float _402 = _133;
    float _404 = _143;
    float _406 = _151;
    float _408 = _171;
    float _410 = _177;
    float _412 = _159;
    float _414 = _394 * _394;
    float _416 = _394 * 2.0;
    float _418 = _396 * _398;
    float _420 = _394 * _398;
    float _422 = _400 * _398;
    float _424 = _400 * _400;
    float _426 = -_418;
    float _428 = fma(_416, _400, _426);
    float _430 = fma(_416, _400, _418);
    float _432 = _400 * 2.0;
    float _434 = fma(_414, -2.0, 1.0);
    float _436 = _396 * _396;
    float _438 = fma(_424, -2.0, 1.0);
    float _440 = fma(_416, _396, _422);
    float _442 = -_422;
    float _444 = fma(_416, _396, _442);
    float _446 = -_420;
    float _448 = fma(_432, _396, _446);
    float _450 = fma(_432, _396, _420);
    float _452 = fma(_436, -2.0, _438);
    float _454 = fma(_436, -2.0, _434);
    float _456 = fma(_424, -2.0, _434);
    float _458 = _430 * _402;
    float _460 = _444 * _402;
    float _462 = _452 * _402;
    float _464 = _428 * _404;
    float _466 = _450 * _404;
    float _468 = _454 * _404;
    bool _470 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _472 = _440 * _406;
    float _474 = _448 * _406;
    float _476 = _456 * _406;
    float _478 = _472;
    float _480 = _408;
    if (!_101)
    {
        int _482 = _66 * 48;
        int _484 = _482 + 16;
        uint _486 = uint(int(uint(_482) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_486)] = as_type<uint>(_462);
        int _488 = _482 + 4;
        uint _490 = uint(int(uint(_488) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_490)] = as_type<uint>(_464);
        int _492 = _482 + 8;
        uint _494 = uint(int(uint(_492) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_494)] = as_type<uint>(_472);
        int _496 = _482 + 12;
        uint _498 = uint(int(uint(_496) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_498)] = as_type<uint>(_408);
        int _500 = _482 + 32;
        uint _502 = uint(int(uint(_484) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_502)] = as_type<uint>(_458);
        int _504 = _484 + 4;
        uint _506 = uint(int(uint(_504) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_506)] = as_type<uint>(_468);
        int _508 = _484 + 8;
        uint _510 = uint(int(uint(_508) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_510)] = as_type<uint>(_474);
        int _512 = _484 + 12;
        uint _514 = uint(int(uint(_512) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_514)] = as_type<uint>(_410);
        uint _516 = uint(int(uint(_500) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_516)] = as_type<uint>(_460);
        int _518 = _500 + 4;
        uint _520 = uint(int(uint(_518) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_520)] = as_type<uint>(_466);
        int _522 = _500 + 8;
        uint _524 = uint(int(uint(_522) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_524)] = as_type<uint>(_476);
        int _526 = _500 + 12;
        uint _528 = uint(int(uint(_526) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_528)] = as_type<uint>(_412);
    }
    int _530 = _66 * 112;
    bool _532 = !_470;
    float _850;
    float _852;
    float _854;
    float _856;
    float _858;
    float _860;
    float _862;
    float _864;
    float _866;
    float _868;
    if (!_532)
    {
        int _534 = 0;
        float _536 = _462;
        float _538 = _464;
        float _540 = _472;
        float _542 = _408;
        float _544 = _458;
        float _546 = _468;
        float _548 = _474;
        float _550 = _410;
        float _552 = _460;
        float _554 = _466;
        float _556 = _476;
        float _558 = _412;
        bool _560;
        int _608;
        int _618;
        int _628;
        int _638;
        int _648;
        int _658;
        int _668;
        int _678;
        int _688;
        int _698;
        int _708;
        int _718;
        int _826;
        int _830;
        int _832;
        int _836;
        int _838;
        int _840;
        int _844;
        int _846;
        int _848;
        do
        {
            int _562 = _534;
            int _564 = as_type<int>(_536);
            int _566 = as_type<int>(_538);
            int _568 = as_type<int>(_540);
            int _570 = as_type<int>(_542);
            int _572 = as_type<int>(_544);
            int _574 = as_type<int>(_546);
            int _576 = as_type<int>(_548);
            int _578 = as_type<int>(_550);
            int _580 = as_type<int>(_552);
            int _582 = as_type<int>(_554);
            int _584 = as_type<int>(_556);
            int _586 = as_type<int>(_558);
            uint _588 = uint(int(uint(_530) >> uint(2)));
            uint _590 = uint(int(uint(int(_588)) >> uint(2)));
            int _592 = int(_588) & 3;
            float _594 = (*spvDescriptorSet0.cp_c6)._m0[int(_590)][_592];
            bool _596 = _66 != 0;
            int _598 = _562 + 1;
            bool _600 = uint(_598) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _602 = _564;
            int _604 = as_type<int>(_594);
            int _606 = 31;
            int _2056 = _56(_602, _604, _606, _608, gl_SubgroupInvocationID);
            int _610 = _2056;
            int _612 = _566;
            int _614 = as_type<int>(_594);
            int _616 = 31;
            int _2060 = _56(_612, _614, _616, _618, gl_SubgroupInvocationID);
            int _620 = _2060;
            int _622 = _568;
            int _624 = as_type<int>(_594);
            int _626 = 31;
            int _2064 = _56(_622, _624, _626, _628, gl_SubgroupInvocationID);
            int _630 = _2064;
            int _632 = _570;
            int _634 = as_type<int>(_594);
            int _636 = 31;
            int _2068 = _56(_632, _634, _636, _638, gl_SubgroupInvocationID);
            int _640 = _2068;
            int _642 = _572;
            int _644 = as_type<int>(_594);
            int _646 = 31;
            int _2072 = _56(_642, _644, _646, _648, gl_SubgroupInvocationID);
            int _650 = _2072;
            int _652 = _574;
            int _654 = as_type<int>(_594);
            int _656 = 31;
            int _2076 = _56(_652, _654, _656, _658, gl_SubgroupInvocationID);
            int _660 = _2076;
            int _662 = _576;
            int _664 = as_type<int>(_594);
            int _666 = 31;
            int _2080 = _56(_662, _664, _666, _668, gl_SubgroupInvocationID);
            int _670 = _2080;
            int _672 = _578;
            int _674 = as_type<int>(_594);
            int _676 = 31;
            int _2084 = _56(_672, _674, _676, _678, gl_SubgroupInvocationID);
            int _680 = _2084;
            int _682 = _580;
            int _684 = as_type<int>(_594);
            int _686 = 31;
            int _2088 = _56(_682, _684, _686, _688, gl_SubgroupInvocationID);
            int _690 = _2088;
            int _692 = _582;
            int _694 = as_type<int>(_594);
            int _696 = 31;
            int _2092 = _56(_692, _694, _696, _698, gl_SubgroupInvocationID);
            int _700 = _2092;
            int _702 = _584;
            int _704 = as_type<int>(_594);
            int _706 = 31;
            int _2096 = _56(_702, _704, _706, _708, gl_SubgroupInvocationID);
            int _710 = _2096;
            int _712 = _586;
            int _714 = as_type<int>(_594);
            int _716 = 31;
            int _2100 = _56(_712, _714, _716, _718, gl_SubgroupInvocationID);
            int _720 = _2100;
            bool _722 = !_596;
            _534 = _598;
            int _724 = _564;
            int _726 = _566;
            int _728 = _568;
            int _730 = _570;
            int _732 = _572;
            int _734 = _574;
            int _736 = _576;
            int _738 = _578;
            int _740 = _580;
            int _742 = _582;
            int _744 = _584;
            int _746 = _586;
            if (!_722)
            {
                float _748 = as_type<float>(_620) * _410;
                float _750 = _458 * as_type<float>(_620);
                float _752 = _468 * as_type<float>(_620);
                float _754 = _474 * as_type<float>(_620);
                float _756 = as_type<float>(_660) * _410;
                float _758 = _458 * as_type<float>(_660);
                float _760 = fma(as_type<float>(_610), _408, _748);
                float _762 = fma(_462, as_type<float>(_610), _750);
                float _764 = fma(_464, as_type<float>(_610), _752);
                float _766 = fma(_472, as_type<float>(_610), _754);
                float _768 = _468 * as_type<float>(_660);
                float _770 = _474 * as_type<float>(_660);
                float _772 = fma(as_type<float>(_650), _408, _756);
                float _774 = as_type<float>(_700) * _410;
                float _776 = fma(_462, as_type<float>(_650), _758);
                float _778 = _468 * as_type<float>(_700);
                float _780 = _458 * as_type<float>(_700);
                float _782 = fma(_464, as_type<float>(_650), _768);
                float _784 = fma(_472, as_type<float>(_650), _770);
                float _786 = _474 * as_type<float>(_700);
                float _788 = fma(as_type<float>(_690), _408, _774);
                float _790 = fma(_464, as_type<float>(_690), _778);
                float _792 = fma(_462, as_type<float>(_690), _780);
                float _794 = fma(_466, as_type<float>(_630), _764);
                float _796 = fma(_476, as_type<float>(_630), _766);
                float _798 = fma(_460, as_type<float>(_630), _762);
                float _800 = fma(_460, as_type<float>(_670), _776);
                float _802 = fma(_466, as_type<float>(_670), _782);
                float _804 = fma(_476, as_type<float>(_670), _784);
                float _806 = fma(_472, as_type<float>(_690), _786);
                float _808 = fma(as_type<float>(_630), _412, _760);
                float _810 = fma(as_type<float>(_670), _412, _772);
                float _812 = fma(as_type<float>(_710), _412, _788);
                float _814 = fma(_466, as_type<float>(_710), _790);
                float _816 = fma(_460, as_type<float>(_710), _792);
                float _818 = fma(_476, as_type<float>(_710), _806);
                float _820 = as_type<float>(_640) + _808;
                float _822 = as_type<float>(_680) + _810;
                float _824 = as_type<float>(_720) + _812;
                _724 = as_type<int>(_798);
                _726 = as_type<int>(_794);
                _728 = as_type<int>(_796);
                _730 = as_type<int>(_820);
                _732 = as_type<int>(_800);
                _734 = as_type<int>(_802);
                _736 = as_type<int>(_804);
                _738 = as_type<int>(_822);
                _740 = as_type<int>(_816);
                _742 = as_type<int>(_814);
                _744 = as_type<int>(_818);
                _746 = as_type<int>(_824);
            }
            _826 = _724;
            int _828 = _726;
            _830 = _728;
            _832 = _730;
            int _834 = _732;
            _836 = _734;
            _838 = _736;
            _840 = _738;
            int _842 = _740;
            _844 = _742;
            _846 = _744;
            _848 = _746;
            _560 = !_600;
            _536 = as_type<float>(_826);
            _538 = as_type<float>(_828);
            _540 = as_type<float>(_830);
            _542 = as_type<float>(_832);
            _544 = as_type<float>(_834);
            _546 = as_type<float>(_836);
            _548 = as_type<float>(_838);
            _550 = as_type<float>(_840);
            _552 = as_type<float>(_842);
            _554 = as_type<float>(_844);
            _556 = as_type<float>(_846);
            _558 = as_type<float>(_848);
            _850 = as_type<float>(_828);
            _852 = as_type<float>(_834);
            _854 = as_type<float>(_842);
        } while (_560);
        _856 = as_type<float>(_836);
        _858 = as_type<float>(_844);
        _860 = as_type<float>(_826);
        _478 = as_type<float>(_830);
        _862 = as_type<float>(_838);
        _864 = as_type<float>(_846);
        _866 = as_type<float>(_840);
        _868 = as_type<float>(_848);
        _480 = as_type<float>(_832);
        _870 = true;
    }
    else
    {
        _850 = _464;
        _856 = _468;
        _858 = _466;
        _860 = _462;
        _852 = _458;
        _854 = _460;
        _862 = _474;
        _864 = _476;
        _866 = _410;
        _868 = _412;
    }
    _870 = false;
    float _872 = _850;
    float _874 = _856;
    float _876 = _858;
    float _878 = _860;
    float _880 = _852;
    float _882 = _854;
    float _884 = _478;
    float _886 = _862;
    float _888 = _864;
    float _890 = _866;
    float _892 = _868;
    float _894 = _480;
    int _896 = _530 + 80;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    uint _900 = uint(int(uint(int(_898)) >> uint(2)));
    int _902 = int(_898) & 3;
    float _904 = (*spvDescriptorSet0.cp_c6)._m0[int(_900)][_902];
    int _906 = int(_898) + 1;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    int _910 = _906 & 3;
    float _912 = (*spvDescriptorSet0.cp_c6)._m0[int(_908)][_910];
    int _914 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _916 = _914 + _66;
    int _918 = _530 + 64;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    uint _922 = uint(int(uint(int(_920)) >> uint(2)));
    int _924 = int(_920) & 3;
    float _926 = (*spvDescriptorSet0.cp_c6)._m0[int(_922)][_924];
    int _928 = int(_920) + 1;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    int _932 = _928 & 3;
    float _934 = (*spvDescriptorSet0.cp_c6)._m0[int(_930)][_932];
    int _936 = _530 + 88;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    uint _940 = uint(int(uint(int(_938)) >> uint(2)));
    int _942 = int(_938) & 3;
    float _944 = (*spvDescriptorSet0.cp_c6)._m0[int(_940)][_942];
    int _946 = int(_938) + 1;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    int _950 = _946 & 3;
    float _952 = (*spvDescriptorSet0.cp_c6)._m0[int(_948)][_950];
    int _954 = _530 + 72;
    uint _956 = uint(int(uint(_954) >> uint(2)));
    uint _958 = uint(int(uint(int(_956)) >> uint(2)));
    int _960 = int(_956) & 3;
    float _962 = (*spvDescriptorSet0.cp_c6)._m0[int(_958)][_960];
    int _964 = int(_956) + 1;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    int _968 = _964 & 3;
    float _970 = (*spvDescriptorSet0.cp_c6)._m0[int(_966)][_968];
    int _972 = _530 + 96;
    uint _974 = uint(int(uint(_972) >> uint(2)));
    uint _976 = uint(int(uint(int(_974)) >> uint(2)));
    int _978 = int(_974) & 3;
    float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
    int _982 = int(_974) + 1;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    int _986 = _982 & 3;
    float _988 = (*spvDescriptorSet0.cp_c6)._m0[int(_984)][_986];
    int _990 = _530 + 104;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    uint _994 = uint(int(uint(int(_992)) >> uint(2)));
    int _996 = int(_992) & 3;
    float _998 = (*spvDescriptorSet0.cp_c6)._m0[int(_994)][_996];
    int _1000 = int(_992) + 1;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    int _1004 = _1000 & 3;
    float _1006 = (*spvDescriptorSet0.cp_c6)._m0[int(_1002)][_1004];
    float _1008 = _872 * _904;
    float _1010 = _874 * _904;
    float _1012 = _876 * _904;
    int _1014 = _530 + 16;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.cp_c6)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.cp_c6)._m0[int(_1026)][_1028];
    float _1032 = _872 * _912;
    float _1034 = _876 * _912;
    float _1036 = fma(_878, _926, _1008);
    float _1038 = fma(_880, _926, _1010);
    float _1040 = fma(_882, _926, _1012);
    float _1042 = _874 * _912;
    int _1044 = _530 + 32;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.cp_c6)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.cp_c6)._m0[int(_1056)][_1058];
    float _1062 = fma(_878, _934, _1032);
    float _1064 = fma(_882, _934, _1034);
    float _1066 = fma(_880, _934, _1042);
    float _1068 = _872 * _944;
    float _1070 = _874 * _944;
    float _1072 = _872 * _952;
    float _1074 = _874 * _952;
    int _1076 = _530 + 48;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
    int _1082 = int(_1078) & 3;
    float _1084 = (*spvDescriptorSet0.cp_c6)._m0[int(_1080)][_1082];
    int _1086 = int(_1078) + 1;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    int _1090 = _1086 & 3;
    float _1092 = (*spvDescriptorSet0.cp_c6)._m0[int(_1088)][_1090];
    float _1094 = _876 * _944;
    float _1096 = _876 * _952;
    float _1098 = fma(_878, _962, _1068);
    float _1100 = fma(_880, _962, _1070);
    float _1102 = fma(_878, _970, _1072);
    float _1104 = fma(_880, _970, _1074);
    int _1106 = _530 + 24;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.cp_c6)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.cp_c6)._m0[int(_1118)][_1120];
    float _1124 = fma(_882, _962, _1094);
    float _1126 = fma(_882, _970, _1096);
    float _1128 = fma(_884, _980, _1036);
    float _1130 = fma(_886, _980, _1038);
    float _1132 = fma(_888, _980, _1040);
    float _1134 = fma(_886, _988, _1066);
    int _1136 = _530 + 40;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.cp_c6)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.cp_c6)._m0[int(_1148)][_1150];
    float _1154 = fma(_884, _988, _1062);
    float _1156 = fma(_888, _988, _1064);
    float _1158 = fma(_884, _998, _1098);
    float _1160 = fma(_886, _1006, _1104);
    float _1162 = fma(_888, _1006, _1126);
    float _1164 = fma(_884, _1006, _1102);
    int _1166 = _530 + 56;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
    int _1172 = int(_1168) & 3;
    float _1174 = (*spvDescriptorSet0.cp_c6)._m0[int(_1170)][_1172];
    int _1176 = int(_1168) + 1;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    int _1180 = _1176 & 3;
    float _1182 = (*spvDescriptorSet0.cp_c6)._m0[int(_1178)][_1180];
    float _1184 = fma(_886, _998, _1100);
    float _1186 = _1160 + _890;
    float _1188 = _1162 + _892;
    float _1190 = fma(_888, _998, _1124);
    float _1192 = _1164 + _894;
    float _1194 = _1134 * _1030;
    float _1196 = _1130 * _1030;
    float _1198 = _1184 * _1030;
    float _1200 = _1186 * _1030;
    float _1202 = fma(_1154, _1022, _1194);
    float _1204 = fma(_1128, _1022, _1196);
    float _1206 = fma(_1158, _1022, _1198);
    float _1208 = fma(_1192, _1022, _1200);
    float _1210 = _1186 * _1060;
    float _1212 = _1134 * _1060;
    float _1214 = _1130 * _1060;
    float _1216 = _1184 * _1060;
    float _1218 = fma(_1192, _1052, _1210);
    float _1220 = fma(_1154, _1052, _1212);
    float _1222 = fma(_1128, _1052, _1214);
    float _1224 = fma(_1158, _1052, _1216);
    float _1226 = _1186 * _1092;
    float _1228 = _1134 * _1092;
    float _1230 = _1130 * _1092;
    float _1232 = _1184 * _1092;
    float _1234 = fma(_1192, _1084, _1226);
    float _1236 = fma(_1154, _1084, _1228);
    float _1238 = fma(_1128, _1084, _1230);
    float _1240 = fma(_1158, _1084, _1232);
    float _1242 = fma(_1156, _1114, _1202);
    int _1244 = _916 * 48;
    float _1246 = fma(_1188, _1114, _1208);
    float _1248 = fma(_1132, _1114, _1204);
    float _1250 = fma(_1190, _1114, _1206);
    float _1252 = _1246 + _1122;
    int _1254 = _1244 + 32;
    float _1256 = fma(_1188, _1144, _1218);
    float _1258 = fma(_1156, _1144, _1220);
    float _1260 = fma(_1132, _1144, _1222);
    float _1262 = fma(_1190, _1144, _1224);
    float _1264 = _1256 + _1152;
    float _1266 = fma(_1188, _1174, _1234);
    float _1268 = fma(_1156, _1174, _1236);
    int _1270 = _1244 + 16;
    float _1272 = fma(_1132, _1174, _1238);
    float _1274 = fma(_1190, _1174, _1240);
    float _1276 = _1266 + _1182;
    int _1278 = _1244 + 48;
    uint _1280 = uint(int(uint(_1270) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1280)] = as_type<uint>(_1248);
    int _1282 = _1270 + 4;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1284)] = as_type<uint>(_1242);
    int _1286 = _1270 + 8;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1288)] = as_type<uint>(_1250);
    int _1290 = _1270 + 12;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1292)] = as_type<uint>(_1252);
    uint _1294 = uint(int(uint(_1254) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1294)] = as_type<uint>(_1260);
    int _1296 = _1254 + 4;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1298)] = as_type<uint>(_1258);
    int _1300 = _1254 + 8;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1302)] = as_type<uint>(_1262);
    int _1304 = _1254 + 12;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1306)] = as_type<uint>(_1264);
    uint _1308 = uint(int(uint(_1278) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1308)] = as_type<uint>(_1272);
    int _1310 = _1278 + 4;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1312)] = as_type<uint>(_1268);
    int _1314 = _1278 + 8;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1316)] = as_type<uint>(_1274);
    int _1318 = _1278 + 12;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1320)] = as_type<uint>(_1276);
}

