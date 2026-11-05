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
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_38.x;
    float _54 = in.m_38.y;
    float2 _368 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_368, float2(0.0), isnan(_368))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_368, float2(0.0), isnan(_368))).x;
    float2 _380 = float2(_52, _54);
    float4 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_380, float2(0.0), isnan(_380))).xyzw;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float _67 = _59.w;
    float _69 = in.m_40.w;
    float _71 = in.m_40.z;
    float _73 = in.m_40.x;
    float _75 = in.m_40.y;
    float _77 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _79 = -_77;
    float _81 = fma(_79, _69, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _83 = -_77;
    float _85 = fma(_83, _71, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _87 = -_77;
    float _89 = fma(_87, _73, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _91 = -_77;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _95 = 1.0 / _81;
    float _97 = _85 * _95;
    float _99 = _89 * _95;
    float _101 = _93 * _95;
    float2 _458 = float2(_67, 0.0);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_458, float2(0.0), isnan(_458))).xy;
    float _107 = _105.x;
    float _109 = _105.y;
    float2 _470 = float2(_99, _101);
    float _111 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_470, float2(0.0), isnan(_470)), _97);
    float _113 = in.m_42.y;
    float _115 = in.m_42.x;
    float _117 = in.m_42.z;
    float _119 = fma(_61, 2.0, -1.0);
    float _121 = fma(_65, 2.0, -1.0);
    float _123 = _113 * _113;
    float _125 = -_77;
    float _127 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _129 = fma(_125, _113, _127);
    float _131 = fma(_115, _115, _123);
    float _133 = _129 * _129;
    float _135 = -_77;
    float _137 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _139 = fma(_135, _117, _137);
    float _141 = _129 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _143 = _131 + 1.0;
    float _145 = -_77;
    float _147 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _149 = fma(_145, _115, _147);
    float _151 = fma(_149, _149, _133);
    float _153 = rsqrt(_143);
    float _155 = fma(_149, (*spvDescriptorSet0.fp_c4)._m0[11].x, _141);
    float _157 = fma(_139, _139, _151);
    float _159 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[11].z, _155);
    float _161 = fma(_63, 2.0, -1.0);
    float _163 = sqrt(_157);
    float _165 = rsqrt(_157);
    float _167 = _113 * _153;
    float _169 = _117 * _153;
    float _171 = _115 * _153;
    float _173 = -_163;
    float _175 = fma(_173, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = abs(_177);
    float _181 = log2(_179);
    float _183 = _129 * _165;
    float _185 = _149 * _165;
    float _187 = _139 * _165;
    float _189 = _165 * _159;
    float _191 = -_167;
    float _193 = _191 + _183;
    float _195 = -_171;
    float _197 = _195 + _185;
    float _199 = -_169;
    float _201 = _199 + _187;
    float _203 = _161 * _129;
    float _205 = _193 * _193;
    float _207 = fma(_119, _149, _203);
    float _209 = fma(_197, _197, _205);
    float _211 = _181 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _213 = fma(_121, _139, _207);
    float _215 = fma(_201, _201, _209);
    float _217 = exp2(_211);
    float _219 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _221 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[13].y, _219);
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _161 * _193;
    float _227 = -_193;
    float _229 = _167 * _227;
    float _231 = rsqrt(_215);
    float _233 = -_119;
    float _235 = -_225;
    float _237 = fma(_233, _197, _235);
    float _239 = -_121;
    float _241 = fma(_239, _201, _237);
    float _243 = abs(_223);
    float _245 = log2(_243);
    float _247 = _231 * _241;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = -_171;
    float _253 = fma(_251, _197, _229);
    float _255 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _257 = _113 + _255;
    float _259 = -(*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _261 = _115 + _259;
    float _263 = abs(_249);
    float _265 = log2(_263);
    float _267 = -_169;
    float _269 = fma(_267, _201, _253);
    float _271 = -_167;
    float _273 = _161 * _271;
    float _275 = _161 * _183;
    float _277 = _245 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _279 = _257 * _257;
    float _281 = -_273;
    float _283 = fma(_119, _171, _281);
    float _285 = -_185;
    float _287 = -_275;
    float _289 = fma(_119, _285, _287);
    float _291 = 1.0 / _269;
    float _293 = fma(_261, _261, _279);
    float _295 = fma(_121, _169, _283);
    float _297 = -_187;
    float _299 = fma(_121, _297, _289);
    float _301 = exp2(_277);
    float _303 = precise::min(_295, _299);
    float _305 = _249 * _303;
    float _307 = _305 * 2.0;
    float _309 = _307 * _291;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = _107 * _265;
    float _315 = exp2(_313);
    float _317 = -_293;
    float _319 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[12].z, 1.0);
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = _111 * _321;
    float _325 = _217 * _301;
    float _327 = _301 * _323;
    float _329 = _111 * _325;
    float _331 = -_165;
    float _333 = fma(_331, _213, 0.0);
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _329 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _339 = _315 * _327;
    float _341 = _335 * _337;
    float _343 = _311 * _339;
    float _345 = _341 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _347 = _341 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _349 = _109 * _343;
    float _351 = _341 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _353 = _177 * _349;
    float _355 = _353 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _357 = _355 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    out.m_45.x = _345;
    out.m_45.y = _347;
    out.m_45.z = _351;
    out.m_45.w = _357;
    return out;
}

