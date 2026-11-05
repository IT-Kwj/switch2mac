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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2137 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2435 = as_type<float>(_127);
        out.gl_Position.z = _2435;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    if (_141)
    {
        float _149 = float(_113);
        _147 = _149;
    }
    float _151 = _147;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = 0.0;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_165);
        out.gl_Position.z = _2503;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _145 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_56.x;
    float _227 = in.m_56.y;
    float _229 = in.m_56.z;
    float _231 = _227 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = _227 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _235 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[6].x, _233);
    float _239 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].z, _237);
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = _241 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = floor(_247);
    float _253 = floor(_249);
    float _255 = -_251;
    float _257 = _247 + _255;
    float _259 = -_253;
    float _261 = _249 + _259;
    float2 _2680 = float2(_257, _261);
    float _263 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2680, float2(0.0), isnan(_2680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2680, float2(0.0), isnan(_2680)), level(0.0)).x;
    float _265 = as_type<float>(int(gl_VertexIndex));
    float _267 = _227 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _223 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[5].x, _267);
    float _287 = 1.0 / _275;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _223 + _289;
    bool _293 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _295 = isnan(_223);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].z, _285);
    bool _307 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_223);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _305 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _321 = 1.0 / _279;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = _223 + _323;
    float _327 = -_317;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _283;
    float _333 = _271 * _287;
    bool _335 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _337 = isnan(_223);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    int _347 = as_type<int>(_265) & 1;
    bool _349 = _347 != 0;
    int _351 = as_type<int>(_265) & 2;
    bool _353 = _351 != 0;
    float _355 = -_345;
    float _357 = _355 + 1.0;
    float _359 = _291 * _321;
    float _361 = -_303;
    float _363 = _361 + 1.0;
    bool _365 = !_353;
    float _367 = _365 ? (-0.5) : 0.5;
    bool _369 = !_349;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = _345 * _363;
    float _375 = _317 * _357;
    bool _377 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_223);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _325 * _331;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_223);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _393;
    float _409 = _405 * _329;
    float _411 = -_405;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _223 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = _387 * _413;
    float _429 = fma(_417, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = -_387;
    float _433 = _431 + 1.0;
    float _435 = fma(_425, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = _429 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _435 * _427;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = _421 * _407;
    float _451 = _319 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _453 = fma(_441, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _443);
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _437);
    float _459 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _451);
    float _461 = fma(_447, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = _319 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _465 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _459);
    float _467 = fma(_453, _409, _455);
    float _469 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _463);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = _465 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _469);
    float _483 = fma(_473, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = 1.0 / _475;
    float _487 = in.m_70.x;
    float _489 = in.m_70.y;
    float _491 = _481 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _493 = fma(_479, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = fma(_483, _375, _467);
    float _501 = _491 + _475;
    float _503 = fma(_461, _409, _457);
    float _505 = fma(_497, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_493, _375, _503);
    float _513 = fma(_505, _373, _499);
    float _515 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _517 = fma(_509, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _519 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _521 = _501 * _485;
    float _523 = _521 * 0.5;
    float _525 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].y, _513);
    float _527 = fma(_517, _373, _511);
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _531 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[30].w, _529);
    float _533 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].x, _527);
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _367);
    float _537 = _525 * _489;
    float _539 = 1.0 / _531;
    float _541 = _319 + _515;
    float _543 = _533 * _487;
    float _545 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _547 = _541 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _549 = _541 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _551 = _545 * _535;
    float _553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _371);
    float _555 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _547);
    float _557 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _549);
    float _559 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _561 = _551 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _563 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[126].z, _555);
    float _565 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[127].z, _557);
    float _567 = _559 * _553;
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _571 = _539 * _569;
    float _573 = _563 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _575 = _551 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _577 = _565 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[26].x, _561);
    bool _581 = _571 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _583 = trunc(_573);
    int _585 = int(_583);
    bool _587 = _571 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _589 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[24].x, _575);
    bool _591 = !_581;
    int _593 = _591 ? 0 : 1;
    float _595 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _579);
    float _597 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _589);
    float _599 = trunc(_577);
    int _601 = int(_599);
    float _603 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _607 = 2;
    int _609 = as_type<int>(_567);
    float _611 = _243;
    if (!_581)
    {
        _607 = 1;
    }
    int _613 = _607;
    float _615 = _245 + _603;
    int _617 = _613;
    if (!_587)
    {
        _617 = _593;
    }
    int _619 = _617;
    float _621 = _243 + _605;
    int _623 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _625 = _585 + _623;
    int _627 = _625 + 1;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _631 = _615 + _629;
    int _633 = _619 << 6;
    bool _635 = _627 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _637 = _631 * _631;
    int _639 = _633 + 48;
    uint _642 = uint(int(uint(_639) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.vp_c15)._m0[int(_644)][_646];
    int _650 = int(_642) + 1;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    int _654 = _650 & 3;
    float _656 = (*spvDescriptorSet0.vp_c15)._m0[int(_652)][_654];
    int _658 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _660 = _601 + _658;
    int _662 = _660 + 1;
    float _664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _666 = _621 + _664;
    int _668 = _627 | _662;
    float _670 = fma(_666, _666, _637);
    int _672 = _633 + 56;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.vp_c15)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[int(_684)][_686];
    bool _690 = _668 < 0;
    bool _692 = _690 || _635;
    float _694 = sqrt(_670);
    float _696 = _551 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _698 = _662 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _700 = _698 || _692;
    int _702 = _633 + 64;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.vp_c15)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.vp_c15)._m0[int(_714)][_716];
    float _720 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[25].x, _696);
    float _722 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _720);
    int _724 = _633 + 72;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    uint _728 = uint(int(uint(int(_726)) >> uint(2)));
    int _730 = int(_726) & 3;
    float _732 = (*spvDescriptorSet0.vp_c15)._m0[int(_728)][_730];
    int _734 = int(_726) + 1;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    int _738 = _734 & 3;
    float _740 = (*spvDescriptorSet0.vp_c15)._m0[int(_736)][_738];
    float _742 = _722 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _744 = _694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _746 = as_type<int>(_696);
    int _748 = as_type<int>(_722);
    float _750 = as_type<float>(_627);
    float _752 = _637;
    float _754 = _621;
    if (!_700)
    {
        int _756 = _662 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _758 = _756 + _627;
        _609 = _758;
    }
    int _760 = _609;
    float _762 = _319 + _742;
    int _764 = _633 + 96;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    float _782 = as_type<float>(_760);
    if (!_700)
    {
        int _784 = _760 << 2;
        _746 = _784;
    }
    int _786 = _746;
    int _788 = _786;
    if (!_700)
    {
        uint _790 = uint(int(uint(_760) >> uint(2)));
        _748 = int(_790);
    }
    int _792 = _748;
    if (!_700)
    {
        int _794 = 12 & _786;
        _788 = _794;
    }
    int _796 = _788;
    int _798 = _633 + 104;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    int _816 = 0;
    float _818 = as_type<float>(_796);
    if (!_700)
    {
        int _820 = _792 << 4;
        int _822 = _820 + _796;
        _816 = _822;
    }
    int _824 = _816;
    if (!_744)
    {
        _750 = _615;
    }
    float _826 = _750;
    float _828 = _826;
    if (!_744)
    {
        _752 = _762;
    }
    float _830 = _752;
    bool _832 = !_744;
    float _834 = _830;
    float _836 = _780;
    float _838 = _740;
    float _840 = _710;
    if (!_832)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _694 + _844;
        float _848 = rsqrt(_670);
        float _850 = _846 * _842;
        float _852 = _762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = _850 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _848 * _864;
        float _868 = _862 + (-1.0);
        float _870 = fma(_666, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _872 = fma(_631, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_762, _862, _874);
        _834 = _876;
        _754 = _870;
        _828 = _872;
        _818 = _874;
    }
    float _878 = _834;
    float _880 = _754;
    float _882 = _828;
    float _884 = _818;
    float _886 = -_319;
    float _888 = _886 + _878;
    int _890 = _633 + 80;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    float _908 = -_243;
    float _910 = _908 + _880;
    float _912 = -_245;
    float _914 = _912 + _882;
    float _916 = _888 * _888;
    float _918 = _541 * _780;
    float _920 = _541 * _718;
    float _922 = _880;
    float _924 = _878;
    float _926 = _882;
    float _928 = _914;
    float _930 = _888;
    if (!_700)
    {
        float _932 = floor(_573);
        _836 = _932;
    }
    float _934 = _836;
    float _936 = fma(_910, _910, _916);
    int _938 = _633 + 88;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    float _956 = fma(_243, _772, _918);
    float _958 = fma(_243, _710, _920);
    float _960 = fma(_914, _914, _936);
    float _962 = fma(_245, _806, _956);
    float _964 = _541 * _656;
    float _966 = sqrt(_960);
    float _968 = _884;
    if (!_700)
    {
        int _970 = _824 + 400;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        uint _974 = uint(int(uint(int(_972)) >> uint(2)));
        int _976 = int(_972) & 3;
        float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
        _968 = _978;
    }
    float _980 = _968;
    float _982 = _962 + _814;
    float _984 = fma(_243, _648, _964);
    float _986 = fma(_245, _732, _958);
    bool _988 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _990 = isnan(0.5);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _996 = _992 || _994;
    float _998 = fma(_245, _680, _984);
    float _1000 = _956;
    float _1002 = _986;
    if (!_700)
    {
        float _1004 = floor(_577);
        _1000 = _1004;
    }
    float _1006 = _1000;
    float _1008 = _986 + _740;
    float _1010 = _998 + _688;
    bool _1012 = _966 > 0.0;
    float _1014 = 1.0 / _982;
    bool _1016 = !_1012;
    if (!_1016)
    {
        float _1018 = _189 * _189;
        float _1020 = fma(_187, _187, _1018);
        float _1022 = fma(_191, _191, _1020);
        float _1024 = rsqrt(_960);
        float _1026 = sqrt(_1022);
        float _1028 = _910 * _1024;
        float _1030 = _888 * _1024;
        float _1032 = _914 * _1024;
        bool _1034 = _1026 > 0.0;
        bool _1036 = !_1034;
        _838 = _1024;
        _1002 = _1022;
        _928 = _1032;
        if (!_1036)
        {
            float _1038 = rsqrt(_1022);
            float _1040 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1042 = _189 * _1038;
            float _1044 = _187 * _1038;
            float _1046 = _191 * _1038;
            float _1048 = _1030 * _1042;
            float _1050 = fma(_1028, _1044, _1048);
            float _1052 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1054 = fma(_1032, _1046, _1050);
            float _1056 = _1054 * _1052;
            float _1058 = fma(_187, _1056, _880);
            float _1060 = fma(_189, _1056, _878);
            float _1062 = fma(_191, _1056, _882);
            _922 = _1058;
            _924 = _1060;
            _926 = _1062;
            _838 = _1056;
            _840 = _1052;
        }
    }
    float _1064 = _922;
    float _1066 = _924;
    float _1068 = _926;
    float _1070 = _838;
    float _1072 = _1002;
    float _1074 = _840;
    float _1076 = _928;
    float _1078 = _1072;
    float _1080 = _1070;
    float _1082 = _1074;
    float _1084 = _1076;
    if (_996)
    {
        _1078 = _1064;
    }
    float _1086 = _1078;
    float _1088 = _1086;
    if (_996)
    {
        _1080 = _1066;
    }
    float _1090 = _1080;
    float _1092 = _1090;
    if (_996)
    {
        _195 = _1068;
    }
    float _1094 = _195;
    float _1096 = _1094;
    if (!_996)
    {
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1100 = _319 + _1098;
        float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1104 = _243 + _1102;
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1108 = _1100 * _1100;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1112 = _245 + _1110;
        float _1114 = fma(_1104, _1104, _1108);
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1118 = fma(_1112, _1112, _1114);
        float _1120 = sqrt(_1118);
        float _1122 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1124 = -_245;
        float _1126 = _1124 + _1068;
        float _1128 = precise::min(_1120, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1130 = _1128 * _1116;
        float _1132 = -_319;
        float _1134 = _1132 + _1066;
        float _1136 = _1122 * _1130;
        float _1138 = -_243;
        float _1140 = _1138 + _1064;
        float _1142 = fma(_1134, _1136, _319);
        float _1144 = fma(_1140, _1136, _243);
        float _1146 = fma(_1126, _1136, _245);
        _1092 = _1142;
        _1088 = _1144;
        _1096 = _1146;
        _1082 = _1116;
    }
    float _1148 = _1092;
    float _1150 = _1088;
    float _1152 = _1096;
    float _1154 = _1082;
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1160 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1162 = _1010 * _1014;
    float _1164 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1156);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1160);
    float _1170 = _1154;
    if (!_700)
    {
        float _1172 = rint(_980);
        float _1174 = precise::max(_1172, 0.0);
        uint _1176 = uint(_1174);
        uint _1178 = clamp(_1176, 0u, 65535u);
        _1170 = as_type<float>(_1178);
    }
    float _1180 = _1170;
    float _1182 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    bool _1184 = _1162 >= 0.0;
    float _1186 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1166);
    float _1188 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1168);
    float _1190 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1194 = _1008 * _1014;
    bool _1196 = _1162 <= 1.0;
    bool _1198 = _1196 && _1184;
    float _1200 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1204 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1212 = _1194 >= 0.0;
    bool _1214 = _1212 && _1198;
    float _1216 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1204);
    float _1218 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1220 = -_1210;
    float _1222 = fma(_1220, _1208, 1.0);
    bool _1224 = _1194 <= 1.0;
    bool _1226 = _1224 && _1214;
    float _1228 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1230 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1218);
    float _1232 = _541 * _906;
    float _1234 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = log2(_1222);
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1240 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1242 = fma(_243, _898, _1232);
    float _1244 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1246 = fma(_245, _946, _1242);
    float _1248 = 1.0 / _1238;
    float _1250 = _1210;
    float _1252 = _1238;
    if (_1226)
    {
        float _1254 = float(_619);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1240);
    float _1260 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1244);
    float _1262 = _1246 + _954;
    float _1264 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1258);
    float _1266 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1260);
    float _1268 = _1242;
    float _1270 = _1264;
    float _1272 = _1258;
    if (_1226)
    {
        float _1274 = rint(_1256);
        float _1276 = precise::max(_1274, 0.0);
        uint _1278 = uint(_1276);
        uint _1280 = clamp(_1278, 0u, 65535u);
        _1268 = as_type<float>(_1280);
    }
    float _1282 = _1268;
    float _1284 = _1236 * 0.693147182464599609375;
    float _1286 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1264);
    float _1288 = _1284;
    if (!_700)
    {
        float _1290 = -_934;
        float _1292 = _573 + _1290;
        _1270 = _1292;
    }
    float _1294 = _1270;
    if (!_700)
    {
        float _1296 = -_1006;
        float _1298 = _577 + _1296;
        _1272 = _1298;
    }
    float _1300 = _1272;
    float _1302 = _1262 * _1014;
    float _1304 = _1266 * _1248;
    float _1306 = _1286 * _1248;
    float _1308 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1310 = fma(_1304, 0.5, 0.5);
    float _1312 = fma(_1306, -0.5, 0.5);
    float _1314 = _1180;
    if (!_700)
    {
        float3 _4413 = float3(_1294, _1300, float(as_type<int>(_1180)));
        float3 _4417 = select(_4413, float3(0.0), isnan(_4413));
        float _1316 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4417.xy, uint(rint(_4417.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4417.xy, uint(rint(_4417.z)), level(0.0)).x;
        _1314 = _1316;
    }
    float _1318 = _1314;
    float _1320 = _910;
    float _1322 = _1282;
    if (_1226)
    {
        float3 _4433 = float3(_1162, _1194, float(as_type<int>(_1282)));
        float3 _4435 = select(_4433, float3(0.0), isnan(_4433));
        float _1324 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4435.xy, uint(rint(_4435.z)), _1302, level(0.0));
        _1320 = _1324;
    }
    float _1326 = _1320;
    float3 _4445 = float3(_1310, _1312, _1308);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4445, float3(0.0), isnan(_4445)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4445, float3(0.0), isnan(_4445)), level(0.0)).x;
    float3 _4454 = float3(_1310, _1312, _1308);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4454, float3(0.0), isnan(_4454)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4454, float3(0.0), isnan(_4454)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    bool _1341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1343 = isnan(0.5);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1349 = _1345 || _1347;
    if (_700)
    {
        _930 = 1.0;
    }
    float _1351 = _930;
    float _1353 = _1351;
    if (_1349)
    {
        _1288 = 1.0;
    }
    float _1355 = _1288;
    float _1357 = _1355;
    if (!_1349)
    {
        float _1359 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1365 = _1361 * 6.283185482025146484375;
        float _1367 = cos(_1365);
        float _1369 = _1363 * 0.15915493667125701904296875;
        float _1371 = _1361 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        float _1375 = 1.0 / _1367;
        float _1377 = _1369 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1373 * _1375;
        float _1383 = _1369 * 6.283185482025146484375;
        float _1385 = sin(_1383);
        float _1387 = _1379 * _1381;
        float _1389 = 1.0 / _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1391;
        float _1395 = 1.0 / _1393;
        float _1397 = _1385 * _1389;
        float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1401 = fma(_571, _1397, _1399);
        float _1403 = _1401 * _1395;
        float _1405 = precise::clamp(_1403, 0.0, 1.0);
        _1322 = _1393;
        _1357 = _1405;
    }
    float _1407 = _1322;
    float _1409 = _1357;
    float _1411 = _1407;
    if (!_700)
    {
        int _1413 = _760 << 4;
        int _1415 = _1413 + 2048;
        uint _1417 = uint(int(uint(_1415) >> uint(2)));
        uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
        int _1421 = int(_1417) & 3;
        float _1423 = (*spvDescriptorSet0.vp_c15)._m0[int(_1419)][_1421];
        int _1425 = int(_1417) + 1;
        uint _1427 = uint(int(uint(_1425) >> uint(2)));
        int _1429 = _1425 & 3;
        float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
        int _1433 = _1415 + 8;
        uint _1435 = uint(int(uint(_1433) >> uint(2)));
        uint _1437 = uint(int(uint(int(_1435)) >> uint(2)));
        int _1439 = int(_1435) & 3;
        float _1441 = (*spvDescriptorSet0.vp_c15)._m0[int(_1437)][_1439];
        int _1443 = int(_1435) + 1;
        uint _1445 = uint(int(uint(_1443) >> uint(2)));
        int _1447 = _1443 & 3;
        float _1449 = (*spvDescriptorSet0.vp_c15)._m0[int(_1445)][_1447];
        float _1451 = _541 * _1431;
        float _1453 = fma(_243, _1423, _1451);
        float _1455 = fma(_245, _1441, _1453);
        float _1457 = _1455 + _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + _1318;
        float _1465 = fma(_1463, 500.0, 1.5);
        float _1467 = exp2(_1465);
        float _1469 = 0.0 + _1467;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        _782 = as_type<float>(_1415);
        _1411 = _1441;
        _1353 = _1471;
    }
    float _1473 = _782;
    float _1475 = _1411;
    float _1477 = _1353;
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1481 = _1148 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1485 = _1150 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1152 + _1487;
    float _1491 = _1481 * _1481;
    float _1493 = fma(_1485, _1485, _1491);
    float _1495 = fma(_1489, _1489, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1485 * _1501;
    float _1505 = _1489 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1497;
    float _1523 = _1473;
    float _1525 = _1519;
    float _1527 = _1481;
    float _1529 = _1475;
    if (_1515)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (_1515)
    {
        float _1535 = rsqrt(_1511);
        _1523 = _1535;
    }
    float _1537 = _1523;
    float _1539 = _1537;
    if (_1515)
    {
        float _1541 = _1519 * _1533;
        _1525 = _1541;
    }
    float _1543 = _1525;
    if (_1515)
    {
        float _1545 = _1543 * 0.15915493667125701904296875;
        _611 = _1545;
    }
    float _1547 = _611;
    float _1549 = _1489;
    if (_1515)
    {
        float _1551 = _1547 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1559 = precise::max(0.0, _1557);
    float _1561 = _1533;
    float _1563 = _1559;
    if (_1515)
    {
        float _1565 = _1547 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = -_1501;
    float _1573 = -_1559;
    float _1575 = fma(_1481, _1571, _1573);
    if (_1515)
    {
        float _1577 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1577;
    }
    float _1579 = _1527;
    float _1581 = _1579;
    float _1583 = _1555;
    if (_1515)
    {
        float _1585 = fma(_1555, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1581 = _1585;
    }
    float _1587 = _1581;
    float _1589 = _1587;
    if (!_1515)
    {
        _1583 = _1503;
    }
    float _1591 = _1583;
    float _1593 = _1591;
    float _1595 = _1569;
    if (_1515)
    {
        float _1597 = _1569 + (-1.0);
        _1563 = _1597;
    }
    float _1599 = _1563;
    float _1601 = _1599;
    if (_1515)
    {
        float _1603 = _1537 * _1587;
        _1084 = _1603;
    }
    float _1605 = _1084;
    if (!_1515)
    {
        _1589 = _1575;
    }
    float _1607 = _1589;
    float _1609 = _1607;
    if (_1515)
    {
        float _1611 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1611;
    }
    float _1613 = _1529;
    if (_1515)
    {
        float _1615 = _1503 * _1605;
        _1593 = _1615;
    }
    float _1617 = _1593;
    if (!_1515)
    {
        _1601 = _1505;
    }
    float _1619 = _1601;
    float _1621 = _1619;
    if (_1515)
    {
        float _1623 = _1505 * _1605;
        _1621 = _1623;
    }
    float _1625 = _1621;
    if (!_1515)
    {
        _1539 = _1507;
    }
    float _1627 = _1539;
    float _1629 = _1627;
    if (_1515)
    {
        float _1631 = fma(_1575, _1569, _1613);
        _1609 = _1631;
    }
    float _1633 = _1609;
    if (_1515)
    {
        float _1635 = _1617 * _1617;
        _1629 = _1635;
    }
    float _1637 = _1629;
    if (!_1515)
    {
        _1595 = _1509;
    }
    float _1639 = _1595;
    float _1641 = _1639;
    if (_1515)
    {
        float _1643 = _1625 * _1625;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = fma(_1633, _1633, _1637);
    float _1649 = _1647 + _1645;
    float _1651 = rsqrt(_1649);
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1655 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1653);
    float _1657 = precise::clamp(_1655, 0.0, 1.0);
    float _1659 = -_1657;
    float _1661 = _1659 + 1.0;
    float _1663 = abs(_1661);
    float _1665 = log2(_1663);
    float _1667 = _1651 * _1617;
    float _1669 = _1651 * _1633;
    float _1671 = _1651 * _1625;
    float _1673 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1675 = -_1673;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1675);
    float _1679 = -_1671;
    float _1681 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1677);
    float _1683 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1685 = fma(_1681, -0.5, 0.5);
    float _1687 = fma(_1681, 0.5, 0.5);
    float _1689 = exp2(_1683);
    float _1691 = fma(_1687, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1693 = fma(_1687, _1691, -0.212114393711090087890625);
    float _1695 = _1669 + 1.0;
    float _1697 = sqrt(_1685);
    float _1699 = fma(_1687, _1693, 1.570728778839111328125);
    float _1701 = -_1669;
    float _1703 = fma(_1689, _1695, _1701);
    float _1705 = fma(_1703, 0.5, 0.5);
    float _1707 = _1697 * 0.636619746685028076171875;
    float _1709 = -_1699;
    float _1711 = fma(_1707, _1709, 1.0);
    float2 _5027 = float2(_1711, _1705);
    float3 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5027, float2(0.0), isnan(_5027)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5027, float2(0.0), isnan(_5027)), level(0.0)).xyz;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = in.m_65.x;
    float _1725 = in.m_65.y;
    float _1727 = in.m_65.z;
    float _1729 = in.m_65.w;
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1733 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1735 = -_263;
    float _1737 = _1735 + 1.0;
    out.m_72.x = _1150;
    out.m_72.y = _1148;
    out.m_72.z = _1152;
    float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1743 = _1741 != 0;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1747 = _1745 != 0;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1751 = _1749 != 0;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1755 = _1753 != 0;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1761 = _1723 > 0.5;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1765 = _367 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1767 = _1725 > 0.5;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1773 = -_371;
    int _1775 = _1761 ? as_type<int>(_1773) : as_type<int>(_371);
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1779 = _1727 > 0.5;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1783 = -_367;
    int _1785 = _1767 ? as_type<int>(_1783) : as_type<int>(_367);
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1789 = _1729 > 0.5;
    float _1791 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1793 = !_1747;
    float _1795 = _1793 ? _367 : as_type<float>(_1785);
    float _1797 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = -_367;
    int _1801 = _1789 ? as_type<int>(_1799) : as_type<int>(_367);
    float _1803 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = -_1795;
    float _1807 = _1805 + 0.5;
    bool _1809 = !_1755;
    float _1811 = _1809 ? _367 : as_type<float>(_1801);
    float _1813 = exp2(_1733);
    bool _1815 = !_1743;
    float _1817 = _1815 ? _371 : as_type<float>(_1775);
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1821 = -_371;
    int _1823 = _1779 ? as_type<int>(_1821) : as_type<int>(_371);
    out.m_76.x = _1791;
    out.m_76.y = _1797;
    out.m_76.z = _1803;
    out.m_76.w = _1763;
    float _1825 = -_1811;
    float _1827 = _1825 + 0.5;
    float _1829 = _1817 + 0.5;
    bool _1831 = !_1751;
    float _1833 = _1831 ? _371 : as_type<float>(_1823);
    float _1835 = abs(_571);
    float _1837 = log2(_1835);
    float _1839 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1843 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1845 = _1833 + 0.5;
    float _1847 = _1839 * _1787;
    float _1849 = _1841 * _1739;
    float _1851 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1853 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1855 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1857 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1859 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1861 = _1853 * _1731;
    float _1863 = _1843 * _1757;
    float _1865 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1857);
    bool _1867 = _571 <= 8000.0;
    bool _1869 = isnan(_571);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(8000.0);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_78.x = _1851;
    out.m_78.y = _1855;
    out.m_78.z = _1859;
    float _1881 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1865);
    float _1883 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_80.x = _1849;
    out.m_80.y = _1847;
    out.m_80.z = _1861;
    out.m_80.w = _1863;
    float _1885 = exp2(_1879);
    float _1887 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1881);
    float _1889 = fma(_1765, _1765, 1.0);
    out.gl_Position.x = _1266;
    out.gl_Position.y = _1286;
    out.gl_Position.z = _1887;
    out.gl_Position.w = _1238;
    float _1891 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1893 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1895 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1897 = rsqrt(_1889);
    float _1899 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1883);
    float _1901 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1893);
    float _1903 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1895);
    float _1905 = _1887 + _1238;
    float _1907 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1909 = precise::clamp(_1907, 0.0, 1.0);
    float _1911 = _1905 * 0.5;
    float _1913 = fma(_1909, -2.0, 3.0);
    float _1915 = _1909 * _1909;
    float _1917 = -_1813;
    float _1919 = _1917 + 1.0;
    out.m_82.z = _1911;
    out.m_82.w = _1238;
    float _1921 = _1915 * _1913;
    float _1923 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1925 = _1765 * _1897;
    float _1927 = -_1921;
    float _1929 = _1927 + 1.0;
    float _1931 = _1923 * _1328;
    float _1933 = -_1923;
    float _1935 = _1933 + 1.0;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1939 = _1925 * _1937;
    float _1941 = fma(_1929, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1921);
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1945 = _1925 * _1943;
    float _1947 = _1339 * _1935;
    float _1949 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1951 = _1877 * _1941;
    float _1953 = _1877;
    float _1955 = _1238;
    float _1957 = _1951;
    float _1959 = _1911;
    if (!_1226)
    {
        _1953 = 1.0;
    }
    float _1961 = _1953;
    float _1963 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1965 = _1925 * _1963;
    float _1967 = _1961;
    if (_1226)
    {
        bool _1969 = _1326 >= _1302;
        bool _1971 = isnan(_1326);
        bool _1973 = _1969 || _1971;
        bool _1975 = isnan(_1302);
        bool _1977 = _1973 || _1975;
        float _1979 = float(_1977);
        _1967 = _1979;
    }
    float _1981 = _1967;
    float _1983 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1985 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1987 = isnan(_1499);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1993 = _1989 || _1991;
    float _1995 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1939);
    float _1997 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1945);
    float _1999 = _1737 * _1983;
    float _2001 = precise::clamp(_1999, 0.0, 1.0);
    float _2003 = _1339 * _1931;
    float _2005 = _1981 * _1477;
    float _2007 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1965);
    float _2009 = -_2001;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = -_2005;
    float _2015 = fma(_2013, _2011, 1.0);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    out.m_84.x = _1995;
    out.m_84.y = _1997;
    out.m_84.z = _2007;
    float _2019 = _1995;
    if (!_1993)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2021 = _1955;
    float _2023 = _2017 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2025 = _2023;
    float _2027 = _2021;
    float _2029 = _2021;
    if (!_1993)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2031 = _1957;
    float _2033 = _2031;
    float _2035 = _2031;
    if (!_1993)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2037 = _1959;
    out.m_86.x = _2023;
    float _2039 = _2037;
    float _2041 = _2037;
    if (!_1993)
    {
        _1252 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2043 = _1252;
    float _2045 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2047 = _2043;
    float _2049 = _2043;
    if (!_1993)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2051 = _2019;
    float _2053 = _2051;
    float _2055 = _2051;
    if (!_1993)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2057 = _2025;
    float _2059 = _1721 * _1931;
    float _2061 = fma(_1717, _2003, _1333);
    float _2063 = fma(_1719, _2003, _1335);
    float _2065 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2067 = fma(_1339, _2059, _1337);
    float _2069 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_88.x = _2061;
    out.m_88.y = _2063;
    out.m_88.z = _2067;
    out.m_88.w = _1947;
    out.m_90.x = _1949;
    out.m_90.y = _2065;
    out.m_90.z = _2069;
    bool _2071 = !_1993;
    float _2073 = _2057;
    float _2075 = _2057;
    if (!_2071)
    {
        bool _2077 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2079 = isnan(_1499);
        bool _2081 = _2077 || _2079;
        bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2085 = _2081 || _2083;
        if (!_2085)
        {
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2089 = _1499 + _2087;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2093 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2091;
            float _2095 = 1.0 / _2093;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2117 = _2089 * _2095;
            float _2119 = precise::clamp(_2117, 0.0, 1.0);
            float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2125 = fma(_2119, _2099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2127 = fma(_2119, _2123, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2129 = fma(_2119, _2103, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2131 = fma(_2119, _2107, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2133 = fma(_2119, _2111, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2135 = fma(_2119, _2115, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2055 = _2125;
            _2049 = _2133;
            _2029 = _2127;
            _2041 = _2131;
            _2035 = _2129;
            _2075 = _2135;
            _2137 = true;
        }
        else
        {
            bool _2139 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2141 = isnan(_1499);
            bool _2143 = _2139 || _2141;
            bool _2145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2147 = _2143 || _2145;
            if (!_2147)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2149 = _2027;
            _2029 = _2149;
            if (!_2147)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2151 = _2053;
            _2055 = _2151;
            if (!_2147)
            {
                _2033 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2153 = _2033;
            _2035 = _2153;
            if (!_2147)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2155 = _2039;
            _2041 = _2155;
            if (!_2147)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2157 = _2047;
            _2049 = _2157;
            if (!_2147)
            {
                _2073 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2159 = _2073;
            bool _2161 = !_2147;
            _2075 = _2159;
            if (!_2161)
            {
                bool _2163 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2165 = isnan(_1499);
                bool _2167 = _2163 || _2165;
                bool _2169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2171 = _2167 || _2169;
                if (!_2171)
                {
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2175 = _1499 + _2173;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2179 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2177;
                    float _2181 = 1.0 / _2179;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2203 = _2175 * _2181;
                    float _2205 = precise::clamp(_2203, 0.0, 1.0);
                    float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2211 = fma(_2205, _2185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2213 = fma(_2205, _2209, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2215 = fma(_2205, _2189, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2217 = fma(_2205, _2193, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2219 = fma(_2205, _2197, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2221 = fma(_2205, _2201, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2055 = _2211;
                    _2049 = _2219;
                    _2029 = _2213;
                    _2041 = _2217;
                    _2035 = _2215;
                    _2075 = _2221;
                    _2137 = true;
                }
                else
                {
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2035 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2075 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2137 = false;
    float _2223 = _2055;
    float _2225 = _2049;
    float _2227 = _2029;
    float _2229 = _2041;
    float _2231 = _2035;
    float _2233 = _2075;
    float _2235 = fma(_2065, -0.5, 0.5);
    float _2237 = precise::clamp(_2235, 0.0, 1.0);
    float _2239 = -_2223;
    float _2241 = _2239 + _2225;
    float _2243 = _2045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = -_2227;
    float _2247 = _2245 + _2229;
    out.m_92.x = 0.0;
    float _2249 = fma(_2237, _2241, _2223);
    float _2251 = fma(_2237, _2247, _2227);
    out.m_59.x = _2243;
    float _2253 = -_2231;
    float _2255 = _2253 + _2233;
    float _2257 = _2249 * 0.586610972881317138671875;
    bool _2259 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2261 = fma(_2237, _2255, _2231);
    float _2263 = fma(_2251, 0.298911988735198974609375, _2257);
    bool _2265 = _1409 > 0.0;
    bool _2267 = isnan(_1409);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan(0.0);
    bool _2273 = _2269 || _2271;
    float _2275 = fma(_2261, 0.114477999508380889892578125, _2263);
    float _2277 = -_2275;
    float _2279 = _2251 + _2277;
    float _2281 = -_2275;
    float _2283 = _2249 + _2281;
    float _2285 = -_2275;
    float _2287 = _2261 + _2285;
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    float _2291 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    float _2293 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    bool _2295 = !_2259;
    if (!_2295)
    {
        float _2297 = -_1148;
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2301 = -_1150;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2305 = -_1152;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2309 = _2299 * _2299;
        float _2311 = fma(_2303, _2303, _2309);
        float _2313 = fma(_2307, _2307, _2311);
        float _2315 = sqrt(_2313);
        float _2317 = rsqrt(_2313);
        float _2319 = -_2315;
        float _2321 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2323 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = _2303 * _2317;
        float _2329 = _2299 * _2317;
        float _2331 = abs(_2325);
        float _2333 = log2(_2331);
        float _2335 = _2307 * _2317;
        float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2339 = _2065 * _2329;
        float _2341 = -_2329;
        float _2343 = -_2337;
        float _2345 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2343);
        float _2347 = fma(_1949, _2327, _2339);
        float _2349 = -_2335;
        float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2345);
        float _2353 = fma(_2069, _2335, _2347);
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2359 = _2351 + _2357;
        float _2361 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        float _2367 = exp2(_2361);
        float _2369 = _2367 * _2365;
        float _2371 = _2355 * _2369;
        float _2373 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2375 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2377 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2373;
        out.m_92.y = _2375;
        out.m_92.z = _2377;
    }
    out.m_94.x = _2289;
    out.m_94.y = _2291;
    out.m_94.z = _2293;
    if (_2273)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2379;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2137 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2435 = as_type<float>(_127);
        out.gl_Position.z = _2435;
    }
    if (!_117)
    {
        return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    if (_141)
    {
        float _149 = float(_113);
        _147 = _149;
    }
    float _151 = _147;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = 0.0;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_165);
        out.gl_Position.z = _2503;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _145 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_56.x;
    float _227 = in.m_56.y;
    float _229 = in.m_56.z;
    float _231 = _227 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = _227 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _235 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[6].x, _233);
    float _239 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].z, _237);
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = _241 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = floor(_247);
    float _253 = floor(_249);
    float _255 = -_251;
    float _257 = _247 + _255;
    float _259 = -_253;
    float _261 = _249 + _259;
    float2 _2680 = float2(_257, _261);
    float _263 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2680, float2(0.0), isnan(_2680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2680, float2(0.0), isnan(_2680)), level(0.0)).x;
    float _265 = as_type<float>(int(gl_VertexIndex));
    float _267 = _227 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _223 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[5].x, _267);
    float _287 = 1.0 / _275;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _223 + _289;
    bool _293 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _295 = isnan(_223);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].z, _285);
    bool _307 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_223);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _305 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _321 = 1.0 / _279;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = _223 + _323;
    float _327 = -_317;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _283;
    float _333 = _271 * _287;
    bool _335 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _337 = isnan(_223);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    int _347 = as_type<int>(_265) & 1;
    bool _349 = _347 != 0;
    int _351 = as_type<int>(_265) & 2;
    bool _353 = _351 != 0;
    float _355 = -_345;
    float _357 = _355 + 1.0;
    float _359 = _291 * _321;
    float _361 = -_303;
    float _363 = _361 + 1.0;
    bool _365 = !_353;
    float _367 = _365 ? (-0.5) : 0.5;
    bool _369 = !_349;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = _345 * _363;
    float _375 = _317 * _357;
    bool _377 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_223);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _325 * _331;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_223);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _393;
    float _409 = _405 * _329;
    float _411 = -_405;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _223 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = _387 * _413;
    float _429 = fma(_417, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = -_387;
    float _433 = _431 + 1.0;
    float _435 = fma(_425, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = _429 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _435 * _427;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = _421 * _407;
    float _451 = _319 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _453 = fma(_441, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _443);
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _437);
    float _459 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _451);
    float _461 = fma(_447, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = _319 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _465 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _459);
    float _467 = fma(_453, _409, _455);
    float _469 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _463);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = _465 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _469);
    float _483 = fma(_473, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = 1.0 / _475;
    float _487 = in.m_70.x;
    float _489 = in.m_70.y;
    float _491 = _481 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _493 = fma(_479, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = fma(_483, _375, _467);
    float _501 = _491 + _475;
    float _503 = fma(_461, _409, _457);
    float _505 = fma(_497, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_493, _375, _503);
    float _513 = fma(_505, _373, _499);
    float _515 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _517 = fma(_509, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _519 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _521 = _501 * _485;
    float _523 = _521 * 0.5;
    float _525 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].y, _513);
    float _527 = fma(_517, _373, _511);
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _531 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[30].w, _529);
    float _533 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].x, _527);
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _367);
    float _537 = _525 * _489;
    float _539 = 1.0 / _531;
    float _541 = _319 + _515;
    float _543 = _533 * _487;
    float _545 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _547 = _541 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _549 = _541 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _551 = _545 * _535;
    float _553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _371);
    float _555 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _547);
    float _557 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _549);
    float _559 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _561 = _551 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _563 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[126].z, _555);
    float _565 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[127].z, _557);
    float _567 = _559 * _553;
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _571 = _539 * _569;
    float _573 = _563 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _575 = _551 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _577 = _565 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[26].x, _561);
    bool _581 = _571 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _583 = trunc(_573);
    int _585 = int(_583);
    bool _587 = _571 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _589 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[24].x, _575);
    bool _591 = !_581;
    int _593 = _591 ? 0 : 1;
    float _595 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _579);
    float _597 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _589);
    float _599 = trunc(_577);
    int _601 = int(_599);
    float _603 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _607 = 2;
    int _609 = as_type<int>(_567);
    float _611 = _243;
    if (!_581)
    {
        _607 = 1;
    }
    int _613 = _607;
    float _615 = _245 + _603;
    int _617 = _613;
    if (!_587)
    {
        _617 = _593;
    }
    int _619 = _617;
    float _621 = _243 + _605;
    int _623 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _625 = _585 + _623;
    int _627 = _625 + 1;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _631 = _615 + _629;
    int _633 = _619 << 6;
    bool _635 = _627 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _637 = _631 * _631;
    int _639 = _633 + 48;
    uint _642 = uint(int(uint(_639) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.vp_c15)._m0[int(_644)][_646];
    int _650 = int(_642) + 1;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    int _654 = _650 & 3;
    float _656 = (*spvDescriptorSet0.vp_c15)._m0[int(_652)][_654];
    int _658 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _660 = _601 + _658;
    int _662 = _660 + 1;
    float _664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _666 = _621 + _664;
    int _668 = _627 | _662;
    float _670 = fma(_666, _666, _637);
    int _672 = _633 + 56;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.vp_c15)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[int(_684)][_686];
    bool _690 = _668 < 0;
    bool _692 = _690 || _635;
    float _694 = sqrt(_670);
    float _696 = _551 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _698 = _662 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _700 = _698 || _692;
    int _702 = _633 + 64;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.vp_c15)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.vp_c15)._m0[int(_714)][_716];
    float _720 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[25].x, _696);
    float _722 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _720);
    int _724 = _633 + 72;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    uint _728 = uint(int(uint(int(_726)) >> uint(2)));
    int _730 = int(_726) & 3;
    float _732 = (*spvDescriptorSet0.vp_c15)._m0[int(_728)][_730];
    int _734 = int(_726) + 1;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    int _738 = _734 & 3;
    float _740 = (*spvDescriptorSet0.vp_c15)._m0[int(_736)][_738];
    float _742 = _722 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _744 = _694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _746 = as_type<int>(_696);
    int _748 = as_type<int>(_722);
    float _750 = as_type<float>(_627);
    float _752 = _637;
    float _754 = _621;
    if (!_700)
    {
        int _756 = _662 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _758 = _756 + _627;
        _609 = _758;
    }
    int _760 = _609;
    float _762 = _319 + _742;
    int _764 = _633 + 96;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    float _782 = as_type<float>(_760);
    if (!_700)
    {
        int _784 = _760 << 2;
        _746 = _784;
    }
    int _786 = _746;
    int _788 = _786;
    if (!_700)
    {
        uint _790 = uint(int(uint(_760) >> uint(2)));
        _748 = int(_790);
    }
    int _792 = _748;
    if (!_700)
    {
        int _794 = 12 & _786;
        _788 = _794;
    }
    int _796 = _788;
    int _798 = _633 + 104;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    int _816 = 0;
    float _818 = as_type<float>(_796);
    if (!_700)
    {
        int _820 = _792 << 4;
        int _822 = _820 + _796;
        _816 = _822;
    }
    int _824 = _816;
    if (!_744)
    {
        _750 = _615;
    }
    float _826 = _750;
    float _828 = _826;
    if (!_744)
    {
        _752 = _762;
    }
    float _830 = _752;
    bool _832 = !_744;
    float _834 = _830;
    float _836 = _780;
    float _838 = _740;
    float _840 = _710;
    if (!_832)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _694 + _844;
        float _848 = rsqrt(_670);
        float _850 = _846 * _842;
        float _852 = _762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = _850 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _848 * _864;
        float _868 = _862 + (-1.0);
        float _870 = fma(_666, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _872 = fma(_631, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_762, _862, _874);
        _834 = _876;
        _754 = _870;
        _828 = _872;
        _818 = _874;
    }
    float _878 = _834;
    float _880 = _754;
    float _882 = _828;
    float _884 = _818;
    float _886 = -_319;
    float _888 = _886 + _878;
    int _890 = _633 + 80;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    float _908 = -_243;
    float _910 = _908 + _880;
    float _912 = -_245;
    float _914 = _912 + _882;
    float _916 = _888 * _888;
    float _918 = _541 * _780;
    float _920 = _541 * _718;
    float _922 = _880;
    float _924 = _878;
    float _926 = _882;
    float _928 = _914;
    float _930 = _888;
    if (!_700)
    {
        float _932 = floor(_573);
        _836 = _932;
    }
    float _934 = _836;
    float _936 = fma(_910, _910, _916);
    int _938 = _633 + 88;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    float _956 = fma(_243, _772, _918);
    float _958 = fma(_243, _710, _920);
    float _960 = fma(_914, _914, _936);
    float _962 = fma(_245, _806, _956);
    float _964 = _541 * _656;
    float _966 = sqrt(_960);
    float _968 = _884;
    if (!_700)
    {
        int _970 = _824 + 400;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        uint _974 = uint(int(uint(int(_972)) >> uint(2)));
        int _976 = int(_972) & 3;
        float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
        _968 = _978;
    }
    float _980 = _968;
    float _982 = _962 + _814;
    float _984 = fma(_243, _648, _964);
    float _986 = fma(_245, _732, _958);
    bool _988 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _990 = isnan(0.5);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _996 = _992 || _994;
    float _998 = fma(_245, _680, _984);
    float _1000 = _956;
    float _1002 = _986;
    if (!_700)
    {
        float _1004 = floor(_577);
        _1000 = _1004;
    }
    float _1006 = _1000;
    float _1008 = _986 + _740;
    float _1010 = _998 + _688;
    bool _1012 = _966 > 0.0;
    float _1014 = 1.0 / _982;
    bool _1016 = !_1012;
    if (!_1016)
    {
        float _1018 = _189 * _189;
        float _1020 = fma(_187, _187, _1018);
        float _1022 = fma(_191, _191, _1020);
        float _1024 = rsqrt(_960);
        float _1026 = sqrt(_1022);
        float _1028 = _910 * _1024;
        float _1030 = _888 * _1024;
        float _1032 = _914 * _1024;
        bool _1034 = _1026 > 0.0;
        bool _1036 = !_1034;
        _838 = _1024;
        _1002 = _1022;
        _928 = _1032;
        if (!_1036)
        {
            float _1038 = rsqrt(_1022);
            float _1040 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1042 = _189 * _1038;
            float _1044 = _187 * _1038;
            float _1046 = _191 * _1038;
            float _1048 = _1030 * _1042;
            float _1050 = fma(_1028, _1044, _1048);
            float _1052 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1054 = fma(_1032, _1046, _1050);
            float _1056 = _1054 * _1052;
            float _1058 = fma(_187, _1056, _880);
            float _1060 = fma(_189, _1056, _878);
            float _1062 = fma(_191, _1056, _882);
            _922 = _1058;
            _924 = _1060;
            _926 = _1062;
            _838 = _1056;
            _840 = _1052;
        }
    }
    float _1064 = _922;
    float _1066 = _924;
    float _1068 = _926;
    float _1070 = _838;
    float _1072 = _1002;
    float _1074 = _840;
    float _1076 = _928;
    float _1078 = _1072;
    float _1080 = _1070;
    float _1082 = _1074;
    float _1084 = _1076;
    if (_996)
    {
        _1078 = _1064;
    }
    float _1086 = _1078;
    float _1088 = _1086;
    if (_996)
    {
        _1080 = _1066;
    }
    float _1090 = _1080;
    float _1092 = _1090;
    if (_996)
    {
        _195 = _1068;
    }
    float _1094 = _195;
    float _1096 = _1094;
    if (!_996)
    {
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1100 = _319 + _1098;
        float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1104 = _243 + _1102;
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1108 = _1100 * _1100;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1112 = _245 + _1110;
        float _1114 = fma(_1104, _1104, _1108);
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1118 = fma(_1112, _1112, _1114);
        float _1120 = sqrt(_1118);
        float _1122 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1124 = -_245;
        float _1126 = _1124 + _1068;
        float _1128 = precise::min(_1120, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1130 = _1128 * _1116;
        float _1132 = -_319;
        float _1134 = _1132 + _1066;
        float _1136 = _1122 * _1130;
        float _1138 = -_243;
        float _1140 = _1138 + _1064;
        float _1142 = fma(_1134, _1136, _319);
        float _1144 = fma(_1140, _1136, _243);
        float _1146 = fma(_1126, _1136, _245);
        _1092 = _1142;
        _1088 = _1144;
        _1096 = _1146;
        _1082 = _1116;
    }
    float _1148 = _1092;
    float _1150 = _1088;
    float _1152 = _1096;
    float _1154 = _1082;
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1160 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1162 = _1010 * _1014;
    float _1164 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1156);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1160);
    float _1170 = _1154;
    if (!_700)
    {
        float _1172 = rint(_980);
        float _1174 = precise::max(_1172, 0.0);
        uint _1176 = uint(_1174);
        uint _1178 = clamp(_1176, 0u, 65535u);
        _1170 = as_type<float>(_1178);
    }
    float _1180 = _1170;
    float _1182 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    bool _1184 = _1162 >= 0.0;
    float _1186 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1166);
    float _1188 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1168);
    float _1190 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1194 = _1008 * _1014;
    bool _1196 = _1162 <= 1.0;
    bool _1198 = _1196 && _1184;
    float _1200 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1204 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1212 = _1194 >= 0.0;
    bool _1214 = _1212 && _1198;
    float _1216 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1204);
    float _1218 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1220 = -_1210;
    float _1222 = fma(_1220, _1208, 1.0);
    bool _1224 = _1194 <= 1.0;
    bool _1226 = _1224 && _1214;
    float _1228 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1230 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1218);
    float _1232 = _541 * _906;
    float _1234 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = log2(_1222);
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1240 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1242 = fma(_243, _898, _1232);
    float _1244 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1246 = fma(_245, _946, _1242);
    float _1248 = 1.0 / _1238;
    float _1250 = _1210;
    float _1252 = _1238;
    if (_1226)
    {
        float _1254 = float(_619);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1240);
    float _1260 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1244);
    float _1262 = _1246 + _954;
    float _1264 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1258);
    float _1266 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1260);
    float _1268 = _1242;
    float _1270 = _1264;
    float _1272 = _1258;
    if (_1226)
    {
        float _1274 = rint(_1256);
        float _1276 = precise::max(_1274, 0.0);
        uint _1278 = uint(_1276);
        uint _1280 = clamp(_1278, 0u, 65535u);
        _1268 = as_type<float>(_1280);
    }
    float _1282 = _1268;
    float _1284 = _1236 * 0.693147182464599609375;
    float _1286 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1264);
    float _1288 = _1284;
    if (!_700)
    {
        float _1290 = -_934;
        float _1292 = _573 + _1290;
        _1270 = _1292;
    }
    float _1294 = _1270;
    if (!_700)
    {
        float _1296 = -_1006;
        float _1298 = _577 + _1296;
        _1272 = _1298;
    }
    float _1300 = _1272;
    float _1302 = _1262 * _1014;
    float _1304 = _1266 * _1248;
    float _1306 = _1286 * _1248;
    float _1308 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1310 = fma(_1304, 0.5, 0.5);
    float _1312 = fma(_1306, -0.5, 0.5);
    float _1314 = _1180;
    if (!_700)
    {
        float3 _4413 = float3(_1294, _1300, float(as_type<int>(_1180)));
        float3 _4417 = select(_4413, float3(0.0), isnan(_4413));
        float _1316 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4417.xy, uint(rint(_4417.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4417.xy, uint(rint(_4417.z)), level(0.0)).x;
        _1314 = _1316;
    }
    float _1318 = _1314;
    float _1320 = _910;
    float _1322 = _1282;
    if (_1226)
    {
        float3 _4433 = float3(_1162, _1194, float(as_type<int>(_1282)));
        float3 _4435 = select(_4433, float3(0.0), isnan(_4433));
        float _1324 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4435.xy, uint(rint(_4435.z)), _1302, level(0.0));
        _1320 = _1324;
    }
    float _1326 = _1320;
    float3 _4445 = float3(_1310, _1312, _1308);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4445, float3(0.0), isnan(_4445)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4445, float3(0.0), isnan(_4445)), level(0.0)).x;
    float3 _4454 = float3(_1310, _1312, _1308);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4454, float3(0.0), isnan(_4454)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4454, float3(0.0), isnan(_4454)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    bool _1341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1343 = isnan(0.5);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1349 = _1345 || _1347;
    if (_700)
    {
        _930 = 1.0;
    }
    float _1351 = _930;
    float _1353 = _1351;
    if (_1349)
    {
        _1288 = 1.0;
    }
    float _1355 = _1288;
    float _1357 = _1355;
    if (!_1349)
    {
        float _1359 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1365 = _1361 * 6.283185482025146484375;
        float _1367 = cos(_1365);
        float _1369 = _1363 * 0.15915493667125701904296875;
        float _1371 = _1361 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        float _1375 = 1.0 / _1367;
        float _1377 = _1369 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1373 * _1375;
        float _1383 = _1369 * 6.283185482025146484375;
        float _1385 = sin(_1383);
        float _1387 = _1379 * _1381;
        float _1389 = 1.0 / _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1391;
        float _1395 = 1.0 / _1393;
        float _1397 = _1385 * _1389;
        float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1401 = fma(_571, _1397, _1399);
        float _1403 = _1401 * _1395;
        float _1405 = precise::clamp(_1403, 0.0, 1.0);
        _1322 = _1393;
        _1357 = _1405;
    }
    float _1407 = _1322;
    float _1409 = _1357;
    float _1411 = _1407;
    if (!_700)
    {
        int _1413 = _760 << 4;
        int _1415 = _1413 + 2048;
        uint _1417 = uint(int(uint(_1415) >> uint(2)));
        uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
        int _1421 = int(_1417) & 3;
        float _1423 = (*spvDescriptorSet0.vp_c15)._m0[int(_1419)][_1421];
        int _1425 = int(_1417) + 1;
        uint _1427 = uint(int(uint(_1425) >> uint(2)));
        int _1429 = _1425 & 3;
        float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
        int _1433 = _1415 + 8;
        uint _1435 = uint(int(uint(_1433) >> uint(2)));
        uint _1437 = uint(int(uint(int(_1435)) >> uint(2)));
        int _1439 = int(_1435) & 3;
        float _1441 = (*spvDescriptorSet0.vp_c15)._m0[int(_1437)][_1439];
        int _1443 = int(_1435) + 1;
        uint _1445 = uint(int(uint(_1443) >> uint(2)));
        int _1447 = _1443 & 3;
        float _1449 = (*spvDescriptorSet0.vp_c15)._m0[int(_1445)][_1447];
        float _1451 = _541 * _1431;
        float _1453 = fma(_243, _1423, _1451);
        float _1455 = fma(_245, _1441, _1453);
        float _1457 = _1455 + _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + _1318;
        float _1465 = fma(_1463, 500.0, 1.5);
        float _1467 = exp2(_1465);
        float _1469 = 0.0 + _1467;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        _782 = as_type<float>(_1415);
        _1411 = _1441;
        _1353 = _1471;
    }
    float _1473 = _782;
    float _1475 = _1411;
    float _1477 = _1353;
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1481 = _1148 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1485 = _1150 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1152 + _1487;
    float _1491 = _1481 * _1481;
    float _1493 = fma(_1485, _1485, _1491);
    float _1495 = fma(_1489, _1489, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1485 * _1501;
    float _1505 = _1489 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1497;
    float _1523 = _1473;
    float _1525 = _1519;
    float _1527 = _1481;
    float _1529 = _1475;
    if (_1515)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (_1515)
    {
        float _1535 = rsqrt(_1511);
        _1523 = _1535;
    }
    float _1537 = _1523;
    float _1539 = _1537;
    if (_1515)
    {
        float _1541 = _1519 * _1533;
        _1525 = _1541;
    }
    float _1543 = _1525;
    if (_1515)
    {
        float _1545 = _1543 * 0.15915493667125701904296875;
        _611 = _1545;
    }
    float _1547 = _611;
    float _1549 = _1489;
    if (_1515)
    {
        float _1551 = _1547 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1559 = precise::max(0.0, _1557);
    float _1561 = _1533;
    float _1563 = _1559;
    if (_1515)
    {
        float _1565 = _1547 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = -_1501;
    float _1573 = -_1559;
    float _1575 = fma(_1481, _1571, _1573);
    if (_1515)
    {
        float _1577 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1577;
    }
    float _1579 = _1527;
    float _1581 = _1579;
    float _1583 = _1555;
    if (_1515)
    {
        float _1585 = fma(_1555, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1581 = _1585;
    }
    float _1587 = _1581;
    float _1589 = _1587;
    if (!_1515)
    {
        _1583 = _1503;
    }
    float _1591 = _1583;
    float _1593 = _1591;
    float _1595 = _1569;
    if (_1515)
    {
        float _1597 = _1569 + (-1.0);
        _1563 = _1597;
    }
    float _1599 = _1563;
    float _1601 = _1599;
    if (_1515)
    {
        float _1603 = _1537 * _1587;
        _1084 = _1603;
    }
    float _1605 = _1084;
    if (!_1515)
    {
        _1589 = _1575;
    }
    float _1607 = _1589;
    float _1609 = _1607;
    if (_1515)
    {
        float _1611 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1611;
    }
    float _1613 = _1529;
    if (_1515)
    {
        float _1615 = _1503 * _1605;
        _1593 = _1615;
    }
    float _1617 = _1593;
    if (!_1515)
    {
        _1601 = _1505;
    }
    float _1619 = _1601;
    float _1621 = _1619;
    if (_1515)
    {
        float _1623 = _1505 * _1605;
        _1621 = _1623;
    }
    float _1625 = _1621;
    if (!_1515)
    {
        _1539 = _1507;
    }
    float _1627 = _1539;
    float _1629 = _1627;
    if (_1515)
    {
        float _1631 = fma(_1575, _1569, _1613);
        _1609 = _1631;
    }
    float _1633 = _1609;
    if (_1515)
    {
        float _1635 = _1617 * _1617;
        _1629 = _1635;
    }
    float _1637 = _1629;
    if (!_1515)
    {
        _1595 = _1509;
    }
    float _1639 = _1595;
    float _1641 = _1639;
    if (_1515)
    {
        float _1643 = _1625 * _1625;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = fma(_1633, _1633, _1637);
    float _1649 = _1647 + _1645;
    float _1651 = rsqrt(_1649);
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1655 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1653);
    float _1657 = precise::clamp(_1655, 0.0, 1.0);
    float _1659 = -_1657;
    float _1661 = _1659 + 1.0;
    float _1663 = abs(_1661);
    float _1665 = log2(_1663);
    float _1667 = _1651 * _1617;
    float _1669 = _1651 * _1633;
    float _1671 = _1651 * _1625;
    float _1673 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1675 = -_1673;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1675);
    float _1679 = -_1671;
    float _1681 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1677);
    float _1683 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1685 = fma(_1681, -0.5, 0.5);
    float _1687 = fma(_1681, 0.5, 0.5);
    float _1689 = exp2(_1683);
    float _1691 = fma(_1687, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1693 = fma(_1687, _1691, -0.212114393711090087890625);
    float _1695 = _1669 + 1.0;
    float _1697 = sqrt(_1685);
    float _1699 = fma(_1687, _1693, 1.570728778839111328125);
    float _1701 = -_1669;
    float _1703 = fma(_1689, _1695, _1701);
    float _1705 = fma(_1703, 0.5, 0.5);
    float _1707 = _1697 * 0.636619746685028076171875;
    float _1709 = -_1699;
    float _1711 = fma(_1707, _1709, 1.0);
    float2 _5027 = float2(_1711, _1705);
    float3 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5027, float2(0.0), isnan(_5027)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5027, float2(0.0), isnan(_5027)), level(0.0)).xyz;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = in.m_65.x;
    float _1725 = in.m_65.y;
    float _1727 = in.m_65.z;
    float _1729 = in.m_65.w;
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1733 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1735 = -_263;
    float _1737 = _1735 + 1.0;
    out.m_72.x = _1150;
    out.m_72.y = _1148;
    out.m_72.z = _1152;
    float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1743 = _1741 != 0;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1747 = _1745 != 0;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1751 = _1749 != 0;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1755 = _1753 != 0;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1761 = _1723 > 0.5;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1765 = _367 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1767 = _1725 > 0.5;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1773 = -_371;
    int _1775 = _1761 ? as_type<int>(_1773) : as_type<int>(_371);
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1779 = _1727 > 0.5;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1783 = -_367;
    int _1785 = _1767 ? as_type<int>(_1783) : as_type<int>(_367);
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1789 = _1729 > 0.5;
    float _1791 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1793 = !_1747;
    float _1795 = _1793 ? _367 : as_type<float>(_1785);
    float _1797 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = -_367;
    int _1801 = _1789 ? as_type<int>(_1799) : as_type<int>(_367);
    float _1803 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = -_1795;
    float _1807 = _1805 + 0.5;
    bool _1809 = !_1755;
    float _1811 = _1809 ? _367 : as_type<float>(_1801);
    float _1813 = exp2(_1733);
    bool _1815 = !_1743;
    float _1817 = _1815 ? _371 : as_type<float>(_1775);
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1821 = -_371;
    int _1823 = _1779 ? as_type<int>(_1821) : as_type<int>(_371);
    out.m_76.x = _1791;
    out.m_76.y = _1797;
    out.m_76.z = _1803;
    out.m_76.w = _1763;
    float _1825 = -_1811;
    float _1827 = _1825 + 0.5;
    float _1829 = _1817 + 0.5;
    bool _1831 = !_1751;
    float _1833 = _1831 ? _371 : as_type<float>(_1823);
    float _1835 = abs(_571);
    float _1837 = log2(_1835);
    float _1839 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1843 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1845 = _1833 + 0.5;
    float _1847 = _1839 * _1787;
    float _1849 = _1841 * _1739;
    float _1851 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1853 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1855 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1857 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1859 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1861 = _1853 * _1731;
    float _1863 = _1843 * _1757;
    float _1865 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1857);
    bool _1867 = _571 <= 8000.0;
    bool _1869 = isnan(_571);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(8000.0);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_78.x = _1851;
    out.m_78.y = _1855;
    out.m_78.z = _1859;
    float _1881 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1865);
    float _1883 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_80.x = _1849;
    out.m_80.y = _1847;
    out.m_80.z = _1861;
    out.m_80.w = _1863;
    float _1885 = exp2(_1879);
    float _1887 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1881);
    float _1889 = fma(_1765, _1765, 1.0);
    out.gl_Position.x = _1266;
    out.gl_Position.y = _1286;
    out.gl_Position.z = _1887;
    out.gl_Position.w = _1238;
    float _1891 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1893 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1895 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1897 = rsqrt(_1889);
    float _1899 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1883);
    float _1901 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1893);
    float _1903 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1895);
    float _1905 = _1887 + _1238;
    float _1907 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1909 = precise::clamp(_1907, 0.0, 1.0);
    float _1911 = _1905 * 0.5;
    float _1913 = fma(_1909, -2.0, 3.0);
    float _1915 = _1909 * _1909;
    float _1917 = -_1813;
    float _1919 = _1917 + 1.0;
    out.m_82.z = _1911;
    out.m_82.w = _1238;
    float _1921 = _1915 * _1913;
    float _1923 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1925 = _1765 * _1897;
    float _1927 = -_1921;
    float _1929 = _1927 + 1.0;
    float _1931 = _1923 * _1328;
    float _1933 = -_1923;
    float _1935 = _1933 + 1.0;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1939 = _1925 * _1937;
    float _1941 = fma(_1929, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1921);
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1945 = _1925 * _1943;
    float _1947 = _1339 * _1935;
    float _1949 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1951 = _1877 * _1941;
    float _1953 = _1877;
    float _1955 = _1238;
    float _1957 = _1951;
    float _1959 = _1911;
    if (!_1226)
    {
        _1953 = 1.0;
    }
    float _1961 = _1953;
    float _1963 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1965 = _1925 * _1963;
    float _1967 = _1961;
    if (_1226)
    {
        bool _1969 = _1326 >= _1302;
        bool _1971 = isnan(_1326);
        bool _1973 = _1969 || _1971;
        bool _1975 = isnan(_1302);
        bool _1977 = _1973 || _1975;
        float _1979 = float(_1977);
        _1967 = _1979;
    }
    float _1981 = _1967;
    float _1983 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1985 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1987 = isnan(_1499);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1993 = _1989 || _1991;
    float _1995 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1939);
    float _1997 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1945);
    float _1999 = _1737 * _1983;
    float _2001 = precise::clamp(_1999, 0.0, 1.0);
    float _2003 = _1339 * _1931;
    float _2005 = _1981 * _1477;
    float _2007 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1965);
    float _2009 = -_2001;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = -_2005;
    float _2015 = fma(_2013, _2011, 1.0);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    out.m_84.x = _1995;
    out.m_84.y = _1997;
    out.m_84.z = _2007;
    float _2019 = _1995;
    if (!_1993)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2021 = _1955;
    float _2023 = _2017 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2025 = _2023;
    float _2027 = _2021;
    float _2029 = _2021;
    if (!_1993)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2031 = _1957;
    float _2033 = _2031;
    float _2035 = _2031;
    if (!_1993)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2037 = _1959;
    out.m_86.x = _2023;
    float _2039 = _2037;
    float _2041 = _2037;
    if (!_1993)
    {
        _1252 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2043 = _1252;
    float _2045 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2047 = _2043;
    float _2049 = _2043;
    if (!_1993)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2051 = _2019;
    float _2053 = _2051;
    float _2055 = _2051;
    if (!_1993)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2057 = _2025;
    float _2059 = _1721 * _1931;
    float _2061 = fma(_1717, _2003, _1333);
    float _2063 = fma(_1719, _2003, _1335);
    float _2065 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2067 = fma(_1339, _2059, _1337);
    float _2069 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_88.x = _2061;
    out.m_88.y = _2063;
    out.m_88.z = _2067;
    out.m_88.w = _1947;
    out.m_90.x = _1949;
    out.m_90.y = _2065;
    out.m_90.z = _2069;
    bool _2071 = !_1993;
    float _2073 = _2057;
    float _2075 = _2057;
    if (!_2071)
    {
        bool _2077 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2079 = isnan(_1499);
        bool _2081 = _2077 || _2079;
        bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2085 = _2081 || _2083;
        if (!_2085)
        {
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2089 = _1499 + _2087;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2093 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2091;
            float _2095 = 1.0 / _2093;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2117 = _2089 * _2095;
            float _2119 = precise::clamp(_2117, 0.0, 1.0);
            float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2125 = fma(_2119, _2099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2127 = fma(_2119, _2123, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2129 = fma(_2119, _2103, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2131 = fma(_2119, _2107, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2133 = fma(_2119, _2111, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2135 = fma(_2119, _2115, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2055 = _2125;
            _2049 = _2133;
            _2029 = _2127;
            _2041 = _2131;
            _2035 = _2129;
            _2075 = _2135;
            _2137 = true;
        }
        else
        {
            bool _2139 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2141 = isnan(_1499);
            bool _2143 = _2139 || _2141;
            bool _2145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2147 = _2143 || _2145;
            if (!_2147)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2149 = _2027;
            _2029 = _2149;
            if (!_2147)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2151 = _2053;
            _2055 = _2151;
            if (!_2147)
            {
                _2033 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2153 = _2033;
            _2035 = _2153;
            if (!_2147)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2155 = _2039;
            _2041 = _2155;
            if (!_2147)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2157 = _2047;
            _2049 = _2157;
            if (!_2147)
            {
                _2073 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2159 = _2073;
            bool _2161 = !_2147;
            _2075 = _2159;
            if (!_2161)
            {
                bool _2163 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2165 = isnan(_1499);
                bool _2167 = _2163 || _2165;
                bool _2169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2171 = _2167 || _2169;
                if (!_2171)
                {
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2175 = _1499 + _2173;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2179 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2177;
                    float _2181 = 1.0 / _2179;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2203 = _2175 * _2181;
                    float _2205 = precise::clamp(_2203, 0.0, 1.0);
                    float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2211 = fma(_2205, _2185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2213 = fma(_2205, _2209, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2215 = fma(_2205, _2189, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2217 = fma(_2205, _2193, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2219 = fma(_2205, _2197, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2221 = fma(_2205, _2201, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2055 = _2211;
                    _2049 = _2219;
                    _2029 = _2213;
                    _2041 = _2217;
                    _2035 = _2215;
                    _2075 = _2221;
                    _2137 = true;
                }
                else
                {
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2035 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2075 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2137 = false;
    float _2223 = _2055;
    float _2225 = _2049;
    float _2227 = _2029;
    float _2229 = _2041;
    float _2231 = _2035;
    float _2233 = _2075;
    float _2235 = fma(_2065, -0.5, 0.5);
    float _2237 = precise::clamp(_2235, 0.0, 1.0);
    float _2239 = -_2223;
    float _2241 = _2239 + _2225;
    float _2243 = _2045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = -_2227;
    float _2247 = _2245 + _2229;
    out.m_92.x = 0.0;
    float _2249 = fma(_2237, _2241, _2223);
    float _2251 = fma(_2237, _2247, _2227);
    out.m_59.x = _2243;
    float _2253 = -_2231;
    float _2255 = _2253 + _2233;
    float _2257 = _2249 * 0.586610972881317138671875;
    bool _2259 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2261 = fma(_2237, _2255, _2231);
    float _2263 = fma(_2251, 0.298911988735198974609375, _2257);
    bool _2265 = _1409 > 0.0;
    bool _2267 = isnan(_1409);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan(0.0);
    bool _2273 = _2269 || _2271;
    float _2275 = fma(_2261, 0.114477999508380889892578125, _2263);
    float _2277 = -_2275;
    float _2279 = _2251 + _2277;
    float _2281 = -_2275;
    float _2283 = _2249 + _2281;
    float _2285 = -_2275;
    float _2287 = _2261 + _2285;
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    float _2291 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    float _2293 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    bool _2295 = !_2259;
    if (!_2295)
    {
        float _2297 = -_1148;
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2301 = -_1150;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2305 = -_1152;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2309 = _2299 * _2299;
        float _2311 = fma(_2303, _2303, _2309);
        float _2313 = fma(_2307, _2307, _2311);
        float _2315 = sqrt(_2313);
        float _2317 = rsqrt(_2313);
        float _2319 = -_2315;
        float _2321 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2323 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = _2303 * _2317;
        float _2329 = _2299 * _2317;
        float _2331 = abs(_2325);
        float _2333 = log2(_2331);
        float _2335 = _2307 * _2317;
        float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2339 = _2065 * _2329;
        float _2341 = -_2329;
        float _2343 = -_2337;
        float _2345 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2343);
        float _2347 = fma(_1949, _2327, _2339);
        float _2349 = -_2335;
        float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2345);
        float _2353 = fma(_2069, _2335, _2347);
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2359 = _2351 + _2357;
        float _2361 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        float _2367 = exp2(_2361);
        float _2369 = _2367 * _2365;
        float _2371 = _2355 * _2369;
        float _2373 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2375 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2377 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2373;
        out.m_92.y = _2375;
        out.m_92.z = _2377;
    }
    out.m_94.x = _2289;
    out.m_94.y = _2291;
    out.m_94.z = _2293;
    if (_2273)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2379;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2137 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2435 = as_type<float>(_127);
        out.gl_Position.z = _2435;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    if (_141)
    {
        float _149 = float(_113);
        _147 = _149;
    }
    float _151 = _147;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = 0.0;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_165);
        out.gl_Position.z = _2503;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _145 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = in.m_56.x;
    float _227 = in.m_56.y;
    float _229 = in.m_56.z;
    float _231 = _227 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _233 = _227 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _235 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[4].x, _231);
    float _237 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[6].x, _233);
    float _239 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].z, _235);
    float _241 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].z, _237);
    float _243 = _239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _245 = _241 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _247 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _249 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _251 = floor(_247);
    float _253 = floor(_249);
    float _255 = -_251;
    float _257 = _247 + _255;
    float _259 = -_253;
    float _261 = _249 + _259;
    float2 _2680 = float2(_257, _261);
    float _263 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2680, float2(0.0), isnan(_2680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2680, float2(0.0), isnan(_2680)), level(0.0)).x;
    float _265 = as_type<float>(int(gl_VertexIndex));
    float _267 = _227 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _223 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = fma(_225, (*spvDescriptorSet0.vp_c10)._m0[5].x, _267);
    float _287 = 1.0 / _275;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _223 + _289;
    bool _293 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _295 = isnan(_223);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].z, _285);
    bool _307 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_223);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _305 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _321 = 1.0 / _279;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = _223 + _323;
    float _327 = -_317;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _283;
    float _333 = _271 * _287;
    bool _335 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _337 = isnan(_223);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    int _347 = as_type<int>(_265) & 1;
    bool _349 = _347 != 0;
    int _351 = as_type<int>(_265) & 2;
    bool _353 = _351 != 0;
    float _355 = -_345;
    float _357 = _355 + 1.0;
    float _359 = _291 * _321;
    float _361 = -_303;
    float _363 = _361 + 1.0;
    bool _365 = !_353;
    float _367 = _365 ? (-0.5) : 0.5;
    bool _369 = !_349;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = _345 * _363;
    float _375 = _317 * _357;
    bool _377 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_223);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _325 * _331;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_223);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _393;
    float _409 = _405 * _329;
    float _411 = -_405;
    float _413 = _411 + 1.0;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _223 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = _387 * _413;
    float _429 = fma(_417, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = -_387;
    float _433 = _431 + 1.0;
    float _435 = fma(_425, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = _429 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _443 = _435 * _427;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = _421 * _407;
    float _451 = _319 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _453 = fma(_441, _359, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _443);
    float _457 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _437);
    float _459 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _451);
    float _461 = fma(_447, _359, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = _319 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _465 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _459);
    float _467 = fma(_453, _409, _455);
    float _469 = fma(_243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _463);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = _465 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _477;
    float _481 = fma(_245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _469);
    float _483 = fma(_473, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = 1.0 / _475;
    float _487 = in.m_70.x;
    float _489 = in.m_70.y;
    float _491 = _481 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _493 = fma(_479, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = fma(_483, _375, _467);
    float _501 = _491 + _475;
    float _503 = fma(_461, _409, _457);
    float _505 = fma(_497, _449, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _511 = fma(_493, _375, _503);
    float _513 = fma(_505, _373, _499);
    float _515 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _517 = fma(_509, _449, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _519 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _521 = _501 * _485;
    float _523 = _521 * 0.5;
    float _525 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].y, _513);
    float _527 = fma(_517, _373, _511);
    float _529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _531 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[30].w, _529);
    float _533 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[147].x, _527);
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _367);
    float _537 = _525 * _489;
    float _539 = 1.0 / _531;
    float _541 = _319 + _515;
    float _543 = _533 * _487;
    float _545 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _547 = _541 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _549 = _541 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _551 = _545 * _535;
    float _553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _371);
    float _555 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _547);
    float _557 = fma(_243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _549);
    float _559 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _561 = _551 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _563 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[126].z, _555);
    float _565 = fma(_245, (*spvDescriptorSet0.vp_c15)._m0[127].z, _557);
    float _567 = _559 * _553;
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _571 = _539 * _569;
    float _573 = _563 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _575 = _551 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _577 = _565 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[26].x, _561);
    bool _581 = _571 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _583 = trunc(_573);
    int _585 = int(_583);
    bool _587 = _571 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _589 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[24].x, _575);
    bool _591 = !_581;
    int _593 = _591 ? 0 : 1;
    float _595 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _579);
    float _597 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _589);
    float _599 = trunc(_577);
    int _601 = int(_599);
    float _603 = _595 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _607 = 2;
    int _609 = as_type<int>(_567);
    float _611 = _243;
    if (!_581)
    {
        _607 = 1;
    }
    int _613 = _607;
    float _615 = _245 + _603;
    int _617 = _613;
    if (!_587)
    {
        _617 = _593;
    }
    int _619 = _617;
    float _621 = _243 + _605;
    int _623 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _625 = _585 + _623;
    int _627 = _625 + 1;
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _631 = _615 + _629;
    int _633 = _619 << 6;
    bool _635 = _627 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _637 = _631 * _631;
    int _639 = _633 + 48;
    uint _642 = uint(int(uint(_639) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.vp_c15)._m0[int(_644)][_646];
    int _650 = int(_642) + 1;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    int _654 = _650 & 3;
    float _656 = (*spvDescriptorSet0.vp_c15)._m0[int(_652)][_654];
    int _658 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _660 = _601 + _658;
    int _662 = _660 + 1;
    float _664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _666 = _621 + _664;
    int _668 = _627 | _662;
    float _670 = fma(_666, _666, _637);
    int _672 = _633 + 56;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.vp_c15)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[int(_684)][_686];
    bool _690 = _668 < 0;
    bool _692 = _690 || _635;
    float _694 = sqrt(_670);
    float _696 = _551 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _698 = _662 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _700 = _698 || _692;
    int _702 = _633 + 64;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    uint _706 = uint(int(uint(int(_704)) >> uint(2)));
    int _708 = int(_704) & 3;
    float _710 = (*spvDescriptorSet0.vp_c15)._m0[int(_706)][_708];
    int _712 = int(_704) + 1;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    int _716 = _712 & 3;
    float _718 = (*spvDescriptorSet0.vp_c15)._m0[int(_714)][_716];
    float _720 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[25].x, _696);
    float _722 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _720);
    int _724 = _633 + 72;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    uint _728 = uint(int(uint(int(_726)) >> uint(2)));
    int _730 = int(_726) & 3;
    float _732 = (*spvDescriptorSet0.vp_c15)._m0[int(_728)][_730];
    int _734 = int(_726) + 1;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    int _738 = _734 & 3;
    float _740 = (*spvDescriptorSet0.vp_c15)._m0[int(_736)][_738];
    float _742 = _722 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _744 = _694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _746 = as_type<int>(_696);
    int _748 = as_type<int>(_722);
    float _750 = as_type<float>(_627);
    float _752 = _637;
    float _754 = _621;
    if (!_700)
    {
        int _756 = _662 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _758 = _756 + _627;
        _609 = _758;
    }
    int _760 = _609;
    float _762 = _319 + _742;
    int _764 = _633 + 96;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.vp_c15)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.vp_c15)._m0[int(_776)][_778];
    float _782 = as_type<float>(_760);
    if (!_700)
    {
        int _784 = _760 << 2;
        _746 = _784;
    }
    int _786 = _746;
    int _788 = _786;
    if (!_700)
    {
        uint _790 = uint(int(uint(_760) >> uint(2)));
        _748 = int(_790);
    }
    int _792 = _748;
    if (!_700)
    {
        int _794 = 12 & _786;
        _788 = _794;
    }
    int _796 = _788;
    int _798 = _633 + 104;
    uint _800 = uint(int(uint(_798) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c15)._m0[int(_802)][_804];
    int _808 = int(_800) + 1;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    int _812 = _808 & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    int _816 = 0;
    float _818 = as_type<float>(_796);
    if (!_700)
    {
        int _820 = _792 << 4;
        int _822 = _820 + _796;
        _816 = _822;
    }
    int _824 = _816;
    if (!_744)
    {
        _750 = _615;
    }
    float _826 = _750;
    float _828 = _826;
    if (!_744)
    {
        _752 = _762;
    }
    float _830 = _752;
    bool _832 = !_744;
    float _834 = _830;
    float _836 = _780;
    float _838 = _740;
    float _840 = _710;
    if (!_832)
    {
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _846 = _694 + _844;
        float _848 = rsqrt(_670);
        float _850 = _846 * _842;
        float _852 = _762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = _850 * 0.15915493667125701904296875;
        float _856 = _854 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = _854 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = fma(_858, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _866 = _848 * _864;
        float _868 = _862 + (-1.0);
        float _870 = fma(_666, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _872 = fma(_631, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _874 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_762, _862, _874);
        _834 = _876;
        _754 = _870;
        _828 = _872;
        _818 = _874;
    }
    float _878 = _834;
    float _880 = _754;
    float _882 = _828;
    float _884 = _818;
    float _886 = -_319;
    float _888 = _886 + _878;
    int _890 = _633 + 80;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    float _908 = -_243;
    float _910 = _908 + _880;
    float _912 = -_245;
    float _914 = _912 + _882;
    float _916 = _888 * _888;
    float _918 = _541 * _780;
    float _920 = _541 * _718;
    float _922 = _880;
    float _924 = _878;
    float _926 = _882;
    float _928 = _914;
    float _930 = _888;
    if (!_700)
    {
        float _932 = floor(_573);
        _836 = _932;
    }
    float _934 = _836;
    float _936 = fma(_910, _910, _916);
    int _938 = _633 + 88;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    float _956 = fma(_243, _772, _918);
    float _958 = fma(_243, _710, _920);
    float _960 = fma(_914, _914, _936);
    float _962 = fma(_245, _806, _956);
    float _964 = _541 * _656;
    float _966 = sqrt(_960);
    float _968 = _884;
    if (!_700)
    {
        int _970 = _824 + 400;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        uint _974 = uint(int(uint(int(_972)) >> uint(2)));
        int _976 = int(_972) & 3;
        float _978 = (*spvDescriptorSet0.vp_c15)._m0[int(_974)][_976];
        _968 = _978;
    }
    float _980 = _968;
    float _982 = _962 + _814;
    float _984 = fma(_243, _648, _964);
    float _986 = fma(_245, _732, _958);
    bool _988 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _990 = isnan(0.5);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _996 = _992 || _994;
    float _998 = fma(_245, _680, _984);
    float _1000 = _956;
    float _1002 = _986;
    if (!_700)
    {
        float _1004 = floor(_577);
        _1000 = _1004;
    }
    float _1006 = _1000;
    float _1008 = _986 + _740;
    float _1010 = _998 + _688;
    bool _1012 = _966 > 0.0;
    float _1014 = 1.0 / _982;
    bool _1016 = !_1012;
    if (!_1016)
    {
        float _1018 = _189 * _189;
        float _1020 = fma(_187, _187, _1018);
        float _1022 = fma(_191, _191, _1020);
        float _1024 = rsqrt(_960);
        float _1026 = sqrt(_1022);
        float _1028 = _910 * _1024;
        float _1030 = _888 * _1024;
        float _1032 = _914 * _1024;
        bool _1034 = _1026 > 0.0;
        bool _1036 = !_1034;
        _838 = _1024;
        _1002 = _1022;
        _928 = _1032;
        if (!_1036)
        {
            float _1038 = rsqrt(_1022);
            float _1040 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1042 = _189 * _1038;
            float _1044 = _187 * _1038;
            float _1046 = _191 * _1038;
            float _1048 = _1030 * _1042;
            float _1050 = fma(_1028, _1044, _1048);
            float _1052 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1054 = fma(_1032, _1046, _1050);
            float _1056 = _1054 * _1052;
            float _1058 = fma(_187, _1056, _880);
            float _1060 = fma(_189, _1056, _878);
            float _1062 = fma(_191, _1056, _882);
            _922 = _1058;
            _924 = _1060;
            _926 = _1062;
            _838 = _1056;
            _840 = _1052;
        }
    }
    float _1064 = _922;
    float _1066 = _924;
    float _1068 = _926;
    float _1070 = _838;
    float _1072 = _1002;
    float _1074 = _840;
    float _1076 = _928;
    float _1078 = _1072;
    float _1080 = _1070;
    float _1082 = _1074;
    float _1084 = _1076;
    if (_996)
    {
        _1078 = _1064;
    }
    float _1086 = _1078;
    float _1088 = _1086;
    if (_996)
    {
        _1080 = _1066;
    }
    float _1090 = _1080;
    float _1092 = _1090;
    if (_996)
    {
        _195 = _1068;
    }
    float _1094 = _195;
    float _1096 = _1094;
    if (!_996)
    {
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1100 = _319 + _1098;
        float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1104 = _243 + _1102;
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1108 = _1100 * _1100;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1112 = _245 + _1110;
        float _1114 = fma(_1104, _1104, _1108);
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1118 = fma(_1112, _1112, _1114);
        float _1120 = sqrt(_1118);
        float _1122 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1124 = -_245;
        float _1126 = _1124 + _1068;
        float _1128 = precise::min(_1120, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1130 = _1128 * _1116;
        float _1132 = -_319;
        float _1134 = _1132 + _1066;
        float _1136 = _1122 * _1130;
        float _1138 = -_243;
        float _1140 = _1138 + _1064;
        float _1142 = fma(_1134, _1136, _319);
        float _1144 = fma(_1140, _1136, _243);
        float _1146 = fma(_1126, _1136, _245);
        _1092 = _1142;
        _1088 = _1144;
        _1096 = _1146;
        _1082 = _1116;
    }
    float _1148 = _1092;
    float _1150 = _1088;
    float _1152 = _1096;
    float _1154 = _1082;
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1160 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1162 = _1010 * _1014;
    float _1164 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1156);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1160);
    float _1170 = _1154;
    if (!_700)
    {
        float _1172 = rint(_980);
        float _1174 = precise::max(_1172, 0.0);
        uint _1176 = uint(_1174);
        uint _1178 = clamp(_1176, 0u, 65535u);
        _1170 = as_type<float>(_1178);
    }
    float _1180 = _1170;
    float _1182 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1164);
    bool _1184 = _1162 >= 0.0;
    float _1186 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1166);
    float _1188 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1168);
    float _1190 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1194 = _1008 * _1014;
    bool _1196 = _1162 <= 1.0;
    bool _1198 = _1196 && _1184;
    float _1200 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1204 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1206 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1212 = _1194 >= 0.0;
    bool _1214 = _1212 && _1198;
    float _1216 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1204);
    float _1218 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1220 = -_1210;
    float _1222 = fma(_1220, _1208, 1.0);
    bool _1224 = _1194 <= 1.0;
    bool _1226 = _1224 && _1214;
    float _1228 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1230 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1218);
    float _1232 = _541 * _906;
    float _1234 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = log2(_1222);
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1230);
    float _1240 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1242 = fma(_243, _898, _1232);
    float _1244 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1246 = fma(_245, _946, _1242);
    float _1248 = 1.0 / _1238;
    float _1250 = _1210;
    float _1252 = _1238;
    if (_1226)
    {
        float _1254 = float(_619);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1240);
    float _1260 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1244);
    float _1262 = _1246 + _954;
    float _1264 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1258);
    float _1266 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1260);
    float _1268 = _1242;
    float _1270 = _1264;
    float _1272 = _1258;
    if (_1226)
    {
        float _1274 = rint(_1256);
        float _1276 = precise::max(_1274, 0.0);
        uint _1278 = uint(_1276);
        uint _1280 = clamp(_1278, 0u, 65535u);
        _1268 = as_type<float>(_1280);
    }
    float _1282 = _1268;
    float _1284 = _1236 * 0.693147182464599609375;
    float _1286 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1264);
    float _1288 = _1284;
    if (!_700)
    {
        float _1290 = -_934;
        float _1292 = _573 + _1290;
        _1270 = _1292;
    }
    float _1294 = _1270;
    if (!_700)
    {
        float _1296 = -_1006;
        float _1298 = _577 + _1296;
        _1272 = _1298;
    }
    float _1300 = _1272;
    float _1302 = _1262 * _1014;
    float _1304 = _1266 * _1248;
    float _1306 = _1286 * _1248;
    float _1308 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1310 = fma(_1304, 0.5, 0.5);
    float _1312 = fma(_1306, -0.5, 0.5);
    float _1314 = _1180;
    if (!_700)
    {
        float3 _4413 = float3(_1294, _1300, float(as_type<int>(_1180)));
        float3 _4417 = select(_4413, float3(0.0), isnan(_4413));
        float _1316 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4417.xy, uint(rint(_4417.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4417.xy, uint(rint(_4417.z)), level(0.0)).x;
        _1314 = _1316;
    }
    float _1318 = _1314;
    float _1320 = _910;
    float _1322 = _1282;
    if (_1226)
    {
        float3 _4433 = float3(_1162, _1194, float(as_type<int>(_1282)));
        float3 _4435 = select(_4433, float3(0.0), isnan(_4433));
        float _1324 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4435.xy, uint(rint(_4435.z)), _1302, level(0.0));
        _1320 = _1324;
    }
    float _1326 = _1320;
    float3 _4445 = float3(_1310, _1312, _1308);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4445, float3(0.0), isnan(_4445)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4445, float3(0.0), isnan(_4445)), level(0.0)).x;
    float3 _4454 = float3(_1310, _1312, _1308);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4454, float3(0.0), isnan(_4454)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4454, float3(0.0), isnan(_4454)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    bool _1341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1343 = isnan(0.5);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1349 = _1345 || _1347;
    if (_700)
    {
        _930 = 1.0;
    }
    float _1351 = _930;
    float _1353 = _1351;
    if (_1349)
    {
        _1288 = 1.0;
    }
    float _1355 = _1288;
    float _1357 = _1355;
    if (!_1349)
    {
        float _1359 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1365 = _1361 * 6.283185482025146484375;
        float _1367 = cos(_1365);
        float _1369 = _1363 * 0.15915493667125701904296875;
        float _1371 = _1361 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        float _1375 = 1.0 / _1367;
        float _1377 = _1369 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1373 * _1375;
        float _1383 = _1369 * 6.283185482025146484375;
        float _1385 = sin(_1383);
        float _1387 = _1379 * _1381;
        float _1389 = 1.0 / _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1391;
        float _1395 = 1.0 / _1393;
        float _1397 = _1385 * _1389;
        float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1401 = fma(_571, _1397, _1399);
        float _1403 = _1401 * _1395;
        float _1405 = precise::clamp(_1403, 0.0, 1.0);
        _1322 = _1393;
        _1357 = _1405;
    }
    float _1407 = _1322;
    float _1409 = _1357;
    float _1411 = _1407;
    if (!_700)
    {
        int _1413 = _760 << 4;
        int _1415 = _1413 + 2048;
        uint _1417 = uint(int(uint(_1415) >> uint(2)));
        uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
        int _1421 = int(_1417) & 3;
        float _1423 = (*spvDescriptorSet0.vp_c15)._m0[int(_1419)][_1421];
        int _1425 = int(_1417) + 1;
        uint _1427 = uint(int(uint(_1425) >> uint(2)));
        int _1429 = _1425 & 3;
        float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
        int _1433 = _1415 + 8;
        uint _1435 = uint(int(uint(_1433) >> uint(2)));
        uint _1437 = uint(int(uint(int(_1435)) >> uint(2)));
        int _1439 = int(_1435) & 3;
        float _1441 = (*spvDescriptorSet0.vp_c15)._m0[int(_1437)][_1439];
        int _1443 = int(_1435) + 1;
        uint _1445 = uint(int(uint(_1443) >> uint(2)));
        int _1447 = _1443 & 3;
        float _1449 = (*spvDescriptorSet0.vp_c15)._m0[int(_1445)][_1447];
        float _1451 = _541 * _1431;
        float _1453 = fma(_243, _1423, _1451);
        float _1455 = fma(_245, _1441, _1453);
        float _1457 = _1455 + _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + _1318;
        float _1465 = fma(_1463, 500.0, 1.5);
        float _1467 = exp2(_1465);
        float _1469 = 0.0 + _1467;
        float _1471 = precise::clamp(_1469, 0.0, 1.0);
        _782 = as_type<float>(_1415);
        _1411 = _1441;
        _1353 = _1471;
    }
    float _1473 = _782;
    float _1475 = _1411;
    float _1477 = _1353;
    float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1481 = _1148 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1485 = _1150 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1489 = _1152 + _1487;
    float _1491 = _1481 * _1481;
    float _1493 = fma(_1485, _1485, _1491);
    float _1495 = fma(_1489, _1489, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1485 * _1501;
    float _1505 = _1489 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1497;
    float _1523 = _1473;
    float _1525 = _1519;
    float _1527 = _1481;
    float _1529 = _1475;
    if (_1515)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1531;
    }
    float _1533 = _1521;
    if (_1515)
    {
        float _1535 = rsqrt(_1511);
        _1523 = _1535;
    }
    float _1537 = _1523;
    float _1539 = _1537;
    if (_1515)
    {
        float _1541 = _1519 * _1533;
        _1525 = _1541;
    }
    float _1543 = _1525;
    if (_1515)
    {
        float _1545 = _1543 * 0.15915493667125701904296875;
        _611 = _1545;
    }
    float _1547 = _611;
    float _1549 = _1489;
    if (_1515)
    {
        float _1551 = _1547 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1559 = precise::max(0.0, _1557);
    float _1561 = _1533;
    float _1563 = _1559;
    if (_1515)
    {
        float _1565 = _1547 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = -_1501;
    float _1573 = -_1559;
    float _1575 = fma(_1481, _1571, _1573);
    if (_1515)
    {
        float _1577 = _1575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1577;
    }
    float _1579 = _1527;
    float _1581 = _1579;
    float _1583 = _1555;
    if (_1515)
    {
        float _1585 = fma(_1555, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1581 = _1585;
    }
    float _1587 = _1581;
    float _1589 = _1587;
    if (!_1515)
    {
        _1583 = _1503;
    }
    float _1591 = _1583;
    float _1593 = _1591;
    float _1595 = _1569;
    if (_1515)
    {
        float _1597 = _1569 + (-1.0);
        _1563 = _1597;
    }
    float _1599 = _1563;
    float _1601 = _1599;
    if (_1515)
    {
        float _1603 = _1537 * _1587;
        _1084 = _1603;
    }
    float _1605 = _1084;
    if (!_1515)
    {
        _1589 = _1575;
    }
    float _1607 = _1589;
    float _1609 = _1607;
    if (_1515)
    {
        float _1611 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1611;
    }
    float _1613 = _1529;
    if (_1515)
    {
        float _1615 = _1503 * _1605;
        _1593 = _1615;
    }
    float _1617 = _1593;
    if (!_1515)
    {
        _1601 = _1505;
    }
    float _1619 = _1601;
    float _1621 = _1619;
    if (_1515)
    {
        float _1623 = _1505 * _1605;
        _1621 = _1623;
    }
    float _1625 = _1621;
    if (!_1515)
    {
        _1539 = _1507;
    }
    float _1627 = _1539;
    float _1629 = _1627;
    if (_1515)
    {
        float _1631 = fma(_1575, _1569, _1613);
        _1609 = _1631;
    }
    float _1633 = _1609;
    if (_1515)
    {
        float _1635 = _1617 * _1617;
        _1629 = _1635;
    }
    float _1637 = _1629;
    if (!_1515)
    {
        _1595 = _1509;
    }
    float _1639 = _1595;
    float _1641 = _1639;
    if (_1515)
    {
        float _1643 = _1625 * _1625;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = fma(_1633, _1633, _1637);
    float _1649 = _1647 + _1645;
    float _1651 = rsqrt(_1649);
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1655 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1653);
    float _1657 = precise::clamp(_1655, 0.0, 1.0);
    float _1659 = -_1657;
    float _1661 = _1659 + 1.0;
    float _1663 = abs(_1661);
    float _1665 = log2(_1663);
    float _1667 = _1651 * _1617;
    float _1669 = _1651 * _1633;
    float _1671 = _1651 * _1625;
    float _1673 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1675 = -_1673;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1675);
    float _1679 = -_1671;
    float _1681 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1677);
    float _1683 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1685 = fma(_1681, -0.5, 0.5);
    float _1687 = fma(_1681, 0.5, 0.5);
    float _1689 = exp2(_1683);
    float _1691 = fma(_1687, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1693 = fma(_1687, _1691, -0.212114393711090087890625);
    float _1695 = _1669 + 1.0;
    float _1697 = sqrt(_1685);
    float _1699 = fma(_1687, _1693, 1.570728778839111328125);
    float _1701 = -_1669;
    float _1703 = fma(_1689, _1695, _1701);
    float _1705 = fma(_1703, 0.5, 0.5);
    float _1707 = _1697 * 0.636619746685028076171875;
    float _1709 = -_1699;
    float _1711 = fma(_1707, _1709, 1.0);
    float2 _5027 = float2(_1711, _1705);
    float3 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5027, float2(0.0), isnan(_5027)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5027, float2(0.0), isnan(_5027)), level(0.0)).xyz;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = in.m_65.x;
    float _1725 = in.m_65.y;
    float _1727 = in.m_65.z;
    float _1729 = in.m_65.w;
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1733 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1735 = -_263;
    float _1737 = _1735 + 1.0;
    out.m_72.x = _1150;
    out.m_72.y = _1148;
    out.m_72.z = _1152;
    float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1743 = _1741 != 0;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1747 = _1745 != 0;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1751 = _1749 != 0;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1755 = _1753 != 0;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1761 = _1723 > 0.5;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1765 = _367 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1767 = _1725 > 0.5;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1773 = -_371;
    int _1775 = _1761 ? as_type<int>(_1773) : as_type<int>(_371);
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1779 = _1727 > 0.5;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1783 = -_367;
    int _1785 = _1767 ? as_type<int>(_1783) : as_type<int>(_367);
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1789 = _1729 > 0.5;
    float _1791 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1793 = !_1747;
    float _1795 = _1793 ? _367 : as_type<float>(_1785);
    float _1797 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = -_367;
    int _1801 = _1789 ? as_type<int>(_1799) : as_type<int>(_367);
    float _1803 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = -_1795;
    float _1807 = _1805 + 0.5;
    bool _1809 = !_1755;
    float _1811 = _1809 ? _367 : as_type<float>(_1801);
    float _1813 = exp2(_1733);
    bool _1815 = !_1743;
    float _1817 = _1815 ? _371 : as_type<float>(_1775);
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1821 = -_371;
    int _1823 = _1779 ? as_type<int>(_1821) : as_type<int>(_371);
    out.m_76.x = _1791;
    out.m_76.y = _1797;
    out.m_76.z = _1803;
    out.m_76.w = _1763;
    float _1825 = -_1811;
    float _1827 = _1825 + 0.5;
    float _1829 = _1817 + 0.5;
    bool _1831 = !_1751;
    float _1833 = _1831 ? _371 : as_type<float>(_1823);
    float _1835 = abs(_571);
    float _1837 = log2(_1835);
    float _1839 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1843 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1845 = _1833 + 0.5;
    float _1847 = _1839 * _1787;
    float _1849 = _1841 * _1739;
    float _1851 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1853 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1855 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1857 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1859 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1861 = _1853 * _1731;
    float _1863 = _1843 * _1757;
    float _1865 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1857);
    bool _1867 = _571 <= 8000.0;
    bool _1869 = isnan(_571);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(8000.0);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_78.x = _1851;
    out.m_78.y = _1855;
    out.m_78.z = _1859;
    float _1881 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1865);
    float _1883 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_80.x = _1849;
    out.m_80.y = _1847;
    out.m_80.z = _1861;
    out.m_80.w = _1863;
    float _1885 = exp2(_1879);
    float _1887 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1881);
    float _1889 = fma(_1765, _1765, 1.0);
    out.gl_Position.x = _1266;
    out.gl_Position.y = _1286;
    out.gl_Position.z = _1887;
    out.gl_Position.w = _1238;
    float _1891 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1893 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1895 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1897 = rsqrt(_1889);
    float _1899 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1883);
    float _1901 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1893);
    float _1903 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1895);
    float _1905 = _1887 + _1238;
    float _1907 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1909 = precise::clamp(_1907, 0.0, 1.0);
    float _1911 = _1905 * 0.5;
    float _1913 = fma(_1909, -2.0, 3.0);
    float _1915 = _1909 * _1909;
    float _1917 = -_1813;
    float _1919 = _1917 + 1.0;
    out.m_82.z = _1911;
    out.m_82.w = _1238;
    float _1921 = _1915 * _1913;
    float _1923 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1925 = _1765 * _1897;
    float _1927 = -_1921;
    float _1929 = _1927 + 1.0;
    float _1931 = _1923 * _1328;
    float _1933 = -_1923;
    float _1935 = _1933 + 1.0;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1939 = _1925 * _1937;
    float _1941 = fma(_1929, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1921);
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1945 = _1925 * _1943;
    float _1947 = _1339 * _1935;
    float _1949 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1951 = _1877 * _1941;
    float _1953 = _1877;
    float _1955 = _1238;
    float _1957 = _1951;
    float _1959 = _1911;
    if (!_1226)
    {
        _1953 = 1.0;
    }
    float _1961 = _1953;
    float _1963 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1965 = _1925 * _1963;
    float _1967 = _1961;
    if (_1226)
    {
        bool _1969 = _1326 >= _1302;
        bool _1971 = isnan(_1326);
        bool _1973 = _1969 || _1971;
        bool _1975 = isnan(_1302);
        bool _1977 = _1973 || _1975;
        float _1979 = float(_1977);
        _1967 = _1979;
    }
    float _1981 = _1967;
    float _1983 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1985 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1987 = isnan(_1499);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1993 = _1989 || _1991;
    float _1995 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1939);
    float _1997 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1945);
    float _1999 = _1737 * _1983;
    float _2001 = precise::clamp(_1999, 0.0, 1.0);
    float _2003 = _1339 * _1931;
    float _2005 = _1981 * _1477;
    float _2007 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1965);
    float _2009 = -_2001;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = -_2005;
    float _2015 = fma(_2013, _2011, 1.0);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    out.m_84.x = _1995;
    out.m_84.y = _1997;
    out.m_84.z = _2007;
    float _2019 = _1995;
    if (!_1993)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2021 = _1955;
    float _2023 = _2017 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2025 = _2023;
    float _2027 = _2021;
    float _2029 = _2021;
    if (!_1993)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2031 = _1957;
    float _2033 = _2031;
    float _2035 = _2031;
    if (!_1993)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2037 = _1959;
    out.m_86.x = _2023;
    float _2039 = _2037;
    float _2041 = _2037;
    if (!_1993)
    {
        _1252 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2043 = _1252;
    float _2045 = _1409 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2047 = _2043;
    float _2049 = _2043;
    if (!_1993)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2051 = _2019;
    float _2053 = _2051;
    float _2055 = _2051;
    if (!_1993)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2057 = _2025;
    float _2059 = _1721 * _1931;
    float _2061 = fma(_1717, _2003, _1333);
    float _2063 = fma(_1719, _2003, _1335);
    float _2065 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2067 = fma(_1339, _2059, _1337);
    float _2069 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_88.x = _2061;
    out.m_88.y = _2063;
    out.m_88.z = _2067;
    out.m_88.w = _1947;
    out.m_90.x = _1949;
    out.m_90.y = _2065;
    out.m_90.z = _2069;
    bool _2071 = !_1993;
    float _2073 = _2057;
    float _2075 = _2057;
    if (!_2071)
    {
        bool _2077 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2079 = isnan(_1499);
        bool _2081 = _2077 || _2079;
        bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2085 = _2081 || _2083;
        if (!_2085)
        {
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2089 = _1499 + _2087;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2093 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2091;
            float _2095 = 1.0 / _2093;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2117 = _2089 * _2095;
            float _2119 = precise::clamp(_2117, 0.0, 1.0);
            float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2125 = fma(_2119, _2099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2127 = fma(_2119, _2123, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2129 = fma(_2119, _2103, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2131 = fma(_2119, _2107, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2133 = fma(_2119, _2111, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2135 = fma(_2119, _2115, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2055 = _2125;
            _2049 = _2133;
            _2029 = _2127;
            _2041 = _2131;
            _2035 = _2129;
            _2075 = _2135;
            _2137 = true;
        }
        else
        {
            bool _2139 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2141 = isnan(_1499);
            bool _2143 = _2139 || _2141;
            bool _2145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2147 = _2143 || _2145;
            if (!_2147)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2149 = _2027;
            _2029 = _2149;
            if (!_2147)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2151 = _2053;
            _2055 = _2151;
            if (!_2147)
            {
                _2033 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2153 = _2033;
            _2035 = _2153;
            if (!_2147)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2155 = _2039;
            _2041 = _2155;
            if (!_2147)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2157 = _2047;
            _2049 = _2157;
            if (!_2147)
            {
                _2073 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2159 = _2073;
            bool _2161 = !_2147;
            _2075 = _2159;
            if (!_2161)
            {
                bool _2163 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2165 = isnan(_1499);
                bool _2167 = _2163 || _2165;
                bool _2169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2171 = _2167 || _2169;
                if (!_2171)
                {
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2175 = _1499 + _2173;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2179 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2177;
                    float _2181 = 1.0 / _2179;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2203 = _2175 * _2181;
                    float _2205 = precise::clamp(_2203, 0.0, 1.0);
                    float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2211 = fma(_2205, _2185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2213 = fma(_2205, _2209, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2215 = fma(_2205, _2189, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2217 = fma(_2205, _2193, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2219 = fma(_2205, _2197, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2221 = fma(_2205, _2201, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2055 = _2211;
                    _2049 = _2219;
                    _2029 = _2213;
                    _2041 = _2217;
                    _2035 = _2215;
                    _2075 = _2221;
                    _2137 = true;
                }
                else
                {
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2035 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2075 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2137 = false;
    float _2223 = _2055;
    float _2225 = _2049;
    float _2227 = _2029;
    float _2229 = _2041;
    float _2231 = _2035;
    float _2233 = _2075;
    float _2235 = fma(_2065, -0.5, 0.5);
    float _2237 = precise::clamp(_2235, 0.0, 1.0);
    float _2239 = -_2223;
    float _2241 = _2239 + _2225;
    float _2243 = _2045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = -_2227;
    float _2247 = _2245 + _2229;
    out.m_92.x = 0.0;
    float _2249 = fma(_2237, _2241, _2223);
    float _2251 = fma(_2237, _2247, _2227);
    out.m_59.x = _2243;
    float _2253 = -_2231;
    float _2255 = _2253 + _2233;
    float _2257 = _2249 * 0.586610972881317138671875;
    bool _2259 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2261 = fma(_2237, _2255, _2231);
    float _2263 = fma(_2251, 0.298911988735198974609375, _2257);
    bool _2265 = _1409 > 0.0;
    bool _2267 = isnan(_1409);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan(0.0);
    bool _2273 = _2269 || _2271;
    float _2275 = fma(_2261, 0.114477999508380889892578125, _2263);
    float _2277 = -_2275;
    float _2279 = _2251 + _2277;
    float _2281 = -_2275;
    float _2283 = _2249 + _2281;
    float _2285 = -_2275;
    float _2287 = _2261 + _2285;
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    float _2291 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    float _2293 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2275);
    bool _2295 = !_2259;
    if (!_2295)
    {
        float _2297 = -_1148;
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2301 = -_1150;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2305 = -_1152;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2309 = _2299 * _2299;
        float _2311 = fma(_2303, _2303, _2309);
        float _2313 = fma(_2307, _2307, _2311);
        float _2315 = sqrt(_2313);
        float _2317 = rsqrt(_2313);
        float _2319 = -_2315;
        float _2321 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2323 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = _2303 * _2317;
        float _2329 = _2299 * _2317;
        float _2331 = abs(_2325);
        float _2333 = log2(_2331);
        float _2335 = _2307 * _2317;
        float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2339 = _2065 * _2329;
        float _2341 = -_2329;
        float _2343 = -_2337;
        float _2345 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2343);
        float _2347 = fma(_1949, _2327, _2339);
        float _2349 = -_2335;
        float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2345);
        float _2353 = fma(_2069, _2335, _2347);
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2359 = _2351 + _2357;
        float _2361 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        float _2367 = exp2(_2361);
        float _2369 = _2367 * _2365;
        float _2371 = _2355 * _2369;
        float _2373 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2375 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2377 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2373;
        out.m_92.y = _2375;
        out.m_92.z = _2377;
    }
    out.m_94.x = _2289;
    out.m_94.y = _2291;
    out.m_94.z = _2293;
    if (_2273)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2379;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

