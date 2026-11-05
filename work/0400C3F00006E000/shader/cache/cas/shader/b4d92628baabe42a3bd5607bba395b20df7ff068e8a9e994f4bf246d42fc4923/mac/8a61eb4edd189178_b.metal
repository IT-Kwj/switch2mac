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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _3898, thread const int& _3899, constant _10& support_buffer)
{
    int _3902 = 1 + _3899;
    float _3904 = support_buffer._m5[_3902].x;
    bool _3906 = _3904 == 1.0;
    if (_3906)
    {
        return _3898;
    }
    float _3908 = float(_3898);
    float _3910 = _3908 * _3904;
    int _3912 = int(_3910);
    return _3912;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3934, thread const int& _3935, thread const int& _3936, thread int& _3937, thread uint& gl_SubgroupInvocationID)
{
    int _3940 = _3936 & 31;
    uint _3942 = uint(int(uint(_3936) >> uint(8)));
    int _3944 = int(_3942) & 31;
    float _3946 = as_type<float>(gl_SubgroupInvocationID);
    int _3948 = as_type<int>(_3946) & _3944;
    int _3950 = ~_3944;
    int _3952 = _3940 & _3950;
    int _3954 = _3952 | _3948;
    int _3956 = ~_3944;
    int _3958 = _3935 & _3956;
    int _3960 = _3958 | _3948;
    bool _3962 = uint(_3960) <= uint(_3954);
    _3937 = _3962 ? (-1) : 0;
    float _3964 = spvSubgroupShuffle(as_type<float>(_3934), uint(_3960));
    uint _3966 = uint(_3962 ? as_type<int>(_3964) : _3934);
    return int(_3966);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1219 = false;
    bool _753 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _72 = _62;
    if (_70)
    {
        return;
    }
    int _74 = _66 & 31;
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
    int _99 = _78 ? _91 : _97;
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _99 & as_type<int>(_111);
    bool _115 = _113 != 0;
    if (!_115)
    {
        _72 = 0.0;
    }
    float _117 = _72;
    float _119 = 0.0;
    float _121 = 0.0;
    float _123 = _117;
    if (!_115)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _125 = _119;
    float _127 = _121;
    float _129 = 0.0;
    float _131 = 0.0;
    float _133 = _125;
    float _135 = _127;
    if (!_115)
    {
        _129 = 0.0;
        _131 = 0.0;
    }
    float _137 = _129;
    float _139 = _131;
    float _141 = 0.0;
    float _143 = _137;
    float _145 = _139;
    if (!_115)
    {
        _141 = 0.0;
    }
    float _147 = _141;
    float _149 = 0.0;
    float _151 = 0.0;
    float _153 = _147;
    if (!_115)
    {
        _149 = 0.0;
        _151 = 0.0;
    }
    float _155 = _149;
    float _157 = _151;
    float _159 = 0.0;
    float _161 = _155;
    float _163 = _157;
    if (!_115)
    {
        _159 = 0.0;
    }
    float _165 = _159;
    bool _167 = !_115;
    float _169 = _165;
    if (!_167)
    {
        uint _171 = uint(int(uint(_101) >> uint(2)));
        uint _173 = uint(int(uint(int(_171)) >> uint(2)));
        int _175 = int(_171) & 3;
        float _177 = (*spvDescriptorSet0.cp_c5)._m0[int(_173)][_175];
        int _179 = int(_171) + 1;
        uint _181 = uint(int(uint(_179) >> uint(2)));
        int _183 = _179 & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = _66;
        int _189 = 0;
        int _191 = _54(_187, _189, (*spvDescriptorSet0.support_buffer));
        int _193 = as_type<int>(_177);
        int _195 = 0;
        int _197 = _54(_193, _195, (*spvDescriptorSet0.support_buffer));
        int3 _1855 = int3(_191, _197, 1);
        float3 _201 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1855.xy), uint(_1855.z), 0).xyz;
        float _203 = _201.x;
        float _205 = _201.y;
        float _207 = _201.z;
        int _209 = _66;
        int _211 = 0;
        int _213 = _54(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = as_type<int>(_185);
        int _217 = 0;
        int _219 = _54(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _1873 = int3(_213, _219, 1);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1873.xy), uint(_1873.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        int _229 = _66;
        int _231 = 0;
        int _233 = _54(_229, _231, (*spvDescriptorSet0.support_buffer));
        int _235 = as_type<int>(_177);
        int _237 = 0;
        int _239 = _54(_235, _237, (*spvDescriptorSet0.support_buffer));
        int3 _1891 = int3(_233, _239, 0);
        float3 _241 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1891.xy), uint(_1891.z), 0).xyz;
        float _243 = _241.x;
        float _245 = _241.y;
        float _247 = _241.z;
        int _249 = _66;
        int _251 = 0;
        int _253 = _54(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = as_type<int>(_185);
        int _257 = 0;
        int _259 = _54(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1909 = int3(_253, _259, 0);
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1909.xy), uint(_1909.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        int _269 = _66;
        int _271 = 0;
        int _273 = _54(_269, _271, (*spvDescriptorSet0.support_buffer));
        int _275 = as_type<int>(_177);
        int _277 = 0;
        int _279 = _54(_275, _277, (*spvDescriptorSet0.support_buffer));
        int3 _1927 = int3(_273, _279, 2);
        float3 _281 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1927.xy), uint(_1927.z), 0).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        int _289 = _66;
        int _291 = 0;
        int _293 = _54(_289, _291, (*spvDescriptorSet0.support_buffer));
        int _295 = as_type<int>(_185);
        int _297 = 0;
        int _299 = _54(_295, _297, (*spvDescriptorSet0.support_buffer));
        int3 _1945 = int3(_293, _299, 2);
        float3 _301 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1945.xy), uint(_1945.z), 0).xyz;
        float _303 = _301.x;
        float _305 = _301.y;
        float _307 = _301.z;
        int _309 = _101 + 16;
        uint _311 = uint(int(uint(_309) >> uint(2)));
        uint _313 = uint(int(uint(int(_311)) >> uint(2)));
        int _315 = int(_311) & 3;
        float _317 = (*spvDescriptorSet0.cp_c5)._m0[int(_313)][_315];
        float _319 = -_203;
        float _321 = _319 + _223;
        float _323 = -_205;
        float _325 = _323 + _225;
        float _327 = -_207;
        float _329 = _327 + _227;
        float _331 = -_243;
        float _333 = _331 + _263;
        float _335 = fma(_321, _317, _203);
        float _337 = fma(_325, _317, _205);
        float _339 = -_245;
        float _341 = _339 + _265;
        float _343 = -_247;
        float _345 = _343 + _267;
        float _347 = -_283;
        float _349 = _347 + _303;
        float _351 = -_285;
        float _353 = _351 + _305;
        float _355 = -_287;
        float _357 = _355 + _307;
        float _359 = fma(_329, _317, _207);
        float _361 = fma(_333, _317, _243);
        float _363 = fma(_341, _317, _245);
        float _365 = fma(_345, _317, _247);
        float _367 = fma(_349, _317, _283);
        float _369 = fma(_353, _317, _285);
        float _371 = fma(_357, _317, _287);
        _169 = _335;
        _161 = _359;
        _163 = _337;
        _143 = _369;
        _123 = _361;
        _133 = _363;
        _135 = _365;
        _145 = _367;
        _153 = _371;
    }
    float _373 = _169;
    float _375 = _161;
    float _377 = _163;
    float _379 = _143;
    float _381 = _123;
    float _383 = _133;
    float _385 = _135;
    float _387 = _145;
    float _389 = _153;
    int _391 = _101 + 36;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    uint _395 = uint(int(uint(int(_393)) >> uint(2)));
    int _397 = int(_393) & 3;
    float _399 = (*spvDescriptorSet0.cp_c5)._m0[int(_395)][_397];
    int _401 = _99 & as_type<int>(_399);
    bool _403 = _401 != 0;
    bool _405 = !_403;
    float _407 = _381;
    float _409 = _383;
    float _411 = _385;
    float _729;
    float _731;
    float _733;
    float _735;
    float _737;
    float _739;
    float _741;
    float _743;
    float _745;
    float _747;
    float _749;
    float _751;
    if (!_405)
    {
        int _413 = _101 + 8;
        uint _415 = uint(int(uint(_413) >> uint(2)));
        uint _417 = uint(int(uint(int(_415)) >> uint(2)));
        int _419 = int(_415) & 3;
        float _421 = (*spvDescriptorSet0.cp_c5)._m0[int(_417)][_419];
        int _423 = int(_415) + 1;
        uint _425 = uint(int(uint(_423) >> uint(2)));
        int _427 = _423 & 3;
        float _429 = (*spvDescriptorSet0.cp_c5)._m0[int(_425)][_427];
        int _431 = _66;
        int _433 = 1;
        int _435 = _54(_431, _433, (*spvDescriptorSet0.support_buffer));
        int _437 = as_type<int>(_421);
        int _439 = 1;
        int _441 = _54(_437, _439, (*spvDescriptorSet0.support_buffer));
        int3 _2145 = int3(_435, _441, 1);
        float3 _443 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2145.xy), uint(_2145.z), 0).xyz;
        float _445 = _443.x;
        float _447 = _443.y;
        float _449 = _443.z;
        int _451 = _66;
        int _453 = 1;
        int _455 = _54(_451, _453, (*spvDescriptorSet0.support_buffer));
        int _457 = as_type<int>(_429);
        int _459 = 1;
        int _461 = _54(_457, _459, (*spvDescriptorSet0.support_buffer));
        int3 _2163 = int3(_455, _461, 1);
        float3 _463 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2163.xy), uint(_2163.z), 0).xyz;
        float _465 = _463.x;
        float _467 = _463.y;
        float _469 = _463.z;
        int _471 = _66;
        int _473 = 1;
        int _475 = _54(_471, _473, (*spvDescriptorSet0.support_buffer));
        int _477 = as_type<int>(_421);
        int _479 = 1;
        int _481 = _54(_477, _479, (*spvDescriptorSet0.support_buffer));
        int3 _2181 = int3(_475, _481, 0);
        float3 _483 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2181.xy), uint(_2181.z), 0).xyz;
        float _485 = _483.x;
        float _487 = _483.y;
        float _489 = _483.z;
        int _491 = _66;
        int _493 = 1;
        int _495 = _54(_491, _493, (*spvDescriptorSet0.support_buffer));
        int _497 = as_type<int>(_429);
        int _499 = 1;
        int _501 = _54(_497, _499, (*spvDescriptorSet0.support_buffer));
        int3 _2199 = int3(_495, _501, 0);
        float3 _503 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2199.xy), uint(_2199.z), 0).xyz;
        float _505 = _503.x;
        float _507 = _503.y;
        float _509 = _503.z;
        int _511 = _66;
        int _513 = 1;
        int _515 = _54(_511, _513, (*spvDescriptorSet0.support_buffer));
        int _517 = as_type<int>(_421);
        int _519 = 1;
        int _521 = _54(_517, _519, (*spvDescriptorSet0.support_buffer));
        int3 _2217 = int3(_515, _521, 2);
        float3 _523 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2217.xy), uint(_2217.z), 0).xyz;
        float _525 = _523.x;
        float _527 = _523.y;
        float _529 = _523.z;
        int _531 = _66;
        int _533 = 1;
        int _535 = _54(_531, _533, (*spvDescriptorSet0.support_buffer));
        int _537 = as_type<int>(_429);
        int _539 = 1;
        int _541 = _54(_537, _539, (*spvDescriptorSet0.support_buffer));
        int3 _2235 = int3(_535, _541, 2);
        float3 _543 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2235.xy), uint(_2235.z), 0).xyz;
        float _545 = _543.x;
        float _547 = _543.y;
        float _549 = _543.z;
        int _551 = _101 + 24;
        uint _553 = uint(int(uint(_551) >> uint(2)));
        uint _555 = uint(int(uint(int(_553)) >> uint(2)));
        int _557 = int(_553) & 3;
        float _559 = (*spvDescriptorSet0.cp_c5)._m0[int(_555)][_557];
        int _561 = int(_553) + 1;
        uint _563 = uint(int(uint(_561) >> uint(2)));
        int _565 = _561 & 3;
        float _567 = (*spvDescriptorSet0.cp_c5)._m0[int(_563)][_565];
        int _569 = _101 + 20;
        uint _571 = uint(int(uint(_569) >> uint(2)));
        uint _573 = uint(int(uint(int(_571)) >> uint(2)));
        int _575 = int(_571) & 3;
        float _577 = (*spvDescriptorSet0.cp_c5)._m0[int(_573)][_575];
        float _579 = -_445;
        float _581 = _579 + _465;
        float _583 = -_449;
        float _585 = _583 + _469;
        float _587 = fma(_581, _559, _445);
        float _589 = fma(_585, _559, _449);
        float _591 = _587 * _567;
        float _593 = fma(_373, _577, _591);
        float _595 = _593 * 0.15915493667125701904296875;
        float _597 = _589 * _567;
        float _599 = _595 * 6.283185482025146484375;
        float _601 = cos(_599);
        float _603 = fma(_375, _577, _597);
        float _605 = -_447;
        float _607 = _605 + _467;
        float _609 = _603 * 0.15915493667125701904296875;
        float _611 = fma(_607, _559, _447);
        float _613 = _595 * 6.283185482025146484375;
        float _615 = sin(_613);
        float _617 = _611 * _567;
        float _619 = fma(_377, _577, _617);
        float _621 = _609 * 6.283185482025146484375;
        float _623 = sin(_621);
        float _625 = _619 * 0.15915493667125701904296875;
        float _627 = -_489;
        float _629 = _627 + _509;
        float _631 = -_485;
        float _633 = _631 + _505;
        float _635 = fma(_629, _559, _489);
        float _637 = _609 * 6.283185482025146484375;
        float _639 = cos(_637);
        float _641 = _625 * 6.283185482025146484375;
        float _643 = cos(_641);
        float _645 = -_525;
        float _647 = _645 + _545;
        float _649 = fma(_633, _559, _485);
        float _651 = -_527;
        float _653 = _651 + _547;
        float _655 = -_487;
        float _657 = _655 + _507;
        float _659 = -_529;
        float _661 = _659 + _549;
        float _663 = fma(_647, _559, _525);
        float _665 = fma(_653, _559, _527);
        float _667 = _625 * 6.283185482025146484375;
        float _669 = sin(_667);
        float _671 = fma(_657, _559, _487);
        float _673 = fma(_661, _559, _529);
        float _675 = _601 * _639;
        float _677 = _623 * _601;
        float _679 = _665 * _567;
        float _681 = _649 * _567;
        float _683 = _671 * _567;
        float _685 = _601 * _643;
        float _687 = _615 * _643;
        float _689 = _615 * _623;
        float _691 = _635 * _567;
        float _693 = _663 * _567;
        float _695 = _673 * _567;
        float _697 = _643 * _639;
        float _699 = _623 * _643;
        float _701 = _615 * _669;
        float _703 = _615 * _639;
        float _705 = fma(_379, _577, _679);
        float _707 = fma(_669, _675, _689);
        float _709 = -_677;
        float _711 = fma(_639, _701, _709);
        float _713 = fma(_623, _701, _675);
        float _715 = -_703;
        float _717 = fma(_669, _677, _715);
        float _719 = fma(_381, _577, _681);
        float _721 = fma(_383, _577, _683);
        float _723 = fma(_385, _577, _691);
        float _725 = fma(_387, _577, _693);
        float _727 = fma(_389, _577, _695);
        _407 = _719;
        _729 = _697;
        _731 = _699;
        _733 = _669;
        _409 = _721;
        _735 = _711;
        _737 = _713;
        _739 = _687;
        _411 = _723;
        _741 = _707;
        _743 = _717;
        _745 = _685;
        _747 = _727;
        _749 = _705;
        _751 = _725;
        _753 = true;
    }
    else
    {
        float _755 = _373 * 0.15915493667125701904296875;
        float _757 = _375 * 0.15915493667125701904296875;
        float _759 = _377 * 0.15915493667125701904296875;
        float _761 = _755 * 6.283185482025146484375;
        float _763 = sin(_761);
        float _765 = _755 * 6.283185482025146484375;
        float _767 = cos(_765);
        float _769 = _757 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _757 * 6.283185482025146484375;
        float _775 = cos(_773);
        float _777 = _759 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = _771 * _767;
        float _783 = _759 * 6.283185482025146484375;
        float _785 = sin(_783);
        float _787 = _767 * _775;
        float _789 = _767 * _779;
        float _791 = _779 * _775;
        float _793 = _771 * _779;
        float _795 = _763 * _779;
        float _797 = _763 * _775;
        float _799 = _763 * _771;
        float _801 = _763 * _785;
        float _803 = -_781;
        float _805 = fma(_775, _801, _803);
        float _807 = fma(_771, _801, _787);
        float _809 = -_797;
        float _811 = fma(_785, _781, _809);
        float _813 = fma(_785, _787, _799);
        _729 = _791;
        _731 = _793;
        _733 = _785;
        _735 = _805;
        _737 = _807;
        _739 = _795;
        _741 = _813;
        _743 = _811;
        _745 = _789;
        _747 = _389;
        _749 = _379;
        _751 = _387;
    }
    _753 = false;
    float _815 = _407;
    float _817 = _729;
    float _819 = _731;
    float _821 = _733;
    float _823 = _409;
    float _825 = _735;
    float _827 = _737;
    float _829 = _739;
    float _831 = _411;
    float _833 = _741;
    float _835 = _743;
    float _837 = _745;
    float _839 = _747;
    float _841 = _749;
    float _843 = _751;
    bool _845 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _847 = _815 * _817;
    float _849 = _815 * _819;
    float _851 = _815 * _821;
    float _853 = _823 * _825;
    float _855 = _823 * _827;
    float _857 = _823 * _829;
    float _859 = _831 * _833;
    float _861 = _831 * _835;
    float _863 = _831 * _837;
    int _865 = _66 * 112;
    bool _867 = !_845;
    float _869 = _859;
    float _1197;
    float _1199;
    float _1201;
    float _1203;
    float _1205;
    float _1207;
    float _1209;
    float _1211;
    float _1213;
    float _1215;
    float _1217;
    if (!_867)
    {
        float _871 = -_851;
        float _873 = _871 + (-0.0);
        int _875 = 0;
        float _877 = _847;
        float _879 = _853;
        float _881 = _859;
        float _883 = _843;
        float _885 = _849;
        float _887 = _855;
        float _889 = _861;
        float _891 = _841;
        float _893 = _873;
        float _895 = _857;
        float _897 = _863;
        float _899 = _839;
        bool _901;
        int _949;
        int _959;
        int _969;
        int _979;
        int _989;
        int _999;
        int _1009;
        int _1019;
        int _1029;
        int _1039;
        int _1049;
        int _1059;
        int _1177;
        int _1179;
        int _1183;
        float _1185;
        int _1187;
        float _1191;
        int _1193;
        int _1195;
        do
        {
            int _903 = _875;
            int _905 = as_type<int>(_877);
            int _907 = as_type<int>(_879);
            int _909 = as_type<int>(_881);
            int _911 = as_type<int>(_883);
            int _913 = as_type<int>(_885);
            int _915 = as_type<int>(_887);
            float _917 = _889;
            int _919 = as_type<int>(_891);
            int _921 = as_type<int>(_893);
            float _923 = _895;
            int _925 = as_type<int>(_897);
            int _927 = as_type<int>(_899);
            uint _929 = uint(int(uint(_865) >> uint(2)));
            uint _931 = uint(int(uint(int(_929)) >> uint(2)));
            int _933 = int(_929) & 3;
            float _935 = (*spvDescriptorSet0.cp_c6)._m0[int(_931)][_933];
            bool _937 = _66 != 0;
            int _939 = _903 + 1;
            bool _941 = uint(_939) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _943 = _905;
            int _945 = as_type<int>(_935);
            int _947 = 31;
            int _2749 = _56(_943, _945, _947, _949, gl_SubgroupInvocationID);
            int _951 = _2749;
            int _953 = _907;
            int _955 = as_type<int>(_935);
            int _957 = 31;
            int _2753 = _56(_953, _955, _957, _959, gl_SubgroupInvocationID);
            int _961 = _2753;
            int _963 = _909;
            int _965 = as_type<int>(_935);
            int _967 = 31;
            int _2757 = _56(_963, _965, _967, _969, gl_SubgroupInvocationID);
            int _971 = _2757;
            int _973 = _911;
            int _975 = as_type<int>(_935);
            int _977 = 31;
            int _2761 = _56(_973, _975, _977, _979, gl_SubgroupInvocationID);
            int _981 = _2761;
            int _983 = _913;
            int _985 = as_type<int>(_935);
            int _987 = 31;
            int _2765 = _56(_983, _985, _987, _989, gl_SubgroupInvocationID);
            int _991 = _2765;
            int _993 = _915;
            int _995 = as_type<int>(_935);
            int _997 = 31;
            int _2769 = _56(_993, _995, _997, _999, gl_SubgroupInvocationID);
            int _1001 = _2769;
            int _1003 = as_type<int>(_917);
            int _1005 = as_type<int>(_935);
            int _1007 = 31;
            int _2774 = _56(_1003, _1005, _1007, _1009, gl_SubgroupInvocationID);
            int _1011 = _2774;
            int _1013 = _919;
            int _1015 = as_type<int>(_935);
            int _1017 = 31;
            int _2778 = _56(_1013, _1015, _1017, _1019, gl_SubgroupInvocationID);
            int _1021 = _2778;
            int _1023 = _921;
            int _1025 = as_type<int>(_935);
            int _1027 = 31;
            int _2782 = _56(_1023, _1025, _1027, _1029, gl_SubgroupInvocationID);
            int _1031 = _2782;
            int _1033 = as_type<int>(_923);
            int _1035 = as_type<int>(_935);
            int _1037 = 31;
            int _2787 = _56(_1033, _1035, _1037, _1039, gl_SubgroupInvocationID);
            int _1041 = _2787;
            int _1043 = _925;
            int _1045 = as_type<int>(_935);
            int _1047 = 31;
            int _2791 = _56(_1043, _1045, _1047, _1049, gl_SubgroupInvocationID);
            int _1051 = _2791;
            int _1053 = _927;
            int _1055 = as_type<int>(_935);
            int _1057 = 31;
            int _2795 = _56(_1053, _1055, _1057, _1059, gl_SubgroupInvocationID);
            int _1061 = _2795;
            bool _1063 = !_937;
            _875 = _939;
            int _1065 = _905;
            int _1067 = _907;
            int _1069 = _909;
            int _1071 = _911;
            int _1073 = _913;
            int _1075 = _915;
            float _1077 = _917;
            int _1079 = _919;
            int _1081 = _921;
            float _1083 = _923;
            int _1085 = _925;
            int _1087 = _927;
            if (!_1063)
            {
                float _1089 = _855 * as_type<float>(_961);
                float _1091 = _861 * as_type<float>(_1001);
                float _1093 = _861 * as_type<float>(_961);
                float _1095 = _849 * as_type<float>(_961);
                float _1097 = fma(_853, as_type<float>(_951), _1089);
                float _1099 = _855 * as_type<float>(_1001);
                float _1101 = _849 * as_type<float>(_1001);
                float _1103 = as_type<float>(_961) * _841;
                float _1105 = as_type<float>(_1001) * _841;
                float _1107 = fma(_859, as_type<float>(_991), _1091);
                float _1109 = as_type<float>(_1041) * _841;
                float _1111 = fma(_853, as_type<float>(_991), _1099);
                float _1113 = _861 * as_type<float>(_1041);
                float _1115 = fma(_859, as_type<float>(_951), _1093);
                float _1117 = _855 * as_type<float>(_1041);
                float _1119 = fma(_847, as_type<float>(_951), _1095);
                float _1121 = fma(_847, as_type<float>(_991), _1101);
                float _1123 = _849 * as_type<float>(_1041);
                float _1125 = fma(as_type<float>(_951), _843, _1103);
                float _1127 = fma(as_type<float>(_991), _843, _1105);
                float _1129 = fma(as_type<float>(_1031), _843, _1109);
                float _1131 = fma(_859, as_type<float>(_1031), _1113);
                float _1133 = fma(_853, as_type<float>(_1031), _1117);
                float _1135 = fma(_863, as_type<float>(_971), _1115);
                float _1137 = fma(_847, as_type<float>(_1031), _1123);
                float _1139 = -_851;
                float _1141 = fma(_1139, as_type<float>(_971), _1119);
                float _1143 = fma(_857, as_type<float>(_971), _1097);
                float _1145 = -_851;
                float _1147 = fma(_1145, as_type<float>(_1011), _1121);
                float _1149 = fma(_857, as_type<float>(_1011), _1111);
                float _1151 = fma(_863, as_type<float>(_1011), _1107);
                float _1153 = fma(as_type<float>(_971), _839, _1125);
                float _1155 = fma(as_type<float>(_1011), _839, _1127);
                float _1157 = fma(as_type<float>(_1051), _839, _1129);
                float _1159 = -_851;
                float _1161 = fma(_1159, as_type<float>(_1051), _1137);
                float _1163 = fma(_857, as_type<float>(_1051), _1133);
                float _1165 = fma(_863, as_type<float>(_1051), _1131);
                float _1167 = as_type<float>(_981) + _1153;
                float _1169 = as_type<float>(_1021) + _1155;
                float _1171 = as_type<float>(_1061) + _1157;
                _1065 = as_type<int>(_1141);
                _1067 = as_type<int>(_1143);
                _1069 = as_type<int>(_1135);
                _1071 = as_type<int>(_1167);
                _1073 = as_type<int>(_1147);
                _1075 = as_type<int>(_1149);
                _1077 = _1151;
                _1079 = as_type<int>(_1169);
                _1081 = as_type<int>(_1161);
                _1083 = _1163;
                _1085 = as_type<int>(_1165);
                _1087 = as_type<int>(_1171);
            }
            int _1173 = _1065;
            int _1175 = _1067;
            _1177 = _1069;
            _1179 = _1071;
            int _1181 = _1073;
            _1183 = _1075;
            _1185 = _1077;
            _1187 = _1079;
            int _1189 = _1081;
            _1191 = _1083;
            _1193 = _1085;
            _1195 = _1087;
            _901 = !_941;
            _877 = as_type<float>(_1173);
            _879 = as_type<float>(_1175);
            _881 = as_type<float>(_1177);
            _883 = as_type<float>(_1179);
            _885 = as_type<float>(_1181);
            _887 = as_type<float>(_1183);
            _889 = _1185;
            _891 = as_type<float>(_1187);
            _893 = as_type<float>(_1189);
            _895 = _1191;
            _897 = as_type<float>(_1193);
            _899 = as_type<float>(_1195);
            _1197 = as_type<float>(_1175);
            _1199 = as_type<float>(_1173);
            _1201 = as_type<float>(_1181);
            _1203 = as_type<float>(_1189);
        } while (_901);
        _1205 = as_type<float>(_1183);
        _1207 = _1191;
        _869 = as_type<float>(_1177);
        _1209 = _1185;
        _1211 = as_type<float>(_1193);
        _1213 = as_type<float>(_1187);
        _1215 = as_type<float>(_1179);
        _1217 = as_type<float>(_1195);
        _1219 = true;
    }
    else
    {
        float _1221 = -_851;
        float _1223 = _1221 + (-0.0);
        _1197 = _853;
        _1205 = _855;
        _1207 = _857;
        _1199 = _847;
        _1201 = _849;
        _1203 = _1223;
        _1209 = _861;
        _1211 = _863;
        _1213 = _841;
        _1215 = _843;
        _1217 = _839;
    }
    _1219 = false;
    float _1225 = _1197;
    float _1227 = _1205;
    float _1229 = _1207;
    float _1231 = _1199;
    float _1233 = _1201;
    float _1235 = _1203;
    float _1237 = _869;
    float _1239 = _1209;
    float _1241 = _1211;
    float _1243 = _1213;
    float _1245 = _1215;
    float _1247 = _1217;
    int _1249 = _865 + 80;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    uint _1253 = uint(int(uint(int(_1251)) >> uint(2)));
    int _1255 = int(_1251) & 3;
    float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
    int _1259 = int(_1251) + 1;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    int _1263 = _1259 & 3;
    float _1265 = (*spvDescriptorSet0.cp_c6)._m0[int(_1261)][_1263];
    int _1267 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1269 = _1267 + _66;
    int _1271 = _865 + 64;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    uint _1275 = uint(int(uint(int(_1273)) >> uint(2)));
    int _1277 = int(_1273) & 3;
    float _1279 = (*spvDescriptorSet0.cp_c6)._m0[int(_1275)][_1277];
    int _1281 = int(_1273) + 1;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    int _1285 = _1281 & 3;
    float _1287 = (*spvDescriptorSet0.cp_c6)._m0[int(_1283)][_1285];
    int _1289 = _1269 * 48;
    int _1291 = _865 + 88;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.cp_c6)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.cp_c6)._m0[int(_1303)][_1305];
    int _1309 = _865 + 72;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    uint _1313 = uint(int(uint(int(_1311)) >> uint(2)));
    int _1315 = int(_1311) & 3;
    float _1317 = (*spvDescriptorSet0.cp_c6)._m0[int(_1313)][_1315];
    int _1319 = int(_1311) + 1;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    int _1323 = _1319 & 3;
    float _1325 = (*spvDescriptorSet0.cp_c6)._m0[int(_1321)][_1323];
    int _1327 = _865 + 96;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
    int _1345 = _865 + 104;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.cp_c6)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.cp_c6)._m0[int(_1357)][_1359];
    int _1363 = _865 + 16;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.cp_c6)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
    float _1381 = _1225 * _1257;
    float _1383 = _1227 * _1257;
    float _1385 = _1229 * _1257;
    float _1387 = _1225 * _1265;
    float _1389 = _1229 * _1265;
    int _1391 = _865 + 32;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
    int _1397 = int(_1393) & 3;
    float _1399 = (*spvDescriptorSet0.cp_c6)._m0[int(_1395)][_1397];
    int _1401 = int(_1393) + 1;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    int _1405 = _1401 & 3;
    float _1407 = (*spvDescriptorSet0.cp_c6)._m0[int(_1403)][_1405];
    float _1409 = fma(_1231, _1279, _1381);
    float _1411 = fma(_1233, _1279, _1383);
    float _1413 = fma(_1235, _1279, _1385);
    float _1415 = _1227 * _1265;
    float _1417 = fma(_1231, _1287, _1387);
    float _1419 = fma(_1235, _1287, _1389);
    int _1421 = _865 + 48;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.cp_c6)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.cp_c6)._m0[int(_1433)][_1435];
    float _1439 = fma(_1233, _1287, _1415);
    float _1441 = _1225 * _1299;
    float _1443 = _1225 * _1307;
    float _1445 = _1227 * _1299;
    float _1447 = _1227 * _1307;
    float _1449 = _1229 * _1299;
    float _1451 = _1229 * _1307;
    float _1453 = fma(_1231, _1317, _1441);
    int _1455 = _865 + 24;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.cp_c6)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.cp_c6)._m0[int(_1467)][_1469];
    float _1473 = fma(_1231, _1325, _1443);
    float _1475 = fma(_1233, _1317, _1445);
    float _1477 = fma(_1233, _1325, _1447);
    float _1479 = fma(_1235, _1317, _1449);
    float _1481 = fma(_1235, _1325, _1451);
    float _1483 = fma(_1237, _1335, _1409);
    int _1485 = _865 + 40;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.cp_c6)._m0[int(_1489)][_1491];
    int _1495 = int(_1487) + 1;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    int _1499 = _1495 & 3;
    float _1501 = (*spvDescriptorSet0.cp_c6)._m0[int(_1497)][_1499];
    float _1503 = fma(_1237, _1343, _1417);
    float _1505 = fma(_1239, _1335, _1411);
    float _1507 = fma(_1239, _1343, _1439);
    float _1509 = fma(_1241, _1335, _1413);
    float _1511 = fma(_1241, _1343, _1419);
    float _1513 = fma(_1237, _1353, _1453);
    int _1515 = _865 + 56;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    uint _1519 = uint(int(uint(int(_1517)) >> uint(2)));
    int _1521 = int(_1517) & 3;
    float _1523 = (*spvDescriptorSet0.cp_c6)._m0[int(_1519)][_1521];
    int _1525 = int(_1517) + 1;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    int _1529 = _1525 & 3;
    float _1531 = (*spvDescriptorSet0.cp_c6)._m0[int(_1527)][_1529];
    float _1533 = fma(_1239, _1361, _1477);
    float _1535 = fma(_1237, _1361, _1473);
    float _1537 = fma(_1239, _1353, _1475);
    float _1539 = fma(_1241, _1361, _1481);
    float _1541 = _1533 + _1243;
    float _1543 = fma(_1241, _1353, _1479);
    float _1545 = _1535 + _1245;
    float _1547 = _1505 * _1379;
    float _1549 = _1507 * _1379;
    float _1551 = _1537 * _1379;
    float _1553 = _1541 * _1379;
    float _1555 = _1539 + _1247;
    float _1557 = fma(_1483, _1371, _1547);
    float _1559 = fma(_1503, _1371, _1549);
    float _1561 = fma(_1513, _1371, _1551);
    float _1563 = fma(_1545, _1371, _1553);
    float _1565 = _1505 * _1407;
    float _1567 = _1507 * _1407;
    float _1569 = _1537 * _1407;
    float _1571 = _1541 * _1407;
    float _1573 = fma(_1483, _1399, _1565);
    float _1575 = fma(_1503, _1399, _1567);
    float _1577 = fma(_1513, _1399, _1569);
    float _1579 = fma(_1545, _1399, _1571);
    float _1581 = _1541 * _1437;
    float _1583 = _1505 * _1437;
    float _1585 = _1507 * _1437;
    float _1587 = _1537 * _1437;
    float _1589 = fma(_1545, _1429, _1581);
    float _1591 = fma(_1483, _1429, _1583);
    float _1593 = fma(_1503, _1429, _1585);
    float _1595 = fma(_1555, _1463, _1563);
    float _1597 = fma(_1513, _1429, _1587);
    float _1599 = fma(_1509, _1463, _1557);
    float _1601 = fma(_1511, _1463, _1559);
    float _1603 = fma(_1543, _1463, _1561);
    float _1605 = _1595 + _1471;
    float _1607 = fma(_1555, _1493, _1579);
    float _1609 = fma(_1509, _1493, _1573);
    float _1611 = fma(_1511, _1493, _1575);
    int _1613 = _1289 + 16;
    float _1615 = fma(_1543, _1493, _1577);
    float _1617 = _1607 + _1501;
    int _1619 = _1289 + 32;
    float _1621 = fma(_1555, _1523, _1589);
    float _1623 = fma(_1509, _1523, _1591);
    float _1625 = fma(_1511, _1523, _1593);
    float _1627 = fma(_1543, _1523, _1597);
    float _1629 = _1621 + _1531;
    int _1631 = _1289 + 48;
    uint _1633 = uint(int(uint(_1613) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1633)] = as_type<uint>(_1599);
    int _1635 = _1613 + 4;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1637)] = as_type<uint>(_1601);
    int _1639 = _1613 + 8;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1641)] = as_type<uint>(_1603);
    int _1643 = _1613 + 12;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1645)] = as_type<uint>(_1605);
    uint _1647 = uint(int(uint(_1619) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1647)] = as_type<uint>(_1609);
    int _1649 = _1619 + 4;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1651)] = as_type<uint>(_1611);
    int _1653 = _1619 + 8;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1655)] = as_type<uint>(_1615);
    int _1657 = _1619 + 12;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1659)] = as_type<uint>(_1617);
    uint _1661 = uint(int(uint(_1631) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1661)] = as_type<uint>(_1623);
    int _1663 = _1631 + 4;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1665)] = as_type<uint>(_1625);
    int _1667 = _1631 + 8;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1669)] = as_type<uint>(_1627);
    int _1671 = _1631 + 12;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1673)] = as_type<uint>(_1629);
}

