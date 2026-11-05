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
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4414, thread const int& _4415, constant _10& support_buffer)
{
    int _4418 = 1 + _4415;
    float _4420 = support_buffer._m5[_4418].x;
    bool _4422 = _4420 == 1.0;
    if (_4422)
    {
        return _4414;
    }
    float _4424 = float(_4414);
    float _4426 = _4424 * _4420;
    int _4428 = int(_4426);
    return _4428;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4102, thread const int& _4103, thread const int& _4104, thread const int& _4105, thread int& _4106, thread int& _4107, thread int& _4108, thread int& _4109, thread int& _4110, thread int& _4111)
{
    float _4114 = as_type<float>(_4103) + 0.0;
    bool _4116 = _4114 != 0.0;
    bool _4118 = isnan(_4114);
    bool _4120 = _4116 || _4118;
    bool _4122 = isnan(0.0);
    bool _4124 = _4120 || _4122;
    int _4126 = as_type<int>(_4114);
    int _4128 = _4103;
    int _4130 = _4104;
    int _4132 = _4124 ? (-1) : 0;
    if (!_4124)
    {
        float _4134 = as_type<float>(_4103) * 1.0;
        _4126 = as_type<int>(_4134);
    }
    int _4136 = _4126;
    bool _4138 = !_4124;
    int _4140 = _4136;
    if (!_4138)
    {
        float _4142 = as_type<float>(_4103) + 0.0;
        bool _4144 = _4142 >= 0.0;
        bool _4146 = isnan(_4142);
        bool _4148 = _4144 || _4146;
        bool _4150 = isnan(0.0);
        bool _4152 = _4148 || _4150;
        int _4154 = as_type<int>(_4142);
        _4132 = _4152 ? (-1) : 0;
        if (!_4152)
        {
            _4154 = 2147483647;
        }
        int _4156 = _4154;
        bool _4158 = !_4152;
        _4140 = _4156;
        if (!_4158)
        {
            float _4160 = as_type<float>(_4103) + 0.0;
            bool _4162 = _4160 > as_type<float>(0x7f800000u /* inf */);
            bool _4164 = isnan(_4160);
            bool _4166 = _4162 || _4164;
            bool _4168 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4170 = _4166 || _4168;
            int _4172 = as_type<int>(_4160);
            _4132 = _4170 ? (-1) : 0;
            if (_4170)
            {
                float _4174 = as_type<float>(_4103) + 1.0;
                _4172 = as_type<int>(_4174);
            }
            int _4176 = _4172;
            _4140 = _4176;
            if (!_4170)
            {
                float _4178 = 0.0 + as_type<float>(_4103);
                bool _4180 = _4178 != as_type<float>(0x7f800000u /* inf */);
                bool _4182 = isnan(_4178);
                bool _4184 = _4180 || _4182;
                bool _4186 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4188 = _4184 || _4186;
                int _4190 = as_type<int>(_4178);
                _4132 = _4188 ? (-1) : 0;
                if (!_4188)
                {
                    _4190 = _4103;
                }
                int _4192 = _4190;
                bool _4194 = !_4188;
                _4140 = _4192;
                if (!_4194)
                {
                    float _4196 = as_type<float>(_4103) * 18446744073709551616.0;
                    float _4198 = rsqrt(_4196);
                    float _4200 = _4196 * _4198;
                    float _4202 = _4198 * 0.5;
                    float _4204 = -_4200;
                    float _4206 = 0.0 + _4204;
                    float _4208 = fma(_4202, _4206, 0.5);
                    float _4210 = fma(_4200, _4208, _4200);
                    float _4212 = -_4210;
                    float _4214 = 0.0 + _4212;
                    float _4216 = fma(_4210, _4214, _4196);
                    float _4218 = fma(_4202, _4216, _4210);
                    float _4220 = _4218 * 2.3283064365386962890625e-10;
                    _4140 = as_type<int>(_4220);
                    _4128 = as_type<int>(_4206);
                    _4130 = as_type<int>(_4210);
                }
            }
        }
    }
    int _4222 = _4140;
    int _4224 = _4128;
    int _4226 = _4130;
    int _4228 = _4132;
    _4106 = _4222;
    _4107 = _4105;
    _4108 = 0;
    _4109 = _4224;
    _4110 = _4226;
    _4111 = _4228;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4449, thread const int& _4450, thread const int& _4451, thread int& _4452, thread uint& gl_SubgroupInvocationID)
{
    int _4455 = _4451 & 31;
    uint _4457 = uint(int(uint(_4451) >> uint(8)));
    int _4459 = int(_4457) & 31;
    float _4461 = as_type<float>(gl_SubgroupInvocationID);
    int _4463 = as_type<int>(_4461) & _4459;
    int _4465 = ~_4459;
    int _4467 = _4455 & _4465;
    int _4469 = _4467 | _4463;
    int _4471 = ~_4459;
    int _4473 = _4450 & _4471;
    int _4475 = _4473 | _4463;
    bool _4477 = uint(_4475) <= uint(_4469);
    _4452 = _4477 ? (-1) : 0;
    float _4479 = spvSubgroupShuffle(as_type<float>(_4449), uint(_4475));
    uint _4481 = uint(_4477 ? as_type<int>(_4479) : _4449);
    return int(_4481);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1278 = false;
    bool _786 = false;
    bool _482 = false;
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
    int _105 = _103 + 36;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _103 + 32;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.cp_c5)._m0[int(_119)][_121];
    int _125 = as_type<int>(_101) & as_type<int>(_113);
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_101) & as_type<int>(_123);
    bool _131 = _129 != 0;
    int _133 = 0;
    float _135 = _101;
    if (_127)
    {
        int _137 = _103 + 8;
        uint _139 = uint(int(uint(_137) >> uint(2)));
        uint _141 = uint(int(uint(int(_139)) >> uint(2)));
        int _143 = int(_139) & 3;
        float _145 = (*spvDescriptorSet0.cp_c5)._m0[int(_141)][_143];
        _133 = as_type<int>(_145);
    }
    int _147 = _133;
    float _149 = 0.0;
    if (_127)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    int _153 = 0;
    if (_131)
    {
        uint _155 = uint(int(uint(_103) >> uint(2)));
        uint _157 = uint(int(uint(int(_155)) >> uint(2)));
        int _159 = int(_155) & 3;
        float _161 = (*spvDescriptorSet0.cp_c5)._m0[int(_157)][_159];
        _153 = as_type<int>(_161);
    }
    int _163 = _153;
    float _165 = 0.0;
    if (_131)
    {
        _165 = 2.8025969286496341418474591665798e-45;
    }
    float _167 = _165;
    if (_131)
    {
        _135 = 1.4012984643248170709237295832899e-45;
    }
    float _169 = _135;
    float _171 = _151;
    float _173 = as_type<float>(_70);
    float _175 = as_type<float>(_147);
    float _177 = _113;
    if (_127)
    {
        int _179 = _70;
        int _181 = 0;
        int _183 = _58(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _147;
        int _187 = 0;
        int _189 = _58(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1931 = int3(_183, _189, as_type<int>(_151));
        float4 _192 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1931.xy), uint(_1931.z), 0).xyzw;
        float _194 = _192.x;
        float _196 = _192.y;
        float _198 = _192.z;
        float _200 = _192.w;
        _171 = _194;
        _173 = _196;
        _175 = _198;
        _177 = _200;
    }
    float _202 = _171;
    float _204 = _173;
    float _206 = _175;
    float _208 = _177;
    float _210 = 0.0;
    float _212 = as_type<float>(_70);
    float _214 = 0.0;
    if (_131)
    {
        int _216 = _70;
        int _218 = 1;
        int _220 = _58(_216, _218, (*spvDescriptorSet0.support_buffer));
        int _222 = _163;
        int _224 = 1;
        int _226 = _58(_222, _224, (*spvDescriptorSet0.support_buffer));
        int3 _1963 = int3(_220, _226, 0);
        float3 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1963.xy), uint(_1963.z), 0).xyz;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        _210 = _232;
        _212 = _234;
        _214 = _236;
    }
    float _238 = _210;
    float _240 = _212;
    float _242 = _214;
    float _244 = _167;
    float _246 = as_type<float>(_70);
    float _248 = 0.0;
    if (_131)
    {
        int _250 = _70;
        int _252 = 1;
        int _254 = _58(_250, _252, (*spvDescriptorSet0.support_buffer));
        int _256 = _163;
        int _258 = 1;
        int _260 = _58(_256, _258, (*spvDescriptorSet0.support_buffer));
        int3 _1994 = int3(_254, _260, as_type<int>(_167));
        float3 _262 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1994.xy), uint(_1994.z), 0).xyz;
        float _264 = _262.x;
        float _266 = _262.y;
        float _268 = _262.z;
        _244 = _264;
        _246 = _266;
        _248 = _268;
    }
    float _270 = _244;
    float _272 = _246;
    float _274 = _248;
    float _276 = 0.0;
    float _278 = _123;
    float _280 = 0.0;
    int _282 = 0;
    if (_131)
    {
        int _284 = _70;
        int _286 = 1;
        int _288 = _58(_284, _286, (*spvDescriptorSet0.support_buffer));
        int _290 = _163;
        int _292 = 1;
        int _294 = _58(_290, _292, (*spvDescriptorSet0.support_buffer));
        int3 _2023 = int3(_288, _294, as_type<int>(_169));
        float4 _296 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2023.xy), uint(_2023.z), 0).xyzw;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float _304 = _296.w;
        _276 = _298;
        _278 = _300;
        _280 = _302;
        _282 = as_type<int>(_304);
    }
    float _306 = _276;
    float _308 = _278;
    float _310 = _280;
    int _312 = _282;
    float _314 = 0.0;
    float _316 = 0.0;
    if (!_131)
    {
        _314 = 0.0;
        _316 = 0.0;
    }
    float _318 = _314;
    float _320 = _316;
    float _322 = 0.0;
    float _324 = 0.0;
    float _326 = _318;
    float _328 = _320;
    if (!_131)
    {
        _322 = 0.0;
        _324 = 0.0;
    }
    float _330 = _322;
    float _332 = _324;
    float _334 = 0.0;
    float _336 = 0.0;
    float _338 = _330;
    float _340 = _332;
    if (!_131)
    {
        _334 = 0.0;
        _336 = 0.0;
    }
    float _342 = _334;
    float _344 = _336;
    float _346 = 0.0;
    float _348 = _342;
    float _350 = _344;
    if (!_131)
    {
        _346 = 0.0;
    }
    float _352 = _346;
    float _354 = 0.0;
    float _356 = 0.0;
    float _358 = _352;
    if (!_131)
    {
        _354 = 0.0;
        _356 = 0.0;
    }
    float _360 = _354;
    float _362 = _356;
    float _364 = 0.0;
    float _366 = _360;
    float _368 = _362;
    if (!_131)
    {
        _364 = 0.0;
    }
    float _370 = _364;
    bool _372 = !_131;
    float _374 = _370;
    if (!_372)
    {
        _366 = _308;
        _368 = _306;
        _326 = _310;
        _374 = as_type<float>(_312);
        _328 = _238;
        _338 = _240;
        _348 = _242;
        _358 = _270;
        _340 = _272;
        _350 = _274;
    }
    float _376 = _366;
    float _378 = _368;
    float _380 = _326;
    float _382 = _374;
    float _384 = _328;
    float _386 = _338;
    float _388 = _348;
    float _390 = _358;
    float _392 = _340;
    float _394 = _350;
    bool _396 = !_127;
    float _398 = _386;
    float _400 = _390;
    float _402 = _392;
    float _762;
    float _764;
    float _766;
    float _768;
    float _770;
    float _772;
    float _774;
    float _776;
    float _778;
    float _780;
    float _782;
    float _784;
    if (!_396)
    {
        float _404 = _204 * _376;
        float _406 = fma(_202, _378, _404);
        float _408 = fma(_206, _380, _406);
        float _410 = fma(_208, _382, _408);
        float _412 = precise::max(_410, -1.0);
        float _414 = precise::min(_412, 1.0);
        bool _416 = _414 >= 0.0;
        bool _418 = isnan(_414);
        bool _420 = _416 || _418;
        bool _422 = isnan(0.0);
        bool _424 = _420 || _422;
        bool _426 = !_424;
        float _428 = -_414;
        float _430 = _426 ? _428 : _414;
        bool _432 = _430 < 0.0;
        float _434 = float(_432);
        float _436 = abs(_430);
        float _438 = -_436;
        float _440 = _438 + 1.0;
        float _442 = abs(_430);
        float _444 = fma(_442, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _446 = as_type<int>(_440) + (-218103808);
        float _448 = abs(_430);
        float _450 = fma(_448, _444, -0.212114393711090087890625);
        bool _452 = uint(_446) >= 1920991232u;
        float _454 = abs(_430);
        float _456 = fma(_454, _450, 1.570728778839111328125);
        bool _458 = !_452;
        float _480;
        if (!_458)
        {
            int _460 = _446;
            int _462 = as_type<int>(_440);
            int _464 = _312;
            int _466 = 1072;
            int _468;
            int _470;
            int _472;
            int _474;
            int _476;
            int _478;
            _56(_460, _462, _464, _466, _468, _470, _472, _474, _476, _478);
            _480 = as_type<float>(_468);
            _482 = true;
        }
        else
        {
            float _484 = rsqrt(_440);
            float _486 = _440 * _484;
            float _488 = _484 * 0.5;
            float _490 = -_486;
            float _492 = 0.0 + _490;
            float _494 = fma(_488, _492, 0.5);
            float _496 = fma(_486, _494, _486);
            float _498 = -_496;
            float _500 = 0.0 + _498;
            float _502 = fma(_496, _500, _440);
            float _504 = fma(_488, _502, _496);
            _480 = _504;
        }
        _482 = false;
        float _506 = _480;
        int _508 = _103 + 8;
        uint _510 = uint(int(uint(_508) >> uint(2)));
        uint _512 = uint(int(uint(int(_510)) >> uint(2)));
        int _514 = int(_510) & 3;
        float _516 = (*spvDescriptorSet0.cp_c5)._m0[int(_512)][_514];
        int _518 = _70;
        int _520 = 0;
        int _522 = _58(_518, _520, (*spvDescriptorSet0.support_buffer));
        int _524 = as_type<int>(_516);
        int _526 = 0;
        int _528 = _58(_524, _526, (*spvDescriptorSet0.support_buffer));
        int3 _2275 = int3(_522, _528, 0);
        float3 _530 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2275.xy), uint(_2275.z), 0).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        int _538 = _70;
        int _540 = 0;
        int _542 = _58(_538, _540, (*spvDescriptorSet0.support_buffer));
        int _544 = as_type<int>(_516);
        int _546 = 0;
        int _548 = _58(_544, _546, (*spvDescriptorSet0.support_buffer));
        int3 _2293 = int3(_542, _548, 2);
        float3 _550 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2293.xy), uint(_2293.z), 0).xyz;
        float _552 = _550.x;
        float _554 = _550.y;
        float _556 = _550.z;
        float _558 = _456 * _506;
        float _560 = _434 * 2.0;
        float _562 = -_560;
        float _564 = fma(_558, _562, _558);
        float _566 = fma(_434, 3.1415927410125732421875, _564);
        float _568 = _566 * 0.15915493667125701904296875;
        float _570 = _568 * 6.283185482025146484375;
        float _572 = sin(_570);
        float _574 = abs(_572);
        bool _576 = _574 >= 0.001000000047497451305389404296875;
        bool _578 = isnan(_574);
        bool _580 = _576 || _578;
        bool _582 = isnan(0.001000000047497451305389404296875);
        bool _584 = _580 || _582;
        float _586 = _434;
        float _588 = _560;
        float _590 = _564;
        if (!_584)
        {
            int _592 = _103 + 28;
            uint _594 = uint(int(uint(_592) >> uint(2)));
            uint _596 = uint(int(uint(int(_594)) >> uint(2)));
            int _598 = int(_594) & 3;
            float _600 = (*spvDescriptorSet0.cp_c5)._m0[int(_596)][_598];
            _586 = _600;
        }
        float _602 = _586;
        float _604 = _602;
        if (!_584)
        {
            float _606 = -_602;
            float _608 = _606 + 1.0;
            _588 = _608;
        }
        float _610 = _588;
        float _612 = _610;
        if (!_584)
        {
            _590 = _602;
        }
        float _614 = _590;
        bool _616 = !_584;
        float _618 = _614;
        if (!_616)
        {
            int _620 = _103 + 28;
            uint _622 = uint(int(uint(_620) >> uint(2)));
            uint _624 = uint(int(uint(int(_622)) >> uint(2)));
            int _626 = int(_622) & 3;
            float _628 = (*spvDescriptorSet0.cp_c5)._m0[int(_624)][_626];
            float _630 = 1.0 / _572;
            float _632 = _566 * _628;
            float _634 = _632 * 0.15915493667125701904296875;
            float _636 = -_632;
            float _638 = _566 + _636;
            float _640 = _638 * 0.15915493667125701904296875;
            float _642 = _634 * 6.283185482025146484375;
            float _644 = sin(_642);
            float _646 = _640 * 6.283185482025146484375;
            float _648 = sin(_646);
            float _650 = _644 * _630;
            float _652 = _648 * _630;
            _618 = _650;
            _604 = _628;
            _612 = _652;
        }
        float _654 = _618;
        float _656 = _604;
        float _658 = _612;
        bool _660 = !_424;
        float _662 = -_654;
        float _664 = _660 ? _662 : _654;
        int _666 = _103 + 20;
        uint _668 = uint(int(uint(_666) >> uint(2)));
        uint _670 = uint(int(uint(int(_668)) >> uint(2)));
        int _672 = int(_668) & 3;
        float _674 = (*spvDescriptorSet0.cp_c5)._m0[int(_670)][_672];
        float _676 = _534 * _656;
        float _678 = _536 * _656;
        float _680 = _208 * _664;
        float _682 = _202 * _664;
        float _684 = _206 * _664;
        float _686 = _204 * _664;
        float _688 = fma(_382, _658, _680);
        float _690 = fma(_378, _658, _682);
        float _692 = fma(_380, _658, _684);
        float _694 = fma(_376, _658, _686);
        float _696 = _688 * 2.0;
        float _698 = _690 * 2.0;
        float _700 = _690 * _690;
        float _702 = _694 * _694;
        float _704 = _692 * _696;
        float _706 = _694 * _696;
        float _708 = _690 * _696;
        float _710 = _694 * 2.0;
        float _712 = -_704;
        float _714 = fma(_694, _698, _712);
        float _716 = fma(_694, _698, _704);
        float _718 = _692 * _692;
        float _720 = fma(_700, -2.0, 1.0);
        float _722 = fma(_702, -2.0, 1.0);
        float _724 = fma(_692, _698, _706);
        float _726 = -_706;
        float _728 = fma(_692, _698, _726);
        float _730 = -_708;
        float _732 = fma(_692, _710, _730);
        float _734 = fma(_692, _710, _708);
        float _736 = fma(_718, -2.0, _722);
        float _738 = _532 * _656;
        float _740 = fma(_718, -2.0, _720);
        float _742 = fma(_702, -2.0, _720);
        float _744 = _552 * _656;
        float _746 = fma(_384, _674, _738);
        float _748 = _554 * _656;
        float _750 = _556 * _656;
        float _752 = fma(_386, _674, _676);
        float _754 = fma(_388, _674, _678);
        float _756 = fma(_390, _674, _744);
        float _758 = fma(_392, _674, _748);
        float _760 = fma(_394, _674, _750);
        _762 = _746;
        _764 = _736;
        _398 = _752;
        _766 = _714;
        _768 = _740;
        _770 = _734;
        _772 = _716;
        _774 = _728;
        _776 = _754;
        _778 = _724;
        _780 = _732;
        _782 = _742;
        _400 = _756;
        _402 = _758;
        _784 = _760;
        _786 = true;
    }
    else
    {
        float _788 = _382 * 2.0;
        float _790 = _378 * 2.0;
        float _792 = _376 * _376;
        float _794 = _788 * _380;
        float _796 = _378 * _378;
        float _798 = _788 * _378;
        float _800 = _788 * _376;
        float _802 = _376 * 2.0;
        float _804 = -_794;
        float _806 = fma(_790, _376, _804);
        float _808 = fma(_790, _376, _794);
        float _810 = _380 * _380;
        float _812 = fma(_792, -2.0, 1.0);
        float _814 = fma(_796, -2.0, 1.0);
        float _816 = fma(_790, _380, _800);
        float _818 = -_798;
        float _820 = fma(_802, _380, _818);
        float _822 = -_800;
        float _824 = fma(_790, _380, _822);
        float _826 = fma(_802, _380, _798);
        float _828 = fma(_810, -2.0, _812);
        float _830 = fma(_810, -2.0, _814);
        float _832 = fma(_792, -2.0, _814);
        _762 = _384;
        _764 = _828;
        _766 = _806;
        _768 = _830;
        _770 = _826;
        _772 = _808;
        _774 = _824;
        _776 = _388;
        _778 = _816;
        _780 = _820;
        _782 = _832;
        _784 = _394;
    }
    _786 = false;
    float _834 = _762;
    float _836 = _764;
    float _838 = _398;
    float _840 = _766;
    float _842 = _768;
    float _844 = _770;
    float _846 = _772;
    float _848 = _774;
    float _850 = _776;
    float _852 = _778;
    float _854 = _780;
    float _856 = _782;
    float _858 = _400;
    float _860 = _402;
    float _862 = _784;
    float _864 = _834 * _836;
    float _866 = _838 * _840;
    float _868 = _838 * _842;
    bool _870 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _872 = _838 * _844;
    bool _874 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _876 = _834 * _846;
    float _878 = _834 * _848;
    float _880 = _850 * _852;
    float _882 = _850 * _854;
    float _884 = _850 * _856;
    float _886 = _880;
    float _888 = _858;
    if (!_870)
    {
        int _890 = _70 * 48;
        int _892 = _890 + 16;
        uint _894 = uint(int(uint(_890) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_894)] = as_type<uint>(_864);
        int _896 = _890 + 4;
        uint _898 = uint(int(uint(_896) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_898)] = as_type<uint>(_866);
        int _900 = _890 + 8;
        uint _902 = uint(int(uint(_900) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_902)] = as_type<uint>(_880);
        int _904 = _890 + 12;
        uint _906 = uint(int(uint(_904) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_906)] = as_type<uint>(_858);
        int _908 = _890 + 32;
        uint _910 = uint(int(uint(_892) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_910)] = as_type<uint>(_876);
        int _912 = _892 + 4;
        uint _914 = uint(int(uint(_912) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_914)] = as_type<uint>(_868);
        int _916 = _892 + 8;
        uint _918 = uint(int(uint(_916) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_918)] = as_type<uint>(_882);
        int _920 = _892 + 12;
        uint _922 = uint(int(uint(_920) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_922)] = as_type<uint>(_860);
        uint _924 = uint(int(uint(_908) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_924)] = as_type<uint>(_878);
        int _926 = _908 + 4;
        uint _928 = uint(int(uint(_926) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_928)] = as_type<uint>(_872);
        int _930 = _908 + 8;
        uint _932 = uint(int(uint(_930) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_932)] = as_type<uint>(_884);
        int _934 = _908 + 12;
        uint _936 = uint(int(uint(_934) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_936)] = as_type<uint>(_862);
    }
    int _938 = _70 * 112;
    bool _940 = !_874;
    float _1258;
    float _1260;
    float _1262;
    float _1264;
    float _1266;
    float _1268;
    float _1270;
    float _1272;
    float _1274;
    float _1276;
    if (!_940)
    {
        int _942 = 0;
        float _944 = _864;
        float _946 = _866;
        float _948 = _880;
        float _950 = _858;
        float _952 = _876;
        float _954 = _868;
        float _956 = _882;
        float _958 = _860;
        float _960 = _878;
        float _962 = _872;
        float _964 = _884;
        float _966 = _862;
        bool _968;
        int _1016;
        int _1026;
        int _1036;
        int _1046;
        int _1056;
        int _1066;
        int _1076;
        int _1086;
        int _1096;
        int _1106;
        int _1116;
        int _1126;
        int _1234;
        int _1238;
        int _1240;
        int _1244;
        int _1246;
        int _1248;
        int _1252;
        int _1254;
        int _1256;
        do
        {
            int _970 = _942;
            int _972 = as_type<int>(_944);
            int _974 = as_type<int>(_946);
            int _976 = as_type<int>(_948);
            int _978 = as_type<int>(_950);
            int _980 = as_type<int>(_952);
            int _982 = as_type<int>(_954);
            int _984 = as_type<int>(_956);
            int _986 = as_type<int>(_958);
            int _988 = as_type<int>(_960);
            int _990 = as_type<int>(_962);
            int _992 = as_type<int>(_964);
            int _994 = as_type<int>(_966);
            uint _996 = uint(int(uint(_938) >> uint(2)));
            uint _998 = uint(int(uint(int(_996)) >> uint(2)));
            int _1000 = int(_996) & 3;
            float _1002 = (*spvDescriptorSet0.cp_c6)._m0[int(_998)][_1000];
            bool _1004 = _70 != 0;
            int _1006 = _970 + 1;
            bool _1008 = uint(_1006) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _1010 = _972;
            int _1012 = as_type<int>(_1002);
            int _1014 = 31;
            int _2962 = _60(_1010, _1012, _1014, _1016, gl_SubgroupInvocationID);
            int _1018 = _2962;
            int _1020 = _974;
            int _1022 = as_type<int>(_1002);
            int _1024 = 31;
            int _2966 = _60(_1020, _1022, _1024, _1026, gl_SubgroupInvocationID);
            int _1028 = _2966;
            int _1030 = _976;
            int _1032 = as_type<int>(_1002);
            int _1034 = 31;
            int _2970 = _60(_1030, _1032, _1034, _1036, gl_SubgroupInvocationID);
            int _1038 = _2970;
            int _1040 = _978;
            int _1042 = as_type<int>(_1002);
            int _1044 = 31;
            int _2974 = _60(_1040, _1042, _1044, _1046, gl_SubgroupInvocationID);
            int _1048 = _2974;
            int _1050 = _980;
            int _1052 = as_type<int>(_1002);
            int _1054 = 31;
            int _2978 = _60(_1050, _1052, _1054, _1056, gl_SubgroupInvocationID);
            int _1058 = _2978;
            int _1060 = _982;
            int _1062 = as_type<int>(_1002);
            int _1064 = 31;
            int _2982 = _60(_1060, _1062, _1064, _1066, gl_SubgroupInvocationID);
            int _1068 = _2982;
            int _1070 = _984;
            int _1072 = as_type<int>(_1002);
            int _1074 = 31;
            int _2986 = _60(_1070, _1072, _1074, _1076, gl_SubgroupInvocationID);
            int _1078 = _2986;
            int _1080 = _986;
            int _1082 = as_type<int>(_1002);
            int _1084 = 31;
            int _2990 = _60(_1080, _1082, _1084, _1086, gl_SubgroupInvocationID);
            int _1088 = _2990;
            int _1090 = _988;
            int _1092 = as_type<int>(_1002);
            int _1094 = 31;
            int _2994 = _60(_1090, _1092, _1094, _1096, gl_SubgroupInvocationID);
            int _1098 = _2994;
            int _1100 = _990;
            int _1102 = as_type<int>(_1002);
            int _1104 = 31;
            int _2998 = _60(_1100, _1102, _1104, _1106, gl_SubgroupInvocationID);
            int _1108 = _2998;
            int _1110 = _992;
            int _1112 = as_type<int>(_1002);
            int _1114 = 31;
            int _3002 = _60(_1110, _1112, _1114, _1116, gl_SubgroupInvocationID);
            int _1118 = _3002;
            int _1120 = _994;
            int _1122 = as_type<int>(_1002);
            int _1124 = 31;
            int _3006 = _60(_1120, _1122, _1124, _1126, gl_SubgroupInvocationID);
            int _1128 = _3006;
            bool _1130 = !_1004;
            _942 = _1006;
            int _1132 = _972;
            int _1134 = _974;
            int _1136 = _976;
            int _1138 = _978;
            int _1140 = _980;
            int _1142 = _982;
            int _1144 = _984;
            int _1146 = _986;
            int _1148 = _988;
            int _1150 = _990;
            int _1152 = _992;
            int _1154 = _994;
            if (!_1130)
            {
                float _1156 = as_type<float>(_1028) * _860;
                float _1158 = _876 * as_type<float>(_1028);
                float _1160 = _868 * as_type<float>(_1028);
                float _1162 = _882 * as_type<float>(_1028);
                float _1164 = as_type<float>(_1068) * _860;
                float _1166 = _876 * as_type<float>(_1068);
                float _1168 = fma(as_type<float>(_1018), _858, _1156);
                float _1170 = fma(_864, as_type<float>(_1018), _1158);
                float _1172 = fma(_866, as_type<float>(_1018), _1160);
                float _1174 = fma(_880, as_type<float>(_1018), _1162);
                float _1176 = _868 * as_type<float>(_1068);
                float _1178 = _882 * as_type<float>(_1068);
                float _1180 = fma(as_type<float>(_1058), _858, _1164);
                float _1182 = as_type<float>(_1108) * _860;
                float _1184 = fma(_864, as_type<float>(_1058), _1166);
                float _1186 = _868 * as_type<float>(_1108);
                float _1188 = _876 * as_type<float>(_1108);
                float _1190 = fma(_866, as_type<float>(_1058), _1176);
                float _1192 = fma(_880, as_type<float>(_1058), _1178);
                float _1194 = _882 * as_type<float>(_1108);
                float _1196 = fma(as_type<float>(_1098), _858, _1182);
                float _1198 = fma(_866, as_type<float>(_1098), _1186);
                float _1200 = fma(_864, as_type<float>(_1098), _1188);
                float _1202 = fma(_872, as_type<float>(_1038), _1172);
                float _1204 = fma(_884, as_type<float>(_1038), _1174);
                float _1206 = fma(_878, as_type<float>(_1038), _1170);
                float _1208 = fma(_878, as_type<float>(_1078), _1184);
                float _1210 = fma(_872, as_type<float>(_1078), _1190);
                float _1212 = fma(_884, as_type<float>(_1078), _1192);
                float _1214 = fma(_880, as_type<float>(_1098), _1194);
                float _1216 = fma(as_type<float>(_1038), _862, _1168);
                float _1218 = fma(as_type<float>(_1078), _862, _1180);
                float _1220 = fma(as_type<float>(_1118), _862, _1196);
                float _1222 = fma(_872, as_type<float>(_1118), _1198);
                float _1224 = fma(_878, as_type<float>(_1118), _1200);
                float _1226 = fma(_884, as_type<float>(_1118), _1214);
                float _1228 = as_type<float>(_1048) + _1216;
                float _1230 = as_type<float>(_1088) + _1218;
                float _1232 = as_type<float>(_1128) + _1220;
                _1132 = as_type<int>(_1206);
                _1134 = as_type<int>(_1202);
                _1136 = as_type<int>(_1204);
                _1138 = as_type<int>(_1228);
                _1140 = as_type<int>(_1208);
                _1142 = as_type<int>(_1210);
                _1144 = as_type<int>(_1212);
                _1146 = as_type<int>(_1230);
                _1148 = as_type<int>(_1224);
                _1150 = as_type<int>(_1222);
                _1152 = as_type<int>(_1226);
                _1154 = as_type<int>(_1232);
            }
            _1234 = _1132;
            int _1236 = _1134;
            _1238 = _1136;
            _1240 = _1138;
            int _1242 = _1140;
            _1244 = _1142;
            _1246 = _1144;
            _1248 = _1146;
            int _1250 = _1148;
            _1252 = _1150;
            _1254 = _1152;
            _1256 = _1154;
            _968 = !_1008;
            _944 = as_type<float>(_1234);
            _946 = as_type<float>(_1236);
            _948 = as_type<float>(_1238);
            _950 = as_type<float>(_1240);
            _952 = as_type<float>(_1242);
            _954 = as_type<float>(_1244);
            _956 = as_type<float>(_1246);
            _958 = as_type<float>(_1248);
            _960 = as_type<float>(_1250);
            _962 = as_type<float>(_1252);
            _964 = as_type<float>(_1254);
            _966 = as_type<float>(_1256);
            _1258 = as_type<float>(_1236);
            _1260 = as_type<float>(_1242);
            _1262 = as_type<float>(_1250);
        } while (_968);
        _1264 = as_type<float>(_1244);
        _1266 = as_type<float>(_1252);
        _1268 = as_type<float>(_1234);
        _886 = as_type<float>(_1238);
        _1270 = as_type<float>(_1246);
        _1272 = as_type<float>(_1254);
        _1274 = as_type<float>(_1248);
        _1276 = as_type<float>(_1256);
        _888 = as_type<float>(_1240);
        _1278 = true;
    }
    else
    {
        _1258 = _866;
        _1264 = _868;
        _1266 = _872;
        _1268 = _864;
        _1260 = _876;
        _1262 = _878;
        _1270 = _882;
        _1272 = _884;
        _1274 = _860;
        _1276 = _862;
    }
    _1278 = false;
    float _1280 = _1258;
    float _1282 = _1264;
    float _1284 = _1266;
    float _1286 = _1268;
    float _1288 = _1260;
    float _1290 = _1262;
    float _1292 = _886;
    float _1294 = _1270;
    float _1296 = _1272;
    float _1298 = _1274;
    float _1300 = _1276;
    float _1302 = _888;
    int _1304 = _938 + 80;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
    int _1310 = int(_1306) & 3;
    float _1312 = (*spvDescriptorSet0.cp_c6)._m0[int(_1308)][_1310];
    int _1314 = int(_1306) + 1;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    int _1318 = _1314 & 3;
    float _1320 = (*spvDescriptorSet0.cp_c6)._m0[int(_1316)][_1318];
    int _1322 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1324 = _1322 + _70;
    int _1326 = _938 + 64;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
    int _1332 = int(_1328) & 3;
    float _1334 = (*spvDescriptorSet0.cp_c6)._m0[int(_1330)][_1332];
    int _1336 = int(_1328) + 1;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    int _1340 = _1336 & 3;
    float _1342 = (*spvDescriptorSet0.cp_c6)._m0[int(_1338)][_1340];
    int _1344 = _938 + 88;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.cp_c6)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.cp_c6)._m0[int(_1356)][_1358];
    int _1362 = _938 + 72;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    uint _1366 = uint(int(uint(int(_1364)) >> uint(2)));
    int _1368 = int(_1364) & 3;
    float _1370 = (*spvDescriptorSet0.cp_c6)._m0[int(_1366)][_1368];
    int _1372 = int(_1364) + 1;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    int _1376 = _1372 & 3;
    float _1378 = (*spvDescriptorSet0.cp_c6)._m0[int(_1374)][_1376];
    int _1380 = _938 + 96;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
    int _1386 = int(_1382) & 3;
    float _1388 = (*spvDescriptorSet0.cp_c6)._m0[int(_1384)][_1386];
    int _1390 = int(_1382) + 1;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    int _1394 = _1390 & 3;
    float _1396 = (*spvDescriptorSet0.cp_c6)._m0[int(_1392)][_1394];
    int _1398 = _938 + 104;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
    int _1404 = int(_1400) & 3;
    float _1406 = (*spvDescriptorSet0.cp_c6)._m0[int(_1402)][_1404];
    int _1408 = int(_1400) + 1;
    uint _1410 = uint(int(uint(_1408) >> uint(2)));
    int _1412 = _1408 & 3;
    float _1414 = (*spvDescriptorSet0.cp_c6)._m0[int(_1410)][_1412];
    float _1416 = _1280 * _1312;
    float _1418 = _1282 * _1312;
    float _1420 = _1284 * _1312;
    int _1422 = _938 + 16;
    uint _1424 = uint(int(uint(_1422) >> uint(2)));
    uint _1426 = uint(int(uint(int(_1424)) >> uint(2)));
    int _1428 = int(_1424) & 3;
    float _1430 = (*spvDescriptorSet0.cp_c6)._m0[int(_1426)][_1428];
    int _1432 = int(_1424) + 1;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    int _1436 = _1432 & 3;
    float _1438 = (*spvDescriptorSet0.cp_c6)._m0[int(_1434)][_1436];
    float _1440 = _1280 * _1320;
    float _1442 = _1284 * _1320;
    float _1444 = fma(_1286, _1334, _1416);
    float _1446 = fma(_1288, _1334, _1418);
    float _1448 = fma(_1290, _1334, _1420);
    float _1450 = _1282 * _1320;
    int _1452 = _938 + 32;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
    int _1458 = int(_1454) & 3;
    float _1460 = (*spvDescriptorSet0.cp_c6)._m0[int(_1456)][_1458];
    int _1462 = int(_1454) + 1;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    int _1466 = _1462 & 3;
    float _1468 = (*spvDescriptorSet0.cp_c6)._m0[int(_1464)][_1466];
    float _1470 = fma(_1286, _1342, _1440);
    float _1472 = fma(_1290, _1342, _1442);
    float _1474 = fma(_1288, _1342, _1450);
    float _1476 = _1280 * _1352;
    float _1478 = _1282 * _1352;
    float _1480 = _1284 * _1352;
    float _1482 = _1284 * _1360;
    int _1484 = _938 + 48;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.cp_c6)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.cp_c6)._m0[int(_1496)][_1498];
    float _1502 = _1280 * _1360;
    float _1504 = _1282 * _1360;
    float _1506 = fma(_1286, _1370, _1476);
    float _1508 = fma(_1288, _1370, _1478);
    float _1510 = fma(_1286, _1378, _1502);
    float _1512 = fma(_1288, _1378, _1504);
    int _1514 = _938 + 40;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
    int _1520 = int(_1516) & 3;
    float _1522 = (*spvDescriptorSet0.cp_c6)._m0[int(_1518)][_1520];
    int _1524 = int(_1516) + 1;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    int _1528 = _1524 & 3;
    float _1530 = (*spvDescriptorSet0.cp_c6)._m0[int(_1526)][_1528];
    float _1532 = fma(_1290, _1370, _1480);
    float _1534 = fma(_1290, _1378, _1482);
    float _1536 = fma(_1292, _1388, _1444);
    float _1538 = fma(_1294, _1388, _1446);
    float _1540 = fma(_1296, _1388, _1448);
    float _1542 = fma(_1294, _1396, _1474);
    int _1544 = _938 + 24;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    uint _1548 = uint(int(uint(int(_1546)) >> uint(2)));
    int _1550 = int(_1546) & 3;
    float _1552 = (*spvDescriptorSet0.cp_c6)._m0[int(_1548)][_1550];
    int _1554 = int(_1546) + 1;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    int _1558 = _1554 & 3;
    float _1560 = (*spvDescriptorSet0.cp_c6)._m0[int(_1556)][_1558];
    float _1562 = fma(_1292, _1396, _1470);
    float _1564 = fma(_1296, _1396, _1472);
    float _1566 = fma(_1292, _1406, _1506);
    float _1568 = fma(_1294, _1414, _1512);
    float _1570 = fma(_1296, _1414, _1534);
    float _1572 = fma(_1292, _1414, _1510);
    int _1574 = _938 + 56;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.cp_c6)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.cp_c6)._m0[int(_1586)][_1588];
    float _1592 = fma(_1294, _1406, _1508);
    float _1594 = _1568 + _1298;
    float _1596 = fma(_1296, _1406, _1532);
    float _1598 = _1570 + _1300;
    float _1600 = _1572 + _1302;
    float _1602 = _1538 * _1438;
    float _1604 = _1542 * _1438;
    float _1606 = _1592 * _1438;
    float _1608 = _1594 * _1438;
    float _1610 = fma(_1536, _1430, _1602);
    float _1612 = fma(_1562, _1430, _1604);
    float _1614 = fma(_1566, _1430, _1606);
    float _1616 = fma(_1600, _1430, _1608);
    float _1618 = _1538 * _1468;
    float _1620 = _1542 * _1468;
    float _1622 = _1592 * _1468;
    float _1624 = _1594 * _1468;
    float _1626 = fma(_1536, _1460, _1618);
    float _1628 = fma(_1562, _1460, _1620);
    float _1630 = fma(_1566, _1460, _1622);
    float _1632 = fma(_1600, _1460, _1624);
    float _1634 = _1538 * _1500;
    float _1636 = _1542 * _1500;
    float _1638 = _1592 * _1500;
    float _1640 = _1594 * _1500;
    float _1642 = fma(_1536, _1492, _1634);
    float _1644 = fma(_1562, _1492, _1636);
    float _1646 = fma(_1566, _1492, _1638);
    float _1648 = fma(_1600, _1492, _1640);
    float _1650 = fma(_1598, _1522, _1632);
    float _1652 = fma(_1540, _1522, _1626);
    float _1654 = fma(_1564, _1522, _1628);
    float _1656 = fma(_1596, _1522, _1630);
    float _1658 = _1650 + _1530;
    int _1660 = _1324 * 48;
    float _1662 = fma(_1598, _1552, _1616);
    float _1664 = fma(_1540, _1552, _1610);
    float _1666 = fma(_1564, _1552, _1612);
    float _1668 = fma(_1596, _1552, _1614);
    float _1670 = _1662 + _1560;
    int _1672 = _1660 + 16;
    int _1674 = _1660 + 32;
    float _1676 = fma(_1598, _1582, _1648);
    float _1678 = fma(_1540, _1582, _1642);
    float _1680 = fma(_1564, _1582, _1644);
    float _1682 = fma(_1596, _1582, _1646);
    float _1684 = _1676 + _1590;
    int _1686 = _1660 + 48;
    uint _1688 = uint(int(uint(_1672) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1688)] = as_type<uint>(_1664);
    int _1690 = _1672 + 4;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1692)] = as_type<uint>(_1666);
    int _1694 = _1672 + 8;
    uint _1696 = uint(int(uint(_1694) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1696)] = as_type<uint>(_1668);
    int _1698 = _1672 + 12;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1700)] = as_type<uint>(_1670);
    uint _1702 = uint(int(uint(_1674) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1702)] = as_type<uint>(_1652);
    int _1704 = _1674 + 4;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1706)] = as_type<uint>(_1654);
    int _1708 = _1674 + 8;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1710)] = as_type<uint>(_1656);
    int _1712 = _1674 + 12;
    uint _1714 = uint(int(uint(_1712) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1714)] = as_type<uint>(_1658);
    uint _1716 = uint(int(uint(_1686) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1716)] = as_type<uint>(_1678);
    int _1718 = _1686 + 4;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1720)] = as_type<uint>(_1680);
    int _1722 = _1686 + 8;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1724)] = as_type<uint>(_1682);
    int _1726 = _1686 + 12;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1728)] = as_type<uint>(_1684);
}

