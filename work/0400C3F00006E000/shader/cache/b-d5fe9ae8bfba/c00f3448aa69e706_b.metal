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
int _58(thread const int& _3866, thread const int& _3867, constant _10& support_buffer)
{
    int _3870 = 1 + _3867;
    float _3872 = support_buffer._m5[_3870].x;
    bool _3874 = _3872 == 1.0;
    if (_3874)
    {
        return _3866;
    }
    float _3876 = float(_3866);
    float _3878 = _3876 * _3872;
    int _3880 = int(_3878);
    return _3880;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1066 = false;
    bool _600 = false;
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
    if (_125)
    {
        int _181 = _68;
        int _183 = 0;
        int _185 = _58(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _149;
        int _189 = 0;
        int _191 = _58(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _1719 = int3(_185, _191, as_type<int>(_153));
        float3 _195 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1719.xy), uint(_1719.z), 0).xyz;
        float _197 = _195.x;
        float _199 = _195.y;
        float _201 = _195.z;
        _175 = _197;
        _177 = _199;
        _179 = _201;
    }
    float _203 = _175;
    float _205 = _177;
    float _207 = _179;
    float _209 = 0.0;
    float _211 = as_type<float>(_68);
    float _213 = 0.0;
    if (_125)
    {
        int _215 = _68;
        int _217 = 0;
        int _219 = _58(_215, _217, (*spvDescriptorSet0.support_buffer));
        int _221 = _149;
        int _223 = 0;
        int _225 = _58(_221, _223, (*spvDescriptorSet0.support_buffer));
        int3 _1747 = int3(_219, _225, 0);
        float3 _227 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1747.xy), uint(_1747.z), 0).xyz;
        float _229 = _227.x;
        float _231 = _227.y;
        float _233 = _227.z;
        _209 = _229;
        _211 = _231;
        _213 = _233;
    }
    float _235 = _209;
    float _237 = _211;
    float _239 = _213;
    float _241 = _157;
    float _243 = as_type<float>(_68);
    float _245 = 0.0;
    if (_125)
    {
        int _247 = _68;
        int _249 = 0;
        int _251 = _58(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = _149;
        int _255 = 0;
        int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _1778 = int3(_251, _257, as_type<int>(_157));
        float3 _259 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1778.xy), uint(_1778.z), 0).xyz;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        _241 = _261;
        _243 = _263;
        _245 = _265;
    }
    float _267 = _241;
    float _269 = _243;
    float _271 = _245;
    float _273 = 0.0;
    float _275 = as_type<float>(_68);
    float _277 = 0.0;
    if (_129)
    {
        int _279 = _68;
        int _281 = 1;
        int _283 = _58(_279, _281, (*spvDescriptorSet0.support_buffer));
        int _285 = _169;
        int _287 = 1;
        int _289 = _58(_285, _287, (*spvDescriptorSet0.support_buffer));
        int3 _1806 = int3(_283, _289, 0);
        float3 _291 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1806.xy), uint(_1806.z), 0).xyz;
        float _293 = _291.x;
        float _295 = _291.y;
        float _297 = _291.z;
        _273 = _293;
        _275 = _295;
        _277 = _297;
    }
    float _299 = _273;
    float _301 = _275;
    float _303 = _277;
    float _305 = 0.0;
    float _307 = 0.0;
    float _309 = 0.0;
    float _311 = 0.0;
    if (_129)
    {
        int _313 = _68;
        int _315 = 1;
        int _317 = _58(_313, _315, (*spvDescriptorSet0.support_buffer));
        int _319 = _169;
        int _321 = 1;
        int _323 = _58(_319, _321, (*spvDescriptorSet0.support_buffer));
        int3 _1834 = int3(_317, _323, as_type<int>(_173));
        float4 _326 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1834.xy), uint(_1834.z), 0).xyzw;
        float _328 = _326.x;
        float _330 = _326.y;
        float _332 = _326.z;
        float _334 = _326.w;
        _305 = _328;
        _307 = _330;
        _309 = _332;
        _311 = _334;
    }
    float _336 = _305;
    float _338 = _307;
    float _340 = _309;
    float _342 = _311;
    float _344 = 0.0;
    if (!_129)
    {
        _344 = 0.0;
    }
    float _346 = _344;
    float _348 = 0.0;
    float _350 = 0.0;
    float _352 = _346;
    if (!_129)
    {
        _348 = 0.0;
        _350 = 0.0;
    }
    float _354 = _348;
    float _356 = _350;
    float _358 = 0.0;
    float _360 = _356;
    float _362 = _354;
    if (!_129)
    {
        _358 = 0.0;
    }
    float _364 = _358;
    float _366 = 0.0;
    float _368 = _364;
    if (!_129)
    {
        _366 = 0.0;
    }
    float _370 = _366;
    float _372 = 0.0;
    float _374 = _370;
    if (!_129)
    {
        _372 = 0.0;
    }
    float _376 = _372;
    float _378 = _376;
    if (!_129)
    {
        _133 = 0.0;
    }
    float _380 = _133;
    float _382 = _380;
    if (!_129)
    {
        _135 = 0.0;
    }
    float _384 = _135;
    float _386 = 0.0;
    float _388 = _384;
    if (!_129)
    {
        _386 = 0.0;
    }
    float _390 = _386;
    float _392 = _390;
    if (!_129)
    {
        _137 = 0.0;
    }
    float _394 = _137;
    bool _396 = !_129;
    float _398 = _394;
    if (!_396)
    {
        int _400 = _68;
        int _402 = 1;
        int _404 = _58(_400, _402, (*spvDescriptorSet0.support_buffer));
        int _406 = _169;
        int _408 = 1;
        int _410 = _58(_406, _408, (*spvDescriptorSet0.support_buffer));
        int3 _1923 = int3(_404, _410, 2);
        float3 _412 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1923.xy), uint(_1923.z), 0).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _342 * 2.0;
        _392 = _340;
        _382 = _336;
        _388 = _338;
        _368 = _301;
        _374 = _303;
        _360 = _416;
        _352 = _299;
        _378 = _418;
        _362 = _414;
        _398 = _420;
    }
    float _422 = _392;
    float _424 = _382;
    float _426 = _388;
    float _428 = _368;
    float _430 = _374;
    float _432 = _360;
    float _434 = _352;
    float _436 = _378;
    float _438 = _362;
    float _440 = _398;
    bool _442 = !_125;
    float _444 = _434;
    float _446 = _430;
    int _448 = as_type<int>(_436);
    float _450 = _438;
    float _572;
    float _574;
    float _576;
    float _578;
    float _580;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    int _592;
    int _594;
    float _596;
    float _598;
    if (!_442)
    {
        int _452 = _101 + 28;
        uint _454 = uint(int(uint(_452) >> uint(2)));
        uint _456 = uint(int(uint(int(_454)) >> uint(2)));
        int _458 = int(_454) & 3;
        float _460 = (*spvDescriptorSet0.cp_c5)._m0[int(_456)][_458];
        int _462 = _101 + 20;
        uint _464 = uint(int(uint(_462) >> uint(2)));
        uint _466 = uint(int(uint(int(_464)) >> uint(2)));
        int _468 = int(_464) & 3;
        float _470 = (*spvDescriptorSet0.cp_c5)._m0[int(_466)][_468];
        float _472 = _207 * _460;
        float _474 = _203 * _460;
        float _476 = _205 * _460;
        float _478 = _237 * _460;
        float _480 = _239 * _460;
        float _482 = _271 * _460;
        float _484 = _235 * _460;
        float _486 = fma(_422, _470, _472);
        float _488 = fma(_424, _470, _474);
        float _490 = fma(_426, _470, _476);
        float _492 = fma(_428, _470, _478);
        float _494 = _486 * 0.15915493667125701904296875;
        float _496 = _488 * 0.15915493667125701904296875;
        float _498 = _490 * 0.15915493667125701904296875;
        float _500 = _269 * _460;
        float _502 = _494 * 6.283185482025146484375;
        float _504 = sin(_502);
        float _506 = fma(_430, _470, _480);
        float _508 = _267 * _460;
        float _510 = fma(_432, _470, _500);
        float _512 = fma(_434, _470, _484);
        float _514 = fma(_436, _470, _482);
        float _516 = fma(_438, _470, _508);
        float _518 = _496 * 6.283185482025146484375;
        float _520 = sin(_518);
        float _522 = _496 * 6.283185482025146484375;
        float _524 = cos(_522);
        float _526 = _494 * 6.283185482025146484375;
        float _528 = cos(_526);
        float _530 = _520 * _504;
        float _532 = _498 * 6.283185482025146484375;
        float _534 = sin(_532);
        float _536 = _504 * _524;
        float _538 = _498 * 6.283185482025146484375;
        float _540 = cos(_538);
        float _542 = _524 * _528;
        float _544 = _520 * _528;
        float _546 = _520 * _534;
        float _548 = _524 * _540;
        float _550 = _540 * _528;
        float _552 = _504 * _540;
        float _554 = _520 * _540;
        float _556 = -_536;
        float _558 = fma(_528, _546, _556);
        float _560 = fma(_504, _546, _542);
        float _562 = fma(_534, _542, _530);
        float _564 = -_544;
        float _566 = fma(_534, _536, _564);
        float _568 = -_534;
        float _570 = _568 + (-0.0);
        _444 = _512;
        _572 = _550;
        _574 = _552;
        _576 = _570;
        _578 = _492;
        _580 = _558;
        _582 = _560;
        _584 = _554;
        _446 = _506;
        _586 = _562;
        _588 = _566;
        _590 = _548;
        _592 = as_type<int>(_516);
        _594 = as_type<int>(_510);
        _448 = as_type<int>(_514);
        _596 = _536;
        _598 = _530;
        _600 = true;
    }
    else
    {
        float _602 = _424 * 2.0;
        float _604 = _422 * _440;
        float _606 = _426 * _440;
        float _608 = _426 * _426;
        float _610 = -_604;
        float _612 = fma(_602, _426, _610);
        float _614 = fma(_602, _426, _604);
        float _616 = _424 * _440;
        float _618 = _424 * _424;
        float _620 = _426 * 2.0;
        float _622 = _422 * _422;
        float _624 = fma(_608, -2.0, 1.0);
        float _626 = fma(_602, _422, _606);
        float _628 = fma(_618, -2.0, 1.0);
        float _630 = -_606;
        float _632 = fma(_602, _422, _630);
        float _634 = -_616;
        float _636 = fma(_620, _422, _634);
        float _638 = fma(_620, _422, _616);
        float _640 = fma(_622, -2.0, _624);
        float _642 = fma(_622, -2.0, _628);
        float _644 = fma(_608, -2.0, _628);
        _572 = _640;
        _574 = _614;
        _576 = _632;
        _578 = _428;
        _580 = _612;
        _582 = _642;
        _584 = _638;
        _586 = _626;
        _588 = _636;
        _590 = _644;
        _592 = as_type<int>(_438);
        _594 = as_type<int>(_432);
        _596 = _624;
        _598 = 0.0;
    }
    _600 = false;
    float _646 = _444;
    float _648 = _572;
    float _650 = _574;
    float _652 = _576;
    float _654 = _578;
    float _656 = _580;
    float _658 = _582;
    float _660 = _584;
    float _662 = _446;
    float _664 = _586;
    float _666 = _588;
    float _668 = _590;
    int _670 = _592;
    int _672 = _594;
    int _674 = _448;
    float _676 = _596;
    float _678 = _598;
    float _680 = _646 * _648;
    float _682 = _646 * _650;
    float _684 = _646 * _652;
    float _686 = _654 * _656;
    float _688 = _654 * _658;
    float _690 = _654 * _660;
    int _692 = _68 * 48;
    float _694 = _662 * _664;
    float _696 = _662 * _666;
    float _698 = _662 * _668;
    int _700 = _68 * 112;
    uint _702 = uint(int(uint(_692) >> uint(2)));
    _39[int(_702)] = as_type<uint>(_680);
    int _704 = _692 + 4;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    _39[int(_706)] = as_type<uint>(_686);
    int _708 = _692 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    _39[int(_710)] = as_type<uint>(_694);
    int _712 = _692 + 12;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    _39[int(_714)] = uint(_670);
    bool _716 = _68 != 0;
    bool _718 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _720 = _692 + 16;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    _39[int(_722)] = as_type<uint>(_682);
    int _724 = _692 + 20;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    _39[int(_726)] = as_type<uint>(_688);
    int _728 = _692 + 24;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    _39[int(_730)] = as_type<uint>(_696);
    int _732 = _692 + 28;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    _39[int(_734)] = uint(_672);
    int _736 = _692 + 32;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    _39[int(_738)] = as_type<uint>(_684);
    int _740 = _692 + 36;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    _39[int(_742)] = as_type<uint>(_690);
    int _744 = _692 + 40;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    _39[int(_746)] = as_type<uint>(_698);
    int _748 = _692 + 44;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    _39[int(_750)] = uint(_674);
    float _752 = _646;
    float _754 = _678;
    float _756 = _662;
    float _758 = _676;
    float _760 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _762 = _690;
    float _764 = _684;
    float _766 = _696;
    float _768 = as_type<float>(_672);
    float _770 = _698;
    float _772 = as_type<float>(_674);
    if (!_716)
    {
        _450 = _680;
    }
    float _774 = _450;
    float _776 = _774;
    if (!_716)
    {
        _752 = _686;
    }
    float _778 = _752;
    float _780 = _778;
    if (!_716)
    {
        _754 = _694;
    }
    float _782 = _754;
    float _784 = _782;
    if (!_716)
    {
        _756 = as_type<float>(_670);
    }
    float _786 = _756;
    float _788 = _786;
    if (!_716)
    {
        _758 = _682;
    }
    float _790 = _758;
    float _792 = _790;
    if (!_716)
    {
        _760 = _688;
    }
    float _794 = _760;
    float _796 = _794;
    if (!_718)
    {
        int _798 = _68 * 48;
        int _800 = _798 + 16;
        uint _802 = uint(int(uint(_798) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_802)] = as_type<uint>(_680);
        int _804 = _798 + 4;
        uint _806 = uint(int(uint(_804) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_806)] = as_type<uint>(_686);
        int _808 = _798 + 8;
        uint _810 = uint(int(uint(_808) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_810)] = as_type<uint>(_694);
        int _812 = _798 + 12;
        uint _814 = uint(int(uint(_812) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_814)] = uint(_670);
        int _816 = _798 + 32;
        uint _818 = uint(int(uint(_800) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_818)] = as_type<uint>(_682);
        int _820 = _800 + 4;
        uint _822 = uint(int(uint(_820) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_822)] = as_type<uint>(_688);
        int _824 = _800 + 8;
        uint _826 = uint(int(uint(_824) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_826)] = as_type<uint>(_696);
        int _828 = _800 + 12;
        uint _830 = uint(int(uint(_828) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_830)] = uint(_672);
        uint _832 = uint(int(uint(_816) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_832)] = as_type<uint>(_684);
        int _834 = _816 + 4;
        uint _836 = uint(int(uint(_834) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_836)] = as_type<uint>(_690);
        int _838 = _816 + 8;
        uint _840 = uint(int(uint(_838) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_840)] = as_type<uint>(_698);
        int _842 = _816 + 12;
        uint _844 = uint(int(uint(_842) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_844)] = uint(_674);
    }
    bool _846 = !_716;
    if (!_846)
    {
        bool _848 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _850 = !_848;
        if (!_850)
        {
            uint _852 = uint(int(uint(_700) >> uint(2)));
            uint _854 = uint(int(uint(int(_852)) >> uint(2)));
            int _856 = int(_852) & 3;
            float _858 = (*spvDescriptorSet0.cp_c6)._m0[int(_854)][_856];
            int _860 = as_type<int>(_858) * 48;
            int _862 = 0;
            bool _864;
            float _960;
            float _964;
            float _968;
            float _972;
            float _986;
            float _988;
            float _1000;
            float _1010;
            float _1012;
            float _1014;
            float _1016;
            float _1018;
            do
            {
                int _866 = _862;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _868 = uint(int(uint(_860) >> uint(2)));
                float _870 = as_type<float>(_39[int(_868)]);
                int _872 = _860 + 4;
                uint _874 = uint(int(uint(_872) >> uint(2)));
                float _876 = as_type<float>(_39[int(_874)]);
                int _878 = _860 + 8;
                uint _880 = uint(int(uint(_878) >> uint(2)));
                float _882 = as_type<float>(_39[int(_880)]);
                int _884 = _860 + 12;
                uint _886 = uint(int(uint(_884) >> uint(2)));
                float _888 = as_type<float>(_39[int(_886)]);
                int _890 = _866 + 1;
                int _892 = _860 + 16;
                uint _894 = uint(int(uint(_892) >> uint(2)));
                float _896 = as_type<float>(_39[int(_894)]);
                int _898 = _860 + 20;
                uint _900 = uint(int(uint(_898) >> uint(2)));
                float _902 = as_type<float>(_39[int(_900)]);
                int _904 = _860 + 24;
                uint _906 = uint(int(uint(_904) >> uint(2)));
                float _908 = as_type<float>(_39[int(_906)]);
                int _910 = _860 + 28;
                uint _912 = uint(int(uint(_910) >> uint(2)));
                float _914 = as_type<float>(_39[int(_912)]);
                bool _916 = uint(_890) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _918 = _860 + 32;
                uint _920 = uint(int(uint(_918) >> uint(2)));
                float _922 = as_type<float>(_39[int(_920)]);
                int _924 = _860 + 36;
                uint _926 = uint(int(uint(_924) >> uint(2)));
                float _928 = as_type<float>(_39[int(_926)]);
                int _930 = _860 + 40;
                uint _932 = uint(int(uint(_930) >> uint(2)));
                float _934 = as_type<float>(_39[int(_932)]);
                int _936 = _860 + 44;
                uint _938 = uint(int(uint(_936) >> uint(2)));
                float _940 = as_type<float>(_39[int(_938)]);
                float _942 = _876 * as_type<float>(_672);
                float _944 = _682 * _876;
                float _946 = _688 * _876;
                float _948 = _696 * _876;
                float _950 = fma(_870, as_type<float>(_670), _942);
                float _952 = fma(_680, _870, _944);
                float _954 = fma(_686, _870, _946);
                float _956 = fma(_694, _870, _948);
                float _958 = fma(_882, as_type<float>(_674), _950);
                _960 = fma(_684, _882, _952);
                float _962 = _682 * _902;
                _964 = fma(_698, _882, _956);
                float _966 = _902 * as_type<float>(_672);
                _968 = _888 + _958;
                float _970 = _688 * _902;
                _972 = fma(_690, _882, _954);
                float _974 = fma(_896, as_type<float>(_670), _966);
                float _976 = fma(_680, _896, _962);
                float _978 = fma(_686, _896, _970);
                float _980 = _696 * _902;
                float _982 = fma(_908, as_type<float>(_674), _974);
                float _984 = _928 * as_type<float>(_672);
                _986 = fma(_684, _908, _976);
                _988 = fma(_690, _908, _978);
                float _990 = _682 * _928;
                float _992 = _688 * _928;
                float _994 = _696 * _928;
                float _996 = fma(_922, as_type<float>(_670), _984);
                float _998 = fma(_694, _896, _980);
                _1000 = _914 + _982;
                float _1002 = fma(_680, _922, _990);
                float _1004 = fma(_686, _922, _992);
                float _1006 = fma(_694, _922, _994);
                float _1008 = fma(_934, as_type<float>(_674), _996);
                _1010 = fma(_698, _908, _998);
                _1012 = fma(_684, _934, _1002);
                _1014 = fma(_690, _934, _1004);
                _1016 = fma(_698, _934, _1006);
                _1018 = _940 + _1008;
                uint _1020 = uint(int(uint(_692) >> uint(2)));
                _39[int(_1020)] = as_type<uint>(_960);
                int _1022 = _692 + 4;
                uint _1024 = uint(int(uint(_1022) >> uint(2)));
                _39[int(_1024)] = as_type<uint>(_972);
                int _1026 = _692 + 8;
                uint _1028 = uint(int(uint(_1026) >> uint(2)));
                _39[int(_1028)] = as_type<uint>(_964);
                int _1030 = _692 + 12;
                uint _1032 = uint(int(uint(_1030) >> uint(2)));
                _39[int(_1032)] = as_type<uint>(_968);
                int _1034 = _692 + 16;
                uint _1036 = uint(int(uint(_1034) >> uint(2)));
                _39[int(_1036)] = as_type<uint>(_986);
                int _1038 = _692 + 20;
                uint _1040 = uint(int(uint(_1038) >> uint(2)));
                _39[int(_1040)] = as_type<uint>(_988);
                int _1042 = _692 + 24;
                uint _1044 = uint(int(uint(_1042) >> uint(2)));
                _39[int(_1044)] = as_type<uint>(_1010);
                int _1046 = _692 + 28;
                uint _1048 = uint(int(uint(_1046) >> uint(2)));
                _39[int(_1048)] = as_type<uint>(_1000);
                int _1050 = _692 + 32;
                uint _1052 = uint(int(uint(_1050) >> uint(2)));
                _39[int(_1052)] = as_type<uint>(_1012);
                int _1054 = _692 + 36;
                uint _1056 = uint(int(uint(_1054) >> uint(2)));
                _39[int(_1056)] = as_type<uint>(_1014);
                int _1058 = _692 + 40;
                uint _1060 = uint(int(uint(_1058) >> uint(2)));
                _39[int(_1060)] = as_type<uint>(_1016);
                int _1062 = _692 + 44;
                uint _1064 = uint(int(uint(_1062) >> uint(2)));
                _39[int(_1064)] = as_type<uint>(_1018);
                _864 = !_916;
                _862 = _890;
            } while (_864);
            _796 = _988;
            _762 = _1014;
            _780 = _972;
            _792 = _986;
            _764 = _1012;
            _776 = _960;
            _766 = _1010;
            _784 = _964;
            _768 = _1000;
            _788 = _968;
            _770 = _1016;
            _772 = _1018;
            _1066 = true;
        }
        else
        {
            _796 = 0.0;
            _762 = 0.0;
            _780 = 0.0;
            _792 = 0.0;
            _764 = 0.0;
            _776 = 0.0;
            _766 = 0.0;
            _784 = 0.0;
            _768 = 0.0;
            _788 = 0.0;
            _770 = 0.0;
            _772 = 0.0;
        }
    }
    _1066 = false;
    float _1068 = _796;
    float _1070 = _762;
    float _1072 = _780;
    float _1074 = _792;
    float _1076 = _764;
    float _1078 = _776;
    float _1080 = _766;
    float _1082 = _784;
    float _1084 = _768;
    float _1086 = _788;
    float _1088 = _770;
    float _1090 = _772;
    int _1092 = _700 + 80;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
    int _1098 = int(_1094) & 3;
    float _1100 = (*spvDescriptorSet0.cp_c6)._m0[int(_1096)][_1098];
    int _1102 = int(_1094) + 1;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    int _1106 = _1102 & 3;
    float _1108 = (*spvDescriptorSet0.cp_c6)._m0[int(_1104)][_1106];
    int _1110 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1112 = _1110 + _68;
    int _1114 = _700 + 64;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.cp_c6)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.cp_c6)._m0[int(_1126)][_1128];
    int _1132 = _1112 * 48;
    int _1134 = _700 + 88;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.cp_c6)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.cp_c6)._m0[int(_1146)][_1148];
    int _1152 = _700 + 72;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
    int _1158 = int(_1154) & 3;
    float _1160 = (*spvDescriptorSet0.cp_c6)._m0[int(_1156)][_1158];
    int _1162 = int(_1154) + 1;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    int _1166 = _1162 & 3;
    float _1168 = (*spvDescriptorSet0.cp_c6)._m0[int(_1164)][_1166];
    int _1170 = _700 + 104;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.cp_c6)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.cp_c6)._m0[int(_1182)][_1184];
    int _1188 = _700 + 96;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
    int _1194 = int(_1190) & 3;
    float _1196 = (*spvDescriptorSet0.cp_c6)._m0[int(_1192)][_1194];
    int _1198 = int(_1190) + 1;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    int _1202 = _1198 & 3;
    float _1204 = (*spvDescriptorSet0.cp_c6)._m0[int(_1200)][_1202];
    float _1206 = _1068 * _1100;
    float _1208 = _1070 * _1100;
    int _1210 = _700 + 16;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.cp_c6)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.cp_c6)._m0[int(_1222)][_1224];
    float _1228 = _1072 * _1100;
    float _1230 = _1070 * _1108;
    float _1232 = fma(_1074, _1122, _1206);
    float _1234 = _1072 * _1108;
    int _1236 = _700 + 32;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.cp_c6)._m0[int(_1248)][_1250];
    float _1254 = fma(_1076, _1122, _1208);
    float _1256 = _1068 * _1108;
    float _1258 = fma(_1078, _1130, _1234);
    float _1260 = fma(_1078, _1122, _1228);
    float _1262 = fma(_1076, _1130, _1230);
    float _1264 = _1072 * _1142;
    float _1266 = _1072 * _1150;
    int _1268 = _700 + 48;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    uint _1272 = uint(int(uint(int(_1270)) >> uint(2)));
    int _1274 = int(_1270) & 3;
    float _1276 = (*spvDescriptorSet0.cp_c6)._m0[int(_1272)][_1274];
    int _1278 = int(_1270) + 1;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    int _1282 = _1278 & 3;
    float _1284 = (*spvDescriptorSet0.cp_c6)._m0[int(_1280)][_1282];
    float _1286 = _1068 * _1142;
    float _1288 = _1070 * _1142;
    float _1290 = _1068 * _1150;
    float _1292 = _1070 * _1150;
    float _1294 = fma(_1074, _1130, _1256);
    float _1296 = fma(_1078, _1160, _1264);
    float _1298 = fma(_1078, _1168, _1266);
    int _1300 = _700 + 24;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
    int _1306 = int(_1302) & 3;
    float _1308 = (*spvDescriptorSet0.cp_c6)._m0[int(_1304)][_1306];
    int _1310 = int(_1302) + 1;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    int _1314 = _1310 & 3;
    float _1316 = (*spvDescriptorSet0.cp_c6)._m0[int(_1312)][_1314];
    float _1318 = fma(_1074, _1160, _1286);
    float _1320 = fma(_1074, _1168, _1290);
    float _1322 = fma(_1076, _1160, _1288);
    float _1324 = fma(_1076, _1168, _1292);
    float _1326 = fma(_1080, _1186, _1320);
    float _1328 = fma(_1082, _1186, _1298);
    int _1330 = _700 + 40;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
    float _1348 = fma(_1080, _1178, _1318);
    float _1350 = _1326 + _1084;
    float _1352 = _1328 + _1086;
    float _1354 = fma(_1088, _1178, _1322);
    float _1356 = fma(_1082, _1178, _1296);
    float _1358 = fma(_1082, _1204, _1258);
    float _1360 = fma(_1080, _1196, _1232);
    int _1362 = _700 + 56;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    uint _1366 = uint(int(uint(int(_1364)) >> uint(2)));
    int _1368 = int(_1364) & 3;
    float _1370 = (*spvDescriptorSet0.cp_c6)._m0[int(_1366)][_1368];
    int _1372 = int(_1364) + 1;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    int _1376 = _1372 & 3;
    float _1378 = (*spvDescriptorSet0.cp_c6)._m0[int(_1374)][_1376];
    float _1380 = fma(_1080, _1204, _1294);
    float _1382 = fma(_1088, _1186, _1324);
    float _1384 = fma(_1082, _1196, _1260);
    float _1386 = fma(_1088, _1196, _1254);
    float _1388 = fma(_1088, _1204, _1262);
    float _1390 = _1382 + _1090;
    int _1392 = _1132 + 32;
    float _1394 = _1350 * _1226;
    float _1396 = _1380 * _1226;
    float _1398 = _1360 * _1226;
    float _1400 = _1348 * _1226;
    float _1402 = fma(_1352, _1218, _1394);
    float _1404 = fma(_1358, _1218, _1396);
    float _1406 = fma(_1384, _1218, _1398);
    float _1408 = fma(_1356, _1218, _1400);
    float _1410 = _1350 * _1252;
    float _1412 = _1380 * _1252;
    float _1414 = _1360 * _1252;
    float _1416 = _1348 * _1252;
    float _1418 = fma(_1352, _1244, _1410);
    float _1420 = fma(_1358, _1244, _1412);
    float _1422 = fma(_1384, _1244, _1414);
    float _1424 = fma(_1356, _1244, _1416);
    float _1426 = _1350 * _1284;
    float _1428 = _1380 * _1284;
    float _1430 = _1360 * _1284;
    float _1432 = _1348 * _1284;
    float _1434 = fma(_1352, _1276, _1426);
    float _1436 = fma(_1358, _1276, _1428);
    float _1438 = fma(_1384, _1276, _1430);
    float _1440 = fma(_1356, _1276, _1432);
    float _1442 = fma(_1390, _1308, _1402);
    float _1444 = fma(_1386, _1308, _1406);
    float _1446 = fma(_1388, _1308, _1404);
    float _1448 = fma(_1354, _1308, _1408);
    float _1450 = _1442 + _1316;
    float _1452 = fma(_1390, _1338, _1418);
    float _1454 = fma(_1388, _1338, _1420);
    float _1456 = fma(_1386, _1338, _1422);
    float _1458 = fma(_1354, _1338, _1424);
    float _1460 = _1452 + _1346;
    float _1462 = fma(_1390, _1370, _1434);
    float _1464 = fma(_1388, _1370, _1436);
    int _1466 = _1132 + 16;
    float _1468 = fma(_1386, _1370, _1438);
    float _1470 = fma(_1354, _1370, _1440);
    float _1472 = _1462 + _1378;
    int _1474 = _1132 + 48;
    uint _1476 = uint(int(uint(_1466) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1476)] = as_type<uint>(_1444);
    int _1478 = _1466 + 4;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1480)] = as_type<uint>(_1446);
    int _1482 = _1466 + 8;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1484)] = as_type<uint>(_1448);
    int _1486 = _1466 + 12;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1488)] = as_type<uint>(_1450);
    uint _1490 = uint(int(uint(_1392) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1490)] = as_type<uint>(_1456);
    int _1492 = _1392 + 4;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1494)] = as_type<uint>(_1454);
    int _1496 = _1392 + 8;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1498)] = as_type<uint>(_1458);
    int _1500 = _1392 + 12;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1502)] = as_type<uint>(_1460);
    uint _1504 = uint(int(uint(_1474) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1504)] = as_type<uint>(_1468);
    int _1506 = _1474 + 4;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1508)] = as_type<uint>(_1464);
    int _1510 = _1474 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1512)] = as_type<uint>(_1470);
    int _1514 = _1474 + 12;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1516)] = as_type<uint>(_1472);
}

