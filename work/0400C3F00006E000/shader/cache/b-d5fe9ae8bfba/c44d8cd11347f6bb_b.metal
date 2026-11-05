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
    float4 m_47 [[color(0)]];
    float4 m_49 [[color(1)]];
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
    float _56 = in.m_38.x;
    float _58 = in.m_38.y;
    float2 _402 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_402, float2(0.0), isnan(_402))).x;
    float2 _413 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_413, float2(0.0), isnan(_413))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_40.w;
    float _75 = in.m_40.y;
    float _77 = in.m_40.x;
    float _79 = in.m_40.z;
    float _81 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _83 = -_81;
    float _85 = fma(_83, _73, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _87 = -_81;
    float _89 = fma(_87, _75, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _91 = -_81;
    float _93 = fma(_91, _77, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _95 = -_81;
    float _97 = fma(_95, _79, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _99 = 1.0 / _85;
    float _101 = fma(_85, (*spvDescriptorSet0.fp_c4)._m0[17].y, _89);
    float _103 = fma(_85, (*spvDescriptorSet0.fp_c4)._m0[17].x, _93);
    float _105 = -_85;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[17].x, _93);
    float _109 = -_85;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[17].y, _89);
    float _113 = _101 * _99;
    float _115 = _97 * _99;
    float _117 = _103 * _99;
    float _119 = _107 * _99;
    float _121 = _111 * _99;
    float2 _521 = float2(_71, 0.0);
    float2 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_521, float2(0.0), isnan(_521))).xy;
    float _127 = _125.x;
    float _129 = _125.y;
    float2 _533 = float2(_117, _113);
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_533, float2(0.0), isnan(_533)), _115);
    float2 _541 = float2(_119, _113);
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541)), _115);
    float2 _549 = float2(_117, _121);
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_549, float2(0.0), isnan(_549)), _115);
    float2 _557 = float2(_119, _121);
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_557, float2(0.0), isnan(_557)), _115);
    float _139 = in.m_42.z;
    float _141 = in.m_44.y;
    float _143 = in.m_44.x;
    float _145 = in.m_42.w;
    float _147 = in.m_42.x;
    float _149 = in.m_44.z;
    float _151 = -_81;
    float _153 = fma(_151, _139, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _155 = _141 * _141;
    float _157 = fma(_153, -0.5, 0.5);
    float _159 = fma(_143, _143, _155);
    float _161 = in.m_42.y;
    float _163 = _159 + 1.0;
    float _165 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    bool _169 = _157 <= 1.0;
    bool _171 = isnan(_157);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = float(_177);
    float _181 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _165);
    float _183 = rsqrt(_163);
    float _185 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _181);
    float _187 = _157 * _179;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = rsqrt(_185);
    float _193 = _141 * _183;
    float _195 = abs(_189);
    float _197 = log2(_195);
    float _199 = -_81;
    float _201 = fma(_199, _147, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _203 = _143 * _183;
    float _205 = _183 * _149;
    float _207 = -_81;
    float _209 = fma(_207, _145, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _211 = -_81;
    float _213 = fma(_211, _161, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _215 = _191 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _217 = _191 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _219 = -_193;
    float _221 = _215 + _219;
    float _223 = precise::min(_201, _213);
    float _225 = -_203;
    float _227 = _217 + _225;
    float _229 = precise::max(_201, _213);
    float _231 = _197 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _233 = _191 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _235 = _221 * _221;
    bool _237 = _223 >= 0.0;
    bool _239 = isnan(_223);
    bool _241 = _237 || _239;
    bool _243 = isnan(0.0);
    bool _245 = _241 || _243;
    float _247 = -_205;
    float _249 = _233 + _247;
    float _251 = fma(_227, _227, _235);
    bool _253 = _209 >= _229;
    bool _255 = isnan(_209);
    bool _257 = _253 || _255;
    bool _259 = isnan(_229);
    bool _261 = _257 || _259;
    bool _263 = _261 && _245;
    float _265 = float(_263);
    float _267 = exp2(_231);
    float _269 = fma(_249, _249, _251);
    float _271 = fma(_67, 2.0, -1.0);
    float _273 = fma(_65, 2.0, -1.0);
    float _275 = rsqrt(_269);
    float _277 = fma(_69, 2.0, -1.0);
    float _279 = _271 * _221;
    float _281 = -_273;
    float _283 = -_279;
    float _285 = fma(_281, _227, _283);
    float _287 = _265 * _267;
    float _289 = -_221;
    float _291 = _193 * _289;
    float _293 = -_277;
    float _295 = fma(_293, _249, _285);
    float _297 = -_193;
    float _299 = _271 * _297;
    float _301 = _273 * _217;
    float _303 = -_203;
    float _305 = fma(_303, _227, _291);
    float _307 = -_299;
    float _309 = fma(_273, _203, _307);
    float _311 = _275 * _295;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = -_205;
    float _317 = fma(_315, _249, _305);
    float _319 = -_215;
    float _321 = -_301;
    float _323 = fma(_271, _319, _321);
    float _325 = fma(_277, _205, _309);
    float _327 = abs(_313);
    float _329 = log2(_327);
    float _331 = _271 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _333 = -_233;
    float _335 = fma(_277, _333, _323);
    float _337 = fma(_273, (*spvDescriptorSet0.fp_c4)._m0[15].x, _331);
    float _339 = precise::min(_325, _335);
    float _341 = 1.0 / _317;
    float _343 = fma(_277, (*spvDescriptorSet0.fp_c4)._m0[15].z, _337);
    float _345 = _313 * _339;
    float _347 = _345 * 2.0;
    float _349 = -_191;
    float _351 = fma(_349, _343, 0.0);
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = _347 * _341;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = _127 * _329;
    float _361 = _131 + _133;
    float _363 = exp2(_359);
    float _365 = _361 + _135;
    float _367 = _365 + _137;
    float _369 = _367 * _287;
    float _371 = _369 * 0.25;
    float _373 = _371 * _363;
    float _375 = _357 * _373;
    float _377 = _371 * _353;
    float _379 = _129 * _375;
    float _381 = _377 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _383 = _377 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _385 = _377 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _387 = _379 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _389 = _379 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _391 = _379 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    out.m_47.x = _381;
    out.m_47.y = _383;
    out.m_47.z = _385;
    out.m_49.x = _387;
    out.m_49.y = _389;
    out.m_49.z = _391;
    return out;
}

