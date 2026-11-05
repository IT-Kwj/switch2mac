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
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _60(thread const int& _4622, thread const int& _4623, constant _10& support_buffer)
{
    int _4626 = 1 + _4623;
    float _4628 = support_buffer._m5[_4626].x;
    bool _4630 = _4628 == 1.0;
    if (_4630)
    {
        return _4622;
    }
    float _4632 = float(_4622);
    float _4634 = _4632 * _4628;
    int _4636 = int(_4634);
    return _4636;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4310, thread const int& _4311, thread const int& _4312, thread const int& _4313, thread int& _4314, thread int& _4315, thread int& _4316, thread int& _4317, thread int& _4318, thread int& _4319)
{
    float _4322 = as_type<float>(_4311) + 0.0;
    bool _4324 = _4322 != 0.0;
    bool _4326 = isnan(_4322);
    bool _4328 = _4324 || _4326;
    bool _4330 = isnan(0.0);
    bool _4332 = _4328 || _4330;
    int _4334 = as_type<int>(_4322);
    int _4336 = _4311;
    int _4338 = _4313;
    int _4340 = _4332 ? (-1) : 0;
    if (!_4332)
    {
        float _4342 = as_type<float>(_4311) * 1.0;
        _4334 = as_type<int>(_4342);
    }
    int _4344 = _4334;
    bool _4346 = !_4332;
    int _4348 = _4344;
    if (!_4346)
    {
        float _4350 = as_type<float>(_4311) + 0.0;
        bool _4352 = _4350 >= 0.0;
        bool _4354 = isnan(_4350);
        bool _4356 = _4352 || _4354;
        bool _4358 = isnan(0.0);
        bool _4360 = _4356 || _4358;
        int _4362 = as_type<int>(_4350);
        _4340 = _4360 ? (-1) : 0;
        if (!_4360)
        {
            _4362 = 2147483647;
        }
        int _4364 = _4362;
        bool _4366 = !_4360;
        _4348 = _4364;
        if (!_4366)
        {
            float _4368 = as_type<float>(_4311) + 0.0;
            bool _4370 = _4368 > as_type<float>(0x7f800000u /* inf */);
            bool _4372 = isnan(_4368);
            bool _4374 = _4370 || _4372;
            bool _4376 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4378 = _4374 || _4376;
            int _4380 = as_type<int>(_4368);
            _4340 = _4378 ? (-1) : 0;
            if (_4378)
            {
                float _4382 = as_type<float>(_4311) + 1.0;
                _4380 = as_type<int>(_4382);
            }
            int _4384 = _4380;
            _4348 = _4384;
            if (!_4378)
            {
                float _4386 = 0.0 + as_type<float>(_4311);
                bool _4388 = _4386 != as_type<float>(0x7f800000u /* inf */);
                bool _4390 = isnan(_4386);
                bool _4392 = _4388 || _4390;
                bool _4394 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4396 = _4392 || _4394;
                int _4398 = as_type<int>(_4386);
                _4340 = _4396 ? (-1) : 0;
                if (!_4396)
                {
                    _4398 = _4311;
                }
                int _4400 = _4398;
                bool _4402 = !_4396;
                _4348 = _4400;
                if (!_4402)
                {
                    float _4404 = as_type<float>(_4311) * 18446744073709551616.0;
                    float _4406 = rsqrt(_4404);
                    float _4408 = _4404 * _4406;
                    float _4410 = _4406 * 0.5;
                    float _4412 = -_4408;
                    float _4414 = 0.0 + _4412;
                    float _4416 = fma(_4410, _4414, 0.5);
                    float _4418 = fma(_4408, _4416, _4408);
                    float _4420 = -_4418;
                    float _4422 = 0.0 + _4420;
                    float _4424 = fma(_4418, _4422, _4404);
                    float _4426 = fma(_4410, _4424, _4418);
                    float _4428 = _4426 * 2.3283064365386962890625e-10;
                    _4348 = as_type<int>(_4428);
                    _4336 = as_type<int>(_4414);
                    _4338 = as_type<int>(_4418);
                }
            }
        }
    }
    int _4430 = _4348;
    int _4432 = _4336;
    int _4434 = _4338;
    int _4436 = _4340;
    _4314 = _4430;
    _4315 = _4312;
    _4316 = 0;
    _4317 = _4432;
    _4318 = _4434;
    _4319 = _4436;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1260 = false;
    bool _796 = false;
    bool _490 = false;
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
    float _137 = _113;
    if (_127)
    {
        int _139 = _103 + 8;
        uint _141 = uint(int(uint(_139) >> uint(2)));
        uint _143 = uint(int(uint(int(_141)) >> uint(2)));
        int _145 = int(_141) & 3;
        float _147 = (*spvDescriptorSet0.cp_c5)._m0[int(_143)][_145];
        _133 = as_type<int>(_147);
    }
    int _149 = _133;
    float _151 = 0.0;
    if (_127)
    {
        _151 = 1.4012984643248170709237295832899e-45;
    }
    float _153 = _151;
    int _155 = 0;
    if (_131)
    {
        uint _157 = uint(int(uint(_103) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _155 = as_type<int>(_163);
    }
    int _165 = _155;
    float _167 = 0.0;
    if (_131)
    {
        _167 = 2.8025969286496341418474591665798e-45;
    }
    float _169 = _167;
    if (_131)
    {
        _135 = 1.4012984643248170709237295832899e-45;
    }
    float _171 = _135;
    float _173 = as_type<float>(_149);
    float _175 = 0.0;
    float _177 = _153;
    float _179 = as_type<float>(_70);
    if (_127)
    {
        int _181 = _70;
        int _183 = 0;
        int _185 = _60(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _149;
        int _189 = 0;
        int _191 = _60(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _1914 = int3(_185, _191, as_type<int>(_153));
        float4 _194 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1914.xy), uint(_1914.z), 0).xyzw;
        float _196 = _194.x;
        float _198 = _194.y;
        float _200 = _194.z;
        float _202 = _194.w;
        _173 = _196;
        _175 = _198;
        _177 = _200;
        _179 = _202;
    }
    float _204 = _173;
    float _206 = _175;
    float _208 = _177;
    float _210 = _179;
    float _212 = 0.0;
    float _214 = as_type<float>(_70);
    float _216 = 0.0;
    if (_131)
    {
        int _218 = _70;
        int _220 = 1;
        int _222 = _60(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = _165;
        int _226 = 1;
        int _228 = _60(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _1946 = int3(_222, _228, 0);
        float3 _232 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1946.xy), uint(_1946.z), 0).xyz;
        float _234 = _232.x;
        float _236 = _232.y;
        float _238 = _232.z;
        _212 = _234;
        _214 = _236;
        _216 = _238;
    }
    float _240 = _212;
    float _242 = _214;
    float _244 = _216;
    float _246 = _169;
    float _248 = as_type<float>(_70);
    float _250 = 0.0;
    if (_131)
    {
        int _252 = _70;
        int _254 = 1;
        int _256 = _60(_252, _254, (*spvDescriptorSet0.support_buffer));
        int _258 = _165;
        int _260 = 1;
        int _262 = _60(_258, _260, (*spvDescriptorSet0.support_buffer));
        int3 _1977 = int3(_256, _262, as_type<int>(_169));
        float3 _264 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1977.xy), uint(_1977.z), 0).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        _246 = _266;
        _248 = _268;
        _250 = _270;
    }
    float _272 = _246;
    float _274 = _248;
    float _276 = _250;
    float _278 = 0.0;
    float _280 = _123;
    float _282 = 0.0;
    float _284 = 0.0;
    if (_131)
    {
        int _286 = _70;
        int _288 = 1;
        int _290 = _60(_286, _288, (*spvDescriptorSet0.support_buffer));
        int _292 = _165;
        int _294 = 1;
        int _296 = _60(_292, _294, (*spvDescriptorSet0.support_buffer));
        int3 _2006 = int3(_290, _296, as_type<int>(_171));
        float4 _298 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2006.xy), uint(_2006.z), 0).xyzw;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float _306 = _298.w;
        _278 = _300;
        _280 = _302;
        _282 = _304;
        _284 = _306;
    }
    float _308 = _278;
    float _310 = _280;
    float _312 = _282;
    float _314 = _284;
    float _316 = 0.0;
    float _318 = 0.0;
    if (!_131)
    {
        _316 = 0.0;
        _318 = 0.0;
    }
    float _320 = _316;
    float _322 = _318;
    float _324 = 0.0;
    float _326 = _320;
    float _328 = _322;
    if (!_131)
    {
        _324 = 0.0;
    }
    float _330 = _324;
    float _332 = 0.0;
    float _334 = 0.0;
    float _336 = _330;
    if (!_131)
    {
        _332 = 0.0;
        _334 = 0.0;
    }
    float _338 = _332;
    float _340 = _334;
    float _342 = 0.0;
    float _344 = _338;
    float _346 = _340;
    if (!_131)
    {
        _342 = 0.0;
    }
    float _348 = _342;
    float _350 = 0.0;
    float _352 = _348;
    if (!_131)
    {
        _137 = 0.0;
        _350 = 0.0;
    }
    float _354 = _137;
    float _356 = _350;
    float _358 = 0.0;
    float _360 = _354;
    float _362 = _356;
    if (!_131)
    {
        _358 = 0.0;
    }
    float _364 = _358;
    float _366 = 0.0;
    float _368 = _364;
    if (!_131)
    {
        _366 = 0.0;
    }
    float _370 = _366;
    bool _372 = !_131;
    float _374 = _370;
    if (!_372)
    {
        _344 = _310;
        _360 = _308;
        _374 = _312;
        _362 = _314;
        _326 = _240;
        _336 = _242;
        _328 = _244;
        _346 = _272;
        _352 = _274;
        _368 = _276;
    }
    float _376 = _344;
    float _378 = _360;
    float _380 = _374;
    float _382 = _362;
    float _384 = _326;
    float _386 = _336;
    float _388 = _328;
    float _390 = _346;
    float _392 = _352;
    float _394 = _368;
    bool _396 = !_127;
    float _398 = _384;
    int _400 = as_type<int>(_390);
    int _402 = as_type<int>(_392);
    int _404 = as_type<int>(_394);
    float _406 = _386;
    float _408 = _388;
    float _772;
    float _774;
    float _776;
    float _778;
    float _780;
    float _782;
    float _784;
    float _786;
    float _788;
    float _790;
    float _792;
    float _794;
    if (!_396)
    {
        float _410 = _206 * _376;
        float _412 = fma(_204, _378, _410);
        float _414 = fma(_208, _380, _412);
        float _416 = fma(_210, _382, _414);
        float _418 = precise::max(_416, -1.0);
        float _420 = precise::min(_418, 1.0);
        bool _422 = _420 >= 0.0;
        bool _424 = isnan(_420);
        bool _426 = _422 || _424;
        bool _428 = isnan(0.0);
        bool _430 = _426 || _428;
        bool _432 = !_430;
        float _434 = -_420;
        float _436 = _432 ? _434 : _420;
        bool _438 = _436 < 0.0;
        float _440 = float(_438);
        float _442 = abs(_436);
        float _444 = -_442;
        float _446 = _444 + 1.0;
        float _448 = abs(_436);
        float _450 = fma(_448, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _452 = as_type<int>(_446) + (-218103808);
        float _454 = abs(_436);
        float _456 = fma(_454, _450, -0.212114393711090087890625);
        bool _458 = uint(_452) >= 1920991232u;
        float _460 = abs(_436);
        float _462 = fma(_460, _456, 1.570728778839111328125);
        bool _464 = !_458;
        float _486;
        float _488;
        if (!_464)
        {
            int _466 = _452;
            int _468 = as_type<int>(_446);
            int _470 = 1088;
            int _472 = 0;
            int _474;
            int _476;
            int _478;
            int _480;
            int _482;
            int _484;
            _58(_466, _468, _470, _472, _474, _476, _478, _480, _482, _484);
            _486 = as_type<float>(_474);
            _488 = as_type<float>(_476);
            _490 = true;
        }
        else
        {
            float _492 = rsqrt(_446);
            float _494 = _446 * _492;
            float _496 = _492 * 0.5;
            float _498 = -_494;
            float _500 = 0.0 + _498;
            float _502 = fma(_496, _500, 0.5);
            float _504 = fma(_494, _502, _494);
            float _506 = -_504;
            float _508 = 0.0 + _506;
            float _510 = fma(_504, _508, _446);
            float _512 = fma(_496, _510, _504);
            _486 = _512;
            _488 = _510;
        }
        _490 = false;
        float _514 = _486;
        float _516 = _488;
        int _518 = _103 + 8;
        uint _520 = uint(int(uint(_518) >> uint(2)));
        uint _522 = uint(int(uint(int(_520)) >> uint(2)));
        int _524 = int(_520) & 3;
        float _526 = (*spvDescriptorSet0.cp_c5)._m0[int(_522)][_524];
        int _528 = _70;
        int _530 = 0;
        int _532 = _60(_528, _530, (*spvDescriptorSet0.support_buffer));
        int _534 = as_type<int>(_526);
        int _536 = 0;
        int _538 = _60(_534, _536, (*spvDescriptorSet0.support_buffer));
        int3 _2269 = int3(_532, _538, 0);
        float3 _540 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2269.xy), uint(_2269.z), 0).xyz;
        float _542 = _540.x;
        float _544 = _540.y;
        float _546 = _540.z;
        int _548 = _70;
        int _550 = 0;
        int _552 = _60(_548, _550, (*spvDescriptorSet0.support_buffer));
        int _554 = as_type<int>(_526);
        int _556 = 0;
        int _558 = _60(_554, _556, (*spvDescriptorSet0.support_buffer));
        int3 _2287 = int3(_552, _558, 2);
        float3 _560 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2287.xy), uint(_2287.z), 0).xyz;
        float _562 = _560.x;
        float _564 = _560.y;
        float _566 = _560.z;
        float _568 = _462 * _514;
        float _570 = _440 * 2.0;
        float _572 = -_570;
        float _574 = fma(_568, _572, _568);
        float _576 = fma(_440, 3.1415927410125732421875, _574);
        float _578 = _576 * 0.15915493667125701904296875;
        float _580 = _578 * 6.283185482025146484375;
        float _582 = sin(_580);
        float _584 = abs(_582);
        bool _586 = _584 >= 0.001000000047497451305389404296875;
        bool _588 = isnan(_584);
        bool _590 = _586 || _588;
        bool _592 = isnan(0.001000000047497451305389404296875);
        bool _594 = _590 || _592;
        float _596 = _462;
        float _598 = _516;
        float _600 = _568;
        if (!_594)
        {
            int _602 = _103 + 28;
            uint _604 = uint(int(uint(_602) >> uint(2)));
            uint _606 = uint(int(uint(int(_604)) >> uint(2)));
            int _608 = int(_604) & 3;
            float _610 = (*spvDescriptorSet0.cp_c5)._m0[int(_606)][_608];
            _596 = _610;
        }
        float _612 = _596;
        float _614 = _612;
        if (!_594)
        {
            float _616 = -_612;
            float _618 = _616 + 1.0;
            _598 = _618;
        }
        float _620 = _598;
        float _622 = _620;
        if (!_594)
        {
            _600 = _612;
        }
        float _624 = _600;
        bool _626 = !_594;
        float _628 = _624;
        if (!_626)
        {
            int _630 = _103 + 28;
            uint _632 = uint(int(uint(_630) >> uint(2)));
            uint _634 = uint(int(uint(int(_632)) >> uint(2)));
            int _636 = int(_632) & 3;
            float _638 = (*spvDescriptorSet0.cp_c5)._m0[int(_634)][_636];
            float _640 = 1.0 / _582;
            float _642 = _576 * _638;
            float _644 = _642 * 0.15915493667125701904296875;
            float _646 = -_642;
            float _648 = _576 + _646;
            float _650 = _648 * 0.15915493667125701904296875;
            float _652 = _644 * 6.283185482025146484375;
            float _654 = sin(_652);
            float _656 = _650 * 6.283185482025146484375;
            float _658 = sin(_656);
            float _660 = _654 * _640;
            float _662 = _658 * _640;
            _628 = _660;
            _614 = _638;
            _622 = _662;
        }
        float _664 = _628;
        float _666 = _614;
        float _668 = _622;
        bool _670 = !_430;
        float _672 = -_664;
        float _674 = _670 ? _672 : _664;
        float _676 = _542 * _666;
        float _678 = _544 * _666;
        float _680 = _546 * _666;
        float _682 = _204 * _674;
        float _684 = _210 * _674;
        float _686 = _206 * _674;
        float _688 = _208 * _674;
        float _690 = fma(_378, _668, _682);
        int _692 = _103 + 20;
        uint _694 = uint(int(uint(_692) >> uint(2)));
        uint _696 = uint(int(uint(int(_694)) >> uint(2)));
        int _698 = int(_694) & 3;
        float _700 = (*spvDescriptorSet0.cp_c5)._m0[int(_696)][_698];
        float _702 = fma(_382, _668, _684);
        float _704 = fma(_376, _668, _686);
        float _706 = fma(_380, _668, _688);
        float _708 = _690 * _690;
        float _710 = _702 * 2.0;
        float _712 = _704 * _704;
        float _714 = _690 * 2.0;
        float _716 = _704 * 2.0;
        float _718 = _706 * _710;
        float _720 = _690 * _710;
        float _722 = _704 * _710;
        float _724 = _706 * _706;
        float _726 = fma(_712, -2.0, 1.0);
        float _728 = fma(_708, -2.0, 1.0);
        float _730 = _562 * _666;
        float _732 = _564 * _666;
        float _734 = _566 * _666;
        float _736 = -_718;
        float _738 = fma(_704, _714, _736);
        float _740 = fma(_704, _714, _718);
        float _742 = fma(_706, _714, _722);
        float _744 = -_720;
        float _746 = fma(_706, _716, _744);
        float _748 = fma(_724, -2.0, _726);
        float _750 = -_722;
        float _752 = fma(_706, _714, _750);
        float _754 = fma(_706, _716, _720);
        float _756 = fma(_724, -2.0, _728);
        float _758 = fma(_712, -2.0, _728);
        float _760 = fma(_384, _700, _676);
        float _762 = fma(_386, _700, _678);
        float _764 = fma(_388, _700, _680);
        float _766 = fma(_390, _700, _730);
        float _768 = fma(_392, _700, _732);
        float _770 = fma(_394, _700, _734);
        _398 = _760;
        _772 = _748;
        _774 = _740;
        _776 = _752;
        _778 = _762;
        _780 = _738;
        _782 = _756;
        _784 = _754;
        _786 = _764;
        _788 = _742;
        _790 = _746;
        _792 = _758;
        _400 = as_type<int>(_766);
        _402 = as_type<int>(_768);
        _404 = as_type<int>(_770);
        _794 = _732;
        _796 = true;
    }
    else
    {
        float _798 = _382 * 2.0;
        float _800 = _378 * 2.0;
        float _802 = _376 * _376;
        float _804 = _798 * _380;
        float _806 = _378 * _378;
        float _808 = _798 * _378;
        float _810 = _798 * _376;
        float _812 = -_804;
        float _814 = fma(_800, _376, _812);
        float _816 = fma(_800, _376, _804);
        float _818 = _380 * _380;
        float _820 = fma(_802, -2.0, 1.0);
        float _822 = _376 * 2.0;
        float _824 = fma(_806, -2.0, 1.0);
        float _826 = fma(_800, _380, _810);
        float _828 = fma(_818, -2.0, _820);
        float _830 = -_810;
        float _832 = fma(_800, _380, _830);
        float _834 = -_808;
        float _836 = fma(_822, _380, _834);
        float _838 = fma(_818, -2.0, _824);
        float _840 = fma(_802, -2.0, _824);
        float _842 = fma(_822, _380, _808);
        _772 = _828;
        _774 = _816;
        _776 = _832;
        _778 = _386;
        _780 = _814;
        _782 = _838;
        _784 = _842;
        _786 = _388;
        _788 = _826;
        _790 = _836;
        _792 = _840;
        _794 = _822;
    }
    _796 = false;
    float _844 = _398;
    float _846 = _772;
    float _848 = _774;
    float _850 = _776;
    float _852 = _778;
    float _854 = _780;
    float _856 = _782;
    float _858 = _784;
    float _860 = _786;
    float _862 = _788;
    float _864 = _790;
    float _866 = _792;
    int _868 = _400;
    int _870 = _402;
    int _872 = _404;
    float _874 = _794;
    float _876 = _844 * _846;
    float _878 = _844 * _848;
    float _880 = _844 * _850;
    float _882 = _852 * _854;
    float _884 = _852 * _856;
    float _886 = _852 * _858;
    int _888 = _70 * 48;
    float _890 = _860 * _862;
    float _892 = _860 * _864;
    float _894 = _860 * _866;
    int _896 = _70 * 112;
    uint _898 = uint(int(uint(_888) >> uint(2)));
    _39[int(_898)] = as_type<uint>(_876);
    int _900 = _888 + 4;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    _39[int(_902)] = as_type<uint>(_882);
    int _904 = _888 + 8;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    _39[int(_906)] = as_type<uint>(_890);
    int _908 = _888 + 12;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    _39[int(_910)] = uint(_868);
    bool _912 = _70 != 0;
    bool _914 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _916 = _888 + 16;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    _39[int(_918)] = as_type<uint>(_878);
    int _920 = _888 + 20;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    _39[int(_922)] = as_type<uint>(_884);
    int _924 = _888 + 24;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    _39[int(_926)] = as_type<uint>(_892);
    int _928 = _888 + 28;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    _39[int(_930)] = uint(_870);
    int _932 = _888 + 32;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    _39[int(_934)] = as_type<uint>(_880);
    int _936 = _888 + 36;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    _39[int(_938)] = as_type<uint>(_886);
    int _940 = _888 + 40;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    _39[int(_942)] = as_type<uint>(_894);
    int _944 = _888 + 44;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    _39[int(_946)] = uint(_872);
    float _948 = _844;
    float _950 = _860;
    float _952 = _874;
    float _954 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _956 = _886;
    float _958 = _880;
    float _960 = _892;
    float _962 = _894;
    float _964 = as_type<float>(_870);
    float _966 = as_type<float>(_872);
    if (!_912)
    {
        _406 = _876;
    }
    float _968 = _406;
    float _970 = _968;
    if (!_912)
    {
        _948 = _882;
    }
    float _972 = _948;
    float _974 = _972;
    if (!_912)
    {
        _408 = _890;
    }
    float _976 = _408;
    float _978 = _976;
    if (!_912)
    {
        _950 = as_type<float>(_868);
    }
    float _980 = _950;
    float _982 = _980;
    if (!_912)
    {
        _952 = _878;
    }
    float _984 = _952;
    float _986 = _984;
    if (!_912)
    {
        _954 = _884;
    }
    float _988 = _954;
    float _990 = _988;
    if (!_914)
    {
        int _992 = _70 * 48;
        int _994 = _992 + 16;
        uint _996 = uint(int(uint(_992) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_996)] = as_type<uint>(_876);
        int _998 = _992 + 4;
        uint _1000 = uint(int(uint(_998) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1000)] = as_type<uint>(_882);
        int _1002 = _992 + 8;
        uint _1004 = uint(int(uint(_1002) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1004)] = as_type<uint>(_890);
        int _1006 = _992 + 12;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1008)] = uint(_868);
        int _1010 = _992 + 32;
        uint _1012 = uint(int(uint(_994) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1012)] = as_type<uint>(_878);
        int _1014 = _994 + 4;
        uint _1016 = uint(int(uint(_1014) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1016)] = as_type<uint>(_884);
        int _1018 = _994 + 8;
        uint _1020 = uint(int(uint(_1018) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1020)] = as_type<uint>(_892);
        int _1022 = _994 + 12;
        uint _1024 = uint(int(uint(_1022) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1024)] = uint(_870);
        uint _1026 = uint(int(uint(_1010) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1026)] = as_type<uint>(_880);
        int _1028 = _1010 + 4;
        uint _1030 = uint(int(uint(_1028) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1030)] = as_type<uint>(_886);
        int _1032 = _1010 + 8;
        uint _1034 = uint(int(uint(_1032) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1034)] = as_type<uint>(_894);
        int _1036 = _1010 + 12;
        uint _1038 = uint(int(uint(_1036) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1038)] = uint(_872);
    }
    bool _1040 = !_912;
    if (!_1040)
    {
        bool _1042 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1044 = !_1042;
        if (!_1044)
        {
            uint _1046 = uint(int(uint(_896) >> uint(2)));
            uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
            int _1050 = int(_1046) & 3;
            float _1052 = (*spvDescriptorSet0.cp_c6)._m0[int(_1048)][_1050];
            int _1054 = as_type<int>(_1052) * 48;
            int _1056 = 0;
            bool _1058;
            float _1154;
            float _1158;
            float _1162;
            float _1166;
            float _1180;
            float _1182;
            float _1194;
            float _1204;
            float _1206;
            float _1208;
            float _1210;
            float _1212;
            do
            {
                int _1060 = _1056;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1062 = uint(int(uint(_1054) >> uint(2)));
                float _1064 = as_type<float>(_39[int(_1062)]);
                int _1066 = _1054 + 4;
                uint _1068 = uint(int(uint(_1066) >> uint(2)));
                float _1070 = as_type<float>(_39[int(_1068)]);
                int _1072 = _1054 + 8;
                uint _1074 = uint(int(uint(_1072) >> uint(2)));
                float _1076 = as_type<float>(_39[int(_1074)]);
                int _1078 = _1054 + 12;
                uint _1080 = uint(int(uint(_1078) >> uint(2)));
                float _1082 = as_type<float>(_39[int(_1080)]);
                int _1084 = _1060 + 1;
                int _1086 = _1054 + 16;
                uint _1088 = uint(int(uint(_1086) >> uint(2)));
                float _1090 = as_type<float>(_39[int(_1088)]);
                int _1092 = _1054 + 20;
                uint _1094 = uint(int(uint(_1092) >> uint(2)));
                float _1096 = as_type<float>(_39[int(_1094)]);
                int _1098 = _1054 + 24;
                uint _1100 = uint(int(uint(_1098) >> uint(2)));
                float _1102 = as_type<float>(_39[int(_1100)]);
                int _1104 = _1054 + 28;
                uint _1106 = uint(int(uint(_1104) >> uint(2)));
                float _1108 = as_type<float>(_39[int(_1106)]);
                bool _1110 = uint(_1084) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1112 = _1054 + 32;
                uint _1114 = uint(int(uint(_1112) >> uint(2)));
                float _1116 = as_type<float>(_39[int(_1114)]);
                int _1118 = _1054 + 36;
                uint _1120 = uint(int(uint(_1118) >> uint(2)));
                float _1122 = as_type<float>(_39[int(_1120)]);
                int _1124 = _1054 + 40;
                uint _1126 = uint(int(uint(_1124) >> uint(2)));
                float _1128 = as_type<float>(_39[int(_1126)]);
                int _1130 = _1054 + 44;
                uint _1132 = uint(int(uint(_1130) >> uint(2)));
                float _1134 = as_type<float>(_39[int(_1132)]);
                float _1136 = _1070 * as_type<float>(_870);
                float _1138 = _878 * _1070;
                float _1140 = _884 * _1070;
                float _1142 = _892 * _1070;
                float _1144 = fma(_1064, as_type<float>(_868), _1136);
                float _1146 = fma(_876, _1064, _1138);
                float _1148 = fma(_882, _1064, _1140);
                float _1150 = fma(_890, _1064, _1142);
                float _1152 = fma(_1076, as_type<float>(_872), _1144);
                _1154 = fma(_880, _1076, _1146);
                float _1156 = _878 * _1096;
                _1158 = fma(_894, _1076, _1150);
                float _1160 = _1096 * as_type<float>(_870);
                _1162 = _1082 + _1152;
                float _1164 = _884 * _1096;
                _1166 = fma(_886, _1076, _1148);
                float _1168 = fma(_1090, as_type<float>(_868), _1160);
                float _1170 = fma(_876, _1090, _1156);
                float _1172 = fma(_882, _1090, _1164);
                float _1174 = _892 * _1096;
                float _1176 = fma(_1102, as_type<float>(_872), _1168);
                float _1178 = _1122 * as_type<float>(_870);
                _1180 = fma(_880, _1102, _1170);
                _1182 = fma(_886, _1102, _1172);
                float _1184 = _878 * _1122;
                float _1186 = _884 * _1122;
                float _1188 = _892 * _1122;
                float _1190 = fma(_1116, as_type<float>(_868), _1178);
                float _1192 = fma(_890, _1090, _1174);
                _1194 = _1108 + _1176;
                float _1196 = fma(_876, _1116, _1184);
                float _1198 = fma(_882, _1116, _1186);
                float _1200 = fma(_890, _1116, _1188);
                float _1202 = fma(_1128, as_type<float>(_872), _1190);
                _1204 = fma(_894, _1102, _1192);
                _1206 = fma(_880, _1128, _1196);
                _1208 = fma(_886, _1128, _1198);
                _1210 = fma(_894, _1128, _1200);
                _1212 = _1134 + _1202;
                uint _1214 = uint(int(uint(_888) >> uint(2)));
                _39[int(_1214)] = as_type<uint>(_1154);
                int _1216 = _888 + 4;
                uint _1218 = uint(int(uint(_1216) >> uint(2)));
                _39[int(_1218)] = as_type<uint>(_1166);
                int _1220 = _888 + 8;
                uint _1222 = uint(int(uint(_1220) >> uint(2)));
                _39[int(_1222)] = as_type<uint>(_1158);
                int _1224 = _888 + 12;
                uint _1226 = uint(int(uint(_1224) >> uint(2)));
                _39[int(_1226)] = as_type<uint>(_1162);
                int _1228 = _888 + 16;
                uint _1230 = uint(int(uint(_1228) >> uint(2)));
                _39[int(_1230)] = as_type<uint>(_1180);
                int _1232 = _888 + 20;
                uint _1234 = uint(int(uint(_1232) >> uint(2)));
                _39[int(_1234)] = as_type<uint>(_1182);
                int _1236 = _888 + 24;
                uint _1238 = uint(int(uint(_1236) >> uint(2)));
                _39[int(_1238)] = as_type<uint>(_1204);
                int _1240 = _888 + 28;
                uint _1242 = uint(int(uint(_1240) >> uint(2)));
                _39[int(_1242)] = as_type<uint>(_1194);
                int _1244 = _888 + 32;
                uint _1246 = uint(int(uint(_1244) >> uint(2)));
                _39[int(_1246)] = as_type<uint>(_1206);
                int _1248 = _888 + 36;
                uint _1250 = uint(int(uint(_1248) >> uint(2)));
                _39[int(_1250)] = as_type<uint>(_1208);
                int _1252 = _888 + 40;
                uint _1254 = uint(int(uint(_1252) >> uint(2)));
                _39[int(_1254)] = as_type<uint>(_1210);
                int _1256 = _888 + 44;
                uint _1258 = uint(int(uint(_1256) >> uint(2)));
                _39[int(_1258)] = as_type<uint>(_1212);
                _1058 = !_1110;
                _1056 = _1084;
            } while (_1058);
            _990 = _1182;
            _956 = _1208;
            _974 = _1166;
            _986 = _1180;
            _958 = _1206;
            _970 = _1154;
            _960 = _1204;
            _978 = _1158;
            _962 = _1210;
            _964 = _1194;
            _982 = _1162;
            _966 = _1212;
            _1260 = true;
        }
        else
        {
            _990 = 0.0;
            _956 = 0.0;
            _974 = 0.0;
            _986 = 0.0;
            _958 = 0.0;
            _970 = 0.0;
            _960 = 0.0;
            _978 = 0.0;
            _962 = 0.0;
            _964 = 0.0;
            _982 = 0.0;
            _966 = 0.0;
        }
    }
    _1260 = false;
    float _1262 = _990;
    float _1264 = _956;
    float _1266 = _974;
    float _1268 = _986;
    float _1270 = _958;
    float _1272 = _970;
    float _1274 = _960;
    float _1276 = _978;
    float _1278 = _962;
    float _1280 = _964;
    float _1282 = _982;
    float _1284 = _966;
    int _1286 = _896 + 80;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
    int _1292 = int(_1288) & 3;
    float _1294 = (*spvDescriptorSet0.cp_c6)._m0[int(_1290)][_1292];
    int _1296 = int(_1288) + 1;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    int _1300 = _1296 & 3;
    float _1302 = (*spvDescriptorSet0.cp_c6)._m0[int(_1298)][_1300];
    int _1304 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1306 = _1304 + _70;
    int _1308 = _896 + 64;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.cp_c6)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.cp_c6)._m0[int(_1320)][_1322];
    int _1326 = _1306 * 48;
    int _1328 = _896 + 88;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.cp_c6)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.cp_c6)._m0[int(_1340)][_1342];
    int _1346 = _896 + 72;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    uint _1350 = uint(int(uint(int(_1348)) >> uint(2)));
    int _1352 = int(_1348) & 3;
    float _1354 = (*spvDescriptorSet0.cp_c6)._m0[int(_1350)][_1352];
    int _1356 = int(_1348) + 1;
    uint _1358 = uint(int(uint(_1356) >> uint(2)));
    int _1360 = _1356 & 3;
    float _1362 = (*spvDescriptorSet0.cp_c6)._m0[int(_1358)][_1360];
    int _1364 = _896 + 96;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.cp_c6)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.cp_c6)._m0[int(_1376)][_1378];
    int _1382 = _896 + 104;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    uint _1386 = uint(int(uint(int(_1384)) >> uint(2)));
    int _1388 = int(_1384) & 3;
    float _1390 = (*spvDescriptorSet0.cp_c6)._m0[int(_1386)][_1388];
    int _1392 = int(_1384) + 1;
    uint _1394 = uint(int(uint(_1392) >> uint(2)));
    int _1396 = _1392 & 3;
    float _1398 = (*spvDescriptorSet0.cp_c6)._m0[int(_1394)][_1396];
    float _1400 = _1262 * _1294;
    float _1402 = _1264 * _1294;
    int _1404 = _896 + 16;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.cp_c6)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.cp_c6)._m0[int(_1416)][_1418];
    float _1422 = _1266 * _1294;
    float _1424 = fma(_1268, _1316, _1400);
    float _1426 = _1266 * _1302;
    int _1428 = _896 + 32;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    uint _1432 = uint(int(uint(int(_1430)) >> uint(2)));
    int _1434 = int(_1430) & 3;
    float _1436 = (*spvDescriptorSet0.cp_c6)._m0[int(_1432)][_1434];
    int _1438 = int(_1430) + 1;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    int _1442 = _1438 & 3;
    float _1444 = (*spvDescriptorSet0.cp_c6)._m0[int(_1440)][_1442];
    float _1446 = fma(_1270, _1316, _1402);
    float _1448 = _1262 * _1302;
    float _1450 = fma(_1272, _1324, _1426);
    float _1452 = _1264 * _1302;
    float _1454 = fma(_1272, _1316, _1422);
    float _1456 = _1266 * _1336;
    float _1458 = _1266 * _1344;
    int _1460 = _896 + 48;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.cp_c6)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.cp_c6)._m0[int(_1472)][_1474];
    float _1478 = _1262 * _1336;
    float _1480 = _1262 * _1344;
    float _1482 = _1264 * _1336;
    float _1484 = _1264 * _1344;
    float _1486 = fma(_1268, _1324, _1448);
    float _1488 = fma(_1270, _1324, _1452);
    float _1490 = fma(_1272, _1354, _1456);
    int _1492 = _896 + 24;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
    int _1498 = int(_1494) & 3;
    float _1500 = (*spvDescriptorSet0.cp_c6)._m0[int(_1496)][_1498];
    int _1502 = int(_1494) + 1;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    int _1506 = _1502 & 3;
    float _1508 = (*spvDescriptorSet0.cp_c6)._m0[int(_1504)][_1506];
    float _1510 = fma(_1272, _1362, _1458);
    float _1512 = fma(_1268, _1354, _1478);
    float _1514 = fma(_1268, _1362, _1480);
    float _1516 = fma(_1270, _1354, _1482);
    float _1518 = fma(_1270, _1362, _1484);
    float _1520 = fma(_1274, _1372, _1424);
    float _1522 = fma(_1274, _1380, _1486);
    int _1524 = _896 + 40;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.cp_c6)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.cp_c6)._m0[int(_1536)][_1538];
    float _1542 = fma(_1276, _1380, _1450);
    float _1544 = fma(_1278, _1372, _1446);
    float _1546 = fma(_1278, _1380, _1488);
    float _1548 = fma(_1276, _1372, _1454);
    float _1550 = fma(_1274, _1390, _1512);
    float _1552 = fma(_1274, _1398, _1514);
    int _1554 = _896 + 56;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.cp_c6)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.cp_c6)._m0[int(_1566)][_1568];
    float _1572 = fma(_1276, _1398, _1510);
    float _1574 = fma(_1278, _1398, _1518);
    float _1576 = _1552 + _1280;
    float _1578 = fma(_1278, _1390, _1516);
    float _1580 = _1572 + _1282;
    float _1582 = fma(_1276, _1390, _1490);
    float _1584 = _1574 + _1284;
    float _1586 = _1576 * _1420;
    float _1588 = _1522 * _1420;
    float _1590 = _1550 * _1420;
    float _1592 = _1520 * _1420;
    float _1594 = fma(_1580, _1412, _1586);
    float _1596 = fma(_1542, _1412, _1588);
    float _1598 = fma(_1582, _1412, _1590);
    float _1600 = fma(_1548, _1412, _1592);
    float _1602 = _1576 * _1444;
    float _1604 = _1520 * _1444;
    float _1606 = _1522 * _1444;
    float _1608 = _1550 * _1444;
    float _1610 = fma(_1580, _1436, _1602);
    float _1612 = fma(_1548, _1436, _1604);
    float _1614 = fma(_1542, _1436, _1606);
    float _1616 = fma(_1582, _1436, _1608);
    float _1618 = _1576 * _1476;
    float _1620 = _1522 * _1476;
    float _1622 = _1520 * _1476;
    float _1624 = _1550 * _1476;
    float _1626 = fma(_1580, _1468, _1618);
    float _1628 = fma(_1542, _1468, _1620);
    float _1630 = fma(_1548, _1468, _1622);
    float _1632 = fma(_1582, _1468, _1624);
    float _1634 = fma(_1584, _1500, _1594);
    float _1636 = fma(_1546, _1500, _1596);
    float _1638 = fma(_1578, _1500, _1598);
    float _1640 = fma(_1544, _1500, _1600);
    float _1642 = _1634 + _1508;
    int _1644 = _1326 + 16;
    int _1646 = _1326 + 32;
    float _1648 = fma(_1584, _1532, _1610);
    float _1650 = fma(_1544, _1532, _1612);
    float _1652 = fma(_1546, _1532, _1614);
    float _1654 = fma(_1578, _1532, _1616);
    float _1656 = _1648 + _1540;
    int _1658 = _1326 + 48;
    uint _1660 = uint(int(uint(_1644) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1660)] = as_type<uint>(_1640);
    int _1662 = _1644 + 4;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1664)] = as_type<uint>(_1636);
    int _1666 = _1644 + 8;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1668)] = as_type<uint>(_1638);
    int _1670 = _1644 + 12;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1672)] = as_type<uint>(_1642);
    float _1674 = fma(_1584, _1562, _1626);
    float _1676 = fma(_1544, _1562, _1630);
    float _1678 = fma(_1546, _1562, _1628);
    float _1680 = fma(_1578, _1562, _1632);
    float _1682 = _1674 + _1570;
    uint _1684 = uint(int(uint(_1646) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1684)] = as_type<uint>(_1650);
    int _1686 = _1646 + 4;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1688)] = as_type<uint>(_1652);
    int _1690 = _1646 + 8;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1692)] = as_type<uint>(_1654);
    int _1694 = _1646 + 12;
    uint _1696 = uint(int(uint(_1694) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1696)] = as_type<uint>(_1656);
    uint _1698 = uint(int(uint(_1658) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1698)] = as_type<uint>(_1676);
    int _1700 = _1658 + 4;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1702)] = as_type<uint>(_1678);
    int _1704 = _1658 + 8;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1706)] = as_type<uint>(_1680);
    int _1708 = _1658 + 12;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1710)] = as_type<uint>(_1682);
}

