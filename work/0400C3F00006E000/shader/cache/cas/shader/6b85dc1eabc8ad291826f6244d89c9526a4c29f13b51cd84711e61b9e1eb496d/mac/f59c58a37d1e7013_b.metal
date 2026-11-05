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
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c10 [[id(2)]];
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
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_41.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _61;
    float _107 = _105 * _67;
    float _109 = _105 * _73;
    float _111 = _105 * _79;
    float _113 = _105 * _85;
    float _115 = 1.0 / _107;
    float _117 = _105 * _91;
    float _119 = _109 * _115;
    float _121 = _111 * _115;
    float _123 = _105 * _97;
    float _125 = _105 * _103;
    float2 _654 = float2(_119, _121);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_654, float2(0.0), isnan(_654))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_654, float2(0.0), isnan(_654))).x;
    float2 _665 = float2(_113, _123);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_665, float2(0.0), isnan(_665))).w;
    float2 _673 = float2(_125, _117);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_673, float2(0.0), isnan(_673))).w;
    float _133 = in.m_39.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_43.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_45.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_47.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _105 * _137;
    float _159 = _157 * _115;
    float _161 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = 1.0 / _165;
    float _169 = _105 * _143;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _167 * _171;
    float _175 = in.m_45.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_43.z;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_45.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _105 * _179;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = _129 + _131;
    float _201 = _105 * _149;
    float _203 = 1.0 / _197;
    float _205 = _199 + (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = (*spvDescriptorSet0.fp_c10)._m0[13].z * (*spvDescriptorSet0.fp_c10)._m0[13].z;
    float _211 = -_169;
    float _213 = _207 + _211;
    float _215 = _209 * _209;
    float _217 = _201 * _213;
    float _219 = _217 * _215;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _225 = -_173;
    float _227 = fma(_203, _223, _225);
    float _229 = _105 * _155;
    float _231 = _227 * _161;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _221 * _233;
    float _237 = _235 * _229;
    bool _241 = _237 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _243 = isnan(_237);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _249 = _245 || _247;
    float _251 = in.m_49.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = _173;
    if (!_249)
    {
        discard_fragment();
    }
    float _259 = in.m_45.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_43.y;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_43.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _105 * _255;
    float _279 = precise::max(_277, 0.5);
    float _281 = precise::min(_279, 1.0);
    float _283 = fma(_281, 2.0, -1.0);
    float _285 = _105 * _263;
    float _287 = _283 * _283;
    float _289 = _105 * _269;
    float _291 = _287 * _287;
    float _293 = _207 + _291;
    float _295 = _291 * 3.0;
    float _297 = _105 * _275;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    float _303 = _285 * _301;
    float _305 = _105 * _185;
    float _307 = _193 * _301;
    float _309 = _105 * _191;
    float _311 = fma(_293, _289, _303);
    float _313 = fma(_293, _305, _307);
    float _315 = _309 * _301;
    float _317 = fma(_311, _295, _311);
    float _319 = fma(_313, _295, _313);
    float _321 = fma(_293, _297, _315);
    float _323 = -_319;
    float _325 = _317 + _323;
    bool _327 = _317 >= _319;
    bool _329 = isnan(_317);
    bool _331 = _327 || _329;
    bool _333 = isnan(_319);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = fma(_321, _295, _321);
    float _341 = fma(_337, _325, _319);
    float _343 = -_317;
    float _345 = _343 + _319;
    float _347 = _337 + (-1.0);
    float _349 = -_339;
    float _351 = _349 + _341;
    bool _353 = _339 >= _341;
    bool _355 = isnan(_339);
    bool _357 = _353 || _355;
    bool _359 = isnan(_341);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_337, _345, _317);
    float _367 = -_341;
    float _369 = _339 + _367;
    float _371 = -_337;
    float _373 = _371 + 0.666666686534881591796875;
    float _375 = fma(_363, _351, _339);
    float _377 = fma(_363, _369, _341);
    float _379 = -_373;
    float _381 = _347 + _379;
    float _383 = precise::min(_365, _375);
    float _385 = -_365;
    float _387 = _385 + _375;
    float _389 = fma(_363, _381, _373);
    float _391 = precise::max(0.0, (*spvDescriptorSet0.fp_c10)._m0[2].x);
    float _393 = -_383;
    float _395 = _377 + _393;
    float _397 = precise::min(_391, 20.0);
    float _399 = fma(_395, 6.0, 1.0000000133514319600180897396058e-10);
    float _401 = 1.0 / _399;
    float _403 = fma(_387, _401, _389);
    float _405 = abs(_403);
    float _407 = fma(_397, 0.0500000007450580596923828125, _405);
    float _409 = spvFAdd(_377, 1.0000000133514319600180897396058e-10);
    float _411 = _407 + 0.666666686534881591796875;
    float _413 = _407 + 0.3333333432674407958984375;
    float _415 = floor(_407);
    float _417 = fma(_407, 6.0, 4.0);
    float _419 = fma(_407, 6.0, 2.0);
    float _421 = floor(_411);
    float _423 = floor(_413);
    float _425 = -_415;
    float _427 = _407 + _425;
    float _429 = fma(_427, 6.0, -3.0);
    float _431 = 1.0 / _409;
    float _433 = fma(_421, -6.0, _417);
    float _435 = abs(_429);
    float _437 = _435 + (-1.0);
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = _433 + (-3.0);
    float _443 = _439 + (-1.0);
    float _445 = fma(_423, -6.0, _419);
    float _447 = abs(_441);
    float _449 = _447 + (-1.0);
    float _451 = precise::clamp(_449, 0.0, 1.0);
    float _453 = _445 + (-3.0);
    float _455 = abs(_453);
    float _457 = _455 + (-1.0);
    float _459 = precise::clamp(_457, 0.0, 1.0);
    float _461 = _395 * _431;
    float _463 = _451 + (-1.0);
    float _465 = _459 + (-1.0);
    float _467 = fma(_461, _443, 1.0);
    float _469 = fma(_461, _463, 1.0);
    float _471 = fma(_461, _465, 1.0);
    float _473 = _377 * _467;
    float _475 = _377 * _469;
    float _477 = _377 * _471;
    if (!_249)
    {
        out.m_52.x = _473;
        out.m_52.y = _475;
        out.m_52.z = _477;
        out.m_52.w = _221;
        return out;
    }
    float _479 = _475 * 0.715200006961822509765625;
    float _481 = in.m_54.w;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_54.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_54.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = fma(_473, 0.2125999927520751953125, _479);
    float _501 = in.m_54.z;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = fma(_477, 0.072200000286102294921875, _499);
    bool _509 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _511 = 1.0 / _507;
    float _513 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_509)
    {
        float _515 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _517 = _173 + _515;
        _257 = _517;
    }
    float _519 = _257;
    float _521 = _511 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = fma(_523, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _527 = _105 * _485;
    if (_509)
    {
        float _529 = _519 * 8.0;
        float _531 = precise::clamp(_529, 0.0, 1.0);
        _513 = _531;
    }
    float _533 = _513;
    float _535 = _105 * _497;
    float _537 = _525 * _527;
    float _539 = 0.0 + _237;
    float _541 = precise::clamp(_539, 0.0, 1.0);
    float _543 = _105 * _491;
    float _545 = _105 * _505;
    float _547 = fma(_475, _537, _535);
    float _549 = _541;
    if (_509)
    {
        float _551 = _541 * _533;
        _549 = _551;
    }
    float _553 = _549;
    float _555 = fma(_473, _537, _543);
    float _557 = fma(_477, _537, _545);
    float _559 = 0.0 + _553;
    float _561 = precise::clamp(_559, 0.0, 1.0);
    out.m_52.x = _555;
    out.m_52.y = _547;
    out.m_52.z = _557;
    out.m_52.w = _561;
    return out;
}

