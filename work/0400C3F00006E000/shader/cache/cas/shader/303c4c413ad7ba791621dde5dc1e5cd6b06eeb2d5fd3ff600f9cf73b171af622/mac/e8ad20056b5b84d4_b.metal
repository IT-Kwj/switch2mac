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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    texture2d_array<float> vp_t_tcb_14 [[id(19)]];
    sampler vp_t_tcb_14Smplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_110 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_102 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_108 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 m_104 [[user(locn16)]];
    float4 m_106 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
    float4 m_76 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5359 = false;
    bool _4094 = false;
    bool _675 = false;
    bool _531 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_60.w;
    float _126 = in.m_62.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_67.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5654 = as_type<float>(_153);
        out.gl_Position.z = _5654;
    }
    if (!_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _155 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_126);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_131);
    bool _167 = _135 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _143;
    if (_171)
    {
        out.m_67.x = 0.0;
    }
    float _177 = _135 * _173;
    int _179 = 0;
    float _181 = _177;
    if (_171)
    {
        float _183 = _175 * 5.0;
        _179 = as_type<int>(_183);
    }
    int _185 = _179;
    out.m_65.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5717 = as_type<float>(_185);
        out.gl_Position.z = _5717;
    }
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_72.x;
    float _191 = in.m_72.y;
    float _193 = in.m_72.z;
    int _195 = as_type<int>(_187) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_187) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _205 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _207 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _209 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _211 = !_197;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _215);
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _217);
    float _229 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _231 = !_203;
    float _249;
    if (!_231)
    {
        float _233 = in.m_74.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        _249 = _177;
    }
    _251 = false;
    float _253 = _249;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _253 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _275 = 1.0 / _261;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _277;
    bool _281 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _283 = isnan(_253);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = 1.0 / _265;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _253 + _295;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _301 = 1.0 / _269;
    float _303 = _297 * _275;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = _253 + _305;
    float _309 = 1.0 / _273;
    float _311 = _257 * _293;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _253 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = _253 + _317;
    bool _321 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _323 = isnan(_253);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = 1.0 / _279;
    float _335 = _307 * _301;
    bool _337 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _339 = isnan(_253);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_347;
    float _351 = _349 + 1.0;
    float _353 = _315 * _309;
    float _355 = -_291;
    float _357 = _355 + 1.0;
    float _359 = _331 * _351;
    bool _361 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_253);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _347 * _357;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = _319 * _333;
    bool _385 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_253);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_331;
    float _399 = _397 + 1.0;
    float _401 = fma(_377, _303, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _403 = fma(_381, _303, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _405 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_253);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -_395;
    float _419 = _417 + 1.0;
    float _421 = _395 * _399;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = _371 * _419;
    float _433 = -_371;
    float _435 = _433 + 1.0;
    float _437 = -_415;
    float _439 = _437 + 1.0;
    float _441 = fma(_429, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_425, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _415 * _435;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _451;
    float _455 = _401 * _445;
    float _457 = _403 * _445;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _455);
    float _465 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _457);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = fma(_449, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_453, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _475 = fma(_441, _431, _463);
    float _477 = fma(_443, _431, _465);
    float _479 = fma(_469, _353, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_461, _353, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _487;
    float _491 = fma(_471, _421, _475);
    float _493 = fma(_473, _421, _477);
    float _495 = fma(_485, _383, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _497 = fma(_489, _383, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _499 = fma(_479, _359, _491);
    float _501 = fma(_481, _359, _493);
    float _503 = fma(_495, _373, _499);
    float _505 = fma(_497, _373, _501);
    float _507 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[148].x, _503);
    float _509 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[148].y, _505);
    bool _511 = !_299;
    float _529;
    if (!_511)
    {
        float _513 = in.m_74.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        _529 = _177;
    }
    _531 = false;
    float _533 = _529;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_533);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _561 = isnan(_533);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    bool _575 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_533);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = -_553;
    float _591 = _589 + 1.0;
    bool _593 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _595 = _569 * _591;
    float _597 = -_569;
    float _599 = _597 + 1.0;
    float _601 = 1.0 / _557;
    float _603 = _573 * _587;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _609 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _611 = _607 * _601;
    float _613 = _609 * _595;
    float _615 = -_585;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _533 + _619;
    float _623 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _613);
    float _625 = _553 * _617;
    float _627 = fma(_611, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _631 = fma(_627, _625, _623);
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[117].x, _631);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _641 = in.m_76.x;
    float _643 = in.m_76.y;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _635;
    out.m_78.y = _649;
    out.m_78.z = _645;
    out.m_78.w = _647;
    float _651 = _509 * _643;
    float _653 = _507 * _641;
    bool _655 = !_593;
    float _673;
    if (!_655)
    {
        float _657 = in.m_74.x;
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _661 = _657 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        _673 = _177;
    }
    _675 = false;
    float _677 = _673;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _681 = _677 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _695 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _697 = isnan(_677);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _685;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _713 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _715 = isnan(_677);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _727 = 1.0 / _693;
    float _729 = _689 * _707;
    bool _731 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _733 = isnan(_677);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _711;
    float _745 = -_705;
    float _747 = _745 + 1.0;
    float _749 = fma(_729, _681, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _755 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _757 = isnan(_677);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -_741;
    float _769 = _767 + 1.0;
    float _771 = _741 * _747;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _777 = 1.0 / _753;
    float _779 = -_765;
    float _781 = _779 + 1.0;
    float _783 = _723 * _769;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _785;
    float _789 = _775 * _727;
    float _791 = _705 * _781;
    float _793 = _749 * _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _797 = _677 + _795;
    float _799 = -_723;
    float _801 = _799 + 1.0;
    bool _803 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _805 = isnan(_677);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = _787 * _743;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _823 = _677 + _821;
    float _825 = fma(_789, _797, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _827 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[131].x, _793);
    float _829 = -_813;
    float _831 = _829 + 1.0;
    float _833 = _819 * _777;
    float _835 = fma(_815, _823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _839 = _677 + _837;
    float _841 = fma(_825, _771, _827);
    float _843 = _765 * _831;
    float _845 = fma(_833, _839, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _847 = fma(_835, _791, _841);
    float _849 = fma(_845, _843, _847);
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _857 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[135].x, _849);
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _859;
    out.m_80.y = _861;
    out.m_80.z = _863;
    out.m_80.w = _865;
    bool _867 = !_725;
    int _869 = as_type<int>(_793);
    float _871 = _791;
    if (!_867)
    {
        float _873 = in.m_74.x;
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _877 = _873 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _881 = _879 * _875;
        float _883 = floor(_881);
        float _885 = -_883;
        float _887 = _881 + _885;
        _181 = _887;
    }
    float _889 = _181;
    float _891 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _893 = int(_891);
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _897 = int(_895);
    float _899 = float(_893);
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _903 = int(_901);
    float _905 = float(_897);
    float _907 = 1.0 / _899;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _915 = int(_913);
    float _917 = float(uint(_903));
    int _919 = ~_903;
    int _921 = _919 + 1;
    float _923 = 1.0 / _905;
    float _925 = _907 * _135;
    if (_911)
    {
        _869 = 0;
    }
    int _927 = _869;
    float _929 = _907;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _933 = _927;
    if (_911)
    {
        float _935 = in.m_74.x;
        float _937 = in.m_74.y;
        _929 = _935;
        _931 = _937;
    }
    float _939 = _929;
    float _941 = _931;
    if (_911)
    {
        _871 = 1.0;
    }
    float _943 = _871;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _947 = int(_945);
    float _949 = float(uint(_915));
    int _951 = ~_915;
    int _953 = _951 + 1;
    float _955 = 1.0 / _917;
    float _957 = _923 * _135;
    float _959 = trunc(_925);
    int _961 = int(_959);
    float _963 = float(_947);
    float _965 = 0.0;
    float _967 = _963;
    float _969 = _939;
    float _971 = _943;
    float _973 = _941;
    if (_911)
    {
        _965 = _941;
    }
    float _975 = _965;
    float _977 = 1.0 / _949;
    int _979 = as_type<int>(_955) + (-2);
    float _981 = _955;
    float _983 = _975;
    if (_911)
    {
        _981 = _939;
    }
    float _985 = _981;
    float _987 = 0.0;
    float _989 = _985;
    if (_911)
    {
        _987 = _985;
    }
    float _991 = _987;
    float _993 = trunc(_957);
    int _995 = int(_993);
    float _997 = float(uint(_961));
    float _999 = as_type<float>(_979) * _997;
    int _1001 = as_type<int>(_977) + (-2);
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1005 = int(_1003);
    float _1007 = float(uint(_995));
    float _1009 = trunc(_999);
    float _1011 = precise::max(_1009, 0.0);
    uint _1014 = uint(_1011);
    float _1016 = as_type<float>(_1001) * _1007;
    float _1018 = _1007;
    float _1020 = _991;
    if (_911)
    {
        _1018 = 1.0;
    }
    float _1022 = _1018;
    float _1024 = trunc(_1016);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = 1.0 / _963;
    int _1032 = _921 * int(_1014);
    int _1034 = _1032 + _961;
    float _1036 = _1022;
    if (_911)
    {
        _967 = _985;
    }
    float _1038 = _967;
    float _1040 = _1038;
    if (!_911)
    {
        float _1042 = in.m_74.x;
        float _1044 = in.m_74.y;
        float _1046 = in.m_74.z;
        float _1048 = _1042 * 3.1415927410125732421875;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = _1044 * 3.1415927410125732421875;
        float _1054 = _1052 * 0.15915493667125701904296875;
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1036 = 7.345489978790283203125;
        _969 = _1042;
        _971 = 5.839270114898681640625;
        _1040 = _1046;
        _973 = _1044;
        _989 = _1044;
        _983 = _1062;
        _933 = 2;
        _1020 = _1058;
    }
    float _1064 = _1036;
    float _1066 = _969;
    float _1068 = _971;
    float _1070 = _1040;
    float _1072 = _973;
    float _1074 = _989;
    float _1076 = _983;
    int _1078 = _933;
    float _1080 = _1020;
    int _1082 = _953 * int(_1028);
    int _1084 = _1082 + _995;
    float _1086 = float(uint(_1034));
    float _1088 = _1064 * _1066;
    float _1090 = _1068 * _1070;
    int _1092 = ~_903;
    int _1094 = _1092 + 1;
    float _1096 = _1030 * _135;
    float _1098 = float(uint(_1084));
    float _1100 = as_type<float>(_979) * _1086;
    float _1102 = floor(_1088);
    float _1104 = float(uint(_1005));
    float _1106 = _173 * _135;
    float _1108 = as_type<float>(_1001) * _1098;
    int _1110 = ~_915;
    int _1112 = _1110 + 1;
    float _1114 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1116 = ~_1005;
    int _1118 = _1116 + 1;
    float _1120 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = trunc(_1100);
    float _1124 = precise::max(_1122, 0.0);
    uint _1126 = uint(_1124);
    bool _1128 = _903 == 0;
    float _1130 = trunc(_1108);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    float _1136 = -_1102;
    float _1138 = _1088 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = floor(_1090);
    int _1154 = int(_1014) + int(_1126);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1156;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1162 = 1.0 / _1104;
    int _1164 = int(_1028) + int(_1134);
    int _1166 = _1094 * _1154;
    int _1168 = _1166 + _961;
    float _1170 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1160);
    float _1172 = float(_903);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1176 = uint(_1168) >= uint(_903);
    float _1178 = trunc(_1096);
    int _1180 = int(_1178);
    int _1182 = _1112 * _1164;
    int _1184 = _1182 + _995;
    float _1186 = _1138 * _1172;
    float _1188 = float(_915);
    float _1190 = -_1152;
    float _1192 = _1090 + _1190;
    float _1194 = _1064 * _1074;
    bool _1196 = uint(_1184) >= uint(_915);
    float _1198 = in.m_74.z;
    float _1200 = trunc(_1186);
    int _1202 = int(_1200);
    float _1204 = _1192 * _1188;
    int _1206 = as_type<int>(_1162) + (-2);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1212 = _1210 != 0;
    float _1214 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1174);
    bool _1216 = !_1176;
    int _1218 = _1216 ? 0 : (-1);
    float _1220 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1222 = float(uint(_1180));
    float _1224 = trunc(_1204);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1230 = _1228 != 0;
    float _1232 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1214);
    bool _1234 = !_1212;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = as_type<float>(_1206) * _1222;
    int _1240 = ~_1154;
    int _1242 = _1240 + _1218;
    int _1244 = _1242 + 1;
    float _1246 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1170);
    float _1248 = float(_961);
    float _1250 = trunc(_1238);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    bool _1256 = !_1230;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = -_1246;
    float _1262 = _1260 + 1.0;
    int _1264 = abs(_1236);
    bool _1266 = !_1196;
    int _1268 = _1266 ? 0 : (-1);
    bool _1270 = _1248 >= _1172;
    bool _1272 = isnan(_1248);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(_1172);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = 1.0 / _1142;
    int _1284 = abs(_1258);
    int _1286 = ~_1164;
    int _1288 = _1286 + _1268;
    int _1290 = _1288 + 1;
    int _1292 = _1202 * _1264;
    int _1294 = _1292 + _961;
    bool _1296 = _1198 > 0.5;
    int _1298 = _903 * _1244;
    int _1300 = _1298 + _961;
    float _1302 = trunc(_1280);
    int _1304 = int(_1302);
    int _1306 = _1226 * _1284;
    int _1308 = _1306 + _995;
    bool _1310 = _1072 > 0.5;
    int _1312 = _915 * _1290;
    int _1314 = _1312 + _995;
    float _1316 = float(_995);
    int _1318 = _1118 * int(_1254);
    int _1320 = _1318 + _1180;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1328 = _1326 != 0;
    float _1330 = _1072 * 2.0;
    bool _1332 = _1316 >= _1188;
    bool _1334 = isnan(_1316);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1188);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_223;
    int _1346 = _1296 ? as_type<int>(_1344) : as_type<int>(_223);
    float _1348 = -_213;
    int _1350 = _1310 ? as_type<int>(_1348) : as_type<int>(_213);
    float _1352 = trunc(_1342);
    int _1354 = int(_1352);
    float _1356 = float(uint(_1320));
    bool _1358 = !_1328;
    float _1360 = _1358 ? _223 : as_type<float>(_1346);
    int _1362 = ~_1304;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    float _1368 = as_type<float>(_1206) * _1356;
    bool _1370 = !_1128;
    int _1372 = _1370 ? _1300 : (-1);
    float _1374 = _1172 * _1106;
    bool _1376 = !_1324;
    float _1378 = _1376 ? _213 : as_type<float>(_1350);
    float _1380 = floor(_1330);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1392 = _1390 != 0;
    int _1394 = _1372 * _1366;
    int _1396 = _903 + (-1);
    bool _1398 = _915 == 0;
    bool _1400 = !_1388;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = trunc(_1374);
    int _1406 = int(_1404);
    bool _1408 = !_1384;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = _1304 * _1396;
    int _1414 = _1412 + _1394;
    int _1416 = abs(_1402);
    int _1418 = abs(_1410);
    float _1420 = trunc(_1368);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1354;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    bool _1432 = !_1398;
    int _1434 = _1432 ? _1314 : (-1);
    int _1436 = _1414 * _1416;
    int _1438 = _915 + (-1);
    bool _1440 = !_1392;
    int _1442 = _1440 ? 0 : 1;
    int _1444 = _1434 * _1430;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1456 = _1454 != 0;
    int _1458 = _1406 * _1418;
    int _1460 = _1458 + _1436;
    float _1462 = _1188 * _1106;
    int _1464 = _1354 * _1438;
    int _1466 = _1464 + _1444;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1470 = _1468 != 0;
    bool _1472 = !_1452;
    int _1474 = _1472 ? 0 : 1;
    bool _1476 = !_1448;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = trunc(_1462);
    int _1482 = int(_1480);
    int _1484 = abs(_1474);
    bool _1486 = !_1470;
    int _1488 = _1486 ? 0 : 1;
    int _1490 = abs(_1442);
    int _1492 = abs(_1478);
    int _1494 = abs(_1488);
    int _1496 = int(_1254) + int(_1424);
    int _1498 = _1294 * _1490;
    int _1500 = _1498 + _1460;
    float _1502 = floor(_1194);
    int _1504 = ~_1005;
    int _1506 = _1504 + 1;
    int _1508 = _1202 * _1494;
    int _1510 = _1508 + _1500;
    int _1512 = _1466 * _1484;
    int _1514 = int(_1470);
    int _1516 = _1230 ? 2 : 0;
    int _1518 = _1514 | _1516;
    int _1520 = _1310 ? 4 : 0;
    int _1522 = _1518 | _1520;
    int _1524 = _1196 ? 8 : 0;
    int _1526 = _1522 | _1524;
    int _1528 = _1448 ? 16 : 0;
    int _1530 = _1526 | _1528;
    int _1532 = _1452 ? 32 : 0;
    int _1534 = _1530 | _1532;
    int _1536 = _1456 ? 64 : 0;
    int _1538 = _1534 | _1536;
    int _1540 = _1538 & 4;
    int _1542 = _1506 * _1496;
    int _1544 = _1542 + _1180;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1548 = _1546 != 0;
    int _1550 = _1482 * _1492;
    int _1552 = _1550 + _1512;
    float _1554 = float(uint(_1510));
    bool _1556 = !_1456;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = uint(_1544) >= uint(_1005);
    float _1562 = as_type<float>(_979) * _1554;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1566 = _1564 != 0;
    float _1568 = -_1502;
    float _1570 = _1194 + _1568;
    bool _1572 = _1540 != 0;
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    bool _1580 = !_1548;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = abs(_1558);
    bool _1586 = !_1566;
    int _1588 = _1586 ? 0 : 1;
    bool _1590 = !_1560;
    int _1592 = _1590 ? 0 : (-1);
    int _1594 = _1308 * _1584;
    int _1596 = _1594 + _1552;
    int _1598 = abs(_1582);
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1610 = _1608 != 0;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1614 = _1612 != 0;
    float _1616 = float(_1005);
    float _1618 = float(_1180);
    float _1620 = _1570 * _1616;
    bool _1622 = !_1606;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1628 = _1626 != 0;
    int _1630 = _1226 * _1598;
    int _1632 = _1630 + _1596;
    bool _1634 = _1618 >= _1616;
    bool _1636 = isnan(_1618);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(_1616);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = trunc(_1620);
    int _1648 = int(_1646);
    int _1650 = ~_903;
    int _1652 = _1650 + 1;
    float _1654 = _1616 * _1106;
    int _1656 = ~_1496;
    int _1658 = _1656 + _1592;
    int _1660 = _1658 + 1;
    float _1662 = float(uint(_1632));
    float _1664 = trunc(_1644);
    int _1666 = int(_1664);
    bool _1668 = !_1602;
    float _1670 = _1668 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1672 = _1652 * int(_1578);
    int _1674 = _1672 + _1510;
    float _1676 = _1562;
    float _1678 = _1670;
    if (_1628)
    {
        float _1680 = in.m_74.w;
        _1676 = _1680;
    }
    float _1682 = _1676;
    bool _1684 = _1005 == 0;
    float _1686 = as_type<float>(_1001) * _1662;
    int _1688 = abs(_1588);
    float _1690 = float(uint(_1674));
    int _1692 = _1005 * _1660;
    int _1694 = _1692 + _1180;
    float _1696 = trunc(_1686);
    float _1698 = precise::max(_1696, 0.0);
    uint _1700 = uint(_1698);
    int _1702 = _1005 + (-1);
    float _1704 = as_type<float>(_979) * _1690;
    bool _1706 = !_1684;
    int _1708 = _1706 ? _1694 : (-1);
    int _1710 = ~_1666;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = abs(_1624);
    float _1718 = trunc(_1704);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1708 * _1714;
    int _1726 = ~_915;
    int _1728 = _1726 + 1;
    int _1730 = _1666 * _1702;
    int _1732 = _1730 + _1724;
    bool _1734 = !_1610;
    int _1736 = _1734 ? 0 : 1;
    float _1738 = trunc(_1654);
    int _1740 = int(_1738);
    int _1742 = _1648 * _1688;
    int _1744 = _1742 + _1180;
    int _1746 = _1732 * _1716;
    float _1748 = as_type<float>(_1732);
    if (_1628)
    {
        float _1750 = _1682 * 3.1415927410125732421875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = abs(as_type<int>(_1670));
    int _1756 = _1728 * int(_1700);
    int _1758 = _1756 + _1632;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1762 = _1760 != 0;
    if (_1628)
    {
        float _1764 = _1752 * 0.15915493667125701904296875;
        _1678 = _1764;
    }
    float _1766 = _1678;
    int _1768 = ~_903;
    int _1770 = _1768 + 1;
    int _1772 = int(_1578) + int(_1722);
    float _1774 = _1766;
    if (_1628)
    {
        float _1776 = _1766 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        _1774 = _1778;
    }
    float _1780 = _1774;
    float _1782 = float(uint(_1758));
    int _1784 = _1740 * _1754;
    int _1786 = _1784 + _1746;
    bool _1788 = !_1614;
    int _1790 = _1788 ? 0 : 1;
    int _1792 = _1770 * _1772;
    int _1794 = _1792 + _1510;
    int _1796 = abs(_1736);
    float _1798 = as_type<float>(_1001) * _1782;
    int _1800 = abs(_1790);
    float _1802 = as_type<float>(_1740);
    if (_1762)
    {
        float _1804 = in.m_74.x;
        _1802 = _1804;
    }
    float _1806 = _1802;
    bool _1808 = uint(_1794) >= uint(_903);
    float _1810 = trunc(_1798);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    float _1816 = float(uint(_1294));
    int _1818 = _1744 * _1796;
    int _1820 = _1818 + _1786;
    bool _1822 = !_1808;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = as_type<float>(_979) * _1816;
    bool _1828 = _903 == 0;
    int _1830 = _1648 * _1800;
    int _1832 = _1830 + _1820;
    int _1834 = ~_1772;
    int _1836 = _1834 + _1824;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1826);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    bool _1846 = _1808;
    float _1848 = _1780;
    if (_1628)
    {
        bool _1850 = _1780 > 0.5;
        _1846 = _1850;
    }
    bool _1852 = _1846;
    float _1854 = float(uint(_1832));
    int _1856 = _903 * _1838;
    int _1858 = _1856 + _1510;
    int _1860 = int(_1700) + int(_1814);
    int _1862 = ~_903;
    int _1864 = _1862 + 1;
    float _1866 = as_type<float>(_1206) * _1854;
    float _1868 = float(uint(_1308));
    if (_1762)
    {
        float _1870 = _1806 * 3.1415927410125732421875;
        _1848 = _1870;
    }
    float _1872 = _1848;
    bool _1874 = !_1828;
    int _1876 = _1874 ? _1858 : (-1);
    float _1878 = trunc(_1866);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    float _1884 = 0.0;
    float _1886 = _1872;
    if (!_1628)
    {
        _1884 = _213;
    }
    float _1888 = _1884;
    float _1890 = as_type<float>(_1001) * _1868;
    float _1892 = _1888;
    if (_1628)
    {
        float _1894 = -_213;
        float _1896 = _1852 ? _1894 : _213;
        _1892 = _1896;
    }
    float _1898 = _1892;
    int _1900 = _1864 * int(_1844);
    int _1902 = _1900 + _1294;
    int _1904 = ~_915;
    int _1906 = _1904 + 1;
    if (_1762)
    {
        float _1908 = _1872 * 0.15915493667125701904296875;
        _1886 = _1908;
    }
    float _1910 = _1886;
    int _1912 = _1876 & 3;
    bool _1914 = _1912 != 0;
    float _1916 = trunc(_1890);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = _1876 & 3;
    bool _1924 = _1922 != 0;
    float _1926 = float(uint(_1902));
    int _1928 = _1914 ? 0 : 1;
    float _1930 = as_type<float>(_979) * _1926;
    bool _1932 = uint(_1922) > 1u;
    float _1934 = as_type<float>(_979);
    if (_1762)
    {
        float _1936 = _1910 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        _1934 = _1938;
    }
    float _1940 = _1934;
    int _1942 = ~_1005;
    int _1944 = _1942 + 1;
    int _1946 = _1906 * _1860;
    int _1948 = _1946 + _1632;
    int _1950 = ~_1928;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    int _1956 = ~_915;
    int _1958 = _1956 + 1;
    int _1960 = _1944 * int(_1882);
    int _1962 = _1960 + _1832;
    bool _1964 = uint(_1948) >= uint(_915);
    float _1966 = trunc(_1930);
    float _1968 = precise::max(_1966, 0.0);
    uint _1970 = uint(_1968);
    float _1972 = -_223;
    int _1974 = _1572 ? as_type<int>(_1972) : as_type<int>(_223);
    float _1976 = float(uint(_1962));
    int _1978 = _1954;
    if (!_1932)
    {
        int _1980 = ~_1928;
        int _1982 = _1980 + 1;
        _1978 = _1982;
    }
    int _1984 = _1978;
    int _1986 = _1958 * int(_1920);
    int _1988 = _1986 + _1308;
    bool _1990 = !_1964;
    int _1992 = _1990 ? 0 : (-1);
    bool _1994 = _1922 != 3;
    bool _1996 = uint(_1922) >= 2u;
    int _1998 = ~_1860;
    int _2000 = _1998 + _1992;
    int _2002 = _2000 + 1;
    float _2004 = as_type<float>(_1206) * _1976;
    int _2006 = _1996 ? 0 : 1;
    bool _2008 = _1996;
    if (_1762)
    {
        bool _2010 = _1940 > 0.5;
        _2008 = _2010;
    }
    bool _2012 = _2008;
    int _2014 = _915 * _2002;
    int _2016 = _2014 + _1632;
    float _2018 = trunc(_2004);
    float _2020 = precise::max(_2018, 0.0);
    uint _2022 = uint(_2020);
    bool _2024 = _915 == 0;
    int _2026 = ~_2006;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = _2030;
    if (_1994)
    {
        int _2034 = ~_2006;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    bool _2040 = !_2024;
    int _2042 = _2040 ? _2016 : (-1);
    float _2044 = 0.0;
    if (!_1762)
    {
        _2044 = _223;
    }
    float _2046 = _2044;
    float _2048 = float(uint(_1988));
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2052 = _2050 != 0;
    float _2054 = _2046;
    if (_1762)
    {
        float _2056 = -_223;
        float _2058 = _2012 ? _2056 : _223;
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = as_type<float>(_1001) * _2048;
    int _2064 = _2042 & 3;
    bool _2066 = _2064 != 0;
    bool _2068 = !_2052;
    float _2070 = _2068 ? _223 : as_type<float>(_1974);
    float _2072 = _2060 + (-0.5);
    bool _2074 = uint(_2064) > 1u;
    float _2076 = trunc(_2062);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    int _2082 = ~_1005;
    int _2084 = _2082 + 1;
    int _2086 = _2042 & 3;
    bool _2088 = _2086 != 0;
    int _2090 = int(_1882) + int(_2022);
    int _2092 = int(_1844) + int(_1970);
    int _2094 = ~_903;
    int _2096 = _2094 + 1;
    int _2098 = _2084 * _2090;
    int _2100 = _2098 + _1832;
    int _2102 = _2088 ? 0 : 1;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2106 = _2104 != 0;
    int _2108 = _2096 * _2092;
    int _2110 = _2108 + _1294;
    float _2112 = float(uint(_1744));
    bool _2114 = !_2106;
    int _2116 = _2114 ? 0 : 1;
    int _2118 = ~_2102;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    bool _2124 = uint(_2100) >= uint(_1005);
    int _2126 = _2122;
    if (!_2074)
    {
        int _2128 = ~_2102;
        int _2130 = _2128 + 1;
        _2126 = _2130;
    }
    int _2132 = _2126;
    float _2134 = as_type<float>(_1206) * _2112;
    bool _2136 = uint(_2110) >= uint(_903);
    bool _2138 = !_2124;
    int _2140 = _2138 ? 0 : (-1);
    float _2142 = trunc(_2134);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    bool _2148 = _2064 != 3;
    bool _2150 = !_2136;
    int _2152 = _2150 ? 0 : (-1);
    bool _2154 = uint(_2064) >= 2u;
    int _2156 = ~_2090;
    int _2158 = _2156 + _2140;
    int _2160 = _2158 + 1;
    int _2162 = ~_915;
    int _2164 = _2162 + 1;
    int _2166 = int(_1920) + int(_2080);
    int _2168 = _1005 * _2160;
    int _2170 = _2168 + _1832;
    int _2172 = _2154 ? 0 : 1;
    int _2174 = ~_1005;
    int _2176 = _2174 + 1;
    int _2178 = _2164 * _2166;
    int _2180 = _2178 + _1308;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2184 = _2182 != 0;
    int _2186 = ~_2172;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2190;
    if (_2148)
    {
        int _2194 = ~_2172;
        int _2196 = _2194 + 1;
        _2192 = _2196;
    }
    int _2198 = _2192;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2202 = _2200 != 0;
    bool _2204 = !_2184;
    int _2206 = _2204 ? 0 : 1;
    bool _2208 = uint(_2180) >= uint(_915);
    int _2210 = _2176 * int(_2146);
    int _2212 = _2210 + _1744;
    bool _2214 = !_1684;
    int _2216 = _2214 ? _2170 : (-1);
    bool _2218 = !_2202;
    int _2220 = _2218 ? 0 : 1;
    bool _2222 = !_2208;
    int _2224 = _2222 ? 0 : (-1);
    int _2226 = _2216 & 3;
    bool _2228 = _2226 != 0;
    int _2230 = _2216 & 3;
    bool _2232 = _2230 != 0;
    float _2234 = float(uint(_2212));
    int _2236 = _2228 ? 0 : 1;
    bool _2238 = uint(_2230) > 1u;
    float _2240 = as_type<float>(_1206) * _2234;
    int _2242 = ~_2236;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    float _2248 = trunc(_2240);
    float _2250 = precise::max(_2248, 0.0);
    uint _2252 = uint(_2250);
    int _2254 = ~_2166;
    int _2256 = _2254 + _2224;
    int _2258 = _2256 + 1;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2262 = _2260 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2268 = abs(_2206);
    float _2270 = 1.0 / _2262;
    int _2272 = _2246;
    float _2274 = as_type<float>(_2198);
    if (!_2238)
    {
        int _2276 = ~_2236;
        int _2278 = _2276 + 1;
        _2272 = _2278;
    }
    int _2280 = _2272;
    int _2282 = _915 * _2258;
    int _2284 = _2282 + _1308;
    bool _2286 = uint(_2230) >= 2u;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2290 = _889 + _2288;
    bool _2292 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2294 = isnan(_889);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2300 = _2296 || _2298;
    float _2302 = float(_2300);
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2306 = _2286 ? 0 : 1;
    float _2308 = 1.0 / _2266;
    bool _2310 = _2230 != 3;
    float _2312 = -_2302;
    float _2314 = _2312 + 1.0;
    int _2316 = int(_2146) + int(_2252);
    float _2318 = fma(_1220, -2.0, _2304);
    int _2320 = ~_2306;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _1944 * _2316;
    int _2328 = _2326 + _1744;
    float _2330 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2318);
    int _2332 = ~_2092;
    int _2334 = _2332 + _2152;
    int _2336 = _2334 + 1;
    float _2338 = -_2072;
    float _2340 = -_2330;
    float _2342 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2340);
    int _2344 = _2324;
    if (_2310)
    {
        int _2346 = ~_2306;
        int _2348 = _2346 + 1;
        _2344 = _2348;
    }
    int _2350 = _2344;
    bool _2352 = uint(_2328) >= uint(_1005);
    float _2354 = in.m_60.x;
    float _2356 = in.m_60.y;
    float _2358 = in.m_60.z;
    int _2360 = _903 * _2336;
    int _2362 = _2360 + _1294;
    int _2364 = abs(_1984);
    bool _2366 = !_2352;
    int _2368 = _2366 ? 0 : (-1);
    bool _2370 = _1066 > 0.5;
    int _2372 = ~_2316;
    int _2374 = _2372 + _2368;
    int _2376 = _2374 + 1;
    float _2378 = -_213;
    int _2380 = _2370 ? as_type<int>(_2378) : as_type<int>(_213);
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2384 = _2382 != 0;
    float _2386 = _1066 * 2.0;
    int _2388 = _1005 * _2376;
    int _2390 = _2388 + _1744;
    int _2392 = ~_2364;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    bool _2398 = !_2384;
    float _2400 = _2398 ? _213 : as_type<float>(_2380);
    float _2402 = floor(_2386);
    bool _2404 = _1078 != 2;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2410 = abs(_2280);
    float _2412 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2414 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2416 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2418 = 1.0 / _2408;
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2412);
    float _2422 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2414);
    float _2424 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2416);
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2428 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2430 = 0.0;
    if (_2404)
    {
        _2430 = _1066;
    }
    float _2432 = _2430;
    float _2434 = 1.0 / _2428;
    float _2436 = 0.0;
    float _2438 = _2432;
    if (_2404)
    {
        _2436 = _1072;
    }
    float _2440 = _2436;
    float _2442 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2444 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2442;
    float _2446 = _2440;
    if (!_2404)
    {
        _2438 = _1198;
    }
    float _2448 = _2438;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2452 = _2450 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (!_2404)
    {
        _2446 = _1066;
    }
    float _2454 = _2446;
    float _2456 = _2444 * _2270;
    bool _2458 = _2402 >= 0.0;
    bool _2460 = isnan(_2402);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.0);
    bool _2466 = _2462 || _2464;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2468;
    float _2472 = _2452 * _2308;
    int _2474 = _2466 ? 0 : 1;
    float _2476 = _2470 * _1282;
    bool _2478 = _2402 > 0.0;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2484 = ~_2474;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = _1146 * _2434;
    float _2492 = fma(_2476, _2290, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2496 = _889 + _2494;
    float _2498 = 1.0 / _2482;
    float _2500 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2506 = _1198 * 2.0;
    float _2508 = fma(_2490, _2496, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2512 = _889 + _2510;
    int _2514 = _2488;
    if (!_2478)
    {
        int _2516 = ~_2474;
        int _2518 = _2516 + 1;
        _2514 = _2518;
    }
    int _2520 = _2514;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2526 = _1380 >= 0.0;
    bool _2528 = isnan(_1380);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    float _2536 = floor(_2506);
    int _2538 = ~_2410;
    int _2540 = _2538 + 1;
    int _2542 = _2540 + 1;
    float _2544 = _2524 * _2418;
    int _2546 = _2534 ? 0 : 1;
    bool _2548 = _1380 > 0.0;
    bool _2550 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2552 = isnan(_889);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2558);
    float _2562 = 1.0 / _2504;
    float _2564 = _1150 * _2498;
    int _2566 = ~_2546;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = -_2560;
    float _2574 = _2572 + 1.0;
    bool _2576 = !_2232;
    int _2578 = _2576 ? 0 : 1;
    int _2580 = abs(_2350);
    bool _2582 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2584 = isnan(_889);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    int _2594 = _2570;
    if (!_2548)
    {
        int _2596 = ~_2546;
        int _2598 = _2596 + 1;
        _2594 = _2598;
    }
    int _2600 = _2594;
    bool _2602 = !_2024;
    int _2604 = _2602 ? _2284 : (-1);
    float _2606 = _2592 * _2574;
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2610 = _2608 != 0;
    int _2612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2614 = _2612 != 0;
    int _2616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2618 = _2616 != 0;
    float _2620 = -_2592;
    float _2622 = _2620 + 1.0;
    bool _2624 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2626 = isnan(_889);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = _1158 * _2562;
    bool _2638 = !_1924;
    int _2640 = _2638 ? 0 : 1;
    float _2642 = _2302 * _2622;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2646 = _889 + _2644;
    bool _2648 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2650 = isnan(_889);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2656 = _2652 || _2654;
    float _2658 = float(_2656);
    float _2660 = _2634 * _2314;
    bool _2662 = _2536 >= 0.0;
    bool _2664 = isnan(_2536);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = -_2634;
    float _2674 = _2672 + 1.0;
    float _2676 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2420);
    float _2678 = fma(_2456, _2646, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2680 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2424);
    bool _2682 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2684 = isnan(_889);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -_2658;
    float _2696 = _2694 + 1.0;
    int _2698 = _2670 ? 0 : 1;
    float _2700 = fma(_2636, _2512, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2702 = _2536 > 0.0;
    float _2704 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2422);
    bool _2706 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2708 = isnan(_889);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2692 * _2696;
    float _2720 = -_2692;
    float _2722 = _2720 + 1.0;
    float _2724 = _2658 * _2674;
    bool _2726 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2728 = isnan(_889);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = -_2716;
    float _2740 = _2738 + 1.0;
    float _2742 = _2716 * _2722;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2746 = _889 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2750 = _889 + _2748;
    float _2752 = _2736 * _2740;
    float _2754 = -_2736;
    float _2756 = _2754 + 1.0;
    float _2758 = fma(_2472, _2746, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2762 = _889 + _2760;
    float _2764 = _2678 * _2752;
    int _2766 = _2042 >> 31;
    float _2768 = fma(_2564, _2750, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2770 = fma(_2544, _2762, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2772 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2764);
    int _2774 = _2766 & 3;
    float _2776 = _1072 + _1066;
    int _2778 = ~_2698;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    float _2784 = _1072 + (-0.5);
    int _2786 = _2782;
    if (!_2702)
    {
        int _2788 = ~_2698;
        int _2790 = _2788 + 1;
        _2786 = _2790;
    }
    int _2792 = _2786;
    float _2794 = fma(_2758, _2742, _2772);
    int _2796 = _2042 + _2774;
    float _2798 = _1066 + (-0.5);
    float _2800 = _2680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2802 = _2704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2808 = _2796 >> 2;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2812 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2804);
    float _2814 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2806);
    float _2816 = _1066 + _1198;
    float _2818 = -_2810;
    float _2820 = fma(_1114, 2.0, _2818);
    float _2822 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2824 = _1072 + _1198;
    int _2826 = _2808 << 4;
    int _2828 = _2826 + 656;
    float _2830 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2822);
    float _2832 = fma(_2492, _2718, _2794);
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    uint _2836 = uint(int(uint(_2828) >> uint(2)));
    uint _2838 = uint(int(uint(int(_2836)) >> uint(2)));
    int _2840 = int(_2836) & 3;
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[int(_2838)][_2840];
    int _2844 = int(_2836) + 1;
    uint _2846 = uint(int(uint(_2844) >> uint(2)));
    int _2848 = _2844 & 3;
    float _2850 = (*spvDescriptorSet0.vp_c9)._m0[int(_2846)][_2848];
    float _2852 = fma(_2770, _2724, _2832);
    float _2854 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2834);
    float _2856 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2858 = _2776 + (-1.0);
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2864 = _2800 + _2862;
    float _2866 = -_1208;
    float _2868 = fma(_2856, 2.0, _2866);
    float _2870 = _2676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2872 = fma(_1120, -2.0, _2860);
    int _2874 = _2828 + 8;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2894 = _2802 + _2892;
    float _2896 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2898 = _2870 + _2896;
    float _2900 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2902 = _1898 + 0.5;
    float _2904 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2906 = -_135;
    float _2908 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2868);
    float _2910 = fma(_2508, _2660, _2852);
    float _2912 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2872);
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2904);
    bool _2916 = !_2066;
    int _2918 = _2916 ? 0 : 1;
    float _2920 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2908);
    bool _2922 = _2064 != 3;
    float _2924 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2914);
    int _2926 = abs(_2132);
    float _2928 = -_135;
    float _2930 = fma(_2928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2820);
    bool _2932 = !_2922;
    int _2934 = _2932 ? 0 : (-1);
    float _2936 = _2400 + 0.5;
    float _2938 = _2070 + (-0.5);
    bool _2940 = _2924 >= 0.0;
    float _2942 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2930);
    int _2944 = ~_2926;
    int _2946 = _2944 + 1;
    int _2948 = _2946 + 1;
    float _2950 = fma(_2768, _2642, _2910);
    int _2952 = abs(_2918);
    float _2954 = -_2938;
    float _2956 = -_2912;
    float _2958 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2956);
    int _2960 = abs(_2198);
    float _2962 = _2448 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2964 = ~_2952;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2854);
    int _2972 = ~_2960;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2812);
    float _2980 = -_2970;
    float _2982 = _2980 + 1.0;
    if (_2940)
    {
        _2274 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2984 = _2274;
    float _2986 = -_2978;
    float _2988 = _2986 + 1.0;
    bool _2990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2992 = isnan(0.0);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2998 = _2994 || _2996;
    int _3000 = _2948 * as_type<int>(_2850);
    float _3002 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3004 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3006 = int(_3004);
    int _3008 = _2968 * as_type<int>(_2842);
    int _3010 = _3008 + _3000;
    int _3012 = as_type<int>(_2984);
    if (_2940)
    {
        float _3014 = _2984 * 5.0;
        _3012 = as_type<int>(_3014);
    }
    int _3016 = _3012;
    int _3018 = abs(_2934);
    float _3020 = -_3002;
    float _3022 = fma(_2962, 2.0, _3020);
    float _3024 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2814);
    if (_2940)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9851 = as_type<float>(_3016);
        out.gl_Position.z = _9851;
    }
    int _3026 = _2976 * as_type<int>(_2882);
    int _3028 = _3026 + _3010;
    float _3030 = -_1232;
    float _3032 = _3030 + 1.0;
    float _3034 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3036 = log2(_3034);
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3040 = !_2610;
    int _3042 = _3040 ? 0 : 1;
    float _3044 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2830);
    float _3046 = -_135;
    float _3048 = fma(_3046, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3022);
    float _3050 = fma(_2500, -2.0, _3038);
    float _3052 = float(_2792);
    float _3054 = fma(_2700, _2606, _2950);
    bool _3056 = _1922 != 3;
    float _3058 = -_2982;
    float _3060 = fma(_3058, _1898, _2920);
    float _3062 = float(uint(_3006));
    float _3064 = fma(_3032, _2060, _2342);
    int _3066 = ~_3018;
    int _3068 = _3066 + 1;
    int _3070 = _3068 + 1;
    float _3072 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3050);
    float _3074 = 1.0 / _3062;
    int _3076 = ~_2268;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    out.m_82.x = _3060;
    out.m_82.y = _3064;
    int _3082 = _3070 * as_type<int>(_2890);
    int _3084 = _3082 + _3028;
    float _3086 = _3036 * _135;
    float _3088 = -_3024;
    float _3090 = _3088 + 1.0;
    int _3092 = _3084 * _3080;
    int _3094 = abs(_2578);
    float _3096 = exp2(_3086);
    int _3098 = abs(_3006);
    float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3102 = 1.0 + _3100;
    float _3104 = -_2988;
    float _3106 = fma(_2400, _3104, _2942);
    float _3108 = fma(_2070, _1262, _2958);
    int _3110 = _2604 * _2268;
    int _3112 = _3110 + _3092;
    int _3114 = _1876 >> 31;
    float _3116 = 1.0 / _3102;
    float _3118 = float(uint(_3098));
    out.m_84.x = _3106;
    out.m_84.y = _3108;
    int _3120 = as_type<int>(_3074) + (-2);
    float _3122 = -_3044;
    float _3124 = _3122 + 1.0;
    float _3126 = float(uint(_3112));
    float _3128 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3054);
    int _3130 = _3114 & 3;
    float _3132 = 1.0 / _3118;
    int _3134 = _2216 >> 31;
    float _3136 = as_type<float>(_3120) * _3126;
    int _3138 = _1876 + _3130;
    float _3140 = _2894 * _2894;
    float _3142 = -_3096;
    float _3144 = _3142 + 1.0;
    int _3146 = _3134 & 3;
    out.m_86.x = _3128;
    float _3148 = trunc(_3136);
    float _3150 = precise::max(_3148, 0.0);
    uint _3152 = uint(_3150);
    float _3154 = fma(_2898, _2898, _3140);
    float _3156 = _2998 ? _3144 : 0.0;
    float _3158 = 1.0;
    if (_2940)
    {
        out.m_67.x = 0.0;
    }
    int _3160 = _3138 >> 2;
    float _3162 = fma(_2864, _2864, _3154);
    int _3164 = abs(_3112);
    int _3166 = _2216 + _3146;
    int _3168 = as_type<int>(_3132) + (-2);
    float _3170 = rsqrt(_3162);
    int _3172 = _3160 << 4;
    int _3174 = _3172 + 368;
    float _3176 = float(uint(_3164));
    bool _3178 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3180 = isnan(1.0);
    bool _3182 = _3178 || _3180;
    bool _3184 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3186 = _3182 || _3184;
    uint _3188 = uint(int(uint(_3174) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    int _3204 = _3166 >> 2;
    float _3206 = as_type<float>(_3168) * _3176;
    int _3208 = ~_3006;
    int _3210 = _3208 + 1;
    int _3212 = _3204 << 4;
    int _3214 = _3212 + 800;
    int _3216 = ~_3094;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3210 * int(_3152);
    int _3224 = _3222 + _3112;
    uint _3226 = uint(int(uint(_3214) >> uint(2)));
    uint _3228 = uint(int(uint(int(_3226)) >> uint(2)));
    int _3230 = int(_3226) & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    int _3234 = int(_3226) + 1;
    uint _3236 = uint(int(uint(_3234) >> uint(2)));
    int _3238 = _3234 & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    float _3242 = trunc(_3206);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    bool _3248 = _903 == 0;
    if (_3186)
    {
        float _3250 = _3156 * _3116;
        _145 = _3250;
    }
    float _3252 = _145;
    float _3254 = float(uint(_3224));
    float _3256 = _2894 * _3170;
    int _3258 = abs(_3042);
    float _3260 = _2898 * _3170;
    int _3262 = _3214 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    float _3280 = as_type<float>(_3120) * _3254;
    int _3282 = ~_3098;
    int _3284 = _3282 + 1;
    float _3286 = -_3256;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2894);
    float _3290 = float(_3258);
    float _3292 = -_3260;
    float _3294 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2898);
    float _3296 = trunc(_3280);
    float _3298 = precise::max(_3296, 0.0);
    uint _3300 = uint(_3298);
    bool _3302 = !_3248;
    int _3304 = _3302 ? _2362 : (-1);
    float _3306 = _3290 * _3052;
    bool _3308 = !_1684;
    int _3310 = _3308 ? _2390 : (-1);
    int _3312 = _3174 + 8;
    uint _3314 = uint(int(uint(_3312) >> uint(2)));
    uint _3316 = uint(int(uint(int(_3314)) >> uint(2)));
    int _3318 = int(_3314) & 3;
    float _3320 = (*spvDescriptorSet0.vp_c9)._m0[int(_3316)][_3318];
    int _3322 = int(_3314) + 1;
    uint _3324 = uint(int(uint(_3322) >> uint(2)));
    int _3326 = _3322 & 3;
    float _3328 = (*spvDescriptorSet0.vp_c9)._m0[int(_3324)][_3326];
    int _3330 = _3284 * int(_3246);
    int _3332 = _3330 + _3164;
    float _3334 = _3288 * _3288;
    float _3336 = _3306 * (-2.0);
    bool _3338 = !_2618;
    int _3340 = _3338 ? 0 : 1;
    float _3342 = float(uint(_3332));
    float _3344 = fma(_3294, _3294, _3334);
    float _3346 = fma(_2900, _3336, _2900);
    float _3348 = as_type<float>(_3168) * _3342;
    int _3350 = int(_3152) + int(_3300);
    int _3352 = ~_3006;
    int _3354 = _3352 + 1;
    float _3356 = trunc(_3348);
    float _3358 = precise::max(_3356, 0.0);
    uint _3360 = uint(_3358);
    int _3362 = _3354 * _3350;
    int _3364 = _3362 + _3112;
    int _3366 = _2396 * as_type<int>(_3202);
    int _3368 = abs(_2640);
    int _3370 = ~_3098;
    int _3372 = _3370 + 1;
    int _3374 = ~_3368;
    int _3376 = _3374 + 1;
    int _3378 = _3376 + 1;
    int _3380 = _2542 * as_type<int>(_3240);
    bool _3382 = !_3056;
    int _3384 = _3382 ? 0 : (-1);
    int _3386 = _3378 * as_type<int>(_3194);
    int _3388 = _3386 + _3366;
    bool _3390 = uint(_3364) >= uint(_3006);
    int _3392 = _3220 * as_type<int>(_3232);
    int _3394 = _3392 + _3380;
    int _3396 = int(_3246) + int(_3360);
    bool _3398 = !_3390;
    int _3400 = _3398 ? 0 : (-1);
    int _3402 = abs(_2038);
    int _3404 = _3372 * _3396;
    int _3406 = _3404 + _3164;
    bool _3408 = _2230 != 3;
    int _3410 = ~_3402;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    bool _3416 = !_3408;
    int _3418 = _3416 ? 0 : (-1);
    bool _3420 = uint(_3406) >= uint(_3098);
    int _3422 = abs(_3384);
    int _3424 = _3414 * as_type<int>(_3320);
    int _3426 = _3424 + _3388;
    int _3428 = ~_3350;
    int _3430 = _3428 + _3400;
    int _3432 = _3430 + 1;
    int _3434 = _3006 * _3432;
    int _3436 = _3434 + _3112;
    bool _3438 = !_3420;
    int _3440 = _3438 ? 0 : (-1);
    int _3442 = _3112 ^ _3006;
    bool _3444 = _3006 == 0;
    int _3446 = ~_3422;
    int _3448 = _3446 + 1;
    int _3450 = _3448 + 1;
    int _3452 = ~_2580;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = abs(_3418);
    int _3460 = _3450 * as_type<int>(_3328);
    int _3462 = _3460 + _3426;
    uint _3464 = uint(int(uint(_3442) >> uint(31)));
    int _3466 = _3456 * as_type<int>(_3270);
    int _3468 = _3466 + _3394;
    bool _3470 = !_3444;
    int _3472 = _3470 ? _3436 : (-1);
    bool _3474 = _3006 == 0;
    float _3476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3478 = ~_3440;
    int _3480 = _3396 + _3478;
    int _3482 = _3480 + 1;
    int _3484 = ~int(_3464);
    int _3486 = _3484 + 1;
    int _3488 = abs(_2116);
    float _3490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3492 = ~_3458;
    int _3494 = _3492 + 1;
    int _3496 = _3494 + 1;
    int _3498 = _3482 ^ _3486;
    int _3500 = ~_3488;
    int _3502 = _3500 + 1;
    int _3504 = _3502 + 1;
    int _3506 = _3496 * as_type<int>(_3278);
    int _3508 = _3506 + _3468;
    int _3510 = abs(_2220);
    float _3512 = in.m_88.x;
    float _3514 = in.m_88.y;
    float _3516 = in.m_88.z;
    int _3518 = ~_3486;
    int _3520 = _3518 + _3498;
    int _3522 = _3520 + 1;
    int _3524 = _3462 * _3504;
    int _3526 = ~_3510;
    int _3528 = _3526 + 1;
    int _3530 = _3528 + 1;
    float _3532 = _3476 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3534 = !_3474;
    int _3536 = _3534 ? _3522 : (-1);
    int _3538 = _3304 * _3488;
    int _3540 = _3538 + _3524;
    float _3542 = float(_3472);
    int _3544 = _3508 * _3530;
    float _3546 = float(_3536);
    float _3548 = _3490 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3550 = float(_3540);
    float _3552 = fma(_3532, _3542, _3048);
    float _3554 = _1378 + 0.5;
    float _3556 = -_3072;
    float _3558 = fma(_3548, _3546, _3556);
    float _3560 = _1360 + (-0.5);
    out.m_90.x = _3550;
    float _3562 = fma(_3532, _3554, _3552);
    int _3564 = _3310 * _3510;
    int _3566 = _3564 + _3544;
    float _3568 = -_3548;
    float _3570 = fma(_3568, _3560, _3558);
    float _3572 = _2864 * _3170;
    float _3574 = -_3090;
    float _3576 = fma(_1378, _3574, _3562);
    float _3578 = float(_3566);
    float _3580 = fma(_1360, _3124, _3570);
    float _3582 = fma(_3336, _3512, _3512);
    bool _3584 = !_2614;
    int _3586 = _3584 ? 0 : 1;
    float _3588 = -_3572;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2864);
    out.m_90.w = _3578;
    int _3592 = abs(_3586);
    out.m_92.x = _3576;
    out.m_92.y = _3580;
    float _3594 = _3516;
    if (_2940)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3596 = -_3256;
    float _3598 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2802);
    float _3600 = float(_2520);
    float _3602 = -_3260;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2870);
    float _3606 = float(_3592);
    float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3610 = _3598 + _3608;
    float _3612 = fma(_3590, _3590, _3344);
    float _3614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3616 = _3604 + _3614;
    float _3618 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3620 = _3606 * _3600;
    float _3622 = -_3572;
    float _3624 = fma(_3622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2800);
    int _3626 = abs(_3340);
    float _3628 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3618);
    float _3630 = _2824 + (-1.0);
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3634 = _3624 + _3632;
    float _3636 = float(_2600);
    float _3638 = fma(_2798, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3582);
    float _3640 = float(_3626);
    float _3642 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3628);
    float _3644 = _3620 * (-2.0);
    float _3646 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3648 = _3640 * _3636;
    float _3650 = fma(_3644, _3514, _3514);
    bool _3652 = _3642 >= 0.0;
    float _3654 = fma(_3646, _3644, _3646);
    float _3656 = _2816 + (-1.0);
    float _3658 = fma(_2784, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3650);
    float _3660 = _3648 * (-2.0);
    float _3662 = fma(_3346, _3252, _3638);
    float _3664 = _1198 + (-0.5);
    float _3666 = fma(_3654, _3252, _3658);
    float _3668 = fma(_3656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3670 = fma(_3660, _3516, _3516);
    float _3672 = _3662 * 0.15915493667125701904296875;
    float _3674 = _3666 * 0.15915493667125701904296875;
    float _3676 = sqrt(_3612);
    float _3678 = _3604;
    if (_3652)
    {
        _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3680 = _3594;
    float _3682 = fma(_3664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3670);
    float _3684 = fma(_3668, _3660, _3668);
    int _3686 = as_type<int>(_3680);
    if (_3652)
    {
        out.m_67.x = 0.0;
    }
    if (_3652)
    {
        float _3688 = _3680 * 5.0;
        _3686 = as_type<int>(_3688);
    }
    int _3690 = _3686;
    float _3692 = fma(_3684, _3252, _3682);
    float _3694 = _3672 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    if (_3652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10844 = as_type<float>(_3690);
        out.gl_Position.z = _10844;
    }
    float _3698 = _3692 * 0.15915493667125701904296875;
    float _3700 = _3672 * 6.283185482025146484375;
    float _3702 = cos(_3700);
    float _3704 = _3674 * 6.283185482025146484375;
    float _3706 = sin(_3704);
    float _3708 = _3674 * 6.283185482025146484375;
    float _3710 = cos(_3708);
    if (_3652)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3712 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3714 = _3170 * _3676;
    float _3716 = _3698 * 6.283185482025146484375;
    float _3718 = cos(_3716);
    float _3720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _3722 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3724 = _3714 * _3712;
    float _3726 = _3702 * _3710;
    float _3728 = _3702 * _3706;
    float _3730 = _3714 * _3722;
    float _3732 = _3720 * _3724;
    float _3734 = _3698 * 6.283185482025146484375;
    float _3736 = sin(_3734);
    float _3738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3740 = _3696 * _3706;
    float _3742 = _3696 * _3710;
    float _3744 = _3702 * _3718;
    float _3746 = _3696 * _3718;
    float _3748 = _3738 * _3730;
    float _3750 = _3710 * _3718;
    float _3752 = _3744 * _3732;
    float _3754 = _3706 * _3718;
    float _3756 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3758 = _3756 * 0.5;
    float _3760 = fma(_3736, _3726, _3740);
    float _3762 = -_3742;
    float _3764 = fma(_3736, _3728, _3762);
    float _3766 = -_3732;
    float _3768 = _3736 * _3766;
    float _3770 = -_3728;
    float _3772 = fma(_3736, _3742, _3770);
    float _3774 = fma(_3760, _3748, _3752);
    float _3776 = _3746 * _3732;
    float _3778 = fma(_3750, _3748, _3768);
    float _3780 = fma(_3736, _3740, _3726);
    float _3782 = fma(_3764, _3758, _3774);
    float _3784 = fma(_3772, _3748, _3776);
    float _3786 = fma(_3754, _3758, _3778);
    float _3788 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3790 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3792 = fma(_3780, _3758, _3784);
    float _3794 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3788);
    float _3796 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3790);
    float _3798 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3794);
    float _3800 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3796);
    float _3802 = _3798 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3804 = _3800 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3806 = _2870 + _3802;
    float _3808 = _2800 + _3804;
    float _3810 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3814 = _3806 + _3812;
    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3818 = _3808 + _3816;
    float _3820 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3810);
    float _3822 = _3814 * _3814;
    float _3824 = _3818 * _3818;
    float _3826 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3820);
    float _3828 = _3822 + _3824;
    float _3830 = _3826 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3832 = sqrt(_3828);
    float _3834 = _2802 + _3830;
    bool _3836 = _3832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3838 = _3782;
    float _3840 = _3806;
    float _3842 = _3808;
    float _3844 = _3822;
    float _3846 = _3824;
    if (!_3836)
    {
        _3838 = _3834;
    }
    float _3848 = _3838;
    bool _3850 = !_3836;
    float _3852 = _3848;
    if (!_3850)
    {
        float _3854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3858 = _3832 + _3856;
        float _3860 = rsqrt(_3828);
        float _3862 = _3858 * _3854;
        float _3864 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3866 = _3862 * 0.15915493667125701904296875;
        float _3868 = _3866 * 6.283185482025146484375;
        float _3870 = sin(_3868);
        float _3872 = _3866 * 6.283185482025146484375;
        float _3874 = cos(_3872);
        float _3876 = fma(_3870, _3864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3878 = _3860 * _3876;
        float _3880 = _3874 + (-1.0);
        float _3882 = fma(_3814, _3878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3884 = fma(_3818, _3878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3886 = _3880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3890 = _3882 + _3888;
        float _3892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3894 = _3884 + _3892;
        float _3896 = fma(_3834, _3874, _3886);
        float _3898 = _3890 * _3890;
        float _3900 = _3894 * _3894;
        _3840 = _3882;
        _3842 = _3884;
        _3852 = _3896;
        _3844 = _3898;
        _3846 = _3900;
    }
    float _3902 = _3840;
    float _3904 = _3842;
    float _3906 = _3852;
    float _3908 = _3844;
    float _3910 = _3846;
    float _3912 = fma(_3902, 6.2500002968590706586837768554688e-05, 0.5);
    float _3914 = fma(_3904, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11191 = float2(_3912, _3914);
    float3 _3918 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11191, float2(0.0), isnan(_11191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11191, float2(0.0), isnan(_11191)), level(0.0)).xyz;
    float _3920 = _3918.x;
    float _3922 = _3918.y;
    float _3924 = _3918.z;
    float _3926 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3928 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3930 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3932 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3934 = -_3736;
    float _3936 = fma(_3934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3926);
    float _3938 = -_3736;
    float _3940 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3928);
    float _3942 = -_3736;
    float _3944 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3930);
    float _3946 = fma(_3932, _3932, 1.0);
    float _3948 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3950 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3952 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3954 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3956 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3948);
    float _3958 = rsqrt(_3946);
    float _3960 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3950);
    float _3962 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3952);
    float _3964 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3966 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3968 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3954);
    float _3970 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3936);
    float _3972 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3964);
    float _3974 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3976 = _3906 + _3974;
    float _3978 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3966);
    float _3980 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3940);
    float _3982 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3944);
    float _3984 = fma(_3976, _3976, _3908);
    float _3986 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3972);
    float _3988 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3978);
    float _3990 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3968);
    float _3992 = _3984 + _3910;
    float _3994 = _3932 * _3958;
    float _3996 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3998 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3956);
    float _4000 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3960);
    float _4002 = _3932 * _3970;
    float _4004 = _3932 * _3980;
    float _4006 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3962);
    float _4008 = _3932 * _3982;
    float _4010 = -_3986;
    float _4012 = _3994 * _4010;
    float _4014 = -_3990;
    float _4016 = _3994 * _4014;
    float _4018 = -_3988;
    float _4020 = _3994 * _4018;
    float _4022 = sqrt(_3992);
    float _4024 = fma(_3996, _3998, _4002);
    float _4026 = fma(_3996, _4000, _4004);
    float _4028 = fma(_3996, _4006, _4008);
    float _4030 = fma(_3958, _3970, _4012);
    float _4032 = fma(_3958, _3980, _4016);
    float _4034 = fma(_3958, _3982, _4020);
    float _4036 = _3986 + _4024;
    float _4038 = _3990 + _4026;
    float _4040 = _3988 + _4028;
    out.m_94.x = _3998;
    out.m_94.y = _4000;
    out.m_94.z = _4006;
    out.m_96.x = _4030;
    out.m_96.y = _4032;
    out.m_96.z = _4034;
    bool _4042 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4044 = isnan(_4022);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4050 = _4046 || _4048;
    out.m_98.x = _4036;
    out.m_98.y = _4038;
    out.m_98.z = _4040;
    float _4052 = _4008;
    float _4054 = _3988;
    float _4056 = _3990;
    if (!_4050)
    {
        _4052 = 1.0;
    }
    float _4058 = _4052;
    out.m_100.x = _3920;
    out.m_100.y = _3922;
    out.m_100.z = _3924;
    bool _4060 = !_4050;
    float _4062 = _4058;
    float _4064 = _3922;
    if (!_4060)
    {
        bool _4066 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4068 = isnan(_4022);
        bool _4070 = _4066 || _4068;
        bool _4072 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4074 = _4070 || _4072;
        if (!_4074)
        {
            float _4076 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4078 = _4022 + _4076;
            float _4080 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4082 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4080;
            float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4086 = _4084 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4088 = 1.0 / _4082;
            float _4090 = _4078 * _4088;
            float _4092 = fma(_4090, _4086, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4062 = _4092;
            _4064 = _4088;
            _4094 = true;
        }
        else
        {
            bool _4096 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4098 = isnan(_4022);
            bool _4100 = _4096 || _4098;
            bool _4102 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4104 = _4100 || _4102;
            if (!_4104)
            {
                float _4106 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4108 = _4022 + _4106;
                float _4110 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4112 = _4110 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4114 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4116 = _4114 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4118 = 1.0 / _4112;
                float _4120 = _4108 * _4118;
                float _4122 = fma(_4120, _4116, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4062 = _4122;
                _4064 = _4118;
                _4094 = true;
            }
            else
            {
                _4062 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4094 = false;
    float _4124 = _4062;
    float _4126 = _4064;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4130 = _3906 + _4128;
    float _4132 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4134 = _3902 + _4132;
    float _4136 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4138 = _3904 + _4136;
    float _4140 = fma(_4130, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4142 = fma(_4134, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4144 = fma(_4138, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4146 = -_2802;
    float _4148 = _4146 + _4140;
    float _4150 = -_2870;
    float _4152 = _4150 + _4142;
    float _4154 = -_2800;
    float _4156 = _4154 + _4144;
    float _4158 = _4148 * _4148;
    float _4160 = fma(_4152, _4152, _4158);
    float _4162 = fma(_4156, _4156, _4160);
    float _4164 = sqrt(_4162);
    bool _4166 = _4164 > 0.0;
    float _4168 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4170 = fma(_3604, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4168);
    float _4172 = _4126;
    float _4174 = _4138;
    float _4176 = _4168;
    float _4178 = _4152;
    if (!_4166)
    {
        _4172 = _4142;
    }
    float _4180 = _4172;
    float _4182 = _4180;
    if (!_4166)
    {
        _4174 = _4140;
    }
    float _4184 = _4174;
    float _4186 = _4184;
    float _4188 = _4184;
    if (!_4166)
    {
        _4176 = _4144;
    }
    float _4190 = _4176;
    bool _4192 = !_4166;
    float _4194 = _4190;
    if (!_4192)
    {
        float _4196 = _227 * _227;
        float _4198 = fma(_225, _225, _4196);
        float _4200 = fma(_229, _229, _4198);
        float _4202 = rsqrt(_4162);
        float _4204 = sqrt(_4200);
        float _4206 = _4152 * _4202;
        float _4208 = _4148 * _4202;
        float _4210 = _4156 * _4202;
        bool _4212 = _4204 > 0.0;
        float _4214 = _4204;
        float _4216 = _4202;
        _4178 = _4206;
        if (!_4212)
        {
            _4214 = _4142;
        }
        float _4218 = _4214;
        _4182 = _4218;
        if (!_4212)
        {
            _4186 = _4140;
        }
        float _4220 = _4186;
        _4188 = _4220;
        if (!_4212)
        {
            _4216 = _4144;
        }
        float _4222 = _4216;
        bool _4224 = !_4212;
        _4194 = _4222;
        if (!_4224)
        {
            float _4226 = rsqrt(_4200);
            float _4228 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4230 = _227 * _4226;
            float _4232 = _225 * _4226;
            float _4234 = _229 * _4226;
            float _4236 = _4208 * _4230;
            float _4238 = fma(_4206, _4232, _4236);
            float _4240 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4242 = fma(_4210, _4234, _4238);
            float _4244 = _4242 * _4240;
            float _4246 = fma(_225, _4244, _4142);
            float _4248 = fma(_227, _4244, _4140);
            float _4250 = fma(_229, _4244, _4144);
            _4188 = _4248;
            _4182 = _4246;
            _4194 = _4250;
        }
    }
    float _4252 = _4188;
    float _4254 = _4182;
    float _4256 = _4194;
    float _4258 = _4178;
    float _4260 = -_3256;
    float _4262 = fma(_4260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4252);
    float _4264 = -_3260;
    float _4266 = fma(_4264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4254);
    float _4268 = fma(_3624, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4170);
    float _4270 = -_3572;
    float _4272 = fma(_4270, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4256);
    float _4274 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4276 = _4262 + _4274;
    float _4278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4280 = _4266 + _4278;
    float _4282 = _4268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4286 = _4272 + _4284;
    float _4288 = _4276 * _4276;
    float _4290 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4292 = 1.0 / _4282;
    float _4294 = fma(_4280, _4280, _4288);
    float _4296 = fma(_3604, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4290);
    float _4298 = fma(_4286, _4286, _4294);
    float _4300 = fma(_3624, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4296);
    float _4302 = rsqrt(_4298);
    float _4304 = _4300 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4306 = _4304 + _4282;
    float _4308 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4310 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4312 = _4306 * _4292;
    float _4314 = _4312 * 0.5;
    float _4316 = _3598 + _4308;
    float _4318 = floor(_4310);
    float _4320 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4322 = fma(_4314, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4320);
    float _4324 = _4316 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4326 = _4302 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4328 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4324);
    float _4330 = 1.0 / _4322;
    float _4332 = _4280 * _4326;
    float _4334 = _4316 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4336 = _4286 * _4326;
    float _4338 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4328);
    float _4340 = _4332 * _4332;
    float _4342 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4334);
    float _4344 = _4336 * _4336;
    float _4346 = _4338 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4348 = -_4318;
    float _4350 = _4310 + _4348;
    float _4352 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4342);
    float _4354 = _4340 + _4344;
    float _4356 = trunc(_4346);
    int _4358 = int(_4356);
    float _4360 = _4352 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4362 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4364 = _4330 * _4362;
    float _4366 = sqrt(_4354);
    bool _4368 = _4364 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4370 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _4372 = _4364 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4374 = trunc(_4360);
    int _4376 = int(_4374);
    int _4378 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4380 = _4358 + _4378;
    int _4382 = _4380 + 1;
    int _4384 = 2;
    float _4386 = _4318;
    float _4388 = _4354;
    float _4390 = _4276;
    float _4392 = as_type<float>(_4382);
    float _4394 = _4346;
    if (!_4368)
    {
        _4384 = 1;
    }
    int _4396 = _4384;
    bool _4398 = _4366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4400 = floor(_4370);
    int _4402 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4404 = _4376 + _4402;
    int _4406 = _4404 + 1;
    bool _4408 = _4406 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4410 = as_type<float>(_4358);
    int _4412 = _4396;
    int _4414 = _4406;
    if (_4398)
    {
        float _4416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4410 = _4416;
    }
    float _4418 = _4410;
    int _4420 = _4406 | _4382;
    if (!_4398)
    {
        _4386 = _4344;
    }
    float _4422 = _4386;
    float _4424 = -_4400;
    float _4426 = _4370 + _4424;
    bool _4428 = _4420 < 0;
    bool _4430 = _4428 || _4408;
    bool _4432 = !_4368;
    int _4434 = _4432 ? 0 : 1;
    float _4436 = _4400;
    float _4438 = _4422;
    if (_4398)
    {
        float _4440 = rsqrt(_4354);
        _4388 = _4440;
    }
    float _4442 = _4388;
    bool _4444 = _4382 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4446 = _4444 || _4430;
    if (!_4372)
    {
        _4412 = _4434;
    }
    int _4448 = _4412;
    float _4450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4452 = _4366 + _4450;
    float _4454 = _4452;
    if (!_4398)
    {
        _4436 = _4336;
    }
    float _4456 = _4436;
    int _4458 = _4448 << 6;
    float _4460 = _4456;
    if (_4398)
    {
        float _4462 = _4452 * _4418;
        _4454 = _4462;
    }
    float _4464 = _4454;
    int _4466 = _4458 + 64;
    uint _4468 = uint(int(uint(_4466) >> uint(2)));
    uint _4470 = uint(int(uint(int(_4468)) >> uint(2)));
    int _4472 = int(_4468) & 3;
    float _4474 = (*spvDescriptorSet0.vp_c15)._m0[int(_4470)][_4472];
    int _4476 = int(_4468) + 1;
    uint _4478 = uint(int(uint(_4476) >> uint(2)));
    int _4480 = _4476 & 3;
    float _4482 = (*spvDescriptorSet0.vp_c15)._m0[int(_4478)][_4480];
    if (_4398)
    {
        float _4484 = _4464 * 0.15915493667125701904296875;
        _4054 = _4484;
    }
    float _4486 = _4054;
    float _4488 = _3980;
    if (!_4446)
    {
        float _4490 = floor(_4346);
        _4488 = _4490;
    }
    float _4492 = _4488;
    if (!_4446)
    {
        int _4494 = _4382 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4496 = _4494 + _4406;
        _4414 = _4496;
    }
    int _4498 = _4414;
    float _4500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4502 = _4458 + 80;
    uint _4504 = uint(int(uint(_4502) >> uint(2)));
    uint _4506 = uint(int(uint(int(_4504)) >> uint(2)));
    int _4508 = int(_4504) & 3;
    float _4510 = (*spvDescriptorSet0.vp_c15)._m0[int(_4506)][_4508];
    int _4512 = int(_4504) + 1;
    uint _4514 = uint(int(uint(_4512) >> uint(2)));
    int _4516 = _4512 & 3;
    float _4518 = (*spvDescriptorSet0.vp_c15)._m0[int(_4514)][_4516];
    float _4520 = _2802;
    if (_4398)
    {
        float _4522 = _4486 * 6.283185482025146484375;
        float _4524 = sin(_4522);
        _4520 = _4524;
    }
    float _4526 = _4520;
    float _4528 = precise::max(0.0, _4500);
    int _4530 = _4458 + 96;
    uint _4532 = uint(int(uint(_4530) >> uint(2)));
    uint _4534 = uint(int(uint(int(_4532)) >> uint(2)));
    int _4536 = int(_4532) & 3;
    float _4538 = (*spvDescriptorSet0.vp_c15)._m0[int(_4534)][_4536];
    int _4540 = int(_4532) + 1;
    uint _4542 = uint(int(uint(_4540) >> uint(2)));
    int _4544 = _4540 & 3;
    float _4546 = (*spvDescriptorSet0.vp_c15)._m0[int(_4542)][_4544];
    float _4548 = -_4326;
    float _4550 = -_4528;
    float _4552 = fma(_4276, _4548, _4550);
    if (!_4398)
    {
        _4390 = _4332;
    }
    float _4554 = _4390;
    float _4556 = _4258;
    float _4558 = _4554;
    if (_4398)
    {
        float _4560 = _4486 * 6.283185482025146484375;
        float _4562 = cos(_4560);
        _4556 = _4562;
    }
    float _4564 = _4556;
    float _4566 = _4492;
    if (!_4446)
    {
        float _4568 = -_4492;
        float _4570 = _4346 + _4568;
        _4392 = _4570;
    }
    float _4572 = _4392;
    if (_4398)
    {
        float _4574 = _4552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4056 = _4574;
    }
    float _4576 = _4056;
    float _4578 = _4576;
    if (!_4398)
    {
        _4566 = _4552;
    }
    float _4580 = _4566;
    int _4582 = _4458 + 104;
    uint _4584 = uint(int(uint(_4582) >> uint(2)));
    uint _4586 = uint(int(uint(int(_4584)) >> uint(2)));
    int _4588 = int(_4584) & 3;
    float _4590 = (*spvDescriptorSet0.vp_c15)._m0[int(_4586)][_4588];
    int _4592 = int(_4584) + 1;
    uint _4594 = uint(int(uint(_4592) >> uint(2)));
    int _4596 = _4592 & 3;
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[int(_4594)][_4596];
    float _4600 = _4526;
    float _4602 = _4580;
    if (_4398)
    {
        float _4604 = fma(_4526, _4576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4578 = _4604;
    }
    float _4606 = _4578;
    float _4608 = _4606;
    if (_4398)
    {
        float _4610 = _4442 * _4606;
        _4608 = _4610;
    }
    float _4612 = _4608;
    int _4614 = _4458 + 48;
    uint _4616 = uint(int(uint(_4614) >> uint(2)));
    uint _4618 = uint(int(uint(int(_4616)) >> uint(2)));
    int _4620 = int(_4616) & 3;
    float _4622 = (*spvDescriptorSet0.vp_c15)._m0[int(_4618)][_4620];
    int _4624 = int(_4616) + 1;
    uint _4626 = uint(int(uint(_4624) >> uint(2)));
    int _4628 = _4624 & 3;
    float _4630 = (*spvDescriptorSet0.vp_c15)._m0[int(_4626)][_4628];
    if (_4398)
    {
        float _4632 = _4564 + (-1.0);
        _4394 = _4632;
    }
    float _4634 = _4394;
    float _4636 = _4634;
    if (_4398)
    {
        float _4638 = _4332 * _4612;
        _4558 = _4638;
    }
    float _4640 = _4558;
    if (_4398)
    {
        float _4642 = _4336 * _4612;
        _4460 = _4642;
    }
    float _4644 = _4460;
    if (_4398)
    {
        float _4646 = _4634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4600 = _4646;
    }
    float _4648 = _4600;
    int _4650 = _4458 + 72;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    if (!_4398)
    {
        _4636 = _4340;
    }
    float _4668 = _4636;
    float _4670 = _4668;
    if (_4398)
    {
        float _4672 = _4640 * _4640;
        _4670 = _4672;
    }
    float _4674 = _4670;
    if (_4398)
    {
        float _4676 = fma(_4552, _4564, _4648);
        _4602 = _4676;
    }
    float _4678 = _4602;
    if (_4398)
    {
        float _4680 = _4644 * _4644;
        _4438 = _4680;
    }
    float _4682 = _4438;
    int _4684 = _4458 + 56;
    uint _4686 = uint(int(uint(_4684) >> uint(2)));
    uint _4688 = uint(int(uint(int(_4686)) >> uint(2)));
    int _4690 = int(_4686) & 3;
    float _4692 = (*spvDescriptorSet0.vp_c15)._m0[int(_4688)][_4690];
    int _4694 = int(_4686) + 1;
    uint _4696 = uint(int(uint(_4694) >> uint(2)));
    int _4698 = _4694 & 3;
    float _4700 = (*spvDescriptorSet0.vp_c15)._m0[int(_4696)][_4698];
    float _4702 = _4316 * _4482;
    float _4704 = fma(_3604, _4474, _4702);
    int _4706 = _4458 + 88;
    uint _4708 = uint(int(uint(_4706) >> uint(2)));
    uint _4710 = uint(int(uint(int(_4708)) >> uint(2)));
    int _4712 = int(_4708) & 3;
    float _4714 = (*spvDescriptorSet0.vp_c15)._m0[int(_4710)][_4712];
    int _4716 = int(_4708) + 1;
    uint _4718 = uint(int(uint(_4716) >> uint(2)));
    int _4720 = _4716 & 3;
    float _4722 = (*spvDescriptorSet0.vp_c15)._m0[int(_4718)][_4720];
    float _4724 = _4316 * _4518;
    float _4726 = fma(_4678, _4678, _4674);
    float _4728 = _4316 * _4546;
    float _4730 = sqrt(_4298);
    float _4732 = fma(_3604, _4510, _4724);
    float _4734 = _4726 + _4682;
    float _4736 = fma(_3604, _4538, _4728);
    int _4738 = as_type<int>(_4726);
    if (!_4446)
    {
        int _4740 = _4498 << 2;
        _4738 = _4740;
    }
    int _4742 = _4738;
    float _4744 = fma(_3624, _4590, _4736);
    int _4746 = _4742;
    if (!_4446)
    {
        int _4748 = 12 & _4742;
        _4746 = _4748;
    }
    int _4750 = _4746;
    float _4752 = rsqrt(_4734);
    float _4754 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4756 = _4744 + _4598;
    float _4758 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4760 = _4316 * _4630;
    int _4762 = as_type<int>(_4630);
    if (!_4446)
    {
        uint _4764 = uint(int(uint(_4498) >> uint(2)));
        _4762 = int(_4764);
    }
    int _4766 = _4762;
    float _4768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4770 = fma(_4730, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4768);
    float _4772 = precise::clamp(_4770, 0.0, 1.0);
    float _4774 = fma(_3604, _4622, _4760);
    int _4776 = _4766;
    if (!_4446)
    {
        int _4778 = _4766 << 4;
        int _4780 = _4778 + _4750;
        _4776 = _4780;
    }
    int _4782 = _4776;
    float _4784 = -_4772;
    float _4786 = _4784 + 1.0;
    float _4788 = 1.0 / _4756;
    float _4790 = fma(_3624, _4658, _4704);
    float _4792 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4754);
    float _4794 = _4760;
    float _4796 = as_type<float>(_4782);
    if (!_4446)
    {
        int _4798 = _4782 + 400;
        uint _4800 = uint(int(uint(_4798) >> uint(2)));
        uint _4802 = uint(int(uint(int(_4800)) >> uint(2)));
        int _4804 = int(_4800) & 3;
        float _4806 = (*spvDescriptorSet0.vp_c15)._m0[int(_4802)][_4804];
        _4794 = _4806;
    }
    float _4808 = _4794;
    float _4810 = _4752 * _4640;
    float _4812 = _4790 + _4666;
    float _4814 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4792);
    float _4816 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4818 = abs(_4786);
    float _4820 = log2(_4818);
    float _4822 = fma(_3624, _4692, _4774);
    float _4824 = _4814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4826 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4828 = _4752 * _4644;
    float _4830 = _4822 + _4700;
    float _4832 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4834 = _4774;
    if (!_4446)
    {
        float _4836 = floor(_4360);
        _4834 = _4836;
    }
    float _4838 = _4834;
    float _4840 = fma(_3624, _4714, _4732);
    float _4842 = _4752 * _4678;
    float _4844 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4832);
    float _4846 = _4824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4848 = _4830 * _4788;
    float _4850 = -_4826;
    float _4852 = fma(_4842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4850);
    float _4854 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4844);
    float _4856 = -_4846;
    float _4858 = fma(_4856, _4758, 1.0);
    float _4860 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4816);
    bool _4862 = _4848 >= 0.0;
    float _4864 = -_4828;
    float _4866 = fma(_4864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4852);
    float _4868 = _4854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4870 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4872 = _4812 * _4788;
    float _4874 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4876 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4860);
    bool _4878 = _4848 <= 1.0;
    bool _4880 = _4878 && _4862;
    float _4882 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4870);
    float _4884 = exp2(_4874);
    float _4886 = _4876 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4888 = _4872 >= 0.0;
    bool _4890 = _4888 && _4880;
    float _4892 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4894 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4882);
    float _4896 = fma(_4866, -0.5, 0.5);
    float _4898 = fma(_4866, 0.5, 0.5);
    bool _4900 = _4872 <= 1.0;
    bool _4902 = _4900 && _4890;
    float _4904 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4892);
    float _4906 = _4894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4908 = fma(_4898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4910 = sqrt(_4896);
    float _4912 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4904);
    float _4914 = _4842 + 1.0;
    if (!_4446)
    {
        float _4916 = -_4838;
        float _4918 = _4360 + _4916;
        _4796 = _4918;
    }
    float _4920 = _4796;
    float _4922 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4912);
    float _4924 = -_4842;
    float _4926 = fma(_4884, _4914, _4924);
    float _4928 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4930 = log2(_4858);
    float _4932 = _4840 + _4722;
    float _4934 = fma(_4898, _4908, -0.212114393711090087890625);
    float _4936 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4938 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4928);
    float2 _12940 = float2(_4350, _4426);
    float _4940 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12940, float2(0.0), isnan(_12940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12940, float2(0.0), isnan(_12940)), level(0.0)).x;
    float _4942 = fma(_4898, _4934, 1.570728778839111328125);
    float _4944 = _4934;
    float _4946 = _4922;
    if (_4902)
    {
        float _4948 = float(_4448);
        _4944 = _4948;
    }
    float _4950 = _4944;
    float _4952 = 1.0 / _4922;
    float _4954 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4936);
    float _4956 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4938);
    float _4958 = _4910 * 0.636619746685028076171875;
    float _4960 = fma(_4926, 0.5, 0.5);
    float _4962 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4954);
    float _4964 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4956);
    float _4966 = _4932 * _4788;
    float _4968 = _4950;
    float _4970 = _4964;
    if (_4902)
    {
        float _4972 = rint(_4950);
        float _4974 = precise::max(_4972, 0.0);
        uint _4976 = uint(_4974);
        uint _4978 = clamp(_4976, 0u, 65535u);
        _4968 = as_type<float>(_4978);
    }
    float _4980 = _4968;
    float _4982 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4962);
    float _4984 = _4930 * 0.693147182464599609375;
    float _4986 = -_4942;
    float _4988 = fma(_4958, _4986, 1.0);
    float _4990 = _4984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4992 = _4964 * _4952;
    float _4994 = _4982 * _4952;
    float _4996 = _4838;
    if (!_4446)
    {
        float _4998 = rint(_4808);
        float _5000 = precise::max(_4998, 0.0);
        uint _5002 = uint(_5000);
        uint _5004 = clamp(_5002, 0u, 65535u);
        _4996 = as_type<float>(_5004);
    }
    float _5006 = _4996;
    float _5008 = fma(_4992, 0.5, 0.5);
    float _5010 = fma(_4994, -0.5, 0.5);
    float _5012 = _4952;
    if (_4902)
    {
        float3 _13058 = float3(_4848, _4872, float(as_type<int>(_4980)));
        float3 _13062 = select(_13058, float3(0.0), isnan(_13058));
        float _5014 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13062.xy, uint(rint(_13062.z)), _4966, level(0.0));
        _5012 = _5014;
    }
    float _5016 = _5012;
    float3 _13072 = float3(_5008, _5010, _4990);
    float _5018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13072, float3(0.0), isnan(_13072)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13072, float3(0.0), isnan(_13072)), level(0.0)).x;
    float3 _13081 = float3(_5008, _5010, _4990);
    float4 _5021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13081, float3(0.0), isnan(_13081)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13081, float3(0.0), isnan(_13081)), level(0.0)).xyzw;
    float _5023 = _5021.x;
    float _5025 = _5021.y;
    float _5027 = _5021.z;
    float _5029 = _5021.w;
    float2 _13097 = float2(_4988, _4960);
    float3 _5031 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13097, float2(0.0), isnan(_13097)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13097, float2(0.0), isnan(_13097)), level(0.0)).xyz;
    float _5033 = _5031.x;
    float _5035 = _5031.y;
    float _5037 = _5031.z;
    float _5039 = _4920;
    if (!_4446)
    {
        float3 _13118 = float3(_4920, _4572, float(as_type<int>(_5006)));
        float3 _13120 = select(_13118, float3(0.0), isnan(_13118));
        float _5041 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13120.xy, uint(rint(_13120.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13120.xy, uint(rint(_13120.z)), level(0.0)).x;
        _5039 = _5041;
    }
    float _5043 = _5039;
    float _5045 = abs(_4364);
    float _5047 = log2(_5045);
    float _5049 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5051 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5049);
    float _5053 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5051);
    float _5055 = _4964 + _4922;
    float _5057 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5053);
    float _5059 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5061 = _5055 * 0.5;
    float _5063 = _5047 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = _5057 + _4922;
    bool _5067 = _4364 <= 8000.0;
    bool _5069 = isnan(_4364);
    bool _5071 = _5067 || _5069;
    bool _5073 = isnan(8000.0);
    bool _5075 = _5071 || _5073;
    float _5077 = float(_5075);
    out.gl_Position.x = _4964;
    out.gl_Position.y = _4982;
    out.gl_Position.z = _5057;
    out.gl_Position.w = _4922;
    float _5079 = exp2(_5059);
    float _5081 = _5065 * 0.5;
    float _5083 = exp2(_5063);
    float _5085 = _5077;
    if (_4446)
    {
        _4970 = 1.0;
    }
    float _5087 = _4970;
    float _5089 = fma(_5083, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5091 = precise::clamp(_5089, 0.0, 1.0);
    float _5093 = fma(_5091, -2.0, 3.0);
    float _5095 = _5091 * _5091;
    float _5097 = _5095 * _5093;
    float _5099 = _4922 * 0.5;
    float _5101 = fma(_4982, -0.5, _5099);
    float _5103 = -_5097;
    float _5105 = _5103 + 1.0;
    out.m_102.x = _5061;
    out.m_102.y = _5101;
    out.m_102.z = _5081;
    out.m_102.w = _4922;
    float _5107 = fma(_5105, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5097);
    float _5109 = _5077 * _5107;
    float _5111 = _5087;
    if (!_4902)
    {
        _5085 = 1.0;
    }
    float _5113 = _5085;
    float _5115 = _5109 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5117 = -_5079;
    float _5119 = _5117 + 1.0;
    float _5121 = _5119 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5123 = -_4940;
    float _5125 = _5123 + 1.0;
    float _5127 = _5125 * _5115;
    float _5129 = precise::clamp(_5127, 0.0, 1.0);
    float _5131 = _5113;
    if (_4902)
    {
        bool _5133 = _5016 >= _4966;
        bool _5135 = isnan(_5016);
        bool _5137 = _5133 || _5135;
        bool _5139 = isnan(_4966);
        bool _5141 = _5137 || _5139;
        float _5143 = float(_5141);
        _5131 = _5143;
    }
    float _5145 = _5131;
    if (!_4446)
    {
        int _5147 = _4498 << 4;
        int _5149 = _5147 + 2048;
        uint _5151 = uint(int(uint(_5149) >> uint(2)));
        uint _5153 = uint(int(uint(int(_5151)) >> uint(2)));
        int _5155 = int(_5151) & 3;
        float _5157 = (*spvDescriptorSet0.vp_c15)._m0[int(_5153)][_5155];
        int _5159 = int(_5151) + 1;
        uint _5161 = uint(int(uint(_5159) >> uint(2)));
        int _5163 = _5159 & 3;
        float _5165 = (*spvDescriptorSet0.vp_c15)._m0[int(_5161)][_5163];
        int _5167 = _5149 + 8;
        uint _5169 = uint(int(uint(_5167) >> uint(2)));
        uint _5171 = uint(int(uint(int(_5169)) >> uint(2)));
        int _5173 = int(_5169) & 3;
        float _5175 = (*spvDescriptorSet0.vp_c15)._m0[int(_5171)][_5173];
        int _5177 = int(_5169) + 1;
        uint _5179 = uint(int(uint(_5177) >> uint(2)));
        int _5181 = _5177 & 3;
        float _5183 = (*spvDescriptorSet0.vp_c15)._m0[int(_5179)][_5181];
        float _5185 = _4316 * _5165;
        float _5187 = fma(_3604, _5157, _5185);
        float _5189 = fma(_3624, _5175, _5187);
        float _5191 = _5189 + _5183;
        float _5193 = precise::clamp(_5191, 0.0, 1.0);
        float _5195 = -_5193;
        float _5197 = _5195 + _5043;
        float _5199 = fma(_5197, 500.0, 1.5);
        float _5201 = exp2(_5199);
        float _5203 = 0.0 + _5201;
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        _5111 = _5205;
        _4946 = _5183;
    }
    float _5207 = _5111;
    float _5209 = _4946;
    float _5211 = _5145 * _5207;
    float _5213 = _5121 * _5018;
    float _5215 = -_5129;
    float _5217 = fma(_5215, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5219 = -_5121;
    float _5221 = _5219 + 1.0;
    bool _5223 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5225 = isnan(_4730);
    bool _5227 = _5223 || _5225;
    bool _5229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5231 = _5227 || _5229;
    float _5233 = _5029 * _5213;
    float _5235 = -_5211;
    float _5237 = fma(_5235, _5217, 1.0);
    float _5239 = precise::clamp(_5237, 0.0, 1.0);
    float _5241 = _5037 * _5213;
    float _5243 = _5029 * _5221;
    float _5245 = fma(_5033, _5233, _5023);
    float _5247 = fma(_5035, _5233, _5025);
    float _5249 = _5239 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5251 = fma(_5029, _5241, _5027);
    out.m_104.x = _5249;
    float _5253 = _5209;
    float _5255 = _5213;
    float _5257 = _5233;
    float _5259 = _5239;
    if (!_5231)
    {
        _3678 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5261 = _3678;
    float _5263 = _5261;
    float _5265 = _5261;
    if (!_5231)
    {
        _3158 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5267 = _3158;
    out.m_106.x = _5245;
    out.m_106.y = _5247;
    out.m_106.z = _5251;
    out.m_106.w = _5243;
    float _5269 = _5267;
    float _5271 = _5267;
    if (!_5231)
    {
        _5253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5273 = _5253;
    float _5275 = _5273;
    float _5277 = _5273;
    if (!_5231)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5279 = _5255;
    float _5281 = _5279;
    float _5283 = _5279;
    if (!_5231)
    {
        _5257 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5285 = _5257;
    float _5287 = _5285;
    float _5289 = _5285;
    if (!_5231)
    {
        _5259 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5291 = _5259;
    bool _5293 = !_5231;
    float _5295 = _5291;
    float _5297 = _5291;
    if (!_5293)
    {
        bool _5299 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5301 = isnan(_4730);
        bool _5303 = _5299 || _5301;
        bool _5305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5307 = _5303 || _5305;
        if (!_5307)
        {
            float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5311 = _4730 + _5309;
            float _5313 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5315 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5313;
            float _5317 = 1.0 / _5315;
            float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5325 = _5323 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5327 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5329 = _5327 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5333 = _5331 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5335 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5337 = _5335 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5339 = _5311 * _5317;
            float _5341 = precise::clamp(_5339, 0.0, 1.0);
            float _5343 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5345 = _5343 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5347 = fma(_5341, _5321, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5349 = fma(_5341, _5345, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5351 = fma(_5341, _5325, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5353 = fma(_5341, _5329, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5355 = fma(_5341, _5333, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5357 = fma(_5341, _5337, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5271 = _5349;
            _5289 = _5355;
            _5265 = _5347;
            _5283 = _5353;
            _5277 = _5351;
            _5297 = _5357;
            _5359 = true;
        }
        else
        {
            bool _5361 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5363 = isnan(_4730);
            bool _5365 = _5361 || _5363;
            bool _5367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5369 = _5365 || _5367;
            if (!_5369)
            {
                _5263 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5371 = _5263;
            _5265 = _5371;
            if (!_5369)
            {
                _5269 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5373 = _5269;
            _5271 = _5373;
            if (!_5369)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5375 = _5275;
            _5277 = _5375;
            if (!_5369)
            {
                _5281 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5377 = _5281;
            _5283 = _5377;
            if (!_5369)
            {
                _5287 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5379 = _5287;
            _5289 = _5379;
            if (!_5369)
            {
                _5295 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5381 = _5295;
            bool _5383 = !_5369;
            _5297 = _5381;
            if (!_5383)
            {
                bool _5385 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5387 = isnan(_4730);
                bool _5389 = _5385 || _5387;
                bool _5391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5393 = _5389 || _5391;
                if (!_5393)
                {
                    float _5395 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5397 = _4730 + _5395;
                    float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5401 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5399;
                    float _5403 = 1.0 / _5401;
                    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5425 = _5397 * _5403;
                    float _5427 = precise::clamp(_5425, 0.0, 1.0);
                    float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5431 = _5429 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5433 = fma(_5427, _5407, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5435 = fma(_5427, _5431, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5437 = fma(_5427, _5411, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5439 = fma(_5427, _5415, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5441 = fma(_5427, _5419, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5443 = fma(_5427, _5423, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5271 = _5435;
                    _5289 = _5441;
                    _5265 = _5433;
                    _5283 = _5439;
                    _5277 = _5437;
                    _5297 = _5443;
                    _5359 = true;
                }
                else
                {
                    _5271 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5289 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5265 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5283 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5297 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5359 = false;
    float _5445 = _5271;
    float _5447 = _5289;
    float _5449 = _5265;
    float _5451 = _5283;
    float _5453 = _5277;
    float _5455 = _5297;
    float _5457 = fma(_4038, -0.5, 0.5);
    float _5459 = precise::clamp(_5457, 0.0, 1.0);
    float _5461 = -_5445;
    float _5463 = _5461 + _5447;
    float _5465 = -_5449;
    float _5467 = _5465 + _5451;
    float _5469 = -_5453;
    float _5471 = _5469 + _5455;
    bool _5473 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5475 = fma(_5459, _5463, _5445);
    float _5477 = fma(_5459, _5467, _5449);
    float _5479 = fma(_5459, _5471, _5453);
    float _5481 = _5475 * 0.586610972881317138671875;
    out.m_108.x = 0.0;
    float _5483 = fma(_5477, 0.298911988735198974609375, _5481);
    float _5485 = fma(_5479, 0.114477999508380889892578125, _5483);
    float _5487 = -_5485;
    float _5489 = _5477 + _5487;
    float _5491 = -_5485;
    float _5493 = _5475 + _5491;
    float _5495 = -_5485;
    float _5497 = _5479 + _5495;
    float _5499 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5501 = fma(_5489, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    float _5503 = fma(_5493, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    float _5505 = fma(_5497, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    out.m_67.x = _5499;
    out.m_110.x = _5501;
    out.m_110.y = _5503;
    out.m_110.z = _5505;
    if (!_5473)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5507 = -_4262;
    float _5509 = _5507 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5511 = -_4266;
    float _5513 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5515 = -_4272;
    float _5517 = _5515 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5519 = _5509 * _5509;
    float _5521 = fma(_5513, _5513, _5519);
    float _5523 = fma(_5517, _5517, _5521);
    float _5525 = sqrt(_5523);
    float _5527 = rsqrt(_5523);
    float _5529 = -_5525;
    float _5531 = _5529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5533 = _5531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5535 = precise::clamp(_5533, 0.0, 1.0);
    float _5537 = _5513 * _5527;
    float _5539 = _5509 * _5527;
    float _5541 = abs(_5535);
    float _5543 = log2(_5541);
    float _5545 = _5517 * _5527;
    float _5547 = _5537 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5549 = _4038 * _5539;
    float _5551 = -_5539;
    float _5553 = -_5547;
    float _5555 = fma(_5551, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5553);
    float _5557 = fma(_4036, _5537, _5549);
    float _5559 = -_5545;
    float _5561 = fma(_5559, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5555);
    float _5563 = fma(_4040, _5545, _5557);
    float _5565 = precise::clamp(_5563, 0.0, 1.0);
    float _5567 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5569 = _5561 + _5567;
    float _5571 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5573 = _5569 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5575 = precise::clamp(_5573, 0.0, 1.0);
    float _5577 = exp2(_5571);
    float _5579 = _5577 * _5575;
    float _5581 = _5565 * _5579;
    float _5583 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5585 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5587 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_108.x = _5583;
    out.m_108.y = _5585;
    out.m_108.z = _5587;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5359 = false;
    bool _4094 = false;
    bool _675 = false;
    bool _531 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_60.w;
    float _126 = in.m_62.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_67.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5654 = as_type<float>(_153);
        out.gl_Position.z = _5654;
    }
    if (!_139)
    {
        return out;
    }
    bool _155 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_126);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_131);
    bool _167 = _135 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _143;
    if (_171)
    {
        out.m_67.x = 0.0;
    }
    float _177 = _135 * _173;
    int _179 = 0;
    float _181 = _177;
    if (_171)
    {
        float _183 = _175 * 5.0;
        _179 = as_type<int>(_183);
    }
    int _185 = _179;
    out.m_65.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5717 = as_type<float>(_185);
        out.gl_Position.z = _5717;
    }
    if (_171)
    {
        return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_72.x;
    float _191 = in.m_72.y;
    float _193 = in.m_72.z;
    int _195 = as_type<int>(_187) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_187) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _205 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _207 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _209 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _211 = !_197;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _215);
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _217);
    float _229 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _231 = !_203;
    float _249;
    if (!_231)
    {
        float _233 = in.m_74.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        _249 = _177;
    }
    _251 = false;
    float _253 = _249;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _253 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _275 = 1.0 / _261;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _277;
    bool _281 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _283 = isnan(_253);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = 1.0 / _265;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _253 + _295;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _301 = 1.0 / _269;
    float _303 = _297 * _275;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = _253 + _305;
    float _309 = 1.0 / _273;
    float _311 = _257 * _293;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _253 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = _253 + _317;
    bool _321 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _323 = isnan(_253);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = 1.0 / _279;
    float _335 = _307 * _301;
    bool _337 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _339 = isnan(_253);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_347;
    float _351 = _349 + 1.0;
    float _353 = _315 * _309;
    float _355 = -_291;
    float _357 = _355 + 1.0;
    float _359 = _331 * _351;
    bool _361 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_253);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _347 * _357;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = _319 * _333;
    bool _385 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_253);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_331;
    float _399 = _397 + 1.0;
    float _401 = fma(_377, _303, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _403 = fma(_381, _303, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _405 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_253);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -_395;
    float _419 = _417 + 1.0;
    float _421 = _395 * _399;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = _371 * _419;
    float _433 = -_371;
    float _435 = _433 + 1.0;
    float _437 = -_415;
    float _439 = _437 + 1.0;
    float _441 = fma(_429, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_425, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _415 * _435;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _451;
    float _455 = _401 * _445;
    float _457 = _403 * _445;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _455);
    float _465 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _457);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = fma(_449, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_453, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _475 = fma(_441, _431, _463);
    float _477 = fma(_443, _431, _465);
    float _479 = fma(_469, _353, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_461, _353, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _487;
    float _491 = fma(_471, _421, _475);
    float _493 = fma(_473, _421, _477);
    float _495 = fma(_485, _383, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _497 = fma(_489, _383, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _499 = fma(_479, _359, _491);
    float _501 = fma(_481, _359, _493);
    float _503 = fma(_495, _373, _499);
    float _505 = fma(_497, _373, _501);
    float _507 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[148].x, _503);
    float _509 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[148].y, _505);
    bool _511 = !_299;
    float _529;
    if (!_511)
    {
        float _513 = in.m_74.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        _529 = _177;
    }
    _531 = false;
    float _533 = _529;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_533);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _561 = isnan(_533);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    bool _575 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_533);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = -_553;
    float _591 = _589 + 1.0;
    bool _593 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _595 = _569 * _591;
    float _597 = -_569;
    float _599 = _597 + 1.0;
    float _601 = 1.0 / _557;
    float _603 = _573 * _587;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _609 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _611 = _607 * _601;
    float _613 = _609 * _595;
    float _615 = -_585;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _533 + _619;
    float _623 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _613);
    float _625 = _553 * _617;
    float _627 = fma(_611, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _631 = fma(_627, _625, _623);
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[117].x, _631);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _641 = in.m_76.x;
    float _643 = in.m_76.y;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _635;
    out.m_78.y = _649;
    out.m_78.z = _645;
    out.m_78.w = _647;
    float _651 = _509 * _643;
    float _653 = _507 * _641;
    bool _655 = !_593;
    float _673;
    if (!_655)
    {
        float _657 = in.m_74.x;
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _661 = _657 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        _673 = _177;
    }
    _675 = false;
    float _677 = _673;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _681 = _677 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _695 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _697 = isnan(_677);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _685;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _713 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _715 = isnan(_677);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _727 = 1.0 / _693;
    float _729 = _689 * _707;
    bool _731 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _733 = isnan(_677);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _711;
    float _745 = -_705;
    float _747 = _745 + 1.0;
    float _749 = fma(_729, _681, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _755 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _757 = isnan(_677);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -_741;
    float _769 = _767 + 1.0;
    float _771 = _741 * _747;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _777 = 1.0 / _753;
    float _779 = -_765;
    float _781 = _779 + 1.0;
    float _783 = _723 * _769;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _785;
    float _789 = _775 * _727;
    float _791 = _705 * _781;
    float _793 = _749 * _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _797 = _677 + _795;
    float _799 = -_723;
    float _801 = _799 + 1.0;
    bool _803 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _805 = isnan(_677);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = _787 * _743;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _823 = _677 + _821;
    float _825 = fma(_789, _797, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _827 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[131].x, _793);
    float _829 = -_813;
    float _831 = _829 + 1.0;
    float _833 = _819 * _777;
    float _835 = fma(_815, _823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _839 = _677 + _837;
    float _841 = fma(_825, _771, _827);
    float _843 = _765 * _831;
    float _845 = fma(_833, _839, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _847 = fma(_835, _791, _841);
    float _849 = fma(_845, _843, _847);
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _857 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[135].x, _849);
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _859;
    out.m_80.y = _861;
    out.m_80.z = _863;
    out.m_80.w = _865;
    bool _867 = !_725;
    int _869 = as_type<int>(_793);
    float _871 = _791;
    if (!_867)
    {
        float _873 = in.m_74.x;
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _877 = _873 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _881 = _879 * _875;
        float _883 = floor(_881);
        float _885 = -_883;
        float _887 = _881 + _885;
        _181 = _887;
    }
    float _889 = _181;
    float _891 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _893 = int(_891);
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _897 = int(_895);
    float _899 = float(_893);
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _903 = int(_901);
    float _905 = float(_897);
    float _907 = 1.0 / _899;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _915 = int(_913);
    float _917 = float(uint(_903));
    int _919 = ~_903;
    int _921 = _919 + 1;
    float _923 = 1.0 / _905;
    float _925 = _907 * _135;
    if (_911)
    {
        _869 = 0;
    }
    int _927 = _869;
    float _929 = _907;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _933 = _927;
    if (_911)
    {
        float _935 = in.m_74.x;
        float _937 = in.m_74.y;
        _929 = _935;
        _931 = _937;
    }
    float _939 = _929;
    float _941 = _931;
    if (_911)
    {
        _871 = 1.0;
    }
    float _943 = _871;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _947 = int(_945);
    float _949 = float(uint(_915));
    int _951 = ~_915;
    int _953 = _951 + 1;
    float _955 = 1.0 / _917;
    float _957 = _923 * _135;
    float _959 = trunc(_925);
    int _961 = int(_959);
    float _963 = float(_947);
    float _965 = 0.0;
    float _967 = _963;
    float _969 = _939;
    float _971 = _943;
    float _973 = _941;
    if (_911)
    {
        _965 = _941;
    }
    float _975 = _965;
    float _977 = 1.0 / _949;
    int _979 = as_type<int>(_955) + (-2);
    float _981 = _955;
    float _983 = _975;
    if (_911)
    {
        _981 = _939;
    }
    float _985 = _981;
    float _987 = 0.0;
    float _989 = _985;
    if (_911)
    {
        _987 = _985;
    }
    float _991 = _987;
    float _993 = trunc(_957);
    int _995 = int(_993);
    float _997 = float(uint(_961));
    float _999 = as_type<float>(_979) * _997;
    int _1001 = as_type<int>(_977) + (-2);
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1005 = int(_1003);
    float _1007 = float(uint(_995));
    float _1009 = trunc(_999);
    float _1011 = precise::max(_1009, 0.0);
    uint _1014 = uint(_1011);
    float _1016 = as_type<float>(_1001) * _1007;
    float _1018 = _1007;
    float _1020 = _991;
    if (_911)
    {
        _1018 = 1.0;
    }
    float _1022 = _1018;
    float _1024 = trunc(_1016);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = 1.0 / _963;
    int _1032 = _921 * int(_1014);
    int _1034 = _1032 + _961;
    float _1036 = _1022;
    if (_911)
    {
        _967 = _985;
    }
    float _1038 = _967;
    float _1040 = _1038;
    if (!_911)
    {
        float _1042 = in.m_74.x;
        float _1044 = in.m_74.y;
        float _1046 = in.m_74.z;
        float _1048 = _1042 * 3.1415927410125732421875;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = _1044 * 3.1415927410125732421875;
        float _1054 = _1052 * 0.15915493667125701904296875;
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1036 = 7.345489978790283203125;
        _969 = _1042;
        _971 = 5.839270114898681640625;
        _1040 = _1046;
        _973 = _1044;
        _989 = _1044;
        _983 = _1062;
        _933 = 2;
        _1020 = _1058;
    }
    float _1064 = _1036;
    float _1066 = _969;
    float _1068 = _971;
    float _1070 = _1040;
    float _1072 = _973;
    float _1074 = _989;
    float _1076 = _983;
    int _1078 = _933;
    float _1080 = _1020;
    int _1082 = _953 * int(_1028);
    int _1084 = _1082 + _995;
    float _1086 = float(uint(_1034));
    float _1088 = _1064 * _1066;
    float _1090 = _1068 * _1070;
    int _1092 = ~_903;
    int _1094 = _1092 + 1;
    float _1096 = _1030 * _135;
    float _1098 = float(uint(_1084));
    float _1100 = as_type<float>(_979) * _1086;
    float _1102 = floor(_1088);
    float _1104 = float(uint(_1005));
    float _1106 = _173 * _135;
    float _1108 = as_type<float>(_1001) * _1098;
    int _1110 = ~_915;
    int _1112 = _1110 + 1;
    float _1114 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1116 = ~_1005;
    int _1118 = _1116 + 1;
    float _1120 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = trunc(_1100);
    float _1124 = precise::max(_1122, 0.0);
    uint _1126 = uint(_1124);
    bool _1128 = _903 == 0;
    float _1130 = trunc(_1108);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    float _1136 = -_1102;
    float _1138 = _1088 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = floor(_1090);
    int _1154 = int(_1014) + int(_1126);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1156;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1162 = 1.0 / _1104;
    int _1164 = int(_1028) + int(_1134);
    int _1166 = _1094 * _1154;
    int _1168 = _1166 + _961;
    float _1170 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1160);
    float _1172 = float(_903);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1176 = uint(_1168) >= uint(_903);
    float _1178 = trunc(_1096);
    int _1180 = int(_1178);
    int _1182 = _1112 * _1164;
    int _1184 = _1182 + _995;
    float _1186 = _1138 * _1172;
    float _1188 = float(_915);
    float _1190 = -_1152;
    float _1192 = _1090 + _1190;
    float _1194 = _1064 * _1074;
    bool _1196 = uint(_1184) >= uint(_915);
    float _1198 = in.m_74.z;
    float _1200 = trunc(_1186);
    int _1202 = int(_1200);
    float _1204 = _1192 * _1188;
    int _1206 = as_type<int>(_1162) + (-2);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1212 = _1210 != 0;
    float _1214 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1174);
    bool _1216 = !_1176;
    int _1218 = _1216 ? 0 : (-1);
    float _1220 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1222 = float(uint(_1180));
    float _1224 = trunc(_1204);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1230 = _1228 != 0;
    float _1232 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1214);
    bool _1234 = !_1212;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = as_type<float>(_1206) * _1222;
    int _1240 = ~_1154;
    int _1242 = _1240 + _1218;
    int _1244 = _1242 + 1;
    float _1246 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1170);
    float _1248 = float(_961);
    float _1250 = trunc(_1238);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    bool _1256 = !_1230;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = -_1246;
    float _1262 = _1260 + 1.0;
    int _1264 = abs(_1236);
    bool _1266 = !_1196;
    int _1268 = _1266 ? 0 : (-1);
    bool _1270 = _1248 >= _1172;
    bool _1272 = isnan(_1248);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(_1172);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = 1.0 / _1142;
    int _1284 = abs(_1258);
    int _1286 = ~_1164;
    int _1288 = _1286 + _1268;
    int _1290 = _1288 + 1;
    int _1292 = _1202 * _1264;
    int _1294 = _1292 + _961;
    bool _1296 = _1198 > 0.5;
    int _1298 = _903 * _1244;
    int _1300 = _1298 + _961;
    float _1302 = trunc(_1280);
    int _1304 = int(_1302);
    int _1306 = _1226 * _1284;
    int _1308 = _1306 + _995;
    bool _1310 = _1072 > 0.5;
    int _1312 = _915 * _1290;
    int _1314 = _1312 + _995;
    float _1316 = float(_995);
    int _1318 = _1118 * int(_1254);
    int _1320 = _1318 + _1180;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1328 = _1326 != 0;
    float _1330 = _1072 * 2.0;
    bool _1332 = _1316 >= _1188;
    bool _1334 = isnan(_1316);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1188);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_223;
    int _1346 = _1296 ? as_type<int>(_1344) : as_type<int>(_223);
    float _1348 = -_213;
    int _1350 = _1310 ? as_type<int>(_1348) : as_type<int>(_213);
    float _1352 = trunc(_1342);
    int _1354 = int(_1352);
    float _1356 = float(uint(_1320));
    bool _1358 = !_1328;
    float _1360 = _1358 ? _223 : as_type<float>(_1346);
    int _1362 = ~_1304;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    float _1368 = as_type<float>(_1206) * _1356;
    bool _1370 = !_1128;
    int _1372 = _1370 ? _1300 : (-1);
    float _1374 = _1172 * _1106;
    bool _1376 = !_1324;
    float _1378 = _1376 ? _213 : as_type<float>(_1350);
    float _1380 = floor(_1330);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1392 = _1390 != 0;
    int _1394 = _1372 * _1366;
    int _1396 = _903 + (-1);
    bool _1398 = _915 == 0;
    bool _1400 = !_1388;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = trunc(_1374);
    int _1406 = int(_1404);
    bool _1408 = !_1384;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = _1304 * _1396;
    int _1414 = _1412 + _1394;
    int _1416 = abs(_1402);
    int _1418 = abs(_1410);
    float _1420 = trunc(_1368);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1354;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    bool _1432 = !_1398;
    int _1434 = _1432 ? _1314 : (-1);
    int _1436 = _1414 * _1416;
    int _1438 = _915 + (-1);
    bool _1440 = !_1392;
    int _1442 = _1440 ? 0 : 1;
    int _1444 = _1434 * _1430;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1456 = _1454 != 0;
    int _1458 = _1406 * _1418;
    int _1460 = _1458 + _1436;
    float _1462 = _1188 * _1106;
    int _1464 = _1354 * _1438;
    int _1466 = _1464 + _1444;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1470 = _1468 != 0;
    bool _1472 = !_1452;
    int _1474 = _1472 ? 0 : 1;
    bool _1476 = !_1448;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = trunc(_1462);
    int _1482 = int(_1480);
    int _1484 = abs(_1474);
    bool _1486 = !_1470;
    int _1488 = _1486 ? 0 : 1;
    int _1490 = abs(_1442);
    int _1492 = abs(_1478);
    int _1494 = abs(_1488);
    int _1496 = int(_1254) + int(_1424);
    int _1498 = _1294 * _1490;
    int _1500 = _1498 + _1460;
    float _1502 = floor(_1194);
    int _1504 = ~_1005;
    int _1506 = _1504 + 1;
    int _1508 = _1202 * _1494;
    int _1510 = _1508 + _1500;
    int _1512 = _1466 * _1484;
    int _1514 = int(_1470);
    int _1516 = _1230 ? 2 : 0;
    int _1518 = _1514 | _1516;
    int _1520 = _1310 ? 4 : 0;
    int _1522 = _1518 | _1520;
    int _1524 = _1196 ? 8 : 0;
    int _1526 = _1522 | _1524;
    int _1528 = _1448 ? 16 : 0;
    int _1530 = _1526 | _1528;
    int _1532 = _1452 ? 32 : 0;
    int _1534 = _1530 | _1532;
    int _1536 = _1456 ? 64 : 0;
    int _1538 = _1534 | _1536;
    int _1540 = _1538 & 4;
    int _1542 = _1506 * _1496;
    int _1544 = _1542 + _1180;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1548 = _1546 != 0;
    int _1550 = _1482 * _1492;
    int _1552 = _1550 + _1512;
    float _1554 = float(uint(_1510));
    bool _1556 = !_1456;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = uint(_1544) >= uint(_1005);
    float _1562 = as_type<float>(_979) * _1554;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1566 = _1564 != 0;
    float _1568 = -_1502;
    float _1570 = _1194 + _1568;
    bool _1572 = _1540 != 0;
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    bool _1580 = !_1548;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = abs(_1558);
    bool _1586 = !_1566;
    int _1588 = _1586 ? 0 : 1;
    bool _1590 = !_1560;
    int _1592 = _1590 ? 0 : (-1);
    int _1594 = _1308 * _1584;
    int _1596 = _1594 + _1552;
    int _1598 = abs(_1582);
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1610 = _1608 != 0;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1614 = _1612 != 0;
    float _1616 = float(_1005);
    float _1618 = float(_1180);
    float _1620 = _1570 * _1616;
    bool _1622 = !_1606;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1628 = _1626 != 0;
    int _1630 = _1226 * _1598;
    int _1632 = _1630 + _1596;
    bool _1634 = _1618 >= _1616;
    bool _1636 = isnan(_1618);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(_1616);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = trunc(_1620);
    int _1648 = int(_1646);
    int _1650 = ~_903;
    int _1652 = _1650 + 1;
    float _1654 = _1616 * _1106;
    int _1656 = ~_1496;
    int _1658 = _1656 + _1592;
    int _1660 = _1658 + 1;
    float _1662 = float(uint(_1632));
    float _1664 = trunc(_1644);
    int _1666 = int(_1664);
    bool _1668 = !_1602;
    float _1670 = _1668 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1672 = _1652 * int(_1578);
    int _1674 = _1672 + _1510;
    float _1676 = _1562;
    float _1678 = _1670;
    if (_1628)
    {
        float _1680 = in.m_74.w;
        _1676 = _1680;
    }
    float _1682 = _1676;
    bool _1684 = _1005 == 0;
    float _1686 = as_type<float>(_1001) * _1662;
    int _1688 = abs(_1588);
    float _1690 = float(uint(_1674));
    int _1692 = _1005 * _1660;
    int _1694 = _1692 + _1180;
    float _1696 = trunc(_1686);
    float _1698 = precise::max(_1696, 0.0);
    uint _1700 = uint(_1698);
    int _1702 = _1005 + (-1);
    float _1704 = as_type<float>(_979) * _1690;
    bool _1706 = !_1684;
    int _1708 = _1706 ? _1694 : (-1);
    int _1710 = ~_1666;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = abs(_1624);
    float _1718 = trunc(_1704);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1708 * _1714;
    int _1726 = ~_915;
    int _1728 = _1726 + 1;
    int _1730 = _1666 * _1702;
    int _1732 = _1730 + _1724;
    bool _1734 = !_1610;
    int _1736 = _1734 ? 0 : 1;
    float _1738 = trunc(_1654);
    int _1740 = int(_1738);
    int _1742 = _1648 * _1688;
    int _1744 = _1742 + _1180;
    int _1746 = _1732 * _1716;
    float _1748 = as_type<float>(_1732);
    if (_1628)
    {
        float _1750 = _1682 * 3.1415927410125732421875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = abs(as_type<int>(_1670));
    int _1756 = _1728 * int(_1700);
    int _1758 = _1756 + _1632;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1762 = _1760 != 0;
    if (_1628)
    {
        float _1764 = _1752 * 0.15915493667125701904296875;
        _1678 = _1764;
    }
    float _1766 = _1678;
    int _1768 = ~_903;
    int _1770 = _1768 + 1;
    int _1772 = int(_1578) + int(_1722);
    float _1774 = _1766;
    if (_1628)
    {
        float _1776 = _1766 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        _1774 = _1778;
    }
    float _1780 = _1774;
    float _1782 = float(uint(_1758));
    int _1784 = _1740 * _1754;
    int _1786 = _1784 + _1746;
    bool _1788 = !_1614;
    int _1790 = _1788 ? 0 : 1;
    int _1792 = _1770 * _1772;
    int _1794 = _1792 + _1510;
    int _1796 = abs(_1736);
    float _1798 = as_type<float>(_1001) * _1782;
    int _1800 = abs(_1790);
    float _1802 = as_type<float>(_1740);
    if (_1762)
    {
        float _1804 = in.m_74.x;
        _1802 = _1804;
    }
    float _1806 = _1802;
    bool _1808 = uint(_1794) >= uint(_903);
    float _1810 = trunc(_1798);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    float _1816 = float(uint(_1294));
    int _1818 = _1744 * _1796;
    int _1820 = _1818 + _1786;
    bool _1822 = !_1808;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = as_type<float>(_979) * _1816;
    bool _1828 = _903 == 0;
    int _1830 = _1648 * _1800;
    int _1832 = _1830 + _1820;
    int _1834 = ~_1772;
    int _1836 = _1834 + _1824;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1826);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    bool _1846 = _1808;
    float _1848 = _1780;
    if (_1628)
    {
        bool _1850 = _1780 > 0.5;
        _1846 = _1850;
    }
    bool _1852 = _1846;
    float _1854 = float(uint(_1832));
    int _1856 = _903 * _1838;
    int _1858 = _1856 + _1510;
    int _1860 = int(_1700) + int(_1814);
    int _1862 = ~_903;
    int _1864 = _1862 + 1;
    float _1866 = as_type<float>(_1206) * _1854;
    float _1868 = float(uint(_1308));
    if (_1762)
    {
        float _1870 = _1806 * 3.1415927410125732421875;
        _1848 = _1870;
    }
    float _1872 = _1848;
    bool _1874 = !_1828;
    int _1876 = _1874 ? _1858 : (-1);
    float _1878 = trunc(_1866);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    float _1884 = 0.0;
    float _1886 = _1872;
    if (!_1628)
    {
        _1884 = _213;
    }
    float _1888 = _1884;
    float _1890 = as_type<float>(_1001) * _1868;
    float _1892 = _1888;
    if (_1628)
    {
        float _1894 = -_213;
        float _1896 = _1852 ? _1894 : _213;
        _1892 = _1896;
    }
    float _1898 = _1892;
    int _1900 = _1864 * int(_1844);
    int _1902 = _1900 + _1294;
    int _1904 = ~_915;
    int _1906 = _1904 + 1;
    if (_1762)
    {
        float _1908 = _1872 * 0.15915493667125701904296875;
        _1886 = _1908;
    }
    float _1910 = _1886;
    int _1912 = _1876 & 3;
    bool _1914 = _1912 != 0;
    float _1916 = trunc(_1890);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = _1876 & 3;
    bool _1924 = _1922 != 0;
    float _1926 = float(uint(_1902));
    int _1928 = _1914 ? 0 : 1;
    float _1930 = as_type<float>(_979) * _1926;
    bool _1932 = uint(_1922) > 1u;
    float _1934 = as_type<float>(_979);
    if (_1762)
    {
        float _1936 = _1910 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        _1934 = _1938;
    }
    float _1940 = _1934;
    int _1942 = ~_1005;
    int _1944 = _1942 + 1;
    int _1946 = _1906 * _1860;
    int _1948 = _1946 + _1632;
    int _1950 = ~_1928;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    int _1956 = ~_915;
    int _1958 = _1956 + 1;
    int _1960 = _1944 * int(_1882);
    int _1962 = _1960 + _1832;
    bool _1964 = uint(_1948) >= uint(_915);
    float _1966 = trunc(_1930);
    float _1968 = precise::max(_1966, 0.0);
    uint _1970 = uint(_1968);
    float _1972 = -_223;
    int _1974 = _1572 ? as_type<int>(_1972) : as_type<int>(_223);
    float _1976 = float(uint(_1962));
    int _1978 = _1954;
    if (!_1932)
    {
        int _1980 = ~_1928;
        int _1982 = _1980 + 1;
        _1978 = _1982;
    }
    int _1984 = _1978;
    int _1986 = _1958 * int(_1920);
    int _1988 = _1986 + _1308;
    bool _1990 = !_1964;
    int _1992 = _1990 ? 0 : (-1);
    bool _1994 = _1922 != 3;
    bool _1996 = uint(_1922) >= 2u;
    int _1998 = ~_1860;
    int _2000 = _1998 + _1992;
    int _2002 = _2000 + 1;
    float _2004 = as_type<float>(_1206) * _1976;
    int _2006 = _1996 ? 0 : 1;
    bool _2008 = _1996;
    if (_1762)
    {
        bool _2010 = _1940 > 0.5;
        _2008 = _2010;
    }
    bool _2012 = _2008;
    int _2014 = _915 * _2002;
    int _2016 = _2014 + _1632;
    float _2018 = trunc(_2004);
    float _2020 = precise::max(_2018, 0.0);
    uint _2022 = uint(_2020);
    bool _2024 = _915 == 0;
    int _2026 = ~_2006;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = _2030;
    if (_1994)
    {
        int _2034 = ~_2006;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    bool _2040 = !_2024;
    int _2042 = _2040 ? _2016 : (-1);
    float _2044 = 0.0;
    if (!_1762)
    {
        _2044 = _223;
    }
    float _2046 = _2044;
    float _2048 = float(uint(_1988));
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2052 = _2050 != 0;
    float _2054 = _2046;
    if (_1762)
    {
        float _2056 = -_223;
        float _2058 = _2012 ? _2056 : _223;
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = as_type<float>(_1001) * _2048;
    int _2064 = _2042 & 3;
    bool _2066 = _2064 != 0;
    bool _2068 = !_2052;
    float _2070 = _2068 ? _223 : as_type<float>(_1974);
    float _2072 = _2060 + (-0.5);
    bool _2074 = uint(_2064) > 1u;
    float _2076 = trunc(_2062);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    int _2082 = ~_1005;
    int _2084 = _2082 + 1;
    int _2086 = _2042 & 3;
    bool _2088 = _2086 != 0;
    int _2090 = int(_1882) + int(_2022);
    int _2092 = int(_1844) + int(_1970);
    int _2094 = ~_903;
    int _2096 = _2094 + 1;
    int _2098 = _2084 * _2090;
    int _2100 = _2098 + _1832;
    int _2102 = _2088 ? 0 : 1;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2106 = _2104 != 0;
    int _2108 = _2096 * _2092;
    int _2110 = _2108 + _1294;
    float _2112 = float(uint(_1744));
    bool _2114 = !_2106;
    int _2116 = _2114 ? 0 : 1;
    int _2118 = ~_2102;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    bool _2124 = uint(_2100) >= uint(_1005);
    int _2126 = _2122;
    if (!_2074)
    {
        int _2128 = ~_2102;
        int _2130 = _2128 + 1;
        _2126 = _2130;
    }
    int _2132 = _2126;
    float _2134 = as_type<float>(_1206) * _2112;
    bool _2136 = uint(_2110) >= uint(_903);
    bool _2138 = !_2124;
    int _2140 = _2138 ? 0 : (-1);
    float _2142 = trunc(_2134);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    bool _2148 = _2064 != 3;
    bool _2150 = !_2136;
    int _2152 = _2150 ? 0 : (-1);
    bool _2154 = uint(_2064) >= 2u;
    int _2156 = ~_2090;
    int _2158 = _2156 + _2140;
    int _2160 = _2158 + 1;
    int _2162 = ~_915;
    int _2164 = _2162 + 1;
    int _2166 = int(_1920) + int(_2080);
    int _2168 = _1005 * _2160;
    int _2170 = _2168 + _1832;
    int _2172 = _2154 ? 0 : 1;
    int _2174 = ~_1005;
    int _2176 = _2174 + 1;
    int _2178 = _2164 * _2166;
    int _2180 = _2178 + _1308;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2184 = _2182 != 0;
    int _2186 = ~_2172;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2190;
    if (_2148)
    {
        int _2194 = ~_2172;
        int _2196 = _2194 + 1;
        _2192 = _2196;
    }
    int _2198 = _2192;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2202 = _2200 != 0;
    bool _2204 = !_2184;
    int _2206 = _2204 ? 0 : 1;
    bool _2208 = uint(_2180) >= uint(_915);
    int _2210 = _2176 * int(_2146);
    int _2212 = _2210 + _1744;
    bool _2214 = !_1684;
    int _2216 = _2214 ? _2170 : (-1);
    bool _2218 = !_2202;
    int _2220 = _2218 ? 0 : 1;
    bool _2222 = !_2208;
    int _2224 = _2222 ? 0 : (-1);
    int _2226 = _2216 & 3;
    bool _2228 = _2226 != 0;
    int _2230 = _2216 & 3;
    bool _2232 = _2230 != 0;
    float _2234 = float(uint(_2212));
    int _2236 = _2228 ? 0 : 1;
    bool _2238 = uint(_2230) > 1u;
    float _2240 = as_type<float>(_1206) * _2234;
    int _2242 = ~_2236;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    float _2248 = trunc(_2240);
    float _2250 = precise::max(_2248, 0.0);
    uint _2252 = uint(_2250);
    int _2254 = ~_2166;
    int _2256 = _2254 + _2224;
    int _2258 = _2256 + 1;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2262 = _2260 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2268 = abs(_2206);
    float _2270 = 1.0 / _2262;
    int _2272 = _2246;
    float _2274 = as_type<float>(_2198);
    if (!_2238)
    {
        int _2276 = ~_2236;
        int _2278 = _2276 + 1;
        _2272 = _2278;
    }
    int _2280 = _2272;
    int _2282 = _915 * _2258;
    int _2284 = _2282 + _1308;
    bool _2286 = uint(_2230) >= 2u;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2290 = _889 + _2288;
    bool _2292 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2294 = isnan(_889);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2300 = _2296 || _2298;
    float _2302 = float(_2300);
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2306 = _2286 ? 0 : 1;
    float _2308 = 1.0 / _2266;
    bool _2310 = _2230 != 3;
    float _2312 = -_2302;
    float _2314 = _2312 + 1.0;
    int _2316 = int(_2146) + int(_2252);
    float _2318 = fma(_1220, -2.0, _2304);
    int _2320 = ~_2306;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _1944 * _2316;
    int _2328 = _2326 + _1744;
    float _2330 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2318);
    int _2332 = ~_2092;
    int _2334 = _2332 + _2152;
    int _2336 = _2334 + 1;
    float _2338 = -_2072;
    float _2340 = -_2330;
    float _2342 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2340);
    int _2344 = _2324;
    if (_2310)
    {
        int _2346 = ~_2306;
        int _2348 = _2346 + 1;
        _2344 = _2348;
    }
    int _2350 = _2344;
    bool _2352 = uint(_2328) >= uint(_1005);
    float _2354 = in.m_60.x;
    float _2356 = in.m_60.y;
    float _2358 = in.m_60.z;
    int _2360 = _903 * _2336;
    int _2362 = _2360 + _1294;
    int _2364 = abs(_1984);
    bool _2366 = !_2352;
    int _2368 = _2366 ? 0 : (-1);
    bool _2370 = _1066 > 0.5;
    int _2372 = ~_2316;
    int _2374 = _2372 + _2368;
    int _2376 = _2374 + 1;
    float _2378 = -_213;
    int _2380 = _2370 ? as_type<int>(_2378) : as_type<int>(_213);
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2384 = _2382 != 0;
    float _2386 = _1066 * 2.0;
    int _2388 = _1005 * _2376;
    int _2390 = _2388 + _1744;
    int _2392 = ~_2364;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    bool _2398 = !_2384;
    float _2400 = _2398 ? _213 : as_type<float>(_2380);
    float _2402 = floor(_2386);
    bool _2404 = _1078 != 2;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2410 = abs(_2280);
    float _2412 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2414 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2416 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2418 = 1.0 / _2408;
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2412);
    float _2422 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2414);
    float _2424 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2416);
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2428 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2430 = 0.0;
    if (_2404)
    {
        _2430 = _1066;
    }
    float _2432 = _2430;
    float _2434 = 1.0 / _2428;
    float _2436 = 0.0;
    float _2438 = _2432;
    if (_2404)
    {
        _2436 = _1072;
    }
    float _2440 = _2436;
    float _2442 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2444 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2442;
    float _2446 = _2440;
    if (!_2404)
    {
        _2438 = _1198;
    }
    float _2448 = _2438;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2452 = _2450 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (!_2404)
    {
        _2446 = _1066;
    }
    float _2454 = _2446;
    float _2456 = _2444 * _2270;
    bool _2458 = _2402 >= 0.0;
    bool _2460 = isnan(_2402);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.0);
    bool _2466 = _2462 || _2464;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2468;
    float _2472 = _2452 * _2308;
    int _2474 = _2466 ? 0 : 1;
    float _2476 = _2470 * _1282;
    bool _2478 = _2402 > 0.0;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2484 = ~_2474;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = _1146 * _2434;
    float _2492 = fma(_2476, _2290, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2496 = _889 + _2494;
    float _2498 = 1.0 / _2482;
    float _2500 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2506 = _1198 * 2.0;
    float _2508 = fma(_2490, _2496, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2512 = _889 + _2510;
    int _2514 = _2488;
    if (!_2478)
    {
        int _2516 = ~_2474;
        int _2518 = _2516 + 1;
        _2514 = _2518;
    }
    int _2520 = _2514;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2526 = _1380 >= 0.0;
    bool _2528 = isnan(_1380);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    float _2536 = floor(_2506);
    int _2538 = ~_2410;
    int _2540 = _2538 + 1;
    int _2542 = _2540 + 1;
    float _2544 = _2524 * _2418;
    int _2546 = _2534 ? 0 : 1;
    bool _2548 = _1380 > 0.0;
    bool _2550 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2552 = isnan(_889);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2558);
    float _2562 = 1.0 / _2504;
    float _2564 = _1150 * _2498;
    int _2566 = ~_2546;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = -_2560;
    float _2574 = _2572 + 1.0;
    bool _2576 = !_2232;
    int _2578 = _2576 ? 0 : 1;
    int _2580 = abs(_2350);
    bool _2582 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2584 = isnan(_889);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    int _2594 = _2570;
    if (!_2548)
    {
        int _2596 = ~_2546;
        int _2598 = _2596 + 1;
        _2594 = _2598;
    }
    int _2600 = _2594;
    bool _2602 = !_2024;
    int _2604 = _2602 ? _2284 : (-1);
    float _2606 = _2592 * _2574;
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2610 = _2608 != 0;
    int _2612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2614 = _2612 != 0;
    int _2616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2618 = _2616 != 0;
    float _2620 = -_2592;
    float _2622 = _2620 + 1.0;
    bool _2624 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2626 = isnan(_889);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = _1158 * _2562;
    bool _2638 = !_1924;
    int _2640 = _2638 ? 0 : 1;
    float _2642 = _2302 * _2622;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2646 = _889 + _2644;
    bool _2648 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2650 = isnan(_889);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2656 = _2652 || _2654;
    float _2658 = float(_2656);
    float _2660 = _2634 * _2314;
    bool _2662 = _2536 >= 0.0;
    bool _2664 = isnan(_2536);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = -_2634;
    float _2674 = _2672 + 1.0;
    float _2676 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2420);
    float _2678 = fma(_2456, _2646, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2680 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2424);
    bool _2682 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2684 = isnan(_889);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -_2658;
    float _2696 = _2694 + 1.0;
    int _2698 = _2670 ? 0 : 1;
    float _2700 = fma(_2636, _2512, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2702 = _2536 > 0.0;
    float _2704 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2422);
    bool _2706 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2708 = isnan(_889);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2692 * _2696;
    float _2720 = -_2692;
    float _2722 = _2720 + 1.0;
    float _2724 = _2658 * _2674;
    bool _2726 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2728 = isnan(_889);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = -_2716;
    float _2740 = _2738 + 1.0;
    float _2742 = _2716 * _2722;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2746 = _889 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2750 = _889 + _2748;
    float _2752 = _2736 * _2740;
    float _2754 = -_2736;
    float _2756 = _2754 + 1.0;
    float _2758 = fma(_2472, _2746, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2762 = _889 + _2760;
    float _2764 = _2678 * _2752;
    int _2766 = _2042 >> 31;
    float _2768 = fma(_2564, _2750, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2770 = fma(_2544, _2762, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2772 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2764);
    int _2774 = _2766 & 3;
    float _2776 = _1072 + _1066;
    int _2778 = ~_2698;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    float _2784 = _1072 + (-0.5);
    int _2786 = _2782;
    if (!_2702)
    {
        int _2788 = ~_2698;
        int _2790 = _2788 + 1;
        _2786 = _2790;
    }
    int _2792 = _2786;
    float _2794 = fma(_2758, _2742, _2772);
    int _2796 = _2042 + _2774;
    float _2798 = _1066 + (-0.5);
    float _2800 = _2680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2802 = _2704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2808 = _2796 >> 2;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2812 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2804);
    float _2814 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2806);
    float _2816 = _1066 + _1198;
    float _2818 = -_2810;
    float _2820 = fma(_1114, 2.0, _2818);
    float _2822 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2824 = _1072 + _1198;
    int _2826 = _2808 << 4;
    int _2828 = _2826 + 656;
    float _2830 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2822);
    float _2832 = fma(_2492, _2718, _2794);
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    uint _2836 = uint(int(uint(_2828) >> uint(2)));
    uint _2838 = uint(int(uint(int(_2836)) >> uint(2)));
    int _2840 = int(_2836) & 3;
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[int(_2838)][_2840];
    int _2844 = int(_2836) + 1;
    uint _2846 = uint(int(uint(_2844) >> uint(2)));
    int _2848 = _2844 & 3;
    float _2850 = (*spvDescriptorSet0.vp_c9)._m0[int(_2846)][_2848];
    float _2852 = fma(_2770, _2724, _2832);
    float _2854 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2834);
    float _2856 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2858 = _2776 + (-1.0);
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2864 = _2800 + _2862;
    float _2866 = -_1208;
    float _2868 = fma(_2856, 2.0, _2866);
    float _2870 = _2676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2872 = fma(_1120, -2.0, _2860);
    int _2874 = _2828 + 8;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2894 = _2802 + _2892;
    float _2896 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2898 = _2870 + _2896;
    float _2900 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2902 = _1898 + 0.5;
    float _2904 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2906 = -_135;
    float _2908 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2868);
    float _2910 = fma(_2508, _2660, _2852);
    float _2912 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2872);
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2904);
    bool _2916 = !_2066;
    int _2918 = _2916 ? 0 : 1;
    float _2920 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2908);
    bool _2922 = _2064 != 3;
    float _2924 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2914);
    int _2926 = abs(_2132);
    float _2928 = -_135;
    float _2930 = fma(_2928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2820);
    bool _2932 = !_2922;
    int _2934 = _2932 ? 0 : (-1);
    float _2936 = _2400 + 0.5;
    float _2938 = _2070 + (-0.5);
    bool _2940 = _2924 >= 0.0;
    float _2942 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2930);
    int _2944 = ~_2926;
    int _2946 = _2944 + 1;
    int _2948 = _2946 + 1;
    float _2950 = fma(_2768, _2642, _2910);
    int _2952 = abs(_2918);
    float _2954 = -_2938;
    float _2956 = -_2912;
    float _2958 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2956);
    int _2960 = abs(_2198);
    float _2962 = _2448 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2964 = ~_2952;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2854);
    int _2972 = ~_2960;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2812);
    float _2980 = -_2970;
    float _2982 = _2980 + 1.0;
    if (_2940)
    {
        _2274 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2984 = _2274;
    float _2986 = -_2978;
    float _2988 = _2986 + 1.0;
    bool _2990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2992 = isnan(0.0);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2998 = _2994 || _2996;
    int _3000 = _2948 * as_type<int>(_2850);
    float _3002 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3004 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3006 = int(_3004);
    int _3008 = _2968 * as_type<int>(_2842);
    int _3010 = _3008 + _3000;
    int _3012 = as_type<int>(_2984);
    if (_2940)
    {
        float _3014 = _2984 * 5.0;
        _3012 = as_type<int>(_3014);
    }
    int _3016 = _3012;
    int _3018 = abs(_2934);
    float _3020 = -_3002;
    float _3022 = fma(_2962, 2.0, _3020);
    float _3024 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2814);
    if (_2940)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9851 = as_type<float>(_3016);
        out.gl_Position.z = _9851;
    }
    int _3026 = _2976 * as_type<int>(_2882);
    int _3028 = _3026 + _3010;
    float _3030 = -_1232;
    float _3032 = _3030 + 1.0;
    float _3034 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3036 = log2(_3034);
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3040 = !_2610;
    int _3042 = _3040 ? 0 : 1;
    float _3044 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2830);
    float _3046 = -_135;
    float _3048 = fma(_3046, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3022);
    float _3050 = fma(_2500, -2.0, _3038);
    float _3052 = float(_2792);
    float _3054 = fma(_2700, _2606, _2950);
    bool _3056 = _1922 != 3;
    float _3058 = -_2982;
    float _3060 = fma(_3058, _1898, _2920);
    float _3062 = float(uint(_3006));
    float _3064 = fma(_3032, _2060, _2342);
    int _3066 = ~_3018;
    int _3068 = _3066 + 1;
    int _3070 = _3068 + 1;
    float _3072 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3050);
    float _3074 = 1.0 / _3062;
    int _3076 = ~_2268;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    out.m_82.x = _3060;
    out.m_82.y = _3064;
    int _3082 = _3070 * as_type<int>(_2890);
    int _3084 = _3082 + _3028;
    float _3086 = _3036 * _135;
    float _3088 = -_3024;
    float _3090 = _3088 + 1.0;
    int _3092 = _3084 * _3080;
    int _3094 = abs(_2578);
    float _3096 = exp2(_3086);
    int _3098 = abs(_3006);
    float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3102 = 1.0 + _3100;
    float _3104 = -_2988;
    float _3106 = fma(_2400, _3104, _2942);
    float _3108 = fma(_2070, _1262, _2958);
    int _3110 = _2604 * _2268;
    int _3112 = _3110 + _3092;
    int _3114 = _1876 >> 31;
    float _3116 = 1.0 / _3102;
    float _3118 = float(uint(_3098));
    out.m_84.x = _3106;
    out.m_84.y = _3108;
    int _3120 = as_type<int>(_3074) + (-2);
    float _3122 = -_3044;
    float _3124 = _3122 + 1.0;
    float _3126 = float(uint(_3112));
    float _3128 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3054);
    int _3130 = _3114 & 3;
    float _3132 = 1.0 / _3118;
    int _3134 = _2216 >> 31;
    float _3136 = as_type<float>(_3120) * _3126;
    int _3138 = _1876 + _3130;
    float _3140 = _2894 * _2894;
    float _3142 = -_3096;
    float _3144 = _3142 + 1.0;
    int _3146 = _3134 & 3;
    out.m_86.x = _3128;
    float _3148 = trunc(_3136);
    float _3150 = precise::max(_3148, 0.0);
    uint _3152 = uint(_3150);
    float _3154 = fma(_2898, _2898, _3140);
    float _3156 = _2998 ? _3144 : 0.0;
    float _3158 = 1.0;
    if (_2940)
    {
        out.m_67.x = 0.0;
    }
    int _3160 = _3138 >> 2;
    float _3162 = fma(_2864, _2864, _3154);
    int _3164 = abs(_3112);
    int _3166 = _2216 + _3146;
    int _3168 = as_type<int>(_3132) + (-2);
    float _3170 = rsqrt(_3162);
    int _3172 = _3160 << 4;
    int _3174 = _3172 + 368;
    float _3176 = float(uint(_3164));
    bool _3178 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3180 = isnan(1.0);
    bool _3182 = _3178 || _3180;
    bool _3184 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3186 = _3182 || _3184;
    uint _3188 = uint(int(uint(_3174) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    int _3204 = _3166 >> 2;
    float _3206 = as_type<float>(_3168) * _3176;
    int _3208 = ~_3006;
    int _3210 = _3208 + 1;
    int _3212 = _3204 << 4;
    int _3214 = _3212 + 800;
    int _3216 = ~_3094;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3210 * int(_3152);
    int _3224 = _3222 + _3112;
    uint _3226 = uint(int(uint(_3214) >> uint(2)));
    uint _3228 = uint(int(uint(int(_3226)) >> uint(2)));
    int _3230 = int(_3226) & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    int _3234 = int(_3226) + 1;
    uint _3236 = uint(int(uint(_3234) >> uint(2)));
    int _3238 = _3234 & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    float _3242 = trunc(_3206);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    bool _3248 = _903 == 0;
    if (_3186)
    {
        float _3250 = _3156 * _3116;
        _145 = _3250;
    }
    float _3252 = _145;
    float _3254 = float(uint(_3224));
    float _3256 = _2894 * _3170;
    int _3258 = abs(_3042);
    float _3260 = _2898 * _3170;
    int _3262 = _3214 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    float _3280 = as_type<float>(_3120) * _3254;
    int _3282 = ~_3098;
    int _3284 = _3282 + 1;
    float _3286 = -_3256;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2894);
    float _3290 = float(_3258);
    float _3292 = -_3260;
    float _3294 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2898);
    float _3296 = trunc(_3280);
    float _3298 = precise::max(_3296, 0.0);
    uint _3300 = uint(_3298);
    bool _3302 = !_3248;
    int _3304 = _3302 ? _2362 : (-1);
    float _3306 = _3290 * _3052;
    bool _3308 = !_1684;
    int _3310 = _3308 ? _2390 : (-1);
    int _3312 = _3174 + 8;
    uint _3314 = uint(int(uint(_3312) >> uint(2)));
    uint _3316 = uint(int(uint(int(_3314)) >> uint(2)));
    int _3318 = int(_3314) & 3;
    float _3320 = (*spvDescriptorSet0.vp_c9)._m0[int(_3316)][_3318];
    int _3322 = int(_3314) + 1;
    uint _3324 = uint(int(uint(_3322) >> uint(2)));
    int _3326 = _3322 & 3;
    float _3328 = (*spvDescriptorSet0.vp_c9)._m0[int(_3324)][_3326];
    int _3330 = _3284 * int(_3246);
    int _3332 = _3330 + _3164;
    float _3334 = _3288 * _3288;
    float _3336 = _3306 * (-2.0);
    bool _3338 = !_2618;
    int _3340 = _3338 ? 0 : 1;
    float _3342 = float(uint(_3332));
    float _3344 = fma(_3294, _3294, _3334);
    float _3346 = fma(_2900, _3336, _2900);
    float _3348 = as_type<float>(_3168) * _3342;
    int _3350 = int(_3152) + int(_3300);
    int _3352 = ~_3006;
    int _3354 = _3352 + 1;
    float _3356 = trunc(_3348);
    float _3358 = precise::max(_3356, 0.0);
    uint _3360 = uint(_3358);
    int _3362 = _3354 * _3350;
    int _3364 = _3362 + _3112;
    int _3366 = _2396 * as_type<int>(_3202);
    int _3368 = abs(_2640);
    int _3370 = ~_3098;
    int _3372 = _3370 + 1;
    int _3374 = ~_3368;
    int _3376 = _3374 + 1;
    int _3378 = _3376 + 1;
    int _3380 = _2542 * as_type<int>(_3240);
    bool _3382 = !_3056;
    int _3384 = _3382 ? 0 : (-1);
    int _3386 = _3378 * as_type<int>(_3194);
    int _3388 = _3386 + _3366;
    bool _3390 = uint(_3364) >= uint(_3006);
    int _3392 = _3220 * as_type<int>(_3232);
    int _3394 = _3392 + _3380;
    int _3396 = int(_3246) + int(_3360);
    bool _3398 = !_3390;
    int _3400 = _3398 ? 0 : (-1);
    int _3402 = abs(_2038);
    int _3404 = _3372 * _3396;
    int _3406 = _3404 + _3164;
    bool _3408 = _2230 != 3;
    int _3410 = ~_3402;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    bool _3416 = !_3408;
    int _3418 = _3416 ? 0 : (-1);
    bool _3420 = uint(_3406) >= uint(_3098);
    int _3422 = abs(_3384);
    int _3424 = _3414 * as_type<int>(_3320);
    int _3426 = _3424 + _3388;
    int _3428 = ~_3350;
    int _3430 = _3428 + _3400;
    int _3432 = _3430 + 1;
    int _3434 = _3006 * _3432;
    int _3436 = _3434 + _3112;
    bool _3438 = !_3420;
    int _3440 = _3438 ? 0 : (-1);
    int _3442 = _3112 ^ _3006;
    bool _3444 = _3006 == 0;
    int _3446 = ~_3422;
    int _3448 = _3446 + 1;
    int _3450 = _3448 + 1;
    int _3452 = ~_2580;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = abs(_3418);
    int _3460 = _3450 * as_type<int>(_3328);
    int _3462 = _3460 + _3426;
    uint _3464 = uint(int(uint(_3442) >> uint(31)));
    int _3466 = _3456 * as_type<int>(_3270);
    int _3468 = _3466 + _3394;
    bool _3470 = !_3444;
    int _3472 = _3470 ? _3436 : (-1);
    bool _3474 = _3006 == 0;
    float _3476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3478 = ~_3440;
    int _3480 = _3396 + _3478;
    int _3482 = _3480 + 1;
    int _3484 = ~int(_3464);
    int _3486 = _3484 + 1;
    int _3488 = abs(_2116);
    float _3490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3492 = ~_3458;
    int _3494 = _3492 + 1;
    int _3496 = _3494 + 1;
    int _3498 = _3482 ^ _3486;
    int _3500 = ~_3488;
    int _3502 = _3500 + 1;
    int _3504 = _3502 + 1;
    int _3506 = _3496 * as_type<int>(_3278);
    int _3508 = _3506 + _3468;
    int _3510 = abs(_2220);
    float _3512 = in.m_88.x;
    float _3514 = in.m_88.y;
    float _3516 = in.m_88.z;
    int _3518 = ~_3486;
    int _3520 = _3518 + _3498;
    int _3522 = _3520 + 1;
    int _3524 = _3462 * _3504;
    int _3526 = ~_3510;
    int _3528 = _3526 + 1;
    int _3530 = _3528 + 1;
    float _3532 = _3476 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3534 = !_3474;
    int _3536 = _3534 ? _3522 : (-1);
    int _3538 = _3304 * _3488;
    int _3540 = _3538 + _3524;
    float _3542 = float(_3472);
    int _3544 = _3508 * _3530;
    float _3546 = float(_3536);
    float _3548 = _3490 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3550 = float(_3540);
    float _3552 = fma(_3532, _3542, _3048);
    float _3554 = _1378 + 0.5;
    float _3556 = -_3072;
    float _3558 = fma(_3548, _3546, _3556);
    float _3560 = _1360 + (-0.5);
    out.m_90.x = _3550;
    float _3562 = fma(_3532, _3554, _3552);
    int _3564 = _3310 * _3510;
    int _3566 = _3564 + _3544;
    float _3568 = -_3548;
    float _3570 = fma(_3568, _3560, _3558);
    float _3572 = _2864 * _3170;
    float _3574 = -_3090;
    float _3576 = fma(_1378, _3574, _3562);
    float _3578 = float(_3566);
    float _3580 = fma(_1360, _3124, _3570);
    float _3582 = fma(_3336, _3512, _3512);
    bool _3584 = !_2614;
    int _3586 = _3584 ? 0 : 1;
    float _3588 = -_3572;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2864);
    out.m_90.w = _3578;
    int _3592 = abs(_3586);
    out.m_92.x = _3576;
    out.m_92.y = _3580;
    float _3594 = _3516;
    if (_2940)
    {
        return out;
    }
    float _3596 = -_3256;
    float _3598 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2802);
    float _3600 = float(_2520);
    float _3602 = -_3260;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2870);
    float _3606 = float(_3592);
    float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3610 = _3598 + _3608;
    float _3612 = fma(_3590, _3590, _3344);
    float _3614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3616 = _3604 + _3614;
    float _3618 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3620 = _3606 * _3600;
    float _3622 = -_3572;
    float _3624 = fma(_3622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2800);
    int _3626 = abs(_3340);
    float _3628 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3618);
    float _3630 = _2824 + (-1.0);
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3634 = _3624 + _3632;
    float _3636 = float(_2600);
    float _3638 = fma(_2798, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3582);
    float _3640 = float(_3626);
    float _3642 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3628);
    float _3644 = _3620 * (-2.0);
    float _3646 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3648 = _3640 * _3636;
    float _3650 = fma(_3644, _3514, _3514);
    bool _3652 = _3642 >= 0.0;
    float _3654 = fma(_3646, _3644, _3646);
    float _3656 = _2816 + (-1.0);
    float _3658 = fma(_2784, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3650);
    float _3660 = _3648 * (-2.0);
    float _3662 = fma(_3346, _3252, _3638);
    float _3664 = _1198 + (-0.5);
    float _3666 = fma(_3654, _3252, _3658);
    float _3668 = fma(_3656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3670 = fma(_3660, _3516, _3516);
    float _3672 = _3662 * 0.15915493667125701904296875;
    float _3674 = _3666 * 0.15915493667125701904296875;
    float _3676 = sqrt(_3612);
    float _3678 = _3604;
    if (_3652)
    {
        _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3680 = _3594;
    float _3682 = fma(_3664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3670);
    float _3684 = fma(_3668, _3660, _3668);
    int _3686 = as_type<int>(_3680);
    if (_3652)
    {
        out.m_67.x = 0.0;
    }
    if (_3652)
    {
        float _3688 = _3680 * 5.0;
        _3686 = as_type<int>(_3688);
    }
    int _3690 = _3686;
    float _3692 = fma(_3684, _3252, _3682);
    float _3694 = _3672 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    if (_3652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10844 = as_type<float>(_3690);
        out.gl_Position.z = _10844;
    }
    float _3698 = _3692 * 0.15915493667125701904296875;
    float _3700 = _3672 * 6.283185482025146484375;
    float _3702 = cos(_3700);
    float _3704 = _3674 * 6.283185482025146484375;
    float _3706 = sin(_3704);
    float _3708 = _3674 * 6.283185482025146484375;
    float _3710 = cos(_3708);
    if (_3652)
    {
        return out;
    }
    float _3712 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3714 = _3170 * _3676;
    float _3716 = _3698 * 6.283185482025146484375;
    float _3718 = cos(_3716);
    float _3720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _3722 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3724 = _3714 * _3712;
    float _3726 = _3702 * _3710;
    float _3728 = _3702 * _3706;
    float _3730 = _3714 * _3722;
    float _3732 = _3720 * _3724;
    float _3734 = _3698 * 6.283185482025146484375;
    float _3736 = sin(_3734);
    float _3738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3740 = _3696 * _3706;
    float _3742 = _3696 * _3710;
    float _3744 = _3702 * _3718;
    float _3746 = _3696 * _3718;
    float _3748 = _3738 * _3730;
    float _3750 = _3710 * _3718;
    float _3752 = _3744 * _3732;
    float _3754 = _3706 * _3718;
    float _3756 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3758 = _3756 * 0.5;
    float _3760 = fma(_3736, _3726, _3740);
    float _3762 = -_3742;
    float _3764 = fma(_3736, _3728, _3762);
    float _3766 = -_3732;
    float _3768 = _3736 * _3766;
    float _3770 = -_3728;
    float _3772 = fma(_3736, _3742, _3770);
    float _3774 = fma(_3760, _3748, _3752);
    float _3776 = _3746 * _3732;
    float _3778 = fma(_3750, _3748, _3768);
    float _3780 = fma(_3736, _3740, _3726);
    float _3782 = fma(_3764, _3758, _3774);
    float _3784 = fma(_3772, _3748, _3776);
    float _3786 = fma(_3754, _3758, _3778);
    float _3788 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3790 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3792 = fma(_3780, _3758, _3784);
    float _3794 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3788);
    float _3796 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3790);
    float _3798 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3794);
    float _3800 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3796);
    float _3802 = _3798 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3804 = _3800 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3806 = _2870 + _3802;
    float _3808 = _2800 + _3804;
    float _3810 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3814 = _3806 + _3812;
    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3818 = _3808 + _3816;
    float _3820 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3810);
    float _3822 = _3814 * _3814;
    float _3824 = _3818 * _3818;
    float _3826 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3820);
    float _3828 = _3822 + _3824;
    float _3830 = _3826 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3832 = sqrt(_3828);
    float _3834 = _2802 + _3830;
    bool _3836 = _3832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3838 = _3782;
    float _3840 = _3806;
    float _3842 = _3808;
    float _3844 = _3822;
    float _3846 = _3824;
    if (!_3836)
    {
        _3838 = _3834;
    }
    float _3848 = _3838;
    bool _3850 = !_3836;
    float _3852 = _3848;
    if (!_3850)
    {
        float _3854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3858 = _3832 + _3856;
        float _3860 = rsqrt(_3828);
        float _3862 = _3858 * _3854;
        float _3864 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3866 = _3862 * 0.15915493667125701904296875;
        float _3868 = _3866 * 6.283185482025146484375;
        float _3870 = sin(_3868);
        float _3872 = _3866 * 6.283185482025146484375;
        float _3874 = cos(_3872);
        float _3876 = fma(_3870, _3864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3878 = _3860 * _3876;
        float _3880 = _3874 + (-1.0);
        float _3882 = fma(_3814, _3878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3884 = fma(_3818, _3878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3886 = _3880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3890 = _3882 + _3888;
        float _3892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3894 = _3884 + _3892;
        float _3896 = fma(_3834, _3874, _3886);
        float _3898 = _3890 * _3890;
        float _3900 = _3894 * _3894;
        _3840 = _3882;
        _3842 = _3884;
        _3852 = _3896;
        _3844 = _3898;
        _3846 = _3900;
    }
    float _3902 = _3840;
    float _3904 = _3842;
    float _3906 = _3852;
    float _3908 = _3844;
    float _3910 = _3846;
    float _3912 = fma(_3902, 6.2500002968590706586837768554688e-05, 0.5);
    float _3914 = fma(_3904, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11191 = float2(_3912, _3914);
    float3 _3918 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11191, float2(0.0), isnan(_11191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11191, float2(0.0), isnan(_11191)), level(0.0)).xyz;
    float _3920 = _3918.x;
    float _3922 = _3918.y;
    float _3924 = _3918.z;
    float _3926 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3928 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3930 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3932 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3934 = -_3736;
    float _3936 = fma(_3934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3926);
    float _3938 = -_3736;
    float _3940 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3928);
    float _3942 = -_3736;
    float _3944 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3930);
    float _3946 = fma(_3932, _3932, 1.0);
    float _3948 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3950 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3952 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3954 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3956 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3948);
    float _3958 = rsqrt(_3946);
    float _3960 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3950);
    float _3962 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3952);
    float _3964 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3966 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3968 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3954);
    float _3970 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3936);
    float _3972 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3964);
    float _3974 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3976 = _3906 + _3974;
    float _3978 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3966);
    float _3980 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3940);
    float _3982 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3944);
    float _3984 = fma(_3976, _3976, _3908);
    float _3986 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3972);
    float _3988 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3978);
    float _3990 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3968);
    float _3992 = _3984 + _3910;
    float _3994 = _3932 * _3958;
    float _3996 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3998 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3956);
    float _4000 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3960);
    float _4002 = _3932 * _3970;
    float _4004 = _3932 * _3980;
    float _4006 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3962);
    float _4008 = _3932 * _3982;
    float _4010 = -_3986;
    float _4012 = _3994 * _4010;
    float _4014 = -_3990;
    float _4016 = _3994 * _4014;
    float _4018 = -_3988;
    float _4020 = _3994 * _4018;
    float _4022 = sqrt(_3992);
    float _4024 = fma(_3996, _3998, _4002);
    float _4026 = fma(_3996, _4000, _4004);
    float _4028 = fma(_3996, _4006, _4008);
    float _4030 = fma(_3958, _3970, _4012);
    float _4032 = fma(_3958, _3980, _4016);
    float _4034 = fma(_3958, _3982, _4020);
    float _4036 = _3986 + _4024;
    float _4038 = _3990 + _4026;
    float _4040 = _3988 + _4028;
    out.m_94.x = _3998;
    out.m_94.y = _4000;
    out.m_94.z = _4006;
    out.m_96.x = _4030;
    out.m_96.y = _4032;
    out.m_96.z = _4034;
    bool _4042 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4044 = isnan(_4022);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4050 = _4046 || _4048;
    out.m_98.x = _4036;
    out.m_98.y = _4038;
    out.m_98.z = _4040;
    float _4052 = _4008;
    float _4054 = _3988;
    float _4056 = _3990;
    if (!_4050)
    {
        _4052 = 1.0;
    }
    float _4058 = _4052;
    out.m_100.x = _3920;
    out.m_100.y = _3922;
    out.m_100.z = _3924;
    bool _4060 = !_4050;
    float _4062 = _4058;
    float _4064 = _3922;
    if (!_4060)
    {
        bool _4066 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4068 = isnan(_4022);
        bool _4070 = _4066 || _4068;
        bool _4072 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4074 = _4070 || _4072;
        if (!_4074)
        {
            float _4076 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4078 = _4022 + _4076;
            float _4080 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4082 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4080;
            float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4086 = _4084 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4088 = 1.0 / _4082;
            float _4090 = _4078 * _4088;
            float _4092 = fma(_4090, _4086, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4062 = _4092;
            _4064 = _4088;
            _4094 = true;
        }
        else
        {
            bool _4096 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4098 = isnan(_4022);
            bool _4100 = _4096 || _4098;
            bool _4102 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4104 = _4100 || _4102;
            if (!_4104)
            {
                float _4106 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4108 = _4022 + _4106;
                float _4110 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4112 = _4110 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4114 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4116 = _4114 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4118 = 1.0 / _4112;
                float _4120 = _4108 * _4118;
                float _4122 = fma(_4120, _4116, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4062 = _4122;
                _4064 = _4118;
                _4094 = true;
            }
            else
            {
                _4062 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4094 = false;
    float _4124 = _4062;
    float _4126 = _4064;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4130 = _3906 + _4128;
    float _4132 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4134 = _3902 + _4132;
    float _4136 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4138 = _3904 + _4136;
    float _4140 = fma(_4130, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4142 = fma(_4134, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4144 = fma(_4138, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4146 = -_2802;
    float _4148 = _4146 + _4140;
    float _4150 = -_2870;
    float _4152 = _4150 + _4142;
    float _4154 = -_2800;
    float _4156 = _4154 + _4144;
    float _4158 = _4148 * _4148;
    float _4160 = fma(_4152, _4152, _4158);
    float _4162 = fma(_4156, _4156, _4160);
    float _4164 = sqrt(_4162);
    bool _4166 = _4164 > 0.0;
    float _4168 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4170 = fma(_3604, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4168);
    float _4172 = _4126;
    float _4174 = _4138;
    float _4176 = _4168;
    float _4178 = _4152;
    if (!_4166)
    {
        _4172 = _4142;
    }
    float _4180 = _4172;
    float _4182 = _4180;
    if (!_4166)
    {
        _4174 = _4140;
    }
    float _4184 = _4174;
    float _4186 = _4184;
    float _4188 = _4184;
    if (!_4166)
    {
        _4176 = _4144;
    }
    float _4190 = _4176;
    bool _4192 = !_4166;
    float _4194 = _4190;
    if (!_4192)
    {
        float _4196 = _227 * _227;
        float _4198 = fma(_225, _225, _4196);
        float _4200 = fma(_229, _229, _4198);
        float _4202 = rsqrt(_4162);
        float _4204 = sqrt(_4200);
        float _4206 = _4152 * _4202;
        float _4208 = _4148 * _4202;
        float _4210 = _4156 * _4202;
        bool _4212 = _4204 > 0.0;
        float _4214 = _4204;
        float _4216 = _4202;
        _4178 = _4206;
        if (!_4212)
        {
            _4214 = _4142;
        }
        float _4218 = _4214;
        _4182 = _4218;
        if (!_4212)
        {
            _4186 = _4140;
        }
        float _4220 = _4186;
        _4188 = _4220;
        if (!_4212)
        {
            _4216 = _4144;
        }
        float _4222 = _4216;
        bool _4224 = !_4212;
        _4194 = _4222;
        if (!_4224)
        {
            float _4226 = rsqrt(_4200);
            float _4228 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4230 = _227 * _4226;
            float _4232 = _225 * _4226;
            float _4234 = _229 * _4226;
            float _4236 = _4208 * _4230;
            float _4238 = fma(_4206, _4232, _4236);
            float _4240 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4242 = fma(_4210, _4234, _4238);
            float _4244 = _4242 * _4240;
            float _4246 = fma(_225, _4244, _4142);
            float _4248 = fma(_227, _4244, _4140);
            float _4250 = fma(_229, _4244, _4144);
            _4188 = _4248;
            _4182 = _4246;
            _4194 = _4250;
        }
    }
    float _4252 = _4188;
    float _4254 = _4182;
    float _4256 = _4194;
    float _4258 = _4178;
    float _4260 = -_3256;
    float _4262 = fma(_4260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4252);
    float _4264 = -_3260;
    float _4266 = fma(_4264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4254);
    float _4268 = fma(_3624, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4170);
    float _4270 = -_3572;
    float _4272 = fma(_4270, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4256);
    float _4274 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4276 = _4262 + _4274;
    float _4278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4280 = _4266 + _4278;
    float _4282 = _4268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4286 = _4272 + _4284;
    float _4288 = _4276 * _4276;
    float _4290 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4292 = 1.0 / _4282;
    float _4294 = fma(_4280, _4280, _4288);
    float _4296 = fma(_3604, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4290);
    float _4298 = fma(_4286, _4286, _4294);
    float _4300 = fma(_3624, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4296);
    float _4302 = rsqrt(_4298);
    float _4304 = _4300 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4306 = _4304 + _4282;
    float _4308 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4310 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4312 = _4306 * _4292;
    float _4314 = _4312 * 0.5;
    float _4316 = _3598 + _4308;
    float _4318 = floor(_4310);
    float _4320 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4322 = fma(_4314, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4320);
    float _4324 = _4316 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4326 = _4302 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4328 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4324);
    float _4330 = 1.0 / _4322;
    float _4332 = _4280 * _4326;
    float _4334 = _4316 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4336 = _4286 * _4326;
    float _4338 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4328);
    float _4340 = _4332 * _4332;
    float _4342 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4334);
    float _4344 = _4336 * _4336;
    float _4346 = _4338 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4348 = -_4318;
    float _4350 = _4310 + _4348;
    float _4352 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4342);
    float _4354 = _4340 + _4344;
    float _4356 = trunc(_4346);
    int _4358 = int(_4356);
    float _4360 = _4352 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4362 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4364 = _4330 * _4362;
    float _4366 = sqrt(_4354);
    bool _4368 = _4364 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4370 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _4372 = _4364 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4374 = trunc(_4360);
    int _4376 = int(_4374);
    int _4378 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4380 = _4358 + _4378;
    int _4382 = _4380 + 1;
    int _4384 = 2;
    float _4386 = _4318;
    float _4388 = _4354;
    float _4390 = _4276;
    float _4392 = as_type<float>(_4382);
    float _4394 = _4346;
    if (!_4368)
    {
        _4384 = 1;
    }
    int _4396 = _4384;
    bool _4398 = _4366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4400 = floor(_4370);
    int _4402 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4404 = _4376 + _4402;
    int _4406 = _4404 + 1;
    bool _4408 = _4406 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4410 = as_type<float>(_4358);
    int _4412 = _4396;
    int _4414 = _4406;
    if (_4398)
    {
        float _4416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4410 = _4416;
    }
    float _4418 = _4410;
    int _4420 = _4406 | _4382;
    if (!_4398)
    {
        _4386 = _4344;
    }
    float _4422 = _4386;
    float _4424 = -_4400;
    float _4426 = _4370 + _4424;
    bool _4428 = _4420 < 0;
    bool _4430 = _4428 || _4408;
    bool _4432 = !_4368;
    int _4434 = _4432 ? 0 : 1;
    float _4436 = _4400;
    float _4438 = _4422;
    if (_4398)
    {
        float _4440 = rsqrt(_4354);
        _4388 = _4440;
    }
    float _4442 = _4388;
    bool _4444 = _4382 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4446 = _4444 || _4430;
    if (!_4372)
    {
        _4412 = _4434;
    }
    int _4448 = _4412;
    float _4450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4452 = _4366 + _4450;
    float _4454 = _4452;
    if (!_4398)
    {
        _4436 = _4336;
    }
    float _4456 = _4436;
    int _4458 = _4448 << 6;
    float _4460 = _4456;
    if (_4398)
    {
        float _4462 = _4452 * _4418;
        _4454 = _4462;
    }
    float _4464 = _4454;
    int _4466 = _4458 + 64;
    uint _4468 = uint(int(uint(_4466) >> uint(2)));
    uint _4470 = uint(int(uint(int(_4468)) >> uint(2)));
    int _4472 = int(_4468) & 3;
    float _4474 = (*spvDescriptorSet0.vp_c15)._m0[int(_4470)][_4472];
    int _4476 = int(_4468) + 1;
    uint _4478 = uint(int(uint(_4476) >> uint(2)));
    int _4480 = _4476 & 3;
    float _4482 = (*spvDescriptorSet0.vp_c15)._m0[int(_4478)][_4480];
    if (_4398)
    {
        float _4484 = _4464 * 0.15915493667125701904296875;
        _4054 = _4484;
    }
    float _4486 = _4054;
    float _4488 = _3980;
    if (!_4446)
    {
        float _4490 = floor(_4346);
        _4488 = _4490;
    }
    float _4492 = _4488;
    if (!_4446)
    {
        int _4494 = _4382 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4496 = _4494 + _4406;
        _4414 = _4496;
    }
    int _4498 = _4414;
    float _4500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4502 = _4458 + 80;
    uint _4504 = uint(int(uint(_4502) >> uint(2)));
    uint _4506 = uint(int(uint(int(_4504)) >> uint(2)));
    int _4508 = int(_4504) & 3;
    float _4510 = (*spvDescriptorSet0.vp_c15)._m0[int(_4506)][_4508];
    int _4512 = int(_4504) + 1;
    uint _4514 = uint(int(uint(_4512) >> uint(2)));
    int _4516 = _4512 & 3;
    float _4518 = (*spvDescriptorSet0.vp_c15)._m0[int(_4514)][_4516];
    float _4520 = _2802;
    if (_4398)
    {
        float _4522 = _4486 * 6.283185482025146484375;
        float _4524 = sin(_4522);
        _4520 = _4524;
    }
    float _4526 = _4520;
    float _4528 = precise::max(0.0, _4500);
    int _4530 = _4458 + 96;
    uint _4532 = uint(int(uint(_4530) >> uint(2)));
    uint _4534 = uint(int(uint(int(_4532)) >> uint(2)));
    int _4536 = int(_4532) & 3;
    float _4538 = (*spvDescriptorSet0.vp_c15)._m0[int(_4534)][_4536];
    int _4540 = int(_4532) + 1;
    uint _4542 = uint(int(uint(_4540) >> uint(2)));
    int _4544 = _4540 & 3;
    float _4546 = (*spvDescriptorSet0.vp_c15)._m0[int(_4542)][_4544];
    float _4548 = -_4326;
    float _4550 = -_4528;
    float _4552 = fma(_4276, _4548, _4550);
    if (!_4398)
    {
        _4390 = _4332;
    }
    float _4554 = _4390;
    float _4556 = _4258;
    float _4558 = _4554;
    if (_4398)
    {
        float _4560 = _4486 * 6.283185482025146484375;
        float _4562 = cos(_4560);
        _4556 = _4562;
    }
    float _4564 = _4556;
    float _4566 = _4492;
    if (!_4446)
    {
        float _4568 = -_4492;
        float _4570 = _4346 + _4568;
        _4392 = _4570;
    }
    float _4572 = _4392;
    if (_4398)
    {
        float _4574 = _4552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4056 = _4574;
    }
    float _4576 = _4056;
    float _4578 = _4576;
    if (!_4398)
    {
        _4566 = _4552;
    }
    float _4580 = _4566;
    int _4582 = _4458 + 104;
    uint _4584 = uint(int(uint(_4582) >> uint(2)));
    uint _4586 = uint(int(uint(int(_4584)) >> uint(2)));
    int _4588 = int(_4584) & 3;
    float _4590 = (*spvDescriptorSet0.vp_c15)._m0[int(_4586)][_4588];
    int _4592 = int(_4584) + 1;
    uint _4594 = uint(int(uint(_4592) >> uint(2)));
    int _4596 = _4592 & 3;
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[int(_4594)][_4596];
    float _4600 = _4526;
    float _4602 = _4580;
    if (_4398)
    {
        float _4604 = fma(_4526, _4576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4578 = _4604;
    }
    float _4606 = _4578;
    float _4608 = _4606;
    if (_4398)
    {
        float _4610 = _4442 * _4606;
        _4608 = _4610;
    }
    float _4612 = _4608;
    int _4614 = _4458 + 48;
    uint _4616 = uint(int(uint(_4614) >> uint(2)));
    uint _4618 = uint(int(uint(int(_4616)) >> uint(2)));
    int _4620 = int(_4616) & 3;
    float _4622 = (*spvDescriptorSet0.vp_c15)._m0[int(_4618)][_4620];
    int _4624 = int(_4616) + 1;
    uint _4626 = uint(int(uint(_4624) >> uint(2)));
    int _4628 = _4624 & 3;
    float _4630 = (*spvDescriptorSet0.vp_c15)._m0[int(_4626)][_4628];
    if (_4398)
    {
        float _4632 = _4564 + (-1.0);
        _4394 = _4632;
    }
    float _4634 = _4394;
    float _4636 = _4634;
    if (_4398)
    {
        float _4638 = _4332 * _4612;
        _4558 = _4638;
    }
    float _4640 = _4558;
    if (_4398)
    {
        float _4642 = _4336 * _4612;
        _4460 = _4642;
    }
    float _4644 = _4460;
    if (_4398)
    {
        float _4646 = _4634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4600 = _4646;
    }
    float _4648 = _4600;
    int _4650 = _4458 + 72;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    if (!_4398)
    {
        _4636 = _4340;
    }
    float _4668 = _4636;
    float _4670 = _4668;
    if (_4398)
    {
        float _4672 = _4640 * _4640;
        _4670 = _4672;
    }
    float _4674 = _4670;
    if (_4398)
    {
        float _4676 = fma(_4552, _4564, _4648);
        _4602 = _4676;
    }
    float _4678 = _4602;
    if (_4398)
    {
        float _4680 = _4644 * _4644;
        _4438 = _4680;
    }
    float _4682 = _4438;
    int _4684 = _4458 + 56;
    uint _4686 = uint(int(uint(_4684) >> uint(2)));
    uint _4688 = uint(int(uint(int(_4686)) >> uint(2)));
    int _4690 = int(_4686) & 3;
    float _4692 = (*spvDescriptorSet0.vp_c15)._m0[int(_4688)][_4690];
    int _4694 = int(_4686) + 1;
    uint _4696 = uint(int(uint(_4694) >> uint(2)));
    int _4698 = _4694 & 3;
    float _4700 = (*spvDescriptorSet0.vp_c15)._m0[int(_4696)][_4698];
    float _4702 = _4316 * _4482;
    float _4704 = fma(_3604, _4474, _4702);
    int _4706 = _4458 + 88;
    uint _4708 = uint(int(uint(_4706) >> uint(2)));
    uint _4710 = uint(int(uint(int(_4708)) >> uint(2)));
    int _4712 = int(_4708) & 3;
    float _4714 = (*spvDescriptorSet0.vp_c15)._m0[int(_4710)][_4712];
    int _4716 = int(_4708) + 1;
    uint _4718 = uint(int(uint(_4716) >> uint(2)));
    int _4720 = _4716 & 3;
    float _4722 = (*spvDescriptorSet0.vp_c15)._m0[int(_4718)][_4720];
    float _4724 = _4316 * _4518;
    float _4726 = fma(_4678, _4678, _4674);
    float _4728 = _4316 * _4546;
    float _4730 = sqrt(_4298);
    float _4732 = fma(_3604, _4510, _4724);
    float _4734 = _4726 + _4682;
    float _4736 = fma(_3604, _4538, _4728);
    int _4738 = as_type<int>(_4726);
    if (!_4446)
    {
        int _4740 = _4498 << 2;
        _4738 = _4740;
    }
    int _4742 = _4738;
    float _4744 = fma(_3624, _4590, _4736);
    int _4746 = _4742;
    if (!_4446)
    {
        int _4748 = 12 & _4742;
        _4746 = _4748;
    }
    int _4750 = _4746;
    float _4752 = rsqrt(_4734);
    float _4754 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4756 = _4744 + _4598;
    float _4758 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4760 = _4316 * _4630;
    int _4762 = as_type<int>(_4630);
    if (!_4446)
    {
        uint _4764 = uint(int(uint(_4498) >> uint(2)));
        _4762 = int(_4764);
    }
    int _4766 = _4762;
    float _4768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4770 = fma(_4730, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4768);
    float _4772 = precise::clamp(_4770, 0.0, 1.0);
    float _4774 = fma(_3604, _4622, _4760);
    int _4776 = _4766;
    if (!_4446)
    {
        int _4778 = _4766 << 4;
        int _4780 = _4778 + _4750;
        _4776 = _4780;
    }
    int _4782 = _4776;
    float _4784 = -_4772;
    float _4786 = _4784 + 1.0;
    float _4788 = 1.0 / _4756;
    float _4790 = fma(_3624, _4658, _4704);
    float _4792 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4754);
    float _4794 = _4760;
    float _4796 = as_type<float>(_4782);
    if (!_4446)
    {
        int _4798 = _4782 + 400;
        uint _4800 = uint(int(uint(_4798) >> uint(2)));
        uint _4802 = uint(int(uint(int(_4800)) >> uint(2)));
        int _4804 = int(_4800) & 3;
        float _4806 = (*spvDescriptorSet0.vp_c15)._m0[int(_4802)][_4804];
        _4794 = _4806;
    }
    float _4808 = _4794;
    float _4810 = _4752 * _4640;
    float _4812 = _4790 + _4666;
    float _4814 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4792);
    float _4816 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4818 = abs(_4786);
    float _4820 = log2(_4818);
    float _4822 = fma(_3624, _4692, _4774);
    float _4824 = _4814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4826 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4828 = _4752 * _4644;
    float _4830 = _4822 + _4700;
    float _4832 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4834 = _4774;
    if (!_4446)
    {
        float _4836 = floor(_4360);
        _4834 = _4836;
    }
    float _4838 = _4834;
    float _4840 = fma(_3624, _4714, _4732);
    float _4842 = _4752 * _4678;
    float _4844 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4832);
    float _4846 = _4824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4848 = _4830 * _4788;
    float _4850 = -_4826;
    float _4852 = fma(_4842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4850);
    float _4854 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4844);
    float _4856 = -_4846;
    float _4858 = fma(_4856, _4758, 1.0);
    float _4860 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4816);
    bool _4862 = _4848 >= 0.0;
    float _4864 = -_4828;
    float _4866 = fma(_4864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4852);
    float _4868 = _4854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4870 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4872 = _4812 * _4788;
    float _4874 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4876 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4860);
    bool _4878 = _4848 <= 1.0;
    bool _4880 = _4878 && _4862;
    float _4882 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4870);
    float _4884 = exp2(_4874);
    float _4886 = _4876 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4888 = _4872 >= 0.0;
    bool _4890 = _4888 && _4880;
    float _4892 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4894 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4882);
    float _4896 = fma(_4866, -0.5, 0.5);
    float _4898 = fma(_4866, 0.5, 0.5);
    bool _4900 = _4872 <= 1.0;
    bool _4902 = _4900 && _4890;
    float _4904 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4892);
    float _4906 = _4894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4908 = fma(_4898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4910 = sqrt(_4896);
    float _4912 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4904);
    float _4914 = _4842 + 1.0;
    if (!_4446)
    {
        float _4916 = -_4838;
        float _4918 = _4360 + _4916;
        _4796 = _4918;
    }
    float _4920 = _4796;
    float _4922 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4912);
    float _4924 = -_4842;
    float _4926 = fma(_4884, _4914, _4924);
    float _4928 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4930 = log2(_4858);
    float _4932 = _4840 + _4722;
    float _4934 = fma(_4898, _4908, -0.212114393711090087890625);
    float _4936 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4938 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4928);
    float2 _12940 = float2(_4350, _4426);
    float _4940 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12940, float2(0.0), isnan(_12940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12940, float2(0.0), isnan(_12940)), level(0.0)).x;
    float _4942 = fma(_4898, _4934, 1.570728778839111328125);
    float _4944 = _4934;
    float _4946 = _4922;
    if (_4902)
    {
        float _4948 = float(_4448);
        _4944 = _4948;
    }
    float _4950 = _4944;
    float _4952 = 1.0 / _4922;
    float _4954 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4936);
    float _4956 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4938);
    float _4958 = _4910 * 0.636619746685028076171875;
    float _4960 = fma(_4926, 0.5, 0.5);
    float _4962 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4954);
    float _4964 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4956);
    float _4966 = _4932 * _4788;
    float _4968 = _4950;
    float _4970 = _4964;
    if (_4902)
    {
        float _4972 = rint(_4950);
        float _4974 = precise::max(_4972, 0.0);
        uint _4976 = uint(_4974);
        uint _4978 = clamp(_4976, 0u, 65535u);
        _4968 = as_type<float>(_4978);
    }
    float _4980 = _4968;
    float _4982 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4962);
    float _4984 = _4930 * 0.693147182464599609375;
    float _4986 = -_4942;
    float _4988 = fma(_4958, _4986, 1.0);
    float _4990 = _4984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4992 = _4964 * _4952;
    float _4994 = _4982 * _4952;
    float _4996 = _4838;
    if (!_4446)
    {
        float _4998 = rint(_4808);
        float _5000 = precise::max(_4998, 0.0);
        uint _5002 = uint(_5000);
        uint _5004 = clamp(_5002, 0u, 65535u);
        _4996 = as_type<float>(_5004);
    }
    float _5006 = _4996;
    float _5008 = fma(_4992, 0.5, 0.5);
    float _5010 = fma(_4994, -0.5, 0.5);
    float _5012 = _4952;
    if (_4902)
    {
        float3 _13058 = float3(_4848, _4872, float(as_type<int>(_4980)));
        float3 _13062 = select(_13058, float3(0.0), isnan(_13058));
        float _5014 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13062.xy, uint(rint(_13062.z)), _4966, level(0.0));
        _5012 = _5014;
    }
    float _5016 = _5012;
    float3 _13072 = float3(_5008, _5010, _4990);
    float _5018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13072, float3(0.0), isnan(_13072)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13072, float3(0.0), isnan(_13072)), level(0.0)).x;
    float3 _13081 = float3(_5008, _5010, _4990);
    float4 _5021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13081, float3(0.0), isnan(_13081)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13081, float3(0.0), isnan(_13081)), level(0.0)).xyzw;
    float _5023 = _5021.x;
    float _5025 = _5021.y;
    float _5027 = _5021.z;
    float _5029 = _5021.w;
    float2 _13097 = float2(_4988, _4960);
    float3 _5031 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13097, float2(0.0), isnan(_13097)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13097, float2(0.0), isnan(_13097)), level(0.0)).xyz;
    float _5033 = _5031.x;
    float _5035 = _5031.y;
    float _5037 = _5031.z;
    float _5039 = _4920;
    if (!_4446)
    {
        float3 _13118 = float3(_4920, _4572, float(as_type<int>(_5006)));
        float3 _13120 = select(_13118, float3(0.0), isnan(_13118));
        float _5041 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13120.xy, uint(rint(_13120.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13120.xy, uint(rint(_13120.z)), level(0.0)).x;
        _5039 = _5041;
    }
    float _5043 = _5039;
    float _5045 = abs(_4364);
    float _5047 = log2(_5045);
    float _5049 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5051 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5049);
    float _5053 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5051);
    float _5055 = _4964 + _4922;
    float _5057 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5053);
    float _5059 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5061 = _5055 * 0.5;
    float _5063 = _5047 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = _5057 + _4922;
    bool _5067 = _4364 <= 8000.0;
    bool _5069 = isnan(_4364);
    bool _5071 = _5067 || _5069;
    bool _5073 = isnan(8000.0);
    bool _5075 = _5071 || _5073;
    float _5077 = float(_5075);
    out.gl_Position.x = _4964;
    out.gl_Position.y = _4982;
    out.gl_Position.z = _5057;
    out.gl_Position.w = _4922;
    float _5079 = exp2(_5059);
    float _5081 = _5065 * 0.5;
    float _5083 = exp2(_5063);
    float _5085 = _5077;
    if (_4446)
    {
        _4970 = 1.0;
    }
    float _5087 = _4970;
    float _5089 = fma(_5083, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5091 = precise::clamp(_5089, 0.0, 1.0);
    float _5093 = fma(_5091, -2.0, 3.0);
    float _5095 = _5091 * _5091;
    float _5097 = _5095 * _5093;
    float _5099 = _4922 * 0.5;
    float _5101 = fma(_4982, -0.5, _5099);
    float _5103 = -_5097;
    float _5105 = _5103 + 1.0;
    out.m_102.x = _5061;
    out.m_102.y = _5101;
    out.m_102.z = _5081;
    out.m_102.w = _4922;
    float _5107 = fma(_5105, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5097);
    float _5109 = _5077 * _5107;
    float _5111 = _5087;
    if (!_4902)
    {
        _5085 = 1.0;
    }
    float _5113 = _5085;
    float _5115 = _5109 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5117 = -_5079;
    float _5119 = _5117 + 1.0;
    float _5121 = _5119 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5123 = -_4940;
    float _5125 = _5123 + 1.0;
    float _5127 = _5125 * _5115;
    float _5129 = precise::clamp(_5127, 0.0, 1.0);
    float _5131 = _5113;
    if (_4902)
    {
        bool _5133 = _5016 >= _4966;
        bool _5135 = isnan(_5016);
        bool _5137 = _5133 || _5135;
        bool _5139 = isnan(_4966);
        bool _5141 = _5137 || _5139;
        float _5143 = float(_5141);
        _5131 = _5143;
    }
    float _5145 = _5131;
    if (!_4446)
    {
        int _5147 = _4498 << 4;
        int _5149 = _5147 + 2048;
        uint _5151 = uint(int(uint(_5149) >> uint(2)));
        uint _5153 = uint(int(uint(int(_5151)) >> uint(2)));
        int _5155 = int(_5151) & 3;
        float _5157 = (*spvDescriptorSet0.vp_c15)._m0[int(_5153)][_5155];
        int _5159 = int(_5151) + 1;
        uint _5161 = uint(int(uint(_5159) >> uint(2)));
        int _5163 = _5159 & 3;
        float _5165 = (*spvDescriptorSet0.vp_c15)._m0[int(_5161)][_5163];
        int _5167 = _5149 + 8;
        uint _5169 = uint(int(uint(_5167) >> uint(2)));
        uint _5171 = uint(int(uint(int(_5169)) >> uint(2)));
        int _5173 = int(_5169) & 3;
        float _5175 = (*spvDescriptorSet0.vp_c15)._m0[int(_5171)][_5173];
        int _5177 = int(_5169) + 1;
        uint _5179 = uint(int(uint(_5177) >> uint(2)));
        int _5181 = _5177 & 3;
        float _5183 = (*spvDescriptorSet0.vp_c15)._m0[int(_5179)][_5181];
        float _5185 = _4316 * _5165;
        float _5187 = fma(_3604, _5157, _5185);
        float _5189 = fma(_3624, _5175, _5187);
        float _5191 = _5189 + _5183;
        float _5193 = precise::clamp(_5191, 0.0, 1.0);
        float _5195 = -_5193;
        float _5197 = _5195 + _5043;
        float _5199 = fma(_5197, 500.0, 1.5);
        float _5201 = exp2(_5199);
        float _5203 = 0.0 + _5201;
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        _5111 = _5205;
        _4946 = _5183;
    }
    float _5207 = _5111;
    float _5209 = _4946;
    float _5211 = _5145 * _5207;
    float _5213 = _5121 * _5018;
    float _5215 = -_5129;
    float _5217 = fma(_5215, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5219 = -_5121;
    float _5221 = _5219 + 1.0;
    bool _5223 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5225 = isnan(_4730);
    bool _5227 = _5223 || _5225;
    bool _5229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5231 = _5227 || _5229;
    float _5233 = _5029 * _5213;
    float _5235 = -_5211;
    float _5237 = fma(_5235, _5217, 1.0);
    float _5239 = precise::clamp(_5237, 0.0, 1.0);
    float _5241 = _5037 * _5213;
    float _5243 = _5029 * _5221;
    float _5245 = fma(_5033, _5233, _5023);
    float _5247 = fma(_5035, _5233, _5025);
    float _5249 = _5239 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5251 = fma(_5029, _5241, _5027);
    out.m_104.x = _5249;
    float _5253 = _5209;
    float _5255 = _5213;
    float _5257 = _5233;
    float _5259 = _5239;
    if (!_5231)
    {
        _3678 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5261 = _3678;
    float _5263 = _5261;
    float _5265 = _5261;
    if (!_5231)
    {
        _3158 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5267 = _3158;
    out.m_106.x = _5245;
    out.m_106.y = _5247;
    out.m_106.z = _5251;
    out.m_106.w = _5243;
    float _5269 = _5267;
    float _5271 = _5267;
    if (!_5231)
    {
        _5253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5273 = _5253;
    float _5275 = _5273;
    float _5277 = _5273;
    if (!_5231)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5279 = _5255;
    float _5281 = _5279;
    float _5283 = _5279;
    if (!_5231)
    {
        _5257 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5285 = _5257;
    float _5287 = _5285;
    float _5289 = _5285;
    if (!_5231)
    {
        _5259 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5291 = _5259;
    bool _5293 = !_5231;
    float _5295 = _5291;
    float _5297 = _5291;
    if (!_5293)
    {
        bool _5299 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5301 = isnan(_4730);
        bool _5303 = _5299 || _5301;
        bool _5305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5307 = _5303 || _5305;
        if (!_5307)
        {
            float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5311 = _4730 + _5309;
            float _5313 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5315 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5313;
            float _5317 = 1.0 / _5315;
            float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5325 = _5323 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5327 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5329 = _5327 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5333 = _5331 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5335 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5337 = _5335 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5339 = _5311 * _5317;
            float _5341 = precise::clamp(_5339, 0.0, 1.0);
            float _5343 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5345 = _5343 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5347 = fma(_5341, _5321, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5349 = fma(_5341, _5345, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5351 = fma(_5341, _5325, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5353 = fma(_5341, _5329, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5355 = fma(_5341, _5333, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5357 = fma(_5341, _5337, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5271 = _5349;
            _5289 = _5355;
            _5265 = _5347;
            _5283 = _5353;
            _5277 = _5351;
            _5297 = _5357;
            _5359 = true;
        }
        else
        {
            bool _5361 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5363 = isnan(_4730);
            bool _5365 = _5361 || _5363;
            bool _5367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5369 = _5365 || _5367;
            if (!_5369)
            {
                _5263 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5371 = _5263;
            _5265 = _5371;
            if (!_5369)
            {
                _5269 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5373 = _5269;
            _5271 = _5373;
            if (!_5369)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5375 = _5275;
            _5277 = _5375;
            if (!_5369)
            {
                _5281 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5377 = _5281;
            _5283 = _5377;
            if (!_5369)
            {
                _5287 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5379 = _5287;
            _5289 = _5379;
            if (!_5369)
            {
                _5295 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5381 = _5295;
            bool _5383 = !_5369;
            _5297 = _5381;
            if (!_5383)
            {
                bool _5385 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5387 = isnan(_4730);
                bool _5389 = _5385 || _5387;
                bool _5391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5393 = _5389 || _5391;
                if (!_5393)
                {
                    float _5395 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5397 = _4730 + _5395;
                    float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5401 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5399;
                    float _5403 = 1.0 / _5401;
                    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5425 = _5397 * _5403;
                    float _5427 = precise::clamp(_5425, 0.0, 1.0);
                    float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5431 = _5429 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5433 = fma(_5427, _5407, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5435 = fma(_5427, _5431, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5437 = fma(_5427, _5411, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5439 = fma(_5427, _5415, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5441 = fma(_5427, _5419, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5443 = fma(_5427, _5423, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5271 = _5435;
                    _5289 = _5441;
                    _5265 = _5433;
                    _5283 = _5439;
                    _5277 = _5437;
                    _5297 = _5443;
                    _5359 = true;
                }
                else
                {
                    _5271 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5289 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5265 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5283 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5297 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5359 = false;
    float _5445 = _5271;
    float _5447 = _5289;
    float _5449 = _5265;
    float _5451 = _5283;
    float _5453 = _5277;
    float _5455 = _5297;
    float _5457 = fma(_4038, -0.5, 0.5);
    float _5459 = precise::clamp(_5457, 0.0, 1.0);
    float _5461 = -_5445;
    float _5463 = _5461 + _5447;
    float _5465 = -_5449;
    float _5467 = _5465 + _5451;
    float _5469 = -_5453;
    float _5471 = _5469 + _5455;
    bool _5473 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5475 = fma(_5459, _5463, _5445);
    float _5477 = fma(_5459, _5467, _5449);
    float _5479 = fma(_5459, _5471, _5453);
    float _5481 = _5475 * 0.586610972881317138671875;
    out.m_108.x = 0.0;
    float _5483 = fma(_5477, 0.298911988735198974609375, _5481);
    float _5485 = fma(_5479, 0.114477999508380889892578125, _5483);
    float _5487 = -_5485;
    float _5489 = _5477 + _5487;
    float _5491 = -_5485;
    float _5493 = _5475 + _5491;
    float _5495 = -_5485;
    float _5497 = _5479 + _5495;
    float _5499 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5501 = fma(_5489, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    float _5503 = fma(_5493, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    float _5505 = fma(_5497, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    out.m_67.x = _5499;
    out.m_110.x = _5501;
    out.m_110.y = _5503;
    out.m_110.z = _5505;
    if (!_5473)
    {
        return out;
    }
    float _5507 = -_4262;
    float _5509 = _5507 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5511 = -_4266;
    float _5513 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5515 = -_4272;
    float _5517 = _5515 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5519 = _5509 * _5509;
    float _5521 = fma(_5513, _5513, _5519);
    float _5523 = fma(_5517, _5517, _5521);
    float _5525 = sqrt(_5523);
    float _5527 = rsqrt(_5523);
    float _5529 = -_5525;
    float _5531 = _5529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5533 = _5531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5535 = precise::clamp(_5533, 0.0, 1.0);
    float _5537 = _5513 * _5527;
    float _5539 = _5509 * _5527;
    float _5541 = abs(_5535);
    float _5543 = log2(_5541);
    float _5545 = _5517 * _5527;
    float _5547 = _5537 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5549 = _4038 * _5539;
    float _5551 = -_5539;
    float _5553 = -_5547;
    float _5555 = fma(_5551, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5553);
    float _5557 = fma(_4036, _5537, _5549);
    float _5559 = -_5545;
    float _5561 = fma(_5559, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5555);
    float _5563 = fma(_4040, _5545, _5557);
    float _5565 = precise::clamp(_5563, 0.0, 1.0);
    float _5567 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5569 = _5561 + _5567;
    float _5571 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5573 = _5569 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5575 = precise::clamp(_5573, 0.0, 1.0);
    float _5577 = exp2(_5571);
    float _5579 = _5577 * _5575;
    float _5581 = _5565 * _5579;
    float _5583 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5585 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5587 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_108.x = _5583;
    out.m_108.y = _5585;
    out.m_108.z = _5587;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5359 = false;
    bool _4094 = false;
    bool _675 = false;
    bool _531 = false;
    bool _251 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_60.w;
    float _126 = in.m_62.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _135;
    bool _139 = _131 >= 1;
    float _141 = 0.0;
    float _143 = _126;
    float _145 = _135;
    if (!_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _141;
    if (!_139)
    {
        out.m_67.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5654 = as_type<float>(_153);
        out.gl_Position.z = _5654;
    }
    if (!_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _155 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_126);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_131);
    bool _167 = _135 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _143;
    if (_171)
    {
        out.m_67.x = 0.0;
    }
    float _177 = _135 * _173;
    int _179 = 0;
    float _181 = _177;
    if (_171)
    {
        float _183 = _175 * 5.0;
        _179 = as_type<int>(_183);
    }
    int _185 = _179;
    out.m_65.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5717 = as_type<float>(_185);
        out.gl_Position.z = _5717;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_72.x;
    float _191 = in.m_72.y;
    float _193 = in.m_72.z;
    int _195 = as_type<int>(_187) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_187) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _205 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _207 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _209 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _211 = !_197;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _215);
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _217);
    float _229 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _231 = !_203;
    float _249;
    if (!_231)
    {
        float _233 = in.m_74.x;
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _241 = _239 * _235;
        float _243 = floor(_241);
        float _245 = -_243;
        float _247 = _241 + _245;
        _249 = _247;
        _251 = true;
    }
    else
    {
        _249 = _177;
    }
    _251 = false;
    float _253 = _249;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _253 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _275 = 1.0 / _261;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _277;
    bool _281 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _283 = isnan(_253);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = 1.0 / _265;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _253 + _295;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _301 = 1.0 / _269;
    float _303 = _297 * _275;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = _253 + _305;
    float _309 = 1.0 / _273;
    float _311 = _257 * _293;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _253 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = _253 + _317;
    bool _321 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _323 = isnan(_253);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = 1.0 / _279;
    float _335 = _307 * _301;
    bool _337 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _339 = isnan(_253);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_347;
    float _351 = _349 + 1.0;
    float _353 = _315 * _309;
    float _355 = -_291;
    float _357 = _355 + 1.0;
    float _359 = _331 * _351;
    bool _361 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_253);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _347 * _357;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = _319 * _333;
    bool _385 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_253);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_331;
    float _399 = _397 + 1.0;
    float _401 = fma(_377, _303, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _403 = fma(_381, _303, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _405 = _253 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_253);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -_395;
    float _419 = _417 + 1.0;
    float _421 = _395 * _399;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _431 = _371 * _419;
    float _433 = -_371;
    float _435 = _433 + 1.0;
    float _437 = -_415;
    float _439 = _437 + 1.0;
    float _441 = fma(_429, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = fma(_425, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _415 * _435;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _447;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _451;
    float _455 = _401 * _445;
    float _457 = _403 * _445;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _455);
    float _465 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _457);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = fma(_449, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _473 = fma(_453, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _475 = fma(_441, _431, _463);
    float _477 = fma(_443, _431, _465);
    float _479 = fma(_469, _353, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_461, _353, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _487;
    float _491 = fma(_471, _421, _475);
    float _493 = fma(_473, _421, _477);
    float _495 = fma(_485, _383, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _497 = fma(_489, _383, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _499 = fma(_479, _359, _491);
    float _501 = fma(_481, _359, _493);
    float _503 = fma(_495, _373, _499);
    float _505 = fma(_497, _373, _501);
    float _507 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[148].x, _503);
    float _509 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[148].y, _505);
    bool _511 = !_299;
    float _529;
    if (!_511)
    {
        float _513 = in.m_74.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        _529 = _177;
    }
    _531 = false;
    float _533 = _529;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_533);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _561 = isnan(_533);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    bool _575 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_533);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _541;
    float _589 = -_553;
    float _591 = _589 + 1.0;
    bool _593 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _595 = _569 * _591;
    float _597 = -_569;
    float _599 = _597 + 1.0;
    float _601 = 1.0 / _557;
    float _603 = _573 * _587;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _609 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _611 = _607 * _601;
    float _613 = _609 * _595;
    float _615 = -_585;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _533 + _619;
    float _623 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[115].x, _613);
    float _625 = _553 * _617;
    float _627 = fma(_611, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _631 = fma(_627, _625, _623);
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[117].x, _631);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _641 = in.m_76.x;
    float _643 = in.m_76.y;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _635;
    out.m_78.y = _649;
    out.m_78.z = _645;
    out.m_78.w = _647;
    float _651 = _509 * _643;
    float _653 = _507 * _641;
    bool _655 = !_593;
    float _673;
    if (!_655)
    {
        float _657 = in.m_74.x;
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _661 = _657 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        _673 = _177;
    }
    _675 = false;
    float _677 = _673;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _681 = _677 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _695 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _697 = isnan(_677);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _685;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _713 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _715 = isnan(_677);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _727 = 1.0 / _693;
    float _729 = _689 * _707;
    bool _731 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _733 = isnan(_677);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _711;
    float _745 = -_705;
    float _747 = _745 + 1.0;
    float _749 = fma(_729, _681, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _755 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _757 = isnan(_677);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -_741;
    float _769 = _767 + 1.0;
    float _771 = _741 * _747;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _777 = 1.0 / _753;
    float _779 = -_765;
    float _781 = _779 + 1.0;
    float _783 = _723 * _769;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _785;
    float _789 = _775 * _727;
    float _791 = _705 * _781;
    float _793 = _749 * _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _797 = _677 + _795;
    float _799 = -_723;
    float _801 = _799 + 1.0;
    bool _803 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _805 = isnan(_677);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = _787 * _743;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _823 = _677 + _821;
    float _825 = fma(_789, _797, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _827 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[131].x, _793);
    float _829 = -_813;
    float _831 = _829 + 1.0;
    float _833 = _819 * _777;
    float _835 = fma(_815, _823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _839 = _677 + _837;
    float _841 = fma(_825, _771, _827);
    float _843 = _765 * _831;
    float _845 = fma(_833, _839, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _847 = fma(_835, _791, _841);
    float _849 = fma(_845, _843, _847);
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _857 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[135].x, _849);
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _859;
    out.m_80.y = _861;
    out.m_80.z = _863;
    out.m_80.w = _865;
    bool _867 = !_725;
    int _869 = as_type<int>(_793);
    float _871 = _791;
    if (!_867)
    {
        float _873 = in.m_74.x;
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _877 = _873 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _879 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _881 = _879 * _875;
        float _883 = floor(_881);
        float _885 = -_883;
        float _887 = _881 + _885;
        _181 = _887;
    }
    float _889 = _181;
    float _891 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _893 = int(_891);
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _897 = int(_895);
    float _899 = float(_893);
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _903 = int(_901);
    float _905 = float(_897);
    float _907 = 1.0 / _899;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _915 = int(_913);
    float _917 = float(uint(_903));
    int _919 = ~_903;
    int _921 = _919 + 1;
    float _923 = 1.0 / _905;
    float _925 = _907 * _135;
    if (_911)
    {
        _869 = 0;
    }
    int _927 = _869;
    float _929 = _907;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _933 = _927;
    if (_911)
    {
        float _935 = in.m_74.x;
        float _937 = in.m_74.y;
        _929 = _935;
        _931 = _937;
    }
    float _939 = _929;
    float _941 = _931;
    if (_911)
    {
        _871 = 1.0;
    }
    float _943 = _871;
    float _945 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _947 = int(_945);
    float _949 = float(uint(_915));
    int _951 = ~_915;
    int _953 = _951 + 1;
    float _955 = 1.0 / _917;
    float _957 = _923 * _135;
    float _959 = trunc(_925);
    int _961 = int(_959);
    float _963 = float(_947);
    float _965 = 0.0;
    float _967 = _963;
    float _969 = _939;
    float _971 = _943;
    float _973 = _941;
    if (_911)
    {
        _965 = _941;
    }
    float _975 = _965;
    float _977 = 1.0 / _949;
    int _979 = as_type<int>(_955) + (-2);
    float _981 = _955;
    float _983 = _975;
    if (_911)
    {
        _981 = _939;
    }
    float _985 = _981;
    float _987 = 0.0;
    float _989 = _985;
    if (_911)
    {
        _987 = _985;
    }
    float _991 = _987;
    float _993 = trunc(_957);
    int _995 = int(_993);
    float _997 = float(uint(_961));
    float _999 = as_type<float>(_979) * _997;
    int _1001 = as_type<int>(_977) + (-2);
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1005 = int(_1003);
    float _1007 = float(uint(_995));
    float _1009 = trunc(_999);
    float _1011 = precise::max(_1009, 0.0);
    uint _1014 = uint(_1011);
    float _1016 = as_type<float>(_1001) * _1007;
    float _1018 = _1007;
    float _1020 = _991;
    if (_911)
    {
        _1018 = 1.0;
    }
    float _1022 = _1018;
    float _1024 = trunc(_1016);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = 1.0 / _963;
    int _1032 = _921 * int(_1014);
    int _1034 = _1032 + _961;
    float _1036 = _1022;
    if (_911)
    {
        _967 = _985;
    }
    float _1038 = _967;
    float _1040 = _1038;
    if (!_911)
    {
        float _1042 = in.m_74.x;
        float _1044 = in.m_74.y;
        float _1046 = in.m_74.z;
        float _1048 = _1042 * 3.1415927410125732421875;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = _1044 * 3.1415927410125732421875;
        float _1054 = _1052 * 0.15915493667125701904296875;
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = sin(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1036 = 7.345489978790283203125;
        _969 = _1042;
        _971 = 5.839270114898681640625;
        _1040 = _1046;
        _973 = _1044;
        _989 = _1044;
        _983 = _1062;
        _933 = 2;
        _1020 = _1058;
    }
    float _1064 = _1036;
    float _1066 = _969;
    float _1068 = _971;
    float _1070 = _1040;
    float _1072 = _973;
    float _1074 = _989;
    float _1076 = _983;
    int _1078 = _933;
    float _1080 = _1020;
    int _1082 = _953 * int(_1028);
    int _1084 = _1082 + _995;
    float _1086 = float(uint(_1034));
    float _1088 = _1064 * _1066;
    float _1090 = _1068 * _1070;
    int _1092 = ~_903;
    int _1094 = _1092 + 1;
    float _1096 = _1030 * _135;
    float _1098 = float(uint(_1084));
    float _1100 = as_type<float>(_979) * _1086;
    float _1102 = floor(_1088);
    float _1104 = float(uint(_1005));
    float _1106 = _173 * _135;
    float _1108 = as_type<float>(_1001) * _1098;
    int _1110 = ~_915;
    int _1112 = _1110 + 1;
    float _1114 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1116 = ~_1005;
    int _1118 = _1116 + 1;
    float _1120 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = trunc(_1100);
    float _1124 = precise::max(_1122, 0.0);
    uint _1126 = uint(_1124);
    bool _1128 = _903 == 0;
    float _1130 = trunc(_1108);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    float _1136 = -_1102;
    float _1138 = _1088 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = floor(_1090);
    int _1154 = int(_1014) + int(_1126);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1156;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1162 = 1.0 / _1104;
    int _1164 = int(_1028) + int(_1134);
    int _1166 = _1094 * _1154;
    int _1168 = _1166 + _961;
    float _1170 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1160);
    float _1172 = float(_903);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1176 = uint(_1168) >= uint(_903);
    float _1178 = trunc(_1096);
    int _1180 = int(_1178);
    int _1182 = _1112 * _1164;
    int _1184 = _1182 + _995;
    float _1186 = _1138 * _1172;
    float _1188 = float(_915);
    float _1190 = -_1152;
    float _1192 = _1090 + _1190;
    float _1194 = _1064 * _1074;
    bool _1196 = uint(_1184) >= uint(_915);
    float _1198 = in.m_74.z;
    float _1200 = trunc(_1186);
    int _1202 = int(_1200);
    float _1204 = _1192 * _1188;
    int _1206 = as_type<int>(_1162) + (-2);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1212 = _1210 != 0;
    float _1214 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1174);
    bool _1216 = !_1176;
    int _1218 = _1216 ? 0 : (-1);
    float _1220 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1222 = float(uint(_1180));
    float _1224 = trunc(_1204);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1230 = _1228 != 0;
    float _1232 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1214);
    bool _1234 = !_1212;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = as_type<float>(_1206) * _1222;
    int _1240 = ~_1154;
    int _1242 = _1240 + _1218;
    int _1244 = _1242 + 1;
    float _1246 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1170);
    float _1248 = float(_961);
    float _1250 = trunc(_1238);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    bool _1256 = !_1230;
    int _1258 = _1256 ? 0 : 1;
    float _1260 = -_1246;
    float _1262 = _1260 + 1.0;
    int _1264 = abs(_1236);
    bool _1266 = !_1196;
    int _1268 = _1266 ? 0 : (-1);
    bool _1270 = _1248 >= _1172;
    bool _1272 = isnan(_1248);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(_1172);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = 1.0 / _1142;
    int _1284 = abs(_1258);
    int _1286 = ~_1164;
    int _1288 = _1286 + _1268;
    int _1290 = _1288 + 1;
    int _1292 = _1202 * _1264;
    int _1294 = _1292 + _961;
    bool _1296 = _1198 > 0.5;
    int _1298 = _903 * _1244;
    int _1300 = _1298 + _961;
    float _1302 = trunc(_1280);
    int _1304 = int(_1302);
    int _1306 = _1226 * _1284;
    int _1308 = _1306 + _995;
    bool _1310 = _1072 > 0.5;
    int _1312 = _915 * _1290;
    int _1314 = _1312 + _995;
    float _1316 = float(_995);
    int _1318 = _1118 * int(_1254);
    int _1320 = _1318 + _1180;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1328 = _1326 != 0;
    float _1330 = _1072 * 2.0;
    bool _1332 = _1316 >= _1188;
    bool _1334 = isnan(_1316);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1188);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_223;
    int _1346 = _1296 ? as_type<int>(_1344) : as_type<int>(_223);
    float _1348 = -_213;
    int _1350 = _1310 ? as_type<int>(_1348) : as_type<int>(_213);
    float _1352 = trunc(_1342);
    int _1354 = int(_1352);
    float _1356 = float(uint(_1320));
    bool _1358 = !_1328;
    float _1360 = _1358 ? _223 : as_type<float>(_1346);
    int _1362 = ~_1304;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    float _1368 = as_type<float>(_1206) * _1356;
    bool _1370 = !_1128;
    int _1372 = _1370 ? _1300 : (-1);
    float _1374 = _1172 * _1106;
    bool _1376 = !_1324;
    float _1378 = _1376 ? _213 : as_type<float>(_1350);
    float _1380 = floor(_1330);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1392 = _1390 != 0;
    int _1394 = _1372 * _1366;
    int _1396 = _903 + (-1);
    bool _1398 = _915 == 0;
    bool _1400 = !_1388;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = trunc(_1374);
    int _1406 = int(_1404);
    bool _1408 = !_1384;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = _1304 * _1396;
    int _1414 = _1412 + _1394;
    int _1416 = abs(_1402);
    int _1418 = abs(_1410);
    float _1420 = trunc(_1368);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1354;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    bool _1432 = !_1398;
    int _1434 = _1432 ? _1314 : (-1);
    int _1436 = _1414 * _1416;
    int _1438 = _915 + (-1);
    bool _1440 = !_1392;
    int _1442 = _1440 ? 0 : 1;
    int _1444 = _1434 * _1430;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1456 = _1454 != 0;
    int _1458 = _1406 * _1418;
    int _1460 = _1458 + _1436;
    float _1462 = _1188 * _1106;
    int _1464 = _1354 * _1438;
    int _1466 = _1464 + _1444;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1470 = _1468 != 0;
    bool _1472 = !_1452;
    int _1474 = _1472 ? 0 : 1;
    bool _1476 = !_1448;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = trunc(_1462);
    int _1482 = int(_1480);
    int _1484 = abs(_1474);
    bool _1486 = !_1470;
    int _1488 = _1486 ? 0 : 1;
    int _1490 = abs(_1442);
    int _1492 = abs(_1478);
    int _1494 = abs(_1488);
    int _1496 = int(_1254) + int(_1424);
    int _1498 = _1294 * _1490;
    int _1500 = _1498 + _1460;
    float _1502 = floor(_1194);
    int _1504 = ~_1005;
    int _1506 = _1504 + 1;
    int _1508 = _1202 * _1494;
    int _1510 = _1508 + _1500;
    int _1512 = _1466 * _1484;
    int _1514 = int(_1470);
    int _1516 = _1230 ? 2 : 0;
    int _1518 = _1514 | _1516;
    int _1520 = _1310 ? 4 : 0;
    int _1522 = _1518 | _1520;
    int _1524 = _1196 ? 8 : 0;
    int _1526 = _1522 | _1524;
    int _1528 = _1448 ? 16 : 0;
    int _1530 = _1526 | _1528;
    int _1532 = _1452 ? 32 : 0;
    int _1534 = _1530 | _1532;
    int _1536 = _1456 ? 64 : 0;
    int _1538 = _1534 | _1536;
    int _1540 = _1538 & 4;
    int _1542 = _1506 * _1496;
    int _1544 = _1542 + _1180;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1548 = _1546 != 0;
    int _1550 = _1482 * _1492;
    int _1552 = _1550 + _1512;
    float _1554 = float(uint(_1510));
    bool _1556 = !_1456;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = uint(_1544) >= uint(_1005);
    float _1562 = as_type<float>(_979) * _1554;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1566 = _1564 != 0;
    float _1568 = -_1502;
    float _1570 = _1194 + _1568;
    bool _1572 = _1540 != 0;
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    bool _1580 = !_1548;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = abs(_1558);
    bool _1586 = !_1566;
    int _1588 = _1586 ? 0 : 1;
    bool _1590 = !_1560;
    int _1592 = _1590 ? 0 : (-1);
    int _1594 = _1308 * _1584;
    int _1596 = _1594 + _1552;
    int _1598 = abs(_1582);
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1602 = _1600 != 0;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1606 = _1604 != 0;
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1610 = _1608 != 0;
    int _1612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1614 = _1612 != 0;
    float _1616 = float(_1005);
    float _1618 = float(_1180);
    float _1620 = _1570 * _1616;
    bool _1622 = !_1606;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1628 = _1626 != 0;
    int _1630 = _1226 * _1598;
    int _1632 = _1630 + _1596;
    bool _1634 = _1618 >= _1616;
    bool _1636 = isnan(_1618);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(_1616);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = trunc(_1620);
    int _1648 = int(_1646);
    int _1650 = ~_903;
    int _1652 = _1650 + 1;
    float _1654 = _1616 * _1106;
    int _1656 = ~_1496;
    int _1658 = _1656 + _1592;
    int _1660 = _1658 + 1;
    float _1662 = float(uint(_1632));
    float _1664 = trunc(_1644);
    int _1666 = int(_1664);
    bool _1668 = !_1602;
    float _1670 = _1668 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1672 = _1652 * int(_1578);
    int _1674 = _1672 + _1510;
    float _1676 = _1562;
    float _1678 = _1670;
    if (_1628)
    {
        float _1680 = in.m_74.w;
        _1676 = _1680;
    }
    float _1682 = _1676;
    bool _1684 = _1005 == 0;
    float _1686 = as_type<float>(_1001) * _1662;
    int _1688 = abs(_1588);
    float _1690 = float(uint(_1674));
    int _1692 = _1005 * _1660;
    int _1694 = _1692 + _1180;
    float _1696 = trunc(_1686);
    float _1698 = precise::max(_1696, 0.0);
    uint _1700 = uint(_1698);
    int _1702 = _1005 + (-1);
    float _1704 = as_type<float>(_979) * _1690;
    bool _1706 = !_1684;
    int _1708 = _1706 ? _1694 : (-1);
    int _1710 = ~_1666;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = abs(_1624);
    float _1718 = trunc(_1704);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1708 * _1714;
    int _1726 = ~_915;
    int _1728 = _1726 + 1;
    int _1730 = _1666 * _1702;
    int _1732 = _1730 + _1724;
    bool _1734 = !_1610;
    int _1736 = _1734 ? 0 : 1;
    float _1738 = trunc(_1654);
    int _1740 = int(_1738);
    int _1742 = _1648 * _1688;
    int _1744 = _1742 + _1180;
    int _1746 = _1732 * _1716;
    float _1748 = as_type<float>(_1732);
    if (_1628)
    {
        float _1750 = _1682 * 3.1415927410125732421875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = abs(as_type<int>(_1670));
    int _1756 = _1728 * int(_1700);
    int _1758 = _1756 + _1632;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1762 = _1760 != 0;
    if (_1628)
    {
        float _1764 = _1752 * 0.15915493667125701904296875;
        _1678 = _1764;
    }
    float _1766 = _1678;
    int _1768 = ~_903;
    int _1770 = _1768 + 1;
    int _1772 = int(_1578) + int(_1722);
    float _1774 = _1766;
    if (_1628)
    {
        float _1776 = _1766 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        _1774 = _1778;
    }
    float _1780 = _1774;
    float _1782 = float(uint(_1758));
    int _1784 = _1740 * _1754;
    int _1786 = _1784 + _1746;
    bool _1788 = !_1614;
    int _1790 = _1788 ? 0 : 1;
    int _1792 = _1770 * _1772;
    int _1794 = _1792 + _1510;
    int _1796 = abs(_1736);
    float _1798 = as_type<float>(_1001) * _1782;
    int _1800 = abs(_1790);
    float _1802 = as_type<float>(_1740);
    if (_1762)
    {
        float _1804 = in.m_74.x;
        _1802 = _1804;
    }
    float _1806 = _1802;
    bool _1808 = uint(_1794) >= uint(_903);
    float _1810 = trunc(_1798);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    float _1816 = float(uint(_1294));
    int _1818 = _1744 * _1796;
    int _1820 = _1818 + _1786;
    bool _1822 = !_1808;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = as_type<float>(_979) * _1816;
    bool _1828 = _903 == 0;
    int _1830 = _1648 * _1800;
    int _1832 = _1830 + _1820;
    int _1834 = ~_1772;
    int _1836 = _1834 + _1824;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1826);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    bool _1846 = _1808;
    float _1848 = _1780;
    if (_1628)
    {
        bool _1850 = _1780 > 0.5;
        _1846 = _1850;
    }
    bool _1852 = _1846;
    float _1854 = float(uint(_1832));
    int _1856 = _903 * _1838;
    int _1858 = _1856 + _1510;
    int _1860 = int(_1700) + int(_1814);
    int _1862 = ~_903;
    int _1864 = _1862 + 1;
    float _1866 = as_type<float>(_1206) * _1854;
    float _1868 = float(uint(_1308));
    if (_1762)
    {
        float _1870 = _1806 * 3.1415927410125732421875;
        _1848 = _1870;
    }
    float _1872 = _1848;
    bool _1874 = !_1828;
    int _1876 = _1874 ? _1858 : (-1);
    float _1878 = trunc(_1866);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    float _1884 = 0.0;
    float _1886 = _1872;
    if (!_1628)
    {
        _1884 = _213;
    }
    float _1888 = _1884;
    float _1890 = as_type<float>(_1001) * _1868;
    float _1892 = _1888;
    if (_1628)
    {
        float _1894 = -_213;
        float _1896 = _1852 ? _1894 : _213;
        _1892 = _1896;
    }
    float _1898 = _1892;
    int _1900 = _1864 * int(_1844);
    int _1902 = _1900 + _1294;
    int _1904 = ~_915;
    int _1906 = _1904 + 1;
    if (_1762)
    {
        float _1908 = _1872 * 0.15915493667125701904296875;
        _1886 = _1908;
    }
    float _1910 = _1886;
    int _1912 = _1876 & 3;
    bool _1914 = _1912 != 0;
    float _1916 = trunc(_1890);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = _1876 & 3;
    bool _1924 = _1922 != 0;
    float _1926 = float(uint(_1902));
    int _1928 = _1914 ? 0 : 1;
    float _1930 = as_type<float>(_979) * _1926;
    bool _1932 = uint(_1922) > 1u;
    float _1934 = as_type<float>(_979);
    if (_1762)
    {
        float _1936 = _1910 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        _1934 = _1938;
    }
    float _1940 = _1934;
    int _1942 = ~_1005;
    int _1944 = _1942 + 1;
    int _1946 = _1906 * _1860;
    int _1948 = _1946 + _1632;
    int _1950 = ~_1928;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    int _1956 = ~_915;
    int _1958 = _1956 + 1;
    int _1960 = _1944 * int(_1882);
    int _1962 = _1960 + _1832;
    bool _1964 = uint(_1948) >= uint(_915);
    float _1966 = trunc(_1930);
    float _1968 = precise::max(_1966, 0.0);
    uint _1970 = uint(_1968);
    float _1972 = -_223;
    int _1974 = _1572 ? as_type<int>(_1972) : as_type<int>(_223);
    float _1976 = float(uint(_1962));
    int _1978 = _1954;
    if (!_1932)
    {
        int _1980 = ~_1928;
        int _1982 = _1980 + 1;
        _1978 = _1982;
    }
    int _1984 = _1978;
    int _1986 = _1958 * int(_1920);
    int _1988 = _1986 + _1308;
    bool _1990 = !_1964;
    int _1992 = _1990 ? 0 : (-1);
    bool _1994 = _1922 != 3;
    bool _1996 = uint(_1922) >= 2u;
    int _1998 = ~_1860;
    int _2000 = _1998 + _1992;
    int _2002 = _2000 + 1;
    float _2004 = as_type<float>(_1206) * _1976;
    int _2006 = _1996 ? 0 : 1;
    bool _2008 = _1996;
    if (_1762)
    {
        bool _2010 = _1940 > 0.5;
        _2008 = _2010;
    }
    bool _2012 = _2008;
    int _2014 = _915 * _2002;
    int _2016 = _2014 + _1632;
    float _2018 = trunc(_2004);
    float _2020 = precise::max(_2018, 0.0);
    uint _2022 = uint(_2020);
    bool _2024 = _915 == 0;
    int _2026 = ~_2006;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = _2030;
    if (_1994)
    {
        int _2034 = ~_2006;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    bool _2040 = !_2024;
    int _2042 = _2040 ? _2016 : (-1);
    float _2044 = 0.0;
    if (!_1762)
    {
        _2044 = _223;
    }
    float _2046 = _2044;
    float _2048 = float(uint(_1988));
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2052 = _2050 != 0;
    float _2054 = _2046;
    if (_1762)
    {
        float _2056 = -_223;
        float _2058 = _2012 ? _2056 : _223;
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = as_type<float>(_1001) * _2048;
    int _2064 = _2042 & 3;
    bool _2066 = _2064 != 0;
    bool _2068 = !_2052;
    float _2070 = _2068 ? _223 : as_type<float>(_1974);
    float _2072 = _2060 + (-0.5);
    bool _2074 = uint(_2064) > 1u;
    float _2076 = trunc(_2062);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    int _2082 = ~_1005;
    int _2084 = _2082 + 1;
    int _2086 = _2042 & 3;
    bool _2088 = _2086 != 0;
    int _2090 = int(_1882) + int(_2022);
    int _2092 = int(_1844) + int(_1970);
    int _2094 = ~_903;
    int _2096 = _2094 + 1;
    int _2098 = _2084 * _2090;
    int _2100 = _2098 + _1832;
    int _2102 = _2088 ? 0 : 1;
    int _2104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2106 = _2104 != 0;
    int _2108 = _2096 * _2092;
    int _2110 = _2108 + _1294;
    float _2112 = float(uint(_1744));
    bool _2114 = !_2106;
    int _2116 = _2114 ? 0 : 1;
    int _2118 = ~_2102;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    bool _2124 = uint(_2100) >= uint(_1005);
    int _2126 = _2122;
    if (!_2074)
    {
        int _2128 = ~_2102;
        int _2130 = _2128 + 1;
        _2126 = _2130;
    }
    int _2132 = _2126;
    float _2134 = as_type<float>(_1206) * _2112;
    bool _2136 = uint(_2110) >= uint(_903);
    bool _2138 = !_2124;
    int _2140 = _2138 ? 0 : (-1);
    float _2142 = trunc(_2134);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    bool _2148 = _2064 != 3;
    bool _2150 = !_2136;
    int _2152 = _2150 ? 0 : (-1);
    bool _2154 = uint(_2064) >= 2u;
    int _2156 = ~_2090;
    int _2158 = _2156 + _2140;
    int _2160 = _2158 + 1;
    int _2162 = ~_915;
    int _2164 = _2162 + 1;
    int _2166 = int(_1920) + int(_2080);
    int _2168 = _1005 * _2160;
    int _2170 = _2168 + _1832;
    int _2172 = _2154 ? 0 : 1;
    int _2174 = ~_1005;
    int _2176 = _2174 + 1;
    int _2178 = _2164 * _2166;
    int _2180 = _2178 + _1308;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2184 = _2182 != 0;
    int _2186 = ~_2172;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2190;
    if (_2148)
    {
        int _2194 = ~_2172;
        int _2196 = _2194 + 1;
        _2192 = _2196;
    }
    int _2198 = _2192;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2202 = _2200 != 0;
    bool _2204 = !_2184;
    int _2206 = _2204 ? 0 : 1;
    bool _2208 = uint(_2180) >= uint(_915);
    int _2210 = _2176 * int(_2146);
    int _2212 = _2210 + _1744;
    bool _2214 = !_1684;
    int _2216 = _2214 ? _2170 : (-1);
    bool _2218 = !_2202;
    int _2220 = _2218 ? 0 : 1;
    bool _2222 = !_2208;
    int _2224 = _2222 ? 0 : (-1);
    int _2226 = _2216 & 3;
    bool _2228 = _2226 != 0;
    int _2230 = _2216 & 3;
    bool _2232 = _2230 != 0;
    float _2234 = float(uint(_2212));
    int _2236 = _2228 ? 0 : 1;
    bool _2238 = uint(_2230) > 1u;
    float _2240 = as_type<float>(_1206) * _2234;
    int _2242 = ~_2236;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    float _2248 = trunc(_2240);
    float _2250 = precise::max(_2248, 0.0);
    uint _2252 = uint(_2250);
    int _2254 = ~_2166;
    int _2256 = _2254 + _2224;
    int _2258 = _2256 + 1;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2262 = _2260 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2268 = abs(_2206);
    float _2270 = 1.0 / _2262;
    int _2272 = _2246;
    float _2274 = as_type<float>(_2198);
    if (!_2238)
    {
        int _2276 = ~_2236;
        int _2278 = _2276 + 1;
        _2272 = _2278;
    }
    int _2280 = _2272;
    int _2282 = _915 * _2258;
    int _2284 = _2282 + _1308;
    bool _2286 = uint(_2230) >= 2u;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2290 = _889 + _2288;
    bool _2292 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2294 = isnan(_889);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2300 = _2296 || _2298;
    float _2302 = float(_2300);
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2306 = _2286 ? 0 : 1;
    float _2308 = 1.0 / _2266;
    bool _2310 = _2230 != 3;
    float _2312 = -_2302;
    float _2314 = _2312 + 1.0;
    int _2316 = int(_2146) + int(_2252);
    float _2318 = fma(_1220, -2.0, _2304);
    int _2320 = ~_2306;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    int _2326 = _1944 * _2316;
    int _2328 = _2326 + _1744;
    float _2330 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2318);
    int _2332 = ~_2092;
    int _2334 = _2332 + _2152;
    int _2336 = _2334 + 1;
    float _2338 = -_2072;
    float _2340 = -_2330;
    float _2342 = fma(_2338, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2340);
    int _2344 = _2324;
    if (_2310)
    {
        int _2346 = ~_2306;
        int _2348 = _2346 + 1;
        _2344 = _2348;
    }
    int _2350 = _2344;
    bool _2352 = uint(_2328) >= uint(_1005);
    float _2354 = in.m_60.x;
    float _2356 = in.m_60.y;
    float _2358 = in.m_60.z;
    int _2360 = _903 * _2336;
    int _2362 = _2360 + _1294;
    int _2364 = abs(_1984);
    bool _2366 = !_2352;
    int _2368 = _2366 ? 0 : (-1);
    bool _2370 = _1066 > 0.5;
    int _2372 = ~_2316;
    int _2374 = _2372 + _2368;
    int _2376 = _2374 + 1;
    float _2378 = -_213;
    int _2380 = _2370 ? as_type<int>(_2378) : as_type<int>(_213);
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2384 = _2382 != 0;
    float _2386 = _1066 * 2.0;
    int _2388 = _1005 * _2376;
    int _2390 = _2388 + _1744;
    int _2392 = ~_2364;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    bool _2398 = !_2384;
    float _2400 = _2398 ? _213 : as_type<float>(_2380);
    float _2402 = floor(_2386);
    bool _2404 = _1078 != 2;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2410 = abs(_2280);
    float _2412 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2414 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2416 = _2356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2418 = 1.0 / _2408;
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2412);
    float _2422 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2414);
    float _2424 = fma(_2354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2416);
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2428 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2430 = 0.0;
    if (_2404)
    {
        _2430 = _1066;
    }
    float _2432 = _2430;
    float _2434 = 1.0 / _2428;
    float _2436 = 0.0;
    float _2438 = _2432;
    if (_2404)
    {
        _2436 = _1072;
    }
    float _2440 = _2436;
    float _2442 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2444 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2442;
    float _2446 = _2440;
    if (!_2404)
    {
        _2438 = _1198;
    }
    float _2448 = _2438;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2452 = _2450 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (!_2404)
    {
        _2446 = _1066;
    }
    float _2454 = _2446;
    float _2456 = _2444 * _2270;
    bool _2458 = _2402 >= 0.0;
    bool _2460 = isnan(_2402);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.0);
    bool _2466 = _2462 || _2464;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2468;
    float _2472 = _2452 * _2308;
    int _2474 = _2466 ? 0 : 1;
    float _2476 = _2470 * _1282;
    bool _2478 = _2402 > 0.0;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2484 = ~_2474;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = _1146 * _2434;
    float _2492 = fma(_2476, _2290, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2496 = _889 + _2494;
    float _2498 = 1.0 / _2482;
    float _2500 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2506 = _1198 * 2.0;
    float _2508 = fma(_2490, _2496, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2512 = _889 + _2510;
    int _2514 = _2488;
    if (!_2478)
    {
        int _2516 = ~_2474;
        int _2518 = _2516 + 1;
        _2514 = _2518;
    }
    int _2520 = _2514;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2526 = _1380 >= 0.0;
    bool _2528 = isnan(_1380);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(0.0);
    bool _2534 = _2530 || _2532;
    float _2536 = floor(_2506);
    int _2538 = ~_2410;
    int _2540 = _2538 + 1;
    int _2542 = _2540 + 1;
    float _2544 = _2524 * _2418;
    int _2546 = _2534 ? 0 : 1;
    bool _2548 = _1380 > 0.0;
    bool _2550 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2552 = isnan(_889);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2558);
    float _2562 = 1.0 / _2504;
    float _2564 = _1150 * _2498;
    int _2566 = ~_2546;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = -_2560;
    float _2574 = _2572 + 1.0;
    bool _2576 = !_2232;
    int _2578 = _2576 ? 0 : 1;
    int _2580 = abs(_2350);
    bool _2582 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2584 = isnan(_889);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    int _2594 = _2570;
    if (!_2548)
    {
        int _2596 = ~_2546;
        int _2598 = _2596 + 1;
        _2594 = _2598;
    }
    int _2600 = _2594;
    bool _2602 = !_2024;
    int _2604 = _2602 ? _2284 : (-1);
    float _2606 = _2592 * _2574;
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2610 = _2608 != 0;
    int _2612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2614 = _2612 != 0;
    int _2616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2618 = _2616 != 0;
    float _2620 = -_2592;
    float _2622 = _2620 + 1.0;
    bool _2624 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2626 = isnan(_889);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = _1158 * _2562;
    bool _2638 = !_1924;
    int _2640 = _2638 ? 0 : 1;
    float _2642 = _2302 * _2622;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2646 = _889 + _2644;
    bool _2648 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2650 = isnan(_889);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2656 = _2652 || _2654;
    float _2658 = float(_2656);
    float _2660 = _2634 * _2314;
    bool _2662 = _2536 >= 0.0;
    bool _2664 = isnan(_2536);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = -_2634;
    float _2674 = _2672 + 1.0;
    float _2676 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2420);
    float _2678 = fma(_2456, _2646, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2680 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2424);
    bool _2682 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2684 = isnan(_889);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2690 = _2686 || _2688;
    float _2692 = float(_2690);
    float _2694 = -_2658;
    float _2696 = _2694 + 1.0;
    int _2698 = _2670 ? 0 : 1;
    float _2700 = fma(_2636, _2512, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _2702 = _2536 > 0.0;
    float _2704 = fma(_2358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2422);
    bool _2706 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2708 = isnan(_889);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2692 * _2696;
    float _2720 = -_2692;
    float _2722 = _2720 + 1.0;
    float _2724 = _2658 * _2674;
    bool _2726 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2728 = isnan(_889);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2734 = _2730 || _2732;
    float _2736 = float(_2734);
    float _2738 = -_2716;
    float _2740 = _2738 + 1.0;
    float _2742 = _2716 * _2722;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2746 = _889 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2750 = _889 + _2748;
    float _2752 = _2736 * _2740;
    float _2754 = -_2736;
    float _2756 = _2754 + 1.0;
    float _2758 = fma(_2472, _2746, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2762 = _889 + _2760;
    float _2764 = _2678 * _2752;
    int _2766 = _2042 >> 31;
    float _2768 = fma(_2564, _2750, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2770 = fma(_2544, _2762, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2772 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2764);
    int _2774 = _2766 & 3;
    float _2776 = _1072 + _1066;
    int _2778 = ~_2698;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    float _2784 = _1072 + (-0.5);
    int _2786 = _2782;
    if (!_2702)
    {
        int _2788 = ~_2698;
        int _2790 = _2788 + 1;
        _2786 = _2790;
    }
    int _2792 = _2786;
    float _2794 = fma(_2758, _2742, _2772);
    int _2796 = _2042 + _2774;
    float _2798 = _1066 + (-0.5);
    float _2800 = _2680 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2802 = _2704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2808 = _2796 >> 2;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2812 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2804);
    float _2814 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2806);
    float _2816 = _1066 + _1198;
    float _2818 = -_2810;
    float _2820 = fma(_1114, 2.0, _2818);
    float _2822 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2824 = _1072 + _1198;
    int _2826 = _2808 << 4;
    int _2828 = _2826 + 656;
    float _2830 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2822);
    float _2832 = fma(_2492, _2718, _2794);
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    uint _2836 = uint(int(uint(_2828) >> uint(2)));
    uint _2838 = uint(int(uint(int(_2836)) >> uint(2)));
    int _2840 = int(_2836) & 3;
    float _2842 = (*spvDescriptorSet0.vp_c9)._m0[int(_2838)][_2840];
    int _2844 = int(_2836) + 1;
    uint _2846 = uint(int(uint(_2844) >> uint(2)));
    int _2848 = _2844 & 3;
    float _2850 = (*spvDescriptorSet0.vp_c9)._m0[int(_2846)][_2848];
    float _2852 = fma(_2770, _2724, _2832);
    float _2854 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2834);
    float _2856 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2858 = _2776 + (-1.0);
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2864 = _2800 + _2862;
    float _2866 = -_1208;
    float _2868 = fma(_2856, 2.0, _2866);
    float _2870 = _2676 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2872 = fma(_1120, -2.0, _2860);
    int _2874 = _2828 + 8;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2894 = _2802 + _2892;
    float _2896 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2898 = _2870 + _2896;
    float _2900 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2902 = _1898 + 0.5;
    float _2904 = _2894 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2906 = -_135;
    float _2908 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2868);
    float _2910 = fma(_2508, _2660, _2852);
    float _2912 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2872);
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2904);
    bool _2916 = !_2066;
    int _2918 = _2916 ? 0 : 1;
    float _2920 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2908);
    bool _2922 = _2064 != 3;
    float _2924 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2914);
    int _2926 = abs(_2132);
    float _2928 = -_135;
    float _2930 = fma(_2928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2820);
    bool _2932 = !_2922;
    int _2934 = _2932 ? 0 : (-1);
    float _2936 = _2400 + 0.5;
    float _2938 = _2070 + (-0.5);
    bool _2940 = _2924 >= 0.0;
    float _2942 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2930);
    int _2944 = ~_2926;
    int _2946 = _2944 + 1;
    int _2948 = _2946 + 1;
    float _2950 = fma(_2768, _2642, _2910);
    int _2952 = abs(_2918);
    float _2954 = -_2938;
    float _2956 = -_2912;
    float _2958 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2956);
    int _2960 = abs(_2198);
    float _2962 = _2448 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2964 = ~_2952;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2854);
    int _2972 = ~_2960;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2812);
    float _2980 = -_2970;
    float _2982 = _2980 + 1.0;
    if (_2940)
    {
        _2274 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2984 = _2274;
    float _2986 = -_2978;
    float _2988 = _2986 + 1.0;
    bool _2990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2992 = isnan(0.0);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2998 = _2994 || _2996;
    int _3000 = _2948 * as_type<int>(_2850);
    float _3002 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3004 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3006 = int(_3004);
    int _3008 = _2968 * as_type<int>(_2842);
    int _3010 = _3008 + _3000;
    int _3012 = as_type<int>(_2984);
    if (_2940)
    {
        float _3014 = _2984 * 5.0;
        _3012 = as_type<int>(_3014);
    }
    int _3016 = _3012;
    int _3018 = abs(_2934);
    float _3020 = -_3002;
    float _3022 = fma(_2962, 2.0, _3020);
    float _3024 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2814);
    if (_2940)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9851 = as_type<float>(_3016);
        out.gl_Position.z = _9851;
    }
    int _3026 = _2976 * as_type<int>(_2882);
    int _3028 = _3026 + _3010;
    float _3030 = -_1232;
    float _3032 = _3030 + 1.0;
    float _3034 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3036 = log2(_3034);
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3040 = !_2610;
    int _3042 = _3040 ? 0 : 1;
    float _3044 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2830);
    float _3046 = -_135;
    float _3048 = fma(_3046, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3022);
    float _3050 = fma(_2500, -2.0, _3038);
    float _3052 = float(_2792);
    float _3054 = fma(_2700, _2606, _2950);
    bool _3056 = _1922 != 3;
    float _3058 = -_2982;
    float _3060 = fma(_3058, _1898, _2920);
    float _3062 = float(uint(_3006));
    float _3064 = fma(_3032, _2060, _2342);
    int _3066 = ~_3018;
    int _3068 = _3066 + 1;
    int _3070 = _3068 + 1;
    float _3072 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3050);
    float _3074 = 1.0 / _3062;
    int _3076 = ~_2268;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    out.m_82.x = _3060;
    out.m_82.y = _3064;
    int _3082 = _3070 * as_type<int>(_2890);
    int _3084 = _3082 + _3028;
    float _3086 = _3036 * _135;
    float _3088 = -_3024;
    float _3090 = _3088 + 1.0;
    int _3092 = _3084 * _3080;
    int _3094 = abs(_2578);
    float _3096 = exp2(_3086);
    int _3098 = abs(_3006);
    float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3102 = 1.0 + _3100;
    float _3104 = -_2988;
    float _3106 = fma(_2400, _3104, _2942);
    float _3108 = fma(_2070, _1262, _2958);
    int _3110 = _2604 * _2268;
    int _3112 = _3110 + _3092;
    int _3114 = _1876 >> 31;
    float _3116 = 1.0 / _3102;
    float _3118 = float(uint(_3098));
    out.m_84.x = _3106;
    out.m_84.y = _3108;
    int _3120 = as_type<int>(_3074) + (-2);
    float _3122 = -_3044;
    float _3124 = _3122 + 1.0;
    float _3126 = float(uint(_3112));
    float _3128 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3054);
    int _3130 = _3114 & 3;
    float _3132 = 1.0 / _3118;
    int _3134 = _2216 >> 31;
    float _3136 = as_type<float>(_3120) * _3126;
    int _3138 = _1876 + _3130;
    float _3140 = _2894 * _2894;
    float _3142 = -_3096;
    float _3144 = _3142 + 1.0;
    int _3146 = _3134 & 3;
    out.m_86.x = _3128;
    float _3148 = trunc(_3136);
    float _3150 = precise::max(_3148, 0.0);
    uint _3152 = uint(_3150);
    float _3154 = fma(_2898, _2898, _3140);
    float _3156 = _2998 ? _3144 : 0.0;
    float _3158 = 1.0;
    if (_2940)
    {
        out.m_67.x = 0.0;
    }
    int _3160 = _3138 >> 2;
    float _3162 = fma(_2864, _2864, _3154);
    int _3164 = abs(_3112);
    int _3166 = _2216 + _3146;
    int _3168 = as_type<int>(_3132) + (-2);
    float _3170 = rsqrt(_3162);
    int _3172 = _3160 << 4;
    int _3174 = _3172 + 368;
    float _3176 = float(uint(_3164));
    bool _3178 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3180 = isnan(1.0);
    bool _3182 = _3178 || _3180;
    bool _3184 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3186 = _3182 || _3184;
    uint _3188 = uint(int(uint(_3174) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    int _3204 = _3166 >> 2;
    float _3206 = as_type<float>(_3168) * _3176;
    int _3208 = ~_3006;
    int _3210 = _3208 + 1;
    int _3212 = _3204 << 4;
    int _3214 = _3212 + 800;
    int _3216 = ~_3094;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3210 * int(_3152);
    int _3224 = _3222 + _3112;
    uint _3226 = uint(int(uint(_3214) >> uint(2)));
    uint _3228 = uint(int(uint(int(_3226)) >> uint(2)));
    int _3230 = int(_3226) & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    int _3234 = int(_3226) + 1;
    uint _3236 = uint(int(uint(_3234) >> uint(2)));
    int _3238 = _3234 & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    float _3242 = trunc(_3206);
    float _3244 = precise::max(_3242, 0.0);
    uint _3246 = uint(_3244);
    bool _3248 = _903 == 0;
    if (_3186)
    {
        float _3250 = _3156 * _3116;
        _145 = _3250;
    }
    float _3252 = _145;
    float _3254 = float(uint(_3224));
    float _3256 = _2894 * _3170;
    int _3258 = abs(_3042);
    float _3260 = _2898 * _3170;
    int _3262 = _3214 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    float _3280 = as_type<float>(_3120) * _3254;
    int _3282 = ~_3098;
    int _3284 = _3282 + 1;
    float _3286 = -_3256;
    float _3288 = fma(_3286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2894);
    float _3290 = float(_3258);
    float _3292 = -_3260;
    float _3294 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2898);
    float _3296 = trunc(_3280);
    float _3298 = precise::max(_3296, 0.0);
    uint _3300 = uint(_3298);
    bool _3302 = !_3248;
    int _3304 = _3302 ? _2362 : (-1);
    float _3306 = _3290 * _3052;
    bool _3308 = !_1684;
    int _3310 = _3308 ? _2390 : (-1);
    int _3312 = _3174 + 8;
    uint _3314 = uint(int(uint(_3312) >> uint(2)));
    uint _3316 = uint(int(uint(int(_3314)) >> uint(2)));
    int _3318 = int(_3314) & 3;
    float _3320 = (*spvDescriptorSet0.vp_c9)._m0[int(_3316)][_3318];
    int _3322 = int(_3314) + 1;
    uint _3324 = uint(int(uint(_3322) >> uint(2)));
    int _3326 = _3322 & 3;
    float _3328 = (*spvDescriptorSet0.vp_c9)._m0[int(_3324)][_3326];
    int _3330 = _3284 * int(_3246);
    int _3332 = _3330 + _3164;
    float _3334 = _3288 * _3288;
    float _3336 = _3306 * (-2.0);
    bool _3338 = !_2618;
    int _3340 = _3338 ? 0 : 1;
    float _3342 = float(uint(_3332));
    float _3344 = fma(_3294, _3294, _3334);
    float _3346 = fma(_2900, _3336, _2900);
    float _3348 = as_type<float>(_3168) * _3342;
    int _3350 = int(_3152) + int(_3300);
    int _3352 = ~_3006;
    int _3354 = _3352 + 1;
    float _3356 = trunc(_3348);
    float _3358 = precise::max(_3356, 0.0);
    uint _3360 = uint(_3358);
    int _3362 = _3354 * _3350;
    int _3364 = _3362 + _3112;
    int _3366 = _2396 * as_type<int>(_3202);
    int _3368 = abs(_2640);
    int _3370 = ~_3098;
    int _3372 = _3370 + 1;
    int _3374 = ~_3368;
    int _3376 = _3374 + 1;
    int _3378 = _3376 + 1;
    int _3380 = _2542 * as_type<int>(_3240);
    bool _3382 = !_3056;
    int _3384 = _3382 ? 0 : (-1);
    int _3386 = _3378 * as_type<int>(_3194);
    int _3388 = _3386 + _3366;
    bool _3390 = uint(_3364) >= uint(_3006);
    int _3392 = _3220 * as_type<int>(_3232);
    int _3394 = _3392 + _3380;
    int _3396 = int(_3246) + int(_3360);
    bool _3398 = !_3390;
    int _3400 = _3398 ? 0 : (-1);
    int _3402 = abs(_2038);
    int _3404 = _3372 * _3396;
    int _3406 = _3404 + _3164;
    bool _3408 = _2230 != 3;
    int _3410 = ~_3402;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    bool _3416 = !_3408;
    int _3418 = _3416 ? 0 : (-1);
    bool _3420 = uint(_3406) >= uint(_3098);
    int _3422 = abs(_3384);
    int _3424 = _3414 * as_type<int>(_3320);
    int _3426 = _3424 + _3388;
    int _3428 = ~_3350;
    int _3430 = _3428 + _3400;
    int _3432 = _3430 + 1;
    int _3434 = _3006 * _3432;
    int _3436 = _3434 + _3112;
    bool _3438 = !_3420;
    int _3440 = _3438 ? 0 : (-1);
    int _3442 = _3112 ^ _3006;
    bool _3444 = _3006 == 0;
    int _3446 = ~_3422;
    int _3448 = _3446 + 1;
    int _3450 = _3448 + 1;
    int _3452 = ~_2580;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = abs(_3418);
    int _3460 = _3450 * as_type<int>(_3328);
    int _3462 = _3460 + _3426;
    uint _3464 = uint(int(uint(_3442) >> uint(31)));
    int _3466 = _3456 * as_type<int>(_3270);
    int _3468 = _3466 + _3394;
    bool _3470 = !_3444;
    int _3472 = _3470 ? _3436 : (-1);
    bool _3474 = _3006 == 0;
    float _3476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3478 = ~_3440;
    int _3480 = _3396 + _3478;
    int _3482 = _3480 + 1;
    int _3484 = ~int(_3464);
    int _3486 = _3484 + 1;
    int _3488 = abs(_2116);
    float _3490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3492 = ~_3458;
    int _3494 = _3492 + 1;
    int _3496 = _3494 + 1;
    int _3498 = _3482 ^ _3486;
    int _3500 = ~_3488;
    int _3502 = _3500 + 1;
    int _3504 = _3502 + 1;
    int _3506 = _3496 * as_type<int>(_3278);
    int _3508 = _3506 + _3468;
    int _3510 = abs(_2220);
    float _3512 = in.m_88.x;
    float _3514 = in.m_88.y;
    float _3516 = in.m_88.z;
    int _3518 = ~_3486;
    int _3520 = _3518 + _3498;
    int _3522 = _3520 + 1;
    int _3524 = _3462 * _3504;
    int _3526 = ~_3510;
    int _3528 = _3526 + 1;
    int _3530 = _3528 + 1;
    float _3532 = _3476 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3534 = !_3474;
    int _3536 = _3534 ? _3522 : (-1);
    int _3538 = _3304 * _3488;
    int _3540 = _3538 + _3524;
    float _3542 = float(_3472);
    int _3544 = _3508 * _3530;
    float _3546 = float(_3536);
    float _3548 = _3490 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3550 = float(_3540);
    float _3552 = fma(_3532, _3542, _3048);
    float _3554 = _1378 + 0.5;
    float _3556 = -_3072;
    float _3558 = fma(_3548, _3546, _3556);
    float _3560 = _1360 + (-0.5);
    out.m_90.x = _3550;
    float _3562 = fma(_3532, _3554, _3552);
    int _3564 = _3310 * _3510;
    int _3566 = _3564 + _3544;
    float _3568 = -_3548;
    float _3570 = fma(_3568, _3560, _3558);
    float _3572 = _2864 * _3170;
    float _3574 = -_3090;
    float _3576 = fma(_1378, _3574, _3562);
    float _3578 = float(_3566);
    float _3580 = fma(_1360, _3124, _3570);
    float _3582 = fma(_3336, _3512, _3512);
    bool _3584 = !_2614;
    int _3586 = _3584 ? 0 : 1;
    float _3588 = -_3572;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2864);
    out.m_90.w = _3578;
    int _3592 = abs(_3586);
    out.m_92.x = _3576;
    out.m_92.y = _3580;
    float _3594 = _3516;
    if (_2940)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3596 = -_3256;
    float _3598 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2802);
    float _3600 = float(_2520);
    float _3602 = -_3260;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2870);
    float _3606 = float(_3592);
    float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3610 = _3598 + _3608;
    float _3612 = fma(_3590, _3590, _3344);
    float _3614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3616 = _3604 + _3614;
    float _3618 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3620 = _3606 * _3600;
    float _3622 = -_3572;
    float _3624 = fma(_3622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2800);
    int _3626 = abs(_3340);
    float _3628 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3618);
    float _3630 = _2824 + (-1.0);
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3634 = _3624 + _3632;
    float _3636 = float(_2600);
    float _3638 = fma(_2798, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3582);
    float _3640 = float(_3626);
    float _3642 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3628);
    float _3644 = _3620 * (-2.0);
    float _3646 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3648 = _3640 * _3636;
    float _3650 = fma(_3644, _3514, _3514);
    bool _3652 = _3642 >= 0.0;
    float _3654 = fma(_3646, _3644, _3646);
    float _3656 = _2816 + (-1.0);
    float _3658 = fma(_2784, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3650);
    float _3660 = _3648 * (-2.0);
    float _3662 = fma(_3346, _3252, _3638);
    float _3664 = _1198 + (-0.5);
    float _3666 = fma(_3654, _3252, _3658);
    float _3668 = fma(_3656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3670 = fma(_3660, _3516, _3516);
    float _3672 = _3662 * 0.15915493667125701904296875;
    float _3674 = _3666 * 0.15915493667125701904296875;
    float _3676 = sqrt(_3612);
    float _3678 = _3604;
    if (_3652)
    {
        _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3680 = _3594;
    float _3682 = fma(_3664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3670);
    float _3684 = fma(_3668, _3660, _3668);
    int _3686 = as_type<int>(_3680);
    if (_3652)
    {
        out.m_67.x = 0.0;
    }
    if (_3652)
    {
        float _3688 = _3680 * 5.0;
        _3686 = as_type<int>(_3688);
    }
    int _3690 = _3686;
    float _3692 = fma(_3684, _3252, _3682);
    float _3694 = _3672 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    if (_3652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10844 = as_type<float>(_3690);
        out.gl_Position.z = _10844;
    }
    float _3698 = _3692 * 0.15915493667125701904296875;
    float _3700 = _3672 * 6.283185482025146484375;
    float _3702 = cos(_3700);
    float _3704 = _3674 * 6.283185482025146484375;
    float _3706 = sin(_3704);
    float _3708 = _3674 * 6.283185482025146484375;
    float _3710 = cos(_3708);
    if (_3652)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3712 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3714 = _3170 * _3676;
    float _3716 = _3698 * 6.283185482025146484375;
    float _3718 = cos(_3716);
    float _3720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _3722 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3724 = _3714 * _3712;
    float _3726 = _3702 * _3710;
    float _3728 = _3702 * _3706;
    float _3730 = _3714 * _3722;
    float _3732 = _3720 * _3724;
    float _3734 = _3698 * 6.283185482025146484375;
    float _3736 = sin(_3734);
    float _3738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3740 = _3696 * _3706;
    float _3742 = _3696 * _3710;
    float _3744 = _3702 * _3718;
    float _3746 = _3696 * _3718;
    float _3748 = _3738 * _3730;
    float _3750 = _3710 * _3718;
    float _3752 = _3744 * _3732;
    float _3754 = _3706 * _3718;
    float _3756 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3758 = _3756 * 0.5;
    float _3760 = fma(_3736, _3726, _3740);
    float _3762 = -_3742;
    float _3764 = fma(_3736, _3728, _3762);
    float _3766 = -_3732;
    float _3768 = _3736 * _3766;
    float _3770 = -_3728;
    float _3772 = fma(_3736, _3742, _3770);
    float _3774 = fma(_3760, _3748, _3752);
    float _3776 = _3746 * _3732;
    float _3778 = fma(_3750, _3748, _3768);
    float _3780 = fma(_3736, _3740, _3726);
    float _3782 = fma(_3764, _3758, _3774);
    float _3784 = fma(_3772, _3748, _3776);
    float _3786 = fma(_3754, _3758, _3778);
    float _3788 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3790 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3792 = fma(_3780, _3758, _3784);
    float _3794 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3788);
    float _3796 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3790);
    float _3798 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3794);
    float _3800 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3796);
    float _3802 = _3798 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3804 = _3800 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3806 = _2870 + _3802;
    float _3808 = _2800 + _3804;
    float _3810 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3814 = _3806 + _3812;
    float _3816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3818 = _3808 + _3816;
    float _3820 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3810);
    float _3822 = _3814 * _3814;
    float _3824 = _3818 * _3818;
    float _3826 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3820);
    float _3828 = _3822 + _3824;
    float _3830 = _3826 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3832 = sqrt(_3828);
    float _3834 = _2802 + _3830;
    bool _3836 = _3832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3838 = _3782;
    float _3840 = _3806;
    float _3842 = _3808;
    float _3844 = _3822;
    float _3846 = _3824;
    if (!_3836)
    {
        _3838 = _3834;
    }
    float _3848 = _3838;
    bool _3850 = !_3836;
    float _3852 = _3848;
    if (!_3850)
    {
        float _3854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3858 = _3832 + _3856;
        float _3860 = rsqrt(_3828);
        float _3862 = _3858 * _3854;
        float _3864 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3866 = _3862 * 0.15915493667125701904296875;
        float _3868 = _3866 * 6.283185482025146484375;
        float _3870 = sin(_3868);
        float _3872 = _3866 * 6.283185482025146484375;
        float _3874 = cos(_3872);
        float _3876 = fma(_3870, _3864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3878 = _3860 * _3876;
        float _3880 = _3874 + (-1.0);
        float _3882 = fma(_3814, _3878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3884 = fma(_3818, _3878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3886 = _3880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3890 = _3882 + _3888;
        float _3892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3894 = _3884 + _3892;
        float _3896 = fma(_3834, _3874, _3886);
        float _3898 = _3890 * _3890;
        float _3900 = _3894 * _3894;
        _3840 = _3882;
        _3842 = _3884;
        _3852 = _3896;
        _3844 = _3898;
        _3846 = _3900;
    }
    float _3902 = _3840;
    float _3904 = _3842;
    float _3906 = _3852;
    float _3908 = _3844;
    float _3910 = _3846;
    float _3912 = fma(_3902, 6.2500002968590706586837768554688e-05, 0.5);
    float _3914 = fma(_3904, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11191 = float2(_3912, _3914);
    float3 _3918 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11191, float2(0.0), isnan(_11191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11191, float2(0.0), isnan(_11191)), level(0.0)).xyz;
    float _3920 = _3918.x;
    float _3922 = _3918.y;
    float _3924 = _3918.z;
    float _3926 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3928 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3930 = _3744 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3932 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3934 = -_3736;
    float _3936 = fma(_3934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3926);
    float _3938 = -_3736;
    float _3940 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3928);
    float _3942 = -_3736;
    float _3944 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3930);
    float _3946 = fma(_3932, _3932, 1.0);
    float _3948 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3950 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3952 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3954 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3956 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3948);
    float _3958 = rsqrt(_3946);
    float _3960 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3950);
    float _3962 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3952);
    float _3964 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3966 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3968 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3954);
    float _3970 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3936);
    float _3972 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3964);
    float _3974 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3976 = _3906 + _3974;
    float _3978 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3966);
    float _3980 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3940);
    float _3982 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3944);
    float _3984 = fma(_3976, _3976, _3908);
    float _3986 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3972);
    float _3988 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3978);
    float _3990 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3968);
    float _3992 = _3984 + _3910;
    float _3994 = _3932 * _3958;
    float _3996 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3998 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3956);
    float _4000 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3960);
    float _4002 = _3932 * _3970;
    float _4004 = _3932 * _3980;
    float _4006 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3962);
    float _4008 = _3932 * _3982;
    float _4010 = -_3986;
    float _4012 = _3994 * _4010;
    float _4014 = -_3990;
    float _4016 = _3994 * _4014;
    float _4018 = -_3988;
    float _4020 = _3994 * _4018;
    float _4022 = sqrt(_3992);
    float _4024 = fma(_3996, _3998, _4002);
    float _4026 = fma(_3996, _4000, _4004);
    float _4028 = fma(_3996, _4006, _4008);
    float _4030 = fma(_3958, _3970, _4012);
    float _4032 = fma(_3958, _3980, _4016);
    float _4034 = fma(_3958, _3982, _4020);
    float _4036 = _3986 + _4024;
    float _4038 = _3990 + _4026;
    float _4040 = _3988 + _4028;
    out.m_94.x = _3998;
    out.m_94.y = _4000;
    out.m_94.z = _4006;
    out.m_96.x = _4030;
    out.m_96.y = _4032;
    out.m_96.z = _4034;
    bool _4042 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4044 = isnan(_4022);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4050 = _4046 || _4048;
    out.m_98.x = _4036;
    out.m_98.y = _4038;
    out.m_98.z = _4040;
    float _4052 = _4008;
    float _4054 = _3988;
    float _4056 = _3990;
    if (!_4050)
    {
        _4052 = 1.0;
    }
    float _4058 = _4052;
    out.m_100.x = _3920;
    out.m_100.y = _3922;
    out.m_100.z = _3924;
    bool _4060 = !_4050;
    float _4062 = _4058;
    float _4064 = _3922;
    if (!_4060)
    {
        bool _4066 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4068 = isnan(_4022);
        bool _4070 = _4066 || _4068;
        bool _4072 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4074 = _4070 || _4072;
        if (!_4074)
        {
            float _4076 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4078 = _4022 + _4076;
            float _4080 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4082 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4080;
            float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4086 = _4084 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4088 = 1.0 / _4082;
            float _4090 = _4078 * _4088;
            float _4092 = fma(_4090, _4086, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4062 = _4092;
            _4064 = _4088;
            _4094 = true;
        }
        else
        {
            bool _4096 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4098 = isnan(_4022);
            bool _4100 = _4096 || _4098;
            bool _4102 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4104 = _4100 || _4102;
            if (!_4104)
            {
                float _4106 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4108 = _4022 + _4106;
                float _4110 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4112 = _4110 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4114 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4116 = _4114 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4118 = 1.0 / _4112;
                float _4120 = _4108 * _4118;
                float _4122 = fma(_4120, _4116, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4062 = _4122;
                _4064 = _4118;
                _4094 = true;
            }
            else
            {
                _4062 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4094 = false;
    float _4124 = _4062;
    float _4126 = _4064;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4130 = _3906 + _4128;
    float _4132 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4134 = _3902 + _4132;
    float _4136 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4138 = _3904 + _4136;
    float _4140 = fma(_4130, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4142 = fma(_4134, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4144 = fma(_4138, _4124, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4146 = -_2802;
    float _4148 = _4146 + _4140;
    float _4150 = -_2870;
    float _4152 = _4150 + _4142;
    float _4154 = -_2800;
    float _4156 = _4154 + _4144;
    float _4158 = _4148 * _4148;
    float _4160 = fma(_4152, _4152, _4158);
    float _4162 = fma(_4156, _4156, _4160);
    float _4164 = sqrt(_4162);
    bool _4166 = _4164 > 0.0;
    float _4168 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4170 = fma(_3604, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4168);
    float _4172 = _4126;
    float _4174 = _4138;
    float _4176 = _4168;
    float _4178 = _4152;
    if (!_4166)
    {
        _4172 = _4142;
    }
    float _4180 = _4172;
    float _4182 = _4180;
    if (!_4166)
    {
        _4174 = _4140;
    }
    float _4184 = _4174;
    float _4186 = _4184;
    float _4188 = _4184;
    if (!_4166)
    {
        _4176 = _4144;
    }
    float _4190 = _4176;
    bool _4192 = !_4166;
    float _4194 = _4190;
    if (!_4192)
    {
        float _4196 = _227 * _227;
        float _4198 = fma(_225, _225, _4196);
        float _4200 = fma(_229, _229, _4198);
        float _4202 = rsqrt(_4162);
        float _4204 = sqrt(_4200);
        float _4206 = _4152 * _4202;
        float _4208 = _4148 * _4202;
        float _4210 = _4156 * _4202;
        bool _4212 = _4204 > 0.0;
        float _4214 = _4204;
        float _4216 = _4202;
        _4178 = _4206;
        if (!_4212)
        {
            _4214 = _4142;
        }
        float _4218 = _4214;
        _4182 = _4218;
        if (!_4212)
        {
            _4186 = _4140;
        }
        float _4220 = _4186;
        _4188 = _4220;
        if (!_4212)
        {
            _4216 = _4144;
        }
        float _4222 = _4216;
        bool _4224 = !_4212;
        _4194 = _4222;
        if (!_4224)
        {
            float _4226 = rsqrt(_4200);
            float _4228 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4230 = _227 * _4226;
            float _4232 = _225 * _4226;
            float _4234 = _229 * _4226;
            float _4236 = _4208 * _4230;
            float _4238 = fma(_4206, _4232, _4236);
            float _4240 = _4228 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4242 = fma(_4210, _4234, _4238);
            float _4244 = _4242 * _4240;
            float _4246 = fma(_225, _4244, _4142);
            float _4248 = fma(_227, _4244, _4140);
            float _4250 = fma(_229, _4244, _4144);
            _4188 = _4248;
            _4182 = _4246;
            _4194 = _4250;
        }
    }
    float _4252 = _4188;
    float _4254 = _4182;
    float _4256 = _4194;
    float _4258 = _4178;
    float _4260 = -_3256;
    float _4262 = fma(_4260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4252);
    float _4264 = -_3260;
    float _4266 = fma(_4264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4254);
    float _4268 = fma(_3624, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4170);
    float _4270 = -_3572;
    float _4272 = fma(_4270, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4256);
    float _4274 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4276 = _4262 + _4274;
    float _4278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4280 = _4266 + _4278;
    float _4282 = _4268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4286 = _4272 + _4284;
    float _4288 = _4276 * _4276;
    float _4290 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4292 = 1.0 / _4282;
    float _4294 = fma(_4280, _4280, _4288);
    float _4296 = fma(_3604, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4290);
    float _4298 = fma(_4286, _4286, _4294);
    float _4300 = fma(_3624, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4296);
    float _4302 = rsqrt(_4298);
    float _4304 = _4300 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4306 = _4304 + _4282;
    float _4308 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4310 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4312 = _4306 * _4292;
    float _4314 = _4312 * 0.5;
    float _4316 = _3598 + _4308;
    float _4318 = floor(_4310);
    float _4320 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4322 = fma(_4314, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4320);
    float _4324 = _4316 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4326 = _4302 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4328 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4324);
    float _4330 = 1.0 / _4322;
    float _4332 = _4280 * _4326;
    float _4334 = _4316 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4336 = _4286 * _4326;
    float _4338 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4328);
    float _4340 = _4332 * _4332;
    float _4342 = fma(_3604, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4334);
    float _4344 = _4336 * _4336;
    float _4346 = _4338 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4348 = -_4318;
    float _4350 = _4310 + _4348;
    float _4352 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4342);
    float _4354 = _4340 + _4344;
    float _4356 = trunc(_4346);
    int _4358 = int(_4356);
    float _4360 = _4352 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4362 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4364 = _4330 * _4362;
    float _4366 = sqrt(_4354);
    bool _4368 = _4364 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4370 = fma(_3624, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _4372 = _4364 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4374 = trunc(_4360);
    int _4376 = int(_4374);
    int _4378 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4380 = _4358 + _4378;
    int _4382 = _4380 + 1;
    int _4384 = 2;
    float _4386 = _4318;
    float _4388 = _4354;
    float _4390 = _4276;
    float _4392 = as_type<float>(_4382);
    float _4394 = _4346;
    if (!_4368)
    {
        _4384 = 1;
    }
    int _4396 = _4384;
    bool _4398 = _4366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4400 = floor(_4370);
    int _4402 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4404 = _4376 + _4402;
    int _4406 = _4404 + 1;
    bool _4408 = _4406 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4410 = as_type<float>(_4358);
    int _4412 = _4396;
    int _4414 = _4406;
    if (_4398)
    {
        float _4416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4410 = _4416;
    }
    float _4418 = _4410;
    int _4420 = _4406 | _4382;
    if (!_4398)
    {
        _4386 = _4344;
    }
    float _4422 = _4386;
    float _4424 = -_4400;
    float _4426 = _4370 + _4424;
    bool _4428 = _4420 < 0;
    bool _4430 = _4428 || _4408;
    bool _4432 = !_4368;
    int _4434 = _4432 ? 0 : 1;
    float _4436 = _4400;
    float _4438 = _4422;
    if (_4398)
    {
        float _4440 = rsqrt(_4354);
        _4388 = _4440;
    }
    float _4442 = _4388;
    bool _4444 = _4382 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4446 = _4444 || _4430;
    if (!_4372)
    {
        _4412 = _4434;
    }
    int _4448 = _4412;
    float _4450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4452 = _4366 + _4450;
    float _4454 = _4452;
    if (!_4398)
    {
        _4436 = _4336;
    }
    float _4456 = _4436;
    int _4458 = _4448 << 6;
    float _4460 = _4456;
    if (_4398)
    {
        float _4462 = _4452 * _4418;
        _4454 = _4462;
    }
    float _4464 = _4454;
    int _4466 = _4458 + 64;
    uint _4468 = uint(int(uint(_4466) >> uint(2)));
    uint _4470 = uint(int(uint(int(_4468)) >> uint(2)));
    int _4472 = int(_4468) & 3;
    float _4474 = (*spvDescriptorSet0.vp_c15)._m0[int(_4470)][_4472];
    int _4476 = int(_4468) + 1;
    uint _4478 = uint(int(uint(_4476) >> uint(2)));
    int _4480 = _4476 & 3;
    float _4482 = (*spvDescriptorSet0.vp_c15)._m0[int(_4478)][_4480];
    if (_4398)
    {
        float _4484 = _4464 * 0.15915493667125701904296875;
        _4054 = _4484;
    }
    float _4486 = _4054;
    float _4488 = _3980;
    if (!_4446)
    {
        float _4490 = floor(_4346);
        _4488 = _4490;
    }
    float _4492 = _4488;
    if (!_4446)
    {
        int _4494 = _4382 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4496 = _4494 + _4406;
        _4414 = _4496;
    }
    int _4498 = _4414;
    float _4500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4502 = _4458 + 80;
    uint _4504 = uint(int(uint(_4502) >> uint(2)));
    uint _4506 = uint(int(uint(int(_4504)) >> uint(2)));
    int _4508 = int(_4504) & 3;
    float _4510 = (*spvDescriptorSet0.vp_c15)._m0[int(_4506)][_4508];
    int _4512 = int(_4504) + 1;
    uint _4514 = uint(int(uint(_4512) >> uint(2)));
    int _4516 = _4512 & 3;
    float _4518 = (*spvDescriptorSet0.vp_c15)._m0[int(_4514)][_4516];
    float _4520 = _2802;
    if (_4398)
    {
        float _4522 = _4486 * 6.283185482025146484375;
        float _4524 = sin(_4522);
        _4520 = _4524;
    }
    float _4526 = _4520;
    float _4528 = precise::max(0.0, _4500);
    int _4530 = _4458 + 96;
    uint _4532 = uint(int(uint(_4530) >> uint(2)));
    uint _4534 = uint(int(uint(int(_4532)) >> uint(2)));
    int _4536 = int(_4532) & 3;
    float _4538 = (*spvDescriptorSet0.vp_c15)._m0[int(_4534)][_4536];
    int _4540 = int(_4532) + 1;
    uint _4542 = uint(int(uint(_4540) >> uint(2)));
    int _4544 = _4540 & 3;
    float _4546 = (*spvDescriptorSet0.vp_c15)._m0[int(_4542)][_4544];
    float _4548 = -_4326;
    float _4550 = -_4528;
    float _4552 = fma(_4276, _4548, _4550);
    if (!_4398)
    {
        _4390 = _4332;
    }
    float _4554 = _4390;
    float _4556 = _4258;
    float _4558 = _4554;
    if (_4398)
    {
        float _4560 = _4486 * 6.283185482025146484375;
        float _4562 = cos(_4560);
        _4556 = _4562;
    }
    float _4564 = _4556;
    float _4566 = _4492;
    if (!_4446)
    {
        float _4568 = -_4492;
        float _4570 = _4346 + _4568;
        _4392 = _4570;
    }
    float _4572 = _4392;
    if (_4398)
    {
        float _4574 = _4552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4056 = _4574;
    }
    float _4576 = _4056;
    float _4578 = _4576;
    if (!_4398)
    {
        _4566 = _4552;
    }
    float _4580 = _4566;
    int _4582 = _4458 + 104;
    uint _4584 = uint(int(uint(_4582) >> uint(2)));
    uint _4586 = uint(int(uint(int(_4584)) >> uint(2)));
    int _4588 = int(_4584) & 3;
    float _4590 = (*spvDescriptorSet0.vp_c15)._m0[int(_4586)][_4588];
    int _4592 = int(_4584) + 1;
    uint _4594 = uint(int(uint(_4592) >> uint(2)));
    int _4596 = _4592 & 3;
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[int(_4594)][_4596];
    float _4600 = _4526;
    float _4602 = _4580;
    if (_4398)
    {
        float _4604 = fma(_4526, _4576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4578 = _4604;
    }
    float _4606 = _4578;
    float _4608 = _4606;
    if (_4398)
    {
        float _4610 = _4442 * _4606;
        _4608 = _4610;
    }
    float _4612 = _4608;
    int _4614 = _4458 + 48;
    uint _4616 = uint(int(uint(_4614) >> uint(2)));
    uint _4618 = uint(int(uint(int(_4616)) >> uint(2)));
    int _4620 = int(_4616) & 3;
    float _4622 = (*spvDescriptorSet0.vp_c15)._m0[int(_4618)][_4620];
    int _4624 = int(_4616) + 1;
    uint _4626 = uint(int(uint(_4624) >> uint(2)));
    int _4628 = _4624 & 3;
    float _4630 = (*spvDescriptorSet0.vp_c15)._m0[int(_4626)][_4628];
    if (_4398)
    {
        float _4632 = _4564 + (-1.0);
        _4394 = _4632;
    }
    float _4634 = _4394;
    float _4636 = _4634;
    if (_4398)
    {
        float _4638 = _4332 * _4612;
        _4558 = _4638;
    }
    float _4640 = _4558;
    if (_4398)
    {
        float _4642 = _4336 * _4612;
        _4460 = _4642;
    }
    float _4644 = _4460;
    if (_4398)
    {
        float _4646 = _4634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4600 = _4646;
    }
    float _4648 = _4600;
    int _4650 = _4458 + 72;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    if (!_4398)
    {
        _4636 = _4340;
    }
    float _4668 = _4636;
    float _4670 = _4668;
    if (_4398)
    {
        float _4672 = _4640 * _4640;
        _4670 = _4672;
    }
    float _4674 = _4670;
    if (_4398)
    {
        float _4676 = fma(_4552, _4564, _4648);
        _4602 = _4676;
    }
    float _4678 = _4602;
    if (_4398)
    {
        float _4680 = _4644 * _4644;
        _4438 = _4680;
    }
    float _4682 = _4438;
    int _4684 = _4458 + 56;
    uint _4686 = uint(int(uint(_4684) >> uint(2)));
    uint _4688 = uint(int(uint(int(_4686)) >> uint(2)));
    int _4690 = int(_4686) & 3;
    float _4692 = (*spvDescriptorSet0.vp_c15)._m0[int(_4688)][_4690];
    int _4694 = int(_4686) + 1;
    uint _4696 = uint(int(uint(_4694) >> uint(2)));
    int _4698 = _4694 & 3;
    float _4700 = (*spvDescriptorSet0.vp_c15)._m0[int(_4696)][_4698];
    float _4702 = _4316 * _4482;
    float _4704 = fma(_3604, _4474, _4702);
    int _4706 = _4458 + 88;
    uint _4708 = uint(int(uint(_4706) >> uint(2)));
    uint _4710 = uint(int(uint(int(_4708)) >> uint(2)));
    int _4712 = int(_4708) & 3;
    float _4714 = (*spvDescriptorSet0.vp_c15)._m0[int(_4710)][_4712];
    int _4716 = int(_4708) + 1;
    uint _4718 = uint(int(uint(_4716) >> uint(2)));
    int _4720 = _4716 & 3;
    float _4722 = (*spvDescriptorSet0.vp_c15)._m0[int(_4718)][_4720];
    float _4724 = _4316 * _4518;
    float _4726 = fma(_4678, _4678, _4674);
    float _4728 = _4316 * _4546;
    float _4730 = sqrt(_4298);
    float _4732 = fma(_3604, _4510, _4724);
    float _4734 = _4726 + _4682;
    float _4736 = fma(_3604, _4538, _4728);
    int _4738 = as_type<int>(_4726);
    if (!_4446)
    {
        int _4740 = _4498 << 2;
        _4738 = _4740;
    }
    int _4742 = _4738;
    float _4744 = fma(_3624, _4590, _4736);
    int _4746 = _4742;
    if (!_4446)
    {
        int _4748 = 12 & _4742;
        _4746 = _4748;
    }
    int _4750 = _4746;
    float _4752 = rsqrt(_4734);
    float _4754 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4756 = _4744 + _4598;
    float _4758 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4760 = _4316 * _4630;
    int _4762 = as_type<int>(_4630);
    if (!_4446)
    {
        uint _4764 = uint(int(uint(_4498) >> uint(2)));
        _4762 = int(_4764);
    }
    int _4766 = _4762;
    float _4768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4770 = fma(_4730, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4768);
    float _4772 = precise::clamp(_4770, 0.0, 1.0);
    float _4774 = fma(_3604, _4622, _4760);
    int _4776 = _4766;
    if (!_4446)
    {
        int _4778 = _4766 << 4;
        int _4780 = _4778 + _4750;
        _4776 = _4780;
    }
    int _4782 = _4776;
    float _4784 = -_4772;
    float _4786 = _4784 + 1.0;
    float _4788 = 1.0 / _4756;
    float _4790 = fma(_3624, _4658, _4704);
    float _4792 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4754);
    float _4794 = _4760;
    float _4796 = as_type<float>(_4782);
    if (!_4446)
    {
        int _4798 = _4782 + 400;
        uint _4800 = uint(int(uint(_4798) >> uint(2)));
        uint _4802 = uint(int(uint(int(_4800)) >> uint(2)));
        int _4804 = int(_4800) & 3;
        float _4806 = (*spvDescriptorSet0.vp_c15)._m0[int(_4802)][_4804];
        _4794 = _4806;
    }
    float _4808 = _4794;
    float _4810 = _4752 * _4640;
    float _4812 = _4790 + _4666;
    float _4814 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4792);
    float _4816 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4818 = abs(_4786);
    float _4820 = log2(_4818);
    float _4822 = fma(_3624, _4692, _4774);
    float _4824 = _4814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4826 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4828 = _4752 * _4644;
    float _4830 = _4822 + _4700;
    float _4832 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4834 = _4774;
    if (!_4446)
    {
        float _4836 = floor(_4360);
        _4834 = _4836;
    }
    float _4838 = _4834;
    float _4840 = fma(_3624, _4714, _4732);
    float _4842 = _4752 * _4678;
    float _4844 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4832);
    float _4846 = _4824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4848 = _4830 * _4788;
    float _4850 = -_4826;
    float _4852 = fma(_4842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4850);
    float _4854 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4844);
    float _4856 = -_4846;
    float _4858 = fma(_4856, _4758, 1.0);
    float _4860 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4816);
    bool _4862 = _4848 >= 0.0;
    float _4864 = -_4828;
    float _4866 = fma(_4864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4852);
    float _4868 = _4854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4870 = _4262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4872 = _4812 * _4788;
    float _4874 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4876 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4860);
    bool _4878 = _4848 <= 1.0;
    bool _4880 = _4878 && _4862;
    float _4882 = fma(_4266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4870);
    float _4884 = exp2(_4874);
    float _4886 = _4876 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4888 = _4872 >= 0.0;
    bool _4890 = _4888 && _4880;
    float _4892 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4894 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4882);
    float _4896 = fma(_4866, -0.5, 0.5);
    float _4898 = fma(_4866, 0.5, 0.5);
    bool _4900 = _4872 <= 1.0;
    bool _4902 = _4900 && _4890;
    float _4904 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4892);
    float _4906 = _4894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4908 = fma(_4898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4910 = sqrt(_4896);
    float _4912 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4904);
    float _4914 = _4842 + 1.0;
    if (!_4446)
    {
        float _4916 = -_4838;
        float _4918 = _4360 + _4916;
        _4796 = _4918;
    }
    float _4920 = _4796;
    float _4922 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4912);
    float _4924 = -_4842;
    float _4926 = fma(_4884, _4914, _4924);
    float _4928 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4930 = log2(_4858);
    float _4932 = _4840 + _4722;
    float _4934 = fma(_4898, _4908, -0.212114393711090087890625);
    float _4936 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4938 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4928);
    float2 _12940 = float2(_4350, _4426);
    float _4940 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12940, float2(0.0), isnan(_12940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12940, float2(0.0), isnan(_12940)), level(0.0)).x;
    float _4942 = fma(_4898, _4934, 1.570728778839111328125);
    float _4944 = _4934;
    float _4946 = _4922;
    if (_4902)
    {
        float _4948 = float(_4448);
        _4944 = _4948;
    }
    float _4950 = _4944;
    float _4952 = 1.0 / _4922;
    float _4954 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4936);
    float _4956 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4938);
    float _4958 = _4910 * 0.636619746685028076171875;
    float _4960 = fma(_4926, 0.5, 0.5);
    float _4962 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4954);
    float _4964 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4956);
    float _4966 = _4932 * _4788;
    float _4968 = _4950;
    float _4970 = _4964;
    if (_4902)
    {
        float _4972 = rint(_4950);
        float _4974 = precise::max(_4972, 0.0);
        uint _4976 = uint(_4974);
        uint _4978 = clamp(_4976, 0u, 65535u);
        _4968 = as_type<float>(_4978);
    }
    float _4980 = _4968;
    float _4982 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4962);
    float _4984 = _4930 * 0.693147182464599609375;
    float _4986 = -_4942;
    float _4988 = fma(_4958, _4986, 1.0);
    float _4990 = _4984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4992 = _4964 * _4952;
    float _4994 = _4982 * _4952;
    float _4996 = _4838;
    if (!_4446)
    {
        float _4998 = rint(_4808);
        float _5000 = precise::max(_4998, 0.0);
        uint _5002 = uint(_5000);
        uint _5004 = clamp(_5002, 0u, 65535u);
        _4996 = as_type<float>(_5004);
    }
    float _5006 = _4996;
    float _5008 = fma(_4992, 0.5, 0.5);
    float _5010 = fma(_4994, -0.5, 0.5);
    float _5012 = _4952;
    if (_4902)
    {
        float3 _13058 = float3(_4848, _4872, float(as_type<int>(_4980)));
        float3 _13062 = select(_13058, float3(0.0), isnan(_13058));
        float _5014 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13062.xy, uint(rint(_13062.z)), _4966, level(0.0));
        _5012 = _5014;
    }
    float _5016 = _5012;
    float3 _13072 = float3(_5008, _5010, _4990);
    float _5018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13072, float3(0.0), isnan(_13072)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13072, float3(0.0), isnan(_13072)), level(0.0)).x;
    float3 _13081 = float3(_5008, _5010, _4990);
    float4 _5021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13081, float3(0.0), isnan(_13081)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13081, float3(0.0), isnan(_13081)), level(0.0)).xyzw;
    float _5023 = _5021.x;
    float _5025 = _5021.y;
    float _5027 = _5021.z;
    float _5029 = _5021.w;
    float2 _13097 = float2(_4988, _4960);
    float3 _5031 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13097, float2(0.0), isnan(_13097)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13097, float2(0.0), isnan(_13097)), level(0.0)).xyz;
    float _5033 = _5031.x;
    float _5035 = _5031.y;
    float _5037 = _5031.z;
    float _5039 = _4920;
    if (!_4446)
    {
        float3 _13118 = float3(_4920, _4572, float(as_type<int>(_5006)));
        float3 _13120 = select(_13118, float3(0.0), isnan(_13118));
        float _5041 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13120.xy, uint(rint(_13120.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13120.xy, uint(rint(_13120.z)), level(0.0)).x;
        _5039 = _5041;
    }
    float _5043 = _5039;
    float _5045 = abs(_4364);
    float _5047 = log2(_5045);
    float _5049 = _4868 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5051 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5049);
    float _5053 = fma(_4824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5051);
    float _5055 = _4964 + _4922;
    float _5057 = fma(_4906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5053);
    float _5059 = _4820 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5061 = _5055 * 0.5;
    float _5063 = _5047 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = _5057 + _4922;
    bool _5067 = _4364 <= 8000.0;
    bool _5069 = isnan(_4364);
    bool _5071 = _5067 || _5069;
    bool _5073 = isnan(8000.0);
    bool _5075 = _5071 || _5073;
    float _5077 = float(_5075);
    out.gl_Position.x = _4964;
    out.gl_Position.y = _4982;
    out.gl_Position.z = _5057;
    out.gl_Position.w = _4922;
    float _5079 = exp2(_5059);
    float _5081 = _5065 * 0.5;
    float _5083 = exp2(_5063);
    float _5085 = _5077;
    if (_4446)
    {
        _4970 = 1.0;
    }
    float _5087 = _4970;
    float _5089 = fma(_5083, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5091 = precise::clamp(_5089, 0.0, 1.0);
    float _5093 = fma(_5091, -2.0, 3.0);
    float _5095 = _5091 * _5091;
    float _5097 = _5095 * _5093;
    float _5099 = _4922 * 0.5;
    float _5101 = fma(_4982, -0.5, _5099);
    float _5103 = -_5097;
    float _5105 = _5103 + 1.0;
    out.m_102.x = _5061;
    out.m_102.y = _5101;
    out.m_102.z = _5081;
    out.m_102.w = _4922;
    float _5107 = fma(_5105, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5097);
    float _5109 = _5077 * _5107;
    float _5111 = _5087;
    if (!_4902)
    {
        _5085 = 1.0;
    }
    float _5113 = _5085;
    float _5115 = _5109 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5117 = -_5079;
    float _5119 = _5117 + 1.0;
    float _5121 = _5119 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5123 = -_4940;
    float _5125 = _5123 + 1.0;
    float _5127 = _5125 * _5115;
    float _5129 = precise::clamp(_5127, 0.0, 1.0);
    float _5131 = _5113;
    if (_4902)
    {
        bool _5133 = _5016 >= _4966;
        bool _5135 = isnan(_5016);
        bool _5137 = _5133 || _5135;
        bool _5139 = isnan(_4966);
        bool _5141 = _5137 || _5139;
        float _5143 = float(_5141);
        _5131 = _5143;
    }
    float _5145 = _5131;
    if (!_4446)
    {
        int _5147 = _4498 << 4;
        int _5149 = _5147 + 2048;
        uint _5151 = uint(int(uint(_5149) >> uint(2)));
        uint _5153 = uint(int(uint(int(_5151)) >> uint(2)));
        int _5155 = int(_5151) & 3;
        float _5157 = (*spvDescriptorSet0.vp_c15)._m0[int(_5153)][_5155];
        int _5159 = int(_5151) + 1;
        uint _5161 = uint(int(uint(_5159) >> uint(2)));
        int _5163 = _5159 & 3;
        float _5165 = (*spvDescriptorSet0.vp_c15)._m0[int(_5161)][_5163];
        int _5167 = _5149 + 8;
        uint _5169 = uint(int(uint(_5167) >> uint(2)));
        uint _5171 = uint(int(uint(int(_5169)) >> uint(2)));
        int _5173 = int(_5169) & 3;
        float _5175 = (*spvDescriptorSet0.vp_c15)._m0[int(_5171)][_5173];
        int _5177 = int(_5169) + 1;
        uint _5179 = uint(int(uint(_5177) >> uint(2)));
        int _5181 = _5177 & 3;
        float _5183 = (*spvDescriptorSet0.vp_c15)._m0[int(_5179)][_5181];
        float _5185 = _4316 * _5165;
        float _5187 = fma(_3604, _5157, _5185);
        float _5189 = fma(_3624, _5175, _5187);
        float _5191 = _5189 + _5183;
        float _5193 = precise::clamp(_5191, 0.0, 1.0);
        float _5195 = -_5193;
        float _5197 = _5195 + _5043;
        float _5199 = fma(_5197, 500.0, 1.5);
        float _5201 = exp2(_5199);
        float _5203 = 0.0 + _5201;
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        _5111 = _5205;
        _4946 = _5183;
    }
    float _5207 = _5111;
    float _5209 = _4946;
    float _5211 = _5145 * _5207;
    float _5213 = _5121 * _5018;
    float _5215 = -_5129;
    float _5217 = fma(_5215, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5219 = -_5121;
    float _5221 = _5219 + 1.0;
    bool _5223 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5225 = isnan(_4730);
    bool _5227 = _5223 || _5225;
    bool _5229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5231 = _5227 || _5229;
    float _5233 = _5029 * _5213;
    float _5235 = -_5211;
    float _5237 = fma(_5235, _5217, 1.0);
    float _5239 = precise::clamp(_5237, 0.0, 1.0);
    float _5241 = _5037 * _5213;
    float _5243 = _5029 * _5221;
    float _5245 = fma(_5033, _5233, _5023);
    float _5247 = fma(_5035, _5233, _5025);
    float _5249 = _5239 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5251 = fma(_5029, _5241, _5027);
    out.m_104.x = _5249;
    float _5253 = _5209;
    float _5255 = _5213;
    float _5257 = _5233;
    float _5259 = _5239;
    if (!_5231)
    {
        _3678 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5261 = _3678;
    float _5263 = _5261;
    float _5265 = _5261;
    if (!_5231)
    {
        _3158 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5267 = _3158;
    out.m_106.x = _5245;
    out.m_106.y = _5247;
    out.m_106.z = _5251;
    out.m_106.w = _5243;
    float _5269 = _5267;
    float _5271 = _5267;
    if (!_5231)
    {
        _5253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5273 = _5253;
    float _5275 = _5273;
    float _5277 = _5273;
    if (!_5231)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5279 = _5255;
    float _5281 = _5279;
    float _5283 = _5279;
    if (!_5231)
    {
        _5257 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5285 = _5257;
    float _5287 = _5285;
    float _5289 = _5285;
    if (!_5231)
    {
        _5259 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5291 = _5259;
    bool _5293 = !_5231;
    float _5295 = _5291;
    float _5297 = _5291;
    if (!_5293)
    {
        bool _5299 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5301 = isnan(_4730);
        bool _5303 = _5299 || _5301;
        bool _5305 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5307 = _5303 || _5305;
        if (!_5307)
        {
            float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5311 = _4730 + _5309;
            float _5313 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5315 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5313;
            float _5317 = 1.0 / _5315;
            float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5325 = _5323 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5327 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5329 = _5327 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5333 = _5331 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5335 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5337 = _5335 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5339 = _5311 * _5317;
            float _5341 = precise::clamp(_5339, 0.0, 1.0);
            float _5343 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5345 = _5343 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5347 = fma(_5341, _5321, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5349 = fma(_5341, _5345, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5351 = fma(_5341, _5325, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5353 = fma(_5341, _5329, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5355 = fma(_5341, _5333, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5357 = fma(_5341, _5337, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5271 = _5349;
            _5289 = _5355;
            _5265 = _5347;
            _5283 = _5353;
            _5277 = _5351;
            _5297 = _5357;
            _5359 = true;
        }
        else
        {
            bool _5361 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5363 = isnan(_4730);
            bool _5365 = _5361 || _5363;
            bool _5367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5369 = _5365 || _5367;
            if (!_5369)
            {
                _5263 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5371 = _5263;
            _5265 = _5371;
            if (!_5369)
            {
                _5269 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5373 = _5269;
            _5271 = _5373;
            if (!_5369)
            {
                _5275 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5375 = _5275;
            _5277 = _5375;
            if (!_5369)
            {
                _5281 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5377 = _5281;
            _5283 = _5377;
            if (!_5369)
            {
                _5287 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5379 = _5287;
            _5289 = _5379;
            if (!_5369)
            {
                _5295 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5381 = _5295;
            bool _5383 = !_5369;
            _5297 = _5381;
            if (!_5383)
            {
                bool _5385 = _4730 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5387 = isnan(_4730);
                bool _5389 = _5385 || _5387;
                bool _5391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5393 = _5389 || _5391;
                if (!_5393)
                {
                    float _5395 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5397 = _4730 + _5395;
                    float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5401 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5399;
                    float _5403 = 1.0 / _5401;
                    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5425 = _5397 * _5403;
                    float _5427 = precise::clamp(_5425, 0.0, 1.0);
                    float _5429 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5431 = _5429 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5433 = fma(_5427, _5407, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5435 = fma(_5427, _5431, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5437 = fma(_5427, _5411, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5439 = fma(_5427, _5415, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5441 = fma(_5427, _5419, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5443 = fma(_5427, _5423, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5271 = _5435;
                    _5289 = _5441;
                    _5265 = _5433;
                    _5283 = _5439;
                    _5277 = _5437;
                    _5297 = _5443;
                    _5359 = true;
                }
                else
                {
                    _5271 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5289 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5265 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5283 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5277 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5297 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5359 = false;
    float _5445 = _5271;
    float _5447 = _5289;
    float _5449 = _5265;
    float _5451 = _5283;
    float _5453 = _5277;
    float _5455 = _5297;
    float _5457 = fma(_4038, -0.5, 0.5);
    float _5459 = precise::clamp(_5457, 0.0, 1.0);
    float _5461 = -_5445;
    float _5463 = _5461 + _5447;
    float _5465 = -_5449;
    float _5467 = _5465 + _5451;
    float _5469 = -_5453;
    float _5471 = _5469 + _5455;
    bool _5473 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5475 = fma(_5459, _5463, _5445);
    float _5477 = fma(_5459, _5467, _5449);
    float _5479 = fma(_5459, _5471, _5453);
    float _5481 = _5475 * 0.586610972881317138671875;
    out.m_108.x = 0.0;
    float _5483 = fma(_5477, 0.298911988735198974609375, _5481);
    float _5485 = fma(_5479, 0.114477999508380889892578125, _5483);
    float _5487 = -_5485;
    float _5489 = _5477 + _5487;
    float _5491 = -_5485;
    float _5493 = _5475 + _5491;
    float _5495 = -_5485;
    float _5497 = _5479 + _5495;
    float _5499 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5501 = fma(_5489, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    float _5503 = fma(_5493, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    float _5505 = fma(_5497, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5485);
    out.m_67.x = _5499;
    out.m_110.x = _5501;
    out.m_110.y = _5503;
    out.m_110.z = _5505;
    if (!_5473)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5507 = -_4262;
    float _5509 = _5507 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5511 = -_4266;
    float _5513 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5515 = -_4272;
    float _5517 = _5515 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5519 = _5509 * _5509;
    float _5521 = fma(_5513, _5513, _5519);
    float _5523 = fma(_5517, _5517, _5521);
    float _5525 = sqrt(_5523);
    float _5527 = rsqrt(_5523);
    float _5529 = -_5525;
    float _5531 = _5529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5533 = _5531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5535 = precise::clamp(_5533, 0.0, 1.0);
    float _5537 = _5513 * _5527;
    float _5539 = _5509 * _5527;
    float _5541 = abs(_5535);
    float _5543 = log2(_5541);
    float _5545 = _5517 * _5527;
    float _5547 = _5537 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5549 = _4038 * _5539;
    float _5551 = -_5539;
    float _5553 = -_5547;
    float _5555 = fma(_5551, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5553);
    float _5557 = fma(_4036, _5537, _5549);
    float _5559 = -_5545;
    float _5561 = fma(_5559, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5555);
    float _5563 = fma(_4040, _5545, _5557);
    float _5565 = precise::clamp(_5563, 0.0, 1.0);
    float _5567 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5569 = _5561 + _5567;
    float _5571 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5573 = _5569 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5575 = precise::clamp(_5573, 0.0, 1.0);
    float _5577 = exp2(_5571);
    float _5579 = _5577 * _5575;
    float _5581 = _5565 * _5579;
    float _5583 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5585 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5587 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_108.x = _5583;
    out.m_108.y = _5585;
    out.m_108.z = _5587;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

