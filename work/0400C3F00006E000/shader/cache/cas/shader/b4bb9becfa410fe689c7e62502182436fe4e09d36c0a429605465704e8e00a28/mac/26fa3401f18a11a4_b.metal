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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4225, thread const int& _4226, constant _10& support_buffer)
{
    int _4229 = 1 + _4226;
    float _4231 = support_buffer._m5[_4229].x;
    bool _4233 = _4231 == 1.0;
    if (_4233)
    {
        return _4225;
    }
    float _4235 = float(_4225);
    float _4237 = _4235 * _4231;
    int _4239 = int(_4237);
    return _4239;
}

static inline __attribute__((always_inline))
void _54(thread const int& _3913, thread const int& _3914, thread const int& _3915, thread const int& _3916, thread int& _3917, thread int& _3918, thread int& _3919, thread int& _3920, thread int& _3921, thread int& _3922)
{
    float _3925 = as_type<float>(_3914) + 0.0;
    bool _3927 = _3925 != 0.0;
    bool _3929 = isnan(_3925);
    bool _3931 = _3927 || _3929;
    bool _3933 = isnan(0.0);
    bool _3935 = _3931 || _3933;
    int _3937 = as_type<int>(_3925);
    int _3939 = _3914;
    int _3941 = _3915;
    int _3943 = _3935 ? (-1) : 0;
    if (!_3935)
    {
        float _3945 = as_type<float>(_3914) * 1.0;
        _3937 = as_type<int>(_3945);
    }
    int _3947 = _3937;
    bool _3949 = !_3935;
    int _3951 = _3947;
    if (!_3949)
    {
        float _3953 = as_type<float>(_3914) + 0.0;
        bool _3955 = _3953 >= 0.0;
        bool _3957 = isnan(_3953);
        bool _3959 = _3955 || _3957;
        bool _3961 = isnan(0.0);
        bool _3963 = _3959 || _3961;
        int _3965 = as_type<int>(_3953);
        _3943 = _3963 ? (-1) : 0;
        if (!_3963)
        {
            _3965 = 2147483647;
        }
        int _3967 = _3965;
        bool _3969 = !_3963;
        _3951 = _3967;
        if (!_3969)
        {
            float _3971 = as_type<float>(_3914) + 0.0;
            bool _3973 = _3971 > as_type<float>(0x7f800000u /* inf */);
            bool _3975 = isnan(_3971);
            bool _3977 = _3973 || _3975;
            bool _3979 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3981 = _3977 || _3979;
            int _3983 = as_type<int>(_3971);
            _3943 = _3981 ? (-1) : 0;
            if (_3981)
            {
                float _3985 = as_type<float>(_3914) + 1.0;
                _3983 = as_type<int>(_3985);
            }
            int _3987 = _3983;
            _3951 = _3987;
            if (!_3981)
            {
                float _3989 = 0.0 + as_type<float>(_3914);
                bool _3991 = _3989 != as_type<float>(0x7f800000u /* inf */);
                bool _3993 = isnan(_3989);
                bool _3995 = _3991 || _3993;
                bool _3997 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3999 = _3995 || _3997;
                int _4001 = as_type<int>(_3989);
                _3943 = _3999 ? (-1) : 0;
                if (!_3999)
                {
                    _4001 = _3914;
                }
                int _4003 = _4001;
                bool _4005 = !_3999;
                _3951 = _4003;
                if (!_4005)
                {
                    float _4007 = as_type<float>(_3914) * 18446744073709551616.0;
                    float _4009 = rsqrt(_4007);
                    float _4011 = _4007 * _4009;
                    float _4013 = _4009 * 0.5;
                    float _4015 = -_4011;
                    float _4017 = 0.0 + _4015;
                    float _4019 = fma(_4013, _4017, 0.5);
                    float _4021 = fma(_4011, _4019, _4011);
                    float _4023 = -_4021;
                    float _4025 = 0.0 + _4023;
                    float _4027 = fma(_4021, _4025, _4007);
                    float _4029 = fma(_4013, _4027, _4021);
                    float _4031 = _4029 * 2.3283064365386962890625e-10;
                    _3951 = as_type<int>(_4031);
                    _3939 = as_type<int>(_4017);
                    _3941 = as_type<int>(_4021);
                }
            }
        }
    }
    int _4033 = _3951;
    int _4035 = _3939;
    int _4037 = _3941;
    int _4039 = _3943;
    _3917 = _4033;
    _3918 = _3916;
    _3919 = 0;
    _3920 = _4035;
    _3921 = _4037;
    _3922 = _4039;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4260, thread const int& _4261, thread const int& _4262, thread int& _4263, thread uint& gl_SubgroupInvocationID)
{
    int _4266 = _4262 & 31;
    uint _4268 = uint(int(uint(_4262) >> uint(8)));
    int _4270 = int(_4268) & 31;
    float _4272 = as_type<float>(gl_SubgroupInvocationID);
    int _4274 = as_type<int>(_4272) & _4270;
    int _4276 = ~_4270;
    int _4278 = _4266 & _4276;
    int _4280 = _4278 | _4274;
    int _4282 = ~_4270;
    int _4284 = _4261 & _4282;
    int _4286 = _4284 | _4274;
    bool _4288 = uint(_4286) <= uint(_4280);
    _4263 = _4288 ? (-1) : 0;
    float _4290 = spvSubgroupShuffle(as_type<float>(_4260), uint(_4286));
    uint _4292 = uint(_4288 ? as_type<int>(_4290) : _4260);
    return int(_4292);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1226 = false;
    bool _784 = false;
    bool _480 = false;
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
    int _103 = _101 + 36;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 32;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    int _131 = 0;
    float _133 = _99;
    if (_125)
    {
        int _135 = _101 + 8;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        uint _139 = uint(int(uint(int(_137)) >> uint(2)));
        int _141 = int(_137) & 3;
        float _143 = (*spvDescriptorSet0.cp_c5)._m0[int(_139)][_141];
        _131 = as_type<int>(_143);
    }
    int _145 = _131;
    float _147 = 0.0;
    if (_125)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    int _151 = 0;
    if (_129)
    {
        uint _153 = uint(int(uint(_101) >> uint(2)));
        uint _155 = uint(int(uint(int(_153)) >> uint(2)));
        int _157 = int(_153) & 3;
        float _159 = (*spvDescriptorSet0.cp_c5)._m0[int(_155)][_157];
        _151 = as_type<int>(_159);
    }
    int _161 = _151;
    float _163 = 0.0;
    if (_129)
    {
        _163 = 2.8025969286496341418474591665798e-45;
    }
    float _165 = _163;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _133;
    float _169 = _149;
    float _171 = as_type<float>(_68);
    float _173 = as_type<float>(_145);
    float _175 = _111;
    if (_125)
    {
        int _177 = _68;
        int _179 = 0;
        int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _145;
        int _185 = 0;
        int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1879 = int3(_181, _187, as_type<int>(_149));
        float4 _190 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1879.xy), uint(_1879.z), 0).xyzw;
        float _192 = _190.x;
        float _194 = _190.y;
        float _196 = _190.z;
        float _198 = _190.w;
        _169 = _192;
        _171 = _194;
        _173 = _196;
        _175 = _198;
    }
    float _200 = _169;
    float _202 = _171;
    float _204 = _173;
    float _206 = _175;
    float _208 = 0.0;
    float _210 = as_type<float>(_68);
    float _212 = 0.0;
    if (_129)
    {
        int _214 = _68;
        int _216 = 1;
        int _218 = _56(_214, _216, (*spvDescriptorSet0.support_buffer));
        int _220 = _161;
        int _222 = 1;
        int _224 = _56(_220, _222, (*spvDescriptorSet0.support_buffer));
        int3 _1911 = int3(_218, _224, 0);
        float3 _228 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1911.xy), uint(_1911.z), 0).xyz;
        float _230 = _228.x;
        float _232 = _228.y;
        float _234 = _228.z;
        _208 = _230;
        _210 = _232;
        _212 = _234;
    }
    float _236 = _208;
    float _238 = _210;
    float _240 = _212;
    float _242 = _165;
    float _244 = as_type<float>(_68);
    float _246 = 0.0;
    if (_129)
    {
        int _248 = _68;
        int _250 = 1;
        int _252 = _56(_248, _250, (*spvDescriptorSet0.support_buffer));
        int _254 = _161;
        int _256 = 1;
        int _258 = _56(_254, _256, (*spvDescriptorSet0.support_buffer));
        int3 _1942 = int3(_252, _258, as_type<int>(_165));
        float3 _260 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1942.xy), uint(_1942.z), 0).xyz;
        float _262 = _260.x;
        float _264 = _260.y;
        float _266 = _260.z;
        _242 = _262;
        _244 = _264;
        _246 = _266;
    }
    float _268 = _242;
    float _270 = _244;
    float _272 = _246;
    float _274 = 0.0;
    float _276 = _121;
    float _278 = 0.0;
    int _280 = 0;
    if (_129)
    {
        int _282 = _68;
        int _284 = 1;
        int _286 = _56(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = _161;
        int _290 = 1;
        int _292 = _56(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _1971 = int3(_286, _292, as_type<int>(_167));
        float4 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1971.xy), uint(_1971.z), 0).xyzw;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float _302 = _294.w;
        _274 = _296;
        _276 = _298;
        _278 = _300;
        _280 = as_type<int>(_302);
    }
    float _304 = _274;
    float _306 = _276;
    float _308 = _278;
    int _310 = _280;
    float _312 = 0.0;
    float _314 = 0.0;
    if (!_129)
    {
        _312 = 0.0;
        _314 = 0.0;
    }
    float _316 = _312;
    float _318 = _314;
    float _320 = 0.0;
    float _322 = 0.0;
    float _324 = _316;
    float _326 = _318;
    if (!_129)
    {
        _320 = 0.0;
        _322 = 0.0;
    }
    float _328 = _320;
    float _330 = _322;
    float _332 = 0.0;
    float _334 = 0.0;
    float _336 = _328;
    float _338 = _330;
    if (!_129)
    {
        _332 = 0.0;
        _334 = 0.0;
    }
    float _340 = _332;
    float _342 = _334;
    float _344 = 0.0;
    float _346 = 0.0;
    float _348 = _340;
    float _350 = _342;
    if (!_129)
    {
        _344 = 0.0;
        _346 = 0.0;
    }
    float _352 = _344;
    float _354 = _346;
    float _356 = 0.0;
    float _358 = _352;
    float _360 = _354;
    if (!_129)
    {
        _356 = 0.0;
    }
    float _362 = _356;
    float _364 = 0.0;
    float _366 = _362;
    if (!_129)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    bool _370 = !_129;
    float _372 = _368;
    if (!_370)
    {
        _358 = _306;
        _360 = _304;
        _366 = _308;
        _372 = as_type<float>(_310);
        _324 = _238;
        _326 = _236;
        _348 = _270;
        _336 = _240;
        _338 = _268;
        _350 = _272;
    }
    float _374 = _358;
    float _376 = _360;
    float _378 = _366;
    float _380 = _372;
    float _382 = _324;
    float _384 = _326;
    float _386 = _348;
    float _388 = _336;
    float _390 = _338;
    float _392 = _350;
    bool _394 = !_125;
    float _396 = _382;
    float _398 = _384;
    float _400 = _388;
    float _760;
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
    if (!_394)
    {
        float _402 = _202 * _374;
        float _404 = fma(_200, _376, _402);
        float _406 = fma(_204, _378, _404);
        float _408 = fma(_206, _380, _406);
        float _410 = precise::max(_408, -1.0);
        float _412 = precise::min(_410, 1.0);
        bool _414 = _412 >= 0.0;
        bool _416 = isnan(_412);
        bool _418 = _414 || _416;
        bool _420 = isnan(0.0);
        bool _422 = _418 || _420;
        bool _424 = !_422;
        float _426 = -_412;
        float _428 = _424 ? _426 : _412;
        bool _430 = _428 < 0.0;
        float _432 = float(_430);
        float _434 = abs(_428);
        float _436 = -_434;
        float _438 = _436 + 1.0;
        float _440 = abs(_428);
        float _442 = fma(_440, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _444 = as_type<int>(_438) + (-218103808);
        float _446 = abs(_428);
        float _448 = fma(_446, _442, -0.212114393711090087890625);
        bool _450 = uint(_444) >= 1920991232u;
        float _452 = abs(_428);
        float _454 = fma(_452, _448, 1.570728778839111328125);
        bool _456 = !_450;
        float _478;
        if (!_456)
        {
            int _458 = _444;
            int _460 = as_type<int>(_438);
            int _462 = _310;
            int _464 = 1072;
            int _466;
            int _468;
            int _470;
            int _472;
            int _474;
            int _476;
            _54(_458, _460, _462, _464, _466, _468, _470, _472, _474, _476);
            _478 = as_type<float>(_466);
            _480 = true;
        }
        else
        {
            float _482 = rsqrt(_438);
            float _484 = _438 * _482;
            float _486 = _482 * 0.5;
            float _488 = -_484;
            float _490 = 0.0 + _488;
            float _492 = fma(_486, _490, 0.5);
            float _494 = fma(_484, _492, _484);
            float _496 = -_494;
            float _498 = 0.0 + _496;
            float _500 = fma(_494, _498, _438);
            float _502 = fma(_486, _500, _494);
            _478 = _502;
        }
        _480 = false;
        float _504 = _478;
        int _506 = _101 + 8;
        uint _508 = uint(int(uint(_506) >> uint(2)));
        uint _510 = uint(int(uint(int(_508)) >> uint(2)));
        int _512 = int(_508) & 3;
        float _514 = (*spvDescriptorSet0.cp_c5)._m0[int(_510)][_512];
        int _516 = _68;
        int _518 = 0;
        int _520 = _56(_516, _518, (*spvDescriptorSet0.support_buffer));
        int _522 = as_type<int>(_514);
        int _524 = 0;
        int _526 = _56(_522, _524, (*spvDescriptorSet0.support_buffer));
        int3 _2223 = int3(_520, _526, 0);
        float3 _528 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2223.xy), uint(_2223.z), 0).xyz;
        float _530 = _528.x;
        float _532 = _528.y;
        float _534 = _528.z;
        int _536 = _68;
        int _538 = 0;
        int _540 = _56(_536, _538, (*spvDescriptorSet0.support_buffer));
        int _542 = as_type<int>(_514);
        int _544 = 0;
        int _546 = _56(_542, _544, (*spvDescriptorSet0.support_buffer));
        int3 _2241 = int3(_540, _546, 2);
        float3 _548 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2241.xy), uint(_2241.z), 0).xyz;
        float _550 = _548.x;
        float _552 = _548.y;
        float _554 = _548.z;
        float _556 = _454 * _504;
        float _558 = _432 * 2.0;
        float _560 = -_558;
        float _562 = fma(_556, _560, _556);
        float _564 = fma(_432, 3.1415927410125732421875, _562);
        float _566 = _564 * 0.15915493667125701904296875;
        float _568 = _566 * 6.283185482025146484375;
        float _570 = sin(_568);
        float _572 = abs(_570);
        bool _574 = _572 >= 0.001000000047497451305389404296875;
        bool _576 = isnan(_572);
        bool _578 = _574 || _576;
        bool _580 = isnan(0.001000000047497451305389404296875);
        bool _582 = _578 || _580;
        float _584 = _432;
        float _586 = _558;
        float _588 = _562;
        if (!_582)
        {
            int _590 = _101 + 28;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            uint _594 = uint(int(uint(int(_592)) >> uint(2)));
            int _596 = int(_592) & 3;
            float _598 = (*spvDescriptorSet0.cp_c5)._m0[int(_594)][_596];
            _584 = _598;
        }
        float _600 = _584;
        float _602 = _600;
        if (!_582)
        {
            float _604 = -_600;
            float _606 = _604 + 1.0;
            _586 = _606;
        }
        float _608 = _586;
        float _610 = _608;
        if (!_582)
        {
            _588 = _600;
        }
        float _612 = _588;
        bool _614 = !_582;
        float _616 = _612;
        if (!_614)
        {
            int _618 = _101 + 28;
            uint _620 = uint(int(uint(_618) >> uint(2)));
            uint _622 = uint(int(uint(int(_620)) >> uint(2)));
            int _624 = int(_620) & 3;
            float _626 = (*spvDescriptorSet0.cp_c5)._m0[int(_622)][_624];
            float _628 = 1.0 / _570;
            float _630 = _564 * _626;
            float _632 = _630 * 0.15915493667125701904296875;
            float _634 = -_630;
            float _636 = _564 + _634;
            float _638 = _636 * 0.15915493667125701904296875;
            float _640 = _632 * 6.283185482025146484375;
            float _642 = sin(_640);
            float _644 = _638 * 6.283185482025146484375;
            float _646 = sin(_644);
            float _648 = _642 * _628;
            float _650 = _646 * _628;
            _616 = _648;
            _602 = _626;
            _610 = _650;
        }
        float _652 = _616;
        float _654 = _602;
        float _656 = _610;
        int _658 = _101 + 20;
        uint _660 = uint(int(uint(_658) >> uint(2)));
        uint _662 = uint(int(uint(int(_660)) >> uint(2)));
        int _664 = int(_660) & 3;
        float _666 = (*spvDescriptorSet0.cp_c5)._m0[int(_662)][_664];
        bool _668 = !_422;
        float _670 = -_652;
        float _672 = _668 ? _670 : _652;
        float _674 = _532 * _654;
        float _676 = _534 * _654;
        float _678 = _554 * _654;
        float _680 = _206 * _672;
        float _682 = _202 * _672;
        float _684 = _200 * _672;
        float _686 = _204 * _672;
        float _688 = fma(_380, _656, _680);
        float _690 = fma(_374, _656, _682);
        float _692 = fma(_376, _656, _684);
        float _694 = fma(_378, _656, _686);
        float _696 = _688 * 2.0;
        float _698 = _690 * 2.0;
        float _700 = _692 * _692;
        float _702 = _692 * 2.0;
        float _704 = _694 * _696;
        float _706 = _690 * _696;
        float _708 = _692 * _696;
        float _710 = _690 * _690;
        float _712 = -_704;
        float _714 = fma(_690, _702, _712);
        float _716 = fma(_690, _702, _704);
        float _718 = fma(_700, -2.0, 1.0);
        float _720 = fma(_694, _702, _706);
        float _722 = -_706;
        float _724 = fma(_694, _702, _722);
        float _726 = fma(_382, _666, _674);
        float _728 = _694 * _694;
        float _730 = -_708;
        float _732 = fma(_694, _698, _730);
        float _734 = fma(_694, _698, _708);
        float _736 = _550 * _654;
        float _738 = fma(_710, -2.0, 1.0);
        float _740 = _530 * _654;
        float _742 = _552 * _654;
        float _744 = fma(_728, -2.0, _718);
        float _746 = fma(_728, -2.0, _738);
        float _748 = fma(_384, _666, _740);
        float _750 = fma(_386, _666, _742);
        float _752 = fma(_710, -2.0, _718);
        float _754 = fma(_388, _666, _676);
        float _756 = fma(_390, _666, _736);
        float _758 = fma(_392, _666, _678);
        _396 = _726;
        _760 = _714;
        _398 = _748;
        _762 = _746;
        _764 = _716;
        _766 = _724;
        _768 = _744;
        _770 = _734;
        _400 = _754;
        _772 = _720;
        _774 = _732;
        _776 = _752;
        _778 = _758;
        _780 = _750;
        _782 = _756;
        _784 = true;
    }
    else
    {
        float _786 = _380 * 2.0;
        float _788 = _376 * _376;
        float _790 = _374 * _374;
        float _792 = _376 * 2.0;
        float _794 = _786 * _378;
        float _796 = _786 * _376;
        float _798 = _786 * _374;
        float _800 = _374 * 2.0;
        float _802 = fma(_788, -2.0, 1.0);
        float _804 = _378 * _378;
        float _806 = fma(_790, -2.0, 1.0);
        float _808 = -_794;
        float _810 = fma(_792, _374, _808);
        float _812 = fma(_792, _374, _794);
        float _814 = fma(_792, _378, _798);
        float _816 = -_798;
        float _818 = fma(_792, _378, _816);
        float _820 = -_796;
        float _822 = fma(_800, _378, _820);
        float _824 = fma(_800, _378, _796);
        float _826 = fma(_804, -2.0, _806);
        float _828 = fma(_804, -2.0, _802);
        float _830 = fma(_790, -2.0, _802);
        _760 = _810;
        _762 = _826;
        _764 = _812;
        _766 = _818;
        _768 = _828;
        _770 = _824;
        _772 = _814;
        _774 = _822;
        _776 = _830;
        _778 = _392;
        _780 = _386;
        _782 = _390;
    }
    _784 = false;
    float _832 = _396;
    float _834 = _760;
    float _836 = _398;
    float _838 = _762;
    float _840 = _764;
    float _842 = _766;
    float _844 = _768;
    float _846 = _770;
    float _848 = _400;
    float _850 = _772;
    float _852 = _774;
    float _854 = _776;
    float _856 = _778;
    float _858 = _780;
    float _860 = _782;
    bool _862 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _864 = _832 * _834;
    float _866 = _836 * _838;
    float _868 = _836 * _840;
    float _870 = _836 * _842;
    float _872 = _832 * _844;
    float _874 = _832 * _846;
    float _876 = _848 * _850;
    float _878 = _848 * _852;
    float _880 = _848 * _854;
    int _882 = _68 * 112;
    bool _884 = !_862;
    float _1202;
    float _1204;
    float _1206;
    float _1208;
    float _1210;
    float _1212;
    float _1214;
    float _1216;
    float _1218;
    float _1220;
    float _1222;
    float _1224;
    if (!_884)
    {
        int _886 = 0;
        float _888 = _866;
        float _890 = _864;
        float _892 = _876;
        float _894 = _860;
        float _896 = _868;
        float _898 = _872;
        float _900 = _878;
        float _902 = _858;
        float _904 = _870;
        float _906 = _874;
        float _908 = _880;
        float _910 = _856;
        bool _912;
        int _960;
        int _970;
        int _980;
        int _990;
        int _1000;
        int _1010;
        int _1020;
        int _1030;
        int _1040;
        int _1050;
        int _1060;
        int _1070;
        int _1178;
        int _1182;
        int _1184;
        int _1188;
        float _1190;
        int _1192;
        float _1196;
        int _1198;
        int _1200;
        do
        {
            int _914 = _886;
            int _916 = as_type<int>(_888);
            int _918 = as_type<int>(_890);
            int _920 = as_type<int>(_892);
            int _922 = as_type<int>(_894);
            int _924 = as_type<int>(_896);
            int _926 = as_type<int>(_898);
            float _928 = _900;
            int _930 = as_type<int>(_902);
            int _932 = as_type<int>(_904);
            float _934 = _906;
            int _936 = as_type<int>(_908);
            int _938 = as_type<int>(_910);
            uint _940 = uint(int(uint(_882) >> uint(2)));
            uint _942 = uint(int(uint(int(_940)) >> uint(2)));
            int _944 = int(_940) & 3;
            float _946 = (*spvDescriptorSet0.cp_c6)._m0[int(_942)][_944];
            bool _948 = _68 != 0;
            int _950 = _914 + 1;
            bool _952 = uint(_950) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _954 = _916;
            int _956 = as_type<int>(_946);
            int _958 = 31;
            int _2771 = _58(_954, _956, _958, _960, gl_SubgroupInvocationID);
            int _962 = _2771;
            int _964 = _918;
            int _966 = as_type<int>(_946);
            int _968 = 31;
            int _2775 = _58(_964, _966, _968, _970, gl_SubgroupInvocationID);
            int _972 = _2775;
            int _974 = _920;
            int _976 = as_type<int>(_946);
            int _978 = 31;
            int _2779 = _58(_974, _976, _978, _980, gl_SubgroupInvocationID);
            int _982 = _2779;
            int _984 = _922;
            int _986 = as_type<int>(_946);
            int _988 = 31;
            int _2783 = _58(_984, _986, _988, _990, gl_SubgroupInvocationID);
            int _992 = _2783;
            int _994 = _924;
            int _996 = as_type<int>(_946);
            int _998 = 31;
            int _2787 = _58(_994, _996, _998, _1000, gl_SubgroupInvocationID);
            int _1002 = _2787;
            int _1004 = _926;
            int _1006 = as_type<int>(_946);
            int _1008 = 31;
            int _2791 = _58(_1004, _1006, _1008, _1010, gl_SubgroupInvocationID);
            int _1012 = _2791;
            int _1014 = as_type<int>(_928);
            int _1016 = as_type<int>(_946);
            int _1018 = 31;
            int _2796 = _58(_1014, _1016, _1018, _1020, gl_SubgroupInvocationID);
            int _1022 = _2796;
            int _1024 = _930;
            int _1026 = as_type<int>(_946);
            int _1028 = 31;
            int _2800 = _58(_1024, _1026, _1028, _1030, gl_SubgroupInvocationID);
            int _1032 = _2800;
            int _1034 = _932;
            int _1036 = as_type<int>(_946);
            int _1038 = 31;
            int _2804 = _58(_1034, _1036, _1038, _1040, gl_SubgroupInvocationID);
            int _1042 = _2804;
            int _1044 = as_type<int>(_934);
            int _1046 = as_type<int>(_946);
            int _1048 = 31;
            int _2809 = _58(_1044, _1046, _1048, _1050, gl_SubgroupInvocationID);
            int _1052 = _2809;
            int _1054 = _936;
            int _1056 = as_type<int>(_946);
            int _1058 = 31;
            int _2813 = _58(_1054, _1056, _1058, _1060, gl_SubgroupInvocationID);
            int _1062 = _2813;
            int _1064 = _938;
            int _1066 = as_type<int>(_946);
            int _1068 = 31;
            int _2817 = _58(_1064, _1066, _1068, _1070, gl_SubgroupInvocationID);
            int _1072 = _2817;
            bool _1074 = !_948;
            _886 = _950;
            int _1076 = _916;
            int _1078 = _918;
            int _1080 = _920;
            int _1082 = _922;
            int _1084 = _924;
            int _1086 = _926;
            float _1088 = _928;
            int _1090 = _930;
            int _1092 = _932;
            float _1094 = _934;
            int _1096 = _936;
            int _1098 = _938;
            if (!_1074)
            {
                float _1100 = _868 * as_type<float>(_972);
                float _1102 = _872 * as_type<float>(_972);
                float _1104 = _878 * as_type<float>(_1012);
                float _1106 = _878 * as_type<float>(_972);
                float _1108 = fma(_866, as_type<float>(_962), _1100);
                float _1110 = fma(_864, as_type<float>(_962), _1102);
                float _1112 = _868 * as_type<float>(_1012);
                float _1114 = _872 * as_type<float>(_1012);
                float _1116 = as_type<float>(_972) * _858;
                float _1118 = as_type<float>(_1012) * _858;
                float _1120 = fma(_866, as_type<float>(_1002), _1112);
                float _1122 = fma(_864, as_type<float>(_1002), _1114);
                float _1124 = fma(_876, as_type<float>(_1002), _1104);
                float _1126 = _868 * as_type<float>(_1052);
                float _1128 = _872 * as_type<float>(_1052);
                float _1130 = _878 * as_type<float>(_1052);
                float _1132 = as_type<float>(_1052) * _858;
                float _1134 = fma(_876, as_type<float>(_962), _1106);
                float _1136 = fma(as_type<float>(_962), _860, _1116);
                float _1138 = fma(as_type<float>(_1002), _860, _1118);
                float _1140 = fma(_866, as_type<float>(_1042), _1126);
                float _1142 = fma(_864, as_type<float>(_1042), _1128);
                float _1144 = fma(_876, as_type<float>(_1042), _1130);
                float _1146 = fma(as_type<float>(_1042), _860, _1132);
                float _1148 = fma(_880, as_type<float>(_982), _1134);
                float _1150 = fma(_870, as_type<float>(_982), _1108);
                float _1152 = fma(_874, as_type<float>(_982), _1110);
                float _1154 = fma(_870, as_type<float>(_1022), _1120);
                float _1156 = fma(_874, as_type<float>(_1022), _1122);
                float _1158 = fma(_880, as_type<float>(_1022), _1124);
                float _1160 = fma(as_type<float>(_982), _856, _1136);
                float _1162 = fma(as_type<float>(_1022), _856, _1138);
                float _1164 = fma(as_type<float>(_1062), _856, _1146);
                float _1166 = fma(_870, as_type<float>(_1062), _1140);
                float _1168 = fma(_874, as_type<float>(_1062), _1142);
                float _1170 = fma(_880, as_type<float>(_1062), _1144);
                float _1172 = as_type<float>(_992) + _1160;
                float _1174 = as_type<float>(_1032) + _1162;
                float _1176 = as_type<float>(_1072) + _1164;
                _1076 = as_type<int>(_1150);
                _1078 = as_type<int>(_1152);
                _1080 = as_type<int>(_1148);
                _1082 = as_type<int>(_1172);
                _1084 = as_type<int>(_1154);
                _1086 = as_type<int>(_1156);
                _1088 = _1158;
                _1090 = as_type<int>(_1174);
                _1092 = as_type<int>(_1166);
                _1094 = _1168;
                _1096 = as_type<int>(_1170);
                _1098 = as_type<int>(_1176);
            }
            _1178 = _1076;
            int _1180 = _1078;
            _1182 = _1080;
            _1184 = _1082;
            int _1186 = _1084;
            _1188 = _1086;
            _1190 = _1088;
            _1192 = _1090;
            int _1194 = _1092;
            _1196 = _1094;
            _1198 = _1096;
            _1200 = _1098;
            _912 = !_952;
            _888 = as_type<float>(_1178);
            _890 = as_type<float>(_1180);
            _892 = as_type<float>(_1182);
            _894 = as_type<float>(_1184);
            _896 = as_type<float>(_1186);
            _898 = as_type<float>(_1188);
            _900 = _1190;
            _902 = as_type<float>(_1192);
            _904 = as_type<float>(_1194);
            _906 = _1196;
            _908 = as_type<float>(_1198);
            _910 = as_type<float>(_1200);
            _1202 = as_type<float>(_1180);
            _1204 = as_type<float>(_1186);
            _1206 = as_type<float>(_1194);
        } while (_912);
        _1208 = as_type<float>(_1188);
        _1210 = _1196;
        _1212 = as_type<float>(_1178);
        _1214 = _1190;
        _1216 = as_type<float>(_1192);
        _1218 = as_type<float>(_1182);
        _1220 = as_type<float>(_1198);
        _1222 = as_type<float>(_1184);
        _1224 = as_type<float>(_1200);
        _1226 = true;
    }
    else
    {
        _1202 = _864;
        _1208 = _872;
        _1210 = _874;
        _1212 = _866;
        _1204 = _868;
        _1206 = _870;
        _1214 = _878;
        _1216 = _858;
        _1218 = _876;
        _1220 = _880;
        _1222 = _860;
        _1224 = _856;
    }
    _1226 = false;
    float _1228 = _1202;
    float _1230 = _1208;
    float _1232 = _1210;
    float _1234 = _1212;
    float _1236 = _1204;
    float _1238 = _1206;
    float _1240 = _1214;
    float _1242 = _1216;
    float _1244 = _1218;
    float _1246 = _1220;
    float _1248 = _1222;
    float _1250 = _1224;
    int _1252 = _882 + 80;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    uint _1256 = uint(int(uint(int(_1254)) >> uint(2)));
    int _1258 = int(_1254) & 3;
    float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
    int _1262 = int(_1254) + 1;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    int _1266 = _1262 & 3;
    float _1268 = (*spvDescriptorSet0.cp_c6)._m0[int(_1264)][_1266];
    int _1270 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1272 = _1270 + _68;
    int _1274 = _882 + 64;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.cp_c6)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.cp_c6)._m0[int(_1286)][_1288];
    int _1292 = _1272 * 48;
    int _1294 = _882 + 88;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.cp_c6)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.cp_c6)._m0[int(_1306)][_1308];
    int _1312 = _882 + 72;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.cp_c6)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.cp_c6)._m0[int(_1324)][_1326];
    int _1330 = _882 + 104;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
    int _1348 = _882 + 96;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.cp_c6)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.cp_c6)._m0[int(_1360)][_1362];
    float _1366 = _1228 * _1260;
    float _1368 = _1230 * _1260;
    float _1370 = _1232 * _1260;
    int _1372 = _882 + 16;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    uint _1376 = uint(int(uint(int(_1374)) >> uint(2)));
    int _1378 = int(_1374) & 3;
    float _1380 = (*spvDescriptorSet0.cp_c6)._m0[int(_1376)][_1378];
    int _1382 = int(_1374) + 1;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    int _1386 = _1382 & 3;
    float _1388 = (*spvDescriptorSet0.cp_c6)._m0[int(_1384)][_1386];
    float _1390 = _1232 * _1268;
    float _1392 = fma(_1234, _1282, _1366);
    float _1394 = fma(_1236, _1282, _1368);
    float _1396 = fma(_1238, _1282, _1370);
    float _1398 = _1228 * _1268;
    int _1400 = _882 + 32;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    uint _1404 = uint(int(uint(int(_1402)) >> uint(2)));
    int _1406 = int(_1402) & 3;
    float _1408 = (*spvDescriptorSet0.cp_c6)._m0[int(_1404)][_1406];
    int _1410 = int(_1402) + 1;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    int _1414 = _1410 & 3;
    float _1416 = (*spvDescriptorSet0.cp_c6)._m0[int(_1412)][_1414];
    float _1418 = _1230 * _1268;
    float _1420 = fma(_1238, _1290, _1390);
    float _1422 = fma(_1234, _1290, _1398);
    float _1424 = _1228 * _1302;
    float _1426 = _1228 * _1310;
    float _1428 = _1230 * _1302;
    float _1430 = _1230 * _1310;
    int _1432 = _882 + 48;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.cp_c6)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.cp_c6)._m0[int(_1444)][_1446];
    float _1450 = _1232 * _1302;
    float _1452 = _1232 * _1310;
    float _1454 = fma(_1236, _1290, _1418);
    float _1456 = fma(_1234, _1320, _1424);
    float _1458 = fma(_1234, _1328, _1426);
    float _1460 = fma(_1236, _1320, _1428);
    float _1462 = fma(_1236, _1328, _1430);
    int _1464 = _882 + 24;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.cp_c6)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.cp_c6)._m0[int(_1476)][_1478];
    float _1482 = fma(_1238, _1320, _1450);
    float _1484 = fma(_1238, _1328, _1452);
    float _1486 = fma(_1240, _1346, _1462);
    int _1488 = _882 + 40;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
    int _1494 = int(_1490) & 3;
    float _1496 = (*spvDescriptorSet0.cp_c6)._m0[int(_1492)][_1494];
    int _1498 = int(_1490) + 1;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    int _1502 = _1498 & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    float _1506 = _1486 + _1242;
    float _1508 = fma(_1244, _1356, _1392);
    float _1510 = fma(_1240, _1356, _1394);
    float _1512 = fma(_1246, _1356, _1396);
    float _1514 = fma(_1244, _1364, _1422);
    int _1516 = _882 + 56;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
    int _1522 = int(_1518) & 3;
    float _1524 = (*spvDescriptorSet0.cp_c6)._m0[int(_1520)][_1522];
    int _1526 = int(_1518) + 1;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    int _1530 = _1526 & 3;
    float _1532 = (*spvDescriptorSet0.cp_c6)._m0[int(_1528)][_1530];
    float _1534 = fma(_1244, _1338, _1456);
    float _1536 = fma(_1244, _1346, _1458);
    float _1538 = fma(_1246, _1346, _1484);
    float _1540 = fma(_1240, _1364, _1454);
    float _1542 = fma(_1240, _1338, _1460);
    float _1544 = fma(_1246, _1338, _1482);
    float _1546 = _1536 + _1248;
    float _1548 = _1538 + _1250;
    float _1550 = _1506 * _1388;
    float _1552 = _1510 * _1388;
    float _1554 = _1540 * _1388;
    float _1556 = _1542 * _1388;
    float _1558 = fma(_1546, _1380, _1550);
    float _1560 = fma(_1508, _1380, _1552);
    float _1562 = fma(_1514, _1380, _1554);
    float _1564 = _1506 * _1416;
    float _1566 = fma(_1534, _1380, _1556);
    float _1568 = _1510 * _1416;
    float _1570 = fma(_1246, _1364, _1420);
    float _1572 = _1540 * _1416;
    float _1574 = _1542 * _1416;
    float _1576 = fma(_1546, _1408, _1564);
    float _1578 = fma(_1508, _1408, _1568);
    float _1580 = _1506 * _1448;
    float _1582 = _1510 * _1448;
    float _1584 = _1540 * _1448;
    float _1586 = _1542 * _1448;
    float _1588 = fma(_1546, _1440, _1580);
    float _1590 = fma(_1514, _1408, _1572);
    float _1592 = fma(_1534, _1408, _1574);
    float _1594 = fma(_1508, _1440, _1582);
    float _1596 = fma(_1548, _1472, _1558);
    float _1598 = fma(_1514, _1440, _1584);
    float _1600 = fma(_1534, _1440, _1586);
    float _1602 = fma(_1512, _1472, _1560);
    float _1604 = _1596 + _1480;
    float _1606 = fma(_1570, _1472, _1562);
    float _1608 = fma(_1544, _1472, _1566);
    float _1610 = fma(_1548, _1496, _1576);
    float _1612 = fma(_1512, _1496, _1578);
    float _1614 = fma(_1570, _1496, _1590);
    int _1616 = _1292 + 16;
    float _1618 = fma(_1544, _1496, _1592);
    float _1620 = _1610 + _1504;
    int _1622 = _1292 + 32;
    float _1624 = fma(_1548, _1524, _1588);
    float _1626 = fma(_1512, _1524, _1594);
    float _1628 = fma(_1570, _1524, _1598);
    float _1630 = fma(_1544, _1524, _1600);
    float _1632 = _1624 + _1532;
    int _1634 = _1292 + 48;
    uint _1636 = uint(int(uint(_1616) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1636)] = as_type<uint>(_1602);
    int _1638 = _1616 + 4;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1640)] = as_type<uint>(_1606);
    int _1642 = _1616 + 8;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1644)] = as_type<uint>(_1608);
    int _1646 = _1616 + 12;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1648)] = as_type<uint>(_1604);
    uint _1650 = uint(int(uint(_1622) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1650)] = as_type<uint>(_1612);
    int _1652 = _1622 + 4;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1654)] = as_type<uint>(_1614);
    int _1656 = _1622 + 8;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1658)] = as_type<uint>(_1618);
    int _1660 = _1622 + 12;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1662)] = as_type<uint>(_1620);
    uint _1664 = uint(int(uint(_1634) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1664)] = as_type<uint>(_1626);
    int _1666 = _1634 + 4;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1668)] = as_type<uint>(_1628);
    int _1670 = _1634 + 8;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1672)] = as_type<uint>(_1630);
    int _1674 = _1634 + 12;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1676)] = as_type<uint>(_1632);
}

