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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
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
    float _51 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _53 = _47 + _51;
    float _55 = _47 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float2 _516 = float2(_53, _49);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_516, float2(0.0), isnan(_516))).xyz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float2 _534 = float2(_47, _49);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_534, float2(0.0), isnan(_534))).x;
    float2 _542 = float2(_53, _49);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_542, float2(0.0), isnan(_542))).x;
    float2 _550 = float2(_47, _49);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_550, float2(0.0), isnan(_550))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_550, float2(0.0), isnan(_550))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _564 = float2(_55, _49);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_564, float2(0.0), isnan(_564))).x;
    float2 _572 = float2(_55, _49);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_572, float2(0.0), isnan(_572))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _586 = float2(_53, _49);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_586, float2(0.0), isnan(_586))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = in.m_37.y;
    float _99 = in.m_37.x;
    float _101 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _103 = _99 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _105 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _107 = fma(_61, 2.0, -1.0);
    float _109 = fma(_63, 2.0, -1.0);
    float _111 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _113 = -_97;
    float _115 = _105 * _113;
    float _117 = -_99;
    float _119 = _105 * _117;
    float _121 = fma(_75, 2.0, -1.0);
    float _123 = -_105;
    float _125 = _123 + _111;
    float _127 = fma(_97, _111, _115);
    float _129 = fma(_103, _111, _119);
    float _131 = fma(_73, 2.0, -1.0);
    float _133 = fma(_77, 2.0, -1.0);
    float _135 = _127 * _127;
    float _137 = fma(_85, 2.0, -1.0);
    float _139 = fma(_83, 2.0, -1.0);
    float _141 = fma(_129, _129, _135);
    float _143 = fma(_125, _125, _141);
    float _145 = rsqrt(_143);
    float _147 = _127 * _145;
    float _149 = _129 * _145;
    float _151 = _109 * _147;
    float _153 = _125 * _145;
    float _155 = fma(_65, 2.0, -1.0);
    float _157 = fma(_107, _149, _151);
    float _159 = _121 * _121;
    float _161 = fma(_155, _153, _157);
    float _163 = fma(_131, _131, _159);
    float _165 = spvFAdd((*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _167 = fma(_133, _133, _163);
    float _169 = rsqrt(_167);
    float _171 = _121 * _169;
    float _173 = _131 * _169;
    float _175 = _133 * _169;
    float _177 = _171 * _171;
    float _179 = 1.0 / _165;
    float _181 = fma(_173, _173, _177);
    float _183 = fma(_175, _175, _181);
    float _185 = rsqrt(_183);
    float _187 = _173 * _185;
    float _189 = _171 * _185;
    float _191 = _175 * _185;
    float _193 = _187 * _149;
    float _195 = -_147;
    float _197 = -_193;
    float _199 = fma(_189, _195, _197);
    float _201 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _203 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _205 = _49 + _203;
    float _207 = -_153;
    float _209 = fma(_191, _207, _199);
    float _211 = _161 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _213 = fma(_97, _201, _115);
    float _215 = _209 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _217 = _211 * _179;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _215 * _179;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _213 * _213;
    float _227 = _219 * _223;
    float _229 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _231 = _99 + _229;
    float _233 = _91 * _227;
    float _235 = fma(_231, _201, _119);
    float _237 = -_105;
    float _239 = _237 + _201;
    float _241 = _93 * _227;
    float _243 = _95 * _227;
    float _245 = fma(_235, _235, _225);
    float _247 = fma(_239, _239, _245);
    float _249 = rsqrt(_247);
    float2 _842 = float2(_55, _49);
    float3 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_842, float2(0.0), isnan(_842))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_842, float2(0.0), isnan(_842))).xyz;
    float _253 = _251.x;
    float _255 = _251.y;
    float _257 = _251.z;
    float _259 = _213 * _249;
    float _261 = _235 * _249;
    float _263 = _239 * _249;
    float _265 = _137 * _259;
    float _267 = _187 * _261;
    float _269 = fma(_139, _261, _265);
    float _271 = -_259;
    float _273 = -_267;
    float _275 = fma(_189, _271, _273);
    float2 _883 = float2(_47, _101);
    float3 _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_883, float2(0.0), isnan(_883))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_883, float2(0.0), isnan(_883))).xyz;
    float _279 = _277.x;
    float _281 = _277.y;
    float _283 = _277.z;
    float2 _897 = float2(_47, _101);
    float _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_897, float2(0.0), isnan(_897))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_897, float2(0.0), isnan(_897))).x;
    float2 _905 = float2(_47, _205);
    float _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_905, float2(0.0), isnan(_905))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_905, float2(0.0), isnan(_905))).x;
    float2 _913 = float2(_47, _205);
    float3 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_913, float2(0.0), isnan(_913))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_913, float2(0.0), isnan(_913))).xyz;
    float _291 = _289.x;
    float _293 = _289.y;
    float _295 = _289.z;
    float2 _927 = float2(_47, _101);
    float3 _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_927, float2(0.0), isnan(_927))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_927, float2(0.0), isnan(_927))).xyz;
    float _299 = _297.x;
    float _301 = _297.y;
    float _303 = _297.z;
    float2 _941 = float2(_47, _205);
    float3 _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_941, float2(0.0), isnan(_941))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_941, float2(0.0), isnan(_941))).xyz;
    float _307 = _305.x;
    float _309 = _305.y;
    float _311 = _305.z;
    float _313 = fma(_87, 2.0, -1.0);
    float _315 = -_263;
    float _317 = fma(_191, _315, _275);
    float _319 = fma(_313, _263, _269);
    float _321 = _317 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _323 = _319 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _325 = _321 * _179;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _323 * _179;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _331 * _327;
    float _335 = fma(_255, _333, _241);
    float _337 = _97 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _339 = fma(_253, _333, _233);
    float _341 = fma(_257, _333, _243);
    float _343 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _345 = _97 + _343;
    float _347 = fma(_281, 2.0, -1.0);
    float _349 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _351 = fma(_279, 2.0, -1.0);
    float _353 = fma(_283, 2.0, -1.0);
    float _355 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _357 = fma(_337, _349, _115);
    float _359 = fma(_99, _349, _119);
    float _361 = -_105;
    float _363 = _361 + _349;
    float _365 = fma(_345, _355, _115);
    float _367 = _357 * _357;
    float _369 = fma(_99, _355, _119);
    float _371 = -_105;
    float _373 = _371 + _355;
    float _375 = fma(_293, 2.0, -1.0);
    float _377 = fma(_359, _359, _367);
    float _379 = fma(_291, 2.0, -1.0);
    float _381 = fma(_295, 2.0, -1.0);
    float _383 = fma(_363, _363, _377);
    float _385 = rsqrt(_383);
    float _387 = _357 * _385;
    float _389 = _359 * _385;
    float _391 = _363 * _385;
    float _393 = _347 * _387;
    float _395 = _187 * _389;
    float _397 = fma(_351, _389, _393);
    float _399 = -_387;
    float _401 = -_395;
    float _403 = fma(_189, _399, _401);
    float _405 = fma(_353, _391, _397);
    float _407 = -_391;
    float _409 = fma(_191, _407, _403);
    float _411 = _405 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _413 = _409 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _415 = _411 * _179;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = _413 * _179;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _417 * _421;
    float _425 = _365 * _365;
    float _427 = fma(_299, _423, _339);
    float _429 = fma(_369, _369, _425);
    float _431 = fma(_301, _423, _335);
    float _433 = fma(_303, _423, _341);
    float _435 = fma(_373, _373, _429);
    float _437 = rsqrt(_435);
    float _439 = _365 * _437;
    float _441 = _369 * _437;
    float _443 = _373 * _437;
    float _445 = _375 * _439;
    float _447 = _187 * _441;
    float _449 = fma(_379, _441, _445);
    float _451 = -_439;
    float _453 = -_447;
    float _455 = fma(_189, _451, _453);
    float _457 = fma(_381, _443, _449);
    float _459 = -_443;
    float _461 = fma(_191, _459, _455);
    float _463 = _457 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _465 = _461 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _467 = _463 * _179;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    float _471 = _465 * _179;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = _469 * _473;
    float _477 = fma(_307, _475, _427);
    float _479 = fma(_309, _475, _431);
    float _481 = fma(_311, _475, _433);
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

