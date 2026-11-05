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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4492, thread const int& _4493, constant _10& support_buffer)
{
    int _4496 = 1 + _4493;
    float _4498 = support_buffer._m5[_4496].x;
    bool _4500 = _4498 == 1.0;
    if (_4500)
    {
        return _4492;
    }
    float _4502 = float(_4492);
    float _4504 = _4502 * _4498;
    int _4506 = int(_4504);
    return _4506;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4180, thread const int& _4181, thread const int& _4182, thread const int& _4183, thread int& _4184, thread int& _4185, thread int& _4186, thread int& _4187, thread int& _4188, thread int& _4189)
{
    float _4192 = as_type<float>(_4181) + 0.0;
    bool _4194 = _4192 != 0.0;
    bool _4196 = isnan(_4192);
    bool _4198 = _4194 || _4196;
    bool _4200 = isnan(0.0);
    bool _4202 = _4198 || _4200;
    int _4204 = as_type<int>(_4192);
    int _4206 = _4181;
    int _4208 = _4183;
    int _4210 = _4202 ? (-1) : 0;
    if (!_4202)
    {
        float _4212 = as_type<float>(_4181) * 1.0;
        _4204 = as_type<int>(_4212);
    }
    int _4214 = _4204;
    bool _4216 = !_4202;
    int _4218 = _4214;
    if (!_4216)
    {
        float _4220 = as_type<float>(_4181) + 0.0;
        bool _4222 = _4220 >= 0.0;
        bool _4224 = isnan(_4220);
        bool _4226 = _4222 || _4224;
        bool _4228 = isnan(0.0);
        bool _4230 = _4226 || _4228;
        int _4232 = as_type<int>(_4220);
        _4210 = _4230 ? (-1) : 0;
        if (!_4230)
        {
            _4232 = 2147483647;
        }
        int _4234 = _4232;
        bool _4236 = !_4230;
        _4218 = _4234;
        if (!_4236)
        {
            float _4238 = as_type<float>(_4181) + 0.0;
            bool _4240 = _4238 > as_type<float>(0x7f800000u /* inf */);
            bool _4242 = isnan(_4238);
            bool _4244 = _4240 || _4242;
            bool _4246 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4248 = _4244 || _4246;
            int _4250 = as_type<int>(_4238);
            _4210 = _4248 ? (-1) : 0;
            if (_4248)
            {
                float _4252 = as_type<float>(_4181) + 1.0;
                _4250 = as_type<int>(_4252);
            }
            int _4254 = _4250;
            _4218 = _4254;
            if (!_4248)
            {
                float _4256 = 0.0 + as_type<float>(_4181);
                bool _4258 = _4256 != as_type<float>(0x7f800000u /* inf */);
                bool _4260 = isnan(_4256);
                bool _4262 = _4258 || _4260;
                bool _4264 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4266 = _4262 || _4264;
                int _4268 = as_type<int>(_4256);
                _4210 = _4266 ? (-1) : 0;
                if (!_4266)
                {
                    _4268 = _4181;
                }
                int _4270 = _4268;
                bool _4272 = !_4266;
                _4218 = _4270;
                if (!_4272)
                {
                    float _4274 = as_type<float>(_4181) * 18446744073709551616.0;
                    float _4276 = rsqrt(_4274);
                    float _4278 = _4274 * _4276;
                    float _4280 = _4276 * 0.5;
                    float _4282 = -_4278;
                    float _4284 = 0.0 + _4282;
                    float _4286 = fma(_4280, _4284, 0.5);
                    float _4288 = fma(_4278, _4286, _4278);
                    float _4290 = -_4288;
                    float _4292 = 0.0 + _4290;
                    float _4294 = fma(_4288, _4292, _4274);
                    float _4296 = fma(_4280, _4294, _4288);
                    float _4298 = _4296 * 2.3283064365386962890625e-10;
                    _4218 = as_type<int>(_4298);
                    _4206 = as_type<int>(_4284);
                    _4208 = as_type<int>(_4288);
                }
            }
        }
    }
    int _4300 = _4218;
    int _4302 = _4206;
    int _4304 = _4208;
    int _4306 = _4210;
    _4184 = _4300;
    _4185 = _4182;
    _4186 = 0;
    _4187 = _4302;
    _4188 = _4304;
    _4189 = _4306;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1232 = false;
    bool _800 = false;
    bool _490 = false;
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
    float _135 = _111;
    if (_125)
    {
        int _137 = _101 + 8;
        uint _139 = uint(int(uint(_137) >> uint(2)));
        uint _141 = uint(int(uint(int(_139)) >> uint(2)));
        int _143 = int(_139) & 3;
        float _145 = (*spvDescriptorSet0.cp_c5)._m0[int(_141)][_143];
        _131 = as_type<int>(_145);
    }
    int _147 = _131;
    float _149 = 0.0;
    if (_125)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    int _153 = 0;
    if (_129)
    {
        uint _155 = uint(int(uint(_101) >> uint(2)));
        uint _157 = uint(int(uint(int(_155)) >> uint(2)));
        int _159 = int(_155) & 3;
        float _161 = (*spvDescriptorSet0.cp_c5)._m0[int(_157)][_159];
        _153 = as_type<int>(_161);
    }
    int _163 = _153;
    float _165 = 0.0;
    if (_129)
    {
        _165 = 2.8025969286496341418474591665798e-45;
    }
    float _167 = _165;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _169 = _133;
    float _171 = as_type<float>(_147);
    float _173 = 0.0;
    float _175 = _151;
    float _177 = as_type<float>(_68);
    if (_125)
    {
        int _179 = _68;
        int _181 = 0;
        int _183 = _58(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _147;
        int _187 = 0;
        int _189 = _58(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1886 = int3(_183, _189, as_type<int>(_151));
        float4 _192 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1886.xy), uint(_1886.z), 0).xyzw;
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
    float _212 = as_type<float>(_68);
    float _214 = 0.0;
    if (_129)
    {
        int _216 = _68;
        int _218 = 1;
        int _220 = _58(_216, _218, (*spvDescriptorSet0.support_buffer));
        int _222 = _163;
        int _224 = 1;
        int _226 = _58(_222, _224, (*spvDescriptorSet0.support_buffer));
        int3 _1918 = int3(_220, _226, 0);
        float3 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1918.xy), uint(_1918.z), 0).xyz;
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
    float _246 = as_type<float>(_68);
    float _248 = 0.0;
    if (_129)
    {
        int _250 = _68;
        int _252 = 1;
        int _254 = _58(_250, _252, (*spvDescriptorSet0.support_buffer));
        int _256 = _163;
        int _258 = 1;
        int _260 = _58(_256, _258, (*spvDescriptorSet0.support_buffer));
        int3 _1949 = int3(_254, _260, as_type<int>(_167));
        float3 _262 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1949.xy), uint(_1949.z), 0).xyz;
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
    float _278 = _121;
    float _280 = 0.0;
    float _282 = 0.0;
    if (_129)
    {
        int _284 = _68;
        int _286 = 1;
        int _288 = _58(_284, _286, (*spvDescriptorSet0.support_buffer));
        int _290 = _163;
        int _292 = 1;
        int _294 = _58(_290, _292, (*spvDescriptorSet0.support_buffer));
        int3 _1978 = int3(_288, _294, as_type<int>(_169));
        float4 _296 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1978.xy), uint(_1978.z), 0).xyzw;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float _304 = _296.w;
        _276 = _298;
        _278 = _300;
        _280 = _302;
        _282 = _304;
    }
    float _306 = _276;
    float _308 = _278;
    float _310 = _280;
    float _312 = _282;
    float _314 = 0.0;
    float _316 = 0.0;
    if (!_129)
    {
        _314 = 0.0;
        _316 = 0.0;
    }
    float _318 = _314;
    float _320 = _316;
    float _322 = 0.0;
    float _324 = _318;
    float _326 = _320;
    if (!_129)
    {
        _322 = 0.0;
    }
    float _328 = _322;
    float _330 = 0.0;
    float _332 = 0.0;
    float _334 = _328;
    if (!_129)
    {
        _330 = 0.0;
        _332 = 0.0;
    }
    float _336 = _330;
    float _338 = _332;
    float _340 = 0.0;
    float _342 = _336;
    float _344 = _338;
    if (!_129)
    {
        _340 = 0.0;
    }
    float _346 = _340;
    float _348 = 0.0;
    float _350 = _346;
    if (!_129)
    {
        _135 = 0.0;
        _348 = 0.0;
    }
    float _352 = _135;
    float _354 = _348;
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
    float _374 = _310;
    if (!_370)
    {
        _342 = _308;
        _358 = _306;
        _372 = _310;
        _360 = _312;
        _324 = _238;
        _334 = _240;
        _326 = _242;
        _344 = _270;
        _350 = _272;
        _366 = _274;
    }
    float _376 = _342;
    float _378 = _358;
    float _380 = _372;
    float _382 = _360;
    float _384 = _324;
    float _386 = _334;
    float _388 = _326;
    float _390 = _344;
    float _392 = _350;
    float _394 = _366;
    bool _396 = !_125;
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
    float _796;
    float _798;
    if (!_396)
    {
        float _410 = _204 * _376;
        float _412 = fma(_202, _378, _410);
        float _414 = fma(_206, _380, _412);
        float _416 = fma(_208, _382, _414);
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
            _56(_466, _468, _470, _472, _474, _476, _478, _480, _482, _484);
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
        int _518 = _101 + 8;
        uint _520 = uint(int(uint(_518) >> uint(2)));
        uint _522 = uint(int(uint(int(_520)) >> uint(2)));
        int _524 = int(_520) & 3;
        float _526 = (*spvDescriptorSet0.cp_c5)._m0[int(_522)][_524];
        int _528 = _68;
        int _530 = 0;
        int _532 = _58(_528, _530, (*spvDescriptorSet0.support_buffer));
        int _534 = as_type<int>(_526);
        int _536 = 0;
        int _538 = _58(_534, _536, (*spvDescriptorSet0.support_buffer));
        int3 _2242 = int3(_532, _538, 0);
        float3 _540 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2242.xy), uint(_2242.z), 0).xyz;
        float _542 = _540.x;
        float _544 = _540.y;
        float _546 = _540.z;
        int _548 = _68;
        int _550 = 0;
        int _552 = _58(_548, _550, (*spvDescriptorSet0.support_buffer));
        int _554 = as_type<int>(_526);
        int _556 = 0;
        int _558 = _58(_554, _556, (*spvDescriptorSet0.support_buffer));
        int3 _2260 = int3(_552, _558, 2);
        float3 _560 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2260.xy), uint(_2260.z), 0).xyz;
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
            int _602 = _101 + 28;
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
            int _630 = _101 + 28;
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
        float _682 = _202 * _674;
        float _684 = _208 * _674;
        float _686 = _204 * _674;
        float _688 = _206 * _674;
        float _690 = fma(_378, _668, _682);
        int _692 = _101 + 20;
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
        _796 = _680;
        _374 = _676;
        _798 = _678;
        _800 = true;
    }
    else
    {
        float _802 = _382 * 2.0;
        float _804 = _378 * 2.0;
        float _806 = _376 * _376;
        float _808 = _802 * _380;
        float _810 = _378 * _378;
        float _812 = _802 * _378;
        float _814 = _802 * _376;
        float _816 = -_808;
        float _818 = fma(_804, _376, _816);
        float _820 = fma(_804, _376, _808);
        float _822 = _380 * _380;
        float _824 = fma(_806, -2.0, 1.0);
        float _826 = _376 * 2.0;
        float _828 = fma(_810, -2.0, 1.0);
        float _830 = fma(_804, _380, _814);
        float _832 = fma(_822, -2.0, _824);
        float _834 = -_814;
        float _836 = fma(_804, _380, _834);
        float _838 = -_812;
        float _840 = fma(_826, _380, _838);
        float _842 = fma(_822, -2.0, _828);
        float _844 = fma(_806, -2.0, _828);
        float _846 = fma(_826, _380, _812);
        _772 = _832;
        _774 = _820;
        _776 = _836;
        _778 = _386;
        _780 = _818;
        _782 = _842;
        _784 = _846;
        _786 = _388;
        _788 = _830;
        _790 = _840;
        _792 = _844;
        _794 = _826;
        _796 = _812;
        _798 = _814;
    }
    _800 = false;
    float _848 = _398;
    float _850 = _772;
    float _852 = _774;
    float _854 = _776;
    float _856 = _778;
    float _858 = _780;
    float _860 = _782;
    float _862 = _784;
    float _864 = _786;
    float _866 = _788;
    float _868 = _790;
    float _870 = _792;
    int _872 = _400;
    int _874 = _402;
    int _876 = _404;
    float _878 = _794;
    float _880 = _796;
    float _882 = _374;
    float _884 = _798;
    float _886 = _848 * _850;
    float _888 = _848 * _852;
    float _890 = _848 * _854;
    float _892 = _856 * _858;
    float _894 = _856 * _860;
    float _896 = _856 * _862;
    int _898 = _68 * 48;
    float _900 = _864 * _866;
    float _902 = _864 * _868;
    float _904 = _864 * _870;
    bool _906 = _68 != 0;
    uint _908 = uint(int(uint(_898) >> uint(2)));
    _37[int(_908)] = as_type<uint>(_886);
    int _910 = _898 + 4;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    _37[int(_912)] = as_type<uint>(_892);
    int _914 = _898 + 8;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    _37[int(_916)] = as_type<uint>(_900);
    int _918 = _898 + 12;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    _37[int(_920)] = uint(_872);
    int _922 = _68 * 112;
    int _924 = _898 + 16;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    _37[int(_926)] = as_type<uint>(_888);
    int _928 = _898 + 20;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    _37[int(_930)] = as_type<uint>(_894);
    int _932 = _898 + 24;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    _37[int(_934)] = as_type<uint>(_902);
    int _936 = _898 + 28;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    _37[int(_938)] = uint(_874);
    int _940 = _898 + 32;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    _37[int(_942)] = as_type<uint>(_890);
    int _944 = _898 + 36;
    uint _946 = uint(int(uint(_944) >> uint(2)));
    _37[int(_946)] = as_type<uint>(_896);
    int _948 = _898 + 40;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    _37[int(_950)] = as_type<uint>(_904);
    int _952 = _898 + 44;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    _37[int(_954)] = uint(_876);
    float _956 = _884;
    float _958 = _882;
    float _960 = _880;
    float _962 = _848;
    float _964 = _864;
    float _966 = _878;
    float _968 = _856;
    float _970 = _896;
    float _972 = _904;
    float _974 = as_type<float>(_876);
    if (!_906)
    {
        _956 = _886;
    }
    float _976 = _956;
    float _978 = _976;
    if (!_906)
    {
        _958 = _892;
    }
    float _980 = _958;
    float _982 = _980;
    if (!_906)
    {
        _960 = _900;
    }
    float _984 = _960;
    float _986 = _984;
    if (!_906)
    {
        _406 = as_type<float>(_872);
    }
    float _988 = _406;
    float _990 = _988;
    if (!_906)
    {
        _962 = _888;
    }
    float _992 = _962;
    float _994 = _992;
    if (!_906)
    {
        _408 = _894;
    }
    float _996 = _408;
    float _998 = _996;
    if (!_906)
    {
        _964 = _902;
    }
    float _1000 = _964;
    float _1002 = _1000;
    if (!_906)
    {
        _966 = as_type<float>(_874);
    }
    float _1004 = _966;
    float _1006 = _1004;
    if (!_906)
    {
        _968 = _890;
    }
    float _1008 = _968;
    bool _1010 = !_906;
    float _1012 = _1008;
    if (!_1010)
    {
        bool _1014 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1016 = !_1014;
        if (!_1016)
        {
            uint _1018 = uint(int(uint(_922) >> uint(2)));
            uint _1020 = uint(int(uint(int(_1018)) >> uint(2)));
            int _1022 = int(_1018) & 3;
            float _1024 = (*spvDescriptorSet0.cp_c6)._m0[int(_1020)][_1022];
            int _1026 = as_type<int>(_1024) * 48;
            int _1028 = 0;
            bool _1030;
            float _1126;
            float _1130;
            float _1134;
            float _1138;
            float _1152;
            float _1154;
            float _1166;
            float _1176;
            float _1178;
            float _1180;
            float _1182;
            float _1184;
            do
            {
                int _1032 = _1028;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1034 = uint(int(uint(_1026) >> uint(2)));
                float _1036 = as_type<float>(_37[int(_1034)]);
                int _1038 = _1026 + 4;
                uint _1040 = uint(int(uint(_1038) >> uint(2)));
                float _1042 = as_type<float>(_37[int(_1040)]);
                int _1044 = _1026 + 8;
                uint _1046 = uint(int(uint(_1044) >> uint(2)));
                float _1048 = as_type<float>(_37[int(_1046)]);
                int _1050 = _1026 + 12;
                uint _1052 = uint(int(uint(_1050) >> uint(2)));
                float _1054 = as_type<float>(_37[int(_1052)]);
                int _1056 = _1032 + 1;
                int _1058 = _1026 + 16;
                uint _1060 = uint(int(uint(_1058) >> uint(2)));
                float _1062 = as_type<float>(_37[int(_1060)]);
                int _1064 = _1026 + 20;
                uint _1066 = uint(int(uint(_1064) >> uint(2)));
                float _1068 = as_type<float>(_37[int(_1066)]);
                int _1070 = _1026 + 24;
                uint _1072 = uint(int(uint(_1070) >> uint(2)));
                float _1074 = as_type<float>(_37[int(_1072)]);
                int _1076 = _1026 + 28;
                uint _1078 = uint(int(uint(_1076) >> uint(2)));
                float _1080 = as_type<float>(_37[int(_1078)]);
                bool _1082 = uint(_1056) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1084 = _1026 + 32;
                uint _1086 = uint(int(uint(_1084) >> uint(2)));
                float _1088 = as_type<float>(_37[int(_1086)]);
                int _1090 = _1026 + 36;
                uint _1092 = uint(int(uint(_1090) >> uint(2)));
                float _1094 = as_type<float>(_37[int(_1092)]);
                int _1096 = _1026 + 40;
                uint _1098 = uint(int(uint(_1096) >> uint(2)));
                float _1100 = as_type<float>(_37[int(_1098)]);
                int _1102 = _1026 + 44;
                uint _1104 = uint(int(uint(_1102) >> uint(2)));
                float _1106 = as_type<float>(_37[int(_1104)]);
                float _1108 = _1042 * as_type<float>(_874);
                float _1110 = _888 * _1042;
                float _1112 = _894 * _1042;
                float _1114 = _902 * _1042;
                float _1116 = fma(_1036, as_type<float>(_872), _1108);
                float _1118 = fma(_886, _1036, _1110);
                float _1120 = fma(_892, _1036, _1112);
                float _1122 = fma(_900, _1036, _1114);
                float _1124 = fma(_1048, as_type<float>(_876), _1116);
                _1126 = fma(_890, _1048, _1118);
                float _1128 = _888 * _1068;
                _1130 = fma(_904, _1048, _1122);
                float _1132 = _1068 * as_type<float>(_874);
                _1134 = _1054 + _1124;
                float _1136 = _894 * _1068;
                _1138 = fma(_896, _1048, _1120);
                float _1140 = fma(_1062, as_type<float>(_872), _1132);
                float _1142 = fma(_886, _1062, _1128);
                float _1144 = fma(_892, _1062, _1136);
                float _1146 = _902 * _1068;
                float _1148 = fma(_1074, as_type<float>(_876), _1140);
                float _1150 = _1094 * as_type<float>(_874);
                _1152 = fma(_890, _1074, _1142);
                _1154 = fma(_896, _1074, _1144);
                float _1156 = _888 * _1094;
                float _1158 = _894 * _1094;
                float _1160 = _902 * _1094;
                float _1162 = fma(_1088, as_type<float>(_872), _1150);
                float _1164 = fma(_900, _1062, _1146);
                _1166 = _1080 + _1148;
                float _1168 = fma(_886, _1088, _1156);
                float _1170 = fma(_892, _1088, _1158);
                float _1172 = fma(_900, _1088, _1160);
                float _1174 = fma(_1100, as_type<float>(_876), _1162);
                _1176 = fma(_904, _1074, _1164);
                _1178 = fma(_890, _1100, _1168);
                _1180 = fma(_896, _1100, _1170);
                _1182 = fma(_904, _1100, _1172);
                _1184 = _1106 + _1174;
                uint _1186 = uint(int(uint(_898) >> uint(2)));
                _37[int(_1186)] = as_type<uint>(_1126);
                int _1188 = _898 + 4;
                uint _1190 = uint(int(uint(_1188) >> uint(2)));
                _37[int(_1190)] = as_type<uint>(_1138);
                int _1192 = _898 + 8;
                uint _1194 = uint(int(uint(_1192) >> uint(2)));
                _37[int(_1194)] = as_type<uint>(_1130);
                int _1196 = _898 + 12;
                uint _1198 = uint(int(uint(_1196) >> uint(2)));
                _37[int(_1198)] = as_type<uint>(_1134);
                int _1200 = _898 + 16;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                _37[int(_1202)] = as_type<uint>(_1152);
                int _1204 = _898 + 20;
                uint _1206 = uint(int(uint(_1204) >> uint(2)));
                _37[int(_1206)] = as_type<uint>(_1154);
                int _1208 = _898 + 24;
                uint _1210 = uint(int(uint(_1208) >> uint(2)));
                _37[int(_1210)] = as_type<uint>(_1176);
                int _1212 = _898 + 28;
                uint _1214 = uint(int(uint(_1212) >> uint(2)));
                _37[int(_1214)] = as_type<uint>(_1166);
                int _1216 = _898 + 32;
                uint _1218 = uint(int(uint(_1216) >> uint(2)));
                _37[int(_1218)] = as_type<uint>(_1178);
                int _1220 = _898 + 36;
                uint _1222 = uint(int(uint(_1220) >> uint(2)));
                _37[int(_1222)] = as_type<uint>(_1180);
                int _1224 = _898 + 40;
                uint _1226 = uint(int(uint(_1224) >> uint(2)));
                _37[int(_1226)] = as_type<uint>(_1182);
                int _1228 = _898 + 44;
                uint _1230 = uint(int(uint(_1228) >> uint(2)));
                _37[int(_1230)] = as_type<uint>(_1184);
                _1030 = !_1082;
                _1028 = _1056;
            } while (_1030);
            _970 = _1180;
            _982 = _1138;
            _998 = _1154;
            _1012 = _1178;
            _978 = _1126;
            _994 = _1152;
            _1002 = _1176;
            _972 = _1182;
            _986 = _1130;
            _1006 = _1166;
            _990 = _1134;
            _974 = _1184;
            _1232 = true;
        }
        else
        {
            _970 = 0.0;
            _982 = 0.0;
            _998 = 0.0;
            _1012 = 0.0;
            _978 = 0.0;
            _994 = 0.0;
            _1002 = 0.0;
            _972 = 0.0;
            _986 = 0.0;
            _1006 = 0.0;
            _990 = 0.0;
            _974 = 0.0;
        }
    }
    _1232 = false;
    float _1234 = _970;
    float _1236 = _982;
    float _1238 = _998;
    float _1240 = _1012;
    float _1242 = _978;
    float _1244 = _994;
    float _1246 = _1002;
    float _1248 = _972;
    float _1250 = _986;
    float _1252 = _1006;
    float _1254 = _990;
    float _1256 = _974;
    int _1258 = _922 + 80;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
    int _1264 = int(_1260) & 3;
    float _1266 = (*spvDescriptorSet0.cp_c6)._m0[int(_1262)][_1264];
    int _1268 = int(_1260) + 1;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    int _1272 = _1268 & 3;
    float _1274 = (*spvDescriptorSet0.cp_c6)._m0[int(_1270)][_1272];
    int _1276 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1278 = _1276 + _68;
    int _1280 = _922 + 64;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.cp_c6)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = _1278 * 48;
    int _1300 = _922 + 88;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
    int _1306 = int(_1302) & 3;
    float _1308 = (*spvDescriptorSet0.cp_c6)._m0[int(_1304)][_1306];
    int _1310 = int(_1302) + 1;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    int _1314 = _1310 & 3;
    float _1316 = (*spvDescriptorSet0.cp_c6)._m0[int(_1312)][_1314];
    int _1318 = _922 + 72;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    uint _1322 = uint(int(uint(int(_1320)) >> uint(2)));
    int _1324 = int(_1320) & 3;
    float _1326 = (*spvDescriptorSet0.cp_c6)._m0[int(_1322)][_1324];
    int _1328 = int(_1320) + 1;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    int _1332 = _1328 & 3;
    float _1334 = (*spvDescriptorSet0.cp_c6)._m0[int(_1330)][_1332];
    int _1336 = _922 + 96;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.cp_c6)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.cp_c6)._m0[int(_1348)][_1350];
    int _1354 = _922 + 104;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    uint _1358 = uint(int(uint(int(_1356)) >> uint(2)));
    int _1360 = int(_1356) & 3;
    float _1362 = (*spvDescriptorSet0.cp_c6)._m0[int(_1358)][_1360];
    int _1364 = int(_1356) + 1;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    int _1368 = _1364 & 3;
    float _1370 = (*spvDescriptorSet0.cp_c6)._m0[int(_1366)][_1368];
    float _1372 = _1234 * _1266;
    int _1374 = _922 + 16;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    uint _1378 = uint(int(uint(int(_1376)) >> uint(2)));
    int _1380 = int(_1376) & 3;
    float _1382 = (*spvDescriptorSet0.cp_c6)._m0[int(_1378)][_1380];
    int _1384 = int(_1376) + 1;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    int _1388 = _1384 & 3;
    float _1390 = (*spvDescriptorSet0.cp_c6)._m0[int(_1386)][_1388];
    float _1392 = _1236 * _1266;
    float _1394 = _1238 * _1266;
    float _1396 = _1238 * _1274;
    float _1398 = fma(_1240, _1288, _1372);
    float _1400 = _1234 * _1274;
    int _1402 = _922 + 32;
    uint _1404 = uint(int(uint(_1402) >> uint(2)));
    uint _1406 = uint(int(uint(int(_1404)) >> uint(2)));
    int _1408 = int(_1404) & 3;
    float _1410 = (*spvDescriptorSet0.cp_c6)._m0[int(_1406)][_1408];
    int _1412 = int(_1404) + 1;
    uint _1414 = uint(int(uint(_1412) >> uint(2)));
    int _1416 = _1412 & 3;
    float _1418 = (*spvDescriptorSet0.cp_c6)._m0[int(_1414)][_1416];
    float _1420 = fma(_1242, _1288, _1392);
    float _1422 = fma(_1244, _1288, _1394);
    float _1424 = fma(_1244, _1296, _1396);
    float _1426 = _1236 * _1274;
    float _1428 = fma(_1240, _1296, _1400);
    float _1430 = _1236 * _1308;
    float _1432 = _1238 * _1308;
    int _1434 = _922 + 48;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.cp_c6)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.cp_c6)._m0[int(_1446)][_1448];
    float _1452 = _1236 * _1316;
    float _1454 = _1238 * _1316;
    float _1456 = _1234 * _1308;
    float _1458 = _1234 * _1316;
    float _1460 = fma(_1242, _1296, _1426);
    float _1462 = fma(_1244, _1326, _1432);
    float _1464 = fma(_1244, _1334, _1454);
    int _1466 = _922 + 24;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.cp_c6)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.cp_c6)._m0[int(_1478)][_1480];
    float _1484 = fma(_1242, _1326, _1430);
    float _1486 = fma(_1242, _1334, _1452);
    float _1488 = fma(_1240, _1326, _1456);
    float _1490 = fma(_1240, _1334, _1458);
    float _1492 = fma(_1246, _1344, _1422);
    float _1494 = fma(_1246, _1352, _1424);
    int _1496 = _922 + 40;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.cp_c6)._m0[int(_1508)][_1510];
    float _1514 = fma(_1248, _1344, _1398);
    float _1516 = fma(_1250, _1344, _1420);
    float _1518 = fma(_1250, _1352, _1460);
    float _1520 = fma(_1248, _1352, _1428);
    float _1522 = fma(_1246, _1362, _1462);
    float _1524 = fma(_1246, _1370, _1464);
    int _1526 = _922 + 56;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    uint _1530 = uint(int(uint(int(_1528)) >> uint(2)));
    int _1532 = int(_1528) & 3;
    float _1534 = (*spvDescriptorSet0.cp_c6)._m0[int(_1530)][_1532];
    int _1536 = int(_1528) + 1;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    int _1540 = _1536 & 3;
    float _1542 = (*spvDescriptorSet0.cp_c6)._m0[int(_1538)][_1540];
    float _1544 = fma(_1250, _1362, _1484);
    float _1546 = fma(_1250, _1370, _1486);
    float _1548 = _1524 + _1252;
    float _1550 = fma(_1248, _1370, _1490);
    float _1552 = fma(_1248, _1362, _1488);
    float _1554 = _1546 + _1254;
    float _1556 = _1548 * _1390;
    float _1558 = _1550 + _1256;
    float _1560 = _1492 * _1390;
    float _1562 = _1494 * _1390;
    float _1564 = fma(_1554, _1382, _1556);
    float _1566 = _1522 * _1390;
    float _1568 = fma(_1516, _1382, _1560);
    float _1570 = fma(_1518, _1382, _1562);
    float _1572 = _1492 * _1418;
    float _1574 = _1548 * _1418;
    float _1576 = _1494 * _1418;
    float _1578 = _1522 * _1418;
    float _1580 = fma(_1516, _1410, _1572);
    float _1582 = fma(_1554, _1410, _1574);
    float _1584 = fma(_1544, _1382, _1566);
    float _1586 = fma(_1544, _1410, _1578);
    float _1588 = _1492 * _1450;
    float _1590 = _1548 * _1450;
    float _1592 = _1494 * _1450;
    float _1594 = _1522 * _1450;
    float _1596 = fma(_1516, _1442, _1588);
    float _1598 = fma(_1554, _1442, _1590);
    float _1600 = fma(_1518, _1442, _1592);
    float _1602 = fma(_1544, _1442, _1594);
    float _1604 = fma(_1558, _1474, _1564);
    float _1606 = fma(_1518, _1410, _1576);
    float _1608 = fma(_1520, _1474, _1570);
    float _1610 = fma(_1514, _1474, _1568);
    float _1612 = _1604 + _1482;
    float _1614 = fma(_1552, _1474, _1584);
    float _1616 = fma(_1558, _1504, _1582);
    float _1618 = fma(_1514, _1504, _1580);
    float _1620 = fma(_1552, _1504, _1586);
    float _1622 = fma(_1520, _1504, _1606);
    float _1624 = _1616 + _1512;
    float _1626 = fma(_1558, _1534, _1598);
    float _1628 = fma(_1514, _1534, _1596);
    float _1630 = fma(_1520, _1534, _1600);
    float _1632 = fma(_1552, _1534, _1602);
    int _1634 = _1298 + 16;
    float _1636 = _1626 + _1542;
    int _1638 = _1298 + 32;
    int _1640 = _1298 + 48;
    uint _1642 = uint(int(uint(_1634) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1642)] = as_type<uint>(_1610);
    int _1644 = _1634 + 4;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1646)] = as_type<uint>(_1608);
    int _1648 = _1634 + 8;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1650)] = as_type<uint>(_1614);
    int _1652 = _1634 + 12;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1654)] = as_type<uint>(_1612);
    uint _1656 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1656)] = as_type<uint>(_1618);
    int _1658 = _1638 + 4;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1660)] = as_type<uint>(_1622);
    int _1662 = _1638 + 8;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1664)] = as_type<uint>(_1620);
    int _1666 = _1638 + 12;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1668)] = as_type<uint>(_1624);
    uint _1670 = uint(int(uint(_1640) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1670)] = as_type<uint>(_1628);
    int _1672 = _1640 + 4;
    uint _1674 = uint(int(uint(_1672) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1674)] = as_type<uint>(_1630);
    int _1676 = _1640 + 8;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1678)] = as_type<uint>(_1632);
    int _1680 = _1640 + 12;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1682)] = as_type<uint>(_1636);
}

