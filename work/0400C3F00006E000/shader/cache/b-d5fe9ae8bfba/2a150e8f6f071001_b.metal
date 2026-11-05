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
    float2 _343 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_343, float2(0.0), isnan(_343))).xyz;
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
    float2 _433 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_433, float2(0.0), isnan(_433))).x;
    float2 _443 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).x;
    float2 _453 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_453, float2(0.0), isnan(_453))).x;
    float2 _463 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float _115 = 0.0 + _99;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = abs(_73);
    float _121 = -_119;
    float _123 = _121 + 1.0;
    float _125 = _117 + _101;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _135 = _133 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _137 = _127 + _103;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = abs(_131);
    float _143 = log2(_141);
    float _145 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _147 = _145 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _149 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _151 = _149 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _153 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _155 = _153 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _157 = _105 + _139;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _169 = abs(_107);
    float _171 = log2(_169);
    float _173 = abs(_109);
    float _175 = log2(_173);
    float _177 = abs(_111);
    float _179 = log2(_177);
    float _181 = _171 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _183 = _175 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _185 = abs(_113);
    float _187 = log2(_185);
    float _189 = _179 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _191 = exp2(_183);
    float _193 = exp2(_181);
    float _195 = _187 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _197 = exp2(_189);
    float _199 = fma(_191, _135, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _201 = fma(_191, _147, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _203 = fma(_191, _155, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _205 = fma(_193, _151, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = exp2(_195);
    float _211 = fma(_193, _163, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = fma(_193, _167, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _207 + _203;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _225 = _223 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _227 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _229 = _227 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _231 = _143 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _233 = _213 + _199;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = _217 + _201;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = fma(_197, _225, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _243 = fma(_197, _229, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _249 = exp2(_231);
    float _251 = _235 + _241;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _239 + _243;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _263 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _265 = _263 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _267 = fma(_197, _247, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _273 = fma(_209, _261, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _275 = fma(_209, _265, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _277 = _221 + _267;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = fma(_209, _271, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _283 = _273 + _253;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _275 + _257;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = _281 + _279;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_249, (*spvDescriptorSet0.fp_c4)._m0[0].w, _159);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_249, (*spvDescriptorSet0.fp_c4)._m0[0].x, _285);
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_249, (*spvDescriptorSet0.fp_c4)._m0[0].y, _289);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = fma(_249, (*spvDescriptorSet0.fp_c4)._m0[0].z, _293);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    out.m_38.x = _301;
    out.m_38.y = _305;
    out.m_38.z = _309;
    out.m_38.w = _297;
    return out;
}

