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
    float2 _389 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_389, float2(0.0), isnan(_389))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = fma(_101, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float2 _497 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_497, float2(0.0), isnan(_497))).x;
    float2 _507 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_507, float2(0.0), isnan(_507))).x;
    float _117 = fma(_105, -0.5, 0.5);
    float _119 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _121 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _97);
    float2 _529 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_529, float2(0.0), isnan(_529))).x;
    float2 _539 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float _127 = fma(_119, -0.5, 0.5);
    float _129 = fma(_121, -0.5, 0.5);
    float2 _553 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_553, float2(0.0), isnan(_553))).x;
    float2 _563 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float _135 = _107 + _109;
    float _137 = abs(_73);
    float _139 = -_137;
    float _141 = _139 + 1.0;
    float _143 = _135 + _117;
    float _145 = _141 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _143 + _111;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _155 = _149 + _127;
    float _157 = abs(_147);
    float _159 = log2(_157);
    float _161 = _129 + _155;
    float _163 = abs(_113);
    float _165 = log2(_163);
    float _167 = abs(_115);
    float _169 = log2(_167);
    float _171 = abs(_123);
    float _173 = log2(_171);
    float _175 = _165 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _177 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _179 = _177 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _181 = _169 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _183 = exp2(_175);
    float _185 = _173 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _187 = exp2(_181);
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _197 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _199 = _197 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _201 = abs(_125);
    float _203 = log2(_201);
    float _205 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _207 = _205 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _209 = fma(_183, _179, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _211 = fma(_183, _153, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _213 = fma(_183, _207, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _215 = exp2(_185);
    float _217 = fma(_187, _191, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _219 = fma(_187, _195, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _221 = fma(_187, _199, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _223 = _209 + _217;
    float _225 = _211 + _219;
    float _227 = abs(_131);
    float _229 = log2(_227);
    float _231 = _203 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _237 = _213 + _221;
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _247 = exp2(_231);
    float _249 = fma(_215, _235, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _251 = fma(_215, _241, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _253 = fma(_215, _245, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _255 = _223 + _249;
    float _257 = _225 + _251;
    float _259 = abs(_133);
    float _261 = log2(_259);
    float _263 = _229 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _273 = _237 + _253;
    float _275 = exp2(_263);
    float _277 = fma(_247, _271, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _283 = fma(_247, _267, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _285 = _257 + _277;
    float _287 = fma(_247, _281, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _289 = _261 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _291 = _255 + _283;
    float _293 = _159 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _295 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _297 = _295 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _299 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _301 = _299 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _303 = exp2(_289);
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _309 = fma(_275, _297, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _311 = fma(_275, _301, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _313 = fma(_275, _307, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _315 = _291 + _309;
    float _317 = exp2(_293);
    float _319 = _285 + _311;
    float _321 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _323 = _321 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _325 = _273 + _287;
    float _327 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _329 = _327 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _335 = _325 + _313;
    float _337 = fma(_303, _323, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _339 = fma(_303, _329, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _341 = fma(_303, _333, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _343 = _337 + _315;
    float _345 = _339 + _319;
    float _347 = _341 + _335;
    float _349 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].w, _161);
    float _351 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].x, _343);
    float _353 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].y, _345);
    float _355 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].z, _347);
    out.m_38.x = _351;
    out.m_38.y = _353;
    out.m_38.z = _355;
    out.m_38.w = _349;
    return out;
}

