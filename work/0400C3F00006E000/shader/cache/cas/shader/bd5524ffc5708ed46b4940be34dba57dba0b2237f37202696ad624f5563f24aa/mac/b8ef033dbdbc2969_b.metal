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
    float2 _386 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_386, float2(0.0), isnan(_386))).x;
    float2 _397 = float2(_58, _60);
    float4 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_397, float2(0.0), isnan(_397))).xyzw;
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
    float2 _512 = float2(_73, 0.0);
    float2 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_512, float2(0.0), isnan(_512))).xy;
    float _137 = _135.x;
    float _139 = _135.y;
    float2 _524 = float2(_129, _131);
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524)), _127);
    float2 _532 = float2(_123, _125);
    float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_532, float2(0.0), isnan(_532))).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = in.m_46.y;
    float _155 = in.m_46.x;
    float _157 = in.m_46.z;
    float _159 = _153 * _153;
    float _161 = -_89;
    float _163 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _165 = fma(_161, _153, _163);
    float _167 = -_89;
    float _169 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _171 = fma(_167, _155, _169);
    float _173 = fma(_155, _155, _159);
    float _175 = _173 + 1.0;
    float _177 = _165 * _165;
    float _179 = -_89;
    float _181 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _183 = fma(_179, _157, _181);
    float _185 = fma(_171, _171, _177);
    float _187 = rsqrt(_175);
    float _189 = fma(_183, _183, _185);
    float _191 = rsqrt(_189);
    float _193 = _153 * _187;
    float _195 = _155 * _187;
    float _197 = _157 * _187;
    float _199 = _165 * _191;
    float _201 = _171 * _191;
    float _203 = _183 * _191;
    float _205 = -_193;
    float _207 = _199 + _205;
    float _209 = -_195;
    float _211 = _201 + _209;
    float _213 = -_197;
    float _215 = _203 + _213;
    float _217 = _207 * _207;
    float _219 = fma(_211, _211, _217);
    float _221 = -_93;
    float _223 = fma(_221, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _225 = fma(_215, _215, _219);
    bool _229 = _223 <= 1.0;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan(1.0);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = fma(_69, 2.0, -1.0);
    float _243 = fma(_67, 2.0, -1.0);
    float _245 = fma(_71, 2.0, -1.0);
    float _247 = rsqrt(_225);
    float _249 = _241 * _207;
    float _251 = _223 * _239;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = -_207;
    float _257 = _193 * _255;
    float _259 = _243 * _201;
    float _261 = -_243;
    float _263 = -_249;
    float _265 = fma(_261, _211, _263);
    float _267 = _241 * _165;
    float _269 = abs(_253);
    float _271 = log2(_269);
    float _273 = -_245;
    float _275 = fma(_273, _215, _265);
    float _277 = -_199;
    float _279 = -_259;
    float _281 = fma(_241, _277, _279);
    float _283 = fma(_243, _171, _267);
    float _285 = -_203;
    float _287 = fma(_245, _285, _281);
    float _289 = fma(_245, _183, _283);
    float _291 = _247 * _275;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = -_195;
    float _297 = fma(_295, _211, _257);
    float _299 = -_193;
    float _301 = _241 * _299;
    float _303 = abs(_293);
    float _305 = log2(_303);
    float _307 = -_197;
    float _309 = fma(_307, _215, _297);
    float _311 = -_301;
    float _313 = fma(_243, _195, _311);
    float _315 = -_191;
    float _317 = fma(_315, _289, 0.0);
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = _271 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _323 = fma(_245, _197, _313);
    float _325 = 1.0 / _309;
    float _327 = precise::min(_323, _287);
    float _329 = exp2(_321);
    float _331 = _293 * _327;
    float _333 = _331 * 2.0;
    float _335 = _333 * _325;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _137 * _305;
    float _341 = _329 * _141;
    float _343 = exp2(_339);
    float _345 = _147 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _347 = _147 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _349 = _341 * _343;
    float _351 = _151 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _353 = _337 * _349;
    float _355 = _341 * _319;
    float _357 = _149 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _359 = _149 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _361 = _139 * _353;
    float _363 = _151 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _365 = _345 * _355;
    float _367 = _357 * _355;
    float _369 = _347 * _361;
    float _371 = _363 * _355;
    float _373 = _359 * _361;
    float _375 = _351 * _361;
    out.m_49.x = _365;
    out.m_49.y = _367;
    out.m_49.z = _371;
    out.m_51.x = _369;
    out.m_51.y = _373;
    out.m_51.z = _375;
    return out;
}

