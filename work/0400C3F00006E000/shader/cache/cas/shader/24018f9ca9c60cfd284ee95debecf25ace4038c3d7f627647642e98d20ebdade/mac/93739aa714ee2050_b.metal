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
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_43 [[user(locn5), flat]];
    float4 m_35 [[user(locn6)]];
    float4 m_53 [[user(locn7), flat]];
    float4 m_39 [[user(locn8)]];
    float4 m_41 [[user(locn9)]];
    float4 m_58 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_35.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_37.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _65;
    float _99 = _97 * _71;
    float _101 = _97 * _77;
    float _103 = _97 * _83;
    float _105 = _97 * _89;
    float _107 = 1.0 / _99;
    float _109 = _101 * _107;
    float _111 = _103 * _107;
    float _113 = _97 * _95;
    float2 _713 = float2(_109, _111);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_713, float2(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_713, float2(0.0), isnan(_713))).x;
    float2 _724 = float2(_105, _113);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724))).w;
    float _119 = in.m_39.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_41.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_39.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_41.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_41.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_43.x;
    float _157 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _159 = _157 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _161 = _97 * _123;
    float _163 = _97 * _129;
    float _165 = _97 * _135;
    float _167 = _97 * _141;
    float _169 = _161 * _161;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _173 = _163 + _171;
    float _175 = _97 * _147;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _179 = _167 + _177;
    float _181 = fma(_165, _165, _169);
    float _183 = _97 * _153;
    float _185 = _173 * _173;
    float _187 = in.m_43.z;
    float _189 = fma(_175, _175, _181);
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _193 = _183 + _191;
    float _195 = fma(_179, _179, _185);
    float _197 = -_155;
    float _199 = _163 + _197;
    float _201 = -_167;
    float _203 = _201 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _205 = fma(_193, _193, _185);
    float _207 = fma(_193, _193, _195);
    float _209 = rsqrt(_189);
    float _211 = -_163;
    float _213 = _211 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _215 = _203 * _203;
    float _217 = rsqrt(_207);
    float _219 = _161 * _209;
    float _221 = _165 * _209;
    float _223 = _175 * _209;
    float _225 = rsqrt(_205);
    float _227 = _219 * _219;
    float _229 = _179 * _217;
    float _231 = _173 * _217;
    float _233 = fma(_221, _221, _227);
    float _235 = _193 * _217;
    float _237 = _229 * _229;
    float _239 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _241 = fma(_223, _223, _233);
    float _243 = -_187;
    float _245 = _183 + _243;
    float _247 = fma(_231, _231, _237);
    float _249 = -_183;
    float _251 = _249 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _253 = in.m_35.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _245 * _245;
    float _261 = fma(_235, _235, _247);
    float _263 = rsqrt(_241);
    float _265 = _173 * _225;
    float _267 = fma(_199, _199, _259);
    float _269 = fma(_213, _213, _215);
    float _271 = _193 * _225;
    float _273 = fma(_251, _251, _269);
    float _275 = rsqrt(_261);
    float _277 = _219 * _263;
    float _279 = 1.0 / _159;
    float _281 = _221 * _263;
    float _283 = _223 * _263;
    float _285 = _229 * _275;
    float _287 = rsqrt(_267);
    float _289 = _231 * _275;
    float _291 = _235 * _275;
    float _293 = _277 * _285;
    float _295 = _97 * _257;
    float _297 = fma(_281, _289, _293);
    float _299 = _295 * _107;
    float _301 = in.m_45.w;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = sqrt(_273);
    float _309 = fma(_283, _291, _297);
    float _311 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _313 = fma(_299, (*spvDescriptorSet0.fp_c8)._m0[30].w, _311);
    float _315 = _239 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _317 = in.m_47.w;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = abs(_309);
    float _325 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _327 = _323 + _325;
    float _329 = _199 * _287;
    float _331 = _245 * _287;
    float _333 = _327 * _279;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _329 * _265;
    float _339 = in.m_49.w;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = 1.0 / _313;
    float _347 = fma(_335, -2.0, 3.0);
    float _349 = -_271;
    float _351 = -_337;
    float _353 = fma(_331, _349, _351);
    float _355 = _307 * _315;
    float _357 = _335 * _335;
    float _359 = precise::max(_353, -1.0);
    float _361 = precise::max(_355, 5.0);
    float _363 = _347 * _357;
    float _365 = precise::min(_361, 10.0);
    float _367 = _363 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _371 = _345 * _369;
    float _373 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _375 = fma(_115, (*spvDescriptorSet0.fp_c8)._m0[30].w, _373);
    float _377 = _97 * _305;
    float _379 = fma(_365, 0.20000000298023223876953125, -1.0);
    float _381 = 1.0 / _375;
    float _383 = fma(_377, 2.0, -1.0);
    float _385 = _117 + _383;
    float _387 = precise::min(0.0, _359);
    float _389 = precise::max(_385, 0.4000000059604644775390625);
    float _391 = _387 + 1.0;
    float _393 = precise::min(_389, 0.60000002384185791015625);
    float _395 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _397 = -_371;
    float _399 = fma(_381, _395, _397);
    float _401 = fma(_117, 0.85000002384185791015625, 0.14999997615814208984375);
    float _403 = fma(_393, 4.999999523162841796875, -1.99999988079071044921875);
    float _405 = precise::max(_399, 0.100000001490116119384765625);
    float _407 = _97 * _343;
    float _409 = precise::min(_405, 1.0);
    float _411 = fma(_409, 1.111111164093017578125, -0.11111111938953399658203125);
    float _413 = _97 * _321;
    float _415 = in.m_51.x;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = _391 * _411;
    float _423 = _413 * _421;
    float _425 = in.m_53.x;
    float _427 = _423 * _379;
    float _429 = _427 * _401;
    float _431 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _433 = _429 * _403;
    float _435 = fma(_407, _433, _367);
    float _437 = _407 * _407;
    float _439 = _437 * _435;
    float _441 = _399 * _431;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = _97 * _419;
    float _447 = _439 * _425;
    float _449 = 0.0 + _447;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    float _453 = _451 * _443;
    float _455 = _453 * _445;
    bool _459 = _455 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _461 = isnan(_455);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _467 = _463 || _465;
    float _469 = in.m_45.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_45.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_45.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_47.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_47.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_47.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = _371;
    if (!_467)
    {
        discard_fragment();
    }
    float _507 = precise::max(_117, 0.449999988079071044921875);
    float _509 = precise::min(_507, 0.800000011920928955078125);
    float _511 = _97 * _473;
    float _513 = _97 * _479;
    float _515 = _97 * _485;
    float _517 = _97 * _491;
    float _519 = _97 * _497;
    float _521 = _97 * _503;
    float _523 = -_511;
    float _525 = _523 + _517;
    float _527 = -_513;
    float _529 = _527 + _519;
    float _531 = -_515;
    float _533 = _531 + _521;
    float _535 = fma(_391, _525, _511);
    float _537 = fma(_391, _529, _513);
    float _539 = fma(_391, _533, _515);
    float _541 = fma(_509, 2.8571426868438720703125, -1.28571414947509765625);
    float _543 = _367 * _437;
    float _545 = _541 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _547 = fma(_545, 0.0500000007450580596923828125, _535);
    float _549 = fma(_545, 1.2000000476837158203125, _537);
    float _551 = fma(_545, 0.800000011920928955078125, _539);
    float _553 = fma(_517, _543, _547);
    float _555 = fma(_519, _543, _549);
    float _557 = fma(_521, _543, _551);
    if (!_467)
    {
        out.m_56.x = _553;
        out.m_56.y = _555;
        out.m_56.z = _557;
        out.m_56.w = _447;
        return out;
    }
    float _559 = _555 * 0.715200006961822509765625;
    float _561 = in.m_58.w;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_58.x;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_58.y;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = fma(_553, 0.2125999927520751953125, _559);
    float _581 = in.m_58.z;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = fma(_557, 0.072200000286102294921875, _579);
    bool _589 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _591 = 1.0 / _587;
    float _593 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_589)
    {
        float _595 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _597 = _371 + _595;
        _505 = _597;
    }
    float _599 = _505;
    float _601 = _591 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    float _605 = fma(_603, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _607 = _97 * _565;
    if (_589)
    {
        float _609 = _599 * 8.0;
        float _611 = precise::clamp(_609, 0.0, 1.0);
        _593 = _611;
    }
    float _613 = _593;
    float _615 = _97 * _577;
    float _617 = _605 * _607;
    float _619 = 0.0 + _455;
    float _621 = precise::clamp(_619, 0.0, 1.0);
    float _623 = _97 * _571;
    float _625 = _97 * _585;
    float _627 = fma(_555, _617, _615);
    float _629 = _621;
    if (_589)
    {
        float _631 = _621 * _613;
        _629 = _631;
    }
    float _633 = _629;
    float _635 = fma(_553, _617, _623);
    float _637 = fma(_557, _617, _625);
    float _639 = 0.0 + _633;
    float _641 = precise::clamp(_639, 0.0, 1.0);
    out.m_56.x = _635;
    out.m_56.y = _627;
    out.m_56.z = _637;
    out.m_56.w = _641;
    return out;
}

