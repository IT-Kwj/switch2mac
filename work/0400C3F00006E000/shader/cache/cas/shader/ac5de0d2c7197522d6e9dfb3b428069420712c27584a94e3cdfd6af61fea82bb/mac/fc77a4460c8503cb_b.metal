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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _3185, thread const int& _3186, constant _10& support_buffer)
{
    int _3189 = 1 + _3186;
    float _3191 = support_buffer._m5[_3189].x;
    bool _3193 = _3191 == 1.0;
    if (_3193)
    {
        return _3185;
    }
    float _3195 = float(_3185);
    float _3197 = _3195 * _3191;
    int _3199 = int(_3197);
    return _3199;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3221, thread const int& _3222, thread const int& _3223, thread int& _3224, thread uint& gl_SubgroupInvocationID)
{
    int _3227 = _3223 & 31;
    uint _3229 = uint(int(uint(_3223) >> uint(8)));
    int _3231 = int(_3229) & 31;
    float _3233 = as_type<float>(gl_SubgroupInvocationID);
    int _3235 = as_type<int>(_3233) & _3231;
    int _3237 = ~_3231;
    int _3239 = _3227 & _3237;
    int _3241 = _3239 | _3235;
    int _3243 = ~_3231;
    int _3245 = _3222 & _3243;
    int _3247 = _3245 | _3235;
    bool _3249 = uint(_3247) <= uint(_3241);
    _3224 = _3249 ? (-1) : 0;
    float _3251 = spvSubgroupShuffle(as_type<float>(_3221), uint(_3247));
    uint _3253 = uint(_3249 ? as_type<int>(_3251) : _3221);
    return int(_3253);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _823 = false;
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
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = as_type<int>(_97) & as_type<int>(_109);
    bool _113 = _111 != 0;
    float _115 = 0.0;
    float _117 = _97;
    if (!_113)
    {
        _115 = 0.0;
    }
    float _119 = _115;
    float _121 = 0.0;
    float _123 = 0.0;
    float _125 = _119;
    if (!_113)
    {
        _121 = 0.0;
        _123 = 0.0;
    }
    float _127 = _121;
    float _129 = _123;
    float _131 = 0.0;
    float _133 = _127;
    float _135 = _129;
    if (!_113)
    {
        _131 = 0.0;
    }
    float _137 = _131;
    float _139 = 0.0;
    float _141 = 0.0;
    float _143 = _137;
    if (!_113)
    {
        _139 = 0.0;
        _141 = 0.0;
    }
    float _145 = _139;
    float _147 = _141;
    float _149 = 0.0;
    float _151 = _145;
    float _153 = _147;
    if (!_113)
    {
        _149 = 0.0;
    }
    float _155 = _149;
    float _157 = 0.0;
    float _159 = _155;
    if (!_113)
    {
        _117 = 0.0;
        _157 = 0.0;
    }
    float _161 = _117;
    float _163 = _157;
    bool _165 = !_113;
    float _167 = _161;
    float _169 = _163;
    if (!_165)
    {
        uint _171 = uint(int(uint(_99) >> uint(2)));
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
        int3 _1512 = int3(_191, _197, 1);
        float3 _201 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1512.xy), uint(_1512.z), 0).xyz;
        float _203 = _201.x;
        float _205 = _201.y;
        float _207 = _201.z;
        int _209 = _66;
        int _211 = 0;
        int _213 = _54(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = as_type<int>(_185);
        int _217 = 0;
        int _219 = _54(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _1530 = int3(_213, _219, 1);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1530.xy), uint(_1530.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        int _229 = _66;
        int _231 = 0;
        int _233 = _54(_229, _231, (*spvDescriptorSet0.support_buffer));
        int _235 = as_type<int>(_177);
        int _237 = 0;
        int _239 = _54(_235, _237, (*spvDescriptorSet0.support_buffer));
        int3 _1548 = int3(_233, _239, 0);
        float3 _241 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1548.xy), uint(_1548.z), 0).xyz;
        float _243 = _241.x;
        float _245 = _241.y;
        float _247 = _241.z;
        int _249 = _66;
        int _251 = 0;
        int _253 = _54(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = as_type<int>(_185);
        int _257 = 0;
        int _259 = _54(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1566 = int3(_253, _259, 0);
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1566.xy), uint(_1566.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        int _269 = _66;
        int _271 = 0;
        int _273 = _54(_269, _271, (*spvDescriptorSet0.support_buffer));
        int _275 = as_type<int>(_177);
        int _277 = 0;
        int _279 = _54(_275, _277, (*spvDescriptorSet0.support_buffer));
        int3 _1584 = int3(_273, _279, 2);
        float3 _281 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1584.xy), uint(_1584.z), 0).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        int _289 = _66;
        int _291 = 0;
        int _293 = _54(_289, _291, (*spvDescriptorSet0.support_buffer));
        int _295 = as_type<int>(_185);
        int _297 = 0;
        int _299 = _54(_295, _297, (*spvDescriptorSet0.support_buffer));
        int3 _1602 = int3(_293, _299, 2);
        float3 _301 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1602.xy), uint(_1602.z), 0).xyz;
        float _303 = _301.x;
        float _305 = _301.y;
        float _307 = _301.z;
        int _309 = _99 + 16;
        uint _311 = uint(int(uint(_309) >> uint(2)));
        uint _313 = uint(int(uint(int(_311)) >> uint(2)));
        int _315 = int(_311) & 3;
        float _317 = (*spvDescriptorSet0.cp_c5)._m0[int(_313)][_315];
        float _319 = -_203;
        float _321 = _319 + _223;
        float _323 = -_207;
        float _325 = _323 + _227;
        float _327 = fma(_321, _317, _203);
        float _329 = -_205;
        float _331 = _329 + _225;
        float _333 = -_243;
        float _335 = _333 + _263;
        float _337 = -_245;
        float _339 = _337 + _265;
        float _341 = -_247;
        float _343 = _341 + _267;
        float _345 = fma(_331, _317, _205);
        float _347 = fma(_335, _317, _243);
        float _349 = fma(_325, _317, _207);
        float _351 = fma(_339, _317, _245);
        float _353 = -_283;
        float _355 = _353 + _303;
        float _357 = -_285;
        float _359 = _357 + _305;
        float _361 = -_287;
        float _363 = _361 + _307;
        float _365 = fma(_343, _317, _247);
        float _367 = fma(_355, _317, _283);
        float _369 = fma(_359, _317, _285);
        float _371 = fma(_363, _317, _287);
        _151 = _327;
        _167 = _349;
        _169 = _345;
        _125 = _347;
        _143 = _351;
        _133 = _365;
        _159 = _371;
        _135 = _369;
        _153 = _367;
    }
    float _373 = _151;
    float _375 = _167;
    float _377 = _169;
    float _379 = _125;
    float _381 = _143;
    float _383 = _133;
    float _385 = _159;
    float _387 = _135;
    float _389 = _153;
    float _391 = _373 * 0.15915493667125701904296875;
    float _393 = _375 * 0.15915493667125701904296875;
    float _395 = _377 * 0.15915493667125701904296875;
    bool _397 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _399 = _391 * 6.283185482025146484375;
    float _401 = sin(_399);
    float _403 = _391 * 6.283185482025146484375;
    float _405 = cos(_403);
    float _407 = _393 * 6.283185482025146484375;
    float _409 = sin(_407);
    float _411 = _393 * 6.283185482025146484375;
    float _413 = cos(_411);
    float _415 = _395 * 6.283185482025146484375;
    float _417 = cos(_415);
    float _419 = _409 * _405;
    float _421 = _401 * _409;
    float _423 = _395 * 6.283185482025146484375;
    float _425 = sin(_423);
    float _427 = _405 * _413;
    float _429 = _401 * _413;
    float _431 = _405 * _417;
    float _433 = _417 * _379;
    float _435 = _401 * _417;
    float _437 = _401 * _425;
    float _439 = -_429;
    float _441 = fma(_425, _419, _439);
    float _443 = fma(_425, _427, _421);
    float _445 = _425 * _379;
    float _447 = -_419;
    float _449 = fma(_413, _437, _447);
    float _451 = fma(_409, _437, _427);
    float _453 = _409 * _433;
    float _455 = _435 * _381;
    float _457 = _449 * _381;
    float _459 = _451 * _381;
    float _461 = _431 * _383;
    float _463 = _443 * _383;
    float _465 = _413 * _433;
    float _467 = _441 * _383;
    int _469 = _66 * 112;
    bool _471 = !_397;
    float _473 = _465;
    float _475 = _457;
    float _477 = _463;
    float _479 = _389;
    float _481 = _453;
    float _483 = _459;
    float _485 = _467;
    float _487 = _387;
    float _489 = _455;
    float _491 = _461;
    float _493 = _385;
    float _821;
    if (!_471)
    {
        float _495 = -_445;
        float _497 = _495 + (-0.0);
        int _499 = 0;
        float _501 = _465;
        float _503 = _457;
        float _505 = _463;
        float _507 = _389;
        float _509 = _453;
        float _511 = _459;
        float _513 = _467;
        float _515 = _387;
        float _517 = _497;
        float _519 = _455;
        float _521 = _461;
        float _523 = _385;
        bool _525;
        int _573;
        int _583;
        int _593;
        int _603;
        int _613;
        int _623;
        int _633;
        int _643;
        int _653;
        int _663;
        int _673;
        int _683;
        float _797;
        float _799;
        float _801;
        int _803;
        float _805;
        int _807;
        int _809;
        int _811;
        int _813;
        float _815;
        float _817;
        float _819;
        do
        {
            int _527 = _499;
            float _529 = _501;
            float _531 = _503;
            float _533 = _505;
            int _535 = as_type<int>(_507);
            float _537 = _509;
            int _539 = as_type<int>(_511);
            int _541 = as_type<int>(_513);
            int _543 = as_type<int>(_515);
            int _545 = as_type<int>(_517);
            float _547 = _519;
            float _549 = _521;
            float _551 = _523;
            uint _553 = uint(int(uint(_469) >> uint(2)));
            uint _555 = uint(int(uint(int(_553)) >> uint(2)));
            int _557 = int(_553) & 3;
            float _559 = (*spvDescriptorSet0.cp_c6)._m0[int(_555)][_557];
            bool _561 = _66 != 0;
            int _563 = _527 + 1;
            bool _565 = uint(_563) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _567 = as_type<int>(_529);
            int _569 = as_type<int>(_559);
            int _571 = 31;
            int _1923 = _56(_567, _569, _571, _573, gl_SubgroupInvocationID);
            int _575 = _1923;
            int _577 = as_type<int>(_531);
            int _579 = as_type<int>(_559);
            int _581 = 31;
            int _1928 = _56(_577, _579, _581, _583, gl_SubgroupInvocationID);
            int _585 = _1928;
            int _587 = as_type<int>(_533);
            int _589 = as_type<int>(_559);
            int _591 = 31;
            int _1933 = _56(_587, _589, _591, _593, gl_SubgroupInvocationID);
            int _595 = _1933;
            int _597 = _535;
            int _599 = as_type<int>(_559);
            int _601 = 31;
            int _1937 = _56(_597, _599, _601, _603, gl_SubgroupInvocationID);
            int _605 = _1937;
            int _607 = as_type<int>(_537);
            int _609 = as_type<int>(_559);
            int _611 = 31;
            int _1942 = _56(_607, _609, _611, _613, gl_SubgroupInvocationID);
            int _615 = _1942;
            int _617 = _539;
            int _619 = as_type<int>(_559);
            int _621 = 31;
            int _1946 = _56(_617, _619, _621, _623, gl_SubgroupInvocationID);
            int _625 = _1946;
            int _627 = _541;
            int _629 = as_type<int>(_559);
            int _631 = 31;
            int _1950 = _56(_627, _629, _631, _633, gl_SubgroupInvocationID);
            int _635 = _1950;
            int _637 = _543;
            int _639 = as_type<int>(_559);
            int _641 = 31;
            int _1954 = _56(_637, _639, _641, _643, gl_SubgroupInvocationID);
            int _645 = _1954;
            int _647 = _545;
            int _649 = as_type<int>(_559);
            int _651 = 31;
            int _1958 = _56(_647, _649, _651, _653, gl_SubgroupInvocationID);
            int _655 = _1958;
            int _657 = as_type<int>(_547);
            int _659 = as_type<int>(_559);
            int _661 = 31;
            int _1963 = _56(_657, _659, _661, _663, gl_SubgroupInvocationID);
            int _665 = _1963;
            int _667 = as_type<int>(_549);
            int _669 = as_type<int>(_559);
            int _671 = 31;
            int _1968 = _56(_667, _669, _671, _673, gl_SubgroupInvocationID);
            int _675 = _1968;
            int _677 = as_type<int>(_551);
            int _679 = as_type<int>(_559);
            int _681 = 31;
            int _1973 = _56(_677, _679, _681, _683, gl_SubgroupInvocationID);
            int _685 = _1973;
            bool _687 = !_561;
            _499 = _563;
            float _689 = _529;
            float _691 = _531;
            float _693 = _533;
            int _695 = _535;
            float _697 = _537;
            int _699 = _539;
            int _701 = _541;
            int _703 = _543;
            int _705 = _545;
            float _707 = _547;
            float _709 = _549;
            float _711 = _551;
            if (!_687)
            {
                float _713 = as_type<float>(_585) * _387;
                float _715 = _453 * as_type<float>(_585);
                float _717 = _459 * as_type<float>(_585);
                float _719 = _467 * as_type<float>(_585);
                float _721 = fma(as_type<float>(_575), _389, _713);
                float _723 = _453 * as_type<float>(_625);
                float _725 = _459 * as_type<float>(_625);
                float _727 = _467 * as_type<float>(_625);
                float _729 = as_type<float>(_625) * _387;
                float _731 = fma(_465, as_type<float>(_575), _715);
                float _733 = fma(_457, as_type<float>(_575), _717);
                float _735 = fma(_463, as_type<float>(_575), _719);
                float _737 = fma(_465, as_type<float>(_615), _723);
                float _739 = fma(_457, as_type<float>(_615), _725);
                float _741 = fma(_463, as_type<float>(_615), _727);
                float _743 = _453 * as_type<float>(_665);
                float _745 = as_type<float>(_665) * _387;
                float _747 = fma(as_type<float>(_615), _389, _729);
                float _749 = _467 * as_type<float>(_665);
                float _751 = _459 * as_type<float>(_665);
                float _753 = fma(_465, as_type<float>(_655), _743);
                float _755 = fma(as_type<float>(_655), _389, _745);
                float _757 = fma(_463, as_type<float>(_655), _749);
                float _759 = fma(_461, as_type<float>(_595), _735);
                float _761 = fma(_457, as_type<float>(_655), _751);
                float _763 = -_445;
                float _765 = fma(_763, as_type<float>(_595), _731);
                float _767 = fma(_455, as_type<float>(_595), _733);
                float _769 = fma(_455, as_type<float>(_635), _739);
                float _771 = fma(as_type<float>(_595), _385, _721);
                float _773 = -_445;
                float _775 = fma(_773, as_type<float>(_635), _737);
                float _777 = fma(_461, as_type<float>(_635), _741);
                float _779 = fma(as_type<float>(_635), _385, _747);
                float _781 = fma(as_type<float>(_675), _385, _755);
                float _783 = fma(_455, as_type<float>(_675), _761);
                float _785 = -_445;
                float _787 = fma(_785, as_type<float>(_675), _753);
                float _789 = fma(_461, as_type<float>(_675), _757);
                float _791 = as_type<float>(_605) + _771;
                float _793 = as_type<float>(_645) + _779;
                float _795 = as_type<float>(_685) + _781;
                _689 = _765;
                _691 = _767;
                _693 = _759;
                _695 = as_type<int>(_791);
                _697 = _775;
                _699 = as_type<int>(_769);
                _701 = as_type<int>(_777);
                _703 = as_type<int>(_793);
                _705 = as_type<int>(_787);
                _707 = _783;
                _709 = _789;
                _711 = _795;
            }
            _797 = _689;
            _799 = _691;
            _801 = _693;
            _803 = _695;
            _805 = _697;
            _807 = _699;
            _809 = _701;
            _811 = _703;
            _813 = _705;
            _815 = _707;
            _817 = _709;
            _819 = _711;
            _525 = !_565;
            _501 = _797;
            _503 = _799;
            _505 = _801;
            _507 = as_type<float>(_803);
            _509 = _805;
            _511 = as_type<float>(_807);
            _513 = as_type<float>(_809);
            _515 = as_type<float>(_811);
            _517 = as_type<float>(_813);
            _519 = _815;
            _521 = _817;
            _523 = _819;
        } while (_525);
        _473 = _797;
        _475 = _799;
        _477 = _801;
        _479 = as_type<float>(_803);
        _481 = _805;
        _483 = as_type<float>(_807);
        _485 = as_type<float>(_809);
        _487 = as_type<float>(_811);
        _821 = as_type<float>(_813);
        _489 = _815;
        _491 = _817;
        _493 = _819;
        _823 = true;
    }
    else
    {
        float _825 = -_445;
        float _827 = _825 + (-0.0);
        _821 = _827;
    }
    _823 = false;
    float _829 = _473;
    float _831 = _475;
    float _833 = _477;
    float _835 = _479;
    float _837 = _481;
    float _839 = _483;
    float _841 = _485;
    float _843 = _487;
    float _845 = _821;
    float _847 = _489;
    float _849 = _491;
    float _851 = _493;
    int _853 = _469 + 80;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    uint _857 = uint(int(uint(int(_855)) >> uint(2)));
    int _859 = int(_855) & 3;
    float _861 = (*spvDescriptorSet0.cp_c6)._m0[int(_857)][_859];
    int _863 = int(_855) + 1;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    int _867 = _863 & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    bool _871 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _873 = _469 + 64;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    uint _877 = uint(int(uint(int(_875)) >> uint(2)));
    int _879 = int(_875) & 3;
    float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
    int _883 = int(_875) + 1;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    int _887 = _883 & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _893 = _891 + _66;
    int _895 = _469 + 88;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    uint _899 = uint(int(uint(int(_897)) >> uint(2)));
    int _901 = int(_897) & 3;
    float _903 = (*spvDescriptorSet0.cp_c6)._m0[int(_899)][_901];
    int _905 = int(_897) + 1;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    int _909 = _905 & 3;
    float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
    int _913 = _469 + 72;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    int _931 = _469 + 96;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    uint _935 = uint(int(uint(int(_933)) >> uint(2)));
    int _937 = int(_933) & 3;
    float _939 = (*spvDescriptorSet0.cp_c6)._m0[int(_935)][_937];
    int _941 = int(_933) + 1;
    uint _943 = uint(int(uint(_941) >> uint(2)));
    int _945 = _941 & 3;
    float _947 = (*spvDescriptorSet0.cp_c6)._m0[int(_943)][_945];
    int _949 = _469 + 104;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.cp_c6)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.cp_c6)._m0[int(_961)][_963];
    int _967 = _469 + 16;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.cp_c6)._m0[int(_979)][_981];
    if (!_871)
    {
        int _985 = _66 * 48;
        int _987 = _985 + 16;
        uint _989 = uint(int(uint(_985) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_989)] = as_type<uint>(_829);
        int _991 = _985 + 4;
        uint _993 = uint(int(uint(_991) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_993)] = as_type<uint>(_831);
        int _995 = _985 + 8;
        uint _997 = uint(int(uint(_995) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_997)] = as_type<uint>(_833);
        int _999 = _985 + 12;
        uint _1001 = uint(int(uint(_999) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1001)] = as_type<uint>(_835);
        int _1003 = _985 + 32;
        uint _1005 = uint(int(uint(_987) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1005)] = as_type<uint>(_837);
        int _1007 = _987 + 4;
        uint _1009 = uint(int(uint(_1007) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1009)] = as_type<uint>(_839);
        int _1011 = _987 + 8;
        uint _1013 = uint(int(uint(_1011) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1013)] = as_type<uint>(_841);
        int _1015 = _987 + 12;
        uint _1017 = uint(int(uint(_1015) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1017)] = as_type<uint>(_843);
        uint _1019 = uint(int(uint(_1003) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1019)] = as_type<uint>(_845);
        int _1021 = _1003 + 4;
        uint _1023 = uint(int(uint(_1021) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1023)] = as_type<uint>(_847);
        int _1025 = _1003 + 8;
        uint _1027 = uint(int(uint(_1025) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1027)] = as_type<uint>(_849);
        int _1029 = _1003 + 12;
        uint _1031 = uint(int(uint(_1029) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1031)] = as_type<uint>(_851);
    }
    float _1033 = _847 * _861;
    float _1035 = _831 * _861;
    float _1037 = _839 * _861;
    int _1039 = _469 + 32;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.cp_c6)._m0[int(_1043)][_1045];
    int _1049 = int(_1041) + 1;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    int _1053 = _1049 & 3;
    float _1055 = (*spvDescriptorSet0.cp_c6)._m0[int(_1051)][_1053];
    float _1057 = fma(_845, _881, _1033);
    float _1059 = _831 * _869;
    float _1061 = fma(_829, _881, _1035);
    float _1063 = fma(_837, _881, _1037);
    float _1065 = _839 * _869;
    float _1067 = fma(_829, _889, _1059);
    float _1069 = _831 * _903;
    float _1071 = _831 * _911;
    float _1073 = _847 * _869;
    int _1075 = _469 + 48;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    uint _1079 = uint(int(uint(int(_1077)) >> uint(2)));
    int _1081 = int(_1077) & 3;
    float _1083 = (*spvDescriptorSet0.cp_c6)._m0[int(_1079)][_1081];
    int _1085 = int(_1077) + 1;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    int _1089 = _1085 & 3;
    float _1091 = (*spvDescriptorSet0.cp_c6)._m0[int(_1087)][_1089];
    float _1093 = _839 * _903;
    float _1095 = _839 * _911;
    float _1097 = fma(_837, _889, _1065);
    float _1099 = fma(_845, _889, _1073);
    float _1101 = _847 * _903;
    float _1103 = _847 * _911;
    float _1105 = fma(_829, _921, _1069);
    float _1107 = fma(_829, _929, _1071);
    float _1109 = fma(_837, _921, _1093);
    int _1111 = _469 + 24;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    uint _1115 = uint(int(uint(int(_1113)) >> uint(2)));
    int _1117 = int(_1113) & 3;
    float _1119 = (*spvDescriptorSet0.cp_c6)._m0[int(_1115)][_1117];
    int _1121 = int(_1113) + 1;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    int _1125 = _1121 & 3;
    float _1127 = (*spvDescriptorSet0.cp_c6)._m0[int(_1123)][_1125];
    float _1129 = fma(_837, _929, _1095);
    float _1131 = fma(_845, _929, _1103);
    float _1133 = fma(_845, _921, _1101);
    float _1135 = fma(_833, _939, _1061);
    float _1137 = fma(_841, _965, _1129);
    float _1139 = fma(_841, _939, _1063);
    float _1141 = fma(_849, _939, _1057);
    int _1143 = _469 + 40;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.cp_c6)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.cp_c6)._m0[int(_1155)][_1157];
    float _1161 = fma(_833, _947, _1067);
    float _1163 = fma(_833, _957, _1105);
    float _1165 = fma(_833, _965, _1107);
    float _1167 = fma(_841, _947, _1097);
    float _1169 = fma(_841, _957, _1109);
    float _1171 = fma(_849, _965, _1131);
    float _1173 = _1137 + _843;
    int _1175 = _469 + 56;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    uint _1179 = uint(int(uint(int(_1177)) >> uint(2)));
    int _1181 = int(_1177) & 3;
    float _1183 = (*spvDescriptorSet0.cp_c6)._m0[int(_1179)][_1181];
    int _1185 = int(_1177) + 1;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    int _1189 = _1185 & 3;
    float _1191 = (*spvDescriptorSet0.cp_c6)._m0[int(_1187)][_1189];
    float _1193 = fma(_849, _947, _1099);
    float _1195 = fma(_849, _957, _1133);
    float _1197 = _1171 + _851;
    float _1199 = _1165 + _835;
    float _1201 = _1139 * _983;
    float _1203 = _1167 * _983;
    float _1205 = _1169 * _983;
    float _1207 = _1173 * _983;
    float _1209 = fma(_1135, _975, _1201);
    float _1211 = fma(_1161, _975, _1203);
    float _1213 = fma(_1163, _975, _1205);
    float _1215 = _1173 * _1055;
    float _1217 = fma(_1199, _975, _1207);
    float _1219 = _1139 * _1055;
    float _1221 = _1167 * _1055;
    float _1223 = _1169 * _1055;
    float _1225 = fma(_1199, _1047, _1215);
    float _1227 = fma(_1135, _1047, _1219);
    float _1229 = fma(_1161, _1047, _1221);
    float _1231 = fma(_1163, _1047, _1223);
    int _1233 = _893 * 48;
    float _1235 = _1173 * _1091;
    float _1237 = _1139 * _1091;
    float _1239 = _1167 * _1091;
    float _1241 = _1169 * _1091;
    float _1243 = fma(_1199, _1083, _1235);
    float _1245 = fma(_1135, _1083, _1237);
    float _1247 = fma(_1161, _1083, _1239);
    float _1249 = fma(_1163, _1083, _1241);
    float _1251 = fma(_1197, _1119, _1217);
    float _1253 = fma(_1141, _1119, _1209);
    float _1255 = fma(_1193, _1119, _1211);
    float _1257 = fma(_1195, _1119, _1213);
    float _1259 = _1251 + _1127;
    float _1261 = fma(_1197, _1151, _1225);
    float _1263 = fma(_1141, _1151, _1227);
    float _1265 = fma(_1193, _1151, _1229);
    float _1267 = fma(_1195, _1151, _1231);
    float _1269 = _1261 + _1159;
    int _1271 = _1233 + 16;
    int _1273 = _1233 + 32;
    float _1275 = fma(_1197, _1183, _1243);
    float _1277 = fma(_1141, _1183, _1245);
    float _1279 = fma(_1193, _1183, _1247);
    float _1281 = fma(_1195, _1183, _1249);
    float _1283 = _1275 + _1191;
    int _1285 = _1233 + 48;
    uint _1287 = uint(int(uint(_1271) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1287)] = as_type<uint>(_1253);
    int _1289 = _1271 + 4;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1291)] = as_type<uint>(_1255);
    int _1293 = _1271 + 8;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1295)] = as_type<uint>(_1257);
    int _1297 = _1271 + 12;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1299)] = as_type<uint>(_1259);
    uint _1301 = uint(int(uint(_1273) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1301)] = as_type<uint>(_1263);
    int _1303 = _1273 + 4;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1305)] = as_type<uint>(_1265);
    int _1307 = _1273 + 8;
    uint _1309 = uint(int(uint(_1307) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1309)] = as_type<uint>(_1267);
    int _1311 = _1273 + 12;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1313)] = as_type<uint>(_1269);
    uint _1315 = uint(int(uint(_1285) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1315)] = as_type<uint>(_1277);
    int _1317 = _1285 + 4;
    uint _1319 = uint(int(uint(_1317) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1319)] = as_type<uint>(_1279);
    int _1321 = _1285 + 8;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1323)] = as_type<uint>(_1281);
    int _1325 = _1285 + 12;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1327)] = as_type<uint>(_1283);
}

