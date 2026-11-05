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
int _54(thread const int& _3477, thread const int& _3478, constant _10& support_buffer)
{
    int _3481 = 1 + _3478;
    float _3483 = support_buffer._m5[_3481].x;
    bool _3485 = _3483 == 1.0;
    if (_3485)
    {
        return _3477;
    }
    float _3487 = float(_3477);
    float _3489 = _3487 * _3483;
    int _3491 = int(_3489);
    return _3491;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3513, thread const int& _3514, thread const int& _3515, thread int& _3516, thread uint& gl_SubgroupInvocationID)
{
    int _3519 = _3515 & 31;
    uint _3521 = uint(int(uint(_3515) >> uint(8)));
    int _3523 = int(_3521) & 31;
    float _3525 = as_type<float>(gl_SubgroupInvocationID);
    int _3527 = as_type<int>(_3525) & _3523;
    int _3529 = ~_3523;
    int _3531 = _3519 & _3529;
    int _3533 = _3531 | _3527;
    int _3535 = ~_3523;
    int _3537 = _3514 & _3535;
    int _3539 = _3537 | _3527;
    bool _3541 = uint(_3539) <= uint(_3533);
    _3516 = _3541 ? (-1) : 0;
    float _3543 = spvSubgroupShuffle(as_type<float>(_3513), uint(_3539));
    uint _3545 = uint(_3541 ? as_type<int>(_3543) : _3513);
    return int(_3545);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1037 = false;
    bool _571 = false;
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
    int _129 = as_type<int>(_119);
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
        int3 _1695 = int3(_179, _185, as_type<int>(_147));
        float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1695.xy), uint(_1695.z), 0).xyz;
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
        int3 _1723 = int3(_213, _219, 0);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1723.xy), uint(_1723.z), 0).xyz;
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
        int3 _1754 = int3(_245, _251, as_type<int>(_151));
        float3 _253 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1754.xy), uint(_1754.z), 0).xyz;
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
        int3 _1782 = int3(_277, _283, 0);
        float3 _285 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1782.xy), uint(_1782.z), 0).xyz;
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
        int3 _1811 = int3(_309, _315, as_type<int>(_165));
        float3 _317 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1811.xy), uint(_1811.z), 0).xyz;
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
        int3 _1878 = int3(_389, _395, 2);
        float3 _397 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1878.xy), uint(_1878.z), 0).xyz;
        float _399 = _397.x;
        float _401 = _397.y;
        float _403 = _397.z;
        _363 = _325;
        _371 = _329;
        _373 = _327;
        _343 = _293;
        _353 = _297;
        _381 = _399;
        _383 = _401;
        _355 = _403;
        _345 = _295;
    }
    float _405 = _363;
    float _407 = _371;
    float _409 = _373;
    float _411 = _343;
    float _413 = _353;
    float _415 = _381;
    float _417 = _383;
    float _419 = _355;
    float _421 = _345;
    bool _423 = !_123;
    float _425 = _417;
    float _543;
    float _545;
    float _547;
    float _549;
    float _551;
    float _553;
    float _555;
    float _557;
    float _559;
    float _561;
    float _563;
    float _565;
    float _567;
    float _569;
    if (!_423)
    {
        int _427 = _99 + 28;
        uint _429 = uint(int(uint(_427) >> uint(2)));
        uint _431 = uint(int(uint(int(_429)) >> uint(2)));
        int _433 = int(_429) & 3;
        float _435 = (*spvDescriptorSet0.cp_c5)._m0[int(_431)][_433];
        int _437 = _99 + 20;
        uint _439 = uint(int(uint(_437) >> uint(2)));
        uint _441 = uint(int(uint(int(_439)) >> uint(2)));
        int _443 = int(_439) & 3;
        float _445 = (*spvDescriptorSet0.cp_c5)._m0[int(_441)][_443];
        float _447 = _197 * _435;
        float _449 = _201 * _435;
        float _451 = _199 * _435;
        float _453 = _229 * _435;
        float _455 = _261 * _435;
        float _457 = _233 * _435;
        float _459 = _265 * _435;
        float _461 = _231 * _435;
        float _463 = fma(_405, _445, _447);
        float _465 = fma(_407, _445, _449);
        float _467 = fma(_409, _445, _451);
        float _469 = fma(_411, _445, _453);
        float _471 = _463 * 0.15915493667125701904296875;
        float _473 = _465 * 0.15915493667125701904296875;
        float _475 = _467 * 0.15915493667125701904296875;
        float _477 = _263 * _435;
        float _479 = _471 * 6.283185482025146484375;
        float _481 = sin(_479);
        float _483 = fma(_413, _445, _457);
        float _485 = fma(_415, _445, _455);
        float _487 = fma(_417, _445, _477);
        float _489 = fma(_419, _445, _459);
        float _491 = _471 * 6.283185482025146484375;
        float _493 = cos(_491);
        float _495 = _473 * 6.283185482025146484375;
        float _497 = sin(_495);
        float _499 = fma(_421, _445, _461);
        float _501 = _475 * 6.283185482025146484375;
        float _503 = sin(_501);
        float _505 = _473 * 6.283185482025146484375;
        float _507 = cos(_505);
        float _509 = _497 * _493;
        float _511 = _475 * 6.283185482025146484375;
        float _513 = cos(_511);
        float _515 = _481 * _503;
        float _517 = _481 * _507;
        float _519 = _493 * _507;
        float _521 = _493 * _513;
        float _523 = _481 * _497;
        float _525 = _513 * _507;
        float _527 = _497 * _513;
        float _529 = _481 * _513;
        float _531 = -_509;
        float _533 = fma(_507, _515, _531);
        float _535 = fma(_497, _515, _519);
        float _537 = fma(_503, _519, _523);
        float _539 = -_517;
        float _541 = fma(_503, _509, _539);
        _543 = _469;
        _545 = _525;
        _547 = _503;
        _549 = _499;
        _551 = _535;
        _553 = _483;
        _555 = _537;
        _557 = _541;
        _559 = _521;
        _561 = _527;
        _563 = _533;
        _565 = _529;
        _567 = _489;
        _425 = _487;
        _569 = _485;
        _571 = true;
    }
    else
    {
        float _573 = _405 * 0.15915493667125701904296875;
        float _575 = _407 * 0.15915493667125701904296875;
        float _577 = _409 * 0.15915493667125701904296875;
        float _579 = _573 * 6.283185482025146484375;
        float _581 = sin(_579);
        float _583 = _573 * 6.283185482025146484375;
        float _585 = cos(_583);
        float _587 = _575 * 6.283185482025146484375;
        float _589 = sin(_587);
        float _591 = _575 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = _577 * 6.283185482025146484375;
        float _597 = cos(_595);
        float _599 = _589 * _585;
        float _601 = _581 * _589;
        float _603 = _577 * 6.283185482025146484375;
        float _605 = sin(_603);
        float _607 = _585 * _593;
        float _609 = _585 * _597;
        float _611 = _597 * _593;
        float _613 = _589 * _597;
        float _615 = _581 * _597;
        float _617 = _581 * _593;
        float _619 = _581 * _605;
        float _621 = -_617;
        float _623 = fma(_605, _599, _621);
        float _625 = -_599;
        float _627 = fma(_593, _619, _625);
        float _629 = fma(_589, _619, _607);
        float _631 = fma(_605, _607, _601);
        _543 = _411;
        _545 = _611;
        _547 = _605;
        _549 = _421;
        _551 = _629;
        _553 = _413;
        _555 = _631;
        _557 = _623;
        _559 = _609;
        _561 = _613;
        _563 = _627;
        _565 = _615;
        _567 = _419;
        _569 = _415;
    }
    _571 = false;
    float _633 = _543;
    float _635 = _545;
    float _637 = _547;
    float _639 = _549;
    float _641 = _551;
    float _643 = _553;
    float _645 = _555;
    float _647 = _557;
    float _649 = _559;
    float _651 = _561;
    float _653 = _563;
    float _655 = _565;
    float _657 = _567;
    float _659 = _425;
    float _661 = _569;
    bool _663 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _665 = _633 * _635;
    float _667 = _633 * _637;
    float _669 = _639 * _641;
    float _671 = _643 * _645;
    float _673 = _643 * _647;
    float _675 = _643 * _649;
    float _677 = _633 * _651;
    float _679 = _639 * _653;
    float _681 = _639 * _655;
    int _683 = _66 * 112;
    bool _685 = !_663;
    float _1013;
    float _1015;
    float _1017;
    float _1019;
    float _1021;
    float _1023;
    float _1025;
    float _1027;
    float _1029;
    float _1031;
    float _1033;
    float _1035;
    if (!_685)
    {
        float _687 = -_667;
        float _689 = _687 + (-0.0);
        int _691 = 0;
        float _693 = _665;
        float _695 = _679;
        float _697 = _671;
        float _699 = _661;
        float _701 = _677;
        float _703 = _669;
        float _705 = _673;
        float _707 = _659;
        float _709 = _689;
        float _711 = _681;
        float _713 = _675;
        float _715 = _657;
        bool _717;
        int _765;
        int _775;
        int _785;
        int _795;
        int _805;
        int _815;
        int _825;
        int _835;
        int _845;
        int _855;
        int _865;
        int _875;
        int _989;
        int _993;
        int _995;
        int _999;
        float _1001;
        int _1003;
        float _1007;
        int _1009;
        int _1011;
        do
        {
            int _719 = _691;
            int _721 = as_type<int>(_693);
            int _723 = as_type<int>(_695);
            int _725 = as_type<int>(_697);
            int _727 = as_type<int>(_699);
            int _729 = as_type<int>(_701);
            int _731 = as_type<int>(_703);
            float _733 = _705;
            int _735 = as_type<int>(_707);
            int _737 = as_type<int>(_709);
            float _739 = _711;
            int _741 = as_type<int>(_713);
            int _743 = as_type<int>(_715);
            uint _745 = uint(int(uint(_683) >> uint(2)));
            uint _747 = uint(int(uint(int(_745)) >> uint(2)));
            int _749 = int(_745) & 3;
            float _751 = (*spvDescriptorSet0.cp_c6)._m0[int(_747)][_749];
            bool _753 = _66 != 0;
            int _755 = _719 + 1;
            bool _757 = uint(_755) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _759 = _721;
            int _761 = as_type<int>(_751);
            int _763 = 31;
            int _2325 = _56(_759, _761, _763, _765, gl_SubgroupInvocationID);
            int _767 = _2325;
            int _769 = _723;
            int _771 = as_type<int>(_751);
            int _773 = 31;
            int _2329 = _56(_769, _771, _773, _775, gl_SubgroupInvocationID);
            int _777 = _2329;
            int _779 = _725;
            int _781 = as_type<int>(_751);
            int _783 = 31;
            int _2333 = _56(_779, _781, _783, _785, gl_SubgroupInvocationID);
            int _787 = _2333;
            int _789 = _727;
            int _791 = as_type<int>(_751);
            int _793 = 31;
            int _2337 = _56(_789, _791, _793, _795, gl_SubgroupInvocationID);
            int _797 = _2337;
            int _799 = _729;
            int _801 = as_type<int>(_751);
            int _803 = 31;
            int _2341 = _56(_799, _801, _803, _805, gl_SubgroupInvocationID);
            int _807 = _2341;
            int _809 = _731;
            int _811 = as_type<int>(_751);
            int _813 = 31;
            int _2345 = _56(_809, _811, _813, _815, gl_SubgroupInvocationID);
            int _817 = _2345;
            int _819 = as_type<int>(_733);
            int _821 = as_type<int>(_751);
            int _823 = 31;
            int _2350 = _56(_819, _821, _823, _825, gl_SubgroupInvocationID);
            int _827 = _2350;
            int _829 = _735;
            int _831 = as_type<int>(_751);
            int _833 = 31;
            int _2354 = _56(_829, _831, _833, _835, gl_SubgroupInvocationID);
            int _837 = _2354;
            int _839 = _737;
            int _841 = as_type<int>(_751);
            int _843 = 31;
            int _2358 = _56(_839, _841, _843, _845, gl_SubgroupInvocationID);
            int _847 = _2358;
            int _849 = as_type<int>(_739);
            int _851 = as_type<int>(_751);
            int _853 = 31;
            int _2363 = _56(_849, _851, _853, _855, gl_SubgroupInvocationID);
            int _857 = _2363;
            int _859 = _741;
            int _861 = as_type<int>(_751);
            int _863 = 31;
            int _2367 = _56(_859, _861, _863, _865, gl_SubgroupInvocationID);
            int _867 = _2367;
            int _869 = _743;
            int _871 = as_type<int>(_751);
            int _873 = 31;
            int _2371 = _56(_869, _871, _873, _875, gl_SubgroupInvocationID);
            int _877 = _2371;
            bool _879 = !_753;
            _691 = _755;
            int _881 = _721;
            int _883 = _723;
            int _885 = _725;
            int _887 = _727;
            int _889 = _729;
            int _891 = _731;
            float _893 = _733;
            int _895 = _735;
            int _897 = _737;
            float _899 = _739;
            int _901 = _741;
            int _903 = _743;
            if (!_879)
            {
                float _905 = _677 * as_type<float>(_777);
                float _907 = _669 * as_type<float>(_777);
                float _909 = _673 * as_type<float>(_817);
                float _911 = _673 * as_type<float>(_777);
                float _913 = fma(_665, as_type<float>(_767), _905);
                float _915 = fma(_679, as_type<float>(_767), _907);
                float _917 = _677 * as_type<float>(_817);
                float _919 = _669 * as_type<float>(_817);
                float _921 = as_type<float>(_777) * _659;
                float _923 = as_type<float>(_817) * _659;
                float _925 = fma(_665, as_type<float>(_807), _917);
                float _927 = fma(_679, as_type<float>(_807), _919);
                float _929 = fma(_671, as_type<float>(_807), _909);
                float _931 = _677 * as_type<float>(_857);
                float _933 = _669 * as_type<float>(_857);
                float _935 = _673 * as_type<float>(_857);
                float _937 = as_type<float>(_857) * _659;
                float _939 = fma(_671, as_type<float>(_767), _911);
                float _941 = fma(as_type<float>(_767), _661, _921);
                float _943 = fma(as_type<float>(_807), _661, _923);
                float _945 = fma(_665, as_type<float>(_847), _931);
                float _947 = fma(_679, as_type<float>(_847), _933);
                float _949 = fma(_671, as_type<float>(_847), _935);
                float _951 = fma(as_type<float>(_847), _661, _937);
                float _953 = fma(_675, as_type<float>(_787), _939);
                float _955 = -_667;
                float _957 = fma(_955, as_type<float>(_787), _913);
                float _959 = fma(_681, as_type<float>(_787), _915);
                float _961 = -_667;
                float _963 = fma(_961, as_type<float>(_827), _925);
                float _965 = fma(_681, as_type<float>(_827), _927);
                float _967 = fma(_675, as_type<float>(_827), _929);
                float _969 = fma(as_type<float>(_787), _657, _941);
                float _971 = fma(as_type<float>(_827), _657, _943);
                float _973 = fma(as_type<float>(_867), _657, _951);
                float _975 = -_667;
                float _977 = fma(_975, as_type<float>(_867), _945);
                float _979 = fma(_681, as_type<float>(_867), _947);
                float _981 = fma(_675, as_type<float>(_867), _949);
                float _983 = as_type<float>(_797) + _969;
                float _985 = as_type<float>(_837) + _971;
                float _987 = as_type<float>(_877) + _973;
                _881 = as_type<int>(_957);
                _883 = as_type<int>(_959);
                _885 = as_type<int>(_953);
                _887 = as_type<int>(_983);
                _889 = as_type<int>(_963);
                _891 = as_type<int>(_965);
                _893 = _967;
                _895 = as_type<int>(_985);
                _897 = as_type<int>(_977);
                _899 = _979;
                _901 = as_type<int>(_981);
                _903 = as_type<int>(_987);
            }
            _989 = _881;
            int _991 = _883;
            _993 = _885;
            _995 = _887;
            int _997 = _889;
            _999 = _891;
            _1001 = _893;
            _1003 = _895;
            int _1005 = _897;
            _1007 = _899;
            _1009 = _901;
            _1011 = _903;
            _717 = !_757;
            _693 = as_type<float>(_989);
            _695 = as_type<float>(_991);
            _697 = as_type<float>(_993);
            _699 = as_type<float>(_995);
            _701 = as_type<float>(_997);
            _703 = as_type<float>(_999);
            _705 = _1001;
            _707 = as_type<float>(_1003);
            _709 = as_type<float>(_1005);
            _711 = _1007;
            _713 = as_type<float>(_1009);
            _715 = as_type<float>(_1011);
            _1013 = as_type<float>(_991);
            _1015 = as_type<float>(_997);
            _1017 = as_type<float>(_1005);
        } while (_717);
        _1019 = as_type<float>(_999);
        _1021 = _1007;
        _1023 = as_type<float>(_989);
        _1025 = _1001;
        _1027 = as_type<float>(_1003);
        _1029 = as_type<float>(_993);
        _1031 = as_type<float>(_1009);
        _1033 = as_type<float>(_995);
        _1035 = as_type<float>(_1011);
        _1037 = true;
    }
    else
    {
        float _1039 = -_667;
        float _1041 = _1039 + (-0.0);
        _1013 = _679;
        _1019 = _669;
        _1021 = _681;
        _1023 = _665;
        _1015 = _677;
        _1017 = _1041;
        _1025 = _673;
        _1027 = _659;
        _1029 = _671;
        _1031 = _675;
        _1033 = _661;
        _1035 = _657;
    }
    _1037 = false;
    float _1043 = _1013;
    float _1045 = _1019;
    float _1047 = _1021;
    float _1049 = _1023;
    float _1051 = _1015;
    float _1053 = _1017;
    float _1055 = _1025;
    float _1057 = _1027;
    float _1059 = _1029;
    float _1061 = _1031;
    float _1063 = _1033;
    float _1065 = _1035;
    int _1067 = _683 + 80;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    uint _1071 = uint(int(uint(int(_1069)) >> uint(2)));
    int _1073 = int(_1069) & 3;
    float _1075 = (*spvDescriptorSet0.cp_c6)._m0[int(_1071)][_1073];
    int _1077 = int(_1069) + 1;
    uint _1079 = uint(int(uint(_1077) >> uint(2)));
    int _1081 = _1077 & 3;
    float _1083 = (*spvDescriptorSet0.cp_c6)._m0[int(_1079)][_1081];
    int _1085 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1087 = _1085 + _66;
    int _1089 = _683 + 64;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.cp_c6)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.cp_c6)._m0[int(_1101)][_1103];
    int _1107 = _1087 * 48;
    int _1109 = _683 + 88;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    uint _1113 = uint(int(uint(int(_1111)) >> uint(2)));
    int _1115 = int(_1111) & 3;
    float _1117 = (*spvDescriptorSet0.cp_c6)._m0[int(_1113)][_1115];
    int _1119 = int(_1111) + 1;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    int _1123 = _1119 & 3;
    float _1125 = (*spvDescriptorSet0.cp_c6)._m0[int(_1121)][_1123];
    int _1127 = _683 + 72;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    uint _1131 = uint(int(uint(int(_1129)) >> uint(2)));
    int _1133 = int(_1129) & 3;
    float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
    int _1137 = int(_1129) + 1;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    int _1141 = _1137 & 3;
    float _1143 = (*spvDescriptorSet0.cp_c6)._m0[int(_1139)][_1141];
    int _1145 = _683 + 104;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.cp_c6)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.cp_c6)._m0[int(_1157)][_1159];
    int _1163 = _683 + 96;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.cp_c6)._m0[int(_1167)][_1169];
    int _1173 = int(_1165) + 1;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    int _1177 = _1173 & 3;
    float _1179 = (*spvDescriptorSet0.cp_c6)._m0[int(_1175)][_1177];
    float _1181 = _1043 * _1075;
    float _1183 = _1045 * _1075;
    float _1185 = _1047 * _1075;
    int _1187 = _683 + 16;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.cp_c6)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.cp_c6)._m0[int(_1199)][_1201];
    float _1205 = _1047 * _1083;
    float _1207 = fma(_1049, _1097, _1181);
    float _1209 = fma(_1051, _1097, _1183);
    float _1211 = fma(_1053, _1097, _1185);
    float _1213 = _1043 * _1083;
    int _1215 = _683 + 32;
    uint _1217 = uint(int(uint(_1215) >> uint(2)));
    uint _1219 = uint(int(uint(int(_1217)) >> uint(2)));
    int _1221 = int(_1217) & 3;
    float _1223 = (*spvDescriptorSet0.cp_c6)._m0[int(_1219)][_1221];
    int _1225 = int(_1217) + 1;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    int _1229 = _1225 & 3;
    float _1231 = (*spvDescriptorSet0.cp_c6)._m0[int(_1227)][_1229];
    float _1233 = _1045 * _1083;
    float _1235 = fma(_1053, _1105, _1205);
    float _1237 = fma(_1049, _1105, _1213);
    float _1239 = _1043 * _1117;
    float _1241 = _1043 * _1125;
    float _1243 = _1045 * _1117;
    float _1245 = _1045 * _1125;
    int _1247 = _683 + 48;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    uint _1251 = uint(int(uint(int(_1249)) >> uint(2)));
    int _1253 = int(_1249) & 3;
    float _1255 = (*spvDescriptorSet0.cp_c6)._m0[int(_1251)][_1253];
    int _1257 = int(_1249) + 1;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    int _1261 = _1257 & 3;
    float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
    float _1265 = _1047 * _1117;
    float _1267 = _1047 * _1125;
    float _1269 = fma(_1051, _1105, _1233);
    float _1271 = fma(_1049, _1135, _1239);
    float _1273 = fma(_1049, _1143, _1241);
    float _1275 = fma(_1051, _1135, _1243);
    float _1277 = fma(_1051, _1143, _1245);
    int _1279 = _683 + 24;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    uint _1283 = uint(int(uint(int(_1281)) >> uint(2)));
    int _1285 = int(_1281) & 3;
    float _1287 = (*spvDescriptorSet0.cp_c6)._m0[int(_1283)][_1285];
    int _1289 = int(_1281) + 1;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    int _1293 = _1289 & 3;
    float _1295 = (*spvDescriptorSet0.cp_c6)._m0[int(_1291)][_1293];
    float _1297 = fma(_1053, _1135, _1265);
    float _1299 = fma(_1053, _1143, _1267);
    float _1301 = fma(_1055, _1161, _1277);
    int _1303 = _683 + 40;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    uint _1307 = uint(int(uint(int(_1305)) >> uint(2)));
    int _1309 = int(_1305) & 3;
    float _1311 = (*spvDescriptorSet0.cp_c6)._m0[int(_1307)][_1309];
    int _1313 = int(_1305) + 1;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    int _1317 = _1313 & 3;
    float _1319 = (*spvDescriptorSet0.cp_c6)._m0[int(_1315)][_1317];
    float _1321 = _1301 + _1057;
    float _1323 = fma(_1059, _1171, _1207);
    float _1325 = fma(_1055, _1171, _1209);
    float _1327 = fma(_1061, _1171, _1211);
    float _1329 = fma(_1059, _1179, _1237);
    int _1331 = _683 + 56;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    uint _1335 = uint(int(uint(int(_1333)) >> uint(2)));
    int _1337 = int(_1333) & 3;
    float _1339 = (*spvDescriptorSet0.cp_c6)._m0[int(_1335)][_1337];
    int _1341 = int(_1333) + 1;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    int _1345 = _1341 & 3;
    float _1347 = (*spvDescriptorSet0.cp_c6)._m0[int(_1343)][_1345];
    float _1349 = fma(_1059, _1153, _1271);
    float _1351 = fma(_1059, _1161, _1273);
    float _1353 = fma(_1061, _1161, _1299);
    float _1355 = fma(_1055, _1179, _1269);
    float _1357 = fma(_1055, _1153, _1275);
    float _1359 = fma(_1061, _1153, _1297);
    float _1361 = _1351 + _1063;
    float _1363 = _1353 + _1065;
    float _1365 = _1321 * _1203;
    float _1367 = _1325 * _1203;
    float _1369 = _1355 * _1203;
    float _1371 = _1357 * _1203;
    float _1373 = fma(_1361, _1195, _1365);
    float _1375 = fma(_1323, _1195, _1367);
    float _1377 = fma(_1329, _1195, _1369);
    float _1379 = _1321 * _1231;
    float _1381 = fma(_1349, _1195, _1371);
    float _1383 = _1325 * _1231;
    float _1385 = fma(_1061, _1179, _1235);
    float _1387 = _1355 * _1231;
    float _1389 = _1357 * _1231;
    float _1391 = fma(_1361, _1223, _1379);
    float _1393 = fma(_1323, _1223, _1383);
    float _1395 = _1321 * _1263;
    float _1397 = _1325 * _1263;
    float _1399 = _1355 * _1263;
    float _1401 = _1357 * _1263;
    float _1403 = fma(_1361, _1255, _1395);
    float _1405 = fma(_1329, _1223, _1387);
    float _1407 = fma(_1349, _1223, _1389);
    float _1409 = fma(_1323, _1255, _1397);
    float _1411 = fma(_1363, _1287, _1373);
    float _1413 = fma(_1329, _1255, _1399);
    float _1415 = fma(_1349, _1255, _1401);
    float _1417 = fma(_1327, _1287, _1375);
    float _1419 = _1411 + _1295;
    float _1421 = fma(_1385, _1287, _1377);
    float _1423 = fma(_1359, _1287, _1381);
    float _1425 = fma(_1363, _1311, _1391);
    float _1427 = fma(_1327, _1311, _1393);
    float _1429 = fma(_1385, _1311, _1405);
    int _1431 = _1107 + 16;
    float _1433 = fma(_1359, _1311, _1407);
    float _1435 = _1425 + _1319;
    int _1437 = _1107 + 32;
    float _1439 = fma(_1363, _1339, _1403);
    float _1441 = fma(_1327, _1339, _1409);
    float _1443 = fma(_1385, _1339, _1413);
    float _1445 = fma(_1359, _1339, _1415);
    float _1447 = _1439 + _1347;
    int _1449 = _1107 + 48;
    uint _1451 = uint(int(uint(_1431) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1451)] = as_type<uint>(_1417);
    int _1453 = _1431 + 4;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1455)] = as_type<uint>(_1421);
    int _1457 = _1431 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1459)] = as_type<uint>(_1423);
    int _1461 = _1431 + 12;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1463)] = as_type<uint>(_1419);
    uint _1465 = uint(int(uint(_1437) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1465)] = as_type<uint>(_1427);
    int _1467 = _1437 + 4;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1469)] = as_type<uint>(_1429);
    int _1471 = _1437 + 8;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1473)] = as_type<uint>(_1433);
    int _1475 = _1437 + 12;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1477)] = as_type<uint>(_1435);
    uint _1479 = uint(int(uint(_1449) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1479)] = as_type<uint>(_1441);
    int _1481 = _1449 + 4;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1483)] = as_type<uint>(_1443);
    int _1485 = _1449 + 8;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1487)] = as_type<uint>(_1445);
    int _1489 = _1449 + 12;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1491)] = as_type<uint>(_1447);
}

