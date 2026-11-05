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
    float2 _406 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_406, float2(0.0), isnan(_406))).x;
    float2 _417 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_417, float2(0.0), isnan(_417))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_42.w;
    float _75 = in.m_44.w;
    float _77 = in.m_42.y;
    float _79 = in.m_42.x;
    float _81 = in.m_42.z;
    float _83 = in.m_44.x;
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
    float _109 = fma(_107, _81, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _111 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[17].y, _99);
    float _113 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _115 = -_91;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[17].x, _103);
    float _119 = -_91;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[17].y, _99);
    float _123 = -_87;
    float _125 = fma(_123, _83, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _127 = -_87;
    float _129 = fma(_127, _85, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _131 = 1.0 / _95;
    float _133 = _111 * _105;
    float _135 = _109 * _105;
    float _137 = _113 * _105;
    float _139 = _117 * _105;
    float _141 = _121 * _105;
    float2 _558 = float2(_137, _133);
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558)), _135);
    float2 _566 = float2(_139, _133);
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_566, float2(0.0), isnan(_566)), _135);
    float _147 = _125 * _131;
    float2 _576 = float2(_71, 0.0);
    float2 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_576, float2(0.0), isnan(_576))).xy;
    float _153 = _151.x;
    float _155 = _151.y;
    float2 _588 = float2(_137, _141);
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_588, float2(0.0), isnan(_588)), _135);
    float _159 = _129 * _131;
    float2 _599 = float2(_139, _141);
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_599, float2(0.0), isnan(_599)), _135);
    float2 _607 = float2(_147, _159);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_607, float2(0.0), isnan(_607))).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = in.m_46.y;
    float _175 = in.m_46.x;
    float _177 = in.m_46.z;
    float _179 = _173 * _173;
    float _181 = fma(_175, _175, _179);
    float _183 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _185 = in.m_44.z;
    float _187 = _181 + 1.0;
    float _189 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _183);
    float _191 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _189);
    float _193 = rsqrt(_187);
    float _195 = rsqrt(_191);
    float _197 = _173 * _193;
    float _199 = _175 * _193;
    float _201 = _193 * _177;
    float _203 = _195 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _205 = _195 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _207 = _195 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _209 = -_87;
    float _211 = fma(_209, _185, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _213 = -_197;
    float _215 = _203 + _213;
    float _217 = -_199;
    float _219 = _205 + _217;
    float _221 = -_201;
    float _223 = _207 + _221;
    float _225 = _215 * _215;
    float _227 = -_215;
    float _229 = _197 * _227;
    float _231 = fma(_219, _219, _225);
    float _233 = fma(_211, -0.5, 0.5);
    float _235 = fma(_67, 2.0, -1.0);
    float _237 = fma(_65, 2.0, -1.0);
    float _239 = fma(_223, _223, _231);
    float _241 = fma(_69, 2.0, -1.0);
    bool _245 = _233 <= 1.0;
    bool _247 = isnan(_233);
    bool _249 = _245 || _247;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = _235 * _215;
    float _259 = rsqrt(_239);
    float _261 = _233 * _255;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = -_237;
    float _267 = -_257;
    float _269 = fma(_265, _219, _267);
    float _271 = -_241;
    float _273 = fma(_271, _223, _269);
    float _275 = -_199;
    float _277 = fma(_275, _219, _229);
    float _279 = abs(_263);
    float _281 = log2(_279);
    float _283 = -_197;
    float _285 = _235 * _283;
    float _287 = -_201;
    float _289 = fma(_287, _223, _277);
    float _291 = _237 * _205;
    float _293 = -_285;
    float _295 = fma(_237, _199, _293);
    float _297 = _259 * _273;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = -_203;
    float _303 = -_291;
    float _305 = fma(_235, _301, _303);
    float _307 = 1.0 / _289;
    float _309 = fma(_241, _201, _295);
    float _311 = _235 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _313 = -_207;
    float _315 = fma(_241, _313, _305);
    float _317 = _281 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _319 = fma(_237, (*spvDescriptorSet0.fp_c4)._m0[15].x, _311);
    float _321 = abs(_299);
    float _323 = log2(_321);
    float _325 = precise::min(_309, _315);
    float _327 = fma(_241, (*spvDescriptorSet0.fp_c4)._m0[15].z, _319);
    float _329 = _299 * _325;
    float _331 = _329 * 2.0;
    float _333 = -_195;
    float _335 = fma(_333, _327, 0.0);
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = exp2(_317);
    float _341 = _331 * _307;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _143 + _145;
    float _347 = _153 * _323;
    float _349 = _345 + _157;
    float _351 = exp2(_347);
    float _353 = _349 + _161;
    float _355 = _339 * _353;
    float _357 = _355 * 0.25;
    float _359 = _169 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _361 = _167 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _363 = _167 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _365 = _357 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _367 = _359 * 0.586610972881317138671875;
    float _369 = _365 * _337;
    float _371 = fma(_361, 0.298911988735198974609375, _367);
    float _373 = _171 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _375 = _365 * _351;
    float _377 = _363 * _369;
    float _379 = fma(_373, 0.114477999508380889892578125, _371);
    float _381 = _343 * _375;
    float _383 = _169 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _385 = _155 * _381;
    float _387 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _389 = _383 * _369;
    float _391 = _385 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _393 = _387 * _369;
    float _395 = _379 * _391;
    out.m_49.x = _377;
    out.m_49.y = _389;
    out.m_49.z = _393;
    out.m_49.w = _395;
    return out;
}

