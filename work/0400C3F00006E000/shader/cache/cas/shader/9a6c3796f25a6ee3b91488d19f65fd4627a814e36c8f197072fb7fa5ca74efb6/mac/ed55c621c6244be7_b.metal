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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_12Smplr_w [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0), center_no_perspective]];
    float4 m_37 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _49 = in.m_37.x;
    float _51 = in.m_37.y;
    float _53 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _55 = _49 + _53;
    float _57 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float2 _532 = float2(_55, _51);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_532, float2(0.0), isnan(_532))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _550 = float2(_49, _51);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_550, float2(0.0), isnan(_550))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_550, float2(0.0), isnan(_550))).x;
    float2 _558 = float2(_55, _51);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_558, float2(0.0), isnan(_558))).x;
    float2 _566 = float2(_49, _51);
    float3 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_566, float2(0.0), isnan(_566))).xyz;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float2 _580 = float2(_57, _51);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_580, float2(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_580, float2(0.0), isnan(_580))).x;
    float2 _588 = float2(_57, _51);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_588, float2(0.0), isnan(_588))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _602 = float2(_55, _51);
    float3 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float2(0.0), isnan(_602))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_602, float2(0.0), isnan(_602))).xyz;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = in.m_39.y;
    float _101 = in.m_39.x;
    float _103 = _51 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _105 = spvFAdd((*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _107 = _101 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _109 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _111 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _113 = fma(_65, 2.0, -1.0);
    float _115 = fma(_63, 2.0, -1.0);
    float _117 = -_99;
    float _119 = _109 * _117;
    float _121 = -_101;
    float _123 = _109 * _121;
    float _125 = fma(_99, _111, _119);
    float _127 = fma(_107, _111, _123);
    float _129 = _125 * _125;
    float _131 = -_109;
    float _133 = _131 + _111;
    float _135 = fma(_77, 2.0, -1.0);
    float _137 = fma(_75, 2.0, -1.0);
    float _139 = fma(_127, _127, _129);
    float _141 = fma(_79, 2.0, -1.0);
    float _143 = fma(_87, 2.0, -1.0);
    float _145 = fma(_85, 2.0, -1.0);
    float _147 = fma(_133, _133, _139);
    float _149 = fma(_89, 2.0, -1.0);
    float _151 = rsqrt(_147);
    float _153 = _125 * _151;
    float _155 = _127 * _151;
    float _157 = _133 * _151;
    float _159 = _113 * _153;
    float _161 = fma(_115, _155, _159);
    float _163 = fma(_67, 2.0, -1.0);
    float _165 = fma(_163, _157, _161);
    float _167 = _135 * _135;
    float _169 = _165 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _171 = fma(_137, _137, _167);
    float _173 = fma(_141, _141, _171);
    float _175 = rsqrt(_173);
    float _177 = _135 * _175;
    float _179 = _137 * _175;
    float _181 = _141 * _175;
    float _183 = _177 * _177;
    float _185 = 1.0 / _105;
    float _187 = fma(_179, _179, _183);
    float _189 = fma(_181, _181, _187);
    float _191 = rsqrt(_189);
    float _193 = _179 * _191;
    float _195 = _177 * _191;
    float _197 = _181 * _191;
    float _199 = _193 * _155;
    float _201 = -_153;
    float _203 = -_199;
    float _205 = fma(_195, _201, _203);
    float _207 = -_157;
    float _209 = fma(_197, _207, _205);
    float _211 = _209 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _213 = _169 * _185;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _219 = _211 * _185;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _225 = _101 + _223;
    float _227 = _215 * _221;
    float _229 = fma(_99, _217, _119);
    float _231 = fma(_225, _217, _123);
    float _233 = -_109;
    float _235 = _233 + _217;
    float _237 = _93 * _227;
    float _239 = _229 * _229;
    float _241 = _95 * _227;
    float _243 = _97 * _227;
    float _245 = fma(_231, _231, _239);
    float _247 = fma(_235, _235, _245);
    float _249 = rsqrt(_247);
    float _251 = _229 * _249;
    float _253 = _231 * _249;
    float _255 = _235 * _249;
    float _257 = _143 * _251;
    float _259 = _193 * _253;
    float _261 = fma(_145, _253, _257);
    float _263 = -_251;
    float _265 = -_259;
    float _267 = fma(_195, _263, _265);
    float _269 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _271 = _51 + _269;
    float _273 = fma(_149, _255, _261);
    float _275 = -_255;
    float _277 = fma(_197, _275, _267);
    float _279 = _273 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _281 = _277 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _283 = _279 * _185;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _281 * _185;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float2 _915 = float2(_57, _51);
    float3 _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_915, float2(0.0), isnan(_915))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_915, float2(0.0), isnan(_915))).xyz;
    float _293 = _291.x;
    float _295 = _291.y;
    float _297 = _291.z;
    float2 _929 = float2(_49, _103);
    float3 _299 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_929, float2(0.0), isnan(_929))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_929, float2(0.0), isnan(_929))).xyz;
    float _301 = _299.x;
    float _303 = _299.y;
    float _305 = _299.z;
    float2 _943 = float2(_49, _103);
    float _307 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_943, float2(0.0), isnan(_943))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_943, float2(0.0), isnan(_943))).x;
    float2 _951 = float2(_49, _271);
    float _309 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_951, float2(0.0), isnan(_951))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_951, float2(0.0), isnan(_951))).x;
    float2 _959 = float2(_49, _271);
    float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_959, float2(0.0), isnan(_959))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_959, float2(0.0), isnan(_959))).xyz;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float2 _973 = float2(_49, _103);
    float3 _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_973, float2(0.0), isnan(_973))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_973, float2(0.0), isnan(_973))).xyz;
    float _321 = _319.x;
    float _323 = _319.y;
    float _325 = _319.z;
    float2 _987 = float2(_49, _271);
    float3 _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_987, float2(0.0), isnan(_987))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_987, float2(0.0), isnan(_987))).xyz;
    float _329 = _327.x;
    float _331 = _327.y;
    float _333 = _327.z;
    float _335 = _285 * _289;
    float2 _1004 = float2(_49, _51);
    float3 _337 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1004, float2(0.0), isnan(_1004))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1004, float2(0.0), isnan(_1004))).xyz;
    float _339 = _337.x;
    float _341 = _337.y;
    float _343 = _337.z;
    float _345 = fma(_293, _335, _237);
    float _347 = fma(_295, _335, _241);
    float _349 = fma(_297, _335, _243);
    float _351 = _99 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _353 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _355 = fma(_303, 2.0, -1.0);
    float _357 = fma(_301, 2.0, -1.0);
    float _359 = fma(_305, 2.0, -1.0);
    float _361 = fma(_351, _353, _119);
    float _363 = fma(_101, _353, _123);
    float _365 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _367 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _369 = _99 + _367;
    float _371 = _361 * _361;
    float _373 = -_109;
    float _375 = _373 + _353;
    float _377 = fma(_101, _365, _123);
    float _379 = fma(_369, _365, _119);
    float _381 = fma(_363, _363, _371);
    float _383 = -_109;
    float _385 = _383 + _365;
    float _387 = fma(_315, 2.0, -1.0);
    float _389 = fma(_313, 2.0, -1.0);
    float _391 = fma(_375, _375, _381);
    float _393 = fma(_317, 2.0, -1.0);
    float _395 = rsqrt(_391);
    float _397 = _361 * _395;
    float _399 = _363 * _395;
    float _401 = _375 * _395;
    float _403 = _355 * _397;
    float _405 = fma(_357, _399, _403);
    float _407 = _193 * _399;
    float _409 = fma(_359, _401, _405);
    float _411 = -_397;
    float _413 = -_407;
    float _415 = fma(_195, _411, _413);
    float _417 = -_401;
    float _419 = fma(_197, _417, _415);
    float _421 = _409 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _423 = _379 * _379;
    float _425 = _419 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _427 = _421 * _185;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = fma(_377, _377, _423);
    float _433 = _425 * _185;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = fma(_385, _385, _431);
    float _439 = _429 * _435;
    float _441 = rsqrt(_437);
    float _443 = fma(_321, _439, _345);
    float _445 = fma(_323, _439, _347);
    float _447 = fma(_325, _439, _349);
    float _449 = _379 * _441;
    float _451 = _377 * _441;
    float _453 = _385 * _441;
    float _455 = _387 * _449;
    float _457 = _193 * _451;
    float _459 = fma(_389, _451, _455);
    float _461 = -_449;
    float _463 = -_457;
    float _465 = fma(_195, _461, _463);
    float _467 = fma(_393, _453, _459);
    float _469 = -_453;
    float _471 = fma(_197, _469, _465);
    float _473 = _467 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _475 = _471 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _477 = _473 * _185;
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = _475 * _185;
    float _483 = precise::clamp(_481, 0.0, 1.0);
    float _485 = _479 * _483;
    float _487 = fma(_329, _485, _443);
    float _489 = fma(_331, _485, _445);
    float _491 = fma(_333, _485, _447);
    float _493 = _487 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _495 = _493 * 0.25;
    float _497 = _489 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _499 = _497 * 0.25;
    float _501 = _491 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _503 = _501 * 0.25;
    float _505 = _495 * _339;
    float _507 = _499 * _341;
    float _509 = _503 * _343;
    out.m_42.x = _505;
    out.m_42.y = _507;
    out.m_42.z = _509;
    return out;
}

