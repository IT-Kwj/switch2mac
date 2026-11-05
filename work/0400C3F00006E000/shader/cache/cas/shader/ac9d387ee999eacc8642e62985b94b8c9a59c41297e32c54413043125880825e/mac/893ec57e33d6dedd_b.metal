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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_52 [[user(locn4), flat]];
    float4 m_46 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_46.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_46.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_48.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_48.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_48.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_50.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_50.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = 1.0 / _80;
    float _126 = _124 * _86;
    float _128 = _124 * _92;
    float _130 = _124 * _98;
    float _132 = _124 * _104;
    float _134 = _124 * _110;
    float _136 = _124 * _116;
    float2 _691 = float2(_126, _128);
    float2 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_691, float2(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_691, float2(0.0), isnan(_691))).xy;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _124 * _122;
    float _148 = 1.0 / _130;
    float _150 = _132 * _148;
    float _152 = _134 * _148;
    float2 _717 = float2(_150, _152);
    float _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_717, float2(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_717, float2(0.0), isnan(_717))).x;
    float2 _725 = float2(_136, _146);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_725, float2(0.0), isnan(_725))).w;
    float _158 = in.m_52.x;
    float _160 = in.m_46.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_46.w;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _124 * _170;
    float _174 = fma(_142, 2.0, -1.0);
    float _176 = fma(_144, 2.0, -1.0);
    float _178 = _158 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _180 = _158 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _182 = _124 * _164;
    float _184 = fma(_180, _176, _172);
    float _186 = fma(_178, _174, _182);
    float2 _781 = float2(_186, _184);
    float4 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_781, float2(0.0), isnan(_781))).xyzw;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float _197 = _189.w;
    float _199 = in.m_48.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_54.w;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_56.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_58.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _225 = _124 * _203;
    float _227 = _225 * _148;
    float _229 = _124 * _209;
    float _231 = _124 * _215;
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _235 = fma(_227, (*spvDescriptorSet0.fp_c8)._m0[30].w, _233);
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _239 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[30].w, _237);
    float _241 = _124 * _221;
    float _243 = 1.0 / _239;
    float _245 = 1.0 / _235;
    float _247 = in.m_56.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_54.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_56.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _124 * _257;
    float _267 = -_229;
    float _269 = fma(_197, _156, _267);
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _273 = _245 * _271;
    float _275 = _231 * _269;
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _279 = -_273;
    float _281 = fma(_243, _277, _279);
    float _283 = 0.0 + _275;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _281 * _223;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = _285 * _289;
    float _293 = _291 * _241;
    bool _297 = _293 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _299 = isnan(_293);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _305 = _301 || _303;
    float _307 = in.m_54.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_54.y;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_56.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = _273;
    if (!_305)
    {
        discard_fragment();
    }
    float _327 = _124 * _251;
    float _329 = _124 * _311;
    float _331 = _124 * _317;
    float _333 = _124 * _323;
    float _335 = _124 * _263;
    float _337 = -_327;
    float _339 = _331 + _337;
    float _341 = -_333;
    float _343 = _329 + _341;
    float _345 = -_335;
    float _347 = _265 + _345;
    float _349 = fma(_193, _339, _327);
    float _351 = fma(_191, _343, _333);
    float _353 = fma(_195, _347, _335);
    if (!_305)
    {
        out.m_61.x = _351;
        out.m_61.y = _349;
        out.m_61.z = _353;
        out.m_61.w = _275;
        return out;
    }
    float _355 = in.m_63.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_63.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_63.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = _124 * _359;
    float _375 = _124 * _365;
    float _377 = _124 * _371;
    float _379 = _373 * _373;
    float _381 = in.m_65.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma(_375, _375, _379);
    float _389 = fma(_377, _377, _387);
    float _391 = rsqrt(_389);
    float _393 = _375 * _391;
    float _395 = _373 * _391;
    float _397 = _377 * _391;
    float _399 = _124 * _385;
    float _401 = abs(_393);
    float _403 = abs(_395);
    float _405 = precise::max(_401, _403);
    float _407 = precise::min(_399, 1.0);
    float _409 = abs(_397);
    float _411 = precise::max(_409, _405);
    float _413 = 1.0 / _411;
    float _415 = -_413;
    float _417 = _397 * _415;
    float _419 = _393 * _413;
    float _421 = _395 * _413;
    float3 _1115 = float3(_419, _421, _417);
    float3 _425 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1115, float3(0.0), isnan(_1115)), level(_407)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1115, float3(0.0), isnan(_1115)), level(_407)).xyz;
    float _427 = _425.x;
    float _429 = _425.y;
    float _431 = _425.z;
    float _433 = in.m_67.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_67.y;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_67.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_69.x;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_69.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_69.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_71.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_71.x;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_71.y;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_73.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_73.z;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_73.w;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_73.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    bool _511 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _513 = _124 * _437;
    float _515 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _517 = _515 + 1.0;
    float _519 = _124 * _443;
    float _521 = _124 * _449;
    float _523 = _124 * _455;
    float _525 = fma(_513, (*spvDescriptorSet0.fp_c13)._m0[0].y, _517);
    float _527 = fma(_519, (*spvDescriptorSet0.fp_c13)._m0[0].y, _517);
    float _529 = fma(_521, (*spvDescriptorSet0.fp_c13)._m0[0].y, _517);
    float _531 = _124 * _473;
    float _533 = _124 * _479;
    float _535 = _349 * _527;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    float _539 = _124 * _461;
    float _541 = _353 * _529;
    float _543 = precise::clamp(_541, 0.0, 1.0);
    float _545 = _124 * _485;
    if (_511)
    {
        float _547 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _549 = _273 + _547;
        _325 = _549;
    }
    float _551 = _325;
    float _553 = _351 * _525;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    float _557 = _124 * _491;
    float _559 = _124 * _509;
    float _561 = _551;
    if (_511)
    {
        float _563 = _551 * 8.0;
        float _565 = precise::clamp(_563, 0.0, 1.0);
        _561 = _565;
    }
    float _567 = _561;
    float _569 = _124 * _497;
    float _571 = fma(_427, 0.20999999344348907470703125, _523);
    float _573 = _124 * _467;
    float _575 = fma(_431, 0.20999999344348907470703125, _539);
    float _577 = _124 * _503;
    float _579 = _571 + _533;
    float _581 = fma(_429, 0.20999999344348907470703125, _573);
    float _583 = _575 + _531;
    float _585 = 0.0 + _293;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    float _589 = _555 * _579;
    float _591 = _581 + _545;
    float _593 = _543 * _583;
    float _595 = _587;
    if (_511)
    {
        float _597 = _587 * _567;
        _595 = _597;
    }
    float _599 = _595;
    float _601 = fma(_589, _577, _557);
    float _603 = _537 * _591;
    float _605 = fma(_593, _577, _569);
    float _607 = 0.0 + _599;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    float _611 = fma(_603, _577, _559);
    out.m_61.x = _601;
    out.m_61.y = _611;
    out.m_61.z = _605;
    out.m_61.w = _609;
    return out;
}

