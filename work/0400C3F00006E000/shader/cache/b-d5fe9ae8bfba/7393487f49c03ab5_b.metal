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
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_110 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 m_108 [[user(locn14)]];
    float4 m_104 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_90 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_76 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5495 = false;
    bool _787 = false;
    bool _643 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
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
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5805 = as_type<float>(_153);
        out.gl_Position.z = _5805;
    }
    if (!_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5868 = as_type<float>(_185);
        out.gl_Position.z = _5868;
    }
    if (_173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = 1.0 / _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _303 = 1.0 / _279;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _283;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _307 * _285;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _289;
    float _333 = _315 * _303;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = _271 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _271 + _339;
    bool _343 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_271);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _293;
    float _357 = _337 * _311;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    bool _363 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _365 = isnan(_271);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _297;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _379 = _271 + _377;
    float _381 = _379 * _331;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _385 = _271 + _383;
    float _387 = 1.0 / _301;
    float _389 = _341 * _355;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _271 + _391;
    float _395 = _385 * _375;
    bool _397 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _399 = isnan(_271);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_373;
    float _411 = _409 + 1.0;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _407 * _361;
    float _427 = -_407;
    float _429 = _427 + 1.0;
    float _431 = _393 * _387;
    float _433 = -_423;
    float _435 = _433 + 1.0;
    float _437 = _423 * _411;
    float _439 = _373 * _429;
    bool _441 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_271);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _459 = isnan(_271);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = _451 * _435;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    bool _479 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _481 = isnan(_271);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = fma(_455, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _497 = _467 * _477;
    float _499 = -_467;
    float _501 = _499 + 1.0;
    float _503 = -_489;
    float _505 = _503 + 1.0;
    float _507 = fma(_471, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _509;
    float _513 = _489 * _501;
    float _515 = _353 * _505;
    float _517 = -_353;
    float _519 = _517 + 1.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = fma(_493, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = _495 * _515;
    float _529 = _507 * _515;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _531;
    float _535 = fma(_523, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _537 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    float _539 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _545 = fma(_511, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _547 = fma(_525, _513, _537);
    float _549 = fma(_533, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = fma(_535, _513, _539);
    float _557 = fma(_543, _389, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _559 = fma(_545, _497, _547);
    float _561 = fma(_553, _389, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _567;
    float _571 = fma(_549, _497, _555);
    float _573 = fma(_557, _473, _559);
    float _575 = fma(_565, _381, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _577 = fma(_569, _381, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _587 = fma(_561, _473, _571);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _589;
    float _593 = fma(_581, _431, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _595 = fma(_585, _431, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _597;
    float _601 = fma(_575, _437, _573);
    float _603 = fma(_577, _437, _587);
    float _605 = fma(_591, _395, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _607 = fma(_599, _395, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _609 = fma(_593, _439, _601);
    float _611 = fma(_595, _439, _603);
    float _613 = fma(_605, _425, _609);
    float _615 = fma(_607, _425, _611);
    float _617 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[150].x, _613);
    float _619 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[150].y, _615);
    bool _621 = !_309;
    float _623 = _587;
    float _641;
    if (!_621)
    {
        float _625 = in.m_76.x;
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        _641 = _179;
    }
    _643 = false;
    float _645 = _641;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _649 = _645 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = isnan(_645);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _671 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_645);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    bool _687 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _689 = isnan(_645);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = 1.0 / _653;
    float _701 = -_665;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _707 = _681 * _703;
    float _709 = -_681;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _669;
    float _715 = _685 * _699;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _721 = fma(_715, _649, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _723 = -_697;
    float _725 = _723 + 1.0;
    float _727 = _721 * _707;
    float _729 = _719 * _713;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _733 = _645 + _731;
    float _735 = _665 * _725;
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    float _739 = fma(_729, _733, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _741 = fma(_739, _735, _737);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _747 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[117].x, _741);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = in.m_78.x;
    float _761 = in.m_78.y;
    out.m_80.x = _751;
    out.m_80.y = _753;
    out.m_80.z = _757;
    out.m_80.w = _755;
    float _763 = _619 * _761;
    float _765 = _617 * _759;
    bool _767 = !_705;
    float _785;
    if (!_767)
    {
        float _769 = in.m_76.x;
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _773 = _769 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _777 = _775 * _771;
        float _779 = floor(_777);
        float _781 = -_779;
        float _783 = _777 + _781;
        _785 = _783;
        _787 = true;
    }
    else
    {
        _785 = _179;
    }
    _787 = false;
    float _789 = _785;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _789 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _799 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _801 = isnan(_789);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _819 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _821 = isnan(_789);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _797;
    float _833 = -_809;
    float _835 = _833 + 1.0;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _837;
    bool _841 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _843 = isnan(_789);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = _829 * _835;
    float _855 = -_829;
    float _857 = _855 + 1.0;
    bool _859 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _861 = 1.0 / _813;
    float _863 = _851 * _857;
    float _865 = -_851;
    float _867 = _865 + 1.0;
    float _869 = 1.0 / _817;
    float _871 = _839 * _831;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _877 = fma(_871, _793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _879 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _881 = isnan(_789);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = _875 * _861;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _899 = _789 + _897;
    float _901 = _877 * _863;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = _789 + _903;
    float _907 = fma(_891, _899, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _909 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _911 = _895 * _869;
    float _913 = -_889;
    float _915 = _913 + 1.0;
    float _917 = fma(_907, _853, _909);
    float _919 = fma(_911, _905, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _921 = _809 * _915;
    float _923 = fma(_919, _921, _917);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _931 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[134].x, _923);
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _927 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _933;
    out.m_82.y = _935;
    out.m_82.z = _937;
    out.m_82.w = _939;
    bool _941 = !_859;
    if (!_941)
    {
        float _943 = in.m_76.x;
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _947 = _943 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _951 = _949 * _945;
        float _953 = floor(_951);
        float _955 = -_953;
        float _957 = _951 + _955;
        _181 = _957;
    }
    float _959 = _181;
    float _961 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _963 = int(_961);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _971 = int(_969);
    float _973 = float(_963);
    float _975 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _977 = int(_975);
    if (_967)
    {
        _623 = 1.0;
    }
    float _979 = _623;
    int _981 = 0;
    float _983 = _979;
    if (_967)
    {
        _981 = 0;
    }
    int _985 = _981;
    float _987 = float(_971);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _991 = int(_989);
    float _993 = 1.0 / _973;
    float _995 = float(uint(_977));
    int _997 = ~_977;
    int _999 = _997 + 1;
    float _1001 = 1.0 / _987;
    float _1003 = float(uint(_991));
    float _1005 = _993 * _135;
    float _1007 = 1.0 / _995;
    float _1009 = _993;
    float _1011 = _987;
    int _1013 = _985;
    if (_967)
    {
        float _1015 = in.m_76.x;
        float _1017 = in.m_76.y;
        _1009 = _1015;
        _1011 = _1017;
    }
    float _1019 = _1009;
    float _1021 = _1011;
    float _1023 = _1001 * _135;
    float _1025 = 1.0 / _1003;
    float _1027 = trunc(_1005);
    int _1029 = int(_1027);
    int _1031 = as_type<int>(_1007) + (-2);
    float _1033 = trunc(_1023);
    int _1035 = int(_1033);
    int _1037 = as_type<int>(_1025) + (-2);
    float _1039 = _1025;
    float _1041 = _1019;
    float _1043 = _1021;
    if (_967)
    {
        _1039 = _1019;
    }
    float _1045 = _1039;
    float _1047 = 0.0;
    float _1049 = _1045;
    if (_967)
    {
        _1047 = _1021;
    }
    float _1051 = _1047;
    float _1053 = 0.0;
    float _1055 = _1051;
    if (_967)
    {
        _1053 = _1045;
    }
    float _1057 = _1053;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1061 = int(_1059);
    float _1063 = float(uint(_1029));
    float _1065 = as_type<float>(_1031) * _1063;
    int _1067 = as_type<int>(_1063);
    float _1069 = _1057;
    if (_967)
    {
        _1067 = 0;
    }
    int _1071 = _1067;
    float _1073 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1075 = int(_1073);
    float _1077 = float(uint(_1035));
    float _1079 = as_type<float>(_1037) * _1077;
    float _1081 = _1077;
    int _1083 = _1071;
    if (_967)
    {
        _1081 = 1.0;
    }
    float _1085 = _1081;
    float _1087 = trunc(_1065);
    float _1089 = precise::max(_1087, 0.0);
    uint _1092 = uint(_1089);
    float _1094 = float(uint(_1061));
    float _1096 = 1.0 / _1094;
    float _1098 = float(_1075);
    float _1100 = trunc(_1079);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = 1.0 / _1098;
    float _1108 = _1098;
    float _1110 = _1085;
    if (_967)
    {
        _1108 = _1045;
    }
    float _1112 = _1108;
    float _1114 = _1112;
    if (!_967)
    {
        float _1116 = in.m_76.x;
        float _1118 = in.m_76.y;
        float _1120 = in.m_76.z;
        float _1122 = _1116 * 3.1415927410125732421875;
        float _1124 = _1122 * 0.15915493667125701904296875;
        float _1126 = _1118 * 3.1415927410125732421875;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1124 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _983 = 5.839270114898681640625;
        _1114 = _1120;
        _1110 = 7.345489978790283203125;
        _1041 = _1116;
        _1049 = _1118;
        _1043 = _1118;
        _1055 = _1136;
        _1083 = 1;
        _1013 = 2;
        _1069 = _1132;
    }
    float _1138 = _983;
    float _1140 = _1114;
    float _1142 = _1110;
    float _1144 = _1041;
    float _1146 = _1049;
    float _1148 = _1043;
    float _1150 = _1055;
    int _1152 = _1083;
    int _1154 = _1013;
    float _1156 = _1069;
    int _1158 = _999 * int(_1092);
    int _1160 = _1158 + _1029;
    float _1162 = in.m_76.z;
    float _1164 = in.m_76.w;
    int _1166 = ~_991;
    int _1168 = _1166 + 1;
    float _1170 = _1138 * _1140;
    float _1172 = _1142 * _1144;
    float _1174 = float(uint(_1160));
    float _1176 = _1106 * _135;
    int _1178 = _1168 * int(_1104);
    int _1180 = _1178 + _1035;
    float _1182 = floor(_1172);
    float _1184 = _1142 * _1146;
    float _1186 = as_type<float>(_1031) * _1174;
    float _1188 = float(_977);
    float _1190 = _1144 * 2.0;
    float _1192 = float(uint(_1180));
    float _1194 = in.m_74.w;
    float _1196 = float(_1029);
    float _1198 = trunc(_1186);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = as_type<float>(_1037) * _1192;
    bool _1206 = _1196 >= _1188;
    bool _1208 = isnan(_1196);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(_1188);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1220 = _959 + _1218;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1224 = _1222 != 0;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1228 = _959 + _1226;
    bool _1230 = _1148 > 0.5;
    float _1232 = trunc(_1176);
    int _1234 = int(_1232);
    bool _1236 = _1164 > 0.5;
    float _1238 = -_1182;
    float _1240 = _1172 + _1238;
    bool _1242 = _1162 > 0.5;
    float _1244 = in.m_72.w;
    int _1246 = as_type<int>(_1096) + (-2);
    float _1248 = _1148 + _1144;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1260 = _1258 != 0;
    float _1262 = trunc(_1204);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    int _1268 = int(_1092) + int(_1202);
    float _1270 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1272 = ~_991;
    int _1274 = _1272 + 1;
    int _1276 = ~_977;
    int _1278 = _1276 + 1;
    float _1280 = floor(_1170);
    float _1282 = float(uint(_1234));
    int _1284 = _1278 * _1268;
    int _1286 = _1284 + _1029;
    int _1288 = int(_1236);
    int _1290 = _1242 ? 2 : 0;
    int _1292 = _1288 | _1290;
    int _1294 = _1224 ? 4 : 0;
    int _1296 = _1292 | _1294;
    int _1298 = _1252 ? 8 : 0;
    int _1300 = _1296 | _1298;
    int _1302 = _1256 ? 16 : 0;
    int _1304 = _1300 | _1302;
    int _1306 = _1260 ? 32 : 0;
    int _1308 = _1304 | _1306;
    int _1310 = _1230 ? 64 : 0;
    int _1312 = _1308 | _1310;
    int _1314 = _1312 & 64;
    bool _1316 = !_1224;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = as_type<float>(_1246) * _1282;
    float _1322 = -_241;
    int _1324 = _1230 ? as_type<int>(_1322) : as_type<int>(_241);
    float _1326 = trunc(_1216);
    int _1328 = int(_1326);
    int _1330 = int(_1104) + int(_1266);
    bool _1332 = !_1256;
    float _1334 = _1332 ? _241 : as_type<float>(_1324);
    int _1336 = abs(_1318);
    int _1338 = ~_1061;
    int _1340 = _1338 + 1;
    float _1342 = floor(_1184);
    float _1344 = -_225;
    int _1346 = _1242 ? as_type<int>(_1344) : as_type<int>(_225);
    float _1348 = -_1280;
    float _1350 = _1170 + _1348;
    float _1352 = float(_991);
    bool _1354 = !_1260;
    float _1356 = _1354 ? _225 : as_type<float>(_1346);
    float _1358 = _1240 * _1188;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1370 = _1368 != 0;
    float _1372 = trunc(_1320);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    bool _1378 = uint(_1286) >= uint(_977);
    int _1380 = _1274 * _1330;
    int _1382 = _1380 + _1035;
    float _1384 = float(_1035);
    bool _1386 = !_1366;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = -_1342;
    float _1392 = _1184 + _1390;
    bool _1394 = !_1362;
    int _1396 = _1394 ? 0 : 1;
    float _1398 = trunc(_1358);
    int _1400 = int(_1398);
    bool _1402 = uint(_1382) >= uint(_991);
    float _1404 = _1350 * _1352;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1408 = _1406 != 0;
    bool _1410 = !_1378;
    int _1412 = _1410 ? 0 : (-1);
    bool _1414 = _1384 >= _1352;
    bool _1416 = isnan(_1384);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(_1352);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    int _1426 = _1340 * int(_1376);
    int _1428 = _1426 + _1234;
    bool _1430 = !_1370;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = trunc(_1404);
    int _1436 = int(_1434);
    bool _1438 = !_1408;
    int _1440 = _1438 ? 0 : 1;
    bool _1442 = !_1402;
    int _1444 = _1442 ? 0 : (-1);
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1456 = _1454 != 0;
    int _1458 = _1400 * _1336;
    int _1460 = _1458 + _1029;
    int _1462 = ~_1268;
    int _1464 = _1462 + _1412;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1424);
    int _1470 = int(_1468);
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1474 = _1472 != 0;
    bool _1476 = !_1452;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = _977 * _1466;
    int _1482 = _1480 + _1029;
    bool _1484 = !_1474;
    int _1486 = _1484 ? 0 : 1;
    bool _1488 = _977 == 0;
    float _1490 = floor(_1190);
    bool _1492 = _1314 != 0;
    int _1494 = abs(_1486);
    float _1496 = float(uint(_1428));
    int _1498 = ~_1330;
    int _1500 = _1498 + _1444;
    int _1502 = _1500 + 1;
    float _1504 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1506 = log2(_1504);
    bool _1508 = !_1488;
    int _1510 = _1508 ? _1482 : (-1);
    float _1512 = _175 * _135;
    float _1514 = as_type<float>(_1246) * _1496;
    bool _1516 = !_1448;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = _991 * _1502;
    int _1522 = _1520 + _1035;
    float _1524 = _1188 * _1512;
    bool _1526 = _991 == 0;
    float _1528 = _1352 * _1512;
    int _1530 = ~_1328;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    float _1536 = trunc(_1514);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    int _1542 = ~_1470;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _1436 * _1494;
    int _1550 = _1548 + _1035;
    bool _1552 = !_1526;
    int _1554 = _1552 ? _1522 : (-1);
    int _1556 = _1510 * _1534;
    int _1558 = _977 + (-1);
    float _1560 = _1506 * _135;
    int _1562 = _991 + (-1);
    float _1564 = trunc(_1524);
    int _1566 = int(_1564);
    int _1568 = _1554 * _1546;
    int _1570 = abs(_1388);
    int _1572 = _1328 * _1558;
    int _1574 = _1572 + _1556;
    int _1576 = abs(_1478);
    int _1578 = _1470 * _1562;
    int _1580 = _1578 + _1568;
    int _1582 = abs(_1432);
    int _1584 = _1574 * _1570;
    float _1586 = trunc(_1528);
    int _1588 = int(_1586);
    int _1590 = abs(_1396);
    int _1592 = ~_1061;
    int _1594 = _1592 + 1;
    int _1596 = _1580 * _1576;
    int _1598 = int(_1376) + int(_1540);
    int _1600 = _1566 * _1590;
    int _1602 = _1600 + _1584;
    int _1604 = abs(_1440);
    int _1606 = abs(_1518);
    int _1608 = _1460 * _1582;
    int _1610 = _1608 + _1602;
    float _1612 = -_225;
    int _1614 = _1236 ? as_type<int>(_1612) : as_type<int>(_225);
    int _1616 = _1594 * _1598;
    int _1618 = _1616 + _1234;
    float _1620 = float(_1234);
    int _1622 = _1400 * _1604;
    int _1624 = _1622 + _1610;
    float _1626 = float(_1061);
    int _1628 = _1588 * _1606;
    int _1630 = _1628 + _1596;
    bool _1632 = uint(_1618) >= uint(_1061);
    float _1634 = -_241;
    int _1636 = _1242 ? as_type<int>(_1634) : as_type<int>(_241);
    float _1638 = _1626 * _1512;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1642 = _1640 != 0;
    float _1644 = _1392 * _1626;
    float _1646 = float(uint(_1624));
    bool _1648 = !_1642;
    int _1650 = _1648 ? 0 : 1;
    float _1652 = trunc(_1638);
    int _1654 = int(_1652);
    bool _1656 = !_1456;
    int _1658 = _1656 ? 0 : 1;
    float _1660 = as_type<float>(_1031) * _1646;
    int _1662 = abs(_1650);
    bool _1664 = !_1252;
    float _1666 = _1664 ? _225 : as_type<float>(_1614);
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1670 = _1668 != 0;
    float _1672 = trunc(_1660);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = abs(_1658);
    bool _1680 = _1620 >= _1626;
    bool _1682 = isnan(_1620);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(_1626);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    bool _1692 = !_1670;
    int _1694 = _1692 ? 0 : 1;
    int _1696 = _1550 * _1678;
    int _1698 = _1696 + _1630;
    bool _1700 = !_1632;
    int _1702 = _1700 ? 0 : (-1);
    float _1704 = trunc(_1690);
    int _1706 = int(_1704);
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1710 = _1708 != 0;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1714 = _1712 != 0;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1718 = _1716 != 0;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1722 = _1720 != 0;
    int _1724 = ~_1598;
    int _1726 = _1724 + _1702;
    int _1728 = _1726 + 1;
    int _1730 = _1436 * _1662;
    int _1732 = _1730 + _1698;
    int _1734 = abs(_1694);
    int _1736 = ~_977;
    int _1738 = _1736 + 1;
    int _1740 = _1061 * _1728;
    int _1742 = _1740 + _1234;
    bool _1744 = !_1714;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1750 = _1748 != 0;
    float _1752 = trunc(_1644);
    int _1754 = int(_1752);
    bool _1756 = !_1710;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = _1738 * int(_1676);
    int _1762 = _1760 + _1624;
    bool _1764 = _1061 == 0;
    float _1766 = float(uint(_1732));
    float _1768 = float(uint(_1762));
    int _1770 = ~_1706;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = as_type<float>(_1037) * _1766;
    bool _1778 = !_1764;
    int _1780 = _1778 ? _1742 : (-1);
    float _1782 = as_type<float>(_1698);
    float _1784 = as_type<float>(_1676);
    float _1786 = as_type<float>(_1494);
    float _1788 = as_type<float>(_1152);
    float _1790 = as_type<float>(_1154);
    if (_1750)
    {
        float _1792 = in.m_76.w;
        _1782 = _1792;
    }
    float _1794 = _1782;
    float _1796 = as_type<float>(_1031) * _1768;
    float _1798 = trunc(_1776);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    int _1804 = abs(_1746);
    int _1806 = _1780 * _1774;
    int _1808 = _1061 + (-1);
    int _1810 = abs(_1758);
    float _1812 = trunc(_1796);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    int _1818 = _1706 * _1808;
    int _1820 = _1818 + _1806;
    int _1822 = ~_977;
    int _1824 = _1822 + 1;
    int _1826 = _1754 * _1734;
    int _1828 = _1826 + _1234;
    bool _1830 = _977 == 0;
    int _1832 = _1820 * _1804;
    int _1834 = ~_991;
    int _1836 = _1834 + 1;
    float _1838 = as_type<float>(_1804);
    float _1840 = as_type<float>(_1734);
    if (!_1750)
    {
        _1838 = _241;
    }
    float _1842 = _1838;
    int _1844 = _1654 * _1810;
    int _1846 = _1844 + _1832;
    bool _1848 = !_1718;
    int _1850 = _1848 ? 0 : 1;
    float _1852 = _1842;
    if (_1750)
    {
        float _1854 = _1794 * 3.1415927410125732421875;
        _1840 = _1854;
    }
    float _1856 = _1840;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1860 = _1858 != 0;
    int _1862 = _1836 * int(_1802);
    int _1864 = _1862 + _1732;
    int _1866 = int(_1676) + int(_1816);
    if (_1750)
    {
        float _1868 = _1856 * 0.15915493667125701904296875;
        _1784 = _1868;
    }
    float _1870 = _1784;
    int _1872 = abs(_1850);
    float _1874 = float(uint(_1864));
    int _1876 = _1824 * _1866;
    int _1878 = _1876 + _1624;
    bool _1880 = !_1722;
    int _1882 = _1880 ? 0 : 1;
    float _1884 = _1870;
    if (_1750)
    {
        float _1886 = _1870 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = as_type<float>(_1037) * _1874;
    int _1894 = abs(_1882);
    int _1896 = _1828 * _1872;
    int _1898 = _1896 + _1846;
    bool _1900 = uint(_1878) >= uint(_977);
    float _1902 = _1644;
    if (_1860)
    {
        float _1904 = in.m_76.x;
        _1902 = _1904;
    }
    float _1906 = _1902;
    float _1908 = float(uint(_1460));
    int _1910 = _1754 * _1894;
    int _1912 = _1910 + _1898;
    bool _1914 = !_1900;
    int _1916 = _1914 ? 0 : (-1);
    float _1918 = trunc(_1892);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1926 = _1924 != 0;
    float _1928 = as_type<float>(_1031) * _1908;
    int _1930 = ~_1866;
    int _1932 = _1930 + _1916;
    int _1934 = _1932 + 1;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1940 = !_1926;
    float _1942 = _1940 ? _241 : as_type<float>(_1636);
    float _1944 = float(uint(_1912));
    float _1946 = trunc(_1928);
    float _1948 = precise::max(_1946, 0.0);
    uint _1950 = uint(_1948);
    int _1952 = _977 * _1934;
    int _1954 = _1952 + _1624;
    bool _1956 = _1926;
    float _1958 = _1944;
    if (_1750)
    {
        bool _1960 = _1890 > 0.5;
        _1956 = _1960;
    }
    bool _1962 = _1956;
    float _1964 = as_type<float>(_1246) * _1944;
    int _1966 = ~_977;
    int _1968 = _1966 + 1;
    bool _1970 = !_1830;
    int _1972 = _1970 ? _1954 : (-1);
    float _1974 = 1.0 / _1938;
    if (_1750)
    {
        float _1976 = -_241;
        float _1978 = _1962 ? _1976 : _241;
        _1852 = _1978;
    }
    float _1980 = _1852;
    int _1982 = _1972 & 3;
    bool _1984 = _1982 != 0;
    if (_1860)
    {
        float _1986 = _1906 * 3.1415927410125732421875;
        _1958 = _1986;
    }
    float _1988 = _1958;
    int _1990 = _1972 & 3;
    bool _1992 = _1990 != 0;
    int _1994 = int(_1802) + int(_1922);
    float _1996 = trunc(_1964);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    int _2002 = _1968 * int(_1950);
    int _2004 = _2002 + _1460;
    int _2006 = ~_1061;
    int _2008 = _2006 + 1;
    float _2010 = _1988;
    if (_1860)
    {
        float _2012 = _1988 * 0.15915493667125701904296875;
        _2010 = _2012;
    }
    float _2014 = _2010;
    int _2016 = _1984 ? 0 : 1;
    bool _2018 = uint(_1990) > 1u;
    float _2020 = float(uint(_1550));
    float _2022 = _2014;
    if (_1860)
    {
        float _2024 = _2014 * 6.283185482025146484375;
        float _2026 = sin(_2024);
        _2022 = _2026;
    }
    float _2028 = _2022;
    float _2030 = float(uint(_2004));
    float _2032 = as_type<float>(_1037) * _2020;
    int _2034 = ~_991;
    int _2036 = _2034 + 1;
    float _2038 = as_type<float>(_1031) * _2030;
    int _2040 = ~_2016;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _2008 * int(_2000);
    int _2048 = _2046 + _1912;
    float _2050 = trunc(_2032);
    float _2052 = precise::max(_2050, 0.0);
    uint _2054 = uint(_2052);
    int _2056 = _2036 * _1994;
    int _2058 = _2056 + _1732;
    float _2060 = -_225;
    int _2062 = _1492 ? as_type<int>(_2060) : as_type<int>(_225);
    float _2064 = float(uint(_2048));
    bool _2066 = uint(_1990) >= 2u;
    int _2068 = _2044;
    if (!_2018)
    {
        int _2070 = ~_2016;
        int _2072 = _2070 + 1;
        _2068 = _2072;
    }
    int _2074 = _2068;
    float _2076 = as_type<float>(_1246) * _2064;
    bool _2078 = uint(_2058) >= uint(_991);
    float _2080 = trunc(_2038);
    float _2082 = precise::max(_2080, 0.0);
    uint _2084 = uint(_2082);
    int _2086 = _2066 ? 0 : 1;
    bool _2088 = _1990 != 3;
    bool _2090 = !_2078;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = ~_991;
    int _2096 = _2094 + 1;
    float _2098 = trunc(_2076);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    int _2104 = ~_1994;
    int _2106 = _2104 + _2092;
    int _2108 = _2106 + 1;
    int _2110 = _2096 * int(_2054);
    int _2112 = _2110 + _1550;
    int _2114 = ~_2086;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _991 * _2108;
    int _2122 = _2120 + _1732;
    int _2124 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2126 = _2124 != 0;
    int _2128 = _2118;
    bool _2130 = _2088;
    float _2132 = 2.8025969286496341418474591665798e-45;
    if (_2088)
    {
        int _2134 = ~_2086;
        int _2136 = _2134 + 1;
        _2128 = _2136;
    }
    int _2138 = _2128;
    if (_1860)
    {
        bool _2140 = _2028 > 0.5;
        _2130 = _2140;
    }
    bool _2142 = _2130;
    bool _2144 = !_1526;
    int _2146 = _2144 ? _2122 : (-1);
    float _2148 = float(uint(_2112));
    if (!_1860)
    {
        _2132 = _225;
    }
    float _2150 = _2132;
    float _2152 = _2150;
    if (_1860)
    {
        float _2154 = -_225;
        float _2156 = _2142 ? _2154 : _225;
        _2152 = _2156;
    }
    float _2158 = _2152;
    float _2160 = as_type<float>(_1037) * _2148;
    int _2162 = _2146 & 3;
    bool _2164 = _2162 != 0;
    bool _2166 = !_2126;
    float _2168 = _2166 ? _225 : as_type<float>(_2062);
    int _2170 = int(_2000) + int(_2102);
    float _2172 = trunc(_2160);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    int _2178 = ~_1061;
    int _2180 = _2178 + 1;
    int _2182 = _2146 & 3;
    bool _2184 = _2182 != 0;
    bool _2186 = uint(_2162) > 1u;
    int _2188 = _2180 * _2170;
    int _2190 = _2188 + _1912;
    int _2192 = int(_1950) + int(_2084);
    int _2194 = ~_977;
    int _2196 = _2194 + 1;
    int _2198 = _2184 ? 0 : 1;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2202 = _2200 != 0;
    int _2204 = _2196 * _2192;
    int _2206 = _2204 + _1460;
    float _2208 = float(uint(_1828));
    bool _2210 = !_2202;
    int _2212 = _2210 ? 0 : 1;
    bool _2214 = uint(_2190) >= uint(_1061);
    float _2216 = as_type<float>(_1246) * _2208;
    int _2218 = ~_2198;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2222;
    if (!_2186)
    {
        int _2226 = ~_2198;
        int _2228 = _2226 + 1;
        _2224 = _2228;
    }
    int _2230 = _2224;
    bool _2232 = uint(_2206) >= uint(_977);
    float _2234 = trunc(_2216);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    bool _2240 = !_2214;
    int _2242 = _2240 ? 0 : (-1);
    bool _2244 = _2162 != 3;
    bool _2246 = !_2232;
    int _2248 = _2246 ? 0 : (-1);
    bool _2250 = uint(_2162) >= 2u;
    int _2252 = ~_2170;
    int _2254 = _2252 + _2242;
    int _2256 = _2254 + 1;
    int _2258 = ~_991;
    int _2260 = _2258 + 1;
    int _2262 = int(_2054) + int(_2176);
    int _2264 = _1061 * _2256;
    int _2266 = _2264 + _1912;
    int _2268 = ~_1061;
    int _2270 = _2268 + 1;
    int _2272 = _2250 ? 0 : 1;
    int _2274 = _2260 * _2262;
    int _2276 = _2274 + _1550;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2280 = _2278 != 0;
    int _2282 = ~_2272;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = _2286;
    int _2290 = _2230;
    if (_2244)
    {
        int _2292 = ~_2272;
        int _2294 = _2292 + 1;
        _2288 = _2294;
    }
    int _2296 = _2288;
    int _2298 = _2270 * int(_2238);
    int _2300 = _2298 + _1828;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2304 = _2302 != 0;
    bool _2306 = !_2280;
    int _2308 = _2306 ? 0 : 1;
    bool _2310 = uint(_2276) >= uint(_991);
    bool _2312 = !_1764;
    int _2314 = _2312 ? _2266 : (-1);
    bool _2316 = !_2304;
    int _2318 = _2316 ? 0 : 1;
    bool _2320 = !_2310;
    int _2322 = _2320 ? 0 : (-1);
    int _2324 = _2314 & 3;
    bool _2326 = _2324 != 0;
    int _2328 = _2314 & 3;
    bool _2330 = _2328 != 0;
    float _2332 = float(uint(_2300));
    int _2334 = _2326 ? 0 : 1;
    bool _2336 = uint(_2328) > 1u;
    float _2338 = as_type<float>(_1246) * _2332;
    int _2340 = ~_2334;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    float _2346 = trunc(_2338);
    float _2348 = precise::max(_2346, 0.0);
    uint _2350 = uint(_2348);
    int _2352 = ~_2262;
    int _2354 = _2352 + _2322;
    int _2356 = _2354 + 1;
    float _2358 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2360 = _2358 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2364 = _2362 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2366 = _2344;
    if (!_2336)
    {
        int _2368 = ~_2334;
        int _2370 = _2368 + 1;
        _2366 = _2370;
    }
    int _2372 = _2366;
    bool _2374 = uint(_2328) >= 2u;
    float _2376 = 1.0 / _2360;
    int _2378 = ~_1061;
    int _2380 = _2378 + 1;
    int _2382 = _2374 ? 0 : 1;
    bool _2384 = _2328 != 3;
    int _2386 = int(_2238) + int(_2350);
    float _2388 = 1.0 / _2364;
    int _2390 = ~_2382;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    int _2396 = _2380 * _2386;
    int _2398 = _2396 + _1828;
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2400;
    int _2404 = _2394;
    if (_2384)
    {
        int _2406 = ~_2382;
        int _2408 = _2406 + 1;
        _2404 = _2408;
    }
    int _2410 = _2404;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2414 = uint(_2398) >= uint(_1061);
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2418 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2412);
    bool _2420 = !_2414;
    int _2422 = _2420 ? 0 : (-1);
    float _2424 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _2426 = _1144 > 0.5;
    float _2428 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2418);
    float _2430 = -_241;
    int _2432 = _2426 ? as_type<int>(_2430) : as_type<int>(_241);
    int _2434 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2436 = _2434 != 0;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2440 = in.m_56.x;
    float _2442 = in.m_56.y;
    float _2444 = in.m_56.z;
    int _2446 = abs(_2074);
    bool _2448 = !_2436;
    float _2450 = _2448 ? _241 : as_type<float>(_2432);
    float _2452 = fma(_2424, -2.0, _2438);
    bool _2454 = _1152 != 1;
    float _2456 = _1248 + (-1.0);
    int _2458 = ~_2386;
    int _2460 = _2458 + _2422;
    int _2462 = _2460 + 1;
    float _2464 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2452);
    int _2466 = ~_2192;
    int _2468 = _2466 + _2248;
    int _2470 = _2468 + 1;
    int _2472 = abs(_2212);
    int _2474 = _1061 * _2462;
    int _2476 = _2474 + _1828;
    int _2478 = abs(_2372);
    int _2480 = _977 * _2470;
    int _2482 = _2480 + _1460;
    int _2484 = ~_2478;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = as_type<float>(_2462);
    if (!_2454)
    {
        _1786 = _1148;
    }
    float _2492 = _1786;
    float _2494 = 0.0;
    float _2496 = _2492;
    if (!_2454)
    {
        _2494 = _1148;
    }
    float _2498 = _2494;
    float _2500 = 0.0;
    float _2502 = _2498;
    if (!_2454)
    {
        _2500 = _1162;
    }
    float _2504 = _2500;
    float _2506 = _197 * _2442;
    float _2508 = _2504;
    if (!_2454)
    {
        _1788 = _1162;
    }
    float _2510 = _1788;
    float _2512 = _1148 * 2.0;
    float _2514 = _2510;
    if (_2454)
    {
        _2496 = _1144;
    }
    float _2516 = _2496;
    float _2518 = _203 * _2442;
    if (_2454)
    {
        _2502 = _1144;
    }
    float _2520 = _2502;
    float _2522 = _209 * _2442;
    if (_2454)
    {
        _2508 = _1148;
    }
    float _2524 = _2508;
    float _2526 = fma(_195, _2440, _2506);
    if (_2454)
    {
        _2514 = _1148;
    }
    float _2528 = _2514;
    float _2530 = floor(_2512);
    bool _2532 = _1154 != 2;
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2538 = fma(_201, _2440, _2518);
    float _2540 = fma(_207, _2440, _2522);
    float _2542 = fma(_199, _2444, _2526);
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2546 = fma(_205, _2444, _2538);
    float _2548 = fma(_211, _2444, _2540);
    float _2550 = _1162 * 2.0;
    float _2552 = 1.0 / _2536;
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2554;
    float _2558 = 0.0;
    float _2560 = _2544;
    if (_2532)
    {
        _2558 = _1144;
    }
    float _2562 = _2558;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2568 = _2562;
    if (_2532)
    {
        _1790 = _1148;
    }
    float _2570 = _1790;
    float _2572 = _2556 * _1974;
    float _2574 = _2570;
    if (!_2532)
    {
        _2568 = _1162;
    }
    float _2576 = _2568;
    float _2578 = _2546 + _1244;
    if (!_2532)
    {
        _2574 = _1144;
    }
    float _2580 = _2574;
    float _2582 = floor(_2550);
    bool _2584 = _1490 >= 0.0;
    bool _2586 = isnan(_1490);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan(0.0);
    bool _2592 = _2588 || _2590;
    float _2594 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2596 = _2592 ? 0 : 1;
    bool _2598 = _1490 > 0.0;
    float _2600 = 1.0 / _2566;
    int _2602 = ~_2596;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    bool _2608 = !_1764;
    int _2610 = _2608 ? _2476 : (-1);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2614 = _2612 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2616 = _2606;
    if (!_2598)
    {
        int _2618 = ~_2596;
        int _2620 = _2618 + 1;
        _2616 = _2620;
    }
    int _2622 = _2616;
    float _2624 = 1.0 / _2614;
    bool _2626 = _2530 >= 0.0;
    bool _2628 = isnan(_2530);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan(0.0);
    bool _2634 = _2630 || _2632;
    int _2636 = _2634 ? 0 : 1;
    bool _2638 = _2530 > 0.0;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2642 = _2640 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2648;
    int _2652 = ~_2636;
    int _2654 = _2652 + 1;
    int _2656 = _2654 + 1;
    float _2658 = 1.0 / _2642;
    float _2660 = _2646 * _2388;
    float _2662 = _2650 * _2376;
    int _2664 = _991 * _2356;
    int _2666 = _2664 + _1550;
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2670 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2668;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2676 = !_1992;
    int _2678 = _2676 ? 0 : 1;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2684 = _2656;
    if (!_2638)
    {
        int _2686 = ~_2636;
        int _2688 = _2686 + 1;
        _2684 = _2688;
    }
    int _2690 = _2684;
    float _2692 = _2670 * _2624;
    bool _2694 = !_1526;
    int _2696 = _2694 ? _2666 : (-1);
    float _2698 = _2674 * _2600;
    bool _2700 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2702 = isnan(_959);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2708 = _2704 || _2706;
    float _2710 = float(_2708);
    float _2712 = _2682 * _2552;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2716 = _2714 != 0;
    int _2718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2720 = _2718 != 0;
    int _2722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2724 = _2722 != 0;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2728 = _959 + _2726;
    bool _2730 = _2582 >= 0.0;
    bool _2732 = isnan(_2582);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(0.0);
    bool _2738 = _2734 || _2736;
    float _2740 = -_2710;
    float _2742 = _2740 + 1.0;
    bool _2744 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2746 = isnan(_959);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2752 = _2748 || _2750;
    float _2754 = float(_2752);
    float _2756 = _2402 * _2658;
    int _2758 = _2738 ? 0 : 1;
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2762 = _959 + _2760;
    bool _2764 = _2582 > 0.0;
    float _2766 = _2754 * _2742;
    bool _2768 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2770 = isnan(_959);
    bool _2772 = _2768 || _2770;
    bool _2774 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2776 = _2772 || _2774;
    float _2778 = float(_2776);
    float _2780 = -_2754;
    float _2782 = _2780 + 1.0;
    bool _2784 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2786 = isnan(_959);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = fma(_2660, _2762, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2798 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2800 = isnan(_959);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2806 = _2802 || _2804;
    float _2808 = float(_2806);
    float _2810 = _2778 * _2782;
    float _2812 = -_2778;
    float _2814 = _2812 + 1.0;
    float _2816 = -_2794;
    float _2818 = _2816 + 1.0;
    float _2820 = fma(_2572, _2728, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2822 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2824 = isnan(_959);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2830 = _2826 || _2828;
    float _2832 = float(_2830);
    float _2834 = _2794 * _2814;
    float _2836 = in.m_70.w;
    float _2838 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2840 = _959 + _2838;
    float _2842 = _2808 * _2818;
    float _2844 = -_2808;
    float _2846 = _2844 + 1.0;
    bool _2848 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2850 = isnan(_959);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2856 = _2852 || _2854;
    float _2858 = float(_2856);
    float _2860 = fma(_2662, _2840, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2864 = _959 + _2862;
    float _2866 = _2832 * _2846;
    float _2868 = -_2832;
    float _2870 = _2868 + 1.0;
    bool _2872 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2874 = isnan(_959);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2880 = _2876 || _2878;
    float _2882 = float(_2880);
    float _2884 = -_2858;
    float _2886 = _2884 + 1.0;
    float _2888 = fma(_2712, _2864, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2892 = _959 + _2890;
    float _2894 = _2858 * _2870;
    float _2896 = _2882 * _2886;
    float _2898 = -_2882;
    float _2900 = _2898 + 1.0;
    float _2902 = fma(_2692, _2892, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2904 = _2820 * _2896;
    float _2906 = fma(_2698, _1220, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2908 = ~_2758;
    int _2910 = _2908 + 1;
    int _2912 = _2910 + 1;
    float _2914 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2904);
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2918 = _2542 + _2836;
    float _2920 = _2548 + _1194;
    float _2922 = fma(_2796, _2894, _2914);
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2926 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2916);
    float _2928 = fma(_2860, _2866, _2922);
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2932 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2924);
    float _2934 = _1148 + (-0.5);
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2938 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2930);
    float _2940 = _1148 + _1162;
    float _2942 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2936);
    float _2944 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2946 = fma(_2888, _2842, _2928);
    float _2948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2950 = _2578 + _2948;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2954 = -_2416;
    float _2956 = fma(_2944, 2.0, _2954);
    int _2958 = _2146 >> 31;
    float _2960 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2962 = fma(_1270, -2.0, _2952);
    float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2966 = _2918 + _2964;
    float _2968 = _2950 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2970 = _2958 & 3;
    float _2972 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2974 = _2912;
    float _2976 = _2920;
    if (!_2764)
    {
        int _2978 = ~_2758;
        int _2980 = _2978 + 1;
        _2974 = _2980;
    }
    int _2982 = _2974;
    float _2984 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2960);
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2920 + _2986;
    float _2990 = fma(_2966, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2968);
    float _2992 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2994 = _1144 + _1162;
    float _2996 = _1144 + (-0.5);
    int _2998 = _2146 + _2970;
    float _3000 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2990);
    float _3002 = -_135;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2956);
    int _3006 = _2998 >> 2;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3010 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _3012 = _3006 << 4;
    int _3014 = _3012 + 656;
    float _3016 = _2158 + (-0.5);
    bool _3018 = !_2164;
    int _3020 = _3018 ? 0 : 1;
    float _3022 = -_3010;
    float _3024 = fma(_2992, 2.0, _3022);
    float _3026 = fma(_2902, _2834, _2946);
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _3030 = uint(int(uint(_3014) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[int(_3040)][_3042];
    bool _3046 = _2162 != 3;
    float _3048 = -_135;
    float _3050 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3024);
    float _3052 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3028);
    float _3054 = fma(_2906, _2810, _3026);
    bool _3056 = !_3046;
    int _3058 = _3056 ? 0 : (-1);
    float _3060 = -_3016;
    float _3062 = -_2464;
    float _3064 = fma(_3060, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3062);
    bool _3066 = _3000 >= 0.0;
    int _3068 = _3014 + 8;
    uint _3070 = uint(int(uint(_3068) >> uint(2)));
    uint _3072 = uint(int(uint(int(_3070)) >> uint(2)));
    int _3074 = int(_3070) & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    int _3078 = int(_3070) + 1;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    int _3082 = _3078 & 3;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[int(_3080)][_3082];
    float _3086 = _1980 + 0.5;
    float _3088 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3008);
    float _3090 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3092 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[95].x, _3004);
    float _3094 = _2450 + 0.5;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3098 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2962);
    float _3100 = _2168 + (-0.5);
    float _3102 = fma(_3094, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3050);
    float _3104 = fma(_3090, -2.0, _3096);
    int _3106 = abs(_2230);
    float _3108 = -_3100;
    float _3110 = -_3098;
    float _3112 = fma(_3108, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3110);
    float _3114 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3118 = fma(_2756, _1228, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3120 = abs(_3058);
    float _3122 = -_3116;
    float _3124 = fma(_2594, 2.0, _3122);
    int _3126 = abs(_3020);
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3130 = fma(_3118, _2766, _3054);
    int _3132 = abs(_2296);
    float _3134 = -_3128;
    float _3136 = fma(_2544, 2.0, _3134);
    int _3138 = ~_3106;
    int _3140 = _3138 + 1;
    int _3142 = _3140 + 1;
    if (_3066)
    {
        _2560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3144 = _2560;
    float _3146 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2942);
    int _3148 = ~_3126;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3066)
    {
        float _3156 = _3144 * 5.0;
        _2290 = as_type<int>(_3156);
    }
    int _3158 = _2290;
    bool _3160 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3162 = isnan(0.0);
    bool _3164 = _3160 || _3162;
    bool _3166 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3168 = _3164 || _3166;
    float _3170 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2938);
    float _3172 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2926);
    if (_3066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10223 = as_type<float>(_3158);
        out.gl_Position.z = _10223;
    }
    int _3174 = _3142 * as_type<int>(_3044);
    int _3176 = ~_3132;
    int _3178 = _3176 + 1;
    int _3180 = _3178 + 1;
    float _3182 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3184 = int(_3182);
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3188 = _3152 * as_type<int>(_3036);
    int _3190 = _3188 + _3174;
    int _3192 = abs(_2308);
    float _3194 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3104);
    int _3196 = _3180 * as_type<int>(_3076);
    int _3198 = _3196 + _3190;
    float _3200 = exp2(_1560);
    int _3202 = ~_3120;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    float _3208 = -_2428;
    float _3210 = _3208 + 1.0;
    int _3212 = ~_3192;
    int _3214 = _3212 + 1;
    int _3216 = _3214 + 1;
    float _3218 = _3154 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3220 = _1666 + (-0.5);
    int _3222 = _3206 * as_type<int>(_3084);
    int _3224 = _3222 + _3198;
    float _3226 = -_3146;
    float _3228 = _3226 + 1.0;
    float _3230 = float(uint(_3184));
    float _3232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3234 = _3224 * _3216;
    float _3236 = fma(_3210, _2158, _3064);
    float _3238 = -_3228;
    float _3240 = fma(_3238, _1980, _3092);
    int _3242 = _2696 * _3192;
    int _3244 = _3242 + _3234;
    float _3246 = _1942 + 0.5;
    float _3248 = -_3200;
    float _3250 = _3248 + 1.0;
    float _3252 = 1.0 / _3230;
    float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3256 = 1.0 + _3254;
    float _3258 = -_135;
    float _3260 = fma(_3258, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3136);
    float _3262 = fma(_3114, -2.0, _3186);
    float _3264 = _3168 ? _3250 : 0.0;
    out.m_84.x = _3240;
    out.m_84.y = _3236;
    float _3266 = fma(_3218, _3246, _3260);
    bool _3268 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3270 = isnan(1.0);
    bool _3272 = _3268 || _3270;
    bool _3274 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3276 = _3272 || _3274;
    float _3278 = 1.0 / _3256;
    float _3280 = float(uint(_3244));
    float _3282 = _3232 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3284 = abs(_3184);
    float _3286 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2984);
    float _3288 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2932);
    float _3290 = -_3282;
    float _3292 = -_3194;
    float _3294 = fma(_3290, _3220, _3292);
    int _3296 = ~_3184;
    int _3298 = _3296 + 1;
    float _3300 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3088);
    int _3302 = as_type<int>(_3252) + (-2);
    float _3304 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3052);
    float _3306 = -_135;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3124);
    float _3310 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3262);
    float _3312 = float(uint(_3284));
    float _3314 = as_type<float>(_3302) * _3280;
    float _3316 = _2950 * _2950;
    if (_3276)
    {
        float _3318 = _3264 * _3278;
        _145 = _3318;
    }
    float _3320 = _145;
    float _3322 = trunc(_3314);
    float _3324 = precise::max(_3322, 0.0);
    uint _3326 = uint(_3324);
    int _3328 = _1972 >> 31;
    float _3330 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3130);
    int _3332 = _2314 >> 31;
    float _3334 = fma(_2966, _2966, _3316);
    int _3336 = _3328 & 3;
    float _3338 = -_3300;
    float _3340 = _3338 + 1.0;
    bool _3342 = !_2716;
    int _3344 = _3342 ? 0 : 1;
    float _3346 = 1.0 / _3312;
    int _3348 = _3332 & 3;
    float _3350 = fma(_2988, _2988, _3334);
    int _3352 = _1972 + _3336;
    float _3354 = -_3170;
    float _3356 = _3354 + 1.0;
    int _3358 = _2314 + _3348;
    float _3360 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3362 = -_3340;
    float _3364 = fma(_1942, _3362, _3266);
    float _3366 = rsqrt(_3350);
    int _3368 = _3298 * int(_3326);
    int _3370 = _3368 + _3244;
    float _3372 = -_3356;
    float _3374 = fma(_2450, _3372, _3102);
    int _3376 = abs(_3244);
    float _3378 = -_3304;
    float _3380 = _3378 + 1.0;
    int _3382 = _3352 >> 2;
    out.m_86.x = _3330;
    int _3384 = _3358 >> 2;
    float _3386 = fma(_1666, _3380, _3294);
    float _3388 = float(uint(_3370));
    float _3390 = -_3172;
    float _3392 = _3390 + 1.0;
    int _3394 = as_type<int>(_3346) + (-2);
    float _3396 = -_3286;
    float _3398 = _3396 + 1.0;
    float _3400 = float(uint(_3376));
    float _3402 = as_type<float>(_3302) * _3388;
    int _3404 = _3382 << 4;
    int _3406 = _3404 + 368;
    float _3408 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3410 = _3384 << 4;
    int _3412 = _3410 + 800;
    float _3414 = as_type<float>(_3394) * _3400;
    uint _3416 = uint(int(uint(_3406) >> uint(2)));
    uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
    int _3420 = int(_3416) & 3;
    float _3422 = (*spvDescriptorSet0.vp_c9)._m0[int(_3418)][_3420];
    int _3424 = int(_3416) + 1;
    uint _3426 = uint(int(uint(_3424) >> uint(2)));
    int _3428 = _3424 & 3;
    float _3430 = (*spvDescriptorSet0.vp_c9)._m0[int(_3426)][_3428];
    float _3432 = _3408 * _3366;
    float _3434 = fma(_2168, _3392, _3112);
    int _3436 = abs(_3344);
    float _3438 = trunc(_3414);
    float _3440 = precise::max(_3438, 0.0);
    uint _3442 = uint(_3440);
    float _3444 = _2950 * _3432;
    float _3446 = _2966 * _3432;
    out.m_88.x = _3374;
    out.m_88.y = _3434;
    out.m_88.z = _3364;
    out.m_88.w = _3386;
    uint _3448 = uint(int(uint(_3412) >> uint(2)));
    uint _3450 = uint(int(uint(int(_3448)) >> uint(2)));
    int _3452 = int(_3448) & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    int _3456 = int(_3448) + 1;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    int _3460 = _3456 & 3;
    float _3462 = (*spvDescriptorSet0.vp_c9)._m0[int(_3458)][_3460];
    float _3464 = -_3444;
    float _3466 = _2950 + _3464;
    float _3468 = -_3446;
    float _3470 = _2966 + _3468;
    float _3472 = float(_2982);
    float _3474 = _2988 * _3432;
    int _3476 = ~_3284;
    int _3478 = _3476 + 1;
    float _3480 = _3466 * _3466;
    float _3482 = float(_3436);
    float _3484 = trunc(_3402);
    float _3486 = precise::max(_3484, 0.0);
    uint _3488 = uint(_3486);
    int _3490 = ~_3184;
    int _3492 = _3490 + 1;
    float _3494 = fma(_3470, _3470, _3480);
    int _3496 = abs(_2678);
    int _3498 = _3478 * int(_3442);
    int _3500 = _3498 + _3376;
    int _3502 = _3412 + 8;
    uint _3504 = uint(int(uint(_3502) >> uint(2)));
    uint _3506 = uint(int(uint(int(_3504)) >> uint(2)));
    int _3508 = int(_3504) & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    int _3512 = int(_3504) + 1;
    uint _3514 = uint(int(uint(_3512) >> uint(2)));
    int _3516 = _3512 & 3;
    float _3518 = (*spvDescriptorSet0.vp_c9)._m0[int(_3514)][_3516];
    float _3520 = _3482 * _3472;
    float _3522 = _3360;
    float _3524 = _3366;
    float _3526 = as_type<float>(_3496);
    if (_3066)
    {
        out.m_63.x = 0.0;
    }
    float _3528 = float(uint(_3500));
    float _3530 = -_3474;
    float _3532 = _2988 + _3530;
    int _3534 = ~_2446;
    int _3536 = _3534 + 1;
    int _3538 = _3536 + 1;
    int _3540 = _3406 + 8;
    uint _3542 = uint(int(uint(_3540) >> uint(2)));
    uint _3544 = uint(int(uint(int(_3542)) >> uint(2)));
    int _3546 = int(_3542) & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    int _3550 = int(_3542) + 1;
    uint _3552 = uint(int(uint(_3550) >> uint(2)));
    int _3554 = _3550 & 3;
    float _3556 = (*spvDescriptorSet0.vp_c9)._m0[int(_3552)][_3554];
    float _3558 = as_type<float>(_3394) * _3528;
    bool _3560 = !_2330;
    int _3562 = _3560 ? 0 : 1;
    int _3564 = int(_3326) + int(_3488);
    float _3566 = trunc(_3558);
    float _3568 = precise::max(_3566, 0.0);
    uint _3570 = uint(_3568);
    bool _3572 = _1990 != 3;
    bool _3574 = _977 == 0;
    int _3576 = _3492 * _3564;
    int _3578 = _3576 + _3244;
    int _3580 = ~_3284;
    int _3582 = _3580 + 1;
    float _3584 = _1356 + (-0.5);
    bool _3586 = !_3574;
    int _3588 = _3586 ? _2482 : (-1);
    int _3590 = _3538 * as_type<int>(_3430);
    bool _3592 = !_3572;
    int _3594 = _3592 ? 0 : (-1);
    bool _3596 = uint(_3578) >= uint(_3184);
    int _3598 = int(_3442) + int(_3570);
    bool _3600 = !_3596;
    int _3602 = _3600 ? 0 : (-1);
    int _3604 = _2488 * as_type<int>(_3462);
    int _3606 = abs(_3562);
    int _3608 = _3582 * _3598;
    int _3610 = _3608 + _3376;
    int _3612 = ~_3606;
    int _3614 = _3612 + 1;
    int _3616 = _3614 + 1;
    bool _3618 = _2328 != 3;
    int _3620 = ~_3496;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    int _3626 = _3616 * as_type<int>(_3454);
    int _3628 = _3626 + _3604;
    int _3630 = ~_3564;
    int _3632 = _3630 + _3602;
    int _3634 = _3632 + 1;
    bool _3636 = !_3618;
    int _3638 = _3636 ? 0 : (-1);
    int _3640 = _3624 * as_type<int>(_3422);
    int _3642 = _3640 + _3590;
    bool _3644 = uint(_3610) >= uint(_3284);
    int _3646 = _3184 * _3634;
    int _3648 = _3646 + _3244;
    int _3650 = abs(_2138);
    bool _3652 = !_3644;
    int _3654 = _3652 ? 0 : (-1);
    bool _3656 = _3184 == 0;
    int _3658 = abs(_2410);
    bool _3660 = !_3656;
    int _3662 = _3660 ? _3648 : (-1);
    float _3664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3666 = _3184 == 0;
    int _3668 = ~_3658;
    int _3670 = _3668 + 1;
    int _3672 = _3670 + 1;
    int _3674 = _3244 ^ _3184;
    float _3676 = -_3288;
    float _3678 = _3676 + 1.0;
    int _3680 = abs(_3594);
    int _3682 = _3672 * as_type<int>(_3510);
    int _3684 = _3682 + _3628;
    uint _3686 = uint(int(uint(_3674) >> uint(31)));
    float _3688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3690 = ~_3650;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    int _3696 = abs(_3638);
    int _3698 = ~_3654;
    int _3700 = _3598 + _3698;
    int _3702 = _3700 + 1;
    int _3704 = _3694 * as_type<int>(_3548);
    int _3706 = _3704 + _3642;
    int _3708 = ~int(_3686);
    int _3710 = _3708 + 1;
    int _3712 = ~_3680;
    int _3714 = _3712 + 1;
    int _3716 = _3714 + 1;
    int _3718 = ~_3696;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3702 ^ _3710;
    int _3726 = _3716 * as_type<int>(_3556);
    int _3728 = _3726 + _3706;
    int _3730 = abs(_2318);
    int _3732 = _3722 * as_type<int>(_3518);
    int _3734 = _3732 + _3684;
    int _3736 = ~_2472;
    int _3738 = _3736 + 1;
    int _3740 = _3738 + 1;
    float _3742 = in.m_90.x;
    float _3744 = in.m_90.y;
    float _3746 = in.m_90.z;
    int _3748 = ~_3710;
    int _3750 = _3748 + _3724;
    int _3752 = _3750 + 1;
    float _3754 = _3688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3756 = ~_3730;
    int _3758 = _3756 + 1;
    int _3760 = _3758 + 1;
    int _3762 = _3728 * _3740;
    bool _3764 = !_3666;
    int _3766 = _3764 ? _3752 : (-1);
    float _3768 = _1334 + 0.5;
    float _3770 = float(_3662);
    int _3772 = _3734 * _3760;
    float _3774 = float(_3766);
    float _3776 = _3664 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3778 = _3588 * _2472;
    int _3780 = _3778 + _3762;
    float _3782 = fma(_3754, _3770, _3308);
    int _3784 = _2610 * _3730;
    int _3786 = _3784 + _3772;
    float _3788 = -_3310;
    float _3790 = fma(_3776, _3774, _3788);
    float _3792 = _3520 * (-2.0);
    float _3794 = fma(_3754, _3768, _3782);
    float _3796 = -_3776;
    float _3798 = fma(_3796, _3584, _3790);
    float _3800 = float(_3780);
    float _3802 = -_3398;
    float _3804 = fma(_1334, _3802, _3794);
    float _3806 = float(_3786);
    float _3808 = fma(_1356, _3678, _3798);
    float _3810 = fma(_2972, _3792, _2972);
    float _3812 = fma(_3792, _3742, _3742);
    bool _3814 = !_2720;
    int _3816 = _3814 ? 0 : 1;
    out.m_92.x = _3800;
    bool _3818 = !_2724;
    int _3820 = _3818 ? 0 : 1;
    int _3822 = abs(_3816);
    out.m_92.w = _3806;
    out.m_94.x = _3804;
    out.m_94.y = _3808;
    float _3824 = _3746;
    int _3826 = _3610;
    float _3828 = _3556;
    float _3830 = _3532;
    if (_3066)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3832 = -_3444;
    float _3834 = _2578 + _3832;
    float _3836 = float(_2622);
    float _3838 = -_3446;
    float _3840 = _2918 + _3838;
    float _3842 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3812);
    float _3844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3846 = _3834 + _3844;
    float _3848 = float(_3822);
    float _3850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3852 = _3840 + _3850;
    float _3854 = fma(_3810, _3320, _3842);
    float _3856 = _3846 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3858 = -_3474;
    float _3860 = _2920 + _3858;
    float _3862 = _3848 * _3836;
    float _3864 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3856);
    float _3866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3868 = _3860 + _3866;
    float _3870 = _2940 + (-1.0);
    int _3872 = abs(_3820);
    float _3874 = fma(_3532, _3532, _3494);
    float _3876 = fma(_3868, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3864);
    float _3878 = _3862 * (-2.0);
    float _3880 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3882 = float(_2690);
    float _3884 = _2994 + (-1.0);
    float _3886 = fma(_3878, _3744, _3744);
    float _3888 = float(_3872);
    float _3890 = fma(_3880, _3878, _3880);
    bool _3892 = _3876 >= 0.0;
    float _3894 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3886);
    float _3896 = _3888 * _3882;
    float _3898 = _3854 * 0.15915493667125701904296875;
    float _3900 = fma(_3890, _3320, _3894);
    float _3902 = sqrt(_3874);
    float _3904 = _3896 * (-2.0);
    float _3906 = fma(_3884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3908 = _3900 * 0.15915493667125701904296875;
    float _3910 = _1162 + (-0.5);
    float _3912 = fma(_3904, _3746, _3746);
    float _3914 = fma(_3906, _3904, _3906);
    float _3916 = _3840;
    if (_3892)
    {
        _3824 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3918 = _3824;
    float _3920 = _3898 * 6.283185482025146484375;
    float _3922 = sin(_3920);
    float _3924 = fma(_3910, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3912);
    int _3926 = as_type<int>(_3918);
    if (_3892)
    {
        out.m_63.x = 0.0;
    }
    if (_3892)
    {
        float _3928 = _3918 * 5.0;
        _3926 = as_type<int>(_3928);
    }
    int _3930 = _3926;
    float _3932 = fma(_3914, _3320, _3924);
    float _3934 = _3898 * 6.283185482025146484375;
    float _3936 = cos(_3934);
    if (_3892)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11332 = as_type<float>(_3930);
        out.gl_Position.z = _11332;
    }
    float _3938 = _3932 * 0.15915493667125701904296875;
    float _3940 = _3908 * 6.283185482025146484375;
    float _3942 = sin(_3940);
    float _3944 = _3908 * 6.283185482025146484375;
    float _3946 = cos(_3944);
    if (_3892)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3948 = _3938 * 6.283185482025146484375;
    float _3950 = cos(_3948);
    float _3952 = _3366 * _3902;
    float _3954 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3958 = _3922 * _3942;
    float _3960 = _3360 * _3952;
    float _3962 = _3952 * _3954;
    float _3964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3966 = _3938 * 6.283185482025146484375;
    float _3968 = sin(_3966);
    float _3970 = _3936 * _3942;
    float _3972 = _3956 * _3962;
    float _3974 = _3936 * _3946;
    float _3976 = _3922 * _3946;
    float _3978 = _3964 * _3960;
    float _3980 = _3936 * _3950;
    float _3982 = _3946 * _3950;
    float _3984 = _3922 * _3950;
    float _3986 = _3942 * _3950;
    float _3988 = _3980 * _3972;
    float _3990 = _3952 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3992 = _3990 * 0.5;
    float _3994 = fma(_3968, _3974, _3958);
    float _3996 = -_3976;
    float _3998 = fma(_3968, _3970, _3996);
    float _4000 = -_3972;
    float _4002 = _3968 * _4000;
    float _4004 = -_3970;
    float _4006 = fma(_3968, _3976, _4004);
    float _4008 = fma(_3994, _3978, _3988);
    float _4010 = _3984 * _3972;
    float _4012 = fma(_3982, _3978, _4002);
    float _4014 = fma(_3968, _3958, _3974);
    float _4016 = fma(_3998, _3992, _4008);
    float _4018 = fma(_4006, _3978, _4010);
    float _4020 = fma(_3986, _3992, _4012);
    float _4022 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4024 = fma(_4014, _3992, _4018);
    float _4026 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4028 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4030 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4022);
    float _4032 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4026);
    float _4034 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4028);
    float _4036 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4030);
    float _4038 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4032);
    float _4040 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4034);
    float _4042 = _4036 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4044 = _4038 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4046 = _4040 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4048 = _2920 + _4042;
    float _4050 = _2918 + _4044;
    float _4052 = _2578 + _4046;
    float _4054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4056 = _4048 + _4054;
    float _4058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4060 = _4050 + _4058;
    float _4062 = _4056 * _4056;
    float _4064 = fma(_4060, _4060, _4062);
    float _4066 = sqrt(_4064);
    bool _4068 = _4066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4070 = _4040;
    float _4072 = _4062;
    float _4074 = _4046;
    if (!_4068)
    {
        _4070 = _4050;
    }
    float _4076 = _4070;
    float _4078 = _4076;
    if (!_4068)
    {
        _4072 = _4048;
    }
    float _4080 = _4072;
    float _4082 = _4080;
    if (!_4068)
    {
        _4074 = _4052;
    }
    float _4084 = _4074;
    bool _4086 = !_4068;
    float _4088 = _4084;
    if (!_4086)
    {
        float _4090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4094 = _4066 + _4092;
        float _4096 = rsqrt(_4064);
        float _4098 = _4094 * _4090;
        float _4100 = _4052 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4102 = _4098 * 0.15915493667125701904296875;
        float _4104 = _4102 * 6.283185482025146484375;
        float _4106 = cos(_4104);
        float _4108 = _4102 * 6.283185482025146484375;
        float _4110 = sin(_4108);
        float _4112 = _4106 + (-1.0);
        float _4114 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4116 = fma(_4110, _4100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4118 = fma(_4052, _4106, _4114);
        float _4120 = _4096 * _4116;
        float _4122 = fma(_4060, _4120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4124 = fma(_4056, _4120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4088 = _4118;
        _4078 = _4122;
        _4082 = _4124;
    }
    float _4126 = _4088;
    float _4128 = _4078;
    float _4130 = _4082;
    float _4132 = -_2578;
    float _4134 = _4132 + _4126;
    float _4136 = -_2918;
    float _4138 = _4136 + _4128;
    float _4140 = -_2920;
    float _4142 = _4140 + _4130;
    float _4144 = _4134 * _4134;
    float _4146 = fma(_4138, _4138, _4144);
    float _4148 = fma(_4142, _4142, _4146);
    float _4150 = sqrt(_4148);
    bool _4152 = _4150 > 0.0;
    bool _4154 = !_4152;
    float _4156 = _4126;
    float _4158 = _4128;
    float _4160 = _4130;
    if (!_4154)
    {
        float _4162 = _245 * _245;
        float _4164 = rsqrt(_4148);
        float _4166 = fma(_237, _237, _4162);
        float _4168 = fma(_247, _247, _4166);
        float _4170 = sqrt(_4168);
        float _4172 = _4138 * _4164;
        float _4174 = _4134 * _4164;
        float _4176 = _4142 * _4164;
        bool _4178 = _4170 > 0.0;
        bool _4180 = !_4178;
        _2976 = _4172;
        if (!_4180)
        {
            float _4182 = rsqrt(_4168);
            float _4184 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4186 = _245 * _4182;
            float _4188 = _237 * _4182;
            float _4190 = _4174 * _4186;
            float _4192 = _247 * _4182;
            float _4194 = fma(_4172, _4188, _4190);
            float _4196 = _4184 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4198 = fma(_4176, _4192, _4194);
            float _4200 = _4198 * _4196;
            float _4202 = fma(_237, _4200, _4128);
            float _4204 = fma(_245, _4200, _4126);
            float _4206 = fma(_247, _4200, _4130);
            _4156 = _4204;
            _4158 = _4202;
            _4160 = _4206;
        }
    }
    float _4208 = _4156;
    float _4210 = _4158;
    float _4212 = _4160;
    float _4214 = _2976;
    float _4216 = -_3444;
    float _4218 = _4216 + _4208;
    float _4220 = -_3446;
    float _4222 = _4220 + _4210;
    float _4224 = -_3474;
    float _4226 = _4224 + _4212;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4230 = _4218 + _4228;
    float _4232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4234 = _4222 + _4232;
    float _4236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4238 = _4226 + _4236;
    float _4240 = _4230 * _4230;
    float _4242 = fma(_4234, _4234, _4240);
    float _4244 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4246 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4248 = fma(_4238, _4238, _4242);
    float _4250 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4244);
    float _4252 = rsqrt(_4248);
    float _4254 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4250);
    float _4256 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4258 = _4254 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4260 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4256);
    float _4262 = sqrt(_4248);
    float _4264 = 1.0 / _4258;
    float _4266 = _4252 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4268 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4260);
    float _4270 = _4234 * _4266;
    float _4272 = _4238 * _4266;
    float _4274 = _4268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4276 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4278 = _4270 * _4270;
    float _4280 = _4272 * _4272;
    float _4282 = _4274 + _4258;
    float _4284 = _3834 + _4276;
    float _4286 = _4278 + _4280;
    float _4288 = _4282 * _4264;
    float _4290 = _4288 * 0.5;
    float _4292 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4294 = sqrt(_4286);
    float _4296 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4300 = fma(_4290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4298);
    float _4302 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4292);
    float _4304 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4296);
    float _4306 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4302);
    float _4308 = 1.0 / _4300;
    float _4310 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4304);
    float _4312 = _4306 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4314 = _4310 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4316 = _4294 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4318 = trunc(_4312);
    int _4320 = int(_4318);
    float _4322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4324 = _4294 + _4322;
    float _4326 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4328 = _4308 * _4326;
    float _4330 = trunc(_4314);
    int _4332 = int(_4330);
    bool _4334 = _4328 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4336 = _4328 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4338 = _4214;
    float _4340 = _4286;
    int _4342 = 2;
    float _4344 = _4278;
    float _4346 = _4280;
    if (_4316)
    {
        float _4348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4338 = _4348;
    }
    float _4350 = _4338;
    int _4352 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4354 = _4320 + _4352;
    int _4356 = _4354 + 1;
    bool _4358 = !_4334;
    int _4360 = _4358 ? 0 : 1;
    bool _4362 = _4356 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4364 = _4356;
    if (_4316)
    {
        float _4366 = rsqrt(_4286);
        _4340 = _4366;
    }
    float _4368 = _4340;
    int _4370 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4372 = _4332 + _4370;
    int _4374 = _4372 + 1;
    int _4376 = as_type<int>(_4368);
    if (!_4334)
    {
        _4342 = 1;
    }
    int _4378 = _4342;
    float _4380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4382 = _4356 | _4374;
    int _4384 = _4378;
    float _4386 = as_type<float>(_4382);
    if (!_4336)
    {
        _4384 = _4360;
    }
    int _4388 = _4384;
    bool _4390 = _4382 < 0;
    bool _4392 = _4390 || _4362;
    if (_4316)
    {
        float _4394 = _4324 * _4350;
        _4386 = _4394;
    }
    float _4396 = _4386;
    bool _4398 = _4374 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4400 = _4398 || _4392;
    if (_4316)
    {
        float _4402 = _4396 * 0.15915493667125701904296875;
        _2490 = _4402;
    }
    float _4404 = _2490;
    int _4406 = _4388 << 6;
    float _4408 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4410 = precise::max(0.0, _4380);
    int _4412 = as_type<int>(_4060);
    if (_4316)
    {
        float _4414 = _4404 * 6.283185482025146484375;
        float _4416 = sin(_4414);
        _4412 = as_type<int>(_4416);
    }
    int _4418 = _4412;
    int _4420 = _4406 + 96;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[int(_4432)][_4434];
    if (!_4316)
    {
        _3522 = _4270;
    }
    float _4438 = _3522;
    float _4440 = -_4266;
    float _4442 = -_4410;
    float _4444 = fma(_4230, _4440, _4442);
    float _4446 = _4438;
    if (!_4400)
    {
        int _4448 = _4374 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4450 = _4448 + _4356;
        _4364 = _4450;
    }
    int _4452 = _4364;
    int _4454 = _4406 + 48;
    uint _4456 = uint(int(uint(_4454) >> uint(2)));
    uint _4458 = uint(int(uint(int(_4456)) >> uint(2)));
    int _4460 = int(_4456) & 3;
    float _4462 = (*spvDescriptorSet0.vp_c15)._m0[int(_4458)][_4460];
    int _4464 = int(_4456) + 1;
    uint _4466 = uint(int(uint(_4464) >> uint(2)));
    int _4468 = _4464 & 3;
    float _4470 = (*spvDescriptorSet0.vp_c15)._m0[int(_4466)][_4468];
    float _4472 = _2972;
    if (_4316)
    {
        float _4474 = _4404 * 6.283185482025146484375;
        float _4476 = cos(_4474);
        _4472 = _4476;
    }
    float _4478 = _4472;
    if (_4316)
    {
        float _4480 = _4444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3524 = _4480;
    }
    float _4482 = _3524;
    float _4484 = _4482;
    if (!_4400)
    {
        int _4486 = _4452 << 2;
        _3826 = _4486;
    }
    int _4488 = _3826;
    int _4490 = _4418;
    int _4492 = _4488;
    if (_4316)
    {
        float _4494 = fma(as_type<float>(_4418), _4482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3526 = _4494;
    }
    float _4496 = _3526;
    int _4498 = _4406 + 64;
    uint _4500 = uint(int(uint(_4498) >> uint(2)));
    uint _4502 = uint(int(uint(int(_4500)) >> uint(2)));
    int _4504 = int(_4500) & 3;
    float _4506 = (*spvDescriptorSet0.vp_c15)._m0[int(_4502)][_4504];
    int _4508 = int(_4500) + 1;
    uint _4510 = uint(int(uint(_4508) >> uint(2)));
    int _4512 = _4508 & 3;
    float _4514 = (*spvDescriptorSet0.vp_c15)._m0[int(_4510)][_4512];
    float _4516 = _4496;
    if (!_4316)
    {
        _4484 = _4444;
    }
    float _4518 = _4484;
    float _4520 = floor(_4408);
    float _4522 = _4518;
    if (_4316)
    {
        float _4524 = _4368 * _4496;
        _4516 = _4524;
    }
    float _4526 = _4516;
    if (!_4400)
    {
        uint _4528 = uint(int(uint(_4452) >> uint(2)));
        _4490 = int(_4528);
    }
    int _4530 = _4490;
    float _4532 = as_type<float>(_4530);
    if (!_4400)
    {
        int _4534 = 12 & _4488;
        _4492 = _4534;
    }
    int _4536 = _4492;
    if (_4316)
    {
        float _4538 = _4270 * _4526;
        _4446 = _4538;
    }
    float _4540 = _4446;
    int _4542 = _4406 + 104;
    uint _4544 = uint(int(uint(_4542) >> uint(2)));
    uint _4546 = uint(int(uint(int(_4544)) >> uint(2)));
    int _4548 = int(_4544) & 3;
    float _4550 = (*spvDescriptorSet0.vp_c15)._m0[int(_4546)][_4548];
    int _4552 = int(_4544) + 1;
    uint _4554 = uint(int(uint(_4552) >> uint(2)));
    int _4556 = _4552 & 3;
    float _4558 = (*spvDescriptorSet0.vp_c15)._m0[int(_4554)][_4556];
    if (_4316)
    {
        float _4560 = _4478 + (-1.0);
        _3828 = _4560;
    }
    float _4562 = _3828;
    float _4564 = _4562;
    if (!_4400)
    {
        int _4566 = _4530 << 4;
        int _4568 = _4566 + _4536;
        _4376 = _4568;
    }
    int _4570 = _4376;
    if (_4316)
    {
        float _4572 = _4540 * _4540;
        _4344 = _4572;
    }
    float _4574 = _4344;
    float _4576 = floor(_4246);
    if (_4316)
    {
        float _4578 = _4562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3830 = _4578;
    }
    float _4580 = _3830;
    if (!_4316)
    {
        _4564 = _4272;
    }
    float _4582 = _4564;
    float _4584 = _4582;
    if (_4316)
    {
        float _4586 = _4272 * _4526;
        _4584 = _4586;
    }
    float _4588 = _4584;
    int _4590 = _4406 + 56;
    uint _4592 = uint(int(uint(_4590) >> uint(2)));
    uint _4594 = uint(int(uint(int(_4592)) >> uint(2)));
    int _4596 = int(_4592) & 3;
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[int(_4594)][_4596];
    int _4600 = int(_4592) + 1;
    uint _4602 = uint(int(uint(_4600) >> uint(2)));
    int _4604 = _4600 & 3;
    float _4606 = (*spvDescriptorSet0.vp_c15)._m0[int(_4602)][_4604];
    if (_4316)
    {
        float _4608 = fma(_4444, _4478, _4580);
        _4522 = _4608;
    }
    float _4610 = _4522;
    if (_4316)
    {
        float _4612 = _4588 * _4588;
        _4346 = _4612;
    }
    float _4614 = _4346;
    float _4616 = -_4520;
    float _4618 = _4408 + _4616;
    float _4620 = fma(_4610, _4610, _4574);
    if (!_4400)
    {
        float _4622 = floor(_4312);
        _4532 = _4622;
    }
    float _4624 = _4532;
    int _4626 = _4406 + 72;
    uint _4628 = uint(int(uint(_4626) >> uint(2)));
    uint _4630 = uint(int(uint(int(_4628)) >> uint(2)));
    int _4632 = int(_4628) & 3;
    float _4634 = (*spvDescriptorSet0.vp_c15)._m0[int(_4630)][_4632];
    int _4636 = int(_4628) + 1;
    uint _4638 = uint(int(uint(_4636) >> uint(2)));
    int _4640 = _4636 & 3;
    float _4642 = (*spvDescriptorSet0.vp_c15)._m0[int(_4638)][_4640];
    float _4644 = _4620 + _4614;
    float _4646 = rsqrt(_4644);
    float _4648 = _4284 * _4436;
    int _4650 = _4406 + 80;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    float _4668 = fma(_3840, _4428, _4648);
    float _4670 = _4284 * _4470;
    float _4672 = _4478;
    float _4674 = _4670;
    if (!_4400)
    {
        int _4676 = _4570 + 400;
        uint _4678 = uint(int(uint(_4676) >> uint(2)));
        uint _4680 = uint(int(uint(int(_4678)) >> uint(2)));
        int _4682 = int(_4678) & 3;
        float _4684 = (*spvDescriptorSet0.vp_c15)._m0[int(_4680)][_4682];
        _4672 = _4684;
    }
    float _4686 = _4672;
    float _4688 = _4646 * _4540;
    float _4690 = _4284 * _4514;
    float _4692 = fma(_3840, _4462, _4670);
    float _4694 = _4646 * _4610;
    float _4696 = _4646 * _4588;
    float _4698 = fma(_3840, _4506, _4690);
    float _4700 = _4688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_4400)
    {
        float _4702 = floor(_4314);
        _4674 = _4702;
    }
    float _4704 = _4674;
    float _4706 = fma(_3860, _4550, _4668);
    float _4708 = -_4700;
    float _4710 = fma(_4694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4708);
    float _4712 = fma(_3860, _4598, _4692);
    float _4714 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4716 = _4706 + _4558;
    float _4718 = _4712 + _4606;
    float _4720 = fma(_3860, _4634, _4698);
    float _4722 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4714);
    float _4724 = 1.0 / _4716;
    int _4726 = _4406 + 88;
    uint _4728 = uint(int(uint(_4726) >> uint(2)));
    uint _4730 = uint(int(uint(int(_4728)) >> uint(2)));
    int _4732 = int(_4728) & 3;
    float _4734 = (*spvDescriptorSet0.vp_c15)._m0[int(_4730)][_4732];
    int _4736 = int(_4728) + 1;
    uint _4738 = uint(int(uint(_4736) >> uint(2)));
    int _4740 = _4736 & 3;
    float _4742 = (*spvDescriptorSet0.vp_c15)._m0[int(_4738)][_4740];
    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4746 = fma(_4262, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4744);
    float _4748 = precise::clamp(_4746, 0.0, 1.0);
    float _4750 = _4720 + _4642;
    float _4752 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4754 = -_4696;
    float _4756 = fma(_4754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4710);
    float _4758 = -_4748;
    float _4760 = _4758 + 1.0;
    float _4762 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4722);
    float _4764 = _4284 * _4666;
    float _4766 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4768 = abs(_4760);
    float _4770 = log2(_4768);
    float _4772 = _4762 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4774 = fma(_3840, _4658, _4764);
    float _4776 = fma(_4756, 0.5, 0.5);
    float _4778 = _4772 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4780 = _4718 * _4724;
    float _4782 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4784 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4752);
    float _4786 = _4750 * _4724;
    bool _4788 = _4780 >= 0.0;
    float _4790 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4782);
    float _4792 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4784);
    float _4794 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _4796 = _4780 <= 1.0;
    bool _4798 = _4796 && _4788;
    float _4800 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4790);
    float _4802 = _4792 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4804 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4794);
    bool _4806 = _4786 >= 0.0;
    bool _4808 = _4806 && _4798;
    float _4810 = _4800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4812 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4814 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4804);
    bool _4816 = _4786 <= 1.0;
    bool _4818 = _4816 && _4808;
    float _4820 = -_4778;
    float _4822 = fma(_4820, _4766, 1.0);
    float _4824 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4812);
    float _4826 = fma(_4756, -0.5, 0.5);
    float _4828 = _4814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4830 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4832 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4824);
    float _4834 = sqrt(_4826);
    float _4836 = fma(_4776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4838 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4832);
    float _4840 = _4804;
    float _4842 = _4778;
    float _4844 = _4830;
    float _4846 = _4838;
    if (_4818)
    {
        float _4848 = float(_4388);
        _4840 = _4848;
    }
    float _4850 = _4840;
    if (!_4400)
    {
        float _4852 = rint(_4686);
        float _4854 = precise::max(_4852, 0.0);
        uint _4856 = uint(_4854);
        uint _4858 = clamp(_4856, 0u, 65535u);
        _4842 = as_type<float>(_4858);
    }
    float _4860 = _4842;
    float _4862 = fma(_3860, _4734, _4774);
    float _4864 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4866 = _4862 + _4742;
    float _4868 = fma(_4776, _4836, -0.212114393711090087890625);
    float _4870 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4872 = exp2(_4830);
    float _4874 = -_4576;
    float _4876 = _4246 + _4874;
    float _4878 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4864);
    float _4880 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4870);
    float _4882 = _4834 * 0.636619746685028076171875;
    float _4884 = _4866 * _4724;
    float _4886 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4878);
    float _4888 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4880);
    float _4890 = log2(_4822);
    float _4892 = _4888;
    if (!_4400)
    {
        float _4894 = -_4704;
        float _4896 = _4314 + _4894;
        _4844 = _4896;
    }
    float _4898 = _4844;
    float _4900 = fma(_4776, _4868, 1.570728778839111328125);
    float _4902 = _4694 + 1.0;
    float _4904 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4886);
    float _4906 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4888);
    float _4908 = -_4900;
    float _4910 = fma(_4882, _4908, 1.0);
    if (!_4400)
    {
        float _4912 = -_4624;
        float _4914 = _4312 + _4912;
        _4892 = _4914;
    }
    float _4916 = _4892;
    float _4918 = 1.0 / _4838;
    float _4920 = -_4694;
    float _4922 = fma(_4872, _4902, _4920);
    float _4924 = _4850;
    if (_4818)
    {
        float _4926 = rint(_4850);
        float _4928 = precise::max(_4926, 0.0);
        uint _4930 = uint(_4928);
        uint _4932 = clamp(_4930, 0u, 65535u);
        _4924 = as_type<float>(_4932);
    }
    float _4934 = _4924;
    float _4936 = _4890 * 0.693147182464599609375;
    float _4938 = fma(_4922, 0.5, 0.5);
    float2 _12991 = float2(_4618, _4876);
    float _4940 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12991, float2(0.0), isnan(_12991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12991, float2(0.0), isnan(_12991)), level(0.0)).x;
    float _4942 = as_type<float>(_4388);
    if (!_4400)
    {
        float3 _13009 = float3(_4916, _4898, float(as_type<int>(_4860)));
        float3 _13013 = select(_13009, float3(0.0), isnan(_13009));
        float _4944 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13013.xy, uint(rint(_13013.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13013.xy, uint(rint(_13013.z)), level(0.0)).x;
        _4942 = _4944;
    }
    float _4946 = _4942;
    float _4948 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4950 = _4904 * _4918;
    float _4952 = _4906 * _4918;
    float _4954 = fma(_4950, 0.5, 0.5);
    float _4956 = fma(_4952, -0.5, 0.5);
    float _4958 = _4934;
    if (_4818)
    {
        float3 _13042 = float3(_4780, _4786, float(as_type<int>(_4934)));
        float3 _13044 = select(_13042, float3(0.0), isnan(_13042));
        float _4960 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13044.xy, uint(rint(_13044.z)), _4884, level(0.0));
        _4958 = _4960;
    }
    float _4962 = _4958;
    float3 _13054 = float3(_4954, _4956, _4948);
    float _4964 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13054, float3(0.0), isnan(_13054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13054, float3(0.0), isnan(_13054)), level(0.0)).x;
    float3 _13063 = float3(_4954, _4956, _4948);
    float4 _4967 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13063, float3(0.0), isnan(_13063)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13063, float3(0.0), isnan(_13063)), level(0.0)).xyzw;
    float _4969 = _4967.x;
    float _4971 = _4967.y;
    float _4973 = _4967.z;
    float _4975 = _4967.w;
    float2 _13079 = float2(_4910, _4938);
    float3 _4979 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13079, float2(0.0), isnan(_13079)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13079, float2(0.0), isnan(_13079)), level(0.0)).xyz;
    float _4981 = _4979.x;
    float _4983 = _4979.y;
    float _4985 = _4979.z;
    float _4987 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4989 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4991 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4993 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4995 = fma(_4987, _4987, 1.0);
    float _4997 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4999 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4989);
    float _5001 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5003 = rsqrt(_4995);
    float _5005 = -_3968;
    float _5007 = fma(_5005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4993);
    float _5009 = -_3968;
    float _5011 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4997);
    float _5013 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5015 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4991);
    float _5017 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4999);
    float _5019 = -_3968;
    float _5021 = fma(_5019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5001);
    float _5023 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5013);
    float _5025 = abs(_4328);
    float _5027 = log2(_5025);
    float _5029 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5015);
    float _5031 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5033 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5023);
    float _5035 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5007);
    float _5037 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5011);
    float _5039 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5021);
    float _5041 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5031);
    float _5043 = _4987 * _5003;
    float _5045 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5047 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5041);
    float _5049 = -_5017;
    float _5051 = _5043 * _5049;
    float _5053 = -_5029;
    float _5055 = _5043 * _5053;
    float _5057 = -_5033;
    float _5059 = _5043 * _5057;
    float _5061 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5045);
    float _5063 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = fma(_5003, _5035, _5051);
    float _5067 = fma(_5003, _5037, _5055);
    float _5069 = fma(_5003, _5039, _5059);
    float _5071 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5073 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5075 = exp2(_5063);
    float _5077 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5079 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5071);
    float _5081 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5073);
    float _5083 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5047);
    float _5085 = _4838 * 0.5;
    out.m_96.x = _5065;
    out.m_96.y = _5067;
    out.m_96.z = _5069;
    bool _5087 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5089 = isnan(0.5);
    bool _5091 = _5087 || _5089;
    bool _5093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5095 = _5091 || _5093;
    float _5097 = fma(_4906, -0.5, _5085);
    float _5099 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5079);
    float _5101 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5081);
    float _5103 = exp2(_5077);
    float _5105 = _5083 + _4838;
    float _5107 = _4904 + _4838;
    out.gl_Position.x = _4904;
    out.gl_Position.y = _4906;
    out.gl_Position.z = _5083;
    out.gl_Position.w = _4838;
    float _5109 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5111 = precise::clamp(_5109, 0.0, 1.0);
    float _5113 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5061);
    float _5115 = _5105 * 0.5;
    float _5117 = fma(_5111, -2.0, 3.0);
    float _5119 = _5111 * _5111;
    out.m_98.x = _5099;
    out.m_98.y = _5101;
    out.m_98.z = _5113;
    float _5121 = _5107 * 0.5;
    float _5123 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5125 = _5119 * _5117;
    float _5127 = _4987 * _5035;
    float _5129 = _4987 * _5037;
    out.m_100.x = _5121;
    out.m_100.y = _5097;
    out.m_100.z = _5115;
    out.m_100.w = _4838;
    float _5131 = -_5125;
    float _5133 = _5131 + 1.0;
    bool _5135 = _4328 <= 8000.0;
    bool _5137 = isnan(_4328);
    bool _5139 = _5135 || _5137;
    bool _5141 = isnan(8000.0);
    bool _5143 = _5139 || _5141;
    float _5145 = float(_5143);
    float _5147 = _4987 * _5039;
    float _5149 = fma(_5123, _5101, _5129);
    float _5151 = fma(_5133, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5125);
    float _5153 = fma(_5123, _5099, _5127);
    float _5155 = fma(_5123, _5113, _5147);
    float _5157 = _5151;
    float _5159 = _5065;
    if (_5095)
    {
        _4846 = 1.0;
    }
    float _5161 = _4846;
    float _5163 = _5145 * _5151;
    float _5165 = _5161;
    float _5167 = _5163;
    if (!_5095)
    {
        float _5169 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5171 = _5169 * 0.15915493667125701904296875;
        float _5173 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5175 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5177 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5175;
        float _5179 = _5171 * 6.283185482025146484375;
        float _5181 = cos(_5179);
        float _5183 = _5173 * 0.15915493667125701904296875;
        float _5185 = _5171 * 6.283185482025146484375;
        float _5187 = sin(_5185);
        float _5189 = 1.0 / _5181;
        float _5191 = _5183 * 6.283185482025146484375;
        float _5193 = cos(_5191);
        float _5195 = _5187 * _5189;
        float _5197 = _5183 * 6.283185482025146484375;
        float _5199 = sin(_5197);
        float _5201 = _5193 * _5195;
        float _5203 = 1.0 / _5177;
        float _5205 = 1.0 / _5201;
        float _5207 = _5199 * _5205;
        float _5209 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5211 = fma(_4328, _5207, _5209);
        float _5213 = _5211 * _5203;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        _5157 = _5203;
        _5159 = _5189;
        _5165 = _5215;
    }
    float _5217 = _5157;
    float _5219 = _5159;
    float _5221 = _5165;
    float _5223 = _5163 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5225 = -_4940;
    float _5227 = _5225 + 1.0;
    float _5229 = -_5103;
    float _5231 = _5229 + 1.0;
    float _5233 = _5217;
    float _5235 = _5219;
    float _5237 = _5223;
    if (!_4818)
    {
        _5233 = 1.0;
    }
    float _5239 = _5233;
    float _5241 = _5017 + _5153;
    float _5243 = _5029 + _5149;
    float _5245 = _5033 + _5155;
    float _5247 = _5239;
    if (_4818)
    {
        bool _5249 = _4962 >= _4884;
        bool _5251 = isnan(_4962);
        bool _5253 = _5249 || _5251;
        bool _5255 = isnan(_4884);
        bool _5257 = _5253 || _5255;
        float _5259 = float(_5257);
        _5247 = _5259;
    }
    float _5261 = _5247;
    float _5263 = _5227 * _5223;
    float _5265 = precise::clamp(_5263, 0.0, 1.0);
    float _5267 = _5231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_4400)
    {
        _5235 = 1.0;
    }
    float _5269 = _5235;
    float _5271 = _5269;
    if (!_4400)
    {
        int _5273 = _4452 << 4;
        int _5275 = _5273 + 2048;
        uint _5277 = uint(int(uint(_5275) >> uint(2)));
        uint _5279 = uint(int(uint(int(_5277)) >> uint(2)));
        int _5281 = int(_5277) & 3;
        float _5283 = (*spvDescriptorSet0.vp_c15)._m0[int(_5279)][_5281];
        int _5285 = int(_5277) + 1;
        uint _5287 = uint(int(uint(_5285) >> uint(2)));
        int _5289 = _5285 & 3;
        float _5291 = (*spvDescriptorSet0.vp_c15)._m0[int(_5287)][_5289];
        int _5293 = _5275 + 8;
        uint _5295 = uint(int(uint(_5293) >> uint(2)));
        uint _5297 = uint(int(uint(int(_5295)) >> uint(2)));
        int _5299 = int(_5295) & 3;
        float _5301 = (*spvDescriptorSet0.vp_c15)._m0[int(_5297)][_5299];
        int _5303 = int(_5295) + 1;
        uint _5305 = uint(int(uint(_5303) >> uint(2)));
        int _5307 = _5303 & 3;
        float _5309 = (*spvDescriptorSet0.vp_c15)._m0[int(_5305)][_5307];
        float _5311 = _4284 * _5291;
        float _5313 = fma(_3840, _5283, _5311);
        float _5315 = fma(_3860, _5301, _5313);
        float _5317 = _5315 + _5309;
        float _5319 = precise::clamp(_5317, 0.0, 1.0);
        float _5321 = -_5319;
        float _5323 = _5321 + _4946;
        float _5325 = fma(_5323, 500.0, 1.5);
        float _5327 = exp2(_5325);
        float _5329 = 0.0 + _5327;
        float _5331 = precise::clamp(_5329, 0.0, 1.0);
        _5271 = _5331;
        _5167 = _5283;
        _5237 = _5291;
        _3916 = 500.0;
    }
    float _5333 = _5271;
    float _5335 = _5167;
    float _5337 = _5237;
    float _5339 = _3916;
    float _5341 = _5261 * _5333;
    float _5343 = _5267 * _4964;
    float _5345 = -_5265;
    float _5347 = fma(_5345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5349 = -_5267;
    float _5351 = _5349 + 1.0;
    out.m_102.x = _5241;
    out.m_102.y = _5243;
    out.m_102.z = _5245;
    float _5353 = _4975 * _5343;
    float _5355 = -_5341;
    float _5357 = fma(_5355, _5347, 1.0);
    float _5359 = precise::clamp(_5357, 0.0, 1.0);
    float _5361 = _4985 * _5343;
    float _5363 = _4975 * _5351;
    float _5365 = fma(_4981, _5353, _4969);
    float _5367 = fma(_4983, _5353, _4971);
    float _5369 = _5359 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5371 = fma(_4975, _5361, _4973);
    bool _5373 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5375 = isnan(_4262);
    bool _5377 = _5373 || _5375;
    bool _5379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5381 = _5377 || _5379;
    float _5383 = _5221 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _5369;
    out.m_106.x = _5365;
    out.m_106.y = _5367;
    out.m_106.z = _5371;
    out.m_106.w = _5363;
    float _5385 = _5337;
    float _5387 = _5335;
    float _5389 = _5339;
    float _5391 = _5351;
    float _5393 = _5353;
    float _5395 = _5359;
    if (!_5381)
    {
        _5385 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5397 = _5385;
    float _5399 = _5397;
    float _5401 = _5397;
    if (!_5381)
    {
        _5387 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5403 = _5387;
    float _5405 = _5403;
    float _5407 = _5403;
    if (!_5381)
    {
        _5389 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5409 = _5389;
    float _5411 = _5409;
    float _5413 = _5409;
    if (!_5381)
    {
        _5391 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5415 = _5391;
    float _5417 = _5415;
    float _5419 = _5415;
    if (!_5381)
    {
        _5393 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5421 = _5393;
    float _5423 = _5421;
    float _5425 = _5421;
    if (!_5381)
    {
        _5395 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5427 = _5395;
    bool _5429 = !_5381;
    float _5431 = _5427;
    float _5433 = _5427;
    if (!_5429)
    {
        bool _5435 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5437 = isnan(_4262);
        bool _5439 = _5435 || _5437;
        bool _5441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5443 = _5439 || _5441;
        if (!_5443)
        {
            float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5447 = _4262 + _5445;
            float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5451 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5449;
            float _5453 = 1.0 / _5451;
            float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5457 = _5455 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5463 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5465 = _5463 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5467 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5469 = _5467 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5471 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5473 = _5471 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5475 = _5447 * _5453;
            float _5477 = precise::clamp(_5475, 0.0, 1.0);
            float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5481 = _5479 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5483 = fma(_5477, _5457, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5485 = fma(_5477, _5481, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5487 = fma(_5477, _5461, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5489 = fma(_5477, _5465, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5491 = fma(_5477, _5469, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5493 = fma(_5477, _5473, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5407 = _5485;
            _5425 = _5491;
            _5401 = _5483;
            _5419 = _5489;
            _5413 = _5487;
            _5433 = _5493;
            _5495 = true;
        }
        else
        {
            bool _5497 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5499 = isnan(_4262);
            bool _5501 = _5497 || _5499;
            bool _5503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5505 = _5501 || _5503;
            if (!_5505)
            {
                _5399 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5507 = _5399;
            _5401 = _5507;
            if (!_5505)
            {
                _5405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5509 = _5405;
            _5407 = _5509;
            if (!_5505)
            {
                _5411 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5511 = _5411;
            _5413 = _5511;
            if (!_5505)
            {
                _5417 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5513 = _5417;
            _5419 = _5513;
            if (!_5505)
            {
                _5423 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5515 = _5423;
            _5425 = _5515;
            if (!_5505)
            {
                _5431 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5517 = _5431;
            bool _5519 = !_5505;
            _5433 = _5517;
            if (!_5519)
            {
                bool _5521 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5523 = isnan(_4262);
                bool _5525 = _5521 || _5523;
                bool _5527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5529 = _5525 || _5527;
                if (!_5529)
                {
                    float _5531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5533 = _4262 + _5531;
                    float _5535 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5537 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5535;
                    float _5539 = 1.0 / _5537;
                    float _5541 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5543 = _5541 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5545 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5547 = _5545 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5549 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5551 = _5549 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5553 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5555 = _5553 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5557 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5559 = _5557 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5561 = _5533 * _5539;
                    float _5563 = precise::clamp(_5561, 0.0, 1.0);
                    float _5565 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5567 = _5565 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5569 = fma(_5563, _5543, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5571 = fma(_5563, _5567, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5573 = fma(_5563, _5547, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5575 = fma(_5563, _5551, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5577 = fma(_5563, _5555, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5579 = fma(_5563, _5559, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5407 = _5571;
                    _5425 = _5577;
                    _5401 = _5569;
                    _5419 = _5575;
                    _5413 = _5573;
                    _5433 = _5579;
                    _5495 = true;
                }
                else
                {
                    _5407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5425 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5401 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5419 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5413 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5433 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5495 = false;
    float _5581 = _5407;
    float _5583 = _5425;
    float _5585 = _5401;
    float _5587 = _5419;
    float _5589 = _5413;
    float _5591 = _5433;
    float _5593 = fma(_5243, -0.5, 0.5);
    float _5595 = precise::clamp(_5593, 0.0, 1.0);
    float _5597 = -_5581;
    float _5599 = _5597 + _5583;
    float _5601 = -_5585;
    float _5603 = _5601 + _5587;
    out.m_108.x = 0.0;
    float _5605 = fma(_5595, _5599, _5581);
    float _5607 = -_5589;
    float _5609 = _5607 + _5591;
    float _5611 = fma(_5595, _5603, _5585);
    float _5613 = _5605 * 0.586610972881317138671875;
    bool _5615 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5617 = fma(_5595, _5609, _5589);
    float _5619 = _5383 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5621 = fma(_5611, 0.298911988735198974609375, _5613);
    bool _5623 = _5221 > 0.0;
    bool _5625 = isnan(_5221);
    bool _5627 = _5623 || _5625;
    bool _5629 = isnan(0.0);
    bool _5631 = _5627 || _5629;
    float _5633 = fma(_5617, 0.114477999508380889892578125, _5621);
    out.m_63.x = _5619;
    float _5635 = -_5633;
    float _5637 = _5611 + _5635;
    float _5639 = -_5633;
    float _5641 = _5605 + _5639;
    float _5643 = -_5633;
    float _5645 = _5617 + _5643;
    float _5647 = fma(_5637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    float _5649 = fma(_5641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    float _5651 = fma(_5645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    bool _5653 = !_5615;
    if (!_5653)
    {
        float _5655 = -_4218;
        float _5657 = _5655 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5659 = -_4222;
        float _5661 = _5659 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5663 = -_4226;
        float _5665 = _5663 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5667 = _5657 * _5657;
        float _5669 = fma(_5661, _5661, _5667);
        float _5671 = fma(_5665, _5665, _5669);
        float _5673 = sqrt(_5671);
        float _5675 = rsqrt(_5671);
        float _5677 = -_5673;
        float _5679 = _5677 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5681 = _5679 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5683 = precise::clamp(_5681, 0.0, 1.0);
        float _5685 = _5661 * _5675;
        float _5687 = _5657 * _5675;
        float _5689 = abs(_5683);
        float _5691 = log2(_5689);
        float _5693 = _5665 * _5675;
        float _5695 = _5685 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5697 = _5243 * _5687;
        float _5699 = -_5687;
        float _5701 = -_5695;
        float _5703 = fma(_5699, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5701);
        float _5705 = fma(_5241, _5685, _5697);
        float _5707 = -_5693;
        float _5709 = fma(_5707, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5703);
        float _5711 = fma(_5245, _5693, _5705);
        float _5713 = precise::clamp(_5711, 0.0, 1.0);
        float _5715 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5717 = _5709 + _5715;
        float _5719 = _5691 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5721 = _5717 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5723 = precise::clamp(_5721, 0.0, 1.0);
        float _5725 = exp2(_5719);
        float _5727 = _5725 * _5723;
        float _5729 = _5713 * _5727;
        float _5731 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5733 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5735 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5731;
        out.m_108.y = _5733;
        out.m_108.z = _5735;
    }
    out.m_110.x = _5647;
    out.m_110.y = _5649;
    out.m_110.z = _5651;
    if (_5631)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5737 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5737;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5495 = false;
    bool _787 = false;
    bool _643 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
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
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5805 = as_type<float>(_153);
        out.gl_Position.z = _5805;
    }
    if (!_139)
    {
        return out;
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5868 = as_type<float>(_185);
        out.gl_Position.z = _5868;
    }
    if (_173)
    {
        return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = 1.0 / _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _303 = 1.0 / _279;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _283;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _307 * _285;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _289;
    float _333 = _315 * _303;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = _271 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _271 + _339;
    bool _343 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_271);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _293;
    float _357 = _337 * _311;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    bool _363 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _365 = isnan(_271);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _297;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _379 = _271 + _377;
    float _381 = _379 * _331;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _385 = _271 + _383;
    float _387 = 1.0 / _301;
    float _389 = _341 * _355;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _271 + _391;
    float _395 = _385 * _375;
    bool _397 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _399 = isnan(_271);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_373;
    float _411 = _409 + 1.0;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _407 * _361;
    float _427 = -_407;
    float _429 = _427 + 1.0;
    float _431 = _393 * _387;
    float _433 = -_423;
    float _435 = _433 + 1.0;
    float _437 = _423 * _411;
    float _439 = _373 * _429;
    bool _441 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_271);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _459 = isnan(_271);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = _451 * _435;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    bool _479 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _481 = isnan(_271);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = fma(_455, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _497 = _467 * _477;
    float _499 = -_467;
    float _501 = _499 + 1.0;
    float _503 = -_489;
    float _505 = _503 + 1.0;
    float _507 = fma(_471, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _509;
    float _513 = _489 * _501;
    float _515 = _353 * _505;
    float _517 = -_353;
    float _519 = _517 + 1.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = fma(_493, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = _495 * _515;
    float _529 = _507 * _515;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _531;
    float _535 = fma(_523, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _537 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    float _539 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _545 = fma(_511, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _547 = fma(_525, _513, _537);
    float _549 = fma(_533, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = fma(_535, _513, _539);
    float _557 = fma(_543, _389, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _559 = fma(_545, _497, _547);
    float _561 = fma(_553, _389, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _567;
    float _571 = fma(_549, _497, _555);
    float _573 = fma(_557, _473, _559);
    float _575 = fma(_565, _381, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _577 = fma(_569, _381, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _587 = fma(_561, _473, _571);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _589;
    float _593 = fma(_581, _431, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _595 = fma(_585, _431, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _597;
    float _601 = fma(_575, _437, _573);
    float _603 = fma(_577, _437, _587);
    float _605 = fma(_591, _395, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _607 = fma(_599, _395, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _609 = fma(_593, _439, _601);
    float _611 = fma(_595, _439, _603);
    float _613 = fma(_605, _425, _609);
    float _615 = fma(_607, _425, _611);
    float _617 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[150].x, _613);
    float _619 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[150].y, _615);
    bool _621 = !_309;
    float _623 = _587;
    float _641;
    if (!_621)
    {
        float _625 = in.m_76.x;
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        _641 = _179;
    }
    _643 = false;
    float _645 = _641;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _649 = _645 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = isnan(_645);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _671 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_645);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    bool _687 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _689 = isnan(_645);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = 1.0 / _653;
    float _701 = -_665;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _707 = _681 * _703;
    float _709 = -_681;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _669;
    float _715 = _685 * _699;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _721 = fma(_715, _649, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _723 = -_697;
    float _725 = _723 + 1.0;
    float _727 = _721 * _707;
    float _729 = _719 * _713;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _733 = _645 + _731;
    float _735 = _665 * _725;
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    float _739 = fma(_729, _733, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _741 = fma(_739, _735, _737);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _747 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[117].x, _741);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = in.m_78.x;
    float _761 = in.m_78.y;
    out.m_80.x = _751;
    out.m_80.y = _753;
    out.m_80.z = _757;
    out.m_80.w = _755;
    float _763 = _619 * _761;
    float _765 = _617 * _759;
    bool _767 = !_705;
    float _785;
    if (!_767)
    {
        float _769 = in.m_76.x;
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _773 = _769 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _777 = _775 * _771;
        float _779 = floor(_777);
        float _781 = -_779;
        float _783 = _777 + _781;
        _785 = _783;
        _787 = true;
    }
    else
    {
        _785 = _179;
    }
    _787 = false;
    float _789 = _785;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _789 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _799 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _801 = isnan(_789);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _819 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _821 = isnan(_789);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _797;
    float _833 = -_809;
    float _835 = _833 + 1.0;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _837;
    bool _841 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _843 = isnan(_789);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = _829 * _835;
    float _855 = -_829;
    float _857 = _855 + 1.0;
    bool _859 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _861 = 1.0 / _813;
    float _863 = _851 * _857;
    float _865 = -_851;
    float _867 = _865 + 1.0;
    float _869 = 1.0 / _817;
    float _871 = _839 * _831;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _877 = fma(_871, _793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _879 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _881 = isnan(_789);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = _875 * _861;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _899 = _789 + _897;
    float _901 = _877 * _863;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = _789 + _903;
    float _907 = fma(_891, _899, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _909 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _911 = _895 * _869;
    float _913 = -_889;
    float _915 = _913 + 1.0;
    float _917 = fma(_907, _853, _909);
    float _919 = fma(_911, _905, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _921 = _809 * _915;
    float _923 = fma(_919, _921, _917);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _931 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[134].x, _923);
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _927 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _933;
    out.m_82.y = _935;
    out.m_82.z = _937;
    out.m_82.w = _939;
    bool _941 = !_859;
    if (!_941)
    {
        float _943 = in.m_76.x;
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _947 = _943 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _951 = _949 * _945;
        float _953 = floor(_951);
        float _955 = -_953;
        float _957 = _951 + _955;
        _181 = _957;
    }
    float _959 = _181;
    float _961 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _963 = int(_961);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _971 = int(_969);
    float _973 = float(_963);
    float _975 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _977 = int(_975);
    if (_967)
    {
        _623 = 1.0;
    }
    float _979 = _623;
    int _981 = 0;
    float _983 = _979;
    if (_967)
    {
        _981 = 0;
    }
    int _985 = _981;
    float _987 = float(_971);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _991 = int(_989);
    float _993 = 1.0 / _973;
    float _995 = float(uint(_977));
    int _997 = ~_977;
    int _999 = _997 + 1;
    float _1001 = 1.0 / _987;
    float _1003 = float(uint(_991));
    float _1005 = _993 * _135;
    float _1007 = 1.0 / _995;
    float _1009 = _993;
    float _1011 = _987;
    int _1013 = _985;
    if (_967)
    {
        float _1015 = in.m_76.x;
        float _1017 = in.m_76.y;
        _1009 = _1015;
        _1011 = _1017;
    }
    float _1019 = _1009;
    float _1021 = _1011;
    float _1023 = _1001 * _135;
    float _1025 = 1.0 / _1003;
    float _1027 = trunc(_1005);
    int _1029 = int(_1027);
    int _1031 = as_type<int>(_1007) + (-2);
    float _1033 = trunc(_1023);
    int _1035 = int(_1033);
    int _1037 = as_type<int>(_1025) + (-2);
    float _1039 = _1025;
    float _1041 = _1019;
    float _1043 = _1021;
    if (_967)
    {
        _1039 = _1019;
    }
    float _1045 = _1039;
    float _1047 = 0.0;
    float _1049 = _1045;
    if (_967)
    {
        _1047 = _1021;
    }
    float _1051 = _1047;
    float _1053 = 0.0;
    float _1055 = _1051;
    if (_967)
    {
        _1053 = _1045;
    }
    float _1057 = _1053;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1061 = int(_1059);
    float _1063 = float(uint(_1029));
    float _1065 = as_type<float>(_1031) * _1063;
    int _1067 = as_type<int>(_1063);
    float _1069 = _1057;
    if (_967)
    {
        _1067 = 0;
    }
    int _1071 = _1067;
    float _1073 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1075 = int(_1073);
    float _1077 = float(uint(_1035));
    float _1079 = as_type<float>(_1037) * _1077;
    float _1081 = _1077;
    int _1083 = _1071;
    if (_967)
    {
        _1081 = 1.0;
    }
    float _1085 = _1081;
    float _1087 = trunc(_1065);
    float _1089 = precise::max(_1087, 0.0);
    uint _1092 = uint(_1089);
    float _1094 = float(uint(_1061));
    float _1096 = 1.0 / _1094;
    float _1098 = float(_1075);
    float _1100 = trunc(_1079);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = 1.0 / _1098;
    float _1108 = _1098;
    float _1110 = _1085;
    if (_967)
    {
        _1108 = _1045;
    }
    float _1112 = _1108;
    float _1114 = _1112;
    if (!_967)
    {
        float _1116 = in.m_76.x;
        float _1118 = in.m_76.y;
        float _1120 = in.m_76.z;
        float _1122 = _1116 * 3.1415927410125732421875;
        float _1124 = _1122 * 0.15915493667125701904296875;
        float _1126 = _1118 * 3.1415927410125732421875;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1124 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _983 = 5.839270114898681640625;
        _1114 = _1120;
        _1110 = 7.345489978790283203125;
        _1041 = _1116;
        _1049 = _1118;
        _1043 = _1118;
        _1055 = _1136;
        _1083 = 1;
        _1013 = 2;
        _1069 = _1132;
    }
    float _1138 = _983;
    float _1140 = _1114;
    float _1142 = _1110;
    float _1144 = _1041;
    float _1146 = _1049;
    float _1148 = _1043;
    float _1150 = _1055;
    int _1152 = _1083;
    int _1154 = _1013;
    float _1156 = _1069;
    int _1158 = _999 * int(_1092);
    int _1160 = _1158 + _1029;
    float _1162 = in.m_76.z;
    float _1164 = in.m_76.w;
    int _1166 = ~_991;
    int _1168 = _1166 + 1;
    float _1170 = _1138 * _1140;
    float _1172 = _1142 * _1144;
    float _1174 = float(uint(_1160));
    float _1176 = _1106 * _135;
    int _1178 = _1168 * int(_1104);
    int _1180 = _1178 + _1035;
    float _1182 = floor(_1172);
    float _1184 = _1142 * _1146;
    float _1186 = as_type<float>(_1031) * _1174;
    float _1188 = float(_977);
    float _1190 = _1144 * 2.0;
    float _1192 = float(uint(_1180));
    float _1194 = in.m_74.w;
    float _1196 = float(_1029);
    float _1198 = trunc(_1186);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = as_type<float>(_1037) * _1192;
    bool _1206 = _1196 >= _1188;
    bool _1208 = isnan(_1196);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(_1188);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1220 = _959 + _1218;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1224 = _1222 != 0;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1228 = _959 + _1226;
    bool _1230 = _1148 > 0.5;
    float _1232 = trunc(_1176);
    int _1234 = int(_1232);
    bool _1236 = _1164 > 0.5;
    float _1238 = -_1182;
    float _1240 = _1172 + _1238;
    bool _1242 = _1162 > 0.5;
    float _1244 = in.m_72.w;
    int _1246 = as_type<int>(_1096) + (-2);
    float _1248 = _1148 + _1144;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1260 = _1258 != 0;
    float _1262 = trunc(_1204);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    int _1268 = int(_1092) + int(_1202);
    float _1270 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1272 = ~_991;
    int _1274 = _1272 + 1;
    int _1276 = ~_977;
    int _1278 = _1276 + 1;
    float _1280 = floor(_1170);
    float _1282 = float(uint(_1234));
    int _1284 = _1278 * _1268;
    int _1286 = _1284 + _1029;
    int _1288 = int(_1236);
    int _1290 = _1242 ? 2 : 0;
    int _1292 = _1288 | _1290;
    int _1294 = _1224 ? 4 : 0;
    int _1296 = _1292 | _1294;
    int _1298 = _1252 ? 8 : 0;
    int _1300 = _1296 | _1298;
    int _1302 = _1256 ? 16 : 0;
    int _1304 = _1300 | _1302;
    int _1306 = _1260 ? 32 : 0;
    int _1308 = _1304 | _1306;
    int _1310 = _1230 ? 64 : 0;
    int _1312 = _1308 | _1310;
    int _1314 = _1312 & 64;
    bool _1316 = !_1224;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = as_type<float>(_1246) * _1282;
    float _1322 = -_241;
    int _1324 = _1230 ? as_type<int>(_1322) : as_type<int>(_241);
    float _1326 = trunc(_1216);
    int _1328 = int(_1326);
    int _1330 = int(_1104) + int(_1266);
    bool _1332 = !_1256;
    float _1334 = _1332 ? _241 : as_type<float>(_1324);
    int _1336 = abs(_1318);
    int _1338 = ~_1061;
    int _1340 = _1338 + 1;
    float _1342 = floor(_1184);
    float _1344 = -_225;
    int _1346 = _1242 ? as_type<int>(_1344) : as_type<int>(_225);
    float _1348 = -_1280;
    float _1350 = _1170 + _1348;
    float _1352 = float(_991);
    bool _1354 = !_1260;
    float _1356 = _1354 ? _225 : as_type<float>(_1346);
    float _1358 = _1240 * _1188;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1370 = _1368 != 0;
    float _1372 = trunc(_1320);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    bool _1378 = uint(_1286) >= uint(_977);
    int _1380 = _1274 * _1330;
    int _1382 = _1380 + _1035;
    float _1384 = float(_1035);
    bool _1386 = !_1366;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = -_1342;
    float _1392 = _1184 + _1390;
    bool _1394 = !_1362;
    int _1396 = _1394 ? 0 : 1;
    float _1398 = trunc(_1358);
    int _1400 = int(_1398);
    bool _1402 = uint(_1382) >= uint(_991);
    float _1404 = _1350 * _1352;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1408 = _1406 != 0;
    bool _1410 = !_1378;
    int _1412 = _1410 ? 0 : (-1);
    bool _1414 = _1384 >= _1352;
    bool _1416 = isnan(_1384);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(_1352);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    int _1426 = _1340 * int(_1376);
    int _1428 = _1426 + _1234;
    bool _1430 = !_1370;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = trunc(_1404);
    int _1436 = int(_1434);
    bool _1438 = !_1408;
    int _1440 = _1438 ? 0 : 1;
    bool _1442 = !_1402;
    int _1444 = _1442 ? 0 : (-1);
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1456 = _1454 != 0;
    int _1458 = _1400 * _1336;
    int _1460 = _1458 + _1029;
    int _1462 = ~_1268;
    int _1464 = _1462 + _1412;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1424);
    int _1470 = int(_1468);
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1474 = _1472 != 0;
    bool _1476 = !_1452;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = _977 * _1466;
    int _1482 = _1480 + _1029;
    bool _1484 = !_1474;
    int _1486 = _1484 ? 0 : 1;
    bool _1488 = _977 == 0;
    float _1490 = floor(_1190);
    bool _1492 = _1314 != 0;
    int _1494 = abs(_1486);
    float _1496 = float(uint(_1428));
    int _1498 = ~_1330;
    int _1500 = _1498 + _1444;
    int _1502 = _1500 + 1;
    float _1504 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1506 = log2(_1504);
    bool _1508 = !_1488;
    int _1510 = _1508 ? _1482 : (-1);
    float _1512 = _175 * _135;
    float _1514 = as_type<float>(_1246) * _1496;
    bool _1516 = !_1448;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = _991 * _1502;
    int _1522 = _1520 + _1035;
    float _1524 = _1188 * _1512;
    bool _1526 = _991 == 0;
    float _1528 = _1352 * _1512;
    int _1530 = ~_1328;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    float _1536 = trunc(_1514);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    int _1542 = ~_1470;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _1436 * _1494;
    int _1550 = _1548 + _1035;
    bool _1552 = !_1526;
    int _1554 = _1552 ? _1522 : (-1);
    int _1556 = _1510 * _1534;
    int _1558 = _977 + (-1);
    float _1560 = _1506 * _135;
    int _1562 = _991 + (-1);
    float _1564 = trunc(_1524);
    int _1566 = int(_1564);
    int _1568 = _1554 * _1546;
    int _1570 = abs(_1388);
    int _1572 = _1328 * _1558;
    int _1574 = _1572 + _1556;
    int _1576 = abs(_1478);
    int _1578 = _1470 * _1562;
    int _1580 = _1578 + _1568;
    int _1582 = abs(_1432);
    int _1584 = _1574 * _1570;
    float _1586 = trunc(_1528);
    int _1588 = int(_1586);
    int _1590 = abs(_1396);
    int _1592 = ~_1061;
    int _1594 = _1592 + 1;
    int _1596 = _1580 * _1576;
    int _1598 = int(_1376) + int(_1540);
    int _1600 = _1566 * _1590;
    int _1602 = _1600 + _1584;
    int _1604 = abs(_1440);
    int _1606 = abs(_1518);
    int _1608 = _1460 * _1582;
    int _1610 = _1608 + _1602;
    float _1612 = -_225;
    int _1614 = _1236 ? as_type<int>(_1612) : as_type<int>(_225);
    int _1616 = _1594 * _1598;
    int _1618 = _1616 + _1234;
    float _1620 = float(_1234);
    int _1622 = _1400 * _1604;
    int _1624 = _1622 + _1610;
    float _1626 = float(_1061);
    int _1628 = _1588 * _1606;
    int _1630 = _1628 + _1596;
    bool _1632 = uint(_1618) >= uint(_1061);
    float _1634 = -_241;
    int _1636 = _1242 ? as_type<int>(_1634) : as_type<int>(_241);
    float _1638 = _1626 * _1512;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1642 = _1640 != 0;
    float _1644 = _1392 * _1626;
    float _1646 = float(uint(_1624));
    bool _1648 = !_1642;
    int _1650 = _1648 ? 0 : 1;
    float _1652 = trunc(_1638);
    int _1654 = int(_1652);
    bool _1656 = !_1456;
    int _1658 = _1656 ? 0 : 1;
    float _1660 = as_type<float>(_1031) * _1646;
    int _1662 = abs(_1650);
    bool _1664 = !_1252;
    float _1666 = _1664 ? _225 : as_type<float>(_1614);
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1670 = _1668 != 0;
    float _1672 = trunc(_1660);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = abs(_1658);
    bool _1680 = _1620 >= _1626;
    bool _1682 = isnan(_1620);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(_1626);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    bool _1692 = !_1670;
    int _1694 = _1692 ? 0 : 1;
    int _1696 = _1550 * _1678;
    int _1698 = _1696 + _1630;
    bool _1700 = !_1632;
    int _1702 = _1700 ? 0 : (-1);
    float _1704 = trunc(_1690);
    int _1706 = int(_1704);
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1710 = _1708 != 0;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1714 = _1712 != 0;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1718 = _1716 != 0;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1722 = _1720 != 0;
    int _1724 = ~_1598;
    int _1726 = _1724 + _1702;
    int _1728 = _1726 + 1;
    int _1730 = _1436 * _1662;
    int _1732 = _1730 + _1698;
    int _1734 = abs(_1694);
    int _1736 = ~_977;
    int _1738 = _1736 + 1;
    int _1740 = _1061 * _1728;
    int _1742 = _1740 + _1234;
    bool _1744 = !_1714;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1750 = _1748 != 0;
    float _1752 = trunc(_1644);
    int _1754 = int(_1752);
    bool _1756 = !_1710;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = _1738 * int(_1676);
    int _1762 = _1760 + _1624;
    bool _1764 = _1061 == 0;
    float _1766 = float(uint(_1732));
    float _1768 = float(uint(_1762));
    int _1770 = ~_1706;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = as_type<float>(_1037) * _1766;
    bool _1778 = !_1764;
    int _1780 = _1778 ? _1742 : (-1);
    float _1782 = as_type<float>(_1698);
    float _1784 = as_type<float>(_1676);
    float _1786 = as_type<float>(_1494);
    float _1788 = as_type<float>(_1152);
    float _1790 = as_type<float>(_1154);
    if (_1750)
    {
        float _1792 = in.m_76.w;
        _1782 = _1792;
    }
    float _1794 = _1782;
    float _1796 = as_type<float>(_1031) * _1768;
    float _1798 = trunc(_1776);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    int _1804 = abs(_1746);
    int _1806 = _1780 * _1774;
    int _1808 = _1061 + (-1);
    int _1810 = abs(_1758);
    float _1812 = trunc(_1796);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    int _1818 = _1706 * _1808;
    int _1820 = _1818 + _1806;
    int _1822 = ~_977;
    int _1824 = _1822 + 1;
    int _1826 = _1754 * _1734;
    int _1828 = _1826 + _1234;
    bool _1830 = _977 == 0;
    int _1832 = _1820 * _1804;
    int _1834 = ~_991;
    int _1836 = _1834 + 1;
    float _1838 = as_type<float>(_1804);
    float _1840 = as_type<float>(_1734);
    if (!_1750)
    {
        _1838 = _241;
    }
    float _1842 = _1838;
    int _1844 = _1654 * _1810;
    int _1846 = _1844 + _1832;
    bool _1848 = !_1718;
    int _1850 = _1848 ? 0 : 1;
    float _1852 = _1842;
    if (_1750)
    {
        float _1854 = _1794 * 3.1415927410125732421875;
        _1840 = _1854;
    }
    float _1856 = _1840;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1860 = _1858 != 0;
    int _1862 = _1836 * int(_1802);
    int _1864 = _1862 + _1732;
    int _1866 = int(_1676) + int(_1816);
    if (_1750)
    {
        float _1868 = _1856 * 0.15915493667125701904296875;
        _1784 = _1868;
    }
    float _1870 = _1784;
    int _1872 = abs(_1850);
    float _1874 = float(uint(_1864));
    int _1876 = _1824 * _1866;
    int _1878 = _1876 + _1624;
    bool _1880 = !_1722;
    int _1882 = _1880 ? 0 : 1;
    float _1884 = _1870;
    if (_1750)
    {
        float _1886 = _1870 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = as_type<float>(_1037) * _1874;
    int _1894 = abs(_1882);
    int _1896 = _1828 * _1872;
    int _1898 = _1896 + _1846;
    bool _1900 = uint(_1878) >= uint(_977);
    float _1902 = _1644;
    if (_1860)
    {
        float _1904 = in.m_76.x;
        _1902 = _1904;
    }
    float _1906 = _1902;
    float _1908 = float(uint(_1460));
    int _1910 = _1754 * _1894;
    int _1912 = _1910 + _1898;
    bool _1914 = !_1900;
    int _1916 = _1914 ? 0 : (-1);
    float _1918 = trunc(_1892);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1926 = _1924 != 0;
    float _1928 = as_type<float>(_1031) * _1908;
    int _1930 = ~_1866;
    int _1932 = _1930 + _1916;
    int _1934 = _1932 + 1;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1940 = !_1926;
    float _1942 = _1940 ? _241 : as_type<float>(_1636);
    float _1944 = float(uint(_1912));
    float _1946 = trunc(_1928);
    float _1948 = precise::max(_1946, 0.0);
    uint _1950 = uint(_1948);
    int _1952 = _977 * _1934;
    int _1954 = _1952 + _1624;
    bool _1956 = _1926;
    float _1958 = _1944;
    if (_1750)
    {
        bool _1960 = _1890 > 0.5;
        _1956 = _1960;
    }
    bool _1962 = _1956;
    float _1964 = as_type<float>(_1246) * _1944;
    int _1966 = ~_977;
    int _1968 = _1966 + 1;
    bool _1970 = !_1830;
    int _1972 = _1970 ? _1954 : (-1);
    float _1974 = 1.0 / _1938;
    if (_1750)
    {
        float _1976 = -_241;
        float _1978 = _1962 ? _1976 : _241;
        _1852 = _1978;
    }
    float _1980 = _1852;
    int _1982 = _1972 & 3;
    bool _1984 = _1982 != 0;
    if (_1860)
    {
        float _1986 = _1906 * 3.1415927410125732421875;
        _1958 = _1986;
    }
    float _1988 = _1958;
    int _1990 = _1972 & 3;
    bool _1992 = _1990 != 0;
    int _1994 = int(_1802) + int(_1922);
    float _1996 = trunc(_1964);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    int _2002 = _1968 * int(_1950);
    int _2004 = _2002 + _1460;
    int _2006 = ~_1061;
    int _2008 = _2006 + 1;
    float _2010 = _1988;
    if (_1860)
    {
        float _2012 = _1988 * 0.15915493667125701904296875;
        _2010 = _2012;
    }
    float _2014 = _2010;
    int _2016 = _1984 ? 0 : 1;
    bool _2018 = uint(_1990) > 1u;
    float _2020 = float(uint(_1550));
    float _2022 = _2014;
    if (_1860)
    {
        float _2024 = _2014 * 6.283185482025146484375;
        float _2026 = sin(_2024);
        _2022 = _2026;
    }
    float _2028 = _2022;
    float _2030 = float(uint(_2004));
    float _2032 = as_type<float>(_1037) * _2020;
    int _2034 = ~_991;
    int _2036 = _2034 + 1;
    float _2038 = as_type<float>(_1031) * _2030;
    int _2040 = ~_2016;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _2008 * int(_2000);
    int _2048 = _2046 + _1912;
    float _2050 = trunc(_2032);
    float _2052 = precise::max(_2050, 0.0);
    uint _2054 = uint(_2052);
    int _2056 = _2036 * _1994;
    int _2058 = _2056 + _1732;
    float _2060 = -_225;
    int _2062 = _1492 ? as_type<int>(_2060) : as_type<int>(_225);
    float _2064 = float(uint(_2048));
    bool _2066 = uint(_1990) >= 2u;
    int _2068 = _2044;
    if (!_2018)
    {
        int _2070 = ~_2016;
        int _2072 = _2070 + 1;
        _2068 = _2072;
    }
    int _2074 = _2068;
    float _2076 = as_type<float>(_1246) * _2064;
    bool _2078 = uint(_2058) >= uint(_991);
    float _2080 = trunc(_2038);
    float _2082 = precise::max(_2080, 0.0);
    uint _2084 = uint(_2082);
    int _2086 = _2066 ? 0 : 1;
    bool _2088 = _1990 != 3;
    bool _2090 = !_2078;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = ~_991;
    int _2096 = _2094 + 1;
    float _2098 = trunc(_2076);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    int _2104 = ~_1994;
    int _2106 = _2104 + _2092;
    int _2108 = _2106 + 1;
    int _2110 = _2096 * int(_2054);
    int _2112 = _2110 + _1550;
    int _2114 = ~_2086;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _991 * _2108;
    int _2122 = _2120 + _1732;
    int _2124 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2126 = _2124 != 0;
    int _2128 = _2118;
    bool _2130 = _2088;
    float _2132 = 2.8025969286496341418474591665798e-45;
    if (_2088)
    {
        int _2134 = ~_2086;
        int _2136 = _2134 + 1;
        _2128 = _2136;
    }
    int _2138 = _2128;
    if (_1860)
    {
        bool _2140 = _2028 > 0.5;
        _2130 = _2140;
    }
    bool _2142 = _2130;
    bool _2144 = !_1526;
    int _2146 = _2144 ? _2122 : (-1);
    float _2148 = float(uint(_2112));
    if (!_1860)
    {
        _2132 = _225;
    }
    float _2150 = _2132;
    float _2152 = _2150;
    if (_1860)
    {
        float _2154 = -_225;
        float _2156 = _2142 ? _2154 : _225;
        _2152 = _2156;
    }
    float _2158 = _2152;
    float _2160 = as_type<float>(_1037) * _2148;
    int _2162 = _2146 & 3;
    bool _2164 = _2162 != 0;
    bool _2166 = !_2126;
    float _2168 = _2166 ? _225 : as_type<float>(_2062);
    int _2170 = int(_2000) + int(_2102);
    float _2172 = trunc(_2160);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    int _2178 = ~_1061;
    int _2180 = _2178 + 1;
    int _2182 = _2146 & 3;
    bool _2184 = _2182 != 0;
    bool _2186 = uint(_2162) > 1u;
    int _2188 = _2180 * _2170;
    int _2190 = _2188 + _1912;
    int _2192 = int(_1950) + int(_2084);
    int _2194 = ~_977;
    int _2196 = _2194 + 1;
    int _2198 = _2184 ? 0 : 1;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2202 = _2200 != 0;
    int _2204 = _2196 * _2192;
    int _2206 = _2204 + _1460;
    float _2208 = float(uint(_1828));
    bool _2210 = !_2202;
    int _2212 = _2210 ? 0 : 1;
    bool _2214 = uint(_2190) >= uint(_1061);
    float _2216 = as_type<float>(_1246) * _2208;
    int _2218 = ~_2198;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2222;
    if (!_2186)
    {
        int _2226 = ~_2198;
        int _2228 = _2226 + 1;
        _2224 = _2228;
    }
    int _2230 = _2224;
    bool _2232 = uint(_2206) >= uint(_977);
    float _2234 = trunc(_2216);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    bool _2240 = !_2214;
    int _2242 = _2240 ? 0 : (-1);
    bool _2244 = _2162 != 3;
    bool _2246 = !_2232;
    int _2248 = _2246 ? 0 : (-1);
    bool _2250 = uint(_2162) >= 2u;
    int _2252 = ~_2170;
    int _2254 = _2252 + _2242;
    int _2256 = _2254 + 1;
    int _2258 = ~_991;
    int _2260 = _2258 + 1;
    int _2262 = int(_2054) + int(_2176);
    int _2264 = _1061 * _2256;
    int _2266 = _2264 + _1912;
    int _2268 = ~_1061;
    int _2270 = _2268 + 1;
    int _2272 = _2250 ? 0 : 1;
    int _2274 = _2260 * _2262;
    int _2276 = _2274 + _1550;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2280 = _2278 != 0;
    int _2282 = ~_2272;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = _2286;
    int _2290 = _2230;
    if (_2244)
    {
        int _2292 = ~_2272;
        int _2294 = _2292 + 1;
        _2288 = _2294;
    }
    int _2296 = _2288;
    int _2298 = _2270 * int(_2238);
    int _2300 = _2298 + _1828;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2304 = _2302 != 0;
    bool _2306 = !_2280;
    int _2308 = _2306 ? 0 : 1;
    bool _2310 = uint(_2276) >= uint(_991);
    bool _2312 = !_1764;
    int _2314 = _2312 ? _2266 : (-1);
    bool _2316 = !_2304;
    int _2318 = _2316 ? 0 : 1;
    bool _2320 = !_2310;
    int _2322 = _2320 ? 0 : (-1);
    int _2324 = _2314 & 3;
    bool _2326 = _2324 != 0;
    int _2328 = _2314 & 3;
    bool _2330 = _2328 != 0;
    float _2332 = float(uint(_2300));
    int _2334 = _2326 ? 0 : 1;
    bool _2336 = uint(_2328) > 1u;
    float _2338 = as_type<float>(_1246) * _2332;
    int _2340 = ~_2334;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    float _2346 = trunc(_2338);
    float _2348 = precise::max(_2346, 0.0);
    uint _2350 = uint(_2348);
    int _2352 = ~_2262;
    int _2354 = _2352 + _2322;
    int _2356 = _2354 + 1;
    float _2358 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2360 = _2358 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2364 = _2362 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2366 = _2344;
    if (!_2336)
    {
        int _2368 = ~_2334;
        int _2370 = _2368 + 1;
        _2366 = _2370;
    }
    int _2372 = _2366;
    bool _2374 = uint(_2328) >= 2u;
    float _2376 = 1.0 / _2360;
    int _2378 = ~_1061;
    int _2380 = _2378 + 1;
    int _2382 = _2374 ? 0 : 1;
    bool _2384 = _2328 != 3;
    int _2386 = int(_2238) + int(_2350);
    float _2388 = 1.0 / _2364;
    int _2390 = ~_2382;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    int _2396 = _2380 * _2386;
    int _2398 = _2396 + _1828;
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2400;
    int _2404 = _2394;
    if (_2384)
    {
        int _2406 = ~_2382;
        int _2408 = _2406 + 1;
        _2404 = _2408;
    }
    int _2410 = _2404;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2414 = uint(_2398) >= uint(_1061);
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2418 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2412);
    bool _2420 = !_2414;
    int _2422 = _2420 ? 0 : (-1);
    float _2424 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _2426 = _1144 > 0.5;
    float _2428 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2418);
    float _2430 = -_241;
    int _2432 = _2426 ? as_type<int>(_2430) : as_type<int>(_241);
    int _2434 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2436 = _2434 != 0;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2440 = in.m_56.x;
    float _2442 = in.m_56.y;
    float _2444 = in.m_56.z;
    int _2446 = abs(_2074);
    bool _2448 = !_2436;
    float _2450 = _2448 ? _241 : as_type<float>(_2432);
    float _2452 = fma(_2424, -2.0, _2438);
    bool _2454 = _1152 != 1;
    float _2456 = _1248 + (-1.0);
    int _2458 = ~_2386;
    int _2460 = _2458 + _2422;
    int _2462 = _2460 + 1;
    float _2464 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2452);
    int _2466 = ~_2192;
    int _2468 = _2466 + _2248;
    int _2470 = _2468 + 1;
    int _2472 = abs(_2212);
    int _2474 = _1061 * _2462;
    int _2476 = _2474 + _1828;
    int _2478 = abs(_2372);
    int _2480 = _977 * _2470;
    int _2482 = _2480 + _1460;
    int _2484 = ~_2478;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = as_type<float>(_2462);
    if (!_2454)
    {
        _1786 = _1148;
    }
    float _2492 = _1786;
    float _2494 = 0.0;
    float _2496 = _2492;
    if (!_2454)
    {
        _2494 = _1148;
    }
    float _2498 = _2494;
    float _2500 = 0.0;
    float _2502 = _2498;
    if (!_2454)
    {
        _2500 = _1162;
    }
    float _2504 = _2500;
    float _2506 = _197 * _2442;
    float _2508 = _2504;
    if (!_2454)
    {
        _1788 = _1162;
    }
    float _2510 = _1788;
    float _2512 = _1148 * 2.0;
    float _2514 = _2510;
    if (_2454)
    {
        _2496 = _1144;
    }
    float _2516 = _2496;
    float _2518 = _203 * _2442;
    if (_2454)
    {
        _2502 = _1144;
    }
    float _2520 = _2502;
    float _2522 = _209 * _2442;
    if (_2454)
    {
        _2508 = _1148;
    }
    float _2524 = _2508;
    float _2526 = fma(_195, _2440, _2506);
    if (_2454)
    {
        _2514 = _1148;
    }
    float _2528 = _2514;
    float _2530 = floor(_2512);
    bool _2532 = _1154 != 2;
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2538 = fma(_201, _2440, _2518);
    float _2540 = fma(_207, _2440, _2522);
    float _2542 = fma(_199, _2444, _2526);
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2546 = fma(_205, _2444, _2538);
    float _2548 = fma(_211, _2444, _2540);
    float _2550 = _1162 * 2.0;
    float _2552 = 1.0 / _2536;
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2554;
    float _2558 = 0.0;
    float _2560 = _2544;
    if (_2532)
    {
        _2558 = _1144;
    }
    float _2562 = _2558;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2568 = _2562;
    if (_2532)
    {
        _1790 = _1148;
    }
    float _2570 = _1790;
    float _2572 = _2556 * _1974;
    float _2574 = _2570;
    if (!_2532)
    {
        _2568 = _1162;
    }
    float _2576 = _2568;
    float _2578 = _2546 + _1244;
    if (!_2532)
    {
        _2574 = _1144;
    }
    float _2580 = _2574;
    float _2582 = floor(_2550);
    bool _2584 = _1490 >= 0.0;
    bool _2586 = isnan(_1490);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan(0.0);
    bool _2592 = _2588 || _2590;
    float _2594 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2596 = _2592 ? 0 : 1;
    bool _2598 = _1490 > 0.0;
    float _2600 = 1.0 / _2566;
    int _2602 = ~_2596;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    bool _2608 = !_1764;
    int _2610 = _2608 ? _2476 : (-1);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2614 = _2612 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2616 = _2606;
    if (!_2598)
    {
        int _2618 = ~_2596;
        int _2620 = _2618 + 1;
        _2616 = _2620;
    }
    int _2622 = _2616;
    float _2624 = 1.0 / _2614;
    bool _2626 = _2530 >= 0.0;
    bool _2628 = isnan(_2530);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan(0.0);
    bool _2634 = _2630 || _2632;
    int _2636 = _2634 ? 0 : 1;
    bool _2638 = _2530 > 0.0;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2642 = _2640 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2648;
    int _2652 = ~_2636;
    int _2654 = _2652 + 1;
    int _2656 = _2654 + 1;
    float _2658 = 1.0 / _2642;
    float _2660 = _2646 * _2388;
    float _2662 = _2650 * _2376;
    int _2664 = _991 * _2356;
    int _2666 = _2664 + _1550;
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2670 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2668;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2676 = !_1992;
    int _2678 = _2676 ? 0 : 1;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2684 = _2656;
    if (!_2638)
    {
        int _2686 = ~_2636;
        int _2688 = _2686 + 1;
        _2684 = _2688;
    }
    int _2690 = _2684;
    float _2692 = _2670 * _2624;
    bool _2694 = !_1526;
    int _2696 = _2694 ? _2666 : (-1);
    float _2698 = _2674 * _2600;
    bool _2700 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2702 = isnan(_959);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2708 = _2704 || _2706;
    float _2710 = float(_2708);
    float _2712 = _2682 * _2552;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2716 = _2714 != 0;
    int _2718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2720 = _2718 != 0;
    int _2722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2724 = _2722 != 0;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2728 = _959 + _2726;
    bool _2730 = _2582 >= 0.0;
    bool _2732 = isnan(_2582);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(0.0);
    bool _2738 = _2734 || _2736;
    float _2740 = -_2710;
    float _2742 = _2740 + 1.0;
    bool _2744 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2746 = isnan(_959);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2752 = _2748 || _2750;
    float _2754 = float(_2752);
    float _2756 = _2402 * _2658;
    int _2758 = _2738 ? 0 : 1;
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2762 = _959 + _2760;
    bool _2764 = _2582 > 0.0;
    float _2766 = _2754 * _2742;
    bool _2768 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2770 = isnan(_959);
    bool _2772 = _2768 || _2770;
    bool _2774 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2776 = _2772 || _2774;
    float _2778 = float(_2776);
    float _2780 = -_2754;
    float _2782 = _2780 + 1.0;
    bool _2784 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2786 = isnan(_959);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = fma(_2660, _2762, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2798 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2800 = isnan(_959);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2806 = _2802 || _2804;
    float _2808 = float(_2806);
    float _2810 = _2778 * _2782;
    float _2812 = -_2778;
    float _2814 = _2812 + 1.0;
    float _2816 = -_2794;
    float _2818 = _2816 + 1.0;
    float _2820 = fma(_2572, _2728, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2822 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2824 = isnan(_959);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2830 = _2826 || _2828;
    float _2832 = float(_2830);
    float _2834 = _2794 * _2814;
    float _2836 = in.m_70.w;
    float _2838 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2840 = _959 + _2838;
    float _2842 = _2808 * _2818;
    float _2844 = -_2808;
    float _2846 = _2844 + 1.0;
    bool _2848 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2850 = isnan(_959);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2856 = _2852 || _2854;
    float _2858 = float(_2856);
    float _2860 = fma(_2662, _2840, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2864 = _959 + _2862;
    float _2866 = _2832 * _2846;
    float _2868 = -_2832;
    float _2870 = _2868 + 1.0;
    bool _2872 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2874 = isnan(_959);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2880 = _2876 || _2878;
    float _2882 = float(_2880);
    float _2884 = -_2858;
    float _2886 = _2884 + 1.0;
    float _2888 = fma(_2712, _2864, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2892 = _959 + _2890;
    float _2894 = _2858 * _2870;
    float _2896 = _2882 * _2886;
    float _2898 = -_2882;
    float _2900 = _2898 + 1.0;
    float _2902 = fma(_2692, _2892, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2904 = _2820 * _2896;
    float _2906 = fma(_2698, _1220, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2908 = ~_2758;
    int _2910 = _2908 + 1;
    int _2912 = _2910 + 1;
    float _2914 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2904);
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2918 = _2542 + _2836;
    float _2920 = _2548 + _1194;
    float _2922 = fma(_2796, _2894, _2914);
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2926 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2916);
    float _2928 = fma(_2860, _2866, _2922);
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2932 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2924);
    float _2934 = _1148 + (-0.5);
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2938 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2930);
    float _2940 = _1148 + _1162;
    float _2942 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2936);
    float _2944 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2946 = fma(_2888, _2842, _2928);
    float _2948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2950 = _2578 + _2948;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2954 = -_2416;
    float _2956 = fma(_2944, 2.0, _2954);
    int _2958 = _2146 >> 31;
    float _2960 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2962 = fma(_1270, -2.0, _2952);
    float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2966 = _2918 + _2964;
    float _2968 = _2950 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2970 = _2958 & 3;
    float _2972 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2974 = _2912;
    float _2976 = _2920;
    if (!_2764)
    {
        int _2978 = ~_2758;
        int _2980 = _2978 + 1;
        _2974 = _2980;
    }
    int _2982 = _2974;
    float _2984 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2960);
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2920 + _2986;
    float _2990 = fma(_2966, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2968);
    float _2992 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2994 = _1144 + _1162;
    float _2996 = _1144 + (-0.5);
    int _2998 = _2146 + _2970;
    float _3000 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2990);
    float _3002 = -_135;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2956);
    int _3006 = _2998 >> 2;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3010 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _3012 = _3006 << 4;
    int _3014 = _3012 + 656;
    float _3016 = _2158 + (-0.5);
    bool _3018 = !_2164;
    int _3020 = _3018 ? 0 : 1;
    float _3022 = -_3010;
    float _3024 = fma(_2992, 2.0, _3022);
    float _3026 = fma(_2902, _2834, _2946);
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _3030 = uint(int(uint(_3014) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[int(_3040)][_3042];
    bool _3046 = _2162 != 3;
    float _3048 = -_135;
    float _3050 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3024);
    float _3052 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3028);
    float _3054 = fma(_2906, _2810, _3026);
    bool _3056 = !_3046;
    int _3058 = _3056 ? 0 : (-1);
    float _3060 = -_3016;
    float _3062 = -_2464;
    float _3064 = fma(_3060, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3062);
    bool _3066 = _3000 >= 0.0;
    int _3068 = _3014 + 8;
    uint _3070 = uint(int(uint(_3068) >> uint(2)));
    uint _3072 = uint(int(uint(int(_3070)) >> uint(2)));
    int _3074 = int(_3070) & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    int _3078 = int(_3070) + 1;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    int _3082 = _3078 & 3;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[int(_3080)][_3082];
    float _3086 = _1980 + 0.5;
    float _3088 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3008);
    float _3090 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3092 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[95].x, _3004);
    float _3094 = _2450 + 0.5;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3098 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2962);
    float _3100 = _2168 + (-0.5);
    float _3102 = fma(_3094, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3050);
    float _3104 = fma(_3090, -2.0, _3096);
    int _3106 = abs(_2230);
    float _3108 = -_3100;
    float _3110 = -_3098;
    float _3112 = fma(_3108, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3110);
    float _3114 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3118 = fma(_2756, _1228, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3120 = abs(_3058);
    float _3122 = -_3116;
    float _3124 = fma(_2594, 2.0, _3122);
    int _3126 = abs(_3020);
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3130 = fma(_3118, _2766, _3054);
    int _3132 = abs(_2296);
    float _3134 = -_3128;
    float _3136 = fma(_2544, 2.0, _3134);
    int _3138 = ~_3106;
    int _3140 = _3138 + 1;
    int _3142 = _3140 + 1;
    if (_3066)
    {
        _2560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3144 = _2560;
    float _3146 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2942);
    int _3148 = ~_3126;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3066)
    {
        float _3156 = _3144 * 5.0;
        _2290 = as_type<int>(_3156);
    }
    int _3158 = _2290;
    bool _3160 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3162 = isnan(0.0);
    bool _3164 = _3160 || _3162;
    bool _3166 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3168 = _3164 || _3166;
    float _3170 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2938);
    float _3172 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2926);
    if (_3066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10223 = as_type<float>(_3158);
        out.gl_Position.z = _10223;
    }
    int _3174 = _3142 * as_type<int>(_3044);
    int _3176 = ~_3132;
    int _3178 = _3176 + 1;
    int _3180 = _3178 + 1;
    float _3182 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3184 = int(_3182);
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3188 = _3152 * as_type<int>(_3036);
    int _3190 = _3188 + _3174;
    int _3192 = abs(_2308);
    float _3194 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3104);
    int _3196 = _3180 * as_type<int>(_3076);
    int _3198 = _3196 + _3190;
    float _3200 = exp2(_1560);
    int _3202 = ~_3120;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    float _3208 = -_2428;
    float _3210 = _3208 + 1.0;
    int _3212 = ~_3192;
    int _3214 = _3212 + 1;
    int _3216 = _3214 + 1;
    float _3218 = _3154 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3220 = _1666 + (-0.5);
    int _3222 = _3206 * as_type<int>(_3084);
    int _3224 = _3222 + _3198;
    float _3226 = -_3146;
    float _3228 = _3226 + 1.0;
    float _3230 = float(uint(_3184));
    float _3232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3234 = _3224 * _3216;
    float _3236 = fma(_3210, _2158, _3064);
    float _3238 = -_3228;
    float _3240 = fma(_3238, _1980, _3092);
    int _3242 = _2696 * _3192;
    int _3244 = _3242 + _3234;
    float _3246 = _1942 + 0.5;
    float _3248 = -_3200;
    float _3250 = _3248 + 1.0;
    float _3252 = 1.0 / _3230;
    float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3256 = 1.0 + _3254;
    float _3258 = -_135;
    float _3260 = fma(_3258, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3136);
    float _3262 = fma(_3114, -2.0, _3186);
    float _3264 = _3168 ? _3250 : 0.0;
    out.m_84.x = _3240;
    out.m_84.y = _3236;
    float _3266 = fma(_3218, _3246, _3260);
    bool _3268 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3270 = isnan(1.0);
    bool _3272 = _3268 || _3270;
    bool _3274 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3276 = _3272 || _3274;
    float _3278 = 1.0 / _3256;
    float _3280 = float(uint(_3244));
    float _3282 = _3232 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3284 = abs(_3184);
    float _3286 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2984);
    float _3288 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2932);
    float _3290 = -_3282;
    float _3292 = -_3194;
    float _3294 = fma(_3290, _3220, _3292);
    int _3296 = ~_3184;
    int _3298 = _3296 + 1;
    float _3300 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3088);
    int _3302 = as_type<int>(_3252) + (-2);
    float _3304 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3052);
    float _3306 = -_135;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3124);
    float _3310 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3262);
    float _3312 = float(uint(_3284));
    float _3314 = as_type<float>(_3302) * _3280;
    float _3316 = _2950 * _2950;
    if (_3276)
    {
        float _3318 = _3264 * _3278;
        _145 = _3318;
    }
    float _3320 = _145;
    float _3322 = trunc(_3314);
    float _3324 = precise::max(_3322, 0.0);
    uint _3326 = uint(_3324);
    int _3328 = _1972 >> 31;
    float _3330 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3130);
    int _3332 = _2314 >> 31;
    float _3334 = fma(_2966, _2966, _3316);
    int _3336 = _3328 & 3;
    float _3338 = -_3300;
    float _3340 = _3338 + 1.0;
    bool _3342 = !_2716;
    int _3344 = _3342 ? 0 : 1;
    float _3346 = 1.0 / _3312;
    int _3348 = _3332 & 3;
    float _3350 = fma(_2988, _2988, _3334);
    int _3352 = _1972 + _3336;
    float _3354 = -_3170;
    float _3356 = _3354 + 1.0;
    int _3358 = _2314 + _3348;
    float _3360 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3362 = -_3340;
    float _3364 = fma(_1942, _3362, _3266);
    float _3366 = rsqrt(_3350);
    int _3368 = _3298 * int(_3326);
    int _3370 = _3368 + _3244;
    float _3372 = -_3356;
    float _3374 = fma(_2450, _3372, _3102);
    int _3376 = abs(_3244);
    float _3378 = -_3304;
    float _3380 = _3378 + 1.0;
    int _3382 = _3352 >> 2;
    out.m_86.x = _3330;
    int _3384 = _3358 >> 2;
    float _3386 = fma(_1666, _3380, _3294);
    float _3388 = float(uint(_3370));
    float _3390 = -_3172;
    float _3392 = _3390 + 1.0;
    int _3394 = as_type<int>(_3346) + (-2);
    float _3396 = -_3286;
    float _3398 = _3396 + 1.0;
    float _3400 = float(uint(_3376));
    float _3402 = as_type<float>(_3302) * _3388;
    int _3404 = _3382 << 4;
    int _3406 = _3404 + 368;
    float _3408 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3410 = _3384 << 4;
    int _3412 = _3410 + 800;
    float _3414 = as_type<float>(_3394) * _3400;
    uint _3416 = uint(int(uint(_3406) >> uint(2)));
    uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
    int _3420 = int(_3416) & 3;
    float _3422 = (*spvDescriptorSet0.vp_c9)._m0[int(_3418)][_3420];
    int _3424 = int(_3416) + 1;
    uint _3426 = uint(int(uint(_3424) >> uint(2)));
    int _3428 = _3424 & 3;
    float _3430 = (*spvDescriptorSet0.vp_c9)._m0[int(_3426)][_3428];
    float _3432 = _3408 * _3366;
    float _3434 = fma(_2168, _3392, _3112);
    int _3436 = abs(_3344);
    float _3438 = trunc(_3414);
    float _3440 = precise::max(_3438, 0.0);
    uint _3442 = uint(_3440);
    float _3444 = _2950 * _3432;
    float _3446 = _2966 * _3432;
    out.m_88.x = _3374;
    out.m_88.y = _3434;
    out.m_88.z = _3364;
    out.m_88.w = _3386;
    uint _3448 = uint(int(uint(_3412) >> uint(2)));
    uint _3450 = uint(int(uint(int(_3448)) >> uint(2)));
    int _3452 = int(_3448) & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    int _3456 = int(_3448) + 1;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    int _3460 = _3456 & 3;
    float _3462 = (*spvDescriptorSet0.vp_c9)._m0[int(_3458)][_3460];
    float _3464 = -_3444;
    float _3466 = _2950 + _3464;
    float _3468 = -_3446;
    float _3470 = _2966 + _3468;
    float _3472 = float(_2982);
    float _3474 = _2988 * _3432;
    int _3476 = ~_3284;
    int _3478 = _3476 + 1;
    float _3480 = _3466 * _3466;
    float _3482 = float(_3436);
    float _3484 = trunc(_3402);
    float _3486 = precise::max(_3484, 0.0);
    uint _3488 = uint(_3486);
    int _3490 = ~_3184;
    int _3492 = _3490 + 1;
    float _3494 = fma(_3470, _3470, _3480);
    int _3496 = abs(_2678);
    int _3498 = _3478 * int(_3442);
    int _3500 = _3498 + _3376;
    int _3502 = _3412 + 8;
    uint _3504 = uint(int(uint(_3502) >> uint(2)));
    uint _3506 = uint(int(uint(int(_3504)) >> uint(2)));
    int _3508 = int(_3504) & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    int _3512 = int(_3504) + 1;
    uint _3514 = uint(int(uint(_3512) >> uint(2)));
    int _3516 = _3512 & 3;
    float _3518 = (*spvDescriptorSet0.vp_c9)._m0[int(_3514)][_3516];
    float _3520 = _3482 * _3472;
    float _3522 = _3360;
    float _3524 = _3366;
    float _3526 = as_type<float>(_3496);
    if (_3066)
    {
        out.m_63.x = 0.0;
    }
    float _3528 = float(uint(_3500));
    float _3530 = -_3474;
    float _3532 = _2988 + _3530;
    int _3534 = ~_2446;
    int _3536 = _3534 + 1;
    int _3538 = _3536 + 1;
    int _3540 = _3406 + 8;
    uint _3542 = uint(int(uint(_3540) >> uint(2)));
    uint _3544 = uint(int(uint(int(_3542)) >> uint(2)));
    int _3546 = int(_3542) & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    int _3550 = int(_3542) + 1;
    uint _3552 = uint(int(uint(_3550) >> uint(2)));
    int _3554 = _3550 & 3;
    float _3556 = (*spvDescriptorSet0.vp_c9)._m0[int(_3552)][_3554];
    float _3558 = as_type<float>(_3394) * _3528;
    bool _3560 = !_2330;
    int _3562 = _3560 ? 0 : 1;
    int _3564 = int(_3326) + int(_3488);
    float _3566 = trunc(_3558);
    float _3568 = precise::max(_3566, 0.0);
    uint _3570 = uint(_3568);
    bool _3572 = _1990 != 3;
    bool _3574 = _977 == 0;
    int _3576 = _3492 * _3564;
    int _3578 = _3576 + _3244;
    int _3580 = ~_3284;
    int _3582 = _3580 + 1;
    float _3584 = _1356 + (-0.5);
    bool _3586 = !_3574;
    int _3588 = _3586 ? _2482 : (-1);
    int _3590 = _3538 * as_type<int>(_3430);
    bool _3592 = !_3572;
    int _3594 = _3592 ? 0 : (-1);
    bool _3596 = uint(_3578) >= uint(_3184);
    int _3598 = int(_3442) + int(_3570);
    bool _3600 = !_3596;
    int _3602 = _3600 ? 0 : (-1);
    int _3604 = _2488 * as_type<int>(_3462);
    int _3606 = abs(_3562);
    int _3608 = _3582 * _3598;
    int _3610 = _3608 + _3376;
    int _3612 = ~_3606;
    int _3614 = _3612 + 1;
    int _3616 = _3614 + 1;
    bool _3618 = _2328 != 3;
    int _3620 = ~_3496;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    int _3626 = _3616 * as_type<int>(_3454);
    int _3628 = _3626 + _3604;
    int _3630 = ~_3564;
    int _3632 = _3630 + _3602;
    int _3634 = _3632 + 1;
    bool _3636 = !_3618;
    int _3638 = _3636 ? 0 : (-1);
    int _3640 = _3624 * as_type<int>(_3422);
    int _3642 = _3640 + _3590;
    bool _3644 = uint(_3610) >= uint(_3284);
    int _3646 = _3184 * _3634;
    int _3648 = _3646 + _3244;
    int _3650 = abs(_2138);
    bool _3652 = !_3644;
    int _3654 = _3652 ? 0 : (-1);
    bool _3656 = _3184 == 0;
    int _3658 = abs(_2410);
    bool _3660 = !_3656;
    int _3662 = _3660 ? _3648 : (-1);
    float _3664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3666 = _3184 == 0;
    int _3668 = ~_3658;
    int _3670 = _3668 + 1;
    int _3672 = _3670 + 1;
    int _3674 = _3244 ^ _3184;
    float _3676 = -_3288;
    float _3678 = _3676 + 1.0;
    int _3680 = abs(_3594);
    int _3682 = _3672 * as_type<int>(_3510);
    int _3684 = _3682 + _3628;
    uint _3686 = uint(int(uint(_3674) >> uint(31)));
    float _3688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3690 = ~_3650;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    int _3696 = abs(_3638);
    int _3698 = ~_3654;
    int _3700 = _3598 + _3698;
    int _3702 = _3700 + 1;
    int _3704 = _3694 * as_type<int>(_3548);
    int _3706 = _3704 + _3642;
    int _3708 = ~int(_3686);
    int _3710 = _3708 + 1;
    int _3712 = ~_3680;
    int _3714 = _3712 + 1;
    int _3716 = _3714 + 1;
    int _3718 = ~_3696;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3702 ^ _3710;
    int _3726 = _3716 * as_type<int>(_3556);
    int _3728 = _3726 + _3706;
    int _3730 = abs(_2318);
    int _3732 = _3722 * as_type<int>(_3518);
    int _3734 = _3732 + _3684;
    int _3736 = ~_2472;
    int _3738 = _3736 + 1;
    int _3740 = _3738 + 1;
    float _3742 = in.m_90.x;
    float _3744 = in.m_90.y;
    float _3746 = in.m_90.z;
    int _3748 = ~_3710;
    int _3750 = _3748 + _3724;
    int _3752 = _3750 + 1;
    float _3754 = _3688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3756 = ~_3730;
    int _3758 = _3756 + 1;
    int _3760 = _3758 + 1;
    int _3762 = _3728 * _3740;
    bool _3764 = !_3666;
    int _3766 = _3764 ? _3752 : (-1);
    float _3768 = _1334 + 0.5;
    float _3770 = float(_3662);
    int _3772 = _3734 * _3760;
    float _3774 = float(_3766);
    float _3776 = _3664 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3778 = _3588 * _2472;
    int _3780 = _3778 + _3762;
    float _3782 = fma(_3754, _3770, _3308);
    int _3784 = _2610 * _3730;
    int _3786 = _3784 + _3772;
    float _3788 = -_3310;
    float _3790 = fma(_3776, _3774, _3788);
    float _3792 = _3520 * (-2.0);
    float _3794 = fma(_3754, _3768, _3782);
    float _3796 = -_3776;
    float _3798 = fma(_3796, _3584, _3790);
    float _3800 = float(_3780);
    float _3802 = -_3398;
    float _3804 = fma(_1334, _3802, _3794);
    float _3806 = float(_3786);
    float _3808 = fma(_1356, _3678, _3798);
    float _3810 = fma(_2972, _3792, _2972);
    float _3812 = fma(_3792, _3742, _3742);
    bool _3814 = !_2720;
    int _3816 = _3814 ? 0 : 1;
    out.m_92.x = _3800;
    bool _3818 = !_2724;
    int _3820 = _3818 ? 0 : 1;
    int _3822 = abs(_3816);
    out.m_92.w = _3806;
    out.m_94.x = _3804;
    out.m_94.y = _3808;
    float _3824 = _3746;
    int _3826 = _3610;
    float _3828 = _3556;
    float _3830 = _3532;
    if (_3066)
    {
        return out;
    }
    float _3832 = -_3444;
    float _3834 = _2578 + _3832;
    float _3836 = float(_2622);
    float _3838 = -_3446;
    float _3840 = _2918 + _3838;
    float _3842 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3812);
    float _3844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3846 = _3834 + _3844;
    float _3848 = float(_3822);
    float _3850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3852 = _3840 + _3850;
    float _3854 = fma(_3810, _3320, _3842);
    float _3856 = _3846 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3858 = -_3474;
    float _3860 = _2920 + _3858;
    float _3862 = _3848 * _3836;
    float _3864 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3856);
    float _3866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3868 = _3860 + _3866;
    float _3870 = _2940 + (-1.0);
    int _3872 = abs(_3820);
    float _3874 = fma(_3532, _3532, _3494);
    float _3876 = fma(_3868, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3864);
    float _3878 = _3862 * (-2.0);
    float _3880 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3882 = float(_2690);
    float _3884 = _2994 + (-1.0);
    float _3886 = fma(_3878, _3744, _3744);
    float _3888 = float(_3872);
    float _3890 = fma(_3880, _3878, _3880);
    bool _3892 = _3876 >= 0.0;
    float _3894 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3886);
    float _3896 = _3888 * _3882;
    float _3898 = _3854 * 0.15915493667125701904296875;
    float _3900 = fma(_3890, _3320, _3894);
    float _3902 = sqrt(_3874);
    float _3904 = _3896 * (-2.0);
    float _3906 = fma(_3884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3908 = _3900 * 0.15915493667125701904296875;
    float _3910 = _1162 + (-0.5);
    float _3912 = fma(_3904, _3746, _3746);
    float _3914 = fma(_3906, _3904, _3906);
    float _3916 = _3840;
    if (_3892)
    {
        _3824 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3918 = _3824;
    float _3920 = _3898 * 6.283185482025146484375;
    float _3922 = sin(_3920);
    float _3924 = fma(_3910, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3912);
    int _3926 = as_type<int>(_3918);
    if (_3892)
    {
        out.m_63.x = 0.0;
    }
    if (_3892)
    {
        float _3928 = _3918 * 5.0;
        _3926 = as_type<int>(_3928);
    }
    int _3930 = _3926;
    float _3932 = fma(_3914, _3320, _3924);
    float _3934 = _3898 * 6.283185482025146484375;
    float _3936 = cos(_3934);
    if (_3892)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11332 = as_type<float>(_3930);
        out.gl_Position.z = _11332;
    }
    float _3938 = _3932 * 0.15915493667125701904296875;
    float _3940 = _3908 * 6.283185482025146484375;
    float _3942 = sin(_3940);
    float _3944 = _3908 * 6.283185482025146484375;
    float _3946 = cos(_3944);
    if (_3892)
    {
        return out;
    }
    float _3948 = _3938 * 6.283185482025146484375;
    float _3950 = cos(_3948);
    float _3952 = _3366 * _3902;
    float _3954 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3958 = _3922 * _3942;
    float _3960 = _3360 * _3952;
    float _3962 = _3952 * _3954;
    float _3964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3966 = _3938 * 6.283185482025146484375;
    float _3968 = sin(_3966);
    float _3970 = _3936 * _3942;
    float _3972 = _3956 * _3962;
    float _3974 = _3936 * _3946;
    float _3976 = _3922 * _3946;
    float _3978 = _3964 * _3960;
    float _3980 = _3936 * _3950;
    float _3982 = _3946 * _3950;
    float _3984 = _3922 * _3950;
    float _3986 = _3942 * _3950;
    float _3988 = _3980 * _3972;
    float _3990 = _3952 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3992 = _3990 * 0.5;
    float _3994 = fma(_3968, _3974, _3958);
    float _3996 = -_3976;
    float _3998 = fma(_3968, _3970, _3996);
    float _4000 = -_3972;
    float _4002 = _3968 * _4000;
    float _4004 = -_3970;
    float _4006 = fma(_3968, _3976, _4004);
    float _4008 = fma(_3994, _3978, _3988);
    float _4010 = _3984 * _3972;
    float _4012 = fma(_3982, _3978, _4002);
    float _4014 = fma(_3968, _3958, _3974);
    float _4016 = fma(_3998, _3992, _4008);
    float _4018 = fma(_4006, _3978, _4010);
    float _4020 = fma(_3986, _3992, _4012);
    float _4022 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4024 = fma(_4014, _3992, _4018);
    float _4026 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4028 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4030 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4022);
    float _4032 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4026);
    float _4034 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4028);
    float _4036 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4030);
    float _4038 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4032);
    float _4040 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4034);
    float _4042 = _4036 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4044 = _4038 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4046 = _4040 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4048 = _2920 + _4042;
    float _4050 = _2918 + _4044;
    float _4052 = _2578 + _4046;
    float _4054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4056 = _4048 + _4054;
    float _4058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4060 = _4050 + _4058;
    float _4062 = _4056 * _4056;
    float _4064 = fma(_4060, _4060, _4062);
    float _4066 = sqrt(_4064);
    bool _4068 = _4066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4070 = _4040;
    float _4072 = _4062;
    float _4074 = _4046;
    if (!_4068)
    {
        _4070 = _4050;
    }
    float _4076 = _4070;
    float _4078 = _4076;
    if (!_4068)
    {
        _4072 = _4048;
    }
    float _4080 = _4072;
    float _4082 = _4080;
    if (!_4068)
    {
        _4074 = _4052;
    }
    float _4084 = _4074;
    bool _4086 = !_4068;
    float _4088 = _4084;
    if (!_4086)
    {
        float _4090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4094 = _4066 + _4092;
        float _4096 = rsqrt(_4064);
        float _4098 = _4094 * _4090;
        float _4100 = _4052 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4102 = _4098 * 0.15915493667125701904296875;
        float _4104 = _4102 * 6.283185482025146484375;
        float _4106 = cos(_4104);
        float _4108 = _4102 * 6.283185482025146484375;
        float _4110 = sin(_4108);
        float _4112 = _4106 + (-1.0);
        float _4114 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4116 = fma(_4110, _4100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4118 = fma(_4052, _4106, _4114);
        float _4120 = _4096 * _4116;
        float _4122 = fma(_4060, _4120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4124 = fma(_4056, _4120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4088 = _4118;
        _4078 = _4122;
        _4082 = _4124;
    }
    float _4126 = _4088;
    float _4128 = _4078;
    float _4130 = _4082;
    float _4132 = -_2578;
    float _4134 = _4132 + _4126;
    float _4136 = -_2918;
    float _4138 = _4136 + _4128;
    float _4140 = -_2920;
    float _4142 = _4140 + _4130;
    float _4144 = _4134 * _4134;
    float _4146 = fma(_4138, _4138, _4144);
    float _4148 = fma(_4142, _4142, _4146);
    float _4150 = sqrt(_4148);
    bool _4152 = _4150 > 0.0;
    bool _4154 = !_4152;
    float _4156 = _4126;
    float _4158 = _4128;
    float _4160 = _4130;
    if (!_4154)
    {
        float _4162 = _245 * _245;
        float _4164 = rsqrt(_4148);
        float _4166 = fma(_237, _237, _4162);
        float _4168 = fma(_247, _247, _4166);
        float _4170 = sqrt(_4168);
        float _4172 = _4138 * _4164;
        float _4174 = _4134 * _4164;
        float _4176 = _4142 * _4164;
        bool _4178 = _4170 > 0.0;
        bool _4180 = !_4178;
        _2976 = _4172;
        if (!_4180)
        {
            float _4182 = rsqrt(_4168);
            float _4184 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4186 = _245 * _4182;
            float _4188 = _237 * _4182;
            float _4190 = _4174 * _4186;
            float _4192 = _247 * _4182;
            float _4194 = fma(_4172, _4188, _4190);
            float _4196 = _4184 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4198 = fma(_4176, _4192, _4194);
            float _4200 = _4198 * _4196;
            float _4202 = fma(_237, _4200, _4128);
            float _4204 = fma(_245, _4200, _4126);
            float _4206 = fma(_247, _4200, _4130);
            _4156 = _4204;
            _4158 = _4202;
            _4160 = _4206;
        }
    }
    float _4208 = _4156;
    float _4210 = _4158;
    float _4212 = _4160;
    float _4214 = _2976;
    float _4216 = -_3444;
    float _4218 = _4216 + _4208;
    float _4220 = -_3446;
    float _4222 = _4220 + _4210;
    float _4224 = -_3474;
    float _4226 = _4224 + _4212;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4230 = _4218 + _4228;
    float _4232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4234 = _4222 + _4232;
    float _4236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4238 = _4226 + _4236;
    float _4240 = _4230 * _4230;
    float _4242 = fma(_4234, _4234, _4240);
    float _4244 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4246 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4248 = fma(_4238, _4238, _4242);
    float _4250 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4244);
    float _4252 = rsqrt(_4248);
    float _4254 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4250);
    float _4256 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4258 = _4254 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4260 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4256);
    float _4262 = sqrt(_4248);
    float _4264 = 1.0 / _4258;
    float _4266 = _4252 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4268 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4260);
    float _4270 = _4234 * _4266;
    float _4272 = _4238 * _4266;
    float _4274 = _4268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4276 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4278 = _4270 * _4270;
    float _4280 = _4272 * _4272;
    float _4282 = _4274 + _4258;
    float _4284 = _3834 + _4276;
    float _4286 = _4278 + _4280;
    float _4288 = _4282 * _4264;
    float _4290 = _4288 * 0.5;
    float _4292 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4294 = sqrt(_4286);
    float _4296 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4300 = fma(_4290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4298);
    float _4302 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4292);
    float _4304 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4296);
    float _4306 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4302);
    float _4308 = 1.0 / _4300;
    float _4310 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4304);
    float _4312 = _4306 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4314 = _4310 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4316 = _4294 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4318 = trunc(_4312);
    int _4320 = int(_4318);
    float _4322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4324 = _4294 + _4322;
    float _4326 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4328 = _4308 * _4326;
    float _4330 = trunc(_4314);
    int _4332 = int(_4330);
    bool _4334 = _4328 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4336 = _4328 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4338 = _4214;
    float _4340 = _4286;
    int _4342 = 2;
    float _4344 = _4278;
    float _4346 = _4280;
    if (_4316)
    {
        float _4348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4338 = _4348;
    }
    float _4350 = _4338;
    int _4352 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4354 = _4320 + _4352;
    int _4356 = _4354 + 1;
    bool _4358 = !_4334;
    int _4360 = _4358 ? 0 : 1;
    bool _4362 = _4356 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4364 = _4356;
    if (_4316)
    {
        float _4366 = rsqrt(_4286);
        _4340 = _4366;
    }
    float _4368 = _4340;
    int _4370 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4372 = _4332 + _4370;
    int _4374 = _4372 + 1;
    int _4376 = as_type<int>(_4368);
    if (!_4334)
    {
        _4342 = 1;
    }
    int _4378 = _4342;
    float _4380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4382 = _4356 | _4374;
    int _4384 = _4378;
    float _4386 = as_type<float>(_4382);
    if (!_4336)
    {
        _4384 = _4360;
    }
    int _4388 = _4384;
    bool _4390 = _4382 < 0;
    bool _4392 = _4390 || _4362;
    if (_4316)
    {
        float _4394 = _4324 * _4350;
        _4386 = _4394;
    }
    float _4396 = _4386;
    bool _4398 = _4374 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4400 = _4398 || _4392;
    if (_4316)
    {
        float _4402 = _4396 * 0.15915493667125701904296875;
        _2490 = _4402;
    }
    float _4404 = _2490;
    int _4406 = _4388 << 6;
    float _4408 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4410 = precise::max(0.0, _4380);
    int _4412 = as_type<int>(_4060);
    if (_4316)
    {
        float _4414 = _4404 * 6.283185482025146484375;
        float _4416 = sin(_4414);
        _4412 = as_type<int>(_4416);
    }
    int _4418 = _4412;
    int _4420 = _4406 + 96;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[int(_4432)][_4434];
    if (!_4316)
    {
        _3522 = _4270;
    }
    float _4438 = _3522;
    float _4440 = -_4266;
    float _4442 = -_4410;
    float _4444 = fma(_4230, _4440, _4442);
    float _4446 = _4438;
    if (!_4400)
    {
        int _4448 = _4374 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4450 = _4448 + _4356;
        _4364 = _4450;
    }
    int _4452 = _4364;
    int _4454 = _4406 + 48;
    uint _4456 = uint(int(uint(_4454) >> uint(2)));
    uint _4458 = uint(int(uint(int(_4456)) >> uint(2)));
    int _4460 = int(_4456) & 3;
    float _4462 = (*spvDescriptorSet0.vp_c15)._m0[int(_4458)][_4460];
    int _4464 = int(_4456) + 1;
    uint _4466 = uint(int(uint(_4464) >> uint(2)));
    int _4468 = _4464 & 3;
    float _4470 = (*spvDescriptorSet0.vp_c15)._m0[int(_4466)][_4468];
    float _4472 = _2972;
    if (_4316)
    {
        float _4474 = _4404 * 6.283185482025146484375;
        float _4476 = cos(_4474);
        _4472 = _4476;
    }
    float _4478 = _4472;
    if (_4316)
    {
        float _4480 = _4444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3524 = _4480;
    }
    float _4482 = _3524;
    float _4484 = _4482;
    if (!_4400)
    {
        int _4486 = _4452 << 2;
        _3826 = _4486;
    }
    int _4488 = _3826;
    int _4490 = _4418;
    int _4492 = _4488;
    if (_4316)
    {
        float _4494 = fma(as_type<float>(_4418), _4482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3526 = _4494;
    }
    float _4496 = _3526;
    int _4498 = _4406 + 64;
    uint _4500 = uint(int(uint(_4498) >> uint(2)));
    uint _4502 = uint(int(uint(int(_4500)) >> uint(2)));
    int _4504 = int(_4500) & 3;
    float _4506 = (*spvDescriptorSet0.vp_c15)._m0[int(_4502)][_4504];
    int _4508 = int(_4500) + 1;
    uint _4510 = uint(int(uint(_4508) >> uint(2)));
    int _4512 = _4508 & 3;
    float _4514 = (*spvDescriptorSet0.vp_c15)._m0[int(_4510)][_4512];
    float _4516 = _4496;
    if (!_4316)
    {
        _4484 = _4444;
    }
    float _4518 = _4484;
    float _4520 = floor(_4408);
    float _4522 = _4518;
    if (_4316)
    {
        float _4524 = _4368 * _4496;
        _4516 = _4524;
    }
    float _4526 = _4516;
    if (!_4400)
    {
        uint _4528 = uint(int(uint(_4452) >> uint(2)));
        _4490 = int(_4528);
    }
    int _4530 = _4490;
    float _4532 = as_type<float>(_4530);
    if (!_4400)
    {
        int _4534 = 12 & _4488;
        _4492 = _4534;
    }
    int _4536 = _4492;
    if (_4316)
    {
        float _4538 = _4270 * _4526;
        _4446 = _4538;
    }
    float _4540 = _4446;
    int _4542 = _4406 + 104;
    uint _4544 = uint(int(uint(_4542) >> uint(2)));
    uint _4546 = uint(int(uint(int(_4544)) >> uint(2)));
    int _4548 = int(_4544) & 3;
    float _4550 = (*spvDescriptorSet0.vp_c15)._m0[int(_4546)][_4548];
    int _4552 = int(_4544) + 1;
    uint _4554 = uint(int(uint(_4552) >> uint(2)));
    int _4556 = _4552 & 3;
    float _4558 = (*spvDescriptorSet0.vp_c15)._m0[int(_4554)][_4556];
    if (_4316)
    {
        float _4560 = _4478 + (-1.0);
        _3828 = _4560;
    }
    float _4562 = _3828;
    float _4564 = _4562;
    if (!_4400)
    {
        int _4566 = _4530 << 4;
        int _4568 = _4566 + _4536;
        _4376 = _4568;
    }
    int _4570 = _4376;
    if (_4316)
    {
        float _4572 = _4540 * _4540;
        _4344 = _4572;
    }
    float _4574 = _4344;
    float _4576 = floor(_4246);
    if (_4316)
    {
        float _4578 = _4562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3830 = _4578;
    }
    float _4580 = _3830;
    if (!_4316)
    {
        _4564 = _4272;
    }
    float _4582 = _4564;
    float _4584 = _4582;
    if (_4316)
    {
        float _4586 = _4272 * _4526;
        _4584 = _4586;
    }
    float _4588 = _4584;
    int _4590 = _4406 + 56;
    uint _4592 = uint(int(uint(_4590) >> uint(2)));
    uint _4594 = uint(int(uint(int(_4592)) >> uint(2)));
    int _4596 = int(_4592) & 3;
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[int(_4594)][_4596];
    int _4600 = int(_4592) + 1;
    uint _4602 = uint(int(uint(_4600) >> uint(2)));
    int _4604 = _4600 & 3;
    float _4606 = (*spvDescriptorSet0.vp_c15)._m0[int(_4602)][_4604];
    if (_4316)
    {
        float _4608 = fma(_4444, _4478, _4580);
        _4522 = _4608;
    }
    float _4610 = _4522;
    if (_4316)
    {
        float _4612 = _4588 * _4588;
        _4346 = _4612;
    }
    float _4614 = _4346;
    float _4616 = -_4520;
    float _4618 = _4408 + _4616;
    float _4620 = fma(_4610, _4610, _4574);
    if (!_4400)
    {
        float _4622 = floor(_4312);
        _4532 = _4622;
    }
    float _4624 = _4532;
    int _4626 = _4406 + 72;
    uint _4628 = uint(int(uint(_4626) >> uint(2)));
    uint _4630 = uint(int(uint(int(_4628)) >> uint(2)));
    int _4632 = int(_4628) & 3;
    float _4634 = (*spvDescriptorSet0.vp_c15)._m0[int(_4630)][_4632];
    int _4636 = int(_4628) + 1;
    uint _4638 = uint(int(uint(_4636) >> uint(2)));
    int _4640 = _4636 & 3;
    float _4642 = (*spvDescriptorSet0.vp_c15)._m0[int(_4638)][_4640];
    float _4644 = _4620 + _4614;
    float _4646 = rsqrt(_4644);
    float _4648 = _4284 * _4436;
    int _4650 = _4406 + 80;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    float _4668 = fma(_3840, _4428, _4648);
    float _4670 = _4284 * _4470;
    float _4672 = _4478;
    float _4674 = _4670;
    if (!_4400)
    {
        int _4676 = _4570 + 400;
        uint _4678 = uint(int(uint(_4676) >> uint(2)));
        uint _4680 = uint(int(uint(int(_4678)) >> uint(2)));
        int _4682 = int(_4678) & 3;
        float _4684 = (*spvDescriptorSet0.vp_c15)._m0[int(_4680)][_4682];
        _4672 = _4684;
    }
    float _4686 = _4672;
    float _4688 = _4646 * _4540;
    float _4690 = _4284 * _4514;
    float _4692 = fma(_3840, _4462, _4670);
    float _4694 = _4646 * _4610;
    float _4696 = _4646 * _4588;
    float _4698 = fma(_3840, _4506, _4690);
    float _4700 = _4688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_4400)
    {
        float _4702 = floor(_4314);
        _4674 = _4702;
    }
    float _4704 = _4674;
    float _4706 = fma(_3860, _4550, _4668);
    float _4708 = -_4700;
    float _4710 = fma(_4694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4708);
    float _4712 = fma(_3860, _4598, _4692);
    float _4714 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4716 = _4706 + _4558;
    float _4718 = _4712 + _4606;
    float _4720 = fma(_3860, _4634, _4698);
    float _4722 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4714);
    float _4724 = 1.0 / _4716;
    int _4726 = _4406 + 88;
    uint _4728 = uint(int(uint(_4726) >> uint(2)));
    uint _4730 = uint(int(uint(int(_4728)) >> uint(2)));
    int _4732 = int(_4728) & 3;
    float _4734 = (*spvDescriptorSet0.vp_c15)._m0[int(_4730)][_4732];
    int _4736 = int(_4728) + 1;
    uint _4738 = uint(int(uint(_4736) >> uint(2)));
    int _4740 = _4736 & 3;
    float _4742 = (*spvDescriptorSet0.vp_c15)._m0[int(_4738)][_4740];
    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4746 = fma(_4262, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4744);
    float _4748 = precise::clamp(_4746, 0.0, 1.0);
    float _4750 = _4720 + _4642;
    float _4752 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4754 = -_4696;
    float _4756 = fma(_4754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4710);
    float _4758 = -_4748;
    float _4760 = _4758 + 1.0;
    float _4762 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4722);
    float _4764 = _4284 * _4666;
    float _4766 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4768 = abs(_4760);
    float _4770 = log2(_4768);
    float _4772 = _4762 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4774 = fma(_3840, _4658, _4764);
    float _4776 = fma(_4756, 0.5, 0.5);
    float _4778 = _4772 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4780 = _4718 * _4724;
    float _4782 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4784 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4752);
    float _4786 = _4750 * _4724;
    bool _4788 = _4780 >= 0.0;
    float _4790 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4782);
    float _4792 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4784);
    float _4794 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _4796 = _4780 <= 1.0;
    bool _4798 = _4796 && _4788;
    float _4800 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4790);
    float _4802 = _4792 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4804 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4794);
    bool _4806 = _4786 >= 0.0;
    bool _4808 = _4806 && _4798;
    float _4810 = _4800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4812 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4814 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4804);
    bool _4816 = _4786 <= 1.0;
    bool _4818 = _4816 && _4808;
    float _4820 = -_4778;
    float _4822 = fma(_4820, _4766, 1.0);
    float _4824 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4812);
    float _4826 = fma(_4756, -0.5, 0.5);
    float _4828 = _4814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4830 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4832 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4824);
    float _4834 = sqrt(_4826);
    float _4836 = fma(_4776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4838 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4832);
    float _4840 = _4804;
    float _4842 = _4778;
    float _4844 = _4830;
    float _4846 = _4838;
    if (_4818)
    {
        float _4848 = float(_4388);
        _4840 = _4848;
    }
    float _4850 = _4840;
    if (!_4400)
    {
        float _4852 = rint(_4686);
        float _4854 = precise::max(_4852, 0.0);
        uint _4856 = uint(_4854);
        uint _4858 = clamp(_4856, 0u, 65535u);
        _4842 = as_type<float>(_4858);
    }
    float _4860 = _4842;
    float _4862 = fma(_3860, _4734, _4774);
    float _4864 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4866 = _4862 + _4742;
    float _4868 = fma(_4776, _4836, -0.212114393711090087890625);
    float _4870 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4872 = exp2(_4830);
    float _4874 = -_4576;
    float _4876 = _4246 + _4874;
    float _4878 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4864);
    float _4880 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4870);
    float _4882 = _4834 * 0.636619746685028076171875;
    float _4884 = _4866 * _4724;
    float _4886 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4878);
    float _4888 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4880);
    float _4890 = log2(_4822);
    float _4892 = _4888;
    if (!_4400)
    {
        float _4894 = -_4704;
        float _4896 = _4314 + _4894;
        _4844 = _4896;
    }
    float _4898 = _4844;
    float _4900 = fma(_4776, _4868, 1.570728778839111328125);
    float _4902 = _4694 + 1.0;
    float _4904 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4886);
    float _4906 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4888);
    float _4908 = -_4900;
    float _4910 = fma(_4882, _4908, 1.0);
    if (!_4400)
    {
        float _4912 = -_4624;
        float _4914 = _4312 + _4912;
        _4892 = _4914;
    }
    float _4916 = _4892;
    float _4918 = 1.0 / _4838;
    float _4920 = -_4694;
    float _4922 = fma(_4872, _4902, _4920);
    float _4924 = _4850;
    if (_4818)
    {
        float _4926 = rint(_4850);
        float _4928 = precise::max(_4926, 0.0);
        uint _4930 = uint(_4928);
        uint _4932 = clamp(_4930, 0u, 65535u);
        _4924 = as_type<float>(_4932);
    }
    float _4934 = _4924;
    float _4936 = _4890 * 0.693147182464599609375;
    float _4938 = fma(_4922, 0.5, 0.5);
    float2 _12991 = float2(_4618, _4876);
    float _4940 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12991, float2(0.0), isnan(_12991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12991, float2(0.0), isnan(_12991)), level(0.0)).x;
    float _4942 = as_type<float>(_4388);
    if (!_4400)
    {
        float3 _13009 = float3(_4916, _4898, float(as_type<int>(_4860)));
        float3 _13013 = select(_13009, float3(0.0), isnan(_13009));
        float _4944 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13013.xy, uint(rint(_13013.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13013.xy, uint(rint(_13013.z)), level(0.0)).x;
        _4942 = _4944;
    }
    float _4946 = _4942;
    float _4948 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4950 = _4904 * _4918;
    float _4952 = _4906 * _4918;
    float _4954 = fma(_4950, 0.5, 0.5);
    float _4956 = fma(_4952, -0.5, 0.5);
    float _4958 = _4934;
    if (_4818)
    {
        float3 _13042 = float3(_4780, _4786, float(as_type<int>(_4934)));
        float3 _13044 = select(_13042, float3(0.0), isnan(_13042));
        float _4960 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13044.xy, uint(rint(_13044.z)), _4884, level(0.0));
        _4958 = _4960;
    }
    float _4962 = _4958;
    float3 _13054 = float3(_4954, _4956, _4948);
    float _4964 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13054, float3(0.0), isnan(_13054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13054, float3(0.0), isnan(_13054)), level(0.0)).x;
    float3 _13063 = float3(_4954, _4956, _4948);
    float4 _4967 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13063, float3(0.0), isnan(_13063)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13063, float3(0.0), isnan(_13063)), level(0.0)).xyzw;
    float _4969 = _4967.x;
    float _4971 = _4967.y;
    float _4973 = _4967.z;
    float _4975 = _4967.w;
    float2 _13079 = float2(_4910, _4938);
    float3 _4979 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13079, float2(0.0), isnan(_13079)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13079, float2(0.0), isnan(_13079)), level(0.0)).xyz;
    float _4981 = _4979.x;
    float _4983 = _4979.y;
    float _4985 = _4979.z;
    float _4987 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4989 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4991 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4993 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4995 = fma(_4987, _4987, 1.0);
    float _4997 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4999 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4989);
    float _5001 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5003 = rsqrt(_4995);
    float _5005 = -_3968;
    float _5007 = fma(_5005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4993);
    float _5009 = -_3968;
    float _5011 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4997);
    float _5013 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5015 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4991);
    float _5017 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4999);
    float _5019 = -_3968;
    float _5021 = fma(_5019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5001);
    float _5023 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5013);
    float _5025 = abs(_4328);
    float _5027 = log2(_5025);
    float _5029 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5015);
    float _5031 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5033 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5023);
    float _5035 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5007);
    float _5037 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5011);
    float _5039 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5021);
    float _5041 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5031);
    float _5043 = _4987 * _5003;
    float _5045 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5047 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5041);
    float _5049 = -_5017;
    float _5051 = _5043 * _5049;
    float _5053 = -_5029;
    float _5055 = _5043 * _5053;
    float _5057 = -_5033;
    float _5059 = _5043 * _5057;
    float _5061 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5045);
    float _5063 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = fma(_5003, _5035, _5051);
    float _5067 = fma(_5003, _5037, _5055);
    float _5069 = fma(_5003, _5039, _5059);
    float _5071 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5073 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5075 = exp2(_5063);
    float _5077 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5079 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5071);
    float _5081 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5073);
    float _5083 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5047);
    float _5085 = _4838 * 0.5;
    out.m_96.x = _5065;
    out.m_96.y = _5067;
    out.m_96.z = _5069;
    bool _5087 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5089 = isnan(0.5);
    bool _5091 = _5087 || _5089;
    bool _5093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5095 = _5091 || _5093;
    float _5097 = fma(_4906, -0.5, _5085);
    float _5099 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5079);
    float _5101 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5081);
    float _5103 = exp2(_5077);
    float _5105 = _5083 + _4838;
    float _5107 = _4904 + _4838;
    out.gl_Position.x = _4904;
    out.gl_Position.y = _4906;
    out.gl_Position.z = _5083;
    out.gl_Position.w = _4838;
    float _5109 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5111 = precise::clamp(_5109, 0.0, 1.0);
    float _5113 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5061);
    float _5115 = _5105 * 0.5;
    float _5117 = fma(_5111, -2.0, 3.0);
    float _5119 = _5111 * _5111;
    out.m_98.x = _5099;
    out.m_98.y = _5101;
    out.m_98.z = _5113;
    float _5121 = _5107 * 0.5;
    float _5123 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5125 = _5119 * _5117;
    float _5127 = _4987 * _5035;
    float _5129 = _4987 * _5037;
    out.m_100.x = _5121;
    out.m_100.y = _5097;
    out.m_100.z = _5115;
    out.m_100.w = _4838;
    float _5131 = -_5125;
    float _5133 = _5131 + 1.0;
    bool _5135 = _4328 <= 8000.0;
    bool _5137 = isnan(_4328);
    bool _5139 = _5135 || _5137;
    bool _5141 = isnan(8000.0);
    bool _5143 = _5139 || _5141;
    float _5145 = float(_5143);
    float _5147 = _4987 * _5039;
    float _5149 = fma(_5123, _5101, _5129);
    float _5151 = fma(_5133, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5125);
    float _5153 = fma(_5123, _5099, _5127);
    float _5155 = fma(_5123, _5113, _5147);
    float _5157 = _5151;
    float _5159 = _5065;
    if (_5095)
    {
        _4846 = 1.0;
    }
    float _5161 = _4846;
    float _5163 = _5145 * _5151;
    float _5165 = _5161;
    float _5167 = _5163;
    if (!_5095)
    {
        float _5169 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5171 = _5169 * 0.15915493667125701904296875;
        float _5173 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5175 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5177 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5175;
        float _5179 = _5171 * 6.283185482025146484375;
        float _5181 = cos(_5179);
        float _5183 = _5173 * 0.15915493667125701904296875;
        float _5185 = _5171 * 6.283185482025146484375;
        float _5187 = sin(_5185);
        float _5189 = 1.0 / _5181;
        float _5191 = _5183 * 6.283185482025146484375;
        float _5193 = cos(_5191);
        float _5195 = _5187 * _5189;
        float _5197 = _5183 * 6.283185482025146484375;
        float _5199 = sin(_5197);
        float _5201 = _5193 * _5195;
        float _5203 = 1.0 / _5177;
        float _5205 = 1.0 / _5201;
        float _5207 = _5199 * _5205;
        float _5209 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5211 = fma(_4328, _5207, _5209);
        float _5213 = _5211 * _5203;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        _5157 = _5203;
        _5159 = _5189;
        _5165 = _5215;
    }
    float _5217 = _5157;
    float _5219 = _5159;
    float _5221 = _5165;
    float _5223 = _5163 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5225 = -_4940;
    float _5227 = _5225 + 1.0;
    float _5229 = -_5103;
    float _5231 = _5229 + 1.0;
    float _5233 = _5217;
    float _5235 = _5219;
    float _5237 = _5223;
    if (!_4818)
    {
        _5233 = 1.0;
    }
    float _5239 = _5233;
    float _5241 = _5017 + _5153;
    float _5243 = _5029 + _5149;
    float _5245 = _5033 + _5155;
    float _5247 = _5239;
    if (_4818)
    {
        bool _5249 = _4962 >= _4884;
        bool _5251 = isnan(_4962);
        bool _5253 = _5249 || _5251;
        bool _5255 = isnan(_4884);
        bool _5257 = _5253 || _5255;
        float _5259 = float(_5257);
        _5247 = _5259;
    }
    float _5261 = _5247;
    float _5263 = _5227 * _5223;
    float _5265 = precise::clamp(_5263, 0.0, 1.0);
    float _5267 = _5231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_4400)
    {
        _5235 = 1.0;
    }
    float _5269 = _5235;
    float _5271 = _5269;
    if (!_4400)
    {
        int _5273 = _4452 << 4;
        int _5275 = _5273 + 2048;
        uint _5277 = uint(int(uint(_5275) >> uint(2)));
        uint _5279 = uint(int(uint(int(_5277)) >> uint(2)));
        int _5281 = int(_5277) & 3;
        float _5283 = (*spvDescriptorSet0.vp_c15)._m0[int(_5279)][_5281];
        int _5285 = int(_5277) + 1;
        uint _5287 = uint(int(uint(_5285) >> uint(2)));
        int _5289 = _5285 & 3;
        float _5291 = (*spvDescriptorSet0.vp_c15)._m0[int(_5287)][_5289];
        int _5293 = _5275 + 8;
        uint _5295 = uint(int(uint(_5293) >> uint(2)));
        uint _5297 = uint(int(uint(int(_5295)) >> uint(2)));
        int _5299 = int(_5295) & 3;
        float _5301 = (*spvDescriptorSet0.vp_c15)._m0[int(_5297)][_5299];
        int _5303 = int(_5295) + 1;
        uint _5305 = uint(int(uint(_5303) >> uint(2)));
        int _5307 = _5303 & 3;
        float _5309 = (*spvDescriptorSet0.vp_c15)._m0[int(_5305)][_5307];
        float _5311 = _4284 * _5291;
        float _5313 = fma(_3840, _5283, _5311);
        float _5315 = fma(_3860, _5301, _5313);
        float _5317 = _5315 + _5309;
        float _5319 = precise::clamp(_5317, 0.0, 1.0);
        float _5321 = -_5319;
        float _5323 = _5321 + _4946;
        float _5325 = fma(_5323, 500.0, 1.5);
        float _5327 = exp2(_5325);
        float _5329 = 0.0 + _5327;
        float _5331 = precise::clamp(_5329, 0.0, 1.0);
        _5271 = _5331;
        _5167 = _5283;
        _5237 = _5291;
        _3916 = 500.0;
    }
    float _5333 = _5271;
    float _5335 = _5167;
    float _5337 = _5237;
    float _5339 = _3916;
    float _5341 = _5261 * _5333;
    float _5343 = _5267 * _4964;
    float _5345 = -_5265;
    float _5347 = fma(_5345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5349 = -_5267;
    float _5351 = _5349 + 1.0;
    out.m_102.x = _5241;
    out.m_102.y = _5243;
    out.m_102.z = _5245;
    float _5353 = _4975 * _5343;
    float _5355 = -_5341;
    float _5357 = fma(_5355, _5347, 1.0);
    float _5359 = precise::clamp(_5357, 0.0, 1.0);
    float _5361 = _4985 * _5343;
    float _5363 = _4975 * _5351;
    float _5365 = fma(_4981, _5353, _4969);
    float _5367 = fma(_4983, _5353, _4971);
    float _5369 = _5359 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5371 = fma(_4975, _5361, _4973);
    bool _5373 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5375 = isnan(_4262);
    bool _5377 = _5373 || _5375;
    bool _5379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5381 = _5377 || _5379;
    float _5383 = _5221 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _5369;
    out.m_106.x = _5365;
    out.m_106.y = _5367;
    out.m_106.z = _5371;
    out.m_106.w = _5363;
    float _5385 = _5337;
    float _5387 = _5335;
    float _5389 = _5339;
    float _5391 = _5351;
    float _5393 = _5353;
    float _5395 = _5359;
    if (!_5381)
    {
        _5385 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5397 = _5385;
    float _5399 = _5397;
    float _5401 = _5397;
    if (!_5381)
    {
        _5387 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5403 = _5387;
    float _5405 = _5403;
    float _5407 = _5403;
    if (!_5381)
    {
        _5389 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5409 = _5389;
    float _5411 = _5409;
    float _5413 = _5409;
    if (!_5381)
    {
        _5391 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5415 = _5391;
    float _5417 = _5415;
    float _5419 = _5415;
    if (!_5381)
    {
        _5393 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5421 = _5393;
    float _5423 = _5421;
    float _5425 = _5421;
    if (!_5381)
    {
        _5395 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5427 = _5395;
    bool _5429 = !_5381;
    float _5431 = _5427;
    float _5433 = _5427;
    if (!_5429)
    {
        bool _5435 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5437 = isnan(_4262);
        bool _5439 = _5435 || _5437;
        bool _5441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5443 = _5439 || _5441;
        if (!_5443)
        {
            float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5447 = _4262 + _5445;
            float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5451 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5449;
            float _5453 = 1.0 / _5451;
            float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5457 = _5455 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5463 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5465 = _5463 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5467 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5469 = _5467 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5471 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5473 = _5471 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5475 = _5447 * _5453;
            float _5477 = precise::clamp(_5475, 0.0, 1.0);
            float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5481 = _5479 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5483 = fma(_5477, _5457, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5485 = fma(_5477, _5481, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5487 = fma(_5477, _5461, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5489 = fma(_5477, _5465, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5491 = fma(_5477, _5469, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5493 = fma(_5477, _5473, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5407 = _5485;
            _5425 = _5491;
            _5401 = _5483;
            _5419 = _5489;
            _5413 = _5487;
            _5433 = _5493;
            _5495 = true;
        }
        else
        {
            bool _5497 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5499 = isnan(_4262);
            bool _5501 = _5497 || _5499;
            bool _5503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5505 = _5501 || _5503;
            if (!_5505)
            {
                _5399 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5507 = _5399;
            _5401 = _5507;
            if (!_5505)
            {
                _5405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5509 = _5405;
            _5407 = _5509;
            if (!_5505)
            {
                _5411 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5511 = _5411;
            _5413 = _5511;
            if (!_5505)
            {
                _5417 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5513 = _5417;
            _5419 = _5513;
            if (!_5505)
            {
                _5423 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5515 = _5423;
            _5425 = _5515;
            if (!_5505)
            {
                _5431 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5517 = _5431;
            bool _5519 = !_5505;
            _5433 = _5517;
            if (!_5519)
            {
                bool _5521 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5523 = isnan(_4262);
                bool _5525 = _5521 || _5523;
                bool _5527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5529 = _5525 || _5527;
                if (!_5529)
                {
                    float _5531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5533 = _4262 + _5531;
                    float _5535 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5537 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5535;
                    float _5539 = 1.0 / _5537;
                    float _5541 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5543 = _5541 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5545 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5547 = _5545 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5549 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5551 = _5549 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5553 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5555 = _5553 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5557 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5559 = _5557 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5561 = _5533 * _5539;
                    float _5563 = precise::clamp(_5561, 0.0, 1.0);
                    float _5565 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5567 = _5565 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5569 = fma(_5563, _5543, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5571 = fma(_5563, _5567, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5573 = fma(_5563, _5547, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5575 = fma(_5563, _5551, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5577 = fma(_5563, _5555, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5579 = fma(_5563, _5559, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5407 = _5571;
                    _5425 = _5577;
                    _5401 = _5569;
                    _5419 = _5575;
                    _5413 = _5573;
                    _5433 = _5579;
                    _5495 = true;
                }
                else
                {
                    _5407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5425 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5401 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5419 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5413 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5433 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5495 = false;
    float _5581 = _5407;
    float _5583 = _5425;
    float _5585 = _5401;
    float _5587 = _5419;
    float _5589 = _5413;
    float _5591 = _5433;
    float _5593 = fma(_5243, -0.5, 0.5);
    float _5595 = precise::clamp(_5593, 0.0, 1.0);
    float _5597 = -_5581;
    float _5599 = _5597 + _5583;
    float _5601 = -_5585;
    float _5603 = _5601 + _5587;
    out.m_108.x = 0.0;
    float _5605 = fma(_5595, _5599, _5581);
    float _5607 = -_5589;
    float _5609 = _5607 + _5591;
    float _5611 = fma(_5595, _5603, _5585);
    float _5613 = _5605 * 0.586610972881317138671875;
    bool _5615 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5617 = fma(_5595, _5609, _5589);
    float _5619 = _5383 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5621 = fma(_5611, 0.298911988735198974609375, _5613);
    bool _5623 = _5221 > 0.0;
    bool _5625 = isnan(_5221);
    bool _5627 = _5623 || _5625;
    bool _5629 = isnan(0.0);
    bool _5631 = _5627 || _5629;
    float _5633 = fma(_5617, 0.114477999508380889892578125, _5621);
    out.m_63.x = _5619;
    float _5635 = -_5633;
    float _5637 = _5611 + _5635;
    float _5639 = -_5633;
    float _5641 = _5605 + _5639;
    float _5643 = -_5633;
    float _5645 = _5617 + _5643;
    float _5647 = fma(_5637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    float _5649 = fma(_5641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    float _5651 = fma(_5645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    bool _5653 = !_5615;
    if (!_5653)
    {
        float _5655 = -_4218;
        float _5657 = _5655 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5659 = -_4222;
        float _5661 = _5659 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5663 = -_4226;
        float _5665 = _5663 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5667 = _5657 * _5657;
        float _5669 = fma(_5661, _5661, _5667);
        float _5671 = fma(_5665, _5665, _5669);
        float _5673 = sqrt(_5671);
        float _5675 = rsqrt(_5671);
        float _5677 = -_5673;
        float _5679 = _5677 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5681 = _5679 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5683 = precise::clamp(_5681, 0.0, 1.0);
        float _5685 = _5661 * _5675;
        float _5687 = _5657 * _5675;
        float _5689 = abs(_5683);
        float _5691 = log2(_5689);
        float _5693 = _5665 * _5675;
        float _5695 = _5685 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5697 = _5243 * _5687;
        float _5699 = -_5687;
        float _5701 = -_5695;
        float _5703 = fma(_5699, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5701);
        float _5705 = fma(_5241, _5685, _5697);
        float _5707 = -_5693;
        float _5709 = fma(_5707, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5703);
        float _5711 = fma(_5245, _5693, _5705);
        float _5713 = precise::clamp(_5711, 0.0, 1.0);
        float _5715 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5717 = _5709 + _5715;
        float _5719 = _5691 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5721 = _5717 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5723 = precise::clamp(_5721, 0.0, 1.0);
        float _5725 = exp2(_5719);
        float _5727 = _5725 * _5723;
        float _5729 = _5713 * _5727;
        float _5731 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5733 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5735 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5731;
        out.m_108.y = _5733;
        out.m_108.z = _5735;
    }
    out.m_110.x = _5647;
    out.m_110.y = _5649;
    out.m_110.z = _5651;
    if (_5631)
    {
        return out;
    }
    float _5737 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5737;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5495 = false;
    bool _787 = false;
    bool _643 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_56.w;
    float _126 = in.m_58.w;
    float _128 = trunc(_124);
    int _131 = int(_128);
    float _133 = -_126;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _135;
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
        out.m_63.x = 0.0;
    }
    int _149 = 0;
    if (!_139)
    {
        float _151 = _147 * 5.0;
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    int _155 = _153;
    if (!_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5805 = as_type<float>(_153);
        out.gl_Position.z = _5805;
    }
    if (!_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _157 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _159 = isnan(_126);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _165 = _161 || _163;
    float _167 = float(_131);
    bool _169 = _135 >= _167;
    bool _171 = !_165;
    bool _173 = _169 || _171;
    float _175 = 1.0 / _167;
    if (_173)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _143;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    float _179 = _135 * _175;
    float _181 = _179;
    if (_173)
    {
        float _183 = _177 * 5.0;
        _155 = as_type<int>(_183);
    }
    int _185 = _155;
    out.m_61.x = _179;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5868 = as_type<float>(_185);
        out.gl_Position.z = _5868;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_68.x;
    float _191 = in.m_68.y;
    float _193 = in.m_68.z;
    float _195 = in.m_70.x;
    float _197 = in.m_70.y;
    float _199 = in.m_70.z;
    float _201 = in.m_72.x;
    float _203 = in.m_72.y;
    float _205 = in.m_72.z;
    float _207 = in.m_74.x;
    float _209 = in.m_74.y;
    float _211 = in.m_74.z;
    int _213 = as_type<int>(_187) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_187) & 2;
    bool _219 = _217 != 0;
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_219;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _191 * _197;
    float _229 = _191 * _203;
    float _231 = fma(_189, _195, _227);
    float _233 = _191 * _209;
    float _235 = fma(_189, _201, _229);
    float _237 = fma(_193, _199, _231);
    bool _239 = !_215;
    float _241 = _239 ? (-0.5) : 0.5;
    float _243 = fma(_189, _207, _233);
    float _245 = fma(_193, _205, _235);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    float _267;
    if (!_249)
    {
        float _251 = in.m_76.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _179;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = 1.0 / _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _303 = 1.0 / _279;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _271 + _305;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _283;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _271 + _313;
    float _317 = _307 * _285;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _289;
    float _333 = _315 * _303;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = _271 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _271 + _339;
    bool _343 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _345 = isnan(_271);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = 1.0 / _293;
    float _357 = _337 * _311;
    float _359 = -_329;
    float _361 = _359 + 1.0;
    bool _363 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _365 = isnan(_271);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _297;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _379 = _271 + _377;
    float _381 = _379 * _331;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _385 = _271 + _383;
    float _387 = 1.0 / _301;
    float _389 = _341 * _355;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _271 + _391;
    float _395 = _385 * _375;
    bool _397 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _399 = isnan(_271);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -_373;
    float _411 = _409 + 1.0;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _407 * _361;
    float _427 = -_407;
    float _429 = _427 + 1.0;
    float _431 = _393 * _387;
    float _433 = -_423;
    float _435 = _433 + 1.0;
    float _437 = _423 * _411;
    float _439 = _373 * _429;
    bool _441 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_271);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    bool _457 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _459 = isnan(_271);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    float _473 = _451 * _435;
    float _475 = -_451;
    float _477 = _475 + 1.0;
    bool _479 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _481 = isnan(_271);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = fma(_455, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _497 = _467 * _477;
    float _499 = -_467;
    float _501 = _499 + 1.0;
    float _503 = -_489;
    float _505 = _503 + 1.0;
    float _507 = fma(_471, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _509;
    float _513 = _489 * _501;
    float _515 = _353 * _505;
    float _517 = -_353;
    float _519 = _517 + 1.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = fma(_493, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _527 = _495 * _515;
    float _529 = _507 * _515;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _531;
    float _535 = fma(_523, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _537 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].x, _527);
    float _539 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _545 = fma(_511, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _547 = fma(_525, _513, _537);
    float _549 = fma(_533, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = fma(_535, _513, _539);
    float _557 = fma(_543, _389, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _559 = fma(_545, _497, _547);
    float _561 = fma(_553, _389, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _567;
    float _571 = fma(_549, _497, _555);
    float _573 = fma(_557, _473, _559);
    float _575 = fma(_565, _381, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _577 = fma(_569, _381, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _587 = fma(_561, _473, _571);
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _589;
    float _593 = fma(_581, _431, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _595 = fma(_585, _431, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _597;
    float _601 = fma(_575, _437, _573);
    float _603 = fma(_577, _437, _587);
    float _605 = fma(_591, _395, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _607 = fma(_599, _395, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _609 = fma(_593, _439, _601);
    float _611 = fma(_595, _439, _603);
    float _613 = fma(_605, _425, _609);
    float _615 = fma(_607, _425, _611);
    float _617 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[150].x, _613);
    float _619 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[150].y, _615);
    bool _621 = !_309;
    float _623 = _587;
    float _641;
    if (!_621)
    {
        float _625 = in.m_76.x;
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        _641 = _179;
    }
    _643 = false;
    float _645 = _641;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _649 = _645 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = isnan(_645);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _671 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_645);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    bool _687 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _689 = isnan(_645);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = 1.0 / _653;
    float _701 = -_665;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _707 = _681 * _703;
    float _709 = -_681;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _669;
    float _715 = _685 * _699;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _721 = fma(_715, _649, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _723 = -_697;
    float _725 = _723 + 1.0;
    float _727 = _721 * _707;
    float _729 = _719 * _713;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _733 = _645 + _731;
    float _735 = _665 * _725;
    float _737 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _727);
    float _739 = fma(_729, _733, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _741 = fma(_739, _735, _737);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _747 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[117].x, _741);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _751 = _743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = in.m_78.x;
    float _761 = in.m_78.y;
    out.m_80.x = _751;
    out.m_80.y = _753;
    out.m_80.z = _757;
    out.m_80.w = _755;
    float _763 = _619 * _761;
    float _765 = _617 * _759;
    bool _767 = !_705;
    float _785;
    if (!_767)
    {
        float _769 = in.m_76.x;
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _773 = _769 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _777 = _775 * _771;
        float _779 = floor(_777);
        float _781 = -_779;
        float _783 = _777 + _781;
        _785 = _783;
        _787 = true;
    }
    else
    {
        _785 = _179;
    }
    _787 = false;
    float _789 = _785;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _789 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _799 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _801 = isnan(_789);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _819 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _821 = isnan(_789);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _797;
    float _833 = -_809;
    float _835 = _833 + 1.0;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _837;
    bool _841 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _843 = isnan(_789);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = _829 * _835;
    float _855 = -_829;
    float _857 = _855 + 1.0;
    bool _859 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _861 = 1.0 / _813;
    float _863 = _851 * _857;
    float _865 = -_851;
    float _867 = _865 + 1.0;
    float _869 = 1.0 / _817;
    float _871 = _839 * _831;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _877 = fma(_871, _793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _879 = _789 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _881 = isnan(_789);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = _875 * _861;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _899 = _789 + _897;
    float _901 = _877 * _863;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = _789 + _903;
    float _907 = fma(_891, _899, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _909 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _911 = _895 * _869;
    float _913 = -_889;
    float _915 = _913 + 1.0;
    float _917 = fma(_907, _853, _909);
    float _919 = fma(_911, _905, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _921 = _809 * _915;
    float _923 = fma(_919, _921, _917);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _931 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[134].x, _923);
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _927 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _933;
    out.m_82.y = _935;
    out.m_82.z = _937;
    out.m_82.w = _939;
    bool _941 = !_859;
    if (!_941)
    {
        float _943 = in.m_76.x;
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _947 = _943 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _951 = _949 * _945;
        float _953 = floor(_951);
        float _955 = -_953;
        float _957 = _951 + _955;
        _181 = _957;
    }
    float _959 = _181;
    float _961 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _963 = int(_961);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _971 = int(_969);
    float _973 = float(_963);
    float _975 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _977 = int(_975);
    if (_967)
    {
        _623 = 1.0;
    }
    float _979 = _623;
    int _981 = 0;
    float _983 = _979;
    if (_967)
    {
        _981 = 0;
    }
    int _985 = _981;
    float _987 = float(_971);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _991 = int(_989);
    float _993 = 1.0 / _973;
    float _995 = float(uint(_977));
    int _997 = ~_977;
    int _999 = _997 + 1;
    float _1001 = 1.0 / _987;
    float _1003 = float(uint(_991));
    float _1005 = _993 * _135;
    float _1007 = 1.0 / _995;
    float _1009 = _993;
    float _1011 = _987;
    int _1013 = _985;
    if (_967)
    {
        float _1015 = in.m_76.x;
        float _1017 = in.m_76.y;
        _1009 = _1015;
        _1011 = _1017;
    }
    float _1019 = _1009;
    float _1021 = _1011;
    float _1023 = _1001 * _135;
    float _1025 = 1.0 / _1003;
    float _1027 = trunc(_1005);
    int _1029 = int(_1027);
    int _1031 = as_type<int>(_1007) + (-2);
    float _1033 = trunc(_1023);
    int _1035 = int(_1033);
    int _1037 = as_type<int>(_1025) + (-2);
    float _1039 = _1025;
    float _1041 = _1019;
    float _1043 = _1021;
    if (_967)
    {
        _1039 = _1019;
    }
    float _1045 = _1039;
    float _1047 = 0.0;
    float _1049 = _1045;
    if (_967)
    {
        _1047 = _1021;
    }
    float _1051 = _1047;
    float _1053 = 0.0;
    float _1055 = _1051;
    if (_967)
    {
        _1053 = _1045;
    }
    float _1057 = _1053;
    float _1059 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1061 = int(_1059);
    float _1063 = float(uint(_1029));
    float _1065 = as_type<float>(_1031) * _1063;
    int _1067 = as_type<int>(_1063);
    float _1069 = _1057;
    if (_967)
    {
        _1067 = 0;
    }
    int _1071 = _1067;
    float _1073 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1075 = int(_1073);
    float _1077 = float(uint(_1035));
    float _1079 = as_type<float>(_1037) * _1077;
    float _1081 = _1077;
    int _1083 = _1071;
    if (_967)
    {
        _1081 = 1.0;
    }
    float _1085 = _1081;
    float _1087 = trunc(_1065);
    float _1089 = precise::max(_1087, 0.0);
    uint _1092 = uint(_1089);
    float _1094 = float(uint(_1061));
    float _1096 = 1.0 / _1094;
    float _1098 = float(_1075);
    float _1100 = trunc(_1079);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = 1.0 / _1098;
    float _1108 = _1098;
    float _1110 = _1085;
    if (_967)
    {
        _1108 = _1045;
    }
    float _1112 = _1108;
    float _1114 = _1112;
    if (!_967)
    {
        float _1116 = in.m_76.x;
        float _1118 = in.m_76.y;
        float _1120 = in.m_76.z;
        float _1122 = _1116 * 3.1415927410125732421875;
        float _1124 = _1122 * 0.15915493667125701904296875;
        float _1126 = _1118 * 3.1415927410125732421875;
        float _1128 = _1126 * 0.15915493667125701904296875;
        float _1130 = _1124 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _983 = 5.839270114898681640625;
        _1114 = _1120;
        _1110 = 7.345489978790283203125;
        _1041 = _1116;
        _1049 = _1118;
        _1043 = _1118;
        _1055 = _1136;
        _1083 = 1;
        _1013 = 2;
        _1069 = _1132;
    }
    float _1138 = _983;
    float _1140 = _1114;
    float _1142 = _1110;
    float _1144 = _1041;
    float _1146 = _1049;
    float _1148 = _1043;
    float _1150 = _1055;
    int _1152 = _1083;
    int _1154 = _1013;
    float _1156 = _1069;
    int _1158 = _999 * int(_1092);
    int _1160 = _1158 + _1029;
    float _1162 = in.m_76.z;
    float _1164 = in.m_76.w;
    int _1166 = ~_991;
    int _1168 = _1166 + 1;
    float _1170 = _1138 * _1140;
    float _1172 = _1142 * _1144;
    float _1174 = float(uint(_1160));
    float _1176 = _1106 * _135;
    int _1178 = _1168 * int(_1104);
    int _1180 = _1178 + _1035;
    float _1182 = floor(_1172);
    float _1184 = _1142 * _1146;
    float _1186 = as_type<float>(_1031) * _1174;
    float _1188 = float(_977);
    float _1190 = _1144 * 2.0;
    float _1192 = float(uint(_1180));
    float _1194 = in.m_74.w;
    float _1196 = float(_1029);
    float _1198 = trunc(_1186);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = as_type<float>(_1037) * _1192;
    bool _1206 = _1196 >= _1188;
    bool _1208 = isnan(_1196);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(_1188);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1220 = _959 + _1218;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1224 = _1222 != 0;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1228 = _959 + _1226;
    bool _1230 = _1148 > 0.5;
    float _1232 = trunc(_1176);
    int _1234 = int(_1232);
    bool _1236 = _1164 > 0.5;
    float _1238 = -_1182;
    float _1240 = _1172 + _1238;
    bool _1242 = _1162 > 0.5;
    float _1244 = in.m_72.w;
    int _1246 = as_type<int>(_1096) + (-2);
    float _1248 = _1148 + _1144;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1260 = _1258 != 0;
    float _1262 = trunc(_1204);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    int _1268 = int(_1092) + int(_1202);
    float _1270 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1272 = ~_991;
    int _1274 = _1272 + 1;
    int _1276 = ~_977;
    int _1278 = _1276 + 1;
    float _1280 = floor(_1170);
    float _1282 = float(uint(_1234));
    int _1284 = _1278 * _1268;
    int _1286 = _1284 + _1029;
    int _1288 = int(_1236);
    int _1290 = _1242 ? 2 : 0;
    int _1292 = _1288 | _1290;
    int _1294 = _1224 ? 4 : 0;
    int _1296 = _1292 | _1294;
    int _1298 = _1252 ? 8 : 0;
    int _1300 = _1296 | _1298;
    int _1302 = _1256 ? 16 : 0;
    int _1304 = _1300 | _1302;
    int _1306 = _1260 ? 32 : 0;
    int _1308 = _1304 | _1306;
    int _1310 = _1230 ? 64 : 0;
    int _1312 = _1308 | _1310;
    int _1314 = _1312 & 64;
    bool _1316 = !_1224;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = as_type<float>(_1246) * _1282;
    float _1322 = -_241;
    int _1324 = _1230 ? as_type<int>(_1322) : as_type<int>(_241);
    float _1326 = trunc(_1216);
    int _1328 = int(_1326);
    int _1330 = int(_1104) + int(_1266);
    bool _1332 = !_1256;
    float _1334 = _1332 ? _241 : as_type<float>(_1324);
    int _1336 = abs(_1318);
    int _1338 = ~_1061;
    int _1340 = _1338 + 1;
    float _1342 = floor(_1184);
    float _1344 = -_225;
    int _1346 = _1242 ? as_type<int>(_1344) : as_type<int>(_225);
    float _1348 = -_1280;
    float _1350 = _1170 + _1348;
    float _1352 = float(_991);
    bool _1354 = !_1260;
    float _1356 = _1354 ? _225 : as_type<float>(_1346);
    float _1358 = _1240 * _1188;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1370 = _1368 != 0;
    float _1372 = trunc(_1320);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    bool _1378 = uint(_1286) >= uint(_977);
    int _1380 = _1274 * _1330;
    int _1382 = _1380 + _1035;
    float _1384 = float(_1035);
    bool _1386 = !_1366;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = -_1342;
    float _1392 = _1184 + _1390;
    bool _1394 = !_1362;
    int _1396 = _1394 ? 0 : 1;
    float _1398 = trunc(_1358);
    int _1400 = int(_1398);
    bool _1402 = uint(_1382) >= uint(_991);
    float _1404 = _1350 * _1352;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1408 = _1406 != 0;
    bool _1410 = !_1378;
    int _1412 = _1410 ? 0 : (-1);
    bool _1414 = _1384 >= _1352;
    bool _1416 = isnan(_1384);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(_1352);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    int _1426 = _1340 * int(_1376);
    int _1428 = _1426 + _1234;
    bool _1430 = !_1370;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = trunc(_1404);
    int _1436 = int(_1434);
    bool _1438 = !_1408;
    int _1440 = _1438 ? 0 : 1;
    bool _1442 = !_1402;
    int _1444 = _1442 ? 0 : (-1);
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1448 = _1446 != 0;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1452 = _1450 != 0;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1456 = _1454 != 0;
    int _1458 = _1400 * _1336;
    int _1460 = _1458 + _1029;
    int _1462 = ~_1268;
    int _1464 = _1462 + _1412;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1424);
    int _1470 = int(_1468);
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1474 = _1472 != 0;
    bool _1476 = !_1452;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = _977 * _1466;
    int _1482 = _1480 + _1029;
    bool _1484 = !_1474;
    int _1486 = _1484 ? 0 : 1;
    bool _1488 = _977 == 0;
    float _1490 = floor(_1190);
    bool _1492 = _1314 != 0;
    int _1494 = abs(_1486);
    float _1496 = float(uint(_1428));
    int _1498 = ~_1330;
    int _1500 = _1498 + _1444;
    int _1502 = _1500 + 1;
    float _1504 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1506 = log2(_1504);
    bool _1508 = !_1488;
    int _1510 = _1508 ? _1482 : (-1);
    float _1512 = _175 * _135;
    float _1514 = as_type<float>(_1246) * _1496;
    bool _1516 = !_1448;
    int _1518 = _1516 ? 0 : 1;
    int _1520 = _991 * _1502;
    int _1522 = _1520 + _1035;
    float _1524 = _1188 * _1512;
    bool _1526 = _991 == 0;
    float _1528 = _1352 * _1512;
    int _1530 = ~_1328;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    float _1536 = trunc(_1514);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    int _1542 = ~_1470;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _1436 * _1494;
    int _1550 = _1548 + _1035;
    bool _1552 = !_1526;
    int _1554 = _1552 ? _1522 : (-1);
    int _1556 = _1510 * _1534;
    int _1558 = _977 + (-1);
    float _1560 = _1506 * _135;
    int _1562 = _991 + (-1);
    float _1564 = trunc(_1524);
    int _1566 = int(_1564);
    int _1568 = _1554 * _1546;
    int _1570 = abs(_1388);
    int _1572 = _1328 * _1558;
    int _1574 = _1572 + _1556;
    int _1576 = abs(_1478);
    int _1578 = _1470 * _1562;
    int _1580 = _1578 + _1568;
    int _1582 = abs(_1432);
    int _1584 = _1574 * _1570;
    float _1586 = trunc(_1528);
    int _1588 = int(_1586);
    int _1590 = abs(_1396);
    int _1592 = ~_1061;
    int _1594 = _1592 + 1;
    int _1596 = _1580 * _1576;
    int _1598 = int(_1376) + int(_1540);
    int _1600 = _1566 * _1590;
    int _1602 = _1600 + _1584;
    int _1604 = abs(_1440);
    int _1606 = abs(_1518);
    int _1608 = _1460 * _1582;
    int _1610 = _1608 + _1602;
    float _1612 = -_225;
    int _1614 = _1236 ? as_type<int>(_1612) : as_type<int>(_225);
    int _1616 = _1594 * _1598;
    int _1618 = _1616 + _1234;
    float _1620 = float(_1234);
    int _1622 = _1400 * _1604;
    int _1624 = _1622 + _1610;
    float _1626 = float(_1061);
    int _1628 = _1588 * _1606;
    int _1630 = _1628 + _1596;
    bool _1632 = uint(_1618) >= uint(_1061);
    float _1634 = -_241;
    int _1636 = _1242 ? as_type<int>(_1634) : as_type<int>(_241);
    float _1638 = _1626 * _1512;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1642 = _1640 != 0;
    float _1644 = _1392 * _1626;
    float _1646 = float(uint(_1624));
    bool _1648 = !_1642;
    int _1650 = _1648 ? 0 : 1;
    float _1652 = trunc(_1638);
    int _1654 = int(_1652);
    bool _1656 = !_1456;
    int _1658 = _1656 ? 0 : 1;
    float _1660 = as_type<float>(_1031) * _1646;
    int _1662 = abs(_1650);
    bool _1664 = !_1252;
    float _1666 = _1664 ? _225 : as_type<float>(_1614);
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1670 = _1668 != 0;
    float _1672 = trunc(_1660);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = abs(_1658);
    bool _1680 = _1620 >= _1626;
    bool _1682 = isnan(_1620);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(_1626);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    bool _1692 = !_1670;
    int _1694 = _1692 ? 0 : 1;
    int _1696 = _1550 * _1678;
    int _1698 = _1696 + _1630;
    bool _1700 = !_1632;
    int _1702 = _1700 ? 0 : (-1);
    float _1704 = trunc(_1690);
    int _1706 = int(_1704);
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1710 = _1708 != 0;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1714 = _1712 != 0;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1718 = _1716 != 0;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1722 = _1720 != 0;
    int _1724 = ~_1598;
    int _1726 = _1724 + _1702;
    int _1728 = _1726 + 1;
    int _1730 = _1436 * _1662;
    int _1732 = _1730 + _1698;
    int _1734 = abs(_1694);
    int _1736 = ~_977;
    int _1738 = _1736 + 1;
    int _1740 = _1061 * _1728;
    int _1742 = _1740 + _1234;
    bool _1744 = !_1714;
    int _1746 = _1744 ? 0 : 1;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1750 = _1748 != 0;
    float _1752 = trunc(_1644);
    int _1754 = int(_1752);
    bool _1756 = !_1710;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = _1738 * int(_1676);
    int _1762 = _1760 + _1624;
    bool _1764 = _1061 == 0;
    float _1766 = float(uint(_1732));
    float _1768 = float(uint(_1762));
    int _1770 = ~_1706;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = as_type<float>(_1037) * _1766;
    bool _1778 = !_1764;
    int _1780 = _1778 ? _1742 : (-1);
    float _1782 = as_type<float>(_1698);
    float _1784 = as_type<float>(_1676);
    float _1786 = as_type<float>(_1494);
    float _1788 = as_type<float>(_1152);
    float _1790 = as_type<float>(_1154);
    if (_1750)
    {
        float _1792 = in.m_76.w;
        _1782 = _1792;
    }
    float _1794 = _1782;
    float _1796 = as_type<float>(_1031) * _1768;
    float _1798 = trunc(_1776);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    int _1804 = abs(_1746);
    int _1806 = _1780 * _1774;
    int _1808 = _1061 + (-1);
    int _1810 = abs(_1758);
    float _1812 = trunc(_1796);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    int _1818 = _1706 * _1808;
    int _1820 = _1818 + _1806;
    int _1822 = ~_977;
    int _1824 = _1822 + 1;
    int _1826 = _1754 * _1734;
    int _1828 = _1826 + _1234;
    bool _1830 = _977 == 0;
    int _1832 = _1820 * _1804;
    int _1834 = ~_991;
    int _1836 = _1834 + 1;
    float _1838 = as_type<float>(_1804);
    float _1840 = as_type<float>(_1734);
    if (!_1750)
    {
        _1838 = _241;
    }
    float _1842 = _1838;
    int _1844 = _1654 * _1810;
    int _1846 = _1844 + _1832;
    bool _1848 = !_1718;
    int _1850 = _1848 ? 0 : 1;
    float _1852 = _1842;
    if (_1750)
    {
        float _1854 = _1794 * 3.1415927410125732421875;
        _1840 = _1854;
    }
    float _1856 = _1840;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1860 = _1858 != 0;
    int _1862 = _1836 * int(_1802);
    int _1864 = _1862 + _1732;
    int _1866 = int(_1676) + int(_1816);
    if (_1750)
    {
        float _1868 = _1856 * 0.15915493667125701904296875;
        _1784 = _1868;
    }
    float _1870 = _1784;
    int _1872 = abs(_1850);
    float _1874 = float(uint(_1864));
    int _1876 = _1824 * _1866;
    int _1878 = _1876 + _1624;
    bool _1880 = !_1722;
    int _1882 = _1880 ? 0 : 1;
    float _1884 = _1870;
    if (_1750)
    {
        float _1886 = _1870 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        _1884 = _1888;
    }
    float _1890 = _1884;
    float _1892 = as_type<float>(_1037) * _1874;
    int _1894 = abs(_1882);
    int _1896 = _1828 * _1872;
    int _1898 = _1896 + _1846;
    bool _1900 = uint(_1878) >= uint(_977);
    float _1902 = _1644;
    if (_1860)
    {
        float _1904 = in.m_76.x;
        _1902 = _1904;
    }
    float _1906 = _1902;
    float _1908 = float(uint(_1460));
    int _1910 = _1754 * _1894;
    int _1912 = _1910 + _1898;
    bool _1914 = !_1900;
    int _1916 = _1914 ? 0 : (-1);
    float _1918 = trunc(_1892);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1926 = _1924 != 0;
    float _1928 = as_type<float>(_1031) * _1908;
    int _1930 = ~_1866;
    int _1932 = _1930 + _1916;
    int _1934 = _1932 + 1;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1940 = !_1926;
    float _1942 = _1940 ? _241 : as_type<float>(_1636);
    float _1944 = float(uint(_1912));
    float _1946 = trunc(_1928);
    float _1948 = precise::max(_1946, 0.0);
    uint _1950 = uint(_1948);
    int _1952 = _977 * _1934;
    int _1954 = _1952 + _1624;
    bool _1956 = _1926;
    float _1958 = _1944;
    if (_1750)
    {
        bool _1960 = _1890 > 0.5;
        _1956 = _1960;
    }
    bool _1962 = _1956;
    float _1964 = as_type<float>(_1246) * _1944;
    int _1966 = ~_977;
    int _1968 = _1966 + 1;
    bool _1970 = !_1830;
    int _1972 = _1970 ? _1954 : (-1);
    float _1974 = 1.0 / _1938;
    if (_1750)
    {
        float _1976 = -_241;
        float _1978 = _1962 ? _1976 : _241;
        _1852 = _1978;
    }
    float _1980 = _1852;
    int _1982 = _1972 & 3;
    bool _1984 = _1982 != 0;
    if (_1860)
    {
        float _1986 = _1906 * 3.1415927410125732421875;
        _1958 = _1986;
    }
    float _1988 = _1958;
    int _1990 = _1972 & 3;
    bool _1992 = _1990 != 0;
    int _1994 = int(_1802) + int(_1922);
    float _1996 = trunc(_1964);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    int _2002 = _1968 * int(_1950);
    int _2004 = _2002 + _1460;
    int _2006 = ~_1061;
    int _2008 = _2006 + 1;
    float _2010 = _1988;
    if (_1860)
    {
        float _2012 = _1988 * 0.15915493667125701904296875;
        _2010 = _2012;
    }
    float _2014 = _2010;
    int _2016 = _1984 ? 0 : 1;
    bool _2018 = uint(_1990) > 1u;
    float _2020 = float(uint(_1550));
    float _2022 = _2014;
    if (_1860)
    {
        float _2024 = _2014 * 6.283185482025146484375;
        float _2026 = sin(_2024);
        _2022 = _2026;
    }
    float _2028 = _2022;
    float _2030 = float(uint(_2004));
    float _2032 = as_type<float>(_1037) * _2020;
    int _2034 = ~_991;
    int _2036 = _2034 + 1;
    float _2038 = as_type<float>(_1031) * _2030;
    int _2040 = ~_2016;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _2008 * int(_2000);
    int _2048 = _2046 + _1912;
    float _2050 = trunc(_2032);
    float _2052 = precise::max(_2050, 0.0);
    uint _2054 = uint(_2052);
    int _2056 = _2036 * _1994;
    int _2058 = _2056 + _1732;
    float _2060 = -_225;
    int _2062 = _1492 ? as_type<int>(_2060) : as_type<int>(_225);
    float _2064 = float(uint(_2048));
    bool _2066 = uint(_1990) >= 2u;
    int _2068 = _2044;
    if (!_2018)
    {
        int _2070 = ~_2016;
        int _2072 = _2070 + 1;
        _2068 = _2072;
    }
    int _2074 = _2068;
    float _2076 = as_type<float>(_1246) * _2064;
    bool _2078 = uint(_2058) >= uint(_991);
    float _2080 = trunc(_2038);
    float _2082 = precise::max(_2080, 0.0);
    uint _2084 = uint(_2082);
    int _2086 = _2066 ? 0 : 1;
    bool _2088 = _1990 != 3;
    bool _2090 = !_2078;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = ~_991;
    int _2096 = _2094 + 1;
    float _2098 = trunc(_2076);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    int _2104 = ~_1994;
    int _2106 = _2104 + _2092;
    int _2108 = _2106 + 1;
    int _2110 = _2096 * int(_2054);
    int _2112 = _2110 + _1550;
    int _2114 = ~_2086;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _991 * _2108;
    int _2122 = _2120 + _1732;
    int _2124 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2126 = _2124 != 0;
    int _2128 = _2118;
    bool _2130 = _2088;
    float _2132 = 2.8025969286496341418474591665798e-45;
    if (_2088)
    {
        int _2134 = ~_2086;
        int _2136 = _2134 + 1;
        _2128 = _2136;
    }
    int _2138 = _2128;
    if (_1860)
    {
        bool _2140 = _2028 > 0.5;
        _2130 = _2140;
    }
    bool _2142 = _2130;
    bool _2144 = !_1526;
    int _2146 = _2144 ? _2122 : (-1);
    float _2148 = float(uint(_2112));
    if (!_1860)
    {
        _2132 = _225;
    }
    float _2150 = _2132;
    float _2152 = _2150;
    if (_1860)
    {
        float _2154 = -_225;
        float _2156 = _2142 ? _2154 : _225;
        _2152 = _2156;
    }
    float _2158 = _2152;
    float _2160 = as_type<float>(_1037) * _2148;
    int _2162 = _2146 & 3;
    bool _2164 = _2162 != 0;
    bool _2166 = !_2126;
    float _2168 = _2166 ? _225 : as_type<float>(_2062);
    int _2170 = int(_2000) + int(_2102);
    float _2172 = trunc(_2160);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    int _2178 = ~_1061;
    int _2180 = _2178 + 1;
    int _2182 = _2146 & 3;
    bool _2184 = _2182 != 0;
    bool _2186 = uint(_2162) > 1u;
    int _2188 = _2180 * _2170;
    int _2190 = _2188 + _1912;
    int _2192 = int(_1950) + int(_2084);
    int _2194 = ~_977;
    int _2196 = _2194 + 1;
    int _2198 = _2184 ? 0 : 1;
    int _2200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2202 = _2200 != 0;
    int _2204 = _2196 * _2192;
    int _2206 = _2204 + _1460;
    float _2208 = float(uint(_1828));
    bool _2210 = !_2202;
    int _2212 = _2210 ? 0 : 1;
    bool _2214 = uint(_2190) >= uint(_1061);
    float _2216 = as_type<float>(_1246) * _2208;
    int _2218 = ~_2198;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2222;
    if (!_2186)
    {
        int _2226 = ~_2198;
        int _2228 = _2226 + 1;
        _2224 = _2228;
    }
    int _2230 = _2224;
    bool _2232 = uint(_2206) >= uint(_977);
    float _2234 = trunc(_2216);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    bool _2240 = !_2214;
    int _2242 = _2240 ? 0 : (-1);
    bool _2244 = _2162 != 3;
    bool _2246 = !_2232;
    int _2248 = _2246 ? 0 : (-1);
    bool _2250 = uint(_2162) >= 2u;
    int _2252 = ~_2170;
    int _2254 = _2252 + _2242;
    int _2256 = _2254 + 1;
    int _2258 = ~_991;
    int _2260 = _2258 + 1;
    int _2262 = int(_2054) + int(_2176);
    int _2264 = _1061 * _2256;
    int _2266 = _2264 + _1912;
    int _2268 = ~_1061;
    int _2270 = _2268 + 1;
    int _2272 = _2250 ? 0 : 1;
    int _2274 = _2260 * _2262;
    int _2276 = _2274 + _1550;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2280 = _2278 != 0;
    int _2282 = ~_2272;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = _2286;
    int _2290 = _2230;
    if (_2244)
    {
        int _2292 = ~_2272;
        int _2294 = _2292 + 1;
        _2288 = _2294;
    }
    int _2296 = _2288;
    int _2298 = _2270 * int(_2238);
    int _2300 = _2298 + _1828;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2304 = _2302 != 0;
    bool _2306 = !_2280;
    int _2308 = _2306 ? 0 : 1;
    bool _2310 = uint(_2276) >= uint(_991);
    bool _2312 = !_1764;
    int _2314 = _2312 ? _2266 : (-1);
    bool _2316 = !_2304;
    int _2318 = _2316 ? 0 : 1;
    bool _2320 = !_2310;
    int _2322 = _2320 ? 0 : (-1);
    int _2324 = _2314 & 3;
    bool _2326 = _2324 != 0;
    int _2328 = _2314 & 3;
    bool _2330 = _2328 != 0;
    float _2332 = float(uint(_2300));
    int _2334 = _2326 ? 0 : 1;
    bool _2336 = uint(_2328) > 1u;
    float _2338 = as_type<float>(_1246) * _2332;
    int _2340 = ~_2334;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    float _2346 = trunc(_2338);
    float _2348 = precise::max(_2346, 0.0);
    uint _2350 = uint(_2348);
    int _2352 = ~_2262;
    int _2354 = _2352 + _2322;
    int _2356 = _2354 + 1;
    float _2358 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2360 = _2358 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2364 = _2362 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2366 = _2344;
    if (!_2336)
    {
        int _2368 = ~_2334;
        int _2370 = _2368 + 1;
        _2366 = _2370;
    }
    int _2372 = _2366;
    bool _2374 = uint(_2328) >= 2u;
    float _2376 = 1.0 / _2360;
    int _2378 = ~_1061;
    int _2380 = _2378 + 1;
    int _2382 = _2374 ? 0 : 1;
    bool _2384 = _2328 != 3;
    int _2386 = int(_2238) + int(_2350);
    float _2388 = 1.0 / _2364;
    int _2390 = ~_2382;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    int _2396 = _2380 * _2386;
    int _2398 = _2396 + _1828;
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2400;
    int _2404 = _2394;
    if (_2384)
    {
        int _2406 = ~_2382;
        int _2408 = _2406 + 1;
        _2404 = _2408;
    }
    int _2410 = _2404;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2414 = uint(_2398) >= uint(_1061);
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2418 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2412);
    bool _2420 = !_2414;
    int _2422 = _2420 ? 0 : (-1);
    float _2424 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _2426 = _1144 > 0.5;
    float _2428 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2418);
    float _2430 = -_241;
    int _2432 = _2426 ? as_type<int>(_2430) : as_type<int>(_241);
    int _2434 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2436 = _2434 != 0;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2440 = in.m_56.x;
    float _2442 = in.m_56.y;
    float _2444 = in.m_56.z;
    int _2446 = abs(_2074);
    bool _2448 = !_2436;
    float _2450 = _2448 ? _241 : as_type<float>(_2432);
    float _2452 = fma(_2424, -2.0, _2438);
    bool _2454 = _1152 != 1;
    float _2456 = _1248 + (-1.0);
    int _2458 = ~_2386;
    int _2460 = _2458 + _2422;
    int _2462 = _2460 + 1;
    float _2464 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2452);
    int _2466 = ~_2192;
    int _2468 = _2466 + _2248;
    int _2470 = _2468 + 1;
    int _2472 = abs(_2212);
    int _2474 = _1061 * _2462;
    int _2476 = _2474 + _1828;
    int _2478 = abs(_2372);
    int _2480 = _977 * _2470;
    int _2482 = _2480 + _1460;
    int _2484 = ~_2478;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = as_type<float>(_2462);
    if (!_2454)
    {
        _1786 = _1148;
    }
    float _2492 = _1786;
    float _2494 = 0.0;
    float _2496 = _2492;
    if (!_2454)
    {
        _2494 = _1148;
    }
    float _2498 = _2494;
    float _2500 = 0.0;
    float _2502 = _2498;
    if (!_2454)
    {
        _2500 = _1162;
    }
    float _2504 = _2500;
    float _2506 = _197 * _2442;
    float _2508 = _2504;
    if (!_2454)
    {
        _1788 = _1162;
    }
    float _2510 = _1788;
    float _2512 = _1148 * 2.0;
    float _2514 = _2510;
    if (_2454)
    {
        _2496 = _1144;
    }
    float _2516 = _2496;
    float _2518 = _203 * _2442;
    if (_2454)
    {
        _2502 = _1144;
    }
    float _2520 = _2502;
    float _2522 = _209 * _2442;
    if (_2454)
    {
        _2508 = _1148;
    }
    float _2524 = _2508;
    float _2526 = fma(_195, _2440, _2506);
    if (_2454)
    {
        _2514 = _1148;
    }
    float _2528 = _2514;
    float _2530 = floor(_2512);
    bool _2532 = _1154 != 2;
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2538 = fma(_201, _2440, _2518);
    float _2540 = fma(_207, _2440, _2522);
    float _2542 = fma(_199, _2444, _2526);
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2546 = fma(_205, _2444, _2538);
    float _2548 = fma(_211, _2444, _2540);
    float _2550 = _1162 * 2.0;
    float _2552 = 1.0 / _2536;
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2554;
    float _2558 = 0.0;
    float _2560 = _2544;
    if (_2532)
    {
        _2558 = _1144;
    }
    float _2562 = _2558;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2568 = _2562;
    if (_2532)
    {
        _1790 = _1148;
    }
    float _2570 = _1790;
    float _2572 = _2556 * _1974;
    float _2574 = _2570;
    if (!_2532)
    {
        _2568 = _1162;
    }
    float _2576 = _2568;
    float _2578 = _2546 + _1244;
    if (!_2532)
    {
        _2574 = _1144;
    }
    float _2580 = _2574;
    float _2582 = floor(_2550);
    bool _2584 = _1490 >= 0.0;
    bool _2586 = isnan(_1490);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan(0.0);
    bool _2592 = _2588 || _2590;
    float _2594 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2596 = _2592 ? 0 : 1;
    bool _2598 = _1490 > 0.0;
    float _2600 = 1.0 / _2566;
    int _2602 = ~_2596;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    bool _2608 = !_1764;
    int _2610 = _2608 ? _2476 : (-1);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2614 = _2612 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2616 = _2606;
    if (!_2598)
    {
        int _2618 = ~_2596;
        int _2620 = _2618 + 1;
        _2616 = _2620;
    }
    int _2622 = _2616;
    float _2624 = 1.0 / _2614;
    bool _2626 = _2530 >= 0.0;
    bool _2628 = isnan(_2530);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan(0.0);
    bool _2634 = _2630 || _2632;
    int _2636 = _2634 ? 0 : 1;
    bool _2638 = _2530 > 0.0;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2642 = _2640 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2648;
    int _2652 = ~_2636;
    int _2654 = _2652 + 1;
    int _2656 = _2654 + 1;
    float _2658 = 1.0 / _2642;
    float _2660 = _2646 * _2388;
    float _2662 = _2650 * _2376;
    int _2664 = _991 * _2356;
    int _2666 = _2664 + _1550;
    float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2670 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2668;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2676 = !_1992;
    int _2678 = _2676 ? 0 : 1;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2684 = _2656;
    if (!_2638)
    {
        int _2686 = ~_2636;
        int _2688 = _2686 + 1;
        _2684 = _2688;
    }
    int _2690 = _2684;
    float _2692 = _2670 * _2624;
    bool _2694 = !_1526;
    int _2696 = _2694 ? _2666 : (-1);
    float _2698 = _2674 * _2600;
    bool _2700 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2702 = isnan(_959);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2708 = _2704 || _2706;
    float _2710 = float(_2708);
    float _2712 = _2682 * _2552;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2716 = _2714 != 0;
    int _2718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2720 = _2718 != 0;
    int _2722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2724 = _2722 != 0;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2728 = _959 + _2726;
    bool _2730 = _2582 >= 0.0;
    bool _2732 = isnan(_2582);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(0.0);
    bool _2738 = _2734 || _2736;
    float _2740 = -_2710;
    float _2742 = _2740 + 1.0;
    bool _2744 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2746 = isnan(_959);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2752 = _2748 || _2750;
    float _2754 = float(_2752);
    float _2756 = _2402 * _2658;
    int _2758 = _2738 ? 0 : 1;
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2762 = _959 + _2760;
    bool _2764 = _2582 > 0.0;
    float _2766 = _2754 * _2742;
    bool _2768 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2770 = isnan(_959);
    bool _2772 = _2768 || _2770;
    bool _2774 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2776 = _2772 || _2774;
    float _2778 = float(_2776);
    float _2780 = -_2754;
    float _2782 = _2780 + 1.0;
    bool _2784 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2786 = isnan(_959);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = fma(_2660, _2762, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2798 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2800 = isnan(_959);
    bool _2802 = _2798 || _2800;
    bool _2804 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2806 = _2802 || _2804;
    float _2808 = float(_2806);
    float _2810 = _2778 * _2782;
    float _2812 = -_2778;
    float _2814 = _2812 + 1.0;
    float _2816 = -_2794;
    float _2818 = _2816 + 1.0;
    float _2820 = fma(_2572, _2728, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2822 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2824 = isnan(_959);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2830 = _2826 || _2828;
    float _2832 = float(_2830);
    float _2834 = _2794 * _2814;
    float _2836 = in.m_70.w;
    float _2838 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2840 = _959 + _2838;
    float _2842 = _2808 * _2818;
    float _2844 = -_2808;
    float _2846 = _2844 + 1.0;
    bool _2848 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2850 = isnan(_959);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2856 = _2852 || _2854;
    float _2858 = float(_2856);
    float _2860 = fma(_2662, _2840, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2864 = _959 + _2862;
    float _2866 = _2832 * _2846;
    float _2868 = -_2832;
    float _2870 = _2868 + 1.0;
    bool _2872 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2874 = isnan(_959);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2880 = _2876 || _2878;
    float _2882 = float(_2880);
    float _2884 = -_2858;
    float _2886 = _2884 + 1.0;
    float _2888 = fma(_2712, _2864, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2892 = _959 + _2890;
    float _2894 = _2858 * _2870;
    float _2896 = _2882 * _2886;
    float _2898 = -_2882;
    float _2900 = _2898 + 1.0;
    float _2902 = fma(_2692, _2892, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2904 = _2820 * _2896;
    float _2906 = fma(_2698, _1220, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2908 = ~_2758;
    int _2910 = _2908 + 1;
    int _2912 = _2910 + 1;
    float _2914 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2904);
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2918 = _2542 + _2836;
    float _2920 = _2548 + _1194;
    float _2922 = fma(_2796, _2894, _2914);
    float _2924 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2926 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2916);
    float _2928 = fma(_2860, _2866, _2922);
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2932 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2924);
    float _2934 = _1148 + (-0.5);
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2938 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2930);
    float _2940 = _1148 + _1162;
    float _2942 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2936);
    float _2944 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2946 = fma(_2888, _2842, _2928);
    float _2948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2950 = _2578 + _2948;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2954 = -_2416;
    float _2956 = fma(_2944, 2.0, _2954);
    int _2958 = _2146 >> 31;
    float _2960 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2962 = fma(_1270, -2.0, _2952);
    float _2964 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2966 = _2918 + _2964;
    float _2968 = _2950 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2970 = _2958 & 3;
    float _2972 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2974 = _2912;
    float _2976 = _2920;
    if (!_2764)
    {
        int _2978 = ~_2758;
        int _2980 = _2978 + 1;
        _2974 = _2980;
    }
    int _2982 = _2974;
    float _2984 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2960);
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2988 = _2920 + _2986;
    float _2990 = fma(_2966, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2968);
    float _2992 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2994 = _1144 + _1162;
    float _2996 = _1144 + (-0.5);
    int _2998 = _2146 + _2970;
    float _3000 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2990);
    float _3002 = -_135;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2956);
    int _3006 = _2998 >> 2;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3010 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _3012 = _3006 << 4;
    int _3014 = _3012 + 656;
    float _3016 = _2158 + (-0.5);
    bool _3018 = !_2164;
    int _3020 = _3018 ? 0 : 1;
    float _3022 = -_3010;
    float _3024 = fma(_2992, 2.0, _3022);
    float _3026 = fma(_2902, _2834, _2946);
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _3030 = uint(int(uint(_3014) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[int(_3040)][_3042];
    bool _3046 = _2162 != 3;
    float _3048 = -_135;
    float _3050 = fma(_3048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3024);
    float _3052 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3028);
    float _3054 = fma(_2906, _2810, _3026);
    bool _3056 = !_3046;
    int _3058 = _3056 ? 0 : (-1);
    float _3060 = -_3016;
    float _3062 = -_2464;
    float _3064 = fma(_3060, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3062);
    bool _3066 = _3000 >= 0.0;
    int _3068 = _3014 + 8;
    uint _3070 = uint(int(uint(_3068) >> uint(2)));
    uint _3072 = uint(int(uint(int(_3070)) >> uint(2)));
    int _3074 = int(_3070) & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    int _3078 = int(_3070) + 1;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    int _3082 = _3078 & 3;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[int(_3080)][_3082];
    float _3086 = _1980 + 0.5;
    float _3088 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3008);
    float _3090 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3092 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[95].x, _3004);
    float _3094 = _2450 + 0.5;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3098 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2962);
    float _3100 = _2168 + (-0.5);
    float _3102 = fma(_3094, (*spvDescriptorSet0.vp_c9)._m0[80].x, _3050);
    float _3104 = fma(_3090, -2.0, _3096);
    int _3106 = abs(_2230);
    float _3108 = -_3100;
    float _3110 = -_3098;
    float _3112 = fma(_3108, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3110);
    float _3114 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3118 = fma(_2756, _1228, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3120 = abs(_3058);
    float _3122 = -_3116;
    float _3124 = fma(_2594, 2.0, _3122);
    int _3126 = abs(_3020);
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3130 = fma(_3118, _2766, _3054);
    int _3132 = abs(_2296);
    float _3134 = -_3128;
    float _3136 = fma(_2544, 2.0, _3134);
    int _3138 = ~_3106;
    int _3140 = _3138 + 1;
    int _3142 = _3140 + 1;
    if (_3066)
    {
        _2560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3144 = _2560;
    float _3146 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2942);
    int _3148 = ~_3126;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    float _3154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_3066)
    {
        float _3156 = _3144 * 5.0;
        _2290 = as_type<int>(_3156);
    }
    int _3158 = _2290;
    bool _3160 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3162 = isnan(0.0);
    bool _3164 = _3160 || _3162;
    bool _3166 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3168 = _3164 || _3166;
    float _3170 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2938);
    float _3172 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2926);
    if (_3066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10223 = as_type<float>(_3158);
        out.gl_Position.z = _10223;
    }
    int _3174 = _3142 * as_type<int>(_3044);
    int _3176 = ~_3132;
    int _3178 = _3176 + 1;
    int _3180 = _3178 + 1;
    float _3182 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3184 = int(_3182);
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3188 = _3152 * as_type<int>(_3036);
    int _3190 = _3188 + _3174;
    int _3192 = abs(_2308);
    float _3194 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3104);
    int _3196 = _3180 * as_type<int>(_3076);
    int _3198 = _3196 + _3190;
    float _3200 = exp2(_1560);
    int _3202 = ~_3120;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    float _3208 = -_2428;
    float _3210 = _3208 + 1.0;
    int _3212 = ~_3192;
    int _3214 = _3212 + 1;
    int _3216 = _3214 + 1;
    float _3218 = _3154 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3220 = _1666 + (-0.5);
    int _3222 = _3206 * as_type<int>(_3084);
    int _3224 = _3222 + _3198;
    float _3226 = -_3146;
    float _3228 = _3226 + 1.0;
    float _3230 = float(uint(_3184));
    float _3232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3234 = _3224 * _3216;
    float _3236 = fma(_3210, _2158, _3064);
    float _3238 = -_3228;
    float _3240 = fma(_3238, _1980, _3092);
    int _3242 = _2696 * _3192;
    int _3244 = _3242 + _3234;
    float _3246 = _1942 + 0.5;
    float _3248 = -_3200;
    float _3250 = _3248 + 1.0;
    float _3252 = 1.0 / _3230;
    float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3256 = 1.0 + _3254;
    float _3258 = -_135;
    float _3260 = fma(_3258, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3136);
    float _3262 = fma(_3114, -2.0, _3186);
    float _3264 = _3168 ? _3250 : 0.0;
    out.m_84.x = _3240;
    out.m_84.y = _3236;
    float _3266 = fma(_3218, _3246, _3260);
    bool _3268 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3270 = isnan(1.0);
    bool _3272 = _3268 || _3270;
    bool _3274 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3276 = _3272 || _3274;
    float _3278 = 1.0 / _3256;
    float _3280 = float(uint(_3244));
    float _3282 = _3232 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3284 = abs(_3184);
    float _3286 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2984);
    float _3288 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2932);
    float _3290 = -_3282;
    float _3292 = -_3194;
    float _3294 = fma(_3290, _3220, _3292);
    int _3296 = ~_3184;
    int _3298 = _3296 + 1;
    float _3300 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3088);
    int _3302 = as_type<int>(_3252) + (-2);
    float _3304 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3052);
    float _3306 = -_135;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3124);
    float _3310 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3262);
    float _3312 = float(uint(_3284));
    float _3314 = as_type<float>(_3302) * _3280;
    float _3316 = _2950 * _2950;
    if (_3276)
    {
        float _3318 = _3264 * _3278;
        _145 = _3318;
    }
    float _3320 = _145;
    float _3322 = trunc(_3314);
    float _3324 = precise::max(_3322, 0.0);
    uint _3326 = uint(_3324);
    int _3328 = _1972 >> 31;
    float _3330 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3130);
    int _3332 = _2314 >> 31;
    float _3334 = fma(_2966, _2966, _3316);
    int _3336 = _3328 & 3;
    float _3338 = -_3300;
    float _3340 = _3338 + 1.0;
    bool _3342 = !_2716;
    int _3344 = _3342 ? 0 : 1;
    float _3346 = 1.0 / _3312;
    int _3348 = _3332 & 3;
    float _3350 = fma(_2988, _2988, _3334);
    int _3352 = _1972 + _3336;
    float _3354 = -_3170;
    float _3356 = _3354 + 1.0;
    int _3358 = _2314 + _3348;
    float _3360 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3362 = -_3340;
    float _3364 = fma(_1942, _3362, _3266);
    float _3366 = rsqrt(_3350);
    int _3368 = _3298 * int(_3326);
    int _3370 = _3368 + _3244;
    float _3372 = -_3356;
    float _3374 = fma(_2450, _3372, _3102);
    int _3376 = abs(_3244);
    float _3378 = -_3304;
    float _3380 = _3378 + 1.0;
    int _3382 = _3352 >> 2;
    out.m_86.x = _3330;
    int _3384 = _3358 >> 2;
    float _3386 = fma(_1666, _3380, _3294);
    float _3388 = float(uint(_3370));
    float _3390 = -_3172;
    float _3392 = _3390 + 1.0;
    int _3394 = as_type<int>(_3346) + (-2);
    float _3396 = -_3286;
    float _3398 = _3396 + 1.0;
    float _3400 = float(uint(_3376));
    float _3402 = as_type<float>(_3302) * _3388;
    int _3404 = _3382 << 4;
    int _3406 = _3404 + 368;
    float _3408 = _3360 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3410 = _3384 << 4;
    int _3412 = _3410 + 800;
    float _3414 = as_type<float>(_3394) * _3400;
    uint _3416 = uint(int(uint(_3406) >> uint(2)));
    uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
    int _3420 = int(_3416) & 3;
    float _3422 = (*spvDescriptorSet0.vp_c9)._m0[int(_3418)][_3420];
    int _3424 = int(_3416) + 1;
    uint _3426 = uint(int(uint(_3424) >> uint(2)));
    int _3428 = _3424 & 3;
    float _3430 = (*spvDescriptorSet0.vp_c9)._m0[int(_3426)][_3428];
    float _3432 = _3408 * _3366;
    float _3434 = fma(_2168, _3392, _3112);
    int _3436 = abs(_3344);
    float _3438 = trunc(_3414);
    float _3440 = precise::max(_3438, 0.0);
    uint _3442 = uint(_3440);
    float _3444 = _2950 * _3432;
    float _3446 = _2966 * _3432;
    out.m_88.x = _3374;
    out.m_88.y = _3434;
    out.m_88.z = _3364;
    out.m_88.w = _3386;
    uint _3448 = uint(int(uint(_3412) >> uint(2)));
    uint _3450 = uint(int(uint(int(_3448)) >> uint(2)));
    int _3452 = int(_3448) & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    int _3456 = int(_3448) + 1;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    int _3460 = _3456 & 3;
    float _3462 = (*spvDescriptorSet0.vp_c9)._m0[int(_3458)][_3460];
    float _3464 = -_3444;
    float _3466 = _2950 + _3464;
    float _3468 = -_3446;
    float _3470 = _2966 + _3468;
    float _3472 = float(_2982);
    float _3474 = _2988 * _3432;
    int _3476 = ~_3284;
    int _3478 = _3476 + 1;
    float _3480 = _3466 * _3466;
    float _3482 = float(_3436);
    float _3484 = trunc(_3402);
    float _3486 = precise::max(_3484, 0.0);
    uint _3488 = uint(_3486);
    int _3490 = ~_3184;
    int _3492 = _3490 + 1;
    float _3494 = fma(_3470, _3470, _3480);
    int _3496 = abs(_2678);
    int _3498 = _3478 * int(_3442);
    int _3500 = _3498 + _3376;
    int _3502 = _3412 + 8;
    uint _3504 = uint(int(uint(_3502) >> uint(2)));
    uint _3506 = uint(int(uint(int(_3504)) >> uint(2)));
    int _3508 = int(_3504) & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    int _3512 = int(_3504) + 1;
    uint _3514 = uint(int(uint(_3512) >> uint(2)));
    int _3516 = _3512 & 3;
    float _3518 = (*spvDescriptorSet0.vp_c9)._m0[int(_3514)][_3516];
    float _3520 = _3482 * _3472;
    float _3522 = _3360;
    float _3524 = _3366;
    float _3526 = as_type<float>(_3496);
    if (_3066)
    {
        out.m_63.x = 0.0;
    }
    float _3528 = float(uint(_3500));
    float _3530 = -_3474;
    float _3532 = _2988 + _3530;
    int _3534 = ~_2446;
    int _3536 = _3534 + 1;
    int _3538 = _3536 + 1;
    int _3540 = _3406 + 8;
    uint _3542 = uint(int(uint(_3540) >> uint(2)));
    uint _3544 = uint(int(uint(int(_3542)) >> uint(2)));
    int _3546 = int(_3542) & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    int _3550 = int(_3542) + 1;
    uint _3552 = uint(int(uint(_3550) >> uint(2)));
    int _3554 = _3550 & 3;
    float _3556 = (*spvDescriptorSet0.vp_c9)._m0[int(_3552)][_3554];
    float _3558 = as_type<float>(_3394) * _3528;
    bool _3560 = !_2330;
    int _3562 = _3560 ? 0 : 1;
    int _3564 = int(_3326) + int(_3488);
    float _3566 = trunc(_3558);
    float _3568 = precise::max(_3566, 0.0);
    uint _3570 = uint(_3568);
    bool _3572 = _1990 != 3;
    bool _3574 = _977 == 0;
    int _3576 = _3492 * _3564;
    int _3578 = _3576 + _3244;
    int _3580 = ~_3284;
    int _3582 = _3580 + 1;
    float _3584 = _1356 + (-0.5);
    bool _3586 = !_3574;
    int _3588 = _3586 ? _2482 : (-1);
    int _3590 = _3538 * as_type<int>(_3430);
    bool _3592 = !_3572;
    int _3594 = _3592 ? 0 : (-1);
    bool _3596 = uint(_3578) >= uint(_3184);
    int _3598 = int(_3442) + int(_3570);
    bool _3600 = !_3596;
    int _3602 = _3600 ? 0 : (-1);
    int _3604 = _2488 * as_type<int>(_3462);
    int _3606 = abs(_3562);
    int _3608 = _3582 * _3598;
    int _3610 = _3608 + _3376;
    int _3612 = ~_3606;
    int _3614 = _3612 + 1;
    int _3616 = _3614 + 1;
    bool _3618 = _2328 != 3;
    int _3620 = ~_3496;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    int _3626 = _3616 * as_type<int>(_3454);
    int _3628 = _3626 + _3604;
    int _3630 = ~_3564;
    int _3632 = _3630 + _3602;
    int _3634 = _3632 + 1;
    bool _3636 = !_3618;
    int _3638 = _3636 ? 0 : (-1);
    int _3640 = _3624 * as_type<int>(_3422);
    int _3642 = _3640 + _3590;
    bool _3644 = uint(_3610) >= uint(_3284);
    int _3646 = _3184 * _3634;
    int _3648 = _3646 + _3244;
    int _3650 = abs(_2138);
    bool _3652 = !_3644;
    int _3654 = _3652 ? 0 : (-1);
    bool _3656 = _3184 == 0;
    int _3658 = abs(_2410);
    bool _3660 = !_3656;
    int _3662 = _3660 ? _3648 : (-1);
    float _3664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3666 = _3184 == 0;
    int _3668 = ~_3658;
    int _3670 = _3668 + 1;
    int _3672 = _3670 + 1;
    int _3674 = _3244 ^ _3184;
    float _3676 = -_3288;
    float _3678 = _3676 + 1.0;
    int _3680 = abs(_3594);
    int _3682 = _3672 * as_type<int>(_3510);
    int _3684 = _3682 + _3628;
    uint _3686 = uint(int(uint(_3674) >> uint(31)));
    float _3688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3690 = ~_3650;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    int _3696 = abs(_3638);
    int _3698 = ~_3654;
    int _3700 = _3598 + _3698;
    int _3702 = _3700 + 1;
    int _3704 = _3694 * as_type<int>(_3548);
    int _3706 = _3704 + _3642;
    int _3708 = ~int(_3686);
    int _3710 = _3708 + 1;
    int _3712 = ~_3680;
    int _3714 = _3712 + 1;
    int _3716 = _3714 + 1;
    int _3718 = ~_3696;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3702 ^ _3710;
    int _3726 = _3716 * as_type<int>(_3556);
    int _3728 = _3726 + _3706;
    int _3730 = abs(_2318);
    int _3732 = _3722 * as_type<int>(_3518);
    int _3734 = _3732 + _3684;
    int _3736 = ~_2472;
    int _3738 = _3736 + 1;
    int _3740 = _3738 + 1;
    float _3742 = in.m_90.x;
    float _3744 = in.m_90.y;
    float _3746 = in.m_90.z;
    int _3748 = ~_3710;
    int _3750 = _3748 + _3724;
    int _3752 = _3750 + 1;
    float _3754 = _3688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3756 = ~_3730;
    int _3758 = _3756 + 1;
    int _3760 = _3758 + 1;
    int _3762 = _3728 * _3740;
    bool _3764 = !_3666;
    int _3766 = _3764 ? _3752 : (-1);
    float _3768 = _1334 + 0.5;
    float _3770 = float(_3662);
    int _3772 = _3734 * _3760;
    float _3774 = float(_3766);
    float _3776 = _3664 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3778 = _3588 * _2472;
    int _3780 = _3778 + _3762;
    float _3782 = fma(_3754, _3770, _3308);
    int _3784 = _2610 * _3730;
    int _3786 = _3784 + _3772;
    float _3788 = -_3310;
    float _3790 = fma(_3776, _3774, _3788);
    float _3792 = _3520 * (-2.0);
    float _3794 = fma(_3754, _3768, _3782);
    float _3796 = -_3776;
    float _3798 = fma(_3796, _3584, _3790);
    float _3800 = float(_3780);
    float _3802 = -_3398;
    float _3804 = fma(_1334, _3802, _3794);
    float _3806 = float(_3786);
    float _3808 = fma(_1356, _3678, _3798);
    float _3810 = fma(_2972, _3792, _2972);
    float _3812 = fma(_3792, _3742, _3742);
    bool _3814 = !_2720;
    int _3816 = _3814 ? 0 : 1;
    out.m_92.x = _3800;
    bool _3818 = !_2724;
    int _3820 = _3818 ? 0 : 1;
    int _3822 = abs(_3816);
    out.m_92.w = _3806;
    out.m_94.x = _3804;
    out.m_94.y = _3808;
    float _3824 = _3746;
    int _3826 = _3610;
    float _3828 = _3556;
    float _3830 = _3532;
    if (_3066)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3832 = -_3444;
    float _3834 = _2578 + _3832;
    float _3836 = float(_2622);
    float _3838 = -_3446;
    float _3840 = _2918 + _3838;
    float _3842 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3812);
    float _3844 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3846 = _3834 + _3844;
    float _3848 = float(_3822);
    float _3850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3852 = _3840 + _3850;
    float _3854 = fma(_3810, _3320, _3842);
    float _3856 = _3846 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3858 = -_3474;
    float _3860 = _2920 + _3858;
    float _3862 = _3848 * _3836;
    float _3864 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3856);
    float _3866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3868 = _3860 + _3866;
    float _3870 = _2940 + (-1.0);
    int _3872 = abs(_3820);
    float _3874 = fma(_3532, _3532, _3494);
    float _3876 = fma(_3868, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3864);
    float _3878 = _3862 * (-2.0);
    float _3880 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3882 = float(_2690);
    float _3884 = _2994 + (-1.0);
    float _3886 = fma(_3878, _3744, _3744);
    float _3888 = float(_3872);
    float _3890 = fma(_3880, _3878, _3880);
    bool _3892 = _3876 >= 0.0;
    float _3894 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3886);
    float _3896 = _3888 * _3882;
    float _3898 = _3854 * 0.15915493667125701904296875;
    float _3900 = fma(_3890, _3320, _3894);
    float _3902 = sqrt(_3874);
    float _3904 = _3896 * (-2.0);
    float _3906 = fma(_3884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3908 = _3900 * 0.15915493667125701904296875;
    float _3910 = _1162 + (-0.5);
    float _3912 = fma(_3904, _3746, _3746);
    float _3914 = fma(_3906, _3904, _3906);
    float _3916 = _3840;
    if (_3892)
    {
        _3824 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3918 = _3824;
    float _3920 = _3898 * 6.283185482025146484375;
    float _3922 = sin(_3920);
    float _3924 = fma(_3910, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3912);
    int _3926 = as_type<int>(_3918);
    if (_3892)
    {
        out.m_63.x = 0.0;
    }
    if (_3892)
    {
        float _3928 = _3918 * 5.0;
        _3926 = as_type<int>(_3928);
    }
    int _3930 = _3926;
    float _3932 = fma(_3914, _3320, _3924);
    float _3934 = _3898 * 6.283185482025146484375;
    float _3936 = cos(_3934);
    if (_3892)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11332 = as_type<float>(_3930);
        out.gl_Position.z = _11332;
    }
    float _3938 = _3932 * 0.15915493667125701904296875;
    float _3940 = _3908 * 6.283185482025146484375;
    float _3942 = sin(_3940);
    float _3944 = _3908 * 6.283185482025146484375;
    float _3946 = cos(_3944);
    if (_3892)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3948 = _3938 * 6.283185482025146484375;
    float _3950 = cos(_3948);
    float _3952 = _3366 * _3902;
    float _3954 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3958 = _3922 * _3942;
    float _3960 = _3360 * _3952;
    float _3962 = _3952 * _3954;
    float _3964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _3966 = _3938 * 6.283185482025146484375;
    float _3968 = sin(_3966);
    float _3970 = _3936 * _3942;
    float _3972 = _3956 * _3962;
    float _3974 = _3936 * _3946;
    float _3976 = _3922 * _3946;
    float _3978 = _3964 * _3960;
    float _3980 = _3936 * _3950;
    float _3982 = _3946 * _3950;
    float _3984 = _3922 * _3950;
    float _3986 = _3942 * _3950;
    float _3988 = _3980 * _3972;
    float _3990 = _3952 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3992 = _3990 * 0.5;
    float _3994 = fma(_3968, _3974, _3958);
    float _3996 = -_3976;
    float _3998 = fma(_3968, _3970, _3996);
    float _4000 = -_3972;
    float _4002 = _3968 * _4000;
    float _4004 = -_3970;
    float _4006 = fma(_3968, _3976, _4004);
    float _4008 = fma(_3994, _3978, _3988);
    float _4010 = _3984 * _3972;
    float _4012 = fma(_3982, _3978, _4002);
    float _4014 = fma(_3968, _3958, _3974);
    float _4016 = fma(_3998, _3992, _4008);
    float _4018 = fma(_4006, _3978, _4010);
    float _4020 = fma(_3986, _3992, _4012);
    float _4022 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4024 = fma(_4014, _3992, _4018);
    float _4026 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4028 = _4016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4030 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4022);
    float _4032 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4026);
    float _4034 = fma(_4020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4028);
    float _4036 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4030);
    float _4038 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4032);
    float _4040 = fma(_4024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4034);
    float _4042 = _4036 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4044 = _4038 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4046 = _4040 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4048 = _2920 + _4042;
    float _4050 = _2918 + _4044;
    float _4052 = _2578 + _4046;
    float _4054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4056 = _4048 + _4054;
    float _4058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4060 = _4050 + _4058;
    float _4062 = _4056 * _4056;
    float _4064 = fma(_4060, _4060, _4062);
    float _4066 = sqrt(_4064);
    bool _4068 = _4066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4070 = _4040;
    float _4072 = _4062;
    float _4074 = _4046;
    if (!_4068)
    {
        _4070 = _4050;
    }
    float _4076 = _4070;
    float _4078 = _4076;
    if (!_4068)
    {
        _4072 = _4048;
    }
    float _4080 = _4072;
    float _4082 = _4080;
    if (!_4068)
    {
        _4074 = _4052;
    }
    float _4084 = _4074;
    bool _4086 = !_4068;
    float _4088 = _4084;
    if (!_4086)
    {
        float _4090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4094 = _4066 + _4092;
        float _4096 = rsqrt(_4064);
        float _4098 = _4094 * _4090;
        float _4100 = _4052 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4102 = _4098 * 0.15915493667125701904296875;
        float _4104 = _4102 * 6.283185482025146484375;
        float _4106 = cos(_4104);
        float _4108 = _4102 * 6.283185482025146484375;
        float _4110 = sin(_4108);
        float _4112 = _4106 + (-1.0);
        float _4114 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4116 = fma(_4110, _4100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4118 = fma(_4052, _4106, _4114);
        float _4120 = _4096 * _4116;
        float _4122 = fma(_4060, _4120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4124 = fma(_4056, _4120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4088 = _4118;
        _4078 = _4122;
        _4082 = _4124;
    }
    float _4126 = _4088;
    float _4128 = _4078;
    float _4130 = _4082;
    float _4132 = -_2578;
    float _4134 = _4132 + _4126;
    float _4136 = -_2918;
    float _4138 = _4136 + _4128;
    float _4140 = -_2920;
    float _4142 = _4140 + _4130;
    float _4144 = _4134 * _4134;
    float _4146 = fma(_4138, _4138, _4144);
    float _4148 = fma(_4142, _4142, _4146);
    float _4150 = sqrt(_4148);
    bool _4152 = _4150 > 0.0;
    bool _4154 = !_4152;
    float _4156 = _4126;
    float _4158 = _4128;
    float _4160 = _4130;
    if (!_4154)
    {
        float _4162 = _245 * _245;
        float _4164 = rsqrt(_4148);
        float _4166 = fma(_237, _237, _4162);
        float _4168 = fma(_247, _247, _4166);
        float _4170 = sqrt(_4168);
        float _4172 = _4138 * _4164;
        float _4174 = _4134 * _4164;
        float _4176 = _4142 * _4164;
        bool _4178 = _4170 > 0.0;
        bool _4180 = !_4178;
        _2976 = _4172;
        if (!_4180)
        {
            float _4182 = rsqrt(_4168);
            float _4184 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4186 = _245 * _4182;
            float _4188 = _237 * _4182;
            float _4190 = _4174 * _4186;
            float _4192 = _247 * _4182;
            float _4194 = fma(_4172, _4188, _4190);
            float _4196 = _4184 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4198 = fma(_4176, _4192, _4194);
            float _4200 = _4198 * _4196;
            float _4202 = fma(_237, _4200, _4128);
            float _4204 = fma(_245, _4200, _4126);
            float _4206 = fma(_247, _4200, _4130);
            _4156 = _4204;
            _4158 = _4202;
            _4160 = _4206;
        }
    }
    float _4208 = _4156;
    float _4210 = _4158;
    float _4212 = _4160;
    float _4214 = _2976;
    float _4216 = -_3444;
    float _4218 = _4216 + _4208;
    float _4220 = -_3446;
    float _4222 = _4220 + _4210;
    float _4224 = -_3474;
    float _4226 = _4224 + _4212;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4230 = _4218 + _4228;
    float _4232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4234 = _4222 + _4232;
    float _4236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4238 = _4226 + _4236;
    float _4240 = _4230 * _4230;
    float _4242 = fma(_4234, _4234, _4240);
    float _4244 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4246 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4248 = fma(_4238, _4238, _4242);
    float _4250 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4244);
    float _4252 = rsqrt(_4248);
    float _4254 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4250);
    float _4256 = _3834 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4258 = _4254 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4260 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4256);
    float _4262 = sqrt(_4248);
    float _4264 = 1.0 / _4258;
    float _4266 = _4252 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4268 = fma(_3860, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4260);
    float _4270 = _4234 * _4266;
    float _4272 = _4238 * _4266;
    float _4274 = _4268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4276 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4278 = _4270 * _4270;
    float _4280 = _4272 * _4272;
    float _4282 = _4274 + _4258;
    float _4284 = _3834 + _4276;
    float _4286 = _4278 + _4280;
    float _4288 = _4282 * _4264;
    float _4290 = _4288 * 0.5;
    float _4292 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4294 = sqrt(_4286);
    float _4296 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4300 = fma(_4290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4298);
    float _4302 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4292);
    float _4304 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4296);
    float _4306 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4302);
    float _4308 = 1.0 / _4300;
    float _4310 = fma(_3860, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4304);
    float _4312 = _4306 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4314 = _4310 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _4316 = _4294 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4318 = trunc(_4312);
    int _4320 = int(_4318);
    float _4322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4324 = _4294 + _4322;
    float _4326 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4328 = _4308 * _4326;
    float _4330 = trunc(_4314);
    int _4332 = int(_4330);
    bool _4334 = _4328 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4336 = _4328 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4338 = _4214;
    float _4340 = _4286;
    int _4342 = 2;
    float _4344 = _4278;
    float _4346 = _4280;
    if (_4316)
    {
        float _4348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4338 = _4348;
    }
    float _4350 = _4338;
    int _4352 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4354 = _4320 + _4352;
    int _4356 = _4354 + 1;
    bool _4358 = !_4334;
    int _4360 = _4358 ? 0 : 1;
    bool _4362 = _4356 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4364 = _4356;
    if (_4316)
    {
        float _4366 = rsqrt(_4286);
        _4340 = _4366;
    }
    float _4368 = _4340;
    int _4370 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4372 = _4332 + _4370;
    int _4374 = _4372 + 1;
    int _4376 = as_type<int>(_4368);
    if (!_4334)
    {
        _4342 = 1;
    }
    int _4378 = _4342;
    float _4380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _4382 = _4356 | _4374;
    int _4384 = _4378;
    float _4386 = as_type<float>(_4382);
    if (!_4336)
    {
        _4384 = _4360;
    }
    int _4388 = _4384;
    bool _4390 = _4382 < 0;
    bool _4392 = _4390 || _4362;
    if (_4316)
    {
        float _4394 = _4324 * _4350;
        _4386 = _4394;
    }
    float _4396 = _4386;
    bool _4398 = _4374 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4400 = _4398 || _4392;
    if (_4316)
    {
        float _4402 = _4396 * 0.15915493667125701904296875;
        _2490 = _4402;
    }
    float _4404 = _2490;
    int _4406 = _4388 << 6;
    float _4408 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4410 = precise::max(0.0, _4380);
    int _4412 = as_type<int>(_4060);
    if (_4316)
    {
        float _4414 = _4404 * 6.283185482025146484375;
        float _4416 = sin(_4414);
        _4412 = as_type<int>(_4416);
    }
    int _4418 = _4412;
    int _4420 = _4406 + 96;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[int(_4432)][_4434];
    if (!_4316)
    {
        _3522 = _4270;
    }
    float _4438 = _3522;
    float _4440 = -_4266;
    float _4442 = -_4410;
    float _4444 = fma(_4230, _4440, _4442);
    float _4446 = _4438;
    if (!_4400)
    {
        int _4448 = _4374 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4450 = _4448 + _4356;
        _4364 = _4450;
    }
    int _4452 = _4364;
    int _4454 = _4406 + 48;
    uint _4456 = uint(int(uint(_4454) >> uint(2)));
    uint _4458 = uint(int(uint(int(_4456)) >> uint(2)));
    int _4460 = int(_4456) & 3;
    float _4462 = (*spvDescriptorSet0.vp_c15)._m0[int(_4458)][_4460];
    int _4464 = int(_4456) + 1;
    uint _4466 = uint(int(uint(_4464) >> uint(2)));
    int _4468 = _4464 & 3;
    float _4470 = (*spvDescriptorSet0.vp_c15)._m0[int(_4466)][_4468];
    float _4472 = _2972;
    if (_4316)
    {
        float _4474 = _4404 * 6.283185482025146484375;
        float _4476 = cos(_4474);
        _4472 = _4476;
    }
    float _4478 = _4472;
    if (_4316)
    {
        float _4480 = _4444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3524 = _4480;
    }
    float _4482 = _3524;
    float _4484 = _4482;
    if (!_4400)
    {
        int _4486 = _4452 << 2;
        _3826 = _4486;
    }
    int _4488 = _3826;
    int _4490 = _4418;
    int _4492 = _4488;
    if (_4316)
    {
        float _4494 = fma(as_type<float>(_4418), _4482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3526 = _4494;
    }
    float _4496 = _3526;
    int _4498 = _4406 + 64;
    uint _4500 = uint(int(uint(_4498) >> uint(2)));
    uint _4502 = uint(int(uint(int(_4500)) >> uint(2)));
    int _4504 = int(_4500) & 3;
    float _4506 = (*spvDescriptorSet0.vp_c15)._m0[int(_4502)][_4504];
    int _4508 = int(_4500) + 1;
    uint _4510 = uint(int(uint(_4508) >> uint(2)));
    int _4512 = _4508 & 3;
    float _4514 = (*spvDescriptorSet0.vp_c15)._m0[int(_4510)][_4512];
    float _4516 = _4496;
    if (!_4316)
    {
        _4484 = _4444;
    }
    float _4518 = _4484;
    float _4520 = floor(_4408);
    float _4522 = _4518;
    if (_4316)
    {
        float _4524 = _4368 * _4496;
        _4516 = _4524;
    }
    float _4526 = _4516;
    if (!_4400)
    {
        uint _4528 = uint(int(uint(_4452) >> uint(2)));
        _4490 = int(_4528);
    }
    int _4530 = _4490;
    float _4532 = as_type<float>(_4530);
    if (!_4400)
    {
        int _4534 = 12 & _4488;
        _4492 = _4534;
    }
    int _4536 = _4492;
    if (_4316)
    {
        float _4538 = _4270 * _4526;
        _4446 = _4538;
    }
    float _4540 = _4446;
    int _4542 = _4406 + 104;
    uint _4544 = uint(int(uint(_4542) >> uint(2)));
    uint _4546 = uint(int(uint(int(_4544)) >> uint(2)));
    int _4548 = int(_4544) & 3;
    float _4550 = (*spvDescriptorSet0.vp_c15)._m0[int(_4546)][_4548];
    int _4552 = int(_4544) + 1;
    uint _4554 = uint(int(uint(_4552) >> uint(2)));
    int _4556 = _4552 & 3;
    float _4558 = (*spvDescriptorSet0.vp_c15)._m0[int(_4554)][_4556];
    if (_4316)
    {
        float _4560 = _4478 + (-1.0);
        _3828 = _4560;
    }
    float _4562 = _3828;
    float _4564 = _4562;
    if (!_4400)
    {
        int _4566 = _4530 << 4;
        int _4568 = _4566 + _4536;
        _4376 = _4568;
    }
    int _4570 = _4376;
    if (_4316)
    {
        float _4572 = _4540 * _4540;
        _4344 = _4572;
    }
    float _4574 = _4344;
    float _4576 = floor(_4246);
    if (_4316)
    {
        float _4578 = _4562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3830 = _4578;
    }
    float _4580 = _3830;
    if (!_4316)
    {
        _4564 = _4272;
    }
    float _4582 = _4564;
    float _4584 = _4582;
    if (_4316)
    {
        float _4586 = _4272 * _4526;
        _4584 = _4586;
    }
    float _4588 = _4584;
    int _4590 = _4406 + 56;
    uint _4592 = uint(int(uint(_4590) >> uint(2)));
    uint _4594 = uint(int(uint(int(_4592)) >> uint(2)));
    int _4596 = int(_4592) & 3;
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[int(_4594)][_4596];
    int _4600 = int(_4592) + 1;
    uint _4602 = uint(int(uint(_4600) >> uint(2)));
    int _4604 = _4600 & 3;
    float _4606 = (*spvDescriptorSet0.vp_c15)._m0[int(_4602)][_4604];
    if (_4316)
    {
        float _4608 = fma(_4444, _4478, _4580);
        _4522 = _4608;
    }
    float _4610 = _4522;
    if (_4316)
    {
        float _4612 = _4588 * _4588;
        _4346 = _4612;
    }
    float _4614 = _4346;
    float _4616 = -_4520;
    float _4618 = _4408 + _4616;
    float _4620 = fma(_4610, _4610, _4574);
    if (!_4400)
    {
        float _4622 = floor(_4312);
        _4532 = _4622;
    }
    float _4624 = _4532;
    int _4626 = _4406 + 72;
    uint _4628 = uint(int(uint(_4626) >> uint(2)));
    uint _4630 = uint(int(uint(int(_4628)) >> uint(2)));
    int _4632 = int(_4628) & 3;
    float _4634 = (*spvDescriptorSet0.vp_c15)._m0[int(_4630)][_4632];
    int _4636 = int(_4628) + 1;
    uint _4638 = uint(int(uint(_4636) >> uint(2)));
    int _4640 = _4636 & 3;
    float _4642 = (*spvDescriptorSet0.vp_c15)._m0[int(_4638)][_4640];
    float _4644 = _4620 + _4614;
    float _4646 = rsqrt(_4644);
    float _4648 = _4284 * _4436;
    int _4650 = _4406 + 80;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    float _4668 = fma(_3840, _4428, _4648);
    float _4670 = _4284 * _4470;
    float _4672 = _4478;
    float _4674 = _4670;
    if (!_4400)
    {
        int _4676 = _4570 + 400;
        uint _4678 = uint(int(uint(_4676) >> uint(2)));
        uint _4680 = uint(int(uint(int(_4678)) >> uint(2)));
        int _4682 = int(_4678) & 3;
        float _4684 = (*spvDescriptorSet0.vp_c15)._m0[int(_4680)][_4682];
        _4672 = _4684;
    }
    float _4686 = _4672;
    float _4688 = _4646 * _4540;
    float _4690 = _4284 * _4514;
    float _4692 = fma(_3840, _4462, _4670);
    float _4694 = _4646 * _4610;
    float _4696 = _4646 * _4588;
    float _4698 = fma(_3840, _4506, _4690);
    float _4700 = _4688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_4400)
    {
        float _4702 = floor(_4314);
        _4674 = _4702;
    }
    float _4704 = _4674;
    float _4706 = fma(_3860, _4550, _4668);
    float _4708 = -_4700;
    float _4710 = fma(_4694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4708);
    float _4712 = fma(_3860, _4598, _4692);
    float _4714 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4716 = _4706 + _4558;
    float _4718 = _4712 + _4606;
    float _4720 = fma(_3860, _4634, _4698);
    float _4722 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4714);
    float _4724 = 1.0 / _4716;
    int _4726 = _4406 + 88;
    uint _4728 = uint(int(uint(_4726) >> uint(2)));
    uint _4730 = uint(int(uint(int(_4728)) >> uint(2)));
    int _4732 = int(_4728) & 3;
    float _4734 = (*spvDescriptorSet0.vp_c15)._m0[int(_4730)][_4732];
    int _4736 = int(_4728) + 1;
    uint _4738 = uint(int(uint(_4736) >> uint(2)));
    int _4740 = _4736 & 3;
    float _4742 = (*spvDescriptorSet0.vp_c15)._m0[int(_4738)][_4740];
    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4746 = fma(_4262, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4744);
    float _4748 = precise::clamp(_4746, 0.0, 1.0);
    float _4750 = _4720 + _4642;
    float _4752 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4754 = -_4696;
    float _4756 = fma(_4754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4710);
    float _4758 = -_4748;
    float _4760 = _4758 + 1.0;
    float _4762 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4722);
    float _4764 = _4284 * _4666;
    float _4766 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4768 = abs(_4760);
    float _4770 = log2(_4768);
    float _4772 = _4762 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4774 = fma(_3840, _4658, _4764);
    float _4776 = fma(_4756, 0.5, 0.5);
    float _4778 = _4772 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4780 = _4718 * _4724;
    float _4782 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4784 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4752);
    float _4786 = _4750 * _4724;
    bool _4788 = _4780 >= 0.0;
    float _4790 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4782);
    float _4792 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4784);
    float _4794 = _4218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _4796 = _4780 <= 1.0;
    bool _4798 = _4796 && _4788;
    float _4800 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4790);
    float _4802 = _4792 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4804 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4794);
    bool _4806 = _4786 >= 0.0;
    bool _4808 = _4806 && _4798;
    float _4810 = _4800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4812 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4814 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4804);
    bool _4816 = _4786 <= 1.0;
    bool _4818 = _4816 && _4808;
    float _4820 = -_4778;
    float _4822 = fma(_4820, _4766, 1.0);
    float _4824 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4812);
    float _4826 = fma(_4756, -0.5, 0.5);
    float _4828 = _4814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4830 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4832 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4824);
    float _4834 = sqrt(_4826);
    float _4836 = fma(_4776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4838 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4832);
    float _4840 = _4804;
    float _4842 = _4778;
    float _4844 = _4830;
    float _4846 = _4838;
    if (_4818)
    {
        float _4848 = float(_4388);
        _4840 = _4848;
    }
    float _4850 = _4840;
    if (!_4400)
    {
        float _4852 = rint(_4686);
        float _4854 = precise::max(_4852, 0.0);
        uint _4856 = uint(_4854);
        uint _4858 = clamp(_4856, 0u, 65535u);
        _4842 = as_type<float>(_4858);
    }
    float _4860 = _4842;
    float _4862 = fma(_3860, _4734, _4774);
    float _4864 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4866 = _4862 + _4742;
    float _4868 = fma(_4776, _4836, -0.212114393711090087890625);
    float _4870 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4872 = exp2(_4830);
    float _4874 = -_4576;
    float _4876 = _4246 + _4874;
    float _4878 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4864);
    float _4880 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4870);
    float _4882 = _4834 * 0.636619746685028076171875;
    float _4884 = _4866 * _4724;
    float _4886 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4878);
    float _4888 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4880);
    float _4890 = log2(_4822);
    float _4892 = _4888;
    if (!_4400)
    {
        float _4894 = -_4704;
        float _4896 = _4314 + _4894;
        _4844 = _4896;
    }
    float _4898 = _4844;
    float _4900 = fma(_4776, _4868, 1.570728778839111328125);
    float _4902 = _4694 + 1.0;
    float _4904 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4886);
    float _4906 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4888);
    float _4908 = -_4900;
    float _4910 = fma(_4882, _4908, 1.0);
    if (!_4400)
    {
        float _4912 = -_4624;
        float _4914 = _4312 + _4912;
        _4892 = _4914;
    }
    float _4916 = _4892;
    float _4918 = 1.0 / _4838;
    float _4920 = -_4694;
    float _4922 = fma(_4872, _4902, _4920);
    float _4924 = _4850;
    if (_4818)
    {
        float _4926 = rint(_4850);
        float _4928 = precise::max(_4926, 0.0);
        uint _4930 = uint(_4928);
        uint _4932 = clamp(_4930, 0u, 65535u);
        _4924 = as_type<float>(_4932);
    }
    float _4934 = _4924;
    float _4936 = _4890 * 0.693147182464599609375;
    float _4938 = fma(_4922, 0.5, 0.5);
    float2 _12991 = float2(_4618, _4876);
    float _4940 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12991, float2(0.0), isnan(_12991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12991, float2(0.0), isnan(_12991)), level(0.0)).x;
    float _4942 = as_type<float>(_4388);
    if (!_4400)
    {
        float3 _13009 = float3(_4916, _4898, float(as_type<int>(_4860)));
        float3 _13013 = select(_13009, float3(0.0), isnan(_13009));
        float _4944 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13013.xy, uint(rint(_13013.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13013.xy, uint(rint(_13013.z)), level(0.0)).x;
        _4942 = _4944;
    }
    float _4946 = _4942;
    float _4948 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4950 = _4904 * _4918;
    float _4952 = _4906 * _4918;
    float _4954 = fma(_4950, 0.5, 0.5);
    float _4956 = fma(_4952, -0.5, 0.5);
    float _4958 = _4934;
    if (_4818)
    {
        float3 _13042 = float3(_4780, _4786, float(as_type<int>(_4934)));
        float3 _13044 = select(_13042, float3(0.0), isnan(_13042));
        float _4960 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13044.xy, uint(rint(_13044.z)), _4884, level(0.0));
        _4958 = _4960;
    }
    float _4962 = _4958;
    float3 _13054 = float3(_4954, _4956, _4948);
    float _4964 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13054, float3(0.0), isnan(_13054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13054, float3(0.0), isnan(_13054)), level(0.0)).x;
    float3 _13063 = float3(_4954, _4956, _4948);
    float4 _4967 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13063, float3(0.0), isnan(_13063)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13063, float3(0.0), isnan(_13063)), level(0.0)).xyzw;
    float _4969 = _4967.x;
    float _4971 = _4967.y;
    float _4973 = _4967.z;
    float _4975 = _4967.w;
    float2 _13079 = float2(_4910, _4938);
    float3 _4979 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13079, float2(0.0), isnan(_13079)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13079, float2(0.0), isnan(_13079)), level(0.0)).xyz;
    float _4981 = _4979.x;
    float _4983 = _4979.y;
    float _4985 = _4979.z;
    float _4987 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4989 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4991 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4993 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4995 = fma(_4987, _4987, 1.0);
    float _4997 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4999 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4989);
    float _5001 = _3980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5003 = rsqrt(_4995);
    float _5005 = -_3968;
    float _5007 = fma(_5005, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4993);
    float _5009 = -_3968;
    float _5011 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4997);
    float _5013 = _3998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5015 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4991);
    float _5017 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4999);
    float _5019 = -_3968;
    float _5021 = fma(_5019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5001);
    float _5023 = fma(_3986, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5013);
    float _5025 = abs(_4328);
    float _5027 = log2(_5025);
    float _5029 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5015);
    float _5031 = _4802 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5033 = fma(_4014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5023);
    float _5035 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5007);
    float _5037 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5011);
    float _5039 = fma(_3984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5021);
    float _5041 = fma(_4810, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5031);
    float _5043 = _4987 * _5003;
    float _5045 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5047 = fma(_4772, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5041);
    float _5049 = -_5017;
    float _5051 = _5043 * _5049;
    float _5053 = -_5029;
    float _5055 = _5043 * _5053;
    float _5057 = -_5033;
    float _5059 = _5043 * _5057;
    float _5061 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5045);
    float _5063 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5065 = fma(_5003, _5035, _5051);
    float _5067 = fma(_5003, _5037, _5055);
    float _5069 = fma(_5003, _5039, _5059);
    float _5071 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5073 = _3994 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5075 = exp2(_5063);
    float _5077 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5079 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5071);
    float _5081 = fma(_3982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5073);
    float _5083 = fma(_4828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5047);
    float _5085 = _4838 * 0.5;
    out.m_96.x = _5065;
    out.m_96.y = _5067;
    out.m_96.z = _5069;
    bool _5087 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5089 = isnan(0.5);
    bool _5091 = _5087 || _5089;
    bool _5093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5095 = _5091 || _5093;
    float _5097 = fma(_4906, -0.5, _5085);
    float _5099 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5079);
    float _5101 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5081);
    float _5103 = exp2(_5077);
    float _5105 = _5083 + _4838;
    float _5107 = _4904 + _4838;
    out.gl_Position.x = _4904;
    out.gl_Position.y = _4906;
    out.gl_Position.z = _5083;
    out.gl_Position.w = _4838;
    float _5109 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5111 = precise::clamp(_5109, 0.0, 1.0);
    float _5113 = fma(_4006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5061);
    float _5115 = _5105 * 0.5;
    float _5117 = fma(_5111, -2.0, 3.0);
    float _5119 = _5111 * _5111;
    out.m_98.x = _5099;
    out.m_98.y = _5101;
    out.m_98.z = _5113;
    float _5121 = _5107 * 0.5;
    float _5123 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5125 = _5119 * _5117;
    float _5127 = _4987 * _5035;
    float _5129 = _4987 * _5037;
    out.m_100.x = _5121;
    out.m_100.y = _5097;
    out.m_100.z = _5115;
    out.m_100.w = _4838;
    float _5131 = -_5125;
    float _5133 = _5131 + 1.0;
    bool _5135 = _4328 <= 8000.0;
    bool _5137 = isnan(_4328);
    bool _5139 = _5135 || _5137;
    bool _5141 = isnan(8000.0);
    bool _5143 = _5139 || _5141;
    float _5145 = float(_5143);
    float _5147 = _4987 * _5039;
    float _5149 = fma(_5123, _5101, _5129);
    float _5151 = fma(_5133, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5125);
    float _5153 = fma(_5123, _5099, _5127);
    float _5155 = fma(_5123, _5113, _5147);
    float _5157 = _5151;
    float _5159 = _5065;
    if (_5095)
    {
        _4846 = 1.0;
    }
    float _5161 = _4846;
    float _5163 = _5145 * _5151;
    float _5165 = _5161;
    float _5167 = _5163;
    if (!_5095)
    {
        float _5169 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5171 = _5169 * 0.15915493667125701904296875;
        float _5173 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5175 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5177 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5175;
        float _5179 = _5171 * 6.283185482025146484375;
        float _5181 = cos(_5179);
        float _5183 = _5173 * 0.15915493667125701904296875;
        float _5185 = _5171 * 6.283185482025146484375;
        float _5187 = sin(_5185);
        float _5189 = 1.0 / _5181;
        float _5191 = _5183 * 6.283185482025146484375;
        float _5193 = cos(_5191);
        float _5195 = _5187 * _5189;
        float _5197 = _5183 * 6.283185482025146484375;
        float _5199 = sin(_5197);
        float _5201 = _5193 * _5195;
        float _5203 = 1.0 / _5177;
        float _5205 = 1.0 / _5201;
        float _5207 = _5199 * _5205;
        float _5209 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5211 = fma(_4328, _5207, _5209);
        float _5213 = _5211 * _5203;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        _5157 = _5203;
        _5159 = _5189;
        _5165 = _5215;
    }
    float _5217 = _5157;
    float _5219 = _5159;
    float _5221 = _5165;
    float _5223 = _5163 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5225 = -_4940;
    float _5227 = _5225 + 1.0;
    float _5229 = -_5103;
    float _5231 = _5229 + 1.0;
    float _5233 = _5217;
    float _5235 = _5219;
    float _5237 = _5223;
    if (!_4818)
    {
        _5233 = 1.0;
    }
    float _5239 = _5233;
    float _5241 = _5017 + _5153;
    float _5243 = _5029 + _5149;
    float _5245 = _5033 + _5155;
    float _5247 = _5239;
    if (_4818)
    {
        bool _5249 = _4962 >= _4884;
        bool _5251 = isnan(_4962);
        bool _5253 = _5249 || _5251;
        bool _5255 = isnan(_4884);
        bool _5257 = _5253 || _5255;
        float _5259 = float(_5257);
        _5247 = _5259;
    }
    float _5261 = _5247;
    float _5263 = _5227 * _5223;
    float _5265 = precise::clamp(_5263, 0.0, 1.0);
    float _5267 = _5231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_4400)
    {
        _5235 = 1.0;
    }
    float _5269 = _5235;
    float _5271 = _5269;
    if (!_4400)
    {
        int _5273 = _4452 << 4;
        int _5275 = _5273 + 2048;
        uint _5277 = uint(int(uint(_5275) >> uint(2)));
        uint _5279 = uint(int(uint(int(_5277)) >> uint(2)));
        int _5281 = int(_5277) & 3;
        float _5283 = (*spvDescriptorSet0.vp_c15)._m0[int(_5279)][_5281];
        int _5285 = int(_5277) + 1;
        uint _5287 = uint(int(uint(_5285) >> uint(2)));
        int _5289 = _5285 & 3;
        float _5291 = (*spvDescriptorSet0.vp_c15)._m0[int(_5287)][_5289];
        int _5293 = _5275 + 8;
        uint _5295 = uint(int(uint(_5293) >> uint(2)));
        uint _5297 = uint(int(uint(int(_5295)) >> uint(2)));
        int _5299 = int(_5295) & 3;
        float _5301 = (*spvDescriptorSet0.vp_c15)._m0[int(_5297)][_5299];
        int _5303 = int(_5295) + 1;
        uint _5305 = uint(int(uint(_5303) >> uint(2)));
        int _5307 = _5303 & 3;
        float _5309 = (*spvDescriptorSet0.vp_c15)._m0[int(_5305)][_5307];
        float _5311 = _4284 * _5291;
        float _5313 = fma(_3840, _5283, _5311);
        float _5315 = fma(_3860, _5301, _5313);
        float _5317 = _5315 + _5309;
        float _5319 = precise::clamp(_5317, 0.0, 1.0);
        float _5321 = -_5319;
        float _5323 = _5321 + _4946;
        float _5325 = fma(_5323, 500.0, 1.5);
        float _5327 = exp2(_5325);
        float _5329 = 0.0 + _5327;
        float _5331 = precise::clamp(_5329, 0.0, 1.0);
        _5271 = _5331;
        _5167 = _5283;
        _5237 = _5291;
        _3916 = 500.0;
    }
    float _5333 = _5271;
    float _5335 = _5167;
    float _5337 = _5237;
    float _5339 = _3916;
    float _5341 = _5261 * _5333;
    float _5343 = _5267 * _4964;
    float _5345 = -_5265;
    float _5347 = fma(_5345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5349 = -_5267;
    float _5351 = _5349 + 1.0;
    out.m_102.x = _5241;
    out.m_102.y = _5243;
    out.m_102.z = _5245;
    float _5353 = _4975 * _5343;
    float _5355 = -_5341;
    float _5357 = fma(_5355, _5347, 1.0);
    float _5359 = precise::clamp(_5357, 0.0, 1.0);
    float _5361 = _4985 * _5343;
    float _5363 = _4975 * _5351;
    float _5365 = fma(_4981, _5353, _4969);
    float _5367 = fma(_4983, _5353, _4971);
    float _5369 = _5359 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5371 = fma(_4975, _5361, _4973);
    bool _5373 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5375 = isnan(_4262);
    bool _5377 = _5373 || _5375;
    bool _5379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5381 = _5377 || _5379;
    float _5383 = _5221 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_104.x = _5369;
    out.m_106.x = _5365;
    out.m_106.y = _5367;
    out.m_106.z = _5371;
    out.m_106.w = _5363;
    float _5385 = _5337;
    float _5387 = _5335;
    float _5389 = _5339;
    float _5391 = _5351;
    float _5393 = _5353;
    float _5395 = _5359;
    if (!_5381)
    {
        _5385 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5397 = _5385;
    float _5399 = _5397;
    float _5401 = _5397;
    if (!_5381)
    {
        _5387 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5403 = _5387;
    float _5405 = _5403;
    float _5407 = _5403;
    if (!_5381)
    {
        _5389 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5409 = _5389;
    float _5411 = _5409;
    float _5413 = _5409;
    if (!_5381)
    {
        _5391 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5415 = _5391;
    float _5417 = _5415;
    float _5419 = _5415;
    if (!_5381)
    {
        _5393 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5421 = _5393;
    float _5423 = _5421;
    float _5425 = _5421;
    if (!_5381)
    {
        _5395 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5427 = _5395;
    bool _5429 = !_5381;
    float _5431 = _5427;
    float _5433 = _5427;
    if (!_5429)
    {
        bool _5435 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5437 = isnan(_4262);
        bool _5439 = _5435 || _5437;
        bool _5441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5443 = _5439 || _5441;
        if (!_5443)
        {
            float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5447 = _4262 + _5445;
            float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5451 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5449;
            float _5453 = 1.0 / _5451;
            float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5457 = _5455 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5463 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5465 = _5463 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5467 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5469 = _5467 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5471 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5473 = _5471 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5475 = _5447 * _5453;
            float _5477 = precise::clamp(_5475, 0.0, 1.0);
            float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5481 = _5479 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5483 = fma(_5477, _5457, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5485 = fma(_5477, _5481, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5487 = fma(_5477, _5461, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5489 = fma(_5477, _5465, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5491 = fma(_5477, _5469, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5493 = fma(_5477, _5473, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5407 = _5485;
            _5425 = _5491;
            _5401 = _5483;
            _5419 = _5489;
            _5413 = _5487;
            _5433 = _5493;
            _5495 = true;
        }
        else
        {
            bool _5497 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5499 = isnan(_4262);
            bool _5501 = _5497 || _5499;
            bool _5503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5505 = _5501 || _5503;
            if (!_5505)
            {
                _5399 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5507 = _5399;
            _5401 = _5507;
            if (!_5505)
            {
                _5405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5509 = _5405;
            _5407 = _5509;
            if (!_5505)
            {
                _5411 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5511 = _5411;
            _5413 = _5511;
            if (!_5505)
            {
                _5417 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5513 = _5417;
            _5419 = _5513;
            if (!_5505)
            {
                _5423 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5515 = _5423;
            _5425 = _5515;
            if (!_5505)
            {
                _5431 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5517 = _5431;
            bool _5519 = !_5505;
            _5433 = _5517;
            if (!_5519)
            {
                bool _5521 = _4262 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5523 = isnan(_4262);
                bool _5525 = _5521 || _5523;
                bool _5527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5529 = _5525 || _5527;
                if (!_5529)
                {
                    float _5531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5533 = _4262 + _5531;
                    float _5535 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5537 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5535;
                    float _5539 = 1.0 / _5537;
                    float _5541 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5543 = _5541 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5545 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5547 = _5545 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5549 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5551 = _5549 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5553 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5555 = _5553 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5557 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5559 = _5557 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5561 = _5533 * _5539;
                    float _5563 = precise::clamp(_5561, 0.0, 1.0);
                    float _5565 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5567 = _5565 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5569 = fma(_5563, _5543, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5571 = fma(_5563, _5567, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5573 = fma(_5563, _5547, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5575 = fma(_5563, _5551, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5577 = fma(_5563, _5555, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5579 = fma(_5563, _5559, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5407 = _5571;
                    _5425 = _5577;
                    _5401 = _5569;
                    _5419 = _5575;
                    _5413 = _5573;
                    _5433 = _5579;
                    _5495 = true;
                }
                else
                {
                    _5407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5425 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5401 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5419 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5413 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5433 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5495 = false;
    float _5581 = _5407;
    float _5583 = _5425;
    float _5585 = _5401;
    float _5587 = _5419;
    float _5589 = _5413;
    float _5591 = _5433;
    float _5593 = fma(_5243, -0.5, 0.5);
    float _5595 = precise::clamp(_5593, 0.0, 1.0);
    float _5597 = -_5581;
    float _5599 = _5597 + _5583;
    float _5601 = -_5585;
    float _5603 = _5601 + _5587;
    out.m_108.x = 0.0;
    float _5605 = fma(_5595, _5599, _5581);
    float _5607 = -_5589;
    float _5609 = _5607 + _5591;
    float _5611 = fma(_5595, _5603, _5585);
    float _5613 = _5605 * 0.586610972881317138671875;
    bool _5615 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5617 = fma(_5595, _5609, _5589);
    float _5619 = _5383 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5621 = fma(_5611, 0.298911988735198974609375, _5613);
    bool _5623 = _5221 > 0.0;
    bool _5625 = isnan(_5221);
    bool _5627 = _5623 || _5625;
    bool _5629 = isnan(0.0);
    bool _5631 = _5627 || _5629;
    float _5633 = fma(_5617, 0.114477999508380889892578125, _5621);
    out.m_63.x = _5619;
    float _5635 = -_5633;
    float _5637 = _5611 + _5635;
    float _5639 = -_5633;
    float _5641 = _5605 + _5639;
    float _5643 = -_5633;
    float _5645 = _5617 + _5643;
    float _5647 = fma(_5637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    float _5649 = fma(_5641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    float _5651 = fma(_5645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5633);
    bool _5653 = !_5615;
    if (!_5653)
    {
        float _5655 = -_4218;
        float _5657 = _5655 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5659 = -_4222;
        float _5661 = _5659 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5663 = -_4226;
        float _5665 = _5663 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5667 = _5657 * _5657;
        float _5669 = fma(_5661, _5661, _5667);
        float _5671 = fma(_5665, _5665, _5669);
        float _5673 = sqrt(_5671);
        float _5675 = rsqrt(_5671);
        float _5677 = -_5673;
        float _5679 = _5677 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5681 = _5679 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5683 = precise::clamp(_5681, 0.0, 1.0);
        float _5685 = _5661 * _5675;
        float _5687 = _5657 * _5675;
        float _5689 = abs(_5683);
        float _5691 = log2(_5689);
        float _5693 = _5665 * _5675;
        float _5695 = _5685 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5697 = _5243 * _5687;
        float _5699 = -_5687;
        float _5701 = -_5695;
        float _5703 = fma(_5699, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5701);
        float _5705 = fma(_5241, _5685, _5697);
        float _5707 = -_5693;
        float _5709 = fma(_5707, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5703);
        float _5711 = fma(_5245, _5693, _5705);
        float _5713 = precise::clamp(_5711, 0.0, 1.0);
        float _5715 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5717 = _5709 + _5715;
        float _5719 = _5691 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5721 = _5717 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5723 = precise::clamp(_5721, 0.0, 1.0);
        float _5725 = exp2(_5719);
        float _5727 = _5725 * _5723;
        float _5729 = _5713 * _5727;
        float _5731 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5733 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5735 = _5729 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5731;
        out.m_108.y = _5733;
        out.m_108.z = _5735;
    }
    out.m_110.x = _5647;
    out.m_110.y = _5649;
    out.m_110.z = _5651;
    if (_5631)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5737 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5737;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

