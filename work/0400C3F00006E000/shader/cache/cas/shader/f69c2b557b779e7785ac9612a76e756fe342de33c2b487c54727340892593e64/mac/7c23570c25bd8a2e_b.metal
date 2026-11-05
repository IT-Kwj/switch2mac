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
int _58(thread const int& _4411, thread const int& _4412, constant _10& support_buffer)
{
    int _4415 = 1 + _4412;
    float _4417 = support_buffer._m5[_4415].x;
    bool _4419 = _4417 == 1.0;
    if (_4419)
    {
        return _4411;
    }
    float _4421 = float(_4411);
    float _4423 = _4421 * _4417;
    int _4425 = int(_4423);
    return _4425;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4103, thread const int& _4104, thread const int& _4105, thread const int& _4106, thread int& _4107, thread int& _4108, thread int& _4109, thread int& _4110, thread int& _4111, thread int& _4112)
{
    float _4115 = as_type<float>(_4106) + 0.0;
    bool _4117 = _4115 != 0.0;
    bool _4119 = isnan(_4115);
    bool _4121 = _4117 || _4119;
    bool _4123 = isnan(0.0);
    bool _4125 = _4121 || _4123;
    int _4127 = _4103;
    int _4129 = _4104;
    int _4131 = _4106;
    int _4133 = _4125 ? (-1) : 0;
    if (!_4125)
    {
        float _4135 = as_type<float>(_4106) * 1.0;
        _4127 = as_type<int>(_4135);
    }
    int _4137 = _4127;
    bool _4139 = !_4125;
    int _4141 = _4137;
    int _4143 = _4137;
    if (!_4139)
    {
        float _4145 = as_type<float>(_4106) + 0.0;
        bool _4147 = _4145 >= 0.0;
        bool _4149 = isnan(_4145);
        bool _4151 = _4147 || _4149;
        bool _4153 = isnan(0.0);
        bool _4155 = _4151 || _4153;
        _4133 = _4155 ? (-1) : 0;
        if (!_4155)
        {
            _4141 = 2147483647;
        }
        int _4157 = _4141;
        bool _4159 = !_4155;
        int _4161 = _4157;
        _4143 = _4157;
        if (!_4159)
        {
            float _4163 = as_type<float>(_4106) + 0.0;
            bool _4165 = _4163 > as_type<float>(0x7f800000u /* inf */);
            bool _4167 = isnan(_4163);
            bool _4169 = _4165 || _4167;
            bool _4171 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4173 = _4169 || _4171;
            _4133 = _4173 ? (-1) : 0;
            if (_4173)
            {
                float _4175 = as_type<float>(_4106) + 1.0;
                _4161 = as_type<int>(_4175);
            }
            int _4177 = _4161;
            int _4179 = _4177;
            _4143 = _4177;
            if (!_4173)
            {
                float _4181 = 0.0 + as_type<float>(_4106);
                bool _4183 = _4181 != as_type<float>(0x7f800000u /* inf */);
                bool _4185 = isnan(_4181);
                bool _4187 = _4183 || _4185;
                bool _4189 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4191 = _4187 || _4189;
                _4133 = _4191 ? (-1) : 0;
                if (!_4191)
                {
                    _4179 = _4106;
                }
                int _4193 = _4179;
                bool _4195 = !_4191;
                _4143 = _4193;
                if (!_4195)
                {
                    float _4197 = as_type<float>(_4106) * 18446744073709551616.0;
                    float _4199 = rsqrt(_4197);
                    float _4201 = _4197 * _4199;
                    float _4203 = _4199 * 0.5;
                    float _4205 = -_4201;
                    float _4207 = 0.0 + _4205;
                    float _4209 = fma(_4203, _4207, 0.5);
                    float _4211 = fma(_4201, _4209, _4201);
                    float _4213 = -_4211;
                    float _4215 = 0.0 + _4213;
                    float _4217 = fma(_4211, _4215, _4197);
                    float _4219 = fma(_4203, _4217, _4211);
                    float _4221 = _4219 * 2.3283064365386962890625e-10;
                    _4143 = as_type<int>(_4221);
                    _4129 = as_type<int>(_4211);
                    _4131 = as_type<int>(_4197);
                }
            }
        }
    }
    int _4223 = _4143;
    int _4225 = _4129;
    int _4227 = _4131;
    int _4229 = _4133;
    _4107 = _4105;
    _4108 = 0;
    _4109 = _4223;
    _4110 = _4225;
    _4111 = _4227;
    _4112 = _4229;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4446, thread const int& _4447, thread const int& _4448, thread int& _4449, thread uint& gl_SubgroupInvocationID)
{
    int _4452 = _4448 & 31;
    uint _4454 = uint(int(uint(_4448) >> uint(8)));
    int _4456 = int(_4454) & 31;
    float _4458 = as_type<float>(gl_SubgroupInvocationID);
    int _4460 = as_type<int>(_4458) & _4456;
    int _4462 = ~_4456;
    int _4464 = _4452 & _4462;
    int _4466 = _4464 | _4460;
    int _4468 = ~_4456;
    int _4470 = _4447 & _4468;
    int _4472 = _4470 | _4460;
    bool _4474 = uint(_4472) <= uint(_4466);
    _4449 = _4474 ? (-1) : 0;
    float _4476 = spvSubgroupShuffle(as_type<float>(_4446), uint(_4472));
    uint _4478 = uint(_4474 ? as_type<int>(_4476) : _4446);
    return int(_4478);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1254 = false;
    bool _468 = false;
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
    int3 _1807 = int3(_117, _123, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1807.xy), uint(_1807.z), 0).xyzw;
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
    int3 _1827 = int3(_140, _146, 1);
    float4 _148 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1827.xy), uint(_1827.z), 0).xyzw;
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
    int3 _1847 = int3(_162, _168, 0);
    float3 _172 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1847.xy), uint(_1847.z), 0).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    int _180 = _70;
    int _182 = 0;
    int _184 = _58(_180, _182, (*spvDescriptorSet0.support_buffer));
    int _186 = as_type<int>(_93);
    int _188 = 0;
    int _190 = _58(_186, _188, (*spvDescriptorSet0.support_buffer));
    int3 _1865 = int3(_184, _190, 0);
    float3 _192 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1865.xy), uint(_1865.z), 0).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    int _200 = _70;
    int _202 = 1;
    int _204 = _58(_200, _202, (*spvDescriptorSet0.support_buffer));
    int _206 = as_type<int>(_103);
    int _208 = 1;
    int _210 = _58(_206, _208, (*spvDescriptorSet0.support_buffer));
    int3 _1883 = int3(_204, _210, 1);
    float4 _212 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1883.xy), uint(_1883.z), 0).xyzw;
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
    int3 _1903 = int3(_226, _232, 1);
    float4 _234 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1903.xy), uint(_1903.z), 0).xyzw;
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
    int3 _1923 = int3(_248, _254, 2);
    float3 _256 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1923.xy), uint(_1923.z), 0).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    int _264 = _70;
    int _266 = 0;
    int _268 = _58(_264, _266, (*spvDescriptorSet0.support_buffer));
    int _270 = as_type<int>(_93);
    int _272 = 0;
    int _274 = _58(_270, _272, (*spvDescriptorSet0.support_buffer));
    int3 _1941 = int3(_268, _274, 2);
    float3 _276 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1941.xy), uint(_1941.z), 0).xyz;
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
    float _366 = -_178;
    float _368 = _366 + _198;
    float _370 = -_262;
    float _372 = _370 + _282;
    float _374 = fma(_362, _292, _176);
    float _376 = fma(_320, _352, _364);
    float _378 = fma(_368, _292, _178);
    float _380 = fma(_372, _292, _262);
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
    float _444 = _318;
    float _466;
    if (!_442)
    {
        int _446 = as_type<int>(_432);
        int _448 = as_type<int>(_280);
        int _450 = 1248;
        int _452 = as_type<int>(_412);
        int _454;
        int _456;
        int _458;
        int _460;
        int _462;
        int _464;
        _56(_446, _448, _450, _452, _454, _456, _458, _460, _462, _464);
        _466 = as_type<float>(_458);
        _468 = true;
    }
    else
    {
        float _470 = rsqrt(_412);
        float _472 = _412 * _470;
        float _474 = _470 * 0.5;
        float _476 = -_472;
        float _478 = 0.0 + _476;
        float _480 = fma(_474, _478, 0.5);
        float _482 = fma(_472, _480, _472);
        float _484 = -_482;
        float _486 = 0.0 + _484;
        float _488 = fma(_482, _486, _412);
        float _490 = fma(_474, _488, _482);
        _466 = _490;
    }
    _468 = false;
    float _492 = _466;
    int _494 = _76 + 8;
    uint _496 = uint(int(uint(_494) >> uint(2)));
    uint _498 = uint(int(uint(int(_496)) >> uint(2)));
    int _500 = int(_496) & 3;
    float _502 = (*spvDescriptorSet0.cp_c5)._m0[int(_498)][_500];
    int _504 = int(_496) + 1;
    uint _506 = uint(int(uint(_504) >> uint(2)));
    int _508 = _504 & 3;
    float _510 = (*spvDescriptorSet0.cp_c5)._m0[int(_506)][_508];
    int _512 = _70;
    int _514 = 1;
    int _516 = _58(_512, _514, (*spvDescriptorSet0.support_buffer));
    int _518 = as_type<int>(_502);
    int _520 = 1;
    int _522 = _58(_518, _520, (*spvDescriptorSet0.support_buffer));
    int3 _2281 = int3(_516, _522, 0);
    float3 _524 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2281.xy), uint(_2281.z), 0).xyz;
    float _526 = _524.x;
    float _528 = _524.y;
    float _530 = _524.z;
    int _532 = _70;
    int _534 = 1;
    int _536 = _58(_532, _534, (*spvDescriptorSet0.support_buffer));
    int _538 = as_type<int>(_502);
    int _540 = 1;
    int _542 = _58(_538, _540, (*spvDescriptorSet0.support_buffer));
    int3 _2299 = int3(_536, _542, 2);
    float3 _544 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2299.xy), uint(_2299.z), 0).xyz;
    float _546 = _544.x;
    float _548 = _544.y;
    float _550 = _544.z;
    int _552 = _70;
    int _554 = 1;
    int _556 = _58(_552, _554, (*spvDescriptorSet0.support_buffer));
    int _558 = as_type<int>(_510);
    int _560 = 1;
    int _562 = _58(_558, _560, (*spvDescriptorSet0.support_buffer));
    int3 _2317 = int3(_556, _562, 0);
    float3 _564 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2317.xy), uint(_2317.z), 0).xyz;
    float _566 = _564.x;
    float _568 = _564.y;
    float _570 = _564.z;
    int _572 = _70;
    int _574 = 1;
    int _576 = _58(_572, _574, (*spvDescriptorSet0.support_buffer));
    int _578 = as_type<int>(_510);
    int _580 = 1;
    int _582 = _58(_578, _580, (*spvDescriptorSet0.support_buffer));
    int3 _2335 = int3(_576, _582, 2);
    float3 _584 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2335.xy), uint(_2335.z), 0).xyz;
    float _586 = _584.x;
    float _588 = _584.y;
    float _590 = _584.z;
    float _592 = _436 * _492;
    float _594 = _406 * 2.0;
    float _596 = -_594;
    float _598 = fma(_592, _596, _592);
    float _600 = fma(_406, 3.1415927410125732421875, _598);
    float _602 = _600 * 0.15915493667125701904296875;
    float _604 = _602 * 6.283185482025146484375;
    float _606 = sin(_604);
    float _608 = abs(_606);
    bool _610 = _608 >= 0.001000000047497451305389404296875;
    bool _612 = isnan(_608);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.001000000047497451305389404296875);
    bool _618 = _614 || _616;
    float _620 = _406;
    float _622 = _598;
    if (!_618)
    {
        int _624 = _76 + 28;
        uint _626 = uint(int(uint(_624) >> uint(2)));
        uint _628 = uint(int(uint(int(_626)) >> uint(2)));
        int _630 = int(_626) & 3;
        float _632 = (*spvDescriptorSet0.cp_c5)._m0[int(_628)][_630];
        _620 = _632;
    }
    float _634 = _620;
    float _636 = _634;
    if (!_618)
    {
        float _638 = -_634;
        float _640 = _638 + 1.0;
        _444 = _640;
    }
    float _642 = _444;
    float _644 = _642;
    if (!_618)
    {
        _622 = _634;
    }
    float _646 = _622;
    bool _648 = !_618;
    float _650 = _646;
    if (!_648)
    {
        int _652 = _76 + 28;
        uint _654 = uint(int(uint(_652) >> uint(2)));
        uint _656 = uint(int(uint(int(_654)) >> uint(2)));
        int _658 = int(_654) & 3;
        float _660 = (*spvDescriptorSet0.cp_c5)._m0[int(_656)][_658];
        float _662 = 1.0 / _606;
        float _664 = _600 * _660;
        float _666 = _664 * 0.15915493667125701904296875;
        float _668 = -_664;
        float _670 = _600 + _668;
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
    float _698 = -_530;
    float _700 = _698 + _570;
    float _702 = -_550;
    float _704 = _702 + _590;
    bool _706 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _708 = _346 * _696;
    float _710 = _352 * _696;
    float _712 = _358 * _696;
    float _714 = _344 * _696;
    float _716 = fma(_326, _688, _708);
    float _718 = fma(_320, _688, _710);
    int _720 = _76 + 24;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.cp_c5)._m0[int(_724)][_726];
    float _730 = fma(_356, _688, _712);
    float _732 = fma(_328, _688, _714);
    float _734 = _716 * 2.0;
    float _736 = _730 * 2.0;
    float _738 = _732 * 2.0;
    int _740 = _76 + 20;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.cp_c5)._m0[int(_744)][_746];
    float _750 = _718 * _736;
    float _752 = _732 * _736;
    float _754 = _716 * _736;
    float _756 = _716 * _716;
    float _758 = -_750;
    float _760 = fma(_732, _734, _758);
    float _762 = fma(_718, _734, _752);
    float _764 = fma(_732, _734, _750);
    float _766 = -_752;
    float _768 = fma(_718, _734, _766);
    float _770 = -_754;
    float _772 = fma(_718, _738, _770);
    float _774 = fma(_718, _738, _754);
    float _776 = _732 * _732;
    float _778 = -_526;
    float _780 = _778 + _566;
    float _782 = _718 * _718;
    float _784 = fma(_756, -2.0, 1.0);
    float _786 = fma(_776, -2.0, 1.0);
    float _788 = fma(_780, _728, _526);
    float _790 = -_528;
    float _792 = _790 + _568;
    float _794 = fma(_700, _728, _530);
    float _796 = fma(_782, -2.0, _786);
    float _798 = fma(_704, _728, _550);
    float _800 = fma(_792, _728, _528);
    float _802 = _788 * _690;
    float _804 = _794 * _690;
    float _806 = _800 * _690;
    float _808 = fma(_338, _748, _802);
    bool _810 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _812 = fma(_782, -2.0, _784);
    float _814 = fma(_374, _748, _806);
    float _816 = -_546;
    float _818 = _816 + _586;
    float _820 = -_548;
    float _822 = _820 + _588;
    float _824 = fma(_378, _748, _804);
    float _826 = fma(_776, -2.0, _784);
    float _828 = fma(_818, _728, _546);
    float _830 = fma(_822, _728, _548);
    float _832 = _764 * _808;
    float _834 = _796 * _808;
    float _836 = _828 * _690;
    float _838 = _768 * _808;
    float _840 = _760 * _814;
    float _842 = _830 * _690;
    float _844 = _798 * _690;
    float _846 = _812 * _814;
    float _848 = _774 * _814;
    float _850 = _762 * _824;
    float _852 = _772 * _824;
    float _854 = _826 * _824;
    float _856 = fma(_438, _748, _836);
    float _858 = fma(_440, _748, _842);
    float _860 = fma(_380, _748, _844);
    float _862 = _850;
    float _864 = _856;
    if (!_810)
    {
        int _866 = _70 * 48;
        int _868 = _866 + 16;
        uint _870 = uint(int(uint(_866) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_870)] = as_type<uint>(_834);
        int _872 = _866 + 4;
        uint _874 = uint(int(uint(_872) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_874)] = as_type<uint>(_840);
        int _876 = _866 + 8;
        uint _878 = uint(int(uint(_876) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_878)] = as_type<uint>(_850);
        int _880 = _866 + 12;
        uint _882 = uint(int(uint(_880) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_882)] = as_type<uint>(_856);
        int _884 = _866 + 32;
        uint _886 = uint(int(uint(_868) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_886)] = as_type<uint>(_832);
        int _888 = _868 + 4;
        uint _890 = uint(int(uint(_888) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_890)] = as_type<uint>(_846);
        int _892 = _868 + 8;
        uint _894 = uint(int(uint(_892) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_894)] = as_type<uint>(_852);
        int _896 = _868 + 12;
        uint _898 = uint(int(uint(_896) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_898)] = as_type<uint>(_858);
        uint _900 = uint(int(uint(_884) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_900)] = as_type<uint>(_838);
        int _902 = _884 + 4;
        uint _904 = uint(int(uint(_902) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_904)] = as_type<uint>(_848);
        int _906 = _884 + 8;
        uint _908 = uint(int(uint(_906) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_908)] = as_type<uint>(_854);
        int _910 = _884 + 12;
        uint _912 = uint(int(uint(_910) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_912)] = as_type<uint>(_860);
    }
    int _914 = _70 * 112;
    bool _916 = !_706;
    float _1234;
    float _1236;
    float _1238;
    float _1240;
    float _1242;
    float _1244;
    float _1246;
    float _1248;
    float _1250;
    float _1252;
    if (!_916)
    {
        int _918 = 0;
        float _920 = _834;
        float _922 = _840;
        float _924 = _850;
        float _926 = _856;
        float _928 = _832;
        float _930 = _846;
        float _932 = _852;
        float _934 = _858;
        float _936 = _838;
        float _938 = _848;
        float _940 = _854;
        float _942 = _860;
        bool _944;
        int _992;
        int _1002;
        int _1012;
        int _1022;
        int _1032;
        int _1042;
        int _1052;
        int _1062;
        int _1072;
        int _1082;
        int _1092;
        int _1102;
        int _1210;
        int _1214;
        int _1216;
        int _1220;
        int _1222;
        int _1224;
        int _1228;
        int _1230;
        int _1232;
        do
        {
            int _946 = _918;
            int _948 = as_type<int>(_920);
            int _950 = as_type<int>(_922);
            int _952 = as_type<int>(_924);
            int _954 = as_type<int>(_926);
            int _956 = as_type<int>(_928);
            int _958 = as_type<int>(_930);
            int _960 = as_type<int>(_932);
            int _962 = as_type<int>(_934);
            int _964 = as_type<int>(_936);
            int _966 = as_type<int>(_938);
            int _968 = as_type<int>(_940);
            int _970 = as_type<int>(_942);
            uint _972 = uint(int(uint(_914) >> uint(2)));
            uint _974 = uint(int(uint(int(_972)) >> uint(2)));
            int _976 = int(_972) & 3;
            float _978 = (*spvDescriptorSet0.cp_c6)._m0[int(_974)][_976];
            bool _980 = _70 != 0;
            int _982 = _946 + 1;
            bool _984 = uint(_982) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _986 = _948;
            int _988 = as_type<int>(_978);
            int _990 = 31;
            int _2964 = _60(_986, _988, _990, _992, gl_SubgroupInvocationID);
            int _994 = _2964;
            int _996 = _950;
            int _998 = as_type<int>(_978);
            int _1000 = 31;
            int _2968 = _60(_996, _998, _1000, _1002, gl_SubgroupInvocationID);
            int _1004 = _2968;
            int _1006 = _952;
            int _1008 = as_type<int>(_978);
            int _1010 = 31;
            int _2972 = _60(_1006, _1008, _1010, _1012, gl_SubgroupInvocationID);
            int _1014 = _2972;
            int _1016 = _954;
            int _1018 = as_type<int>(_978);
            int _1020 = 31;
            int _2976 = _60(_1016, _1018, _1020, _1022, gl_SubgroupInvocationID);
            int _1024 = _2976;
            int _1026 = _956;
            int _1028 = as_type<int>(_978);
            int _1030 = 31;
            int _2980 = _60(_1026, _1028, _1030, _1032, gl_SubgroupInvocationID);
            int _1034 = _2980;
            int _1036 = _958;
            int _1038 = as_type<int>(_978);
            int _1040 = 31;
            int _2984 = _60(_1036, _1038, _1040, _1042, gl_SubgroupInvocationID);
            int _1044 = _2984;
            int _1046 = _960;
            int _1048 = as_type<int>(_978);
            int _1050 = 31;
            int _2988 = _60(_1046, _1048, _1050, _1052, gl_SubgroupInvocationID);
            int _1054 = _2988;
            int _1056 = _962;
            int _1058 = as_type<int>(_978);
            int _1060 = 31;
            int _2992 = _60(_1056, _1058, _1060, _1062, gl_SubgroupInvocationID);
            int _1064 = _2992;
            int _1066 = _964;
            int _1068 = as_type<int>(_978);
            int _1070 = 31;
            int _2996 = _60(_1066, _1068, _1070, _1072, gl_SubgroupInvocationID);
            int _1074 = _2996;
            int _1076 = _966;
            int _1078 = as_type<int>(_978);
            int _1080 = 31;
            int _3000 = _60(_1076, _1078, _1080, _1082, gl_SubgroupInvocationID);
            int _1084 = _3000;
            int _1086 = _968;
            int _1088 = as_type<int>(_978);
            int _1090 = 31;
            int _3004 = _60(_1086, _1088, _1090, _1092, gl_SubgroupInvocationID);
            int _1094 = _3004;
            int _1096 = _970;
            int _1098 = as_type<int>(_978);
            int _1100 = 31;
            int _3008 = _60(_1096, _1098, _1100, _1102, gl_SubgroupInvocationID);
            int _1104 = _3008;
            bool _1106 = !_980;
            _918 = _982;
            int _1108 = _948;
            int _1110 = _950;
            int _1112 = _952;
            int _1114 = _954;
            int _1116 = _956;
            int _1118 = _958;
            int _1120 = _960;
            int _1122 = _962;
            int _1124 = _964;
            int _1126 = _966;
            int _1128 = _968;
            int _1130 = _970;
            if (!_1106)
            {
                float _1132 = _858 * as_type<float>(_1044);
                float _1134 = _846 * as_type<float>(_1044);
                float _1136 = _852 * as_type<float>(_1044);
                float _1138 = _846 * as_type<float>(_1004);
                float _1140 = _832 * as_type<float>(_1004);
                float _1142 = _852 * as_type<float>(_1004);
                float _1144 = _858 * as_type<float>(_1004);
                float _1146 = fma(_856, as_type<float>(_1034), _1132);
                float _1148 = fma(_840, as_type<float>(_1034), _1134);
                float _1150 = _858 * as_type<float>(_1084);
                float _1152 = fma(_850, as_type<float>(_1034), _1136);
                float _1154 = _846 * as_type<float>(_1084);
                float _1156 = fma(_840, as_type<float>(_994), _1138);
                float _1158 = _832 * as_type<float>(_1044);
                float _1160 = _832 * as_type<float>(_1084);
                float _1162 = fma(_834, as_type<float>(_994), _1140);
                float _1164 = fma(_850, as_type<float>(_994), _1142);
                float _1166 = fma(_856, as_type<float>(_994), _1144);
                float _1168 = _852 * as_type<float>(_1084);
                float _1170 = fma(_856, as_type<float>(_1074), _1150);
                float _1172 = fma(_840, as_type<float>(_1074), _1154);
                float _1174 = fma(_834, as_type<float>(_1034), _1158);
                float _1176 = fma(_834, as_type<float>(_1074), _1160);
                float _1178 = fma(_848, as_type<float>(_1014), _1156);
                float _1180 = fma(_838, as_type<float>(_1014), _1162);
                float _1182 = fma(_854, as_type<float>(_1014), _1164);
                float _1184 = fma(_854, as_type<float>(_1054), _1152);
                float _1186 = fma(_850, as_type<float>(_1074), _1168);
                float _1188 = fma(_860, as_type<float>(_1014), _1166);
                float _1190 = fma(_860, as_type<float>(_1054), _1146);
                float _1192 = fma(_860, as_type<float>(_1094), _1170);
                float _1194 = fma(_838, as_type<float>(_1054), _1174);
                float _1196 = fma(_848, as_type<float>(_1054), _1148);
                float _1198 = fma(_838, as_type<float>(_1094), _1176);
                float _1200 = fma(_848, as_type<float>(_1094), _1172);
                float _1202 = fma(_854, as_type<float>(_1094), _1186);
                float _1204 = as_type<float>(_1024) + _1188;
                float _1206 = as_type<float>(_1064) + _1190;
                float _1208 = as_type<float>(_1104) + _1192;
                _1108 = as_type<int>(_1180);
                _1110 = as_type<int>(_1178);
                _1112 = as_type<int>(_1182);
                _1114 = as_type<int>(_1204);
                _1116 = as_type<int>(_1194);
                _1118 = as_type<int>(_1196);
                _1120 = as_type<int>(_1184);
                _1122 = as_type<int>(_1206);
                _1124 = as_type<int>(_1198);
                _1126 = as_type<int>(_1200);
                _1128 = as_type<int>(_1202);
                _1130 = as_type<int>(_1208);
            }
            _1210 = _1108;
            int _1212 = _1110;
            _1214 = _1112;
            _1216 = _1114;
            int _1218 = _1116;
            _1220 = _1118;
            _1222 = _1120;
            _1224 = _1122;
            int _1226 = _1124;
            _1228 = _1126;
            _1230 = _1128;
            _1232 = _1130;
            _944 = !_984;
            _920 = as_type<float>(_1210);
            _922 = as_type<float>(_1212);
            _924 = as_type<float>(_1214);
            _926 = as_type<float>(_1216);
            _928 = as_type<float>(_1218);
            _930 = as_type<float>(_1220);
            _932 = as_type<float>(_1222);
            _934 = as_type<float>(_1224);
            _936 = as_type<float>(_1226);
            _938 = as_type<float>(_1228);
            _940 = as_type<float>(_1230);
            _942 = as_type<float>(_1232);
            _1234 = as_type<float>(_1212);
            _1236 = as_type<float>(_1218);
            _1238 = as_type<float>(_1226);
        } while (_944);
        _1240 = as_type<float>(_1220);
        _1242 = as_type<float>(_1228);
        _1244 = as_type<float>(_1210);
        _862 = as_type<float>(_1214);
        _1246 = as_type<float>(_1222);
        _1248 = as_type<float>(_1230);
        _1250 = as_type<float>(_1224);
        _1252 = as_type<float>(_1232);
        _864 = as_type<float>(_1216);
        _1254 = true;
    }
    else
    {
        _1234 = _840;
        _1240 = _846;
        _1242 = _848;
        _1244 = _834;
        _1236 = _832;
        _1238 = _838;
        _1246 = _852;
        _1248 = _854;
        _1250 = _858;
        _1252 = _860;
    }
    _1254 = false;
    float _1256 = _1234;
    float _1258 = _1240;
    float _1260 = _1242;
    float _1262 = _1244;
    float _1264 = _1236;
    float _1266 = _1238;
    float _1268 = _862;
    float _1270 = _1246;
    float _1272 = _1248;
    float _1274 = _1250;
    float _1276 = _1252;
    float _1278 = _864;
    int _1280 = _914 + 80;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.cp_c6)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1300 = _1298 + _70;
    int _1302 = _914 + 64;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    uint _1306 = uint(int(uint(int(_1304)) >> uint(2)));
    int _1308 = int(_1304) & 3;
    float _1310 = (*spvDescriptorSet0.cp_c6)._m0[int(_1306)][_1308];
    int _1312 = int(_1304) + 1;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    int _1316 = _1312 & 3;
    float _1318 = (*spvDescriptorSet0.cp_c6)._m0[int(_1314)][_1316];
    int _1320 = _1300 * 48;
    int _1322 = _914 + 88;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.cp_c6)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    int _1340 = _914 + 72;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    uint _1344 = uint(int(uint(int(_1342)) >> uint(2)));
    int _1346 = int(_1342) & 3;
    float _1348 = (*spvDescriptorSet0.cp_c6)._m0[int(_1344)][_1346];
    int _1350 = int(_1342) + 1;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    int _1354 = _1350 & 3;
    float _1356 = (*spvDescriptorSet0.cp_c6)._m0[int(_1352)][_1354];
    int _1358 = _914 + 96;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.cp_c6)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.cp_c6)._m0[int(_1370)][_1372];
    int _1376 = _914 + 104;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    uint _1380 = uint(int(uint(int(_1378)) >> uint(2)));
    int _1382 = int(_1378) & 3;
    float _1384 = (*spvDescriptorSet0.cp_c6)._m0[int(_1380)][_1382];
    int _1386 = int(_1378) + 1;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    int _1390 = _1386 & 3;
    float _1392 = (*spvDescriptorSet0.cp_c6)._m0[int(_1388)][_1390];
    float _1394 = _1256 * _1288;
    float _1396 = _1258 * _1288;
    float _1398 = _1260 * _1288;
    float _1400 = _1256 * _1296;
    float _1402 = _1260 * _1296;
    int _1404 = _914 + 16;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.cp_c6)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.cp_c6)._m0[int(_1416)][_1418];
    float _1422 = fma(_1262, _1310, _1394);
    float _1424 = fma(_1264, _1310, _1396);
    float _1426 = fma(_1266, _1310, _1398);
    float _1428 = _1258 * _1296;
    float _1430 = fma(_1262, _1318, _1400);
    int _1432 = _914 + 32;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.cp_c6)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.cp_c6)._m0[int(_1444)][_1446];
    float _1450 = fma(_1266, _1318, _1402);
    float _1452 = fma(_1264, _1318, _1428);
    float _1454 = _1256 * _1330;
    float _1456 = _1258 * _1330;
    float _1458 = _1256 * _1338;
    float _1460 = _1258 * _1338;
    float _1462 = _1260 * _1330;
    int _1464 = _914 + 48;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.cp_c6)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.cp_c6)._m0[int(_1476)][_1478];
    float _1482 = _1260 * _1338;
    float _1484 = fma(_1262, _1348, _1454);
    float _1486 = fma(_1264, _1348, _1456);
    float _1488 = fma(_1262, _1356, _1458);
    float _1490 = fma(_1264, _1356, _1460);
    float _1492 = fma(_1266, _1348, _1462);
    int _1494 = _914 + 24;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    uint _1498 = uint(int(uint(int(_1496)) >> uint(2)));
    int _1500 = int(_1496) & 3;
    float _1502 = (*spvDescriptorSet0.cp_c6)._m0[int(_1498)][_1500];
    int _1504 = int(_1496) + 1;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    int _1508 = _1504 & 3;
    float _1510 = (*spvDescriptorSet0.cp_c6)._m0[int(_1506)][_1508];
    float _1512 = fma(_1266, _1356, _1482);
    float _1514 = fma(_1268, _1366, _1422);
    float _1516 = fma(_1268, _1374, _1430);
    float _1518 = fma(_1270, _1366, _1424);
    float _1520 = fma(_1270, _1374, _1452);
    float _1522 = fma(_1272, _1366, _1426);
    int _1524 = _914 + 40;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.cp_c6)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.cp_c6)._m0[int(_1536)][_1538];
    float _1542 = fma(_1272, _1374, _1450);
    float _1544 = fma(_1268, _1384, _1484);
    float _1546 = fma(_1270, _1392, _1490);
    float _1548 = fma(_1268, _1392, _1488);
    float _1550 = fma(_1272, _1392, _1512);
    float _1552 = fma(_1270, _1384, _1486);
    int _1554 = _914 + 56;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.cp_c6)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.cp_c6)._m0[int(_1566)][_1568];
    float _1572 = _1546 + _1274;
    float _1574 = fma(_1272, _1384, _1492);
    float _1576 = _1550 + _1276;
    float _1578 = _1548 + _1278;
    float _1580 = _1518 * _1420;
    float _1582 = _1520 * _1420;
    float _1584 = _1552 * _1420;
    float _1586 = _1572 * _1420;
    float _1588 = fma(_1514, _1412, _1580);
    float _1590 = fma(_1516, _1412, _1582);
    float _1592 = fma(_1544, _1412, _1584);
    float _1594 = fma(_1578, _1412, _1586);
    float _1596 = _1572 * _1448;
    float _1598 = _1518 * _1448;
    float _1600 = _1520 * _1448;
    float _1602 = _1552 * _1448;
    float _1604 = fma(_1578, _1440, _1596);
    float _1606 = fma(_1514, _1440, _1598);
    float _1608 = fma(_1516, _1440, _1600);
    float _1610 = fma(_1544, _1440, _1602);
    float _1612 = _1572 * _1480;
    float _1614 = _1518 * _1480;
    float _1616 = _1520 * _1480;
    float _1618 = _1552 * _1480;
    float _1620 = fma(_1578, _1472, _1612);
    float _1622 = fma(_1514, _1472, _1614);
    float _1624 = fma(_1516, _1472, _1616);
    float _1626 = fma(_1544, _1472, _1618);
    float _1628 = fma(_1576, _1502, _1594);
    float _1630 = fma(_1522, _1502, _1588);
    float _1632 = fma(_1542, _1502, _1590);
    float _1634 = fma(_1574, _1502, _1592);
    float _1636 = _1628 + _1510;
    float _1638 = fma(_1576, _1532, _1604);
    float _1640 = fma(_1522, _1532, _1606);
    float _1642 = fma(_1542, _1532, _1608);
    int _1644 = _1320 + 16;
    float _1646 = fma(_1574, _1532, _1610);
    float _1648 = _1638 + _1540;
    int _1650 = _1320 + 32;
    float _1652 = fma(_1576, _1562, _1620);
    float _1654 = fma(_1522, _1562, _1622);
    float _1656 = fma(_1542, _1562, _1624);
    float _1658 = fma(_1574, _1562, _1626);
    float _1660 = _1652 + _1570;
    int _1662 = _1320 + 48;
    uint _1664 = uint(int(uint(_1644) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1664)] = as_type<uint>(_1630);
    int _1666 = _1644 + 4;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1668)] = as_type<uint>(_1632);
    int _1670 = _1644 + 8;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1672)] = as_type<uint>(_1634);
    int _1674 = _1644 + 12;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1676)] = as_type<uint>(_1636);
    uint _1678 = uint(int(uint(_1650) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1678)] = as_type<uint>(_1640);
    int _1680 = _1650 + 4;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1682)] = as_type<uint>(_1642);
    int _1684 = _1650 + 8;
    uint _1686 = uint(int(uint(_1684) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1686)] = as_type<uint>(_1646);
    int _1688 = _1650 + 12;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1690)] = as_type<uint>(_1648);
    uint _1692 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1692)] = as_type<uint>(_1654);
    int _1694 = _1662 + 4;
    uint _1696 = uint(int(uint(_1694) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1696)] = as_type<uint>(_1656);
    int _1698 = _1662 + 8;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1700)] = as_type<uint>(_1658);
    int _1702 = _1662 + 12;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1704)] = as_type<uint>(_1660);
}

