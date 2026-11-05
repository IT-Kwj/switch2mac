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
    float2 _376 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_376, float2(0.0), isnan(_376))).x;
    float2 _387 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = in.m_42.w;
    float _77 = in.m_44.w;
    float _79 = in.m_42.y;
    float _81 = in.m_42.x;
    float _83 = in.m_44.z;
    float _85 = in.m_44.x;
    float _87 = in.m_44.y;
    float _89 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _91 = -_89;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _95 = -_89;
    float _97 = fma(_95, _77, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _99 = -_89;
    float _101 = fma(_99, _79, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _103 = -_89;
    float _105 = fma(_103, _81, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _107 = 1.0 / _93;
    float _109 = -_89;
    float _111 = fma(_109, _83, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _113 = -_89;
    float _115 = fma(_113, _85, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _117 = -_89;
    float _119 = fma(_117, _87, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _121 = 1.0 / _97;
    float _123 = fma(_101, _107, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _125 = fma(_105, _107, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _127 = _125 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _129 = _111 * _121;
    float _131 = _115 * _121;
    float _133 = _119 * _121;
    float _135 = _123 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _515 = float2(_73, 0.0);
    float2 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_515, float2(0.0), isnan(_515))).xy;
    float _141 = _139.x;
    float _143 = _139.y;
    float2 _527 = float2(_131, _133);
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527)), _129);
    float2 _535 = float2(_127, _135);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_535, float2(0.0), isnan(_535))).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = in.m_46.y;
    float _159 = in.m_46.x;
    float _161 = in.m_46.z;
    float _163 = in.m_42.z;
    float _165 = _157 * _157;
    float _167 = fma(_159, _159, _165);
    float _169 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _171 = -_89;
    float _173 = fma(_171, _163, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _175 = _167 + 1.0;
    float _177 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _169);
    float _179 = fma(_173, -0.5, 0.5);
    float _181 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _177);
    float _183 = rsqrt(_175);
    float _185 = fma(_69, 2.0, -1.0);
    float _187 = fma(_71, 2.0, -1.0);
    float _189 = rsqrt(_181);
    float _191 = _157 * _183;
    float _193 = _159 * _183;
    float _195 = _183 * _161;
    float _197 = _189 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _199 = _189 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _201 = _189 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _203 = -_191;
    float _205 = _197 + _203;
    float _207 = -_193;
    float _209 = _199 + _207;
    float _211 = -_195;
    float _213 = _201 + _211;
    float _215 = _205 * _205;
    float _217 = fma(_209, _209, _215);
    bool _221 = _179 <= 1.0;
    bool _223 = isnan(_179);
    bool _225 = _221 || _223;
    bool _227 = isnan(1.0);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = fma(_213, _213, _217);
    float _235 = _179 * _231;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = fma(_67, 2.0, -1.0);
    float _241 = _185 * _205;
    float _243 = -_205;
    float _245 = _191 * _243;
    float _247 = rsqrt(_233);
    float _249 = _239 * _199;
    float _251 = -_239;
    float _253 = -_241;
    float _255 = fma(_251, _209, _253);
    float _257 = -_193;
    float _259 = fma(_257, _209, _245);
    float _261 = -_191;
    float _263 = _185 * _261;
    float _265 = -_197;
    float _267 = -_249;
    float _269 = fma(_185, _265, _267);
    float _271 = -_187;
    float _273 = fma(_271, _213, _255);
    float _275 = -_195;
    float _277 = fma(_275, _213, _259);
    float _279 = abs(_237);
    float _281 = log2(_279);
    float _283 = -_263;
    float _285 = fma(_239, _193, _283);
    float _287 = -_201;
    float _289 = fma(_187, _287, _269);
    float _291 = fma(_187, _195, _285);
    float _293 = _247 * _273;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = precise::min(_291, _289);
    float _299 = abs(_295);
    float _301 = log2(_299);
    float _303 = _295 * _297;
    float _305 = _303 * 2.0;
    float _307 = _281 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _309 = exp2(_307);
    float _311 = 1.0 / _277;
    float _313 = _305 * _311;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _141 * _301;
    float _319 = _185 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _321 = _309 * _145;
    float _323 = exp2(_317);
    float _325 = fma(_239, (*spvDescriptorSet0.fp_c4)._m0[15].x, _319);
    float _327 = fma(_187, (*spvDescriptorSet0.fp_c4)._m0[15].z, _325);
    float _329 = -_189;
    float _331 = fma(_329, _327, 0.0);
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = _321 * _323;
    float _337 = _321 * _333;
    float _339 = _315 * _335;
    float _341 = _151 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _343 = _153 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _345 = _151 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _347 = _143 * _339;
    float _349 = _153 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _351 = _155 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _353 = _155 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _355 = _341 * _337;
    float _357 = _343 * _337;
    float _359 = _351 * _337;
    float _361 = _345 * _347;
    float _363 = _349 * _347;
    float _365 = _353 * _347;
    out.m_49.x = _355;
    out.m_49.y = _357;
    out.m_49.z = _359;
    out.m_51.x = _361;
    out.m_51.y = _363;
    out.m_51.z = _365;
    return out;
}

