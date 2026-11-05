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
int _58(thread const int& _4912, thread const int& _4913, constant _10& support_buffer)
{
    int _4916 = 1 + _4913;
    float _4918 = support_buffer._m5[_4916].x;
    bool _4920 = _4918 == 1.0;
    if (_4920)
    {
        return _4912;
    }
    float _4922 = float(_4912);
    float _4924 = _4922 * _4918;
    int _4926 = int(_4924);
    return _4926;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4604, thread const int& _4605, thread const int& _4606, thread const int& _4607, thread int& _4608, thread int& _4609, thread int& _4610, thread int& _4611, thread int& _4612, thread int& _4613)
{
    float _4616 = as_type<float>(_4606) + 0.0;
    bool _4618 = _4616 != 0.0;
    bool _4620 = isnan(_4616);
    bool _4622 = _4618 || _4620;
    bool _4624 = isnan(0.0);
    bool _4626 = _4622 || _4624;
    int _4628 = _4604;
    int _4630 = _4605;
    int _4632 = _4606;
    int _4634 = _4626 ? (-1) : 0;
    if (!_4626)
    {
        float _4636 = as_type<float>(_4606) * 1.0;
        _4628 = as_type<int>(_4636);
    }
    int _4638 = _4628;
    bool _4640 = !_4626;
    int _4642 = _4638;
    int _4644 = _4638;
    if (!_4640)
    {
        float _4646 = as_type<float>(_4606) + 0.0;
        bool _4648 = _4646 >= 0.0;
        bool _4650 = isnan(_4646);
        bool _4652 = _4648 || _4650;
        bool _4654 = isnan(0.0);
        bool _4656 = _4652 || _4654;
        _4634 = _4656 ? (-1) : 0;
        if (!_4656)
        {
            _4642 = 2147483647;
        }
        int _4658 = _4642;
        bool _4660 = !_4656;
        int _4662 = _4658;
        _4644 = _4658;
        if (!_4660)
        {
            float _4664 = as_type<float>(_4606) + 0.0;
            bool _4666 = _4664 > as_type<float>(0x7f800000u /* inf */);
            bool _4668 = isnan(_4664);
            bool _4670 = _4666 || _4668;
            bool _4672 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4674 = _4670 || _4672;
            _4634 = _4674 ? (-1) : 0;
            if (_4674)
            {
                float _4676 = as_type<float>(_4606) + 1.0;
                _4662 = as_type<int>(_4676);
            }
            int _4678 = _4662;
            int _4680 = _4678;
            _4644 = _4678;
            if (!_4674)
            {
                float _4682 = 0.0 + as_type<float>(_4606);
                bool _4684 = _4682 != as_type<float>(0x7f800000u /* inf */);
                bool _4686 = isnan(_4682);
                bool _4688 = _4684 || _4686;
                bool _4690 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4692 = _4688 || _4690;
                _4634 = _4692 ? (-1) : 0;
                if (!_4692)
                {
                    _4680 = _4606;
                }
                int _4694 = _4680;
                bool _4696 = !_4692;
                _4644 = _4694;
                if (!_4696)
                {
                    float _4698 = as_type<float>(_4606) * 18446744073709551616.0;
                    float _4700 = rsqrt(_4698);
                    float _4702 = _4698 * _4700;
                    float _4704 = _4700 * 0.5;
                    float _4706 = -_4702;
                    float _4708 = 0.0 + _4706;
                    float _4710 = fma(_4704, _4708, 0.5);
                    float _4712 = fma(_4702, _4710, _4702);
                    float _4714 = -_4712;
                    float _4716 = 0.0 + _4714;
                    float _4718 = fma(_4712, _4716, _4698);
                    float _4720 = fma(_4704, _4718, _4712);
                    float _4722 = _4720 * 2.3283064365386962890625e-10;
                    _4644 = as_type<int>(_4722);
                    _4630 = as_type<int>(_4712);
                    _4632 = as_type<int>(_4708);
                }
            }
        }
    }
    int _4724 = _4644;
    int _4726 = _4630;
    int _4728 = _4632;
    int _4730 = _4634;
    _4608 = _4607;
    _4609 = 0;
    _4610 = _4724;
    _4611 = _4726;
    _4612 = _4728;
    _4613 = _4730;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4947, thread const int& _4948, thread const int& _4949, thread int& _4950, thread uint& gl_SubgroupInvocationID)
{
    int _4953 = _4949 & 31;
    uint _4955 = uint(int(uint(_4949) >> uint(8)));
    int _4957 = int(_4955) & 31;
    float _4959 = as_type<float>(gl_SubgroupInvocationID);
    int _4961 = as_type<int>(_4959) & _4957;
    int _4963 = ~_4957;
    int _4965 = _4953 & _4963;
    int _4967 = _4965 | _4961;
    int _4969 = ~_4957;
    int _4971 = _4948 & _4969;
    int _4973 = _4971 | _4961;
    bool _4975 = uint(_4973) <= uint(_4967);
    _4950 = _4975 ? (-1) : 0;
    float _4977 = spvSubgroupShuffle(as_type<float>(_4947), uint(_4973));
    uint _4979 = uint(_4975 ? as_type<int>(_4977) : _4947);
    return int(_4979);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1450 = false;
    bool _1008 = false;
    bool _608 = false;
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
        _165 = _400;
        _141 = _396;
        _153 = _384;
        _175 = _402;
        _177 = _404;
        _187 = _406;
    }
    float _408 = _193;
    float _410 = _151;
    float _412 = _163;
    float _414 = _185;
    float _416 = _165;
    float _418 = _141;
    float _420 = _153;
    float _422 = _175;
    float _424 = _177;
    float _426 = _187;
    bool _428 = !_131;
    float _430 = _420;
    float _432 = _418;
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
        int _434 = _103 + 8;
        uint _436 = uint(int(uint(_434) >> uint(2)));
        uint _438 = uint(int(uint(int(_436)) >> uint(2)));
        int _440 = int(_436) & 3;
        float _442 = (*spvDescriptorSet0.cp_c5)._m0[int(_438)][_440];
        int _444 = int(_436) + 1;
        uint _446 = uint(int(uint(_444) >> uint(2)));
        int _448 = _444 & 3;
        float _450 = (*spvDescriptorSet0.cp_c5)._m0[int(_446)][_448];
        int _452 = _70;
        int _454 = 1;
        int _456 = _58(_452, _454, (*spvDescriptorSet0.support_buffer));
        int _458 = as_type<int>(_442);
        int _460 = 1;
        int _462 = _58(_458, _460, (*spvDescriptorSet0.support_buffer));
        int3 _2442 = int3(_456, _462, 1);
        float4 _464 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2442.xy), uint(_2442.z), 0).xyzw;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float _472 = _464.w;
        int _474 = _70;
        int _476 = 1;
        int _478 = _58(_474, _476, (*spvDescriptorSet0.support_buffer));
        int _480 = as_type<int>(_450);
        int _482 = 1;
        int _484 = _58(_480, _482, (*spvDescriptorSet0.support_buffer));
        int3 _2462 = int3(_478, _484, 1);
        float4 _486 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2462.xy), uint(_2462.z), 0).xyzw;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float _494 = _486.w;
        int _496 = _103 + 24;
        uint _498 = uint(int(uint(_496) >> uint(2)));
        uint _500 = uint(int(uint(int(_498)) >> uint(2)));
        int _502 = int(_498) & 3;
        float _504 = (*spvDescriptorSet0.cp_c5)._m0[int(_500)][_502];
        float _506 = -_468;
        float _508 = _506 + _490;
        float _510 = -_466;
        float _512 = _510 + _488;
        float _514 = -_470;
        float _516 = _514 + _492;
        float _518 = -_472;
        float _520 = _518 + _494;
        float _522 = fma(_508, _504, _468);
        float _524 = fma(_512, _504, _466);
        float _526 = fma(_516, _504, _470);
        float _528 = fma(_520, _504, _472);
        float _530 = _522 * _408;
        float _532 = fma(_524, _410, _530);
        float _534 = fma(_526, _412, _532);
        float _536 = fma(_528, _414, _534);
        float _538 = precise::max(_536, -1.0);
        float _540 = precise::min(_538, 1.0);
        bool _542 = _540 >= 0.0;
        bool _544 = isnan(_540);
        bool _546 = _542 || _544;
        bool _548 = isnan(0.0);
        bool _550 = _546 || _548;
        bool _552 = !_550;
        float _554 = -_540;
        float _556 = _552 ? _554 : _540;
        bool _558 = _556 < 0.0;
        float _560 = float(_558);
        float _562 = abs(_556);
        float _564 = -_562;
        float _566 = _564 + 1.0;
        float _568 = abs(_556);
        float _570 = fma(_568, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _572 = as_type<int>(_566) + (-218103808);
        float _574 = abs(_556);
        float _576 = fma(_574, _570, -0.212114393711090087890625);
        bool _578 = uint(_572) >= 1920991232u;
        float _580 = abs(_556);
        float _582 = fma(_580, _576, 1.570728778839111328125);
        bool _584 = !_578;
        float _606;
        if (!_584)
        {
            int _586 = _572;
            int _588 = as_type<int>(_472);
            int _590 = as_type<int>(_566);
            int _592 = 1552;
            int _594;
            int _596;
            int _598;
            int _600;
            int _602;
            int _604;
            _56(_586, _588, _590, _592, _594, _596, _598, _600, _602, _604);
            _606 = as_type<float>(_598);
            _608 = true;
        }
        else
        {
            float _610 = rsqrt(_566);
            float _612 = _566 * _610;
            float _614 = _610 * 0.5;
            float _616 = -_612;
            float _618 = 0.0 + _616;
            float _620 = fma(_614, _618, 0.5);
            float _622 = fma(_612, _620, _612);
            float _624 = -_622;
            float _626 = 0.0 + _624;
            float _628 = fma(_622, _626, _566);
            float _630 = fma(_614, _628, _622);
            _606 = _630;
        }
        _608 = false;
        float _632 = _606;
        int _634 = _103 + 8;
        uint _636 = uint(int(uint(_634) >> uint(2)));
        uint _638 = uint(int(uint(int(_636)) >> uint(2)));
        int _640 = int(_636) & 3;
        float _642 = (*spvDescriptorSet0.cp_c5)._m0[int(_638)][_640];
        int _644 = int(_636) + 1;
        uint _646 = uint(int(uint(_644) >> uint(2)));
        int _648 = _644 & 3;
        float _650 = (*spvDescriptorSet0.cp_c5)._m0[int(_646)][_648];
        int _652 = _70;
        int _654 = 1;
        int _656 = _58(_652, _654, (*spvDescriptorSet0.support_buffer));
        int _658 = as_type<int>(_642);
        int _660 = 1;
        int _662 = _58(_658, _660, (*spvDescriptorSet0.support_buffer));
        int3 _2692 = int3(_656, _662, 0);
        float3 _664 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2692.xy), uint(_2692.z), 0).xyz;
        float _666 = _664.x;
        float _668 = _664.y;
        float _670 = _664.z;
        int _672 = _70;
        int _674 = 1;
        int _676 = _58(_672, _674, (*spvDescriptorSet0.support_buffer));
        int _678 = as_type<int>(_642);
        int _680 = 1;
        int _682 = _58(_678, _680, (*spvDescriptorSet0.support_buffer));
        int3 _2710 = int3(_676, _682, 2);
        float3 _684 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2710.xy), uint(_2710.z), 0).xyz;
        float _686 = _684.x;
        float _688 = _684.y;
        float _690 = _684.z;
        int _692 = _70;
        int _694 = 1;
        int _696 = _58(_692, _694, (*spvDescriptorSet0.support_buffer));
        int _698 = as_type<int>(_650);
        int _700 = 1;
        int _702 = _58(_698, _700, (*spvDescriptorSet0.support_buffer));
        int3 _2728 = int3(_696, _702, 0);
        float3 _704 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2728.xy), uint(_2728.z), 0).xyz;
        float _706 = _704.x;
        float _708 = _704.y;
        float _710 = _704.z;
        int _712 = _70;
        int _714 = 1;
        int _716 = _58(_712, _714, (*spvDescriptorSet0.support_buffer));
        int _718 = as_type<int>(_650);
        int _720 = 1;
        int _722 = _58(_718, _720, (*spvDescriptorSet0.support_buffer));
        int3 _2746 = int3(_716, _722, 2);
        float3 _724 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2746.xy), uint(_2746.z), 0).xyz;
        float _726 = _724.x;
        float _728 = _724.y;
        float _730 = _724.z;
        float _732 = _582 * _632;
        float _734 = _560 * 2.0;
        float _736 = -_734;
        float _738 = fma(_732, _736, _732);
        float _740 = fma(_560, 3.1415927410125732421875, _738);
        float _742 = _740 * 0.15915493667125701904296875;
        float _744 = _742 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = abs(_746);
        bool _750 = _748 >= 0.001000000047497451305389404296875;
        bool _752 = isnan(_748);
        bool _754 = _750 || _752;
        bool _756 = isnan(0.001000000047497451305389404296875);
        bool _758 = _754 || _756;
        float _760 = _560;
        float _762 = _734;
        float _764 = _738;
        if (!_758)
        {
            int _766 = _103 + 28;
            uint _768 = uint(int(uint(_766) >> uint(2)));
            uint _770 = uint(int(uint(int(_768)) >> uint(2)));
            int _772 = int(_768) & 3;
            float _774 = (*spvDescriptorSet0.cp_c5)._m0[int(_770)][_772];
            _760 = _774;
        }
        float _776 = _760;
        float _778 = _776;
        if (!_758)
        {
            float _780 = -_776;
            float _782 = _780 + 1.0;
            _762 = _782;
        }
        float _784 = _762;
        float _786 = _784;
        if (!_758)
        {
            _764 = _776;
        }
        float _788 = _764;
        bool _790 = !_758;
        float _792 = _788;
        if (!_790)
        {
            int _794 = _103 + 28;
            uint _796 = uint(int(uint(_794) >> uint(2)));
            uint _798 = uint(int(uint(int(_796)) >> uint(2)));
            int _800 = int(_796) & 3;
            float _802 = (*spvDescriptorSet0.cp_c5)._m0[int(_798)][_800];
            float _804 = 1.0 / _746;
            float _806 = _740 * _802;
            float _808 = _806 * 0.15915493667125701904296875;
            float _810 = -_806;
            float _812 = _740 + _810;
            float _814 = _812 * 0.15915493667125701904296875;
            float _816 = _808 * 6.283185482025146484375;
            float _818 = sin(_816);
            float _820 = _814 * 6.283185482025146484375;
            float _822 = sin(_820);
            float _824 = _818 * _804;
            float _826 = _822 * _804;
            _792 = _824;
            _786 = _826;
            _778 = _802;
        }
        float _828 = _792;
        float _830 = _786;
        float _832 = _778;
        bool _834 = !_550;
        float _836 = -_828;
        float _838 = _834 ? _836 : _828;
        float _840 = -_670;
        float _842 = _840 + _710;
        float _844 = -_690;
        float _846 = _844 + _730;
        float _848 = _524 * _838;
        float _850 = _528 * _838;
        float _852 = _526 * _838;
        float _854 = _522 * _838;
        float _856 = fma(_410, _830, _848);
        float _858 = fma(_414, _830, _850);
        int _860 = _103 + 24;
        uint _862 = uint(int(uint(_860) >> uint(2)));
        uint _864 = uint(int(uint(int(_862)) >> uint(2)));
        int _866 = int(_862) & 3;
        float _868 = (*spvDescriptorSet0.cp_c5)._m0[int(_864)][_866];
        float _870 = fma(_412, _830, _852);
        float _872 = fma(_408, _830, _854);
        float _874 = _858 * 2.0;
        float _876 = _856 * 2.0;
        float _878 = _872 * 2.0;
        float _880 = _870 * _874;
        int _882 = _103 + 20;
        uint _884 = uint(int(uint(_882) >> uint(2)));
        uint _886 = uint(int(uint(int(_884)) >> uint(2)));
        int _888 = int(_884) & 3;
        float _890 = (*spvDescriptorSet0.cp_c5)._m0[int(_886)][_888];
        float _892 = _856 * _874;
        float _894 = _872 * _874;
        float _896 = -_880;
        float _898 = fma(_872, _876, _896);
        float _900 = fma(_872, _876, _880);
        float _902 = _872 * _872;
        float _904 = -_892;
        float _906 = fma(_870, _878, _904);
        float _908 = fma(_870, _878, _892);
        float _910 = fma(_870, _876, _894);
        float _912 = _856 * _856;
        float _914 = -_666;
        float _916 = _914 + _706;
        float _918 = -_894;
        float _920 = fma(_870, _876, _918);
        float _922 = -_668;
        float _924 = _922 + _708;
        float _926 = _870 * _870;
        float _928 = fma(_902, -2.0, 1.0);
        float _930 = fma(_912, -2.0, 1.0);
        float _932 = fma(_924, _868, _668);
        float _934 = fma(_842, _868, _670);
        float _936 = fma(_926, -2.0, _928);
        float _938 = -_686;
        float _940 = _938 + _726;
        float _942 = -_688;
        float _944 = _942 + _728;
        float _946 = fma(_916, _868, _666);
        float _948 = fma(_846, _868, _690);
        float _950 = fma(_940, _868, _686);
        float _952 = fma(_944, _868, _688);
        float _954 = fma(_926, -2.0, _930);
        float _956 = fma(_902, -2.0, _930);
        float _958 = _934 * _832;
        float _960 = _946 * _832;
        float _962 = _932 * _832;
        float _964 = _950 * _832;
        float _966 = _952 * _832;
        float _968 = _948 * _832;
        float _970 = fma(_416, _890, _958);
        float _972 = fma(_418, _890, _960);
        float _974 = fma(_420, _890, _962);
        float _976 = fma(_422, _890, _964);
        float _978 = fma(_424, _890, _966);
        float _980 = fma(_426, _890, _968);
        _430 = _974;
        _982 = _898;
        _984 = _954;
        _432 = _972;
        _986 = _936;
        _988 = _900;
        _990 = _920;
        _992 = _908;
        _994 = _970;
        _996 = _910;
        _998 = _906;
        _1000 = _956;
        _1002 = _980;
        _1004 = _978;
        _1006 = _976;
        _1008 = true;
    }
    else
    {
        float _1010 = _414 * 2.0;
        float _1012 = _410 * 2.0;
        float _1014 = _410 * _410;
        float _1016 = _1010 * _412;
        float _1018 = _1010 * _410;
        float _1020 = _1010 * _408;
        float _1022 = _408 * _408;
        float _1024 = -_1016;
        float _1026 = fma(_1012, _408, _1024);
        float _1028 = fma(_1012, _408, _1016);
        float _1030 = _408 * 2.0;
        float _1032 = fma(_1014, -2.0, 1.0);
        float _1034 = _412 * _412;
        float _1036 = fma(_1022, -2.0, 1.0);
        float _1038 = fma(_1012, _412, _1020);
        float _1040 = -_1020;
        float _1042 = fma(_1012, _412, _1040);
        float _1044 = -_1018;
        float _1046 = fma(_1030, _412, _1044);
        float _1048 = fma(_1030, _412, _1018);
        float _1050 = fma(_1034, -2.0, _1036);
        float _1052 = fma(_1034, -2.0, _1032);
        float _1054 = fma(_1022, -2.0, _1032);
        _982 = _1026;
        _984 = _1052;
        _986 = _1050;
        _988 = _1028;
        _990 = _1042;
        _992 = _1048;
        _994 = _416;
        _996 = _1038;
        _998 = _1046;
        _1000 = _1054;
        _1002 = _426;
        _1004 = _424;
        _1006 = _422;
    }
    _1008 = false;
    float _1056 = _430;
    float _1058 = _982;
    float _1060 = _984;
    float _1062 = _432;
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
    bool _1086 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _1088 = _1056 * _1058;
    float _1090 = _1056 * _1060;
    float _1092 = _1062 * _1064;
    float _1094 = _1062 * _1066;
    float _1096 = _1062 * _1068;
    float _1098 = _1056 * _1070;
    float _1100 = _1072 * _1074;
    float _1102 = _1072 * _1076;
    float _1104 = _1072 * _1078;
    int _1106 = _70 * 112;
    bool _1108 = !_1086;
    float _1110 = _1092;
    float _1112 = _1088;
    float _1114 = _1100;
    float _1116 = _1084;
    float _1118 = _1094;
    float _1120 = _1090;
    float _1122 = _1102;
    float _1124 = _1082;
    float _1126 = _1098;
    float _1128 = _1104;
    float _1130 = _1080;
    float _1448;
    if (!_1108)
    {
        int _1132 = 0;
        float _1134 = _1092;
        float _1136 = _1088;
        float _1138 = _1100;
        float _1140 = _1084;
        float _1142 = _1094;
        float _1144 = _1090;
        float _1146 = _1102;
        float _1148 = _1082;
        float _1150 = _1096;
        float _1152 = _1098;
        float _1154 = _1104;
        float _1156 = _1080;
        bool _1158;
        int _1206;
        int _1216;
        int _1226;
        int _1236;
        int _1246;
        int _1256;
        int _1266;
        int _1276;
        int _1286;
        int _1296;
        int _1306;
        int _1316;
        float _1424;
        float _1426;
        float _1428;
        int _1430;
        int _1432;
        int _1434;
        int _1436;
        int _1438;
        float _1440;
        float _1442;
        float _1444;
        float _1446;
        do
        {
            int _1160 = _1132;
            float _1162 = _1134;
            float _1164 = _1136;
            float _1166 = _1138;
            int _1168 = as_type<int>(_1140);
            int _1170 = as_type<int>(_1142);
            int _1172 = as_type<int>(_1144);
            int _1174 = as_type<int>(_1146);
            int _1176 = as_type<int>(_1148);
            float _1178 = _1150;
            float _1180 = _1152;
            float _1182 = _1154;
            float _1184 = _1156;
            uint _1186 = uint(int(uint(_1106) >> uint(2)));
            uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
            int _1190 = int(_1186) & 3;
            float _1192 = (*spvDescriptorSet0.cp_c6)._m0[int(_1188)][_1190];
            bool _1194 = _70 != 0;
            int _1196 = _1160 + 1;
            bool _1198 = uint(_1196) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1200 = as_type<int>(_1162);
            int _1202 = as_type<int>(_1192);
            int _1204 = 31;
            int _3355 = _60(_1200, _1202, _1204, _1206, gl_SubgroupInvocationID);
            int _1208 = _3355;
            int _1210 = as_type<int>(_1164);
            int _1212 = as_type<int>(_1192);
            int _1214 = 31;
            int _3360 = _60(_1210, _1212, _1214, _1216, gl_SubgroupInvocationID);
            int _1218 = _3360;
            int _1220 = as_type<int>(_1166);
            int _1222 = as_type<int>(_1192);
            int _1224 = 31;
            int _3365 = _60(_1220, _1222, _1224, _1226, gl_SubgroupInvocationID);
            int _1228 = _3365;
            int _1230 = _1168;
            int _1232 = as_type<int>(_1192);
            int _1234 = 31;
            int _3369 = _60(_1230, _1232, _1234, _1236, gl_SubgroupInvocationID);
            int _1238 = _3369;
            int _1240 = _1170;
            int _1242 = as_type<int>(_1192);
            int _1244 = 31;
            int _3373 = _60(_1240, _1242, _1244, _1246, gl_SubgroupInvocationID);
            int _1248 = _3373;
            int _1250 = _1172;
            int _1252 = as_type<int>(_1192);
            int _1254 = 31;
            int _3377 = _60(_1250, _1252, _1254, _1256, gl_SubgroupInvocationID);
            int _1258 = _3377;
            int _1260 = _1174;
            int _1262 = as_type<int>(_1192);
            int _1264 = 31;
            int _3381 = _60(_1260, _1262, _1264, _1266, gl_SubgroupInvocationID);
            int _1268 = _3381;
            int _1270 = _1176;
            int _1272 = as_type<int>(_1192);
            int _1274 = 31;
            int _3385 = _60(_1270, _1272, _1274, _1276, gl_SubgroupInvocationID);
            int _1278 = _3385;
            int _1280 = as_type<int>(_1178);
            int _1282 = as_type<int>(_1192);
            int _1284 = 31;
            int _3390 = _60(_1280, _1282, _1284, _1286, gl_SubgroupInvocationID);
            int _1288 = _3390;
            int _1290 = as_type<int>(_1180);
            int _1292 = as_type<int>(_1192);
            int _1294 = 31;
            int _3395 = _60(_1290, _1292, _1294, _1296, gl_SubgroupInvocationID);
            int _1298 = _3395;
            int _1300 = as_type<int>(_1182);
            int _1302 = as_type<int>(_1192);
            int _1304 = 31;
            int _3400 = _60(_1300, _1302, _1304, _1306, gl_SubgroupInvocationID);
            int _1308 = _3400;
            int _1310 = as_type<int>(_1184);
            int _1312 = as_type<int>(_1192);
            int _1314 = 31;
            int _3405 = _60(_1310, _1312, _1314, _1316, gl_SubgroupInvocationID);
            int _1318 = _3405;
            bool _1320 = !_1194;
            _1132 = _1196;
            float _1322 = _1162;
            float _1324 = _1164;
            float _1326 = _1166;
            int _1328 = _1168;
            int _1330 = _1170;
            int _1332 = _1172;
            int _1334 = _1174;
            int _1336 = _1176;
            float _1338 = _1178;
            float _1340 = _1180;
            float _1342 = _1182;
            float _1344 = _1184;
            if (!_1320)
            {
                float _1346 = as_type<float>(_1218) * _1082;
                float _1348 = _1094 * as_type<float>(_1258);
                float _1350 = _1102 * as_type<float>(_1258);
                float _1352 = as_type<float>(_1258) * _1082;
                float _1354 = _1094 * as_type<float>(_1218);
                float _1356 = _1090 * as_type<float>(_1218);
                float _1358 = _1102 * as_type<float>(_1218);
                float _1360 = fma(as_type<float>(_1208), _1084, _1346);
                float _1362 = fma(_1092, as_type<float>(_1248), _1348);
                float _1364 = fma(_1100, as_type<float>(_1248), _1350);
                float _1366 = fma(as_type<float>(_1248), _1084, _1352);
                float _1368 = _1090 * as_type<float>(_1258);
                float _1370 = _1094 * as_type<float>(_1298);
                float _1372 = _1090 * as_type<float>(_1298);
                float _1374 = _1102 * as_type<float>(_1298);
                float _1376 = as_type<float>(_1298) * _1082;
                float _1378 = fma(_1092, as_type<float>(_1208), _1354);
                float _1380 = fma(_1088, as_type<float>(_1208), _1356);
                float _1382 = fma(_1100, as_type<float>(_1208), _1358);
                float _1384 = fma(_1088, as_type<float>(_1248), _1368);
                float _1386 = fma(_1092, as_type<float>(_1288), _1370);
                float _1388 = fma(_1088, as_type<float>(_1288), _1372);
                float _1390 = fma(_1100, as_type<float>(_1288), _1374);
                float _1392 = fma(as_type<float>(_1288), _1084, _1376);
                float _1394 = fma(_1096, as_type<float>(_1228), _1378);
                float _1396 = fma(_1098, as_type<float>(_1228), _1380);
                float _1398 = fma(_1104, as_type<float>(_1228), _1382);
                float _1400 = fma(as_type<float>(_1228), _1080, _1360);
                float _1402 = fma(_1096, as_type<float>(_1268), _1362);
                float _1404 = fma(_1098, as_type<float>(_1268), _1384);
                float _1406 = fma(_1104, as_type<float>(_1268), _1364);
                float _1408 = fma(as_type<float>(_1268), _1080, _1366);
                float _1410 = fma(as_type<float>(_1308), _1080, _1392);
                float _1412 = fma(_1098, as_type<float>(_1308), _1388);
                float _1414 = fma(_1096, as_type<float>(_1308), _1386);
                float _1416 = fma(_1104, as_type<float>(_1308), _1390);
                float _1418 = as_type<float>(_1238) + _1400;
                float _1420 = as_type<float>(_1278) + _1408;
                float _1422 = as_type<float>(_1318) + _1410;
                _1322 = _1394;
                _1324 = _1396;
                _1326 = _1398;
                _1328 = as_type<int>(_1418);
                _1330 = as_type<int>(_1402);
                _1332 = as_type<int>(_1404);
                _1334 = as_type<int>(_1406);
                _1336 = as_type<int>(_1420);
                _1338 = _1414;
                _1340 = _1412;
                _1342 = _1416;
                _1344 = _1422;
            }
            _1424 = _1322;
            _1426 = _1324;
            _1428 = _1326;
            _1430 = _1328;
            _1432 = _1330;
            _1434 = _1332;
            _1436 = _1334;
            _1438 = _1336;
            _1440 = _1338;
            _1442 = _1340;
            _1444 = _1342;
            _1446 = _1344;
            _1158 = !_1198;
            _1134 = _1424;
            _1136 = _1426;
            _1138 = _1428;
            _1140 = as_type<float>(_1430);
            _1142 = as_type<float>(_1432);
            _1144 = as_type<float>(_1434);
            _1146 = as_type<float>(_1436);
            _1148 = as_type<float>(_1438);
            _1150 = _1440;
            _1152 = _1442;
            _1154 = _1444;
            _1156 = _1446;
        } while (_1158);
        _1110 = _1424;
        _1112 = _1426;
        _1114 = _1428;
        _1116 = as_type<float>(_1430);
        _1118 = as_type<float>(_1432);
        _1120 = as_type<float>(_1434);
        _1122 = as_type<float>(_1436);
        _1124 = as_type<float>(_1438);
        _1448 = _1440;
        _1126 = _1442;
        _1128 = _1444;
        _1130 = _1446;
        _1450 = true;
    }
    else
    {
        _1448 = _1096;
    }
    _1450 = false;
    float _1452 = _1110;
    float _1454 = _1112;
    float _1456 = _1114;
    float _1458 = _1116;
    float _1460 = _1118;
    float _1462 = _1120;
    float _1464 = _1122;
    float _1466 = _1124;
    float _1468 = _1448;
    float _1470 = _1126;
    float _1472 = _1128;
    float _1474 = _1130;
    int _1476 = _1106 + 80;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    uint _1480 = uint(int(uint(int(_1478)) >> uint(2)));
    int _1482 = int(_1478) & 3;
    float _1484 = (*spvDescriptorSet0.cp_c6)._m0[int(_1480)][_1482];
    int _1486 = int(_1478) + 1;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    int _1490 = _1486 & 3;
    float _1492 = (*spvDescriptorSet0.cp_c6)._m0[int(_1488)][_1490];
    bool _1494 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1496 = _1106 + 64;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.cp_c6)._m0[int(_1508)][_1510];
    int _1514 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1516 = _1514 + _70;
    int _1518 = _1106 + 88;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.cp_c6)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.cp_c6)._m0[int(_1530)][_1532];
    int _1536 = _1106 + 72;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
    int _1542 = int(_1538) & 3;
    float _1544 = (*spvDescriptorSet0.cp_c6)._m0[int(_1540)][_1542];
    int _1546 = int(_1538) + 1;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    int _1550 = _1546 & 3;
    float _1552 = (*spvDescriptorSet0.cp_c6)._m0[int(_1548)][_1550];
    int _1554 = _1106 + 96;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.cp_c6)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.cp_c6)._m0[int(_1566)][_1568];
    int _1572 = _1106 + 104;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    uint _1576 = uint(int(uint(int(_1574)) >> uint(2)));
    int _1578 = int(_1574) & 3;
    float _1580 = (*spvDescriptorSet0.cp_c6)._m0[int(_1576)][_1578];
    int _1582 = int(_1574) + 1;
    uint _1584 = uint(int(uint(_1582) >> uint(2)));
    int _1586 = _1582 & 3;
    float _1588 = (*spvDescriptorSet0.cp_c6)._m0[int(_1584)][_1586];
    int _1590 = _1106 + 16;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.cp_c6)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.cp_c6)._m0[int(_1602)][_1604];
    if (!_1494)
    {
        int _1608 = _70 * 48;
        int _1610 = _1608 + 16;
        uint _1612 = uint(int(uint(_1608) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1612)] = as_type<uint>(_1452);
        int _1614 = _1608 + 4;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1616)] = as_type<uint>(_1454);
        int _1618 = _1608 + 8;
        uint _1620 = uint(int(uint(_1618) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1620)] = as_type<uint>(_1456);
        int _1622 = _1608 + 12;
        uint _1624 = uint(int(uint(_1622) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1624)] = as_type<uint>(_1458);
        int _1626 = _1608 + 32;
        uint _1628 = uint(int(uint(_1610) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1628)] = as_type<uint>(_1460);
        int _1630 = _1610 + 4;
        uint _1632 = uint(int(uint(_1630) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1632)] = as_type<uint>(_1462);
        int _1634 = _1610 + 8;
        uint _1636 = uint(int(uint(_1634) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1636)] = as_type<uint>(_1464);
        int _1638 = _1610 + 12;
        uint _1640 = uint(int(uint(_1638) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1640)] = as_type<uint>(_1466);
        uint _1642 = uint(int(uint(_1626) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1642)] = as_type<uint>(_1468);
        int _1644 = _1626 + 4;
        uint _1646 = uint(int(uint(_1644) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1646)] = as_type<uint>(_1470);
        int _1648 = _1626 + 8;
        uint _1650 = uint(int(uint(_1648) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1650)] = as_type<uint>(_1472);
        int _1652 = _1626 + 12;
        uint _1654 = uint(int(uint(_1652) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1654)] = as_type<uint>(_1474);
    }
    float _1656 = _1470 * _1484;
    float _1658 = _1454 * _1484;
    float _1660 = _1462 * _1484;
    int _1662 = _1106 + 32;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    uint _1666 = uint(int(uint(int(_1664)) >> uint(2)));
    int _1668 = int(_1664) & 3;
    float _1670 = (*spvDescriptorSet0.cp_c6)._m0[int(_1666)][_1668];
    int _1672 = int(_1664) + 1;
    uint _1674 = uint(int(uint(_1672) >> uint(2)));
    int _1676 = _1672 & 3;
    float _1678 = (*spvDescriptorSet0.cp_c6)._m0[int(_1674)][_1676];
    float _1680 = fma(_1468, _1504, _1656);
    float _1682 = _1454 * _1492;
    float _1684 = fma(_1452, _1504, _1658);
    float _1686 = fma(_1460, _1504, _1660);
    float _1688 = _1462 * _1492;
    float _1690 = fma(_1452, _1512, _1682);
    float _1692 = _1454 * _1526;
    float _1694 = _1454 * _1534;
    float _1696 = _1470 * _1492;
    int _1698 = _1106 + 48;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    uint _1702 = uint(int(uint(int(_1700)) >> uint(2)));
    int _1704 = int(_1700) & 3;
    float _1706 = (*spvDescriptorSet0.cp_c6)._m0[int(_1702)][_1704];
    int _1708 = int(_1700) + 1;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    int _1712 = _1708 & 3;
    float _1714 = (*spvDescriptorSet0.cp_c6)._m0[int(_1710)][_1712];
    float _1716 = _1462 * _1526;
    float _1718 = _1462 * _1534;
    float _1720 = fma(_1460, _1512, _1688);
    float _1722 = fma(_1468, _1512, _1696);
    float _1724 = _1470 * _1526;
    float _1726 = _1470 * _1534;
    float _1728 = fma(_1452, _1544, _1692);
    float _1730 = fma(_1452, _1552, _1694);
    float _1732 = fma(_1460, _1544, _1716);
    int _1734 = _1106 + 24;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    uint _1738 = uint(int(uint(int(_1736)) >> uint(2)));
    int _1740 = int(_1736) & 3;
    float _1742 = (*spvDescriptorSet0.cp_c6)._m0[int(_1738)][_1740];
    int _1744 = int(_1736) + 1;
    uint _1746 = uint(int(uint(_1744) >> uint(2)));
    int _1748 = _1744 & 3;
    float _1750 = (*spvDescriptorSet0.cp_c6)._m0[int(_1746)][_1748];
    float _1752 = fma(_1460, _1552, _1718);
    float _1754 = fma(_1468, _1552, _1726);
    float _1756 = fma(_1468, _1544, _1724);
    float _1758 = fma(_1456, _1562, _1684);
    float _1760 = fma(_1464, _1588, _1752);
    float _1762 = fma(_1464, _1562, _1686);
    float _1764 = fma(_1472, _1562, _1680);
    int _1766 = _1106 + 40;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.cp_c6)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.cp_c6)._m0[int(_1778)][_1780];
    float _1784 = fma(_1456, _1570, _1690);
    float _1786 = fma(_1456, _1580, _1728);
    float _1788 = fma(_1456, _1588, _1730);
    float _1790 = fma(_1464, _1570, _1720);
    float _1792 = fma(_1464, _1580, _1732);
    float _1794 = fma(_1472, _1588, _1754);
    float _1796 = _1760 + _1466;
    int _1798 = _1106 + 56;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.cp_c6)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.cp_c6)._m0[int(_1810)][_1812];
    float _1816 = fma(_1472, _1570, _1722);
    float _1818 = fma(_1472, _1580, _1756);
    float _1820 = _1794 + _1474;
    float _1822 = _1788 + _1458;
    float _1824 = _1762 * _1606;
    float _1826 = _1790 * _1606;
    float _1828 = _1792 * _1606;
    float _1830 = _1796 * _1606;
    float _1832 = fma(_1758, _1598, _1824);
    float _1834 = fma(_1784, _1598, _1826);
    float _1836 = fma(_1786, _1598, _1828);
    float _1838 = fma(_1822, _1598, _1830);
    float _1840 = _1796 * _1678;
    float _1842 = _1762 * _1678;
    float _1844 = _1790 * _1678;
    float _1846 = _1792 * _1678;
    float _1848 = fma(_1822, _1670, _1840);
    float _1850 = fma(_1758, _1670, _1842);
    float _1852 = fma(_1784, _1670, _1844);
    float _1854 = fma(_1786, _1670, _1846);
    int _1856 = _1516 * 48;
    float _1858 = _1796 * _1714;
    float _1860 = _1762 * _1714;
    float _1862 = _1790 * _1714;
    float _1864 = _1792 * _1714;
    float _1866 = fma(_1822, _1706, _1858);
    float _1868 = fma(_1758, _1706, _1860);
    float _1870 = fma(_1784, _1706, _1862);
    float _1872 = fma(_1786, _1706, _1864);
    float _1874 = fma(_1820, _1742, _1838);
    float _1876 = fma(_1816, _1742, _1834);
    float _1878 = fma(_1764, _1742, _1832);
    float _1880 = fma(_1818, _1742, _1836);
    float _1882 = _1874 + _1750;
    float _1884 = fma(_1820, _1774, _1848);
    float _1886 = fma(_1764, _1774, _1850);
    float _1888 = fma(_1816, _1774, _1852);
    float _1890 = fma(_1818, _1774, _1854);
    float _1892 = _1884 + _1782;
    int _1894 = _1856 + 16;
    int _1896 = _1856 + 32;
    float _1898 = fma(_1820, _1806, _1866);
    float _1900 = fma(_1764, _1806, _1868);
    float _1902 = fma(_1816, _1806, _1870);
    float _1904 = fma(_1818, _1806, _1872);
    float _1906 = _1898 + _1814;
    int _1908 = _1856 + 48;
    uint _1910 = uint(int(uint(_1894) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1910)] = as_type<uint>(_1878);
    int _1912 = _1894 + 4;
    uint _1914 = uint(int(uint(_1912) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1914)] = as_type<uint>(_1876);
    int _1916 = _1894 + 8;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1918)] = as_type<uint>(_1880);
    int _1920 = _1894 + 12;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1922)] = as_type<uint>(_1882);
    uint _1924 = uint(int(uint(_1896) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1924)] = as_type<uint>(_1886);
    int _1926 = _1896 + 4;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1928)] = as_type<uint>(_1888);
    int _1930 = _1896 + 8;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1932)] = as_type<uint>(_1890);
    int _1934 = _1896 + 12;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1936)] = as_type<uint>(_1892);
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

