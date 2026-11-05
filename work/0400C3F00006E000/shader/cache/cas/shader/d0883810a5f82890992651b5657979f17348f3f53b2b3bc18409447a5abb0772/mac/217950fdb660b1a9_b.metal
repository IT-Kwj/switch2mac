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
int _54(thread const int& _2644, thread const int& _2645, constant _10& support_buffer)
{
    int _2648 = 1 + _2645;
    float _2650 = support_buffer._m5[_2648].x;
    bool _2652 = _2650 == 1.0;
    if (_2652)
    {
        return _2644;
    }
    float _2654 = float(_2644);
    float _2656 = _2654 * _2650;
    int _2658 = int(_2656);
    return _2658;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2680, thread const int& _2681, thread const int& _2682, thread int& _2683, thread uint& gl_SubgroupInvocationID)
{
    int _2686 = _2682 & 31;
    uint _2688 = uint(int(uint(_2682) >> uint(8)));
    int _2690 = int(_2688) & 31;
    float _2692 = as_type<float>(gl_SubgroupInvocationID);
    int _2694 = as_type<int>(_2692) & _2690;
    int _2696 = ~_2690;
    int _2698 = _2686 & _2696;
    int _2700 = _2698 | _2694;
    int _2702 = ~_2690;
    int _2704 = _2681 & _2702;
    int _2706 = _2704 | _2694;
    bool _2708 = uint(_2706) <= uint(_2700);
    _2683 = _2708 ? (-1) : 0;
    float _2710 = spvSubgroupShuffle(as_type<float>(_2680), uint(_2706));
    uint _2712 = uint(_2708 ? as_type<int>(_2710) : _2680);
    return int(_2712);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _577 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = _66;
    int _85 = 0;
    int _87 = _54(_83, _85, (*spvDescriptorSet0.support_buffer));
    int _89 = as_type<int>(_81);
    int _91 = 0;
    int _93 = _54(_89, _91, (*spvDescriptorSet0.support_buffer));
    int3 _1140 = int3(_87, _93, 1);
    float3 _97 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1140.xy), uint(_1140.z), 0).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    int _105 = _66;
    int _107 = 0;
    int _109 = _54(_105, _107, (*spvDescriptorSet0.support_buffer));
    int _111 = as_type<int>(_81);
    int _113 = 0;
    int _115 = _54(_111, _113, (*spvDescriptorSet0.support_buffer));
    int3 _1158 = int3(_109, _115, 0);
    float3 _117 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1158.xy), uint(_1158.z), 0).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    int _125 = _66;
    int _127 = 0;
    int _129 = _54(_125, _127, (*spvDescriptorSet0.support_buffer));
    int _131 = as_type<int>(_81);
    int _133 = 0;
    int _135 = _54(_131, _133, (*spvDescriptorSet0.support_buffer));
    int3 _1176 = int3(_129, _135, 2);
    float3 _137 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1176.xy), uint(_1176.z), 0).xyz;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    bool _145 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _147 = _99 * 0.15915493667125701904296875;
    float _149 = _103 * 0.15915493667125701904296875;
    float _151 = _101 * 0.15915493667125701904296875;
    float _153 = _147 * 6.283185482025146484375;
    float _155 = cos(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = sin(_157);
    float _161 = _149 * 6.283185482025146484375;
    float _163 = cos(_161);
    float _165 = _151 * 6.283185482025146484375;
    float _167 = cos(_165);
    float _169 = _147 * 6.283185482025146484375;
    float _171 = sin(_169);
    float _173 = _155 * _163;
    float _175 = _151 * 6.283185482025146484375;
    float _177 = sin(_175);
    float _179 = _159 * _155;
    float _181 = _155 * _167;
    float _183 = _171 * _159;
    float _185 = _171 * _163;
    float _187 = _171 * _167;
    float _189 = _171 * _177;
    float _191 = _167 * _119;
    float _193 = fma(_177, _173, _183);
    float _195 = -_179;
    float _197 = fma(_163, _189, _195);
    float _199 = fma(_159, _189, _173);
    float _201 = -_185;
    float _203 = fma(_177, _179, _201);
    float _205 = _119 * _177;
    float _207 = _163 * _191;
    float _209 = _159 * _191;
    float _211 = _121 * _187;
    float _213 = _121 * _197;
    float _215 = _123 * _181;
    float _217 = _123 * _193;
    float _219 = _121 * _199;
    float _221 = _123 * _203;
    int _223 = _66 * 112;
    bool _225 = !_145;
    float _227 = _207;
    float _229 = _213;
    float _231 = _217;
    float _233 = _209;
    float _235 = _219;
    float _237 = _141;
    float _239 = _211;
    float _241 = _215;
    float _243 = _143;
    float _571;
    float _573;
    float _575;
    if (!_225)
    {
        float _245 = -_205;
        float _247 = _245 + (-0.0);
        int _249 = 0;
        float _251 = _207;
        float _253 = _213;
        float _255 = _217;
        float _257 = _139;
        float _259 = _209;
        float _261 = _219;
        float _263 = _221;
        float _265 = _141;
        float _267 = _247;
        float _269 = _211;
        float _271 = _215;
        float _273 = _143;
        bool _275;
        int _323;
        int _333;
        int _343;
        int _353;
        int _363;
        int _373;
        int _383;
        int _393;
        int _403;
        int _413;
        int _423;
        int _433;
        float _547;
        float _549;
        float _551;
        int _553;
        float _555;
        int _557;
        int _559;
        int _561;
        int _563;
        float _565;
        float _567;
        float _569;
        do
        {
            int _277 = _249;
            float _279 = _251;
            float _281 = _253;
            float _283 = _255;
            int _285 = as_type<int>(_257);
            float _287 = _259;
            int _289 = as_type<int>(_261);
            int _291 = as_type<int>(_263);
            int _293 = as_type<int>(_265);
            int _295 = as_type<int>(_267);
            float _297 = _269;
            float _299 = _271;
            float _301 = _273;
            uint _303 = uint(int(uint(_223) >> uint(2)));
            uint _305 = uint(int(uint(int(_303)) >> uint(2)));
            int _307 = int(_303) & 3;
            float _309 = (*spvDescriptorSet0.cp_c6)._m0[int(_305)][_307];
            bool _311 = _66 != 0;
            int _313 = _277 + 1;
            bool _315 = uint(_313) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _317 = as_type<int>(_279);
            int _319 = as_type<int>(_309);
            int _321 = 31;
            int _1378 = _56(_317, _319, _321, _323, gl_SubgroupInvocationID);
            int _325 = _1378;
            int _327 = as_type<int>(_281);
            int _329 = as_type<int>(_309);
            int _331 = 31;
            int _1383 = _56(_327, _329, _331, _333, gl_SubgroupInvocationID);
            int _335 = _1383;
            int _337 = as_type<int>(_283);
            int _339 = as_type<int>(_309);
            int _341 = 31;
            int _1388 = _56(_337, _339, _341, _343, gl_SubgroupInvocationID);
            int _345 = _1388;
            int _347 = _285;
            int _349 = as_type<int>(_309);
            int _351 = 31;
            int _1392 = _56(_347, _349, _351, _353, gl_SubgroupInvocationID);
            int _355 = _1392;
            int _357 = as_type<int>(_287);
            int _359 = as_type<int>(_309);
            int _361 = 31;
            int _1397 = _56(_357, _359, _361, _363, gl_SubgroupInvocationID);
            int _365 = _1397;
            int _367 = _289;
            int _369 = as_type<int>(_309);
            int _371 = 31;
            int _1401 = _56(_367, _369, _371, _373, gl_SubgroupInvocationID);
            int _375 = _1401;
            int _377 = _291;
            int _379 = as_type<int>(_309);
            int _381 = 31;
            int _1405 = _56(_377, _379, _381, _383, gl_SubgroupInvocationID);
            int _385 = _1405;
            int _387 = _293;
            int _389 = as_type<int>(_309);
            int _391 = 31;
            int _1409 = _56(_387, _389, _391, _393, gl_SubgroupInvocationID);
            int _395 = _1409;
            int _397 = _295;
            int _399 = as_type<int>(_309);
            int _401 = 31;
            int _1413 = _56(_397, _399, _401, _403, gl_SubgroupInvocationID);
            int _405 = _1413;
            int _407 = as_type<int>(_297);
            int _409 = as_type<int>(_309);
            int _411 = 31;
            int _1418 = _56(_407, _409, _411, _413, gl_SubgroupInvocationID);
            int _415 = _1418;
            int _417 = as_type<int>(_299);
            int _419 = as_type<int>(_309);
            int _421 = 31;
            int _1423 = _56(_417, _419, _421, _423, gl_SubgroupInvocationID);
            int _425 = _1423;
            int _427 = as_type<int>(_301);
            int _429 = as_type<int>(_309);
            int _431 = 31;
            int _1428 = _56(_427, _429, _431, _433, gl_SubgroupInvocationID);
            int _435 = _1428;
            bool _437 = !_311;
            _249 = _313;
            float _439 = _279;
            float _441 = _281;
            float _443 = _283;
            int _445 = _285;
            float _447 = _287;
            int _449 = _289;
            int _451 = _291;
            int _453 = _293;
            int _455 = _295;
            float _457 = _297;
            float _459 = _299;
            float _461 = _301;
            if (!_437)
            {
                float _463 = _141 * as_type<float>(_335);
                float _465 = _219 * as_type<float>(_375);
                float _467 = _221 * as_type<float>(_375);
                float _469 = _209 * as_type<float>(_335);
                float _471 = fma(_139, as_type<float>(_325), _463);
                float _473 = _209 * as_type<float>(_375);
                float _475 = _219 * as_type<float>(_335);
                float _477 = _221 * as_type<float>(_335);
                float _479 = fma(_213, as_type<float>(_365), _465);
                float _481 = fma(_207, as_type<float>(_365), _473);
                float _483 = fma(_217, as_type<float>(_365), _467);
                float _485 = fma(_207, as_type<float>(_325), _469);
                float _487 = fma(_213, as_type<float>(_325), _475);
                float _489 = fma(_217, as_type<float>(_325), _477);
                float _491 = _209 * as_type<float>(_415);
                float _493 = _219 * as_type<float>(_415);
                float _495 = _221 * as_type<float>(_415);
                float _497 = _141 * as_type<float>(_375);
                float _499 = _141 * as_type<float>(_415);
                float _501 = fma(_213, as_type<float>(_405), _493);
                float _503 = fma(_211, as_type<float>(_345), _487);
                float _505 = fma(_139, as_type<float>(_365), _497);
                float _507 = fma(_139, as_type<float>(_405), _499);
                float _509 = fma(_207, as_type<float>(_405), _491);
                float _511 = fma(_217, as_type<float>(_405), _495);
                float _513 = -_205;
                float _515 = fma(_513, as_type<float>(_345), _485);
                float _517 = fma(_215, as_type<float>(_345), _489);
                float _519 = -_205;
                float _521 = fma(_519, as_type<float>(_385), _481);
                float _523 = fma(_143, as_type<float>(_345), _471);
                float _525 = fma(_143, as_type<float>(_385), _505);
                float _527 = fma(_143, as_type<float>(_425), _507);
                float _529 = fma(_211, as_type<float>(_385), _479);
                float _531 = fma(_215, as_type<float>(_385), _483);
                float _533 = -_205;
                float _535 = fma(_533, as_type<float>(_425), _509);
                float _537 = fma(_211, as_type<float>(_425), _501);
                float _539 = fma(_215, as_type<float>(_425), _511);
                float _541 = as_type<float>(_355) + _523;
                float _543 = as_type<float>(_395) + _525;
                float _545 = as_type<float>(_435) + _527;
                _439 = _515;
                _441 = _503;
                _443 = _517;
                _445 = as_type<int>(_541);
                _447 = _521;
                _449 = as_type<int>(_529);
                _451 = as_type<int>(_531);
                _453 = as_type<int>(_543);
                _455 = as_type<int>(_535);
                _457 = _537;
                _459 = _539;
                _461 = _545;
            }
            _547 = _439;
            _549 = _441;
            _551 = _443;
            _553 = _445;
            _555 = _447;
            _557 = _449;
            _559 = _451;
            _561 = _453;
            _563 = _455;
            _565 = _457;
            _567 = _459;
            _569 = _461;
            _275 = !_315;
            _251 = _547;
            _253 = _549;
            _255 = _551;
            _257 = as_type<float>(_553);
            _259 = _555;
            _261 = as_type<float>(_557);
            _263 = as_type<float>(_559);
            _265 = as_type<float>(_561);
            _267 = as_type<float>(_563);
            _269 = _565;
            _271 = _567;
            _273 = _569;
        } while (_275);
        _227 = _547;
        _229 = _549;
        _231 = _551;
        _571 = as_type<float>(_553);
        _233 = _555;
        _235 = as_type<float>(_557);
        _573 = as_type<float>(_559);
        _237 = as_type<float>(_561);
        _575 = as_type<float>(_563);
        _239 = _565;
        _241 = _567;
        _243 = _569;
        _577 = true;
    }
    else
    {
        float _579 = -_205;
        float _581 = _579 + (-0.0);
        _571 = _139;
        _573 = _221;
        _575 = _581;
    }
    _577 = false;
    float _583 = _227;
    float _585 = _229;
    float _587 = _231;
    float _589 = _571;
    float _591 = _233;
    float _593 = _235;
    float _595 = _573;
    float _597 = _237;
    float _599 = _575;
    float _601 = _239;
    float _603 = _241;
    float _605 = _243;
    int _607 = _223 + 80;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    uint _611 = uint(int(uint(int(_609)) >> uint(2)));
    int _613 = int(_609) & 3;
    float _615 = (*spvDescriptorSet0.cp_c6)._m0[int(_611)][_613];
    int _617 = int(_609) + 1;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    int _621 = _617 & 3;
    float _623 = (*spvDescriptorSet0.cp_c6)._m0[int(_619)][_621];
    bool _625 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _627 = _223 + 64;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.cp_c6)._m0[int(_631)][_633];
    int _637 = int(_629) + 1;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    int _641 = _637 & 3;
    float _643 = (*spvDescriptorSet0.cp_c6)._m0[int(_639)][_641];
    int _645 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _647 = _645 + _66;
    int _649 = _223 + 88;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.cp_c6)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.cp_c6)._m0[int(_661)][_663];
    int _667 = _223 + 72;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.cp_c6)._m0[int(_671)][_673];
    int _677 = int(_669) + 1;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    int _681 = _677 & 3;
    float _683 = (*spvDescriptorSet0.cp_c6)._m0[int(_679)][_681];
    int _685 = _223 + 96;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    uint _689 = uint(int(uint(int(_687)) >> uint(2)));
    int _691 = int(_687) & 3;
    float _693 = (*spvDescriptorSet0.cp_c6)._m0[int(_689)][_691];
    int _695 = int(_687) + 1;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    int _699 = _695 & 3;
    float _701 = (*spvDescriptorSet0.cp_c6)._m0[int(_697)][_699];
    int _703 = _223 + 104;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    uint _707 = uint(int(uint(int(_705)) >> uint(2)));
    int _709 = int(_705) & 3;
    float _711 = (*spvDescriptorSet0.cp_c6)._m0[int(_707)][_709];
    int _713 = int(_705) + 1;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    int _717 = _713 & 3;
    float _719 = (*spvDescriptorSet0.cp_c6)._m0[int(_715)][_717];
    int _721 = _223 + 16;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.cp_c6)._m0[int(_725)][_727];
    int _731 = int(_723) + 1;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    int _735 = _731 & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    if (!_625)
    {
        int _739 = _66 * 48;
        int _741 = _739 + 16;
        uint _743 = uint(int(uint(_739) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_743)] = as_type<uint>(_583);
        int _745 = _739 + 4;
        uint _747 = uint(int(uint(_745) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_747)] = as_type<uint>(_585);
        int _749 = _739 + 8;
        uint _751 = uint(int(uint(_749) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_751)] = as_type<uint>(_587);
        int _753 = _739 + 12;
        uint _755 = uint(int(uint(_753) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_755)] = as_type<uint>(_589);
        int _757 = _739 + 32;
        uint _759 = uint(int(uint(_741) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_759)] = as_type<uint>(_591);
        int _761 = _741 + 4;
        uint _763 = uint(int(uint(_761) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_763)] = as_type<uint>(_593);
        int _765 = _741 + 8;
        uint _767 = uint(int(uint(_765) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_767)] = as_type<uint>(_595);
        int _769 = _741 + 12;
        uint _771 = uint(int(uint(_769) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_771)] = as_type<uint>(_597);
        uint _773 = uint(int(uint(_757) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_773)] = as_type<uint>(_599);
        int _775 = _757 + 4;
        uint _777 = uint(int(uint(_775) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_777)] = as_type<uint>(_601);
        int _779 = _757 + 8;
        uint _781 = uint(int(uint(_779) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_781)] = as_type<uint>(_603);
        int _783 = _757 + 12;
        uint _785 = uint(int(uint(_783) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_785)] = as_type<uint>(_605);
    }
    float _787 = _601 * _615;
    float _789 = _585 * _615;
    float _791 = _593 * _615;
    int _793 = _223 + 32;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.cp_c6)._m0[int(_797)][_799];
    int _803 = int(_795) + 1;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    int _807 = _803 & 3;
    float _809 = (*spvDescriptorSet0.cp_c6)._m0[int(_805)][_807];
    float _811 = fma(_599, _635, _787);
    float _813 = _585 * _623;
    float _815 = fma(_583, _635, _789);
    float _817 = fma(_591, _635, _791);
    float _819 = _593 * _623;
    float _821 = fma(_583, _643, _813);
    float _823 = _585 * _657;
    float _825 = _585 * _665;
    float _827 = _601 * _623;
    int _829 = _223 + 48;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    uint _833 = uint(int(uint(int(_831)) >> uint(2)));
    int _835 = int(_831) & 3;
    float _837 = (*spvDescriptorSet0.cp_c6)._m0[int(_833)][_835];
    int _839 = int(_831) + 1;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    int _843 = _839 & 3;
    float _845 = (*spvDescriptorSet0.cp_c6)._m0[int(_841)][_843];
    float _847 = _593 * _657;
    float _849 = _593 * _665;
    float _851 = fma(_591, _643, _819);
    float _853 = fma(_599, _643, _827);
    float _855 = _601 * _657;
    float _857 = _601 * _665;
    float _859 = fma(_583, _675, _823);
    float _861 = fma(_583, _683, _825);
    float _863 = fma(_591, _675, _847);
    int _865 = _223 + 24;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    uint _869 = uint(int(uint(int(_867)) >> uint(2)));
    int _871 = int(_867) & 3;
    float _873 = (*spvDescriptorSet0.cp_c6)._m0[int(_869)][_871];
    int _875 = int(_867) + 1;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    int _879 = _875 & 3;
    float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
    float _883 = fma(_591, _683, _849);
    float _885 = fma(_599, _683, _857);
    float _887 = fma(_599, _675, _855);
    float _889 = fma(_587, _693, _815);
    float _891 = fma(_595, _719, _883);
    float _893 = fma(_595, _693, _817);
    float _895 = fma(_603, _693, _811);
    int _897 = _223 + 40;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.cp_c6)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.cp_c6)._m0[int(_909)][_911];
    float _915 = fma(_587, _701, _821);
    float _917 = fma(_587, _711, _859);
    float _919 = fma(_587, _719, _861);
    float _921 = fma(_595, _701, _851);
    float _923 = fma(_595, _711, _863);
    float _925 = fma(_603, _719, _885);
    float _927 = _891 + _597;
    int _929 = _223 + 56;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.cp_c6)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.cp_c6)._m0[int(_941)][_943];
    float _947 = fma(_603, _701, _853);
    float _949 = fma(_603, _711, _887);
    float _951 = _925 + _605;
    float _953 = _919 + _589;
    float _955 = _893 * _737;
    float _957 = _921 * _737;
    float _959 = _923 * _737;
    float _961 = _927 * _737;
    float _963 = fma(_889, _729, _955);
    float _965 = fma(_915, _729, _957);
    float _967 = fma(_917, _729, _959);
    float _969 = _927 * _809;
    float _971 = fma(_953, _729, _961);
    float _973 = _893 * _809;
    float _975 = _921 * _809;
    float _977 = _923 * _809;
    float _979 = fma(_953, _801, _969);
    float _981 = fma(_889, _801, _973);
    float _983 = fma(_915, _801, _975);
    float _985 = fma(_917, _801, _977);
    int _987 = _647 * 48;
    float _989 = _927 * _845;
    float _991 = _893 * _845;
    float _993 = _921 * _845;
    float _995 = _923 * _845;
    float _997 = fma(_953, _837, _989);
    float _999 = fma(_889, _837, _991);
    float _1001 = fma(_915, _837, _993);
    float _1003 = fma(_917, _837, _995);
    float _1005 = fma(_951, _873, _971);
    float _1007 = fma(_895, _873, _963);
    float _1009 = fma(_947, _873, _965);
    float _1011 = fma(_949, _873, _967);
    float _1013 = _1005 + _881;
    float _1015 = fma(_951, _905, _979);
    float _1017 = fma(_895, _905, _981);
    float _1019 = fma(_947, _905, _983);
    float _1021 = fma(_949, _905, _985);
    float _1023 = _1015 + _913;
    int _1025 = _987 + 16;
    int _1027 = _987 + 32;
    float _1029 = fma(_951, _937, _997);
    float _1031 = fma(_895, _937, _999);
    float _1033 = fma(_947, _937, _1001);
    float _1035 = fma(_949, _937, _1003);
    float _1037 = _1029 + _945;
    int _1039 = _987 + 48;
    uint _1041 = uint(int(uint(_1025) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1041)] = as_type<uint>(_1007);
    int _1043 = _1025 + 4;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1045)] = as_type<uint>(_1009);
    int _1047 = _1025 + 8;
    uint _1049 = uint(int(uint(_1047) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1049)] = as_type<uint>(_1011);
    int _1051 = _1025 + 12;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1053)] = as_type<uint>(_1013);
    uint _1055 = uint(int(uint(_1027) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1055)] = as_type<uint>(_1017);
    int _1057 = _1027 + 4;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1059)] = as_type<uint>(_1019);
    int _1061 = _1027 + 8;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1063)] = as_type<uint>(_1021);
    int _1065 = _1027 + 12;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1067)] = as_type<uint>(_1023);
    uint _1069 = uint(int(uint(_1039) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1069)] = as_type<uint>(_1031);
    int _1071 = _1039 + 4;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1073)] = as_type<uint>(_1033);
    int _1075 = _1039 + 8;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1077)] = as_type<uint>(_1035);
    int _1079 = _1039 + 12;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1081)] = as_type<uint>(_1037);
}

