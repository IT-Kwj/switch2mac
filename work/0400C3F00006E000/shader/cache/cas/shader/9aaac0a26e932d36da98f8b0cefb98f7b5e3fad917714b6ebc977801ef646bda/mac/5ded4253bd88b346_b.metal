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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
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
    float _53 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _55 = _51 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float2 _530 = float2(_49, _51);
    float _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _61 = _49 + _59;
    float2 _548 = float2(_53, _55);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_548, float2(0.0), isnan(_548))).x;
    float2 _556 = float2(_53, _55);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_556, float2(0.0), isnan(_556))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float2 _570 = float2(_49, _51);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_570, float2(0.0), isnan(_570))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float2 _584 = float2(_61, _55);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_584, float2(0.0), isnan(_584))).x;
    float2 _592 = float2(_61, _55);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_592, float2(0.0), isnan(_592))).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _606 = float2(_61, _55);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_606, float2(0.0), isnan(_606))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _620 = float2(_53, _55);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float _109 = in.m_39.y;
    float _111 = in.m_39.x;
    float _113 = _109 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _117 = _111 + _115;
    float _119 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _121 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _123 = -_109;
    float _125 = _119 * _123;
    float _127 = -_111;
    float _129 = _119 * _127;
    float _131 = fma(_113, _121, _125);
    float _133 = fma(_117, _121, _129);
    float _135 = _131 * _131;
    float _137 = -_119;
    float _139 = _137 + _121;
    float _141 = fma(_133, _133, _135);
    float _143 = fma(_69, 2.0, -1.0);
    float _145 = fma(_139, _139, _141);
    float _147 = fma(_79, 2.0, -1.0);
    float _149 = fma(_77, 2.0, -1.0);
    float _151 = fma(_81, 2.0, -1.0);
    float _153 = rsqrt(_145);
    float _155 = fma(_73, 2.0, -1.0);
    float _157 = fma(_89, 2.0, -1.0);
    float _159 = fma(_87, 2.0, -1.0);
    float _161 = fma(_91, 2.0, -1.0);
    float _163 = _133 * _153;
    float _165 = _131 * _153;
    float _167 = _139 * _153;
    float _169 = fma(_71, 2.0, -1.0);
    float _171 = _169 * _165;
    float _173 = fma(_143, _163, _171);
    float _175 = _147 * _147;
    float _177 = fma(_155, _167, _173);
    float _179 = fma(_149, _149, _175);
    float _181 = _177 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _183 = fma(_151, _151, _179);
    float _185 = rsqrt(_183);
    float _187 = _147 * _185;
    float _189 = _149 * _185;
    float _191 = _151 * _185;
    float _193 = _187 * _187;
    float _195 = fma(_189, _189, _193);
    float _197 = fma(_191, _191, _195);
    float _199 = rsqrt(_197);
    float _201 = spvFAdd((*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _203 = 1.0 / _201;
    float _205 = _189 * _199;
    float _207 = _187 * _199;
    float _209 = _205 * _163;
    float _211 = _191 * _199;
    float _213 = -_165;
    float _215 = -_209;
    float _217 = fma(_207, _213, _215);
    float _219 = _181 * _203;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -_167;
    float _225 = fma(_211, _223, _217);
    float _227 = _225 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _229 = _227 * _203;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _235 = _111 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _237 = _221 * _231;
    float _239 = fma(_113, _233, _125);
    float _241 = fma(_235, _233, _129);
    float _243 = -_119;
    float _245 = _243 + _233;
    float _247 = _239 * _239;
    float _249 = fma(_241, _241, _247);
    float _251 = fma(_245, _245, _249);
    float _253 = rsqrt(_251);
    float _255 = _239 * _253;
    float _257 = _241 * _253;
    float _259 = _245 * _253;
    float _261 = _157 * _255;
    float _263 = _205 * _257;
    float _265 = fma(_159, _257, _261);
    float _267 = -_255;
    float _269 = -_263;
    float _271 = fma(_207, _267, _269);
    float _273 = fma(_161, _259, _265);
    float _275 = -_259;
    float _277 = fma(_211, _275, _271);
    float _279 = _273 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _281 = _277 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _283 = _279 * _203;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _281 * _203;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _293 = _51 + _291;
    float _295 = _285 * _289;
    float _297 = _95 * _295;
    float _299 = _97 * _295;
    float _301 = _99 * _295;
    float2 _936 = float2(_53, _293);
    float3 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_936, float2(0.0), isnan(_936))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_936, float2(0.0), isnan(_936))).xyz;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    float2 _950 = float2(_53, _293);
    float _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_950, float2(0.0), isnan(_950))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_950, float2(0.0), isnan(_950))).x;
    float2 _958 = float2(_61, _293);
    float _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_958, float2(0.0), isnan(_958))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_958, float2(0.0), isnan(_958))).x;
    float2 _966 = float2(_61, _293);
    float3 _315 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_966, float2(0.0), isnan(_966))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_966, float2(0.0), isnan(_966))).xyz;
    float _317 = _315.x;
    float _319 = _315.y;
    float _321 = _315.z;
    float2 _980 = float2(_53, _293);
    float3 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_980, float2(0.0), isnan(_980))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_980, float2(0.0), isnan(_980))).xyz;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float2 _994 = float2(_61, _293);
    float3 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_994, float2(0.0), isnan(_994))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_994, float2(0.0), isnan(_994))).xyz;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = fma(_103, _237, _297);
    float2 _1012 = float2(_49, _51);
    float3 _341 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1012, float2(0.0), isnan(_1012))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1012, float2(0.0), isnan(_1012))).xyz;
    float _343 = _341.x;
    float _345 = _341.y;
    float _347 = _341.z;
    float _349 = fma(_105, _237, _299);
    float _351 = fma(_107, _237, _301);
    float _353 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _355 = _109 + _353;
    float _357 = fma(_307, 2.0, -1.0);
    float _359 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _361 = fma(_305, 2.0, -1.0);
    float _363 = fma(_309, 2.0, -1.0);
    float _365 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _367 = fma(_355, _359, _125);
    float _369 = fma(_117, _359, _129);
    float _371 = -_119;
    float _373 = _371 + _359;
    float _375 = fma(_355, _365, _125);
    float _377 = _367 * _367;
    float _379 = fma(_235, _365, _129);
    float _381 = -_119;
    float _383 = _381 + _365;
    float _385 = fma(_319, 2.0, -1.0);
    float _387 = fma(_369, _369, _377);
    float _389 = fma(_317, 2.0, -1.0);
    float _391 = fma(_321, 2.0, -1.0);
    float _393 = fma(_373, _373, _387);
    float _395 = rsqrt(_393);
    float _397 = _367 * _395;
    float _399 = _369 * _395;
    float _401 = _373 * _395;
    float _403 = _357 * _397;
    float _405 = fma(_361, _399, _403);
    float _407 = _205 * _399;
    float _409 = fma(_363, _401, _405);
    float _411 = -_397;
    float _413 = -_407;
    float _415 = fma(_207, _411, _413);
    float _417 = -_401;
    float _419 = fma(_211, _417, _415);
    float _421 = _409 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _423 = _375 * _375;
    float _425 = _419 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _427 = _421 * _203;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = fma(_379, _379, _423);
    float _433 = _425 * _203;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = fma(_383, _383, _431);
    float _439 = _429 * _435;
    float _441 = rsqrt(_437);
    float _443 = fma(_325, _439, _339);
    float _445 = fma(_327, _439, _349);
    float _447 = fma(_329, _439, _351);
    float _449 = _375 * _441;
    float _451 = _379 * _441;
    float _453 = _383 * _441;
    float _455 = _385 * _449;
    float _457 = _205 * _451;
    float _459 = fma(_389, _451, _455);
    float _461 = -_449;
    float _463 = -_457;
    float _465 = fma(_207, _461, _463);
    float _467 = fma(_391, _453, _459);
    float _469 = -_453;
    float _471 = fma(_211, _469, _465);
    float _473 = _467 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _475 = _471 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _477 = _473 * _203;
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = _475 * _203;
    float _483 = precise::clamp(_481, 0.0, 1.0);
    float _485 = _479 * _483;
    float _487 = fma(_333, _485, _443);
    float _489 = fma(_335, _485, _445);
    float _491 = fma(_337, _485, _447);
    float _493 = _487 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _495 = _493 * 0.25;
    float _497 = _489 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _499 = _497 * 0.25;
    float _501 = _491 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _503 = _501 * 0.25;
    float _505 = _495 * _343;
    float _507 = _499 * _345;
    float _509 = _503 * _347;
    out.m_42.x = _505;
    out.m_42.y = _507;
    out.m_42.z = _509;
    return out;
}

