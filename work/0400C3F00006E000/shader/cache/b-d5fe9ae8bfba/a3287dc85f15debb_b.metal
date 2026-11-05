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
int _60(thread const int& _4586, thread const int& _4587, constant _10& support_buffer)
{
    int _4590 = 1 + _4587;
    float _4592 = support_buffer._m5[_4590].x;
    bool _4594 = _4592 == 1.0;
    if (_4594)
    {
        return _4586;
    }
    float _4596 = float(_4586);
    float _4598 = _4596 * _4592;
    int _4600 = int(_4598);
    return _4600;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4274, thread const int& _4275, thread const int& _4276, thread const int& _4277, thread int& _4278, thread int& _4279, thread int& _4280, thread int& _4281, thread int& _4282, thread int& _4283)
{
    float _4286 = as_type<float>(_4275) + 0.0;
    bool _4288 = _4286 != 0.0;
    bool _4290 = isnan(_4286);
    bool _4292 = _4288 || _4290;
    bool _4294 = isnan(0.0);
    bool _4296 = _4292 || _4294;
    int _4298 = as_type<int>(_4286);
    int _4300 = _4275;
    int _4302 = _4277;
    int _4304 = _4296 ? (-1) : 0;
    if (!_4296)
    {
        float _4306 = as_type<float>(_4275) * 1.0;
        _4298 = as_type<int>(_4306);
    }
    int _4308 = _4298;
    bool _4310 = !_4296;
    int _4312 = _4308;
    if (!_4310)
    {
        float _4314 = as_type<float>(_4275) + 0.0;
        bool _4316 = _4314 >= 0.0;
        bool _4318 = isnan(_4314);
        bool _4320 = _4316 || _4318;
        bool _4322 = isnan(0.0);
        bool _4324 = _4320 || _4322;
        int _4326 = as_type<int>(_4314);
        _4304 = _4324 ? (-1) : 0;
        if (!_4324)
        {
            _4326 = 2147483647;
        }
        int _4328 = _4326;
        bool _4330 = !_4324;
        _4312 = _4328;
        if (!_4330)
        {
            float _4332 = as_type<float>(_4275) + 0.0;
            bool _4334 = _4332 > as_type<float>(0x7f800000u /* inf */);
            bool _4336 = isnan(_4332);
            bool _4338 = _4334 || _4336;
            bool _4340 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4342 = _4338 || _4340;
            int _4344 = as_type<int>(_4332);
            _4304 = _4342 ? (-1) : 0;
            if (_4342)
            {
                float _4346 = as_type<float>(_4275) + 1.0;
                _4344 = as_type<int>(_4346);
            }
            int _4348 = _4344;
            _4312 = _4348;
            if (!_4342)
            {
                float _4350 = 0.0 + as_type<float>(_4275);
                bool _4352 = _4350 != as_type<float>(0x7f800000u /* inf */);
                bool _4354 = isnan(_4350);
                bool _4356 = _4352 || _4354;
                bool _4358 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4360 = _4356 || _4358;
                int _4362 = as_type<int>(_4350);
                _4304 = _4360 ? (-1) : 0;
                if (!_4360)
                {
                    _4362 = _4275;
                }
                int _4364 = _4362;
                bool _4366 = !_4360;
                _4312 = _4364;
                if (!_4366)
                {
                    float _4368 = as_type<float>(_4275) * 18446744073709551616.0;
                    float _4370 = rsqrt(_4368);
                    float _4372 = _4368 * _4370;
                    float _4374 = _4370 * 0.5;
                    float _4376 = -_4372;
                    float _4378 = 0.0 + _4376;
                    float _4380 = fma(_4374, _4378, 0.5);
                    float _4382 = fma(_4372, _4380, _4372);
                    float _4384 = -_4382;
                    float _4386 = 0.0 + _4384;
                    float _4388 = fma(_4382, _4386, _4368);
                    float _4390 = fma(_4374, _4388, _4382);
                    float _4392 = _4390 * 2.3283064365386962890625e-10;
                    _4312 = as_type<int>(_4392);
                    _4300 = as_type<int>(_4368);
                    _4302 = as_type<int>(_4382);
                }
            }
        }
    }
    int _4394 = _4312;
    int _4396 = _4300;
    int _4398 = _4302;
    int _4400 = _4304;
    _4278 = _4394;
    _4279 = _4276;
    _4280 = 0;
    _4281 = _4396;
    _4282 = _4398;
    _4283 = _4400;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1228 = false;
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
    int _117 = _60(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_85);
    int _121 = 0;
    int _123 = _60(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1782 = int3(_117, _123, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1782.xy), uint(_1782.z), 0).xyzw;
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
    int3 _1802 = int3(_140, _146, 1);
    float4 _148 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1802.xy), uint(_1802.z), 0).xyzw;
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
    int3 _1822 = int3(_162, _168, 0);
    float3 _172 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1822.xy), uint(_1822.z), 0).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    int _180 = _70;
    int _182 = 0;
    int _184 = _60(_180, _182, (*spvDescriptorSet0.support_buffer));
    int _186 = as_type<int>(_93);
    int _188 = 0;
    int _190 = _60(_186, _188, (*spvDescriptorSet0.support_buffer));
    int3 _1840 = int3(_184, _190, 0);
    float3 _192 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1840.xy), uint(_1840.z), 0).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    int _200 = _70;
    int _202 = 1;
    int _204 = _60(_200, _202, (*spvDescriptorSet0.support_buffer));
    int _206 = as_type<int>(_103);
    int _208 = 1;
    int _210 = _60(_206, _208, (*spvDescriptorSet0.support_buffer));
    int3 _1858 = int3(_204, _210, 1);
    float4 _212 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1858.xy), uint(_1858.z), 0).xyzw;
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
    int3 _1878 = int3(_226, _232, 1);
    float4 _234 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1878.xy), uint(_1878.z), 0).xyzw;
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
    int3 _1898 = int3(_248, _254, 2);
    float3 _256 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1898.xy), uint(_1898.z), 0).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    int _264 = _70;
    int _266 = 0;
    int _268 = _60(_264, _266, (*spvDescriptorSet0.support_buffer));
    int _270 = as_type<int>(_93);
    int _272 = 0;
    int _274 = _60(_270, _272, (*spvDescriptorSet0.support_buffer));
    int3 _1916 = int3(_268, _274, 2);
    float3 _276 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1916.xy), uint(_1916.z), 0).xyz;
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
    float _464;
    float _466;
    if (!_442)
    {
        int _444 = as_type<int>(_396);
        int _446 = as_type<int>(_414);
        int _448 = 1248;
        int _450 = as_type<int>(_280);
        int _452;
        int _454;
        int _456;
        int _458;
        int _460;
        int _462;
        _58(_444, _446, _448, _450, _452, _454, _456, _458, _460, _462);
        _464 = as_type<float>(_452);
        _466 = as_type<float>(_454);
        _468 = true;
    }
    else
    {
        float _470 = rsqrt(_414);
        float _472 = _414 * _470;
        float _474 = _470 * 0.5;
        float _476 = -_472;
        float _478 = 0.0 + _476;
        float _480 = fma(_474, _478, 0.5);
        float _482 = fma(_472, _480, _472);
        float _484 = -_482;
        float _486 = 0.0 + _484;
        float _488 = fma(_482, _486, _414);
        float _490 = fma(_474, _488, _482);
        _464 = _490;
        _466 = _478;
    }
    _468 = false;
    float _492 = _464;
    float _494 = _466;
    int _496 = _76 + 8;
    uint _498 = uint(int(uint(_496) >> uint(2)));
    uint _500 = uint(int(uint(int(_498)) >> uint(2)));
    int _502 = int(_498) & 3;
    float _504 = (*spvDescriptorSet0.cp_c5)._m0[int(_500)][_502];
    int _506 = int(_498) + 1;
    uint _508 = uint(int(uint(_506) >> uint(2)));
    int _510 = _506 & 3;
    float _512 = (*spvDescriptorSet0.cp_c5)._m0[int(_508)][_510];
    int _514 = _70;
    int _516 = 1;
    int _518 = _60(_514, _516, (*spvDescriptorSet0.support_buffer));
    int _520 = as_type<int>(_504);
    int _522 = 1;
    int _524 = _60(_520, _522, (*spvDescriptorSet0.support_buffer));
    int3 _2259 = int3(_518, _524, 0);
    float3 _526 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2259.xy), uint(_2259.z), 0).xyz;
    float _528 = _526.x;
    float _530 = _526.y;
    float _532 = _526.z;
    int _534 = _70;
    int _536 = 1;
    int _538 = _60(_534, _536, (*spvDescriptorSet0.support_buffer));
    int _540 = as_type<int>(_504);
    int _542 = 1;
    int _544 = _60(_540, _542, (*spvDescriptorSet0.support_buffer));
    int3 _2277 = int3(_538, _544, 2);
    float3 _546 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2277.xy), uint(_2277.z), 0).xyz;
    float _548 = _546.x;
    float _550 = _546.y;
    float _552 = _546.z;
    int _554 = _70;
    int _556 = 1;
    int _558 = _60(_554, _556, (*spvDescriptorSet0.support_buffer));
    int _560 = as_type<int>(_512);
    int _562 = 1;
    int _564 = _60(_560, _562, (*spvDescriptorSet0.support_buffer));
    int3 _2295 = int3(_558, _564, 0);
    float3 _566 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2295.xy), uint(_2295.z), 0).xyz;
    float _568 = _566.x;
    float _570 = _566.y;
    float _572 = _566.z;
    int _574 = _70;
    int _576 = 1;
    int _578 = _60(_574, _576, (*spvDescriptorSet0.support_buffer));
    int _580 = as_type<int>(_512);
    int _582 = 1;
    int _584 = _60(_580, _582, (*spvDescriptorSet0.support_buffer));
    int3 _2313 = int3(_578, _584, 2);
    float3 _586 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2313.xy), uint(_2313.z), 0).xyz;
    float _588 = _586.x;
    float _590 = _586.y;
    float _592 = _586.z;
    float _594 = _438 * _492;
    float _596 = _408 * 2.0;
    float _598 = -_596;
    float _600 = fma(_594, _598, _594);
    float _602 = fma(_408, 3.1415927410125732421875, _600);
    float _604 = _602 * 0.15915493667125701904296875;
    float _606 = _604 * 6.283185482025146484375;
    float _608 = sin(_606);
    float _610 = abs(_608);
    bool _612 = _610 >= 0.001000000047497451305389404296875;
    bool _614 = isnan(_610);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.001000000047497451305389404296875);
    bool _620 = _616 || _618;
    float _622 = _262;
    float _624 = _494;
    float _626 = _594;
    if (!_620)
    {
        int _628 = _76 + 28;
        uint _630 = uint(int(uint(_628) >> uint(2)));
        uint _632 = uint(int(uint(int(_630)) >> uint(2)));
        int _634 = int(_630) & 3;
        float _636 = (*spvDescriptorSet0.cp_c5)._m0[int(_632)][_634];
        _622 = _636;
    }
    float _638 = _622;
    float _640 = _638;
    if (!_620)
    {
        float _642 = -_638;
        float _644 = _642 + 1.0;
        _624 = _644;
    }
    float _646 = _624;
    float _648 = _646;
    if (!_620)
    {
        _626 = _638;
    }
    float _650 = _626;
    bool _652 = !_620;
    float _654 = _650;
    float _656 = _552;
    if (!_652)
    {
        int _658 = _76 + 28;
        uint _660 = uint(int(uint(_658) >> uint(2)));
        uint _662 = uint(int(uint(int(_660)) >> uint(2)));
        int _664 = int(_660) & 3;
        float _666 = (*spvDescriptorSet0.cp_c5)._m0[int(_662)][_664];
        float _668 = 1.0 / _608;
        float _670 = _602 * _666;
        float _672 = _670 * 0.15915493667125701904296875;
        float _674 = -_670;
        float _676 = _602 + _674;
        float _678 = _676 * 0.15915493667125701904296875;
        float _680 = _672 * 6.283185482025146484375;
        float _682 = sin(_680);
        float _684 = _678 * 6.283185482025146484375;
        float _686 = sin(_684);
        float _688 = _682 * _668;
        float _690 = _686 * _668;
        _654 = _688;
        _648 = _690;
        _640 = _666;
    }
    float _692 = _654;
    float _694 = _648;
    float _696 = _640;
    bool _698 = !_390;
    float _700 = -_692;
    float _702 = _698 ? _700 : _692;
    int _704 = _76 + 24;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.cp_c5)._m0[int(_708)][_710];
    float _714 = -_528;
    float _716 = _714 + _568;
    float _718 = -_532;
    float _720 = _718 + _572;
    float _722 = -_552;
    float _724 = _722 + _592;
    float _726 = _366 * _702;
    float _728 = _352 * _702;
    float _730 = _360 * _702;
    float _732 = _344 * _702;
    float _734 = fma(_362, _694, _726);
    int _736 = _76 + 20;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.cp_c5)._m0[int(_740)][_742];
    float _746 = fma(_346, _694, _728);
    float _748 = fma(_336, _694, _730);
    float _750 = _734 * 2.0;
    float _752 = fma(_324, _694, _732);
    float _754 = _746 * 2.0;
    bool _756 = _70 != 0;
    float _758 = _748 * _750;
    float _760 = _752 * _750;
    float _762 = _752 * 2.0;
    float _764 = _746 * _750;
    float _766 = -_758;
    float _768 = fma(_752, _754, _766);
    float _770 = fma(_748, _754, _760);
    float _772 = fma(_752, _754, _758);
    float _774 = -_760;
    float _776 = fma(_748, _754, _774);
    float _778 = _746 * _746;
    float _780 = _752 * _752;
    float _782 = -_530;
    float _784 = _782 + _570;
    float _786 = -_764;
    float _788 = fma(_748, _762, _786);
    float _790 = fma(_748, _762, _764);
    float _792 = fma(_778, -2.0, 1.0);
    float _794 = fma(_716, _712, _528);
    float _796 = _748 * _748;
    float _798 = fma(_780, -2.0, 1.0);
    float _800 = fma(_784, _712, _530);
    float _802 = fma(_720, _712, _532);
    float _804 = _794 * _696;
    float _806 = fma(_796, -2.0, _798);
    float _808 = _800 * _696;
    float _810 = fma(_796, -2.0, _792);
    float _812 = fma(_780, -2.0, _792);
    float _814 = -_548;
    float _816 = _814 + _588;
    float _818 = -_550;
    float _820 = _818 + _590;
    float _822 = _802 * _696;
    float _824 = fma(_338, _744, _804);
    float _826 = fma(_330, _744, _808);
    float _828 = fma(_816, _712, _548);
    float _830 = fma(_820, _712, _550);
    float _832 = fma(_724, _712, _552);
    float _834 = fma(_374, _744, _822);
    float _836 = _772 * _824;
    float _838 = _806 * _824;
    float _840 = _768 * _826;
    float _842 = _810 * _826;
    float _844 = _776 * _824;
    float _846 = _790 * _826;
    float _848 = _828 * _696;
    float _850 = _830 * _696;
    float _852 = _832 * _696;
    float _854 = _770 * _834;
    float _856 = _788 * _834;
    float _858 = _812 * _834;
    float _860 = fma(_420, _744, _848);
    float _862 = fma(_440, _744, _850);
    int _864 = _70 * 48;
    float _866 = fma(_422, _744, _852);
    int _868 = _70 * 112;
    float _870 = _806;
    float _872 = _852;
    float _874 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _876 = _804;
    float _878 = _842;
    float _880 = _846;
    float _882 = _836;
    float _884 = _844;
    float _886 = _856;
    float _888 = _854;
    float _890 = _858;
    if (!_756)
    {
        _870 = _860;
    }
    float _892 = _870;
    uint _894 = uint(int(uint(_864) >> uint(2)));
    _39[int(_894)] = as_type<uint>(_838);
    int _896 = _864 + 4;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    _39[int(_898)] = as_type<uint>(_840);
    int _900 = _864 + 8;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    _39[int(_902)] = as_type<uint>(_854);
    int _904 = _864 + 12;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    _39[int(_906)] = as_type<uint>(_860);
    bool _908 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _910 = _892;
    if (!_756)
    {
        _872 = _862;
    }
    float _912 = _872;
    int _914 = _864 + 16;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    _39[int(_916)] = as_type<uint>(_836);
    int _918 = _864 + 20;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    _39[int(_920)] = as_type<uint>(_842);
    int _922 = _864 + 24;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    _39[int(_924)] = as_type<uint>(_856);
    int _926 = _864 + 28;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    _39[int(_928)] = as_type<uint>(_862);
    float _930 = _912;
    if (!_756)
    {
        _874 = _866;
    }
    float _932 = _874;
    float _934 = _932;
    if (!_756)
    {
        _876 = _838;
    }
    float _936 = _876;
    int _938 = _864 + 32;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    _39[int(_940)] = as_type<uint>(_844);
    int _942 = _864 + 36;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    _39[int(_944)] = as_type<uint>(_846);
    int _946 = _864 + 40;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    _39[int(_948)] = as_type<uint>(_858);
    int _950 = _864 + 44;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    _39[int(_952)] = as_type<uint>(_866);
    float _954 = _936;
    if (!_756)
    {
        _656 = _840;
    }
    float _956 = _656;
    float _958 = _956;
    if (!_908)
    {
        int _960 = _70 * 48;
        int _962 = _960 + 16;
        uint _964 = uint(int(uint(_960) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_964)] = as_type<uint>(_838);
        int _966 = _960 + 4;
        uint _968 = uint(int(uint(_966) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_968)] = as_type<uint>(_840);
        int _970 = _960 + 8;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_972)] = as_type<uint>(_854);
        int _974 = _960 + 12;
        uint _976 = uint(int(uint(_974) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_976)] = as_type<uint>(_860);
        int _978 = _960 + 32;
        uint _980 = uint(int(uint(_962) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_980)] = as_type<uint>(_836);
        int _982 = _962 + 4;
        uint _984 = uint(int(uint(_982) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_984)] = as_type<uint>(_842);
        int _986 = _962 + 8;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_988)] = as_type<uint>(_856);
        int _990 = _962 + 12;
        uint _992 = uint(int(uint(_990) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_992)] = as_type<uint>(_862);
        uint _994 = uint(int(uint(_978) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_994)] = as_type<uint>(_844);
        int _996 = _978 + 4;
        uint _998 = uint(int(uint(_996) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_998)] = as_type<uint>(_846);
        int _1000 = _978 + 8;
        uint _1002 = uint(int(uint(_1000) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1002)] = as_type<uint>(_858);
        int _1004 = _978 + 12;
        uint _1006 = uint(int(uint(_1004) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1006)] = as_type<uint>(_866);
    }
    bool _1008 = !_756;
    if (!_1008)
    {
        bool _1010 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1012 = !_1010;
        if (!_1012)
        {
            uint _1014 = uint(int(uint(_868) >> uint(2)));
            uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
            int _1018 = int(_1014) & 3;
            float _1020 = (*spvDescriptorSet0.cp_c6)._m0[int(_1016)][_1018];
            int _1022 = as_type<int>(_1020) * 48;
            int _1024 = 0;
            bool _1026;
            float _1122;
            float _1124;
            float _1126;
            float _1146;
            float _1148;
            float _1152;
            float _1168;
            float _1172;
            float _1174;
            float _1176;
            float _1178;
            float _1180;
            do
            {
                int _1028 = _1024;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1030 = uint(int(uint(_1022) >> uint(2)));
                float _1032 = as_type<float>(_39[int(_1030)]);
                int _1034 = _1022 + 4;
                uint _1036 = uint(int(uint(_1034) >> uint(2)));
                float _1038 = as_type<float>(_39[int(_1036)]);
                int _1040 = _1022 + 8;
                uint _1042 = uint(int(uint(_1040) >> uint(2)));
                float _1044 = as_type<float>(_39[int(_1042)]);
                int _1046 = _1022 + 12;
                uint _1048 = uint(int(uint(_1046) >> uint(2)));
                float _1050 = as_type<float>(_39[int(_1048)]);
                int _1052 = _1028 + 1;
                int _1054 = _1022 + 16;
                uint _1056 = uint(int(uint(_1054) >> uint(2)));
                float _1058 = as_type<float>(_39[int(_1056)]);
                int _1060 = _1022 + 20;
                uint _1062 = uint(int(uint(_1060) >> uint(2)));
                float _1064 = as_type<float>(_39[int(_1062)]);
                int _1066 = _1022 + 24;
                uint _1068 = uint(int(uint(_1066) >> uint(2)));
                float _1070 = as_type<float>(_39[int(_1068)]);
                int _1072 = _1022 + 28;
                uint _1074 = uint(int(uint(_1072) >> uint(2)));
                float _1076 = as_type<float>(_39[int(_1074)]);
                bool _1078 = uint(_1052) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1080 = _1022 + 32;
                uint _1082 = uint(int(uint(_1080) >> uint(2)));
                float _1084 = as_type<float>(_39[int(_1082)]);
                int _1086 = _1022 + 36;
                uint _1088 = uint(int(uint(_1086) >> uint(2)));
                float _1090 = as_type<float>(_39[int(_1088)]);
                int _1092 = _1022 + 40;
                uint _1094 = uint(int(uint(_1092) >> uint(2)));
                float _1096 = as_type<float>(_39[int(_1094)]);
                int _1098 = _1022 + 44;
                uint _1100 = uint(int(uint(_1098) >> uint(2)));
                float _1102 = as_type<float>(_39[int(_1100)]);
                float _1104 = _862 * _1038;
                float _1106 = _836 * _1038;
                float _1108 = _842 * _1038;
                float _1110 = _856 * _1038;
                float _1112 = fma(_860, _1032, _1104);
                float _1114 = fma(_838, _1032, _1106);
                float _1116 = fma(_840, _1032, _1108);
                float _1118 = fma(_854, _1032, _1110);
                float _1120 = fma(_866, _1044, _1112);
                _1122 = fma(_844, _1044, _1114);
                _1124 = fma(_846, _1044, _1116);
                _1126 = fma(_858, _1044, _1118);
                float _1128 = _862 * _1064;
                float _1130 = _836 * _1064;
                float _1132 = _842 * _1064;
                float _1134 = _856 * _1064;
                float _1136 = fma(_860, _1058, _1128);
                float _1138 = fma(_838, _1058, _1130);
                float _1140 = fma(_840, _1058, _1132);
                float _1142 = fma(_854, _1058, _1134);
                float _1144 = fma(_866, _1070, _1136);
                _1146 = fma(_844, _1070, _1138);
                _1148 = fma(_846, _1070, _1140);
                float _1150 = _836 * _1090;
                _1152 = _1076 + _1144;
                float _1154 = _862 * _1090;
                float _1156 = _842 * _1090;
                float _1158 = _856 * _1090;
                float _1160 = fma(_838, _1084, _1150);
                float _1162 = fma(_860, _1084, _1154);
                float _1164 = fma(_840, _1084, _1156);
                float _1166 = fma(_854, _1084, _1158);
                _1168 = fma(_858, _1070, _1142);
                float _1170 = fma(_866, _1096, _1162);
                _1172 = _1050 + _1120;
                _1174 = fma(_844, _1096, _1160);
                _1176 = fma(_846, _1096, _1164);
                _1178 = fma(_858, _1096, _1166);
                _1180 = _1102 + _1170;
                uint _1182 = uint(int(uint(_864) >> uint(2)));
                _39[int(_1182)] = as_type<uint>(_1122);
                int _1184 = _864 + 4;
                uint _1186 = uint(int(uint(_1184) >> uint(2)));
                _39[int(_1186)] = as_type<uint>(_1124);
                int _1188 = _864 + 8;
                uint _1190 = uint(int(uint(_1188) >> uint(2)));
                _39[int(_1190)] = as_type<uint>(_1126);
                int _1192 = _864 + 12;
                uint _1194 = uint(int(uint(_1192) >> uint(2)));
                _39[int(_1194)] = as_type<uint>(_1172);
                int _1196 = _864 + 16;
                uint _1198 = uint(int(uint(_1196) >> uint(2)));
                _39[int(_1198)] = as_type<uint>(_1146);
                int _1200 = _864 + 20;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                _39[int(_1202)] = as_type<uint>(_1148);
                int _1204 = _864 + 24;
                uint _1206 = uint(int(uint(_1204) >> uint(2)));
                _39[int(_1206)] = as_type<uint>(_1168);
                int _1208 = _864 + 28;
                uint _1210 = uint(int(uint(_1208) >> uint(2)));
                _39[int(_1210)] = as_type<uint>(_1152);
                int _1212 = _864 + 32;
                uint _1214 = uint(int(uint(_1212) >> uint(2)));
                _39[int(_1214)] = as_type<uint>(_1174);
                int _1216 = _864 + 36;
                uint _1218 = uint(int(uint(_1216) >> uint(2)));
                _39[int(_1218)] = as_type<uint>(_1176);
                int _1220 = _864 + 40;
                uint _1222 = uint(int(uint(_1220) >> uint(2)));
                _39[int(_1222)] = as_type<uint>(_1178);
                int _1224 = _864 + 44;
                uint _1226 = uint(int(uint(_1224) >> uint(2)));
                _39[int(_1226)] = as_type<uint>(_1180);
                _1026 = !_1078;
                _1024 = _1052;
            } while (_1026);
            _958 = _1124;
            _878 = _1148;
            _880 = _1176;
            _954 = _1122;
            _882 = _1146;
            _884 = _1174;
            _886 = _1168;
            _888 = _1126;
            _930 = _1152;
            _890 = _1178;
            _910 = _1172;
            _934 = _1180;
            _1228 = true;
        }
        else
        {
            _958 = 0.0;
            _878 = 0.0;
            _880 = 0.0;
            _954 = 0.0;
            _882 = 0.0;
            _884 = 0.0;
            _886 = 0.0;
            _888 = 0.0;
            _930 = 0.0;
            _890 = 0.0;
            _910 = 0.0;
            _934 = 0.0;
        }
    }
    _1228 = false;
    float _1230 = _958;
    float _1232 = _878;
    float _1234 = _880;
    float _1236 = _954;
    float _1238 = _882;
    float _1240 = _884;
    float _1242 = _886;
    float _1244 = _888;
    float _1246 = _930;
    float _1248 = _890;
    float _1250 = _910;
    float _1252 = _934;
    int _1254 = _868 + 80;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.cp_c6)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.cp_c6)._m0[int(_1266)][_1268];
    int _1272 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1274 = _1272 + _70;
    int _1276 = _868 + 64;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.cp_c6)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.cp_c6)._m0[int(_1288)][_1290];
    int _1294 = _1274 * 48;
    int _1296 = _868 + 88;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
    int _1302 = int(_1298) & 3;
    float _1304 = (*spvDescriptorSet0.cp_c6)._m0[int(_1300)][_1302];
    int _1306 = int(_1298) + 1;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    int _1310 = _1306 & 3;
    float _1312 = (*spvDescriptorSet0.cp_c6)._m0[int(_1308)][_1310];
    int _1314 = _868 + 72;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.cp_c6)._m0[int(_1326)][_1328];
    int _1332 = _868 + 104;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.cp_c6)._m0[int(_1344)][_1346];
    int _1350 = _868 + 96;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.cp_c6)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.cp_c6)._m0[int(_1362)][_1364];
    float _1368 = _1230 * _1262;
    float _1370 = _1232 * _1262;
    float _1372 = _1234 * _1270;
    int _1374 = _868 + 16;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    uint _1378 = uint(int(uint(int(_1376)) >> uint(2)));
    int _1380 = int(_1376) & 3;
    float _1382 = (*spvDescriptorSet0.cp_c6)._m0[int(_1378)][_1380];
    int _1384 = int(_1376) + 1;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    int _1388 = _1384 & 3;
    float _1390 = (*spvDescriptorSet0.cp_c6)._m0[int(_1386)][_1388];
    float _1392 = _1234 * _1262;
    float _1394 = fma(_1236, _1284, _1368);
    float _1396 = fma(_1238, _1284, _1370);
    float _1398 = _1230 * _1270;
    int _1400 = _868 + 32;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    uint _1404 = uint(int(uint(int(_1402)) >> uint(2)));
    int _1406 = int(_1402) & 3;
    float _1408 = (*spvDescriptorSet0.cp_c6)._m0[int(_1404)][_1406];
    int _1410 = int(_1402) + 1;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    int _1414 = _1410 & 3;
    float _1416 = (*spvDescriptorSet0.cp_c6)._m0[int(_1412)][_1414];
    float _1418 = _1232 * _1270;
    float _1420 = fma(_1240, _1292, _1372);
    float _1422 = fma(_1240, _1284, _1392);
    float _1424 = fma(_1236, _1292, _1398);
    float _1426 = _1230 * _1304;
    float _1428 = _1230 * _1312;
    float _1430 = _1232 * _1304;
    int _1432 = _868 + 48;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.cp_c6)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.cp_c6)._m0[int(_1444)][_1446];
    float _1450 = _1232 * _1312;
    float _1452 = _1234 * _1304;
    float _1454 = _1234 * _1312;
    float _1456 = fma(_1238, _1292, _1418);
    float _1458 = fma(_1236, _1322, _1426);
    float _1460 = fma(_1236, _1330, _1428);
    float _1462 = fma(_1238, _1322, _1430);
    int _1464 = _868 + 24;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.cp_c6)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.cp_c6)._m0[int(_1476)][_1478];
    float _1482 = fma(_1238, _1330, _1450);
    float _1484 = fma(_1240, _1322, _1452);
    float _1486 = fma(_1240, _1330, _1454);
    float _1488 = fma(_1242, _1348, _1482);
    float _1490 = fma(_1244, _1348, _1460);
    float _1492 = fma(_1244, _1340, _1458);
    int _1494 = _868 + 40;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    uint _1498 = uint(int(uint(int(_1496)) >> uint(2)));
    int _1500 = int(_1496) & 3;
    float _1502 = (*spvDescriptorSet0.cp_c6)._m0[int(_1498)][_1500];
    int _1504 = int(_1496) + 1;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    int _1508 = _1504 & 3;
    float _1510 = (*spvDescriptorSet0.cp_c6)._m0[int(_1506)][_1508];
    float _1512 = _1488 + _1246;
    float _1514 = fma(_1248, _1348, _1486);
    float _1516 = fma(_1248, _1340, _1484);
    float _1518 = _1490 + _1250;
    float _1520 = fma(_1244, _1358, _1394);
    float _1522 = fma(_1242, _1358, _1396);
    float _1524 = fma(_1244, _1366, _1424);
    int _1526 = _868 + 56;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    uint _1530 = uint(int(uint(int(_1528)) >> uint(2)));
    int _1532 = int(_1528) & 3;
    float _1534 = (*spvDescriptorSet0.cp_c6)._m0[int(_1530)][_1532];
    int _1536 = int(_1528) + 1;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    int _1540 = _1536 & 3;
    float _1542 = (*spvDescriptorSet0.cp_c6)._m0[int(_1538)][_1540];
    float _1544 = fma(_1248, _1358, _1422);
    float _1546 = fma(_1248, _1366, _1420);
    float _1548 = fma(_1242, _1340, _1462);
    float _1550 = fma(_1242, _1366, _1456);
    float _1552 = _1514 + _1252;
    int _1554 = _1294 + 32;
    float _1556 = _1512 * _1390;
    float _1558 = _1548 * _1390;
    float _1560 = _1522 * _1390;
    float _1562 = _1550 * _1390;
    float _1564 = fma(_1518, _1382, _1556);
    float _1566 = fma(_1492, _1382, _1558);
    float _1568 = fma(_1520, _1382, _1560);
    float _1570 = fma(_1524, _1382, _1562);
    float _1572 = _1512 * _1416;
    float _1574 = _1522 * _1416;
    float _1576 = _1550 * _1416;
    float _1578 = _1548 * _1416;
    float _1580 = fma(_1518, _1408, _1572);
    float _1582 = fma(_1520, _1408, _1574);
    float _1584 = fma(_1524, _1408, _1576);
    float _1586 = fma(_1492, _1408, _1578);
    float _1588 = _1512 * _1448;
    float _1590 = _1522 * _1448;
    float _1592 = _1550 * _1448;
    float _1594 = _1548 * _1448;
    float _1596 = fma(_1518, _1440, _1588);
    float _1598 = fma(_1520, _1440, _1590);
    float _1600 = fma(_1524, _1440, _1592);
    float _1602 = fma(_1492, _1440, _1594);
    float _1604 = fma(_1552, _1472, _1564);
    float _1606 = fma(_1516, _1472, _1566);
    float _1608 = fma(_1544, _1472, _1568);
    float _1610 = fma(_1546, _1472, _1570);
    float _1612 = _1604 + _1480;
    int _1614 = _1294 + 16;
    int _1616 = _1294 + 48;
    float _1618 = fma(_1552, _1502, _1580);
    float _1620 = fma(_1544, _1502, _1582);
    float _1622 = fma(_1546, _1502, _1584);
    float _1624 = fma(_1516, _1502, _1586);
    float _1626 = _1618 + _1510;
    uint _1628 = uint(int(uint(_1614) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1628)] = as_type<uint>(_1608);
    int _1630 = _1614 + 4;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1632)] = as_type<uint>(_1610);
    int _1634 = _1614 + 8;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1636)] = as_type<uint>(_1606);
    int _1638 = _1614 + 12;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1640)] = as_type<uint>(_1612);
    float _1642 = fma(_1552, _1534, _1596);
    float _1644 = fma(_1544, _1534, _1598);
    float _1646 = fma(_1546, _1534, _1600);
    float _1648 = fma(_1516, _1534, _1602);
    float _1650 = _1642 + _1542;
    uint _1652 = uint(int(uint(_1554) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1652)] = as_type<uint>(_1620);
    int _1654 = _1554 + 4;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1656)] = as_type<uint>(_1622);
    int _1658 = _1554 + 8;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1660)] = as_type<uint>(_1624);
    int _1662 = _1554 + 12;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1664)] = as_type<uint>(_1626);
    uint _1666 = uint(int(uint(_1616) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1666)] = as_type<uint>(_1644);
    int _1668 = _1616 + 4;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1670)] = as_type<uint>(_1646);
    int _1672 = _1616 + 8;
    uint _1674 = uint(int(uint(_1672) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1674)] = as_type<uint>(_1648);
    int _1676 = _1616 + 12;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1678)] = as_type<uint>(_1650);
}

