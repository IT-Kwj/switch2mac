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
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _457 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_457, float2(0.0), isnan(_457))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _79 = _75 + 9.9999997473787516355514526367188e-05;
    float _81 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _83 = _75 + (-0.99989998340606689453125);
    float _85 = -_77;
    float _87 = _85 + 1.0;
    float _89 = fma(_81, 0.75, 7.4999996286351233720779418945312e-05);
    float _91 = _79 * _87;
    float _93 = _81 + 9.9999997473787516355514526367188e-05;
    float _95 = -_89;
    float _97 = _95 + 1.0;
    float _99 = _81 + (-0.99989998340606689453125);
    float _101 = _93 * _97;
    float _103 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _105 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _107 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _109 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _103);
    float _111 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _105);
    float _113 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _107);
    float _115 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _109);
    float _117 = -_73;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[1].z, _109);
    float _121 = -_73;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c4)._m0[2].z, _111);
    float _125 = fma(_115, -0.5, 0.5);
    float _127 = fma(_119, -0.5, 0.5);
    float _129 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _111);
    float _131 = _125 * _125;
    float _133 = _127 * _127;
    float _135 = fma(_129, -0.5, 0.5);
    float _137 = 0.0 + _127;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = fma(_131, _83, 1.0);
    float _143 = fma(_83, _133, 1.0);
    float _145 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _147 = _135 * _135;
    float _149 = _141 * _141;
    float _151 = fma(_123, -0.5, 0.5);
    float _153 = fma(_145, 0.75, 7.4999996286351233720779418945312e-05);
    float _155 = _145 + 9.9999997473787516355514526367188e-05;
    float _157 = fma(_147, _99, 1.0);
    float _159 = _151 * _151;
    float _161 = -_153;
    float _163 = _161 + 1.0;
    float _165 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _113);
    float _167 = _157 * _157;
    float _169 = _145 + (-0.99989998340606689453125);
    float _171 = _155 * _163;
    float _173 = fma(_99, _159, 1.0);
    float _175 = -_73;
    float _177 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[3].z, _113);
    float _179 = fma(_165, -0.5, 0.5);
    float _181 = _143 * _143;
    float _183 = _173 * _173;
    float _185 = fma(_177, -0.5, 0.5);
    float _187 = _179 * _179;
    float _189 = 1.0 / _167;
    float _191 = _139 + _151;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _185 * _185;
    float _197 = fma(_187, _169, 1.0);
    float _199 = abs(_73);
    float _201 = -_199;
    float _203 = _201 + 1.0;
    float _205 = _185 + _193;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_169, _195, 1.0);
    float _211 = _197 * _197;
    float _213 = 1.0 / _183;
    float _215 = 0.0 + _125;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _209 * _209;
    float _221 = _217 + _135;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = 1.0 / _149;
    float _227 = _179 + _223;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _189 * _101;
    float _233 = _203 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _241 = 1.0 / _181;
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _247 = fma(_231, _245, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _249 = 1.0 / _211;
    float _251 = _225 * _91;
    float _253 = fma(_251, _239, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = 1.0 / _219;
    float _259 = _213 * _101;
    float _261 = _241 * _91;
    float _263 = fma(_245, _259, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _265 = fma(_239, _261, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _249 * _171;
    float _271 = abs(_235);
    float _273 = log2(_271);
    float _275 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _277 = _275 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _279 = _257 * _171;
    float _281 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _283 = _281 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _285 = fma(_251, _283, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_283, _261, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = fma(_251, _277, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = fma(_277, _261, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = _287 + _247;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _309 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _311 = _309 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _313 = fma(_231, _307, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _315 = fma(_307, _259, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _317 = fma(_231, _311, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _319 = _273 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _321 = fma(_311, _259, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _323 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _325 = _323 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _327 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _329 = _327 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _335 = _267 + _315;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = exp2(_319);
    float _341 = fma(_269, _325, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _343 = fma(_269, _329, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _345 = fma(_269, _333, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _347 = fma(_325, _279, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _349 = fma(_329, _279, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _351 = _255 + _313;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = fma(_333, _279, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _357 = _295 + _317;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _291 + _263;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _299 + _321;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _341 + _353;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _343 + _303;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _347 + _337;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = _345 + _359;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _349 + _363;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = _355 + _367;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].x, _371);
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].y, _375);
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].w, _229);
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].w, _207);
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].x, _379);
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].z, _383);
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].y, _387);
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = fma(_339, (*spvDescriptorSet0.fp_c4)._m0[0].z, _391);
    float _423 = precise::clamp(_421, 0.0, 1.0);
    out.m_36.x = _395;
    out.m_36.y = _399;
    out.m_36.z = _415;
    out.m_36.w = _403;
    out.m_38.x = _411;
    out.m_38.y = _419;
    out.m_38.z = _423;
    out.m_38.w = _407;
    return out;
}

