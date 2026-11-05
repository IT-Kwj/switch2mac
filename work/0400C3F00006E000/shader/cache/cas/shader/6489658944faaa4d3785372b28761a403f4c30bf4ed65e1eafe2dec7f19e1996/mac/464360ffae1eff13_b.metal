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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_47 [[user(locn5), flat]];
    float4 m_49 [[user(locn6)]];
    float4 m_41 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_41.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_41.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_43.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_45.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _101 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _103 = in.m_43.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _99);
    float _111 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _101);
    float _113 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _109);
    float _115 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _111);
    float _117 = _113 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _119 = _115 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _121 = 1.0 / _67;
    float _123 = _121 * _73;
    float _125 = _121 * _79;
    float _127 = _121 * _85;
    float _129 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _131 = _123 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _133 = in.m_43.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = _123 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _141 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _129);
    float _143 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[2].x, _131);
    float _145 = in.m_45.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _123 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _153 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.125;
    float _155 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[2].z, _143);
    float _157 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[0].x, _139);
    float _159 = in.m_45.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[1].x, _151);
    float _167 = _155 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _169 = floor(_153);
    float _171 = in.m_45.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _141);
    float _179 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[0].z, _157);
    float _181 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[1].z, _165);
    float _183 = _121 * _91;
    float _185 = _177 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _187 = _179 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _189 = 1.0 / _167;
    float _191 = _181 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _193 = _121 * _97;
    float _195 = _121 * _107;
    float _197 = 1.0 / _183;
    float _199 = _169 * 0.37999999523162841796875;
    float _201 = _121 * _137;
    float _203 = _185 * _189;
    float _205 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.00200000009499490261077880859375;
    float _207 = _121 * _149;
    float _209 = -_119;
    float _211 = fma(_191, _203, _209);
    float _213 = fma(_169, 0.20999999344348907470703125, _205);
    float _215 = -_117;
    float _217 = fma(_187, _203, _215);
    float _219 = _201 * _197;
    float _221 = fma(_211, 0.699999988079071044921875, _213);
    float _223 = _121 * _175;
    float _225 = fma(_217, 0.699999988079071044921875, _199);
    float _227 = _121 * _163;
    float _229 = _195 * _197;
    float2 _861 = float2(_193, _223);
    float _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_861, float2(0.0), isnan(_861))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_861, float2(0.0), isnan(_861))).w;
    float2 _872 = float2(_207, _227);
    float3 _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_872, float2(0.0), isnan(_872))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_872, float2(0.0), isnan(_872))).xyw;
    float _237 = _235.x;
    float _239 = _235.y;
    float _241 = _235.z;
    float2 _886 = float2(_229, _219);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_886, float2(0.0), isnan(_886))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_886, float2(0.0), isnan(_886))).x;
    float2 _894 = float2(_225, _221);
    float _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_894, float2(0.0), isnan(_894))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_894, float2(0.0), isnan(_894))).w;
    float _247 = in.m_47.x;
    float _249 = fma(_247, 0.5, 0.5);
    float _251 = _249 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _253 = -_231;
    float _255 = _253 + 1.0;
    float _257 = _251 * _255;
    float _259 = fma(_239, 2.0, -1.0);
    float _261 = fma(_237, 2.0, -1.0);
    float _263 = fma(_259, _257, _223);
    float _265 = fma(_261, _257, _193);
    float2 _933 = float2(_265, _263);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_933, float2(0.0), isnan(_933))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_933, float2(0.0), isnan(_933))).w;
    float _269 = in.m_49.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_49.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_43.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_51.w;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = _121 * _273;
    float _295 = _121 * _279;
    float _297 = _121 * _285;
    float _299 = _293 + (-0.5);
    float _301 = _295 + (-0.5);
    float _303 = in.m_53.w;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = _299 * _299;
    float _311 = _297 * _197;
    float _313 = _241 * _245;
    float _315 = fma(_301, _301, _309);
    float _317 = -_169;
    float _319 = _153 + _317;
    float _321 = _121 * _291;
    float _323 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _325 = fma(_311, (*spvDescriptorSet0.fp_c8)._m0[30].w, _323);
    float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _329 = fma(_243, (*spvDescriptorSet0.fp_c8)._m0[30].w, _327);
    float _331 = fma(_319, 2.0, -1.0);
    float _333 = sqrt(_315);
    float _335 = fma(_321, 2.0, -1.0);
    float _337 = _313 * _313;
    float _339 = in.m_55.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = _241 + _335;
    float _347 = 1.0 / _325;
    float _349 = precise::max(_345, 0.100000001490116119384765625);
    float _351 = precise::min(_349, 0.89999997615814208984375);
    float _353 = fma(_333, -5.000000476837158203125, 2.5000002384185791015625);
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = 1.0 / _329;
    float _359 = fma(_351, 1.25000011920928955078125, -0.12500001490116119384765625);
    float _361 = fma(_355, -2.0, 3.0);
    float _363 = _355 * _355;
    float _365 = _361 * _363;
    float _367 = -_331;
    float _369 = fma(_367, _331, 1.0);
    float _371 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _373 = _347 * _371;
    float _375 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _377 = _337 * _369;
    float _379 = _377 * _365;
    float _381 = _121 * _307;
    float _383 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _385 = -_373;
    float _387 = fma(_357, _383, _385);
    float _389 = _121 * _343;
    float _391 = in.m_53.y;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_51.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_53.z;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_51.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = _121 * _413;
    float _417 = _267 * _359;
    float _419 = _387 * _375;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = fma(_381, _417, _379);
    float _425 = 0.0 + _423;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _427 * _421;
    float _431 = _429 * _389;
    bool _435 = _431 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _437 = isnan(_431);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _443 = _439 || _441;
    float _445 = in.m_51.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_53.x;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = _373;
    if (!_443)
    {
        discard_fragment();
    }
    float _459 = _121 * _395;
    float _461 = _121 * _407;
    float _463 = -_461;
    float _465 = _463 + _415;
    float _467 = fma(_417, _465, _461);
    float _469 = fma(_379, 20.0, _467);
    float _471 = _121 * _449;
    float _473 = _121 * _455;
    float _475 = _121 * _401;
    float _477 = -_473;
    float _479 = _477 + _471;
    float _481 = -_459;
    float _483 = _481 + _475;
    float _485 = fma(_417, _479, _473);
    float _487 = fma(_417, _483, _459);
    float _489 = fma(_379, 20.0, _485);
    float _491 = fma(_379, 20.0, _487);
    if (!_443)
    {
        out.m_58.x = _489;
        out.m_58.y = _491;
        out.m_58.z = _469;
        out.m_58.w = _423;
        return out;
    }
    float _493 = _491 * 0.715200006961822509765625;
    float _495 = in.m_60.w;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_60.x;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_60.y;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = fma(_489, 0.2125999927520751953125, _493);
    float _515 = in.m_60.z;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = fma(_469, 0.072200000286102294921875, _513);
    bool _523 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _525 = 1.0 / _521;
    float _527 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_523)
    {
        float _529 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _531 = _373 + _529;
        _457 = _531;
    }
    float _533 = _457;
    float _535 = _525 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    float _539 = fma(_537, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _541 = _121 * _499;
    if (_523)
    {
        float _543 = _533 * 8.0;
        float _545 = precise::clamp(_543, 0.0, 1.0);
        _527 = _545;
    }
    float _547 = _527;
    float _549 = _121 * _511;
    float _551 = _539 * _541;
    float _553 = 0.0 + _431;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    float _557 = _121 * _505;
    float _559 = _121 * _519;
    float _561 = fma(_491, _551, _549);
    float _563 = _555;
    if (_523)
    {
        float _565 = _555 * _547;
        _563 = _565;
    }
    float _567 = _563;
    float _569 = fma(_489, _551, _557);
    float _571 = fma(_469, _551, _559);
    float _573 = 0.0 + _567;
    float _575 = precise::clamp(_573, 0.0, 1.0);
    out.m_58.x = _569;
    out.m_58.y = _561;
    out.m_58.z = _571;
    out.m_58.w = _575;
    return out;
}

