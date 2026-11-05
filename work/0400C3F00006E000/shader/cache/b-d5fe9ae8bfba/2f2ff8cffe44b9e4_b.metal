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
int _58(thread const int& _3892, thread const int& _3893, constant _10& support_buffer)
{
    int _3896 = 1 + _3893;
    float _3898 = support_buffer._m5[_3896].x;
    bool _3900 = _3898 == 1.0;
    if (_3900)
    {
        return _3892;
    }
    float _3902 = float(_3892);
    float _3904 = _3902 * _3898;
    int _3906 = int(_3904);
    return _3906;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1036 = false;
    bool _604 = false;
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
    float _133 = _111;
    float _135 = _121;
    float _137 = _99;
    if (_125)
    {
        int _139 = _101 + 8;
        uint _141 = uint(int(uint(_139) >> uint(2)));
        uint _143 = uint(int(uint(int(_141)) >> uint(2)));
        int _145 = int(_141) & 3;
        float _147 = (*spvDescriptorSet0.cp_c5)._m0[int(_143)][_145];
        _131 = as_type<int>(_147);
    }
    int _149 = _131;
    float _151 = 0.0;
    if (_125)
    {
        _151 = 1.4012984643248170709237295832899e-45;
    }
    float _153 = _151;
    float _155 = 0.0;
    if (_125)
    {
        _155 = 2.8025969286496341418474591665798e-45;
    }
    float _157 = _155;
    int _159 = 0;
    if (_129)
    {
        uint _161 = uint(int(uint(_101) >> uint(2)));
        uint _163 = uint(int(uint(int(_161)) >> uint(2)));
        int _165 = int(_161) & 3;
        float _167 = (*spvDescriptorSet0.cp_c5)._m0[int(_163)][_165];
        _159 = as_type<int>(_167);
    }
    int _169 = _159;
    float _171 = 0.0;
    if (_129)
    {
        _171 = 1.4012984643248170709237295832899e-45;
    }
    float _173 = _171;
    float _175 = _153;
    float _177 = as_type<float>(_68);
    float _179 = 0.0;
    float _181 = as_type<float>(_149);
    if (_125)
    {
        int _183 = _68;
        int _185 = 0;
        int _187 = _58(_183, _185, (*spvDescriptorSet0.support_buffer));
        int _189 = _149;
        int _191 = 0;
        int _193 = _58(_189, _191, (*spvDescriptorSet0.support_buffer));
        int3 _1735 = int3(_187, _193, as_type<int>(_153));
        float3 _197 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1735.xy), uint(_1735.z), 0).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        _175 = _199;
        _177 = _201;
        _179 = _203;
    }
    float _205 = _175;
    float _207 = _177;
    float _209 = _179;
    float _211 = 0.0;
    float _213 = as_type<float>(_68);
    float _215 = 0.0;
    if (_125)
    {
        int _217 = _68;
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int _223 = _149;
        int _225 = 0;
        int _227 = _58(_223, _225, (*spvDescriptorSet0.support_buffer));
        int3 _1763 = int3(_221, _227, 0);
        float3 _229 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1763.xy), uint(_1763.z), 0).xyz;
        float _231 = _229.x;
        float _233 = _229.y;
        float _235 = _229.z;
        _211 = _231;
        _213 = _233;
        _215 = _235;
    }
    float _237 = _211;
    float _239 = _213;
    float _241 = _215;
    float _243 = _157;
    float _245 = as_type<float>(_68);
    float _247 = 0.0;
    if (_125)
    {
        int _249 = _68;
        int _251 = 0;
        int _253 = _58(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = _149;
        int _257 = 0;
        int _259 = _58(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1794 = int3(_253, _259, as_type<int>(_157));
        float3 _261 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1794.xy), uint(_1794.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        _243 = _263;
        _245 = _265;
        _247 = _267;
    }
    float _269 = _243;
    float _271 = _245;
    float _273 = _247;
    float _275 = 0.0;
    float _277 = as_type<float>(_68);
    float _279 = 0.0;
    if (_129)
    {
        int _281 = _68;
        int _283 = 1;
        int _285 = _58(_281, _283, (*spvDescriptorSet0.support_buffer));
        int _287 = _169;
        int _289 = 1;
        int _291 = _58(_287, _289, (*spvDescriptorSet0.support_buffer));
        int3 _1822 = int3(_285, _291, 0);
        float3 _293 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1822.xy), uint(_1822.z), 0).xyz;
        float _295 = _293.x;
        float _297 = _293.y;
        float _299 = _293.z;
        _275 = _295;
        _277 = _297;
        _279 = _299;
    }
    float _301 = _275;
    float _303 = _277;
    float _305 = _279;
    float _307 = 0.0;
    float _309 = 0.0;
    float _311 = 0.0;
    float _313 = 0.0;
    if (_129)
    {
        int _315 = _68;
        int _317 = 1;
        int _319 = _58(_315, _317, (*spvDescriptorSet0.support_buffer));
        int _321 = _169;
        int _323 = 1;
        int _325 = _58(_321, _323, (*spvDescriptorSet0.support_buffer));
        int3 _1850 = int3(_319, _325, as_type<int>(_173));
        float4 _328 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1850.xy), uint(_1850.z), 0).xyzw;
        float _330 = _328.x;
        float _332 = _328.y;
        float _334 = _328.z;
        float _336 = _328.w;
        _307 = _330;
        _309 = _332;
        _311 = _334;
        _313 = _336;
    }
    float _338 = _307;
    float _340 = _309;
    float _342 = _311;
    float _344 = _313;
    float _346 = 0.0;
    float _348 = 0.0;
    if (!_129)
    {
        _346 = 0.0;
        _348 = 0.0;
    }
    float _350 = _346;
    float _352 = _348;
    float _354 = 0.0;
    float _356 = 0.0;
    float _358 = _352;
    float _360 = _350;
    if (!_129)
    {
        _354 = 0.0;
        _356 = 0.0;
    }
    float _362 = _354;
    float _364 = _356;
    float _366 = 0.0;
    float _368 = _362;
    float _370 = _364;
    if (!_129)
    {
        _366 = 0.0;
    }
    float _372 = _366;
    float _374 = _372;
    if (!_129)
    {
        _133 = 0.0;
    }
    float _376 = _133;
    float _378 = 0.0;
    float _380 = _376;
    if (!_129)
    {
        _181 = 0.0;
        _378 = 0.0;
    }
    float _382 = _181;
    float _384 = _378;
    float _386 = _382;
    float _388 = _384;
    if (!_129)
    {
        _135 = 0.0;
    }
    float _390 = _135;
    float _392 = _390;
    if (!_129)
    {
        _137 = 0.0;
    }
    float _394 = _137;
    bool _396 = !_129;
    float _398 = _394;
    float _400 = _342;
    if (!_396)
    {
        int _402 = _68;
        int _404 = 1;
        int _406 = _58(_402, _404, (*spvDescriptorSet0.support_buffer));
        int _408 = _169;
        int _410 = 1;
        int _412 = _58(_408, _410, (*spvDescriptorSet0.support_buffer));
        int3 _1932 = int3(_406, _412, 2);
        float3 _414 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1932.xy), uint(_1932.z), 0).xyz;
        float _416 = _414.x;
        float _418 = _414.y;
        float _420 = _414.z;
        float _422 = _344 * 2.0;
        _374 = _338;
        _392 = _342;
        _380 = _340;
        _386 = _416;
        _358 = _301;
        _388 = _418;
        _368 = _303;
        _370 = _305;
        _360 = _420;
        _398 = _422;
    }
    float _424 = _374;
    float _426 = _392;
    float _428 = _380;
    float _430 = _386;
    float _432 = _358;
    float _434 = _388;
    float _436 = _368;
    float _438 = _370;
    float _440 = _360;
    float _442 = _398;
    bool _444 = !_125;
    float _446 = _432;
    float _448 = _436;
    float _450 = _438;
    float _452 = _430;
    float _454 = _434;
    float _456 = _440;
    float _578;
    float _580;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    float _592;
    float _594;
    int _596;
    int _598;
    int _600;
    float _602;
    if (!_444)
    {
        int _458 = _101 + 28;
        uint _460 = uint(int(uint(_458) >> uint(2)));
        uint _462 = uint(int(uint(int(_460)) >> uint(2)));
        int _464 = int(_460) & 3;
        float _466 = (*spvDescriptorSet0.cp_c5)._m0[int(_462)][_464];
        int _468 = _101 + 20;
        uint _470 = uint(int(uint(_468) >> uint(2)));
        uint _472 = uint(int(uint(int(_470)) >> uint(2)));
        int _474 = int(_470) & 3;
        float _476 = (*spvDescriptorSet0.cp_c5)._m0[int(_472)][_474];
        float _478 = _205 * _466;
        float _480 = _209 * _466;
        float _482 = _207 * _466;
        float _484 = _237 * _466;
        float _486 = _239 * _466;
        float _488 = _241 * _466;
        float _490 = _273 * _466;
        float _492 = fma(_424, _476, _478);
        float _494 = fma(_426, _476, _480);
        float _496 = fma(_428, _476, _482);
        float _498 = _269 * _466;
        float _500 = _492 * 0.15915493667125701904296875;
        float _502 = _494 * 0.15915493667125701904296875;
        float _504 = _496 * 0.15915493667125701904296875;
        float _506 = _271 * _466;
        float _508 = _500 * 6.283185482025146484375;
        float _510 = sin(_508);
        float _512 = fma(_430, _476, _498);
        float _514 = fma(_432, _476, _484);
        float _516 = fma(_434, _476, _506);
        float _518 = fma(_436, _476, _486);
        float _520 = fma(_438, _476, _488);
        float _522 = fma(_440, _476, _490);
        float _524 = _500 * 6.283185482025146484375;
        float _526 = cos(_524);
        float _528 = _502 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = _504 * 6.283185482025146484375;
        float _534 = sin(_532);
        float _536 = _502 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = _526 * _530;
        float _542 = _510 * _530;
        float _544 = _504 * 6.283185482025146484375;
        float _546 = cos(_544);
        float _548 = _510 * _534;
        float _550 = _538 * _526;
        float _552 = _510 * _538;
        float _554 = _526 * _546;
        float _556 = _546 * _530;
        float _558 = _538 * _546;
        float _560 = _510 * _546;
        float _562 = fma(_538, _548, _540);
        float _564 = fma(_534, _540, _552);
        float _566 = -_542;
        float _568 = fma(_534, _550, _566);
        float _570 = -_550;
        float _572 = fma(_530, _548, _570);
        float _574 = -_534;
        float _576 = _574 + (-0.0);
        _446 = _514;
        _578 = _576;
        _448 = _518;
        _580 = _572;
        _582 = _560;
        _584 = _556;
        _586 = _558;
        _588 = _562;
        _450 = _520;
        _590 = _564;
        _592 = _568;
        _594 = _554;
        _596 = as_type<int>(_512);
        _598 = as_type<int>(_516);
        _600 = as_type<int>(_522);
        _452 = _548;
        _454 = _542;
        _400 = _550;
        _602 = _538;
        _604 = true;
    }
    else
    {
        float _606 = _424 * 2.0;
        float _608 = _426 * _442;
        float _610 = _428 * _442;
        float _612 = _424 * _442;
        float _614 = _428 * _428;
        float _616 = -_608;
        float _618 = fma(_606, _428, _616);
        float _620 = fma(_606, _428, _608);
        float _622 = fma(_606, _426, _610);
        float _624 = -_610;
        float _626 = fma(_606, _426, _624);
        float _628 = _424 * _424;
        float _630 = _428 * 2.0;
        float _632 = _426 * _426;
        float _634 = fma(_614, -2.0, 1.0);
        float _636 = fma(_628, -2.0, 1.0);
        float _638 = -_612;
        float _640 = fma(_630, _426, _638);
        float _642 = fma(_630, _426, _612);
        float _644 = fma(_632, -2.0, _634);
        float _646 = fma(_632, -2.0, _636);
        float _648 = fma(_614, -2.0, _636);
        _578 = _626;
        _580 = _618;
        _582 = _642;
        _584 = _644;
        _586 = _620;
        _588 = _646;
        _590 = _622;
        _592 = _640;
        _594 = _648;
        _596 = as_type<int>(_430);
        _598 = as_type<int>(_434);
        _600 = as_type<int>(_440);
        _602 = _612;
    }
    _604 = false;
    float _650 = _446;
    float _652 = _578;
    float _654 = _448;
    float _656 = _580;
    float _658 = _582;
    float _660 = _584;
    float _662 = _586;
    float _664 = _588;
    float _666 = _450;
    float _668 = _590;
    float _670 = _592;
    float _672 = _594;
    int _674 = _596;
    int _676 = _598;
    int _678 = _600;
    float _680 = _452;
    float _682 = _454;
    float _684 = _400;
    float _686 = _602;
    float _688 = _650 * _652;
    float _690 = _654 * _656;
    float _692 = _654 * _658;
    float _694 = _650 * _660;
    float _696 = _650 * _662;
    float _698 = _654 * _664;
    int _700 = _68 * 48;
    float _702 = _666 * _668;
    float _704 = _666 * _670;
    float _706 = _666 * _672;
    bool _708 = _68 != 0;
    uint _710 = uint(int(uint(_700) >> uint(2)));
    _39[int(_710)] = as_type<uint>(_694);
    int _712 = _700 + 4;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    _39[int(_714)] = as_type<uint>(_690);
    int _716 = _700 + 8;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    _39[int(_718)] = as_type<uint>(_702);
    int _720 = _700 + 12;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    _39[int(_722)] = uint(_674);
    int _724 = _68 * 112;
    int _726 = _700 + 16;
    int _728 = _700 + 16;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    _39[int(_730)] = as_type<uint>(_696);
    int _732 = _700 + 20;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    _39[int(_734)] = as_type<uint>(_698);
    int _736 = _700 + 24;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    _39[int(_738)] = as_type<uint>(_704);
    int _740 = _700 + 28;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    _39[int(_742)] = uint(_676);
    int _744 = _700 + 32;
    int _746 = _700 + 32;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    _39[int(_748)] = as_type<uint>(_688);
    int _750 = _700 + 36;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    _39[int(_752)] = as_type<uint>(_692);
    int _754 = _700 + 40;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    _39[int(_756)] = as_type<uint>(_706);
    int _758 = _700 + 44;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    _39[int(_760)] = uint(_678);
    float _762 = _680;
    float _764 = _682;
    float _766 = _684;
    float _768 = _686;
    float _770 = _654;
    float _772 = _666;
    float _774 = _650;
    float _776 = _696;
    float _778 = _698;
    float _780 = _704;
    float _782 = as_type<float>(_676);
    if (!_708)
    {
        _762 = _694;
    }
    float _784 = _762;
    float _786 = _784;
    if (!_708)
    {
        _764 = _690;
    }
    float _788 = _764;
    float _790 = _788;
    if (!_708)
    {
        _766 = _702;
    }
    float _792 = _766;
    float _794 = _792;
    if (!_708)
    {
        _768 = as_type<float>(_674);
    }
    float _796 = _768;
    float _798 = _796;
    if (!_708)
    {
        _770 = _688;
    }
    float _800 = _770;
    float _802 = _800;
    if (!_708)
    {
        _772 = _692;
    }
    float _804 = _772;
    float _806 = _804;
    if (!_708)
    {
        _456 = _706;
    }
    float _808 = _456;
    float _810 = _808;
    if (!_708)
    {
        _774 = as_type<float>(_678);
    }
    float _812 = _774;
    bool _814 = !_708;
    float _816 = _812;
    if (!_814)
    {
        bool _818 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _820 = !_818;
        if (!_820)
        {
            uint _822 = uint(int(uint(_724) >> uint(2)));
            uint _824 = uint(int(uint(int(_822)) >> uint(2)));
            int _826 = int(_822) & 3;
            float _828 = (*spvDescriptorSet0.cp_c6)._m0[int(_824)][_826];
            int _830 = as_type<int>(_828) * 48;
            int _832 = 0;
            bool _834;
            float _932;
            float _934;
            float _942;
            float _952;
            float _954;
            float _968;
            float _978;
            float _980;
            float _982;
            float _984;
            float _986;
            float _988;
            do
            {
                int _836 = _832;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _838 = uint(int(uint(_830) >> uint(2)));
                float _840 = as_type<float>(_39[int(_838)]);
                int _842 = _830 + 4;
                uint _844 = uint(int(uint(_842) >> uint(2)));
                float _846 = as_type<float>(_39[int(_844)]);
                int _848 = _830 + 8;
                uint _850 = uint(int(uint(_848) >> uint(2)));
                float _852 = as_type<float>(_39[int(_850)]);
                int _854 = _830 + 12;
                uint _856 = uint(int(uint(_854) >> uint(2)));
                float _858 = as_type<float>(_39[int(_856)]);
                int _860 = _836 + 1;
                int _862 = _830 + 16;
                uint _864 = uint(int(uint(_862) >> uint(2)));
                float _866 = as_type<float>(_39[int(_864)]);
                int _868 = _830 + 20;
                uint _870 = uint(int(uint(_868) >> uint(2)));
                float _872 = as_type<float>(_39[int(_870)]);
                int _874 = _830 + 24;
                uint _876 = uint(int(uint(_874) >> uint(2)));
                float _878 = as_type<float>(_39[int(_876)]);
                int _880 = _830 + 28;
                uint _882 = uint(int(uint(_880) >> uint(2)));
                float _884 = as_type<float>(_39[int(_882)]);
                bool _886 = uint(_860) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _888 = _830 + 32;
                uint _890 = uint(int(uint(_888) >> uint(2)));
                float _892 = as_type<float>(_39[int(_890)]);
                int _894 = _830 + 36;
                uint _896 = uint(int(uint(_894) >> uint(2)));
                float _898 = as_type<float>(_39[int(_896)]);
                int _900 = _830 + 40;
                uint _902 = uint(int(uint(_900) >> uint(2)));
                float _904 = as_type<float>(_39[int(_902)]);
                int _906 = _830 + 44;
                uint _908 = uint(int(uint(_906) >> uint(2)));
                float _910 = as_type<float>(_39[int(_908)]);
                float _912 = _846 * as_type<float>(_676);
                float _914 = _696 * _846;
                float _916 = _698 * _846;
                float _918 = _704 * _846;
                float _920 = fma(_840, as_type<float>(_674), _912);
                float _922 = fma(_694, _840, _914);
                float _924 = fma(_690, _840, _916);
                float _926 = fma(_702, _840, _918);
                float _928 = fma(_852, as_type<float>(_678), _920);
                float _930 = _872 * as_type<float>(_676);
                _932 = fma(_688, _852, _922);
                _934 = fma(_692, _852, _924);
                float _936 = _696 * _872;
                float _938 = _698 * _872;
                float _940 = fma(_866, as_type<float>(_674), _930);
                _942 = _858 + _928;
                float _944 = fma(_694, _866, _936);
                float _946 = fma(_690, _866, _938);
                float _948 = fma(_878, as_type<float>(_678), _940);
                float _950 = _898 * as_type<float>(_676);
                _952 = fma(_688, _878, _944);
                _954 = fma(_692, _878, _946);
                float _956 = _704 * _872;
                float _958 = _696 * _898;
                float _960 = _698 * _898;
                float _962 = _704 * _898;
                float _964 = fma(_892, as_type<float>(_674), _950);
                float _966 = fma(_702, _866, _956);
                _968 = _884 + _948;
                float _970 = fma(_694, _892, _958);
                float _972 = fma(_690, _892, _960);
                float _974 = fma(_702, _892, _962);
                float _976 = fma(_904, as_type<float>(_678), _964);
                _978 = fma(_706, _878, _966);
                _980 = fma(_706, _852, _926);
                _982 = fma(_688, _904, _970);
                _984 = fma(_692, _904, _972);
                _986 = fma(_706, _904, _974);
                _988 = _910 + _976;
                uint _990 = uint(int(uint(_700) >> uint(2)));
                _39[int(_990)] = as_type<uint>(_932);
                int _992 = _700 + 4;
                uint _994 = uint(int(uint(_992) >> uint(2)));
                _39[int(_994)] = as_type<uint>(_934);
                int _996 = _700 + 8;
                uint _998 = uint(int(uint(_996) >> uint(2)));
                _39[int(_998)] = as_type<uint>(_980);
                int _1000 = _700 + 12;
                uint _1002 = uint(int(uint(_1000) >> uint(2)));
                _39[int(_1002)] = as_type<uint>(_942);
                int _1004 = _700 + 16;
                uint _1006 = uint(int(uint(_1004) >> uint(2)));
                _39[int(_1006)] = as_type<uint>(_952);
                int _1008 = _700 + 20;
                uint _1010 = uint(int(uint(_1008) >> uint(2)));
                _39[int(_1010)] = as_type<uint>(_954);
                int _1012 = _700 + 24;
                uint _1014 = uint(int(uint(_1012) >> uint(2)));
                _39[int(_1014)] = as_type<uint>(_978);
                int _1016 = _700 + 28;
                uint _1018 = uint(int(uint(_1016) >> uint(2)));
                _39[int(_1018)] = as_type<uint>(_968);
                int _1020 = _700 + 32;
                uint _1022 = uint(int(uint(_1020) >> uint(2)));
                _39[int(_1022)] = as_type<uint>(_982);
                int _1024 = _700 + 36;
                uint _1026 = uint(int(uint(_1024) >> uint(2)));
                _39[int(_1026)] = as_type<uint>(_984);
                int _1028 = _700 + 40;
                uint _1030 = uint(int(uint(_1028) >> uint(2)));
                _39[int(_1030)] = as_type<uint>(_986);
                int _1032 = _700 + 44;
                uint _1034 = uint(int(uint(_1032) >> uint(2)));
                _39[int(_1034)] = as_type<uint>(_988);
                _834 = !_886;
                _832 = _860;
            } while (_834);
            _786 = _932;
            _790 = _934;
            _794 = _980;
            _798 = _942;
            _776 = _952;
            _778 = _954;
            _780 = _978;
            _782 = _968;
            _802 = _982;
            _806 = _984;
            _810 = _986;
            _816 = _988;
            _1036 = true;
        }
        else
        {
            _786 = 0.0;
            _790 = 0.0;
            _794 = 0.0;
            _798 = 0.0;
            _776 = 0.0;
            _778 = 0.0;
            _780 = 0.0;
            _782 = 0.0;
            _802 = 0.0;
            _806 = 0.0;
            _810 = 0.0;
            _816 = 0.0;
        }
    }
    _1036 = false;
    float _1038 = _786;
    float _1040 = _790;
    float _1042 = _794;
    float _1044 = _798;
    float _1046 = _776;
    float _1048 = _778;
    float _1050 = _780;
    float _1052 = _782;
    float _1054 = _802;
    float _1056 = _806;
    float _1058 = _810;
    float _1060 = _816;
    int _1062 = _724 + 80;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.cp_c6)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.cp_c6)._m0[int(_1074)][_1076];
    bool _1080 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1082 = _724 + 64;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    uint _1086 = uint(int(uint(int(_1084)) >> uint(2)));
    int _1088 = int(_1084) & 3;
    float _1090 = (*spvDescriptorSet0.cp_c6)._m0[int(_1086)][_1088];
    int _1092 = int(_1084) + 1;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    int _1096 = _1092 & 3;
    float _1098 = (*spvDescriptorSet0.cp_c6)._m0[int(_1094)][_1096];
    int _1100 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1102 = _1100 + _68;
    int _1104 = _724 + 88;
    uint _1106 = uint(int(uint(_1104) >> uint(2)));
    uint _1108 = uint(int(uint(int(_1106)) >> uint(2)));
    int _1110 = int(_1106) & 3;
    float _1112 = (*spvDescriptorSet0.cp_c6)._m0[int(_1108)][_1110];
    int _1114 = int(_1106) + 1;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    int _1118 = _1114 & 3;
    float _1120 = (*spvDescriptorSet0.cp_c6)._m0[int(_1116)][_1118];
    int _1122 = _724 + 72;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
    int _1128 = int(_1124) & 3;
    float _1130 = (*spvDescriptorSet0.cp_c6)._m0[int(_1126)][_1128];
    int _1132 = int(_1124) + 1;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    int _1136 = _1132 & 3;
    float _1138 = (*spvDescriptorSet0.cp_c6)._m0[int(_1134)][_1136];
    int _1140 = _724 + 96;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    uint _1144 = uint(int(uint(int(_1142)) >> uint(2)));
    int _1146 = int(_1142) & 3;
    float _1148 = (*spvDescriptorSet0.cp_c6)._m0[int(_1144)][_1146];
    int _1150 = int(_1142) + 1;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    int _1154 = _1150 & 3;
    float _1156 = (*spvDescriptorSet0.cp_c6)._m0[int(_1152)][_1154];
    int _1158 = _724 + 104;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.cp_c6)._m0[int(_1162)][_1164];
    int _1168 = int(_1160) + 1;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    int _1172 = _1168 & 3;
    float _1174 = (*spvDescriptorSet0.cp_c6)._m0[int(_1170)][_1172];
    int _1176 = _724 + 16;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
    int _1182 = int(_1178) & 3;
    float _1184 = (*spvDescriptorSet0.cp_c6)._m0[int(_1180)][_1182];
    int _1186 = int(_1178) + 1;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    int _1190 = _1186 & 3;
    float _1192 = (*spvDescriptorSet0.cp_c6)._m0[int(_1188)][_1190];
    if (!_1080)
    {
        uint _1194 = uint(int(uint(_700) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1194)] = as_type<uint>(_1038);
        int _1196 = _700 + 4;
        uint _1198 = uint(int(uint(_1196) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1198)] = as_type<uint>(_1040);
        int _1200 = _700 + 8;
        uint _1202 = uint(int(uint(_1200) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1202)] = as_type<uint>(_1042);
        int _1204 = _700 + 12;
        uint _1206 = uint(int(uint(_1204) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1206)] = as_type<uint>(_1044);
        uint _1208 = uint(int(uint(_726) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1208)] = as_type<uint>(_1046);
        int _1210 = _726 + 4;
        uint _1212 = uint(int(uint(_1210) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1212)] = as_type<uint>(_1048);
        int _1214 = _726 + 8;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1216)] = as_type<uint>(_1050);
        int _1218 = _726 + 12;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1220)] = as_type<uint>(_1052);
        uint _1222 = uint(int(uint(_744) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1222)] = as_type<uint>(_1054);
        int _1224 = _744 + 4;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1226)] = as_type<uint>(_1056);
        int _1228 = _744 + 8;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1230)] = as_type<uint>(_1058);
        int _1232 = _744 + 12;
        uint _1234 = uint(int(uint(_1232) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1234)] = as_type<uint>(_1060);
    }
    float _1236 = _1048 * _1070;
    float _1238 = _1056 * _1070;
    int _1240 = _724 + 32;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.cp_c6)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.cp_c6)._m0[int(_1252)][_1254];
    float _1258 = _1040 * _1070;
    float _1260 = fma(_1046, _1090, _1236);
    float _1262 = fma(_1054, _1090, _1238);
    float _1264 = _1040 * _1078;
    float _1266 = _1048 * _1078;
    float _1268 = _1056 * _1078;
    float _1270 = _1040 * _1120;
    int _1272 = _724 + 48;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.cp_c6)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.cp_c6)._m0[int(_1284)][_1286];
    float _1290 = fma(_1038, _1098, _1264);
    float _1292 = fma(_1046, _1098, _1266);
    float _1294 = fma(_1054, _1098, _1268);
    float _1296 = _1040 * _1112;
    float _1298 = _1048 * _1112;
    float _1300 = _1048 * _1120;
    float _1302 = _1056 * _1112;
    float _1304 = _1056 * _1120;
    int _1306 = _724 + 24;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    uint _1310 = uint(int(uint(int(_1308)) >> uint(2)));
    int _1312 = int(_1308) & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    int _1316 = int(_1308) + 1;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    int _1320 = _1316 & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    float _1324 = fma(_1038, _1130, _1296);
    float _1326 = fma(_1038, _1138, _1270);
    float _1328 = fma(_1046, _1130, _1298);
    float _1330 = fma(_1046, _1138, _1300);
    float _1332 = fma(_1054, _1130, _1302);
    float _1334 = fma(_1054, _1138, _1304);
    float _1336 = fma(_1042, _1156, _1290);
    int _1338 = _724 + 40;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    uint _1342 = uint(int(uint(int(_1340)) >> uint(2)));
    int _1344 = int(_1340) & 3;
    float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
    int _1348 = int(_1340) + 1;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    int _1352 = _1348 & 3;
    float _1354 = (*spvDescriptorSet0.cp_c6)._m0[int(_1350)][_1352];
    float _1356 = fma(_1050, _1148, _1260);
    float _1358 = fma(_1050, _1156, _1292);
    float _1360 = fma(_1050, _1166, _1328);
    float _1362 = fma(_1050, _1174, _1330);
    float _1364 = fma(_1042, _1174, _1326);
    float _1366 = fma(_1058, _1174, _1334);
    float _1368 = fma(_1038, _1090, _1258);
    int _1370 = _724 + 56;
    uint _1372 = uint(int(uint(_1370) >> uint(2)));
    uint _1374 = uint(int(uint(int(_1372)) >> uint(2)));
    int _1376 = int(_1372) & 3;
    float _1378 = (*spvDescriptorSet0.cp_c6)._m0[int(_1374)][_1376];
    int _1380 = int(_1372) + 1;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    int _1384 = _1380 & 3;
    float _1386 = (*spvDescriptorSet0.cp_c6)._m0[int(_1382)][_1384];
    float _1388 = _1362 + _1052;
    float _1390 = _1364 + _1044;
    float _1392 = _1366 + _1060;
    float _1394 = fma(_1042, _1148, _1368);
    float _1396 = _1388 * _1192;
    float _1398 = fma(_1058, _1148, _1262);
    float _1400 = fma(_1058, _1156, _1294);
    float _1402 = fma(_1058, _1166, _1332);
    float _1404 = _1356 * _1192;
    float _1406 = _1358 * _1192;
    float _1408 = fma(_1042, _1166, _1324);
    float _1410 = _1360 * _1192;
    float _1412 = fma(_1390, _1184, _1396);
    float _1414 = fma(_1394, _1184, _1404);
    float _1416 = _1388 * _1256;
    float _1418 = _1356 * _1256;
    float _1420 = _1358 * _1256;
    float _1422 = _1360 * _1256;
    float _1424 = fma(_1390, _1248, _1416);
    float _1426 = fma(_1336, _1184, _1406);
    int _1428 = _1102 * 48;
    float _1430 = fma(_1408, _1184, _1410);
    float _1432 = _1388 * _1288;
    float _1434 = _1356 * _1288;
    float _1436 = _1358 * _1288;
    float _1438 = _1360 * _1288;
    float _1440 = fma(_1390, _1280, _1432);
    float _1442 = fma(_1394, _1248, _1418);
    float _1444 = fma(_1336, _1248, _1420);
    float _1446 = fma(_1408, _1248, _1422);
    float _1448 = fma(_1394, _1280, _1434);
    float _1450 = fma(_1392, _1314, _1412);
    float _1452 = fma(_1336, _1280, _1436);
    float _1454 = fma(_1408, _1280, _1438);
    float _1456 = fma(_1398, _1314, _1414);
    float _1458 = fma(_1400, _1314, _1426);
    float _1460 = fma(_1402, _1314, _1430);
    float _1462 = _1450 + _1322;
    int _1464 = _1428 + 16;
    float _1466 = fma(_1392, _1346, _1424);
    float _1468 = fma(_1398, _1346, _1442);
    float _1470 = fma(_1400, _1346, _1444);
    float _1472 = fma(_1402, _1346, _1446);
    float _1474 = _1466 + _1354;
    int _1476 = _1428 + 32;
    int _1478 = _1428 + 48;
    float _1480 = fma(_1392, _1378, _1440);
    float _1482 = fma(_1398, _1378, _1448);
    float _1484 = fma(_1400, _1378, _1452);
    float _1486 = fma(_1402, _1378, _1454);
    float _1488 = _1480 + _1386;
    uint _1490 = uint(int(uint(_1464) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1490)] = as_type<uint>(_1456);
    int _1492 = _1464 + 4;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1494)] = as_type<uint>(_1458);
    int _1496 = _1464 + 8;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1498)] = as_type<uint>(_1460);
    int _1500 = _1464 + 12;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1502)] = as_type<uint>(_1462);
    uint _1504 = uint(int(uint(_1476) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1504)] = as_type<uint>(_1468);
    int _1506 = _1476 + 4;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1508)] = as_type<uint>(_1470);
    int _1510 = _1476 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1512)] = as_type<uint>(_1472);
    int _1514 = _1476 + 12;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1516)] = as_type<uint>(_1474);
    uint _1518 = uint(int(uint(_1478) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1518)] = as_type<uint>(_1482);
    int _1520 = _1478 + 4;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1522)] = as_type<uint>(_1484);
    int _1524 = _1478 + 8;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1526)] = as_type<uint>(_1486);
    int _1528 = _1478 + 12;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1530)] = as_type<uint>(_1488);
}

