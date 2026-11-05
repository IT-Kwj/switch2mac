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
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_73 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_44.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _88);
    float _110 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _108);
    float _112 = in.m_44.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = rsqrt(_110);
    float _120 = 1.0 / _80;
    float _122 = _118 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _124 = _118 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _126 = _118 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _128 = _122 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _130 = fma(_124, (*spvDescriptorSet0.fp_c10)._m0[8].y, _128);
    float _132 = fma(_126, (*spvDescriptorSet0.fp_c10)._m0[10].y, _130);
    float _134 = _120 * _116;
    float _136 = _120 * _94;
    float _138 = _120 * _100;
    bool _141 = _132 >= 0.0;
    bool _143 = isnan(_132);
    bool _145 = _141 || _143;
    bool _147 = isnan(0.0);
    bool _149 = _145 || _147;
    float _151 = _120 * _106;
    bool _153 = _132 > 0.0;
    float _155 = 1.0 / _134;
    bool _157 = !_153;
    int _160 = _157 ? 0 : 1;
    int _162 = ~_160;
    int _164 = _162 + 1;
    int _166 = _164 + 1;
    int _168 = _166;
    if (_149)
    {
        int _170 = ~_160;
        int _172 = _170 + 1;
        _168 = _172;
    }
    int _174 = _168;
    float _176 = _120 * _86;
    float _178 = float(_174);
    float _180 = _176 * _155;
    float _182 = _136 * _155;
    float _184 = _138 * _178;
    float2 _877 = float2(_180, _182);
    float _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_877, float2(0.0), isnan(_877))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_877, float2(0.0), isnan(_877))).x;
    float2 _887 = float2(_151, _184);
    float4 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_887, float2(0.0), isnan(_887))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_887, float2(0.0), isnan(_887))).xyzw;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float _197 = _189.w;
    float _199 = in.m_44.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_48.w;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_50.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _219 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _221 = _120 * _203;
    float _223 = _221 * _155;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _227 = fma(_223, (*spvDescriptorSet0.fp_c8)._m0[30].w, _225);
    float _229 = _120 * _209;
    float _231 = 1.0 / _227;
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _235 = fma(_186, (*spvDescriptorSet0.fp_c8)._m0[30].w, _233);
    float _237 = _229 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _239 = 1.0 / _235;
    float _241 = precise::max(_197, _229);
    float _243 = precise::min(_237, _241);
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _247 = _231 * _245;
    float _249 = -_229;
    float _251 = _249 + _243;
    float _253 = _251 * _217;
    float _255 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _257 = -_247;
    float _259 = fma(_239, _255, _257);
    float _261 = _120 * _215;
    float _263 = 0.0 + _253;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _259 * _219;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = _265 * _269;
    float _273 = _271 * _261;
    bool _275 = _273 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _277 = isnan(_273);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _283 = _279 || _281;
    float _285 = _247;
    if (!_283)
    {
        discard_fragment();
    }
    float2 _1034 = float2(_151, _184);
    float2 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1034, float2(0.0), isnan(_1034))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1034, float2(0.0), isnan(_1034))).xy;
    float _291 = _289.x;
    float _293 = _289.y;
    float _295 = in.m_52.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_52.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_52.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_48.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_48.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_48.z;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = _191 * _191;
    float _333 = _193 * _193;
    float _335 = _195 * _195;
    float _337 = -_331;
    float _339 = _337 + 1.0;
    float _341 = -_333;
    float _343 = _341 + 1.0;
    float _345 = -_335;
    float _347 = _345 + 1.0;
    float _349 = _120 * _299;
    float _351 = _120 * _305;
    float _353 = _120 * _311;
    float _355 = _349 * _339;
    float _357 = _351 * _343;
    float _359 = _353 * _347;
    float _361 = _120 * _317;
    float _363 = _120 * _323;
    float _365 = _120 * _329;
    float _367 = fma(_331, _361, _355);
    float _369 = fma(_333, _363, _357);
    float _371 = fma(_335, _365, _359);
    if (!_283)
    {
        out.m_55.x = _367;
        out.m_55.y = _369;
        out.m_55.z = _371;
        out.m_55.w = _253;
        return out;
    }
    float _373 = in.m_57.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_57.x;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_59.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_57.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_59.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_61.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_59.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_61.x;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_61.z;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = _184 * _293;
    float _429 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _431 = _427 * _427;
    float _433 = fma(_291, _291, _431);
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = -_435;
    float _439 = _437 + 1.0;
    float _441 = sqrt(_439);
    float _443 = _120 * _377;
    float _445 = _120 * _383;
    float _447 = _120 * _389;
    float _449 = _120 * _395;
    float _451 = _443 * _443;
    float _453 = _120 * _401;
    float _455 = _447 * _447;
    float _457 = _120 * _407;
    float _459 = fma(_445, _445, _451);
    float _461 = _120 * _413;
    float _463 = fma(_453, _453, _455);
    float _465 = _120 * _419;
    float _467 = fma(_449, _449, _459);
    float _469 = _457 * _457;
    float _471 = fma(_461, _461, _463);
    float _473 = _120 * _425;
    bool _475 = as_type<int>(_429) != 0;
    float _477 = fma(_465, _465, _469);
    float _479 = rsqrt(_467);
    float _481 = fma(_473, _473, _477);
    float _483 = rsqrt(_471);
    float _485 = rsqrt(_481);
    float _487 = _427 * _479;
    float _489 = _443 * _487;
    float _491 = _449 * _487;
    float _493 = _291 * _483;
    float _495 = _445 * _487;
    float _497 = fma(_447, _493, _489);
    float _499 = fma(_453, _493, _495);
    float _501 = fma(_461, _493, _491);
    float _503 = _441 * _485;
    float _505 = fma(_457, _503, _497);
    float _507 = fma(_465, _503, _499);
    float _509 = fma(_473, _503, _501);
    float _511 = in.m_67.x;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    bool _517 = !_475;
    float _519 = -_505;
    float _521 = _517 ? _519 : _505;
    bool _523 = !_475;
    float _525 = -_507;
    float _527 = _523 ? _525 : _507;
    bool _529 = !_475;
    float _531 = -_509;
    float _533 = _529 ? _531 : _509;
    float _535 = _521 * _521;
    float _537 = fma(_527, _527, _535);
    float _539 = fma(_533, _533, _537);
    float _541 = rsqrt(_539);
    float _543 = _527 * _541;
    float _545 = _521 * _541;
    float _547 = _533 * _541;
    float _549 = abs(_543);
    float _551 = abs(_545);
    float _553 = precise::max(_549, _551);
    float _555 = abs(_547);
    float _557 = precise::max(_555, _553);
    float _559 = _120 * _515;
    float _561 = 1.0 / _557;
    float _563 = _543 * _561;
    float _565 = _545 * _561;
    float _567 = -_561;
    float _569 = _547 * _567;
    float _571 = precise::min(_559, 1.0);
    float3 _1441 = float3(_563, _565, _569);
    float3 _575 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1441, float3(0.0), isnan(_1441)), level(_571)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1441, float3(0.0), isnan(_1441)), level(_571)).xyz;
    float _577 = _575.x;
    float _579 = _575.y;
    float _581 = _575.z;
    float _583 = in.m_69.x;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_69.z;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_69.y;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = in.m_71.z;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = in.m_71.x;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = in.m_71.y;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = in.m_73.x;
    float _621 = gl_FragCoord.w;
    float _623 = _619 * _621;
    float _625 = in.m_73.y;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    float _631 = in.m_73.z;
    float _633 = gl_FragCoord.w;
    float _635 = _631 * _633;
    float _637 = in.m_73.w;
    float _639 = gl_FragCoord.w;
    float _641 = _637 * _639;
    bool _643 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_643)
    {
        float _645 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _647 = _247 + _645;
        _285 = _647;
    }
    float _649 = _285;
    float _651 = _120 * _587;
    float _653 = _120 * _593;
    float _655 = _120 * _605;
    float _657 = _120 * _611;
    float _659 = _649;
    if (_643)
    {
        float _661 = _649 * 8.0;
        float _663 = precise::clamp(_661, 0.0, 1.0);
        _659 = _663;
    }
    float _665 = _659;
    float _667 = _120 * _629;
    float _669 = _120 * _635;
    float _671 = fma(_577, 0.20999999344348907470703125, _651);
    float _673 = _120 * _599;
    float _675 = fma(_581, 0.20999999344348907470703125, _653);
    float _677 = _120 * _617;
    float _679 = _671 + _657;
    float _681 = fma(_579, 0.20999999344348907470703125, _673);
    float _683 = _675 + _655;
    float _685 = 0.0 + _273;
    float _687 = precise::clamp(_685, 0.0, 1.0);
    float _689 = _120 * _623;
    float _691 = _681 + _677;
    float _693 = _120 * _641;
    float _695 = _367 * _679;
    float _697 = _371 * _683;
    float _699 = _369 * _691;
    float _701 = _687;
    if (_643)
    {
        float _703 = _687 * _665;
        _701 = _703;
    }
    float _705 = _701;
    float _707 = fma(_695, _693, _689);
    float _709 = fma(_697, _693, _669);
    float _711 = fma(_699, _693, _667);
    float _713 = 0.0 + _705;
    float _715 = precise::clamp(_713, 0.0, 1.0);
    out.m_55.x = _707;
    out.m_55.y = _711;
    out.m_55.z = _709;
    out.m_55.w = _715;
    return out;
}

