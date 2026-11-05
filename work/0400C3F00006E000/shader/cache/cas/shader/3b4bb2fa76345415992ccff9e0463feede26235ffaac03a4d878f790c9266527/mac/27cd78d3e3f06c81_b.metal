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
int _56(thread const int& _3736, thread const int& _3737, constant _10& support_buffer)
{
    int _3740 = 1 + _3737;
    float _3742 = support_buffer._m5[_3740].x;
    bool _3744 = _3742 == 1.0;
    if (_3744)
    {
        return _3736;
    }
    float _3746 = float(_3736);
    float _3748 = _3746 * _3742;
    int _3750 = int(_3748);
    return _3750;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1038 = false;
    bool _604 = false;
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
    float _131 = _109;
    float _133 = _119;
    float _135 = _97;
    if (_123)
    {
        int _137 = _99 + 8;
        uint _139 = uint(int(uint(_137) >> uint(2)));
        uint _141 = uint(int(uint(int(_139)) >> uint(2)));
        int _143 = int(_139) & 3;
        float _145 = (*spvDescriptorSet0.cp_c5)._m0[int(_141)][_143];
        _129 = as_type<int>(_145);
    }
    int _147 = _129;
    float _149 = 0.0;
    if (_123)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    float _153 = 0.0;
    if (_123)
    {
        _153 = 2.8025969286496341418474591665798e-45;
    }
    float _155 = _153;
    int _157 = 0;
    if (_127)
    {
        uint _159 = uint(int(uint(_99) >> uint(2)));
        uint _161 = uint(int(uint(int(_159)) >> uint(2)));
        int _163 = int(_159) & 3;
        float _165 = (*spvDescriptorSet0.cp_c5)._m0[int(_161)][_163];
        _157 = as_type<int>(_165);
    }
    int _167 = _157;
    float _169 = 0.0;
    if (_127)
    {
        _169 = 1.4012984643248170709237295832899e-45;
    }
    float _171 = _169;
    float _173 = _151;
    float _175 = as_type<float>(_66);
    float _177 = 0.0;
    if (_123)
    {
        int _179 = _66;
        int _181 = 0;
        int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _147;
        int _187 = 0;
        int _189 = _56(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1691 = int3(_183, _189, as_type<int>(_151));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1691.xy), uint(_1691.z), 0).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        _173 = _195;
        _175 = _197;
        _177 = _199;
    }
    float _201 = _173;
    float _203 = _175;
    float _205 = _177;
    float _207 = 0.0;
    float _209 = as_type<float>(_66);
    float _211 = 0.0;
    if (_123)
    {
        int _213 = _66;
        int _215 = 0;
        int _217 = _56(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _147;
        int _221 = 0;
        int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _1719 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1719.xy), uint(_1719.z), 0).xyz;
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
    float _241 = as_type<float>(_66);
    float _243 = 0.0;
    if (_123)
    {
        int _245 = _66;
        int _247 = 0;
        int _249 = _56(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _147;
        int _253 = 0;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _1750 = int3(_249, _255, as_type<int>(_155));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1750.xy), uint(_1750.z), 0).xyz;
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
    float _273 = as_type<float>(_66);
    float _275 = 0.0;
    if (_127)
    {
        int _277 = _66;
        int _279 = 1;
        int _281 = _56(_277, _279, (*spvDescriptorSet0.support_buffer));
        int _283 = _167;
        int _285 = 1;
        int _287 = _56(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _1778 = int3(_281, _287, 0);
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1778.xy), uint(_1778.z), 0).xyz;
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
    if (_127)
    {
        int _311 = _66;
        int _313 = 1;
        int _315 = _56(_311, _313, (*spvDescriptorSet0.support_buffer));
        int _317 = _167;
        int _319 = 1;
        int _321 = _56(_317, _319, (*spvDescriptorSet0.support_buffer));
        int3 _1806 = int3(_315, _321, as_type<int>(_171));
        float4 _324 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1806.xy), uint(_1806.z), 0).xyzw;
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
    if (!_127)
    {
        _342 = 0.0;
    }
    float _344 = _342;
    float _346 = 0.0;
    float _348 = 0.0;
    float _350 = _344;
    if (!_127)
    {
        _346 = 0.0;
        _348 = 0.0;
    }
    float _352 = _346;
    float _354 = _348;
    float _356 = 0.0;
    float _358 = _354;
    float _360 = _352;
    if (!_127)
    {
        _356 = 0.0;
    }
    float _362 = _356;
    float _364 = 0.0;
    float _366 = _362;
    if (!_127)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    float _370 = 0.0;
    float _372 = _368;
    if (!_127)
    {
        _370 = 0.0;
    }
    float _374 = _370;
    float _376 = _374;
    if (!_127)
    {
        _131 = 0.0;
    }
    float _378 = _131;
    float _380 = _378;
    if (!_127)
    {
        _133 = 0.0;
    }
    float _382 = _133;
    float _384 = 0.0;
    float _386 = _382;
    if (!_127)
    {
        _384 = 0.0;
    }
    float _388 = _384;
    float _390 = _388;
    if (!_127)
    {
        _135 = 0.0;
    }
    float _392 = _135;
    bool _394 = !_127;
    float _396 = _392;
    float _398 = _334;
    if (!_394)
    {
        int _400 = _66;
        int _402 = 1;
        int _404 = _56(_400, _402, (*spvDescriptorSet0.support_buffer));
        int _406 = _167;
        int _408 = 1;
        int _410 = _56(_406, _408, (*spvDescriptorSet0.support_buffer));
        int3 _1896 = int3(_404, _410, 2);
        float3 _412 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1896.xy), uint(_1896.z), 0).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _340 * 2.0;
        _390 = _338;
        _380 = _334;
        _386 = _336;
        _366 = _299;
        _372 = _301;
        _358 = _416;
        _350 = _297;
        _376 = _418;
        _360 = _414;
        _396 = _420;
    }
    float _422 = _390;
    float _424 = _380;
    float _426 = _386;
    float _428 = _366;
    float _430 = _372;
    float _432 = _358;
    float _434 = _350;
    float _436 = _376;
    float _438 = _360;
    float _440 = _396;
    bool _442 = !_123;
    float _444 = _434;
    float _446 = _430;
    int _448 = as_type<int>(_436);
    float _450 = _432;
    float _452 = _438;
    float _574;
    float _576;
    float _578;
    float _580;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    float _592;
    int _594;
    int _596;
    float _598;
    float _600;
    float _602;
    if (!_442)
    {
        int _454 = _99 + 28;
        uint _456 = uint(int(uint(_454) >> uint(2)));
        uint _458 = uint(int(uint(int(_456)) >> uint(2)));
        int _460 = int(_456) & 3;
        float _462 = (*spvDescriptorSet0.cp_c5)._m0[int(_458)][_460];
        int _464 = _99 + 20;
        uint _466 = uint(int(uint(_464) >> uint(2)));
        uint _468 = uint(int(uint(int(_466)) >> uint(2)));
        int _470 = int(_466) & 3;
        float _472 = (*spvDescriptorSet0.cp_c5)._m0[int(_468)][_470];
        float _474 = _205 * _462;
        float _476 = _201 * _462;
        float _478 = _203 * _462;
        float _480 = _235 * _462;
        float _482 = _237 * _462;
        float _484 = _269 * _462;
        float _486 = _233 * _462;
        float _488 = fma(_422, _472, _474);
        float _490 = fma(_424, _472, _476);
        float _492 = fma(_426, _472, _478);
        float _494 = fma(_428, _472, _480);
        float _496 = _488 * 0.15915493667125701904296875;
        float _498 = _490 * 0.15915493667125701904296875;
        float _500 = _492 * 0.15915493667125701904296875;
        float _502 = _267 * _462;
        float _504 = _496 * 6.283185482025146484375;
        float _506 = sin(_504);
        float _508 = fma(_430, _472, _482);
        float _510 = _265 * _462;
        float _512 = fma(_432, _472, _502);
        float _514 = fma(_434, _472, _486);
        float _516 = fma(_436, _472, _484);
        float _518 = fma(_438, _472, _510);
        float _520 = _498 * 6.283185482025146484375;
        float _522 = sin(_520);
        float _524 = _498 * 6.283185482025146484375;
        float _526 = cos(_524);
        float _528 = _496 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = _522 * _506;
        float _534 = _500 * 6.283185482025146484375;
        float _536 = sin(_534);
        float _538 = _506 * _526;
        float _540 = _500 * 6.283185482025146484375;
        float _542 = cos(_540);
        float _544 = _526 * _530;
        float _546 = _522 * _530;
        float _548 = _522 * _536;
        float _550 = _526 * _542;
        float _552 = _542 * _530;
        float _554 = _506 * _542;
        float _556 = _522 * _542;
        float _558 = fma(_506, _548, _544);
        float _560 = fma(_536, _544, _532);
        float _562 = -_538;
        float _564 = fma(_530, _548, _562);
        float _566 = -_546;
        float _568 = fma(_536, _538, _566);
        float _570 = -_536;
        float _572 = _570 + (-0.0);
        _444 = _514;
        _574 = _552;
        _576 = _554;
        _578 = _572;
        _580 = _494;
        _582 = _564;
        _584 = _558;
        _586 = _556;
        _446 = _508;
        _588 = _560;
        _590 = _568;
        _592 = _550;
        _594 = as_type<int>(_518);
        _596 = as_type<int>(_512);
        _448 = as_type<int>(_516);
        _598 = _548;
        _600 = _532;
        _450 = _546;
        _398 = _484;
        _602 = _536;
        _604 = true;
    }
    else
    {
        float _606 = _424 * 2.0;
        float _608 = _422 * _440;
        float _610 = _426 * _440;
        float _612 = _426 * _426;
        float _614 = -_608;
        float _616 = fma(_606, _426, _614);
        float _618 = fma(_606, _426, _608);
        float _620 = _424 * _440;
        float _622 = _424 * _424;
        float _624 = _426 * 2.0;
        float _626 = _422 * _422;
        float _628 = fma(_612, -2.0, 1.0);
        float _630 = fma(_606, _422, _610);
        float _632 = fma(_622, -2.0, 1.0);
        float _634 = -_610;
        float _636 = fma(_606, _422, _634);
        float _638 = -_620;
        float _640 = fma(_624, _422, _638);
        float _642 = fma(_624, _422, _620);
        float _644 = fma(_626, -2.0, _628);
        float _646 = fma(_626, -2.0, _632);
        float _648 = fma(_612, -2.0, _632);
        _574 = _644;
        _576 = _618;
        _578 = _636;
        _580 = _428;
        _582 = _616;
        _584 = _646;
        _586 = _642;
        _588 = _630;
        _590 = _640;
        _592 = _648;
        _594 = as_type<int>(_438);
        _596 = as_type<int>(_432);
        _598 = _628;
        _600 = 0.0;
        _602 = _620;
    }
    _604 = false;
    float _650 = _444;
    float _652 = _574;
    float _654 = _576;
    float _656 = _578;
    float _658 = _580;
    float _660 = _582;
    float _662 = _584;
    float _664 = _586;
    float _666 = _446;
    float _668 = _588;
    float _670 = _590;
    float _672 = _592;
    int _674 = _594;
    int _676 = _596;
    int _678 = _448;
    float _680 = _598;
    float _682 = _600;
    float _684 = _450;
    float _686 = _398;
    float _688 = _602;
    float _690 = _650 * _652;
    float _692 = _650 * _654;
    float _694 = _650 * _656;
    float _696 = _658 * _660;
    float _698 = _658 * _662;
    float _700 = _658 * _664;
    int _702 = _66 * 48;
    float _704 = _666 * _668;
    float _706 = _666 * _670;
    float _708 = _666 * _672;
    bool _710 = _66 != 0;
    uint _712 = uint(int(uint(_702) >> uint(2)));
    _37[int(_712)] = as_type<uint>(_690);
    int _714 = _702 + 4;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    _37[int(_716)] = as_type<uint>(_696);
    int _718 = _702 + 8;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    _37[int(_720)] = as_type<uint>(_704);
    int _722 = _702 + 12;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    _37[int(_724)] = uint(_674);
    int _726 = _66 * 112;
    int _728 = _702 + 16;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    _37[int(_730)] = as_type<uint>(_692);
    int _732 = _702 + 20;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    _37[int(_734)] = as_type<uint>(_698);
    int _736 = _702 + 24;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    _37[int(_738)] = as_type<uint>(_706);
    int _740 = _702 + 28;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    _37[int(_742)] = uint(_676);
    int _744 = _702 + 32;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    _37[int(_746)] = as_type<uint>(_694);
    int _748 = _702 + 36;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    _37[int(_750)] = as_type<uint>(_700);
    int _752 = _702 + 40;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    _37[int(_754)] = as_type<uint>(_708);
    int _756 = _702 + 44;
    uint _758 = uint(int(uint(_756) >> uint(2)));
    _37[int(_758)] = uint(_678);
    float _760 = _688;
    float _762 = _686;
    float _764 = _684;
    float _766 = _650;
    float _768 = _682;
    float _770 = _666;
    float _772 = _680;
    float _774 = _658;
    float _776 = _700;
    float _778 = _708;
    float _780 = as_type<float>(_678);
    if (!_710)
    {
        _760 = _690;
    }
    float _782 = _760;
    float _784 = _782;
    if (!_710)
    {
        _762 = _696;
    }
    float _786 = _762;
    float _788 = _786;
    if (!_710)
    {
        _764 = _704;
    }
    float _790 = _764;
    float _792 = _790;
    if (!_710)
    {
        _452 = as_type<float>(_674);
    }
    float _794 = _452;
    float _796 = _794;
    if (!_710)
    {
        _766 = _692;
    }
    float _798 = _766;
    float _800 = _798;
    if (!_710)
    {
        _768 = _698;
    }
    float _802 = _768;
    float _804 = _802;
    if (!_710)
    {
        _770 = _706;
    }
    float _806 = _770;
    float _808 = _806;
    if (!_710)
    {
        _772 = as_type<float>(_676);
    }
    float _810 = _772;
    float _812 = _810;
    if (!_710)
    {
        _774 = _694;
    }
    float _814 = _774;
    bool _816 = !_710;
    float _818 = _814;
    if (!_816)
    {
        bool _820 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _822 = !_820;
        if (!_822)
        {
            uint _824 = uint(int(uint(_726) >> uint(2)));
            uint _826 = uint(int(uint(int(_824)) >> uint(2)));
            int _828 = int(_824) & 3;
            float _830 = (*spvDescriptorSet0.cp_c6)._m0[int(_826)][_828];
            int _832 = as_type<int>(_830) * 48;
            int _834 = 0;
            bool _836;
            float _932;
            float _936;
            float _940;
            float _944;
            float _958;
            float _960;
            float _972;
            float _982;
            float _984;
            float _986;
            float _988;
            float _990;
            do
            {
                int _838 = _834;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _840 = uint(int(uint(_832) >> uint(2)));
                float _842 = as_type<float>(_37[int(_840)]);
                int _844 = _832 + 4;
                uint _846 = uint(int(uint(_844) >> uint(2)));
                float _848 = as_type<float>(_37[int(_846)]);
                int _850 = _832 + 8;
                uint _852 = uint(int(uint(_850) >> uint(2)));
                float _854 = as_type<float>(_37[int(_852)]);
                int _856 = _832 + 12;
                uint _858 = uint(int(uint(_856) >> uint(2)));
                float _860 = as_type<float>(_37[int(_858)]);
                int _862 = _838 + 1;
                int _864 = _832 + 16;
                uint _866 = uint(int(uint(_864) >> uint(2)));
                float _868 = as_type<float>(_37[int(_866)]);
                int _870 = _832 + 20;
                uint _872 = uint(int(uint(_870) >> uint(2)));
                float _874 = as_type<float>(_37[int(_872)]);
                int _876 = _832 + 24;
                uint _878 = uint(int(uint(_876) >> uint(2)));
                float _880 = as_type<float>(_37[int(_878)]);
                int _882 = _832 + 28;
                uint _884 = uint(int(uint(_882) >> uint(2)));
                float _886 = as_type<float>(_37[int(_884)]);
                bool _888 = uint(_862) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _890 = _832 + 32;
                uint _892 = uint(int(uint(_890) >> uint(2)));
                float _894 = as_type<float>(_37[int(_892)]);
                int _896 = _832 + 36;
                uint _898 = uint(int(uint(_896) >> uint(2)));
                float _900 = as_type<float>(_37[int(_898)]);
                int _902 = _832 + 40;
                uint _904 = uint(int(uint(_902) >> uint(2)));
                float _906 = as_type<float>(_37[int(_904)]);
                int _908 = _832 + 44;
                uint _910 = uint(int(uint(_908) >> uint(2)));
                float _912 = as_type<float>(_37[int(_910)]);
                float _914 = _848 * as_type<float>(_676);
                float _916 = _692 * _848;
                float _918 = _698 * _848;
                float _920 = _706 * _848;
                float _922 = fma(_842, as_type<float>(_674), _914);
                float _924 = fma(_690, _842, _916);
                float _926 = fma(_696, _842, _918);
                float _928 = fma(_704, _842, _920);
                float _930 = fma(_854, as_type<float>(_678), _922);
                _932 = fma(_694, _854, _924);
                float _934 = _692 * _874;
                _936 = fma(_708, _854, _928);
                float _938 = _874 * as_type<float>(_676);
                _940 = _860 + _930;
                float _942 = _698 * _874;
                _944 = fma(_700, _854, _926);
                float _946 = fma(_868, as_type<float>(_674), _938);
                float _948 = fma(_690, _868, _934);
                float _950 = fma(_696, _868, _942);
                float _952 = _706 * _874;
                float _954 = fma(_880, as_type<float>(_678), _946);
                float _956 = _900 * as_type<float>(_676);
                _958 = fma(_694, _880, _948);
                _960 = fma(_700, _880, _950);
                float _962 = _692 * _900;
                float _964 = _698 * _900;
                float _966 = _706 * _900;
                float _968 = fma(_894, as_type<float>(_674), _956);
                float _970 = fma(_704, _868, _952);
                _972 = _886 + _954;
                float _974 = fma(_690, _894, _962);
                float _976 = fma(_696, _894, _964);
                float _978 = fma(_704, _894, _966);
                float _980 = fma(_906, as_type<float>(_678), _968);
                _982 = fma(_708, _880, _970);
                _984 = fma(_694, _906, _974);
                _986 = fma(_700, _906, _976);
                _988 = fma(_708, _906, _978);
                _990 = _912 + _980;
                uint _992 = uint(int(uint(_702) >> uint(2)));
                _37[int(_992)] = as_type<uint>(_932);
                int _994 = _702 + 4;
                uint _996 = uint(int(uint(_994) >> uint(2)));
                _37[int(_996)] = as_type<uint>(_944);
                int _998 = _702 + 8;
                uint _1000 = uint(int(uint(_998) >> uint(2)));
                _37[int(_1000)] = as_type<uint>(_936);
                int _1002 = _702 + 12;
                uint _1004 = uint(int(uint(_1002) >> uint(2)));
                _37[int(_1004)] = as_type<uint>(_940);
                int _1006 = _702 + 16;
                uint _1008 = uint(int(uint(_1006) >> uint(2)));
                _37[int(_1008)] = as_type<uint>(_958);
                int _1010 = _702 + 20;
                uint _1012 = uint(int(uint(_1010) >> uint(2)));
                _37[int(_1012)] = as_type<uint>(_960);
                int _1014 = _702 + 24;
                uint _1016 = uint(int(uint(_1014) >> uint(2)));
                _37[int(_1016)] = as_type<uint>(_982);
                int _1018 = _702 + 28;
                uint _1020 = uint(int(uint(_1018) >> uint(2)));
                _37[int(_1020)] = as_type<uint>(_972);
                int _1022 = _702 + 32;
                uint _1024 = uint(int(uint(_1022) >> uint(2)));
                _37[int(_1024)] = as_type<uint>(_984);
                int _1026 = _702 + 36;
                uint _1028 = uint(int(uint(_1026) >> uint(2)));
                _37[int(_1028)] = as_type<uint>(_986);
                int _1030 = _702 + 40;
                uint _1032 = uint(int(uint(_1030) >> uint(2)));
                _37[int(_1032)] = as_type<uint>(_988);
                int _1034 = _702 + 44;
                uint _1036 = uint(int(uint(_1034) >> uint(2)));
                _37[int(_1036)] = as_type<uint>(_990);
                _836 = !_888;
                _834 = _862;
            } while (_836);
            _776 = _986;
            _788 = _944;
            _804 = _960;
            _818 = _984;
            _784 = _932;
            _800 = _958;
            _808 = _982;
            _778 = _988;
            _792 = _936;
            _812 = _972;
            _796 = _940;
            _780 = _990;
            _1038 = true;
        }
        else
        {
            _776 = 0.0;
            _788 = 0.0;
            _804 = 0.0;
            _818 = 0.0;
            _784 = 0.0;
            _800 = 0.0;
            _808 = 0.0;
            _778 = 0.0;
            _792 = 0.0;
            _812 = 0.0;
            _796 = 0.0;
            _780 = 0.0;
        }
    }
    _1038 = false;
    float _1040 = _776;
    float _1042 = _788;
    float _1044 = _804;
    float _1046 = _818;
    float _1048 = _784;
    float _1050 = _800;
    float _1052 = _808;
    float _1054 = _778;
    float _1056 = _792;
    float _1058 = _812;
    float _1060 = _796;
    float _1062 = _780;
    int _1064 = _726 + 80;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
    int _1070 = int(_1066) & 3;
    float _1072 = (*spvDescriptorSet0.cp_c6)._m0[int(_1068)][_1070];
    int _1074 = int(_1066) + 1;
    uint _1076 = uint(int(uint(_1074) >> uint(2)));
    int _1078 = _1074 & 3;
    float _1080 = (*spvDescriptorSet0.cp_c6)._m0[int(_1076)][_1078];
    int _1082 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1084 = _1082 + _66;
    int _1086 = _726 + 64;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.cp_c6)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.cp_c6)._m0[int(_1098)][_1100];
    int _1104 = _1084 * 48;
    int _1106 = _726 + 88;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.cp_c6)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.cp_c6)._m0[int(_1118)][_1120];
    int _1124 = _726 + 72;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
    int _1130 = int(_1126) & 3;
    float _1132 = (*spvDescriptorSet0.cp_c6)._m0[int(_1128)][_1130];
    int _1134 = int(_1126) + 1;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    int _1138 = _1134 & 3;
    float _1140 = (*spvDescriptorSet0.cp_c6)._m0[int(_1136)][_1138];
    int _1142 = _726 + 96;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    uint _1146 = uint(int(uint(int(_1144)) >> uint(2)));
    int _1148 = int(_1144) & 3;
    float _1150 = (*spvDescriptorSet0.cp_c6)._m0[int(_1146)][_1148];
    int _1152 = int(_1144) + 1;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    int _1156 = _1152 & 3;
    float _1158 = (*spvDescriptorSet0.cp_c6)._m0[int(_1154)][_1156];
    int _1160 = _726 + 104;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
    int _1166 = int(_1162) & 3;
    float _1168 = (*spvDescriptorSet0.cp_c6)._m0[int(_1164)][_1166];
    int _1170 = int(_1162) + 1;
    uint _1172 = uint(int(uint(_1170) >> uint(2)));
    int _1174 = _1170 & 3;
    float _1176 = (*spvDescriptorSet0.cp_c6)._m0[int(_1172)][_1174];
    float _1178 = _1040 * _1072;
    int _1180 = _726 + 32;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    uint _1184 = uint(int(uint(int(_1182)) >> uint(2)));
    int _1186 = int(_1182) & 3;
    float _1188 = (*spvDescriptorSet0.cp_c6)._m0[int(_1184)][_1186];
    int _1190 = int(_1182) + 1;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    int _1194 = _1190 & 3;
    float _1196 = (*spvDescriptorSet0.cp_c6)._m0[int(_1192)][_1194];
    float _1198 = _1042 * _1072;
    float _1200 = _1044 * _1072;
    float _1202 = _1044 * _1080;
    float _1204 = fma(_1046, _1094, _1178);
    int _1206 = _726 + 16;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    uint _1210 = uint(int(uint(int(_1208)) >> uint(2)));
    int _1212 = int(_1208) & 3;
    float _1214 = (*spvDescriptorSet0.cp_c6)._m0[int(_1210)][_1212];
    int _1216 = int(_1208) + 1;
    uint _1218 = uint(int(uint(_1216) >> uint(2)));
    int _1220 = _1216 & 3;
    float _1222 = (*spvDescriptorSet0.cp_c6)._m0[int(_1218)][_1220];
    float _1224 = _1040 * _1080;
    float _1226 = fma(_1048, _1094, _1198);
    float _1228 = fma(_1050, _1094, _1200);
    float _1230 = fma(_1050, _1102, _1202);
    float _1232 = _1042 * _1080;
    float _1234 = fma(_1046, _1102, _1224);
    float _1236 = _1044 * _1114;
    int _1238 = _726 + 48;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    uint _1242 = uint(int(uint(int(_1240)) >> uint(2)));
    int _1244 = int(_1240) & 3;
    float _1246 = (*spvDescriptorSet0.cp_c6)._m0[int(_1242)][_1244];
    int _1248 = int(_1240) + 1;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    int _1252 = _1248 & 3;
    float _1254 = (*spvDescriptorSet0.cp_c6)._m0[int(_1250)][_1252];
    float _1256 = _1042 * _1114;
    float _1258 = _1044 * _1122;
    float _1260 = _1042 * _1122;
    float _1262 = _1040 * _1114;
    float _1264 = _1040 * _1122;
    float _1266 = fma(_1048, _1102, _1232);
    float _1268 = fma(_1050, _1132, _1236);
    int _1270 = _726 + 24;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    float _1288 = fma(_1050, _1140, _1258);
    float _1290 = fma(_1048, _1132, _1256);
    float _1292 = fma(_1048, _1140, _1260);
    float _1294 = fma(_1046, _1132, _1262);
    float _1296 = fma(_1046, _1140, _1264);
    float _1298 = fma(_1052, _1150, _1228);
    int _1300 = _726 + 40;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
    int _1306 = int(_1302) & 3;
    float _1308 = (*spvDescriptorSet0.cp_c6)._m0[int(_1304)][_1306];
    int _1310 = int(_1302) + 1;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    int _1314 = _1310 & 3;
    float _1316 = (*spvDescriptorSet0.cp_c6)._m0[int(_1312)][_1314];
    float _1318 = fma(_1052, _1158, _1230);
    float _1320 = fma(_1054, _1150, _1204);
    float _1322 = fma(_1056, _1150, _1226);
    float _1324 = fma(_1056, _1158, _1266);
    float _1326 = fma(_1054, _1158, _1234);
    float _1328 = fma(_1052, _1168, _1268);
    int _1330 = _726 + 56;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
    float _1348 = fma(_1052, _1176, _1288);
    float _1350 = fma(_1056, _1168, _1290);
    float _1352 = fma(_1056, _1176, _1292);
    float _1354 = fma(_1054, _1176, _1296);
    float _1356 = _1348 + _1058;
    float _1358 = fma(_1054, _1168, _1294);
    float _1360 = _1352 + _1060;
    float _1362 = _1318 * _1196;
    float _1364 = _1328 * _1196;
    float _1366 = _1356 * _1196;
    float _1368 = _1354 + _1062;
    float _1370 = fma(_1324, _1188, _1362);
    float _1372 = _1298 * _1196;
    float _1374 = fma(_1360, _1188, _1366);
    float _1376 = fma(_1350, _1188, _1364);
    float _1378 = _1328 * _1222;
    float _1380 = _1356 * _1222;
    float _1382 = _1318 * _1222;
    float _1384 = _1298 * _1222;
    float _1386 = fma(_1350, _1214, _1378);
    float _1388 = fma(_1360, _1214, _1380);
    float _1390 = fma(_1324, _1214, _1382);
    float _1392 = fma(_1322, _1214, _1384);
    float _1394 = _1328 * _1254;
    float _1396 = _1356 * _1254;
    float _1398 = _1298 * _1254;
    float _1400 = _1318 * _1254;
    float _1402 = fma(_1350, _1246, _1394);
    float _1404 = fma(_1360, _1246, _1396);
    float _1406 = fma(_1322, _1188, _1372);
    float _1408 = fma(_1322, _1246, _1398);
    float _1410 = fma(_1368, _1278, _1388);
    float _1412 = fma(_1324, _1246, _1400);
    float _1414 = fma(_1326, _1278, _1390);
    float _1416 = fma(_1358, _1278, _1386);
    float _1418 = fma(_1320, _1278, _1392);
    float _1420 = _1410 + _1286;
    int _1422 = _1104 + 16;
    float _1424 = fma(_1368, _1308, _1374);
    float _1426 = fma(_1326, _1308, _1370);
    float _1428 = fma(_1320, _1308, _1406);
    float _1430 = fma(_1358, _1308, _1376);
    float _1432 = _1424 + _1316;
    int _1434 = _1104 + 32;
    uint _1436 = uint(int(uint(_1422) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1436)] = as_type<uint>(_1418);
    int _1438 = _1422 + 4;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1440)] = as_type<uint>(_1414);
    int _1442 = _1422 + 8;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1444)] = as_type<uint>(_1416);
    int _1446 = _1422 + 12;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1448)] = as_type<uint>(_1420);
    int _1450 = _1104 + 48;
    float _1452 = fma(_1368, _1338, _1404);
    float _1454 = fma(_1320, _1338, _1408);
    float _1456 = fma(_1326, _1338, _1412);
    float _1458 = fma(_1358, _1338, _1402);
    float _1460 = _1452 + _1346;
    uint _1462 = uint(int(uint(_1434) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1462)] = as_type<uint>(_1428);
    int _1464 = _1434 + 4;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1466)] = as_type<uint>(_1426);
    int _1468 = _1434 + 8;
    uint _1470 = uint(int(uint(_1468) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1470)] = as_type<uint>(_1430);
    int _1472 = _1434 + 12;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1474)] = as_type<uint>(_1432);
    uint _1476 = uint(int(uint(_1450) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1476)] = as_type<uint>(_1454);
    int _1478 = _1450 + 4;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1480)] = as_type<uint>(_1456);
    int _1482 = _1450 + 8;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1484)] = as_type<uint>(_1458);
    int _1486 = _1450 + 12;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1488)] = as_type<uint>(_1460);
}

