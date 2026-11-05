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
    float2 _402 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_402, float2(0.0), isnan(_402))).x;
    float2 _413 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_413, float2(0.0), isnan(_413))).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = in.m_42.w;
    float _77 = in.m_44.w;
    float _79 = in.m_42.y;
    float _81 = in.m_44.y;
    float _83 = in.m_44.x;
    float _85 = in.m_42.x;
    float _87 = in.m_44.z;
    float _89 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _91 = -_89;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _95 = -_89;
    float _97 = fma(_95, _77, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _99 = -_89;
    float _101 = fma(_99, _79, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _103 = -_89;
    float _105 = fma(_103, _81, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _107 = 1.0 / _93;
    float _109 = -_89;
    float _111 = fma(_109, _83, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _113 = -_89;
    float _115 = fma(_113, _85, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _117 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[17].y, _105);
    float _119 = -_89;
    float _121 = fma(_119, _87, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _123 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[17].x, _111);
    float _125 = -_97;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[17].x, _111);
    float _129 = -_97;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c4)._m0[17].y, _105);
    float _133 = 1.0 / _97;
    float _135 = _101 * _107;
    float _137 = _115 * _107;
    float _139 = _117 * _133;
    float2 _547 = float2(_73, 0.0);
    float2 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_547, float2(0.0), isnan(_547))).xy;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _121 * _133;
    float _151 = _123 * _133;
    float _153 = _127 * _133;
    float _155 = _131 * _133;
    float2 _571 = float2(_151, _139);
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571)), _149);
    float2 _579 = float2(_153, _139);
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_579, float2(0.0), isnan(_579)), _149);
    float2 _587 = float2(_151, _155);
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_587, float2(0.0), isnan(_587)), _149);
    float2 _595 = float2(_153, _155);
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_595, float2(0.0), isnan(_595)), _149);
    float2 _603 = float2(_137, _135);
    float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_603, float2(0.0), isnan(_603))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_603, float2(0.0), isnan(_603))).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = in.m_46.y;
    float _177 = in.m_46.x;
    float _179 = in.m_46.z;
    float _181 = in.m_42.z;
    float _183 = _175 * _175;
    float _185 = fma(_177, _177, _183);
    float _187 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _189 = _185 + 1.0;
    float _191 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _187);
    float _193 = -_89;
    float _195 = fma(_193, _181, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _197 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _191);
    float _199 = rsqrt(_189);
    float _201 = fma(_195, -0.5, 0.5);
    float _203 = fma(_69, 2.0, -1.0);
    float _205 = rsqrt(_197);
    float _207 = fma(_71, 2.0, -1.0);
    float _209 = _175 * _199;
    float _211 = _177 * _199;
    float _213 = _199 * _179;
    float _215 = _205 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _217 = _205 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _219 = _205 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _221 = -_209;
    float _223 = _215 + _221;
    float _225 = -_211;
    float _227 = _217 + _225;
    float _229 = -_213;
    float _231 = _219 + _229;
    float _233 = _223 * _223;
    float _235 = fma(_227, _227, _233);
    bool _239 = _201 <= 1.0;
    bool _241 = isnan(_201);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = fma(_231, _231, _235);
    float _253 = _201 * _249;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = fma(_67, 2.0, -1.0);
    float _259 = _203 * _223;
    float _261 = -_223;
    float _263 = _209 * _261;
    float _265 = rsqrt(_251);
    float _267 = _257 * _217;
    float _269 = -_257;
    float _271 = -_259;
    float _273 = fma(_269, _227, _271);
    float _275 = -_211;
    float _277 = fma(_275, _227, _263);
    float _279 = -_209;
    float _281 = _203 * _279;
    float _283 = -_215;
    float _285 = -_267;
    float _287 = fma(_203, _283, _285);
    float _289 = -_207;
    float _291 = fma(_289, _231, _273);
    float _293 = -_213;
    float _295 = fma(_293, _231, _277);
    float _297 = abs(_255);
    float _299 = log2(_297);
    float _301 = -_281;
    float _303 = fma(_257, _211, _301);
    float _305 = -_219;
    float _307 = fma(_207, _305, _287);
    float _309 = fma(_207, _213, _303);
    float _311 = _265 * _291;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = 1.0 / _295;
    float _317 = precise::min(_309, _307);
    float _319 = _313 * _317;
    float _321 = _319 * 2.0;
    float _323 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _325 = abs(_313);
    float _327 = log2(_325);
    float _329 = exp2(_323);
    float _331 = _321 * _315;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = _145 * _327;
    float _337 = _203 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _339 = fma(_257, (*spvDescriptorSet0.fp_c4)._m0[15].x, _337);
    float _341 = exp2(_335);
    float _343 = _157 + _159;
    float _345 = fma(_207, (*spvDescriptorSet0.fp_c4)._m0[15].z, _339);
    float _347 = -_205;
    float _349 = fma(_347, _345, 0.0);
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = _343 + _161;
    float _355 = _353 + _163;
    float _357 = _169 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _359 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _361 = _169 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _363 = _329 * _355;
    float _365 = _363 * 0.25;
    float _367 = _171 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _369 = _173 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _371 = _365 * _341;
    float _373 = _365 * _351;
    float _375 = _333 * _371;
    float _377 = _357 * _373;
    float _379 = _359 * _373;
    float _381 = _147 * _375;
    float _383 = _173 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _385 = _361 * _381;
    float _387 = _383 * _373;
    float _389 = _367 * _381;
    float _391 = _369 * _381;
    out.m_49.x = _377;
    out.m_49.y = _379;
    out.m_49.z = _387;
    out.m_51.x = _385;
    out.m_51.y = _389;
    out.m_51.z = _391;
    return out;
}

