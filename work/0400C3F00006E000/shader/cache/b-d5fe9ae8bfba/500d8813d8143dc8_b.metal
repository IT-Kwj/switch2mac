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
    texture2d<float> fp_t_tcb_1A [[id(12)]];
    sampler fp_t_tcb_1ASmplr [[id(13)]];
    sampler fp_t_tcb_34Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ASmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_51 [[user(locn1), flat]];
    float4 m_53 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_47 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_45 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_64 [[user(locn11)]];
};

static inline __attribute__((always_inline))
int _73(thread const int& _2672, thread const int& _2673, thread const int& _2674, thread int& _2675, thread uint& gl_SubgroupInvocationID)
{
    int _2678 = _2674 & 31;
    uint _2680 = uint(int(uint(_2674) >> uint(8)));
    int _2682 = int(_2680) & 31;
    float _2684 = as_type<float>(gl_SubgroupInvocationID);
    int _2686 = as_type<int>(_2684) & _2682;
    int _2688 = ~_2682;
    int _2690 = _2678 & _2688;
    int _2692 = _2690 | _2686;
    int _2694 = ~_2682;
    int _2696 = _2673 & _2694;
    int _2698 = _2696 | _2686;
    bool _2700 = uint(_2698) <= uint(_2692);
    _2675 = _2700 ? (-1) : 0;
    float _2702 = spvSubgroupShuffle(as_type<float>(_2672), uint(_2698));
    uint _2704 = uint(_2700 ? as_type<int>(_2702) : _2672);
    return int(_2704);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    bool _409 = false;
    float _77 = gl_FragCoord.w;
    float _79 = in.m_41.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _77;
    float _93 = _91 * _83;
    float _95 = _91 * _89;
    float2 _1161 = float2(_93, _95);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1161, float2(0.0), isnan(_1161))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1161, float2(0.0), isnan(_1161))).xy;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = in.m_43.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_43.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_43.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_45.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_45.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_47.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_47.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_47.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_45.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_49.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_49.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _91 * _109;
    float _173 = _91 * _115;
    float _175 = _91 * _121;
    float _177 = in.m_49.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _171 * _171;
    float _185 = _91 * _127;
    float _187 = _91 * _133;
    float _189 = _91 * _139;
    float _191 = fma(_173, _173, _183);
    float _193 = _185 * _185;
    float _195 = _91 * _145;
    float _197 = _91 * _157;
    float _199 = fma(_175, _175, _191);
    float _201 = fma(_187, _187, _193);
    float _203 = _189 * _189;
    float _205 = _91 * _163;
    float _207 = rsqrt(_199);
    float _209 = fma(_197, _197, _201);
    float _211 = fma(_195, _195, _203);
    float _213 = _91 * _169;
    float _215 = rsqrt(_209);
    float _217 = _91 * _151;
    float _219 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.06666667759418487548828125;
    float _221 = fma(_217, _217, _211);
    float _223 = _219 * 0.15915493667125701904296875;
    float _225 = _171 * _207;
    float _227 = _173 * _207;
    float _229 = _175 * _207;
    float _231 = rsqrt(_221);
    float _233 = _225 * _225;
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _237 = _205 + _235;
    float _239 = _91 * _181;
    float _241 = fma(_227, _227, _233);
    float _243 = _237 * _237;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _247 = _239 + _245;
    float _249 = _223 * 6.283185482025146484375;
    float _251 = cos(_249);
    float _253 = fma(_229, _229, _241);
    float _255 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _257 = _213 + _255;
    float _259 = fma(_257, _257, _243);
    float _261 = rsqrt(_253);
    float _263 = _217 * _231;
    float _265 = fma(_247, _247, _259);
    float _267 = rsqrt(_265);
    float _269 = _257 * _267;
    float _271 = _103 * _103;
    float _273 = _231 * _103;
    float _275 = _101 * _215;
    float _277 = _103 * _263;
    float _279 = fma(_101, _101, _271);
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _195 * _273;
    float _285 = _189 * _273;
    float _287 = _223 * 6.283185482025146484375;
    float _289 = sin(_287);
    float _291 = -_281;
    float _293 = _291 + 1.0;
    float _295 = fma(_187, _275, _283);
    float _297 = fma(_185, _275, _285);
    float _299 = fma(_197, _275, _277);
    float _301 = sqrt(_293);
    float _303 = _261 * _301;
    float _305 = fma(_227, _303, _295);
    float _307 = fma(_225, _303, _297);
    float _309 = fma(_229, _303, _299);
    float _311 = _237 * _267;
    float _313 = _305 * _251;
    float _315 = _305 * _289;
    float _317 = _247 * _267;
    float _319 = fma(_309, _289, _313);
    float _321 = -_311;
    float _323 = _307 * _321;
    float _325 = -_315;
    float _327 = fma(_309, _251, _325);
    float _329 = -_269;
    float _331 = fma(_319, _329, _323);
    float _333 = -_317;
    float _335 = fma(_327, _333, _331);
    float _337 = _335 + _335;
    float _339 = -_337;
    float _341 = -_317;
    float _343 = fma(_327, _339, _341);
    float _345 = -_337;
    float _347 = -_269;
    float _349 = fma(_319, _345, _347);
    float _351 = -_337;
    float _353 = -_311;
    float _355 = fma(_307, _351, _353);
    bool _359 = _343 != 0.0;
    bool _361 = isnan(_343);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    float _369 = _343;
    float _371 = _349;
    int _373 = as_type<int>(_327);
    float _407;
    if (!_367)
    {
        bool _375 = _349 > 0.0;
        bool _377 = _349 >= 0.0;
        bool _379 = isnan(_349);
        bool _381 = _377 || _379;
        bool _383 = isnan(0.0);
        bool _385 = _381 || _383;
        int _387 = _385 ? 0 : 1;
        int _389 = ~_387;
        int _391 = _389 + 1;
        int _393 = _391 + 1;
        int _395 = _393;
        if (!_375)
        {
            int _397 = ~_387;
            int _399 = _397 + 1;
            _395 = _399;
        }
        int _401 = _395;
        float _403 = float(_401);
        float _405 = _403 * 1.57079637050628662109375;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = abs(_349);
        float _413 = abs(_343);
        float _415 = precise::max(_411, _413);
        bool _417 = _415 >= 16.0;
        float _419 = _415;
        if (_417)
        {
            float _421 = _343 * 0.0625;
            _369 = _421;
        }
        float _423 = _369;
        if (_417)
        {
            float _425 = _349 * 0.0625;
            _371 = _425;
        }
        float _427 = _371;
        float _429 = abs(_423);
        bool _431 = _429 != 0.0;
        bool _433 = isnan(_429);
        bool _435 = _431 || _433;
        bool _437 = isnan(0.0);
        bool _439 = _435 || _437;
        float _441 = abs(_427);
        bool _443 = _441 == 0.0;
        float _445 = abs(_427);
        bool _447 = _445 == 0.0;
        bool _449 = !_439;
        bool _451 = _447 && _449;
        bool _453 = false;
        if (_451)
        {
            bool _455 = as_type<int>(_427) >= 0;
            _453 = _455;
        }
        bool _457 = _453;
        int _459 = _457 ? (-1) : 0;
        if (_451)
        {
            int _461 = _457 ? 0 : 1078530011;
            _373 = _461;
        }
        int _463 = _373;
        int _465 = _463;
        if (_451)
        {
            int _467 = int(0x80000000) & as_type<int>(_423);
            int _469 = _463 | _467;
            _419 = as_type<float>(_469);
        }
        float _471 = _419;
        bool _473 = !_439;
        bool _475 = _473 && _443;
        float _477 = _471;
        float _479 = _471;
        if (!_475)
        {
            float _481 = abs(_423);
            bool _483 = _481 != as_type<float>(0x7f800000u /* inf */);
            bool _485 = isnan(_481);
            bool _487 = _483 || _485;
            bool _489 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _491 = _487 || _489;
            float _493 = abs(_427);
            bool _495 = _493 == as_type<float>(0x7f800000u /* inf */);
            float _497 = abs(_427);
            bool _499 = _497 == as_type<float>(0x7f800000u /* inf */);
            bool _501 = !_491;
            bool _503 = _499 && _501;
            if (_503)
            {
                bool _505 = as_type<int>(_427) >= 0;
                _459 = _505 ? (-1) : 0;
            }
            int _507 = _459;
            if (_503)
            {
                _465 = 1075235812;
            }
            int _509 = _465;
            int _511 = _509;
            if (_503)
            {
                int _513 = ~_507;
                int _515 = (_513 != 0) ? _509 : 1061752795;
                _511 = _515;
            }
            int _517 = _511;
            if (_503)
            {
                int _519 = int(0x80000000) & as_type<int>(_423);
                int _521 = _517 | _519;
                _477 = as_type<float>(_521);
            }
            float _523 = _477;
            bool _525 = !_491;
            bool _527 = _525 && _495;
            _479 = _523;
            if (!_527)
            {
                float _529 = abs(_423);
                float _531 = abs(_427);
                float _533 = precise::max(_529, _531);
                float _535 = abs(_423);
                float _537 = abs(_427);
                float _539 = precise::min(_535, _537);
                float _541 = 1.0 / _533;
                float _543 = abs(_423);
                float _545 = abs(_427);
                bool _547 = _543 > _545;
                bool _549 = as_type<int>(_427) >= 0;
                float _551 = _539 * _541;
                float _553 = abs(_423);
                float _555 = abs(_427);
                float _557 = _553 + _555;
                int _559 = as_type<int>(_423) & int(0x80000000);
                float _561 = _551 * _551;
                bool _563 = _557 > as_type<float>(0x7f800000u /* inf */);
                bool _565 = isnan(_557);
                bool _567 = _563 || _565;
                bool _569 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _571 = _567 || _569;
                float _573 = _561 + 11.33538818359375;
                float _575 = fma(_561, _573, 28.84246826171875);
                float _577 = fma(_561, _575, 19.6966705322265625);
                float _579 = fma(_561, -0.82336294651031494140625, -5.674867153167724609375);
                float _581 = fma(_561, _579, -6.565555095672607421875);
                float _583 = 1.0 / _577;
                float _585 = _561 * _581;
                float _587 = _551 * _585;
                float _589 = fma(_587, _583, _551);
                float _591 = _589;
                _479 = _557;
                if (_547)
                {
                    float _593 = -_589;
                    float _595 = _593 + 1.57079637050628662109375;
                    _591 = _595;
                }
                float _597 = _591;
                int _599 = as_type<int>(_597);
                if (!_549)
                {
                    float _601 = -_597;
                    float _603 = _601 + 3.1415927410125732421875;
                    _599 = as_type<int>(_603);
                }
                int _605 = _599;
                if (!_571)
                {
                    int _607 = _559 | _605;
                    _479 = as_type<float>(_607);
                }
            }
        }
        float _609 = _479;
        _407 = _609;
    }
    _409 = false;
    float _611 = _407;
    float _613 = in.m_51.w;
    float _615 = _205 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _617 = _205 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _619 = fma(_611, 0.15915493667125701904296875, 1.0);
    float _621 = _205 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _623 = fma(_611, 0.15915493667125701904296875, 0.5);
    float _625 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[2].x, _615);
    float _627 = floor(_619);
    float _629 = _307 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    int _631 = as_type<int>(_623);
    int _633 = 0;
    int _635 = 7171;
    int _637;
    int _1919 = _73(_631, _633, _635, _637, gl_SubgroupInvocationID);
    int _639 = _1919;
    float _641 = fma(_239, (*spvDescriptorSet0.fp_c8)._m0[2].z, _625);
    float _643 = in.m_53.w;
    float _645 = gl_FragCoord.w;
    float _647 = _643 * _645;
    float _649 = -_627;
    float _651 = _619 + _649;
    float _653 = _307 * _311;
    float _655 = in.m_53.x;
    float _657 = gl_FragCoord.w;
    float _659 = _655 * _657;
    int _661 = as_type<int>(_651);
    int _663 = 0;
    int _665 = 7171;
    int _667;
    int _1949 = _73(_661, _663, _665, _667, gl_SubgroupInvocationID);
    int _669 = _1949;
    float _671 = fma(_305, _269, _653);
    float _673 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[0].x, _617);
    float _675 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[1].x, _621);
    float _677 = _307 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _679 = fma(_355, 0.5, 0.5);
    uint _1983 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _681 = (as_type<float>(_639) * float4(1.0, -1.0, 1.0, 0.0)[_1983]) + (_623 * float4(1.0, 1.0, -1.0, 1.0)[_1983]);
    float _683 = fma(_307, 0.5, 0.5);
    float _685 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.033333338797092437744140625, _613);
    float _687 = _641 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _689 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    int _691 = as_type<int>(_681);
    int _693 = 1;
    int _695 = 7171;
    int _697;
    int _2008 = _73(_691, _693, _695, _697, gl_SubgroupInvocationID);
    int _699 = _2008;
    float _701 = fma(_305, (*spvDescriptorSet0.fp_c8)._m0[0].x, _677);
    float _703 = fma(_305, (*spvDescriptorSet0.fp_c8)._m0[1].x, _629);
    float _705 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _689);
    int _707 = as_type<int>(_681);
    int _709 = 2;
    int _711 = 7171;
    int _713;
    int _2028 = _73(_707, _709, _711, _713, gl_SubgroupInvocationID);
    int _715 = _2028;
    float _717 = 1.0 / _687;
    float _719 = fma(_309, _317, _671);
    float _721 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _723 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _725 = fma(_239, (*spvDescriptorSet0.fp_c8)._m0[0].z, _673);
    float _727 = fma(_239, (*spvDescriptorSet0.fp_c8)._m0[1].z, _675);
    float _729 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _705);
    uint _2069 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _731 = (as_type<float>(_669) * float4(1.0, -1.0, 1.0, 0.0)[_2069]) + (_651 * float4(1.0, 1.0, -1.0, 1.0)[_2069]);
    float _733 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _721);
    float _735 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _723);
    float _737 = fma(_309, (*spvDescriptorSet0.fp_c8)._m0[0].z, _701);
    float _739 = _729 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    int _741 = as_type<int>(_731);
    int _743 = 1;
    int _745 = 7171;
    int _747;
    int _2098 = _73(_741, _743, _745, _747, gl_SubgroupInvocationID);
    int _749 = _2098;
    float _751 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _733);
    float _753 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _735);
    float _755 = fma(_309, (*spvDescriptorSet0.fp_c8)._m0[1].z, _703);
    int _757 = as_type<int>(_731);
    int _759 = 2;
    int _761 = 7171;
    int _763;
    int _2118 = _73(_757, _759, _761, _763, gl_SubgroupInvocationID);
    int _765 = _2118;
    float _767 = _739 * _717;
    float _769 = _725 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _771 = _751 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _773 = _727 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _775 = _753 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _777 = _737 * 0.0500000007450580596923828125;
    float _779 = -_771;
    float _781 = fma(_769, _767, _779);
    float _783 = abs(as_type<float>(_699));
    float _785 = abs(as_type<float>(_715));
    float _787 = _783 + _785;
    float _789 = -_775;
    float _791 = fma(_773, _767, _789);
    float _793 = _755 * 0.0500000007450580596923828125;
    float _795 = in.m_53.y;
    float _797 = gl_FragCoord.w;
    float _799 = _795 * _797;
    float _801 = fma(_781, 0.25, _777);
    float _803 = _787 + (-9.9999997473787516355514526367188e-05);
    float _805 = fma(_791, -0.25, _793);
    float _807 = abs(_719);
    float _809 = 0.0 + _807;
    float _811 = precise::clamp(_809, 0.0, 1.0);
    float _813 = _91 * _647;
    float _815 = _91 * _659;
    float _817 = fma(_811, 0.5, _685);
    float _819 = 1.0 / _813;
    float _821 = abs(as_type<float>(_749));
    float _823 = abs(as_type<float>(_765));
    float _825 = _821 + _823;
    bool _827 = _803 >= _825;
    bool _829 = isnan(_803);
    bool _831 = _827 || _829;
    bool _833 = isnan(_825);
    bool _835 = _831 || _833;
    float2 _2224 = float2(_801, _805);
    float3 _839 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2224, float2(0.0), isnan(_2224))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2224, float2(0.0), isnan(_2224))).xyz;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float2 _2238 = float2(_683, _685);
    float3 _847 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2238, float2(0.0), isnan(_2238))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2238, float2(0.0), isnan(_2238))).xyz;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float2 _2252 = float2(_683, _817);
    float3 _855 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2252, float2(0.0), isnan(_2252))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2252, float2(0.0), isnan(_2252))).xyz;
    float _857 = _855.x;
    float _859 = _855.y;
    float _861 = _855.z;
    bool _863 = !_835;
    float _865 = _863 ? _623 : 0.0;
    float _867 = _815 * _819;
    float _869 = _91 * _799;
    float _871 = _869 * _819;
    float2 _2280 = float2(_865, _679);
    float3 _873 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2280, float2(0.0), isnan(_2280))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2280, float2(0.0), isnan(_2280))).xyz;
    float _875 = _873.x;
    float _877 = _873.y;
    float _879 = _873.z;
    float2 _2294 = float2(_867, _871);
    float4 _882 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2294, float2(0.0), isnan(_2294))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2294, float2(0.0), isnan(_2294))).xyzw;
    float _884 = _882.x;
    float _886 = _882.y;
    float _888 = _882.z;
    float _890 = _882.w;
    float _892 = in.m_55.w;
    float _894 = gl_FragCoord.w;
    float _896 = _892 * _894;
    float _898 = in.m_57.x;
    float _900 = gl_FragCoord.w;
    float _902 = _898 * _900;
    float _904 = in.m_57.y;
    float _906 = gl_FragCoord.w;
    float _908 = _904 * _906;
    float _910 = in.m_57.z;
    float _912 = gl_FragCoord.w;
    float _914 = _910 * _912;
    float _916 = in.m_59.x;
    float _918 = gl_FragCoord.w;
    float _920 = _916 * _918;
    float _922 = -_811;
    float _924 = _922 + 1.0;
    float _926 = _91 * _914;
    float _928 = _841 * _841;
    float _930 = _843 * _843;
    float _932 = _845 * _845;
    float _934 = _849 * _928;
    float _936 = _851 * _930;
    float _938 = _853 * _932;
    float _940 = _924 * _924;
    float _942 = -_934;
    float _944 = fma(_857, 2.0, _942);
    float _946 = -_936;
    float _948 = fma(_859, 2.0, _946);
    float _950 = -_938;
    float _952 = fma(_861, 2.0, _950);
    float _954 = fma(_940, _944, _934);
    float _956 = fma(_940, _948, _936);
    float _958 = fma(_940, _952, _938);
    float _960 = _91 * _896;
    float _962 = _91 * _902;
    float _964 = _91 * _908;
    float _966 = _958 * _926;
    bool _968 = _960 != 1.0;
    bool _970 = isnan(_960);
    bool _972 = _968 || _970;
    bool _974 = isnan(1.0);
    bool _976 = _972 || _974;
    float _978 = _954 * _962;
    float _980 = _956 * _964;
    float _982 = _875 * 20.0;
    float _984 = _877 * 20.0;
    float _986 = _879 * 20.0;
    float _988 = fma(_982, _857, _978);
    float _990 = fma(_984, _859, _980);
    float _992 = fma(_986, _861, _966);
    float _994 = _91 * _920;
    bool _996 = !_976;
    if (!_996)
    {
        float _998 = gl_FragCoord.x;
        float _1000 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _1002 = _998 / _1000;
        float _1004 = gl_FragCoord.y;
        float _1006 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _1008 = _1004 / _1006;
        float _1010 = trunc(_1002);
        int _1012 = int(_1010);
        float _1014 = trunc(_1008);
        int _1016 = int(_1014);
        int _1018 = _1012 + 2;
        int _1020 = _1018 >> 1;
        uint _1023 = uint(int(uint(_1016) >> uint(1)));
        int _1025 = _1020 ^ int(_1023);
        int _1027 = _1025 << 16;
        int _1029 = _1027 ^ _1020;
        int _1031 = 983055 & _1029;
        float _1033 = _960 * 256.0;
        int _1035 = _1031 << 6;
        int _1037 = _1035 + _1031;
        float _1039 = trunc(_1033);
        int _1041 = int(_1039);
        int _1043 = _1037 & 13369548;
        uint _1045 = uint(int(uint(_1043) >> uint(3)));
        int _1047 = _1043 | int(_1045);
        int _1049 = _1047 & 5570560;
        int _1051 = _1047 & 85;
        uint _1053 = uint(int(uint(_1041) >> uint(7)));
        int _1055 = int(_1053) + _1041;
        uint _1057 = uint(int(uint(_1049) >> uint(15)));
        int _1059 = int(_1057) + _1051;
        bool _1061 = uint(_1055) > uint(_1059);
        if (!_1061)
        {
            discard_fragment();
        }
        if (!_1061)
        {
            out.m_62.x = _988;
            out.m_62.y = _990;
            out.m_62.z = _992;
            out.m_62.w = _994;
            return out;
        }
    }
    float _1063 = in.m_64.w;
    float _1065 = gl_FragCoord.w;
    float _1067 = _1063 * _1065;
    float _1069 = in.m_64.x;
    float _1071 = gl_FragCoord.w;
    float _1073 = _1069 * _1071;
    float _1075 = _990 * 0.715200006961822509765625;
    float _1077 = in.m_64.y;
    float _1079 = gl_FragCoord.w;
    float _1081 = _1077 * _1079;
    float _1083 = in.m_64.z;
    float _1085 = gl_FragCoord.w;
    float _1087 = _1083 * _1085;
    float _1089 = fma(_988, 0.2125999927520751953125, _1075);
    float _1091 = 0.0 + _994;
    float _1093 = precise::clamp(_1091, 0.0, 1.0);
    float _1095 = fma(_992, 0.072200000286102294921875, _1089);
    float _1097 = 1.0 / _1095;
    float _1099 = _1097 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1101 = precise::clamp(_1099, 0.0, 1.0);
    float _1103 = _91 * _1067;
    float _1105 = _91 * _1073;
    float _1107 = fma(_1101, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1109 = _890 * _1103;
    float _1111 = _91 * _1081;
    float _1113 = _91 * _1087;
    float _1115 = fma(_890, _1105, _884);
    float _1117 = _1107 * _1109;
    float _1119 = fma(_890, _1111, _886);
    float _1121 = fma(_890, _1113, _888);
    float _1123 = fma(_988, _1117, _1115);
    float _1125 = fma(_990, _1117, _1119);
    float _1127 = fma(_992, _1117, _1121);
    out.m_62.x = _1123;
    out.m_62.y = _1125;
    out.m_62.z = _1127;
    out.m_62.w = _1093;
    return out;
}

