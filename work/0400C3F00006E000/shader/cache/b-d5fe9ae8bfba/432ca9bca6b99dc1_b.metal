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
    float2 _398 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_398, float2(0.0), isnan(_398))).x;
    float2 _410 = float2(_52, _54);
    float4 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_410, float2(0.0), isnan(_410))).xyzw;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float _67 = _59.w;
    float _69 = in.m_40.w;
    float _71 = in.m_40.y;
    float _73 = in.m_40.x;
    float _75 = in.m_40.z;
    float _77 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _79 = -_77;
    float _81 = fma(_79, _69, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _83 = -_77;
    float _85 = fma(_83, _71, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _87 = -_77;
    float _89 = fma(_87, _73, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _91 = -_77;
    float _93 = fma(_91, _75, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _95 = 1.0 / _81;
    float _97 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[14].y, _85);
    float _99 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[14].x, _89);
    float _101 = -_81;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[14].x, _89);
    float _105 = -_81;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[14].y, _85);
    float _109 = _97 * _95;
    float _111 = _99 * _95;
    float _113 = _103 * _95;
    float _115 = _107 * _95;
    float _117 = _93 * _95;
    float2 _520 = float2(_111, _109);
    float _119 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_520, float2(0.0), isnan(_520)), _117);
    float2 _528 = float2(_113, _109);
    float _121 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_528, float2(0.0), isnan(_528)), _117);
    float2 _536 = float2(_111, _115);
    float _123 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_536, float2(0.0), isnan(_536)), _117);
    float2 _544 = float2(_113, _115);
    float _125 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544)), _117);
    float2 _551 = float2(_67, 0.0);
    float2 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_551, float2(0.0), isnan(_551))).xy;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = in.m_42.y;
    float _137 = in.m_42.x;
    float _139 = in.m_42.z;
    float _141 = fma(_61, 2.0, -1.0);
    float _143 = fma(_65, 2.0, -1.0);
    float _145 = _135 * _135;
    float _147 = -_77;
    float _149 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _151 = fma(_147, _137, _149);
    float _153 = fma(_137, _137, _145);
    float _155 = -_77;
    float _157 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _159 = fma(_155, _135, _157);
    float _161 = -_77;
    float _163 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _165 = fma(_161, _139, _163);
    float _167 = _153 + 1.0;
    float _169 = _159 * _159;
    float _171 = rsqrt(_167);
    float _173 = fma(_151, _151, _169);
    float _175 = fma(_165, _165, _173);
    float _177 = sqrt(_175);
    float _179 = _159 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _181 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[11].x, _179);
    float _183 = _139 * _171;
    float _185 = rsqrt(_175);
    float _187 = -_177;
    float _189 = fma(_187, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _135 * _171;
    float _195 = _137 * _171;
    float _197 = abs(_191);
    float _199 = log2(_197);
    float _201 = _159 * _185;
    float _203 = _151 * _185;
    float _205 = _165 * _185;
    float _207 = -_193;
    float _209 = _207 + _201;
    float _211 = -_195;
    float _213 = _211 + _203;
    float _215 = -_183;
    float _217 = _215 + _205;
    float _219 = _209 * _209;
    float _221 = -_209;
    float _223 = _193 * _221;
    float _225 = fma(_213, _213, _219);
    float _227 = fma(_165, (*spvDescriptorSet0.fp_c4)._m0[11].z, _181);
    float _229 = -_195;
    float _231 = fma(_229, _213, _223);
    float _233 = fma(_217, _217, _225);
    float _235 = _185 * _227;
    float _237 = -_183;
    float _239 = fma(_237, _217, _231);
    float _241 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _243 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[13].y, _241);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = rsqrt(_233);
    float _249 = fma(_63, 2.0, -1.0);
    float _251 = _199 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _253 = _249 * _209;
    float _255 = _249 * _201;
    float _257 = _249 * _159;
    float _259 = abs(_245);
    float _261 = log2(_259);
    float _263 = -_141;
    float _265 = -_253;
    float _267 = fma(_263, _213, _265);
    float _269 = -_203;
    float _271 = -_255;
    float _273 = fma(_141, _269, _271);
    float _275 = fma(_141, _151, _257);
    float _277 = -_143;
    float _279 = fma(_277, _217, _267);
    float _281 = -_205;
    float _283 = fma(_143, _281, _273);
    float _285 = fma(_143, _165, _275);
    float _287 = exp2(_251);
    float _289 = _247 * _279;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _295 = _135 + _293;
    float _297 = -(*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _299 = _137 + _297;
    float _301 = _295 * _295;
    float _303 = abs(_291);
    float _305 = log2(_303);
    float _307 = _261 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _309 = fma(_299, _299, _301);
    float _311 = -_193;
    float _313 = _249 * _311;
    float _315 = -_313;
    float _317 = fma(_141, _195, _315);
    float _319 = exp2(_307);
    float _321 = fma(_143, _183, _317);
    float _323 = -_185;
    float _325 = fma(_323, _285, 0.0);
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = precise::min(_321, _283);
    float _331 = _291 * _329;
    float _333 = _331 * 2.0;
    float _335 = _119 + _121;
    float _337 = _335 + _123;
    float _339 = 1.0 / _239;
    float _341 = _131 * _305;
    float _343 = _337 + _125;
    float _345 = -_309;
    float _347 = fma(_345, (*spvDescriptorSet0.fp_c4)._m0[12].z, 1.0);
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = _287 * _319;
    float _353 = _343 * 0.25;
    float _355 = exp2(_341);
    float _357 = _353 * _349;
    float _359 = _353 * _351;
    float _361 = _319 * _357;
    float _363 = _333 * _339;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _359 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _369 = _327 * _367;
    float _371 = _355 * _361;
    float _373 = _369 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _375 = _369 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _377 = _369 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _379 = _365 * _371;
    float _381 = _133 * _379;
    float _383 = _191 * _381;
    float _385 = _383 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _387 = _385 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    out.m_45.x = _373;
    out.m_45.y = _375;
    out.m_45.z = _377;
    out.m_45.w = _387;
    return out;
}

