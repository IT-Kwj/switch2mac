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
void _54(thread const int& _3917, thread const int& _3918, thread const int& _3919, thread const int& _3920, thread int& _3921, thread int& _3922, thread int& _3923, thread int& _3924, thread int& _3925, thread int& _3926)
{
    float _3929 = as_type<float>(_3920) + 0.0;
    bool _3931 = _3929 != 0.0;
    bool _3933 = isnan(_3929);
    bool _3935 = _3931 || _3933;
    bool _3937 = isnan(0.0);
    bool _3939 = _3935 || _3937;
    int _3941 = _3917;
    int _3943 = _3918;
    int _3945 = _3920;
    int _3947 = _3939 ? (-1) : 0;
    if (!_3939)
    {
        float _3949 = as_type<float>(_3920) * 1.0;
        _3941 = as_type<int>(_3949);
    }
    int _3951 = _3941;
    bool _3953 = !_3939;
    int _3955 = _3951;
    int _3957 = _3951;
    if (!_3953)
    {
        float _3959 = as_type<float>(_3920) + 0.0;
        bool _3961 = _3959 >= 0.0;
        bool _3963 = isnan(_3959);
        bool _3965 = _3961 || _3963;
        bool _3967 = isnan(0.0);
        bool _3969 = _3965 || _3967;
        _3947 = _3969 ? (-1) : 0;
        if (!_3969)
        {
            _3955 = 2147483647;
        }
        int _3971 = _3955;
        bool _3973 = !_3969;
        int _3975 = _3971;
        _3957 = _3971;
        if (!_3973)
        {
            float _3977 = as_type<float>(_3920) + 0.0;
            bool _3979 = _3977 > as_type<float>(0x7f800000u /* inf */);
            bool _3981 = isnan(_3977);
            bool _3983 = _3979 || _3981;
            bool _3985 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3987 = _3983 || _3985;
            _3947 = _3987 ? (-1) : 0;
            if (_3987)
            {
                float _3989 = as_type<float>(_3920) + 1.0;
                _3975 = as_type<int>(_3989);
            }
            int _3991 = _3975;
            int _3993 = _3991;
            _3957 = _3991;
            if (!_3987)
            {
                float _3995 = 0.0 + as_type<float>(_3920);
                bool _3997 = _3995 != as_type<float>(0x7f800000u /* inf */);
                bool _3999 = isnan(_3995);
                bool _4001 = _3997 || _3999;
                bool _4003 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4005 = _4001 || _4003;
                _3947 = _4005 ? (-1) : 0;
                if (!_4005)
                {
                    _3993 = _3920;
                }
                int _4007 = _3993;
                bool _4009 = !_4005;
                _3957 = _4007;
                if (!_4009)
                {
                    float _4011 = as_type<float>(_3920) * 18446744073709551616.0;
                    float _4013 = rsqrt(_4011);
                    float _4015 = _4011 * _4013;
                    float _4017 = _4013 * 0.5;
                    float _4019 = -_4015;
                    float _4021 = 0.0 + _4019;
                    float _4023 = fma(_4017, _4021, 0.5);
                    float _4025 = fma(_4015, _4023, _4015);
                    float _4027 = -_4025;
                    float _4029 = 0.0 + _4027;
                    float _4031 = fma(_4025, _4029, _4011);
                    float _4033 = fma(_4017, _4031, _4025);
                    float _4035 = _4033 * 2.3283064365386962890625e-10;
                    _3957 = as_type<int>(_4035);
                    _3943 = as_type<int>(_4025);
                    _3945 = as_type<int>(_4011);
                }
            }
        }
    }
    int _4037 = _3957;
    int _4039 = _3943;
    int _4041 = _3945;
    int _4043 = _3947;
    _3921 = _3919;
    _3922 = 0;
    _3923 = _4037;
    _3924 = _4039;
    _3925 = _4041;
    _3926 = _4043;
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
    bool _1202 = false;
    bool _464 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    int _85 = int(_77) + 1;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    int _89 = _85 & 3;
    float _91 = (*spvDescriptorSet0.cp_c5)._m0[int(_87)][_89];
    int _93 = _74 + 8;
    uint _95 = uint(int(uint(_93) >> uint(2)));
    uint _97 = uint(int(uint(int(_95)) >> uint(2)));
    int _99 = int(_95) & 3;
    float _101 = (*spvDescriptorSet0.cp_c5)._m0[int(_97)][_99];
    int _103 = int(_95) + 1;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    int _107 = _103 & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = _68;
    int _113 = 0;
    int _115 = _56(_111, _113, (*spvDescriptorSet0.support_buffer));
    int _117 = as_type<int>(_83);
    int _119 = 0;
    int _121 = _56(_117, _119, (*spvDescriptorSet0.support_buffer));
    int3 _1755 = int3(_115, _121, 1);
    float4 _124 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1755.xy), uint(_1755.z), 0).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    int _134 = _68;
    int _136 = 0;
    int _138 = _56(_134, _136, (*spvDescriptorSet0.support_buffer));
    int _140 = as_type<int>(_91);
    int _142 = 0;
    int _144 = _56(_140, _142, (*spvDescriptorSet0.support_buffer));
    int3 _1775 = int3(_138, _144, 1);
    float4 _146 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1775.xy), uint(_1775.z), 0).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    int _156 = _68;
    int _158 = 0;
    int _160 = _56(_156, _158, (*spvDescriptorSet0.support_buffer));
    int _162 = as_type<int>(_83);
    int _164 = 0;
    int _166 = _56(_162, _164, (*spvDescriptorSet0.support_buffer));
    int3 _1795 = int3(_160, _166, 0);
    float3 _170 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1795.xy), uint(_1795.z), 0).xyz;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    int _178 = _68;
    int _180 = 0;
    int _182 = _56(_178, _180, (*spvDescriptorSet0.support_buffer));
    int _184 = as_type<int>(_91);
    int _186 = 0;
    int _188 = _56(_184, _186, (*spvDescriptorSet0.support_buffer));
    int3 _1813 = int3(_182, _188, 0);
    float3 _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1813.xy), uint(_1813.z), 0).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    int _198 = _68;
    int _200 = 1;
    int _202 = _56(_198, _200, (*spvDescriptorSet0.support_buffer));
    int _204 = as_type<int>(_101);
    int _206 = 1;
    int _208 = _56(_204, _206, (*spvDescriptorSet0.support_buffer));
    int3 _1831 = int3(_202, _208, 1);
    float4 _210 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1831.xy), uint(_1831.z), 0).xyzw;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    float _218 = _210.w;
    int _220 = _68;
    int _222 = 1;
    int _224 = _56(_220, _222, (*spvDescriptorSet0.support_buffer));
    int _226 = as_type<int>(_109);
    int _228 = 1;
    int _230 = _56(_226, _228, (*spvDescriptorSet0.support_buffer));
    int3 _1851 = int3(_224, _230, 1);
    float4 _232 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1851.xy), uint(_1851.z), 0).xyzw;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = _232.z;
    float _240 = _232.w;
    int _242 = _68;
    int _244 = 0;
    int _246 = _56(_242, _244, (*spvDescriptorSet0.support_buffer));
    int _248 = as_type<int>(_83);
    int _250 = 0;
    int _252 = _56(_248, _250, (*spvDescriptorSet0.support_buffer));
    int3 _1871 = int3(_246, _252, 2);
    float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1871.xy), uint(_1871.z), 0).xyz;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    int _262 = _68;
    int _264 = 0;
    int _266 = _56(_262, _264, (*spvDescriptorSet0.support_buffer));
    int _268 = as_type<int>(_91);
    int _270 = 0;
    int _272 = _56(_268, _270, (*spvDescriptorSet0.support_buffer));
    int3 _1889 = int3(_266, _272, 2);
    float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1889.xy), uint(_1889.z), 0).xyz;
    float _276 = _274.x;
    float _278 = _274.y;
    float _280 = _274.z;
    int _282 = _74 + 16;
    uint _284 = uint(int(uint(_282) >> uint(2)));
    uint _286 = uint(int(uint(int(_284)) >> uint(2)));
    int _288 = int(_284) & 3;
    float _290 = (*spvDescriptorSet0.cp_c5)._m0[int(_286)][_288];
    int _292 = _74 + 24;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    uint _296 = uint(int(uint(int(_294)) >> uint(2)));
    int _298 = int(_294) & 3;
    float _300 = (*spvDescriptorSet0.cp_c5)._m0[int(_296)][_298];
    float _302 = -_130;
    float _304 = _302 + _152;
    float _306 = -_126;
    float _308 = _306 + _148;
    float _310 = -_128;
    float _312 = _310 + _150;
    float _314 = -_132;
    float _316 = _314 + _154;
    float _318 = fma(_304, _290, _130);
    float _320 = -_172;
    float _322 = _320 + _192;
    float _324 = fma(_308, _290, _126);
    float _326 = fma(_312, _290, _128);
    float _328 = -_214;
    float _330 = _328 + _236;
    float _332 = -_212;
    float _334 = _332 + _234;
    float _336 = fma(_322, _290, _172);
    float _338 = -_216;
    float _340 = _338 + _238;
    float _342 = fma(_330, _300, _214);
    float _344 = fma(_334, _300, _212);
    float _346 = -_218;
    float _348 = _346 + _240;
    float _350 = fma(_340, _300, _216);
    float _352 = _326 * _342;
    float _354 = fma(_316, _290, _132);
    float _356 = fma(_348, _300, _218);
    float _358 = -_174;
    float _360 = _358 + _194;
    float _362 = fma(_324, _344, _352);
    float _364 = -_260;
    float _366 = _364 + _280;
    float _368 = -_176;
    float _370 = _368 + _196;
    float _372 = fma(_360, _290, _174);
    float _374 = fma(_318, _350, _362);
    float _376 = fma(_366, _290, _260);
    float _378 = fma(_370, _290, _176);
    float _380 = fma(_354, _356, _374);
    float _382 = precise::max(_380, -1.0);
    float _384 = precise::min(_382, 1.0);
    bool _386 = _384 >= 0.0;
    bool _388 = isnan(_384);
    bool _390 = _386 || _388;
    bool _392 = isnan(0.0);
    bool _394 = _390 || _392;
    bool _396 = !_394;
    float _398 = -_384;
    float _400 = _396 ? _398 : _384;
    bool _402 = _400 < 0.0;
    float _404 = float(_402);
    float _406 = abs(_400);
    float _408 = -_406;
    float _410 = _408 + 1.0;
    float _412 = abs(_400);
    float _414 = fma(_412, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _416 = as_type<int>(_410) + (-218103808);
    float _418 = abs(_400);
    float _420 = fma(_418, _414, -0.212114393711090087890625);
    bool _422 = uint(_416) >= 1920991232u;
    float _424 = -_256;
    float _426 = _424 + _276;
    float _428 = -_258;
    float _430 = _428 + _278;
    float _432 = abs(_400);
    float _434 = fma(_432, _420, 1.570728778839111328125);
    float _436 = fma(_426, _290, _256);
    float _438 = fma(_430, _290, _258);
    bool _440 = !_422;
    float _462;
    if (!_440)
    {
        int _442 = as_type<int>(_430);
        int _444 = as_type<int>(_278);
        int _446 = 1248;
        int _448 = as_type<int>(_410);
        int _450;
        int _452;
        int _454;
        int _456;
        int _458;
        int _460;
        _54(_442, _444, _446, _448, _450, _452, _454, _456, _458, _460);
        _462 = as_type<float>(_454);
        _464 = true;
    }
    else
    {
        float _466 = rsqrt(_410);
        float _468 = _410 * _466;
        float _470 = _466 * 0.5;
        float _472 = -_468;
        float _474 = 0.0 + _472;
        float _476 = fma(_470, _474, 0.5);
        float _478 = fma(_468, _476, _468);
        float _480 = -_478;
        float _482 = 0.0 + _480;
        float _484 = fma(_478, _482, _410);
        float _486 = fma(_470, _484, _478);
        _462 = _486;
    }
    _464 = false;
    float _488 = _462;
    int _490 = _74 + 8;
    uint _492 = uint(int(uint(_490) >> uint(2)));
    uint _494 = uint(int(uint(int(_492)) >> uint(2)));
    int _496 = int(_492) & 3;
    float _498 = (*spvDescriptorSet0.cp_c5)._m0[int(_494)][_496];
    int _500 = int(_492) + 1;
    uint _502 = uint(int(uint(_500) >> uint(2)));
    int _504 = _500 & 3;
    float _506 = (*spvDescriptorSet0.cp_c5)._m0[int(_502)][_504];
    int _508 = _68;
    int _510 = 1;
    int _512 = _56(_508, _510, (*spvDescriptorSet0.support_buffer));
    int _514 = as_type<int>(_498);
    int _516 = 1;
    int _518 = _56(_514, _516, (*spvDescriptorSet0.support_buffer));
    int3 _2228 = int3(_512, _518, 0);
    float3 _520 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2228.xy), uint(_2228.z), 0).xyz;
    float _522 = _520.x;
    float _524 = _520.y;
    float _526 = _520.z;
    int _528 = _68;
    int _530 = 1;
    int _532 = _56(_528, _530, (*spvDescriptorSet0.support_buffer));
    int _534 = as_type<int>(_498);
    int _536 = 1;
    int _538 = _56(_534, _536, (*spvDescriptorSet0.support_buffer));
    int3 _2246 = int3(_532, _538, 2);
    float3 _540 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2246.xy), uint(_2246.z), 0).xyz;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = _540.z;
    int _548 = _68;
    int _550 = 1;
    int _552 = _56(_548, _550, (*spvDescriptorSet0.support_buffer));
    int _554 = as_type<int>(_506);
    int _556 = 1;
    int _558 = _56(_554, _556, (*spvDescriptorSet0.support_buffer));
    int3 _2264 = int3(_552, _558, 0);
    float3 _560 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2264.xy), uint(_2264.z), 0).xyz;
    float _562 = _560.x;
    float _564 = _560.y;
    float _566 = _560.z;
    int _568 = _68;
    int _570 = 1;
    int _572 = _56(_568, _570, (*spvDescriptorSet0.support_buffer));
    int _574 = as_type<int>(_506);
    int _576 = 1;
    int _578 = _56(_574, _576, (*spvDescriptorSet0.support_buffer));
    int3 _2282 = int3(_572, _578, 2);
    float3 _580 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2282.xy), uint(_2282.z), 0).xyz;
    float _582 = _580.x;
    float _584 = _580.y;
    float _586 = _580.z;
    float _588 = _434 * _488;
    float _590 = _404 * 2.0;
    float _592 = -_590;
    float _594 = fma(_588, _592, _588);
    float _596 = fma(_404, 3.1415927410125732421875, _594);
    float _598 = _596 * 0.15915493667125701904296875;
    float _600 = _598 * 6.283185482025146484375;
    float _602 = sin(_600);
    float _604 = abs(_602);
    bool _606 = _604 >= 0.001000000047497451305389404296875;
    bool _608 = isnan(_604);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.001000000047497451305389404296875);
    bool _614 = _610 || _612;
    float _616 = _404;
    float _618 = _590;
    float _620 = _594;
    if (!_614)
    {
        int _622 = _74 + 28;
        uint _624 = uint(int(uint(_622) >> uint(2)));
        uint _626 = uint(int(uint(int(_624)) >> uint(2)));
        int _628 = int(_624) & 3;
        float _630 = (*spvDescriptorSet0.cp_c5)._m0[int(_626)][_628];
        _616 = _630;
    }
    float _632 = _616;
    float _634 = _632;
    if (!_614)
    {
        float _636 = -_632;
        float _638 = _636 + 1.0;
        _618 = _638;
    }
    float _640 = _618;
    float _642 = _640;
    if (!_614)
    {
        _620 = _632;
    }
    float _644 = _620;
    bool _646 = !_614;
    float _648 = _644;
    if (!_646)
    {
        int _650 = _74 + 28;
        uint _652 = uint(int(uint(_650) >> uint(2)));
        uint _654 = uint(int(uint(int(_652)) >> uint(2)));
        int _656 = int(_652) & 3;
        float _658 = (*spvDescriptorSet0.cp_c5)._m0[int(_654)][_656];
        float _660 = 1.0 / _602;
        float _662 = _596 * _658;
        float _664 = _662 * 0.15915493667125701904296875;
        float _666 = -_662;
        float _668 = _596 + _666;
        float _670 = _668 * 0.15915493667125701904296875;
        float _672 = _664 * 6.283185482025146484375;
        float _674 = sin(_672);
        float _676 = _670 * 6.283185482025146484375;
        float _678 = sin(_676);
        float _680 = _674 * _660;
        float _682 = _678 * _660;
        _648 = _680;
        _642 = _682;
        _634 = _658;
    }
    float _684 = _648;
    float _686 = _642;
    float _688 = _634;
    bool _690 = !_394;
    float _692 = -_684;
    float _694 = _690 ? _692 : _684;
    float _696 = -_522;
    float _698 = _696 + _562;
    float _700 = -_526;
    float _702 = _700 + _566;
    bool _704 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _706 = -_546;
    float _708 = _706 + _586;
    float _710 = _344 * _694;
    float _712 = _356 * _694;
    float _714 = _350 * _694;
    float _716 = _342 * _694;
    float _718 = fma(_324, _686, _710);
    float _720 = fma(_354, _686, _712);
    int _722 = _74 + 24;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.cp_c5)._m0[int(_726)][_728];
    float _732 = fma(_318, _686, _714);
    float _734 = fma(_326, _686, _716);
    float _736 = _720 * 2.0;
    float _738 = _718 * 2.0;
    float _740 = _734 * 2.0;
    float _742 = _718 * _736;
    int _744 = _74 + 20;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    uint _748 = uint(int(uint(int(_746)) >> uint(2)));
    int _750 = int(_746) & 3;
    float _752 = (*spvDescriptorSet0.cp_c5)._m0[int(_748)][_750];
    float _754 = _732 * _736;
    float _756 = _734 * _736;
    float _758 = _718 * _718;
    float _760 = -_754;
    float _762 = fma(_734, _738, _760);
    float _764 = fma(_734, _738, _754);
    float _766 = _734 * _734;
    float _768 = -_742;
    float _770 = fma(_732, _740, _768);
    float _772 = fma(_732, _740, _742);
    float _774 = -_524;
    float _776 = _774 + _564;
    float _778 = fma(_758, -2.0, 1.0);
    float _780 = fma(_732, _738, _756);
    float _782 = -_756;
    float _784 = fma(_732, _738, _782);
    float _786 = _732 * _732;
    float _788 = fma(_766, -2.0, 1.0);
    float _790 = fma(_776, _730, _524);
    float _792 = fma(_698, _730, _522);
    float _794 = fma(_766, -2.0, _778);
    float _796 = -_542;
    float _798 = _796 + _582;
    float _800 = _790 * _688;
    float _802 = -_544;
    float _804 = _802 + _584;
    float _806 = fma(_786, -2.0, _788);
    float _808 = fma(_702, _730, _526);
    float _810 = fma(_786, -2.0, _778);
    float _812 = fma(_372, _752, _800);
    float _814 = fma(_798, _730, _542);
    float _816 = fma(_804, _730, _544);
    float _818 = fma(_708, _730, _546);
    float _820 = _792 * _688;
    float _822 = _808 * _688;
    float _824 = _762 * _812;
    float _826 = _810 * _812;
    float _828 = _772 * _812;
    float _830 = _814 * _688;
    float _832 = _816 * _688;
    float _834 = _818 * _688;
    float _836 = fma(_336, _752, _820);
    float _838 = fma(_378, _752, _822);
    float _840 = fma(_436, _752, _830);
    float _842 = fma(_438, _752, _832);
    float _844 = fma(_376, _752, _834);
    float _846 = _764 * _836;
    float _848 = _806 * _836;
    float _850 = _784 * _836;
    float _852 = _780 * _838;
    float _854 = _770 * _838;
    float _856 = _794 * _838;
    int _858 = _68 * 112;
    bool _860 = !_704;
    float _862 = _842;
    float _864 = _840;
    float _1182;
    float _1184;
    float _1186;
    float _1188;
    float _1190;
    float _1192;
    float _1194;
    float _1196;
    float _1198;
    float _1200;
    if (!_860)
    {
        int _866 = 0;
        float _868 = _848;
        float _870 = _824;
        float _872 = _852;
        float _874 = _840;
        float _876 = _846;
        float _878 = _826;
        float _880 = _854;
        float _882 = _842;
        float _884 = _850;
        float _886 = _828;
        float _888 = _856;
        float _890 = _844;
        bool _892;
        int _940;
        int _950;
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
        int _1158;
        int _1162;
        int _1164;
        int _1168;
        int _1170;
        int _1172;
        float _1176;
        int _1178;
        int _1180;
        do
        {
            int _894 = _866;
            int _896 = as_type<int>(_868);
            int _898 = as_type<int>(_870);
            int _900 = as_type<int>(_872);
            int _902 = as_type<int>(_874);
            int _904 = as_type<int>(_876);
            int _906 = as_type<int>(_878);
            int _908 = as_type<int>(_880);
            int _910 = as_type<int>(_882);
            int _912 = as_type<int>(_884);
            float _914 = _886;
            int _916 = as_type<int>(_888);
            int _918 = as_type<int>(_890);
            uint _920 = uint(int(uint(_858) >> uint(2)));
            uint _922 = uint(int(uint(int(_920)) >> uint(2)));
            int _924 = int(_920) & 3;
            float _926 = (*spvDescriptorSet0.cp_c6)._m0[int(_922)][_924];
            bool _928 = _68 != 0;
            int _930 = _894 + 1;
            bool _932 = uint(_930) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _934 = _896;
            int _936 = as_type<int>(_926);
            int _938 = 31;
            int _2776 = _58(_934, _936, _938, _940, gl_SubgroupInvocationID);
            int _942 = _2776;
            int _944 = _898;
            int _946 = as_type<int>(_926);
            int _948 = 31;
            int _2780 = _58(_944, _946, _948, _950, gl_SubgroupInvocationID);
            int _952 = _2780;
            int _954 = _900;
            int _956 = as_type<int>(_926);
            int _958 = 31;
            int _2784 = _58(_954, _956, _958, _960, gl_SubgroupInvocationID);
            int _962 = _2784;
            int _964 = _902;
            int _966 = as_type<int>(_926);
            int _968 = 31;
            int _2788 = _58(_964, _966, _968, _970, gl_SubgroupInvocationID);
            int _972 = _2788;
            int _974 = _904;
            int _976 = as_type<int>(_926);
            int _978 = 31;
            int _2792 = _58(_974, _976, _978, _980, gl_SubgroupInvocationID);
            int _982 = _2792;
            int _984 = _906;
            int _986 = as_type<int>(_926);
            int _988 = 31;
            int _2796 = _58(_984, _986, _988, _990, gl_SubgroupInvocationID);
            int _992 = _2796;
            int _994 = _908;
            int _996 = as_type<int>(_926);
            int _998 = 31;
            int _2800 = _58(_994, _996, _998, _1000, gl_SubgroupInvocationID);
            int _1002 = _2800;
            int _1004 = _910;
            int _1006 = as_type<int>(_926);
            int _1008 = 31;
            int _2804 = _58(_1004, _1006, _1008, _1010, gl_SubgroupInvocationID);
            int _1012 = _2804;
            int _1014 = _912;
            int _1016 = as_type<int>(_926);
            int _1018 = 31;
            int _2808 = _58(_1014, _1016, _1018, _1020, gl_SubgroupInvocationID);
            int _1022 = _2808;
            int _1024 = as_type<int>(_914);
            int _1026 = as_type<int>(_926);
            int _1028 = 31;
            int _2813 = _58(_1024, _1026, _1028, _1030, gl_SubgroupInvocationID);
            int _1032 = _2813;
            int _1034 = _916;
            int _1036 = as_type<int>(_926);
            int _1038 = 31;
            int _2817 = _58(_1034, _1036, _1038, _1040, gl_SubgroupInvocationID);
            int _1042 = _2817;
            int _1044 = _918;
            int _1046 = as_type<int>(_926);
            int _1048 = 31;
            int _2821 = _58(_1044, _1046, _1048, _1050, gl_SubgroupInvocationID);
            int _1052 = _2821;
            bool _1054 = !_928;
            _866 = _930;
            int _1056 = _896;
            int _1058 = _898;
            int _1060 = _900;
            int _1062 = _902;
            int _1064 = _904;
            int _1066 = _906;
            int _1068 = _908;
            int _1070 = _910;
            int _1072 = _912;
            float _1074 = _914;
            int _1076 = _916;
            int _1078 = _918;
            if (!_1054)
            {
                float _1080 = _854 * as_type<float>(_952);
                float _1082 = _826 * as_type<float>(_952);
                float _1084 = _842 * as_type<float>(_952);
                float _1086 = _846 * as_type<float>(_952);
                float _1088 = fma(_852, as_type<float>(_942), _1080);
                float _1090 = _846 * as_type<float>(_992);
                float _1092 = fma(_824, as_type<float>(_942), _1082);
                float _1094 = _826 * as_type<float>(_992);
                float _1096 = fma(_840, as_type<float>(_942), _1084);
                float _1098 = _854 * as_type<float>(_992);
                float _1100 = _842 * as_type<float>(_992);
                float _1102 = fma(_848, as_type<float>(_982), _1090);
                float _1104 = _842 * as_type<float>(_1032);
                float _1106 = _846 * as_type<float>(_1032);
                float _1108 = fma(_848, as_type<float>(_942), _1086);
                float _1110 = fma(_824, as_type<float>(_982), _1094);
                float _1112 = _826 * as_type<float>(_1032);
                float _1114 = fma(_852, as_type<float>(_982), _1098);
                float _1116 = _854 * as_type<float>(_1032);
                float _1118 = fma(_840, as_type<float>(_982), _1100);
                float _1120 = fma(_840, as_type<float>(_1022), _1104);
                float _1122 = fma(_848, as_type<float>(_1022), _1106);
                float _1124 = fma(_824, as_type<float>(_1022), _1112);
                float _1126 = fma(_850, as_type<float>(_962), _1108);
                float _1128 = fma(_852, as_type<float>(_1022), _1116);
                float _1130 = fma(_828, as_type<float>(_962), _1092);
                float _1132 = fma(_856, as_type<float>(_962), _1088);
                float _1134 = fma(_850, as_type<float>(_1002), _1102);
                float _1136 = fma(_828, as_type<float>(_1002), _1110);
                float _1138 = fma(_856, as_type<float>(_1002), _1114);
                float _1140 = fma(_844, as_type<float>(_962), _1096);
                float _1142 = fma(_844, as_type<float>(_1002), _1118);
                float _1144 = fma(_844, as_type<float>(_1042), _1120);
                float _1146 = fma(_856, as_type<float>(_1042), _1128);
                float _1148 = fma(_850, as_type<float>(_1042), _1122);
                float _1150 = fma(_828, as_type<float>(_1042), _1124);
                float _1152 = as_type<float>(_972) + _1140;
                float _1154 = as_type<float>(_1012) + _1142;
                float _1156 = as_type<float>(_1052) + _1144;
                _1056 = as_type<int>(_1126);
                _1058 = as_type<int>(_1130);
                _1060 = as_type<int>(_1132);
                _1062 = as_type<int>(_1152);
                _1064 = as_type<int>(_1134);
                _1066 = as_type<int>(_1136);
                _1068 = as_type<int>(_1138);
                _1070 = as_type<int>(_1154);
                _1072 = as_type<int>(_1148);
                _1074 = _1150;
                _1076 = as_type<int>(_1146);
                _1078 = as_type<int>(_1156);
            }
            _1158 = _1056;
            int _1160 = _1058;
            _1162 = _1060;
            _1164 = _1062;
            int _1166 = _1064;
            _1168 = _1066;
            _1170 = _1068;
            _1172 = _1070;
            int _1174 = _1072;
            _1176 = _1074;
            _1178 = _1076;
            _1180 = _1078;
            _892 = !_932;
            _868 = as_type<float>(_1158);
            _870 = as_type<float>(_1160);
            _872 = as_type<float>(_1162);
            _874 = as_type<float>(_1164);
            _876 = as_type<float>(_1166);
            _878 = as_type<float>(_1168);
            _880 = as_type<float>(_1170);
            _882 = as_type<float>(_1172);
            _884 = as_type<float>(_1174);
            _886 = _1176;
            _888 = as_type<float>(_1178);
            _890 = as_type<float>(_1180);
            _1182 = as_type<float>(_1160);
            _1184 = as_type<float>(_1166);
            _1186 = as_type<float>(_1174);
        } while (_892);
        _1188 = as_type<float>(_1168);
        _1190 = _1176;
        _1192 = as_type<float>(_1158);
        _1194 = as_type<float>(_1170);
        _1196 = as_type<float>(_1178);
        _1198 = as_type<float>(_1162);
        _862 = as_type<float>(_1172);
        _1200 = as_type<float>(_1180);
        _864 = as_type<float>(_1164);
        _1202 = true;
    }
    else
    {
        _1182 = _824;
        _1188 = _826;
        _1190 = _828;
        _1192 = _848;
        _1184 = _846;
        _1186 = _850;
        _1194 = _854;
        _1196 = _856;
        _1198 = _852;
        _1200 = _844;
    }
    _1202 = false;
    float _1204 = _1182;
    float _1206 = _1188;
    float _1208 = _1190;
    float _1210 = _1192;
    float _1212 = _1184;
    float _1214 = _1186;
    float _1216 = _1194;
    float _1218 = _1196;
    float _1220 = _1198;
    float _1222 = _862;
    float _1224 = _1200;
    float _1226 = _864;
    int _1228 = _858 + 80;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.cp_c6)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
    int _1246 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1248 = _1246 + _68;
    int _1250 = _858 + 64;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    uint _1254 = uint(int(uint(int(_1252)) >> uint(2)));
    int _1256 = int(_1252) & 3;
    float _1258 = (*spvDescriptorSet0.cp_c6)._m0[int(_1254)][_1256];
    int _1260 = int(_1252) + 1;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    int _1264 = _1260 & 3;
    float _1266 = (*spvDescriptorSet0.cp_c6)._m0[int(_1262)][_1264];
    int _1268 = _1248 * 48;
    int _1270 = _858 + 88;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    int _1288 = _858 + 72;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.cp_c6)._m0[int(_1300)][_1302];
    int _1306 = _858 + 104;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    uint _1310 = uint(int(uint(int(_1308)) >> uint(2)));
    int _1312 = int(_1308) & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    int _1316 = int(_1308) + 1;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    int _1320 = _1316 & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    int _1324 = _858 + 96;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    uint _1328 = uint(int(uint(int(_1326)) >> uint(2)));
    int _1330 = int(_1326) & 3;
    float _1332 = (*spvDescriptorSet0.cp_c6)._m0[int(_1328)][_1330];
    int _1334 = int(_1326) + 1;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    int _1338 = _1334 & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    float _1342 = _1204 * _1236;
    float _1344 = _1206 * _1236;
    float _1346 = _1208 * _1236;
    int _1348 = _858 + 16;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.cp_c6)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.cp_c6)._m0[int(_1360)][_1362];
    float _1366 = _1208 * _1244;
    float _1368 = _1206 * _1244;
    float _1370 = fma(_1210, _1258, _1342);
    float _1372 = fma(_1212, _1258, _1344);
    float _1374 = fma(_1214, _1258, _1346);
    float _1376 = _1204 * _1244;
    int _1378 = _858 + 32;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    uint _1382 = uint(int(uint(int(_1380)) >> uint(2)));
    int _1384 = int(_1380) & 3;
    float _1386 = (*spvDescriptorSet0.cp_c6)._m0[int(_1382)][_1384];
    int _1388 = int(_1380) + 1;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    int _1392 = _1388 & 3;
    float _1394 = (*spvDescriptorSet0.cp_c6)._m0[int(_1390)][_1392];
    float _1396 = fma(_1214, _1266, _1366);
    float _1398 = fma(_1212, _1266, _1368);
    float _1400 = fma(_1210, _1266, _1376);
    float _1402 = _1204 * _1278;
    float _1404 = _1204 * _1286;
    float _1406 = _1206 * _1278;
    float _1408 = _1206 * _1286;
    int _1410 = _858 + 48;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.cp_c6)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.cp_c6)._m0[int(_1422)][_1424];
    float _1428 = _1208 * _1278;
    float _1430 = _1208 * _1286;
    float _1432 = fma(_1210, _1296, _1402);
    float _1434 = fma(_1210, _1304, _1404);
    float _1436 = fma(_1212, _1296, _1406);
    float _1438 = fma(_1212, _1304, _1408);
    int _1440 = _858 + 24;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    uint _1444 = uint(int(uint(int(_1442)) >> uint(2)));
    int _1446 = int(_1442) & 3;
    float _1448 = (*spvDescriptorSet0.cp_c6)._m0[int(_1444)][_1446];
    int _1450 = int(_1442) + 1;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    int _1454 = _1450 & 3;
    float _1456 = (*spvDescriptorSet0.cp_c6)._m0[int(_1452)][_1454];
    float _1458 = fma(_1214, _1296, _1428);
    float _1460 = fma(_1214, _1304, _1430);
    float _1462 = fma(_1216, _1322, _1438);
    float _1464 = fma(_1216, _1314, _1436);
    float _1466 = fma(_1218, _1322, _1460);
    float _1468 = fma(_1220, _1314, _1432);
    int _1470 = _858 + 40;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.cp_c6)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.cp_c6)._m0[int(_1482)][_1484];
    float _1488 = _1462 + _1222;
    float _1490 = _1466 + _1224;
    float _1492 = fma(_1220, _1332, _1370);
    float _1494 = fma(_1220, _1322, _1434);
    float _1496 = fma(_1216, _1332, _1372);
    float _1498 = fma(_1216, _1340, _1398);
    int _1500 = _858 + 56;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
    int _1506 = int(_1502) & 3;
    float _1508 = (*spvDescriptorSet0.cp_c6)._m0[int(_1504)][_1506];
    int _1510 = int(_1502) + 1;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    int _1514 = _1510 & 3;
    float _1516 = (*spvDescriptorSet0.cp_c6)._m0[int(_1512)][_1514];
    float _1518 = fma(_1218, _1332, _1374);
    float _1520 = fma(_1220, _1340, _1400);
    float _1522 = fma(_1218, _1314, _1458);
    float _1524 = _1494 + _1226;
    float _1526 = fma(_1218, _1340, _1396);
    float _1528 = _1496 * _1364;
    float _1530 = _1498 * _1364;
    float _1532 = _1464 * _1364;
    float _1534 = _1488 * _1364;
    float _1536 = fma(_1492, _1356, _1528);
    float _1538 = fma(_1520, _1356, _1530);
    float _1540 = fma(_1468, _1356, _1532);
    float _1542 = fma(_1524, _1356, _1534);
    float _1544 = _1488 * _1394;
    float _1546 = _1496 * _1394;
    float _1548 = _1498 * _1394;
    float _1550 = _1464 * _1394;
    float _1552 = fma(_1524, _1386, _1544);
    float _1554 = fma(_1492, _1386, _1546);
    float _1556 = fma(_1520, _1386, _1548);
    float _1558 = fma(_1468, _1386, _1550);
    float _1560 = _1488 * _1426;
    float _1562 = _1496 * _1426;
    float _1564 = _1498 * _1426;
    float _1566 = _1464 * _1426;
    float _1568 = fma(_1524, _1418, _1560);
    float _1570 = fma(_1492, _1418, _1562);
    float _1572 = fma(_1520, _1418, _1564);
    float _1574 = fma(_1468, _1418, _1566);
    float _1576 = fma(_1490, _1448, _1542);
    float _1578 = fma(_1518, _1448, _1536);
    float _1580 = fma(_1526, _1448, _1538);
    float _1582 = fma(_1522, _1448, _1540);
    float _1584 = _1576 + _1456;
    int _1586 = _1268 + 16;
    float _1588 = fma(_1490, _1478, _1552);
    float _1590 = fma(_1526, _1478, _1556);
    float _1592 = fma(_1518, _1478, _1554);
    float _1594 = fma(_1522, _1478, _1558);
    float _1596 = _1588 + _1486;
    int _1598 = _1268 + 32;
    uint _1600 = uint(int(uint(_1586) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1600)] = as_type<uint>(_1578);
    int _1602 = _1586 + 4;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1604)] = as_type<uint>(_1580);
    int _1606 = _1586 + 8;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1608)] = as_type<uint>(_1582);
    int _1610 = _1586 + 12;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1612)] = as_type<uint>(_1584);
    int _1614 = _1268 + 48;
    float _1616 = fma(_1490, _1508, _1568);
    float _1618 = fma(_1518, _1508, _1570);
    float _1620 = fma(_1526, _1508, _1572);
    float _1622 = fma(_1522, _1508, _1574);
    float _1624 = _1616 + _1516;
    uint _1626 = uint(int(uint(_1598) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1626)] = as_type<uint>(_1592);
    int _1628 = _1598 + 4;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1630)] = as_type<uint>(_1590);
    int _1632 = _1598 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1634)] = as_type<uint>(_1594);
    int _1636 = _1598 + 12;
    uint _1638 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1638)] = as_type<uint>(_1596);
    uint _1640 = uint(int(uint(_1614) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1640)] = as_type<uint>(_1618);
    int _1642 = _1614 + 4;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1644)] = as_type<uint>(_1620);
    int _1646 = _1614 + 8;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1648)] = as_type<uint>(_1622);
    int _1650 = _1614 + 12;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1652)] = as_type<uint>(_1624);
}

