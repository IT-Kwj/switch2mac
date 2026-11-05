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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _499 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_499, float2(0.0), isnan(_499))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _95 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _99 = fma(_91, -0.5, 0.5);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _95);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = abs(_99);
    float _109 = log2(_107);
    float _111 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _113 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _103);
    float _115 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _117 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _89);
    float _119 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _111);
    float _121 = fma(_113, -0.5, 0.5);
    float _123 = abs(_101);
    float _125 = log2(_123);
    float _127 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _119);
    float _129 = fma(_127, -0.5, 0.5);
    float _131 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _115);
    float _133 = fma(_117, -0.5, 0.5);
    float _135 = abs(_105);
    float _137 = log2(_135);
    float _139 = _109 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _141 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _131);
    float _143 = fma(_141, -0.5, 0.5);
    float _145 = _125 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _147 = exp2(_139);
    float _149 = _137 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _151 = abs(_121);
    float _153 = log2(_151);
    float _155 = exp2(_145);
    float _157 = abs(_129);
    float _159 = log2(_157);
    float2 _676 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).x;
    float _163 = _153 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _165 = exp2(_149);
    float2 _692 = float2(_155, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).x;
    float _169 = abs(_133);
    float _171 = log2(_169);
    float _173 = _159 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _175 = exp2(_163);
    float2 _712 = float2(_165, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_712, float2(0.0), isnan(_712))).x;
    float _179 = exp2(_173);
    float _181 = _171 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _183 = abs(_143);
    float _185 = log2(_183);
    float2 _732 = float2(_175, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_732, float2(0.0), isnan(_732))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_732, float2(0.0), isnan(_732))).x;
    float _189 = exp2(_181);
    float2 _744 = float2(_179, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_744, float2(0.0), isnan(_744))).x;
    float _193 = _185 * (*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _195 = exp2(_193);
    float2 _760 = float2(_189, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_760, float2(0.0), isnan(_760))).x;
    float2 _770 = float2(_195, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_770, float2(0.0), isnan(_770))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_770, float2(0.0), isnan(_770))).x;
    float _201 = 0.0 + _99;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = abs(_73);
    float _207 = -_205;
    float _209 = _207 + 1.0;
    float _211 = _203 + _101;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _219 = _213 + _105;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _225 = _223 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _227 = _209 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _221 + _121;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _243 = _233 + _129;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _249 = _247 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _251 = abs(_229);
    float _253 = log2(_251);
    float _255 = _245 + _133;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _263 = _143 + _257;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _271 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _273 = _271 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _275 = fma(_161, _225, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_161, _237, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = fma(_161, _261, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_167, _249, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _289 = fma(_167, _269, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _291 = fma(_167, _273, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _293 = _277 + _287;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _281 + _289;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = _285 + _291;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _309 = fma(_177, _307, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _311 = fma(_177, _217, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _313 = fma(_177, _241, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _315 = _295 + _309;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _323 = _303 + _313;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = _299 + _311;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _343 = fma(_187, _321, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _345 = fma(_187, _333, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _347 = fma(_187, _337, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _349 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _351 = _349 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _353 = _317 + _343;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _359 = _357 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _361 = _325 + _347;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _329 + _345;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = fma(_191, _341, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _371 = fma(_191, _351, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _373 = fma(_191, _359, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _375 = _355 + _369;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = _367 + _371;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _385 = _383 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _387 = _363 + _373;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _393 = _391 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _395 = _253 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _397 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _399 = _397 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _401 = fma(_197, _393, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _403 = fma(_197, _385, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _405 = fma(_197, _399, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _407 = exp2(_395);
    float _409 = _377 + _401;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = _381 + _403;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _419 = _417 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _421 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _423 = _421 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _425 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _427 = _425 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _429 = _389 + _405;
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = fma(_199, _419, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _435 = fma(_199, _423, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _437 = fma(_199, _427, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _439 = _433 + _411;
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = _437 + _415;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = _435 + _431;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].w, _265);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].x, _441);
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].y, _445);
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].z, _449);
    float _465 = precise::clamp(_463, 0.0, 1.0);
    out.m_38.x = _457;
    out.m_38.y = _461;
    out.m_38.z = _465;
    out.m_38.w = _453;
    return out;
}

