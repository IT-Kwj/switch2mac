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
int _60(thread const int& _4672, thread const int& _4673, constant _10& support_buffer)
{
    int _4676 = 1 + _4673;
    float _4678 = support_buffer._m5[_4676].x;
    bool _4680 = _4678 == 1.0;
    if (_4680)
    {
        return _4672;
    }
    float _4682 = float(_4672);
    float _4684 = _4682 * _4678;
    int _4686 = int(_4684);
    return _4686;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4360, thread const int& _4361, thread const int& _4362, thread const int& _4363, thread int& _4364, thread int& _4365, thread int& _4366, thread int& _4367, thread int& _4368, thread int& _4369)
{
    float _4372 = as_type<float>(_4361) + 0.0;
    bool _4374 = _4372 != 0.0;
    bool _4376 = isnan(_4372);
    bool _4378 = _4374 || _4376;
    bool _4380 = isnan(0.0);
    bool _4382 = _4378 || _4380;
    int _4384 = as_type<int>(_4372);
    int _4386 = _4361;
    int _4388 = _4362;
    int _4390 = _4382 ? (-1) : 0;
    if (!_4382)
    {
        float _4392 = as_type<float>(_4361) * 1.0;
        _4384 = as_type<int>(_4392);
    }
    int _4394 = _4384;
    bool _4396 = !_4382;
    int _4398 = _4394;
    if (!_4396)
    {
        float _4400 = as_type<float>(_4361) + 0.0;
        bool _4402 = _4400 >= 0.0;
        bool _4404 = isnan(_4400);
        bool _4406 = _4402 || _4404;
        bool _4408 = isnan(0.0);
        bool _4410 = _4406 || _4408;
        int _4412 = as_type<int>(_4400);
        _4390 = _4410 ? (-1) : 0;
        if (!_4410)
        {
            _4412 = 2147483647;
        }
        int _4414 = _4412;
        bool _4416 = !_4410;
        _4398 = _4414;
        if (!_4416)
        {
            float _4418 = as_type<float>(_4361) + 0.0;
            bool _4420 = _4418 > as_type<float>(0x7f800000u /* inf */);
            bool _4422 = isnan(_4418);
            bool _4424 = _4420 || _4422;
            bool _4426 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4428 = _4424 || _4426;
            int _4430 = as_type<int>(_4418);
            _4390 = _4428 ? (-1) : 0;
            if (_4428)
            {
                float _4432 = as_type<float>(_4361) + 1.0;
                _4430 = as_type<int>(_4432);
            }
            int _4434 = _4430;
            _4398 = _4434;
            if (!_4428)
            {
                float _4436 = 0.0 + as_type<float>(_4361);
                bool _4438 = _4436 != as_type<float>(0x7f800000u /* inf */);
                bool _4440 = isnan(_4436);
                bool _4442 = _4438 || _4440;
                bool _4444 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4446 = _4442 || _4444;
                int _4448 = as_type<int>(_4436);
                _4390 = _4446 ? (-1) : 0;
                if (!_4446)
                {
                    _4448 = _4361;
                }
                int _4450 = _4448;
                bool _4452 = !_4446;
                _4398 = _4450;
                if (!_4452)
                {
                    float _4454 = as_type<float>(_4361) * 18446744073709551616.0;
                    float _4456 = rsqrt(_4454);
                    float _4458 = _4454 * _4456;
                    float _4460 = _4456 * 0.5;
                    float _4462 = -_4458;
                    float _4464 = 0.0 + _4462;
                    float _4466 = fma(_4460, _4464, 0.5);
                    float _4468 = fma(_4458, _4466, _4458);
                    float _4470 = -_4468;
                    float _4472 = 0.0 + _4470;
                    float _4474 = fma(_4468, _4472, _4454);
                    float _4476 = fma(_4460, _4474, _4468);
                    float _4478 = _4476 * 2.3283064365386962890625e-10;
                    _4398 = as_type<int>(_4478);
                    _4386 = as_type<int>(_4464);
                    _4388 = as_type<int>(_4468);
                }
            }
        }
    }
    int _4480 = _4398;
    int _4482 = _4386;
    int _4484 = _4388;
    int _4486 = _4390;
    _4364 = _4480;
    _4365 = _4363;
    _4366 = 0;
    _4367 = _4482;
    _4368 = _4484;
    _4369 = _4486;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1234 = false;
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
        int3 _1932 = int3(_185, _191, as_type<int>(_153));
        float4 _194 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1932.xy), uint(_1932.z), 0).xyzw;
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
        int3 _1964 = int3(_222, _228, 0);
        float3 _232 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1964.xy), uint(_1964.z), 0).xyz;
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
        int3 _1995 = int3(_256, _262, as_type<int>(_169));
        float3 _264 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1995.xy), uint(_1995.z), 0).xyz;
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
        int3 _2024 = int3(_290, _296, as_type<int>(_171));
        float4 _298 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2024.xy), uint(_2024.z), 0).xyzw;
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
    float _326 = 0.0;
    float _328 = _320;
    float _330 = _322;
    if (!_131)
    {
        _324 = 0.0;
        _326 = 0.0;
    }
    float _332 = _324;
    float _334 = _326;
    float _336 = 0.0;
    float _338 = 0.0;
    float _340 = _332;
    float _342 = _334;
    if (!_131)
    {
        _336 = 0.0;
        _338 = 0.0;
    }
    float _344 = _336;
    float _346 = _338;
    float _348 = 0.0;
    float _350 = _344;
    float _352 = _346;
    if (!_131)
    {
        _348 = 0.0;
    }
    float _354 = _348;
    float _356 = 0.0;
    float _358 = _354;
    if (!_131)
    {
        _137 = 0.0;
        _356 = 0.0;
    }
    float _360 = _137;
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
        _374 = _310;
        _358 = _308;
        _366 = _312;
        _368 = _314;
        _340 = _242;
        _328 = _240;
        _330 = _244;
        _350 = _272;
        _352 = _274;
        _342 = _276;
    }
    float _376 = _374;
    float _378 = _358;
    float _380 = _366;
    float _382 = _368;
    float _384 = _340;
    float _386 = _328;
    float _388 = _330;
    float _390 = _350;
    float _392 = _352;
    float _394 = _342;
    bool _396 = !_127;
    float _398 = _386;
    float _400 = _384;
    float _402 = _388;
    float _404 = _394;
    float _406 = _392;
    float _408 = _390;
    float _772;
    float _774;
    float _776;
    float _778;
    float _780;
    float _782;
    float _784;
    float _786;
    float _788;
    int _790;
    int _792;
    int _794;
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
            int _470 = _165;
            int _472 = 1072;
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
        int3 _2281 = int3(_532, _538, 0);
        float3 _540 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2281.xy), uint(_2281.z), 0).xyz;
        float _542 = _540.x;
        float _544 = _540.y;
        float _546 = _540.z;
        int _548 = _70;
        int _550 = 0;
        int _552 = _60(_548, _550, (*spvDescriptorSet0.support_buffer));
        int _554 = as_type<int>(_526);
        int _556 = 0;
        int _558 = _60(_554, _556, (*spvDescriptorSet0.support_buffer));
        int3 _2299 = int3(_552, _558, 2);
        float3 _560 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2299.xy), uint(_2299.z), 0).xyz;
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
        float _596 = 0.0;
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
        float _678 = _562 * _666;
        float _680 = _564 * _666;
        float _682 = _206 * _674;
        float _684 = _210 * _674;
        int _686 = _103 + 20;
        uint _688 = uint(int(uint(_686) >> uint(2)));
        uint _690 = uint(int(uint(int(_688)) >> uint(2)));
        int _692 = int(_688) & 3;
        float _694 = (*spvDescriptorSet0.cp_c5)._m0[int(_690)][_692];
        float _696 = _204 * _674;
        float _698 = _208 * _674;
        float _700 = fma(_382, _668, _684);
        float _702 = fma(_376, _668, _682);
        float _704 = fma(_378, _668, _696);
        float _706 = _700 * 2.0;
        float _708 = fma(_380, _668, _698);
        float _710 = _702 * _702;
        float _712 = _704 * _704;
        float _714 = _704 * 2.0;
        float _716 = _704 * _706;
        float _718 = _702 * 2.0;
        float _720 = _708 * _708;
        float _722 = fma(_710, -2.0, 1.0);
        float _724 = _708 * _706;
        float _726 = fma(_712, -2.0, 1.0);
        float _728 = _702 * _706;
        float _730 = -_716;
        float _732 = fma(_708, _718, _730);
        float _734 = fma(_708, _718, _716);
        float _736 = fma(_720, -2.0, _722);
        float _738 = -_724;
        float _740 = fma(_702, _714, _738);
        float _742 = _544 * _666;
        float _744 = fma(_702, _714, _724);
        float _746 = fma(_708, _714, _728);
        float _748 = -_728;
        float _750 = fma(_708, _714, _748);
        float _752 = fma(_710, -2.0, _726);
        float _754 = fma(_384, _694, _742);
        float _756 = _546 * _666;
        float _758 = _566 * _666;
        float _760 = fma(_720, -2.0, _726);
        float _762 = fma(_386, _694, _676);
        float _764 = fma(_388, _694, _756);
        float _766 = fma(_390, _694, _678);
        float _768 = fma(_392, _694, _680);
        float _770 = fma(_394, _694, _758);
        _398 = _762;
        _772 = _750;
        _774 = _736;
        _776 = _744;
        _400 = _754;
        _778 = _740;
        _780 = _760;
        _782 = _734;
        _402 = _764;
        _784 = _746;
        _786 = _732;
        _788 = _752;
        _790 = as_type<int>(_766);
        _792 = as_type<int>(_768);
        _794 = as_type<int>(_770);
        _796 = true;
    }
    else
    {
        float _798 = _382 * 2.0;
        float _800 = _378 * _378;
        float _802 = _376 * _376;
        float _804 = _378 * 2.0;
        float _806 = _798 * _380;
        float _808 = _798 * _376;
        float _810 = _798 * _378;
        float _812 = _376 * 2.0;
        float _814 = fma(_800, -2.0, 1.0);
        float _816 = _380 * _380;
        float _818 = fma(_802, -2.0, 1.0);
        float _820 = -_806;
        float _822 = fma(_804, _376, _820);
        float _824 = fma(_804, _376, _806);
        float _826 = fma(_804, _380, _808);
        float _828 = -_808;
        float _830 = fma(_804, _380, _828);
        float _832 = -_810;
        float _834 = fma(_812, _380, _832);
        float _836 = fma(_812, _380, _810);
        float _838 = fma(_816, -2.0, _818);
        float _840 = fma(_816, -2.0, _814);
        float _842 = fma(_802, -2.0, _814);
        _772 = _830;
        _774 = _838;
        _776 = _824;
        _778 = _822;
        _780 = _840;
        _782 = _836;
        _784 = _826;
        _786 = _834;
        _788 = _842;
        _790 = as_type<int>(_390);
        _792 = as_type<int>(_392);
        _794 = as_type<int>(_394);
    }
    _796 = false;
    float _844 = _398;
    float _846 = _772;
    float _848 = _774;
    float _850 = _776;
    float _852 = _400;
    float _854 = _778;
    float _856 = _780;
    float _858 = _782;
    float _860 = _402;
    float _862 = _784;
    float _864 = _786;
    float _866 = _788;
    int _868 = _790;
    int _870 = _792;
    int _872 = _794;
    float _874 = _844 * _846;
    float _876 = _844 * _848;
    float _878 = _844 * _850;
    float _880 = _852 * _854;
    float _882 = _852 * _856;
    float _884 = _852 * _858;
    int _886 = _70 * 48;
    float _888 = _860 * _862;
    float _890 = _860 * _864;
    float _892 = _860 * _866;
    bool _894 = _70 != 0;
    uint _896 = uint(int(uint(_886) >> uint(2)));
    _39[int(_896)] = as_type<uint>(_876);
    int _898 = _886 + 4;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    _39[int(_900)] = as_type<uint>(_880);
    int _902 = _886 + 8;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    _39[int(_904)] = as_type<uint>(_888);
    int _906 = _886 + 12;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    _39[int(_908)] = uint(_868);
    int _910 = _70 * 112;
    int _912 = _886 + 16;
    int _914 = _886 + 16;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    _39[int(_916)] = as_type<uint>(_878);
    int _918 = _886 + 20;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    _39[int(_920)] = as_type<uint>(_882);
    int _922 = _886 + 24;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    _39[int(_924)] = as_type<uint>(_890);
    int _926 = _886 + 28;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    _39[int(_928)] = uint(_870);
    int _930 = _886 + 32;
    int _932 = _886 + 32;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    _39[int(_934)] = as_type<uint>(_874);
    int _936 = _886 + 36;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    _39[int(_938)] = as_type<uint>(_884);
    int _940 = _886 + 40;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    _39[int(_942)] = as_type<uint>(_892);
    int _944 = _886 + 44;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    _39[int(_946)] = uint(_872);
    float _948 = _852;
    float _950 = _854;
    float _952 = _848;
    float _954 = _844;
    float _956 = _860;
    float _958 = _864;
    float _960 = _856;
    float _962 = _850;
    float _964 = _862;
    if (!_894)
    {
        _404 = _876;
    }
    float _966 = _404;
    float _968 = _966;
    if (!_894)
    {
        _948 = _880;
    }
    float _970 = _948;
    float _972 = _970;
    if (!_894)
    {
        _406 = _888;
    }
    float _974 = _406;
    float _976 = _974;
    if (!_894)
    {
        _408 = as_type<float>(_868);
    }
    float _978 = _408;
    float _980 = _978;
    if (!_894)
    {
        _950 = _878;
    }
    float _982 = _950;
    float _984 = _982;
    if (!_894)
    {
        _952 = _882;
    }
    float _986 = _952;
    float _988 = _986;
    if (!_894)
    {
        _954 = _890;
    }
    float _990 = _954;
    float _992 = _990;
    if (!_894)
    {
        _956 = as_type<float>(_870);
    }
    float _994 = _956;
    float _996 = _994;
    if (!_894)
    {
        _958 = _874;
    }
    float _998 = _958;
    float _1000 = _998;
    if (!_894)
    {
        _960 = _884;
    }
    float _1002 = _960;
    float _1004 = _1002;
    if (!_894)
    {
        _962 = _892;
    }
    float _1006 = _962;
    float _1008 = _1006;
    if (!_894)
    {
        _964 = as_type<float>(_872);
    }
    float _1010 = _964;
    bool _1012 = !_894;
    float _1014 = _1010;
    if (!_1012)
    {
        bool _1016 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1018 = !_1016;
        if (!_1018)
        {
            uint _1020 = uint(int(uint(_910) >> uint(2)));
            uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
            int _1024 = int(_1020) & 3;
            float _1026 = (*spvDescriptorSet0.cp_c6)._m0[int(_1022)][_1024];
            int _1028 = as_type<int>(_1026) * 48;
            int _1030 = 0;
            bool _1032;
            float _1130;
            float _1132;
            float _1140;
            float _1150;
            float _1152;
            float _1164;
            float _1176;
            float _1178;
            float _1180;
            float _1182;
            float _1184;
            float _1186;
            do
            {
                int _1034 = _1030;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1036 = uint(int(uint(_1028) >> uint(2)));
                float _1038 = as_type<float>(_39[int(_1036)]);
                int _1040 = _1028 + 4;
                uint _1042 = uint(int(uint(_1040) >> uint(2)));
                float _1044 = as_type<float>(_39[int(_1042)]);
                int _1046 = _1028 + 8;
                uint _1048 = uint(int(uint(_1046) >> uint(2)));
                float _1050 = as_type<float>(_39[int(_1048)]);
                int _1052 = _1028 + 12;
                uint _1054 = uint(int(uint(_1052) >> uint(2)));
                float _1056 = as_type<float>(_39[int(_1054)]);
                int _1058 = _1034 + 1;
                int _1060 = _1028 + 16;
                uint _1062 = uint(int(uint(_1060) >> uint(2)));
                float _1064 = as_type<float>(_39[int(_1062)]);
                int _1066 = _1028 + 20;
                uint _1068 = uint(int(uint(_1066) >> uint(2)));
                float _1070 = as_type<float>(_39[int(_1068)]);
                int _1072 = _1028 + 24;
                uint _1074 = uint(int(uint(_1072) >> uint(2)));
                float _1076 = as_type<float>(_39[int(_1074)]);
                int _1078 = _1028 + 28;
                uint _1080 = uint(int(uint(_1078) >> uint(2)));
                float _1082 = as_type<float>(_39[int(_1080)]);
                bool _1084 = uint(_1058) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1086 = _1028 + 32;
                uint _1088 = uint(int(uint(_1086) >> uint(2)));
                float _1090 = as_type<float>(_39[int(_1088)]);
                int _1092 = _1028 + 36;
                uint _1094 = uint(int(uint(_1092) >> uint(2)));
                float _1096 = as_type<float>(_39[int(_1094)]);
                int _1098 = _1028 + 40;
                uint _1100 = uint(int(uint(_1098) >> uint(2)));
                float _1102 = as_type<float>(_39[int(_1100)]);
                int _1104 = _1028 + 44;
                uint _1106 = uint(int(uint(_1104) >> uint(2)));
                float _1108 = as_type<float>(_39[int(_1106)]);
                float _1110 = _1044 * as_type<float>(_870);
                float _1112 = _878 * _1044;
                float _1114 = _882 * _1044;
                float _1116 = _890 * _1044;
                float _1118 = fma(_1038, as_type<float>(_868), _1110);
                float _1120 = fma(_876, _1038, _1112);
                float _1122 = fma(_880, _1038, _1114);
                float _1124 = fma(_888, _1038, _1116);
                float _1126 = fma(_1050, as_type<float>(_872), _1118);
                float _1128 = _1070 * as_type<float>(_870);
                _1130 = fma(_874, _1050, _1120);
                _1132 = fma(_884, _1050, _1122);
                float _1134 = _878 * _1070;
                float _1136 = _882 * _1070;
                float _1138 = fma(_1064, as_type<float>(_868), _1128);
                _1140 = _1056 + _1126;
                float _1142 = fma(_876, _1064, _1134);
                float _1144 = fma(_880, _1064, _1136);
                float _1146 = fma(_1076, as_type<float>(_872), _1138);
                float _1148 = _1096 * as_type<float>(_870);
                _1150 = fma(_874, _1076, _1142);
                _1152 = fma(_884, _1076, _1144);
                float _1154 = _878 * _1096;
                float _1156 = _882 * _1096;
                float _1158 = _890 * _1070;
                float _1160 = _890 * _1096;
                float _1162 = fma(_1090, as_type<float>(_868), _1148);
                _1164 = _1082 + _1146;
                float _1166 = fma(_888, _1064, _1158);
                float _1168 = fma(_876, _1090, _1154);
                float _1170 = fma(_880, _1090, _1156);
                float _1172 = fma(_888, _1090, _1160);
                float _1174 = fma(_1102, as_type<float>(_872), _1162);
                _1176 = fma(_892, _1050, _1124);
                _1178 = fma(_892, _1076, _1166);
                _1180 = fma(_874, _1102, _1168);
                _1182 = fma(_884, _1102, _1170);
                _1184 = fma(_892, _1102, _1172);
                _1186 = _1108 + _1174;
                uint _1188 = uint(int(uint(_886) >> uint(2)));
                _39[int(_1188)] = as_type<uint>(_1130);
                int _1190 = _886 + 4;
                uint _1192 = uint(int(uint(_1190) >> uint(2)));
                _39[int(_1192)] = as_type<uint>(_1132);
                int _1194 = _886 + 8;
                uint _1196 = uint(int(uint(_1194) >> uint(2)));
                _39[int(_1196)] = as_type<uint>(_1176);
                int _1198 = _886 + 12;
                uint _1200 = uint(int(uint(_1198) >> uint(2)));
                _39[int(_1200)] = as_type<uint>(_1140);
                int _1202 = _886 + 16;
                uint _1204 = uint(int(uint(_1202) >> uint(2)));
                _39[int(_1204)] = as_type<uint>(_1150);
                int _1206 = _886 + 20;
                uint _1208 = uint(int(uint(_1206) >> uint(2)));
                _39[int(_1208)] = as_type<uint>(_1152);
                int _1210 = _886 + 24;
                uint _1212 = uint(int(uint(_1210) >> uint(2)));
                _39[int(_1212)] = as_type<uint>(_1178);
                int _1214 = _886 + 28;
                uint _1216 = uint(int(uint(_1214) >> uint(2)));
                _39[int(_1216)] = as_type<uint>(_1164);
                int _1218 = _886 + 32;
                uint _1220 = uint(int(uint(_1218) >> uint(2)));
                _39[int(_1220)] = as_type<uint>(_1180);
                int _1222 = _886 + 36;
                uint _1224 = uint(int(uint(_1222) >> uint(2)));
                _39[int(_1224)] = as_type<uint>(_1182);
                int _1226 = _886 + 40;
                uint _1228 = uint(int(uint(_1226) >> uint(2)));
                _39[int(_1228)] = as_type<uint>(_1184);
                int _1230 = _886 + 44;
                uint _1232 = uint(int(uint(_1230) >> uint(2)));
                _39[int(_1232)] = as_type<uint>(_1186);
                _1032 = !_1084;
                _1030 = _1058;
            } while (_1032);
            _968 = _1130;
            _972 = _1132;
            _976 = _1176;
            _980 = _1140;
            _984 = _1150;
            _988 = _1152;
            _992 = _1178;
            _996 = _1164;
            _1000 = _1180;
            _1004 = _1182;
            _1008 = _1184;
            _1014 = _1186;
            _1234 = true;
        }
        else
        {
            _968 = 0.0;
            _972 = 0.0;
            _976 = 0.0;
            _980 = 0.0;
            _984 = 0.0;
            _988 = 0.0;
            _992 = 0.0;
            _996 = 0.0;
            _1000 = 0.0;
            _1004 = 0.0;
            _1008 = 0.0;
            _1014 = 0.0;
        }
    }
    _1234 = false;
    float _1236 = _968;
    float _1238 = _972;
    float _1240 = _976;
    float _1242 = _980;
    float _1244 = _984;
    float _1246 = _988;
    float _1248 = _992;
    float _1250 = _996;
    float _1252 = _1000;
    float _1254 = _1004;
    float _1256 = _1008;
    float _1258 = _1014;
    int _1260 = _910 + 80;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    uint _1264 = uint(int(uint(int(_1262)) >> uint(2)));
    int _1266 = int(_1262) & 3;
    float _1268 = (*spvDescriptorSet0.cp_c6)._m0[int(_1264)][_1266];
    int _1270 = int(_1262) + 1;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    int _1274 = _1270 & 3;
    float _1276 = (*spvDescriptorSet0.cp_c6)._m0[int(_1272)][_1274];
    bool _1278 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1280 = _910 + 64;
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
    int _1302 = _910 + 88;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    uint _1306 = uint(int(uint(int(_1304)) >> uint(2)));
    int _1308 = int(_1304) & 3;
    float _1310 = (*spvDescriptorSet0.cp_c6)._m0[int(_1306)][_1308];
    int _1312 = int(_1304) + 1;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    int _1316 = _1312 & 3;
    float _1318 = (*spvDescriptorSet0.cp_c6)._m0[int(_1314)][_1316];
    int _1320 = _910 + 72;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.cp_c6)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.cp_c6)._m0[int(_1332)][_1334];
    int _1338 = _910 + 96;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    uint _1342 = uint(int(uint(int(_1340)) >> uint(2)));
    int _1344 = int(_1340) & 3;
    float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
    int _1348 = int(_1340) + 1;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    int _1352 = _1348 & 3;
    float _1354 = (*spvDescriptorSet0.cp_c6)._m0[int(_1350)][_1352];
    int _1356 = _910 + 104;
    uint _1358 = uint(int(uint(_1356) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.cp_c6)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.cp_c6)._m0[int(_1368)][_1370];
    int _1374 = _910 + 16;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    uint _1378 = uint(int(uint(int(_1376)) >> uint(2)));
    int _1380 = int(_1376) & 3;
    float _1382 = (*spvDescriptorSet0.cp_c6)._m0[int(_1378)][_1380];
    int _1384 = int(_1376) + 1;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    int _1388 = _1384 & 3;
    float _1390 = (*spvDescriptorSet0.cp_c6)._m0[int(_1386)][_1388];
    if (!_1278)
    {
        uint _1392 = uint(int(uint(_886) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1392)] = as_type<uint>(_1236);
        int _1394 = _886 + 4;
        uint _1396 = uint(int(uint(_1394) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1396)] = as_type<uint>(_1238);
        int _1398 = _886 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1400)] = as_type<uint>(_1240);
        int _1402 = _886 + 12;
        uint _1404 = uint(int(uint(_1402) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1404)] = as_type<uint>(_1242);
        uint _1406 = uint(int(uint(_912) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1406)] = as_type<uint>(_1244);
        int _1408 = _912 + 4;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1410)] = as_type<uint>(_1246);
        int _1412 = _912 + 8;
        uint _1414 = uint(int(uint(_1412) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1414)] = as_type<uint>(_1248);
        int _1416 = _912 + 12;
        uint _1418 = uint(int(uint(_1416) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1418)] = as_type<uint>(_1250);
        uint _1420 = uint(int(uint(_930) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1420)] = as_type<uint>(_1252);
        int _1422 = _930 + 4;
        uint _1424 = uint(int(uint(_1422) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1424)] = as_type<uint>(_1254);
        int _1426 = _930 + 8;
        uint _1428 = uint(int(uint(_1426) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1428)] = as_type<uint>(_1256);
        int _1430 = _930 + 12;
        uint _1432 = uint(int(uint(_1430) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1432)] = as_type<uint>(_1258);
    }
    float _1434 = _1246 * _1268;
    float _1436 = _1254 * _1268;
    int _1438 = _910 + 32;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
    int _1444 = int(_1440) & 3;
    float _1446 = (*spvDescriptorSet0.cp_c6)._m0[int(_1442)][_1444];
    int _1448 = int(_1440) + 1;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    int _1452 = _1448 & 3;
    float _1454 = (*spvDescriptorSet0.cp_c6)._m0[int(_1450)][_1452];
    float _1456 = _1238 * _1268;
    float _1458 = fma(_1244, _1288, _1434);
    float _1460 = fma(_1252, _1288, _1436);
    float _1462 = _1238 * _1276;
    float _1464 = _1246 * _1276;
    float _1466 = _1254 * _1276;
    float _1468 = _1238 * _1318;
    int _1470 = _910 + 48;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.cp_c6)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.cp_c6)._m0[int(_1482)][_1484];
    float _1488 = fma(_1236, _1296, _1462);
    float _1490 = _1238 * _1310;
    float _1492 = fma(_1244, _1296, _1464);
    float _1494 = fma(_1252, _1296, _1466);
    float _1496 = _1246 * _1310;
    float _1498 = _1246 * _1318;
    float _1500 = _1254 * _1310;
    float _1502 = _1254 * _1318;
    int _1504 = _910 + 24;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.cp_c6)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.cp_c6)._m0[int(_1516)][_1518];
    float _1522 = fma(_1236, _1328, _1490);
    float _1524 = fma(_1236, _1336, _1468);
    float _1526 = fma(_1244, _1328, _1496);
    float _1528 = fma(_1244, _1336, _1498);
    float _1530 = fma(_1252, _1328, _1500);
    float _1532 = fma(_1252, _1336, _1502);
    float _1534 = fma(_1240, _1354, _1488);
    int _1536 = _910 + 40;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
    int _1542 = int(_1538) & 3;
    float _1544 = (*spvDescriptorSet0.cp_c6)._m0[int(_1540)][_1542];
    int _1546 = int(_1538) + 1;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    int _1550 = _1546 & 3;
    float _1552 = (*spvDescriptorSet0.cp_c6)._m0[int(_1548)][_1550];
    float _1554 = fma(_1248, _1346, _1458);
    float _1556 = fma(_1248, _1354, _1492);
    float _1558 = fma(_1248, _1364, _1526);
    float _1560 = fma(_1248, _1372, _1528);
    float _1562 = fma(_1236, _1288, _1456);
    float _1564 = fma(_1240, _1372, _1524);
    float _1566 = fma(_1256, _1372, _1532);
    int _1568 = _910 + 56;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.cp_c6)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.cp_c6)._m0[int(_1580)][_1582];
    float _1586 = _1560 + _1250;
    float _1588 = fma(_1240, _1346, _1562);
    float _1590 = fma(_1240, _1364, _1522);
    float _1592 = _1564 + _1242;
    float _1594 = _1558 * _1390;
    float _1596 = _1586 * _1390;
    float _1598 = _1566 + _1258;
    float _1600 = fma(_1256, _1346, _1460);
    float _1602 = fma(_1256, _1354, _1494);
    float _1604 = fma(_1256, _1364, _1530);
    float _1606 = _1556 * _1390;
    float _1608 = _1554 * _1390;
    float _1610 = fma(_1590, _1382, _1594);
    float _1612 = fma(_1592, _1382, _1596);
    float _1614 = _1586 * _1454;
    float _1616 = _1554 * _1454;
    float _1618 = _1556 * _1454;
    float _1620 = _1558 * _1454;
    float _1622 = fma(_1592, _1446, _1614);
    float _1624 = fma(_1534, _1382, _1606);
    int _1626 = _1300 * 48;
    float _1628 = fma(_1588, _1382, _1608);
    float _1630 = _1586 * _1486;
    float _1632 = _1554 * _1486;
    float _1634 = _1556 * _1486;
    float _1636 = _1558 * _1486;
    float _1638 = fma(_1592, _1478, _1630);
    float _1640 = fma(_1588, _1446, _1616);
    float _1642 = fma(_1534, _1446, _1618);
    float _1644 = fma(_1590, _1446, _1620);
    float _1646 = fma(_1588, _1478, _1632);
    float _1648 = fma(_1598, _1512, _1612);
    float _1650 = fma(_1534, _1478, _1634);
    float _1652 = fma(_1590, _1478, _1636);
    float _1654 = fma(_1602, _1512, _1624);
    float _1656 = fma(_1600, _1512, _1628);
    float _1658 = fma(_1604, _1512, _1610);
    float _1660 = _1648 + _1520;
    int _1662 = _1626 + 16;
    float _1664 = fma(_1598, _1544, _1622);
    float _1666 = fma(_1600, _1544, _1640);
    float _1668 = fma(_1602, _1544, _1642);
    float _1670 = fma(_1604, _1544, _1644);
    float _1672 = _1664 + _1552;
    int _1674 = _1626 + 32;
    int _1676 = _1626 + 48;
    float _1678 = fma(_1598, _1576, _1638);
    float _1680 = fma(_1600, _1576, _1646);
    float _1682 = fma(_1602, _1576, _1650);
    float _1684 = fma(_1604, _1576, _1652);
    float _1686 = _1678 + _1584;
    uint _1688 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1688)] = as_type<uint>(_1656);
    int _1690 = _1662 + 4;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1692)] = as_type<uint>(_1654);
    int _1694 = _1662 + 8;
    uint _1696 = uint(int(uint(_1694) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1696)] = as_type<uint>(_1658);
    int _1698 = _1662 + 12;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1700)] = as_type<uint>(_1660);
    uint _1702 = uint(int(uint(_1674) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1702)] = as_type<uint>(_1666);
    int _1704 = _1674 + 4;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1706)] = as_type<uint>(_1668);
    int _1708 = _1674 + 8;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1710)] = as_type<uint>(_1670);
    int _1712 = _1674 + 12;
    uint _1714 = uint(int(uint(_1712) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1714)] = as_type<uint>(_1672);
    uint _1716 = uint(int(uint(_1676) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1716)] = as_type<uint>(_1680);
    int _1718 = _1676 + 4;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1720)] = as_type<uint>(_1682);
    int _1722 = _1676 + 8;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1724)] = as_type<uint>(_1684);
    int _1726 = _1676 + 12;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1728)] = as_type<uint>(_1686);
}

