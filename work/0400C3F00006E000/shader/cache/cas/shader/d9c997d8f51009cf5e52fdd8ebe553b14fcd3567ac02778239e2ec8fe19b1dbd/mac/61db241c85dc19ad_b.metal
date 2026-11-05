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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2889, thread const int& _2890, constant _10& support_buffer)
{
    int _2893 = 1 + _2890;
    float _2895 = support_buffer._m5[_2893].x;
    bool _2897 = _2895 == 1.0;
    if (_2897)
    {
        return _2889;
    }
    float _2899 = float(_2889);
    float _2901 = _2899 * _2895;
    int _2903 = int(_2901);
    return _2903;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2925, thread const int& _2926, thread const int& _2927, thread int& _2928, thread uint& gl_SubgroupInvocationID)
{
    int _2931 = _2927 & 31;
    uint _2933 = uint(int(uint(_2927) >> uint(8)));
    int _2935 = int(_2933) & 31;
    float _2937 = as_type<float>(gl_SubgroupInvocationID);
    int _2939 = as_type<int>(_2937) & _2935;
    int _2941 = ~_2935;
    int _2943 = _2931 & _2941;
    int _2945 = _2943 | _2939;
    int _2947 = ~_2935;
    int _2949 = _2926 & _2947;
    int _2951 = _2949 | _2939;
    bool _2953 = uint(_2951) <= uint(_2945);
    _2928 = _2953 ? (-1) : 0;
    float _2955 = spvSubgroupShuffle(as_type<float>(_2925), uint(_2951));
    uint _2957 = uint(_2953 ? as_type<int>(_2955) : _2925);
    return int(_2957);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _691 = false;
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
    float _119 = _109;
    if (!_113)
    {
        _115 = 0.0;
    }
    float _121 = _115;
    float _123 = 0.0;
    float _125 = 0.0;
    float _127 = _121;
    if (!_113)
    {
        _123 = 0.0;
        _125 = 0.0;
    }
    float _129 = _123;
    float _131 = _125;
    float _133 = 0.0;
    float _135 = _129;
    float _137 = _131;
    if (!_113)
    {
        _133 = 0.0;
    }
    float _139 = _133;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _139;
    if (!_113)
    {
        _141 = 0.0;
        _143 = 0.0;
    }
    float _147 = _141;
    float _149 = _143;
    float _151 = 0.0;
    float _153 = _147;
    float _155 = _149;
    if (!_113)
    {
        _151 = 0.0;
    }
    float _157 = _151;
    float _159 = _157;
    if (!_113)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _161 = _117;
    float _163 = _119;
    bool _165 = !_113;
    float _167 = _161;
    float _169 = _163;
    if (!_165)
    {
        uint _171 = uint(int(uint(_99) >> uint(2)));
        uint _173 = uint(int(uint(int(_171)) >> uint(2)));
        int _175 = int(_171) & 3;
        float _177 = (*spvDescriptorSet0.cp_c5)._m0[int(_173)][_175];
        int _179 = _66;
        int _181 = 0;
        int _183 = _54(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = as_type<int>(_177);
        int _187 = 0;
        int _189 = _54(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1368 = int3(_183, _189, 0);
        float3 _193 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1368.xy), uint(_1368.z), 0).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        int _201 = _66;
        int _203 = 0;
        int _205 = _54(_201, _203, (*spvDescriptorSet0.support_buffer));
        int _207 = as_type<int>(_177);
        int _209 = 0;
        int _211 = _54(_207, _209, (*spvDescriptorSet0.support_buffer));
        int3 _1386 = int3(_205, _211, 2);
        float3 _213 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1386.xy), uint(_1386.z), 0).xyz;
        float _215 = _213.x;
        float _217 = _213.y;
        float _219 = _213.z;
        int _221 = _66;
        int _223 = 0;
        int _225 = _54(_221, _223, (*spvDescriptorSet0.support_buffer));
        int _227 = as_type<int>(_177);
        int _229 = 0;
        int _231 = _54(_227, _229, (*spvDescriptorSet0.support_buffer));
        int3 _1404 = int3(_225, _231, 1);
        float3 _233 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1404.xy), uint(_1404.z), 0).xyz;
        float _235 = _233.x;
        float _237 = _233.y;
        float _239 = _233.z;
        _167 = _235;
        _159 = _239;
        _169 = _237;
        _135 = _195;
        _137 = _197;
        _127 = _199;
        _145 = _219;
        _153 = _217;
        _155 = _215;
    }
    float _241 = _167;
    float _243 = _159;
    float _245 = _169;
    float _247 = _135;
    float _249 = _137;
    float _251 = _127;
    float _253 = _145;
    float _255 = _153;
    float _257 = _155;
    float _259 = _241 * 0.15915493667125701904296875;
    float _261 = _243 * 0.15915493667125701904296875;
    float _263 = _245 * 0.15915493667125701904296875;
    bool _265 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _267 = _259 * 6.283185482025146484375;
    float _269 = sin(_267);
    float _271 = _259 * 6.283185482025146484375;
    float _273 = cos(_271);
    float _275 = _261 * 6.283185482025146484375;
    float _277 = sin(_275);
    float _279 = _261 * 6.283185482025146484375;
    float _281 = cos(_279);
    float _283 = _263 * 6.283185482025146484375;
    float _285 = cos(_283);
    float _287 = _277 * _273;
    float _289 = _269 * _277;
    float _291 = _263 * 6.283185482025146484375;
    float _293 = sin(_291);
    float _295 = _273 * _281;
    float _297 = _269 * _281;
    float _299 = _273 * _285;
    float _301 = _269 * _285;
    float _303 = _285 * _247;
    float _305 = _301 * _249;
    float _307 = _269 * _293;
    float _309 = -_297;
    float _311 = fma(_293, _287, _309);
    float _313 = fma(_293, _295, _289);
    float _315 = _293 * _247;
    float _317 = -_287;
    float _319 = fma(_281, _307, _317);
    float _321 = fma(_277, _307, _295);
    float _323 = _299 * _251;
    float _325 = _281 * _303;
    float _327 = _319 * _249;
    float _329 = _321 * _249;
    float _331 = _313 * _251;
    float _333 = _277 * _303;
    float _335 = _311 * _251;
    int _337 = _66 * 112;
    bool _339 = !_265;
    float _341 = _325;
    float _343 = _327;
    float _345 = _331;
    float _347 = _333;
    float _349 = _329;
    float _351 = _255;
    float _353 = _305;
    float _355 = _323;
    float _357 = _253;
    float _685;
    float _687;
    float _689;
    if (!_339)
    {
        float _359 = -_315;
        float _361 = _359 + (-0.0);
        int _363 = 0;
        float _365 = _325;
        float _367 = _327;
        float _369 = _331;
        float _371 = _257;
        float _373 = _333;
        float _375 = _329;
        float _377 = _335;
        float _379 = _255;
        float _381 = _361;
        float _383 = _305;
        float _385 = _323;
        float _387 = _253;
        bool _389;
        int _437;
        int _447;
        int _457;
        int _467;
        int _477;
        int _487;
        int _497;
        int _507;
        int _517;
        int _527;
        int _537;
        int _547;
        float _661;
        float _663;
        float _665;
        int _667;
        float _669;
        int _671;
        int _673;
        int _675;
        int _677;
        float _679;
        float _681;
        float _683;
        do
        {
            int _391 = _363;
            float _393 = _365;
            float _395 = _367;
            float _397 = _369;
            int _399 = as_type<int>(_371);
            float _401 = _373;
            int _403 = as_type<int>(_375);
            int _405 = as_type<int>(_377);
            int _407 = as_type<int>(_379);
            int _409 = as_type<int>(_381);
            float _411 = _383;
            float _413 = _385;
            float _415 = _387;
            uint _417 = uint(int(uint(_337) >> uint(2)));
            uint _419 = uint(int(uint(int(_417)) >> uint(2)));
            int _421 = int(_417) & 3;
            float _423 = (*spvDescriptorSet0.cp_c6)._m0[int(_419)][_421];
            bool _425 = _66 != 0;
            int _427 = _391 + 1;
            bool _429 = uint(_427) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _431 = as_type<int>(_393);
            int _433 = as_type<int>(_423);
            int _435 = 31;
            int _1624 = _56(_431, _433, _435, _437, gl_SubgroupInvocationID);
            int _439 = _1624;
            int _441 = as_type<int>(_395);
            int _443 = as_type<int>(_423);
            int _445 = 31;
            int _1629 = _56(_441, _443, _445, _447, gl_SubgroupInvocationID);
            int _449 = _1629;
            int _451 = as_type<int>(_397);
            int _453 = as_type<int>(_423);
            int _455 = 31;
            int _1634 = _56(_451, _453, _455, _457, gl_SubgroupInvocationID);
            int _459 = _1634;
            int _461 = _399;
            int _463 = as_type<int>(_423);
            int _465 = 31;
            int _1638 = _56(_461, _463, _465, _467, gl_SubgroupInvocationID);
            int _469 = _1638;
            int _471 = as_type<int>(_401);
            int _473 = as_type<int>(_423);
            int _475 = 31;
            int _1643 = _56(_471, _473, _475, _477, gl_SubgroupInvocationID);
            int _479 = _1643;
            int _481 = _403;
            int _483 = as_type<int>(_423);
            int _485 = 31;
            int _1647 = _56(_481, _483, _485, _487, gl_SubgroupInvocationID);
            int _489 = _1647;
            int _491 = _405;
            int _493 = as_type<int>(_423);
            int _495 = 31;
            int _1651 = _56(_491, _493, _495, _497, gl_SubgroupInvocationID);
            int _499 = _1651;
            int _501 = _407;
            int _503 = as_type<int>(_423);
            int _505 = 31;
            int _1655 = _56(_501, _503, _505, _507, gl_SubgroupInvocationID);
            int _509 = _1655;
            int _511 = _409;
            int _513 = as_type<int>(_423);
            int _515 = 31;
            int _1659 = _56(_511, _513, _515, _517, gl_SubgroupInvocationID);
            int _519 = _1659;
            int _521 = as_type<int>(_411);
            int _523 = as_type<int>(_423);
            int _525 = 31;
            int _1664 = _56(_521, _523, _525, _527, gl_SubgroupInvocationID);
            int _529 = _1664;
            int _531 = as_type<int>(_413);
            int _533 = as_type<int>(_423);
            int _535 = 31;
            int _1669 = _56(_531, _533, _535, _537, gl_SubgroupInvocationID);
            int _539 = _1669;
            int _541 = as_type<int>(_415);
            int _543 = as_type<int>(_423);
            int _545 = 31;
            int _1674 = _56(_541, _543, _545, _547, gl_SubgroupInvocationID);
            int _549 = _1674;
            bool _551 = !_425;
            _363 = _427;
            float _553 = _393;
            float _555 = _395;
            float _557 = _397;
            int _559 = _399;
            float _561 = _401;
            int _563 = _403;
            int _565 = _405;
            int _567 = _407;
            int _569 = _409;
            float _571 = _411;
            float _573 = _413;
            float _575 = _415;
            if (!_551)
            {
                float _577 = as_type<float>(_449) * _255;
                float _579 = _335 * as_type<float>(_489);
                float _581 = _335 * as_type<float>(_449);
                float _583 = _333 * as_type<float>(_449);
                float _585 = fma(as_type<float>(_439), _257, _577);
                float _587 = _333 * as_type<float>(_489);
                float _589 = _329 * as_type<float>(_449);
                float _591 = _329 * as_type<float>(_489);
                float _593 = as_type<float>(_489) * _255;
                float _595 = fma(_325, as_type<float>(_479), _587);
                float _597 = fma(_331, as_type<float>(_479), _579);
                float _599 = _333 * as_type<float>(_529);
                float _601 = as_type<float>(_529) * _255;
                float _603 = fma(_331, as_type<float>(_439), _581);
                float _605 = _335 * as_type<float>(_529);
                float _607 = fma(_325, as_type<float>(_439), _583);
                float _609 = fma(_327, as_type<float>(_439), _589);
                float _611 = fma(_327, as_type<float>(_479), _591);
                float _613 = _329 * as_type<float>(_529);
                float _615 = fma(as_type<float>(_479), _257, _593);
                float _617 = fma(_325, as_type<float>(_519), _599);
                float _619 = fma(as_type<float>(_519), _257, _601);
                float _621 = fma(_331, as_type<float>(_519), _605);
                float _623 = fma(_323, as_type<float>(_459), _603);
                float _625 = fma(_327, as_type<float>(_519), _613);
                float _627 = -_315;
                float _629 = fma(_627, as_type<float>(_459), _607);
                float _631 = fma(_305, as_type<float>(_459), _609);
                float _633 = fma(_305, as_type<float>(_499), _611);
                float _635 = fma(as_type<float>(_459), _253, _585);
                float _637 = -_315;
                float _639 = fma(_637, as_type<float>(_499), _595);
                float _641 = fma(_323, as_type<float>(_499), _597);
                float _643 = fma(as_type<float>(_499), _253, _615);
                float _645 = fma(as_type<float>(_539), _253, _619);
                float _647 = fma(_305, as_type<float>(_539), _625);
                float _649 = -_315;
                float _651 = fma(_649, as_type<float>(_539), _617);
                float _653 = fma(_323, as_type<float>(_539), _621);
                float _655 = as_type<float>(_469) + _635;
                float _657 = as_type<float>(_509) + _643;
                float _659 = as_type<float>(_549) + _645;
                _553 = _629;
                _555 = _631;
                _557 = _623;
                _559 = as_type<int>(_655);
                _561 = _639;
                _563 = as_type<int>(_633);
                _565 = as_type<int>(_641);
                _567 = as_type<int>(_657);
                _569 = as_type<int>(_651);
                _571 = _647;
                _573 = _653;
                _575 = _659;
            }
            _661 = _553;
            _663 = _555;
            _665 = _557;
            _667 = _559;
            _669 = _561;
            _671 = _563;
            _673 = _565;
            _675 = _567;
            _677 = _569;
            _679 = _571;
            _681 = _573;
            _683 = _575;
            _389 = !_429;
            _365 = _661;
            _367 = _663;
            _369 = _665;
            _371 = as_type<float>(_667);
            _373 = _669;
            _375 = as_type<float>(_671);
            _377 = as_type<float>(_673);
            _379 = as_type<float>(_675);
            _381 = as_type<float>(_677);
            _383 = _679;
            _385 = _681;
            _387 = _683;
        } while (_389);
        _341 = _661;
        _343 = _663;
        _345 = _665;
        _685 = as_type<float>(_667);
        _347 = _669;
        _349 = as_type<float>(_671);
        _687 = as_type<float>(_673);
        _351 = as_type<float>(_675);
        _689 = as_type<float>(_677);
        _353 = _679;
        _355 = _681;
        _357 = _683;
        _691 = true;
    }
    else
    {
        float _693 = -_315;
        float _695 = _693 + (-0.0);
        _685 = _257;
        _687 = _335;
        _689 = _695;
    }
    _691 = false;
    float _697 = _341;
    float _699 = _343;
    float _701 = _345;
    float _703 = _685;
    float _705 = _347;
    float _707 = _349;
    float _709 = _687;
    float _711 = _351;
    float _713 = _689;
    float _715 = _353;
    float _717 = _355;
    float _719 = _357;
    int _721 = _337 + 80;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.cp_c6)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    bool _739 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _741 = _337 + 64;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    uint _745 = uint(int(uint(int(_743)) >> uint(2)));
    int _747 = int(_743) & 3;
    float _749 = (*spvDescriptorSet0.cp_c6)._m0[int(_745)][_747];
    int _751 = int(_743) + 1;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    int _755 = _751 & 3;
    float _757 = (*spvDescriptorSet0.cp_c6)._m0[int(_753)][_755];
    int _759 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _761 = _759 + _66;
    int _763 = _337 + 88;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    uint _767 = uint(int(uint(int(_765)) >> uint(2)));
    int _769 = int(_765) & 3;
    float _771 = (*spvDescriptorSet0.cp_c6)._m0[int(_767)][_769];
    int _773 = int(_765) + 1;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    int _777 = _773 & 3;
    float _779 = (*spvDescriptorSet0.cp_c6)._m0[int(_775)][_777];
    int _781 = _337 + 72;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    uint _785 = uint(int(uint(int(_783)) >> uint(2)));
    int _787 = int(_783) & 3;
    float _789 = (*spvDescriptorSet0.cp_c6)._m0[int(_785)][_787];
    int _791 = int(_783) + 1;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    int _795 = _791 & 3;
    float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
    int _799 = _337 + 96;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    uint _803 = uint(int(uint(int(_801)) >> uint(2)));
    int _805 = int(_801) & 3;
    float _807 = (*spvDescriptorSet0.cp_c6)._m0[int(_803)][_805];
    int _809 = int(_801) + 1;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    int _813 = _809 & 3;
    float _815 = (*spvDescriptorSet0.cp_c6)._m0[int(_811)][_813];
    int _817 = _337 + 104;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.cp_c6)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.cp_c6)._m0[int(_829)][_831];
    int _835 = _337 + 16;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    uint _839 = uint(int(uint(int(_837)) >> uint(2)));
    int _841 = int(_837) & 3;
    float _843 = (*spvDescriptorSet0.cp_c6)._m0[int(_839)][_841];
    int _845 = int(_837) + 1;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    int _849 = _845 & 3;
    float _851 = (*spvDescriptorSet0.cp_c6)._m0[int(_847)][_849];
    if (!_739)
    {
        int _853 = _66 * 48;
        int _855 = _853 + 16;
        uint _857 = uint(int(uint(_853) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_857)] = as_type<uint>(_697);
        int _859 = _853 + 4;
        uint _861 = uint(int(uint(_859) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_861)] = as_type<uint>(_699);
        int _863 = _853 + 8;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_865)] = as_type<uint>(_701);
        int _867 = _853 + 12;
        uint _869 = uint(int(uint(_867) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_869)] = as_type<uint>(_703);
        int _871 = _853 + 32;
        uint _873 = uint(int(uint(_855) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_873)] = as_type<uint>(_705);
        int _875 = _855 + 4;
        uint _877 = uint(int(uint(_875) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_877)] = as_type<uint>(_707);
        int _879 = _855 + 8;
        uint _881 = uint(int(uint(_879) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_881)] = as_type<uint>(_709);
        int _883 = _855 + 12;
        uint _885 = uint(int(uint(_883) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_885)] = as_type<uint>(_711);
        uint _887 = uint(int(uint(_871) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_887)] = as_type<uint>(_713);
        int _889 = _871 + 4;
        uint _891 = uint(int(uint(_889) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_891)] = as_type<uint>(_715);
        int _893 = _871 + 8;
        uint _895 = uint(int(uint(_893) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_895)] = as_type<uint>(_717);
        int _897 = _871 + 12;
        uint _899 = uint(int(uint(_897) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_899)] = as_type<uint>(_719);
    }
    float _901 = _715 * _729;
    float _903 = _699 * _729;
    float _905 = _707 * _729;
    int _907 = _337 + 32;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.cp_c6)._m0[int(_911)][_913];
    int _917 = int(_909) + 1;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    int _921 = _917 & 3;
    float _923 = (*spvDescriptorSet0.cp_c6)._m0[int(_919)][_921];
    float _925 = fma(_713, _749, _901);
    float _927 = _699 * _737;
    float _929 = fma(_697, _749, _903);
    float _931 = fma(_705, _749, _905);
    float _933 = _707 * _737;
    float _935 = fma(_697, _757, _927);
    float _937 = _699 * _771;
    float _939 = _699 * _779;
    float _941 = _715 * _737;
    int _943 = _337 + 48;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    uint _947 = uint(int(uint(int(_945)) >> uint(2)));
    int _949 = int(_945) & 3;
    float _951 = (*spvDescriptorSet0.cp_c6)._m0[int(_947)][_949];
    int _953 = int(_945) + 1;
    uint _955 = uint(int(uint(_953) >> uint(2)));
    int _957 = _953 & 3;
    float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
    float _961 = _707 * _771;
    float _963 = _707 * _779;
    float _965 = fma(_705, _757, _933);
    float _967 = fma(_713, _757, _941);
    float _969 = _715 * _771;
    float _971 = _715 * _779;
    float _973 = fma(_697, _789, _937);
    float _975 = fma(_697, _797, _939);
    float _977 = fma(_705, _789, _961);
    int _979 = _337 + 24;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    uint _983 = uint(int(uint(int(_981)) >> uint(2)));
    int _985 = int(_981) & 3;
    float _987 = (*spvDescriptorSet0.cp_c6)._m0[int(_983)][_985];
    int _989 = int(_981) + 1;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    int _993 = _989 & 3;
    float _995 = (*spvDescriptorSet0.cp_c6)._m0[int(_991)][_993];
    float _997 = fma(_705, _797, _963);
    float _999 = fma(_713, _797, _971);
    float _1001 = fma(_713, _789, _969);
    float _1003 = fma(_701, _807, _929);
    float _1005 = fma(_709, _833, _997);
    float _1007 = fma(_709, _807, _931);
    float _1009 = fma(_717, _807, _925);
    int _1011 = _337 + 40;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    uint _1015 = uint(int(uint(int(_1013)) >> uint(2)));
    int _1017 = int(_1013) & 3;
    float _1019 = (*spvDescriptorSet0.cp_c6)._m0[int(_1015)][_1017];
    int _1021 = int(_1013) + 1;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    int _1025 = _1021 & 3;
    float _1027 = (*spvDescriptorSet0.cp_c6)._m0[int(_1023)][_1025];
    float _1029 = fma(_701, _815, _935);
    float _1031 = fma(_701, _825, _973);
    float _1033 = fma(_701, _833, _975);
    float _1035 = fma(_709, _815, _965);
    float _1037 = fma(_709, _825, _977);
    float _1039 = fma(_717, _833, _999);
    float _1041 = _1005 + _711;
    int _1043 = _337 + 56;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    uint _1047 = uint(int(uint(int(_1045)) >> uint(2)));
    int _1049 = int(_1045) & 3;
    float _1051 = (*spvDescriptorSet0.cp_c6)._m0[int(_1047)][_1049];
    int _1053 = int(_1045) + 1;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    int _1057 = _1053 & 3;
    float _1059 = (*spvDescriptorSet0.cp_c6)._m0[int(_1055)][_1057];
    float _1061 = fma(_717, _815, _967);
    float _1063 = fma(_717, _825, _1001);
    float _1065 = _1039 + _719;
    float _1067 = _1033 + _703;
    float _1069 = _1007 * _851;
    float _1071 = _1035 * _851;
    float _1073 = _1037 * _851;
    float _1075 = _1041 * _851;
    float _1077 = fma(_1003, _843, _1069);
    float _1079 = fma(_1029, _843, _1071);
    float _1081 = fma(_1031, _843, _1073);
    float _1083 = _1041 * _923;
    float _1085 = fma(_1067, _843, _1075);
    float _1087 = _1007 * _923;
    float _1089 = _1035 * _923;
    float _1091 = _1037 * _923;
    float _1093 = fma(_1067, _915, _1083);
    float _1095 = fma(_1003, _915, _1087);
    float _1097 = fma(_1029, _915, _1089);
    float _1099 = fma(_1031, _915, _1091);
    int _1101 = _761 * 48;
    float _1103 = _1041 * _959;
    float _1105 = _1007 * _959;
    float _1107 = _1035 * _959;
    float _1109 = _1037 * _959;
    float _1111 = fma(_1067, _951, _1103);
    float _1113 = fma(_1003, _951, _1105);
    float _1115 = fma(_1029, _951, _1107);
    float _1117 = fma(_1031, _951, _1109);
    float _1119 = fma(_1065, _987, _1085);
    float _1121 = fma(_1009, _987, _1077);
    float _1123 = fma(_1061, _987, _1079);
    float _1125 = fma(_1063, _987, _1081);
    float _1127 = _1119 + _995;
    float _1129 = fma(_1065, _1019, _1093);
    float _1131 = fma(_1009, _1019, _1095);
    float _1133 = fma(_1061, _1019, _1097);
    float _1135 = fma(_1063, _1019, _1099);
    float _1137 = _1129 + _1027;
    int _1139 = _1101 + 16;
    int _1141 = _1101 + 32;
    float _1143 = fma(_1065, _1051, _1111);
    float _1145 = fma(_1009, _1051, _1113);
    float _1147 = fma(_1061, _1051, _1115);
    float _1149 = fma(_1063, _1051, _1117);
    float _1151 = _1143 + _1059;
    int _1153 = _1101 + 48;
    uint _1155 = uint(int(uint(_1139) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1155)] = as_type<uint>(_1121);
    int _1157 = _1139 + 4;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1159)] = as_type<uint>(_1123);
    int _1161 = _1139 + 8;
    uint _1163 = uint(int(uint(_1161) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1163)] = as_type<uint>(_1125);
    int _1165 = _1139 + 12;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1167)] = as_type<uint>(_1127);
    uint _1169 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1169)] = as_type<uint>(_1131);
    int _1171 = _1141 + 4;
    uint _1173 = uint(int(uint(_1171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1173)] = as_type<uint>(_1133);
    int _1175 = _1141 + 8;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1177)] = as_type<uint>(_1135);
    int _1179 = _1141 + 12;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = as_type<uint>(_1137);
    uint _1183 = uint(int(uint(_1153) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1183)] = as_type<uint>(_1145);
    int _1185 = _1153 + 4;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1187)] = as_type<uint>(_1147);
    int _1189 = _1153 + 8;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1191)] = as_type<uint>(_1149);
    int _1193 = _1153 + 12;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1195)] = as_type<uint>(_1151);
}

