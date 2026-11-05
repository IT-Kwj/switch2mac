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
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _2965, thread const int& _2966, constant _10& support_buffer)
{
    int _2969 = 1 + _2966;
    float _2971 = support_buffer._m5[_2969].x;
    bool _2973 = _2971 == 1.0;
    if (_2973)
    {
        return _2965;
    }
    float _2975 = float(_2965);
    float _2977 = _2975 * _2971;
    int _2979 = int(_2977);
    return _2979;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3001, thread const int& _3002, thread const int& _3003, thread int& _3004, thread uint& gl_SubgroupInvocationID)
{
    int _3007 = _3003 & 31;
    uint _3009 = uint(int(uint(_3003) >> uint(8)));
    int _3011 = int(_3009) & 31;
    float _3013 = as_type<float>(gl_SubgroupInvocationID);
    int _3015 = as_type<int>(_3013) & _3011;
    int _3017 = ~_3011;
    int _3019 = _3007 & _3017;
    int _3021 = _3019 | _3015;
    int _3023 = ~_3011;
    int _3025 = _3002 & _3023;
    int _3027 = _3025 | _3015;
    bool _3029 = uint(_3027) <= uint(_3021);
    _3004 = _3029 ? (-1) : 0;
    float _3031 = spvSubgroupShuffle(as_type<float>(_3001), uint(_3027));
    uint _3033 = uint(_3029 ? as_type<int>(_3031) : _3001);
    return int(_3033);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _759 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _76 = _74 + 8;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c5)._m0[int(_81)][_83];
    uint _87 = uint(int(uint(_74) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _56(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_85);
    int _103 = 0;
    int _105 = _56(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1290 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1290.xy), uint(_1290.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _56(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _56(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1308 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1308.xy), uint(_1308.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 0;
    int _141 = _56(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_85);
    int _145 = 0;
    int _147 = _56(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1326 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1326.xy), uint(_1326.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 1;
    int _161 = _56(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_93);
    int _165 = 1;
    int _167 = _56(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1344 = int3(_161, _167, 0);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1344.xy), uint(_1344.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    int _177 = _68;
    int _179 = 0;
    int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
    int _183 = as_type<int>(_85);
    int _185 = 0;
    int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
    int3 _1362 = int3(_181, _187, 2);
    float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1362.xy), uint(_1362.z), 0).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    int _197 = _68;
    int _199 = 1;
    int _201 = _56(_197, _199, (*spvDescriptorSet0.support_buffer));
    int _203 = as_type<int>(_93);
    int _205 = 1;
    int _207 = _56(_203, _205, (*spvDescriptorSet0.support_buffer));
    int3 _1380 = int3(_201, _207, 2);
    float3 _209 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1380.xy), uint(_1380.z), 0).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    int _217 = _74 + 28;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.cp_c5)._m0[int(_221)][_223];
    bool _227 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _229 = _74 + 20;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    uint _233 = uint(int(uint(int(_231)) >> uint(2)));
    int _235 = int(_231) & 3;
    float _237 = (*spvDescriptorSet0.cp_c5)._m0[int(_233)][_235];
    float _239 = _111 * _225;
    float _241 = fma(_131, _237, _239);
    float _243 = _115 * _225;
    float _245 = _241 * 0.15915493667125701904296875;
    float _247 = _113 * _225;
    float _249 = fma(_135, _237, _243);
    float _251 = _245 * 6.283185482025146484375;
    float _253 = sin(_251);
    float _255 = fma(_133, _237, _247);
    float _257 = _249 * 0.15915493667125701904296875;
    float _259 = _255 * 0.15915493667125701904296875;
    float _261 = _151 * _225;
    bool _263 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _265 = _245 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = fma(_171, _237, _261);
    float _271 = _153 * _225;
    float _273 = _257 * 6.283185482025146484375;
    float _275 = sin(_273);
    float _277 = _257 * 6.283185482025146484375;
    float _279 = cos(_277);
    float _281 = _259 * 6.283185482025146484375;
    float _283 = sin(_281);
    float _285 = _253 * _275;
    float _287 = _275 * _267;
    float _289 = _259 * 6.283185482025146484375;
    float _291 = cos(_289);
    float _293 = _267 * _279;
    float _295 = _253 * _279;
    float _297 = _253 * _283;
    float _299 = fma(_283, _293, _285);
    float _301 = fma(_173, _237, _271);
    float _303 = -_295;
    float _305 = fma(_283, _287, _303);
    float _307 = fma(_275, _297, _293);
    float _309 = -_287;
    float _311 = fma(_279, _297, _309);
    float _313 = _155 * _225;
    float _315 = _283 * _269;
    float _317 = _253 * _291;
    float _319 = _307 * _301;
    float _321 = _291 * _269;
    float _323 = fma(_175, _237, _313);
    float _325 = _193 * _225;
    float _327 = _267 * _291;
    float _329 = _191 * _225;
    float _331 = _195 * _225;
    float _333 = _279 * _321;
    float _335 = _275 * _321;
    float _337 = _317 * _301;
    float _339 = _311 * _301;
    float _341 = _327 * _323;
    float _343 = _299 * _323;
    float _345 = _305 * _323;
    float _347 = fma(_211, _237, _329);
    float _349 = fma(_213, _237, _325);
    float _351 = fma(_215, _237, _331);
    float _353 = _343;
    float _355 = _347;
    if (!_263)
    {
        int _357 = _68 * 48;
        float _359 = -_315;
        float _361 = _359 + (-0.0);
        int _363 = _357 + 16;
        uint _365 = uint(int(uint(_357) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_365)] = as_type<uint>(_333);
        int _367 = _357 + 4;
        uint _369 = uint(int(uint(_367) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_369)] = as_type<uint>(_339);
        int _371 = _357 + 8;
        uint _373 = uint(int(uint(_371) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_373)] = as_type<uint>(_343);
        int _375 = _357 + 12;
        uint _377 = uint(int(uint(_375) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_377)] = as_type<uint>(_347);
        int _379 = _357 + 32;
        uint _381 = uint(int(uint(_363) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_381)] = as_type<uint>(_335);
        int _383 = _363 + 4;
        uint _385 = uint(int(uint(_383) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_385)] = as_type<uint>(_319);
        int _387 = _363 + 8;
        uint _389 = uint(int(uint(_387) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_389)] = as_type<uint>(_345);
        int _391 = _363 + 12;
        uint _393 = uint(int(uint(_391) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_393)] = as_type<uint>(_349);
        uint _395 = uint(int(uint(_379) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_395)] = as_type<uint>(_361);
        int _397 = _379 + 4;
        uint _399 = uint(int(uint(_397) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_399)] = as_type<uint>(_337);
        int _401 = _379 + 8;
        uint _403 = uint(int(uint(_401) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_403)] = as_type<uint>(_341);
        int _405 = _379 + 12;
        uint _407 = uint(int(uint(_405) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_407)] = as_type<uint>(_351);
    }
    int _409 = _68 * 112;
    bool _411 = !_227;
    float _739;
    float _741;
    float _743;
    float _745;
    float _747;
    float _749;
    float _751;
    float _753;
    float _755;
    float _757;
    if (!_411)
    {
        float _413 = -_315;
        float _415 = _413 + (-0.0);
        int _417 = 0;
        float _419 = _333;
        float _421 = _339;
        float _423 = _343;
        float _425 = _347;
        float _427 = _335;
        float _429 = _319;
        float _431 = _345;
        float _433 = _349;
        float _435 = _415;
        float _437 = _337;
        float _439 = _341;
        float _441 = _351;
        bool _443;
        int _491;
        int _501;
        int _511;
        int _521;
        int _531;
        int _541;
        int _551;
        int _561;
        int _571;
        int _581;
        int _591;
        int _601;
        int _715;
        float _719;
        int _721;
        float _725;
        int _727;
        int _729;
        int _733;
        int _735;
        int _737;
        do
        {
            int _445 = _417;
            int _447 = as_type<int>(_419);
            int _449 = as_type<int>(_421);
            float _451 = _423;
            int _453 = as_type<int>(_425);
            int _455 = as_type<int>(_427);
            float _457 = _429;
            int _459 = as_type<int>(_431);
            int _461 = as_type<int>(_433);
            int _463 = as_type<int>(_435);
            int _465 = as_type<int>(_437);
            int _467 = as_type<int>(_439);
            int _469 = as_type<int>(_441);
            uint _471 = uint(int(uint(_409) >> uint(2)));
            uint _473 = uint(int(uint(int(_471)) >> uint(2)));
            int _475 = int(_471) & 3;
            float _477 = (*spvDescriptorSet0.cp_c6)._m0[int(_473)][_475];
            bool _479 = _68 != 0;
            int _481 = _445 + 1;
            bool _483 = uint(_481) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _485 = _447;
            int _487 = as_type<int>(_477);
            int _489 = 31;
            int _1818 = _58(_485, _487, _489, _491, gl_SubgroupInvocationID);
            int _493 = _1818;
            int _495 = _449;
            int _497 = as_type<int>(_477);
            int _499 = 31;
            int _1822 = _58(_495, _497, _499, _501, gl_SubgroupInvocationID);
            int _503 = _1822;
            int _505 = as_type<int>(_451);
            int _507 = as_type<int>(_477);
            int _509 = 31;
            int _1827 = _58(_505, _507, _509, _511, gl_SubgroupInvocationID);
            int _513 = _1827;
            int _515 = _453;
            int _517 = as_type<int>(_477);
            int _519 = 31;
            int _1831 = _58(_515, _517, _519, _521, gl_SubgroupInvocationID);
            int _523 = _1831;
            int _525 = _455;
            int _527 = as_type<int>(_477);
            int _529 = 31;
            int _1835 = _58(_525, _527, _529, _531, gl_SubgroupInvocationID);
            int _533 = _1835;
            int _535 = as_type<int>(_457);
            int _537 = as_type<int>(_477);
            int _539 = 31;
            int _1840 = _58(_535, _537, _539, _541, gl_SubgroupInvocationID);
            int _543 = _1840;
            int _545 = _459;
            int _547 = as_type<int>(_477);
            int _549 = 31;
            int _1844 = _58(_545, _547, _549, _551, gl_SubgroupInvocationID);
            int _553 = _1844;
            int _555 = _461;
            int _557 = as_type<int>(_477);
            int _559 = 31;
            int _1848 = _58(_555, _557, _559, _561, gl_SubgroupInvocationID);
            int _563 = _1848;
            int _565 = _463;
            int _567 = as_type<int>(_477);
            int _569 = 31;
            int _1852 = _58(_565, _567, _569, _571, gl_SubgroupInvocationID);
            int _573 = _1852;
            int _575 = _465;
            int _577 = as_type<int>(_477);
            int _579 = 31;
            int _1856 = _58(_575, _577, _579, _581, gl_SubgroupInvocationID);
            int _583 = _1856;
            int _585 = _467;
            int _587 = as_type<int>(_477);
            int _589 = 31;
            int _1860 = _58(_585, _587, _589, _591, gl_SubgroupInvocationID);
            int _593 = _1860;
            int _595 = _469;
            int _597 = as_type<int>(_477);
            int _599 = 31;
            int _1864 = _58(_595, _597, _599, _601, gl_SubgroupInvocationID);
            int _603 = _1864;
            bool _605 = !_479;
            _417 = _481;
            int _607 = _447;
            int _609 = _449;
            float _611 = _451;
            int _613 = _453;
            int _615 = _455;
            float _617 = _457;
            int _619 = _459;
            int _621 = _461;
            int _623 = _463;
            int _625 = _465;
            int _627 = _467;
            int _629 = _469;
            if (!_605)
            {
                float _631 = _319 * as_type<float>(_543);
                float _633 = _349 * as_type<float>(_543);
                float _635 = _335 * as_type<float>(_503);
                float _637 = _319 * as_type<float>(_503);
                float _639 = _345 * as_type<float>(_503);
                float _641 = _349 * as_type<float>(_503);
                float _643 = _335 * as_type<float>(_543);
                float _645 = _345 * as_type<float>(_543);
                float _647 = fma(_339, as_type<float>(_533), _631);
                float _649 = fma(_347, as_type<float>(_533), _633);
                float _651 = _319 * as_type<float>(_583);
                float _653 = _349 * as_type<float>(_583);
                float _655 = fma(_333, as_type<float>(_493), _635);
                float _657 = fma(_339, as_type<float>(_493), _637);
                float _659 = fma(_343, as_type<float>(_493), _639);
                float _661 = fma(_347, as_type<float>(_493), _641);
                float _663 = fma(_333, as_type<float>(_533), _643);
                float _665 = fma(_343, as_type<float>(_533), _645);
                float _667 = _335 * as_type<float>(_583);
                float _669 = _345 * as_type<float>(_583);
                float _671 = fma(_339, as_type<float>(_573), _651);
                float _673 = fma(_347, as_type<float>(_573), _653);
                float _675 = -_315;
                float _677 = fma(_675, as_type<float>(_513), _655);
                float _679 = fma(_337, as_type<float>(_513), _657);
                float _681 = fma(_341, as_type<float>(_513), _659);
                float _683 = fma(_351, as_type<float>(_513), _661);
                float _685 = fma(_333, as_type<float>(_573), _667);
                float _687 = fma(_343, as_type<float>(_573), _669);
                float _689 = -_315;
                float _691 = fma(_689, as_type<float>(_553), _663);
                float _693 = fma(_337, as_type<float>(_553), _647);
                float _695 = fma(_341, as_type<float>(_553), _665);
                float _697 = fma(_351, as_type<float>(_553), _649);
                float _699 = fma(_351, as_type<float>(_593), _673);
                float _701 = -_315;
                float _703 = fma(_701, as_type<float>(_593), _685);
                float _705 = fma(_341, as_type<float>(_593), _687);
                float _707 = fma(_337, as_type<float>(_593), _671);
                float _709 = as_type<float>(_523) + _683;
                float _711 = as_type<float>(_563) + _697;
                float _713 = as_type<float>(_603) + _699;
                _607 = as_type<int>(_677);
                _609 = as_type<int>(_679);
                _611 = _681;
                _613 = as_type<int>(_709);
                _615 = as_type<int>(_691);
                _617 = _693;
                _619 = as_type<int>(_695);
                _621 = as_type<int>(_711);
                _623 = as_type<int>(_703);
                _625 = as_type<int>(_707);
                _627 = as_type<int>(_705);
                _629 = as_type<int>(_713);
            }
            _715 = _607;
            int _717 = _609;
            _719 = _611;
            _721 = _613;
            int _723 = _615;
            _725 = _617;
            _727 = _619;
            _729 = _621;
            int _731 = _623;
            _733 = _625;
            _735 = _627;
            _737 = _629;
            _443 = !_483;
            _419 = as_type<float>(_715);
            _421 = as_type<float>(_717);
            _423 = _719;
            _425 = as_type<float>(_721);
            _427 = as_type<float>(_723);
            _429 = _725;
            _431 = as_type<float>(_727);
            _433 = as_type<float>(_729);
            _435 = as_type<float>(_731);
            _437 = as_type<float>(_733);
            _439 = as_type<float>(_735);
            _441 = as_type<float>(_737);
            _739 = as_type<float>(_717);
            _741 = as_type<float>(_723);
            _743 = as_type<float>(_731);
        } while (_443);
        _745 = _725;
        _747 = as_type<float>(_733);
        _749 = as_type<float>(_715);
        _353 = _719;
        _751 = as_type<float>(_727);
        _753 = as_type<float>(_735);
        _755 = as_type<float>(_729);
        _757 = as_type<float>(_737);
        _355 = as_type<float>(_721);
        _759 = true;
    }
    else
    {
        float _761 = -_315;
        float _763 = _761 + (-0.0);
        _739 = _339;
        _745 = _319;
        _747 = _337;
        _749 = _333;
        _741 = _335;
        _743 = _763;
        _751 = _345;
        _753 = _341;
        _755 = _349;
        _757 = _351;
    }
    _759 = false;
    float _765 = _739;
    float _767 = _745;
    float _769 = _747;
    float _771 = _749;
    float _773 = _741;
    float _775 = _743;
    float _777 = _353;
    float _779 = _751;
    float _781 = _753;
    float _783 = _755;
    float _785 = _757;
    float _787 = _355;
    int _789 = _409 + 80;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.cp_c6)._m0[int(_793)][_795];
    int _799 = int(_791) + 1;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    int _803 = _799 & 3;
    float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
    int _807 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _809 = _807 + _68;
    int _811 = _409 + 64;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.cp_c6)._m0[int(_815)][_817];
    int _821 = int(_813) + 1;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    int _825 = _821 & 3;
    float _827 = (*spvDescriptorSet0.cp_c6)._m0[int(_823)][_825];
    int _829 = _409 + 88;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    uint _833 = uint(int(uint(int(_831)) >> uint(2)));
    int _835 = int(_831) & 3;
    float _837 = (*spvDescriptorSet0.cp_c6)._m0[int(_833)][_835];
    int _839 = int(_831) + 1;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    int _843 = _839 & 3;
    float _845 = (*spvDescriptorSet0.cp_c6)._m0[int(_841)][_843];
    int _847 = _409 + 72;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
    int _857 = int(_849) + 1;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    int _861 = _857 & 3;
    float _863 = (*spvDescriptorSet0.cp_c6)._m0[int(_859)][_861];
    int _865 = _409 + 96;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    uint _869 = uint(int(uint(int(_867)) >> uint(2)));
    int _871 = int(_867) & 3;
    float _873 = (*spvDescriptorSet0.cp_c6)._m0[int(_869)][_871];
    int _875 = int(_867) + 1;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    int _879 = _875 & 3;
    float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
    int _883 = _409 + 104;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.cp_c6)._m0[int(_887)][_889];
    int _893 = int(_885) + 1;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    int _897 = _893 & 3;
    float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
    float _901 = _765 * _797;
    float _903 = _767 * _797;
    int _905 = _409 + 16;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    uint _909 = uint(int(uint(int(_907)) >> uint(2)));
    int _911 = int(_907) & 3;
    float _913 = (*spvDescriptorSet0.cp_c6)._m0[int(_909)][_911];
    int _915 = int(_907) + 1;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    int _919 = _915 & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    float _923 = _769 * _797;
    float _925 = _769 * _805;
    float _927 = fma(_771, _819, _901);
    float _929 = fma(_773, _819, _903);
    float _931 = _765 * _805;
    float _933 = _767 * _805;
    int _935 = _409 + 32;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.cp_c6)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.cp_c6)._m0[int(_947)][_949];
    float _953 = fma(_775, _819, _923);
    float _955 = fma(_771, _827, _931);
    float _957 = fma(_773, _827, _933);
    float _959 = fma(_775, _827, _925);
    float _961 = _765 * _837;
    float _963 = _767 * _837;
    float _965 = _765 * _845;
    int _967 = _409 + 48;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.cp_c6)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.cp_c6)._m0[int(_979)][_981];
    float _985 = _767 * _845;
    float _987 = _769 * _837;
    float _989 = _769 * _845;
    float _991 = fma(_771, _855, _961);
    float _993 = fma(_771, _863, _965);
    float _995 = fma(_773, _855, _963);
    float _997 = fma(_773, _863, _985);
    int _999 = _409 + 24;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    uint _1003 = uint(int(uint(int(_1001)) >> uint(2)));
    int _1005 = int(_1001) & 3;
    float _1007 = (*spvDescriptorSet0.cp_c6)._m0[int(_1003)][_1005];
    int _1009 = int(_1001) + 1;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    int _1013 = _1009 & 3;
    float _1015 = (*spvDescriptorSet0.cp_c6)._m0[int(_1011)][_1013];
    float _1017 = fma(_775, _855, _987);
    float _1019 = fma(_775, _863, _989);
    float _1021 = fma(_777, _873, _927);
    float _1023 = fma(_777, _881, _955);
    float _1025 = fma(_779, _873, _929);
    float _1027 = fma(_779, _881, _957);
    int _1029 = _409 + 40;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    uint _1033 = uint(int(uint(int(_1031)) >> uint(2)));
    int _1035 = int(_1031) & 3;
    float _1037 = (*spvDescriptorSet0.cp_c6)._m0[int(_1033)][_1035];
    int _1039 = int(_1031) + 1;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    int _1043 = _1039 & 3;
    float _1045 = (*spvDescriptorSet0.cp_c6)._m0[int(_1041)][_1043];
    float _1047 = fma(_781, _873, _953);
    float _1049 = fma(_781, _881, _959);
    float _1051 = fma(_779, _899, _997);
    float _1053 = fma(_777, _891, _991);
    float _1055 = fma(_777, _899, _993);
    float _1057 = fma(_781, _899, _1019);
    int _1059 = _409 + 56;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.cp_c6)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.cp_c6)._m0[int(_1071)][_1073];
    float _1077 = fma(_779, _891, _995);
    float _1079 = _1051 + _783;
    float _1081 = fma(_781, _891, _1017);
    float _1083 = _1057 + _785;
    float _1085 = _1055 + _787;
    float _1087 = _1025 * _921;
    float _1089 = _1027 * _921;
    float _1091 = _1077 * _921;
    float _1093 = _1079 * _921;
    float _1095 = fma(_1021, _913, _1087);
    float _1097 = fma(_1023, _913, _1089);
    float _1099 = fma(_1053, _913, _1091);
    float _1101 = fma(_1085, _913, _1093);
    float _1103 = _1025 * _951;
    float _1105 = _1027 * _951;
    float _1107 = _1077 * _951;
    float _1109 = _1079 * _951;
    float _1111 = fma(_1021, _943, _1103);
    float _1113 = fma(_1023, _943, _1105);
    float _1115 = fma(_1053, _943, _1107);
    float _1117 = fma(_1085, _943, _1109);
    float _1119 = _1079 * _983;
    float _1121 = _1025 * _983;
    float _1123 = _1027 * _983;
    float _1125 = _1077 * _983;
    float _1127 = fma(_1085, _975, _1119);
    float _1129 = fma(_1021, _975, _1121);
    float _1131 = fma(_1023, _975, _1123);
    float _1133 = fma(_1053, _975, _1125);
    float _1135 = fma(_1083, _1007, _1101);
    float _1137 = fma(_1047, _1007, _1095);
    float _1139 = fma(_1049, _1007, _1097);
    float _1141 = fma(_1081, _1007, _1099);
    int _1143 = _809 * 48;
    float _1145 = _1135 + _1015;
    float _1147 = fma(_1083, _1037, _1117);
    int _1149 = _1143 + 16;
    float _1151 = fma(_1047, _1037, _1111);
    float _1153 = fma(_1049, _1037, _1113);
    float _1155 = fma(_1081, _1037, _1115);
    float _1157 = _1147 + _1045;
    int _1159 = _1143 + 32;
    uint _1161 = uint(int(uint(_1149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1161)] = as_type<uint>(_1137);
    int _1163 = _1149 + 4;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1165)] = as_type<uint>(_1139);
    int _1167 = _1149 + 8;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1169)] = as_type<uint>(_1141);
    int _1171 = _1149 + 12;
    uint _1173 = uint(int(uint(_1171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1173)] = as_type<uint>(_1145);
    float _1175 = fma(_1083, _1067, _1127);
    float _1177 = fma(_1047, _1067, _1129);
    float _1179 = fma(_1049, _1067, _1131);
    float _1181 = fma(_1081, _1067, _1133);
    float _1183 = _1175 + _1075;
    int _1185 = _1143 + 48;
    uint _1187 = uint(int(uint(_1159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1187)] = as_type<uint>(_1151);
    int _1189 = _1159 + 4;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1191)] = as_type<uint>(_1153);
    int _1193 = _1159 + 8;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1195)] = as_type<uint>(_1155);
    int _1197 = _1159 + 12;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1199)] = as_type<uint>(_1157);
    uint _1201 = uint(int(uint(_1185) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1201)] = as_type<uint>(_1177);
    int _1203 = _1185 + 4;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1205)] = as_type<uint>(_1179);
    int _1207 = _1185 + 8;
    uint _1209 = uint(int(uint(_1207) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1209)] = as_type<uint>(_1181);
    int _1211 = _1185 + 12;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1213)] = as_type<uint>(_1183);
}

