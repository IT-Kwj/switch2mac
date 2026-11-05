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
    float2 _420 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_420, float2(0.0), isnan(_420))).x;
    float2 _431 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_431, float2(0.0), isnan(_431))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_42.w;
    float _75 = in.m_44.w;
    float _77 = in.m_42.y;
    float _79 = in.m_42.x;
    float _81 = in.m_44.x;
    float _83 = in.m_42.z;
    float _85 = in.m_44.y;
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
    float _113 = -_87;
    float _115 = fma(_113, _83, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _117 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _119 = -_91;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _123 = -_91;
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c4)._m0[17].y, _99);
    float _127 = -_87;
    float _129 = fma(_127, _85, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _131 = 1.0 / _95;
    float _133 = _111 * _105;
    float _135 = _115 * _105;
    float _137 = _117 * _105;
    float _139 = _121 * _105;
    float _141 = _125 * _105;
    float _143 = _109 * _131;
    float2 _575 = float2(_137, _133);
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_575, float2(0.0), isnan(_575)), _135);
    float2 _583 = float2(_139, _133);
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_583, float2(0.0), isnan(_583)), _135);
    float _149 = _129 * _131;
    float2 _593 = float2(_71, 0.0);
    float2 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_593, float2(0.0), isnan(_593))).xy;
    float _155 = _153.x;
    float _157 = _153.y;
    float2 _605 = float2(_137, _141);
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_605, float2(0.0), isnan(_605)), _135);
    float2 _613 = float2(_139, _141);
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_613, float2(0.0), isnan(_613)), _135);
    float2 _621 = float2(_143, _149);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_621, float2(0.0), isnan(_621))).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = in.m_46.y;
    float _175 = in.m_46.x;
    float _177 = in.m_46.z;
    float _179 = _173 * _173;
    float _181 = fma(_175, _175, _179);
    float _183 = -_87;
    float _185 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _187 = fma(_183, _173, _185);
    float _189 = -_87;
    float _191 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _193 = fma(_189, _175, _191);
    float _195 = -_87;
    float _197 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _199 = fma(_195, _177, _197);
    float _201 = _181 + 1.0;
    float _203 = _187 * _187;
    float _205 = fma(_193, _193, _203);
    float _207 = fma(_199, _199, _205);
    float _209 = rsqrt(_201);
    float _211 = -_95;
    float _213 = fma(_211, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _215 = rsqrt(_207);
    bool _219 = _213 <= 1.0;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan(1.0);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = _173 * _209;
    float _233 = _175 * _209;
    float _235 = _177 * _209;
    float _237 = _213 * _229;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _187 * _215;
    float _243 = _193 * _215;
    float _245 = _199 * _215;
    float _247 = -_231;
    float _249 = _241 + _247;
    float _251 = -_233;
    float _253 = _243 + _251;
    float _255 = -_235;
    float _257 = _245 + _255;
    float _259 = _249 * _249;
    float _261 = fma(_253, _253, _259);
    float _263 = fma(_257, _257, _261);
    float _265 = rsqrt(_263);
    float _267 = fma(_67, 2.0, -1.0);
    float _269 = -_249;
    float _271 = _231 * _269;
    float _273 = fma(_65, 2.0, -1.0);
    float _275 = fma(_69, 2.0, -1.0);
    float _277 = _267 * _249;
    float _279 = -_231;
    float _281 = _267 * _279;
    float _283 = -_233;
    float _285 = fma(_283, _253, _271);
    float _287 = abs(_239);
    float _289 = log2(_287);
    float _291 = -_273;
    float _293 = -_277;
    float _295 = fma(_291, _253, _293);
    float _297 = -_281;
    float _299 = fma(_273, _233, _297);
    float _301 = -_235;
    float _303 = fma(_301, _257, _285);
    float _305 = _273 * _243;
    float _307 = -_275;
    float _309 = fma(_307, _257, _295);
    float _311 = fma(_275, _235, _299);
    float _313 = _267 * _187;
    float _315 = -_241;
    float _317 = -_305;
    float _319 = fma(_267, _315, _317);
    float _321 = _265 * _309;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = 1.0 / _303;
    float _327 = fma(_273, _193, _313);
    float _329 = -_245;
    float _331 = fma(_275, _329, _319);
    float _333 = fma(_275, _199, _327);
    float _335 = _289 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _337 = precise::min(_311, _331);
    float _339 = abs(_323);
    float _341 = log2(_339);
    float _343 = -_215;
    float _345 = fma(_343, _333, 0.0);
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = _323 * _337;
    float _351 = _349 * 2.0;
    float _353 = exp2(_335);
    float _355 = _351 * _325;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = _145 + _147;
    float _361 = _155 * _341;
    float _363 = _359 + _159;
    float _365 = exp2(_361);
    float _367 = _363 + _161;
    float _369 = _169 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _371 = _167 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _373 = _353 * _367;
    float _375 = _373 * 0.25;
    float _377 = _369 * 0.586610972881317138671875;
    float _379 = _375 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _381 = fma(_371, 0.298911988735198974609375, _377);
    float _383 = _167 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _385 = _379 * _347;
    float _387 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _389 = _379 * _365;
    float _391 = _171 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _393 = _383 * _385;
    float _395 = _387 * _385;
    float _397 = _357 * _389;
    float _399 = fma(_391, 0.114477999508380889892578125, _381);
    float _401 = _169 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _403 = _157 * _397;
    float _405 = _401 * _385;
    float _407 = _403 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _409 = _399 * _407;
    out.m_49.x = _393;
    out.m_49.y = _405;
    out.m_49.z = _395;
    out.m_49.w = _409;
    return out;
}

