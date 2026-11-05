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
int _58(thread const int& _4387, thread const int& _4388, constant _10& support_buffer)
{
    int _4391 = 1 + _4388;
    float _4393 = support_buffer._m5[_4391].x;
    bool _4395 = _4393 == 1.0;
    if (_4395)
    {
        return _4387;
    }
    float _4397 = float(_4387);
    float _4399 = _4397 * _4393;
    int _4401 = int(_4399);
    return _4401;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4079, thread const int& _4080, thread const int& _4081, thread const int& _4082, thread int& _4083, thread int& _4084, thread int& _4085, thread int& _4086, thread int& _4087, thread int& _4088)
{
    float _4091 = as_type<float>(_4082) + 0.0;
    bool _4093 = _4091 != 0.0;
    bool _4095 = isnan(_4091);
    bool _4097 = _4093 || _4095;
    bool _4099 = isnan(0.0);
    bool _4101 = _4097 || _4099;
    int _4103 = _4079;
    int _4105 = _4080;
    int _4107 = _4082;
    int _4109 = _4101 ? (-1) : 0;
    if (!_4101)
    {
        float _4111 = as_type<float>(_4082) * 1.0;
        _4103 = as_type<int>(_4111);
    }
    int _4113 = _4103;
    bool _4115 = !_4101;
    int _4117 = _4113;
    int _4119 = _4113;
    if (!_4115)
    {
        float _4121 = as_type<float>(_4082) + 0.0;
        bool _4123 = _4121 >= 0.0;
        bool _4125 = isnan(_4121);
        bool _4127 = _4123 || _4125;
        bool _4129 = isnan(0.0);
        bool _4131 = _4127 || _4129;
        _4109 = _4131 ? (-1) : 0;
        if (!_4131)
        {
            _4117 = 2147483647;
        }
        int _4133 = _4117;
        bool _4135 = !_4131;
        int _4137 = _4133;
        _4119 = _4133;
        if (!_4135)
        {
            float _4139 = as_type<float>(_4082) + 0.0;
            bool _4141 = _4139 > as_type<float>(0x7f800000u /* inf */);
            bool _4143 = isnan(_4139);
            bool _4145 = _4141 || _4143;
            bool _4147 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4149 = _4145 || _4147;
            _4109 = _4149 ? (-1) : 0;
            if (_4149)
            {
                float _4151 = as_type<float>(_4082) + 1.0;
                _4137 = as_type<int>(_4151);
            }
            int _4153 = _4137;
            int _4155 = _4153;
            _4119 = _4153;
            if (!_4149)
            {
                float _4157 = 0.0 + as_type<float>(_4082);
                bool _4159 = _4157 != as_type<float>(0x7f800000u /* inf */);
                bool _4161 = isnan(_4157);
                bool _4163 = _4159 || _4161;
                bool _4165 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4167 = _4163 || _4165;
                _4109 = _4167 ? (-1) : 0;
                if (!_4167)
                {
                    _4155 = _4082;
                }
                int _4169 = _4155;
                bool _4171 = !_4167;
                _4119 = _4169;
                if (!_4171)
                {
                    float _4173 = as_type<float>(_4082) * 18446744073709551616.0;
                    float _4175 = rsqrt(_4173);
                    float _4177 = _4173 * _4175;
                    float _4179 = _4175 * 0.5;
                    float _4181 = -_4177;
                    float _4183 = 0.0 + _4181;
                    float _4185 = fma(_4179, _4183, 0.5);
                    float _4187 = fma(_4177, _4185, _4177);
                    float _4189 = -_4187;
                    float _4191 = 0.0 + _4189;
                    float _4193 = fma(_4187, _4191, _4173);
                    float _4195 = fma(_4179, _4193, _4187);
                    float _4197 = _4195 * 2.3283064365386962890625e-10;
                    _4119 = as_type<int>(_4197);
                    _4105 = as_type<int>(_4187);
                    _4107 = as_type<int>(_4173);
                }
            }
        }
    }
    int _4199 = _4119;
    int _4201 = _4105;
    int _4203 = _4107;
    int _4205 = _4109;
    _4083 = _4081;
    _4084 = 0;
    _4085 = _4199;
    _4086 = _4201;
    _4087 = _4203;
    _4088 = _4205;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4422, thread const int& _4423, thread const int& _4424, thread int& _4425, thread uint& gl_SubgroupInvocationID)
{
    int _4428 = _4424 & 31;
    uint _4430 = uint(int(uint(_4424) >> uint(8)));
    int _4432 = int(_4430) & 31;
    float _4434 = as_type<float>(gl_SubgroupInvocationID);
    int _4436 = as_type<int>(_4434) & _4432;
    int _4438 = ~_4432;
    int _4440 = _4428 & _4438;
    int _4442 = _4440 | _4436;
    int _4444 = ~_4432;
    int _4446 = _4423 & _4444;
    int _4448 = _4446 | _4436;
    bool _4450 = uint(_4448) <= uint(_4442);
    _4425 = _4450 ? (-1) : 0;
    float _4452 = spvSubgroupShuffle(as_type<float>(_4422), uint(_4448));
    uint _4454 = uint(_4450 ? as_type<int>(_4452) : _4422);
    return int(_4454);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _466 = false;
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) << 6;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_74)
    {
        return;
    }
    int _76 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _76 + 8;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    uint _99 = uint(int(uint(int(_97)) >> uint(2)));
    int _101 = int(_97) & 3;
    float _103 = (*spvDescriptorSet0.cp_c5)._m0[int(_99)][_101];
    int _105 = int(_97) + 1;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    int _109 = _105 & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _70;
    int _115 = 0;
    int _117 = _58(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_85);
    int _121 = 0;
    int _123 = _58(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1805 = int3(_117, _123, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1805.xy), uint(_1805.z), 0).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    int _136 = _70;
    int _138 = 0;
    int _140 = _58(_136, _138, (*spvDescriptorSet0.support_buffer));
    int _142 = as_type<int>(_93);
    int _144 = 0;
    int _146 = _58(_142, _144, (*spvDescriptorSet0.support_buffer));
    int3 _1825 = int3(_140, _146, 1);
    float4 _148 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1825.xy), uint(_1825.z), 0).xyzw;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    float _156 = _148.w;
    int _158 = _70;
    int _160 = 0;
    int _162 = _58(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = as_type<int>(_85);
    int _166 = 0;
    int _168 = _58(_164, _166, (*spvDescriptorSet0.support_buffer));
    int3 _1845 = int3(_162, _168, 0);
    float3 _172 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1845.xy), uint(_1845.z), 0).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    int _180 = _70;
    int _182 = 0;
    int _184 = _58(_180, _182, (*spvDescriptorSet0.support_buffer));
    int _186 = as_type<int>(_93);
    int _188 = 0;
    int _190 = _58(_186, _188, (*spvDescriptorSet0.support_buffer));
    int3 _1863 = int3(_184, _190, 0);
    float3 _192 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1863.xy), uint(_1863.z), 0).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    int _200 = _70;
    int _202 = 1;
    int _204 = _58(_200, _202, (*spvDescriptorSet0.support_buffer));
    int _206 = as_type<int>(_103);
    int _208 = 1;
    int _210 = _58(_206, _208, (*spvDescriptorSet0.support_buffer));
    int3 _1881 = int3(_204, _210, 1);
    float4 _212 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1881.xy), uint(_1881.z), 0).xyzw;
    float _214 = _212.x;
    float _216 = _212.y;
    float _218 = _212.z;
    float _220 = _212.w;
    int _222 = _70;
    int _224 = 1;
    int _226 = _58(_222, _224, (*spvDescriptorSet0.support_buffer));
    int _228 = as_type<int>(_111);
    int _230 = 1;
    int _232 = _58(_228, _230, (*spvDescriptorSet0.support_buffer));
    int3 _1901 = int3(_226, _232, 1);
    float4 _234 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1901.xy), uint(_1901.z), 0).xyzw;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = _234.z;
    float _242 = _234.w;
    int _244 = _70;
    int _246 = 0;
    int _248 = _58(_244, _246, (*spvDescriptorSet0.support_buffer));
    int _250 = as_type<int>(_85);
    int _252 = 0;
    int _254 = _58(_250, _252, (*spvDescriptorSet0.support_buffer));
    int3 _1921 = int3(_248, _254, 2);
    float3 _256 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1921.xy), uint(_1921.z), 0).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    int _264 = _70;
    int _266 = 0;
    int _268 = _58(_264, _266, (*spvDescriptorSet0.support_buffer));
    int _270 = as_type<int>(_93);
    int _272 = 0;
    int _274 = _58(_270, _272, (*spvDescriptorSet0.support_buffer));
    int3 _1939 = int3(_268, _274, 2);
    float3 _276 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1939.xy), uint(_1939.z), 0).xyz;
    float _278 = _276.x;
    float _280 = _276.y;
    float _282 = _276.z;
    int _284 = _76 + 16;
    uint _286 = uint(int(uint(_284) >> uint(2)));
    uint _288 = uint(int(uint(int(_286)) >> uint(2)));
    int _290 = int(_286) & 3;
    float _292 = (*spvDescriptorSet0.cp_c5)._m0[int(_288)][_290];
    int _294 = _76 + 24;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.cp_c5)._m0[int(_298)][_300];
    float _304 = -_132;
    float _306 = _304 + _154;
    float _308 = -_128;
    float _310 = _308 + _150;
    float _312 = -_130;
    float _314 = _312 + _152;
    float _316 = -_134;
    float _318 = _316 + _156;
    float _320 = fma(_306, _292, _132);
    float _322 = -_174;
    float _324 = _322 + _194;
    float _326 = fma(_310, _292, _128);
    float _328 = fma(_314, _292, _130);
    float _330 = -_216;
    float _332 = _330 + _238;
    float _334 = -_214;
    float _336 = _334 + _236;
    float _338 = fma(_324, _292, _174);
    float _340 = -_218;
    float _342 = _340 + _240;
    float _344 = fma(_332, _302, _216);
    float _346 = fma(_336, _302, _214);
    float _348 = -_220;
    float _350 = _348 + _242;
    float _352 = fma(_342, _302, _218);
    float _354 = _328 * _344;
    float _356 = fma(_318, _292, _134);
    float _358 = fma(_350, _302, _220);
    float _360 = -_176;
    float _362 = _360 + _196;
    float _364 = fma(_326, _346, _354);
    float _366 = -_262;
    float _368 = _366 + _282;
    float _370 = -_178;
    float _372 = _370 + _198;
    float _374 = fma(_362, _292, _176);
    float _376 = fma(_320, _352, _364);
    float _378 = fma(_368, _292, _262);
    float _380 = fma(_372, _292, _178);
    float _382 = fma(_356, _358, _376);
    float _384 = precise::max(_382, -1.0);
    float _386 = precise::min(_384, 1.0);
    bool _388 = _386 >= 0.0;
    bool _390 = isnan(_386);
    bool _392 = _388 || _390;
    bool _394 = isnan(0.0);
    bool _396 = _392 || _394;
    bool _398 = !_396;
    float _400 = -_386;
    float _402 = _398 ? _400 : _386;
    bool _404 = _402 < 0.0;
    float _406 = float(_404);
    float _408 = abs(_402);
    float _410 = -_408;
    float _412 = _410 + 1.0;
    float _414 = abs(_402);
    float _416 = fma(_414, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _418 = as_type<int>(_412) + (-218103808);
    float _420 = abs(_402);
    float _422 = fma(_420, _416, -0.212114393711090087890625);
    bool _424 = uint(_418) >= 1920991232u;
    float _426 = -_258;
    float _428 = _426 + _278;
    float _430 = -_260;
    float _432 = _430 + _280;
    float _434 = abs(_402);
    float _436 = fma(_434, _422, 1.570728778839111328125);
    float _438 = fma(_428, _292, _258);
    float _440 = fma(_432, _292, _260);
    bool _442 = !_424;
    float _464;
    if (!_442)
    {
        int _444 = as_type<int>(_432);
        int _446 = as_type<int>(_280);
        int _448 = 1248;
        int _450 = as_type<int>(_412);
        int _452;
        int _454;
        int _456;
        int _458;
        int _460;
        int _462;
        _56(_444, _446, _448, _450, _452, _454, _456, _458, _460, _462);
        _464 = as_type<float>(_456);
        _466 = true;
    }
    else
    {
        float _468 = rsqrt(_412);
        float _470 = _412 * _468;
        float _472 = _468 * 0.5;
        float _474 = -_470;
        float _476 = 0.0 + _474;
        float _478 = fma(_472, _476, 0.5);
        float _480 = fma(_470, _478, _470);
        float _482 = -_480;
        float _484 = 0.0 + _482;
        float _486 = fma(_480, _484, _412);
        float _488 = fma(_472, _486, _480);
        _464 = _488;
    }
    _466 = false;
    float _490 = _464;
    int _492 = _76 + 8;
    uint _494 = uint(int(uint(_492) >> uint(2)));
    uint _496 = uint(int(uint(int(_494)) >> uint(2)));
    int _498 = int(_494) & 3;
    float _500 = (*spvDescriptorSet0.cp_c5)._m0[int(_496)][_498];
    int _502 = int(_494) + 1;
    uint _504 = uint(int(uint(_502) >> uint(2)));
    int _506 = _502 & 3;
    float _508 = (*spvDescriptorSet0.cp_c5)._m0[int(_504)][_506];
    int _510 = _70;
    int _512 = 1;
    int _514 = _58(_510, _512, (*spvDescriptorSet0.support_buffer));
    int _516 = as_type<int>(_500);
    int _518 = 1;
    int _520 = _58(_516, _518, (*spvDescriptorSet0.support_buffer));
    int3 _2278 = int3(_514, _520, 0);
    float3 _522 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2278.xy), uint(_2278.z), 0).xyz;
    float _524 = _522.x;
    float _526 = _522.y;
    float _528 = _522.z;
    int _530 = _70;
    int _532 = 1;
    int _534 = _58(_530, _532, (*spvDescriptorSet0.support_buffer));
    int _536 = as_type<int>(_500);
    int _538 = 1;
    int _540 = _58(_536, _538, (*spvDescriptorSet0.support_buffer));
    int3 _2296 = int3(_534, _540, 2);
    float3 _542 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2296.xy), uint(_2296.z), 0).xyz;
    float _544 = _542.x;
    float _546 = _542.y;
    float _548 = _542.z;
    int _550 = _70;
    int _552 = 1;
    int _554 = _58(_550, _552, (*spvDescriptorSet0.support_buffer));
    int _556 = as_type<int>(_508);
    int _558 = 1;
    int _560 = _58(_556, _558, (*spvDescriptorSet0.support_buffer));
    int3 _2314 = int3(_554, _560, 0);
    float3 _562 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2314.xy), uint(_2314.z), 0).xyz;
    float _564 = _562.x;
    float _566 = _562.y;
    float _568 = _562.z;
    int _570 = _70;
    int _572 = 1;
    int _574 = _58(_570, _572, (*spvDescriptorSet0.support_buffer));
    int _576 = as_type<int>(_508);
    int _578 = 1;
    int _580 = _58(_576, _578, (*spvDescriptorSet0.support_buffer));
    int3 _2332 = int3(_574, _580, 2);
    float3 _582 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2332.xy), uint(_2332.z), 0).xyz;
    float _584 = _582.x;
    float _586 = _582.y;
    float _588 = _582.z;
    float _590 = _436 * _490;
    float _592 = _406 * 2.0;
    float _594 = -_592;
    float _596 = fma(_590, _594, _590);
    float _598 = fma(_406, 3.1415927410125732421875, _596);
    float _600 = _598 * 0.15915493667125701904296875;
    float _602 = _600 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = abs(_604);
    bool _608 = _606 >= 0.001000000047497451305389404296875;
    bool _610 = isnan(_606);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.001000000047497451305389404296875);
    bool _616 = _612 || _614;
    float _618 = _406;
    float _620 = _592;
    float _622 = _596;
    if (!_616)
    {
        int _624 = _76 + 28;
        uint _626 = uint(int(uint(_624) >> uint(2)));
        uint _628 = uint(int(uint(int(_626)) >> uint(2)));
        int _630 = int(_626) & 3;
        float _632 = (*spvDescriptorSet0.cp_c5)._m0[int(_628)][_630];
        _618 = _632;
    }
    float _634 = _618;
    float _636 = _634;
    if (!_616)
    {
        float _638 = -_634;
        float _640 = _638 + 1.0;
        _620 = _640;
    }
    float _642 = _620;
    float _644 = _642;
    if (!_616)
    {
        _622 = _634;
    }
    float _646 = _622;
    bool _648 = !_616;
    float _650 = _646;
    if (!_648)
    {
        int _652 = _76 + 28;
        uint _654 = uint(int(uint(_652) >> uint(2)));
        uint _656 = uint(int(uint(int(_654)) >> uint(2)));
        int _658 = int(_654) & 3;
        float _660 = (*spvDescriptorSet0.cp_c5)._m0[int(_656)][_658];
        float _662 = 1.0 / _604;
        float _664 = _598 * _660;
        float _666 = _664 * 0.15915493667125701904296875;
        float _668 = -_664;
        float _670 = _598 + _668;
        float _672 = _670 * 0.15915493667125701904296875;
        float _674 = _666 * 6.283185482025146484375;
        float _676 = sin(_674);
        float _678 = _672 * 6.283185482025146484375;
        float _680 = sin(_678);
        float _682 = _676 * _662;
        float _684 = _680 * _662;
        _650 = _682;
        _644 = _684;
        _636 = _660;
    }
    float _686 = _650;
    float _688 = _644;
    float _690 = _636;
    bool _692 = !_396;
    float _694 = -_686;
    float _696 = _692 ? _694 : _686;
    float _698 = -_526;
    float _700 = _698 + _566;
    float _702 = -_528;
    float _704 = _702 + _568;
    bool _706 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _708 = _346 * _696;
    float _710 = _358 * _696;
    float _712 = _352 * _696;
    float _714 = _344 * _696;
    float _716 = fma(_326, _688, _708);
    float _718 = fma(_356, _688, _710);
    int _720 = _76 + 24;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.cp_c5)._m0[int(_724)][_726];
    float _730 = fma(_320, _688, _712);
    float _732 = fma(_328, _688, _714);
    float _734 = _718 * 2.0;
    float _736 = _716 * 2.0;
    float _738 = -_548;
    float _740 = _738 + _588;
    float _742 = _732 * 2.0;
    float _744 = _730 * _734;
    int _746 = _76 + 20;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    uint _750 = uint(int(uint(int(_748)) >> uint(2)));
    int _752 = int(_748) & 3;
    float _754 = (*spvDescriptorSet0.cp_c5)._m0[int(_750)][_752];
    float _756 = _732 * _734;
    float _758 = _716 * _734;
    float _760 = _716 * _716;
    float _762 = -_744;
    float _764 = fma(_732, _736, _762);
    float _766 = fma(_730, _736, _756);
    float _768 = fma(_732, _736, _744);
    float _770 = -_756;
    float _772 = fma(_730, _736, _770);
    float _774 = fma(_760, -2.0, 1.0);
    float _776 = -_524;
    float _778 = _776 + _564;
    float _780 = _732 * _732;
    float _782 = -_758;
    float _784 = fma(_730, _742, _782);
    float _786 = fma(_730, _742, _758);
    float _788 = _730 * _730;
    float _790 = fma(_780, -2.0, 1.0);
    float _792 = fma(_780, -2.0, _774);
    float _794 = fma(_778, _728, _524);
    float _796 = fma(_700, _728, _526);
    float _798 = fma(_788, -2.0, _790);
    float _800 = fma(_704, _728, _528);
    float _802 = _794 * _690;
    float _804 = _796 * _690;
    float _806 = -_544;
    float _808 = _806 + _584;
    float _810 = _800 * _690;
    float _812 = fma(_338, _754, _802);
    float _814 = -_546;
    float _816 = _814 + _586;
    float _818 = fma(_808, _728, _544);
    float _820 = fma(_740, _728, _548);
    float _822 = fma(_374, _754, _804);
    float _824 = fma(_816, _728, _546);
    float _826 = fma(_788, -2.0, _774);
    float _828 = _818 * _690;
    float _830 = fma(_380, _754, _810);
    float _832 = _824 * _690;
    float _834 = _820 * _690;
    float _836 = _764 * _822;
    float _838 = _768 * _812;
    float _840 = _798 * _812;
    float _842 = _772 * _812;
    float _844 = _826 * _822;
    float _846 = _786 * _822;
    float _848 = _766 * _830;
    float _850 = fma(_438, _754, _828);
    float _852 = fma(_440, _754, _832);
    float _854 = fma(_378, _754, _834);
    float _856 = _784 * _830;
    float _858 = _792 * _830;
    int _860 = _70 * 112;
    bool _862 = !_706;
    float _864 = _840;
    float _866 = _836;
    float _868 = _848;
    float _870 = _850;
    float _872 = _838;
    float _874 = _844;
    float _876 = _856;
    float _878 = _852;
    float _880 = _842;
    float _882 = _846;
    float _884 = _858;
    float _886 = _854;
    if (!_862)
    {
        int _888 = 0;
        float _890 = _840;
        float _892 = _836;
        float _894 = _848;
        float _896 = _850;
        float _898 = _838;
        float _900 = _844;
        float _902 = _856;
        float _904 = _852;
        float _906 = _842;
        float _908 = _846;
        float _910 = _858;
        float _912 = _854;
        bool _914;
        int _962;
        int _972;
        int _982;
        int _992;
        int _1002;
        int _1012;
        int _1022;
        int _1032;
        int _1042;
        int _1052;
        int _1062;
        int _1072;
        float _1180;
        float _1182;
        float _1184;
        int _1186;
        float _1188;
        int _1190;
        int _1192;
        int _1194;
        int _1196;
        float _1198;
        float _1200;
        float _1202;
        do
        {
            int _916 = _888;
            float _918 = _890;
            float _920 = _892;
            float _922 = _894;
            int _924 = as_type<int>(_896);
            float _926 = _898;
            int _928 = as_type<int>(_900);
            int _930 = as_type<int>(_902);
            int _932 = as_type<int>(_904);
            int _934 = as_type<int>(_906);
            float _936 = _908;
            float _938 = _910;
            float _940 = _912;
            uint _942 = uint(int(uint(_860) >> uint(2)));
            uint _944 = uint(int(uint(int(_942)) >> uint(2)));
            int _946 = int(_942) & 3;
            float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
            bool _950 = _70 != 0;
            int _952 = _916 + 1;
            bool _954 = uint(_952) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _956 = as_type<int>(_918);
            int _958 = as_type<int>(_948);
            int _960 = 31;
            int _2831 = _60(_956, _958, _960, _962, gl_SubgroupInvocationID);
            int _964 = _2831;
            int _966 = as_type<int>(_920);
            int _968 = as_type<int>(_948);
            int _970 = 31;
            int _2836 = _60(_966, _968, _970, _972, gl_SubgroupInvocationID);
            int _974 = _2836;
            int _976 = as_type<int>(_922);
            int _978 = as_type<int>(_948);
            int _980 = 31;
            int _2841 = _60(_976, _978, _980, _982, gl_SubgroupInvocationID);
            int _984 = _2841;
            int _986 = _924;
            int _988 = as_type<int>(_948);
            int _990 = 31;
            int _2845 = _60(_986, _988, _990, _992, gl_SubgroupInvocationID);
            int _994 = _2845;
            int _996 = as_type<int>(_926);
            int _998 = as_type<int>(_948);
            int _1000 = 31;
            int _2850 = _60(_996, _998, _1000, _1002, gl_SubgroupInvocationID);
            int _1004 = _2850;
            int _1006 = _928;
            int _1008 = as_type<int>(_948);
            int _1010 = 31;
            int _2854 = _60(_1006, _1008, _1010, _1012, gl_SubgroupInvocationID);
            int _1014 = _2854;
            int _1016 = _930;
            int _1018 = as_type<int>(_948);
            int _1020 = 31;
            int _2858 = _60(_1016, _1018, _1020, _1022, gl_SubgroupInvocationID);
            int _1024 = _2858;
            int _1026 = _932;
            int _1028 = as_type<int>(_948);
            int _1030 = 31;
            int _2862 = _60(_1026, _1028, _1030, _1032, gl_SubgroupInvocationID);
            int _1034 = _2862;
            int _1036 = _934;
            int _1038 = as_type<int>(_948);
            int _1040 = 31;
            int _2866 = _60(_1036, _1038, _1040, _1042, gl_SubgroupInvocationID);
            int _1044 = _2866;
            int _1046 = as_type<int>(_936);
            int _1048 = as_type<int>(_948);
            int _1050 = 31;
            int _2871 = _60(_1046, _1048, _1050, _1052, gl_SubgroupInvocationID);
            int _1054 = _2871;
            int _1056 = as_type<int>(_938);
            int _1058 = as_type<int>(_948);
            int _1060 = 31;
            int _2876 = _60(_1056, _1058, _1060, _1062, gl_SubgroupInvocationID);
            int _1064 = _2876;
            int _1066 = as_type<int>(_940);
            int _1068 = as_type<int>(_948);
            int _1070 = 31;
            int _2881 = _60(_1066, _1068, _1070, _1072, gl_SubgroupInvocationID);
            int _1074 = _2881;
            bool _1076 = !_950;
            _888 = _952;
            float _1078 = _918;
            float _1080 = _920;
            float _1082 = _922;
            int _1084 = _924;
            float _1086 = _926;
            int _1088 = _928;
            int _1090 = _930;
            int _1092 = _932;
            int _1094 = _934;
            float _1096 = _936;
            float _1098 = _938;
            float _1100 = _940;
            if (!_1076)
            {
                float _1102 = _852 * as_type<float>(_1014);
                float _1104 = _838 * as_type<float>(_1014);
                float _1106 = _844 * as_type<float>(_1014);
                float _1108 = _856 * as_type<float>(_1014);
                float _1110 = _838 * as_type<float>(_974);
                float _1112 = _844 * as_type<float>(_974);
                float _1114 = _856 * as_type<float>(_974);
                float _1116 = fma(_850, as_type<float>(_1004), _1102);
                float _1118 = _852 * as_type<float>(_974);
                float _1120 = _852 * as_type<float>(_1054);
                float _1122 = fma(_840, as_type<float>(_1004), _1104);
                float _1124 = fma(_836, as_type<float>(_1004), _1106);
                float _1126 = fma(_848, as_type<float>(_1004), _1108);
                float _1128 = _838 * as_type<float>(_1054);
                float _1130 = _844 * as_type<float>(_1054);
                float _1132 = _856 * as_type<float>(_1054);
                float _1134 = fma(_840, as_type<float>(_964), _1110);
                float _1136 = fma(_836, as_type<float>(_964), _1112);
                float _1138 = fma(_848, as_type<float>(_964), _1114);
                float _1140 = fma(_850, as_type<float>(_964), _1118);
                float _1142 = fma(_850, as_type<float>(_1044), _1120);
                float _1144 = fma(_840, as_type<float>(_1044), _1128);
                float _1146 = fma(_836, as_type<float>(_1044), _1130);
                float _1148 = fma(_848, as_type<float>(_1044), _1132);
                float _1150 = fma(_842, as_type<float>(_984), _1134);
                float _1152 = fma(_846, as_type<float>(_984), _1136);
                float _1154 = fma(_858, as_type<float>(_984), _1138);
                float _1156 = fma(_842, as_type<float>(_1024), _1122);
                float _1158 = fma(_854, as_type<float>(_984), _1140);
                float _1160 = fma(_854, as_type<float>(_1024), _1116);
                float _1162 = fma(_854, as_type<float>(_1064), _1142);
                float _1164 = fma(_846, as_type<float>(_1024), _1124);
                float _1166 = fma(_858, as_type<float>(_1024), _1126);
                float _1168 = fma(_842, as_type<float>(_1064), _1144);
                float _1170 = fma(_846, as_type<float>(_1064), _1146);
                float _1172 = fma(_858, as_type<float>(_1064), _1148);
                float _1174 = as_type<float>(_994) + _1158;
                float _1176 = as_type<float>(_1034) + _1160;
                float _1178 = as_type<float>(_1074) + _1162;
                _1078 = _1150;
                _1080 = _1152;
                _1082 = _1154;
                _1084 = as_type<int>(_1174);
                _1086 = _1156;
                _1088 = as_type<int>(_1164);
                _1090 = as_type<int>(_1166);
                _1092 = as_type<int>(_1176);
                _1094 = as_type<int>(_1168);
                _1096 = _1170;
                _1098 = _1172;
                _1100 = _1178;
            }
            _1180 = _1078;
            _1182 = _1080;
            _1184 = _1082;
            _1186 = _1084;
            _1188 = _1086;
            _1190 = _1088;
            _1192 = _1090;
            _1194 = _1092;
            _1196 = _1094;
            _1198 = _1096;
            _1200 = _1098;
            _1202 = _1100;
            _914 = !_954;
            _890 = _1180;
            _892 = _1182;
            _894 = _1184;
            _896 = as_type<float>(_1186);
            _898 = _1188;
            _900 = as_type<float>(_1190);
            _902 = as_type<float>(_1192);
            _904 = as_type<float>(_1194);
            _906 = as_type<float>(_1196);
            _908 = _1198;
            _910 = _1200;
            _912 = _1202;
        } while (_914);
        _864 = _1180;
        _866 = _1182;
        _868 = _1184;
        _870 = as_type<float>(_1186);
        _872 = _1188;
        _874 = as_type<float>(_1190);
        _876 = as_type<float>(_1192);
        _878 = as_type<float>(_1194);
        _880 = as_type<float>(_1196);
        _882 = _1198;
        _884 = _1200;
        _886 = _1202;
    }
    float _1204 = _864;
    float _1206 = _866;
    float _1208 = _868;
    float _1210 = _870;
    float _1212 = _872;
    float _1214 = _874;
    float _1216 = _876;
    float _1218 = _878;
    float _1220 = _880;
    float _1222 = _882;
    float _1224 = _884;
    float _1226 = _886;
    int _1228 = _860 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.cp_c6)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
    bool _1246 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1248 = _860 + 64;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    uint _1252 = uint(int(uint(int(_1250)) >> uint(2)));
    int _1254 = int(_1250) & 3;
    float _1256 = (*spvDescriptorSet0.cp_c6)._m0[int(_1252)][_1254];
    int _1258 = int(_1250) + 1;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    int _1262 = _1258 & 3;
    float _1264 = (*spvDescriptorSet0.cp_c6)._m0[int(_1260)][_1262];
    int _1266 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1268 = _1266 + _70;
    int _1270 = _860 + 88;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    int _1288 = _860 + 72;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.cp_c6)._m0[int(_1300)][_1302];
    int _1306 = _860 + 96;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    uint _1310 = uint(int(uint(int(_1308)) >> uint(2)));
    int _1312 = int(_1308) & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    int _1316 = int(_1308) + 1;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    int _1320 = _1316 & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    int _1324 = _860 + 104;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    uint _1328 = uint(int(uint(int(_1326)) >> uint(2)));
    int _1330 = int(_1326) & 3;
    float _1332 = (*spvDescriptorSet0.cp_c6)._m0[int(_1328)][_1330];
    int _1334 = int(_1326) + 1;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    int _1338 = _1334 & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    int _1342 = _860 + 16;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    uint _1346 = uint(int(uint(int(_1344)) >> uint(2)));
    int _1348 = int(_1344) & 3;
    float _1350 = (*spvDescriptorSet0.cp_c6)._m0[int(_1346)][_1348];
    int _1352 = int(_1344) + 1;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    int _1356 = _1352 & 3;
    float _1358 = (*spvDescriptorSet0.cp_c6)._m0[int(_1354)][_1356];
    if (!_1246)
    {
        int _1360 = _70 * 48;
        int _1362 = _1360 + 16;
        uint _1364 = uint(int(uint(_1360) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1364)] = as_type<uint>(_1204);
        int _1366 = _1360 + 4;
        uint _1368 = uint(int(uint(_1366) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1368)] = as_type<uint>(_1206);
        int _1370 = _1360 + 8;
        uint _1372 = uint(int(uint(_1370) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1372)] = as_type<uint>(_1208);
        int _1374 = _1360 + 12;
        uint _1376 = uint(int(uint(_1374) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1376)] = as_type<uint>(_1210);
        int _1378 = _1360 + 32;
        uint _1380 = uint(int(uint(_1362) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1380)] = as_type<uint>(_1212);
        int _1382 = _1362 + 4;
        uint _1384 = uint(int(uint(_1382) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1384)] = as_type<uint>(_1214);
        int _1386 = _1362 + 8;
        uint _1388 = uint(int(uint(_1386) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1388)] = as_type<uint>(_1216);
        int _1390 = _1362 + 12;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1392)] = as_type<uint>(_1218);
        uint _1394 = uint(int(uint(_1378) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1394)] = as_type<uint>(_1220);
        int _1396 = _1378 + 4;
        uint _1398 = uint(int(uint(_1396) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1398)] = as_type<uint>(_1222);
        int _1400 = _1378 + 8;
        uint _1402 = uint(int(uint(_1400) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1402)] = as_type<uint>(_1224);
        int _1404 = _1378 + 12;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1406)] = as_type<uint>(_1226);
    }
    float _1408 = _1222 * _1236;
    float _1410 = _1206 * _1236;
    float _1412 = _1214 * _1236;
    int _1414 = _860 + 32;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    uint _1418 = uint(int(uint(int(_1416)) >> uint(2)));
    int _1420 = int(_1416) & 3;
    float _1422 = (*spvDescriptorSet0.cp_c6)._m0[int(_1418)][_1420];
    int _1424 = int(_1416) + 1;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    int _1428 = _1424 & 3;
    float _1430 = (*spvDescriptorSet0.cp_c6)._m0[int(_1426)][_1428];
    float _1432 = fma(_1220, _1256, _1408);
    float _1434 = _1206 * _1244;
    float _1436 = fma(_1204, _1256, _1410);
    float _1438 = fma(_1212, _1256, _1412);
    float _1440 = _1214 * _1244;
    float _1442 = fma(_1204, _1264, _1434);
    float _1444 = _1206 * _1278;
    float _1446 = _1206 * _1286;
    float _1448 = _1222 * _1244;
    int _1450 = _860 + 48;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
    int _1456 = int(_1452) & 3;
    float _1458 = (*spvDescriptorSet0.cp_c6)._m0[int(_1454)][_1456];
    int _1460 = int(_1452) + 1;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    int _1464 = _1460 & 3;
    float _1466 = (*spvDescriptorSet0.cp_c6)._m0[int(_1462)][_1464];
    float _1468 = _1214 * _1278;
    float _1470 = _1214 * _1286;
    float _1472 = fma(_1212, _1264, _1440);
    float _1474 = fma(_1220, _1264, _1448);
    float _1476 = _1222 * _1278;
    float _1478 = _1222 * _1286;
    float _1480 = fma(_1204, _1296, _1444);
    float _1482 = fma(_1204, _1304, _1446);
    float _1484 = fma(_1212, _1296, _1468);
    int _1486 = _860 + 24;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
    int _1492 = int(_1488) & 3;
    float _1494 = (*spvDescriptorSet0.cp_c6)._m0[int(_1490)][_1492];
    int _1496 = int(_1488) + 1;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    int _1500 = _1496 & 3;
    float _1502 = (*spvDescriptorSet0.cp_c6)._m0[int(_1498)][_1500];
    float _1504 = fma(_1212, _1304, _1470);
    float _1506 = fma(_1220, _1304, _1478);
    float _1508 = fma(_1220, _1296, _1476);
    float _1510 = fma(_1208, _1314, _1436);
    float _1512 = fma(_1216, _1340, _1504);
    float _1514 = fma(_1216, _1314, _1438);
    float _1516 = fma(_1224, _1314, _1432);
    int _1518 = _860 + 40;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.cp_c6)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.cp_c6)._m0[int(_1530)][_1532];
    float _1536 = fma(_1208, _1322, _1442);
    float _1538 = fma(_1208, _1332, _1480);
    float _1540 = fma(_1208, _1340, _1482);
    float _1542 = fma(_1216, _1322, _1472);
    float _1544 = fma(_1216, _1332, _1484);
    float _1546 = fma(_1224, _1340, _1506);
    float _1548 = _1512 + _1218;
    int _1550 = _860 + 56;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
    int _1556 = int(_1552) & 3;
    float _1558 = (*spvDescriptorSet0.cp_c6)._m0[int(_1554)][_1556];
    int _1560 = int(_1552) + 1;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    int _1564 = _1560 & 3;
    float _1566 = (*spvDescriptorSet0.cp_c6)._m0[int(_1562)][_1564];
    float _1568 = fma(_1224, _1322, _1474);
    float _1570 = fma(_1224, _1332, _1508);
    float _1572 = _1546 + _1226;
    float _1574 = _1540 + _1210;
    float _1576 = _1514 * _1358;
    float _1578 = _1542 * _1358;
    float _1580 = _1544 * _1358;
    float _1582 = _1548 * _1358;
    float _1584 = fma(_1510, _1350, _1576);
    float _1586 = fma(_1536, _1350, _1578);
    float _1588 = fma(_1538, _1350, _1580);
    float _1590 = fma(_1574, _1350, _1582);
    float _1592 = _1548 * _1430;
    float _1594 = _1514 * _1430;
    float _1596 = _1542 * _1430;
    float _1598 = _1544 * _1430;
    float _1600 = fma(_1574, _1422, _1592);
    float _1602 = fma(_1510, _1422, _1594);
    float _1604 = fma(_1536, _1422, _1596);
    float _1606 = fma(_1538, _1422, _1598);
    int _1608 = _1268 * 48;
    float _1610 = _1548 * _1466;
    float _1612 = _1514 * _1466;
    float _1614 = _1542 * _1466;
    float _1616 = _1544 * _1466;
    float _1618 = fma(_1574, _1458, _1610);
    float _1620 = fma(_1510, _1458, _1612);
    float _1622 = fma(_1536, _1458, _1614);
    float _1624 = fma(_1538, _1458, _1616);
    float _1626 = fma(_1572, _1494, _1590);
    float _1628 = fma(_1568, _1494, _1586);
    float _1630 = fma(_1516, _1494, _1584);
    float _1632 = fma(_1570, _1494, _1588);
    float _1634 = _1626 + _1502;
    float _1636 = fma(_1572, _1526, _1600);
    float _1638 = fma(_1516, _1526, _1602);
    float _1640 = fma(_1568, _1526, _1604);
    float _1642 = fma(_1570, _1526, _1606);
    float _1644 = _1636 + _1534;
    int _1646 = _1608 + 16;
    int _1648 = _1608 + 32;
    float _1650 = fma(_1572, _1558, _1618);
    float _1652 = fma(_1516, _1558, _1620);
    float _1654 = fma(_1568, _1558, _1622);
    float _1656 = fma(_1570, _1558, _1624);
    float _1658 = _1650 + _1566;
    int _1660 = _1608 + 48;
    uint _1662 = uint(int(uint(_1646) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1662)] = as_type<uint>(_1630);
    int _1664 = _1646 + 4;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1666)] = as_type<uint>(_1628);
    int _1668 = _1646 + 8;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1670)] = as_type<uint>(_1632);
    int _1672 = _1646 + 12;
    uint _1674 = uint(int(uint(_1672) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1674)] = as_type<uint>(_1634);
    uint _1676 = uint(int(uint(_1648) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1676)] = as_type<uint>(_1638);
    int _1678 = _1648 + 4;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1680)] = as_type<uint>(_1640);
    int _1682 = _1648 + 8;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1684)] = as_type<uint>(_1642);
    int _1686 = _1648 + 12;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1688)] = as_type<uint>(_1644);
    uint _1690 = uint(int(uint(_1660) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1690)] = as_type<uint>(_1652);
    int _1692 = _1660 + 4;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1694)] = as_type<uint>(_1654);
    int _1696 = _1660 + 8;
    uint _1698 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1698)] = as_type<uint>(_1656);
    int _1700 = _1660 + 12;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1702)] = as_type<uint>(_1658);
}

