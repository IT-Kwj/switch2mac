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
int _60(thread const int& _5147, thread const int& _5148, constant _10& support_buffer)
{
    int _5151 = 1 + _5148;
    float _5153 = support_buffer._m5[_5151].x;
    bool _5155 = _5153 == 1.0;
    if (_5155)
    {
        return _5147;
    }
    float _5157 = float(_5147);
    float _5159 = _5157 * _5153;
    int _5161 = int(_5159);
    return _5161;
}

static inline __attribute__((always_inline))
void _58(thread const int& _4835, thread const int& _4836, thread const int& _4837, thread const int& _4838, thread int& _4839, thread int& _4840, thread int& _4841, thread int& _4842, thread int& _4843, thread int& _4844)
{
    float _4847 = as_type<float>(_4836) + 0.0;
    bool _4849 = _4847 != 0.0;
    bool _4851 = isnan(_4847);
    bool _4853 = _4849 || _4851;
    bool _4855 = isnan(0.0);
    bool _4857 = _4853 || _4855;
    int _4859 = as_type<int>(_4847);
    int _4861 = _4836;
    int _4863 = _4837;
    int _4865 = _4857 ? (-1) : 0;
    if (!_4857)
    {
        float _4867 = as_type<float>(_4836) * 1.0;
        _4859 = as_type<int>(_4867);
    }
    int _4869 = _4859;
    bool _4871 = !_4857;
    int _4873 = _4869;
    if (!_4871)
    {
        float _4875 = as_type<float>(_4836) + 0.0;
        bool _4877 = _4875 >= 0.0;
        bool _4879 = isnan(_4875);
        bool _4881 = _4877 || _4879;
        bool _4883 = isnan(0.0);
        bool _4885 = _4881 || _4883;
        int _4887 = as_type<int>(_4875);
        _4865 = _4885 ? (-1) : 0;
        if (!_4885)
        {
            _4887 = 2147483647;
        }
        int _4889 = _4887;
        bool _4891 = !_4885;
        _4873 = _4889;
        if (!_4891)
        {
            float _4893 = as_type<float>(_4836) + 0.0;
            bool _4895 = _4893 > as_type<float>(0x7f800000u /* inf */);
            bool _4897 = isnan(_4893);
            bool _4899 = _4895 || _4897;
            bool _4901 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4903 = _4899 || _4901;
            int _4905 = as_type<int>(_4893);
            _4865 = _4903 ? (-1) : 0;
            if (_4903)
            {
                float _4907 = as_type<float>(_4836) + 1.0;
                _4905 = as_type<int>(_4907);
            }
            int _4909 = _4905;
            _4873 = _4909;
            if (!_4903)
            {
                float _4911 = 0.0 + as_type<float>(_4836);
                bool _4913 = _4911 != as_type<float>(0x7f800000u /* inf */);
                bool _4915 = isnan(_4911);
                bool _4917 = _4913 || _4915;
                bool _4919 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4921 = _4917 || _4919;
                int _4923 = as_type<int>(_4911);
                _4865 = _4921 ? (-1) : 0;
                if (!_4921)
                {
                    _4923 = _4836;
                }
                int _4925 = _4923;
                bool _4927 = !_4921;
                _4873 = _4925;
                if (!_4927)
                {
                    float _4929 = as_type<float>(_4836) * 18446744073709551616.0;
                    float _4931 = rsqrt(_4929);
                    float _4933 = _4929 * _4931;
                    float _4935 = _4931 * 0.5;
                    float _4937 = -_4933;
                    float _4939 = 0.0 + _4937;
                    float _4941 = fma(_4935, _4939, 0.5);
                    float _4943 = fma(_4933, _4941, _4933);
                    float _4945 = -_4943;
                    float _4947 = 0.0 + _4945;
                    float _4949 = fma(_4943, _4947, _4929);
                    float _4951 = fma(_4935, _4949, _4943);
                    float _4953 = _4951 * 2.3283064365386962890625e-10;
                    _4873 = as_type<int>(_4953);
                    _4861 = as_type<int>(_4939);
                    _4863 = as_type<int>(_4943);
                }
            }
        }
    }
    int _4955 = _4873;
    int _4957 = _4861;
    int _4959 = _4863;
    int _4961 = _4865;
    _4839 = _4955;
    _4840 = _4838;
    _4841 = 0;
    _4842 = _4957;
    _4843 = _4959;
    _4844 = _4961;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1482 = false;
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
    float _165 = _161;
    if (!_127)
    {
        _163 = 0.0;
    }
    float _167 = _163;
    float _169 = 0.0;
    float _171 = _167;
    if (!_127)
    {
        _169 = 0.0;
    }
    float _173 = _169;
    float _175 = 0.0;
    float _177 = _173;
    if (!_127)
    {
        _175 = 0.0;
    }
    float _179 = _175;
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
        int3 _2149 = int3(_215, _221, 1);
        float4 _224 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2149.xy), uint(_2149.z), 0).xyzw;
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
        int3 _2169 = int3(_238, _244, 1);
        float4 _246 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2169.xy), uint(_2169.z), 0).xyzw;
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
        int3 _2189 = int3(_260, _266, 0);
        float3 _270 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2189.xy), uint(_2189.z), 0).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        int _278 = _70;
        int _280 = 0;
        int _282 = _60(_278, _280, (*spvDescriptorSet0.support_buffer));
        int _284 = as_type<int>(_209);
        int _286 = 0;
        int _288 = _60(_284, _286, (*spvDescriptorSet0.support_buffer));
        int3 _2207 = int3(_282, _288, 0);
        float3 _290 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2207.xy), uint(_2207.z), 0).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        int _298 = _70;
        int _300 = 0;
        int _302 = _60(_298, _300, (*spvDescriptorSet0.support_buffer));
        int _304 = as_type<int>(_201);
        int _306 = 0;
        int _308 = _60(_304, _306, (*spvDescriptorSet0.support_buffer));
        int3 _2225 = int3(_302, _308, 2);
        float3 _310 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2225.xy), uint(_2225.z), 0).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        int _318 = _70;
        int _320 = 0;
        int _322 = _60(_318, _320, (*spvDescriptorSet0.support_buffer));
        int _324 = as_type<int>(_209);
        int _326 = 0;
        int _328 = _60(_324, _326, (*spvDescriptorSet0.support_buffer));
        int3 _2243 = int3(_322, _328, 2);
        float3 _330 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2243.xy), uint(_2243.z), 0).xyz;
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
        float _352 = -_232;
        float _354 = _352 + _254;
        float _356 = -_228;
        float _358 = _356 + _250;
        float _360 = -_272;
        float _362 = _360 + _292;
        float _364 = fma(_350, _346, _226);
        float _366 = fma(_354, _346, _232);
        float _368 = -_230;
        float _370 = _368 + _252;
        float _372 = -_274;
        float _374 = _372 + _294;
        float _376 = -_276;
        float _378 = _376 + _296;
        float _380 = -_312;
        float _382 = _380 + _332;
        float _384 = -_314;
        float _386 = _384 + _334;
        float _388 = -_316;
        float _390 = _388 + _336;
        float _392 = fma(_362, _346, _272);
        float _394 = fma(_358, _346, _228);
        float _396 = fma(_370, _346, _230);
        float _398 = fma(_374, _346, _274);
        float _400 = fma(_378, _346, _276);
        float _402 = fma(_382, _346, _312);
        float _404 = fma(_386, _346, _314);
        float _406 = fma(_390, _346, _316);
        _183 = _394;
        _177 = _364;
        _187 = _396;
        _193 = _366;
        _147 = _392;
        _157 = _398;
        _159 = _400;
        _149 = _402;
        _165 = _404;
        _171 = _406;
    }
    float _408 = _183;
    float _410 = _177;
    float _412 = _187;
    float _414 = _193;
    float _416 = _147;
    float _418 = _157;
    float _420 = _159;
    float _422 = _149;
    float _424 = _165;
    float _426 = _171;
    bool _428 = !_131;
    float _430 = _416;
    int _432 = as_type<int>(_424);
    int _434 = as_type<int>(_426);
    float _436 = _420;
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
    float _1012;
    int _1014;
    float _1016;
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
        int3 _2434 = int3(_462, _468, 1);
        float4 _470 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2434.xy), uint(_2434.z), 0).xyzw;
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
        int3 _2454 = int3(_484, _490, 1);
        float4 _492 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2454.xy), uint(_2454.z), 0).xyzw;
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
            int _594 = as_type<int>(_572);
            int _596 = as_type<int>(_478);
            int _598 = 1584;
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
        int3 _2688 = int3(_666, _672, 0);
        float3 _674 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2688.xy), uint(_2688.z), 0).xyz;
        float _676 = _674.x;
        float _678 = _674.y;
        float _680 = _674.z;
        int _682 = _70;
        int _684 = 1;
        int _686 = _60(_682, _684, (*spvDescriptorSet0.support_buffer));
        int _688 = as_type<int>(_652);
        int _690 = 1;
        int _692 = _60(_688, _690, (*spvDescriptorSet0.support_buffer));
        int3 _2706 = int3(_686, _692, 2);
        float3 _694 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2706.xy), uint(_2706.z), 0).xyz;
        float _696 = _694.x;
        float _698 = _694.y;
        float _700 = _694.z;
        int _702 = _70;
        int _704 = 1;
        int _706 = _60(_702, _704, (*spvDescriptorSet0.support_buffer));
        int _708 = as_type<int>(_660);
        int _710 = 1;
        int _712 = _60(_708, _710, (*spvDescriptorSet0.support_buffer));
        int3 _2724 = int3(_706, _712, 0);
        float3 _714 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2724.xy), uint(_2724.z), 0).xyz;
        float _716 = _714.x;
        float _718 = _714.y;
        float _720 = _714.z;
        int _722 = _70;
        int _724 = 1;
        int _726 = _60(_722, _724, (*spvDescriptorSet0.support_buffer));
        int _728 = as_type<int>(_660);
        int _730 = 1;
        int _732 = _60(_728, _730, (*spvDescriptorSet0.support_buffer));
        int3 _2742 = int3(_726, _732, 2);
        float3 _734 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2742.xy), uint(_2742.z), 0).xyz;
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
        float _770 = 0.0;
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
        float _860 = -_678;
        float _862 = _860 + _718;
        float _864 = -_680;
        float _866 = _864 + _720;
        float _868 = -_700;
        float _870 = _868 + _740;
        float _872 = _536 * _848;
        float _874 = _522 * _848;
        float _876 = _534 * _848;
        float _878 = _520 * _848;
        float _880 = fma(_414, _840, _872);
        float _882 = fma(_410, _840, _874);
        float _884 = fma(_412, _840, _876);
        float _886 = fma(_408, _840, _878);
        float _888 = _880 * 2.0;
        int _890 = _103 + 20;
        uint _892 = uint(int(uint(_890) >> uint(2)));
        uint _894 = uint(int(uint(int(_892)) >> uint(2)));
        int _896 = int(_892) & 3;
        float _898 = (*spvDescriptorSet0.cp_c5)._m0[int(_894)][_896];
        float _900 = _882 * 2.0;
        float _902 = _886 * 2.0;
        float _904 = _884 * _888;
        float _906 = _886 * _888;
        float _908 = _882 * _888;
        float _910 = -_904;
        float _912 = fma(_886, _900, _910);
        float _914 = fma(_886, _900, _904);
        float _916 = fma(_884, _900, _906);
        float _918 = -_906;
        float _920 = fma(_884, _900, _918);
        float _922 = -_908;
        float _924 = fma(_884, _902, _922);
        float _926 = fma(_884, _902, _908);
        float _928 = _886 * _886;
        float _930 = _882 * _882;
        float _932 = _884 * _884;
        float _934 = -_676;
        float _936 = _934 + _716;
        float _938 = fma(_928, -2.0, 1.0);
        float _940 = fma(_930, -2.0, 1.0);
        float _942 = fma(_862, _858, _678);
        float _944 = fma(_936, _858, _676);
        float _946 = fma(_932, -2.0, _938);
        float _948 = fma(_932, -2.0, _940);
        float _950 = fma(_928, -2.0, _940);
        float _952 = -_696;
        float _954 = _952 + _736;
        float _956 = -_698;
        float _958 = _956 + _738;
        float _960 = _944 * _842;
        float _962 = fma(_866, _858, _680);
        float _964 = fma(_954, _858, _696);
        float _966 = fma(_958, _858, _698);
        float _968 = fma(_870, _858, _700);
        float _970 = fma(_416, _898, _960);
        float _972 = _942 * _842;
        float _974 = _962 * _842;
        float _976 = _964 * _842;
        float _978 = _966 * _842;
        float _980 = _968 * _842;
        float _982 = fma(_418, _898, _972);
        float _984 = fma(_420, _898, _974);
        float _986 = fma(_422, _898, _976);
        float _988 = fma(_424, _898, _978);
        float _990 = fma(_426, _898, _980);
        _430 = _970;
        _992 = _946;
        _994 = _914;
        _996 = _920;
        _998 = _982;
        _1000 = _912;
        _1002 = _948;
        _1004 = _926;
        _1006 = _984;
        _1008 = _916;
        _1010 = _924;
        _1012 = _950;
        _1014 = as_type<int>(_986);
        _432 = as_type<int>(_988);
        _434 = as_type<int>(_990);
        _1016 = _978;
        _1018 = true;
    }
    else
    {
        float _1020 = _414 * 2.0;
        float _1022 = _410 * 2.0;
        float _1024 = _408 * _408;
        float _1026 = _1020 * _412;
        float _1028 = _410 * _410;
        float _1030 = _1020 * _410;
        float _1032 = _1020 * _408;
        float _1034 = -_1026;
        float _1036 = fma(_1022, _408, _1034);
        float _1038 = fma(_1022, _408, _1026);
        float _1040 = _412 * _412;
        float _1042 = fma(_1024, -2.0, 1.0);
        float _1044 = _408 * 2.0;
        float _1046 = fma(_1028, -2.0, 1.0);
        float _1048 = fma(_1022, _412, _1032);
        float _1050 = fma(_1040, -2.0, _1042);
        float _1052 = -_1032;
        float _1054 = fma(_1022, _412, _1052);
        float _1056 = -_1030;
        float _1058 = fma(_1044, _412, _1056);
        float _1060 = fma(_1040, -2.0, _1046);
        float _1062 = fma(_1024, -2.0, _1046);
        float _1064 = fma(_1044, _412, _1030);
        _992 = _1050;
        _994 = _1038;
        _996 = _1054;
        _998 = _418;
        _1000 = _1036;
        _1002 = _1060;
        _1004 = _1064;
        _1006 = _420;
        _1008 = _1048;
        _1010 = _1058;
        _1012 = _1062;
        _1014 = as_type<int>(_422);
        _1016 = _1044;
    }
    _1018 = false;
    float _1066 = _430;
    float _1068 = _992;
    float _1070 = _994;
    float _1072 = _996;
    float _1074 = _998;
    float _1076 = _1000;
    float _1078 = _1002;
    float _1080 = _1004;
    float _1082 = _1006;
    float _1084 = _1008;
    float _1086 = _1010;
    float _1088 = _1012;
    int _1090 = _1014;
    int _1092 = _432;
    int _1094 = _434;
    float _1096 = _1016;
    float _1098 = _1066 * _1068;
    float _1100 = _1066 * _1070;
    float _1102 = _1066 * _1072;
    float _1104 = _1074 * _1076;
    float _1106 = _1074 * _1078;
    float _1108 = _1074 * _1080;
    int _1110 = _70 * 48;
    float _1112 = _1082 * _1084;
    float _1114 = _1082 * _1086;
    float _1116 = _1082 * _1088;
    int _1118 = _70 * 112;
    uint _1120 = uint(int(uint(_1110) >> uint(2)));
    _39[int(_1120)] = as_type<uint>(_1098);
    int _1122 = _1110 + 4;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    _39[int(_1124)] = as_type<uint>(_1104);
    int _1126 = _1110 + 8;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    _39[int(_1128)] = as_type<uint>(_1112);
    int _1130 = _1110 + 12;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    _39[int(_1132)] = uint(_1090);
    bool _1134 = _70 != 0;
    bool _1136 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1138 = _1110 + 16;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    _39[int(_1140)] = as_type<uint>(_1100);
    int _1142 = _1110 + 20;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    _39[int(_1144)] = as_type<uint>(_1106);
    int _1146 = _1110 + 24;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    _39[int(_1148)] = as_type<uint>(_1114);
    int _1150 = _1110 + 28;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    _39[int(_1152)] = uint(_1092);
    int _1154 = _1110 + 32;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    _39[int(_1156)] = as_type<uint>(_1102);
    int _1158 = _1110 + 36;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    _39[int(_1160)] = as_type<uint>(_1108);
    int _1162 = _1110 + 40;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    _39[int(_1164)] = as_type<uint>(_1116);
    int _1166 = _1110 + 44;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    _39[int(_1168)] = uint(_1094);
    float _1170 = _1066;
    float _1172 = _1082;
    float _1174 = _1096;
    float _1176 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _1178 = _1108;
    float _1180 = _1102;
    float _1182 = _1114;
    float _1184 = _1116;
    float _1186 = as_type<float>(_1092);
    float _1188 = as_type<float>(_1094);
    if (!_1134)
    {
        _436 = _1098;
    }
    float _1190 = _436;
    float _1192 = _1190;
    if (!_1134)
    {
        _1170 = _1104;
    }
    float _1194 = _1170;
    float _1196 = _1194;
    if (!_1134)
    {
        _438 = _1112;
    }
    float _1198 = _438;
    float _1200 = _1198;
    if (!_1134)
    {
        _1172 = as_type<float>(_1090);
    }
    float _1202 = _1172;
    float _1204 = _1202;
    if (!_1134)
    {
        _1174 = _1100;
    }
    float _1206 = _1174;
    float _1208 = _1206;
    if (!_1134)
    {
        _1176 = _1106;
    }
    float _1210 = _1176;
    float _1212 = _1210;
    if (!_1136)
    {
        int _1214 = _70 * 48;
        int _1216 = _1214 + 16;
        uint _1218 = uint(int(uint(_1214) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1218)] = as_type<uint>(_1098);
        int _1220 = _1214 + 4;
        uint _1222 = uint(int(uint(_1220) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1222)] = as_type<uint>(_1104);
        int _1224 = _1214 + 8;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1226)] = as_type<uint>(_1112);
        int _1228 = _1214 + 12;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1230)] = uint(_1090);
        int _1232 = _1214 + 32;
        uint _1234 = uint(int(uint(_1216) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1234)] = as_type<uint>(_1100);
        int _1236 = _1216 + 4;
        uint _1238 = uint(int(uint(_1236) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1238)] = as_type<uint>(_1106);
        int _1240 = _1216 + 8;
        uint _1242 = uint(int(uint(_1240) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1242)] = as_type<uint>(_1114);
        int _1244 = _1216 + 12;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1246)] = uint(_1092);
        uint _1248 = uint(int(uint(_1232) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1248)] = as_type<uint>(_1102);
        int _1250 = _1232 + 4;
        uint _1252 = uint(int(uint(_1250) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1252)] = as_type<uint>(_1108);
        int _1254 = _1232 + 8;
        uint _1256 = uint(int(uint(_1254) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1256)] = as_type<uint>(_1116);
        int _1258 = _1232 + 12;
        uint _1260 = uint(int(uint(_1258) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1260)] = uint(_1094);
    }
    bool _1262 = !_1134;
    if (!_1262)
    {
        bool _1264 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1266 = !_1264;
        if (!_1266)
        {
            uint _1268 = uint(int(uint(_1118) >> uint(2)));
            uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
            int _1272 = int(_1268) & 3;
            float _1274 = (*spvDescriptorSet0.cp_c6)._m0[int(_1270)][_1272];
            int _1276 = as_type<int>(_1274) * 48;
            int _1278 = 0;
            bool _1280;
            float _1376;
            float _1380;
            float _1384;
            float _1388;
            float _1402;
            float _1404;
            float _1416;
            float _1426;
            float _1428;
            float _1430;
            float _1432;
            float _1434;
            do
            {
                int _1282 = _1278;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1284 = uint(int(uint(_1276) >> uint(2)));
                float _1286 = as_type<float>(_39[int(_1284)]);
                int _1288 = _1276 + 4;
                uint _1290 = uint(int(uint(_1288) >> uint(2)));
                float _1292 = as_type<float>(_39[int(_1290)]);
                int _1294 = _1276 + 8;
                uint _1296 = uint(int(uint(_1294) >> uint(2)));
                float _1298 = as_type<float>(_39[int(_1296)]);
                int _1300 = _1276 + 12;
                uint _1302 = uint(int(uint(_1300) >> uint(2)));
                float _1304 = as_type<float>(_39[int(_1302)]);
                int _1306 = _1282 + 1;
                int _1308 = _1276 + 16;
                uint _1310 = uint(int(uint(_1308) >> uint(2)));
                float _1312 = as_type<float>(_39[int(_1310)]);
                int _1314 = _1276 + 20;
                uint _1316 = uint(int(uint(_1314) >> uint(2)));
                float _1318 = as_type<float>(_39[int(_1316)]);
                int _1320 = _1276 + 24;
                uint _1322 = uint(int(uint(_1320) >> uint(2)));
                float _1324 = as_type<float>(_39[int(_1322)]);
                int _1326 = _1276 + 28;
                uint _1328 = uint(int(uint(_1326) >> uint(2)));
                float _1330 = as_type<float>(_39[int(_1328)]);
                bool _1332 = uint(_1306) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1334 = _1276 + 32;
                uint _1336 = uint(int(uint(_1334) >> uint(2)));
                float _1338 = as_type<float>(_39[int(_1336)]);
                int _1340 = _1276 + 36;
                uint _1342 = uint(int(uint(_1340) >> uint(2)));
                float _1344 = as_type<float>(_39[int(_1342)]);
                int _1346 = _1276 + 40;
                uint _1348 = uint(int(uint(_1346) >> uint(2)));
                float _1350 = as_type<float>(_39[int(_1348)]);
                int _1352 = _1276 + 44;
                uint _1354 = uint(int(uint(_1352) >> uint(2)));
                float _1356 = as_type<float>(_39[int(_1354)]);
                float _1358 = _1292 * as_type<float>(_1092);
                float _1360 = _1100 * _1292;
                float _1362 = _1106 * _1292;
                float _1364 = _1114 * _1292;
                float _1366 = fma(_1286, as_type<float>(_1090), _1358);
                float _1368 = fma(_1098, _1286, _1360);
                float _1370 = fma(_1104, _1286, _1362);
                float _1372 = fma(_1112, _1286, _1364);
                float _1374 = fma(_1298, as_type<float>(_1094), _1366);
                _1376 = fma(_1102, _1298, _1368);
                float _1378 = _1100 * _1318;
                _1380 = fma(_1116, _1298, _1372);
                float _1382 = _1318 * as_type<float>(_1092);
                _1384 = _1304 + _1374;
                float _1386 = _1106 * _1318;
                _1388 = fma(_1108, _1298, _1370);
                float _1390 = fma(_1312, as_type<float>(_1090), _1382);
                float _1392 = fma(_1098, _1312, _1378);
                float _1394 = fma(_1104, _1312, _1386);
                float _1396 = _1114 * _1318;
                float _1398 = fma(_1324, as_type<float>(_1094), _1390);
                float _1400 = _1344 * as_type<float>(_1092);
                _1402 = fma(_1102, _1324, _1392);
                _1404 = fma(_1108, _1324, _1394);
                float _1406 = _1100 * _1344;
                float _1408 = _1106 * _1344;
                float _1410 = _1114 * _1344;
                float _1412 = fma(_1338, as_type<float>(_1090), _1400);
                float _1414 = fma(_1112, _1312, _1396);
                _1416 = _1330 + _1398;
                float _1418 = fma(_1098, _1338, _1406);
                float _1420 = fma(_1104, _1338, _1408);
                float _1422 = fma(_1112, _1338, _1410);
                float _1424 = fma(_1350, as_type<float>(_1094), _1412);
                _1426 = fma(_1116, _1324, _1414);
                _1428 = fma(_1102, _1350, _1418);
                _1430 = fma(_1108, _1350, _1420);
                _1432 = fma(_1116, _1350, _1422);
                _1434 = _1356 + _1424;
                uint _1436 = uint(int(uint(_1110) >> uint(2)));
                _39[int(_1436)] = as_type<uint>(_1376);
                int _1438 = _1110 + 4;
                uint _1440 = uint(int(uint(_1438) >> uint(2)));
                _39[int(_1440)] = as_type<uint>(_1388);
                int _1442 = _1110 + 8;
                uint _1444 = uint(int(uint(_1442) >> uint(2)));
                _39[int(_1444)] = as_type<uint>(_1380);
                int _1446 = _1110 + 12;
                uint _1448 = uint(int(uint(_1446) >> uint(2)));
                _39[int(_1448)] = as_type<uint>(_1384);
                int _1450 = _1110 + 16;
                uint _1452 = uint(int(uint(_1450) >> uint(2)));
                _39[int(_1452)] = as_type<uint>(_1402);
                int _1454 = _1110 + 20;
                uint _1456 = uint(int(uint(_1454) >> uint(2)));
                _39[int(_1456)] = as_type<uint>(_1404);
                int _1458 = _1110 + 24;
                uint _1460 = uint(int(uint(_1458) >> uint(2)));
                _39[int(_1460)] = as_type<uint>(_1426);
                int _1462 = _1110 + 28;
                uint _1464 = uint(int(uint(_1462) >> uint(2)));
                _39[int(_1464)] = as_type<uint>(_1416);
                int _1466 = _1110 + 32;
                uint _1468 = uint(int(uint(_1466) >> uint(2)));
                _39[int(_1468)] = as_type<uint>(_1428);
                int _1470 = _1110 + 36;
                uint _1472 = uint(int(uint(_1470) >> uint(2)));
                _39[int(_1472)] = as_type<uint>(_1430);
                int _1474 = _1110 + 40;
                uint _1476 = uint(int(uint(_1474) >> uint(2)));
                _39[int(_1476)] = as_type<uint>(_1432);
                int _1478 = _1110 + 44;
                uint _1480 = uint(int(uint(_1478) >> uint(2)));
                _39[int(_1480)] = as_type<uint>(_1434);
                _1280 = !_1332;
                _1278 = _1306;
            } while (_1280);
            _1212 = _1404;
            _1178 = _1430;
            _1196 = _1388;
            _1208 = _1402;
            _1180 = _1428;
            _1192 = _1376;
            _1182 = _1426;
            _1200 = _1380;
            _1184 = _1432;
            _1186 = _1416;
            _1204 = _1384;
            _1188 = _1434;
            _1482 = true;
        }
        else
        {
            _1212 = 0.0;
            _1178 = 0.0;
            _1196 = 0.0;
            _1208 = 0.0;
            _1180 = 0.0;
            _1192 = 0.0;
            _1182 = 0.0;
            _1200 = 0.0;
            _1184 = 0.0;
            _1186 = 0.0;
            _1204 = 0.0;
            _1188 = 0.0;
        }
    }
    _1482 = false;
    float _1484 = _1212;
    float _1486 = _1178;
    float _1488 = _1196;
    float _1490 = _1208;
    float _1492 = _1180;
    float _1494 = _1192;
    float _1496 = _1182;
    float _1498 = _1200;
    float _1500 = _1184;
    float _1502 = _1186;
    float _1504 = _1204;
    float _1506 = _1188;
    int _1508 = _1118 + 80;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.cp_c6)._m0[int(_1512)][_1514];
    int _1518 = int(_1510) + 1;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    int _1522 = _1518 & 3;
    float _1524 = (*spvDescriptorSet0.cp_c6)._m0[int(_1520)][_1522];
    int _1526 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1528 = _1526 + _70;
    int _1530 = _1118 + 64;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
    int _1536 = int(_1532) & 3;
    float _1538 = (*spvDescriptorSet0.cp_c6)._m0[int(_1534)][_1536];
    int _1540 = int(_1532) + 1;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    int _1544 = _1540 & 3;
    float _1546 = (*spvDescriptorSet0.cp_c6)._m0[int(_1542)][_1544];
    int _1548 = _1528 * 48;
    int _1550 = _1118 + 88;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
    int _1556 = int(_1552) & 3;
    float _1558 = (*spvDescriptorSet0.cp_c6)._m0[int(_1554)][_1556];
    int _1560 = int(_1552) + 1;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    int _1564 = _1560 & 3;
    float _1566 = (*spvDescriptorSet0.cp_c6)._m0[int(_1562)][_1564];
    int _1568 = _1118 + 72;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.cp_c6)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.cp_c6)._m0[int(_1580)][_1582];
    int _1586 = _1118 + 96;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.cp_c6)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.cp_c6)._m0[int(_1598)][_1600];
    int _1604 = _1118 + 104;
    uint _1606 = uint(int(uint(_1604) >> uint(2)));
    uint _1608 = uint(int(uint(int(_1606)) >> uint(2)));
    int _1610 = int(_1606) & 3;
    float _1612 = (*spvDescriptorSet0.cp_c6)._m0[int(_1608)][_1610];
    int _1614 = int(_1606) + 1;
    uint _1616 = uint(int(uint(_1614) >> uint(2)));
    int _1618 = _1614 & 3;
    float _1620 = (*spvDescriptorSet0.cp_c6)._m0[int(_1616)][_1618];
    float _1622 = _1484 * _1516;
    float _1624 = _1486 * _1516;
    int _1626 = _1118 + 16;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    uint _1630 = uint(int(uint(int(_1628)) >> uint(2)));
    int _1632 = int(_1628) & 3;
    float _1634 = (*spvDescriptorSet0.cp_c6)._m0[int(_1630)][_1632];
    int _1636 = int(_1628) + 1;
    uint _1638 = uint(int(uint(_1636) >> uint(2)));
    int _1640 = _1636 & 3;
    float _1642 = (*spvDescriptorSet0.cp_c6)._m0[int(_1638)][_1640];
    float _1644 = _1488 * _1516;
    float _1646 = fma(_1490, _1538, _1622);
    float _1648 = _1488 * _1524;
    int _1650 = _1118 + 32;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.cp_c6)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.cp_c6)._m0[int(_1662)][_1664];
    float _1668 = fma(_1492, _1538, _1624);
    float _1670 = _1484 * _1524;
    float _1672 = fma(_1494, _1546, _1648);
    float _1674 = _1486 * _1524;
    float _1676 = fma(_1494, _1538, _1644);
    float _1678 = _1488 * _1558;
    float _1680 = _1488 * _1566;
    int _1682 = _1118 + 48;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    uint _1686 = uint(int(uint(int(_1684)) >> uint(2)));
    int _1688 = int(_1684) & 3;
    float _1690 = (*spvDescriptorSet0.cp_c6)._m0[int(_1686)][_1688];
    int _1692 = int(_1684) + 1;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    int _1696 = _1692 & 3;
    float _1698 = (*spvDescriptorSet0.cp_c6)._m0[int(_1694)][_1696];
    float _1700 = _1484 * _1558;
    float _1702 = _1484 * _1566;
    float _1704 = _1486 * _1558;
    float _1706 = _1486 * _1566;
    float _1708 = fma(_1490, _1546, _1670);
    float _1710 = fma(_1492, _1546, _1674);
    float _1712 = fma(_1494, _1576, _1678);
    int _1714 = _1118 + 24;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.cp_c6)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.cp_c6)._m0[int(_1726)][_1728];
    float _1732 = fma(_1494, _1584, _1680);
    float _1734 = fma(_1490, _1576, _1700);
    float _1736 = fma(_1490, _1584, _1702);
    float _1738 = fma(_1492, _1576, _1704);
    float _1740 = fma(_1492, _1584, _1706);
    float _1742 = fma(_1496, _1594, _1646);
    float _1744 = fma(_1496, _1602, _1708);
    int _1746 = _1118 + 40;
    uint _1748 = uint(int(uint(_1746) >> uint(2)));
    uint _1750 = uint(int(uint(int(_1748)) >> uint(2)));
    int _1752 = int(_1748) & 3;
    float _1754 = (*spvDescriptorSet0.cp_c6)._m0[int(_1750)][_1752];
    int _1756 = int(_1748) + 1;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    int _1760 = _1756 & 3;
    float _1762 = (*spvDescriptorSet0.cp_c6)._m0[int(_1758)][_1760];
    float _1764 = fma(_1498, _1602, _1672);
    float _1766 = fma(_1500, _1594, _1668);
    float _1768 = fma(_1500, _1602, _1710);
    float _1770 = fma(_1498, _1594, _1676);
    float _1772 = fma(_1496, _1612, _1734);
    float _1774 = fma(_1496, _1620, _1736);
    int _1776 = _1118 + 56;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
    int _1782 = int(_1778) & 3;
    float _1784 = (*spvDescriptorSet0.cp_c6)._m0[int(_1780)][_1782];
    int _1786 = int(_1778) + 1;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    int _1790 = _1786 & 3;
    float _1792 = (*spvDescriptorSet0.cp_c6)._m0[int(_1788)][_1790];
    float _1794 = fma(_1498, _1620, _1732);
    float _1796 = fma(_1500, _1620, _1740);
    float _1798 = _1774 + _1502;
    float _1800 = fma(_1500, _1612, _1738);
    float _1802 = _1794 + _1504;
    float _1804 = fma(_1498, _1612, _1712);
    float _1806 = _1796 + _1506;
    float _1808 = _1798 * _1642;
    float _1810 = _1744 * _1642;
    float _1812 = _1772 * _1642;
    float _1814 = _1742 * _1642;
    float _1816 = fma(_1802, _1634, _1808);
    float _1818 = fma(_1764, _1634, _1810);
    float _1820 = fma(_1804, _1634, _1812);
    float _1822 = fma(_1770, _1634, _1814);
    float _1824 = _1798 * _1666;
    float _1826 = _1742 * _1666;
    float _1828 = _1744 * _1666;
    float _1830 = _1772 * _1666;
    float _1832 = fma(_1802, _1658, _1824);
    float _1834 = fma(_1770, _1658, _1826);
    float _1836 = fma(_1764, _1658, _1828);
    float _1838 = fma(_1804, _1658, _1830);
    float _1840 = _1798 * _1698;
    float _1842 = _1744 * _1698;
    float _1844 = _1742 * _1698;
    float _1846 = _1772 * _1698;
    float _1848 = fma(_1802, _1690, _1840);
    float _1850 = fma(_1764, _1690, _1842);
    float _1852 = fma(_1770, _1690, _1844);
    float _1854 = fma(_1804, _1690, _1846);
    float _1856 = fma(_1806, _1722, _1816);
    float _1858 = fma(_1768, _1722, _1818);
    float _1860 = fma(_1800, _1722, _1820);
    float _1862 = fma(_1766, _1722, _1822);
    float _1864 = _1856 + _1730;
    int _1866 = _1548 + 16;
    int _1868 = _1548 + 32;
    float _1870 = fma(_1806, _1754, _1832);
    float _1872 = fma(_1766, _1754, _1834);
    float _1874 = fma(_1768, _1754, _1836);
    float _1876 = fma(_1800, _1754, _1838);
    float _1878 = _1870 + _1762;
    int _1880 = _1548 + 48;
    uint _1882 = uint(int(uint(_1866) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1882)] = as_type<uint>(_1862);
    int _1884 = _1866 + 4;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1886)] = as_type<uint>(_1858);
    int _1888 = _1866 + 8;
    uint _1890 = uint(int(uint(_1888) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1890)] = as_type<uint>(_1860);
    int _1892 = _1866 + 12;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1894)] = as_type<uint>(_1864);
    float _1896 = fma(_1806, _1784, _1848);
    float _1898 = fma(_1766, _1784, _1852);
    float _1900 = fma(_1768, _1784, _1850);
    float _1902 = fma(_1800, _1784, _1854);
    float _1904 = _1896 + _1792;
    uint _1906 = uint(int(uint(_1868) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1906)] = as_type<uint>(_1872);
    int _1908 = _1868 + 4;
    uint _1910 = uint(int(uint(_1908) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1910)] = as_type<uint>(_1874);
    int _1912 = _1868 + 8;
    uint _1914 = uint(int(uint(_1912) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1914)] = as_type<uint>(_1876);
    int _1916 = _1868 + 12;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1918)] = as_type<uint>(_1878);
    uint _1920 = uint(int(uint(_1880) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1920)] = as_type<uint>(_1898);
    int _1922 = _1880 + 4;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1924)] = as_type<uint>(_1900);
    int _1926 = _1880 + 8;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1928)] = as_type<uint>(_1902);
    int _1930 = _1880 + 12;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1932)] = as_type<uint>(_1904);
}

