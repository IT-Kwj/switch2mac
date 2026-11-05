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
    float2 _345 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_345, float2(0.0), isnan(_345))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _89 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _99 = fma(_91, -0.5, 0.5);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = fma(_95, -0.5, 0.5);
    float _105 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _89);
    float _107 = abs(_99);
    float _109 = log2(_107);
    float _111 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _97);
    float _113 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _105);
    float _115 = fma(_111, -0.5, 0.5);
    float _117 = fma(_113, -0.5, 0.5);
    float _119 = abs(_101);
    float _121 = log2(_119);
    float _123 = abs(_103);
    float _125 = log2(_123);
    float _127 = _109 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _129 = _121 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _131 = exp2(_127);
    float _133 = _125 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _135 = exp2(_129);
    float _137 = abs(_115);
    float _139 = log2(_137);
    float2 _484 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).x;
    float _143 = exp2(_133);
    float2 _496 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_496, float2(0.0), isnan(_496))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_496, float2(0.0), isnan(_496))).x;
    float _147 = abs(_117);
    float _149 = log2(_147);
    float _151 = _139 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _153 = exp2(_151);
    float2 _516 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float _157 = _149 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _159 = exp2(_157);
    float2 _532 = float2(_153, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).x;
    float2 _542 = float2(_159, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_542, float2(0.0), isnan(_542))).x;
    float _165 = _99 + _101;
    float _167 = abs(_73);
    float _169 = -_167;
    float _171 = _169 + 1.0;
    float _173 = _165 + _103;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _179 = _171 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _173 + _115;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _197 = _117 + _183;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _207 = abs(_181);
    float _209 = log2(_207);
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _219 = fma(_141, _191, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _221 = fma(_141, _201, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _223 = fma(_141, _205, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _225 = fma(_145, _195, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _227 = fma(_145, _177, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _229 = fma(_145, _187, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _231 = _219 + _225;
    float _233 = _221 + _227;
    float _235 = _223 + _229;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _249 = fma(_155, _239, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _251 = fma(_155, _213, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _253 = fma(_155, _217, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _255 = _231 + _249;
    float _257 = _233 + _251;
    float _259 = _235 + _253;
    float _261 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _263 = _261 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _265 = _209 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _267 = fma(_161, _263, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _269 = fma(_161, _243, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _271 = fma(_161, _247, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _273 = exp2(_265);
    float _275 = _255 + _267;
    float _277 = _257 + _269;
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _291 = _259 + _271;
    float _293 = fma(_163, _281, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _295 = fma(_163, _285, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _297 = fma(_163, _289, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _299 = _293 + _275;
    float _301 = _297 + _277;
    float _303 = _295 + _291;
    float _305 = fma(_273, (*spvDescriptorSet0.fp_c4)._m0[0].w, _197);
    float _307 = fma(_273, (*spvDescriptorSet0.fp_c4)._m0[0].x, _299);
    float _309 = fma(_273, (*spvDescriptorSet0.fp_c4)._m0[0].y, _301);
    float _311 = fma(_273, (*spvDescriptorSet0.fp_c4)._m0[0].z, _303);
    out.m_38.x = _307;
    out.m_38.y = _309;
    out.m_38.z = _311;
    out.m_38.w = _305;
    return out;
}

