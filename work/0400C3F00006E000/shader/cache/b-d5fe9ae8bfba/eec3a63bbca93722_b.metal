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
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _58 = in.m_40.x;
    float _60 = in.m_40.y;
    float2 _450 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_450, float2(0.0), isnan(_450))).x;
    float2 _461 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_461, float2(0.0), isnan(_461))).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = in.m_42.w;
    float _77 = in.m_44.w;
    float _79 = in.m_42.x;
    float _81 = in.m_42.y;
    float _83 = in.m_44.y;
    float _85 = in.m_44.x;
    float _87 = in.m_44.z;
    float _89 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _91 = -_89;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _95 = -_89;
    float _97 = fma(_95, _77, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _99 = -_89;
    float _101 = fma(_99, _79, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _103 = -_89;
    float _105 = fma(_103, _81, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _107 = 1.0 / _93;
    float _109 = -_89;
    float _111 = fma(_109, _83, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _113 = -_89;
    float _115 = fma(_113, _85, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _117 = -_89;
    float _119 = fma(_117, _87, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _121 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[17].y, _111);
    float _123 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[17].x, _115);
    float _125 = -_97;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[17].x, _115);
    float _129 = 1.0 / _97;
    float _131 = -_97;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c4)._m0[17].y, _111);
    float _135 = fma(_101, _107, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _137 = fma(_105, _107, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _139 = _135 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _141 = _137 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float _143 = _121 * _129;
    float _145 = _119 * _129;
    float _147 = _123 * _129;
    float _149 = _127 * _129;
    float _151 = _133 * _129;
    float2 _620 = float2(_73, 0.0);
    float2 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_620, float2(0.0), isnan(_620))).xy;
    float _157 = _155.x;
    float _159 = _155.y;
    float2 _632 = float2(_147, _143);
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632)), _145);
    float2 _640 = float2(_149, _143);
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_640, float2(0.0), isnan(_640)), _145);
    float2 _648 = float2(_147, _151);
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_648, float2(0.0), isnan(_648)), _145);
    float2 _656 = float2(_149, _151);
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_656, float2(0.0), isnan(_656)), _145);
    float2 _664 = float2(_139, _141);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_664, float2(0.0), isnan(_664))).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float _179 = in.m_46.y;
    float _181 = in.m_46.x;
    float _183 = in.m_46.z;
    float _185 = -_93;
    float _187 = fma(_185, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _189 = fma(_69, 2.0, -1.0);
    float _191 = fma(_71, 2.0, -1.0);
    bool _195 = _187 <= 1.0;
    bool _197 = isnan(_187);
    bool _199 = _195 || _197;
    bool _201 = isnan(1.0);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -_89;
    float _209 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _211 = fma(_207, _179, _209);
    float _213 = _179 * _179;
    float _215 = -_89;
    float _217 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _219 = fma(_215, _181, _217);
    float _221 = -_89;
    float _223 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _225 = fma(_221, _183, _223);
    float _227 = _211 * _211;
    float _229 = fma(_181, _181, _213);
    float _231 = fma(_219, _219, _227);
    float _233 = _229 + 1.0;
    float _235 = fma(_225, _225, _231);
    float _237 = rsqrt(_233);
    float _239 = rsqrt(_235);
    float _241 = _187 * _205;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _179 * _237;
    float _247 = _181 * _237;
    float _249 = _183 * _237;
    float _251 = abs(_243);
    float _253 = log2(_251);
    float _255 = _211 * _239;
    float _257 = _219 * _239;
    float _259 = _225 * _239;
    float _261 = _189 * _211;
    float _263 = -_245;
    float _265 = _255 + _263;
    float _267 = -_247;
    float _269 = _257 + _267;
    float _271 = -_249;
    float _273 = _259 + _271;
    float _275 = _265 * _265;
    float _277 = -_265;
    float _279 = _245 * _277;
    float _281 = _189 * _265;
    float _283 = fma(_269, _269, _275);
    float _285 = _253 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _287 = fma(_67, 2.0, -1.0);
    float _289 = -_247;
    float _291 = fma(_289, _269, _279);
    float _293 = fma(_273, _273, _283);
    float _295 = exp2(_285);
    float _297 = -_287;
    float _299 = -_281;
    float _301 = fma(_297, _269, _299);
    float _303 = -_249;
    float _305 = fma(_303, _273, _291);
    float _307 = -_245;
    float _309 = _189 * _307;
    float _311 = _287 * _257;
    float _313 = -_191;
    float _315 = fma(_313, _273, _301);
    float _317 = fma(_287, _219, _261);
    float _319 = -_309;
    float _321 = fma(_287, _247, _319);
    float _323 = rsqrt(_293);
    float _325 = -_255;
    float _327 = -_311;
    float _329 = fma(_189, _325, _327);
    float _331 = precise::min(_101, _105);
    float _333 = fma(_191, _249, _321);
    float _335 = precise::max(_101, _105);
    float _337 = -_259;
    float _339 = fma(_191, _337, _329);
    bool _341 = _331 >= 0.0;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan(0.0);
    bool _349 = _345 || _347;
    float _351 = fma(_191, _225, _317);
    float _353 = 1.0 / _305;
    bool _355 = _93 >= _335;
    bool _357 = isnan(_93);
    bool _359 = _355 || _357;
    bool _361 = isnan(_335);
    bool _363 = _359 || _361;
    bool _365 = _363 && _349;
    float _367 = float(_365);
    float _369 = -_239;
    float _371 = fma(_369, _351, 0.0);
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = precise::min(_333, _339);
    float _377 = _367 * _295;
    float _379 = _323 * _315;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = abs(_381);
    float _385 = log2(_383);
    float _387 = _381 * _375;
    float _389 = _387 * 2.0;
    float _391 = _389 * _353;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _157 * _385;
    float _397 = _161 + _163;
    float _399 = exp2(_395);
    float _401 = _397 + _165;
    float _403 = _401 + _167;
    float _405 = _403 * _377;
    float _407 = _405 * 0.25;
    float _409 = _173 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _411 = _173 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _413 = _407 * _373;
    float _415 = _407 * _399;
    float _417 = _177 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _419 = _177 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _421 = _409 * _413;
    float _423 = _393 * _415;
    float _425 = _175 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _427 = _175 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _429 = _417 * _413;
    float _431 = _159 * _423;
    float _433 = _425 * _413;
    float _435 = _411 * _431;
    float _437 = _427 * _431;
    float _439 = _419 * _431;
    out.m_49.x = _421;
    out.m_49.y = _433;
    out.m_49.z = _429;
    out.m_51.x = _435;
    out.m_51.y = _437;
    out.m_51.z = _439;
    return out;
}

