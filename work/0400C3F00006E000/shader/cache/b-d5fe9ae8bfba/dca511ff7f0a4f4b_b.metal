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
    float2 _454 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_454, float2(0.0), isnan(_454))).x;
    float2 _465 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_465, float2(0.0), isnan(_465))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_42.w;
    float _75 = in.m_44.w;
    float _77 = in.m_42.y;
    float _79 = in.m_42.x;
    float _81 = in.m_44.y;
    float _83 = in.m_42.z;
    float _85 = in.m_44.x;
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
    float _109 = fma(_107, _81, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _111 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[17].y, _99);
    float _113 = -_87;
    float _115 = fma(_113, _83, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _117 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _119 = -_91;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _123 = -_87;
    float _125 = fma(_123, _85, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _127 = -_91;
    float _129 = fma(_127, (*spvDescriptorSet0.fp_c4)._m0[17].y, _99);
    float _131 = 1.0 / _95;
    float _133 = _111 * _105;
    float _135 = _115 * _105;
    float _137 = _117 * _105;
    float _139 = _121 * _105;
    float _141 = _129 * _105;
    float _143 = fma(_109, _131, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float2 _612 = float2(_137, _133);
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_612, float2(0.0), isnan(_612)), _135);
    float2 _620 = float2(_139, _133);
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620)), _135);
    float _149 = _143 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _631 = float2(_71, 0.0);
    float2 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_631, float2(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_631, float2(0.0), isnan(_631))).xy;
    float _155 = _153.x;
    float _157 = _153.y;
    float2 _643 = float2(_137, _141);
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_643, float2(0.0), isnan(_643)), _135);
    float _161 = fma(_125, _131, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float2 _656 = float2(_139, _141);
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_656, float2(0.0), isnan(_656)), _135);
    float _165 = _161 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float2 _668 = float2(_165, _149);
    float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_668, float2(0.0), isnan(_668))).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = in.m_46.y;
    float _179 = in.m_46.x;
    float _181 = in.m_46.z;
    float _183 = -_95;
    float _185 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    bool _189 = _185 <= 1.0;
    bool _191 = isnan(_185);
    bool _193 = _189 || _191;
    bool _195 = isnan(1.0);
    bool _197 = _193 || _195;
    float _199 = float(_197);
    float _201 = _177 * _177;
    float _203 = fma(_179, _179, _201);
    float _205 = -_87;
    float _207 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _209 = fma(_205, _177, _207);
    float _211 = -_87;
    float _213 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _215 = fma(_211, _179, _213);
    float _217 = -_87;
    float _219 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _221 = fma(_217, _181, _219);
    float _223 = _203 + 1.0;
    float _225 = _209 * _209;
    float _227 = _185 * _199;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_215, _215, _225);
    float _233 = rsqrt(_223);
    float _235 = fma(_221, _221, _231);
    float _237 = abs(_229);
    float _239 = log2(_237);
    float _241 = rsqrt(_235);
    float _243 = _177 * _233;
    float _245 = _179 * _233;
    float _247 = _181 * _233;
    float _249 = _209 * _241;
    float _251 = _215 * _241;
    float _253 = _221 * _241;
    float _255 = -_243;
    float _257 = _249 + _255;
    float _259 = -_245;
    float _261 = _251 + _259;
    float _263 = -_247;
    float _265 = _253 + _263;
    float _267 = _239 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _269 = _257 * _257;
    float _271 = fma(_67, 2.0, -1.0);
    float _273 = fma(_65, 2.0, -1.0);
    float _275 = fma(_69, 2.0, -1.0);
    float _277 = fma(_261, _261, _269);
    float _279 = _271 * _257;
    float _281 = -_257;
    float _283 = _243 * _281;
    float _285 = _273 * _251;
    float _287 = fma(_265, _265, _277);
    float _289 = -_273;
    float _291 = -_279;
    float _293 = fma(_289, _261, _291);
    float _295 = exp2(_267);
    float _297 = -_249;
    float _299 = -_285;
    float _301 = fma(_271, _297, _299);
    float _303 = -_245;
    float _305 = fma(_303, _261, _283);
    float _307 = -_275;
    float _309 = fma(_307, _265, _293);
    float _311 = -_243;
    float _313 = _271 * _311;
    float _315 = -_253;
    float _317 = fma(_275, _315, _301);
    float _319 = _271 * _209;
    float _321 = precise::min(_125, _109);
    float _323 = rsqrt(_287);
    float _325 = precise::max(_125, _109);
    float _327 = -_247;
    float _329 = fma(_327, _265, _305);
    bool _331 = _321 >= 0.0;
    bool _333 = isnan(_321);
    bool _335 = _331 || _333;
    bool _337 = isnan(0.0);
    bool _339 = _335 || _337;
    float _341 = -_313;
    float _343 = fma(_273, _245, _341);
    float _345 = fma(_273, _215, _319);
    bool _347 = _95 >= _325;
    bool _349 = isnan(_95);
    bool _351 = _347 || _349;
    bool _353 = isnan(_325);
    bool _355 = _351 || _353;
    bool _357 = _355 && _339;
    float _359 = float(_357);
    float _361 = 1.0 / _329;
    float _363 = fma(_275, _247, _343);
    float _365 = fma(_275, _221, _345);
    float _367 = _359 * _295;
    float _369 = precise::min(_363, _317);
    float _371 = -_241;
    float _373 = fma(_371, _365, 0.0);
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _323 * _309;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = abs(_379);
    float _383 = log2(_381);
    float _385 = _379 * _369;
    float _387 = _385 * 2.0;
    float _389 = _387 * _361;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _145 + _147;
    float _395 = _155 * _383;
    float _397 = _393 + _159;
    float _399 = exp2(_395);
    float _401 = _397 + _163;
    float _403 = _401 * _367;
    float _405 = _403 * 0.25;
    float _407 = _173 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _409 = _171 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _411 = _405 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _413 = _175 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _415 = _407 * 0.586610972881317138671875;
    float _417 = _411 * _375;
    float _419 = fma(_409, 0.298911988735198974609375, _415);
    float _421 = _411 * _399;
    float _423 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _425 = fma(_413, 0.114477999508380889892578125, _419);
    float _427 = _391 * _421;
    float _429 = _173 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _431 = _423 * _417;
    float _433 = _157 * _427;
    float _435 = _175 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _437 = _429 * _417;
    float _439 = _433 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _441 = _435 * _417;
    float _443 = _425 * _439;
    out.m_49.x = _431;
    out.m_49.y = _437;
    out.m_49.z = _441;
    out.m_49.w = _443;
    return out;
}

