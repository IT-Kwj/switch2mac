#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
    float4 m_51 [[color(1)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _58 = in.m_40.x;
    float _60 = in.m_40.y;
    float2 _436 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_436, float2(0.0), isnan(_436))).x;
    float2 _447 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_447, float2(0.0), isnan(_447))).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = in.m_42.w;
    float _77 = in.m_44.w;
    float _79 = in.m_42.x;
    float _81 = in.m_42.y;
    float _83 = in.m_44.x;
    float _85 = in.m_44.y;
    float _87 = in.m_42.z;
    float _89 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _91 = -_89;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _95 = -_89;
    float _97 = fma(_95, _77, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _99 = -_89;
    float _101 = fma(_99, _79, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _103 = -_89;
    float _105 = fma(_103, _81, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _107 = 1.0 / _93;
    float _109 = -_89;
    float _111 = fma(_109, _83, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _113 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[17].x, _101);
    float _115 = -_93;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[17].x, _101);
    float _119 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[17].y, _105);
    float _121 = -_89;
    float _123 = fma(_121, _85, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _125 = -_89;
    float _127 = fma(_125, _87, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _129 = 1.0 / _97;
    float _131 = -_93;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c4)._m0[17].y, _105);
    float _135 = _133 * _107;
    float _137 = _119 * _107;
    float _139 = _127 * _107;
    float _141 = _113 * _107;
    float _143 = _117 * _107;
    float _145 = fma(_111, _129, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _147 = fma(_123, _129, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float2 _598 = float2(_73, 0.0);
    float2 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_598, float2(0.0), isnan(_598))).xy;
    float _153 = _151.x;
    float _155 = _151.y;
    float2 _610 = float2(_141, _137);
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610)), _139);
    float2 _618 = float2(_143, _137);
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618)), _139);
    float _161 = _145 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float2 _630 = float2(_141, _135);
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_630, float2(0.0), isnan(_630)), _139);
    float _165 = _147 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _642 = float2(_143, _135);
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642)), _139);
    float2 _650 = float2(_161, _165);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_650, float2(0.0), isnan(_650))).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float _179 = in.m_44.z;
    float _181 = in.m_46.y;
    float _183 = in.m_46.x;
    float _185 = in.m_46.z;
    float _187 = -_89;
    float _189 = fma(_187, _179, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _191 = _181 * _181;
    float _193 = fma(_189, -0.5, 0.5);
    float _195 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _197 = fma(_183, _183, _191);
    bool _201 = _193 <= 1.0;
    bool _203 = isnan(_193);
    bool _205 = _201 || _203;
    bool _207 = isnan(1.0);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _195);
    float _215 = _197 + 1.0;
    float _217 = _193 * _211;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = rsqrt(_215);
    float _223 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _213);
    float _225 = abs(_219);
    float _227 = log2(_225);
    float _229 = rsqrt(_223);
    float _231 = _181 * _221;
    float _233 = _221 * _185;
    float _235 = _183 * _221;
    float _237 = precise::max(_111, _123);
    float _239 = _227 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _241 = precise::min(_111, _123);
    float _243 = _229 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _245 = _229 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _247 = _229 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _249 = exp2(_239);
    float _251 = -_231;
    float _253 = _243 + _251;
    float _255 = -_235;
    float _257 = _245 + _255;
    float _259 = -_233;
    float _261 = _247 + _259;
    bool _263 = _241 >= 0.0;
    bool _265 = isnan(_241);
    bool _267 = _263 || _265;
    bool _269 = isnan(0.0);
    bool _271 = _267 || _269;
    float _273 = _253 * _253;
    bool _275 = _97 >= _237;
    bool _277 = isnan(_97);
    bool _279 = _275 || _277;
    bool _281 = isnan(_237);
    bool _283 = _279 || _281;
    bool _285 = _283 && _271;
    float _287 = float(_285);
    float _289 = fma(_257, _257, _273);
    float _291 = fma(_261, _261, _289);
    float _293 = fma(_69, 2.0, -1.0);
    float _295 = fma(_67, 2.0, -1.0);
    float _297 = fma(_71, 2.0, -1.0);
    float _299 = _287 * _249;
    float _301 = rsqrt(_291);
    float _303 = _293 * _253;
    float _305 = -_253;
    float _307 = _231 * _305;
    float _309 = _295 * _245;
    float _311 = -_295;
    float _313 = -_303;
    float _315 = fma(_311, _257, _313);
    float _317 = -_235;
    float _319 = fma(_317, _257, _307);
    float _321 = -_297;
    float _323 = fma(_321, _261, _315);
    float _325 = -_231;
    float _327 = _293 * _325;
    float _329 = -_233;
    float _331 = fma(_329, _261, _319);
    float _333 = -_327;
    float _335 = fma(_295, _235, _333);
    float _337 = -_243;
    float _339 = -_309;
    float _341 = fma(_293, _337, _339);
    float _343 = _301 * _323;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = 1.0 / _331;
    float _349 = fma(_297, _233, _335);
    float _351 = -_247;
    float _353 = fma(_297, _351, _341);
    float _355 = precise::min(_349, _353);
    float _357 = abs(_345);
    float _359 = log2(_357);
    float _361 = _345 * _355;
    float _363 = _361 * 2.0;
    float _365 = _363 * _347;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _153 * _359;
    float _371 = _293 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _373 = _157 + _159;
    float _375 = exp2(_369);
    float _377 = fma(_295, (*spvDescriptorSet0.fp_c4)._m0[15].x, _371);
    float _379 = _373 + _163;
    float _381 = fma(_297, (*spvDescriptorSet0.fp_c4)._m0[15].z, _377);
    float _383 = _379 + _167;
    float _385 = -_229;
    float _387 = fma(_385, _381, 0.0);
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = _383 * _299;
    float _393 = _391 * 0.25;
    float _395 = _393 * _375;
    float _397 = _173 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _399 = _173 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _401 = _177 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _403 = _367 * _395;
    float _405 = _393 * _389;
    float _407 = _175 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _409 = _175 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _411 = _155 * _403;
    float _413 = _177 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _415 = _397 * _405;
    float _417 = _407 * _405;
    float _419 = _399 * _411;
    float _421 = _413 * _405;
    float _423 = _409 * _411;
    float _425 = _401 * _411;
    out.m_49.x = _415;
    out.m_49.y = _417;
    out.m_49.z = _421;
    out.m_51.x = _419;
    out.m_51.y = _423;
    out.m_51.z = _425;
    return out;
}

