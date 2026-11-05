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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_49 [[user(locn5), flat]];
    float4 m_43 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_43.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _65;
    float _111 = _109 * _71;
    float _113 = _109 * _77;
    float _115 = _109 * _83;
    float _117 = _109 * _89;
    float _119 = _109 * _95;
    float _121 = _109 * _101;
    float2 _618 = float2(_111, _113);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_618, float2(0.0), isnan(_618))).w;
    float _125 = _109 * _107;
    float _127 = 1.0 / _115;
    float _129 = _117 * _127;
    float _131 = _119 * _127;
    float2 _640 = float2(_129, _131);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_640, float2(0.0), isnan(_640))).x;
    float2 _648 = float2(_121, _125);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_648, float2(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_648, float2(0.0), isnan(_648))).w;
    float _137 = in.m_39.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _109 * _141;
    float _151 = fma(_123, (*spvDescriptorSet0.fp_c9)._m0[191].w, _149);
    float _153 = _109 * _147;
    float2 _685 = float2(_153, _151);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_685, float2(0.0), isnan(_685))).w;
    float _157 = in.m_45.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_47.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_47.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_45.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_47.z;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_45.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _109 * _161;
    float _195 = _109 * _167;
    float _197 = _109 * _173;
    float _199 = _109 * _179;
    float _201 = _193 * _193;
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _205 = _195 + _203;
    float _207 = _109 * _185;
    float _209 = _109 * _191;
    float _211 = fma(_199, _199, _201);
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _215 = _197 + _213;
    float _217 = _205 * _205;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _221 = _207 + _219;
    float _223 = fma(_209, _209, _211);
    float _225 = in.m_41.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = fma(_215, _215, _217);
    float _233 = precise::max(_135, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _235 = rsqrt(_223);
    float _237 = fma(_221, _221, _231);
    float _239 = precise::min(_233, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _241 = rsqrt(_237);
    float _243 = in.m_49.x;
    float _245 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _247 = _239 + _245;
    float _249 = _193 * _235;
    float _251 = _199 * _235;
    float _253 = _209 * _235;
    float _255 = _249 * _249;
    float _257 = _205 * _241;
    float _259 = _215 * _241;
    float _261 = _221 * _241;
    float _263 = fma(_251, _251, _255);
    float _265 = _257 * _257;
    float _267 = fma(_253, _253, _263);
    float _269 = fma(_259, _259, _265);
    float _271 = rsqrt(_267);
    float _273 = fma(_261, _261, _269);
    float _275 = rsqrt(_273);
    float _277 = _249 * _271;
    float _279 = _251 * _271;
    float _281 = _253 * _271;
    float _283 = in.m_51.w;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _257 * _275;
    float _291 = _277 * _289;
    float _293 = _259 * _275;
    float _295 = -_243;
    float _297 = 1.0 / _295;
    float _299 = _261 * _275;
    float _301 = fma(_279, _293, _291);
    float _303 = _109 * _229;
    float _305 = fma(_281, _299, _301);
    float _307 = _303 * _127;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _311 = fma(_133, (*spvDescriptorSet0.fp_c8)._m0[30].w, _309);
    float _313 = -_243;
    float _315 = abs(_305);
    float _317 = _313 + _315;
    float _319 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _321 = fma(_307, (*spvDescriptorSet0.fp_c8)._m0[30].w, _319);
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _325 = (*spvDescriptorSet0.fp_c9)._m0[191].z + _323;
    float _327 = _317 * _297;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = 1.0 / _321;
    float _333 = fma(_329, -2.0, 3.0);
    float _335 = _329 * _329;
    float _337 = _333 * _335;
    float _339 = 1.0 / _311;
    float _341 = in.m_53.w;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _109 * _287;
    float _349 = in.m_55.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _357 = _331 * _355;
    float _359 = 1.0 / _325;
    float _361 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _363 = -_357;
    float _365 = fma(_339, _361, _363);
    float _367 = _347 * _365;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = -_369;
    float _373 = _371 + 1.0;
    float _375 = _247 * _359;
    float _377 = in.m_53.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_53.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = _155 * _337;
    float _391 = fma(_155, _373, _389);
    float _393 = _109 * _345;
    float _395 = _391 * _375;
    float _397 = _393 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _399 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _401 = precise::max(_393, _395);
    float _403 = precise::min(_397, _401);
    float _405 = _109 * _353;
    float _407 = -_393;
    float _409 = _407 + _403;
    float _411 = _409 * _399;
    float _413 = 0.0 + _411;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _415 * _405;
    bool _421 = _417 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _423 = isnan(_417);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _429 = _425 || _427;
    float _431 = in.m_51.x;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_51.y;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_51.z;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_53.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    if (!_429)
    {
        discard_fragment();
    }
    float _455 = _109 * _381;
    float _457 = _109 * _435;
    float _459 = _109 * _441;
    float _461 = _109 * _447;
    float _463 = _109 * _453;
    float _465 = _109 * _387;
    float _467 = -_457;
    float _469 = _467 + _455;
    float _471 = _155 * _155;
    float _473 = -_459;
    float _475 = _473 + _463;
    float _477 = -_461;
    float _479 = _477 + _465;
    float _481 = fma(_471, _469, _457);
    float _483 = fma(_471, _475, _459);
    float _485 = fma(_471, _479, _461);
    float _487 = _461;
    if (!_429)
    {
        out.m_58.x = _481;
        out.m_58.y = _483;
        out.m_58.z = _485;
        out.m_58.w = _411;
        return out;
    }
    float _489 = _483 * 0.715200006961822509765625;
    float _491 = fma(_481, 0.2125999927520751953125, _489);
    float _493 = fma(_485, 0.072200000286102294921875, _491);
    bool _495 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _497 = 1.0 / _493;
    float _499 = 0.0 + _417;
    float _501 = precise::clamp(_499, 0.0, 1.0);
    float _503 = _501;
    if (_495)
    {
        float _505 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _507 = _357 + _505;
        _487 = _507;
    }
    float _509 = _487;
    float _511 = _497 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _513 = precise::clamp(_511, 0.0, 1.0);
    float _515 = _509;
    if (_495)
    {
        float _517 = _509 * 8.0;
        float _519 = precise::clamp(_517, 0.0, 1.0);
        _515 = _519;
    }
    float _521 = _515;
    float _523 = fma(_513, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_495)
    {
        float _525 = _501 * _521;
        _503 = _525;
    }
    float _527 = _503;
    float _529 = _481 * _523;
    float _531 = _483 * _523;
    float _533 = _485 * _523;
    float _535 = 0.0 + _527;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    out.m_58.x = _529;
    out.m_58.y = _531;
    out.m_58.z = _533;
    out.m_58.w = _537;
    return out;
}

