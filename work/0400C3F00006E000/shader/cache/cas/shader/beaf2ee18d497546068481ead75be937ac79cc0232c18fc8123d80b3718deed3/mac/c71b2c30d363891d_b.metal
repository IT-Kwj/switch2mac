#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

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
int _54(thread const int& _3776, thread const int& _3777, constant _10& support_buffer)
{
    int _3780 = 1 + _3777;
    float _3782 = support_buffer._m5[_3780].x;
    bool _3784 = _3782 == 1.0;
    if (_3784)
    {
        return _3776;
    }
    float _3786 = float(_3776);
    float _3788 = _3786 * _3782;
    int _3790 = int(_3788);
    return _3790;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3812, thread const int& _3813, thread const int& _3814, thread int& _3815, thread uint& gl_SubgroupInvocationID)
{
    int _3818 = _3814 & 31;
    uint _3820 = uint(int(uint(_3814) >> uint(8)));
    int _3822 = int(_3820) & 31;
    float _3824 = as_type<float>(gl_SubgroupInvocationID);
    int _3826 = as_type<int>(_3824) & _3822;
    int _3828 = ~_3822;
    int _3830 = _3818 & _3828;
    int _3832 = _3830 | _3826;
    int _3834 = ~_3822;
    int _3836 = _3813 & _3834;
    int _3838 = _3836 | _3826;
    bool _3840 = uint(_3838) <= uint(_3832);
    _3815 = _3840 ? (-1) : 0;
    float _3842 = spvSubgroupShuffle(as_type<float>(_3812), uint(_3838));
    uint _3844 = uint(_3840 ? as_type<int>(_3842) : _3812);
    return int(_3844);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1161 = false;
    bool _701 = false;
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
    int _129 = as_type<int>(_109);
    float _131 = _97;
    if (_123)
    {
        int _133 = _99 + 8;
        uint _135 = uint(int(uint(_133) >> uint(2)));
        uint _137 = uint(int(uint(int(_135)) >> uint(2)));
        int _139 = int(_135) & 3;
        float _141 = (*spvDescriptorSet0.cp_c5)._m0[int(_137)][_139];
        _129 = as_type<int>(_141);
    }
    int _143 = _129;
    float _145 = 0.0;
    if (_123)
    {
        _145 = 1.4012984643248170709237295832899e-45;
    }
    float _147 = _145;
    float _149 = 0.0;
    if (_123)
    {
        _149 = 2.8025969286496341418474591665798e-45;
    }
    float _151 = _149;
    int _153 = 0;
    if (_127)
    {
        uint _155 = uint(int(uint(_99) >> uint(2)));
        uint _157 = uint(int(uint(int(_155)) >> uint(2)));
        int _159 = int(_155) & 3;
        float _161 = (*spvDescriptorSet0.cp_c5)._m0[int(_157)][_159];
        _153 = as_type<int>(_161);
    }
    int _163 = _153;
    if (_127)
    {
        _131 = 1.4012984643248170709237295832899e-45;
    }
    float _165 = _131;
    float _167 = _147;
    float _169 = as_type<float>(_66);
    float _171 = 0.0;
    float _173 = as_type<float>(_143);
    if (_123)
    {
        int _175 = _66;
        int _177 = 0;
        int _179 = _54(_175, _177, (*spvDescriptorSet0.support_buffer));
        int _181 = _143;
        int _183 = 0;
        int _185 = _54(_181, _183, (*spvDescriptorSet0.support_buffer));
        int3 _1815 = int3(_179, _185, as_type<int>(_147));
        float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1815.xy), uint(_1815.z), 0).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        _167 = _191;
        _169 = _193;
        _171 = _195;
    }
    float _197 = _167;
    float _199 = _169;
    float _201 = _171;
    float _203 = 0.0;
    float _205 = as_type<float>(_66);
    float _207 = 0.0;
    if (_123)
    {
        int _209 = _66;
        int _211 = 0;
        int _213 = _54(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = _143;
        int _217 = 0;
        int _219 = _54(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _1843 = int3(_213, _219, 0);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1843.xy), uint(_1843.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        _203 = _223;
        _205 = _225;
        _207 = _227;
    }
    float _229 = _203;
    float _231 = _205;
    float _233 = _207;
    float _235 = _151;
    float _237 = as_type<float>(_66);
    float _239 = 0.0;
    if (_123)
    {
        int _241 = _66;
        int _243 = 0;
        int _245 = _54(_241, _243, (*spvDescriptorSet0.support_buffer));
        int _247 = _143;
        int _249 = 0;
        int _251 = _54(_247, _249, (*spvDescriptorSet0.support_buffer));
        int3 _1874 = int3(_245, _251, as_type<int>(_151));
        float3 _253 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1874.xy), uint(_1874.z), 0).xyz;
        float _255 = _253.x;
        float _257 = _253.y;
        float _259 = _253.z;
        _235 = _255;
        _237 = _257;
        _239 = _259;
    }
    float _261 = _235;
    float _263 = _237;
    float _265 = _239;
    float _267 = 0.0;
    float _269 = as_type<float>(_66);
    float _271 = 0.0;
    if (_127)
    {
        int _273 = _66;
        int _275 = 1;
        int _277 = _54(_273, _275, (*spvDescriptorSet0.support_buffer));
        int _279 = _163;
        int _281 = 1;
        int _283 = _54(_279, _281, (*spvDescriptorSet0.support_buffer));
        int3 _1902 = int3(_277, _283, 0);
        float3 _285 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1902.xy), uint(_1902.z), 0).xyz;
        float _287 = _285.x;
        float _289 = _285.y;
        float _291 = _285.z;
        _267 = _287;
        _269 = _289;
        _271 = _291;
    }
    float _293 = _267;
    float _295 = _269;
    float _297 = _271;
    float _299 = 0.0;
    float _301 = 0.0;
    float _303 = _165;
    if (_127)
    {
        int _305 = _66;
        int _307 = 1;
        int _309 = _54(_305, _307, (*spvDescriptorSet0.support_buffer));
        int _311 = _163;
        int _313 = 1;
        int _315 = _54(_311, _313, (*spvDescriptorSet0.support_buffer));
        int3 _1931 = int3(_309, _315, as_type<int>(_165));
        float3 _317 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1931.xy), uint(_1931.z), 0).xyz;
        float _319 = _317.x;
        float _321 = _317.y;
        float _323 = _317.z;
        _299 = _319;
        _301 = _321;
        _303 = _323;
    }
    float _325 = _299;
    float _327 = _301;
    float _329 = _303;
    float _331 = 0.0;
    float _333 = 0.0;
    if (!_127)
    {
        _331 = 0.0;
        _333 = 0.0;
    }
    float _335 = _331;
    float _337 = _333;
    float _339 = 0.0;
    float _341 = 0.0;
    float _343 = _335;
    float _345 = _337;
    if (!_127)
    {
        _339 = 0.0;
        _341 = 0.0;
    }
    float _347 = _339;
    float _349 = _341;
    float _351 = 0.0;
    float _353 = _349;
    float _355 = _347;
    if (!_127)
    {
        _351 = 0.0;
    }
    float _357 = _351;
    float _359 = 0.0;
    float _361 = 0.0;
    float _363 = _357;
    if (!_127)
    {
        _359 = 0.0;
        _361 = 0.0;
    }
    float _365 = _359;
    float _367 = _361;
    float _369 = 0.0;
    float _371 = _365;
    float _373 = _367;
    if (!_127)
    {
        _369 = 0.0;
        _173 = 0.0;
    }
    float _375 = _369;
    float _377 = _173;
    bool _379 = !_127;
    float _381 = _375;
    float _383 = _377;
    if (!_379)
    {
        int _385 = _66;
        int _387 = 1;
        int _389 = _54(_385, _387, (*spvDescriptorSet0.support_buffer));
        int _391 = _163;
        int _393 = 1;
        int _395 = _54(_391, _393, (*spvDescriptorSet0.support_buffer));
        int3 _1998 = int3(_389, _395, 2);
        float3 _397 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1998.xy), uint(_1998.z), 0).xyz;
        float _399 = _397.x;
        float _401 = _397.y;
        float _403 = _397.z;
        _363 = _325;
        _371 = _327;
        _373 = _329;
        _343 = _293;
        _345 = _295;
        _353 = _297;
        _381 = _399;
        _383 = _401;
        _355 = _403;
    }
    float _405 = _363;
    float _407 = _371;
    float _409 = _373;
    float _411 = _343;
    float _413 = _345;
    float _415 = _353;
    float _417 = _381;
    float _419 = _383;
    float _421 = _355;
    bool _423 = !_123;
    float _425 = _417;
    float _673;
    float _675;
    float _677;
    float _679;
    float _681;
    float _683;
    float _685;
    float _687;
    float _689;
    float _691;
    float _693;
    float _695;
    float _697;
    float _699;
    if (!_423)
    {
        float _427 = _405 * 0.15915493667125701904296875;
        float _429 = _407 * 0.15915493667125701904296875;
        float _431 = _409 * 0.15915493667125701904296875;
        float _433 = _199 * 0.15915493667125701904296875;
        float _435 = _427 * 6.283185482025146484375;
        float _437 = cos(_435);
        float _439 = _201 * 0.15915493667125701904296875;
        float _441 = _197 * 0.15915493667125701904296875;
        int _443 = _99 + 28;
        uint _445 = uint(int(uint(_443) >> uint(2)));
        uint _447 = uint(int(uint(int(_445)) >> uint(2)));
        int _449 = int(_445) & 3;
        float _451 = (*spvDescriptorSet0.cp_c5)._m0[int(_447)][_449];
        float _453 = _429 * 6.283185482025146484375;
        float _455 = cos(_453);
        float _457 = _431 * 6.283185482025146484375;
        float _459 = sin(_457);
        float _461 = _431 * 6.283185482025146484375;
        float _463 = cos(_461);
        float _465 = _229 * _451;
        float _467 = _231 * _451;
        float _469 = _233 * _451;
        float _471 = _265 * _451;
        float _473 = _427 * 6.283185482025146484375;
        float _475 = sin(_473);
        float _477 = _459 * _455;
        float _479 = _429 * 6.283185482025146484375;
        float _481 = sin(_479);
        int _483 = _99 + 20;
        uint _485 = uint(int(uint(_483) >> uint(2)));
        uint _487 = uint(int(uint(int(_485)) >> uint(2)));
        int _489 = int(_485) & 3;
        float _491 = (*spvDescriptorSet0.cp_c5)._m0[int(_487)][_489];
        float _493 = _437 * _463;
        float _495 = _455 * _463;
        float _497 = _433 * 6.283185482025146484375;
        float _499 = sin(_497);
        float _501 = _459 * _437;
        float _503 = _475 * _463;
        float _505 = _439 * 6.283185482025146484375;
        float _507 = sin(_505);
        float _509 = -_503;
        float _511 = fma(_481, _501, _509);
        float _513 = _439 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _441 * 6.283185482025146484375;
        float _519 = cos(_517);
        float _521 = _475 * _459;
        float _523 = fma(_481, _493, _521);
        float _525 = _441 * 6.283185482025146484375;
        float _527 = sin(_525);
        float _529 = _433 * 6.283185482025146484375;
        float _531 = cos(_529);
        float _533 = _527 * _515;
        float _535 = _437 * _455;
        float _537 = _475 * _481;
        float _539 = _475 * _455;
        float _541 = _527 * _499;
        float _543 = _481 * _491;
        float _545 = -_501;
        float _547 = fma(_463, _537, _545);
        float _549 = fma(_459, _537, _493);
        float _551 = _519 * _515;
        float _553 = _507 * _519;
        float _555 = _519 * _531;
        float _557 = _507 * _531;
        float _559 = _531 * _515;
        float _561 = _527 * _507;
        float _563 = _527 * _531;
        float _565 = -_553;
        float _567 = fma(_515, _541, _565);
        float _569 = fma(_507, _541, _551);
        float _571 = fma(_499, _551, _561);
        float _573 = _559 * _451;
        float _575 = _563 * _451;
        float _577 = -_533;
        float _579 = fma(_499, _553, _577);
        float _581 = _557 * _451;
        float _583 = fma(_495, _491, _573);
        float _585 = fma(_539, _491, _575);
        float _587 = _569 * _451;
        float _589 = -_499;
        float _591 = -_543;
        float _593 = fma(_589, _451, _591);
        float _595 = fma(_477, _491, _581);
        float _597 = _567 * _451;
        float _599 = fma(_549, _491, _587);
        float _601 = _579 * _451;
        float _603 = _595 * _595;
        float _605 = fma(_547, _491, _597);
        float _607 = _571 * _451;
        float _609 = fma(_511, _491, _601);
        float _611 = fma(_583, _583, _603);
        float _613 = _599 * _599;
        float _615 = fma(_523, _491, _607);
        float _617 = _555 * _451;
        float _619 = _609 * _609;
        float _621 = fma(_593, _593, _611);
        float _623 = fma(_605, _605, _613);
        float _625 = fma(_535, _491, _617);
        float _627 = fma(_615, _615, _619);
        float _629 = _261 * _451;
        float _631 = fma(_585, _585, _623);
        float _633 = rsqrt(_621);
        float _635 = fma(_625, _625, _627);
        float _637 = _263 * _451;
        float _639 = fma(_411, _491, _465);
        float _641 = fma(_413, _491, _467);
        float _643 = fma(_415, _491, _469);
        float _645 = fma(_417, _491, _629);
        float _647 = fma(_419, _491, _637);
        float _649 = rsqrt(_631);
        float _651 = fma(_421, _491, _471);
        float _653 = rsqrt(_635);
        float _655 = _583 * _633;
        float _657 = _595 * _633;
        float _659 = _593 * _633;
        float _661 = _599 * _649;
        float _663 = _605 * _649;
        float _665 = _585 * _649;
        float _667 = _615 * _653;
        float _669 = _609 * _653;
        float _671 = _625 * _653;
        _673 = _641;
        _675 = _661;
        _677 = _643;
        _679 = _667;
        _681 = _669;
        _683 = _671;
        _685 = _639;
        _687 = _655;
        _689 = _657;
        _691 = _659;
        _693 = _663;
        _695 = _665;
        _697 = _651;
        _699 = _647;
        _425 = _645;
        _701 = true;
    }
    else
    {
        float _703 = _405 * 0.15915493667125701904296875;
        float _705 = _409 * 0.15915493667125701904296875;
        float _707 = _407 * 0.15915493667125701904296875;
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _703 * 6.283185482025146484375;
        float _715 = cos(_713);
        float _717 = _705 * 6.283185482025146484375;
        float _719 = sin(_717);
        float _721 = _705 * 6.283185482025146484375;
        float _723 = cos(_721);
        float _725 = _707 * 6.283185482025146484375;
        float _727 = sin(_725);
        float _729 = _719 * _715;
        float _731 = _711 * _719;
        float _733 = _707 * 6.283185482025146484375;
        float _735 = cos(_733);
        float _737 = _715 * _723;
        float _739 = _711 * _723;
        float _741 = _711 * _727;
        float _743 = _715 * _735;
        float _745 = _735 * _723;
        float _747 = _719 * _735;
        float _749 = _711 * _735;
        float _751 = -_729;
        float _753 = fma(_723, _741, _751);
        float _755 = fma(_719, _741, _737);
        float _757 = -_739;
        float _759 = fma(_727, _729, _757);
        float _761 = fma(_727, _737, _731);
        float _763 = -_727;
        float _765 = _763 + (-0.0);
        _673 = _413;
        _675 = _755;
        _677 = _415;
        _679 = _761;
        _681 = _759;
        _683 = _743;
        _685 = _411;
        _687 = _745;
        _689 = _747;
        _691 = _765;
        _693 = _753;
        _695 = _749;
        _697 = _421;
        _699 = _419;
    }
    _701 = false;
    float _767 = _673;
    float _769 = _675;
    float _771 = _677;
    float _773 = _679;
    float _775 = _681;
    float _777 = _683;
    float _779 = _685;
    float _781 = _687;
    float _783 = _689;
    float _785 = _691;
    float _787 = _693;
    float _789 = _695;
    float _791 = _697;
    float _793 = _699;
    float _795 = _425;
    bool _797 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _799 = _767 * _769;
    float _801 = _771 * _773;
    float _803 = _771 * _775;
    float _805 = _771 * _777;
    float _807 = _779 * _781;
    float _809 = _779 * _783;
    float _811 = _779 * _785;
    float _813 = _767 * _787;
    float _815 = _767 * _789;
    int _817 = _66 * 112;
    bool _819 = !_797;
    float _1137;
    float _1139;
    float _1141;
    float _1143;
    float _1145;
    float _1147;
    float _1149;
    float _1151;
    float _1153;
    float _1155;
    float _1157;
    float _1159;
    if (!_819)
    {
        int _821 = 0;
        float _823 = _807;
        float _825 = _813;
        float _827 = _801;
        float _829 = _795;
        float _831 = _809;
        float _833 = _799;
        float _835 = _803;
        float _837 = _793;
        float _839 = _811;
        float _841 = _815;
        float _843 = _805;
        float _845 = _791;
        bool _847;
        int _895;
        int _905;
        int _915;
        int _925;
        int _935;
        int _945;
        int _955;
        int _965;
        int _975;
        int _985;
        int _995;
        int _1005;
        int _1113;
        int _1117;
        int _1119;
        int _1123;
        float _1125;
        int _1127;
        float _1131;
        int _1133;
        int _1135;
        do
        {
            int _849 = _821;
            int _851 = as_type<int>(_823);
            int _853 = as_type<int>(_825);
            int _855 = as_type<int>(_827);
            int _857 = as_type<int>(_829);
            int _859 = as_type<int>(_831);
            int _861 = as_type<int>(_833);
            float _863 = _835;
            int _865 = as_type<int>(_837);
            int _867 = as_type<int>(_839);
            float _869 = _841;
            int _871 = as_type<int>(_843);
            int _873 = as_type<int>(_845);
            uint _875 = uint(int(uint(_817) >> uint(2)));
            uint _877 = uint(int(uint(int(_875)) >> uint(2)));
            int _879 = int(_875) & 3;
            float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
            bool _883 = _66 != 0;
            int _885 = _849 + 1;
            bool _887 = uint(_885) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _889 = _851;
            int _891 = as_type<int>(_881);
            int _893 = 31;
            int _2634 = _56(_889, _891, _893, _895, gl_SubgroupInvocationID);
            int _897 = _2634;
            int _899 = _853;
            int _901 = as_type<int>(_881);
            int _903 = 31;
            int _2638 = _56(_899, _901, _903, _905, gl_SubgroupInvocationID);
            int _907 = _2638;
            int _909 = _855;
            int _911 = as_type<int>(_881);
            int _913 = 31;
            int _2642 = _56(_909, _911, _913, _915, gl_SubgroupInvocationID);
            int _917 = _2642;
            int _919 = _857;
            int _921 = as_type<int>(_881);
            int _923 = 31;
            int _2646 = _56(_919, _921, _923, _925, gl_SubgroupInvocationID);
            int _927 = _2646;
            int _929 = _859;
            int _931 = as_type<int>(_881);
            int _933 = 31;
            int _2650 = _56(_929, _931, _933, _935, gl_SubgroupInvocationID);
            int _937 = _2650;
            int _939 = _861;
            int _941 = as_type<int>(_881);
            int _943 = 31;
            int _2654 = _56(_939, _941, _943, _945, gl_SubgroupInvocationID);
            int _947 = _2654;
            int _949 = as_type<int>(_863);
            int _951 = as_type<int>(_881);
            int _953 = 31;
            int _2659 = _56(_949, _951, _953, _955, gl_SubgroupInvocationID);
            int _957 = _2659;
            int _959 = _865;
            int _961 = as_type<int>(_881);
            int _963 = 31;
            int _2663 = _56(_959, _961, _963, _965, gl_SubgroupInvocationID);
            int _967 = _2663;
            int _969 = _867;
            int _971 = as_type<int>(_881);
            int _973 = 31;
            int _2667 = _56(_969, _971, _973, _975, gl_SubgroupInvocationID);
            int _977 = _2667;
            int _979 = as_type<int>(_869);
            int _981 = as_type<int>(_881);
            int _983 = 31;
            int _2672 = _56(_979, _981, _983, _985, gl_SubgroupInvocationID);
            int _987 = _2672;
            int _989 = _871;
            int _991 = as_type<int>(_881);
            int _993 = 31;
            int _2676 = _56(_989, _991, _993, _995, gl_SubgroupInvocationID);
            int _997 = _2676;
            int _999 = _873;
            int _1001 = as_type<int>(_881);
            int _1003 = 31;
            int _2680 = _56(_999, _1001, _1003, _1005, gl_SubgroupInvocationID);
            int _1007 = _2680;
            bool _1009 = !_883;
            _821 = _885;
            int _1011 = _851;
            int _1013 = _853;
            int _1015 = _855;
            int _1017 = _857;
            int _1019 = _859;
            int _1021 = _861;
            float _1023 = _863;
            int _1025 = _865;
            int _1027 = _867;
            float _1029 = _869;
            int _1031 = _871;
            int _1033 = _873;
            if (!_1009)
            {
                float _1035 = _809 * as_type<float>(_907);
                float _1037 = _799 * as_type<float>(_907);
                float _1039 = _803 * as_type<float>(_947);
                float _1041 = _803 * as_type<float>(_907);
                float _1043 = fma(_807, as_type<float>(_897), _1035);
                float _1045 = fma(_813, as_type<float>(_897), _1037);
                float _1047 = _809 * as_type<float>(_947);
                float _1049 = _799 * as_type<float>(_947);
                float _1051 = as_type<float>(_907) * _793;
                float _1053 = as_type<float>(_947) * _793;
                float _1055 = fma(_807, as_type<float>(_937), _1047);
                float _1057 = fma(_813, as_type<float>(_937), _1049);
                float _1059 = fma(_801, as_type<float>(_937), _1039);
                float _1061 = _809 * as_type<float>(_987);
                float _1063 = _799 * as_type<float>(_987);
                float _1065 = _803 * as_type<float>(_987);
                float _1067 = as_type<float>(_987) * _793;
                float _1069 = fma(_801, as_type<float>(_897), _1041);
                float _1071 = fma(as_type<float>(_897), _795, _1051);
                float _1073 = fma(as_type<float>(_937), _795, _1053);
                float _1075 = fma(_807, as_type<float>(_977), _1061);
                float _1077 = fma(_813, as_type<float>(_977), _1063);
                float _1079 = fma(_801, as_type<float>(_977), _1065);
                float _1081 = fma(as_type<float>(_977), _795, _1067);
                float _1083 = fma(_805, as_type<float>(_917), _1069);
                float _1085 = fma(_811, as_type<float>(_917), _1043);
                float _1087 = fma(_815, as_type<float>(_917), _1045);
                float _1089 = fma(_811, as_type<float>(_957), _1055);
                float _1091 = fma(_815, as_type<float>(_957), _1057);
                float _1093 = fma(_805, as_type<float>(_957), _1059);
                float _1095 = fma(as_type<float>(_917), _791, _1071);
                float _1097 = fma(as_type<float>(_957), _791, _1073);
                float _1099 = fma(as_type<float>(_997), _791, _1081);
                float _1101 = fma(_811, as_type<float>(_997), _1075);
                float _1103 = fma(_815, as_type<float>(_997), _1077);
                float _1105 = fma(_805, as_type<float>(_997), _1079);
                float _1107 = as_type<float>(_927) + _1095;
                float _1109 = as_type<float>(_967) + _1097;
                float _1111 = as_type<float>(_1007) + _1099;
                _1011 = as_type<int>(_1085);
                _1013 = as_type<int>(_1087);
                _1015 = as_type<int>(_1083);
                _1017 = as_type<int>(_1107);
                _1019 = as_type<int>(_1089);
                _1021 = as_type<int>(_1091);
                _1023 = _1093;
                _1025 = as_type<int>(_1109);
                _1027 = as_type<int>(_1101);
                _1029 = _1103;
                _1031 = as_type<int>(_1105);
                _1033 = as_type<int>(_1111);
            }
            _1113 = _1011;
            int _1115 = _1013;
            _1117 = _1015;
            _1119 = _1017;
            int _1121 = _1019;
            _1123 = _1021;
            _1125 = _1023;
            _1127 = _1025;
            int _1129 = _1027;
            _1131 = _1029;
            _1133 = _1031;
            _1135 = _1033;
            _847 = !_887;
            _823 = as_type<float>(_1113);
            _825 = as_type<float>(_1115);
            _827 = as_type<float>(_1117);
            _829 = as_type<float>(_1119);
            _831 = as_type<float>(_1121);
            _833 = as_type<float>(_1123);
            _835 = _1125;
            _837 = as_type<float>(_1127);
            _839 = as_type<float>(_1129);
            _841 = _1131;
            _843 = as_type<float>(_1133);
            _845 = as_type<float>(_1135);
            _1137 = as_type<float>(_1115);
            _1139 = as_type<float>(_1121);
            _1141 = as_type<float>(_1129);
        } while (_847);
        _1143 = as_type<float>(_1123);
        _1145 = _1131;
        _1147 = as_type<float>(_1113);
        _1149 = _1125;
        _1151 = as_type<float>(_1127);
        _1153 = as_type<float>(_1117);
        _1155 = as_type<float>(_1133);
        _1157 = as_type<float>(_1119);
        _1159 = as_type<float>(_1135);
        _1161 = true;
    }
    else
    {
        _1137 = _813;
        _1143 = _799;
        _1145 = _815;
        _1147 = _807;
        _1139 = _809;
        _1141 = _811;
        _1149 = _803;
        _1151 = _793;
        _1153 = _801;
        _1155 = _805;
        _1157 = _795;
        _1159 = _791;
    }
    _1161 = false;
    float _1163 = _1137;
    float _1165 = _1143;
    float _1167 = _1145;
    float _1169 = _1147;
    float _1171 = _1139;
    float _1173 = _1141;
    float _1175 = _1149;
    float _1177 = _1151;
    float _1179 = _1153;
    float _1181 = _1155;
    float _1183 = _1157;
    float _1185 = _1159;
    int _1187 = _817 + 80;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.cp_c6)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.cp_c6)._m0[int(_1199)][_1201];
    int _1205 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1207 = _1205 + _66;
    int _1209 = _817 + 64;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.cp_c6)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.cp_c6)._m0[int(_1221)][_1223];
    int _1227 = _1207 * 48;
    int _1229 = _817 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.cp_c6)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.cp_c6)._m0[int(_1241)][_1243];
    int _1247 = _817 + 72;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    uint _1251 = uint(int(uint(int(_1249)) >> uint(2)));
    int _1253 = int(_1249) & 3;
    float _1255 = (*spvDescriptorSet0.cp_c6)._m0[int(_1251)][_1253];
    int _1257 = int(_1249) + 1;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    int _1261 = _1257 & 3;
    float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
    int _1265 = _817 + 104;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.cp_c6)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.cp_c6)._m0[int(_1277)][_1279];
    int _1283 = _817 + 96;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.cp_c6)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.cp_c6)._m0[int(_1295)][_1297];
    float _1301 = _1163 * _1195;
    float _1303 = _1165 * _1195;
    float _1305 = _1167 * _1195;
    int _1307 = _817 + 16;
    uint _1309 = uint(int(uint(_1307) >> uint(2)));
    uint _1311 = uint(int(uint(int(_1309)) >> uint(2)));
    int _1313 = int(_1309) & 3;
    float _1315 = (*spvDescriptorSet0.cp_c6)._m0[int(_1311)][_1313];
    int _1317 = int(_1309) + 1;
    uint _1319 = uint(int(uint(_1317) >> uint(2)));
    int _1321 = _1317 & 3;
    float _1323 = (*spvDescriptorSet0.cp_c6)._m0[int(_1319)][_1321];
    float _1325 = _1167 * _1203;
    float _1327 = fma(_1169, _1217, _1301);
    float _1329 = fma(_1171, _1217, _1303);
    float _1331 = fma(_1173, _1217, _1305);
    float _1333 = _1163 * _1203;
    int _1335 = _817 + 32;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    uint _1339 = uint(int(uint(int(_1337)) >> uint(2)));
    int _1341 = int(_1337) & 3;
    float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
    int _1345 = int(_1337) + 1;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    int _1349 = _1345 & 3;
    float _1351 = (*spvDescriptorSet0.cp_c6)._m0[int(_1347)][_1349];
    float _1353 = _1165 * _1203;
    float _1355 = fma(_1173, _1225, _1325);
    float _1357 = fma(_1169, _1225, _1333);
    float _1359 = _1163 * _1237;
    float _1361 = _1163 * _1245;
    float _1363 = _1165 * _1237;
    float _1365 = _1165 * _1245;
    int _1367 = _817 + 48;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
    int _1373 = int(_1369) & 3;
    float _1375 = (*spvDescriptorSet0.cp_c6)._m0[int(_1371)][_1373];
    int _1377 = int(_1369) + 1;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    int _1381 = _1377 & 3;
    float _1383 = (*spvDescriptorSet0.cp_c6)._m0[int(_1379)][_1381];
    float _1385 = _1167 * _1237;
    float _1387 = _1167 * _1245;
    float _1389 = fma(_1171, _1225, _1353);
    float _1391 = fma(_1169, _1255, _1359);
    float _1393 = fma(_1169, _1263, _1361);
    float _1395 = fma(_1171, _1255, _1363);
    float _1397 = fma(_1171, _1263, _1365);
    int _1399 = _817 + 24;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.cp_c6)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.cp_c6)._m0[int(_1411)][_1413];
    float _1417 = fma(_1173, _1255, _1385);
    float _1419 = fma(_1173, _1263, _1387);
    float _1421 = fma(_1175, _1281, _1397);
    int _1423 = _817 + 40;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.cp_c6)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.cp_c6)._m0[int(_1435)][_1437];
    float _1441 = _1421 + _1177;
    float _1443 = fma(_1179, _1291, _1327);
    float _1445 = fma(_1175, _1291, _1329);
    float _1447 = fma(_1181, _1291, _1331);
    float _1449 = fma(_1179, _1299, _1357);
    int _1451 = _817 + 56;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.cp_c6)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    float _1469 = fma(_1179, _1273, _1391);
    float _1471 = fma(_1179, _1281, _1393);
    float _1473 = fma(_1181, _1281, _1419);
    float _1475 = fma(_1175, _1299, _1389);
    float _1477 = fma(_1175, _1273, _1395);
    float _1479 = fma(_1181, _1273, _1417);
    float _1481 = _1471 + _1183;
    float _1483 = _1473 + _1185;
    float _1485 = _1441 * _1323;
    float _1487 = _1445 * _1323;
    float _1489 = _1475 * _1323;
    float _1491 = _1477 * _1323;
    float _1493 = fma(_1481, _1315, _1485);
    float _1495 = fma(_1443, _1315, _1487);
    float _1497 = fma(_1449, _1315, _1489);
    float _1499 = _1441 * _1351;
    float _1501 = fma(_1469, _1315, _1491);
    float _1503 = _1445 * _1351;
    float _1505 = fma(_1181, _1299, _1355);
    float _1507 = _1475 * _1351;
    float _1509 = _1477 * _1351;
    float _1511 = fma(_1481, _1343, _1499);
    float _1513 = fma(_1443, _1343, _1503);
    float _1515 = _1441 * _1383;
    float _1517 = _1445 * _1383;
    float _1519 = _1475 * _1383;
    float _1521 = _1477 * _1383;
    float _1523 = fma(_1481, _1375, _1515);
    float _1525 = fma(_1449, _1343, _1507);
    float _1527 = fma(_1469, _1343, _1509);
    float _1529 = fma(_1443, _1375, _1517);
    float _1531 = fma(_1483, _1407, _1493);
    float _1533 = fma(_1449, _1375, _1519);
    float _1535 = fma(_1469, _1375, _1521);
    float _1537 = fma(_1447, _1407, _1495);
    float _1539 = _1531 + _1415;
    float _1541 = fma(_1505, _1407, _1497);
    float _1543 = fma(_1479, _1407, _1501);
    float _1545 = fma(_1483, _1431, _1511);
    float _1547 = fma(_1447, _1431, _1513);
    float _1549 = fma(_1505, _1431, _1525);
    int _1551 = _1227 + 16;
    float _1553 = fma(_1479, _1431, _1527);
    float _1555 = _1545 + _1439;
    int _1557 = _1227 + 32;
    float _1559 = fma(_1483, _1459, _1523);
    float _1561 = fma(_1447, _1459, _1529);
    float _1563 = fma(_1505, _1459, _1533);
    float _1565 = fma(_1479, _1459, _1535);
    float _1567 = _1559 + _1467;
    int _1569 = _1227 + 48;
    uint _1571 = uint(int(uint(_1551) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1571)] = as_type<uint>(_1537);
    int _1573 = _1551 + 4;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1575)] = as_type<uint>(_1541);
    int _1577 = _1551 + 8;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1579)] = as_type<uint>(_1543);
    int _1581 = _1551 + 12;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1583)] = as_type<uint>(_1539);
    uint _1585 = uint(int(uint(_1557) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1585)] = as_type<uint>(_1547);
    int _1587 = _1557 + 4;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1589)] = as_type<uint>(_1549);
    int _1591 = _1557 + 8;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1593)] = as_type<uint>(_1553);
    int _1595 = _1557 + 12;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1597)] = as_type<uint>(_1555);
    uint _1599 = uint(int(uint(_1569) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1599)] = as_type<uint>(_1561);
    int _1601 = _1569 + 4;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1603)] = as_type<uint>(_1563);
    int _1605 = _1569 + 8;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1607)] = as_type<uint>(_1565);
    int _1609 = _1569 + 12;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1611)] = as_type<uint>(_1567);
}

