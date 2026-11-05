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
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3207, thread const int& _3208, constant _10& support_buffer)
{
    int _3211 = 1 + _3208;
    float _3213 = support_buffer._m5[_3211].x;
    bool _3215 = _3213 == 1.0;
    if (_3215)
    {
        return _3207;
    }
    float _3217 = float(_3207);
    float _3219 = _3217 * _3213;
    int _3221 = int(_3219);
    return _3221;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3243, thread const int& _3244, thread const int& _3245, thread int& _3246, thread uint& gl_SubgroupInvocationID)
{
    int _3249 = _3245 & 31;
    uint _3251 = uint(int(uint(_3245) >> uint(8)));
    int _3253 = int(_3251) & 31;
    float _3255 = as_type<float>(gl_SubgroupInvocationID);
    int _3257 = as_type<int>(_3255) & _3253;
    int _3259 = ~_3253;
    int _3261 = _3249 & _3259;
    int _3263 = _3261 | _3257;
    int _3265 = ~_3253;
    int _3267 = _3244 & _3265;
    int _3269 = _3267 | _3257;
    bool _3271 = uint(_3269) <= uint(_3263);
    _3246 = _3271 ? (-1) : 0;
    float _3273 = spvSubgroupShuffle(as_type<float>(_3243), uint(_3269));
    uint _3275 = uint(_3271 ? as_type<int>(_3273) : _3243);
    return int(_3275);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _815 = false;
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
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    int _85 = _74 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _56(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_83);
    int _103 = 0;
    int _105 = _56(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1392 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1392.xy), uint(_1392.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _56(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _56(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1410 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1410.xy), uint(_1410.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 1;
    int _141 = _56(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_93);
    int _145 = 1;
    int _147 = _56(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1428 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1428.xy), uint(_1428.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 0;
    int _161 = _56(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_83);
    int _165 = 0;
    int _167 = _56(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1446 = int3(_161, _167, 0);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1446.xy), uint(_1446.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    int _177 = _68;
    int _179 = 1;
    int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
    int _183 = as_type<int>(_93);
    int _185 = 1;
    int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
    int3 _1464 = int3(_181, _187, 2);
    float3 _189 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1464.xy), uint(_1464.z), 0).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    int _197 = _68;
    int _199 = 0;
    int _201 = _56(_197, _199, (*spvDescriptorSet0.support_buffer));
    int _203 = as_type<int>(_83);
    int _205 = 0;
    int _207 = _56(_203, _205, (*spvDescriptorSet0.support_buffer));
    int3 _1482 = int3(_201, _207, 2);
    float3 _209 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1482.xy), uint(_1482.z), 0).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    bool _217 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _219 = _74 + 28;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    uint _223 = uint(int(uint(int(_221)) >> uint(2)));
    int _225 = int(_221) & 3;
    float _227 = (*spvDescriptorSet0.cp_c5)._m0[int(_223)][_225];
    float _229 = _111 * 0.15915493667125701904296875;
    float _231 = _113 * 0.15915493667125701904296875;
    float _233 = _115 * 0.15915493667125701904296875;
    float _235 = _229 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = _133 * 0.15915493667125701904296875;
    float _241 = _135 * 0.15915493667125701904296875;
    float _243 = _131 * 0.15915493667125701904296875;
    int _245 = _74 + 20;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    uint _249 = uint(int(uint(int(_247)) >> uint(2)));
    int _251 = int(_247) & 3;
    float _253 = (*spvDescriptorSet0.cp_c5)._m0[int(_249)][_251];
    float _255 = _231 * 6.283185482025146484375;
    float _257 = cos(_255);
    float _259 = _155 * _227;
    float _261 = _233 * 6.283185482025146484375;
    float _263 = sin(_261);
    float _265 = _233 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = _237 * _257;
    float _271 = _229 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _231 * 6.283185482025146484375;
    float _277 = sin(_275);
    float _279 = _237 * _267;
    float _281 = _263 * _237;
    float _283 = _257 * _267;
    float _285 = _239 * 6.283185482025146484375;
    float _287 = sin(_285);
    float _289 = _273 * _257;
    float _291 = _273 * _263;
    float _293 = _241 * 6.283185482025146484375;
    float _295 = sin(_293);
    float _297 = _273 * _277;
    float _299 = fma(_277, _279, _291);
    float _301 = _243 * 6.283185482025146484375;
    float _303 = cos(_301);
    float _305 = _243 * 6.283185482025146484375;
    float _307 = sin(_305);
    float _309 = _241 * 6.283185482025146484375;
    float _311 = cos(_309);
    float _313 = _239 * 6.283185482025146484375;
    float _315 = cos(_313);
    float _317 = -_281;
    float _319 = fma(_267, _297, _317);
    float _321 = fma(_263, _297, _279);
    float _323 = _307 * _295;
    float _325 = _263 * _257;
    float _327 = _273 * _267;
    float _329 = _295 * _303;
    float _331 = _303 * _311;
    float _333 = _307 * _311;
    float _335 = -_327;
    float _337 = fma(_277, _281, _335);
    float _339 = _307 * _287;
    float _341 = _295 * _315;
    float _343 = _307 * _315;
    float _345 = _303 * _315;
    float _347 = -_329;
    float _349 = fma(_311, _339, _347);
    float _351 = fma(_295, _339, _331);
    float _353 = fma(_287, _331, _323);
    float _355 = _315 * _311;
    float _357 = _341 * _227;
    float _359 = _277 * _253;
    float _361 = -_333;
    float _363 = fma(_287, _329, _361);
    float _365 = _355 * _227;
    float _367 = fma(_325, _253, _357);
    float _369 = -_287;
    float _371 = -_359;
    float _373 = fma(_369, _227, _371);
    float _375 = _351 * _227;
    float _377 = _363 * _227;
    float _379 = fma(_283, _253, _365);
    float _381 = _367 * _367;
    float _383 = _349 * _227;
    float _385 = _353 * _227;
    float _387 = fma(_321, _253, _375);
    float _389 = fma(_337, _253, _377);
    float _391 = fma(_379, _379, _381);
    float _393 = _343 * _227;
    float _395 = fma(_319, _253, _383);
    float _397 = fma(_299, _253, _385);
    float _399 = _387 * _387;
    float _401 = _345 * _227;
    float _403 = _389 * _389;
    float _405 = fma(_373, _373, _391);
    float _407 = fma(_289, _253, _393);
    float _409 = fma(_395, _395, _399);
    float _411 = fma(_269, _253, _401);
    float _413 = fma(_397, _397, _403);
    float _415 = _151 * _227;
    float _417 = rsqrt(_405);
    float _419 = fma(_407, _407, _409);
    float _421 = fma(_411, _411, _413);
    float _423 = fma(_171, _253, _415);
    float _425 = _153 * _227;
    float _427 = fma(_175, _253, _259);
    float _429 = rsqrt(_419);
    float _431 = fma(_173, _253, _425);
    float _433 = rsqrt(_421);
    float _435 = _423 * _417;
    float _437 = _367 * _435;
    float _439 = _191 * _227;
    float _441 = _193 * _227;
    float _443 = _431 * _429;
    float _445 = _195 * _227;
    float _447 = _373 * _435;
    float _449 = fma(_211, _253, _439);
    float _451 = fma(_213, _253, _441);
    float _453 = _379 * _435;
    float _455 = _395 * _443;
    float _457 = _387 * _443;
    float _459 = _427 * _433;
    float _461 = _407 * _443;
    float _463 = fma(_215, _253, _445);
    int _465 = _68 * 112;
    float _467 = _397 * _459;
    float _469 = _389 * _459;
    float _471 = _411 * _459;
    bool _473 = !_217;
    float _475 = _437;
    float _477 = _457;
    float _479 = _447;
    float _481 = _461;
    float _483 = _471;
    float _485 = _463;
    float _803;
    float _805;
    float _807;
    float _809;
    float _811;
    float _813;
    if (!_473)
    {
        int _487 = 0;
        float _489 = _453;
        float _491 = _455;
        float _493 = _467;
        float _495 = _449;
        float _497 = _437;
        float _499 = _457;
        float _501 = _469;
        float _503 = _451;
        float _505 = _447;
        float _507 = _461;
        float _509 = _471;
        float _511 = _463;
        bool _513;
        int _561;
        int _571;
        int _581;
        int _591;
        int _601;
        int _611;
        int _621;
        int _631;
        int _641;
        int _651;
        int _661;
        int _671;
        float _779;
        float _781;
        float _783;
        int _785;
        float _787;
        int _789;
        int _791;
        int _793;
        int _795;
        float _797;
        float _799;
        float _801;
        do
        {
            int _515 = _487;
            float _517 = _489;
            float _519 = _491;
            float _521 = _493;
            int _523 = as_type<int>(_495);
            float _525 = _497;
            int _527 = as_type<int>(_499);
            int _529 = as_type<int>(_501);
            int _531 = as_type<int>(_503);
            int _533 = as_type<int>(_505);
            float _535 = _507;
            float _537 = _509;
            float _539 = _511;
            uint _541 = uint(int(uint(_465) >> uint(2)));
            uint _543 = uint(int(uint(int(_541)) >> uint(2)));
            int _545 = int(_541) & 3;
            float _547 = (*spvDescriptorSet0.cp_c6)._m0[int(_543)][_545];
            bool _549 = _68 != 0;
            int _551 = _515 + 1;
            bool _553 = uint(_551) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _555 = as_type<int>(_517);
            int _557 = as_type<int>(_547);
            int _559 = 31;
            int _1949 = _58(_555, _557, _559, _561, gl_SubgroupInvocationID);
            int _563 = _1949;
            int _565 = as_type<int>(_519);
            int _567 = as_type<int>(_547);
            int _569 = 31;
            int _1954 = _58(_565, _567, _569, _571, gl_SubgroupInvocationID);
            int _573 = _1954;
            int _575 = as_type<int>(_521);
            int _577 = as_type<int>(_547);
            int _579 = 31;
            int _1959 = _58(_575, _577, _579, _581, gl_SubgroupInvocationID);
            int _583 = _1959;
            int _585 = _523;
            int _587 = as_type<int>(_547);
            int _589 = 31;
            int _1963 = _58(_585, _587, _589, _591, gl_SubgroupInvocationID);
            int _593 = _1963;
            int _595 = as_type<int>(_525);
            int _597 = as_type<int>(_547);
            int _599 = 31;
            int _1968 = _58(_595, _597, _599, _601, gl_SubgroupInvocationID);
            int _603 = _1968;
            int _605 = _527;
            int _607 = as_type<int>(_547);
            int _609 = 31;
            int _1972 = _58(_605, _607, _609, _611, gl_SubgroupInvocationID);
            int _613 = _1972;
            int _615 = _529;
            int _617 = as_type<int>(_547);
            int _619 = 31;
            int _1976 = _58(_615, _617, _619, _621, gl_SubgroupInvocationID);
            int _623 = _1976;
            int _625 = _531;
            int _627 = as_type<int>(_547);
            int _629 = 31;
            int _1980 = _58(_625, _627, _629, _631, gl_SubgroupInvocationID);
            int _633 = _1980;
            int _635 = _533;
            int _637 = as_type<int>(_547);
            int _639 = 31;
            int _1984 = _58(_635, _637, _639, _641, gl_SubgroupInvocationID);
            int _643 = _1984;
            int _645 = as_type<int>(_535);
            int _647 = as_type<int>(_547);
            int _649 = 31;
            int _1989 = _58(_645, _647, _649, _651, gl_SubgroupInvocationID);
            int _653 = _1989;
            int _655 = as_type<int>(_537);
            int _657 = as_type<int>(_547);
            int _659 = 31;
            int _1994 = _58(_655, _657, _659, _661, gl_SubgroupInvocationID);
            int _663 = _1994;
            int _665 = as_type<int>(_539);
            int _667 = as_type<int>(_547);
            int _669 = 31;
            int _1999 = _58(_665, _667, _669, _671, gl_SubgroupInvocationID);
            int _673 = _1999;
            bool _675 = !_549;
            _487 = _551;
            float _677 = _517;
            float _679 = _519;
            float _681 = _521;
            int _683 = _523;
            float _685 = _525;
            int _687 = _527;
            int _689 = _529;
            int _691 = _531;
            int _693 = _533;
            float _695 = _535;
            float _697 = _537;
            float _699 = _539;
            if (!_675)
            {
                float _701 = _451 * as_type<float>(_573);
                float _703 = _437 * as_type<float>(_573);
                float _705 = _457 * as_type<float>(_573);
                float _707 = _469 * as_type<float>(_573);
                float _709 = fma(_449, as_type<float>(_563), _701);
                float _711 = _437 * as_type<float>(_613);
                float _713 = _457 * as_type<float>(_613);
                float _715 = _469 * as_type<float>(_613);
                float _717 = fma(_453, as_type<float>(_563), _703);
                float _719 = fma(_455, as_type<float>(_563), _705);
                float _721 = fma(_467, as_type<float>(_563), _707);
                float _723 = _451 * as_type<float>(_613);
                float _725 = _451 * as_type<float>(_653);
                float _727 = fma(_453, as_type<float>(_603), _711);
                float _729 = fma(_455, as_type<float>(_603), _713);
                float _731 = fma(_467, as_type<float>(_603), _715);
                float _733 = _437 * as_type<float>(_653);
                float _735 = _457 * as_type<float>(_653);
                float _737 = _469 * as_type<float>(_653);
                float _739 = fma(_449, as_type<float>(_603), _723);
                float _741 = fma(_449, as_type<float>(_643), _725);
                float _743 = fma(_453, as_type<float>(_643), _733);
                float _745 = fma(_455, as_type<float>(_643), _735);
                float _747 = fma(_467, as_type<float>(_643), _737);
                float _749 = fma(_447, as_type<float>(_583), _717);
                float _751 = fma(_461, as_type<float>(_583), _719);
                float _753 = fma(_471, as_type<float>(_583), _721);
                float _755 = fma(_447, as_type<float>(_623), _727);
                float _757 = fma(_463, as_type<float>(_583), _709);
                float _759 = fma(_463, as_type<float>(_623), _739);
                float _761 = fma(_463, as_type<float>(_663), _741);
                float _763 = fma(_461, as_type<float>(_623), _729);
                float _765 = fma(_471, as_type<float>(_623), _731);
                float _767 = fma(_447, as_type<float>(_663), _743);
                float _769 = fma(_461, as_type<float>(_663), _745);
                float _771 = fma(_471, as_type<float>(_663), _747);
                float _773 = as_type<float>(_593) + _757;
                float _775 = as_type<float>(_633) + _759;
                float _777 = as_type<float>(_673) + _761;
                _677 = _749;
                _679 = _751;
                _681 = _753;
                _683 = as_type<int>(_773);
                _685 = _755;
                _687 = as_type<int>(_763);
                _689 = as_type<int>(_765);
                _691 = as_type<int>(_775);
                _693 = as_type<int>(_767);
                _695 = _769;
                _697 = _771;
                _699 = _777;
            }
            _779 = _677;
            _781 = _679;
            _783 = _681;
            _785 = _683;
            _787 = _685;
            _789 = _687;
            _791 = _689;
            _793 = _691;
            _795 = _693;
            _797 = _695;
            _799 = _697;
            _801 = _699;
            _513 = !_553;
            _489 = _779;
            _491 = _781;
            _493 = _783;
            _495 = as_type<float>(_785);
            _497 = _787;
            _499 = as_type<float>(_789);
            _501 = as_type<float>(_791);
            _503 = as_type<float>(_793);
            _505 = as_type<float>(_795);
            _507 = _797;
            _509 = _799;
            _511 = _801;
        } while (_513);
        _803 = _779;
        _805 = _781;
        _807 = _783;
        _809 = as_type<float>(_785);
        _475 = _787;
        _477 = as_type<float>(_789);
        _811 = as_type<float>(_791);
        _813 = as_type<float>(_793);
        _479 = as_type<float>(_795);
        _481 = _797;
        _483 = _799;
        _485 = _801;
        _815 = true;
    }
    else
    {
        _803 = _453;
        _805 = _455;
        _807 = _467;
        _809 = _449;
        _811 = _469;
        _813 = _451;
    }
    _815 = false;
    float _817 = _803;
    float _819 = _805;
    float _821 = _807;
    float _823 = _809;
    float _825 = _475;
    float _827 = _477;
    float _829 = _811;
    float _831 = _813;
    float _833 = _479;
    float _835 = _481;
    float _837 = _483;
    float _839 = _485;
    int _841 = _465 + 80;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.cp_c6)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.cp_c6)._m0[int(_853)][_855];
    bool _859 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _861 = _465 + 64;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.cp_c6)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.cp_c6)._m0[int(_873)][_875];
    int _879 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _881 = _879 + _68;
    int _883 = _465 + 88;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.cp_c6)._m0[int(_887)][_889];
    int _893 = int(_885) + 1;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    int _897 = _893 & 3;
    float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
    int _901 = _465 + 72;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    uint _905 = uint(int(uint(int(_903)) >> uint(2)));
    int _907 = int(_903) & 3;
    float _909 = (*spvDescriptorSet0.cp_c6)._m0[int(_905)][_907];
    int _911 = int(_903) + 1;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    int _915 = _911 & 3;
    float _917 = (*spvDescriptorSet0.cp_c6)._m0[int(_913)][_915];
    int _919 = _465 + 96;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    uint _923 = uint(int(uint(int(_921)) >> uint(2)));
    int _925 = int(_921) & 3;
    float _927 = (*spvDescriptorSet0.cp_c6)._m0[int(_923)][_925];
    int _929 = int(_921) + 1;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    int _933 = _929 & 3;
    float _935 = (*spvDescriptorSet0.cp_c6)._m0[int(_931)][_933];
    int _937 = _465 + 104;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.cp_c6)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.cp_c6)._m0[int(_949)][_951];
    int _955 = _465 + 16;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.cp_c6)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.cp_c6)._m0[int(_967)][_969];
    if (!_859)
    {
        int _973 = _68 * 48;
        int _975 = _973 + 16;
        uint _977 = uint(int(uint(_973) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_977)] = as_type<uint>(_817);
        int _979 = _973 + 4;
        uint _981 = uint(int(uint(_979) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_981)] = as_type<uint>(_819);
        int _983 = _973 + 8;
        uint _985 = uint(int(uint(_983) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_985)] = as_type<uint>(_821);
        int _987 = _973 + 12;
        uint _989 = uint(int(uint(_987) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_989)] = as_type<uint>(_823);
        int _991 = _973 + 32;
        uint _993 = uint(int(uint(_975) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_993)] = as_type<uint>(_825);
        int _995 = _975 + 4;
        uint _997 = uint(int(uint(_995) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_997)] = as_type<uint>(_827);
        int _999 = _975 + 8;
        uint _1001 = uint(int(uint(_999) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1001)] = as_type<uint>(_829);
        int _1003 = _975 + 12;
        uint _1005 = uint(int(uint(_1003) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1005)] = as_type<uint>(_831);
        uint _1007 = uint(int(uint(_991) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1007)] = as_type<uint>(_833);
        int _1009 = _991 + 4;
        uint _1011 = uint(int(uint(_1009) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1011)] = as_type<uint>(_835);
        int _1013 = _991 + 8;
        uint _1015 = uint(int(uint(_1013) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1015)] = as_type<uint>(_837);
        int _1017 = _991 + 12;
        uint _1019 = uint(int(uint(_1017) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1019)] = as_type<uint>(_839);
    }
    float _1021 = _835 * _849;
    float _1023 = _819 * _849;
    float _1025 = _827 * _849;
    int _1027 = _465 + 32;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    uint _1031 = uint(int(uint(int(_1029)) >> uint(2)));
    int _1033 = int(_1029) & 3;
    float _1035 = (*spvDescriptorSet0.cp_c6)._m0[int(_1031)][_1033];
    int _1037 = int(_1029) + 1;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    int _1041 = _1037 & 3;
    float _1043 = (*spvDescriptorSet0.cp_c6)._m0[int(_1039)][_1041];
    float _1045 = fma(_833, _869, _1021);
    float _1047 = _819 * _857;
    float _1049 = fma(_817, _869, _1023);
    float _1051 = fma(_825, _869, _1025);
    float _1053 = _827 * _857;
    float _1055 = fma(_817, _877, _1047);
    float _1057 = _819 * _891;
    float _1059 = _819 * _899;
    float _1061 = _835 * _857;
    int _1063 = _465 + 48;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
    int _1073 = int(_1065) + 1;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    int _1077 = _1073 & 3;
    float _1079 = (*spvDescriptorSet0.cp_c6)._m0[int(_1075)][_1077];
    float _1081 = _827 * _891;
    float _1083 = _827 * _899;
    float _1085 = fma(_825, _877, _1053);
    float _1087 = fma(_833, _877, _1061);
    float _1089 = _835 * _891;
    float _1091 = _835 * _899;
    float _1093 = fma(_817, _909, _1057);
    float _1095 = fma(_817, _917, _1059);
    float _1097 = fma(_825, _909, _1081);
    int _1099 = _465 + 24;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    uint _1103 = uint(int(uint(int(_1101)) >> uint(2)));
    int _1105 = int(_1101) & 3;
    float _1107 = (*spvDescriptorSet0.cp_c6)._m0[int(_1103)][_1105];
    int _1109 = int(_1101) + 1;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    int _1113 = _1109 & 3;
    float _1115 = (*spvDescriptorSet0.cp_c6)._m0[int(_1111)][_1113];
    float _1117 = fma(_825, _917, _1083);
    float _1119 = fma(_833, _917, _1091);
    float _1121 = fma(_833, _909, _1089);
    float _1123 = fma(_821, _927, _1049);
    float _1125 = fma(_829, _953, _1117);
    float _1127 = fma(_829, _927, _1051);
    float _1129 = fma(_837, _927, _1045);
    int _1131 = _465 + 40;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    uint _1135 = uint(int(uint(int(_1133)) >> uint(2)));
    int _1137 = int(_1133) & 3;
    float _1139 = (*spvDescriptorSet0.cp_c6)._m0[int(_1135)][_1137];
    int _1141 = int(_1133) + 1;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    int _1145 = _1141 & 3;
    float _1147 = (*spvDescriptorSet0.cp_c6)._m0[int(_1143)][_1145];
    float _1149 = fma(_821, _935, _1055);
    float _1151 = fma(_821, _945, _1093);
    float _1153 = fma(_821, _953, _1095);
    float _1155 = fma(_829, _935, _1085);
    float _1157 = fma(_829, _945, _1097);
    float _1159 = fma(_837, _953, _1119);
    float _1161 = _1125 + _831;
    int _1163 = _465 + 56;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.cp_c6)._m0[int(_1167)][_1169];
    int _1173 = int(_1165) + 1;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    int _1177 = _1173 & 3;
    float _1179 = (*spvDescriptorSet0.cp_c6)._m0[int(_1175)][_1177];
    float _1181 = fma(_837, _935, _1087);
    float _1183 = fma(_837, _945, _1121);
    float _1185 = _1159 + _839;
    float _1187 = _1153 + _823;
    float _1189 = _1127 * _971;
    float _1191 = _1155 * _971;
    float _1193 = _1157 * _971;
    float _1195 = _1161 * _971;
    float _1197 = fma(_1123, _963, _1189);
    float _1199 = fma(_1149, _963, _1191);
    float _1201 = fma(_1151, _963, _1193);
    float _1203 = fma(_1187, _963, _1195);
    float _1205 = _1161 * _1043;
    float _1207 = _1127 * _1043;
    float _1209 = _1155 * _1043;
    float _1211 = _1157 * _1043;
    float _1213 = fma(_1187, _1035, _1205);
    float _1215 = fma(_1123, _1035, _1207);
    float _1217 = fma(_1149, _1035, _1209);
    float _1219 = fma(_1151, _1035, _1211);
    int _1221 = _881 * 48;
    float _1223 = _1161 * _1079;
    float _1225 = _1127 * _1079;
    float _1227 = _1155 * _1079;
    float _1229 = _1157 * _1079;
    float _1231 = fma(_1187, _1071, _1223);
    float _1233 = fma(_1123, _1071, _1225);
    float _1235 = fma(_1149, _1071, _1227);
    float _1237 = fma(_1151, _1071, _1229);
    float _1239 = fma(_1185, _1107, _1203);
    float _1241 = fma(_1181, _1107, _1199);
    float _1243 = fma(_1129, _1107, _1197);
    float _1245 = fma(_1183, _1107, _1201);
    float _1247 = _1239 + _1115;
    float _1249 = fma(_1185, _1139, _1213);
    float _1251 = fma(_1129, _1139, _1215);
    float _1253 = fma(_1181, _1139, _1217);
    float _1255 = fma(_1183, _1139, _1219);
    float _1257 = _1249 + _1147;
    int _1259 = _1221 + 16;
    int _1261 = _1221 + 32;
    float _1263 = fma(_1185, _1171, _1231);
    float _1265 = fma(_1129, _1171, _1233);
    float _1267 = fma(_1181, _1171, _1235);
    float _1269 = fma(_1183, _1171, _1237);
    float _1271 = _1263 + _1179;
    int _1273 = _1221 + 48;
    uint _1275 = uint(int(uint(_1259) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1275)] = as_type<uint>(_1243);
    int _1277 = _1259 + 4;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1279)] = as_type<uint>(_1241);
    int _1281 = _1259 + 8;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1283)] = as_type<uint>(_1245);
    int _1285 = _1259 + 12;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1287)] = as_type<uint>(_1247);
    uint _1289 = uint(int(uint(_1261) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1289)] = as_type<uint>(_1251);
    int _1291 = _1261 + 4;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1293)] = as_type<uint>(_1253);
    int _1295 = _1261 + 8;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1297)] = as_type<uint>(_1255);
    int _1299 = _1261 + 12;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1301)] = as_type<uint>(_1257);
    uint _1303 = uint(int(uint(_1273) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1303)] = as_type<uint>(_1265);
    int _1305 = _1273 + 4;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1307)] = as_type<uint>(_1267);
    int _1309 = _1273 + 8;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1311)] = as_type<uint>(_1269);
    int _1313 = _1273 + 12;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1315)] = as_type<uint>(_1271);
}

