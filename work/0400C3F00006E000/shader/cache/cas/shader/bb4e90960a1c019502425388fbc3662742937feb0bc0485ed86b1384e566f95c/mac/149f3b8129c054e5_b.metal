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
int _52(thread const int& _2779, thread const int& _2780, constant _10& support_buffer)
{
    int _2783 = 1 + _2780;
    float _2785 = support_buffer._m5[_2783].x;
    bool _2787 = _2785 == 1.0;
    if (_2787)
    {
        return _2779;
    }
    float _2789 = float(_2779);
    float _2791 = _2789 * _2785;
    int _2793 = int(_2791);
    return _2793;
}

static inline __attribute__((always_inline))
int _54(thread const int& _2815, thread const int& _2816, thread const int& _2817, thread int& _2818, thread uint& gl_SubgroupInvocationID)
{
    int _2821 = _2817 & 31;
    uint _2823 = uint(int(uint(_2817) >> uint(8)));
    int _2825 = int(_2823) & 31;
    float _2827 = as_type<float>(gl_SubgroupInvocationID);
    int _2829 = as_type<int>(_2827) & _2825;
    int _2831 = ~_2825;
    int _2833 = _2821 & _2831;
    int _2835 = _2833 | _2829;
    int _2837 = ~_2825;
    int _2839 = _2816 & _2837;
    int _2841 = _2839 | _2829;
    bool _2843 = uint(_2841) <= uint(_2835);
    _2818 = _2843 ? (-1) : 0;
    float _2845 = spvSubgroupShuffle(as_type<float>(_2815), uint(_2841));
    uint _2847 = uint(_2843 ? as_type<int>(_2845) : _2815);
    return int(_2847);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _707 = false;
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
    int _81 = int(_73) + 1;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    int _85 = _81 & 3;
    float _87 = (*spvDescriptorSet0.cp_c5)._m0[int(_83)][_85];
    int _89 = _64;
    int _91 = 0;
    int _93 = _52(_89, _91, (*spvDescriptorSet0.support_buffer));
    int _95 = as_type<int>(_79);
    int _97 = 0;
    int _99 = _52(_95, _97, (*spvDescriptorSet0.support_buffer));
    int3 _1233 = int3(_93, _99, 1);
    float3 _103 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1233.xy), uint(_1233.z), 0).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    int _111 = _64;
    int _113 = 0;
    int _115 = _52(_111, _113, (*spvDescriptorSet0.support_buffer));
    int _117 = as_type<int>(_87);
    int _119 = 0;
    int _121 = _52(_117, _119, (*spvDescriptorSet0.support_buffer));
    int3 _1251 = int3(_115, _121, 1);
    float3 _123 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1251.xy), uint(_1251.z), 0).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    int _131 = _64;
    int _133 = 0;
    int _135 = _52(_131, _133, (*spvDescriptorSet0.support_buffer));
    int _137 = as_type<int>(_79);
    int _139 = 0;
    int _141 = _52(_137, _139, (*spvDescriptorSet0.support_buffer));
    int3 _1269 = int3(_135, _141, 0);
    float3 _143 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1269.xy), uint(_1269.z), 0).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    int _151 = _64;
    int _153 = 0;
    int _155 = _52(_151, _153, (*spvDescriptorSet0.support_buffer));
    int _157 = as_type<int>(_87);
    int _159 = 0;
    int _161 = _52(_157, _159, (*spvDescriptorSet0.support_buffer));
    int3 _1287 = int3(_155, _161, 0);
    float3 _163 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1287.xy), uint(_1287.z), 0).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    int _171 = _64;
    int _173 = 0;
    int _175 = _52(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = as_type<int>(_79);
    int _179 = 0;
    int _181 = _52(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _1305 = int3(_175, _181, 2);
    float3 _183 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1305.xy), uint(_1305.z), 0).xyz;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    int _191 = _64;
    int _193 = 0;
    int _195 = _52(_191, _193, (*spvDescriptorSet0.support_buffer));
    int _197 = as_type<int>(_87);
    int _199 = 0;
    int _201 = _52(_197, _199, (*spvDescriptorSet0.support_buffer));
    int3 _1323 = int3(_195, _201, 2);
    float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1323.xy), uint(_1323.z), 0).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    int _211 = _70 + 16;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    uint _215 = uint(int(uint(int(_213)) >> uint(2)));
    int _217 = int(_213) & 3;
    float _219 = (*spvDescriptorSet0.cp_c5)._m0[int(_215)][_217];
    bool _221 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _223 = -_105;
    float _225 = _223 + _125;
    float _227 = -_109;
    float _229 = _227 + _129;
    float _231 = -_107;
    float _233 = _231 + _127;
    float _235 = fma(_225, _219, _105);
    float _237 = fma(_229, _219, _109);
    float _239 = fma(_233, _219, _107);
    float _241 = _235 * 0.15915493667125701904296875;
    float _243 = _237 * 0.15915493667125701904296875;
    float _245 = _239 * 0.15915493667125701904296875;
    float _247 = _241 * 6.283185482025146484375;
    float _249 = sin(_247);
    float _251 = _241 * 6.283185482025146484375;
    float _253 = cos(_251);
    float _255 = _243 * 6.283185482025146484375;
    float _257 = sin(_255);
    float _259 = _243 * 6.283185482025146484375;
    float _261 = cos(_259);
    float _263 = _245 * 6.283185482025146484375;
    float _265 = sin(_263);
    float _267 = -_145;
    float _269 = _267 + _165;
    float _271 = -_149;
    float _273 = _271 + _169;
    float _275 = _245 * 6.283185482025146484375;
    float _277 = cos(_275);
    float _279 = _253 * _261;
    float _281 = _249 * _257;
    float _283 = _257 * _253;
    float _285 = fma(_269, _219, _145);
    float _287 = _249 * _261;
    float _289 = -_189;
    float _291 = _289 + _209;
    float _293 = fma(_273, _219, _149);
    float _295 = _249 * _265;
    float _297 = fma(_265, _279, _281);
    float _299 = fma(_257, _295, _279);
    float _301 = -_147;
    float _303 = _301 + _167;
    float _305 = -_283;
    float _307 = fma(_261, _295, _305);
    float _309 = -_287;
    float _311 = fma(_265, _283, _309);
    float _313 = _277 * _285;
    float _315 = _249 * _277;
    float _317 = fma(_303, _219, _147);
    float _319 = _285 * _265;
    float _321 = _261 * _313;
    float _323 = _257 * _313;
    float _325 = _317 * _315;
    float _327 = _317 * _307;
    float _329 = _317 * _299;
    float _331 = -_185;
    float _333 = _331 + _205;
    float _335 = -_187;
    float _337 = _335 + _207;
    float _339 = _253 * _277;
    float _341 = _293 * _297;
    float _343 = fma(_333, _219, _185);
    float _345 = fma(_337, _219, _187);
    float _347 = fma(_291, _219, _189);
    float _349 = _293 * _339;
    float _351 = _293 * _311;
    int _353 = _64 * 112;
    bool _355 = !_221;
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
    float _703;
    float _705;
    if (!_355)
    {
        float _357 = -_319;
        float _359 = _357 + (-0.0);
        int _361 = 0;
        float _363 = _321;
        float _365 = _327;
        float _367 = _341;
        float _369 = _343;
        float _371 = _323;
        float _373 = _329;
        float _375 = _351;
        float _377 = _345;
        float _379 = _359;
        float _381 = _325;
        float _383 = _349;
        float _385 = _347;
        bool _387;
        int _435;
        int _445;
        int _455;
        int _465;
        int _475;
        int _485;
        int _495;
        int _505;
        int _515;
        int _525;
        int _535;
        int _545;
        int _659;
        int _663;
        int _665;
        int _669;
        int _671;
        int _673;
        int _677;
        int _679;
        int _681;
        do
        {
            int _389 = _361;
            int _391 = as_type<int>(_363);
            int _393 = as_type<int>(_365);
            int _395 = as_type<int>(_367);
            int _397 = as_type<int>(_369);
            int _399 = as_type<int>(_371);
            int _401 = as_type<int>(_373);
            int _403 = as_type<int>(_375);
            int _405 = as_type<int>(_377);
            int _407 = as_type<int>(_379);
            int _409 = as_type<int>(_381);
            int _411 = as_type<int>(_383);
            int _413 = as_type<int>(_385);
            uint _415 = uint(int(uint(_353) >> uint(2)));
            uint _417 = uint(int(uint(int(_415)) >> uint(2)));
            int _419 = int(_415) & 3;
            float _421 = (*spvDescriptorSet0.cp_c6)._m0[int(_417)][_419];
            bool _423 = _64 != 0;
            int _425 = _389 + 1;
            bool _427 = uint(_425) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _429 = _391;
            int _431 = as_type<int>(_421);
            int _433 = 31;
            int _1621 = _54(_429, _431, _433, _435, gl_SubgroupInvocationID);
            int _437 = _1621;
            int _439 = _393;
            int _441 = as_type<int>(_421);
            int _443 = 31;
            int _1625 = _54(_439, _441, _443, _445, gl_SubgroupInvocationID);
            int _447 = _1625;
            int _449 = _395;
            int _451 = as_type<int>(_421);
            int _453 = 31;
            int _1629 = _54(_449, _451, _453, _455, gl_SubgroupInvocationID);
            int _457 = _1629;
            int _459 = _397;
            int _461 = as_type<int>(_421);
            int _463 = 31;
            int _1633 = _54(_459, _461, _463, _465, gl_SubgroupInvocationID);
            int _467 = _1633;
            int _469 = _399;
            int _471 = as_type<int>(_421);
            int _473 = 31;
            int _1637 = _54(_469, _471, _473, _475, gl_SubgroupInvocationID);
            int _477 = _1637;
            int _479 = _401;
            int _481 = as_type<int>(_421);
            int _483 = 31;
            int _1641 = _54(_479, _481, _483, _485, gl_SubgroupInvocationID);
            int _487 = _1641;
            int _489 = _403;
            int _491 = as_type<int>(_421);
            int _493 = 31;
            int _1645 = _54(_489, _491, _493, _495, gl_SubgroupInvocationID);
            int _497 = _1645;
            int _499 = _405;
            int _501 = as_type<int>(_421);
            int _503 = 31;
            int _1649 = _54(_499, _501, _503, _505, gl_SubgroupInvocationID);
            int _507 = _1649;
            int _509 = _407;
            int _511 = as_type<int>(_421);
            int _513 = 31;
            int _1653 = _54(_509, _511, _513, _515, gl_SubgroupInvocationID);
            int _517 = _1653;
            int _519 = _409;
            int _521 = as_type<int>(_421);
            int _523 = 31;
            int _1657 = _54(_519, _521, _523, _525, gl_SubgroupInvocationID);
            int _527 = _1657;
            int _529 = _411;
            int _531 = as_type<int>(_421);
            int _533 = 31;
            int _1661 = _54(_529, _531, _533, _535, gl_SubgroupInvocationID);
            int _537 = _1661;
            int _539 = _413;
            int _541 = as_type<int>(_421);
            int _543 = 31;
            int _1665 = _54(_539, _541, _543, _545, gl_SubgroupInvocationID);
            int _547 = _1665;
            bool _549 = !_423;
            _361 = _425;
            int _551 = _391;
            int _553 = _393;
            int _555 = _395;
            int _557 = _397;
            int _559 = _399;
            int _561 = _401;
            int _563 = _403;
            int _565 = _405;
            int _567 = _407;
            int _569 = _409;
            int _571 = _411;
            int _573 = _413;
            if (!_549)
            {
                float _575 = _323 * as_type<float>(_447);
                float _577 = _345 * as_type<float>(_447);
                float _579 = _329 * as_type<float>(_447);
                float _581 = _351 * as_type<float>(_447);
                float _583 = _345 * as_type<float>(_487);
                float _585 = fma(_321, as_type<float>(_437), _575);
                float _587 = fma(_343, as_type<float>(_437), _577);
                float _589 = fma(_327, as_type<float>(_437), _579);
                float _591 = fma(_341, as_type<float>(_437), _581);
                float _593 = _323 * as_type<float>(_487);
                float _595 = _329 * as_type<float>(_487);
                float _597 = fma(_343, as_type<float>(_477), _583);
                float _599 = _345 * as_type<float>(_527);
                float _601 = _351 * as_type<float>(_487);
                float _603 = fma(_321, as_type<float>(_477), _593);
                float _605 = fma(_327, as_type<float>(_477), _595);
                float _607 = _323 * as_type<float>(_527);
                float _609 = _329 * as_type<float>(_527);
                float _611 = _351 * as_type<float>(_527);
                float _613 = fma(_343, as_type<float>(_517), _599);
                float _615 = fma(_349, as_type<float>(_457), _591);
                float _617 = fma(_341, as_type<float>(_477), _601);
                float _619 = -_319;
                float _621 = fma(_619, as_type<float>(_497), _603);
                float _623 = fma(_321, as_type<float>(_517), _607);
                float _625 = fma(_327, as_type<float>(_517), _609);
                float _627 = fma(_341, as_type<float>(_517), _611);
                float _629 = fma(_325, as_type<float>(_497), _605);
                float _631 = fma(_347, as_type<float>(_457), _587);
                float _633 = fma(_347, as_type<float>(_497), _597);
                float _635 = fma(_347, as_type<float>(_537), _613);
                float _637 = -_319;
                float _639 = fma(_637, as_type<float>(_457), _585);
                float _641 = fma(_325, as_type<float>(_457), _589);
                float _643 = fma(_349, as_type<float>(_497), _617);
                float _645 = -_319;
                float _647 = fma(_645, as_type<float>(_537), _623);
                float _649 = fma(_325, as_type<float>(_537), _625);
                float _651 = fma(_349, as_type<float>(_537), _627);
                float _653 = as_type<float>(_467) + _631;
                float _655 = as_type<float>(_507) + _633;
                float _657 = as_type<float>(_547) + _635;
                _551 = as_type<int>(_639);
                _553 = as_type<int>(_641);
                _555 = as_type<int>(_615);
                _557 = as_type<int>(_653);
                _559 = as_type<int>(_621);
                _561 = as_type<int>(_629);
                _563 = as_type<int>(_643);
                _565 = as_type<int>(_655);
                _567 = as_type<int>(_647);
                _569 = as_type<int>(_649);
                _571 = as_type<int>(_651);
                _573 = as_type<int>(_657);
            }
            _659 = _551;
            int _661 = _553;
            _663 = _555;
            _665 = _557;
            int _667 = _559;
            _669 = _561;
            _671 = _563;
            _673 = _565;
            int _675 = _567;
            _677 = _569;
            _679 = _571;
            _681 = _573;
            _387 = !_427;
            _363 = as_type<float>(_659);
            _365 = as_type<float>(_661);
            _367 = as_type<float>(_663);
            _369 = as_type<float>(_665);
            _371 = as_type<float>(_667);
            _373 = as_type<float>(_669);
            _375 = as_type<float>(_671);
            _377 = as_type<float>(_673);
            _379 = as_type<float>(_675);
            _381 = as_type<float>(_677);
            _383 = as_type<float>(_679);
            _385 = as_type<float>(_681);
            _683 = as_type<float>(_661);
            _685 = as_type<float>(_667);
            _687 = as_type<float>(_675);
        } while (_387);
        _689 = as_type<float>(_669);
        _691 = as_type<float>(_677);
        _693 = as_type<float>(_659);
        _695 = as_type<float>(_663);
        _697 = as_type<float>(_671);
        _699 = as_type<float>(_679);
        _701 = as_type<float>(_673);
        _703 = as_type<float>(_681);
        _705 = as_type<float>(_665);
        _707 = true;
    }
    else
    {
        float _709 = -_319;
        float _711 = _709 + (-0.0);
        _683 = _327;
        _689 = _329;
        _691 = _325;
        _693 = _321;
        _685 = _323;
        _687 = _711;
        _695 = _341;
        _697 = _351;
        _699 = _349;
        _701 = _345;
        _703 = _347;
        _705 = _343;
    }
    _707 = false;
    float _713 = _683;
    float _715 = _689;
    float _717 = _691;
    float _719 = _693;
    float _721 = _685;
    float _723 = _687;
    float _725 = _695;
    float _727 = _697;
    float _729 = _699;
    float _731 = _701;
    float _733 = _703;
    float _735 = _705;
    int _737 = _353 + 80;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    uint _741 = uint(int(uint(int(_739)) >> uint(2)));
    int _743 = int(_739) & 3;
    float _745 = (*spvDescriptorSet0.cp_c6)._m0[int(_741)][_743];
    int _747 = int(_739) + 1;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    int _751 = _747 & 3;
    float _753 = (*spvDescriptorSet0.cp_c6)._m0[int(_749)][_751];
    int _755 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _757 = _755 + _64;
    int _759 = _353 + 64;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    uint _763 = uint(int(uint(int(_761)) >> uint(2)));
    int _765 = int(_761) & 3;
    float _767 = (*spvDescriptorSet0.cp_c6)._m0[int(_763)][_765];
    int _769 = int(_761) + 1;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    int _773 = _769 & 3;
    float _775 = (*spvDescriptorSet0.cp_c6)._m0[int(_771)][_773];
    int _777 = _757 * 48;
    int _779 = _353 + 88;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.cp_c6)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.cp_c6)._m0[int(_791)][_793];
    int _797 = _353 + 72;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    uint _801 = uint(int(uint(int(_799)) >> uint(2)));
    int _803 = int(_799) & 3;
    float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
    int _807 = int(_799) + 1;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    int _811 = _807 & 3;
    float _813 = (*spvDescriptorSet0.cp_c6)._m0[int(_809)][_811];
    int _815 = _353 + 96;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.cp_c6)._m0[int(_827)][_829];
    int _833 = _353 + 104;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    uint _837 = uint(int(uint(int(_835)) >> uint(2)));
    int _839 = int(_835) & 3;
    float _841 = (*spvDescriptorSet0.cp_c6)._m0[int(_837)][_839];
    int _843 = int(_835) + 1;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    int _847 = _843 & 3;
    float _849 = (*spvDescriptorSet0.cp_c6)._m0[int(_845)][_847];
    float _851 = _713 * _745;
    float _853 = _715 * _745;
    float _855 = _717 * _745;
    float _857 = _713 * _753;
    float _859 = _717 * _753;
    int _861 = _353 + 16;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.cp_c6)._m0[int(_873)][_875];
    float _879 = fma(_719, _767, _851);
    float _881 = fma(_721, _767, _853);
    float _883 = fma(_723, _767, _855);
    float _885 = _715 * _753;
    float _887 = fma(_719, _775, _857);
    int _889 = _353 + 32;
    uint _891 = uint(int(uint(_889) >> uint(2)));
    uint _893 = uint(int(uint(int(_891)) >> uint(2)));
    int _895 = int(_891) & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    int _899 = int(_891) + 1;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    int _903 = _899 & 3;
    float _905 = (*spvDescriptorSet0.cp_c6)._m0[int(_901)][_903];
    float _907 = fma(_723, _775, _859);
    float _909 = fma(_721, _775, _885);
    float _911 = _713 * _787;
    float _913 = _715 * _787;
    float _915 = _713 * _795;
    float _917 = _715 * _795;
    float _919 = _717 * _787;
    int _921 = _353 + 48;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    uint _925 = uint(int(uint(int(_923)) >> uint(2)));
    int _927 = int(_923) & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    int _931 = int(_923) + 1;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    int _935 = _931 & 3;
    float _937 = (*spvDescriptorSet0.cp_c6)._m0[int(_933)][_935];
    float _939 = _717 * _795;
    float _941 = fma(_719, _805, _911);
    float _943 = fma(_721, _805, _913);
    float _945 = fma(_719, _813, _915);
    float _947 = fma(_721, _813, _917);
    float _949 = fma(_723, _805, _919);
    int _951 = _353 + 24;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
    float _969 = fma(_723, _813, _939);
    float _971 = fma(_725, _823, _879);
    float _973 = fma(_725, _831, _887);
    float _975 = fma(_727, _823, _881);
    float _977 = fma(_727, _831, _909);
    float _979 = fma(_729, _823, _883);
    int _981 = _353 + 40;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    uint _985 = uint(int(uint(int(_983)) >> uint(2)));
    int _987 = int(_983) & 3;
    float _989 = (*spvDescriptorSet0.cp_c6)._m0[int(_985)][_987];
    int _991 = int(_983) + 1;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    int _995 = _991 & 3;
    float _997 = (*spvDescriptorSet0.cp_c6)._m0[int(_993)][_995];
    float _999 = fma(_729, _831, _907);
    float _1001 = fma(_725, _841, _941);
    float _1003 = fma(_727, _849, _947);
    float _1005 = fma(_725, _849, _945);
    float _1007 = fma(_729, _849, _969);
    float _1009 = fma(_727, _841, _943);
    int _1011 = _353 + 56;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    uint _1015 = uint(int(uint(int(_1013)) >> uint(2)));
    int _1017 = int(_1013) & 3;
    float _1019 = (*spvDescriptorSet0.cp_c6)._m0[int(_1015)][_1017];
    int _1021 = int(_1013) + 1;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    int _1025 = _1021 & 3;
    float _1027 = (*spvDescriptorSet0.cp_c6)._m0[int(_1023)][_1025];
    float _1029 = _1003 + _731;
    float _1031 = fma(_729, _841, _949);
    float _1033 = _1007 + _733;
    float _1035 = _1005 + _735;
    float _1037 = _975 * _877;
    float _1039 = _977 * _877;
    float _1041 = _1009 * _877;
    float _1043 = _1029 * _877;
    float _1045 = fma(_971, _869, _1037);
    float _1047 = fma(_973, _869, _1039);
    float _1049 = fma(_1001, _869, _1041);
    float _1051 = fma(_1035, _869, _1043);
    float _1053 = _1029 * _905;
    float _1055 = _975 * _905;
    float _1057 = _977 * _905;
    float _1059 = _1009 * _905;
    float _1061 = fma(_1035, _897, _1053);
    float _1063 = fma(_971, _897, _1055);
    float _1065 = fma(_973, _897, _1057);
    float _1067 = fma(_1001, _897, _1059);
    float _1069 = _1029 * _937;
    float _1071 = _975 * _937;
    float _1073 = _977 * _937;
    float _1075 = _1009 * _937;
    float _1077 = fma(_1035, _929, _1069);
    float _1079 = fma(_971, _929, _1071);
    float _1081 = fma(_973, _929, _1073);
    float _1083 = fma(_1001, _929, _1075);
    float _1085 = fma(_1033, _959, _1051);
    float _1087 = fma(_979, _959, _1045);
    float _1089 = fma(_999, _959, _1047);
    float _1091 = fma(_1031, _959, _1049);
    float _1093 = _1085 + _967;
    float _1095 = fma(_1033, _989, _1061);
    float _1097 = fma(_979, _989, _1063);
    float _1099 = fma(_999, _989, _1065);
    int _1101 = _777 + 16;
    float _1103 = fma(_1031, _989, _1067);
    float _1105 = _1095 + _997;
    int _1107 = _777 + 32;
    float _1109 = fma(_1033, _1019, _1077);
    float _1111 = fma(_979, _1019, _1079);
    float _1113 = fma(_999, _1019, _1081);
    float _1115 = fma(_1031, _1019, _1083);
    float _1117 = _1109 + _1027;
    int _1119 = _777 + 48;
    uint _1121 = uint(int(uint(_1101) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1121)] = as_type<uint>(_1087);
    int _1123 = _1101 + 4;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1125)] = as_type<uint>(_1089);
    int _1127 = _1101 + 8;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1129)] = as_type<uint>(_1091);
    int _1131 = _1101 + 12;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1133)] = as_type<uint>(_1093);
    uint _1135 = uint(int(uint(_1107) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1135)] = as_type<uint>(_1097);
    int _1137 = _1107 + 4;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1139)] = as_type<uint>(_1099);
    int _1141 = _1107 + 8;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1143)] = as_type<uint>(_1103);
    int _1145 = _1107 + 12;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1147)] = as_type<uint>(_1105);
    uint _1149 = uint(int(uint(_1119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1149)] = as_type<uint>(_1111);
    int _1151 = _1119 + 4;
    uint _1153 = uint(int(uint(_1151) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1153)] = as_type<uint>(_1113);
    int _1155 = _1119 + 8;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1157)] = as_type<uint>(_1115);
    int _1159 = _1119 + 12;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1161)] = as_type<uint>(_1117);
}

