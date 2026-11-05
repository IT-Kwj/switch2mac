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
    float4 m_51 [[user(locn2), flat]];
    float4 m_39 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
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
    float _97 = in.m_41.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _65;
    float _111 = _109 * _71;
    float _113 = _109 * _77;
    float _115 = _109 * _83;
    float _117 = _109 * _89;
    float _119 = 1.0 / _111;
    float _121 = _109 * _101;
    float _123 = _113 * _119;
    float _125 = _115 * _119;
    float _127 = _109 * _95;
    float _129 = _109 * _107;
    float2 _662 = float2(_123, _125);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_662, float2(0.0), isnan(_662))).x;
    float2 _673 = float2(_117, _127);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_673, float2(0.0), isnan(_673))).w;
    float2 _681 = float2(_129, _121);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_681, float2(0.0), isnan(_681))).w;
    float _137 = in.m_39.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_43.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_45.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_47.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _109 * _141;
    float _163 = _161 * _119;
    float _165 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = 1.0 / _169;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _175 = _171 * _173;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _179 = fma(_131, (*spvDescriptorSet0.fp_c8)._m0[30].w, _177);
    float _181 = _133 * _133;
    float _183 = _181 * _135;
    float _185 = 1.0 / _179;
    float _187 = _109 * _147;
    float _189 = _187 + 0.4000000059604644775390625;
    float _191 = precise::max(_187, _183);
    float _193 = precise::min(_189, _191);
    float _195 = _109 * _153;
    float _197 = -_187;
    float _199 = _197 + _193;
    float _201 = _195 * _133;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _207 = -_175;
    float _209 = fma(_185, _205, _207);
    float _211 = _109 * _159;
    float _213 = fma(_199, 2.5, _203);
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _209 * _165;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _215 * _219;
    float _223 = _221 * _211;
    bool _227 = _223 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _229 = isnan(_223);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _235 = _231 || _233;
    float _237 = in.m_49.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_49.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _175;
    if (!_235)
    {
        discard_fragment();
    }
    float _251 = _109 * _241;
    float _253 = _109 * _247;
    float2 _857 = float2(_251, _253);
    float _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_857, float2(0.0), isnan(_857))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_857, float2(0.0), isnan(_857))).w;
    float _257 = in.m_51.y;
    float _259 = in.m_51.x;
    float _261 = in.m_51.z;
    float _263 = in.m_53.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_53.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _277 = in.m_53.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _275);
    float _285 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _283);
    float _287 = rsqrt(_285);
    float _289 = -_257;
    float _291 = _289 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _293 = -_259;
    float _295 = _293 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _297 = -_261;
    float _299 = _297 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _301 = _291 * _291;
    float _303 = _287 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _305 = fma(_295, _295, _301);
    float _307 = _287 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _309 = _287 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _311 = fma(_299, _299, _305);
    float _313 = rsqrt(_311);
    float _315 = _295 * _313;
    float _317 = _291 * _313;
    float _319 = _299 * _313;
    float _321 = _307 * _315;
    float _323 = _303 * _317;
    float _325 = _309 * _319;
    float _327 = -_321;
    float _329 = fma(_309, _317, _327);
    float _331 = -_323;
    float _333 = fma(_307, _319, _331);
    float _335 = -_325;
    float _337 = fma(_303, _315, _335);
    float _339 = _109 * _267;
    float _341 = _315 * _329;
    float _343 = _109 * _273;
    float _345 = _319 * _337;
    float _347 = -_257;
    float _349 = _347 + _339;
    float _351 = -_341;
    float _353 = fma(_319, _333, _351);
    float _355 = -_259;
    float _357 = _355 + _343;
    float _359 = _109 * _281;
    float _361 = -_345;
    float _363 = fma(_317, _329, _361);
    float _365 = _317 * _333;
    float _367 = _349 * _353;
    float _369 = -_261;
    float _371 = _369 + _359;
    float _373 = _337 * _349;
    float _375 = -_365;
    float _377 = fma(_315, _337, _375);
    float _379 = fma(_357, _363, _367);
    float _381 = in.m_45.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma(_333, _357, _373);
    float _389 = in.m_43.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma(_371, _377, _379);
    float _397 = in.m_43.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = fma(_329, _371, _387);
    float _405 = in.m_45.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _395 * _395;
    float _413 = in.m_43.z;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = fma(_403, _403, _411);
    float _421 = in.m_45.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = sqrt(_419);
    float _429 = precise::max(0.0, _427);
    float _431 = _109 * _401;
    float _433 = precise::min(_429, 2.0);
    float _435 = _109 * _417;
    float _437 = _433 * 0.5;
    float _439 = _109 * _425;
    float _441 = sqrt(_437);
    bool _443 = _255 >= _441;
    bool _445 = isnan(_255);
    bool _447 = _443 || _445;
    bool _449 = isnan(_441);
    bool _451 = _447 || _449;
    float _453 = _109 * _385;
    float _455 = _109 * _393;
    bool _457 = !_451;
    float _459 = _457 ? 0.0 : 0.75;
    float _461 = -_453;
    float _463 = _461 + _431;
    float _465 = -_133;
    float _467 = _465 + _459;
    float _469 = _109 * _409;
    float _471 = fma(_467, 0.5, _133);
    float _473 = -_439;
    float _475 = _473 + _455;
    float _477 = -_469;
    float _479 = _477 + _435;
    float _481 = fma(_471, _463, _453);
    float _483 = fma(_471, _475, _439);
    float _485 = fma(_471, _479, _469);
    if (!_235)
    {
        out.m_56.x = _481;
        out.m_56.y = _483;
        out.m_56.z = _485;
        out.m_56.w = _215;
        return out;
    }
    float _487 = _483 * 0.715200006961822509765625;
    float _489 = in.m_58.w;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_58.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_58.y;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = fma(_481, 0.2125999927520751953125, _487);
    float _509 = in.m_58.z;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = fma(_485, 0.072200000286102294921875, _507);
    bool _517 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _519 = 1.0 / _515;
    float _521 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_517)
    {
        float _523 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _525 = _175 + _523;
        _249 = _525;
    }
    float _527 = _249;
    float _529 = _519 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _531 = precise::clamp(_529, 0.0, 1.0);
    float _533 = fma(_531, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _535 = _109 * _493;
    if (_517)
    {
        float _537 = _527 * 8.0;
        float _539 = precise::clamp(_537, 0.0, 1.0);
        _521 = _539;
    }
    float _541 = _521;
    float _543 = _109 * _505;
    float _545 = _533 * _535;
    float _547 = 0.0 + _223;
    float _549 = precise::clamp(_547, 0.0, 1.0);
    float _551 = _109 * _499;
    float _553 = _109 * _513;
    float _555 = fma(_483, _545, _543);
    float _557 = _549;
    if (_517)
    {
        float _559 = _549 * _541;
        _557 = _559;
    }
    float _561 = _557;
    float _563 = fma(_481, _545, _551);
    float _565 = fma(_485, _545, _553);
    float _567 = 0.0 + _561;
    float _569 = precise::clamp(_567, 0.0, 1.0);
    out.m_56.x = _563;
    out.m_56.y = _555;
    out.m_56.z = _565;
    out.m_56.w = _569;
    return out;
}

