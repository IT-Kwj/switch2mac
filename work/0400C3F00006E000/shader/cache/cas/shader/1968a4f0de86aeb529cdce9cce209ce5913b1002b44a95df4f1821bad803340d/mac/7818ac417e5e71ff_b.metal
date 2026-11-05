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
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
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
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _400 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_400, float2(0.0), isnan(_400))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_400, float2(0.0), isnan(_400))).x;
    float2 _411 = float2(_54, _56);
    float4 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_411, float2(0.0), isnan(_411))).xyzw;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float _69 = _61.w;
    float _71 = in.m_40.w;
    float _73 = in.m_40.y;
    float _75 = in.m_40.x;
    float _77 = in.m_40.z;
    float _79 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _81 = -_79;
    float _83 = fma(_81, _71, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _85 = -_79;
    float _87 = fma(_85, _73, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _89 = -_79;
    float _91 = fma(_89, _75, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _93 = -_79;
    float _95 = fma(_93, _77, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _97 = 1.0 / _83;
    float _99 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[17].y, _87);
    float _101 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[17].x, _91);
    float _103 = -_83;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[17].x, _91);
    float _107 = -_83;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c4)._m0[17].y, _87);
    float _111 = _99 * _97;
    float _113 = _105 * _97;
    float _115 = _95 * _97;
    float _117 = _101 * _97;
    float _119 = _109 * _97;
    float2 _520 = float2(_117, _111);
    float _121 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_520, float2(0.0), isnan(_520)), _115);
    float2 _528 = float2(_113, _111);
    float _123 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_528, float2(0.0), isnan(_528)), _115);
    float2 _535 = float2(_69, 0.0);
    float2 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_535, float2(0.0), isnan(_535))).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float2 _547 = float2(_117, _119);
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547)), _115);
    float2 _555 = float2(_113, _119);
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555)), _115);
    float _137 = in.m_42.z;
    float _139 = in.m_44.y;
    float _141 = in.m_44.x;
    float _143 = in.m_42.x;
    float _145 = in.m_44.z;
    float _147 = in.m_42.w;
    float _149 = -_79;
    float _151 = fma(_149, _137, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _153 = _139 * _139;
    float _155 = fma(_151, -0.5, 0.5);
    float _157 = fma(_141, _141, _153);
    float _159 = in.m_42.y;
    bool _163 = _155 <= 1.0;
    bool _165 = isnan(_155);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = float(_171);
    float _175 = _157 + 1.0;
    float _177 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _179 = -_79;
    float _181 = fma(_179, _147, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _183 = _155 * _173;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _177);
    float _189 = rsqrt(_175);
    float _191 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _187);
    float _193 = fma(_65, 2.0, -1.0);
    float _195 = fma(_63, 2.0, -1.0);
    float _197 = abs(_185);
    float _199 = log2(_197);
    float _201 = fma(_67, 2.0, -1.0);
    float _203 = rsqrt(_191);
    float _205 = _141 * _189;
    float _207 = _139 * _189;
    float _209 = -_79;
    float _211 = fma(_209, _143, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _213 = _189 * _145;
    float _215 = -_79;
    float _217 = fma(_215, _159, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _219 = _199 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _221 = precise::min(_211, _217);
    float _223 = exp2(_219);
    float _225 = precise::max(_211, _217);
    bool _227 = _221 >= 0.0;
    bool _229 = isnan(_221);
    bool _231 = _227 || _229;
    bool _233 = isnan(0.0);
    bool _235 = _231 || _233;
    float _237 = _203 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _239 = _203 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _241 = _203 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    bool _243 = _181 >= _225;
    bool _245 = isnan(_181);
    bool _247 = _243 || _245;
    bool _249 = isnan(_225);
    bool _251 = _247 || _249;
    bool _253 = _251 && _235;
    float _255 = float(_253);
    float _257 = -_207;
    float _259 = _237 + _257;
    float _261 = -_205;
    float _263 = _239 + _261;
    float _265 = -_213;
    float _267 = _241 + _265;
    float _269 = _195 * _239;
    float _271 = _259 * _259;
    float _273 = _193 * _259;
    float _275 = fma(_263, _263, _271);
    float _277 = -_195;
    float _279 = -_273;
    float _281 = fma(_277, _263, _279);
    float _283 = _255 * _223;
    float _285 = fma(_267, _267, _275);
    float _287 = -_201;
    float _289 = fma(_287, _267, _281);
    float _291 = rsqrt(_285);
    float _293 = _291 * _289;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = -_259;
    float _299 = _207 * _297;
    float _301 = -_207;
    float _303 = _193 * _301;
    float _305 = abs(_295);
    float _307 = log2(_305);
    float _309 = -_205;
    float _311 = fma(_309, _263, _299);
    float _313 = -_303;
    float _315 = fma(_195, _205, _313);
    float _317 = -_213;
    float _319 = fma(_317, _267, _311);
    float _321 = fma(_201, _213, _315);
    float _323 = 1.0 / _319;
    float _325 = _121 + _123;
    float _327 = _129 * _307;
    float _329 = -_237;
    float _331 = -_269;
    float _333 = fma(_193, _329, _331);
    float _335 = _193 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _337 = _325 + _133;
    float _339 = exp2(_327);
    float _341 = -_241;
    float _343 = fma(_201, _341, _333);
    float _345 = fma(_195, (*spvDescriptorSet0.fp_c4)._m0[15].x, _335);
    float _347 = _337 + _135;
    float _349 = precise::min(_321, _343);
    float _351 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[15].z, _345);
    float _353 = _347 * _283;
    float _355 = _353 * 0.25;
    float _357 = _295 * _349;
    float _359 = _357 * 2.0;
    float _361 = _355 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _363 = -_203;
    float _365 = fma(_363, _351, 0.0);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _359 * _323;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _361 * _339;
    float _375 = _361 * _367;
    float _377 = _371 * _373;
    float _379 = _375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _381 = _375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _383 = _375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _385 = _131 * _377;
    float _387 = _385 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _389 = _387 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    out.m_47.x = _379;
    out.m_47.y = _381;
    out.m_47.z = _383;
    out.m_47.w = _389;
    return out;
}

