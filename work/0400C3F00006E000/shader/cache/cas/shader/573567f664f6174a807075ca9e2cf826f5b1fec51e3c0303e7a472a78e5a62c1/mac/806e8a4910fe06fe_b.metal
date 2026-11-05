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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4027, thread const int& _4028, constant _10& support_buffer)
{
    int _4031 = 1 + _4028;
    float _4033 = support_buffer._m5[_4031].x;
    bool _4035 = _4033 == 1.0;
    if (_4035)
    {
        return _4027;
    }
    float _4037 = float(_4027);
    float _4039 = _4037 * _4033;
    int _4041 = int(_4039);
    return _4041;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1156 = false;
    bool _728 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    float _97 = _76 ? as_type<float>(_89) : as_type<float>(_95);
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 36;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = _99 + 32;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.cp_c5)._m0[int(_115)][_117];
    int _121 = as_type<int>(_97) & as_type<int>(_109);
    bool _123 = _121 != 0;
    int _125 = as_type<int>(_97) & as_type<int>(_119);
    bool _127 = _125 != 0;
    int _129 = 0;
    float _131 = _97;
    float _133 = _119;
    if (_123)
    {
        int _135 = _99 + 8;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        uint _139 = uint(int(uint(int(_137)) >> uint(2)));
        int _141 = int(_137) & 3;
        float _143 = (*spvDescriptorSet0.cp_c5)._m0[int(_139)][_141];
        _129 = as_type<int>(_143);
    }
    int _145 = _129;
    float _147 = 0.0;
    if (_123)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    float _151 = 0.0;
    if (_123)
    {
        _151 = 2.8025969286496341418474591665798e-45;
    }
    float _153 = _151;
    int _155 = 0;
    if (_127)
    {
        uint _157 = uint(int(uint(_99) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _155 = as_type<int>(_163);
    }
    int _165 = _155;
    if (_127)
    {
        _131 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _131;
    float _169 = _149;
    float _171 = as_type<float>(_66);
    float _173 = 0.0;
    float _175 = as_type<float>(_145);
    if (_123)
    {
        int _177 = _66;
        int _179 = 0;
        int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _145;
        int _185 = 0;
        int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1810 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1810.xy), uint(_1810.z), 0).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        _169 = _193;
        _171 = _195;
        _173 = _197;
    }
    float _199 = _169;
    float _201 = _171;
    float _203 = _173;
    float _205 = 0.0;
    float _207 = as_type<float>(_66);
    float _209 = 0.0;
    if (_123)
    {
        int _211 = _66;
        int _213 = 0;
        int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _145;
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1838 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1838.xy), uint(_1838.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        _205 = _225;
        _207 = _227;
        _209 = _229;
    }
    float _231 = _205;
    float _233 = _207;
    float _235 = _209;
    float _237 = _153;
    float _239 = as_type<float>(_66);
    float _241 = 0.0;
    if (_123)
    {
        int _243 = _66;
        int _245 = 0;
        int _247 = _56(_243, _245, (*spvDescriptorSet0.support_buffer));
        int _249 = _145;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int3 _1869 = int3(_247, _253, as_type<int>(_153));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1869.xy), uint(_1869.z), 0).xyz;
        float _257 = _255.x;
        float _259 = _255.y;
        float _261 = _255.z;
        _237 = _257;
        _239 = _259;
        _241 = _261;
    }
    float _263 = _237;
    float _265 = _239;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = as_type<float>(_66);
    float _273 = _109;
    if (_127)
    {
        int _275 = _66;
        int _277 = 1;
        int _279 = _56(_275, _277, (*spvDescriptorSet0.support_buffer));
        int _281 = _165;
        int _283 = 1;
        int _285 = _56(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _1898 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1898.xy), uint(_1898.z), 0).xyz;
        float _289 = _287.x;
        float _291 = _287.y;
        float _293 = _287.z;
        _269 = _289;
        _271 = _291;
        _273 = _293;
    }
    float _295 = _269;
    float _297 = _271;
    float _299 = _273;
    float _301 = 0.0;
    float _303 = 0.0;
    float _305 = 0.0;
    float _307 = 0.0;
    if (_127)
    {
        int _309 = _66;
        int _311 = 1;
        int _313 = _56(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = _165;
        int _317 = 1;
        int _319 = _56(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1926 = int3(_313, _319, as_type<int>(_167));
        float4 _322 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1926.xy), uint(_1926.z), 0).xyzw;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = _322.w;
        _301 = _324;
        _303 = _326;
        _305 = _328;
        _307 = _330;
    }
    float _332 = _301;
    float _334 = _303;
    float _336 = _305;
    float _338 = _307;
    float _340 = 0.0;
    float _342 = 0.0;
    if (!_127)
    {
        _340 = 0.0;
        _342 = 0.0;
    }
    float _344 = _340;
    float _346 = _342;
    float _348 = 0.0;
    float _350 = _344;
    float _352 = _346;
    if (!_127)
    {
        _348 = 0.0;
    }
    float _354 = _348;
    float _356 = 0.0;
    float _358 = _354;
    if (!_127)
    {
        _133 = 0.0;
        _356 = 0.0;
    }
    float _360 = _133;
    float _362 = _356;
    float _364 = 0.0;
    float _366 = _360;
    float _368 = _362;
    if (!_127)
    {
        _364 = 0.0;
    }
    float _370 = _364;
    float _372 = 0.0;
    float _374 = _370;
    if (!_127)
    {
        _175 = 0.0;
        _372 = 0.0;
    }
    float _376 = _175;
    float _378 = _372;
    float _380 = 0.0;
    float _382 = _378;
    float _384 = _376;
    if (!_127)
    {
        _380 = 0.0;
    }
    float _386 = _380;
    float _388 = 0.0;
    float _390 = _386;
    if (!_127)
    {
        _388 = 0.0;
    }
    float _392 = _388;
    bool _394 = !_127;
    float _396 = _392;
    float _398 = _336;
    float _400 = _338;
    if (!_394)
    {
        int _402 = _66;
        int _404 = 1;
        int _406 = _56(_402, _404, (*spvDescriptorSet0.support_buffer));
        int _408 = _165;
        int _410 = 1;
        int _412 = _56(_408, _410, (*spvDescriptorSet0.support_buffer));
        int3 _2009 = int3(_406, _412, 2);
        float3 _414 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2009.xy), uint(_2009.z), 0).xyz;
        float _416 = _414.x;
        float _418 = _414.y;
        float _420 = _414.z;
        float _422 = _338 * 2.0;
        _390 = _332;
        _366 = _334;
        _396 = _336;
        _350 = _295;
        _382 = _418;
        _374 = _420;
        _358 = _297;
        _352 = _299;
        _384 = _416;
        _368 = _422;
    }
    float _424 = _390;
    float _426 = _366;
    float _428 = _396;
    float _430 = _350;
    float _432 = _382;
    float _434 = _374;
    float _436 = _358;
    float _438 = _352;
    float _440 = _384;
    float _442 = _368;
    bool _444 = !_123;
    float _446 = _430;
    int _448 = as_type<int>(_432);
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
    float _722;
    int _724;
    float _726;
    if (!_444)
    {
        float _456 = _424 * 0.15915493667125701904296875;
        float _458 = _426 * 0.15915493667125701904296875;
        float _460 = _428 * 0.15915493667125701904296875;
        float _462 = _201 * 0.15915493667125701904296875;
        float _464 = _456 * 6.283185482025146484375;
        float _466 = cos(_464);
        float _468 = _203 * 0.15915493667125701904296875;
        int _470 = _99 + 28;
        uint _472 = uint(int(uint(_470) >> uint(2)));
        uint _474 = uint(int(uint(int(_472)) >> uint(2)));
        int _476 = int(_472) & 3;
        float _478 = (*spvDescriptorSet0.cp_c5)._m0[int(_474)][_476];
        float _480 = _199 * 0.15915493667125701904296875;
        float _482 = _458 * 6.283185482025146484375;
        float _484 = cos(_482);
        int _486 = _99 + 20;
        uint _488 = uint(int(uint(_486) >> uint(2)));
        uint _490 = uint(int(uint(int(_488)) >> uint(2)));
        int _492 = int(_488) & 3;
        float _494 = (*spvDescriptorSet0.cp_c5)._m0[int(_490)][_492];
        float _496 = _460 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _460 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = _466 * _484;
        float _506 = _231 * _478;
        float _508 = _233 * _478;
        float _510 = _235 * _478;
        float _512 = _456 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _498 * _484;
        float _518 = fma(_430, _494, _506);
        float _520 = _458 * 6.283185482025146484375;
        float _522 = sin(_520);
        float _524 = _466 * _502;
        float _526 = _498 * _466;
        float _528 = _462 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = _514 * _502;
        float _534 = _484 * _502;
        float _536 = _514 * _484;
        float _538 = _468 * 6.283185482025146484375;
        float _540 = sin(_538);
        float _542 = _514 * _522;
        float _544 = -_532;
        float _546 = fma(_522, _526, _544);
        float _548 = -_526;
        float _550 = fma(_502, _542, _548);
        float _552 = fma(_498, _542, _524);
        float _554 = _468 * 6.283185482025146484375;
        float _556 = cos(_554);
        float _558 = _480 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _514 * _498;
        float _564 = _540 * _530;
        float _566 = fma(_522, _524, _562);
        float _568 = _564 * _478;
        float _570 = _522 * _494;
        float _572 = _462 * 6.283185482025146484375;
        float _574 = sin(_572);
        float _576 = _530 * _556;
        float _578 = fma(_516, _494, _568);
        float _580 = _265 * _478;
        float _582 = fma(_432, _494, _580);
        float _584 = _480 * 6.283185482025146484375;
        float _586 = sin(_584);
        float _588 = _560 * _556;
        float _590 = _540 * _560;
        float _592 = _560 * _530;
        float _594 = _267 * _478;
        float _596 = fma(_434, _494, _594);
        float _598 = _586 * _574;
        float _600 = _586 * _540;
        float _602 = _586 * _556;
        float _604 = _586 * _530;
        float _606 = -_590;
        float _608 = fma(_556, _598, _606);
        float _610 = fma(_540, _598, _588);
        float _612 = fma(_574, _588, _600);
        float _614 = _576 * _478;
        float _616 = -_602;
        float _618 = fma(_574, _590, _616);
        float _620 = _578 * _578;
        float _622 = _610 * _478;
        float _624 = fma(_534, _494, _614);
        float _626 = _618 * _478;
        float _628 = -_574;
        float _630 = -_570;
        float _632 = fma(_628, _478, _630);
        float _634 = _608 * _478;
        float _636 = fma(_624, _624, _620);
        float _638 = _612 * _478;
        float _640 = fma(_552, _494, _622);
        float _642 = fma(_546, _494, _626);
        float _644 = _604 * _478;
        float _646 = fma(_632, _632, _636);
        float _648 = fma(_550, _494, _634);
        float _650 = fma(_566, _494, _638);
        float _652 = _640 * _640;
        float _654 = _592 * _478;
        float _656 = _642 * _642;
        float _658 = fma(_536, _494, _644);
        float _660 = fma(_648, _648, _652);
        float _662 = fma(_504, _494, _654);
        float _664 = fma(_650, _650, _656);
        float _666 = rsqrt(_646);
        float _668 = fma(_658, _658, _660);
        float _670 = _263 * _478;
        float _672 = fma(_662, _662, _664);
        float _674 = fma(_436, _494, _508);
        float _676 = fma(_438, _494, _510);
        float _678 = rsqrt(_668);
        float _680 = rsqrt(_672);
        float _682 = _624 * _666;
        float _684 = _578 * _666;
        float _686 = _632 * _666;
        float _688 = fma(_440, _494, _670);
        float _690 = _648 * _678;
        float _692 = _640 * _678;
        float _694 = _658 * _678;
        float _696 = _650 * _680;
        float _698 = _642 * _680;
        float _700 = _662 * _680;
        _446 = _518;
        _702 = _682;
        _704 = _684;
        _706 = _686;
        _708 = _674;
        _710 = _690;
        _712 = _692;
        _714 = _694;
        _716 = _676;
        _718 = _696;
        _720 = _698;
        _722 = _700;
        _724 = as_type<int>(_688);
        _448 = as_type<int>(_582);
        _450 = as_type<int>(_596);
        _726 = _642;
        _398 = _662;
        _400 = _680;
        _728 = true;
    }
    else
    {
        float _730 = _424 * 2.0;
        float _732 = _428 * _442;
        float _734 = _426 * _442;
        float _736 = _424 * _442;
        float _738 = _426 * _426;
        float _740 = -_732;
        float _742 = fma(_730, _426, _740);
        float _744 = fma(_730, _426, _732);
        float _746 = fma(_730, _428, _734);
        float _748 = -_734;
        float _750 = fma(_730, _428, _748);
        float _752 = _424 * _424;
        float _754 = _426 * 2.0;
        float _756 = _428 * _428;
        float _758 = fma(_738, -2.0, 1.0);
        float _760 = fma(_752, -2.0, 1.0);
        float _762 = -_736;
        float _764 = fma(_754, _428, _762);
        float _766 = fma(_754, _428, _736);
        float _768 = fma(_756, -2.0, _758);
        float _770 = fma(_756, -2.0, _760);
        float _772 = fma(_738, -2.0, _760);
        _702 = _768;
        _704 = _744;
        _706 = _750;
        _708 = _436;
        _710 = _742;
        _712 = _770;
        _714 = _766;
        _716 = _438;
        _718 = _746;
        _720 = _764;
        _722 = _772;
        _724 = as_type<int>(_440);
        _726 = _736;
    }
    _728 = false;
    float _774 = _446;
    float _776 = _702;
    float _778 = _704;
    float _780 = _706;
    float _782 = _708;
    float _784 = _710;
    float _786 = _712;
    float _788 = _714;
    float _790 = _716;
    float _792 = _718;
    float _794 = _720;
    float _796 = _722;
    int _798 = _724;
    int _800 = _448;
    int _802 = _450;
    float _804 = _726;
    float _806 = _398;
    float _808 = _400;
    float _810 = _774 * _776;
    float _812 = _774 * _778;
    float _814 = _774 * _780;
    float _816 = _782 * _784;
    float _818 = _782 * _786;
    float _820 = _782 * _788;
    int _822 = _66 * 48;
    float _824 = _790 * _792;
    float _826 = _790 * _794;
    float _828 = _790 * _796;
    bool _830 = _66 != 0;
    uint _832 = uint(int(uint(_822) >> uint(2)));
    _37[int(_832)] = as_type<uint>(_810);
    int _834 = _822 + 4;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    _37[int(_836)] = as_type<uint>(_816);
    int _838 = _822 + 8;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    _37[int(_840)] = as_type<uint>(_824);
    int _842 = _822 + 12;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    _37[int(_844)] = uint(_798);
    int _846 = _66 * 112;
    int _848 = _822 + 16;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    _37[int(_850)] = as_type<uint>(_812);
    int _852 = _822 + 20;
    uint _854 = uint(int(uint(_852) >> uint(2)));
    _37[int(_854)] = as_type<uint>(_818);
    int _856 = _822 + 24;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    _37[int(_858)] = as_type<uint>(_826);
    int _860 = _822 + 28;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    _37[int(_862)] = uint(_800);
    int _864 = _822 + 32;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    _37[int(_866)] = as_type<uint>(_814);
    int _868 = _822 + 36;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    _37[int(_870)] = as_type<uint>(_820);
    int _872 = _822 + 40;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    _37[int(_874)] = as_type<uint>(_828);
    int _876 = _822 + 44;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    _37[int(_878)] = uint(_802);
    float _880 = _808;
    float _882 = _806;
    float _884 = _804;
    float _886 = _774;
    float _888 = _790;
    float _890 = _782;
    float _892 = _794;
    float _894 = _820;
    float _896 = _828;
    float _898 = as_type<float>(_802);
    if (!_830)
    {
        _880 = _810;
    }
    float _900 = _880;
    float _902 = _900;
    if (!_830)
    {
        _882 = _816;
    }
    float _904 = _882;
    float _906 = _904;
    if (!_830)
    {
        _884 = _824;
    }
    float _908 = _884;
    float _910 = _908;
    if (!_830)
    {
        _452 = as_type<float>(_798);
    }
    float _912 = _452;
    float _914 = _912;
    if (!_830)
    {
        _886 = _812;
    }
    float _916 = _886;
    float _918 = _916;
    if (!_830)
    {
        _454 = _818;
    }
    float _920 = _454;
    float _922 = _920;
    if (!_830)
    {
        _888 = _826;
    }
    float _924 = _888;
    float _926 = _924;
    if (!_830)
    {
        _890 = as_type<float>(_800);
    }
    float _928 = _890;
    float _930 = _928;
    if (!_830)
    {
        _892 = _814;
    }
    float _932 = _892;
    bool _934 = !_830;
    float _936 = _932;
    if (!_934)
    {
        bool _938 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _940 = !_938;
        if (!_940)
        {
            uint _942 = uint(int(uint(_846) >> uint(2)));
            uint _944 = uint(int(uint(int(_942)) >> uint(2)));
            int _946 = int(_942) & 3;
            float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
            int _950 = as_type<int>(_948) * 48;
            int _952 = 0;
            bool _954;
            float _1050;
            float _1054;
            float _1058;
            float _1062;
            float _1076;
            float _1078;
            float _1090;
            float _1100;
            float _1102;
            float _1104;
            float _1106;
            float _1108;
            do
            {
                int _956 = _952;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _958 = uint(int(uint(_950) >> uint(2)));
                float _960 = as_type<float>(_37[int(_958)]);
                int _962 = _950 + 4;
                uint _964 = uint(int(uint(_962) >> uint(2)));
                float _966 = as_type<float>(_37[int(_964)]);
                int _968 = _950 + 8;
                uint _970 = uint(int(uint(_968) >> uint(2)));
                float _972 = as_type<float>(_37[int(_970)]);
                int _974 = _950 + 12;
                uint _976 = uint(int(uint(_974) >> uint(2)));
                float _978 = as_type<float>(_37[int(_976)]);
                int _980 = _956 + 1;
                int _982 = _950 + 16;
                uint _984 = uint(int(uint(_982) >> uint(2)));
                float _986 = as_type<float>(_37[int(_984)]);
                int _988 = _950 + 20;
                uint _990 = uint(int(uint(_988) >> uint(2)));
                float _992 = as_type<float>(_37[int(_990)]);
                int _994 = _950 + 24;
                uint _996 = uint(int(uint(_994) >> uint(2)));
                float _998 = as_type<float>(_37[int(_996)]);
                int _1000 = _950 + 28;
                uint _1002 = uint(int(uint(_1000) >> uint(2)));
                float _1004 = as_type<float>(_37[int(_1002)]);
                bool _1006 = uint(_980) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1008 = _950 + 32;
                uint _1010 = uint(int(uint(_1008) >> uint(2)));
                float _1012 = as_type<float>(_37[int(_1010)]);
                int _1014 = _950 + 36;
                uint _1016 = uint(int(uint(_1014) >> uint(2)));
                float _1018 = as_type<float>(_37[int(_1016)]);
                int _1020 = _950 + 40;
                uint _1022 = uint(int(uint(_1020) >> uint(2)));
                float _1024 = as_type<float>(_37[int(_1022)]);
                int _1026 = _950 + 44;
                uint _1028 = uint(int(uint(_1026) >> uint(2)));
                float _1030 = as_type<float>(_37[int(_1028)]);
                float _1032 = _966 * as_type<float>(_800);
                float _1034 = _812 * _966;
                float _1036 = _818 * _966;
                float _1038 = _826 * _966;
                float _1040 = fma(_960, as_type<float>(_798), _1032);
                float _1042 = fma(_810, _960, _1034);
                float _1044 = fma(_816, _960, _1036);
                float _1046 = fma(_824, _960, _1038);
                float _1048 = fma(_972, as_type<float>(_802), _1040);
                _1050 = fma(_814, _972, _1042);
                float _1052 = _812 * _992;
                _1054 = fma(_828, _972, _1046);
                float _1056 = _992 * as_type<float>(_800);
                _1058 = _978 + _1048;
                float _1060 = _818 * _992;
                _1062 = fma(_820, _972, _1044);
                float _1064 = fma(_986, as_type<float>(_798), _1056);
                float _1066 = fma(_810, _986, _1052);
                float _1068 = fma(_816, _986, _1060);
                float _1070 = _826 * _992;
                float _1072 = fma(_998, as_type<float>(_802), _1064);
                float _1074 = _1018 * as_type<float>(_800);
                _1076 = fma(_814, _998, _1066);
                _1078 = fma(_820, _998, _1068);
                float _1080 = _812 * _1018;
                float _1082 = _818 * _1018;
                float _1084 = _826 * _1018;
                float _1086 = fma(_1012, as_type<float>(_798), _1074);
                float _1088 = fma(_824, _986, _1070);
                _1090 = _1004 + _1072;
                float _1092 = fma(_810, _1012, _1080);
                float _1094 = fma(_816, _1012, _1082);
                float _1096 = fma(_824, _1012, _1084);
                float _1098 = fma(_1024, as_type<float>(_802), _1086);
                _1100 = fma(_828, _998, _1088);
                _1102 = fma(_814, _1024, _1092);
                _1104 = fma(_820, _1024, _1094);
                _1106 = fma(_828, _1024, _1096);
                _1108 = _1030 + _1098;
                uint _1110 = uint(int(uint(_822) >> uint(2)));
                _37[int(_1110)] = as_type<uint>(_1050);
                int _1112 = _822 + 4;
                uint _1114 = uint(int(uint(_1112) >> uint(2)));
                _37[int(_1114)] = as_type<uint>(_1062);
                int _1116 = _822 + 8;
                uint _1118 = uint(int(uint(_1116) >> uint(2)));
                _37[int(_1118)] = as_type<uint>(_1054);
                int _1120 = _822 + 12;
                uint _1122 = uint(int(uint(_1120) >> uint(2)));
                _37[int(_1122)] = as_type<uint>(_1058);
                int _1124 = _822 + 16;
                uint _1126 = uint(int(uint(_1124) >> uint(2)));
                _37[int(_1126)] = as_type<uint>(_1076);
                int _1128 = _822 + 20;
                uint _1130 = uint(int(uint(_1128) >> uint(2)));
                _37[int(_1130)] = as_type<uint>(_1078);
                int _1132 = _822 + 24;
                uint _1134 = uint(int(uint(_1132) >> uint(2)));
                _37[int(_1134)] = as_type<uint>(_1100);
                int _1136 = _822 + 28;
                uint _1138 = uint(int(uint(_1136) >> uint(2)));
                _37[int(_1138)] = as_type<uint>(_1090);
                int _1140 = _822 + 32;
                uint _1142 = uint(int(uint(_1140) >> uint(2)));
                _37[int(_1142)] = as_type<uint>(_1102);
                int _1144 = _822 + 36;
                uint _1146 = uint(int(uint(_1144) >> uint(2)));
                _37[int(_1146)] = as_type<uint>(_1104);
                int _1148 = _822 + 40;
                uint _1150 = uint(int(uint(_1148) >> uint(2)));
                _37[int(_1150)] = as_type<uint>(_1106);
                int _1152 = _822 + 44;
                uint _1154 = uint(int(uint(_1152) >> uint(2)));
                _37[int(_1154)] = as_type<uint>(_1108);
                _954 = !_1006;
                _952 = _980;
            } while (_954);
            _894 = _1104;
            _906 = _1062;
            _922 = _1078;
            _936 = _1102;
            _902 = _1050;
            _918 = _1076;
            _926 = _1100;
            _896 = _1106;
            _910 = _1054;
            _930 = _1090;
            _914 = _1058;
            _898 = _1108;
            _1156 = true;
        }
        else
        {
            _894 = 0.0;
            _906 = 0.0;
            _922 = 0.0;
            _936 = 0.0;
            _902 = 0.0;
            _918 = 0.0;
            _926 = 0.0;
            _896 = 0.0;
            _910 = 0.0;
            _930 = 0.0;
            _914 = 0.0;
            _898 = 0.0;
        }
    }
    _1156 = false;
    float _1158 = _894;
    float _1160 = _906;
    float _1162 = _922;
    float _1164 = _936;
    float _1166 = _902;
    float _1168 = _918;
    float _1170 = _926;
    float _1172 = _896;
    float _1174 = _910;
    float _1176 = _930;
    float _1178 = _914;
    float _1180 = _898;
    int _1182 = _846 + 80;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
    int _1188 = int(_1184) & 3;
    float _1190 = (*spvDescriptorSet0.cp_c6)._m0[int(_1186)][_1188];
    int _1192 = int(_1184) + 1;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    int _1196 = _1192 & 3;
    float _1198 = (*spvDescriptorSet0.cp_c6)._m0[int(_1194)][_1196];
    int _1200 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1202 = _1200 + _66;
    int _1204 = _846 + 64;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.cp_c6)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.cp_c6)._m0[int(_1216)][_1218];
    int _1222 = _1202 * 48;
    int _1224 = _846 + 88;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    uint _1228 = uint(int(uint(int(_1226)) >> uint(2)));
    int _1230 = int(_1226) & 3;
    float _1232 = (*spvDescriptorSet0.cp_c6)._m0[int(_1228)][_1230];
    int _1234 = int(_1226) + 1;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    int _1238 = _1234 & 3;
    float _1240 = (*spvDescriptorSet0.cp_c6)._m0[int(_1236)][_1238];
    int _1242 = _846 + 72;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    uint _1246 = uint(int(uint(int(_1244)) >> uint(2)));
    int _1248 = int(_1244) & 3;
    float _1250 = (*spvDescriptorSet0.cp_c6)._m0[int(_1246)][_1248];
    int _1252 = int(_1244) + 1;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    int _1256 = _1252 & 3;
    float _1258 = (*spvDescriptorSet0.cp_c6)._m0[int(_1254)][_1256];
    int _1260 = _846 + 96;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    uint _1264 = uint(int(uint(int(_1262)) >> uint(2)));
    int _1266 = int(_1262) & 3;
    float _1268 = (*spvDescriptorSet0.cp_c6)._m0[int(_1264)][_1266];
    int _1270 = int(_1262) + 1;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    int _1274 = _1270 & 3;
    float _1276 = (*spvDescriptorSet0.cp_c6)._m0[int(_1272)][_1274];
    int _1278 = _846 + 104;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    uint _1282 = uint(int(uint(int(_1280)) >> uint(2)));
    int _1284 = int(_1280) & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    int _1288 = int(_1280) + 1;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    int _1292 = _1288 & 3;
    float _1294 = (*spvDescriptorSet0.cp_c6)._m0[int(_1290)][_1292];
    float _1296 = _1158 * _1190;
    int _1298 = _846 + 16;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.cp_c6)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    float _1316 = _1160 * _1190;
    float _1318 = _1162 * _1190;
    float _1320 = _1162 * _1198;
    float _1322 = fma(_1164, _1212, _1296);
    float _1324 = _1158 * _1198;
    int _1326 = _846 + 32;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
    int _1332 = int(_1328) & 3;
    float _1334 = (*spvDescriptorSet0.cp_c6)._m0[int(_1330)][_1332];
    int _1336 = int(_1328) + 1;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    int _1340 = _1336 & 3;
    float _1342 = (*spvDescriptorSet0.cp_c6)._m0[int(_1338)][_1340];
    float _1344 = fma(_1166, _1212, _1316);
    float _1346 = fma(_1168, _1212, _1318);
    float _1348 = fma(_1168, _1220, _1320);
    float _1350 = _1160 * _1198;
    float _1352 = fma(_1164, _1220, _1324);
    float _1354 = _1160 * _1232;
    float _1356 = _1162 * _1232;
    int _1358 = _846 + 48;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.cp_c6)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.cp_c6)._m0[int(_1370)][_1372];
    float _1376 = _1160 * _1240;
    float _1378 = _1162 * _1240;
    float _1380 = _1158 * _1232;
    float _1382 = _1158 * _1240;
    float _1384 = fma(_1166, _1220, _1350);
    float _1386 = fma(_1168, _1250, _1356);
    float _1388 = fma(_1168, _1258, _1378);
    int _1390 = _846 + 24;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    uint _1394 = uint(int(uint(int(_1392)) >> uint(2)));
    int _1396 = int(_1392) & 3;
    float _1398 = (*spvDescriptorSet0.cp_c6)._m0[int(_1394)][_1396];
    int _1400 = int(_1392) + 1;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    int _1404 = _1400 & 3;
    float _1406 = (*spvDescriptorSet0.cp_c6)._m0[int(_1402)][_1404];
    float _1408 = fma(_1166, _1250, _1354);
    float _1410 = fma(_1166, _1258, _1376);
    float _1412 = fma(_1164, _1250, _1380);
    float _1414 = fma(_1164, _1258, _1382);
    float _1416 = fma(_1170, _1268, _1346);
    float _1418 = fma(_1170, _1276, _1348);
    int _1420 = _846 + 40;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
    int _1426 = int(_1422) & 3;
    float _1428 = (*spvDescriptorSet0.cp_c6)._m0[int(_1424)][_1426];
    int _1430 = int(_1422) + 1;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    int _1434 = _1430 & 3;
    float _1436 = (*spvDescriptorSet0.cp_c6)._m0[int(_1432)][_1434];
    float _1438 = fma(_1172, _1268, _1322);
    float _1440 = fma(_1174, _1268, _1344);
    float _1442 = fma(_1174, _1276, _1384);
    float _1444 = fma(_1172, _1276, _1352);
    float _1446 = fma(_1170, _1286, _1386);
    float _1448 = fma(_1170, _1294, _1388);
    int _1450 = _846 + 56;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
    int _1456 = int(_1452) & 3;
    float _1458 = (*spvDescriptorSet0.cp_c6)._m0[int(_1454)][_1456];
    int _1460 = int(_1452) + 1;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    int _1464 = _1460 & 3;
    float _1466 = (*spvDescriptorSet0.cp_c6)._m0[int(_1462)][_1464];
    float _1468 = fma(_1174, _1286, _1408);
    float _1470 = fma(_1174, _1294, _1410);
    float _1472 = _1448 + _1176;
    float _1474 = fma(_1172, _1294, _1414);
    float _1476 = fma(_1172, _1286, _1412);
    float _1478 = _1470 + _1178;
    float _1480 = _1472 * _1314;
    float _1482 = _1474 + _1180;
    float _1484 = _1416 * _1314;
    float _1486 = _1418 * _1314;
    float _1488 = fma(_1478, _1306, _1480);
    float _1490 = _1446 * _1314;
    float _1492 = fma(_1440, _1306, _1484);
    float _1494 = fma(_1442, _1306, _1486);
    float _1496 = _1416 * _1342;
    float _1498 = _1472 * _1342;
    float _1500 = _1418 * _1342;
    float _1502 = _1446 * _1342;
    float _1504 = fma(_1440, _1334, _1496);
    float _1506 = fma(_1478, _1334, _1498);
    float _1508 = fma(_1468, _1306, _1490);
    float _1510 = fma(_1468, _1334, _1502);
    float _1512 = _1416 * _1374;
    float _1514 = _1472 * _1374;
    float _1516 = _1418 * _1374;
    float _1518 = _1446 * _1374;
    float _1520 = fma(_1440, _1366, _1512);
    float _1522 = fma(_1478, _1366, _1514);
    float _1524 = fma(_1442, _1366, _1516);
    float _1526 = fma(_1468, _1366, _1518);
    float _1528 = fma(_1482, _1398, _1488);
    float _1530 = fma(_1442, _1334, _1500);
    float _1532 = fma(_1444, _1398, _1494);
    float _1534 = fma(_1438, _1398, _1492);
    float _1536 = _1528 + _1406;
    float _1538 = fma(_1476, _1398, _1508);
    float _1540 = fma(_1482, _1428, _1506);
    float _1542 = fma(_1438, _1428, _1504);
    float _1544 = fma(_1476, _1428, _1510);
    float _1546 = fma(_1444, _1428, _1530);
    float _1548 = _1540 + _1436;
    float _1550 = fma(_1482, _1458, _1522);
    float _1552 = fma(_1438, _1458, _1520);
    float _1554 = fma(_1444, _1458, _1524);
    float _1556 = fma(_1476, _1458, _1526);
    int _1558 = _1222 + 16;
    float _1560 = _1550 + _1466;
    int _1562 = _1222 + 32;
    int _1564 = _1222 + 48;
    uint _1566 = uint(int(uint(_1558) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1566)] = as_type<uint>(_1534);
    int _1568 = _1558 + 4;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1570)] = as_type<uint>(_1532);
    int _1572 = _1558 + 8;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1574)] = as_type<uint>(_1538);
    int _1576 = _1558 + 12;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1578)] = as_type<uint>(_1536);
    uint _1580 = uint(int(uint(_1562) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1580)] = as_type<uint>(_1542);
    int _1582 = _1562 + 4;
    uint _1584 = uint(int(uint(_1582) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1584)] = as_type<uint>(_1546);
    int _1586 = _1562 + 8;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1588)] = as_type<uint>(_1544);
    int _1590 = _1562 + 12;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1592)] = as_type<uint>(_1548);
    uint _1594 = uint(int(uint(_1564) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1594)] = as_type<uint>(_1552);
    int _1596 = _1564 + 4;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1598)] = as_type<uint>(_1554);
    int _1600 = _1564 + 8;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1602)] = as_type<uint>(_1556);
    int _1604 = _1564 + 12;
    uint _1606 = uint(int(uint(_1604) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1606)] = as_type<uint>(_1560);
}

