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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_58 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_45 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
};

static inline __attribute__((always_inline))
int _67(thread const int& _2752, thread const int& _2753, thread const int& _2754, thread int& _2755, thread uint& gl_SubgroupInvocationID)
{
    int _2758 = _2754 & 31;
    uint _2761 = uint(int(uint(_2754) >> uint(8)));
    int _2763 = int(_2761) & 31;
    float _2765 = as_type<float>(gl_SubgroupInvocationID);
    int _2767 = as_type<int>(_2765) & _2763;
    int _2769 = ~_2763;
    int _2771 = _2758 & _2769;
    int _2773 = _2771 | _2767;
    int _2775 = ~_2763;
    int _2777 = _2753 & _2775;
    int _2779 = _2777 | _2767;
    bool _2781 = uint(_2779) <= uint(_2773);
    _2755 = _2781 ? (-1) : 0;
    float _2783 = spvSubgroupShuffle(as_type<float>(_2752), uint(_2779));
    uint _2785 = uint(_2781 ? as_type<int>(_2783) : _2752);
    return int(_2785);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _71;
    float _87 = _85 * _77;
    float _89 = _85 * _83;
    float2 _1156 = float2(_87, _89);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1156, float2(0.0), isnan(_1156))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1156, float2(0.0), isnan(_1156))).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = in.m_41.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_43.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_41.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_43.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_43.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _85 * _103;
    float _137 = _85 * _109;
    float _139 = _85 * _115;
    float _141 = _85 * _121;
    float _143 = _135 * _135;
    float _145 = _85 * _127;
    float _147 = _85 * _133;
    float _149 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _151 = _139 + _149;
    float _153 = fma(_137, _137, _143);
    float _155 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _157 = _139 + _155;
    float _159 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _161 = _147 + _159;
    float _163 = _151 * _151;
    float _165 = fma(_141, _141, _153);
    float _167 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _169 = _147 + _167;
    float _171 = _157 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _175 = _145 + _173;
    float _177 = rsqrt(_165);
    float _179 = fma(_161, _161, _163);
    float _181 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _183 = _145 + _181;
    float _185 = fma(_169, (*spvDescriptorSet0.fp_c10)._m0[8].x, _171);
    float _187 = _157 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _189 = fma(_175, _175, _179);
    float _191 = fma(_183, (*spvDescriptorSet0.fp_c10)._m0[10].x, _185);
    float _193 = fma(_169, (*spvDescriptorSet0.fp_c10)._m0[8].y, _187);
    float _195 = rsqrt(_189);
    float _197 = _191 * 0.300000011920928955078125;
    float _199 = fma(_183, (*spvDescriptorSet0.fp_c10)._m0[10].y, _193);
    float _201 = _197 * 0.15915493667125701904296875;
    float _203 = _135 * _177;
    float _205 = _137 * _177;
    float _207 = _199 * 0.300000011920928955078125;
    float _209 = _141 * _177;
    float _211 = _203 * _203;
    float _213 = _201 * 6.283185482025146484375;
    float _215 = sin(_213);
    float _217 = _207 * 0.15915493667125701904296875;
    float _219 = fma(_205, _205, _211);
    float _221 = in.m_45.y;
    float _223 = _175 * _195;
    float _225 = _151 * _195;
    float _227 = fma(_209, _209, _219);
    float _229 = _217 * 6.283185482025146484375;
    float _231 = sin(_229);
    float _233 = _161 * _195;
    float _235 = _223 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _237 = _233 * (*spvDescriptorSet0.fp_c10)._m0[10].y;
    float _239 = -_235;
    float _241 = fma(_225, (*spvDescriptorSet0.fp_c10)._m0[10].y, _239);
    float _243 = rsqrt(_227);
    float _245 = -_237;
    float _247 = fma(_223, (*spvDescriptorSet0.fp_c10)._m0[8].y, _245);
    float _249 = (*spvDescriptorSet0.fp_c10)._m0[2].x * (-0.02999999932944774627685546875);
    float _251 = _225 * _247;
    float _253 = _249 * 0.15915493667125701904296875;
    float _255 = _215 * _231;
    float _257 = fma(_233, _241, _251);
    float _259 = in.m_47.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _253 * 6.283185482025146484375;
    float _267 = sin(_265);
    float _269 = in.m_47.w;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = _209 * _243;
    float _277 = _205 * _243;
    float _279 = _203 * _243;
    float _281 = _253 * 6.283185482025146484375;
    float _283 = cos(_281);
    float _285 = _275 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _287 = in.m_47.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = _277 * (*spvDescriptorSet0.fp_c10)._m0[10].y;
    float _295 = _279 * (*spvDescriptorSet0.fp_c10)._m0[8].y;
    float _297 = -_285;
    float _299 = fma(_279, (*spvDescriptorSet0.fp_c10)._m0[10].y, _297);
    float _301 = in.m_47.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = -_293;
    float _309 = fma(_275, (*spvDescriptorSet0.fp_c10)._m0[8].y, _307);
    float _311 = _225 * (*spvDescriptorSet0.fp_c10)._m0[8].y;
    float _313 = -_295;
    float _315 = fma(_277, (*spvDescriptorSet0.fp_c10)._m0[9].y, _313);
    float _317 = _225 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _319 = _225 * _309;
    float _321 = _221 * 0.0005000000237487256526947021484375;
    float _323 = -_311;
    float _325 = fma(_233, (*spvDescriptorSet0.fp_c10)._m0[9].y, _323);
    float _327 = fma(_233, (*spvDescriptorSet0.fp_c10)._m0[8].y, _317);
    float _329 = fma(_233, _299, _319);
    float _331 = _321 * 0.15915493667125701904296875;
    float _333 = fma(_223, _325, _257);
    float _335 = fma(_223, (*spvDescriptorSet0.fp_c10)._m0[10].y, _327);
    float _337 = fma(_223, _315, _329);
    float _339 = _333 * (-0.5);
    float _341 = _331 * 6.283185482025146484375;
    float _343 = sin(_341);
    float _345 = _85 * _263;
    float _347 = _85 * _273;
    float _349 = _85 * _291;
    float _351 = _85 * _305;
    float _353 = _97 * _267;
    float _355 = _97 * _283;
    bool _359 = _255 <= 0.0;
    bool _361 = isnan(_255);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = _335 * (-0.5);
    float _373 = -_353;
    float _375 = fma(_95, _283, _373);
    float _377 = fma(_95, _267, _355);
    float _379 = _331 * 6.283185482025146484375;
    float _381 = cos(_379);
    float _383 = fma(_369, 2.0, -1.0);
    float _385 = fma(_377, 0.100000001490116119384765625, _371);
    float _387 = fma(_375, 0.100000001490116119384765625, _339);
    float _389 = _383 * 0.100000001490116119384765625;
    float _391 = _351 + _387;
    float _393 = fma(_385, _389, _345);
    float _395 = fma(_387, _389, _349);
    float _397 = _347 + _385;
    float _399 = fma(_335, -4.0, _393);
    float _401 = _345 * _343;
    float _403 = fma(_337, -4.0, _395);
    float _405 = _345 * _381;
    float _407 = _399 * _343;
    float _409 = _399 * _381;
    float _411 = -_401;
    float _413 = fma(_349, _381, _411);
    float _415 = fma(_349, _343, _405);
    float _417 = -_407;
    float _419 = fma(_403, _381, _417);
    float _421 = fma(_403, _343, _409);
    float2 _1661 = float2(_391, _397);
    float _423 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1661, float2(0.0), isnan(_1661))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1661, float2(0.0), isnan(_1661))).w;
    float2 _1669 = float2(_413, _415);
    float _425 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1669, float2(0.0), isnan(_1669))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1669, float2(0.0), isnan(_1669))).w;
    float2 _1677 = float2(_419, _421);
    float _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1677, float2(0.0), isnan(_1677))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1677, float2(0.0), isnan(_1677))).w;
    float _429 = -_147;
    float _431 = _429 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _433 = -_139;
    float _435 = _433 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _437 = -_145;
    float _439 = _437 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _441 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _443 = _431 * _431;
    float _445 = fma(_435, _435, _443);
    float _447 = fma(_439, _439, _445);
    float _449 = sqrt(_447);
    float _451 = _441 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _453 = in.m_49.w;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_51.w;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = _449 * _451;
    float _467 = precise::max(0.0, _465);
    float _469 = precise::min(_467, 100.0);
    float _471 = fma(_469, -0.199999988079071044921875, (*spvDescriptorSet0.fp_c8)._m0[29].y);
    float _473 = -_139;
    float _475 = _473 + _471;
    float _477 = _85 * _463;
    float _479 = fma(_475, _475, _443);
    float _481 = precise::max(_465, 100.0);
    float _483 = _85 * _457;
    float _485 = _369 * 0.5;
    float _487 = precise::max(_465, 2.0);
    float _489 = sqrt(_479);
    float _491 = precise::min(_481, 200.0);
    float _493 = fma(_485, _483, _477);
    float _495 = precise::min(_487, 10.0);
    float _497 = precise::max(_489, 5.0);
    float _499 = precise::min(_497, 25.0);
    float _501 = fma(_491, -0.00999999977648258209228515625, 2.0);
    float _503 = fma(_499, -0.0500000007450580596923828125, 1.25);
    float _505 = in.m_53.x;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = _501 * _503;
    float _513 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _515 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _513;
    float _517 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _519 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _517;
    float _521 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _523 = _521 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _525 = fma(_369, 0.25, _423);
    float _527 = floor(_525);
    float _529 = fma(_495, 0.125, -0.25);
    float _531 = _511 * _529;
    float _533 = _531 * _531;
    float _535 = _493 * _533;
    float _537 = _427 + _425;
    float _539 = -_527;
    float _541 = _525 + _539;
    float _543 = _85 * _509;
    float _545 = _537 + 0.1500000059604644775390625;
    float _547 = precise::clamp(_545, 0.0, 1.0);
    float _549 = _541 + 0.5;
    int _551 = as_type<int>(_541);
    int _553 = 0;
    int _555 = 7171;
    int _557;
    int _1871 = _67(_551, _553, _555, _557, gl_SubgroupInvocationID);
    int _559 = _1871;
    float _561 = _535 * _547;
    float _563 = floor(_549);
    float _565 = 0.0 + _561;
    float _567 = precise::clamp(_565, 0.0, 1.0);
    float _569 = _567 * _543;
    bool _571 = _569 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _573 = isnan(_569);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _579 = _575 || _577;
    float _581 = -_563;
    float _583 = _549 + _581;
    int _585 = as_type<int>(_583);
    int _587 = 0;
    int _589 = 7171;
    int _591;
    int _1907 = _67(_585, _587, _589, _591, gl_SubgroupInvocationID);
    int _593 = _1907;
    uint _1920 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _595 = (as_type<float>(_559) * float4(1.0, -1.0, 1.0, 0.0)[_1920]) + (_541 * float4(1.0, 1.0, -1.0, 1.0)[_1920]);
    int _597 = as_type<int>(_595);
    int _599 = 1;
    int _601 = 7171;
    int _603;
    int _1928 = _67(_597, _599, _601, _603, gl_SubgroupInvocationID);
    int _605 = _1928;
    int _607 = as_type<int>(_595);
    int _609 = 2;
    int _611 = 7171;
    int _613;
    int _1931 = _67(_607, _609, _611, _613, gl_SubgroupInvocationID);
    int _615 = _1931;
    uint _1939 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _617 = (as_type<float>(_593) * float4(1.0, -1.0, 1.0, 0.0)[_1939]) + (_583 * float4(1.0, 1.0, -1.0, 1.0)[_1939]);
    int _619 = as_type<int>(_617);
    int _621 = 1;
    int _623 = 7171;
    int _625;
    int _1947 = _67(_619, _621, _623, _625, gl_SubgroupInvocationID);
    int _627 = _1947;
    int _629 = as_type<int>(_617);
    int _631 = 2;
    int _633 = 7171;
    int _635;
    int _1950 = _67(_629, _631, _633, _635, gl_SubgroupInvocationID);
    int _637 = _1950;
    if (!_579)
    {
        discard_fragment();
    }
    float _639 = abs(as_type<float>(_605));
    float _641 = abs(as_type<float>(_615));
    float _643 = _639 + _641;
    float _645 = _643 + (-9.9999997473787516355514526367188e-05);
    float _647 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _649 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _647;
    float _651 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _653 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _651;
    float _655 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _657 = _655 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _659 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _661 = _659 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _663 = 1.0 / _649;
    float _665 = abs(as_type<float>(_627));
    float _667 = abs(as_type<float>(_637));
    float _669 = _665 + _667;
    float _671 = 1.0 / _653;
    bool _673 = _645 >= _669;
    bool _675 = isnan(_645);
    bool _677 = _673 || _675;
    bool _679 = isnan(_669);
    bool _681 = _677 || _679;
    float _683 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _685 = _683 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _687 = 1.0 / _657;
    bool _689 = !_681;
    float _691 = _689 ? _541 : 0.0;
    float _693 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _695 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _693;
    float _697 = 0.0 + _691;
    float _699 = precise::clamp(_697, 0.0, 1.0);
    float _701 = 1.0 / _661;
    float _703 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _705 = _699 + _703;
    float _707 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _709 = _699 + _707;
    float _711 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _713 = _699 + _711;
    float _715 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _717 = _699 + _715;
    float _719 = _705 * _671;
    float _721 = 1.0 / _685;
    float _723 = _709 * _687;
    float _725 = _713 * _663;
    float _727 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _729 = _699 + _727;
    float _731 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _733 = _699 + _731;
    bool _735 = _699 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _737 = isnan(_699);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _749 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _747;
    float _751 = 1.0 / _695;
    float _753 = _717 * _701;
    float _755 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _757 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _755;
    float _759 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _761 = _759 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _763 = fma(_749, _719, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _765 = _699 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _767 = isnan(_699);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_757, _719, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _779 = -_745;
    float _781 = _779 + 1.0;
    float _783 = _729 * _721;
    float _785 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _787 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _785;
    float _789 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _791 = _789 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _793 = fma(_787, _719, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _795 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _797 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _795;
    float _799 = fma(_791, _753, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _801 = _733 * _751;
    float _803 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _805 = _803 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _807 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _809 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _807;
    float _811 = fma(_761, _753, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _813 = fma(_805, _753, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _815 = fma(_809, _725, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _817 = fma(_797, _725, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _819 = fma(_515, _725, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _821 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _823 = _821 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _825 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _827 = _825 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _829 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _831 = _829 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _833 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _835 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _833;
    float _837 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _839 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _837;
    float _841 = fma(_827, _723, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _843 = fma(_823, _723, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _845 = fma(_835, _801, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _847 = fma(_839, _801, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _849 = fma(_519, _801, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _851 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _853 = _851 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _855 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _857 = _855 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    bool _859 = _699 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _861 = isnan(_699);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = fma(_523, _783, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _873 = fma(_831, _723, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    bool _875 = _699 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _877 = isnan(_699);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = fma(_853, _783, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _889 = fma(_857, _783, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _891 = -_775;
    float _893 = _891 + 1.0;
    float _895 = -_869;
    float _897 = _895 + 1.0;
    bool _899 = _699 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _901 = isnan(_699);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = _885 * _781;
    float _913 = _745 * _893;
    float _915 = _775 * _897;
    float _917 = -_885;
    float _919 = _917 + 1.0;
    float _921 = -_909;
    float _923 = _921 + 1.0;
    float _925 = _793 * _911;
    float _927 = _777 * _911;
    float _929 = _763 * _911;
    float _931 = _869 * _923;
    float _933 = fma(_919, (*spvDescriptorSet0.fp_c9)._m0[107].x, _925);
    float _935 = fma(_919, (*spvDescriptorSet0.fp_c9)._m0[107].y, _927);
    float _937 = fma(_919, (*spvDescriptorSet0.fp_c9)._m0[107].z, _929);
    float _939 = in.m_49.y;
    float _941 = gl_FragCoord.w;
    float _943 = _939 * _941;
    float _945 = in.m_49.x;
    float _947 = gl_FragCoord.w;
    float _949 = _945 * _947;
    float _951 = in.m_49.z;
    float _953 = gl_FragCoord.w;
    float _955 = _951 * _953;
    bool _957 = _699 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _959 = isnan(_699);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = fma(_799, _913, _933);
    float _971 = fma(_811, _913, _935);
    float _973 = fma(_813, _913, _937);
    bool _975 = _699 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _977 = isnan(_699);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = -_967;
    float _989 = _987 + 1.0;
    float _991 = fma(_815, _915, _969);
    float _993 = fma(_817, _915, _971);
    float _995 = fma(_819, _915, _973);
    float _997 = _909 * _989;
    float _999 = -_985;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_843, _931, _991);
    float _1005 = fma(_841, _931, _993);
    float _1007 = fma(_873, _931, _995);
    float _1009 = _967 * _1001;
    float _1011 = fma(_845, _997, _1003);
    float _1013 = fma(_847, _997, _1005);
    float _1015 = fma(_849, _997, _1007);
    float _1017 = fma(_887, _1009, _1011);
    float _1019 = fma(_889, _1009, _1013);
    float _1021 = fma(_871, _1009, _1015);
    float _1023 = fma(_985, (*spvDescriptorSet0.fp_c9)._m0[113].x, _1017);
    float _1025 = fma(_985, (*spvDescriptorSet0.fp_c9)._m0[113].y, _1019);
    float _1027 = fma(_985, (*spvDescriptorSet0.fp_c9)._m0[113].z, _1021);
    float _1029 = _1023 + _485;
    float _1031 = _1025 + _485;
    float _1033 = _1027 + _485;
    float _1035 = _85 * _949;
    float _1037 = _85 * _943;
    float _1039 = _85 * _955;
    float _1041 = _1029 + _1035;
    float _1043 = _1031 + _1037;
    float _1045 = _1033 + _1039;
    if (!_579)
    {
        out.m_56.x = _1041;
        out.m_56.y = _1043;
        out.m_56.z = _1045;
        out.m_56.w = _561;
        return out;
    }
    float _1047 = _1043 * 0.715200006961822509765625;
    float _1049 = 0.0 + _569;
    float _1051 = precise::clamp(_1049, 0.0, 1.0);
    float _1053 = fma(_1041, 0.2125999927520751953125, _1047);
    bool _1055 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1057 = fma(_1045, 0.072200000286102294921875, _1053);
    float _1059 = 1.0 / _1057;
    float _1061 = _1059 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1063 = precise::clamp(_1061, 0.0, 1.0);
    float _1065 = fma(_1063, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1067 = _1041 * _1065;
    float _1069 = _1043 * _1065;
    float _1071 = _1045 * _1065;
    float _1073 = _1065;
    if (!_1055)
    {
        _1073 = _1051;
    }
    float _1075 = _1073;
    bool _1077 = !_1055;
    float _1079 = _1075;
    if (!_1077)
    {
        float _1081 = in.m_58.w;
        float _1083 = gl_FragCoord.w;
        float _1085 = _1081 * _1083;
        float _1087 = in.m_58.z;
        float _1089 = gl_FragCoord.w;
        float _1091 = _1087 * _1089;
        float _1093 = _85 * _1085;
        float _1095 = _85 * _1091;
        float _1097 = 1.0 / _1093;
        float _1099 = _1095 * _1097;
        float _1101 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1103 = fma(_1099, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1101);
        float _1105 = 1.0 / _1103;
        float _1107 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1109 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1111 = fma(_1105, _1107, _1109);
        float _1113 = _1111 * 8.0;
        float _1115 = precise::clamp(_1113, 0.0, 1.0);
        float _1117 = _1051 * _1115;
        _1079 = _1117;
    }
    float _1119 = _1079;
    float _1121 = 0.0 + _1119;
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    out.m_56.x = _1067;
    out.m_56.y = _1069;
    out.m_56.z = _1071;
    out.m_56.w = _1123;
    return out;
}

