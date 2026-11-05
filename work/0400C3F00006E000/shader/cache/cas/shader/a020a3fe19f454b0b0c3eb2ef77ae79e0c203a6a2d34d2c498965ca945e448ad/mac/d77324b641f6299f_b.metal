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
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _507 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_507, float2(0.0), isnan(_507))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _95 = -_75;
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _101 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _103 = fma(_93, -0.5, 0.5);
    float _105 = -_75;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _109 = fma(_97, -0.5, 0.5);
    float _111 = fma(_99, -0.5, 0.5);
    float _113 = fma(_101, -0.5, 0.5);
    float2 _606 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_606, float2(0.0), isnan(_606))).x;
    float2 _615 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_615, float2(0.0), isnan(_615))).x;
    float2 _625 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_625, float2(0.0), isnan(_625))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_625, float2(0.0), isnan(_625))).x;
    float _121 = -_75;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _125 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _127 = -_75;
    float _129 = fma(_127, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _131 = fma(_107, -0.5, 0.5);
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = fma(_125, -0.5, 0.5);
    float _137 = fma(_129, -0.5, 0.5);
    float2 _661 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_661, float2(0.0), isnan(_661))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_661, float2(0.0), isnan(_661))).x;
    float2 _671 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_671, float2(0.0), isnan(_671))).x;
    float2 _680 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_680, float2(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_680, float2(0.0), isnan(_680))).x;
    float2 _690 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).x;
    float2 _699 = float2(_137, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_699, float2(0.0), isnan(_699))).x;
    float _149 = 0.0 + _103;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = 0.0 + _109;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = abs(_75);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    float _163 = _151 + _111;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _155 + _133;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _175 = _165 + _113;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _187 = _135 + _177;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = abs(_115);
    float _193 = log2(_191);
    float _195 = abs(_117);
    float _197 = log2(_195);
    float _199 = _193 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _201 = abs(_119);
    float _203 = log2(_201);
    float _205 = _197 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _207 = exp2(_199);
    float _209 = exp2(_205);
    float _211 = _203 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _213 = abs(_139);
    float _215 = log2(_213);
    float _217 = fma(_207, _181, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_207, _173, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = fma(_207, _185, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_181, _209, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = exp2(_211);
    float _235 = fma(_185, _209, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = fma(_173, _209, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _169 + _131;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _215 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _249 = abs(_141);
    float _251 = log2(_249);
    float _253 = _137 + _245;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _259 = _257 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _261 = exp2(_247);
    float _263 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _265 = _263 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _271 = fma(_233, _269, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _273 = abs(_143);
    float _275 = log2(_273);
    float _277 = _251 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _279 = fma(_233, _259, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _281 = _227 + _271;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _219 + _279;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = abs(_145);
    float _291 = log2(_289);
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _297 = exp2(_277);
    float _299 = fma(_233, _265, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _301 = fma(_265, _261, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _303 = _275 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _305 = _223 + _299;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = fma(_259, _261, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _311 = _241 + _301;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = abs(_147);
    float _317 = log2(_315);
    float _319 = fma(_269, _261, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _321 = _231 + _309;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = _161 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _237 + _319;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _335 = _333 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _337 = _291 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _339 = exp2(_303);
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _345 = fma(_297, _295, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _347 = _287 + _345;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = abs(_327);
    float _353 = log2(_351);
    float _355 = fma(_297, _335, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _357 = fma(_297, _343, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _359 = _307 + _355;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _283 + _357;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _317 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _369 = exp2(_337);
    float _371 = fma(_335, _339, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _373 = fma(_295, _339, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _375 = _313 + _371;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = fma(_343, _339, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _381 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _383 = _381 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _385 = exp2(_367);
    float _387 = _353 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _389 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _391 = _389 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _393 = _331 + _379;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _323 + _373;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = exp2(_387);
    float _403 = fma(_369, _383, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _405 = fma(_369, _391, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _407 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _409 = _407 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _411 = _403 + _361;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    float _415 = _405 + _349;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = fma(_369, _409, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _421 = fma(_383, _385, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _423 = fma(_391, _385, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _425 = fma(_409, _385, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _427 = _419 + _365;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = _421 + _377;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    float _435 = _423 + _399;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = _425 + _395;
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].w, _189);
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].w, _255);
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].x, _413);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].y, _417);
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].z, _429);
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].x, _433);
    float _465 = precise::clamp(_463, 0.0, 1.0);
    float _467 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].y, _437);
    float _469 = precise::clamp(_467, 0.0, 1.0);
    float _471 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].z, _441);
    float _473 = precise::clamp(_471, 0.0, 1.0);
    out.m_38.x = _453;
    out.m_38.y = _457;
    out.m_38.z = _461;
    out.m_38.w = _445;
    out.m_40.x = _465;
    out.m_40.y = _469;
    out.m_40.z = _473;
    out.m_40.w = _449;
    return out;
}

