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
    float4 m_47 [[color(1)]];
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
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _400 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_400, float2(0.0), isnan(_400))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_400, float2(0.0), isnan(_400))).x;
    float2 _412 = float2(_54, _56);
    float4 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_412, float2(0.0), isnan(_412))).xyzw;
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
    float _83 = fma(_81, _71, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _85 = -_79;
    float _87 = fma(_85, _73, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _89 = -_79;
    float _91 = fma(_89, _75, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _93 = -_79;
    float _95 = fma(_93, _77, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _97 = 1.0 / _83;
    float _99 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[14].y, _87);
    float _101 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[14].x, _91);
    float _103 = -_83;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[14].x, _91);
    float _107 = -_83;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c4)._m0[14].y, _87);
    float _111 = _99 * _97;
    float _113 = _101 * _97;
    float _115 = _95 * _97;
    float _117 = _105 * _97;
    float _119 = _109 * _97;
    float2 _522 = float2(_113, _111);
    float _121 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522)), _115);
    float2 _530 = float2(_117, _111);
    float _123 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530)), _115);
    float2 _538 = float2(_113, _119);
    float _125 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538)), _115);
    float2 _546 = float2(_117, _119);
    float _127 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546)), _115);
    float2 _553 = float2(_69, 0.0);
    float2 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_553, float2(0.0), isnan(_553))).xy;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = in.m_42.y;
    float _139 = in.m_42.x;
    float _141 = in.m_42.z;
    float _143 = fma(_65, 2.0, -1.0);
    float _145 = fma(_63, 2.0, -1.0);
    float _147 = fma(_67, 2.0, -1.0);
    float _149 = _137 * _137;
    float _151 = -_79;
    float _153 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _155 = fma(_151, _139, _153);
    float _157 = fma(_139, _139, _149);
    float _159 = -_79;
    float _161 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _163 = fma(_159, _137, _161);
    float _165 = -_79;
    float _167 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _169 = fma(_165, _141, _167);
    float _171 = _157 + 1.0;
    float _173 = _163 * _163;
    float _175 = fma(_155, _155, _173);
    float _177 = fma(_169, _169, _175);
    float _179 = rsqrt(_171);
    float _181 = _163 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _183 = fma(_155, (*spvDescriptorSet0.fp_c4)._m0[11].x, _181);
    float _185 = sqrt(_177);
    float _187 = rsqrt(_177);
    float _189 = _137 * _179;
    float _191 = _141 * _179;
    float _193 = _139 * _179;
    float _195 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _197 = _137 + _195;
    float _199 = -(*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _201 = _139 + _199;
    float _203 = -_185;
    float _205 = fma(_203, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _197 * _197;
    float _211 = abs(_207);
    float _213 = log2(_211);
    float _215 = fma(_201, _201, _209);
    float _217 = _163 * _187;
    float _219 = _155 * _187;
    float _221 = _169 * _187;
    float _223 = -_189;
    float _225 = _223 + _217;
    float _227 = -_193;
    float _229 = _227 + _219;
    float _231 = -_191;
    float _233 = _231 + _221;
    float _235 = _225 * _225;
    float _237 = _143 * _225;
    float _239 = -_225;
    float _241 = _189 * _239;
    float _243 = -_189;
    float _245 = _143 * _243;
    float _247 = fma(_229, _229, _235);
    float _249 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[11].z, _183);
    float _251 = -_145;
    float _253 = -_237;
    float _255 = fma(_251, _229, _253);
    float _257 = _213 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _259 = fma(_233, _233, _247);
    float _261 = _187 * _249;
    float _263 = -_147;
    float _265 = fma(_263, _233, _255);
    float _267 = -_193;
    float _269 = fma(_267, _229, _241);
    float _271 = exp2(_257);
    float _273 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _275 = fma(_261, (*spvDescriptorSet0.fp_c4)._m0[13].y, _273);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = -_245;
    float _281 = fma(_145, _193, _279);
    float _283 = -_191;
    float _285 = fma(_283, _233, _269);
    float _287 = fma(_147, _191, _281);
    float _289 = rsqrt(_259);
    float _291 = abs(_277);
    float _293 = log2(_291);
    float _295 = _289 * _265;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = abs(_297);
    float _301 = log2(_299);
    float _303 = _293 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _305 = exp2(_303);
    float _307 = _271 * _305;
    float _309 = _121 + _123;
    float _311 = _309 + _125;
    float _313 = _143 * _217;
    float _315 = 1.0 / _285;
    float _317 = _143 * _163;
    float _319 = _133 * _301;
    float _321 = -_219;
    float _323 = -_313;
    float _325 = fma(_145, _321, _323);
    float _327 = _311 + _127;
    float _329 = fma(_145, _155, _317);
    float _331 = -_221;
    float _333 = fma(_147, _331, _325);
    float _335 = exp2(_319);
    float _337 = -_215;
    float _339 = fma(_337, (*spvDescriptorSet0.fp_c4)._m0[12].z, 1.0);
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = _327 * 0.25;
    float _345 = fma(_147, _169, _329);
    float _347 = precise::min(_287, _333);
    float _349 = _343 * _341;
    float _351 = -_187;
    float _353 = fma(_351, _345, 0.0);
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = _343 * _307;
    float _359 = _297 * _347;
    float _361 = _359 * 2.0;
    float _363 = _305 * _349;
    float _365 = _355 * _357;
    float _367 = _361 * _315;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = _335 * _363;
    float _373 = _365 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _375 = _365 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _377 = _365 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _379 = _369 * _371;
    float _381 = _135 * _379;
    float _383 = _207 * _381;
    float _385 = _383 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _387 = _383 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _389 = _383 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    out.m_45.x = _373;
    out.m_45.y = _375;
    out.m_45.z = _377;
    out.m_47.x = _385;
    out.m_47.y = _387;
    out.m_47.z = _389;
    return out;
}

