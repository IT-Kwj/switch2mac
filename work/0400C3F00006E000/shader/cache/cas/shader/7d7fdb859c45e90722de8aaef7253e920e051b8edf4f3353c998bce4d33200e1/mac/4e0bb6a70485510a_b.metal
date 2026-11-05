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
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
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
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _440 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_440, float2(0.0), isnan(_440))).x;
    float2 _451 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_451, float2(0.0), isnan(_451))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_42.w;
    float _75 = in.m_44.w;
    float _77 = in.m_42.y;
    float _79 = in.m_42.x;
    float _81 = in.m_44.x;
    float _83 = in.m_44.y;
    float _85 = in.m_42.z;
    float _87 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _89 = -_87;
    float _91 = fma(_89, _73, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _93 = -_87;
    float _95 = fma(_93, _75, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _97 = -_87;
    float _99 = fma(_97, _77, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _101 = -_87;
    float _103 = fma(_101, _79, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _105 = 1.0 / _91;
    float _107 = -_87;
    float _109 = fma(_107, _81, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _111 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[17].y, _99);
    float _113 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _115 = -_91;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _119 = -_87;
    float _121 = fma(_119, _83, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _123 = -_87;
    float _125 = fma(_123, _85, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _127 = 1.0 / _95;
    float _129 = -_91;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c4)._m0[17].y, _99);
    float _133 = _111 * _105;
    float _135 = _125 * _105;
    float _137 = _113 * _105;
    float _139 = _117 * _105;
    float _141 = _131 * _105;
    float _143 = fma(_109, _127, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _145 = fma(_121, _127, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _147 = _143 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _149 = _145 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _611 = float2(_137, _133);
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611)), _135);
    float2 _619 = float2(_139, _133);
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_619, float2(0.0), isnan(_619)), _135);
    float2 _626 = float2(_71, 0.0);
    float2 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_626, float2(0.0), isnan(_626))).xy;
    float _159 = _157.x;
    float _161 = _157.y;
    float2 _638 = float2(_137, _141);
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_638, float2(0.0), isnan(_638)), _135);
    float2 _646 = float2(_139, _141);
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646)), _135);
    float2 _654 = float2(_147, _149);
    float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_654, float2(0.0), isnan(_654))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_654, float2(0.0), isnan(_654))).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = in.m_44.z;
    float _179 = in.m_46.y;
    float _181 = in.m_46.x;
    float _183 = in.m_46.z;
    float _185 = -_87;
    float _187 = fma(_185, _177, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _189 = _179 * _179;
    float _191 = fma(_187, -0.5, 0.5);
    float _193 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _195 = fma(_181, _181, _189);
    bool _199 = _191 <= 1.0;
    bool _201 = isnan(_191);
    bool _203 = _199 || _201;
    bool _205 = isnan(1.0);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _193);
    float _213 = _195 + 1.0;
    float _215 = _191 * _209;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = rsqrt(_213);
    float _221 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _211);
    float _223 = abs(_217);
    float _225 = log2(_223);
    float _227 = rsqrt(_221);
    float _229 = _179 * _219;
    float _231 = _181 * _219;
    float _233 = _219 * _183;
    float _235 = precise::min(_109, _121);
    float _237 = precise::max(_109, _121);
    float _239 = _225 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    bool _241 = _235 >= 0.0;
    bool _243 = isnan(_235);
    bool _245 = _241 || _243;
    bool _247 = isnan(0.0);
    bool _249 = _245 || _247;
    float _251 = exp2(_239);
    bool _253 = _95 >= _237;
    bool _255 = isnan(_95);
    bool _257 = _253 || _255;
    bool _259 = isnan(_237);
    bool _261 = _257 || _259;
    bool _263 = _261 && _249;
    float _265 = float(_263);
    float _267 = _227 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _269 = _227 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _271 = _227 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _273 = fma(_67, 2.0, -1.0);
    float _275 = -_229;
    float _277 = _267 + _275;
    float _279 = -_231;
    float _281 = _269 + _279;
    float _283 = -_233;
    float _285 = _271 + _283;
    float _287 = fma(_65, 2.0, -1.0);
    float _289 = _277 * _277;
    float _291 = _273 * _277;
    float _293 = fma(_69, 2.0, -1.0);
    float _295 = fma(_281, _281, _289);
    float _297 = -_287;
    float _299 = -_291;
    float _301 = fma(_297, _281, _299);
    float _303 = _265 * _251;
    float _305 = -_277;
    float _307 = _229 * _305;
    float _309 = fma(_285, _285, _295);
    float _311 = -_293;
    float _313 = fma(_311, _285, _301);
    float _315 = -_229;
    float _317 = _273 * _315;
    float _319 = -_231;
    float _321 = fma(_319, _281, _307);
    float _323 = _287 * _269;
    float _325 = rsqrt(_309);
    float _327 = -_233;
    float _329 = fma(_327, _285, _321);
    float _331 = -_317;
    float _333 = fma(_287, _231, _331);
    float _335 = -_267;
    float _337 = -_323;
    float _339 = fma(_273, _335, _337);
    float _341 = _273 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _343 = fma(_293, _233, _333);
    float _345 = -_271;
    float _347 = fma(_293, _345, _339);
    float _349 = 1.0 / _329;
    float _351 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[15].x, _341);
    float _353 = fma(_293, (*spvDescriptorSet0.fp_c4)._m0[15].z, _351);
    float _355 = _325 * _313;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = -_227;
    float _361 = fma(_359, _353, 0.0);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = abs(_357);
    float _367 = log2(_365);
    float _369 = _151 + _153;
    float _371 = _159 * _367;
    float _373 = _369 + _163;
    float _375 = exp2(_371);
    float _377 = precise::min(_343, _347);
    float _379 = _373 + _165;
    float _381 = _173 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _383 = _175 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _385 = _357 * _377;
    float _387 = _385 * 2.0;
    float _389 = _379 * _303;
    float _391 = _389 * 0.25;
    float _393 = _381 * 0.586610972881317138671875;
    float _395 = _171 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _397 = _387 * _349;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = _391 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _403 = fma(_395, 0.298911988735198974609375, _393);
    float _405 = _175 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _407 = _401 * _375;
    float _409 = fma(_405, 0.114477999508380889892578125, _403);
    float _411 = _173 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _413 = _399 * _407;
    float _415 = _401 * _363;
    float _417 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _419 = _161 * _413;
    float _421 = _411 * _415;
    float _423 = _417 * _415;
    float _425 = _383 * _415;
    float _427 = _419 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _429 = _409 * _427;
    out.m_49.x = _423;
    out.m_49.y = _421;
    out.m_49.z = _425;
    out.m_49.w = _429;
    return out;
}

