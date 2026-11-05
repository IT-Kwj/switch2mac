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
    float2 _416 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_416, float2(0.0), isnan(_416))).x;
    float2 _427 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_427, float2(0.0), isnan(_427))).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = in.m_42.w;
    float _77 = in.m_44.w;
    float _79 = in.m_44.y;
    float _81 = in.m_42.y;
    float _83 = in.m_44.x;
    float _85 = in.m_42.x;
    float _87 = in.m_44.z;
    float _89 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _91 = -_89;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _95 = -_89;
    float _97 = fma(_95, _77, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _99 = -_89;
    float _101 = fma(_99, _79, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _103 = -_89;
    float _105 = fma(_103, _81, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _107 = 1.0 / _93;
    float _109 = -_89;
    float _111 = fma(_109, _83, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _113 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[17].y, _101);
    float _115 = -_89;
    float _117 = fma(_115, _85, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _119 = -_89;
    float _121 = fma(_119, _87, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _123 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[17].x, _111);
    float _125 = -_97;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[17].x, _111);
    float _129 = -_97;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c4)._m0[17].y, _101);
    float _133 = 1.0 / _97;
    float _135 = _105 * _107;
    float _137 = _117 * _107;
    float _139 = _113 * _133;
    float _141 = _121 * _133;
    float _143 = _123 * _133;
    float _145 = _127 * _133;
    float2 _570 = float2(_73, 0.0);
    float2 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_570, float2(0.0), isnan(_570))).xy;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _131 * _133;
    float2 _585 = float2(_143, _139);
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_585, float2(0.0), isnan(_585)), _141);
    float2 _593 = float2(_145, _139);
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_593, float2(0.0), isnan(_593)), _141);
    float2 _601 = float2(_143, _155);
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601)), _141);
    float2 _609 = float2(_145, _155);
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_609, float2(0.0), isnan(_609)), _141);
    float2 _617 = float2(_137, _135);
    float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_617, float2(0.0), isnan(_617))).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = in.m_46.y;
    float _177 = in.m_46.x;
    float _179 = in.m_46.z;
    float _181 = fma(_67, 2.0, -1.0);
    float _183 = fma(_71, 2.0, -1.0);
    float _185 = -_93;
    float _187 = fma(_185, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _189 = _175 * _175;
    float _191 = -_89;
    float _193 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _195 = fma(_191, _177, _193);
    float _197 = fma(_177, _177, _189);
    float _199 = -_89;
    float _201 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _203 = fma(_199, _175, _201);
    float _205 = -_89;
    float _207 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _209 = fma(_205, _179, _207);
    float _211 = _197 + 1.0;
    float _213 = _203 * _203;
    float _215 = fma(_195, _195, _213);
    float _217 = fma(_209, _209, _215);
    float _219 = rsqrt(_211);
    float _221 = rsqrt(_217);
    float _223 = _175 * _219;
    float _225 = _177 * _219;
    float _227 = _179 * _219;
    float _229 = _203 * _221;
    float _231 = _195 * _221;
    float _233 = _209 * _221;
    float _235 = -_223;
    float _237 = _229 + _235;
    float _239 = -_225;
    float _241 = _231 + _239;
    float _243 = -_227;
    float _245 = _233 + _243;
    float _247 = _181 * _231;
    float _249 = _237 * _237;
    float _251 = -_237;
    float _253 = _223 * _251;
    float _255 = fma(_241, _241, _249);
    float _257 = fma(_69, 2.0, -1.0);
    float _259 = fma(_245, _245, _255);
    bool _263 = _187 <= 1.0;
    bool _265 = isnan(_187);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_223;
    float _277 = _257 * _275;
    float _279 = _257 * _203;
    float _281 = -_229;
    float _283 = -_247;
    float _285 = fma(_257, _281, _283);
    float _287 = rsqrt(_259);
    float _289 = _187 * _273;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = _257 * _237;
    float _295 = -_225;
    float _297 = fma(_295, _241, _253);
    float _299 = -_277;
    float _301 = fma(_181, _225, _299);
    float _303 = fma(_181, _195, _279);
    float _305 = -_181;
    float _307 = -_293;
    float _309 = fma(_305, _241, _307);
    float _311 = -_227;
    float _313 = fma(_311, _245, _297);
    float _315 = abs(_291);
    float _317 = log2(_315);
    float _319 = fma(_183, _227, _301);
    float _321 = -_183;
    float _323 = fma(_321, _245, _309);
    float _325 = -_233;
    float _327 = fma(_183, _325, _285);
    float _329 = fma(_183, _209, _303);
    float _331 = _287 * _323;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = 1.0 / _313;
    float _337 = precise::min(_319, _327);
    float _339 = -_221;
    float _341 = fma(_339, _329, 0.0);
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _333 * _337;
    float _347 = _345 * 2.0;
    float _349 = _317 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _351 = abs(_333);
    float _353 = log2(_351);
    float _355 = exp2(_349);
    float _357 = _347 * _335;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _151 * _353;
    float _363 = exp2(_361);
    float _365 = _157 + _159;
    float _367 = _365 + _161;
    float _369 = _367 + _163;
    float _371 = _169 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _373 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _375 = _169 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _377 = _355 * _369;
    float _379 = _377 * 0.25;
    float _381 = _171 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _383 = _173 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _385 = _173 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _387 = _379 * _363;
    float _389 = _379 * _343;
    float _391 = _359 * _387;
    float _393 = _371 * _389;
    float _395 = _373 * _389;
    float _397 = _383 * _389;
    float _399 = _153 * _391;
    float _401 = _375 * _399;
    float _403 = _381 * _399;
    float _405 = _385 * _399;
    out.m_49.x = _393;
    out.m_49.y = _395;
    out.m_49.z = _397;
    out.m_51.x = _401;
    out.m_51.y = _403;
    out.m_51.z = _405;
    return out;
}

