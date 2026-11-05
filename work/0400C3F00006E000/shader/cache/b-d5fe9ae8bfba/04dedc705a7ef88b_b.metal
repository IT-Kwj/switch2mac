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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4146, thread const int& _4147, constant _10& support_buffer)
{
    int _4150 = 1 + _4147;
    float _4152 = support_buffer._m5[_4150].x;
    bool _4154 = _4152 == 1.0;
    if (_4154)
    {
        return _4146;
    }
    float _4156 = float(_4146);
    float _4158 = _4156 * _4152;
    int _4160 = int(_4158);
    return _4160;
}

static inline __attribute__((always_inline))
void _56(thread const int& _3833, thread const int& _3834, thread const int& _3835, thread const int& _3836, thread const int& _3837, thread int& _3838, thread int& _3839, thread int& _3840, thread int& _3841, thread int& _3842, thread int& _3843)
{
    float _3846 = as_type<float>(_3837) + 0.0;
    bool _3848 = _3846 != 0.0;
    bool _3850 = isnan(_3846);
    bool _3852 = _3848 || _3850;
    bool _3854 = isnan(0.0);
    bool _3856 = _3852 || _3854;
    int _3858 = as_type<int>(_3846);
    int _3860 = _3834;
    int _3862 = _3835;
    int _3864 = _3856 ? (-1) : 0;
    if (!_3856)
    {
        float _3866 = as_type<float>(_3837) * 1.0;
        _3858 = as_type<int>(_3866);
    }
    int _3868 = _3858;
    bool _3870 = !_3856;
    int _3872 = _3868;
    if (!_3870)
    {
        float _3874 = as_type<float>(_3837) + 0.0;
        bool _3876 = _3874 >= 0.0;
        bool _3878 = isnan(_3874);
        bool _3880 = _3876 || _3878;
        bool _3882 = isnan(0.0);
        bool _3884 = _3880 || _3882;
        int _3886 = as_type<int>(_3874);
        _3864 = _3884 ? (-1) : 0;
        if (!_3884)
        {
            _3886 = 2147483647;
        }
        int _3888 = _3886;
        bool _3890 = !_3884;
        _3872 = _3888;
        if (!_3890)
        {
            float _3892 = as_type<float>(_3837) + 0.0;
            bool _3894 = _3892 > as_type<float>(0x7f800000u /* inf */);
            bool _3896 = isnan(_3892);
            bool _3898 = _3894 || _3896;
            bool _3900 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3902 = _3898 || _3900;
            int _3904 = as_type<int>(_3892);
            _3864 = _3902 ? (-1) : 0;
            if (_3902)
            {
                float _3906 = as_type<float>(_3837) + 1.0;
                _3904 = as_type<int>(_3906);
            }
            int _3908 = _3904;
            _3872 = _3908;
            if (!_3902)
            {
                float _3910 = 0.0 + as_type<float>(_3837);
                bool _3912 = _3910 != as_type<float>(0x7f800000u /* inf */);
                bool _3914 = isnan(_3910);
                bool _3916 = _3912 || _3914;
                bool _3918 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3920 = _3916 || _3918;
                int _3922 = as_type<int>(_3910);
                _3864 = _3920 ? (-1) : 0;
                if (!_3920)
                {
                    _3922 = _3837;
                }
                int _3924 = _3922;
                bool _3926 = !_3920;
                _3872 = _3924;
                if (!_3926)
                {
                    float _3928 = as_type<float>(_3837) * 18446744073709551616.0;
                    float _3930 = rsqrt(_3928);
                    float _3932 = _3928 * _3930;
                    float _3934 = _3930 * 0.5;
                    float _3936 = -_3932;
                    float _3938 = 0.0 + _3936;
                    float _3940 = fma(_3934, _3938, 0.5);
                    float _3942 = fma(_3932, _3940, _3932);
                    float _3944 = -_3942;
                    float _3946 = 0.0 + _3944;
                    float _3948 = fma(_3942, _3946, _3928);
                    float _3950 = fma(_3934, _3948, _3942);
                    float _3952 = _3950 * 2.3283064365386962890625e-10;
                    _3872 = as_type<int>(_3952);
                    _3860 = as_type<int>(_3942);
                    _3862 = as_type<int>(_3938);
                }
            }
        }
    }
    int _3954 = _3872;
    int _3956 = _3860;
    int _3958 = _3862;
    int _3960 = _3864;
    _3838 = _3954;
    _3839 = _3836;
    _3840 = 0;
    _3841 = _3956;
    _3842 = _3958;
    _3843 = _3960;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _290 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_72)
    {
        return;
    }
    bool _74 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _76 = _68 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _78 = _76 << 4;
    bool _80 = !_74;
    if (!_80)
    {
        int _82 = 0;
        float _84 = 0.0;
        bool _86;
        int _274;
        int _276;
        int _278;
        int _280;
        int _282;
        int _284;
        float _286;
        float _288;
        do
        {
            int _88 = _82;
            float _90 = _84;
            uint _93 = uint(int(uint(_78) >> uint(2)));
            uint _95 = uint(int(uint(int(_93)) >> uint(2)));
            int _97 = int(_93) & 3;
            float _99 = (*spvDescriptorSet0.cp_c4)._m0[int(_95)][_97];
            int _101 = as_type<int>(_99) * 48;
            uint _103 = uint(int(uint(_101) >> uint(2)));
            uint _105 = uint(int(uint(int(_103)) >> uint(2)));
            int _107 = int(_103) & 3;
            float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
            int _111 = _101 + 8;
            uint _113 = uint(int(uint(_111) >> uint(2)));
            uint _115 = uint(int(uint(int(_113)) >> uint(2)));
            int _117 = int(_113) & 3;
            float _119 = (*spvDescriptorSet0.cp_c5)._m0[int(_115)][_117];
            int _121 = _88;
            int _123 = 0;
            int _125 = _58(_121, _123, (*spvDescriptorSet0.support_buffer));
            int _127 = as_type<int>(_109);
            int _129 = 0;
            int _131 = _58(_127, _129, (*spvDescriptorSet0.support_buffer));
            int3 _1584 = int3(_125, _131, 1);
            float4 _134 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1584.xy), uint(_1584.z), 0).xyzw;
            float _136 = _134.x;
            float _138 = _134.y;
            float _140 = _134.z;
            float _142 = _134.w;
            int _144 = _88;
            int _146 = 1;
            int _148 = _58(_144, _146, (*spvDescriptorSet0.support_buffer));
            int _150 = as_type<int>(_119);
            int _152 = 1;
            int _154 = _58(_150, _152, (*spvDescriptorSet0.support_buffer));
            int3 _1604 = int3(_148, _154, 1);
            float4 _156 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1604.xy), uint(_1604.z), 0).xyzw;
            float _158 = _156.x;
            float _160 = _156.y;
            float _162 = _156.z;
            float _164 = _156.w;
            int _166 = _88;
            int _168 = 0;
            int _170 = _58(_166, _168, (*spvDescriptorSet0.support_buffer));
            int _172 = as_type<int>(_109);
            int _174 = 0;
            int _176 = _58(_172, _174, (*spvDescriptorSet0.support_buffer));
            int3 _1624 = int3(_170, _176, 0);
            float3 _180 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1624.xy), uint(_1624.z), 0).xyz;
            float _182 = _180.x;
            float _184 = _180.y;
            float _186 = _180.z;
            int _188 = _88;
            int _190 = 0;
            int _192 = _58(_188, _190, (*spvDescriptorSet0.support_buffer));
            int _194 = as_type<int>(_109);
            int _196 = 0;
            int _198 = _58(_194, _196, (*spvDescriptorSet0.support_buffer));
            int3 _1642 = int3(_192, _198, 2);
            float3 _200 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1642.xy), uint(_1642.z), 0).xyz;
            float _202 = _200.x;
            float _204 = _200.y;
            float _206 = _200.z;
            float _208 = _138 * _160;
            float _210 = fma(_136, _158, _208);
            float _212 = fma(_140, _162, _210);
            float _214 = fma(_142, _164, _212);
            float _216 = precise::max(_214, -1.0);
            float _218 = precise::min(_216, 1.0);
            bool _220 = _218 >= 0.0;
            bool _222 = isnan(_218);
            bool _224 = _220 || _222;
            bool _226 = isnan(0.0);
            bool _228 = _224 || _226;
            bool _230 = !_228;
            float _232 = -_218;
            float _234 = _230 ? _232 : _218;
            bool _236 = _234 < 0.0;
            float _238 = float(_236);
            float _240 = abs(_234);
            float _242 = -_240;
            float _244 = _242 + 1.0;
            float _246 = abs(_234);
            float _248 = fma(_246, -0.0187292993068695068359375, 0.074261002242565155029296875);
            int _250 = as_type<int>(_244) + (-218103808);
            float _252 = abs(_234);
            float _254 = fma(_252, _248, -0.212114393711090087890625);
            bool _256 = uint(_250) >= 1920991232u;
            float _258 = abs(_234);
            float _260 = fma(_258, _254, 1.570728778839111328125);
            bool _262 = !_256;
            if (!_262)
            {
                int _264 = as_type<int>(_234);
                int _266 = as_type<int>(_109);
                int _268 = 2;
                int _270 = 720;
                int _272 = as_type<int>(_244);
                _56(_264, _266, _268, _270, _272, _274, _276, _278, _280, _282, _284);
                _286 = as_type<float>(_274);
                _288 = as_type<float>(_276);
                _290 = true;
            }
            else
            {
                float _292 = rsqrt(_244);
                float _294 = _244 * _292;
                float _296 = _292 * 0.5;
                float _298 = -_294;
                float _300 = 0.0 + _298;
                float _302 = fma(_296, _300, 0.5);
                float _304 = fma(_294, _302, _294);
                float _306 = -_304;
                float _308 = 0.0 + _306;
                float _310 = fma(_304, _308, _244);
                float _312 = fma(_296, _310, _304);
                _286 = _312;
                _288 = _310;
            }
            _290 = false;
            float _314 = _286;
            float _316 = _288;
            float _318 = _260 * _314;
            float _320 = _238 * 2.0;
            float _322 = -_320;
            float _324 = fma(_318, _322, _318);
            float _326 = fma(_238, 3.1415927410125732421875, _324);
            float _328 = _326 * 0.15915493667125701904296875;
            float _330 = _328 * 6.283185482025146484375;
            float _332 = sin(_330);
            float _334 = abs(_332);
            bool _336 = _334 >= 0.001000000047497451305389404296875;
            bool _338 = isnan(_334);
            bool _340 = _336 || _338;
            bool _342 = isnan(0.001000000047497451305389404296875);
            bool _344 = _340 || _342;
            float _346 = _90;
            float _348 = _316;
            float _350 = _318;
            if (!_344)
            {
                int _352 = _101 + 28;
                uint _354 = uint(int(uint(_352) >> uint(2)));
                uint _356 = uint(int(uint(int(_354)) >> uint(2)));
                int _358 = int(_354) & 3;
                float _360 = (*spvDescriptorSet0.cp_c5)._m0[int(_356)][_358];
                _346 = _360;
            }
            float _362 = _346;
            float _364 = _362;
            float _366 = _362;
            if (!_344)
            {
                float _368 = -_362;
                float _370 = _368 + 1.0;
                _348 = _370;
            }
            float _372 = _348;
            float _374 = _372;
            if (!_344)
            {
                _350 = _362;
            }
            float _376 = _350;
            bool _378 = !_344;
            float _380 = _376;
            if (!_378)
            {
                int _382 = _101 + 28;
                uint _384 = uint(int(uint(_382) >> uint(2)));
                uint _386 = uint(int(uint(int(_384)) >> uint(2)));
                int _388 = int(_384) & 3;
                float _390 = (*spvDescriptorSet0.cp_c5)._m0[int(_386)][_388];
                float _392 = 1.0 / _332;
                float _394 = _326 * _390;
                float _396 = _394 * 0.15915493667125701904296875;
                float _398 = -_394;
                float _400 = _326 + _398;
                float _402 = _400 * 0.15915493667125701904296875;
                float _404 = _396 * 6.283185482025146484375;
                float _406 = sin(_404);
                float _408 = _402 * 6.283185482025146484375;
                float _410 = sin(_408);
                float _412 = _406 * _392;
                float _414 = _410 * _392;
                _364 = _390;
                _380 = _412;
                _374 = _414;
                _366 = _390;
            }
            float _416 = _364;
            float _418 = _380;
            float _420 = _374;
            float _422 = _366;
            int _424 = _101 + 8;
            uint _426 = uint(int(uint(_424) >> uint(2)));
            uint _428 = uint(int(uint(int(_426)) >> uint(2)));
            int _430 = int(_426) & 3;
            float _432 = (*spvDescriptorSet0.cp_c5)._m0[int(_428)][_430];
            int _434 = _88;
            int _436 = 1;
            int _438 = _58(_434, _436, (*spvDescriptorSet0.support_buffer));
            int _440 = as_type<int>(_432);
            int _442 = 1;
            int _444 = _58(_440, _442, (*spvDescriptorSet0.support_buffer));
            int3 _1953 = int3(_438, _444, 0);
            float3 _446 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1953.xy), uint(_1953.z), 0).xyz;
            float _448 = _446.x;
            float _450 = _446.y;
            float _452 = _446.z;
            int _454 = _88;
            int _456 = 1;
            int _458 = _58(_454, _456, (*spvDescriptorSet0.support_buffer));
            int _460 = as_type<int>(_432);
            int _462 = 1;
            int _464 = _58(_460, _462, (*spvDescriptorSet0.support_buffer));
            int3 _1971 = int3(_458, _464, 2);
            float3 _466 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1971.xy), uint(_1971.z), 0).xyz;
            float _468 = _466.x;
            float _470 = _466.y;
            float _472 = _466.z;
            int _474 = _101 + 20;
            uint _476 = uint(int(uint(_474) >> uint(2)));
            uint _478 = uint(int(uint(int(_476)) >> uint(2)));
            int _480 = int(_476) & 3;
            float _482 = (*spvDescriptorSet0.cp_c5)._m0[int(_478)][_480];
            bool _484 = !_228;
            float _486 = -_418;
            float _488 = _484 ? _486 : _418;
            float _490 = _164 * _488;
            float _492 = _158 * _488;
            float _494 = _162 * _488;
            float _496 = _160 * _488;
            float _498 = fma(_142, _420, _490);
            float _500 = fma(_136, _420, _492);
            float _502 = fma(_140, _420, _494);
            float _504 = fma(_138, _420, _496);
            float _506 = _498 * 2.0;
            float _508 = _500 * 2.0;
            float _510 = _504 * 2.0;
            float _512 = _502 * _506;
            float _514 = _504 * _506;
            float _516 = _500 * _506;
            float _518 = _500 * _500;
            float _520 = -_512;
            float _522 = fma(_504, _508, _520);
            float _524 = fma(_504, _508, _512);
            float _526 = _504 * _504;
            float _528 = fma(_502, _508, _514);
            float _530 = -_514;
            float _532 = fma(_502, _508, _530);
            float _534 = -_516;
            float _536 = fma(_502, _510, _534);
            float _538 = fma(_502, _510, _516);
            float _540 = _502 * _502;
            float _542 = fma(_526, -2.0, 1.0);
            float _544 = fma(_518, -2.0, 1.0);
            float _546 = fma(_540, -2.0, _542);
            float _548 = fma(_540, -2.0, _544);
            float _550 = fma(_526, -2.0, _544);
            float _552 = _450 * _422;
            float _554 = _452 * _422;
            float _556 = _448 * _422;
            float _558 = _472 * _422;
            float _560 = fma(_184, _482, _552);
            float _562 = fma(_186, _482, _554);
            float _564 = fma(_182, _482, _556);
            float _566 = _522 * _560;
            float _568 = _548 * _560;
            float _570 = _538 * _560;
            float _572 = _550 * _562;
            float _574 = _546 * _564;
            float _576 = _468 * _422;
            float _578 = _470 * _422;
            int _580 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _582 = _580 + _88;
            float _584 = _524 * _564;
            float _586 = fma(_202, _482, _576);
            float _588 = fma(_204, _482, _578);
            float _590 = _532 * _564;
            float _592 = _528 * _562;
            float _594 = _536 * _562;
            int _596 = _582 * 48;
            float _598 = fma(_206, _482, _558);
            int _600 = _88 + 1;
            uint _602 = uint(int(uint(_596) >> uint(2)));
            _37[int(_602)] = as_type<uint>(_574);
            int _604 = _596 + 4;
            uint _606 = uint(int(uint(_604) >> uint(2)));
            _37[int(_606)] = as_type<uint>(_566);
            int _608 = _596 + 8;
            uint _610 = uint(int(uint(_608) >> uint(2)));
            _37[int(_610)] = as_type<uint>(_592);
            int _612 = _596 + 12;
            uint _614 = uint(int(uint(_612) >> uint(2)));
            _37[int(_614)] = as_type<uint>(_586);
            bool _616 = uint(_600) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _618 = _596 + 16;
            uint _620 = uint(int(uint(_618) >> uint(2)));
            _37[int(_620)] = as_type<uint>(_584);
            int _622 = _596 + 20;
            uint _624 = uint(int(uint(_622) >> uint(2)));
            _37[int(_624)] = as_type<uint>(_568);
            int _626 = _596 + 24;
            uint _628 = uint(int(uint(_626) >> uint(2)));
            _37[int(_628)] = as_type<uint>(_594);
            int _630 = _596 + 28;
            uint _632 = uint(int(uint(_630) >> uint(2)));
            _37[int(_632)] = as_type<uint>(_588);
            int _634 = _596 + 32;
            uint _636 = uint(int(uint(_634) >> uint(2)));
            _37[int(_636)] = as_type<uint>(_590);
            int _638 = _596 + 36;
            uint _640 = uint(int(uint(_638) >> uint(2)));
            _37[int(_640)] = as_type<uint>(_570);
            int _642 = _596 + 40;
            uint _644 = uint(int(uint(_642) >> uint(2)));
            _37[int(_644)] = as_type<uint>(_572);
            int _646 = _596 + 44;
            uint _648 = uint(int(uint(_646) >> uint(2)));
            _37[int(_648)] = as_type<uint>(_598);
            _86 = !_616;
            _82 = _600;
            _84 = _416;
        } while (_86);
    }
    bool _650 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _652 = !_650;
    if (!_652)
    {
        int _654 = 1;
        bool _656;
        do
        {
            int _658 = _654;
            int _660 = _658 * 112;
            int _662 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _664 = _662 + _658;
            int _666 = _658 + 1;
            uint _668 = uint(int(uint(_660) >> uint(2)));
            uint _670 = uint(int(uint(int(_668)) >> uint(2)));
            int _672 = int(_668) & 3;
            float _674 = (*spvDescriptorSet0.cp_c6)._m0[int(_670)][_672];
            int _676 = _664 * 48;
            bool _678 = uint(_666) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _680 = _676 + 16;
            uint _682 = uint(int(uint(_680) >> uint(2)));
            float _684 = as_type<float>(_37[int(_682)]);
            int _686 = _676 + 20;
            uint _688 = uint(int(uint(_686) >> uint(2)));
            float _690 = as_type<float>(_37[int(_688)]);
            int _692 = _676 + 24;
            uint _694 = uint(int(uint(_692) >> uint(2)));
            float _696 = as_type<float>(_37[int(_694)]);
            int _698 = _676 + 28;
            uint _700 = uint(int(uint(_698) >> uint(2)));
            float _702 = as_type<float>(_37[int(_700)]);
            int _704 = _676 + 32;
            uint _706 = uint(int(uint(_704) >> uint(2)));
            float _708 = as_type<float>(_37[int(_706)]);
            int _710 = _676 + 36;
            uint _712 = uint(int(uint(_710) >> uint(2)));
            float _714 = as_type<float>(_37[int(_712)]);
            int _716 = _676 + 40;
            uint _718 = uint(int(uint(_716) >> uint(2)));
            float _720 = as_type<float>(_37[int(_718)]);
            int _722 = _676 + 44;
            uint _724 = uint(int(uint(_722) >> uint(2)));
            float _726 = as_type<float>(_37[int(_724)]);
            int _728 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _730 = _728 + as_type<int>(_674);
            int _732 = _730 * 48;
            uint _734 = uint(int(uint(_676) >> uint(2)));
            float _736 = as_type<float>(_37[int(_734)]);
            int _738 = _676 + 4;
            uint _740 = uint(int(uint(_738) >> uint(2)));
            float _742 = as_type<float>(_37[int(_740)]);
            int _744 = _676 + 8;
            uint _746 = uint(int(uint(_744) >> uint(2)));
            float _748 = as_type<float>(_37[int(_746)]);
            int _750 = _676 + 12;
            uint _752 = uint(int(uint(_750) >> uint(2)));
            float _754 = as_type<float>(_37[int(_752)]);
            uint _756 = uint(int(uint(_732) >> uint(2)));
            float _758 = as_type<float>(_37[int(_756)]);
            int _760 = _732 + 4;
            uint _762 = uint(int(uint(_760) >> uint(2)));
            float _764 = as_type<float>(_37[int(_762)]);
            int _766 = _732 + 8;
            uint _768 = uint(int(uint(_766) >> uint(2)));
            float _770 = as_type<float>(_37[int(_768)]);
            int _772 = _732 + 12;
            uint _774 = uint(int(uint(_772) >> uint(2)));
            float _776 = as_type<float>(_37[int(_774)]);
            int _778 = _732 + 16;
            uint _780 = uint(int(uint(_778) >> uint(2)));
            float _782 = as_type<float>(_37[int(_780)]);
            int _784 = _732 + 20;
            uint _786 = uint(int(uint(_784) >> uint(2)));
            float _788 = as_type<float>(_37[int(_786)]);
            int _790 = _732 + 24;
            uint _792 = uint(int(uint(_790) >> uint(2)));
            float _794 = as_type<float>(_37[int(_792)]);
            int _796 = _732 + 28;
            uint _798 = uint(int(uint(_796) >> uint(2)));
            float _800 = as_type<float>(_37[int(_798)]);
            int _802 = _732 + 32;
            uint _804 = uint(int(uint(_802) >> uint(2)));
            float _806 = as_type<float>(_37[int(_804)]);
            int _808 = _732 + 36;
            uint _810 = uint(int(uint(_808) >> uint(2)));
            float _812 = as_type<float>(_37[int(_810)]);
            int _814 = _732 + 40;
            uint _816 = uint(int(uint(_814) >> uint(2)));
            float _818 = as_type<float>(_37[int(_816)]);
            int _820 = _732 + 44;
            uint _822 = uint(int(uint(_820) >> uint(2)));
            float _824 = as_type<float>(_37[int(_822)]);
            float _826 = _702 * _764;
            float _828 = _690 * _764;
            float _830 = _684 * _764;
            float _832 = _696 * _764;
            float _834 = fma(_754, _758, _826);
            float _836 = fma(_742, _758, _828);
            float _838 = fma(_736, _758, _830);
            float _840 = fma(_748, _758, _832);
            float _842 = fma(_726, _770, _834);
            float _844 = fma(_714, _770, _836);
            float _846 = _690 * _788;
            float _848 = _684 * _788;
            float _850 = _776 + _842;
            float _852 = _702 * _788;
            float _854 = _696 * _788;
            float _856 = fma(_742, _782, _846);
            float _858 = fma(_708, _770, _838);
            float _860 = fma(_754, _782, _852);
            float _862 = fma(_748, _782, _854);
            float _864 = fma(_714, _794, _856);
            float _866 = _702 * _812;
            float _868 = _684 * _812;
            float _870 = _690 * _812;
            float _872 = _696 * _812;
            float _874 = fma(_754, _806, _866);
            float _876 = fma(_736, _782, _848);
            float _878 = fma(_726, _794, _860);
            float _880 = fma(_736, _806, _868);
            float _882 = fma(_742, _806, _870);
            float _884 = fma(_748, _806, _872);
            float _886 = fma(_726, _818, _874);
            float _888 = fma(_708, _794, _876);
            float _890 = fma(_720, _770, _840);
            float _892 = fma(_720, _794, _862);
            float _894 = _800 + _878;
            float _896 = fma(_708, _818, _880);
            float _898 = fma(_714, _818, _882);
            float _900 = fma(_720, _818, _884);
            float _902 = _824 + _886;
            uint _904 = uint(int(uint(_676) >> uint(2)));
            _37[int(_904)] = as_type<uint>(_858);
            int _906 = _676 + 4;
            uint _908 = uint(int(uint(_906) >> uint(2)));
            _37[int(_908)] = as_type<uint>(_844);
            int _910 = _676 + 8;
            uint _912 = uint(int(uint(_910) >> uint(2)));
            _37[int(_912)] = as_type<uint>(_890);
            int _914 = _676 + 12;
            uint _916 = uint(int(uint(_914) >> uint(2)));
            _37[int(_916)] = as_type<uint>(_850);
            int _918 = _676 + 16;
            uint _920 = uint(int(uint(_918) >> uint(2)));
            _37[int(_920)] = as_type<uint>(_888);
            int _922 = _676 + 20;
            uint _924 = uint(int(uint(_922) >> uint(2)));
            _37[int(_924)] = as_type<uint>(_864);
            int _926 = _676 + 24;
            uint _928 = uint(int(uint(_926) >> uint(2)));
            _37[int(_928)] = as_type<uint>(_892);
            int _930 = _676 + 28;
            uint _932 = uint(int(uint(_930) >> uint(2)));
            _37[int(_932)] = as_type<uint>(_894);
            int _934 = _676 + 32;
            uint _936 = uint(int(uint(_934) >> uint(2)));
            _37[int(_936)] = as_type<uint>(_896);
            int _938 = _676 + 36;
            uint _940 = uint(int(uint(_938) >> uint(2)));
            _37[int(_940)] = as_type<uint>(_898);
            int _942 = _676 + 40;
            uint _944 = uint(int(uint(_942) >> uint(2)));
            _37[int(_944)] = as_type<uint>(_900);
            int _946 = _676 + 44;
            uint _948 = uint(int(uint(_946) >> uint(2)));
            _37[int(_948)] = as_type<uint>(_902);
            _656 = !_678;
            _654 = _666;
        } while (_656);
    }
    if (!_74)
    {
        return;
    }
    int _950 = 0;
    bool _952;
    do
    {
        int _954 = _950;
        int _956 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _958 = _956 + _954;
        int _960 = _954 * 112;
        int _962 = _958 * 48;
        int _964 = _960 + 80;
        uint _966 = uint(int(uint(_964) >> uint(2)));
        uint _968 = uint(int(uint(int(_966)) >> uint(2)));
        int _970 = int(_966) & 3;
        float _972 = (*spvDescriptorSet0.cp_c6)._m0[int(_968)][_970];
        int _974 = int(_966) + 1;
        uint _976 = uint(int(uint(_974) >> uint(2)));
        int _978 = _974 & 3;
        float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
        uint _982 = uint(int(uint(_962) >> uint(2)));
        float _984 = as_type<float>(_37[int(_982)]);
        int _986 = _962 + 4;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        float _990 = as_type<float>(_37[int(_988)]);
        int _992 = _962 + 8;
        uint _994 = uint(int(uint(_992) >> uint(2)));
        float _996 = as_type<float>(_37[int(_994)]);
        int _998 = _962 + 12;
        uint _1000 = uint(int(uint(_998) >> uint(2)));
        float _1002 = as_type<float>(_37[int(_1000)]);
        int _1004 = _962 + 16;
        uint _1006 = uint(int(uint(_1004) >> uint(2)));
        float _1008 = as_type<float>(_37[int(_1006)]);
        int _1010 = _962 + 20;
        uint _1012 = uint(int(uint(_1010) >> uint(2)));
        float _1014 = as_type<float>(_37[int(_1012)]);
        int _1016 = _962 + 24;
        uint _1018 = uint(int(uint(_1016) >> uint(2)));
        float _1020 = as_type<float>(_37[int(_1018)]);
        int _1022 = _962 + 28;
        uint _1024 = uint(int(uint(_1022) >> uint(2)));
        float _1026 = as_type<float>(_37[int(_1024)]);
        int _1028 = _960 + 88;
        uint _1030 = uint(int(uint(_1028) >> uint(2)));
        uint _1032 = uint(int(uint(int(_1030)) >> uint(2)));
        int _1034 = int(_1030) & 3;
        float _1036 = (*spvDescriptorSet0.cp_c6)._m0[int(_1032)][_1034];
        int _1038 = int(_1030) + 1;
        uint _1040 = uint(int(uint(_1038) >> uint(2)));
        int _1042 = _1038 & 3;
        float _1044 = (*spvDescriptorSet0.cp_c6)._m0[int(_1040)][_1042];
        int _1046 = _962 + 32;
        uint _1048 = uint(int(uint(_1046) >> uint(2)));
        float _1050 = as_type<float>(_37[int(_1048)]);
        int _1052 = _962 + 36;
        uint _1054 = uint(int(uint(_1052) >> uint(2)));
        float _1056 = as_type<float>(_37[int(_1054)]);
        int _1058 = _962 + 40;
        uint _1060 = uint(int(uint(_1058) >> uint(2)));
        float _1062 = as_type<float>(_37[int(_1060)]);
        int _1064 = _962 + 44;
        uint _1066 = uint(int(uint(_1064) >> uint(2)));
        float _1068 = as_type<float>(_37[int(_1066)]);
        int _1070 = _960 + 64;
        uint _1072 = uint(int(uint(_1070) >> uint(2)));
        uint _1074 = uint(int(uint(int(_1072)) >> uint(2)));
        int _1076 = int(_1072) & 3;
        float _1078 = (*spvDescriptorSet0.cp_c6)._m0[int(_1074)][_1076];
        int _1080 = int(_1072) + 1;
        uint _1082 = uint(int(uint(_1080) >> uint(2)));
        int _1084 = _1080 & 3;
        float _1086 = (*spvDescriptorSet0.cp_c6)._m0[int(_1082)][_1084];
        int _1088 = _960 + 72;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
        int _1094 = int(_1090) & 3;
        float _1096 = (*spvDescriptorSet0.cp_c6)._m0[int(_1092)][_1094];
        int _1098 = int(_1090) + 1;
        uint _1100 = uint(int(uint(_1098) >> uint(2)));
        int _1102 = _1098 & 3;
        float _1104 = (*spvDescriptorSet0.cp_c6)._m0[int(_1100)][_1102];
        int _1106 = _960 + 104;
        uint _1108 = uint(int(uint(_1106) >> uint(2)));
        uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
        int _1112 = int(_1108) & 3;
        float _1114 = (*spvDescriptorSet0.cp_c6)._m0[int(_1110)][_1112];
        int _1116 = int(_1108) + 1;
        uint _1118 = uint(int(uint(_1116) >> uint(2)));
        int _1120 = _1116 & 3;
        float _1122 = (*spvDescriptorSet0.cp_c6)._m0[int(_1118)][_1120];
        int _1124 = _960 + 96;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
        int _1130 = int(_1126) & 3;
        float _1132 = (*spvDescriptorSet0.cp_c6)._m0[int(_1128)][_1130];
        int _1134 = int(_1126) + 1;
        uint _1136 = uint(int(uint(_1134) >> uint(2)));
        int _1138 = _1134 & 3;
        float _1140 = (*spvDescriptorSet0.cp_c6)._m0[int(_1136)][_1138];
        float _1142 = _990 * _972;
        float _1144 = _990 * _980;
        float _1146 = _990 * _1036;
        float _1148 = _990 * _1044;
        float _1150 = fma(_984, _1078, _1142);
        float _1152 = fma(_984, _1086, _1144);
        float _1154 = fma(_984, _1096, _1146);
        float _1156 = fma(_984, _1104, _1148);
        float _1158 = _1014 * _972;
        float _1160 = _1014 * _980;
        float _1162 = _1014 * _1036;
        float _1164 = _1014 * _1044;
        float _1166 = _1056 * _972;
        float _1168 = fma(_1008, _1078, _1158);
        float _1170 = fma(_1008, _1086, _1160);
        float _1172 = fma(_1008, _1096, _1162);
        uint _1174 = uint(int(uint(_78) >> uint(2)));
        uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
        int _1178 = int(_1174) & 3;
        float _1180 = (*spvDescriptorSet0.cp_c4)._m0[int(_1176)][_1178];
        float _1182 = fma(_1008, _1104, _1164);
        float _1184 = _1056 * _980;
        float _1186 = _1056 * _1036;
        float _1188 = _1056 * _1044;
        float _1190 = fma(_1050, _1078, _1166);
        float _1192 = fma(_1050, _1086, _1184);
        float _1194 = fma(_1050, _1096, _1186);
        int _1196 = _960 + 16;
        uint _1198 = uint(int(uint(_1196) >> uint(2)));
        uint _1200 = uint(int(uint(int(_1198)) >> uint(2)));
        int _1202 = int(_1198) & 3;
        float _1204 = (*spvDescriptorSet0.cp_c6)._m0[int(_1200)][_1202];
        int _1206 = int(_1198) + 1;
        uint _1208 = uint(int(uint(_1206) >> uint(2)));
        int _1210 = _1206 & 3;
        float _1212 = (*spvDescriptorSet0.cp_c6)._m0[int(_1208)][_1210];
        float _1214 = fma(_1050, _1104, _1188);
        float _1216 = fma(_1020, _1122, _1182);
        float _1218 = fma(_996, _1132, _1150);
        float _1220 = fma(_996, _1140, _1152);
        float _1222 = fma(_996, _1114, _1154);
        float _1224 = fma(_996, _1122, _1156);
        float _1226 = fma(_1020, _1132, _1168);
        int _1228 = _960 + 24;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
        int _1234 = int(_1230) & 3;
        float _1236 = (*spvDescriptorSet0.cp_c6)._m0[int(_1232)][_1234];
        int _1238 = int(_1230) + 1;
        uint _1240 = uint(int(uint(_1238) >> uint(2)));
        int _1242 = _1238 & 3;
        float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
        float _1246 = fma(_1020, _1140, _1170);
        float _1248 = fma(_1020, _1114, _1172);
        float _1250 = fma(_1062, _1132, _1190);
        float _1252 = fma(_1062, _1140, _1192);
        float _1254 = fma(_1062, _1122, _1214);
        float _1256 = fma(_1062, _1114, _1194);
        float _1258 = _1026 + _1216;
        int _1260 = _960 + 32;
        uint _1262 = uint(int(uint(_1260) >> uint(2)));
        uint _1264 = uint(int(uint(int(_1262)) >> uint(2)));
        int _1266 = int(_1262) & 3;
        float _1268 = (*spvDescriptorSet0.cp_c6)._m0[int(_1264)][_1266];
        int _1270 = int(_1262) + 1;
        uint _1272 = uint(int(uint(_1270) >> uint(2)));
        int _1274 = _1270 & 3;
        float _1276 = (*spvDescriptorSet0.cp_c6)._m0[int(_1272)][_1274];
        float _1278 = _1068 + _1254;
        float _1280 = _1002 + _1224;
        int _1282 = _960 + 48;
        uint _1284 = uint(int(uint(_1282) >> uint(2)));
        uint _1286 = uint(int(uint(int(_1284)) >> uint(2)));
        int _1288 = int(_1284) & 3;
        float _1290 = (*spvDescriptorSet0.cp_c6)._m0[int(_1286)][_1288];
        int _1292 = int(_1284) + 1;
        uint _1294 = uint(int(uint(_1292) >> uint(2)));
        int _1296 = _1292 & 3;
        float _1298 = (*spvDescriptorSet0.cp_c6)._m0[int(_1294)][_1296];
        float _1300 = _1226 * _1212;
        float _1302 = _1246 * _1212;
        float _1304 = _1258 * _1212;
        float _1306 = _1248 * _1212;
        float _1308 = fma(_1218, _1204, _1300);
        float _1310 = fma(_1220, _1204, _1302);
        float _1312 = fma(_1280, _1204, _1304);
        float _1314 = fma(_1222, _1204, _1306);
        int _1316 = _960 + 40;
        uint _1318 = uint(int(uint(_1316) >> uint(2)));
        uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
        int _1322 = int(_1318) & 3;
        float _1324 = (*spvDescriptorSet0.cp_c6)._m0[int(_1320)][_1322];
        int _1326 = int(_1318) + 1;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        int _1330 = _1326 & 3;
        float _1332 = (*spvDescriptorSet0.cp_c6)._m0[int(_1328)][_1330];
        float _1334 = fma(_1250, _1236, _1308);
        float _1336 = fma(_1278, _1236, _1312);
        float _1338 = fma(_1252, _1236, _1310);
        float _1340 = fma(_1256, _1236, _1314);
        float _1342 = _1336 + _1244;
        float _1344 = _1258 * _1276;
        int _1346 = _960 + 56;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        uint _1350 = uint(int(uint(int(_1348)) >> uint(2)));
        int _1352 = int(_1348) & 3;
        float _1354 = (*spvDescriptorSet0.cp_c6)._m0[int(_1350)][_1352];
        int _1356 = int(_1348) + 1;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        int _1360 = _1356 & 3;
        float _1362 = (*spvDescriptorSet0.cp_c6)._m0[int(_1358)][_1360];
        float _1364 = _1226 * _1276;
        float _1366 = _1246 * _1276;
        int _1368 = as_type<int>(_1180) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1370 = _1368 + _954;
        int _1372 = _954 + 1;
        float _1374 = _1248 * _1276;
        float _1376 = fma(_1280, _1268, _1344);
        float _1378 = _1258 * _1298;
        float _1380 = _1226 * _1298;
        float _1382 = _1246 * _1298;
        float _1384 = fma(_1220, _1268, _1366);
        float _1386 = _1248 * _1298;
        float _1388 = fma(_1280, _1290, _1378);
        float _1390 = fma(_1218, _1290, _1380);
        int _1392 = _1370 * 48;
        bool _1394 = uint(_1372) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1396 = fma(_1220, _1290, _1382);
        float _1398 = fma(_1218, _1268, _1364);
        float _1400 = fma(_1222, _1268, _1374);
        float _1402 = fma(_1278, _1324, _1376);
        float _1404 = fma(_1222, _1290, _1386);
        float _1406 = fma(_1252, _1324, _1384);
        float _1408 = fma(_1250, _1324, _1398);
        float _1410 = fma(_1256, _1324, _1400);
        float _1412 = fma(_1278, _1354, _1388);
        float _1414 = fma(_1250, _1354, _1390);
        float _1416 = fma(_1252, _1354, _1396);
        int _1418 = _1392 + 16;
        float _1420 = _1402 + _1332;
        int _1422 = _1392 + 32;
        float _1424 = fma(_1256, _1354, _1404);
        float _1426 = _1412 + _1362;
        int _1428 = _1392 + 48;
        uint _1430 = uint(int(uint(_1418) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1430)] = as_type<uint>(_1334);
        int _1432 = _1418 + 4;
        uint _1434 = uint(int(uint(_1432) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1434)] = as_type<uint>(_1338);
        int _1436 = _1418 + 8;
        uint _1438 = uint(int(uint(_1436) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1438)] = as_type<uint>(_1340);
        int _1440 = _1418 + 12;
        uint _1442 = uint(int(uint(_1440) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1442)] = as_type<uint>(_1342);
        uint _1444 = uint(int(uint(_1422) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1444)] = as_type<uint>(_1408);
        int _1446 = _1422 + 4;
        uint _1448 = uint(int(uint(_1446) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1448)] = as_type<uint>(_1406);
        int _1450 = _1422 + 8;
        uint _1452 = uint(int(uint(_1450) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1452)] = as_type<uint>(_1410);
        int _1454 = _1422 + 12;
        uint _1456 = uint(int(uint(_1454) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1456)] = as_type<uint>(_1420);
        uint _1458 = uint(int(uint(_1428) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1458)] = as_type<uint>(_1414);
        int _1460 = _1428 + 4;
        uint _1462 = uint(int(uint(_1460) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1462)] = as_type<uint>(_1416);
        int _1464 = _1428 + 8;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1466)] = as_type<uint>(_1424);
        int _1468 = _1428 + 12;
        uint _1470 = uint(int(uint(_1468) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1470)] = as_type<uint>(_1426);
        _952 = !_1394;
        _950 = _1372;
    } while (_952);
}

