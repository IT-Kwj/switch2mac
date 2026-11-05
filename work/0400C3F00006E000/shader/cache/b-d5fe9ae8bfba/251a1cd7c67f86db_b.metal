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
int _54(thread const int& _2964, thread const int& _2965, constant _10& support_buffer)
{
    int _2968 = 1 + _2965;
    float _2970 = support_buffer._m5[_2968].x;
    bool _2972 = _2970 == 1.0;
    if (_2972)
    {
        return _2964;
    }
    float _2974 = float(_2964);
    float _2976 = _2974 * _2970;
    int _2978 = int(_2976);
    return _2978;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3000, thread const int& _3001, thread const int& _3002, thread int& _3003, thread uint& gl_SubgroupInvocationID)
{
    int _3006 = _3002 & 31;
    uint _3008 = uint(int(uint(_3002) >> uint(8)));
    int _3010 = int(_3008) & 31;
    float _3012 = as_type<float>(gl_SubgroupInvocationID);
    int _3014 = as_type<int>(_3012) & _3010;
    int _3016 = ~_3010;
    int _3018 = _3006 & _3016;
    int _3020 = _3018 | _3014;
    int _3022 = ~_3010;
    int _3024 = _3001 & _3022;
    int _3026 = _3024 | _3014;
    bool _3028 = uint(_3026) <= uint(_3020);
    _3003 = _3028 ? (-1) : 0;
    float _3030 = spvSubgroupShuffle(as_type<float>(_3000), uint(_3026));
    uint _3032 = uint(_3028 ? as_type<int>(_3030) : _3000);
    return int(_3032);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _763 = false;
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
    int3 _1289 = int3(_95, _101, 1);
    float3 _105 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1289.xy), uint(_1289.z), 0).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    int _113 = _66;
    int _115 = 0;
    int _117 = _54(_113, _115, (*spvDescriptorSet0.support_buffer));
    int _119 = as_type<int>(_89);
    int _121 = 0;
    int _123 = _54(_119, _121, (*spvDescriptorSet0.support_buffer));
    int3 _1307 = int3(_117, _123, 1);
    float3 _125 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1307.xy), uint(_1307.z), 0).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    int _133 = _66;
    int _135 = 0;
    int _137 = _54(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = as_type<int>(_81);
    int _141 = 0;
    int _143 = _54(_139, _141, (*spvDescriptorSet0.support_buffer));
    int3 _1325 = int3(_137, _143, 0);
    float3 _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1325.xy), uint(_1325.z), 0).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    int _153 = _66;
    int _155 = 0;
    int _157 = _54(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = as_type<int>(_89);
    int _161 = 0;
    int _163 = _54(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _1343 = int3(_157, _163, 0);
    float3 _165 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1343.xy), uint(_1343.z), 0).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    int _173 = _66;
    int _175 = 0;
    int _177 = _54(_173, _175, (*spvDescriptorSet0.support_buffer));
    int _179 = as_type<int>(_81);
    int _181 = 0;
    int _183 = _54(_179, _181, (*spvDescriptorSet0.support_buffer));
    int3 _1361 = int3(_177, _183, 2);
    float3 _185 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1361.xy), uint(_1361.z), 0).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    int _193 = _66;
    int _195 = 0;
    int _197 = _54(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = as_type<int>(_89);
    int _201 = 0;
    int _203 = _54(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _1379 = int3(_197, _203, 2);
    float3 _205 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1379.xy), uint(_1379.z), 0).xyz;
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
    float _233 = fma(_227, _221, _107);
    float _235 = -_109;
    float _237 = _235 + _129;
    float _239 = fma(_231, _221, _111);
    float _241 = _233 * 0.15915493667125701904296875;
    float _243 = fma(_237, _221, _109);
    float _245 = _239 * 0.15915493667125701904296875;
    float _247 = _241 * 6.283185482025146484375;
    float _249 = sin(_247);
    float _251 = _243 * 0.15915493667125701904296875;
    float _253 = -_147;
    float _255 = _253 + _167;
    float _257 = -_151;
    float _259 = _257 + _171;
    bool _261 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _263 = fma(_255, _221, _147);
    float _265 = _241 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = -_149;
    float _271 = _269 + _169;
    float _273 = fma(_259, _221, _151);
    float _275 = fma(_271, _221, _149);
    float _277 = _245 * 6.283185482025146484375;
    float _279 = sin(_277);
    float _281 = _245 * 6.283185482025146484375;
    float _283 = cos(_281);
    float _285 = _251 * 6.283185482025146484375;
    float _287 = sin(_285);
    float _289 = _249 * _279;
    float _291 = _279 * _267;
    float _293 = _251 * 6.283185482025146484375;
    float _295 = cos(_293);
    float _297 = _267 * _283;
    float _299 = _249 * _283;
    float _301 = _249 * _287;
    float _303 = fma(_287, _297, _289);
    float _305 = fma(_279, _301, _297);
    float _307 = -_291;
    float _309 = fma(_283, _301, _307);
    float _311 = -_299;
    float _313 = fma(_287, _291, _311);
    float _315 = _263 * _287;
    float _317 = _295 * _263;
    float _319 = _249 * _295;
    float _321 = _267 * _295;
    float _323 = -_187;
    float _325 = _323 + _207;
    float _327 = _283 * _317;
    float _329 = _279 * _317;
    float _331 = _275 * _319;
    float _333 = _275 * _309;
    float _335 = _275 * _305;
    float _337 = -_189;
    float _339 = _337 + _209;
    float _341 = -_191;
    float _343 = _341 + _211;
    float _345 = fma(_325, _221, _187);
    float _347 = _273 * _321;
    float _349 = fma(_339, _221, _189);
    float _351 = fma(_343, _221, _191);
    float _353 = _273 * _303;
    float _355 = _273 * _313;
    float _357 = _353;
    float _359 = _345;
    if (!_261)
    {
        int _361 = _66 * 48;
        float _363 = -_315;
        float _365 = _363 + (-0.0);
        int _367 = _361 + 16;
        uint _369 = uint(int(uint(_361) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_369)] = as_type<uint>(_327);
        int _371 = _361 + 4;
        uint _373 = uint(int(uint(_371) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_373)] = as_type<uint>(_333);
        int _375 = _361 + 8;
        uint _377 = uint(int(uint(_375) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_377)] = as_type<uint>(_353);
        int _379 = _361 + 12;
        uint _381 = uint(int(uint(_379) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_381)] = as_type<uint>(_345);
        int _383 = _361 + 32;
        uint _385 = uint(int(uint(_367) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_385)] = as_type<uint>(_329);
        int _387 = _367 + 4;
        uint _389 = uint(int(uint(_387) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_389)] = as_type<uint>(_335);
        int _391 = _367 + 8;
        uint _393 = uint(int(uint(_391) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_393)] = as_type<uint>(_355);
        int _395 = _367 + 12;
        uint _397 = uint(int(uint(_395) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_397)] = as_type<uint>(_349);
        uint _399 = uint(int(uint(_383) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_399)] = as_type<uint>(_365);
        int _401 = _383 + 4;
        uint _403 = uint(int(uint(_401) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_403)] = as_type<uint>(_331);
        int _405 = _383 + 8;
        uint _407 = uint(int(uint(_405) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_407)] = as_type<uint>(_347);
        int _409 = _383 + 12;
        uint _411 = uint(int(uint(_409) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_411)] = as_type<uint>(_351);
    }
    int _413 = _66 * 112;
    bool _415 = !_223;
    float _743;
    float _745;
    float _747;
    float _749;
    float _751;
    float _753;
    float _755;
    float _757;
    float _759;
    float _761;
    if (!_415)
    {
        float _417 = -_315;
        float _419 = _417 + (-0.0);
        int _421 = 0;
        float _423 = _327;
        float _425 = _333;
        float _427 = _353;
        float _429 = _345;
        float _431 = _329;
        float _433 = _335;
        float _435 = _355;
        float _437 = _349;
        float _439 = _419;
        float _441 = _331;
        float _443 = _347;
        float _445 = _351;
        bool _447;
        int _495;
        int _505;
        int _515;
        int _525;
        int _535;
        int _545;
        int _555;
        int _565;
        int _575;
        int _585;
        int _595;
        int _605;
        float _719;
        float _723;
        int _725;
        int _729;
        int _731;
        int _733;
        int _737;
        int _739;
        int _741;
        do
        {
            int _449 = _421;
            float _451 = _423;
            int _453 = as_type<int>(_425);
            float _455 = _427;
            int _457 = as_type<int>(_429);
            int _459 = as_type<int>(_431);
            int _461 = as_type<int>(_433);
            int _463 = as_type<int>(_435);
            int _465 = as_type<int>(_437);
            int _467 = as_type<int>(_439);
            int _469 = as_type<int>(_441);
            int _471 = as_type<int>(_443);
            int _473 = as_type<int>(_445);
            uint _475 = uint(int(uint(_413) >> uint(2)));
            uint _477 = uint(int(uint(int(_475)) >> uint(2)));
            int _479 = int(_475) & 3;
            float _481 = (*spvDescriptorSet0.cp_c6)._m0[int(_477)][_479];
            bool _483 = _66 != 0;
            int _485 = _449 + 1;
            bool _487 = uint(_485) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _489 = as_type<int>(_451);
            int _491 = as_type<int>(_481);
            int _493 = 31;
            int _1818 = _56(_489, _491, _493, _495, gl_SubgroupInvocationID);
            int _497 = _1818;
            int _499 = _453;
            int _501 = as_type<int>(_481);
            int _503 = 31;
            int _1822 = _56(_499, _501, _503, _505, gl_SubgroupInvocationID);
            int _507 = _1822;
            int _509 = as_type<int>(_455);
            int _511 = as_type<int>(_481);
            int _513 = 31;
            int _1827 = _56(_509, _511, _513, _515, gl_SubgroupInvocationID);
            int _517 = _1827;
            int _519 = _457;
            int _521 = as_type<int>(_481);
            int _523 = 31;
            int _1831 = _56(_519, _521, _523, _525, gl_SubgroupInvocationID);
            int _527 = _1831;
            int _529 = _459;
            int _531 = as_type<int>(_481);
            int _533 = 31;
            int _1835 = _56(_529, _531, _533, _535, gl_SubgroupInvocationID);
            int _537 = _1835;
            int _539 = _461;
            int _541 = as_type<int>(_481);
            int _543 = 31;
            int _1839 = _56(_539, _541, _543, _545, gl_SubgroupInvocationID);
            int _547 = _1839;
            int _549 = _463;
            int _551 = as_type<int>(_481);
            int _553 = 31;
            int _1843 = _56(_549, _551, _553, _555, gl_SubgroupInvocationID);
            int _557 = _1843;
            int _559 = _465;
            int _561 = as_type<int>(_481);
            int _563 = 31;
            int _1847 = _56(_559, _561, _563, _565, gl_SubgroupInvocationID);
            int _567 = _1847;
            int _569 = _467;
            int _571 = as_type<int>(_481);
            int _573 = 31;
            int _1851 = _56(_569, _571, _573, _575, gl_SubgroupInvocationID);
            int _577 = _1851;
            int _579 = _469;
            int _581 = as_type<int>(_481);
            int _583 = 31;
            int _1855 = _56(_579, _581, _583, _585, gl_SubgroupInvocationID);
            int _587 = _1855;
            int _589 = _471;
            int _591 = as_type<int>(_481);
            int _593 = 31;
            int _1859 = _56(_589, _591, _593, _595, gl_SubgroupInvocationID);
            int _597 = _1859;
            int _599 = _473;
            int _601 = as_type<int>(_481);
            int _603 = 31;
            int _1863 = _56(_599, _601, _603, _605, gl_SubgroupInvocationID);
            int _607 = _1863;
            bool _609 = !_483;
            _421 = _485;
            float _611 = _451;
            int _613 = _453;
            float _615 = _455;
            int _617 = _457;
            int _619 = _459;
            int _621 = _461;
            int _623 = _463;
            int _625 = _465;
            int _627 = _467;
            int _629 = _469;
            int _631 = _471;
            int _633 = _473;
            if (!_609)
            {
                float _635 = _355 * as_type<float>(_547);
                float _637 = _335 * as_type<float>(_547);
                float _639 = _349 * as_type<float>(_547);
                float _641 = _329 * as_type<float>(_507);
                float _643 = _335 * as_type<float>(_507);
                float _645 = _355 * as_type<float>(_507);
                float _647 = _349 * as_type<float>(_507);
                float _649 = _329 * as_type<float>(_547);
                float _651 = fma(_353, as_type<float>(_537), _635);
                float _653 = fma(_333, as_type<float>(_537), _637);
                float _655 = fma(_345, as_type<float>(_537), _639);
                float _657 = _329 * as_type<float>(_587);
                float _659 = _335 * as_type<float>(_587);
                float _661 = _349 * as_type<float>(_587);
                float _663 = fma(_327, as_type<float>(_497), _641);
                float _665 = fma(_333, as_type<float>(_497), _643);
                float _667 = fma(_353, as_type<float>(_497), _645);
                float _669 = fma(_345, as_type<float>(_497), _647);
                float _671 = fma(_327, as_type<float>(_537), _649);
                float _673 = fma(_327, as_type<float>(_577), _657);
                float _675 = _355 * as_type<float>(_587);
                float _677 = fma(_333, as_type<float>(_577), _659);
                float _679 = fma(_345, as_type<float>(_577), _661);
                float _681 = -_315;
                float _683 = fma(_681, as_type<float>(_517), _663);
                float _685 = fma(_331, as_type<float>(_517), _665);
                float _687 = fma(_347, as_type<float>(_517), _667);
                float _689 = fma(_351, as_type<float>(_517), _669);
                float _691 = -_315;
                float _693 = fma(_691, as_type<float>(_557), _671);
                float _695 = fma(_331, as_type<float>(_557), _653);
                float _697 = fma(_347, as_type<float>(_557), _651);
                float _699 = -_315;
                float _701 = fma(_699, as_type<float>(_597), _673);
                float _703 = fma(_353, as_type<float>(_577), _675);
                float _705 = fma(_351, as_type<float>(_557), _655);
                float _707 = fma(_351, as_type<float>(_597), _679);
                float _709 = fma(_331, as_type<float>(_597), _677);
                float _711 = fma(_347, as_type<float>(_597), _703);
                float _713 = as_type<float>(_527) + _689;
                float _715 = as_type<float>(_567) + _705;
                float _717 = as_type<float>(_607) + _707;
                _611 = _683;
                _613 = as_type<int>(_685);
                _615 = _687;
                _617 = as_type<int>(_713);
                _619 = as_type<int>(_693);
                _621 = as_type<int>(_695);
                _623 = as_type<int>(_697);
                _625 = as_type<int>(_715);
                _627 = as_type<int>(_701);
                _629 = as_type<int>(_709);
                _631 = as_type<int>(_711);
                _633 = as_type<int>(_717);
            }
            _719 = _611;
            int _721 = _613;
            _723 = _615;
            _725 = _617;
            int _727 = _619;
            _729 = _621;
            _731 = _623;
            _733 = _625;
            int _735 = _627;
            _737 = _629;
            _739 = _631;
            _741 = _633;
            _447 = !_487;
            _423 = _719;
            _425 = as_type<float>(_721);
            _427 = _723;
            _429 = as_type<float>(_725);
            _431 = as_type<float>(_727);
            _433 = as_type<float>(_729);
            _435 = as_type<float>(_731);
            _437 = as_type<float>(_733);
            _439 = as_type<float>(_735);
            _441 = as_type<float>(_737);
            _443 = as_type<float>(_739);
            _445 = as_type<float>(_741);
            _743 = as_type<float>(_721);
            _745 = as_type<float>(_727);
            _747 = as_type<float>(_735);
        } while (_447);
        _749 = as_type<float>(_729);
        _751 = as_type<float>(_737);
        _753 = _719;
        _357 = _723;
        _755 = as_type<float>(_731);
        _757 = as_type<float>(_739);
        _759 = as_type<float>(_733);
        _761 = as_type<float>(_741);
        _359 = as_type<float>(_725);
        _763 = true;
    }
    else
    {
        float _765 = -_315;
        float _767 = _765 + (-0.0);
        _743 = _333;
        _749 = _335;
        _751 = _331;
        _753 = _327;
        _745 = _329;
        _747 = _767;
        _755 = _355;
        _757 = _347;
        _759 = _349;
        _761 = _351;
    }
    _763 = false;
    float _769 = _743;
    float _771 = _749;
    float _773 = _751;
    float _775 = _753;
    float _777 = _745;
    float _779 = _747;
    float _781 = _357;
    float _783 = _755;
    float _785 = _757;
    float _787 = _759;
    float _789 = _761;
    float _791 = _359;
    int _793 = _413 + 80;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.cp_c6)._m0[int(_797)][_799];
    int _803 = int(_795) + 1;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    int _807 = _803 & 3;
    float _809 = (*spvDescriptorSet0.cp_c6)._m0[int(_805)][_807];
    int _811 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _813 = _811 + _66;
    int _815 = _413 + 64;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.cp_c6)._m0[int(_827)][_829];
    int _833 = _413 + 88;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    uint _837 = uint(int(uint(int(_835)) >> uint(2)));
    int _839 = int(_835) & 3;
    float _841 = (*spvDescriptorSet0.cp_c6)._m0[int(_837)][_839];
    int _843 = int(_835) + 1;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    int _847 = _843 & 3;
    float _849 = (*spvDescriptorSet0.cp_c6)._m0[int(_845)][_847];
    int _851 = _413 + 72;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    uint _855 = uint(int(uint(int(_853)) >> uint(2)));
    int _857 = int(_853) & 3;
    float _859 = (*spvDescriptorSet0.cp_c6)._m0[int(_855)][_857];
    int _861 = int(_853) + 1;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    int _865 = _861 & 3;
    float _867 = (*spvDescriptorSet0.cp_c6)._m0[int(_863)][_865];
    int _869 = _413 + 96;
    uint _871 = uint(int(uint(_869) >> uint(2)));
    uint _873 = uint(int(uint(int(_871)) >> uint(2)));
    int _875 = int(_871) & 3;
    float _877 = (*spvDescriptorSet0.cp_c6)._m0[int(_873)][_875];
    int _879 = int(_871) + 1;
    uint _881 = uint(int(uint(_879) >> uint(2)));
    int _883 = _879 & 3;
    float _885 = (*spvDescriptorSet0.cp_c6)._m0[int(_881)][_883];
    int _887 = _413 + 104;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.cp_c6)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.cp_c6)._m0[int(_899)][_901];
    float _905 = _769 * _801;
    float _907 = _771 * _801;
    float _909 = _773 * _801;
    float _911 = _769 * _809;
    int _913 = _413 + 16;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    float _931 = _773 * _809;
    float _933 = fma(_775, _823, _905);
    float _935 = fma(_777, _823, _907);
    float _937 = fma(_779, _823, _909);
    float _939 = _771 * _809;
    int _941 = _413 + 32;
    uint _943 = uint(int(uint(_941) >> uint(2)));
    uint _945 = uint(int(uint(int(_943)) >> uint(2)));
    int _947 = int(_943) & 3;
    float _949 = (*spvDescriptorSet0.cp_c6)._m0[int(_945)][_947];
    int _951 = int(_943) + 1;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    int _955 = _951 & 3;
    float _957 = (*spvDescriptorSet0.cp_c6)._m0[int(_953)][_955];
    float _959 = fma(_775, _831, _911);
    float _961 = fma(_779, _831, _931);
    float _963 = fma(_777, _831, _939);
    float _965 = _769 * _841;
    float _967 = _771 * _841;
    float _969 = _771 * _849;
    float _971 = _773 * _841;
    int _973 = _413 + 48;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    uint _977 = uint(int(uint(int(_975)) >> uint(2)));
    int _979 = int(_975) & 3;
    float _981 = (*spvDescriptorSet0.cp_c6)._m0[int(_977)][_979];
    int _983 = int(_975) + 1;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    int _987 = _983 & 3;
    float _989 = (*spvDescriptorSet0.cp_c6)._m0[int(_985)][_987];
    float _991 = _773 * _849;
    float _993 = _769 * _849;
    float _995 = fma(_775, _859, _965);
    float _997 = fma(_777, _859, _967);
    float _999 = fma(_775, _867, _993);
    float _1001 = fma(_777, _867, _969);
    int _1003 = _413 + 40;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    uint _1007 = uint(int(uint(int(_1005)) >> uint(2)));
    int _1009 = int(_1005) & 3;
    float _1011 = (*spvDescriptorSet0.cp_c6)._m0[int(_1007)][_1009];
    int _1013 = int(_1005) + 1;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    int _1017 = _1013 & 3;
    float _1019 = (*spvDescriptorSet0.cp_c6)._m0[int(_1015)][_1017];
    float _1021 = fma(_779, _859, _971);
    float _1023 = fma(_779, _867, _991);
    float _1025 = fma(_781, _877, _933);
    float _1027 = fma(_783, _877, _935);
    float _1029 = fma(_785, _877, _937);
    float _1031 = fma(_783, _885, _963);
    int _1033 = _413 + 24;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    uint _1037 = uint(int(uint(int(_1035)) >> uint(2)));
    int _1039 = int(_1035) & 3;
    float _1041 = (*spvDescriptorSet0.cp_c6)._m0[int(_1037)][_1039];
    int _1043 = int(_1035) + 1;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    int _1047 = _1043 & 3;
    float _1049 = (*spvDescriptorSet0.cp_c6)._m0[int(_1045)][_1047];
    float _1051 = fma(_781, _885, _959);
    float _1053 = fma(_785, _885, _961);
    float _1055 = fma(_783, _903, _1001);
    float _1057 = fma(_785, _903, _1023);
    float _1059 = fma(_781, _903, _999);
    float _1061 = fma(_783, _895, _997);
    int _1063 = _413 + 56;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
    int _1073 = int(_1065) + 1;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    int _1077 = _1073 & 3;
    float _1079 = (*spvDescriptorSet0.cp_c6)._m0[int(_1075)][_1077];
    float _1081 = _1055 + _787;
    float _1083 = fma(_781, _895, _995);
    float _1085 = fma(_785, _895, _1021);
    float _1087 = _1057 + _789;
    float _1089 = _1059 + _791;
    float _1091 = _1027 * _929;
    float _1093 = _1031 * _929;
    float _1095 = _1061 * _929;
    float _1097 = _1081 * _929;
    float _1099 = fma(_1025, _921, _1091);
    float _1101 = fma(_1051, _921, _1093);
    float _1103 = fma(_1083, _921, _1095);
    float _1105 = fma(_1089, _921, _1097);
    float _1107 = _1081 * _957;
    float _1109 = _1027 * _957;
    float _1111 = _1031 * _957;
    float _1113 = _1061 * _957;
    float _1115 = fma(_1089, _949, _1107);
    float _1117 = fma(_1025, _949, _1109);
    float _1119 = fma(_1051, _949, _1111);
    float _1121 = fma(_1083, _949, _1113);
    float _1123 = _1027 * _989;
    float _1125 = _1031 * _989;
    float _1127 = _1061 * _989;
    float _1129 = _1081 * _989;
    float _1131 = fma(_1025, _981, _1123);
    float _1133 = fma(_1051, _981, _1125);
    float _1135 = fma(_1083, _981, _1127);
    float _1137 = fma(_1089, _981, _1129);
    float _1139 = fma(_1087, _1011, _1115);
    float _1141 = fma(_1029, _1011, _1117);
    float _1143 = fma(_1053, _1011, _1119);
    float _1145 = fma(_1085, _1011, _1121);
    float _1147 = _1139 + _1019;
    int _1149 = _813 * 48;
    float _1151 = fma(_1087, _1041, _1105);
    float _1153 = fma(_1029, _1041, _1099);
    float _1155 = fma(_1053, _1041, _1101);
    float _1157 = fma(_1085, _1041, _1103);
    float _1159 = _1151 + _1049;
    int _1161 = _1149 + 16;
    int _1163 = _1149 + 32;
    float _1165 = fma(_1087, _1071, _1137);
    float _1167 = fma(_1029, _1071, _1131);
    float _1169 = fma(_1053, _1071, _1133);
    float _1171 = fma(_1085, _1071, _1135);
    float _1173 = _1165 + _1079;
    int _1175 = _1149 + 48;
    uint _1177 = uint(int(uint(_1161) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1177)] = as_type<uint>(_1153);
    int _1179 = _1161 + 4;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = as_type<uint>(_1155);
    int _1183 = _1161 + 8;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1185)] = as_type<uint>(_1157);
    int _1187 = _1161 + 12;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1189)] = as_type<uint>(_1159);
    uint _1191 = uint(int(uint(_1163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1191)] = as_type<uint>(_1141);
    int _1193 = _1163 + 4;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1195)] = as_type<uint>(_1143);
    int _1197 = _1163 + 8;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1199)] = as_type<uint>(_1145);
    int _1201 = _1163 + 12;
    uint _1203 = uint(int(uint(_1201) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1203)] = as_type<uint>(_1147);
    uint _1205 = uint(int(uint(_1175) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1205)] = as_type<uint>(_1167);
    int _1207 = _1175 + 4;
    uint _1209 = uint(int(uint(_1207) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1209)] = as_type<uint>(_1169);
    int _1211 = _1175 + 8;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1213)] = as_type<uint>(_1171);
    int _1215 = _1175 + 12;
    uint _1217 = uint(int(uint(_1215) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1217)] = as_type<uint>(_1173);
}

