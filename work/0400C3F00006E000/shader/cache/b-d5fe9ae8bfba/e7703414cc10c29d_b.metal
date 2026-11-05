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
int _54(thread const int& _2941, thread const int& _2942, constant _10& support_buffer)
{
    int _2945 = 1 + _2942;
    float _2947 = support_buffer._m5[_2945].x;
    bool _2949 = _2947 == 1.0;
    if (_2949)
    {
        return _2941;
    }
    float _2951 = float(_2941);
    float _2953 = _2951 * _2947;
    int _2955 = int(_2953);
    return _2955;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2977, thread const int& _2978, thread const int& _2979, thread int& _2980, thread uint& gl_SubgroupInvocationID)
{
    int _2983 = _2979 & 31;
    uint _2985 = uint(int(uint(_2979) >> uint(8)));
    int _2987 = int(_2985) & 31;
    float _2989 = as_type<float>(gl_SubgroupInvocationID);
    int _2991 = as_type<int>(_2989) & _2987;
    int _2993 = ~_2987;
    int _2995 = _2983 & _2993;
    int _2997 = _2995 | _2991;
    int _2999 = ~_2987;
    int _3001 = _2978 & _2999;
    int _3003 = _3001 | _2991;
    bool _3005 = uint(_3003) <= uint(_2997);
    _2980 = _3005 ? (-1) : 0;
    float _3007 = spvSubgroupShuffle(as_type<float>(_2977), uint(_3003));
    uint _3009 = uint(_3005 ? as_type<int>(_3007) : _2977);
    return int(_3009);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _709 = false;
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
    int _83 = int(_75) + 1;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    int _87 = _83 & 3;
    float _89 = (*spvDescriptorSet0.cp_c5)._m0[int(_85)][_87];
    int _91 = _66;
    int _93 = 0;
    int _95 = _54(_91, _93, (*spvDescriptorSet0.support_buffer));
    int _97 = as_type<int>(_81);
    int _99 = 0;
    int _101 = _54(_97, _99, (*spvDescriptorSet0.support_buffer));
    int3 _1285 = int3(_95, _101, 1);
    float3 _105 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1285.xy), uint(_1285.z), 0).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    int _113 = _66;
    int _115 = 0;
    int _117 = _54(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_89);
    int _121 = 0;
    int _123 = _54(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1303 = int3(_117, _123, 1);
    float3 _125 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1303.xy), uint(_1303.z), 0).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    int _133 = _66;
    int _135 = 0;
    int _137 = _54(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = as_type<int>(_81);
    int _141 = 0;
    int _143 = _54(_139, _141, (*spvDescriptorSet0.support_buffer));
    int3 _1321 = int3(_137, _143, 0);
    float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1321.xy), uint(_1321.z), 0).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    int _153 = _66;
    int _155 = 0;
    int _157 = _54(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = as_type<int>(_89);
    int _161 = 0;
    int _163 = _54(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _1339 = int3(_157, _163, 0);
    float3 _165 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1339.xy), uint(_1339.z), 0).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    int _173 = _66;
    int _175 = 0;
    int _177 = _54(_173, _175, (*spvDescriptorSet0.support_buffer));
    int _179 = as_type<int>(_81);
    int _181 = 0;
    int _183 = _54(_179, _181, (*spvDescriptorSet0.support_buffer));
    int3 _1357 = int3(_177, _183, 2);
    float3 _185 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1357.xy), uint(_1357.z), 0).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    int _193 = _66;
    int _195 = 0;
    int _197 = _54(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = as_type<int>(_89);
    int _201 = 0;
    int _203 = _54(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _1375 = int3(_197, _203, 2);
    float3 _205 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1375.xy), uint(_1375.z), 0).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    int _213 = _72 + 16;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    uint _217 = uint(int(uint(int(_215)) >> uint(2)));
    int _219 = int(_215) & 3;
    float _221 = (*spvDescriptorSet0.cp_c5)._m0[int(_217)][_219];
    bool _223 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _225 = -_107;
    float _227 = _225 + _127;
    float _229 = -_111;
    float _231 = _229 + _131;
    float _233 = -_109;
    float _235 = _233 + _129;
    float _237 = fma(_227, _221, _107);
    float _239 = fma(_231, _221, _111);
    float _241 = fma(_235, _221, _109);
    float _243 = _237 * 0.15915493667125701904296875;
    float _245 = _239 * 0.15915493667125701904296875;
    float _247 = _241 * 0.15915493667125701904296875;
    float _249 = _243 * 6.283185482025146484375;
    float _251 = sin(_249);
    float _253 = _243 * 6.283185482025146484375;
    float _255 = cos(_253);
    float _257 = _245 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = _245 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = _247 * 6.283185482025146484375;
    float _267 = sin(_265);
    float _269 = _247 * 6.283185482025146484375;
    float _271 = cos(_269);
    float _273 = -_147;
    float _275 = _273 + _167;
    float _277 = _255 * _263;
    float _279 = _251 * _259;
    float _281 = _259 * _255;
    float _283 = fma(_275, _221, _147);
    float _285 = _251 * _263;
    float _287 = -_151;
    float _289 = _287 + _171;
    float _291 = _251 * _267;
    float _293 = fma(_267, _277, _279);
    float _295 = -_191;
    float _297 = _295 + _211;
    float _299 = fma(_289, _221, _151);
    float _301 = fma(_259, _291, _277);
    float _303 = -_149;
    float _305 = _303 + _169;
    float _307 = -_281;
    float _309 = fma(_263, _291, _307);
    float _311 = -_285;
    float _313 = fma(_267, _281, _311);
    float _315 = _271 * _283;
    float _317 = _251 * _271;
    float _319 = fma(_305, _221, _149);
    float _321 = _283 * _267;
    float _323 = _263 * _315;
    float _325 = _259 * _315;
    float _327 = _319 * _317;
    float _329 = _319 * _309;
    float _331 = _319 * _301;
    float _333 = -_187;
    float _335 = _333 + _207;
    float _337 = -_189;
    float _339 = _337 + _209;
    float _341 = _255 * _271;
    float _343 = fma(_297, _221, _191);
    float _345 = fma(_335, _221, _187);
    float _347 = fma(_339, _221, _189);
    float _349 = _299 * _341;
    float _351 = _299 * _293;
    float _353 = _299 * _313;
    int _355 = _66 * 112;
    bool _357 = !_223;
    float _359 = _351;
    float _361 = _345;
    float _363 = _325;
    float _365 = _331;
    float _367 = _353;
    float _369 = _347;
    float _371 = _327;
    float _373 = _349;
    float _375 = _343;
    float _703;
    float _705;
    float _707;
    if (!_357)
    {
        float _377 = -_321;
        float _379 = _377 + (-0.0);
        int _381 = 0;
        float _383 = _323;
        float _385 = _329;
        float _387 = _351;
        float _389 = _345;
        float _391 = _325;
        float _393 = _331;
        float _395 = _353;
        float _397 = _347;
        float _399 = _379;
        float _401 = _327;
        float _403 = _349;
        float _405 = _343;
        bool _407;
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
        int _555;
        int _565;
        float _679;
        float _681;
        float _683;
        int _685;
        float _687;
        int _689;
        int _691;
        int _693;
        int _695;
        float _697;
        float _699;
        float _701;
        do
        {
            int _409 = _381;
            float _411 = _383;
            float _413 = _385;
            float _415 = _387;
            int _417 = as_type<int>(_389);
            float _419 = _391;
            int _421 = as_type<int>(_393);
            int _423 = as_type<int>(_395);
            int _425 = as_type<int>(_397);
            int _427 = as_type<int>(_399);
            float _429 = _401;
            float _431 = _403;
            float _433 = _405;
            uint _435 = uint(int(uint(_355) >> uint(2)));
            uint _437 = uint(int(uint(int(_435)) >> uint(2)));
            int _439 = int(_435) & 3;
            float _441 = (*spvDescriptorSet0.cp_c6)._m0[int(_437)][_439];
            bool _443 = _66 != 0;
            int _445 = _409 + 1;
            bool _447 = uint(_445) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _449 = as_type<int>(_411);
            int _451 = as_type<int>(_441);
            int _453 = 31;
            int _1676 = _56(_449, _451, _453, _455, gl_SubgroupInvocationID);
            int _457 = _1676;
            int _459 = as_type<int>(_413);
            int _461 = as_type<int>(_441);
            int _463 = 31;
            int _1681 = _56(_459, _461, _463, _465, gl_SubgroupInvocationID);
            int _467 = _1681;
            int _469 = as_type<int>(_415);
            int _471 = as_type<int>(_441);
            int _473 = 31;
            int _1686 = _56(_469, _471, _473, _475, gl_SubgroupInvocationID);
            int _477 = _1686;
            int _479 = _417;
            int _481 = as_type<int>(_441);
            int _483 = 31;
            int _1690 = _56(_479, _481, _483, _485, gl_SubgroupInvocationID);
            int _487 = _1690;
            int _489 = as_type<int>(_419);
            int _491 = as_type<int>(_441);
            int _493 = 31;
            int _1695 = _56(_489, _491, _493, _495, gl_SubgroupInvocationID);
            int _497 = _1695;
            int _499 = _421;
            int _501 = as_type<int>(_441);
            int _503 = 31;
            int _1699 = _56(_499, _501, _503, _505, gl_SubgroupInvocationID);
            int _507 = _1699;
            int _509 = _423;
            int _511 = as_type<int>(_441);
            int _513 = 31;
            int _1703 = _56(_509, _511, _513, _515, gl_SubgroupInvocationID);
            int _517 = _1703;
            int _519 = _425;
            int _521 = as_type<int>(_441);
            int _523 = 31;
            int _1707 = _56(_519, _521, _523, _525, gl_SubgroupInvocationID);
            int _527 = _1707;
            int _529 = _427;
            int _531 = as_type<int>(_441);
            int _533 = 31;
            int _1711 = _56(_529, _531, _533, _535, gl_SubgroupInvocationID);
            int _537 = _1711;
            int _539 = as_type<int>(_429);
            int _541 = as_type<int>(_441);
            int _543 = 31;
            int _1716 = _56(_539, _541, _543, _545, gl_SubgroupInvocationID);
            int _547 = _1716;
            int _549 = as_type<int>(_431);
            int _551 = as_type<int>(_441);
            int _553 = 31;
            int _1721 = _56(_549, _551, _553, _555, gl_SubgroupInvocationID);
            int _557 = _1721;
            int _559 = as_type<int>(_433);
            int _561 = as_type<int>(_441);
            int _563 = 31;
            int _1726 = _56(_559, _561, _563, _565, gl_SubgroupInvocationID);
            int _567 = _1726;
            bool _569 = !_443;
            _381 = _445;
            float _571 = _411;
            float _573 = _413;
            float _575 = _415;
            int _577 = _417;
            float _579 = _419;
            int _581 = _421;
            int _583 = _423;
            int _585 = _425;
            int _587 = _427;
            float _589 = _429;
            float _591 = _431;
            float _593 = _433;
            if (!_569)
            {
                float _595 = _347 * as_type<float>(_507);
                float _597 = _325 * as_type<float>(_507);
                float _599 = _331 * as_type<float>(_507);
                float _601 = _353 * as_type<float>(_507);
                float _603 = _325 * as_type<float>(_467);
                float _605 = _331 * as_type<float>(_467);
                float _607 = _353 * as_type<float>(_467);
                float _609 = fma(_345, as_type<float>(_497), _595);
                float _611 = _347 * as_type<float>(_467);
                float _613 = _347 * as_type<float>(_547);
                float _615 = fma(_323, as_type<float>(_497), _597);
                float _617 = fma(_329, as_type<float>(_497), _599);
                float _619 = fma(_351, as_type<float>(_497), _601);
                float _621 = _325 * as_type<float>(_547);
                float _623 = _331 * as_type<float>(_547);
                float _625 = _353 * as_type<float>(_547);
                float _627 = fma(_323, as_type<float>(_457), _603);
                float _629 = fma(_329, as_type<float>(_457), _605);
                float _631 = fma(_351, as_type<float>(_457), _607);
                float _633 = fma(_345, as_type<float>(_457), _611);
                float _635 = fma(_345, as_type<float>(_537), _613);
                float _637 = fma(_323, as_type<float>(_537), _621);
                float _639 = fma(_329, as_type<float>(_537), _623);
                float _641 = fma(_351, as_type<float>(_537), _625);
                float _643 = -_321;
                float _645 = fma(_643, as_type<float>(_477), _627);
                float _647 = fma(_327, as_type<float>(_477), _629);
                float _649 = fma(_349, as_type<float>(_477), _631);
                float _651 = -_321;
                float _653 = fma(_651, as_type<float>(_517), _615);
                float _655 = fma(_343, as_type<float>(_477), _633);
                float _657 = fma(_343, as_type<float>(_517), _609);
                float _659 = fma(_343, as_type<float>(_557), _635);
                float _661 = fma(_327, as_type<float>(_517), _617);
                float _663 = fma(_349, as_type<float>(_517), _619);
                float _665 = -_321;
                float _667 = fma(_665, as_type<float>(_557), _637);
                float _669 = fma(_327, as_type<float>(_557), _639);
                float _671 = fma(_349, as_type<float>(_557), _641);
                float _673 = as_type<float>(_487) + _655;
                float _675 = as_type<float>(_527) + _657;
                float _677 = as_type<float>(_567) + _659;
                _571 = _645;
                _573 = _647;
                _575 = _649;
                _577 = as_type<int>(_673);
                _579 = _653;
                _581 = as_type<int>(_661);
                _583 = as_type<int>(_663);
                _585 = as_type<int>(_675);
                _587 = as_type<int>(_667);
                _589 = _669;
                _591 = _671;
                _593 = _677;
            }
            _679 = _571;
            _681 = _573;
            _683 = _575;
            _685 = _577;
            _687 = _579;
            _689 = _581;
            _691 = _583;
            _693 = _585;
            _695 = _587;
            _697 = _589;
            _699 = _591;
            _701 = _593;
            _407 = !_447;
            _383 = _679;
            _385 = _681;
            _387 = _683;
            _389 = as_type<float>(_685);
            _391 = _687;
            _393 = as_type<float>(_689);
            _395 = as_type<float>(_691);
            _397 = as_type<float>(_693);
            _399 = as_type<float>(_695);
            _401 = _697;
            _403 = _699;
            _405 = _701;
        } while (_407);
        _703 = _679;
        _705 = _681;
        _359 = _683;
        _361 = as_type<float>(_685);
        _363 = _687;
        _365 = as_type<float>(_689);
        _367 = as_type<float>(_691);
        _369 = as_type<float>(_693);
        _707 = as_type<float>(_695);
        _371 = _697;
        _373 = _699;
        _375 = _701;
        _709 = true;
    }
    else
    {
        float _711 = -_321;
        float _713 = _711 + (-0.0);
        _703 = _323;
        _705 = _329;
        _707 = _713;
    }
    _709 = false;
    float _715 = _703;
    float _717 = _705;
    float _719 = _359;
    float _721 = _361;
    float _723 = _363;
    float _725 = _365;
    float _727 = _367;
    float _729 = _369;
    float _731 = _707;
    float _733 = _371;
    float _735 = _373;
    float _737 = _375;
    int _739 = _355 + 80;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    uint _743 = uint(int(uint(int(_741)) >> uint(2)));
    int _745 = int(_741) & 3;
    float _747 = (*spvDescriptorSet0.cp_c6)._m0[int(_743)][_745];
    int _749 = int(_741) + 1;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    int _753 = _749 & 3;
    float _755 = (*spvDescriptorSet0.cp_c6)._m0[int(_751)][_753];
    bool _757 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _759 = _355 + 64;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    uint _763 = uint(int(uint(int(_761)) >> uint(2)));
    int _765 = int(_761) & 3;
    float _767 = (*spvDescriptorSet0.cp_c6)._m0[int(_763)][_765];
    int _769 = int(_761) + 1;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    int _773 = _769 & 3;
    float _775 = (*spvDescriptorSet0.cp_c6)._m0[int(_771)][_773];
    int _777 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _779 = _777 + _66;
    int _781 = _355 + 88;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    uint _785 = uint(int(uint(int(_783)) >> uint(2)));
    int _787 = int(_783) & 3;
    float _789 = (*spvDescriptorSet0.cp_c6)._m0[int(_785)][_787];
    int _791 = int(_783) + 1;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    int _795 = _791 & 3;
    float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
    int _799 = _355 + 72;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    uint _803 = uint(int(uint(int(_801)) >> uint(2)));
    int _805 = int(_801) & 3;
    float _807 = (*spvDescriptorSet0.cp_c6)._m0[int(_803)][_805];
    int _809 = int(_801) + 1;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    int _813 = _809 & 3;
    float _815 = (*spvDescriptorSet0.cp_c6)._m0[int(_811)][_813];
    int _817 = _355 + 96;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.cp_c6)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.cp_c6)._m0[int(_829)][_831];
    int _835 = _355 + 104;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    uint _839 = uint(int(uint(int(_837)) >> uint(2)));
    int _841 = int(_837) & 3;
    float _843 = (*spvDescriptorSet0.cp_c6)._m0[int(_839)][_841];
    int _845 = int(_837) + 1;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    int _849 = _845 & 3;
    float _851 = (*spvDescriptorSet0.cp_c6)._m0[int(_847)][_849];
    int _853 = _355 + 16;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    uint _857 = uint(int(uint(int(_855)) >> uint(2)));
    int _859 = int(_855) & 3;
    float _861 = (*spvDescriptorSet0.cp_c6)._m0[int(_857)][_859];
    int _863 = int(_855) + 1;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    int _867 = _863 & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    if (!_757)
    {
        int _871 = _66 * 48;
        int _873 = _871 + 16;
        uint _875 = uint(int(uint(_871) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_875)] = as_type<uint>(_715);
        int _877 = _871 + 4;
        uint _879 = uint(int(uint(_877) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_879)] = as_type<uint>(_717);
        int _881 = _871 + 8;
        uint _883 = uint(int(uint(_881) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_883)] = as_type<uint>(_719);
        int _885 = _871 + 12;
        uint _887 = uint(int(uint(_885) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_887)] = as_type<uint>(_721);
        int _889 = _871 + 32;
        uint _891 = uint(int(uint(_873) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_891)] = as_type<uint>(_723);
        int _893 = _873 + 4;
        uint _895 = uint(int(uint(_893) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_895)] = as_type<uint>(_725);
        int _897 = _873 + 8;
        uint _899 = uint(int(uint(_897) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_899)] = as_type<uint>(_727);
        int _901 = _873 + 12;
        uint _903 = uint(int(uint(_901) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_903)] = as_type<uint>(_729);
        uint _905 = uint(int(uint(_889) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_905)] = as_type<uint>(_731);
        int _907 = _889 + 4;
        uint _909 = uint(int(uint(_907) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_909)] = as_type<uint>(_733);
        int _911 = _889 + 8;
        uint _913 = uint(int(uint(_911) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_913)] = as_type<uint>(_735);
        int _915 = _889 + 12;
        uint _917 = uint(int(uint(_915) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_917)] = as_type<uint>(_737);
    }
    float _919 = _733 * _747;
    float _921 = _717 * _747;
    float _923 = _725 * _747;
    int _925 = _355 + 32;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    uint _929 = uint(int(uint(int(_927)) >> uint(2)));
    int _931 = int(_927) & 3;
    float _933 = (*spvDescriptorSet0.cp_c6)._m0[int(_929)][_931];
    int _935 = int(_927) + 1;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    int _939 = _935 & 3;
    float _941 = (*spvDescriptorSet0.cp_c6)._m0[int(_937)][_939];
    float _943 = fma(_731, _767, _919);
    float _945 = _717 * _755;
    float _947 = fma(_715, _767, _921);
    float _949 = fma(_723, _767, _923);
    float _951 = _725 * _755;
    float _953 = fma(_715, _775, _945);
    float _955 = _717 * _789;
    int _957 = _355 + 48;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    uint _961 = uint(int(uint(int(_959)) >> uint(2)));
    int _963 = int(_959) & 3;
    float _965 = (*spvDescriptorSet0.cp_c6)._m0[int(_961)][_963];
    int _967 = int(_959) + 1;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    int _971 = _967 & 3;
    float _973 = (*spvDescriptorSet0.cp_c6)._m0[int(_969)][_971];
    float _975 = _717 * _797;
    float _977 = _733 * _755;
    float _979 = _725 * _789;
    float _981 = _725 * _797;
    float _983 = _733 * _789;
    float _985 = fma(_723, _775, _951);
    float _987 = fma(_731, _775, _977);
    float _989 = _733 * _797;
    float _991 = fma(_715, _807, _955);
    int _993 = _355 + 24;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.cp_c6)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.cp_c6)._m0[int(_1005)][_1007];
    float _1011 = fma(_715, _815, _975);
    float _1013 = fma(_723, _807, _979);
    float _1015 = fma(_723, _815, _981);
    float _1017 = fma(_731, _815, _989);
    float _1019 = fma(_731, _807, _983);
    float _1021 = fma(_719, _825, _947);
    float _1023 = fma(_727, _851, _1015);
    int _1025 = _355 + 40;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    uint _1029 = uint(int(uint(int(_1027)) >> uint(2)));
    int _1031 = int(_1027) & 3;
    float _1033 = (*spvDescriptorSet0.cp_c6)._m0[int(_1029)][_1031];
    int _1035 = int(_1027) + 1;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    int _1039 = _1035 & 3;
    float _1041 = (*spvDescriptorSet0.cp_c6)._m0[int(_1037)][_1039];
    float _1043 = fma(_727, _825, _949);
    float _1045 = fma(_735, _825, _943);
    float _1047 = fma(_719, _833, _953);
    float _1049 = fma(_719, _843, _991);
    float _1051 = fma(_719, _851, _1011);
    float _1053 = fma(_727, _833, _985);
    float _1055 = fma(_727, _843, _1013);
    int _1057 = _355 + 56;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.cp_c6)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.cp_c6)._m0[int(_1069)][_1071];
    float _1075 = fma(_735, _851, _1017);
    float _1077 = _1023 + _729;
    float _1079 = fma(_735, _833, _987);
    float _1081 = fma(_735, _843, _1019);
    float _1083 = _1075 + _737;
    float _1085 = _1051 + _721;
    float _1087 = _1043 * _869;
    float _1089 = _1053 * _869;
    float _1091 = _1055 * _869;
    float _1093 = _1077 * _869;
    float _1095 = fma(_1021, _861, _1087);
    float _1097 = fma(_1047, _861, _1089);
    float _1099 = fma(_1049, _861, _1091);
    float _1101 = fma(_1085, _861, _1093);
    float _1103 = _1043 * _941;
    float _1105 = _1053 * _941;
    float _1107 = _1055 * _941;
    float _1109 = _1077 * _941;
    float _1111 = fma(_1021, _933, _1103);
    float _1113 = fma(_1047, _933, _1105);
    float _1115 = fma(_1049, _933, _1107);
    float _1117 = _1077 * _973;
    float _1119 = _1043 * _973;
    float _1121 = fma(_1085, _933, _1109);
    float _1123 = _1053 * _973;
    float _1125 = _1055 * _973;
    float _1127 = fma(_1085, _965, _1117);
    int _1129 = _779 * 48;
    float _1131 = fma(_1021, _965, _1119);
    float _1133 = fma(_1047, _965, _1123);
    float _1135 = fma(_1049, _965, _1125);
    float _1137 = fma(_1083, _1001, _1101);
    float _1139 = fma(_1079, _1001, _1097);
    float _1141 = fma(_1045, _1001, _1095);
    float _1143 = fma(_1081, _1001, _1099);
    float _1145 = _1137 + _1009;
    float _1147 = fma(_1083, _1033, _1121);
    float _1149 = fma(_1045, _1033, _1111);
    float _1151 = fma(_1079, _1033, _1113);
    float _1153 = fma(_1081, _1033, _1115);
    int _1155 = _1129 + 16;
    float _1157 = _1147 + _1041;
    float _1159 = fma(_1083, _1065, _1127);
    float _1161 = fma(_1045, _1065, _1131);
    int _1163 = _1129 + 32;
    float _1165 = fma(_1079, _1065, _1133);
    float _1167 = fma(_1081, _1065, _1135);
    float _1169 = _1159 + _1073;
    int _1171 = _1129 + 48;
    uint _1173 = uint(int(uint(_1155) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1173)] = as_type<uint>(_1141);
    int _1175 = _1155 + 4;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1177)] = as_type<uint>(_1139);
    int _1179 = _1155 + 8;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = as_type<uint>(_1143);
    int _1183 = _1155 + 12;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1185)] = as_type<uint>(_1145);
    uint _1187 = uint(int(uint(_1163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1187)] = as_type<uint>(_1149);
    int _1189 = _1163 + 4;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1191)] = as_type<uint>(_1151);
    int _1193 = _1163 + 8;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1195)] = as_type<uint>(_1153);
    int _1197 = _1163 + 12;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1199)] = as_type<uint>(_1157);
    uint _1201 = uint(int(uint(_1171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1201)] = as_type<uint>(_1161);
    int _1203 = _1171 + 4;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1205)] = as_type<uint>(_1165);
    int _1207 = _1171 + 8;
    uint _1209 = uint(int(uint(_1207) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1209)] = as_type<uint>(_1167);
    int _1211 = _1171 + 12;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1213)] = as_type<uint>(_1169);
}

