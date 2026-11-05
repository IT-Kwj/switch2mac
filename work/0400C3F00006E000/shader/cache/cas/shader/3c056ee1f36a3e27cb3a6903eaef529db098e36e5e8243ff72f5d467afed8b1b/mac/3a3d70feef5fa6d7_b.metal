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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
};

static inline __attribute__((always_inline))
int _61(thread const int& _1781, thread const int& _1782, thread const int& _1783, thread int& _1784, thread uint& gl_SubgroupInvocationID)
{
    int _1787 = _1783 & 31;
    uint _1790 = uint(int(uint(_1783) >> uint(8)));
    int _1792 = int(_1790) & 31;
    float _1794 = as_type<float>(gl_SubgroupInvocationID);
    int _1796 = as_type<int>(_1794) & _1792;
    int _1798 = ~_1792;
    int _1800 = _1787 & _1798;
    int _1802 = _1800 | _1796;
    int _1804 = ~_1792;
    int _1806 = _1782 & _1804;
    int _1808 = _1806 | _1796;
    bool _1810 = uint(_1808) <= uint(_1802);
    _1784 = _1810 ? (-1) : 0;
    float _1812 = spvSubgroupShuffle(as_type<float>(_1781), uint(_1808));
    uint _1814 = uint(_1810 ? as_type<int>(_1812) : _1781);
    return int(_1814);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _87 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _85);
    float _89 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _87);
    float _91 = _89 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _93 = 1.0 / _65;
    float _95 = _93 * _71;
    float _97 = _93 * _77;
    float _99 = _93 * _83;
    float _101 = _95 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[2].x, _101);
    float _105 = fma(_99, (*spvDescriptorSet0.fp_c8)._m0[2].z, _103);
    float _107 = _105 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _109 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _111 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _113 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _109);
    float _115 = 1.0 / _107;
    float _117 = _95 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _119 = _95 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _111);
    float _123 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _113);
    float _125 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[0].x, _117);
    float _127 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[1].x, _119);
    float _129 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _121);
    float _131 = _123 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _133 = fma(_99, (*spvDescriptorSet0.fp_c8)._m0[0].z, _125);
    float _135 = fma(_99, (*spvDescriptorSet0.fp_c8)._m0[1].z, _127);
    float _137 = _129 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _139 = _133 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _141 = _135 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _143 = _91 * _115;
    float _145 = -_131;
    float _147 = fma(_139, _143, _145);
    float _149 = -_137;
    float _151 = fma(_141, _143, _149);
    float _153 = _147 * 0.0625;
    float _155 = _151 * 0.0625;
    float _157 = abs(_147);
    float _159 = abs(_151);
    float _161 = precise::max(_157, _159);
    bool _165 = _161 >= 16.0;
    float _167 = _165 ? _155 : _151;
    float _169 = _165 ? _153 : _147;
    float _171 = abs(_167);
    bool _173 = _171 != 0.0;
    bool _175 = isnan(_171);
    bool _177 = _173 || _175;
    bool _179 = isnan(0.0);
    bool _181 = _177 || _179;
    float _183 = abs(_169);
    bool _185 = _183 == 0.0;
    float _187 = abs(_169);
    bool _189 = _187 == 0.0;
    bool _191 = !_181;
    bool _193 = _189 && _191;
    bool _195 = false;
    int _197 = as_type<int>(_155);
    if (_193)
    {
        bool _199 = as_type<int>(_169) >= 0;
        _195 = _199;
    }
    bool _201 = _195;
    int _203 = _201 ? (-1) : 0;
    if (_193)
    {
        int _205 = _201 ? 0 : 1078530011;
        _197 = _205;
    }
    int _207 = _197;
    int _209 = _207;
    if (_193)
    {
        int _211 = int(0x80000000) & as_type<int>(_167);
        int _213 = _207 | _211;
        _209 = _213;
    }
    int _215 = _209;
    bool _217 = !_181;
    bool _219 = _217 && _185;
    int _221 = _215;
    float _223 = as_type<float>(_215);
    if (!_219)
    {
        float _225 = abs(_167);
        bool _227 = _225 != as_type<float>(0x7f800000u /* inf */);
        bool _229 = isnan(_225);
        bool _231 = _227 || _229;
        bool _233 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _235 = _231 || _233;
        float _237 = abs(_169);
        bool _239 = _237 == as_type<float>(0x7f800000u /* inf */);
        float _241 = abs(_169);
        bool _243 = _241 == as_type<float>(0x7f800000u /* inf */);
        bool _245 = !_235;
        bool _247 = _243 && _245;
        if (_247)
        {
            bool _249 = as_type<int>(_169) >= 0;
            _203 = _249 ? (-1) : 0;
        }
        int _251 = _203;
        if (_247)
        {
            _221 = 1075235812;
        }
        int _253 = _221;
        int _255 = _253;
        if (_247)
        {
            int _257 = ~_251;
            int _259 = (_257 != 0) ? _253 : 1061752795;
            _255 = _259;
        }
        int _261 = _255;
        float _263 = as_type<float>(_261);
        if (_247)
        {
            int _265 = int(0x80000000) & as_type<int>(_167);
            int _267 = _261 | _265;
            _263 = as_type<float>(_267);
        }
        float _269 = _263;
        bool _271 = !_235;
        bool _273 = _271 && _239;
        _223 = _269;
        if (!_273)
        {
            float _275 = abs(_167);
            float _277 = abs(_169);
            float _279 = precise::max(_275, _277);
            float _281 = abs(_167);
            float _283 = abs(_169);
            float _285 = precise::min(_281, _283);
            float _287 = 1.0 / _279;
            float _289 = abs(_167);
            float _291 = abs(_169);
            bool _293 = _289 > _291;
            bool _295 = as_type<int>(_169) >= 0;
            float _297 = _285 * _287;
            float _299 = abs(_167);
            float _301 = abs(_169);
            float _303 = _299 + _301;
            int _305 = as_type<int>(_167) & int(0x80000000);
            float _307 = _297 * _297;
            bool _309 = _303 > as_type<float>(0x7f800000u /* inf */);
            bool _311 = isnan(_303);
            bool _313 = _309 || _311;
            bool _315 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _317 = _313 || _315;
            float _319 = _307 + 11.33538818359375;
            float _321 = fma(_307, _319, 28.84246826171875);
            float _323 = fma(_307, _321, 19.6966705322265625);
            float _325 = fma(_307, -0.82336294651031494140625, -5.674867153167724609375);
            float _327 = fma(_307, _325, -6.565555095672607421875);
            float _329 = 1.0 / _323;
            float _331 = _307 * _327;
            float _333 = _297 * _331;
            float _335 = fma(_333, _329, _297);
            float _337 = _335;
            _223 = _303;
            if (_293)
            {
                float _339 = -_335;
                float _341 = _339 + 1.57079637050628662109375;
                _337 = _341;
            }
            float _343 = _337;
            int _345 = as_type<int>(_343);
            if (!_295)
            {
                float _347 = -_343;
                float _349 = _347 + 3.1415927410125732421875;
                _345 = as_type<int>(_349);
            }
            int _351 = _345;
            if (!_317)
            {
                int _353 = _305 | _351;
                _223 = as_type<float>(_353);
            }
        }
    }
    float _355 = _223;
    float _357 = _355 * 0.31830990314483642578125;
    float _359 = in.m_41.w;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = _357 + 0.5;
    int _367 = as_type<int>(_357);
    int _369 = 0;
    int _371 = 7171;
    int _373;
    int _1239 = _61(_367, _369, _371, _373, gl_SubgroupInvocationID);
    int _375 = _1239;
    float _377 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _379 = floor(_365);
    float _381 = in.m_41.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _377);
    float _389 = in.m_41.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_43.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _387);
    float _403 = rsqrt(_401);
    float _405 = -_379;
    float _407 = _365 + _405;
    int _409 = as_type<int>(_407);
    int _411 = 0;
    int _413 = 7171;
    int _415;
    int _1292 = _61(_409, _411, _413, _415, gl_SubgroupInvocationID);
    int _417 = _1292;
    uint _1306 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _419 = (as_type<float>(_375) * float4(1.0, -1.0, 1.0, 0.0)[_1306]) + (_357 * float4(1.0, 1.0, -1.0, 1.0)[_1306]);
    float _421 = _93 * _363;
    int _423 = as_type<int>(_419);
    int _425 = 2;
    int _427 = 7171;
    int _429;
    int _1317 = _61(_423, _425, _427, _429, gl_SubgroupInvocationID);
    int _431 = _1317;
    float _433 = _151 * _403;
    float _435 = _147 * _403;
    float _437 = 1.0 / _421;
    float _439 = _433 * _433;
    float _441 = _93 * _385;
    float _443 = fma(_435, _435, _439);
    float _445 = sqrt(_443);
    uint _1345 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _447 = (as_type<float>(_417) * float4(1.0, -1.0, 1.0, 0.0)[_1345]) + (_407 * float4(1.0, 1.0, -1.0, 1.0)[_1345]);
    int _449 = as_type<int>(_419);
    int _451 = 1;
    int _453 = 7171;
    int _455;
    int _1353 = _61(_449, _451, _453, _455, gl_SubgroupInvocationID);
    int _457 = _1353;
    float _459 = in.m_43.x;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    int _465 = as_type<int>(_447);
    int _467 = 1;
    int _469 = 7171;
    int _471;
    int _1363 = _61(_465, _467, _469, _471, gl_SubgroupInvocationID);
    int _473 = _1363;
    int _475 = as_type<int>(_447);
    int _477 = 2;
    int _479 = 7171;
    int _481;
    int _1366 = _61(_475, _477, _479, _481, gl_SubgroupInvocationID);
    int _483 = _1366;
    float _485 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0166666693985462188720703125, _445);
    float _487 = _93 * _393;
    float _489 = _485 * 0.0625;
    float _491 = abs(as_type<float>(_457));
    float _493 = abs(as_type<float>(_431));
    float _495 = _491 + _493;
    float _497 = _495 + (-9.9999997473787516355514526367188e-05);
    float _499 = abs(as_type<float>(_473));
    float _501 = abs(as_type<float>(_483));
    float _503 = _499 + _501;
    float _505 = _487 * _437;
    float _507 = _93 * _463;
    bool _509 = _497 >= _503;
    bool _511 = isnan(_497);
    bool _513 = _509 || _511;
    bool _515 = isnan(_503);
    bool _517 = _513 || _515;
    float _519 = _441 * _437;
    float _521 = _93 * _399;
    bool _523 = !_517;
    float _525 = _523 ? _357 : 0.0;
    float2 _1432 = float2(_519, _505);
    float _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1432, float2(0.0), isnan(_1432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1432, float2(0.0), isnan(_1432))).x;
    float2 _1442 = float2(_507, _521);
    float4 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1442, float2(0.0), isnan(_1442))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1442, float2(0.0), isnan(_1442))).xyzw;
    float _532 = _530.x;
    float _534 = _530.y;
    float _536 = _530.z;
    float _538 = _530.w;
    float2 _1458 = float2(_525, _489);
    float _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1458, float2(0.0), isnan(_1458))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1458, float2(0.0), isnan(_1458))).w;
    float _542 = in.m_41.z;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_45.w;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = in.m_47.w;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_49.x;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = _93 * _546;
    float _568 = _566 * _437;
    float _570 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _572 = fma(_568, (*spvDescriptorSet0.fp_c8)._m0[30].w, _570);
    float _574 = _93 * _552;
    float _576 = 1.0 / _572;
    float _578 = in.m_47.x;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_45.z;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _592 = fma(_527, (*spvDescriptorSet0.fp_c8)._m0[30].w, _590);
    float _594 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _596 = 1.0 / _592;
    float _598 = _538 * _540;
    float _600 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _602 = _576 * _600;
    float _604 = _93 * _564;
    float _606 = _574 * _598;
    float _608 = _93 * _558;
    float _610 = _608 * _606;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _616 = -_602;
    float _618 = fma(_596, _614, _616);
    float _620 = _618 * _594;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = _612 * _622;
    float _626 = _624 * _604;
    bool _628 = _626 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _630 = isnan(_626);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _636 = _632 || _634;
    float _638 = in.m_47.y;
    float _640 = gl_FragCoord.w;
    float _642 = _638 * _640;
    float _644 = in.m_47.z;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = in.m_45.x;
    float _652 = gl_FragCoord.w;
    float _654 = _650 * _652;
    float _656 = in.m_45.y;
    float _658 = gl_FragCoord.w;
    float _660 = _656 * _658;
    float _662 = _602;
    float _664 = _536;
    if (!_636)
    {
        discard_fragment();
    }
    float _666 = _93 * _582;
    float _668 = -_532;
    float _670 = _668 + 1.0;
    float _672 = _666 * _670;
    float _674 = _93 * _642;
    float _676 = _93 * _648;
    float _678 = -_534;
    float _680 = _678 + 1.0;
    float _682 = -_536;
    float _684 = _682 + 1.0;
    float _686 = _93 * _654;
    float _688 = _93 * _660;
    float _690 = _674 * _680;
    float _692 = _93 * _588;
    float _694 = _676 * _684;
    float _696 = fma(_532, _686, _672);
    float _698 = fma(_534, _688, _690);
    float _700 = fma(_536, _692, _694);
    if (!_636)
    {
        out.m_52.x = _696;
        out.m_52.y = _698;
        out.m_52.z = _700;
        out.m_52.w = _612;
        return out;
    }
    float _702 = _698 * 0.715200006961822509765625;
    float _704 = fma(_696, 0.2125999927520751953125, _702);
    float _706 = fma(_700, 0.072200000286102294921875, _704);
    bool _708 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _710 = 1.0 / _706;
    float _712 = 0.0 + _626;
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = _714;
    if (_708)
    {
        float _718 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _720 = _602 + _718;
        _662 = _720;
    }
    float _722 = _662;
    float _724 = _710 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _726 = precise::clamp(_724, 0.0, 1.0);
    if (_708)
    {
        float _728 = _722 * 8.0;
        float _730 = precise::clamp(_728, 0.0, 1.0);
        _664 = _730;
    }
    float _732 = _664;
    float _734 = fma(_726, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    if (_708)
    {
        float _736 = _714 * _732;
        _716 = _736;
    }
    float _738 = _716;
    float _740 = _696 * _734;
    float _742 = _698 * _734;
    float _744 = _700 * _734;
    float _746 = 0.0 + _738;
    float _748 = precise::clamp(_746, 0.0, 1.0);
    out.m_52.x = _740;
    out.m_52.y = _742;
    out.m_52.z = _744;
    out.m_52.w = _748;
    return out;
}

