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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float2 _633 = float2(_83, _85);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_633, float2(0.0), isnan(_633))).w;
    float _89 = in.m_41.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_43.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_39.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_41.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_41.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _81 * _93;
    float _133 = _81 * _99;
    float _135 = 1.0 / _131;
    float _137 = _81 * _123;
    float _139 = _81 * _129;
    float _141 = _139 * _135;
    float _143 = fma(_87, -0.4000000059604644775390625, 0.20000000298023223876953125);
    float _145 = _133 + _143;
    float _147 = _81 * _105;
    float _149 = _81 * _111;
    float _151 = _81 * _117;
    float _153 = _137 * _135;
    float2 _731 = float2(_147, _151);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_731, float2(0.0), isnan(_731))).w;
    float2 _739 = float2(_149, _145);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_739, float2(0.0), isnan(_739))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_739, float2(0.0), isnan(_739))).w;
    float2 _747 = float2(_153, _141);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_747, float2(0.0), isnan(_747))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_747, float2(0.0), isnan(_747))).x;
    float _161 = in.m_41.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_45.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_47.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_49.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_51.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _193 = _81 * _165;
    float _195 = _193 * _135;
    float _197 = _81 * _171;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _201 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _199);
    float _203 = 1.0 / _201;
    float _205 = in.m_53.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_55.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = fma(_155, 0.25, _157);
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _221 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _219);
    float _223 = _81 * _189;
    float _225 = _197 + _217;
    float _227 = _81 * _177;
    float _229 = 1.0 / _221;
    float _231 = _87 + _225;
    float _233 = _227 + 0.4000000059604644775390625;
    float _235 = precise::max(_227, _231);
    float _237 = _81 * _183;
    float _239 = precise::min(_233, _235);
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _243 = _203 * _241;
    float _245 = -_227;
    float _247 = _245 + _239;
    float _249 = _247 * 2.5;
    float _251 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _253 = -_243;
    float _255 = fma(_229, _251, _253);
    float _257 = _237 * _249;
    float _259 = _255 * _191;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = 0.0 + _257;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _265 * _261;
    float _269 = _267 * _223;
    bool _273 = _269 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _275 = isnan(_269);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _281 = _277 || _279;
    float _283 = in.m_49.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_47.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _243;
    if (!_281)
    {
        discard_fragment();
    }
    float _297 = in.m_47.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_47.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_53.x;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = _81 * _215;
    float _317 = _81 * _287;
    float _319 = _81 * _293;
    float _321 = -_317;
    float _323 = _321 + _319;
    float _325 = _197 * _87;
    float _327 = precise::max(_197, 0.89999997615814208984375);
    float _329 = fma(_325, _323, _317);
    float _331 = precise::min(_327, 1.0);
    float _333 = in.m_49.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = _81 * _301;
    float _341 = in.m_49.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _81 * _337;
    float _349 = -_347;
    float _351 = _349 + _339;
    float _353 = _81 * _345;
    float _355 = fma(_325, _351, _347);
    float _357 = _81 * _307;
    float _359 = in.m_53.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = -_353;
    float _367 = _365 + _357;
    float _369 = fma(_325, _367, _353);
    float _371 = _81 * _313;
    float _373 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _375 = _371 + _373;
    float _377 = _81 * _363;
    float _379 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _381 = _377 + _379;
    float _383 = _81 * _209;
    float _385 = in.m_55.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _381 * _381;
    float _393 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _395 = _383 + _393;
    float _397 = fma(_375, _375, _391);
    float _399 = fma(_395, _395, _397);
    float _401 = rsqrt(_399);
    float _403 = _375 * _401;
    float _405 = _381 * _401;
    float _407 = _395 * _401;
    float _409 = _81 * _389;
    float _411 = in.m_55.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = _409 * _409;
    float _419 = _81 * _415;
    float _421 = fma(_419, _419, _417);
    float _423 = fma(_315, _315, _421);
    float _425 = rsqrt(_423);
    float _427 = _405 * _405;
    float _429 = _409 * _425;
    float _431 = _419 * _425;
    float _433 = _315 * _425;
    float _435 = _429 * _429;
    float _437 = fma(_431, _431, _435);
    float _439 = fma(_433, _433, _437);
    float _441 = rsqrt(_439);
    float _443 = _431 * _441;
    float _445 = _429 * _441;
    float _447 = _433 * _441;
    float _449 = fma(_403, _403, _427);
    float _451 = fma(_407, _407, _449);
    float _453 = rsqrt(_451);
    float _455 = _405 * _453;
    float _457 = _403 * _453;
    float _459 = _407 * _453;
    float _461 = _445 * _455;
    float _463 = fma(_443, _457, _461);
    float _465 = fma(_447, _459, _463);
    float _467 = abs(_465);
    float _469 = _467 + (-1.10000002384185791015625);
    float _471 = -_469;
    float _473 = 0.0 + _471;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = fma(_475, -2.0, 3.0);
    float _479 = _475 * _475;
    float _481 = _477 * _479;
    float _483 = abs(_465);
    float _485 = fma(_483, -2.8571426868438720703125, 1.71428573131561279296875);
    float _487 = precise::clamp(_485, 0.0, 1.0);
    float _489 = _481 * _155;
    float _491 = fma(_487, -2.0, 3.0);
    float _493 = _487 * _487;
    float _495 = fma(_331, 9.9999980926513671875, -8.9999980926513671875);
    float _497 = fma(_491, _493, _489);
    float _499 = _497 + _495;
    float _501 = -_249;
    float _503 = _501 + 1.0;
    float _505 = _499 + _503;
    float _507 = precise::clamp(_505, 0.0, 1.0);
    float _509 = _237 * 2.0;
    float _511 = fma(_507, _509, _329);
    float _513 = fma(_507, _509, _355);
    float _515 = fma(_507, _509, _369);
    if (!_281)
    {
        out.m_58.x = _511;
        out.m_58.y = _513;
        out.m_58.z = _515;
        out.m_58.w = _257;
        return out;
    }
    float _517 = _513 * 0.715200006961822509765625;
    float _519 = in.m_60.w;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_60.x;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_60.y;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = fma(_511, 0.2125999927520751953125, _517);
    float _539 = in.m_60.z;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = fma(_515, 0.072200000286102294921875, _537);
    bool _547 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _549 = 1.0 / _545;
    float _551 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_547)
    {
        float _553 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _555 = _243 + _553;
        _295 = _555;
    }
    float _557 = _295;
    float _559 = _549 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _561 = precise::clamp(_559, 0.0, 1.0);
    float _563 = fma(_561, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _565 = _81 * _523;
    if (_547)
    {
        float _567 = _557 * 8.0;
        float _569 = precise::clamp(_567, 0.0, 1.0);
        _551 = _569;
    }
    float _571 = _551;
    float _573 = _81 * _529;
    float _575 = _563 * _565;
    float _577 = 0.0 + _269;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    float _581 = _81 * _535;
    float _583 = _81 * _543;
    float _585 = fma(_511, _575, _573);
    float _587 = _579;
    if (_547)
    {
        float _589 = _579 * _571;
        _587 = _589;
    }
    float _591 = _587;
    float _593 = fma(_513, _575, _581);
    float _595 = fma(_515, _575, _583);
    float _597 = 0.0 + _591;
    float _599 = precise::clamp(_597, 0.0, 1.0);
    out.m_58.x = _585;
    out.m_58.y = _593;
    out.m_58.z = _595;
    out.m_58.w = _599;
    return out;
}

