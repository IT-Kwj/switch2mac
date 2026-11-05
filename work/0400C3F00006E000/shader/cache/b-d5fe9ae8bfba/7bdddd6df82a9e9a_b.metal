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
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
    float4 m_49 [[color(1)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _56 = in.m_38.x;
    float _58 = in.m_38.y;
    float2 _416 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_416, float2(0.0), isnan(_416))).x;
    float2 _427 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_427, float2(0.0), isnan(_427))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_40.w;
    float _75 = in.m_40.y;
    float _77 = in.m_40.x;
    float _79 = in.m_40.z;
    float _81 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _83 = -_81;
    float _85 = fma(_83, _73, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _87 = -_81;
    float _89 = fma(_87, _75, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _91 = -_81;
    float _93 = fma(_91, _77, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _95 = -_81;
    float _97 = fma(_95, _79, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _99 = 1.0 / _85;
    float _101 = fma(_85, (*spvDescriptorSet0.fp_c4)._m0[17].y, _89);
    float _103 = fma(_85, (*spvDescriptorSet0.fp_c4)._m0[17].x, _93);
    float _105 = -_85;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[17].x, _93);
    float _109 = -_85;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[17].y, _89);
    float _113 = _101 * _99;
    float _115 = _97 * _99;
    float _117 = _103 * _99;
    float _119 = _107 * _99;
    float _121 = _111 * _99;
    float2 _535 = float2(_71, 0.0);
    float2 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_535, float2(0.0), isnan(_535))).xy;
    float _127 = _125.x;
    float _129 = _125.y;
    float2 _547 = float2(_117, _113);
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547)), _115);
    float2 _555 = float2(_119, _113);
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555)), _115);
    float2 _563 = float2(_117, _121);
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563)), _115);
    float2 _571 = float2(_119, _121);
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571)), _115);
    float _139 = in.m_42.w;
    float _141 = in.m_44.y;
    float _143 = in.m_44.x;
    float _145 = in.m_44.z;
    float _147 = in.m_42.x;
    float _149 = in.m_42.y;
    float _151 = -_81;
    float _153 = fma(_151, _139, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _155 = _141 * _141;
    float _157 = -_81;
    float _159 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _161 = fma(_157, _141, _159);
    float _163 = -_81;
    float _165 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _167 = fma(_163, _143, _165);
    float _169 = -_153;
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _173 = fma(_143, _143, _155);
    float _175 = -_81;
    float _177 = fma(_175, _147, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _179 = -_81;
    float _181 = fma(_179, _149, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _183 = _173 + 1.0;
    bool _187 = _171 <= 1.0;
    bool _189 = isnan(_171);
    bool _191 = _187 || _189;
    bool _193 = isnan(1.0);
    bool _195 = _191 || _193;
    float _197 = float(_195);
    float _199 = _161 * _161;
    float _201 = fma(_65, 2.0, -1.0);
    float _203 = fma(_69, 2.0, -1.0);
    float _205 = _171 * _197;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -_81;
    float _211 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _213 = fma(_209, _145, _211);
    float _215 = fma(_167, _167, _199);
    float _217 = rsqrt(_183);
    float _219 = fma(_213, _213, _215);
    float _221 = abs(_207);
    float _223 = log2(_221);
    float _225 = rsqrt(_219);
    float _227 = _143 * _217;
    float _229 = _141 * _217;
    float _231 = _145 * _217;
    float _233 = precise::min(_177, _181);
    float _235 = precise::max(_177, _181);
    float _237 = _223 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    bool _239 = _233 >= 0.0;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan(0.0);
    bool _247 = _243 || _245;
    bool _249 = _153 >= _235;
    bool _251 = isnan(_153);
    bool _253 = _249 || _251;
    bool _255 = isnan(_235);
    bool _257 = _253 || _255;
    bool _259 = _257 && _247;
    float _261 = float(_259);
    float _263 = exp2(_237);
    float _265 = _161 * _225;
    float _267 = _167 * _225;
    float _269 = _213 * _225;
    float _271 = -_229;
    float _273 = _265 + _271;
    float _275 = -_227;
    float _277 = _267 + _275;
    float _279 = -_231;
    float _281 = _269 + _279;
    float _283 = _201 * _267;
    float _285 = _273 * _273;
    float _287 = fma(_277, _277, _285);
    float _289 = _261 * _263;
    float _291 = -_273;
    float _293 = _229 * _291;
    float _295 = fma(_281, _281, _287);
    float _297 = fma(_67, 2.0, -1.0);
    float _299 = -_227;
    float _301 = fma(_299, _277, _293);
    float _303 = _297 * _273;
    float _305 = rsqrt(_295);
    float _307 = -_265;
    float _309 = -_283;
    float _311 = fma(_297, _307, _309);
    float _313 = -_229;
    float _315 = _297 * _313;
    float _317 = -_201;
    float _319 = -_303;
    float _321 = fma(_317, _277, _319);
    float _323 = _297 * _161;
    float _325 = -_231;
    float _327 = fma(_325, _281, _301);
    float _329 = -_315;
    float _331 = fma(_201, _227, _329);
    float _333 = -_203;
    float _335 = fma(_333, _281, _321);
    float _337 = fma(_201, _167, _323);
    float _339 = -_269;
    float _341 = fma(_203, _339, _311);
    float _343 = fma(_203, _231, _331);
    float _345 = 1.0 / _327;
    float _347 = fma(_203, _213, _337);
    float _349 = precise::min(_343, _341);
    float _351 = _305 * _335;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = -_225;
    float _357 = fma(_355, _347, 0.0);
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = abs(_353);
    float _363 = log2(_361);
    float _365 = _353 * _349;
    float _367 = _365 * 2.0;
    float _369 = _367 * _345;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _127 * _363;
    float _375 = _131 + _133;
    float _377 = exp2(_373);
    float _379 = _375 + _135;
    float _381 = _379 + _137;
    float _383 = _381 * _289;
    float _385 = _383 * 0.25;
    float _387 = _385 * _359;
    float _389 = _385 * _377;
    float _391 = _387 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _393 = _371 * _389;
    float _395 = _387 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _397 = _387 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _399 = _129 * _393;
    float _401 = _399 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _403 = _399 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _405 = _399 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    out.m_47.x = _391;
    out.m_47.y = _395;
    out.m_47.z = _397;
    out.m_49.x = _401;
    out.m_49.y = _403;
    out.m_49.z = _405;
    return out;
}

