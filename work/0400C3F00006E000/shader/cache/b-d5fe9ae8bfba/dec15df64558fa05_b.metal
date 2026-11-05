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
    float2 _377 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_377, float2(0.0), isnan(_377))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _75);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _99 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _101 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _87);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _89);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _91);
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _93);
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _97);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = fma(_105, -0.5, 0.5);
    float _115 = fma(_107, -0.5, 0.5);
    float _117 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _99);
    float _119 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _95);
    float2 _505 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).x;
    float2 _515 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).x;
    float _125 = fma(_117, -0.5, 0.5);
    float _127 = fma(_119, -0.5, 0.5);
    float _129 = fma(_109, -0.5, 0.5);
    float _131 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _101);
    float2 _536 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_536, float2(0.0), isnan(_536))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_536, float2(0.0), isnan(_536))).x;
    float _135 = fma(_131, -0.5, 0.5);
    float2 _548 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_548, float2(0.0), isnan(_548))).x;
    float2 _558 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_558, float2(0.0), isnan(_558))).x;
    float2 _568 = float2(_125, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).x;
    float2 _578 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).x;
    float _145 = _113 + _115;
    float _147 = abs(_73);
    float _149 = -_147;
    float _151 = _149 + 1.0;
    float _153 = _145 + _127;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _159 = _153 + _129;
    float _161 = _151 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _159 + _111;
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _171 = _165 + _125;
    float _173 = abs(_163);
    float _175 = log2(_173);
    float _177 = _135 + _171;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _207 = fma(_121, _189, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _209 = fma(_123, _193, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _211 = fma(_123, _197, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _213 = fma(_123, _201, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _215 = fma(_121, _169, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _217 = fma(_121, _157, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _219 = _207 + _209;
    float _221 = fma(_133, _205, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _223 = _215 + _211;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _229 = _217 + _213;
    float _231 = fma(_133, _227, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _233 = fma(_133, _181, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _235 = _223 + _221;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _245 = _229 + _233;
    float _247 = _219 + _231;
    float _249 = fma(_137, _239, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _251 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _253 = _251 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _255 = fma(_137, _243, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _257 = fma(_137, _185, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _259 = _247 + _249;
    float _261 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _263 = _261 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _265 = fma(_139, _253, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _271 = _245 + _257;
    float _273 = fma(_139, _263, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _275 = _259 + _265;
    float _277 = _235 + _255;
    float _279 = fma(_139, _269, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _281 = _277 + _273;
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _287 = _271 + _279;
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _293 = _175 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _295 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _297 = _295 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _299 = fma(_141, _285, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _301 = fma(_141, _291, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _303 = fma(_141, _297, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _305 = exp2(_293);
    float _307 = _275 + _299;
    float _309 = _281 + _301;
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _315 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _317 = _315 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _323 = _287 + _303;
    float _325 = fma(_143, _313, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _327 = fma(_143, _317, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _329 = fma(_143, _321, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _331 = _325 + _307;
    float _333 = _327 + _309;
    float _335 = _329 + _323;
    float _337 = fma(_305, (*spvDescriptorSet0.fp_c4)._m0[0].w, _177);
    float _339 = fma(_305, (*spvDescriptorSet0.fp_c4)._m0[0].x, _331);
    float _341 = fma(_305, (*spvDescriptorSet0.fp_c4)._m0[0].y, _333);
    float _343 = fma(_305, (*spvDescriptorSet0.fp_c4)._m0[0].z, _335);
    out.m_38.x = _339;
    out.m_38.y = _341;
    out.m_38.z = _343;
    out.m_38.w = _337;
    return out;
}

