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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_43 [[user(locn5), flat]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_62 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _69;
    float _85 = _83 * _75;
    float _87 = _83 * _81;
    float2 _619 = float2(_87, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_619, float2(0.0), isnan(_619))).x;
    float _91 = in.m_41.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.x;
    float _123 = _83 * _95;
    float _125 = _83 * _101;
    float _127 = _83 * _107;
    float _129 = _83 * _113;
    float _131 = 1.0 / _123;
    float _133 = _83 * _119;
    float _135 = _125 * _131;
    float _137 = _127 * _131;
    float _139 = fma(_89, 2.0, -1.0);
    float _141 = fma(_139, _121, _129);
    float _143 = fma(_139, _121, _133);
    float2 _704 = float2(_135, _137);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_704, float2(0.0), isnan(_704))).x;
    float2 _712 = float2(_141, _143);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_712, float2(0.0), isnan(_712))).xyw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = in.m_41.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_45.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_47.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _177 = _83 * _161;
    float _179 = _177 * _131;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = _83 * _167;
    float _187 = 1.0 / _183;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _191 = _187 * _189;
    float _193 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _195 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _193);
    float _197 = 1.0 / _195;
    float _199 = -_185;
    float _201 = _199 + _155;
    float _203 = -_185;
    float _205 = _203 + 1.0;
    float _207 = _201 * _205;
    float _209 = _207 * 4.0;
    float _211 = 0.0 + _209;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = -_191;
    float _219 = fma(_197, _215, _217);
    float _221 = _219 * _175;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _83 * _173;
    float _227 = _213 * _223;
    float _229 = _227 * _225;
    bool _233 = _229 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _235 = isnan(_229);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _241 = _237 || _239;
    float _243 = in.m_49.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_49.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = _191;
    if (!_241)
    {
        discard_fragment();
    }
    float _257 = _83 * _247;
    float _259 = _83 * _253;
    float2 _871 = float2(_257, _259);
    float3 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_871, float2(0.0), isnan(_871))).xyz;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = _261.z;
    float _269 = in.m_51.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_51.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_51.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_53.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_53.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_55.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_55.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_53.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = abs(_151);
    float _319 = log2(_317);
    float _321 = in.m_55.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = 2.0 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _329 = abs(_153);
    float _331 = log2(_329);
    float _333 = _83 * _273;
    float _335 = _83 * _279;
    float _337 = _83 * _285;
    float _339 = _319 * 0.5;
    float _341 = _333 * _333;
    float _343 = _83 * _297;
    float _345 = _83 * _315;
    float _347 = fma(_335, _335, _341);
    float _349 = exp2(_339);
    float _351 = _83 * _325;
    float _353 = fma(_337, _337, _347);
    float _355 = _83 * _291;
    float _357 = _355 * _355;
    float _359 = rsqrt(_353);
    float _361 = fma(_343, _343, _357);
    float _363 = _331 * 0.5;
    float _365 = _83 * _303;
    float _367 = _83 * _309;
    float _369 = fma(_345, _345, _361);
    float _371 = fma(_349, _327, -1.0);
    float _373 = _365 * _365;
    float _375 = exp2(_363);
    float _377 = fma(_367, _367, _373);
    float _379 = in.m_57.y;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = _333 * _359;
    float _387 = _335 * _359;
    float _389 = fma(_351, _351, _377);
    float _391 = rsqrt(_369);
    float _393 = _385 * _385;
    float _395 = _337 * _359;
    float _397 = in.m_45.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_45.z;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = fma(_387, _387, _393);
    float _411 = fma(_375, _327, -1.0);
    float _413 = rsqrt(_389);
    float _415 = fma(_395, _395, _409);
    float _417 = in.m_57.z;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = _411 * _411;
    float _425 = fma(_371, _371, _423);
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = rsqrt(_415);
    float _431 = _355 * _391;
    float _433 = -_427;
    float _435 = _433 + 1.0;
    float _437 = _411 * _431;
    float _439 = in.m_57.w;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = sqrt(_435);
    float _447 = _365 * _413;
    float _449 = in.m_45.x;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = fma(_371, _447, _437);
    float _457 = in.m_57.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = _385 * _429;
    float _465 = fma(_463, _445, _455);
    float _467 = fma(_465, -0.5, 0.5);
    float _469 = precise::max(_467, 0.60000002384185791015625);
    float _471 = precise::min(_469, 1.0);
    float _473 = _83 * _443;
    float _475 = fma(_471, 2.5000002384185791015625, -1.5000002384185791015625);
    float _477 = _83 * _453;
    float _479 = _83 * _401;
    float _481 = _83 * _407;
    float _483 = _473 * _475;
    float _485 = _263 + _477;
    float _487 = _265 + _479;
    float _489 = _267 + _481;
    float _491 = _83 * _461;
    float _493 = _83 * _383;
    float _495 = _83 * _421;
    float _497 = fma(_491, _483, _485);
    float _499 = fma(_493, _483, _487);
    float _501 = fma(_495, _483, _489);
    if (!_241)
    {
        out.m_60.x = _497;
        out.m_60.y = _499;
        out.m_60.z = _501;
        out.m_60.w = _209;
        return out;
    }
    float _503 = _499 * 0.715200006961822509765625;
    float _505 = in.m_62.w;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_62.x;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_62.y;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = fma(_497, 0.2125999927520751953125, _503);
    float _525 = in.m_62.z;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    bool _531 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _533 = fma(_501, 0.072200000286102294921875, _523);
    float _535 = 1.0 / _533;
    if (_531)
    {
        float _537 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _539 = _191 + _537;
        _255 = _539;
    }
    float _541 = _255;
    float _543 = _535 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _545 = precise::clamp(_543, 0.0, 1.0);
    float _547 = fma(_545, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _549 = _83 * _509;
    float _551 = _509;
    if (_531)
    {
        float _553 = _541 * 8.0;
        float _555 = precise::clamp(_553, 0.0, 1.0);
        _551 = _555;
    }
    float _557 = _551;
    float _559 = _83 * _521;
    float _561 = _547 * _549;
    float _563 = 0.0 + _229;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    float _567 = _83 * _515;
    float _569 = _83 * _529;
    float _571 = fma(_499, _561, _559);
    float _573 = _565;
    if (_531)
    {
        float _575 = _565 * _557;
        _573 = _575;
    }
    float _577 = _573;
    float _579 = fma(_497, _561, _567);
    float _581 = fma(_501, _561, _569);
    float _583 = 0.0 + _577;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    out.m_60.x = _579;
    out.m_60.y = _571;
    out.m_60.z = _581;
    out.m_60.w = _585;
    return out;
}

