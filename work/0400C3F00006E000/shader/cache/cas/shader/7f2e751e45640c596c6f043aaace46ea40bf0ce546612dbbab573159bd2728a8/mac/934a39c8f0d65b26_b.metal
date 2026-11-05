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
int _58(thread const int& _4810, thread const int& _4811, constant _10& support_buffer)
{
    int _4814 = 1 + _4811;
    float _4816 = support_buffer._m5[_4814].x;
    bool _4818 = _4816 == 1.0;
    if (_4818)
    {
        return _4810;
    }
    float _4820 = float(_4810);
    float _4822 = _4820 * _4816;
    int _4824 = int(_4822);
    return _4824;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4498, thread const int& _4499, thread const int& _4500, thread const int& _4501, thread int& _4502, thread int& _4503, thread int& _4504, thread int& _4505, thread int& _4506, thread int& _4507)
{
    float _4510 = as_type<float>(_4500) + 0.0;
    bool _4512 = _4510 != 0.0;
    bool _4514 = isnan(_4510);
    bool _4516 = _4512 || _4514;
    bool _4518 = isnan(0.0);
    bool _4520 = _4516 || _4518;
    int _4522 = as_type<int>(_4510);
    int _4524 = _4499;
    int _4526 = _4500;
    int _4528 = _4520 ? (-1) : 0;
    if (!_4520)
    {
        float _4530 = as_type<float>(_4500) * 1.0;
        _4522 = as_type<int>(_4530);
    }
    int _4532 = _4522;
    bool _4534 = !_4520;
    int _4536 = _4532;
    if (!_4534)
    {
        float _4538 = as_type<float>(_4500) + 0.0;
        bool _4540 = _4538 >= 0.0;
        bool _4542 = isnan(_4538);
        bool _4544 = _4540 || _4542;
        bool _4546 = isnan(0.0);
        bool _4548 = _4544 || _4546;
        int _4550 = as_type<int>(_4538);
        _4528 = _4548 ? (-1) : 0;
        if (!_4548)
        {
            _4550 = 2147483647;
        }
        int _4552 = _4550;
        bool _4554 = !_4548;
        _4536 = _4552;
        if (!_4554)
        {
            float _4556 = as_type<float>(_4500) + 0.0;
            bool _4558 = _4556 > as_type<float>(0x7f800000u /* inf */);
            bool _4560 = isnan(_4556);
            bool _4562 = _4558 || _4560;
            bool _4564 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4566 = _4562 || _4564;
            int _4568 = as_type<int>(_4556);
            _4528 = _4566 ? (-1) : 0;
            if (_4566)
            {
                float _4570 = as_type<float>(_4500) + 1.0;
                _4568 = as_type<int>(_4570);
            }
            int _4572 = _4568;
            _4536 = _4572;
            if (!_4566)
            {
                float _4574 = 0.0 + as_type<float>(_4500);
                bool _4576 = _4574 != as_type<float>(0x7f800000u /* inf */);
                bool _4578 = isnan(_4574);
                bool _4580 = _4576 || _4578;
                bool _4582 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4584 = _4580 || _4582;
                int _4586 = as_type<int>(_4574);
                _4528 = _4584 ? (-1) : 0;
                if (!_4584)
                {
                    _4586 = _4500;
                }
                int _4588 = _4586;
                bool _4590 = !_4584;
                _4536 = _4588;
                if (!_4590)
                {
                    float _4592 = as_type<float>(_4500) * 18446744073709551616.0;
                    float _4594 = rsqrt(_4592);
                    float _4596 = _4592 * _4594;
                    float _4598 = _4594 * 0.5;
                    float _4600 = -_4596;
                    float _4602 = 0.0 + _4600;
                    float _4604 = fma(_4598, _4602, 0.5);
                    float _4606 = fma(_4596, _4604, _4596);
                    float _4608 = -_4606;
                    float _4610 = 0.0 + _4608;
                    float _4612 = fma(_4606, _4610, _4592);
                    float _4614 = fma(_4598, _4612, _4606);
                    float _4616 = _4614 * 2.3283064365386962890625e-10;
                    _4536 = as_type<int>(_4616);
                    _4524 = as_type<int>(_4606);
                    _4526 = as_type<int>(_4602);
                }
            }
        }
    }
    int _4618 = _4536;
    int _4620 = _4524;
    int _4622 = _4526;
    int _4624 = _4528;
    _4502 = _4618;
    _4503 = _4501;
    _4504 = 0;
    _4505 = _4620;
    _4506 = _4622;
    _4507 = _4624;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _488 = false;
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
        bool _84;
        int _472;
        int _474;
        int _476;
        int _478;
        int _480;
        int _482;
        float _484;
        float _486;
        do
        {
            int _86 = _82;
            uint _89 = uint(int(uint(_78) >> uint(2)));
            uint _91 = uint(int(uint(int(_89)) >> uint(2)));
            int _93 = int(_89) & 3;
            float _95 = (*spvDescriptorSet0.cp_c4)._m0[int(_91)][_93];
            int _97 = as_type<int>(_95) * 48;
            uint _99 = uint(int(uint(_97) >> uint(2)));
            uint _101 = uint(int(uint(int(_99)) >> uint(2)));
            int _103 = int(_99) & 3;
            float _105 = (*spvDescriptorSet0.cp_c5)._m0[int(_101)][_103];
            int _107 = int(_99) + 1;
            uint _109 = uint(int(uint(_107) >> uint(2)));
            int _111 = _107 & 3;
            float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
            int _115 = _97 + 8;
            uint _117 = uint(int(uint(_115) >> uint(2)));
            uint _119 = uint(int(uint(int(_117)) >> uint(2)));
            int _121 = int(_117) & 3;
            float _123 = (*spvDescriptorSet0.cp_c5)._m0[int(_119)][_121];
            int _125 = int(_117) + 1;
            uint _127 = uint(int(uint(_125) >> uint(2)));
            int _129 = _125 & 3;
            float _131 = (*spvDescriptorSet0.cp_c5)._m0[int(_127)][_129];
            int _133 = _86;
            int _135 = 0;
            int _137 = _58(_133, _135, (*spvDescriptorSet0.support_buffer));
            int _139 = as_type<int>(_105);
            int _141 = 0;
            int _143 = _58(_139, _141, (*spvDescriptorSet0.support_buffer));
            int3 _1896 = int3(_137, _143, 1);
            float4 _146 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1896.xy), uint(_1896.z), 0).xyzw;
            float _148 = _146.x;
            float _150 = _146.y;
            float _152 = _146.z;
            float _154 = _146.w;
            int _156 = _86;
            int _158 = 0;
            int _160 = _58(_156, _158, (*spvDescriptorSet0.support_buffer));
            int _162 = as_type<int>(_113);
            int _164 = 0;
            int _166 = _58(_162, _164, (*spvDescriptorSet0.support_buffer));
            int3 _1916 = int3(_160, _166, 1);
            float4 _168 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1916.xy), uint(_1916.z), 0).xyzw;
            float _170 = _168.x;
            float _172 = _168.y;
            float _174 = _168.z;
            float _176 = _168.w;
            int _178 = _86;
            int _180 = 0;
            int _182 = _58(_178, _180, (*spvDescriptorSet0.support_buffer));
            int _184 = as_type<int>(_105);
            int _186 = 0;
            int _188 = _58(_184, _186, (*spvDescriptorSet0.support_buffer));
            int3 _1936 = int3(_182, _188, 0);
            float3 _192 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1936.xy), uint(_1936.z), 0).xyz;
            float _194 = _192.x;
            float _196 = _192.y;
            float _198 = _192.z;
            int _200 = _86;
            int _202 = 0;
            int _204 = _58(_200, _202, (*spvDescriptorSet0.support_buffer));
            int _206 = as_type<int>(_113);
            int _208 = 0;
            int _210 = _58(_206, _208, (*spvDescriptorSet0.support_buffer));
            int3 _1954 = int3(_204, _210, 0);
            float3 _212 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1954.xy), uint(_1954.z), 0).xyz;
            float _214 = _212.x;
            float _216 = _212.y;
            float _218 = _212.z;
            int _220 = _86;
            int _222 = 1;
            int _224 = _58(_220, _222, (*spvDescriptorSet0.support_buffer));
            int _226 = as_type<int>(_123);
            int _228 = 1;
            int _230 = _58(_226, _228, (*spvDescriptorSet0.support_buffer));
            int3 _1972 = int3(_224, _230, 1);
            float4 _232 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1972.xy), uint(_1972.z), 0).xyzw;
            float _234 = _232.x;
            float _236 = _232.y;
            float _238 = _232.z;
            float _240 = _232.w;
            int _242 = _86;
            int _244 = 1;
            int _246 = _58(_242, _244, (*spvDescriptorSet0.support_buffer));
            int _248 = as_type<int>(_131);
            int _250 = 1;
            int _252 = _58(_248, _250, (*spvDescriptorSet0.support_buffer));
            int3 _1992 = int3(_246, _252, 1);
            float4 _254 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1992.xy), uint(_1992.z), 0).xyzw;
            float _256 = _254.x;
            float _258 = _254.y;
            float _260 = _254.z;
            float _262 = _254.w;
            int _264 = _86;
            int _266 = 0;
            int _268 = _58(_264, _266, (*spvDescriptorSet0.support_buffer));
            int _270 = as_type<int>(_105);
            int _272 = 0;
            int _274 = _58(_270, _272, (*spvDescriptorSet0.support_buffer));
            int3 _2012 = int3(_268, _274, 2);
            float3 _276 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2012.xy), uint(_2012.z), 0).xyz;
            float _278 = _276.x;
            float _280 = _276.y;
            float _282 = _276.z;
            int _284 = _86;
            int _286 = 0;
            int _288 = _58(_284, _286, (*spvDescriptorSet0.support_buffer));
            int _290 = as_type<int>(_113);
            int _292 = 0;
            int _294 = _58(_290, _292, (*spvDescriptorSet0.support_buffer));
            int3 _2030 = int3(_288, _294, 2);
            float3 _296 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2030.xy), uint(_2030.z), 0).xyz;
            float _298 = _296.x;
            float _300 = _296.y;
            float _302 = _296.z;
            int _304 = _97 + 16;
            uint _306 = uint(int(uint(_304) >> uint(2)));
            uint _308 = uint(int(uint(int(_306)) >> uint(2)));
            int _310 = int(_306) & 3;
            float _312 = (*spvDescriptorSet0.cp_c5)._m0[int(_308)][_310];
            int _314 = _97 + 24;
            uint _316 = uint(int(uint(_314) >> uint(2)));
            uint _318 = uint(int(uint(int(_316)) >> uint(2)));
            int _320 = int(_316) & 3;
            float _322 = (*spvDescriptorSet0.cp_c5)._m0[int(_318)][_320];
            float _324 = -_148;
            float _326 = _324 + _170;
            float _328 = -_150;
            float _330 = _328 + _172;
            float _332 = -_196;
            float _334 = _332 + _216;
            float _336 = -_152;
            float _338 = _336 + _174;
            float _340 = -_154;
            float _342 = _340 + _176;
            float _344 = fma(_330, _312, _150);
            float _346 = -_194;
            float _348 = _346 + _214;
            float _350 = fma(_334, _312, _196);
            float _352 = -_236;
            float _354 = _352 + _258;
            float _356 = fma(_326, _312, _148);
            float _358 = fma(_348, _312, _194);
            float _360 = -_234;
            float _362 = _360 + _256;
            float _364 = fma(_354, _322, _236);
            float _366 = fma(_342, _312, _154);
            float _368 = -_238;
            float _370 = _368 + _260;
            float _372 = fma(_362, _322, _234);
            float _374 = _344 * _364;
            float _376 = fma(_338, _312, _152);
            float _378 = fma(_370, _322, _238);
            float _380 = -_240;
            float _382 = _380 + _262;
            float _384 = fma(_356, _372, _374);
            float _386 = -_198;
            float _388 = _386 + _218;
            float _390 = fma(_382, _322, _240);
            float _392 = fma(_376, _378, _384);
            float _394 = -_278;
            float _396 = _394 + _298;
            float _398 = -_282;
            float _400 = _398 + _302;
            float _402 = fma(_388, _312, _198);
            float _404 = fma(_366, _390, _392);
            float _406 = fma(_396, _312, _278);
            float _408 = precise::max(_404, -1.0);
            float _410 = precise::min(_408, 1.0);
            bool _412 = _410 >= 0.0;
            bool _414 = isnan(_410);
            bool _416 = _412 || _414;
            bool _418 = isnan(0.0);
            bool _420 = _416 || _418;
            bool _422 = !_420;
            float _424 = -_410;
            float _426 = _422 ? _424 : _410;
            bool _428 = _426 < 0.0;
            float _430 = float(_428);
            float _432 = abs(_426);
            float _434 = -_432;
            float _436 = _434 + 1.0;
            float _438 = abs(_426);
            float _440 = fma(_438, -0.0187292993068695068359375, 0.074261002242565155029296875);
            int _442 = as_type<int>(_436) + (-218103808);
            float _444 = abs(_426);
            float _446 = fma(_444, _440, -0.212114393711090087890625);
            bool _448 = uint(_442) >= 1920991232u;
            float _450 = -_280;
            float _452 = _450 + _300;
            float _454 = abs(_426);
            float _456 = fma(_454, _446, 1.570728778839111328125);
            float _458 = fma(_452, _312, _280);
            float _460 = fma(_400, _312, _282);
            bool _462 = !_448;
            if (!_462)
            {
                int _464 = as_type<int>(_426);
                int _466 = as_type<int>(_446);
                int _468 = as_type<int>(_436);
                int _470 = 1328;
                _56(_464, _466, _468, _470, _472, _474, _476, _478, _480, _482);
                _484 = as_type<float>(_472);
                _486 = as_type<float>(_474);
                _488 = true;
            }
            else
            {
                float _490 = rsqrt(_436);
                float _492 = _436 * _490;
                float _494 = _490 * 0.5;
                float _496 = -_492;
                float _498 = 0.0 + _496;
                float _500 = fma(_494, _498, 0.5);
                float _502 = fma(_492, _500, _492);
                float _504 = -_502;
                float _506 = 0.0 + _504;
                float _508 = fma(_502, _506, _436);
                float _510 = fma(_494, _508, _502);
                _484 = _510;
                _486 = _508;
            }
            _488 = false;
            float _512 = _484;
            float _514 = _486;
            float _516 = _456 * _512;
            float _518 = _430 * 2.0;
            float _520 = -_518;
            float _522 = fma(_516, _520, _516);
            float _524 = fma(_430, 3.1415927410125732421875, _522);
            float _526 = _524 * 0.15915493667125701904296875;
            float _528 = _526 * 6.283185482025146484375;
            float _530 = sin(_528);
            float _532 = abs(_530);
            bool _534 = _532 >= 0.001000000047497451305389404296875;
            bool _536 = isnan(_532);
            bool _538 = _534 || _536;
            bool _540 = isnan(0.001000000047497451305389404296875);
            bool _542 = _538 || _540;
            float _544 = _258;
            float _546 = _514;
            float _548 = _516;
            if (!_542)
            {
                int _550 = _97 + 28;
                uint _552 = uint(int(uint(_550) >> uint(2)));
                uint _554 = uint(int(uint(int(_552)) >> uint(2)));
                int _556 = int(_552) & 3;
                float _558 = (*spvDescriptorSet0.cp_c5)._m0[int(_554)][_556];
                _544 = _558;
            }
            float _560 = _544;
            float _562 = _560;
            if (!_542)
            {
                float _564 = -_560;
                float _566 = _564 + 1.0;
                _546 = _566;
            }
            float _568 = _546;
            float _570 = _568;
            if (!_542)
            {
                _548 = _560;
            }
            float _572 = _548;
            bool _574 = !_542;
            float _576 = _572;
            if (!_574)
            {
                int _578 = _97 + 28;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                uint _582 = uint(int(uint(int(_580)) >> uint(2)));
                int _584 = int(_580) & 3;
                float _586 = (*spvDescriptorSet0.cp_c5)._m0[int(_582)][_584];
                float _588 = 1.0 / _530;
                float _590 = _524 * _586;
                float _592 = _590 * 0.15915493667125701904296875;
                float _594 = -_590;
                float _596 = _524 + _594;
                float _598 = _596 * 0.15915493667125701904296875;
                float _600 = _592 * 6.283185482025146484375;
                float _602 = sin(_600);
                float _604 = _598 * 6.283185482025146484375;
                float _606 = sin(_604);
                float _608 = _602 * _588;
                float _610 = _606 * _588;
                _576 = _608;
                _570 = _610;
                _562 = _586;
            }
            float _612 = _576;
            float _614 = _570;
            float _616 = _562;
            int _618 = _97 + 8;
            uint _620 = uint(int(uint(_618) >> uint(2)));
            uint _622 = uint(int(uint(int(_620)) >> uint(2)));
            int _624 = int(_620) & 3;
            float _626 = (*spvDescriptorSet0.cp_c5)._m0[int(_622)][_624];
            int _628 = int(_620) + 1;
            uint _630 = uint(int(uint(_628) >> uint(2)));
            int _632 = _628 & 3;
            float _634 = (*spvDescriptorSet0.cp_c5)._m0[int(_630)][_632];
            int _636 = _86;
            int _638 = 1;
            int _640 = _58(_636, _638, (*spvDescriptorSet0.support_buffer));
            int _642 = as_type<int>(_626);
            int _644 = 1;
            int _646 = _58(_642, _644, (*spvDescriptorSet0.support_buffer));
            int3 _2514 = int3(_640, _646, 0);
            float3 _648 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2514.xy), uint(_2514.z), 0).xyz;
            float _650 = _648.x;
            float _652 = _648.y;
            float _654 = _648.z;
            int _656 = _86;
            int _658 = 1;
            int _660 = _58(_656, _658, (*spvDescriptorSet0.support_buffer));
            int _662 = as_type<int>(_634);
            int _664 = 1;
            int _666 = _58(_662, _664, (*spvDescriptorSet0.support_buffer));
            int3 _2532 = int3(_660, _666, 0);
            float3 _668 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2532.xy), uint(_2532.z), 0).xyz;
            float _670 = _668.x;
            float _672 = _668.y;
            float _674 = _668.z;
            int _676 = _86;
            int _678 = 1;
            int _680 = _58(_676, _678, (*spvDescriptorSet0.support_buffer));
            int _682 = as_type<int>(_626);
            int _684 = 1;
            int _686 = _58(_682, _684, (*spvDescriptorSet0.support_buffer));
            int3 _2550 = int3(_680, _686, 2);
            float3 _688 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2550.xy), uint(_2550.z), 0).xyz;
            float _690 = _688.x;
            float _692 = _688.y;
            float _694 = _688.z;
            int _696 = _86;
            int _698 = 1;
            int _700 = _58(_696, _698, (*spvDescriptorSet0.support_buffer));
            int _702 = as_type<int>(_634);
            int _704 = 1;
            int _706 = _58(_702, _704, (*spvDescriptorSet0.support_buffer));
            int3 _2568 = int3(_700, _706, 2);
            float3 _708 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2568.xy), uint(_2568.z), 0).xyz;
            float _710 = _708.x;
            float _712 = _708.y;
            float _714 = _708.z;
            int _716 = _97 + 24;
            uint _718 = uint(int(uint(_716) >> uint(2)));
            uint _720 = uint(int(uint(int(_718)) >> uint(2)));
            int _722 = int(_718) & 3;
            float _724 = (*spvDescriptorSet0.cp_c5)._m0[int(_720)][_722];
            bool _726 = !_420;
            float _728 = -_612;
            float _730 = _726 ? _728 : _612;
            float _732 = _390 * _730;
            float _734 = _372 * _730;
            int _736 = _97 + 20;
            uint _738 = uint(int(uint(_736) >> uint(2)));
            uint _740 = uint(int(uint(int(_738)) >> uint(2)));
            int _742 = int(_738) & 3;
            float _744 = (*spvDescriptorSet0.cp_c5)._m0[int(_740)][_742];
            float _746 = _378 * _730;
            float _748 = fma(_366, _614, _732);
            float _750 = _364 * _730;
            float _752 = fma(_356, _614, _734);
            float _754 = fma(_376, _614, _746);
            float _756 = _748 * 2.0;
            float _758 = fma(_344, _614, _750);
            float _760 = _752 * 2.0;
            float _762 = _754 * _756;
            float _764 = _758 * _756;
            float _766 = _752 * _756;
            float _768 = _758 * 2.0;
            float _770 = -_762;
            float _772 = fma(_758, _760, _770);
            float _774 = fma(_758, _760, _762);
            float _776 = fma(_754, _760, _764);
            float _778 = -_764;
            float _780 = fma(_754, _760, _778);
            float _782 = _752 * _752;
            float _784 = _758 * _758;
            float _786 = -_766;
            float _788 = fma(_754, _768, _786);
            float _790 = fma(_754, _768, _766);
            float _792 = fma(_782, -2.0, 1.0);
            float _794 = _754 * _754;
            float _796 = fma(_784, -2.0, 1.0);
            float _798 = fma(_794, -2.0, _796);
            float _800 = fma(_794, -2.0, _792);
            float _802 = fma(_784, -2.0, _792);
            float _804 = -_650;
            float _806 = _804 + _670;
            float _808 = -_654;
            float _810 = _808 + _674;
            float _812 = -_652;
            float _814 = _812 + _672;
            float _816 = fma(_806, _724, _650);
            float _818 = fma(_810, _724, _654);
            float _820 = fma(_814, _724, _652);
            float _822 = _816 * _616;
            float _824 = _818 * _616;
            float _826 = -_690;
            float _828 = _826 + _710;
            float _830 = -_694;
            float _832 = _830 + _714;
            float _834 = fma(_358, _744, _822);
            float _836 = fma(_402, _744, _824);
            float _838 = _820 * _616;
            float _840 = fma(_828, _724, _690);
            float _842 = _798 * _834;
            float _844 = -_692;
            float _846 = _844 + _712;
            float _848 = fma(_832, _724, _694);
            float _850 = _802 * _836;
            float _852 = fma(_350, _744, _838);
            float _854 = fma(_846, _724, _692);
            float _856 = _840 * _616;
            int _858 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _860 = _858 + _86;
            float _862 = _848 * _616;
            float _864 = _854 * _616;
            float _866 = _774 * _834;
            float _868 = _780 * _834;
            float _870 = _772 * _852;
            float _872 = _800 * _852;
            float _874 = _790 * _852;
            float _876 = _776 * _836;
            float _878 = _788 * _836;
            float _880 = fma(_406, _744, _856);
            int _882 = _860 * 48;
            float _884 = fma(_458, _744, _864);
            float _886 = fma(_460, _744, _862);
            int _888 = _86 + 1;
            uint _890 = uint(int(uint(_882) >> uint(2)));
            _37[int(_890)] = as_type<uint>(_842);
            int _892 = _882 + 4;
            uint _894 = uint(int(uint(_892) >> uint(2)));
            _37[int(_894)] = as_type<uint>(_870);
            int _896 = _882 + 8;
            uint _898 = uint(int(uint(_896) >> uint(2)));
            _37[int(_898)] = as_type<uint>(_876);
            int _900 = _882 + 12;
            uint _902 = uint(int(uint(_900) >> uint(2)));
            _37[int(_902)] = as_type<uint>(_880);
            bool _904 = uint(_888) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _906 = _882 + 16;
            uint _908 = uint(int(uint(_906) >> uint(2)));
            _37[int(_908)] = as_type<uint>(_866);
            int _910 = _882 + 20;
            uint _912 = uint(int(uint(_910) >> uint(2)));
            _37[int(_912)] = as_type<uint>(_872);
            int _914 = _882 + 24;
            uint _916 = uint(int(uint(_914) >> uint(2)));
            _37[int(_916)] = as_type<uint>(_878);
            int _918 = _882 + 28;
            uint _920 = uint(int(uint(_918) >> uint(2)));
            _37[int(_920)] = as_type<uint>(_884);
            int _922 = _882 + 32;
            uint _924 = uint(int(uint(_922) >> uint(2)));
            _37[int(_924)] = as_type<uint>(_868);
            int _926 = _882 + 36;
            uint _928 = uint(int(uint(_926) >> uint(2)));
            _37[int(_928)] = as_type<uint>(_874);
            int _930 = _882 + 40;
            uint _932 = uint(int(uint(_930) >> uint(2)));
            _37[int(_932)] = as_type<uint>(_850);
            int _934 = _882 + 44;
            uint _936 = uint(int(uint(_934) >> uint(2)));
            _37[int(_936)] = as_type<uint>(_886);
            _84 = !_904;
            _82 = _888;
        } while (_84);
    }
    bool _938 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _940 = !_938;
    if (!_940)
    {
        int _942 = 1;
        bool _944;
        do
        {
            int _946 = _942;
            int _948 = _946 * 112;
            int _950 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _952 = _950 + _946;
            int _954 = _946 + 1;
            uint _956 = uint(int(uint(_948) >> uint(2)));
            uint _958 = uint(int(uint(int(_956)) >> uint(2)));
            int _960 = int(_956) & 3;
            float _962 = (*spvDescriptorSet0.cp_c6)._m0[int(_958)][_960];
            int _964 = _952 * 48;
            bool _966 = uint(_954) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _968 = _964 + 16;
            uint _970 = uint(int(uint(_968) >> uint(2)));
            float _972 = as_type<float>(_37[int(_970)]);
            int _974 = _964 + 20;
            uint _976 = uint(int(uint(_974) >> uint(2)));
            float _978 = as_type<float>(_37[int(_976)]);
            int _980 = _964 + 24;
            uint _982 = uint(int(uint(_980) >> uint(2)));
            float _984 = as_type<float>(_37[int(_982)]);
            int _986 = _964 + 28;
            uint _988 = uint(int(uint(_986) >> uint(2)));
            float _990 = as_type<float>(_37[int(_988)]);
            int _992 = _964 + 32;
            uint _994 = uint(int(uint(_992) >> uint(2)));
            float _996 = as_type<float>(_37[int(_994)]);
            int _998 = _964 + 36;
            uint _1000 = uint(int(uint(_998) >> uint(2)));
            float _1002 = as_type<float>(_37[int(_1000)]);
            int _1004 = _964 + 40;
            uint _1006 = uint(int(uint(_1004) >> uint(2)));
            float _1008 = as_type<float>(_37[int(_1006)]);
            int _1010 = _964 + 44;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            float _1014 = as_type<float>(_37[int(_1012)]);
            int _1016 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1018 = _1016 + as_type<int>(_962);
            int _1020 = _1018 * 48;
            uint _1022 = uint(int(uint(_964) >> uint(2)));
            float _1024 = as_type<float>(_37[int(_1022)]);
            int _1026 = _964 + 4;
            uint _1028 = uint(int(uint(_1026) >> uint(2)));
            float _1030 = as_type<float>(_37[int(_1028)]);
            int _1032 = _964 + 8;
            uint _1034 = uint(int(uint(_1032) >> uint(2)));
            float _1036 = as_type<float>(_37[int(_1034)]);
            int _1038 = _964 + 12;
            uint _1040 = uint(int(uint(_1038) >> uint(2)));
            float _1042 = as_type<float>(_37[int(_1040)]);
            uint _1044 = uint(int(uint(_1020) >> uint(2)));
            float _1046 = as_type<float>(_37[int(_1044)]);
            int _1048 = _1020 + 4;
            uint _1050 = uint(int(uint(_1048) >> uint(2)));
            float _1052 = as_type<float>(_37[int(_1050)]);
            int _1054 = _1020 + 8;
            uint _1056 = uint(int(uint(_1054) >> uint(2)));
            float _1058 = as_type<float>(_37[int(_1056)]);
            int _1060 = _1020 + 12;
            uint _1062 = uint(int(uint(_1060) >> uint(2)));
            float _1064 = as_type<float>(_37[int(_1062)]);
            int _1066 = _1020 + 16;
            uint _1068 = uint(int(uint(_1066) >> uint(2)));
            float _1070 = as_type<float>(_37[int(_1068)]);
            int _1072 = _1020 + 20;
            uint _1074 = uint(int(uint(_1072) >> uint(2)));
            float _1076 = as_type<float>(_37[int(_1074)]);
            int _1078 = _1020 + 24;
            uint _1080 = uint(int(uint(_1078) >> uint(2)));
            float _1082 = as_type<float>(_37[int(_1080)]);
            int _1084 = _1020 + 28;
            uint _1086 = uint(int(uint(_1084) >> uint(2)));
            float _1088 = as_type<float>(_37[int(_1086)]);
            int _1090 = _1020 + 32;
            uint _1092 = uint(int(uint(_1090) >> uint(2)));
            float _1094 = as_type<float>(_37[int(_1092)]);
            int _1096 = _1020 + 36;
            uint _1098 = uint(int(uint(_1096) >> uint(2)));
            float _1100 = as_type<float>(_37[int(_1098)]);
            int _1102 = _1020 + 40;
            uint _1104 = uint(int(uint(_1102) >> uint(2)));
            float _1106 = as_type<float>(_37[int(_1104)]);
            int _1108 = _1020 + 44;
            uint _1110 = uint(int(uint(_1108) >> uint(2)));
            float _1112 = as_type<float>(_37[int(_1110)]);
            float _1114 = _990 * _1052;
            float _1116 = _978 * _1052;
            float _1118 = _972 * _1052;
            float _1120 = _984 * _1052;
            float _1122 = fma(_1042, _1046, _1114);
            float _1124 = fma(_1030, _1046, _1116);
            float _1126 = fma(_1024, _1046, _1118);
            float _1128 = fma(_1036, _1046, _1120);
            float _1130 = fma(_1014, _1058, _1122);
            float _1132 = fma(_1002, _1058, _1124);
            float _1134 = _978 * _1076;
            float _1136 = _972 * _1076;
            float _1138 = _1064 + _1130;
            float _1140 = _990 * _1076;
            float _1142 = _984 * _1076;
            float _1144 = fma(_1030, _1070, _1134);
            float _1146 = fma(_996, _1058, _1126);
            float _1148 = fma(_1042, _1070, _1140);
            float _1150 = fma(_1036, _1070, _1142);
            float _1152 = fma(_1002, _1082, _1144);
            float _1154 = _990 * _1100;
            float _1156 = _972 * _1100;
            float _1158 = _978 * _1100;
            float _1160 = _984 * _1100;
            float _1162 = fma(_1042, _1094, _1154);
            float _1164 = fma(_1024, _1070, _1136);
            float _1166 = fma(_1014, _1082, _1148);
            float _1168 = fma(_1024, _1094, _1156);
            float _1170 = fma(_1030, _1094, _1158);
            float _1172 = fma(_1036, _1094, _1160);
            float _1174 = fma(_1014, _1106, _1162);
            float _1176 = fma(_996, _1082, _1164);
            float _1178 = fma(_1008, _1058, _1128);
            float _1180 = fma(_1008, _1082, _1150);
            float _1182 = _1088 + _1166;
            float _1184 = fma(_996, _1106, _1168);
            float _1186 = fma(_1002, _1106, _1170);
            float _1188 = fma(_1008, _1106, _1172);
            float _1190 = _1112 + _1174;
            uint _1192 = uint(int(uint(_964) >> uint(2)));
            _37[int(_1192)] = as_type<uint>(_1146);
            int _1194 = _964 + 4;
            uint _1196 = uint(int(uint(_1194) >> uint(2)));
            _37[int(_1196)] = as_type<uint>(_1132);
            int _1198 = _964 + 8;
            uint _1200 = uint(int(uint(_1198) >> uint(2)));
            _37[int(_1200)] = as_type<uint>(_1178);
            int _1202 = _964 + 12;
            uint _1204 = uint(int(uint(_1202) >> uint(2)));
            _37[int(_1204)] = as_type<uint>(_1138);
            int _1206 = _964 + 16;
            uint _1208 = uint(int(uint(_1206) >> uint(2)));
            _37[int(_1208)] = as_type<uint>(_1176);
            int _1210 = _964 + 20;
            uint _1212 = uint(int(uint(_1210) >> uint(2)));
            _37[int(_1212)] = as_type<uint>(_1152);
            int _1214 = _964 + 24;
            uint _1216 = uint(int(uint(_1214) >> uint(2)));
            _37[int(_1216)] = as_type<uint>(_1180);
            int _1218 = _964 + 28;
            uint _1220 = uint(int(uint(_1218) >> uint(2)));
            _37[int(_1220)] = as_type<uint>(_1182);
            int _1222 = _964 + 32;
            uint _1224 = uint(int(uint(_1222) >> uint(2)));
            _37[int(_1224)] = as_type<uint>(_1184);
            int _1226 = _964 + 36;
            uint _1228 = uint(int(uint(_1226) >> uint(2)));
            _37[int(_1228)] = as_type<uint>(_1186);
            int _1230 = _964 + 40;
            uint _1232 = uint(int(uint(_1230) >> uint(2)));
            _37[int(_1232)] = as_type<uint>(_1188);
            int _1234 = _964 + 44;
            uint _1236 = uint(int(uint(_1234) >> uint(2)));
            _37[int(_1236)] = as_type<uint>(_1190);
            _944 = !_966;
            _942 = _954;
        } while (_944);
    }
    if (!_74)
    {
        return;
    }
    int _1238 = 0;
    bool _1240;
    do
    {
        int _1242 = _1238;
        int _1244 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1246 = _1244 + _1242;
        int _1248 = _1242 * 112;
        int _1250 = _1246 * 48;
        int _1252 = _1248 + 80;
        uint _1254 = uint(int(uint(_1252) >> uint(2)));
        uint _1256 = uint(int(uint(int(_1254)) >> uint(2)));
        int _1258 = int(_1254) & 3;
        float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
        int _1262 = int(_1254) + 1;
        uint _1264 = uint(int(uint(_1262) >> uint(2)));
        int _1266 = _1262 & 3;
        float _1268 = (*spvDescriptorSet0.cp_c6)._m0[int(_1264)][_1266];
        uint _1270 = uint(int(uint(_1250) >> uint(2)));
        float _1272 = as_type<float>(_37[int(_1270)]);
        int _1274 = _1250 + 4;
        uint _1276 = uint(int(uint(_1274) >> uint(2)));
        float _1278 = as_type<float>(_37[int(_1276)]);
        int _1280 = _1250 + 8;
        uint _1282 = uint(int(uint(_1280) >> uint(2)));
        float _1284 = as_type<float>(_37[int(_1282)]);
        int _1286 = _1250 + 12;
        uint _1288 = uint(int(uint(_1286) >> uint(2)));
        float _1290 = as_type<float>(_37[int(_1288)]);
        int _1292 = _1250 + 16;
        uint _1294 = uint(int(uint(_1292) >> uint(2)));
        float _1296 = as_type<float>(_37[int(_1294)]);
        int _1298 = _1250 + 20;
        uint _1300 = uint(int(uint(_1298) >> uint(2)));
        float _1302 = as_type<float>(_37[int(_1300)]);
        int _1304 = _1250 + 24;
        uint _1306 = uint(int(uint(_1304) >> uint(2)));
        float _1308 = as_type<float>(_37[int(_1306)]);
        int _1310 = _1250 + 28;
        uint _1312 = uint(int(uint(_1310) >> uint(2)));
        float _1314 = as_type<float>(_37[int(_1312)]);
        int _1316 = _1248 + 88;
        uint _1318 = uint(int(uint(_1316) >> uint(2)));
        uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
        int _1322 = int(_1318) & 3;
        float _1324 = (*spvDescriptorSet0.cp_c6)._m0[int(_1320)][_1322];
        int _1326 = int(_1318) + 1;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        int _1330 = _1326 & 3;
        float _1332 = (*spvDescriptorSet0.cp_c6)._m0[int(_1328)][_1330];
        int _1334 = _1250 + 32;
        uint _1336 = uint(int(uint(_1334) >> uint(2)));
        float _1338 = as_type<float>(_37[int(_1336)]);
        int _1340 = _1250 + 36;
        uint _1342 = uint(int(uint(_1340) >> uint(2)));
        float _1344 = as_type<float>(_37[int(_1342)]);
        int _1346 = _1250 + 40;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        float _1350 = as_type<float>(_37[int(_1348)]);
        int _1352 = _1250 + 44;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        float _1356 = as_type<float>(_37[int(_1354)]);
        int _1358 = _1248 + 64;
        uint _1360 = uint(int(uint(_1358) >> uint(2)));
        uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
        int _1364 = int(_1360) & 3;
        float _1366 = (*spvDescriptorSet0.cp_c6)._m0[int(_1362)][_1364];
        int _1368 = int(_1360) + 1;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        int _1372 = _1368 & 3;
        float _1374 = (*spvDescriptorSet0.cp_c6)._m0[int(_1370)][_1372];
        int _1376 = _1248 + 72;
        uint _1378 = uint(int(uint(_1376) >> uint(2)));
        uint _1380 = uint(int(uint(int(_1378)) >> uint(2)));
        int _1382 = int(_1378) & 3;
        float _1384 = (*spvDescriptorSet0.cp_c6)._m0[int(_1380)][_1382];
        int _1386 = int(_1378) + 1;
        uint _1388 = uint(int(uint(_1386) >> uint(2)));
        int _1390 = _1386 & 3;
        float _1392 = (*spvDescriptorSet0.cp_c6)._m0[int(_1388)][_1390];
        int _1394 = _1248 + 104;
        uint _1396 = uint(int(uint(_1394) >> uint(2)));
        uint _1398 = uint(int(uint(int(_1396)) >> uint(2)));
        int _1400 = int(_1396) & 3;
        float _1402 = (*spvDescriptorSet0.cp_c6)._m0[int(_1398)][_1400];
        int _1404 = int(_1396) + 1;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        int _1408 = _1404 & 3;
        float _1410 = (*spvDescriptorSet0.cp_c6)._m0[int(_1406)][_1408];
        int _1412 = _1248 + 96;
        uint _1414 = uint(int(uint(_1412) >> uint(2)));
        uint _1416 = uint(int(uint(int(_1414)) >> uint(2)));
        int _1418 = int(_1414) & 3;
        float _1420 = (*spvDescriptorSet0.cp_c6)._m0[int(_1416)][_1418];
        int _1422 = int(_1414) + 1;
        uint _1424 = uint(int(uint(_1422) >> uint(2)));
        int _1426 = _1422 & 3;
        float _1428 = (*spvDescriptorSet0.cp_c6)._m0[int(_1424)][_1426];
        float _1430 = _1278 * _1260;
        float _1432 = _1278 * _1268;
        float _1434 = _1278 * _1324;
        float _1436 = _1278 * _1332;
        float _1438 = fma(_1272, _1366, _1430);
        float _1440 = fma(_1272, _1374, _1432);
        float _1442 = fma(_1272, _1384, _1434);
        float _1444 = fma(_1272, _1392, _1436);
        float _1446 = _1302 * _1260;
        float _1448 = _1302 * _1268;
        float _1450 = _1302 * _1324;
        float _1452 = _1302 * _1332;
        float _1454 = _1344 * _1260;
        float _1456 = fma(_1296, _1366, _1446);
        float _1458 = fma(_1296, _1374, _1448);
        float _1460 = fma(_1296, _1384, _1450);
        uint _1462 = uint(int(uint(_78) >> uint(2)));
        uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
        int _1466 = int(_1462) & 3;
        float _1468 = (*spvDescriptorSet0.cp_c4)._m0[int(_1464)][_1466];
        float _1470 = fma(_1296, _1392, _1452);
        float _1472 = _1344 * _1268;
        float _1474 = _1344 * _1324;
        float _1476 = _1344 * _1332;
        float _1478 = fma(_1338, _1366, _1454);
        float _1480 = fma(_1338, _1374, _1472);
        float _1482 = fma(_1338, _1384, _1474);
        int _1484 = _1248 + 16;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
        int _1490 = int(_1486) & 3;
        float _1492 = (*spvDescriptorSet0.cp_c6)._m0[int(_1488)][_1490];
        int _1494 = int(_1486) + 1;
        uint _1496 = uint(int(uint(_1494) >> uint(2)));
        int _1498 = _1494 & 3;
        float _1500 = (*spvDescriptorSet0.cp_c6)._m0[int(_1496)][_1498];
        float _1502 = fma(_1338, _1392, _1476);
        float _1504 = fma(_1308, _1410, _1470);
        float _1506 = fma(_1284, _1420, _1438);
        float _1508 = fma(_1284, _1428, _1440);
        float _1510 = fma(_1284, _1402, _1442);
        float _1512 = fma(_1284, _1410, _1444);
        float _1514 = fma(_1308, _1420, _1456);
        int _1516 = _1248 + 24;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
        int _1522 = int(_1518) & 3;
        float _1524 = (*spvDescriptorSet0.cp_c6)._m0[int(_1520)][_1522];
        int _1526 = int(_1518) + 1;
        uint _1528 = uint(int(uint(_1526) >> uint(2)));
        int _1530 = _1526 & 3;
        float _1532 = (*spvDescriptorSet0.cp_c6)._m0[int(_1528)][_1530];
        float _1534 = fma(_1308, _1428, _1458);
        float _1536 = fma(_1308, _1402, _1460);
        float _1538 = fma(_1350, _1420, _1478);
        float _1540 = fma(_1350, _1428, _1480);
        float _1542 = fma(_1350, _1410, _1502);
        float _1544 = fma(_1350, _1402, _1482);
        float _1546 = _1314 + _1504;
        int _1548 = _1248 + 32;
        uint _1550 = uint(int(uint(_1548) >> uint(2)));
        uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
        int _1554 = int(_1550) & 3;
        float _1556 = (*spvDescriptorSet0.cp_c6)._m0[int(_1552)][_1554];
        int _1558 = int(_1550) + 1;
        uint _1560 = uint(int(uint(_1558) >> uint(2)));
        int _1562 = _1558 & 3;
        float _1564 = (*spvDescriptorSet0.cp_c6)._m0[int(_1560)][_1562];
        float _1566 = _1356 + _1542;
        float _1568 = _1290 + _1512;
        int _1570 = _1248 + 48;
        uint _1572 = uint(int(uint(_1570) >> uint(2)));
        uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
        int _1576 = int(_1572) & 3;
        float _1578 = (*spvDescriptorSet0.cp_c6)._m0[int(_1574)][_1576];
        int _1580 = int(_1572) + 1;
        uint _1582 = uint(int(uint(_1580) >> uint(2)));
        int _1584 = _1580 & 3;
        float _1586 = (*spvDescriptorSet0.cp_c6)._m0[int(_1582)][_1584];
        float _1588 = _1514 * _1500;
        float _1590 = _1534 * _1500;
        float _1592 = _1546 * _1500;
        float _1594 = _1536 * _1500;
        float _1596 = fma(_1506, _1492, _1588);
        float _1598 = fma(_1508, _1492, _1590);
        float _1600 = fma(_1568, _1492, _1592);
        float _1602 = fma(_1510, _1492, _1594);
        int _1604 = _1248 + 40;
        uint _1606 = uint(int(uint(_1604) >> uint(2)));
        uint _1608 = uint(int(uint(int(_1606)) >> uint(2)));
        int _1610 = int(_1606) & 3;
        float _1612 = (*spvDescriptorSet0.cp_c6)._m0[int(_1608)][_1610];
        int _1614 = int(_1606) + 1;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        int _1618 = _1614 & 3;
        float _1620 = (*spvDescriptorSet0.cp_c6)._m0[int(_1616)][_1618];
        float _1622 = fma(_1538, _1524, _1596);
        float _1624 = fma(_1566, _1524, _1600);
        float _1626 = fma(_1540, _1524, _1598);
        float _1628 = fma(_1544, _1524, _1602);
        float _1630 = _1624 + _1532;
        float _1632 = _1546 * _1564;
        int _1634 = _1248 + 56;
        uint _1636 = uint(int(uint(_1634) >> uint(2)));
        uint _1638 = uint(int(uint(int(_1636)) >> uint(2)));
        int _1640 = int(_1636) & 3;
        float _1642 = (*spvDescriptorSet0.cp_c6)._m0[int(_1638)][_1640];
        int _1644 = int(_1636) + 1;
        uint _1646 = uint(int(uint(_1644) >> uint(2)));
        int _1648 = _1644 & 3;
        float _1650 = (*spvDescriptorSet0.cp_c6)._m0[int(_1646)][_1648];
        float _1652 = _1514 * _1564;
        float _1654 = _1534 * _1564;
        int _1656 = as_type<int>(_1468) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1658 = _1656 + _1242;
        int _1660 = _1242 + 1;
        float _1662 = _1536 * _1564;
        float _1664 = fma(_1568, _1556, _1632);
        float _1666 = _1546 * _1586;
        float _1668 = _1514 * _1586;
        float _1670 = _1534 * _1586;
        float _1672 = fma(_1508, _1556, _1654);
        float _1674 = _1536 * _1586;
        float _1676 = fma(_1568, _1578, _1666);
        float _1678 = fma(_1506, _1578, _1668);
        int _1680 = _1658 * 48;
        bool _1682 = uint(_1660) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1684 = fma(_1508, _1578, _1670);
        float _1686 = fma(_1506, _1556, _1652);
        float _1688 = fma(_1510, _1556, _1662);
        float _1690 = fma(_1566, _1612, _1664);
        float _1692 = fma(_1510, _1578, _1674);
        float _1694 = fma(_1540, _1612, _1672);
        float _1696 = fma(_1538, _1612, _1686);
        float _1698 = fma(_1544, _1612, _1688);
        float _1700 = fma(_1566, _1642, _1676);
        float _1702 = fma(_1538, _1642, _1678);
        float _1704 = fma(_1540, _1642, _1684);
        int _1706 = _1680 + 16;
        float _1708 = _1690 + _1620;
        int _1710 = _1680 + 32;
        float _1712 = fma(_1544, _1642, _1692);
        float _1714 = _1700 + _1650;
        int _1716 = _1680 + 48;
        uint _1718 = uint(int(uint(_1706) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1718)] = as_type<uint>(_1622);
        int _1720 = _1706 + 4;
        uint _1722 = uint(int(uint(_1720) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1722)] = as_type<uint>(_1626);
        int _1724 = _1706 + 8;
        uint _1726 = uint(int(uint(_1724) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1726)] = as_type<uint>(_1628);
        int _1728 = _1706 + 12;
        uint _1730 = uint(int(uint(_1728) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1730)] = as_type<uint>(_1630);
        uint _1732 = uint(int(uint(_1710) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1732)] = as_type<uint>(_1696);
        int _1734 = _1710 + 4;
        uint _1736 = uint(int(uint(_1734) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1736)] = as_type<uint>(_1694);
        int _1738 = _1710 + 8;
        uint _1740 = uint(int(uint(_1738) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1740)] = as_type<uint>(_1698);
        int _1742 = _1710 + 12;
        uint _1744 = uint(int(uint(_1742) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1744)] = as_type<uint>(_1708);
        uint _1746 = uint(int(uint(_1716) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1746)] = as_type<uint>(_1702);
        int _1748 = _1716 + 4;
        uint _1750 = uint(int(uint(_1748) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1750)] = as_type<uint>(_1704);
        int _1752 = _1716 + 8;
        uint _1754 = uint(int(uint(_1752) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1754)] = as_type<uint>(_1712);
        int _1756 = _1716 + 12;
        uint _1758 = uint(int(uint(_1756) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1758)] = as_type<uint>(_1714);
        _1240 = !_1682;
        _1238 = _1660;
    } while (_1240);
}

