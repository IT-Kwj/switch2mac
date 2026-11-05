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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4435, thread const int& _4436, constant _10& support_buffer)
{
    int _4439 = 1 + _4436;
    float _4441 = support_buffer._m5[_4439].x;
    bool _4443 = _4441 == 1.0;
    if (_4443)
    {
        return _4435;
    }
    float _4445 = float(_4435);
    float _4447 = _4445 * _4441;
    int _4449 = int(_4447);
    return _4449;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4123, thread const int& _4124, thread const int& _4125, thread const int& _4126, thread int& _4127, thread int& _4128, thread int& _4129, thread int& _4130, thread int& _4131, thread int& _4132)
{
    float _4135 = as_type<float>(_4124) + 0.0;
    bool _4137 = _4135 != 0.0;
    bool _4139 = isnan(_4135);
    bool _4141 = _4137 || _4139;
    bool _4143 = isnan(0.0);
    bool _4145 = _4141 || _4143;
    int _4147 = as_type<int>(_4135);
    int _4149 = _4124;
    int _4151 = _4126;
    int _4153 = _4145 ? (-1) : 0;
    if (!_4145)
    {
        float _4155 = as_type<float>(_4124) * 1.0;
        _4147 = as_type<int>(_4155);
    }
    int _4157 = _4147;
    bool _4159 = !_4145;
    int _4161 = _4157;
    if (!_4159)
    {
        float _4163 = as_type<float>(_4124) + 0.0;
        bool _4165 = _4163 >= 0.0;
        bool _4167 = isnan(_4163);
        bool _4169 = _4165 || _4167;
        bool _4171 = isnan(0.0);
        bool _4173 = _4169 || _4171;
        int _4175 = as_type<int>(_4163);
        _4153 = _4173 ? (-1) : 0;
        if (!_4173)
        {
            _4175 = 2147483647;
        }
        int _4177 = _4175;
        bool _4179 = !_4173;
        _4161 = _4177;
        if (!_4179)
        {
            float _4181 = as_type<float>(_4124) + 0.0;
            bool _4183 = _4181 > as_type<float>(0x7f800000u /* inf */);
            bool _4185 = isnan(_4181);
            bool _4187 = _4183 || _4185;
            bool _4189 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4191 = _4187 || _4189;
            int _4193 = as_type<int>(_4181);
            _4153 = _4191 ? (-1) : 0;
            if (_4191)
            {
                float _4195 = as_type<float>(_4124) + 1.0;
                _4193 = as_type<int>(_4195);
            }
            int _4197 = _4193;
            _4161 = _4197;
            if (!_4191)
            {
                float _4199 = 0.0 + as_type<float>(_4124);
                bool _4201 = _4199 != as_type<float>(0x7f800000u /* inf */);
                bool _4203 = isnan(_4199);
                bool _4205 = _4201 || _4203;
                bool _4207 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4209 = _4205 || _4207;
                int _4211 = as_type<int>(_4199);
                _4153 = _4209 ? (-1) : 0;
                if (!_4209)
                {
                    _4211 = _4124;
                }
                int _4213 = _4211;
                bool _4215 = !_4209;
                _4161 = _4213;
                if (!_4215)
                {
                    float _4217 = as_type<float>(_4124) * 18446744073709551616.0;
                    float _4219 = rsqrt(_4217);
                    float _4221 = _4217 * _4219;
                    float _4223 = _4219 * 0.5;
                    float _4225 = -_4221;
                    float _4227 = 0.0 + _4225;
                    float _4229 = fma(_4223, _4227, 0.5);
                    float _4231 = fma(_4221, _4229, _4221);
                    float _4233 = -_4231;
                    float _4235 = 0.0 + _4233;
                    float _4237 = fma(_4231, _4235, _4217);
                    float _4239 = fma(_4223, _4237, _4231);
                    float _4241 = _4239 * 2.3283064365386962890625e-10;
                    _4161 = as_type<int>(_4241);
                    _4149 = as_type<int>(_4217);
                    _4151 = as_type<int>(_4231);
                }
            }
        }
    }
    int _4243 = _4161;
    int _4245 = _4149;
    int _4247 = _4151;
    int _4249 = _4153;
    _4127 = _4243;
    _4128 = _4125;
    _4129 = 0;
    _4130 = _4245;
    _4131 = _4247;
    _4132 = _4249;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1188 = false;
    bool _470 = false;
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
    int _115 = _58(_111, _113, (*spvDescriptorSet0.support_buffer));
    int _117 = as_type<int>(_83);
    int _119 = 0;
    int _121 = _58(_117, _119, (*spvDescriptorSet0.support_buffer));
    int3 _1742 = int3(_115, _121, 1);
    float4 _124 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1742.xy), uint(_1742.z), 0).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    int _134 = _68;
    int _136 = 0;
    int _138 = _58(_134, _136, (*spvDescriptorSet0.support_buffer));
    int _140 = as_type<int>(_91);
    int _142 = 0;
    int _144 = _58(_140, _142, (*spvDescriptorSet0.support_buffer));
    int3 _1762 = int3(_138, _144, 1);
    float4 _146 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1762.xy), uint(_1762.z), 0).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    int _156 = _68;
    int _158 = 0;
    int _160 = _58(_156, _158, (*spvDescriptorSet0.support_buffer));
    int _162 = as_type<int>(_83);
    int _164 = 0;
    int _166 = _58(_162, _164, (*spvDescriptorSet0.support_buffer));
    int3 _1782 = int3(_160, _166, 0);
    float3 _170 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1782.xy), uint(_1782.z), 0).xyz;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    int _178 = _68;
    int _180 = 0;
    int _182 = _58(_178, _180, (*spvDescriptorSet0.support_buffer));
    int _184 = as_type<int>(_91);
    int _186 = 0;
    int _188 = _58(_184, _186, (*spvDescriptorSet0.support_buffer));
    int3 _1800 = int3(_182, _188, 0);
    float3 _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1800.xy), uint(_1800.z), 0).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    int _198 = _68;
    int _200 = 1;
    int _202 = _58(_198, _200, (*spvDescriptorSet0.support_buffer));
    int _204 = as_type<int>(_101);
    int _206 = 1;
    int _208 = _58(_204, _206, (*spvDescriptorSet0.support_buffer));
    int3 _1818 = int3(_202, _208, 1);
    float4 _210 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1818.xy), uint(_1818.z), 0).xyzw;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    float _218 = _210.w;
    int _220 = _68;
    int _222 = 1;
    int _224 = _58(_220, _222, (*spvDescriptorSet0.support_buffer));
    int _226 = as_type<int>(_109);
    int _228 = 1;
    int _230 = _58(_226, _228, (*spvDescriptorSet0.support_buffer));
    int3 _1838 = int3(_224, _230, 1);
    float4 _232 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1838.xy), uint(_1838.z), 0).xyzw;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = _232.z;
    float _240 = _232.w;
    int _242 = _68;
    int _244 = 0;
    int _246 = _58(_242, _244, (*spvDescriptorSet0.support_buffer));
    int _248 = as_type<int>(_83);
    int _250 = 0;
    int _252 = _58(_248, _250, (*spvDescriptorSet0.support_buffer));
    int3 _1858 = int3(_246, _252, 2);
    float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1858.xy), uint(_1858.z), 0).xyz;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    int _262 = _68;
    int _264 = 0;
    int _266 = _58(_262, _264, (*spvDescriptorSet0.support_buffer));
    int _268 = as_type<int>(_91);
    int _270 = 0;
    int _272 = _58(_268, _270, (*spvDescriptorSet0.support_buffer));
    int3 _1876 = int3(_266, _272, 2);
    float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1876.xy), uint(_1876.z), 0).xyz;
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
    float _302 = -_126;
    float _304 = _302 + _148;
    float _306 = -_128;
    float _308 = _306 + _150;
    float _310 = -_174;
    float _312 = _310 + _194;
    float _314 = -_130;
    float _316 = _314 + _152;
    float _318 = -_132;
    float _320 = _318 + _154;
    float _322 = fma(_308, _290, _128);
    float _324 = -_172;
    float _326 = _324 + _192;
    float _328 = fma(_312, _290, _174);
    float _330 = -_214;
    float _332 = _330 + _236;
    float _334 = fma(_316, _290, _130);
    float _336 = fma(_326, _290, _172);
    float _338 = -_212;
    float _340 = _338 + _234;
    float _342 = fma(_332, _300, _214);
    float _344 = fma(_304, _290, _126);
    float _346 = -_216;
    float _348 = _346 + _238;
    float _350 = fma(_340, _300, _212);
    float _352 = _322 * _342;
    float _354 = -_218;
    float _356 = _354 + _240;
    float _358 = fma(_348, _300, _216);
    float _360 = fma(_320, _290, _132);
    float _362 = fma(_344, _350, _352);
    float _364 = fma(_356, _300, _218);
    float _366 = -_176;
    float _368 = _366 + _196;
    float _370 = fma(_334, _358, _362);
    float _372 = fma(_368, _290, _176);
    float _374 = fma(_360, _364, _370);
    float _376 = precise::max(_374, -1.0);
    float _378 = precise::min(_376, 1.0);
    bool _380 = _378 >= 0.0;
    bool _382 = isnan(_378);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    bool _390 = !_388;
    float _392 = -_378;
    float _394 = _390 ? _392 : _378;
    float _396 = -_256;
    float _398 = _396 + _276;
    float _400 = -_260;
    float _402 = _400 + _280;
    bool _404 = _394 < 0.0;
    float _406 = float(_404);
    float _408 = abs(_394);
    float _410 = -_408;
    float _412 = _410 + 1.0;
    float _414 = abs(_394);
    float _416 = fma(_414, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _418 = fma(_398, _290, _256);
    float _420 = fma(_402, _290, _260);
    int _422 = as_type<int>(_412) + (-218103808);
    float _424 = abs(_394);
    float _426 = fma(_424, _416, -0.212114393711090087890625);
    bool _428 = uint(_422) >= 1920991232u;
    float _430 = -_258;
    float _432 = _430 + _278;
    float _434 = abs(_394);
    float _436 = fma(_434, _426, 1.570728778839111328125);
    float _438 = fma(_432, _290, _258);
    bool _440 = !_428;
    float _442 = _438;
    float _444 = _418;
    float _466;
    float _468;
    if (!_440)
    {
        int _446 = as_type<int>(_394);
        int _448 = as_type<int>(_412);
        int _450 = 1248;
        int _452 = as_type<int>(_278);
        int _454;
        int _456;
        int _458;
        int _460;
        int _462;
        int _464;
        _56(_446, _448, _450, _452, _454, _456, _458, _460, _462, _464);
        _466 = as_type<float>(_454);
        _468 = as_type<float>(_456);
        _470 = true;
    }
    else
    {
        float _472 = rsqrt(_412);
        float _474 = _412 * _472;
        float _476 = _472 * 0.5;
        float _478 = -_474;
        float _480 = 0.0 + _478;
        float _482 = fma(_476, _480, 0.5);
        float _484 = fma(_474, _482, _474);
        float _486 = -_484;
        float _488 = 0.0 + _486;
        float _490 = fma(_484, _488, _412);
        float _492 = fma(_476, _490, _484);
        _466 = _492;
        _468 = _480;
    }
    _470 = false;
    float _494 = _466;
    float _496 = _468;
    int _498 = _74 + 8;
    uint _500 = uint(int(uint(_498) >> uint(2)));
    uint _502 = uint(int(uint(int(_500)) >> uint(2)));
    int _504 = int(_500) & 3;
    float _506 = (*spvDescriptorSet0.cp_c5)._m0[int(_502)][_504];
    int _508 = int(_500) + 1;
    uint _510 = uint(int(uint(_508) >> uint(2)));
    int _512 = _508 & 3;
    float _514 = (*spvDescriptorSet0.cp_c5)._m0[int(_510)][_512];
    int _516 = _68;
    int _518 = 1;
    int _520 = _58(_516, _518, (*spvDescriptorSet0.support_buffer));
    int _522 = as_type<int>(_506);
    int _524 = 1;
    int _526 = _58(_522, _524, (*spvDescriptorSet0.support_buffer));
    int3 _2221 = int3(_520, _526, 0);
    float3 _528 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2221.xy), uint(_2221.z), 0).xyz;
    float _530 = _528.x;
    float _532 = _528.y;
    float _534 = _528.z;
    int _536 = _68;
    int _538 = 1;
    int _540 = _58(_536, _538, (*spvDescriptorSet0.support_buffer));
    int _542 = as_type<int>(_506);
    int _544 = 1;
    int _546 = _58(_542, _544, (*spvDescriptorSet0.support_buffer));
    int3 _2239 = int3(_540, _546, 2);
    float3 _548 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2239.xy), uint(_2239.z), 0).xyz;
    float _550 = _548.x;
    float _552 = _548.y;
    float _554 = _548.z;
    int _556 = _68;
    int _558 = 1;
    int _560 = _58(_556, _558, (*spvDescriptorSet0.support_buffer));
    int _562 = as_type<int>(_514);
    int _564 = 1;
    int _566 = _58(_562, _564, (*spvDescriptorSet0.support_buffer));
    int3 _2257 = int3(_560, _566, 0);
    float3 _568 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2257.xy), uint(_2257.z), 0).xyz;
    float _570 = _568.x;
    float _572 = _568.y;
    float _574 = _568.z;
    int _576 = _68;
    int _578 = 1;
    int _580 = _58(_576, _578, (*spvDescriptorSet0.support_buffer));
    int _582 = as_type<int>(_514);
    int _584 = 1;
    int _586 = _58(_582, _584, (*spvDescriptorSet0.support_buffer));
    int3 _2275 = int3(_580, _586, 2);
    float3 _588 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2275.xy), uint(_2275.z), 0).xyz;
    float _590 = _588.x;
    float _592 = _588.y;
    float _594 = _588.z;
    float _596 = _436 * _494;
    float _598 = _406 * 2.0;
    float _600 = -_598;
    float _602 = fma(_596, _600, _596);
    float _604 = fma(_406, 3.1415927410125732421875, _602);
    float _606 = _604 * 0.15915493667125701904296875;
    float _608 = _606 * 6.283185482025146484375;
    float _610 = sin(_608);
    float _612 = abs(_610);
    bool _614 = _612 >= 0.001000000047497451305389404296875;
    bool _616 = isnan(_612);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.001000000047497451305389404296875);
    bool _622 = _618 || _620;
    float _624 = _260;
    float _626 = _496;
    float _628 = _596;
    if (!_622)
    {
        int _630 = _74 + 28;
        uint _632 = uint(int(uint(_630) >> uint(2)));
        uint _634 = uint(int(uint(int(_632)) >> uint(2)));
        int _636 = int(_632) & 3;
        float _638 = (*spvDescriptorSet0.cp_c5)._m0[int(_634)][_636];
        _624 = _638;
    }
    float _640 = _624;
    float _642 = _640;
    if (!_622)
    {
        float _644 = -_640;
        float _646 = _644 + 1.0;
        _626 = _646;
    }
    float _648 = _626;
    float _650 = _648;
    if (!_622)
    {
        _628 = _640;
    }
    float _652 = _628;
    bool _654 = !_622;
    float _656 = _652;
    float _658 = _554;
    if (!_654)
    {
        int _660 = _74 + 28;
        uint _662 = uint(int(uint(_660) >> uint(2)));
        uint _664 = uint(int(uint(int(_662)) >> uint(2)));
        int _666 = int(_662) & 3;
        float _668 = (*spvDescriptorSet0.cp_c5)._m0[int(_664)][_666];
        float _670 = 1.0 / _610;
        float _672 = _604 * _668;
        float _674 = _672 * 0.15915493667125701904296875;
        float _676 = -_672;
        float _678 = _604 + _676;
        float _680 = _678 * 0.15915493667125701904296875;
        float _682 = _674 * 6.283185482025146484375;
        float _684 = sin(_682);
        float _686 = _680 * 6.283185482025146484375;
        float _688 = sin(_686);
        float _690 = _684 * _670;
        float _692 = _688 * _670;
        _656 = _690;
        _650 = _692;
        _642 = _668;
    }
    float _694 = _656;
    float _696 = _650;
    float _698 = _642;
    bool _700 = !_388;
    float _702 = -_694;
    float _704 = _700 ? _702 : _694;
    int _706 = _74 + 24;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    uint _710 = uint(int(uint(int(_708)) >> uint(2)));
    int _712 = int(_708) & 3;
    float _714 = (*spvDescriptorSet0.cp_c5)._m0[int(_710)][_712];
    float _716 = -_530;
    float _718 = _716 + _570;
    float _720 = -_534;
    float _722 = _720 + _574;
    float _724 = -_554;
    float _726 = _724 + _594;
    float _728 = _364 * _704;
    float _730 = _350 * _704;
    float _732 = _358 * _704;
    float _734 = _342 * _704;
    float _736 = fma(_360, _696, _728);
    int _738 = _74 + 20;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    uint _742 = uint(int(uint(int(_740)) >> uint(2)));
    int _744 = int(_740) & 3;
    float _746 = (*spvDescriptorSet0.cp_c5)._m0[int(_742)][_744];
    float _748 = fma(_344, _696, _730);
    float _750 = fma(_334, _696, _732);
    float _752 = _736 * 2.0;
    float _754 = fma(_322, _696, _734);
    float _756 = _748 * 2.0;
    bool _758 = _68 != 0;
    float _760 = _750 * _752;
    float _762 = _754 * _752;
    float _764 = _754 * 2.0;
    float _766 = _748 * _752;
    float _768 = -_760;
    float _770 = fma(_754, _756, _768);
    float _772 = fma(_750, _756, _762);
    float _774 = fma(_754, _756, _760);
    float _776 = -_762;
    float _778 = fma(_750, _756, _776);
    float _780 = _748 * _748;
    float _782 = _754 * _754;
    float _784 = -_532;
    float _786 = _784 + _572;
    float _788 = -_766;
    float _790 = fma(_750, _764, _788);
    float _792 = fma(_750, _764, _766);
    float _794 = fma(_780, -2.0, 1.0);
    float _796 = fma(_718, _714, _530);
    float _798 = _750 * _750;
    float _800 = fma(_782, -2.0, 1.0);
    float _802 = fma(_786, _714, _532);
    float _804 = fma(_722, _714, _534);
    float _806 = _796 * _698;
    float _808 = fma(_798, -2.0, _800);
    float _810 = _802 * _698;
    float _812 = fma(_798, -2.0, _794);
    float _814 = fma(_782, -2.0, _794);
    float _816 = -_550;
    float _818 = _816 + _590;
    float _820 = -_552;
    float _822 = _820 + _592;
    float _824 = _804 * _698;
    float _826 = fma(_336, _746, _806);
    float _828 = fma(_328, _746, _810);
    float _830 = fma(_818, _714, _550);
    float _832 = fma(_822, _714, _552);
    float _834 = fma(_726, _714, _554);
    float _836 = fma(_372, _746, _824);
    float _838 = _774 * _826;
    float _840 = _808 * _826;
    float _842 = _770 * _828;
    float _844 = _812 * _828;
    float _846 = _778 * _826;
    float _848 = _792 * _828;
    float _850 = _830 * _698;
    float _852 = _832 * _698;
    float _854 = _834 * _698;
    float _856 = _772 * _836;
    float _858 = _790 * _836;
    float _860 = _814 * _836;
    float _862 = fma(_418, _746, _850);
    int _864 = _68 * 48;
    float _866 = fma(_438, _746, _852);
    float _868 = fma(_420, _746, _854);
    int _870 = _68 * 112;
    uint _872 = uint(int(uint(_864) >> uint(2)));
    _37[int(_872)] = as_type<uint>(_840);
    int _874 = _864 + 4;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    _37[int(_876)] = as_type<uint>(_842);
    int _878 = _864 + 8;
    uint _880 = uint(int(uint(_878) >> uint(2)));
    _37[int(_880)] = as_type<uint>(_856);
    int _882 = _864 + 12;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    _37[int(_884)] = as_type<uint>(_862);
    float _886 = _806;
    float _888 = _854;
    float _890 = _852;
    float _892 = _698;
    float _894 = _808;
    float _896 = _848;
    float _898 = _846;
    float _900 = _858;
    float _902 = _860;
    if (!_758)
    {
        _886 = _862;
    }
    float _904 = _886;
    float _906 = _904;
    if (!_758)
    {
        _888 = _866;
    }
    float _908 = _888;
    int _910 = _864 + 16;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    _37[int(_912)] = as_type<uint>(_838);
    int _914 = _864 + 20;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    _37[int(_916)] = as_type<uint>(_844);
    int _918 = _864 + 24;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    _37[int(_920)] = as_type<uint>(_858);
    int _922 = _864 + 28;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    _37[int(_924)] = as_type<uint>(_866);
    float _926 = _908;
    if (!_758)
    {
        _890 = _868;
    }
    float _928 = _890;
    float _930 = _928;
    if (!_758)
    {
        _892 = _840;
    }
    float _932 = _892;
    int _934 = _864 + 32;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    _37[int(_936)] = as_type<uint>(_846);
    int _938 = _864 + 36;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    _37[int(_940)] = as_type<uint>(_848);
    int _942 = _864 + 40;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    _37[int(_944)] = as_type<uint>(_860);
    int _946 = _864 + 44;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    _37[int(_948)] = as_type<uint>(_868);
    float _950 = _932;
    if (!_758)
    {
        _442 = _842;
    }
    float _952 = _442;
    float _954 = _952;
    if (!_758)
    {
        _444 = _856;
    }
    float _956 = _444;
    float _958 = _956;
    if (!_758)
    {
        _658 = _838;
    }
    float _960 = _658;
    float _962 = _960;
    if (!_758)
    {
        _894 = _844;
    }
    float _964 = _894;
    bool _966 = !_758;
    float _968 = _964;
    if (!_966)
    {
        bool _970 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _972 = !_970;
        if (!_972)
        {
            uint _974 = uint(int(uint(_870) >> uint(2)));
            uint _976 = uint(int(uint(int(_974)) >> uint(2)));
            int _978 = int(_974) & 3;
            float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
            int _982 = as_type<int>(_980) * 48;
            int _984 = 0;
            bool _986;
            float _1082;
            float _1084;
            float _1086;
            float _1094;
            float _1106;
            float _1108;
            float _1112;
            float _1132;
            float _1134;
            float _1136;
            float _1138;
            float _1140;
            do
            {
                int _988 = _984;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _990 = uint(int(uint(_982) >> uint(2)));
                float _992 = as_type<float>(_37[int(_990)]);
                int _994 = _982 + 4;
                uint _996 = uint(int(uint(_994) >> uint(2)));
                float _998 = as_type<float>(_37[int(_996)]);
                int _1000 = _982 + 8;
                uint _1002 = uint(int(uint(_1000) >> uint(2)));
                float _1004 = as_type<float>(_37[int(_1002)]);
                int _1006 = _982 + 12;
                uint _1008 = uint(int(uint(_1006) >> uint(2)));
                float _1010 = as_type<float>(_37[int(_1008)]);
                int _1012 = _988 + 1;
                int _1014 = _982 + 16;
                uint _1016 = uint(int(uint(_1014) >> uint(2)));
                float _1018 = as_type<float>(_37[int(_1016)]);
                int _1020 = _982 + 20;
                uint _1022 = uint(int(uint(_1020) >> uint(2)));
                float _1024 = as_type<float>(_37[int(_1022)]);
                int _1026 = _982 + 24;
                uint _1028 = uint(int(uint(_1026) >> uint(2)));
                float _1030 = as_type<float>(_37[int(_1028)]);
                int _1032 = _982 + 28;
                uint _1034 = uint(int(uint(_1032) >> uint(2)));
                float _1036 = as_type<float>(_37[int(_1034)]);
                bool _1038 = uint(_1012) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1040 = _982 + 32;
                uint _1042 = uint(int(uint(_1040) >> uint(2)));
                float _1044 = as_type<float>(_37[int(_1042)]);
                int _1046 = _982 + 36;
                uint _1048 = uint(int(uint(_1046) >> uint(2)));
                float _1050 = as_type<float>(_37[int(_1048)]);
                int _1052 = _982 + 40;
                uint _1054 = uint(int(uint(_1052) >> uint(2)));
                float _1056 = as_type<float>(_37[int(_1054)]);
                int _1058 = _982 + 44;
                uint _1060 = uint(int(uint(_1058) >> uint(2)));
                float _1062 = as_type<float>(_37[int(_1060)]);
                float _1064 = _866 * _998;
                float _1066 = _838 * _998;
                float _1068 = _844 * _998;
                float _1070 = _858 * _998;
                float _1072 = fma(_862, _992, _1064);
                float _1074 = fma(_840, _992, _1066);
                float _1076 = fma(_842, _992, _1068);
                float _1078 = fma(_856, _992, _1070);
                float _1080 = fma(_868, _1004, _1072);
                _1082 = fma(_846, _1004, _1074);
                _1084 = fma(_848, _1004, _1076);
                _1086 = fma(_860, _1004, _1078);
                float _1088 = _866 * _1024;
                float _1090 = _838 * _1024;
                float _1092 = _844 * _1024;
                _1094 = _1010 + _1080;
                float _1096 = fma(_862, _1018, _1088);
                float _1098 = fma(_840, _1018, _1090);
                float _1100 = fma(_842, _1018, _1092);
                float _1102 = _858 * _1024;
                float _1104 = fma(_868, _1030, _1096);
                _1106 = fma(_846, _1030, _1098);
                _1108 = fma(_848, _1030, _1100);
                float _1110 = _838 * _1050;
                _1112 = _1036 + _1104;
                float _1114 = _866 * _1050;
                float _1116 = _844 * _1050;
                float _1118 = _858 * _1050;
                float _1120 = fma(_856, _1018, _1102);
                float _1122 = fma(_862, _1044, _1114);
                float _1124 = fma(_840, _1044, _1110);
                float _1126 = fma(_842, _1044, _1116);
                float _1128 = fma(_856, _1044, _1118);
                float _1130 = fma(_868, _1056, _1122);
                _1132 = fma(_860, _1030, _1120);
                _1134 = fma(_846, _1056, _1124);
                _1136 = fma(_848, _1056, _1126);
                _1138 = fma(_860, _1056, _1128);
                _1140 = _1062 + _1130;
                uint _1142 = uint(int(uint(_864) >> uint(2)));
                _37[int(_1142)] = as_type<uint>(_1082);
                int _1144 = _864 + 4;
                uint _1146 = uint(int(uint(_1144) >> uint(2)));
                _37[int(_1146)] = as_type<uint>(_1084);
                int _1148 = _864 + 8;
                uint _1150 = uint(int(uint(_1148) >> uint(2)));
                _37[int(_1150)] = as_type<uint>(_1086);
                int _1152 = _864 + 12;
                uint _1154 = uint(int(uint(_1152) >> uint(2)));
                _37[int(_1154)] = as_type<uint>(_1094);
                int _1156 = _864 + 16;
                uint _1158 = uint(int(uint(_1156) >> uint(2)));
                _37[int(_1158)] = as_type<uint>(_1106);
                int _1160 = _864 + 20;
                uint _1162 = uint(int(uint(_1160) >> uint(2)));
                _37[int(_1162)] = as_type<uint>(_1108);
                int _1164 = _864 + 24;
                uint _1166 = uint(int(uint(_1164) >> uint(2)));
                _37[int(_1166)] = as_type<uint>(_1132);
                int _1168 = _864 + 28;
                uint _1170 = uint(int(uint(_1168) >> uint(2)));
                _37[int(_1170)] = as_type<uint>(_1112);
                int _1172 = _864 + 32;
                uint _1174 = uint(int(uint(_1172) >> uint(2)));
                _37[int(_1174)] = as_type<uint>(_1134);
                int _1176 = _864 + 36;
                uint _1178 = uint(int(uint(_1176) >> uint(2)));
                _37[int(_1178)] = as_type<uint>(_1136);
                int _1180 = _864 + 40;
                uint _1182 = uint(int(uint(_1180) >> uint(2)));
                _37[int(_1182)] = as_type<uint>(_1138);
                int _1184 = _864 + 44;
                uint _1186 = uint(int(uint(_1184) >> uint(2)));
                _37[int(_1186)] = as_type<uint>(_1140);
                _986 = !_1038;
                _984 = _1012;
            } while (_986);
            _968 = _1108;
            _896 = _1136;
            _954 = _1084;
            _962 = _1106;
            _898 = _1134;
            _950 = _1082;
            _900 = _1132;
            _958 = _1086;
            _902 = _1138;
            _926 = _1112;
            _906 = _1094;
            _930 = _1140;
            _1188 = true;
        }
        else
        {
            _968 = 0.0;
            _896 = 0.0;
            _954 = 0.0;
            _962 = 0.0;
            _898 = 0.0;
            _950 = 0.0;
            _900 = 0.0;
            _958 = 0.0;
            _902 = 0.0;
            _926 = 0.0;
            _906 = 0.0;
            _930 = 0.0;
        }
    }
    _1188 = false;
    float _1190 = _968;
    float _1192 = _896;
    float _1194 = _954;
    float _1196 = _962;
    float _1198 = _898;
    float _1200 = _950;
    float _1202 = _900;
    float _1204 = _958;
    float _1206 = _902;
    float _1208 = _926;
    float _1210 = _906;
    float _1212 = _930;
    int _1214 = _870 + 80;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
    int _1220 = int(_1216) & 3;
    float _1222 = (*spvDescriptorSet0.cp_c6)._m0[int(_1218)][_1220];
    int _1224 = int(_1216) + 1;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    int _1228 = _1224 & 3;
    float _1230 = (*spvDescriptorSet0.cp_c6)._m0[int(_1226)][_1228];
    int _1232 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1234 = _1232 + _68;
    int _1236 = _870 + 64;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.cp_c6)._m0[int(_1248)][_1250];
    int _1254 = _1234 * 48;
    int _1256 = _870 + 88;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
    int _1262 = int(_1258) & 3;
    float _1264 = (*spvDescriptorSet0.cp_c6)._m0[int(_1260)][_1262];
    int _1266 = int(_1258) + 1;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    int _1270 = _1266 & 3;
    float _1272 = (*spvDescriptorSet0.cp_c6)._m0[int(_1268)][_1270];
    int _1274 = _870 + 72;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.cp_c6)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.cp_c6)._m0[int(_1286)][_1288];
    int _1292 = _870 + 96;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.cp_c6)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.cp_c6)._m0[int(_1304)][_1306];
    int _1310 = _870 + 104;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    uint _1314 = uint(int(uint(int(_1312)) >> uint(2)));
    int _1316 = int(_1312) & 3;
    float _1318 = (*spvDescriptorSet0.cp_c6)._m0[int(_1314)][_1316];
    int _1320 = int(_1312) + 1;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    int _1324 = _1320 & 3;
    float _1326 = (*spvDescriptorSet0.cp_c6)._m0[int(_1322)][_1324];
    float _1328 = _1190 * _1222;
    float _1330 = _1192 * _1222;
    int _1332 = _870 + 16;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.cp_c6)._m0[int(_1344)][_1346];
    float _1350 = _1194 * _1222;
    float _1352 = fma(_1196, _1244, _1328);
    float _1354 = fma(_1198, _1244, _1330);
    float _1356 = _1194 * _1230;
    float _1358 = _1190 * _1230;
    float _1360 = _1192 * _1230;
    int _1362 = _870 + 32;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    uint _1366 = uint(int(uint(int(_1364)) >> uint(2)));
    int _1368 = int(_1364) & 3;
    float _1370 = (*spvDescriptorSet0.cp_c6)._m0[int(_1366)][_1368];
    int _1372 = int(_1364) + 1;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    int _1376 = _1372 & 3;
    float _1378 = (*spvDescriptorSet0.cp_c6)._m0[int(_1374)][_1376];
    float _1380 = fma(_1200, _1252, _1356);
    float _1382 = fma(_1196, _1252, _1358);
    float _1384 = fma(_1198, _1252, _1360);
    float _1386 = _1194 * _1264;
    float _1388 = _1194 * _1272;
    float _1390 = _1190 * _1264;
    float _1392 = _1192 * _1264;
    int _1394 = _870 + 48;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    uint _1398 = uint(int(uint(int(_1396)) >> uint(2)));
    int _1400 = int(_1396) & 3;
    float _1402 = (*spvDescriptorSet0.cp_c6)._m0[int(_1398)][_1400];
    int _1404 = int(_1396) + 1;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    int _1408 = _1404 & 3;
    float _1410 = (*spvDescriptorSet0.cp_c6)._m0[int(_1406)][_1408];
    float _1412 = _1190 * _1272;
    float _1414 = _1192 * _1272;
    float _1416 = fma(_1196, _1282, _1390);
    float _1418 = fma(_1200, _1282, _1386);
    float _1420 = fma(_1200, _1290, _1388);
    float _1422 = fma(_1196, _1290, _1412);
    float _1424 = fma(_1198, _1282, _1392);
    int _1426 = _870 + 24;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.cp_c6)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.cp_c6)._m0[int(_1438)][_1440];
    float _1444 = fma(_1198, _1290, _1414);
    float _1446 = fma(_1200, _1244, _1350);
    float _1448 = fma(_1202, _1300, _1352);
    float _1450 = fma(_1204, _1308, _1380);
    float _1452 = fma(_1202, _1308, _1382);
    float _1454 = fma(_1206, _1300, _1354);
    float _1456 = fma(_1206, _1308, _1384);
    int _1458 = _870 + 40;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    uint _1462 = uint(int(uint(int(_1460)) >> uint(2)));
    int _1464 = int(_1460) & 3;
    float _1466 = (*spvDescriptorSet0.cp_c6)._m0[int(_1462)][_1464];
    int _1468 = int(_1460) + 1;
    uint _1470 = uint(int(uint(_1468) >> uint(2)));
    int _1472 = _1468 & 3;
    float _1474 = (*spvDescriptorSet0.cp_c6)._m0[int(_1470)][_1472];
    float _1476 = fma(_1204, _1300, _1446);
    float _1478 = fma(_1202, _1326, _1422);
    float _1480 = fma(_1204, _1326, _1420);
    float _1482 = fma(_1206, _1326, _1444);
    float _1484 = fma(_1206, _1318, _1424);
    float _1486 = _1478 + _1208;
    int _1488 = _870 + 56;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
    int _1494 = int(_1490) & 3;
    float _1496 = (*spvDescriptorSet0.cp_c6)._m0[int(_1492)][_1494];
    int _1498 = int(_1490) + 1;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    int _1502 = _1498 & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    float _1506 = fma(_1202, _1318, _1416);
    float _1508 = _1480 + _1210;
    float _1510 = fma(_1204, _1318, _1418);
    float _1512 = _1482 + _1212;
    float _1514 = _1486 * _1348;
    float _1516 = _1452 * _1348;
    float _1518 = _1448 * _1348;
    float _1520 = _1506 * _1348;
    float _1522 = fma(_1508, _1340, _1514);
    float _1524 = fma(_1450, _1340, _1516);
    float _1526 = fma(_1476, _1340, _1518);
    float _1528 = fma(_1510, _1340, _1520);
    float _1530 = _1486 * _1378;
    float _1532 = _1452 * _1378;
    float _1534 = _1448 * _1378;
    float _1536 = _1506 * _1378;
    float _1538 = fma(_1508, _1370, _1530);
    float _1540 = fma(_1450, _1370, _1532);
    float _1542 = fma(_1476, _1370, _1534);
    float _1544 = fma(_1510, _1370, _1536);
    float _1546 = _1486 * _1410;
    float _1548 = _1452 * _1410;
    float _1550 = _1448 * _1410;
    float _1552 = _1506 * _1410;
    float _1554 = fma(_1508, _1402, _1546);
    float _1556 = fma(_1450, _1402, _1548);
    float _1558 = fma(_1476, _1402, _1550);
    float _1560 = fma(_1510, _1402, _1552);
    float _1562 = fma(_1512, _1434, _1522);
    float _1564 = fma(_1456, _1434, _1524);
    float _1566 = fma(_1454, _1434, _1526);
    float _1568 = fma(_1484, _1434, _1528);
    float _1570 = _1562 + _1442;
    float _1572 = fma(_1512, _1466, _1538);
    float _1574 = fma(_1456, _1466, _1540);
    float _1576 = fma(_1454, _1466, _1542);
    float _1578 = fma(_1484, _1466, _1544);
    float _1580 = _1572 + _1474;
    float _1582 = fma(_1512, _1496, _1554);
    float _1584 = fma(_1456, _1496, _1556);
    int _1586 = _1254 + 16;
    float _1588 = fma(_1454, _1496, _1558);
    int _1590 = _1254 + 32;
    float _1592 = fma(_1484, _1496, _1560);
    float _1594 = _1582 + _1504;
    int _1596 = _1254 + 48;
    uint _1598 = uint(int(uint(_1586) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1598)] = as_type<uint>(_1566);
    int _1600 = _1586 + 4;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1602)] = as_type<uint>(_1564);
    int _1604 = _1586 + 8;
    uint _1606 = uint(int(uint(_1604) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1606)] = as_type<uint>(_1568);
    int _1608 = _1586 + 12;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1610)] = as_type<uint>(_1570);
    uint _1612 = uint(int(uint(_1590) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1612)] = as_type<uint>(_1576);
    int _1614 = _1590 + 4;
    uint _1616 = uint(int(uint(_1614) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1616)] = as_type<uint>(_1574);
    int _1618 = _1590 + 8;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1620)] = as_type<uint>(_1578);
    int _1622 = _1590 + 12;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1624)] = as_type<uint>(_1580);
    uint _1626 = uint(int(uint(_1596) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1626)] = as_type<uint>(_1588);
    int _1628 = _1596 + 4;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1630)] = as_type<uint>(_1584);
    int _1632 = _1596 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1634)] = as_type<uint>(_1592);
    int _1636 = _1596 + 12;
    uint _1638 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1638)] = as_type<uint>(_1594);
}

