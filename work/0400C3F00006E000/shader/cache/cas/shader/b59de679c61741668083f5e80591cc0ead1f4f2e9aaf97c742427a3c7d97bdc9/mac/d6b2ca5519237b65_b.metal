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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_58 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _65;
    float _99 = _97 * _71;
    float _101 = _97 * _77;
    float _103 = _97 * _83;
    float _105 = _97 * _89;
    float _107 = 1.0 / _99;
    float _109 = _97 * _95;
    float _111 = _101 * _107;
    float _113 = _103 * _107;
    float2 _660 = float2(_111, _113);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_660, float2(0.0), isnan(_660))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_660, float2(0.0), isnan(_660))).x;
    float2 _671 = float2(_105, _109);
    float2 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_671, float2(0.0), isnan(_671))).xw;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = in.m_39.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_43.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_45.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_47.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _97 * _129;
    float _151 = _149 * _107;
    float _153 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _155 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _157 = fma(_151, (*spvDescriptorSet0.fp_c8)._m0[30].w, _155);
    float _159 = _97 * _135;
    float _161 = 1.0 / _157;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_115, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = _123 * _159;
    float _169 = _97 * _141;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _161 * _171;
    float _175 = 1.0 / _165;
    float _177 = _169 * _167;
    float _179 = 0.0 + _177;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _185 = -_173;
    float _187 = fma(_175, _183, _185);
    float _189 = _187 * _153;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _97 * _147;
    float _195 = _181 * _191;
    float _197 = _195 * _193;
    bool _201 = _197 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _203 = isnan(_197);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _209 = _205 || _207;
    float _211 = in.m_41.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_41.w;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = _173;
    float _225 = _197;
    if (!_209)
    {
        discard_fragment();
    }
    float _227 = _97 * _215;
    float _229 = _97 * _221;
    float2 _832 = float2(_227, _229);
    float2 _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_832, float2(0.0), isnan(_832))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_832, float2(0.0), isnan(_832))).xy;
    float _233 = _231.x;
    float _235 = _231.y;
    float _237 = in.m_49.y;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_49.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_49.z;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_51.y;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_51.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_53.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_53.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_53.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_51.z;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = _97 * _241;
    float _293 = _97 * _247;
    float _295 = _97 * _253;
    float _297 = _97 * _259;
    float _299 = _291 * _291;
    float _301 = _97 * _271;
    float _303 = _97 * _283;
    float _305 = fma(_293, _293, _299);
    float _307 = _301 * _301;
    float _309 = _97 * _289;
    float _311 = fma(_295, _295, _305);
    float _313 = _97 * _265;
    float _315 = _297 * _297;
    float _317 = rsqrt(_311);
    float _319 = fma(_313, _313, _315);
    float _321 = _97 * _277;
    float _323 = fma(_309, _309, _319);
    float _325 = fma(_321, _321, _307);
    float _327 = fma(_303, _303, _325);
    float _329 = rsqrt(_323);
    float _331 = _291 * _317;
    float _333 = _293 * _317;
    float _335 = _295 * _317;
    float _337 = _331 * _331;
    float _339 = rsqrt(_327);
    float _341 = fma(_333, _333, _337);
    float _343 = fma(_335, _335, _341);
    float _345 = rsqrt(_343);
    float _347 = _303 * _339;
    float _349 = _235 * _235;
    float _351 = _233 * _233;
    float _353 = _349 * _349;
    float _355 = _349 * _339;
    float _357 = _349 * _347;
    float _359 = fma(_351, _351, _353);
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _351 * _329;
    float _365 = _301 * _355;
    float _367 = _321 * _355;
    float _369 = -_361;
    float _371 = _369 + 1.0;
    float _373 = fma(_309, _363, _357);
    float _375 = fma(_297, _363, _365);
    float _377 = fma(_313, _363, _367);
    float _379 = sqrt(_371);
    float _381 = _345 * _379;
    float _383 = fma(_331, _381, _375);
    float _385 = fma(_333, _381, _377);
    float _387 = fma(_335, _381, _373);
    float _389 = _383 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _391 = _383 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _393 = fma(_385, (*spvDescriptorSet0.fp_c8)._m0[0].x, _389);
    float _395 = fma(_385, (*spvDescriptorSet0.fp_c8)._m0[1].x, _391);
    float _397 = fma(_387, (*spvDescriptorSet0.fp_c8)._m0[0].z, _393);
    float _399 = fma(_387, (*spvDescriptorSet0.fp_c8)._m0[1].z, _395);
    float _401 = fma(_397, 0.5, 0.5);
    float _403 = fma(_399, -0.5, 0.5);
    float2 _1095 = float2(_401, _403);
    float _405 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1095, float2(0.0), isnan(_1095))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1095, float2(0.0), isnan(_1095))).x;
    float _407 = in.m_45.y;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_45.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_45.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_43.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_43.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_43.z;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = -_121;
    float _445 = _443 + 1.0;
    float _447 = _97 * _417;
    float _449 = _97 * _423;
    float _451 = _405 * _405;
    float _453 = _97 * _411;
    float _455 = _445 * _451;
    float _457 = -_455;
    float _459 = _457 + 1.0;
    float _461 = _453 * _459;
    float _463 = _447 * _459;
    float _465 = _97 * _429;
    float _467 = _97 * _435;
    float _469 = _449 * _459;
    float _471 = _97 * _441;
    float _473 = fma(_455, _465, _463);
    float _475 = fma(_455, _467, _461);
    float _477 = fma(_455, _471, _469);
    float _479 = _451 * _473;
    float _481 = _451 * _475;
    float _483 = _451 * _477;
    float _485 = -_479;
    float _487 = _473 + _485;
    float _489 = -_481;
    float _491 = _475 + _489;
    float _493 = -_483;
    float _495 = _477 + _493;
    float _497 = fma(_121, _487, _479);
    float _499 = fma(_121, _491, _481);
    float _501 = fma(_121, _495, _483);
    float _503 = fma(_451, 0.25, _497);
    float _505 = fma(_451, 0.25, _499);
    float _507 = fma(_451, 0.25, _501);
    if (!_209)
    {
        out.m_56.x = _503;
        out.m_56.y = _505;
        out.m_56.z = _507;
        out.m_56.w = _177;
        return out;
    }
    float _509 = _505 * 0.715200006961822509765625;
    float _511 = in.m_58.w;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_58.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_58.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = fma(_503, 0.2125999927520751953125, _509);
    float _531 = in.m_58.z;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    bool _537 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _539 = fma(_507, 0.072200000286102294921875, _529);
    float _541 = 1.0 / _539;
    if (_537)
    {
        float _543 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _545 = _173 + _543;
        _223 = _545;
    }
    float _547 = _223;
    float _549 = _541 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _551 = precise::clamp(_549, 0.0, 1.0);
    float _553 = fma(_551, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _555 = _97 * _515;
    float _557 = _97 * _527;
    float _559 = _553 * _555;
    float _561 = 0.0 + _197;
    float _563 = precise::clamp(_561, 0.0, 1.0);
    float _565 = _563;
    if (_537)
    {
        float _567 = _547 * 8.0;
        float _569 = precise::clamp(_567, 0.0, 1.0);
        _225 = _569;
    }
    float _571 = _225;
    float _573 = _97 * _521;
    float _575 = _97 * _535;
    float _577 = fma(_505, _559, _557);
    if (_537)
    {
        float _579 = _563 * _571;
        _565 = _579;
    }
    float _581 = _565;
    float _583 = fma(_503, _559, _573);
    float _585 = fma(_507, _559, _575);
    float _587 = 0.0 + _581;
    float _589 = precise::clamp(_587, 0.0, 1.0);
    out.m_56.x = _583;
    out.m_56.y = _577;
    out.m_56.z = _585;
    out.m_56.w = _589;
    return out;
}

