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
int _56(thread const int& _2942, thread const int& _2943, constant _10& support_buffer)
{
    int _2946 = 1 + _2943;
    float _2948 = support_buffer._m5[_2946].x;
    bool _2950 = _2948 == 1.0;
    if (_2950)
    {
        return _2942;
    }
    float _2952 = float(_2942);
    float _2954 = _2952 * _2948;
    int _2956 = int(_2954);
    return _2956;
}

static inline __attribute__((always_inline))
int _58(thread const int& _2978, thread const int& _2979, thread const int& _2980, thread int& _2981, thread uint& gl_SubgroupInvocationID)
{
    int _2984 = _2980 & 31;
    uint _2986 = uint(int(uint(_2980) >> uint(8)));
    int _2988 = int(_2986) & 31;
    float _2990 = as_type<float>(gl_SubgroupInvocationID);
    int _2992 = as_type<int>(_2990) & _2988;
    int _2994 = ~_2988;
    int _2996 = _2984 & _2994;
    int _2998 = _2996 | _2992;
    int _3000 = ~_2988;
    int _3002 = _2979 & _3000;
    int _3004 = _3002 | _2992;
    bool _3006 = uint(_3004) <= uint(_2998);
    _2981 = _3006 ? (-1) : 0;
    float _3008 = spvSubgroupShuffle(as_type<float>(_2978), uint(_3004));
    uint _3010 = uint(_3006 ? as_type<int>(_3008) : _2978);
    return int(_3010);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _705 = false;
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
    int3 _1286 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1286.xy), uint(_1286.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _56(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _56(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1304 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1304.xy), uint(_1304.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 0;
    int _141 = _56(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_85);
    int _145 = 0;
    int _147 = _56(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1322 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1322.xy), uint(_1322.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 1;
    int _161 = _56(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_93);
    int _165 = 1;
    int _167 = _56(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1340 = int3(_161, _167, 0);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1340.xy), uint(_1340.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    int _177 = _68;
    int _179 = 0;
    int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
    int _183 = as_type<int>(_85);
    int _185 = 0;
    int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
    int3 _1358 = int3(_181, _187, 2);
    float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1358.xy), uint(_1358.z), 0).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    int _197 = _68;
    int _199 = 1;
    int _201 = _56(_197, _199, (*spvDescriptorSet0.support_buffer));
    int _203 = as_type<int>(_93);
    int _205 = 1;
    int _207 = _56(_203, _205, (*spvDescriptorSet0.support_buffer));
    int3 _1376 = int3(_201, _207, 2);
    float3 _209 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1376.xy), uint(_1376.z), 0).xyz;
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
    float _241 = _113 * _225;
    float _243 = fma(_131, _237, _239);
    float _245 = _115 * _225;
    float _247 = fma(_133, _237, _241);
    float _249 = _243 * 0.15915493667125701904296875;
    float _251 = fma(_135, _237, _245);
    float _253 = _247 * 0.15915493667125701904296875;
    float _255 = _249 * 6.283185482025146484375;
    float _257 = sin(_255);
    float _259 = _251 * 0.15915493667125701904296875;
    float _261 = _249 * 6.283185482025146484375;
    float _263 = cos(_261);
    float _265 = _259 * 6.283185482025146484375;
    float _267 = sin(_265);
    float _269 = _259 * 6.283185482025146484375;
    float _271 = cos(_269);
    float _273 = _151 * _225;
    float _275 = fma(_171, _237, _273);
    float _277 = _155 * _225;
    float _279 = _253 * 6.283185482025146484375;
    float _281 = sin(_279);
    float _283 = _257 * _267;
    float _285 = _267 * _263;
    float _287 = fma(_175, _237, _277);
    float _289 = _253 * 6.283185482025146484375;
    float _291 = cos(_289);
    float _293 = _263 * _271;
    float _295 = _257 * _271;
    float _297 = _257 * _281;
    float _299 = fma(_281, _293, _283);
    float _301 = -_295;
    float _303 = fma(_281, _285, _301);
    float _305 = fma(_267, _297, _293);
    float _307 = -_285;
    float _309 = fma(_271, _297, _307);
    float _311 = _153 * _225;
    float _313 = _257 * _291;
    float _315 = _291 * _275;
    float _317 = fma(_173, _237, _311);
    float _319 = _281 * _275;
    float _321 = _263 * _291;
    float _323 = _267 * _315;
    float _325 = _313 * _317;
    float _327 = _309 * _317;
    float _329 = _191 * _225;
    float _331 = _193 * _225;
    float _333 = _195 * _225;
    float _335 = _271 * _315;
    float _337 = fma(_211, _237, _329);
    float _339 = fma(_213, _237, _331);
    float _341 = _305 * _317;
    float _343 = _321 * _287;
    float _345 = _299 * _287;
    float _347 = _303 * _287;
    float _349 = fma(_215, _237, _333);
    int _351 = _68 * 112;
    bool _353 = !_227;
    float _355 = _345;
    float _357 = _337;
    float _359 = _323;
    float _361 = _341;
    float _363 = _325;
    float _365 = _343;
    float _693;
    float _695;
    float _697;
    float _699;
    float _701;
    float _703;
    if (!_353)
    {
        float _367 = -_319;
        float _369 = _367 + (-0.0);
        int _371 = 0;
        float _373 = _335;
        float _375 = _327;
        float _377 = _345;
        float _379 = _337;
        float _381 = _323;
        float _383 = _341;
        float _385 = _347;
        float _387 = _339;
        float _389 = _369;
        float _391 = _325;
        float _393 = _343;
        float _395 = _349;
        bool _397;
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
        int _555;
        float _669;
        float _671;
        float _673;
        int _675;
        float _677;
        int _679;
        int _681;
        int _683;
        int _685;
        float _687;
        float _689;
        float _691;
        do
        {
            int _399 = _371;
            float _401 = _373;
            float _403 = _375;
            float _405 = _377;
            int _407 = as_type<int>(_379);
            float _409 = _381;
            int _411 = as_type<int>(_383);
            int _413 = as_type<int>(_385);
            int _415 = as_type<int>(_387);
            int _417 = as_type<int>(_389);
            float _419 = _391;
            float _421 = _393;
            float _423 = _395;
            uint _425 = uint(int(uint(_351) >> uint(2)));
            uint _427 = uint(int(uint(int(_425)) >> uint(2)));
            int _429 = int(_425) & 3;
            float _431 = (*spvDescriptorSet0.cp_c6)._m0[int(_427)][_429];
            bool _433 = _68 != 0;
            int _435 = _399 + 1;
            bool _437 = uint(_435) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _439 = as_type<int>(_401);
            int _441 = as_type<int>(_431);
            int _443 = 31;
            int _1674 = _58(_439, _441, _443, _445, gl_SubgroupInvocationID);
            int _447 = _1674;
            int _449 = as_type<int>(_403);
            int _451 = as_type<int>(_431);
            int _453 = 31;
            int _1679 = _58(_449, _451, _453, _455, gl_SubgroupInvocationID);
            int _457 = _1679;
            int _459 = as_type<int>(_405);
            int _461 = as_type<int>(_431);
            int _463 = 31;
            int _1684 = _58(_459, _461, _463, _465, gl_SubgroupInvocationID);
            int _467 = _1684;
            int _469 = _407;
            int _471 = as_type<int>(_431);
            int _473 = 31;
            int _1688 = _58(_469, _471, _473, _475, gl_SubgroupInvocationID);
            int _477 = _1688;
            int _479 = as_type<int>(_409);
            int _481 = as_type<int>(_431);
            int _483 = 31;
            int _1693 = _58(_479, _481, _483, _485, gl_SubgroupInvocationID);
            int _487 = _1693;
            int _489 = _411;
            int _491 = as_type<int>(_431);
            int _493 = 31;
            int _1697 = _58(_489, _491, _493, _495, gl_SubgroupInvocationID);
            int _497 = _1697;
            int _499 = _413;
            int _501 = as_type<int>(_431);
            int _503 = 31;
            int _1701 = _58(_499, _501, _503, _505, gl_SubgroupInvocationID);
            int _507 = _1701;
            int _509 = _415;
            int _511 = as_type<int>(_431);
            int _513 = 31;
            int _1705 = _58(_509, _511, _513, _515, gl_SubgroupInvocationID);
            int _517 = _1705;
            int _519 = _417;
            int _521 = as_type<int>(_431);
            int _523 = 31;
            int _1709 = _58(_519, _521, _523, _525, gl_SubgroupInvocationID);
            int _527 = _1709;
            int _529 = as_type<int>(_419);
            int _531 = as_type<int>(_431);
            int _533 = 31;
            int _1714 = _58(_529, _531, _533, _535, gl_SubgroupInvocationID);
            int _537 = _1714;
            int _539 = as_type<int>(_421);
            int _541 = as_type<int>(_431);
            int _543 = 31;
            int _1719 = _58(_539, _541, _543, _545, gl_SubgroupInvocationID);
            int _547 = _1719;
            int _549 = as_type<int>(_423);
            int _551 = as_type<int>(_431);
            int _553 = 31;
            int _1724 = _58(_549, _551, _553, _555, gl_SubgroupInvocationID);
            int _557 = _1724;
            bool _559 = !_433;
            _371 = _435;
            float _561 = _401;
            float _563 = _403;
            float _565 = _405;
            int _567 = _407;
            float _569 = _409;
            int _571 = _411;
            int _573 = _413;
            int _575 = _415;
            int _577 = _417;
            float _579 = _419;
            float _581 = _421;
            float _583 = _423;
            if (!_559)
            {
                float _585 = _339 * as_type<float>(_457);
                float _587 = _323 * as_type<float>(_457);
                float _589 = _341 * as_type<float>(_457);
                float _591 = _347 * as_type<float>(_457);
                float _593 = fma(_337, as_type<float>(_447), _585);
                float _595 = _323 * as_type<float>(_497);
                float _597 = _341 * as_type<float>(_497);
                float _599 = _347 * as_type<float>(_497);
                float _601 = _339 * as_type<float>(_497);
                float _603 = fma(_335, as_type<float>(_447), _587);
                float _605 = fma(_327, as_type<float>(_447), _589);
                float _607 = fma(_345, as_type<float>(_447), _591);
                float _609 = fma(_335, as_type<float>(_487), _595);
                float _611 = fma(_327, as_type<float>(_487), _597);
                float _613 = fma(_345, as_type<float>(_487), _599);
                float _615 = _339 * as_type<float>(_537);
                float _617 = fma(_337, as_type<float>(_487), _601);
                float _619 = _323 * as_type<float>(_537);
                float _621 = _341 * as_type<float>(_537);
                float _623 = _347 * as_type<float>(_537);
                float _625 = fma(_337, as_type<float>(_527), _615);
                float _627 = fma(_335, as_type<float>(_527), _619);
                float _629 = fma(_327, as_type<float>(_527), _621);
                float _631 = fma(_345, as_type<float>(_527), _623);
                float _633 = fma(_349, as_type<float>(_467), _593);
                float _635 = fma(_349, as_type<float>(_507), _617);
                float _637 = fma(_349, as_type<float>(_547), _625);
                float _639 = fma(_325, as_type<float>(_467), _605);
                float _641 = fma(_343, as_type<float>(_467), _607);
                float _643 = -_319;
                float _645 = fma(_643, as_type<float>(_467), _603);
                float _647 = -_319;
                float _649 = fma(_647, as_type<float>(_507), _609);
                float _651 = fma(_325, as_type<float>(_507), _611);
                float _653 = fma(_325, as_type<float>(_547), _629);
                float _655 = fma(_343, as_type<float>(_507), _613);
                float _657 = -_319;
                float _659 = fma(_657, as_type<float>(_547), _627);
                float _661 = fma(_343, as_type<float>(_547), _631);
                float _663 = as_type<float>(_477) + _633;
                float _665 = as_type<float>(_517) + _635;
                float _667 = as_type<float>(_557) + _637;
                _561 = _645;
                _563 = _639;
                _565 = _641;
                _567 = as_type<int>(_663);
                _569 = _649;
                _571 = as_type<int>(_651);
                _573 = as_type<int>(_655);
                _575 = as_type<int>(_665);
                _577 = as_type<int>(_659);
                _579 = _653;
                _581 = _661;
                _583 = _667;
            }
            _669 = _561;
            _671 = _563;
            _673 = _565;
            _675 = _567;
            _677 = _569;
            _679 = _571;
            _681 = _573;
            _683 = _575;
            _685 = _577;
            _687 = _579;
            _689 = _581;
            _691 = _583;
            _397 = !_437;
            _373 = _669;
            _375 = _671;
            _377 = _673;
            _379 = as_type<float>(_675);
            _381 = _677;
            _383 = as_type<float>(_679);
            _385 = as_type<float>(_681);
            _387 = as_type<float>(_683);
            _389 = as_type<float>(_685);
            _391 = _687;
            _393 = _689;
            _395 = _691;
        } while (_397);
        _693 = _669;
        _695 = _671;
        _355 = _673;
        _357 = as_type<float>(_675);
        _359 = _677;
        _361 = as_type<float>(_679);
        _697 = as_type<float>(_681);
        _699 = as_type<float>(_683);
        _701 = as_type<float>(_685);
        _363 = _687;
        _365 = _689;
        _703 = _691;
        _705 = true;
    }
    else
    {
        float _707 = -_319;
        float _709 = _707 + (-0.0);
        _693 = _335;
        _695 = _327;
        _697 = _347;
        _699 = _339;
        _701 = _709;
        _703 = _349;
    }
    _705 = false;
    float _711 = _693;
    float _713 = _695;
    float _715 = _355;
    float _717 = _357;
    float _719 = _359;
    float _721 = _361;
    float _723 = _697;
    float _725 = _699;
    float _727 = _701;
    float _729 = _363;
    float _731 = _365;
    float _733 = _703;
    int _735 = _351 + 80;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    uint _739 = uint(int(uint(int(_737)) >> uint(2)));
    int _741 = int(_737) & 3;
    float _743 = (*spvDescriptorSet0.cp_c6)._m0[int(_739)][_741];
    int _745 = int(_737) + 1;
    uint _747 = uint(int(uint(_745) >> uint(2)));
    int _749 = _745 & 3;
    float _751 = (*spvDescriptorSet0.cp_c6)._m0[int(_747)][_749];
    bool _753 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _755 = _351 + 64;
    uint _757 = uint(int(uint(_755) >> uint(2)));
    uint _759 = uint(int(uint(int(_757)) >> uint(2)));
    int _761 = int(_757) & 3;
    float _763 = (*spvDescriptorSet0.cp_c6)._m0[int(_759)][_761];
    int _765 = int(_757) + 1;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    int _769 = _765 & 3;
    float _771 = (*spvDescriptorSet0.cp_c6)._m0[int(_767)][_769];
    int _773 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _775 = _773 + _68;
    int _777 = _351 + 88;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    uint _781 = uint(int(uint(int(_779)) >> uint(2)));
    int _783 = int(_779) & 3;
    float _785 = (*spvDescriptorSet0.cp_c6)._m0[int(_781)][_783];
    int _787 = int(_779) + 1;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    int _791 = _787 & 3;
    float _793 = (*spvDescriptorSet0.cp_c6)._m0[int(_789)][_791];
    int _795 = _351 + 72;
    uint _797 = uint(int(uint(_795) >> uint(2)));
    uint _799 = uint(int(uint(int(_797)) >> uint(2)));
    int _801 = int(_797) & 3;
    float _803 = (*spvDescriptorSet0.cp_c6)._m0[int(_799)][_801];
    int _805 = int(_797) + 1;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    int _809 = _805 & 3;
    float _811 = (*spvDescriptorSet0.cp_c6)._m0[int(_807)][_809];
    int _813 = _351 + 96;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    uint _817 = uint(int(uint(int(_815)) >> uint(2)));
    int _819 = int(_815) & 3;
    float _821 = (*spvDescriptorSet0.cp_c6)._m0[int(_817)][_819];
    int _823 = int(_815) + 1;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    int _827 = _823 & 3;
    float _829 = (*spvDescriptorSet0.cp_c6)._m0[int(_825)][_827];
    int _831 = _351 + 104;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.cp_c6)._m0[int(_835)][_837];
    int _841 = int(_833) + 1;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    int _845 = _841 & 3;
    float _847 = (*spvDescriptorSet0.cp_c6)._m0[int(_843)][_845];
    int _849 = _351 + 16;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    uint _853 = uint(int(uint(int(_851)) >> uint(2)));
    int _855 = int(_851) & 3;
    float _857 = (*spvDescriptorSet0.cp_c6)._m0[int(_853)][_855];
    int _859 = int(_851) + 1;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    int _863 = _859 & 3;
    float _865 = (*spvDescriptorSet0.cp_c6)._m0[int(_861)][_863];
    if (!_753)
    {
        int _867 = _68 * 48;
        int _869 = _867 + 16;
        uint _871 = uint(int(uint(_867) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_871)] = as_type<uint>(_711);
        int _873 = _867 + 4;
        uint _875 = uint(int(uint(_873) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_875)] = as_type<uint>(_713);
        int _877 = _867 + 8;
        uint _879 = uint(int(uint(_877) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_879)] = as_type<uint>(_715);
        int _881 = _867 + 12;
        uint _883 = uint(int(uint(_881) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_883)] = as_type<uint>(_717);
        int _885 = _867 + 32;
        uint _887 = uint(int(uint(_869) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_887)] = as_type<uint>(_719);
        int _889 = _869 + 4;
        uint _891 = uint(int(uint(_889) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_891)] = as_type<uint>(_721);
        int _893 = _869 + 8;
        uint _895 = uint(int(uint(_893) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_895)] = as_type<uint>(_723);
        int _897 = _869 + 12;
        uint _899 = uint(int(uint(_897) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_899)] = as_type<uint>(_725);
        uint _901 = uint(int(uint(_885) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_901)] = as_type<uint>(_727);
        int _903 = _885 + 4;
        uint _905 = uint(int(uint(_903) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_905)] = as_type<uint>(_729);
        int _907 = _885 + 8;
        uint _909 = uint(int(uint(_907) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_909)] = as_type<uint>(_731);
        int _911 = _885 + 12;
        uint _913 = uint(int(uint(_911) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_913)] = as_type<uint>(_733);
    }
    float _915 = _729 * _743;
    float _917 = _713 * _743;
    float _919 = _721 * _743;
    int _921 = _351 + 32;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    uint _925 = uint(int(uint(int(_923)) >> uint(2)));
    int _927 = int(_923) & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    int _931 = int(_923) + 1;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    int _935 = _931 & 3;
    float _937 = (*spvDescriptorSet0.cp_c6)._m0[int(_933)][_935];
    float _939 = fma(_727, _763, _915);
    float _941 = _713 * _751;
    float _943 = fma(_711, _763, _917);
    float _945 = fma(_719, _763, _919);
    float _947 = _721 * _751;
    float _949 = fma(_711, _771, _941);
    float _951 = _713 * _785;
    int _953 = _351 + 48;
    uint _955 = uint(int(uint(_953) >> uint(2)));
    uint _957 = uint(int(uint(int(_955)) >> uint(2)));
    int _959 = int(_955) & 3;
    float _961 = (*spvDescriptorSet0.cp_c6)._m0[int(_957)][_959];
    int _963 = int(_955) + 1;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    int _967 = _963 & 3;
    float _969 = (*spvDescriptorSet0.cp_c6)._m0[int(_965)][_967];
    float _971 = _713 * _793;
    float _973 = _729 * _751;
    float _975 = _721 * _785;
    float _977 = _721 * _793;
    float _979 = _729 * _785;
    float _981 = fma(_719, _771, _947);
    float _983 = fma(_727, _771, _973);
    float _985 = _729 * _793;
    float _987 = fma(_711, _803, _951);
    int _989 = _351 + 24;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.cp_c6)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.cp_c6)._m0[int(_1001)][_1003];
    float _1007 = fma(_711, _811, _971);
    float _1009 = fma(_719, _803, _975);
    float _1011 = fma(_719, _811, _977);
    float _1013 = fma(_727, _811, _985);
    float _1015 = fma(_727, _803, _979);
    float _1017 = fma(_715, _821, _943);
    float _1019 = fma(_723, _847, _1011);
    int _1021 = _351 + 40;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.cp_c6)._m0[int(_1025)][_1027];
    int _1031 = int(_1023) + 1;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    int _1035 = _1031 & 3;
    float _1037 = (*spvDescriptorSet0.cp_c6)._m0[int(_1033)][_1035];
    float _1039 = fma(_723, _821, _945);
    float _1041 = fma(_731, _821, _939);
    float _1043 = fma(_715, _829, _949);
    float _1045 = fma(_715, _839, _987);
    float _1047 = fma(_715, _847, _1007);
    float _1049 = fma(_723, _829, _981);
    float _1051 = fma(_723, _839, _1009);
    int _1053 = _351 + 56;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    uint _1057 = uint(int(uint(int(_1055)) >> uint(2)));
    int _1059 = int(_1055) & 3;
    float _1061 = (*spvDescriptorSet0.cp_c6)._m0[int(_1057)][_1059];
    int _1063 = int(_1055) + 1;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    int _1067 = _1063 & 3;
    float _1069 = (*spvDescriptorSet0.cp_c6)._m0[int(_1065)][_1067];
    float _1071 = fma(_731, _847, _1013);
    float _1073 = _1019 + _725;
    float _1075 = fma(_731, _829, _983);
    float _1077 = fma(_731, _839, _1015);
    float _1079 = _1071 + _733;
    float _1081 = _1047 + _717;
    float _1083 = _1039 * _865;
    float _1085 = _1049 * _865;
    float _1087 = _1051 * _865;
    float _1089 = _1073 * _865;
    float _1091 = fma(_1017, _857, _1083);
    float _1093 = fma(_1043, _857, _1085);
    float _1095 = fma(_1045, _857, _1087);
    float _1097 = fma(_1081, _857, _1089);
    float _1099 = _1039 * _937;
    float _1101 = _1049 * _937;
    float _1103 = _1051 * _937;
    float _1105 = _1073 * _937;
    float _1107 = fma(_1017, _929, _1099);
    float _1109 = fma(_1043, _929, _1101);
    float _1111 = fma(_1045, _929, _1103);
    float _1113 = _1073 * _969;
    float _1115 = _1039 * _969;
    float _1117 = fma(_1081, _929, _1105);
    float _1119 = _1049 * _969;
    float _1121 = _1051 * _969;
    float _1123 = fma(_1081, _961, _1113);
    int _1125 = _775 * 48;
    float _1127 = fma(_1017, _961, _1115);
    float _1129 = fma(_1043, _961, _1119);
    float _1131 = fma(_1045, _961, _1121);
    float _1133 = fma(_1079, _997, _1097);
    float _1135 = fma(_1075, _997, _1093);
    float _1137 = fma(_1041, _997, _1091);
    float _1139 = fma(_1077, _997, _1095);
    float _1141 = _1133 + _1005;
    float _1143 = fma(_1079, _1029, _1117);
    float _1145 = fma(_1041, _1029, _1107);
    float _1147 = fma(_1075, _1029, _1109);
    float _1149 = fma(_1077, _1029, _1111);
    int _1151 = _1125 + 16;
    float _1153 = _1143 + _1037;
    float _1155 = fma(_1079, _1061, _1123);
    float _1157 = fma(_1041, _1061, _1127);
    int _1159 = _1125 + 32;
    float _1161 = fma(_1075, _1061, _1129);
    float _1163 = fma(_1077, _1061, _1131);
    float _1165 = _1155 + _1069;
    int _1167 = _1125 + 48;
    uint _1169 = uint(int(uint(_1151) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1169)] = as_type<uint>(_1137);
    int _1171 = _1151 + 4;
    uint _1173 = uint(int(uint(_1171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1173)] = as_type<uint>(_1135);
    int _1175 = _1151 + 8;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1177)] = as_type<uint>(_1139);
    int _1179 = _1151 + 12;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = as_type<uint>(_1141);
    uint _1183 = uint(int(uint(_1159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1183)] = as_type<uint>(_1145);
    int _1185 = _1159 + 4;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1187)] = as_type<uint>(_1147);
    int _1189 = _1159 + 8;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1191)] = as_type<uint>(_1149);
    int _1193 = _1159 + 12;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1195)] = as_type<uint>(_1153);
    uint _1197 = uint(int(uint(_1167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1197)] = as_type<uint>(_1157);
    int _1199 = _1167 + 4;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1201)] = as_type<uint>(_1161);
    int _1203 = _1167 + 8;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1205)] = as_type<uint>(_1163);
    int _1207 = _1167 + 12;
    uint _1209 = uint(int(uint(_1207) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1209)] = as_type<uint>(_1165);
}

