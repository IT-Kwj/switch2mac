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
int _54(thread const int& _2774, thread const int& _2775, constant _10& support_buffer)
{
    int _2778 = 1 + _2775;
    float _2780 = support_buffer._m5[_2778].x;
    bool _2782 = _2780 == 1.0;
    if (_2782)
    {
        return _2774;
    }
    float _2784 = float(_2774);
    float _2786 = _2784 * _2780;
    int _2788 = int(_2786);
    return _2788;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2810, thread const int& _2811, thread const int& _2812, thread int& _2813, thread uint& gl_SubgroupInvocationID)
{
    int _2816 = _2812 & 31;
    uint _2818 = uint(int(uint(_2812) >> uint(8)));
    int _2820 = int(_2818) & 31;
    float _2822 = as_type<float>(gl_SubgroupInvocationID);
    int _2824 = as_type<int>(_2822) & _2820;
    int _2826 = ~_2820;
    int _2828 = _2816 & _2826;
    int _2830 = _2828 | _2824;
    int _2832 = ~_2820;
    int _2834 = _2811 & _2832;
    int _2836 = _2834 | _2824;
    bool _2838 = uint(_2836) <= uint(_2830);
    _2813 = _2838 ? (-1) : 0;
    float _2840 = spvSubgroupShuffle(as_type<float>(_2810), uint(_2836));
    uint _2842 = uint(_2838 ? as_type<int>(_2840) : _2810);
    return int(_2842);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _703 = false;
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
    int _74 = _72 + 8;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    uint _85 = uint(int(uint(_72) >> uint(2)));
    uint _87 = uint(int(uint(int(_85)) >> uint(2)));
    int _89 = int(_85) & 3;
    float _91 = (*spvDescriptorSet0.cp_c5)._m0[int(_87)][_89];
    int _93 = _66;
    int _95 = 0;
    int _97 = _54(_93, _95, (*spvDescriptorSet0.support_buffer));
    int _99 = as_type<int>(_83);
    int _101 = 0;
    int _103 = _54(_99, _101, (*spvDescriptorSet0.support_buffer));
    int3 _1234 = int3(_97, _103, 1);
    float3 _107 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1234.xy), uint(_1234.z), 0).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    int _115 = _66;
    int _117 = 1;
    int _119 = _54(_115, _117, (*spvDescriptorSet0.support_buffer));
    int _121 = as_type<int>(_91);
    int _123 = 1;
    int _125 = _54(_121, _123, (*spvDescriptorSet0.support_buffer));
    int3 _1252 = int3(_119, _125, 1);
    float3 _127 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1252.xy), uint(_1252.z), 0).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    int _135 = _66;
    int _137 = 0;
    int _139 = _54(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = as_type<int>(_83);
    int _143 = 0;
    int _145 = _54(_141, _143, (*spvDescriptorSet0.support_buffer));
    int3 _1270 = int3(_139, _145, 0);
    float3 _147 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1270.xy), uint(_1270.z), 0).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    int _155 = _66;
    int _157 = 1;
    int _159 = _54(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = as_type<int>(_91);
    int _163 = 1;
    int _165 = _54(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _1288 = int3(_159, _165, 0);
    float3 _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1288.xy), uint(_1288.z), 0).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    int _175 = _66;
    int _177 = 0;
    int _179 = _54(_175, _177, (*spvDescriptorSet0.support_buffer));
    int _181 = as_type<int>(_83);
    int _183 = 0;
    int _185 = _54(_181, _183, (*spvDescriptorSet0.support_buffer));
    int3 _1306 = int3(_179, _185, 2);
    float3 _187 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1306.xy), uint(_1306.z), 0).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    int _195 = _66;
    int _197 = 1;
    int _199 = _54(_195, _197, (*spvDescriptorSet0.support_buffer));
    int _201 = as_type<int>(_91);
    int _203 = 1;
    int _205 = _54(_201, _203, (*spvDescriptorSet0.support_buffer));
    int3 _1324 = int3(_199, _205, 2);
    float3 _207 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1324.xy), uint(_1324.z), 0).xyz;
    float _209 = _207.x;
    float _211 = _207.y;
    float _213 = _207.z;
    int _215 = _72 + 28;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.cp_c5)._m0[int(_219)][_221];
    bool _225 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _227 = _72 + 20;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    uint _231 = uint(int(uint(int(_229)) >> uint(2)));
    int _233 = int(_229) & 3;
    float _235 = (*spvDescriptorSet0.cp_c5)._m0[int(_231)][_233];
    float _237 = _113 * _223;
    float _239 = _109 * _223;
    float _241 = fma(_133, _235, _237);
    float _243 = fma(_129, _235, _239);
    float _245 = _241 * 0.15915493667125701904296875;
    float _247 = _111 * _223;
    float _249 = _243 * 0.15915493667125701904296875;
    float _251 = _245 * 6.283185482025146484375;
    float _253 = sin(_251);
    float _255 = fma(_131, _235, _247);
    float _257 = _255 * 0.15915493667125701904296875;
    float _259 = _149 * _223;
    float _261 = _249 * 6.283185482025146484375;
    float _263 = sin(_261);
    float _265 = _249 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = _245 * 6.283185482025146484375;
    float _271 = cos(_269);
    float _273 = _263 * _253;
    float _275 = _257 * 6.283185482025146484375;
    float _277 = sin(_275);
    float _279 = _253 * _267;
    float _281 = _257 * 6.283185482025146484375;
    float _283 = cos(_281);
    float _285 = _267 * _271;
    float _287 = _263 * _271;
    float _289 = _263 * _277;
    float _291 = fma(_277, _285, _273);
    float _293 = fma(_169, _235, _259);
    float _295 = _151 * _223;
    float _297 = fma(_253, _289, _285);
    float _299 = -_279;
    float _301 = fma(_271, _289, _299);
    float _303 = -_287;
    float _305 = fma(_277, _279, _303);
    float _307 = _153 * _223;
    float _309 = _263 * _283;
    float _311 = _283 * _293;
    float _313 = fma(_171, _235, _295);
    float _315 = fma(_173, _235, _307);
    float _317 = _277 * _293;
    float _319 = _271 * _311;
    float _321 = _253 * _311;
    float _323 = _301 * _313;
    float _325 = _189 * _223;
    float _327 = _191 * _223;
    float _329 = _267 * _283;
    float _331 = _193 * _223;
    float _333 = _309 * _313;
    float _335 = fma(_211, _235, _327);
    float _337 = _297 * _313;
    float _339 = _329 * _315;
    float _341 = _291 * _315;
    float _343 = _305 * _315;
    float _345 = fma(_209, _235, _325);
    float _347 = fma(_213, _235, _331);
    int _349 = _66 * 112;
    bool _351 = !_225;
    float _353 = _347;
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
    float _701;
    if (!_351)
    {
        float _355 = -_317;
        float _357 = _355 + (-0.0);
        int _359 = 0;
        float _361 = _319;
        float _363 = _323;
        float _365 = _341;
        float _367 = _345;
        float _369 = _321;
        float _371 = _337;
        float _373 = _343;
        float _375 = _335;
        float _377 = _357;
        float _379 = _333;
        float _381 = _339;
        float _383 = _347;
        bool _385;
        int _433;
        int _443;
        int _453;
        int _463;
        int _473;
        int _483;
        int _493;
        int _503;
        int _513;
        int _523;
        int _533;
        int _543;
        int _657;
        int _661;
        int _663;
        int _667;
        float _669;
        int _671;
        float _675;
        int _677;
        int _679;
        do
        {
            int _387 = _359;
            int _389 = as_type<int>(_361);
            int _391 = as_type<int>(_363);
            int _393 = as_type<int>(_365);
            int _395 = as_type<int>(_367);
            int _397 = as_type<int>(_369);
            int _399 = as_type<int>(_371);
            float _401 = _373;
            int _403 = as_type<int>(_375);
            int _405 = as_type<int>(_377);
            float _407 = _379;
            int _409 = as_type<int>(_381);
            int _411 = as_type<int>(_383);
            uint _413 = uint(int(uint(_349) >> uint(2)));
            uint _415 = uint(int(uint(int(_413)) >> uint(2)));
            int _417 = int(_413) & 3;
            float _419 = (*spvDescriptorSet0.cp_c6)._m0[int(_415)][_417];
            bool _421 = _66 != 0;
            int _423 = _387 + 1;
            bool _425 = uint(_423) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _427 = _389;
            int _429 = as_type<int>(_419);
            int _431 = 31;
            int _1621 = _56(_427, _429, _431, _433, gl_SubgroupInvocationID);
            int _435 = _1621;
            int _437 = _391;
            int _439 = as_type<int>(_419);
            int _441 = 31;
            int _1625 = _56(_437, _439, _441, _443, gl_SubgroupInvocationID);
            int _445 = _1625;
            int _447 = _393;
            int _449 = as_type<int>(_419);
            int _451 = 31;
            int _1629 = _56(_447, _449, _451, _453, gl_SubgroupInvocationID);
            int _455 = _1629;
            int _457 = _395;
            int _459 = as_type<int>(_419);
            int _461 = 31;
            int _1633 = _56(_457, _459, _461, _463, gl_SubgroupInvocationID);
            int _465 = _1633;
            int _467 = _397;
            int _469 = as_type<int>(_419);
            int _471 = 31;
            int _1637 = _56(_467, _469, _471, _473, gl_SubgroupInvocationID);
            int _475 = _1637;
            int _477 = _399;
            int _479 = as_type<int>(_419);
            int _481 = 31;
            int _1641 = _56(_477, _479, _481, _483, gl_SubgroupInvocationID);
            int _485 = _1641;
            int _487 = as_type<int>(_401);
            int _489 = as_type<int>(_419);
            int _491 = 31;
            int _1646 = _56(_487, _489, _491, _493, gl_SubgroupInvocationID);
            int _495 = _1646;
            int _497 = _403;
            int _499 = as_type<int>(_419);
            int _501 = 31;
            int _1650 = _56(_497, _499, _501, _503, gl_SubgroupInvocationID);
            int _505 = _1650;
            int _507 = _405;
            int _509 = as_type<int>(_419);
            int _511 = 31;
            int _1654 = _56(_507, _509, _511, _513, gl_SubgroupInvocationID);
            int _515 = _1654;
            int _517 = as_type<int>(_407);
            int _519 = as_type<int>(_419);
            int _521 = 31;
            int _1659 = _56(_517, _519, _521, _523, gl_SubgroupInvocationID);
            int _525 = _1659;
            int _527 = _409;
            int _529 = as_type<int>(_419);
            int _531 = 31;
            int _1663 = _56(_527, _529, _531, _533, gl_SubgroupInvocationID);
            int _535 = _1663;
            int _537 = _411;
            int _539 = as_type<int>(_419);
            int _541 = 31;
            int _1667 = _56(_537, _539, _541, _543, gl_SubgroupInvocationID);
            int _545 = _1667;
            bool _547 = !_421;
            _359 = _423;
            int _549 = _389;
            int _551 = _391;
            int _553 = _393;
            int _555 = _395;
            int _557 = _397;
            int _559 = _399;
            float _561 = _401;
            int _563 = _403;
            int _565 = _405;
            float _567 = _407;
            int _569 = _409;
            int _571 = _411;
            if (!_547)
            {
                float _573 = _321 * as_type<float>(_445);
                float _575 = _343 * as_type<float>(_445);
                float _577 = _335 * as_type<float>(_445);
                float _579 = _337 * as_type<float>(_485);
                float _581 = fma(_319, as_type<float>(_435), _573);
                float _583 = fma(_341, as_type<float>(_435), _575);
                float _585 = fma(_345, as_type<float>(_435), _577);
                float _587 = _321 * as_type<float>(_485);
                float _589 = _343 * as_type<float>(_485);
                float _591 = _335 * as_type<float>(_485);
                float _593 = _337 * as_type<float>(_445);
                float _595 = fma(_319, as_type<float>(_475), _587);
                float _597 = fma(_323, as_type<float>(_475), _579);
                float _599 = fma(_341, as_type<float>(_475), _589);
                float _601 = fma(_345, as_type<float>(_475), _591);
                float _603 = _335 * as_type<float>(_525);
                float _605 = _321 * as_type<float>(_525);
                float _607 = _343 * as_type<float>(_525);
                float _609 = fma(_323, as_type<float>(_435), _593);
                float _611 = _337 * as_type<float>(_525);
                float _613 = fma(_345, as_type<float>(_515), _603);
                float _615 = fma(_319, as_type<float>(_515), _605);
                float _617 = fma(_341, as_type<float>(_515), _607);
                float _619 = fma(_339, as_type<float>(_455), _583);
                float _621 = fma(_323, as_type<float>(_515), _611);
                float _623 = -_317;
                float _625 = fma(_623, as_type<float>(_455), _581);
                float _627 = fma(_333, as_type<float>(_455), _609);
                float _629 = fma(_339, as_type<float>(_495), _599);
                float _631 = fma(_347, as_type<float>(_455), _585);
                float _633 = fma(_347, as_type<float>(_495), _601);
                float _635 = fma(_347, as_type<float>(_535), _613);
                float _637 = -_317;
                float _639 = fma(_637, as_type<float>(_495), _595);
                float _641 = fma(_333, as_type<float>(_495), _597);
                float _643 = fma(_333, as_type<float>(_535), _621);
                float _645 = -_317;
                float _647 = fma(_645, as_type<float>(_535), _615);
                float _649 = fma(_339, as_type<float>(_535), _617);
                float _651 = as_type<float>(_465) + _631;
                float _653 = as_type<float>(_505) + _633;
                float _655 = as_type<float>(_545) + _635;
                _549 = as_type<int>(_625);
                _551 = as_type<int>(_627);
                _553 = as_type<int>(_619);
                _555 = as_type<int>(_651);
                _557 = as_type<int>(_639);
                _559 = as_type<int>(_641);
                _561 = _629;
                _563 = as_type<int>(_653);
                _565 = as_type<int>(_647);
                _567 = _643;
                _569 = as_type<int>(_649);
                _571 = as_type<int>(_655);
            }
            _657 = _549;
            int _659 = _551;
            _661 = _553;
            _663 = _555;
            int _665 = _557;
            _667 = _559;
            _669 = _561;
            _671 = _563;
            int _673 = _565;
            _675 = _567;
            _677 = _569;
            _679 = _571;
            _385 = !_425;
            _361 = as_type<float>(_657);
            _363 = as_type<float>(_659);
            _365 = as_type<float>(_661);
            _367 = as_type<float>(_663);
            _369 = as_type<float>(_665);
            _371 = as_type<float>(_667);
            _373 = _669;
            _375 = as_type<float>(_671);
            _377 = as_type<float>(_673);
            _379 = _675;
            _381 = as_type<float>(_677);
            _383 = as_type<float>(_679);
            _681 = as_type<float>(_659);
            _683 = as_type<float>(_665);
            _685 = as_type<float>(_673);
        } while (_385);
        _687 = as_type<float>(_667);
        _689 = _675;
        _691 = as_type<float>(_657);
        _693 = _669;
        _695 = as_type<float>(_671);
        _697 = as_type<float>(_661);
        _699 = as_type<float>(_677);
        _701 = as_type<float>(_663);
        _353 = as_type<float>(_679);
        _703 = true;
    }
    else
    {
        float _705 = -_317;
        float _707 = _705 + (-0.0);
        _681 = _323;
        _687 = _337;
        _689 = _333;
        _691 = _319;
        _683 = _321;
        _685 = _707;
        _693 = _343;
        _695 = _335;
        _697 = _341;
        _699 = _339;
        _701 = _345;
    }
    _703 = false;
    float _709 = _681;
    float _711 = _687;
    float _713 = _689;
    float _715 = _691;
    float _717 = _683;
    float _719 = _685;
    float _721 = _693;
    float _723 = _695;
    float _725 = _697;
    float _727 = _699;
    float _729 = _701;
    float _731 = _353;
    int _733 = _349 + 80;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.cp_c6)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.cp_c6)._m0[int(_745)][_747];
    int _751 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _753 = _751 + _66;
    int _755 = _349 + 64;
    uint _757 = uint(int(uint(_755) >> uint(2)));
    uint _759 = uint(int(uint(int(_757)) >> uint(2)));
    int _761 = int(_757) & 3;
    float _763 = (*spvDescriptorSet0.cp_c6)._m0[int(_759)][_761];
    int _765 = int(_757) + 1;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    int _769 = _765 & 3;
    float _771 = (*spvDescriptorSet0.cp_c6)._m0[int(_767)][_769];
    int _773 = _753 * 48;
    int _775 = _349 + 88;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    uint _779 = uint(int(uint(int(_777)) >> uint(2)));
    int _781 = int(_777) & 3;
    float _783 = (*spvDescriptorSet0.cp_c6)._m0[int(_779)][_781];
    int _785 = int(_777) + 1;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    int _789 = _785 & 3;
    float _791 = (*spvDescriptorSet0.cp_c6)._m0[int(_787)][_789];
    int _793 = _349 + 72;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.cp_c6)._m0[int(_797)][_799];
    int _803 = int(_795) + 1;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    int _807 = _803 & 3;
    float _809 = (*spvDescriptorSet0.cp_c6)._m0[int(_805)][_807];
    int _811 = _349 + 104;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.cp_c6)._m0[int(_815)][_817];
    int _821 = int(_813) + 1;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    int _825 = _821 & 3;
    float _827 = (*spvDescriptorSet0.cp_c6)._m0[int(_823)][_825];
    int _829 = _349 + 96;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    uint _833 = uint(int(uint(int(_831)) >> uint(2)));
    int _835 = int(_831) & 3;
    float _837 = (*spvDescriptorSet0.cp_c6)._m0[int(_833)][_835];
    int _839 = int(_831) + 1;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    int _843 = _839 & 3;
    float _845 = (*spvDescriptorSet0.cp_c6)._m0[int(_841)][_843];
    float _847 = _709 * _741;
    float _849 = _711 * _741;
    float _851 = _713 * _741;
    int _853 = _349 + 16;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    uint _857 = uint(int(uint(int(_855)) >> uint(2)));
    int _859 = int(_855) & 3;
    float _861 = (*spvDescriptorSet0.cp_c6)._m0[int(_857)][_859];
    int _863 = int(_855) + 1;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    int _867 = _863 & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    float _871 = _713 * _749;
    float _873 = fma(_715, _763, _847);
    float _875 = fma(_717, _763, _849);
    float _877 = fma(_719, _763, _851);
    float _879 = _709 * _749;
    int _881 = _349 + 32;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    float _899 = _711 * _749;
    float _901 = fma(_719, _771, _871);
    float _903 = fma(_715, _771, _879);
    float _905 = _709 * _783;
    float _907 = _709 * _791;
    float _909 = _711 * _783;
    float _911 = _711 * _791;
    int _913 = _349 + 48;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    float _931 = _713 * _783;
    float _933 = _713 * _791;
    float _935 = fma(_717, _771, _899);
    float _937 = fma(_715, _801, _905);
    float _939 = fma(_715, _809, _907);
    float _941 = fma(_717, _801, _909);
    float _943 = fma(_717, _809, _911);
    int _945 = _349 + 24;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    uint _949 = uint(int(uint(int(_947)) >> uint(2)));
    int _951 = int(_947) & 3;
    float _953 = (*spvDescriptorSet0.cp_c6)._m0[int(_949)][_951];
    int _955 = int(_947) + 1;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    int _959 = _955 & 3;
    float _961 = (*spvDescriptorSet0.cp_c6)._m0[int(_957)][_959];
    float _963 = fma(_719, _801, _931);
    float _965 = fma(_719, _809, _933);
    float _967 = fma(_721, _827, _943);
    int _969 = _349 + 40;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    uint _973 = uint(int(uint(int(_971)) >> uint(2)));
    int _975 = int(_971) & 3;
    float _977 = (*spvDescriptorSet0.cp_c6)._m0[int(_973)][_975];
    int _979 = int(_971) + 1;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    int _983 = _979 & 3;
    float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
    float _987 = _967 + _723;
    float _989 = fma(_725, _837, _873);
    float _991 = fma(_721, _837, _875);
    float _993 = fma(_727, _837, _877);
    float _995 = fma(_725, _845, _903);
    int _997 = _349 + 56;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.cp_c6)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.cp_c6)._m0[int(_1009)][_1011];
    float _1015 = fma(_725, _819, _937);
    float _1017 = fma(_725, _827, _939);
    float _1019 = fma(_727, _827, _965);
    float _1021 = fma(_721, _845, _935);
    float _1023 = fma(_721, _819, _941);
    float _1025 = fma(_727, _819, _963);
    float _1027 = _1017 + _729;
    float _1029 = _1019 + _731;
    float _1031 = _987 * _869;
    float _1033 = _991 * _869;
    float _1035 = _1021 * _869;
    float _1037 = _1023 * _869;
    float _1039 = fma(_1027, _861, _1031);
    float _1041 = fma(_989, _861, _1033);
    float _1043 = fma(_995, _861, _1035);
    float _1045 = _987 * _897;
    float _1047 = fma(_1015, _861, _1037);
    float _1049 = _991 * _897;
    float _1051 = fma(_727, _845, _901);
    float _1053 = _1021 * _897;
    float _1055 = _1023 * _897;
    float _1057 = fma(_1027, _889, _1045);
    float _1059 = fma(_989, _889, _1049);
    float _1061 = _987 * _929;
    float _1063 = _991 * _929;
    float _1065 = _1021 * _929;
    float _1067 = _1023 * _929;
    float _1069 = fma(_1027, _921, _1061);
    float _1071 = fma(_995, _889, _1053);
    float _1073 = fma(_1015, _889, _1055);
    float _1075 = fma(_989, _921, _1063);
    float _1077 = fma(_1029, _953, _1039);
    float _1079 = fma(_995, _921, _1065);
    float _1081 = fma(_1015, _921, _1067);
    float _1083 = fma(_993, _953, _1041);
    float _1085 = _1077 + _961;
    float _1087 = fma(_1051, _953, _1043);
    float _1089 = fma(_1025, _953, _1047);
    float _1091 = fma(_1029, _977, _1057);
    float _1093 = fma(_993, _977, _1059);
    float _1095 = fma(_1051, _977, _1071);
    int _1097 = _773 + 16;
    float _1099 = fma(_1025, _977, _1073);
    float _1101 = _1091 + _985;
    int _1103 = _773 + 32;
    float _1105 = fma(_1029, _1005, _1069);
    float _1107 = fma(_993, _1005, _1075);
    float _1109 = fma(_1051, _1005, _1079);
    float _1111 = fma(_1025, _1005, _1081);
    float _1113 = _1105 + _1013;
    int _1115 = _773 + 48;
    uint _1117 = uint(int(uint(_1097) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1117)] = as_type<uint>(_1083);
    int _1119 = _1097 + 4;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1121)] = as_type<uint>(_1087);
    int _1123 = _1097 + 8;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1125)] = as_type<uint>(_1089);
    int _1127 = _1097 + 12;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1129)] = as_type<uint>(_1085);
    uint _1131 = uint(int(uint(_1103) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1131)] = as_type<uint>(_1093);
    int _1133 = _1103 + 4;
    uint _1135 = uint(int(uint(_1133) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1135)] = as_type<uint>(_1095);
    int _1137 = _1103 + 8;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1139)] = as_type<uint>(_1099);
    int _1141 = _1103 + 12;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1143)] = as_type<uint>(_1101);
    uint _1145 = uint(int(uint(_1115) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1145)] = as_type<uint>(_1107);
    int _1147 = _1115 + 4;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1149)] = as_type<uint>(_1109);
    int _1151 = _1115 + 8;
    uint _1153 = uint(int(uint(_1151) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1153)] = as_type<uint>(_1111);
    int _1155 = _1115 + 12;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1157)] = as_type<uint>(_1113);
}

