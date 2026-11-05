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
    float2 _394 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_394, float2(0.0), isnan(_394))).x;
    float2 _405 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_405, float2(0.0), isnan(_405))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_42.w;
    float _75 = in.m_44.w;
    float _77 = in.m_42.x;
    float _79 = in.m_42.y;
    float _81 = in.m_44.z;
    float _83 = in.m_44.x;
    float _85 = in.m_44.y;
    float _87 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _89 = -_87;
    float _91 = fma(_89, _73, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _93 = -_87;
    float _95 = fma(_93, _75, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _97 = -_87;
    float _99 = fma(_97, _77, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _101 = -_87;
    float _103 = fma(_101, _79, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _105 = 1.0 / _91;
    float _107 = -_87;
    float _109 = fma(_107, _81, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _111 = -_87;
    float _113 = fma(_111, _83, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _115 = -_87;
    float _117 = fma(_115, _85, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _119 = 1.0 / _95;
    float _121 = fma(_99, _105, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _123 = fma(_103, _105, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _125 = _123 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float _127 = _109 * _119;
    float _129 = _113 * _119;
    float _131 = _117 * _119;
    float _133 = _121 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float2 _533 = float2(_71, 0.0);
    float2 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_533, float2(0.0), isnan(_533))).xy;
    float _139 = _137.x;
    float _141 = _137.y;
    float2 _545 = float2(_129, _131);
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_545, float2(0.0), isnan(_545)), _127);
    float2 _553 = float2(_133, _125);
    float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_553, float2(0.0), isnan(_553))).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = in.m_46.y;
    float _157 = in.m_46.x;
    float _159 = in.m_46.z;
    float _161 = fma(_65, 2.0, -1.0);
    float _163 = fma(_69, 2.0, -1.0);
    float _165 = _155 * _155;
    float _167 = -_87;
    float _169 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _171 = fma(_167, _155, _169);
    float _173 = -_87;
    float _175 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _177 = fma(_173, _157, _175);
    float _179 = fma(_157, _157, _165);
    float _181 = _179 + 1.0;
    float _183 = _171 * _171;
    float _185 = -_87;
    float _187 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _189 = fma(_185, _159, _187);
    float _191 = rsqrt(_181);
    float _193 = fma(_177, _177, _183);
    float _195 = fma(_189, _189, _193);
    float _197 = rsqrt(_195);
    float _199 = _155 * _191;
    float _201 = _157 * _191;
    float _203 = _159 * _191;
    float _205 = _171 * _197;
    float _207 = _177 * _197;
    float _209 = _189 * _197;
    float _211 = -_199;
    float _213 = _205 + _211;
    float _215 = -_201;
    float _217 = _207 + _215;
    float _219 = -_203;
    float _221 = _209 + _219;
    float _223 = _161 * _207;
    float _225 = _213 * _213;
    float _227 = fma(_217, _217, _225);
    float _229 = -_91;
    float _231 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _233 = fma(_67, 2.0, -1.0);
    float _235 = -_213;
    float _237 = _199 * _235;
    float _239 = fma(_221, _221, _227);
    bool _243 = _231 <= 1.0;
    bool _245 = isnan(_231);
    bool _247 = _243 || _245;
    bool _249 = isnan(1.0);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = _233 * _213;
    float _257 = -_201;
    float _259 = fma(_257, _217, _237);
    float _261 = -_205;
    float _263 = -_223;
    float _265 = fma(_233, _261, _263);
    float _267 = rsqrt(_239);
    float _269 = _231 * _253;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = -_161;
    float _275 = -_255;
    float _277 = fma(_273, _217, _275);
    float _279 = -_203;
    float _281 = fma(_279, _221, _259);
    float _283 = -_209;
    float _285 = fma(_163, _283, _265);
    float _287 = _233 * _171;
    float _289 = -_163;
    float _291 = fma(_289, _221, _277);
    float _293 = -_199;
    float _295 = _233 * _293;
    float _297 = abs(_271);
    float _299 = log2(_297);
    float _301 = fma(_161, _177, _287);
    float _303 = -_295;
    float _305 = fma(_161, _201, _303);
    float _307 = fma(_163, _189, _301);
    float _309 = fma(_163, _203, _305);
    float _311 = _267 * _291;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = 1.0 / _281;
    float _317 = precise::min(_309, _285);
    float _319 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _321 = abs(_313);
    float _323 = log2(_321);
    float _325 = _313 * _317;
    float _327 = _325 * 2.0;
    float _329 = exp2(_319);
    float _331 = _327 * _315;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = -_197;
    float _337 = fma(_335, _307, 0.0);
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = _139 * _323;
    float _343 = _329 * _143;
    float _345 = exp2(_341);
    float _347 = _343 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _349 = _151 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _351 = _149 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _353 = _149 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _355 = _347 * _339;
    float _357 = _349 * 0.586610972881317138671875;
    float _359 = _153 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _361 = fma(_351, 0.298911988735198974609375, _357);
    float _363 = _153 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _365 = _353 * _355;
    float _367 = fma(_359, 0.114477999508380889892578125, _361);
    float _369 = _151 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _371 = _347 * _345;
    float _373 = _363 * _355;
    float _375 = _369 * _355;
    float _377 = _333 * _371;
    float _379 = _141 * _377;
    float _381 = _379 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _383 = _367 * _381;
    out.m_49.x = _365;
    out.m_49.y = _375;
    out.m_49.z = _373;
    out.m_49.w = _383;
    return out;
}

