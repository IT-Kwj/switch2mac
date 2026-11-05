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
    float _77 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _77);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _87 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _89 = fma(_81, -0.5, 0.5);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _85);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _87);
    float _97 = abs(_89);
    float _99 = log2(_97);
    float _101 = fma(_91, -0.5, 0.5);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _107 = fma(_103, -0.5, 0.5);
    float _109 = fma(_105, -0.5, 0.5);
    float _111 = abs(_101);
    float _113 = log2(_111);
    float _115 = abs(_107);
    float _117 = log2(_115);
    float _119 = _99 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _121 = _113 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _123 = exp2(_119);
    float _125 = _117 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _127 = exp2(_121);
    float _129 = abs(_109);
    float _131 = log2(_129);
    float2 _465 = float2(_123, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float _135 = exp2(_125);
    float2 _477 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477))).x;
    float _139 = _131 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _141 = exp2(_139);
    float2 _493 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_493, float2(0.0), isnan(_493))).x;
    float2 _503 = float2(_141, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).x;
    float _147 = 0.0 + _89;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = abs(_73);
    float _153 = -_151;
    float _155 = _153 + 1.0;
    float _157 = _149 + _101;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _155 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _159 + _107;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _109 + _167;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = abs(_163);
    float _175 = log2(_173);
    float _177 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _179 = _177 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _197 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _199 = _197 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _201 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _203 = _201 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _205 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _207 = _205 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _209 = fma(_133, _187, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_133, _191, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = fma(_133, _183, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_137, _179, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _223 = fma(_137, _195, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _225 = fma(_137, _199, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _227 = _211 + _221;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _219 + _225;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _215 + _223;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _243 = _175 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _245 = fma(_143, _241, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _247 = fma(_143, _203, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _249 = fma(_143, _207, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _251 = exp2(_243);
    float _253 = _229 + _245;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _237 + _247;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _263 = _261 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _273 = _233 + _249;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = fma(_145, _263, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _279 = fma(_145, _267, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _281 = fma(_145, _271, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _283 = _277 + _255;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _279 + _259;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = _281 + _275;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].w, _171);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].x, _285);
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].y, _289);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].z, _293);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    out.m_38.x = _301;
    out.m_38.y = _305;
    out.m_38.z = _309;
    out.m_38.w = _297;
    return out;
}

