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
int _60(thread const int& _5198, thread const int& _5199, constant _10& support_buffer)
{
    int _5202 = 1 + _5199;
    float _5204 = support_buffer._m5[_5202].x;
    bool _5206 = _5204 == 1.0;
    if (_5206)
    {
        return _5198;
    }
    float _5208 = float(_5198);
    float _5210 = _5208 * _5204;
    int _5212 = int(_5210);
    return _5212;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4886, thread const int& _4887, thread const int& _4888, thread const int& _4889, thread int& _4890, thread int& _4891, thread int& _4892, thread int& _4893, thread int& _4894, thread int& _4895)
{
    float _4898 = as_type<float>(_4888) + 0.0;
    bool _4900 = _4898 != 0.0;
    bool _4902 = isnan(_4898);
    bool _4904 = _4900 || _4902;
    bool _4906 = isnan(0.0);
    bool _4908 = _4904 || _4906;
    int _4910 = as_type<int>(_4898);
    int _4912 = _4887;
    int _4914 = _4888;
    int _4916 = _4908 ? (-1) : 0;
    if (!_4908)
    {
        float _4918 = as_type<float>(_4888) * 1.0;
        _4910 = as_type<int>(_4918);
    }
    int _4920 = _4910;
    bool _4922 = !_4908;
    int _4924 = _4920;
    if (!_4922)
    {
        float _4926 = as_type<float>(_4888) + 0.0;
        bool _4928 = _4926 >= 0.0;
        bool _4930 = isnan(_4926);
        bool _4932 = _4928 || _4930;
        bool _4934 = isnan(0.0);
        bool _4936 = _4932 || _4934;
        int _4938 = as_type<int>(_4926);
        _4916 = _4936 ? (-1) : 0;
        if (!_4936)
        {
            _4938 = 2147483647;
        }
        int _4940 = _4938;
        bool _4942 = !_4936;
        _4924 = _4940;
        if (!_4942)
        {
            float _4944 = as_type<float>(_4888) + 0.0;
            bool _4946 = _4944 > as_type<float>(0x7f800000u /* inf */);
            bool _4948 = isnan(_4944);
            bool _4950 = _4946 || _4948;
            bool _4952 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4954 = _4950 || _4952;
            int _4956 = as_type<int>(_4944);
            _4916 = _4954 ? (-1) : 0;
            if (_4954)
            {
                float _4958 = as_type<float>(_4888) + 1.0;
                _4956 = as_type<int>(_4958);
            }
            int _4960 = _4956;
            _4924 = _4960;
            if (!_4954)
            {
                float _4962 = 0.0 + as_type<float>(_4888);
                bool _4964 = _4962 != as_type<float>(0x7f800000u /* inf */);
                bool _4966 = isnan(_4962);
                bool _4968 = _4964 || _4966;
                bool _4970 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4972 = _4968 || _4970;
                int _4974 = as_type<int>(_4962);
                _4916 = _4972 ? (-1) : 0;
                if (!_4972)
                {
                    _4974 = _4888;
                }
                int _4976 = _4974;
                bool _4978 = !_4972;
                _4924 = _4976;
                if (!_4978)
                {
                    float _4980 = as_type<float>(_4888) * 18446744073709551616.0;
                    float _4982 = rsqrt(_4980);
                    float _4984 = _4980 * _4982;
                    float _4986 = _4982 * 0.5;
                    float _4988 = -_4984;
                    float _4990 = 0.0 + _4988;
                    float _4992 = fma(_4986, _4990, 0.5);
                    float _4994 = fma(_4984, _4992, _4984);
                    float _4996 = -_4994;
                    float _4998 = 0.0 + _4996;
                    float _5000 = fma(_4994, _4998, _4980);
                    float _5002 = fma(_4986, _5000, _4994);
                    float _5004 = _5002 * 2.3283064365386962890625e-10;
                    _4924 = as_type<int>(_5004);
                    _4912 = as_type<int>(_4994);
                    _4914 = as_type<int>(_4990);
                }
            }
        }
    }
    int _5006 = _4924;
    int _5008 = _4912;
    int _5010 = _4914;
    int _5012 = _4916;
    _4890 = _5006;
    _4891 = _4889;
    _4892 = 0;
    _4893 = _5008;
    _4894 = _5010;
    _4895 = _5012;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1456 = false;
    bool _1018 = false;
    bool _616 = false;
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
    int _101 = _80 ? _93 : _99;
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _103 + 36;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.cp_c5)._m0[int(_119)][_121];
    int _125 = _101 & as_type<int>(_113);
    bool _127 = _125 != 0;
    int _129 = _101 & as_type<int>(_123);
    bool _131 = _129 != 0;
    float _133 = 0.0;
    float _135 = 0.0;
    float _137 = _123;
    if (!_127)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _139 = _133;
    float _141 = _135;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = _139;
    float _149 = _141;
    if (!_127)
    {
        _143 = 0.0;
        _145 = 0.0;
    }
    float _151 = _143;
    float _153 = _145;
    float _155 = 0.0;
    float _157 = _151;
    float _159 = _153;
    if (!_127)
    {
        _155 = 0.0;
    }
    float _161 = _155;
    float _163 = 0.0;
    float _165 = 0.0;
    float _167 = _161;
    if (!_127)
    {
        _163 = 0.0;
        _165 = 0.0;
    }
    float _169 = _163;
    float _171 = _165;
    float _173 = 0.0;
    float _175 = _169;
    float _177 = _171;
    if (!_127)
    {
        _173 = 0.0;
    }
    float _179 = _173;
    float _181 = 0.0;
    float _183 = _179;
    if (!_127)
    {
        _181 = 0.0;
    }
    float _185 = _181;
    float _187 = _185;
    if (!_127)
    {
        _137 = 0.0;
    }
    float _189 = _137;
    bool _191 = !_127;
    float _193 = _189;
    if (!_191)
    {
        uint _195 = uint(int(uint(_103) >> uint(2)));
        uint _197 = uint(int(uint(int(_195)) >> uint(2)));
        int _199 = int(_195) & 3;
        float _201 = (*spvDescriptorSet0.cp_c5)._m0[int(_197)][_199];
        int _203 = int(_195) + 1;
        uint _205 = uint(int(uint(_203) >> uint(2)));
        int _207 = _203 & 3;
        float _209 = (*spvDescriptorSet0.cp_c5)._m0[int(_205)][_207];
        int _211 = _70;
        int _213 = 0;
        int _215 = _60(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_201);
        int _219 = 0;
        int _221 = _60(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _2163 = int3(_215, _221, 1);
        float4 _224 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2163.xy), uint(_2163.z), 0).xyzw;
        float _226 = _224.x;
        float _228 = _224.y;
        float _230 = _224.z;
        float _232 = _224.w;
        int _234 = _70;
        int _236 = 0;
        int _238 = _60(_234, _236, (*spvDescriptorSet0.support_buffer));
        int _240 = as_type<int>(_209);
        int _242 = 0;
        int _244 = _60(_240, _242, (*spvDescriptorSet0.support_buffer));
        int3 _2183 = int3(_238, _244, 1);
        float4 _246 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2183.xy), uint(_2183.z), 0).xyzw;
        float _248 = _246.x;
        float _250 = _246.y;
        float _252 = _246.z;
        float _254 = _246.w;
        int _256 = _70;
        int _258 = 0;
        int _260 = _60(_256, _258, (*spvDescriptorSet0.support_buffer));
        int _262 = as_type<int>(_201);
        int _264 = 0;
        int _266 = _60(_262, _264, (*spvDescriptorSet0.support_buffer));
        int3 _2203 = int3(_260, _266, 0);
        float3 _270 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2203.xy), uint(_2203.z), 0).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        int _278 = _70;
        int _280 = 0;
        int _282 = _60(_278, _280, (*spvDescriptorSet0.support_buffer));
        int _284 = as_type<int>(_209);
        int _286 = 0;
        int _288 = _60(_284, _286, (*spvDescriptorSet0.support_buffer));
        int3 _2221 = int3(_282, _288, 0);
        float3 _290 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2221.xy), uint(_2221.z), 0).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        int _298 = _70;
        int _300 = 0;
        int _302 = _60(_298, _300, (*spvDescriptorSet0.support_buffer));
        int _304 = as_type<int>(_201);
        int _306 = 0;
        int _308 = _60(_304, _306, (*spvDescriptorSet0.support_buffer));
        int3 _2239 = int3(_302, _308, 2);
        float3 _310 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2239.xy), uint(_2239.z), 0).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        int _318 = _70;
        int _320 = 0;
        int _322 = _60(_318, _320, (*spvDescriptorSet0.support_buffer));
        int _324 = as_type<int>(_209);
        int _326 = 0;
        int _328 = _60(_324, _326, (*spvDescriptorSet0.support_buffer));
        int3 _2257 = int3(_322, _328, 2);
        float3 _330 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2257.xy), uint(_2257.z), 0).xyz;
        float _332 = _330.x;
        float _334 = _330.y;
        float _336 = _330.z;
        int _338 = _103 + 16;
        uint _340 = uint(int(uint(_338) >> uint(2)));
        uint _342 = uint(int(uint(int(_340)) >> uint(2)));
        int _344 = int(_340) & 3;
        float _346 = (*spvDescriptorSet0.cp_c5)._m0[int(_342)][_344];
        float _348 = -_226;
        float _350 = _348 + _248;
        float _352 = -_228;
        float _354 = _352 + _250;
        float _356 = -_272;
        float _358 = _356 + _292;
        float _360 = -_230;
        float _362 = _360 + _252;
        float _364 = -_232;
        float _366 = _364 + _254;
        float _368 = fma(_354, _346, _228);
        float _370 = -_274;
        float _372 = _370 + _294;
        float _374 = -_276;
        float _376 = _374 + _296;
        float _378 = -_312;
        float _380 = _378 + _332;
        float _382 = -_314;
        float _384 = _382 + _334;
        float _386 = -_316;
        float _388 = _386 + _336;
        float _390 = fma(_358, _346, _272);
        float _392 = fma(_350, _346, _226);
        float _394 = fma(_362, _346, _230);
        float _396 = fma(_366, _346, _232);
        float _398 = fma(_372, _346, _274);
        float _400 = fma(_376, _346, _276);
        float _402 = fma(_380, _346, _312);
        float _404 = fma(_384, _346, _314);
        float _406 = fma(_388, _346, _316);
        _183 = _368;
        _147 = _392;
        _187 = _394;
        _193 = _396;
        _149 = _390;
        _157 = _398;
        _167 = _400;
        _175 = _402;
        _177 = _404;
        _159 = _406;
    }
    float _408 = _183;
    float _410 = _147;
    float _412 = _187;
    float _414 = _193;
    float _416 = _149;
    float _418 = _157;
    float _420 = _167;
    float _422 = _175;
    float _424 = _177;
    float _426 = _159;
    bool _428 = !_131;
    float _430 = _416;
    float _432 = _418;
    float _434 = _426;
    float _436 = _424;
    float _438 = _422;
    float _992;
    float _994;
    float _996;
    float _998;
    float _1000;
    float _1002;
    float _1004;
    float _1006;
    float _1008;
    float _1010;
    int _1012;
    int _1014;
    int _1016;
    if (!_428)
    {
        int _440 = _103 + 8;
        uint _442 = uint(int(uint(_440) >> uint(2)));
        uint _444 = uint(int(uint(int(_442)) >> uint(2)));
        int _446 = int(_442) & 3;
        float _448 = (*spvDescriptorSet0.cp_c5)._m0[int(_444)][_446];
        int _450 = int(_442) + 1;
        uint _452 = uint(int(uint(_450) >> uint(2)));
        int _454 = _450 & 3;
        float _456 = (*spvDescriptorSet0.cp_c5)._m0[int(_452)][_454];
        int _458 = _70;
        int _460 = 1;
        int _462 = _60(_458, _460, (*spvDescriptorSet0.support_buffer));
        int _464 = as_type<int>(_448);
        int _466 = 1;
        int _468 = _60(_464, _466, (*spvDescriptorSet0.support_buffer));
        int3 _2446 = int3(_462, _468, 1);
        float4 _470 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2446.xy), uint(_2446.z), 0).xyzw;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float _478 = _470.w;
        int _480 = _70;
        int _482 = 1;
        int _484 = _60(_480, _482, (*spvDescriptorSet0.support_buffer));
        int _486 = as_type<int>(_456);
        int _488 = 1;
        int _490 = _60(_486, _488, (*spvDescriptorSet0.support_buffer));
        int3 _2466 = int3(_484, _490, 1);
        float4 _492 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2466.xy), uint(_2466.z), 0).xyzw;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float _500 = _492.w;
        int _502 = _103 + 24;
        uint _504 = uint(int(uint(_502) >> uint(2)));
        uint _506 = uint(int(uint(int(_504)) >> uint(2)));
        int _508 = int(_504) & 3;
        float _510 = (*spvDescriptorSet0.cp_c5)._m0[int(_506)][_508];
        float _512 = -_474;
        float _514 = _512 + _496;
        float _516 = -_472;
        float _518 = _516 + _494;
        float _520 = fma(_514, _510, _474);
        float _522 = fma(_518, _510, _472);
        float _524 = -_476;
        float _526 = _524 + _498;
        float _528 = -_478;
        float _530 = _528 + _500;
        float _532 = _520 * _408;
        float _534 = fma(_526, _510, _476);
        float _536 = fma(_530, _510, _478);
        float _538 = fma(_522, _410, _532);
        float _540 = fma(_534, _412, _538);
        float _542 = fma(_536, _414, _540);
        float _544 = precise::max(_542, -1.0);
        float _546 = precise::min(_544, 1.0);
        bool _548 = _546 >= 0.0;
        bool _550 = isnan(_546);
        bool _552 = _548 || _550;
        bool _554 = isnan(0.0);
        bool _556 = _552 || _554;
        bool _558 = !_556;
        float _560 = -_546;
        float _562 = _558 ? _560 : _546;
        bool _564 = _562 < 0.0;
        float _566 = float(_564);
        float _568 = abs(_562);
        float _570 = -_568;
        float _572 = _570 + 1.0;
        float _574 = abs(_562);
        float _576 = fma(_574, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _578 = as_type<int>(_572) + (-218103808);
        float _580 = abs(_562);
        float _582 = fma(_580, _576, -0.212114393711090087890625);
        bool _584 = uint(_578) >= 1920991232u;
        float _586 = abs(_562);
        float _588 = fma(_586, _582, 1.570728778839111328125);
        bool _590 = !_584;
        float _612;
        float _614;
        if (!_590)
        {
            int _592 = _578;
            int _594 = as_type<int>(_478);
            int _596 = as_type<int>(_572);
            int _598 = 1568;
            int _600;
            int _602;
            int _604;
            int _606;
            int _608;
            int _610;
            _58(_592, _594, _596, _598, _600, _602, _604, _606, _608, _610);
            _612 = as_type<float>(_600);
            _614 = as_type<float>(_602);
            _616 = true;
        }
        else
        {
            float _618 = rsqrt(_572);
            float _620 = _572 * _618;
            float _622 = _618 * 0.5;
            float _624 = -_620;
            float _626 = 0.0 + _624;
            float _628 = fma(_622, _626, 0.5);
            float _630 = fma(_620, _628, _620);
            float _632 = -_630;
            float _634 = 0.0 + _632;
            float _636 = fma(_630, _634, _572);
            float _638 = fma(_622, _636, _630);
            _612 = _638;
            _614 = _636;
        }
        _616 = false;
        float _640 = _612;
        float _642 = _614;
        int _644 = _103 + 8;
        uint _646 = uint(int(uint(_644) >> uint(2)));
        uint _648 = uint(int(uint(int(_646)) >> uint(2)));
        int _650 = int(_646) & 3;
        float _652 = (*spvDescriptorSet0.cp_c5)._m0[int(_648)][_650];
        int _654 = int(_646) + 1;
        uint _656 = uint(int(uint(_654) >> uint(2)));
        int _658 = _654 & 3;
        float _660 = (*spvDescriptorSet0.cp_c5)._m0[int(_656)][_658];
        int _662 = _70;
        int _664 = 1;
        int _666 = _60(_662, _664, (*spvDescriptorSet0.support_buffer));
        int _668 = as_type<int>(_652);
        int _670 = 1;
        int _672 = _60(_668, _670, (*spvDescriptorSet0.support_buffer));
        int3 _2700 = int3(_666, _672, 0);
        float3 _674 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2700.xy), uint(_2700.z), 0).xyz;
        float _676 = _674.x;
        float _678 = _674.y;
        float _680 = _674.z;
        int _682 = _70;
        int _684 = 1;
        int _686 = _60(_682, _684, (*spvDescriptorSet0.support_buffer));
        int _688 = as_type<int>(_652);
        int _690 = 1;
        int _692 = _60(_688, _690, (*spvDescriptorSet0.support_buffer));
        int3 _2718 = int3(_686, _692, 2);
        float3 _694 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2718.xy), uint(_2718.z), 0).xyz;
        float _696 = _694.x;
        float _698 = _694.y;
        float _700 = _694.z;
        int _702 = _70;
        int _704 = 1;
        int _706 = _60(_702, _704, (*spvDescriptorSet0.support_buffer));
        int _708 = as_type<int>(_660);
        int _710 = 1;
        int _712 = _60(_708, _710, (*spvDescriptorSet0.support_buffer));
        int3 _2736 = int3(_706, _712, 0);
        float3 _714 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2736.xy), uint(_2736.z), 0).xyz;
        float _716 = _714.x;
        float _718 = _714.y;
        float _720 = _714.z;
        int _722 = _70;
        int _724 = 1;
        int _726 = _60(_722, _724, (*spvDescriptorSet0.support_buffer));
        int _728 = as_type<int>(_660);
        int _730 = 1;
        int _732 = _60(_728, _730, (*spvDescriptorSet0.support_buffer));
        int3 _2754 = int3(_726, _732, 2);
        float3 _734 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2754.xy), uint(_2754.z), 0).xyz;
        float _736 = _734.x;
        float _738 = _734.y;
        float _740 = _734.z;
        float _742 = _588 * _640;
        float _744 = _566 * 2.0;
        float _746 = -_744;
        float _748 = fma(_742, _746, _742);
        float _750 = fma(_566, 3.1415927410125732421875, _748);
        float _752 = _750 * 0.15915493667125701904296875;
        float _754 = _752 * 6.283185482025146484375;
        float _756 = sin(_754);
        float _758 = abs(_756);
        bool _760 = _758 >= 0.001000000047497451305389404296875;
        bool _762 = isnan(_758);
        bool _764 = _760 || _762;
        bool _766 = isnan(0.001000000047497451305389404296875);
        bool _768 = _764 || _766;
        float _770 = _588;
        float _772 = _642;
        float _774 = _742;
        if (!_768)
        {
            int _776 = _103 + 28;
            uint _778 = uint(int(uint(_776) >> uint(2)));
            uint _780 = uint(int(uint(int(_778)) >> uint(2)));
            int _782 = int(_778) & 3;
            float _784 = (*spvDescriptorSet0.cp_c5)._m0[int(_780)][_782];
            _770 = _784;
        }
        float _786 = _770;
        float _788 = _786;
        if (!_768)
        {
            float _790 = -_786;
            float _792 = _790 + 1.0;
            _772 = _792;
        }
        float _794 = _772;
        float _796 = _794;
        if (!_768)
        {
            _774 = _786;
        }
        float _798 = _774;
        bool _800 = !_768;
        float _802 = _798;
        if (!_800)
        {
            int _804 = _103 + 28;
            uint _806 = uint(int(uint(_804) >> uint(2)));
            uint _808 = uint(int(uint(int(_806)) >> uint(2)));
            int _810 = int(_806) & 3;
            float _812 = (*spvDescriptorSet0.cp_c5)._m0[int(_808)][_810];
            float _814 = 1.0 / _756;
            float _816 = _750 * _812;
            float _818 = _816 * 0.15915493667125701904296875;
            float _820 = -_816;
            float _822 = _750 + _820;
            float _824 = _822 * 0.15915493667125701904296875;
            float _826 = _818 * 6.283185482025146484375;
            float _828 = sin(_826);
            float _830 = _824 * 6.283185482025146484375;
            float _832 = sin(_830);
            float _834 = _828 * _814;
            float _836 = _832 * _814;
            _802 = _834;
            _796 = _836;
            _788 = _812;
        }
        float _838 = _802;
        float _840 = _796;
        float _842 = _788;
        bool _844 = !_556;
        float _846 = -_838;
        float _848 = _844 ? _846 : _838;
        int _850 = _103 + 24;
        uint _852 = uint(int(uint(_850) >> uint(2)));
        uint _854 = uint(int(uint(int(_852)) >> uint(2)));
        int _856 = int(_852) & 3;
        float _858 = (*spvDescriptorSet0.cp_c5)._m0[int(_854)][_856];
        float _860 = -_680;
        float _862 = _860 + _720;
        float _864 = -_700;
        float _866 = _864 + _740;
        float _868 = _536 * _848;
        float _870 = _534 * _848;
        float _872 = _522 * _848;
        float _874 = _520 * _848;
        float _876 = fma(_414, _840, _868);
        float _878 = fma(_412, _840, _870);
        float _880 = fma(_410, _840, _872);
        float _882 = fma(_408, _840, _874);
        float _884 = _876 * 2.0;
        int _886 = _103 + 20;
        uint _888 = uint(int(uint(_886) >> uint(2)));
        uint _890 = uint(int(uint(int(_888)) >> uint(2)));
        int _892 = int(_888) & 3;
        float _894 = (*spvDescriptorSet0.cp_c5)._m0[int(_890)][_892];
        float _896 = _880 * 2.0;
        float _898 = _882 * 2.0;
        float _900 = _878 * _884;
        float _902 = _880 * _884;
        float _904 = _882 * _884;
        float _906 = _880 * _880;
        float _908 = -_900;
        float _910 = fma(_882, _896, _908);
        float _912 = fma(_882, _896, _900);
        float _914 = _882 * _882;
        float _916 = -_902;
        float _918 = fma(_878, _898, _916);
        float _920 = fma(_878, _896, _904);
        float _922 = fma(_878, _898, _902);
        float _924 = -_904;
        float _926 = fma(_878, _896, _924);
        float _928 = _878 * _878;
        float _930 = -_676;
        float _932 = _930 + _716;
        float _934 = fma(_914, -2.0, 1.0);
        float _936 = fma(_906, -2.0, 1.0);
        float _938 = -_678;
        float _940 = _938 + _718;
        float _942 = fma(_932, _858, _676);
        float _944 = fma(_928, -2.0, _934);
        float _946 = fma(_928, -2.0, _936);
        float _948 = fma(_914, -2.0, _936);
        float _950 = -_696;
        float _952 = _950 + _736;
        float _954 = -_698;
        float _956 = _954 + _738;
        float _958 = _942 * _842;
        float _960 = fma(_940, _858, _678);
        float _962 = fma(_862, _858, _680);
        float _964 = fma(_952, _858, _696);
        float _966 = fma(_956, _858, _698);
        float _968 = fma(_866, _858, _700);
        float _970 = fma(_416, _894, _958);
        float _972 = _960 * _842;
        float _974 = _962 * _842;
        float _976 = _964 * _842;
        float _978 = _966 * _842;
        float _980 = _968 * _842;
        float _982 = fma(_418, _894, _972);
        float _984 = fma(_420, _894, _974);
        float _986 = fma(_422, _894, _976);
        float _988 = fma(_424, _894, _978);
        float _990 = fma(_426, _894, _980);
        _430 = _970;
        _992 = _926;
        _994 = _944;
        _996 = _912;
        _432 = _982;
        _998 = _910;
        _1000 = _946;
        _1002 = _922;
        _1004 = _984;
        _1006 = _920;
        _1008 = _918;
        _1010 = _948;
        _1012 = as_type<int>(_986);
        _1014 = as_type<int>(_988);
        _1016 = as_type<int>(_990);
        _1018 = true;
    }
    else
    {
        float _1020 = _414 * 2.0;
        float _1022 = _408 * _408;
        float _1024 = _410 * _410;
        float _1026 = _410 * 2.0;
        float _1028 = _1020 * _412;
        float _1030 = _1020 * _408;
        float _1032 = _1020 * _410;
        float _1034 = _408 * 2.0;
        float _1036 = _412 * _412;
        float _1038 = fma(_1022, -2.0, 1.0);
        float _1040 = -_1028;
        float _1042 = fma(_1026, _408, _1040);
        float _1044 = fma(_1026, _408, _1028);
        float _1046 = fma(_1024, -2.0, 1.0);
        float _1048 = fma(_1026, _412, _1030);
        float _1050 = -_1030;
        float _1052 = fma(_1026, _412, _1050);
        float _1054 = -_1032;
        float _1056 = fma(_1034, _412, _1054);
        float _1058 = fma(_1034, _412, _1032);
        float _1060 = fma(_1036, -2.0, _1038);
        float _1062 = fma(_1036, -2.0, _1046);
        float _1064 = fma(_1022, -2.0, _1046);
        _992 = _1052;
        _994 = _1060;
        _996 = _1044;
        _998 = _1042;
        _1000 = _1062;
        _1002 = _1058;
        _1004 = _420;
        _1006 = _1048;
        _1008 = _1056;
        _1010 = _1064;
        _1012 = as_type<int>(_422);
        _1014 = as_type<int>(_424);
        _1016 = as_type<int>(_426);
    }
    _1018 = false;
    float _1066 = _430;
    float _1068 = _992;
    float _1070 = _994;
    float _1072 = _996;
    float _1074 = _432;
    float _1076 = _998;
    float _1078 = _1000;
    float _1080 = _1002;
    float _1082 = _1004;
    float _1084 = _1006;
    float _1086 = _1008;
    float _1088 = _1010;
    int _1090 = _1012;
    int _1092 = _1014;
    int _1094 = _1016;
    float _1096 = _1066 * _1068;
    float _1098 = _1066 * _1070;
    float _1100 = _1066 * _1072;
    float _1102 = _1074 * _1076;
    float _1104 = _1074 * _1078;
    float _1106 = _1074 * _1080;
    int _1108 = _70 * 48;
    float _1110 = _1082 * _1084;
    float _1112 = _1082 * _1086;
    float _1114 = _1082 * _1088;
    bool _1116 = _70 != 0;
    uint _1118 = uint(int(uint(_1108) >> uint(2)));
    _39[int(_1118)] = as_type<uint>(_1098);
    int _1120 = _1108 + 4;
    uint _1122 = uint(int(uint(_1120) >> uint(2)));
    _39[int(_1122)] = as_type<uint>(_1102);
    int _1124 = _1108 + 8;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    _39[int(_1126)] = as_type<uint>(_1110);
    int _1128 = _1108 + 12;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    _39[int(_1130)] = uint(_1090);
    int _1132 = _70 * 112;
    int _1134 = _1108 + 16;
    int _1136 = _1108 + 16;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    _39[int(_1138)] = as_type<uint>(_1100);
    int _1140 = _1108 + 20;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    _39[int(_1142)] = as_type<uint>(_1104);
    int _1144 = _1108 + 24;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    _39[int(_1146)] = as_type<uint>(_1112);
    int _1148 = _1108 + 28;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    _39[int(_1150)] = uint(_1092);
    int _1152 = _1108 + 32;
    int _1154 = _1108 + 32;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    _39[int(_1156)] = as_type<uint>(_1096);
    int _1158 = _1108 + 36;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    _39[int(_1160)] = as_type<uint>(_1106);
    int _1162 = _1108 + 40;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    _39[int(_1164)] = as_type<uint>(_1114);
    int _1166 = _1108 + 44;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    _39[int(_1168)] = uint(_1094);
    float _1170 = _1074;
    float _1172 = _1076;
    float _1174 = _1070;
    float _1176 = _1066;
    float _1178 = _1082;
    float _1180 = _1086;
    float _1182 = _1078;
    float _1184 = _1072;
    float _1186 = _1084;
    if (!_1116)
    {
        _434 = _1098;
    }
    float _1188 = _434;
    float _1190 = _1188;
    if (!_1116)
    {
        _1170 = _1102;
    }
    float _1192 = _1170;
    float _1194 = _1192;
    if (!_1116)
    {
        _436 = _1110;
    }
    float _1196 = _436;
    float _1198 = _1196;
    if (!_1116)
    {
        _438 = as_type<float>(_1090);
    }
    float _1200 = _438;
    float _1202 = _1200;
    if (!_1116)
    {
        _1172 = _1100;
    }
    float _1204 = _1172;
    float _1206 = _1204;
    if (!_1116)
    {
        _1174 = _1104;
    }
    float _1208 = _1174;
    float _1210 = _1208;
    if (!_1116)
    {
        _1176 = _1112;
    }
    float _1212 = _1176;
    float _1214 = _1212;
    if (!_1116)
    {
        _1178 = as_type<float>(_1092);
    }
    float _1216 = _1178;
    float _1218 = _1216;
    if (!_1116)
    {
        _1180 = _1096;
    }
    float _1220 = _1180;
    float _1222 = _1220;
    if (!_1116)
    {
        _1182 = _1106;
    }
    float _1224 = _1182;
    float _1226 = _1224;
    if (!_1116)
    {
        _1184 = _1114;
    }
    float _1228 = _1184;
    float _1230 = _1228;
    if (!_1116)
    {
        _1186 = as_type<float>(_1094);
    }
    float _1232 = _1186;
    bool _1234 = !_1116;
    float _1236 = _1232;
    if (!_1234)
    {
        bool _1238 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1240 = !_1238;
        if (!_1240)
        {
            uint _1242 = uint(int(uint(_1132) >> uint(2)));
            uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
            int _1246 = int(_1242) & 3;
            float _1248 = (*spvDescriptorSet0.cp_c6)._m0[int(_1244)][_1246];
            int _1250 = as_type<int>(_1248) * 48;
            int _1252 = 0;
            bool _1254;
            float _1352;
            float _1354;
            float _1362;
            float _1372;
            float _1374;
            float _1386;
            float _1398;
            float _1400;
            float _1402;
            float _1404;
            float _1406;
            float _1408;
            do
            {
                int _1256 = _1252;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1258 = uint(int(uint(_1250) >> uint(2)));
                float _1260 = as_type<float>(_39[int(_1258)]);
                int _1262 = _1250 + 4;
                uint _1264 = uint(int(uint(_1262) >> uint(2)));
                float _1266 = as_type<float>(_39[int(_1264)]);
                int _1268 = _1250 + 8;
                uint _1270 = uint(int(uint(_1268) >> uint(2)));
                float _1272 = as_type<float>(_39[int(_1270)]);
                int _1274 = _1250 + 12;
                uint _1276 = uint(int(uint(_1274) >> uint(2)));
                float _1278 = as_type<float>(_39[int(_1276)]);
                int _1280 = _1256 + 1;
                int _1282 = _1250 + 16;
                uint _1284 = uint(int(uint(_1282) >> uint(2)));
                float _1286 = as_type<float>(_39[int(_1284)]);
                int _1288 = _1250 + 20;
                uint _1290 = uint(int(uint(_1288) >> uint(2)));
                float _1292 = as_type<float>(_39[int(_1290)]);
                int _1294 = _1250 + 24;
                uint _1296 = uint(int(uint(_1294) >> uint(2)));
                float _1298 = as_type<float>(_39[int(_1296)]);
                int _1300 = _1250 + 28;
                uint _1302 = uint(int(uint(_1300) >> uint(2)));
                float _1304 = as_type<float>(_39[int(_1302)]);
                bool _1306 = uint(_1280) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1308 = _1250 + 32;
                uint _1310 = uint(int(uint(_1308) >> uint(2)));
                float _1312 = as_type<float>(_39[int(_1310)]);
                int _1314 = _1250 + 36;
                uint _1316 = uint(int(uint(_1314) >> uint(2)));
                float _1318 = as_type<float>(_39[int(_1316)]);
                int _1320 = _1250 + 40;
                uint _1322 = uint(int(uint(_1320) >> uint(2)));
                float _1324 = as_type<float>(_39[int(_1322)]);
                int _1326 = _1250 + 44;
                uint _1328 = uint(int(uint(_1326) >> uint(2)));
                float _1330 = as_type<float>(_39[int(_1328)]);
                float _1332 = _1266 * as_type<float>(_1092);
                float _1334 = _1100 * _1266;
                float _1336 = _1104 * _1266;
                float _1338 = _1112 * _1266;
                float _1340 = fma(_1260, as_type<float>(_1090), _1332);
                float _1342 = fma(_1098, _1260, _1334);
                float _1344 = fma(_1102, _1260, _1336);
                float _1346 = fma(_1110, _1260, _1338);
                float _1348 = fma(_1272, as_type<float>(_1094), _1340);
                float _1350 = _1292 * as_type<float>(_1092);
                _1352 = fma(_1096, _1272, _1342);
                _1354 = fma(_1106, _1272, _1344);
                float _1356 = _1100 * _1292;
                float _1358 = _1104 * _1292;
                float _1360 = fma(_1286, as_type<float>(_1090), _1350);
                _1362 = _1278 + _1348;
                float _1364 = fma(_1098, _1286, _1356);
                float _1366 = fma(_1102, _1286, _1358);
                float _1368 = fma(_1298, as_type<float>(_1094), _1360);
                float _1370 = _1318 * as_type<float>(_1092);
                _1372 = fma(_1096, _1298, _1364);
                _1374 = fma(_1106, _1298, _1366);
                float _1376 = _1100 * _1318;
                float _1378 = _1104 * _1318;
                float _1380 = _1112 * _1292;
                float _1382 = _1112 * _1318;
                float _1384 = fma(_1312, as_type<float>(_1090), _1370);
                _1386 = _1304 + _1368;
                float _1388 = fma(_1110, _1286, _1380);
                float _1390 = fma(_1098, _1312, _1376);
                float _1392 = fma(_1102, _1312, _1378);
                float _1394 = fma(_1110, _1312, _1382);
                float _1396 = fma(_1324, as_type<float>(_1094), _1384);
                _1398 = fma(_1114, _1272, _1346);
                _1400 = fma(_1114, _1298, _1388);
                _1402 = fma(_1096, _1324, _1390);
                _1404 = fma(_1106, _1324, _1392);
                _1406 = fma(_1114, _1324, _1394);
                _1408 = _1330 + _1396;
                uint _1410 = uint(int(uint(_1108) >> uint(2)));
                _39[int(_1410)] = as_type<uint>(_1352);
                int _1412 = _1108 + 4;
                uint _1414 = uint(int(uint(_1412) >> uint(2)));
                _39[int(_1414)] = as_type<uint>(_1354);
                int _1416 = _1108 + 8;
                uint _1418 = uint(int(uint(_1416) >> uint(2)));
                _39[int(_1418)] = as_type<uint>(_1398);
                int _1420 = _1108 + 12;
                uint _1422 = uint(int(uint(_1420) >> uint(2)));
                _39[int(_1422)] = as_type<uint>(_1362);
                int _1424 = _1108 + 16;
                uint _1426 = uint(int(uint(_1424) >> uint(2)));
                _39[int(_1426)] = as_type<uint>(_1372);
                int _1428 = _1108 + 20;
                uint _1430 = uint(int(uint(_1428) >> uint(2)));
                _39[int(_1430)] = as_type<uint>(_1374);
                int _1432 = _1108 + 24;
                uint _1434 = uint(int(uint(_1432) >> uint(2)));
                _39[int(_1434)] = as_type<uint>(_1400);
                int _1436 = _1108 + 28;
                uint _1438 = uint(int(uint(_1436) >> uint(2)));
                _39[int(_1438)] = as_type<uint>(_1386);
                int _1440 = _1108 + 32;
                uint _1442 = uint(int(uint(_1440) >> uint(2)));
                _39[int(_1442)] = as_type<uint>(_1402);
                int _1444 = _1108 + 36;
                uint _1446 = uint(int(uint(_1444) >> uint(2)));
                _39[int(_1446)] = as_type<uint>(_1404);
                int _1448 = _1108 + 40;
                uint _1450 = uint(int(uint(_1448) >> uint(2)));
                _39[int(_1450)] = as_type<uint>(_1406);
                int _1452 = _1108 + 44;
                uint _1454 = uint(int(uint(_1452) >> uint(2)));
                _39[int(_1454)] = as_type<uint>(_1408);
                _1254 = !_1306;
                _1252 = _1280;
            } while (_1254);
            _1190 = _1352;
            _1194 = _1354;
            _1198 = _1398;
            _1202 = _1362;
            _1206 = _1372;
            _1210 = _1374;
            _1214 = _1400;
            _1218 = _1386;
            _1222 = _1402;
            _1226 = _1404;
            _1230 = _1406;
            _1236 = _1408;
            _1456 = true;
        }
        else
        {
            _1190 = 0.0;
            _1194 = 0.0;
            _1198 = 0.0;
            _1202 = 0.0;
            _1206 = 0.0;
            _1210 = 0.0;
            _1214 = 0.0;
            _1218 = 0.0;
            _1222 = 0.0;
            _1226 = 0.0;
            _1230 = 0.0;
            _1236 = 0.0;
        }
    }
    _1456 = false;
    float _1458 = _1190;
    float _1460 = _1194;
    float _1462 = _1198;
    float _1464 = _1202;
    float _1466 = _1206;
    float _1468 = _1210;
    float _1470 = _1214;
    float _1472 = _1218;
    float _1474 = _1222;
    float _1476 = _1226;
    float _1478 = _1230;
    float _1480 = _1236;
    int _1482 = _1132 + 80;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.cp_c6)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.cp_c6)._m0[int(_1494)][_1496];
    bool _1500 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1502 = _1132 + 64;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.cp_c6)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.cp_c6)._m0[int(_1514)][_1516];
    int _1520 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1522 = _1520 + _70;
    int _1524 = _1132 + 88;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.cp_c6)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.cp_c6)._m0[int(_1536)][_1538];
    int _1542 = _1132 + 72;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.cp_c6)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.cp_c6)._m0[int(_1554)][_1556];
    int _1560 = _1132 + 96;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    uint _1564 = uint(int(uint(int(_1562)) >> uint(2)));
    int _1566 = int(_1562) & 3;
    float _1568 = (*spvDescriptorSet0.cp_c6)._m0[int(_1564)][_1566];
    int _1570 = int(_1562) + 1;
    uint _1572 = uint(int(uint(_1570) >> uint(2)));
    int _1574 = _1570 & 3;
    float _1576 = (*spvDescriptorSet0.cp_c6)._m0[int(_1572)][_1574];
    int _1578 = _1132 + 104;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
    int _1584 = int(_1580) & 3;
    float _1586 = (*spvDescriptorSet0.cp_c6)._m0[int(_1582)][_1584];
    int _1588 = int(_1580) + 1;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    int _1592 = _1588 & 3;
    float _1594 = (*spvDescriptorSet0.cp_c6)._m0[int(_1590)][_1592];
    int _1596 = _1132 + 16;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.cp_c6)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.cp_c6)._m0[int(_1608)][_1610];
    if (!_1500)
    {
        uint _1614 = uint(int(uint(_1108) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1614)] = as_type<uint>(_1458);
        int _1616 = _1108 + 4;
        uint _1618 = uint(int(uint(_1616) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1618)] = as_type<uint>(_1460);
        int _1620 = _1108 + 8;
        uint _1622 = uint(int(uint(_1620) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1622)] = as_type<uint>(_1462);
        int _1624 = _1108 + 12;
        uint _1626 = uint(int(uint(_1624) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1626)] = as_type<uint>(_1464);
        uint _1628 = uint(int(uint(_1134) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1628)] = as_type<uint>(_1466);
        int _1630 = _1134 + 4;
        uint _1632 = uint(int(uint(_1630) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1632)] = as_type<uint>(_1468);
        int _1634 = _1134 + 8;
        uint _1636 = uint(int(uint(_1634) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1636)] = as_type<uint>(_1470);
        int _1638 = _1134 + 12;
        uint _1640 = uint(int(uint(_1638) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1640)] = as_type<uint>(_1472);
        uint _1642 = uint(int(uint(_1152) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1642)] = as_type<uint>(_1474);
        int _1644 = _1152 + 4;
        uint _1646 = uint(int(uint(_1644) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1646)] = as_type<uint>(_1476);
        int _1648 = _1152 + 8;
        uint _1650 = uint(int(uint(_1648) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1650)] = as_type<uint>(_1478);
        int _1652 = _1152 + 12;
        uint _1654 = uint(int(uint(_1652) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1654)] = as_type<uint>(_1480);
    }
    float _1656 = _1468 * _1490;
    float _1658 = _1476 * _1490;
    int _1660 = _1132 + 32;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    uint _1664 = uint(int(uint(int(_1662)) >> uint(2)));
    int _1666 = int(_1662) & 3;
    float _1668 = (*spvDescriptorSet0.cp_c6)._m0[int(_1664)][_1666];
    int _1670 = int(_1662) + 1;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    int _1674 = _1670 & 3;
    float _1676 = (*spvDescriptorSet0.cp_c6)._m0[int(_1672)][_1674];
    float _1678 = _1460 * _1490;
    float _1680 = fma(_1466, _1510, _1656);
    float _1682 = fma(_1474, _1510, _1658);
    float _1684 = _1460 * _1498;
    float _1686 = _1468 * _1498;
    float _1688 = _1476 * _1498;
    float _1690 = _1460 * _1540;
    int _1692 = _1132 + 48;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.cp_c6)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.cp_c6)._m0[int(_1704)][_1706];
    float _1710 = fma(_1458, _1518, _1684);
    float _1712 = _1460 * _1532;
    float _1714 = fma(_1466, _1518, _1686);
    float _1716 = fma(_1474, _1518, _1688);
    float _1718 = _1468 * _1532;
    float _1720 = _1468 * _1540;
    float _1722 = _1476 * _1532;
    float _1724 = _1476 * _1540;
    int _1726 = _1132 + 24;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.cp_c6)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.cp_c6)._m0[int(_1738)][_1740];
    float _1744 = fma(_1458, _1550, _1712);
    float _1746 = fma(_1458, _1558, _1690);
    float _1748 = fma(_1466, _1550, _1718);
    float _1750 = fma(_1466, _1558, _1720);
    float _1752 = fma(_1474, _1550, _1722);
    float _1754 = fma(_1474, _1558, _1724);
    float _1756 = fma(_1462, _1576, _1710);
    int _1758 = _1132 + 40;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.cp_c6)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.cp_c6)._m0[int(_1770)][_1772];
    float _1776 = fma(_1470, _1568, _1680);
    float _1778 = fma(_1470, _1576, _1714);
    float _1780 = fma(_1470, _1586, _1748);
    float _1782 = fma(_1470, _1594, _1750);
    float _1784 = fma(_1458, _1510, _1678);
    float _1786 = fma(_1462, _1594, _1746);
    float _1788 = fma(_1478, _1594, _1754);
    int _1790 = _1132 + 56;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    uint _1794 = uint(int(uint(int(_1792)) >> uint(2)));
    int _1796 = int(_1792) & 3;
    float _1798 = (*spvDescriptorSet0.cp_c6)._m0[int(_1794)][_1796];
    int _1800 = int(_1792) + 1;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    int _1804 = _1800 & 3;
    float _1806 = (*spvDescriptorSet0.cp_c6)._m0[int(_1802)][_1804];
    float _1808 = _1782 + _1472;
    float _1810 = fma(_1462, _1568, _1784);
    float _1812 = fma(_1462, _1586, _1744);
    float _1814 = _1786 + _1464;
    float _1816 = _1780 * _1612;
    float _1818 = _1808 * _1612;
    float _1820 = _1788 + _1480;
    float _1822 = fma(_1478, _1568, _1682);
    float _1824 = fma(_1478, _1576, _1716);
    float _1826 = fma(_1478, _1586, _1752);
    float _1828 = _1778 * _1612;
    float _1830 = _1776 * _1612;
    float _1832 = fma(_1812, _1604, _1816);
    float _1834 = fma(_1814, _1604, _1818);
    float _1836 = _1808 * _1676;
    float _1838 = _1776 * _1676;
    float _1840 = _1778 * _1676;
    float _1842 = _1780 * _1676;
    float _1844 = fma(_1814, _1668, _1836);
    float _1846 = fma(_1756, _1604, _1828);
    int _1848 = _1522 * 48;
    float _1850 = fma(_1810, _1604, _1830);
    float _1852 = _1808 * _1708;
    float _1854 = _1776 * _1708;
    float _1856 = _1778 * _1708;
    float _1858 = _1780 * _1708;
    float _1860 = fma(_1814, _1700, _1852);
    float _1862 = fma(_1810, _1668, _1838);
    float _1864 = fma(_1756, _1668, _1840);
    float _1866 = fma(_1812, _1668, _1842);
    float _1868 = fma(_1810, _1700, _1854);
    float _1870 = fma(_1820, _1734, _1834);
    float _1872 = fma(_1756, _1700, _1856);
    float _1874 = fma(_1812, _1700, _1858);
    float _1876 = fma(_1824, _1734, _1846);
    float _1878 = fma(_1822, _1734, _1850);
    float _1880 = fma(_1826, _1734, _1832);
    float _1882 = _1870 + _1742;
    int _1884 = _1848 + 16;
    float _1886 = fma(_1820, _1766, _1844);
    float _1888 = fma(_1822, _1766, _1862);
    float _1890 = fma(_1824, _1766, _1864);
    float _1892 = fma(_1826, _1766, _1866);
    float _1894 = _1886 + _1774;
    int _1896 = _1848 + 32;
    int _1898 = _1848 + 48;
    float _1900 = fma(_1820, _1798, _1860);
    float _1902 = fma(_1822, _1798, _1868);
    float _1904 = fma(_1824, _1798, _1872);
    float _1906 = fma(_1826, _1798, _1874);
    float _1908 = _1900 + _1806;
    uint _1910 = uint(int(uint(_1884) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1910)] = as_type<uint>(_1878);
    int _1912 = _1884 + 4;
    uint _1914 = uint(int(uint(_1912) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1914)] = as_type<uint>(_1876);
    int _1916 = _1884 + 8;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1918)] = as_type<uint>(_1880);
    int _1920 = _1884 + 12;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1922)] = as_type<uint>(_1882);
    uint _1924 = uint(int(uint(_1896) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1924)] = as_type<uint>(_1888);
    int _1926 = _1896 + 4;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1928)] = as_type<uint>(_1890);
    int _1930 = _1896 + 8;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1932)] = as_type<uint>(_1892);
    int _1934 = _1896 + 12;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1936)] = as_type<uint>(_1894);
    uint _1938 = uint(int(uint(_1898) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1938)] = as_type<uint>(_1902);
    int _1940 = _1898 + 4;
    uint _1942 = uint(int(uint(_1940) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1942)] = as_type<uint>(_1904);
    int _1944 = _1898 + 8;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1946)] = as_type<uint>(_1906);
    int _1948 = _1898 + 12;
    uint _1950 = uint(int(uint(_1948) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1950)] = as_type<uint>(_1908);
}

