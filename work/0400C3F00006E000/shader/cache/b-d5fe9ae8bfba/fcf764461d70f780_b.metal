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
    float4 m_90 [[user(locn5)]];
    float4 m_98 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
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
    float4 m_94 [[attribute(4)]];
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5411 = false;
    bool _679 = false;
    bool _459 = false;
    bool _271 = false;
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
        float _5669 = as_type<float>(_153);
        out.gl_Position.z = _5669;
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
        float _5732 = as_type<float>(_185);
        out.gl_Position.z = _5732;
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
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_219;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _191 * _197;
    float _233 = _191 * _203;
    float _235 = fma(_189, _195, _231);
    float _237 = _191 * _209;
    float _239 = fma(_189, _201, _233);
    float _241 = fma(_193, _199, _235);
    float _243 = fma(_189, _207, _237);
    float _245 = fma(_193, _205, _239);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    bool _251 = false;
    float _269;
    if (!_249)
    {
        float _253 = in.m_76.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _179;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _273 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _293;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _289;
    float _317 = 1.0 / _297;
    float _319 = _285 * _311;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = _277 * _315;
    bool _335 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_273);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_309;
    float _349 = _347 + 1.0;
    float _351 = _345 * _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = _281 * _317;
    bool _359 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _361 = isnan(_273);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_345;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _369 * _373;
    float _389 = -_369;
    float _391 = _389 + 1.0;
    float _393 = fma(_377, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_381, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _331 * _391;
    float _399 = -_331;
    float _401 = _399 + 1.0;
    float _403 = fma(_355, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = _393 * _397;
    float _407 = _395 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _423 = fma(_411, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _425 = fma(_403, _387, _415);
    float _427 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_413, _387, _421);
    float _431 = fma(_423, _351, _425);
    float _433 = fma(_427, _351, _429);
    float _435 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _431);
    float _437 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _433);
    bool _439 = !_313;
    float _457;
    if (!_439)
    {
        float _441 = in.m_76.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _179;
    }
    _459 = false;
    float _461 = _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _479 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_461);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _469;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _501 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_461);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_489;
    float _515 = _513 + 1.0;
    bool _517 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _519 = isnan(_461);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _473;
    float _531 = -_511;
    float _533 = _531 + 1.0;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _537 = _489 * _533;
    float _539 = _495 * _491;
    float _541 = 1.0 / _477;
    bool _543 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_461);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _557;
    float _561 = -_553;
    float _563 = _561 + 1.0;
    float _565 = _553 * _515;
    float _567 = 1.0 / _499;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = _527 * _563;
    float _575 = -_527;
    float _577 = _575 + 1.0;
    float _579 = _571 * _529;
    float _581 = _555 * _573;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _585 = _461 + _583;
    float _587 = _559 * _541;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _591 = _461 + _589;
    bool _593 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _595 = isnan(_461);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _609 = fma(_579, _585, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _611 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[115].x, _581);
    float _613 = fma(_587, _591, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _615 = -_603;
    float _617 = _615 + 1.0;
    float _619 = _607 * _567;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _623 = _461 + _621;
    float _625 = fma(_609, _565, _611);
    float _627 = _511 * _617;
    float _629 = fma(_619, _623, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _631 = fma(_613, _537, _625);
    float _633 = fma(_629, _627, _631);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _639 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[119].x, _633);
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = in.m_78.x;
    float _653 = in.m_78.y;
    out.m_80.x = _643;
    out.m_80.y = _645;
    out.m_80.z = _649;
    out.m_80.w = _647;
    float _655 = _437 * _653;
    float _657 = _435 * _651;
    bool _659 = !_535;
    float _677;
    if (!_659)
    {
        float _661 = in.m_76.x;
        float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _665 = _661 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _669 = _667 * _663;
        float _671 = floor(_669);
        float _673 = -_671;
        float _675 = _669 + _673;
        _677 = _675;
        _679 = true;
    }
    else
    {
        _677 = _179;
    }
    _679 = false;
    float _681 = _677;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _685 = _681 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _695;
    bool _699 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _701 = isnan(_681);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = 1.0 / _689;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _721 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _723 = isnan(_681);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    bool _733 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _735 = isnan(_681);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = 1.0 / _693;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _749 = _697 * _711;
    bool _751 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = isnan(_681);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _715;
    float _765 = -_709;
    float _767 = _765 + 1.0;
    float _769 = fma(_749, _685, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _771 = -_761;
    float _773 = _771 + 1.0;
    float _775 = _761 * _767;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _781;
    float _785 = 1.0 / _719;
    float _787 = -_731;
    float _789 = _787 + 1.0;
    float _791 = _743 * _773;
    float _793 = _779 * _745;
    float _795 = -_743;
    float _797 = _795 + 1.0;
    float _799 = _709 * _789;
    float _801 = _769 * _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _805 = _681 + _803;
    float _807 = _783 * _763;
    bool _809 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _811 = isnan(_681);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = _681 + _825;
    float _829 = fma(_793, _805, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[131].x, _801);
    float _833 = -_819;
    float _835 = _833 + 1.0;
    float _837 = fma(_807, _827, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _839 = _823 * _785;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _843 = _681 + _841;
    float _845 = fma(_829, _775, _831);
    float _847 = _731 * _835;
    float _849 = fma(_839, _843, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _851 = fma(_837, _799, _845);
    float _853 = fma(_849, _847, _851);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _861 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[135].x, _853);
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = _861 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _863;
    out.m_82.y = _865;
    out.m_82.z = _867;
    out.m_82.w = _869;
    bool _871 = !_747;
    float _873 = _865;
    float _875 = _869;
    if (!_871)
    {
        float _877 = in.m_76.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _881 = _877 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _885 = _883 * _879;
        float _887 = floor(_885);
        float _889 = -_887;
        float _891 = _885 + _889;
        _181 = _891;
    }
    float _893 = _181;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _897 = int(_895);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _901 = _899 != 0;
    float _903 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _905 = int(_903);
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _909 = int(_907);
    float _911 = float(_897);
    float _913 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _915 = int(_913);
    float _917 = float(_905);
    float _919 = 1.0 / _911;
    float _921 = float(_909);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _925 = int(_923);
    float _927 = float(uint(_915));
    float _929 = 1.0 / _917;
    float _931 = _919 * _135;
    float _933 = _919;
    if (_901)
    {
        float _935 = in.m_76.w;
        _933 = _935;
    }
    float _937 = _933;
    float _939 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _941 = int(_939);
    float _943 = float(uint(_925));
    int _945 = ~_925;
    int _947 = _945 + 1;
    float _949 = 1.0 / _921;
    float _951 = _929 * _135;
    float _953 = 1.0 / _927;
    float _955 = float(uint(_941));
    int _957 = ~_941;
    int _959 = _957 + 1;
    float _961 = _937;
    if (_901)
    {
        float _963 = _937 * 3.1415927410125732421875;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = trunc(_931);
    int _969 = int(_967);
    float _971 = _949 * _135;
    if (_901)
    {
        float _973 = _965 * 0.15915493667125701904296875;
        _873 = _973;
    }
    float _975 = _873;
    float _977 = 1.0 / _943;
    int _979 = as_type<int>(_953) + (-2);
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _983 = _981 != 0;
    float _985 = trunc(_951);
    int _987 = int(_985);
    float _989 = float(uint(_969));
    int _991 = ~_915;
    int _993 = _991 + 1;
    float _995 = as_type<float>(_979) * _989;
    float _997 = 1.0 / _955;
    int _999 = as_type<int>(_977) + (-2);
    if (_983)
    {
        _875 = 1.0;
    }
    float _1001 = _875;
    float _1003 = 0.0;
    float _1005 = _1001;
    if (_983)
    {
        _1003 = 1.0;
    }
    float _1007 = _1003;
    float _1009 = trunc(_971);
    int _1011 = int(_1009);
    float _1013 = float(uint(_987));
    int _1015 = 0;
    float _1017 = _1007;
    if (_983)
    {
        _1015 = 0;
    }
    int _1019 = _1015;
    float _1021 = as_type<float>(_999) * _1013;
    int _1023 = as_type<int>(_997) + (-2);
    float _1025 = trunc(_995);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_1011));
    float _1034 = trunc(_1021);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = as_type<float>(_1023) * _1032;
    float _1042 = trunc(_1040);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    int _1048 = _993 * int(_1030);
    int _1050 = _1048 + _969;
    float _1052 = float(uint(_1050));
    float _1054 = _975;
    int _1056 = _1019;
    if (_901)
    {
        float _1058 = _975 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        _1054 = _1060;
    }
    float _1062 = _1054;
    float _1064 = _965;
    float _1066 = _1040;
    if (_983)
    {
        float _1068 = in.m_76.x;
        float _1070 = in.m_76.y;
        _1064 = _1068;
        _1066 = _1070;
    }
    float _1072 = _1064;
    float _1074 = _1066;
    int _1076 = _947 * int(_1038);
    int _1078 = _1076 + _987;
    float _1080 = as_type<float>(_979) * _1052;
    float _1082 = in.m_76.z;
    float _1084 = in.m_76.w;
    float _1086 = float(uint(_1078));
    int _1088 = _959 * int(_1046);
    int _1090 = _1088 + _1011;
    float _1092 = trunc(_1080);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    float _1098 = as_type<float>(_999) * _1086;
    float _1100 = float(uint(_1090));
    float _1102 = as_type<float>(_1023) * _1100;
    float _1104 = trunc(_1098);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = as_type<int>(_1100);
    float _1112 = _1086;
    float _1114 = _1080;
    if (_983)
    {
        _1110 = 0;
    }
    int _1116 = _1110;
    float _1118 = _1072;
    float _1120 = _1074;
    int _1122 = _1116;
    if (_983)
    {
        _1112 = _1072;
    }
    float _1124 = _1112;
    float _1126 = trunc(_1102);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = 0.0;
    float _1134 = _1124;
    if (_983)
    {
        _1132 = _1074;
    }
    float _1136 = _1132;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (_983)
    {
        _1138 = _1124;
    }
    float _1142 = _1138;
    float _1144 = _1142;
    if (_983)
    {
        _1114 = _1124;
    }
    float _1146 = _1114;
    float _1148 = _1146;
    if (!_983)
    {
        float _1150 = in.m_76.x;
        float _1152 = in.m_76.y;
        float _1154 = in.m_76.z;
        float _1156 = _1150 * 3.1415927410125732421875;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1152 * 3.1415927410125732421875;
        float _1162 = _1160 * 0.15915493667125701904296875;
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        _1017 = 5.839270114898681640625;
        _1148 = _1154;
        _1005 = 7.345489978790283203125;
        _1118 = _1150;
        _1120 = _1152;
        _1134 = _1152;
        _1122 = 1;
        _1144 = _1166;
        _1056 = 2;
        _1140 = _1170;
    }
    float _1172 = _1017;
    float _1174 = _1148;
    float _1176 = _1005;
    float _1178 = _1118;
    float _1180 = _1120;
    float _1182 = _1134;
    int _1184 = _1122;
    float _1186 = _1144;
    int _1188 = _1056;
    float _1190 = _1140;
    float _1192 = _1172 * _1174;
    int _1194 = ~_915;
    int _1196 = _1194 + 1;
    float _1198 = _1176 * _1178;
    int _1200 = int(_1030) + int(_1096);
    float _1202 = in.m_70.w;
    int _1204 = ~_941;
    int _1206 = _1204 + 1;
    float _1208 = floor(_1198);
    int _1210 = int(_1046) + int(_1130);
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1214 = _893 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1218 = _893 + _1216;
    int _1220 = ~_925;
    int _1222 = _1220 + 1;
    int _1224 = _1196 * _1200;
    int _1226 = _1224 + _969;
    float _1228 = floor(_1192);
    int _1230 = int(_1038) + int(_1108);
    int _1232 = _1206 * _1210;
    int _1234 = _1232 + _1011;
    bool _1236 = uint(_1226) >= uint(_915);
    bool _1238 = uint(_1234) >= uint(_941);
    int _1240 = _1222 * _1230;
    int _1242 = _1240 + _987;
    bool _1244 = !_1236;
    int _1246 = _1244 ? 0 : (-1);
    float _1248 = -_1208;
    float _1250 = _1198 + _1248;
    bool _1252 = _1084 > 0.5;
    bool _1254 = !_1238;
    int _1256 = _1254 ? 0 : (-1);
    int _1258 = ~_1200;
    int _1260 = _1258 + _1246;
    int _1262 = _1260 + 1;
    float _1264 = -_1228;
    float _1266 = _1192 + _1264;
    float _1268 = _1202;
    if (_901)
    {
        bool _1270 = _1062 > 0.5;
        _251 = _1270;
    }
    bool _1272 = _251;
    bool _1274 = _1082 > 0.5;
    int _1276 = _915 * _1262;
    int _1278 = _1276 + _969;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1282 = _1280 != 0;
    float _1284 = -_229;
    int _1286 = _1252 ? as_type<int>(_1284) : as_type<int>(_229);
    bool _1288 = uint(_1242) >= uint(_925);
    float _1290 = float(_915);
    bool _1292 = _1180 > 0.5;
    float _1294 = 0.0;
    if (!_901)
    {
        _1294 = _225;
    }
    float _1296 = _1294;
    float _1298 = _1250 * _1290;
    float _1300 = -_229;
    int _1302 = _1274 ? as_type<int>(_1300) : as_type<int>(_229);
    bool _1304 = !_1282;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = _1296;
    if (_901)
    {
        float _1310 = -_225;
        float _1312 = _1272 ? _1310 : _225;
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = trunc(_1298);
    int _1318 = int(_1316);
    float _1320 = float(_969);
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1332 = _1330 != 0;
    float _1334 = -_225;
    int _1336 = _1292 ? as_type<int>(_1334) : as_type<int>(_225);
    float _1338 = float(_941);
    bool _1340 = _1320 >= _1290;
    bool _1342 = isnan(_1320);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(_1290);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    bool _1352 = !_1332;
    float _1354 = _1352 ? _229 : as_type<float>(_1302);
    bool _1356 = !_1328;
    float _1358 = _1356 ? _225 : as_type<float>(_1336);
    float _1360 = trunc(_1350);
    int _1362 = int(_1360);
    float _1364 = float(_1011);
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1372 = _1370 != 0;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1380 = _1378 != 0;
    bool _1382 = _1364 >= _1338;
    bool _1384 = isnan(_1364);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(_1338);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1266 * _1338;
    bool _1396 = !_1372;
    int _1398 = _1396 ? 0 : 1;
    bool _1400 = !_1368;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = trunc(_1392);
    int _1406 = int(_1404);
    bool _1408 = !_1376;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1414 = _1412 != 0;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1418 = _1416 != 0;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1380;
    int _1426 = _1424 ? 0 : 1;
    int _1428 = ~_1210;
    int _1430 = _1428 + _1256;
    int _1432 = _1430 + 1;
    float _1434 = trunc(_1394);
    int _1436 = int(_1434);
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1440 = _1438 != 0;
    bool _1442 = !_1418;
    int _1444 = _1442 ? 0 : 1;
    int _1446 = _941 * _1432;
    int _1448 = _1446 + _1011;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1452 = _1450 != 0;
    int _1454 = abs(_1306);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1458 = _1456 != 0;
    bool _1460 = !_1324;
    float _1462 = _1460 ? _229 : as_type<float>(_1286);
    int _1464 = _1318 * _1454;
    int _1466 = _1464 + _969;
    bool _1468 = !_1440;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = _175 * _135;
    bool _1474 = !_1452;
    int _1476 = _1474 ? 0 : 1;
    bool _1478 = !_1288;
    int _1480 = _1478 ? 0 : (-1);
    float _1482 = _1290 * _1472;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1486 = _1484 != 0;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1498 = _1496 != 0;
    float _1500 = _1338 * _1472;
    bool _1502 = !_1414;
    int _1504 = _1502 ? 0 : 1;
    float _1506 = trunc(_1482);
    int _1508 = int(_1506);
    bool _1510 = _915 == 0;
    int _1512 = abs(_1470);
    bool _1514 = !_1490;
    int _1516 = _1514 ? 0 : 1;
    bool _1518 = _941 == 0;
    int _1520 = _1436 * _1512;
    int _1522 = _1520 + _1011;
    int _1524 = ~_1362;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    float _1530 = trunc(_1500);
    int _1532 = int(_1530);
    bool _1534 = !_1510;
    int _1536 = _1534 ? _1278 : (-1);
    int _1538 = ~_1406;
    int _1540 = _1538 + 1;
    int _1542 = _1540 + 1;
    bool _1544 = !_1518;
    int _1546 = _1544 ? _1448 : (-1);
    int _1548 = _1536 * _1528;
    int _1550 = _915 + (-1);
    int _1552 = abs(_1398);
    int _1554 = _1546 * _1542;
    int _1556 = _941 + (-1);
    int _1558 = _1362 * _1550;
    int _1560 = _1558 + _1548;
    int _1562 = abs(_1402);
    int _1564 = _1406 * _1556;
    int _1566 = _1564 + _1554;
    int _1568 = abs(_1410);
    int _1570 = _1560 * _1552;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1574 = _893 + _1572;
    int _1576 = abs(_1444);
    int _1578 = _1508 * _1562;
    int _1580 = _1578 + _1570;
    int _1582 = abs(_1426);
    bool _1584 = !_1422;
    int _1586 = _1584 ? 0 : 1;
    int _1588 = _1466 * _1568;
    int _1590 = _1588 + _1580;
    int _1592 = abs(_1504);
    int _1594 = _1318 * _1582;
    int _1596 = _1594 + _1590;
    int _1598 = abs(_1586);
    int _1600 = _1566 * _1576;
    float _1602 = float(uint(_1596));
    int _1604 = abs(_1476);
    int _1606 = _1532 * _1592;
    int _1608 = _1606 + _1600;
    float _1610 = float(_925);
    float _1612 = as_type<float>(_979) * _1602;
    float _1614 = float(_987);
    int _1616 = _1522 * _1598;
    int _1618 = _1616 + _1608;
    int _1620 = ~_915;
    int _1622 = _1620 + 1;
    bool _1624 = _1614 >= _1610;
    bool _1626 = isnan(_1614);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(_1610);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    int _1636 = _1436 * _1604;
    int _1638 = _1636 + _1618;
    float _1640 = trunc(_1612);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    float _1646 = _1176 * _1182;
    float _1648 = _1610 * _1472;
    int _1650 = ~_1230;
    int _1652 = _1650 + _1480;
    int _1654 = _1652 + 1;
    float _1656 = float(uint(_1638));
    int _1658 = ~_941;
    int _1660 = _1658 + 1;
    float _1662 = floor(_1646);
    int _1664 = _925 * _1654;
    int _1666 = _1664 + _987;
    float _1668 = as_type<float>(_1023) * _1656;
    bool _1670 = !_1458;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1516);
    int _1676 = abs(_1672);
    float _1678 = trunc(_1668);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    int _1684 = _1622 * int(_1644);
    int _1686 = _1684 + _1596;
    bool _1688 = _1082 > 0.5;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1692 = _1690 != 0;
    float _1694 = float(uint(_1686));
    float _1696 = trunc(_1634);
    int _1698 = int(_1696);
    bool _1700 = !_1486;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = -_1662;
    float _1706 = _1646 + _1704;
    bool _1708 = _925 == 0;
    float _1710 = as_type<float>(_979) * _1694;
    int _1712 = abs(_1702);
    float _1714 = _1706 * _1610;
    bool _1716 = !_1708;
    int _1718 = _1716 ? _1666 : (-1);
    int _1720 = _1660 * int(_1682);
    int _1722 = _1720 + _1638;
    float _1724 = trunc(_1710);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    int _1730 = _925 + (-1);
    float _1732 = float(uint(_1722));
    int _1734 = ~_1698;
    int _1736 = _1734 + 1;
    int _1738 = _1736 + 1;
    float _1740 = trunc(_1648);
    int _1742 = int(_1740);
    float _1744 = as_type<float>(_1023) * _1732;
    int _1746 = _1718 * _1738;
    bool _1748 = !_1494;
    int _1750 = _1748 ? 0 : 1;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1758 = _1756 != 0;
    float _1760 = trunc(_1714);
    int _1762 = int(_1760);
    int _1764 = _1698 * _1730;
    int _1766 = _1764 + _1746;
    int _1768 = ~_915;
    int _1770 = _1768 + 1;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1776 = int(_1644) + int(_1728);
    int _1778 = _1766 * _1674;
    int _1780 = abs(_1750);
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1786 = trunc(_1744);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    int _1792 = _1742 * _1712;
    int _1794 = _1792 + _1778;
    int _1796 = ~_941;
    int _1798 = _1796 + 1;
    int _1800 = _1770 * _1776;
    int _1802 = _1800 + _1596;
    float _1804 = as_type<float>(_1750);
    float _1806 = as_type<float>(_1568);
    float _1808 = _1574;
    float _1810 = _1314;
    if (_1758)
    {
        float _1812 = in.m_76.x;
        _1804 = _1812;
    }
    float _1814 = _1804;
    if (!_1758)
    {
        _1806 = _229;
    }
    float _1816 = _1806;
    int _1818 = _1762 * _1676;
    int _1820 = _1818 + _987;
    bool _1822 = !_1498;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = 1.0 / _1754;
    bool _1828 = uint(_1802) >= uint(_915);
    int _1830 = _1820 * _1780;
    int _1832 = _1830 + _1794;
    int _1834 = abs(_1824);
    bool _1836 = !_1828;
    int _1838 = _1836 ? 0 : (-1);
    int _1840 = int(_1682) + int(_1790);
    float _1842 = 1.0 / _1774;
    float _1844 = float(uint(_1466));
    int _1846 = _1798 * _1840;
    int _1848 = _1846 + _1638;
    int _1850 = ~_1776;
    int _1852 = _1850 + _1838;
    int _1854 = _1852 + 1;
    int _1856 = _1762 * _1834;
    int _1858 = _1856 + _1832;
    float _1860 = float(uint(_1522));
    float _1862 = as_type<float>(_979) * _1844;
    float _1864 = -_225;
    int _1866 = _1688 ? as_type<int>(_1864) : as_type<int>(_225);
    int _1868 = _915 * _1854;
    int _1870 = _1868 + _1596;
    bool _1872 = uint(_1848) >= uint(_941);
    float _1874 = trunc(_1862);
    float _1876 = precise::max(_1874, 0.0);
    uint _1878 = uint(_1876);
    float _1880 = as_type<float>(_1023) * _1860;
    int _1882 = ~_915;
    int _1884 = _1882 + 1;
    bool _1886 = !_1510;
    int _1888 = _1886 ? _1870 : (-1);
    float _1890 = as_type<float>(_1870);
    float _1892 = _1816;
    if (_1758)
    {
        float _1894 = _1814 * 3.1415927410125732421875;
        _1890 = _1894;
    }
    float _1896 = _1890;
    bool _1898 = !_1692;
    float _1900 = _1898 ? _225 : as_type<float>(_1866);
    float _1902 = trunc(_1880);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1888 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = _1896;
    if (_1758)
    {
        float _1914 = _1896 * 0.15915493667125701904296875;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = float(uint(_1858));
    int _1920 = _1910 ? 0 : 1;
    int _1922 = _1888 & 3;
    bool _1924 = _1922 != 0;
    int _1926 = _1884 * int(_1878);
    int _1928 = _1926 + _1466;
    float _1930 = as_type<float>(_999) * _1918;
    float _1932 = _1916;
    if (_1758)
    {
        float _1934 = _1916 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1932 = _1936;
    }
    float _1938 = _1932;
    bool _1940 = !_1872;
    int _1942 = _1940 ? 0 : (-1);
    bool _1944 = uint(_1922) > 1u;
    float _1946 = float(uint(_1928));
    int _1948 = ~_941;
    int _1950 = _1948 + 1;
    float _1952 = trunc(_1930);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = ~_1840;
    int _1960 = _1958 + _1942;
    int _1962 = _1960 + 1;
    float _1964 = as_type<float>(_979) * _1946;
    int _1966 = ~_1920;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1950 * int(_1906);
    int _1974 = _1972 + _1522;
    int _1976 = ~_925;
    int _1978 = _1976 + 1;
    bool _1980 = _1180 > 0.5;
    float _1982 = trunc(_1964);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    float _1988 = float(uint(_1974));
    int _1990 = _1970;
    bool _1992 = _1944;
    if (!_1944)
    {
        int _1994 = ~_1920;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    if (_1758)
    {
        bool _2000 = _1938 > 0.5;
        _1992 = _2000;
    }
    bool _2002 = _1992;
    float _2004 = as_type<float>(_1023) * _1988;
    int _2006 = _941 * _1962;
    int _2008 = _2006 + _1638;
    int _2010 = _1978 * int(_1956);
    int _2012 = _2010 + _1858;
    if (_1758)
    {
        float _2014 = -_229;
        float _2016 = _2002 ? _2014 : _229;
        _1892 = _2016;
    }
    float _2018 = _1892;
    float _2020 = trunc(_2004);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    bool _2026 = _1922 != 3;
    bool _2028 = uint(_1922) >= 2u;
    float _2030 = float(uint(_2012));
    bool _2032 = !_1518;
    int _2034 = _2032 ? _2008 : (-1);
    float _2036 = 1.0 / _1784;
    int _2038 = _2028 ? 0 : 1;
    int _2040 = int(_1878) + int(_1986);
    float _2042 = as_type<float>(_999) * _2030;
    float _2044 = -_229;
    int _2046 = _1980 ? as_type<int>(_2044) : as_type<int>(_229);
    int _2048 = _2034 & 3;
    bool _2050 = _2048 != 0;
    int _2052 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2042);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = ~_2038;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    int _2068 = _2066;
    if (_2026)
    {
        int _2070 = ~_2038;
        int _2072 = _2070 + 1;
        _2068 = _2072;
    }
    int _2074 = _2068;
    bool _2076 = uint(_2048) > 1u;
    bool _2078 = !_2054;
    float _2080 = _2078 ? _229 : as_type<float>(_2046);
    int _2082 = ~_915;
    int _2084 = _2082 + 1;
    int _2086 = _2034 & 3;
    bool _2088 = _2086 != 0;
    int _2090 = int(_1906) + int(_2024);
    int _2092 = _2084 * _2040;
    int _2094 = _2092 + _1466;
    int _2096 = _2088 ? 0 : 1;
    int _2098 = ~_941;
    int _2100 = _2098 + 1;
    int _2102 = ~_2096;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2106;
    if (!_2076)
    {
        int _2110 = ~_2096;
        int _2112 = _2110 + 1;
        _2108 = _2112;
    }
    int _2114 = _2108;
    int _2116 = _2100 * _2090;
    int _2118 = _2116 + _1522;
    bool _2120 = uint(_2094) >= uint(_915);
    int _2122 = int(_1956) + int(_2060);
    bool _2124 = !_2120;
    int _2126 = _2124 ? 0 : (-1);
    bool _2128 = uint(_2118) >= uint(_941);
    float _2130 = in.m_56.x;
    float _2132 = in.m_56.y;
    float _2134 = in.m_56.z;
    bool _2136 = _2048 != 3;
    bool _2138 = !_1924;
    int _2140 = _2138 ? 0 : 1;
    bool _2142 = uint(_2048) >= 2u;
    int _2144 = _2142 ? 0 : 1;
    int _2146 = ~_925;
    int _2148 = _2146 + 1;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2152 = _2150 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2154 = ~_2144;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    int _2160 = _2158;
    if (_2136)
    {
        int _2162 = ~_2144;
        int _2164 = _2162 + 1;
        _2160 = _2164;
    }
    int _2166 = _2160;
    int _2168 = _2148 * _2122;
    int _2170 = _2168 + _1858;
    float _2172 = 1.0 / _2152;
    bool _2174 = _2048 != 3;
    bool _2176 = !_2050;
    int _2178 = _2176 ? 0 : 1;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2184 = uint(_2170) >= uint(_925);
    float _2186 = _197 * _2132;
    float _2188 = _203 * _2132;
    float _2190 = _209 * _2132;
    float _2192 = fma(_195, _2130, _2186);
    float _2194 = fma(_201, _2130, _2188);
    float _2196 = fma(_207, _2130, _2190);
    float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2204 = _2202 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2206 = fma(_199, _2134, _2192);
    float _2208 = fma(_211, _2134, _2196);
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2212 = _2210 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2214 = fma(_205, _2134, _2194);
    float _2216 = 1.0 / _2204;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2222 = _2200 * _1826;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2230 = _2228 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2232 = _2220 * _1842;
    bool _2234 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2236 = isnan(_893);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2242 = _2238 || _2240;
    float _2244 = float(_2242);
    float _2246 = 1.0 / _2212;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2248;
    float _2252 = _2230 * _2036;
    bool _2254 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2256 = isnan(_893);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = -_2244;
    float _2268 = _2266 + 1.0;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2274 = _2206 + _1202;
    float _2276 = 1.0 / _2182;
    float _2278 = _2250 * _2216;
    bool _2280 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2282 = isnan(_893);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = -_2264;
    float _2294 = _2292 + 1.0;
    float _2296 = _2264 * _2268;
    bool _2298 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2300 = isnan(_893);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2310;
    bool _2314 = !_2174;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = _2272 * _2246;
    float _2320 = _2290 * _2294;
    float _2322 = -_2290;
    float _2324 = _2322 + 1.0;
    bool _2326 = !_2128;
    int _2328 = _2326 ? 0 : (-1);
    float _2330 = _2312 * _2172;
    int _2332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2334 = _2332 != 0;
    float _2336 = _2308 * _2324;
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2340 = _2338 != 0;
    float _2342 = _2226 * _2276;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2346 = _2344 != 0;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2350 = _893 + _2348;
    bool _2352 = !_2184;
    int _2354 = _2352 ? 0 : (-1);
    float _2356 = -_2308;
    float _2358 = _2356 + 1.0;
    bool _2360 = _1178 > 0.5;
    float _2362 = fma(_2222, _2350, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2364 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2366 = isnan(_893);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2372 = _2368 || _2370;
    float _2374 = float(_2372);
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2378 = _893 + _2376;
    float _2380 = fma(_2342, _1574, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2382 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2384 = isnan(_893);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = _2374 * _2358;
    float _2396 = -_225;
    int _2398 = _2360 ? as_type<int>(_2396) : as_type<int>(_225);
    float _2400 = -_2374;
    float _2402 = _2400 + 1.0;
    int _2404 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2406 = _2404 != 0;
    float _2408 = -_2392;
    float _2410 = _2408 + 1.0;
    bool _2412 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2414 = isnan(_893);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2392 * _2402;
    float _2426 = fma(_2232, _2378, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2428 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2430 = isnan(_893);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = in.m_72.w;
    float _2442 = _2422 * _2410;
    float _2444 = -_2422;
    float _2446 = _2444 + 1.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2450 = _893 + _2448;
    float _2452 = in.m_74.w;
    float _2454 = fma(_2252, _1214, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2456 = _2438 * _2446;
    float _2458 = fma(_2278, _2450, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2460 = fma(_2330, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2462 = _2362 * _2456;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2466 = _893 + _2464;
    bool _2468 = !_2406;
    float _2470 = _2468 ? _225 : as_type<float>(_2398);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2474 = _1184 != 1;
    float _2476 = -_2438;
    float _2478 = _2476 + 1.0;
    float _2480 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2482 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2462);
    float _2484 = fma(_2318, _2466, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2488 = _2018 + (-0.5);
    float _2490 = fma(_2426, _2442, _2482);
    float _2492 = _2214 + _2440;
    float _2494 = -_2486;
    float _2496 = fma(_2480, 2.0, _2494);
    float _2498 = _2482;
    float _2500 = _2462;
    float _2502 = _2442;
    if (!_2474)
    {
        _1268 = _1180;
    }
    float _2504 = _1268;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2508 = _2504;
    if (!_2474)
    {
        _1808 = _1180;
    }
    float _2510 = _1808;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2514 = _2510;
    if (!_2474)
    {
        _2498 = _1082;
    }
    float _2516 = _2498;
    float _2518 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2520 = _2516;
    if (!_2474)
    {
        _2500 = _1082;
    }
    float _2522 = _2500;
    float _2524 = _2208 + _2452;
    float _2526 = _2522;
    float _2528 = _2452;
    if (_2474)
    {
        _2508 = _1178;
    }
    float _2530 = _2508;
    float _2532 = -_135;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2496);
    if (_2474)
    {
        _2514 = _1178;
    }
    float _2536 = _2514;
    if (_2474)
    {
        _2520 = _1180;
    }
    float _2538 = _2520;
    float _2540 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2474)
    {
        _2526 = _1180;
    }
    float _2542 = _2526;
    bool _2544 = _1188 != 2;
    float _2546 = fma(_2380, _2424, _2490);
    float _2548 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2550 = fma(_2548, -2.0, _2472);
    float _2552 = fma(_2454, _2394, _2546);
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2560 = _2492 + _2558;
    float _2562 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2554);
    float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2566 = _2274 + _2564;
    float _2568 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2556);
    float _2570 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2574 = -_2512;
    float _2576 = fma(_2518, 2.0, _2574);
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2580 = _2524 + _2578;
    float _2582 = fma(_2570, -2.0, _2506);
    float _2584 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2572);
    if (_2544)
    {
        _2528 = _1180;
    }
    float _2586 = _2528;
    float _2588 = fma(_2458, _2336, _2552);
    float _2590 = _2586;
    if (_2544)
    {
        _2502 = _1178;
    }
    float _2592 = _2502;
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2584);
    float _2596 = _2592;
    if (!_2544)
    {
        _2596 = _1082;
    }
    float _2598 = _2596;
    float _2600 = -_135;
    float _2602 = fma(_2600, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2576);
    if (!_2544)
    {
        _2590 = _1178;
    }
    float _2604 = _2590;
    float _2606 = _1314 + 0.5;
    bool _2608 = _2594 >= 0.0;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2612 = fma(_2606, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2602);
    float _2614 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2582);
    float _2616 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2610);
    int _2618 = _2034 >> 31;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2622 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2550);
    float _2624 = -_2488;
    float _2626 = -_2614;
    float _2628 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2626);
    int _2630 = _2618 & 3;
    float _2632 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2620);
    float _2634 = _2080 + (-0.5);
    float _2636 = fma(_2484, _2320, _2588);
    int _2638 = _2034 + _2630;
    float _2640 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2642 = float(uint(_1820));
    float _2644 = -_2634;
    float _2646 = -_2622;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2646);
    int _2650 = _2638 >> 2;
    float _2652 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2654 = as_type<float>(_999) * _2642;
    int _2656 = _2650 << 4;
    int _2658 = _2656 + 656;
    float _2660 = fma(_2460, _2296, _2636);
    float _2662 = _2470 + 0.5;
    float _2664 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2666 = uint(int(uint(_2658) >> uint(2)));
    uint _2668 = uint(int(uint(int(_2666)) >> uint(2)));
    int _2670 = int(_2666) & 3;
    float _2672 = (*spvDescriptorSet0.vp_c9)._m0[int(_2668)][_2670];
    int _2674 = int(_2666) + 1;
    uint _2676 = uint(int(uint(_2674) >> uint(2)));
    int _2678 = _2674 & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    float _2682 = trunc(_2654);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = -_2664;
    float _2690 = fma(_2652, 2.0, _2688);
    float _2692 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2568);
    float _2694 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2534);
    int _2696 = ~_925;
    int _2698 = _2696 + 1;
    float _2700 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2702 = _2658 + 8;
    uint _2704 = uint(int(uint(_2702) >> uint(2)));
    uint _2706 = uint(int(uint(int(_2704)) >> uint(2)));
    int _2708 = int(_2704) & 3;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[int(_2706)][_2708];
    int _2712 = int(_2704) + 1;
    uint _2714 = uint(int(uint(_2712) >> uint(2)));
    int _2716 = _2712 & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    float _2720 = _2604 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2724 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2562);
    float _2726 = fma(_2720, -2.0, _2700);
    int _2728 = abs(_2114);
    float _2730 = -_135;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2690);
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2736 = _2698 * int(_2686);
    int _2738 = _2736 + _1820;
    int _2740 = ~_2122;
    int _2742 = _2740 + _2354;
    int _2744 = _2742 + 1;
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2748 = -_2734;
    float _2750 = fma(_2540, 2.0, _2748);
    float _2752 = -_2692;
    float _2754 = _2752 + 1.0;
    float _2756 = float(uint(_2738));
    float _2758 = -_2724;
    float _2760 = _2758 + 1.0;
    float _2762 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2660);
    int _2764 = abs(_2178);
    int _2766 = _925 * _2744;
    int _2768 = _2766 + _1858;
    float _2770 = -_2760;
    float _2772 = fma(_2770, _1314, _2612);
    if (_2608)
    {
        _1810 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2774 = _1810;
    float _2776 = as_type<float>(_999) * _2756;
    float _2778 = fma(_2754, _2018, _2628);
    float _2780 = _2722 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2782 = as_type<int>(_2722);
    if (_2608)
    {
        float _2784 = _2774 * 5.0;
        _2782 = as_type<int>(_2784);
    }
    int _2786 = _2782;
    out.m_84.x = _2772;
    out.m_84.y = _2778;
    float _2788 = trunc(_2776);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    int _2794 = ~_2090;
    int _2796 = _2794 + _2328;
    int _2798 = _2796 + 1;
    float _2800 = _1900 + 0.5;
    if (_2608)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9577 = as_type<float>(_2786);
        out.gl_Position.z = _9577;
    }
    int _2802 = ~_925;
    int _2804 = _2802 + 1;
    float _2806 = -_135;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2750);
    int _2810 = _941 * _2798;
    int _2812 = _2810 + _1522;
    int _2814 = abs(_1998);
    float _2816 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2818 = abs(_2166);
    float _2820 = fma(_2780, _2800, _2808);
    int _2822 = abs(_2316);
    float _2824 = _1462 + (-0.5);
    int _2826 = ~_2814;
    int _2828 = _2826 + 1;
    int _2830 = _2828 + 1;
    float _2832 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2616);
    int _2834 = ~_2728;
    int _2836 = _2834 + 1;
    int _2838 = _2836 + 1;
    float _2840 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2842 = int(_2840);
    float _2844 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2632);
    int _2846 = int(_2686) + int(_2792);
    int _2848 = _2838 * as_type<int>(_2680);
    int _2850 = ~_2764;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = -_2844;
    float _2858 = _2856 + 1.0;
    int _2860 = _1888 >> 31;
    int _2862 = _2804 * _2846;
    int _2864 = _2862 + _1820;
    int _2866 = _2854 * as_type<int>(_2672);
    int _2868 = _2866 + _2848;
    int _2870 = _2860 & 3;
    out.m_86.x = _2762;
    int _2872 = ~_2818;
    int _2874 = _2872 + 1;
    int _2876 = _2874 + 1;
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2880 = _1888 + _2870;
    int _2882 = as_type<int>(_2858);
    if (_2608)
    {
        out.m_63.x = 0.0;
    }
    int _2884 = ~_2822;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    int _2890 = _2876 * as_type<int>(_2710);
    int _2892 = _2890 + _2868;
    bool _2894 = !_1708;
    int _2896 = _2894 ? _2768 : (-1);
    float _2898 = fma(_2640, -2.0, _2878);
    bool _2900 = !_2340;
    int _2902 = _2900 ? 0 : 1;
    int _2904 = _2888 * as_type<int>(_2718);
    int _2906 = _2904 + _2892;
    int _2908 = _2896 >> 31;
    float _2910 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2898);
    float _2912 = float(uint(_2842));
    int _2914 = _2908 & 3;
    float _2916 = -_2816;
    float _2918 = -_2910;
    float _2920 = fma(_2916, _2824, _2918);
    int _2922 = abs(_2902);
    float _2924 = 1.0 / _2912;
    int _2926 = abs(_2842);
    float _2928 = fma(_1462, _2858, _2920);
    int _2930 = _2896 + _2914;
    int _2932 = _2880 >> 2;
    float _2934 = float(uint(_2926));
    int _2936 = ~_2922;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    int _2942 = _2930 >> 2;
    float _2944 = 1.0 / _2934;
    int _2946 = _2932 << 4;
    int _2948 = _2946 + 368;
    int _2950 = _2906 * _2940;
    bool _2952 = _1922 != 3;
    bool _2954 = !_1518;
    int _2956 = _2954 ? _2812 : (-1);
    uint _2958 = uint(int(uint(_2948) >> uint(2)));
    uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
    int _2962 = int(_2958) & 3;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[int(_2960)][_2962];
    int _2966 = int(_2958) + 1;
    uint _2968 = uint(int(uint(_2966) >> uint(2)));
    int _2970 = _2966 & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = _2942 << 4;
    int _2976 = _2974 + 800;
    int _2978 = _2896 & 3;
    bool _2980 = _2978 != 0;
    int _2982 = _2956 * _2922;
    int _2984 = _2982 + _2950;
    bool _2986 = !_2952;
    int _2988 = _2986 ? 0 : (-1);
    bool _2990 = uint(_2864) >= uint(_925);
    uint _2992 = uint(int(uint(_2976) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c9)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[int(_3002)][_3004];
    bool _3008 = !_2980;
    int _3010 = _3008 ? 0 : 1;
    int _3012 = _2896 & 3;
    bool _3014 = _3012 != 0;
    int _3016 = as_type<int>(_2924) + (-2);
    int _3018 = _3014 ? 0 : 1;
    int _3020 = _2976 + 8;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    uint _3024 = uint(int(uint(int(_3022)) >> uint(2)));
    int _3026 = int(_3022) & 3;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[int(_3024)][_3026];
    int _3030 = int(_3022) + 1;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    int _3034 = _3030 & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    float _3038 = float(uint(_2984));
    bool _3040 = uint(_2978) >= 2u;
    int _3042 = ~_2040;
    int _3044 = _3042 + _2126;
    int _3046 = _3044 + 1;
    float _3048 = as_type<float>(_3016) * _3038;
    int _3050 = abs(_2984);
    int _3052 = _2948 + 8;
    uint _3054 = uint(int(uint(_3052) >> uint(2)));
    uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
    int _3058 = int(_3054) & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = int(_3054) + 1;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    int _3066 = _3062 & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = _3040 ? 0 : 1;
    int _3072 = _915 * _3046;
    int _3074 = _3072 + _1466;
    bool _3076 = uint(_2978) > 1u;
    float _3078 = trunc(_3048);
    float _3080 = precise::max(_3078, 0.0);
    uint _3082 = uint(_3080);
    int _3084 = as_type<int>(_2944) + (-2);
    float _3086 = float(uint(_3050));
    bool _3088 = !_2990;
    int _3090 = _3088 ? 0 : (-1);
    bool _3092 = _2978 != 3;
    float _3094 = as_type<float>(_3084) * _3086;
    int _3096 = ~_2846;
    int _3098 = _3096 + _3090;
    int _3100 = _3098 + 1;
    int _3102 = ~_3018;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = trunc(_3094);
    float _3110 = precise::max(_3108, 0.0);
    uint _3112 = uint(_3110);
    int _3114 = _3106;
    if (!_3076)
    {
        int _3116 = ~_3018;
        int _3118 = _3116 + 1;
        _3114 = _3118;
    }
    int _3120 = _3114;
    int _3122 = _925 * _3100;
    int _3124 = _3122 + _1820;
    int _3126 = ~_2842;
    int _3128 = _3126 + 1;
    bool _3130 = _2978 != 3;
    int _3132 = _2830 * as_type<int>(_2972);
    int _3134 = ~_3070;
    int _3136 = _3134 + 1;
    int _3138 = _3136 + 1;
    int _3140 = _3138;
    if (_3092)
    {
        int _3142 = ~_3070;
        int _3144 = _3142 + 1;
        _3140 = _3144;
    }
    int _3146 = _3140;
    int _3148 = abs(_2140);
    int _3150 = _3128 * int(_3082);
    int _3152 = _3150 + _2984;
    int _3154 = ~_2926;
    int _3156 = _3154 + 1;
    int _3158 = abs(_3120);
    float _3160 = float(uint(_3152));
    int _3162 = _3156 * int(_3112);
    int _3164 = _3162 + _3050;
    int _3166 = ~_3158;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    int _3172 = ~_3148;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = as_type<float>(_3016) * _3160;
    float _3180 = float(uint(_3164));
    int _3182 = _3170 * as_type<int>(_3006);
    int _3184 = abs(_3010);
    float _3186 = trunc(_3178);
    float _3188 = precise::max(_3186, 0.0);
    uint _3190 = uint(_3188);
    int _3192 = _3176 * as_type<int>(_2964);
    int _3194 = _3192 + _3132;
    float _3196 = as_type<float>(_3084) * _3180;
    int _3198 = abs(_2074);
    int _3200 = abs(_3146);
    int _3202 = ~_3184;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    float _3208 = trunc(_3196);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    int _3214 = abs(_2988);
    int _3216 = ~_3198;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3206 * as_type<int>(_2998);
    int _3224 = _3222 + _3182;
    int _3226 = ~_3200;
    int _3228 = _3226 + 1;
    int _3230 = _3228 + 1;
    int _3232 = ~_3214;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * as_type<int>(_3060);
    int _3240 = _3238 + _3194;
    int _3242 = ~_2842;
    int _3244 = _3242 + 1;
    int _3246 = _3230 * as_type<int>(_3028);
    int _3248 = _3246 + _3224;
    bool _3250 = !_3130;
    int _3252 = _3250 ? 0 : (-1);
    int _3254 = _3236 * as_type<int>(_3068);
    int _3256 = _3254 + _3240;
    bool _3258 = !_2334;
    int _3260 = _3258 ? 0 : 1;
    int _3262 = int(_3082) + int(_3190);
    int _3264 = abs(_3252);
    int _3266 = abs(_3260);
    int _3268 = _3244 * _3262;
    int _3270 = _3268 + _2984;
    int _3272 = ~_3264;
    int _3274 = _3272 + 1;
    int _3276 = _3274 + 1;
    int _3278 = int(_3112) + int(_3212);
    int _3280 = ~_2926;
    int _3282 = _3280 + 1;
    int _3284 = _3276 * as_type<int>(_3036);
    int _3286 = _3284 + _3248;
    int _3288 = ~_3266;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    bool _3294 = uint(_3270) >= uint(_2842);
    int _3296 = _3282 * _3278;
    int _3298 = _3296 + _3050;
    bool _3300 = !_2346;
    int _3302 = _3300 ? 0 : 1;
    int _3304 = _3256 * _3292;
    bool _3306 = !_3294;
    int _3308 = _3306 ? 0 : (-1);
    float _3310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3312 = abs(_3302);
    bool _3314 = uint(_3298) >= uint(_2926);
    int _3316 = _2984 ^ _2842;
    int _3318 = ~_3262;
    int _3320 = _3318 + _3308;
    int _3322 = _3320 + 1;
    int _3324 = ~_3312;
    int _3326 = _3324 + 1;
    int _3328 = _3326 + 1;
    bool _3330 = !_3314;
    int _3332 = _3330 ? 0 : (-1);
    int _3334 = _2842 * _3322;
    int _3336 = _3334 + _2984;
    uint _3338 = uint(int(uint(_3316) >> uint(31)));
    int _3340 = _3286 * _3328;
    bool _3342 = _2842 == 0;
    float _3344 = _3310 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3346 = _2842 == 0;
    float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3350 = ~_3332;
    int _3352 = _3278 + _3350;
    int _3354 = _3352 + 1;
    float _3356 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2726);
    int _3358 = ~int(_3338);
    int _3360 = _3358 + 1;
    bool _3362 = !_1510;
    int _3364 = _3362 ? _3074 : (-1);
    int _3366 = _3354 ^ _3360;
    bool _3368 = !_3342;
    int _3370 = _3368 ? _3336 : (-1);
    int _3372 = _3364 * _3266;
    int _3374 = _3372 + _3304;
    int _3376 = ~_3360;
    int _3378 = _3376 + _3366;
    int _3380 = _3378 + 1;
    float _3382 = float(_3370);
    bool _3384 = !_3346;
    int _3386 = _3384 ? _3380 : (-1);
    float _3388 = fma(_3344, _3382, _2732);
    float _3390 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3394 = _1358 + 0.5;
    float _3396 = float(_3386);
    float _3398 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3392);
    bool _3400 = !_1708;
    int _3402 = _3400 ? _3124 : (-1);
    float _3404 = fma(_3344, _3394, _3388);
    float _3406 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3408 = -_3356;
    float _3410 = fma(_3390, _3396, _3408);
    float _3412 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3398);
    float _3414 = _1354 + (-0.5);
    float _3416 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3406);
    int _3418 = _3402 * _3312;
    int _3420 = _3418 + _3340;
    float _3422 = -_3412;
    float _3424 = _3422 + 1.0;
    float _3426 = -_3390;
    float _3428 = fma(_3426, _3414, _3410);
    float _3430 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3416);
    float _3432 = -_3424;
    float _3434 = fma(_1358, _3432, _3404);
    float _3436 = _2560 * _2560;
    float _3438 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3440 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3442 = -_3430;
    float _3444 = _3442 + 1.0;
    float _3446 = fma(_2566, _2566, _3436);
    float _3448 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3438);
    float _3450 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3440);
    float _3452 = -_3444;
    float _3454 = fma(_2470, _3452, _2694);
    float _3456 = fma(_2580, _2580, _3446);
    float _3458 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3448);
    float _3460 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3450);
    float _3462 = float(_3374);
    float _3464 = -_3458;
    float _3466 = _3464 + 1.0;
    float _3468 = rsqrt(_3456);
    float _3470 = -_2832;
    float _3472 = _3470 + 1.0;
    float _3474 = -_3460;
    float _3476 = _3474 + 1.0;
    float _3478 = fma(_2080, _3466, _2648);
    float _3480 = float(_3420);
    float _3482 = -_3472;
    float _3484 = fma(_1900, _3482, _2820);
    float _3486 = fma(_1354, _3476, _3428);
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3490 = _3488 != 0;
    int _3492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3494 = _3492 != 0;
    int _3496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3498 = _3496 != 0;
    out.m_88.x = _3462;
    out.m_90.x = _3454;
    out.m_90.y = _3478;
    out.m_90.z = _3484;
    out.m_90.w = _2928;
    bool _3500 = !_3494;
    int _3502 = _3500 ? 0 : 1;
    bool _3504 = !_3498;
    int _3506 = _3504 ? 0 : 1;
    out.m_88.w = _3480;
    float _3508 = _2560 * _3468;
    float _3510 = _2566 * _3468;
    bool _3512 = !_3490;
    int _3514 = _3512 ? 0 : 1;
    out.m_92.x = _3434;
    out.m_92.y = _3486;
    float _3516 = _3484;
    if (_2608)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3518 = -_3508;
    float _3520 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2492);
    float _3522 = _2580 * _3468;
    float _3524 = -_3510;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2274);
    float _3528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3530 = _3520 + _3528;
    float _3532 = -_3522;
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2524);
    float _3536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3538 = _3526 + _3536;
    float _3540 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3544 = _3534 + _3542;
    float _3546 = fma(_3538, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3540);
    float _3548 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3546);
    bool _3550 = _3548 >= 0.0;
    float _3552 = _3538;
    if (_3550)
    {
        _3516 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3554 = _3516;
    int _3556 = as_type<int>(_3554);
    if (_3550)
    {
        out.m_63.x = 0.0;
    }
    if (_3550)
    {
        float _3558 = _3554 * 5.0;
        _3556 = as_type<int>(_3558);
    }
    int _3560 = _3556;
    if (_3550)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10682 = as_type<float>(_3560);
        out.gl_Position.z = _10682;
    }
    if (_3550)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3562 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3564 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3566 = floor(_3562);
    float _3568 = floor(_3564);
    float _3570 = -_3566;
    float _3572 = _3562 + _3570;
    float _3574 = -_3568;
    float _3576 = _3564 + _3574;
    float2 _10718 = float2(_3572, _3576);
    float _3578 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10718, float2(0.0), isnan(_10718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10718, float2(0.0), isnan(_10718)), level(0.0)).x;
    float _3580 = _1082 * 2.0;
    float _3582 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3584 = log2(_3582);
    float _3586 = _1178 * 2.0;
    float _3588 = _1180 + _1178;
    float _3590 = _1180 * 2.0;
    int _3592 = abs(_3514);
    float _3594 = -_3508;
    float _3596 = fma(_3594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2560);
    float _3598 = _3588 + (-1.0);
    float _3600 = -_3510;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2566);
    float _3604 = floor(_3580);
    float _3606 = _3596 * _3596;
    float _3608 = float(_3592);
    float _3610 = -_3522;
    float _3612 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2580);
    float _3614 = floor(_3586);
    float _3616 = _3584 * _135;
    bool _3618 = _3604 > 0.0;
    float _3620 = floor(_3590);
    bool _3622 = _3604 >= 0.0;
    bool _3624 = isnan(_3604);
    bool _3626 = _3622 || _3624;
    bool _3628 = isnan(0.0);
    bool _3630 = _3626 || _3628;
    float _3632 = fma(_3598, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3634 = _1180 + _1082;
    float _3636 = _1180 + (-0.5);
    int _3638 = _3630 ? 0 : 1;
    float _3640 = _3634 + (-1.0);
    float _3642 = exp2(_3616);
    bool _3644 = _3614 >= 0.0;
    bool _3646 = isnan(_3614);
    bool _3648 = _3644 || _3646;
    bool _3650 = isnan(0.0);
    bool _3652 = _3648 || _3650;
    float _3654 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3656 = ~_3638;
    int _3658 = _3656 + 1;
    int _3660 = _3658 + 1;
    int _3662 = _3660;
    int _3664 = 2;
    if (!_3618)
    {
        int _3666 = ~_3638;
        int _3668 = _3666 + 1;
        _3662 = _3668;
    }
    int _3670 = _3662;
    float _3672 = _3520 + _3654;
    bool _3674 = _3614 > 0.0;
    bool _3676 = _3620 > 0.0;
    float _3678 = fma(_3640, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3680 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3682 = 1.0 + _3680;
    float _3684 = in.m_94.x;
    float _3686 = in.m_94.y;
    float _3688 = in.m_94.z;
    bool _3690 = _3620 >= 0.0;
    bool _3692 = isnan(_3620);
    bool _3694 = _3690 || _3692;
    bool _3696 = isnan(0.0);
    bool _3698 = _3694 || _3696;
    float _3700 = -_3642;
    float _3702 = _3700 + 1.0;
    float _3704 = 1.0 / _3682;
    int _3706 = _3652 ? 0 : 1;
    bool _3708 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3710 = isnan(1.0);
    bool _3712 = _3708 || _3710;
    bool _3714 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3716 = _3712 || _3714;
    int _3718 = ~_3706;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3722;
    if (!_3674)
    {
        int _3726 = ~_3706;
        int _3728 = _3726 + 1;
        _3724 = _3728;
    }
    int _3730 = _3724;
    bool _3732 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3734 = isnan(0.0);
    bool _3736 = _3732 || _3734;
    bool _3738 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3740 = _3736 || _3738;
    float _3742 = float(_3670);
    float _3744 = _3740 ? _3702 : 0.0;
    int _3746 = abs(_3502);
    float _3748 = _3608 * _3742;
    float _3750 = float(_3730);
    if (_3716)
    {
        float _3752 = _3744 * _3704;
        _145 = _3752;
    }
    float _3754 = _145;
    float _3756 = float(_3746);
    float _3758 = fma(_3602, _3602, _3606);
    float _3760 = _3748 * (-2.0);
    int _3762 = _3698 ? 0 : 1;
    float _3764 = _3756 * _3750;
    float _3766 = _1178 + (-0.5);
    float _3768 = fma(_3760, _3684, _3684);
    float _3770 = fma(_3632, _3760, _3632);
    int _3772 = abs(_3506);
    float _3774 = _1178 + _1082;
    float _3776 = fma(_3766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3768);
    float _3778 = _3764 * (-2.0);
    int _3780 = ~_3762;
    int _3782 = _3780 + 1;
    int _3784 = _3782 + 1;
    float _3786 = _3774 + (-1.0);
    int _3788 = _3784;
    if (!_3676)
    {
        int _3790 = ~_3762;
        int _3792 = _3790 + 1;
        _3788 = _3792;
    }
    int _3794 = _3788;
    float _3796 = fma(_3678, _3778, _3678);
    float _3798 = fma(_3778, _3686, _3686);
    float _3800 = _1082 + (-0.5);
    float _3802 = float(_3794);
    float _3804 = fma(_3636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3798);
    float _3806 = float(_3772);
    float _3808 = fma(_3770, _3754, _3776);
    float _3810 = fma(_3612, _3612, _3758);
    float _3812 = fma(_3796, _3754, _3804);
    float _3814 = _3806 * _3802;
    float _3816 = _3808 * 0.15915493667125701904296875;
    float _3818 = _3812 * 0.15915493667125701904296875;
    float _3820 = _3814 * (-2.0);
    float _3822 = sqrt(_3810);
    float _3824 = fma(_3786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3826 = fma(_3820, _3688, _3688);
    float _3828 = fma(_3824, _3820, _3824);
    float _3830 = fma(_3800, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3826);
    float _3832 = _3816 * 6.283185482025146484375;
    float _3834 = sin(_3832);
    float _3836 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3838 = fma(_3828, _3754, _3830);
    float _3840 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3842 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3836);
    float _3844 = _3838 * 0.15915493667125701904296875;
    float _3846 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3840);
    float _3848 = _3816 * 6.283185482025146484375;
    float _3850 = cos(_3848);
    float _3852 = _3468 * _3822;
    float _3854 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3842);
    float _3856 = fma(_3534, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3846);
    float _3858 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3860 = _3856 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3862 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3864 = _3818 * 6.283185482025146484375;
    float _3866 = sin(_3864);
    float _3868 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3862);
    float _3870 = fma(_3534, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3868);
    float _3872 = 1.0 / _3860;
    float _3874 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3876 = _3874 + _3860;
    float _3878 = _3818 * 6.283185482025146484375;
    float _3880 = cos(_3878);
    float _3882 = _3834 * _3866;
    float _3884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3886 = _3844 * 6.283185482025146484375;
    float _3888 = sin(_3886);
    float _3890 = _3876 * _3872;
    float _3892 = _3890 * 0.5;
    float _3894 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3896 = _3850 * _3866;
    float _3898 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3900 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3898);
    float _3902 = _3844 * 6.283185482025146484375;
    float _3904 = cos(_3902);
    float _3906 = _3850 * _3880;
    float _3908 = fma(_3888, _3906, _3882);
    float _3910 = 1.0 / _3900;
    float _3912 = fma(_3888, _3882, _3906);
    float _3914 = _3852 * _3894;
    float _3916 = _3834 * _3880;
    float _3918 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3920 = _3850 * _3904;
    float _3922 = _3880 * _3904;
    float _3924 = _3834 * _3904;
    float _3926 = _3866 * _3904;
    float _3928 = _3884 * _3914;
    float _3930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3932 = _3852 * _3918;
    float _3934 = -_3896;
    float _3936 = fma(_3888, _3916, _3934);
    float _3938 = -_3916;
    float _3940 = fma(_3888, _3896, _3938);
    float _3942 = -_3928;
    float _3944 = _3888 * _3942;
    float _3946 = _3930 * _3932;
    float _3948 = _3920 * _3928;
    float _3950 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3952 = _3924 * _3928;
    float _3954 = fma(_3922, _3946, _3944);
    float _3956 = fma(_3908, _3946, _3948);
    float _3958 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3950);
    float _3960 = fma(_3936, _3946, _3952);
    float _3962 = _3852 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3964 = _3962 * 0.5;
    float _3966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3968 = _3910 * _3966;
    float _3970 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3958);
    float _3972 = trunc(_3858);
    int _3974 = int(_3972);
    float _3976 = fma(_3940, _3964, _3956);
    float _3978 = fma(_3926, _3964, _3954);
    bool _3980 = _3968 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3982 = _3970 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3984 = _3968 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3986 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3988 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3990 = trunc(_3982);
    int _3992 = int(_3990);
    float _3994 = fma(_3912, _3964, _3960);
    float _3996 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3986);
    float _3998 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3988);
    bool _4000 = !_3980;
    int _4002 = _4000 ? 0 : 1;
    float _4004 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4006 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3996);
    float _4008 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3998);
    int _4010 = as_type<int>(_3976);
    int _4012 = as_type<int>(_3994);
    float _4014 = _4004;
    if (!_3980)
    {
        _3664 = 1;
    }
    int _4016 = _3664;
    float _4018 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4004);
    int _4020 = _4016;
    if (!_3984)
    {
        _4020 = _4002;
    }
    int _4022 = _4020;
    float _4024 = _4006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4026 = _4008 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _4028 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4030 = _3974 + _4028;
    int _4032 = _4030 + 1;
    float _4034 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4018);
    int _4036 = _4022 << 6;
    float _4038 = _2524 + _4024;
    int _4040 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4042 = _3992 + _4040;
    int _4044 = _4042 + 1;
    float _4046 = _2274 + _4026;
    int _4048 = _4036 + 48;
    uint _4050 = uint(int(uint(_4048) >> uint(2)));
    uint _4052 = uint(int(uint(int(_4050)) >> uint(2)));
    int _4054 = int(_4050) & 3;
    float _4056 = (*spvDescriptorSet0.vp_c15)._m0[int(_4052)][_4054];
    int _4058 = int(_4050) + 1;
    uint _4060 = uint(int(uint(_4058) >> uint(2)));
    int _4062 = _4058 & 3;
    float _4064 = (*spvDescriptorSet0.vp_c15)._m0[int(_4060)][_4062];
    float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4068 = _4038 + _4066;
    int _4070 = _4044 | _4032;
    float _4072 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4074 = _4046 + _4072;
    bool _4076 = _4044 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4078 = _4068 * _4068;
    float _4080 = _4034 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _4082 = _4036 + 56;
    uint _4084 = uint(int(uint(_4082) >> uint(2)));
    uint _4086 = uint(int(uint(int(_4084)) >> uint(2)));
    int _4088 = int(_4084) & 3;
    float _4090 = (*spvDescriptorSet0.vp_c15)._m0[int(_4086)][_4088];
    int _4092 = int(_4084) + 1;
    uint _4094 = uint(int(uint(_4092) >> uint(2)));
    int _4096 = _4092 & 3;
    float _4098 = (*spvDescriptorSet0.vp_c15)._m0[int(_4094)][_4096];
    float _4100 = fma(_4074, _4074, _4078);
    bool _4102 = _4070 < 0;
    bool _4104 = _4102 || _4076;
    float _4106 = _2492 + _4080;
    float _4108 = sqrt(_4100);
    bool _4110 = _4032 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4112 = _4110 || _4104;
    int _4114 = _4036 + 64;
    uint _4116 = uint(int(uint(_4114) >> uint(2)));
    uint _4118 = uint(int(uint(int(_4116)) >> uint(2)));
    int _4120 = int(_4116) & 3;
    float _4122 = (*spvDescriptorSet0.vp_c15)._m0[int(_4118)][_4120];
    int _4124 = int(_4116) + 1;
    uint _4126 = uint(int(uint(_4124) >> uint(2)));
    int _4128 = _4124 & 3;
    float _4130 = (*spvDescriptorSet0.vp_c15)._m0[int(_4126)][_4128];
    int _4132 = _4036 + 72;
    uint _4134 = uint(int(uint(_4132) >> uint(2)));
    uint _4136 = uint(int(uint(int(_4134)) >> uint(2)));
    int _4138 = int(_4134) & 3;
    float _4140 = (*spvDescriptorSet0.vp_c15)._m0[int(_4136)][_4138];
    int _4142 = int(_4134) + 1;
    uint _4144 = uint(int(uint(_4142) >> uint(2)));
    int _4146 = _4142 & 3;
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[int(_4144)][_4146];
    float _4150 = as_type<float>(_4032);
    float _4152 = _4046;
    float _4154 = as_type<float>(_4044);
    if (!_4112)
    {
        int _4156 = _4032 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4158 = _4156 + _4044;
        _4010 = _4158;
    }
    int _4160 = _4010;
    bool _4162 = _4108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4164 = _4036 + 96;
    uint _4166 = uint(int(uint(_4164) >> uint(2)));
    uint _4168 = uint(int(uint(int(_4166)) >> uint(2)));
    int _4170 = int(_4166) & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    int _4174 = int(_4166) + 1;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    int _4178 = _4174 & 3;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[int(_4176)][_4178];
    float _4182 = as_type<float>(_4160);
    if (!_4112)
    {
        int _4184 = _4160 << 2;
        _4012 = _4184;
    }
    int _4186 = _4012;
    int _4188 = _4186;
    if (!_4112)
    {
        uint _4190 = uint(int(uint(_4160) >> uint(2)));
        _2882 = int(_4190);
    }
    int _4192 = _2882;
    float _4194 = as_type<float>(_4192);
    if (!_4112)
    {
        int _4196 = 12 & _4186;
        _4188 = _4196;
    }
    int _4198 = _4188;
    int _4200 = _4036 + 104;
    uint _4202 = uint(int(uint(_4200) >> uint(2)));
    uint _4204 = uint(int(uint(int(_4202)) >> uint(2)));
    int _4206 = int(_4202) & 3;
    float _4208 = (*spvDescriptorSet0.vp_c15)._m0[int(_4204)][_4206];
    int _4210 = int(_4202) + 1;
    uint _4212 = uint(int(uint(_4210) >> uint(2)));
    int _4214 = _4210 & 3;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[int(_4212)][_4214];
    if (!_4112)
    {
        int _4218 = _4192 << 4;
        int _4220 = _4218 + _4198;
        _4194 = as_type<float>(_4220);
    }
    float _4222 = _4194;
    if (!_4162)
    {
        _4150 = _4046;
    }
    float _4224 = _4150;
    float _4226 = _4224;
    if (!_4162)
    {
        _4152 = _4038;
    }
    float _4228 = _4152;
    float _4230 = _4228;
    if (!_4162)
    {
        _4154 = _4106;
    }
    float _4232 = _4154;
    bool _4234 = !_4162;
    float _4236 = _4232;
    if (!_4234)
    {
        float _4238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4242 = _4108 + _4240;
        float _4244 = rsqrt(_4100);
        float _4246 = _4242 * _4238;
        float _4248 = _4106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4250 = _4246 * 0.15915493667125701904296875;
        float _4252 = _4250 * 6.283185482025146484375;
        float _4254 = cos(_4252);
        float _4256 = _4250 * 6.283185482025146484375;
        float _4258 = sin(_4256);
        float _4260 = _4254 + (-1.0);
        float _4262 = fma(_4258, _4248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4264 = _4260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4266 = _4244 * _4262;
        float _4268 = fma(_4106, _4254, _4264);
        float _4270 = fma(_4074, _4266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4272 = fma(_4068, _4266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4236 = _4268;
        _4226 = _4270;
        _4230 = _4272;
        _4014 = _4266;
    }
    float _4274 = _4236;
    float _4276 = _4226;
    float _4278 = _4230;
    float _4280 = _4014;
    float _4282 = -_2492;
    float _4284 = _4282 + _4274;
    int _4286 = _4036 + 80;
    uint _4288 = uint(int(uint(_4286) >> uint(2)));
    uint _4290 = uint(int(uint(int(_4288)) >> uint(2)));
    int _4292 = int(_4288) & 3;
    float _4294 = (*spvDescriptorSet0.vp_c15)._m0[int(_4290)][_4292];
    int _4296 = int(_4288) + 1;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    int _4300 = _4296 & 3;
    float _4302 = (*spvDescriptorSet0.vp_c15)._m0[int(_4298)][_4300];
    float _4304 = -_2274;
    float _4306 = _4304 + _4276;
    float _4308 = -_2524;
    float _4310 = _4308 + _4278;
    float _4312 = _4284 * _4284;
    float _4314 = _3672 * _4180;
    float _4316 = _4280;
    float _4318 = _4312;
    float _4320 = _4276;
    float _4322 = _4274;
    float _4324 = _4278;
    if (!_4112)
    {
        float _4326 = floor(_3858);
        _4316 = _4326;
    }
    float _4328 = _4316;
    float _4330 = _3672 * _4130;
    float _4332 = fma(_4306, _4306, _4312);
    int _4334 = _4036 + 88;
    uint _4336 = uint(int(uint(_4334) >> uint(2)));
    uint _4338 = uint(int(uint(int(_4336)) >> uint(2)));
    int _4340 = int(_4336) & 3;
    float _4342 = (*spvDescriptorSet0.vp_c15)._m0[int(_4338)][_4340];
    int _4344 = int(_4336) + 1;
    uint _4346 = uint(int(uint(_4344) >> uint(2)));
    int _4348 = _4344 & 3;
    float _4350 = (*spvDescriptorSet0.vp_c15)._m0[int(_4346)][_4348];
    float _4352 = fma(_3526, _4172, _4314);
    float _4354 = fma(_3526, _4122, _4330);
    float _4356 = fma(_4310, _4310, _4332);
    float _4358 = fma(_3534, _4208, _4352);
    float _4360 = _4328;
    if (!_4112)
    {
        float _4362 = floor(_3982);
        _4318 = _4362;
    }
    float _4364 = _4318;
    bool _4366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4368 = isnan(0.5);
    bool _4370 = _4366 || _4368;
    bool _4372 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4374 = _4370 || _4372;
    float _4376 = _4222;
    if (!_4112)
    {
        int _4378 = as_type<int>(_4222) + 400;
        uint _4380 = uint(int(uint(_4378) >> uint(2)));
        uint _4382 = uint(int(uint(int(_4380)) >> uint(2)));
        int _4384 = int(_4380) & 3;
        float _4386 = (*spvDescriptorSet0.vp_c15)._m0[int(_4382)][_4384];
        _4376 = _4386;
    }
    float _4388 = _4376;
    float _4390 = _4358 + _4216;
    float _4392 = _3672 * _4064;
    float _4394 = fma(_3534, _4140, _4354);
    float _4396 = sqrt(_4356);
    float _4398 = fma(_3526, _4056, _4392);
    float _4400 = fma(_3534, _4090, _4398);
    bool _4402 = _4396 > 0.0;
    float _4404 = 1.0 / _4390;
    bool _4406 = !_4402;
    if (!_4406)
    {
        float _4408 = _245 * _245;
        float _4410 = rsqrt(_4356);
        float _4412 = fma(_241, _241, _4408);
        float _4414 = fma(_247, _247, _4412);
        float _4416 = sqrt(_4414);
        float _4418 = _4306 * _4410;
        float _4420 = _4284 * _4410;
        float _4422 = _4310 * _4410;
        bool _4424 = _4416 > 0.0;
        bool _4426 = !_4424;
        if (!_4426)
        {
            float _4428 = rsqrt(_4414);
            float _4430 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4432 = _245 * _4428;
            float _4434 = _241 * _4428;
            float _4436 = _4420 * _4432;
            float _4438 = _247 * _4428;
            float _4440 = fma(_4418, _4434, _4436);
            float _4442 = _4430 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4444 = fma(_4422, _4438, _4440);
            float _4446 = _4444 * _4442;
            float _4448 = fma(_241, _4446, _4276);
            float _4450 = fma(_245, _4446, _4274);
            float _4452 = fma(_247, _4446, _4278);
            _4320 = _4448;
            _4322 = _4450;
            _4324 = _4452;
        }
    }
    float _4454 = _4320;
    float _4456 = _4322;
    float _4458 = _4324;
    float _4460 = -_3510;
    float _4462 = fma(_4460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4454);
    float _4464 = -_3508;
    float _4466 = fma(_4464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4456);
    float _4468 = -_3522;
    float _4470 = fma(_4468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4458);
    float _4472 = _4400 + _4098;
    float _4474 = _4394 + _4148;
    float _4476 = _4466;
    float _4478 = _4462;
    float _4480 = _4470;
    float _4482 = _4474;
    if (!_4374)
    {
        float _4484 = _3530 * _3530;
        float _4486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4488 = -_2524;
        float _4490 = _4488 + _4458;
        float _4492 = -_2492;
        float _4494 = _4492 + _4456;
        float _4496 = fma(_3538, _3538, _4484);
        float _4498 = -_2274;
        float _4500 = _4498 + _4454;
        float _4502 = fma(_3544, _3544, _4496);
        float _4504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4506 = sqrt(_4502);
        float _4508 = 1.0 / _3852;
        float _4510 = precise::min(_4506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4512 = _4510 * _4486;
        float _4514 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4516 = _4512 * _4508;
        float _4518 = _4514 * _4516;
        float _4520 = _4490 * _4516;
        float _4522 = fma(_4494, _4518, _3520);
        float _4524 = fma(_4500, _4518, _3526);
        float _4526 = fma(_4514, _4520, _3534);
        _4476 = _4522;
        _4478 = _4524;
        _4480 = _4526;
    }
    float _4528 = _4476;
    float _4530 = _4478;
    float _4532 = _4480;
    float _4534 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4536 = _4472 * _4404;
    float _4538 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4540 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4542 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4534);
    float _4544 = _4474 * _4404;
    bool _4546 = _4536 >= 0.0;
    float _4548 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4538);
    float _4550 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4542);
    float _4552 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4540);
    bool _4554 = _4536 <= 1.0;
    bool _4556 = _4554 && _4546;
    float _4558 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4560 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4548);
    float _4562 = _4550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4564 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4552);
    float _4566 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4558);
    float _4568 = _4560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4570 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4572 = _4544 >= 0.0;
    bool _4574 = _4572 && _4556;
    float _4576 = _4564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4578 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4566);
    float _4580 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4570);
    bool _4582 = _4544 <= 1.0;
    bool _4584 = _4582 && _4574;
    float _4586 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4588 = _4576 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4590 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4592 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4580);
    float _4594 = _3672 * _4302;
    float _4596 = -_4588;
    float _4598 = fma(_4596, _4586, 1.0);
    float _4600 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4602 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4592);
    float _4604 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4606 = fma(_3526, _4294, _4594);
    float _4608 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4600);
    float _4610 = log2(_4598);
    float _4612 = _4566;
    if (_4584)
    {
        float _4614 = float(_4022);
        _4612 = _4614;
    }
    float _4616 = _4612;
    float _4618 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4604);
    float _4620 = fma(_3534, _4342, _4606);
    float _4622 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4608);
    if (!_4112)
    {
        float _4624 = -_4364;
        float _4626 = _3982 + _4624;
        _4482 = _4626;
    }
    float _4628 = _4482;
    float _4630 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4618);
    float _4632 = _4620 + _4350;
    float _4634 = 1.0 / _4602;
    float _4636 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4622);
    float _4638 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4630);
    float _4640 = _4636;
    if (!_4112)
    {
        float _4642 = -_4328;
        float _4644 = _3858 + _4642;
        _4360 = _4644;
    }
    float _4646 = _4360;
    float _4648 = _4632 * _4404;
    float _4650 = _4394;
    if (!_4112)
    {
        float _4652 = rint(_4388);
        float _4654 = precise::max(_4652, 0.0);
        uint _4656 = uint(_4654);
        uint _4658 = clamp(_4656, 0u, 65535u);
        _4650 = as_type<float>(_4658);
    }
    float _4660 = _4650;
    float _4662 = _4610 * 0.693147182464599609375;
    float _4664 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4666 = _4616;
    if (_4584)
    {
        float _4668 = rint(_4616);
        float _4670 = precise::max(_4668, 0.0);
        uint _4672 = uint(_4670);
        uint _4674 = clamp(_4672, 0u, 65535u);
        _4666 = as_type<float>(_4674);
    }
    float _4676 = _4666;
    float _4678 = _4636 * _4634;
    float _4680 = _4638 * _4634;
    float _4682 = fma(_4678, 0.5, 0.5);
    float _4684 = fma(_4680, -0.5, 0.5);
    float _4686 = _4628;
    float _4688 = _4680;
    float _4690 = _4660;
    if (!_4112)
    {
        float3 _12490 = float3(_4628, _4646, float(as_type<int>(_4660)));
        float3 _12494 = select(_12490, float3(0.0), isnan(_12490));
        float _4692 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12494.xy, uint(rint(_12494.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12494.xy, uint(rint(_12494.z)), level(0.0)).x;
        _4686 = _4692;
    }
    float _4694 = _4686;
    float _4696 = _4544;
    if (_4584)
    {
        float3 _12509 = float3(_4536, _4544, float(as_type<int>(_4676)));
        float3 _12511 = select(_12509, float3(0.0), isnan(_12509));
        float _4698 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12511.xy, uint(rint(_12511.z)), _4648, level(0.0));
        _4696 = _4698;
    }
    float _4700 = _4696;
    float3 _12521 = float3(_4682, _4684, _4664);
    float _4702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12521, float3(0.0), isnan(_12521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12521, float3(0.0), isnan(_12521)), level(0.0)).x;
    float3 _12530 = float3(_4682, _4684, _4664);
    float4 _4705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12530, float3(0.0), isnan(_12530)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12530, float3(0.0), isnan(_12530)), level(0.0)).xyzw;
    float _4707 = _4705.x;
    float _4709 = _4705.y;
    float _4711 = _4705.z;
    float _4713 = _4705.w;
    bool _4715 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4717 = isnan(0.5);
    bool _4719 = _4715 || _4717;
    bool _4721 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4723 = _4719 || _4721;
    if (_4112)
    {
        _3552 = 1.0;
    }
    float _4725 = _3552;
    float _4727 = _4725;
    if (_4723)
    {
        _4688 = 1.0;
    }
    float _4729 = _4688;
    float _4731 = _4729;
    if (!_4723)
    {
        float _4733 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4735 = _4733 * 0.15915493667125701904296875;
        float _4737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4739;
        float _4743 = _4735 * 6.283185482025146484375;
        float _4745 = cos(_4743);
        float _4747 = _4737 * 0.15915493667125701904296875;
        float _4749 = _4735 * 6.283185482025146484375;
        float _4751 = sin(_4749);
        float _4753 = 1.0 / _4745;
        float _4755 = _4747 * 6.283185482025146484375;
        float _4757 = cos(_4755);
        float _4759 = _4751 * _4753;
        float _4761 = _4747 * 6.283185482025146484375;
        float _4763 = sin(_4761);
        float _4765 = _4757 * _4759;
        float _4767 = 1.0 / _4741;
        float _4769 = 1.0 / _4765;
        float _4771 = _4763 * _4769;
        float _4773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4775 = fma(_3968, _4771, _4773);
        float _4777 = _4775 * _4767;
        float _4779 = precise::clamp(_4777, 0.0, 1.0);
        _4690 = _4767;
        _4731 = _4779;
    }
    float _4781 = _4690;
    float _4783 = _4731;
    if (!_4112)
    {
        int _4785 = _4160 << 4;
        int _4787 = _4785 + 2048;
        uint _4789 = uint(int(uint(_4787) >> uint(2)));
        uint _4791 = uint(int(uint(int(_4789)) >> uint(2)));
        int _4793 = int(_4789) & 3;
        float _4795 = (*spvDescriptorSet0.vp_c15)._m0[int(_4791)][_4793];
        int _4797 = int(_4789) + 1;
        uint _4799 = uint(int(uint(_4797) >> uint(2)));
        int _4801 = _4797 & 3;
        float _4803 = (*spvDescriptorSet0.vp_c15)._m0[int(_4799)][_4801];
        int _4805 = _4787 + 8;
        uint _4807 = uint(int(uint(_4805) >> uint(2)));
        uint _4809 = uint(int(uint(int(_4807)) >> uint(2)));
        int _4811 = int(_4807) & 3;
        float _4813 = (*spvDescriptorSet0.vp_c15)._m0[int(_4809)][_4811];
        int _4815 = int(_4807) + 1;
        uint _4817 = uint(int(uint(_4815) >> uint(2)));
        int _4819 = _4815 & 3;
        float _4821 = (*spvDescriptorSet0.vp_c15)._m0[int(_4817)][_4819];
        float _4823 = _3672 * _4803;
        float _4825 = fma(_3526, _4795, _4823);
        float _4827 = fma(_3534, _4813, _4825);
        float _4829 = _4827 + _4821;
        float _4831 = precise::clamp(_4829, 0.0, 1.0);
        float _4833 = -_4831;
        float _4835 = _4833 + _4694;
        float _4837 = fma(_4835, 500.0, 1.5);
        float _4839 = exp2(_4837);
        float _4841 = 0.0 + _4839;
        float _4843 = precise::clamp(_4841, 0.0, 1.0);
        _4182 = as_type<float>(_4787);
        _4727 = _4843;
    }
    float _4845 = _4182;
    float _4847 = _4727;
    float _4849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4851 = _4528 + _4849;
    float _4853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4855 = _4530 + _4853;
    float _4857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4859 = _4532 + _4857;
    float _4861 = _4851 * _4851;
    float _4863 = fma(_4855, _4855, _4861);
    float _4865 = fma(_4859, _4859, _4863);
    float _4867 = rsqrt(_4865);
    float _4869 = _4867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4871 = _4855 * _4869;
    float _4873 = _4859 * _4869;
    float _4875 = _4871 * _4871;
    float _4877 = _4873 * _4873;
    float _4879 = _4875 + _4877;
    float _4881 = sqrt(_4879);
    bool _4883 = _4881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4885 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4887 = _4881 + _4885;
    float _4889 = _4859;
    float _4891 = _4861;
    float _4893 = _4887;
    float _4895 = _4845;
    float _4897 = _4851;
    if (_4883)
    {
        float _4899 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4889 = _4899;
    }
    float _4901 = _4889;
    if (_4883)
    {
        float _4903 = rsqrt(_4879);
        _4891 = _4903;
    }
    float _4905 = _4891;
    float _4907 = _4905;
    if (_4883)
    {
        float _4909 = _4887 * _4901;
        _4893 = _4909;
    }
    float _4911 = _4893;
    if (_4883)
    {
        float _4913 = _4911 * 0.15915493667125701904296875;
        _4895 = _4913;
    }
    float _4915 = _4895;
    float _4917 = _4867;
    if (_4883)
    {
        float _4919 = _4915 * 6.283185482025146484375;
        float _4921 = sin(_4919);
        _4917 = _4921;
    }
    float _4923 = _4917;
    float _4925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4927 = precise::max(0.0, _4925);
    float _4929 = _4781;
    float _4931 = _4927;
    float _4933 = _4925;
    if (_4883)
    {
        float _4935 = _4915 * 6.283185482025146484375;
        float _4937 = cos(_4935);
        _4929 = _4937;
    }
    float _4939 = _4929;
    float _4941 = -_4869;
    float _4943 = -_4927;
    float _4945 = fma(_4851, _4941, _4943);
    if (_4883)
    {
        float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4931 = _4947;
    }
    float _4949 = _4931;
    float _4951 = _4923;
    float _4953 = _4949;
    if (_4883)
    {
        float _4955 = fma(_4923, _4949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4951 = _4955;
    }
    float _4957 = _4951;
    float _4959 = _4957;
    if (!_4883)
    {
        _4953 = _4873;
    }
    float _4961 = _4953;
    float _4963 = _4961;
    float _4965 = _4939;
    if (_4883)
    {
        float _4967 = _4939 + (-1.0);
        _4933 = _4967;
    }
    float _4969 = _4933;
    float _4971 = _4969;
    if (_4883)
    {
        float _4973 = _4905 * _4957;
        _4897 = _4973;
    }
    float _4975 = _4897;
    float _4977 = _4975;
    if (!_4883)
    {
        _4907 = _4871;
    }
    float _4979 = _4907;
    float _4981 = _4979;
    if (_4883)
    {
        float _4983 = _4969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4971 = _4983;
    }
    float _4985 = _4971;
    if (_4883)
    {
        float _4987 = _4871 * _4975;
        _4981 = _4987;
    }
    float _4989 = _4981;
    if (!_4883)
    {
        _4959 = _4945;
    }
    float _4991 = _4959;
    float _4993 = _4991;
    if (_4883)
    {
        float _4995 = _4873 * _4975;
        _4963 = _4995;
    }
    float _4997 = _4963;
    if (_4883)
    {
        float _4999 = fma(_4945, _4939, _4985);
        _4993 = _4999;
    }
    float _5001 = _4993;
    if (!_4883)
    {
        _4965 = _4875;
    }
    float _5003 = _4965;
    float _5005 = _5003;
    if (_4883)
    {
        float _5007 = _4989 * _4989;
        _5005 = _5007;
    }
    float _5009 = _5005;
    float _5011 = sqrt(_4865);
    if (!_4883)
    {
        _4977 = _4877;
    }
    float _5013 = _4977;
    float _5015 = _5013;
    if (_4883)
    {
        float _5017 = _4997 * _4997;
        _5015 = _5017;
    }
    float _5019 = _5015;
    float _5021 = fma(_5001, _5001, _5009);
    float _5023 = _5021 + _5019;
    float _5025 = rsqrt(_5023);
    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5029 = fma(_5011, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5027);
    float _5031 = precise::clamp(_5029, 0.0, 1.0);
    float _5033 = -_5031;
    float _5035 = _5033 + 1.0;
    float _5037 = abs(_5035);
    float _5039 = log2(_5037);
    float _5041 = _5025 * _4989;
    float _5043 = _5025 * _5001;
    float _5045 = _5025 * _4997;
    float _5047 = _5041 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5049 = -_5047;
    float _5051 = fma(_5043, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5049);
    float _5053 = -_5045;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5051);
    float _5057 = _5039 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5059 = fma(_5055, -0.5, 0.5);
    float _5061 = fma(_5055, 0.5, 0.5);
    float _5063 = _5043 + 1.0;
    float _5065 = exp2(_5057);
    float _5067 = fma(_5061, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5069 = fma(_5061, _5067, -0.212114393711090087890625);
    float _5071 = sqrt(_5059);
    float _5073 = fma(_5061, _5069, 1.570728778839111328125);
    float _5075 = -_5043;
    float _5077 = fma(_5065, _5063, _5075);
    float _5079 = fma(_5077, 0.5, 0.5);
    float _5081 = _5071 * 0.636619746685028076171875;
    float _5083 = -_5073;
    float _5085 = fma(_5081, _5083, 1.0);
    float2 _13101 = float2(_5085, _5079);
    float3 _5089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13101, float2(0.0), isnan(_13101)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13101, float2(0.0), isnan(_13101)), level(0.0)).xyz;
    float _5091 = _5089.x;
    float _5093 = _5089.y;
    float _5095 = _5089.z;
    float _5097 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5099 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5101 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5103 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5105 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5097);
    float _5107 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5099);
    float _5109 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5101);
    float _5111 = abs(_3968);
    float _5113 = log2(_5111);
    float _5115 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5117 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5119 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5121 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5123 = -_3888;
    float _5125 = fma(_5123, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5115);
    float _5127 = -_3888;
    float _5129 = fma(_5127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5117);
    float _5131 = -_3888;
    float _5133 = fma(_5131, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5119);
    float _5135 = fma(_5103, _5103, 1.0);
    float _5137 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5139 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5141 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5143 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5129);
    float _5145 = rsqrt(_5135);
    float _5147 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5137);
    float _5149 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5139);
    float _5151 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5141);
    float _5153 = _5113 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5155 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5125);
    float _5157 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5133);
    float _5159 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5147);
    float _5161 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5149);
    float _5163 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5151);
    float _5165 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5167 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5105);
    float _5169 = _5103 * _5143;
    float _5171 = exp2(_5153);
    float _5173 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5109);
    float _5175 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5107);
    float _5177 = fma(_5165, _5167, _5169);
    float _5179 = _5103 * _5155;
    float _5181 = _5103 * _5157;
    float _5183 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5121);
    float _5185 = _5103 * _5145;
    out.m_96.x = _5175;
    out.m_96.y = _5167;
    out.m_96.z = _5173;
    float _5187 = fma(_5165, _5175, _5179);
    float _5189 = fma(_5165, _5173, _5181);
    float _5191 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5183);
    float _5193 = -_5159;
    float _5195 = _5185 * _5193;
    float _5197 = -_5163;
    float _5199 = _5185 * _5197;
    float _5201 = _5039 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5203 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5191);
    bool _5205 = _3968 <= 8000.0;
    bool _5207 = isnan(_3968);
    bool _5209 = _5205 || _5207;
    bool _5211 = isnan(8000.0);
    bool _5213 = _5209 || _5211;
    float _5215 = float(_5213);
    float _5217 = -_3578;
    float _5219 = _5217 + 1.0;
    float _5221 = fma(_5171, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = -_5161;
    float _5227 = _5185 * _5225;
    float _5229 = _4602 * 0.5;
    float _5231 = _5159 + _5187;
    float _5233 = exp2(_5201);
    out.gl_Position.x = _4636;
    out.gl_Position.y = _4638;
    out.gl_Position.z = _5203;
    out.gl_Position.w = _4602;
    float _5235 = fma(_4638, -0.5, _5229);
    float _5237 = _5203 + _4602;
    float _5239 = fma(_5145, _5155, _5195);
    float _5241 = _4636 + _4602;
    float _5243 = fma(_5145, _5143, _5227);
    float _5245 = fma(_5223, -2.0, 3.0);
    float _5247 = _5223 * _5223;
    float _5249 = fma(_5145, _5157, _5199);
    float _5251 = _5237 * 0.5;
    float _5253 = _5247 * _5245;
    float _5255 = _5241 * 0.5;
    if (!_4584)
    {
        _4640 = 1.0;
    }
    float _5257 = _4640;
    float _5259 = -_5233;
    float _5261 = _5259 + 1.0;
    float _5263 = -_5253;
    float _5265 = _5263 + 1.0;
    float _5267 = _5257;
    if (_4584)
    {
        bool _5269 = _4700 >= _4648;
        bool _5271 = isnan(_4700);
        bool _5273 = _5269 || _5271;
        bool _5275 = isnan(_4648);
        bool _5277 = _5273 || _5275;
        float _5279 = float(_5277);
        _5267 = _5279;
    }
    float _5281 = _5267;
    out.m_98.x = _5255;
    out.m_98.y = _5235;
    out.m_98.z = _5251;
    out.m_98.w = _4602;
    float _5283 = _5261 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5285 = fma(_5265, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5253);
    float _5287 = _5161 + _5177;
    float _5289 = _5281 * _4847;
    float _5291 = _5163 + _5189;
    float _5293 = _5215 * _5285;
    float _5295 = _5283 * _4702;
    float _5297 = -_5283;
    float _5299 = _5297 + 1.0;
    out.m_100.x = _5239;
    out.m_100.y = _5243;
    out.m_100.z = _5249;
    float _5301 = _5293 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _5303 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5305 = isnan(_5011);
    bool _5307 = _5303 || _5305;
    bool _5309 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5311 = _5307 || _5309;
    out.m_102.x = _5231;
    out.m_102.y = _5287;
    out.m_102.z = _5291;
    float _5313 = _5219 * _5301;
    float _5315 = precise::clamp(_5313, 0.0, 1.0);
    float _5317 = _4713 * _5295;
    float _5319 = _4713 * _5299;
    float _5321 = -_5315;
    float _5323 = fma(_5321, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5325 = -_5289;
    float _5327 = fma(_5325, _5323, 1.0);
    float _5329 = precise::clamp(_5327, 0.0, 1.0);
    float _5331 = _5299;
    float _5333 = _5301;
    float _5335 = _5329;
    if (!_5311)
    {
        _5331 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5337 = _5331;
    float _5339 = _5329 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5341 = _5337;
    float _5343 = _5337;
    if (!_5311)
    {
        _5333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5345 = _5333;
    float _5347 = _5345;
    float _5349 = _5345;
    if (!_5311)
    {
        _5335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5351 = _5335;
    out.m_104.x = _5339;
    float _5353 = _5095 * _5295;
    float _5355 = fma(_5091, _5317, _4707);
    float _5357 = fma(_5093, _5317, _4709);
    float _5359 = _4783 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5361 = fma(_4713, _5353, _4711);
    out.m_106.x = _5355;
    out.m_106.y = _5357;
    out.m_106.z = _5361;
    out.m_106.w = _5319;
    bool _5363 = !_5311;
    float _5365 = _5351;
    float _5367 = _5351;
    if (!_5363)
    {
        bool _5369 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5371 = isnan(_5011);
        bool _5373 = _5369 || _5371;
        bool _5375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5377 = _5373 || _5375;
        if (!_5377)
        {
            float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5381 = _5011 + _5379;
            float _5383 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5385 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5383;
            float _5387 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5395 = 1.0 / _5385;
            float _5397 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5399 = _5397 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5401 = _5381 * _5395;
            float _5403 = precise::clamp(_5401, 0.0, 1.0);
            float _5405 = fma(_5403, _5389, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5407 = fma(_5403, _5393, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5409 = fma(_5403, _5399, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5349 = _5407;
            _5343 = _5405;
            _5367 = _5409;
            _5411 = true;
        }
        else
        {
            bool _5413 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5415 = isnan(_5011);
            bool _5417 = _5413 || _5415;
            bool _5419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5421 = _5417 || _5419;
            if (!_5421)
            {
                _5341 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5423 = _5341;
            _5343 = _5423;
            if (!_5421)
            {
                _5347 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5425 = _5347;
            _5349 = _5425;
            if (!_5421)
            {
                _5365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5427 = _5365;
            bool _5429 = !_5421;
            _5367 = _5427;
            if (!_5429)
            {
                bool _5431 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5433 = isnan(_5011);
                bool _5435 = _5431 || _5433;
                bool _5437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5439 = _5435 || _5437;
                if (!_5439)
                {
                    float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5443 = _5011 + _5441;
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5445;
                    float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5451 = _5449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5453 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5455 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5457 = 1.0 / _5447;
                    float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5463 = _5443 * _5457;
                    float _5465 = precise::clamp(_5463, 0.0, 1.0);
                    float _5467 = fma(_5465, _5451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5469 = fma(_5465, _5455, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5471 = fma(_5465, _5461, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5349 = _5469;
                    _5343 = _5467;
                    _5367 = _5471;
                    _5411 = true;
                }
                else
                {
                    _5349 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5343 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5411 = false;
    float _5473 = _5349;
    float _5475 = _5343;
    float _5477 = _5367;
    float _5479 = _5359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_108.x = 0.0;
    float _5481 = _5473 * 0.586610972881317138671875;
    bool _5483 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_63.x = _5479;
    float _5485 = fma(_5475, 0.298911988735198974609375, _5481);
    bool _5487 = _4783 > 0.0;
    bool _5489 = isnan(_4783);
    bool _5491 = _5487 || _5489;
    bool _5493 = isnan(0.0);
    bool _5495 = _5491 || _5493;
    float _5497 = fma(_5477, 0.114477999508380889892578125, _5485);
    float _5499 = -_5497;
    float _5501 = _5499 + _5475;
    float _5503 = -_5497;
    float _5505 = _5503 + _5473;
    float _5507 = -_5497;
    float _5509 = _5507 + _5477;
    float _5511 = fma(_5501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    float _5513 = fma(_5505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    float _5515 = fma(_5509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    bool _5517 = !_5483;
    if (!_5517)
    {
        float _5519 = -_4528;
        float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5523 = -_4530;
        float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5527 = -_4532;
        float _5529 = _5527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5531 = _5521 * _5521;
        float _5533 = fma(_5525, _5525, _5531);
        float _5535 = fma(_5529, _5529, _5533);
        float _5537 = sqrt(_5535);
        float _5539 = rsqrt(_5535);
        float _5541 = -_5537;
        float _5543 = _5541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5545 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5547 = precise::clamp(_5545, 0.0, 1.0);
        float _5549 = _5525 * _5539;
        float _5551 = _5521 * _5539;
        float _5553 = abs(_5547);
        float _5555 = log2(_5553);
        float _5557 = _5529 * _5539;
        float _5559 = _5549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5561 = _5287 * _5551;
        float _5563 = -_5551;
        float _5565 = -_5559;
        float _5567 = fma(_5563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5565);
        float _5569 = fma(_5231, _5549, _5561);
        float _5571 = -_5557;
        float _5573 = fma(_5571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5567);
        float _5575 = fma(_5291, _5557, _5569);
        float _5577 = precise::clamp(_5575, 0.0, 1.0);
        float _5579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5581 = _5573 + _5579;
        float _5583 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5585 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5587 = precise::clamp(_5585, 0.0, 1.0);
        float _5589 = exp2(_5583);
        float _5591 = _5589 * _5587;
        float _5593 = _5577 * _5591;
        float _5595 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5597 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5599 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5595;
        out.m_108.y = _5597;
        out.m_108.z = _5599;
    }
    out.m_110.x = _5511;
    out.m_110.y = _5513;
    out.m_110.z = _5515;
    if (_5495)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5601;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5411 = false;
    bool _679 = false;
    bool _459 = false;
    bool _271 = false;
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
        float _5669 = as_type<float>(_153);
        out.gl_Position.z = _5669;
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
        float _5732 = as_type<float>(_185);
        out.gl_Position.z = _5732;
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
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_219;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _191 * _197;
    float _233 = _191 * _203;
    float _235 = fma(_189, _195, _231);
    float _237 = _191 * _209;
    float _239 = fma(_189, _201, _233);
    float _241 = fma(_193, _199, _235);
    float _243 = fma(_189, _207, _237);
    float _245 = fma(_193, _205, _239);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    bool _251 = false;
    float _269;
    if (!_249)
    {
        float _253 = in.m_76.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _179;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _273 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _293;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _289;
    float _317 = 1.0 / _297;
    float _319 = _285 * _311;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = _277 * _315;
    bool _335 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_273);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_309;
    float _349 = _347 + 1.0;
    float _351 = _345 * _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = _281 * _317;
    bool _359 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _361 = isnan(_273);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_345;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _369 * _373;
    float _389 = -_369;
    float _391 = _389 + 1.0;
    float _393 = fma(_377, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_381, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _331 * _391;
    float _399 = -_331;
    float _401 = _399 + 1.0;
    float _403 = fma(_355, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = _393 * _397;
    float _407 = _395 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _423 = fma(_411, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _425 = fma(_403, _387, _415);
    float _427 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_413, _387, _421);
    float _431 = fma(_423, _351, _425);
    float _433 = fma(_427, _351, _429);
    float _435 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _431);
    float _437 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _433);
    bool _439 = !_313;
    float _457;
    if (!_439)
    {
        float _441 = in.m_76.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _179;
    }
    _459 = false;
    float _461 = _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _479 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_461);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _469;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _501 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_461);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_489;
    float _515 = _513 + 1.0;
    bool _517 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _519 = isnan(_461);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _473;
    float _531 = -_511;
    float _533 = _531 + 1.0;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _537 = _489 * _533;
    float _539 = _495 * _491;
    float _541 = 1.0 / _477;
    bool _543 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_461);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _557;
    float _561 = -_553;
    float _563 = _561 + 1.0;
    float _565 = _553 * _515;
    float _567 = 1.0 / _499;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = _527 * _563;
    float _575 = -_527;
    float _577 = _575 + 1.0;
    float _579 = _571 * _529;
    float _581 = _555 * _573;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _585 = _461 + _583;
    float _587 = _559 * _541;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _591 = _461 + _589;
    bool _593 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _595 = isnan(_461);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _609 = fma(_579, _585, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _611 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[115].x, _581);
    float _613 = fma(_587, _591, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _615 = -_603;
    float _617 = _615 + 1.0;
    float _619 = _607 * _567;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _623 = _461 + _621;
    float _625 = fma(_609, _565, _611);
    float _627 = _511 * _617;
    float _629 = fma(_619, _623, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _631 = fma(_613, _537, _625);
    float _633 = fma(_629, _627, _631);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _639 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[119].x, _633);
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = in.m_78.x;
    float _653 = in.m_78.y;
    out.m_80.x = _643;
    out.m_80.y = _645;
    out.m_80.z = _649;
    out.m_80.w = _647;
    float _655 = _437 * _653;
    float _657 = _435 * _651;
    bool _659 = !_535;
    float _677;
    if (!_659)
    {
        float _661 = in.m_76.x;
        float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _665 = _661 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _669 = _667 * _663;
        float _671 = floor(_669);
        float _673 = -_671;
        float _675 = _669 + _673;
        _677 = _675;
        _679 = true;
    }
    else
    {
        _677 = _179;
    }
    _679 = false;
    float _681 = _677;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _685 = _681 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _695;
    bool _699 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _701 = isnan(_681);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = 1.0 / _689;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _721 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _723 = isnan(_681);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    bool _733 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _735 = isnan(_681);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = 1.0 / _693;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _749 = _697 * _711;
    bool _751 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = isnan(_681);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _715;
    float _765 = -_709;
    float _767 = _765 + 1.0;
    float _769 = fma(_749, _685, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _771 = -_761;
    float _773 = _771 + 1.0;
    float _775 = _761 * _767;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _781;
    float _785 = 1.0 / _719;
    float _787 = -_731;
    float _789 = _787 + 1.0;
    float _791 = _743 * _773;
    float _793 = _779 * _745;
    float _795 = -_743;
    float _797 = _795 + 1.0;
    float _799 = _709 * _789;
    float _801 = _769 * _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _805 = _681 + _803;
    float _807 = _783 * _763;
    bool _809 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _811 = isnan(_681);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = _681 + _825;
    float _829 = fma(_793, _805, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[131].x, _801);
    float _833 = -_819;
    float _835 = _833 + 1.0;
    float _837 = fma(_807, _827, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _839 = _823 * _785;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _843 = _681 + _841;
    float _845 = fma(_829, _775, _831);
    float _847 = _731 * _835;
    float _849 = fma(_839, _843, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _851 = fma(_837, _799, _845);
    float _853 = fma(_849, _847, _851);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _861 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[135].x, _853);
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = _861 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _863;
    out.m_82.y = _865;
    out.m_82.z = _867;
    out.m_82.w = _869;
    bool _871 = !_747;
    float _873 = _865;
    float _875 = _869;
    if (!_871)
    {
        float _877 = in.m_76.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _881 = _877 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _885 = _883 * _879;
        float _887 = floor(_885);
        float _889 = -_887;
        float _891 = _885 + _889;
        _181 = _891;
    }
    float _893 = _181;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _897 = int(_895);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _901 = _899 != 0;
    float _903 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _905 = int(_903);
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _909 = int(_907);
    float _911 = float(_897);
    float _913 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _915 = int(_913);
    float _917 = float(_905);
    float _919 = 1.0 / _911;
    float _921 = float(_909);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _925 = int(_923);
    float _927 = float(uint(_915));
    float _929 = 1.0 / _917;
    float _931 = _919 * _135;
    float _933 = _919;
    if (_901)
    {
        float _935 = in.m_76.w;
        _933 = _935;
    }
    float _937 = _933;
    float _939 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _941 = int(_939);
    float _943 = float(uint(_925));
    int _945 = ~_925;
    int _947 = _945 + 1;
    float _949 = 1.0 / _921;
    float _951 = _929 * _135;
    float _953 = 1.0 / _927;
    float _955 = float(uint(_941));
    int _957 = ~_941;
    int _959 = _957 + 1;
    float _961 = _937;
    if (_901)
    {
        float _963 = _937 * 3.1415927410125732421875;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = trunc(_931);
    int _969 = int(_967);
    float _971 = _949 * _135;
    if (_901)
    {
        float _973 = _965 * 0.15915493667125701904296875;
        _873 = _973;
    }
    float _975 = _873;
    float _977 = 1.0 / _943;
    int _979 = as_type<int>(_953) + (-2);
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _983 = _981 != 0;
    float _985 = trunc(_951);
    int _987 = int(_985);
    float _989 = float(uint(_969));
    int _991 = ~_915;
    int _993 = _991 + 1;
    float _995 = as_type<float>(_979) * _989;
    float _997 = 1.0 / _955;
    int _999 = as_type<int>(_977) + (-2);
    if (_983)
    {
        _875 = 1.0;
    }
    float _1001 = _875;
    float _1003 = 0.0;
    float _1005 = _1001;
    if (_983)
    {
        _1003 = 1.0;
    }
    float _1007 = _1003;
    float _1009 = trunc(_971);
    int _1011 = int(_1009);
    float _1013 = float(uint(_987));
    int _1015 = 0;
    float _1017 = _1007;
    if (_983)
    {
        _1015 = 0;
    }
    int _1019 = _1015;
    float _1021 = as_type<float>(_999) * _1013;
    int _1023 = as_type<int>(_997) + (-2);
    float _1025 = trunc(_995);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_1011));
    float _1034 = trunc(_1021);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = as_type<float>(_1023) * _1032;
    float _1042 = trunc(_1040);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    int _1048 = _993 * int(_1030);
    int _1050 = _1048 + _969;
    float _1052 = float(uint(_1050));
    float _1054 = _975;
    int _1056 = _1019;
    if (_901)
    {
        float _1058 = _975 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        _1054 = _1060;
    }
    float _1062 = _1054;
    float _1064 = _965;
    float _1066 = _1040;
    if (_983)
    {
        float _1068 = in.m_76.x;
        float _1070 = in.m_76.y;
        _1064 = _1068;
        _1066 = _1070;
    }
    float _1072 = _1064;
    float _1074 = _1066;
    int _1076 = _947 * int(_1038);
    int _1078 = _1076 + _987;
    float _1080 = as_type<float>(_979) * _1052;
    float _1082 = in.m_76.z;
    float _1084 = in.m_76.w;
    float _1086 = float(uint(_1078));
    int _1088 = _959 * int(_1046);
    int _1090 = _1088 + _1011;
    float _1092 = trunc(_1080);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    float _1098 = as_type<float>(_999) * _1086;
    float _1100 = float(uint(_1090));
    float _1102 = as_type<float>(_1023) * _1100;
    float _1104 = trunc(_1098);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = as_type<int>(_1100);
    float _1112 = _1086;
    float _1114 = _1080;
    if (_983)
    {
        _1110 = 0;
    }
    int _1116 = _1110;
    float _1118 = _1072;
    float _1120 = _1074;
    int _1122 = _1116;
    if (_983)
    {
        _1112 = _1072;
    }
    float _1124 = _1112;
    float _1126 = trunc(_1102);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = 0.0;
    float _1134 = _1124;
    if (_983)
    {
        _1132 = _1074;
    }
    float _1136 = _1132;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (_983)
    {
        _1138 = _1124;
    }
    float _1142 = _1138;
    float _1144 = _1142;
    if (_983)
    {
        _1114 = _1124;
    }
    float _1146 = _1114;
    float _1148 = _1146;
    if (!_983)
    {
        float _1150 = in.m_76.x;
        float _1152 = in.m_76.y;
        float _1154 = in.m_76.z;
        float _1156 = _1150 * 3.1415927410125732421875;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1152 * 3.1415927410125732421875;
        float _1162 = _1160 * 0.15915493667125701904296875;
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        _1017 = 5.839270114898681640625;
        _1148 = _1154;
        _1005 = 7.345489978790283203125;
        _1118 = _1150;
        _1120 = _1152;
        _1134 = _1152;
        _1122 = 1;
        _1144 = _1166;
        _1056 = 2;
        _1140 = _1170;
    }
    float _1172 = _1017;
    float _1174 = _1148;
    float _1176 = _1005;
    float _1178 = _1118;
    float _1180 = _1120;
    float _1182 = _1134;
    int _1184 = _1122;
    float _1186 = _1144;
    int _1188 = _1056;
    float _1190 = _1140;
    float _1192 = _1172 * _1174;
    int _1194 = ~_915;
    int _1196 = _1194 + 1;
    float _1198 = _1176 * _1178;
    int _1200 = int(_1030) + int(_1096);
    float _1202 = in.m_70.w;
    int _1204 = ~_941;
    int _1206 = _1204 + 1;
    float _1208 = floor(_1198);
    int _1210 = int(_1046) + int(_1130);
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1214 = _893 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1218 = _893 + _1216;
    int _1220 = ~_925;
    int _1222 = _1220 + 1;
    int _1224 = _1196 * _1200;
    int _1226 = _1224 + _969;
    float _1228 = floor(_1192);
    int _1230 = int(_1038) + int(_1108);
    int _1232 = _1206 * _1210;
    int _1234 = _1232 + _1011;
    bool _1236 = uint(_1226) >= uint(_915);
    bool _1238 = uint(_1234) >= uint(_941);
    int _1240 = _1222 * _1230;
    int _1242 = _1240 + _987;
    bool _1244 = !_1236;
    int _1246 = _1244 ? 0 : (-1);
    float _1248 = -_1208;
    float _1250 = _1198 + _1248;
    bool _1252 = _1084 > 0.5;
    bool _1254 = !_1238;
    int _1256 = _1254 ? 0 : (-1);
    int _1258 = ~_1200;
    int _1260 = _1258 + _1246;
    int _1262 = _1260 + 1;
    float _1264 = -_1228;
    float _1266 = _1192 + _1264;
    float _1268 = _1202;
    if (_901)
    {
        bool _1270 = _1062 > 0.5;
        _251 = _1270;
    }
    bool _1272 = _251;
    bool _1274 = _1082 > 0.5;
    int _1276 = _915 * _1262;
    int _1278 = _1276 + _969;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1282 = _1280 != 0;
    float _1284 = -_229;
    int _1286 = _1252 ? as_type<int>(_1284) : as_type<int>(_229);
    bool _1288 = uint(_1242) >= uint(_925);
    float _1290 = float(_915);
    bool _1292 = _1180 > 0.5;
    float _1294 = 0.0;
    if (!_901)
    {
        _1294 = _225;
    }
    float _1296 = _1294;
    float _1298 = _1250 * _1290;
    float _1300 = -_229;
    int _1302 = _1274 ? as_type<int>(_1300) : as_type<int>(_229);
    bool _1304 = !_1282;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = _1296;
    if (_901)
    {
        float _1310 = -_225;
        float _1312 = _1272 ? _1310 : _225;
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = trunc(_1298);
    int _1318 = int(_1316);
    float _1320 = float(_969);
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1332 = _1330 != 0;
    float _1334 = -_225;
    int _1336 = _1292 ? as_type<int>(_1334) : as_type<int>(_225);
    float _1338 = float(_941);
    bool _1340 = _1320 >= _1290;
    bool _1342 = isnan(_1320);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(_1290);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    bool _1352 = !_1332;
    float _1354 = _1352 ? _229 : as_type<float>(_1302);
    bool _1356 = !_1328;
    float _1358 = _1356 ? _225 : as_type<float>(_1336);
    float _1360 = trunc(_1350);
    int _1362 = int(_1360);
    float _1364 = float(_1011);
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1372 = _1370 != 0;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1380 = _1378 != 0;
    bool _1382 = _1364 >= _1338;
    bool _1384 = isnan(_1364);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(_1338);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1266 * _1338;
    bool _1396 = !_1372;
    int _1398 = _1396 ? 0 : 1;
    bool _1400 = !_1368;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = trunc(_1392);
    int _1406 = int(_1404);
    bool _1408 = !_1376;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1414 = _1412 != 0;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1418 = _1416 != 0;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1380;
    int _1426 = _1424 ? 0 : 1;
    int _1428 = ~_1210;
    int _1430 = _1428 + _1256;
    int _1432 = _1430 + 1;
    float _1434 = trunc(_1394);
    int _1436 = int(_1434);
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1440 = _1438 != 0;
    bool _1442 = !_1418;
    int _1444 = _1442 ? 0 : 1;
    int _1446 = _941 * _1432;
    int _1448 = _1446 + _1011;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1452 = _1450 != 0;
    int _1454 = abs(_1306);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1458 = _1456 != 0;
    bool _1460 = !_1324;
    float _1462 = _1460 ? _229 : as_type<float>(_1286);
    int _1464 = _1318 * _1454;
    int _1466 = _1464 + _969;
    bool _1468 = !_1440;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = _175 * _135;
    bool _1474 = !_1452;
    int _1476 = _1474 ? 0 : 1;
    bool _1478 = !_1288;
    int _1480 = _1478 ? 0 : (-1);
    float _1482 = _1290 * _1472;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1486 = _1484 != 0;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1498 = _1496 != 0;
    float _1500 = _1338 * _1472;
    bool _1502 = !_1414;
    int _1504 = _1502 ? 0 : 1;
    float _1506 = trunc(_1482);
    int _1508 = int(_1506);
    bool _1510 = _915 == 0;
    int _1512 = abs(_1470);
    bool _1514 = !_1490;
    int _1516 = _1514 ? 0 : 1;
    bool _1518 = _941 == 0;
    int _1520 = _1436 * _1512;
    int _1522 = _1520 + _1011;
    int _1524 = ~_1362;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    float _1530 = trunc(_1500);
    int _1532 = int(_1530);
    bool _1534 = !_1510;
    int _1536 = _1534 ? _1278 : (-1);
    int _1538 = ~_1406;
    int _1540 = _1538 + 1;
    int _1542 = _1540 + 1;
    bool _1544 = !_1518;
    int _1546 = _1544 ? _1448 : (-1);
    int _1548 = _1536 * _1528;
    int _1550 = _915 + (-1);
    int _1552 = abs(_1398);
    int _1554 = _1546 * _1542;
    int _1556 = _941 + (-1);
    int _1558 = _1362 * _1550;
    int _1560 = _1558 + _1548;
    int _1562 = abs(_1402);
    int _1564 = _1406 * _1556;
    int _1566 = _1564 + _1554;
    int _1568 = abs(_1410);
    int _1570 = _1560 * _1552;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1574 = _893 + _1572;
    int _1576 = abs(_1444);
    int _1578 = _1508 * _1562;
    int _1580 = _1578 + _1570;
    int _1582 = abs(_1426);
    bool _1584 = !_1422;
    int _1586 = _1584 ? 0 : 1;
    int _1588 = _1466 * _1568;
    int _1590 = _1588 + _1580;
    int _1592 = abs(_1504);
    int _1594 = _1318 * _1582;
    int _1596 = _1594 + _1590;
    int _1598 = abs(_1586);
    int _1600 = _1566 * _1576;
    float _1602 = float(uint(_1596));
    int _1604 = abs(_1476);
    int _1606 = _1532 * _1592;
    int _1608 = _1606 + _1600;
    float _1610 = float(_925);
    float _1612 = as_type<float>(_979) * _1602;
    float _1614 = float(_987);
    int _1616 = _1522 * _1598;
    int _1618 = _1616 + _1608;
    int _1620 = ~_915;
    int _1622 = _1620 + 1;
    bool _1624 = _1614 >= _1610;
    bool _1626 = isnan(_1614);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(_1610);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    int _1636 = _1436 * _1604;
    int _1638 = _1636 + _1618;
    float _1640 = trunc(_1612);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    float _1646 = _1176 * _1182;
    float _1648 = _1610 * _1472;
    int _1650 = ~_1230;
    int _1652 = _1650 + _1480;
    int _1654 = _1652 + 1;
    float _1656 = float(uint(_1638));
    int _1658 = ~_941;
    int _1660 = _1658 + 1;
    float _1662 = floor(_1646);
    int _1664 = _925 * _1654;
    int _1666 = _1664 + _987;
    float _1668 = as_type<float>(_1023) * _1656;
    bool _1670 = !_1458;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1516);
    int _1676 = abs(_1672);
    float _1678 = trunc(_1668);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    int _1684 = _1622 * int(_1644);
    int _1686 = _1684 + _1596;
    bool _1688 = _1082 > 0.5;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1692 = _1690 != 0;
    float _1694 = float(uint(_1686));
    float _1696 = trunc(_1634);
    int _1698 = int(_1696);
    bool _1700 = !_1486;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = -_1662;
    float _1706 = _1646 + _1704;
    bool _1708 = _925 == 0;
    float _1710 = as_type<float>(_979) * _1694;
    int _1712 = abs(_1702);
    float _1714 = _1706 * _1610;
    bool _1716 = !_1708;
    int _1718 = _1716 ? _1666 : (-1);
    int _1720 = _1660 * int(_1682);
    int _1722 = _1720 + _1638;
    float _1724 = trunc(_1710);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    int _1730 = _925 + (-1);
    float _1732 = float(uint(_1722));
    int _1734 = ~_1698;
    int _1736 = _1734 + 1;
    int _1738 = _1736 + 1;
    float _1740 = trunc(_1648);
    int _1742 = int(_1740);
    float _1744 = as_type<float>(_1023) * _1732;
    int _1746 = _1718 * _1738;
    bool _1748 = !_1494;
    int _1750 = _1748 ? 0 : 1;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1758 = _1756 != 0;
    float _1760 = trunc(_1714);
    int _1762 = int(_1760);
    int _1764 = _1698 * _1730;
    int _1766 = _1764 + _1746;
    int _1768 = ~_915;
    int _1770 = _1768 + 1;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1776 = int(_1644) + int(_1728);
    int _1778 = _1766 * _1674;
    int _1780 = abs(_1750);
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1786 = trunc(_1744);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    int _1792 = _1742 * _1712;
    int _1794 = _1792 + _1778;
    int _1796 = ~_941;
    int _1798 = _1796 + 1;
    int _1800 = _1770 * _1776;
    int _1802 = _1800 + _1596;
    float _1804 = as_type<float>(_1750);
    float _1806 = as_type<float>(_1568);
    float _1808 = _1574;
    float _1810 = _1314;
    if (_1758)
    {
        float _1812 = in.m_76.x;
        _1804 = _1812;
    }
    float _1814 = _1804;
    if (!_1758)
    {
        _1806 = _229;
    }
    float _1816 = _1806;
    int _1818 = _1762 * _1676;
    int _1820 = _1818 + _987;
    bool _1822 = !_1498;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = 1.0 / _1754;
    bool _1828 = uint(_1802) >= uint(_915);
    int _1830 = _1820 * _1780;
    int _1832 = _1830 + _1794;
    int _1834 = abs(_1824);
    bool _1836 = !_1828;
    int _1838 = _1836 ? 0 : (-1);
    int _1840 = int(_1682) + int(_1790);
    float _1842 = 1.0 / _1774;
    float _1844 = float(uint(_1466));
    int _1846 = _1798 * _1840;
    int _1848 = _1846 + _1638;
    int _1850 = ~_1776;
    int _1852 = _1850 + _1838;
    int _1854 = _1852 + 1;
    int _1856 = _1762 * _1834;
    int _1858 = _1856 + _1832;
    float _1860 = float(uint(_1522));
    float _1862 = as_type<float>(_979) * _1844;
    float _1864 = -_225;
    int _1866 = _1688 ? as_type<int>(_1864) : as_type<int>(_225);
    int _1868 = _915 * _1854;
    int _1870 = _1868 + _1596;
    bool _1872 = uint(_1848) >= uint(_941);
    float _1874 = trunc(_1862);
    float _1876 = precise::max(_1874, 0.0);
    uint _1878 = uint(_1876);
    float _1880 = as_type<float>(_1023) * _1860;
    int _1882 = ~_915;
    int _1884 = _1882 + 1;
    bool _1886 = !_1510;
    int _1888 = _1886 ? _1870 : (-1);
    float _1890 = as_type<float>(_1870);
    float _1892 = _1816;
    if (_1758)
    {
        float _1894 = _1814 * 3.1415927410125732421875;
        _1890 = _1894;
    }
    float _1896 = _1890;
    bool _1898 = !_1692;
    float _1900 = _1898 ? _225 : as_type<float>(_1866);
    float _1902 = trunc(_1880);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1888 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = _1896;
    if (_1758)
    {
        float _1914 = _1896 * 0.15915493667125701904296875;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = float(uint(_1858));
    int _1920 = _1910 ? 0 : 1;
    int _1922 = _1888 & 3;
    bool _1924 = _1922 != 0;
    int _1926 = _1884 * int(_1878);
    int _1928 = _1926 + _1466;
    float _1930 = as_type<float>(_999) * _1918;
    float _1932 = _1916;
    if (_1758)
    {
        float _1934 = _1916 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1932 = _1936;
    }
    float _1938 = _1932;
    bool _1940 = !_1872;
    int _1942 = _1940 ? 0 : (-1);
    bool _1944 = uint(_1922) > 1u;
    float _1946 = float(uint(_1928));
    int _1948 = ~_941;
    int _1950 = _1948 + 1;
    float _1952 = trunc(_1930);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = ~_1840;
    int _1960 = _1958 + _1942;
    int _1962 = _1960 + 1;
    float _1964 = as_type<float>(_979) * _1946;
    int _1966 = ~_1920;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1950 * int(_1906);
    int _1974 = _1972 + _1522;
    int _1976 = ~_925;
    int _1978 = _1976 + 1;
    bool _1980 = _1180 > 0.5;
    float _1982 = trunc(_1964);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    float _1988 = float(uint(_1974));
    int _1990 = _1970;
    bool _1992 = _1944;
    if (!_1944)
    {
        int _1994 = ~_1920;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    if (_1758)
    {
        bool _2000 = _1938 > 0.5;
        _1992 = _2000;
    }
    bool _2002 = _1992;
    float _2004 = as_type<float>(_1023) * _1988;
    int _2006 = _941 * _1962;
    int _2008 = _2006 + _1638;
    int _2010 = _1978 * int(_1956);
    int _2012 = _2010 + _1858;
    if (_1758)
    {
        float _2014 = -_229;
        float _2016 = _2002 ? _2014 : _229;
        _1892 = _2016;
    }
    float _2018 = _1892;
    float _2020 = trunc(_2004);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    bool _2026 = _1922 != 3;
    bool _2028 = uint(_1922) >= 2u;
    float _2030 = float(uint(_2012));
    bool _2032 = !_1518;
    int _2034 = _2032 ? _2008 : (-1);
    float _2036 = 1.0 / _1784;
    int _2038 = _2028 ? 0 : 1;
    int _2040 = int(_1878) + int(_1986);
    float _2042 = as_type<float>(_999) * _2030;
    float _2044 = -_229;
    int _2046 = _1980 ? as_type<int>(_2044) : as_type<int>(_229);
    int _2048 = _2034 & 3;
    bool _2050 = _2048 != 0;
    int _2052 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2042);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = ~_2038;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    int _2068 = _2066;
    if (_2026)
    {
        int _2070 = ~_2038;
        int _2072 = _2070 + 1;
        _2068 = _2072;
    }
    int _2074 = _2068;
    bool _2076 = uint(_2048) > 1u;
    bool _2078 = !_2054;
    float _2080 = _2078 ? _229 : as_type<float>(_2046);
    int _2082 = ~_915;
    int _2084 = _2082 + 1;
    int _2086 = _2034 & 3;
    bool _2088 = _2086 != 0;
    int _2090 = int(_1906) + int(_2024);
    int _2092 = _2084 * _2040;
    int _2094 = _2092 + _1466;
    int _2096 = _2088 ? 0 : 1;
    int _2098 = ~_941;
    int _2100 = _2098 + 1;
    int _2102 = ~_2096;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2106;
    if (!_2076)
    {
        int _2110 = ~_2096;
        int _2112 = _2110 + 1;
        _2108 = _2112;
    }
    int _2114 = _2108;
    int _2116 = _2100 * _2090;
    int _2118 = _2116 + _1522;
    bool _2120 = uint(_2094) >= uint(_915);
    int _2122 = int(_1956) + int(_2060);
    bool _2124 = !_2120;
    int _2126 = _2124 ? 0 : (-1);
    bool _2128 = uint(_2118) >= uint(_941);
    float _2130 = in.m_56.x;
    float _2132 = in.m_56.y;
    float _2134 = in.m_56.z;
    bool _2136 = _2048 != 3;
    bool _2138 = !_1924;
    int _2140 = _2138 ? 0 : 1;
    bool _2142 = uint(_2048) >= 2u;
    int _2144 = _2142 ? 0 : 1;
    int _2146 = ~_925;
    int _2148 = _2146 + 1;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2152 = _2150 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2154 = ~_2144;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    int _2160 = _2158;
    if (_2136)
    {
        int _2162 = ~_2144;
        int _2164 = _2162 + 1;
        _2160 = _2164;
    }
    int _2166 = _2160;
    int _2168 = _2148 * _2122;
    int _2170 = _2168 + _1858;
    float _2172 = 1.0 / _2152;
    bool _2174 = _2048 != 3;
    bool _2176 = !_2050;
    int _2178 = _2176 ? 0 : 1;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2184 = uint(_2170) >= uint(_925);
    float _2186 = _197 * _2132;
    float _2188 = _203 * _2132;
    float _2190 = _209 * _2132;
    float _2192 = fma(_195, _2130, _2186);
    float _2194 = fma(_201, _2130, _2188);
    float _2196 = fma(_207, _2130, _2190);
    float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2204 = _2202 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2206 = fma(_199, _2134, _2192);
    float _2208 = fma(_211, _2134, _2196);
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2212 = _2210 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2214 = fma(_205, _2134, _2194);
    float _2216 = 1.0 / _2204;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2222 = _2200 * _1826;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2230 = _2228 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2232 = _2220 * _1842;
    bool _2234 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2236 = isnan(_893);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2242 = _2238 || _2240;
    float _2244 = float(_2242);
    float _2246 = 1.0 / _2212;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2248;
    float _2252 = _2230 * _2036;
    bool _2254 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2256 = isnan(_893);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = -_2244;
    float _2268 = _2266 + 1.0;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2274 = _2206 + _1202;
    float _2276 = 1.0 / _2182;
    float _2278 = _2250 * _2216;
    bool _2280 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2282 = isnan(_893);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = -_2264;
    float _2294 = _2292 + 1.0;
    float _2296 = _2264 * _2268;
    bool _2298 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2300 = isnan(_893);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2310;
    bool _2314 = !_2174;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = _2272 * _2246;
    float _2320 = _2290 * _2294;
    float _2322 = -_2290;
    float _2324 = _2322 + 1.0;
    bool _2326 = !_2128;
    int _2328 = _2326 ? 0 : (-1);
    float _2330 = _2312 * _2172;
    int _2332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2334 = _2332 != 0;
    float _2336 = _2308 * _2324;
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2340 = _2338 != 0;
    float _2342 = _2226 * _2276;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2346 = _2344 != 0;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2350 = _893 + _2348;
    bool _2352 = !_2184;
    int _2354 = _2352 ? 0 : (-1);
    float _2356 = -_2308;
    float _2358 = _2356 + 1.0;
    bool _2360 = _1178 > 0.5;
    float _2362 = fma(_2222, _2350, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2364 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2366 = isnan(_893);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2372 = _2368 || _2370;
    float _2374 = float(_2372);
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2378 = _893 + _2376;
    float _2380 = fma(_2342, _1574, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2382 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2384 = isnan(_893);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = _2374 * _2358;
    float _2396 = -_225;
    int _2398 = _2360 ? as_type<int>(_2396) : as_type<int>(_225);
    float _2400 = -_2374;
    float _2402 = _2400 + 1.0;
    int _2404 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2406 = _2404 != 0;
    float _2408 = -_2392;
    float _2410 = _2408 + 1.0;
    bool _2412 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2414 = isnan(_893);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2392 * _2402;
    float _2426 = fma(_2232, _2378, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2428 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2430 = isnan(_893);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = in.m_72.w;
    float _2442 = _2422 * _2410;
    float _2444 = -_2422;
    float _2446 = _2444 + 1.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2450 = _893 + _2448;
    float _2452 = in.m_74.w;
    float _2454 = fma(_2252, _1214, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2456 = _2438 * _2446;
    float _2458 = fma(_2278, _2450, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2460 = fma(_2330, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2462 = _2362 * _2456;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2466 = _893 + _2464;
    bool _2468 = !_2406;
    float _2470 = _2468 ? _225 : as_type<float>(_2398);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2474 = _1184 != 1;
    float _2476 = -_2438;
    float _2478 = _2476 + 1.0;
    float _2480 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2482 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2462);
    float _2484 = fma(_2318, _2466, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2488 = _2018 + (-0.5);
    float _2490 = fma(_2426, _2442, _2482);
    float _2492 = _2214 + _2440;
    float _2494 = -_2486;
    float _2496 = fma(_2480, 2.0, _2494);
    float _2498 = _2482;
    float _2500 = _2462;
    float _2502 = _2442;
    if (!_2474)
    {
        _1268 = _1180;
    }
    float _2504 = _1268;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2508 = _2504;
    if (!_2474)
    {
        _1808 = _1180;
    }
    float _2510 = _1808;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2514 = _2510;
    if (!_2474)
    {
        _2498 = _1082;
    }
    float _2516 = _2498;
    float _2518 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2520 = _2516;
    if (!_2474)
    {
        _2500 = _1082;
    }
    float _2522 = _2500;
    float _2524 = _2208 + _2452;
    float _2526 = _2522;
    float _2528 = _2452;
    if (_2474)
    {
        _2508 = _1178;
    }
    float _2530 = _2508;
    float _2532 = -_135;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2496);
    if (_2474)
    {
        _2514 = _1178;
    }
    float _2536 = _2514;
    if (_2474)
    {
        _2520 = _1180;
    }
    float _2538 = _2520;
    float _2540 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2474)
    {
        _2526 = _1180;
    }
    float _2542 = _2526;
    bool _2544 = _1188 != 2;
    float _2546 = fma(_2380, _2424, _2490);
    float _2548 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2550 = fma(_2548, -2.0, _2472);
    float _2552 = fma(_2454, _2394, _2546);
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2560 = _2492 + _2558;
    float _2562 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2554);
    float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2566 = _2274 + _2564;
    float _2568 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2556);
    float _2570 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2574 = -_2512;
    float _2576 = fma(_2518, 2.0, _2574);
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2580 = _2524 + _2578;
    float _2582 = fma(_2570, -2.0, _2506);
    float _2584 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2572);
    if (_2544)
    {
        _2528 = _1180;
    }
    float _2586 = _2528;
    float _2588 = fma(_2458, _2336, _2552);
    float _2590 = _2586;
    if (_2544)
    {
        _2502 = _1178;
    }
    float _2592 = _2502;
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2584);
    float _2596 = _2592;
    if (!_2544)
    {
        _2596 = _1082;
    }
    float _2598 = _2596;
    float _2600 = -_135;
    float _2602 = fma(_2600, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2576);
    if (!_2544)
    {
        _2590 = _1178;
    }
    float _2604 = _2590;
    float _2606 = _1314 + 0.5;
    bool _2608 = _2594 >= 0.0;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2612 = fma(_2606, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2602);
    float _2614 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2582);
    float _2616 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2610);
    int _2618 = _2034 >> 31;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2622 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2550);
    float _2624 = -_2488;
    float _2626 = -_2614;
    float _2628 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2626);
    int _2630 = _2618 & 3;
    float _2632 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2620);
    float _2634 = _2080 + (-0.5);
    float _2636 = fma(_2484, _2320, _2588);
    int _2638 = _2034 + _2630;
    float _2640 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2642 = float(uint(_1820));
    float _2644 = -_2634;
    float _2646 = -_2622;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2646);
    int _2650 = _2638 >> 2;
    float _2652 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2654 = as_type<float>(_999) * _2642;
    int _2656 = _2650 << 4;
    int _2658 = _2656 + 656;
    float _2660 = fma(_2460, _2296, _2636);
    float _2662 = _2470 + 0.5;
    float _2664 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2666 = uint(int(uint(_2658) >> uint(2)));
    uint _2668 = uint(int(uint(int(_2666)) >> uint(2)));
    int _2670 = int(_2666) & 3;
    float _2672 = (*spvDescriptorSet0.vp_c9)._m0[int(_2668)][_2670];
    int _2674 = int(_2666) + 1;
    uint _2676 = uint(int(uint(_2674) >> uint(2)));
    int _2678 = _2674 & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    float _2682 = trunc(_2654);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = -_2664;
    float _2690 = fma(_2652, 2.0, _2688);
    float _2692 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2568);
    float _2694 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2534);
    int _2696 = ~_925;
    int _2698 = _2696 + 1;
    float _2700 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2702 = _2658 + 8;
    uint _2704 = uint(int(uint(_2702) >> uint(2)));
    uint _2706 = uint(int(uint(int(_2704)) >> uint(2)));
    int _2708 = int(_2704) & 3;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[int(_2706)][_2708];
    int _2712 = int(_2704) + 1;
    uint _2714 = uint(int(uint(_2712) >> uint(2)));
    int _2716 = _2712 & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    float _2720 = _2604 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2724 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2562);
    float _2726 = fma(_2720, -2.0, _2700);
    int _2728 = abs(_2114);
    float _2730 = -_135;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2690);
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2736 = _2698 * int(_2686);
    int _2738 = _2736 + _1820;
    int _2740 = ~_2122;
    int _2742 = _2740 + _2354;
    int _2744 = _2742 + 1;
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2748 = -_2734;
    float _2750 = fma(_2540, 2.0, _2748);
    float _2752 = -_2692;
    float _2754 = _2752 + 1.0;
    float _2756 = float(uint(_2738));
    float _2758 = -_2724;
    float _2760 = _2758 + 1.0;
    float _2762 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2660);
    int _2764 = abs(_2178);
    int _2766 = _925 * _2744;
    int _2768 = _2766 + _1858;
    float _2770 = -_2760;
    float _2772 = fma(_2770, _1314, _2612);
    if (_2608)
    {
        _1810 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2774 = _1810;
    float _2776 = as_type<float>(_999) * _2756;
    float _2778 = fma(_2754, _2018, _2628);
    float _2780 = _2722 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2782 = as_type<int>(_2722);
    if (_2608)
    {
        float _2784 = _2774 * 5.0;
        _2782 = as_type<int>(_2784);
    }
    int _2786 = _2782;
    out.m_84.x = _2772;
    out.m_84.y = _2778;
    float _2788 = trunc(_2776);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    int _2794 = ~_2090;
    int _2796 = _2794 + _2328;
    int _2798 = _2796 + 1;
    float _2800 = _1900 + 0.5;
    if (_2608)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9577 = as_type<float>(_2786);
        out.gl_Position.z = _9577;
    }
    int _2802 = ~_925;
    int _2804 = _2802 + 1;
    float _2806 = -_135;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2750);
    int _2810 = _941 * _2798;
    int _2812 = _2810 + _1522;
    int _2814 = abs(_1998);
    float _2816 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2818 = abs(_2166);
    float _2820 = fma(_2780, _2800, _2808);
    int _2822 = abs(_2316);
    float _2824 = _1462 + (-0.5);
    int _2826 = ~_2814;
    int _2828 = _2826 + 1;
    int _2830 = _2828 + 1;
    float _2832 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2616);
    int _2834 = ~_2728;
    int _2836 = _2834 + 1;
    int _2838 = _2836 + 1;
    float _2840 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2842 = int(_2840);
    float _2844 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2632);
    int _2846 = int(_2686) + int(_2792);
    int _2848 = _2838 * as_type<int>(_2680);
    int _2850 = ~_2764;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = -_2844;
    float _2858 = _2856 + 1.0;
    int _2860 = _1888 >> 31;
    int _2862 = _2804 * _2846;
    int _2864 = _2862 + _1820;
    int _2866 = _2854 * as_type<int>(_2672);
    int _2868 = _2866 + _2848;
    int _2870 = _2860 & 3;
    out.m_86.x = _2762;
    int _2872 = ~_2818;
    int _2874 = _2872 + 1;
    int _2876 = _2874 + 1;
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2880 = _1888 + _2870;
    int _2882 = as_type<int>(_2858);
    if (_2608)
    {
        out.m_63.x = 0.0;
    }
    int _2884 = ~_2822;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    int _2890 = _2876 * as_type<int>(_2710);
    int _2892 = _2890 + _2868;
    bool _2894 = !_1708;
    int _2896 = _2894 ? _2768 : (-1);
    float _2898 = fma(_2640, -2.0, _2878);
    bool _2900 = !_2340;
    int _2902 = _2900 ? 0 : 1;
    int _2904 = _2888 * as_type<int>(_2718);
    int _2906 = _2904 + _2892;
    int _2908 = _2896 >> 31;
    float _2910 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2898);
    float _2912 = float(uint(_2842));
    int _2914 = _2908 & 3;
    float _2916 = -_2816;
    float _2918 = -_2910;
    float _2920 = fma(_2916, _2824, _2918);
    int _2922 = abs(_2902);
    float _2924 = 1.0 / _2912;
    int _2926 = abs(_2842);
    float _2928 = fma(_1462, _2858, _2920);
    int _2930 = _2896 + _2914;
    int _2932 = _2880 >> 2;
    float _2934 = float(uint(_2926));
    int _2936 = ~_2922;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    int _2942 = _2930 >> 2;
    float _2944 = 1.0 / _2934;
    int _2946 = _2932 << 4;
    int _2948 = _2946 + 368;
    int _2950 = _2906 * _2940;
    bool _2952 = _1922 != 3;
    bool _2954 = !_1518;
    int _2956 = _2954 ? _2812 : (-1);
    uint _2958 = uint(int(uint(_2948) >> uint(2)));
    uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
    int _2962 = int(_2958) & 3;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[int(_2960)][_2962];
    int _2966 = int(_2958) + 1;
    uint _2968 = uint(int(uint(_2966) >> uint(2)));
    int _2970 = _2966 & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = _2942 << 4;
    int _2976 = _2974 + 800;
    int _2978 = _2896 & 3;
    bool _2980 = _2978 != 0;
    int _2982 = _2956 * _2922;
    int _2984 = _2982 + _2950;
    bool _2986 = !_2952;
    int _2988 = _2986 ? 0 : (-1);
    bool _2990 = uint(_2864) >= uint(_925);
    uint _2992 = uint(int(uint(_2976) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c9)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[int(_3002)][_3004];
    bool _3008 = !_2980;
    int _3010 = _3008 ? 0 : 1;
    int _3012 = _2896 & 3;
    bool _3014 = _3012 != 0;
    int _3016 = as_type<int>(_2924) + (-2);
    int _3018 = _3014 ? 0 : 1;
    int _3020 = _2976 + 8;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    uint _3024 = uint(int(uint(int(_3022)) >> uint(2)));
    int _3026 = int(_3022) & 3;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[int(_3024)][_3026];
    int _3030 = int(_3022) + 1;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    int _3034 = _3030 & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    float _3038 = float(uint(_2984));
    bool _3040 = uint(_2978) >= 2u;
    int _3042 = ~_2040;
    int _3044 = _3042 + _2126;
    int _3046 = _3044 + 1;
    float _3048 = as_type<float>(_3016) * _3038;
    int _3050 = abs(_2984);
    int _3052 = _2948 + 8;
    uint _3054 = uint(int(uint(_3052) >> uint(2)));
    uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
    int _3058 = int(_3054) & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = int(_3054) + 1;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    int _3066 = _3062 & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = _3040 ? 0 : 1;
    int _3072 = _915 * _3046;
    int _3074 = _3072 + _1466;
    bool _3076 = uint(_2978) > 1u;
    float _3078 = trunc(_3048);
    float _3080 = precise::max(_3078, 0.0);
    uint _3082 = uint(_3080);
    int _3084 = as_type<int>(_2944) + (-2);
    float _3086 = float(uint(_3050));
    bool _3088 = !_2990;
    int _3090 = _3088 ? 0 : (-1);
    bool _3092 = _2978 != 3;
    float _3094 = as_type<float>(_3084) * _3086;
    int _3096 = ~_2846;
    int _3098 = _3096 + _3090;
    int _3100 = _3098 + 1;
    int _3102 = ~_3018;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = trunc(_3094);
    float _3110 = precise::max(_3108, 0.0);
    uint _3112 = uint(_3110);
    int _3114 = _3106;
    if (!_3076)
    {
        int _3116 = ~_3018;
        int _3118 = _3116 + 1;
        _3114 = _3118;
    }
    int _3120 = _3114;
    int _3122 = _925 * _3100;
    int _3124 = _3122 + _1820;
    int _3126 = ~_2842;
    int _3128 = _3126 + 1;
    bool _3130 = _2978 != 3;
    int _3132 = _2830 * as_type<int>(_2972);
    int _3134 = ~_3070;
    int _3136 = _3134 + 1;
    int _3138 = _3136 + 1;
    int _3140 = _3138;
    if (_3092)
    {
        int _3142 = ~_3070;
        int _3144 = _3142 + 1;
        _3140 = _3144;
    }
    int _3146 = _3140;
    int _3148 = abs(_2140);
    int _3150 = _3128 * int(_3082);
    int _3152 = _3150 + _2984;
    int _3154 = ~_2926;
    int _3156 = _3154 + 1;
    int _3158 = abs(_3120);
    float _3160 = float(uint(_3152));
    int _3162 = _3156 * int(_3112);
    int _3164 = _3162 + _3050;
    int _3166 = ~_3158;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    int _3172 = ~_3148;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = as_type<float>(_3016) * _3160;
    float _3180 = float(uint(_3164));
    int _3182 = _3170 * as_type<int>(_3006);
    int _3184 = abs(_3010);
    float _3186 = trunc(_3178);
    float _3188 = precise::max(_3186, 0.0);
    uint _3190 = uint(_3188);
    int _3192 = _3176 * as_type<int>(_2964);
    int _3194 = _3192 + _3132;
    float _3196 = as_type<float>(_3084) * _3180;
    int _3198 = abs(_2074);
    int _3200 = abs(_3146);
    int _3202 = ~_3184;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    float _3208 = trunc(_3196);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    int _3214 = abs(_2988);
    int _3216 = ~_3198;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3206 * as_type<int>(_2998);
    int _3224 = _3222 + _3182;
    int _3226 = ~_3200;
    int _3228 = _3226 + 1;
    int _3230 = _3228 + 1;
    int _3232 = ~_3214;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * as_type<int>(_3060);
    int _3240 = _3238 + _3194;
    int _3242 = ~_2842;
    int _3244 = _3242 + 1;
    int _3246 = _3230 * as_type<int>(_3028);
    int _3248 = _3246 + _3224;
    bool _3250 = !_3130;
    int _3252 = _3250 ? 0 : (-1);
    int _3254 = _3236 * as_type<int>(_3068);
    int _3256 = _3254 + _3240;
    bool _3258 = !_2334;
    int _3260 = _3258 ? 0 : 1;
    int _3262 = int(_3082) + int(_3190);
    int _3264 = abs(_3252);
    int _3266 = abs(_3260);
    int _3268 = _3244 * _3262;
    int _3270 = _3268 + _2984;
    int _3272 = ~_3264;
    int _3274 = _3272 + 1;
    int _3276 = _3274 + 1;
    int _3278 = int(_3112) + int(_3212);
    int _3280 = ~_2926;
    int _3282 = _3280 + 1;
    int _3284 = _3276 * as_type<int>(_3036);
    int _3286 = _3284 + _3248;
    int _3288 = ~_3266;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    bool _3294 = uint(_3270) >= uint(_2842);
    int _3296 = _3282 * _3278;
    int _3298 = _3296 + _3050;
    bool _3300 = !_2346;
    int _3302 = _3300 ? 0 : 1;
    int _3304 = _3256 * _3292;
    bool _3306 = !_3294;
    int _3308 = _3306 ? 0 : (-1);
    float _3310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3312 = abs(_3302);
    bool _3314 = uint(_3298) >= uint(_2926);
    int _3316 = _2984 ^ _2842;
    int _3318 = ~_3262;
    int _3320 = _3318 + _3308;
    int _3322 = _3320 + 1;
    int _3324 = ~_3312;
    int _3326 = _3324 + 1;
    int _3328 = _3326 + 1;
    bool _3330 = !_3314;
    int _3332 = _3330 ? 0 : (-1);
    int _3334 = _2842 * _3322;
    int _3336 = _3334 + _2984;
    uint _3338 = uint(int(uint(_3316) >> uint(31)));
    int _3340 = _3286 * _3328;
    bool _3342 = _2842 == 0;
    float _3344 = _3310 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3346 = _2842 == 0;
    float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3350 = ~_3332;
    int _3352 = _3278 + _3350;
    int _3354 = _3352 + 1;
    float _3356 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2726);
    int _3358 = ~int(_3338);
    int _3360 = _3358 + 1;
    bool _3362 = !_1510;
    int _3364 = _3362 ? _3074 : (-1);
    int _3366 = _3354 ^ _3360;
    bool _3368 = !_3342;
    int _3370 = _3368 ? _3336 : (-1);
    int _3372 = _3364 * _3266;
    int _3374 = _3372 + _3304;
    int _3376 = ~_3360;
    int _3378 = _3376 + _3366;
    int _3380 = _3378 + 1;
    float _3382 = float(_3370);
    bool _3384 = !_3346;
    int _3386 = _3384 ? _3380 : (-1);
    float _3388 = fma(_3344, _3382, _2732);
    float _3390 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3394 = _1358 + 0.5;
    float _3396 = float(_3386);
    float _3398 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3392);
    bool _3400 = !_1708;
    int _3402 = _3400 ? _3124 : (-1);
    float _3404 = fma(_3344, _3394, _3388);
    float _3406 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3408 = -_3356;
    float _3410 = fma(_3390, _3396, _3408);
    float _3412 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3398);
    float _3414 = _1354 + (-0.5);
    float _3416 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3406);
    int _3418 = _3402 * _3312;
    int _3420 = _3418 + _3340;
    float _3422 = -_3412;
    float _3424 = _3422 + 1.0;
    float _3426 = -_3390;
    float _3428 = fma(_3426, _3414, _3410);
    float _3430 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3416);
    float _3432 = -_3424;
    float _3434 = fma(_1358, _3432, _3404);
    float _3436 = _2560 * _2560;
    float _3438 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3440 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3442 = -_3430;
    float _3444 = _3442 + 1.0;
    float _3446 = fma(_2566, _2566, _3436);
    float _3448 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3438);
    float _3450 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3440);
    float _3452 = -_3444;
    float _3454 = fma(_2470, _3452, _2694);
    float _3456 = fma(_2580, _2580, _3446);
    float _3458 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3448);
    float _3460 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3450);
    float _3462 = float(_3374);
    float _3464 = -_3458;
    float _3466 = _3464 + 1.0;
    float _3468 = rsqrt(_3456);
    float _3470 = -_2832;
    float _3472 = _3470 + 1.0;
    float _3474 = -_3460;
    float _3476 = _3474 + 1.0;
    float _3478 = fma(_2080, _3466, _2648);
    float _3480 = float(_3420);
    float _3482 = -_3472;
    float _3484 = fma(_1900, _3482, _2820);
    float _3486 = fma(_1354, _3476, _3428);
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3490 = _3488 != 0;
    int _3492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3494 = _3492 != 0;
    int _3496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3498 = _3496 != 0;
    out.m_88.x = _3462;
    out.m_90.x = _3454;
    out.m_90.y = _3478;
    out.m_90.z = _3484;
    out.m_90.w = _2928;
    bool _3500 = !_3494;
    int _3502 = _3500 ? 0 : 1;
    bool _3504 = !_3498;
    int _3506 = _3504 ? 0 : 1;
    out.m_88.w = _3480;
    float _3508 = _2560 * _3468;
    float _3510 = _2566 * _3468;
    bool _3512 = !_3490;
    int _3514 = _3512 ? 0 : 1;
    out.m_92.x = _3434;
    out.m_92.y = _3486;
    float _3516 = _3484;
    if (_2608)
    {
        return out;
    }
    float _3518 = -_3508;
    float _3520 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2492);
    float _3522 = _2580 * _3468;
    float _3524 = -_3510;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2274);
    float _3528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3530 = _3520 + _3528;
    float _3532 = -_3522;
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2524);
    float _3536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3538 = _3526 + _3536;
    float _3540 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3544 = _3534 + _3542;
    float _3546 = fma(_3538, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3540);
    float _3548 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3546);
    bool _3550 = _3548 >= 0.0;
    float _3552 = _3538;
    if (_3550)
    {
        _3516 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3554 = _3516;
    int _3556 = as_type<int>(_3554);
    if (_3550)
    {
        out.m_63.x = 0.0;
    }
    if (_3550)
    {
        float _3558 = _3554 * 5.0;
        _3556 = as_type<int>(_3558);
    }
    int _3560 = _3556;
    if (_3550)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10682 = as_type<float>(_3560);
        out.gl_Position.z = _10682;
    }
    if (_3550)
    {
        return out;
    }
    float _3562 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3564 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3566 = floor(_3562);
    float _3568 = floor(_3564);
    float _3570 = -_3566;
    float _3572 = _3562 + _3570;
    float _3574 = -_3568;
    float _3576 = _3564 + _3574;
    float2 _10718 = float2(_3572, _3576);
    float _3578 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10718, float2(0.0), isnan(_10718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10718, float2(0.0), isnan(_10718)), level(0.0)).x;
    float _3580 = _1082 * 2.0;
    float _3582 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3584 = log2(_3582);
    float _3586 = _1178 * 2.0;
    float _3588 = _1180 + _1178;
    float _3590 = _1180 * 2.0;
    int _3592 = abs(_3514);
    float _3594 = -_3508;
    float _3596 = fma(_3594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2560);
    float _3598 = _3588 + (-1.0);
    float _3600 = -_3510;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2566);
    float _3604 = floor(_3580);
    float _3606 = _3596 * _3596;
    float _3608 = float(_3592);
    float _3610 = -_3522;
    float _3612 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2580);
    float _3614 = floor(_3586);
    float _3616 = _3584 * _135;
    bool _3618 = _3604 > 0.0;
    float _3620 = floor(_3590);
    bool _3622 = _3604 >= 0.0;
    bool _3624 = isnan(_3604);
    bool _3626 = _3622 || _3624;
    bool _3628 = isnan(0.0);
    bool _3630 = _3626 || _3628;
    float _3632 = fma(_3598, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3634 = _1180 + _1082;
    float _3636 = _1180 + (-0.5);
    int _3638 = _3630 ? 0 : 1;
    float _3640 = _3634 + (-1.0);
    float _3642 = exp2(_3616);
    bool _3644 = _3614 >= 0.0;
    bool _3646 = isnan(_3614);
    bool _3648 = _3644 || _3646;
    bool _3650 = isnan(0.0);
    bool _3652 = _3648 || _3650;
    float _3654 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3656 = ~_3638;
    int _3658 = _3656 + 1;
    int _3660 = _3658 + 1;
    int _3662 = _3660;
    int _3664 = 2;
    if (!_3618)
    {
        int _3666 = ~_3638;
        int _3668 = _3666 + 1;
        _3662 = _3668;
    }
    int _3670 = _3662;
    float _3672 = _3520 + _3654;
    bool _3674 = _3614 > 0.0;
    bool _3676 = _3620 > 0.0;
    float _3678 = fma(_3640, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3680 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3682 = 1.0 + _3680;
    float _3684 = in.m_94.x;
    float _3686 = in.m_94.y;
    float _3688 = in.m_94.z;
    bool _3690 = _3620 >= 0.0;
    bool _3692 = isnan(_3620);
    bool _3694 = _3690 || _3692;
    bool _3696 = isnan(0.0);
    bool _3698 = _3694 || _3696;
    float _3700 = -_3642;
    float _3702 = _3700 + 1.0;
    float _3704 = 1.0 / _3682;
    int _3706 = _3652 ? 0 : 1;
    bool _3708 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3710 = isnan(1.0);
    bool _3712 = _3708 || _3710;
    bool _3714 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3716 = _3712 || _3714;
    int _3718 = ~_3706;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3722;
    if (!_3674)
    {
        int _3726 = ~_3706;
        int _3728 = _3726 + 1;
        _3724 = _3728;
    }
    int _3730 = _3724;
    bool _3732 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3734 = isnan(0.0);
    bool _3736 = _3732 || _3734;
    bool _3738 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3740 = _3736 || _3738;
    float _3742 = float(_3670);
    float _3744 = _3740 ? _3702 : 0.0;
    int _3746 = abs(_3502);
    float _3748 = _3608 * _3742;
    float _3750 = float(_3730);
    if (_3716)
    {
        float _3752 = _3744 * _3704;
        _145 = _3752;
    }
    float _3754 = _145;
    float _3756 = float(_3746);
    float _3758 = fma(_3602, _3602, _3606);
    float _3760 = _3748 * (-2.0);
    int _3762 = _3698 ? 0 : 1;
    float _3764 = _3756 * _3750;
    float _3766 = _1178 + (-0.5);
    float _3768 = fma(_3760, _3684, _3684);
    float _3770 = fma(_3632, _3760, _3632);
    int _3772 = abs(_3506);
    float _3774 = _1178 + _1082;
    float _3776 = fma(_3766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3768);
    float _3778 = _3764 * (-2.0);
    int _3780 = ~_3762;
    int _3782 = _3780 + 1;
    int _3784 = _3782 + 1;
    float _3786 = _3774 + (-1.0);
    int _3788 = _3784;
    if (!_3676)
    {
        int _3790 = ~_3762;
        int _3792 = _3790 + 1;
        _3788 = _3792;
    }
    int _3794 = _3788;
    float _3796 = fma(_3678, _3778, _3678);
    float _3798 = fma(_3778, _3686, _3686);
    float _3800 = _1082 + (-0.5);
    float _3802 = float(_3794);
    float _3804 = fma(_3636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3798);
    float _3806 = float(_3772);
    float _3808 = fma(_3770, _3754, _3776);
    float _3810 = fma(_3612, _3612, _3758);
    float _3812 = fma(_3796, _3754, _3804);
    float _3814 = _3806 * _3802;
    float _3816 = _3808 * 0.15915493667125701904296875;
    float _3818 = _3812 * 0.15915493667125701904296875;
    float _3820 = _3814 * (-2.0);
    float _3822 = sqrt(_3810);
    float _3824 = fma(_3786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3826 = fma(_3820, _3688, _3688);
    float _3828 = fma(_3824, _3820, _3824);
    float _3830 = fma(_3800, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3826);
    float _3832 = _3816 * 6.283185482025146484375;
    float _3834 = sin(_3832);
    float _3836 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3838 = fma(_3828, _3754, _3830);
    float _3840 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3842 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3836);
    float _3844 = _3838 * 0.15915493667125701904296875;
    float _3846 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3840);
    float _3848 = _3816 * 6.283185482025146484375;
    float _3850 = cos(_3848);
    float _3852 = _3468 * _3822;
    float _3854 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3842);
    float _3856 = fma(_3534, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3846);
    float _3858 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3860 = _3856 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3862 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3864 = _3818 * 6.283185482025146484375;
    float _3866 = sin(_3864);
    float _3868 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3862);
    float _3870 = fma(_3534, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3868);
    float _3872 = 1.0 / _3860;
    float _3874 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3876 = _3874 + _3860;
    float _3878 = _3818 * 6.283185482025146484375;
    float _3880 = cos(_3878);
    float _3882 = _3834 * _3866;
    float _3884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3886 = _3844 * 6.283185482025146484375;
    float _3888 = sin(_3886);
    float _3890 = _3876 * _3872;
    float _3892 = _3890 * 0.5;
    float _3894 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3896 = _3850 * _3866;
    float _3898 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3900 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3898);
    float _3902 = _3844 * 6.283185482025146484375;
    float _3904 = cos(_3902);
    float _3906 = _3850 * _3880;
    float _3908 = fma(_3888, _3906, _3882);
    float _3910 = 1.0 / _3900;
    float _3912 = fma(_3888, _3882, _3906);
    float _3914 = _3852 * _3894;
    float _3916 = _3834 * _3880;
    float _3918 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3920 = _3850 * _3904;
    float _3922 = _3880 * _3904;
    float _3924 = _3834 * _3904;
    float _3926 = _3866 * _3904;
    float _3928 = _3884 * _3914;
    float _3930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3932 = _3852 * _3918;
    float _3934 = -_3896;
    float _3936 = fma(_3888, _3916, _3934);
    float _3938 = -_3916;
    float _3940 = fma(_3888, _3896, _3938);
    float _3942 = -_3928;
    float _3944 = _3888 * _3942;
    float _3946 = _3930 * _3932;
    float _3948 = _3920 * _3928;
    float _3950 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3952 = _3924 * _3928;
    float _3954 = fma(_3922, _3946, _3944);
    float _3956 = fma(_3908, _3946, _3948);
    float _3958 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3950);
    float _3960 = fma(_3936, _3946, _3952);
    float _3962 = _3852 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3964 = _3962 * 0.5;
    float _3966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3968 = _3910 * _3966;
    float _3970 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3958);
    float _3972 = trunc(_3858);
    int _3974 = int(_3972);
    float _3976 = fma(_3940, _3964, _3956);
    float _3978 = fma(_3926, _3964, _3954);
    bool _3980 = _3968 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3982 = _3970 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3984 = _3968 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3986 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3988 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3990 = trunc(_3982);
    int _3992 = int(_3990);
    float _3994 = fma(_3912, _3964, _3960);
    float _3996 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3986);
    float _3998 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3988);
    bool _4000 = !_3980;
    int _4002 = _4000 ? 0 : 1;
    float _4004 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4006 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3996);
    float _4008 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3998);
    int _4010 = as_type<int>(_3976);
    int _4012 = as_type<int>(_3994);
    float _4014 = _4004;
    if (!_3980)
    {
        _3664 = 1;
    }
    int _4016 = _3664;
    float _4018 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4004);
    int _4020 = _4016;
    if (!_3984)
    {
        _4020 = _4002;
    }
    int _4022 = _4020;
    float _4024 = _4006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4026 = _4008 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _4028 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4030 = _3974 + _4028;
    int _4032 = _4030 + 1;
    float _4034 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4018);
    int _4036 = _4022 << 6;
    float _4038 = _2524 + _4024;
    int _4040 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4042 = _3992 + _4040;
    int _4044 = _4042 + 1;
    float _4046 = _2274 + _4026;
    int _4048 = _4036 + 48;
    uint _4050 = uint(int(uint(_4048) >> uint(2)));
    uint _4052 = uint(int(uint(int(_4050)) >> uint(2)));
    int _4054 = int(_4050) & 3;
    float _4056 = (*spvDescriptorSet0.vp_c15)._m0[int(_4052)][_4054];
    int _4058 = int(_4050) + 1;
    uint _4060 = uint(int(uint(_4058) >> uint(2)));
    int _4062 = _4058 & 3;
    float _4064 = (*spvDescriptorSet0.vp_c15)._m0[int(_4060)][_4062];
    float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4068 = _4038 + _4066;
    int _4070 = _4044 | _4032;
    float _4072 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4074 = _4046 + _4072;
    bool _4076 = _4044 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4078 = _4068 * _4068;
    float _4080 = _4034 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _4082 = _4036 + 56;
    uint _4084 = uint(int(uint(_4082) >> uint(2)));
    uint _4086 = uint(int(uint(int(_4084)) >> uint(2)));
    int _4088 = int(_4084) & 3;
    float _4090 = (*spvDescriptorSet0.vp_c15)._m0[int(_4086)][_4088];
    int _4092 = int(_4084) + 1;
    uint _4094 = uint(int(uint(_4092) >> uint(2)));
    int _4096 = _4092 & 3;
    float _4098 = (*spvDescriptorSet0.vp_c15)._m0[int(_4094)][_4096];
    float _4100 = fma(_4074, _4074, _4078);
    bool _4102 = _4070 < 0;
    bool _4104 = _4102 || _4076;
    float _4106 = _2492 + _4080;
    float _4108 = sqrt(_4100);
    bool _4110 = _4032 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4112 = _4110 || _4104;
    int _4114 = _4036 + 64;
    uint _4116 = uint(int(uint(_4114) >> uint(2)));
    uint _4118 = uint(int(uint(int(_4116)) >> uint(2)));
    int _4120 = int(_4116) & 3;
    float _4122 = (*spvDescriptorSet0.vp_c15)._m0[int(_4118)][_4120];
    int _4124 = int(_4116) + 1;
    uint _4126 = uint(int(uint(_4124) >> uint(2)));
    int _4128 = _4124 & 3;
    float _4130 = (*spvDescriptorSet0.vp_c15)._m0[int(_4126)][_4128];
    int _4132 = _4036 + 72;
    uint _4134 = uint(int(uint(_4132) >> uint(2)));
    uint _4136 = uint(int(uint(int(_4134)) >> uint(2)));
    int _4138 = int(_4134) & 3;
    float _4140 = (*spvDescriptorSet0.vp_c15)._m0[int(_4136)][_4138];
    int _4142 = int(_4134) + 1;
    uint _4144 = uint(int(uint(_4142) >> uint(2)));
    int _4146 = _4142 & 3;
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[int(_4144)][_4146];
    float _4150 = as_type<float>(_4032);
    float _4152 = _4046;
    float _4154 = as_type<float>(_4044);
    if (!_4112)
    {
        int _4156 = _4032 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4158 = _4156 + _4044;
        _4010 = _4158;
    }
    int _4160 = _4010;
    bool _4162 = _4108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4164 = _4036 + 96;
    uint _4166 = uint(int(uint(_4164) >> uint(2)));
    uint _4168 = uint(int(uint(int(_4166)) >> uint(2)));
    int _4170 = int(_4166) & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    int _4174 = int(_4166) + 1;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    int _4178 = _4174 & 3;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[int(_4176)][_4178];
    float _4182 = as_type<float>(_4160);
    if (!_4112)
    {
        int _4184 = _4160 << 2;
        _4012 = _4184;
    }
    int _4186 = _4012;
    int _4188 = _4186;
    if (!_4112)
    {
        uint _4190 = uint(int(uint(_4160) >> uint(2)));
        _2882 = int(_4190);
    }
    int _4192 = _2882;
    float _4194 = as_type<float>(_4192);
    if (!_4112)
    {
        int _4196 = 12 & _4186;
        _4188 = _4196;
    }
    int _4198 = _4188;
    int _4200 = _4036 + 104;
    uint _4202 = uint(int(uint(_4200) >> uint(2)));
    uint _4204 = uint(int(uint(int(_4202)) >> uint(2)));
    int _4206 = int(_4202) & 3;
    float _4208 = (*spvDescriptorSet0.vp_c15)._m0[int(_4204)][_4206];
    int _4210 = int(_4202) + 1;
    uint _4212 = uint(int(uint(_4210) >> uint(2)));
    int _4214 = _4210 & 3;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[int(_4212)][_4214];
    if (!_4112)
    {
        int _4218 = _4192 << 4;
        int _4220 = _4218 + _4198;
        _4194 = as_type<float>(_4220);
    }
    float _4222 = _4194;
    if (!_4162)
    {
        _4150 = _4046;
    }
    float _4224 = _4150;
    float _4226 = _4224;
    if (!_4162)
    {
        _4152 = _4038;
    }
    float _4228 = _4152;
    float _4230 = _4228;
    if (!_4162)
    {
        _4154 = _4106;
    }
    float _4232 = _4154;
    bool _4234 = !_4162;
    float _4236 = _4232;
    if (!_4234)
    {
        float _4238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4242 = _4108 + _4240;
        float _4244 = rsqrt(_4100);
        float _4246 = _4242 * _4238;
        float _4248 = _4106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4250 = _4246 * 0.15915493667125701904296875;
        float _4252 = _4250 * 6.283185482025146484375;
        float _4254 = cos(_4252);
        float _4256 = _4250 * 6.283185482025146484375;
        float _4258 = sin(_4256);
        float _4260 = _4254 + (-1.0);
        float _4262 = fma(_4258, _4248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4264 = _4260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4266 = _4244 * _4262;
        float _4268 = fma(_4106, _4254, _4264);
        float _4270 = fma(_4074, _4266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4272 = fma(_4068, _4266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4236 = _4268;
        _4226 = _4270;
        _4230 = _4272;
        _4014 = _4266;
    }
    float _4274 = _4236;
    float _4276 = _4226;
    float _4278 = _4230;
    float _4280 = _4014;
    float _4282 = -_2492;
    float _4284 = _4282 + _4274;
    int _4286 = _4036 + 80;
    uint _4288 = uint(int(uint(_4286) >> uint(2)));
    uint _4290 = uint(int(uint(int(_4288)) >> uint(2)));
    int _4292 = int(_4288) & 3;
    float _4294 = (*spvDescriptorSet0.vp_c15)._m0[int(_4290)][_4292];
    int _4296 = int(_4288) + 1;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    int _4300 = _4296 & 3;
    float _4302 = (*spvDescriptorSet0.vp_c15)._m0[int(_4298)][_4300];
    float _4304 = -_2274;
    float _4306 = _4304 + _4276;
    float _4308 = -_2524;
    float _4310 = _4308 + _4278;
    float _4312 = _4284 * _4284;
    float _4314 = _3672 * _4180;
    float _4316 = _4280;
    float _4318 = _4312;
    float _4320 = _4276;
    float _4322 = _4274;
    float _4324 = _4278;
    if (!_4112)
    {
        float _4326 = floor(_3858);
        _4316 = _4326;
    }
    float _4328 = _4316;
    float _4330 = _3672 * _4130;
    float _4332 = fma(_4306, _4306, _4312);
    int _4334 = _4036 + 88;
    uint _4336 = uint(int(uint(_4334) >> uint(2)));
    uint _4338 = uint(int(uint(int(_4336)) >> uint(2)));
    int _4340 = int(_4336) & 3;
    float _4342 = (*spvDescriptorSet0.vp_c15)._m0[int(_4338)][_4340];
    int _4344 = int(_4336) + 1;
    uint _4346 = uint(int(uint(_4344) >> uint(2)));
    int _4348 = _4344 & 3;
    float _4350 = (*spvDescriptorSet0.vp_c15)._m0[int(_4346)][_4348];
    float _4352 = fma(_3526, _4172, _4314);
    float _4354 = fma(_3526, _4122, _4330);
    float _4356 = fma(_4310, _4310, _4332);
    float _4358 = fma(_3534, _4208, _4352);
    float _4360 = _4328;
    if (!_4112)
    {
        float _4362 = floor(_3982);
        _4318 = _4362;
    }
    float _4364 = _4318;
    bool _4366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4368 = isnan(0.5);
    bool _4370 = _4366 || _4368;
    bool _4372 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4374 = _4370 || _4372;
    float _4376 = _4222;
    if (!_4112)
    {
        int _4378 = as_type<int>(_4222) + 400;
        uint _4380 = uint(int(uint(_4378) >> uint(2)));
        uint _4382 = uint(int(uint(int(_4380)) >> uint(2)));
        int _4384 = int(_4380) & 3;
        float _4386 = (*spvDescriptorSet0.vp_c15)._m0[int(_4382)][_4384];
        _4376 = _4386;
    }
    float _4388 = _4376;
    float _4390 = _4358 + _4216;
    float _4392 = _3672 * _4064;
    float _4394 = fma(_3534, _4140, _4354);
    float _4396 = sqrt(_4356);
    float _4398 = fma(_3526, _4056, _4392);
    float _4400 = fma(_3534, _4090, _4398);
    bool _4402 = _4396 > 0.0;
    float _4404 = 1.0 / _4390;
    bool _4406 = !_4402;
    if (!_4406)
    {
        float _4408 = _245 * _245;
        float _4410 = rsqrt(_4356);
        float _4412 = fma(_241, _241, _4408);
        float _4414 = fma(_247, _247, _4412);
        float _4416 = sqrt(_4414);
        float _4418 = _4306 * _4410;
        float _4420 = _4284 * _4410;
        float _4422 = _4310 * _4410;
        bool _4424 = _4416 > 0.0;
        bool _4426 = !_4424;
        if (!_4426)
        {
            float _4428 = rsqrt(_4414);
            float _4430 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4432 = _245 * _4428;
            float _4434 = _241 * _4428;
            float _4436 = _4420 * _4432;
            float _4438 = _247 * _4428;
            float _4440 = fma(_4418, _4434, _4436);
            float _4442 = _4430 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4444 = fma(_4422, _4438, _4440);
            float _4446 = _4444 * _4442;
            float _4448 = fma(_241, _4446, _4276);
            float _4450 = fma(_245, _4446, _4274);
            float _4452 = fma(_247, _4446, _4278);
            _4320 = _4448;
            _4322 = _4450;
            _4324 = _4452;
        }
    }
    float _4454 = _4320;
    float _4456 = _4322;
    float _4458 = _4324;
    float _4460 = -_3510;
    float _4462 = fma(_4460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4454);
    float _4464 = -_3508;
    float _4466 = fma(_4464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4456);
    float _4468 = -_3522;
    float _4470 = fma(_4468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4458);
    float _4472 = _4400 + _4098;
    float _4474 = _4394 + _4148;
    float _4476 = _4466;
    float _4478 = _4462;
    float _4480 = _4470;
    float _4482 = _4474;
    if (!_4374)
    {
        float _4484 = _3530 * _3530;
        float _4486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4488 = -_2524;
        float _4490 = _4488 + _4458;
        float _4492 = -_2492;
        float _4494 = _4492 + _4456;
        float _4496 = fma(_3538, _3538, _4484);
        float _4498 = -_2274;
        float _4500 = _4498 + _4454;
        float _4502 = fma(_3544, _3544, _4496);
        float _4504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4506 = sqrt(_4502);
        float _4508 = 1.0 / _3852;
        float _4510 = precise::min(_4506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4512 = _4510 * _4486;
        float _4514 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4516 = _4512 * _4508;
        float _4518 = _4514 * _4516;
        float _4520 = _4490 * _4516;
        float _4522 = fma(_4494, _4518, _3520);
        float _4524 = fma(_4500, _4518, _3526);
        float _4526 = fma(_4514, _4520, _3534);
        _4476 = _4522;
        _4478 = _4524;
        _4480 = _4526;
    }
    float _4528 = _4476;
    float _4530 = _4478;
    float _4532 = _4480;
    float _4534 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4536 = _4472 * _4404;
    float _4538 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4540 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4542 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4534);
    float _4544 = _4474 * _4404;
    bool _4546 = _4536 >= 0.0;
    float _4548 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4538);
    float _4550 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4542);
    float _4552 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4540);
    bool _4554 = _4536 <= 1.0;
    bool _4556 = _4554 && _4546;
    float _4558 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4560 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4548);
    float _4562 = _4550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4564 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4552);
    float _4566 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4558);
    float _4568 = _4560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4570 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4572 = _4544 >= 0.0;
    bool _4574 = _4572 && _4556;
    float _4576 = _4564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4578 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4566);
    float _4580 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4570);
    bool _4582 = _4544 <= 1.0;
    bool _4584 = _4582 && _4574;
    float _4586 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4588 = _4576 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4590 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4592 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4580);
    float _4594 = _3672 * _4302;
    float _4596 = -_4588;
    float _4598 = fma(_4596, _4586, 1.0);
    float _4600 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4602 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4592);
    float _4604 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4606 = fma(_3526, _4294, _4594);
    float _4608 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4600);
    float _4610 = log2(_4598);
    float _4612 = _4566;
    if (_4584)
    {
        float _4614 = float(_4022);
        _4612 = _4614;
    }
    float _4616 = _4612;
    float _4618 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4604);
    float _4620 = fma(_3534, _4342, _4606);
    float _4622 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4608);
    if (!_4112)
    {
        float _4624 = -_4364;
        float _4626 = _3982 + _4624;
        _4482 = _4626;
    }
    float _4628 = _4482;
    float _4630 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4618);
    float _4632 = _4620 + _4350;
    float _4634 = 1.0 / _4602;
    float _4636 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4622);
    float _4638 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4630);
    float _4640 = _4636;
    if (!_4112)
    {
        float _4642 = -_4328;
        float _4644 = _3858 + _4642;
        _4360 = _4644;
    }
    float _4646 = _4360;
    float _4648 = _4632 * _4404;
    float _4650 = _4394;
    if (!_4112)
    {
        float _4652 = rint(_4388);
        float _4654 = precise::max(_4652, 0.0);
        uint _4656 = uint(_4654);
        uint _4658 = clamp(_4656, 0u, 65535u);
        _4650 = as_type<float>(_4658);
    }
    float _4660 = _4650;
    float _4662 = _4610 * 0.693147182464599609375;
    float _4664 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4666 = _4616;
    if (_4584)
    {
        float _4668 = rint(_4616);
        float _4670 = precise::max(_4668, 0.0);
        uint _4672 = uint(_4670);
        uint _4674 = clamp(_4672, 0u, 65535u);
        _4666 = as_type<float>(_4674);
    }
    float _4676 = _4666;
    float _4678 = _4636 * _4634;
    float _4680 = _4638 * _4634;
    float _4682 = fma(_4678, 0.5, 0.5);
    float _4684 = fma(_4680, -0.5, 0.5);
    float _4686 = _4628;
    float _4688 = _4680;
    float _4690 = _4660;
    if (!_4112)
    {
        float3 _12490 = float3(_4628, _4646, float(as_type<int>(_4660)));
        float3 _12494 = select(_12490, float3(0.0), isnan(_12490));
        float _4692 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12494.xy, uint(rint(_12494.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12494.xy, uint(rint(_12494.z)), level(0.0)).x;
        _4686 = _4692;
    }
    float _4694 = _4686;
    float _4696 = _4544;
    if (_4584)
    {
        float3 _12509 = float3(_4536, _4544, float(as_type<int>(_4676)));
        float3 _12511 = select(_12509, float3(0.0), isnan(_12509));
        float _4698 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12511.xy, uint(rint(_12511.z)), _4648, level(0.0));
        _4696 = _4698;
    }
    float _4700 = _4696;
    float3 _12521 = float3(_4682, _4684, _4664);
    float _4702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12521, float3(0.0), isnan(_12521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12521, float3(0.0), isnan(_12521)), level(0.0)).x;
    float3 _12530 = float3(_4682, _4684, _4664);
    float4 _4705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12530, float3(0.0), isnan(_12530)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12530, float3(0.0), isnan(_12530)), level(0.0)).xyzw;
    float _4707 = _4705.x;
    float _4709 = _4705.y;
    float _4711 = _4705.z;
    float _4713 = _4705.w;
    bool _4715 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4717 = isnan(0.5);
    bool _4719 = _4715 || _4717;
    bool _4721 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4723 = _4719 || _4721;
    if (_4112)
    {
        _3552 = 1.0;
    }
    float _4725 = _3552;
    float _4727 = _4725;
    if (_4723)
    {
        _4688 = 1.0;
    }
    float _4729 = _4688;
    float _4731 = _4729;
    if (!_4723)
    {
        float _4733 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4735 = _4733 * 0.15915493667125701904296875;
        float _4737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4739;
        float _4743 = _4735 * 6.283185482025146484375;
        float _4745 = cos(_4743);
        float _4747 = _4737 * 0.15915493667125701904296875;
        float _4749 = _4735 * 6.283185482025146484375;
        float _4751 = sin(_4749);
        float _4753 = 1.0 / _4745;
        float _4755 = _4747 * 6.283185482025146484375;
        float _4757 = cos(_4755);
        float _4759 = _4751 * _4753;
        float _4761 = _4747 * 6.283185482025146484375;
        float _4763 = sin(_4761);
        float _4765 = _4757 * _4759;
        float _4767 = 1.0 / _4741;
        float _4769 = 1.0 / _4765;
        float _4771 = _4763 * _4769;
        float _4773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4775 = fma(_3968, _4771, _4773);
        float _4777 = _4775 * _4767;
        float _4779 = precise::clamp(_4777, 0.0, 1.0);
        _4690 = _4767;
        _4731 = _4779;
    }
    float _4781 = _4690;
    float _4783 = _4731;
    if (!_4112)
    {
        int _4785 = _4160 << 4;
        int _4787 = _4785 + 2048;
        uint _4789 = uint(int(uint(_4787) >> uint(2)));
        uint _4791 = uint(int(uint(int(_4789)) >> uint(2)));
        int _4793 = int(_4789) & 3;
        float _4795 = (*spvDescriptorSet0.vp_c15)._m0[int(_4791)][_4793];
        int _4797 = int(_4789) + 1;
        uint _4799 = uint(int(uint(_4797) >> uint(2)));
        int _4801 = _4797 & 3;
        float _4803 = (*spvDescriptorSet0.vp_c15)._m0[int(_4799)][_4801];
        int _4805 = _4787 + 8;
        uint _4807 = uint(int(uint(_4805) >> uint(2)));
        uint _4809 = uint(int(uint(int(_4807)) >> uint(2)));
        int _4811 = int(_4807) & 3;
        float _4813 = (*spvDescriptorSet0.vp_c15)._m0[int(_4809)][_4811];
        int _4815 = int(_4807) + 1;
        uint _4817 = uint(int(uint(_4815) >> uint(2)));
        int _4819 = _4815 & 3;
        float _4821 = (*spvDescriptorSet0.vp_c15)._m0[int(_4817)][_4819];
        float _4823 = _3672 * _4803;
        float _4825 = fma(_3526, _4795, _4823);
        float _4827 = fma(_3534, _4813, _4825);
        float _4829 = _4827 + _4821;
        float _4831 = precise::clamp(_4829, 0.0, 1.0);
        float _4833 = -_4831;
        float _4835 = _4833 + _4694;
        float _4837 = fma(_4835, 500.0, 1.5);
        float _4839 = exp2(_4837);
        float _4841 = 0.0 + _4839;
        float _4843 = precise::clamp(_4841, 0.0, 1.0);
        _4182 = as_type<float>(_4787);
        _4727 = _4843;
    }
    float _4845 = _4182;
    float _4847 = _4727;
    float _4849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4851 = _4528 + _4849;
    float _4853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4855 = _4530 + _4853;
    float _4857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4859 = _4532 + _4857;
    float _4861 = _4851 * _4851;
    float _4863 = fma(_4855, _4855, _4861);
    float _4865 = fma(_4859, _4859, _4863);
    float _4867 = rsqrt(_4865);
    float _4869 = _4867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4871 = _4855 * _4869;
    float _4873 = _4859 * _4869;
    float _4875 = _4871 * _4871;
    float _4877 = _4873 * _4873;
    float _4879 = _4875 + _4877;
    float _4881 = sqrt(_4879);
    bool _4883 = _4881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4885 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4887 = _4881 + _4885;
    float _4889 = _4859;
    float _4891 = _4861;
    float _4893 = _4887;
    float _4895 = _4845;
    float _4897 = _4851;
    if (_4883)
    {
        float _4899 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4889 = _4899;
    }
    float _4901 = _4889;
    if (_4883)
    {
        float _4903 = rsqrt(_4879);
        _4891 = _4903;
    }
    float _4905 = _4891;
    float _4907 = _4905;
    if (_4883)
    {
        float _4909 = _4887 * _4901;
        _4893 = _4909;
    }
    float _4911 = _4893;
    if (_4883)
    {
        float _4913 = _4911 * 0.15915493667125701904296875;
        _4895 = _4913;
    }
    float _4915 = _4895;
    float _4917 = _4867;
    if (_4883)
    {
        float _4919 = _4915 * 6.283185482025146484375;
        float _4921 = sin(_4919);
        _4917 = _4921;
    }
    float _4923 = _4917;
    float _4925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4927 = precise::max(0.0, _4925);
    float _4929 = _4781;
    float _4931 = _4927;
    float _4933 = _4925;
    if (_4883)
    {
        float _4935 = _4915 * 6.283185482025146484375;
        float _4937 = cos(_4935);
        _4929 = _4937;
    }
    float _4939 = _4929;
    float _4941 = -_4869;
    float _4943 = -_4927;
    float _4945 = fma(_4851, _4941, _4943);
    if (_4883)
    {
        float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4931 = _4947;
    }
    float _4949 = _4931;
    float _4951 = _4923;
    float _4953 = _4949;
    if (_4883)
    {
        float _4955 = fma(_4923, _4949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4951 = _4955;
    }
    float _4957 = _4951;
    float _4959 = _4957;
    if (!_4883)
    {
        _4953 = _4873;
    }
    float _4961 = _4953;
    float _4963 = _4961;
    float _4965 = _4939;
    if (_4883)
    {
        float _4967 = _4939 + (-1.0);
        _4933 = _4967;
    }
    float _4969 = _4933;
    float _4971 = _4969;
    if (_4883)
    {
        float _4973 = _4905 * _4957;
        _4897 = _4973;
    }
    float _4975 = _4897;
    float _4977 = _4975;
    if (!_4883)
    {
        _4907 = _4871;
    }
    float _4979 = _4907;
    float _4981 = _4979;
    if (_4883)
    {
        float _4983 = _4969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4971 = _4983;
    }
    float _4985 = _4971;
    if (_4883)
    {
        float _4987 = _4871 * _4975;
        _4981 = _4987;
    }
    float _4989 = _4981;
    if (!_4883)
    {
        _4959 = _4945;
    }
    float _4991 = _4959;
    float _4993 = _4991;
    if (_4883)
    {
        float _4995 = _4873 * _4975;
        _4963 = _4995;
    }
    float _4997 = _4963;
    if (_4883)
    {
        float _4999 = fma(_4945, _4939, _4985);
        _4993 = _4999;
    }
    float _5001 = _4993;
    if (!_4883)
    {
        _4965 = _4875;
    }
    float _5003 = _4965;
    float _5005 = _5003;
    if (_4883)
    {
        float _5007 = _4989 * _4989;
        _5005 = _5007;
    }
    float _5009 = _5005;
    float _5011 = sqrt(_4865);
    if (!_4883)
    {
        _4977 = _4877;
    }
    float _5013 = _4977;
    float _5015 = _5013;
    if (_4883)
    {
        float _5017 = _4997 * _4997;
        _5015 = _5017;
    }
    float _5019 = _5015;
    float _5021 = fma(_5001, _5001, _5009);
    float _5023 = _5021 + _5019;
    float _5025 = rsqrt(_5023);
    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5029 = fma(_5011, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5027);
    float _5031 = precise::clamp(_5029, 0.0, 1.0);
    float _5033 = -_5031;
    float _5035 = _5033 + 1.0;
    float _5037 = abs(_5035);
    float _5039 = log2(_5037);
    float _5041 = _5025 * _4989;
    float _5043 = _5025 * _5001;
    float _5045 = _5025 * _4997;
    float _5047 = _5041 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5049 = -_5047;
    float _5051 = fma(_5043, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5049);
    float _5053 = -_5045;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5051);
    float _5057 = _5039 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5059 = fma(_5055, -0.5, 0.5);
    float _5061 = fma(_5055, 0.5, 0.5);
    float _5063 = _5043 + 1.0;
    float _5065 = exp2(_5057);
    float _5067 = fma(_5061, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5069 = fma(_5061, _5067, -0.212114393711090087890625);
    float _5071 = sqrt(_5059);
    float _5073 = fma(_5061, _5069, 1.570728778839111328125);
    float _5075 = -_5043;
    float _5077 = fma(_5065, _5063, _5075);
    float _5079 = fma(_5077, 0.5, 0.5);
    float _5081 = _5071 * 0.636619746685028076171875;
    float _5083 = -_5073;
    float _5085 = fma(_5081, _5083, 1.0);
    float2 _13101 = float2(_5085, _5079);
    float3 _5089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13101, float2(0.0), isnan(_13101)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13101, float2(0.0), isnan(_13101)), level(0.0)).xyz;
    float _5091 = _5089.x;
    float _5093 = _5089.y;
    float _5095 = _5089.z;
    float _5097 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5099 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5101 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5103 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5105 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5097);
    float _5107 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5099);
    float _5109 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5101);
    float _5111 = abs(_3968);
    float _5113 = log2(_5111);
    float _5115 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5117 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5119 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5121 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5123 = -_3888;
    float _5125 = fma(_5123, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5115);
    float _5127 = -_3888;
    float _5129 = fma(_5127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5117);
    float _5131 = -_3888;
    float _5133 = fma(_5131, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5119);
    float _5135 = fma(_5103, _5103, 1.0);
    float _5137 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5139 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5141 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5143 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5129);
    float _5145 = rsqrt(_5135);
    float _5147 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5137);
    float _5149 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5139);
    float _5151 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5141);
    float _5153 = _5113 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5155 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5125);
    float _5157 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5133);
    float _5159 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5147);
    float _5161 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5149);
    float _5163 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5151);
    float _5165 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5167 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5105);
    float _5169 = _5103 * _5143;
    float _5171 = exp2(_5153);
    float _5173 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5109);
    float _5175 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5107);
    float _5177 = fma(_5165, _5167, _5169);
    float _5179 = _5103 * _5155;
    float _5181 = _5103 * _5157;
    float _5183 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5121);
    float _5185 = _5103 * _5145;
    out.m_96.x = _5175;
    out.m_96.y = _5167;
    out.m_96.z = _5173;
    float _5187 = fma(_5165, _5175, _5179);
    float _5189 = fma(_5165, _5173, _5181);
    float _5191 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5183);
    float _5193 = -_5159;
    float _5195 = _5185 * _5193;
    float _5197 = -_5163;
    float _5199 = _5185 * _5197;
    float _5201 = _5039 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5203 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5191);
    bool _5205 = _3968 <= 8000.0;
    bool _5207 = isnan(_3968);
    bool _5209 = _5205 || _5207;
    bool _5211 = isnan(8000.0);
    bool _5213 = _5209 || _5211;
    float _5215 = float(_5213);
    float _5217 = -_3578;
    float _5219 = _5217 + 1.0;
    float _5221 = fma(_5171, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = -_5161;
    float _5227 = _5185 * _5225;
    float _5229 = _4602 * 0.5;
    float _5231 = _5159 + _5187;
    float _5233 = exp2(_5201);
    out.gl_Position.x = _4636;
    out.gl_Position.y = _4638;
    out.gl_Position.z = _5203;
    out.gl_Position.w = _4602;
    float _5235 = fma(_4638, -0.5, _5229);
    float _5237 = _5203 + _4602;
    float _5239 = fma(_5145, _5155, _5195);
    float _5241 = _4636 + _4602;
    float _5243 = fma(_5145, _5143, _5227);
    float _5245 = fma(_5223, -2.0, 3.0);
    float _5247 = _5223 * _5223;
    float _5249 = fma(_5145, _5157, _5199);
    float _5251 = _5237 * 0.5;
    float _5253 = _5247 * _5245;
    float _5255 = _5241 * 0.5;
    if (!_4584)
    {
        _4640 = 1.0;
    }
    float _5257 = _4640;
    float _5259 = -_5233;
    float _5261 = _5259 + 1.0;
    float _5263 = -_5253;
    float _5265 = _5263 + 1.0;
    float _5267 = _5257;
    if (_4584)
    {
        bool _5269 = _4700 >= _4648;
        bool _5271 = isnan(_4700);
        bool _5273 = _5269 || _5271;
        bool _5275 = isnan(_4648);
        bool _5277 = _5273 || _5275;
        float _5279 = float(_5277);
        _5267 = _5279;
    }
    float _5281 = _5267;
    out.m_98.x = _5255;
    out.m_98.y = _5235;
    out.m_98.z = _5251;
    out.m_98.w = _4602;
    float _5283 = _5261 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5285 = fma(_5265, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5253);
    float _5287 = _5161 + _5177;
    float _5289 = _5281 * _4847;
    float _5291 = _5163 + _5189;
    float _5293 = _5215 * _5285;
    float _5295 = _5283 * _4702;
    float _5297 = -_5283;
    float _5299 = _5297 + 1.0;
    out.m_100.x = _5239;
    out.m_100.y = _5243;
    out.m_100.z = _5249;
    float _5301 = _5293 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _5303 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5305 = isnan(_5011);
    bool _5307 = _5303 || _5305;
    bool _5309 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5311 = _5307 || _5309;
    out.m_102.x = _5231;
    out.m_102.y = _5287;
    out.m_102.z = _5291;
    float _5313 = _5219 * _5301;
    float _5315 = precise::clamp(_5313, 0.0, 1.0);
    float _5317 = _4713 * _5295;
    float _5319 = _4713 * _5299;
    float _5321 = -_5315;
    float _5323 = fma(_5321, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5325 = -_5289;
    float _5327 = fma(_5325, _5323, 1.0);
    float _5329 = precise::clamp(_5327, 0.0, 1.0);
    float _5331 = _5299;
    float _5333 = _5301;
    float _5335 = _5329;
    if (!_5311)
    {
        _5331 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5337 = _5331;
    float _5339 = _5329 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5341 = _5337;
    float _5343 = _5337;
    if (!_5311)
    {
        _5333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5345 = _5333;
    float _5347 = _5345;
    float _5349 = _5345;
    if (!_5311)
    {
        _5335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5351 = _5335;
    out.m_104.x = _5339;
    float _5353 = _5095 * _5295;
    float _5355 = fma(_5091, _5317, _4707);
    float _5357 = fma(_5093, _5317, _4709);
    float _5359 = _4783 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5361 = fma(_4713, _5353, _4711);
    out.m_106.x = _5355;
    out.m_106.y = _5357;
    out.m_106.z = _5361;
    out.m_106.w = _5319;
    bool _5363 = !_5311;
    float _5365 = _5351;
    float _5367 = _5351;
    if (!_5363)
    {
        bool _5369 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5371 = isnan(_5011);
        bool _5373 = _5369 || _5371;
        bool _5375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5377 = _5373 || _5375;
        if (!_5377)
        {
            float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5381 = _5011 + _5379;
            float _5383 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5385 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5383;
            float _5387 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5395 = 1.0 / _5385;
            float _5397 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5399 = _5397 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5401 = _5381 * _5395;
            float _5403 = precise::clamp(_5401, 0.0, 1.0);
            float _5405 = fma(_5403, _5389, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5407 = fma(_5403, _5393, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5409 = fma(_5403, _5399, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5349 = _5407;
            _5343 = _5405;
            _5367 = _5409;
            _5411 = true;
        }
        else
        {
            bool _5413 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5415 = isnan(_5011);
            bool _5417 = _5413 || _5415;
            bool _5419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5421 = _5417 || _5419;
            if (!_5421)
            {
                _5341 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5423 = _5341;
            _5343 = _5423;
            if (!_5421)
            {
                _5347 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5425 = _5347;
            _5349 = _5425;
            if (!_5421)
            {
                _5365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5427 = _5365;
            bool _5429 = !_5421;
            _5367 = _5427;
            if (!_5429)
            {
                bool _5431 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5433 = isnan(_5011);
                bool _5435 = _5431 || _5433;
                bool _5437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5439 = _5435 || _5437;
                if (!_5439)
                {
                    float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5443 = _5011 + _5441;
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5445;
                    float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5451 = _5449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5453 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5455 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5457 = 1.0 / _5447;
                    float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5463 = _5443 * _5457;
                    float _5465 = precise::clamp(_5463, 0.0, 1.0);
                    float _5467 = fma(_5465, _5451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5469 = fma(_5465, _5455, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5471 = fma(_5465, _5461, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5349 = _5469;
                    _5343 = _5467;
                    _5367 = _5471;
                    _5411 = true;
                }
                else
                {
                    _5349 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5343 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5411 = false;
    float _5473 = _5349;
    float _5475 = _5343;
    float _5477 = _5367;
    float _5479 = _5359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_108.x = 0.0;
    float _5481 = _5473 * 0.586610972881317138671875;
    bool _5483 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_63.x = _5479;
    float _5485 = fma(_5475, 0.298911988735198974609375, _5481);
    bool _5487 = _4783 > 0.0;
    bool _5489 = isnan(_4783);
    bool _5491 = _5487 || _5489;
    bool _5493 = isnan(0.0);
    bool _5495 = _5491 || _5493;
    float _5497 = fma(_5477, 0.114477999508380889892578125, _5485);
    float _5499 = -_5497;
    float _5501 = _5499 + _5475;
    float _5503 = -_5497;
    float _5505 = _5503 + _5473;
    float _5507 = -_5497;
    float _5509 = _5507 + _5477;
    float _5511 = fma(_5501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    float _5513 = fma(_5505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    float _5515 = fma(_5509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    bool _5517 = !_5483;
    if (!_5517)
    {
        float _5519 = -_4528;
        float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5523 = -_4530;
        float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5527 = -_4532;
        float _5529 = _5527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5531 = _5521 * _5521;
        float _5533 = fma(_5525, _5525, _5531);
        float _5535 = fma(_5529, _5529, _5533);
        float _5537 = sqrt(_5535);
        float _5539 = rsqrt(_5535);
        float _5541 = -_5537;
        float _5543 = _5541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5545 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5547 = precise::clamp(_5545, 0.0, 1.0);
        float _5549 = _5525 * _5539;
        float _5551 = _5521 * _5539;
        float _5553 = abs(_5547);
        float _5555 = log2(_5553);
        float _5557 = _5529 * _5539;
        float _5559 = _5549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5561 = _5287 * _5551;
        float _5563 = -_5551;
        float _5565 = -_5559;
        float _5567 = fma(_5563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5565);
        float _5569 = fma(_5231, _5549, _5561);
        float _5571 = -_5557;
        float _5573 = fma(_5571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5567);
        float _5575 = fma(_5291, _5557, _5569);
        float _5577 = precise::clamp(_5575, 0.0, 1.0);
        float _5579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5581 = _5573 + _5579;
        float _5583 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5585 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5587 = precise::clamp(_5585, 0.0, 1.0);
        float _5589 = exp2(_5583);
        float _5591 = _5589 * _5587;
        float _5593 = _5577 * _5591;
        float _5595 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5597 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5599 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5595;
        out.m_108.y = _5597;
        out.m_108.z = _5599;
    }
    out.m_110.x = _5511;
    out.m_110.y = _5513;
    out.m_110.z = _5515;
    if (_5495)
    {
        return out;
    }
    float _5601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5601;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5411 = false;
    bool _679 = false;
    bool _459 = false;
    bool _271 = false;
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
        float _5669 = as_type<float>(_153);
        out.gl_Position.z = _5669;
    }
    if (!_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _5732 = as_type<float>(_185);
        out.gl_Position.z = _5732;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_219;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = _191 * _197;
    float _233 = _191 * _203;
    float _235 = fma(_189, _195, _231);
    float _237 = _191 * _209;
    float _239 = fma(_189, _201, _233);
    float _241 = fma(_193, _199, _235);
    float _243 = fma(_189, _207, _237);
    float _245 = fma(_193, _205, _239);
    float _247 = fma(_193, _211, _243);
    bool _249 = !_221;
    bool _251 = false;
    float _269;
    if (!_249)
    {
        float _253 = in.m_76.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _179;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _273 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _293;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _289;
    float _317 = 1.0 / _297;
    float _319 = _285 * _311;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = _277 * _315;
    bool _335 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _337 = isnan(_273);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_309;
    float _349 = _347 + 1.0;
    float _351 = _345 * _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = _281 * _317;
    bool _359 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _361 = isnan(_273);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -_345;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _369 * _373;
    float _389 = -_369;
    float _391 = _389 + 1.0;
    float _393 = fma(_377, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_381, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _331 * _391;
    float _399 = -_331;
    float _401 = _399 + 1.0;
    float _403 = fma(_355, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _405 = _393 * _397;
    float _407 = _395 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _423 = fma(_411, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _425 = fma(_403, _387, _415);
    float _427 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_413, _387, _421);
    float _431 = fma(_423, _351, _425);
    float _433 = fma(_427, _351, _429);
    float _435 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _431);
    float _437 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _433);
    bool _439 = !_313;
    float _457;
    if (!_439)
    {
        float _441 = in.m_76.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _179;
    }
    _459 = false;
    float _461 = _457;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _479 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_461);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _469;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _501 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_461);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_489;
    float _515 = _513 + 1.0;
    bool _517 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _519 = isnan(_461);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = 1.0 / _473;
    float _531 = -_511;
    float _533 = _531 + 1.0;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _537 = _489 * _533;
    float _539 = _495 * _491;
    float _541 = 1.0 / _477;
    bool _543 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _545 = isnan(_461);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _557;
    float _561 = -_553;
    float _563 = _561 + 1.0;
    float _565 = _553 * _515;
    float _567 = 1.0 / _499;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = _527 * _563;
    float _575 = -_527;
    float _577 = _575 + 1.0;
    float _579 = _571 * _529;
    float _581 = _555 * _573;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _585 = _461 + _583;
    float _587 = _559 * _541;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _591 = _461 + _589;
    bool _593 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _595 = isnan(_461);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _609 = fma(_579, _585, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _611 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[115].x, _581);
    float _613 = fma(_587, _591, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _615 = -_603;
    float _617 = _615 + 1.0;
    float _619 = _607 * _567;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _623 = _461 + _621;
    float _625 = fma(_609, _565, _611);
    float _627 = _511 * _617;
    float _629 = fma(_619, _623, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _631 = fma(_613, _537, _625);
    float _633 = fma(_629, _627, _631);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _639 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[119].x, _633);
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _639 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = in.m_78.x;
    float _653 = in.m_78.y;
    out.m_80.x = _643;
    out.m_80.y = _645;
    out.m_80.z = _649;
    out.m_80.w = _647;
    float _655 = _437 * _653;
    float _657 = _435 * _651;
    bool _659 = !_535;
    float _677;
    if (!_659)
    {
        float _661 = in.m_76.x;
        float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _665 = _661 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _669 = _667 * _663;
        float _671 = floor(_669);
        float _673 = -_671;
        float _675 = _669 + _673;
        _677 = _675;
        _679 = true;
    }
    else
    {
        _677 = _179;
    }
    _679 = false;
    float _681 = _677;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _685 = _681 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _695;
    bool _699 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _701 = isnan(_681);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = 1.0 / _689;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _721 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _723 = isnan(_681);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    bool _733 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _735 = isnan(_681);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = 1.0 / _693;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _749 = _697 * _711;
    bool _751 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = isnan(_681);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _715;
    float _765 = -_709;
    float _767 = _765 + 1.0;
    float _769 = fma(_749, _685, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _771 = -_761;
    float _773 = _771 + 1.0;
    float _775 = _761 * _767;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _781;
    float _785 = 1.0 / _719;
    float _787 = -_731;
    float _789 = _787 + 1.0;
    float _791 = _743 * _773;
    float _793 = _779 * _745;
    float _795 = -_743;
    float _797 = _795 + 1.0;
    float _799 = _709 * _789;
    float _801 = _769 * _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _805 = _681 + _803;
    float _807 = _783 * _763;
    bool _809 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _811 = isnan(_681);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = _681 + _825;
    float _829 = fma(_793, _805, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[131].x, _801);
    float _833 = -_819;
    float _835 = _833 + 1.0;
    float _837 = fma(_807, _827, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _839 = _823 * _785;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _843 = _681 + _841;
    float _845 = fma(_829, _775, _831);
    float _847 = _731 * _835;
    float _849 = fma(_839, _843, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _851 = fma(_837, _799, _845);
    float _853 = fma(_849, _847, _851);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _861 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[135].x, _853);
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = _861 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_82.x = _863;
    out.m_82.y = _865;
    out.m_82.z = _867;
    out.m_82.w = _869;
    bool _871 = !_747;
    float _873 = _865;
    float _875 = _869;
    if (!_871)
    {
        float _877 = in.m_76.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _881 = _877 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _885 = _883 * _879;
        float _887 = floor(_885);
        float _889 = -_887;
        float _891 = _885 + _889;
        _181 = _891;
    }
    float _893 = _181;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _897 = int(_895);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _901 = _899 != 0;
    float _903 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _905 = int(_903);
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _909 = int(_907);
    float _911 = float(_897);
    float _913 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _915 = int(_913);
    float _917 = float(_905);
    float _919 = 1.0 / _911;
    float _921 = float(_909);
    float _923 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _925 = int(_923);
    float _927 = float(uint(_915));
    float _929 = 1.0 / _917;
    float _931 = _919 * _135;
    float _933 = _919;
    if (_901)
    {
        float _935 = in.m_76.w;
        _933 = _935;
    }
    float _937 = _933;
    float _939 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _941 = int(_939);
    float _943 = float(uint(_925));
    int _945 = ~_925;
    int _947 = _945 + 1;
    float _949 = 1.0 / _921;
    float _951 = _929 * _135;
    float _953 = 1.0 / _927;
    float _955 = float(uint(_941));
    int _957 = ~_941;
    int _959 = _957 + 1;
    float _961 = _937;
    if (_901)
    {
        float _963 = _937 * 3.1415927410125732421875;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = trunc(_931);
    int _969 = int(_967);
    float _971 = _949 * _135;
    if (_901)
    {
        float _973 = _965 * 0.15915493667125701904296875;
        _873 = _973;
    }
    float _975 = _873;
    float _977 = 1.0 / _943;
    int _979 = as_type<int>(_953) + (-2);
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _983 = _981 != 0;
    float _985 = trunc(_951);
    int _987 = int(_985);
    float _989 = float(uint(_969));
    int _991 = ~_915;
    int _993 = _991 + 1;
    float _995 = as_type<float>(_979) * _989;
    float _997 = 1.0 / _955;
    int _999 = as_type<int>(_977) + (-2);
    if (_983)
    {
        _875 = 1.0;
    }
    float _1001 = _875;
    float _1003 = 0.0;
    float _1005 = _1001;
    if (_983)
    {
        _1003 = 1.0;
    }
    float _1007 = _1003;
    float _1009 = trunc(_971);
    int _1011 = int(_1009);
    float _1013 = float(uint(_987));
    int _1015 = 0;
    float _1017 = _1007;
    if (_983)
    {
        _1015 = 0;
    }
    int _1019 = _1015;
    float _1021 = as_type<float>(_999) * _1013;
    int _1023 = as_type<int>(_997) + (-2);
    float _1025 = trunc(_995);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_1011));
    float _1034 = trunc(_1021);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = as_type<float>(_1023) * _1032;
    float _1042 = trunc(_1040);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    int _1048 = _993 * int(_1030);
    int _1050 = _1048 + _969;
    float _1052 = float(uint(_1050));
    float _1054 = _975;
    int _1056 = _1019;
    if (_901)
    {
        float _1058 = _975 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        _1054 = _1060;
    }
    float _1062 = _1054;
    float _1064 = _965;
    float _1066 = _1040;
    if (_983)
    {
        float _1068 = in.m_76.x;
        float _1070 = in.m_76.y;
        _1064 = _1068;
        _1066 = _1070;
    }
    float _1072 = _1064;
    float _1074 = _1066;
    int _1076 = _947 * int(_1038);
    int _1078 = _1076 + _987;
    float _1080 = as_type<float>(_979) * _1052;
    float _1082 = in.m_76.z;
    float _1084 = in.m_76.w;
    float _1086 = float(uint(_1078));
    int _1088 = _959 * int(_1046);
    int _1090 = _1088 + _1011;
    float _1092 = trunc(_1080);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    float _1098 = as_type<float>(_999) * _1086;
    float _1100 = float(uint(_1090));
    float _1102 = as_type<float>(_1023) * _1100;
    float _1104 = trunc(_1098);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = as_type<int>(_1100);
    float _1112 = _1086;
    float _1114 = _1080;
    if (_983)
    {
        _1110 = 0;
    }
    int _1116 = _1110;
    float _1118 = _1072;
    float _1120 = _1074;
    int _1122 = _1116;
    if (_983)
    {
        _1112 = _1072;
    }
    float _1124 = _1112;
    float _1126 = trunc(_1102);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = 0.0;
    float _1134 = _1124;
    if (_983)
    {
        _1132 = _1074;
    }
    float _1136 = _1132;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (_983)
    {
        _1138 = _1124;
    }
    float _1142 = _1138;
    float _1144 = _1142;
    if (_983)
    {
        _1114 = _1124;
    }
    float _1146 = _1114;
    float _1148 = _1146;
    if (!_983)
    {
        float _1150 = in.m_76.x;
        float _1152 = in.m_76.y;
        float _1154 = in.m_76.z;
        float _1156 = _1150 * 3.1415927410125732421875;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1152 * 3.1415927410125732421875;
        float _1162 = _1160 * 0.15915493667125701904296875;
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        _1017 = 5.839270114898681640625;
        _1148 = _1154;
        _1005 = 7.345489978790283203125;
        _1118 = _1150;
        _1120 = _1152;
        _1134 = _1152;
        _1122 = 1;
        _1144 = _1166;
        _1056 = 2;
        _1140 = _1170;
    }
    float _1172 = _1017;
    float _1174 = _1148;
    float _1176 = _1005;
    float _1178 = _1118;
    float _1180 = _1120;
    float _1182 = _1134;
    int _1184 = _1122;
    float _1186 = _1144;
    int _1188 = _1056;
    float _1190 = _1140;
    float _1192 = _1172 * _1174;
    int _1194 = ~_915;
    int _1196 = _1194 + 1;
    float _1198 = _1176 * _1178;
    int _1200 = int(_1030) + int(_1096);
    float _1202 = in.m_70.w;
    int _1204 = ~_941;
    int _1206 = _1204 + 1;
    float _1208 = floor(_1198);
    int _1210 = int(_1046) + int(_1130);
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1214 = _893 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1218 = _893 + _1216;
    int _1220 = ~_925;
    int _1222 = _1220 + 1;
    int _1224 = _1196 * _1200;
    int _1226 = _1224 + _969;
    float _1228 = floor(_1192);
    int _1230 = int(_1038) + int(_1108);
    int _1232 = _1206 * _1210;
    int _1234 = _1232 + _1011;
    bool _1236 = uint(_1226) >= uint(_915);
    bool _1238 = uint(_1234) >= uint(_941);
    int _1240 = _1222 * _1230;
    int _1242 = _1240 + _987;
    bool _1244 = !_1236;
    int _1246 = _1244 ? 0 : (-1);
    float _1248 = -_1208;
    float _1250 = _1198 + _1248;
    bool _1252 = _1084 > 0.5;
    bool _1254 = !_1238;
    int _1256 = _1254 ? 0 : (-1);
    int _1258 = ~_1200;
    int _1260 = _1258 + _1246;
    int _1262 = _1260 + 1;
    float _1264 = -_1228;
    float _1266 = _1192 + _1264;
    float _1268 = _1202;
    if (_901)
    {
        bool _1270 = _1062 > 0.5;
        _251 = _1270;
    }
    bool _1272 = _251;
    bool _1274 = _1082 > 0.5;
    int _1276 = _915 * _1262;
    int _1278 = _1276 + _969;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1282 = _1280 != 0;
    float _1284 = -_229;
    int _1286 = _1252 ? as_type<int>(_1284) : as_type<int>(_229);
    bool _1288 = uint(_1242) >= uint(_925);
    float _1290 = float(_915);
    bool _1292 = _1180 > 0.5;
    float _1294 = 0.0;
    if (!_901)
    {
        _1294 = _225;
    }
    float _1296 = _1294;
    float _1298 = _1250 * _1290;
    float _1300 = -_229;
    int _1302 = _1274 ? as_type<int>(_1300) : as_type<int>(_229);
    bool _1304 = !_1282;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = _1296;
    if (_901)
    {
        float _1310 = -_225;
        float _1312 = _1272 ? _1310 : _225;
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = trunc(_1298);
    int _1318 = int(_1316);
    float _1320 = float(_969);
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1332 = _1330 != 0;
    float _1334 = -_225;
    int _1336 = _1292 ? as_type<int>(_1334) : as_type<int>(_225);
    float _1338 = float(_941);
    bool _1340 = _1320 >= _1290;
    bool _1342 = isnan(_1320);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(_1290);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    bool _1352 = !_1332;
    float _1354 = _1352 ? _229 : as_type<float>(_1302);
    bool _1356 = !_1328;
    float _1358 = _1356 ? _225 : as_type<float>(_1336);
    float _1360 = trunc(_1350);
    int _1362 = int(_1360);
    float _1364 = float(_1011);
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1372 = _1370 != 0;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1380 = _1378 != 0;
    bool _1382 = _1364 >= _1338;
    bool _1384 = isnan(_1364);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(_1338);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1266 * _1338;
    bool _1396 = !_1372;
    int _1398 = _1396 ? 0 : 1;
    bool _1400 = !_1368;
    int _1402 = _1400 ? 0 : 1;
    float _1404 = trunc(_1392);
    int _1406 = int(_1404);
    bool _1408 = !_1376;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1414 = _1412 != 0;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1418 = _1416 != 0;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1380;
    int _1426 = _1424 ? 0 : 1;
    int _1428 = ~_1210;
    int _1430 = _1428 + _1256;
    int _1432 = _1430 + 1;
    float _1434 = trunc(_1394);
    int _1436 = int(_1434);
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1440 = _1438 != 0;
    bool _1442 = !_1418;
    int _1444 = _1442 ? 0 : 1;
    int _1446 = _941 * _1432;
    int _1448 = _1446 + _1011;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1452 = _1450 != 0;
    int _1454 = abs(_1306);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1458 = _1456 != 0;
    bool _1460 = !_1324;
    float _1462 = _1460 ? _229 : as_type<float>(_1286);
    int _1464 = _1318 * _1454;
    int _1466 = _1464 + _969;
    bool _1468 = !_1440;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = _175 * _135;
    bool _1474 = !_1452;
    int _1476 = _1474 ? 0 : 1;
    bool _1478 = !_1288;
    int _1480 = _1478 ? 0 : (-1);
    float _1482 = _1290 * _1472;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1486 = _1484 != 0;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1498 = _1496 != 0;
    float _1500 = _1338 * _1472;
    bool _1502 = !_1414;
    int _1504 = _1502 ? 0 : 1;
    float _1506 = trunc(_1482);
    int _1508 = int(_1506);
    bool _1510 = _915 == 0;
    int _1512 = abs(_1470);
    bool _1514 = !_1490;
    int _1516 = _1514 ? 0 : 1;
    bool _1518 = _941 == 0;
    int _1520 = _1436 * _1512;
    int _1522 = _1520 + _1011;
    int _1524 = ~_1362;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    float _1530 = trunc(_1500);
    int _1532 = int(_1530);
    bool _1534 = !_1510;
    int _1536 = _1534 ? _1278 : (-1);
    int _1538 = ~_1406;
    int _1540 = _1538 + 1;
    int _1542 = _1540 + 1;
    bool _1544 = !_1518;
    int _1546 = _1544 ? _1448 : (-1);
    int _1548 = _1536 * _1528;
    int _1550 = _915 + (-1);
    int _1552 = abs(_1398);
    int _1554 = _1546 * _1542;
    int _1556 = _941 + (-1);
    int _1558 = _1362 * _1550;
    int _1560 = _1558 + _1548;
    int _1562 = abs(_1402);
    int _1564 = _1406 * _1556;
    int _1566 = _1564 + _1554;
    int _1568 = abs(_1410);
    int _1570 = _1560 * _1552;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1574 = _893 + _1572;
    int _1576 = abs(_1444);
    int _1578 = _1508 * _1562;
    int _1580 = _1578 + _1570;
    int _1582 = abs(_1426);
    bool _1584 = !_1422;
    int _1586 = _1584 ? 0 : 1;
    int _1588 = _1466 * _1568;
    int _1590 = _1588 + _1580;
    int _1592 = abs(_1504);
    int _1594 = _1318 * _1582;
    int _1596 = _1594 + _1590;
    int _1598 = abs(_1586);
    int _1600 = _1566 * _1576;
    float _1602 = float(uint(_1596));
    int _1604 = abs(_1476);
    int _1606 = _1532 * _1592;
    int _1608 = _1606 + _1600;
    float _1610 = float(_925);
    float _1612 = as_type<float>(_979) * _1602;
    float _1614 = float(_987);
    int _1616 = _1522 * _1598;
    int _1618 = _1616 + _1608;
    int _1620 = ~_915;
    int _1622 = _1620 + 1;
    bool _1624 = _1614 >= _1610;
    bool _1626 = isnan(_1614);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(_1610);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    int _1636 = _1436 * _1604;
    int _1638 = _1636 + _1618;
    float _1640 = trunc(_1612);
    float _1642 = precise::max(_1640, 0.0);
    uint _1644 = uint(_1642);
    float _1646 = _1176 * _1182;
    float _1648 = _1610 * _1472;
    int _1650 = ~_1230;
    int _1652 = _1650 + _1480;
    int _1654 = _1652 + 1;
    float _1656 = float(uint(_1638));
    int _1658 = ~_941;
    int _1660 = _1658 + 1;
    float _1662 = floor(_1646);
    int _1664 = _925 * _1654;
    int _1666 = _1664 + _987;
    float _1668 = as_type<float>(_1023) * _1656;
    bool _1670 = !_1458;
    int _1672 = _1670 ? 0 : 1;
    int _1674 = abs(_1516);
    int _1676 = abs(_1672);
    float _1678 = trunc(_1668);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    int _1684 = _1622 * int(_1644);
    int _1686 = _1684 + _1596;
    bool _1688 = _1082 > 0.5;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1692 = _1690 != 0;
    float _1694 = float(uint(_1686));
    float _1696 = trunc(_1634);
    int _1698 = int(_1696);
    bool _1700 = !_1486;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = -_1662;
    float _1706 = _1646 + _1704;
    bool _1708 = _925 == 0;
    float _1710 = as_type<float>(_979) * _1694;
    int _1712 = abs(_1702);
    float _1714 = _1706 * _1610;
    bool _1716 = !_1708;
    int _1718 = _1716 ? _1666 : (-1);
    int _1720 = _1660 * int(_1682);
    int _1722 = _1720 + _1638;
    float _1724 = trunc(_1710);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    int _1730 = _925 + (-1);
    float _1732 = float(uint(_1722));
    int _1734 = ~_1698;
    int _1736 = _1734 + 1;
    int _1738 = _1736 + 1;
    float _1740 = trunc(_1648);
    int _1742 = int(_1740);
    float _1744 = as_type<float>(_1023) * _1732;
    int _1746 = _1718 * _1738;
    bool _1748 = !_1494;
    int _1750 = _1748 ? 0 : 1;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1758 = _1756 != 0;
    float _1760 = trunc(_1714);
    int _1762 = int(_1760);
    int _1764 = _1698 * _1730;
    int _1766 = _1764 + _1746;
    int _1768 = ~_915;
    int _1770 = _1768 + 1;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1776 = int(_1644) + int(_1728);
    int _1778 = _1766 * _1674;
    int _1780 = abs(_1750);
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1786 = trunc(_1744);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    int _1792 = _1742 * _1712;
    int _1794 = _1792 + _1778;
    int _1796 = ~_941;
    int _1798 = _1796 + 1;
    int _1800 = _1770 * _1776;
    int _1802 = _1800 + _1596;
    float _1804 = as_type<float>(_1750);
    float _1806 = as_type<float>(_1568);
    float _1808 = _1574;
    float _1810 = _1314;
    if (_1758)
    {
        float _1812 = in.m_76.x;
        _1804 = _1812;
    }
    float _1814 = _1804;
    if (!_1758)
    {
        _1806 = _229;
    }
    float _1816 = _1806;
    int _1818 = _1762 * _1676;
    int _1820 = _1818 + _987;
    bool _1822 = !_1498;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = 1.0 / _1754;
    bool _1828 = uint(_1802) >= uint(_915);
    int _1830 = _1820 * _1780;
    int _1832 = _1830 + _1794;
    int _1834 = abs(_1824);
    bool _1836 = !_1828;
    int _1838 = _1836 ? 0 : (-1);
    int _1840 = int(_1682) + int(_1790);
    float _1842 = 1.0 / _1774;
    float _1844 = float(uint(_1466));
    int _1846 = _1798 * _1840;
    int _1848 = _1846 + _1638;
    int _1850 = ~_1776;
    int _1852 = _1850 + _1838;
    int _1854 = _1852 + 1;
    int _1856 = _1762 * _1834;
    int _1858 = _1856 + _1832;
    float _1860 = float(uint(_1522));
    float _1862 = as_type<float>(_979) * _1844;
    float _1864 = -_225;
    int _1866 = _1688 ? as_type<int>(_1864) : as_type<int>(_225);
    int _1868 = _915 * _1854;
    int _1870 = _1868 + _1596;
    bool _1872 = uint(_1848) >= uint(_941);
    float _1874 = trunc(_1862);
    float _1876 = precise::max(_1874, 0.0);
    uint _1878 = uint(_1876);
    float _1880 = as_type<float>(_1023) * _1860;
    int _1882 = ~_915;
    int _1884 = _1882 + 1;
    bool _1886 = !_1510;
    int _1888 = _1886 ? _1870 : (-1);
    float _1890 = as_type<float>(_1870);
    float _1892 = _1816;
    if (_1758)
    {
        float _1894 = _1814 * 3.1415927410125732421875;
        _1890 = _1894;
    }
    float _1896 = _1890;
    bool _1898 = !_1692;
    float _1900 = _1898 ? _225 : as_type<float>(_1866);
    float _1902 = trunc(_1880);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1888 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = _1896;
    if (_1758)
    {
        float _1914 = _1896 * 0.15915493667125701904296875;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = float(uint(_1858));
    int _1920 = _1910 ? 0 : 1;
    int _1922 = _1888 & 3;
    bool _1924 = _1922 != 0;
    int _1926 = _1884 * int(_1878);
    int _1928 = _1926 + _1466;
    float _1930 = as_type<float>(_999) * _1918;
    float _1932 = _1916;
    if (_1758)
    {
        float _1934 = _1916 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1932 = _1936;
    }
    float _1938 = _1932;
    bool _1940 = !_1872;
    int _1942 = _1940 ? 0 : (-1);
    bool _1944 = uint(_1922) > 1u;
    float _1946 = float(uint(_1928));
    int _1948 = ~_941;
    int _1950 = _1948 + 1;
    float _1952 = trunc(_1930);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = ~_1840;
    int _1960 = _1958 + _1942;
    int _1962 = _1960 + 1;
    float _1964 = as_type<float>(_979) * _1946;
    int _1966 = ~_1920;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1950 * int(_1906);
    int _1974 = _1972 + _1522;
    int _1976 = ~_925;
    int _1978 = _1976 + 1;
    bool _1980 = _1180 > 0.5;
    float _1982 = trunc(_1964);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    float _1988 = float(uint(_1974));
    int _1990 = _1970;
    bool _1992 = _1944;
    if (!_1944)
    {
        int _1994 = ~_1920;
        int _1996 = _1994 + 1;
        _1990 = _1996;
    }
    int _1998 = _1990;
    if (_1758)
    {
        bool _2000 = _1938 > 0.5;
        _1992 = _2000;
    }
    bool _2002 = _1992;
    float _2004 = as_type<float>(_1023) * _1988;
    int _2006 = _941 * _1962;
    int _2008 = _2006 + _1638;
    int _2010 = _1978 * int(_1956);
    int _2012 = _2010 + _1858;
    if (_1758)
    {
        float _2014 = -_229;
        float _2016 = _2002 ? _2014 : _229;
        _1892 = _2016;
    }
    float _2018 = _1892;
    float _2020 = trunc(_2004);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    bool _2026 = _1922 != 3;
    bool _2028 = uint(_1922) >= 2u;
    float _2030 = float(uint(_2012));
    bool _2032 = !_1518;
    int _2034 = _2032 ? _2008 : (-1);
    float _2036 = 1.0 / _1784;
    int _2038 = _2028 ? 0 : 1;
    int _2040 = int(_1878) + int(_1986);
    float _2042 = as_type<float>(_999) * _2030;
    float _2044 = -_229;
    int _2046 = _1980 ? as_type<int>(_2044) : as_type<int>(_229);
    int _2048 = _2034 & 3;
    bool _2050 = _2048 != 0;
    int _2052 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2054 = _2052 != 0;
    float _2056 = trunc(_2042);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    int _2062 = ~_2038;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    int _2068 = _2066;
    if (_2026)
    {
        int _2070 = ~_2038;
        int _2072 = _2070 + 1;
        _2068 = _2072;
    }
    int _2074 = _2068;
    bool _2076 = uint(_2048) > 1u;
    bool _2078 = !_2054;
    float _2080 = _2078 ? _229 : as_type<float>(_2046);
    int _2082 = ~_915;
    int _2084 = _2082 + 1;
    int _2086 = _2034 & 3;
    bool _2088 = _2086 != 0;
    int _2090 = int(_1906) + int(_2024);
    int _2092 = _2084 * _2040;
    int _2094 = _2092 + _1466;
    int _2096 = _2088 ? 0 : 1;
    int _2098 = ~_941;
    int _2100 = _2098 + 1;
    int _2102 = ~_2096;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2106;
    if (!_2076)
    {
        int _2110 = ~_2096;
        int _2112 = _2110 + 1;
        _2108 = _2112;
    }
    int _2114 = _2108;
    int _2116 = _2100 * _2090;
    int _2118 = _2116 + _1522;
    bool _2120 = uint(_2094) >= uint(_915);
    int _2122 = int(_1956) + int(_2060);
    bool _2124 = !_2120;
    int _2126 = _2124 ? 0 : (-1);
    bool _2128 = uint(_2118) >= uint(_941);
    float _2130 = in.m_56.x;
    float _2132 = in.m_56.y;
    float _2134 = in.m_56.z;
    bool _2136 = _2048 != 3;
    bool _2138 = !_1924;
    int _2140 = _2138 ? 0 : 1;
    bool _2142 = uint(_2048) >= 2u;
    int _2144 = _2142 ? 0 : 1;
    int _2146 = ~_925;
    int _2148 = _2146 + 1;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2152 = _2150 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2154 = ~_2144;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    int _2160 = _2158;
    if (_2136)
    {
        int _2162 = ~_2144;
        int _2164 = _2162 + 1;
        _2160 = _2164;
    }
    int _2166 = _2160;
    int _2168 = _2148 * _2122;
    int _2170 = _2168 + _1858;
    float _2172 = 1.0 / _2152;
    bool _2174 = _2048 != 3;
    bool _2176 = !_2050;
    int _2178 = _2176 ? 0 : 1;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2184 = uint(_2170) >= uint(_925);
    float _2186 = _197 * _2132;
    float _2188 = _203 * _2132;
    float _2190 = _209 * _2132;
    float _2192 = fma(_195, _2130, _2186);
    float _2194 = fma(_201, _2130, _2188);
    float _2196 = fma(_207, _2130, _2190);
    float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2204 = _2202 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2206 = fma(_199, _2134, _2192);
    float _2208 = fma(_211, _2134, _2196);
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2212 = _2210 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2214 = fma(_205, _2134, _2194);
    float _2216 = 1.0 / _2204;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2222 = _2200 * _1826;
    float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2230 = _2228 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2232 = _2220 * _1842;
    bool _2234 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2236 = isnan(_893);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2242 = _2238 || _2240;
    float _2244 = float(_2242);
    float _2246 = 1.0 / _2212;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2248;
    float _2252 = _2230 * _2036;
    bool _2254 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2256 = isnan(_893);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = -_2244;
    float _2268 = _2266 + 1.0;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2274 = _2206 + _1202;
    float _2276 = 1.0 / _2182;
    float _2278 = _2250 * _2216;
    bool _2280 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2282 = isnan(_893);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = -_2264;
    float _2294 = _2292 + 1.0;
    float _2296 = _2264 * _2268;
    bool _2298 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2300 = isnan(_893);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2306 = _2302 || _2304;
    float _2308 = float(_2306);
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2310;
    bool _2314 = !_2174;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = _2272 * _2246;
    float _2320 = _2290 * _2294;
    float _2322 = -_2290;
    float _2324 = _2322 + 1.0;
    bool _2326 = !_2128;
    int _2328 = _2326 ? 0 : (-1);
    float _2330 = _2312 * _2172;
    int _2332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2334 = _2332 != 0;
    float _2336 = _2308 * _2324;
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2340 = _2338 != 0;
    float _2342 = _2226 * _2276;
    int _2344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2346 = _2344 != 0;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2350 = _893 + _2348;
    bool _2352 = !_2184;
    int _2354 = _2352 ? 0 : (-1);
    float _2356 = -_2308;
    float _2358 = _2356 + 1.0;
    bool _2360 = _1178 > 0.5;
    float _2362 = fma(_2222, _2350, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2364 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2366 = isnan(_893);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2372 = _2368 || _2370;
    float _2374 = float(_2372);
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2378 = _893 + _2376;
    float _2380 = fma(_2342, _1574, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2382 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2384 = isnan(_893);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = _2374 * _2358;
    float _2396 = -_225;
    int _2398 = _2360 ? as_type<int>(_2396) : as_type<int>(_225);
    float _2400 = -_2374;
    float _2402 = _2400 + 1.0;
    int _2404 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2406 = _2404 != 0;
    float _2408 = -_2392;
    float _2410 = _2408 + 1.0;
    bool _2412 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2414 = isnan(_893);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2392 * _2402;
    float _2426 = fma(_2232, _2378, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2428 = _893 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2430 = isnan(_893);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = in.m_72.w;
    float _2442 = _2422 * _2410;
    float _2444 = -_2422;
    float _2446 = _2444 + 1.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2450 = _893 + _2448;
    float _2452 = in.m_74.w;
    float _2454 = fma(_2252, _1214, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2456 = _2438 * _2446;
    float _2458 = fma(_2278, _2450, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2460 = fma(_2330, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2462 = _2362 * _2456;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2466 = _893 + _2464;
    bool _2468 = !_2406;
    float _2470 = _2468 ? _225 : as_type<float>(_2398);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2474 = _1184 != 1;
    float _2476 = -_2438;
    float _2478 = _2476 + 1.0;
    float _2480 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2482 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2462);
    float _2484 = fma(_2318, _2466, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2488 = _2018 + (-0.5);
    float _2490 = fma(_2426, _2442, _2482);
    float _2492 = _2214 + _2440;
    float _2494 = -_2486;
    float _2496 = fma(_2480, 2.0, _2494);
    float _2498 = _2482;
    float _2500 = _2462;
    float _2502 = _2442;
    if (!_2474)
    {
        _1268 = _1180;
    }
    float _2504 = _1268;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2508 = _2504;
    if (!_2474)
    {
        _1808 = _1180;
    }
    float _2510 = _1808;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2514 = _2510;
    if (!_2474)
    {
        _2498 = _1082;
    }
    float _2516 = _2498;
    float _2518 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2520 = _2516;
    if (!_2474)
    {
        _2500 = _1082;
    }
    float _2522 = _2500;
    float _2524 = _2208 + _2452;
    float _2526 = _2522;
    float _2528 = _2452;
    if (_2474)
    {
        _2508 = _1178;
    }
    float _2530 = _2508;
    float _2532 = -_135;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2496);
    if (_2474)
    {
        _2514 = _1178;
    }
    float _2536 = _2514;
    if (_2474)
    {
        _2520 = _1180;
    }
    float _2538 = _2520;
    float _2540 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2474)
    {
        _2526 = _1180;
    }
    float _2542 = _2526;
    bool _2544 = _1188 != 2;
    float _2546 = fma(_2380, _2424, _2490);
    float _2548 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2550 = fma(_2548, -2.0, _2472);
    float _2552 = fma(_2454, _2394, _2546);
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2560 = _2492 + _2558;
    float _2562 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2554);
    float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2566 = _2274 + _2564;
    float _2568 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2556);
    float _2570 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2574 = -_2512;
    float _2576 = fma(_2518, 2.0, _2574);
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2580 = _2524 + _2578;
    float _2582 = fma(_2570, -2.0, _2506);
    float _2584 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2572);
    if (_2544)
    {
        _2528 = _1180;
    }
    float _2586 = _2528;
    float _2588 = fma(_2458, _2336, _2552);
    float _2590 = _2586;
    if (_2544)
    {
        _2502 = _1178;
    }
    float _2592 = _2502;
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2584);
    float _2596 = _2592;
    if (!_2544)
    {
        _2596 = _1082;
    }
    float _2598 = _2596;
    float _2600 = -_135;
    float _2602 = fma(_2600, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2576);
    if (!_2544)
    {
        _2590 = _1178;
    }
    float _2604 = _2590;
    float _2606 = _1314 + 0.5;
    bool _2608 = _2594 >= 0.0;
    float _2610 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2612 = fma(_2606, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2602);
    float _2614 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2582);
    float _2616 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2610);
    int _2618 = _2034 >> 31;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2622 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2550);
    float _2624 = -_2488;
    float _2626 = -_2614;
    float _2628 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2626);
    int _2630 = _2618 & 3;
    float _2632 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2620);
    float _2634 = _2080 + (-0.5);
    float _2636 = fma(_2484, _2320, _2588);
    int _2638 = _2034 + _2630;
    float _2640 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2642 = float(uint(_1820));
    float _2644 = -_2634;
    float _2646 = -_2622;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2646);
    int _2650 = _2638 >> 2;
    float _2652 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2654 = as_type<float>(_999) * _2642;
    int _2656 = _2650 << 4;
    int _2658 = _2656 + 656;
    float _2660 = fma(_2460, _2296, _2636);
    float _2662 = _2470 + 0.5;
    float _2664 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2666 = uint(int(uint(_2658) >> uint(2)));
    uint _2668 = uint(int(uint(int(_2666)) >> uint(2)));
    int _2670 = int(_2666) & 3;
    float _2672 = (*spvDescriptorSet0.vp_c9)._m0[int(_2668)][_2670];
    int _2674 = int(_2666) + 1;
    uint _2676 = uint(int(uint(_2674) >> uint(2)));
    int _2678 = _2674 & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    float _2682 = trunc(_2654);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = -_2664;
    float _2690 = fma(_2652, 2.0, _2688);
    float _2692 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2568);
    float _2694 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2534);
    int _2696 = ~_925;
    int _2698 = _2696 + 1;
    float _2700 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2702 = _2658 + 8;
    uint _2704 = uint(int(uint(_2702) >> uint(2)));
    uint _2706 = uint(int(uint(int(_2704)) >> uint(2)));
    int _2708 = int(_2704) & 3;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[int(_2706)][_2708];
    int _2712 = int(_2704) + 1;
    uint _2714 = uint(int(uint(_2712) >> uint(2)));
    int _2716 = _2712 & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    float _2720 = _2604 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2724 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2562);
    float _2726 = fma(_2720, -2.0, _2700);
    int _2728 = abs(_2114);
    float _2730 = -_135;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2690);
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2736 = _2698 * int(_2686);
    int _2738 = _2736 + _1820;
    int _2740 = ~_2122;
    int _2742 = _2740 + _2354;
    int _2744 = _2742 + 1;
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2748 = -_2734;
    float _2750 = fma(_2540, 2.0, _2748);
    float _2752 = -_2692;
    float _2754 = _2752 + 1.0;
    float _2756 = float(uint(_2738));
    float _2758 = -_2724;
    float _2760 = _2758 + 1.0;
    float _2762 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2660);
    int _2764 = abs(_2178);
    int _2766 = _925 * _2744;
    int _2768 = _2766 + _1858;
    float _2770 = -_2760;
    float _2772 = fma(_2770, _1314, _2612);
    if (_2608)
    {
        _1810 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2774 = _1810;
    float _2776 = as_type<float>(_999) * _2756;
    float _2778 = fma(_2754, _2018, _2628);
    float _2780 = _2722 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2782 = as_type<int>(_2722);
    if (_2608)
    {
        float _2784 = _2774 * 5.0;
        _2782 = as_type<int>(_2784);
    }
    int _2786 = _2782;
    out.m_84.x = _2772;
    out.m_84.y = _2778;
    float _2788 = trunc(_2776);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    int _2794 = ~_2090;
    int _2796 = _2794 + _2328;
    int _2798 = _2796 + 1;
    float _2800 = _1900 + 0.5;
    if (_2608)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9577 = as_type<float>(_2786);
        out.gl_Position.z = _9577;
    }
    int _2802 = ~_925;
    int _2804 = _2802 + 1;
    float _2806 = -_135;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2750);
    int _2810 = _941 * _2798;
    int _2812 = _2810 + _1522;
    int _2814 = abs(_1998);
    float _2816 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2818 = abs(_2166);
    float _2820 = fma(_2780, _2800, _2808);
    int _2822 = abs(_2316);
    float _2824 = _1462 + (-0.5);
    int _2826 = ~_2814;
    int _2828 = _2826 + 1;
    int _2830 = _2828 + 1;
    float _2832 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2616);
    int _2834 = ~_2728;
    int _2836 = _2834 + 1;
    int _2838 = _2836 + 1;
    float _2840 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2842 = int(_2840);
    float _2844 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2632);
    int _2846 = int(_2686) + int(_2792);
    int _2848 = _2838 * as_type<int>(_2680);
    int _2850 = ~_2764;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = -_2844;
    float _2858 = _2856 + 1.0;
    int _2860 = _1888 >> 31;
    int _2862 = _2804 * _2846;
    int _2864 = _2862 + _1820;
    int _2866 = _2854 * as_type<int>(_2672);
    int _2868 = _2866 + _2848;
    int _2870 = _2860 & 3;
    out.m_86.x = _2762;
    int _2872 = ~_2818;
    int _2874 = _2872 + 1;
    int _2876 = _2874 + 1;
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2880 = _1888 + _2870;
    int _2882 = as_type<int>(_2858);
    if (_2608)
    {
        out.m_63.x = 0.0;
    }
    int _2884 = ~_2822;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    int _2890 = _2876 * as_type<int>(_2710);
    int _2892 = _2890 + _2868;
    bool _2894 = !_1708;
    int _2896 = _2894 ? _2768 : (-1);
    float _2898 = fma(_2640, -2.0, _2878);
    bool _2900 = !_2340;
    int _2902 = _2900 ? 0 : 1;
    int _2904 = _2888 * as_type<int>(_2718);
    int _2906 = _2904 + _2892;
    int _2908 = _2896 >> 31;
    float _2910 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2898);
    float _2912 = float(uint(_2842));
    int _2914 = _2908 & 3;
    float _2916 = -_2816;
    float _2918 = -_2910;
    float _2920 = fma(_2916, _2824, _2918);
    int _2922 = abs(_2902);
    float _2924 = 1.0 / _2912;
    int _2926 = abs(_2842);
    float _2928 = fma(_1462, _2858, _2920);
    int _2930 = _2896 + _2914;
    int _2932 = _2880 >> 2;
    float _2934 = float(uint(_2926));
    int _2936 = ~_2922;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    int _2942 = _2930 >> 2;
    float _2944 = 1.0 / _2934;
    int _2946 = _2932 << 4;
    int _2948 = _2946 + 368;
    int _2950 = _2906 * _2940;
    bool _2952 = _1922 != 3;
    bool _2954 = !_1518;
    int _2956 = _2954 ? _2812 : (-1);
    uint _2958 = uint(int(uint(_2948) >> uint(2)));
    uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
    int _2962 = int(_2958) & 3;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[int(_2960)][_2962];
    int _2966 = int(_2958) + 1;
    uint _2968 = uint(int(uint(_2966) >> uint(2)));
    int _2970 = _2966 & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = _2942 << 4;
    int _2976 = _2974 + 800;
    int _2978 = _2896 & 3;
    bool _2980 = _2978 != 0;
    int _2982 = _2956 * _2922;
    int _2984 = _2982 + _2950;
    bool _2986 = !_2952;
    int _2988 = _2986 ? 0 : (-1);
    bool _2990 = uint(_2864) >= uint(_925);
    uint _2992 = uint(int(uint(_2976) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c9)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[int(_3002)][_3004];
    bool _3008 = !_2980;
    int _3010 = _3008 ? 0 : 1;
    int _3012 = _2896 & 3;
    bool _3014 = _3012 != 0;
    int _3016 = as_type<int>(_2924) + (-2);
    int _3018 = _3014 ? 0 : 1;
    int _3020 = _2976 + 8;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    uint _3024 = uint(int(uint(int(_3022)) >> uint(2)));
    int _3026 = int(_3022) & 3;
    float _3028 = (*spvDescriptorSet0.vp_c9)._m0[int(_3024)][_3026];
    int _3030 = int(_3022) + 1;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    int _3034 = _3030 & 3;
    float _3036 = (*spvDescriptorSet0.vp_c9)._m0[int(_3032)][_3034];
    float _3038 = float(uint(_2984));
    bool _3040 = uint(_2978) >= 2u;
    int _3042 = ~_2040;
    int _3044 = _3042 + _2126;
    int _3046 = _3044 + 1;
    float _3048 = as_type<float>(_3016) * _3038;
    int _3050 = abs(_2984);
    int _3052 = _2948 + 8;
    uint _3054 = uint(int(uint(_3052) >> uint(2)));
    uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
    int _3058 = int(_3054) & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = int(_3054) + 1;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    int _3066 = _3062 & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = _3040 ? 0 : 1;
    int _3072 = _915 * _3046;
    int _3074 = _3072 + _1466;
    bool _3076 = uint(_2978) > 1u;
    float _3078 = trunc(_3048);
    float _3080 = precise::max(_3078, 0.0);
    uint _3082 = uint(_3080);
    int _3084 = as_type<int>(_2944) + (-2);
    float _3086 = float(uint(_3050));
    bool _3088 = !_2990;
    int _3090 = _3088 ? 0 : (-1);
    bool _3092 = _2978 != 3;
    float _3094 = as_type<float>(_3084) * _3086;
    int _3096 = ~_2846;
    int _3098 = _3096 + _3090;
    int _3100 = _3098 + 1;
    int _3102 = ~_3018;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = trunc(_3094);
    float _3110 = precise::max(_3108, 0.0);
    uint _3112 = uint(_3110);
    int _3114 = _3106;
    if (!_3076)
    {
        int _3116 = ~_3018;
        int _3118 = _3116 + 1;
        _3114 = _3118;
    }
    int _3120 = _3114;
    int _3122 = _925 * _3100;
    int _3124 = _3122 + _1820;
    int _3126 = ~_2842;
    int _3128 = _3126 + 1;
    bool _3130 = _2978 != 3;
    int _3132 = _2830 * as_type<int>(_2972);
    int _3134 = ~_3070;
    int _3136 = _3134 + 1;
    int _3138 = _3136 + 1;
    int _3140 = _3138;
    if (_3092)
    {
        int _3142 = ~_3070;
        int _3144 = _3142 + 1;
        _3140 = _3144;
    }
    int _3146 = _3140;
    int _3148 = abs(_2140);
    int _3150 = _3128 * int(_3082);
    int _3152 = _3150 + _2984;
    int _3154 = ~_2926;
    int _3156 = _3154 + 1;
    int _3158 = abs(_3120);
    float _3160 = float(uint(_3152));
    int _3162 = _3156 * int(_3112);
    int _3164 = _3162 + _3050;
    int _3166 = ~_3158;
    int _3168 = _3166 + 1;
    int _3170 = _3168 + 1;
    int _3172 = ~_3148;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = as_type<float>(_3016) * _3160;
    float _3180 = float(uint(_3164));
    int _3182 = _3170 * as_type<int>(_3006);
    int _3184 = abs(_3010);
    float _3186 = trunc(_3178);
    float _3188 = precise::max(_3186, 0.0);
    uint _3190 = uint(_3188);
    int _3192 = _3176 * as_type<int>(_2964);
    int _3194 = _3192 + _3132;
    float _3196 = as_type<float>(_3084) * _3180;
    int _3198 = abs(_2074);
    int _3200 = abs(_3146);
    int _3202 = ~_3184;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    float _3208 = trunc(_3196);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    int _3214 = abs(_2988);
    int _3216 = ~_3198;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3206 * as_type<int>(_2998);
    int _3224 = _3222 + _3182;
    int _3226 = ~_3200;
    int _3228 = _3226 + 1;
    int _3230 = _3228 + 1;
    int _3232 = ~_3214;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * as_type<int>(_3060);
    int _3240 = _3238 + _3194;
    int _3242 = ~_2842;
    int _3244 = _3242 + 1;
    int _3246 = _3230 * as_type<int>(_3028);
    int _3248 = _3246 + _3224;
    bool _3250 = !_3130;
    int _3252 = _3250 ? 0 : (-1);
    int _3254 = _3236 * as_type<int>(_3068);
    int _3256 = _3254 + _3240;
    bool _3258 = !_2334;
    int _3260 = _3258 ? 0 : 1;
    int _3262 = int(_3082) + int(_3190);
    int _3264 = abs(_3252);
    int _3266 = abs(_3260);
    int _3268 = _3244 * _3262;
    int _3270 = _3268 + _2984;
    int _3272 = ~_3264;
    int _3274 = _3272 + 1;
    int _3276 = _3274 + 1;
    int _3278 = int(_3112) + int(_3212);
    int _3280 = ~_2926;
    int _3282 = _3280 + 1;
    int _3284 = _3276 * as_type<int>(_3036);
    int _3286 = _3284 + _3248;
    int _3288 = ~_3266;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    bool _3294 = uint(_3270) >= uint(_2842);
    int _3296 = _3282 * _3278;
    int _3298 = _3296 + _3050;
    bool _3300 = !_2346;
    int _3302 = _3300 ? 0 : 1;
    int _3304 = _3256 * _3292;
    bool _3306 = !_3294;
    int _3308 = _3306 ? 0 : (-1);
    float _3310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3312 = abs(_3302);
    bool _3314 = uint(_3298) >= uint(_2926);
    int _3316 = _2984 ^ _2842;
    int _3318 = ~_3262;
    int _3320 = _3318 + _3308;
    int _3322 = _3320 + 1;
    int _3324 = ~_3312;
    int _3326 = _3324 + 1;
    int _3328 = _3326 + 1;
    bool _3330 = !_3314;
    int _3332 = _3330 ? 0 : (-1);
    int _3334 = _2842 * _3322;
    int _3336 = _3334 + _2984;
    uint _3338 = uint(int(uint(_3316) >> uint(31)));
    int _3340 = _3286 * _3328;
    bool _3342 = _2842 == 0;
    float _3344 = _3310 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3346 = _2842 == 0;
    float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3350 = ~_3332;
    int _3352 = _3278 + _3350;
    int _3354 = _3352 + 1;
    float _3356 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2726);
    int _3358 = ~int(_3338);
    int _3360 = _3358 + 1;
    bool _3362 = !_1510;
    int _3364 = _3362 ? _3074 : (-1);
    int _3366 = _3354 ^ _3360;
    bool _3368 = !_3342;
    int _3370 = _3368 ? _3336 : (-1);
    int _3372 = _3364 * _3266;
    int _3374 = _3372 + _3304;
    int _3376 = ~_3360;
    int _3378 = _3376 + _3366;
    int _3380 = _3378 + 1;
    float _3382 = float(_3370);
    bool _3384 = !_3346;
    int _3386 = _3384 ? _3380 : (-1);
    float _3388 = fma(_3344, _3382, _2732);
    float _3390 = _3348 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3392 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3394 = _1358 + 0.5;
    float _3396 = float(_3386);
    float _3398 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3392);
    bool _3400 = !_1708;
    int _3402 = _3400 ? _3124 : (-1);
    float _3404 = fma(_3344, _3394, _3388);
    float _3406 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3408 = -_3356;
    float _3410 = fma(_3390, _3396, _3408);
    float _3412 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3398);
    float _3414 = _1354 + (-0.5);
    float _3416 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3406);
    int _3418 = _3402 * _3312;
    int _3420 = _3418 + _3340;
    float _3422 = -_3412;
    float _3424 = _3422 + 1.0;
    float _3426 = -_3390;
    float _3428 = fma(_3426, _3414, _3410);
    float _3430 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3416);
    float _3432 = -_3424;
    float _3434 = fma(_1358, _3432, _3404);
    float _3436 = _2560 * _2560;
    float _3438 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3440 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3442 = -_3430;
    float _3444 = _3442 + 1.0;
    float _3446 = fma(_2566, _2566, _3436);
    float _3448 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3438);
    float _3450 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3440);
    float _3452 = -_3444;
    float _3454 = fma(_2470, _3452, _2694);
    float _3456 = fma(_2580, _2580, _3446);
    float _3458 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3448);
    float _3460 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3450);
    float _3462 = float(_3374);
    float _3464 = -_3458;
    float _3466 = _3464 + 1.0;
    float _3468 = rsqrt(_3456);
    float _3470 = -_2832;
    float _3472 = _3470 + 1.0;
    float _3474 = -_3460;
    float _3476 = _3474 + 1.0;
    float _3478 = fma(_2080, _3466, _2648);
    float _3480 = float(_3420);
    float _3482 = -_3472;
    float _3484 = fma(_1900, _3482, _2820);
    float _3486 = fma(_1354, _3476, _3428);
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3490 = _3488 != 0;
    int _3492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3494 = _3492 != 0;
    int _3496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3498 = _3496 != 0;
    out.m_88.x = _3462;
    out.m_90.x = _3454;
    out.m_90.y = _3478;
    out.m_90.z = _3484;
    out.m_90.w = _2928;
    bool _3500 = !_3494;
    int _3502 = _3500 ? 0 : 1;
    bool _3504 = !_3498;
    int _3506 = _3504 ? 0 : 1;
    out.m_88.w = _3480;
    float _3508 = _2560 * _3468;
    float _3510 = _2566 * _3468;
    bool _3512 = !_3490;
    int _3514 = _3512 ? 0 : 1;
    out.m_92.x = _3434;
    out.m_92.y = _3486;
    float _3516 = _3484;
    if (_2608)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3518 = -_3508;
    float _3520 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2492);
    float _3522 = _2580 * _3468;
    float _3524 = -_3510;
    float _3526 = fma(_3524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2274);
    float _3528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3530 = _3520 + _3528;
    float _3532 = -_3522;
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2524);
    float _3536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3538 = _3526 + _3536;
    float _3540 = _3530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3544 = _3534 + _3542;
    float _3546 = fma(_3538, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3540);
    float _3548 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3546);
    bool _3550 = _3548 >= 0.0;
    float _3552 = _3538;
    if (_3550)
    {
        _3516 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3554 = _3516;
    int _3556 = as_type<int>(_3554);
    if (_3550)
    {
        out.m_63.x = 0.0;
    }
    if (_3550)
    {
        float _3558 = _3554 * 5.0;
        _3556 = as_type<int>(_3558);
    }
    int _3560 = _3556;
    if (_3550)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10682 = as_type<float>(_3560);
        out.gl_Position.z = _10682;
    }
    if (_3550)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3562 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3564 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3566 = floor(_3562);
    float _3568 = floor(_3564);
    float _3570 = -_3566;
    float _3572 = _3562 + _3570;
    float _3574 = -_3568;
    float _3576 = _3564 + _3574;
    float2 _10718 = float2(_3572, _3576);
    float _3578 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10718, float2(0.0), isnan(_10718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10718, float2(0.0), isnan(_10718)), level(0.0)).x;
    float _3580 = _1082 * 2.0;
    float _3582 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3584 = log2(_3582);
    float _3586 = _1178 * 2.0;
    float _3588 = _1180 + _1178;
    float _3590 = _1180 * 2.0;
    int _3592 = abs(_3514);
    float _3594 = -_3508;
    float _3596 = fma(_3594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2560);
    float _3598 = _3588 + (-1.0);
    float _3600 = -_3510;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2566);
    float _3604 = floor(_3580);
    float _3606 = _3596 * _3596;
    float _3608 = float(_3592);
    float _3610 = -_3522;
    float _3612 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2580);
    float _3614 = floor(_3586);
    float _3616 = _3584 * _135;
    bool _3618 = _3604 > 0.0;
    float _3620 = floor(_3590);
    bool _3622 = _3604 >= 0.0;
    bool _3624 = isnan(_3604);
    bool _3626 = _3622 || _3624;
    bool _3628 = isnan(0.0);
    bool _3630 = _3626 || _3628;
    float _3632 = fma(_3598, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3634 = _1180 + _1082;
    float _3636 = _1180 + (-0.5);
    int _3638 = _3630 ? 0 : 1;
    float _3640 = _3634 + (-1.0);
    float _3642 = exp2(_3616);
    bool _3644 = _3614 >= 0.0;
    bool _3646 = isnan(_3614);
    bool _3648 = _3644 || _3646;
    bool _3650 = isnan(0.0);
    bool _3652 = _3648 || _3650;
    float _3654 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _3656 = ~_3638;
    int _3658 = _3656 + 1;
    int _3660 = _3658 + 1;
    int _3662 = _3660;
    int _3664 = 2;
    if (!_3618)
    {
        int _3666 = ~_3638;
        int _3668 = _3666 + 1;
        _3662 = _3668;
    }
    int _3670 = _3662;
    float _3672 = _3520 + _3654;
    bool _3674 = _3614 > 0.0;
    bool _3676 = _3620 > 0.0;
    float _3678 = fma(_3640, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3680 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3682 = 1.0 + _3680;
    float _3684 = in.m_94.x;
    float _3686 = in.m_94.y;
    float _3688 = in.m_94.z;
    bool _3690 = _3620 >= 0.0;
    bool _3692 = isnan(_3620);
    bool _3694 = _3690 || _3692;
    bool _3696 = isnan(0.0);
    bool _3698 = _3694 || _3696;
    float _3700 = -_3642;
    float _3702 = _3700 + 1.0;
    float _3704 = 1.0 / _3682;
    int _3706 = _3652 ? 0 : 1;
    bool _3708 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3710 = isnan(1.0);
    bool _3712 = _3708 || _3710;
    bool _3714 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3716 = _3712 || _3714;
    int _3718 = ~_3706;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3722;
    if (!_3674)
    {
        int _3726 = ~_3706;
        int _3728 = _3726 + 1;
        _3724 = _3728;
    }
    int _3730 = _3724;
    bool _3732 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3734 = isnan(0.0);
    bool _3736 = _3732 || _3734;
    bool _3738 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3740 = _3736 || _3738;
    float _3742 = float(_3670);
    float _3744 = _3740 ? _3702 : 0.0;
    int _3746 = abs(_3502);
    float _3748 = _3608 * _3742;
    float _3750 = float(_3730);
    if (_3716)
    {
        float _3752 = _3744 * _3704;
        _145 = _3752;
    }
    float _3754 = _145;
    float _3756 = float(_3746);
    float _3758 = fma(_3602, _3602, _3606);
    float _3760 = _3748 * (-2.0);
    int _3762 = _3698 ? 0 : 1;
    float _3764 = _3756 * _3750;
    float _3766 = _1178 + (-0.5);
    float _3768 = fma(_3760, _3684, _3684);
    float _3770 = fma(_3632, _3760, _3632);
    int _3772 = abs(_3506);
    float _3774 = _1178 + _1082;
    float _3776 = fma(_3766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3768);
    float _3778 = _3764 * (-2.0);
    int _3780 = ~_3762;
    int _3782 = _3780 + 1;
    int _3784 = _3782 + 1;
    float _3786 = _3774 + (-1.0);
    int _3788 = _3784;
    if (!_3676)
    {
        int _3790 = ~_3762;
        int _3792 = _3790 + 1;
        _3788 = _3792;
    }
    int _3794 = _3788;
    float _3796 = fma(_3678, _3778, _3678);
    float _3798 = fma(_3778, _3686, _3686);
    float _3800 = _1082 + (-0.5);
    float _3802 = float(_3794);
    float _3804 = fma(_3636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3798);
    float _3806 = float(_3772);
    float _3808 = fma(_3770, _3754, _3776);
    float _3810 = fma(_3612, _3612, _3758);
    float _3812 = fma(_3796, _3754, _3804);
    float _3814 = _3806 * _3802;
    float _3816 = _3808 * 0.15915493667125701904296875;
    float _3818 = _3812 * 0.15915493667125701904296875;
    float _3820 = _3814 * (-2.0);
    float _3822 = sqrt(_3810);
    float _3824 = fma(_3786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3826 = fma(_3820, _3688, _3688);
    float _3828 = fma(_3824, _3820, _3824);
    float _3830 = fma(_3800, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3826);
    float _3832 = _3816 * 6.283185482025146484375;
    float _3834 = sin(_3832);
    float _3836 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3838 = fma(_3828, _3754, _3830);
    float _3840 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3842 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3836);
    float _3844 = _3838 * 0.15915493667125701904296875;
    float _3846 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3840);
    float _3848 = _3816 * 6.283185482025146484375;
    float _3850 = cos(_3848);
    float _3852 = _3468 * _3822;
    float _3854 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3842);
    float _3856 = fma(_3534, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3846);
    float _3858 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3860 = _3856 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3862 = _3520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3864 = _3818 * 6.283185482025146484375;
    float _3866 = sin(_3864);
    float _3868 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3862);
    float _3870 = fma(_3534, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3868);
    float _3872 = 1.0 / _3860;
    float _3874 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3876 = _3874 + _3860;
    float _3878 = _3818 * 6.283185482025146484375;
    float _3880 = cos(_3878);
    float _3882 = _3834 * _3866;
    float _3884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3886 = _3844 * 6.283185482025146484375;
    float _3888 = sin(_3886);
    float _3890 = _3876 * _3872;
    float _3892 = _3890 * 0.5;
    float _3894 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3896 = _3850 * _3866;
    float _3898 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3900 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3898);
    float _3902 = _3844 * 6.283185482025146484375;
    float _3904 = cos(_3902);
    float _3906 = _3850 * _3880;
    float _3908 = fma(_3888, _3906, _3882);
    float _3910 = 1.0 / _3900;
    float _3912 = fma(_3888, _3882, _3906);
    float _3914 = _3852 * _3894;
    float _3916 = _3834 * _3880;
    float _3918 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3920 = _3850 * _3904;
    float _3922 = _3880 * _3904;
    float _3924 = _3834 * _3904;
    float _3926 = _3866 * _3904;
    float _3928 = _3884 * _3914;
    float _3930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3932 = _3852 * _3918;
    float _3934 = -_3896;
    float _3936 = fma(_3888, _3916, _3934);
    float _3938 = -_3916;
    float _3940 = fma(_3888, _3896, _3938);
    float _3942 = -_3928;
    float _3944 = _3888 * _3942;
    float _3946 = _3930 * _3932;
    float _3948 = _3920 * _3928;
    float _3950 = _3672 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3952 = _3924 * _3928;
    float _3954 = fma(_3922, _3946, _3944);
    float _3956 = fma(_3908, _3946, _3948);
    float _3958 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3950);
    float _3960 = fma(_3936, _3946, _3952);
    float _3962 = _3852 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3964 = _3962 * 0.5;
    float _3966 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3968 = _3910 * _3966;
    float _3970 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3958);
    float _3972 = trunc(_3858);
    int _3974 = int(_3972);
    float _3976 = fma(_3940, _3964, _3956);
    float _3978 = fma(_3926, _3964, _3954);
    bool _3980 = _3968 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3982 = _3970 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3984 = _3968 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3986 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3988 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3990 = trunc(_3982);
    int _3992 = int(_3990);
    float _3994 = fma(_3912, _3964, _3960);
    float _3996 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3986);
    float _3998 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3988);
    bool _4000 = !_3980;
    int _4002 = _4000 ? 0 : 1;
    float _4004 = _3976 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4006 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3996);
    float _4008 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3998);
    int _4010 = as_type<int>(_3976);
    int _4012 = as_type<int>(_3994);
    float _4014 = _4004;
    if (!_3980)
    {
        _3664 = 1;
    }
    int _4016 = _3664;
    float _4018 = fma(_3978, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4004);
    int _4020 = _4016;
    if (!_3984)
    {
        _4020 = _4002;
    }
    int _4022 = _4020;
    float _4024 = _4006 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4026 = _4008 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _4028 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4030 = _3974 + _4028;
    int _4032 = _4030 + 1;
    float _4034 = fma(_3994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4018);
    int _4036 = _4022 << 6;
    float _4038 = _2524 + _4024;
    int _4040 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4042 = _3992 + _4040;
    int _4044 = _4042 + 1;
    float _4046 = _2274 + _4026;
    int _4048 = _4036 + 48;
    uint _4050 = uint(int(uint(_4048) >> uint(2)));
    uint _4052 = uint(int(uint(int(_4050)) >> uint(2)));
    int _4054 = int(_4050) & 3;
    float _4056 = (*spvDescriptorSet0.vp_c15)._m0[int(_4052)][_4054];
    int _4058 = int(_4050) + 1;
    uint _4060 = uint(int(uint(_4058) >> uint(2)));
    int _4062 = _4058 & 3;
    float _4064 = (*spvDescriptorSet0.vp_c15)._m0[int(_4060)][_4062];
    float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4068 = _4038 + _4066;
    int _4070 = _4044 | _4032;
    float _4072 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4074 = _4046 + _4072;
    bool _4076 = _4044 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4078 = _4068 * _4068;
    float _4080 = _4034 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _4082 = _4036 + 56;
    uint _4084 = uint(int(uint(_4082) >> uint(2)));
    uint _4086 = uint(int(uint(int(_4084)) >> uint(2)));
    int _4088 = int(_4084) & 3;
    float _4090 = (*spvDescriptorSet0.vp_c15)._m0[int(_4086)][_4088];
    int _4092 = int(_4084) + 1;
    uint _4094 = uint(int(uint(_4092) >> uint(2)));
    int _4096 = _4092 & 3;
    float _4098 = (*spvDescriptorSet0.vp_c15)._m0[int(_4094)][_4096];
    float _4100 = fma(_4074, _4074, _4078);
    bool _4102 = _4070 < 0;
    bool _4104 = _4102 || _4076;
    float _4106 = _2492 + _4080;
    float _4108 = sqrt(_4100);
    bool _4110 = _4032 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4112 = _4110 || _4104;
    int _4114 = _4036 + 64;
    uint _4116 = uint(int(uint(_4114) >> uint(2)));
    uint _4118 = uint(int(uint(int(_4116)) >> uint(2)));
    int _4120 = int(_4116) & 3;
    float _4122 = (*spvDescriptorSet0.vp_c15)._m0[int(_4118)][_4120];
    int _4124 = int(_4116) + 1;
    uint _4126 = uint(int(uint(_4124) >> uint(2)));
    int _4128 = _4124 & 3;
    float _4130 = (*spvDescriptorSet0.vp_c15)._m0[int(_4126)][_4128];
    int _4132 = _4036 + 72;
    uint _4134 = uint(int(uint(_4132) >> uint(2)));
    uint _4136 = uint(int(uint(int(_4134)) >> uint(2)));
    int _4138 = int(_4134) & 3;
    float _4140 = (*spvDescriptorSet0.vp_c15)._m0[int(_4136)][_4138];
    int _4142 = int(_4134) + 1;
    uint _4144 = uint(int(uint(_4142) >> uint(2)));
    int _4146 = _4142 & 3;
    float _4148 = (*spvDescriptorSet0.vp_c15)._m0[int(_4144)][_4146];
    float _4150 = as_type<float>(_4032);
    float _4152 = _4046;
    float _4154 = as_type<float>(_4044);
    if (!_4112)
    {
        int _4156 = _4032 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4158 = _4156 + _4044;
        _4010 = _4158;
    }
    int _4160 = _4010;
    bool _4162 = _4108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _4164 = _4036 + 96;
    uint _4166 = uint(int(uint(_4164) >> uint(2)));
    uint _4168 = uint(int(uint(int(_4166)) >> uint(2)));
    int _4170 = int(_4166) & 3;
    float _4172 = (*spvDescriptorSet0.vp_c15)._m0[int(_4168)][_4170];
    int _4174 = int(_4166) + 1;
    uint _4176 = uint(int(uint(_4174) >> uint(2)));
    int _4178 = _4174 & 3;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[int(_4176)][_4178];
    float _4182 = as_type<float>(_4160);
    if (!_4112)
    {
        int _4184 = _4160 << 2;
        _4012 = _4184;
    }
    int _4186 = _4012;
    int _4188 = _4186;
    if (!_4112)
    {
        uint _4190 = uint(int(uint(_4160) >> uint(2)));
        _2882 = int(_4190);
    }
    int _4192 = _2882;
    float _4194 = as_type<float>(_4192);
    if (!_4112)
    {
        int _4196 = 12 & _4186;
        _4188 = _4196;
    }
    int _4198 = _4188;
    int _4200 = _4036 + 104;
    uint _4202 = uint(int(uint(_4200) >> uint(2)));
    uint _4204 = uint(int(uint(int(_4202)) >> uint(2)));
    int _4206 = int(_4202) & 3;
    float _4208 = (*spvDescriptorSet0.vp_c15)._m0[int(_4204)][_4206];
    int _4210 = int(_4202) + 1;
    uint _4212 = uint(int(uint(_4210) >> uint(2)));
    int _4214 = _4210 & 3;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[int(_4212)][_4214];
    if (!_4112)
    {
        int _4218 = _4192 << 4;
        int _4220 = _4218 + _4198;
        _4194 = as_type<float>(_4220);
    }
    float _4222 = _4194;
    if (!_4162)
    {
        _4150 = _4046;
    }
    float _4224 = _4150;
    float _4226 = _4224;
    if (!_4162)
    {
        _4152 = _4038;
    }
    float _4228 = _4152;
    float _4230 = _4228;
    if (!_4162)
    {
        _4154 = _4106;
    }
    float _4232 = _4154;
    bool _4234 = !_4162;
    float _4236 = _4232;
    if (!_4234)
    {
        float _4238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4242 = _4108 + _4240;
        float _4244 = rsqrt(_4100);
        float _4246 = _4242 * _4238;
        float _4248 = _4106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4250 = _4246 * 0.15915493667125701904296875;
        float _4252 = _4250 * 6.283185482025146484375;
        float _4254 = cos(_4252);
        float _4256 = _4250 * 6.283185482025146484375;
        float _4258 = sin(_4256);
        float _4260 = _4254 + (-1.0);
        float _4262 = fma(_4258, _4248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4264 = _4260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4266 = _4244 * _4262;
        float _4268 = fma(_4106, _4254, _4264);
        float _4270 = fma(_4074, _4266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4272 = fma(_4068, _4266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4236 = _4268;
        _4226 = _4270;
        _4230 = _4272;
        _4014 = _4266;
    }
    float _4274 = _4236;
    float _4276 = _4226;
    float _4278 = _4230;
    float _4280 = _4014;
    float _4282 = -_2492;
    float _4284 = _4282 + _4274;
    int _4286 = _4036 + 80;
    uint _4288 = uint(int(uint(_4286) >> uint(2)));
    uint _4290 = uint(int(uint(int(_4288)) >> uint(2)));
    int _4292 = int(_4288) & 3;
    float _4294 = (*spvDescriptorSet0.vp_c15)._m0[int(_4290)][_4292];
    int _4296 = int(_4288) + 1;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    int _4300 = _4296 & 3;
    float _4302 = (*spvDescriptorSet0.vp_c15)._m0[int(_4298)][_4300];
    float _4304 = -_2274;
    float _4306 = _4304 + _4276;
    float _4308 = -_2524;
    float _4310 = _4308 + _4278;
    float _4312 = _4284 * _4284;
    float _4314 = _3672 * _4180;
    float _4316 = _4280;
    float _4318 = _4312;
    float _4320 = _4276;
    float _4322 = _4274;
    float _4324 = _4278;
    if (!_4112)
    {
        float _4326 = floor(_3858);
        _4316 = _4326;
    }
    float _4328 = _4316;
    float _4330 = _3672 * _4130;
    float _4332 = fma(_4306, _4306, _4312);
    int _4334 = _4036 + 88;
    uint _4336 = uint(int(uint(_4334) >> uint(2)));
    uint _4338 = uint(int(uint(int(_4336)) >> uint(2)));
    int _4340 = int(_4336) & 3;
    float _4342 = (*spvDescriptorSet0.vp_c15)._m0[int(_4338)][_4340];
    int _4344 = int(_4336) + 1;
    uint _4346 = uint(int(uint(_4344) >> uint(2)));
    int _4348 = _4344 & 3;
    float _4350 = (*spvDescriptorSet0.vp_c15)._m0[int(_4346)][_4348];
    float _4352 = fma(_3526, _4172, _4314);
    float _4354 = fma(_3526, _4122, _4330);
    float _4356 = fma(_4310, _4310, _4332);
    float _4358 = fma(_3534, _4208, _4352);
    float _4360 = _4328;
    if (!_4112)
    {
        float _4362 = floor(_3982);
        _4318 = _4362;
    }
    float _4364 = _4318;
    bool _4366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _4368 = isnan(0.5);
    bool _4370 = _4366 || _4368;
    bool _4372 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4374 = _4370 || _4372;
    float _4376 = _4222;
    if (!_4112)
    {
        int _4378 = as_type<int>(_4222) + 400;
        uint _4380 = uint(int(uint(_4378) >> uint(2)));
        uint _4382 = uint(int(uint(int(_4380)) >> uint(2)));
        int _4384 = int(_4380) & 3;
        float _4386 = (*spvDescriptorSet0.vp_c15)._m0[int(_4382)][_4384];
        _4376 = _4386;
    }
    float _4388 = _4376;
    float _4390 = _4358 + _4216;
    float _4392 = _3672 * _4064;
    float _4394 = fma(_3534, _4140, _4354);
    float _4396 = sqrt(_4356);
    float _4398 = fma(_3526, _4056, _4392);
    float _4400 = fma(_3534, _4090, _4398);
    bool _4402 = _4396 > 0.0;
    float _4404 = 1.0 / _4390;
    bool _4406 = !_4402;
    if (!_4406)
    {
        float _4408 = _245 * _245;
        float _4410 = rsqrt(_4356);
        float _4412 = fma(_241, _241, _4408);
        float _4414 = fma(_247, _247, _4412);
        float _4416 = sqrt(_4414);
        float _4418 = _4306 * _4410;
        float _4420 = _4284 * _4410;
        float _4422 = _4310 * _4410;
        bool _4424 = _4416 > 0.0;
        bool _4426 = !_4424;
        if (!_4426)
        {
            float _4428 = rsqrt(_4414);
            float _4430 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4432 = _245 * _4428;
            float _4434 = _241 * _4428;
            float _4436 = _4420 * _4432;
            float _4438 = _247 * _4428;
            float _4440 = fma(_4418, _4434, _4436);
            float _4442 = _4430 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4444 = fma(_4422, _4438, _4440);
            float _4446 = _4444 * _4442;
            float _4448 = fma(_241, _4446, _4276);
            float _4450 = fma(_245, _4446, _4274);
            float _4452 = fma(_247, _4446, _4278);
            _4320 = _4448;
            _4322 = _4450;
            _4324 = _4452;
        }
    }
    float _4454 = _4320;
    float _4456 = _4322;
    float _4458 = _4324;
    float _4460 = -_3510;
    float _4462 = fma(_4460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4454);
    float _4464 = -_3508;
    float _4466 = fma(_4464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4456);
    float _4468 = -_3522;
    float _4470 = fma(_4468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4458);
    float _4472 = _4400 + _4098;
    float _4474 = _4394 + _4148;
    float _4476 = _4466;
    float _4478 = _4462;
    float _4480 = _4470;
    float _4482 = _4474;
    if (!_4374)
    {
        float _4484 = _3530 * _3530;
        float _4486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4488 = -_2524;
        float _4490 = _4488 + _4458;
        float _4492 = -_2492;
        float _4494 = _4492 + _4456;
        float _4496 = fma(_3538, _3538, _4484);
        float _4498 = -_2274;
        float _4500 = _4498 + _4454;
        float _4502 = fma(_3544, _3544, _4496);
        float _4504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4506 = sqrt(_4502);
        float _4508 = 1.0 / _3852;
        float _4510 = precise::min(_4506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4512 = _4510 * _4486;
        float _4514 = _4504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4516 = _4512 * _4508;
        float _4518 = _4514 * _4516;
        float _4520 = _4490 * _4516;
        float _4522 = fma(_4494, _4518, _3520);
        float _4524 = fma(_4500, _4518, _3526);
        float _4526 = fma(_4514, _4520, _3534);
        _4476 = _4522;
        _4478 = _4524;
        _4480 = _4526;
    }
    float _4528 = _4476;
    float _4530 = _4478;
    float _4532 = _4480;
    float _4534 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4536 = _4472 * _4404;
    float _4538 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4540 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4542 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4534);
    float _4544 = _4474 * _4404;
    bool _4546 = _4536 >= 0.0;
    float _4548 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4538);
    float _4550 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4542);
    float _4552 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4540);
    bool _4554 = _4536 <= 1.0;
    bool _4556 = _4554 && _4546;
    float _4558 = _4528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4560 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4548);
    float _4562 = _4550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4564 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4552);
    float _4566 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4558);
    float _4568 = _4560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4570 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4572 = _4544 >= 0.0;
    bool _4574 = _4572 && _4556;
    float _4576 = _4564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4578 = fma(_4532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4566);
    float _4580 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4570);
    bool _4582 = _4544 <= 1.0;
    bool _4584 = _4582 && _4574;
    float _4586 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4588 = _4576 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4590 = _4578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4592 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4580);
    float _4594 = _3672 * _4302;
    float _4596 = -_4588;
    float _4598 = fma(_4596, _4586, 1.0);
    float _4600 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4602 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4592);
    float _4604 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4606 = fma(_3526, _4294, _4594);
    float _4608 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4600);
    float _4610 = log2(_4598);
    float _4612 = _4566;
    if (_4584)
    {
        float _4614 = float(_4022);
        _4612 = _4614;
    }
    float _4616 = _4612;
    float _4618 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4604);
    float _4620 = fma(_3534, _4342, _4606);
    float _4622 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4608);
    if (!_4112)
    {
        float _4624 = -_4364;
        float _4626 = _3982 + _4624;
        _4482 = _4626;
    }
    float _4628 = _4482;
    float _4630 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4618);
    float _4632 = _4620 + _4350;
    float _4634 = 1.0 / _4602;
    float _4636 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4622);
    float _4638 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4630);
    float _4640 = _4636;
    if (!_4112)
    {
        float _4642 = -_4328;
        float _4644 = _3858 + _4642;
        _4360 = _4644;
    }
    float _4646 = _4360;
    float _4648 = _4632 * _4404;
    float _4650 = _4394;
    if (!_4112)
    {
        float _4652 = rint(_4388);
        float _4654 = precise::max(_4652, 0.0);
        uint _4656 = uint(_4654);
        uint _4658 = clamp(_4656, 0u, 65535u);
        _4650 = as_type<float>(_4658);
    }
    float _4660 = _4650;
    float _4662 = _4610 * 0.693147182464599609375;
    float _4664 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4666 = _4616;
    if (_4584)
    {
        float _4668 = rint(_4616);
        float _4670 = precise::max(_4668, 0.0);
        uint _4672 = uint(_4670);
        uint _4674 = clamp(_4672, 0u, 65535u);
        _4666 = as_type<float>(_4674);
    }
    float _4676 = _4666;
    float _4678 = _4636 * _4634;
    float _4680 = _4638 * _4634;
    float _4682 = fma(_4678, 0.5, 0.5);
    float _4684 = fma(_4680, -0.5, 0.5);
    float _4686 = _4628;
    float _4688 = _4680;
    float _4690 = _4660;
    if (!_4112)
    {
        float3 _12490 = float3(_4628, _4646, float(as_type<int>(_4660)));
        float3 _12494 = select(_12490, float3(0.0), isnan(_12490));
        float _4692 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12494.xy, uint(rint(_12494.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12494.xy, uint(rint(_12494.z)), level(0.0)).x;
        _4686 = _4692;
    }
    float _4694 = _4686;
    float _4696 = _4544;
    if (_4584)
    {
        float3 _12509 = float3(_4536, _4544, float(as_type<int>(_4676)));
        float3 _12511 = select(_12509, float3(0.0), isnan(_12509));
        float _4698 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12511.xy, uint(rint(_12511.z)), _4648, level(0.0));
        _4696 = _4698;
    }
    float _4700 = _4696;
    float3 _12521 = float3(_4682, _4684, _4664);
    float _4702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12521, float3(0.0), isnan(_12521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12521, float3(0.0), isnan(_12521)), level(0.0)).x;
    float3 _12530 = float3(_4682, _4684, _4664);
    float4 _4705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12530, float3(0.0), isnan(_12530)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12530, float3(0.0), isnan(_12530)), level(0.0)).xyzw;
    float _4707 = _4705.x;
    float _4709 = _4705.y;
    float _4711 = _4705.z;
    float _4713 = _4705.w;
    bool _4715 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4717 = isnan(0.5);
    bool _4719 = _4715 || _4717;
    bool _4721 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4723 = _4719 || _4721;
    if (_4112)
    {
        _3552 = 1.0;
    }
    float _4725 = _3552;
    float _4727 = _4725;
    if (_4723)
    {
        _4688 = 1.0;
    }
    float _4729 = _4688;
    float _4731 = _4729;
    if (!_4723)
    {
        float _4733 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4735 = _4733 * 0.15915493667125701904296875;
        float _4737 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4739;
        float _4743 = _4735 * 6.283185482025146484375;
        float _4745 = cos(_4743);
        float _4747 = _4737 * 0.15915493667125701904296875;
        float _4749 = _4735 * 6.283185482025146484375;
        float _4751 = sin(_4749);
        float _4753 = 1.0 / _4745;
        float _4755 = _4747 * 6.283185482025146484375;
        float _4757 = cos(_4755);
        float _4759 = _4751 * _4753;
        float _4761 = _4747 * 6.283185482025146484375;
        float _4763 = sin(_4761);
        float _4765 = _4757 * _4759;
        float _4767 = 1.0 / _4741;
        float _4769 = 1.0 / _4765;
        float _4771 = _4763 * _4769;
        float _4773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4775 = fma(_3968, _4771, _4773);
        float _4777 = _4775 * _4767;
        float _4779 = precise::clamp(_4777, 0.0, 1.0);
        _4690 = _4767;
        _4731 = _4779;
    }
    float _4781 = _4690;
    float _4783 = _4731;
    if (!_4112)
    {
        int _4785 = _4160 << 4;
        int _4787 = _4785 + 2048;
        uint _4789 = uint(int(uint(_4787) >> uint(2)));
        uint _4791 = uint(int(uint(int(_4789)) >> uint(2)));
        int _4793 = int(_4789) & 3;
        float _4795 = (*spvDescriptorSet0.vp_c15)._m0[int(_4791)][_4793];
        int _4797 = int(_4789) + 1;
        uint _4799 = uint(int(uint(_4797) >> uint(2)));
        int _4801 = _4797 & 3;
        float _4803 = (*spvDescriptorSet0.vp_c15)._m0[int(_4799)][_4801];
        int _4805 = _4787 + 8;
        uint _4807 = uint(int(uint(_4805) >> uint(2)));
        uint _4809 = uint(int(uint(int(_4807)) >> uint(2)));
        int _4811 = int(_4807) & 3;
        float _4813 = (*spvDescriptorSet0.vp_c15)._m0[int(_4809)][_4811];
        int _4815 = int(_4807) + 1;
        uint _4817 = uint(int(uint(_4815) >> uint(2)));
        int _4819 = _4815 & 3;
        float _4821 = (*spvDescriptorSet0.vp_c15)._m0[int(_4817)][_4819];
        float _4823 = _3672 * _4803;
        float _4825 = fma(_3526, _4795, _4823);
        float _4827 = fma(_3534, _4813, _4825);
        float _4829 = _4827 + _4821;
        float _4831 = precise::clamp(_4829, 0.0, 1.0);
        float _4833 = -_4831;
        float _4835 = _4833 + _4694;
        float _4837 = fma(_4835, 500.0, 1.5);
        float _4839 = exp2(_4837);
        float _4841 = 0.0 + _4839;
        float _4843 = precise::clamp(_4841, 0.0, 1.0);
        _4182 = as_type<float>(_4787);
        _4727 = _4843;
    }
    float _4845 = _4182;
    float _4847 = _4727;
    float _4849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4851 = _4528 + _4849;
    float _4853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4855 = _4530 + _4853;
    float _4857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4859 = _4532 + _4857;
    float _4861 = _4851 * _4851;
    float _4863 = fma(_4855, _4855, _4861);
    float _4865 = fma(_4859, _4859, _4863);
    float _4867 = rsqrt(_4865);
    float _4869 = _4867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4871 = _4855 * _4869;
    float _4873 = _4859 * _4869;
    float _4875 = _4871 * _4871;
    float _4877 = _4873 * _4873;
    float _4879 = _4875 + _4877;
    float _4881 = sqrt(_4879);
    bool _4883 = _4881 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4885 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4887 = _4881 + _4885;
    float _4889 = _4859;
    float _4891 = _4861;
    float _4893 = _4887;
    float _4895 = _4845;
    float _4897 = _4851;
    if (_4883)
    {
        float _4899 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4889 = _4899;
    }
    float _4901 = _4889;
    if (_4883)
    {
        float _4903 = rsqrt(_4879);
        _4891 = _4903;
    }
    float _4905 = _4891;
    float _4907 = _4905;
    if (_4883)
    {
        float _4909 = _4887 * _4901;
        _4893 = _4909;
    }
    float _4911 = _4893;
    if (_4883)
    {
        float _4913 = _4911 * 0.15915493667125701904296875;
        _4895 = _4913;
    }
    float _4915 = _4895;
    float _4917 = _4867;
    if (_4883)
    {
        float _4919 = _4915 * 6.283185482025146484375;
        float _4921 = sin(_4919);
        _4917 = _4921;
    }
    float _4923 = _4917;
    float _4925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4927 = precise::max(0.0, _4925);
    float _4929 = _4781;
    float _4931 = _4927;
    float _4933 = _4925;
    if (_4883)
    {
        float _4935 = _4915 * 6.283185482025146484375;
        float _4937 = cos(_4935);
        _4929 = _4937;
    }
    float _4939 = _4929;
    float _4941 = -_4869;
    float _4943 = -_4927;
    float _4945 = fma(_4851, _4941, _4943);
    if (_4883)
    {
        float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4931 = _4947;
    }
    float _4949 = _4931;
    float _4951 = _4923;
    float _4953 = _4949;
    if (_4883)
    {
        float _4955 = fma(_4923, _4949, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4951 = _4955;
    }
    float _4957 = _4951;
    float _4959 = _4957;
    if (!_4883)
    {
        _4953 = _4873;
    }
    float _4961 = _4953;
    float _4963 = _4961;
    float _4965 = _4939;
    if (_4883)
    {
        float _4967 = _4939 + (-1.0);
        _4933 = _4967;
    }
    float _4969 = _4933;
    float _4971 = _4969;
    if (_4883)
    {
        float _4973 = _4905 * _4957;
        _4897 = _4973;
    }
    float _4975 = _4897;
    float _4977 = _4975;
    if (!_4883)
    {
        _4907 = _4871;
    }
    float _4979 = _4907;
    float _4981 = _4979;
    if (_4883)
    {
        float _4983 = _4969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4971 = _4983;
    }
    float _4985 = _4971;
    if (_4883)
    {
        float _4987 = _4871 * _4975;
        _4981 = _4987;
    }
    float _4989 = _4981;
    if (!_4883)
    {
        _4959 = _4945;
    }
    float _4991 = _4959;
    float _4993 = _4991;
    if (_4883)
    {
        float _4995 = _4873 * _4975;
        _4963 = _4995;
    }
    float _4997 = _4963;
    if (_4883)
    {
        float _4999 = fma(_4945, _4939, _4985);
        _4993 = _4999;
    }
    float _5001 = _4993;
    if (!_4883)
    {
        _4965 = _4875;
    }
    float _5003 = _4965;
    float _5005 = _5003;
    if (_4883)
    {
        float _5007 = _4989 * _4989;
        _5005 = _5007;
    }
    float _5009 = _5005;
    float _5011 = sqrt(_4865);
    if (!_4883)
    {
        _4977 = _4877;
    }
    float _5013 = _4977;
    float _5015 = _5013;
    if (_4883)
    {
        float _5017 = _4997 * _4997;
        _5015 = _5017;
    }
    float _5019 = _5015;
    float _5021 = fma(_5001, _5001, _5009);
    float _5023 = _5021 + _5019;
    float _5025 = rsqrt(_5023);
    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5029 = fma(_5011, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5027);
    float _5031 = precise::clamp(_5029, 0.0, 1.0);
    float _5033 = -_5031;
    float _5035 = _5033 + 1.0;
    float _5037 = abs(_5035);
    float _5039 = log2(_5037);
    float _5041 = _5025 * _4989;
    float _5043 = _5025 * _5001;
    float _5045 = _5025 * _4997;
    float _5047 = _5041 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5049 = -_5047;
    float _5051 = fma(_5043, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5049);
    float _5053 = -_5045;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5051);
    float _5057 = _5039 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5059 = fma(_5055, -0.5, 0.5);
    float _5061 = fma(_5055, 0.5, 0.5);
    float _5063 = _5043 + 1.0;
    float _5065 = exp2(_5057);
    float _5067 = fma(_5061, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5069 = fma(_5061, _5067, -0.212114393711090087890625);
    float _5071 = sqrt(_5059);
    float _5073 = fma(_5061, _5069, 1.570728778839111328125);
    float _5075 = -_5043;
    float _5077 = fma(_5065, _5063, _5075);
    float _5079 = fma(_5077, 0.5, 0.5);
    float _5081 = _5071 * 0.636619746685028076171875;
    float _5083 = -_5073;
    float _5085 = fma(_5081, _5083, 1.0);
    float2 _13101 = float2(_5085, _5079);
    float3 _5089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13101, float2(0.0), isnan(_13101)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13101, float2(0.0), isnan(_13101)), level(0.0)).xyz;
    float _5091 = _5089.x;
    float _5093 = _5089.y;
    float _5095 = _5089.z;
    float _5097 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5099 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5101 = _3908 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5103 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5105 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5097);
    float _5107 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5099);
    float _5109 = fma(_3922, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5101);
    float _5111 = abs(_3968);
    float _5113 = log2(_5111);
    float _5115 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5117 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5119 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5121 = _4562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5123 = -_3888;
    float _5125 = fma(_5123, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5115);
    float _5127 = -_3888;
    float _5129 = fma(_5127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5117);
    float _5131 = -_3888;
    float _5133 = fma(_5131, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5119);
    float _5135 = fma(_5103, _5103, 1.0);
    float _5137 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5139 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5141 = _3940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5143 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5129);
    float _5145 = rsqrt(_5135);
    float _5147 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5137);
    float _5149 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5139);
    float _5151 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5141);
    float _5153 = _5113 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5155 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5125);
    float _5157 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5133);
    float _5159 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5147);
    float _5161 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5149);
    float _5163 = fma(_3912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5151);
    float _5165 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5167 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5105);
    float _5169 = _5103 * _5143;
    float _5171 = exp2(_5153);
    float _5173 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5109);
    float _5175 = fma(_3936, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5107);
    float _5177 = fma(_5165, _5167, _5169);
    float _5179 = _5103 * _5155;
    float _5181 = _5103 * _5157;
    float _5183 = fma(_4568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5121);
    float _5185 = _5103 * _5145;
    out.m_96.x = _5175;
    out.m_96.y = _5167;
    out.m_96.z = _5173;
    float _5187 = fma(_5165, _5175, _5179);
    float _5189 = fma(_5165, _5173, _5181);
    float _5191 = fma(_4576, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5183);
    float _5193 = -_5159;
    float _5195 = _5185 * _5193;
    float _5197 = -_5163;
    float _5199 = _5185 * _5197;
    float _5201 = _5039 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5203 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5191);
    bool _5205 = _3968 <= 8000.0;
    bool _5207 = isnan(_3968);
    bool _5209 = _5205 || _5207;
    bool _5211 = isnan(8000.0);
    bool _5213 = _5209 || _5211;
    float _5215 = float(_5213);
    float _5217 = -_3578;
    float _5219 = _5217 + 1.0;
    float _5221 = fma(_5171, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5223 = precise::clamp(_5221, 0.0, 1.0);
    float _5225 = -_5161;
    float _5227 = _5185 * _5225;
    float _5229 = _4602 * 0.5;
    float _5231 = _5159 + _5187;
    float _5233 = exp2(_5201);
    out.gl_Position.x = _4636;
    out.gl_Position.y = _4638;
    out.gl_Position.z = _5203;
    out.gl_Position.w = _4602;
    float _5235 = fma(_4638, -0.5, _5229);
    float _5237 = _5203 + _4602;
    float _5239 = fma(_5145, _5155, _5195);
    float _5241 = _4636 + _4602;
    float _5243 = fma(_5145, _5143, _5227);
    float _5245 = fma(_5223, -2.0, 3.0);
    float _5247 = _5223 * _5223;
    float _5249 = fma(_5145, _5157, _5199);
    float _5251 = _5237 * 0.5;
    float _5253 = _5247 * _5245;
    float _5255 = _5241 * 0.5;
    if (!_4584)
    {
        _4640 = 1.0;
    }
    float _5257 = _4640;
    float _5259 = -_5233;
    float _5261 = _5259 + 1.0;
    float _5263 = -_5253;
    float _5265 = _5263 + 1.0;
    float _5267 = _5257;
    if (_4584)
    {
        bool _5269 = _4700 >= _4648;
        bool _5271 = isnan(_4700);
        bool _5273 = _5269 || _5271;
        bool _5275 = isnan(_4648);
        bool _5277 = _5273 || _5275;
        float _5279 = float(_5277);
        _5267 = _5279;
    }
    float _5281 = _5267;
    out.m_98.x = _5255;
    out.m_98.y = _5235;
    out.m_98.z = _5251;
    out.m_98.w = _4602;
    float _5283 = _5261 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5285 = fma(_5265, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5253);
    float _5287 = _5161 + _5177;
    float _5289 = _5281 * _4847;
    float _5291 = _5163 + _5189;
    float _5293 = _5215 * _5285;
    float _5295 = _5283 * _4702;
    float _5297 = -_5283;
    float _5299 = _5297 + 1.0;
    out.m_100.x = _5239;
    out.m_100.y = _5243;
    out.m_100.z = _5249;
    float _5301 = _5293 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _5303 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5305 = isnan(_5011);
    bool _5307 = _5303 || _5305;
    bool _5309 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5311 = _5307 || _5309;
    out.m_102.x = _5231;
    out.m_102.y = _5287;
    out.m_102.z = _5291;
    float _5313 = _5219 * _5301;
    float _5315 = precise::clamp(_5313, 0.0, 1.0);
    float _5317 = _4713 * _5295;
    float _5319 = _4713 * _5299;
    float _5321 = -_5315;
    float _5323 = fma(_5321, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5325 = -_5289;
    float _5327 = fma(_5325, _5323, 1.0);
    float _5329 = precise::clamp(_5327, 0.0, 1.0);
    float _5331 = _5299;
    float _5333 = _5301;
    float _5335 = _5329;
    if (!_5311)
    {
        _5331 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5337 = _5331;
    float _5339 = _5329 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5341 = _5337;
    float _5343 = _5337;
    if (!_5311)
    {
        _5333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5345 = _5333;
    float _5347 = _5345;
    float _5349 = _5345;
    if (!_5311)
    {
        _5335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5351 = _5335;
    out.m_104.x = _5339;
    float _5353 = _5095 * _5295;
    float _5355 = fma(_5091, _5317, _4707);
    float _5357 = fma(_5093, _5317, _4709);
    float _5359 = _4783 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5361 = fma(_4713, _5353, _4711);
    out.m_106.x = _5355;
    out.m_106.y = _5357;
    out.m_106.z = _5361;
    out.m_106.w = _5319;
    bool _5363 = !_5311;
    float _5365 = _5351;
    float _5367 = _5351;
    if (!_5363)
    {
        bool _5369 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5371 = isnan(_5011);
        bool _5373 = _5369 || _5371;
        bool _5375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5377 = _5373 || _5375;
        if (!_5377)
        {
            float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5381 = _5011 + _5379;
            float _5383 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5385 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5383;
            float _5387 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5395 = 1.0 / _5385;
            float _5397 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5399 = _5397 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5401 = _5381 * _5395;
            float _5403 = precise::clamp(_5401, 0.0, 1.0);
            float _5405 = fma(_5403, _5389, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5407 = fma(_5403, _5393, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5409 = fma(_5403, _5399, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5349 = _5407;
            _5343 = _5405;
            _5367 = _5409;
            _5411 = true;
        }
        else
        {
            bool _5413 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5415 = isnan(_5011);
            bool _5417 = _5413 || _5415;
            bool _5419 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5421 = _5417 || _5419;
            if (!_5421)
            {
                _5341 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5423 = _5341;
            _5343 = _5423;
            if (!_5421)
            {
                _5347 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5425 = _5347;
            _5349 = _5425;
            if (!_5421)
            {
                _5365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5427 = _5365;
            bool _5429 = !_5421;
            _5367 = _5427;
            if (!_5429)
            {
                bool _5431 = _5011 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5433 = isnan(_5011);
                bool _5435 = _5431 || _5433;
                bool _5437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5439 = _5435 || _5437;
                if (!_5439)
                {
                    float _5441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5443 = _5011 + _5441;
                    float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5445;
                    float _5449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5451 = _5449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5453 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5455 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5457 = 1.0 / _5447;
                    float _5459 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5461 = _5459 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5463 = _5443 * _5457;
                    float _5465 = precise::clamp(_5463, 0.0, 1.0);
                    float _5467 = fma(_5465, _5451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5469 = fma(_5465, _5455, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5471 = fma(_5465, _5461, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5349 = _5469;
                    _5343 = _5467;
                    _5367 = _5471;
                    _5411 = true;
                }
                else
                {
                    _5349 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5343 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5411 = false;
    float _5473 = _5349;
    float _5475 = _5343;
    float _5477 = _5367;
    float _5479 = _5359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_108.x = 0.0;
    float _5481 = _5473 * 0.586610972881317138671875;
    bool _5483 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_63.x = _5479;
    float _5485 = fma(_5475, 0.298911988735198974609375, _5481);
    bool _5487 = _4783 > 0.0;
    bool _5489 = isnan(_4783);
    bool _5491 = _5487 || _5489;
    bool _5493 = isnan(0.0);
    bool _5495 = _5491 || _5493;
    float _5497 = fma(_5477, 0.114477999508380889892578125, _5485);
    float _5499 = -_5497;
    float _5501 = _5499 + _5475;
    float _5503 = -_5497;
    float _5505 = _5503 + _5473;
    float _5507 = -_5497;
    float _5509 = _5507 + _5477;
    float _5511 = fma(_5501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    float _5513 = fma(_5505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    float _5515 = fma(_5509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5497);
    bool _5517 = !_5483;
    if (!_5517)
    {
        float _5519 = -_4528;
        float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5523 = -_4530;
        float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5527 = -_4532;
        float _5529 = _5527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5531 = _5521 * _5521;
        float _5533 = fma(_5525, _5525, _5531);
        float _5535 = fma(_5529, _5529, _5533);
        float _5537 = sqrt(_5535);
        float _5539 = rsqrt(_5535);
        float _5541 = -_5537;
        float _5543 = _5541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5545 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5547 = precise::clamp(_5545, 0.0, 1.0);
        float _5549 = _5525 * _5539;
        float _5551 = _5521 * _5539;
        float _5553 = abs(_5547);
        float _5555 = log2(_5553);
        float _5557 = _5529 * _5539;
        float _5559 = _5549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5561 = _5287 * _5551;
        float _5563 = -_5551;
        float _5565 = -_5559;
        float _5567 = fma(_5563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5565);
        float _5569 = fma(_5231, _5549, _5561);
        float _5571 = -_5557;
        float _5573 = fma(_5571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5567);
        float _5575 = fma(_5291, _5557, _5569);
        float _5577 = precise::clamp(_5575, 0.0, 1.0);
        float _5579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5581 = _5573 + _5579;
        float _5583 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5585 = _5581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5587 = precise::clamp(_5585, 0.0, 1.0);
        float _5589 = exp2(_5583);
        float _5591 = _5589 * _5587;
        float _5593 = _5577 * _5591;
        float _5595 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5597 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5599 = _5593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_108.x = _5595;
        out.m_108.y = _5597;
        out.m_108.z = _5599;
    }
    out.m_110.x = _5511;
    out.m_110.y = _5513;
    out.m_110.z = _5515;
    if (_5495)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5601;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

