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
    float2 _487 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_487, float2(0.0), isnan(_487))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _77);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _87);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_97, -0.5, 0.5);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _113 = fma(_101, -0.5, 0.5);
    float2 _597 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float2 _607 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).x;
    float _119 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _111);
    float _121 = fma(_103, -0.5, 0.5);
    float _123 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float2 _629 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_629, float2(0.0), isnan(_629))).x;
    float _127 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _119);
    float _129 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _123);
    float _131 = _71 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _133 = fma(_127, -0.5, 0.5);
    float _135 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _129);
    float _137 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[8].x, _131);
    float2 _665 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_665, float2(0.0), isnan(_665))).x;
    float2 _675 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_675, float2(0.0), isnan(_675))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_675, float2(0.0), isnan(_675))).x;
    float _143 = fma(_135, -0.5, 0.5);
    float _145 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[8].z, _137);
    float2 _692 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).x;
    float2 _702 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_702, float2(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_702, float2(0.0), isnan(_702))).x;
    float _151 = fma(_145, -0.5, 0.5);
    float2 _714 = float2(_151, (*spvDescriptorSet0.fp_c5)._m0[15].x);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714))).x;
    float _155 = 0.0 + _105;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = abs(_73);
    float _161 = -_159;
    float _163 = _161 + 1.0;
    float _165 = _157 + _109;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _163 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = _167 + _113;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _175 + _121;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _189 = _179 + _107;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = abs(_171);
    float _195 = log2(_193);
    float _197 = _191 + _133;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _203 = _201 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _205 = _199 + _143;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _213 = _151 + _207;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _237 = fma(_115, _183, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = fma(_117, _223, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _243 = fma(_117, _227, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _245 = fma(_117, _231, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _247 = fma(_115, _187, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = fma(_115, _219, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _239 + _245;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _263 = _249 + _243;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _253 + _241;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_125, _261, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _273 = fma(_125, _235, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _275 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _277 = _275 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _279 = fma(_125, _211, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _281 = _269 + _271;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _265 + _273;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _293 = fma(_139, _277, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _295 = _257 + _279;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_139, _291, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _301 = fma(_139, _203, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _303 = _287 + _293;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _309 = _307 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _315 = _297 + _301;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = _283 + _299;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _325 = _323 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _327 = fma(_141, _309, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _329 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _331 = _329 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _333 = fma(_141, _313, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _335 = fma(_141, _325, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _337 = _321 + _327;
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _345 = fma(_147, _331, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _347 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _349 = _347 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _351 = _317 + _335;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = fma(_147, _343, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _357 = _339 + _345;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _305 + _333;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_147, _349, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _367 = _363 + _355;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _373 = _371 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _375 = _353 + _365;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _381 = _379 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _383 = _195 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _385 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _387 = _385 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _389 = fma(_149, _373, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _391 = fma(_149, _381, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _393 = fma(_149, _387, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _395 = exp2(_383);
    float _397 = _359 + _389;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = _369 + _391;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = -(*spvDescriptorSet0.fp_c5)._m0[30].x;
    float _407 = _405 + (*spvDescriptorSet0.fp_c5)._m0[31].x;
    float _409 = -(*spvDescriptorSet0.fp_c5)._m0[30].y;
    float _411 = _409 + (*spvDescriptorSet0.fp_c5)._m0[31].y;
    float _413 = -(*spvDescriptorSet0.fp_c5)._m0[30].z;
    float _415 = _413 + (*spvDescriptorSet0.fp_c5)._m0[31].z;
    float _417 = _377 + _393;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = fma(_153, _407, (*spvDescriptorSet0.fp_c5)._m0[30].x);
    float _423 = fma(_153, _411, (*spvDescriptorSet0.fp_c5)._m0[30].y);
    float _425 = fma(_153, _415, (*spvDescriptorSet0.fp_c5)._m0[30].z);
    float _427 = _421 + _399;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = _423 + _403;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    float _435 = _425 + _419;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].w, _215);
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].x, _429);
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].y, _433);
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].z, _437);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    out.m_38.x = _445;
    out.m_38.y = _449;
    out.m_38.z = _453;
    out.m_38.w = _441;
    return out;
}

