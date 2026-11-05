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
int _58(thread const int& _5016, thread const int& _5017, constant _10& support_buffer)
{
    int _5020 = 1 + _5017;
    float _5022 = support_buffer._m5[_5020].x;
    bool _5024 = _5022 == 1.0;
    if (_5024)
    {
        return _5016;
    }
    float _5026 = float(_5016);
    float _5028 = _5026 * _5022;
    int _5030 = int(_5028);
    return _5030;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4704, thread const int& _4705, thread const int& _4706, thread const int& _4707, thread int& _4708, thread int& _4709, thread int& _4710, thread int& _4711, thread int& _4712, thread int& _4713)
{
    float _4716 = as_type<float>(_4705) + 0.0;
    bool _4718 = _4716 != 0.0;
    bool _4720 = isnan(_4716);
    bool _4722 = _4718 || _4720;
    bool _4724 = isnan(0.0);
    bool _4726 = _4722 || _4724;
    int _4728 = as_type<int>(_4716);
    int _4730 = _4705;
    int _4732 = _4706;
    int _4734 = _4726 ? (-1) : 0;
    if (!_4726)
    {
        float _4736 = as_type<float>(_4705) * 1.0;
        _4728 = as_type<int>(_4736);
    }
    int _4738 = _4728;
    bool _4740 = !_4726;
    int _4742 = _4738;
    if (!_4740)
    {
        float _4744 = as_type<float>(_4705) + 0.0;
        bool _4746 = _4744 >= 0.0;
        bool _4748 = isnan(_4744);
        bool _4750 = _4746 || _4748;
        bool _4752 = isnan(0.0);
        bool _4754 = _4750 || _4752;
        int _4756 = as_type<int>(_4744);
        _4734 = _4754 ? (-1) : 0;
        if (!_4754)
        {
            _4756 = 2147483647;
        }
        int _4758 = _4756;
        bool _4760 = !_4754;
        _4742 = _4758;
        if (!_4760)
        {
            float _4762 = as_type<float>(_4705) + 0.0;
            bool _4764 = _4762 > as_type<float>(0x7f800000u /* inf */);
            bool _4766 = isnan(_4762);
            bool _4768 = _4764 || _4766;
            bool _4770 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4772 = _4768 || _4770;
            int _4774 = as_type<int>(_4762);
            _4734 = _4772 ? (-1) : 0;
            if (_4772)
            {
                float _4776 = as_type<float>(_4705) + 1.0;
                _4774 = as_type<int>(_4776);
            }
            int _4778 = _4774;
            _4742 = _4778;
            if (!_4772)
            {
                float _4780 = 0.0 + as_type<float>(_4705);
                bool _4782 = _4780 != as_type<float>(0x7f800000u /* inf */);
                bool _4784 = isnan(_4780);
                bool _4786 = _4782 || _4784;
                bool _4788 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4790 = _4786 || _4788;
                int _4792 = as_type<int>(_4780);
                _4734 = _4790 ? (-1) : 0;
                if (!_4790)
                {
                    _4792 = _4705;
                }
                int _4794 = _4792;
                bool _4796 = !_4790;
                _4742 = _4794;
                if (!_4796)
                {
                    float _4798 = as_type<float>(_4705) * 18446744073709551616.0;
                    float _4800 = rsqrt(_4798);
                    float _4802 = _4798 * _4800;
                    float _4804 = _4800 * 0.5;
                    float _4806 = -_4802;
                    float _4808 = 0.0 + _4806;
                    float _4810 = fma(_4804, _4808, 0.5);
                    float _4812 = fma(_4802, _4810, _4802);
                    float _4814 = -_4812;
                    float _4816 = 0.0 + _4814;
                    float _4818 = fma(_4812, _4816, _4798);
                    float _4820 = fma(_4804, _4818, _4812);
                    float _4822 = _4820 * 2.3283064365386962890625e-10;
                    _4742 = as_type<int>(_4822);
                    _4730 = as_type<int>(_4808);
                    _4732 = as_type<int>(_4812);
                }
            }
        }
    }
    int _4824 = _4742;
    int _4826 = _4730;
    int _4828 = _4732;
    int _4830 = _4734;
    _4708 = _4824;
    _4709 = _4707;
    _4710 = 0;
    _4711 = _4826;
    _4712 = _4828;
    _4713 = _4830;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1454 = false;
    bool _1026 = false;
    bool _622 = false;
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
    int _99 = _78 ? _91 : _97;
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 36;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = _99 & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = _99 & as_type<int>(_121);
    bool _129 = _127 != 0;
    float _131 = 0.0;
    float _133 = 0.0;
    float _135 = _121;
    if (!_125)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _137 = _131;
    float _139 = _133;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _137;
    float _147 = _139;
    if (!_125)
    {
        _141 = 0.0;
        _143 = 0.0;
    }
    float _149 = _141;
    float _151 = _143;
    float _153 = 0.0;
    float _155 = _149;
    float _157 = _151;
    if (!_125)
    {
        _153 = 0.0;
    }
    float _159 = _153;
    float _161 = 0.0;
    float _163 = _159;
    if (!_125)
    {
        _161 = 0.0;
    }
    float _165 = _161;
    float _167 = 0.0;
    float _169 = _165;
    if (!_125)
    {
        _167 = 0.0;
    }
    float _171 = _167;
    float _173 = 0.0;
    float _175 = _171;
    if (!_125)
    {
        _173 = 0.0;
    }
    float _177 = _173;
    float _179 = 0.0;
    float _181 = _177;
    if (!_125)
    {
        _179 = 0.0;
    }
    float _183 = _179;
    float _185 = _183;
    if (!_125)
    {
        _135 = 0.0;
    }
    float _187 = _135;
    bool _189 = !_125;
    float _191 = _187;
    float _193 = 0.0;
    if (!_189)
    {
        uint _195 = uint(int(uint(_101) >> uint(2)));
        uint _197 = uint(int(uint(int(_195)) >> uint(2)));
        int _199 = int(_195) & 3;
        float _201 = (*spvDescriptorSet0.cp_c5)._m0[int(_197)][_199];
        int _203 = int(_195) + 1;
        uint _205 = uint(int(uint(_203) >> uint(2)));
        int _207 = _203 & 3;
        float _209 = (*spvDescriptorSet0.cp_c5)._m0[int(_205)][_207];
        int _211 = _68;
        int _213 = 0;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_201);
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _2121 = int3(_215, _221, 1);
        float4 _224 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2121.xy), uint(_2121.z), 0).xyzw;
        float _226 = _224.x;
        float _228 = _224.y;
        float _230 = _224.z;
        float _232 = _224.w;
        int _234 = _68;
        int _236 = 0;
        int _238 = _58(_234, _236, (*spvDescriptorSet0.support_buffer));
        int _240 = as_type<int>(_209);
        int _242 = 0;
        int _244 = _58(_240, _242, (*spvDescriptorSet0.support_buffer));
        int3 _2141 = int3(_238, _244, 1);
        float4 _246 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2141.xy), uint(_2141.z), 0).xyzw;
        float _248 = _246.x;
        float _250 = _246.y;
        float _252 = _246.z;
        float _254 = _246.w;
        int _256 = _68;
        int _258 = 0;
        int _260 = _58(_256, _258, (*spvDescriptorSet0.support_buffer));
        int _262 = as_type<int>(_201);
        int _264 = 0;
        int _266 = _58(_262, _264, (*spvDescriptorSet0.support_buffer));
        int3 _2161 = int3(_260, _266, 0);
        float3 _270 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2161.xy), uint(_2161.z), 0).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        int _278 = _68;
        int _280 = 0;
        int _282 = _58(_278, _280, (*spvDescriptorSet0.support_buffer));
        int _284 = as_type<int>(_209);
        int _286 = 0;
        int _288 = _58(_284, _286, (*spvDescriptorSet0.support_buffer));
        int3 _2179 = int3(_282, _288, 0);
        float3 _290 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2179.xy), uint(_2179.z), 0).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        int _298 = _68;
        int _300 = 0;
        int _302 = _58(_298, _300, (*spvDescriptorSet0.support_buffer));
        int _304 = as_type<int>(_201);
        int _306 = 0;
        int _308 = _58(_304, _306, (*spvDescriptorSet0.support_buffer));
        int3 _2197 = int3(_302, _308, 2);
        float3 _310 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2197.xy), uint(_2197.z), 0).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        int _318 = _68;
        int _320 = 0;
        int _322 = _58(_318, _320, (*spvDescriptorSet0.support_buffer));
        int _324 = as_type<int>(_209);
        int _326 = 0;
        int _328 = _58(_324, _326, (*spvDescriptorSet0.support_buffer));
        int3 _2215 = int3(_322, _328, 2);
        float3 _330 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2215.xy), uint(_2215.z), 0).xyz;
        float _332 = _330.x;
        float _334 = _330.y;
        float _336 = _330.z;
        int _338 = _101 + 16;
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
        _181 = _394;
        _175 = _364;
        _185 = _396;
        _191 = _366;
        _145 = _392;
        _155 = _398;
        _157 = _400;
        _147 = _402;
        _163 = _404;
        _169 = _406;
        _193 = _316;
    }
    float _408 = _181;
    float _410 = _175;
    float _412 = _185;
    float _414 = _191;
    float _416 = _145;
    float _418 = _155;
    float _420 = _157;
    float _422 = _147;
    float _424 = _163;
    float _426 = _169;
    float _428 = _193;
    bool _430 = !_129;
    float _432 = _416;
    int _434 = as_type<int>(_424);
    int _436 = as_type<int>(_426);
    float _438 = _428;
    float _440 = _418;
    float _442 = _420;
    float _444 = _422;
    float _998;
    float _1000;
    float _1002;
    float _1004;
    float _1006;
    float _1008;
    float _1010;
    float _1012;
    float _1014;
    float _1016;
    float _1018;
    int _1020;
    float _1022;
    float _1024;
    if (!_430)
    {
        int _446 = _101 + 8;
        uint _448 = uint(int(uint(_446) >> uint(2)));
        uint _450 = uint(int(uint(int(_448)) >> uint(2)));
        int _452 = int(_448) & 3;
        float _454 = (*spvDescriptorSet0.cp_c5)._m0[int(_450)][_452];
        int _456 = int(_448) + 1;
        uint _458 = uint(int(uint(_456) >> uint(2)));
        int _460 = _456 & 3;
        float _462 = (*spvDescriptorSet0.cp_c5)._m0[int(_458)][_460];
        int _464 = _68;
        int _466 = 1;
        int _468 = _58(_464, _466, (*spvDescriptorSet0.support_buffer));
        int _470 = as_type<int>(_454);
        int _472 = 1;
        int _474 = _58(_470, _472, (*spvDescriptorSet0.support_buffer));
        int3 _2410 = int3(_468, _474, 1);
        float4 _476 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2410.xy), uint(_2410.z), 0).xyzw;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float _484 = _476.w;
        int _486 = _68;
        int _488 = 1;
        int _490 = _58(_486, _488, (*spvDescriptorSet0.support_buffer));
        int _492 = as_type<int>(_462);
        int _494 = 1;
        int _496 = _58(_492, _494, (*spvDescriptorSet0.support_buffer));
        int3 _2430 = int3(_490, _496, 1);
        float4 _498 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2430.xy), uint(_2430.z), 0).xyzw;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float _506 = _498.w;
        int _508 = _101 + 24;
        uint _510 = uint(int(uint(_508) >> uint(2)));
        uint _512 = uint(int(uint(int(_510)) >> uint(2)));
        int _514 = int(_510) & 3;
        float _516 = (*spvDescriptorSet0.cp_c5)._m0[int(_512)][_514];
        float _518 = -_480;
        float _520 = _518 + _502;
        float _522 = -_478;
        float _524 = _522 + _500;
        float _526 = fma(_520, _516, _480);
        float _528 = fma(_524, _516, _478);
        float _530 = -_482;
        float _532 = _530 + _504;
        float _534 = -_484;
        float _536 = _534 + _506;
        float _538 = _526 * _408;
        float _540 = fma(_532, _516, _482);
        float _542 = fma(_536, _516, _484);
        float _544 = fma(_528, _410, _538);
        float _546 = fma(_540, _412, _544);
        float _548 = fma(_542, _414, _546);
        float _550 = precise::max(_548, -1.0);
        float _552 = precise::min(_550, 1.0);
        bool _554 = _552 >= 0.0;
        bool _556 = isnan(_552);
        bool _558 = _554 || _556;
        bool _560 = isnan(0.0);
        bool _562 = _558 || _560;
        bool _564 = !_562;
        float _566 = -_552;
        float _568 = _564 ? _566 : _552;
        bool _570 = _568 < 0.0;
        float _572 = float(_570);
        float _574 = abs(_568);
        float _576 = -_574;
        float _578 = _576 + 1.0;
        float _580 = abs(_568);
        float _582 = fma(_580, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _584 = as_type<int>(_578) + (-218103808);
        float _586 = abs(_568);
        float _588 = fma(_586, _582, -0.212114393711090087890625);
        bool _590 = uint(_584) >= 1920991232u;
        float _592 = abs(_568);
        float _594 = fma(_592, _588, 1.570728778839111328125);
        bool _596 = !_590;
        float _618;
        float _620;
        if (!_596)
        {
            int _598 = _584;
            int _600 = as_type<int>(_578);
            int _602 = as_type<int>(_484);
            int _604 = 1584;
            int _606;
            int _608;
            int _610;
            int _612;
            int _614;
            int _616;
            _56(_598, _600, _602, _604, _606, _608, _610, _612, _614, _616);
            _618 = as_type<float>(_606);
            _620 = as_type<float>(_608);
            _622 = true;
        }
        else
        {
            float _624 = rsqrt(_578);
            float _626 = _578 * _624;
            float _628 = _624 * 0.5;
            float _630 = -_626;
            float _632 = 0.0 + _630;
            float _634 = fma(_628, _632, 0.5);
            float _636 = fma(_626, _634, _626);
            float _638 = -_636;
            float _640 = 0.0 + _638;
            float _642 = fma(_636, _640, _578);
            float _644 = fma(_628, _642, _636);
            _618 = _644;
            _620 = _642;
        }
        _622 = false;
        float _646 = _618;
        float _648 = _620;
        int _650 = _101 + 8;
        uint _652 = uint(int(uint(_650) >> uint(2)));
        uint _654 = uint(int(uint(int(_652)) >> uint(2)));
        int _656 = int(_652) & 3;
        float _658 = (*spvDescriptorSet0.cp_c5)._m0[int(_654)][_656];
        int _660 = int(_652) + 1;
        uint _662 = uint(int(uint(_660) >> uint(2)));
        int _664 = _660 & 3;
        float _666 = (*spvDescriptorSet0.cp_c5)._m0[int(_662)][_664];
        int _668 = _68;
        int _670 = 1;
        int _672 = _58(_668, _670, (*spvDescriptorSet0.support_buffer));
        int _674 = as_type<int>(_658);
        int _676 = 1;
        int _678 = _58(_674, _676, (*spvDescriptorSet0.support_buffer));
        int3 _2664 = int3(_672, _678, 0);
        float3 _680 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2664.xy), uint(_2664.z), 0).xyz;
        float _682 = _680.x;
        float _684 = _680.y;
        float _686 = _680.z;
        int _688 = _68;
        int _690 = 1;
        int _692 = _58(_688, _690, (*spvDescriptorSet0.support_buffer));
        int _694 = as_type<int>(_658);
        int _696 = 1;
        int _698 = _58(_694, _696, (*spvDescriptorSet0.support_buffer));
        int3 _2682 = int3(_692, _698, 2);
        float3 _700 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2682.xy), uint(_2682.z), 0).xyz;
        float _702 = _700.x;
        float _704 = _700.y;
        float _706 = _700.z;
        int _708 = _68;
        int _710 = 1;
        int _712 = _58(_708, _710, (*spvDescriptorSet0.support_buffer));
        int _714 = as_type<int>(_666);
        int _716 = 1;
        int _718 = _58(_714, _716, (*spvDescriptorSet0.support_buffer));
        int3 _2700 = int3(_712, _718, 0);
        float3 _720 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2700.xy), uint(_2700.z), 0).xyz;
        float _722 = _720.x;
        float _724 = _720.y;
        float _726 = _720.z;
        int _728 = _68;
        int _730 = 1;
        int _732 = _58(_728, _730, (*spvDescriptorSet0.support_buffer));
        int _734 = as_type<int>(_666);
        int _736 = 1;
        int _738 = _58(_734, _736, (*spvDescriptorSet0.support_buffer));
        int3 _2718 = int3(_732, _738, 2);
        float3 _740 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2718.xy), uint(_2718.z), 0).xyz;
        float _742 = _740.x;
        float _744 = _740.y;
        float _746 = _740.z;
        float _748 = _594 * _646;
        float _750 = _572 * 2.0;
        float _752 = -_750;
        float _754 = fma(_748, _752, _748);
        float _756 = fma(_572, 3.1415927410125732421875, _754);
        float _758 = _756 * 0.15915493667125701904296875;
        float _760 = _758 * 6.283185482025146484375;
        float _762 = sin(_760);
        float _764 = abs(_762);
        bool _766 = _764 >= 0.001000000047497451305389404296875;
        bool _768 = isnan(_764);
        bool _770 = _766 || _768;
        bool _772 = isnan(0.001000000047497451305389404296875);
        bool _774 = _770 || _772;
        float _776 = 0.0;
        float _778 = _648;
        float _780 = _748;
        if (!_774)
        {
            int _782 = _101 + 28;
            uint _784 = uint(int(uint(_782) >> uint(2)));
            uint _786 = uint(int(uint(int(_784)) >> uint(2)));
            int _788 = int(_784) & 3;
            float _790 = (*spvDescriptorSet0.cp_c5)._m0[int(_786)][_788];
            _776 = _790;
        }
        float _792 = _776;
        float _794 = _792;
        if (!_774)
        {
            float _796 = -_792;
            float _798 = _796 + 1.0;
            _778 = _798;
        }
        float _800 = _778;
        float _802 = _800;
        if (!_774)
        {
            _780 = _792;
        }
        float _804 = _780;
        bool _806 = !_774;
        float _808 = _804;
        if (!_806)
        {
            int _810 = _101 + 28;
            uint _812 = uint(int(uint(_810) >> uint(2)));
            uint _814 = uint(int(uint(int(_812)) >> uint(2)));
            int _816 = int(_812) & 3;
            float _818 = (*spvDescriptorSet0.cp_c5)._m0[int(_814)][_816];
            float _820 = 1.0 / _762;
            float _822 = _756 * _818;
            float _824 = _822 * 0.15915493667125701904296875;
            float _826 = -_822;
            float _828 = _756 + _826;
            float _830 = _828 * 0.15915493667125701904296875;
            float _832 = _824 * 6.283185482025146484375;
            float _834 = sin(_832);
            float _836 = _830 * 6.283185482025146484375;
            float _838 = sin(_836);
            float _840 = _834 * _820;
            float _842 = _838 * _820;
            _808 = _840;
            _802 = _842;
            _794 = _818;
        }
        float _844 = _808;
        float _846 = _802;
        float _848 = _794;
        bool _850 = !_562;
        float _852 = -_844;
        float _854 = _850 ? _852 : _844;
        int _856 = _101 + 24;
        uint _858 = uint(int(uint(_856) >> uint(2)));
        uint _860 = uint(int(uint(int(_858)) >> uint(2)));
        int _862 = int(_858) & 3;
        float _864 = (*spvDescriptorSet0.cp_c5)._m0[int(_860)][_862];
        float _866 = -_684;
        float _868 = _866 + _724;
        float _870 = -_686;
        float _872 = _870 + _726;
        float _874 = -_706;
        float _876 = _874 + _746;
        float _878 = _542 * _854;
        float _880 = _528 * _854;
        float _882 = _540 * _854;
        float _884 = _526 * _854;
        float _886 = fma(_414, _846, _878);
        float _888 = fma(_410, _846, _880);
        float _890 = fma(_412, _846, _882);
        float _892 = fma(_408, _846, _884);
        float _894 = _886 * 2.0;
        int _896 = _101 + 20;
        uint _898 = uint(int(uint(_896) >> uint(2)));
        uint _900 = uint(int(uint(int(_898)) >> uint(2)));
        int _902 = int(_898) & 3;
        float _904 = (*spvDescriptorSet0.cp_c5)._m0[int(_900)][_902];
        float _906 = _888 * 2.0;
        float _908 = _892 * 2.0;
        float _910 = _890 * _894;
        float _912 = _892 * _894;
        float _914 = _888 * _894;
        float _916 = -_910;
        float _918 = fma(_892, _906, _916);
        float _920 = fma(_892, _906, _910);
        float _922 = fma(_890, _906, _912);
        float _924 = -_912;
        float _926 = fma(_890, _906, _924);
        float _928 = -_914;
        float _930 = fma(_890, _908, _928);
        float _932 = fma(_890, _908, _914);
        float _934 = _892 * _892;
        float _936 = _888 * _888;
        float _938 = _890 * _890;
        float _940 = -_682;
        float _942 = _940 + _722;
        float _944 = fma(_934, -2.0, 1.0);
        float _946 = fma(_936, -2.0, 1.0);
        float _948 = fma(_868, _864, _684);
        float _950 = fma(_942, _864, _682);
        float _952 = fma(_938, -2.0, _944);
        float _954 = fma(_938, -2.0, _946);
        float _956 = fma(_934, -2.0, _946);
        float _958 = -_702;
        float _960 = _958 + _742;
        float _962 = -_704;
        float _964 = _962 + _744;
        float _966 = _950 * _848;
        float _968 = fma(_872, _864, _686);
        float _970 = fma(_960, _864, _702);
        float _972 = fma(_964, _864, _704);
        float _974 = fma(_876, _864, _706);
        float _976 = fma(_416, _904, _966);
        float _978 = _948 * _848;
        float _980 = _968 * _848;
        float _982 = _970 * _848;
        float _984 = _972 * _848;
        float _986 = _974 * _848;
        float _988 = fma(_418, _904, _978);
        float _990 = fma(_420, _904, _980);
        float _992 = fma(_422, _904, _982);
        float _994 = fma(_424, _904, _984);
        float _996 = fma(_426, _904, _986);
        _432 = _976;
        _998 = _952;
        _1000 = _920;
        _1002 = _926;
        _1004 = _988;
        _1006 = _918;
        _1008 = _954;
        _1010 = _932;
        _1012 = _990;
        _1014 = _922;
        _1016 = _930;
        _1018 = _956;
        _1020 = as_type<int>(_992);
        _434 = as_type<int>(_994);
        _436 = as_type<int>(_996);
        _1022 = _984;
        _438 = _986;
        _1024 = _912;
        _1026 = true;
    }
    else
    {
        float _1028 = _414 * 2.0;
        float _1030 = _410 * 2.0;
        float _1032 = _408 * _408;
        float _1034 = _1028 * _412;
        float _1036 = _410 * _410;
        float _1038 = _1028 * _410;
        float _1040 = _1028 * _408;
        float _1042 = -_1034;
        float _1044 = fma(_1030, _408, _1042);
        float _1046 = fma(_1030, _408, _1034);
        float _1048 = _412 * _412;
        float _1050 = fma(_1032, -2.0, 1.0);
        float _1052 = _408 * 2.0;
        float _1054 = fma(_1036, -2.0, 1.0);
        float _1056 = fma(_1030, _412, _1040);
        float _1058 = fma(_1048, -2.0, _1050);
        float _1060 = -_1040;
        float _1062 = fma(_1030, _412, _1060);
        float _1064 = -_1038;
        float _1066 = fma(_1052, _412, _1064);
        float _1068 = fma(_1048, -2.0, _1054);
        float _1070 = fma(_1032, -2.0, _1054);
        float _1072 = fma(_1052, _412, _1038);
        _998 = _1058;
        _1000 = _1046;
        _1002 = _1062;
        _1004 = _418;
        _1006 = _1044;
        _1008 = _1068;
        _1010 = _1072;
        _1012 = _420;
        _1014 = _1056;
        _1016 = _1066;
        _1018 = _1070;
        _1020 = as_type<int>(_422);
        _1022 = _1052;
        _1024 = _1038;
    }
    _1026 = false;
    float _1074 = _432;
    float _1076 = _998;
    float _1078 = _1000;
    float _1080 = _1002;
    float _1082 = _1004;
    float _1084 = _1006;
    float _1086 = _1008;
    float _1088 = _1010;
    float _1090 = _1012;
    float _1092 = _1014;
    float _1094 = _1016;
    float _1096 = _1018;
    int _1098 = _1020;
    int _1100 = _434;
    int _1102 = _436;
    float _1104 = _1022;
    float _1106 = _438;
    float _1108 = _1024;
    float _1110 = _1074 * _1076;
    float _1112 = _1074 * _1078;
    float _1114 = _1074 * _1080;
    float _1116 = _1082 * _1084;
    float _1118 = _1082 * _1086;
    float _1120 = _1082 * _1088;
    int _1122 = _68 * 48;
    float _1124 = _1090 * _1092;
    float _1126 = _1090 * _1094;
    float _1128 = _1090 * _1096;
    bool _1130 = _68 != 0;
    uint _1132 = uint(int(uint(_1122) >> uint(2)));
    _37[int(_1132)] = as_type<uint>(_1110);
    int _1134 = _1122 + 4;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    _37[int(_1136)] = as_type<uint>(_1116);
    int _1138 = _1122 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    _37[int(_1140)] = as_type<uint>(_1124);
    int _1142 = _1122 + 12;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    _37[int(_1144)] = uint(_1098);
    int _1146 = _68 * 112;
    int _1148 = _1122 + 16;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    _37[int(_1150)] = as_type<uint>(_1112);
    int _1152 = _1122 + 20;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    _37[int(_1154)] = as_type<uint>(_1118);
    int _1156 = _1122 + 24;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    _37[int(_1158)] = as_type<uint>(_1126);
    int _1160 = _1122 + 28;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    _37[int(_1162)] = uint(_1100);
    int _1164 = _1122 + 32;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    _37[int(_1166)] = as_type<uint>(_1114);
    int _1168 = _1122 + 36;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    _37[int(_1170)] = as_type<uint>(_1120);
    int _1172 = _1122 + 40;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    _37[int(_1174)] = as_type<uint>(_1128);
    int _1176 = _1122 + 44;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    _37[int(_1178)] = uint(_1102);
    float _1180 = _1108;
    float _1182 = _1106;
    float _1184 = _1074;
    float _1186 = _1090;
    float _1188 = _1104;
    float _1190 = _1082;
    float _1192 = _1120;
    float _1194 = _1128;
    float _1196 = as_type<float>(_1102);
    if (!_1130)
    {
        _1180 = _1110;
    }
    float _1198 = _1180;
    float _1200 = _1198;
    if (!_1130)
    {
        _1182 = _1116;
    }
    float _1202 = _1182;
    float _1204 = _1202;
    if (!_1130)
    {
        _440 = _1124;
    }
    float _1206 = _440;
    float _1208 = _1206;
    if (!_1130)
    {
        _442 = as_type<float>(_1098);
    }
    float _1210 = _442;
    float _1212 = _1210;
    if (!_1130)
    {
        _1184 = _1112;
    }
    float _1214 = _1184;
    float _1216 = _1214;
    if (!_1130)
    {
        _444 = _1118;
    }
    float _1218 = _444;
    float _1220 = _1218;
    if (!_1130)
    {
        _1186 = _1126;
    }
    float _1222 = _1186;
    float _1224 = _1222;
    if (!_1130)
    {
        _1188 = as_type<float>(_1100);
    }
    float _1226 = _1188;
    float _1228 = _1226;
    if (!_1130)
    {
        _1190 = _1114;
    }
    float _1230 = _1190;
    bool _1232 = !_1130;
    float _1234 = _1230;
    if (!_1232)
    {
        bool _1236 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1238 = !_1236;
        if (!_1238)
        {
            uint _1240 = uint(int(uint(_1146) >> uint(2)));
            uint _1242 = uint(int(uint(int(_1240)) >> uint(2)));
            int _1244 = int(_1240) & 3;
            float _1246 = (*spvDescriptorSet0.cp_c6)._m0[int(_1242)][_1244];
            int _1248 = as_type<int>(_1246) * 48;
            int _1250 = 0;
            bool _1252;
            float _1348;
            float _1352;
            float _1356;
            float _1360;
            float _1374;
            float _1376;
            float _1388;
            float _1398;
            float _1400;
            float _1402;
            float _1404;
            float _1406;
            do
            {
                int _1254 = _1250;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1256 = uint(int(uint(_1248) >> uint(2)));
                float _1258 = as_type<float>(_37[int(_1256)]);
                int _1260 = _1248 + 4;
                uint _1262 = uint(int(uint(_1260) >> uint(2)));
                float _1264 = as_type<float>(_37[int(_1262)]);
                int _1266 = _1248 + 8;
                uint _1268 = uint(int(uint(_1266) >> uint(2)));
                float _1270 = as_type<float>(_37[int(_1268)]);
                int _1272 = _1248 + 12;
                uint _1274 = uint(int(uint(_1272) >> uint(2)));
                float _1276 = as_type<float>(_37[int(_1274)]);
                int _1278 = _1254 + 1;
                int _1280 = _1248 + 16;
                uint _1282 = uint(int(uint(_1280) >> uint(2)));
                float _1284 = as_type<float>(_37[int(_1282)]);
                int _1286 = _1248 + 20;
                uint _1288 = uint(int(uint(_1286) >> uint(2)));
                float _1290 = as_type<float>(_37[int(_1288)]);
                int _1292 = _1248 + 24;
                uint _1294 = uint(int(uint(_1292) >> uint(2)));
                float _1296 = as_type<float>(_37[int(_1294)]);
                int _1298 = _1248 + 28;
                uint _1300 = uint(int(uint(_1298) >> uint(2)));
                float _1302 = as_type<float>(_37[int(_1300)]);
                bool _1304 = uint(_1278) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1306 = _1248 + 32;
                uint _1308 = uint(int(uint(_1306) >> uint(2)));
                float _1310 = as_type<float>(_37[int(_1308)]);
                int _1312 = _1248 + 36;
                uint _1314 = uint(int(uint(_1312) >> uint(2)));
                float _1316 = as_type<float>(_37[int(_1314)]);
                int _1318 = _1248 + 40;
                uint _1320 = uint(int(uint(_1318) >> uint(2)));
                float _1322 = as_type<float>(_37[int(_1320)]);
                int _1324 = _1248 + 44;
                uint _1326 = uint(int(uint(_1324) >> uint(2)));
                float _1328 = as_type<float>(_37[int(_1326)]);
                float _1330 = _1264 * as_type<float>(_1100);
                float _1332 = _1112 * _1264;
                float _1334 = _1118 * _1264;
                float _1336 = _1126 * _1264;
                float _1338 = fma(_1258, as_type<float>(_1098), _1330);
                float _1340 = fma(_1110, _1258, _1332);
                float _1342 = fma(_1116, _1258, _1334);
                float _1344 = fma(_1124, _1258, _1336);
                float _1346 = fma(_1270, as_type<float>(_1102), _1338);
                _1348 = fma(_1114, _1270, _1340);
                float _1350 = _1112 * _1290;
                _1352 = fma(_1128, _1270, _1344);
                float _1354 = _1290 * as_type<float>(_1100);
                _1356 = _1276 + _1346;
                float _1358 = _1118 * _1290;
                _1360 = fma(_1120, _1270, _1342);
                float _1362 = fma(_1284, as_type<float>(_1098), _1354);
                float _1364 = fma(_1110, _1284, _1350);
                float _1366 = fma(_1116, _1284, _1358);
                float _1368 = _1126 * _1290;
                float _1370 = fma(_1296, as_type<float>(_1102), _1362);
                float _1372 = _1316 * as_type<float>(_1100);
                _1374 = fma(_1114, _1296, _1364);
                _1376 = fma(_1120, _1296, _1366);
                float _1378 = _1112 * _1316;
                float _1380 = _1118 * _1316;
                float _1382 = _1126 * _1316;
                float _1384 = fma(_1310, as_type<float>(_1098), _1372);
                float _1386 = fma(_1124, _1284, _1368);
                _1388 = _1302 + _1370;
                float _1390 = fma(_1110, _1310, _1378);
                float _1392 = fma(_1116, _1310, _1380);
                float _1394 = fma(_1124, _1310, _1382);
                float _1396 = fma(_1322, as_type<float>(_1102), _1384);
                _1398 = fma(_1128, _1296, _1386);
                _1400 = fma(_1114, _1322, _1390);
                _1402 = fma(_1120, _1322, _1392);
                _1404 = fma(_1128, _1322, _1394);
                _1406 = _1328 + _1396;
                uint _1408 = uint(int(uint(_1122) >> uint(2)));
                _37[int(_1408)] = as_type<uint>(_1348);
                int _1410 = _1122 + 4;
                uint _1412 = uint(int(uint(_1410) >> uint(2)));
                _37[int(_1412)] = as_type<uint>(_1360);
                int _1414 = _1122 + 8;
                uint _1416 = uint(int(uint(_1414) >> uint(2)));
                _37[int(_1416)] = as_type<uint>(_1352);
                int _1418 = _1122 + 12;
                uint _1420 = uint(int(uint(_1418) >> uint(2)));
                _37[int(_1420)] = as_type<uint>(_1356);
                int _1422 = _1122 + 16;
                uint _1424 = uint(int(uint(_1422) >> uint(2)));
                _37[int(_1424)] = as_type<uint>(_1374);
                int _1426 = _1122 + 20;
                uint _1428 = uint(int(uint(_1426) >> uint(2)));
                _37[int(_1428)] = as_type<uint>(_1376);
                int _1430 = _1122 + 24;
                uint _1432 = uint(int(uint(_1430) >> uint(2)));
                _37[int(_1432)] = as_type<uint>(_1398);
                int _1434 = _1122 + 28;
                uint _1436 = uint(int(uint(_1434) >> uint(2)));
                _37[int(_1436)] = as_type<uint>(_1388);
                int _1438 = _1122 + 32;
                uint _1440 = uint(int(uint(_1438) >> uint(2)));
                _37[int(_1440)] = as_type<uint>(_1400);
                int _1442 = _1122 + 36;
                uint _1444 = uint(int(uint(_1442) >> uint(2)));
                _37[int(_1444)] = as_type<uint>(_1402);
                int _1446 = _1122 + 40;
                uint _1448 = uint(int(uint(_1446) >> uint(2)));
                _37[int(_1448)] = as_type<uint>(_1404);
                int _1450 = _1122 + 44;
                uint _1452 = uint(int(uint(_1450) >> uint(2)));
                _37[int(_1452)] = as_type<uint>(_1406);
                _1252 = !_1304;
                _1250 = _1278;
            } while (_1252);
            _1192 = _1402;
            _1204 = _1360;
            _1220 = _1376;
            _1234 = _1400;
            _1200 = _1348;
            _1216 = _1374;
            _1224 = _1398;
            _1194 = _1404;
            _1208 = _1352;
            _1228 = _1388;
            _1212 = _1356;
            _1196 = _1406;
            _1454 = true;
        }
        else
        {
            _1192 = 0.0;
            _1204 = 0.0;
            _1220 = 0.0;
            _1234 = 0.0;
            _1200 = 0.0;
            _1216 = 0.0;
            _1224 = 0.0;
            _1194 = 0.0;
            _1208 = 0.0;
            _1228 = 0.0;
            _1212 = 0.0;
            _1196 = 0.0;
        }
    }
    _1454 = false;
    float _1456 = _1192;
    float _1458 = _1204;
    float _1460 = _1220;
    float _1462 = _1234;
    float _1464 = _1200;
    float _1466 = _1216;
    float _1468 = _1224;
    float _1470 = _1194;
    float _1472 = _1208;
    float _1474 = _1228;
    float _1476 = _1212;
    float _1478 = _1196;
    int _1480 = _1146 + 80;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    uint _1484 = uint(int(uint(int(_1482)) >> uint(2)));
    int _1486 = int(_1482) & 3;
    float _1488 = (*spvDescriptorSet0.cp_c6)._m0[int(_1484)][_1486];
    int _1490 = int(_1482) + 1;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    int _1494 = _1490 & 3;
    float _1496 = (*spvDescriptorSet0.cp_c6)._m0[int(_1492)][_1494];
    int _1498 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1500 = _1498 + _68;
    int _1502 = _1146 + 64;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.cp_c6)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.cp_c6)._m0[int(_1514)][_1516];
    int _1520 = _1500 * 48;
    int _1522 = _1146 + 88;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
    int _1528 = int(_1524) & 3;
    float _1530 = (*spvDescriptorSet0.cp_c6)._m0[int(_1526)][_1528];
    int _1532 = int(_1524) + 1;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    int _1536 = _1532 & 3;
    float _1538 = (*spvDescriptorSet0.cp_c6)._m0[int(_1534)][_1536];
    int _1540 = _1146 + 72;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.cp_c6)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.cp_c6)._m0[int(_1552)][_1554];
    int _1558 = _1146 + 96;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    uint _1562 = uint(int(uint(int(_1560)) >> uint(2)));
    int _1564 = int(_1560) & 3;
    float _1566 = (*spvDescriptorSet0.cp_c6)._m0[int(_1562)][_1564];
    int _1568 = int(_1560) + 1;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    int _1572 = _1568 & 3;
    float _1574 = (*spvDescriptorSet0.cp_c6)._m0[int(_1570)][_1572];
    int _1576 = _1146 + 104;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.cp_c6)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.cp_c6)._m0[int(_1588)][_1590];
    float _1594 = _1456 * _1488;
    int _1596 = _1146 + 16;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.cp_c6)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.cp_c6)._m0[int(_1608)][_1610];
    float _1614 = _1458 * _1488;
    float _1616 = _1460 * _1488;
    float _1618 = _1460 * _1496;
    float _1620 = fma(_1462, _1510, _1594);
    float _1622 = _1456 * _1496;
    int _1624 = _1146 + 32;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.cp_c6)._m0[int(_1628)][_1630];
    int _1634 = int(_1626) + 1;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    int _1638 = _1634 & 3;
    float _1640 = (*spvDescriptorSet0.cp_c6)._m0[int(_1636)][_1638];
    float _1642 = fma(_1464, _1510, _1614);
    float _1644 = fma(_1466, _1510, _1616);
    float _1646 = fma(_1466, _1518, _1618);
    float _1648 = _1458 * _1496;
    float _1650 = fma(_1462, _1518, _1622);
    float _1652 = _1458 * _1530;
    float _1654 = _1460 * _1530;
    int _1656 = _1146 + 48;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
    int _1662 = int(_1658) & 3;
    float _1664 = (*spvDescriptorSet0.cp_c6)._m0[int(_1660)][_1662];
    int _1666 = int(_1658) + 1;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    int _1670 = _1666 & 3;
    float _1672 = (*spvDescriptorSet0.cp_c6)._m0[int(_1668)][_1670];
    float _1674 = _1458 * _1538;
    float _1676 = _1460 * _1538;
    float _1678 = _1456 * _1530;
    float _1680 = _1456 * _1538;
    float _1682 = fma(_1464, _1518, _1648);
    float _1684 = fma(_1466, _1548, _1654);
    float _1686 = fma(_1466, _1556, _1676);
    int _1688 = _1146 + 24;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.cp_c6)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.cp_c6)._m0[int(_1700)][_1702];
    float _1706 = fma(_1464, _1548, _1652);
    float _1708 = fma(_1464, _1556, _1674);
    float _1710 = fma(_1462, _1548, _1678);
    float _1712 = fma(_1462, _1556, _1680);
    float _1714 = fma(_1468, _1566, _1644);
    float _1716 = fma(_1468, _1574, _1646);
    int _1718 = _1146 + 40;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.cp_c6)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.cp_c6)._m0[int(_1730)][_1732];
    float _1736 = fma(_1470, _1566, _1620);
    float _1738 = fma(_1472, _1566, _1642);
    float _1740 = fma(_1472, _1574, _1682);
    float _1742 = fma(_1470, _1574, _1650);
    float _1744 = fma(_1468, _1584, _1684);
    float _1746 = fma(_1468, _1592, _1686);
    int _1748 = _1146 + 56;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.cp_c6)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.cp_c6)._m0[int(_1760)][_1762];
    float _1766 = fma(_1472, _1584, _1706);
    float _1768 = fma(_1472, _1592, _1708);
    float _1770 = _1746 + _1474;
    float _1772 = fma(_1470, _1592, _1712);
    float _1774 = fma(_1470, _1584, _1710);
    float _1776 = _1768 + _1476;
    float _1778 = _1770 * _1612;
    float _1780 = _1772 + _1478;
    float _1782 = _1714 * _1612;
    float _1784 = _1716 * _1612;
    float _1786 = fma(_1776, _1604, _1778);
    float _1788 = _1744 * _1612;
    float _1790 = fma(_1738, _1604, _1782);
    float _1792 = fma(_1740, _1604, _1784);
    float _1794 = _1714 * _1640;
    float _1796 = _1770 * _1640;
    float _1798 = _1716 * _1640;
    float _1800 = _1744 * _1640;
    float _1802 = fma(_1738, _1632, _1794);
    float _1804 = fma(_1776, _1632, _1796);
    float _1806 = fma(_1766, _1604, _1788);
    float _1808 = fma(_1766, _1632, _1800);
    float _1810 = _1714 * _1672;
    float _1812 = _1770 * _1672;
    float _1814 = _1716 * _1672;
    float _1816 = _1744 * _1672;
    float _1818 = fma(_1738, _1664, _1810);
    float _1820 = fma(_1776, _1664, _1812);
    float _1822 = fma(_1740, _1664, _1814);
    float _1824 = fma(_1766, _1664, _1816);
    float _1826 = fma(_1780, _1696, _1786);
    float _1828 = fma(_1740, _1632, _1798);
    float _1830 = fma(_1742, _1696, _1792);
    float _1832 = fma(_1736, _1696, _1790);
    float _1834 = _1826 + _1704;
    float _1836 = fma(_1774, _1696, _1806);
    float _1838 = fma(_1780, _1726, _1804);
    float _1840 = fma(_1736, _1726, _1802);
    float _1842 = fma(_1774, _1726, _1808);
    float _1844 = fma(_1742, _1726, _1828);
    float _1846 = _1838 + _1734;
    float _1848 = fma(_1780, _1756, _1820);
    float _1850 = fma(_1736, _1756, _1818);
    float _1852 = fma(_1742, _1756, _1822);
    float _1854 = fma(_1774, _1756, _1824);
    int _1856 = _1520 + 16;
    float _1858 = _1848 + _1764;
    int _1860 = _1520 + 32;
    int _1862 = _1520 + 48;
    uint _1864 = uint(int(uint(_1856) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1864)] = as_type<uint>(_1832);
    int _1866 = _1856 + 4;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1868)] = as_type<uint>(_1830);
    int _1870 = _1856 + 8;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1872)] = as_type<uint>(_1836);
    int _1874 = _1856 + 12;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1876)] = as_type<uint>(_1834);
    uint _1878 = uint(int(uint(_1860) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1878)] = as_type<uint>(_1840);
    int _1880 = _1860 + 4;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1882)] = as_type<uint>(_1844);
    int _1884 = _1860 + 8;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1886)] = as_type<uint>(_1842);
    int _1888 = _1860 + 12;
    uint _1890 = uint(int(uint(_1888) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1890)] = as_type<uint>(_1846);
    uint _1892 = uint(int(uint(_1862) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1892)] = as_type<uint>(_1850);
    int _1894 = _1862 + 4;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1896)] = as_type<uint>(_1852);
    int _1898 = _1862 + 8;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1900)] = as_type<uint>(_1854);
    int _1902 = _1862 + 12;
    uint _1904 = uint(int(uint(_1902) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1904)] = as_type<uint>(_1858);
}

