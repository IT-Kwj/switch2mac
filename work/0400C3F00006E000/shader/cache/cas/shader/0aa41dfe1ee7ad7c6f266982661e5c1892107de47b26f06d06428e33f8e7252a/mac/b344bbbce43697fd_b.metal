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
int _58(thread const int& _4157, thread const int& _4158, constant _10& support_buffer)
{
    int _4161 = 1 + _4158;
    float _4163 = support_buffer._m5[_4161].x;
    bool _4165 = _4163 == 1.0;
    if (_4165)
    {
        return _4157;
    }
    float _4167 = float(_4157);
    float _4169 = _4167 * _4163;
    int _4171 = int(_4169);
    return _4171;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1184 = false;
    bool _724 = false;
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
    float _135 = _121;
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
        int3 _1838 = int3(_183, _189, as_type<int>(_151));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1838.xy), uint(_1838.z), 0).xyz;
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
        int3 _1866 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1866.xy), uint(_1866.z), 0).xyz;
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
        int3 _1897 = int3(_249, _255, as_type<int>(_155));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1897.xy), uint(_1897.z), 0).xyz;
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
    float _275 = _111;
    if (_129)
    {
        int _277 = _68;
        int _279 = 1;
        int _281 = _58(_277, _279, (*spvDescriptorSet0.support_buffer));
        int _283 = _167;
        int _285 = 1;
        int _287 = _58(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _1926 = int3(_281, _287, 0);
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1926.xy), uint(_1926.z), 0).xyz;
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
    float _305 = 0.0;
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
        int3 _1954 = int3(_315, _321, as_type<int>(_169));
        float4 _324 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1954.xy), uint(_1954.z), 0).xyzw;
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
    float _352 = _346;
    float _354 = _348;
    if (!_129)
    {
        _350 = 0.0;
    }
    float _356 = _350;
    float _358 = 0.0;
    float _360 = _356;
    if (!_129)
    {
        _135 = 0.0;
        _358 = 0.0;
    }
    float _362 = _135;
    float _364 = _358;
    float _366 = 0.0;
    float _368 = _362;
    float _370 = _364;
    if (!_129)
    {
        _366 = 0.0;
    }
    float _372 = _366;
    float _374 = 0.0;
    float _376 = _372;
    if (!_129)
    {
        _177 = 0.0;
        _374 = 0.0;
    }
    float _378 = _177;
    float _380 = _374;
    float _382 = 0.0;
    float _384 = _380;
    float _386 = _378;
    if (!_129)
    {
        _382 = 0.0;
    }
    float _388 = _382;
    float _390 = 0.0;
    float _392 = _388;
    if (!_129)
    {
        _390 = 0.0;
    }
    float _394 = _390;
    bool _396 = !_129;
    float _398 = _394;
    if (!_396)
    {
        int _400 = _68;
        int _402 = 1;
        int _404 = _58(_400, _402, (*spvDescriptorSet0.support_buffer));
        int _406 = _167;
        int _408 = 1;
        int _410 = _58(_406, _408, (*spvDescriptorSet0.support_buffer));
        int3 _2035 = int3(_404, _410, 2);
        float3 _412 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2035.xy), uint(_2035.z), 0).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _340 * 2.0;
        _392 = _334;
        _368 = _336;
        _398 = _338;
        _352 = _297;
        _384 = _416;
        _376 = _418;
        _360 = _299;
        _354 = _301;
        _386 = _414;
        _370 = _420;
    }
    float _422 = _392;
    float _424 = _368;
    float _426 = _398;
    float _428 = _352;
    float _430 = _384;
    float _432 = _376;
    float _434 = _360;
    float _436 = _354;
    float _438 = _386;
    float _440 = _370;
    bool _442 = !_125;
    float _444 = _428;
    int _446 = as_type<int>(_430);
    int _448 = as_type<int>(_432);
    float _450 = _434;
    float _452 = _436;
    float _700;
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
    if (!_442)
    {
        float _454 = _422 * 0.15915493667125701904296875;
        float _456 = _424 * 0.15915493667125701904296875;
        float _458 = _426 * 0.15915493667125701904296875;
        float _460 = _203 * 0.15915493667125701904296875;
        float _462 = _454 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = _205 * 0.15915493667125701904296875;
        int _468 = _101 + 28;
        uint _470 = uint(int(uint(_468) >> uint(2)));
        uint _472 = uint(int(uint(int(_470)) >> uint(2)));
        int _474 = int(_470) & 3;
        float _476 = (*spvDescriptorSet0.cp_c5)._m0[int(_472)][_474];
        float _478 = _201 * 0.15915493667125701904296875;
        float _480 = _456 * 6.283185482025146484375;
        float _482 = cos(_480);
        int _484 = _101 + 20;
        uint _486 = uint(int(uint(_484) >> uint(2)));
        uint _488 = uint(int(uint(int(_486)) >> uint(2)));
        int _490 = int(_486) & 3;
        float _492 = (*spvDescriptorSet0.cp_c5)._m0[int(_488)][_490];
        float _494 = _458 * 6.283185482025146484375;
        float _496 = sin(_494);
        float _498 = _458 * 6.283185482025146484375;
        float _500 = cos(_498);
        float _502 = _464 * _482;
        float _504 = _233 * _476;
        float _506 = _235 * _476;
        float _508 = _237 * _476;
        float _510 = _454 * 6.283185482025146484375;
        float _512 = sin(_510);
        float _514 = _496 * _482;
        float _516 = fma(_428, _492, _504);
        float _518 = _456 * 6.283185482025146484375;
        float _520 = sin(_518);
        float _522 = _464 * _500;
        float _524 = _496 * _464;
        float _526 = _460 * 6.283185482025146484375;
        float _528 = cos(_526);
        float _530 = _512 * _500;
        float _532 = _482 * _500;
        float _534 = _512 * _482;
        float _536 = _466 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = _512 * _520;
        float _542 = -_530;
        float _544 = fma(_520, _524, _542);
        float _546 = -_524;
        float _548 = fma(_500, _540, _546);
        float _550 = fma(_496, _540, _522);
        float _552 = _466 * 6.283185482025146484375;
        float _554 = cos(_552);
        float _556 = _478 * 6.283185482025146484375;
        float _558 = cos(_556);
        float _560 = _512 * _496;
        float _562 = _538 * _528;
        float _564 = fma(_520, _522, _560);
        float _566 = _562 * _476;
        float _568 = _520 * _492;
        float _570 = _460 * 6.283185482025146484375;
        float _572 = sin(_570);
        float _574 = _528 * _554;
        float _576 = fma(_514, _492, _566);
        float _578 = _267 * _476;
        float _580 = fma(_430, _492, _578);
        float _582 = _478 * 6.283185482025146484375;
        float _584 = sin(_582);
        float _586 = _558 * _554;
        float _588 = _538 * _558;
        float _590 = _558 * _528;
        float _592 = _269 * _476;
        float _594 = fma(_432, _492, _592);
        float _596 = _584 * _572;
        float _598 = _584 * _538;
        float _600 = _584 * _554;
        float _602 = _584 * _528;
        float _604 = -_588;
        float _606 = fma(_554, _596, _604);
        float _608 = fma(_538, _596, _586);
        float _610 = fma(_572, _586, _598);
        float _612 = _574 * _476;
        float _614 = -_600;
        float _616 = fma(_572, _588, _614);
        float _618 = _576 * _576;
        float _620 = _608 * _476;
        float _622 = fma(_532, _492, _612);
        float _624 = _616 * _476;
        float _626 = -_572;
        float _628 = -_568;
        float _630 = fma(_626, _476, _628);
        float _632 = _606 * _476;
        float _634 = fma(_622, _622, _618);
        float _636 = _610 * _476;
        float _638 = fma(_550, _492, _620);
        float _640 = fma(_544, _492, _624);
        float _642 = _602 * _476;
        float _644 = fma(_630, _630, _634);
        float _646 = fma(_548, _492, _632);
        float _648 = fma(_564, _492, _636);
        float _650 = _638 * _638;
        float _652 = _590 * _476;
        float _654 = _640 * _640;
        float _656 = fma(_534, _492, _642);
        float _658 = fma(_646, _646, _650);
        float _660 = fma(_502, _492, _652);
        float _662 = fma(_648, _648, _654);
        float _664 = rsqrt(_644);
        float _666 = fma(_656, _656, _658);
        float _668 = _265 * _476;
        float _670 = fma(_660, _660, _662);
        float _672 = fma(_434, _492, _506);
        float _674 = fma(_436, _492, _508);
        float _676 = rsqrt(_666);
        float _678 = rsqrt(_670);
        float _680 = _622 * _664;
        float _682 = _576 * _664;
        float _684 = _630 * _664;
        float _686 = fma(_438, _492, _668);
        float _688 = _646 * _676;
        float _690 = _638 * _676;
        float _692 = _656 * _676;
        float _694 = _648 * _678;
        float _696 = _640 * _678;
        float _698 = _660 * _678;
        _444 = _516;
        _700 = _680;
        _702 = _682;
        _704 = _684;
        _706 = _672;
        _708 = _688;
        _710 = _690;
        _712 = _692;
        _714 = _674;
        _716 = _694;
        _718 = _696;
        _720 = _698;
        _722 = as_type<int>(_686);
        _446 = as_type<int>(_580);
        _448 = as_type<int>(_594);
        _724 = true;
    }
    else
    {
        float _726 = _422 * 2.0;
        float _728 = _426 * _440;
        float _730 = _424 * _440;
        float _732 = _422 * _440;
        float _734 = _424 * _424;
        float _736 = -_728;
        float _738 = fma(_726, _424, _736);
        float _740 = fma(_726, _424, _728);
        float _742 = fma(_726, _426, _730);
        float _744 = -_730;
        float _746 = fma(_726, _426, _744);
        float _748 = _422 * _422;
        float _750 = _424 * 2.0;
        float _752 = _426 * _426;
        float _754 = fma(_734, -2.0, 1.0);
        float _756 = fma(_748, -2.0, 1.0);
        float _758 = -_732;
        float _760 = fma(_750, _426, _758);
        float _762 = fma(_750, _426, _732);
        float _764 = fma(_752, -2.0, _754);
        float _766 = fma(_752, -2.0, _756);
        float _768 = fma(_734, -2.0, _756);
        _700 = _764;
        _702 = _740;
        _704 = _746;
        _706 = _434;
        _708 = _738;
        _710 = _766;
        _712 = _762;
        _714 = _436;
        _716 = _742;
        _718 = _760;
        _720 = _768;
        _722 = as_type<int>(_438);
    }
    _724 = false;
    float _770 = _444;
    float _772 = _700;
    float _774 = _702;
    float _776 = _704;
    float _778 = _706;
    float _780 = _708;
    float _782 = _710;
    float _784 = _712;
    float _786 = _714;
    float _788 = _716;
    float _790 = _718;
    float _792 = _720;
    int _794 = _722;
    int _796 = _446;
    int _798 = _448;
    float _800 = _770 * _772;
    float _802 = _770 * _774;
    float _804 = _770 * _776;
    float _806 = _778 * _780;
    float _808 = _778 * _782;
    float _810 = _778 * _784;
    int _812 = _68 * 48;
    float _814 = _786 * _788;
    float _816 = _786 * _790;
    float _818 = _786 * _792;
    int _820 = _68 * 112;
    uint _822 = uint(int(uint(_812) >> uint(2)));
    _39[int(_822)] = as_type<uint>(_800);
    int _824 = _812 + 4;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    _39[int(_826)] = as_type<uint>(_806);
    int _828 = _812 + 8;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    _39[int(_830)] = as_type<uint>(_814);
    int _832 = _812 + 12;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    _39[int(_834)] = uint(_794);
    bool _836 = _68 != 0;
    bool _838 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _840 = _812 + 16;
    uint _842 = uint(int(uint(_840) >> uint(2)));
    _39[int(_842)] = as_type<uint>(_802);
    int _844 = _812 + 20;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    _39[int(_846)] = as_type<uint>(_808);
    int _848 = _812 + 24;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    _39[int(_850)] = as_type<uint>(_816);
    int _852 = _812 + 28;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    _39[int(_854)] = uint(_796);
    int _856 = _812 + 32;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    _39[int(_858)] = as_type<uint>(_804);
    int _860 = _812 + 36;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    _39[int(_862)] = as_type<uint>(_810);
    int _864 = _812 + 40;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    _39[int(_866)] = as_type<uint>(_818);
    int _868 = _812 + 44;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    _39[int(_870)] = uint(_798);
    float _872 = _770;
    float _874 = _786;
    float _876 = _778;
    float _878 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _880 = _810;
    float _882 = _804;
    float _884 = _816;
    float _886 = _818;
    float _888 = as_type<float>(_796);
    float _890 = as_type<float>(_798);
    if (!_836)
    {
        _450 = _800;
    }
    float _892 = _450;
    float _894 = _892;
    if (!_836)
    {
        _872 = _806;
    }
    float _896 = _872;
    float _898 = _896;
    if (!_836)
    {
        _452 = _814;
    }
    float _900 = _452;
    float _902 = _900;
    if (!_836)
    {
        _874 = as_type<float>(_794);
    }
    float _904 = _874;
    float _906 = _904;
    if (!_836)
    {
        _876 = _802;
    }
    float _908 = _876;
    float _910 = _908;
    if (!_836)
    {
        _878 = _808;
    }
    float _912 = _878;
    float _914 = _912;
    if (!_838)
    {
        int _916 = _68 * 48;
        int _918 = _916 + 16;
        uint _920 = uint(int(uint(_916) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_920)] = as_type<uint>(_800);
        int _922 = _916 + 4;
        uint _924 = uint(int(uint(_922) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_924)] = as_type<uint>(_806);
        int _926 = _916 + 8;
        uint _928 = uint(int(uint(_926) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_928)] = as_type<uint>(_814);
        int _930 = _916 + 12;
        uint _932 = uint(int(uint(_930) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_932)] = uint(_794);
        int _934 = _916 + 32;
        uint _936 = uint(int(uint(_918) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_936)] = as_type<uint>(_802);
        int _938 = _918 + 4;
        uint _940 = uint(int(uint(_938) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_940)] = as_type<uint>(_808);
        int _942 = _918 + 8;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_944)] = as_type<uint>(_816);
        int _946 = _918 + 12;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_948)] = uint(_796);
        uint _950 = uint(int(uint(_934) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_950)] = as_type<uint>(_804);
        int _952 = _934 + 4;
        uint _954 = uint(int(uint(_952) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_954)] = as_type<uint>(_810);
        int _956 = _934 + 8;
        uint _958 = uint(int(uint(_956) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_958)] = as_type<uint>(_818);
        int _960 = _934 + 12;
        uint _962 = uint(int(uint(_960) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_962)] = uint(_798);
    }
    bool _964 = !_836;
    if (!_964)
    {
        bool _966 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _968 = !_966;
        if (!_968)
        {
            uint _970 = uint(int(uint(_820) >> uint(2)));
            uint _972 = uint(int(uint(int(_970)) >> uint(2)));
            int _974 = int(_970) & 3;
            float _976 = (*spvDescriptorSet0.cp_c6)._m0[int(_972)][_974];
            int _978 = as_type<int>(_976) * 48;
            int _980 = 0;
            bool _982;
            float _1078;
            float _1082;
            float _1086;
            float _1090;
            float _1104;
            float _1106;
            float _1118;
            float _1128;
            float _1130;
            float _1132;
            float _1134;
            float _1136;
            do
            {
                int _984 = _980;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _986 = uint(int(uint(_978) >> uint(2)));
                float _988 = as_type<float>(_39[int(_986)]);
                int _990 = _978 + 4;
                uint _992 = uint(int(uint(_990) >> uint(2)));
                float _994 = as_type<float>(_39[int(_992)]);
                int _996 = _978 + 8;
                uint _998 = uint(int(uint(_996) >> uint(2)));
                float _1000 = as_type<float>(_39[int(_998)]);
                int _1002 = _978 + 12;
                uint _1004 = uint(int(uint(_1002) >> uint(2)));
                float _1006 = as_type<float>(_39[int(_1004)]);
                int _1008 = _984 + 1;
                int _1010 = _978 + 16;
                uint _1012 = uint(int(uint(_1010) >> uint(2)));
                float _1014 = as_type<float>(_39[int(_1012)]);
                int _1016 = _978 + 20;
                uint _1018 = uint(int(uint(_1016) >> uint(2)));
                float _1020 = as_type<float>(_39[int(_1018)]);
                int _1022 = _978 + 24;
                uint _1024 = uint(int(uint(_1022) >> uint(2)));
                float _1026 = as_type<float>(_39[int(_1024)]);
                int _1028 = _978 + 28;
                uint _1030 = uint(int(uint(_1028) >> uint(2)));
                float _1032 = as_type<float>(_39[int(_1030)]);
                bool _1034 = uint(_1008) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1036 = _978 + 32;
                uint _1038 = uint(int(uint(_1036) >> uint(2)));
                float _1040 = as_type<float>(_39[int(_1038)]);
                int _1042 = _978 + 36;
                uint _1044 = uint(int(uint(_1042) >> uint(2)));
                float _1046 = as_type<float>(_39[int(_1044)]);
                int _1048 = _978 + 40;
                uint _1050 = uint(int(uint(_1048) >> uint(2)));
                float _1052 = as_type<float>(_39[int(_1050)]);
                int _1054 = _978 + 44;
                uint _1056 = uint(int(uint(_1054) >> uint(2)));
                float _1058 = as_type<float>(_39[int(_1056)]);
                float _1060 = _994 * as_type<float>(_796);
                float _1062 = _802 * _994;
                float _1064 = _808 * _994;
                float _1066 = _816 * _994;
                float _1068 = fma(_988, as_type<float>(_794), _1060);
                float _1070 = fma(_800, _988, _1062);
                float _1072 = fma(_806, _988, _1064);
                float _1074 = fma(_814, _988, _1066);
                float _1076 = fma(_1000, as_type<float>(_798), _1068);
                _1078 = fma(_804, _1000, _1070);
                float _1080 = _802 * _1020;
                _1082 = fma(_818, _1000, _1074);
                float _1084 = _1020 * as_type<float>(_796);
                _1086 = _1006 + _1076;
                float _1088 = _808 * _1020;
                _1090 = fma(_810, _1000, _1072);
                float _1092 = fma(_1014, as_type<float>(_794), _1084);
                float _1094 = fma(_800, _1014, _1080);
                float _1096 = fma(_806, _1014, _1088);
                float _1098 = _816 * _1020;
                float _1100 = fma(_1026, as_type<float>(_798), _1092);
                float _1102 = _1046 * as_type<float>(_796);
                _1104 = fma(_804, _1026, _1094);
                _1106 = fma(_810, _1026, _1096);
                float _1108 = _802 * _1046;
                float _1110 = _808 * _1046;
                float _1112 = _816 * _1046;
                float _1114 = fma(_1040, as_type<float>(_794), _1102);
                float _1116 = fma(_814, _1014, _1098);
                _1118 = _1032 + _1100;
                float _1120 = fma(_800, _1040, _1108);
                float _1122 = fma(_806, _1040, _1110);
                float _1124 = fma(_814, _1040, _1112);
                float _1126 = fma(_1052, as_type<float>(_798), _1114);
                _1128 = fma(_818, _1026, _1116);
                _1130 = fma(_804, _1052, _1120);
                _1132 = fma(_810, _1052, _1122);
                _1134 = fma(_818, _1052, _1124);
                _1136 = _1058 + _1126;
                uint _1138 = uint(int(uint(_812) >> uint(2)));
                _39[int(_1138)] = as_type<uint>(_1078);
                int _1140 = _812 + 4;
                uint _1142 = uint(int(uint(_1140) >> uint(2)));
                _39[int(_1142)] = as_type<uint>(_1090);
                int _1144 = _812 + 8;
                uint _1146 = uint(int(uint(_1144) >> uint(2)));
                _39[int(_1146)] = as_type<uint>(_1082);
                int _1148 = _812 + 12;
                uint _1150 = uint(int(uint(_1148) >> uint(2)));
                _39[int(_1150)] = as_type<uint>(_1086);
                int _1152 = _812 + 16;
                uint _1154 = uint(int(uint(_1152) >> uint(2)));
                _39[int(_1154)] = as_type<uint>(_1104);
                int _1156 = _812 + 20;
                uint _1158 = uint(int(uint(_1156) >> uint(2)));
                _39[int(_1158)] = as_type<uint>(_1106);
                int _1160 = _812 + 24;
                uint _1162 = uint(int(uint(_1160) >> uint(2)));
                _39[int(_1162)] = as_type<uint>(_1128);
                int _1164 = _812 + 28;
                uint _1166 = uint(int(uint(_1164) >> uint(2)));
                _39[int(_1166)] = as_type<uint>(_1118);
                int _1168 = _812 + 32;
                uint _1170 = uint(int(uint(_1168) >> uint(2)));
                _39[int(_1170)] = as_type<uint>(_1130);
                int _1172 = _812 + 36;
                uint _1174 = uint(int(uint(_1172) >> uint(2)));
                _39[int(_1174)] = as_type<uint>(_1132);
                int _1176 = _812 + 40;
                uint _1178 = uint(int(uint(_1176) >> uint(2)));
                _39[int(_1178)] = as_type<uint>(_1134);
                int _1180 = _812 + 44;
                uint _1182 = uint(int(uint(_1180) >> uint(2)));
                _39[int(_1182)] = as_type<uint>(_1136);
                _982 = !_1034;
                _980 = _1008;
            } while (_982);
            _914 = _1106;
            _880 = _1132;
            _898 = _1090;
            _910 = _1104;
            _882 = _1130;
            _894 = _1078;
            _884 = _1128;
            _902 = _1082;
            _886 = _1134;
            _888 = _1118;
            _906 = _1086;
            _890 = _1136;
            _1184 = true;
        }
        else
        {
            _914 = 0.0;
            _880 = 0.0;
            _898 = 0.0;
            _910 = 0.0;
            _882 = 0.0;
            _894 = 0.0;
            _884 = 0.0;
            _902 = 0.0;
            _886 = 0.0;
            _888 = 0.0;
            _906 = 0.0;
            _890 = 0.0;
        }
    }
    _1184 = false;
    float _1186 = _914;
    float _1188 = _880;
    float _1190 = _898;
    float _1192 = _910;
    float _1194 = _882;
    float _1196 = _894;
    float _1198 = _884;
    float _1200 = _902;
    float _1202 = _886;
    float _1204 = _888;
    float _1206 = _906;
    float _1208 = _890;
    int _1210 = _820 + 80;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.cp_c6)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.cp_c6)._m0[int(_1222)][_1224];
    int _1228 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1230 = _1228 + _68;
    int _1232 = _820 + 64;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.cp_c6)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.cp_c6)._m0[int(_1244)][_1246];
    int _1250 = _1230 * 48;
    int _1252 = _820 + 88;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    uint _1256 = uint(int(uint(int(_1254)) >> uint(2)));
    int _1258 = int(_1254) & 3;
    float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
    int _1262 = int(_1254) + 1;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    int _1266 = _1262 & 3;
    float _1268 = (*spvDescriptorSet0.cp_c6)._m0[int(_1264)][_1266];
    int _1270 = _820 + 72;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    int _1288 = _820 + 96;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.cp_c6)._m0[int(_1300)][_1302];
    int _1306 = _820 + 104;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    uint _1310 = uint(int(uint(int(_1308)) >> uint(2)));
    int _1312 = int(_1308) & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    int _1316 = int(_1308) + 1;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    int _1320 = _1316 & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    float _1324 = _1186 * _1218;
    float _1326 = _1188 * _1218;
    int _1328 = _820 + 16;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.cp_c6)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.cp_c6)._m0[int(_1340)][_1342];
    float _1346 = _1190 * _1218;
    float _1348 = fma(_1192, _1240, _1324);
    float _1350 = _1190 * _1226;
    int _1352 = _820 + 32;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    uint _1356 = uint(int(uint(int(_1354)) >> uint(2)));
    int _1358 = int(_1354) & 3;
    float _1360 = (*spvDescriptorSet0.cp_c6)._m0[int(_1356)][_1358];
    int _1362 = int(_1354) + 1;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    int _1366 = _1362 & 3;
    float _1368 = (*spvDescriptorSet0.cp_c6)._m0[int(_1364)][_1366];
    float _1370 = fma(_1194, _1240, _1326);
    float _1372 = _1186 * _1226;
    float _1374 = fma(_1196, _1248, _1350);
    float _1376 = _1188 * _1226;
    float _1378 = fma(_1196, _1240, _1346);
    float _1380 = _1190 * _1260;
    float _1382 = _1190 * _1268;
    int _1384 = _820 + 48;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
    int _1390 = int(_1386) & 3;
    float _1392 = (*spvDescriptorSet0.cp_c6)._m0[int(_1388)][_1390];
    int _1394 = int(_1386) + 1;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    int _1398 = _1394 & 3;
    float _1400 = (*spvDescriptorSet0.cp_c6)._m0[int(_1396)][_1398];
    float _1402 = _1186 * _1260;
    float _1404 = _1186 * _1268;
    float _1406 = _1188 * _1260;
    float _1408 = _1188 * _1268;
    float _1410 = fma(_1192, _1248, _1372);
    float _1412 = fma(_1194, _1248, _1376);
    float _1414 = fma(_1196, _1278, _1380);
    int _1416 = _820 + 24;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.cp_c6)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.cp_c6)._m0[int(_1428)][_1430];
    float _1434 = fma(_1196, _1286, _1382);
    float _1436 = fma(_1192, _1278, _1402);
    float _1438 = fma(_1192, _1286, _1404);
    float _1440 = fma(_1194, _1278, _1406);
    float _1442 = fma(_1194, _1286, _1408);
    float _1444 = fma(_1198, _1296, _1348);
    float _1446 = fma(_1198, _1304, _1410);
    int _1448 = _820 + 40;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.cp_c6)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.cp_c6)._m0[int(_1460)][_1462];
    float _1466 = fma(_1200, _1304, _1374);
    float _1468 = fma(_1202, _1296, _1370);
    float _1470 = fma(_1202, _1304, _1412);
    float _1472 = fma(_1200, _1296, _1378);
    float _1474 = fma(_1198, _1314, _1436);
    float _1476 = fma(_1198, _1322, _1438);
    int _1478 = _820 + 56;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.cp_c6)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.cp_c6)._m0[int(_1490)][_1492];
    float _1496 = fma(_1200, _1322, _1434);
    float _1498 = fma(_1202, _1322, _1442);
    float _1500 = _1476 + _1204;
    float _1502 = fma(_1202, _1314, _1440);
    float _1504 = _1496 + _1206;
    float _1506 = fma(_1200, _1314, _1414);
    float _1508 = _1498 + _1208;
    float _1510 = _1500 * _1344;
    float _1512 = _1446 * _1344;
    float _1514 = _1474 * _1344;
    float _1516 = _1444 * _1344;
    float _1518 = fma(_1504, _1336, _1510);
    float _1520 = fma(_1466, _1336, _1512);
    float _1522 = fma(_1506, _1336, _1514);
    float _1524 = fma(_1472, _1336, _1516);
    float _1526 = _1500 * _1368;
    float _1528 = _1444 * _1368;
    float _1530 = _1446 * _1368;
    float _1532 = _1474 * _1368;
    float _1534 = fma(_1504, _1360, _1526);
    float _1536 = fma(_1472, _1360, _1528);
    float _1538 = fma(_1466, _1360, _1530);
    float _1540 = fma(_1506, _1360, _1532);
    float _1542 = _1500 * _1400;
    float _1544 = _1446 * _1400;
    float _1546 = _1444 * _1400;
    float _1548 = _1474 * _1400;
    float _1550 = fma(_1504, _1392, _1542);
    float _1552 = fma(_1466, _1392, _1544);
    float _1554 = fma(_1472, _1392, _1546);
    float _1556 = fma(_1506, _1392, _1548);
    float _1558 = fma(_1508, _1424, _1518);
    float _1560 = fma(_1470, _1424, _1520);
    float _1562 = fma(_1502, _1424, _1522);
    float _1564 = fma(_1468, _1424, _1524);
    float _1566 = _1558 + _1432;
    int _1568 = _1250 + 16;
    int _1570 = _1250 + 32;
    float _1572 = fma(_1508, _1456, _1534);
    float _1574 = fma(_1468, _1456, _1536);
    float _1576 = fma(_1470, _1456, _1538);
    float _1578 = fma(_1502, _1456, _1540);
    float _1580 = _1572 + _1464;
    int _1582 = _1250 + 48;
    uint _1584 = uint(int(uint(_1568) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1584)] = as_type<uint>(_1564);
    int _1586 = _1568 + 4;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1588)] = as_type<uint>(_1560);
    int _1590 = _1568 + 8;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1592)] = as_type<uint>(_1562);
    int _1594 = _1568 + 12;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1596)] = as_type<uint>(_1566);
    float _1598 = fma(_1508, _1486, _1550);
    float _1600 = fma(_1468, _1486, _1554);
    float _1602 = fma(_1470, _1486, _1552);
    float _1604 = fma(_1502, _1486, _1556);
    float _1606 = _1598 + _1494;
    uint _1608 = uint(int(uint(_1570) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1608)] = as_type<uint>(_1574);
    int _1610 = _1570 + 4;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1612)] = as_type<uint>(_1576);
    int _1614 = _1570 + 8;
    uint _1616 = uint(int(uint(_1614) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1616)] = as_type<uint>(_1578);
    int _1618 = _1570 + 12;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1620)] = as_type<uint>(_1580);
    uint _1622 = uint(int(uint(_1582) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1622)] = as_type<uint>(_1600);
    int _1624 = _1582 + 4;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1626)] = as_type<uint>(_1602);
    int _1628 = _1582 + 8;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1630)] = as_type<uint>(_1604);
    int _1632 = _1582 + 12;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1634)] = as_type<uint>(_1606);
}

