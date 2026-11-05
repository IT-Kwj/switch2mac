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
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4750, thread const int& _4751, constant _10& support_buffer)
{
    int _4754 = 1 + _4751;
    float _4756 = support_buffer._m5[_4754].x;
    bool _4758 = _4756 == 1.0;
    if (_4758)
    {
        return _4750;
    }
    float _4760 = float(_4750);
    float _4762 = _4760 * _4756;
    int _4764 = int(_4762);
    return _4764;
}

static inline __attribute__((always_inline))
void _54(thread const int& _4442, thread const int& _4443, thread const int& _4444, thread const int& _4445, thread int& _4446, thread int& _4447, thread int& _4448, thread int& _4449, thread int& _4450, thread int& _4451)
{
    float _4454 = as_type<float>(_4444) + 0.0;
    bool _4456 = _4454 != 0.0;
    bool _4458 = isnan(_4454);
    bool _4460 = _4456 || _4458;
    bool _4462 = isnan(0.0);
    bool _4464 = _4460 || _4462;
    int _4466 = _4442;
    int _4468 = _4443;
    int _4470 = _4444;
    int _4472 = _4464 ? (-1) : 0;
    if (!_4464)
    {
        float _4474 = as_type<float>(_4444) * 1.0;
        _4466 = as_type<int>(_4474);
    }
    int _4476 = _4466;
    bool _4478 = !_4464;
    int _4480 = _4476;
    int _4482 = _4476;
    if (!_4478)
    {
        float _4484 = as_type<float>(_4444) + 0.0;
        bool _4486 = _4484 >= 0.0;
        bool _4488 = isnan(_4484);
        bool _4490 = _4486 || _4488;
        bool _4492 = isnan(0.0);
        bool _4494 = _4490 || _4492;
        _4472 = _4494 ? (-1) : 0;
        if (!_4494)
        {
            _4480 = 2147483647;
        }
        int _4496 = _4480;
        bool _4498 = !_4494;
        int _4500 = _4496;
        _4482 = _4496;
        if (!_4498)
        {
            float _4502 = as_type<float>(_4444) + 0.0;
            bool _4504 = _4502 > as_type<float>(0x7f800000u /* inf */);
            bool _4506 = isnan(_4502);
            bool _4508 = _4504 || _4506;
            bool _4510 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4512 = _4508 || _4510;
            _4472 = _4512 ? (-1) : 0;
            if (_4512)
            {
                float _4514 = as_type<float>(_4444) + 1.0;
                _4500 = as_type<int>(_4514);
            }
            int _4516 = _4500;
            int _4518 = _4516;
            _4482 = _4516;
            if (!_4512)
            {
                float _4520 = 0.0 + as_type<float>(_4444);
                bool _4522 = _4520 != as_type<float>(0x7f800000u /* inf */);
                bool _4524 = isnan(_4520);
                bool _4526 = _4522 || _4524;
                bool _4528 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4530 = _4526 || _4528;
                _4472 = _4530 ? (-1) : 0;
                if (!_4530)
                {
                    _4518 = _4444;
                }
                int _4532 = _4518;
                bool _4534 = !_4530;
                _4482 = _4532;
                if (!_4534)
                {
                    float _4536 = as_type<float>(_4444) * 18446744073709551616.0;
                    float _4538 = rsqrt(_4536);
                    float _4540 = _4536 * _4538;
                    float _4542 = _4538 * 0.5;
                    float _4544 = -_4540;
                    float _4546 = 0.0 + _4544;
                    float _4548 = fma(_4542, _4546, 0.5);
                    float _4550 = fma(_4540, _4548, _4540);
                    float _4552 = -_4550;
                    float _4554 = 0.0 + _4552;
                    float _4556 = fma(_4550, _4554, _4536);
                    float _4558 = fma(_4542, _4556, _4550);
                    float _4560 = _4558 * 2.3283064365386962890625e-10;
                    _4482 = as_type<int>(_4560);
                    _4468 = as_type<int>(_4550);
                    _4470 = as_type<int>(_4546);
                }
            }
        }
    }
    int _4562 = _4482;
    int _4564 = _4468;
    int _4566 = _4470;
    int _4568 = _4472;
    _4446 = _4445;
    _4447 = 0;
    _4448 = _4562;
    _4449 = _4564;
    _4450 = _4566;
    _4451 = _4568;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4785, thread const int& _4786, thread const int& _4787, thread int& _4788, thread uint& gl_SubgroupInvocationID)
{
    int _4791 = _4787 & 31;
    uint _4793 = uint(int(uint(_4787) >> uint(8)));
    int _4795 = int(_4793) & 31;
    float _4797 = as_type<float>(gl_SubgroupInvocationID);
    int _4799 = as_type<int>(_4797) & _4795;
    int _4801 = ~_4795;
    int _4803 = _4791 & _4801;
    int _4805 = _4803 | _4799;
    int _4807 = ~_4795;
    int _4809 = _4786 & _4807;
    int _4811 = _4809 | _4799;
    bool _4813 = uint(_4811) <= uint(_4805);
    _4788 = _4813 ? (-1) : 0;
    float _4815 = spvSubgroupShuffle(as_type<float>(_4785), uint(_4811));
    uint _4817 = uint(_4813 ? as_type<int>(_4815) : _4785);
    return int(_4817);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1448 = false;
    bool _1006 = false;
    bool _608 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = _68 & 31;
    bool _76 = _74 == 0;
    bool _78 = uint(_74) < 32u;
    int _80 = 32 - _74;
    int _82 = _74 - 32;
    int _84 = 1 << _74;
    uint _87 = uint(int(uint(0) >> uint(_80)));
    int _89 = _84 | int(_87);
    int _91 = _76 ? 1 : _89;
    bool _93 = uint(_82) < 32u;
    int _95 = 0 << _82;
    int _97 = _93 ? _95 : 0;
    float _99 = _78 ? as_type<float>(_91) : as_type<float>(_97);
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 36;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    float _131 = _99;
    if (!_125)
    {
        _131 = 0.0;
    }
    float _133 = _131;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = _133;
    if (!_125)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _141 = _135;
    float _143 = _137;
    float _145 = 0.0;
    float _147 = 0.0;
    float _149 = _141;
    float _151 = _143;
    if (!_125)
    {
        _145 = 0.0;
        _147 = 0.0;
    }
    float _153 = _145;
    float _155 = _147;
    float _157 = 0.0;
    float _159 = 0.0;
    float _161 = _153;
    float _163 = _155;
    if (!_125)
    {
        _157 = 0.0;
        _159 = 0.0;
    }
    float _165 = _157;
    float _167 = _159;
    float _169 = 0.0;
    float _171 = 0.0;
    float _173 = _165;
    float _175 = _167;
    if (!_125)
    {
        _169 = 0.0;
        _171 = 0.0;
    }
    float _177 = _169;
    float _179 = _171;
    float _181 = 0.0;
    float _183 = _177;
    float _185 = _179;
    if (!_125)
    {
        _181 = 0.0;
    }
    float _187 = _181;
    bool _189 = !_125;
    float _191 = _187;
    if (!_189)
    {
        uint _193 = uint(int(uint(_101) >> uint(2)));
        uint _195 = uint(int(uint(int(_193)) >> uint(2)));
        int _197 = int(_193) & 3;
        float _199 = (*spvDescriptorSet0.cp_c5)._m0[int(_195)][_197];
        int _201 = int(_193) + 1;
        uint _203 = uint(int(uint(_201) >> uint(2)));
        int _205 = _201 & 3;
        float _207 = (*spvDescriptorSet0.cp_c5)._m0[int(_203)][_205];
        int _209 = _68;
        int _211 = 0;
        int _213 = _56(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = as_type<int>(_199);
        int _217 = 0;
        int _219 = _56(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _2110 = int3(_213, _219, 1);
        float4 _222 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2110.xy), uint(_2110.z), 0).xyzw;
        float _224 = _222.x;
        float _226 = _222.y;
        float _228 = _222.z;
        float _230 = _222.w;
        int _232 = _68;
        int _234 = 0;
        int _236 = _56(_232, _234, (*spvDescriptorSet0.support_buffer));
        int _238 = as_type<int>(_207);
        int _240 = 0;
        int _242 = _56(_238, _240, (*spvDescriptorSet0.support_buffer));
        int3 _2130 = int3(_236, _242, 1);
        float4 _244 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2130.xy), uint(_2130.z), 0).xyzw;
        float _246 = _244.x;
        float _248 = _244.y;
        float _250 = _244.z;
        float _252 = _244.w;
        int _254 = _68;
        int _256 = 0;
        int _258 = _56(_254, _256, (*spvDescriptorSet0.support_buffer));
        int _260 = as_type<int>(_199);
        int _262 = 0;
        int _264 = _56(_260, _262, (*spvDescriptorSet0.support_buffer));
        int3 _2150 = int3(_258, _264, 0);
        float3 _268 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2150.xy), uint(_2150.z), 0).xyz;
        float _270 = _268.x;
        float _272 = _268.y;
        float _274 = _268.z;
        int _276 = _68;
        int _278 = 0;
        int _280 = _56(_276, _278, (*spvDescriptorSet0.support_buffer));
        int _282 = as_type<int>(_207);
        int _284 = 0;
        int _286 = _56(_282, _284, (*spvDescriptorSet0.support_buffer));
        int3 _2168 = int3(_280, _286, 0);
        float3 _288 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2168.xy), uint(_2168.z), 0).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        int _296 = _68;
        int _298 = 0;
        int _300 = _56(_296, _298, (*spvDescriptorSet0.support_buffer));
        int _302 = as_type<int>(_199);
        int _304 = 0;
        int _306 = _56(_302, _304, (*spvDescriptorSet0.support_buffer));
        int3 _2186 = int3(_300, _306, 2);
        float3 _308 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2186.xy), uint(_2186.z), 0).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        int _316 = _68;
        int _318 = 0;
        int _320 = _56(_316, _318, (*spvDescriptorSet0.support_buffer));
        int _322 = as_type<int>(_207);
        int _324 = 0;
        int _326 = _56(_322, _324, (*spvDescriptorSet0.support_buffer));
        int3 _2204 = int3(_320, _326, 2);
        float3 _328 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2204.xy), uint(_2204.z), 0).xyz;
        float _330 = _328.x;
        float _332 = _328.y;
        float _334 = _328.z;
        int _336 = _101 + 16;
        uint _338 = uint(int(uint(_336) >> uint(2)));
        uint _340 = uint(int(uint(int(_338)) >> uint(2)));
        int _342 = int(_338) & 3;
        float _344 = (*spvDescriptorSet0.cp_c5)._m0[int(_340)][_342];
        float _346 = -_224;
        float _348 = _346 + _246;
        float _350 = -_226;
        float _352 = _350 + _248;
        float _354 = -_228;
        float _356 = _354 + _250;
        float _358 = -_230;
        float _360 = _358 + _252;
        float _362 = -_274;
        float _364 = _362 + _294;
        float _366 = fma(_352, _344, _226);
        float _368 = -_272;
        float _370 = _368 + _292;
        float _372 = -_270;
        float _374 = _372 + _290;
        float _376 = fma(_356, _344, _228);
        float _378 = -_310;
        float _380 = _378 + _330;
        float _382 = fma(_370, _344, _272);
        float _384 = -_312;
        float _386 = _384 + _332;
        float _388 = -_314;
        float _390 = _388 + _334;
        float _392 = fma(_360, _344, _230);
        float _394 = fma(_374, _344, _270);
        float _396 = fma(_348, _344, _224);
        float _398 = fma(_364, _344, _274);
        float _400 = fma(_380, _344, _310);
        float _402 = fma(_386, _344, _312);
        float _404 = fma(_390, _344, _314);
        _191 = _366;
        _149 = _396;
        _161 = _376;
        _183 = _392;
        _151 = _382;
        _163 = _398;
        _173 = _400;
        _139 = _394;
        _175 = _402;
        _185 = _404;
    }
    float _406 = _191;
    float _408 = _149;
    float _410 = _161;
    float _412 = _183;
    float _414 = _151;
    float _416 = _163;
    float _418 = _173;
    float _420 = _139;
    float _422 = _175;
    float _424 = _185;
    bool _426 = !_129;
    float _428 = _420;
    float _430 = _414;
    float _432 = _416;
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
    if (!_426)
    {
        int _434 = _101 + 8;
        uint _436 = uint(int(uint(_434) >> uint(2)));
        uint _438 = uint(int(uint(int(_436)) >> uint(2)));
        int _440 = int(_436) & 3;
        float _442 = (*spvDescriptorSet0.cp_c5)._m0[int(_438)][_440];
        int _444 = int(_436) + 1;
        uint _446 = uint(int(uint(_444) >> uint(2)));
        int _448 = _444 & 3;
        float _450 = (*spvDescriptorSet0.cp_c5)._m0[int(_446)][_448];
        int _452 = _68;
        int _454 = 1;
        int _456 = _56(_452, _454, (*spvDescriptorSet0.support_buffer));
        int _458 = as_type<int>(_442);
        int _460 = 1;
        int _462 = _56(_458, _460, (*spvDescriptorSet0.support_buffer));
        int3 _2391 = int3(_456, _462, 1);
        float4 _464 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2391.xy), uint(_2391.z), 0).xyzw;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float _472 = _464.w;
        int _474 = _68;
        int _476 = 1;
        int _478 = _56(_474, _476, (*spvDescriptorSet0.support_buffer));
        int _480 = as_type<int>(_450);
        int _482 = 1;
        int _484 = _56(_480, _482, (*spvDescriptorSet0.support_buffer));
        int3 _2411 = int3(_478, _484, 1);
        float4 _486 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2411.xy), uint(_2411.z), 0).xyzw;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float _494 = _486.w;
        int _496 = _101 + 24;
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
        float _530 = _522 * _406;
        float _532 = fma(_524, _408, _530);
        float _534 = fma(_526, _410, _532);
        float _536 = fma(_528, _412, _534);
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
            _54(_586, _588, _590, _592, _594, _596, _598, _600, _602, _604);
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
        int _634 = _101 + 8;
        uint _636 = uint(int(uint(_634) >> uint(2)));
        uint _638 = uint(int(uint(int(_636)) >> uint(2)));
        int _640 = int(_636) & 3;
        float _642 = (*spvDescriptorSet0.cp_c5)._m0[int(_638)][_640];
        int _644 = int(_636) + 1;
        uint _646 = uint(int(uint(_644) >> uint(2)));
        int _648 = _644 & 3;
        float _650 = (*spvDescriptorSet0.cp_c5)._m0[int(_646)][_648];
        int _652 = _68;
        int _654 = 1;
        int _656 = _56(_652, _654, (*spvDescriptorSet0.support_buffer));
        int _658 = as_type<int>(_642);
        int _660 = 1;
        int _662 = _56(_658, _660, (*spvDescriptorSet0.support_buffer));
        int3 _2641 = int3(_656, _662, 0);
        float3 _664 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2641.xy), uint(_2641.z), 0).xyz;
        float _666 = _664.x;
        float _668 = _664.y;
        float _670 = _664.z;
        int _672 = _68;
        int _674 = 1;
        int _676 = _56(_672, _674, (*spvDescriptorSet0.support_buffer));
        int _678 = as_type<int>(_642);
        int _680 = 1;
        int _682 = _56(_678, _680, (*spvDescriptorSet0.support_buffer));
        int3 _2659 = int3(_676, _682, 2);
        float3 _684 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2659.xy), uint(_2659.z), 0).xyz;
        float _686 = _684.x;
        float _688 = _684.y;
        float _690 = _684.z;
        int _692 = _68;
        int _694 = 1;
        int _696 = _56(_692, _694, (*spvDescriptorSet0.support_buffer));
        int _698 = as_type<int>(_650);
        int _700 = 1;
        int _702 = _56(_698, _700, (*spvDescriptorSet0.support_buffer));
        int3 _2677 = int3(_696, _702, 0);
        float3 _704 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2677.xy), uint(_2677.z), 0).xyz;
        float _706 = _704.x;
        float _708 = _704.y;
        float _710 = _704.z;
        int _712 = _68;
        int _714 = 1;
        int _716 = _56(_712, _714, (*spvDescriptorSet0.support_buffer));
        int _718 = as_type<int>(_650);
        int _720 = 1;
        int _722 = _56(_718, _720, (*spvDescriptorSet0.support_buffer));
        int3 _2695 = int3(_716, _722, 2);
        float3 _724 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2695.xy), uint(_2695.z), 0).xyz;
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
            int _766 = _101 + 28;
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
            int _794 = _101 + 28;
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
        float _852 = _522 * _838;
        float _854 = _526 * _838;
        float _856 = fma(_408, _830, _848);
        float _858 = fma(_412, _830, _850);
        int _860 = _101 + 24;
        uint _862 = uint(int(uint(_860) >> uint(2)));
        uint _864 = uint(int(uint(int(_862)) >> uint(2)));
        int _866 = int(_862) & 3;
        float _868 = (*spvDescriptorSet0.cp_c5)._m0[int(_864)][_866];
        float _870 = fma(_410, _830, _854);
        float _872 = fma(_406, _830, _852);
        float _874 = _858 * 2.0;
        float _876 = _856 * 2.0;
        float _878 = _872 * 2.0;
        float _880 = _856 * _874;
        int _882 = _101 + 20;
        uint _884 = uint(int(uint(_882) >> uint(2)));
        uint _886 = uint(int(uint(int(_884)) >> uint(2)));
        int _888 = int(_884) & 3;
        float _890 = (*spvDescriptorSet0.cp_c5)._m0[int(_886)][_888];
        float _892 = _870 * _874;
        float _894 = _872 * _874;
        float _896 = -_880;
        float _898 = fma(_870, _878, _896);
        float _900 = fma(_870, _878, _880);
        float _902 = -_666;
        float _904 = _902 + _706;
        float _906 = -_668;
        float _908 = _906 + _708;
        float _910 = -_892;
        float _912 = fma(_872, _876, _910);
        float _914 = fma(_872, _876, _892);
        float _916 = fma(_870, _876, _894);
        float _918 = -_894;
        float _920 = fma(_870, _876, _918);
        float _922 = _856 * _856;
        float _924 = _872 * _872;
        float _926 = _870 * _870;
        float _928 = fma(_908, _868, _668);
        float _930 = fma(_904, _868, _666);
        float _932 = fma(_842, _868, _670);
        float _934 = fma(_846, _868, _690);
        float _936 = _928 * _832;
        float _938 = -_686;
        float _940 = _938 + _726;
        float _942 = -_688;
        float _944 = _942 + _728;
        float _946 = fma(_924, -2.0, 1.0);
        float _948 = fma(_414, _890, _936);
        float _950 = fma(_940, _868, _686);
        float _952 = fma(_944, _868, _688);
        float _954 = _932 * _832;
        float _956 = fma(_922, -2.0, 1.0);
        float _958 = _950 * _832;
        float _960 = _930 * _832;
        float _962 = _952 * _832;
        float _964 = _934 * _832;
        float _966 = fma(_416, _890, _954);
        float _968 = fma(_418, _890, _958);
        float _970 = fma(_926, -2.0, _946);
        float _972 = fma(_926, -2.0, _956);
        float _974 = fma(_924, -2.0, _956);
        float _976 = fma(_420, _890, _960);
        float _978 = fma(_422, _890, _962);
        float _980 = fma(_424, _890, _964);
        _428 = _976;
        _982 = _970;
        _984 = _914;
        _986 = _920;
        _430 = _948;
        _988 = _912;
        _990 = _972;
        _992 = _900;
        _432 = _966;
        _994 = _916;
        _996 = _898;
        _998 = _974;
        _1000 = _980;
        _1002 = _978;
        _1004 = _968;
        _1006 = true;
    }
    else
    {
        float _1008 = _412 * 2.0;
        float _1010 = _408 * _408;
        float _1012 = _406 * _406;
        float _1014 = _408 * 2.0;
        float _1016 = _1008 * _410;
        float _1018 = _1008 * _406;
        float _1020 = fma(_1010, -2.0, 1.0);
        float _1022 = _1008 * _408;
        float _1024 = _406 * 2.0;
        float _1026 = _410 * _410;
        float _1028 = fma(_1012, -2.0, 1.0);
        float _1030 = -_1016;
        float _1032 = fma(_1014, _406, _1030);
        float _1034 = fma(_1014, _406, _1016);
        float _1036 = fma(_1014, _410, _1018);
        float _1038 = -_1018;
        float _1040 = fma(_1014, _410, _1038);
        float _1042 = -_1022;
        float _1044 = fma(_1024, _410, _1042);
        float _1046 = fma(_1026, -2.0, _1028);
        float _1048 = fma(_1024, _410, _1022);
        float _1050 = fma(_1026, -2.0, _1020);
        float _1052 = fma(_1012, -2.0, _1020);
        _982 = _1046;
        _984 = _1034;
        _986 = _1040;
        _988 = _1032;
        _990 = _1050;
        _992 = _1048;
        _994 = _1036;
        _996 = _1044;
        _998 = _1052;
        _1000 = _424;
        _1002 = _422;
        _1004 = _418;
    }
    _1006 = false;
    float _1054 = _428;
    float _1056 = _982;
    float _1058 = _984;
    float _1060 = _986;
    float _1062 = _430;
    float _1064 = _988;
    float _1066 = _990;
    float _1068 = _992;
    float _1070 = _432;
    float _1072 = _994;
    float _1074 = _996;
    float _1076 = _998;
    float _1078 = _1000;
    float _1080 = _1002;
    float _1082 = _1004;
    bool _1084 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _1086 = _1054 * _1056;
    float _1088 = _1054 * _1058;
    float _1090 = _1054 * _1060;
    float _1092 = _1062 * _1064;
    float _1094 = _1062 * _1066;
    float _1096 = _1062 * _1068;
    float _1098 = _1070 * _1072;
    float _1100 = _1070 * _1074;
    float _1102 = _1070 * _1076;
    int _1104 = _68 * 112;
    bool _1106 = !_1084;
    float _1108 = _1098;
    float _1110 = _1100;
    float _1428;
    float _1430;
    float _1432;
    float _1434;
    float _1436;
    float _1438;
    float _1440;
    float _1442;
    float _1444;
    float _1446;
    if (!_1106)
    {
        int _1112 = 0;
        float _1114 = _1086;
        float _1116 = _1092;
        float _1118 = _1098;
        float _1120 = _1082;
        float _1122 = _1088;
        float _1124 = _1094;
        float _1126 = _1100;
        float _1128 = _1080;
        float _1130 = _1090;
        float _1132 = _1096;
        float _1134 = _1102;
        float _1136 = _1078;
        bool _1138;
        int _1186;
        int _1196;
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
        int _1408;
        int _1410;
        int _1414;
        int _1416;
        int _1418;
        int _1422;
        int _1424;
        int _1426;
        do
        {
            int _1140 = _1112;
            int _1142 = as_type<int>(_1114);
            int _1144 = as_type<int>(_1116);
            int _1146 = as_type<int>(_1118);
            int _1148 = as_type<int>(_1120);
            int _1150 = as_type<int>(_1122);
            int _1152 = as_type<int>(_1124);
            int _1154 = as_type<int>(_1126);
            int _1156 = as_type<int>(_1128);
            int _1158 = as_type<int>(_1130);
            int _1160 = as_type<int>(_1132);
            int _1162 = as_type<int>(_1134);
            int _1164 = as_type<int>(_1136);
            uint _1166 = uint(int(uint(_1104) >> uint(2)));
            uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
            int _1170 = int(_1166) & 3;
            float _1172 = (*spvDescriptorSet0.cp_c6)._m0[int(_1168)][_1170];
            bool _1174 = _68 != 0;
            int _1176 = _1140 + 1;
            bool _1178 = uint(_1176) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1180 = _1142;
            int _1182 = as_type<int>(_1172);
            int _1184 = 31;
            int _3300 = _58(_1180, _1182, _1184, _1186, gl_SubgroupInvocationID);
            int _1188 = _3300;
            int _1190 = _1144;
            int _1192 = as_type<int>(_1172);
            int _1194 = 31;
            int _3304 = _58(_1190, _1192, _1194, _1196, gl_SubgroupInvocationID);
            int _1198 = _3304;
            int _1200 = _1146;
            int _1202 = as_type<int>(_1172);
            int _1204 = 31;
            int _3308 = _58(_1200, _1202, _1204, _1206, gl_SubgroupInvocationID);
            int _1208 = _3308;
            int _1210 = _1148;
            int _1212 = as_type<int>(_1172);
            int _1214 = 31;
            int _3312 = _58(_1210, _1212, _1214, _1216, gl_SubgroupInvocationID);
            int _1218 = _3312;
            int _1220 = _1150;
            int _1222 = as_type<int>(_1172);
            int _1224 = 31;
            int _3316 = _58(_1220, _1222, _1224, _1226, gl_SubgroupInvocationID);
            int _1228 = _3316;
            int _1230 = _1152;
            int _1232 = as_type<int>(_1172);
            int _1234 = 31;
            int _3320 = _58(_1230, _1232, _1234, _1236, gl_SubgroupInvocationID);
            int _1238 = _3320;
            int _1240 = _1154;
            int _1242 = as_type<int>(_1172);
            int _1244 = 31;
            int _3324 = _58(_1240, _1242, _1244, _1246, gl_SubgroupInvocationID);
            int _1248 = _3324;
            int _1250 = _1156;
            int _1252 = as_type<int>(_1172);
            int _1254 = 31;
            int _3328 = _58(_1250, _1252, _1254, _1256, gl_SubgroupInvocationID);
            int _1258 = _3328;
            int _1260 = _1158;
            int _1262 = as_type<int>(_1172);
            int _1264 = 31;
            int _3332 = _58(_1260, _1262, _1264, _1266, gl_SubgroupInvocationID);
            int _1268 = _3332;
            int _1270 = _1160;
            int _1272 = as_type<int>(_1172);
            int _1274 = 31;
            int _3336 = _58(_1270, _1272, _1274, _1276, gl_SubgroupInvocationID);
            int _1278 = _3336;
            int _1280 = _1162;
            int _1282 = as_type<int>(_1172);
            int _1284 = 31;
            int _3340 = _58(_1280, _1282, _1284, _1286, gl_SubgroupInvocationID);
            int _1288 = _3340;
            int _1290 = _1164;
            int _1292 = as_type<int>(_1172);
            int _1294 = 31;
            int _3344 = _58(_1290, _1292, _1294, _1296, gl_SubgroupInvocationID);
            int _1298 = _3344;
            bool _1300 = !_1174;
            _1112 = _1176;
            int _1302 = _1142;
            int _1304 = _1144;
            int _1306 = _1146;
            int _1308 = _1148;
            int _1310 = _1150;
            int _1312 = _1152;
            int _1314 = _1154;
            int _1316 = _1156;
            int _1318 = _1158;
            int _1320 = _1160;
            int _1322 = _1162;
            int _1324 = _1164;
            if (!_1300)
            {
                float _1326 = as_type<float>(_1198) * _1080;
                float _1328 = _1100 * as_type<float>(_1198);
                float _1330 = _1088 * as_type<float>(_1238);
                float _1332 = _1094 * as_type<float>(_1198);
                float _1334 = fma(as_type<float>(_1188), _1082, _1326);
                float _1336 = _1100 * as_type<float>(_1238);
                float _1338 = _1088 * as_type<float>(_1198);
                float _1340 = fma(_1098, as_type<float>(_1188), _1328);
                float _1342 = _1094 * as_type<float>(_1238);
                float _1344 = as_type<float>(_1238) * _1080;
                float _1346 = fma(_1086, as_type<float>(_1228), _1330);
                float _1348 = fma(_1098, as_type<float>(_1228), _1336);
                float _1350 = _1088 * as_type<float>(_1278);
                float _1352 = _1094 * as_type<float>(_1278);
                float _1354 = _1100 * as_type<float>(_1278);
                float _1356 = fma(_1092, as_type<float>(_1188), _1332);
                float _1358 = as_type<float>(_1278) * _1080;
                float _1360 = fma(_1086, as_type<float>(_1188), _1338);
                float _1362 = fma(_1092, as_type<float>(_1228), _1342);
                float _1364 = fma(as_type<float>(_1228), _1082, _1344);
                float _1366 = fma(_1086, as_type<float>(_1268), _1350);
                float _1368 = fma(_1092, as_type<float>(_1268), _1352);
                float _1370 = fma(_1098, as_type<float>(_1268), _1354);
                float _1372 = fma(as_type<float>(_1268), _1082, _1358);
                float _1374 = fma(_1096, as_type<float>(_1208), _1356);
                float _1376 = fma(_1090, as_type<float>(_1248), _1346);
                float _1378 = fma(_1096, as_type<float>(_1248), _1362);
                float _1380 = fma(as_type<float>(_1208), _1078, _1334);
                float _1382 = fma(_1090, as_type<float>(_1288), _1366);
                float _1384 = fma(as_type<float>(_1248), _1078, _1364);
                float _1386 = fma(as_type<float>(_1288), _1078, _1372);
                float _1388 = fma(_1102, as_type<float>(_1208), _1340);
                float _1390 = fma(_1102, as_type<float>(_1248), _1348);
                float _1392 = fma(_1096, as_type<float>(_1288), _1368);
                float _1394 = as_type<float>(_1218) + _1380;
                float _1396 = fma(_1090, as_type<float>(_1208), _1360);
                float _1398 = fma(_1102, as_type<float>(_1288), _1370);
                float _1400 = as_type<float>(_1258) + _1384;
                float _1402 = as_type<float>(_1298) + _1386;
                _1302 = as_type<int>(_1396);
                _1304 = as_type<int>(_1374);
                _1306 = as_type<int>(_1388);
                _1308 = as_type<int>(_1394);
                _1310 = as_type<int>(_1376);
                _1312 = as_type<int>(_1378);
                _1314 = as_type<int>(_1390);
                _1316 = as_type<int>(_1400);
                _1318 = as_type<int>(_1382);
                _1320 = as_type<int>(_1392);
                _1322 = as_type<int>(_1398);
                _1324 = as_type<int>(_1402);
            }
            int _1404 = _1302;
            int _1406 = _1304;
            _1408 = _1306;
            _1410 = _1308;
            int _1412 = _1310;
            _1414 = _1312;
            _1416 = _1314;
            _1418 = _1316;
            int _1420 = _1318;
            _1422 = _1320;
            _1424 = _1322;
            _1426 = _1324;
            _1138 = !_1178;
            _1114 = as_type<float>(_1404);
            _1116 = as_type<float>(_1406);
            _1118 = as_type<float>(_1408);
            _1120 = as_type<float>(_1410);
            _1122 = as_type<float>(_1412);
            _1124 = as_type<float>(_1414);
            _1126 = as_type<float>(_1416);
            _1128 = as_type<float>(_1418);
            _1130 = as_type<float>(_1420);
            _1132 = as_type<float>(_1422);
            _1134 = as_type<float>(_1424);
            _1136 = as_type<float>(_1426);
            _1428 = as_type<float>(_1406);
            _1430 = as_type<float>(_1404);
            _1432 = as_type<float>(_1412);
            _1434 = as_type<float>(_1420);
        } while (_1138);
        _1436 = as_type<float>(_1414);
        _1438 = as_type<float>(_1422);
        _1108 = as_type<float>(_1408);
        _1110 = as_type<float>(_1416);
        _1440 = as_type<float>(_1424);
        _1442 = as_type<float>(_1418);
        _1444 = as_type<float>(_1426);
        _1446 = as_type<float>(_1410);
        _1448 = true;
    }
    else
    {
        _1428 = _1092;
        _1436 = _1094;
        _1438 = _1096;
        _1430 = _1086;
        _1432 = _1088;
        _1434 = _1090;
        _1440 = _1102;
        _1442 = _1080;
        _1444 = _1078;
        _1446 = _1082;
    }
    _1448 = false;
    float _1450 = _1428;
    float _1452 = _1436;
    float _1454 = _1438;
    float _1456 = _1430;
    float _1458 = _1432;
    float _1460 = _1434;
    float _1462 = _1108;
    float _1464 = _1110;
    float _1466 = _1440;
    float _1468 = _1442;
    float _1470 = _1444;
    float _1472 = _1446;
    int _1474 = _1104 + 80;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
    int _1480 = int(_1476) & 3;
    float _1482 = (*spvDescriptorSet0.cp_c6)._m0[int(_1478)][_1480];
    int _1484 = int(_1476) + 1;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    int _1488 = _1484 & 3;
    float _1490 = (*spvDescriptorSet0.cp_c6)._m0[int(_1486)][_1488];
    int _1492 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1494 = _1492 + _68;
    int _1496 = _1104 + 64;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.cp_c6)._m0[int(_1508)][_1510];
    int _1514 = _1494 * 48;
    int _1516 = _1104 + 88;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
    int _1522 = int(_1518) & 3;
    float _1524 = (*spvDescriptorSet0.cp_c6)._m0[int(_1520)][_1522];
    int _1526 = int(_1518) + 1;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    int _1530 = _1526 & 3;
    float _1532 = (*spvDescriptorSet0.cp_c6)._m0[int(_1528)][_1530];
    int _1534 = _1104 + 72;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.cp_c6)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.cp_c6)._m0[int(_1546)][_1548];
    int _1552 = _1104 + 96;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    uint _1556 = uint(int(uint(int(_1554)) >> uint(2)));
    int _1558 = int(_1554) & 3;
    float _1560 = (*spvDescriptorSet0.cp_c6)._m0[int(_1556)][_1558];
    int _1562 = int(_1554) + 1;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    int _1566 = _1562 & 3;
    float _1568 = (*spvDescriptorSet0.cp_c6)._m0[int(_1564)][_1566];
    int _1570 = _1104 + 104;
    uint _1572 = uint(int(uint(_1570) >> uint(2)));
    uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
    int _1576 = int(_1572) & 3;
    float _1578 = (*spvDescriptorSet0.cp_c6)._m0[int(_1574)][_1576];
    int _1580 = int(_1572) + 1;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    int _1584 = _1580 & 3;
    float _1586 = (*spvDescriptorSet0.cp_c6)._m0[int(_1582)][_1584];
    float _1588 = _1450 * _1482;
    float _1590 = _1452 * _1482;
    float _1592 = _1454 * _1482;
    float _1594 = _1450 * _1490;
    float _1596 = _1454 * _1490;
    int _1598 = _1104 + 16;
    uint _1600 = uint(int(uint(_1598) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.cp_c6)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.cp_c6)._m0[int(_1610)][_1612];
    float _1616 = fma(_1456, _1504, _1588);
    float _1618 = fma(_1458, _1504, _1590);
    float _1620 = fma(_1460, _1504, _1592);
    float _1622 = _1452 * _1490;
    float _1624 = fma(_1456, _1512, _1594);
    int _1626 = _1104 + 32;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    uint _1630 = uint(int(uint(int(_1628)) >> uint(2)));
    int _1632 = int(_1628) & 3;
    float _1634 = (*spvDescriptorSet0.cp_c6)._m0[int(_1630)][_1632];
    int _1636 = int(_1628) + 1;
    uint _1638 = uint(int(uint(_1636) >> uint(2)));
    int _1640 = _1636 & 3;
    float _1642 = (*spvDescriptorSet0.cp_c6)._m0[int(_1638)][_1640];
    float _1644 = fma(_1460, _1512, _1596);
    float _1646 = fma(_1458, _1512, _1622);
    float _1648 = _1450 * _1524;
    float _1650 = _1452 * _1524;
    float _1652 = _1450 * _1532;
    float _1654 = _1452 * _1532;
    float _1656 = _1454 * _1524;
    int _1658 = _1104 + 48;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
    int _1664 = int(_1660) & 3;
    float _1666 = (*spvDescriptorSet0.cp_c6)._m0[int(_1662)][_1664];
    int _1668 = int(_1660) + 1;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    int _1672 = _1668 & 3;
    float _1674 = (*spvDescriptorSet0.cp_c6)._m0[int(_1670)][_1672];
    float _1676 = _1454 * _1532;
    float _1678 = fma(_1456, _1542, _1648);
    float _1680 = fma(_1458, _1542, _1650);
    float _1682 = fma(_1456, _1550, _1652);
    float _1684 = fma(_1458, _1550, _1654);
    float _1686 = fma(_1460, _1542, _1656);
    int _1688 = _1104 + 24;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.cp_c6)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.cp_c6)._m0[int(_1700)][_1702];
    float _1706 = fma(_1460, _1550, _1676);
    float _1708 = fma(_1462, _1560, _1616);
    float _1710 = fma(_1462, _1568, _1624);
    float _1712 = fma(_1464, _1560, _1618);
    float _1714 = fma(_1464, _1568, _1646);
    float _1716 = fma(_1466, _1560, _1620);
    int _1718 = _1104 + 40;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.cp_c6)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.cp_c6)._m0[int(_1730)][_1732];
    float _1736 = fma(_1466, _1568, _1644);
    float _1738 = fma(_1462, _1578, _1678);
    float _1740 = fma(_1464, _1586, _1684);
    float _1742 = fma(_1462, _1586, _1682);
    float _1744 = fma(_1466, _1586, _1706);
    float _1746 = fma(_1464, _1578, _1680);
    int _1748 = _1104 + 56;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.cp_c6)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.cp_c6)._m0[int(_1760)][_1762];
    float _1766 = _1740 + _1468;
    float _1768 = fma(_1466, _1578, _1686);
    float _1770 = _1744 + _1470;
    float _1772 = _1742 + _1472;
    float _1774 = _1712 * _1614;
    float _1776 = _1714 * _1614;
    float _1778 = _1746 * _1614;
    float _1780 = _1766 * _1614;
    float _1782 = fma(_1708, _1606, _1774);
    float _1784 = fma(_1710, _1606, _1776);
    float _1786 = fma(_1738, _1606, _1778);
    float _1788 = fma(_1772, _1606, _1780);
    float _1790 = _1766 * _1642;
    float _1792 = _1712 * _1642;
    float _1794 = _1714 * _1642;
    float _1796 = _1746 * _1642;
    float _1798 = fma(_1772, _1634, _1790);
    float _1800 = fma(_1708, _1634, _1792);
    float _1802 = fma(_1710, _1634, _1794);
    float _1804 = fma(_1738, _1634, _1796);
    float _1806 = _1766 * _1674;
    float _1808 = _1712 * _1674;
    float _1810 = _1714 * _1674;
    float _1812 = _1746 * _1674;
    float _1814 = fma(_1772, _1666, _1806);
    float _1816 = fma(_1708, _1666, _1808);
    float _1818 = fma(_1710, _1666, _1810);
    float _1820 = fma(_1738, _1666, _1812);
    float _1822 = fma(_1770, _1696, _1788);
    float _1824 = fma(_1716, _1696, _1782);
    float _1826 = fma(_1736, _1696, _1784);
    float _1828 = fma(_1768, _1696, _1786);
    float _1830 = _1822 + _1704;
    float _1832 = fma(_1770, _1726, _1798);
    float _1834 = fma(_1716, _1726, _1800);
    float _1836 = fma(_1736, _1726, _1802);
    int _1838 = _1514 + 16;
    float _1840 = fma(_1768, _1726, _1804);
    float _1842 = _1832 + _1734;
    int _1844 = _1514 + 32;
    float _1846 = fma(_1770, _1756, _1814);
    float _1848 = fma(_1716, _1756, _1816);
    float _1850 = fma(_1736, _1756, _1818);
    float _1852 = fma(_1768, _1756, _1820);
    float _1854 = _1846 + _1764;
    int _1856 = _1514 + 48;
    uint _1858 = uint(int(uint(_1838) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1858)] = as_type<uint>(_1824);
    int _1860 = _1838 + 4;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1862)] = as_type<uint>(_1826);
    int _1864 = _1838 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1866)] = as_type<uint>(_1828);
    int _1868 = _1838 + 12;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1870)] = as_type<uint>(_1830);
    uint _1872 = uint(int(uint(_1844) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1872)] = as_type<uint>(_1834);
    int _1874 = _1844 + 4;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1876)] = as_type<uint>(_1836);
    int _1878 = _1844 + 8;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1880)] = as_type<uint>(_1840);
    int _1882 = _1844 + 12;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1884)] = as_type<uint>(_1842);
    uint _1886 = uint(int(uint(_1856) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1886)] = as_type<uint>(_1848);
    int _1888 = _1856 + 4;
    uint _1890 = uint(int(uint(_1888) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1890)] = as_type<uint>(_1850);
    int _1892 = _1856 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1894)] = as_type<uint>(_1852);
    int _1896 = _1856 + 12;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1898)] = as_type<uint>(_1854);
}

