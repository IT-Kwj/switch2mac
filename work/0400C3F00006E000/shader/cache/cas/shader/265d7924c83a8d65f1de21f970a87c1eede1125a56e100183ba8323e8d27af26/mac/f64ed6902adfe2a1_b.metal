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
int _56(thread const int& _4289, thread const int& _4290, constant _10& support_buffer)
{
    int _4293 = 1 + _4290;
    float _4295 = support_buffer._m5[_4293].x;
    bool _4297 = _4295 == 1.0;
    if (_4297)
    {
        return _4289;
    }
    float _4299 = float(_4289);
    float _4301 = _4299 * _4295;
    int _4303 = int(_4301);
    return _4303;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _720 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_70)
    {
        return;
    }
    bool _72 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _74 = _66 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _76 = _74 << 4;
    bool _78 = !_72;
    if (!_78)
    {
        uint _81 = uint(int(uint(_76) >> uint(2)));
        uint _83 = uint(int(uint(int(_81)) >> uint(2)));
        int _85 = int(_81) & 3;
        float _87 = (*spvDescriptorSet0.cp_c4)._m0[int(_83)][_85];
        int _89 = as_type<int>(_87) * 48;
        int _91 = 0;
        int _93 = 0;
        int _95 = 0;
        float _97 = 0.0;
        int _99 = 0;
        float _101 = 0.0;
        float _103 = 0.0;
        float _105 = 0.0;
        float _107 = 0.0;
        float _109 = 0.0;
        float _111 = 0.0;
        float _113 = 0.0;
        float _115 = 0.0;
        int _117 = 0;
        float _119 = 0.0;
        float _121 = 0.0;
        float _123 = 0.0;
        float _125 = 0.0;
        float _127 = 0.0;
        float _129 = 0.0;
        bool _131;
        float _682;
        float _684;
        float _686;
        float _688;
        float _690;
        float _692;
        float _694;
        float _696;
        float _698;
        float _700;
        float _702;
        float _704;
        float _706;
        float _708;
        float _710;
        float _712;
        int _714;
        int _716;
        int _718;
        do
        {
            int _133 = _91;
            int _135 = _93;
            int _137 = _95;
            float _139 = _97;
            int _141 = _99;
            float _143 = _101;
            float _145 = _103;
            float _147 = _105;
            float _149 = _107;
            float _151 = _109;
            float _153 = _111;
            float _155 = _113;
            float _157 = _115;
            int _159 = _117;
            float _161 = _119;
            float _163 = _121;
            float _165 = _123;
            float _167 = _125;
            float _169 = _127;
            float _171 = _129;
            int _173 = _89 + 36;
            uint _175 = uint(int(uint(_173) >> uint(2)));
            uint _177 = uint(int(uint(int(_175)) >> uint(2)));
            int _179 = int(_175) & 3;
            float _181 = (*spvDescriptorSet0.cp_c5)._m0[int(_177)][_179];
            int _183 = _133 & 31;
            bool _185 = _183 == 0;
            bool _187 = uint(_183) < 32u;
            int _189 = 32 - _183;
            int _191 = _183 - 32;
            int _193 = 1 << _183;
            uint _195 = uint(int(uint(0) >> uint(_189)));
            int _197 = _193 | int(_195);
            int _199 = _185 ? 1 : _197;
            bool _201 = uint(_191) < 32u;
            int _203 = 0 << _191;
            int _205 = _201 ? _203 : 0;
            float _207 = _187 ? as_type<float>(_199) : as_type<float>(_205);
            int _209 = _89 + 32;
            uint _211 = uint(int(uint(_209) >> uint(2)));
            uint _213 = uint(int(uint(int(_211)) >> uint(2)));
            int _215 = int(_211) & 3;
            float _217 = (*spvDescriptorSet0.cp_c5)._m0[int(_213)][_215];
            int _219 = as_type<int>(_207) & as_type<int>(_181);
            bool _221 = _219 != 0;
            int _223 = as_type<int>(_207) & as_type<int>(_217);
            bool _225 = _223 != 0;
            int _227 = _135;
            float _229 = _139;
            float _231 = _145;
            int _233 = _159;
            float _235 = _169;
            float _237 = _171;
            float _239 = _167;
            float _241 = _165;
            float _243 = _207;
            float _245 = _163;
            float _247 = _181;
            float _249 = _217;
            float _251 = _161;
            if (_221)
            {
                int _253 = _89 + 8;
                uint _255 = uint(int(uint(_253) >> uint(2)));
                uint _257 = uint(int(uint(int(_255)) >> uint(2)));
                int _259 = int(_255) & 3;
                float _261 = (*spvDescriptorSet0.cp_c5)._m0[int(_257)][_259];
                _227 = as_type<int>(_261);
            }
            int _263 = _227;
            if (_221)
            {
                _229 = 1.4012984643248170709237295832899e-45;
            }
            float _265 = _229;
            if (_221)
            {
                _231 = 2.8025969286496341418474591665798e-45;
            }
            float _267 = _231;
            int _269 = _137;
            if (_225)
            {
                uint _271 = uint(int(uint(_89) >> uint(2)));
                uint _273 = uint(int(uint(int(_271)) >> uint(2)));
                int _275 = int(_271) & 3;
                float _277 = (*spvDescriptorSet0.cp_c5)._m0[int(_273)][_275];
                _269 = as_type<int>(_277);
            }
            int _279 = _269;
            if (_225)
            {
                _233 = 1;
            }
            int _281 = _233;
            float _283 = _265;
            float _285 = as_type<float>(_133);
            int _287 = _141;
            float _289 = as_type<float>(_263);
            float _291 = as_type<float>(_281);
            if (_221)
            {
                int _293 = _133;
                int _295 = 0;
                int _297 = _56(_293, _295, (*spvDescriptorSet0.support_buffer));
                int _299 = _263;
                int _301 = 0;
                int _303 = _56(_299, _301, (*spvDescriptorSet0.support_buffer));
                int3 _1992 = int3(_297, _303, as_type<int>(_265));
                float3 _307 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1992.xy), uint(_1992.z), 0).xyz;
                float _309 = _307.x;
                float _311 = _307.y;
                float _313 = _307.z;
                _283 = _309;
                _285 = _311;
                _287 = as_type<int>(_313);
            }
            float _315 = _283;
            float _317 = _285;
            int _319 = _287;
            float _321 = 0.0;
            float _323 = as_type<float>(_133);
            float _325 = _143;
            if (_221)
            {
                int _327 = _133;
                int _329 = 0;
                int _331 = _56(_327, _329, (*spvDescriptorSet0.support_buffer));
                int _333 = _263;
                int _335 = 0;
                int _337 = _56(_333, _335, (*spvDescriptorSet0.support_buffer));
                int3 _2022 = int3(_331, _337, 0);
                float3 _339 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2022.xy), uint(_2022.z), 0).xyz;
                float _341 = _339.x;
                float _343 = _339.y;
                float _345 = _339.z;
                _321 = _341;
                _323 = _343;
                _325 = _345;
            }
            float _347 = _321;
            float _349 = _323;
            float _351 = _325;
            float _353 = _267;
            float _355 = as_type<float>(_133);
            float _357 = _147;
            if (_221)
            {
                int _359 = _133;
                int _361 = 0;
                int _363 = _56(_359, _361, (*spvDescriptorSet0.support_buffer));
                int _365 = _263;
                int _367 = 0;
                int _369 = _56(_365, _367, (*spvDescriptorSet0.support_buffer));
                int3 _2054 = int3(_363, _369, as_type<int>(_267));
                float3 _371 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2054.xy), uint(_2054.z), 0).xyz;
                float _373 = _371.x;
                float _375 = _371.y;
                float _377 = _371.z;
                _353 = _373;
                _355 = _375;
                _357 = _377;
            }
            float _379 = _353;
            float _381 = _355;
            float _383 = _357;
            float _385 = 0.0;
            float _387 = as_type<float>(_133);
            float _389 = _149;
            if (_225)
            {
                int _391 = _133;
                int _393 = 1;
                int _395 = _56(_391, _393, (*spvDescriptorSet0.support_buffer));
                int _397 = _279;
                int _399 = 1;
                int _401 = _56(_397, _399, (*spvDescriptorSet0.support_buffer));
                int3 _2083 = int3(_395, _401, 0);
                float3 _403 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2083.xy), uint(_2083.z), 0).xyz;
                float _405 = _403.x;
                float _407 = _403.y;
                float _409 = _403.z;
                _385 = _405;
                _387 = _407;
                _389 = _409;
            }
            float _411 = _385;
            float _413 = _387;
            float _415 = _389;
            float _417 = _151;
            float _419 = _153;
            float _421 = _155;
            float _423 = _157;
            if (_225)
            {
                int _425 = _133;
                int _427 = 1;
                int _429 = _56(_425, _427, (*spvDescriptorSet0.support_buffer));
                int _431 = _279;
                int _433 = 1;
                int _435 = _56(_431, _433, (*spvDescriptorSet0.support_buffer));
                int3 _2114 = int3(_429, _435, _281);
                float4 _438 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2114.xy), uint(_2114.z), 0).xyzw;
                float _440 = _438.x;
                float _442 = _438.y;
                float _444 = _438.z;
                float _446 = _438.w;
                _417 = _440;
                _419 = _442;
                _421 = _444;
                _423 = _446;
            }
            float _448 = _417;
            float _450 = _419;
            float _452 = _421;
            float _454 = _423;
            if (!_225)
            {
                _235 = 0.0;
                _237 = 0.0;
            }
            float _456 = _235;
            float _458 = _237;
            float _460 = _456;
            float _462 = _458;
            if (!_225)
            {
                _239 = 0.0;
            }
            float _464 = _239;
            float _466 = _464;
            if (!_225)
            {
                _241 = 0.0;
                _243 = 0.0;
            }
            float _468 = _241;
            float _470 = _243;
            float _472 = _468;
            float _474 = _470;
            if (!_225)
            {
                _245 = 0.0;
            }
            float _476 = _245;
            float _478 = _476;
            if (!_225)
            {
                _247 = 0.0;
                _249 = 0.0;
            }
            float _480 = _247;
            float _482 = _249;
            float _484 = _480;
            float _486 = _482;
            if (!_225)
            {
                _289 = 0.0;
                _251 = 0.0;
            }
            float _488 = _289;
            float _490 = _251;
            bool _492 = !_225;
            float _494 = _488;
            float _496 = _490;
            float _498 = _315;
            float _500 = as_type<float>(_319);
            if (!_492)
            {
                int _502 = _133;
                int _504 = 1;
                int _506 = _56(_502, _504, (*spvDescriptorSet0.support_buffer));
                int _508 = _279;
                int _510 = 1;
                int _512 = _56(_508, _510, (*spvDescriptorSet0.support_buffer));
                int3 _2194 = int3(_506, _512, 2);
                float3 _514 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2194.xy), uint(_2194.z), 0).xyz;
                float _516 = _514.x;
                float _518 = _514.y;
                float _520 = _514.z;
                _494 = _516;
                _291 = 2.8025969286496341418474591665798e-45;
                _496 = _518;
                _478 = _520;
                _472 = _448;
                _484 = _452;
                _474 = _450;
                _466 = _415;
                _460 = _411;
                _462 = _413;
                _486 = _454;
            }
            float _522 = _494;
            int _524 = as_type<int>(_291);
            float _526 = _496;
            float _528 = _478;
            float _530 = _472;
            float _532 = _484;
            float _534 = _474;
            float _536 = _466;
            float _538 = _460;
            float _540 = _462;
            float _542 = _486;
            bool _544 = !_221;
            _117 = _524;
            _121 = _528;
            int _546 = as_type<int>(_522);
            float _548 = _526;
            float _550 = _536;
            float _552 = _538;
            float _554 = _540;
            float _556 = _538;
            float _558 = _540;
            float _560 = _536;
            if (!_544)
            {
                int _562 = _89 + 28;
                uint _564 = uint(int(uint(_562) >> uint(2)));
                uint _566 = uint(int(uint(int(_564)) >> uint(2)));
                int _568 = int(_564) & 3;
                float _570 = (*spvDescriptorSet0.cp_c5)._m0[int(_566)][_568];
                int _572 = _89 + 20;
                uint _574 = uint(int(uint(_572) >> uint(2)));
                uint _576 = uint(int(uint(int(_574)) >> uint(2)));
                int _578 = int(_574) & 3;
                float _580 = (*spvDescriptorSet0.cp_c5)._m0[int(_576)][_578];
                float _582 = _315 * _570;
                float _584 = as_type<float>(_319) * _570;
                float _586 = _317 * _570;
                float _588 = _379 * _570;
                float _590 = _381 * _570;
                float _592 = _351 * _570;
                float _594 = _347 * _570;
                float _596 = _349 * _570;
                float _598 = fma(_530, _580, _582);
                float _600 = fma(_532, _580, _584);
                float _602 = fma(_534, _580, _586);
                float _604 = fma(_522, _580, _588);
                float _606 = _598 * 0.15915493667125701904296875;
                float _608 = _600 * 0.15915493667125701904296875;
                float _610 = _602 * 0.15915493667125701904296875;
                float _612 = fma(_526, _580, _590);
                float _614 = _606 * 6.283185482025146484375;
                float _616 = sin(_614);
                float _618 = _383 * _570;
                float _620 = fma(_536, _580, _592);
                float _622 = fma(_538, _580, _594);
                float _624 = fma(_540, _580, _596);
                float _626 = fma(_528, _580, _618);
                float _628 = _606 * 6.283185482025146484375;
                float _630 = cos(_628);
                float _632 = _608 * 6.283185482025146484375;
                float _634 = sin(_632);
                float _636 = _608 * 6.283185482025146484375;
                float _638 = cos(_636);
                float _640 = _610 * 6.283185482025146484375;
                float _642 = sin(_640);
                float _644 = _616 * _634;
                float _646 = _610 * 6.283185482025146484375;
                float _648 = cos(_646);
                float _650 = _630 * _638;
                float _652 = _616 * _638;
                float _654 = _616 * _642;
                float _656 = _634 * _630;
                float _658 = -_656;
                float _660 = fma(_638, _654, _658);
                float _662 = _630 * _648;
                float _664 = _648 * _638;
                float _666 = _634 * _648;
                float _668 = _616 * _648;
                float _670 = fma(_642, _650, _644);
                float _672 = -_652;
                float _674 = fma(_642, _656, _672);
                float _676 = fma(_634, _654, _650);
                float _678 = -_642;
                float _680 = _678 + (-0.0);
                _546 = as_type<int>(_652);
                _498 = _606;
                _500 = _608;
                _682 = _644;
                _684 = _664;
                _686 = _676;
                _688 = _666;
                _690 = _670;
                _692 = _660;
                _548 = _650;
                _694 = _674;
                _550 = _620;
                _552 = _622;
                _554 = _624;
                _556 = _622;
                _696 = _680;
                _698 = _664;
                _700 = _666;
                _558 = _624;
                _702 = _660;
                _704 = _676;
                _706 = _668;
                _560 = _620;
                _708 = _670;
                _710 = _674;
                _712 = _662;
                _714 = as_type<int>(_604);
                _716 = as_type<int>(_612);
                _718 = as_type<int>(_626);
                _720 = true;
            }
            else
            {
                float _722 = _542 * 2.0;
                float _724 = _530 * _530;
                float _726 = _534 * _534;
                float _728 = _530 * 2.0;
                float _730 = _722 * _532;
                float _732 = _722 * _530;
                float _734 = _722 * _534;
                float _736 = fma(_724, -2.0, 1.0);
                float _738 = _534 * 2.0;
                float _740 = _532 * _532;
                float _742 = fma(_726, -2.0, 1.0);
                float _744 = -_730;
                float _746 = fma(_728, _534, _744);
                float _748 = fma(_728, _534, _730);
                float _750 = fma(_728, _532, _734);
                float _752 = -_734;
                float _754 = fma(_728, _532, _752);
                float _756 = -_732;
                float _758 = fma(_738, _532, _756);
                float _760 = fma(_740, -2.0, _742);
                float _762 = fma(_738, _532, _732);
                float _764 = fma(_740, -2.0, _736);
                float _766 = fma(_726, -2.0, _736);
                _682 = _736;
                _684 = _760;
                _686 = _764;
                _688 = _748;
                _690 = _750;
                _692 = _746;
                _694 = _758;
                _696 = _754;
                _698 = _760;
                _700 = _748;
                _702 = _746;
                _704 = _764;
                _706 = _762;
                _708 = _750;
                _710 = _758;
                _712 = _766;
                _714 = as_type<int>(_522);
                _716 = as_type<int>(_526);
                _718 = as_type<int>(_528);
            }
            _720 = false;
            int _768 = _546;
            float _770 = _498;
            int _772 = as_type<int>(_500);
            float _774 = _682;
            float _776 = _684;
            float _778 = _686;
            float _780 = _688;
            float _782 = _690;
            float _784 = _692;
            float _786 = _548;
            float _788 = _694;
            float _790 = _550;
            float _792 = _552;
            float _794 = _554;
            float _796 = _556;
            float _798 = _696;
            float _800 = _698;
            float _802 = _700;
            float _804 = _558;
            float _806 = _702;
            float _808 = _704;
            float _810 = _706;
            float _812 = _560;
            float _814 = _708;
            float _816 = _710;
            float _818 = _712;
            int _820 = _714;
            int _822 = _716;
            int _824 = _718;
            float _826 = _796 * _798;
            int _828 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _830 = _828 + _133;
            float _832 = _796 * _800;
            float _834 = _796 * _802;
            float _836 = _804 * _806;
            float _838 = _804 * _808;
            float _840 = _804 * _810;
            float _842 = _812 * _814;
            int _844 = _830 * 48;
            float _846 = _812 * _816;
            float _848 = _812 * _818;
            int _850 = _133 + 1;
            uint _852 = uint(int(uint(_844) >> uint(2)));
            _37[int(_852)] = as_type<uint>(_832);
            int _854 = _844 + 4;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            _37[int(_856)] = as_type<uint>(_836);
            int _858 = _844 + 8;
            uint _860 = uint(int(uint(_858) >> uint(2)));
            _37[int(_860)] = as_type<uint>(_842);
            int _862 = _844 + 12;
            uint _864 = uint(int(uint(_862) >> uint(2)));
            _37[int(_864)] = uint(_820);
            bool _866 = uint(_850) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _868 = _844 + 16;
            uint _870 = uint(int(uint(_868) >> uint(2)));
            _37[int(_870)] = as_type<uint>(_834);
            int _872 = _844 + 20;
            uint _874 = uint(int(uint(_872) >> uint(2)));
            _37[int(_874)] = as_type<uint>(_838);
            int _876 = _844 + 24;
            uint _878 = uint(int(uint(_876) >> uint(2)));
            _37[int(_878)] = as_type<uint>(_846);
            int _880 = _844 + 28;
            uint _882 = uint(int(uint(_880) >> uint(2)));
            _37[int(_882)] = uint(_822);
            int _884 = _844 + 32;
            uint _886 = uint(int(uint(_884) >> uint(2)));
            _37[int(_886)] = as_type<uint>(_826);
            int _888 = _844 + 36;
            uint _890 = uint(int(uint(_888) >> uint(2)));
            _37[int(_890)] = as_type<uint>(_840);
            int _892 = _844 + 40;
            uint _894 = uint(int(uint(_892) >> uint(2)));
            _37[int(_894)] = as_type<uint>(_848);
            int _896 = _844 + 44;
            uint _898 = uint(int(uint(_896) >> uint(2)));
            _37[int(_898)] = uint(_824);
            _131 = !_866;
            _91 = _850;
            _93 = _768;
            _95 = as_type<int>(_836);
            _97 = _770;
            _99 = _772;
            _101 = _774;
            _103 = _848;
            _105 = _832;
            _107 = _776;
            _109 = _778;
            _111 = _780;
            _113 = _782;
            _115 = _784;
            _119 = _786;
            _123 = _788;
            _125 = _790;
            _127 = _792;
            _129 = _794;
        } while (_131);
    }
    bool _900 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _902 = !_900;
    if (!_902)
    {
        int _904 = 1;
        bool _906;
        do
        {
            int _908 = _904;
            int _910 = _908 * 112;
            int _912 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _914 = _912 + _908;
            int _916 = _908 + 1;
            uint _918 = uint(int(uint(_910) >> uint(2)));
            uint _920 = uint(int(uint(int(_918)) >> uint(2)));
            int _922 = int(_918) & 3;
            float _924 = (*spvDescriptorSet0.cp_c6)._m0[int(_920)][_922];
            int _926 = _914 * 48;
            bool _928 = uint(_916) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _930 = _926 + 16;
            uint _932 = uint(int(uint(_930) >> uint(2)));
            float _934 = as_type<float>(_37[int(_932)]);
            int _936 = _926 + 20;
            uint _938 = uint(int(uint(_936) >> uint(2)));
            float _940 = as_type<float>(_37[int(_938)]);
            int _942 = _926 + 24;
            uint _944 = uint(int(uint(_942) >> uint(2)));
            float _946 = as_type<float>(_37[int(_944)]);
            int _948 = _926 + 28;
            uint _950 = uint(int(uint(_948) >> uint(2)));
            float _952 = as_type<float>(_37[int(_950)]);
            int _954 = _926 + 32;
            uint _956 = uint(int(uint(_954) >> uint(2)));
            float _958 = as_type<float>(_37[int(_956)]);
            int _960 = _926 + 36;
            uint _962 = uint(int(uint(_960) >> uint(2)));
            float _964 = as_type<float>(_37[int(_962)]);
            int _966 = _926 + 40;
            uint _968 = uint(int(uint(_966) >> uint(2)));
            float _970 = as_type<float>(_37[int(_968)]);
            int _972 = _926 + 44;
            uint _974 = uint(int(uint(_972) >> uint(2)));
            float _976 = as_type<float>(_37[int(_974)]);
            int _978 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _980 = _978 + as_type<int>(_924);
            int _982 = _980 * 48;
            uint _984 = uint(int(uint(_926) >> uint(2)));
            float _986 = as_type<float>(_37[int(_984)]);
            int _988 = _926 + 4;
            uint _990 = uint(int(uint(_988) >> uint(2)));
            float _992 = as_type<float>(_37[int(_990)]);
            int _994 = _926 + 8;
            uint _996 = uint(int(uint(_994) >> uint(2)));
            float _998 = as_type<float>(_37[int(_996)]);
            int _1000 = _926 + 12;
            uint _1002 = uint(int(uint(_1000) >> uint(2)));
            float _1004 = as_type<float>(_37[int(_1002)]);
            uint _1006 = uint(int(uint(_982) >> uint(2)));
            float _1008 = as_type<float>(_37[int(_1006)]);
            int _1010 = _982 + 4;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            float _1014 = as_type<float>(_37[int(_1012)]);
            int _1016 = _982 + 8;
            uint _1018 = uint(int(uint(_1016) >> uint(2)));
            float _1020 = as_type<float>(_37[int(_1018)]);
            int _1022 = _982 + 12;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            float _1026 = as_type<float>(_37[int(_1024)]);
            int _1028 = _982 + 16;
            uint _1030 = uint(int(uint(_1028) >> uint(2)));
            float _1032 = as_type<float>(_37[int(_1030)]);
            int _1034 = _982 + 20;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            float _1038 = as_type<float>(_37[int(_1036)]);
            int _1040 = _982 + 24;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            float _1044 = as_type<float>(_37[int(_1042)]);
            int _1046 = _982 + 28;
            uint _1048 = uint(int(uint(_1046) >> uint(2)));
            float _1050 = as_type<float>(_37[int(_1048)]);
            int _1052 = _982 + 32;
            uint _1054 = uint(int(uint(_1052) >> uint(2)));
            float _1056 = as_type<float>(_37[int(_1054)]);
            int _1058 = _982 + 36;
            uint _1060 = uint(int(uint(_1058) >> uint(2)));
            float _1062 = as_type<float>(_37[int(_1060)]);
            int _1064 = _982 + 40;
            uint _1066 = uint(int(uint(_1064) >> uint(2)));
            float _1068 = as_type<float>(_37[int(_1066)]);
            int _1070 = _982 + 44;
            uint _1072 = uint(int(uint(_1070) >> uint(2)));
            float _1074 = as_type<float>(_37[int(_1072)]);
            float _1076 = _952 * _1014;
            float _1078 = _940 * _1014;
            float _1080 = _934 * _1014;
            float _1082 = _946 * _1014;
            float _1084 = fma(_1004, _1008, _1076);
            float _1086 = fma(_992, _1008, _1078);
            float _1088 = fma(_986, _1008, _1080);
            float _1090 = fma(_998, _1008, _1082);
            float _1092 = fma(_976, _1020, _1084);
            float _1094 = fma(_964, _1020, _1086);
            float _1096 = _940 * _1038;
            float _1098 = _934 * _1038;
            float _1100 = _1026 + _1092;
            float _1102 = _952 * _1038;
            float _1104 = _946 * _1038;
            float _1106 = fma(_992, _1032, _1096);
            float _1108 = fma(_958, _1020, _1088);
            float _1110 = fma(_1004, _1032, _1102);
            float _1112 = fma(_998, _1032, _1104);
            float _1114 = fma(_964, _1044, _1106);
            float _1116 = _952 * _1062;
            float _1118 = _934 * _1062;
            float _1120 = _940 * _1062;
            float _1122 = _946 * _1062;
            float _1124 = fma(_1004, _1056, _1116);
            float _1126 = fma(_986, _1032, _1098);
            float _1128 = fma(_976, _1044, _1110);
            float _1130 = fma(_986, _1056, _1118);
            float _1132 = fma(_992, _1056, _1120);
            float _1134 = fma(_998, _1056, _1122);
            float _1136 = fma(_976, _1068, _1124);
            float _1138 = fma(_958, _1044, _1126);
            float _1140 = fma(_970, _1020, _1090);
            float _1142 = fma(_970, _1044, _1112);
            float _1144 = _1050 + _1128;
            float _1146 = fma(_958, _1068, _1130);
            float _1148 = fma(_964, _1068, _1132);
            float _1150 = fma(_970, _1068, _1134);
            float _1152 = _1074 + _1136;
            uint _1154 = uint(int(uint(_926) >> uint(2)));
            _37[int(_1154)] = as_type<uint>(_1108);
            int _1156 = _926 + 4;
            uint _1158 = uint(int(uint(_1156) >> uint(2)));
            _37[int(_1158)] = as_type<uint>(_1094);
            int _1160 = _926 + 8;
            uint _1162 = uint(int(uint(_1160) >> uint(2)));
            _37[int(_1162)] = as_type<uint>(_1140);
            int _1164 = _926 + 12;
            uint _1166 = uint(int(uint(_1164) >> uint(2)));
            _37[int(_1166)] = as_type<uint>(_1100);
            int _1168 = _926 + 16;
            uint _1170 = uint(int(uint(_1168) >> uint(2)));
            _37[int(_1170)] = as_type<uint>(_1138);
            int _1172 = _926 + 20;
            uint _1174 = uint(int(uint(_1172) >> uint(2)));
            _37[int(_1174)] = as_type<uint>(_1114);
            int _1176 = _926 + 24;
            uint _1178 = uint(int(uint(_1176) >> uint(2)));
            _37[int(_1178)] = as_type<uint>(_1142);
            int _1180 = _926 + 28;
            uint _1182 = uint(int(uint(_1180) >> uint(2)));
            _37[int(_1182)] = as_type<uint>(_1144);
            int _1184 = _926 + 32;
            uint _1186 = uint(int(uint(_1184) >> uint(2)));
            _37[int(_1186)] = as_type<uint>(_1146);
            int _1188 = _926 + 36;
            uint _1190 = uint(int(uint(_1188) >> uint(2)));
            _37[int(_1190)] = as_type<uint>(_1148);
            int _1192 = _926 + 40;
            uint _1194 = uint(int(uint(_1192) >> uint(2)));
            _37[int(_1194)] = as_type<uint>(_1150);
            int _1196 = _926 + 44;
            uint _1198 = uint(int(uint(_1196) >> uint(2)));
            _37[int(_1198)] = as_type<uint>(_1152);
            _906 = !_928;
            _904 = _916;
        } while (_906);
    }
    if (!_72)
    {
        return;
    }
    int _1200 = 0;
    bool _1202;
    do
    {
        int _1204 = _1200;
        int _1206 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1208 = _1206 + _1204;
        int _1210 = _1204 * 112;
        int _1212 = _1208 * 48;
        int _1214 = _1210 + 80;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.cp_c6)._m0[int(_1218)][_1220];
        int _1224 = int(_1216) + 1;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        int _1228 = _1224 & 3;
        float _1230 = (*spvDescriptorSet0.cp_c6)._m0[int(_1226)][_1228];
        uint _1232 = uint(int(uint(_1212) >> uint(2)));
        float _1234 = as_type<float>(_37[int(_1232)]);
        int _1236 = _1212 + 4;
        uint _1238 = uint(int(uint(_1236) >> uint(2)));
        float _1240 = as_type<float>(_37[int(_1238)]);
        int _1242 = _1212 + 8;
        uint _1244 = uint(int(uint(_1242) >> uint(2)));
        float _1246 = as_type<float>(_37[int(_1244)]);
        int _1248 = _1212 + 12;
        uint _1250 = uint(int(uint(_1248) >> uint(2)));
        float _1252 = as_type<float>(_37[int(_1250)]);
        int _1254 = _1212 + 16;
        uint _1256 = uint(int(uint(_1254) >> uint(2)));
        float _1258 = as_type<float>(_37[int(_1256)]);
        int _1260 = _1212 + 20;
        uint _1262 = uint(int(uint(_1260) >> uint(2)));
        float _1264 = as_type<float>(_37[int(_1262)]);
        int _1266 = _1212 + 24;
        uint _1268 = uint(int(uint(_1266) >> uint(2)));
        float _1270 = as_type<float>(_37[int(_1268)]);
        int _1272 = _1212 + 28;
        uint _1274 = uint(int(uint(_1272) >> uint(2)));
        float _1276 = as_type<float>(_37[int(_1274)]);
        int _1278 = _1210 + 88;
        uint _1280 = uint(int(uint(_1278) >> uint(2)));
        uint _1282 = uint(int(uint(int(_1280)) >> uint(2)));
        int _1284 = int(_1280) & 3;
        float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
        int _1288 = int(_1280) + 1;
        uint _1290 = uint(int(uint(_1288) >> uint(2)));
        int _1292 = _1288 & 3;
        float _1294 = (*spvDescriptorSet0.cp_c6)._m0[int(_1290)][_1292];
        int _1296 = _1212 + 32;
        uint _1298 = uint(int(uint(_1296) >> uint(2)));
        float _1300 = as_type<float>(_37[int(_1298)]);
        int _1302 = _1212 + 36;
        uint _1304 = uint(int(uint(_1302) >> uint(2)));
        float _1306 = as_type<float>(_37[int(_1304)]);
        int _1308 = _1212 + 40;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        float _1312 = as_type<float>(_37[int(_1310)]);
        int _1314 = _1212 + 44;
        uint _1316 = uint(int(uint(_1314) >> uint(2)));
        float _1318 = as_type<float>(_37[int(_1316)]);
        int _1320 = _1210 + 64;
        uint _1322 = uint(int(uint(_1320) >> uint(2)));
        uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
        int _1326 = int(_1322) & 3;
        float _1328 = (*spvDescriptorSet0.cp_c6)._m0[int(_1324)][_1326];
        int _1330 = int(_1322) + 1;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        int _1334 = _1330 & 3;
        float _1336 = (*spvDescriptorSet0.cp_c6)._m0[int(_1332)][_1334];
        int _1338 = _1210 + 72;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        uint _1342 = uint(int(uint(int(_1340)) >> uint(2)));
        int _1344 = int(_1340) & 3;
        float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
        int _1348 = int(_1340) + 1;
        uint _1350 = uint(int(uint(_1348) >> uint(2)));
        int _1352 = _1348 & 3;
        float _1354 = (*spvDescriptorSet0.cp_c6)._m0[int(_1350)][_1352];
        int _1356 = _1210 + 104;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
        int _1362 = int(_1358) & 3;
        float _1364 = (*spvDescriptorSet0.cp_c6)._m0[int(_1360)][_1362];
        int _1366 = int(_1358) + 1;
        uint _1368 = uint(int(uint(_1366) >> uint(2)));
        int _1370 = _1366 & 3;
        float _1372 = (*spvDescriptorSet0.cp_c6)._m0[int(_1368)][_1370];
        int _1374 = _1210 + 96;
        uint _1376 = uint(int(uint(_1374) >> uint(2)));
        uint _1378 = uint(int(uint(int(_1376)) >> uint(2)));
        int _1380 = int(_1376) & 3;
        float _1382 = (*spvDescriptorSet0.cp_c6)._m0[int(_1378)][_1380];
        int _1384 = int(_1376) + 1;
        uint _1386 = uint(int(uint(_1384) >> uint(2)));
        int _1388 = _1384 & 3;
        float _1390 = (*spvDescriptorSet0.cp_c6)._m0[int(_1386)][_1388];
        float _1392 = _1240 * _1222;
        float _1394 = _1240 * _1230;
        float _1396 = _1240 * _1286;
        float _1398 = _1240 * _1294;
        float _1400 = fma(_1234, _1328, _1392);
        float _1402 = fma(_1234, _1336, _1394);
        float _1404 = fma(_1234, _1346, _1396);
        float _1406 = fma(_1234, _1354, _1398);
        float _1408 = _1264 * _1222;
        float _1410 = _1264 * _1230;
        float _1412 = _1264 * _1286;
        float _1414 = _1264 * _1294;
        float _1416 = _1306 * _1222;
        float _1418 = fma(_1258, _1328, _1408);
        float _1420 = fma(_1258, _1336, _1410);
        float _1422 = fma(_1258, _1346, _1412);
        uint _1424 = uint(int(uint(_76) >> uint(2)));
        uint _1426 = uint(int(uint(int(_1424)) >> uint(2)));
        int _1428 = int(_1424) & 3;
        float _1430 = (*spvDescriptorSet0.cp_c4)._m0[int(_1426)][_1428];
        float _1432 = fma(_1258, _1354, _1414);
        float _1434 = _1306 * _1230;
        float _1436 = _1306 * _1286;
        float _1438 = _1306 * _1294;
        float _1440 = fma(_1300, _1328, _1416);
        float _1442 = fma(_1300, _1336, _1434);
        float _1444 = fma(_1300, _1346, _1436);
        int _1446 = _1210 + 16;
        uint _1448 = uint(int(uint(_1446) >> uint(2)));
        uint _1450 = uint(int(uint(int(_1448)) >> uint(2)));
        int _1452 = int(_1448) & 3;
        float _1454 = (*spvDescriptorSet0.cp_c6)._m0[int(_1450)][_1452];
        int _1456 = int(_1448) + 1;
        uint _1458 = uint(int(uint(_1456) >> uint(2)));
        int _1460 = _1456 & 3;
        float _1462 = (*spvDescriptorSet0.cp_c6)._m0[int(_1458)][_1460];
        float _1464 = fma(_1300, _1354, _1438);
        float _1466 = fma(_1270, _1372, _1432);
        float _1468 = fma(_1246, _1382, _1400);
        float _1470 = fma(_1246, _1390, _1402);
        float _1472 = fma(_1246, _1364, _1404);
        float _1474 = fma(_1246, _1372, _1406);
        float _1476 = fma(_1270, _1382, _1418);
        int _1478 = _1210 + 24;
        uint _1480 = uint(int(uint(_1478) >> uint(2)));
        uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
        int _1484 = int(_1480) & 3;
        float _1486 = (*spvDescriptorSet0.cp_c6)._m0[int(_1482)][_1484];
        int _1488 = int(_1480) + 1;
        uint _1490 = uint(int(uint(_1488) >> uint(2)));
        int _1492 = _1488 & 3;
        float _1494 = (*spvDescriptorSet0.cp_c6)._m0[int(_1490)][_1492];
        float _1496 = fma(_1270, _1390, _1420);
        float _1498 = fma(_1270, _1364, _1422);
        float _1500 = fma(_1312, _1382, _1440);
        float _1502 = fma(_1312, _1390, _1442);
        float _1504 = fma(_1312, _1372, _1464);
        float _1506 = fma(_1312, _1364, _1444);
        float _1508 = _1276 + _1466;
        int _1510 = _1210 + 32;
        uint _1512 = uint(int(uint(_1510) >> uint(2)));
        uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
        int _1516 = int(_1512) & 3;
        float _1518 = (*spvDescriptorSet0.cp_c6)._m0[int(_1514)][_1516];
        int _1520 = int(_1512) + 1;
        uint _1522 = uint(int(uint(_1520) >> uint(2)));
        int _1524 = _1520 & 3;
        float _1526 = (*spvDescriptorSet0.cp_c6)._m0[int(_1522)][_1524];
        float _1528 = _1318 + _1504;
        float _1530 = _1252 + _1474;
        int _1532 = _1210 + 48;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
        int _1538 = int(_1534) & 3;
        float _1540 = (*spvDescriptorSet0.cp_c6)._m0[int(_1536)][_1538];
        int _1542 = int(_1534) + 1;
        uint _1544 = uint(int(uint(_1542) >> uint(2)));
        int _1546 = _1542 & 3;
        float _1548 = (*spvDescriptorSet0.cp_c6)._m0[int(_1544)][_1546];
        float _1550 = _1476 * _1462;
        float _1552 = _1496 * _1462;
        float _1554 = _1508 * _1462;
        float _1556 = _1498 * _1462;
        float _1558 = fma(_1468, _1454, _1550);
        float _1560 = fma(_1470, _1454, _1552);
        float _1562 = fma(_1530, _1454, _1554);
        float _1564 = fma(_1472, _1454, _1556);
        int _1566 = _1210 + 40;
        uint _1568 = uint(int(uint(_1566) >> uint(2)));
        uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
        int _1572 = int(_1568) & 3;
        float _1574 = (*spvDescriptorSet0.cp_c6)._m0[int(_1570)][_1572];
        int _1576 = int(_1568) + 1;
        uint _1578 = uint(int(uint(_1576) >> uint(2)));
        int _1580 = _1576 & 3;
        float _1582 = (*spvDescriptorSet0.cp_c6)._m0[int(_1578)][_1580];
        float _1584 = fma(_1500, _1486, _1558);
        float _1586 = fma(_1528, _1486, _1562);
        float _1588 = fma(_1502, _1486, _1560);
        float _1590 = fma(_1506, _1486, _1564);
        float _1592 = _1586 + _1494;
        float _1594 = _1508 * _1526;
        int _1596 = _1210 + 56;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
        int _1602 = int(_1598) & 3;
        float _1604 = (*spvDescriptorSet0.cp_c6)._m0[int(_1600)][_1602];
        int _1606 = int(_1598) + 1;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        int _1610 = _1606 & 3;
        float _1612 = (*spvDescriptorSet0.cp_c6)._m0[int(_1608)][_1610];
        float _1614 = _1476 * _1526;
        float _1616 = _1496 * _1526;
        int _1618 = as_type<int>(_1430) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1620 = _1618 + _1204;
        int _1622 = _1204 + 1;
        float _1624 = _1498 * _1526;
        float _1626 = fma(_1530, _1518, _1594);
        float _1628 = _1508 * _1548;
        float _1630 = _1476 * _1548;
        float _1632 = _1496 * _1548;
        float _1634 = fma(_1470, _1518, _1616);
        float _1636 = _1498 * _1548;
        float _1638 = fma(_1530, _1540, _1628);
        float _1640 = fma(_1468, _1540, _1630);
        int _1642 = _1620 * 48;
        bool _1644 = uint(_1622) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1646 = fma(_1470, _1540, _1632);
        float _1648 = fma(_1468, _1518, _1614);
        float _1650 = fma(_1472, _1518, _1624);
        float _1652 = fma(_1528, _1574, _1626);
        float _1654 = fma(_1472, _1540, _1636);
        float _1656 = fma(_1502, _1574, _1634);
        float _1658 = fma(_1500, _1574, _1648);
        float _1660 = fma(_1506, _1574, _1650);
        float _1662 = fma(_1528, _1604, _1638);
        float _1664 = fma(_1500, _1604, _1640);
        float _1666 = fma(_1502, _1604, _1646);
        int _1668 = _1642 + 16;
        float _1670 = _1652 + _1582;
        int _1672 = _1642 + 32;
        float _1674 = fma(_1506, _1604, _1654);
        float _1676 = _1662 + _1612;
        int _1678 = _1642 + 48;
        uint _1680 = uint(int(uint(_1668) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1680)] = as_type<uint>(_1584);
        int _1682 = _1668 + 4;
        uint _1684 = uint(int(uint(_1682) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1684)] = as_type<uint>(_1588);
        int _1686 = _1668 + 8;
        uint _1688 = uint(int(uint(_1686) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1688)] = as_type<uint>(_1590);
        int _1690 = _1668 + 12;
        uint _1692 = uint(int(uint(_1690) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1692)] = as_type<uint>(_1592);
        uint _1694 = uint(int(uint(_1672) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1694)] = as_type<uint>(_1658);
        int _1696 = _1672 + 4;
        uint _1698 = uint(int(uint(_1696) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1698)] = as_type<uint>(_1656);
        int _1700 = _1672 + 8;
        uint _1702 = uint(int(uint(_1700) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1702)] = as_type<uint>(_1660);
        int _1704 = _1672 + 12;
        uint _1706 = uint(int(uint(_1704) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1706)] = as_type<uint>(_1670);
        uint _1708 = uint(int(uint(_1678) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1708)] = as_type<uint>(_1664);
        int _1710 = _1678 + 4;
        uint _1712 = uint(int(uint(_1710) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1712)] = as_type<uint>(_1666);
        int _1714 = _1678 + 8;
        uint _1716 = uint(int(uint(_1714) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1716)] = as_type<uint>(_1674);
        int _1718 = _1678 + 12;
        uint _1720 = uint(int(uint(_1718) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1720)] = as_type<uint>(_1676);
        _1202 = !_1644;
        _1200 = _1622;
    } while (_1202);
}

