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
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_45 [[user(locn2), flat]];
    float4 m_37 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_47 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _61;
    float _107 = _105 * _67;
    float _109 = _105 * _73;
    float _111 = _105 * _79;
    float _113 = _105 * _85;
    float _115 = _105 * _91;
    float _117 = _105 * _97;
    float _119 = 1.0 / _107;
    float _121 = _105 * _103;
    float _123 = _109 * _119;
    float _125 = _111 * _119;
    float2 _610 = float2(_123, _125);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_610, float2(0.0), isnan(_610))).x;
    float2 _621 = float2(_113, _115);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_621, float2(0.0), isnan(_621))).w;
    float2 _629 = float2(_121, _117);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_629, float2(0.0), isnan(_629))).w;
    float _133 = in.m_37.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _105 * _137;
    float _147 = in.m_43.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _145 * _119;
    float _155 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _157 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _159 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[30].w, _157);
    float _161 = 1.0 / _159;
    float _163 = _105 * _143;
    float _165 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _167 = _161 * _165;
    float _169 = in.m_45.y;
    float _171 = in.m_45.x;
    float _173 = in.m_45.z;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _177 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[30].w, _175);
    float _179 = _129 * _129;
    float _181 = 1.0 / _177;
    float _183 = _179 * _131;
    bool _187 = _183 >= _163;
    bool _189 = isnan(_183);
    bool _191 = _187 || _189;
    bool _193 = isnan(_163);
    bool _195 = _191 || _193;
    float _197 = float(_195);
    float _199 = 0.0 + _197;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _205 = -_167;
    float _207 = fma(_181, _203, _205);
    float _209 = _207 * _155;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _105 * _151;
    float _215 = _201 * _211;
    float _217 = _215 * _213;
    bool _219 = _217 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _221 = isnan(_217);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _227 = _223 || _225;
    float _229 = _167;
    if (!_227)
    {
        discard_fragment();
    }
    float _231 = -_169;
    float _233 = _231 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _235 = -_171;
    float _237 = _235 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _239 = -_173;
    float _241 = _239 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _243 = _233 * _233;
    float _245 = fma(_237, _237, _243);
    float _247 = fma(_241, _241, _245);
    float _249 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _251 = rsqrt(_247);
    float _253 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _249);
    float _255 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _253);
    float _257 = rsqrt(_255);
    float _259 = _233 * _251;
    float _261 = _237 * _251;
    float _263 = _241 * _251;
    float _265 = _257 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _267 = _257 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _269 = _257 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _271 = _265 * _261;
    float _273 = _267 * _263;
    float _275 = in.m_47.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _269 * _259;
    float _283 = -_271;
    float _285 = fma(_267, _259, _283);
    float _287 = -_273;
    float _289 = fma(_269, _261, _287);
    float _291 = in.m_47.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = -_281;
    float _299 = fma(_265, _263, _297);
    float _301 = _105 * _295;
    float _303 = -_171;
    float _305 = _303 + _301;
    float _307 = _105 * _279;
    float _309 = _263 * _289;
    float _311 = in.m_47.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = -_169;
    float _319 = _317 + _307;
    float _321 = -_309;
    float _323 = fma(_259, _285, _321);
    float _325 = _259 * _299;
    float _327 = -_325;
    float _329 = fma(_261, _289, _327);
    float _331 = _105 * _315;
    float _333 = -_173;
    float _335 = _333 + _331;
    float _337 = _289 * _319;
    float _339 = fma(_299, _305, _337);
    float _341 = _261 * _285;
    float _343 = in.m_49.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = fma(_285, _335, _339);
    float _351 = -_341;
    float _353 = fma(_263, _299, _351);
    float _355 = _319 * _353;
    float _357 = fma(_305, _323, _355);
    float _359 = fma(_335, _329, _357);
    float _361 = in.m_41.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = _359 * _359;
    float _369 = fma(_349, _349, _367);
    float _371 = in.m_41.y;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = sqrt(_369);
    float _379 = _105 * _347;
    float _381 = _105 * _365;
    float _383 = _377 * 0.769230782985687255859375;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = -_379;
    float _389 = _387 + _381;
    float _391 = -_385;
    float _393 = fma(_391, _385, 1.0);
    float _395 = in.m_49.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = fma(_393, _389, _379);
    float _403 = _105 * _399;
    float _405 = _105 * _375;
    float _407 = in.m_41.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = -_403;
    float _415 = _413 + _405;
    float _417 = fma(_393, _415, _403);
    float _419 = in.m_49.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = _105 * _411;
    float _427 = _105 * _423;
    float _429 = -_427;
    float _431 = _429 + _425;
    float _433 = fma(_393, _431, _427);
    if (!_227)
    {
        out.m_52.x = _401;
        out.m_52.y = _417;
        out.m_52.z = _433;
        out.m_52.w = _197;
        return out;
    }
    float _435 = _417 * 0.715200006961822509765625;
    float _437 = in.m_54.w;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_54.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_54.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = fma(_401, 0.2125999927520751953125, _435);
    float _457 = in.m_54.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = fma(_433, 0.072200000286102294921875, _455);
    bool _465 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _467 = 1.0 / _463;
    float _469 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_465)
    {
        float _471 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _473 = _167 + _471;
        _229 = _473;
    }
    float _475 = _229;
    float _477 = _467 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = fma(_479, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _483 = _105 * _441;
    if (_465)
    {
        float _485 = _475 * 8.0;
        float _487 = precise::clamp(_485, 0.0, 1.0);
        _469 = _487;
    }
    float _489 = _469;
    float _491 = _105 * _453;
    float _493 = _481 * _483;
    float _495 = 0.0 + _217;
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = _105 * _447;
    float _501 = _105 * _461;
    float _503 = fma(_417, _493, _491);
    float _505 = _497;
    if (_465)
    {
        float _507 = _497 * _489;
        _505 = _507;
    }
    float _509 = _505;
    float _511 = fma(_401, _493, _499);
    float _513 = fma(_433, _493, _501);
    float _515 = 0.0 + _509;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    out.m_52.x = _511;
    out.m_52.y = _503;
    out.m_52.z = _513;
    out.m_52.w = _517;
    return out;
}

