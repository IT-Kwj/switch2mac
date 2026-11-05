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
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _390 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float2 _401 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_401, float2(0.0), isnan(_401))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_42.w;
    float _75 = in.m_44.w;
    float _77 = in.m_42.x;
    float _79 = in.m_42.y;
    float _81 = in.m_44.z;
    float _83 = in.m_44.x;
    float _85 = in.m_44.y;
    float _87 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _89 = -_87;
    float _91 = fma(_89, _73, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _93 = -_87;
    float _95 = fma(_93, _75, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _97 = -_87;
    float _99 = fma(_97, _77, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _101 = -_87;
    float _103 = fma(_101, _79, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _105 = 1.0 / _91;
    float _107 = -_87;
    float _109 = fma(_107, _81, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _111 = -_87;
    float _113 = fma(_111, _83, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _115 = -_87;
    float _117 = fma(_115, _85, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _119 = 1.0 / _95;
    float _121 = _99 * _105;
    float _123 = _103 * _105;
    float2 _507 = float2(_71, 0.0);
    float2 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_507, float2(0.0), isnan(_507))).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _109 * _119;
    float _135 = _113 * _119;
    float _137 = _117 * _119;
    float2 _528 = float2(_135, _137);
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_528, float2(0.0), isnan(_528)), _133);
    float2 _536 = float2(_121, _123);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_536, float2(0.0), isnan(_536))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_536, float2(0.0), isnan(_536))).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = in.m_46.y;
    float _153 = in.m_46.x;
    float _155 = in.m_46.z;
    float _157 = fma(_65, 2.0, -1.0);
    float _159 = fma(_69, 2.0, -1.0);
    float _161 = _151 * _151;
    float _163 = -_87;
    float _165 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _167 = fma(_163, _151, _165);
    float _169 = -_87;
    float _171 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _173 = fma(_169, _153, _171);
    float _175 = fma(_153, _153, _161);
    float _177 = _175 + 1.0;
    float _179 = _167 * _167;
    float _181 = -_87;
    float _183 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _185 = fma(_181, _155, _183);
    float _187 = rsqrt(_177);
    float _189 = fma(_173, _173, _179);
    float _191 = fma(_185, _185, _189);
    float _193 = rsqrt(_191);
    float _195 = _151 * _187;
    float _197 = _153 * _187;
    float _199 = _155 * _187;
    float _201 = _167 * _193;
    float _203 = _173 * _193;
    float _205 = _185 * _193;
    float _207 = -_195;
    float _209 = _201 + _207;
    float _211 = -_197;
    float _213 = _203 + _211;
    float _215 = -_199;
    float _217 = _205 + _215;
    float _219 = _157 * _203;
    float _221 = _209 * _209;
    float _223 = fma(_213, _213, _221);
    float _225 = -_91;
    float _227 = fma(_225, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _229 = fma(_67, 2.0, -1.0);
    float _231 = -_209;
    float _233 = _195 * _231;
    float _235 = fma(_217, _217, _223);
    bool _239 = _227 <= 1.0;
    bool _241 = isnan(_227);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = _229 * _209;
    float _253 = -_197;
    float _255 = fma(_253, _213, _233);
    float _257 = -_201;
    float _259 = -_219;
    float _261 = fma(_229, _257, _259);
    float _263 = rsqrt(_235);
    float _265 = _227 * _249;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = -_157;
    float _271 = -_251;
    float _273 = fma(_269, _213, _271);
    float _275 = -_199;
    float _277 = fma(_275, _217, _255);
    float _279 = -_205;
    float _281 = fma(_159, _279, _261);
    float _283 = _229 * _167;
    float _285 = -_159;
    float _287 = fma(_285, _217, _273);
    float _289 = -_195;
    float _291 = _229 * _289;
    float _293 = abs(_267);
    float _295 = log2(_293);
    float _297 = fma(_157, _173, _283);
    float _299 = -_291;
    float _301 = fma(_157, _197, _299);
    float _303 = fma(_159, _185, _297);
    float _305 = fma(_159, _199, _301);
    float _307 = _263 * _287;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = 1.0 / _277;
    float _313 = precise::min(_305, _281);
    float _315 = _295 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _317 = abs(_309);
    float _319 = log2(_317);
    float _321 = _309 * _313;
    float _323 = _321 * 2.0;
    float _325 = exp2(_315);
    float _327 = _323 * _311;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = -_193;
    float _333 = fma(_331, _303, 0.0);
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _129 * _319;
    float _339 = exp2(_337);
    float _341 = _325 * _139;
    float _343 = _147 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _345 = _145 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _347 = _145 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _349 = _341 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _351 = _343 * 0.586610972881317138671875;
    float _353 = _149 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _355 = _349 * _335;
    float _357 = fma(_345, 0.298911988735198974609375, _351);
    float _359 = _149 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _361 = _347 * _355;
    float _363 = _349 * _339;
    float _365 = fma(_353, 0.114477999508380889892578125, _357);
    float _367 = _147 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _369 = _359 * _355;
    float _371 = _329 * _363;
    float _373 = _367 * _355;
    float _375 = _131 * _371;
    float _377 = _375 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _379 = _365 * _377;
    out.m_49.x = _361;
    out.m_49.y = _373;
    out.m_49.z = _369;
    out.m_49.w = _379;
    return out;
}

