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
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _63;
    float _97 = _95 * _69;
    float _99 = _95 * _75;
    float _101 = _95 * _81;
    float _103 = _95 * _93;
    float _105 = 1.0 / _97;
    float _107 = _99 * _105;
    float _109 = _101 * _105;
    float _111 = _95 * _87;
    float2 _609 = float2(_107, _109);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
    float2 _620 = float2(_111, _103);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).w;
    float _117 = in.m_39.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_41.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_39.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_41.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_39.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_41.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_35.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_43.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_43.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _95 * _121;
    float _173 = _95 * _127;
    float _175 = _95 * _133;
    float _177 = _95 * _139;
    float _179 = _171 * _171;
    float _181 = _95 * _145;
    float _183 = _173 * _173;
    float _185 = in.m_43.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = fma(_175, _175, _179);
    float _193 = fma(_177, _177, _183);
    float _195 = _95 * _151;
    float _197 = fma(_181, _181, _191);
    float _199 = in.m_45.w;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = fma(_195, _195, _193);
    float _207 = rsqrt(_197);
    float _209 = _95 * _157;
    float _211 = in.m_47.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _209 * _105;
    float _219 = _95 * _163;
    float _221 = sqrt(_205);
    float _223 = in.m_49.w;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _171 * _207;
    float _231 = _175 * _207;
    float _233 = _181 * _207;
    float _235 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _237 = _235 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _239 = _219 * _229;
    float _241 = 1.0 / _237;
    float _243 = 0.0 + _221;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _95 * _169;
    float _249 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _251 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[30].w, _249);
    float _253 = _245 * 2.0;
    float _255 = fma(_247, _231, _239);
    float _257 = _95 * _189;
    float _259 = 1.0 / _251;
    float _261 = precise::max(_253, 0.60000002384185791015625);
    float _263 = fma(_257, _233, _255);
    float _265 = in.m_51.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = precise::min(_261, 0.800000011920928955078125);
    float _273 = abs(_263);
    float _275 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _277 = _273 + _275;
    float _279 = precise::max(_253, 0.300000011920928955078125);
    float _281 = fma(_271, 5.000000476837158203125, -3.000000476837158203125);
    float _283 = precise::min(_279, 0.800000011920928955078125);
    float _285 = _277 * _241;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_283, 2.0, -0.60000002384185791015625);
    float _291 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _293 = _259 * _291;
    float _295 = fma(_287, -2.0, 3.0);
    float _297 = _287 * _287;
    float _299 = _289 * _289;
    float _301 = _295 * _297;
    float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _305 = fma(_113, (*spvDescriptorSet0.fp_c8)._m0[30].w, _303);
    float _307 = fma(_115, _299, _293);
    float _309 = _281 + _115;
    float _311 = 1.0 / _305;
    float _313 = _95 * _227;
    float _315 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _317 = _313 * _309;
    float _319 = _95 * _215;
    float _321 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _323 = -_307;
    float _325 = fma(_311, _321, _323);
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _319 * _317;
    float _331 = _95 * _203;
    float _333 = fma(_327, -2.0, 1.0);
    float _335 = abs(_333);
    float _337 = -_335;
    float _339 = _337 + 1.0;
    float _341 = _339 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _343 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _345 = -_293;
    float _347 = fma(_311, _343, _345);
    float _349 = fma(_299, _329, _341);
    float _351 = _331 * _331;
    float _353 = _347 * _315;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = _95 * _269;
    float _359 = _351 * _349;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _361 * _355;
    float _365 = _363 * _301;
    float _367 = _365 * _357;
    bool _371 = _367 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _373 = isnan(_367);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _379 = _375 || _377;
    float _381 = in.m_47.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = _293;
    if (!_379)
    {
        discard_fragment();
    }
    float _389 = _281 * _351;
    float _391 = in.m_47.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_47.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = -_389;
    float _405 = _403 + 1.0;
    float _407 = _95 * _385;
    float _409 = _407 * _405;
    float _411 = in.m_49.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = _95 * _395;
    float _419 = _95 * _401;
    float _421 = _419 * _405;
    float _423 = _417 * _405;
    float _425 = _95 * _415;
    float _427 = fma(_389, _425, _409);
    float _429 = in.m_49.y;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = _95 * _433;
    float _437 = fma(_389, _435, _421);
    float _439 = in.m_49.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _95 * _443;
    float _447 = fma(_389, _445, _423);
    float _449 = fma(_427, _341, _427);
    float _451 = fma(_437, _341, _437);
    float _453 = fma(_447, _341, _447);
    if (!_379)
    {
        out.m_54.x = _449;
        out.m_54.y = _451;
        out.m_54.z = _453;
        out.m_54.w = _361;
        return out;
    }
    float _455 = _451 * 0.715200006961822509765625;
    float _457 = in.m_56.w;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_56.x;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_56.y;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = fma(_449, 0.2125999927520751953125, _455);
    float _477 = in.m_56.z;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = fma(_453, 0.072200000286102294921875, _475);
    bool _485 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _487 = 1.0 / _483;
    float _489 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_485)
    {
        float _491 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _493 = _293 + _491;
        _387 = _493;
    }
    float _495 = _387;
    float _497 = _487 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _499 = precise::clamp(_497, 0.0, 1.0);
    float _501 = fma(_499, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _503 = _95 * _461;
    if (_485)
    {
        float _505 = _495 * 8.0;
        float _507 = precise::clamp(_505, 0.0, 1.0);
        _489 = _507;
    }
    float _509 = _489;
    float _511 = _95 * _473;
    float _513 = _501 * _503;
    float _515 = 0.0 + _367;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    float _519 = _95 * _467;
    float _521 = _95 * _481;
    float _523 = fma(_451, _513, _511);
    float _525 = _517;
    if (_485)
    {
        float _527 = _517 * _509;
        _525 = _527;
    }
    float _529 = _525;
    float _531 = fma(_449, _513, _519);
    float _533 = fma(_453, _513, _521);
    float _535 = 0.0 + _529;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    out.m_54.x = _531;
    out.m_54.y = _523;
    out.m_54.z = _533;
    out.m_54.w = _537;
    return out;
}

