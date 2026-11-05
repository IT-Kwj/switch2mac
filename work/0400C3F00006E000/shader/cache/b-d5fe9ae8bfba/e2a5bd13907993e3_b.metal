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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _5071, thread const int& _5072, constant _10& support_buffer)
{
    int _5075 = 1 + _5072;
    float _5077 = support_buffer._m5[_5075].x;
    bool _5079 = _5077 == 1.0;
    if (_5079)
    {
        return _5071;
    }
    float _5081 = float(_5071);
    float _5083 = _5081 * _5077;
    int _5085 = int(_5083);
    return _5085;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4759, thread const int& _4760, thread const int& _4761, thread const int& _4762, thread int& _4763, thread int& _4764, thread int& _4765, thread int& _4766, thread int& _4767, thread int& _4768)
{
    float _4771 = as_type<float>(_4760) + 0.0;
    bool _4773 = _4771 != 0.0;
    bool _4775 = isnan(_4771);
    bool _4777 = _4773 || _4775;
    bool _4779 = isnan(0.0);
    bool _4781 = _4777 || _4779;
    int _4783 = as_type<int>(_4771);
    int _4785 = _4760;
    int _4787 = _4761;
    int _4789 = _4781 ? (-1) : 0;
    if (!_4781)
    {
        float _4791 = as_type<float>(_4760) * 1.0;
        _4783 = as_type<int>(_4791);
    }
    int _4793 = _4783;
    bool _4795 = !_4781;
    int _4797 = _4793;
    if (!_4795)
    {
        float _4799 = as_type<float>(_4760) + 0.0;
        bool _4801 = _4799 >= 0.0;
        bool _4803 = isnan(_4799);
        bool _4805 = _4801 || _4803;
        bool _4807 = isnan(0.0);
        bool _4809 = _4805 || _4807;
        int _4811 = as_type<int>(_4799);
        _4789 = _4809 ? (-1) : 0;
        if (!_4809)
        {
            _4811 = 2147483647;
        }
        int _4813 = _4811;
        bool _4815 = !_4809;
        _4797 = _4813;
        if (!_4815)
        {
            float _4817 = as_type<float>(_4760) + 0.0;
            bool _4819 = _4817 > as_type<float>(0x7f800000u /* inf */);
            bool _4821 = isnan(_4817);
            bool _4823 = _4819 || _4821;
            bool _4825 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4827 = _4823 || _4825;
            int _4829 = as_type<int>(_4817);
            _4789 = _4827 ? (-1) : 0;
            if (_4827)
            {
                float _4831 = as_type<float>(_4760) + 1.0;
                _4829 = as_type<int>(_4831);
            }
            int _4833 = _4829;
            _4797 = _4833;
            if (!_4827)
            {
                float _4835 = 0.0 + as_type<float>(_4760);
                bool _4837 = _4835 != as_type<float>(0x7f800000u /* inf */);
                bool _4839 = isnan(_4835);
                bool _4841 = _4837 || _4839;
                bool _4843 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4845 = _4841 || _4843;
                int _4847 = as_type<int>(_4835);
                _4789 = _4845 ? (-1) : 0;
                if (!_4845)
                {
                    _4847 = _4760;
                }
                int _4849 = _4847;
                bool _4851 = !_4845;
                _4797 = _4849;
                if (!_4851)
                {
                    float _4853 = as_type<float>(_4760) * 18446744073709551616.0;
                    float _4855 = rsqrt(_4853);
                    float _4857 = _4853 * _4855;
                    float _4859 = _4855 * 0.5;
                    float _4861 = -_4857;
                    float _4863 = 0.0 + _4861;
                    float _4865 = fma(_4859, _4863, 0.5);
                    float _4867 = fma(_4857, _4865, _4857);
                    float _4869 = -_4867;
                    float _4871 = 0.0 + _4869;
                    float _4873 = fma(_4867, _4871, _4853);
                    float _4875 = fma(_4859, _4873, _4867);
                    float _4877 = _4875 * 2.3283064365386962890625e-10;
                    _4797 = as_type<int>(_4877);
                    _4785 = as_type<int>(_4863);
                    _4787 = as_type<int>(_4867);
                }
            }
        }
    }
    int _4879 = _4797;
    int _4881 = _4785;
    int _4883 = _4787;
    int _4885 = _4789;
    _4763 = _4879;
    _4764 = _4762;
    _4765 = 0;
    _4766 = _4881;
    _4767 = _4883;
    _4768 = _4885;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _932 = false;
    bool _610 = false;
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
        int _86 = 0;
        float _88 = 0.0;
        float _90 = 0.0;
        float _92 = 0.0;
        float _94 = 0.0;
        float _96 = 0.0;
        float _98 = 0.0;
        float _100 = 0.0;
        int _102 = 0;
        float _104 = 0.0;
        float _106 = 0.0;
        float _108 = 0.0;
        int _110 = 0;
        int _112 = 0;
        float _114 = 0.0;
        float _116 = 0.0;
        float _118 = 0.0;
        float _120 = 0.0;
        float _122 = 0.0;
        float _124 = 0.0;
        float _126 = 0.0;
        int _128 = 0;
        bool _130;
        int _594;
        int _596;
        int _598;
        int _600;
        int _602;
        int _604;
        float _606;
        float _608;
        float _896;
        float _898;
        int _900;
        float _902;
        float _904;
        float _906;
        float _908;
        float _910;
        float _912;
        float _914;
        float _916;
        float _918;
        float _920;
        float _922;
        float _924;
        int _926;
        int _928;
        int _930;
        do
        {
            int _132 = _82;
            float _134 = _84;
            int _136 = _86;
            float _138 = _88;
            float _140 = _90;
            float _142 = _92;
            float _144 = _94;
            float _146 = _96;
            float _148 = _98;
            float _150 = _100;
            int _152 = _102;
            float _154 = _104;
            float _156 = _106;
            float _158 = _108;
            int _160 = _110;
            int _162 = _112;
            float _164 = _114;
            float _166 = _116;
            float _168 = _118;
            float _170 = _120;
            float _172 = _122;
            float _174 = _124;
            float _176 = _126;
            int _178 = _128;
            uint _181 = uint(int(uint(_78) >> uint(2)));
            uint _183 = uint(int(uint(int(_181)) >> uint(2)));
            int _185 = int(_181) & 3;
            float _187 = (*spvDescriptorSet0.cp_c4)._m0[int(_183)][_185];
            int _189 = _132 & 31;
            bool _191 = _189 == 0;
            bool _193 = uint(_189) < 32u;
            int _195 = 32 - _189;
            int _197 = _189 - 32;
            int _199 = 1 << _189;
            uint _201 = uint(int(uint(0) >> uint(_195)));
            int _203 = _199 | int(_201);
            int _205 = _191 ? 1 : _203;
            bool _207 = uint(_197) < 32u;
            int _209 = 0 << _197;
            int _211 = _207 ? _209 : 0;
            int _213 = _193 ? _205 : _211;
            int _215 = as_type<int>(_187) * 48;
            int _217 = _215 + 36;
            uint _219 = uint(int(uint(_217) >> uint(2)));
            uint _221 = uint(int(uint(int(_219)) >> uint(2)));
            int _223 = int(_219) & 3;
            float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
            int _227 = _215 + 32;
            uint _229 = uint(int(uint(_227) >> uint(2)));
            uint _231 = uint(int(uint(int(_229)) >> uint(2)));
            int _233 = int(_229) & 3;
            float _235 = (*spvDescriptorSet0.cp_c5)._m0[int(_231)][_233];
            int _237 = _213 & as_type<int>(_225);
            bool _239 = _237 != 0;
            int _241 = _213 & as_type<int>(_235);
            bool _243 = _241 != 0;
            float _245 = _134;
            float _247 = _138;
            float _249 = _146;
            float _251 = _235;
            float _253 = _166;
            float _255 = _170;
            float _257 = _168;
            float _259 = _176;
            float _261 = _172;
            float _263 = _174;
            float _265 = _156;
            float _267 = _158;
            float _269 = _154;
            int _271 = _160;
            int _273 = _162;
            float _275 = _164;
            int _277 = _178;
            if (_239)
            {
                int _279 = _215 + 8;
                uint _281 = uint(int(uint(_279) >> uint(2)));
                uint _283 = uint(int(uint(int(_281)) >> uint(2)));
                int _285 = int(_281) & 3;
                float _287 = (*spvDescriptorSet0.cp_c5)._m0[int(_283)][_285];
                _245 = _287;
            }
            float _289 = _245;
            if (_239)
            {
                _247 = 1.4012984643248170709237295832899e-45;
            }
            float _291 = _247;
            int _293 = _136;
            if (_243)
            {
                uint _295 = uint(int(uint(_215) >> uint(2)));
                uint _297 = uint(int(uint(int(_295)) >> uint(2)));
                int _299 = int(_295) & 3;
                float _301 = (*spvDescriptorSet0.cp_c5)._m0[int(_297)][_299];
                _293 = as_type<int>(_301);
            }
            int _303 = _293;
            if (_243)
            {
                _249 = 2.8025969286496341418474591665798e-45;
            }
            float _305 = _249;
            if (_243)
            {
                _251 = 1.4012984643248170709237295832899e-45;
            }
            float _307 = _251;
            float _309 = _291;
            float _311 = as_type<float>(_132);
            float _313 = _140;
            float _315 = _142;
            float _317 = _289;
            if (_239)
            {
                int _319 = _132;
                int _321 = 0;
                int _323 = _58(_319, _321, (*spvDescriptorSet0.support_buffer));
                int _325 = as_type<int>(_289);
                int _327 = 0;
                int _329 = _58(_325, _327, (*spvDescriptorSet0.support_buffer));
                int3 _2204 = int3(_323, _329, as_type<int>(_291));
                float4 _332 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2204.xy), uint(_2204.z), 0).xyzw;
                float _334 = _332.x;
                float _336 = _332.y;
                float _338 = _332.z;
                float _340 = _332.w;
                _309 = _334;
                _311 = _336;
                _313 = _338;
                _315 = _340;
            }
            float _342 = _309;
            float _344 = _311;
            float _346 = _313;
            float _348 = _315;
            float _350 = 0.0;
            float _352 = as_type<float>(_132);
            float _354 = _144;
            if (_243)
            {
                int _356 = _132;
                int _358 = 1;
                int _360 = _58(_356, _358, (*spvDescriptorSet0.support_buffer));
                int _362 = _303;
                int _364 = 1;
                int _366 = _58(_362, _364, (*spvDescriptorSet0.support_buffer));
                int3 _2237 = int3(_360, _366, 0);
                float3 _370 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2237.xy), uint(_2237.z), 0).xyz;
                float _372 = _370.x;
                float _374 = _370.y;
                float _376 = _370.z;
                _350 = _372;
                _352 = _374;
                _354 = _376;
            }
            float _378 = _350;
            float _380 = _352;
            float _382 = _354;
            float _384 = _305;
            float _386 = as_type<float>(_132);
            float _388 = _148;
            if (_243)
            {
                int _390 = _132;
                int _392 = 1;
                int _394 = _58(_390, _392, (*spvDescriptorSet0.support_buffer));
                int _396 = _303;
                int _398 = 1;
                int _400 = _58(_396, _398, (*spvDescriptorSet0.support_buffer));
                int3 _2269 = int3(_394, _400, as_type<int>(_305));
                float3 _402 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2269.xy), uint(_2269.z), 0).xyz;
                float _404 = _402.x;
                float _406 = _402.y;
                float _408 = _402.z;
                _384 = _404;
                _386 = _406;
                _388 = _408;
            }
            float _410 = _384;
            float _412 = _386;
            float _414 = _388;
            float _416 = _225;
            float _418 = as_type<float>(_213);
            float _420 = _150;
            int _422 = _152;
            if (_243)
            {
                int _424 = _132;
                int _426 = 1;
                int _428 = _58(_424, _426, (*spvDescriptorSet0.support_buffer));
                int _430 = _303;
                int _432 = 1;
                int _434 = _58(_430, _432, (*spvDescriptorSet0.support_buffer));
                int3 _2302 = int3(_428, _434, as_type<int>(_307));
                float4 _436 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2302.xy), uint(_2302.z), 0).xyzw;
                float _438 = _436.x;
                float _440 = _436.y;
                float _442 = _436.z;
                float _444 = _436.w;
                _416 = _438;
                _418 = _440;
                _420 = _442;
                _422 = as_type<int>(_444);
            }
            float _446 = _416;
            float _448 = _418;
            float _450 = _420;
            int _452 = _422;
            if (!_243)
            {
                _253 = 0.0;
                _255 = 0.0;
            }
            float _454 = _253;
            float _456 = _255;
            float _458 = _454;
            float _460 = _456;
            if (!_243)
            {
                _257 = 0.0;
                _259 = 0.0;
            }
            float _462 = _257;
            float _464 = _259;
            float _466 = _462;
            float _468 = _464;
            if (!_243)
            {
                _261 = 0.0;
                _263 = 0.0;
            }
            float _470 = _261;
            float _472 = _263;
            float _474 = _470;
            float _476 = _472;
            if (!_243)
            {
                _265 = 0.0;
            }
            float _478 = _265;
            float _480 = _478;
            if (!_243)
            {
                _267 = 0.0;
                _317 = 0.0;
            }
            float _482 = _267;
            float _484 = _317;
            float _486 = _482;
            float _488 = _484;
            if (!_243)
            {
                _269 = 0.0;
            }
            float _490 = _269;
            bool _492 = !_243;
            _88 = _342;
            _90 = _346;
            _92 = _348;
            float _494 = _490;
            if (!_492)
            {
                _494 = _448;
                _480 = _446;
                _486 = _450;
                _488 = as_type<float>(_452);
                _458 = _378;
                _466 = _380;
                _460 = _382;
                _474 = _410;
                _476 = _412;
                _468 = _414;
            }
            float _496 = _494;
            float _498 = _480;
            float _500 = _486;
            float _502 = _488;
            float _504 = _458;
            float _506 = _466;
            float _508 = _460;
            float _510 = _474;
            float _512 = _476;
            float _514 = _468;
            bool _516 = !_239;
            _126 = _514;
            float _518 = _504;
            float _520 = _506;
            float _522 = _508;
            float _524 = _504;
            float _526 = _506;
            float _528 = _508;
            if (!_516)
            {
                float _530 = _344 * _496;
                float _532 = fma(_342, _498, _530);
                float _534 = fma(_346, _500, _532);
                float _536 = fma(_348, _502, _534);
                float _538 = precise::max(_536, -1.0);
                float _540 = precise::min(_538, 1.0);
                bool _542 = _540 >= 0.0;
                bool _544 = isnan(_540);
                bool _546 = _542 || _544;
                bool _548 = isnan(0.0);
                bool _550 = _546 || _548;
                bool _552 = !_550;
                float _554 = -_540;
                float _556 = _552 ? _554 : _540;
                bool _558 = _556 < 0.0;
                float _560 = float(_558);
                float _562 = abs(_556);
                float _564 = -_562;
                float _566 = _564 + 1.0;
                float _568 = abs(_556);
                float _570 = fma(_568, -0.0187292993068695068359375, 0.074261002242565155029296875);
                int _572 = as_type<int>(_566) + (-218103808);
                float _574 = abs(_556);
                float _576 = fma(_574, _570, -0.212114393711090087890625);
                bool _578 = uint(_572) >= 1920991232u;
                float _580 = abs(_556);
                float _582 = fma(_580, _576, 1.570728778839111328125);
                bool _584 = !_578;
                if (!_584)
                {
                    int _586 = _572;
                    int _588 = as_type<int>(_566);
                    int _590 = _452;
                    int _592 = 1152;
                    _56(_586, _588, _590, _592, _594, _596, _598, _600, _602, _604);
                    _606 = as_type<float>(_594);
                    _608 = as_type<float>(_596);
                    _610 = true;
                }
                else
                {
                    float _612 = rsqrt(_566);
                    float _614 = _566 * _612;
                    float _616 = _612 * 0.5;
                    float _618 = -_614;
                    float _620 = 0.0 + _618;
                    float _622 = fma(_616, _620, 0.5);
                    float _624 = fma(_614, _622, _614);
                    float _626 = -_624;
                    float _628 = 0.0 + _626;
                    float _630 = fma(_624, _628, _566);
                    float _632 = fma(_616, _630, _624);
                    _606 = _632;
                    _608 = _630;
                }
                _610 = false;
                float _634 = _606;
                float _636 = _608;
                int _638 = _215 + 8;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                uint _642 = uint(int(uint(int(_640)) >> uint(2)));
                int _644 = int(_640) & 3;
                float _646 = (*spvDescriptorSet0.cp_c5)._m0[int(_642)][_644];
                int _648 = _132;
                int _650 = 0;
                int _652 = _58(_648, _650, (*spvDescriptorSet0.support_buffer));
                int _654 = as_type<int>(_646);
                int _656 = 0;
                int _658 = _58(_654, _656, (*spvDescriptorSet0.support_buffer));
                int3 _2565 = int3(_652, _658, 0);
                float3 _660 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2565.xy), uint(_2565.z), 0).xyz;
                float _662 = _660.x;
                float _664 = _660.y;
                float _666 = _660.z;
                int _668 = _132;
                int _670 = 0;
                int _672 = _58(_668, _670, (*spvDescriptorSet0.support_buffer));
                int _674 = as_type<int>(_646);
                int _676 = 0;
                int _678 = _58(_674, _676, (*spvDescriptorSet0.support_buffer));
                int3 _2583 = int3(_672, _678, 2);
                float3 _680 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2583.xy), uint(_2583.z), 0).xyz;
                float _682 = _680.x;
                float _684 = _680.y;
                float _686 = _680.z;
                float _688 = _582 * _634;
                float _690 = _560 * 2.0;
                int _692 = _215 + 20;
                uint _694 = uint(int(uint(_692) >> uint(2)));
                uint _696 = uint(int(uint(int(_694)) >> uint(2)));
                int _698 = int(_694) & 3;
                float _700 = (*spvDescriptorSet0.cp_c5)._m0[int(_696)][_698];
                float _702 = -_690;
                float _704 = fma(_688, _702, _688);
                float _706 = fma(_560, 3.1415927410125732421875, _704);
                float _708 = _706 * 0.15915493667125701904296875;
                float _710 = _708 * 6.283185482025146484375;
                float _712 = sin(_710);
                float _714 = abs(_712);
                bool _716 = _714 >= 0.001000000047497451305389404296875;
                bool _718 = isnan(_714);
                bool _720 = _716 || _718;
                bool _722 = isnan(0.001000000047497451305389404296875);
                bool _724 = _720 || _722;
                float _726 = _164;
                float _728 = _636;
                float _730 = _688;
                if (!_724)
                {
                    int _732 = _215 + 28;
                    uint _734 = uint(int(uint(_732) >> uint(2)));
                    uint _736 = uint(int(uint(int(_734)) >> uint(2)));
                    int _738 = int(_734) & 3;
                    float _740 = (*spvDescriptorSet0.cp_c5)._m0[int(_736)][_738];
                    _726 = _740;
                }
                float _742 = _726;
                float _744 = _742;
                float _746 = _742;
                if (!_724)
                {
                    float _748 = -_742;
                    float _750 = _748 + 1.0;
                    _728 = _750;
                }
                float _752 = _728;
                float _754 = _752;
                if (!_724)
                {
                    _730 = _742;
                }
                float _756 = _730;
                bool _758 = !_724;
                float _760 = _756;
                _271 = as_type<int>(_686);
                _273 = as_type<int>(_700);
                if (!_758)
                {
                    int _762 = _215 + 28;
                    uint _764 = uint(int(uint(_762) >> uint(2)));
                    uint _766 = uint(int(uint(int(_764)) >> uint(2)));
                    int _768 = int(_764) & 3;
                    float _770 = (*spvDescriptorSet0.cp_c5)._m0[int(_766)][_768];
                    float _772 = 1.0 / _712;
                    float _774 = _706 * _770;
                    float _776 = _774 * 0.15915493667125701904296875;
                    float _778 = -_774;
                    float _780 = _706 + _778;
                    float _782 = _780 * 0.15915493667125701904296875;
                    float _784 = _776 * 6.283185482025146484375;
                    float _786 = sin(_784);
                    float _788 = _782 * 6.283185482025146484375;
                    float _790 = sin(_788);
                    float _792 = _786 * _772;
                    float _794 = _790 * _772;
                    _744 = _770;
                    _760 = _792;
                    _746 = _770;
                    _754 = _794;
                }
                float _796 = _744;
                float _798 = _760;
                float _800 = _746;
                float _802 = _754;
                bool _804 = !_550;
                float _806 = -_798;
                float _808 = _804 ? _806 : _798;
                float _810 = _682 * _800;
                float _812 = _684 * _800;
                float _814 = _348 * _808;
                float _816 = _342 * _808;
                float _818 = _344 * _808;
                float _820 = _346 * _808;
                float _822 = fma(_502, _802, _814);
                float _824 = fma(_498, _802, _816);
                float _826 = fma(_496, _802, _818);
                float _828 = fma(_500, _802, _820);
                float _830 = _822 * 2.0;
                float _832 = _824 * 2.0;
                float _834 = _824 * _824;
                float _836 = _826 * _826;
                float _838 = _828 * _830;
                float _840 = _826 * _830;
                float _842 = _824 * _830;
                float _844 = _826 * 2.0;
                float _846 = -_838;
                float _848 = fma(_826, _832, _846);
                float _850 = fma(_826, _832, _838);
                float _852 = fma(_828, _832, _840);
                float _854 = -_840;
                float _856 = fma(_828, _832, _854);
                float _858 = fma(_834, -2.0, 1.0);
                float _860 = _662 * _800;
                float _862 = _828 * _828;
                float _864 = -_842;
                float _866 = fma(_828, _844, _864);
                float _868 = fma(_828, _844, _842);
                float _870 = fma(_836, -2.0, 1.0);
                float _872 = fma(_836, -2.0, _858);
                float _874 = fma(_504, _700, _860);
                float _876 = _664 * _800;
                float _878 = _666 * _800;
                float _880 = _686 * _800;
                float _882 = fma(_862, -2.0, _870);
                float _884 = fma(_862, -2.0, _858);
                float _886 = fma(_506, _700, _876);
                float _888 = fma(_508, _700, _878);
                float _890 = fma(_510, _700, _810);
                float _892 = fma(_512, _700, _812);
                float _894 = fma(_514, _700, _880);
                _896 = _866;
                _898 = _848;
                _900 = as_type<int>(_894);
                _902 = _852;
                _904 = _882;
                _906 = _884;
                _275 = _796;
                _518 = _874;
                _520 = _886;
                _522 = _888;
                _524 = _874;
                _908 = _856;
                _910 = _882;
                _912 = _850;
                _526 = _886;
                _914 = _848;
                _916 = _884;
                _918 = _868;
                _528 = _888;
                _920 = _852;
                _922 = _866;
                _924 = _872;
                _926 = as_type<int>(_890);
                _928 = as_type<int>(_892);
                _930 = as_type<int>(_894);
                _277 = 1073741824;
                _932 = true;
            }
            else
            {
                float _934 = _502 * 2.0;
                float _936 = _498 * _498;
                float _938 = _498 * 2.0;
                float _940 = _496 * _496;
                float _942 = _934 * _500;
                float _944 = _934 * _496;
                float _946 = _934 * _498;
                float _948 = _496 * 2.0;
                float _950 = _500 * _500;
                float _952 = fma(_936, -2.0, 1.0);
                float _954 = -_942;
                float _956 = fma(_938, _496, _954);
                float _958 = fma(_938, _496, _942);
                float _960 = fma(_940, -2.0, 1.0);
                float _962 = fma(_938, _500, _944);
                float _964 = -_944;
                float _966 = fma(_938, _500, _964);
                float _968 = -_946;
                float _970 = fma(_948, _500, _968);
                float _972 = fma(_948, _500, _946);
                float _974 = fma(_950, -2.0, _952);
                float _976 = fma(_940, -2.0, _952);
                float _978 = fma(_950, -2.0, _960);
                _896 = _970;
                _898 = _956;
                _900 = as_type<int>(_514);
                _902 = _962;
                _904 = _978;
                _906 = _974;
                _908 = _966;
                _910 = _978;
                _912 = _958;
                _914 = _956;
                _916 = _974;
                _918 = _972;
                _920 = _962;
                _922 = _970;
                _924 = _976;
                _926 = as_type<int>(_510);
                _928 = as_type<int>(_512);
                _930 = as_type<int>(_514);
            }
            _932 = false;
            float _980 = _896;
            float _982 = _898;
            int _984 = _900;
            float _986 = _902;
            float _988 = _904;
            float _990 = _906;
            int _992 = _271;
            int _994 = _273;
            float _996 = _275;
            float _998 = _518;
            float _1000 = _520;
            float _1002 = _522;
            float _1004 = _524;
            float _1006 = _908;
            float _1008 = _910;
            float _1010 = _912;
            float _1012 = _526;
            float _1014 = _914;
            float _1016 = _916;
            float _1018 = _918;
            float _1020 = _528;
            float _1022 = _920;
            float _1024 = _922;
            float _1026 = _924;
            int _1028 = _926;
            int _1030 = _928;
            int _1032 = _930;
            int _1034 = _277;
            float _1036 = _1004 * _1006;
            int _1038 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1040 = _1038 + _132;
            float _1042 = _1004 * _1008;
            float _1044 = _1004 * _1010;
            float _1046 = _1012 * _1014;
            float _1048 = _1012 * _1016;
            float _1050 = _1012 * _1018;
            float _1052 = _1020 * _1022;
            int _1054 = _1040 * 48;
            float _1056 = _1020 * _1024;
            float _1058 = _1020 * _1026;
            int _1060 = _132 + 1;
            uint _1062 = uint(int(uint(_1054) >> uint(2)));
            _37[int(_1062)] = as_type<uint>(_1042);
            int _1064 = _1054 + 4;
            uint _1066 = uint(int(uint(_1064) >> uint(2)));
            _37[int(_1066)] = as_type<uint>(_1046);
            int _1068 = _1054 + 8;
            uint _1070 = uint(int(uint(_1068) >> uint(2)));
            _37[int(_1070)] = as_type<uint>(_1052);
            int _1072 = _1054 + 12;
            uint _1074 = uint(int(uint(_1072) >> uint(2)));
            _37[int(_1074)] = uint(_1028);
            bool _1076 = uint(_1060) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1078 = _1054 + 16;
            uint _1080 = uint(int(uint(_1078) >> uint(2)));
            _37[int(_1080)] = as_type<uint>(_1044);
            int _1082 = _1054 + 20;
            uint _1084 = uint(int(uint(_1082) >> uint(2)));
            _37[int(_1084)] = as_type<uint>(_1048);
            int _1086 = _1054 + 24;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            _37[int(_1088)] = as_type<uint>(_1056);
            int _1090 = _1054 + 28;
            uint _1092 = uint(int(uint(_1090) >> uint(2)));
            _37[int(_1092)] = uint(_1030);
            int _1094 = _1054 + 32;
            uint _1096 = uint(int(uint(_1094) >> uint(2)));
            _37[int(_1096)] = as_type<uint>(_1036);
            int _1098 = _1054 + 36;
            uint _1100 = uint(int(uint(_1098) >> uint(2)));
            _37[int(_1100)] = as_type<uint>(_1050);
            int _1102 = _1054 + 40;
            uint _1104 = uint(int(uint(_1102) >> uint(2)));
            _37[int(_1104)] = as_type<uint>(_1058);
            int _1106 = _1054 + 44;
            uint _1108 = uint(int(uint(_1106) >> uint(2)));
            _37[int(_1108)] = uint(_1032);
            _130 = !_1076;
            _82 = _1060;
            _84 = _980;
            _86 = as_type<int>(_1048);
            _94 = _982;
            _96 = _1052;
            _98 = _1044;
            _100 = _1058;
            _102 = _984;
            _104 = _986;
            _106 = _988;
            _108 = _990;
            _110 = _992;
            _112 = _994;
            _114 = _996;
            _116 = _998;
            _118 = _1000;
            _120 = _1002;
            _122 = _1050;
            _124 = _1036;
            _128 = _1034;
        } while (_130);
    }
    bool _1110 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _1112 = !_1110;
    if (!_1112)
    {
        int _1114 = 1;
        bool _1116;
        do
        {
            int _1118 = _1114;
            int _1120 = _1118 * 112;
            int _1122 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1124 = _1122 + _1118;
            int _1126 = _1118 + 1;
            uint _1128 = uint(int(uint(_1120) >> uint(2)));
            uint _1130 = uint(int(uint(int(_1128)) >> uint(2)));
            int _1132 = int(_1128) & 3;
            float _1134 = (*spvDescriptorSet0.cp_c6)._m0[int(_1130)][_1132];
            int _1136 = _1124 * 48;
            bool _1138 = uint(_1126) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1140 = _1136 + 16;
            uint _1142 = uint(int(uint(_1140) >> uint(2)));
            float _1144 = as_type<float>(_37[int(_1142)]);
            int _1146 = _1136 + 20;
            uint _1148 = uint(int(uint(_1146) >> uint(2)));
            float _1150 = as_type<float>(_37[int(_1148)]);
            int _1152 = _1136 + 24;
            uint _1154 = uint(int(uint(_1152) >> uint(2)));
            float _1156 = as_type<float>(_37[int(_1154)]);
            int _1158 = _1136 + 28;
            uint _1160 = uint(int(uint(_1158) >> uint(2)));
            float _1162 = as_type<float>(_37[int(_1160)]);
            int _1164 = _1136 + 32;
            uint _1166 = uint(int(uint(_1164) >> uint(2)));
            float _1168 = as_type<float>(_37[int(_1166)]);
            int _1170 = _1136 + 36;
            uint _1172 = uint(int(uint(_1170) >> uint(2)));
            float _1174 = as_type<float>(_37[int(_1172)]);
            int _1176 = _1136 + 40;
            uint _1178 = uint(int(uint(_1176) >> uint(2)));
            float _1180 = as_type<float>(_37[int(_1178)]);
            int _1182 = _1136 + 44;
            uint _1184 = uint(int(uint(_1182) >> uint(2)));
            float _1186 = as_type<float>(_37[int(_1184)]);
            int _1188 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1190 = _1188 + as_type<int>(_1134);
            int _1192 = _1190 * 48;
            uint _1194 = uint(int(uint(_1136) >> uint(2)));
            float _1196 = as_type<float>(_37[int(_1194)]);
            int _1198 = _1136 + 4;
            uint _1200 = uint(int(uint(_1198) >> uint(2)));
            float _1202 = as_type<float>(_37[int(_1200)]);
            int _1204 = _1136 + 8;
            uint _1206 = uint(int(uint(_1204) >> uint(2)));
            float _1208 = as_type<float>(_37[int(_1206)]);
            int _1210 = _1136 + 12;
            uint _1212 = uint(int(uint(_1210) >> uint(2)));
            float _1214 = as_type<float>(_37[int(_1212)]);
            uint _1216 = uint(int(uint(_1192) >> uint(2)));
            float _1218 = as_type<float>(_37[int(_1216)]);
            int _1220 = _1192 + 4;
            uint _1222 = uint(int(uint(_1220) >> uint(2)));
            float _1224 = as_type<float>(_37[int(_1222)]);
            int _1226 = _1192 + 8;
            uint _1228 = uint(int(uint(_1226) >> uint(2)));
            float _1230 = as_type<float>(_37[int(_1228)]);
            int _1232 = _1192 + 12;
            uint _1234 = uint(int(uint(_1232) >> uint(2)));
            float _1236 = as_type<float>(_37[int(_1234)]);
            int _1238 = _1192 + 16;
            uint _1240 = uint(int(uint(_1238) >> uint(2)));
            float _1242 = as_type<float>(_37[int(_1240)]);
            int _1244 = _1192 + 20;
            uint _1246 = uint(int(uint(_1244) >> uint(2)));
            float _1248 = as_type<float>(_37[int(_1246)]);
            int _1250 = _1192 + 24;
            uint _1252 = uint(int(uint(_1250) >> uint(2)));
            float _1254 = as_type<float>(_37[int(_1252)]);
            int _1256 = _1192 + 28;
            uint _1258 = uint(int(uint(_1256) >> uint(2)));
            float _1260 = as_type<float>(_37[int(_1258)]);
            int _1262 = _1192 + 32;
            uint _1264 = uint(int(uint(_1262) >> uint(2)));
            float _1266 = as_type<float>(_37[int(_1264)]);
            int _1268 = _1192 + 36;
            uint _1270 = uint(int(uint(_1268) >> uint(2)));
            float _1272 = as_type<float>(_37[int(_1270)]);
            int _1274 = _1192 + 40;
            uint _1276 = uint(int(uint(_1274) >> uint(2)));
            float _1278 = as_type<float>(_37[int(_1276)]);
            int _1280 = _1192 + 44;
            uint _1282 = uint(int(uint(_1280) >> uint(2)));
            float _1284 = as_type<float>(_37[int(_1282)]);
            float _1286 = _1162 * _1224;
            float _1288 = _1150 * _1224;
            float _1290 = _1144 * _1224;
            float _1292 = _1156 * _1224;
            float _1294 = fma(_1214, _1218, _1286);
            float _1296 = fma(_1202, _1218, _1288);
            float _1298 = fma(_1196, _1218, _1290);
            float _1300 = fma(_1208, _1218, _1292);
            float _1302 = fma(_1186, _1230, _1294);
            float _1304 = fma(_1174, _1230, _1296);
            float _1306 = _1150 * _1248;
            float _1308 = _1144 * _1248;
            float _1310 = _1236 + _1302;
            float _1312 = _1162 * _1248;
            float _1314 = _1156 * _1248;
            float _1316 = fma(_1202, _1242, _1306);
            float _1318 = fma(_1168, _1230, _1298);
            float _1320 = fma(_1214, _1242, _1312);
            float _1322 = fma(_1208, _1242, _1314);
            float _1324 = fma(_1174, _1254, _1316);
            float _1326 = _1162 * _1272;
            float _1328 = _1144 * _1272;
            float _1330 = _1150 * _1272;
            float _1332 = _1156 * _1272;
            float _1334 = fma(_1214, _1266, _1326);
            float _1336 = fma(_1196, _1242, _1308);
            float _1338 = fma(_1186, _1254, _1320);
            float _1340 = fma(_1196, _1266, _1328);
            float _1342 = fma(_1202, _1266, _1330);
            float _1344 = fma(_1208, _1266, _1332);
            float _1346 = fma(_1186, _1278, _1334);
            float _1348 = fma(_1168, _1254, _1336);
            float _1350 = fma(_1180, _1230, _1300);
            float _1352 = fma(_1180, _1254, _1322);
            float _1354 = _1260 + _1338;
            float _1356 = fma(_1168, _1278, _1340);
            float _1358 = fma(_1174, _1278, _1342);
            float _1360 = fma(_1180, _1278, _1344);
            float _1362 = _1284 + _1346;
            uint _1364 = uint(int(uint(_1136) >> uint(2)));
            _37[int(_1364)] = as_type<uint>(_1318);
            int _1366 = _1136 + 4;
            uint _1368 = uint(int(uint(_1366) >> uint(2)));
            _37[int(_1368)] = as_type<uint>(_1304);
            int _1370 = _1136 + 8;
            uint _1372 = uint(int(uint(_1370) >> uint(2)));
            _37[int(_1372)] = as_type<uint>(_1350);
            int _1374 = _1136 + 12;
            uint _1376 = uint(int(uint(_1374) >> uint(2)));
            _37[int(_1376)] = as_type<uint>(_1310);
            int _1378 = _1136 + 16;
            uint _1380 = uint(int(uint(_1378) >> uint(2)));
            _37[int(_1380)] = as_type<uint>(_1348);
            int _1382 = _1136 + 20;
            uint _1384 = uint(int(uint(_1382) >> uint(2)));
            _37[int(_1384)] = as_type<uint>(_1324);
            int _1386 = _1136 + 24;
            uint _1388 = uint(int(uint(_1386) >> uint(2)));
            _37[int(_1388)] = as_type<uint>(_1352);
            int _1390 = _1136 + 28;
            uint _1392 = uint(int(uint(_1390) >> uint(2)));
            _37[int(_1392)] = as_type<uint>(_1354);
            int _1394 = _1136 + 32;
            uint _1396 = uint(int(uint(_1394) >> uint(2)));
            _37[int(_1396)] = as_type<uint>(_1356);
            int _1398 = _1136 + 36;
            uint _1400 = uint(int(uint(_1398) >> uint(2)));
            _37[int(_1400)] = as_type<uint>(_1358);
            int _1402 = _1136 + 40;
            uint _1404 = uint(int(uint(_1402) >> uint(2)));
            _37[int(_1404)] = as_type<uint>(_1360);
            int _1406 = _1136 + 44;
            uint _1408 = uint(int(uint(_1406) >> uint(2)));
            _37[int(_1408)] = as_type<uint>(_1362);
            _1116 = !_1138;
            _1114 = _1126;
        } while (_1116);
    }
    if (!_74)
    {
        return;
    }
    int _1410 = 0;
    bool _1412;
    do
    {
        int _1414 = _1410;
        int _1416 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1418 = _1416 + _1414;
        int _1420 = _1414 * 112;
        int _1422 = _1418 * 48;
        int _1424 = _1420 + 80;
        uint _1426 = uint(int(uint(_1424) >> uint(2)));
        uint _1428 = uint(int(uint(int(_1426)) >> uint(2)));
        int _1430 = int(_1426) & 3;
        float _1432 = (*spvDescriptorSet0.cp_c6)._m0[int(_1428)][_1430];
        int _1434 = int(_1426) + 1;
        uint _1436 = uint(int(uint(_1434) >> uint(2)));
        int _1438 = _1434 & 3;
        float _1440 = (*spvDescriptorSet0.cp_c6)._m0[int(_1436)][_1438];
        uint _1442 = uint(int(uint(_1422) >> uint(2)));
        float _1444 = as_type<float>(_37[int(_1442)]);
        int _1446 = _1422 + 4;
        uint _1448 = uint(int(uint(_1446) >> uint(2)));
        float _1450 = as_type<float>(_37[int(_1448)]);
        int _1452 = _1422 + 8;
        uint _1454 = uint(int(uint(_1452) >> uint(2)));
        float _1456 = as_type<float>(_37[int(_1454)]);
        int _1458 = _1422 + 12;
        uint _1460 = uint(int(uint(_1458) >> uint(2)));
        float _1462 = as_type<float>(_37[int(_1460)]);
        int _1464 = _1422 + 16;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        float _1468 = as_type<float>(_37[int(_1466)]);
        int _1470 = _1422 + 20;
        uint _1472 = uint(int(uint(_1470) >> uint(2)));
        float _1474 = as_type<float>(_37[int(_1472)]);
        int _1476 = _1422 + 24;
        uint _1478 = uint(int(uint(_1476) >> uint(2)));
        float _1480 = as_type<float>(_37[int(_1478)]);
        int _1482 = _1422 + 28;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        float _1486 = as_type<float>(_37[int(_1484)]);
        int _1488 = _1420 + 88;
        uint _1490 = uint(int(uint(_1488) >> uint(2)));
        uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
        int _1494 = int(_1490) & 3;
        float _1496 = (*spvDescriptorSet0.cp_c6)._m0[int(_1492)][_1494];
        int _1498 = int(_1490) + 1;
        uint _1500 = uint(int(uint(_1498) >> uint(2)));
        int _1502 = _1498 & 3;
        float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
        int _1506 = _1422 + 32;
        uint _1508 = uint(int(uint(_1506) >> uint(2)));
        float _1510 = as_type<float>(_37[int(_1508)]);
        int _1512 = _1422 + 36;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        float _1516 = as_type<float>(_37[int(_1514)]);
        int _1518 = _1422 + 40;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>(_37[int(_1520)]);
        int _1524 = _1422 + 44;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        float _1528 = as_type<float>(_37[int(_1526)]);
        int _1530 = _1420 + 64;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
        int _1536 = int(_1532) & 3;
        float _1538 = (*spvDescriptorSet0.cp_c6)._m0[int(_1534)][_1536];
        int _1540 = int(_1532) + 1;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        int _1544 = _1540 & 3;
        float _1546 = (*spvDescriptorSet0.cp_c6)._m0[int(_1542)][_1544];
        int _1548 = _1420 + 72;
        uint _1550 = uint(int(uint(_1548) >> uint(2)));
        uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
        int _1554 = int(_1550) & 3;
        float _1556 = (*spvDescriptorSet0.cp_c6)._m0[int(_1552)][_1554];
        int _1558 = int(_1550) + 1;
        uint _1560 = uint(int(uint(_1558) >> uint(2)));
        int _1562 = _1558 & 3;
        float _1564 = (*spvDescriptorSet0.cp_c6)._m0[int(_1560)][_1562];
        int _1566 = _1420 + 104;
        uint _1568 = uint(int(uint(_1566) >> uint(2)));
        uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
        int _1572 = int(_1568) & 3;
        float _1574 = (*spvDescriptorSet0.cp_c6)._m0[int(_1570)][_1572];
        int _1576 = int(_1568) + 1;
        uint _1578 = uint(int(uint(_1576) >> uint(2)));
        int _1580 = _1576 & 3;
        float _1582 = (*spvDescriptorSet0.cp_c6)._m0[int(_1578)][_1580];
        int _1584 = _1420 + 96;
        uint _1586 = uint(int(uint(_1584) >> uint(2)));
        uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
        int _1590 = int(_1586) & 3;
        float _1592 = (*spvDescriptorSet0.cp_c6)._m0[int(_1588)][_1590];
        int _1594 = int(_1586) + 1;
        uint _1596 = uint(int(uint(_1594) >> uint(2)));
        int _1598 = _1594 & 3;
        float _1600 = (*spvDescriptorSet0.cp_c6)._m0[int(_1596)][_1598];
        float _1602 = _1450 * _1432;
        float _1604 = _1450 * _1440;
        float _1606 = _1450 * _1496;
        float _1608 = _1450 * _1504;
        float _1610 = fma(_1444, _1538, _1602);
        float _1612 = fma(_1444, _1546, _1604);
        float _1614 = fma(_1444, _1556, _1606);
        float _1616 = fma(_1444, _1564, _1608);
        float _1618 = _1474 * _1432;
        float _1620 = _1474 * _1440;
        float _1622 = _1474 * _1496;
        float _1624 = _1474 * _1504;
        float _1626 = _1516 * _1432;
        float _1628 = fma(_1468, _1538, _1618);
        float _1630 = fma(_1468, _1546, _1620);
        float _1632 = fma(_1468, _1556, _1622);
        uint _1634 = uint(int(uint(_78) >> uint(2)));
        uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
        int _1638 = int(_1634) & 3;
        float _1640 = (*spvDescriptorSet0.cp_c4)._m0[int(_1636)][_1638];
        float _1642 = fma(_1468, _1564, _1624);
        float _1644 = _1516 * _1440;
        float _1646 = _1516 * _1496;
        float _1648 = _1516 * _1504;
        float _1650 = fma(_1510, _1538, _1626);
        float _1652 = fma(_1510, _1546, _1644);
        float _1654 = fma(_1510, _1556, _1646);
        int _1656 = _1420 + 16;
        uint _1658 = uint(int(uint(_1656) >> uint(2)));
        uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
        int _1662 = int(_1658) & 3;
        float _1664 = (*spvDescriptorSet0.cp_c6)._m0[int(_1660)][_1662];
        int _1666 = int(_1658) + 1;
        uint _1668 = uint(int(uint(_1666) >> uint(2)));
        int _1670 = _1666 & 3;
        float _1672 = (*spvDescriptorSet0.cp_c6)._m0[int(_1668)][_1670];
        float _1674 = fma(_1510, _1564, _1648);
        float _1676 = fma(_1480, _1582, _1642);
        float _1678 = fma(_1456, _1592, _1610);
        float _1680 = fma(_1456, _1600, _1612);
        float _1682 = fma(_1456, _1574, _1614);
        float _1684 = fma(_1456, _1582, _1616);
        float _1686 = fma(_1480, _1592, _1628);
        int _1688 = _1420 + 24;
        uint _1690 = uint(int(uint(_1688) >> uint(2)));
        uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
        int _1694 = int(_1690) & 3;
        float _1696 = (*spvDescriptorSet0.cp_c6)._m0[int(_1692)][_1694];
        int _1698 = int(_1690) + 1;
        uint _1700 = uint(int(uint(_1698) >> uint(2)));
        int _1702 = _1698 & 3;
        float _1704 = (*spvDescriptorSet0.cp_c6)._m0[int(_1700)][_1702];
        float _1706 = fma(_1480, _1600, _1630);
        float _1708 = fma(_1480, _1574, _1632);
        float _1710 = fma(_1522, _1592, _1650);
        float _1712 = fma(_1522, _1600, _1652);
        float _1714 = fma(_1522, _1582, _1674);
        float _1716 = fma(_1522, _1574, _1654);
        float _1718 = _1486 + _1676;
        int _1720 = _1420 + 32;
        uint _1722 = uint(int(uint(_1720) >> uint(2)));
        uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
        int _1726 = int(_1722) & 3;
        float _1728 = (*spvDescriptorSet0.cp_c6)._m0[int(_1724)][_1726];
        int _1730 = int(_1722) + 1;
        uint _1732 = uint(int(uint(_1730) >> uint(2)));
        int _1734 = _1730 & 3;
        float _1736 = (*spvDescriptorSet0.cp_c6)._m0[int(_1732)][_1734];
        float _1738 = _1528 + _1714;
        float _1740 = _1462 + _1684;
        int _1742 = _1420 + 48;
        uint _1744 = uint(int(uint(_1742) >> uint(2)));
        uint _1746 = uint(int(uint(int(_1744)) >> uint(2)));
        int _1748 = int(_1744) & 3;
        float _1750 = (*spvDescriptorSet0.cp_c6)._m0[int(_1746)][_1748];
        int _1752 = int(_1744) + 1;
        uint _1754 = uint(int(uint(_1752) >> uint(2)));
        int _1756 = _1752 & 3;
        float _1758 = (*spvDescriptorSet0.cp_c6)._m0[int(_1754)][_1756];
        float _1760 = _1686 * _1672;
        float _1762 = _1706 * _1672;
        float _1764 = _1718 * _1672;
        float _1766 = _1708 * _1672;
        float _1768 = fma(_1678, _1664, _1760);
        float _1770 = fma(_1680, _1664, _1762);
        float _1772 = fma(_1740, _1664, _1764);
        float _1774 = fma(_1682, _1664, _1766);
        int _1776 = _1420 + 40;
        uint _1778 = uint(int(uint(_1776) >> uint(2)));
        uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
        int _1782 = int(_1778) & 3;
        float _1784 = (*spvDescriptorSet0.cp_c6)._m0[int(_1780)][_1782];
        int _1786 = int(_1778) + 1;
        uint _1788 = uint(int(uint(_1786) >> uint(2)));
        int _1790 = _1786 & 3;
        float _1792 = (*spvDescriptorSet0.cp_c6)._m0[int(_1788)][_1790];
        float _1794 = fma(_1710, _1696, _1768);
        float _1796 = fma(_1738, _1696, _1772);
        float _1798 = fma(_1712, _1696, _1770);
        float _1800 = fma(_1716, _1696, _1774);
        float _1802 = _1796 + _1704;
        float _1804 = _1718 * _1736;
        int _1806 = _1420 + 56;
        uint _1808 = uint(int(uint(_1806) >> uint(2)));
        uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
        int _1812 = int(_1808) & 3;
        float _1814 = (*spvDescriptorSet0.cp_c6)._m0[int(_1810)][_1812];
        int _1816 = int(_1808) + 1;
        uint _1818 = uint(int(uint(_1816) >> uint(2)));
        int _1820 = _1816 & 3;
        float _1822 = (*spvDescriptorSet0.cp_c6)._m0[int(_1818)][_1820];
        float _1824 = _1686 * _1736;
        float _1826 = _1706 * _1736;
        int _1828 = as_type<int>(_1640) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1830 = _1828 + _1414;
        int _1832 = _1414 + 1;
        float _1834 = _1708 * _1736;
        float _1836 = fma(_1740, _1728, _1804);
        float _1838 = _1718 * _1758;
        float _1840 = _1686 * _1758;
        float _1842 = _1706 * _1758;
        float _1844 = fma(_1680, _1728, _1826);
        float _1846 = _1708 * _1758;
        float _1848 = fma(_1740, _1750, _1838);
        float _1850 = fma(_1678, _1750, _1840);
        int _1852 = _1830 * 48;
        bool _1854 = uint(_1832) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1856 = fma(_1680, _1750, _1842);
        float _1858 = fma(_1678, _1728, _1824);
        float _1860 = fma(_1682, _1728, _1834);
        float _1862 = fma(_1738, _1784, _1836);
        float _1864 = fma(_1682, _1750, _1846);
        float _1866 = fma(_1712, _1784, _1844);
        float _1868 = fma(_1710, _1784, _1858);
        float _1870 = fma(_1716, _1784, _1860);
        float _1872 = fma(_1738, _1814, _1848);
        float _1874 = fma(_1710, _1814, _1850);
        float _1876 = fma(_1712, _1814, _1856);
        int _1878 = _1852 + 16;
        float _1880 = _1862 + _1792;
        int _1882 = _1852 + 32;
        float _1884 = fma(_1716, _1814, _1864);
        float _1886 = _1872 + _1822;
        int _1888 = _1852 + 48;
        uint _1890 = uint(int(uint(_1878) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1890)] = as_type<uint>(_1794);
        int _1892 = _1878 + 4;
        uint _1894 = uint(int(uint(_1892) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1894)] = as_type<uint>(_1798);
        int _1896 = _1878 + 8;
        uint _1898 = uint(int(uint(_1896) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1898)] = as_type<uint>(_1800);
        int _1900 = _1878 + 12;
        uint _1902 = uint(int(uint(_1900) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1902)] = as_type<uint>(_1802);
        uint _1904 = uint(int(uint(_1882) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1904)] = as_type<uint>(_1868);
        int _1906 = _1882 + 4;
        uint _1908 = uint(int(uint(_1906) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1908)] = as_type<uint>(_1866);
        int _1910 = _1882 + 8;
        uint _1912 = uint(int(uint(_1910) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1912)] = as_type<uint>(_1870);
        int _1914 = _1882 + 12;
        uint _1916 = uint(int(uint(_1914) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1916)] = as_type<uint>(_1880);
        uint _1918 = uint(int(uint(_1888) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1918)] = as_type<uint>(_1874);
        int _1920 = _1888 + 4;
        uint _1922 = uint(int(uint(_1920) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1922)] = as_type<uint>(_1876);
        int _1924 = _1888 + 8;
        uint _1926 = uint(int(uint(_1924) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1926)] = as_type<uint>(_1884);
        int _1928 = _1888 + 12;
        uint _1930 = uint(int(uint(_1928) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1930)] = as_type<uint>(_1886);
        _1412 = !_1854;
        _1410 = _1832;
    } while (_1412);
}

