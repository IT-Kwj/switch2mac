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
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_37 [[user(locn3), flat]];
    float4 m_41 [[user(locn4)]];
    float4 m_45 [[user(locn5), flat]];
    float4 m_56 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_39 [[user(locn8)]];
    float4 m_35 [[user(locn9)]];
};

static inline __attribute__((always_inline))
int _65(thread const int& _2090, thread const int& _2091, thread const int& _2092, thread int& _2093, thread uint& gl_SubgroupInvocationID)
{
    int _2096 = _2092 & 31;
    uint _2099 = uint(int(uint(_2092) >> uint(8)));
    int _2101 = int(_2099) & 31;
    float _2103 = as_type<float>(gl_SubgroupInvocationID);
    int _2105 = as_type<int>(_2103) & _2101;
    int _2107 = ~_2101;
    int _2109 = _2096 & _2107;
    int _2111 = _2109 | _2105;
    int _2113 = ~_2101;
    int _2115 = _2091 & _2113;
    int _2117 = _2115 | _2105;
    bool _2119 = uint(_2117) <= uint(_2111);
    _2093 = _2119 ? (-1) : 0;
    float _2121 = spvSubgroupShuffle(as_type<float>(_2090), uint(_2117));
    uint _2123 = uint(_2119 ? as_type<int>(_2121) : _2090);
    return int(_2123);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_35.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.y;
    float _91 = in.m_37.x;
    float _93 = 1.0 / _69;
    float _95 = _93 * _75;
    float _97 = _93 * _81;
    float _99 = _93 * _87;
    float _101 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, -0.004999999888241291046142578125, _89);
    float _103 = 1.0 / _95;
    float _105 = _103 * (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _107 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _109 = fma(_97, _105, _107);
    float _111 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _113 = fma(_99, _105, _111);
    float _115 = fma(_109, 0.00150000001303851604461669921875, _91);
    float _117 = fma(_113, 0.00150000001303851604461669921875, _101);
    float2 _949 = float2(_115, _117);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_949, float2(0.0), isnan(_949))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_949, float2(0.0), isnan(_949))).w;
    float _121 = in.m_39.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_39.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_39.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _141 = _97 + _139;
    float _143 = in.m_41.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _151 = _95 + _149;
    float _153 = _93 * _125;
    float _155 = _93 * _131;
    float _157 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _159 = _99 + _157;
    float _161 = _93 * _137;
    float _163 = _153 * _153;
    float _165 = fma(_155, _155, _163);
    float _167 = _159 * _159;
    float _169 = fma(_161, _161, _165);
    float _171 = fma(_141, _141, _167);
    float _173 = fma(_151, _151, _171);
    float _175 = rsqrt(_169);
    float _177 = rsqrt(_173);
    float _179 = _153 * _175;
    float _181 = _155 * _175;
    float _183 = _161 * _175;
    float _185 = _179 * _179;
    float _187 = _159 * _177;
    float _189 = _141 * _177;
    float _191 = fma(_181, _181, _185);
    float _193 = _151 * _177;
    float _195 = _187 * _187;
    float _197 = fma(_183, _183, _191);
    float _199 = fma(_189, _189, _195);
    float _201 = in.m_43.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = fma(_193, _193, _199);
    float _209 = rsqrt(_197);
    float _211 = rsqrt(_207);
    float _213 = _179 * _209;
    float _215 = _181 * _209;
    float _217 = _183 * _209;
    float _219 = _187 * _211;
    float _221 = _189 * _211;
    float _223 = _193 * _211;
    float _225 = in.m_45.y;
    float _227 = _213 * _219;
    float _229 = fma(_215, _221, _227);
    float _231 = in.m_47.w;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = fma(_217, _223, _229);
    float _239 = abs(_237);
    float _241 = fma(_239, 1.1764705181121826171875, -0.176470577716827392578125);
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _93 * _205;
    float _247 = fma(_243, -2.0, 3.0);
    float _249 = _243 * _243;
    float _251 = -_245;
    float _253 = _251 + 1.0;
    float _255 = _247 * _249;
    float _257 = _93 * _147;
    float _259 = _255 * _257;
    float _261 = _93 * _235;
    float _263 = in.m_49.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = -_95;
    float _271 = _269 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _273 = _119 + _253;
    float _275 = _273 * 0.3300000131130218505859375;
    float _277 = fma(_225, 0.004999999888241291046142578125, _275);
    float _279 = _259 * _259;
    float _281 = floor(_277);
    float _283 = _279 * _261;
    float _285 = -_281;
    float _287 = _277 + _285;
    float _289 = _93 * _267;
    float _291 = _287 + 0.5;
    int _293 = as_type<int>(_287);
    int _295 = 0;
    int _297 = 7171;
    int _299;
    int _1207 = _65(_293, _295, _297, _299, gl_SubgroupInvocationID);
    int _301 = _1207;
    float _303 = floor(_291);
    float _305 = -_303;
    float _307 = _291 + _305;
    float _309 = 0.0 + _283;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    int _313 = as_type<int>(_307);
    int _315 = 0;
    int _317 = 7171;
    int _319;
    int _1221 = _65(_313, _315, _317, _319, gl_SubgroupInvocationID);
    int _321 = _1221;
    float _323 = _311 * _289;
    uint _1238 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _325 = (as_type<float>(_301) * float4(1.0, -1.0, 1.0, 0.0)[_1238]) + (_287 * float4(1.0, 1.0, -1.0, 1.0)[_1238]);
    bool _329 = _323 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _331 = isnan(_323);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _337 = _333 || _335;
    int _339 = as_type<int>(_325);
    int _341 = 1;
    int _343 = 7171;
    int _345;
    int _1262 = _65(_339, _341, _343, _345, gl_SubgroupInvocationID);
    int _347 = _1262;
    int _349 = as_type<int>(_325);
    int _351 = 2;
    int _353 = 7171;
    int _355;
    int _1265 = _65(_349, _351, _353, _355, gl_SubgroupInvocationID);
    int _357 = _1265;
    float _359 = -_99;
    float _361 = _359 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    uint _1279 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _363 = (as_type<float>(_321) * float4(1.0, -1.0, 1.0, 0.0)[_1279]) + (_307 * float4(1.0, 1.0, -1.0, 1.0)[_1279]);
    int _365 = as_type<int>(_363);
    int _367 = 1;
    int _369 = 7171;
    int _371;
    int _1287 = _65(_365, _367, _369, _371, gl_SubgroupInvocationID);
    int _373 = _1287;
    int _375 = as_type<int>(_363);
    int _377 = 2;
    int _379 = 7171;
    int _381;
    int _1290 = _65(_375, _377, _379, _381, gl_SubgroupInvocationID);
    int _383 = _1290;
    if (!_337)
    {
        discard_fragment();
    }
    float _385 = -_97;
    float _387 = _385 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _389 = _361 * _361;
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _393 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _391;
    float _395 = precise::max(0.0, _225);
    float _397 = fma(_387, _387, _389);
    float _399 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _401 = _399 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _403 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _405 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _403;
    float _407 = 1.0 / _393;
    float _409 = fma(_271, _271, _397);
    float _411 = abs(as_type<float>(_347));
    float _413 = abs(as_type<float>(_357));
    float _415 = _411 + _413;
    float _417 = _415 + (-9.9999997473787516355514526367188e-05);
    float _419 = sqrt(_409);
    float _421 = abs(as_type<float>(_373));
    float _423 = abs(as_type<float>(_383));
    float _425 = _421 + _423;
    bool _427 = _417 >= _425;
    bool _429 = isnan(_417);
    bool _431 = _427 || _429;
    bool _433 = isnan(_425);
    bool _435 = _431 || _433;
    float _437 = 1.0 / _405;
    float _439 = precise::min(_395, 60.0);
    float _441 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _443 = _441 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _445 = !_435;
    float _447 = _445 ? _287 : 0.0;
    float _449 = fma(_439, -0.01666666753590106964111328125, 1.0);
    float _451 = 1.0 / _401;
    float _453 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _455 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _453;
    float _457 = precise::max(0.0, _419);
    float _459 = 0.0 + _447;
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = precise::min(_457, 400.0);
    float _465 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _467 = _461 + _465;
    float _469 = 1.0 / _443;
    float _471 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _473 = _461 + _471;
    float _475 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _477 = _461 + _475;
    float _479 = _467 * _437;
    float _481 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _483 = _461 + _481;
    float _485 = _473 * _407;
    bool _487 = _461 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _489 = isnan(_461);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _455;
    float _501 = fma(_463, -0.0024999999441206455230712890625, 1.0);
    float _503 = _477 * _451;
    float _505 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _507 = _461 + _505;
    float _509 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _511 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _509;
    float _513 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _515 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _513;
    float _517 = _483 * _469;
    float _519 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _519;
    float _523 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _525 = _523 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _527 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _529 = _527 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _531 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _533 = _531 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _535 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _537 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _535;
    float _539 = fma(_515, _485, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _541 = fma(_511, _485, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _543 = _507 * _499;
    float _545 = fma(_521, _485, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _547 = fma(_525, _503, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _549 = fma(_529, _503, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _551 = fma(_533, _503, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _553 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _555 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _553;
    float _557 = fma(_537, _479, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _559 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _561 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _559;
    bool _563 = _461 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _565 = isnan(_461);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -_497;
    float _577 = _575 + 1.0;
    float _579 = fma(_555, _479, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _581 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _583 = _581 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    bool _585 = _461 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _587 = isnan(_461);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = fma(_561, _479, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _599 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _601 = _599 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    bool _603 = _461 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _605 = isnan(_461);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _573 * _577;
    float _617 = -_573;
    float _619 = _617 + 1.0;
    float _621 = fma(_583, _517, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _623 = fma(_601, _517, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _625 = -_595;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _631 = _629 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    bool _633 = _461 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _635 = isnan(_461);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -_613;
    float _647 = _645 + 1.0;
    float _649 = _613 * _619;
    float _651 = fma(_631, _517, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _653 = _497 * _627;
    float _655 = in.m_51.x;
    float _657 = gl_FragCoord.w;
    float _659 = _655 * _657;
    float _661 = in.m_51.y;
    float _663 = gl_FragCoord.w;
    float _665 = _661 * _663;
    float _667 = _643 * _647;
    float _669 = -_643;
    float _671 = _669 + 1.0;
    float _673 = in.m_51.z;
    float _675 = gl_FragCoord.w;
    float _677 = _673 * _675;
    bool _679 = _461 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _681 = isnan(_461);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _539 * _667;
    float _693 = _541 * _667;
    float _695 = _545 * _667;
    float _697 = _501 * _501;
    float _699 = fma(_671, (*spvDescriptorSet0.fp_c9)._m0[107].x, _691);
    float _701 = fma(_671, (*spvDescriptorSet0.fp_c9)._m0[107].y, _693);
    float _703 = fma(_671, (*spvDescriptorSet0.fp_c9)._m0[107].z, _695);
    float _705 = fma(_547, _649, _699);
    float _707 = fma(_549, _649, _701);
    float _709 = fma(_551, _649, _703);
    float _711 = -_689;
    float _713 = _711 + 1.0;
    float _715 = fma(_579, _615, _705);
    float _717 = fma(_557, _615, _707);
    float _719 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _721 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _719;
    float _723 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _725 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _723;
    float _727 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _729 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _727;
    float _731 = fma(_597, _615, _709);
    float _733 = _595 * _713;
    float _735 = fma(_721, _543, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _737 = fma(_725, _543, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _739 = fma(_729, _543, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _741 = fma(_621, _653, _715);
    float _743 = fma(_623, _653, _717);
    float _745 = fma(_651, _653, _731);
    float _747 = _93 * _659;
    float _749 = fma(_735, _733, _741);
    float _751 = fma(_737, _733, _743);
    float _753 = _697 * _697;
    float _755 = fma(_739, _733, _745);
    float _757 = _93 * _665;
    float _759 = _93 * _677;
    float _761 = _747 * _753;
    float _763 = fma(_689, (*spvDescriptorSet0.fp_c9)._m0[112].x, _749);
    float _765 = fma(_689, (*spvDescriptorSet0.fp_c9)._m0[112].y, _751);
    float _767 = fma(_689, (*spvDescriptorSet0.fp_c9)._m0[112].z, _755);
    float _769 = _757 * _753;
    float _771 = _759 * _753;
    float _773 = fma(_763, (*spvDescriptorSet0.fp_c9)._m0[106].x, _761);
    float _775 = _449 * _449;
    float _777 = fma(_765, (*spvDescriptorSet0.fp_c9)._m0[106].x, _769);
    float _779 = fma(_767, (*spvDescriptorSet0.fp_c9)._m0[106].x, _771);
    float _781 = fma(_747, _775, _773);
    float _783 = fma(_757, _775, _777);
    float _785 = fma(_759, _775, _779);
    if (!_337)
    {
        out.m_54.x = _781;
        out.m_54.y = _783;
        out.m_54.z = _785;
        out.m_54.w = _283;
        return out;
    }
    float _787 = _783 * 0.715200006961822509765625;
    float _789 = 0.0 + _323;
    float _791 = precise::clamp(_789, 0.0, 1.0);
    float _793 = fma(_781, 0.2125999927520751953125, _787);
    bool _795 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _797 = fma(_785, 0.072200000286102294921875, _793);
    float _799 = 1.0 / _797;
    float _801 = _799 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _803 = precise::clamp(_801, 0.0, 1.0);
    float _805 = fma(_803, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _807 = _781 * _805;
    float _809 = _783 * _805;
    float _811 = _785 * _805;
    float _813 = _805;
    if (!_795)
    {
        _813 = _791;
    }
    float _815 = _813;
    bool _817 = !_795;
    float _819 = _815;
    if (!_817)
    {
        float _821 = in.m_56.w;
        float _823 = gl_FragCoord.w;
        float _825 = _821 * _823;
        float _827 = in.m_56.z;
        float _829 = gl_FragCoord.w;
        float _831 = _827 * _829;
        float _833 = _93 * _825;
        float _835 = _93 * _831;
        float _837 = 1.0 / _833;
        float _839 = _835 * _837;
        float _841 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _843 = fma(_839, (*spvDescriptorSet0.fp_c8)._m0[30].w, _841);
        float _845 = 1.0 / _843;
        float _847 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _849 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _851 = fma(_845, _847, _849);
        float _853 = _851 * 8.0;
        float _855 = precise::clamp(_853, 0.0, 1.0);
        float _857 = _791 * _855;
        _819 = _857;
    }
    float _859 = _819;
    float _861 = 0.0 + _859;
    float _863 = precise::clamp(_861, 0.0, 1.0);
    out.m_54.x = _807;
    out.m_54.y = _809;
    out.m_54.z = _811;
    out.m_54.w = _863;
    return out;
}

