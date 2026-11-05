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
int _52(thread const int& _2476, thread const int& _2477, constant _10& support_buffer)
{
    int _2480 = 1 + _2477;
    float _2482 = support_buffer._m5[_2480].x;
    bool _2484 = _2482 == 1.0;
    if (_2484)
    {
        return _2476;
    }
    float _2486 = float(_2476);
    float _2488 = _2486 * _2482;
    int _2490 = int(_2488);
    return _2490;
}

static inline __attribute__((always_inline))
int _54(thread const int& _2512, thread const int& _2513, thread const int& _2514, thread int& _2515, thread uint& gl_SubgroupInvocationID)
{
    int _2518 = _2514 & 31;
    uint _2520 = uint(int(uint(_2514) >> uint(8)));
    int _2522 = int(_2520) & 31;
    float _2524 = as_type<float>(gl_SubgroupInvocationID);
    int _2526 = as_type<int>(_2524) & _2522;
    int _2528 = ~_2522;
    int _2530 = _2518 & _2528;
    int _2532 = _2530 | _2526;
    int _2534 = ~_2522;
    int _2536 = _2513 & _2534;
    int _2538 = _2536 | _2526;
    bool _2540 = uint(_2538) <= uint(_2532);
    _2515 = _2540 ? (-1) : 0;
    float _2542 = spvSubgroupShuffle(as_type<float>(_2512), uint(_2538));
    uint _2544 = uint(_2540 ? as_type<int>(_2542) : _2512);
    return int(_2544);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _575 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.cp_c5)._m0[int(_75)][_77];
    int _81 = _64;
    int _83 = 0;
    int _85 = _52(_81, _83, (*spvDescriptorSet0.support_buffer));
    int _87 = as_type<int>(_79);
    int _89 = 0;
    int _91 = _52(_87, _89, (*spvDescriptorSet0.support_buffer));
    int3 _1088 = int3(_85, _91, 1);
    float3 _95 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1088.xy), uint(_1088.z), 0).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    int _103 = _64;
    int _105 = 0;
    int _107 = _52(_103, _105, (*spvDescriptorSet0.support_buffer));
    int _109 = as_type<int>(_79);
    int _111 = 0;
    int _113 = _52(_109, _111, (*spvDescriptorSet0.support_buffer));
    int3 _1106 = int3(_107, _113, 0);
    float3 _115 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1106.xy), uint(_1106.z), 0).xyz;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    int _123 = _64;
    int _125 = 0;
    int _127 = _52(_123, _125, (*spvDescriptorSet0.support_buffer));
    int _129 = as_type<int>(_79);
    int _131 = 0;
    int _133 = _52(_129, _131, (*spvDescriptorSet0.support_buffer));
    int3 _1124 = int3(_127, _133, 2);
    float3 _135 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1124.xy), uint(_1124.z), 0).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    bool _143 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _145 = _97 * 0.15915493667125701904296875;
    float _147 = _101 * 0.15915493667125701904296875;
    float _149 = _99 * 0.15915493667125701904296875;
    float _151 = _145 * 6.283185482025146484375;
    float _153 = sin(_151);
    float _155 = _145 * 6.283185482025146484375;
    float _157 = cos(_155);
    float _159 = _147 * 6.283185482025146484375;
    float _161 = sin(_159);
    float _163 = _147 * 6.283185482025146484375;
    float _165 = cos(_163);
    float _167 = _149 * 6.283185482025146484375;
    float _169 = cos(_167);
    float _171 = _149 * 6.283185482025146484375;
    float _173 = sin(_171);
    float _175 = _157 * _165;
    float _177 = _161 * _157;
    float _179 = _153 * _161;
    float _181 = _153 * _165;
    float _183 = _157 * _169;
    float _185 = _153 * _169;
    float _187 = _153 * _173;
    float _189 = fma(_173, _175, _179);
    float _191 = _169 * _117;
    float _193 = -_181;
    float _195 = fma(_173, _177, _193);
    float _197 = fma(_161, _187, _175);
    float _199 = -_177;
    float _201 = fma(_165, _187, _199);
    float _203 = _117 * _173;
    float _205 = _165 * _191;
    float _207 = _161 * _191;
    float _209 = _119 * _185;
    float _211 = _119 * _201;
    float _213 = _119 * _197;
    float _215 = _121 * _183;
    float _217 = _121 * _189;
    float _219 = _121 * _195;
    int _221 = _64 * 112;
    bool _223 = !_143;
    float _225 = _217;
    float _553;
    float _555;
    float _557;
    float _559;
    float _561;
    float _563;
    float _565;
    float _567;
    float _569;
    float _571;
    float _573;
    if (!_223)
    {
        float _227 = -_203;
        float _229 = _227 + (-0.0);
        int _231 = 0;
        float _233 = _205;
        float _235 = _211;
        float _237 = _217;
        float _239 = _137;
        float _241 = _207;
        float _243 = _213;
        float _245 = _219;
        float _247 = _139;
        float _249 = _229;
        float _251 = _209;
        float _253 = _215;
        float _255 = _141;
        bool _257;
        int _305;
        int _315;
        int _325;
        int _335;
        int _345;
        int _355;
        int _365;
        int _375;
        int _385;
        int _395;
        int _405;
        int _415;
        int _529;
        int _533;
        int _535;
        float _537;
        float _539;
        int _543;
        int _547;
        int _549;
        int _551;
        do
        {
            int _259 = _231;
            int _261 = as_type<int>(_233);
            int _263 = as_type<int>(_235);
            int _265 = as_type<int>(_237);
            int _267 = as_type<int>(_239);
            float _269 = _241;
            float _271 = _243;
            int _273 = as_type<int>(_245);
            int _275 = as_type<int>(_247);
            int _277 = as_type<int>(_249);
            int _279 = as_type<int>(_251);
            int _281 = as_type<int>(_253);
            int _283 = as_type<int>(_255);
            uint _285 = uint(int(uint(_221) >> uint(2)));
            uint _287 = uint(int(uint(int(_285)) >> uint(2)));
            int _289 = int(_285) & 3;
            float _291 = (*spvDescriptorSet0.cp_c6)._m0[int(_287)][_289];
            bool _293 = _64 != 0;
            int _295 = _259 + 1;
            bool _297 = uint(_295) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _299 = _261;
            int _301 = as_type<int>(_291);
            int _303 = 31;
            int _1322 = _54(_299, _301, _303, _305, gl_SubgroupInvocationID);
            int _307 = _1322;
            int _309 = _263;
            int _311 = as_type<int>(_291);
            int _313 = 31;
            int _1326 = _54(_309, _311, _313, _315, gl_SubgroupInvocationID);
            int _317 = _1326;
            int _319 = _265;
            int _321 = as_type<int>(_291);
            int _323 = 31;
            int _1330 = _54(_319, _321, _323, _325, gl_SubgroupInvocationID);
            int _327 = _1330;
            int _329 = _267;
            int _331 = as_type<int>(_291);
            int _333 = 31;
            int _1334 = _54(_329, _331, _333, _335, gl_SubgroupInvocationID);
            int _337 = _1334;
            int _339 = as_type<int>(_269);
            int _341 = as_type<int>(_291);
            int _343 = 31;
            int _1339 = _54(_339, _341, _343, _345, gl_SubgroupInvocationID);
            int _347 = _1339;
            int _349 = as_type<int>(_271);
            int _351 = as_type<int>(_291);
            int _353 = 31;
            int _1344 = _54(_349, _351, _353, _355, gl_SubgroupInvocationID);
            int _357 = _1344;
            int _359 = _273;
            int _361 = as_type<int>(_291);
            int _363 = 31;
            int _1348 = _54(_359, _361, _363, _365, gl_SubgroupInvocationID);
            int _367 = _1348;
            int _369 = _275;
            int _371 = as_type<int>(_291);
            int _373 = 31;
            int _1352 = _54(_369, _371, _373, _375, gl_SubgroupInvocationID);
            int _377 = _1352;
            int _379 = _277;
            int _381 = as_type<int>(_291);
            int _383 = 31;
            int _1356 = _54(_379, _381, _383, _385, gl_SubgroupInvocationID);
            int _387 = _1356;
            int _389 = _279;
            int _391 = as_type<int>(_291);
            int _393 = 31;
            int _1360 = _54(_389, _391, _393, _395, gl_SubgroupInvocationID);
            int _397 = _1360;
            int _399 = _281;
            int _401 = as_type<int>(_291);
            int _403 = 31;
            int _1364 = _54(_399, _401, _403, _405, gl_SubgroupInvocationID);
            int _407 = _1364;
            int _409 = _283;
            int _411 = as_type<int>(_291);
            int _413 = 31;
            int _1368 = _54(_409, _411, _413, _415, gl_SubgroupInvocationID);
            int _417 = _1368;
            bool _419 = !_293;
            _231 = _295;
            int _421 = _261;
            int _423 = _263;
            int _425 = _265;
            int _427 = _267;
            float _429 = _269;
            float _431 = _271;
            int _433 = _273;
            int _435 = _275;
            int _437 = _277;
            int _439 = _279;
            int _441 = _281;
            int _443 = _283;
            if (!_419)
            {
                float _445 = _207 * as_type<float>(_317);
                float _447 = _219 * as_type<float>(_317);
                float _449 = _139 * as_type<float>(_317);
                float _451 = _219 * as_type<float>(_357);
                float _453 = fma(_205, as_type<float>(_307), _445);
                float _455 = fma(_217, as_type<float>(_307), _447);
                float _457 = fma(_137, as_type<float>(_307), _449);
                float _459 = _207 * as_type<float>(_357);
                float _461 = _213 * as_type<float>(_357);
                float _463 = _139 * as_type<float>(_357);
                float _465 = _213 * as_type<float>(_317);
                float _467 = fma(_205, as_type<float>(_347), _459);
                float _469 = fma(_211, as_type<float>(_347), _461);
                float _471 = fma(_217, as_type<float>(_347), _451);
                float _473 = fma(_137, as_type<float>(_347), _463);
                float _475 = _139 * as_type<float>(_397);
                float _477 = fma(_211, as_type<float>(_307), _465);
                float _479 = _207 * as_type<float>(_397);
                float _481 = _213 * as_type<float>(_397);
                float _483 = _219 * as_type<float>(_397);
                float _485 = fma(_137, as_type<float>(_387), _475);
                float _487 = fma(_205, as_type<float>(_387), _479);
                float _489 = fma(_209, as_type<float>(_327), _477);
                float _491 = -_203;
                float _493 = fma(_491, as_type<float>(_327), _453);
                float _495 = -_203;
                float _497 = fma(_495, as_type<float>(_367), _467);
                float _499 = fma(_211, as_type<float>(_387), _481);
                float _501 = fma(_215, as_type<float>(_327), _455);
                float _503 = fma(_209, as_type<float>(_367), _469);
                float _505 = fma(_215, as_type<float>(_367), _471);
                float _507 = fma(_217, as_type<float>(_387), _483);
                float _509 = fma(_141, as_type<float>(_327), _457);
                float _511 = fma(_141, as_type<float>(_367), _473);
                float _513 = fma(_141, as_type<float>(_407), _485);
                float _515 = -_203;
                float _517 = fma(_515, as_type<float>(_407), _487);
                float _519 = fma(_209, as_type<float>(_407), _499);
                float _521 = fma(_215, as_type<float>(_407), _507);
                float _523 = as_type<float>(_337) + _509;
                float _525 = as_type<float>(_377) + _511;
                float _527 = as_type<float>(_417) + _513;
                _421 = as_type<int>(_493);
                _423 = as_type<int>(_489);
                _425 = as_type<int>(_501);
                _427 = as_type<int>(_523);
                _429 = _497;
                _431 = _503;
                _433 = as_type<int>(_505);
                _435 = as_type<int>(_525);
                _437 = as_type<int>(_517);
                _439 = as_type<int>(_519);
                _441 = as_type<int>(_521);
                _443 = as_type<int>(_527);
            }
            _529 = _421;
            int _531 = _423;
            _533 = _425;
            _535 = _427;
            _537 = _429;
            _539 = _431;
            int _541 = _433;
            _543 = _435;
            int _545 = _437;
            _547 = _439;
            _549 = _441;
            _551 = _443;
            _257 = !_297;
            _233 = as_type<float>(_529);
            _235 = as_type<float>(_531);
            _237 = as_type<float>(_533);
            _239 = as_type<float>(_535);
            _241 = _537;
            _243 = _539;
            _245 = as_type<float>(_541);
            _247 = as_type<float>(_543);
            _249 = as_type<float>(_545);
            _251 = as_type<float>(_547);
            _253 = as_type<float>(_549);
            _255 = as_type<float>(_551);
            _553 = as_type<float>(_531);
            _555 = as_type<float>(_545);
            _557 = as_type<float>(_541);
        } while (_257);
        _559 = _539;
        _561 = as_type<float>(_547);
        _563 = as_type<float>(_529);
        _565 = _537;
        _567 = as_type<float>(_549);
        _569 = as_type<float>(_543);
        _571 = as_type<float>(_551);
        _225 = as_type<float>(_533);
        _573 = as_type<float>(_535);
        _575 = true;
    }
    else
    {
        float _577 = -_203;
        float _579 = _577 + (-0.0);
        _553 = _211;
        _559 = _213;
        _561 = _209;
        _563 = _205;
        _565 = _207;
        _555 = _579;
        _557 = _219;
        _567 = _215;
        _569 = _139;
        _571 = _141;
        _573 = _137;
    }
    _575 = false;
    float _581 = _553;
    float _583 = _559;
    float _585 = _561;
    float _587 = _563;
    float _589 = _565;
    float _591 = _555;
    float _593 = _557;
    float _595 = _567;
    float _597 = _569;
    float _599 = _571;
    float _601 = _225;
    float _603 = _573;
    int _605 = _221 + 80;
    uint _607 = uint(int(uint(_605) >> uint(2)));
    uint _609 = uint(int(uint(int(_607)) >> uint(2)));
    int _611 = int(_607) & 3;
    float _613 = (*spvDescriptorSet0.cp_c6)._m0[int(_609)][_611];
    int _615 = int(_607) + 1;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    int _619 = _615 & 3;
    float _621 = (*spvDescriptorSet0.cp_c6)._m0[int(_617)][_619];
    int _623 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _625 = _623 + _64;
    int _627 = _221 + 64;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.cp_c6)._m0[int(_631)][_633];
    int _637 = int(_629) + 1;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    int _641 = _637 & 3;
    float _643 = (*spvDescriptorSet0.cp_c6)._m0[int(_639)][_641];
    int _645 = _625 * 48;
    int _647 = _221 + 88;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.cp_c6)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.cp_c6)._m0[int(_659)][_661];
    int _665 = _221 + 72;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.cp_c6)._m0[int(_669)][_671];
    int _675 = int(_667) + 1;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    int _679 = _675 & 3;
    float _681 = (*spvDescriptorSet0.cp_c6)._m0[int(_677)][_679];
    int _683 = _221 + 104;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.cp_c6)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.cp_c6)._m0[int(_695)][_697];
    int _701 = _221 + 96;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    uint _705 = uint(int(uint(int(_703)) >> uint(2)));
    int _707 = int(_703) & 3;
    float _709 = (*spvDescriptorSet0.cp_c6)._m0[int(_705)][_707];
    int _711 = int(_703) + 1;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    int _715 = _711 & 3;
    float _717 = (*spvDescriptorSet0.cp_c6)._m0[int(_713)][_715];
    float _719 = _581 * _613;
    float _721 = _583 * _613;
    float _723 = _585 * _613;
    float _725 = _581 * _621;
    float _727 = _585 * _621;
    int _729 = _221 + 16;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.cp_c6)._m0[int(_741)][_743];
    float _747 = fma(_587, _635, _719);
    float _749 = fma(_589, _635, _721);
    float _751 = fma(_591, _635, _723);
    float _753 = _583 * _621;
    float _755 = fma(_587, _643, _725);
    int _757 = _221 + 32;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.cp_c6)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.cp_c6)._m0[int(_769)][_771];
    float _775 = fma(_591, _643, _727);
    float _777 = fma(_589, _643, _753);
    float _779 = _581 * _655;
    float _781 = _581 * _663;
    float _783 = _583 * _655;
    float _785 = _583 * _663;
    float _787 = _585 * _655;
    int _789 = _221 + 48;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
    int _799 = int(_791) + 1;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    int _803 = _799 & 3;
    float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
    float _807 = _585 * _663;
    float _809 = fma(_587, _673, _779);
    float _811 = fma(_587, _681, _781);
    float _813 = fma(_589, _673, _783);
    float _815 = fma(_589, _681, _785);
    float _817 = fma(_591, _673, _787);
    int _819 = _221 + 24;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    uint _823 = uint(int(uint(int(_821)) >> uint(2)));
    int _825 = int(_821) & 3;
    float _827 = (*spvDescriptorSet0.cp_c6)._m0[int(_823)][_825];
    int _829 = int(_821) + 1;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    int _833 = _829 & 3;
    float _835 = (*spvDescriptorSet0.cp_c6)._m0[int(_831)][_833];
    float _837 = fma(_591, _681, _807);
    float _839 = fma(_593, _699, _815);
    float _841 = fma(_595, _699, _837);
    float _843 = _839 + _597;
    int _845 = _221 + 40;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    uint _849 = uint(int(uint(int(_847)) >> uint(2)));
    int _851 = int(_847) & 3;
    float _853 = (*spvDescriptorSet0.cp_c6)._m0[int(_849)][_851];
    int _855 = int(_847) + 1;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    int _859 = _855 & 3;
    float _861 = (*spvDescriptorSet0.cp_c6)._m0[int(_857)][_859];
    float _863 = _841 + _599;
    float _865 = fma(_601, _709, _747);
    float _867 = fma(_601, _691, _809);
    float _869 = fma(_593, _709, _749);
    float _871 = fma(_595, _709, _751);
    float _873 = fma(_601, _699, _811);
    int _875 = _221 + 56;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.cp_c6)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.cp_c6)._m0[int(_887)][_889];
    float _893 = fma(_593, _717, _777);
    float _895 = fma(_593, _691, _813);
    float _897 = fma(_601, _717, _755);
    float _899 = fma(_595, _717, _775);
    float _901 = fma(_595, _691, _817);
    float _903 = _873 + _603;
    float _905 = _869 * _745;
    float _907 = _893 * _745;
    float _909 = _895 * _745;
    float _911 = _843 * _745;
    float _913 = fma(_865, _737, _905);
    float _915 = fma(_897, _737, _907);
    float _917 = fma(_867, _737, _909);
    float _919 = fma(_903, _737, _911);
    float _921 = _843 * _773;
    float _923 = _869 * _773;
    float _925 = _893 * _773;
    float _927 = _895 * _773;
    float _929 = fma(_903, _765, _921);
    float _931 = fma(_865, _765, _923);
    float _933 = fma(_897, _765, _925);
    float _935 = fma(_867, _765, _927);
    float _937 = _843 * _805;
    float _939 = _869 * _805;
    float _941 = _893 * _805;
    float _943 = _895 * _805;
    float _945 = fma(_903, _797, _937);
    float _947 = fma(_865, _797, _939);
    float _949 = fma(_897, _797, _941);
    float _951 = fma(_867, _797, _943);
    float _953 = fma(_863, _827, _919);
    float _955 = fma(_899, _827, _915);
    float _957 = fma(_871, _827, _913);
    float _959 = fma(_901, _827, _917);
    float _961 = _953 + _835;
    float _963 = fma(_863, _853, _929);
    float _965 = fma(_871, _853, _931);
    float _967 = fma(_899, _853, _933);
    int _969 = _645 + 16;
    float _971 = fma(_901, _853, _935);
    float _973 = _963 + _861;
    int _975 = _645 + 32;
    float _977 = fma(_863, _883, _945);
    float _979 = fma(_871, _883, _947);
    float _981 = fma(_899, _883, _949);
    float _983 = fma(_901, _883, _951);
    float _985 = _977 + _891;
    int _987 = _645 + 48;
    uint _989 = uint(int(uint(_969) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_989)] = as_type<uint>(_957);
    int _991 = _969 + 4;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_993)] = as_type<uint>(_955);
    int _995 = _969 + 8;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_997)] = as_type<uint>(_959);
    int _999 = _969 + 12;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1001)] = as_type<uint>(_961);
    uint _1003 = uint(int(uint(_975) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1003)] = as_type<uint>(_965);
    int _1005 = _975 + 4;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1007)] = as_type<uint>(_967);
    int _1009 = _975 + 8;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1011)] = as_type<uint>(_971);
    int _1013 = _975 + 12;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1015)] = as_type<uint>(_973);
    uint _1017 = uint(int(uint(_987) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1017)] = as_type<uint>(_979);
    int _1019 = _987 + 4;
    uint _1021 = uint(int(uint(_1019) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1021)] = as_type<uint>(_981);
    int _1023 = _987 + 8;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1025)] = as_type<uint>(_983);
    int _1027 = _987 + 12;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1029)] = as_type<uint>(_985);
}

