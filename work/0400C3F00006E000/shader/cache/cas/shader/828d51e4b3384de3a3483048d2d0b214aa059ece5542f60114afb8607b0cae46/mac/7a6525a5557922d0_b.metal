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
    float _101 = -_75;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _105 = fma(_93, -0.5, 0.5);
    float _107 = fma(_97, -0.5, 0.5);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = abs(_105);
    float _115 = log2(_113);
    float _117 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _119 = -_75;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _123 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _125 = -_75;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _129 = fma(_117, -0.5, 0.5);
    float _131 = fma(_121, -0.5, 0.5);
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = abs(_107);
    float _137 = log2(_135);
    float _139 = fma(_127, -0.5, 0.5);
    float _141 = abs(_109);
    float _143 = log2(_141);
    float _145 = _115 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _147 = abs(_111);
    float _149 = log2(_147);
    float _151 = _137 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _153 = abs(_129);
    float _155 = log2(_153);
    float _157 = _143 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _159 = abs(_131);
    float _161 = log2(_159);
    float _163 = _149 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _165 = exp2(_145);
    float _167 = _155 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _169 = exp2(_151);
    float _171 = _161 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _173 = exp2(_157);
    float _175 = exp2(_163);
    float2 _689 = float2(_165, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).x;
    float2 _698 = float2(_169, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_698, float2(0.0), isnan(_698))).x;
    float _181 = abs(_133);
    float _183 = log2(_181);
    float2 _712 = float2(_173, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_712, float2(0.0), isnan(_712))).x;
    float _187 = abs(_139);
    float _189 = log2(_187);
    float2 _725 = float2(_175, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_725, float2(0.0), isnan(_725))).x;
    float _193 = exp2(_167);
    float _195 = _183 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _197 = exp2(_171);
    float _199 = _189 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float2 _747 = float2(_193, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_747, float2(0.0), isnan(_747))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_747, float2(0.0), isnan(_747))).x;
    float _203 = exp2(_195);
    float2 _758 = float2(_197, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_758, float2(0.0), isnan(_758))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_758, float2(0.0), isnan(_758))).x;
    float _207 = exp2(_199);
    float2 _770 = float2(_203, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_770, float2(0.0), isnan(_770))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_770, float2(0.0), isnan(_770))).x;
    float2 _779 = float2(_207, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_779, float2(0.0), isnan(_779))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_779, float2(0.0), isnan(_779))).x;
    float _213 = 0.0 + _105;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = 0.0 + _107;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = abs(_75);
    float _223 = -_221;
    float _225 = _223 + 1.0;
    float _227 = _215 + _109;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _219 + _111;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _239 = _229 + _129;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _233 + _131;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _225 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _133 + _241;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _263 = abs(_249);
    float _265 = log2(_263);
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _271 = _139 + _245;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _277 = _275 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _283 = fma(_177, _237, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_177, _261, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_237, _179, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_261, _179, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_269, _179, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_177, _269, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = fma(_185, _257, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _309 = fma(_185, _277, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _311 = fma(_185, _281, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _313 = _285 + _307;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _289 + _309;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = _305 + _311;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = fma(_257, _191, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _327 = fma(_277, _191, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _329 = fma(_281, _191, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _331 = _293 + _325;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _339 = _297 + _327;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _345 = _343 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _347 = _301 + _329;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _353 = _351 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _355 = fma(_201, _345, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _357 = fma(_201, _337, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _359 = fma(_201, _353, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _361 = _315 + _355;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _319 + _357;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _323 + _359;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = fma(_345, _205, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _375 = fma(_337, _205, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _377 = fma(_353, _205, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _379 = _333 + _373;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _265 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _385 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _387 = _385 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _389 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _391 = _389 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _393 = _341 + _375;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _349 + _377;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = exp2(_383);
    float _403 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _405 = _403 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _407 = fma(_209, _387, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _409 = fma(_209, _391, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _411 = fma(_209, _405, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _413 = fma(_387, _211, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _415 = fma(_391, _211, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _417 = fma(_405, _211, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _419 = _411 + _371;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _413 + _381;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = _407 + _363;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = _409 + _367;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    float _435 = _415 + _395;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = _417 + _399;
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].w, _253);
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].w, _273);
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].x, _429);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].y, _433);
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].z, _421);
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].x, _425);
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

