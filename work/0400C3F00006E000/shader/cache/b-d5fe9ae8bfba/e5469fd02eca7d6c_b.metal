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
    float2 _390 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float2 _401 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_401, float2(0.0), isnan(_401))).xyzw;
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
    float _127 = _123 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float _129 = _125 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _131 = _111 * _121;
    float _133 = _115 * _121;
    float _135 = _119 * _121;
    float2 _529 = float2(_73, 0.0);
    float2 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_529, float2(0.0), isnan(_529))).xy;
    float _141 = _139.x;
    float _143 = _139.y;
    float2 _541 = float2(_133, _135);
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541)), _131);
    float2 _549 = float2(_129, _127);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_549, float2(0.0), isnan(_549))).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = in.m_46.y;
    float _159 = in.m_46.x;
    float _161 = in.m_46.z;
    float _163 = _157 * _157;
    float _165 = -_89;
    float _167 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _169 = fma(_165, _157, _167);
    float _171 = -_89;
    float _173 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _175 = fma(_171, _159, _173);
    float _177 = fma(_159, _159, _163);
    float _179 = _177 + 1.0;
    float _181 = _169 * _169;
    float _183 = -_89;
    float _185 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _187 = fma(_183, _161, _185);
    float _189 = fma(_175, _175, _181);
    float _191 = rsqrt(_179);
    float _193 = fma(_187, _187, _189);
    float _195 = rsqrt(_193);
    float _197 = _157 * _191;
    float _199 = _159 * _191;
    float _201 = _161 * _191;
    float _203 = _169 * _195;
    float _205 = _175 * _195;
    float _207 = _187 * _195;
    float _209 = -_197;
    float _211 = _203 + _209;
    float _213 = -_199;
    float _215 = _205 + _213;
    float _217 = -_201;
    float _219 = _207 + _217;
    float _221 = _211 * _211;
    float _223 = fma(_215, _215, _221);
    float _225 = -_93;
    float _227 = fma(_225, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _229 = fma(_219, _219, _223);
    bool _233 = _227 <= 1.0;
    bool _235 = isnan(_227);
    bool _237 = _233 || _235;
    bool _239 = isnan(1.0);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = fma(_69, 2.0, -1.0);
    float _247 = fma(_67, 2.0, -1.0);
    float _249 = fma(_71, 2.0, -1.0);
    float _251 = rsqrt(_229);
    float _253 = _245 * _211;
    float _255 = _227 * _243;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = -_211;
    float _261 = _197 * _259;
    float _263 = _247 * _205;
    float _265 = -_247;
    float _267 = -_253;
    float _269 = fma(_265, _215, _267);
    float _271 = _245 * _169;
    float _273 = abs(_257);
    float _275 = log2(_273);
    float _277 = -_249;
    float _279 = fma(_277, _219, _269);
    float _281 = -_203;
    float _283 = -_263;
    float _285 = fma(_245, _281, _283);
    float _287 = fma(_247, _175, _271);
    float _289 = -_207;
    float _291 = fma(_249, _289, _285);
    float _293 = fma(_249, _187, _287);
    float _295 = _251 * _279;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = -_199;
    float _301 = fma(_299, _215, _261);
    float _303 = -_197;
    float _305 = _245 * _303;
    float _307 = abs(_297);
    float _309 = log2(_307);
    float _311 = -_201;
    float _313 = fma(_311, _219, _301);
    float _315 = -_305;
    float _317 = fma(_247, _199, _315);
    float _319 = -_195;
    float _321 = fma(_319, _293, 0.0);
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = _275 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _327 = fma(_249, _201, _317);
    float _329 = 1.0 / _313;
    float _331 = precise::min(_327, _291);
    float _333 = exp2(_325);
    float _335 = _297 * _331;
    float _337 = _335 * 2.0;
    float _339 = _337 * _329;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = _141 * _309;
    float _345 = _333 * _145;
    float _347 = exp2(_343);
    float _349 = _151 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _351 = _151 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _353 = _345 * _347;
    float _355 = _155 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _357 = _341 * _353;
    float _359 = _345 * _323;
    float _361 = _153 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _363 = _153 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _365 = _143 * _357;
    float _367 = _155 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _369 = _349 * _359;
    float _371 = _361 * _359;
    float _373 = _351 * _365;
    float _375 = _367 * _359;
    float _377 = _363 * _365;
    float _379 = _355 * _365;
    out.m_49.x = _369;
    out.m_49.y = _371;
    out.m_49.z = _375;
    out.m_51.x = _373;
    out.m_51.y = _377;
    out.m_51.z = _379;
    return out;
}

