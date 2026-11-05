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
    float2 _372 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_372, float2(0.0), isnan(_372))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_372, float2(0.0), isnan(_372))).x;
    float2 _383 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_383, float2(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_383, float2(0.0), isnan(_383))).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = in.m_42.w;
    float _77 = in.m_44.w;
    float _79 = in.m_42.x;
    float _81 = in.m_42.y;
    float _83 = in.m_44.z;
    float _85 = in.m_44.x;
    float _87 = in.m_44.y;
    float _89 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _91 = -_89;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _95 = -_89;
    float _97 = fma(_95, _77, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _99 = -_89;
    float _101 = fma(_99, _79, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _103 = -_89;
    float _105 = fma(_103, _81, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _107 = 1.0 / _93;
    float _109 = -_89;
    float _111 = fma(_109, _83, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _113 = -_89;
    float _115 = fma(_113, _85, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _117 = -_89;
    float _119 = fma(_117, _87, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _121 = 1.0 / _97;
    float _123 = _101 * _107;
    float _125 = _105 * _107;
    float _127 = _111 * _121;
    float _129 = _115 * _121;
    float _131 = _119 * _121;
    float2 _498 = float2(_73, 0.0);
    float2 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_498, float2(0.0), isnan(_498))).xy;
    float _137 = _135.x;
    float _139 = _135.y;
    float2 _510 = float2(_129, _131);
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_510, float2(0.0), isnan(_510)), _127);
    float2 _518 = float2(_123, _125);
    float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_518, float2(0.0), isnan(_518))).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = in.m_46.y;
    float _155 = in.m_46.x;
    float _157 = in.m_46.z;
    float _159 = in.m_42.z;
    float _161 = _153 * _153;
    float _163 = fma(_155, _155, _161);
    float _165 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _167 = -_89;
    float _169 = fma(_167, _159, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _171 = _163 + 1.0;
    float _173 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _165);
    float _175 = fma(_169, -0.5, 0.5);
    float _177 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _173);
    float _179 = rsqrt(_171);
    float _181 = fma(_69, 2.0, -1.0);
    float _183 = fma(_71, 2.0, -1.0);
    float _185 = rsqrt(_177);
    float _187 = _153 * _179;
    float _189 = _155 * _179;
    float _191 = _179 * _157;
    float _193 = _185 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _195 = _185 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _197 = _185 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _199 = -_187;
    float _201 = _193 + _199;
    float _203 = -_189;
    float _205 = _195 + _203;
    float _207 = -_191;
    float _209 = _197 + _207;
    float _211 = _201 * _201;
    float _213 = fma(_205, _205, _211);
    bool _217 = _175 <= 1.0;
    bool _219 = isnan(_175);
    bool _221 = _217 || _219;
    bool _223 = isnan(1.0);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = fma(_209, _209, _213);
    float _231 = _175 * _227;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = fma(_67, 2.0, -1.0);
    float _237 = _181 * _201;
    float _239 = -_201;
    float _241 = _187 * _239;
    float _243 = rsqrt(_229);
    float _245 = _235 * _195;
    float _247 = -_235;
    float _249 = -_237;
    float _251 = fma(_247, _205, _249);
    float _253 = -_189;
    float _255 = fma(_253, _205, _241);
    float _257 = -_187;
    float _259 = _181 * _257;
    float _261 = -_193;
    float _263 = -_245;
    float _265 = fma(_181, _261, _263);
    float _267 = -_183;
    float _269 = fma(_267, _209, _251);
    float _271 = -_191;
    float _273 = fma(_271, _209, _255);
    float _275 = abs(_233);
    float _277 = log2(_275);
    float _279 = -_259;
    float _281 = fma(_235, _189, _279);
    float _283 = -_197;
    float _285 = fma(_183, _283, _265);
    float _287 = fma(_183, _191, _281);
    float _289 = _243 * _269;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = precise::min(_287, _285);
    float _295 = abs(_291);
    float _297 = log2(_295);
    float _299 = _291 * _293;
    float _301 = _299 * 2.0;
    float _303 = _277 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _305 = exp2(_303);
    float _307 = 1.0 / _273;
    float _309 = _301 * _307;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = _137 * _297;
    float _315 = _181 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _317 = _305 * _141;
    float _319 = exp2(_313);
    float _321 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[15].x, _315);
    float _323 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[15].z, _321);
    float _325 = -_185;
    float _327 = fma(_325, _323, 0.0);
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = _317 * _319;
    float _333 = _147 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _335 = _317 * _329;
    float _337 = _149 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _339 = _311 * _331;
    float _341 = _147 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _343 = _149 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _345 = _151 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _347 = _139 * _339;
    float _349 = _151 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _351 = _333 * _335;
    float _353 = _337 * _335;
    float _355 = _345 * _335;
    float _357 = _341 * _347;
    float _359 = _343 * _347;
    float _361 = _349 * _347;
    out.m_49.x = _351;
    out.m_49.y = _353;
    out.m_49.z = _355;
    out.m_51.x = _357;
    out.m_51.y = _359;
    out.m_51.z = _361;
    return out;
}

