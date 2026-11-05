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
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _81);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _91 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _93 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _85);
    float _95 = fma(_87, -0.5, 0.5);
    float _97 = fma(_89, -0.5, 0.5);
    float _99 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _91);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = abs(_95);
    float _105 = log2(_103);
    float _107 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _99);
    float _111 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _107);
    float _113 = fma(_109, -0.5, 0.5);
    float _115 = abs(_97);
    float _117 = log2(_115);
    float _119 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _111);
    float _121 = fma(_119, -0.5, 0.5);
    float _123 = abs(_101);
    float _125 = log2(_123);
    float _127 = _105 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _129 = _117 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _131 = abs(_113);
    float _133 = log2(_131);
    float _135 = _125 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _137 = exp2(_129);
    float _139 = exp2(_127);
    float _141 = _133 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _143 = exp2(_135);
    float2 _540 = float2(_137, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540))).x;
    float _147 = abs(_121);
    float _149 = log2(_147);
    float2 _554 = float2(_139, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float _153 = exp2(_141);
    float2 _566 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_566, float2(0.0), isnan(_566))).x;
    float _157 = _149 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _159 = exp2(_157);
    float2 _582 = float2(_153, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_582, float2(0.0), isnan(_582))).x;
    float2 _592 = float2(_159, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_592, float2(0.0), isnan(_592))).x;
    float _165 = 0.0 + _97;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = abs(_73);
    float _171 = -_169;
    float _173 = _171 + 1.0;
    float _175 = _167 + _95;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _183 = _177 + _101;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _191 = _173 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _185 + _113;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _207 = _121 + _197;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _215 = abs(_193);
    float _217 = log2(_215);
    float _219 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _221 = _219 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _223 = fma(_145, _189, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = fma(_145, _201, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_145, _181, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = fma(_151, _205, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _237 = fma(_151, _213, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _239 = fma(_151, _221, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _241 = _225 + _235;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _249 = _229 + _237;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _255 = _253 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _257 = _233 + _239;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = fma(_155, _247, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _263 = fma(_155, _255, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _273 = _243 + _261;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _281 = fma(_155, _267, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _287 = _217 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _289 = fma(_161, _271, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _291 = fma(_161, _279, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _293 = fma(_161, _285, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _295 = _251 + _263;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = exp2(_287);
    float _301 = _275 + _289;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _309 = _297 + _291;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _315 = _313 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _317 = _259 + _281;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _323 = _321 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _325 = fma(_163, _307, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _327 = fma(_163, _315, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _329 = _319 + _293;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = fma(_163, _323, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _335 = _325 + _303;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _327 + _311;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = _333 + _331;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_299, (*spvDescriptorSet0.fp_c4)._m0[0].w, _209);
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = fma(_299, (*spvDescriptorSet0.fp_c4)._m0[0].x, _337);
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = fma(_299, (*spvDescriptorSet0.fp_c4)._m0[0].y, _341);
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = fma(_299, (*spvDescriptorSet0.fp_c4)._m0[0].z, _345);
    float _361 = precise::clamp(_359, 0.0, 1.0);
    out.m_38.x = _353;
    out.m_38.y = _357;
    out.m_38.z = _361;
    out.m_38.w = _349;
    return out;
}

