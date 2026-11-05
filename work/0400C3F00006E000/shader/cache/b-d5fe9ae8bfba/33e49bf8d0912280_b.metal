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
};

static inline __attribute__((always_inline))
int _52(thread const int& _3023, thread const int& _3024, constant _10& support_buffer)
{
    int _3027 = 1 + _3024;
    float _3029 = support_buffer._m5[_3027].x;
    bool _3031 = _3029 == 1.0;
    if (_3031)
    {
        return _3023;
    }
    float _3033 = float(_3023);
    float _3035 = _3033 * _3029;
    int _3037 = int(_3035);
    return _3037;
}

static inline __attribute__((always_inline))
int _54(thread const int& _3059, thread const int& _3060, thread const int& _3061, thread int& _3062, thread uint& gl_SubgroupInvocationID)
{
    int _3065 = _3061 & 31;
    uint _3067 = uint(int(uint(_3061) >> uint(8)));
    int _3069 = int(_3067) & 31;
    float _3071 = as_type<float>(gl_SubgroupInvocationID);
    int _3073 = as_type<int>(_3071) & _3069;
    int _3075 = ~_3069;
    int _3077 = _3065 & _3075;
    int _3079 = _3077 | _3073;
    int _3081 = ~_3069;
    int _3083 = _3060 & _3081;
    int _3085 = _3083 | _3073;
    bool _3087 = uint(_3085) <= uint(_3079);
    _3062 = _3087 ? (-1) : 0;
    float _3089 = spvSubgroupShuffle(as_type<float>(_3059), uint(_3085));
    uint _3091 = uint(_3087 ? as_type<int>(_3089) : _3059);
    return int(_3091);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _821 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = _64 & 31;
    bool _72 = _70 == 0;
    bool _74 = uint(_70) < 32u;
    int _76 = 32 - _70;
    int _78 = _70 - 32;
    int _80 = 1 << _70;
    uint _83 = uint(int(uint(0) >> uint(_76)));
    int _85 = _80 | int(_83);
    int _87 = _72 ? 1 : _85;
    bool _89 = uint(_78) < 32u;
    int _91 = 0 << _78;
    int _93 = _89 ? _91 : 0;
    float _95 = _74 ? as_type<float>(_87) : as_type<float>(_93);
    int _97 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _99 = _97 + 32;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = as_type<int>(_95) & as_type<int>(_107);
    bool _111 = _109 != 0;
    float _113 = 0.0;
    float _115 = 0.0;
    float _117 = _95;
    if (!_111)
    {
        _113 = 0.0;
        _115 = 0.0;
    }
    float _119 = _113;
    float _121 = _115;
    float _123 = 0.0;
    float _125 = _119;
    float _127 = _121;
    if (!_111)
    {
        _123 = 0.0;
    }
    float _129 = _123;
    float _131 = 0.0;
    float _133 = 0.0;
    float _135 = _129;
    if (!_111)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _137 = _131;
    float _139 = _133;
    float _141 = 0.0;
    float _143 = _137;
    float _145 = _139;
    if (!_111)
    {
        _141 = 0.0;
    }
    float _147 = _141;
    float _149 = 0.0;
    float _151 = 0.0;
    float _153 = _147;
    if (!_111)
    {
        _149 = 0.0;
        _151 = 0.0;
    }
    float _155 = _149;
    float _157 = _151;
    float _159 = _157;
    float _161 = _155;
    if (!_111)
    {
        _117 = 0.0;
    }
    float _163 = _117;
    bool _165 = !_111;
    float _167 = _163;
    if (!_165)
    {
        uint _169 = uint(int(uint(_97) >> uint(2)));
        uint _171 = uint(int(uint(int(_169)) >> uint(2)));
        int _173 = int(_169) & 3;
        float _175 = (*spvDescriptorSet0.cp_c5)._m0[int(_171)][_173];
        int _177 = int(_169) + 1;
        uint _179 = uint(int(uint(_177) >> uint(2)));
        int _181 = _177 & 3;
        float _183 = (*spvDescriptorSet0.cp_c5)._m0[int(_179)][_181];
        int _185 = _64;
        int _187 = 0;
        int _189 = _52(_185, _187, (*spvDescriptorSet0.support_buffer));
        int _191 = as_type<int>(_175);
        int _193 = 0;
        int _195 = _52(_191, _193, (*spvDescriptorSet0.support_buffer));
        int3 _1460 = int3(_189, _195, 1);
        float3 _199 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1460.xy), uint(_1460.z), 0).xyz;
        float _201 = _199.x;
        float _203 = _199.y;
        float _205 = _199.z;
        int _207 = _64;
        int _209 = 0;
        int _211 = _52(_207, _209, (*spvDescriptorSet0.support_buffer));
        int _213 = as_type<int>(_183);
        int _215 = 0;
        int _217 = _52(_213, _215, (*spvDescriptorSet0.support_buffer));
        int3 _1478 = int3(_211, _217, 1);
        float3 _219 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1478.xy), uint(_1478.z), 0).xyz;
        float _221 = _219.x;
        float _223 = _219.y;
        float _225 = _219.z;
        int _227 = _64;
        int _229 = 0;
        int _231 = _52(_227, _229, (*spvDescriptorSet0.support_buffer));
        int _233 = as_type<int>(_175);
        int _235 = 0;
        int _237 = _52(_233, _235, (*spvDescriptorSet0.support_buffer));
        int3 _1496 = int3(_231, _237, 0);
        float3 _239 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1496.xy), uint(_1496.z), 0).xyz;
        float _241 = _239.x;
        float _243 = _239.y;
        float _245 = _239.z;
        int _247 = _64;
        int _249 = 0;
        int _251 = _52(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = as_type<int>(_183);
        int _255 = 0;
        int _257 = _52(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _1514 = int3(_251, _257, 0);
        float3 _259 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1514.xy), uint(_1514.z), 0).xyz;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        int _267 = _64;
        int _269 = 0;
        int _271 = _52(_267, _269, (*spvDescriptorSet0.support_buffer));
        int _273 = as_type<int>(_175);
        int _275 = 0;
        int _277 = _52(_273, _275, (*spvDescriptorSet0.support_buffer));
        int3 _1532 = int3(_271, _277, 2);
        float3 _279 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1532.xy), uint(_1532.z), 0).xyz;
        float _281 = _279.x;
        float _283 = _279.y;
        float _285 = _279.z;
        int _287 = _64;
        int _289 = 0;
        int _291 = _52(_287, _289, (*spvDescriptorSet0.support_buffer));
        int _293 = as_type<int>(_183);
        int _295 = 0;
        int _297 = _52(_293, _295, (*spvDescriptorSet0.support_buffer));
        int3 _1550 = int3(_291, _297, 2);
        float3 _299 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1550.xy), uint(_1550.z), 0).xyz;
        float _301 = _299.x;
        float _303 = _299.y;
        float _305 = _299.z;
        int _307 = _97 + 16;
        uint _309 = uint(int(uint(_307) >> uint(2)));
        uint _311 = uint(int(uint(int(_309)) >> uint(2)));
        int _313 = int(_309) & 3;
        float _315 = (*spvDescriptorSet0.cp_c5)._m0[int(_311)][_313];
        float _317 = -_201;
        float _319 = _317 + _221;
        float _321 = -_205;
        float _323 = _321 + _225;
        float _325 = fma(_319, _315, _201);
        float _327 = -_203;
        float _329 = _327 + _223;
        float _331 = fma(_323, _315, _205);
        float _333 = -_281;
        float _335 = _333 + _301;
        float _337 = -_283;
        float _339 = _337 + _303;
        float _341 = -_241;
        float _343 = _341 + _261;
        float _345 = -_243;
        float _347 = _345 + _263;
        float _349 = -_245;
        float _351 = _349 + _265;
        float _353 = -_285;
        float _355 = _353 + _305;
        float _357 = fma(_329, _315, _203);
        float _359 = fma(_335, _315, _281);
        float _361 = fma(_339, _315, _283);
        float _363 = fma(_343, _315, _241);
        float _365 = fma(_347, _315, _243);
        float _367 = fma(_351, _315, _245);
        float _369 = fma(_355, _315, _285);
        _125 = _325;
        _167 = _331;
        _143 = _357;
        _127 = _363;
        _135 = _365;
        _153 = _367;
        _159 = _369;
        _161 = _361;
        _145 = _359;
    }
    float _371 = _125;
    float _373 = _167;
    float _375 = _143;
    float _377 = _127;
    float _379 = _135;
    float _381 = _153;
    float _383 = _159;
    float _385 = _161;
    float _387 = _145;
    float _389 = _371 * 0.15915493667125701904296875;
    float _391 = _373 * 0.15915493667125701904296875;
    float _393 = _375 * 0.15915493667125701904296875;
    bool _395 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _397 = _389 * 6.283185482025146484375;
    float _399 = sin(_397);
    float _401 = _389 * 6.283185482025146484375;
    float _403 = cos(_401);
    float _405 = _391 * 6.283185482025146484375;
    float _407 = sin(_405);
    float _409 = _391 * 6.283185482025146484375;
    float _411 = cos(_409);
    float _413 = _393 * 6.283185482025146484375;
    float _415 = cos(_413);
    float _417 = _407 * _403;
    float _419 = _399 * _407;
    float _421 = _393 * 6.283185482025146484375;
    float _423 = sin(_421);
    float _425 = _403 * _411;
    float _427 = _399 * _411;
    float _429 = _403 * _415;
    float _431 = _399 * _415;
    float _433 = _399 * _423;
    float _435 = _415 * _377;
    float _437 = -_427;
    float _439 = fma(_423, _417, _437);
    float _441 = _423 * _377;
    float _443 = fma(_423, _425, _419);
    float _445 = -_417;
    float _447 = fma(_411, _433, _445);
    float _449 = fma(_407, _433, _425);
    float _451 = _411 * _435;
    float _453 = _407 * _435;
    float _455 = _431 * _379;
    float _457 = _447 * _379;
    float _459 = _449 * _379;
    float _461 = _429 * _381;
    float _463 = _443 * _381;
    float _465 = _439 * _381;
    int _467 = _64 * 112;
    bool _469 = !_395;
    float _797;
    float _799;
    float _801;
    float _803;
    float _805;
    float _807;
    float _809;
    float _811;
    float _813;
    float _815;
    float _817;
    float _819;
    if (!_469)
    {
        float _471 = -_441;
        float _473 = _471 + (-0.0);
        int _475 = 0;
        float _477 = _451;
        float _479 = _457;
        float _481 = _463;
        float _483 = _387;
        float _485 = _453;
        float _487 = _459;
        float _489 = _465;
        float _491 = _385;
        float _493 = _473;
        float _495 = _455;
        float _497 = _461;
        float _499 = _383;
        bool _501;
        int _549;
        int _559;
        int _569;
        int _579;
        int _589;
        int _599;
        int _609;
        int _619;
        int _629;
        int _639;
        int _649;
        int _659;
        int _773;
        int _777;
        int _779;
        int _783;
        int _785;
        int _787;
        int _791;
        int _793;
        int _795;
        do
        {
            int _503 = _475;
            int _505 = as_type<int>(_477);
            int _507 = as_type<int>(_479);
            int _509 = as_type<int>(_481);
            int _511 = as_type<int>(_483);
            int _513 = as_type<int>(_485);
            int _515 = as_type<int>(_487);
            int _517 = as_type<int>(_489);
            int _519 = as_type<int>(_491);
            int _521 = as_type<int>(_493);
            int _523 = as_type<int>(_495);
            int _525 = as_type<int>(_497);
            int _527 = as_type<int>(_499);
            uint _529 = uint(int(uint(_467) >> uint(2)));
            uint _531 = uint(int(uint(int(_529)) >> uint(2)));
            int _533 = int(_529) & 3;
            float _535 = (*spvDescriptorSet0.cp_c6)._m0[int(_531)][_533];
            bool _537 = _64 != 0;
            int _539 = _503 + 1;
            bool _541 = uint(_539) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _543 = _505;
            int _545 = as_type<int>(_535);
            int _547 = 31;
            int _1866 = _54(_543, _545, _547, _549, gl_SubgroupInvocationID);
            int _551 = _1866;
            int _553 = _507;
            int _555 = as_type<int>(_535);
            int _557 = 31;
            int _1870 = _54(_553, _555, _557, _559, gl_SubgroupInvocationID);
            int _561 = _1870;
            int _563 = _509;
            int _565 = as_type<int>(_535);
            int _567 = 31;
            int _1874 = _54(_563, _565, _567, _569, gl_SubgroupInvocationID);
            int _571 = _1874;
            int _573 = _511;
            int _575 = as_type<int>(_535);
            int _577 = 31;
            int _1878 = _54(_573, _575, _577, _579, gl_SubgroupInvocationID);
            int _581 = _1878;
            int _583 = _513;
            int _585 = as_type<int>(_535);
            int _587 = 31;
            int _1882 = _54(_583, _585, _587, _589, gl_SubgroupInvocationID);
            int _591 = _1882;
            int _593 = _515;
            int _595 = as_type<int>(_535);
            int _597 = 31;
            int _1886 = _54(_593, _595, _597, _599, gl_SubgroupInvocationID);
            int _601 = _1886;
            int _603 = _517;
            int _605 = as_type<int>(_535);
            int _607 = 31;
            int _1890 = _54(_603, _605, _607, _609, gl_SubgroupInvocationID);
            int _611 = _1890;
            int _613 = _519;
            int _615 = as_type<int>(_535);
            int _617 = 31;
            int _1894 = _54(_613, _615, _617, _619, gl_SubgroupInvocationID);
            int _621 = _1894;
            int _623 = _521;
            int _625 = as_type<int>(_535);
            int _627 = 31;
            int _1898 = _54(_623, _625, _627, _629, gl_SubgroupInvocationID);
            int _631 = _1898;
            int _633 = _523;
            int _635 = as_type<int>(_535);
            int _637 = 31;
            int _1902 = _54(_633, _635, _637, _639, gl_SubgroupInvocationID);
            int _641 = _1902;
            int _643 = _525;
            int _645 = as_type<int>(_535);
            int _647 = 31;
            int _1906 = _54(_643, _645, _647, _649, gl_SubgroupInvocationID);
            int _651 = _1906;
            int _653 = _527;
            int _655 = as_type<int>(_535);
            int _657 = 31;
            int _1910 = _54(_653, _655, _657, _659, gl_SubgroupInvocationID);
            int _661 = _1910;
            bool _663 = !_537;
            _475 = _539;
            int _665 = _505;
            int _667 = _507;
            int _669 = _509;
            int _671 = _511;
            int _673 = _513;
            int _675 = _515;
            int _677 = _517;
            int _679 = _519;
            int _681 = _521;
            int _683 = _523;
            int _685 = _525;
            int _687 = _527;
            if (!_663)
            {
                float _689 = _453 * as_type<float>(_601);
                float _691 = _465 * as_type<float>(_601);
                float _693 = as_type<float>(_601) * _385;
                float _695 = _459 * as_type<float>(_601);
                float _697 = _453 * as_type<float>(_561);
                float _699 = _459 * as_type<float>(_561);
                float _701 = _465 * as_type<float>(_561);
                float _703 = as_type<float>(_561) * _385;
                float _705 = fma(_451, as_type<float>(_591), _689);
                float _707 = fma(_463, as_type<float>(_591), _691);
                float _709 = fma(as_type<float>(_591), _387, _693);
                float _711 = fma(_457, as_type<float>(_591), _695);
                float _713 = _453 * as_type<float>(_641);
                float _715 = _459 * as_type<float>(_641);
                float _717 = _465 * as_type<float>(_641);
                float _719 = fma(_451, as_type<float>(_551), _697);
                float _721 = fma(_457, as_type<float>(_551), _699);
                float _723 = fma(_463, as_type<float>(_551), _701);
                float _725 = as_type<float>(_641) * _385;
                float _727 = fma(as_type<float>(_551), _387, _703);
                float _729 = fma(_451, as_type<float>(_631), _713);
                float _731 = fma(_457, as_type<float>(_631), _715);
                float _733 = fma(_463, as_type<float>(_631), _717);
                float _735 = fma(as_type<float>(_631), _387, _725);
                float _737 = -_441;
                float _739 = fma(_737, as_type<float>(_571), _719);
                float _741 = fma(_455, as_type<float>(_571), _721);
                float _743 = fma(_461, as_type<float>(_571), _723);
                float _745 = fma(as_type<float>(_571), _383, _727);
                float _747 = -_441;
                float _749 = fma(_747, as_type<float>(_611), _705);
                float _751 = fma(_455, as_type<float>(_611), _711);
                float _753 = fma(_461, as_type<float>(_611), _707);
                float _755 = fma(as_type<float>(_611), _383, _709);
                float _757 = fma(as_type<float>(_651), _383, _735);
                float _759 = fma(_455, as_type<float>(_651), _731);
                float _761 = -_441;
                float _763 = fma(_761, as_type<float>(_651), _729);
                float _765 = fma(_461, as_type<float>(_651), _733);
                float _767 = as_type<float>(_581) + _745;
                float _769 = as_type<float>(_621) + _755;
                float _771 = as_type<float>(_661) + _757;
                _665 = as_type<int>(_739);
                _667 = as_type<int>(_741);
                _669 = as_type<int>(_743);
                _671 = as_type<int>(_767);
                _673 = as_type<int>(_749);
                _675 = as_type<int>(_751);
                _677 = as_type<int>(_753);
                _679 = as_type<int>(_769);
                _681 = as_type<int>(_763);
                _683 = as_type<int>(_759);
                _685 = as_type<int>(_765);
                _687 = as_type<int>(_771);
            }
            _773 = _665;
            int _775 = _667;
            _777 = _669;
            _779 = _671;
            int _781 = _673;
            _783 = _675;
            _785 = _677;
            _787 = _679;
            int _789 = _681;
            _791 = _683;
            _793 = _685;
            _795 = _687;
            _501 = !_541;
            _477 = as_type<float>(_773);
            _479 = as_type<float>(_775);
            _481 = as_type<float>(_777);
            _483 = as_type<float>(_779);
            _485 = as_type<float>(_781);
            _487 = as_type<float>(_783);
            _489 = as_type<float>(_785);
            _491 = as_type<float>(_787);
            _493 = as_type<float>(_789);
            _495 = as_type<float>(_791);
            _497 = as_type<float>(_793);
            _499 = as_type<float>(_795);
            _797 = as_type<float>(_775);
            _799 = as_type<float>(_781);
            _801 = as_type<float>(_789);
        } while (_501);
        _803 = as_type<float>(_783);
        _805 = as_type<float>(_791);
        _807 = as_type<float>(_773);
        _809 = as_type<float>(_793);
        _811 = as_type<float>(_777);
        _813 = as_type<float>(_785);
        _815 = as_type<float>(_787);
        _817 = as_type<float>(_779);
        _819 = as_type<float>(_795);
        _821 = true;
    }
    else
    {
        float _823 = -_441;
        float _825 = _823 + (-0.0);
        _797 = _457;
        _803 = _459;
        _805 = _455;
        _807 = _451;
        _799 = _453;
        _801 = _825;
        _809 = _461;
        _811 = _463;
        _813 = _465;
        _815 = _385;
        _817 = _387;
        _819 = _383;
    }
    _821 = false;
    float _827 = _797;
    float _829 = _803;
    float _831 = _805;
    float _833 = _807;
    float _835 = _799;
    float _837 = _801;
    float _839 = _809;
    float _841 = _811;
    float _843 = _813;
    float _845 = _815;
    float _847 = _817;
    float _849 = _819;
    int _851 = _467 + 80;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    uint _855 = uint(int(uint(int(_853)) >> uint(2)));
    int _857 = int(_853) & 3;
    float _859 = (*spvDescriptorSet0.cp_c6)._m0[int(_855)][_857];
    int _861 = int(_853) + 1;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    int _865 = _861 & 3;
    float _867 = (*spvDescriptorSet0.cp_c6)._m0[int(_863)][_865];
    int _869 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _871 = _869 + _64;
    int _873 = _467 + 64;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
    int _883 = int(_875) + 1;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    int _887 = _883 & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = _871 * 48;
    int _893 = _467 + 88;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.cp_c6)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.cp_c6)._m0[int(_905)][_907];
    int _911 = _467 + 72;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    uint _915 = uint(int(uint(int(_913)) >> uint(2)));
    int _917 = int(_913) & 3;
    float _919 = (*spvDescriptorSet0.cp_c6)._m0[int(_915)][_917];
    int _921 = int(_913) + 1;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    int _925 = _921 & 3;
    float _927 = (*spvDescriptorSet0.cp_c6)._m0[int(_923)][_925];
    int _929 = _467 + 96;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.cp_c6)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.cp_c6)._m0[int(_941)][_943];
    int _947 = _467 + 104;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    uint _951 = uint(int(uint(int(_949)) >> uint(2)));
    int _953 = int(_949) & 3;
    float _955 = (*spvDescriptorSet0.cp_c6)._m0[int(_951)][_953];
    int _957 = int(_949) + 1;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    int _961 = _957 & 3;
    float _963 = (*spvDescriptorSet0.cp_c6)._m0[int(_959)][_961];
    int _965 = _467 + 16;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.cp_c6)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.cp_c6)._m0[int(_977)][_979];
    float _983 = _827 * _859;
    float _985 = _829 * _859;
    float _987 = _831 * _859;
    float _989 = _829 * _867;
    float _991 = _831 * _867;
    int _993 = _467 + 32;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.cp_c6)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.cp_c6)._m0[int(_1005)][_1007];
    float _1011 = fma(_833, _881, _983);
    float _1013 = fma(_835, _881, _985);
    float _1015 = fma(_837, _881, _987);
    float _1017 = _827 * _867;
    float _1019 = fma(_837, _889, _991);
    float _1021 = fma(_835, _889, _989);
    int _1023 = _467 + 48;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.cp_c6)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.cp_c6)._m0[int(_1035)][_1037];
    float _1041 = fma(_833, _889, _1017);
    float _1043 = _827 * _901;
    float _1045 = _827 * _909;
    float _1047 = _829 * _901;
    float _1049 = _829 * _909;
    float _1051 = _831 * _901;
    float _1053 = _831 * _909;
    float _1055 = fma(_833, _919, _1043);
    int _1057 = _467 + 24;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.cp_c6)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.cp_c6)._m0[int(_1069)][_1071];
    float _1075 = fma(_833, _927, _1045);
    float _1077 = fma(_835, _919, _1047);
    float _1079 = fma(_835, _927, _1049);
    float _1081 = fma(_837, _919, _1051);
    float _1083 = fma(_837, _927, _1053);
    float _1085 = fma(_839, _937, _1015);
    int _1087 = _467 + 40;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.cp_c6)._m0[int(_1091)][_1093];
    int _1097 = int(_1089) + 1;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    int _1101 = _1097 & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    float _1105 = fma(_841, _937, _1011);
    float _1107 = fma(_841, _945, _1041);
    float _1109 = fma(_843, _937, _1013);
    float _1111 = fma(_843, _945, _1021);
    float _1113 = fma(_839, _945, _1019);
    float _1115 = fma(_843, _963, _1079);
    int _1117 = _467 + 56;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    uint _1121 = uint(int(uint(int(_1119)) >> uint(2)));
    int _1123 = int(_1119) & 3;
    float _1125 = (*spvDescriptorSet0.cp_c6)._m0[int(_1121)][_1123];
    int _1127 = int(_1119) + 1;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    int _1131 = _1127 & 3;
    float _1133 = (*spvDescriptorSet0.cp_c6)._m0[int(_1129)][_1131];
    float _1135 = fma(_841, _955, _1055);
    float _1137 = fma(_841, _963, _1075);
    float _1139 = fma(_839, _963, _1083);
    float _1141 = fma(_843, _955, _1077);
    float _1143 = _1115 + _845;
    float _1145 = fma(_839, _955, _1081);
    float _1147 = _1137 + _847;
    float _1149 = _1139 + _849;
    float _1151 = _1109 * _981;
    float _1153 = _1111 * _981;
    float _1155 = _1141 * _981;
    float _1157 = _1143 * _981;
    float _1159 = fma(_1105, _973, _1151);
    float _1161 = fma(_1107, _973, _1153);
    float _1163 = fma(_1135, _973, _1155);
    float _1165 = fma(_1147, _973, _1157);
    float _1167 = _1109 * _1009;
    float _1169 = _1111 * _1009;
    float _1171 = _1141 * _1009;
    float _1173 = _1143 * _1009;
    float _1175 = fma(_1105, _1001, _1167);
    float _1177 = fma(_1107, _1001, _1169);
    float _1179 = fma(_1135, _1001, _1171);
    float _1181 = fma(_1147, _1001, _1173);
    float _1183 = _1109 * _1039;
    float _1185 = _1111 * _1039;
    float _1187 = _1141 * _1039;
    float _1189 = _1143 * _1039;
    float _1191 = fma(_1105, _1031, _1183);
    float _1193 = fma(_1107, _1031, _1185);
    float _1195 = fma(_1135, _1031, _1187);
    float _1197 = fma(_1147, _1031, _1189);
    float _1199 = fma(_1149, _1065, _1165);
    float _1201 = fma(_1085, _1065, _1159);
    float _1203 = fma(_1113, _1065, _1161);
    float _1205 = fma(_1145, _1065, _1163);
    float _1207 = _1199 + _1073;
    float _1209 = fma(_1149, _1095, _1181);
    float _1211 = fma(_1085, _1095, _1175);
    float _1213 = fma(_1113, _1095, _1177);
    int _1215 = _891 + 16;
    float _1217 = fma(_1145, _1095, _1179);
    float _1219 = _1209 + _1103;
    int _1221 = _891 + 32;
    float _1223 = fma(_1149, _1125, _1197);
    float _1225 = fma(_1085, _1125, _1191);
    float _1227 = fma(_1113, _1125, _1193);
    float _1229 = fma(_1145, _1125, _1195);
    float _1231 = _1223 + _1133;
    int _1233 = _891 + 48;
    uint _1235 = uint(int(uint(_1215) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1235)] = as_type<uint>(_1201);
    int _1237 = _1215 + 4;
    uint _1239 = uint(int(uint(_1237) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1239)] = as_type<uint>(_1203);
    int _1241 = _1215 + 8;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1243)] = as_type<uint>(_1205);
    int _1245 = _1215 + 12;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1247)] = as_type<uint>(_1207);
    uint _1249 = uint(int(uint(_1221) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1249)] = as_type<uint>(_1211);
    int _1251 = _1221 + 4;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1253)] = as_type<uint>(_1213);
    int _1255 = _1221 + 8;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1257)] = as_type<uint>(_1217);
    int _1259 = _1221 + 12;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1261)] = as_type<uint>(_1219);
    uint _1263 = uint(int(uint(_1233) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1263)] = as_type<uint>(_1225);
    int _1265 = _1233 + 4;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1267)] = as_type<uint>(_1227);
    int _1269 = _1233 + 8;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1271)] = as_type<uint>(_1229);
    int _1273 = _1233 + 12;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1275)] = as_type<uint>(_1231);
}

