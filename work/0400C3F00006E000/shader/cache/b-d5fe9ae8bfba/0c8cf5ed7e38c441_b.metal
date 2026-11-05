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
    float2 _369 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_369, float2(0.0), isnan(_369))).xyz;
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
    float _93 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _95 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _97 = -_75;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _101 = fma(_89, -0.5, 0.5);
    float _103 = fma(_93, -0.5, 0.5);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float2 _456 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_456, float2(0.0), isnan(_456))).x;
    float2 _465 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float _113 = fma(_99, -0.5, 0.5);
    float _115 = fma(_107, -0.5, 0.5);
    float2 _479 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_479, float2(0.0), isnan(_479))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_479, float2(0.0), isnan(_479))).x;
    float _119 = -_75;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float2 _495 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float2 _505 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).x;
    float _127 = fma(_121, -0.5, 0.5);
    float2 _516 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float _131 = abs(_75);
    float _133 = -_131;
    float _135 = _133 + 1.0;
    float _137 = 0.0 + _103;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = 0.0 + _101;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _135 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _139 + _113;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = _143 + _105;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _115 + _155;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _127 + _151;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = abs(_147);
    float _167 = log2(_165);
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _173 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _175 = _173 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _177 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _179 = _177 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _193 = fma(_109, _171, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = fma(_109, _175, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = fma(_109, _179, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = fma(_171, _111, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_117, _183, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _211 = fma(_117, _187, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _213 = fma(_117, _191, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _215 = fma(_175, _111, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _203 + _209;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = fma(_187, _123, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _225 = _195 + _211;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_179, _111, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_191, _123, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _235 = _207 + _223;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _167 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _241 = fma(_183, _123, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _243 = _199 + _213;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _231 + _241;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = exp2(_239);
    float _253 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _255 = _253 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _257 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _259 = _257 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _261 = _217 + _233;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _269 = fma(_125, _255, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _271 = fma(_125, _259, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _273 = fma(_255, _129, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _275 = fma(_125, _267, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _277 = fma(_259, _129, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _279 = fma(_267, _129, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _281 = _269 + _227;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _275 + _221;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _273 + _237;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = _271 + _245;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _277 + _263;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = _279 + _249;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].w, _159);
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].w, _163);
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].x, _283);
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].y, _295);
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].z, _287);
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].x, _291);
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].y, _299);
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = fma(_251, (*spvDescriptorSet0.fp_c4)._m0[0].z, _303);
    float _335 = precise::clamp(_333, 0.0, 1.0);
    out.m_38.x = _315;
    out.m_38.y = _319;
    out.m_38.z = _323;
    out.m_38.w = _307;
    out.m_40.x = _327;
    out.m_40.y = _331;
    out.m_40.z = _335;
    out.m_40.w = _311;
    return out;
}

