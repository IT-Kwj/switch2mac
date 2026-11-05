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
    float2 _341 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_341, float2(0.0), isnan(_341))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _75);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = fma(_101, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = fma(_105, -0.5, 0.5);
    float _115 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float2 _456 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_456, float2(0.0), isnan(_456))).x;
    float2 _466 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466))).x;
    float _121 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _97);
    float2 _481 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float2 _491 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).x;
    float _127 = fma(_115, -0.5, 0.5);
    float _129 = fma(_121, -0.5, 0.5);
    float2 _505 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).x;
    float2 _515 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).x;
    float _135 = _109 + _111;
    float _137 = abs(_73);
    float _139 = -_137;
    float _141 = _139 + 1.0;
    float _143 = _135 + _107;
    float _145 = _141 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _143 + _113;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _159 = _149 + _127;
    float _161 = abs(_147);
    float _163 = log2(_161);
    float _165 = _129 + _159;
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _187 = fma(_117, _177, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _189 = fma(_119, _169, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _191 = fma(_119, _173, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _193 = fma(_119, _181, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _195 = _187 + _189;
    float _197 = fma(_117, _157, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _199 = fma(_117, _153, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _201 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _203 = _201 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _205 = _197 + _191;
    float _207 = _199 + _193;
    float _209 = fma(_123, _203, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _219 = _195 + _209;
    float _221 = fma(_123, _213, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _223 = fma(_123, _185, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _229 = fma(_125, _217, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _235 = _205 + _221;
    float _237 = _207 + _223;
    float _239 = fma(_125, _233, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _241 = fma(_125, _227, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _243 = _235 + _229;
    float _245 = _219 + _239;
    float _247 = _237 + _241;
    float _249 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _251 = _249 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _253 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _255 = _253 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _257 = _163 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _263 = fma(_131, _251, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _265 = fma(_131, _255, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _267 = fma(_131, _261, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _269 = exp2(_257);
    float _271 = _245 + _267;
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _281 = _243 + _263;
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _287 = _247 + _265;
    float _289 = fma(_133, _279, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _291 = fma(_133, _275, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _293 = fma(_133, _285, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _295 = _289 + _281;
    float _297 = _291 + _271;
    float _299 = _293 + _287;
    float _301 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].w, _165);
    float _303 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].x, _297);
    float _305 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].y, _295);
    float _307 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].z, _299);
    out.m_38.x = _303;
    out.m_38.y = _305;
    out.m_38.z = _307;
    out.m_38.w = _301;
    return out;
}

