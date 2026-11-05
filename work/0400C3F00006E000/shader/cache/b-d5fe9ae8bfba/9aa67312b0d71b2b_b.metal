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
    float2 _413 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _77 = _73 + (-0.99989998340606689453125);
    float _79 = _75 + (-0.99989998340606689453125);
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _87 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _81);
    float _89 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _85);
    float _93 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _95 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _99 = fma(_93, -0.5, 0.5);
    float _101 = fma(_95, -0.5, 0.5);
    float _103 = _99 * _99;
    float _105 = _101 * _101;
    float _107 = _99 + _101;
    float _109 = fma(_103, _77, 1.0);
    float _111 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _113 = _69 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _115 = fma(_105, _79, 1.0);
    float _117 = fma(_97, -0.5, 0.5);
    float _119 = _69 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _121 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[4].x, _113);
    float _123 = _111 + (-0.99989998340606689453125);
    float _125 = _117 * _117;
    float _127 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].x, _119);
    float _129 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].z, _121);
    float _131 = _109 * _109;
    float _133 = fma(_125, _123, 1.0);
    float _135 = _115 * _115;
    float _137 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _139 = fma(_129, -0.5, 0.5);
    float _141 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].z, _127);
    float _143 = _133 * _133;
    float _145 = _137 + (-0.99989998340606689453125);
    float _147 = _139 * _139;
    float _149 = (*spvDescriptorSet0.fp_c5)._m0[4].x * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _151 = fma(_141, -0.5, 0.5);
    float _153 = 1.0 / _131;
    float _155 = fma(_147, _145, 1.0);
    float _157 = _149 + (-0.99989998340606689453125);
    float _159 = _151 * _151;
    float _161 = abs(_71);
    float _163 = -_161;
    float _165 = _163 + 1.0;
    float _167 = _155 * _155;
    float _169 = fma(_159, _157, 1.0);
    float _171 = 1.0 / _135;
    float _173 = _73 + 9.9999997473787516355514526367188e-05;
    float _175 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = 1.0 / _143;
    float _181 = _107 + _117;
    float _183 = _169 * _169;
    float _185 = _75 + 9.9999997473787516355514526367188e-05;
    float _187 = _173 * _153;
    float _189 = _181 + _139;
    float _191 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _193 = _111 + 9.9999997473787516355514526367188e-05;
    float _195 = 1.0 / _167;
    float _197 = _185 * _171;
    float _199 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _201 = fma(_111, 0.75, 7.4999996286351233720779418945312e-05);
    float _203 = _137 + 9.9999997473787516355514526367188e-05;
    float _205 = fma(_137, 0.75, 7.4999996286351233720779418945312e-05);
    float _207 = -_199;
    float _209 = _207 + 1.0;
    float _211 = fma(_149, 0.75, 7.4999996286351233720779418945312e-05);
    float _213 = 1.0 / _183;
    float _215 = -_201;
    float _217 = _215 + 1.0;
    float _219 = _149 + 9.9999997473787516355514526367188e-05;
    float _221 = -_205;
    float _223 = _221 + 1.0;
    float _225 = _187 * _209;
    float _227 = _151 + _189;
    float _229 = _203 * _195;
    float _231 = _193 * _179;
    float _233 = -_211;
    float _235 = _233 + 1.0;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _241 = _229 * _223;
    float _243 = _231 * _217;
    float _245 = abs(_177);
    float _247 = log2(_245);
    float _249 = _219 * _213;
    float _251 = -_191;
    float _253 = _251 + 1.0;
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _263 = _197 * _253;
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _269 = _249 * _235;
    float _271 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _273 = _271 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _275 = fma(_225, _257, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _277 = fma(_225, _261, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _279 = fma(_225, _267, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _281 = fma(_263, _239, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _283 = fma(_263, _273, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _285 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _287 = _285 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _301 = fma(_263, _287, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _303 = fma(_243, _291, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _305 = fma(_243, _295, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _307 = fma(_243, _299, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _309 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _311 = _309 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _313 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _315 = _313 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _317 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _319 = _317 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _321 = _275 + _281;
    float _323 = fma(_241, _311, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _325 = fma(_241, _315, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _327 = fma(_241, _319, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _329 = _247 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _331 = _321 + _303;
    float _333 = _277 + _283;
    float _335 = _279 + _301;
    float _337 = exp2(_329);
    float _339 = _333 + _305;
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _345 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _347 = _345 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _349 = _335 + _307;
    float _351 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _353 = _351 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _355 = fma(_269, _343, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _357 = fma(_269, _347, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _359 = _331 + _323;
    float _361 = fma(_269, _353, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _363 = _339 + _325;
    float _365 = _349 + _327;
    float _367 = _355 + _359;
    float _369 = _357 + _363;
    float _371 = _361 + _365;
    float _373 = fma(_337, (*spvDescriptorSet0.fp_c4)._m0[0].w, _227);
    float _375 = fma(_337, (*spvDescriptorSet0.fp_c4)._m0[0].x, _367);
    float _377 = fma(_337, (*spvDescriptorSet0.fp_c4)._m0[0].y, _369);
    float _379 = fma(_337, (*spvDescriptorSet0.fp_c4)._m0[0].z, _371);
    out.m_36.x = _375;
    out.m_36.y = _377;
    out.m_36.z = _379;
    out.m_36.w = _373;
    return out;
}

