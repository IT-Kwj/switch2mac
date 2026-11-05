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
int _58(thread const int& _4390, thread const int& _4391, constant _10& support_buffer)
{
    int _4394 = 1 + _4391;
    float _4396 = support_buffer._m5[_4394].x;
    bool _4398 = _4396 == 1.0;
    if (_4398)
    {
        return _4390;
    }
    float _4400 = float(_4390);
    float _4402 = _4400 * _4396;
    int _4404 = int(_4402);
    return _4404;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4078, thread const int& _4079, thread const int& _4080, thread const int& _4081, thread int& _4082, thread int& _4083, thread int& _4084, thread int& _4085, thread int& _4086, thread int& _4087)
{
    float _4090 = as_type<float>(_4079) + 0.0;
    bool _4092 = _4090 != 0.0;
    bool _4094 = isnan(_4090);
    bool _4096 = _4092 || _4094;
    bool _4098 = isnan(0.0);
    bool _4100 = _4096 || _4098;
    int _4102 = as_type<int>(_4090);
    int _4104 = _4079;
    int _4106 = _4080;
    int _4108 = _4100 ? (-1) : 0;
    if (!_4100)
    {
        float _4110 = as_type<float>(_4079) * 1.0;
        _4102 = as_type<int>(_4110);
    }
    int _4112 = _4102;
    bool _4114 = !_4100;
    int _4116 = _4112;
    if (!_4114)
    {
        float _4118 = as_type<float>(_4079) + 0.0;
        bool _4120 = _4118 >= 0.0;
        bool _4122 = isnan(_4118);
        bool _4124 = _4120 || _4122;
        bool _4126 = isnan(0.0);
        bool _4128 = _4124 || _4126;
        int _4130 = as_type<int>(_4118);
        _4108 = _4128 ? (-1) : 0;
        if (!_4128)
        {
            _4130 = 2147483647;
        }
        int _4132 = _4130;
        bool _4134 = !_4128;
        _4116 = _4132;
        if (!_4134)
        {
            float _4136 = as_type<float>(_4079) + 0.0;
            bool _4138 = _4136 > as_type<float>(0x7f800000u /* inf */);
            bool _4140 = isnan(_4136);
            bool _4142 = _4138 || _4140;
            bool _4144 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4146 = _4142 || _4144;
            int _4148 = as_type<int>(_4136);
            _4108 = _4146 ? (-1) : 0;
            if (_4146)
            {
                float _4150 = as_type<float>(_4079) + 1.0;
                _4148 = as_type<int>(_4150);
            }
            int _4152 = _4148;
            _4116 = _4152;
            if (!_4146)
            {
                float _4154 = 0.0 + as_type<float>(_4079);
                bool _4156 = _4154 != as_type<float>(0x7f800000u /* inf */);
                bool _4158 = isnan(_4154);
                bool _4160 = _4156 || _4158;
                bool _4162 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4164 = _4160 || _4162;
                int _4166 = as_type<int>(_4154);
                _4108 = _4164 ? (-1) : 0;
                if (!_4164)
                {
                    _4166 = _4079;
                }
                int _4168 = _4166;
                bool _4170 = !_4164;
                _4116 = _4168;
                if (!_4170)
                {
                    float _4172 = as_type<float>(_4079) * 18446744073709551616.0;
                    float _4174 = rsqrt(_4172);
                    float _4176 = _4172 * _4174;
                    float _4178 = _4174 * 0.5;
                    float _4180 = -_4176;
                    float _4182 = 0.0 + _4180;
                    float _4184 = fma(_4178, _4182, 0.5);
                    float _4186 = fma(_4176, _4184, _4176);
                    float _4188 = -_4186;
                    float _4190 = 0.0 + _4188;
                    float _4192 = fma(_4186, _4190, _4172);
                    float _4194 = fma(_4178, _4192, _4186);
                    float _4196 = _4194 * 2.3283064365386962890625e-10;
                    _4116 = as_type<int>(_4196);
                    _4104 = as_type<int>(_4182);
                    _4106 = as_type<int>(_4186);
                }
            }
        }
    }
    int _4198 = _4116;
    int _4200 = _4104;
    int _4202 = _4106;
    int _4204 = _4108;
    _4082 = _4198;
    _4083 = _4081;
    _4084 = 0;
    _4085 = _4200;
    _4086 = _4202;
    _4087 = _4204;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4425, thread const int& _4426, thread const int& _4427, thread int& _4428, thread uint& gl_SubgroupInvocationID)
{
    int _4431 = _4427 & 31;
    uint _4433 = uint(int(uint(_4427) >> uint(8)));
    int _4435 = int(_4433) & 31;
    float _4437 = as_type<float>(gl_SubgroupInvocationID);
    int _4439 = as_type<int>(_4437) & _4435;
    int _4441 = ~_4435;
    int _4443 = _4431 & _4441;
    int _4445 = _4443 | _4439;
    int _4447 = ~_4435;
    int _4449 = _4426 & _4447;
    int _4451 = _4449 | _4439;
    bool _4453 = uint(_4451) <= uint(_4445);
    _4428 = _4453 ? (-1) : 0;
    float _4455 = spvSubgroupShuffle(as_type<float>(_4425), uint(_4451));
    uint _4457 = uint(_4453 ? as_type<int>(_4455) : _4425);
    return int(_4457);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _786 = false;
    bool _484 = false;
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
        int3 _1929 = int3(_183, _189, as_type<int>(_151));
        float4 _192 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1929.xy), uint(_1929.z), 0).xyzw;
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
        int3 _1961 = int3(_220, _226, 0);
        float3 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1961.xy), uint(_1961.z), 0).xyz;
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
        int3 _1992 = int3(_254, _260, as_type<int>(_167));
        float3 _262 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1992.xy), uint(_1992.z), 0).xyz;
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
        int3 _2021 = int3(_288, _294, as_type<int>(_169));
        float4 _296 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2021.xy), uint(_2021.z), 0).xyzw;
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
        _350 = _270;
        _340 = _272;
        _358 = _274;
    }
    float _376 = _366;
    float _378 = _368;
    float _380 = _326;
    float _382 = _374;
    float _384 = _328;
    float _386 = _338;
    float _388 = _348;
    float _390 = _350;
    float _392 = _340;
    float _394 = _358;
    bool _396 = !_127;
    float _398 = _384;
    float _400 = _386;
    float _402 = _394;
    float _404 = _392;
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
        float _406 = _204 * _376;
        float _408 = fma(_202, _378, _406);
        float _410 = fma(_206, _380, _408);
        float _412 = fma(_208, _382, _410);
        float _414 = precise::max(_412, -1.0);
        float _416 = precise::min(_414, 1.0);
        bool _418 = _416 >= 0.0;
        bool _420 = isnan(_416);
        bool _422 = _418 || _420;
        bool _424 = isnan(0.0);
        bool _426 = _422 || _424;
        bool _428 = !_426;
        float _430 = -_416;
        float _432 = _428 ? _430 : _416;
        bool _434 = _432 < 0.0;
        float _436 = float(_434);
        float _438 = abs(_432);
        float _440 = -_438;
        float _442 = _440 + 1.0;
        float _444 = abs(_432);
        float _446 = fma(_444, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _448 = as_type<int>(_442) + (-218103808);
        float _450 = abs(_432);
        float _452 = fma(_450, _446, -0.212114393711090087890625);
        bool _454 = uint(_448) >= 1920991232u;
        float _456 = abs(_432);
        float _458 = fma(_456, _452, 1.570728778839111328125);
        bool _460 = !_454;
        float _482;
        if (!_460)
        {
            int _462 = _448;
            int _464 = as_type<int>(_442);
            int _466 = _312;
            int _468 = 1072;
            int _470;
            int _472;
            int _474;
            int _476;
            int _478;
            int _480;
            _56(_462, _464, _466, _468, _470, _472, _474, _476, _478, _480);
            _482 = as_type<float>(_470);
            _484 = true;
        }
        else
        {
            float _486 = rsqrt(_442);
            float _488 = _442 * _486;
            float _490 = _486 * 0.5;
            float _492 = -_488;
            float _494 = 0.0 + _492;
            float _496 = fma(_490, _494, 0.5);
            float _498 = fma(_488, _496, _488);
            float _500 = -_498;
            float _502 = 0.0 + _500;
            float _504 = fma(_498, _502, _442);
            float _506 = fma(_490, _504, _498);
            _482 = _506;
        }
        _484 = false;
        float _508 = _482;
        int _510 = _103 + 8;
        uint _512 = uint(int(uint(_510) >> uint(2)));
        uint _514 = uint(int(uint(int(_512)) >> uint(2)));
        int _516 = int(_512) & 3;
        float _518 = (*spvDescriptorSet0.cp_c5)._m0[int(_514)][_516];
        int _520 = _70;
        int _522 = 0;
        int _524 = _58(_520, _522, (*spvDescriptorSet0.support_buffer));
        int _526 = as_type<int>(_518);
        int _528 = 0;
        int _530 = _58(_526, _528, (*spvDescriptorSet0.support_buffer));
        int3 _2274 = int3(_524, _530, 0);
        float3 _532 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2274.xy), uint(_2274.z), 0).xyz;
        float _534 = _532.x;
        float _536 = _532.y;
        float _538 = _532.z;
        int _540 = _70;
        int _542 = 0;
        int _544 = _58(_540, _542, (*spvDescriptorSet0.support_buffer));
        int _546 = as_type<int>(_518);
        int _548 = 0;
        int _550 = _58(_546, _548, (*spvDescriptorSet0.support_buffer));
        int3 _2292 = int3(_544, _550, 2);
        float3 _552 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2292.xy), uint(_2292.z), 0).xyz;
        float _554 = _552.x;
        float _556 = _552.y;
        float _558 = _552.z;
        float _560 = _458 * _508;
        float _562 = _436 * 2.0;
        float _564 = -_562;
        float _566 = fma(_560, _564, _560);
        float _568 = fma(_436, 3.1415927410125732421875, _566);
        float _570 = _568 * 0.15915493667125701904296875;
        float _572 = _570 * 6.283185482025146484375;
        float _574 = sin(_572);
        float _576 = abs(_574);
        bool _578 = _576 >= 0.001000000047497451305389404296875;
        bool _580 = isnan(_576);
        bool _582 = _578 || _580;
        bool _584 = isnan(0.001000000047497451305389404296875);
        bool _586 = _582 || _584;
        float _588 = _436;
        float _590 = _562;
        float _592 = _566;
        if (!_586)
        {
            int _594 = _103 + 28;
            uint _596 = uint(int(uint(_594) >> uint(2)));
            uint _598 = uint(int(uint(int(_596)) >> uint(2)));
            int _600 = int(_596) & 3;
            float _602 = (*spvDescriptorSet0.cp_c5)._m0[int(_598)][_600];
            _588 = _602;
        }
        float _604 = _588;
        float _606 = _604;
        if (!_586)
        {
            float _608 = -_604;
            float _610 = _608 + 1.0;
            _590 = _610;
        }
        float _612 = _590;
        float _614 = _612;
        if (!_586)
        {
            _592 = _604;
        }
        float _616 = _592;
        bool _618 = !_586;
        float _620 = _616;
        if (!_618)
        {
            int _622 = _103 + 28;
            uint _624 = uint(int(uint(_622) >> uint(2)));
            uint _626 = uint(int(uint(int(_624)) >> uint(2)));
            int _628 = int(_624) & 3;
            float _630 = (*spvDescriptorSet0.cp_c5)._m0[int(_626)][_628];
            float _632 = 1.0 / _574;
            float _634 = _568 * _630;
            float _636 = _634 * 0.15915493667125701904296875;
            float _638 = -_634;
            float _640 = _568 + _638;
            float _642 = _640 * 0.15915493667125701904296875;
            float _644 = _636 * 6.283185482025146484375;
            float _646 = sin(_644);
            float _648 = _642 * 6.283185482025146484375;
            float _650 = sin(_648);
            float _652 = _646 * _632;
            float _654 = _650 * _632;
            _620 = _652;
            _606 = _630;
            _614 = _654;
        }
        float _656 = _620;
        float _658 = _606;
        float _660 = _614;
        bool _662 = !_426;
        float _664 = -_656;
        float _666 = _662 ? _664 : _656;
        int _668 = _103 + 20;
        uint _670 = uint(int(uint(_668) >> uint(2)));
        uint _672 = uint(int(uint(int(_670)) >> uint(2)));
        int _674 = int(_670) & 3;
        float _676 = (*spvDescriptorSet0.cp_c5)._m0[int(_672)][_674];
        float _678 = _536 * _658;
        float _680 = _538 * _658;
        float _682 = _208 * _666;
        float _684 = _202 * _666;
        float _686 = _206 * _666;
        float _688 = _204 * _666;
        float _690 = fma(_382, _660, _682);
        float _692 = fma(_378, _660, _684);
        float _694 = fma(_380, _660, _686);
        float _696 = fma(_376, _660, _688);
        float _698 = _690 * 2.0;
        float _700 = _692 * 2.0;
        float _702 = _692 * _692;
        float _704 = _696 * _696;
        float _706 = _694 * _698;
        float _708 = _696 * _698;
        float _710 = _692 * _698;
        float _712 = _696 * 2.0;
        float _714 = -_706;
        float _716 = fma(_696, _700, _714);
        float _718 = fma(_696, _700, _706);
        float _720 = _694 * _694;
        float _722 = fma(_702, -2.0, 1.0);
        float _724 = fma(_704, -2.0, 1.0);
        float _726 = fma(_694, _700, _708);
        float _728 = -_708;
        float _730 = fma(_694, _700, _728);
        float _732 = -_710;
        float _734 = fma(_694, _712, _732);
        float _736 = fma(_694, _712, _710);
        float _738 = _534 * _658;
        float _740 = fma(_720, -2.0, _724);
        float _742 = fma(_720, -2.0, _722);
        float _744 = _554 * _658;
        float _746 = _556 * _658;
        float _748 = _558 * _658;
        float _750 = fma(_704, -2.0, _722);
        float _752 = fma(_384, _676, _738);
        float _754 = fma(_386, _676, _678);
        float _756 = fma(_388, _676, _680);
        float _758 = fma(_390, _676, _744);
        float _760 = fma(_392, _676, _746);
        float _762 = fma(_394, _676, _748);
        _398 = _752;
        _764 = _740;
        _766 = _718;
        _768 = _730;
        _400 = _754;
        _770 = _716;
        _772 = _742;
        _774 = _736;
        _776 = _756;
        _778 = _726;
        _780 = _734;
        _782 = _750;
        _402 = _762;
        _404 = _760;
        _784 = _758;
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
        float _802 = -_794;
        float _804 = fma(_790, _376, _802);
        float _806 = fma(_790, _376, _794);
        float _808 = _376 * 2.0;
        float _810 = _380 * _380;
        float _812 = fma(_792, -2.0, 1.0);
        float _814 = fma(_796, -2.0, 1.0);
        float _816 = fma(_790, _380, _800);
        float _818 = -_800;
        float _820 = fma(_790, _380, _818);
        float _822 = -_798;
        float _824 = fma(_808, _380, _822);
        float _826 = fma(_808, _380, _798);
        float _828 = fma(_810, -2.0, _812);
        float _830 = fma(_810, -2.0, _814);
        float _832 = fma(_792, -2.0, _814);
        _764 = _828;
        _766 = _806;
        _768 = _820;
        _770 = _804;
        _772 = _830;
        _774 = _826;
        _776 = _388;
        _778 = _816;
        _780 = _824;
        _782 = _832;
        _784 = _390;
    }
    _786 = false;
    float _834 = _398;
    float _836 = _764;
    float _838 = _766;
    float _840 = _768;
    float _842 = _400;
    float _844 = _770;
    float _846 = _772;
    float _848 = _774;
    float _850 = _776;
    float _852 = _778;
    float _854 = _780;
    float _856 = _782;
    float _858 = _402;
    float _860 = _404;
    float _862 = _784;
    bool _864 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _866 = _834 * _836;
    float _868 = _834 * _838;
    float _870 = _834 * _840;
    float _872 = _842 * _844;
    float _874 = _842 * _846;
    float _876 = _842 * _848;
    float _878 = _850 * _852;
    float _880 = _850 * _854;
    float _882 = _850 * _856;
    int _884 = _70 * 112;
    bool _886 = !_864;
    float _888 = _866;
    float _890 = _872;
    float _892 = _878;
    float _894 = _862;
    float _896 = _868;
    float _898 = _874;
    float _900 = _880;
    float _902 = _860;
    float _904 = _870;
    float _906 = _876;
    float _908 = _882;
    float _910 = _858;
    if (!_886)
    {
        int _912 = 0;
        float _914 = _866;
        float _916 = _872;
        float _918 = _878;
        float _920 = _862;
        float _922 = _868;
        float _924 = _874;
        float _926 = _880;
        float _928 = _860;
        float _930 = _870;
        float _932 = _876;
        float _934 = _882;
        float _936 = _858;
        bool _938;
        int _986;
        int _996;
        int _1006;
        int _1016;
        int _1026;
        int _1036;
        int _1046;
        int _1056;
        int _1066;
        int _1076;
        int _1086;
        int _1096;
        float _1204;
        float _1206;
        float _1208;
        int _1210;
        float _1212;
        int _1214;
        int _1216;
        int _1218;
        int _1220;
        float _1222;
        float _1224;
        float _1226;
        do
        {
            int _940 = _912;
            float _942 = _914;
            float _944 = _916;
            float _946 = _918;
            int _948 = as_type<int>(_920);
            float _950 = _922;
            int _952 = as_type<int>(_924);
            int _954 = as_type<int>(_926);
            int _956 = as_type<int>(_928);
            int _958 = as_type<int>(_930);
            float _960 = _932;
            float _962 = _934;
            float _964 = _936;
            uint _966 = uint(int(uint(_884) >> uint(2)));
            uint _968 = uint(int(uint(int(_966)) >> uint(2)));
            int _970 = int(_966) & 3;
            float _972 = (*spvDescriptorSet0.cp_c6)._m0[int(_968)][_970];
            bool _974 = _70 != 0;
            int _976 = _940 + 1;
            bool _978 = uint(_976) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _980 = as_type<int>(_942);
            int _982 = as_type<int>(_972);
            int _984 = 31;
            int _2829 = _60(_980, _982, _984, _986, gl_SubgroupInvocationID);
            int _988 = _2829;
            int _990 = as_type<int>(_944);
            int _992 = as_type<int>(_972);
            int _994 = 31;
            int _2834 = _60(_990, _992, _994, _996, gl_SubgroupInvocationID);
            int _998 = _2834;
            int _1000 = as_type<int>(_946);
            int _1002 = as_type<int>(_972);
            int _1004 = 31;
            int _2839 = _60(_1000, _1002, _1004, _1006, gl_SubgroupInvocationID);
            int _1008 = _2839;
            int _1010 = _948;
            int _1012 = as_type<int>(_972);
            int _1014 = 31;
            int _2843 = _60(_1010, _1012, _1014, _1016, gl_SubgroupInvocationID);
            int _1018 = _2843;
            int _1020 = as_type<int>(_950);
            int _1022 = as_type<int>(_972);
            int _1024 = 31;
            int _2848 = _60(_1020, _1022, _1024, _1026, gl_SubgroupInvocationID);
            int _1028 = _2848;
            int _1030 = _952;
            int _1032 = as_type<int>(_972);
            int _1034 = 31;
            int _2852 = _60(_1030, _1032, _1034, _1036, gl_SubgroupInvocationID);
            int _1038 = _2852;
            int _1040 = _954;
            int _1042 = as_type<int>(_972);
            int _1044 = 31;
            int _2856 = _60(_1040, _1042, _1044, _1046, gl_SubgroupInvocationID);
            int _1048 = _2856;
            int _1050 = _956;
            int _1052 = as_type<int>(_972);
            int _1054 = 31;
            int _2860 = _60(_1050, _1052, _1054, _1056, gl_SubgroupInvocationID);
            int _1058 = _2860;
            int _1060 = _958;
            int _1062 = as_type<int>(_972);
            int _1064 = 31;
            int _2864 = _60(_1060, _1062, _1064, _1066, gl_SubgroupInvocationID);
            int _1068 = _2864;
            int _1070 = as_type<int>(_960);
            int _1072 = as_type<int>(_972);
            int _1074 = 31;
            int _2869 = _60(_1070, _1072, _1074, _1076, gl_SubgroupInvocationID);
            int _1078 = _2869;
            int _1080 = as_type<int>(_962);
            int _1082 = as_type<int>(_972);
            int _1084 = 31;
            int _2874 = _60(_1080, _1082, _1084, _1086, gl_SubgroupInvocationID);
            int _1088 = _2874;
            int _1090 = as_type<int>(_964);
            int _1092 = as_type<int>(_972);
            int _1094 = 31;
            int _2879 = _60(_1090, _1092, _1094, _1096, gl_SubgroupInvocationID);
            int _1098 = _2879;
            bool _1100 = !_974;
            _912 = _976;
            float _1102 = _942;
            float _1104 = _944;
            float _1106 = _946;
            int _1108 = _948;
            float _1110 = _950;
            int _1112 = _952;
            int _1114 = _954;
            int _1116 = _956;
            int _1118 = _958;
            float _1120 = _960;
            float _1122 = _962;
            float _1124 = _964;
            if (!_1100)
            {
                float _1126 = as_type<float>(_998) * _860;
                float _1128 = _868 * as_type<float>(_998);
                float _1130 = _874 * as_type<float>(_998);
                float _1132 = _880 * as_type<float>(_998);
                float _1134 = fma(as_type<float>(_988), _862, _1126);
                float _1136 = _868 * as_type<float>(_1038);
                float _1138 = _874 * as_type<float>(_1038);
                float _1140 = _880 * as_type<float>(_1038);
                float _1142 = as_type<float>(_1038) * _860;
                float _1144 = fma(_866, as_type<float>(_988), _1128);
                float _1146 = fma(_872, as_type<float>(_988), _1130);
                float _1148 = fma(_878, as_type<float>(_988), _1132);
                float _1150 = fma(_866, as_type<float>(_1028), _1136);
                float _1152 = fma(_872, as_type<float>(_1028), _1138);
                float _1154 = fma(_878, as_type<float>(_1028), _1140);
                float _1156 = _868 * as_type<float>(_1078);
                float _1158 = as_type<float>(_1078) * _860;
                float _1160 = fma(as_type<float>(_1028), _862, _1142);
                float _1162 = _880 * as_type<float>(_1078);
                float _1164 = _874 * as_type<float>(_1078);
                float _1166 = fma(_866, as_type<float>(_1068), _1156);
                float _1168 = fma(as_type<float>(_1068), _862, _1158);
                float _1170 = fma(_878, as_type<float>(_1068), _1162);
                float _1172 = fma(_882, as_type<float>(_1008), _1148);
                float _1174 = fma(_872, as_type<float>(_1068), _1164);
                float _1176 = fma(_870, as_type<float>(_1008), _1144);
                float _1178 = fma(_876, as_type<float>(_1008), _1146);
                float _1180 = fma(_876, as_type<float>(_1048), _1152);
                float _1182 = fma(as_type<float>(_1008), _858, _1134);
                float _1184 = fma(_870, as_type<float>(_1048), _1150);
                float _1186 = fma(_882, as_type<float>(_1048), _1154);
                float _1188 = fma(as_type<float>(_1048), _858, _1160);
                float _1190 = fma(as_type<float>(_1088), _858, _1168);
                float _1192 = fma(_876, as_type<float>(_1088), _1174);
                float _1194 = fma(_870, as_type<float>(_1088), _1166);
                float _1196 = fma(_882, as_type<float>(_1088), _1170);
                float _1198 = as_type<float>(_1018) + _1182;
                float _1200 = as_type<float>(_1058) + _1188;
                float _1202 = as_type<float>(_1098) + _1190;
                _1102 = _1176;
                _1104 = _1178;
                _1106 = _1172;
                _1108 = as_type<int>(_1198);
                _1110 = _1184;
                _1112 = as_type<int>(_1180);
                _1114 = as_type<int>(_1186);
                _1116 = as_type<int>(_1200);
                _1118 = as_type<int>(_1194);
                _1120 = _1192;
                _1122 = _1196;
                _1124 = _1202;
            }
            _1204 = _1102;
            _1206 = _1104;
            _1208 = _1106;
            _1210 = _1108;
            _1212 = _1110;
            _1214 = _1112;
            _1216 = _1114;
            _1218 = _1116;
            _1220 = _1118;
            _1222 = _1120;
            _1224 = _1122;
            _1226 = _1124;
            _938 = !_978;
            _914 = _1204;
            _916 = _1206;
            _918 = _1208;
            _920 = as_type<float>(_1210);
            _922 = _1212;
            _924 = as_type<float>(_1214);
            _926 = as_type<float>(_1216);
            _928 = as_type<float>(_1218);
            _930 = as_type<float>(_1220);
            _932 = _1222;
            _934 = _1224;
            _936 = _1226;
        } while (_938);
        _888 = _1204;
        _890 = _1206;
        _892 = _1208;
        _894 = as_type<float>(_1210);
        _896 = _1212;
        _898 = as_type<float>(_1214);
        _900 = as_type<float>(_1216);
        _902 = as_type<float>(_1218);
        _904 = as_type<float>(_1220);
        _906 = _1222;
        _908 = _1224;
        _910 = _1226;
    }
    float _1228 = _888;
    float _1230 = _890;
    float _1232 = _892;
    float _1234 = _894;
    float _1236 = _896;
    float _1238 = _898;
    float _1240 = _900;
    float _1242 = _902;
    float _1244 = _904;
    float _1246 = _906;
    float _1248 = _908;
    float _1250 = _910;
    int _1252 = _884 + 80;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    uint _1256 = uint(int(uint(int(_1254)) >> uint(2)));
    int _1258 = int(_1254) & 3;
    float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
    int _1262 = int(_1254) + 1;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    int _1266 = _1262 & 3;
    float _1268 = (*spvDescriptorSet0.cp_c6)._m0[int(_1264)][_1266];
    bool _1270 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1272 = _884 + 64;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.cp_c6)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.cp_c6)._m0[int(_1284)][_1286];
    int _1290 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1292 = _1290 + _70;
    int _1294 = _884 + 88;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.cp_c6)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.cp_c6)._m0[int(_1306)][_1308];
    int _1312 = _884 + 72;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.cp_c6)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.cp_c6)._m0[int(_1324)][_1326];
    int _1330 = _884 + 96;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
    int _1348 = _884 + 104;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.cp_c6)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.cp_c6)._m0[int(_1360)][_1362];
    int _1366 = _884 + 16;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.cp_c6)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.cp_c6)._m0[int(_1378)][_1380];
    if (!_1270)
    {
        int _1384 = _70 * 48;
        int _1386 = _1384 + 16;
        uint _1388 = uint(int(uint(_1384) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1388)] = as_type<uint>(_1228);
        int _1390 = _1384 + 4;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1392)] = as_type<uint>(_1230);
        int _1394 = _1384 + 8;
        uint _1396 = uint(int(uint(_1394) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1396)] = as_type<uint>(_1232);
        int _1398 = _1384 + 12;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1400)] = as_type<uint>(_1234);
        int _1402 = _1384 + 32;
        uint _1404 = uint(int(uint(_1386) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1404)] = as_type<uint>(_1236);
        int _1406 = _1386 + 4;
        uint _1408 = uint(int(uint(_1406) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1408)] = as_type<uint>(_1238);
        int _1410 = _1386 + 8;
        uint _1412 = uint(int(uint(_1410) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1412)] = as_type<uint>(_1240);
        int _1414 = _1386 + 12;
        uint _1416 = uint(int(uint(_1414) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1416)] = as_type<uint>(_1242);
        uint _1418 = uint(int(uint(_1402) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1418)] = as_type<uint>(_1244);
        int _1420 = _1402 + 4;
        uint _1422 = uint(int(uint(_1420) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1422)] = as_type<uint>(_1246);
        int _1424 = _1402 + 8;
        uint _1426 = uint(int(uint(_1424) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1426)] = as_type<uint>(_1248);
        int _1428 = _1402 + 12;
        uint _1430 = uint(int(uint(_1428) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1430)] = as_type<uint>(_1250);
    }
    float _1432 = _1246 * _1260;
    float _1434 = _1230 * _1260;
    float _1436 = _1238 * _1260;
    int _1438 = _884 + 32;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
    int _1444 = int(_1440) & 3;
    float _1446 = (*spvDescriptorSet0.cp_c6)._m0[int(_1442)][_1444];
    int _1448 = int(_1440) + 1;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    int _1452 = _1448 & 3;
    float _1454 = (*spvDescriptorSet0.cp_c6)._m0[int(_1450)][_1452];
    float _1456 = fma(_1244, _1280, _1432);
    float _1458 = _1230 * _1268;
    float _1460 = fma(_1228, _1280, _1434);
    float _1462 = fma(_1236, _1280, _1436);
    float _1464 = _1238 * _1268;
    float _1466 = fma(_1228, _1288, _1458);
    float _1468 = _1230 * _1302;
    float _1470 = _1230 * _1310;
    float _1472 = _1246 * _1268;
    int _1474 = _884 + 48;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
    int _1480 = int(_1476) & 3;
    float _1482 = (*spvDescriptorSet0.cp_c6)._m0[int(_1478)][_1480];
    int _1484 = int(_1476) + 1;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    int _1488 = _1484 & 3;
    float _1490 = (*spvDescriptorSet0.cp_c6)._m0[int(_1486)][_1488];
    float _1492 = _1238 * _1302;
    float _1494 = _1238 * _1310;
    float _1496 = fma(_1236, _1288, _1464);
    float _1498 = fma(_1244, _1288, _1472);
    float _1500 = _1246 * _1302;
    float _1502 = _1246 * _1310;
    float _1504 = fma(_1228, _1320, _1468);
    float _1506 = fma(_1228, _1328, _1470);
    float _1508 = fma(_1236, _1320, _1492);
    int _1510 = _884 + 24;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.cp_c6)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.cp_c6)._m0[int(_1522)][_1524];
    float _1528 = fma(_1236, _1328, _1494);
    float _1530 = fma(_1244, _1328, _1502);
    float _1532 = fma(_1244, _1320, _1500);
    float _1534 = fma(_1232, _1338, _1460);
    float _1536 = fma(_1240, _1364, _1528);
    float _1538 = fma(_1240, _1338, _1462);
    float _1540 = fma(_1248, _1338, _1456);
    int _1542 = _884 + 40;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.cp_c6)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.cp_c6)._m0[int(_1554)][_1556];
    float _1560 = fma(_1232, _1346, _1466);
    float _1562 = fma(_1232, _1356, _1504);
    float _1564 = fma(_1232, _1364, _1506);
    float _1566 = fma(_1240, _1346, _1496);
    float _1568 = fma(_1240, _1356, _1508);
    float _1570 = fma(_1248, _1364, _1530);
    float _1572 = _1536 + _1242;
    int _1574 = _884 + 56;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.cp_c6)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.cp_c6)._m0[int(_1586)][_1588];
    float _1592 = fma(_1248, _1346, _1498);
    float _1594 = fma(_1248, _1356, _1532);
    float _1596 = _1570 + _1250;
    float _1598 = _1564 + _1234;
    float _1600 = _1538 * _1382;
    float _1602 = _1566 * _1382;
    float _1604 = _1568 * _1382;
    float _1606 = _1572 * _1382;
    float _1608 = fma(_1534, _1374, _1600);
    float _1610 = fma(_1560, _1374, _1602);
    float _1612 = fma(_1562, _1374, _1604);
    float _1614 = fma(_1598, _1374, _1606);
    float _1616 = _1572 * _1454;
    float _1618 = _1538 * _1454;
    float _1620 = _1566 * _1454;
    float _1622 = _1568 * _1454;
    float _1624 = fma(_1598, _1446, _1616);
    float _1626 = fma(_1534, _1446, _1618);
    float _1628 = fma(_1560, _1446, _1620);
    float _1630 = fma(_1562, _1446, _1622);
    int _1632 = _1292 * 48;
    float _1634 = _1572 * _1490;
    float _1636 = _1538 * _1490;
    float _1638 = _1566 * _1490;
    float _1640 = _1568 * _1490;
    float _1642 = fma(_1598, _1482, _1634);
    float _1644 = fma(_1534, _1482, _1636);
    float _1646 = fma(_1560, _1482, _1638);
    float _1648 = fma(_1562, _1482, _1640);
    float _1650 = fma(_1596, _1518, _1614);
    float _1652 = fma(_1592, _1518, _1610);
    float _1654 = fma(_1540, _1518, _1608);
    float _1656 = fma(_1594, _1518, _1612);
    float _1658 = _1650 + _1526;
    float _1660 = fma(_1596, _1550, _1624);
    float _1662 = fma(_1540, _1550, _1626);
    float _1664 = fma(_1592, _1550, _1628);
    float _1666 = fma(_1594, _1550, _1630);
    float _1668 = _1660 + _1558;
    int _1670 = _1632 + 16;
    int _1672 = _1632 + 32;
    float _1674 = fma(_1596, _1582, _1642);
    float _1676 = fma(_1540, _1582, _1644);
    float _1678 = fma(_1592, _1582, _1646);
    float _1680 = fma(_1594, _1582, _1648);
    float _1682 = _1674 + _1590;
    int _1684 = _1632 + 48;
    uint _1686 = uint(int(uint(_1670) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1686)] = as_type<uint>(_1654);
    int _1688 = _1670 + 4;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1690)] = as_type<uint>(_1652);
    int _1692 = _1670 + 8;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1694)] = as_type<uint>(_1656);
    int _1696 = _1670 + 12;
    uint _1698 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1698)] = as_type<uint>(_1658);
    uint _1700 = uint(int(uint(_1672) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1700)] = as_type<uint>(_1662);
    int _1702 = _1672 + 4;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1704)] = as_type<uint>(_1664);
    int _1706 = _1672 + 8;
    uint _1708 = uint(int(uint(_1706) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1708)] = as_type<uint>(_1666);
    int _1710 = _1672 + 12;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1712)] = as_type<uint>(_1668);
    uint _1714 = uint(int(uint(_1684) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1714)] = as_type<uint>(_1676);
    int _1716 = _1684 + 4;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1718)] = as_type<uint>(_1678);
    int _1720 = _1684 + 8;
    uint _1722 = uint(int(uint(_1720) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1722)] = as_type<uint>(_1680);
    int _1724 = _1684 + 12;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1726)] = as_type<uint>(_1682);
}

