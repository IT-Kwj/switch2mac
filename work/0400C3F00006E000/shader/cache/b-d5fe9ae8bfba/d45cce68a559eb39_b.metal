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
int _58(thread const int& _4188, thread const int& _4189, constant _10& support_buffer)
{
    int _4192 = 1 + _4189;
    float _4194 = support_buffer._m5[_4192].x;
    bool _4196 = _4194 == 1.0;
    if (_4196)
    {
        return _4188;
    }
    float _4198 = float(_4188);
    float _4200 = _4198 * _4194;
    int _4202 = int(_4200);
    return _4202;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1154 = false;
    bool _728 = false;
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
    float _153 = 0.0;
    if (_125)
    {
        _153 = 2.8025969286496341418474591665798e-45;
    }
    float _155 = _153;
    int _157 = 0;
    if (_129)
    {
        uint _159 = uint(int(uint(_101) >> uint(2)));
        uint _161 = uint(int(uint(int(_159)) >> uint(2)));
        int _163 = int(_159) & 3;
        float _165 = (*spvDescriptorSet0.cp_c5)._m0[int(_161)][_163];
        _157 = as_type<int>(_165);
    }
    int _167 = _157;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _169 = _133;
    float _171 = _151;
    float _173 = as_type<float>(_68);
    float _175 = 0.0;
    float _177 = as_type<float>(_147);
    if (_125)
    {
        int _179 = _68;
        int _181 = 0;
        int _183 = _58(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _147;
        int _187 = 0;
        int _189 = _58(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1852 = int3(_183, _189, as_type<int>(_151));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1852.xy), uint(_1852.z), 0).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        _171 = _195;
        _173 = _197;
        _175 = _199;
    }
    float _201 = _171;
    float _203 = _173;
    float _205 = _175;
    float _207 = 0.0;
    float _209 = as_type<float>(_68);
    float _211 = 0.0;
    if (_125)
    {
        int _213 = _68;
        int _215 = 0;
        int _217 = _58(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _147;
        int _221 = 0;
        int _223 = _58(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _1880 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1880.xy), uint(_1880.z), 0).xyz;
        float _227 = _225.x;
        float _229 = _225.y;
        float _231 = _225.z;
        _207 = _227;
        _209 = _229;
        _211 = _231;
    }
    float _233 = _207;
    float _235 = _209;
    float _237 = _211;
    float _239 = _155;
    float _241 = as_type<float>(_68);
    float _243 = 0.0;
    if (_125)
    {
        int _245 = _68;
        int _247 = 0;
        int _249 = _58(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _147;
        int _253 = 0;
        int _255 = _58(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _1911 = int3(_249, _255, as_type<int>(_155));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1911.xy), uint(_1911.z), 0).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        _239 = _259;
        _241 = _261;
        _243 = _263;
    }
    float _265 = _239;
    float _267 = _241;
    float _269 = _243;
    float _271 = 0.0;
    float _273 = as_type<float>(_68);
    float _275 = 0.0;
    if (_129)
    {
        int _277 = _68;
        int _279 = 1;
        int _281 = _58(_277, _279, (*spvDescriptorSet0.support_buffer));
        int _283 = _167;
        int _285 = 1;
        int _287 = _58(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _1939 = int3(_281, _287, 0);
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1939.xy), uint(_1939.z), 0).xyz;
        float _291 = _289.x;
        float _293 = _289.y;
        float _295 = _289.z;
        _271 = _291;
        _273 = _293;
        _275 = _295;
    }
    float _297 = _271;
    float _299 = _273;
    float _301 = _275;
    float _303 = 0.0;
    float _305 = _121;
    float _307 = 0.0;
    float _309 = 0.0;
    if (_129)
    {
        int _311 = _68;
        int _313 = 1;
        int _315 = _58(_311, _313, (*spvDescriptorSet0.support_buffer));
        int _317 = _167;
        int _319 = 1;
        int _321 = _58(_317, _319, (*spvDescriptorSet0.support_buffer));
        int3 _1968 = int3(_315, _321, as_type<int>(_169));
        float4 _324 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1968.xy), uint(_1968.z), 0).xyzw;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = _324.w;
        _303 = _326;
        _305 = _328;
        _307 = _330;
        _309 = _332;
    }
    float _334 = _303;
    float _336 = _305;
    float _338 = _307;
    float _340 = _309;
    float _342 = 0.0;
    float _344 = 0.0;
    if (!_129)
    {
        _342 = 0.0;
        _344 = 0.0;
    }
    float _346 = _342;
    float _348 = _344;
    float _350 = 0.0;
    float _352 = 0.0;
    float _354 = _346;
    float _356 = _348;
    if (!_129)
    {
        _350 = 0.0;
        _352 = 0.0;
    }
    float _358 = _350;
    float _360 = _352;
    float _362 = 0.0;
    float _364 = _358;
    float _366 = _360;
    if (!_129)
    {
        _362 = 0.0;
    }
    float _368 = _362;
    float _370 = 0.0;
    float _372 = _368;
    if (!_129)
    {
        _370 = 0.0;
    }
    float _374 = _370;
    float _376 = 0.0;
    float _378 = _374;
    if (!_129)
    {
        _177 = 0.0;
        _376 = 0.0;
    }
    float _380 = _177;
    float _382 = _376;
    float _384 = _382;
    float _386 = _380;
    if (!_129)
    {
        _135 = 0.0;
    }
    float _388 = _135;
    float _390 = 0.0;
    float _392 = _388;
    if (!_129)
    {
        _390 = 0.0;
    }
    float _394 = _390;
    bool _396 = !_129;
    float _398 = _394;
    float _400 = _338;
    if (!_396)
    {
        int _402 = _68;
        int _404 = 1;
        int _406 = _58(_402, _404, (*spvDescriptorSet0.support_buffer));
        int _408 = _167;
        int _410 = 1;
        int _412 = _58(_408, _410, (*spvDescriptorSet0.support_buffer));
        int3 _2050 = int3(_406, _412, 2);
        float3 _414 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2050.xy), uint(_2050.z), 0).xyz;
        float _416 = _414.x;
        float _418 = _414.y;
        float _420 = _414.z;
        float _422 = _340 * 2.0;
        _372 = _334;
        _378 = _336;
        _392 = _338;
        _354 = _297;
        _356 = _299;
        _384 = _418;
        _364 = _420;
        _366 = _301;
        _386 = _416;
        _398 = _422;
    }
    float _424 = _372;
    float _426 = _378;
    float _428 = _392;
    float _430 = _354;
    float _432 = _356;
    float _434 = _384;
    float _436 = _364;
    float _438 = _366;
    float _440 = _386;
    float _442 = _398;
    bool _444 = !_125;
    float _446 = _430;
    float _448 = _432;
    int _450 = as_type<int>(_434);
    float _452 = _436;
    float _454 = _438;
    float _702;
    float _704;
    float _706;
    float _708;
    float _710;
    float _712;
    float _714;
    float _716;
    float _718;
    float _720;
    int _722;
    int _724;
    float _726;
    if (!_444)
    {
        float _456 = _424 * 0.15915493667125701904296875;
        float _458 = _426 * 0.15915493667125701904296875;
        float _460 = _428 * 0.15915493667125701904296875;
        float _462 = _203 * 0.15915493667125701904296875;
        float _464 = _456 * 6.283185482025146484375;
        float _466 = cos(_464);
        float _468 = _205 * 0.15915493667125701904296875;
        float _470 = _201 * 0.15915493667125701904296875;
        int _472 = _101 + 28;
        uint _474 = uint(int(uint(_472) >> uint(2)));
        uint _476 = uint(int(uint(int(_474)) >> uint(2)));
        int _478 = int(_474) & 3;
        float _480 = (*spvDescriptorSet0.cp_c5)._m0[int(_476)][_478];
        float _482 = _458 * 6.283185482025146484375;
        float _484 = cos(_482);
        int _486 = _101 + 20;
        uint _488 = uint(int(uint(_486) >> uint(2)));
        uint _490 = uint(int(uint(int(_488)) >> uint(2)));
        int _492 = int(_488) & 3;
        float _494 = (*spvDescriptorSet0.cp_c5)._m0[int(_490)][_492];
        float _496 = _460 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _460 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = _466 * _484;
        float _506 = _233 * _480;
        float _508 = _235 * _480;
        float _510 = _269 * _480;
        float _512 = _456 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _498 * _484;
        float _518 = fma(_430, _494, _506);
        float _520 = fma(_432, _494, _508);
        float _522 = _458 * 6.283185482025146484375;
        float _524 = sin(_522);
        float _526 = _466 * _502;
        float _528 = _484 * _502;
        float _530 = _462 * 6.283185482025146484375;
        float _532 = sin(_530);
        float _534 = _498 * _466;
        float _536 = _514 * _484;
        float _538 = _468 * 6.283185482025146484375;
        float _540 = sin(_538);
        float _542 = _514 * _524;
        float _544 = _470 * 6.283185482025146484375;
        float _546 = cos(_544);
        float _548 = _470 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _462 * 6.283185482025146484375;
        float _554 = cos(_552);
        float _556 = _540 * _546;
        float _558 = _468 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _514 * _498;
        float _564 = fma(_524, _526, _562);
        float _566 = _546 * _554;
        float _568 = _514 * _502;
        float _570 = -_534;
        float _572 = fma(_502, _542, _570);
        float _574 = fma(_498, _542, _526);
        float _576 = _550 * _532;
        float _578 = -_568;
        float _580 = fma(_524, _534, _578);
        float _582 = _540 * _554;
        float _584 = _524 * _494;
        float _586 = _546 * _560;
        float _588 = _550 * _560;
        float _590 = _554 * _560;
        float _592 = _550 * _540;
        float _594 = _550 * _554;
        float _596 = -_556;
        float _598 = fma(_560, _576, _596);
        float _600 = fma(_540, _576, _586);
        float _602 = _582 * _480;
        float _604 = -_588;
        float _606 = fma(_532, _556, _604);
        float _608 = fma(_532, _586, _592);
        float _610 = _590 * _480;
        float _612 = fma(_516, _494, _602);
        float _614 = _600 * _480;
        float _616 = _606 * _480;
        float _618 = fma(_528, _494, _610);
        float _620 = _598 * _480;
        float _622 = _612 * _612;
        float _624 = fma(_574, _494, _614);
        float _626 = _608 * _480;
        float _628 = fma(_580, _494, _616);
        float _630 = _594 * _480;
        float _632 = fma(_572, _494, _620);
        float _634 = fma(_618, _618, _622);
        float _636 = _624 * _624;
        float _638 = fma(_564, _494, _626);
        float _640 = _566 * _480;
        float _642 = _628 * _628;
        float _644 = -_532;
        float _646 = -_584;
        float _648 = fma(_644, _480, _646);
        float _650 = fma(_536, _494, _630);
        float _652 = fma(_632, _632, _636);
        float _654 = fma(_504, _494, _640);
        float _656 = fma(_638, _638, _642);
        float _658 = fma(_648, _648, _634);
        float _660 = fma(_650, _650, _652);
        float _662 = _267 * _480;
        float _664 = fma(_654, _654, _656);
        float _666 = rsqrt(_658);
        float _668 = _265 * _480;
        float _670 = fma(_434, _494, _662);
        float _672 = fma(_436, _494, _510);
        float _674 = rsqrt(_660);
        float _676 = _237 * _480;
        float _678 = fma(_438, _494, _676);
        float _680 = rsqrt(_664);
        float _682 = _618 * _666;
        float _684 = _612 * _666;
        float _686 = fma(_440, _494, _668);
        float _688 = _648 * _666;
        float _690 = _624 * _674;
        float _692 = _632 * _674;
        float _694 = _650 * _674;
        float _696 = _638 * _680;
        float _698 = _628 * _680;
        float _700 = _654 * _680;
        _446 = _518;
        _702 = _688;
        _704 = _682;
        _706 = _684;
        _448 = _520;
        _708 = _692;
        _710 = _690;
        _712 = _694;
        _714 = _678;
        _716 = _696;
        _718 = _698;
        _720 = _700;
        _722 = as_type<int>(_686);
        _450 = as_type<int>(_670);
        _724 = as_type<int>(_672);
        _400 = _638;
        _726 = _628;
        _728 = true;
    }
    else
    {
        float _730 = _424 * 2.0;
        float _732 = _428 * _442;
        float _734 = _426 * _442;
        float _736 = _424 * _442;
        float _738 = -_732;
        float _740 = fma(_730, _426, _738);
        float _742 = fma(_730, _426, _732);
        float _744 = fma(_730, _428, _734);
        float _746 = -_734;
        float _748 = fma(_730, _428, _746);
        float _750 = _426 * _426;
        float _752 = _424 * _424;
        float _754 = _426 * 2.0;
        float _756 = _428 * _428;
        float _758 = fma(_750, -2.0, 1.0);
        float _760 = fma(_752, -2.0, 1.0);
        float _762 = -_736;
        float _764 = fma(_754, _428, _762);
        float _766 = fma(_754, _428, _736);
        float _768 = fma(_756, -2.0, _758);
        float _770 = fma(_756, -2.0, _760);
        float _772 = fma(_750, -2.0, _760);
        _702 = _748;
        _704 = _768;
        _706 = _742;
        _708 = _740;
        _710 = _770;
        _712 = _766;
        _714 = _438;
        _716 = _744;
        _718 = _764;
        _720 = _772;
        _722 = as_type<int>(_440);
        _724 = as_type<int>(_436);
        _726 = _736;
    }
    _728 = false;
    float _774 = _446;
    float _776 = _702;
    float _778 = _704;
    float _780 = _706;
    float _782 = _448;
    float _784 = _708;
    float _786 = _710;
    float _788 = _712;
    float _790 = _714;
    float _792 = _716;
    float _794 = _718;
    float _796 = _720;
    int _798 = _722;
    int _800 = _450;
    int _802 = _724;
    float _804 = _400;
    float _806 = _726;
    float _808 = _774 * _776;
    float _810 = _774 * _778;
    float _812 = _774 * _780;
    float _814 = _782 * _784;
    float _816 = _782 * _786;
    float _818 = _782 * _788;
    int _820 = _68 * 48;
    float _822 = _790 * _792;
    float _824 = _790 * _794;
    float _826 = _790 * _796;
    bool _828 = _68 != 0;
    uint _830 = uint(int(uint(_820) >> uint(2)));
    _39[int(_830)] = as_type<uint>(_810);
    int _832 = _820 + 4;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    _39[int(_834)] = as_type<uint>(_814);
    int _836 = _820 + 8;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    _39[int(_838)] = as_type<uint>(_822);
    int _840 = _820 + 12;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    _39[int(_842)] = uint(_798);
    int _844 = _68 * 112;
    int _846 = _820 + 16;
    int _848 = _820 + 16;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    _39[int(_850)] = as_type<uint>(_812);
    int _852 = _820 + 20;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    _39[int(_854)] = as_type<uint>(_816);
    int _856 = _820 + 24;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    _39[int(_858)] = as_type<uint>(_824);
    int _860 = _820 + 28;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    _39[int(_862)] = uint(_800);
    int _864 = _820 + 32;
    int _866 = _820 + 32;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    _39[int(_868)] = as_type<uint>(_808);
    int _870 = _820 + 36;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    _39[int(_872)] = as_type<uint>(_818);
    int _874 = _820 + 40;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    _39[int(_876)] = as_type<uint>(_826);
    int _878 = _820 + 44;
    uint _880 = uint(int(uint(_878) >> uint(2)));
    _39[int(_880)] = uint(_802);
    float _882 = _804;
    float _884 = _806;
    float _886 = _794;
    float _888 = _790;
    float _890 = _782;
    float _892 = _774;
    float _894 = _812;
    float _896 = _816;
    float _898 = _824;
    float _900 = as_type<float>(_800);
    if (!_828)
    {
        _452 = _810;
    }
    float _902 = _452;
    float _904 = _902;
    if (!_828)
    {
        _454 = _814;
    }
    float _906 = _454;
    float _908 = _906;
    if (!_828)
    {
        _882 = _822;
    }
    float _910 = _882;
    float _912 = _910;
    if (!_828)
    {
        _884 = as_type<float>(_798);
    }
    float _914 = _884;
    float _916 = _914;
    if (!_828)
    {
        _886 = _808;
    }
    float _918 = _886;
    float _920 = _918;
    if (!_828)
    {
        _888 = _818;
    }
    float _922 = _888;
    float _924 = _922;
    if (!_828)
    {
        _890 = _826;
    }
    float _926 = _890;
    float _928 = _926;
    if (!_828)
    {
        _892 = as_type<float>(_802);
    }
    float _930 = _892;
    bool _932 = !_828;
    float _934 = _930;
    if (!_932)
    {
        bool _936 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _938 = !_936;
        if (!_938)
        {
            uint _940 = uint(int(uint(_844) >> uint(2)));
            uint _942 = uint(int(uint(int(_940)) >> uint(2)));
            int _944 = int(_940) & 3;
            float _946 = (*spvDescriptorSet0.cp_c6)._m0[int(_942)][_944];
            int _948 = as_type<int>(_946) * 48;
            int _950 = 0;
            bool _952;
            float _1050;
            float _1052;
            float _1060;
            float _1070;
            float _1072;
            float _1086;
            float _1096;
            float _1098;
            float _1100;
            float _1102;
            float _1104;
            float _1106;
            do
            {
                int _954 = _950;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _956 = uint(int(uint(_948) >> uint(2)));
                float _958 = as_type<float>(_39[int(_956)]);
                int _960 = _948 + 4;
                uint _962 = uint(int(uint(_960) >> uint(2)));
                float _964 = as_type<float>(_39[int(_962)]);
                int _966 = _948 + 8;
                uint _968 = uint(int(uint(_966) >> uint(2)));
                float _970 = as_type<float>(_39[int(_968)]);
                int _972 = _948 + 12;
                uint _974 = uint(int(uint(_972) >> uint(2)));
                float _976 = as_type<float>(_39[int(_974)]);
                int _978 = _954 + 1;
                int _980 = _948 + 16;
                uint _982 = uint(int(uint(_980) >> uint(2)));
                float _984 = as_type<float>(_39[int(_982)]);
                int _986 = _948 + 20;
                uint _988 = uint(int(uint(_986) >> uint(2)));
                float _990 = as_type<float>(_39[int(_988)]);
                int _992 = _948 + 24;
                uint _994 = uint(int(uint(_992) >> uint(2)));
                float _996 = as_type<float>(_39[int(_994)]);
                int _998 = _948 + 28;
                uint _1000 = uint(int(uint(_998) >> uint(2)));
                float _1002 = as_type<float>(_39[int(_1000)]);
                bool _1004 = uint(_978) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1006 = _948 + 32;
                uint _1008 = uint(int(uint(_1006) >> uint(2)));
                float _1010 = as_type<float>(_39[int(_1008)]);
                int _1012 = _948 + 36;
                uint _1014 = uint(int(uint(_1012) >> uint(2)));
                float _1016 = as_type<float>(_39[int(_1014)]);
                int _1018 = _948 + 40;
                uint _1020 = uint(int(uint(_1018) >> uint(2)));
                float _1022 = as_type<float>(_39[int(_1020)]);
                int _1024 = _948 + 44;
                uint _1026 = uint(int(uint(_1024) >> uint(2)));
                float _1028 = as_type<float>(_39[int(_1026)]);
                float _1030 = _964 * as_type<float>(_800);
                float _1032 = _812 * _964;
                float _1034 = _816 * _964;
                float _1036 = _824 * _964;
                float _1038 = fma(_958, as_type<float>(_798), _1030);
                float _1040 = fma(_810, _958, _1032);
                float _1042 = fma(_814, _958, _1034);
                float _1044 = fma(_822, _958, _1036);
                float _1046 = fma(_970, as_type<float>(_802), _1038);
                float _1048 = _990 * as_type<float>(_800);
                _1050 = fma(_808, _970, _1040);
                _1052 = fma(_818, _970, _1042);
                float _1054 = _812 * _990;
                float _1056 = _816 * _990;
                float _1058 = fma(_984, as_type<float>(_798), _1048);
                _1060 = _976 + _1046;
                float _1062 = fma(_810, _984, _1054);
                float _1064 = fma(_814, _984, _1056);
                float _1066 = fma(_996, as_type<float>(_802), _1058);
                float _1068 = _1016 * as_type<float>(_800);
                _1070 = fma(_808, _996, _1062);
                _1072 = fma(_818, _996, _1064);
                float _1074 = _824 * _990;
                float _1076 = _812 * _1016;
                float _1078 = _816 * _1016;
                float _1080 = _824 * _1016;
                float _1082 = fma(_1010, as_type<float>(_798), _1068);
                float _1084 = fma(_822, _984, _1074);
                _1086 = _1002 + _1066;
                float _1088 = fma(_810, _1010, _1076);
                float _1090 = fma(_814, _1010, _1078);
                float _1092 = fma(_822, _1010, _1080);
                float _1094 = fma(_1022, as_type<float>(_802), _1082);
                _1096 = fma(_826, _996, _1084);
                _1098 = fma(_826, _970, _1044);
                _1100 = fma(_808, _1022, _1088);
                _1102 = fma(_818, _1022, _1090);
                _1104 = fma(_826, _1022, _1092);
                _1106 = _1028 + _1094;
                uint _1108 = uint(int(uint(_820) >> uint(2)));
                _39[int(_1108)] = as_type<uint>(_1050);
                int _1110 = _820 + 4;
                uint _1112 = uint(int(uint(_1110) >> uint(2)));
                _39[int(_1112)] = as_type<uint>(_1052);
                int _1114 = _820 + 8;
                uint _1116 = uint(int(uint(_1114) >> uint(2)));
                _39[int(_1116)] = as_type<uint>(_1098);
                int _1118 = _820 + 12;
                uint _1120 = uint(int(uint(_1118) >> uint(2)));
                _39[int(_1120)] = as_type<uint>(_1060);
                int _1122 = _820 + 16;
                uint _1124 = uint(int(uint(_1122) >> uint(2)));
                _39[int(_1124)] = as_type<uint>(_1070);
                int _1126 = _820 + 20;
                uint _1128 = uint(int(uint(_1126) >> uint(2)));
                _39[int(_1128)] = as_type<uint>(_1072);
                int _1130 = _820 + 24;
                uint _1132 = uint(int(uint(_1130) >> uint(2)));
                _39[int(_1132)] = as_type<uint>(_1096);
                int _1134 = _820 + 28;
                uint _1136 = uint(int(uint(_1134) >> uint(2)));
                _39[int(_1136)] = as_type<uint>(_1086);
                int _1138 = _820 + 32;
                uint _1140 = uint(int(uint(_1138) >> uint(2)));
                _39[int(_1140)] = as_type<uint>(_1100);
                int _1142 = _820 + 36;
                uint _1144 = uint(int(uint(_1142) >> uint(2)));
                _39[int(_1144)] = as_type<uint>(_1102);
                int _1146 = _820 + 40;
                uint _1148 = uint(int(uint(_1146) >> uint(2)));
                _39[int(_1148)] = as_type<uint>(_1104);
                int _1150 = _820 + 44;
                uint _1152 = uint(int(uint(_1150) >> uint(2)));
                _39[int(_1152)] = as_type<uint>(_1106);
                _952 = !_1004;
                _950 = _978;
            } while (_952);
            _904 = _1050;
            _908 = _1052;
            _912 = _1098;
            _916 = _1060;
            _894 = _1070;
            _896 = _1072;
            _898 = _1096;
            _900 = _1086;
            _920 = _1100;
            _924 = _1102;
            _928 = _1104;
            _934 = _1106;
            _1154 = true;
        }
        else
        {
            _904 = 0.0;
            _908 = 0.0;
            _912 = 0.0;
            _916 = 0.0;
            _894 = 0.0;
            _896 = 0.0;
            _898 = 0.0;
            _900 = 0.0;
            _920 = 0.0;
            _924 = 0.0;
            _928 = 0.0;
            _934 = 0.0;
        }
    }
    _1154 = false;
    float _1156 = _904;
    float _1158 = _908;
    float _1160 = _912;
    float _1162 = _916;
    float _1164 = _894;
    float _1166 = _896;
    float _1168 = _898;
    float _1170 = _900;
    float _1172 = _920;
    float _1174 = _924;
    float _1176 = _928;
    float _1178 = _934;
    int _1180 = _844 + 80;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    uint _1184 = uint(int(uint(int(_1182)) >> uint(2)));
    int _1186 = int(_1182) & 3;
    float _1188 = (*spvDescriptorSet0.cp_c6)._m0[int(_1184)][_1186];
    int _1190 = int(_1182) + 1;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    int _1194 = _1190 & 3;
    float _1196 = (*spvDescriptorSet0.cp_c6)._m0[int(_1192)][_1194];
    bool _1198 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1200 = _844 + 64;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.cp_c6)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.cp_c6)._m0[int(_1212)][_1214];
    int _1218 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1220 = _1218 + _68;
    int _1222 = _844 + 88;
    uint _1224 = uint(int(uint(_1222) >> uint(2)));
    uint _1226 = uint(int(uint(int(_1224)) >> uint(2)));
    int _1228 = int(_1224) & 3;
    float _1230 = (*spvDescriptorSet0.cp_c6)._m0[int(_1226)][_1228];
    int _1232 = int(_1224) + 1;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    int _1236 = _1232 & 3;
    float _1238 = (*spvDescriptorSet0.cp_c6)._m0[int(_1234)][_1236];
    int _1240 = _844 + 72;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    uint _1244 = uint(int(uint(int(_1242)) >> uint(2)));
    int _1246 = int(_1242) & 3;
    float _1248 = (*spvDescriptorSet0.cp_c6)._m0[int(_1244)][_1246];
    int _1250 = int(_1242) + 1;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    int _1254 = _1250 & 3;
    float _1256 = (*spvDescriptorSet0.cp_c6)._m0[int(_1252)][_1254];
    int _1258 = _844 + 96;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
    int _1264 = int(_1260) & 3;
    float _1266 = (*spvDescriptorSet0.cp_c6)._m0[int(_1262)][_1264];
    int _1268 = int(_1260) + 1;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    int _1272 = _1268 & 3;
    float _1274 = (*spvDescriptorSet0.cp_c6)._m0[int(_1270)][_1272];
    int _1276 = _844 + 104;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.cp_c6)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.cp_c6)._m0[int(_1288)][_1290];
    int _1294 = _844 + 16;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.cp_c6)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.cp_c6)._m0[int(_1306)][_1308];
    if (!_1198)
    {
        uint _1312 = uint(int(uint(_820) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1312)] = as_type<uint>(_1156);
        int _1314 = _820 + 4;
        uint _1316 = uint(int(uint(_1314) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1316)] = as_type<uint>(_1158);
        int _1318 = _820 + 8;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1320)] = as_type<uint>(_1160);
        int _1322 = _820 + 12;
        uint _1324 = uint(int(uint(_1322) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1324)] = as_type<uint>(_1162);
        uint _1326 = uint(int(uint(_846) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1326)] = as_type<uint>(_1164);
        int _1328 = _846 + 4;
        uint _1330 = uint(int(uint(_1328) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1330)] = as_type<uint>(_1166);
        int _1332 = _846 + 8;
        uint _1334 = uint(int(uint(_1332) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1334)] = as_type<uint>(_1168);
        int _1336 = _846 + 12;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1338)] = as_type<uint>(_1170);
        uint _1340 = uint(int(uint(_864) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1340)] = as_type<uint>(_1172);
        int _1342 = _864 + 4;
        uint _1344 = uint(int(uint(_1342) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1344)] = as_type<uint>(_1174);
        int _1346 = _864 + 8;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1348)] = as_type<uint>(_1176);
        int _1350 = _864 + 12;
        uint _1352 = uint(int(uint(_1350) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1352)] = as_type<uint>(_1178);
    }
    float _1354 = _1166 * _1188;
    float _1356 = _1174 * _1188;
    int _1358 = _844 + 32;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.cp_c6)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.cp_c6)._m0[int(_1370)][_1372];
    float _1376 = _1158 * _1188;
    float _1378 = fma(_1164, _1208, _1354);
    float _1380 = fma(_1172, _1208, _1356);
    float _1382 = _1158 * _1196;
    float _1384 = _1166 * _1196;
    float _1386 = _1174 * _1196;
    float _1388 = _1158 * _1238;
    int _1390 = _844 + 48;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    uint _1394 = uint(int(uint(int(_1392)) >> uint(2)));
    int _1396 = int(_1392) & 3;
    float _1398 = (*spvDescriptorSet0.cp_c6)._m0[int(_1394)][_1396];
    int _1400 = int(_1392) + 1;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    int _1404 = _1400 & 3;
    float _1406 = (*spvDescriptorSet0.cp_c6)._m0[int(_1402)][_1404];
    float _1408 = fma(_1156, _1216, _1382);
    float _1410 = fma(_1164, _1216, _1384);
    float _1412 = fma(_1172, _1216, _1386);
    float _1414 = _1158 * _1230;
    float _1416 = _1166 * _1230;
    float _1418 = _1174 * _1230;
    float _1420 = _1166 * _1238;
    float _1422 = _1174 * _1238;
    float _1424 = fma(_1156, _1248, _1414);
    int _1426 = _844 + 24;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.cp_c6)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.cp_c6)._m0[int(_1438)][_1440];
    float _1444 = fma(_1156, _1256, _1388);
    float _1446 = fma(_1164, _1248, _1416);
    float _1448 = fma(_1164, _1256, _1420);
    float _1450 = fma(_1172, _1248, _1418);
    float _1452 = fma(_1172, _1256, _1422);
    float _1454 = fma(_1160, _1274, _1408);
    float _1456 = fma(_1168, _1266, _1378);
    int _1458 = _844 + 40;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    uint _1462 = uint(int(uint(int(_1460)) >> uint(2)));
    int _1464 = int(_1460) & 3;
    float _1466 = (*spvDescriptorSet0.cp_c6)._m0[int(_1462)][_1464];
    int _1468 = int(_1460) + 1;
    uint _1470 = uint(int(uint(_1468) >> uint(2)));
    int _1472 = _1468 & 3;
    float _1474 = (*spvDescriptorSet0.cp_c6)._m0[int(_1470)][_1472];
    float _1476 = fma(_1168, _1274, _1410);
    float _1478 = fma(_1168, _1284, _1446);
    float _1480 = fma(_1168, _1292, _1448);
    float _1482 = fma(_1160, _1292, _1444);
    float _1484 = fma(_1176, _1266, _1380);
    float _1486 = fma(_1176, _1274, _1412);
    float _1488 = _1480 + _1170;
    int _1490 = _844 + 56;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    uint _1494 = uint(int(uint(int(_1492)) >> uint(2)));
    int _1496 = int(_1492) & 3;
    float _1498 = (*spvDescriptorSet0.cp_c6)._m0[int(_1494)][_1496];
    int _1500 = int(_1492) + 1;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    int _1504 = _1500 & 3;
    float _1506 = (*spvDescriptorSet0.cp_c6)._m0[int(_1502)][_1504];
    float _1508 = fma(_1176, _1292, _1452);
    float _1510 = fma(_1176, _1284, _1450);
    float _1512 = fma(_1156, _1208, _1376);
    float _1514 = _1482 + _1162;
    float _1516 = _1488 * _1310;
    float _1518 = fma(_1160, _1284, _1424);
    float _1520 = _1508 + _1178;
    float _1522 = _1478 * _1310;
    float _1524 = fma(_1160, _1266, _1512);
    float _1526 = _1456 * _1310;
    float _1528 = _1476 * _1310;
    float _1530 = fma(_1514, _1302, _1516);
    float _1532 = fma(_1518, _1302, _1522);
    float _1534 = _1488 * _1374;
    float _1536 = _1456 * _1374;
    float _1538 = _1476 * _1374;
    float _1540 = _1478 * _1374;
    float _1542 = fma(_1514, _1366, _1534);
    int _1544 = _1220 * 48;
    float _1546 = fma(_1524, _1302, _1526);
    float _1548 = fma(_1454, _1302, _1528);
    float _1550 = _1488 * _1406;
    float _1552 = _1456 * _1406;
    float _1554 = _1476 * _1406;
    float _1556 = _1478 * _1406;
    float _1558 = fma(_1514, _1398, _1550);
    float _1560 = fma(_1524, _1366, _1536);
    float _1562 = fma(_1454, _1366, _1538);
    float _1564 = fma(_1518, _1366, _1540);
    float _1566 = fma(_1524, _1398, _1552);
    float _1568 = fma(_1454, _1398, _1554);
    float _1570 = fma(_1520, _1434, _1530);
    float _1572 = fma(_1518, _1398, _1556);
    float _1574 = fma(_1510, _1434, _1532);
    float _1576 = fma(_1484, _1434, _1546);
    float _1578 = fma(_1486, _1434, _1548);
    float _1580 = _1570 + _1442;
    int _1582 = _1544 + 16;
    float _1584 = fma(_1520, _1466, _1542);
    float _1586 = fma(_1484, _1466, _1560);
    float _1588 = fma(_1486, _1466, _1562);
    float _1590 = fma(_1510, _1466, _1564);
    float _1592 = _1584 + _1474;
    int _1594 = _1544 + 32;
    uint _1596 = uint(int(uint(_1582) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1596)] = as_type<uint>(_1576);
    int _1598 = _1582 + 4;
    uint _1600 = uint(int(uint(_1598) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1600)] = as_type<uint>(_1578);
    int _1602 = _1582 + 8;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1604)] = as_type<uint>(_1574);
    int _1606 = _1582 + 12;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1608)] = as_type<uint>(_1580);
    int _1610 = _1544 + 48;
    float _1612 = fma(_1520, _1498, _1558);
    float _1614 = fma(_1484, _1498, _1566);
    float _1616 = fma(_1486, _1498, _1568);
    float _1618 = fma(_1510, _1498, _1572);
    float _1620 = _1612 + _1506;
    uint _1622 = uint(int(uint(_1594) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1622)] = as_type<uint>(_1586);
    int _1624 = _1594 + 4;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1626)] = as_type<uint>(_1588);
    int _1628 = _1594 + 8;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1630)] = as_type<uint>(_1590);
    int _1632 = _1594 + 12;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1634)] = as_type<uint>(_1592);
    uint _1636 = uint(int(uint(_1610) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1636)] = as_type<uint>(_1614);
    int _1638 = _1610 + 4;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1640)] = as_type<uint>(_1616);
    int _1642 = _1610 + 8;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1644)] = as_type<uint>(_1618);
    int _1646 = _1610 + 12;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1648)] = as_type<uint>(_1620);
}

