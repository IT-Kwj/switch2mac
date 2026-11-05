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
    float2 _376 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_376, float2(0.0), isnan(_376))).x;
    float2 _387 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
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
    float _121 = _99 * _105;
    float _123 = _103 * _105;
    float2 _493 = float2(_71, 0.0);
    float2 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_493, float2(0.0), isnan(_493))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_493, float2(0.0), isnan(_493))).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _109 * _119;
    float _135 = _113 * _119;
    float _137 = _117 * _119;
    float2 _514 = float2(_135, _137);
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514)), _133);
    float2 _522 = float2(_121, _123);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_522, float2(0.0), isnan(_522))).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = in.m_46.y;
    float _153 = in.m_46.x;
    float _155 = in.m_46.z;
    float _157 = in.m_42.z;
    float _159 = _151 * _151;
    float _161 = fma(_153, _153, _159);
    float _163 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _165 = -_87;
    float _167 = fma(_165, _157, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _169 = _161 + 1.0;
    float _171 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _163);
    float _173 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _171);
    float _175 = rsqrt(_169);
    float _177 = fma(_167, -0.5, 0.5);
    float _179 = fma(_67, 2.0, -1.0);
    float _181 = rsqrt(_173);
    float _183 = fma(_69, 2.0, -1.0);
    float _185 = _151 * _175;
    float _187 = _153 * _175;
    float _189 = _175 * _155;
    float _191 = _181 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _193 = _181 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _195 = _181 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _197 = -_185;
    float _199 = _191 + _197;
    float _201 = -_187;
    float _203 = _193 + _201;
    float _205 = -_189;
    float _207 = _195 + _205;
    float _209 = _199 * _199;
    float _211 = fma(_203, _203, _209);
    bool _215 = _177 <= 1.0;
    bool _217 = isnan(_177);
    bool _219 = _215 || _217;
    bool _221 = isnan(1.0);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = fma(_207, _207, _211);
    float _229 = _177 * _225;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_65, 2.0, -1.0);
    float _235 = _179 * _199;
    float _237 = -_199;
    float _239 = _185 * _237;
    float _241 = rsqrt(_227);
    float _243 = _233 * _193;
    float _245 = -_233;
    float _247 = -_235;
    float _249 = fma(_245, _203, _247);
    float _251 = -_187;
    float _253 = fma(_251, _203, _239);
    float _255 = -_185;
    float _257 = _179 * _255;
    float _259 = -_191;
    float _261 = -_243;
    float _263 = fma(_179, _259, _261);
    float _265 = -_183;
    float _267 = fma(_265, _207, _249);
    float _269 = -_189;
    float _271 = fma(_269, _207, _253);
    float _273 = abs(_231);
    float _275 = log2(_273);
    float _277 = -_257;
    float _279 = fma(_233, _187, _277);
    float _281 = -_195;
    float _283 = fma(_183, _281, _263);
    float _285 = fma(_183, _189, _279);
    float _287 = _241 * _267;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = precise::min(_285, _283);
    float _293 = abs(_289);
    float _295 = log2(_293);
    float _297 = _289 * _291;
    float _299 = _297 * 2.0;
    float _301 = _275 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _303 = exp2(_301);
    float _305 = 1.0 / _271;
    float _307 = _299 * _305;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = _129 * _295;
    float _313 = _179 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _315 = exp2(_311);
    float _317 = fma(_233, (*spvDescriptorSet0.fp_c4)._m0[15].x, _313);
    float _319 = _303 * _139;
    float _321 = _147 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _323 = _145 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _325 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[15].z, _317);
    float _327 = _319 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _329 = _321 * 0.586610972881317138671875;
    float _331 = _149 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _333 = -_181;
    float _335 = fma(_333, _325, 0.0);
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = fma(_323, 0.298911988735198974609375, _329);
    float _341 = _149 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _343 = _327 * _337;
    float _345 = _145 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _347 = _327 * _315;
    float _349 = fma(_341, 0.114477999508380889892578125, _339);
    float _351 = _147 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _353 = _345 * _343;
    float _355 = _309 * _347;
    float _357 = _331 * _343;
    float _359 = _351 * _343;
    float _361 = _131 * _355;
    float _363 = _361 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _365 = _349 * _363;
    out.m_49.x = _353;
    out.m_49.y = _359;
    out.m_49.z = _357;
    out.m_49.w = _365;
    return out;
}

