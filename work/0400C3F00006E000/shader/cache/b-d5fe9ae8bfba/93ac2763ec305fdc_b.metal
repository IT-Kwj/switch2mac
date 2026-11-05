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
int _56(thread const int& _3228, thread const int& _3229, constant _10& support_buffer)
{
    int _3232 = 1 + _3229;
    float _3234 = support_buffer._m5[_3232].x;
    bool _3236 = _3234 == 1.0;
    if (_3236)
    {
        return _3228;
    }
    float _3238 = float(_3228);
    float _3240 = _3238 * _3234;
    int _3242 = int(_3240);
    return _3242;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3264, thread const int& _3265, thread const int& _3266, thread int& _3267, thread uint& gl_SubgroupInvocationID)
{
    int _3270 = _3266 & 31;
    uint _3272 = uint(int(uint(_3266) >> uint(8)));
    int _3274 = int(_3272) & 31;
    float _3276 = as_type<float>(gl_SubgroupInvocationID);
    int _3278 = as_type<int>(_3276) & _3274;
    int _3280 = ~_3274;
    int _3282 = _3270 & _3280;
    int _3284 = _3282 | _3278;
    int _3286 = ~_3274;
    int _3288 = _3265 & _3286;
    int _3290 = _3288 | _3278;
    bool _3292 = uint(_3290) <= uint(_3284);
    _3267 = _3292 ? (-1) : 0;
    float _3294 = spvSubgroupShuffle(as_type<float>(_3264), uint(_3290));
    uint _3296 = uint(_3292 ? as_type<int>(_3294) : _3264);
    return int(_3296);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _865 = false;
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
    int _219 = _74 + 20;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    uint _223 = uint(int(uint(int(_221)) >> uint(2)));
    int _225 = int(_221) & 3;
    float _227 = (*spvDescriptorSet0.cp_c5)._m0[int(_223)][_225];
    float _229 = _111 * 0.15915493667125701904296875;
    float _231 = _113 * 0.15915493667125701904296875;
    float _233 = _115 * 0.15915493667125701904296875;
    float _235 = _229 * 6.283185482025146484375;
    float _237 = cos(_235);
    int _239 = _74 + 28;
    uint _241 = uint(int(uint(_239) >> uint(2)));
    uint _243 = uint(int(uint(int(_241)) >> uint(2)));
    int _245 = int(_241) & 3;
    float _247 = (*spvDescriptorSet0.cp_c5)._m0[int(_243)][_245];
    float _249 = _133 * 0.15915493667125701904296875;
    float _251 = _135 * 0.15915493667125701904296875;
    float _253 = _131 * 0.15915493667125701904296875;
    float _255 = _231 * 6.283185482025146484375;
    float _257 = cos(_255);
    float _259 = _233 * 6.283185482025146484375;
    float _261 = sin(_259);
    float _263 = _233 * 6.283185482025146484375;
    float _265 = cos(_263);
    float _267 = _229 * 6.283185482025146484375;
    float _269 = sin(_267);
    float _271 = _231 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _237 * _265;
    float _277 = _261 * _237;
    float _279 = _257 * _265;
    float _281 = _249 * 6.283185482025146484375;
    float _283 = sin(_281);
    float _285 = _251 * 6.283185482025146484375;
    float _287 = sin(_285);
    float _289 = _251 * 6.283185482025146484375;
    float _291 = cos(_289);
    float _293 = _253 * 6.283185482025146484375;
    float _295 = cos(_293);
    float _297 = _269 * _273;
    float _299 = _261 * _257;
    float _301 = _269 * _265;
    float _303 = -_277;
    float _305 = fma(_265, _297, _303);
    float _307 = -_301;
    float _309 = fma(_273, _277, _307);
    float _311 = _253 * 6.283185482025146484375;
    float _313 = sin(_311);
    float _315 = _249 * 6.283185482025146484375;
    float _317 = cos(_315);
    float _319 = _295 * _291;
    float _321 = _313 * _291;
    float _323 = _237 * _257;
    float _325 = _269 * _261;
    float _327 = _269 * _257;
    float _329 = fma(_261, _297, _275);
    float _331 = _287 * _295;
    float _333 = fma(_273, _275, _325);
    float _335 = _313 * _283;
    float _337 = _295 * _317;
    float _339 = _287 * _317;
    float _341 = _317 * _291;
    float _343 = _313 * _317;
    float _345 = _313 * _287;
    float _347 = -_331;
    float _349 = fma(_291, _335, _347);
    float _351 = _273 * _227;
    float _353 = -_321;
    float _355 = fma(_283, _331, _353);
    float _357 = fma(_287, _335, _319);
    float _359 = _341 * _247;
    float _361 = _339 * _247;
    float _363 = _343 * _247;
    float _365 = fma(_283, _319, _345);
    float _367 = -_283;
    float _369 = -_351;
    float _371 = fma(_367, _247, _369);
    float _373 = fma(_279, _227, _359);
    float _375 = fma(_299, _227, _361);
    float _377 = fma(_327, _227, _363);
    float _379 = _357 * _247;
    float _381 = _349 * _247;
    float _383 = _375 * _375;
    float _385 = _151 * _247;
    float _387 = fma(_329, _227, _379);
    float _389 = _355 * _247;
    float _391 = fma(_305, _227, _381);
    float _393 = fma(_373, _373, _383);
    float _395 = _365 * _247;
    float _397 = _387 * _387;
    float _399 = fma(_309, _227, _389);
    float _401 = fma(_371, _371, _393);
    float _403 = fma(_333, _227, _395);
    float _405 = fma(_391, _391, _397);
    float _407 = _337 * _247;
    float _409 = _399 * _399;
    float _411 = _153 * _247;
    float _413 = fma(_377, _377, _405);
    float _415 = fma(_323, _227, _407);
    float _417 = fma(_403, _403, _409);
    float _419 = rsqrt(_401);
    float _421 = _155 * _247;
    float _423 = fma(_415, _415, _417);
    float _425 = fma(_171, _227, _385);
    bool _427 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _429 = fma(_173, _227, _411);
    float _431 = fma(_175, _227, _421);
    float _433 = rsqrt(_413);
    float _435 = _191 * _247;
    float _437 = fma(_211, _227, _435);
    float _439 = rsqrt(_423);
    float _441 = _425 * _419;
    float _443 = _373 * _441;
    float _445 = _371 * _441;
    float _447 = _429 * _433;
    float _449 = _375 * _441;
    float _451 = _193 * _247;
    float _453 = _391 * _447;
    float _455 = _387 * _447;
    float _457 = fma(_213, _227, _451);
    float _459 = _431 * _439;
    float _461 = _377 * _447;
    float _463 = _195 * _247;
    float _465 = _403 * _459;
    float _467 = _399 * _459;
    float _469 = _415 * _459;
    float _471 = fma(_215, _227, _463);
    if (!_427)
    {
        int _473 = _68 * 48;
        int _475 = _473 + 16;
        uint _477 = uint(int(uint(_473) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_477)] = as_type<uint>(_443);
        int _479 = _473 + 4;
        uint _481 = uint(int(uint(_479) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_481)] = as_type<uint>(_453);
        int _483 = _473 + 8;
        uint _485 = uint(int(uint(_483) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_485)] = as_type<uint>(_465);
        int _487 = _473 + 12;
        uint _489 = uint(int(uint(_487) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_489)] = as_type<uint>(_437);
        int _491 = _473 + 32;
        uint _493 = uint(int(uint(_475) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_493)] = as_type<uint>(_449);
        int _495 = _475 + 4;
        uint _497 = uint(int(uint(_495) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_497)] = as_type<uint>(_455);
        int _499 = _475 + 8;
        uint _501 = uint(int(uint(_499) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_501)] = as_type<uint>(_467);
        int _503 = _475 + 12;
        uint _505 = uint(int(uint(_503) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_505)] = as_type<uint>(_457);
        uint _507 = uint(int(uint(_491) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_507)] = as_type<uint>(_445);
        int _509 = _491 + 4;
        uint _511 = uint(int(uint(_509) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_511)] = as_type<uint>(_461);
        int _513 = _491 + 8;
        uint _515 = uint(int(uint(_513) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_515)] = as_type<uint>(_469);
        int _517 = _491 + 12;
        uint _519 = uint(int(uint(_517) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_519)] = as_type<uint>(_471);
    }
    int _521 = _68 * 112;
    bool _523 = !_217;
    float _841;
    float _843;
    float _845;
    float _847;
    float _849;
    float _851;
    float _853;
    float _855;
    float _857;
    float _859;
    float _861;
    float _863;
    if (!_523)
    {
        int _525 = 0;
        float _527 = _443;
        float _529 = _453;
        float _531 = _465;
        float _533 = _437;
        float _535 = _449;
        float _537 = _455;
        float _539 = _467;
        float _541 = _457;
        float _543 = _445;
        float _545 = _461;
        float _547 = _469;
        float _549 = _471;
        bool _551;
        int _599;
        int _609;
        int _619;
        int _629;
        int _639;
        int _649;
        int _659;
        int _669;
        int _679;
        int _689;
        int _699;
        int _709;
        int _817;
        int _821;
        int _823;
        int _827;
        int _829;
        int _831;
        int _835;
        int _837;
        int _839;
        do
        {
            int _553 = _525;
            int _555 = as_type<int>(_527);
            int _557 = as_type<int>(_529);
            int _559 = as_type<int>(_531);
            int _561 = as_type<int>(_533);
            int _563 = as_type<int>(_535);
            int _565 = as_type<int>(_537);
            int _567 = as_type<int>(_539);
            int _569 = as_type<int>(_541);
            int _571 = as_type<int>(_543);
            int _573 = as_type<int>(_545);
            int _575 = as_type<int>(_547);
            int _577 = as_type<int>(_549);
            uint _579 = uint(int(uint(_521) >> uint(2)));
            uint _581 = uint(int(uint(int(_579)) >> uint(2)));
            int _583 = int(_579) & 3;
            float _585 = (*spvDescriptorSet0.cp_c6)._m0[int(_581)][_583];
            bool _587 = _68 != 0;
            int _589 = _553 + 1;
            bool _591 = uint(_589) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _593 = _555;
            int _595 = as_type<int>(_585);
            int _597 = 31;
            int _2085 = _58(_593, _595, _597, _599, gl_SubgroupInvocationID);
            int _601 = _2085;
            int _603 = _557;
            int _605 = as_type<int>(_585);
            int _607 = 31;
            int _2089 = _58(_603, _605, _607, _609, gl_SubgroupInvocationID);
            int _611 = _2089;
            int _613 = _559;
            int _615 = as_type<int>(_585);
            int _617 = 31;
            int _2093 = _58(_613, _615, _617, _619, gl_SubgroupInvocationID);
            int _621 = _2093;
            int _623 = _561;
            int _625 = as_type<int>(_585);
            int _627 = 31;
            int _2097 = _58(_623, _625, _627, _629, gl_SubgroupInvocationID);
            int _631 = _2097;
            int _633 = _563;
            int _635 = as_type<int>(_585);
            int _637 = 31;
            int _2101 = _58(_633, _635, _637, _639, gl_SubgroupInvocationID);
            int _641 = _2101;
            int _643 = _565;
            int _645 = as_type<int>(_585);
            int _647 = 31;
            int _2105 = _58(_643, _645, _647, _649, gl_SubgroupInvocationID);
            int _651 = _2105;
            int _653 = _567;
            int _655 = as_type<int>(_585);
            int _657 = 31;
            int _2109 = _58(_653, _655, _657, _659, gl_SubgroupInvocationID);
            int _661 = _2109;
            int _663 = _569;
            int _665 = as_type<int>(_585);
            int _667 = 31;
            int _2113 = _58(_663, _665, _667, _669, gl_SubgroupInvocationID);
            int _671 = _2113;
            int _673 = _571;
            int _675 = as_type<int>(_585);
            int _677 = 31;
            int _2117 = _58(_673, _675, _677, _679, gl_SubgroupInvocationID);
            int _681 = _2117;
            int _683 = _573;
            int _685 = as_type<int>(_585);
            int _687 = 31;
            int _2121 = _58(_683, _685, _687, _689, gl_SubgroupInvocationID);
            int _691 = _2121;
            int _693 = _575;
            int _695 = as_type<int>(_585);
            int _697 = 31;
            int _2125 = _58(_693, _695, _697, _699, gl_SubgroupInvocationID);
            int _701 = _2125;
            int _703 = _577;
            int _705 = as_type<int>(_585);
            int _707 = 31;
            int _2129 = _58(_703, _705, _707, _709, gl_SubgroupInvocationID);
            int _711 = _2129;
            bool _713 = !_587;
            _525 = _589;
            int _715 = _555;
            int _717 = _557;
            int _719 = _559;
            int _721 = _561;
            int _723 = _563;
            int _725 = _565;
            int _727 = _567;
            int _729 = _569;
            int _731 = _571;
            int _733 = _573;
            int _735 = _575;
            int _737 = _577;
            if (!_713)
            {
                float _739 = _457 * as_type<float>(_651);
                float _741 = _455 * as_type<float>(_651);
                float _743 = _467 * as_type<float>(_651);
                float _745 = _455 * as_type<float>(_611);
                float _747 = _449 * as_type<float>(_611);
                float _749 = _467 * as_type<float>(_611);
                float _751 = _457 * as_type<float>(_611);
                float _753 = fma(_437, as_type<float>(_641), _739);
                float _755 = fma(_453, as_type<float>(_641), _741);
                float _757 = _457 * as_type<float>(_691);
                float _759 = fma(_465, as_type<float>(_641), _743);
                float _761 = _455 * as_type<float>(_691);
                float _763 = fma(_453, as_type<float>(_601), _745);
                float _765 = _449 * as_type<float>(_651);
                float _767 = _449 * as_type<float>(_691);
                float _769 = fma(_443, as_type<float>(_601), _747);
                float _771 = fma(_465, as_type<float>(_601), _749);
                float _773 = fma(_437, as_type<float>(_601), _751);
                float _775 = _467 * as_type<float>(_691);
                float _777 = fma(_437, as_type<float>(_681), _757);
                float _779 = fma(_453, as_type<float>(_681), _761);
                float _781 = fma(_443, as_type<float>(_641), _765);
                float _783 = fma(_443, as_type<float>(_681), _767);
                float _785 = fma(_461, as_type<float>(_621), _763);
                float _787 = fma(_445, as_type<float>(_621), _769);
                float _789 = fma(_469, as_type<float>(_621), _771);
                float _791 = fma(_469, as_type<float>(_661), _759);
                float _793 = fma(_465, as_type<float>(_681), _775);
                float _795 = fma(_471, as_type<float>(_621), _773);
                float _797 = fma(_471, as_type<float>(_661), _753);
                float _799 = fma(_471, as_type<float>(_701), _777);
                float _801 = fma(_445, as_type<float>(_661), _781);
                float _803 = fma(_461, as_type<float>(_661), _755);
                float _805 = fma(_445, as_type<float>(_701), _783);
                float _807 = fma(_461, as_type<float>(_701), _779);
                float _809 = fma(_469, as_type<float>(_701), _793);
                float _811 = as_type<float>(_631) + _795;
                float _813 = as_type<float>(_671) + _797;
                float _815 = as_type<float>(_711) + _799;
                _715 = as_type<int>(_787);
                _717 = as_type<int>(_785);
                _719 = as_type<int>(_789);
                _721 = as_type<int>(_811);
                _723 = as_type<int>(_801);
                _725 = as_type<int>(_803);
                _727 = as_type<int>(_791);
                _729 = as_type<int>(_813);
                _731 = as_type<int>(_805);
                _733 = as_type<int>(_807);
                _735 = as_type<int>(_809);
                _737 = as_type<int>(_815);
            }
            _817 = _715;
            int _819 = _717;
            _821 = _719;
            _823 = _721;
            int _825 = _723;
            _827 = _725;
            _829 = _727;
            _831 = _729;
            int _833 = _731;
            _835 = _733;
            _837 = _735;
            _839 = _737;
            _551 = !_591;
            _527 = as_type<float>(_817);
            _529 = as_type<float>(_819);
            _531 = as_type<float>(_821);
            _533 = as_type<float>(_823);
            _535 = as_type<float>(_825);
            _537 = as_type<float>(_827);
            _539 = as_type<float>(_829);
            _541 = as_type<float>(_831);
            _543 = as_type<float>(_833);
            _545 = as_type<float>(_835);
            _547 = as_type<float>(_837);
            _549 = as_type<float>(_839);
            _841 = as_type<float>(_819);
            _843 = as_type<float>(_825);
            _845 = as_type<float>(_833);
        } while (_551);
        _847 = as_type<float>(_827);
        _849 = as_type<float>(_835);
        _851 = as_type<float>(_817);
        _853 = as_type<float>(_821);
        _855 = as_type<float>(_829);
        _857 = as_type<float>(_837);
        _859 = as_type<float>(_831);
        _861 = as_type<float>(_839);
        _863 = as_type<float>(_823);
        _865 = true;
    }
    else
    {
        _841 = _453;
        _847 = _455;
        _849 = _461;
        _851 = _443;
        _843 = _449;
        _845 = _445;
        _853 = _465;
        _855 = _467;
        _857 = _469;
        _859 = _457;
        _861 = _471;
        _863 = _437;
    }
    _865 = false;
    float _867 = _841;
    float _869 = _847;
    float _871 = _849;
    float _873 = _851;
    float _875 = _843;
    float _877 = _845;
    float _879 = _853;
    float _881 = _855;
    float _883 = _857;
    float _885 = _859;
    float _887 = _861;
    float _889 = _863;
    int _891 = _521 + 80;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.cp_c6)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.cp_c6)._m0[int(_903)][_905];
    int _909 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _911 = _909 + _68;
    int _913 = _521 + 64;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    int _931 = _911 * 48;
    int _933 = _521 + 88;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.cp_c6)._m0[int(_937)][_939];
    int _943 = int(_935) + 1;
    uint _945 = uint(int(uint(_943) >> uint(2)));
    int _947 = _943 & 3;
    float _949 = (*spvDescriptorSet0.cp_c6)._m0[int(_945)][_947];
    int _951 = _521 + 72;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
    int _969 = _521 + 96;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    uint _973 = uint(int(uint(int(_971)) >> uint(2)));
    int _975 = int(_971) & 3;
    float _977 = (*spvDescriptorSet0.cp_c6)._m0[int(_973)][_975];
    int _979 = int(_971) + 1;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    int _983 = _979 & 3;
    float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
    int _987 = _521 + 104;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.cp_c6)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.cp_c6)._m0[int(_999)][_1001];
    float _1005 = _867 * _899;
    float _1007 = _869 * _899;
    float _1009 = _871 * _899;
    int _1011 = _521 + 16;
    uint _1013 = uint(int(uint(_1011) >> uint(2)));
    uint _1015 = uint(int(uint(int(_1013)) >> uint(2)));
    int _1017 = int(_1013) & 3;
    float _1019 = (*spvDescriptorSet0.cp_c6)._m0[int(_1015)][_1017];
    int _1021 = int(_1013) + 1;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    int _1025 = _1021 & 3;
    float _1027 = (*spvDescriptorSet0.cp_c6)._m0[int(_1023)][_1025];
    float _1029 = _867 * _907;
    float _1031 = _871 * _907;
    float _1033 = fma(_873, _921, _1005);
    float _1035 = fma(_875, _921, _1007);
    float _1037 = fma(_877, _921, _1009);
    float _1039 = _869 * _907;
    int _1041 = _521 + 32;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    uint _1045 = uint(int(uint(int(_1043)) >> uint(2)));
    int _1047 = int(_1043) & 3;
    float _1049 = (*spvDescriptorSet0.cp_c6)._m0[int(_1045)][_1047];
    int _1051 = int(_1043) + 1;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    int _1055 = _1051 & 3;
    float _1057 = (*spvDescriptorSet0.cp_c6)._m0[int(_1053)][_1055];
    float _1059 = fma(_873, _929, _1029);
    float _1061 = fma(_877, _929, _1031);
    float _1063 = fma(_875, _929, _1039);
    float _1065 = _867 * _941;
    float _1067 = _869 * _941;
    float _1069 = _867 * _949;
    float _1071 = _869 * _949;
    int _1073 = _521 + 48;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    uint _1077 = uint(int(uint(int(_1075)) >> uint(2)));
    int _1079 = int(_1075) & 3;
    float _1081 = (*spvDescriptorSet0.cp_c6)._m0[int(_1077)][_1079];
    int _1083 = int(_1075) + 1;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    int _1087 = _1083 & 3;
    float _1089 = (*spvDescriptorSet0.cp_c6)._m0[int(_1085)][_1087];
    float _1091 = _871 * _941;
    float _1093 = _871 * _949;
    float _1095 = fma(_873, _959, _1065);
    float _1097 = fma(_875, _959, _1067);
    float _1099 = fma(_873, _967, _1069);
    float _1101 = fma(_875, _967, _1071);
    int _1103 = _521 + 24;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
    int _1109 = int(_1105) & 3;
    float _1111 = (*spvDescriptorSet0.cp_c6)._m0[int(_1107)][_1109];
    int _1113 = int(_1105) + 1;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    int _1117 = _1113 & 3;
    float _1119 = (*spvDescriptorSet0.cp_c6)._m0[int(_1115)][_1117];
    float _1121 = fma(_877, _959, _1091);
    float _1123 = fma(_877, _967, _1093);
    float _1125 = fma(_879, _977, _1033);
    float _1127 = fma(_881, _977, _1035);
    float _1129 = fma(_883, _977, _1037);
    float _1131 = fma(_881, _985, _1063);
    int _1133 = _521 + 40;
    uint _1135 = uint(int(uint(_1133) >> uint(2)));
    uint _1137 = uint(int(uint(int(_1135)) >> uint(2)));
    int _1139 = int(_1135) & 3;
    float _1141 = (*spvDescriptorSet0.cp_c6)._m0[int(_1137)][_1139];
    int _1143 = int(_1135) + 1;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    int _1147 = _1143 & 3;
    float _1149 = (*spvDescriptorSet0.cp_c6)._m0[int(_1145)][_1147];
    float _1151 = fma(_879, _985, _1059);
    float _1153 = fma(_883, _985, _1061);
    float _1155 = fma(_879, _995, _1095);
    float _1157 = fma(_881, _1003, _1101);
    float _1159 = fma(_883, _1003, _1123);
    float _1161 = fma(_879, _1003, _1099);
    int _1163 = _521 + 56;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.cp_c6)._m0[int(_1167)][_1169];
    int _1173 = int(_1165) + 1;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    int _1177 = _1173 & 3;
    float _1179 = (*spvDescriptorSet0.cp_c6)._m0[int(_1175)][_1177];
    float _1181 = fma(_881, _995, _1097);
    float _1183 = _1157 + _885;
    float _1185 = fma(_883, _995, _1121);
    float _1187 = _1159 + _887;
    float _1189 = _1161 + _889;
    float _1191 = _1127 * _1027;
    float _1193 = _1131 * _1027;
    float _1195 = _1181 * _1027;
    float _1197 = _1183 * _1027;
    float _1199 = fma(_1125, _1019, _1191);
    float _1201 = fma(_1151, _1019, _1193);
    float _1203 = fma(_1155, _1019, _1195);
    float _1205 = fma(_1189, _1019, _1197);
    float _1207 = _1183 * _1057;
    float _1209 = _1127 * _1057;
    float _1211 = _1131 * _1057;
    float _1213 = _1181 * _1057;
    float _1215 = fma(_1189, _1049, _1207);
    float _1217 = fma(_1125, _1049, _1209);
    float _1219 = fma(_1151, _1049, _1211);
    float _1221 = fma(_1155, _1049, _1213);
    float _1223 = _1183 * _1089;
    float _1225 = _1127 * _1089;
    float _1227 = _1131 * _1089;
    float _1229 = _1181 * _1089;
    float _1231 = fma(_1189, _1081, _1223);
    float _1233 = fma(_1125, _1081, _1225);
    float _1235 = fma(_1151, _1081, _1227);
    float _1237 = fma(_1155, _1081, _1229);
    float _1239 = fma(_1187, _1111, _1205);
    float _1241 = fma(_1129, _1111, _1199);
    float _1243 = fma(_1153, _1111, _1201);
    float _1245 = fma(_1185, _1111, _1203);
    float _1247 = _1239 + _1119;
    int _1249 = _931 + 32;
    float _1251 = fma(_1187, _1141, _1215);
    float _1253 = fma(_1129, _1141, _1217);
    float _1255 = fma(_1153, _1141, _1219);
    int _1257 = _931 + 16;
    float _1259 = fma(_1185, _1141, _1221);
    float _1261 = _1251 + _1149;
    int _1263 = _931 + 48;
    float _1265 = fma(_1187, _1171, _1231);
    float _1267 = fma(_1129, _1171, _1233);
    float _1269 = fma(_1153, _1171, _1235);
    float _1271 = fma(_1185, _1171, _1237);
    float _1273 = _1265 + _1179;
    uint _1275 = uint(int(uint(_1257) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1275)] = as_type<uint>(_1241);
    int _1277 = _1257 + 4;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1279)] = as_type<uint>(_1243);
    int _1281 = _1257 + 8;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1283)] = as_type<uint>(_1245);
    int _1285 = _1257 + 12;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1287)] = as_type<uint>(_1247);
    uint _1289 = uint(int(uint(_1249) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1289)] = as_type<uint>(_1253);
    int _1291 = _1249 + 4;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1293)] = as_type<uint>(_1255);
    int _1295 = _1249 + 8;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1297)] = as_type<uint>(_1259);
    int _1299 = _1249 + 12;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1301)] = as_type<uint>(_1261);
    uint _1303 = uint(int(uint(_1263) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1303)] = as_type<uint>(_1267);
    int _1305 = _1263 + 4;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1307)] = as_type<uint>(_1269);
    int _1309 = _1263 + 8;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1311)] = as_type<uint>(_1271);
    int _1313 = _1263 + 12;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1315)] = as_type<uint>(_1273);
}

