#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
int _60(thread const int& _4570, thread const int& _4571, constant _10& support_buffer)
{
    int _4574 = 1 + _4571;
    float _4576 = support_buffer._m5[_4574].x;
    bool _4578 = _4576 == 1.0;
    if (_4578)
    {
        return _4570;
    }
    float _4580 = float(_4570);
    float _4582 = _4580 * _4576;
    int _4584 = int(_4582);
    return _4584;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4258, thread const int& _4259, thread const int& _4260, thread const int& _4261, thread int& _4262, thread int& _4263, thread int& _4264, thread int& _4265, thread int& _4266, thread int& _4267)
{
    float _4270 = as_type<float>(_4259) + 0.0;
    bool _4272 = _4270 != 0.0;
    bool _4274 = isnan(_4270);
    bool _4276 = _4272 || _4274;
    bool _4278 = isnan(0.0);
    bool _4280 = _4276 || _4278;
    int _4282 = as_type<int>(_4270);
    int _4284 = _4259;
    int _4286 = _4261;
    int _4288 = _4280 ? (-1) : 0;
    if (!_4280)
    {
        float _4290 = as_type<float>(_4259) * 1.0;
        _4282 = as_type<int>(_4290);
    }
    int _4292 = _4282;
    bool _4294 = !_4280;
    int _4296 = _4292;
    if (!_4294)
    {
        float _4298 = as_type<float>(_4259) + 0.0;
        bool _4300 = _4298 >= 0.0;
        bool _4302 = isnan(_4298);
        bool _4304 = _4300 || _4302;
        bool _4306 = isnan(0.0);
        bool _4308 = _4304 || _4306;
        int _4310 = as_type<int>(_4298);
        _4288 = _4308 ? (-1) : 0;
        if (!_4308)
        {
            _4310 = 2147483647;
        }
        int _4312 = _4310;
        bool _4314 = !_4308;
        _4296 = _4312;
        if (!_4314)
        {
            float _4316 = as_type<float>(_4259) + 0.0;
            bool _4318 = _4316 > as_type<float>(0x7f800000u /* inf */);
            bool _4320 = isnan(_4316);
            bool _4322 = _4318 || _4320;
            bool _4324 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4326 = _4322 || _4324;
            int _4328 = as_type<int>(_4316);
            _4288 = _4326 ? (-1) : 0;
            if (_4326)
            {
                float _4330 = as_type<float>(_4259) + 1.0;
                _4328 = as_type<int>(_4330);
            }
            int _4332 = _4328;
            _4296 = _4332;
            if (!_4326)
            {
                float _4334 = 0.0 + as_type<float>(_4259);
                bool _4336 = _4334 != as_type<float>(0x7f800000u /* inf */);
                bool _4338 = isnan(_4334);
                bool _4340 = _4336 || _4338;
                bool _4342 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4344 = _4340 || _4342;
                int _4346 = as_type<int>(_4334);
                _4288 = _4344 ? (-1) : 0;
                if (!_4344)
                {
                    _4346 = _4259;
                }
                int _4348 = _4346;
                bool _4350 = !_4344;
                _4296 = _4348;
                if (!_4350)
                {
                    float _4352 = as_type<float>(_4259) * 18446744073709551616.0;
                    float _4354 = rsqrt(_4352);
                    float _4356 = _4352 * _4354;
                    float _4358 = _4354 * 0.5;
                    float _4360 = -_4356;
                    float _4362 = 0.0 + _4360;
                    float _4364 = fma(_4358, _4362, 0.5);
                    float _4366 = fma(_4356, _4364, _4356);
                    float _4368 = -_4366;
                    float _4370 = 0.0 + _4368;
                    float _4372 = fma(_4366, _4370, _4352);
                    float _4374 = fma(_4358, _4372, _4366);
                    float _4376 = _4374 * 2.3283064365386962890625e-10;
                    _4296 = as_type<int>(_4376);
                    _4284 = as_type<int>(_4352);
                    _4286 = as_type<int>(_4366);
                }
            }
        }
    }
    int _4378 = _4296;
    int _4380 = _4284;
    int _4382 = _4286;
    int _4384 = _4288;
    _4262 = _4378;
    _4263 = _4260;
    _4264 = 0;
    _4265 = _4380;
    _4266 = _4382;
    _4267 = _4384;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1178 = false;
    bool _472 = false;
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
    int _117 = _60(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_85);
    int _121 = 0;
    int _123 = _60(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1776 = int3(_117, _123, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1776.xy), uint(_1776.z), 0).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    int _136 = _70;
    int _138 = 0;
    int _140 = _60(_136, _138, (*spvDescriptorSet0.support_buffer));
    int _142 = as_type<int>(_93);
    int _144 = 0;
    int _146 = _60(_142, _144, (*spvDescriptorSet0.support_buffer));
    int3 _1796 = int3(_140, _146, 1);
    float4 _148 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1796.xy), uint(_1796.z), 0).xyzw;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    float _156 = _148.w;
    int _158 = _70;
    int _160 = 0;
    int _162 = _60(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = as_type<int>(_85);
    int _166 = 0;
    int _168 = _60(_164, _166, (*spvDescriptorSet0.support_buffer));
    int3 _1816 = int3(_162, _168, 0);
    float3 _172 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1816.xy), uint(_1816.z), 0).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    int _180 = _70;
    int _182 = 0;
    int _184 = _60(_180, _182, (*spvDescriptorSet0.support_buffer));
    int _186 = as_type<int>(_93);
    int _188 = 0;
    int _190 = _60(_186, _188, (*spvDescriptorSet0.support_buffer));
    int3 _1834 = int3(_184, _190, 0);
    float3 _192 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1834.xy), uint(_1834.z), 0).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    int _200 = _70;
    int _202 = 1;
    int _204 = _60(_200, _202, (*spvDescriptorSet0.support_buffer));
    int _206 = as_type<int>(_103);
    int _208 = 1;
    int _210 = _60(_206, _208, (*spvDescriptorSet0.support_buffer));
    int3 _1852 = int3(_204, _210, 1);
    float4 _212 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1852.xy), uint(_1852.z), 0).xyzw;
    float _214 = _212.x;
    float _216 = _212.y;
    float _218 = _212.z;
    float _220 = _212.w;
    int _222 = _70;
    int _224 = 1;
    int _226 = _60(_222, _224, (*spvDescriptorSet0.support_buffer));
    int _228 = as_type<int>(_111);
    int _230 = 1;
    int _232 = _60(_228, _230, (*spvDescriptorSet0.support_buffer));
    int3 _1872 = int3(_226, _232, 1);
    float4 _234 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1872.xy), uint(_1872.z), 0).xyzw;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = _234.z;
    float _242 = _234.w;
    int _244 = _70;
    int _246 = 0;
    int _248 = _60(_244, _246, (*spvDescriptorSet0.support_buffer));
    int _250 = as_type<int>(_85);
    int _252 = 0;
    int _254 = _60(_250, _252, (*spvDescriptorSet0.support_buffer));
    int3 _1892 = int3(_248, _254, 2);
    float3 _256 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1892.xy), uint(_1892.z), 0).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    int _264 = _70;
    int _266 = 0;
    int _268 = _60(_264, _266, (*spvDescriptorSet0.support_buffer));
    int _270 = as_type<int>(_93);
    int _272 = 0;
    int _274 = _60(_270, _272, (*spvDescriptorSet0.support_buffer));
    int3 _1910 = int3(_268, _274, 2);
    float3 _276 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1910.xy), uint(_1910.z), 0).xyz;
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
    float _304 = -_128;
    float _306 = _304 + _150;
    float _308 = -_130;
    float _310 = _308 + _152;
    float _312 = -_176;
    float _314 = _312 + _196;
    float _316 = -_132;
    float _318 = _316 + _154;
    float _320 = -_134;
    float _322 = _320 + _156;
    float _324 = fma(_310, _292, _130);
    float _326 = -_174;
    float _328 = _326 + _194;
    float _330 = fma(_314, _292, _176);
    float _332 = -_216;
    float _334 = _332 + _238;
    float _336 = fma(_318, _292, _132);
    float _338 = fma(_328, _292, _174);
    float _340 = -_214;
    float _342 = _340 + _236;
    float _344 = fma(_334, _302, _216);
    float _346 = fma(_306, _292, _128);
    float _348 = -_218;
    float _350 = _348 + _240;
    float _352 = fma(_342, _302, _214);
    float _354 = _324 * _344;
    float _356 = -_220;
    float _358 = _356 + _242;
    float _360 = fma(_350, _302, _218);
    float _362 = fma(_322, _292, _134);
    float _364 = fma(_346, _352, _354);
    float _366 = fma(_358, _302, _220);
    float _368 = -_178;
    float _370 = _368 + _198;
    float _372 = fma(_336, _360, _364);
    float _374 = fma(_370, _292, _178);
    float _376 = fma(_362, _366, _372);
    float _378 = precise::max(_376, -1.0);
    float _380 = precise::min(_378, 1.0);
    bool _382 = _380 >= 0.0;
    bool _384 = isnan(_380);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    bool _392 = !_390;
    float _394 = -_380;
    float _396 = _392 ? _394 : _380;
    float _398 = -_258;
    float _400 = _398 + _278;
    float _402 = -_262;
    float _404 = _402 + _282;
    bool _406 = _396 < 0.0;
    float _408 = float(_406);
    float _410 = abs(_396);
    float _412 = -_410;
    float _414 = _412 + 1.0;
    float _416 = abs(_396);
    float _418 = fma(_416, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _420 = fma(_400, _292, _258);
    float _422 = fma(_404, _292, _262);
    int _424 = as_type<int>(_414) + (-218103808);
    float _426 = abs(_396);
    float _428 = fma(_426, _418, -0.212114393711090087890625);
    bool _430 = uint(_424) >= 1920991232u;
    float _432 = -_260;
    float _434 = _432 + _280;
    float _436 = abs(_396);
    float _438 = fma(_436, _428, 1.570728778839111328125);
    float _440 = fma(_434, _292, _260);
    bool _442 = !_430;
    float _444 = _440;
    float _446 = _420;
    float _468;
    float _470;
    if (!_442)
    {
        int _448 = as_type<int>(_396);
        int _450 = as_type<int>(_414);
        int _452 = 1248;
        int _454 = as_type<int>(_280);
        int _456;
        int _458;
        int _460;
        int _462;
        int _464;
        int _466;
        _58(_448, _450, _452, _454, _456, _458, _460, _462, _464, _466);
        _468 = as_type<float>(_456);
        _470 = as_type<float>(_458);
        _472 = true;
    }
    else
    {
        float _474 = rsqrt(_414);
        float _476 = _414 * _474;
        float _478 = _474 * 0.5;
        float _480 = -_476;
        float _482 = 0.0 + _480;
        float _484 = fma(_478, _482, 0.5);
        float _486 = fma(_476, _484, _476);
        float _488 = -_486;
        float _490 = 0.0 + _488;
        float _492 = fma(_486, _490, _414);
        float _494 = fma(_478, _492, _486);
        _468 = _494;
        _470 = _482;
    }
    _472 = false;
    float _496 = _468;
    float _498 = _470;
    int _500 = _76 + 8;
    uint _502 = uint(int(uint(_500) >> uint(2)));
    uint _504 = uint(int(uint(int(_502)) >> uint(2)));
    int _506 = int(_502) & 3;
    float _508 = (*spvDescriptorSet0.cp_c5)._m0[int(_504)][_506];
    int _510 = int(_502) + 1;
    uint _512 = uint(int(uint(_510) >> uint(2)));
    int _514 = _510 & 3;
    float _516 = (*spvDescriptorSet0.cp_c5)._m0[int(_512)][_514];
    int _518 = _70;
    int _520 = 1;
    int _522 = _60(_518, _520, (*spvDescriptorSet0.support_buffer));
    int _524 = as_type<int>(_508);
    int _526 = 1;
    int _528 = _60(_524, _526, (*spvDescriptorSet0.support_buffer));
    int3 _2255 = int3(_522, _528, 0);
    float3 _530 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2255.xy), uint(_2255.z), 0).xyz;
    float _532 = _530.x;
    float _534 = _530.y;
    float _536 = _530.z;
    int _538 = _70;
    int _540 = 1;
    int _542 = _60(_538, _540, (*spvDescriptorSet0.support_buffer));
    int _544 = as_type<int>(_508);
    int _546 = 1;
    int _548 = _60(_544, _546, (*spvDescriptorSet0.support_buffer));
    int3 _2273 = int3(_542, _548, 2);
    float3 _550 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2273.xy), uint(_2273.z), 0).xyz;
    float _552 = _550.x;
    float _554 = _550.y;
    float _556 = _550.z;
    int _558 = _70;
    int _560 = 1;
    int _562 = _60(_558, _560, (*spvDescriptorSet0.support_buffer));
    int _564 = as_type<int>(_516);
    int _566 = 1;
    int _568 = _60(_564, _566, (*spvDescriptorSet0.support_buffer));
    int3 _2291 = int3(_562, _568, 0);
    float3 _570 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2291.xy), uint(_2291.z), 0).xyz;
    float _572 = _570.x;
    float _574 = _570.y;
    float _576 = _570.z;
    int _578 = _70;
    int _580 = 1;
    int _582 = _60(_578, _580, (*spvDescriptorSet0.support_buffer));
    int _584 = as_type<int>(_516);
    int _586 = 1;
    int _588 = _60(_584, _586, (*spvDescriptorSet0.support_buffer));
    int3 _2309 = int3(_582, _588, 2);
    float3 _590 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2309.xy), uint(_2309.z), 0).xyz;
    float _592 = _590.x;
    float _594 = _590.y;
    float _596 = _590.z;
    float _598 = _438 * _496;
    float _600 = _408 * 2.0;
    float _602 = -_600;
    float _604 = fma(_598, _602, _598);
    float _606 = fma(_408, 3.1415927410125732421875, _604);
    float _608 = _606 * 0.15915493667125701904296875;
    float _610 = _608 * 6.283185482025146484375;
    float _612 = sin(_610);
    float _614 = abs(_612);
    bool _616 = _614 >= 0.001000000047497451305389404296875;
    bool _618 = isnan(_614);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.001000000047497451305389404296875);
    bool _624 = _620 || _622;
    float _626 = _262;
    float _628 = _498;
    float _630 = _598;
    if (!_624)
    {
        int _632 = _76 + 28;
        uint _634 = uint(int(uint(_632) >> uint(2)));
        uint _636 = uint(int(uint(int(_634)) >> uint(2)));
        int _638 = int(_634) & 3;
        float _640 = (*spvDescriptorSet0.cp_c5)._m0[int(_636)][_638];
        _626 = _640;
    }
    float _642 = _626;
    float _644 = _642;
    if (!_624)
    {
        float _646 = -_642;
        float _648 = _646 + 1.0;
        _628 = _648;
    }
    float _650 = _628;
    float _652 = _650;
    if (!_624)
    {
        _630 = _642;
    }
    float _654 = _630;
    bool _656 = !_624;
    float _658 = _654;
    float _660 = _556;
    if (!_656)
    {
        int _662 = _76 + 28;
        uint _664 = uint(int(uint(_662) >> uint(2)));
        uint _666 = uint(int(uint(int(_664)) >> uint(2)));
        int _668 = int(_664) & 3;
        float _670 = (*spvDescriptorSet0.cp_c5)._m0[int(_666)][_668];
        float _672 = 1.0 / _612;
        float _674 = _606 * _670;
        float _676 = _674 * 0.15915493667125701904296875;
        float _678 = -_674;
        float _680 = _606 + _678;
        float _682 = _680 * 0.15915493667125701904296875;
        float _684 = _676 * 6.283185482025146484375;
        float _686 = sin(_684);
        float _688 = _682 * 6.283185482025146484375;
        float _690 = sin(_688);
        float _692 = _686 * _672;
        float _694 = _690 * _672;
        _658 = _692;
        _652 = _694;
        _644 = _670;
    }
    float _696 = _658;
    float _698 = _652;
    float _700 = _644;
    bool _702 = !_390;
    float _704 = -_696;
    float _706 = _702 ? _704 : _696;
    int _708 = _76 + 24;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.cp_c5)._m0[int(_712)][_714];
    float _718 = -_532;
    float _720 = _718 + _572;
    float _722 = -_536;
    float _724 = _722 + _576;
    float _726 = -_556;
    float _728 = _726 + _596;
    float _730 = _366 * _706;
    float _732 = _352 * _706;
    float _734 = _360 * _706;
    float _736 = _344 * _706;
    float _738 = fma(_362, _698, _730);
    int _740 = _76 + 20;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.cp_c5)._m0[int(_744)][_746];
    float _750 = fma(_346, _698, _732);
    float _752 = fma(_336, _698, _734);
    float _754 = _738 * 2.0;
    float _756 = fma(_324, _698, _736);
    float _758 = _750 * 2.0;
    bool _760 = _70 != 0;
    float _762 = _752 * _754;
    float _764 = _756 * _754;
    float _766 = _756 * 2.0;
    float _768 = _750 * _754;
    float _770 = -_762;
    float _772 = fma(_756, _758, _770);
    float _774 = fma(_752, _758, _764);
    float _776 = fma(_756, _758, _762);
    float _778 = -_764;
    float _780 = fma(_752, _758, _778);
    float _782 = _750 * _750;
    float _784 = _756 * _756;
    float _786 = -_534;
    float _788 = _786 + _574;
    float _790 = -_768;
    float _792 = fma(_752, _766, _790);
    float _794 = fma(_752, _766, _768);
    float _796 = fma(_782, -2.0, 1.0);
    float _798 = fma(_720, _716, _532);
    float _800 = _752 * _752;
    float _802 = fma(_784, -2.0, 1.0);
    float _804 = fma(_788, _716, _534);
    float _806 = fma(_724, _716, _536);
    float _808 = _798 * _700;
    float _810 = fma(_800, -2.0, _802);
    float _812 = _804 * _700;
    float _814 = fma(_800, -2.0, _796);
    float _816 = fma(_784, -2.0, _796);
    float _818 = -_552;
    float _820 = _818 + _592;
    float _822 = -_554;
    float _824 = _822 + _594;
    float _826 = _806 * _700;
    float _828 = fma(_338, _748, _808);
    float _830 = fma(_330, _748, _812);
    float _832 = fma(_820, _716, _552);
    float _834 = fma(_824, _716, _554);
    float _836 = fma(_728, _716, _556);
    float _838 = fma(_374, _748, _826);
    float _840 = _776 * _828;
    float _842 = _810 * _828;
    float _844 = _772 * _830;
    float _846 = _814 * _830;
    float _848 = _780 * _828;
    float _850 = _794 * _830;
    float _852 = _832 * _700;
    float _854 = _834 * _700;
    float _856 = _836 * _700;
    float _858 = _774 * _838;
    float _860 = _792 * _838;
    float _862 = _816 * _838;
    float _864 = fma(_420, _748, _852);
    int _866 = _70 * 48;
    float _868 = fma(_440, _748, _854);
    float _870 = fma(_422, _748, _856);
    int _872 = _70 * 112;
    uint _874 = uint(int(uint(_866) >> uint(2)));
    _39[int(_874)] = as_type<uint>(_842);
    int _876 = _866 + 4;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    _39[int(_878)] = as_type<uint>(_844);
    int _880 = _866 + 8;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    _39[int(_882)] = as_type<uint>(_858);
    int _884 = _866 + 12;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    _39[int(_886)] = as_type<uint>(_864);
    int _888 = _866 + 16;
    int _890 = _866 + 32;
    int _892 = _866 + 16;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    _39[int(_894)] = as_type<uint>(_840);
    int _896 = _866 + 20;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    _39[int(_898)] = as_type<uint>(_846);
    int _900 = _866 + 24;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    _39[int(_902)] = as_type<uint>(_860);
    int _904 = _866 + 28;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    _39[int(_906)] = as_type<uint>(_868);
    float _908 = _808;
    float _910 = _840;
    float _912 = _846;
    float _914 = _860;
    float _916 = _868;
    float _918 = _848;
    float _920 = _850;
    float _922 = _862;
    float _924 = _870;
    if (!_760)
    {
        _444 = _864;
    }
    float _926 = _444;
    float _928 = _926;
    if (!_760)
    {
        _660 = _842;
    }
    float _930 = _660;
    int _932 = _866 + 32;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    _39[int(_934)] = as_type<uint>(_848);
    int _936 = _866 + 36;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    _39[int(_938)] = as_type<uint>(_850);
    int _940 = _866 + 40;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    _39[int(_942)] = as_type<uint>(_862);
    int _944 = _866 + 44;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    _39[int(_946)] = as_type<uint>(_870);
    float _948 = _930;
    if (!_760)
    {
        _908 = _844;
    }
    float _950 = _908;
    float _952 = _950;
    if (!_760)
    {
        _446 = _858;
    }
    float _954 = _446;
    bool _956 = !_760;
    float _958 = _954;
    if (!_956)
    {
        bool _960 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _962 = !_960;
        if (!_962)
        {
            uint _964 = uint(int(uint(_872) >> uint(2)));
            uint _966 = uint(int(uint(int(_964)) >> uint(2)));
            int _968 = int(_964) & 3;
            float _970 = (*spvDescriptorSet0.cp_c6)._m0[int(_966)][_968];
            int _972 = as_type<int>(_970) * 48;
            int _974 = 0;
            bool _976;
            float _1072;
            float _1074;
            float _1078;
            float _1086;
            float _1092;
            float _1098;
            float _1104;
            float _1120;
            float _1124;
            float _1126;
            float _1128;
            float _1130;
            do
            {
                int _978 = _974;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _980 = uint(int(uint(_972) >> uint(2)));
                float _982 = as_type<float>(_39[int(_980)]);
                int _984 = _972 + 4;
                uint _986 = uint(int(uint(_984) >> uint(2)));
                float _988 = as_type<float>(_39[int(_986)]);
                int _990 = _972 + 8;
                uint _992 = uint(int(uint(_990) >> uint(2)));
                float _994 = as_type<float>(_39[int(_992)]);
                int _996 = _972 + 12;
                uint _998 = uint(int(uint(_996) >> uint(2)));
                float _1000 = as_type<float>(_39[int(_998)]);
                int _1002 = _978 + 1;
                int _1004 = _972 + 16;
                uint _1006 = uint(int(uint(_1004) >> uint(2)));
                float _1008 = as_type<float>(_39[int(_1006)]);
                int _1010 = _972 + 20;
                uint _1012 = uint(int(uint(_1010) >> uint(2)));
                float _1014 = as_type<float>(_39[int(_1012)]);
                int _1016 = _972 + 24;
                uint _1018 = uint(int(uint(_1016) >> uint(2)));
                float _1020 = as_type<float>(_39[int(_1018)]);
                int _1022 = _972 + 28;
                uint _1024 = uint(int(uint(_1022) >> uint(2)));
                float _1026 = as_type<float>(_39[int(_1024)]);
                bool _1028 = uint(_1002) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1030 = _972 + 32;
                uint _1032 = uint(int(uint(_1030) >> uint(2)));
                float _1034 = as_type<float>(_39[int(_1032)]);
                int _1036 = _972 + 36;
                uint _1038 = uint(int(uint(_1036) >> uint(2)));
                float _1040 = as_type<float>(_39[int(_1038)]);
                int _1042 = _972 + 40;
                uint _1044 = uint(int(uint(_1042) >> uint(2)));
                float _1046 = as_type<float>(_39[int(_1044)]);
                int _1048 = _972 + 44;
                uint _1050 = uint(int(uint(_1048) >> uint(2)));
                float _1052 = as_type<float>(_39[int(_1050)]);
                float _1054 = _868 * _988;
                float _1056 = _840 * _988;
                float _1058 = _846 * _988;
                float _1060 = _860 * _988;
                float _1062 = fma(_864, _982, _1054);
                float _1064 = fma(_842, _982, _1056);
                float _1066 = fma(_844, _982, _1058);
                float _1068 = fma(_858, _982, _1060);
                float _1070 = fma(_870, _994, _1062);
                _1072 = fma(_848, _994, _1064);
                _1074 = fma(_850, _994, _1066);
                float _1076 = _840 * _1014;
                _1078 = _1000 + _1070;
                float _1080 = _868 * _1014;
                float _1082 = _846 * _1014;
                float _1084 = fma(_842, _1008, _1076);
                _1086 = fma(_862, _994, _1068);
                float _1088 = fma(_864, _1008, _1080);
                float _1090 = fma(_844, _1008, _1082);
                _1092 = fma(_848, _1020, _1084);
                float _1094 = _860 * _1014;
                float _1096 = fma(_870, _1020, _1088);
                _1098 = fma(_850, _1020, _1090);
                float _1100 = _840 * _1040;
                float _1102 = _846 * _1040;
                _1104 = _1026 + _1096;
                float _1106 = _868 * _1040;
                float _1108 = _860 * _1040;
                float _1110 = fma(_858, _1008, _1094);
                float _1112 = fma(_842, _1034, _1100);
                float _1114 = fma(_864, _1034, _1106);
                float _1116 = fma(_844, _1034, _1102);
                float _1118 = fma(_858, _1034, _1108);
                _1120 = fma(_862, _1020, _1110);
                float _1122 = fma(_870, _1046, _1114);
                _1124 = fma(_848, _1046, _1112);
                _1126 = fma(_850, _1046, _1116);
                _1128 = fma(_862, _1046, _1118);
                _1130 = _1052 + _1122;
                uint _1132 = uint(int(uint(_866) >> uint(2)));
                _39[int(_1132)] = as_type<uint>(_1072);
                int _1134 = _866 + 4;
                uint _1136 = uint(int(uint(_1134) >> uint(2)));
                _39[int(_1136)] = as_type<uint>(_1074);
                int _1138 = _866 + 8;
                uint _1140 = uint(int(uint(_1138) >> uint(2)));
                _39[int(_1140)] = as_type<uint>(_1086);
                int _1142 = _866 + 12;
                uint _1144 = uint(int(uint(_1142) >> uint(2)));
                _39[int(_1144)] = as_type<uint>(_1078);
                int _1146 = _866 + 16;
                uint _1148 = uint(int(uint(_1146) >> uint(2)));
                _39[int(_1148)] = as_type<uint>(_1092);
                int _1150 = _866 + 20;
                uint _1152 = uint(int(uint(_1150) >> uint(2)));
                _39[int(_1152)] = as_type<uint>(_1098);
                int _1154 = _866 + 24;
                uint _1156 = uint(int(uint(_1154) >> uint(2)));
                _39[int(_1156)] = as_type<uint>(_1120);
                int _1158 = _866 + 28;
                uint _1160 = uint(int(uint(_1158) >> uint(2)));
                _39[int(_1160)] = as_type<uint>(_1104);
                int _1162 = _866 + 32;
                uint _1164 = uint(int(uint(_1162) >> uint(2)));
                _39[int(_1164)] = as_type<uint>(_1124);
                int _1166 = _866 + 36;
                uint _1168 = uint(int(uint(_1166) >> uint(2)));
                _39[int(_1168)] = as_type<uint>(_1126);
                int _1170 = _866 + 40;
                uint _1172 = uint(int(uint(_1170) >> uint(2)));
                _39[int(_1172)] = as_type<uint>(_1128);
                int _1174 = _866 + 44;
                uint _1176 = uint(int(uint(_1174) >> uint(2)));
                _39[int(_1176)] = as_type<uint>(_1130);
                _976 = !_1028;
                _974 = _1002;
            } while (_976);
            _948 = _1072;
            _952 = _1074;
            _958 = _1086;
            _928 = _1078;
            _910 = _1092;
            _912 = _1098;
            _914 = _1120;
            _916 = _1104;
            _918 = _1124;
            _920 = _1126;
            _922 = _1128;
            _924 = _1130;
            _1178 = true;
        }
        else
        {
            _948 = 0.0;
            _952 = 0.0;
            _958 = 0.0;
            _928 = 0.0;
            _910 = 0.0;
            _912 = 0.0;
            _914 = 0.0;
            _916 = 0.0;
            _918 = 0.0;
            _920 = 0.0;
            _922 = 0.0;
            _924 = 0.0;
        }
    }
    _1178 = false;
    float _1180 = _948;
    float _1182 = _952;
    float _1184 = _958;
    float _1186 = _928;
    float _1188 = _910;
    float _1190 = _912;
    float _1192 = _914;
    float _1194 = _916;
    float _1196 = _918;
    float _1198 = _920;
    float _1200 = _922;
    float _1202 = _924;
    int _1204 = _872 + 80;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.cp_c6)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.cp_c6)._m0[int(_1216)][_1218];
    bool _1222 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1224 = _872 + 64;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    uint _1228 = uint(int(uint(int(_1226)) >> uint(2)));
    int _1230 = int(_1226) & 3;
    float _1232 = (*spvDescriptorSet0.cp_c6)._m0[int(_1228)][_1230];
    int _1234 = int(_1226) + 1;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    int _1238 = _1234 & 3;
    float _1240 = (*spvDescriptorSet0.cp_c6)._m0[int(_1236)][_1238];
    int _1242 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1244 = _1242 + _70;
    int _1246 = _872 + 88;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    uint _1250 = uint(int(uint(int(_1248)) >> uint(2)));
    int _1252 = int(_1248) & 3;
    float _1254 = (*spvDescriptorSet0.cp_c6)._m0[int(_1250)][_1252];
    int _1256 = int(_1248) + 1;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    int _1260 = _1256 & 3;
    float _1262 = (*spvDescriptorSet0.cp_c6)._m0[int(_1258)][_1260];
    int _1264 = _872 + 72;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    uint _1268 = uint(int(uint(int(_1266)) >> uint(2)));
    int _1270 = int(_1266) & 3;
    float _1272 = (*spvDescriptorSet0.cp_c6)._m0[int(_1268)][_1270];
    int _1274 = int(_1266) + 1;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    int _1278 = _1274 & 3;
    float _1280 = (*spvDescriptorSet0.cp_c6)._m0[int(_1276)][_1278];
    int _1282 = _872 + 96;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    uint _1286 = uint(int(uint(int(_1284)) >> uint(2)));
    int _1288 = int(_1284) & 3;
    float _1290 = (*spvDescriptorSet0.cp_c6)._m0[int(_1286)][_1288];
    int _1292 = int(_1284) + 1;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    int _1296 = _1292 & 3;
    float _1298 = (*spvDescriptorSet0.cp_c6)._m0[int(_1294)][_1296];
    int _1300 = _872 + 104;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
    int _1306 = int(_1302) & 3;
    float _1308 = (*spvDescriptorSet0.cp_c6)._m0[int(_1304)][_1306];
    int _1310 = int(_1302) + 1;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    int _1314 = _1310 & 3;
    float _1316 = (*spvDescriptorSet0.cp_c6)._m0[int(_1312)][_1314];
    int _1318 = _872 + 16;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    uint _1322 = uint(int(uint(int(_1320)) >> uint(2)));
    int _1324 = int(_1320) & 3;
    float _1326 = (*spvDescriptorSet0.cp_c6)._m0[int(_1322)][_1324];
    int _1328 = int(_1320) + 1;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    int _1332 = _1328 & 3;
    float _1334 = (*spvDescriptorSet0.cp_c6)._m0[int(_1330)][_1332];
    if (!_1222)
    {
        uint _1336 = uint(int(uint(_866) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1336)] = as_type<uint>(_1180);
        int _1338 = _866 + 4;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1340)] = as_type<uint>(_1182);
        int _1342 = _866 + 8;
        uint _1344 = uint(int(uint(_1342) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1344)] = as_type<uint>(_1184);
        int _1346 = _866 + 12;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1348)] = as_type<uint>(_1186);
        uint _1350 = uint(int(uint(_888) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1350)] = as_type<uint>(_1188);
        int _1352 = _888 + 4;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1354)] = as_type<uint>(_1190);
        int _1356 = _888 + 8;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1358)] = as_type<uint>(_1192);
        int _1360 = _888 + 12;
        uint _1362 = uint(int(uint(_1360) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1362)] = as_type<uint>(_1194);
        uint _1364 = uint(int(uint(_890) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1364)] = as_type<uint>(_1196);
        int _1366 = _890 + 4;
        uint _1368 = uint(int(uint(_1366) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1368)] = as_type<uint>(_1198);
        int _1370 = _890 + 8;
        uint _1372 = uint(int(uint(_1370) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1372)] = as_type<uint>(_1200);
        int _1374 = _890 + 12;
        uint _1376 = uint(int(uint(_1374) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1376)] = as_type<uint>(_1202);
    }
    float _1378 = _1190 * _1212;
    float _1380 = _1198 * _1212;
    int _1382 = _872 + 32;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    uint _1386 = uint(int(uint(int(_1384)) >> uint(2)));
    int _1388 = int(_1384) & 3;
    float _1390 = (*spvDescriptorSet0.cp_c6)._m0[int(_1386)][_1388];
    int _1392 = int(_1384) + 1;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    int _1396 = _1392 & 3;
    float _1398 = (*spvDescriptorSet0.cp_c6)._m0[int(_1394)][_1396];
    float _1400 = _1182 * _1212;
    float _1402 = fma(_1188, _1232, _1378);
    float _1404 = fma(_1196, _1232, _1380);
    float _1406 = _1182 * _1220;
    float _1408 = _1190 * _1220;
    float _1410 = _1198 * _1220;
    float _1412 = _1182 * _1262;
    int _1414 = _872 + 48;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    uint _1418 = uint(int(uint(int(_1416)) >> uint(2)));
    int _1420 = int(_1416) & 3;
    float _1422 = (*spvDescriptorSet0.cp_c6)._m0[int(_1418)][_1420];
    int _1424 = int(_1416) + 1;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    int _1428 = _1424 & 3;
    float _1430 = (*spvDescriptorSet0.cp_c6)._m0[int(_1426)][_1428];
    float _1432 = fma(_1180, _1240, _1406);
    float _1434 = fma(_1188, _1240, _1408);
    float _1436 = fma(_1196, _1240, _1410);
    float _1438 = _1182 * _1254;
    float _1440 = _1190 * _1254;
    float _1442 = _1190 * _1262;
    float _1444 = _1198 * _1254;
    float _1446 = _1198 * _1262;
    int _1448 = _872 + 24;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.cp_c6)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.cp_c6)._m0[int(_1460)][_1462];
    float _1466 = fma(_1180, _1272, _1438);
    float _1468 = fma(_1180, _1280, _1412);
    float _1470 = fma(_1188, _1272, _1440);
    float _1472 = fma(_1188, _1280, _1442);
    float _1474 = fma(_1196, _1272, _1444);
    float _1476 = fma(_1196, _1280, _1446);
    float _1478 = fma(_1184, _1298, _1432);
    int _1480 = _872 + 40;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    uint _1484 = uint(int(uint(int(_1482)) >> uint(2)));
    int _1486 = int(_1482) & 3;
    float _1488 = (*spvDescriptorSet0.cp_c6)._m0[int(_1484)][_1486];
    int _1490 = int(_1482) + 1;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    int _1494 = _1490 & 3;
    float _1496 = (*spvDescriptorSet0.cp_c6)._m0[int(_1492)][_1494];
    float _1498 = fma(_1192, _1290, _1402);
    float _1500 = fma(_1192, _1298, _1434);
    float _1502 = fma(_1192, _1308, _1470);
    float _1504 = fma(_1192, _1316, _1472);
    float _1506 = fma(_1184, _1316, _1468);
    float _1508 = fma(_1200, _1316, _1476);
    float _1510 = fma(_1180, _1232, _1400);
    int _1512 = _872 + 56;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    uint _1516 = uint(int(uint(int(_1514)) >> uint(2)));
    int _1518 = int(_1514) & 3;
    float _1520 = (*spvDescriptorSet0.cp_c6)._m0[int(_1516)][_1518];
    int _1522 = int(_1514) + 1;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    int _1526 = _1522 & 3;
    float _1528 = (*spvDescriptorSet0.cp_c6)._m0[int(_1524)][_1526];
    float _1530 = _1504 + _1194;
    float _1532 = _1506 + _1186;
    float _1534 = _1508 + _1202;
    float _1536 = fma(_1184, _1290, _1510);
    float _1538 = _1530 * _1334;
    float _1540 = fma(_1200, _1290, _1404);
    float _1542 = fma(_1200, _1298, _1436);
    float _1544 = fma(_1184, _1308, _1466);
    float _1546 = fma(_1200, _1308, _1474);
    float _1548 = _1500 * _1334;
    float _1550 = _1498 * _1334;
    float _1552 = _1502 * _1334;
    float _1554 = fma(_1532, _1326, _1538);
    float _1556 = fma(_1478, _1326, _1548);
    float _1558 = _1530 * _1398;
    float _1560 = _1498 * _1398;
    float _1562 = _1500 * _1398;
    float _1564 = _1502 * _1398;
    float _1566 = fma(_1532, _1390, _1558);
    int _1568 = _1244 * 48;
    float _1570 = fma(_1536, _1326, _1550);
    float _1572 = fma(_1544, _1326, _1552);
    float _1574 = _1530 * _1430;
    float _1576 = _1500 * _1430;
    float _1578 = _1498 * _1430;
    float _1580 = _1502 * _1430;
    float _1582 = fma(_1532, _1422, _1574);
    float _1584 = fma(_1536, _1390, _1560);
    float _1586 = fma(_1478, _1390, _1562);
    float _1588 = fma(_1544, _1390, _1564);
    float _1590 = fma(_1478, _1422, _1576);
    float _1592 = fma(_1534, _1456, _1554);
    float _1594 = fma(_1536, _1422, _1578);
    float _1596 = fma(_1544, _1422, _1580);
    float _1598 = fma(_1542, _1456, _1556);
    float _1600 = fma(_1540, _1456, _1570);
    float _1602 = fma(_1546, _1456, _1572);
    float _1604 = _1592 + _1464;
    int _1606 = _1568 + 16;
    float _1608 = fma(_1534, _1488, _1566);
    float _1610 = fma(_1540, _1488, _1584);
    float _1612 = fma(_1542, _1488, _1586);
    float _1614 = fma(_1546, _1488, _1588);
    float _1616 = _1608 + _1496;
    int _1618 = _1568 + 32;
    int _1620 = _1568 + 48;
    float _1622 = fma(_1534, _1520, _1582);
    float _1624 = fma(_1542, _1520, _1590);
    float _1626 = fma(_1540, _1520, _1594);
    float _1628 = fma(_1546, _1520, _1596);
    float _1630 = _1622 + _1528;
    uint _1632 = uint(int(uint(_1606) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1632)] = as_type<uint>(_1600);
    int _1634 = _1606 + 4;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1636)] = as_type<uint>(_1598);
    int _1638 = _1606 + 8;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1640)] = as_type<uint>(_1602);
    int _1642 = _1606 + 12;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1644)] = as_type<uint>(_1604);
    uint _1646 = uint(int(uint(_1618) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1646)] = as_type<uint>(_1610);
    int _1648 = _1618 + 4;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1650)] = as_type<uint>(_1612);
    int _1652 = _1618 + 8;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1654)] = as_type<uint>(_1614);
    int _1656 = _1618 + 12;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1658)] = as_type<uint>(_1616);
    uint _1660 = uint(int(uint(_1620) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1660)] = as_type<uint>(_1626);
    int _1662 = _1620 + 4;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1664)] = as_type<uint>(_1624);
    int _1666 = _1620 + 8;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1668)] = as_type<uint>(_1628);
    int _1670 = _1620 + 12;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1672)] = as_type<uint>(_1630);
}

