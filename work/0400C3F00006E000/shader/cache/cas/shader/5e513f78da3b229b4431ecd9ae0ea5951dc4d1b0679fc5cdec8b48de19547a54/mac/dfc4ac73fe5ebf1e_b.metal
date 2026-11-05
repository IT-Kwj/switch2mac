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
    texture2d<float> fp_t_tcb_10 [[id(1)]];
    sampler fp_t_tcb_10Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_35 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_35.x;
    float _49 = in.m_35.y;
    float _51 = _47 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float2 _510 = float2(_47, _49);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_510, float2(0.0), isnan(_510))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _528 = float2(_47, _49);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_528, float2(0.0), isnan(_528))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_528, float2(0.0), isnan(_528))).x;
    float _65 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _69 = _47 + _67;
    float2 _546 = float2(_51, _65);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float2 _554 = float2(_69, _65);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float2 _562 = float2(_51, _65);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_562, float2(0.0), isnan(_562))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float2 _576 = float2(_69, _65);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_576, float2(0.0), isnan(_576))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float _91 = in.m_37.y;
    float _93 = in.m_37.x;
    float _95 = _91 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _99 = _93 + _97;
    float _101 = fma(_59, 2.0, -1.0);
    float _103 = fma(_57, 2.0, -1.0);
    float _105 = fma(_61, 2.0, -1.0);
    float _107 = _101 * _101;
    float _109 = fma(_103, _103, _107);
    float _111 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _113 = fma(_105, _105, _109);
    float _115 = -_91;
    float _117 = _111 * _115;
    float _119 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _121 = -_93;
    float _123 = _111 * _121;
    float _125 = rsqrt(_113);
    float _127 = fma(_95, _119, _117);
    float _129 = fma(_99, _119, _123);
    float _131 = -_111;
    float _133 = _131 + _119;
    float _135 = _127 * _127;
    float _137 = fma(_129, _129, _135);
    float _139 = fma(_133, _133, _137);
    float _141 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _143 = _101 * _125;
    float _145 = _103 * _125;
    float _147 = _93 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _149 = fma(_95, _141, _117);
    float _151 = _143 * _143;
    float _153 = rsqrt(_139);
    float _155 = _105 * _125;
    float _157 = _149 * _149;
    float _159 = fma(_145, _145, _151);
    float _161 = fma(_147, _141, _123);
    float _163 = fma(_155, _155, _159);
    float _165 = -_111;
    float _167 = _165 + _141;
    float _169 = fma(_161, _161, _157);
    float _171 = fma(_79, 2.0, -1.0);
    float _173 = rsqrt(_163);
    float _175 = fma(_167, _167, _169);
    float _177 = _127 * _153;
    float _179 = fma(_77, 2.0, -1.0);
    float _181 = _129 * _153;
    float _183 = _171 * _177;
    float _185 = rsqrt(_175);
    float _187 = _133 * _153;
    float _189 = fma(_87, 2.0, -1.0);
    float _191 = fma(_179, _181, _183);
    float _193 = spvFAdd((*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _195 = fma(_81, 2.0, -1.0);
    float _197 = fma(_85, 2.0, -1.0);
    float _199 = fma(_89, 2.0, -1.0);
    float _201 = _145 * _173;
    float _203 = _143 * _173;
    float _205 = 1.0 / _193;
    float _207 = _155 * _173;
    float _209 = _201 * _181;
    float _211 = fma(_195, _187, _191);
    float _213 = _149 * _185;
    float _215 = -_177;
    float _217 = -_209;
    float _219 = fma(_203, _215, _217);
    float _221 = _161 * _185;
    float _223 = _167 * _185;
    float _225 = _189 * _213;
    float _227 = -_187;
    float _229 = fma(_207, _227, _219);
    float _231 = _201 * _221;
    float _233 = fma(_197, _221, _225);
    float _235 = _211 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _237 = _229 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _239 = -_213;
    float _241 = -_231;
    float _243 = fma(_203, _239, _241);
    float _245 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _247 = _49 + _245;
    float _249 = _235 * _205;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = _237 * _205;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = fma(_199, _223, _233);
    float _259 = -_223;
    float _261 = fma(_207, _259, _243);
    float _263 = _251 * _255;
    float2 _862 = float2(_69, _65);
    float3 _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_862, float2(0.0), isnan(_862))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_862, float2(0.0), isnan(_862))).xyz;
    float _267 = _265.x;
    float _269 = _265.y;
    float _271 = _265.z;
    float2 _876 = float2(_51, _65);
    float3 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_876, float2(0.0), isnan(_876))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_876, float2(0.0), isnan(_876))).xyz;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = _273.z;
    float2 _890 = float2(_51, _247);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_890, float2(0.0), isnan(_890))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_890, float2(0.0), isnan(_890))).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    float2 _904 = float2(_51, _247);
    float _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_904, float2(0.0), isnan(_904))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_904, float2(0.0), isnan(_904))).x;
    float2 _912 = float2(_69, _247);
    float _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_912, float2(0.0), isnan(_912))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_912, float2(0.0), isnan(_912))).x;
    float2 _920 = float2(_69, _247);
    float3 _293 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_920, float2(0.0), isnan(_920))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_920, float2(0.0), isnan(_920))).xyz;
    float _295 = _293.x;
    float _297 = _293.y;
    float _299 = _293.z;
    float2 _934 = float2(_51, _247);
    float3 _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_934, float2(0.0), isnan(_934))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_934, float2(0.0), isnan(_934))).xyz;
    float _303 = _301.x;
    float _305 = _301.y;
    float _307 = _301.z;
    float2 _948 = float2(_69, _247);
    float3 _309 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_948, float2(0.0), isnan(_948))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_948, float2(0.0), isnan(_948))).xyz;
    float _311 = _309.x;
    float _313 = _309.y;
    float _315 = _309.z;
    float _317 = _257 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _319 = _261 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _321 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _323 = _91 + _321;
    float _325 = _317 * _205;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _319 * _205;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _327 * _331;
    float _335 = _267 * _333;
    float _337 = _269 * _333;
    float _339 = fma(_285, 2.0, -1.0);
    float _341 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _343 = fma(_275, _263, _335);
    float _345 = fma(_277, _263, _337);
    float _347 = fma(_283, 2.0, -1.0);
    float _349 = fma(_323, _341, _117);
    float _351 = fma(_99, _341, _123);
    float _353 = -_111;
    float _355 = _353 + _341;
    float _357 = fma(_287, 2.0, -1.0);
    float _359 = _349 * _349;
    float _361 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _363 = fma(_297, 2.0, -1.0);
    float _365 = fma(_295, 2.0, -1.0);
    float _367 = fma(_351, _351, _359);
    float _369 = fma(_323, _361, _117);
    float _371 = fma(_147, _361, _123);
    float _373 = -_111;
    float _375 = _373 + _361;
    float _377 = fma(_355, _355, _367);
    float _379 = fma(_299, 2.0, -1.0);
    float _381 = _271 * _333;
    float _383 = rsqrt(_377);
    float _385 = fma(_279, _263, _381);
    float _387 = _349 * _383;
    float _389 = _351 * _383;
    float _391 = _355 * _383;
    float _393 = _339 * _387;
    float _395 = _201 * _389;
    float _397 = fma(_347, _389, _393);
    float _399 = -_387;
    float _401 = -_395;
    float _403 = fma(_203, _399, _401);
    float _405 = fma(_357, _391, _397);
    float _407 = -_391;
    float _409 = fma(_207, _407, _403);
    float _411 = _405 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _413 = _409 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _415 = _411 * _205;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = _413 * _205;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _369 * _369;
    float _425 = _417 * _421;
    float _427 = fma(_371, _371, _423);
    float _429 = fma(_303, _425, _343);
    float _431 = fma(_375, _375, _427);
    float _433 = fma(_307, _425, _385);
    float _435 = rsqrt(_431);
    float _437 = _369 * _435;
    float _439 = _371 * _435;
    float _441 = _375 * _435;
    float _443 = _363 * _437;
    float _445 = _201 * _439;
    float _447 = fma(_365, _439, _443);
    float _449 = -_437;
    float _451 = -_445;
    float _453 = fma(_203, _449, _451);
    float _455 = fma(_379, _441, _447);
    float _457 = -_441;
    float _459 = fma(_207, _457, _453);
    float _461 = _455 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _463 = _459 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _465 = _461 * _205;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = _463 * _205;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = _467 * _471;
    float _475 = fma(_305, _425, _345);
    float _477 = fma(_311, _473, _429);
    float _479 = fma(_313, _473, _475);
    float _481 = fma(_315, _473, _433);
    float _483 = _477 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _485 = _483 * 0.25;
    float _487 = _479 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _489 = _487 * 0.25;
    float _491 = _481 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _493 = _491 * 0.25;
    out.m_40.x = _485;
    out.m_40.y = _489;
    out.m_40.z = _493;
    return out;
}

