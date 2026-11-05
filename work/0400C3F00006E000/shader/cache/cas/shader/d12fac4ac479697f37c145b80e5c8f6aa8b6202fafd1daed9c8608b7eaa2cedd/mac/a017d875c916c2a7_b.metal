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
int _56(thread const int& _4611, thread const int& _4612, constant _10& support_buffer)
{
    int _4615 = 1 + _4612;
    float _4617 = support_buffer._m5[_4615].x;
    bool _4619 = _4617 == 1.0;
    if (_4619)
    {
        return _4611;
    }
    float _4621 = float(_4611);
    float _4623 = _4621 * _4617;
    int _4625 = int(_4623);
    return _4625;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _854 = false;
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
        float _95 = 0.0;
        float _97 = 0.0;
        float _99 = 0.0;
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
        int _125 = 0;
        float _127 = 0.0;
        float _129 = 0.0;
        float _131 = 0.0;
        float _133 = 0.0;
        bool _135;
        float _808;
        float _810;
        float _812;
        float _814;
        float _816;
        float _818;
        float _820;
        float _822;
        float _824;
        float _826;
        float _828;
        float _830;
        float _832;
        float _834;
        float _836;
        float _838;
        float _840;
        float _842;
        float _844;
        float _846;
        int _848;
        int _850;
        int _852;
        do
        {
            int _137 = _91;
            int _139 = _93;
            float _141 = _95;
            float _143 = _97;
            float _145 = _99;
            float _147 = _101;
            float _149 = _103;
            float _151 = _105;
            float _153 = _107;
            float _155 = _109;
            float _157 = _111;
            float _159 = _113;
            float _161 = _115;
            int _163 = _117;
            float _165 = _119;
            float _167 = _121;
            float _169 = _123;
            int _171 = _125;
            float _173 = _127;
            float _175 = _129;
            float _177 = _131;
            float _179 = _133;
            int _181 = _89 + 36;
            uint _183 = uint(int(uint(_181) >> uint(2)));
            uint _185 = uint(int(uint(int(_183)) >> uint(2)));
            int _187 = int(_183) & 3;
            float _189 = (*spvDescriptorSet0.cp_c5)._m0[int(_185)][_187];
            int _191 = _137 & 31;
            bool _193 = _191 == 0;
            bool _195 = uint(_191) < 32u;
            int _197 = 32 - _191;
            int _199 = _191 - 32;
            int _201 = 1 << _191;
            uint _203 = uint(int(uint(0) >> uint(_197)));
            int _205 = _201 | int(_203);
            int _207 = _193 ? 1 : _205;
            bool _209 = uint(_199) < 32u;
            int _211 = 0 << _199;
            int _213 = _209 ? _211 : 0;
            float _215 = _195 ? as_type<float>(_207) : as_type<float>(_213);
            int _217 = _89 + 32;
            uint _219 = uint(int(uint(_217) >> uint(2)));
            uint _221 = uint(int(uint(int(_219)) >> uint(2)));
            int _223 = int(_219) & 3;
            float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
            int _227 = as_type<int>(_215) & as_type<int>(_189);
            bool _229 = _227 != 0;
            int _231 = as_type<int>(_215) & as_type<int>(_225);
            bool _233 = _231 != 0;
            int _235 = as_type<int>(_189);
            float _237 = _141;
            float _239 = _147;
            float _241 = _225;
            float _243 = _173;
            float _245 = _177;
            float _247 = _161;
            float _249 = _175;
            float _251 = _165;
            float _253 = _169;
            float _255 = _167;
            float _257 = _179;
            float _259 = _215;
            int _261 = _163;
            int _263 = _171;
            if (_229)
            {
                int _265 = _89 + 8;
                uint _267 = uint(int(uint(_265) >> uint(2)));
                uint _269 = uint(int(uint(int(_267)) >> uint(2)));
                int _271 = int(_267) & 3;
                float _273 = (*spvDescriptorSet0.cp_c5)._m0[int(_269)][_271];
                _235 = as_type<int>(_273);
            }
            int _275 = _235;
            if (_229)
            {
                _237 = 1.4012984643248170709237295832899e-45;
            }
            float _277 = _237;
            if (_229)
            {
                _239 = 2.8025969286496341418474591665798e-45;
            }
            float _279 = _239;
            int _281 = _139;
            if (_233)
            {
                uint _283 = uint(int(uint(_89) >> uint(2)));
                uint _285 = uint(int(uint(int(_283)) >> uint(2)));
                int _287 = int(_283) & 3;
                float _289 = (*spvDescriptorSet0.cp_c5)._m0[int(_285)][_287];
                _281 = as_type<int>(_289);
            }
            int _291 = _281;
            if (_233)
            {
                _241 = 1.4012984643248170709237295832899e-45;
            }
            float _293 = _241;
            float _295 = _277;
            float _297 = as_type<float>(_137);
            float _299 = _143;
            float _301 = as_type<float>(_275);
            if (_229)
            {
                int _303 = _137;
                int _305 = 0;
                int _307 = _56(_303, _305, (*spvDescriptorSet0.support_buffer));
                int _309 = _275;
                int _311 = 0;
                int _313 = _56(_309, _311, (*spvDescriptorSet0.support_buffer));
                int3 _2133 = int3(_307, _313, as_type<int>(_277));
                float3 _317 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2133.xy), uint(_2133.z), 0).xyz;
                float _319 = _317.x;
                float _321 = _317.y;
                float _323 = _317.z;
                _295 = _319;
                _297 = _321;
                _299 = _323;
            }
            float _325 = _295;
            float _327 = _297;
            float _329 = _299;
            float _331 = 0.0;
            float _333 = as_type<float>(_137);
            float _335 = _145;
            if (_229)
            {
                int _337 = _137;
                int _339 = 0;
                int _341 = _56(_337, _339, (*spvDescriptorSet0.support_buffer));
                int _343 = _275;
                int _345 = 0;
                int _347 = _56(_343, _345, (*spvDescriptorSet0.support_buffer));
                int3 _2162 = int3(_341, _347, 0);
                float3 _349 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2162.xy), uint(_2162.z), 0).xyz;
                float _351 = _349.x;
                float _353 = _349.y;
                float _355 = _349.z;
                _331 = _351;
                _333 = _353;
                _335 = _355;
            }
            float _357 = _331;
            float _359 = _333;
            float _361 = _335;
            float _363 = _279;
            float _365 = as_type<float>(_137);
            float _367 = _149;
            if (_229)
            {
                int _369 = _137;
                int _371 = 0;
                int _373 = _56(_369, _371, (*spvDescriptorSet0.support_buffer));
                int _375 = _275;
                int _377 = 0;
                int _379 = _56(_375, _377, (*spvDescriptorSet0.support_buffer));
                int3 _2194 = int3(_373, _379, as_type<int>(_279));
                float3 _381 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2194.xy), uint(_2194.z), 0).xyz;
                float _383 = _381.x;
                float _385 = _381.y;
                float _387 = _381.z;
                _363 = _383;
                _365 = _385;
                _367 = _387;
            }
            float _389 = _363;
            float _391 = _365;
            float _393 = _367;
            float _395 = 0.0;
            float _397 = as_type<float>(_137);
            float _399 = _151;
            if (_233)
            {
                int _401 = _137;
                int _403 = 1;
                int _405 = _56(_401, _403, (*spvDescriptorSet0.support_buffer));
                int _407 = _291;
                int _409 = 1;
                int _411 = _56(_407, _409, (*spvDescriptorSet0.support_buffer));
                int3 _2223 = int3(_405, _411, 0);
                float3 _413 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2223.xy), uint(_2223.z), 0).xyz;
                float _415 = _413.x;
                float _417 = _413.y;
                float _419 = _413.z;
                _395 = _415;
                _397 = _417;
                _399 = _419;
            }
            float _421 = _395;
            float _423 = _397;
            float _425 = _399;
            float _427 = _153;
            float _429 = _155;
            float _431 = _157;
            float _433 = _159;
            if (_233)
            {
                int _435 = _137;
                int _437 = 1;
                int _439 = _56(_435, _437, (*spvDescriptorSet0.support_buffer));
                int _441 = _291;
                int _443 = 1;
                int _445 = _56(_441, _443, (*spvDescriptorSet0.support_buffer));
                int3 _2255 = int3(_439, _445, as_type<int>(_293));
                float4 _448 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2255.xy), uint(_2255.z), 0).xyzw;
                float _450 = _448.x;
                float _452 = _448.y;
                float _454 = _448.z;
                float _456 = _448.w;
                _427 = _450;
                _429 = _452;
                _431 = _454;
                _433 = _456;
            }
            float _458 = _427;
            float _460 = _429;
            float _462 = _431;
            float _464 = _433;
            if (!_233)
            {
                _243 = 0.0;
                _245 = 0.0;
            }
            float _466 = _243;
            float _468 = _245;
            float _470 = _466;
            float _472 = _468;
            if (!_233)
            {
                _247 = 0.0;
                _249 = 0.0;
            }
            float _474 = _247;
            float _476 = _249;
            float _478 = _474;
            float _480 = _476;
            if (!_233)
            {
                _251 = 0.0;
                _253 = 0.0;
            }
            float _482 = _251;
            float _484 = _253;
            float _486 = _482;
            float _488 = _484;
            if (!_233)
            {
                _255 = 0.0;
                _257 = 0.0;
            }
            float _490 = _255;
            float _492 = _257;
            float _494 = _490;
            float _496 = _492;
            if (!_233)
            {
                _301 = 0.0;
                _259 = 0.0;
            }
            float _498 = _301;
            float _500 = _259;
            bool _502 = !_233;
            _101 = _389;
            float _504 = _498;
            float _506 = _500;
            if (!_502)
            {
                int _508 = _137;
                int _510 = 1;
                int _512 = _56(_508, _510, (*spvDescriptorSet0.support_buffer));
                int _514 = _291;
                int _516 = 1;
                int _518 = _56(_514, _516, (*spvDescriptorSet0.support_buffer));
                int3 _2329 = int3(_512, _518, 2);
                float3 _520 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2329.xy), uint(_2329.z), 0).xyz;
                float _522 = _520.x;
                float _524 = _520.y;
                float _526 = _520.z;
                _478 = _526;
                _486 = _458;
                _494 = _460;
                _488 = _462;
                _470 = _425;
                _480 = _423;
                _504 = _522;
                _506 = _524;
                _472 = _421;
                _496 = _464;
            }
            float _528 = _478;
            float _530 = _486;
            float _532 = _494;
            float _534 = _488;
            float _536 = _470;
            float _538 = _480;
            float _540 = _504;
            float _542 = _506;
            float _544 = _472;
            float _546 = _496;
            bool _548 = !_229;
            _115 = _528;
            float _550 = _536;
            float _552 = _538;
            float _554 = _544;
            float _556 = _544;
            float _558 = _538;
            float _560 = _536;
            if (!_548)
            {
                int _562 = _89 + 20;
                uint _564 = uint(int(uint(_562) >> uint(2)));
                uint _566 = uint(int(uint(int(_564)) >> uint(2)));
                int _568 = int(_564) & 3;
                float _570 = (*spvDescriptorSet0.cp_c5)._m0[int(_566)][_568];
                float _572 = _530 * 0.15915493667125701904296875;
                float _574 = _532 * 0.15915493667125701904296875;
                float _576 = _534 * 0.15915493667125701904296875;
                float _578 = _327 * 0.15915493667125701904296875;
                float _580 = _572 * 6.283185482025146484375;
                float _582 = cos(_580);
                float _584 = _329 * 0.15915493667125701904296875;
                float _586 = _325 * 0.15915493667125701904296875;
                int _588 = _89 + 28;
                uint _590 = uint(int(uint(_588) >> uint(2)));
                uint _592 = uint(int(uint(int(_590)) >> uint(2)));
                int _594 = int(_590) & 3;
                float _596 = (*spvDescriptorSet0.cp_c5)._m0[int(_592)][_594];
                float _598 = _574 * 6.283185482025146484375;
                float _600 = cos(_598);
                float _602 = _576 * 6.283185482025146484375;
                float _604 = sin(_602);
                float _606 = _576 * 6.283185482025146484375;
                float _608 = cos(_606);
                float _610 = _582 * _600;
                float _612 = _572 * 6.283185482025146484375;
                float _614 = sin(_612);
                float _616 = _574 * 6.283185482025146484375;
                float _618 = sin(_616);
                float _620 = _582 * _608;
                float _622 = _600 * _608;
                float _624 = _578 * 6.283185482025146484375;
                float _626 = cos(_624);
                float _628 = _604 * _582;
                float _630 = _614 * _608;
                float _632 = _361 * _596;
                float _634 = _393 * _596;
                float _636 = fma(_536, _570, _632);
                float _638 = _584 * 6.283185482025146484375;
                float _640 = sin(_638);
                float _642 = _614 * _618;
                float _644 = -_630;
                float _646 = fma(_618, _628, _644);
                float _648 = fma(_528, _570, _634);
                float _650 = -_628;
                float _652 = fma(_608, _642, _650);
                float _654 = fma(_604, _642, _620);
                float _656 = _584 * 6.283185482025146484375;
                float _658 = cos(_656);
                float _660 = _586 * 6.283185482025146484375;
                float _662 = cos(_660);
                float _664 = _614 * _604;
                float _666 = fma(_618, _620, _664);
                float _668 = _640 * _626;
                float _670 = _618 * _570;
                float _672 = _578 * 6.283185482025146484375;
                float _674 = sin(_672);
                float _676 = _668 * _596;
                float _678 = _586 * 6.283185482025146484375;
                float _680 = sin(_678);
                float _682 = _604 * _600;
                float _684 = _662 * _658;
                float _686 = _662 * _626;
                float _688 = _614 * _600;
                float _690 = _626 * _658;
                float _692 = fma(_682, _570, _676);
                float _694 = _686 * _596;
                float _696 = _640 * _662;
                float _698 = fma(_610, _570, _694);
                float _700 = _680 * _674;
                float _702 = _680 * _640;
                float _704 = _680 * _658;
                float _706 = _680 * _626;
                float _708 = fma(_640, _700, _684);
                float _710 = fma(_674, _684, _702);
                float _712 = -_704;
                float _714 = fma(_674, _696, _712);
                float _716 = -_696;
                float _718 = fma(_658, _700, _716);
                float _720 = -_674;
                float _722 = -_670;
                float _724 = fma(_720, _596, _722);
                float _726 = _708 * _596;
                float _728 = _690 * _596;
                float _730 = _718 * _596;
                float _732 = _714 * _596;
                float _734 = fma(_654, _570, _726);
                float _736 = fma(_622, _570, _728);
                float _738 = _692 * _692;
                float _740 = fma(_652, _570, _730);
                float _742 = _734 * _734;
                float _744 = _710 * _596;
                float _746 = fma(_646, _570, _732);
                float _748 = _706 * _596;
                float _750 = fma(_736, _736, _738);
                float _752 = fma(_740, _740, _742);
                float _754 = fma(_666, _570, _744);
                float _756 = _746 * _746;
                float _758 = fma(_688, _570, _748);
                float _760 = fma(_724, _724, _750);
                float _762 = _359 * _596;
                float _764 = fma(_754, _754, _756);
                float _766 = fma(_758, _758, _752);
                float _768 = _389 * _596;
                float _770 = _391 * _596;
                float _772 = fma(_698, _698, _764);
                float _774 = rsqrt(_760);
                float _776 = _357 * _596;
                float _778 = fma(_538, _570, _762);
                float _780 = fma(_540, _570, _768);
                float _782 = fma(_542, _570, _770);
                float _784 = fma(_544, _570, _776);
                float _786 = rsqrt(_766);
                float _788 = rsqrt(_772);
                float _790 = _736 * _774;
                float _792 = _734 * _786;
                float _794 = _692 * _774;
                float _796 = _758 * _786;
                float _798 = _724 * _774;
                float _800 = _740 * _786;
                float _802 = _754 * _788;
                float _804 = _746 * _788;
                float _806 = _698 * _788;
                _808 = _698;
                _810 = _648;
                _812 = _786;
                _814 = _794;
                _816 = _802;
                _818 = _800;
                _820 = _790;
                _261 = as_type<int>(_570);
                _822 = _804;
                _824 = _798;
                _826 = _792;
                _263 = as_type<int>(_596);
                _550 = _636;
                _552 = _778;
                _554 = _784;
                _828 = _796;
                _556 = _784;
                _830 = _790;
                _832 = _794;
                _834 = _798;
                _558 = _778;
                _836 = _800;
                _838 = _792;
                _840 = _796;
                _560 = _636;
                _842 = _802;
                _844 = _804;
                _846 = _806;
                _848 = as_type<int>(_780);
                _850 = as_type<int>(_782);
                _852 = as_type<int>(_648);
                _854 = true;
            }
            else
            {
                float _856 = _546 * 2.0;
                float _858 = _530 * _530;
                float _860 = _532 * _532;
                float _862 = _530 * 2.0;
                float _864 = _856 * _534;
                float _866 = _856 * _530;
                float _868 = _856 * _532;
                float _870 = _532 * 2.0;
                float _872 = _534 * _534;
                float _874 = fma(_858, -2.0, 1.0);
                float _876 = fma(_860, -2.0, 1.0);
                float _878 = -_864;
                float _880 = fma(_862, _532, _878);
                float _882 = fma(_862, _532, _864);
                float _884 = fma(_862, _534, _868);
                float _886 = -_868;
                float _888 = fma(_862, _534, _886);
                float _890 = -_866;
                float _892 = fma(_870, _534, _890);
                float _894 = fma(_870, _534, _866);
                float _896 = fma(_872, -2.0, _876);
                float _898 = fma(_872, -2.0, _874);
                float _900 = fma(_860, -2.0, _874);
                _808 = _870;
                _810 = _528;
                _812 = _872;
                _814 = _882;
                _816 = _884;
                _818 = _880;
                _820 = _896;
                _822 = _892;
                _824 = _888;
                _826 = _898;
                _828 = _894;
                _830 = _896;
                _832 = _882;
                _834 = _888;
                _836 = _880;
                _838 = _898;
                _840 = _894;
                _842 = _884;
                _844 = _892;
                _846 = _900;
                _848 = as_type<int>(_540);
                _850 = as_type<int>(_542);
                _852 = as_type<int>(_528);
            }
            _854 = false;
            float _902 = _808;
            float _904 = _810;
            float _906 = _812;
            float _908 = _814;
            float _910 = _816;
            float _912 = _818;
            float _914 = _820;
            int _916 = _261;
            float _918 = _822;
            float _920 = _824;
            float _922 = _826;
            int _924 = _263;
            float _926 = _550;
            float _928 = _552;
            float _930 = _554;
            float _932 = _828;
            float _934 = _556;
            float _936 = _830;
            float _938 = _832;
            float _940 = _834;
            float _942 = _558;
            float _944 = _836;
            float _946 = _838;
            float _948 = _840;
            float _950 = _560;
            float _952 = _842;
            float _954 = _844;
            float _956 = _846;
            int _958 = _848;
            int _960 = _850;
            int _962 = _852;
            int _964 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _966 = _964 + _137;
            float _968 = _934 * _936;
            float _970 = _934 * _938;
            float _972 = _934 * _940;
            float _974 = _942 * _944;
            float _976 = _942 * _946;
            float _978 = _942 * _948;
            float _980 = _950 * _952;
            int _982 = _966 * 48;
            float _984 = _950 * _954;
            float _986 = _950 * _956;
            int _988 = _137 + 1;
            uint _990 = uint(int(uint(_982) >> uint(2)));
            _37[int(_990)] = as_type<uint>(_968);
            int _992 = _982 + 4;
            uint _994 = uint(int(uint(_992) >> uint(2)));
            _37[int(_994)] = as_type<uint>(_974);
            int _996 = _982 + 8;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            _37[int(_998)] = as_type<uint>(_980);
            int _1000 = _982 + 12;
            uint _1002 = uint(int(uint(_1000) >> uint(2)));
            _37[int(_1002)] = uint(_958);
            bool _1004 = uint(_988) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1006 = _982 + 16;
            uint _1008 = uint(int(uint(_1006) >> uint(2)));
            _37[int(_1008)] = as_type<uint>(_970);
            int _1010 = _982 + 20;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            _37[int(_1012)] = as_type<uint>(_976);
            int _1014 = _982 + 24;
            uint _1016 = uint(int(uint(_1014) >> uint(2)));
            _37[int(_1016)] = as_type<uint>(_984);
            int _1018 = _982 + 28;
            uint _1020 = uint(int(uint(_1018) >> uint(2)));
            _37[int(_1020)] = uint(_960);
            int _1022 = _982 + 32;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            _37[int(_1024)] = as_type<uint>(_972);
            int _1026 = _982 + 36;
            uint _1028 = uint(int(uint(_1026) >> uint(2)));
            _37[int(_1028)] = as_type<uint>(_978);
            int _1030 = _982 + 40;
            uint _1032 = uint(int(uint(_1030) >> uint(2)));
            _37[int(_1032)] = as_type<uint>(_986);
            int _1034 = _982 + 44;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            _37[int(_1036)] = uint(_962);
            _135 = !_1004;
            _91 = _988;
            _93 = as_type<int>(_974);
            _95 = _902;
            _97 = _968;
            _99 = _986;
            _103 = _904;
            _105 = _906;
            _107 = _908;
            _109 = _910;
            _111 = _912;
            _113 = _914;
            _117 = _916;
            _119 = _918;
            _121 = _920;
            _123 = _922;
            _125 = _924;
            _127 = _926;
            _129 = _928;
            _131 = _930;
            _133 = _932;
        } while (_135);
    }
    bool _1038 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _1040 = !_1038;
    if (!_1040)
    {
        int _1042 = 1;
        bool _1044;
        do
        {
            int _1046 = _1042;
            int _1048 = _1046 * 112;
            int _1050 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1052 = _1050 + _1046;
            int _1054 = _1046 + 1;
            uint _1056 = uint(int(uint(_1048) >> uint(2)));
            uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
            int _1060 = int(_1056) & 3;
            float _1062 = (*spvDescriptorSet0.cp_c6)._m0[int(_1058)][_1060];
            int _1064 = _1052 * 48;
            bool _1066 = uint(_1054) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1068 = _1064 + 16;
            uint _1070 = uint(int(uint(_1068) >> uint(2)));
            float _1072 = as_type<float>(_37[int(_1070)]);
            int _1074 = _1064 + 20;
            uint _1076 = uint(int(uint(_1074) >> uint(2)));
            float _1078 = as_type<float>(_37[int(_1076)]);
            int _1080 = _1064 + 24;
            uint _1082 = uint(int(uint(_1080) >> uint(2)));
            float _1084 = as_type<float>(_37[int(_1082)]);
            int _1086 = _1064 + 28;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            float _1090 = as_type<float>(_37[int(_1088)]);
            int _1092 = _1064 + 32;
            uint _1094 = uint(int(uint(_1092) >> uint(2)));
            float _1096 = as_type<float>(_37[int(_1094)]);
            int _1098 = _1064 + 36;
            uint _1100 = uint(int(uint(_1098) >> uint(2)));
            float _1102 = as_type<float>(_37[int(_1100)]);
            int _1104 = _1064 + 40;
            uint _1106 = uint(int(uint(_1104) >> uint(2)));
            float _1108 = as_type<float>(_37[int(_1106)]);
            int _1110 = _1064 + 44;
            uint _1112 = uint(int(uint(_1110) >> uint(2)));
            float _1114 = as_type<float>(_37[int(_1112)]);
            int _1116 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1118 = _1116 + as_type<int>(_1062);
            int _1120 = _1118 * 48;
            uint _1122 = uint(int(uint(_1064) >> uint(2)));
            float _1124 = as_type<float>(_37[int(_1122)]);
            int _1126 = _1064 + 4;
            uint _1128 = uint(int(uint(_1126) >> uint(2)));
            float _1130 = as_type<float>(_37[int(_1128)]);
            int _1132 = _1064 + 8;
            uint _1134 = uint(int(uint(_1132) >> uint(2)));
            float _1136 = as_type<float>(_37[int(_1134)]);
            int _1138 = _1064 + 12;
            uint _1140 = uint(int(uint(_1138) >> uint(2)));
            float _1142 = as_type<float>(_37[int(_1140)]);
            uint _1144 = uint(int(uint(_1120) >> uint(2)));
            float _1146 = as_type<float>(_37[int(_1144)]);
            int _1148 = _1120 + 4;
            uint _1150 = uint(int(uint(_1148) >> uint(2)));
            float _1152 = as_type<float>(_37[int(_1150)]);
            int _1154 = _1120 + 8;
            uint _1156 = uint(int(uint(_1154) >> uint(2)));
            float _1158 = as_type<float>(_37[int(_1156)]);
            int _1160 = _1120 + 12;
            uint _1162 = uint(int(uint(_1160) >> uint(2)));
            float _1164 = as_type<float>(_37[int(_1162)]);
            int _1166 = _1120 + 16;
            uint _1168 = uint(int(uint(_1166) >> uint(2)));
            float _1170 = as_type<float>(_37[int(_1168)]);
            int _1172 = _1120 + 20;
            uint _1174 = uint(int(uint(_1172) >> uint(2)));
            float _1176 = as_type<float>(_37[int(_1174)]);
            int _1178 = _1120 + 24;
            uint _1180 = uint(int(uint(_1178) >> uint(2)));
            float _1182 = as_type<float>(_37[int(_1180)]);
            int _1184 = _1120 + 28;
            uint _1186 = uint(int(uint(_1184) >> uint(2)));
            float _1188 = as_type<float>(_37[int(_1186)]);
            int _1190 = _1120 + 32;
            uint _1192 = uint(int(uint(_1190) >> uint(2)));
            float _1194 = as_type<float>(_37[int(_1192)]);
            int _1196 = _1120 + 36;
            uint _1198 = uint(int(uint(_1196) >> uint(2)));
            float _1200 = as_type<float>(_37[int(_1198)]);
            int _1202 = _1120 + 40;
            uint _1204 = uint(int(uint(_1202) >> uint(2)));
            float _1206 = as_type<float>(_37[int(_1204)]);
            int _1208 = _1120 + 44;
            uint _1210 = uint(int(uint(_1208) >> uint(2)));
            float _1212 = as_type<float>(_37[int(_1210)]);
            float _1214 = _1090 * _1152;
            float _1216 = _1078 * _1152;
            float _1218 = _1072 * _1152;
            float _1220 = _1084 * _1152;
            float _1222 = fma(_1142, _1146, _1214);
            float _1224 = fma(_1130, _1146, _1216);
            float _1226 = fma(_1124, _1146, _1218);
            float _1228 = fma(_1136, _1146, _1220);
            float _1230 = fma(_1114, _1158, _1222);
            float _1232 = fma(_1102, _1158, _1224);
            float _1234 = _1078 * _1176;
            float _1236 = _1072 * _1176;
            float _1238 = _1164 + _1230;
            float _1240 = _1090 * _1176;
            float _1242 = _1084 * _1176;
            float _1244 = fma(_1130, _1170, _1234);
            float _1246 = fma(_1096, _1158, _1226);
            float _1248 = fma(_1142, _1170, _1240);
            float _1250 = fma(_1136, _1170, _1242);
            float _1252 = fma(_1102, _1182, _1244);
            float _1254 = _1090 * _1200;
            float _1256 = _1072 * _1200;
            float _1258 = _1078 * _1200;
            float _1260 = _1084 * _1200;
            float _1262 = fma(_1142, _1194, _1254);
            float _1264 = fma(_1124, _1170, _1236);
            float _1266 = fma(_1114, _1182, _1248);
            float _1268 = fma(_1124, _1194, _1256);
            float _1270 = fma(_1130, _1194, _1258);
            float _1272 = fma(_1136, _1194, _1260);
            float _1274 = fma(_1114, _1206, _1262);
            float _1276 = fma(_1096, _1182, _1264);
            float _1278 = fma(_1108, _1158, _1228);
            float _1280 = fma(_1108, _1182, _1250);
            float _1282 = _1188 + _1266;
            float _1284 = fma(_1096, _1206, _1268);
            float _1286 = fma(_1102, _1206, _1270);
            float _1288 = fma(_1108, _1206, _1272);
            float _1290 = _1212 + _1274;
            uint _1292 = uint(int(uint(_1064) >> uint(2)));
            _37[int(_1292)] = as_type<uint>(_1246);
            int _1294 = _1064 + 4;
            uint _1296 = uint(int(uint(_1294) >> uint(2)));
            _37[int(_1296)] = as_type<uint>(_1232);
            int _1298 = _1064 + 8;
            uint _1300 = uint(int(uint(_1298) >> uint(2)));
            _37[int(_1300)] = as_type<uint>(_1278);
            int _1302 = _1064 + 12;
            uint _1304 = uint(int(uint(_1302) >> uint(2)));
            _37[int(_1304)] = as_type<uint>(_1238);
            int _1306 = _1064 + 16;
            uint _1308 = uint(int(uint(_1306) >> uint(2)));
            _37[int(_1308)] = as_type<uint>(_1276);
            int _1310 = _1064 + 20;
            uint _1312 = uint(int(uint(_1310) >> uint(2)));
            _37[int(_1312)] = as_type<uint>(_1252);
            int _1314 = _1064 + 24;
            uint _1316 = uint(int(uint(_1314) >> uint(2)));
            _37[int(_1316)] = as_type<uint>(_1280);
            int _1318 = _1064 + 28;
            uint _1320 = uint(int(uint(_1318) >> uint(2)));
            _37[int(_1320)] = as_type<uint>(_1282);
            int _1322 = _1064 + 32;
            uint _1324 = uint(int(uint(_1322) >> uint(2)));
            _37[int(_1324)] = as_type<uint>(_1284);
            int _1326 = _1064 + 36;
            uint _1328 = uint(int(uint(_1326) >> uint(2)));
            _37[int(_1328)] = as_type<uint>(_1286);
            int _1330 = _1064 + 40;
            uint _1332 = uint(int(uint(_1330) >> uint(2)));
            _37[int(_1332)] = as_type<uint>(_1288);
            int _1334 = _1064 + 44;
            uint _1336 = uint(int(uint(_1334) >> uint(2)));
            _37[int(_1336)] = as_type<uint>(_1290);
            _1044 = !_1066;
            _1042 = _1054;
        } while (_1044);
    }
    if (!_72)
    {
        return;
    }
    int _1338 = 0;
    bool _1340;
    do
    {
        int _1342 = _1338;
        int _1344 = _66 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1346 = _1344 + _1342;
        int _1348 = _1342 * 112;
        int _1350 = _1346 * 48;
        int _1352 = _1348 + 80;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        uint _1356 = uint(int(uint(int(_1354)) >> uint(2)));
        int _1358 = int(_1354) & 3;
        float _1360 = (*spvDescriptorSet0.cp_c6)._m0[int(_1356)][_1358];
        int _1362 = int(_1354) + 1;
        uint _1364 = uint(int(uint(_1362) >> uint(2)));
        int _1366 = _1362 & 3;
        float _1368 = (*spvDescriptorSet0.cp_c6)._m0[int(_1364)][_1366];
        uint _1370 = uint(int(uint(_1350) >> uint(2)));
        float _1372 = as_type<float>(_37[int(_1370)]);
        int _1374 = _1350 + 4;
        uint _1376 = uint(int(uint(_1374) >> uint(2)));
        float _1378 = as_type<float>(_37[int(_1376)]);
        int _1380 = _1350 + 8;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        float _1384 = as_type<float>(_37[int(_1382)]);
        int _1386 = _1350 + 12;
        uint _1388 = uint(int(uint(_1386) >> uint(2)));
        float _1390 = as_type<float>(_37[int(_1388)]);
        int _1392 = _1350 + 16;
        uint _1394 = uint(int(uint(_1392) >> uint(2)));
        float _1396 = as_type<float>(_37[int(_1394)]);
        int _1398 = _1350 + 20;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        float _1402 = as_type<float>(_37[int(_1400)]);
        int _1404 = _1350 + 24;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        float _1408 = as_type<float>(_37[int(_1406)]);
        int _1410 = _1350 + 28;
        uint _1412 = uint(int(uint(_1410) >> uint(2)));
        float _1414 = as_type<float>(_37[int(_1412)]);
        int _1416 = _1348 + 88;
        uint _1418 = uint(int(uint(_1416) >> uint(2)));
        uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
        int _1422 = int(_1418) & 3;
        float _1424 = (*spvDescriptorSet0.cp_c6)._m0[int(_1420)][_1422];
        int _1426 = int(_1418) + 1;
        uint _1428 = uint(int(uint(_1426) >> uint(2)));
        int _1430 = _1426 & 3;
        float _1432 = (*spvDescriptorSet0.cp_c6)._m0[int(_1428)][_1430];
        int _1434 = _1350 + 32;
        uint _1436 = uint(int(uint(_1434) >> uint(2)));
        float _1438 = as_type<float>(_37[int(_1436)]);
        int _1440 = _1350 + 36;
        uint _1442 = uint(int(uint(_1440) >> uint(2)));
        float _1444 = as_type<float>(_37[int(_1442)]);
        int _1446 = _1350 + 40;
        uint _1448 = uint(int(uint(_1446) >> uint(2)));
        float _1450 = as_type<float>(_37[int(_1448)]);
        int _1452 = _1350 + 44;
        uint _1454 = uint(int(uint(_1452) >> uint(2)));
        float _1456 = as_type<float>(_37[int(_1454)]);
        int _1458 = _1348 + 64;
        uint _1460 = uint(int(uint(_1458) >> uint(2)));
        uint _1462 = uint(int(uint(int(_1460)) >> uint(2)));
        int _1464 = int(_1460) & 3;
        float _1466 = (*spvDescriptorSet0.cp_c6)._m0[int(_1462)][_1464];
        int _1468 = int(_1460) + 1;
        uint _1470 = uint(int(uint(_1468) >> uint(2)));
        int _1472 = _1468 & 3;
        float _1474 = (*spvDescriptorSet0.cp_c6)._m0[int(_1470)][_1472];
        int _1476 = _1348 + 72;
        uint _1478 = uint(int(uint(_1476) >> uint(2)));
        uint _1480 = uint(int(uint(int(_1478)) >> uint(2)));
        int _1482 = int(_1478) & 3;
        float _1484 = (*spvDescriptorSet0.cp_c6)._m0[int(_1480)][_1482];
        int _1486 = int(_1478) + 1;
        uint _1488 = uint(int(uint(_1486) >> uint(2)));
        int _1490 = _1486 & 3;
        float _1492 = (*spvDescriptorSet0.cp_c6)._m0[int(_1488)][_1490];
        int _1494 = _1348 + 104;
        uint _1496 = uint(int(uint(_1494) >> uint(2)));
        uint _1498 = uint(int(uint(int(_1496)) >> uint(2)));
        int _1500 = int(_1496) & 3;
        float _1502 = (*spvDescriptorSet0.cp_c6)._m0[int(_1498)][_1500];
        int _1504 = int(_1496) + 1;
        uint _1506 = uint(int(uint(_1504) >> uint(2)));
        int _1508 = _1504 & 3;
        float _1510 = (*spvDescriptorSet0.cp_c6)._m0[int(_1506)][_1508];
        int _1512 = _1348 + 96;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        uint _1516 = uint(int(uint(int(_1514)) >> uint(2)));
        int _1518 = int(_1514) & 3;
        float _1520 = (*spvDescriptorSet0.cp_c6)._m0[int(_1516)][_1518];
        int _1522 = int(_1514) + 1;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        int _1526 = _1522 & 3;
        float _1528 = (*spvDescriptorSet0.cp_c6)._m0[int(_1524)][_1526];
        float _1530 = _1378 * _1360;
        float _1532 = _1378 * _1368;
        float _1534 = _1378 * _1424;
        float _1536 = _1378 * _1432;
        float _1538 = fma(_1372, _1466, _1530);
        float _1540 = fma(_1372, _1474, _1532);
        float _1542 = fma(_1372, _1484, _1534);
        float _1544 = fma(_1372, _1492, _1536);
        float _1546 = _1402 * _1360;
        float _1548 = _1402 * _1368;
        float _1550 = _1402 * _1424;
        float _1552 = _1402 * _1432;
        float _1554 = _1444 * _1360;
        float _1556 = fma(_1396, _1466, _1546);
        float _1558 = fma(_1396, _1474, _1548);
        float _1560 = fma(_1396, _1484, _1550);
        uint _1562 = uint(int(uint(_76) >> uint(2)));
        uint _1564 = uint(int(uint(int(_1562)) >> uint(2)));
        int _1566 = int(_1562) & 3;
        float _1568 = (*spvDescriptorSet0.cp_c4)._m0[int(_1564)][_1566];
        float _1570 = fma(_1396, _1492, _1552);
        float _1572 = _1444 * _1368;
        float _1574 = _1444 * _1424;
        float _1576 = _1444 * _1432;
        float _1578 = fma(_1438, _1466, _1554);
        float _1580 = fma(_1438, _1474, _1572);
        float _1582 = fma(_1438, _1484, _1574);
        int _1584 = _1348 + 16;
        uint _1586 = uint(int(uint(_1584) >> uint(2)));
        uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
        int _1590 = int(_1586) & 3;
        float _1592 = (*spvDescriptorSet0.cp_c6)._m0[int(_1588)][_1590];
        int _1594 = int(_1586) + 1;
        uint _1596 = uint(int(uint(_1594) >> uint(2)));
        int _1598 = _1594 & 3;
        float _1600 = (*spvDescriptorSet0.cp_c6)._m0[int(_1596)][_1598];
        float _1602 = fma(_1438, _1492, _1576);
        float _1604 = fma(_1408, _1510, _1570);
        float _1606 = fma(_1384, _1520, _1538);
        float _1608 = fma(_1384, _1528, _1540);
        float _1610 = fma(_1384, _1502, _1542);
        float _1612 = fma(_1384, _1510, _1544);
        float _1614 = fma(_1408, _1520, _1556);
        int _1616 = _1348 + 24;
        uint _1618 = uint(int(uint(_1616) >> uint(2)));
        uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
        int _1622 = int(_1618) & 3;
        float _1624 = (*spvDescriptorSet0.cp_c6)._m0[int(_1620)][_1622];
        int _1626 = int(_1618) + 1;
        uint _1628 = uint(int(uint(_1626) >> uint(2)));
        int _1630 = _1626 & 3;
        float _1632 = (*spvDescriptorSet0.cp_c6)._m0[int(_1628)][_1630];
        float _1634 = fma(_1408, _1528, _1558);
        float _1636 = fma(_1408, _1502, _1560);
        float _1638 = fma(_1450, _1520, _1578);
        float _1640 = fma(_1450, _1528, _1580);
        float _1642 = fma(_1450, _1510, _1602);
        float _1644 = fma(_1450, _1502, _1582);
        float _1646 = _1414 + _1604;
        int _1648 = _1348 + 32;
        uint _1650 = uint(int(uint(_1648) >> uint(2)));
        uint _1652 = uint(int(uint(int(_1650)) >> uint(2)));
        int _1654 = int(_1650) & 3;
        float _1656 = (*spvDescriptorSet0.cp_c6)._m0[int(_1652)][_1654];
        int _1658 = int(_1650) + 1;
        uint _1660 = uint(int(uint(_1658) >> uint(2)));
        int _1662 = _1658 & 3;
        float _1664 = (*spvDescriptorSet0.cp_c6)._m0[int(_1660)][_1662];
        float _1666 = _1456 + _1642;
        float _1668 = _1390 + _1612;
        int _1670 = _1348 + 48;
        uint _1672 = uint(int(uint(_1670) >> uint(2)));
        uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
        int _1676 = int(_1672) & 3;
        float _1678 = (*spvDescriptorSet0.cp_c6)._m0[int(_1674)][_1676];
        int _1680 = int(_1672) + 1;
        uint _1682 = uint(int(uint(_1680) >> uint(2)));
        int _1684 = _1680 & 3;
        float _1686 = (*spvDescriptorSet0.cp_c6)._m0[int(_1682)][_1684];
        float _1688 = _1614 * _1600;
        float _1690 = _1634 * _1600;
        float _1692 = _1646 * _1600;
        float _1694 = _1636 * _1600;
        float _1696 = fma(_1606, _1592, _1688);
        float _1698 = fma(_1608, _1592, _1690);
        float _1700 = fma(_1668, _1592, _1692);
        float _1702 = fma(_1610, _1592, _1694);
        int _1704 = _1348 + 40;
        uint _1706 = uint(int(uint(_1704) >> uint(2)));
        uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
        int _1710 = int(_1706) & 3;
        float _1712 = (*spvDescriptorSet0.cp_c6)._m0[int(_1708)][_1710];
        int _1714 = int(_1706) + 1;
        uint _1716 = uint(int(uint(_1714) >> uint(2)));
        int _1718 = _1714 & 3;
        float _1720 = (*spvDescriptorSet0.cp_c6)._m0[int(_1716)][_1718];
        float _1722 = fma(_1638, _1624, _1696);
        float _1724 = fma(_1666, _1624, _1700);
        float _1726 = fma(_1640, _1624, _1698);
        float _1728 = fma(_1644, _1624, _1702);
        float _1730 = _1724 + _1632;
        float _1732 = _1646 * _1664;
        int _1734 = _1348 + 56;
        uint _1736 = uint(int(uint(_1734) >> uint(2)));
        uint _1738 = uint(int(uint(int(_1736)) >> uint(2)));
        int _1740 = int(_1736) & 3;
        float _1742 = (*spvDescriptorSet0.cp_c6)._m0[int(_1738)][_1740];
        int _1744 = int(_1736) + 1;
        uint _1746 = uint(int(uint(_1744) >> uint(2)));
        int _1748 = _1744 & 3;
        float _1750 = (*spvDescriptorSet0.cp_c6)._m0[int(_1746)][_1748];
        float _1752 = _1614 * _1664;
        float _1754 = _1634 * _1664;
        int _1756 = as_type<int>(_1568) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1758 = _1756 + _1342;
        int _1760 = _1342 + 1;
        float _1762 = _1636 * _1664;
        float _1764 = fma(_1668, _1656, _1732);
        float _1766 = _1646 * _1686;
        float _1768 = _1614 * _1686;
        float _1770 = _1634 * _1686;
        float _1772 = fma(_1608, _1656, _1754);
        float _1774 = _1636 * _1686;
        float _1776 = fma(_1668, _1678, _1766);
        float _1778 = fma(_1606, _1678, _1768);
        int _1780 = _1758 * 48;
        bool _1782 = uint(_1760) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1784 = fma(_1608, _1678, _1770);
        float _1786 = fma(_1606, _1656, _1752);
        float _1788 = fma(_1610, _1656, _1762);
        float _1790 = fma(_1666, _1712, _1764);
        float _1792 = fma(_1610, _1678, _1774);
        float _1794 = fma(_1640, _1712, _1772);
        float _1796 = fma(_1638, _1712, _1786);
        float _1798 = fma(_1644, _1712, _1788);
        float _1800 = fma(_1666, _1742, _1776);
        float _1802 = fma(_1638, _1742, _1778);
        float _1804 = fma(_1640, _1742, _1784);
        int _1806 = _1780 + 16;
        float _1808 = _1790 + _1720;
        int _1810 = _1780 + 32;
        float _1812 = fma(_1644, _1742, _1792);
        float _1814 = _1800 + _1750;
        int _1816 = _1780 + 48;
        uint _1818 = uint(int(uint(_1806) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1818)] = as_type<uint>(_1722);
        int _1820 = _1806 + 4;
        uint _1822 = uint(int(uint(_1820) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1822)] = as_type<uint>(_1726);
        int _1824 = _1806 + 8;
        uint _1826 = uint(int(uint(_1824) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1826)] = as_type<uint>(_1728);
        int _1828 = _1806 + 12;
        uint _1830 = uint(int(uint(_1828) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1830)] = as_type<uint>(_1730);
        uint _1832 = uint(int(uint(_1810) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1832)] = as_type<uint>(_1796);
        int _1834 = _1810 + 4;
        uint _1836 = uint(int(uint(_1834) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1836)] = as_type<uint>(_1794);
        int _1838 = _1810 + 8;
        uint _1840 = uint(int(uint(_1838) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1840)] = as_type<uint>(_1798);
        int _1842 = _1810 + 12;
        uint _1844 = uint(int(uint(_1842) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1844)] = as_type<uint>(_1808);
        uint _1846 = uint(int(uint(_1816) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1846)] = as_type<uint>(_1802);
        int _1848 = _1816 + 4;
        uint _1850 = uint(int(uint(_1848) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1850)] = as_type<uint>(_1804);
        int _1852 = _1816 + 8;
        uint _1854 = uint(int(uint(_1852) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1854)] = as_type<uint>(_1812);
        int _1856 = _1816 + 12;
        uint _1858 = uint(int(uint(_1856) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1858)] = as_type<uint>(_1814);
        _1340 = !_1782;
        _1338 = _1760;
    } while (_1340);
}

