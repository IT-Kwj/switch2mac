#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_34 [[id(4)]];
    sampler fp_t_tcb_34Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_34Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_49 [[user(locn1), flat]];
    float4 m_62 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_45 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_43 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_60 [[user(locn11)]];
};

static inline __attribute__((always_inline))
int _71(thread const int& _2684, thread const int& _2685, thread const int& _2686, thread int& _2687, thread uint& gl_SubgroupInvocationID)
{
    int _2690 = _2686 & 31;
    uint _2692 = uint(int(uint(_2686) >> uint(8)));
    int _2694 = int(_2692) & 31;
    float _2696 = as_type<float>(gl_SubgroupInvocationID);
    int _2698 = as_type<int>(_2696) & _2694;
    int _2700 = ~_2694;
    int _2702 = _2690 & _2700;
    int _2704 = _2702 | _2698;
    int _2706 = ~_2694;
    int _2708 = _2685 & _2706;
    int _2710 = _2708 | _2698;
    bool _2712 = uint(_2710) <= uint(_2704);
    _2687 = _2712 ? (-1) : 0;
    float _2714 = spvSubgroupShuffle(as_type<float>(_2684), uint(_2710));
    uint _2716 = uint(_2712 ? as_type<int>(_2714) : _2684);
    return int(_2716);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    bool _407 = false;
    float _75 = gl_FragCoord.w;
    float _77 = in.m_39.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float2 _1164 = float2(_91, _93);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1164, float2(0.0), isnan(_1164))).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = in.m_41.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_43.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_45.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_45.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_45.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_43.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_47.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_47.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _89 * _107;
    float _171 = _89 * _113;
    float _173 = _89 * _119;
    float _175 = in.m_47.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _169 * _169;
    float _183 = _89 * _125;
    float _185 = _89 * _131;
    float _187 = _89 * _137;
    float _189 = fma(_171, _171, _181);
    float _191 = _183 * _183;
    float _193 = _89 * _143;
    float _195 = _89 * _155;
    float _197 = fma(_173, _173, _189);
    float _199 = fma(_185, _185, _191);
    float _201 = _187 * _187;
    float _203 = _89 * _161;
    float _205 = rsqrt(_197);
    float _207 = fma(_195, _195, _199);
    float _209 = fma(_193, _193, _201);
    float _211 = _89 * _167;
    float _213 = rsqrt(_207);
    float _215 = _89 * _149;
    float _217 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.06666667759418487548828125;
    float _219 = fma(_215, _215, _209);
    float _221 = _217 * 0.15915493667125701904296875;
    float _223 = _169 * _205;
    float _225 = _171 * _205;
    float _227 = _173 * _205;
    float _229 = rsqrt(_219);
    float _231 = _223 * _223;
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _235 = _203 + _233;
    float _237 = _89 * _179;
    float _239 = fma(_225, _225, _231);
    float _241 = _235 * _235;
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _245 = _237 + _243;
    float _247 = _221 * 6.283185482025146484375;
    float _249 = cos(_247);
    float _251 = fma(_227, _227, _239);
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _255 = _211 + _253;
    float _257 = fma(_255, _255, _241);
    float _259 = rsqrt(_251);
    float _261 = _215 * _229;
    float _263 = fma(_245, _245, _257);
    float _265 = rsqrt(_263);
    float _267 = _255 * _265;
    float _269 = _101 * _101;
    float _271 = _229 * _101;
    float _273 = _99 * _213;
    float _275 = _101 * _261;
    float _277 = fma(_99, _99, _269);
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _193 * _271;
    float _283 = _187 * _271;
    float _285 = _221 * 6.283185482025146484375;
    float _287 = sin(_285);
    float _289 = -_279;
    float _291 = _289 + 1.0;
    float _293 = fma(_185, _273, _281);
    float _295 = fma(_195, _273, _275);
    float _297 = fma(_183, _273, _283);
    float _299 = _235 * _265;
    float _301 = sqrt(_291);
    float _303 = _259 * _301;
    float _305 = fma(_225, _303, _293);
    float _307 = fma(_227, _303, _295);
    float _309 = fma(_223, _303, _297);
    float _311 = _245 * _265;
    float _313 = _305 * _249;
    float _315 = _305 * _287;
    float _317 = fma(_307, _287, _313);
    float _319 = -_299;
    float _321 = _309 * _319;
    float _323 = -_315;
    float _325 = fma(_307, _249, _323);
    float _327 = -_267;
    float _329 = fma(_317, _327, _321);
    float _331 = -_311;
    float _333 = fma(_325, _331, _329);
    float _335 = _333 + _333;
    float _337 = -_335;
    float _339 = -_311;
    float _341 = fma(_325, _337, _339);
    float _343 = -_335;
    float _345 = -_267;
    float _347 = fma(_317, _343, _345);
    float _349 = -_335;
    float _351 = -_299;
    float _353 = fma(_309, _349, _351);
    bool _357 = _341 != 0.0;
    bool _359 = isnan(_341);
    bool _361 = _357 || _359;
    bool _363 = isnan(0.0);
    bool _365 = _361 || _363;
    float _367 = _341;
    float _369 = _347;
    float _371 = _333;
    float _405;
    if (!_365)
    {
        bool _373 = _347 > 0.0;
        bool _375 = _347 >= 0.0;
        bool _377 = isnan(_347);
        bool _379 = _375 || _377;
        bool _381 = isnan(0.0);
        bool _383 = _379 || _381;
        int _385 = _383 ? 0 : 1;
        int _387 = ~_385;
        int _389 = _387 + 1;
        int _391 = _389 + 1;
        int _393 = _391;
        if (!_373)
        {
            int _395 = ~_385;
            int _397 = _395 + 1;
            _393 = _397;
        }
        int _399 = _393;
        float _401 = float(_399);
        float _403 = _401 * 1.57079637050628662109375;
        _405 = _403;
        _407 = true;
    }
    else
    {
        float _409 = abs(_347);
        float _411 = abs(_341);
        float _413 = precise::max(_409, _411);
        bool _415 = _413 >= 16.0;
        int _417 = as_type<int>(_413);
        if (_415)
        {
            float _419 = _341 * 0.0625;
            _367 = _419;
        }
        float _421 = _367;
        if (_415)
        {
            float _423 = _347 * 0.0625;
            _369 = _423;
        }
        float _425 = _369;
        float _427 = abs(_421);
        bool _429 = _427 != 0.0;
        bool _431 = isnan(_427);
        bool _433 = _429 || _431;
        bool _435 = isnan(0.0);
        bool _437 = _433 || _435;
        float _439 = abs(_425);
        bool _441 = _439 == 0.0;
        float _443 = abs(_425);
        bool _445 = _443 == 0.0;
        bool _447 = !_437;
        bool _449 = _445 && _447;
        bool _451 = false;
        if (_449)
        {
            bool _453 = as_type<int>(_425) >= 0;
            _451 = _453;
        }
        bool _455 = _451;
        int _457 = _455 ? (-1) : 0;
        if (_449)
        {
            int _459 = _455 ? 0 : 1078530011;
            _417 = _459;
        }
        int _461 = _417;
        int _463 = _461;
        if (_449)
        {
            int _465 = int(0x80000000) & as_type<int>(_421);
            int _467 = _461 | _465;
            _371 = as_type<float>(_467);
        }
        float _469 = _371;
        bool _471 = !_437;
        bool _473 = _471 && _441;
        float _475 = _469;
        float _477 = _469;
        if (!_473)
        {
            float _479 = abs(_421);
            bool _481 = _479 != as_type<float>(0x7f800000u /* inf */);
            bool _483 = isnan(_479);
            bool _485 = _481 || _483;
            bool _487 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _489 = _485 || _487;
            float _491 = abs(_425);
            bool _493 = _491 == as_type<float>(0x7f800000u /* inf */);
            float _495 = abs(_425);
            bool _497 = _495 == as_type<float>(0x7f800000u /* inf */);
            bool _499 = !_489;
            bool _501 = _497 && _499;
            if (_501)
            {
                bool _503 = as_type<int>(_425) >= 0;
                _457 = _503 ? (-1) : 0;
            }
            int _505 = _457;
            if (_501)
            {
                _463 = 1075235812;
            }
            int _507 = _463;
            int _509 = _507;
            if (_501)
            {
                int _511 = ~_505;
                int _513 = (_511 != 0) ? _507 : 1061752795;
                _509 = _513;
            }
            int _515 = _509;
            if (_501)
            {
                int _517 = int(0x80000000) & as_type<int>(_421);
                int _519 = _515 | _517;
                _475 = as_type<float>(_519);
            }
            float _521 = _475;
            bool _523 = !_489;
            bool _525 = _523 && _493;
            _477 = _521;
            if (!_525)
            {
                float _527 = abs(_421);
                float _529 = abs(_425);
                float _531 = precise::max(_527, _529);
                float _533 = abs(_421);
                float _535 = abs(_425);
                float _537 = precise::min(_533, _535);
                float _539 = 1.0 / _531;
                float _541 = abs(_421);
                float _543 = abs(_425);
                bool _545 = _541 > _543;
                bool _547 = as_type<int>(_425) >= 0;
                float _549 = _537 * _539;
                float _551 = _549 * _549;
                float _553 = _551 + 11.33538818359375;
                float _555 = fma(_551, _553, 28.84246826171875);
                float _557 = fma(_551, _555, 19.6966705322265625);
                float _559 = fma(_551, -0.82336294651031494140625, -5.674867153167724609375);
                float _561 = fma(_551, _559, -6.565555095672607421875);
                float _563 = 1.0 / _557;
                float _565 = _551 * _561;
                float _567 = abs(_421);
                float _569 = abs(_425);
                float _571 = _567 + _569;
                int _573 = as_type<int>(_421) & int(0x80000000);
                float _575 = _549 * _565;
                bool _577 = _571 > as_type<float>(0x7f800000u /* inf */);
                bool _579 = isnan(_571);
                bool _581 = _577 || _579;
                bool _583 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _585 = _581 || _583;
                float _587 = fma(_575, _563, _549);
                float _589 = _587;
                _477 = _571;
                if (_545)
                {
                    float _591 = -_587;
                    float _593 = _591 + 1.57079637050628662109375;
                    _589 = _593;
                }
                float _595 = _589;
                int _597 = as_type<int>(_595);
                if (!_547)
                {
                    float _599 = -_595;
                    float _601 = _599 + 3.1415927410125732421875;
                    _597 = as_type<int>(_601);
                }
                int _603 = _597;
                if (!_585)
                {
                    int _605 = _573 | _603;
                    _477 = as_type<float>(_605);
                }
            }
        }
        float _607 = _477;
        _405 = _607;
    }
    _407 = false;
    float _609 = _405;
    float _611 = _309 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _613 = _309 * _299;
    float _615 = fma(_609, 0.15915493667125701904296875, 1.0);
    float _617 = _203 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _619 = fma(_609, 0.15915493667125701904296875, 0.5);
    float _621 = _203 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _623 = floor(_615);
    float _625 = fma(_305, _267, _613);
    float _627 = in.m_49.w;
    int _629 = as_type<int>(_619);
    int _631 = 0;
    int _633 = 7171;
    int _635;
    int _1920 = _71(_629, _631, _633, _635, gl_SubgroupInvocationID);
    int _637 = _1920;
    float _639 = _309 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _641 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[0].x, _617);
    float _643 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[1].x, _621);
    float _645 = fma(_305, (*spvDescriptorSet0.fp_c8)._m0[0].x, _639);
    float _647 = fma(_237, (*spvDescriptorSet0.fp_c8)._m0[0].z, _641);
    float _649 = fma(_237, (*spvDescriptorSet0.fp_c8)._m0[1].z, _643);
    float _651 = fma(_307, (*spvDescriptorSet0.fp_c8)._m0[0].z, _645);
    float _653 = fma(_307, _311, _625);
    float _655 = _647 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _657 = _649 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _659 = -_623;
    float _661 = _615 + _659;
    float _663 = _203 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _665 = _651 * 0.0500000007450580596923828125;
    float _667 = fma(_309, 0.5, 0.5);
    float _669 = fma(_353, 0.5, 0.5);
    int _671 = as_type<int>(_661);
    int _673 = 0;
    int _675 = 7171;
    int _677;
    int _1985 = _71(_671, _673, _675, _677, gl_SubgroupInvocationID);
    int _679 = _1985;
    float _681 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[2].x, _663);
    float _683 = fma(_305, (*spvDescriptorSet0.fp_c8)._m0[1].x, _611);
    float _685 = fma(_237, (*spvDescriptorSet0.fp_c8)._m0[2].z, _681);
    uint _2014 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _687 = (as_type<float>(_637) * float4(1.0, -1.0, 1.0, 0.0)[_2014]) + (_619 * float4(1.0, 1.0, -1.0, 1.0)[_2014]);
    float _689 = fma(_307, (*spvDescriptorSet0.fp_c8)._m0[1].z, _683);
    float _691 = _685 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    int _693 = as_type<int>(_687);
    int _695 = 1;
    int _697 = 7171;
    int _699;
    int _2031 = _71(_693, _695, _697, _699, gl_SubgroupInvocationID);
    int _701 = _2031;
    float _703 = _689 * 0.0500000007450580596923828125;
    float _705 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.033333338797092437744140625, _627);
    int _707 = as_type<int>(_687);
    int _709 = 2;
    int _711 = 7171;
    int _713;
    int _2041 = _71(_707, _709, _711, _713, gl_SubgroupInvocationID);
    int _715 = _2041;
    uint _2049 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _717 = (as_type<float>(_679) * float4(1.0, -1.0, 1.0, 0.0)[_2049]) + (_661 * float4(1.0, 1.0, -1.0, 1.0)[_2049]);
    float _719 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _721 = 1.0 / _691;
    int _723 = as_type<int>(_717);
    int _725 = 1;
    int _727 = 7171;
    int _729;
    int _2065 = _71(_723, _725, _727, _729, gl_SubgroupInvocationID);
    int _731 = _2065;
    float _733 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _719);
    float _735 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _737 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    int _739 = as_type<int>(_717);
    int _741 = 2;
    int _743 = 7171;
    int _745;
    int _2085 = _71(_739, _741, _743, _745, gl_SubgroupInvocationID);
    int _747 = _2085;
    float _749 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _733);
    float _751 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _735);
    float _753 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _737);
    float _755 = _749 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _757 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _751);
    float _759 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _753);
    float _761 = abs(as_type<float>(_701));
    float _763 = abs(as_type<float>(_715));
    float _765 = _761 + _763;
    float _767 = _755 * _721;
    float _769 = _757 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _771 = _759 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _773 = _765 + (-9.9999997473787516355514526367188e-05);
    float _775 = abs(_653);
    float _777 = 0.0 + _775;
    float _779 = precise::clamp(_777, 0.0, 1.0);
    float _781 = -_769;
    float _783 = fma(_655, _767, _781);
    float _785 = -_771;
    float _787 = fma(_657, _767, _785);
    float _789 = fma(_779, 0.5, _705);
    float _791 = fma(_783, 0.25, _665);
    float _793 = fma(_787, -0.25, _703);
    float _795 = abs(as_type<float>(_731));
    float _797 = abs(as_type<float>(_747));
    float _799 = _795 + _797;
    bool _801 = _773 >= _799;
    bool _803 = isnan(_773);
    bool _805 = _801 || _803;
    bool _807 = isnan(_799);
    bool _809 = _805 || _807;
    float2 _2198 = float2(_791, _793);
    float3 _813 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2198, float2(0.0), isnan(_2198))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2198, float2(0.0), isnan(_2198))).xyz;
    float _815 = _813.x;
    float _817 = _813.y;
    float _819 = _813.z;
    float2 _2212 = float2(_667, _705);
    float3 _821 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2212, float2(0.0), isnan(_2212))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2212, float2(0.0), isnan(_2212))).xyz;
    float _823 = _821.x;
    float _825 = _821.y;
    float _827 = _821.z;
    float2 _2226 = float2(_667, _789);
    float3 _829 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2226, float2(0.0), isnan(_2226))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2226, float2(0.0), isnan(_2226))).xyz;
    float _831 = _829.x;
    float _833 = _829.y;
    float _835 = _829.z;
    bool _837 = !_809;
    float _839 = _837 ? _619 : 0.0;
    float2 _2245 = float2(_839, _669);
    float3 _841 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2245, float2(0.0), isnan(_2245))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2245, float2(0.0), isnan(_2245))).xyz;
    float _843 = _841.x;
    float _845 = _841.y;
    float _847 = _841.z;
    float _849 = in.m_51.w;
    float _851 = gl_FragCoord.w;
    float _853 = _849 * _851;
    float _855 = in.m_53.x;
    float _857 = gl_FragCoord.w;
    float _859 = _855 * _857;
    float _861 = in.m_53.y;
    float _863 = gl_FragCoord.w;
    float _865 = _861 * _863;
    float _867 = in.m_53.z;
    float _869 = gl_FragCoord.w;
    float _871 = _867 * _869;
    float _873 = in.m_55.x;
    float _875 = gl_FragCoord.w;
    float _877 = _873 * _875;
    float _879 = -_779;
    float _881 = _879 + 1.0;
    float _883 = _89 * _853;
    bool _885 = _883 != 1.0;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    float _895 = _815 * _815;
    float _897 = _817 * _817;
    float _899 = _819 * _819;
    float _901 = _823 * _895;
    float _903 = _825 * _897;
    float _905 = _827 * _899;
    float _907 = _881 * _881;
    float _909 = -_901;
    float _911 = fma(_831, 2.0, _909);
    float _913 = -_903;
    float _915 = fma(_833, 2.0, _913);
    float _917 = -_905;
    float _919 = fma(_835, 2.0, _917);
    float _921 = _89 * _865;
    float _923 = fma(_907, _911, _901);
    float _925 = fma(_907, _915, _903);
    float _927 = fma(_907, _919, _905);
    float _929 = _89 * _859;
    float _931 = _89 * _871;
    float _933 = _925 * _921;
    float _935 = _923 * _929;
    float _937 = _843 * 20.0;
    float _939 = _845 * 20.0;
    float _941 = _927 * _931;
    float _943 = _847 * 20.0;
    float _945 = fma(_937, _831, _935);
    float _947 = fma(_939, _833, _933);
    float _949 = _89 * _877;
    float _951 = fma(_943, _835, _941);
    bool _953 = !_893;
    if (!_953)
    {
        float _955 = gl_FragCoord.x;
        float _957 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _959 = _955 / _957;
        float _961 = gl_FragCoord.y;
        float _963 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _965 = _961 / _963;
        float _967 = trunc(_959);
        int _969 = int(_967);
        float _971 = trunc(_965);
        int _973 = int(_971);
        int _975 = _969 + 2;
        int _977 = _975 >> 1;
        uint _980 = uint(int(uint(_973) >> uint(1)));
        int _982 = _977 ^ int(_980);
        int _984 = _982 << 16;
        int _986 = _984 ^ _977;
        int _988 = 983055 & _986;
        float _990 = _883 * 256.0;
        int _992 = _988 << 6;
        int _994 = _992 + _988;
        float _996 = trunc(_990);
        int _998 = int(_996);
        int _1000 = _994 & 13369548;
        uint _1002 = uint(int(uint(_1000) >> uint(3)));
        int _1004 = _1000 | int(_1002);
        int _1006 = _1004 & 5570560;
        int _1008 = _1004 & 85;
        uint _1010 = uint(int(uint(_998) >> uint(7)));
        int _1012 = int(_1010) + _998;
        uint _1014 = uint(int(uint(_1006) >> uint(15)));
        int _1016 = int(_1014) + _1008;
        bool _1018 = uint(_1012) > uint(_1016);
        if (!_1018)
        {
            discard_fragment();
        }
        if (!_1018)
        {
            out.m_58.x = _945;
            out.m_58.y = _947;
            out.m_58.z = _951;
            out.m_58.w = _949;
            return out;
        }
    }
    float _1020 = _947 * 0.715200006961822509765625;
    float _1022 = in.m_60.w;
    float _1024 = gl_FragCoord.w;
    float _1026 = _1022 * _1024;
    float _1028 = in.m_60.x;
    float _1030 = gl_FragCoord.w;
    float _1032 = _1028 * _1030;
    float _1034 = in.m_60.y;
    float _1036 = gl_FragCoord.w;
    float _1038 = _1034 * _1036;
    float _1040 = fma(_945, 0.2125999927520751953125, _1020);
    float _1042 = in.m_60.z;
    float _1044 = gl_FragCoord.w;
    float _1046 = _1042 * _1044;
    float _1048 = fma(_951, 0.072200000286102294921875, _1040);
    bool _1050 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1052 = 1.0 / _1048;
    float _1054 = _1052 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = fma(_1056, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1060 = _89 * _1026;
    float _1062 = 0.0 + _949;
    float _1064 = precise::clamp(_1062, 0.0, 1.0);
    float _1066 = _89 * _1032;
    float _1068 = _1058 * _1060;
    float _1070 = _89 * _1038;
    float _1072 = _89 * _1046;
    float _1074 = fma(_945, _1068, _1066);
    float _1076 = fma(_947, _1068, _1070);
    float _1078 = fma(_951, _1068, _1072);
    float _1080 = _1066;
    if (!_1050)
    {
        _1080 = _1064;
    }
    float _1082 = _1080;
    bool _1084 = !_1050;
    float _1086 = _1082;
    if (!_1084)
    {
        float _1088 = in.m_62.w;
        float _1090 = gl_FragCoord.w;
        float _1092 = _1088 * _1090;
        float _1094 = in.m_62.z;
        float _1096 = gl_FragCoord.w;
        float _1098 = _1094 * _1096;
        float _1100 = _89 * _1092;
        float _1102 = _89 * _1098;
        float _1104 = 1.0 / _1100;
        float _1106 = _1102 * _1104;
        float _1108 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1110 = fma(_1106, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1108);
        float _1112 = 1.0 / _1110;
        float _1114 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1116 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1118 = fma(_1112, _1114, _1116);
        float _1120 = _1118 * 8.0;
        float _1122 = precise::clamp(_1120, 0.0, 1.0);
        float _1124 = _1064 * _1122;
        _1086 = _1124;
    }
    float _1126 = _1086;
    float _1128 = 0.0 + _1126;
    float _1130 = precise::clamp(_1128, 0.0, 1.0);
    out.m_58.x = _1074;
    out.m_58.y = _1076;
    out.m_58.z = _1078;
    out.m_58.w = _1130;
    return out;
}

