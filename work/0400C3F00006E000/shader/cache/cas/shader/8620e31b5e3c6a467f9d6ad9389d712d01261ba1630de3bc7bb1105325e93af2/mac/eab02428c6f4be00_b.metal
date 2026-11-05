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
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4933, thread const int& _4934, constant _10& support_buffer)
{
    int _4937 = 1 + _4934;
    float _4939 = support_buffer._m5[_4937].x;
    bool _4941 = _4939 == 1.0;
    if (_4941)
    {
        return _4933;
    }
    float _4943 = float(_4933);
    float _4945 = _4943 * _4939;
    int _4947 = int(_4945);
    return _4947;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4625, thread const int& _4626, thread const int& _4627, thread const int& _4628, thread int& _4629, thread int& _4630, thread int& _4631, thread int& _4632, thread int& _4633, thread int& _4634)
{
    float _4637 = as_type<float>(_4627) + 0.0;
    bool _4639 = _4637 != 0.0;
    bool _4641 = isnan(_4637);
    bool _4643 = _4639 || _4641;
    bool _4645 = isnan(0.0);
    bool _4647 = _4643 || _4645;
    int _4649 = _4625;
    int _4651 = _4626;
    int _4653 = _4627;
    int _4655 = _4647 ? (-1) : 0;
    if (!_4647)
    {
        float _4657 = as_type<float>(_4627) * 1.0;
        _4649 = as_type<int>(_4657);
    }
    int _4659 = _4649;
    bool _4661 = !_4647;
    int _4663 = _4659;
    int _4665 = _4659;
    if (!_4661)
    {
        float _4667 = as_type<float>(_4627) + 0.0;
        bool _4669 = _4667 >= 0.0;
        bool _4671 = isnan(_4667);
        bool _4673 = _4669 || _4671;
        bool _4675 = isnan(0.0);
        bool _4677 = _4673 || _4675;
        _4655 = _4677 ? (-1) : 0;
        if (!_4677)
        {
            _4663 = 2147483647;
        }
        int _4679 = _4663;
        bool _4681 = !_4677;
        int _4683 = _4679;
        _4665 = _4679;
        if (!_4681)
        {
            float _4685 = as_type<float>(_4627) + 0.0;
            bool _4687 = _4685 > as_type<float>(0x7f800000u /* inf */);
            bool _4689 = isnan(_4685);
            bool _4691 = _4687 || _4689;
            bool _4693 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4695 = _4691 || _4693;
            _4655 = _4695 ? (-1) : 0;
            if (_4695)
            {
                float _4697 = as_type<float>(_4627) + 1.0;
                _4683 = as_type<int>(_4697);
            }
            int _4699 = _4683;
            int _4701 = _4699;
            _4665 = _4699;
            if (!_4695)
            {
                float _4703 = 0.0 + as_type<float>(_4627);
                bool _4705 = _4703 != as_type<float>(0x7f800000u /* inf */);
                bool _4707 = isnan(_4703);
                bool _4709 = _4705 || _4707;
                bool _4711 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4713 = _4709 || _4711;
                _4655 = _4713 ? (-1) : 0;
                if (!_4713)
                {
                    _4701 = _4627;
                }
                int _4715 = _4701;
                bool _4717 = !_4713;
                _4665 = _4715;
                if (!_4717)
                {
                    float _4719 = as_type<float>(_4627) * 18446744073709551616.0;
                    float _4721 = rsqrt(_4719);
                    float _4723 = _4719 * _4721;
                    float _4725 = _4721 * 0.5;
                    float _4727 = -_4723;
                    float _4729 = 0.0 + _4727;
                    float _4731 = fma(_4725, _4729, 0.5);
                    float _4733 = fma(_4723, _4731, _4723);
                    float _4735 = -_4733;
                    float _4737 = 0.0 + _4735;
                    float _4739 = fma(_4733, _4737, _4719);
                    float _4741 = fma(_4725, _4739, _4733);
                    float _4743 = _4741 * 2.3283064365386962890625e-10;
                    _4665 = as_type<int>(_4743);
                    _4651 = as_type<int>(_4733);
                    _4653 = as_type<int>(_4729);
                }
            }
        }
    }
    int _4745 = _4665;
    int _4747 = _4651;
    int _4749 = _4653;
    int _4751 = _4655;
    _4629 = _4628;
    _4630 = 0;
    _4631 = _4745;
    _4632 = _4747;
    _4633 = _4749;
    _4634 = _4751;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4968, thread const int& _4969, thread const int& _4970, thread int& _4971, thread uint& gl_SubgroupInvocationID)
{
    int _4974 = _4970 & 31;
    uint _4976 = uint(int(uint(_4970) >> uint(8)));
    int _4978 = int(_4976) & 31;
    float _4980 = as_type<float>(gl_SubgroupInvocationID);
    int _4982 = as_type<int>(_4980) & _4978;
    int _4984 = ~_4978;
    int _4986 = _4974 & _4984;
    int _4988 = _4986 | _4982;
    int _4990 = ~_4978;
    int _4992 = _4969 & _4990;
    int _4994 = _4992 | _4982;
    bool _4996 = uint(_4994) <= uint(_4988);
    _4971 = _4996 ? (-1) : 0;
    float _4998 = spvSubgroupShuffle(as_type<float>(_4968), uint(_4994));
    uint _5000 = uint(_4996 ? as_type<int>(_4998) : _4968);
    return int(_5000);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1500 = false;
    bool _1008 = false;
    bool _606 = false;
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) << 6;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_74)
    {
        return;
    }
    int _76 = _70 & 31;
    bool _78 = _76 == 0;
    bool _80 = uint(_76) < 32u;
    int _82 = 32 - _76;
    int _84 = _76 - 32;
    int _86 = 1 << _76;
    uint _89 = uint(int(uint(0) >> uint(_82)));
    int _91 = _86 | int(_89);
    int _93 = _78 ? 1 : _91;
    bool _95 = uint(_84) < 32u;
    int _97 = 0 << _84;
    int _99 = _95 ? _97 : 0;
    float _101 = _80 ? as_type<float>(_93) : as_type<float>(_99);
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _103 + 36;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.cp_c5)._m0[int(_119)][_121];
    int _125 = as_type<int>(_101) & as_type<int>(_113);
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_101) & as_type<int>(_123);
    bool _131 = _129 != 0;
    float _133 = _101;
    if (!_127)
    {
        _133 = 0.0;
    }
    float _135 = _133;
    float _137 = 0.0;
    float _139 = 0.0;
    float _141 = _135;
    if (!_127)
    {
        _137 = 0.0;
        _139 = 0.0;
    }
    float _143 = _137;
    float _145 = _139;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = _143;
    float _153 = _145;
    if (!_127)
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
    if (!_127)
    {
        _159 = 0.0;
        _161 = 0.0;
    }
    float _167 = _159;
    float _169 = _161;
    float _171 = 0.0;
    float _173 = 0.0;
    float _175 = _167;
    float _177 = _169;
    if (!_127)
    {
        _171 = 0.0;
        _173 = 0.0;
    }
    float _179 = _171;
    float _181 = _173;
    float _183 = 0.0;
    float _185 = _179;
    float _187 = _181;
    if (!_127)
    {
        _183 = 0.0;
    }
    float _189 = _183;
    bool _191 = !_127;
    float _193 = _189;
    if (!_191)
    {
        uint _195 = uint(int(uint(_103) >> uint(2)));
        uint _197 = uint(int(uint(int(_195)) >> uint(2)));
        int _199 = int(_195) & 3;
        float _201 = (*spvDescriptorSet0.cp_c5)._m0[int(_197)][_199];
        int _203 = int(_195) + 1;
        uint _205 = uint(int(uint(_203) >> uint(2)));
        int _207 = _203 & 3;
        float _209 = (*spvDescriptorSet0.cp_c5)._m0[int(_205)][_207];
        int _211 = _70;
        int _213 = 0;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_201);
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _2162 = int3(_215, _221, 1);
        float4 _224 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2162.xy), uint(_2162.z), 0).xyzw;
        float _226 = _224.x;
        float _228 = _224.y;
        float _230 = _224.z;
        float _232 = _224.w;
        int _234 = _70;
        int _236 = 0;
        int _238 = _58(_234, _236, (*spvDescriptorSet0.support_buffer));
        int _240 = as_type<int>(_209);
        int _242 = 0;
        int _244 = _58(_240, _242, (*spvDescriptorSet0.support_buffer));
        int3 _2182 = int3(_238, _244, 1);
        float4 _246 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2182.xy), uint(_2182.z), 0).xyzw;
        float _248 = _246.x;
        float _250 = _246.y;
        float _252 = _246.z;
        float _254 = _246.w;
        int _256 = _70;
        int _258 = 0;
        int _260 = _58(_256, _258, (*spvDescriptorSet0.support_buffer));
        int _262 = as_type<int>(_201);
        int _264 = 0;
        int _266 = _58(_262, _264, (*spvDescriptorSet0.support_buffer));
        int3 _2202 = int3(_260, _266, 0);
        float3 _270 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2202.xy), uint(_2202.z), 0).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        int _278 = _70;
        int _280 = 0;
        int _282 = _58(_278, _280, (*spvDescriptorSet0.support_buffer));
        int _284 = as_type<int>(_209);
        int _286 = 0;
        int _288 = _58(_284, _286, (*spvDescriptorSet0.support_buffer));
        int3 _2220 = int3(_282, _288, 0);
        float3 _290 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2220.xy), uint(_2220.z), 0).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        int _298 = _70;
        int _300 = 0;
        int _302 = _58(_298, _300, (*spvDescriptorSet0.support_buffer));
        int _304 = as_type<int>(_201);
        int _306 = 0;
        int _308 = _58(_304, _306, (*spvDescriptorSet0.support_buffer));
        int3 _2238 = int3(_302, _308, 2);
        float3 _310 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2238.xy), uint(_2238.z), 0).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        int _318 = _70;
        int _320 = 0;
        int _322 = _58(_318, _320, (*spvDescriptorSet0.support_buffer));
        int _324 = as_type<int>(_209);
        int _326 = 0;
        int _328 = _58(_324, _326, (*spvDescriptorSet0.support_buffer));
        int3 _2256 = int3(_322, _328, 2);
        float3 _330 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2256.xy), uint(_2256.z), 0).xyz;
        float _332 = _330.x;
        float _334 = _330.y;
        float _336 = _330.z;
        int _338 = _103 + 16;
        uint _340 = uint(int(uint(_338) >> uint(2)));
        uint _342 = uint(int(uint(int(_340)) >> uint(2)));
        int _344 = int(_340) & 3;
        float _346 = (*spvDescriptorSet0.cp_c5)._m0[int(_342)][_344];
        float _348 = -_226;
        float _350 = _348 + _248;
        float _352 = -_228;
        float _354 = _352 + _250;
        float _356 = -_230;
        float _358 = _356 + _252;
        float _360 = -_232;
        float _362 = _360 + _254;
        float _364 = -_276;
        float _366 = _364 + _296;
        float _368 = fma(_354, _346, _228);
        float _370 = -_274;
        float _372 = _370 + _294;
        float _374 = -_272;
        float _376 = _374 + _292;
        float _378 = fma(_358, _346, _230);
        float _380 = -_312;
        float _382 = _380 + _332;
        float _384 = fma(_372, _346, _274);
        float _386 = -_314;
        float _388 = _386 + _334;
        float _390 = -_316;
        float _392 = _390 + _336;
        float _394 = fma(_362, _346, _232);
        float _396 = fma(_376, _346, _272);
        float _398 = fma(_350, _346, _226);
        float _400 = fma(_366, _346, _276);
        float _402 = fma(_382, _346, _312);
        float _404 = fma(_388, _346, _314);
        float _406 = fma(_392, _346, _316);
        _193 = _368;
        _151 = _398;
        _163 = _378;
        _185 = _394;
        _141 = _396;
        _153 = _384;
        _165 = _400;
        _175 = _402;
        _177 = _404;
        _187 = _406;
    }
    float _408 = _193;
    float _410 = _151;
    float _412 = _163;
    float _414 = _185;
    float _416 = _141;
    float _418 = _153;
    float _420 = _165;
    float _422 = _175;
    float _424 = _177;
    float _426 = _187;
    bool _428 = !_131;
    float _430 = _418;
    float _980;
    float _982;
    float _984;
    float _986;
    float _988;
    float _990;
    float _992;
    float _994;
    float _996;
    float _998;
    float _1000;
    float _1002;
    float _1004;
    float _1006;
    if (!_428)
    {
        int _432 = _103 + 8;
        uint _434 = uint(int(uint(_432) >> uint(2)));
        uint _436 = uint(int(uint(int(_434)) >> uint(2)));
        int _438 = int(_434) & 3;
        float _440 = (*spvDescriptorSet0.cp_c5)._m0[int(_436)][_438];
        int _442 = int(_434) + 1;
        uint _444 = uint(int(uint(_442) >> uint(2)));
        int _446 = _442 & 3;
        float _448 = (*spvDescriptorSet0.cp_c5)._m0[int(_444)][_446];
        int _450 = _70;
        int _452 = 1;
        int _454 = _58(_450, _452, (*spvDescriptorSet0.support_buffer));
        int _456 = as_type<int>(_440);
        int _458 = 1;
        int _460 = _58(_456, _458, (*spvDescriptorSet0.support_buffer));
        int3 _2441 = int3(_454, _460, 1);
        float4 _462 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2441.xy), uint(_2441.z), 0).xyzw;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float _470 = _462.w;
        int _472 = _70;
        int _474 = 1;
        int _476 = _58(_472, _474, (*spvDescriptorSet0.support_buffer));
        int _478 = as_type<int>(_448);
        int _480 = 1;
        int _482 = _58(_478, _480, (*spvDescriptorSet0.support_buffer));
        int3 _2461 = int3(_476, _482, 1);
        float4 _484 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2461.xy), uint(_2461.z), 0).xyzw;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float _492 = _484.w;
        int _494 = _103 + 24;
        uint _496 = uint(int(uint(_494) >> uint(2)));
        uint _498 = uint(int(uint(int(_496)) >> uint(2)));
        int _500 = int(_496) & 3;
        float _502 = (*spvDescriptorSet0.cp_c5)._m0[int(_498)][_500];
        float _504 = -_466;
        float _506 = _504 + _488;
        float _508 = -_464;
        float _510 = _508 + _486;
        float _512 = -_468;
        float _514 = _512 + _490;
        float _516 = -_470;
        float _518 = _516 + _492;
        float _520 = fma(_506, _502, _466);
        float _522 = fma(_510, _502, _464);
        float _524 = fma(_514, _502, _468);
        float _526 = fma(_518, _502, _470);
        float _528 = _520 * _408;
        float _530 = fma(_522, _410, _528);
        float _532 = fma(_524, _412, _530);
        float _534 = fma(_526, _414, _532);
        float _536 = precise::max(_534, -1.0);
        float _538 = precise::min(_536, 1.0);
        bool _540 = _538 >= 0.0;
        bool _542 = isnan(_538);
        bool _544 = _540 || _542;
        bool _546 = isnan(0.0);
        bool _548 = _544 || _546;
        bool _550 = !_548;
        float _552 = -_538;
        float _554 = _550 ? _552 : _538;
        bool _556 = _554 < 0.0;
        float _558 = float(_556);
        float _560 = abs(_554);
        float _562 = -_560;
        float _564 = _562 + 1.0;
        float _566 = abs(_554);
        float _568 = fma(_566, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _570 = as_type<int>(_564) + (-218103808);
        float _572 = abs(_554);
        float _574 = fma(_572, _568, -0.212114393711090087890625);
        bool _576 = uint(_570) >= 1920991232u;
        float _578 = abs(_554);
        float _580 = fma(_578, _574, 1.570728778839111328125);
        bool _582 = !_576;
        float _604;
        if (!_582)
        {
            int _584 = _570;
            int _586 = as_type<int>(_470);
            int _588 = as_type<int>(_564);
            int _590 = 1552;
            int _592;
            int _594;
            int _596;
            int _598;
            int _600;
            int _602;
            _56(_584, _586, _588, _590, _592, _594, _596, _598, _600, _602);
            _604 = as_type<float>(_596);
            _606 = true;
        }
        else
        {
            float _608 = rsqrt(_564);
            float _610 = _564 * _608;
            float _612 = _608 * 0.5;
            float _614 = -_610;
            float _616 = 0.0 + _614;
            float _618 = fma(_612, _616, 0.5);
            float _620 = fma(_610, _618, _610);
            float _622 = -_620;
            float _624 = 0.0 + _622;
            float _626 = fma(_620, _624, _564);
            float _628 = fma(_612, _626, _620);
            _604 = _628;
        }
        _606 = false;
        float _630 = _604;
        int _632 = _103 + 8;
        uint _634 = uint(int(uint(_632) >> uint(2)));
        uint _636 = uint(int(uint(int(_634)) >> uint(2)));
        int _638 = int(_634) & 3;
        float _640 = (*spvDescriptorSet0.cp_c5)._m0[int(_636)][_638];
        int _642 = int(_634) + 1;
        uint _644 = uint(int(uint(_642) >> uint(2)));
        int _646 = _642 & 3;
        float _648 = (*spvDescriptorSet0.cp_c5)._m0[int(_644)][_646];
        int _650 = _70;
        int _652 = 1;
        int _654 = _58(_650, _652, (*spvDescriptorSet0.support_buffer));
        int _656 = as_type<int>(_640);
        int _658 = 1;
        int _660 = _58(_656, _658, (*spvDescriptorSet0.support_buffer));
        int3 _2691 = int3(_654, _660, 0);
        float3 _662 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2691.xy), uint(_2691.z), 0).xyz;
        float _664 = _662.x;
        float _666 = _662.y;
        float _668 = _662.z;
        int _670 = _70;
        int _672 = 1;
        int _674 = _58(_670, _672, (*spvDescriptorSet0.support_buffer));
        int _676 = as_type<int>(_640);
        int _678 = 1;
        int _680 = _58(_676, _678, (*spvDescriptorSet0.support_buffer));
        int3 _2709 = int3(_674, _680, 2);
        float3 _682 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2709.xy), uint(_2709.z), 0).xyz;
        float _684 = _682.x;
        float _686 = _682.y;
        float _688 = _682.z;
        int _690 = _70;
        int _692 = 1;
        int _694 = _58(_690, _692, (*spvDescriptorSet0.support_buffer));
        int _696 = as_type<int>(_648);
        int _698 = 1;
        int _700 = _58(_696, _698, (*spvDescriptorSet0.support_buffer));
        int3 _2727 = int3(_694, _700, 0);
        float3 _702 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2727.xy), uint(_2727.z), 0).xyz;
        float _704 = _702.x;
        float _706 = _702.y;
        float _708 = _702.z;
        int _710 = _70;
        int _712 = 1;
        int _714 = _58(_710, _712, (*spvDescriptorSet0.support_buffer));
        int _716 = as_type<int>(_648);
        int _718 = 1;
        int _720 = _58(_716, _718, (*spvDescriptorSet0.support_buffer));
        int3 _2745 = int3(_714, _720, 2);
        float3 _722 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2745.xy), uint(_2745.z), 0).xyz;
        float _724 = _722.x;
        float _726 = _722.y;
        float _728 = _722.z;
        float _730 = _580 * _630;
        float _732 = _558 * 2.0;
        float _734 = -_732;
        float _736 = fma(_730, _734, _730);
        float _738 = fma(_558, 3.1415927410125732421875, _736);
        float _740 = _738 * 0.15915493667125701904296875;
        float _742 = _740 * 6.283185482025146484375;
        float _744 = sin(_742);
        float _746 = abs(_744);
        bool _748 = _746 >= 0.001000000047497451305389404296875;
        bool _750 = isnan(_746);
        bool _752 = _748 || _750;
        bool _754 = isnan(0.001000000047497451305389404296875);
        bool _756 = _752 || _754;
        float _758 = _558;
        float _760 = _732;
        float _762 = _736;
        if (!_756)
        {
            int _764 = _103 + 28;
            uint _766 = uint(int(uint(_764) >> uint(2)));
            uint _768 = uint(int(uint(int(_766)) >> uint(2)));
            int _770 = int(_766) & 3;
            float _772 = (*spvDescriptorSet0.cp_c5)._m0[int(_768)][_770];
            _758 = _772;
        }
        float _774 = _758;
        float _776 = _774;
        if (!_756)
        {
            float _778 = -_774;
            float _780 = _778 + 1.0;
            _760 = _780;
        }
        float _782 = _760;
        float _784 = _782;
        if (!_756)
        {
            _762 = _774;
        }
        float _786 = _762;
        bool _788 = !_756;
        float _790 = _786;
        if (!_788)
        {
            int _792 = _103 + 28;
            uint _794 = uint(int(uint(_792) >> uint(2)));
            uint _796 = uint(int(uint(int(_794)) >> uint(2)));
            int _798 = int(_794) & 3;
            float _800 = (*spvDescriptorSet0.cp_c5)._m0[int(_796)][_798];
            float _802 = 1.0 / _744;
            float _804 = _738 * _800;
            float _806 = _804 * 0.15915493667125701904296875;
            float _808 = -_804;
            float _810 = _738 + _808;
            float _812 = _810 * 0.15915493667125701904296875;
            float _814 = _806 * 6.283185482025146484375;
            float _816 = sin(_814);
            float _818 = _812 * 6.283185482025146484375;
            float _820 = sin(_818);
            float _822 = _816 * _802;
            float _824 = _820 * _802;
            _790 = _822;
            _784 = _824;
            _776 = _800;
        }
        float _826 = _790;
        float _828 = _784;
        float _830 = _776;
        bool _832 = !_548;
        float _834 = -_826;
        float _836 = _832 ? _834 : _826;
        float _838 = -_668;
        float _840 = _838 + _708;
        float _842 = -_688;
        float _844 = _842 + _728;
        float _846 = _526 * _836;
        float _848 = _522 * _836;
        float _850 = _520 * _836;
        float _852 = _524 * _836;
        float _854 = fma(_414, _828, _846);
        int _856 = _103 + 24;
        uint _858 = uint(int(uint(_856) >> uint(2)));
        uint _860 = uint(int(uint(int(_858)) >> uint(2)));
        int _862 = int(_858) & 3;
        float _864 = (*spvDescriptorSet0.cp_c5)._m0[int(_860)][_862];
        float _866 = fma(_410, _828, _848);
        float _868 = fma(_412, _828, _852);
        float _870 = _854 * 2.0;
        float _872 = fma(_408, _828, _850);
        float _874 = _866 * 2.0;
        float _876 = _868 * _870;
        int _878 = _103 + 20;
        uint _880 = uint(int(uint(_878) >> uint(2)));
        uint _882 = uint(int(uint(int(_880)) >> uint(2)));
        int _884 = int(_880) & 3;
        float _886 = (*spvDescriptorSet0.cp_c5)._m0[int(_882)][_884];
        float _888 = _872 * _870;
        float _890 = _872 * 2.0;
        float _892 = _866 * _870;
        float _894 = -_876;
        float _896 = fma(_872, _874, _894);
        float _898 = fma(_872, _874, _876);
        float _900 = fma(_868, _874, _888);
        float _902 = -_888;
        float _904 = fma(_868, _874, _902);
        float _906 = -_892;
        float _908 = fma(_868, _890, _906);
        float _910 = fma(_868, _890, _892);
        float _912 = _872 * _872;
        float _914 = -_664;
        float _916 = _914 + _704;
        float _918 = _866 * _866;
        float _920 = -_666;
        float _922 = _920 + _706;
        float _924 = fma(_912, -2.0, 1.0);
        float _926 = fma(_916, _864, _664);
        float _928 = fma(_918, -2.0, 1.0);
        float _930 = _868 * _868;
        float _932 = fma(_922, _864, _666);
        float _934 = _926 * _830;
        float _936 = fma(_912, -2.0, _928);
        float _938 = fma(_930, -2.0, _924);
        float _940 = -_684;
        float _942 = _940 + _724;
        float _944 = fma(_840, _864, _668);
        float _946 = -_686;
        float _948 = _946 + _726;
        float _950 = fma(_416, _886, _934);
        float _952 = _932 * _830;
        float _954 = fma(_942, _864, _684);
        float _956 = fma(_948, _864, _686);
        float _958 = fma(_844, _864, _688);
        float _960 = fma(_418, _886, _952);
        float _962 = _944 * _830;
        float _964 = _954 * _830;
        float _966 = _956 * _830;
        float _968 = _958 * _830;
        float _970 = fma(_420, _886, _962);
        float _972 = fma(_422, _886, _964);
        float _974 = fma(_930, -2.0, _928);
        float _976 = fma(_424, _886, _966);
        float _978 = fma(_426, _886, _968);
        _430 = _960;
        _980 = _974;
        _982 = _950;
        _984 = _938;
        _986 = _898;
        _988 = _896;
        _990 = _910;
        _992 = _904;
        _994 = _970;
        _996 = _900;
        _998 = _908;
        _1000 = _936;
        _1002 = _972;
        _1004 = _976;
        _1006 = _978;
        _1008 = true;
    }
    else
    {
        float _1010 = _414 * 2.0;
        float _1012 = _410 * 2.0;
        float _1014 = _410 * _410;
        float _1016 = _1010 * _412;
        float _1018 = _408 * _408;
        float _1020 = _1010 * _410;
        float _1022 = _1010 * _408;
        float _1024 = -_1016;
        float _1026 = fma(_1012, _408, _1024);
        float _1028 = fma(_1012, _408, _1016);
        float _1030 = _408 * 2.0;
        float _1032 = fma(_1014, -2.0, 1.0);
        float _1034 = _412 * _412;
        float _1036 = fma(_1018, -2.0, 1.0);
        float _1038 = fma(_1012, _412, _1022);
        float _1040 = -_1022;
        float _1042 = fma(_1012, _412, _1040);
        float _1044 = -_1020;
        float _1046 = fma(_1030, _412, _1044);
        float _1048 = fma(_1030, _412, _1020);
        float _1050 = fma(_1034, -2.0, _1036);
        float _1052 = fma(_1034, -2.0, _1032);
        float _1054 = fma(_1018, -2.0, _1032);
        _980 = _1052;
        _982 = _416;
        _984 = _1050;
        _986 = _1028;
        _988 = _1026;
        _990 = _1048;
        _992 = _1042;
        _994 = _420;
        _996 = _1038;
        _998 = _1046;
        _1000 = _1054;
        _1002 = _422;
        _1004 = _424;
        _1006 = _426;
    }
    _1008 = false;
    float _1056 = _430;
    float _1058 = _980;
    float _1060 = _982;
    float _1062 = _984;
    float _1064 = _986;
    float _1066 = _988;
    float _1068 = _990;
    float _1070 = _992;
    float _1072 = _994;
    float _1074 = _996;
    float _1076 = _998;
    float _1078 = _1000;
    float _1080 = _1002;
    float _1082 = _1004;
    float _1084 = _1006;
    float _1086 = _1056 * _1058;
    float _1088 = _1060 * _1062;
    float _1090 = _1060 * _1064;
    bool _1092 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _1094 = _1056 * _1066;
    float _1096 = _1056 * _1068;
    bool _1098 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _1100 = _1060 * _1070;
    float _1102 = _1072 * _1074;
    float _1104 = _1072 * _1076;
    float _1106 = _1072 * _1078;
    if (!_1092)
    {
        int _1108 = _70 * 48;
        int _1110 = _1108 + 16;
        uint _1112 = uint(int(uint(_1108) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1112)] = as_type<uint>(_1088);
        int _1114 = _1108 + 4;
        uint _1116 = uint(int(uint(_1114) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1116)] = as_type<uint>(_1094);
        int _1118 = _1108 + 8;
        uint _1120 = uint(int(uint(_1118) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1120)] = as_type<uint>(_1102);
        int _1122 = _1108 + 12;
        uint _1124 = uint(int(uint(_1122) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1124)] = as_type<uint>(_1080);
        int _1126 = _1108 + 32;
        uint _1128 = uint(int(uint(_1110) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1128)] = as_type<uint>(_1090);
        int _1130 = _1110 + 4;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1132)] = as_type<uint>(_1086);
        int _1134 = _1110 + 8;
        uint _1136 = uint(int(uint(_1134) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1136)] = as_type<uint>(_1104);
        int _1138 = _1110 + 12;
        uint _1140 = uint(int(uint(_1138) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1140)] = as_type<uint>(_1082);
        uint _1142 = uint(int(uint(_1126) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1142)] = as_type<uint>(_1100);
        int _1144 = _1126 + 4;
        uint _1146 = uint(int(uint(_1144) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1146)] = as_type<uint>(_1096);
        int _1148 = _1126 + 8;
        uint _1150 = uint(int(uint(_1148) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1150)] = as_type<uint>(_1106);
        int _1152 = _1126 + 12;
        uint _1154 = uint(int(uint(_1152) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1154)] = as_type<uint>(_1084);
    }
    int _1156 = _70 * 112;
    bool _1158 = !_1098;
    float _1476;
    float _1478;
    float _1480;
    float _1482;
    float _1484;
    float _1486;
    float _1488;
    float _1490;
    float _1492;
    float _1494;
    float _1496;
    float _1498;
    if (!_1158)
    {
        int _1160 = 0;
        float _1162 = _1088;
        float _1164 = _1094;
        float _1166 = _1102;
        float _1168 = _1080;
        float _1170 = _1090;
        float _1172 = _1086;
        float _1174 = _1104;
        float _1176 = _1082;
        float _1178 = _1100;
        float _1180 = _1096;
        float _1182 = _1106;
        float _1184 = _1084;
        bool _1186;
        int _1234;
        int _1244;
        int _1254;
        int _1264;
        int _1274;
        int _1284;
        int _1294;
        int _1304;
        int _1314;
        int _1324;
        int _1334;
        int _1344;
        int _1452;
        int _1456;
        int _1458;
        int _1462;
        int _1464;
        int _1466;
        int _1470;
        int _1472;
        int _1474;
        do
        {
            int _1188 = _1160;
            int _1190 = as_type<int>(_1162);
            int _1192 = as_type<int>(_1164);
            int _1194 = as_type<int>(_1166);
            int _1196 = as_type<int>(_1168);
            int _1198 = as_type<int>(_1170);
            int _1200 = as_type<int>(_1172);
            int _1202 = as_type<int>(_1174);
            int _1204 = as_type<int>(_1176);
            int _1206 = as_type<int>(_1178);
            int _1208 = as_type<int>(_1180);
            int _1210 = as_type<int>(_1182);
            int _1212 = as_type<int>(_1184);
            uint _1214 = uint(int(uint(_1156) >> uint(2)));
            uint _1216 = uint(int(uint(int(_1214)) >> uint(2)));
            int _1218 = int(_1214) & 3;
            float _1220 = (*spvDescriptorSet0.cp_c6)._m0[int(_1216)][_1218];
            bool _1222 = _70 != 0;
            int _1224 = _1188 + 1;
            bool _1226 = uint(_1224) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1228 = _1190;
            int _1230 = as_type<int>(_1220);
            int _1232 = 31;
            int _3484 = _60(_1228, _1230, _1232, _1234, gl_SubgroupInvocationID);
            int _1236 = _3484;
            int _1238 = _1192;
            int _1240 = as_type<int>(_1220);
            int _1242 = 31;
            int _3488 = _60(_1238, _1240, _1242, _1244, gl_SubgroupInvocationID);
            int _1246 = _3488;
            int _1248 = _1194;
            int _1250 = as_type<int>(_1220);
            int _1252 = 31;
            int _3492 = _60(_1248, _1250, _1252, _1254, gl_SubgroupInvocationID);
            int _1256 = _3492;
            int _1258 = _1196;
            int _1260 = as_type<int>(_1220);
            int _1262 = 31;
            int _3496 = _60(_1258, _1260, _1262, _1264, gl_SubgroupInvocationID);
            int _1266 = _3496;
            int _1268 = _1198;
            int _1270 = as_type<int>(_1220);
            int _1272 = 31;
            int _3500 = _60(_1268, _1270, _1272, _1274, gl_SubgroupInvocationID);
            int _1276 = _3500;
            int _1278 = _1200;
            int _1280 = as_type<int>(_1220);
            int _1282 = 31;
            int _3504 = _60(_1278, _1280, _1282, _1284, gl_SubgroupInvocationID);
            int _1286 = _3504;
            int _1288 = _1202;
            int _1290 = as_type<int>(_1220);
            int _1292 = 31;
            int _3508 = _60(_1288, _1290, _1292, _1294, gl_SubgroupInvocationID);
            int _1296 = _3508;
            int _1298 = _1204;
            int _1300 = as_type<int>(_1220);
            int _1302 = 31;
            int _3512 = _60(_1298, _1300, _1302, _1304, gl_SubgroupInvocationID);
            int _1306 = _3512;
            int _1308 = _1206;
            int _1310 = as_type<int>(_1220);
            int _1312 = 31;
            int _3516 = _60(_1308, _1310, _1312, _1314, gl_SubgroupInvocationID);
            int _1316 = _3516;
            int _1318 = _1208;
            int _1320 = as_type<int>(_1220);
            int _1322 = 31;
            int _3520 = _60(_1318, _1320, _1322, _1324, gl_SubgroupInvocationID);
            int _1326 = _3520;
            int _1328 = _1210;
            int _1330 = as_type<int>(_1220);
            int _1332 = 31;
            int _3524 = _60(_1328, _1330, _1332, _1334, gl_SubgroupInvocationID);
            int _1336 = _3524;
            int _1338 = _1212;
            int _1340 = as_type<int>(_1220);
            int _1342 = 31;
            int _3528 = _60(_1338, _1340, _1342, _1344, gl_SubgroupInvocationID);
            int _1346 = _3528;
            bool _1348 = !_1222;
            _1160 = _1224;
            int _1350 = _1190;
            int _1352 = _1192;
            int _1354 = _1194;
            int _1356 = _1196;
            int _1358 = _1198;
            int _1360 = _1200;
            int _1362 = _1202;
            int _1364 = _1204;
            int _1366 = _1206;
            int _1368 = _1208;
            int _1370 = _1210;
            int _1372 = _1212;
            if (!_1348)
            {
                float _1374 = as_type<float>(_1246) * _1082;
                float _1376 = _1090 * as_type<float>(_1246);
                float _1378 = _1086 * as_type<float>(_1246);
                float _1380 = _1104 * as_type<float>(_1246);
                float _1382 = as_type<float>(_1286) * _1082;
                float _1384 = _1090 * as_type<float>(_1286);
                float _1386 = fma(as_type<float>(_1236), _1080, _1374);
                float _1388 = fma(_1088, as_type<float>(_1236), _1376);
                float _1390 = fma(_1094, as_type<float>(_1236), _1378);
                float _1392 = fma(_1102, as_type<float>(_1236), _1380);
                float _1394 = _1086 * as_type<float>(_1286);
                float _1396 = _1104 * as_type<float>(_1286);
                float _1398 = fma(as_type<float>(_1276), _1080, _1382);
                float _1400 = as_type<float>(_1326) * _1082;
                float _1402 = fma(_1088, as_type<float>(_1276), _1384);
                float _1404 = _1086 * as_type<float>(_1326);
                float _1406 = _1090 * as_type<float>(_1326);
                float _1408 = fma(_1094, as_type<float>(_1276), _1394);
                float _1410 = fma(_1102, as_type<float>(_1276), _1396);
                float _1412 = _1104 * as_type<float>(_1326);
                float _1414 = fma(as_type<float>(_1316), _1080, _1400);
                float _1416 = fma(_1094, as_type<float>(_1316), _1404);
                float _1418 = fma(_1088, as_type<float>(_1316), _1406);
                float _1420 = fma(_1096, as_type<float>(_1256), _1390);
                float _1422 = fma(_1106, as_type<float>(_1256), _1392);
                float _1424 = fma(_1100, as_type<float>(_1256), _1388);
                float _1426 = fma(_1100, as_type<float>(_1296), _1402);
                float _1428 = fma(_1096, as_type<float>(_1296), _1408);
                float _1430 = fma(_1106, as_type<float>(_1296), _1410);
                float _1432 = fma(_1102, as_type<float>(_1316), _1412);
                float _1434 = fma(as_type<float>(_1256), _1084, _1386);
                float _1436 = fma(as_type<float>(_1296), _1084, _1398);
                float _1438 = fma(as_type<float>(_1336), _1084, _1414);
                float _1440 = fma(_1096, as_type<float>(_1336), _1416);
                float _1442 = fma(_1100, as_type<float>(_1336), _1418);
                float _1444 = fma(_1106, as_type<float>(_1336), _1432);
                float _1446 = as_type<float>(_1266) + _1434;
                float _1448 = as_type<float>(_1306) + _1436;
                float _1450 = as_type<float>(_1346) + _1438;
                _1350 = as_type<int>(_1424);
                _1352 = as_type<int>(_1420);
                _1354 = as_type<int>(_1422);
                _1356 = as_type<int>(_1446);
                _1358 = as_type<int>(_1426);
                _1360 = as_type<int>(_1428);
                _1362 = as_type<int>(_1430);
                _1364 = as_type<int>(_1448);
                _1366 = as_type<int>(_1442);
                _1368 = as_type<int>(_1440);
                _1370 = as_type<int>(_1444);
                _1372 = as_type<int>(_1450);
            }
            _1452 = _1350;
            int _1454 = _1352;
            _1456 = _1354;
            _1458 = _1356;
            int _1460 = _1358;
            _1462 = _1360;
            _1464 = _1362;
            _1466 = _1364;
            int _1468 = _1366;
            _1470 = _1368;
            _1472 = _1370;
            _1474 = _1372;
            _1186 = !_1226;
            _1162 = as_type<float>(_1452);
            _1164 = as_type<float>(_1454);
            _1166 = as_type<float>(_1456);
            _1168 = as_type<float>(_1458);
            _1170 = as_type<float>(_1460);
            _1172 = as_type<float>(_1462);
            _1174 = as_type<float>(_1464);
            _1176 = as_type<float>(_1466);
            _1178 = as_type<float>(_1468);
            _1180 = as_type<float>(_1470);
            _1182 = as_type<float>(_1472);
            _1184 = as_type<float>(_1474);
            _1476 = as_type<float>(_1454);
            _1478 = as_type<float>(_1460);
            _1480 = as_type<float>(_1468);
        } while (_1186);
        _1482 = as_type<float>(_1462);
        _1484 = as_type<float>(_1470);
        _1486 = as_type<float>(_1452);
        _1488 = as_type<float>(_1456);
        _1490 = as_type<float>(_1464);
        _1492 = as_type<float>(_1472);
        _1494 = as_type<float>(_1466);
        _1496 = as_type<float>(_1474);
        _1498 = as_type<float>(_1458);
        _1500 = true;
    }
    else
    {
        _1476 = _1094;
        _1482 = _1086;
        _1484 = _1096;
        _1486 = _1088;
        _1478 = _1090;
        _1480 = _1100;
        _1488 = _1102;
        _1490 = _1104;
        _1492 = _1106;
        _1494 = _1082;
        _1496 = _1084;
        _1498 = _1080;
    }
    _1500 = false;
    float _1502 = _1476;
    float _1504 = _1482;
    float _1506 = _1484;
    float _1508 = _1486;
    float _1510 = _1478;
    float _1512 = _1480;
    float _1514 = _1488;
    float _1516 = _1490;
    float _1518 = _1492;
    float _1520 = _1494;
    float _1522 = _1496;
    float _1524 = _1498;
    int _1526 = _1156 + 80;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    uint _1530 = uint(int(uint(int(_1528)) >> uint(2)));
    int _1532 = int(_1528) & 3;
    float _1534 = (*spvDescriptorSet0.cp_c6)._m0[int(_1530)][_1532];
    int _1536 = int(_1528) + 1;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    int _1540 = _1536 & 3;
    float _1542 = (*spvDescriptorSet0.cp_c6)._m0[int(_1538)][_1540];
    int _1544 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1546 = _1544 + _70;
    int _1548 = _1156 + 64;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.cp_c6)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.cp_c6)._m0[int(_1560)][_1562];
    int _1566 = _1156 + 88;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.cp_c6)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.cp_c6)._m0[int(_1578)][_1580];
    int _1584 = _1156 + 72;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.cp_c6)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.cp_c6)._m0[int(_1596)][_1598];
    int _1602 = _1156 + 96;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    uint _1606 = uint(int(uint(int(_1604)) >> uint(2)));
    int _1608 = int(_1604) & 3;
    float _1610 = (*spvDescriptorSet0.cp_c6)._m0[int(_1606)][_1608];
    int _1612 = int(_1604) + 1;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    int _1616 = _1612 & 3;
    float _1618 = (*spvDescriptorSet0.cp_c6)._m0[int(_1614)][_1616];
    int _1620 = _1156 + 104;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
    int _1626 = int(_1622) & 3;
    float _1628 = (*spvDescriptorSet0.cp_c6)._m0[int(_1624)][_1626];
    int _1630 = int(_1622) + 1;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    int _1634 = _1630 & 3;
    float _1636 = (*spvDescriptorSet0.cp_c6)._m0[int(_1632)][_1634];
    float _1638 = _1502 * _1534;
    float _1640 = _1504 * _1534;
    float _1642 = _1506 * _1534;
    int _1644 = _1156 + 16;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    uint _1648 = uint(int(uint(int(_1646)) >> uint(2)));
    int _1650 = int(_1646) & 3;
    float _1652 = (*spvDescriptorSet0.cp_c6)._m0[int(_1648)][_1650];
    int _1654 = int(_1646) + 1;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    int _1658 = _1654 & 3;
    float _1660 = (*spvDescriptorSet0.cp_c6)._m0[int(_1656)][_1658];
    float _1662 = _1502 * _1542;
    float _1664 = _1506 * _1542;
    float _1666 = fma(_1508, _1556, _1638);
    float _1668 = fma(_1510, _1556, _1640);
    float _1670 = fma(_1512, _1556, _1642);
    float _1672 = _1504 * _1542;
    int _1674 = _1156 + 32;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    uint _1678 = uint(int(uint(int(_1676)) >> uint(2)));
    int _1680 = int(_1676) & 3;
    float _1682 = (*spvDescriptorSet0.cp_c6)._m0[int(_1678)][_1680];
    int _1684 = int(_1676) + 1;
    uint _1686 = uint(int(uint(_1684) >> uint(2)));
    int _1688 = _1684 & 3;
    float _1690 = (*spvDescriptorSet0.cp_c6)._m0[int(_1686)][_1688];
    float _1692 = fma(_1508, _1564, _1662);
    float _1694 = fma(_1512, _1564, _1664);
    float _1696 = fma(_1510, _1564, _1672);
    float _1698 = _1502 * _1574;
    float _1700 = _1504 * _1574;
    float _1702 = _1506 * _1574;
    float _1704 = _1506 * _1582;
    int _1706 = _1156 + 48;
    uint _1708 = uint(int(uint(_1706) >> uint(2)));
    uint _1710 = uint(int(uint(int(_1708)) >> uint(2)));
    int _1712 = int(_1708) & 3;
    float _1714 = (*spvDescriptorSet0.cp_c6)._m0[int(_1710)][_1712];
    int _1716 = int(_1708) + 1;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    int _1720 = _1716 & 3;
    float _1722 = (*spvDescriptorSet0.cp_c6)._m0[int(_1718)][_1720];
    float _1724 = _1502 * _1582;
    float _1726 = _1504 * _1582;
    float _1728 = fma(_1508, _1592, _1698);
    float _1730 = fma(_1510, _1592, _1700);
    float _1732 = fma(_1508, _1600, _1724);
    float _1734 = fma(_1510, _1600, _1726);
    int _1736 = _1156 + 40;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
    int _1742 = int(_1738) & 3;
    float _1744 = (*spvDescriptorSet0.cp_c6)._m0[int(_1740)][_1742];
    int _1746 = int(_1738) + 1;
    uint _1748 = uint(int(uint(_1746) >> uint(2)));
    int _1750 = _1746 & 3;
    float _1752 = (*spvDescriptorSet0.cp_c6)._m0[int(_1748)][_1750];
    float _1754 = fma(_1512, _1592, _1702);
    float _1756 = fma(_1512, _1600, _1704);
    float _1758 = fma(_1514, _1610, _1666);
    float _1760 = fma(_1516, _1610, _1668);
    float _1762 = fma(_1518, _1610, _1670);
    float _1764 = fma(_1516, _1618, _1696);
    int _1766 = _1156 + 24;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.cp_c6)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.cp_c6)._m0[int(_1778)][_1780];
    float _1784 = fma(_1514, _1618, _1692);
    float _1786 = fma(_1518, _1618, _1694);
    float _1788 = fma(_1514, _1628, _1728);
    float _1790 = fma(_1516, _1636, _1734);
    float _1792 = fma(_1518, _1636, _1756);
    float _1794 = fma(_1514, _1636, _1732);
    int _1796 = _1156 + 56;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.cp_c6)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.cp_c6)._m0[int(_1808)][_1810];
    float _1814 = fma(_1516, _1628, _1730);
    float _1816 = _1790 + _1520;
    float _1818 = fma(_1518, _1628, _1754);
    float _1820 = _1792 + _1522;
    float _1822 = _1794 + _1524;
    float _1824 = _1760 * _1660;
    float _1826 = _1764 * _1660;
    float _1828 = _1814 * _1660;
    float _1830 = _1816 * _1660;
    float _1832 = fma(_1758, _1652, _1824);
    float _1834 = fma(_1784, _1652, _1826);
    float _1836 = fma(_1788, _1652, _1828);
    float _1838 = fma(_1822, _1652, _1830);
    float _1840 = _1760 * _1690;
    float _1842 = _1764 * _1690;
    float _1844 = _1814 * _1690;
    float _1846 = _1816 * _1690;
    float _1848 = fma(_1758, _1682, _1840);
    float _1850 = fma(_1784, _1682, _1842);
    float _1852 = fma(_1788, _1682, _1844);
    float _1854 = fma(_1822, _1682, _1846);
    float _1856 = _1760 * _1722;
    float _1858 = _1764 * _1722;
    float _1860 = _1814 * _1722;
    float _1862 = _1816 * _1722;
    float _1864 = fma(_1758, _1714, _1856);
    float _1866 = fma(_1784, _1714, _1858);
    float _1868 = fma(_1788, _1714, _1860);
    float _1870 = fma(_1822, _1714, _1862);
    float _1872 = fma(_1820, _1744, _1854);
    float _1874 = fma(_1762, _1744, _1848);
    float _1876 = fma(_1786, _1744, _1850);
    float _1878 = fma(_1818, _1744, _1852);
    float _1880 = _1872 + _1752;
    int _1882 = _1546 * 48;
    float _1884 = fma(_1820, _1774, _1838);
    float _1886 = fma(_1762, _1774, _1832);
    float _1888 = fma(_1786, _1774, _1834);
    float _1890 = fma(_1818, _1774, _1836);
    float _1892 = _1884 + _1782;
    int _1894 = _1882 + 16;
    int _1896 = _1882 + 32;
    float _1898 = fma(_1820, _1804, _1870);
    float _1900 = fma(_1762, _1804, _1864);
    float _1902 = fma(_1786, _1804, _1866);
    float _1904 = fma(_1818, _1804, _1868);
    float _1906 = _1898 + _1812;
    int _1908 = _1882 + 48;
    uint _1910 = uint(int(uint(_1894) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1910)] = as_type<uint>(_1886);
    int _1912 = _1894 + 4;
    uint _1914 = uint(int(uint(_1912) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1914)] = as_type<uint>(_1888);
    int _1916 = _1894 + 8;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1918)] = as_type<uint>(_1890);
    int _1920 = _1894 + 12;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1922)] = as_type<uint>(_1892);
    uint _1924 = uint(int(uint(_1896) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1924)] = as_type<uint>(_1874);
    int _1926 = _1896 + 4;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1928)] = as_type<uint>(_1876);
    int _1930 = _1896 + 8;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1932)] = as_type<uint>(_1878);
    int _1934 = _1896 + 12;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1936)] = as_type<uint>(_1880);
    uint _1938 = uint(int(uint(_1908) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1938)] = as_type<uint>(_1900);
    int _1940 = _1908 + 4;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1942)] = as_type<uint>(_1902);
    int _1944 = _1908 + 8;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1946)] = as_type<uint>(_1904);
    int _1948 = _1908 + 12;
    uint _1950 = uint(int(uint(_1948) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1950)] = as_type<uint>(_1906);
}

