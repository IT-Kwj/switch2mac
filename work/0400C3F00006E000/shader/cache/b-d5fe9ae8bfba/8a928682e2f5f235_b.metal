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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _570 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).xw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_39.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _77 * _95;
    float _111 = _77 * _101;
    float _113 = _89 * _109;
    float _115 = _111 * _113;
    float _117 = _77 * _107;
    float _119 = 0.0 + _115;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = _121 * _117;
    bool _127 = _123 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _135 = _131 || _133;
    float _137 = in.m_37.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_37.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    if (!_135)
    {
        discard_fragment();
    }
    float _149 = _77 * _141;
    float _151 = _77 * _147;
    float2 _671 = float2(_149, _151);
    float2 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_671, float2(0.0), isnan(_671))).xy;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = in.m_45.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_45.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_45.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_47.y;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_47.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_49.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_49.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_49.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_47.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = _77 * _163;
    float _215 = _77 * _169;
    float _217 = _77 * _175;
    float _219 = _77 * _181;
    float _221 = _213 * _213;
    float _223 = _77 * _193;
    float _225 = _77 * _205;
    float _227 = fma(_215, _215, _221);
    float _229 = _223 * _223;
    float _231 = _77 * _211;
    float _233 = fma(_217, _217, _227);
    float _235 = _77 * _187;
    float _237 = _219 * _219;
    float _239 = rsqrt(_233);
    float _241 = fma(_235, _235, _237);
    float _243 = _77 * _199;
    float _245 = fma(_231, _231, _241);
    float _247 = fma(_243, _243, _229);
    float _249 = rsqrt(_245);
    float _251 = fma(_225, _225, _247);
    float _253 = _213 * _239;
    float _255 = _215 * _239;
    float _257 = _217 * _239;
    float _259 = rsqrt(_251);
    float _261 = _253 * _253;
    float _263 = fma(_255, _255, _261);
    float _265 = fma(_257, _257, _263);
    float _267 = rsqrt(_265);
    float _269 = _225 * _259;
    float _271 = _157 * _157;
    float _273 = _155 * _155;
    float _275 = _271 * _271;
    float _277 = _271 * _259;
    float _279 = _271 * _269;
    float _281 = fma(_273, _273, _275);
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _273 * _249;
    float _287 = _223 * _277;
    float _289 = _243 * _277;
    float _291 = -_283;
    float _293 = _291 + 1.0;
    float _295 = fma(_231, _285, _279);
    float _297 = fma(_219, _285, _287);
    float _299 = fma(_235, _285, _289);
    float _301 = sqrt(_293);
    float _303 = _267 * _301;
    float _305 = fma(_253, _303, _297);
    float _307 = fma(_255, _303, _299);
    float _309 = fma(_257, _303, _295);
    float _311 = _305 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _313 = _305 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _315 = fma(_307, (*spvDescriptorSet0.fp_c8)._m0[0].x, _311);
    float _317 = fma(_307, (*spvDescriptorSet0.fp_c8)._m0[1].x, _313);
    float _319 = fma(_309, (*spvDescriptorSet0.fp_c8)._m0[0].z, _315);
    float _321 = fma(_309, (*spvDescriptorSet0.fp_c8)._m0[1].z, _317);
    float _323 = fma(_319, 0.5, 0.5);
    float _325 = fma(_321, -0.5, 0.5);
    float2 _934 = float2(_323, _325);
    float _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_934, float2(0.0), isnan(_934))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_934, float2(0.0), isnan(_934))).x;
    float _329 = in.m_41.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_41.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_41.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_39.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_39.y;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_39.z;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = -_87;
    float _367 = _365 + 1.0;
    float _369 = _77 * _333;
    float _371 = _77 * _363;
    float _373 = _327 * _327;
    float _375 = _77 * _339;
    float _377 = _77 * _345;
    float _379 = _367 * _373;
    float _381 = -_379;
    float _383 = _381 + 1.0;
    float _385 = _369 * _383;
    float _387 = _375 * _383;
    float _389 = _377 * _383;
    float _391 = _77 * _351;
    float _393 = _77 * _357;
    float _395 = fma(_379, _371, _389);
    float _397 = fma(_379, _391, _385);
    float _399 = fma(_379, _393, _387);
    float _401 = _373 * _395;
    float _403 = _373 * _397;
    float _405 = _373 * _399;
    float _407 = -_401;
    float _409 = _395 + _407;
    float _411 = -_403;
    float _413 = _397 + _411;
    float _415 = -_405;
    float _417 = _399 + _415;
    float _419 = fma(_87, _409, _401);
    float _421 = fma(_87, _413, _403);
    float _423 = fma(_87, _417, _405);
    float _425 = fma(_373, 0.25, _419);
    float _427 = fma(_373, 0.25, _421);
    float _429 = fma(_373, 0.25, _423);
    if (!_135)
    {
        out.m_52.x = _427;
        out.m_52.y = _429;
        out.m_52.z = _425;
        out.m_52.w = _115;
        return out;
    }
    float _431 = _429 * 0.715200006961822509765625;
    float _433 = in.m_54.w;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_54.x;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_54.y;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = fma(_427, 0.2125999927520751953125, _431);
    float _453 = in.m_54.z;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    bool _459 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _461 = fma(_425, 0.072200000286102294921875, _451);
    float _463 = 1.0 / _461;
    float _465 = _463 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = 0.0 + _123;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = _77 * _437;
    float _475 = fma(_467, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _477 = _77 * _443;
    float _479 = _475 * _473;
    float _481 = _77 * _449;
    float _483 = _77 * _457;
    float _485 = fma(_427, _479, _477);
    float _487 = fma(_429, _479, _481);
    float _489 = fma(_425, _479, _483);
    bool _491 = !_459;
    float _493 = _471;
    if (!_491)
    {
        float _495 = in.m_56.w;
        float _497 = gl_FragCoord.w;
        float _499 = _495 * _497;
        float _501 = in.m_56.z;
        float _503 = gl_FragCoord.w;
        float _505 = _501 * _503;
        float _507 = _77 * _499;
        float _509 = _77 * _505;
        float _511 = 1.0 / _507;
        float _513 = _509 * _511;
        float _515 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _517 = fma(_513, (*spvDescriptorSet0.fp_c8)._m0[30].w, _515);
        float _519 = 1.0 / _517;
        float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _523 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _525 = fma(_519, _521, _523);
        float _527 = _525 * 8.0;
        float _529 = precise::clamp(_527, 0.0, 1.0);
        float _531 = _471 * _529;
        _493 = _531;
    }
    float _533 = _493;
    float _535 = 0.0 + _533;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    out.m_52.x = _485;
    out.m_52.y = _487;
    out.m_52.z = _489;
    out.m_52.w = _537;
    return out;
}

