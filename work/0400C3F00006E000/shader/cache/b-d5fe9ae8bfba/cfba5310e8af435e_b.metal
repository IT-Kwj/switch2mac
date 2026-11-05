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
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _380 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_380, float2(0.0), isnan(_380))).x;
    float2 _391 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_391, float2(0.0), isnan(_391))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_42.w;
    float _75 = in.m_44.w;
    float _77 = in.m_42.x;
    float _79 = in.m_44.z;
    float _81 = in.m_44.x;
    float _83 = in.m_44.y;
    float _85 = in.m_42.y;
    float _87 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _89 = -_87;
    float _91 = fma(_89, _73, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _93 = -_87;
    float _95 = fma(_93, _75, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _97 = -_87;
    float _99 = fma(_97, _77, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _101 = -_87;
    float _103 = fma(_101, _79, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _105 = 1.0 / _91;
    float _107 = -_87;
    float _109 = fma(_107, _81, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _111 = -_87;
    float _113 = fma(_111, _83, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _115 = -_87;
    float _117 = fma(_115, _85, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _119 = 1.0 / _95;
    float _121 = fma(_99, _105, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _123 = fma(_117, _105, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _125 = _123 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float _127 = _103 * _119;
    float _129 = _109 * _119;
    float _131 = _113 * _119;
    float _133 = _121 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float2 _519 = float2(_71, 0.0);
    float2 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_519, float2(0.0), isnan(_519))).xy;
    float _139 = _137.x;
    float _141 = _137.y;
    float2 _531 = float2(_129, _131);
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531)), _127);
    float2 _539 = float2(_133, _125);
    float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_539, float2(0.0), isnan(_539))).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = in.m_46.y;
    float _157 = in.m_46.x;
    float _159 = in.m_46.z;
    float _161 = in.m_42.z;
    float _163 = _155 * _155;
    float _165 = fma(_157, _157, _163);
    float _167 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _169 = -_87;
    float _171 = fma(_169, _161, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _173 = _165 + 1.0;
    float _175 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _167);
    float _177 = fma(_171, -0.5, 0.5);
    float _179 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _175);
    float _181 = rsqrt(_173);
    float _183 = fma(_67, 2.0, -1.0);
    float _185 = fma(_69, 2.0, -1.0);
    float _187 = rsqrt(_179);
    float _189 = _155 * _181;
    float _191 = _157 * _181;
    float _193 = _181 * _159;
    float _195 = _187 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _197 = _187 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _199 = _187 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _201 = -_189;
    float _203 = _195 + _201;
    float _205 = -_191;
    float _207 = _197 + _205;
    float _209 = -_193;
    float _211 = _199 + _209;
    float _213 = _203 * _203;
    float _215 = fma(_207, _207, _213);
    bool _219 = _177 <= 1.0;
    bool _221 = isnan(_177);
    bool _223 = _219 || _221;
    bool _225 = isnan(1.0);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = fma(_211, _211, _215);
    float _233 = _177 * _229;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = fma(_65, 2.0, -1.0);
    float _239 = _183 * _203;
    float _241 = -_203;
    float _243 = _189 * _241;
    float _245 = rsqrt(_231);
    float _247 = _237 * _197;
    float _249 = -_237;
    float _251 = -_239;
    float _253 = fma(_249, _207, _251);
    float _255 = -_191;
    float _257 = fma(_255, _207, _243);
    float _259 = -_189;
    float _261 = _183 * _259;
    float _263 = -_195;
    float _265 = -_247;
    float _267 = fma(_183, _263, _265);
    float _269 = -_185;
    float _271 = fma(_269, _211, _253);
    float _273 = -_193;
    float _275 = fma(_273, _211, _257);
    float _277 = abs(_235);
    float _279 = log2(_277);
    float _281 = -_261;
    float _283 = fma(_237, _191, _281);
    float _285 = -_199;
    float _287 = fma(_185, _285, _267);
    float _289 = fma(_185, _193, _283);
    float _291 = _245 * _271;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = precise::min(_289, _287);
    float _297 = abs(_293);
    float _299 = log2(_297);
    float _301 = _293 * _295;
    float _303 = _301 * 2.0;
    float _305 = _279 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _307 = exp2(_305);
    float _309 = 1.0 / _275;
    float _311 = _303 * _309;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = _139 * _299;
    float _317 = _307 * _143;
    float _319 = _183 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _321 = exp2(_315);
    float _323 = _317 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _325 = _151 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _327 = fma(_237, (*spvDescriptorSet0.fp_c4)._m0[15].x, _319);
    float _329 = _149 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _331 = _325 * 0.586610972881317138671875;
    float _333 = fma(_185, (*spvDescriptorSet0.fp_c4)._m0[15].z, _327);
    float _335 = _153 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _337 = fma(_329, 0.298911988735198974609375, _331);
    float _339 = _153 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _341 = -_187;
    float _343 = fma(_341, _333, 0.0);
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_339, 0.114477999508380889892578125, _337);
    float _349 = _323 * _321;
    float _351 = _323 * _345;
    float _353 = _149 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _355 = _151 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _357 = _313 * _349;
    float _359 = _335 * _351;
    float _361 = _353 * _351;
    float _363 = _355 * _351;
    float _365 = _141 * _357;
    float _367 = _365 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _369 = _347 * _367;
    out.m_49.x = _361;
    out.m_49.y = _363;
    out.m_49.z = _359;
    out.m_49.w = _369;
    return out;
}

