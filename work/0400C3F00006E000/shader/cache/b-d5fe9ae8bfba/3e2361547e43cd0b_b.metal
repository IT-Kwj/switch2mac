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
    float2 _395 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_395, float2(0.0), isnan(_395))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_395, float2(0.0), isnan(_395))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _93);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_97, -0.5, 0.5);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_101, -0.5, 0.5);
    float _113 = fma(_103, -0.5, 0.5);
    float2 _502 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float2 _512 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_512, float2(0.0), isnan(_512))).x;
    float2 _522 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522))).x;
    float2 _532 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).x;
    float2 _542 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_542, float2(0.0), isnan(_542))).x;
    float _125 = 0.0 + _105;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = abs(_73);
    float _131 = -_129;
    float _133 = _131 + 1.0;
    float _135 = _127 + _107;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _143 = _137 + _109;
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = _133 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _155 = _145 + _111;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _163 = abs(_149);
    float _165 = log2(_163);
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _179 = _113 + _157;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = abs(_115);
    float _185 = log2(_183);
    float _187 = abs(_117);
    float _189 = log2(_187);
    float _191 = abs(_119);
    float _193 = log2(_191);
    float _195 = _185 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _197 = _189 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _199 = exp2(_195);
    float _201 = _193 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _203 = exp2(_197);
    float _205 = abs(_121);
    float _207 = log2(_205);
    float _209 = fma(_199, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_199, _161, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = fma(_199, _177, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = exp2(_201);
    float _223 = fma(_203, _173, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _225 = fma(_203, _141, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _227 = fma(_203, _169, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _229 = _211 + _223;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _215 + _225;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = abs(_123);
    float _239 = log2(_237);
    float _241 = _207 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _247 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _249 = _247 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _251 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _253 = _251 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _255 = _219 + _227;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = exp2(_241);
    float _261 = fma(_221, _245, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _263 = fma(_221, _249, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _265 = fma(_221, _253, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _271 = _235 + _261;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _231 + _263;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _239 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _281 = _257 + _265;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _287 = _285 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _289 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _291 = exp2(_279);
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _297 = fma(_259, _269, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _299 = fma(_259, _287, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _301 = fma(_259, _295, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _303 = _273 + _297;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = exp2(_289);
    float _309 = _277 + _301;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _315 = _313 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _317 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _319 = _317 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _321 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _323 = _321 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _325 = _283 + _299;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = fma(_291, _319, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _331 = fma(_291, _315, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _333 = fma(_291, _323, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _335 = _329 + _305;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _331 + _311;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = _333 + _327;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_307, (*spvDescriptorSet0.fp_c4)._m0[0].w, _181);
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = fma(_307, (*spvDescriptorSet0.fp_c4)._m0[0].x, _341);
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = fma(_307, (*spvDescriptorSet0.fp_c4)._m0[0].y, _337);
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = fma(_307, (*spvDescriptorSet0.fp_c4)._m0[0].z, _345);
    float _361 = precise::clamp(_359, 0.0, 1.0);
    out.m_38.x = _353;
    out.m_38.y = _357;
    out.m_38.z = _361;
    out.m_38.w = _349;
    return out;
}

