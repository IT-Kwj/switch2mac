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
    texture2d<float> fp_t_tcb_34 [[id(3)]];
    sampler fp_t_tcb_34Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_34Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_47 [[user(locn1), flat]];
    float4 m_53 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_43 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_49 [[user(locn9)]];
};

static inline __attribute__((always_inline))
int _65(thread const int& _2409, thread const int& _2410, thread const int& _2411, thread int& _2412, thread uint& gl_SubgroupInvocationID)
{
    int _2415 = _2411 & 31;
    uint _2417 = uint(int(uint(_2411) >> uint(8)));
    int _2419 = int(_2417) & 31;
    float _2421 = as_type<float>(gl_SubgroupInvocationID);
    int _2423 = as_type<int>(_2421) & _2419;
    int _2425 = ~_2419;
    int _2427 = _2415 & _2425;
    int _2429 = _2427 | _2423;
    int _2431 = ~_2419;
    int _2433 = _2410 & _2431;
    int _2435 = _2433 | _2423;
    bool _2437 = uint(_2435) <= uint(_2429);
    _2412 = _2437 ? (-1) : 0;
    float _2439 = spvSubgroupShuffle(as_type<float>(_2409), uint(_2435));
    uint _2441 = uint(_2437 ? as_type<int>(_2439) : _2409);
    return int(_2441);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    bool _401 = false;
    float _69 = gl_FragCoord.w;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _69;
    float _85 = _83 * _75;
    float _87 = _83 * _81;
    float2 _1050 = float2(_85, _87);
    float2 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1050, float2(0.0), isnan(_1050))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1050, float2(0.0), isnan(_1050))).xy;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = in.m_39.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_41.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_43.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_41.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_43.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_43.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_45.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_45.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.06666667759418487548828125;
    float _165 = _163 * 0.15915493667125701904296875;
    float _167 = _165 * 6.283185482025146484375;
    float _169 = cos(_167);
    float _171 = _83 * _101;
    float _173 = _83 * _107;
    float _175 = _83 * _113;
    float _177 = in.m_45.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _171 * _171;
    float _185 = _83 * _119;
    float _187 = _83 * _125;
    float _189 = _83 * _131;
    float _191 = fma(_173, _173, _183);
    float _193 = _185 * _185;
    float _195 = _83 * _137;
    float _197 = _83 * _143;
    float _199 = fma(_175, _175, _191);
    float _201 = _189 * _189;
    float _203 = fma(_187, _187, _193);
    float _205 = _83 * _149;
    float _207 = _83 * _155;
    float _209 = fma(_197, _197, _201);
    float _211 = rsqrt(_199);
    float _213 = fma(_195, _195, _203);
    float _215 = fma(_205, _205, _209);
    float _217 = rsqrt(_213);
    float _219 = _171 * _211;
    float _221 = _173 * _211;
    float _223 = _175 * _211;
    float _225 = rsqrt(_215);
    float _227 = _219 * _219;
    float _229 = _83 * _161;
    float _231 = _83 * _181;
    float _233 = fma(_221, _221, _227);
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _237 = _229 + _235;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _241 = _231 + _239;
    float _243 = fma(_223, _223, _233);
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _247 = _207 + _245;
    float _249 = _247 * _247;
    float _251 = rsqrt(_243);
    float _253 = _205 * _225;
    float _255 = fma(_237, _237, _249);
    float _257 = fma(_241, _241, _255);
    float _259 = rsqrt(_257);
    float _261 = _237 * _259;
    float _263 = _95 * _95;
    float _265 = _225 * _95;
    float _267 = _93 * _217;
    float _269 = _95 * _253;
    float _271 = fma(_93, _93, _263);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _197 * _265;
    float _277 = _189 * _265;
    float _279 = _165 * 6.283185482025146484375;
    float _281 = sin(_279);
    float _283 = -_273;
    float _285 = _283 + 1.0;
    float _287 = fma(_187, _267, _275);
    float _289 = fma(_195, _267, _269);
    float _291 = fma(_185, _267, _277);
    float _293 = _247 * _259;
    float _295 = sqrt(_285);
    float _297 = _251 * _295;
    float _299 = fma(_221, _297, _287);
    float _301 = fma(_223, _297, _289);
    float _303 = fma(_219, _297, _291);
    float _305 = _241 * _259;
    float _307 = _299 * _169;
    float _309 = _299 * _281;
    float _311 = fma(_301, _281, _307);
    float _313 = -_293;
    float _315 = _303 * _313;
    float _317 = -_309;
    float _319 = fma(_301, _169, _317);
    float _321 = -_261;
    float _323 = fma(_311, _321, _315);
    float _325 = -_305;
    float _327 = fma(_319, _325, _323);
    float _329 = _327 + _327;
    float _331 = -_329;
    float _333 = -_305;
    float _335 = fma(_319, _331, _333);
    float _337 = -_329;
    float _339 = -_261;
    float _341 = fma(_311, _337, _339);
    float _343 = -_329;
    float _345 = -_293;
    float _347 = fma(_303, _343, _345);
    bool _351 = _335 != 0.0;
    bool _353 = isnan(_335);
    bool _355 = _351 || _353;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    float _361 = _335;
    float _363 = _341;
    float _365 = _327;
    float _399;
    if (!_359)
    {
        bool _367 = _341 > 0.0;
        bool _369 = _341 >= 0.0;
        bool _371 = isnan(_341);
        bool _373 = _369 || _371;
        bool _375 = isnan(0.0);
        bool _377 = _373 || _375;
        int _379 = _377 ? 0 : 1;
        int _381 = ~_379;
        int _383 = _381 + 1;
        int _385 = _383 + 1;
        int _387 = _385;
        if (!_367)
        {
            int _389 = ~_379;
            int _391 = _389 + 1;
            _387 = _391;
        }
        int _393 = _387;
        float _395 = float(_393);
        float _397 = _395 * 1.57079637050628662109375;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = abs(_341);
        float _405 = abs(_335);
        float _407 = precise::max(_403, _405);
        bool _409 = _407 >= 16.0;
        int _411 = as_type<int>(_407);
        if (_409)
        {
            float _413 = _335 * 0.0625;
            _361 = _413;
        }
        float _415 = _361;
        if (_409)
        {
            float _417 = _341 * 0.0625;
            _363 = _417;
        }
        float _419 = _363;
        float _421 = abs(_415);
        bool _423 = _421 != 0.0;
        bool _425 = isnan(_421);
        bool _427 = _423 || _425;
        bool _429 = isnan(0.0);
        bool _431 = _427 || _429;
        float _433 = abs(_419);
        bool _435 = _433 == 0.0;
        float _437 = abs(_419);
        bool _439 = _437 == 0.0;
        bool _441 = !_431;
        bool _443 = _439 && _441;
        bool _445 = false;
        if (_443)
        {
            bool _447 = as_type<int>(_419) >= 0;
            _445 = _447;
        }
        bool _449 = _445;
        int _451 = _449 ? (-1) : 0;
        if (_443)
        {
            int _453 = _449 ? 0 : 1078530011;
            _411 = _453;
        }
        int _455 = _411;
        int _457 = _455;
        if (_443)
        {
            int _459 = int(0x80000000) & as_type<int>(_415);
            int _461 = _455 | _459;
            _365 = as_type<float>(_461);
        }
        float _463 = _365;
        bool _465 = !_431;
        bool _467 = _465 && _435;
        float _469 = _463;
        float _471 = _463;
        if (!_467)
        {
            float _473 = abs(_415);
            bool _475 = _473 != as_type<float>(0x7f800000u /* inf */);
            bool _477 = isnan(_473);
            bool _479 = _475 || _477;
            bool _481 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _483 = _479 || _481;
            float _485 = abs(_419);
            bool _487 = _485 == as_type<float>(0x7f800000u /* inf */);
            float _489 = abs(_419);
            bool _491 = _489 == as_type<float>(0x7f800000u /* inf */);
            bool _493 = !_483;
            bool _495 = _491 && _493;
            if (_495)
            {
                bool _497 = as_type<int>(_419) >= 0;
                _451 = _497 ? (-1) : 0;
            }
            int _499 = _451;
            if (_495)
            {
                _457 = 1075235812;
            }
            int _501 = _457;
            int _503 = _501;
            if (_495)
            {
                int _505 = ~_499;
                int _507 = (_505 != 0) ? _501 : 1061752795;
                _503 = _507;
            }
            int _509 = _503;
            if (_495)
            {
                int _511 = int(0x80000000) & as_type<int>(_415);
                int _513 = _509 | _511;
                _469 = as_type<float>(_513);
            }
            float _515 = _469;
            bool _517 = !_483;
            bool _519 = _517 && _487;
            _471 = _515;
            if (!_519)
            {
                float _521 = abs(_415);
                float _523 = abs(_419);
                float _525 = precise::max(_521, _523);
                float _527 = abs(_415);
                float _529 = abs(_419);
                float _531 = precise::min(_527, _529);
                float _533 = 1.0 / _525;
                float _535 = abs(_415);
                float _537 = abs(_419);
                bool _539 = _535 > _537;
                bool _541 = as_type<int>(_419) >= 0;
                float _543 = _531 * _533;
                float _545 = _543 * _543;
                float _547 = _545 + 11.33538818359375;
                float _549 = fma(_545, _547, 28.84246826171875);
                float _551 = fma(_545, _549, 19.6966705322265625);
                float _553 = fma(_545, -0.82336294651031494140625, -5.674867153167724609375);
                float _555 = fma(_545, _553, -6.565555095672607421875);
                float _557 = 1.0 / _551;
                float _559 = _545 * _555;
                float _561 = abs(_415);
                float _563 = abs(_419);
                float _565 = _561 + _563;
                int _567 = as_type<int>(_415) & int(0x80000000);
                float _569 = _543 * _559;
                bool _571 = _565 > as_type<float>(0x7f800000u /* inf */);
                bool _573 = isnan(_565);
                bool _575 = _571 || _573;
                bool _577 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _579 = _575 || _577;
                float _581 = fma(_569, _557, _543);
                float _583 = _581;
                _471 = _565;
                if (_539)
                {
                    float _585 = -_581;
                    float _587 = _585 + 1.57079637050628662109375;
                    _583 = _587;
                }
                float _589 = _583;
                int _591 = as_type<int>(_589);
                if (!_541)
                {
                    float _593 = -_589;
                    float _595 = _593 + 3.1415927410125732421875;
                    _591 = as_type<int>(_595);
                }
                int _597 = _591;
                if (!_579)
                {
                    int _599 = _567 | _597;
                    _471 = as_type<float>(_599);
                }
            }
        }
        float _601 = _471;
        _399 = _601;
    }
    _401 = false;
    float _603 = _399;
    float _605 = _303 * _293;
    float _607 = _207 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _609 = _207 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _611 = fma(_603, 0.15915493667125701904296875, 1.0);
    float _613 = _207 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _615 = fma(_603, 0.15915493667125701904296875, 0.5);
    float _617 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[0].x, _607);
    float _619 = floor(_611);
    float _621 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[1].x, _609);
    float _623 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[2].x, _613);
    int _625 = as_type<int>(_615);
    int _627 = 0;
    int _629 = 7171;
    int _631;
    int _1815 = _65(_625, _627, _629, _631, gl_SubgroupInvocationID);
    int _633 = _1815;
    float _635 = fma(_299, _261, _605);
    float _637 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[2].z, _623);
    float _639 = _303 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _641 = in.m_47.w;
    float _643 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[0].z, _617);
    float _645 = fma(_299, (*spvDescriptorSet0.fp_c8)._m0[0].x, _639);
    float _647 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[1].z, _621);
    float _649 = _643 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _651 = fma(_301, (*spvDescriptorSet0.fp_c8)._m0[0].z, _645);
    float _653 = -_619;
    float _655 = _611 + _653;
    float _657 = _637 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _659 = _303 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _661 = _647 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _663 = fma(_301, _305, _635);
    int _665 = as_type<int>(_655);
    int _667 = 0;
    int _669 = 7171;
    int _671;
    int _1878 = _65(_665, _667, _669, _671, gl_SubgroupInvocationID);
    int _673 = _1878;
    float _675 = 1.0 / _657;
    float _677 = fma(_299, (*spvDescriptorSet0.fp_c8)._m0[1].x, _659);
    float _679 = fma(_303, 0.5, 0.5);
    float _681 = fma(_347, 0.5, 0.5);
    uint _1903 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _683 = (as_type<float>(_633) * float4(1.0, -1.0, 1.0, 0.0)[_1903]) + (_615 * float4(1.0, 1.0, -1.0, 1.0)[_1903]);
    float _685 = fma(_301, (*spvDescriptorSet0.fp_c8)._m0[1].z, _677);
    int _687 = as_type<int>(_683);
    int _689 = 1;
    int _691 = 7171;
    int _693;
    int _1916 = _65(_687, _689, _691, _693, gl_SubgroupInvocationID);
    int _695 = _1916;
    float _697 = _685 * 0.0500000007450580596923828125;
    int _699 = as_type<int>(_683);
    int _701 = 2;
    int _703 = 7171;
    int _705;
    int _1922 = _65(_699, _701, _703, _705, gl_SubgroupInvocationID);
    int _707 = _1922;
    uint _1930 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _709 = (as_type<float>(_673) * float4(1.0, -1.0, 1.0, 0.0)[_1930]) + (_655 * float4(1.0, 1.0, -1.0, 1.0)[_1930]);
    float _711 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    int _713 = as_type<int>(_709);
    int _715 = 1;
    int _717 = 7171;
    int _719;
    int _1944 = _65(_713, _715, _717, _719, gl_SubgroupInvocationID);
    int _721 = _1944;
    float _723 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _711);
    float _725 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _727 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    int _729 = as_type<int>(_709);
    int _731 = 2;
    int _733 = 7171;
    int _735;
    int _1964 = _65(_729, _731, _733, _735, gl_SubgroupInvocationID);
    int _737 = _1964;
    float _739 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _723);
    float _741 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _725);
    float _743 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _727);
    float _745 = _739 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _747 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _741);
    float _749 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _743);
    float _751 = abs(as_type<float>(_695));
    float _753 = abs(as_type<float>(_707));
    float _755 = _751 + _753;
    float _757 = _745 * _675;
    float _759 = _747 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _761 = _749 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _763 = _755 + (-9.9999997473787516355514526367188e-05);
    float _765 = abs(_663);
    float _767 = 0.0 + _765;
    float _769 = precise::clamp(_767, 0.0, 1.0);
    float _771 = -_759;
    float _773 = fma(_649, _757, _771);
    float _775 = -_761;
    float _777 = fma(_661, _757, _775);
    float _779 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.033333338797092437744140625, _641);
    float _781 = fma(_777, -0.25, _697);
    float _783 = abs(as_type<float>(_721));
    float _785 = abs(as_type<float>(_737));
    float _787 = _783 + _785;
    float _789 = _651 * 0.0500000007450580596923828125;
    float _791 = fma(_773, 0.25, _789);
    bool _793 = _763 >= _787;
    bool _795 = isnan(_763);
    bool _797 = _793 || _795;
    bool _799 = isnan(_787);
    bool _801 = _797 || _799;
    float _803 = fma(_769, 0.5, _779);
    bool _805 = !_801;
    float _807 = _805 ? _615 : 0.0;
    float2 _2089 = float2(_791, _781);
    float3 _811 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2089, float2(0.0), isnan(_2089))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2089, float2(0.0), isnan(_2089))).xyz;
    float _813 = _811.x;
    float _815 = _811.y;
    float _817 = _811.z;
    float2 _2103 = float2(_679, _779);
    float3 _819 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2103, float2(0.0), isnan(_2103))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2103, float2(0.0), isnan(_2103))).xyz;
    float _821 = _819.x;
    float _823 = _819.y;
    float _825 = _819.z;
    float2 _2117 = float2(_679, _803);
    float3 _827 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2117, float2(0.0), isnan(_2117))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2117, float2(0.0), isnan(_2117))).xyz;
    float _829 = _827.x;
    float _831 = _827.y;
    float _833 = _827.z;
    float2 _2131 = float2(_807, _681);
    float3 _835 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2131, float2(0.0), isnan(_2131))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2131, float2(0.0), isnan(_2131))).xyz;
    float _837 = _835.x;
    float _839 = _835.y;
    float _841 = _835.z;
    float _843 = in.m_49.w;
    float _845 = gl_FragCoord.w;
    float _847 = _843 * _845;
    float _849 = in.m_51.z;
    float _851 = gl_FragCoord.w;
    float _853 = _849 * _851;
    float _855 = in.m_51.x;
    float _857 = gl_FragCoord.w;
    float _859 = _855 * _857;
    float _861 = in.m_51.y;
    float _863 = gl_FragCoord.w;
    float _865 = _861 * _863;
    float _867 = in.m_53.x;
    float _869 = gl_FragCoord.w;
    float _871 = _867 * _869;
    float _873 = -_769;
    float _875 = _873 + 1.0;
    float _877 = _813 * _813;
    float _879 = _815 * _815;
    float _881 = _875 * _875;
    float _883 = _817 * _817;
    float _885 = _821 * _877;
    float _887 = _823 * _879;
    float _889 = _83 * _865;
    float _891 = _825 * _883;
    float _893 = -_885;
    float _895 = fma(_829, 2.0, _893);
    float _897 = -_887;
    float _899 = fma(_831, 2.0, _897);
    float _901 = _83 * _859;
    float _903 = fma(_881, _895, _885);
    float _905 = _83 * _847;
    float _907 = fma(_881, _899, _887);
    float _909 = -_891;
    float _911 = fma(_833, 2.0, _909);
    float _913 = _903 * _901;
    bool _915 = _905 != 1.0;
    bool _917 = isnan(_905);
    bool _919 = _915 || _917;
    bool _921 = isnan(1.0);
    bool _923 = _919 || _921;
    float _925 = fma(_881, _911, _891);
    float _927 = _83 * _853;
    float _929 = _907 * _889;
    float _931 = _841 * 20.0;
    float _933 = _83 * _871;
    float _935 = _925 * _927;
    float _937 = _837 * 20.0;
    float _939 = _839 * 20.0;
    float _941 = fma(_931, _833, _935);
    float _943 = fma(_937, _829, _913);
    float _945 = fma(_939, _831, _929);
    bool _947 = !_923;
    if (!_947)
    {
        float _949 = gl_FragCoord.x;
        float _951 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _953 = _949 / _951;
        float _955 = gl_FragCoord.y;
        float _957 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _959 = _955 / _957;
        float _961 = trunc(_953);
        int _963 = int(_961);
        float _965 = trunc(_959);
        int _967 = int(_965);
        int _969 = _963 + 2;
        int _971 = _969 >> 1;
        uint _974 = uint(int(uint(_967) >> uint(1)));
        int _976 = _971 ^ int(_974);
        int _978 = _976 << 16;
        int _980 = _978 ^ _971;
        int _982 = 983055 & _980;
        float _984 = _905 * 256.0;
        int _986 = _982 << 6;
        int _988 = _986 + _982;
        float _990 = trunc(_984);
        int _992 = int(_990);
        int _994 = _988 & 13369548;
        uint _996 = uint(int(uint(_994) >> uint(3)));
        int _998 = _994 | int(_996);
        int _1000 = _998 & 5570560;
        int _1002 = _998 & 85;
        uint _1004 = uint(int(uint(_992) >> uint(7)));
        int _1006 = int(_1004) + _992;
        uint _1008 = uint(int(uint(_1000) >> uint(15)));
        int _1010 = int(_1008) + _1002;
        bool _1012 = uint(_1006) > uint(_1010);
        if (!_1012)
        {
            discard_fragment();
        }
        if (!_1012)
        {
            out.m_56.x = _943;
            out.m_56.y = _945;
            out.m_56.z = _941;
            out.m_56.w = _933;
            return out;
        }
    }
    float _1014 = 0.0 + _933;
    float _1016 = precise::clamp(_1014, 0.0, 1.0);
    out.m_56.x = 1.0;
    out.m_56.y = 1.0;
    out.m_56.z = 1.0;
    out.m_56.w = _1016;
    return out;
}

