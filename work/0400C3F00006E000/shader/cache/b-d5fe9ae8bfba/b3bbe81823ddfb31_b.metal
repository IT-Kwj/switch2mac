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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
};

static inline __attribute__((always_inline))
int _52(thread const int& _2721, thread const int& _2722, constant _10& support_buffer)
{
    int _2725 = 1 + _2722;
    float _2727 = support_buffer._m5[_2725].x;
    bool _2729 = _2727 == 1.0;
    if (_2729)
    {
        return _2721;
    }
    float _2731 = float(_2721);
    float _2733 = _2731 * _2727;
    int _2735 = int(_2733);
    return _2735;
}

static inline __attribute__((always_inline))
int _54(thread const int& _2757, thread const int& _2758, thread const int& _2759, thread int& _2760, thread uint& gl_SubgroupInvocationID)
{
    int _2763 = _2759 & 31;
    uint _2765 = uint(int(uint(_2759) >> uint(8)));
    int _2767 = int(_2765) & 31;
    float _2769 = as_type<float>(gl_SubgroupInvocationID);
    int _2771 = as_type<int>(_2769) & _2767;
    int _2773 = ~_2767;
    int _2775 = _2763 & _2773;
    int _2777 = _2775 | _2771;
    int _2779 = ~_2767;
    int _2781 = _2758 & _2779;
    int _2783 = _2781 | _2771;
    bool _2785 = uint(_2783) <= uint(_2777);
    _2760 = _2785 ? (-1) : 0;
    float _2787 = spvSubgroupShuffle(as_type<float>(_2757), uint(_2783));
    uint _2789 = uint(_2785 ? as_type<int>(_2787) : _2757);
    return int(_2789);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _689 = false;
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
    float _115 = _107;
    float _117 = _95;
    if (!_111)
    {
        _113 = 0.0;
    }
    float _119 = _113;
    float _121 = 0.0;
    float _123 = 0.0;
    float _125 = _119;
    if (!_111)
    {
        _121 = 0.0;
        _123 = 0.0;
    }
    float _127 = _121;
    float _129 = _123;
    float _131 = 0.0;
    float _133 = _127;
    float _135 = _129;
    if (!_111)
    {
        _131 = 0.0;
    }
    float _137 = _131;
    float _139 = 0.0;
    float _141 = _137;
    if (!_111)
    {
        _115 = 0.0;
        _139 = 0.0;
    }
    float _143 = _115;
    float _145 = _139;
    float _147 = _143;
    float _149 = _145;
    if (!_111)
    {
        _117 = 0.0;
    }
    float _151 = _117;
    float _153 = 0.0;
    float _155 = 0.0;
    float _157 = _151;
    if (!_111)
    {
        _153 = 0.0;
        _155 = 0.0;
    }
    float _159 = _153;
    float _161 = _155;
    bool _163 = !_111;
    float _165 = _159;
    float _167 = _161;
    if (!_163)
    {
        uint _169 = uint(int(uint(_97) >> uint(2)));
        uint _171 = uint(int(uint(int(_169)) >> uint(2)));
        int _173 = int(_169) & 3;
        float _175 = (*spvDescriptorSet0.cp_c5)._m0[int(_171)][_173];
        int _177 = _64;
        int _179 = 0;
        int _181 = _52(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = as_type<int>(_175);
        int _185 = 0;
        int _187 = _52(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1316 = int3(_181, _187, 0);
        float3 _191 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1316.xy), uint(_1316.z), 0).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        int _199 = _64;
        int _201 = 0;
        int _203 = _52(_199, _201, (*spvDescriptorSet0.support_buffer));
        int _205 = as_type<int>(_175);
        int _207 = 0;
        int _209 = _52(_205, _207, (*spvDescriptorSet0.support_buffer));
        int3 _1334 = int3(_203, _209, 2);
        float3 _211 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1334.xy), uint(_1334.z), 0).xyz;
        float _213 = _211.x;
        float _215 = _211.y;
        float _217 = _211.z;
        int _219 = _64;
        int _221 = 0;
        int _223 = _52(_219, _221, (*spvDescriptorSet0.support_buffer));
        int _225 = as_type<int>(_175);
        int _227 = 0;
        int _229 = _52(_225, _227, (*spvDescriptorSet0.support_buffer));
        int3 _1352 = int3(_223, _229, 1);
        float3 _231 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1352.xy), uint(_1352.z), 0).xyz;
        float _233 = _231.x;
        float _235 = _231.y;
        float _237 = _231.z;
        _165 = _233;
        _157 = _237;
        _167 = _235;
        _133 = _193;
        _135 = _195;
        _125 = _197;
        _141 = _217;
        _147 = _215;
        _149 = _213;
    }
    float _239 = _165;
    float _241 = _157;
    float _243 = _167;
    float _245 = _133;
    float _247 = _135;
    float _249 = _125;
    float _251 = _141;
    float _253 = _147;
    float _255 = _149;
    float _257 = _239 * 0.15915493667125701904296875;
    float _259 = _241 * 0.15915493667125701904296875;
    float _261 = _243 * 0.15915493667125701904296875;
    bool _263 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _265 = _257 * 6.283185482025146484375;
    float _267 = sin(_265);
    float _269 = _257 * 6.283185482025146484375;
    float _271 = cos(_269);
    float _273 = _259 * 6.283185482025146484375;
    float _275 = sin(_273);
    float _277 = _259 * 6.283185482025146484375;
    float _279 = cos(_277);
    float _281 = _261 * 6.283185482025146484375;
    float _283 = cos(_281);
    float _285 = _275 * _271;
    float _287 = _267 * _275;
    float _289 = _261 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = _271 * _279;
    float _295 = _267 * _279;
    float _297 = _271 * _283;
    float _299 = _267 * _283;
    float _301 = _283 * _245;
    float _303 = _267 * _291;
    float _305 = _291 * _245;
    float _307 = fma(_291, _293, _287);
    float _309 = -_295;
    float _311 = fma(_291, _285, _309);
    float _313 = -_285;
    float _315 = fma(_279, _303, _313);
    float _317 = fma(_275, _303, _293);
    float _319 = _275 * _301;
    float _321 = _279 * _301;
    float _323 = _299 * _247;
    float _325 = _315 * _247;
    float _327 = _297 * _249;
    float _329 = _307 * _249;
    float _331 = _317 * _247;
    float _333 = _311 * _249;
    int _335 = _64 * 112;
    bool _337 = !_263;
    float _339 = _329;
    float _667;
    float _669;
    float _671;
    float _673;
    float _675;
    float _677;
    float _679;
    float _681;
    float _683;
    float _685;
    float _687;
    if (!_337)
    {
        float _341 = -_305;
        float _343 = _341 + (-0.0);
        int _345 = 0;
        float _347 = _321;
        float _349 = _325;
        float _351 = _329;
        float _353 = _255;
        float _355 = _319;
        float _357 = _331;
        float _359 = _333;
        float _361 = _253;
        float _363 = _343;
        float _365 = _323;
        float _367 = _327;
        float _369 = _251;
        bool _371;
        int _419;
        int _429;
        int _439;
        int _449;
        int _459;
        int _469;
        int _479;
        int _489;
        int _499;
        int _509;
        int _519;
        int _529;
        int _643;
        int _647;
        int _649;
        float _651;
        float _653;
        int _657;
        int _661;
        int _663;
        int _665;
        do
        {
            int _373 = _345;
            int _375 = as_type<int>(_347);
            int _377 = as_type<int>(_349);
            int _379 = as_type<int>(_351);
            int _381 = as_type<int>(_353);
            float _383 = _355;
            float _385 = _357;
            int _387 = as_type<int>(_359);
            int _389 = as_type<int>(_361);
            int _391 = as_type<int>(_363);
            int _393 = as_type<int>(_365);
            int _395 = as_type<int>(_367);
            int _397 = as_type<int>(_369);
            uint _399 = uint(int(uint(_335) >> uint(2)));
            uint _401 = uint(int(uint(int(_399)) >> uint(2)));
            int _403 = int(_399) & 3;
            float _405 = (*spvDescriptorSet0.cp_c6)._m0[int(_401)][_403];
            bool _407 = _64 != 0;
            int _409 = _373 + 1;
            bool _411 = uint(_409) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _413 = _375;
            int _415 = as_type<int>(_405);
            int _417 = 31;
            int _1568 = _54(_413, _415, _417, _419, gl_SubgroupInvocationID);
            int _421 = _1568;
            int _423 = _377;
            int _425 = as_type<int>(_405);
            int _427 = 31;
            int _1572 = _54(_423, _425, _427, _429, gl_SubgroupInvocationID);
            int _431 = _1572;
            int _433 = _379;
            int _435 = as_type<int>(_405);
            int _437 = 31;
            int _1576 = _54(_433, _435, _437, _439, gl_SubgroupInvocationID);
            int _441 = _1576;
            int _443 = _381;
            int _445 = as_type<int>(_405);
            int _447 = 31;
            int _1580 = _54(_443, _445, _447, _449, gl_SubgroupInvocationID);
            int _451 = _1580;
            int _453 = as_type<int>(_383);
            int _455 = as_type<int>(_405);
            int _457 = 31;
            int _1585 = _54(_453, _455, _457, _459, gl_SubgroupInvocationID);
            int _461 = _1585;
            int _463 = as_type<int>(_385);
            int _465 = as_type<int>(_405);
            int _467 = 31;
            int _1590 = _54(_463, _465, _467, _469, gl_SubgroupInvocationID);
            int _471 = _1590;
            int _473 = _387;
            int _475 = as_type<int>(_405);
            int _477 = 31;
            int _1594 = _54(_473, _475, _477, _479, gl_SubgroupInvocationID);
            int _481 = _1594;
            int _483 = _389;
            int _485 = as_type<int>(_405);
            int _487 = 31;
            int _1598 = _54(_483, _485, _487, _489, gl_SubgroupInvocationID);
            int _491 = _1598;
            int _493 = _391;
            int _495 = as_type<int>(_405);
            int _497 = 31;
            int _1602 = _54(_493, _495, _497, _499, gl_SubgroupInvocationID);
            int _501 = _1602;
            int _503 = _393;
            int _505 = as_type<int>(_405);
            int _507 = 31;
            int _1606 = _54(_503, _505, _507, _509, gl_SubgroupInvocationID);
            int _511 = _1606;
            int _513 = _395;
            int _515 = as_type<int>(_405);
            int _517 = 31;
            int _1610 = _54(_513, _515, _517, _519, gl_SubgroupInvocationID);
            int _521 = _1610;
            int _523 = _397;
            int _525 = as_type<int>(_405);
            int _527 = 31;
            int _1614 = _54(_523, _525, _527, _529, gl_SubgroupInvocationID);
            int _531 = _1614;
            bool _533 = !_407;
            _345 = _409;
            int _535 = _375;
            int _537 = _377;
            int _539 = _379;
            int _541 = _381;
            float _543 = _383;
            float _545 = _385;
            int _547 = _387;
            int _549 = _389;
            int _551 = _391;
            int _553 = _393;
            int _555 = _395;
            int _557 = _397;
            if (!_533)
            {
                float _559 = _319 * as_type<float>(_431);
                float _561 = _333 * as_type<float>(_431);
                float _563 = as_type<float>(_431) * _253;
                float _565 = _333 * as_type<float>(_471);
                float _567 = fma(_321, as_type<float>(_421), _559);
                float _569 = fma(_329, as_type<float>(_421), _561);
                float _571 = fma(as_type<float>(_421), _255, _563);
                float _573 = _319 * as_type<float>(_471);
                float _575 = _331 * as_type<float>(_471);
                float _577 = _331 * as_type<float>(_431);
                float _579 = fma(_329, as_type<float>(_461), _565);
                float _581 = fma(_321, as_type<float>(_461), _573);
                float _583 = fma(_325, as_type<float>(_461), _575);
                float _585 = _331 * as_type<float>(_511);
                float _587 = as_type<float>(_471) * _253;
                float _589 = _319 * as_type<float>(_511);
                float _591 = as_type<float>(_511) * _253;
                float _593 = fma(_325, as_type<float>(_421), _577);
                float _595 = fma(_325, as_type<float>(_501), _585);
                float _597 = fma(as_type<float>(_461), _255, _587);
                float _599 = _333 * as_type<float>(_511);
                float _601 = fma(_321, as_type<float>(_501), _589);
                float _603 = fma(as_type<float>(_501), _255, _591);
                float _605 = -_305;
                float _607 = fma(_605, as_type<float>(_441), _567);
                float _609 = fma(_323, as_type<float>(_441), _593);
                float _611 = fma(_327, as_type<float>(_441), _569);
                float _613 = fma(as_type<float>(_441), _251, _571);
                float _615 = -_305;
                float _617 = fma(_615, as_type<float>(_481), _581);
                float _619 = fma(_323, as_type<float>(_481), _583);
                float _621 = fma(_327, as_type<float>(_481), _579);
                float _623 = fma(_323, as_type<float>(_521), _595);
                float _625 = fma(_329, as_type<float>(_501), _599);
                float _627 = fma(as_type<float>(_481), _251, _597);
                float _629 = fma(as_type<float>(_521), _251, _603);
                float _631 = -_305;
                float _633 = fma(_631, as_type<float>(_521), _601);
                float _635 = fma(_327, as_type<float>(_521), _625);
                float _637 = as_type<float>(_451) + _613;
                float _639 = as_type<float>(_491) + _627;
                float _641 = as_type<float>(_531) + _629;
                _535 = as_type<int>(_607);
                _537 = as_type<int>(_609);
                _539 = as_type<int>(_611);
                _541 = as_type<int>(_637);
                _543 = _617;
                _545 = _619;
                _547 = as_type<int>(_621);
                _549 = as_type<int>(_639);
                _551 = as_type<int>(_633);
                _553 = as_type<int>(_623);
                _555 = as_type<int>(_635);
                _557 = as_type<int>(_641);
            }
            _643 = _535;
            int _645 = _537;
            _647 = _539;
            _649 = _541;
            _651 = _543;
            _653 = _545;
            int _655 = _547;
            _657 = _549;
            int _659 = _551;
            _661 = _553;
            _663 = _555;
            _665 = _557;
            _371 = !_411;
            _347 = as_type<float>(_643);
            _349 = as_type<float>(_645);
            _351 = as_type<float>(_647);
            _353 = as_type<float>(_649);
            _355 = _651;
            _357 = _653;
            _359 = as_type<float>(_655);
            _361 = as_type<float>(_657);
            _363 = as_type<float>(_659);
            _365 = as_type<float>(_661);
            _367 = as_type<float>(_663);
            _369 = as_type<float>(_665);
            _667 = as_type<float>(_645);
            _669 = as_type<float>(_659);
            _671 = as_type<float>(_655);
        } while (_371);
        _673 = _653;
        _675 = as_type<float>(_661);
        _677 = as_type<float>(_643);
        _679 = _651;
        _681 = as_type<float>(_663);
        _683 = as_type<float>(_657);
        _685 = as_type<float>(_665);
        _339 = as_type<float>(_647);
        _687 = as_type<float>(_649);
        _689 = true;
    }
    else
    {
        float _691 = -_305;
        float _693 = _691 + (-0.0);
        _667 = _325;
        _673 = _331;
        _675 = _323;
        _677 = _321;
        _679 = _319;
        _669 = _693;
        _671 = _333;
        _681 = _327;
        _683 = _253;
        _685 = _251;
        _687 = _255;
    }
    _689 = false;
    float _695 = _667;
    float _697 = _673;
    float _699 = _675;
    float _701 = _677;
    float _703 = _679;
    float _705 = _669;
    float _707 = _671;
    float _709 = _681;
    float _711 = _683;
    float _713 = _685;
    float _715 = _339;
    float _717 = _687;
    int _719 = _335 + 80;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.cp_c6)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.cp_c6)._m0[int(_731)][_733];
    int _737 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _739 = _737 + _64;
    int _741 = _335 + 64;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    uint _745 = uint(int(uint(int(_743)) >> uint(2)));
    int _747 = int(_743) & 3;
    float _749 = (*spvDescriptorSet0.cp_c6)._m0[int(_745)][_747];
    int _751 = int(_743) + 1;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    int _755 = _751 & 3;
    float _757 = (*spvDescriptorSet0.cp_c6)._m0[int(_753)][_755];
    int _759 = _739 * 48;
    int _761 = _335 + 88;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.cp_c6)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.cp_c6)._m0[int(_773)][_775];
    int _779 = _335 + 72;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.cp_c6)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.cp_c6)._m0[int(_791)][_793];
    int _797 = _335 + 104;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    uint _801 = uint(int(uint(int(_799)) >> uint(2)));
    int _803 = int(_799) & 3;
    float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
    int _807 = int(_799) + 1;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    int _811 = _807 & 3;
    float _813 = (*spvDescriptorSet0.cp_c6)._m0[int(_809)][_811];
    int _815 = _335 + 96;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.cp_c6)._m0[int(_827)][_829];
    float _833 = _695 * _727;
    float _835 = _697 * _727;
    float _837 = _699 * _727;
    float _839 = _695 * _735;
    float _841 = _699 * _735;
    int _843 = _335 + 16;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    uint _847 = uint(int(uint(int(_845)) >> uint(2)));
    int _849 = int(_845) & 3;
    float _851 = (*spvDescriptorSet0.cp_c6)._m0[int(_847)][_849];
    int _853 = int(_845) + 1;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    int _857 = _853 & 3;
    float _859 = (*spvDescriptorSet0.cp_c6)._m0[int(_855)][_857];
    float _861 = fma(_701, _749, _833);
    float _863 = fma(_703, _749, _835);
    float _865 = fma(_705, _749, _837);
    float _867 = _697 * _735;
    float _869 = fma(_701, _757, _839);
    int _871 = _335 + 32;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    uint _875 = uint(int(uint(int(_873)) >> uint(2)));
    int _877 = int(_873) & 3;
    float _879 = (*spvDescriptorSet0.cp_c6)._m0[int(_875)][_877];
    int _881 = int(_873) + 1;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    int _885 = _881 & 3;
    float _887 = (*spvDescriptorSet0.cp_c6)._m0[int(_883)][_885];
    float _889 = fma(_705, _757, _841);
    float _891 = fma(_703, _757, _867);
    float _893 = _695 * _769;
    float _895 = _695 * _777;
    float _897 = _697 * _769;
    float _899 = _697 * _777;
    float _901 = _699 * _769;
    int _903 = _335 + 48;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    uint _907 = uint(int(uint(int(_905)) >> uint(2)));
    int _909 = int(_905) & 3;
    float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
    int _913 = int(_905) + 1;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    int _917 = _913 & 3;
    float _919 = (*spvDescriptorSet0.cp_c6)._m0[int(_915)][_917];
    float _921 = _699 * _777;
    float _923 = fma(_701, _787, _893);
    float _925 = fma(_701, _795, _895);
    float _927 = fma(_703, _787, _897);
    float _929 = fma(_703, _795, _899);
    float _931 = fma(_705, _787, _901);
    int _933 = _335 + 24;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.cp_c6)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.cp_c6)._m0[int(_945)][_947];
    float _951 = fma(_705, _795, _921);
    float _953 = fma(_707, _813, _929);
    float _955 = fma(_709, _813, _951);
    float _957 = _953 + _711;
    int _959 = _335 + 40;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    uint _963 = uint(int(uint(int(_961)) >> uint(2)));
    int _965 = int(_961) & 3;
    float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
    int _969 = int(_961) + 1;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    int _973 = _969 & 3;
    float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
    float _977 = _955 + _713;
    float _979 = fma(_715, _823, _861);
    float _981 = fma(_715, _805, _923);
    float _983 = fma(_707, _823, _863);
    float _985 = fma(_709, _823, _865);
    float _987 = fma(_715, _813, _925);
    int _989 = _335 + 56;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.cp_c6)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.cp_c6)._m0[int(_1001)][_1003];
    float _1007 = fma(_707, _831, _891);
    float _1009 = fma(_707, _805, _927);
    float _1011 = fma(_715, _831, _869);
    float _1013 = fma(_709, _831, _889);
    float _1015 = fma(_709, _805, _931);
    float _1017 = _987 + _717;
    float _1019 = _983 * _859;
    float _1021 = _1007 * _859;
    float _1023 = _1009 * _859;
    float _1025 = _957 * _859;
    float _1027 = fma(_979, _851, _1019);
    float _1029 = fma(_1011, _851, _1021);
    float _1031 = fma(_981, _851, _1023);
    float _1033 = fma(_1017, _851, _1025);
    float _1035 = _957 * _887;
    float _1037 = _983 * _887;
    float _1039 = _1007 * _887;
    float _1041 = _1009 * _887;
    float _1043 = fma(_1017, _879, _1035);
    float _1045 = fma(_979, _879, _1037);
    float _1047 = fma(_1011, _879, _1039);
    float _1049 = fma(_981, _879, _1041);
    float _1051 = _957 * _919;
    float _1053 = _983 * _919;
    float _1055 = _1007 * _919;
    float _1057 = _1009 * _919;
    float _1059 = fma(_1017, _911, _1051);
    float _1061 = fma(_979, _911, _1053);
    float _1063 = fma(_1011, _911, _1055);
    float _1065 = fma(_981, _911, _1057);
    float _1067 = fma(_977, _941, _1033);
    float _1069 = fma(_1013, _941, _1029);
    float _1071 = fma(_985, _941, _1027);
    float _1073 = fma(_1015, _941, _1031);
    float _1075 = _1067 + _949;
    float _1077 = fma(_977, _967, _1043);
    float _1079 = fma(_985, _967, _1045);
    float _1081 = fma(_1013, _967, _1047);
    int _1083 = _759 + 16;
    float _1085 = fma(_1015, _967, _1049);
    float _1087 = _1077 + _975;
    int _1089 = _759 + 32;
    float _1091 = fma(_977, _997, _1059);
    float _1093 = fma(_985, _997, _1061);
    float _1095 = fma(_1013, _997, _1063);
    float _1097 = fma(_1015, _997, _1065);
    float _1099 = _1091 + _1005;
    int _1101 = _759 + 48;
    uint _1103 = uint(int(uint(_1083) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1103)] = as_type<uint>(_1071);
    int _1105 = _1083 + 4;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1107)] = as_type<uint>(_1069);
    int _1109 = _1083 + 8;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1111)] = as_type<uint>(_1073);
    int _1113 = _1083 + 12;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1115)] = as_type<uint>(_1075);
    uint _1117 = uint(int(uint(_1089) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1117)] = as_type<uint>(_1079);
    int _1119 = _1089 + 4;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1121)] = as_type<uint>(_1081);
    int _1123 = _1089 + 8;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1125)] = as_type<uint>(_1085);
    int _1127 = _1089 + 12;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1129)] = as_type<uint>(_1087);
    uint _1131 = uint(int(uint(_1101) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1131)] = as_type<uint>(_1093);
    int _1133 = _1101 + 4;
    uint _1135 = uint(int(uint(_1133) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1135)] = as_type<uint>(_1095);
    int _1137 = _1101 + 8;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1139)] = as_type<uint>(_1097);
    int _1141 = _1101 + 12;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1143)] = as_type<uint>(_1099);
}

