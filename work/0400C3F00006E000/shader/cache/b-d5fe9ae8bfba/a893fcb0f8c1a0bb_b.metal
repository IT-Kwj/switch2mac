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
    float2 _349 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_349, float2(0.0), isnan(_349))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _89 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _91 = -_75;
    float _93 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _95 = -_75;
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _101 = fma(_89, -0.5, 0.5);
    float _103 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _105 = -_75;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _109 = fma(_97, -0.5, 0.5);
    float _111 = fma(_93, -0.5, 0.5);
    float _113 = fma(_99, -0.5, 0.5);
    float2 _445 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445))).x;
    float _117 = fma(_103, -0.5, 0.5);
    float _119 = fma(_107, -0.5, 0.5);
    float2 _458 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).x;
    float2 _468 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).x;
    float2 _477 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477))).x;
    float2 _487 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_487, float2(0.0), isnan(_487))).x;
    float2 _496 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_496, float2(0.0), isnan(_496))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_496, float2(0.0), isnan(_496))).x;
    float _131 = _109 + _111;
    float _133 = _101 + _113;
    float _135 = abs(_75);
    float _137 = -_135;
    float _139 = _137 + 1.0;
    float _141 = _117 + _133;
    float _143 = _119 + _131;
    float _145 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _147 = _145 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _149 = abs(_115);
    float _151 = log2(_149);
    float _153 = abs(_121);
    float _155 = log2(_153);
    float _157 = abs(_123);
    float _159 = log2(_157);
    float _161 = _151 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _163 = abs(_125);
    float _165 = log2(_163);
    float _167 = _155 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _173 = exp2(_161);
    float _175 = _159 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _177 = exp2(_167);
    float _179 = _165 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _185 = abs(_127);
    float _187 = log2(_185);
    float _189 = fma(_173, _171, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _191 = fma(_173, _183, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _193 = exp2(_175);
    float _195 = fma(_171, _177, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _197 = abs(_129);
    float _199 = log2(_197);
    float _201 = fma(_173, _147, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _203 = fma(_147, _177, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _205 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _207 = _205 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _209 = _187 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _211 = exp2(_179);
    float _213 = _139 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = fma(_183, _177, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _219 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _221 = _219 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _223 = fma(_193, _207, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _225 = abs(_215);
    float _227 = log2(_225);
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _233 = fma(_193, _221, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _235 = fma(_193, _231, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _237 = _189 + _223;
    float _239 = _199 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _241 = exp2(_209);
    float _243 = _201 + _233;
    float _245 = fma(_207, _211, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _247 = _191 + _235;
    float _249 = _195 + _245;
    float _251 = fma(_221, _211, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _253 = exp2(_239);
    float _255 = _227 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _257 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _259 = _257 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _261 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _263 = _261 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _265 = fma(_231, _211, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _267 = _203 + _251;
    float _269 = exp2(_255);
    float _271 = fma(_241, _259, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _273 = fma(_241, _263, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _275 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _277 = _275 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _279 = _217 + _265;
    float _281 = _271 + _237;
    float _283 = _273 + _243;
    float _285 = fma(_241, _277, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _287 = fma(_259, _253, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _289 = fma(_263, _253, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _291 = fma(_277, _253, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _293 = _285 + _247;
    float _295 = _287 + _249;
    float _297 = _289 + _267;
    float _299 = _291 + _279;
    float _301 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].w, _141);
    float _303 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].w, _143);
    float _305 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].x, _281);
    float _307 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].y, _283);
    float _309 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].z, _293);
    float _311 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].x, _295);
    float _313 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].y, _297);
    float _315 = fma(_269, (*spvDescriptorSet0.fp_c4)._m0[0].z, _299);
    out.m_38.x = _305;
    out.m_38.y = _307;
    out.m_38.z = _309;
    out.m_38.w = _301;
    out.m_40.x = _311;
    out.m_40.y = _313;
    out.m_40.z = _315;
    out.m_40.w = _303;
    return out;
}

