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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _397 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _75 = _73 + (-0.99989998340606689453125);
    float _77 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _79 = _77 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _87 = _69 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _89 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _93 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _85);
    float _95 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[4].x, _87);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _99 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _103 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = _99 + (-0.99989998340606689453125);
    float _109 = fma(_101, -0.5, 0.5);
    float _111 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _113 = _105 * _105;
    float _115 = fma(_111, -0.5, 0.5);
    float _117 = fma(_113, _107, 1.0);
    float _119 = _109 * _109;
    float _121 = _117 * _117;
    float _123 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _125 = fma(_119, _75, 1.0);
    float _127 = fma(_103, -0.5, 0.5);
    float _129 = _123 + (-0.99989998340606689453125);
    float _131 = _125 * _125;
    float _133 = _127 * _127;
    float _135 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _137 = 1.0 / _121;
    float _139 = fma(_133, _129, 1.0);
    float _141 = _135 + (-0.99989998340606689453125);
    float _143 = _115 * _115;
    float _145 = _139 * _139;
    float _147 = 0.0 + _105;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = fma(_143, _141, 1.0);
    float _153 = 1.0 / _131;
    float _155 = _99 + 9.9999997473787516355514526367188e-05;
    float _157 = fma(_99, 0.75, 7.4999996286351233720779418945312e-05);
    float _159 = _151 * _151;
    float _161 = _149 + _109;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _123 + 9.9999997473787516355514526367188e-05;
    float _167 = _155 * _137;
    float _169 = 1.0 / _159;
    float _171 = _163 + _127;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = fma(_123, 0.75, 7.4999996286351233720779418945312e-05);
    float _177 = fma(_135, 0.75, 7.4999996286351233720779418945312e-05);
    float _179 = _73 + 9.9999997473787516355514526367188e-05;
    float _181 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _183 = -_157;
    float _185 = _183 + 1.0;
    float _187 = _135 + 9.9999997473787516355514526367188e-05;
    float _189 = _179 * _153;
    float _191 = -_177;
    float _193 = _191 + 1.0;
    float _195 = abs(_71);
    float _197 = -_195;
    float _199 = _197 + 1.0;
    float _201 = -_181;
    float _203 = _201 + 1.0;
    float _205 = _167 * _185;
    float _207 = 1.0 / _145;
    float _209 = _199 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _189 * _203;
    float _215 = _187 * _169;
    float _217 = -_175;
    float _219 = _217 + 1.0;
    float _221 = _215 * _193;
    float _223 = abs(_211);
    float _225 = log2(_223);
    float _227 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _229 = _227 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _239 = fma(_205, _229, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_205, _233, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_205, _237, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _165 * _207;
    float _253 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _255 = _253 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _257 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _259 = _257 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _261 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _263 = _261 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _265 = _251 * _219;
    float _267 = fma(_213, _255, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _269 = fma(_213, _259, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _271 = fma(_213, _263, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _273 = _225 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _275 = _241 + _267;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _287 = exp2(_273);
    float _289 = _245 + _271;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = fma(_265, _285, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _295 = fma(_265, _281, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _301 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _303 = _301 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _309 = fma(_265, _79, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _311 = _249 + _269;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = fma(_221, _299, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _317 = fma(_221, _303, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _319 = fma(_221, _307, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _321 = _277 + _293;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = _291 + _295;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _313 + _309;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _115 + _173;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _315 + _323;
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = _317 + _327;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _319 + _331;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].w, _335);
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].x, _339);
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].y, _343);
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].z, _347);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    out.m_36.x = _355;
    out.m_36.y = _359;
    out.m_36.z = _363;
    out.m_36.w = _351;
    return out;
}

