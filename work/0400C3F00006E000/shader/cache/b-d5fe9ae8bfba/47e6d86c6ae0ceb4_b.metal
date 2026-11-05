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
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_52 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_54 [[user(locn7), flat]];
    float4 m_58 [[user(locn8)]];
    float4 m_39 [[user(locn9)]];
    float4 m_50 [[user(locn10)]];
    float4 m_56 [[user(locn11)]];
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
    float _85 = 1.0 / _65;
    float _87 = _85 * _71;
    float _89 = _85 * _77;
    float _91 = _85 * _83;
    float _93 = 1.0 / _87;
    float _95 = _89 * _93;
    float _97 = _91 * _93;
    float2 _553 = float2(_95, _97);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_553, float2(0.0), isnan(_553))).x;
    float _101 = in.m_37.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_37.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_37.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_39.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_39.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_35.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_43.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _157 = _85 * _105;
    float _159 = _85 * _111;
    float _161 = _85 * _117;
    float _163 = _157 * _157;
    float _165 = fma(_159, _159, _163);
    float _167 = fma(_161, _161, _165);
    float _169 = _85 * _123;
    float _171 = rsqrt(_167);
    float _173 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _175 = _173 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _177 = 1.0 / _175;
    float _179 = _157 * _171;
    float _181 = _85 * _129;
    float _183 = _161 * _171;
    float _185 = _169 * _179;
    float _187 = _159 * _171;
    float _189 = _85 * _135;
    float _191 = fma(_181, _187, _185);
    float _193 = _85 * _147;
    float _195 = fma(_189, _183, _191);
    float _197 = _85 * _141;
    float _199 = in.m_45.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = abs(_195);
    float _207 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _209 = _205 + _207;
    float _211 = _197 * _93;
    float _213 = _85 * _153;
    float _215 = _209 * _177;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _221 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[30].w, _219);
    float _223 = _193 * _213;
    float _225 = fma(_217, -2.0, 3.0);
    float _227 = _217 * _217;
    float _229 = 0.0 + _223;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = 1.0 / _221;
    float _235 = _225 * _227;
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _239 = _233 * _237;
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _243 = fma(_99, (*spvDescriptorSet0.fp_c8)._m0[30].w, _241);
    float _245 = 1.0 / _243;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _249 = -_239;
    float _251 = fma(_245, _247, _249);
    float _253 = _251 * _155;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _231 * _255;
    float _259 = _85 * _203;
    float _261 = _257 * _235;
    float _263 = _261 * _259;
    bool _267 = _263 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _269 = isnan(_263);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _275 = _271 || _273;
    float _277 = in.m_43.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = _239;
    if (!_275)
    {
        discard_fragment();
    }
    float _285 = in.m_41.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_43.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = _85 * _281;
    float _299 = in.m_41.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = _85 * _289;
    float _307 = _305 * _297;
    float _309 = _85 * _303;
    float _311 = _85 * _295;
    float _313 = in.m_43.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = _309 * _311;
    float _321 = in.m_41.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = _85 * _317;
    float _329 = _85 * _325;
    float _331 = _329 * _327;
    if (!_275)
    {
        out.m_48.x = _307;
        out.m_48.y = _319;
        out.m_48.z = _331;
        out.m_48.w = _223;
        return out;
    }
    float _333 = in.m_50.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_50.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_52.y;
    float _347 = in.m_52.x;
    float _349 = in.m_50.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_52.z;
    float _357 = in.m_54.x;
    float _359 = in.m_56.z;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = _85 * _337;
    float _367 = _85 * _343;
    float _369 = in.m_58.w;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = -_345;
    float _377 = _365 + _375;
    float _379 = -_347;
    float _381 = _367 + _379;
    float _383 = _85 * _353;
    float _385 = _357 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _387 = _377 * _377;
    float _389 = in.m_56.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = -_355;
    float _397 = _383 + _395;
    float _399 = fma(_381, _381, _387);
    float _401 = in.m_56.w;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_397, _397, _399);
    float _409 = -_407;
    float _411 = fma(_385, _385, _409);
    float _413 = _319 * 0.715200006961822509765625;
    float _415 = precise::max(0.0, _411);
    float _417 = fma(_307, 0.2125999927520751953125, _413);
    float _419 = sqrt(_415);
    float _421 = fma(_331, 0.072200000286102294921875, _417);
    float _423 = 1.0 / _421;
    float _425 = _251 + _419;
    float _427 = _85 * _373;
    float _429 = in.m_56.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = -_427;
    float _437 = _425 + _435;
    float _439 = _437 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _441 = _439 * (-1.44269502162933349609375);
    bool _443 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _445 = exp2(_441);
    float _447 = _423 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_449, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _453 = _85 * _405;
    float _455 = _451 * _453;
    if (_443)
    {
        float _457 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _459 = _239 + _457;
        _283 = _459;
    }
    float _461 = _283;
    float _463 = -_445;
    float _465 = _463 + 1.0;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = _263 * _467;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = _467;
    float _475 = _471;
    if (_443)
    {
        float _477 = _461 * 8.0;
        float _479 = precise::clamp(_477, 0.0, 1.0);
        _473 = _479;
    }
    float _481 = _473;
    float _483 = _85 * _433;
    float _485 = _85 * _393;
    float _487 = _85 * _363;
    if (_443)
    {
        float _489 = _471 * _481;
        _475 = _489;
    }
    float _491 = _475;
    float _493 = fma(_307, _455, _483);
    float _495 = fma(_319, _455, _485);
    float _497 = fma(_331, _455, _487);
    float _499 = 0.0 + _491;
    float _501 = precise::clamp(_499, 0.0, 1.0);
    out.m_48.x = _493;
    out.m_48.y = _495;
    out.m_48.z = _497;
    out.m_48.w = _501;
    return out;
}

