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
    float2 _414 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_414, float2(0.0), isnan(_414))).x;
    float2 _425 = float2(_54, _56);
    float4 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_425, float2(0.0), isnan(_425))).xyzw;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float _69 = _61.w;
    float _71 = in.m_40.w;
    float _73 = in.m_40.y;
    float _75 = in.m_40.z;
    float _77 = in.m_40.x;
    float _79 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _81 = -_79;
    float _83 = fma(_81, _71, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _85 = -_79;
    float _87 = fma(_85, _73, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _89 = -_79;
    float _91 = fma(_89, _75, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _93 = -_79;
    float _95 = fma(_93, _77, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _97 = 1.0 / _83;
    float _99 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[17].y, _87);
    float _101 = -_83;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[17].y, _87);
    float _105 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[17].x, _95);
    float _107 = -_83;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c4)._m0[17].x, _95);
    float _111 = _91 * _97;
    float _113 = _99 * _97;
    float _115 = _105 * _97;
    float _117 = _109 * _97;
    float _119 = _103 * _97;
    float2 _534 = float2(_115, _113);
    float _121 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_534, float2(0.0), isnan(_534)), _111);
    float2 _542 = float2(_117, _113);
    float _123 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542)), _111);
    float2 _549 = float2(_69, 0.0);
    float2 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_549, float2(0.0), isnan(_549))).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float2 _561 = float2(_115, _119);
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_561, float2(0.0), isnan(_561)), _111);
    float2 _569 = float2(_117, _119);
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569)), _111);
    float _137 = in.m_42.w;
    float _139 = in.m_44.y;
    float _141 = in.m_44.x;
    float _143 = in.m_44.z;
    float _145 = in.m_42.x;
    float _147 = in.m_42.y;
    float _149 = -_79;
    float _151 = fma(_149, _137, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _153 = _139 * _139;
    float _155 = -_79;
    float _157 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _159 = fma(_155, _141, _157);
    float _161 = -_151;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _165 = fma(_141, _141, _153);
    float _167 = -_79;
    float _169 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _171 = fma(_167, _139, _169);
    float _173 = -_79;
    float _175 = fma(_173, _145, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _177 = -_79;
    float _179 = fma(_177, _147, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    bool _183 = _163 <= 1.0;
    bool _185 = isnan(_163);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = float(_191);
    float _195 = _165 + 1.0;
    float _197 = _171 * _171;
    float _199 = precise::max(_175, _179);
    float _201 = _163 * _193;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = -_79;
    float _207 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _209 = fma(_205, _143, _207);
    float _211 = fma(_159, _159, _197);
    float _213 = rsqrt(_195);
    float _215 = precise::min(_175, _179);
    float _217 = fma(_209, _209, _211);
    bool _219 = _215 >= 0.0;
    bool _221 = isnan(_215);
    bool _223 = _219 || _221;
    bool _225 = isnan(0.0);
    bool _227 = _223 || _225;
    float _229 = abs(_203);
    float _231 = log2(_229);
    bool _233 = _151 >= _199;
    bool _235 = isnan(_151);
    bool _237 = _233 || _235;
    bool _239 = isnan(_199);
    bool _241 = _237 || _239;
    bool _243 = _241 && _227;
    float _245 = float(_243);
    float _247 = rsqrt(_217);
    float _249 = _141 * _213;
    float _251 = _139 * _213;
    float _253 = _143 * _213;
    float _255 = fma(_65, 2.0, -1.0);
    float _257 = fma(_63, 2.0, -1.0);
    float _259 = fma(_67, 2.0, -1.0);
    float _261 = _231 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _263 = exp2(_261);
    float _265 = _171 * _247;
    float _267 = _159 * _247;
    float _269 = _209 * _247;
    float _271 = _255 * _171;
    float _273 = -_251;
    float _275 = _265 + _273;
    float _277 = -_249;
    float _279 = _267 + _277;
    float _281 = -_253;
    float _283 = _269 + _281;
    float _285 = _257 * _267;
    float _287 = _275 * _275;
    float _289 = -_275;
    float _291 = _251 * _289;
    float _293 = _255 * _275;
    float _295 = fma(_257, _159, _271);
    float _297 = fma(_279, _279, _287);
    float _299 = -_249;
    float _301 = fma(_299, _279, _291);
    float _303 = -_257;
    float _305 = -_293;
    float _307 = fma(_303, _279, _305);
    float _309 = -_251;
    float _311 = _255 * _309;
    float _313 = fma(_283, _283, _297);
    float _315 = -_253;
    float _317 = fma(_315, _283, _301);
    float _319 = -_259;
    float _321 = fma(_319, _283, _307);
    float _323 = -_311;
    float _325 = fma(_257, _249, _323);
    float _327 = -_265;
    float _329 = -_285;
    float _331 = fma(_255, _327, _329);
    float _333 = 1.0 / _317;
    float _335 = fma(_259, _209, _295);
    float _337 = fma(_259, _253, _325);
    float _339 = -_269;
    float _341 = fma(_259, _339, _331);
    float _343 = _245 * _263;
    float _345 = -_247;
    float _347 = fma(_345, _335, 0.0);
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = rsqrt(_313);
    float _353 = precise::min(_337, _341);
    float _355 = _351 * _321;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = abs(_357);
    float _361 = log2(_359);
    float _363 = _357 * _353;
    float _365 = _363 * 2.0;
    float _367 = _365 * _333;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = _121 + _123;
    float _373 = _129 * _361;
    float _375 = _371 + _133;
    float _377 = exp2(_373);
    float _379 = _375 + _135;
    float _381 = _379 * _343;
    float _383 = _381 * 0.25;
    float _385 = _383 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _387 = _385 * _349;
    float _389 = _385 * _377;
    float _391 = _387 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _393 = _369 * _389;
    float _395 = _131 * _393;
    float _397 = _395 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _399 = _387 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _401 = _387 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _403 = _397 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    out.m_47.x = _399;
    out.m_47.y = _391;
    out.m_47.z = _401;
    out.m_47.w = _403;
    return out;
}

