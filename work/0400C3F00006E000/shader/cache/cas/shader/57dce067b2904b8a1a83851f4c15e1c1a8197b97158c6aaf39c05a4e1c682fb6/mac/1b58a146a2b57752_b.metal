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
    float2 _301 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_301, float2(0.0), isnan(_301))).xyz;
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
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _89);
    float _99 = fma(_91, -0.5, 0.5);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = fma(_95, -0.5, 0.5);
    float _105 = fma(_97, -0.5, 0.5);
    float2 _391 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).x;
    float2 _401 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_401, float2(0.0), isnan(_401))).x;
    float2 _411 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).x;
    float2 _421 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float _115 = abs(_73);
    float _117 = -_115;
    float _119 = _117 + 1.0;
    float _121 = _99 + _101;
    float _123 = _119 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _121 + _103;
    float _129 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _131 = _129 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _133 = abs(_125);
    float _135 = log2(_133);
    float _137 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _139 = _137 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _141 = _105 + _127;
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _147 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _149 = _147 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _155 = abs(_107);
    float _157 = log2(_155);
    float _159 = abs(_109);
    float _161 = log2(_159);
    float _163 = abs(_111);
    float _165 = log2(_163);
    float _167 = _157 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _169 = _161 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _171 = abs(_113);
    float _173 = log2(_171);
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _179 = _165 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _181 = exp2(_169);
    float _183 = exp2(_167);
    float _185 = _173 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _187 = exp2(_179);
    float _189 = fma(_181, _139, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _191 = fma(_181, _131, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _193 = fma(_181, _149, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _195 = fma(_183, _145, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _197 = exp2(_185);
    float _199 = fma(_183, _177, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _201 = fma(_183, _153, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _203 = _195 + _189;
    float _205 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _207 = _205 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _213 = _135 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _215 = _199 + _191;
    float _217 = _201 + _193;
    float _219 = fma(_187, _207, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _221 = fma(_187, _211, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _223 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _225 = _223 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _227 = exp2(_213);
    float _229 = _203 + _219;
    float _231 = _215 + _221;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _241 = fma(_187, _225, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _247 = fma(_197, _235, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _249 = fma(_197, _239, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _251 = _217 + _241;
    float _253 = fma(_197, _245, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _255 = _247 + _229;
    float _257 = _249 + _231;
    float _259 = _253 + _251;
    float _261 = fma(_227, (*spvDescriptorSet0.fp_c4)._m0[0].w, _141);
    float _263 = fma(_227, (*spvDescriptorSet0.fp_c4)._m0[0].x, _255);
    float _265 = fma(_227, (*spvDescriptorSet0.fp_c4)._m0[0].y, _257);
    float _267 = fma(_227, (*spvDescriptorSet0.fp_c4)._m0[0].z, _259);
    out.m_38.x = _263;
    out.m_38.y = _265;
    out.m_38.z = _267;
    out.m_38.w = _261;
    return out;
}

