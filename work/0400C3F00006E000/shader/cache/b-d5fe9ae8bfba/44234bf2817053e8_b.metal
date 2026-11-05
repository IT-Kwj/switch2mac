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
int _54(thread const int& _3165, thread const int& _3166, constant _10& support_buffer)
{
    int _3169 = 1 + _3166;
    float _3171 = support_buffer._m5[_3169].x;
    bool _3173 = _3171 == 1.0;
    if (_3173)
    {
        return _3165;
    }
    float _3175 = float(_3165);
    float _3177 = _3175 * _3171;
    int _3179 = int(_3177);
    return _3179;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3200, thread const int& _3201, thread const int& _3202, thread int& _3203, thread uint& gl_SubgroupInvocationID)
{
    int _3206 = _3202 & 31;
    uint _3208 = uint(int(uint(_3202) >> uint(8)));
    int _3210 = int(_3208) & 31;
    float _3212 = as_type<float>(gl_SubgroupInvocationID);
    int _3214 = as_type<int>(_3212) & _3210;
    int _3216 = ~_3210;
    int _3218 = _3206 & _3216;
    int _3220 = _3218 | _3214;
    int _3222 = ~_3210;
    int _3224 = _3201 & _3222;
    int _3226 = _3224 | _3214;
    bool _3228 = uint(_3226) <= uint(_3220);
    _3203 = _3228 ? (-1) : 0;
    float _3230 = spvSubgroupShuffle(as_type<float>(_3200), uint(_3226));
    uint _3232 = uint(_3228 ? as_type<int>(_3230) : _3200);
    return int(_3232);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
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
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = _97 & as_type<int>(_109);
    bool _113 = _111 != 0;
    float _115 = 0.0;
    float _117 = 0.0;
    if (!_113)
    {
        _115 = 0.0;
        _117 = 0.0;
    }
    float _119 = _115;
    float _121 = _117;
    float _123 = 0.0;
    float _125 = 0.0;
    float _127 = _119;
    float _129 = _121;
    if (!_113)
    {
        _123 = 0.0;
        _125 = 0.0;
    }
    float _131 = _123;
    float _133 = _125;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = _131;
    float _141 = _133;
    if (!_113)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _143 = _135;
    float _145 = _137;
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
    float _161 = _155;
    float _163 = _157;
    if (!_113)
    {
        _159 = 0.0;
    }
    float _165 = _159;
    float _167 = 0.0;
    float _169 = _165;
    if (!_113)
    {
        _167 = 0.0;
    }
    float _171 = _167;
    bool _173 = !_113;
    float _175 = _171;
    if (!_173)
    {
        uint _177 = uint(int(uint(_99) >> uint(2)));
        uint _179 = uint(int(uint(int(_177)) >> uint(2)));
        int _181 = int(_177) & 3;
        float _183 = (*spvDescriptorSet0.cp_c5)._m0[int(_179)][_181];
        int _185 = int(_177) + 1;
        uint _187 = uint(int(uint(_185) >> uint(2)));
        int _189 = _185 & 3;
        float _191 = (*spvDescriptorSet0.cp_c5)._m0[int(_187)][_189];
        int _193 = _66;
        int _195 = 0;
        int _197 = _54(_193, _195, (*spvDescriptorSet0.support_buffer));
        int _199 = as_type<int>(_183);
        int _201 = 0;
        int _203 = _54(_199, _201, (*spvDescriptorSet0.support_buffer));
        int3 _1500 = int3(_197, _203, 1);
        float4 _206 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1500.xy), uint(_1500.z), 0).xyzw;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        float _214 = _206.w;
        int _216 = _66;
        int _218 = 0;
        int _220 = _54(_216, _218, (*spvDescriptorSet0.support_buffer));
        int _222 = as_type<int>(_191);
        int _224 = 0;
        int _226 = _54(_222, _224, (*spvDescriptorSet0.support_buffer));
        int3 _1520 = int3(_220, _226, 1);
        float4 _228 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1520.xy), uint(_1520.z), 0).xyzw;
        float _230 = _228.x;
        float _232 = _228.y;
        float _234 = _228.z;
        float _236 = _228.w;
        int _238 = _66;
        int _240 = 0;
        int _242 = _54(_238, _240, (*spvDescriptorSet0.support_buffer));
        int _244 = as_type<int>(_183);
        int _246 = 0;
        int _248 = _54(_244, _246, (*spvDescriptorSet0.support_buffer));
        int3 _1540 = int3(_242, _248, 0);
        float3 _252 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1540.xy), uint(_1540.z), 0).xyz;
        float _254 = _252.x;
        float _256 = _252.y;
        float _258 = _252.z;
        int _260 = _66;
        int _262 = 0;
        int _264 = _54(_260, _262, (*spvDescriptorSet0.support_buffer));
        int _266 = as_type<int>(_191);
        int _268 = 0;
        int _270 = _54(_266, _268, (*spvDescriptorSet0.support_buffer));
        int3 _1558 = int3(_264, _270, 0);
        float3 _272 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1558.xy), uint(_1558.z), 0).xyz;
        float _274 = _272.x;
        float _276 = _272.y;
        float _278 = _272.z;
        int _280 = _66;
        int _282 = 0;
        int _284 = _54(_280, _282, (*spvDescriptorSet0.support_buffer));
        int _286 = as_type<int>(_183);
        int _288 = 0;
        int _290 = _54(_286, _288, (*spvDescriptorSet0.support_buffer));
        int3 _1576 = int3(_284, _290, 2);
        float3 _292 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1576.xy), uint(_1576.z), 0).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        int _300 = _66;
        int _302 = 0;
        int _304 = _54(_300, _302, (*spvDescriptorSet0.support_buffer));
        int _306 = as_type<int>(_191);
        int _308 = 0;
        int _310 = _54(_306, _308, (*spvDescriptorSet0.support_buffer));
        int3 _1594 = int3(_304, _310, 2);
        float3 _312 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1594.xy), uint(_1594.z), 0).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        int _320 = _99 + 16;
        uint _322 = uint(int(uint(_320) >> uint(2)));
        uint _324 = uint(int(uint(int(_322)) >> uint(2)));
        int _326 = int(_322) & 3;
        float _328 = (*spvDescriptorSet0.cp_c5)._m0[int(_324)][_326];
        float _330 = -_208;
        float _332 = _330 + _230;
        float _334 = -_210;
        float _336 = _334 + _232;
        float _338 = -_256;
        float _340 = _338 + _276;
        float _342 = -_258;
        float _344 = _342 + _278;
        float _346 = fma(_332, _328, _208);
        float _348 = -_212;
        float _350 = _348 + _234;
        float _352 = -_214;
        float _354 = _352 + _236;
        float _356 = fma(_336, _328, _210);
        float _358 = fma(_340, _328, _256);
        float _360 = fma(_350, _328, _212);
        float _362 = fma(_354, _328, _214);
        float _364 = -_254;
        float _366 = _364 + _274;
        float _368 = -_294;
        float _370 = _368 + _314;
        float _372 = -_296;
        float _374 = _372 + _316;
        float _376 = -_298;
        float _378 = _376 + _318;
        float _380 = fma(_366, _328, _254);
        float _382 = fma(_344, _328, _258);
        float _384 = fma(_370, _328, _294);
        float _386 = fma(_374, _328, _296);
        float _388 = fma(_378, _328, _298);
        float _390 = _362 * 2.0;
        _127 = _346;
        _161 = _360;
        _175 = _390;
        _139 = _356;
        _129 = _380;
        _141 = _358;
        _151 = _382;
        _153 = _388;
        _169 = _386;
        _163 = _384;
    }
    float _392 = _127;
    float _394 = _161;
    float _396 = _175;
    float _398 = _139;
    float _400 = _129;
    float _402 = _141;
    float _404 = _151;
    float _406 = _153;
    float _408 = _169;
    float _410 = _163;
    float _412 = _392 * _392;
    float _414 = _392 * 2.0;
    float _416 = _394 * _396;
    float _418 = _392 * _396;
    float _420 = _398 * _396;
    float _422 = _398 * _398;
    bool _424 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _426 = -_416;
    float _428 = fma(_414, _398, _426);
    float _430 = fma(_414, _398, _416);
    float _432 = _398 * 2.0;
    float _434 = fma(_412, -2.0, 1.0);
    float _436 = _394 * _394;
    float _438 = fma(_422, -2.0, 1.0);
    float _440 = fma(_414, _394, _420);
    float _442 = -_420;
    float _444 = fma(_414, _394, _442);
    float _446 = -_418;
    float _448 = fma(_432, _394, _446);
    float _450 = fma(_436, -2.0, _438);
    float _452 = fma(_432, _394, _418);
    float _454 = fma(_436, -2.0, _434);
    float _456 = fma(_422, -2.0, _434);
    float _458 = _430 * _400;
    float _460 = _444 * _400;
    float _462 = _450 * _400;
    float _464 = _428 * _402;
    float _466 = _452 * _402;
    float _468 = _454 * _402;
    float _470 = _440 * _404;
    float _472 = _448 * _404;
    float _474 = _456 * _404;
    int _476 = _66 * 112;
    bool _478 = !_424;
    float _480 = _462;
    float _482 = _464;
    float _484 = _470;
    float _486 = _410;
    float _488 = _458;
    float _490 = _468;
    float _492 = _472;
    float _494 = _408;
    float _496 = _460;
    float _498 = _466;
    float _500 = _474;
    float _502 = _406;
    if (!_478)
    {
        int _504 = 0;
        float _506 = _462;
        float _508 = _464;
        float _510 = _470;
        float _512 = _410;
        float _514 = _458;
        float _516 = _468;
        float _518 = _472;
        float _520 = _408;
        float _522 = _460;
        float _524 = _466;
        float _526 = _474;
        float _528 = _406;
        bool _530;
        int _578;
        int _588;
        int _598;
        int _608;
        int _618;
        int _628;
        int _638;
        int _648;
        int _658;
        int _668;
        int _678;
        int _688;
        float _796;
        float _798;
        float _800;
        int _802;
        float _804;
        int _806;
        int _808;
        int _810;
        int _812;
        float _814;
        float _816;
        float _818;
        do
        {
            int _532 = _504;
            float _534 = _506;
            float _536 = _508;
            float _538 = _510;
            int _540 = as_type<int>(_512);
            float _542 = _514;
            int _544 = as_type<int>(_516);
            int _546 = as_type<int>(_518);
            int _548 = as_type<int>(_520);
            int _550 = as_type<int>(_522);
            float _552 = _524;
            float _554 = _526;
            float _556 = _528;
            uint _558 = uint(int(uint(_476) >> uint(2)));
            uint _560 = uint(int(uint(int(_558)) >> uint(2)));
            int _562 = int(_558) & 3;
            float _564 = (*spvDescriptorSet0.cp_c6)._m0[int(_560)][_562];
            bool _566 = _66 != 0;
            int _568 = _532 + 1;
            bool _570 = uint(_568) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _572 = as_type<int>(_534);
            int _574 = as_type<int>(_564);
            int _576 = 31;
            int _1916 = _56(_572, _574, _576, _578, gl_SubgroupInvocationID);
            int _580 = _1916;
            int _582 = as_type<int>(_536);
            int _584 = as_type<int>(_564);
            int _586 = 31;
            int _1921 = _56(_582, _584, _586, _588, gl_SubgroupInvocationID);
            int _590 = _1921;
            int _592 = as_type<int>(_538);
            int _594 = as_type<int>(_564);
            int _596 = 31;
            int _1926 = _56(_592, _594, _596, _598, gl_SubgroupInvocationID);
            int _600 = _1926;
            int _602 = _540;
            int _604 = as_type<int>(_564);
            int _606 = 31;
            int _1930 = _56(_602, _604, _606, _608, gl_SubgroupInvocationID);
            int _610 = _1930;
            int _612 = as_type<int>(_542);
            int _614 = as_type<int>(_564);
            int _616 = 31;
            int _1935 = _56(_612, _614, _616, _618, gl_SubgroupInvocationID);
            int _620 = _1935;
            int _622 = _544;
            int _624 = as_type<int>(_564);
            int _626 = 31;
            int _1939 = _56(_622, _624, _626, _628, gl_SubgroupInvocationID);
            int _630 = _1939;
            int _632 = _546;
            int _634 = as_type<int>(_564);
            int _636 = 31;
            int _1943 = _56(_632, _634, _636, _638, gl_SubgroupInvocationID);
            int _640 = _1943;
            int _642 = _548;
            int _644 = as_type<int>(_564);
            int _646 = 31;
            int _1947 = _56(_642, _644, _646, _648, gl_SubgroupInvocationID);
            int _650 = _1947;
            int _652 = _550;
            int _654 = as_type<int>(_564);
            int _656 = 31;
            int _1951 = _56(_652, _654, _656, _658, gl_SubgroupInvocationID);
            int _660 = _1951;
            int _662 = as_type<int>(_552);
            int _664 = as_type<int>(_564);
            int _666 = 31;
            int _1956 = _56(_662, _664, _666, _668, gl_SubgroupInvocationID);
            int _670 = _1956;
            int _672 = as_type<int>(_554);
            int _674 = as_type<int>(_564);
            int _676 = 31;
            int _1961 = _56(_672, _674, _676, _678, gl_SubgroupInvocationID);
            int _680 = _1961;
            int _682 = as_type<int>(_556);
            int _684 = as_type<int>(_564);
            int _686 = 31;
            int _1966 = _56(_682, _684, _686, _688, gl_SubgroupInvocationID);
            int _690 = _1966;
            bool _692 = !_566;
            _504 = _568;
            float _694 = _534;
            float _696 = _536;
            float _698 = _538;
            int _700 = _540;
            float _702 = _542;
            int _704 = _544;
            int _706 = _546;
            int _708 = _548;
            int _710 = _550;
            float _712 = _552;
            float _714 = _554;
            float _716 = _556;
            if (!_692)
            {
                float _718 = as_type<float>(_590) * _408;
                float _720 = _458 * as_type<float>(_590);
                float _722 = _468 * as_type<float>(_590);
                float _724 = _472 * as_type<float>(_590);
                float _726 = fma(as_type<float>(_580), _410, _718);
                float _728 = _458 * as_type<float>(_630);
                float _730 = _468 * as_type<float>(_630);
                float _732 = _472 * as_type<float>(_630);
                float _734 = as_type<float>(_630) * _408;
                float _736 = fma(_462, as_type<float>(_580), _720);
                float _738 = fma(_464, as_type<float>(_580), _722);
                float _740 = fma(_470, as_type<float>(_580), _724);
                float _742 = fma(_462, as_type<float>(_620), _728);
                float _744 = fma(_464, as_type<float>(_620), _730);
                float _746 = fma(_470, as_type<float>(_620), _732);
                float _748 = _458 * as_type<float>(_670);
                float _750 = as_type<float>(_670) * _408;
                float _752 = fma(as_type<float>(_620), _410, _734);
                float _754 = _472 * as_type<float>(_670);
                float _756 = _468 * as_type<float>(_670);
                float _758 = fma(_462, as_type<float>(_660), _748);
                float _760 = fma(as_type<float>(_660), _410, _750);
                float _762 = fma(_470, as_type<float>(_660), _754);
                float _764 = fma(_474, as_type<float>(_600), _740);
                float _766 = fma(_464, as_type<float>(_660), _756);
                float _768 = fma(_460, as_type<float>(_600), _736);
                float _770 = fma(_466, as_type<float>(_600), _738);
                float _772 = fma(_466, as_type<float>(_640), _744);
                float _774 = fma(as_type<float>(_600), _406, _726);
                float _776 = fma(_460, as_type<float>(_640), _742);
                float _778 = fma(_474, as_type<float>(_640), _746);
                float _780 = fma(as_type<float>(_640), _406, _752);
                float _782 = fma(as_type<float>(_680), _406, _760);
                float _784 = fma(_466, as_type<float>(_680), _766);
                float _786 = fma(_460, as_type<float>(_680), _758);
                float _788 = fma(_474, as_type<float>(_680), _762);
                float _790 = as_type<float>(_610) + _774;
                float _792 = as_type<float>(_650) + _780;
                float _794 = as_type<float>(_690) + _782;
                _694 = _768;
                _696 = _770;
                _698 = _764;
                _700 = as_type<int>(_790);
                _702 = _776;
                _704 = as_type<int>(_772);
                _706 = as_type<int>(_778);
                _708 = as_type<int>(_792);
                _710 = as_type<int>(_786);
                _712 = _784;
                _714 = _788;
                _716 = _794;
            }
            _796 = _694;
            _798 = _696;
            _800 = _698;
            _802 = _700;
            _804 = _702;
            _806 = _704;
            _808 = _706;
            _810 = _708;
            _812 = _710;
            _814 = _712;
            _816 = _714;
            _818 = _716;
            _530 = !_570;
            _506 = _796;
            _508 = _798;
            _510 = _800;
            _512 = as_type<float>(_802);
            _514 = _804;
            _516 = as_type<float>(_806);
            _518 = as_type<float>(_808);
            _520 = as_type<float>(_810);
            _522 = as_type<float>(_812);
            _524 = _814;
            _526 = _816;
            _528 = _818;
        } while (_530);
        _480 = _796;
        _482 = _798;
        _484 = _800;
        _486 = as_type<float>(_802);
        _488 = _804;
        _490 = as_type<float>(_806);
        _492 = as_type<float>(_808);
        _494 = as_type<float>(_810);
        _496 = as_type<float>(_812);
        _498 = _814;
        _500 = _816;
        _502 = _818;
    }
    float _820 = _480;
    float _822 = _482;
    float _824 = _484;
    float _826 = _486;
    float _828 = _488;
    float _830 = _490;
    float _832 = _492;
    float _834 = _494;
    float _836 = _496;
    float _838 = _498;
    float _840 = _500;
    float _842 = _502;
    int _844 = _476 + 80;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    uint _848 = uint(int(uint(int(_846)) >> uint(2)));
    int _850 = int(_846) & 3;
    float _852 = (*spvDescriptorSet0.cp_c6)._m0[int(_848)][_850];
    int _854 = int(_846) + 1;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    int _858 = _854 & 3;
    float _860 = (*spvDescriptorSet0.cp_c6)._m0[int(_856)][_858];
    bool _862 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _864 = _476 + 64;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.cp_c6)._m0[int(_868)][_870];
    int _874 = int(_866) + 1;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    int _878 = _874 & 3;
    float _880 = (*spvDescriptorSet0.cp_c6)._m0[int(_876)][_878];
    int _882 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _884 = _882 + _66;
    int _886 = _476 + 88;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.cp_c6)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.cp_c6)._m0[int(_898)][_900];
    int _904 = _476 + 72;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    uint _908 = uint(int(uint(int(_906)) >> uint(2)));
    int _910 = int(_906) & 3;
    float _912 = (*spvDescriptorSet0.cp_c6)._m0[int(_908)][_910];
    int _914 = int(_906) + 1;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    int _918 = _914 & 3;
    float _920 = (*spvDescriptorSet0.cp_c6)._m0[int(_916)][_918];
    int _922 = _476 + 96;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.cp_c6)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.cp_c6)._m0[int(_934)][_936];
    int _940 = _476 + 104;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    uint _944 = uint(int(uint(int(_942)) >> uint(2)));
    int _946 = int(_942) & 3;
    float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
    int _950 = int(_942) + 1;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    int _954 = _950 & 3;
    float _956 = (*spvDescriptorSet0.cp_c6)._m0[int(_952)][_954];
    int _958 = _476 + 16;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    uint _962 = uint(int(uint(int(_960)) >> uint(2)));
    int _964 = int(_960) & 3;
    float _966 = (*spvDescriptorSet0.cp_c6)._m0[int(_962)][_964];
    int _968 = int(_960) + 1;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    int _972 = _968 & 3;
    float _974 = (*spvDescriptorSet0.cp_c6)._m0[int(_970)][_972];
    if (!_862)
    {
        int _976 = _66 * 48;
        int _978 = _976 + 16;
        uint _980 = uint(int(uint(_976) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_980)] = as_type<uint>(_820);
        int _982 = _976 + 4;
        uint _984 = uint(int(uint(_982) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_984)] = as_type<uint>(_822);
        int _986 = _976 + 8;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_988)] = as_type<uint>(_824);
        int _990 = _976 + 12;
        uint _992 = uint(int(uint(_990) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_992)] = as_type<uint>(_826);
        int _994 = _976 + 32;
        uint _996 = uint(int(uint(_978) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_996)] = as_type<uint>(_828);
        int _998 = _978 + 4;
        uint _1000 = uint(int(uint(_998) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1000)] = as_type<uint>(_830);
        int _1002 = _978 + 8;
        uint _1004 = uint(int(uint(_1002) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1004)] = as_type<uint>(_832);
        int _1006 = _978 + 12;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1008)] = as_type<uint>(_834);
        uint _1010 = uint(int(uint(_994) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1010)] = as_type<uint>(_836);
        int _1012 = _994 + 4;
        uint _1014 = uint(int(uint(_1012) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1014)] = as_type<uint>(_838);
        int _1016 = _994 + 8;
        uint _1018 = uint(int(uint(_1016) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1018)] = as_type<uint>(_840);
        int _1020 = _994 + 12;
        uint _1022 = uint(int(uint(_1020) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1022)] = as_type<uint>(_842);
    }
    float _1024 = _838 * _852;
    float _1026 = _822 * _852;
    float _1028 = _830 * _852;
    int _1030 = _476 + 32;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    uint _1034 = uint(int(uint(int(_1032)) >> uint(2)));
    int _1036 = int(_1032) & 3;
    float _1038 = (*spvDescriptorSet0.cp_c6)._m0[int(_1034)][_1036];
    int _1040 = int(_1032) + 1;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    int _1044 = _1040 & 3;
    float _1046 = (*spvDescriptorSet0.cp_c6)._m0[int(_1042)][_1044];
    float _1048 = fma(_836, _872, _1024);
    float _1050 = _822 * _860;
    float _1052 = fma(_820, _872, _1026);
    float _1054 = fma(_828, _872, _1028);
    float _1056 = _830 * _860;
    float _1058 = fma(_820, _880, _1050);
    float _1060 = _822 * _894;
    float _1062 = _822 * _902;
    float _1064 = _838 * _860;
    int _1066 = _476 + 48;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.cp_c6)._m0[int(_1070)][_1072];
    int _1076 = int(_1068) + 1;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    int _1080 = _1076 & 3;
    float _1082 = (*spvDescriptorSet0.cp_c6)._m0[int(_1078)][_1080];
    float _1084 = _830 * _894;
    float _1086 = _830 * _902;
    float _1088 = fma(_828, _880, _1056);
    float _1090 = fma(_836, _880, _1064);
    float _1092 = _838 * _894;
    float _1094 = _838 * _902;
    float _1096 = fma(_820, _912, _1060);
    float _1098 = fma(_820, _920, _1062);
    float _1100 = fma(_828, _912, _1084);
    int _1102 = _476 + 24;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    uint _1106 = uint(int(uint(int(_1104)) >> uint(2)));
    int _1108 = int(_1104) & 3;
    float _1110 = (*spvDescriptorSet0.cp_c6)._m0[int(_1106)][_1108];
    int _1112 = int(_1104) + 1;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    int _1116 = _1112 & 3;
    float _1118 = (*spvDescriptorSet0.cp_c6)._m0[int(_1114)][_1116];
    float _1120 = fma(_828, _920, _1086);
    float _1122 = fma(_836, _920, _1094);
    float _1124 = fma(_836, _912, _1092);
    float _1126 = fma(_824, _930, _1052);
    float _1128 = fma(_832, _956, _1120);
    float _1130 = fma(_832, _930, _1054);
    float _1132 = fma(_840, _930, _1048);
    int _1134 = _476 + 40;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.cp_c6)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.cp_c6)._m0[int(_1146)][_1148];
    float _1152 = fma(_824, _938, _1058);
    float _1154 = fma(_824, _948, _1096);
    float _1156 = fma(_824, _956, _1098);
    float _1158 = fma(_832, _938, _1088);
    float _1160 = fma(_832, _948, _1100);
    float _1162 = fma(_840, _956, _1122);
    float _1164 = _1128 + _834;
    int _1166 = _476 + 56;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
    int _1172 = int(_1168) & 3;
    float _1174 = (*spvDescriptorSet0.cp_c6)._m0[int(_1170)][_1172];
    int _1176 = int(_1168) + 1;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    int _1180 = _1176 & 3;
    float _1182 = (*spvDescriptorSet0.cp_c6)._m0[int(_1178)][_1180];
    float _1184 = fma(_840, _938, _1090);
    float _1186 = fma(_840, _948, _1124);
    float _1188 = _1162 + _842;
    float _1190 = _1156 + _826;
    float _1192 = _1130 * _974;
    float _1194 = _1158 * _974;
    float _1196 = _1160 * _974;
    float _1198 = _1164 * _974;
    float _1200 = fma(_1126, _966, _1192);
    float _1202 = fma(_1152, _966, _1194);
    float _1204 = fma(_1154, _966, _1196);
    float _1206 = _1164 * _1046;
    float _1208 = fma(_1190, _966, _1198);
    float _1210 = _1130 * _1046;
    float _1212 = _1158 * _1046;
    float _1214 = _1160 * _1046;
    float _1216 = fma(_1190, _1038, _1206);
    float _1218 = fma(_1126, _1038, _1210);
    float _1220 = fma(_1152, _1038, _1212);
    float _1222 = fma(_1154, _1038, _1214);
    int _1224 = _884 * 48;
    float _1226 = _1164 * _1082;
    float _1228 = _1130 * _1082;
    float _1230 = _1158 * _1082;
    float _1232 = _1160 * _1082;
    float _1234 = fma(_1190, _1074, _1226);
    float _1236 = fma(_1126, _1074, _1228);
    float _1238 = fma(_1152, _1074, _1230);
    float _1240 = fma(_1154, _1074, _1232);
    float _1242 = fma(_1188, _1110, _1208);
    float _1244 = fma(_1132, _1110, _1200);
    float _1246 = fma(_1184, _1110, _1202);
    float _1248 = fma(_1186, _1110, _1204);
    float _1250 = _1242 + _1118;
    float _1252 = fma(_1188, _1142, _1216);
    float _1254 = fma(_1132, _1142, _1218);
    float _1256 = fma(_1184, _1142, _1220);
    float _1258 = fma(_1186, _1142, _1222);
    float _1260 = _1252 + _1150;
    int _1262 = _1224 + 16;
    int _1264 = _1224 + 32;
    float _1266 = fma(_1188, _1174, _1234);
    float _1268 = fma(_1132, _1174, _1236);
    float _1270 = fma(_1184, _1174, _1238);
    float _1272 = fma(_1186, _1174, _1240);
    float _1274 = _1266 + _1182;
    int _1276 = _1224 + 48;
    uint _1278 = uint(int(uint(_1262) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1278)] = as_type<uint>(_1244);
    int _1280 = _1262 + 4;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1282)] = as_type<uint>(_1246);
    int _1284 = _1262 + 8;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1286)] = as_type<uint>(_1248);
    int _1288 = _1262 + 12;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1290)] = as_type<uint>(_1250);
    uint _1292 = uint(int(uint(_1264) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1292)] = as_type<uint>(_1254);
    int _1294 = _1264 + 4;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1296)] = as_type<uint>(_1256);
    int _1298 = _1264 + 8;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1300)] = as_type<uint>(_1258);
    int _1302 = _1264 + 12;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1304)] = as_type<uint>(_1260);
    uint _1306 = uint(int(uint(_1276) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1306)] = as_type<uint>(_1268);
    int _1308 = _1276 + 4;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1310)] = as_type<uint>(_1270);
    int _1312 = _1276 + 8;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1314)] = as_type<uint>(_1272);
    int _1316 = _1276 + 12;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1318)] = as_type<uint>(_1274);
}

