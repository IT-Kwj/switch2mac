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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_98 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_59 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4729 = false;
    bool _801 = false;
    bool _621 = false;
    bool _441 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_56.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_59.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5028 = as_type<float>(_135);
        out.gl_Position.z = _5028;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_61.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_119);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _129;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5097 = as_type<float>(_173);
        out.gl_Position.z = _5097;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_66.x;
    float _179 = in.m_66.y;
    float _181 = in.m_66.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_68.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_119);
        float _243 = 1.0 / _241;
        float _245 = _153 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _247 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = in.m_70.x;
    float _271 = in.m_70.y;
    bool _273 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _275 = isnan(_247);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = 1.0 / _259;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _289 = 1.0 / _263;
    float _291 = 1.0 / _267;
    float _293 = _251 * _285;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _247 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = _297 * _289;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    bool _311 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_247);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -_321;
    float _327 = _325 + 1.0;
    float _329 = _255 * _291;
    float _331 = -_283;
    float _333 = _331 + 1.0;
    bool _335 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_247);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = _321 * _333;
    bool _349 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_247);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _345 * _327;
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _359 * _365;
    float _377 = fma(_369, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -_359;
    float _383 = _381 + 1.0;
    float _385 = _303 * _375;
    float _387 = _323 * _375;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _401 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_377, _361, _397);
    float _407 = fma(_379, _361, _399);
    float _409 = fma(_401, _347, _405);
    float _411 = fma(_403, _347, _407);
    float _413 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[146].x, _409);
    float _415 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[146].y, _411);
    float _417 = _413 * _269;
    float _419 = _415 * _271;
    bool _421 = !_287;
    float _439;
    if (!_421)
    {
        float _423 = in.m_68.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_119);
        float _445 = 1.0 / _443;
        float _447 = _153 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _449 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _463 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = isnan(_449);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _479 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = isnan(_449);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _457;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -_473;
    float _499 = _497 + 1.0;
    bool _501 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _503 = isnan(_449);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _515 = 1.0 / _461;
    float _517 = 1.0 / _477;
    float _519 = _495 * _491;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = _489 * _499;
    float _527 = -_489;
    float _529 = _527 + 1.0;
    float _531 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _533;
    float _537 = _511 * _529;
    float _539 = _523 * _515;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _449 + _541;
    bool _545 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _547 = isnan(_449);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = _531 * _537;
    float _559 = -_511;
    float _561 = _559 + 1.0;
    float _563 = fma(_539, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _567 = _449 + _565;
    float _569 = _535 * _517;
    float _571 = -_555;
    float _573 = _571 + 1.0;
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _557);
    float _577 = fma(_569, _567, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _579 = _473 * _573;
    float _581 = fma(_563, _525, _575);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _585 = fma(_577, _579, _581);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _593 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[118].x, _585);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _599 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _601 = !_513;
    float _619;
    if (!_601)
    {
        float _603 = in.m_68.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_119);
        float _625 = 1.0 / _623;
        float _627 = _153 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _645 = isnan(_629);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _659 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _661 = isnan(_629);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = 1.0 / _637;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _673;
    float _677 = -_653;
    float _679 = _677 + 1.0;
    bool _681 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _683 = isnan(_629);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _695 = 1.0 / _641;
    float _697 = 1.0 / _657;
    float _699 = _675 * _671;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _705 = _669 * _679;
    float _707 = -_669;
    float _709 = _707 + 1.0;
    float _711 = fma(_699, _633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _713;
    float _717 = _691 * _709;
    float _719 = _703 * _695;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _723 = _629 + _721;
    bool _725 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _727 = isnan(_629);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = _711 * _717;
    float _739 = -_691;
    float _741 = _739 + 1.0;
    float _743 = fma(_719, _723, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _747 = _629 + _745;
    float _749 = _715 * _697;
    float _751 = -_735;
    float _753 = _751 + 1.0;
    float _755 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _737);
    float _757 = fma(_749, _747, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _759 = _653 * _753;
    float _761 = fma(_743, _705, _755);
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _765 = fma(_757, _759, _761);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _771 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[134].x, _765);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _781 = !_693;
    float _799;
    if (!_781)
    {
        float _783 = in.m_68.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[14].x, _153);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_119);
        float _805 = 1.0 / _803;
        float _807 = _153 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = in.m_56.x;
    float _813 = in.m_56.y;
    float _815 = in.m_56.z;
    float _817 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _819 = _817 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _821 = _813 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _823 = _813 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _825 = _813 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _821);
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _823);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _825);
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[5].z, _827);
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[4].z, _829);
    float _837 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[6].z, _831);
    float _839 = _833 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _841 = _835 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _843 = _837 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _839 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _841 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _843 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = sqrt(_861);
    float _865 = rsqrt(_861);
    float _867 = _863 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _869 = precise::min(_819, _867);
    float _871 = _865 * _869;
    float _873 = _851 * _871;
    float _875 = _855 * _871;
    float _877 = -_873;
    float _879 = _841 + _877;
    float _881 = -_875;
    float _883 = _843 + _881;
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _887 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _889 = floor(_885);
    float _891 = floor(_887);
    float _893 = -_889;
    float _895 = _885 + _893;
    float _897 = -_891;
    float _899 = _887 + _897;
    float2 _6272 = float2(_895, _899);
    float _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6272, float2(0.0), isnan(_6272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6272, float2(0.0), isnan(_6272)), level(0.0)).x;
    float _903 = in.m_68.x;
    float _905 = in.m_68.y;
    float _907 = in.m_68.z;
    float _909 = in.m_68.w;
    float _911 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _913 = log2(_911);
    float _915 = _847 * _871;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _933 = _931 != 0;
    float _935 = 1.0 / _925;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _939 = -_873;
    float _941 = _851 + _939;
    float _943 = -_875;
    float _945 = _855 + _943;
    float _947 = 1.0 / _919;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _953 = _903 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _955 = _903 * 2.0;
    float _957 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _959 = -_921;
    float _961 = fma(_953, 2.0, _959);
    float _963 = 1.0 / _929;
    float _965 = _905 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _967 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _957);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _973 = fma(_965, -2.0, _937);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _975;
    float _979 = 1.0 / _951;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _985 = _977 * _935;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _987;
    float _991 = _983 * _947;
    float _993 = 1.0 / _971;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _999;
    float _1003 = _903 + _905;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1009 = _989 * _963;
    float _1011 = _907 * 2.0;
    float _1013 = _1003 + (-1.0);
    float _1015 = floor(_955);
    float _1017 = _1007 * _979;
    bool _1019 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1021 = isnan(_809);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1033 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1035 = isnan(_809);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = _907 + _905;
    float _1047 = -_153;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[76].x, _961);
    float _1051 = 1.0 / _997;
    float _1053 = _1001 * _993;
    float _1055 = _907 + _903;
    float _1057 = -_1043;
    float _1059 = _1057 + 1.0;
    float _1061 = _1045 + (-1.0);
    float _1063 = _1055 + (-1.0);
    float _1065 = float(_119);
    float _1067 = floor(_1011);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1073 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1075 = isnan(_809);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1087 = _1015 > 0.0;
    float _1089 = _1029 * _1059;
    bool _1091 = _1015 >= 0.0;
    bool _1093 = isnan(_1015);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.0);
    bool _1099 = _1095 || _1097;
    float _1101 = -_1083;
    float _1103 = _1101 + 1.0;
    float _1105 = _1071 * _1051;
    float _1107 = -_1029;
    float _1109 = _1107 + 1.0;
    float _1111 = _905 * 2.0;
    float _1113 = _1043 * _1103;
    bool _1115 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1117 = isnan(_809);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1129 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1131 = isnan(_809);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = 1.0 / _1065;
    bool _1143 = _1067 >= 0.0;
    bool _1145 = isnan(_1067);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = _1125 * _1109;
    float _1155 = -_1125;
    float _1157 = _1155 + 1.0;
    bool _1159 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1161 = isnan(_809);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1167 = _1163 || _1165;
    int _1169 = _1167 ? 1065353216 : 0;
    float _1171 = -_1139;
    float _1173 = _1171 + 1.0;
    float _1175 = _1139 * _1157;
    float _1177 = floor(_1111);
    float _1179 = as_type<float>(_1169) * _1173;
    float _1181 = -as_type<float>(_1169);
    float _1183 = _1181 + 1.0;
    int _1185 = _1169;
    float _1187 = _839;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_933)
    {
        _1185 = 0;
    }
    int _1191 = _1185;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1195 = _809 + _1193;
    int _1197 = _1191;
    if (!_933)
    {
        _1197 = 1;
    }
    int _1199 = _1197;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1203 = _1067 > 0.0;
    float _1205 = fma(_985, _1195, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1207 = _1099 ? 0 : 1;
    float _1209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1211 = int(_1209);
    bool _1213 = _1199 != 1;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1217 = _809 + _1215;
    bool _1219 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1221 = isnan(_809);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = _1141 * _153;
    int _1233 = ~_1207;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = fma(_991, _1217, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1241 = _1177 > 0.0;
    float _1243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1245 = int(_1243);
    bool _1247 = _1177 >= 0.0;
    bool _1249 = isnan(_1177);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan(0.0);
    bool _1255 = _1251 || _1253;
    float _1257 = _1229 * _1183;
    float _1259 = -_1229;
    float _1261 = _1259 + 1.0;
    int _1263 = _1151 ? 0 : 1;
    float _1265 = _1205 * _1257;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1269 = _809 + _1267;
    float _1271 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _967);
    int _1273 = ~_1263;
    int _1275 = _1273 + 1;
    int _1277 = _1275 + 1;
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1265);
    int _1281 = _1277;
    float _1283 = _1269;
    int _1285 = _1237;
    if (!_1203)
    {
        int _1287 = ~_1263;
        int _1289 = _1287 + 1;
        _1281 = _1289;
    }
    int _1291 = _1281;
    float _1293 = fma(_1009, _1269, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1301 = _1299 != 0;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1305 = _1303 != 0;
    float _1307 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _973);
    float _1309 = fma(_1239, _1179, _1279);
    if (!_1213)
    {
        _1283 = _905;
    }
    float _1311 = _1283;
    float _1313 = _905 + (-0.5);
    bool _1315 = !_1301;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1321 = !_1297;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = sqrt(_1271);
    bool _1327 = !_1305;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1335 = _1333 != 0;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1343 = _1341 != 0;
    float _1345 = _1311;
    if (_1213)
    {
        _1345 = _903;
    }
    float _1347 = _1345;
    float _1349 = float(_1245);
    float _1351 = as_type<float>(_1245);
    float _1353 = _1347;
    if (!_1213)
    {
        _1351 = _905;
    }
    float _1355 = _1351;
    float _1357 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1319);
    float _1359 = _1355;
    if (_1213)
    {
        _1359 = _903;
    }
    float _1361 = _1359;
    bool _1363 = !_1335;
    float _1365 = _1363 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1367 = 1.0 / _1349;
    float _1369 = _1365;
    if (!_1213)
    {
        _1353 = _907;
    }
    float _1371 = _1353;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1375 = _1371;
    if (!_1087)
    {
        int _1377 = ~_1207;
        int _1379 = _1377 + 1;
        _1285 = _1379;
    }
    int _1381 = _1285;
    float _1383 = _1325 * 50.0;
    if (_1213)
    {
        _1375 = _905;
    }
    float _1385 = _1375;
    int _1387 = abs(as_type<int>(_1365));
    float _1389 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1391 = float(_1291);
    float _1393 = _913 * _153;
    int _1395 = _1255 ? 0 : 1;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1399 = float(_1211);
    float _1401 = fma(_1389, -2.0, _1201);
    float _1403 = float(_1387);
    float _1405 = exp2(_1393);
    int _1407 = ~_1395;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = -_1397;
    float _1415 = fma(_1373, 2.0, _1413);
    int _1417 = _1411;
    if (!_1241)
    {
        int _1419 = ~_1395;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    float _1425 = _1403 * _1391;
    float _1427 = in.m_72.x;
    float _1429 = in.m_72.y;
    float _1431 = in.m_72.z;
    if (!_1213)
    {
        _1369 = _907;
    }
    float _1433 = _1369;
    float _1435 = 1.0 / _1399;
    float _1437 = _1433;
    if (_1213)
    {
        _1437 = _905;
    }
    float _1439 = _1437;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1443 = _1367 * _153;
    bool _1445 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1453 = _1449 || _1451;
    float _1455 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1441);
    float _1457 = -_1405;
    float _1459 = _1457 + 1.0;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1463 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1455);
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1467 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1469 = isnan(1.0);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1475 = _1471 || _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1479 = 1.0 + _1477;
    float _1481 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1483 = _1435 * _153;
    bool _1485 = !_1339;
    int _1487 = _1485 ? 0 : 1;
    float _1489 = 1.0 / _1479;
    float _1491 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1465);
    float _1493 = _1453 ? _1459 : 0.0;
    float _1495 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1357);
    float _1497 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1481);
    float _1499 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1491);
    float _1501 = -_153;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1415);
    float _1505 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1401);
    float _1507 = float(_1381);
    float _1509 = _903 + (-0.5);
    int _1511 = abs(_1487);
    float _1513 = _1425 * (-2.0);
    bool _1515 = !_1343;
    int _1517 = _1515 ? 0 : 1;
    float _1519 = float(_1423);
    float _1521 = _1483;
    if (_1475)
    {
        float _1523 = _1493 * _1489;
        _157 = _1523;
    }
    float _1525 = _157;
    float _1527 = fma(_1513, _1427, _1427);
    float _1529 = float(_1511);
    float _1531 = fma(_1031, _1513, _1031);
    int _1533 = abs(_1517);
    float _1535 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1527);
    float _1537 = _1529 * _1507;
    float _1539 = float(_1533);
    float _1541 = fma(_1531, _1525, _1535);
    float _1543 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1545 = _1537 * (-2.0);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1549 = _809 + _1547;
    float _1551 = _1539 * _1519;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1557 = fma(_1545, _1429, _1429);
    float _1559 = fma(_1017, _1549, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1561 = fma(_1293, _1175, _1309);
    float _1563 = fma(_1127, _1545, _1127);
    float _1565 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1557);
    float _1567 = _1551 * (-2.0);
    float _1569 = 1.0 / _1555;
    float _1571 = fma(_1559, _1153, _1561);
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _809 + _1573;
    float _1577 = fma(_1085, _1567, _1085);
    float _1579 = fma(_1567, _1431, _1431);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1583 = _809 + _1581;
    float _1585 = _907 + (-0.5);
    float _1587 = fma(_1105, _1575, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1589 = fma(_1563, _1525, _1565);
    float _1591 = fma(_1053, _1583, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1593 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1579);
    float _1595 = -_915;
    float _1597 = _839 + _1595;
    float _1599 = fma(_1591, _1089, _1571);
    float _1601 = fma(_1577, _1525, _1593);
    float _1603 = _1589 * 0.15915493667125701904296875;
    bool _1605 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1607 = isnan(_809);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = fma(_1587, _1113, _1599);
    float _1619 = -_915;
    float _1621 = _847 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1623;
    float _1627 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1629 = -_1615;
    float _1631 = _1629 + 1.0;
    float _1633 = _1621 * _1621;
    float _1635 = _1625 * _1569;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1639 = _809 + _1637;
    float _1641 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1627);
    float _1643 = fma(_941, _941, _1633);
    float _1645 = _1083 * _1631;
    float _1647 = fma(_1635, _1639, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1649 = _1541 * 0.15915493667125701904296875;
    float _1651 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1641);
    float _1653 = fma(_945, _945, _1643);
    float _1655 = fma(_1647, _1645, _1617);
    float _1657 = _1649 * 6.283185482025146484375;
    float _1659 = sin(_1657);
    float _1661 = _1601 * 0.15915493667125701904296875;
    float _1663 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1665 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1667 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1655);
    float _1669 = _1597 + _1543;
    float _1671 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1663);
    float _1673 = _1649 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = _1667 * _1383;
    float _1679 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1671);
    float _1681 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1683 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1685 = _1677 * _1677;
    float _1687 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1689 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1681);
    float _1691 = _1603 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1683);
    float _1697 = _1687 + _1665;
    float _1699 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1689);
    float _1701 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1695);
    float _1703 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1705 = _1603 * 6.283185482025146484375;
    float _1707 = cos(_1705);
    float _1709 = sqrt(_1653);
    float _1711 = _1675 * _1693;
    float _1713 = _1659 * _1693;
    float _1715 = _1661 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = _1659 * _1707;
    float _1721 = _1675 * _1707;
    float _1723 = 1.0 / _1665;
    float _1725 = _865 * _1709;
    float _1727 = _1331 * _1725;
    float _1729 = _817 * _1725;
    float _1731 = _1661 * 6.283185482025146484375;
    float _1733 = cos(_1731);
    float _1735 = -_1711;
    float _1737 = fma(_1717, _1719, _1735);
    float _1739 = -_1719;
    float _1741 = fma(_1717, _1711, _1739);
    float _1743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1745 = fma(_1717, _1721, _1713);
    float _1747 = fma(_1717, _1713, _1721);
    float _1749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1751 = _1697 * _1723;
    float _1753 = _1751 * 0.5;
    float _1755 = _1727 * _1743;
    float _1757 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1759 = _1729 * _1749;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1761);
    float _1765 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1767 = _1765 * 0.5;
    float _1769 = -_1755;
    float _1771 = _1717 * _1769;
    float _1773 = trunc(_1703);
    int _1775 = int(_1773);
    float _1777 = _1675 * _1733;
    float _1779 = _1659 * _1733;
    float _1781 = _1707 * _1733;
    float _1783 = _1693 * _1733;
    float _1785 = _1777 * _1755;
    float _1787 = _1779 * _1755;
    float _1789 = fma(_1781, _1759, _1771);
    float _1791 = 1.0 / _1763;
    float _1793 = fma(_1745, _1759, _1785);
    float _1795 = fma(_1737, _1759, _1787);
    float _1797 = fma(_1783, _1767, _1789);
    float _1799 = fma(_1741, _1767, _1793);
    float _1801 = fma(_1747, _1767, _1795);
    float _1803 = trunc(_1757);
    int _1805 = int(_1803);
    float _1807 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1809 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1811 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1813 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1815 = _1775 + _1813;
    int _1817 = _1815 + 1;
    float _1819 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1807);
    float _1821 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1811);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1827 = _1791 * _1825;
    float _1829 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1819);
    float _1831 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1821);
    float _1833 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1823);
    float _1835 = rsqrt(_1685);
    bool _1837 = _1827 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1839 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1841 = _1827 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1843 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1845 = !_1837;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1851 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1853 = _1805 + _1851;
    int _1855 = _1853 + 1;
    float _1857 = _843 + _1843;
    float _1859 = _1839 * _1839;
    float _1861 = _841 + _1839;
    int _1863 = _1817 | _1855;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1857 + _1865;
    float _1869 = fma(_1849, _1849, _1859);
    int _1871 = 2;
    int _1873 = _1817;
    int _1875 = _1855;
    float _1877 = _1859;
    float _1879 = _1861;
    float _1881 = _1857;
    float _1883 = _1839;
    float _1885 = _1843;
    float _1887 = _1703;
    if (!_1837)
    {
        _1871 = 1;
    }
    int _1889 = _1871;
    float _1891 = _1843 * _1843;
    int _1893 = _1889;
    float _1895 = _1891;
    if (!_1841)
    {
        _1893 = _1847;
    }
    int _1897 = _1893;
    float _1899 = _1867 * _1867;
    bool _1901 = _1817 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1905 = _1861 + _1903;
    int _1907 = _1897 << 6;
    float _1909 = _1891 + _1869;
    bool _1911 = _1863 < 0;
    bool _1913 = _1911 || _1901;
    float _1915 = fma(_1905, _1905, _1899);
    int _1917 = _1907 + 48;
    uint _1920 = uint(int(uint(_1917) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    float _1936 = sqrt(_1685);
    bool _1938 = _1855 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1940 = _1938 || _1913;
    float _1942 = _1677 * _1835;
    int _1944 = _1907 + 56;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    uint _1948 = uint(int(uint(int(_1946)) >> uint(2)));
    int _1950 = int(_1946) & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = int(_1946) + 1;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    int _1958 = _1954 & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    float _1962 = rsqrt(_1909);
    float _1964 = as_type<float>(_1897);
    if (!_1940)
    {
        int _1966 = _1855 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1968 = _1966 + _1817;
        _1873 = _1968;
    }
    int _1970 = _1873;
    int _1972 = _1907 + 64;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
    float _1990 = sqrt(_1915);
    if (!_1940)
    {
        int _1992 = _1970 << 2;
        _1875 = _1992;
    }
    int _1994 = _1875;
    int _1996 = _1907 + 72;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
    int _2002 = int(_1998) & 3;
    float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
    int _2006 = int(_1998) + 1;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    int _2010 = _2006 & 3;
    float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
    float _2014 = _1849 * _1962;
    int _2016 = as_type<int>(_1962);
    int _2018 = _1994;
    if (!_1940)
    {
        uint _2020 = uint(int(uint(_1970) >> uint(2)));
        _2016 = int(_2020);
    }
    int _2022 = _2016;
    float _2024 = as_type<float>(_2022);
    if (!_1940)
    {
        int _2026 = 12 & _1994;
        _2018 = _2026;
    }
    int _2028 = _2018;
    float _2030 = _1942 * _2014;
    int _2032 = _1907 + 96;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c15)._m0[int(_2036)][_2038];
    int _2042 = int(_2034) + 1;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    int _2046 = _2042 & 3;
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[int(_2044)][_2046];
    bool _2050 = _1990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2030 * _1936;
    if (!_1940)
    {
        int _2054 = _2022 << 4;
        int _2056 = _2054 + _2028;
        _2024 = as_type<float>(_2056);
    }
    float _2058 = _2024;
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2062 = _2060 != 0;
    int _2064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2066 = _2064 != 0;
    int _2068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2070 = _2068 != 0;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2074 = _2072 != 0;
    float _2076 = fma(_1942, _2052, _1849);
    int _2078 = _1907 + 104;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c15)._m0[int(_2090)][_2092];
    bool _2096 = !_2066;
    int _2098 = _2096 ? 0 : 1;
    float _2100 = _839 + _2076;
    bool _2102 = !_2062;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = !_2070;
    int _2108 = _2106 ? 0 : 1;
    bool _2110 = !_2074;
    int _2112 = _2110 ? 0 : 1;
    bool _2114 = !_2050;
    float _2116 = _2100;
    float _2118 = _1926;
    if (!_2114)
    {
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2124 = _1990 + _2122;
        float _2126 = rsqrt(_1915);
        float _2128 = _2124 * _2120;
        float _2130 = _2100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2132 = _2128 * 0.15915493667125701904296875;
        float _2134 = _2132 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = _2132 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        float _2142 = fma(_2136, _2130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2144 = _2126 * _2142;
        float _2146 = _2140 + (-1.0);
        float _2148 = fma(_1905, _2144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2150 = fma(_1867, _2144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2152 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2154 = -_841;
        float _2156 = _2154 + _2148;
        float _2158 = -_843;
        float _2160 = _2158 + _2150;
        float _2162 = fma(_2100, _2140, _2152);
        float _2164 = _2156 * _2156;
        float _2166 = _2160 * _2160;
        _2116 = _2162;
        _1877 = _2164;
        _1895 = _2166;
        _1879 = _2148;
        _1881 = _2150;
        _1883 = _2156;
        _1885 = _2160;
    }
    float _2168 = _2116;
    float _2170 = _1877;
    float _2172 = _1895;
    float _2174 = _1879;
    float _2176 = _1881;
    float _2178 = _1883;
    float _2180 = _1885;
    int _2182 = _1907 + 80;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
    float _2200 = -_839;
    float _2202 = _2200 + _2168;
    float _2204 = _1669 * _2048;
    if (!_1940)
    {
        float _2206 = floor(_1703);
        _1187 = _2206;
    }
    float _2208 = _1187;
    float _2210 = _1669 * _1934;
    float _2212 = fma(_2202, _2202, _2170);
    float _2214 = fma(_879, _2040, _2204);
    float _2216 = _1669 * _1988;
    int _2218 = _1907 + 88;
    uint _2220 = uint(int(uint(_2218) >> uint(2)));
    uint _2222 = uint(int(uint(int(_2220)) >> uint(2)));
    int _2224 = int(_2220) & 3;
    float _2226 = (*spvDescriptorSet0.vp_c15)._m0[int(_2222)][_2224];
    int _2228 = int(_2220) + 1;
    uint _2230 = uint(int(uint(_2228) >> uint(2)));
    int _2232 = _2228 & 3;
    float _2234 = (*spvDescriptorSet0.vp_c15)._m0[int(_2230)][_2232];
    float _2236 = _2212 + _2172;
    float _2238 = fma(_883, _2086, _2214);
    float _2240 = fma(_879, _1926, _2210);
    float _2242 = _2214;
    float _2244 = _2240;
    if (!_1940)
    {
        float _2246 = floor(_1757);
        _2242 = _2246;
    }
    float _2248 = _2242;
    float _2250 = fma(_879, _1980, _2216);
    float _2252 = _2238 + _2094;
    float _2254 = fma(_883, _1952, _2240);
    float _2256 = _2058;
    float _2258 = _2254;
    if (!_1940)
    {
        int _2260 = as_type<int>(_2058) + 400;
        uint _2262 = uint(int(uint(_2260) >> uint(2)));
        uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
        int _2266 = int(_2262) & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        _2256 = _2268;
    }
    float _2270 = _2256;
    float _2272 = fma(_883, _2004, _2250);
    float _2274 = -_873;
    float _2276 = _2274 + _2174;
    float _2278 = sqrt(_2236);
    bool _2280 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2282 = isnan(0.5);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2288 = _2284 || _2286;
    float _2290 = -_915;
    float _2292 = _2290 + _2168;
    float _2294 = -_875;
    float _2296 = _2294 + _2176;
    float _2298 = _2254 + _1960;
    float _2300 = _2272 + _2012;
    float _2302 = 1.0 / _2252;
    bool _2304 = _2278 > 0.0;
    bool _2306 = !_2304;
    float _2308 = _2276;
    float _2310 = _2292;
    float _2312 = _2296;
    if (!_2306)
    {
        float _2314 = _215 * _215;
        float _2316 = fma(_213, _213, _2314);
        float _2318 = rsqrt(_2236);
        float _2320 = fma(_217, _217, _2316);
        float _2322 = sqrt(_2320);
        float _2324 = _2318 * _2178;
        float _2326 = _2202 * _2318;
        float _2328 = _2318 * _2180;
        bool _2330 = _2322 > 0.0;
        bool _2332 = !_2330;
        _2244 = _2318;
        _2118 = _2320;
        _2258 = _2322;
        if (!_2332)
        {
            float _2334 = rsqrt(_2320);
            float _2336 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2338 = _215 * _2334;
            float _2340 = _213 * _2334;
            float _2342 = _2326 * _2338;
            float _2344 = _217 * _2334;
            float _2346 = fma(_2324, _2340, _2342);
            float _2348 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2350 = fma(_2328, _2344, _2346);
            float _2352 = _2350 * _2348;
            float _2354 = fma(_213, _2352, _2276);
            float _2356 = fma(_215, _2352, _2292);
            float _2358 = fma(_217, _2352, _2296);
            _2308 = _2354;
            _2310 = _2356;
            _2312 = _2358;
            _2244 = _2352;
            _2118 = _2334;
            _2258 = _2344;
        }
    }
    float _2360 = _2308;
    float _2362 = _2310;
    float _2364 = _2312;
    float _2366 = _2244;
    float _2368 = _2118;
    float _2370 = _2258;
    float _2372 = _2368;
    float _2374 = _2366;
    float _2376 = _2370;
    if (_2288)
    {
        _2372 = _2360;
    }
    float _2378 = _2372;
    float _2380 = _2378;
    if (_2288)
    {
        _2374 = _2362;
    }
    float _2382 = _2374;
    float _2384 = _2382;
    if (_2288)
    {
        _2376 = _2364;
    }
    float _2386 = _2376;
    float _2388 = _2386;
    if (!_2288)
    {
        float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2392 = _1597 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2396 = _879 + _2394;
        float _2398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = -_879;
        float _2402 = _2400 + _2360;
        float _2404 = _2392 * _2392;
        float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2408 = _883 + _2406;
        float _2410 = -_1597;
        float _2412 = _2410 + _2362;
        float _2414 = fma(_2396, _2396, _2404);
        float _2416 = -_883;
        float _2418 = _2416 + _2364;
        float _2420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2422 = fma(_2408, _2408, _2414);
        float _2424 = sqrt(_2422);
        float _2426 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = precise::min(_2424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2430 = _2428 * _2420;
        float _2432 = _2426 * _2430;
        float _2434 = fma(_2402, _2432, _879);
        float _2436 = fma(_2412, _2432, _1597);
        float _2438 = fma(_2418, _2432, _883);
        _2384 = _2436;
        _2380 = _2434;
        _2388 = _2438;
    }
    float _2440 = _2384;
    float _2442 = _2380;
    float _2444 = _2388;
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2448 = _2298 * _2302;
    float _2450 = _2300 * _2302;
    float _2452 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2446);
    bool _2458 = _2448 >= 0.0;
    float _2460 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2452);
    float _2462 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2464 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2456);
    bool _2466 = _2448 <= 1.0;
    bool _2468 = _2466 && _2458;
    float _2470 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2460);
    float _2472 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2462);
    float _2474 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2476 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2478 = _2470 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2480 = _2472 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2482 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2474);
    float _2484 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2486 = _2450 >= 0.0;
    bool _2488 = _2486 && _2468;
    float _2490 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2494 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2496 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2484);
    bool _2498 = _2450 <= 1.0;
    bool _2500 = _2498 && _2488;
    float _2502 = -_2492;
    float _2504 = fma(_2502, _2490, 1.0);
    float _2506 = _2494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2508 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2496);
    float _2510 = _1669 * _2198;
    float _2512 = log2(_2504);
    float _2514 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2516 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2518 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2520 = fma(_879, _2190, _2510);
    float _2522 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2514);
    float _2524 = _2504;
    if (!_1940)
    {
        float _2526 = -_2208;
        float _2528 = _1703 + _2526;
        _1887 = _2528;
    }
    float _2530 = _1887;
    float _2532 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2518);
    float _2534 = 1.0 / _2516;
    if (_2500)
    {
        float _2536 = float(_1897);
        _1964 = _2536;
    }
    float _2538 = _1964;
    float _2540 = fma(_883, _2226, _2520);
    float _2542 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2532);
    float _2544 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2522);
    if (!_1940)
    {
        float _2546 = -_2248;
        float _2548 = _1757 + _2546;
        _2524 = _2548;
    }
    float _2550 = _2524;
    float _2552 = _2540 + _2234;
    float _2554 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2542);
    float _2556 = _2364;
    if (!_1940)
    {
        float _2558 = rint(_2270);
        float _2560 = precise::max(_2558, 0.0);
        uint _2562 = uint(_2560);
        uint _2564 = clamp(_2562, 0u, 65535u);
        _2556 = as_type<float>(_2564);
    }
    float _2566 = _2556;
    float _2568 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2544);
    float _2570 = _2512 * 0.693147182464599609375;
    float _2572 = _2552 * _2302;
    float _2574 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2576 = _2518;
    if (_2500)
    {
        float _2578 = rint(_2538);
        float _2580 = precise::max(_2578, 0.0);
        uint _2582 = uint(_2580);
        uint _2584 = clamp(_2582, 0u, 65535u);
        _2576 = as_type<float>(_2584);
    }
    float _2586 = _2576;
    float _2588 = _2554 * _2534;
    float _2590 = _2568 * _2534;
    float _2592 = fma(_2588, 0.5, 0.5);
    float _2594 = fma(_2590, -0.5, 0.5);
    float _2596 = _2550;
    if (!_1940)
    {
        float3 _8946 = float3(_2530, _2550, float(as_type<int>(_2566)));
        float3 _8950 = select(_8946, float3(0.0), isnan(_8946));
        float _2598 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8950.xy, uint(rint(_8950.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8950.xy, uint(rint(_8950.z)), level(0.0)).x;
        _2596 = _2598;
    }
    float _2600 = _2596;
    float _2602 = _2450;
    if (_2500)
    {
        float3 _8965 = float3(_2448, _2450, float(as_type<int>(_2586)));
        float3 _8967 = select(_8965, float3(0.0), isnan(_8965));
        float _2604 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8967.xy, uint(rint(_8967.z)), _2572, level(0.0));
        _2602 = _2604;
    }
    float _2606 = _2602;
    float3 _8977 = float3(_2592, _2594, _2574);
    float _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8977, float3(0.0), isnan(_8977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8977, float3(0.0), isnan(_8977)), level(0.0)).x;
    float3 _8986 = float3(_2592, _2594, _2574);
    float4 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8986, float3(0.0), isnan(_8986)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8986, float3(0.0), isnan(_8986)), level(0.0)).xyzw;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = _2611.w;
    float _2621 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2623 = int(_2621);
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2627 = _2625 != 0;
    int _2629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2631 = _2629 != 0;
    int _2633 = abs(_1323);
    int _2635 = abs(_1329);
    float _2637 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2639 = int(_2637);
    int _2641 = abs(_2098);
    int _2643 = abs(_2104);
    if (_2627)
    {
        float _2645 = in.m_68.x;
        _1189 = _2645;
    }
    float _2647 = _1189;
    float _2649 = float(uint(_2623));
    float _2651 = trunc(_1483);
    int _2653 = int(_2651);
    float _2655 = _2647;
    if (!_2627)
    {
        float _2657 = in.m_68.y;
        _2655 = _2657;
    }
    float _2659 = _2655;
    int _2661 = ~_2623;
    int _2663 = _2661 + 1;
    float _2665 = float(uint(_2639));
    float _2667 = 1.0 / _2649;
    float _2669 = trunc(_1443);
    int _2671 = int(_2669);
    float _2673 = float(uint(_2653));
    int _2675 = ~_2639;
    int _2677 = _2675 + 1;
    if (_2627)
    {
        _1521 = 1.0;
    }
    float _2679 = _1521;
    float _2681 = _2679;
    if (!_2627)
    {
        _2681 = 1.2345600128173828125;
    }
    float _2683 = _2681;
    float _2685 = 1.0 / _2665;
    int _2687 = as_type<int>(_2667) + (-2);
    int _2689 = ~_2623;
    int _2691 = _2689 + 1;
    float _2693 = _2659 * _2683;
    float _2695 = as_type<float>(_2687) * _2673;
    float _2697 = float(uint(_2671));
    float _2699 = floor(_2693);
    int _2701 = as_type<int>(_2685) + (-2);
    float _2703 = trunc(_2695);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    float _2709 = as_type<float>(_2701) * _2697;
    float _2711 = _2697;
    if (_2627)
    {
        _2711 = 1.0;
    }
    float _2713 = _2711;
    float _2715 = _2713;
    if (!_2627)
    {
        _2715 = 7.345489978790283203125;
    }
    float _2717 = _2715;
    float _2719 = -_2699;
    float _2721 = _2693 + _2719;
    float _2723 = trunc(_2709);
    float _2725 = precise::max(_2723, 0.0);
    uint _2727 = uint(_2725);
    float _2729 = _2717 * _903;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2733 = _2731 != 0;
    int _2735 = _2691 * int(_2707);
    int _2737 = _2735 + _2653;
    float _2739 = floor(_2729);
    float _2741 = float(uint(_2737));
    int _2743 = _2677 * int(_2727);
    int _2745 = _2743 + _2671;
    float _2747 = as_type<float>(_2687) * _2741;
    float _2749 = float(uint(_2745));
    float _2751 = trunc(_2747);
    float _2753 = precise::max(_2751, 0.0);
    uint _2755 = uint(_2753);
    float _2757 = -_2739;
    float _2759 = _2729 + _2757;
    float _2761 = float(_2623);
    float _2763 = as_type<float>(_2701) * _2749;
    float _2765 = trunc(_2763);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    bool _2771 = !_2733;
    int _2773 = _2771 ? 0 : 1;
    int _2775 = int(_2707) + int(_2755);
    float _2777 = _2759 * _2761;
    float _2779 = float(_2653);
    int _2781 = ~_2639;
    int _2783 = _2781 + 1;
    int _2785 = _2663 * _2775;
    int _2787 = _2785 + _2653;
    int _2789 = int(_2727) + int(_2769);
    float _2791 = trunc(_2777);
    int _2793 = int(_2791);
    bool _2795 = _2779 >= _2761;
    bool _2797 = isnan(_2779);
    bool _2799 = _2795 || _2797;
    bool _2801 = isnan(_2761);
    bool _2803 = _2799 || _2801;
    float _2805 = float(_2803);
    bool _2807 = uint(_2787) >= uint(_2623);
    int _2809 = _2783 * _2789;
    int _2811 = _2809 + _2671;
    float _2813 = float(_2639);
    float _2815 = float(_2671);
    float _2817 = trunc(_2805);
    int _2819 = int(_2817);
    bool _2821 = !_2807;
    int _2823 = _2821 ? 0 : (-1);
    bool _2825 = _2815 >= _2813;
    bool _2827 = isnan(_2815);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(_2813);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    bool _2837 = uint(_2811) >= uint(_2639);
    int _2839 = abs(_2773);
    float _2841 = _2761 * _1231;
    int _2843 = ~_2775;
    int _2845 = _2843 + _2823;
    int _2847 = _2845 + 1;
    float _2849 = trunc(_2835);
    int _2851 = int(_2849);
    float _2853 = _2813 * _1231;
    float _2855 = _2721 * _2813;
    bool _2857 = !_2837;
    int _2859 = _2857 ? 0 : (-1);
    int _2861 = _2793 * _2839;
    int _2863 = _2861 + _2653;
    bool _2865 = _2623 == 0;
    int _2867 = _2623 * _2847;
    int _2869 = _2867 + _2653;
    int _2871 = ~_2789;
    int _2873 = _2871 + _2859;
    int _2875 = _2873 + 1;
    float _2877 = trunc(_2841);
    int _2879 = int(_2877);
    int _2881 = ~_2819;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    bool _2887 = !_2865;
    int _2889 = _2887 ? _2869 : (-1);
    int _2891 = _2639 * _2875;
    int _2893 = _2891 + _2671;
    bool _2895 = _2639 == 0;
    int _2897 = _2623 + (-1);
    int _2899 = _2889 * _2885;
    int _2901 = abs(_1317);
    int _2903 = ~_2851;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    int _2909 = _2819 * _2897;
    int _2911 = _2909 + _2899;
    bool _2913 = !_2895;
    int _2915 = _2913 ? _2893 : (-1);
    int _2917 = _2639 + (-1);
    int _2919 = _2915 * _2907;
    int _2921 = _2851 * _2917;
    int _2923 = _2921 + _2919;
    bool _2925 = !_2631;
    int _2927 = _2925 ? 0 : 1;
    int _2929 = _2911 * _2901;
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2933 = _2931 != 0;
    float _2935 = trunc(_2855);
    int _2937 = int(_2935);
    int _2939 = _2923 * _2641;
    int _2941 = _2879 * _2633;
    int _2943 = _2941 + _2929;
    int _2945 = abs(_2927);
    bool _2947 = !_2933;
    int _2949 = _2947 ? 0 : 1;
    int _2951 = _2863 * _2635;
    int _2953 = _2951 + _2943;
    float _2955 = trunc(_2853);
    int _2957 = int(_2955);
    bool _2959 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2961 = isnan(0.5);
    bool _2963 = _2959 || _2961;
    bool _2965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2967 = _2963 || _2965;
    int _2969 = _2793 * _2945;
    int _2971 = _2969 + _2953;
    int _2973 = abs(_2949);
    float _2975 = float(uint(_2971));
    int _2977 = _2937 * _2973;
    int _2979 = _2977 + _2671;
    int _2981 = abs(_2108);
    int _2983 = abs(_2112);
    float _2985 = as_type<float>(_2687) * _2975;
    int _2987 = ~_2639;
    int _2989 = _2987 + 1;
    int _2991 = _2957 * _2643;
    int _2993 = _2991 + _2939;
    float _2995 = trunc(_2985);
    float _2997 = precise::max(_2995, 0.0);
    uint _2999 = uint(_2997);
    float _3001 = float(uint(_2863));
    int _3003 = _2979 * _2981;
    int _3005 = _3003 + _2993;
    float _3007 = float(uint(_2979));
    float _3009 = as_type<float>(_2687) * _3001;
    int _3011 = _2937 * _2983;
    int _3013 = _3011 + _3005;
    int _3015 = ~_2623;
    int _3017 = _3015 + 1;
    float _3019 = as_type<float>(_2701) * _3007;
    float _3021 = trunc(_3009);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    float _3027 = float(uint(_3013));
    int _3029 = _3017 * int(_2999);
    int _3031 = _3029 + _2971;
    float _3033 = as_type<float>(_2701) * _3027;
    float _3035 = trunc(_3019);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    int _3041 = ~_2623;
    int _3043 = _3041 + 1;
    float _3045 = float(uint(_3031));
    int _3047 = ~_2639;
    int _3049 = _3047 + 1;
    float _3051 = trunc(_3033);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    float _3057 = as_type<float>(_2687) * _3045;
    int _3059 = _3043 * int(_3025);
    int _3061 = _3059 + _2863;
    float _3063 = float(uint(_3061));
    float _3065 = trunc(_3057);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    int _3071 = _3049 * int(_3039);
    int _3073 = _3071 + _2979;
    float _3075 = as_type<float>(_2687) * _3063;
    float _3077 = _3063;
    float _3079 = _3057;
    float _3081 = as_type<float>(_2943);
    float _3083 = as_type<float>(_2899);
    float _3085 = as_type<float>(_2901);
    if (_2967)
    {
        _3077 = 1.0;
    }
    float _3087 = _3077;
    int _3089 = _2989 * int(_3055);
    int _3091 = _3089 + _3013;
    float _3093 = float(uint(_3073));
    float _3095 = _3087;
    if (_1940)
    {
        _3079 = 1.0;
    }
    float _3097 = _3079;
    float _3099 = float(uint(_3091));
    float _3101 = as_type<float>(_2701) * _3093;
    int _3103 = int(_2999) + int(_3069);
    float _3105 = as_type<float>(_2701) * _3099;
    float _3107 = _3097;
    if (!_2967)
    {
        float _3109 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3111 = _3109 * 0.15915493667125701904296875;
        float _3113 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3117 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3115;
        float _3119 = _3111 * 6.283185482025146484375;
        float _3121 = cos(_3119);
        float _3123 = _3113 * 0.15915493667125701904296875;
        float _3125 = _3111 * 6.283185482025146484375;
        float _3127 = sin(_3125);
        float _3129 = 1.0 / _3121;
        float _3131 = _3123 * 6.283185482025146484375;
        float _3133 = cos(_3131);
        float _3135 = _3127 * _3129;
        float _3137 = _3123 * 6.283185482025146484375;
        float _3139 = sin(_3137);
        float _3141 = _3133 * _3135;
        float _3143 = 1.0 / _3117;
        float _3145 = 1.0 / _3141;
        float _3147 = _3139 * _3145;
        float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3151 = fma(_1827, _3147, _3149);
        float _3153 = _3151 * _3143;
        float _3155 = precise::clamp(_3153, 0.0, 1.0);
        _3081 = _3143;
        _3083 = _3123;
        _3095 = _3155;
    }
    float _3157 = _3081;
    float _3159 = _3083;
    float _3161 = _3095;
    if (!_1940)
    {
        int _3163 = _1970 << 4;
        int _3165 = _3163 + 2048;
        uint _3167 = uint(int(uint(_3165) >> uint(2)));
        uint _3169 = uint(int(uint(int(_3167)) >> uint(2)));
        int _3171 = int(_3167) & 3;
        float _3173 = (*spvDescriptorSet0.vp_c15)._m0[int(_3169)][_3171];
        int _3175 = int(_3167) + 1;
        uint _3177 = uint(int(uint(_3175) >> uint(2)));
        int _3179 = _3175 & 3;
        float _3181 = (*spvDescriptorSet0.vp_c15)._m0[int(_3177)][_3179];
        int _3183 = _3165 + 8;
        uint _3185 = uint(int(uint(_3183) >> uint(2)));
        uint _3187 = uint(int(uint(int(_3185)) >> uint(2)));
        int _3189 = int(_3185) & 3;
        float _3191 = (*spvDescriptorSet0.vp_c15)._m0[int(_3187)][_3189];
        int _3193 = int(_3185) + 1;
        uint _3195 = uint(int(uint(_3193) >> uint(2)));
        int _3197 = _3193 & 3;
        float _3199 = (*spvDescriptorSet0.vp_c15)._m0[int(_3195)][_3197];
        float _3201 = _1669 * _3181;
        float _3203 = fma(_879, _3173, _3201);
        float _3205 = fma(_883, _3191, _3203);
        float _3207 = _3205 + _3199;
        float _3209 = precise::clamp(_3207, 0.0, 1.0);
        float _3211 = -_3209;
        float _3213 = _3211 + _2600;
        float _3215 = fma(_3213, 500.0, 1.5);
        float _3217 = exp2(_3215);
        float _3219 = 0.0 + _3217;
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        _3107 = _3221;
    }
    float _3223 = _3107;
    float _3225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3227 = _2440 + _3225;
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3231 = _2442 + _3229;
    float _3233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3235 = _2444 + _3233;
    float _3237 = _3227 * _3227;
    float _3239 = fma(_3231, _3231, _3237);
    float _3241 = fma(_3235, _3235, _3239);
    float _3243 = rsqrt(_3241);
    float _3245 = sqrt(_3241);
    float _3247 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3249 = _3231 * _3247;
    float _3251 = _3235 * _3247;
    float _3253 = _3249 * _3249;
    float _3255 = _3251 * _3251;
    float _3257 = _3253 + _3255;
    float _3259 = sqrt(_3257);
    bool _3261 = _3259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3265 = _3259 + _3263;
    float _3267 = _3157;
    float _3269 = _3257;
    float _3271 = _3265;
    float _3273 = _3249;
    float _3275 = _3251;
    float _3277 = _3253;
    float _3279 = _3255;
    if (_3261)
    {
        float _3281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3267 = _3281;
    }
    float _3283 = _3267;
    if (_3261)
    {
        float _3285 = rsqrt(_3257);
        _3269 = _3285;
    }
    float _3287 = _3269;
    if (_3261)
    {
        float _3289 = _3265 * _3283;
        _3271 = _3289;
    }
    float _3291 = _3271;
    if (_3261)
    {
        float _3293 = _3291 * 0.15915493667125701904296875;
        _3085 = _3293;
    }
    float _3295 = _3085;
    float _3297 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3299 = _3159;
    if (_3261)
    {
        float _3301 = _3295 * 6.283185482025146484375;
        float _3303 = sin(_3301);
        _3299 = _3303;
    }
    float _3305 = _3299;
    float _3307 = precise::max(0.0, _3297);
    float _3309 = _3291;
    float _3311 = _3307;
    if (_3261)
    {
        float _3313 = _3295 * 6.283185482025146484375;
        float _3315 = cos(_3313);
        _3309 = _3315;
    }
    float _3317 = _3309;
    float _3319 = -_3247;
    float _3321 = -_3307;
    float _3323 = fma(_3227, _3319, _3321);
    float _3325 = _3323;
    if (_3261)
    {
        float _3327 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3327;
    }
    float _3329 = _3311;
    float _3331 = _3305;
    float _3333 = _3329;
    if (_3261)
    {
        float _3335 = fma(_3305, _3329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3331 = _3335;
    }
    float _3337 = _3331;
    float _3339 = _3337;
    if (_3261)
    {
        float _3341 = _3287 * _3337;
        _3339 = _3341;
    }
    float _3343 = _3339;
    if (_3261)
    {
        float _3345 = _3317 + (-1.0);
        _3333 = _3345;
    }
    float _3347 = _3333;
    float _3349 = _3347;
    if (_3261)
    {
        float _3351 = _3249 * _3343;
        _3273 = _3351;
    }
    float _3353 = _3273;
    if (_3261)
    {
        float _3355 = _3251 * _3343;
        _3275 = _3355;
    }
    float _3357 = _3275;
    if (_3261)
    {
        float _3359 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3349 = _3359;
    }
    float _3361 = _3349;
    if (_3261)
    {
        float _3363 = _3353 * _3353;
        _3277 = _3363;
    }
    float _3365 = _3277;
    if (_3261)
    {
        float _3367 = _3357 * _3357;
        _3279 = _3367;
    }
    float _3369 = _3279;
    if (_3261)
    {
        float _3371 = fma(_3323, _3317, _3361);
        _3325 = _3371;
    }
    float _3373 = _3325;
    float _3375 = fma(_3373, _3373, _3365);
    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3379 = fma(_3245, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3377);
    float _3381 = precise::clamp(_3379, 0.0, 1.0);
    float _3383 = _3375 + _3369;
    float _3385 = -_3381;
    float _3387 = _3385 + 1.0;
    float _3389 = rsqrt(_3383);
    float _3391 = _3389 * _3353;
    float _3393 = _3389 * _3373;
    float _3395 = _3389 * _3357;
    float _3397 = _3391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3399 = trunc(_3105);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    float _3405 = -_3397;
    float _3407 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3405);
    float _3409 = -_3395;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3407);
    float _3413 = abs(_3387);
    float _3415 = log2(_3413);
    float _3417 = fma(_3411, -0.5, 0.5);
    float _3419 = fma(_3411, 0.5, 0.5);
    float _3421 = _3393 + 1.0;
    float _3423 = fma(_3419, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3425 = sqrt(_3417);
    float _3427 = fma(_3419, _3423, -0.212114393711090087890625);
    float _3429 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3431 = fma(_3419, _3427, 1.570728778839111328125);
    int _3433 = ~_2623;
    int _3435 = _3433 + 1;
    float _3437 = trunc(_3075);
    float _3439 = precise::max(_3437, 0.0);
    uint _3441 = uint(_3439);
    float _3443 = _3425 * 0.636619746685028076171875;
    float _3445 = exp2(_3429);
    float _3447 = -_3393;
    float _3449 = fma(_3445, _3421, _3447);
    float _3451 = -_3431;
    float _3453 = fma(_3443, _3451, 1.0);
    float _3455 = fma(_3449, 0.5, 0.5);
    int _3457 = _3435 * _3103;
    int _3459 = _3457 + _2971;
    float2 _10163 = float2(_3453, _3455);
    float3 _3463 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10163, float2(0.0), isnan(_10163)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10163, float2(0.0), isnan(_10163)), level(0.0)).xyz;
    float _3465 = _3463.x;
    float _3467 = _3463.y;
    float _3469 = _3463.z;
    bool _3471 = uint(_3459) >= uint(_2623);
    float _3473 = trunc(_3101);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    int _3479 = int(_3055) + int(_3403);
    out.m_74.x = _595;
    out.m_74.y = _597;
    out.m_74.z = _589;
    out.m_74.w = _599;
    bool _3481 = !_3471;
    int _3483 = _3481 ? 0 : (-1);
    float _3485 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _3487 = ~_2639;
    int _3489 = _3487 + 1;
    out.m_76.x = _773;
    out.m_76.y = _775;
    out.m_76.z = _777;
    out.m_76.w = _779;
    int _3491 = ~_3103;
    int _3493 = _3491 + _3483;
    int _3495 = _3493 + 1;
    float _3497 = -_1463;
    float _3499 = _3497 + 1.0;
    out.m_78.x = _879;
    out.m_78.y = _1597;
    out.m_78.z = _883;
    bool _3501 = _909 > 0.5;
    int _3503 = _2623 * _3495;
    int _3505 = _3503 + _2971;
    int _3507 = ~_2623;
    int _3509 = _3507 + 1;
    int _3511 = _3489 * _3479;
    int _3513 = _3511 + _3013;
    int _3515 = int(_3025) + int(_3441);
    out.m_80.w = _869;
    bool _3517 = !_2865;
    int _3519 = _3517 ? _3505 : (-1);
    float _3521 = exp2(_3485);
    bool _3523 = uint(_3513) >= uint(_2639);
    int _3525 = _3509 * _3515;
    int _3527 = _3525 + _2863;
    int _3529 = int(_3039) + int(_3477);
    float _3531 = -_1499;
    float _3533 = _3531 + 1.0;
    int _3535 = ~_2639;
    int _3537 = _3535 + 1;
    float _3539 = -_901;
    float _3541 = _3539 + 1.0;
    float _3543 = -_211;
    int _3545 = _3501 ? as_type<int>(_3543) : as_type<int>(_211);
    float _3547 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3549 = int(_3547);
    int _3551 = _3519 & 3;
    bool _3553 = _3551 != 0;
    int _3555 = _3537 * _3529;
    int _3557 = _3555 + _2979;
    int _3559 = _3519 & 3;
    bool _3561 = _3559 != 0;
    out.m_82.x = _1729;
    bool _3563 = !_3523;
    int _3565 = _3563 ? 0 : (-1);
    int _3567 = _3553 ? 0 : 1;
    out.m_84.x = _2442;
    out.m_84.y = _2440;
    out.m_84.z = _2444;
    bool _3569 = uint(_3527) >= uint(_2623);
    bool _3571 = uint(_3559) >= 2u;
    int _3573 = ~_3479;
    int _3575 = _3573 + _3565;
    int _3577 = _3575 + 1;
    int _3579 = _3519 >> 31;
    bool _3581 = !_3569;
    int _3583 = _3581 ? 0 : (-1);
    int _3585 = _2639 * _3577;
    int _3587 = _3585 + _3013;
    int _3589 = _3571 ? 0 : 1;
    bool _3591 = _3559 != 3;
    bool _3593 = uint(_3557) >= uint(_2639);
    int _3595 = _3579 & 3;
    int _3597 = ~_3515;
    int _3599 = _3597 + _3583;
    int _3601 = _3599 + 1;
    int _3603 = _3519 + _3595;
    bool _3605 = !_2895;
    int _3607 = _3605 ? _3587 : (-1);
    int _3609 = _2623 * _3601;
    int _3611 = _3609 + _2863;
    int _3613 = ~_3589;
    int _3615 = _3613 + 1;
    int _3617 = _3615 + 1;
    int _3619 = _3607 >> 31;
    int _3621 = _3617;
    if (_3591)
    {
        int _3623 = ~_3589;
        int _3625 = _3623 + 1;
        _3621 = _3625;
    }
    int _3627 = _3621;
    int _3629 = _3619 & 3;
    int _3631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3633 = _3631 != 0;
    int _3635 = _3607 + _3629;
    int _3637 = _3603 >> 2;
    bool _3639 = !_3633;
    float _3641 = _3639 ? _211 : as_type<float>(_3545);
    bool _3643 = !_2865;
    int _3645 = _3643 ? _3611 : (-1);
    int _3647 = _3607 & 3;
    bool _3649 = _3647 != 0;
    int _3651 = _3607 & 3;
    bool _3653 = _3651 != 0;
    int _3655 = _3635 >> 2;
    bool _3657 = uint(_3559) > 1u;
    int _3659 = _3637 << 4;
    int _3661 = _3659 + 368;
    int _3663 = _3655 << 4;
    int _3665 = _3663 + 512;
    uint _3667 = uint(int(uint(_3661) >> uint(2)));
    uint _3669 = uint(int(uint(int(_3667)) >> uint(2)));
    int _3671 = int(_3667) & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    int _3675 = int(_3667) + 1;
    uint _3677 = uint(int(uint(_3675) >> uint(2)));
    int _3679 = _3675 & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    bool _3683 = !_3561;
    int _3685 = _3683 ? 0 : 1;
    bool _3687 = uint(_3651) > 1u;
    int _3689 = ~_3567;
    int _3691 = _3689 + 1;
    int _3693 = _3691 + 1;
    int _3695 = _3693;
    if (!_3657)
    {
        int _3697 = ~_3567;
        int _3699 = _3697 + 1;
        _3695 = _3699;
    }
    int _3701 = _3695;
    uint _3703 = uint(int(uint(_3665) >> uint(2)));
    uint _3705 = uint(int(uint(int(_3703)) >> uint(2)));
    int _3707 = int(_3703) & 3;
    float _3709 = (*spvDescriptorSet0.vp_c9)._m0[int(_3705)][_3707];
    int _3711 = int(_3703) + 1;
    uint _3713 = uint(int(uint(_3711) >> uint(2)));
    int _3715 = _3711 & 3;
    float _3717 = (*spvDescriptorSet0.vp_c9)._m0[int(_3713)][_3715];
    bool _3719 = !_3593;
    int _3721 = _3719 ? 0 : (-1);
    int _3723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3725 = _3723 != 0;
    int _3727 = _3649 ? 0 : 1;
    int _3729 = ~_3529;
    int _3731 = _3729 + _3721;
    int _3733 = _3731 + 1;
    bool _3735 = !_3725;
    int _3737 = _3735 ? 0 : 1;
    int _3739 = _3661 + 8;
    uint _3741 = uint(int(uint(_3739) >> uint(2)));
    uint _3743 = uint(int(uint(int(_3741)) >> uint(2)));
    int _3745 = int(_3741) & 3;
    float _3747 = (*spvDescriptorSet0.vp_c9)._m0[int(_3743)][_3745];
    int _3749 = int(_3741) + 1;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    int _3753 = _3749 & 3;
    float _3755 = (*spvDescriptorSet0.vp_c9)._m0[int(_3751)][_3753];
    bool _3757 = !_3653;
    int _3759 = _3757 ? 0 : 1;
    int _3761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3763 = _3761 != 0;
    int _3765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3767 = _3765 != 0;
    int _3769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3771 = _3769 != 0;
    int _3773 = ~_3727;
    int _3775 = _3773 + 1;
    int _3777 = _3775 + 1;
    int _3779 = _3777;
    if (!_3687)
    {
        int _3781 = ~_3727;
        int _3783 = _3781 + 1;
        _3779 = _3783;
    }
    int _3785 = _3779;
    int _3787 = _3665 + 8;
    uint _3789 = uint(int(uint(_3787) >> uint(2)));
    uint _3791 = uint(int(uint(int(_3789)) >> uint(2)));
    int _3793 = int(_3789) & 3;
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[int(_3791)][_3793];
    int _3797 = int(_3789) + 1;
    uint _3799 = uint(int(uint(_3797) >> uint(2)));
    int _3801 = _3797 & 3;
    float _3803 = (*spvDescriptorSet0.vp_c9)._m0[int(_3799)][_3801];
    bool _3805 = !_3763;
    int _3807 = _3805 ? 0 : 1;
    bool _3809 = _3559 != 3;
    bool _3811 = _3651 != 3;
    bool _3813 = !_3809;
    int _3815 = _3813 ? 0 : (-1);
    bool _3817 = uint(_3651) >= 2u;
    bool _3819 = _3651 != 3;
    int _3821 = _3817 ? 0 : 1;
    int _3823 = abs(_3785);
    int _3825 = ~_3821;
    int _3827 = _3825 + 1;
    int _3829 = _3827 + 1;
    int _3831 = _3829;
    if (_3811)
    {
        int _3833 = ~_3821;
        int _3835 = _3833 + 1;
        _3831 = _3835;
    }
    int _3837 = _3831;
    bool _3839 = _905 > 0.5;
    float _3841 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3843 = abs(_3701);
    float _3845 = -_1717;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3841);
    int _3849 = ~_3843;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    int _3855 = abs(_3685);
    int _3857 = ~_3823;
    int _3859 = _3857 + 1;
    int _3861 = _3859 + 1;
    int _3863 = _3853 * as_type<int>(_3681);
    int _3865 = abs(_3759);
    int _3867 = ~_3855;
    int _3869 = _3867 + 1;
    int _3871 = _3869 + 1;
    int _3873 = _3861 * as_type<int>(_3717);
    bool _3875 = _903 > 0.5;
    int _3877 = _2639 * _3733;
    int _3879 = _3877 + _2979;
    int _3881 = abs(_3627);
    float _3883 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3885 = ~_3865;
    int _3887 = _3885 + 1;
    int _3889 = _3887 + 1;
    int _3891 = _3871 * as_type<int>(_3673);
    int _3893 = _3891 + _3863;
    int _3895 = abs(_3837);
    float _3897 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3899 = _3889 * as_type<int>(_3709);
    int _3901 = _3899 + _3873;
    bool _3903 = !_2895;
    int _3905 = _3903 ? _3879 : (-1);
    float _3907 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3909 = int(_3907);
    bool _3911 = _907 > 0.5;
    float _3913 = -_1717;
    float _3915 = fma(_3913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3883);
    float _3917 = -_1717;
    float _3919 = fma(_3917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3897);
    int _3921 = ~_3881;
    int _3923 = _3921 + 1;
    int _3925 = _3923 + 1;
    float _3927 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3915);
    bool _3929 = !_3819;
    int _3931 = _3929 ? 0 : (-1);
    int _3933 = ~_3895;
    int _3935 = _3933 + 1;
    int _3937 = _3935 + 1;
    int _3939 = _3925 * as_type<int>(_3747);
    int _3941 = _3939 + _3893;
    int _3943 = abs(_3815);
    float _3945 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3847);
    float _3947 = float(uint(_3549));
    int _3949 = _3937 * as_type<int>(_3795);
    int _3951 = _3949 + _3901;
    int _3953 = abs(_3931);
    float _3955 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3919);
    int _3957 = abs(_3737);
    float _3959 = 1.0 / _3947;
    int _3961 = ~_3943;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = ~_3953;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    int _3973 = ~_3957;
    int _3975 = _3973 + 1;
    int _3977 = _3975 + 1;
    int _3979 = _3965 * as_type<int>(_3755);
    int _3981 = _3979 + _3941;
    int _3983 = abs(_3549);
    int _3985 = _3971 * as_type<int>(_3803);
    int _3987 = _3985 + _3951;
    float _3989 = float(uint(_3909));
    int _3991 = _3981 * _3977;
    int _3993 = abs(_3807);
    float _3995 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3997 = _3645 * _3957;
    int _3999 = _3997 + _3991;
    float _4001 = 1.0 / _3989;
    int _4003 = ~_3993;
    int _4005 = _4003 + 1;
    int _4007 = _4005 + 1;
    float _4009 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4011 = float(uint(_3983));
    float _4013 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3995);
    int _4015 = abs(_3909);
    int _4017 = _3987 * _4007;
    int _4019 = as_type<int>(_3959) + (-2);
    float _4021 = 1.0 / _4011;
    float _4023 = float(uint(_4015));
    int _4025 = _3905 * _3993;
    int _4027 = _4025 + _4017;
    float _4029 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4031 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4033 = -_211;
    int _4035 = _3839 ? as_type<int>(_4033) : as_type<int>(_211);
    float _4037 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4009);
    float _4039 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4029);
    int _4041 = as_type<int>(_4001) + (-2);
    float _4043 = 1.0 / _4023;
    float _4045 = float(uint(_3999));
    float _4047 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4031);
    float _4049 = float(uint(_4027));
    bool _4051 = !_3767;
    float _4053 = _4051 ? _211 : as_type<float>(_4035);
    float _4055 = as_type<float>(_4019) * _4045;
    float _4057 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4059 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4061 = as_type<float>(_4041) * _4049;
    int _4063 = abs(_3999);
    float _4065 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4057);
    float _4067 = trunc(_4055);
    float _4069 = precise::max(_4067, 0.0);
    uint _4071 = uint(_4069);
    float _4073 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4059);
    int _4075 = as_type<int>(_4021) + (-2);
    float _4077 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _4079 = abs(_4027);
    float _4081 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4047);
    int _4083 = ~_3549;
    int _4085 = _4083 + 1;
    float _4087 = fma(_4077, _4077, 1.0);
    float _4089 = trunc(_4061);
    float _4091 = precise::max(_4089, 0.0);
    uint _4093 = uint(_4091);
    float _4095 = float(uint(_4063));
    int _4097 = as_type<int>(_4043) + (-2);
    float _4099 = as_type<float>(_4075) * _4095;
    float _4101 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4065);
    int _4103 = _4085 * int(_4071);
    int _4105 = _4103 + _3999;
    float _4107 = float(uint(_4079));
    float _4109 = rsqrt(_4087);
    int _4111 = ~_3909;
    int _4113 = _4111 + 1;
    float _4115 = float(uint(_4105));
    float _4117 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4073);
    float _4119 = as_type<float>(_4097) * _4107;
    int _4121 = _4113 * int(_4093);
    int _4123 = _4121 + _4027;
    int _4125 = ~_3983;
    int _4127 = _4125 + 1;
    float _4129 = trunc(_4099);
    float _4131 = precise::max(_4129, 0.0);
    uint _4133 = uint(_4131);
    int _4135 = ~_4015;
    int _4137 = _4135 + 1;
    float _4139 = float(uint(_4123));
    float _4141 = as_type<float>(_4019) * _4115;
    float _4143 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4039);
    float _4145 = -_201;
    int _4147 = _3911 ? as_type<int>(_4145) : as_type<int>(_201);
    float _4149 = trunc(_4119);
    float _4151 = precise::max(_4149, 0.0);
    uint _4153 = uint(_4151);
    float _4155 = as_type<float>(_4041) * _4139;
    float _4157 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4013);
    float _4159 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4037);
    bool _4161 = !_3771;
    float _4163 = _4161 ? _201 : as_type<float>(_4147);
    int _4165 = _4127 * int(_4133);
    int _4167 = _4165 + _4063;
    float _4169 = -_201;
    int _4171 = _3875 ? as_type<int>(_4169) : as_type<int>(_201);
    float _4173 = trunc(_4141);
    float _4175 = precise::max(_4173, 0.0);
    uint _4177 = uint(_4175);
    int _4179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _4181 = _4179 != 0;
    out.m_86.x = _4157;
    out.m_86.y = _4159;
    out.m_86.z = _4143;
    float _4183 = float(uint(_4167));
    bool _4185 = !_4181;
    float _4187 = _4185 ? _201 : as_type<float>(_4171);
    int _4189 = _4137 * int(_4153);
    int _4191 = _4189 + _4079;
    float _4193 = _4077 * _3945;
    float _4195 = as_type<float>(_4075) * _4183;
    float _4197 = _4077 * _4109;
    float _4199 = trunc(_4155);
    float _4201 = precise::max(_4199, 0.0);
    uint _4203 = uint(_4201);
    float _4205 = float(uint(_4191));
    float _4207 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4209 = -_4081;
    float _4211 = _4197 * _4209;
    float _4213 = -_4101;
    float _4215 = _4197 * _4213;
    bool _4217 = _3909 == 0;
    float _4219 = as_type<float>(_4097) * _4205;
    float _4221 = -_4117;
    float _4223 = _4197 * _4221;
    float _4225 = fma(_4109, _3945, _4211);
    float _4227 = fma(_4109, _3927, _4215);
    float _4229 = _4077 * _3927;
    float _4231 = fma(_4109, _3955, _4223);
    float _4233 = trunc(_4195);
    float _4235 = precise::max(_4233, 0.0);
    uint _4237 = uint(_4235);
    float _4239 = fma(_4207, _4157, _4193);
    float _4241 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4243 = _4077 * _3955;
    out.m_88.x = _4225;
    out.m_88.y = _4227;
    out.m_88.z = _4231;
    float _4245 = fma(_4207, _4159, _4229);
    float _4247 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4241);
    int _4249 = ~_3983;
    int _4251 = _4249 + 1;
    float _4253 = trunc(_4219);
    float _4255 = precise::max(_4253, 0.0);
    uint _4257 = uint(_4255);
    int _4259 = int(_4071) + int(_4177);
    float _4261 = fma(_4207, _4143, _4243);
    int _4263 = ~_3549;
    int _4265 = _4263 + 1;
    float _4267 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4247);
    int _4269 = int(_4093) + int(_4203);
    float _4271 = _4117 + _4261;
    int _4273 = ~_3909;
    int _4275 = _4273 + 1;
    int _4277 = _4265 * _4259;
    int _4279 = _4277 + _3999;
    int _4281 = ~_4015;
    int _4283 = _4281 + 1;
    float _4285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4287 = int(_4133) + int(_4237);
    float _4289 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4267);
    int _4291 = _4027 ^ _3909;
    bool _4293 = uint(_4279) >= uint(_3549);
    int _4295 = _4251 * _4287;
    int _4297 = _4295 + _4063;
    int _4299 = int(_4153) + int(_4257);
    int _4301 = _4275 * _4269;
    int _4303 = _4301 + _4027;
    uint _4305 = uint(int(uint(_4291) >> uint(31)));
    float _4307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4309 = uint(_4297) >= uint(_3983);
    int _4311 = _4283 * _4299;
    int _4313 = _4311 + _4079;
    bool _4315 = uint(_4303) >= uint(_3909);
    out.gl_Position.x = _2554;
    out.gl_Position.y = _2568;
    out.gl_Position.z = _4289;
    out.gl_Position.w = _2516;
    bool _4317 = !_4293;
    int _4319 = _4317 ? 0 : (-1);
    float _4321 = _4285 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4323 = uint(_4313) >= uint(_4015);
    float _4325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4327 = !_4315;
    int _4329 = _4327 ? 0 : (-1);
    bool _4331 = !_4323;
    int _4333 = _4331 ? 0 : (-1);
    int _4335 = ~_4259;
    int _4337 = _4335 + _4319;
    int _4339 = _4337 + 1;
    int _4341 = ~_4333;
    int _4343 = _4299 + _4341;
    int _4345 = _4343 + 1;
    float _4347 = _4307 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _4349 = ~int(_4305);
    int _4351 = _4349 + 1;
    int _4353 = _3999 ^ _3549;
    int _4355 = _4345 ^ _4351;
    int _4357 = ~_4269;
    int _4359 = _4357 + _4329;
    int _4361 = _4359 + 1;
    int _4363 = _3549 * _4339;
    int _4365 = _4363 + _3999;
    int _4367 = ~_4351;
    int _4369 = _4367 + _4355;
    int _4371 = _4369 + 1;
    bool _4373 = !_4309;
    int _4375 = _4373 ? 0 : (-1);
    float _4377 = abs(_1827);
    float _4379 = log2(_4377);
    uint _4381 = uint(int(uint(_4353) >> uint(31)));
    int _4383 = _3909 * _4361;
    int _4385 = _4383 + _4027;
    bool _4387 = _3549 == 0;
    int _4389 = ~_4375;
    int _4391 = _4287 + _4389;
    int _4393 = _4391 + 1;
    int _4395 = ~int(_4381);
    int _4397 = _4395 + 1;
    bool _4399 = _3909 == 0;
    bool _4401 = !_4387;
    int _4403 = _4401 ? _4365 : (-1);
    float _4405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4407 = _4393 ^ _4397;
    float _4409 = float(_4403);
    float _4411 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _4413 = _3549 == 0;
    float _4415 = _2516 * 0.5;
    bool _4417 = !_4217;
    int _4419 = _4417 ? _4385 : (-1);
    float _4421 = fma(_4347, _4409, _1049);
    int _4423 = ~_4397;
    int _4425 = _4423 + _4407;
    int _4427 = _4425 + 1;
    float _4429 = _4187 + 0.5;
    float _4431 = float(_4419);
    float _4433 = exp2(_4411);
    bool _4435 = !_4413;
    int _4437 = _4435 ? _4427 : (-1);
    float _4439 = fma(_4347, _4429, _4421);
    bool _4441 = !_4399;
    int _4443 = _4441 ? _4371 : (-1);
    float _4445 = fma(_4321, _4431, _1503);
    float _4447 = float(_4437);
    float _4449 = _4405 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4451 = float(_4443);
    float _4453 = _4325 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _4455 = _4163 + 0.5;
    bool _4457 = _1827 <= 8000.0;
    bool _4459 = isnan(_1827);
    bool _4461 = _4457 || _4459;
    bool _4463 = isnan(8000.0);
    bool _4465 = _4461 || _4463;
    float _4467 = float(_4465);
    float _4469 = -_1505;
    float _4471 = fma(_4449, _4451, _4469);
    float _4473 = -_1307;
    float _4475 = fma(_4453, _4447, _4473);
    float _4477 = _3641 + (-0.5);
    float _4479 = _4053 + (-0.5);
    float _4481 = fma(_4321, _4455, _4445);
    float _4483 = -_4449;
    float _4485 = fma(_4483, _4477, _4471);
    float _4487 = -_4453;
    float _4489 = fma(_4487, _4479, _4475);
    float _4491 = -_1495;
    float _4493 = _4491 + 1.0;
    float _4495 = -_1497;
    float _4497 = _4495 + 1.0;
    float _4499 = fma(_3641, _3499, _4485);
    float _4501 = -_4493;
    float _4503 = fma(_4163, _4501, _4481);
    float _4505 = -_4497;
    float _4507 = fma(_4187, _4505, _4439);
    float _4509 = fma(_2568, -0.5, _4415);
    float _4511 = fma(_4053, _3533, _4489);
    float _4513 = fma(_4433, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4515 = precise::clamp(_4513, 0.0, 1.0);
    float _4517 = _4289 + _2516;
    float _4519 = _2554 + _2516;
    float _4521 = _4101 + _4245;
    out.m_90.x = _4507;
    out.m_90.y = _4511;
    out.m_90.z = _4503;
    out.m_90.w = _4499;
    float _4523 = fma(_4515, -2.0, 3.0);
    float _4525 = _4515 * _4515;
    float _4527 = _4517 * 0.5;
    float _4529 = _4519 * 0.5;
    float _4531 = _4081 + _4239;
    float _4533 = _4525 * _4523;
    out.m_92.x = _4529;
    out.m_92.y = _4509;
    out.m_92.z = _4527;
    out.m_92.w = _2516;
    out.m_94.x = _4531;
    out.m_94.y = _4521;
    out.m_94.z = _4271;
    float _4535 = -_3521;
    float _4537 = _4535 + 1.0;
    float _4539 = _4511;
    float _4541 = _4509;
    if (!_2500)
    {
        _4539 = 1.0;
    }
    float _4543 = _4539;
    float _4545 = _4543;
    if (_2500)
    {
        bool _4547 = _2606 >= _2572;
        bool _4549 = isnan(_2606);
        bool _4551 = _4547 || _4549;
        bool _4553 = isnan(_2572);
        bool _4555 = _4551 || _4553;
        float _4557 = float(_4555);
        _4545 = _4557;
    }
    float _4559 = _4545;
    float _4561 = _4537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _4563 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4565 = isnan(_3245);
    bool _4567 = _4563 || _4565;
    bool _4569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4571 = _4567 || _4569;
    float _4573 = _4561 * _2608;
    float _4575 = -_4533;
    float _4577 = _4575 + 1.0;
    float _4579 = -_4561;
    float _4581 = _4579 + 1.0;
    float _4583 = _4559 * _3223;
    float _4585 = _2619 * _4573;
    float _4587 = fma(_4577, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4533);
    float _4589 = _3469 * _4573;
    float _4591 = _2619 * _4581;
    float _4593 = fma(_3465, _4585, _2613);
    float _4595 = _4467 * _4587;
    float _4597 = fma(_3467, _4585, _2615);
    float _4599 = fma(_2619, _4589, _2617);
    float _4601 = _3161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4603 = _4595 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4605 = _4577;
    float _4607 = _4561;
    float _4609 = _4581;
    if (!_4571)
    {
        _4541 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4611 = _4541;
    out.m_96.x = _4593;
    out.m_96.y = _4597;
    out.m_96.z = _4599;
    out.m_96.w = _4591;
    float _4613 = _3541 * _4603;
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = _4611;
    float _4619 = _4611;
    if (!_4571)
    {
        _4605 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4621 = _4605;
    float _4623 = _4621;
    float _4625 = _4621;
    if (!_4571)
    {
        _4607 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4627 = _4607;
    float _4629 = -_4615;
    float _4631 = fma(_4629, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4633 = _4627;
    float _4635 = _4627;
    if (!_4571)
    {
        _4609 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4637 = _4609;
    float _4639 = -_4583;
    float _4641 = fma(_4639, _4631, 1.0);
    float _4643 = precise::clamp(_4641, 0.0, 1.0);
    float _4645 = _4643 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4647 = _4643;
    float _4649 = _4645;
    float _4651 = _4637;
    float _4653 = _4637;
    if (!_4571)
    {
        _4647 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4655 = _4647;
    out.m_98.x = _4645;
    float _4657 = _4655;
    float _4659 = _4655;
    if (!_4571)
    {
        _4649 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4661 = _4649;
    bool _4663 = !_4571;
    float _4665 = _4661;
    float _4667 = _4661;
    if (!_4663)
    {
        bool _4669 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4671 = isnan(_3245);
        bool _4673 = _4669 || _4671;
        bool _4675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4677 = _4673 || _4675;
        if (!_4677)
        {
            float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4681 = _3245 + _4679;
            float _4683 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4685 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4683;
            float _4687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4689 = _4687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4691 = 1.0 / _4685;
            float _4693 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4695 = _4693 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4697 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4699 = _4697 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4701 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4703 = _4701 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4705 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4707 = _4705 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4709 = _4681 * _4691;
            float _4711 = precise::clamp(_4709, 0.0, 1.0);
            float _4713 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4715 = _4713 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4717 = fma(_4711, _4689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4719 = fma(_4711, _4715, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4721 = fma(_4711, _4695, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4723 = fma(_4711, _4699, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4725 = fma(_4711, _4703, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4727 = fma(_4711, _4707, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4625 = _4721;
            _4659 = _4725;
            _4619 = _4717;
            _4653 = _4723;
            _4635 = _4719;
            _4667 = _4727;
            _4729 = true;
        }
        else
        {
            bool _4731 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4733 = isnan(_3245);
            bool _4735 = _4731 || _4733;
            bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4739 = _4735 || _4737;
            if (!_4739)
            {
                _4617 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4741 = _4617;
            _4619 = _4741;
            if (!_4739)
            {
                _4623 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4743 = _4623;
            _4625 = _4743;
            if (!_4739)
            {
                _4633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4745 = _4633;
            _4635 = _4745;
            if (!_4739)
            {
                _4651 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4747 = _4651;
            _4653 = _4747;
            if (!_4739)
            {
                _4657 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4749 = _4657;
            _4659 = _4749;
            if (!_4739)
            {
                _4665 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4751 = _4665;
            bool _4753 = !_4739;
            _4667 = _4751;
            if (!_4753)
            {
                bool _4755 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4757 = isnan(_3245);
                bool _4759 = _4755 || _4757;
                bool _4761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4763 = _4759 || _4761;
                if (!_4763)
                {
                    float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4767 = _3245 + _4765;
                    float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4771 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4769;
                    float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4777 = 1.0 / _4771;
                    float _4779 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4781 = _4779 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4783 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4785 = _4783 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4787 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4789 = _4787 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4793 = _4791 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4795 = _4767 * _4777;
                    float _4797 = precise::clamp(_4795, 0.0, 1.0);
                    float _4799 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4801 = _4799 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4803 = fma(_4797, _4775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4805 = fma(_4797, _4801, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4807 = fma(_4797, _4781, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4809 = fma(_4797, _4785, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4811 = fma(_4797, _4789, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4813 = fma(_4797, _4793, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4625 = _4807;
                    _4659 = _4811;
                    _4619 = _4803;
                    _4653 = _4809;
                    _4635 = _4805;
                    _4667 = _4813;
                    _4729 = true;
                }
                else
                {
                    _4625 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4659 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4619 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4653 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4667 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4729 = false;
    float _4815 = _4625;
    float _4817 = _4659;
    float _4819 = _4619;
    float _4821 = _4653;
    float _4823 = _4635;
    float _4825 = _4667;
    float _4827 = _4601 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4829 = fma(_4521, -0.5, 0.5);
    float _4831 = precise::clamp(_4829, 0.0, 1.0);
    float _4833 = -_4815;
    float _4835 = _4833 + _4817;
    float _4837 = -_4819;
    float _4839 = _4837 + _4821;
    out.m_100.x = 0.0;
    float _4841 = fma(_4831, _4835, _4815);
    float _4843 = -_4823;
    float _4845 = _4843 + _4825;
    float _4847 = fma(_4831, _4839, _4819);
    float _4849 = _4841 * 0.586610972881317138671875;
    bool _4851 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4853 = fma(_4831, _4845, _4823);
    out.m_59.x = _4827;
    float _4855 = fma(_4847, 0.298911988735198974609375, _4849);
    bool _4857 = _3161 > 0.0;
    bool _4859 = isnan(_3161);
    bool _4861 = _4857 || _4859;
    bool _4863 = isnan(0.0);
    bool _4865 = _4861 || _4863;
    float _4867 = fma(_4853, 0.114477999508380889892578125, _4855);
    float _4869 = -_4867;
    float _4871 = _4847 + _4869;
    float _4873 = -_4867;
    float _4875 = _4841 + _4873;
    float _4877 = -_4867;
    float _4879 = _4853 + _4877;
    float _4881 = fma(_4871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    float _4883 = fma(_4875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    float _4885 = fma(_4879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    bool _4887 = !_4851;
    if (!_4887)
    {
        float _4889 = -_2440;
        float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4893 = -_2442;
        float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4897 = -_2444;
        float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4901 = _4891 * _4891;
        float _4903 = fma(_4895, _4895, _4901);
        float _4905 = fma(_4899, _4899, _4903);
        float _4907 = sqrt(_4905);
        float _4909 = rsqrt(_4905);
        float _4911 = -_4907;
        float _4913 = _4911 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4915 = _4913 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4917 = precise::clamp(_4915, 0.0, 1.0);
        float _4919 = _4895 * _4909;
        float _4921 = _4891 * _4909;
        float _4923 = abs(_4917);
        float _4925 = log2(_4923);
        float _4927 = _4899 * _4909;
        float _4929 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4931 = _4521 * _4921;
        float _4933 = -_4921;
        float _4935 = -_4929;
        float _4937 = fma(_4933, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4935);
        float _4939 = fma(_4531, _4919, _4931);
        float _4941 = -_4927;
        float _4943 = fma(_4941, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4937);
        float _4945 = fma(_4271, _4927, _4939);
        float _4947 = precise::clamp(_4945, 0.0, 1.0);
        float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4951 = _4943 + _4949;
        float _4953 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4955 = _4951 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4957 = precise::clamp(_4955, 0.0, 1.0);
        float _4959 = exp2(_4953);
        float _4961 = _4959 * _4957;
        float _4963 = _4947 * _4961;
        float _4965 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4967 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4969 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4965;
        out.m_100.y = _4967;
        out.m_100.z = _4969;
    }
    out.m_80.x = _4881;
    out.m_80.y = _4883;
    out.m_80.z = _4885;
    if (_4865)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _4971 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4971;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4729 = false;
    bool _801 = false;
    bool _621 = false;
    bool _441 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_56.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_59.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5028 = as_type<float>(_135);
        out.gl_Position.z = _5028;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_61.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_119);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _129;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5097 = as_type<float>(_173);
        out.gl_Position.z = _5097;
    }
    if (_167)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_66.x;
    float _179 = in.m_66.y;
    float _181 = in.m_66.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_68.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_119);
        float _243 = 1.0 / _241;
        float _245 = _153 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _247 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = in.m_70.x;
    float _271 = in.m_70.y;
    bool _273 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _275 = isnan(_247);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = 1.0 / _259;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _289 = 1.0 / _263;
    float _291 = 1.0 / _267;
    float _293 = _251 * _285;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _247 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = _297 * _289;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    bool _311 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_247);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -_321;
    float _327 = _325 + 1.0;
    float _329 = _255 * _291;
    float _331 = -_283;
    float _333 = _331 + 1.0;
    bool _335 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_247);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = _321 * _333;
    bool _349 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_247);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _345 * _327;
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _359 * _365;
    float _377 = fma(_369, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -_359;
    float _383 = _381 + 1.0;
    float _385 = _303 * _375;
    float _387 = _323 * _375;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _401 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_377, _361, _397);
    float _407 = fma(_379, _361, _399);
    float _409 = fma(_401, _347, _405);
    float _411 = fma(_403, _347, _407);
    float _413 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[146].x, _409);
    float _415 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[146].y, _411);
    float _417 = _413 * _269;
    float _419 = _415 * _271;
    bool _421 = !_287;
    float _439;
    if (!_421)
    {
        float _423 = in.m_68.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_119);
        float _445 = 1.0 / _443;
        float _447 = _153 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _449 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _463 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = isnan(_449);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _479 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = isnan(_449);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _457;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -_473;
    float _499 = _497 + 1.0;
    bool _501 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _503 = isnan(_449);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _515 = 1.0 / _461;
    float _517 = 1.0 / _477;
    float _519 = _495 * _491;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = _489 * _499;
    float _527 = -_489;
    float _529 = _527 + 1.0;
    float _531 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _533;
    float _537 = _511 * _529;
    float _539 = _523 * _515;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _449 + _541;
    bool _545 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _547 = isnan(_449);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = _531 * _537;
    float _559 = -_511;
    float _561 = _559 + 1.0;
    float _563 = fma(_539, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _567 = _449 + _565;
    float _569 = _535 * _517;
    float _571 = -_555;
    float _573 = _571 + 1.0;
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _557);
    float _577 = fma(_569, _567, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _579 = _473 * _573;
    float _581 = fma(_563, _525, _575);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _585 = fma(_577, _579, _581);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _593 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[118].x, _585);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _599 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _601 = !_513;
    float _619;
    if (!_601)
    {
        float _603 = in.m_68.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_119);
        float _625 = 1.0 / _623;
        float _627 = _153 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _645 = isnan(_629);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _659 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _661 = isnan(_629);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = 1.0 / _637;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _673;
    float _677 = -_653;
    float _679 = _677 + 1.0;
    bool _681 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _683 = isnan(_629);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _695 = 1.0 / _641;
    float _697 = 1.0 / _657;
    float _699 = _675 * _671;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _705 = _669 * _679;
    float _707 = -_669;
    float _709 = _707 + 1.0;
    float _711 = fma(_699, _633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _713;
    float _717 = _691 * _709;
    float _719 = _703 * _695;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _723 = _629 + _721;
    bool _725 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _727 = isnan(_629);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = _711 * _717;
    float _739 = -_691;
    float _741 = _739 + 1.0;
    float _743 = fma(_719, _723, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _747 = _629 + _745;
    float _749 = _715 * _697;
    float _751 = -_735;
    float _753 = _751 + 1.0;
    float _755 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _737);
    float _757 = fma(_749, _747, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _759 = _653 * _753;
    float _761 = fma(_743, _705, _755);
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _765 = fma(_757, _759, _761);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _771 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[134].x, _765);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _781 = !_693;
    float _799;
    if (!_781)
    {
        float _783 = in.m_68.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[14].x, _153);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_119);
        float _805 = 1.0 / _803;
        float _807 = _153 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = in.m_56.x;
    float _813 = in.m_56.y;
    float _815 = in.m_56.z;
    float _817 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _819 = _817 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _821 = _813 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _823 = _813 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _825 = _813 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _821);
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _823);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _825);
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[5].z, _827);
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[4].z, _829);
    float _837 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[6].z, _831);
    float _839 = _833 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _841 = _835 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _843 = _837 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _839 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _841 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _843 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = sqrt(_861);
    float _865 = rsqrt(_861);
    float _867 = _863 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _869 = precise::min(_819, _867);
    float _871 = _865 * _869;
    float _873 = _851 * _871;
    float _875 = _855 * _871;
    float _877 = -_873;
    float _879 = _841 + _877;
    float _881 = -_875;
    float _883 = _843 + _881;
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _887 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _889 = floor(_885);
    float _891 = floor(_887);
    float _893 = -_889;
    float _895 = _885 + _893;
    float _897 = -_891;
    float _899 = _887 + _897;
    float2 _6272 = float2(_895, _899);
    float _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6272, float2(0.0), isnan(_6272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6272, float2(0.0), isnan(_6272)), level(0.0)).x;
    float _903 = in.m_68.x;
    float _905 = in.m_68.y;
    float _907 = in.m_68.z;
    float _909 = in.m_68.w;
    float _911 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _913 = log2(_911);
    float _915 = _847 * _871;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _933 = _931 != 0;
    float _935 = 1.0 / _925;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _939 = -_873;
    float _941 = _851 + _939;
    float _943 = -_875;
    float _945 = _855 + _943;
    float _947 = 1.0 / _919;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _953 = _903 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _955 = _903 * 2.0;
    float _957 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _959 = -_921;
    float _961 = fma(_953, 2.0, _959);
    float _963 = 1.0 / _929;
    float _965 = _905 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _967 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _957);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _973 = fma(_965, -2.0, _937);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _975;
    float _979 = 1.0 / _951;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _985 = _977 * _935;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _987;
    float _991 = _983 * _947;
    float _993 = 1.0 / _971;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _999;
    float _1003 = _903 + _905;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1009 = _989 * _963;
    float _1011 = _907 * 2.0;
    float _1013 = _1003 + (-1.0);
    float _1015 = floor(_955);
    float _1017 = _1007 * _979;
    bool _1019 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1021 = isnan(_809);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1033 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1035 = isnan(_809);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = _907 + _905;
    float _1047 = -_153;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[76].x, _961);
    float _1051 = 1.0 / _997;
    float _1053 = _1001 * _993;
    float _1055 = _907 + _903;
    float _1057 = -_1043;
    float _1059 = _1057 + 1.0;
    float _1061 = _1045 + (-1.0);
    float _1063 = _1055 + (-1.0);
    float _1065 = float(_119);
    float _1067 = floor(_1011);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1073 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1075 = isnan(_809);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1087 = _1015 > 0.0;
    float _1089 = _1029 * _1059;
    bool _1091 = _1015 >= 0.0;
    bool _1093 = isnan(_1015);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.0);
    bool _1099 = _1095 || _1097;
    float _1101 = -_1083;
    float _1103 = _1101 + 1.0;
    float _1105 = _1071 * _1051;
    float _1107 = -_1029;
    float _1109 = _1107 + 1.0;
    float _1111 = _905 * 2.0;
    float _1113 = _1043 * _1103;
    bool _1115 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1117 = isnan(_809);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1129 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1131 = isnan(_809);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = 1.0 / _1065;
    bool _1143 = _1067 >= 0.0;
    bool _1145 = isnan(_1067);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = _1125 * _1109;
    float _1155 = -_1125;
    float _1157 = _1155 + 1.0;
    bool _1159 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1161 = isnan(_809);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1167 = _1163 || _1165;
    int _1169 = _1167 ? 1065353216 : 0;
    float _1171 = -_1139;
    float _1173 = _1171 + 1.0;
    float _1175 = _1139 * _1157;
    float _1177 = floor(_1111);
    float _1179 = as_type<float>(_1169) * _1173;
    float _1181 = -as_type<float>(_1169);
    float _1183 = _1181 + 1.0;
    int _1185 = _1169;
    float _1187 = _839;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_933)
    {
        _1185 = 0;
    }
    int _1191 = _1185;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1195 = _809 + _1193;
    int _1197 = _1191;
    if (!_933)
    {
        _1197 = 1;
    }
    int _1199 = _1197;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1203 = _1067 > 0.0;
    float _1205 = fma(_985, _1195, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1207 = _1099 ? 0 : 1;
    float _1209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1211 = int(_1209);
    bool _1213 = _1199 != 1;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1217 = _809 + _1215;
    bool _1219 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1221 = isnan(_809);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = _1141 * _153;
    int _1233 = ~_1207;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = fma(_991, _1217, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1241 = _1177 > 0.0;
    float _1243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1245 = int(_1243);
    bool _1247 = _1177 >= 0.0;
    bool _1249 = isnan(_1177);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan(0.0);
    bool _1255 = _1251 || _1253;
    float _1257 = _1229 * _1183;
    float _1259 = -_1229;
    float _1261 = _1259 + 1.0;
    int _1263 = _1151 ? 0 : 1;
    float _1265 = _1205 * _1257;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1269 = _809 + _1267;
    float _1271 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _967);
    int _1273 = ~_1263;
    int _1275 = _1273 + 1;
    int _1277 = _1275 + 1;
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1265);
    int _1281 = _1277;
    float _1283 = _1269;
    int _1285 = _1237;
    if (!_1203)
    {
        int _1287 = ~_1263;
        int _1289 = _1287 + 1;
        _1281 = _1289;
    }
    int _1291 = _1281;
    float _1293 = fma(_1009, _1269, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1301 = _1299 != 0;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1305 = _1303 != 0;
    float _1307 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _973);
    float _1309 = fma(_1239, _1179, _1279);
    if (!_1213)
    {
        _1283 = _905;
    }
    float _1311 = _1283;
    float _1313 = _905 + (-0.5);
    bool _1315 = !_1301;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1321 = !_1297;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = sqrt(_1271);
    bool _1327 = !_1305;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1335 = _1333 != 0;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1343 = _1341 != 0;
    float _1345 = _1311;
    if (_1213)
    {
        _1345 = _903;
    }
    float _1347 = _1345;
    float _1349 = float(_1245);
    float _1351 = as_type<float>(_1245);
    float _1353 = _1347;
    if (!_1213)
    {
        _1351 = _905;
    }
    float _1355 = _1351;
    float _1357 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1319);
    float _1359 = _1355;
    if (_1213)
    {
        _1359 = _903;
    }
    float _1361 = _1359;
    bool _1363 = !_1335;
    float _1365 = _1363 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1367 = 1.0 / _1349;
    float _1369 = _1365;
    if (!_1213)
    {
        _1353 = _907;
    }
    float _1371 = _1353;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1375 = _1371;
    if (!_1087)
    {
        int _1377 = ~_1207;
        int _1379 = _1377 + 1;
        _1285 = _1379;
    }
    int _1381 = _1285;
    float _1383 = _1325 * 50.0;
    if (_1213)
    {
        _1375 = _905;
    }
    float _1385 = _1375;
    int _1387 = abs(as_type<int>(_1365));
    float _1389 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1391 = float(_1291);
    float _1393 = _913 * _153;
    int _1395 = _1255 ? 0 : 1;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1399 = float(_1211);
    float _1401 = fma(_1389, -2.0, _1201);
    float _1403 = float(_1387);
    float _1405 = exp2(_1393);
    int _1407 = ~_1395;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = -_1397;
    float _1415 = fma(_1373, 2.0, _1413);
    int _1417 = _1411;
    if (!_1241)
    {
        int _1419 = ~_1395;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    float _1425 = _1403 * _1391;
    float _1427 = in.m_72.x;
    float _1429 = in.m_72.y;
    float _1431 = in.m_72.z;
    if (!_1213)
    {
        _1369 = _907;
    }
    float _1433 = _1369;
    float _1435 = 1.0 / _1399;
    float _1437 = _1433;
    if (_1213)
    {
        _1437 = _905;
    }
    float _1439 = _1437;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1443 = _1367 * _153;
    bool _1445 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1453 = _1449 || _1451;
    float _1455 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1441);
    float _1457 = -_1405;
    float _1459 = _1457 + 1.0;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1463 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1455);
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1467 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1469 = isnan(1.0);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1475 = _1471 || _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1479 = 1.0 + _1477;
    float _1481 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1483 = _1435 * _153;
    bool _1485 = !_1339;
    int _1487 = _1485 ? 0 : 1;
    float _1489 = 1.0 / _1479;
    float _1491 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1465);
    float _1493 = _1453 ? _1459 : 0.0;
    float _1495 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1357);
    float _1497 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1481);
    float _1499 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1491);
    float _1501 = -_153;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1415);
    float _1505 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1401);
    float _1507 = float(_1381);
    float _1509 = _903 + (-0.5);
    int _1511 = abs(_1487);
    float _1513 = _1425 * (-2.0);
    bool _1515 = !_1343;
    int _1517 = _1515 ? 0 : 1;
    float _1519 = float(_1423);
    float _1521 = _1483;
    if (_1475)
    {
        float _1523 = _1493 * _1489;
        _157 = _1523;
    }
    float _1525 = _157;
    float _1527 = fma(_1513, _1427, _1427);
    float _1529 = float(_1511);
    float _1531 = fma(_1031, _1513, _1031);
    int _1533 = abs(_1517);
    float _1535 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1527);
    float _1537 = _1529 * _1507;
    float _1539 = float(_1533);
    float _1541 = fma(_1531, _1525, _1535);
    float _1543 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1545 = _1537 * (-2.0);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1549 = _809 + _1547;
    float _1551 = _1539 * _1519;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1557 = fma(_1545, _1429, _1429);
    float _1559 = fma(_1017, _1549, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1561 = fma(_1293, _1175, _1309);
    float _1563 = fma(_1127, _1545, _1127);
    float _1565 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1557);
    float _1567 = _1551 * (-2.0);
    float _1569 = 1.0 / _1555;
    float _1571 = fma(_1559, _1153, _1561);
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _809 + _1573;
    float _1577 = fma(_1085, _1567, _1085);
    float _1579 = fma(_1567, _1431, _1431);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1583 = _809 + _1581;
    float _1585 = _907 + (-0.5);
    float _1587 = fma(_1105, _1575, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1589 = fma(_1563, _1525, _1565);
    float _1591 = fma(_1053, _1583, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1593 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1579);
    float _1595 = -_915;
    float _1597 = _839 + _1595;
    float _1599 = fma(_1591, _1089, _1571);
    float _1601 = fma(_1577, _1525, _1593);
    float _1603 = _1589 * 0.15915493667125701904296875;
    bool _1605 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1607 = isnan(_809);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = fma(_1587, _1113, _1599);
    float _1619 = -_915;
    float _1621 = _847 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1623;
    float _1627 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1629 = -_1615;
    float _1631 = _1629 + 1.0;
    float _1633 = _1621 * _1621;
    float _1635 = _1625 * _1569;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1639 = _809 + _1637;
    float _1641 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1627);
    float _1643 = fma(_941, _941, _1633);
    float _1645 = _1083 * _1631;
    float _1647 = fma(_1635, _1639, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1649 = _1541 * 0.15915493667125701904296875;
    float _1651 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1641);
    float _1653 = fma(_945, _945, _1643);
    float _1655 = fma(_1647, _1645, _1617);
    float _1657 = _1649 * 6.283185482025146484375;
    float _1659 = sin(_1657);
    float _1661 = _1601 * 0.15915493667125701904296875;
    float _1663 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1665 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1667 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1655);
    float _1669 = _1597 + _1543;
    float _1671 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1663);
    float _1673 = _1649 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = _1667 * _1383;
    float _1679 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1671);
    float _1681 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1683 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1685 = _1677 * _1677;
    float _1687 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1689 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1681);
    float _1691 = _1603 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1683);
    float _1697 = _1687 + _1665;
    float _1699 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1689);
    float _1701 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1695);
    float _1703 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1705 = _1603 * 6.283185482025146484375;
    float _1707 = cos(_1705);
    float _1709 = sqrt(_1653);
    float _1711 = _1675 * _1693;
    float _1713 = _1659 * _1693;
    float _1715 = _1661 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = _1659 * _1707;
    float _1721 = _1675 * _1707;
    float _1723 = 1.0 / _1665;
    float _1725 = _865 * _1709;
    float _1727 = _1331 * _1725;
    float _1729 = _817 * _1725;
    float _1731 = _1661 * 6.283185482025146484375;
    float _1733 = cos(_1731);
    float _1735 = -_1711;
    float _1737 = fma(_1717, _1719, _1735);
    float _1739 = -_1719;
    float _1741 = fma(_1717, _1711, _1739);
    float _1743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1745 = fma(_1717, _1721, _1713);
    float _1747 = fma(_1717, _1713, _1721);
    float _1749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1751 = _1697 * _1723;
    float _1753 = _1751 * 0.5;
    float _1755 = _1727 * _1743;
    float _1757 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1759 = _1729 * _1749;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1761);
    float _1765 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1767 = _1765 * 0.5;
    float _1769 = -_1755;
    float _1771 = _1717 * _1769;
    float _1773 = trunc(_1703);
    int _1775 = int(_1773);
    float _1777 = _1675 * _1733;
    float _1779 = _1659 * _1733;
    float _1781 = _1707 * _1733;
    float _1783 = _1693 * _1733;
    float _1785 = _1777 * _1755;
    float _1787 = _1779 * _1755;
    float _1789 = fma(_1781, _1759, _1771);
    float _1791 = 1.0 / _1763;
    float _1793 = fma(_1745, _1759, _1785);
    float _1795 = fma(_1737, _1759, _1787);
    float _1797 = fma(_1783, _1767, _1789);
    float _1799 = fma(_1741, _1767, _1793);
    float _1801 = fma(_1747, _1767, _1795);
    float _1803 = trunc(_1757);
    int _1805 = int(_1803);
    float _1807 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1809 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1811 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1813 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1815 = _1775 + _1813;
    int _1817 = _1815 + 1;
    float _1819 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1807);
    float _1821 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1811);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1827 = _1791 * _1825;
    float _1829 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1819);
    float _1831 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1821);
    float _1833 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1823);
    float _1835 = rsqrt(_1685);
    bool _1837 = _1827 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1839 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1841 = _1827 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1843 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1845 = !_1837;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1851 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1853 = _1805 + _1851;
    int _1855 = _1853 + 1;
    float _1857 = _843 + _1843;
    float _1859 = _1839 * _1839;
    float _1861 = _841 + _1839;
    int _1863 = _1817 | _1855;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1857 + _1865;
    float _1869 = fma(_1849, _1849, _1859);
    int _1871 = 2;
    int _1873 = _1817;
    int _1875 = _1855;
    float _1877 = _1859;
    float _1879 = _1861;
    float _1881 = _1857;
    float _1883 = _1839;
    float _1885 = _1843;
    float _1887 = _1703;
    if (!_1837)
    {
        _1871 = 1;
    }
    int _1889 = _1871;
    float _1891 = _1843 * _1843;
    int _1893 = _1889;
    float _1895 = _1891;
    if (!_1841)
    {
        _1893 = _1847;
    }
    int _1897 = _1893;
    float _1899 = _1867 * _1867;
    bool _1901 = _1817 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1905 = _1861 + _1903;
    int _1907 = _1897 << 6;
    float _1909 = _1891 + _1869;
    bool _1911 = _1863 < 0;
    bool _1913 = _1911 || _1901;
    float _1915 = fma(_1905, _1905, _1899);
    int _1917 = _1907 + 48;
    uint _1920 = uint(int(uint(_1917) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    float _1936 = sqrt(_1685);
    bool _1938 = _1855 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1940 = _1938 || _1913;
    float _1942 = _1677 * _1835;
    int _1944 = _1907 + 56;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    uint _1948 = uint(int(uint(int(_1946)) >> uint(2)));
    int _1950 = int(_1946) & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = int(_1946) + 1;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    int _1958 = _1954 & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    float _1962 = rsqrt(_1909);
    float _1964 = as_type<float>(_1897);
    if (!_1940)
    {
        int _1966 = _1855 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1968 = _1966 + _1817;
        _1873 = _1968;
    }
    int _1970 = _1873;
    int _1972 = _1907 + 64;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
    float _1990 = sqrt(_1915);
    if (!_1940)
    {
        int _1992 = _1970 << 2;
        _1875 = _1992;
    }
    int _1994 = _1875;
    int _1996 = _1907 + 72;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
    int _2002 = int(_1998) & 3;
    float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
    int _2006 = int(_1998) + 1;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    int _2010 = _2006 & 3;
    float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
    float _2014 = _1849 * _1962;
    int _2016 = as_type<int>(_1962);
    int _2018 = _1994;
    if (!_1940)
    {
        uint _2020 = uint(int(uint(_1970) >> uint(2)));
        _2016 = int(_2020);
    }
    int _2022 = _2016;
    float _2024 = as_type<float>(_2022);
    if (!_1940)
    {
        int _2026 = 12 & _1994;
        _2018 = _2026;
    }
    int _2028 = _2018;
    float _2030 = _1942 * _2014;
    int _2032 = _1907 + 96;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c15)._m0[int(_2036)][_2038];
    int _2042 = int(_2034) + 1;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    int _2046 = _2042 & 3;
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[int(_2044)][_2046];
    bool _2050 = _1990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2030 * _1936;
    if (!_1940)
    {
        int _2054 = _2022 << 4;
        int _2056 = _2054 + _2028;
        _2024 = as_type<float>(_2056);
    }
    float _2058 = _2024;
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2062 = _2060 != 0;
    int _2064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2066 = _2064 != 0;
    int _2068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2070 = _2068 != 0;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2074 = _2072 != 0;
    float _2076 = fma(_1942, _2052, _1849);
    int _2078 = _1907 + 104;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c15)._m0[int(_2090)][_2092];
    bool _2096 = !_2066;
    int _2098 = _2096 ? 0 : 1;
    float _2100 = _839 + _2076;
    bool _2102 = !_2062;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = !_2070;
    int _2108 = _2106 ? 0 : 1;
    bool _2110 = !_2074;
    int _2112 = _2110 ? 0 : 1;
    bool _2114 = !_2050;
    float _2116 = _2100;
    float _2118 = _1926;
    if (!_2114)
    {
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2124 = _1990 + _2122;
        float _2126 = rsqrt(_1915);
        float _2128 = _2124 * _2120;
        float _2130 = _2100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2132 = _2128 * 0.15915493667125701904296875;
        float _2134 = _2132 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = _2132 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        float _2142 = fma(_2136, _2130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2144 = _2126 * _2142;
        float _2146 = _2140 + (-1.0);
        float _2148 = fma(_1905, _2144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2150 = fma(_1867, _2144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2152 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2154 = -_841;
        float _2156 = _2154 + _2148;
        float _2158 = -_843;
        float _2160 = _2158 + _2150;
        float _2162 = fma(_2100, _2140, _2152);
        float _2164 = _2156 * _2156;
        float _2166 = _2160 * _2160;
        _2116 = _2162;
        _1877 = _2164;
        _1895 = _2166;
        _1879 = _2148;
        _1881 = _2150;
        _1883 = _2156;
        _1885 = _2160;
    }
    float _2168 = _2116;
    float _2170 = _1877;
    float _2172 = _1895;
    float _2174 = _1879;
    float _2176 = _1881;
    float _2178 = _1883;
    float _2180 = _1885;
    int _2182 = _1907 + 80;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
    float _2200 = -_839;
    float _2202 = _2200 + _2168;
    float _2204 = _1669 * _2048;
    if (!_1940)
    {
        float _2206 = floor(_1703);
        _1187 = _2206;
    }
    float _2208 = _1187;
    float _2210 = _1669 * _1934;
    float _2212 = fma(_2202, _2202, _2170);
    float _2214 = fma(_879, _2040, _2204);
    float _2216 = _1669 * _1988;
    int _2218 = _1907 + 88;
    uint _2220 = uint(int(uint(_2218) >> uint(2)));
    uint _2222 = uint(int(uint(int(_2220)) >> uint(2)));
    int _2224 = int(_2220) & 3;
    float _2226 = (*spvDescriptorSet0.vp_c15)._m0[int(_2222)][_2224];
    int _2228 = int(_2220) + 1;
    uint _2230 = uint(int(uint(_2228) >> uint(2)));
    int _2232 = _2228 & 3;
    float _2234 = (*spvDescriptorSet0.vp_c15)._m0[int(_2230)][_2232];
    float _2236 = _2212 + _2172;
    float _2238 = fma(_883, _2086, _2214);
    float _2240 = fma(_879, _1926, _2210);
    float _2242 = _2214;
    float _2244 = _2240;
    if (!_1940)
    {
        float _2246 = floor(_1757);
        _2242 = _2246;
    }
    float _2248 = _2242;
    float _2250 = fma(_879, _1980, _2216);
    float _2252 = _2238 + _2094;
    float _2254 = fma(_883, _1952, _2240);
    float _2256 = _2058;
    float _2258 = _2254;
    if (!_1940)
    {
        int _2260 = as_type<int>(_2058) + 400;
        uint _2262 = uint(int(uint(_2260) >> uint(2)));
        uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
        int _2266 = int(_2262) & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        _2256 = _2268;
    }
    float _2270 = _2256;
    float _2272 = fma(_883, _2004, _2250);
    float _2274 = -_873;
    float _2276 = _2274 + _2174;
    float _2278 = sqrt(_2236);
    bool _2280 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2282 = isnan(0.5);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2288 = _2284 || _2286;
    float _2290 = -_915;
    float _2292 = _2290 + _2168;
    float _2294 = -_875;
    float _2296 = _2294 + _2176;
    float _2298 = _2254 + _1960;
    float _2300 = _2272 + _2012;
    float _2302 = 1.0 / _2252;
    bool _2304 = _2278 > 0.0;
    bool _2306 = !_2304;
    float _2308 = _2276;
    float _2310 = _2292;
    float _2312 = _2296;
    if (!_2306)
    {
        float _2314 = _215 * _215;
        float _2316 = fma(_213, _213, _2314);
        float _2318 = rsqrt(_2236);
        float _2320 = fma(_217, _217, _2316);
        float _2322 = sqrt(_2320);
        float _2324 = _2318 * _2178;
        float _2326 = _2202 * _2318;
        float _2328 = _2318 * _2180;
        bool _2330 = _2322 > 0.0;
        bool _2332 = !_2330;
        _2244 = _2318;
        _2118 = _2320;
        _2258 = _2322;
        if (!_2332)
        {
            float _2334 = rsqrt(_2320);
            float _2336 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2338 = _215 * _2334;
            float _2340 = _213 * _2334;
            float _2342 = _2326 * _2338;
            float _2344 = _217 * _2334;
            float _2346 = fma(_2324, _2340, _2342);
            float _2348 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2350 = fma(_2328, _2344, _2346);
            float _2352 = _2350 * _2348;
            float _2354 = fma(_213, _2352, _2276);
            float _2356 = fma(_215, _2352, _2292);
            float _2358 = fma(_217, _2352, _2296);
            _2308 = _2354;
            _2310 = _2356;
            _2312 = _2358;
            _2244 = _2352;
            _2118 = _2334;
            _2258 = _2344;
        }
    }
    float _2360 = _2308;
    float _2362 = _2310;
    float _2364 = _2312;
    float _2366 = _2244;
    float _2368 = _2118;
    float _2370 = _2258;
    float _2372 = _2368;
    float _2374 = _2366;
    float _2376 = _2370;
    if (_2288)
    {
        _2372 = _2360;
    }
    float _2378 = _2372;
    float _2380 = _2378;
    if (_2288)
    {
        _2374 = _2362;
    }
    float _2382 = _2374;
    float _2384 = _2382;
    if (_2288)
    {
        _2376 = _2364;
    }
    float _2386 = _2376;
    float _2388 = _2386;
    if (!_2288)
    {
        float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2392 = _1597 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2396 = _879 + _2394;
        float _2398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = -_879;
        float _2402 = _2400 + _2360;
        float _2404 = _2392 * _2392;
        float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2408 = _883 + _2406;
        float _2410 = -_1597;
        float _2412 = _2410 + _2362;
        float _2414 = fma(_2396, _2396, _2404);
        float _2416 = -_883;
        float _2418 = _2416 + _2364;
        float _2420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2422 = fma(_2408, _2408, _2414);
        float _2424 = sqrt(_2422);
        float _2426 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = precise::min(_2424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2430 = _2428 * _2420;
        float _2432 = _2426 * _2430;
        float _2434 = fma(_2402, _2432, _879);
        float _2436 = fma(_2412, _2432, _1597);
        float _2438 = fma(_2418, _2432, _883);
        _2384 = _2436;
        _2380 = _2434;
        _2388 = _2438;
    }
    float _2440 = _2384;
    float _2442 = _2380;
    float _2444 = _2388;
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2448 = _2298 * _2302;
    float _2450 = _2300 * _2302;
    float _2452 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2446);
    bool _2458 = _2448 >= 0.0;
    float _2460 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2452);
    float _2462 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2464 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2456);
    bool _2466 = _2448 <= 1.0;
    bool _2468 = _2466 && _2458;
    float _2470 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2460);
    float _2472 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2462);
    float _2474 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2476 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2478 = _2470 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2480 = _2472 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2482 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2474);
    float _2484 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2486 = _2450 >= 0.0;
    bool _2488 = _2486 && _2468;
    float _2490 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2494 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2496 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2484);
    bool _2498 = _2450 <= 1.0;
    bool _2500 = _2498 && _2488;
    float _2502 = -_2492;
    float _2504 = fma(_2502, _2490, 1.0);
    float _2506 = _2494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2508 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2496);
    float _2510 = _1669 * _2198;
    float _2512 = log2(_2504);
    float _2514 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2516 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2518 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2520 = fma(_879, _2190, _2510);
    float _2522 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2514);
    float _2524 = _2504;
    if (!_1940)
    {
        float _2526 = -_2208;
        float _2528 = _1703 + _2526;
        _1887 = _2528;
    }
    float _2530 = _1887;
    float _2532 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2518);
    float _2534 = 1.0 / _2516;
    if (_2500)
    {
        float _2536 = float(_1897);
        _1964 = _2536;
    }
    float _2538 = _1964;
    float _2540 = fma(_883, _2226, _2520);
    float _2542 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2532);
    float _2544 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2522);
    if (!_1940)
    {
        float _2546 = -_2248;
        float _2548 = _1757 + _2546;
        _2524 = _2548;
    }
    float _2550 = _2524;
    float _2552 = _2540 + _2234;
    float _2554 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2542);
    float _2556 = _2364;
    if (!_1940)
    {
        float _2558 = rint(_2270);
        float _2560 = precise::max(_2558, 0.0);
        uint _2562 = uint(_2560);
        uint _2564 = clamp(_2562, 0u, 65535u);
        _2556 = as_type<float>(_2564);
    }
    float _2566 = _2556;
    float _2568 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2544);
    float _2570 = _2512 * 0.693147182464599609375;
    float _2572 = _2552 * _2302;
    float _2574 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2576 = _2518;
    if (_2500)
    {
        float _2578 = rint(_2538);
        float _2580 = precise::max(_2578, 0.0);
        uint _2582 = uint(_2580);
        uint _2584 = clamp(_2582, 0u, 65535u);
        _2576 = as_type<float>(_2584);
    }
    float _2586 = _2576;
    float _2588 = _2554 * _2534;
    float _2590 = _2568 * _2534;
    float _2592 = fma(_2588, 0.5, 0.5);
    float _2594 = fma(_2590, -0.5, 0.5);
    float _2596 = _2550;
    if (!_1940)
    {
        float3 _8946 = float3(_2530, _2550, float(as_type<int>(_2566)));
        float3 _8950 = select(_8946, float3(0.0), isnan(_8946));
        float _2598 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8950.xy, uint(rint(_8950.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8950.xy, uint(rint(_8950.z)), level(0.0)).x;
        _2596 = _2598;
    }
    float _2600 = _2596;
    float _2602 = _2450;
    if (_2500)
    {
        float3 _8965 = float3(_2448, _2450, float(as_type<int>(_2586)));
        float3 _8967 = select(_8965, float3(0.0), isnan(_8965));
        float _2604 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8967.xy, uint(rint(_8967.z)), _2572, level(0.0));
        _2602 = _2604;
    }
    float _2606 = _2602;
    float3 _8977 = float3(_2592, _2594, _2574);
    float _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8977, float3(0.0), isnan(_8977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8977, float3(0.0), isnan(_8977)), level(0.0)).x;
    float3 _8986 = float3(_2592, _2594, _2574);
    float4 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8986, float3(0.0), isnan(_8986)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8986, float3(0.0), isnan(_8986)), level(0.0)).xyzw;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = _2611.w;
    float _2621 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2623 = int(_2621);
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2627 = _2625 != 0;
    int _2629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2631 = _2629 != 0;
    int _2633 = abs(_1323);
    int _2635 = abs(_1329);
    float _2637 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2639 = int(_2637);
    int _2641 = abs(_2098);
    int _2643 = abs(_2104);
    if (_2627)
    {
        float _2645 = in.m_68.x;
        _1189 = _2645;
    }
    float _2647 = _1189;
    float _2649 = float(uint(_2623));
    float _2651 = trunc(_1483);
    int _2653 = int(_2651);
    float _2655 = _2647;
    if (!_2627)
    {
        float _2657 = in.m_68.y;
        _2655 = _2657;
    }
    float _2659 = _2655;
    int _2661 = ~_2623;
    int _2663 = _2661 + 1;
    float _2665 = float(uint(_2639));
    float _2667 = 1.0 / _2649;
    float _2669 = trunc(_1443);
    int _2671 = int(_2669);
    float _2673 = float(uint(_2653));
    int _2675 = ~_2639;
    int _2677 = _2675 + 1;
    if (_2627)
    {
        _1521 = 1.0;
    }
    float _2679 = _1521;
    float _2681 = _2679;
    if (!_2627)
    {
        _2681 = 1.2345600128173828125;
    }
    float _2683 = _2681;
    float _2685 = 1.0 / _2665;
    int _2687 = as_type<int>(_2667) + (-2);
    int _2689 = ~_2623;
    int _2691 = _2689 + 1;
    float _2693 = _2659 * _2683;
    float _2695 = as_type<float>(_2687) * _2673;
    float _2697 = float(uint(_2671));
    float _2699 = floor(_2693);
    int _2701 = as_type<int>(_2685) + (-2);
    float _2703 = trunc(_2695);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    float _2709 = as_type<float>(_2701) * _2697;
    float _2711 = _2697;
    if (_2627)
    {
        _2711 = 1.0;
    }
    float _2713 = _2711;
    float _2715 = _2713;
    if (!_2627)
    {
        _2715 = 7.345489978790283203125;
    }
    float _2717 = _2715;
    float _2719 = -_2699;
    float _2721 = _2693 + _2719;
    float _2723 = trunc(_2709);
    float _2725 = precise::max(_2723, 0.0);
    uint _2727 = uint(_2725);
    float _2729 = _2717 * _903;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2733 = _2731 != 0;
    int _2735 = _2691 * int(_2707);
    int _2737 = _2735 + _2653;
    float _2739 = floor(_2729);
    float _2741 = float(uint(_2737));
    int _2743 = _2677 * int(_2727);
    int _2745 = _2743 + _2671;
    float _2747 = as_type<float>(_2687) * _2741;
    float _2749 = float(uint(_2745));
    float _2751 = trunc(_2747);
    float _2753 = precise::max(_2751, 0.0);
    uint _2755 = uint(_2753);
    float _2757 = -_2739;
    float _2759 = _2729 + _2757;
    float _2761 = float(_2623);
    float _2763 = as_type<float>(_2701) * _2749;
    float _2765 = trunc(_2763);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    bool _2771 = !_2733;
    int _2773 = _2771 ? 0 : 1;
    int _2775 = int(_2707) + int(_2755);
    float _2777 = _2759 * _2761;
    float _2779 = float(_2653);
    int _2781 = ~_2639;
    int _2783 = _2781 + 1;
    int _2785 = _2663 * _2775;
    int _2787 = _2785 + _2653;
    int _2789 = int(_2727) + int(_2769);
    float _2791 = trunc(_2777);
    int _2793 = int(_2791);
    bool _2795 = _2779 >= _2761;
    bool _2797 = isnan(_2779);
    bool _2799 = _2795 || _2797;
    bool _2801 = isnan(_2761);
    bool _2803 = _2799 || _2801;
    float _2805 = float(_2803);
    bool _2807 = uint(_2787) >= uint(_2623);
    int _2809 = _2783 * _2789;
    int _2811 = _2809 + _2671;
    float _2813 = float(_2639);
    float _2815 = float(_2671);
    float _2817 = trunc(_2805);
    int _2819 = int(_2817);
    bool _2821 = !_2807;
    int _2823 = _2821 ? 0 : (-1);
    bool _2825 = _2815 >= _2813;
    bool _2827 = isnan(_2815);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(_2813);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    bool _2837 = uint(_2811) >= uint(_2639);
    int _2839 = abs(_2773);
    float _2841 = _2761 * _1231;
    int _2843 = ~_2775;
    int _2845 = _2843 + _2823;
    int _2847 = _2845 + 1;
    float _2849 = trunc(_2835);
    int _2851 = int(_2849);
    float _2853 = _2813 * _1231;
    float _2855 = _2721 * _2813;
    bool _2857 = !_2837;
    int _2859 = _2857 ? 0 : (-1);
    int _2861 = _2793 * _2839;
    int _2863 = _2861 + _2653;
    bool _2865 = _2623 == 0;
    int _2867 = _2623 * _2847;
    int _2869 = _2867 + _2653;
    int _2871 = ~_2789;
    int _2873 = _2871 + _2859;
    int _2875 = _2873 + 1;
    float _2877 = trunc(_2841);
    int _2879 = int(_2877);
    int _2881 = ~_2819;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    bool _2887 = !_2865;
    int _2889 = _2887 ? _2869 : (-1);
    int _2891 = _2639 * _2875;
    int _2893 = _2891 + _2671;
    bool _2895 = _2639 == 0;
    int _2897 = _2623 + (-1);
    int _2899 = _2889 * _2885;
    int _2901 = abs(_1317);
    int _2903 = ~_2851;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    int _2909 = _2819 * _2897;
    int _2911 = _2909 + _2899;
    bool _2913 = !_2895;
    int _2915 = _2913 ? _2893 : (-1);
    int _2917 = _2639 + (-1);
    int _2919 = _2915 * _2907;
    int _2921 = _2851 * _2917;
    int _2923 = _2921 + _2919;
    bool _2925 = !_2631;
    int _2927 = _2925 ? 0 : 1;
    int _2929 = _2911 * _2901;
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2933 = _2931 != 0;
    float _2935 = trunc(_2855);
    int _2937 = int(_2935);
    int _2939 = _2923 * _2641;
    int _2941 = _2879 * _2633;
    int _2943 = _2941 + _2929;
    int _2945 = abs(_2927);
    bool _2947 = !_2933;
    int _2949 = _2947 ? 0 : 1;
    int _2951 = _2863 * _2635;
    int _2953 = _2951 + _2943;
    float _2955 = trunc(_2853);
    int _2957 = int(_2955);
    bool _2959 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2961 = isnan(0.5);
    bool _2963 = _2959 || _2961;
    bool _2965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2967 = _2963 || _2965;
    int _2969 = _2793 * _2945;
    int _2971 = _2969 + _2953;
    int _2973 = abs(_2949);
    float _2975 = float(uint(_2971));
    int _2977 = _2937 * _2973;
    int _2979 = _2977 + _2671;
    int _2981 = abs(_2108);
    int _2983 = abs(_2112);
    float _2985 = as_type<float>(_2687) * _2975;
    int _2987 = ~_2639;
    int _2989 = _2987 + 1;
    int _2991 = _2957 * _2643;
    int _2993 = _2991 + _2939;
    float _2995 = trunc(_2985);
    float _2997 = precise::max(_2995, 0.0);
    uint _2999 = uint(_2997);
    float _3001 = float(uint(_2863));
    int _3003 = _2979 * _2981;
    int _3005 = _3003 + _2993;
    float _3007 = float(uint(_2979));
    float _3009 = as_type<float>(_2687) * _3001;
    int _3011 = _2937 * _2983;
    int _3013 = _3011 + _3005;
    int _3015 = ~_2623;
    int _3017 = _3015 + 1;
    float _3019 = as_type<float>(_2701) * _3007;
    float _3021 = trunc(_3009);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    float _3027 = float(uint(_3013));
    int _3029 = _3017 * int(_2999);
    int _3031 = _3029 + _2971;
    float _3033 = as_type<float>(_2701) * _3027;
    float _3035 = trunc(_3019);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    int _3041 = ~_2623;
    int _3043 = _3041 + 1;
    float _3045 = float(uint(_3031));
    int _3047 = ~_2639;
    int _3049 = _3047 + 1;
    float _3051 = trunc(_3033);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    float _3057 = as_type<float>(_2687) * _3045;
    int _3059 = _3043 * int(_3025);
    int _3061 = _3059 + _2863;
    float _3063 = float(uint(_3061));
    float _3065 = trunc(_3057);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    int _3071 = _3049 * int(_3039);
    int _3073 = _3071 + _2979;
    float _3075 = as_type<float>(_2687) * _3063;
    float _3077 = _3063;
    float _3079 = _3057;
    float _3081 = as_type<float>(_2943);
    float _3083 = as_type<float>(_2899);
    float _3085 = as_type<float>(_2901);
    if (_2967)
    {
        _3077 = 1.0;
    }
    float _3087 = _3077;
    int _3089 = _2989 * int(_3055);
    int _3091 = _3089 + _3013;
    float _3093 = float(uint(_3073));
    float _3095 = _3087;
    if (_1940)
    {
        _3079 = 1.0;
    }
    float _3097 = _3079;
    float _3099 = float(uint(_3091));
    float _3101 = as_type<float>(_2701) * _3093;
    int _3103 = int(_2999) + int(_3069);
    float _3105 = as_type<float>(_2701) * _3099;
    float _3107 = _3097;
    if (!_2967)
    {
        float _3109 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3111 = _3109 * 0.15915493667125701904296875;
        float _3113 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3117 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3115;
        float _3119 = _3111 * 6.283185482025146484375;
        float _3121 = cos(_3119);
        float _3123 = _3113 * 0.15915493667125701904296875;
        float _3125 = _3111 * 6.283185482025146484375;
        float _3127 = sin(_3125);
        float _3129 = 1.0 / _3121;
        float _3131 = _3123 * 6.283185482025146484375;
        float _3133 = cos(_3131);
        float _3135 = _3127 * _3129;
        float _3137 = _3123 * 6.283185482025146484375;
        float _3139 = sin(_3137);
        float _3141 = _3133 * _3135;
        float _3143 = 1.0 / _3117;
        float _3145 = 1.0 / _3141;
        float _3147 = _3139 * _3145;
        float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3151 = fma(_1827, _3147, _3149);
        float _3153 = _3151 * _3143;
        float _3155 = precise::clamp(_3153, 0.0, 1.0);
        _3081 = _3143;
        _3083 = _3123;
        _3095 = _3155;
    }
    float _3157 = _3081;
    float _3159 = _3083;
    float _3161 = _3095;
    if (!_1940)
    {
        int _3163 = _1970 << 4;
        int _3165 = _3163 + 2048;
        uint _3167 = uint(int(uint(_3165) >> uint(2)));
        uint _3169 = uint(int(uint(int(_3167)) >> uint(2)));
        int _3171 = int(_3167) & 3;
        float _3173 = (*spvDescriptorSet0.vp_c15)._m0[int(_3169)][_3171];
        int _3175 = int(_3167) + 1;
        uint _3177 = uint(int(uint(_3175) >> uint(2)));
        int _3179 = _3175 & 3;
        float _3181 = (*spvDescriptorSet0.vp_c15)._m0[int(_3177)][_3179];
        int _3183 = _3165 + 8;
        uint _3185 = uint(int(uint(_3183) >> uint(2)));
        uint _3187 = uint(int(uint(int(_3185)) >> uint(2)));
        int _3189 = int(_3185) & 3;
        float _3191 = (*spvDescriptorSet0.vp_c15)._m0[int(_3187)][_3189];
        int _3193 = int(_3185) + 1;
        uint _3195 = uint(int(uint(_3193) >> uint(2)));
        int _3197 = _3193 & 3;
        float _3199 = (*spvDescriptorSet0.vp_c15)._m0[int(_3195)][_3197];
        float _3201 = _1669 * _3181;
        float _3203 = fma(_879, _3173, _3201);
        float _3205 = fma(_883, _3191, _3203);
        float _3207 = _3205 + _3199;
        float _3209 = precise::clamp(_3207, 0.0, 1.0);
        float _3211 = -_3209;
        float _3213 = _3211 + _2600;
        float _3215 = fma(_3213, 500.0, 1.5);
        float _3217 = exp2(_3215);
        float _3219 = 0.0 + _3217;
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        _3107 = _3221;
    }
    float _3223 = _3107;
    float _3225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3227 = _2440 + _3225;
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3231 = _2442 + _3229;
    float _3233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3235 = _2444 + _3233;
    float _3237 = _3227 * _3227;
    float _3239 = fma(_3231, _3231, _3237);
    float _3241 = fma(_3235, _3235, _3239);
    float _3243 = rsqrt(_3241);
    float _3245 = sqrt(_3241);
    float _3247 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3249 = _3231 * _3247;
    float _3251 = _3235 * _3247;
    float _3253 = _3249 * _3249;
    float _3255 = _3251 * _3251;
    float _3257 = _3253 + _3255;
    float _3259 = sqrt(_3257);
    bool _3261 = _3259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3265 = _3259 + _3263;
    float _3267 = _3157;
    float _3269 = _3257;
    float _3271 = _3265;
    float _3273 = _3249;
    float _3275 = _3251;
    float _3277 = _3253;
    float _3279 = _3255;
    if (_3261)
    {
        float _3281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3267 = _3281;
    }
    float _3283 = _3267;
    if (_3261)
    {
        float _3285 = rsqrt(_3257);
        _3269 = _3285;
    }
    float _3287 = _3269;
    if (_3261)
    {
        float _3289 = _3265 * _3283;
        _3271 = _3289;
    }
    float _3291 = _3271;
    if (_3261)
    {
        float _3293 = _3291 * 0.15915493667125701904296875;
        _3085 = _3293;
    }
    float _3295 = _3085;
    float _3297 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3299 = _3159;
    if (_3261)
    {
        float _3301 = _3295 * 6.283185482025146484375;
        float _3303 = sin(_3301);
        _3299 = _3303;
    }
    float _3305 = _3299;
    float _3307 = precise::max(0.0, _3297);
    float _3309 = _3291;
    float _3311 = _3307;
    if (_3261)
    {
        float _3313 = _3295 * 6.283185482025146484375;
        float _3315 = cos(_3313);
        _3309 = _3315;
    }
    float _3317 = _3309;
    float _3319 = -_3247;
    float _3321 = -_3307;
    float _3323 = fma(_3227, _3319, _3321);
    float _3325 = _3323;
    if (_3261)
    {
        float _3327 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3327;
    }
    float _3329 = _3311;
    float _3331 = _3305;
    float _3333 = _3329;
    if (_3261)
    {
        float _3335 = fma(_3305, _3329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3331 = _3335;
    }
    float _3337 = _3331;
    float _3339 = _3337;
    if (_3261)
    {
        float _3341 = _3287 * _3337;
        _3339 = _3341;
    }
    float _3343 = _3339;
    if (_3261)
    {
        float _3345 = _3317 + (-1.0);
        _3333 = _3345;
    }
    float _3347 = _3333;
    float _3349 = _3347;
    if (_3261)
    {
        float _3351 = _3249 * _3343;
        _3273 = _3351;
    }
    float _3353 = _3273;
    if (_3261)
    {
        float _3355 = _3251 * _3343;
        _3275 = _3355;
    }
    float _3357 = _3275;
    if (_3261)
    {
        float _3359 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3349 = _3359;
    }
    float _3361 = _3349;
    if (_3261)
    {
        float _3363 = _3353 * _3353;
        _3277 = _3363;
    }
    float _3365 = _3277;
    if (_3261)
    {
        float _3367 = _3357 * _3357;
        _3279 = _3367;
    }
    float _3369 = _3279;
    if (_3261)
    {
        float _3371 = fma(_3323, _3317, _3361);
        _3325 = _3371;
    }
    float _3373 = _3325;
    float _3375 = fma(_3373, _3373, _3365);
    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3379 = fma(_3245, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3377);
    float _3381 = precise::clamp(_3379, 0.0, 1.0);
    float _3383 = _3375 + _3369;
    float _3385 = -_3381;
    float _3387 = _3385 + 1.0;
    float _3389 = rsqrt(_3383);
    float _3391 = _3389 * _3353;
    float _3393 = _3389 * _3373;
    float _3395 = _3389 * _3357;
    float _3397 = _3391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3399 = trunc(_3105);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    float _3405 = -_3397;
    float _3407 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3405);
    float _3409 = -_3395;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3407);
    float _3413 = abs(_3387);
    float _3415 = log2(_3413);
    float _3417 = fma(_3411, -0.5, 0.5);
    float _3419 = fma(_3411, 0.5, 0.5);
    float _3421 = _3393 + 1.0;
    float _3423 = fma(_3419, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3425 = sqrt(_3417);
    float _3427 = fma(_3419, _3423, -0.212114393711090087890625);
    float _3429 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3431 = fma(_3419, _3427, 1.570728778839111328125);
    int _3433 = ~_2623;
    int _3435 = _3433 + 1;
    float _3437 = trunc(_3075);
    float _3439 = precise::max(_3437, 0.0);
    uint _3441 = uint(_3439);
    float _3443 = _3425 * 0.636619746685028076171875;
    float _3445 = exp2(_3429);
    float _3447 = -_3393;
    float _3449 = fma(_3445, _3421, _3447);
    float _3451 = -_3431;
    float _3453 = fma(_3443, _3451, 1.0);
    float _3455 = fma(_3449, 0.5, 0.5);
    int _3457 = _3435 * _3103;
    int _3459 = _3457 + _2971;
    float2 _10163 = float2(_3453, _3455);
    float3 _3463 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10163, float2(0.0), isnan(_10163)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10163, float2(0.0), isnan(_10163)), level(0.0)).xyz;
    float _3465 = _3463.x;
    float _3467 = _3463.y;
    float _3469 = _3463.z;
    bool _3471 = uint(_3459) >= uint(_2623);
    float _3473 = trunc(_3101);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    int _3479 = int(_3055) + int(_3403);
    out.m_74.x = _595;
    out.m_74.y = _597;
    out.m_74.z = _589;
    out.m_74.w = _599;
    bool _3481 = !_3471;
    int _3483 = _3481 ? 0 : (-1);
    float _3485 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _3487 = ~_2639;
    int _3489 = _3487 + 1;
    out.m_76.x = _773;
    out.m_76.y = _775;
    out.m_76.z = _777;
    out.m_76.w = _779;
    int _3491 = ~_3103;
    int _3493 = _3491 + _3483;
    int _3495 = _3493 + 1;
    float _3497 = -_1463;
    float _3499 = _3497 + 1.0;
    out.m_78.x = _879;
    out.m_78.y = _1597;
    out.m_78.z = _883;
    bool _3501 = _909 > 0.5;
    int _3503 = _2623 * _3495;
    int _3505 = _3503 + _2971;
    int _3507 = ~_2623;
    int _3509 = _3507 + 1;
    int _3511 = _3489 * _3479;
    int _3513 = _3511 + _3013;
    int _3515 = int(_3025) + int(_3441);
    out.m_80.w = _869;
    bool _3517 = !_2865;
    int _3519 = _3517 ? _3505 : (-1);
    float _3521 = exp2(_3485);
    bool _3523 = uint(_3513) >= uint(_2639);
    int _3525 = _3509 * _3515;
    int _3527 = _3525 + _2863;
    int _3529 = int(_3039) + int(_3477);
    float _3531 = -_1499;
    float _3533 = _3531 + 1.0;
    int _3535 = ~_2639;
    int _3537 = _3535 + 1;
    float _3539 = -_901;
    float _3541 = _3539 + 1.0;
    float _3543 = -_211;
    int _3545 = _3501 ? as_type<int>(_3543) : as_type<int>(_211);
    float _3547 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3549 = int(_3547);
    int _3551 = _3519 & 3;
    bool _3553 = _3551 != 0;
    int _3555 = _3537 * _3529;
    int _3557 = _3555 + _2979;
    int _3559 = _3519 & 3;
    bool _3561 = _3559 != 0;
    out.m_82.x = _1729;
    bool _3563 = !_3523;
    int _3565 = _3563 ? 0 : (-1);
    int _3567 = _3553 ? 0 : 1;
    out.m_84.x = _2442;
    out.m_84.y = _2440;
    out.m_84.z = _2444;
    bool _3569 = uint(_3527) >= uint(_2623);
    bool _3571 = uint(_3559) >= 2u;
    int _3573 = ~_3479;
    int _3575 = _3573 + _3565;
    int _3577 = _3575 + 1;
    int _3579 = _3519 >> 31;
    bool _3581 = !_3569;
    int _3583 = _3581 ? 0 : (-1);
    int _3585 = _2639 * _3577;
    int _3587 = _3585 + _3013;
    int _3589 = _3571 ? 0 : 1;
    bool _3591 = _3559 != 3;
    bool _3593 = uint(_3557) >= uint(_2639);
    int _3595 = _3579 & 3;
    int _3597 = ~_3515;
    int _3599 = _3597 + _3583;
    int _3601 = _3599 + 1;
    int _3603 = _3519 + _3595;
    bool _3605 = !_2895;
    int _3607 = _3605 ? _3587 : (-1);
    int _3609 = _2623 * _3601;
    int _3611 = _3609 + _2863;
    int _3613 = ~_3589;
    int _3615 = _3613 + 1;
    int _3617 = _3615 + 1;
    int _3619 = _3607 >> 31;
    int _3621 = _3617;
    if (_3591)
    {
        int _3623 = ~_3589;
        int _3625 = _3623 + 1;
        _3621 = _3625;
    }
    int _3627 = _3621;
    int _3629 = _3619 & 3;
    int _3631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3633 = _3631 != 0;
    int _3635 = _3607 + _3629;
    int _3637 = _3603 >> 2;
    bool _3639 = !_3633;
    float _3641 = _3639 ? _211 : as_type<float>(_3545);
    bool _3643 = !_2865;
    int _3645 = _3643 ? _3611 : (-1);
    int _3647 = _3607 & 3;
    bool _3649 = _3647 != 0;
    int _3651 = _3607 & 3;
    bool _3653 = _3651 != 0;
    int _3655 = _3635 >> 2;
    bool _3657 = uint(_3559) > 1u;
    int _3659 = _3637 << 4;
    int _3661 = _3659 + 368;
    int _3663 = _3655 << 4;
    int _3665 = _3663 + 512;
    uint _3667 = uint(int(uint(_3661) >> uint(2)));
    uint _3669 = uint(int(uint(int(_3667)) >> uint(2)));
    int _3671 = int(_3667) & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    int _3675 = int(_3667) + 1;
    uint _3677 = uint(int(uint(_3675) >> uint(2)));
    int _3679 = _3675 & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    bool _3683 = !_3561;
    int _3685 = _3683 ? 0 : 1;
    bool _3687 = uint(_3651) > 1u;
    int _3689 = ~_3567;
    int _3691 = _3689 + 1;
    int _3693 = _3691 + 1;
    int _3695 = _3693;
    if (!_3657)
    {
        int _3697 = ~_3567;
        int _3699 = _3697 + 1;
        _3695 = _3699;
    }
    int _3701 = _3695;
    uint _3703 = uint(int(uint(_3665) >> uint(2)));
    uint _3705 = uint(int(uint(int(_3703)) >> uint(2)));
    int _3707 = int(_3703) & 3;
    float _3709 = (*spvDescriptorSet0.vp_c9)._m0[int(_3705)][_3707];
    int _3711 = int(_3703) + 1;
    uint _3713 = uint(int(uint(_3711) >> uint(2)));
    int _3715 = _3711 & 3;
    float _3717 = (*spvDescriptorSet0.vp_c9)._m0[int(_3713)][_3715];
    bool _3719 = !_3593;
    int _3721 = _3719 ? 0 : (-1);
    int _3723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3725 = _3723 != 0;
    int _3727 = _3649 ? 0 : 1;
    int _3729 = ~_3529;
    int _3731 = _3729 + _3721;
    int _3733 = _3731 + 1;
    bool _3735 = !_3725;
    int _3737 = _3735 ? 0 : 1;
    int _3739 = _3661 + 8;
    uint _3741 = uint(int(uint(_3739) >> uint(2)));
    uint _3743 = uint(int(uint(int(_3741)) >> uint(2)));
    int _3745 = int(_3741) & 3;
    float _3747 = (*spvDescriptorSet0.vp_c9)._m0[int(_3743)][_3745];
    int _3749 = int(_3741) + 1;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    int _3753 = _3749 & 3;
    float _3755 = (*spvDescriptorSet0.vp_c9)._m0[int(_3751)][_3753];
    bool _3757 = !_3653;
    int _3759 = _3757 ? 0 : 1;
    int _3761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3763 = _3761 != 0;
    int _3765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3767 = _3765 != 0;
    int _3769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3771 = _3769 != 0;
    int _3773 = ~_3727;
    int _3775 = _3773 + 1;
    int _3777 = _3775 + 1;
    int _3779 = _3777;
    if (!_3687)
    {
        int _3781 = ~_3727;
        int _3783 = _3781 + 1;
        _3779 = _3783;
    }
    int _3785 = _3779;
    int _3787 = _3665 + 8;
    uint _3789 = uint(int(uint(_3787) >> uint(2)));
    uint _3791 = uint(int(uint(int(_3789)) >> uint(2)));
    int _3793 = int(_3789) & 3;
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[int(_3791)][_3793];
    int _3797 = int(_3789) + 1;
    uint _3799 = uint(int(uint(_3797) >> uint(2)));
    int _3801 = _3797 & 3;
    float _3803 = (*spvDescriptorSet0.vp_c9)._m0[int(_3799)][_3801];
    bool _3805 = !_3763;
    int _3807 = _3805 ? 0 : 1;
    bool _3809 = _3559 != 3;
    bool _3811 = _3651 != 3;
    bool _3813 = !_3809;
    int _3815 = _3813 ? 0 : (-1);
    bool _3817 = uint(_3651) >= 2u;
    bool _3819 = _3651 != 3;
    int _3821 = _3817 ? 0 : 1;
    int _3823 = abs(_3785);
    int _3825 = ~_3821;
    int _3827 = _3825 + 1;
    int _3829 = _3827 + 1;
    int _3831 = _3829;
    if (_3811)
    {
        int _3833 = ~_3821;
        int _3835 = _3833 + 1;
        _3831 = _3835;
    }
    int _3837 = _3831;
    bool _3839 = _905 > 0.5;
    float _3841 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3843 = abs(_3701);
    float _3845 = -_1717;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3841);
    int _3849 = ~_3843;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    int _3855 = abs(_3685);
    int _3857 = ~_3823;
    int _3859 = _3857 + 1;
    int _3861 = _3859 + 1;
    int _3863 = _3853 * as_type<int>(_3681);
    int _3865 = abs(_3759);
    int _3867 = ~_3855;
    int _3869 = _3867 + 1;
    int _3871 = _3869 + 1;
    int _3873 = _3861 * as_type<int>(_3717);
    bool _3875 = _903 > 0.5;
    int _3877 = _2639 * _3733;
    int _3879 = _3877 + _2979;
    int _3881 = abs(_3627);
    float _3883 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3885 = ~_3865;
    int _3887 = _3885 + 1;
    int _3889 = _3887 + 1;
    int _3891 = _3871 * as_type<int>(_3673);
    int _3893 = _3891 + _3863;
    int _3895 = abs(_3837);
    float _3897 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3899 = _3889 * as_type<int>(_3709);
    int _3901 = _3899 + _3873;
    bool _3903 = !_2895;
    int _3905 = _3903 ? _3879 : (-1);
    float _3907 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3909 = int(_3907);
    bool _3911 = _907 > 0.5;
    float _3913 = -_1717;
    float _3915 = fma(_3913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3883);
    float _3917 = -_1717;
    float _3919 = fma(_3917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3897);
    int _3921 = ~_3881;
    int _3923 = _3921 + 1;
    int _3925 = _3923 + 1;
    float _3927 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3915);
    bool _3929 = !_3819;
    int _3931 = _3929 ? 0 : (-1);
    int _3933 = ~_3895;
    int _3935 = _3933 + 1;
    int _3937 = _3935 + 1;
    int _3939 = _3925 * as_type<int>(_3747);
    int _3941 = _3939 + _3893;
    int _3943 = abs(_3815);
    float _3945 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3847);
    float _3947 = float(uint(_3549));
    int _3949 = _3937 * as_type<int>(_3795);
    int _3951 = _3949 + _3901;
    int _3953 = abs(_3931);
    float _3955 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3919);
    int _3957 = abs(_3737);
    float _3959 = 1.0 / _3947;
    int _3961 = ~_3943;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = ~_3953;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    int _3973 = ~_3957;
    int _3975 = _3973 + 1;
    int _3977 = _3975 + 1;
    int _3979 = _3965 * as_type<int>(_3755);
    int _3981 = _3979 + _3941;
    int _3983 = abs(_3549);
    int _3985 = _3971 * as_type<int>(_3803);
    int _3987 = _3985 + _3951;
    float _3989 = float(uint(_3909));
    int _3991 = _3981 * _3977;
    int _3993 = abs(_3807);
    float _3995 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3997 = _3645 * _3957;
    int _3999 = _3997 + _3991;
    float _4001 = 1.0 / _3989;
    int _4003 = ~_3993;
    int _4005 = _4003 + 1;
    int _4007 = _4005 + 1;
    float _4009 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4011 = float(uint(_3983));
    float _4013 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3995);
    int _4015 = abs(_3909);
    int _4017 = _3987 * _4007;
    int _4019 = as_type<int>(_3959) + (-2);
    float _4021 = 1.0 / _4011;
    float _4023 = float(uint(_4015));
    int _4025 = _3905 * _3993;
    int _4027 = _4025 + _4017;
    float _4029 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4031 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4033 = -_211;
    int _4035 = _3839 ? as_type<int>(_4033) : as_type<int>(_211);
    float _4037 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4009);
    float _4039 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4029);
    int _4041 = as_type<int>(_4001) + (-2);
    float _4043 = 1.0 / _4023;
    float _4045 = float(uint(_3999));
    float _4047 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4031);
    float _4049 = float(uint(_4027));
    bool _4051 = !_3767;
    float _4053 = _4051 ? _211 : as_type<float>(_4035);
    float _4055 = as_type<float>(_4019) * _4045;
    float _4057 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4059 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4061 = as_type<float>(_4041) * _4049;
    int _4063 = abs(_3999);
    float _4065 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4057);
    float _4067 = trunc(_4055);
    float _4069 = precise::max(_4067, 0.0);
    uint _4071 = uint(_4069);
    float _4073 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4059);
    int _4075 = as_type<int>(_4021) + (-2);
    float _4077 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _4079 = abs(_4027);
    float _4081 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4047);
    int _4083 = ~_3549;
    int _4085 = _4083 + 1;
    float _4087 = fma(_4077, _4077, 1.0);
    float _4089 = trunc(_4061);
    float _4091 = precise::max(_4089, 0.0);
    uint _4093 = uint(_4091);
    float _4095 = float(uint(_4063));
    int _4097 = as_type<int>(_4043) + (-2);
    float _4099 = as_type<float>(_4075) * _4095;
    float _4101 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4065);
    int _4103 = _4085 * int(_4071);
    int _4105 = _4103 + _3999;
    float _4107 = float(uint(_4079));
    float _4109 = rsqrt(_4087);
    int _4111 = ~_3909;
    int _4113 = _4111 + 1;
    float _4115 = float(uint(_4105));
    float _4117 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4073);
    float _4119 = as_type<float>(_4097) * _4107;
    int _4121 = _4113 * int(_4093);
    int _4123 = _4121 + _4027;
    int _4125 = ~_3983;
    int _4127 = _4125 + 1;
    float _4129 = trunc(_4099);
    float _4131 = precise::max(_4129, 0.0);
    uint _4133 = uint(_4131);
    int _4135 = ~_4015;
    int _4137 = _4135 + 1;
    float _4139 = float(uint(_4123));
    float _4141 = as_type<float>(_4019) * _4115;
    float _4143 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4039);
    float _4145 = -_201;
    int _4147 = _3911 ? as_type<int>(_4145) : as_type<int>(_201);
    float _4149 = trunc(_4119);
    float _4151 = precise::max(_4149, 0.0);
    uint _4153 = uint(_4151);
    float _4155 = as_type<float>(_4041) * _4139;
    float _4157 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4013);
    float _4159 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4037);
    bool _4161 = !_3771;
    float _4163 = _4161 ? _201 : as_type<float>(_4147);
    int _4165 = _4127 * int(_4133);
    int _4167 = _4165 + _4063;
    float _4169 = -_201;
    int _4171 = _3875 ? as_type<int>(_4169) : as_type<int>(_201);
    float _4173 = trunc(_4141);
    float _4175 = precise::max(_4173, 0.0);
    uint _4177 = uint(_4175);
    int _4179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _4181 = _4179 != 0;
    out.m_86.x = _4157;
    out.m_86.y = _4159;
    out.m_86.z = _4143;
    float _4183 = float(uint(_4167));
    bool _4185 = !_4181;
    float _4187 = _4185 ? _201 : as_type<float>(_4171);
    int _4189 = _4137 * int(_4153);
    int _4191 = _4189 + _4079;
    float _4193 = _4077 * _3945;
    float _4195 = as_type<float>(_4075) * _4183;
    float _4197 = _4077 * _4109;
    float _4199 = trunc(_4155);
    float _4201 = precise::max(_4199, 0.0);
    uint _4203 = uint(_4201);
    float _4205 = float(uint(_4191));
    float _4207 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4209 = -_4081;
    float _4211 = _4197 * _4209;
    float _4213 = -_4101;
    float _4215 = _4197 * _4213;
    bool _4217 = _3909 == 0;
    float _4219 = as_type<float>(_4097) * _4205;
    float _4221 = -_4117;
    float _4223 = _4197 * _4221;
    float _4225 = fma(_4109, _3945, _4211);
    float _4227 = fma(_4109, _3927, _4215);
    float _4229 = _4077 * _3927;
    float _4231 = fma(_4109, _3955, _4223);
    float _4233 = trunc(_4195);
    float _4235 = precise::max(_4233, 0.0);
    uint _4237 = uint(_4235);
    float _4239 = fma(_4207, _4157, _4193);
    float _4241 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4243 = _4077 * _3955;
    out.m_88.x = _4225;
    out.m_88.y = _4227;
    out.m_88.z = _4231;
    float _4245 = fma(_4207, _4159, _4229);
    float _4247 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4241);
    int _4249 = ~_3983;
    int _4251 = _4249 + 1;
    float _4253 = trunc(_4219);
    float _4255 = precise::max(_4253, 0.0);
    uint _4257 = uint(_4255);
    int _4259 = int(_4071) + int(_4177);
    float _4261 = fma(_4207, _4143, _4243);
    int _4263 = ~_3549;
    int _4265 = _4263 + 1;
    float _4267 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4247);
    int _4269 = int(_4093) + int(_4203);
    float _4271 = _4117 + _4261;
    int _4273 = ~_3909;
    int _4275 = _4273 + 1;
    int _4277 = _4265 * _4259;
    int _4279 = _4277 + _3999;
    int _4281 = ~_4015;
    int _4283 = _4281 + 1;
    float _4285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4287 = int(_4133) + int(_4237);
    float _4289 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4267);
    int _4291 = _4027 ^ _3909;
    bool _4293 = uint(_4279) >= uint(_3549);
    int _4295 = _4251 * _4287;
    int _4297 = _4295 + _4063;
    int _4299 = int(_4153) + int(_4257);
    int _4301 = _4275 * _4269;
    int _4303 = _4301 + _4027;
    uint _4305 = uint(int(uint(_4291) >> uint(31)));
    float _4307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4309 = uint(_4297) >= uint(_3983);
    int _4311 = _4283 * _4299;
    int _4313 = _4311 + _4079;
    bool _4315 = uint(_4303) >= uint(_3909);
    out.gl_Position.x = _2554;
    out.gl_Position.y = _2568;
    out.gl_Position.z = _4289;
    out.gl_Position.w = _2516;
    bool _4317 = !_4293;
    int _4319 = _4317 ? 0 : (-1);
    float _4321 = _4285 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4323 = uint(_4313) >= uint(_4015);
    float _4325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4327 = !_4315;
    int _4329 = _4327 ? 0 : (-1);
    bool _4331 = !_4323;
    int _4333 = _4331 ? 0 : (-1);
    int _4335 = ~_4259;
    int _4337 = _4335 + _4319;
    int _4339 = _4337 + 1;
    int _4341 = ~_4333;
    int _4343 = _4299 + _4341;
    int _4345 = _4343 + 1;
    float _4347 = _4307 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _4349 = ~int(_4305);
    int _4351 = _4349 + 1;
    int _4353 = _3999 ^ _3549;
    int _4355 = _4345 ^ _4351;
    int _4357 = ~_4269;
    int _4359 = _4357 + _4329;
    int _4361 = _4359 + 1;
    int _4363 = _3549 * _4339;
    int _4365 = _4363 + _3999;
    int _4367 = ~_4351;
    int _4369 = _4367 + _4355;
    int _4371 = _4369 + 1;
    bool _4373 = !_4309;
    int _4375 = _4373 ? 0 : (-1);
    float _4377 = abs(_1827);
    float _4379 = log2(_4377);
    uint _4381 = uint(int(uint(_4353) >> uint(31)));
    int _4383 = _3909 * _4361;
    int _4385 = _4383 + _4027;
    bool _4387 = _3549 == 0;
    int _4389 = ~_4375;
    int _4391 = _4287 + _4389;
    int _4393 = _4391 + 1;
    int _4395 = ~int(_4381);
    int _4397 = _4395 + 1;
    bool _4399 = _3909 == 0;
    bool _4401 = !_4387;
    int _4403 = _4401 ? _4365 : (-1);
    float _4405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4407 = _4393 ^ _4397;
    float _4409 = float(_4403);
    float _4411 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _4413 = _3549 == 0;
    float _4415 = _2516 * 0.5;
    bool _4417 = !_4217;
    int _4419 = _4417 ? _4385 : (-1);
    float _4421 = fma(_4347, _4409, _1049);
    int _4423 = ~_4397;
    int _4425 = _4423 + _4407;
    int _4427 = _4425 + 1;
    float _4429 = _4187 + 0.5;
    float _4431 = float(_4419);
    float _4433 = exp2(_4411);
    bool _4435 = !_4413;
    int _4437 = _4435 ? _4427 : (-1);
    float _4439 = fma(_4347, _4429, _4421);
    bool _4441 = !_4399;
    int _4443 = _4441 ? _4371 : (-1);
    float _4445 = fma(_4321, _4431, _1503);
    float _4447 = float(_4437);
    float _4449 = _4405 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4451 = float(_4443);
    float _4453 = _4325 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _4455 = _4163 + 0.5;
    bool _4457 = _1827 <= 8000.0;
    bool _4459 = isnan(_1827);
    bool _4461 = _4457 || _4459;
    bool _4463 = isnan(8000.0);
    bool _4465 = _4461 || _4463;
    float _4467 = float(_4465);
    float _4469 = -_1505;
    float _4471 = fma(_4449, _4451, _4469);
    float _4473 = -_1307;
    float _4475 = fma(_4453, _4447, _4473);
    float _4477 = _3641 + (-0.5);
    float _4479 = _4053 + (-0.5);
    float _4481 = fma(_4321, _4455, _4445);
    float _4483 = -_4449;
    float _4485 = fma(_4483, _4477, _4471);
    float _4487 = -_4453;
    float _4489 = fma(_4487, _4479, _4475);
    float _4491 = -_1495;
    float _4493 = _4491 + 1.0;
    float _4495 = -_1497;
    float _4497 = _4495 + 1.0;
    float _4499 = fma(_3641, _3499, _4485);
    float _4501 = -_4493;
    float _4503 = fma(_4163, _4501, _4481);
    float _4505 = -_4497;
    float _4507 = fma(_4187, _4505, _4439);
    float _4509 = fma(_2568, -0.5, _4415);
    float _4511 = fma(_4053, _3533, _4489);
    float _4513 = fma(_4433, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4515 = precise::clamp(_4513, 0.0, 1.0);
    float _4517 = _4289 + _2516;
    float _4519 = _2554 + _2516;
    float _4521 = _4101 + _4245;
    out.m_90.x = _4507;
    out.m_90.y = _4511;
    out.m_90.z = _4503;
    out.m_90.w = _4499;
    float _4523 = fma(_4515, -2.0, 3.0);
    float _4525 = _4515 * _4515;
    float _4527 = _4517 * 0.5;
    float _4529 = _4519 * 0.5;
    float _4531 = _4081 + _4239;
    float _4533 = _4525 * _4523;
    out.m_92.x = _4529;
    out.m_92.y = _4509;
    out.m_92.z = _4527;
    out.m_92.w = _2516;
    out.m_94.x = _4531;
    out.m_94.y = _4521;
    out.m_94.z = _4271;
    float _4535 = -_3521;
    float _4537 = _4535 + 1.0;
    float _4539 = _4511;
    float _4541 = _4509;
    if (!_2500)
    {
        _4539 = 1.0;
    }
    float _4543 = _4539;
    float _4545 = _4543;
    if (_2500)
    {
        bool _4547 = _2606 >= _2572;
        bool _4549 = isnan(_2606);
        bool _4551 = _4547 || _4549;
        bool _4553 = isnan(_2572);
        bool _4555 = _4551 || _4553;
        float _4557 = float(_4555);
        _4545 = _4557;
    }
    float _4559 = _4545;
    float _4561 = _4537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _4563 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4565 = isnan(_3245);
    bool _4567 = _4563 || _4565;
    bool _4569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4571 = _4567 || _4569;
    float _4573 = _4561 * _2608;
    float _4575 = -_4533;
    float _4577 = _4575 + 1.0;
    float _4579 = -_4561;
    float _4581 = _4579 + 1.0;
    float _4583 = _4559 * _3223;
    float _4585 = _2619 * _4573;
    float _4587 = fma(_4577, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4533);
    float _4589 = _3469 * _4573;
    float _4591 = _2619 * _4581;
    float _4593 = fma(_3465, _4585, _2613);
    float _4595 = _4467 * _4587;
    float _4597 = fma(_3467, _4585, _2615);
    float _4599 = fma(_2619, _4589, _2617);
    float _4601 = _3161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4603 = _4595 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4605 = _4577;
    float _4607 = _4561;
    float _4609 = _4581;
    if (!_4571)
    {
        _4541 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4611 = _4541;
    out.m_96.x = _4593;
    out.m_96.y = _4597;
    out.m_96.z = _4599;
    out.m_96.w = _4591;
    float _4613 = _3541 * _4603;
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = _4611;
    float _4619 = _4611;
    if (!_4571)
    {
        _4605 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4621 = _4605;
    float _4623 = _4621;
    float _4625 = _4621;
    if (!_4571)
    {
        _4607 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4627 = _4607;
    float _4629 = -_4615;
    float _4631 = fma(_4629, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4633 = _4627;
    float _4635 = _4627;
    if (!_4571)
    {
        _4609 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4637 = _4609;
    float _4639 = -_4583;
    float _4641 = fma(_4639, _4631, 1.0);
    float _4643 = precise::clamp(_4641, 0.0, 1.0);
    float _4645 = _4643 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4647 = _4643;
    float _4649 = _4645;
    float _4651 = _4637;
    float _4653 = _4637;
    if (!_4571)
    {
        _4647 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4655 = _4647;
    out.m_98.x = _4645;
    float _4657 = _4655;
    float _4659 = _4655;
    if (!_4571)
    {
        _4649 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4661 = _4649;
    bool _4663 = !_4571;
    float _4665 = _4661;
    float _4667 = _4661;
    if (!_4663)
    {
        bool _4669 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4671 = isnan(_3245);
        bool _4673 = _4669 || _4671;
        bool _4675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4677 = _4673 || _4675;
        if (!_4677)
        {
            float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4681 = _3245 + _4679;
            float _4683 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4685 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4683;
            float _4687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4689 = _4687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4691 = 1.0 / _4685;
            float _4693 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4695 = _4693 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4697 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4699 = _4697 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4701 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4703 = _4701 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4705 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4707 = _4705 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4709 = _4681 * _4691;
            float _4711 = precise::clamp(_4709, 0.0, 1.0);
            float _4713 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4715 = _4713 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4717 = fma(_4711, _4689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4719 = fma(_4711, _4715, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4721 = fma(_4711, _4695, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4723 = fma(_4711, _4699, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4725 = fma(_4711, _4703, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4727 = fma(_4711, _4707, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4625 = _4721;
            _4659 = _4725;
            _4619 = _4717;
            _4653 = _4723;
            _4635 = _4719;
            _4667 = _4727;
            _4729 = true;
        }
        else
        {
            bool _4731 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4733 = isnan(_3245);
            bool _4735 = _4731 || _4733;
            bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4739 = _4735 || _4737;
            if (!_4739)
            {
                _4617 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4741 = _4617;
            _4619 = _4741;
            if (!_4739)
            {
                _4623 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4743 = _4623;
            _4625 = _4743;
            if (!_4739)
            {
                _4633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4745 = _4633;
            _4635 = _4745;
            if (!_4739)
            {
                _4651 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4747 = _4651;
            _4653 = _4747;
            if (!_4739)
            {
                _4657 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4749 = _4657;
            _4659 = _4749;
            if (!_4739)
            {
                _4665 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4751 = _4665;
            bool _4753 = !_4739;
            _4667 = _4751;
            if (!_4753)
            {
                bool _4755 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4757 = isnan(_3245);
                bool _4759 = _4755 || _4757;
                bool _4761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4763 = _4759 || _4761;
                if (!_4763)
                {
                    float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4767 = _3245 + _4765;
                    float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4771 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4769;
                    float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4777 = 1.0 / _4771;
                    float _4779 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4781 = _4779 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4783 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4785 = _4783 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4787 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4789 = _4787 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4793 = _4791 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4795 = _4767 * _4777;
                    float _4797 = precise::clamp(_4795, 0.0, 1.0);
                    float _4799 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4801 = _4799 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4803 = fma(_4797, _4775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4805 = fma(_4797, _4801, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4807 = fma(_4797, _4781, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4809 = fma(_4797, _4785, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4811 = fma(_4797, _4789, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4813 = fma(_4797, _4793, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4625 = _4807;
                    _4659 = _4811;
                    _4619 = _4803;
                    _4653 = _4809;
                    _4635 = _4805;
                    _4667 = _4813;
                    _4729 = true;
                }
                else
                {
                    _4625 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4659 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4619 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4653 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4667 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4729 = false;
    float _4815 = _4625;
    float _4817 = _4659;
    float _4819 = _4619;
    float _4821 = _4653;
    float _4823 = _4635;
    float _4825 = _4667;
    float _4827 = _4601 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4829 = fma(_4521, -0.5, 0.5);
    float _4831 = precise::clamp(_4829, 0.0, 1.0);
    float _4833 = -_4815;
    float _4835 = _4833 + _4817;
    float _4837 = -_4819;
    float _4839 = _4837 + _4821;
    out.m_100.x = 0.0;
    float _4841 = fma(_4831, _4835, _4815);
    float _4843 = -_4823;
    float _4845 = _4843 + _4825;
    float _4847 = fma(_4831, _4839, _4819);
    float _4849 = _4841 * 0.586610972881317138671875;
    bool _4851 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4853 = fma(_4831, _4845, _4823);
    out.m_59.x = _4827;
    float _4855 = fma(_4847, 0.298911988735198974609375, _4849);
    bool _4857 = _3161 > 0.0;
    bool _4859 = isnan(_3161);
    bool _4861 = _4857 || _4859;
    bool _4863 = isnan(0.0);
    bool _4865 = _4861 || _4863;
    float _4867 = fma(_4853, 0.114477999508380889892578125, _4855);
    float _4869 = -_4867;
    float _4871 = _4847 + _4869;
    float _4873 = -_4867;
    float _4875 = _4841 + _4873;
    float _4877 = -_4867;
    float _4879 = _4853 + _4877;
    float _4881 = fma(_4871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    float _4883 = fma(_4875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    float _4885 = fma(_4879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    bool _4887 = !_4851;
    if (!_4887)
    {
        float _4889 = -_2440;
        float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4893 = -_2442;
        float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4897 = -_2444;
        float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4901 = _4891 * _4891;
        float _4903 = fma(_4895, _4895, _4901);
        float _4905 = fma(_4899, _4899, _4903);
        float _4907 = sqrt(_4905);
        float _4909 = rsqrt(_4905);
        float _4911 = -_4907;
        float _4913 = _4911 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4915 = _4913 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4917 = precise::clamp(_4915, 0.0, 1.0);
        float _4919 = _4895 * _4909;
        float _4921 = _4891 * _4909;
        float _4923 = abs(_4917);
        float _4925 = log2(_4923);
        float _4927 = _4899 * _4909;
        float _4929 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4931 = _4521 * _4921;
        float _4933 = -_4921;
        float _4935 = -_4929;
        float _4937 = fma(_4933, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4935);
        float _4939 = fma(_4531, _4919, _4931);
        float _4941 = -_4927;
        float _4943 = fma(_4941, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4937);
        float _4945 = fma(_4271, _4927, _4939);
        float _4947 = precise::clamp(_4945, 0.0, 1.0);
        float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4951 = _4943 + _4949;
        float _4953 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4955 = _4951 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4957 = precise::clamp(_4955, 0.0, 1.0);
        float _4959 = exp2(_4953);
        float _4961 = _4959 * _4957;
        float _4963 = _4947 * _4961;
        float _4965 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4967 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4969 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4965;
        out.m_100.y = _4967;
        out.m_100.z = _4969;
    }
    out.m_80.x = _4881;
    out.m_80.y = _4883;
    out.m_80.z = _4885;
    if (_4865)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _4971 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4971;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4729 = false;
    bool _801 = false;
    bool _621 = false;
    bool _441 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_56.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_59.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5028 = as_type<float>(_135);
        out.gl_Position.z = _5028;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_61.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_119);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _129;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5097 = as_type<float>(_173);
        out.gl_Position.z = _5097;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_66.x;
    float _179 = in.m_66.y;
    float _181 = in.m_66.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_68.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_119);
        float _243 = 1.0 / _241;
        float _245 = _153 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _247 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    float _269 = in.m_70.x;
    float _271 = in.m_70.y;
    bool _273 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _275 = isnan(_247);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = 1.0 / _259;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _289 = 1.0 / _263;
    float _291 = 1.0 / _267;
    float _293 = _251 * _285;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _247 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = _297 * _289;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    bool _311 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_247);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = fma(_309, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = -_321;
    float _327 = _325 + 1.0;
    float _329 = _255 * _291;
    float _331 = -_283;
    float _333 = _331 + 1.0;
    bool _335 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_247);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = _321 * _333;
    bool _349 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_247);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _345 * _327;
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = _359 * _365;
    float _377 = fma(_369, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_373, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = -_359;
    float _383 = _381 + 1.0;
    float _385 = _303 * _375;
    float _387 = _323 * _375;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _401 = fma(_391, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_377, _361, _397);
    float _407 = fma(_379, _361, _399);
    float _409 = fma(_401, _347, _405);
    float _411 = fma(_403, _347, _407);
    float _413 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[146].x, _409);
    float _415 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[146].y, _411);
    float _417 = _413 * _269;
    float _419 = _415 * _271;
    bool _421 = !_287;
    float _439;
    if (!_421)
    {
        float _423 = in.m_68.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_119);
        float _445 = 1.0 / _443;
        float _447 = _153 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _449 + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _463 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = isnan(_449);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _479 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = isnan(_449);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _457;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -_473;
    float _499 = _497 + 1.0;
    bool _501 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _503 = isnan(_449);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _515 = 1.0 / _461;
    float _517 = 1.0 / _477;
    float _519 = _495 * _491;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _525 = _489 * _499;
    float _527 = -_489;
    float _529 = _527 + 1.0;
    float _531 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _533;
    float _537 = _511 * _529;
    float _539 = _523 * _515;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _449 + _541;
    bool _545 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _547 = isnan(_449);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = _531 * _537;
    float _559 = -_511;
    float _561 = _559 + 1.0;
    float _563 = fma(_539, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _567 = _449 + _565;
    float _569 = _535 * _517;
    float _571 = -_555;
    float _573 = _571 + 1.0;
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _557);
    float _577 = fma(_569, _567, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _579 = _473 * _573;
    float _581 = fma(_563, _525, _575);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _585 = fma(_577, _579, _581);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _593 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[118].x, _585);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _599 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _601 = !_513;
    float _619;
    if (!_601)
    {
        float _603 = in.m_68.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_119);
        float _625 = 1.0 / _623;
        float _627 = _153 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _645 = isnan(_629);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _659 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _661 = isnan(_629);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = 1.0 / _637;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _673;
    float _677 = -_653;
    float _679 = _677 + 1.0;
    bool _681 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _683 = isnan(_629);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _695 = 1.0 / _641;
    float _697 = 1.0 / _657;
    float _699 = _675 * _671;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _705 = _669 * _679;
    float _707 = -_669;
    float _709 = _707 + 1.0;
    float _711 = fma(_699, _633, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _713;
    float _717 = _691 * _709;
    float _719 = _703 * _695;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _723 = _629 + _721;
    bool _725 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _727 = isnan(_629);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = _711 * _717;
    float _739 = -_691;
    float _741 = _739 + 1.0;
    float _743 = fma(_719, _723, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _747 = _629 + _745;
    float _749 = _715 * _697;
    float _751 = -_735;
    float _753 = _751 + 1.0;
    float _755 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[131].x, _737);
    float _757 = fma(_749, _747, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _759 = _653 * _753;
    float _761 = fma(_743, _705, _755);
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _765 = fma(_757, _759, _761);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _771 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[134].x, _765);
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _771 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _781 = !_693;
    float _799;
    if (!_781)
    {
        float _783 = in.m_68.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[14].x, _153);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_119);
        float _805 = 1.0 / _803;
        float _807 = _153 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = in.m_56.x;
    float _813 = in.m_56.y;
    float _815 = in.m_56.z;
    float _817 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _819 = _817 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _821 = _813 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _823 = _813 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _825 = _813 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _821);
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _823);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _825);
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[5].z, _827);
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[4].z, _829);
    float _837 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[6].z, _831);
    float _839 = _833 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _841 = _835 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _843 = _837 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _847 = _839 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _851 = _841 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _855 = _843 + _853;
    float _857 = _847 * _847;
    float _859 = fma(_851, _851, _857);
    float _861 = fma(_855, _855, _859);
    float _863 = sqrt(_861);
    float _865 = rsqrt(_861);
    float _867 = _863 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _869 = precise::min(_819, _867);
    float _871 = _865 * _869;
    float _873 = _851 * _871;
    float _875 = _855 * _871;
    float _877 = -_873;
    float _879 = _841 + _877;
    float _881 = -_875;
    float _883 = _843 + _881;
    float _885 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _887 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _889 = floor(_885);
    float _891 = floor(_887);
    float _893 = -_889;
    float _895 = _885 + _893;
    float _897 = -_891;
    float _899 = _887 + _897;
    float2 _6272 = float2(_895, _899);
    float _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6272, float2(0.0), isnan(_6272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6272, float2(0.0), isnan(_6272)), level(0.0)).x;
    float _903 = in.m_68.x;
    float _905 = in.m_68.y;
    float _907 = in.m_68.z;
    float _909 = in.m_68.w;
    float _911 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _913 = log2(_911);
    float _915 = _847 * _871;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _933 = _931 != 0;
    float _935 = 1.0 / _925;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _939 = -_873;
    float _941 = _851 + _939;
    float _943 = -_875;
    float _945 = _855 + _943;
    float _947 = 1.0 / _919;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _953 = _903 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _955 = _903 * 2.0;
    float _957 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _959 = -_921;
    float _961 = fma(_953, 2.0, _959);
    float _963 = 1.0 / _929;
    float _965 = _905 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _967 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _957);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _973 = fma(_965, -2.0, _937);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _975;
    float _979 = 1.0 / _951;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _985 = _977 * _935;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _987;
    float _991 = _983 * _947;
    float _993 = 1.0 / _971;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _999;
    float _1003 = _903 + _905;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1009 = _989 * _963;
    float _1011 = _907 * 2.0;
    float _1013 = _1003 + (-1.0);
    float _1015 = floor(_955);
    float _1017 = _1007 * _979;
    bool _1019 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1021 = isnan(_809);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    float _1031 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1033 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1035 = isnan(_809);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = _907 + _905;
    float _1047 = -_153;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[76].x, _961);
    float _1051 = 1.0 / _997;
    float _1053 = _1001 * _993;
    float _1055 = _907 + _903;
    float _1057 = -_1043;
    float _1059 = _1057 + 1.0;
    float _1061 = _1045 + (-1.0);
    float _1063 = _1055 + (-1.0);
    float _1065 = float(_119);
    float _1067 = floor(_1011);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1073 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1075 = isnan(_809);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1087 = _1015 > 0.0;
    float _1089 = _1029 * _1059;
    bool _1091 = _1015 >= 0.0;
    bool _1093 = isnan(_1015);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.0);
    bool _1099 = _1095 || _1097;
    float _1101 = -_1083;
    float _1103 = _1101 + 1.0;
    float _1105 = _1071 * _1051;
    float _1107 = -_1029;
    float _1109 = _1107 + 1.0;
    float _1111 = _905 * 2.0;
    float _1113 = _1043 * _1103;
    bool _1115 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1117 = isnan(_809);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1129 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1131 = isnan(_809);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = 1.0 / _1065;
    bool _1143 = _1067 >= 0.0;
    bool _1145 = isnan(_1067);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = _1125 * _1109;
    float _1155 = -_1125;
    float _1157 = _1155 + 1.0;
    bool _1159 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1161 = isnan(_809);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1167 = _1163 || _1165;
    int _1169 = _1167 ? 1065353216 : 0;
    float _1171 = -_1139;
    float _1173 = _1171 + 1.0;
    float _1175 = _1139 * _1157;
    float _1177 = floor(_1111);
    float _1179 = as_type<float>(_1169) * _1173;
    float _1181 = -as_type<float>(_1169);
    float _1183 = _1181 + 1.0;
    int _1185 = _1169;
    float _1187 = _839;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_933)
    {
        _1185 = 0;
    }
    int _1191 = _1185;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1195 = _809 + _1193;
    int _1197 = _1191;
    if (!_933)
    {
        _1197 = 1;
    }
    int _1199 = _1197;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1203 = _1067 > 0.0;
    float _1205 = fma(_985, _1195, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1207 = _1099 ? 0 : 1;
    float _1209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1211 = int(_1209);
    bool _1213 = _1199 != 1;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1217 = _809 + _1215;
    bool _1219 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1221 = isnan(_809);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = _1141 * _153;
    int _1233 = ~_1207;
    int _1235 = _1233 + 1;
    int _1237 = _1235 + 1;
    float _1239 = fma(_991, _1217, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1241 = _1177 > 0.0;
    float _1243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1245 = int(_1243);
    bool _1247 = _1177 >= 0.0;
    bool _1249 = isnan(_1177);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan(0.0);
    bool _1255 = _1251 || _1253;
    float _1257 = _1229 * _1183;
    float _1259 = -_1229;
    float _1261 = _1259 + 1.0;
    int _1263 = _1151 ? 0 : 1;
    float _1265 = _1205 * _1257;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1269 = _809 + _1267;
    float _1271 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _967);
    int _1273 = ~_1263;
    int _1275 = _1273 + 1;
    int _1277 = _1275 + 1;
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1265);
    int _1281 = _1277;
    float _1283 = _1269;
    int _1285 = _1237;
    if (!_1203)
    {
        int _1287 = ~_1263;
        int _1289 = _1287 + 1;
        _1281 = _1289;
    }
    int _1291 = _1281;
    float _1293 = fma(_1009, _1269, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1297 = _1295 != 0;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1301 = _1299 != 0;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1305 = _1303 != 0;
    float _1307 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _973);
    float _1309 = fma(_1239, _1179, _1279);
    if (!_1213)
    {
        _1283 = _905;
    }
    float _1311 = _1283;
    float _1313 = _905 + (-0.5);
    bool _1315 = !_1301;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1321 = !_1297;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = sqrt(_1271);
    bool _1327 = !_1305;
    int _1329 = _1327 ? 0 : 1;
    float _1331 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1335 = _1333 != 0;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1343 = _1341 != 0;
    float _1345 = _1311;
    if (_1213)
    {
        _1345 = _903;
    }
    float _1347 = _1345;
    float _1349 = float(_1245);
    float _1351 = as_type<float>(_1245);
    float _1353 = _1347;
    if (!_1213)
    {
        _1351 = _905;
    }
    float _1355 = _1351;
    float _1357 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1319);
    float _1359 = _1355;
    if (_1213)
    {
        _1359 = _903;
    }
    float _1361 = _1359;
    bool _1363 = !_1335;
    float _1365 = _1363 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1367 = 1.0 / _1349;
    float _1369 = _1365;
    if (!_1213)
    {
        _1353 = _907;
    }
    float _1371 = _1353;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1375 = _1371;
    if (!_1087)
    {
        int _1377 = ~_1207;
        int _1379 = _1377 + 1;
        _1285 = _1379;
    }
    int _1381 = _1285;
    float _1383 = _1325 * 50.0;
    if (_1213)
    {
        _1375 = _905;
    }
    float _1385 = _1375;
    int _1387 = abs(as_type<int>(_1365));
    float _1389 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1391 = float(_1291);
    float _1393 = _913 * _153;
    int _1395 = _1255 ? 0 : 1;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1399 = float(_1211);
    float _1401 = fma(_1389, -2.0, _1201);
    float _1403 = float(_1387);
    float _1405 = exp2(_1393);
    int _1407 = ~_1395;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    float _1413 = -_1397;
    float _1415 = fma(_1373, 2.0, _1413);
    int _1417 = _1411;
    if (!_1241)
    {
        int _1419 = ~_1395;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    float _1425 = _1403 * _1391;
    float _1427 = in.m_72.x;
    float _1429 = in.m_72.y;
    float _1431 = in.m_72.z;
    if (!_1213)
    {
        _1369 = _907;
    }
    float _1433 = _1369;
    float _1435 = 1.0 / _1399;
    float _1437 = _1433;
    if (_1213)
    {
        _1437 = _905;
    }
    float _1439 = _1437;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1443 = _1367 * _153;
    bool _1445 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1453 = _1449 || _1451;
    float _1455 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1441);
    float _1457 = -_1405;
    float _1459 = _1457 + 1.0;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1463 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1455);
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1467 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1469 = isnan(1.0);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1475 = _1471 || _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1479 = 1.0 + _1477;
    float _1481 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1483 = _1435 * _153;
    bool _1485 = !_1339;
    int _1487 = _1485 ? 0 : 1;
    float _1489 = 1.0 / _1479;
    float _1491 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1465);
    float _1493 = _1453 ? _1459 : 0.0;
    float _1495 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1357);
    float _1497 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1481);
    float _1499 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1491);
    float _1501 = -_153;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1415);
    float _1505 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1401);
    float _1507 = float(_1381);
    float _1509 = _903 + (-0.5);
    int _1511 = abs(_1487);
    float _1513 = _1425 * (-2.0);
    bool _1515 = !_1343;
    int _1517 = _1515 ? 0 : 1;
    float _1519 = float(_1423);
    float _1521 = _1483;
    if (_1475)
    {
        float _1523 = _1493 * _1489;
        _157 = _1523;
    }
    float _1525 = _157;
    float _1527 = fma(_1513, _1427, _1427);
    float _1529 = float(_1511);
    float _1531 = fma(_1031, _1513, _1031);
    int _1533 = abs(_1517);
    float _1535 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1527);
    float _1537 = _1529 * _1507;
    float _1539 = float(_1533);
    float _1541 = fma(_1531, _1525, _1535);
    float _1543 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1545 = _1537 * (-2.0);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1549 = _809 + _1547;
    float _1551 = _1539 * _1519;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1557 = fma(_1545, _1429, _1429);
    float _1559 = fma(_1017, _1549, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1561 = fma(_1293, _1175, _1309);
    float _1563 = fma(_1127, _1545, _1127);
    float _1565 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1557);
    float _1567 = _1551 * (-2.0);
    float _1569 = 1.0 / _1555;
    float _1571 = fma(_1559, _1153, _1561);
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _809 + _1573;
    float _1577 = fma(_1085, _1567, _1085);
    float _1579 = fma(_1567, _1431, _1431);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1583 = _809 + _1581;
    float _1585 = _907 + (-0.5);
    float _1587 = fma(_1105, _1575, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1589 = fma(_1563, _1525, _1565);
    float _1591 = fma(_1053, _1583, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1593 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1579);
    float _1595 = -_915;
    float _1597 = _839 + _1595;
    float _1599 = fma(_1591, _1089, _1571);
    float _1601 = fma(_1577, _1525, _1593);
    float _1603 = _1589 * 0.15915493667125701904296875;
    bool _1605 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1607 = isnan(_809);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = fma(_1587, _1113, _1599);
    float _1619 = -_915;
    float _1621 = _847 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1623;
    float _1627 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1629 = -_1615;
    float _1631 = _1629 + 1.0;
    float _1633 = _1621 * _1621;
    float _1635 = _1625 * _1569;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1639 = _809 + _1637;
    float _1641 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1627);
    float _1643 = fma(_941, _941, _1633);
    float _1645 = _1083 * _1631;
    float _1647 = fma(_1635, _1639, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1649 = _1541 * 0.15915493667125701904296875;
    float _1651 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1641);
    float _1653 = fma(_945, _945, _1643);
    float _1655 = fma(_1647, _1645, _1617);
    float _1657 = _1649 * 6.283185482025146484375;
    float _1659 = sin(_1657);
    float _1661 = _1601 * 0.15915493667125701904296875;
    float _1663 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1665 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1667 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1655);
    float _1669 = _1597 + _1543;
    float _1671 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1663);
    float _1673 = _1649 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = _1667 * _1383;
    float _1679 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1671);
    float _1681 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1683 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1685 = _1677 * _1677;
    float _1687 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1689 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1681);
    float _1691 = _1603 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1683);
    float _1697 = _1687 + _1665;
    float _1699 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1689);
    float _1701 = fma(_883, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1695);
    float _1703 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1705 = _1603 * 6.283185482025146484375;
    float _1707 = cos(_1705);
    float _1709 = sqrt(_1653);
    float _1711 = _1675 * _1693;
    float _1713 = _1659 * _1693;
    float _1715 = _1661 * 6.283185482025146484375;
    float _1717 = sin(_1715);
    float _1719 = _1659 * _1707;
    float _1721 = _1675 * _1707;
    float _1723 = 1.0 / _1665;
    float _1725 = _865 * _1709;
    float _1727 = _1331 * _1725;
    float _1729 = _817 * _1725;
    float _1731 = _1661 * 6.283185482025146484375;
    float _1733 = cos(_1731);
    float _1735 = -_1711;
    float _1737 = fma(_1717, _1719, _1735);
    float _1739 = -_1719;
    float _1741 = fma(_1717, _1711, _1739);
    float _1743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1745 = fma(_1717, _1721, _1713);
    float _1747 = fma(_1717, _1713, _1721);
    float _1749 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1751 = _1697 * _1723;
    float _1753 = _1751 * 0.5;
    float _1755 = _1727 * _1743;
    float _1757 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1759 = _1729 * _1749;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1761);
    float _1765 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1767 = _1765 * 0.5;
    float _1769 = -_1755;
    float _1771 = _1717 * _1769;
    float _1773 = trunc(_1703);
    int _1775 = int(_1773);
    float _1777 = _1675 * _1733;
    float _1779 = _1659 * _1733;
    float _1781 = _1707 * _1733;
    float _1783 = _1693 * _1733;
    float _1785 = _1777 * _1755;
    float _1787 = _1779 * _1755;
    float _1789 = fma(_1781, _1759, _1771);
    float _1791 = 1.0 / _1763;
    float _1793 = fma(_1745, _1759, _1785);
    float _1795 = fma(_1737, _1759, _1787);
    float _1797 = fma(_1783, _1767, _1789);
    float _1799 = fma(_1741, _1767, _1793);
    float _1801 = fma(_1747, _1767, _1795);
    float _1803 = trunc(_1757);
    int _1805 = int(_1803);
    float _1807 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1809 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1811 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1813 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1815 = _1775 + _1813;
    int _1817 = _1815 + 1;
    float _1819 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1807);
    float _1821 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1809);
    float _1823 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1811);
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1827 = _1791 * _1825;
    float _1829 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1819);
    float _1831 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1821);
    float _1833 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1823);
    float _1835 = rsqrt(_1685);
    bool _1837 = _1827 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1839 = _1829 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _1841 = _1827 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1843 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1845 = !_1837;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1851 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1853 = _1805 + _1851;
    int _1855 = _1853 + 1;
    float _1857 = _843 + _1843;
    float _1859 = _1839 * _1839;
    float _1861 = _841 + _1839;
    int _1863 = _1817 | _1855;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1857 + _1865;
    float _1869 = fma(_1849, _1849, _1859);
    int _1871 = 2;
    int _1873 = _1817;
    int _1875 = _1855;
    float _1877 = _1859;
    float _1879 = _1861;
    float _1881 = _1857;
    float _1883 = _1839;
    float _1885 = _1843;
    float _1887 = _1703;
    if (!_1837)
    {
        _1871 = 1;
    }
    int _1889 = _1871;
    float _1891 = _1843 * _1843;
    int _1893 = _1889;
    float _1895 = _1891;
    if (!_1841)
    {
        _1893 = _1847;
    }
    int _1897 = _1893;
    float _1899 = _1867 * _1867;
    bool _1901 = _1817 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1905 = _1861 + _1903;
    int _1907 = _1897 << 6;
    float _1909 = _1891 + _1869;
    bool _1911 = _1863 < 0;
    bool _1913 = _1911 || _1901;
    float _1915 = fma(_1905, _1905, _1899);
    int _1917 = _1907 + 48;
    uint _1920 = uint(int(uint(_1917) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    float _1936 = sqrt(_1685);
    bool _1938 = _1855 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1940 = _1938 || _1913;
    float _1942 = _1677 * _1835;
    int _1944 = _1907 + 56;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    uint _1948 = uint(int(uint(int(_1946)) >> uint(2)));
    int _1950 = int(_1946) & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = int(_1946) + 1;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    int _1958 = _1954 & 3;
    float _1960 = (*spvDescriptorSet0.vp_c15)._m0[int(_1956)][_1958];
    float _1962 = rsqrt(_1909);
    float _1964 = as_type<float>(_1897);
    if (!_1940)
    {
        int _1966 = _1855 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1968 = _1966 + _1817;
        _1873 = _1968;
    }
    int _1970 = _1873;
    int _1972 = _1907 + 64;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
    float _1990 = sqrt(_1915);
    if (!_1940)
    {
        int _1992 = _1970 << 2;
        _1875 = _1992;
    }
    int _1994 = _1875;
    int _1996 = _1907 + 72;
    uint _1998 = uint(int(uint(_1996) >> uint(2)));
    uint _2000 = uint(int(uint(int(_1998)) >> uint(2)));
    int _2002 = int(_1998) & 3;
    float _2004 = (*spvDescriptorSet0.vp_c15)._m0[int(_2000)][_2002];
    int _2006 = int(_1998) + 1;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    int _2010 = _2006 & 3;
    float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
    float _2014 = _1849 * _1962;
    int _2016 = as_type<int>(_1962);
    int _2018 = _1994;
    if (!_1940)
    {
        uint _2020 = uint(int(uint(_1970) >> uint(2)));
        _2016 = int(_2020);
    }
    int _2022 = _2016;
    float _2024 = as_type<float>(_2022);
    if (!_1940)
    {
        int _2026 = 12 & _1994;
        _2018 = _2026;
    }
    int _2028 = _2018;
    float _2030 = _1942 * _2014;
    int _2032 = _1907 + 96;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c15)._m0[int(_2036)][_2038];
    int _2042 = int(_2034) + 1;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    int _2046 = _2042 & 3;
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[int(_2044)][_2046];
    bool _2050 = _1990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2052 = _2030 * _1936;
    if (!_1940)
    {
        int _2054 = _2022 << 4;
        int _2056 = _2054 + _2028;
        _2024 = as_type<float>(_2056);
    }
    float _2058 = _2024;
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2062 = _2060 != 0;
    int _2064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2066 = _2064 != 0;
    int _2068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2070 = _2068 != 0;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2074 = _2072 != 0;
    float _2076 = fma(_1942, _2052, _1849);
    int _2078 = _1907 + 104;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c15)._m0[int(_2090)][_2092];
    bool _2096 = !_2066;
    int _2098 = _2096 ? 0 : 1;
    float _2100 = _839 + _2076;
    bool _2102 = !_2062;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = !_2070;
    int _2108 = _2106 ? 0 : 1;
    bool _2110 = !_2074;
    int _2112 = _2110 ? 0 : 1;
    bool _2114 = !_2050;
    float _2116 = _2100;
    float _2118 = _1926;
    if (!_2114)
    {
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2124 = _1990 + _2122;
        float _2126 = rsqrt(_1915);
        float _2128 = _2124 * _2120;
        float _2130 = _2100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2132 = _2128 * 0.15915493667125701904296875;
        float _2134 = _2132 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = _2132 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        float _2142 = fma(_2136, _2130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2144 = _2126 * _2142;
        float _2146 = _2140 + (-1.0);
        float _2148 = fma(_1905, _2144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2150 = fma(_1867, _2144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2152 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2154 = -_841;
        float _2156 = _2154 + _2148;
        float _2158 = -_843;
        float _2160 = _2158 + _2150;
        float _2162 = fma(_2100, _2140, _2152);
        float _2164 = _2156 * _2156;
        float _2166 = _2160 * _2160;
        _2116 = _2162;
        _1877 = _2164;
        _1895 = _2166;
        _1879 = _2148;
        _1881 = _2150;
        _1883 = _2156;
        _1885 = _2160;
    }
    float _2168 = _2116;
    float _2170 = _1877;
    float _2172 = _1895;
    float _2174 = _1879;
    float _2176 = _1881;
    float _2178 = _1883;
    float _2180 = _1885;
    int _2182 = _1907 + 80;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
    float _2200 = -_839;
    float _2202 = _2200 + _2168;
    float _2204 = _1669 * _2048;
    if (!_1940)
    {
        float _2206 = floor(_1703);
        _1187 = _2206;
    }
    float _2208 = _1187;
    float _2210 = _1669 * _1934;
    float _2212 = fma(_2202, _2202, _2170);
    float _2214 = fma(_879, _2040, _2204);
    float _2216 = _1669 * _1988;
    int _2218 = _1907 + 88;
    uint _2220 = uint(int(uint(_2218) >> uint(2)));
    uint _2222 = uint(int(uint(int(_2220)) >> uint(2)));
    int _2224 = int(_2220) & 3;
    float _2226 = (*spvDescriptorSet0.vp_c15)._m0[int(_2222)][_2224];
    int _2228 = int(_2220) + 1;
    uint _2230 = uint(int(uint(_2228) >> uint(2)));
    int _2232 = _2228 & 3;
    float _2234 = (*spvDescriptorSet0.vp_c15)._m0[int(_2230)][_2232];
    float _2236 = _2212 + _2172;
    float _2238 = fma(_883, _2086, _2214);
    float _2240 = fma(_879, _1926, _2210);
    float _2242 = _2214;
    float _2244 = _2240;
    if (!_1940)
    {
        float _2246 = floor(_1757);
        _2242 = _2246;
    }
    float _2248 = _2242;
    float _2250 = fma(_879, _1980, _2216);
    float _2252 = _2238 + _2094;
    float _2254 = fma(_883, _1952, _2240);
    float _2256 = _2058;
    float _2258 = _2254;
    if (!_1940)
    {
        int _2260 = as_type<int>(_2058) + 400;
        uint _2262 = uint(int(uint(_2260) >> uint(2)));
        uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
        int _2266 = int(_2262) & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        _2256 = _2268;
    }
    float _2270 = _2256;
    float _2272 = fma(_883, _2004, _2250);
    float _2274 = -_873;
    float _2276 = _2274 + _2174;
    float _2278 = sqrt(_2236);
    bool _2280 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2282 = isnan(0.5);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2288 = _2284 || _2286;
    float _2290 = -_915;
    float _2292 = _2290 + _2168;
    float _2294 = -_875;
    float _2296 = _2294 + _2176;
    float _2298 = _2254 + _1960;
    float _2300 = _2272 + _2012;
    float _2302 = 1.0 / _2252;
    bool _2304 = _2278 > 0.0;
    bool _2306 = !_2304;
    float _2308 = _2276;
    float _2310 = _2292;
    float _2312 = _2296;
    if (!_2306)
    {
        float _2314 = _215 * _215;
        float _2316 = fma(_213, _213, _2314);
        float _2318 = rsqrt(_2236);
        float _2320 = fma(_217, _217, _2316);
        float _2322 = sqrt(_2320);
        float _2324 = _2318 * _2178;
        float _2326 = _2202 * _2318;
        float _2328 = _2318 * _2180;
        bool _2330 = _2322 > 0.0;
        bool _2332 = !_2330;
        _2244 = _2318;
        _2118 = _2320;
        _2258 = _2322;
        if (!_2332)
        {
            float _2334 = rsqrt(_2320);
            float _2336 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2338 = _215 * _2334;
            float _2340 = _213 * _2334;
            float _2342 = _2326 * _2338;
            float _2344 = _217 * _2334;
            float _2346 = fma(_2324, _2340, _2342);
            float _2348 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2350 = fma(_2328, _2344, _2346);
            float _2352 = _2350 * _2348;
            float _2354 = fma(_213, _2352, _2276);
            float _2356 = fma(_215, _2352, _2292);
            float _2358 = fma(_217, _2352, _2296);
            _2308 = _2354;
            _2310 = _2356;
            _2312 = _2358;
            _2244 = _2352;
            _2118 = _2334;
            _2258 = _2344;
        }
    }
    float _2360 = _2308;
    float _2362 = _2310;
    float _2364 = _2312;
    float _2366 = _2244;
    float _2368 = _2118;
    float _2370 = _2258;
    float _2372 = _2368;
    float _2374 = _2366;
    float _2376 = _2370;
    if (_2288)
    {
        _2372 = _2360;
    }
    float _2378 = _2372;
    float _2380 = _2378;
    if (_2288)
    {
        _2374 = _2362;
    }
    float _2382 = _2374;
    float _2384 = _2382;
    if (_2288)
    {
        _2376 = _2364;
    }
    float _2386 = _2376;
    float _2388 = _2386;
    if (!_2288)
    {
        float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2392 = _1597 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2396 = _879 + _2394;
        float _2398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = -_879;
        float _2402 = _2400 + _2360;
        float _2404 = _2392 * _2392;
        float _2406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2408 = _883 + _2406;
        float _2410 = -_1597;
        float _2412 = _2410 + _2362;
        float _2414 = fma(_2396, _2396, _2404);
        float _2416 = -_883;
        float _2418 = _2416 + _2364;
        float _2420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2422 = fma(_2408, _2408, _2414);
        float _2424 = sqrt(_2422);
        float _2426 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = precise::min(_2424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2430 = _2428 * _2420;
        float _2432 = _2426 * _2430;
        float _2434 = fma(_2402, _2432, _879);
        float _2436 = fma(_2412, _2432, _1597);
        float _2438 = fma(_2418, _2432, _883);
        _2384 = _2436;
        _2380 = _2434;
        _2388 = _2438;
    }
    float _2440 = _2384;
    float _2442 = _2380;
    float _2444 = _2388;
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2448 = _2298 * _2302;
    float _2450 = _2300 * _2302;
    float _2452 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2446);
    bool _2458 = _2448 >= 0.0;
    float _2460 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2452);
    float _2462 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2464 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2456);
    bool _2466 = _2448 <= 1.0;
    bool _2468 = _2466 && _2458;
    float _2470 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2460);
    float _2472 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2462);
    float _2474 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2476 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2478 = _2470 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2480 = _2472 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2482 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2474);
    float _2484 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2486 = _2450 >= 0.0;
    bool _2488 = _2486 && _2468;
    float _2490 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2494 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2496 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2484);
    bool _2498 = _2450 <= 1.0;
    bool _2500 = _2498 && _2488;
    float _2502 = -_2492;
    float _2504 = fma(_2502, _2490, 1.0);
    float _2506 = _2494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2508 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2496);
    float _2510 = _1669 * _2198;
    float _2512 = log2(_2504);
    float _2514 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2516 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2518 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2520 = fma(_879, _2190, _2510);
    float _2522 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2514);
    float _2524 = _2504;
    if (!_1940)
    {
        float _2526 = -_2208;
        float _2528 = _1703 + _2526;
        _1887 = _2528;
    }
    float _2530 = _1887;
    float _2532 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2518);
    float _2534 = 1.0 / _2516;
    if (_2500)
    {
        float _2536 = float(_1897);
        _1964 = _2536;
    }
    float _2538 = _1964;
    float _2540 = fma(_883, _2226, _2520);
    float _2542 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2532);
    float _2544 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2522);
    if (!_1940)
    {
        float _2546 = -_2248;
        float _2548 = _1757 + _2546;
        _2524 = _2548;
    }
    float _2550 = _2524;
    float _2552 = _2540 + _2234;
    float _2554 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2542);
    float _2556 = _2364;
    if (!_1940)
    {
        float _2558 = rint(_2270);
        float _2560 = precise::max(_2558, 0.0);
        uint _2562 = uint(_2560);
        uint _2564 = clamp(_2562, 0u, 65535u);
        _2556 = as_type<float>(_2564);
    }
    float _2566 = _2556;
    float _2568 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2544);
    float _2570 = _2512 * 0.693147182464599609375;
    float _2572 = _2552 * _2302;
    float _2574 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2576 = _2518;
    if (_2500)
    {
        float _2578 = rint(_2538);
        float _2580 = precise::max(_2578, 0.0);
        uint _2582 = uint(_2580);
        uint _2584 = clamp(_2582, 0u, 65535u);
        _2576 = as_type<float>(_2584);
    }
    float _2586 = _2576;
    float _2588 = _2554 * _2534;
    float _2590 = _2568 * _2534;
    float _2592 = fma(_2588, 0.5, 0.5);
    float _2594 = fma(_2590, -0.5, 0.5);
    float _2596 = _2550;
    if (!_1940)
    {
        float3 _8946 = float3(_2530, _2550, float(as_type<int>(_2566)));
        float3 _8950 = select(_8946, float3(0.0), isnan(_8946));
        float _2598 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8950.xy, uint(rint(_8950.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8950.xy, uint(rint(_8950.z)), level(0.0)).x;
        _2596 = _2598;
    }
    float _2600 = _2596;
    float _2602 = _2450;
    if (_2500)
    {
        float3 _8965 = float3(_2448, _2450, float(as_type<int>(_2586)));
        float3 _8967 = select(_8965, float3(0.0), isnan(_8965));
        float _2604 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8967.xy, uint(rint(_8967.z)), _2572, level(0.0));
        _2602 = _2604;
    }
    float _2606 = _2602;
    float3 _8977 = float3(_2592, _2594, _2574);
    float _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8977, float3(0.0), isnan(_8977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8977, float3(0.0), isnan(_8977)), level(0.0)).x;
    float3 _8986 = float3(_2592, _2594, _2574);
    float4 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8986, float3(0.0), isnan(_8986)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8986, float3(0.0), isnan(_8986)), level(0.0)).xyzw;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = _2611.w;
    float _2621 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2623 = int(_2621);
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2627 = _2625 != 0;
    int _2629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2631 = _2629 != 0;
    int _2633 = abs(_1323);
    int _2635 = abs(_1329);
    float _2637 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2639 = int(_2637);
    int _2641 = abs(_2098);
    int _2643 = abs(_2104);
    if (_2627)
    {
        float _2645 = in.m_68.x;
        _1189 = _2645;
    }
    float _2647 = _1189;
    float _2649 = float(uint(_2623));
    float _2651 = trunc(_1483);
    int _2653 = int(_2651);
    float _2655 = _2647;
    if (!_2627)
    {
        float _2657 = in.m_68.y;
        _2655 = _2657;
    }
    float _2659 = _2655;
    int _2661 = ~_2623;
    int _2663 = _2661 + 1;
    float _2665 = float(uint(_2639));
    float _2667 = 1.0 / _2649;
    float _2669 = trunc(_1443);
    int _2671 = int(_2669);
    float _2673 = float(uint(_2653));
    int _2675 = ~_2639;
    int _2677 = _2675 + 1;
    if (_2627)
    {
        _1521 = 1.0;
    }
    float _2679 = _1521;
    float _2681 = _2679;
    if (!_2627)
    {
        _2681 = 1.2345600128173828125;
    }
    float _2683 = _2681;
    float _2685 = 1.0 / _2665;
    int _2687 = as_type<int>(_2667) + (-2);
    int _2689 = ~_2623;
    int _2691 = _2689 + 1;
    float _2693 = _2659 * _2683;
    float _2695 = as_type<float>(_2687) * _2673;
    float _2697 = float(uint(_2671));
    float _2699 = floor(_2693);
    int _2701 = as_type<int>(_2685) + (-2);
    float _2703 = trunc(_2695);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    float _2709 = as_type<float>(_2701) * _2697;
    float _2711 = _2697;
    if (_2627)
    {
        _2711 = 1.0;
    }
    float _2713 = _2711;
    float _2715 = _2713;
    if (!_2627)
    {
        _2715 = 7.345489978790283203125;
    }
    float _2717 = _2715;
    float _2719 = -_2699;
    float _2721 = _2693 + _2719;
    float _2723 = trunc(_2709);
    float _2725 = precise::max(_2723, 0.0);
    uint _2727 = uint(_2725);
    float _2729 = _2717 * _903;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2733 = _2731 != 0;
    int _2735 = _2691 * int(_2707);
    int _2737 = _2735 + _2653;
    float _2739 = floor(_2729);
    float _2741 = float(uint(_2737));
    int _2743 = _2677 * int(_2727);
    int _2745 = _2743 + _2671;
    float _2747 = as_type<float>(_2687) * _2741;
    float _2749 = float(uint(_2745));
    float _2751 = trunc(_2747);
    float _2753 = precise::max(_2751, 0.0);
    uint _2755 = uint(_2753);
    float _2757 = -_2739;
    float _2759 = _2729 + _2757;
    float _2761 = float(_2623);
    float _2763 = as_type<float>(_2701) * _2749;
    float _2765 = trunc(_2763);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    bool _2771 = !_2733;
    int _2773 = _2771 ? 0 : 1;
    int _2775 = int(_2707) + int(_2755);
    float _2777 = _2759 * _2761;
    float _2779 = float(_2653);
    int _2781 = ~_2639;
    int _2783 = _2781 + 1;
    int _2785 = _2663 * _2775;
    int _2787 = _2785 + _2653;
    int _2789 = int(_2727) + int(_2769);
    float _2791 = trunc(_2777);
    int _2793 = int(_2791);
    bool _2795 = _2779 >= _2761;
    bool _2797 = isnan(_2779);
    bool _2799 = _2795 || _2797;
    bool _2801 = isnan(_2761);
    bool _2803 = _2799 || _2801;
    float _2805 = float(_2803);
    bool _2807 = uint(_2787) >= uint(_2623);
    int _2809 = _2783 * _2789;
    int _2811 = _2809 + _2671;
    float _2813 = float(_2639);
    float _2815 = float(_2671);
    float _2817 = trunc(_2805);
    int _2819 = int(_2817);
    bool _2821 = !_2807;
    int _2823 = _2821 ? 0 : (-1);
    bool _2825 = _2815 >= _2813;
    bool _2827 = isnan(_2815);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan(_2813);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    bool _2837 = uint(_2811) >= uint(_2639);
    int _2839 = abs(_2773);
    float _2841 = _2761 * _1231;
    int _2843 = ~_2775;
    int _2845 = _2843 + _2823;
    int _2847 = _2845 + 1;
    float _2849 = trunc(_2835);
    int _2851 = int(_2849);
    float _2853 = _2813 * _1231;
    float _2855 = _2721 * _2813;
    bool _2857 = !_2837;
    int _2859 = _2857 ? 0 : (-1);
    int _2861 = _2793 * _2839;
    int _2863 = _2861 + _2653;
    bool _2865 = _2623 == 0;
    int _2867 = _2623 * _2847;
    int _2869 = _2867 + _2653;
    int _2871 = ~_2789;
    int _2873 = _2871 + _2859;
    int _2875 = _2873 + 1;
    float _2877 = trunc(_2841);
    int _2879 = int(_2877);
    int _2881 = ~_2819;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    bool _2887 = !_2865;
    int _2889 = _2887 ? _2869 : (-1);
    int _2891 = _2639 * _2875;
    int _2893 = _2891 + _2671;
    bool _2895 = _2639 == 0;
    int _2897 = _2623 + (-1);
    int _2899 = _2889 * _2885;
    int _2901 = abs(_1317);
    int _2903 = ~_2851;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    int _2909 = _2819 * _2897;
    int _2911 = _2909 + _2899;
    bool _2913 = !_2895;
    int _2915 = _2913 ? _2893 : (-1);
    int _2917 = _2639 + (-1);
    int _2919 = _2915 * _2907;
    int _2921 = _2851 * _2917;
    int _2923 = _2921 + _2919;
    bool _2925 = !_2631;
    int _2927 = _2925 ? 0 : 1;
    int _2929 = _2911 * _2901;
    int _2931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2933 = _2931 != 0;
    float _2935 = trunc(_2855);
    int _2937 = int(_2935);
    int _2939 = _2923 * _2641;
    int _2941 = _2879 * _2633;
    int _2943 = _2941 + _2929;
    int _2945 = abs(_2927);
    bool _2947 = !_2933;
    int _2949 = _2947 ? 0 : 1;
    int _2951 = _2863 * _2635;
    int _2953 = _2951 + _2943;
    float _2955 = trunc(_2853);
    int _2957 = int(_2955);
    bool _2959 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2961 = isnan(0.5);
    bool _2963 = _2959 || _2961;
    bool _2965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2967 = _2963 || _2965;
    int _2969 = _2793 * _2945;
    int _2971 = _2969 + _2953;
    int _2973 = abs(_2949);
    float _2975 = float(uint(_2971));
    int _2977 = _2937 * _2973;
    int _2979 = _2977 + _2671;
    int _2981 = abs(_2108);
    int _2983 = abs(_2112);
    float _2985 = as_type<float>(_2687) * _2975;
    int _2987 = ~_2639;
    int _2989 = _2987 + 1;
    int _2991 = _2957 * _2643;
    int _2993 = _2991 + _2939;
    float _2995 = trunc(_2985);
    float _2997 = precise::max(_2995, 0.0);
    uint _2999 = uint(_2997);
    float _3001 = float(uint(_2863));
    int _3003 = _2979 * _2981;
    int _3005 = _3003 + _2993;
    float _3007 = float(uint(_2979));
    float _3009 = as_type<float>(_2687) * _3001;
    int _3011 = _2937 * _2983;
    int _3013 = _3011 + _3005;
    int _3015 = ~_2623;
    int _3017 = _3015 + 1;
    float _3019 = as_type<float>(_2701) * _3007;
    float _3021 = trunc(_3009);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    float _3027 = float(uint(_3013));
    int _3029 = _3017 * int(_2999);
    int _3031 = _3029 + _2971;
    float _3033 = as_type<float>(_2701) * _3027;
    float _3035 = trunc(_3019);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    int _3041 = ~_2623;
    int _3043 = _3041 + 1;
    float _3045 = float(uint(_3031));
    int _3047 = ~_2639;
    int _3049 = _3047 + 1;
    float _3051 = trunc(_3033);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    float _3057 = as_type<float>(_2687) * _3045;
    int _3059 = _3043 * int(_3025);
    int _3061 = _3059 + _2863;
    float _3063 = float(uint(_3061));
    float _3065 = trunc(_3057);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    int _3071 = _3049 * int(_3039);
    int _3073 = _3071 + _2979;
    float _3075 = as_type<float>(_2687) * _3063;
    float _3077 = _3063;
    float _3079 = _3057;
    float _3081 = as_type<float>(_2943);
    float _3083 = as_type<float>(_2899);
    float _3085 = as_type<float>(_2901);
    if (_2967)
    {
        _3077 = 1.0;
    }
    float _3087 = _3077;
    int _3089 = _2989 * int(_3055);
    int _3091 = _3089 + _3013;
    float _3093 = float(uint(_3073));
    float _3095 = _3087;
    if (_1940)
    {
        _3079 = 1.0;
    }
    float _3097 = _3079;
    float _3099 = float(uint(_3091));
    float _3101 = as_type<float>(_2701) * _3093;
    int _3103 = int(_2999) + int(_3069);
    float _3105 = as_type<float>(_2701) * _3099;
    float _3107 = _3097;
    if (!_2967)
    {
        float _3109 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3111 = _3109 * 0.15915493667125701904296875;
        float _3113 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3117 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3115;
        float _3119 = _3111 * 6.283185482025146484375;
        float _3121 = cos(_3119);
        float _3123 = _3113 * 0.15915493667125701904296875;
        float _3125 = _3111 * 6.283185482025146484375;
        float _3127 = sin(_3125);
        float _3129 = 1.0 / _3121;
        float _3131 = _3123 * 6.283185482025146484375;
        float _3133 = cos(_3131);
        float _3135 = _3127 * _3129;
        float _3137 = _3123 * 6.283185482025146484375;
        float _3139 = sin(_3137);
        float _3141 = _3133 * _3135;
        float _3143 = 1.0 / _3117;
        float _3145 = 1.0 / _3141;
        float _3147 = _3139 * _3145;
        float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3151 = fma(_1827, _3147, _3149);
        float _3153 = _3151 * _3143;
        float _3155 = precise::clamp(_3153, 0.0, 1.0);
        _3081 = _3143;
        _3083 = _3123;
        _3095 = _3155;
    }
    float _3157 = _3081;
    float _3159 = _3083;
    float _3161 = _3095;
    if (!_1940)
    {
        int _3163 = _1970 << 4;
        int _3165 = _3163 + 2048;
        uint _3167 = uint(int(uint(_3165) >> uint(2)));
        uint _3169 = uint(int(uint(int(_3167)) >> uint(2)));
        int _3171 = int(_3167) & 3;
        float _3173 = (*spvDescriptorSet0.vp_c15)._m0[int(_3169)][_3171];
        int _3175 = int(_3167) + 1;
        uint _3177 = uint(int(uint(_3175) >> uint(2)));
        int _3179 = _3175 & 3;
        float _3181 = (*spvDescriptorSet0.vp_c15)._m0[int(_3177)][_3179];
        int _3183 = _3165 + 8;
        uint _3185 = uint(int(uint(_3183) >> uint(2)));
        uint _3187 = uint(int(uint(int(_3185)) >> uint(2)));
        int _3189 = int(_3185) & 3;
        float _3191 = (*spvDescriptorSet0.vp_c15)._m0[int(_3187)][_3189];
        int _3193 = int(_3185) + 1;
        uint _3195 = uint(int(uint(_3193) >> uint(2)));
        int _3197 = _3193 & 3;
        float _3199 = (*spvDescriptorSet0.vp_c15)._m0[int(_3195)][_3197];
        float _3201 = _1669 * _3181;
        float _3203 = fma(_879, _3173, _3201);
        float _3205 = fma(_883, _3191, _3203);
        float _3207 = _3205 + _3199;
        float _3209 = precise::clamp(_3207, 0.0, 1.0);
        float _3211 = -_3209;
        float _3213 = _3211 + _2600;
        float _3215 = fma(_3213, 500.0, 1.5);
        float _3217 = exp2(_3215);
        float _3219 = 0.0 + _3217;
        float _3221 = precise::clamp(_3219, 0.0, 1.0);
        _3107 = _3221;
    }
    float _3223 = _3107;
    float _3225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3227 = _2440 + _3225;
    float _3229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3231 = _2442 + _3229;
    float _3233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3235 = _2444 + _3233;
    float _3237 = _3227 * _3227;
    float _3239 = fma(_3231, _3231, _3237);
    float _3241 = fma(_3235, _3235, _3239);
    float _3243 = rsqrt(_3241);
    float _3245 = sqrt(_3241);
    float _3247 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3249 = _3231 * _3247;
    float _3251 = _3235 * _3247;
    float _3253 = _3249 * _3249;
    float _3255 = _3251 * _3251;
    float _3257 = _3253 + _3255;
    float _3259 = sqrt(_3257);
    bool _3261 = _3259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3265 = _3259 + _3263;
    float _3267 = _3157;
    float _3269 = _3257;
    float _3271 = _3265;
    float _3273 = _3249;
    float _3275 = _3251;
    float _3277 = _3253;
    float _3279 = _3255;
    if (_3261)
    {
        float _3281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3267 = _3281;
    }
    float _3283 = _3267;
    if (_3261)
    {
        float _3285 = rsqrt(_3257);
        _3269 = _3285;
    }
    float _3287 = _3269;
    if (_3261)
    {
        float _3289 = _3265 * _3283;
        _3271 = _3289;
    }
    float _3291 = _3271;
    if (_3261)
    {
        float _3293 = _3291 * 0.15915493667125701904296875;
        _3085 = _3293;
    }
    float _3295 = _3085;
    float _3297 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3299 = _3159;
    if (_3261)
    {
        float _3301 = _3295 * 6.283185482025146484375;
        float _3303 = sin(_3301);
        _3299 = _3303;
    }
    float _3305 = _3299;
    float _3307 = precise::max(0.0, _3297);
    float _3309 = _3291;
    float _3311 = _3307;
    if (_3261)
    {
        float _3313 = _3295 * 6.283185482025146484375;
        float _3315 = cos(_3313);
        _3309 = _3315;
    }
    float _3317 = _3309;
    float _3319 = -_3247;
    float _3321 = -_3307;
    float _3323 = fma(_3227, _3319, _3321);
    float _3325 = _3323;
    if (_3261)
    {
        float _3327 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3327;
    }
    float _3329 = _3311;
    float _3331 = _3305;
    float _3333 = _3329;
    if (_3261)
    {
        float _3335 = fma(_3305, _3329, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3331 = _3335;
    }
    float _3337 = _3331;
    float _3339 = _3337;
    if (_3261)
    {
        float _3341 = _3287 * _3337;
        _3339 = _3341;
    }
    float _3343 = _3339;
    if (_3261)
    {
        float _3345 = _3317 + (-1.0);
        _3333 = _3345;
    }
    float _3347 = _3333;
    float _3349 = _3347;
    if (_3261)
    {
        float _3351 = _3249 * _3343;
        _3273 = _3351;
    }
    float _3353 = _3273;
    if (_3261)
    {
        float _3355 = _3251 * _3343;
        _3275 = _3355;
    }
    float _3357 = _3275;
    if (_3261)
    {
        float _3359 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3349 = _3359;
    }
    float _3361 = _3349;
    if (_3261)
    {
        float _3363 = _3353 * _3353;
        _3277 = _3363;
    }
    float _3365 = _3277;
    if (_3261)
    {
        float _3367 = _3357 * _3357;
        _3279 = _3367;
    }
    float _3369 = _3279;
    if (_3261)
    {
        float _3371 = fma(_3323, _3317, _3361);
        _3325 = _3371;
    }
    float _3373 = _3325;
    float _3375 = fma(_3373, _3373, _3365);
    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3379 = fma(_3245, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3377);
    float _3381 = precise::clamp(_3379, 0.0, 1.0);
    float _3383 = _3375 + _3369;
    float _3385 = -_3381;
    float _3387 = _3385 + 1.0;
    float _3389 = rsqrt(_3383);
    float _3391 = _3389 * _3353;
    float _3393 = _3389 * _3373;
    float _3395 = _3389 * _3357;
    float _3397 = _3391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3399 = trunc(_3105);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    float _3405 = -_3397;
    float _3407 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3405);
    float _3409 = -_3395;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3407);
    float _3413 = abs(_3387);
    float _3415 = log2(_3413);
    float _3417 = fma(_3411, -0.5, 0.5);
    float _3419 = fma(_3411, 0.5, 0.5);
    float _3421 = _3393 + 1.0;
    float _3423 = fma(_3419, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3425 = sqrt(_3417);
    float _3427 = fma(_3419, _3423, -0.212114393711090087890625);
    float _3429 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3431 = fma(_3419, _3427, 1.570728778839111328125);
    int _3433 = ~_2623;
    int _3435 = _3433 + 1;
    float _3437 = trunc(_3075);
    float _3439 = precise::max(_3437, 0.0);
    uint _3441 = uint(_3439);
    float _3443 = _3425 * 0.636619746685028076171875;
    float _3445 = exp2(_3429);
    float _3447 = -_3393;
    float _3449 = fma(_3445, _3421, _3447);
    float _3451 = -_3431;
    float _3453 = fma(_3443, _3451, 1.0);
    float _3455 = fma(_3449, 0.5, 0.5);
    int _3457 = _3435 * _3103;
    int _3459 = _3457 + _2971;
    float2 _10163 = float2(_3453, _3455);
    float3 _3463 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10163, float2(0.0), isnan(_10163)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10163, float2(0.0), isnan(_10163)), level(0.0)).xyz;
    float _3465 = _3463.x;
    float _3467 = _3463.y;
    float _3469 = _3463.z;
    bool _3471 = uint(_3459) >= uint(_2623);
    float _3473 = trunc(_3101);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    int _3479 = int(_3055) + int(_3403);
    out.m_74.x = _595;
    out.m_74.y = _597;
    out.m_74.z = _589;
    out.m_74.w = _599;
    bool _3481 = !_3471;
    int _3483 = _3481 ? 0 : (-1);
    float _3485 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _3487 = ~_2639;
    int _3489 = _3487 + 1;
    out.m_76.x = _773;
    out.m_76.y = _775;
    out.m_76.z = _777;
    out.m_76.w = _779;
    int _3491 = ~_3103;
    int _3493 = _3491 + _3483;
    int _3495 = _3493 + 1;
    float _3497 = -_1463;
    float _3499 = _3497 + 1.0;
    out.m_78.x = _879;
    out.m_78.y = _1597;
    out.m_78.z = _883;
    bool _3501 = _909 > 0.5;
    int _3503 = _2623 * _3495;
    int _3505 = _3503 + _2971;
    int _3507 = ~_2623;
    int _3509 = _3507 + 1;
    int _3511 = _3489 * _3479;
    int _3513 = _3511 + _3013;
    int _3515 = int(_3025) + int(_3441);
    out.m_80.w = _869;
    bool _3517 = !_2865;
    int _3519 = _3517 ? _3505 : (-1);
    float _3521 = exp2(_3485);
    bool _3523 = uint(_3513) >= uint(_2639);
    int _3525 = _3509 * _3515;
    int _3527 = _3525 + _2863;
    int _3529 = int(_3039) + int(_3477);
    float _3531 = -_1499;
    float _3533 = _3531 + 1.0;
    int _3535 = ~_2639;
    int _3537 = _3535 + 1;
    float _3539 = -_901;
    float _3541 = _3539 + 1.0;
    float _3543 = -_211;
    int _3545 = _3501 ? as_type<int>(_3543) : as_type<int>(_211);
    float _3547 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3549 = int(_3547);
    int _3551 = _3519 & 3;
    bool _3553 = _3551 != 0;
    int _3555 = _3537 * _3529;
    int _3557 = _3555 + _2979;
    int _3559 = _3519 & 3;
    bool _3561 = _3559 != 0;
    out.m_82.x = _1729;
    bool _3563 = !_3523;
    int _3565 = _3563 ? 0 : (-1);
    int _3567 = _3553 ? 0 : 1;
    out.m_84.x = _2442;
    out.m_84.y = _2440;
    out.m_84.z = _2444;
    bool _3569 = uint(_3527) >= uint(_2623);
    bool _3571 = uint(_3559) >= 2u;
    int _3573 = ~_3479;
    int _3575 = _3573 + _3565;
    int _3577 = _3575 + 1;
    int _3579 = _3519 >> 31;
    bool _3581 = !_3569;
    int _3583 = _3581 ? 0 : (-1);
    int _3585 = _2639 * _3577;
    int _3587 = _3585 + _3013;
    int _3589 = _3571 ? 0 : 1;
    bool _3591 = _3559 != 3;
    bool _3593 = uint(_3557) >= uint(_2639);
    int _3595 = _3579 & 3;
    int _3597 = ~_3515;
    int _3599 = _3597 + _3583;
    int _3601 = _3599 + 1;
    int _3603 = _3519 + _3595;
    bool _3605 = !_2895;
    int _3607 = _3605 ? _3587 : (-1);
    int _3609 = _2623 * _3601;
    int _3611 = _3609 + _2863;
    int _3613 = ~_3589;
    int _3615 = _3613 + 1;
    int _3617 = _3615 + 1;
    int _3619 = _3607 >> 31;
    int _3621 = _3617;
    if (_3591)
    {
        int _3623 = ~_3589;
        int _3625 = _3623 + 1;
        _3621 = _3625;
    }
    int _3627 = _3621;
    int _3629 = _3619 & 3;
    int _3631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3633 = _3631 != 0;
    int _3635 = _3607 + _3629;
    int _3637 = _3603 >> 2;
    bool _3639 = !_3633;
    float _3641 = _3639 ? _211 : as_type<float>(_3545);
    bool _3643 = !_2865;
    int _3645 = _3643 ? _3611 : (-1);
    int _3647 = _3607 & 3;
    bool _3649 = _3647 != 0;
    int _3651 = _3607 & 3;
    bool _3653 = _3651 != 0;
    int _3655 = _3635 >> 2;
    bool _3657 = uint(_3559) > 1u;
    int _3659 = _3637 << 4;
    int _3661 = _3659 + 368;
    int _3663 = _3655 << 4;
    int _3665 = _3663 + 512;
    uint _3667 = uint(int(uint(_3661) >> uint(2)));
    uint _3669 = uint(int(uint(int(_3667)) >> uint(2)));
    int _3671 = int(_3667) & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    int _3675 = int(_3667) + 1;
    uint _3677 = uint(int(uint(_3675) >> uint(2)));
    int _3679 = _3675 & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    bool _3683 = !_3561;
    int _3685 = _3683 ? 0 : 1;
    bool _3687 = uint(_3651) > 1u;
    int _3689 = ~_3567;
    int _3691 = _3689 + 1;
    int _3693 = _3691 + 1;
    int _3695 = _3693;
    if (!_3657)
    {
        int _3697 = ~_3567;
        int _3699 = _3697 + 1;
        _3695 = _3699;
    }
    int _3701 = _3695;
    uint _3703 = uint(int(uint(_3665) >> uint(2)));
    uint _3705 = uint(int(uint(int(_3703)) >> uint(2)));
    int _3707 = int(_3703) & 3;
    float _3709 = (*spvDescriptorSet0.vp_c9)._m0[int(_3705)][_3707];
    int _3711 = int(_3703) + 1;
    uint _3713 = uint(int(uint(_3711) >> uint(2)));
    int _3715 = _3711 & 3;
    float _3717 = (*spvDescriptorSet0.vp_c9)._m0[int(_3713)][_3715];
    bool _3719 = !_3593;
    int _3721 = _3719 ? 0 : (-1);
    int _3723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3725 = _3723 != 0;
    int _3727 = _3649 ? 0 : 1;
    int _3729 = ~_3529;
    int _3731 = _3729 + _3721;
    int _3733 = _3731 + 1;
    bool _3735 = !_3725;
    int _3737 = _3735 ? 0 : 1;
    int _3739 = _3661 + 8;
    uint _3741 = uint(int(uint(_3739) >> uint(2)));
    uint _3743 = uint(int(uint(int(_3741)) >> uint(2)));
    int _3745 = int(_3741) & 3;
    float _3747 = (*spvDescriptorSet0.vp_c9)._m0[int(_3743)][_3745];
    int _3749 = int(_3741) + 1;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    int _3753 = _3749 & 3;
    float _3755 = (*spvDescriptorSet0.vp_c9)._m0[int(_3751)][_3753];
    bool _3757 = !_3653;
    int _3759 = _3757 ? 0 : 1;
    int _3761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3763 = _3761 != 0;
    int _3765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3767 = _3765 != 0;
    int _3769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3771 = _3769 != 0;
    int _3773 = ~_3727;
    int _3775 = _3773 + 1;
    int _3777 = _3775 + 1;
    int _3779 = _3777;
    if (!_3687)
    {
        int _3781 = ~_3727;
        int _3783 = _3781 + 1;
        _3779 = _3783;
    }
    int _3785 = _3779;
    int _3787 = _3665 + 8;
    uint _3789 = uint(int(uint(_3787) >> uint(2)));
    uint _3791 = uint(int(uint(int(_3789)) >> uint(2)));
    int _3793 = int(_3789) & 3;
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[int(_3791)][_3793];
    int _3797 = int(_3789) + 1;
    uint _3799 = uint(int(uint(_3797) >> uint(2)));
    int _3801 = _3797 & 3;
    float _3803 = (*spvDescriptorSet0.vp_c9)._m0[int(_3799)][_3801];
    bool _3805 = !_3763;
    int _3807 = _3805 ? 0 : 1;
    bool _3809 = _3559 != 3;
    bool _3811 = _3651 != 3;
    bool _3813 = !_3809;
    int _3815 = _3813 ? 0 : (-1);
    bool _3817 = uint(_3651) >= 2u;
    bool _3819 = _3651 != 3;
    int _3821 = _3817 ? 0 : 1;
    int _3823 = abs(_3785);
    int _3825 = ~_3821;
    int _3827 = _3825 + 1;
    int _3829 = _3827 + 1;
    int _3831 = _3829;
    if (_3811)
    {
        int _3833 = ~_3821;
        int _3835 = _3833 + 1;
        _3831 = _3835;
    }
    int _3837 = _3831;
    bool _3839 = _905 > 0.5;
    float _3841 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3843 = abs(_3701);
    float _3845 = -_1717;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3841);
    int _3849 = ~_3843;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    int _3855 = abs(_3685);
    int _3857 = ~_3823;
    int _3859 = _3857 + 1;
    int _3861 = _3859 + 1;
    int _3863 = _3853 * as_type<int>(_3681);
    int _3865 = abs(_3759);
    int _3867 = ~_3855;
    int _3869 = _3867 + 1;
    int _3871 = _3869 + 1;
    int _3873 = _3861 * as_type<int>(_3717);
    bool _3875 = _903 > 0.5;
    int _3877 = _2639 * _3733;
    int _3879 = _3877 + _2979;
    int _3881 = abs(_3627);
    float _3883 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3885 = ~_3865;
    int _3887 = _3885 + 1;
    int _3889 = _3887 + 1;
    int _3891 = _3871 * as_type<int>(_3673);
    int _3893 = _3891 + _3863;
    int _3895 = abs(_3837);
    float _3897 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3899 = _3889 * as_type<int>(_3709);
    int _3901 = _3899 + _3873;
    bool _3903 = !_2895;
    int _3905 = _3903 ? _3879 : (-1);
    float _3907 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3909 = int(_3907);
    bool _3911 = _907 > 0.5;
    float _3913 = -_1717;
    float _3915 = fma(_3913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3883);
    float _3917 = -_1717;
    float _3919 = fma(_3917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3897);
    int _3921 = ~_3881;
    int _3923 = _3921 + 1;
    int _3925 = _3923 + 1;
    float _3927 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3915);
    bool _3929 = !_3819;
    int _3931 = _3929 ? 0 : (-1);
    int _3933 = ~_3895;
    int _3935 = _3933 + 1;
    int _3937 = _3935 + 1;
    int _3939 = _3925 * as_type<int>(_3747);
    int _3941 = _3939 + _3893;
    int _3943 = abs(_3815);
    float _3945 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3847);
    float _3947 = float(uint(_3549));
    int _3949 = _3937 * as_type<int>(_3795);
    int _3951 = _3949 + _3901;
    int _3953 = abs(_3931);
    float _3955 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3919);
    int _3957 = abs(_3737);
    float _3959 = 1.0 / _3947;
    int _3961 = ~_3943;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = ~_3953;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    int _3973 = ~_3957;
    int _3975 = _3973 + 1;
    int _3977 = _3975 + 1;
    int _3979 = _3965 * as_type<int>(_3755);
    int _3981 = _3979 + _3941;
    int _3983 = abs(_3549);
    int _3985 = _3971 * as_type<int>(_3803);
    int _3987 = _3985 + _3951;
    float _3989 = float(uint(_3909));
    int _3991 = _3981 * _3977;
    int _3993 = abs(_3807);
    float _3995 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3997 = _3645 * _3957;
    int _3999 = _3997 + _3991;
    float _4001 = 1.0 / _3989;
    int _4003 = ~_3993;
    int _4005 = _4003 + 1;
    int _4007 = _4005 + 1;
    float _4009 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4011 = float(uint(_3983));
    float _4013 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3995);
    int _4015 = abs(_3909);
    int _4017 = _3987 * _4007;
    int _4019 = as_type<int>(_3959) + (-2);
    float _4021 = 1.0 / _4011;
    float _4023 = float(uint(_4015));
    int _4025 = _3905 * _3993;
    int _4027 = _4025 + _4017;
    float _4029 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4031 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4033 = -_211;
    int _4035 = _3839 ? as_type<int>(_4033) : as_type<int>(_211);
    float _4037 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4009);
    float _4039 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4029);
    int _4041 = as_type<int>(_4001) + (-2);
    float _4043 = 1.0 / _4023;
    float _4045 = float(uint(_3999));
    float _4047 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4031);
    float _4049 = float(uint(_4027));
    bool _4051 = !_3767;
    float _4053 = _4051 ? _211 : as_type<float>(_4035);
    float _4055 = as_type<float>(_4019) * _4045;
    float _4057 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4059 = _1741 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4061 = as_type<float>(_4041) * _4049;
    int _4063 = abs(_3999);
    float _4065 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4057);
    float _4067 = trunc(_4055);
    float _4069 = precise::max(_4067, 0.0);
    uint _4071 = uint(_4069);
    float _4073 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4059);
    int _4075 = as_type<int>(_4021) + (-2);
    float _4077 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _4079 = abs(_4027);
    float _4081 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4047);
    int _4083 = ~_3549;
    int _4085 = _4083 + 1;
    float _4087 = fma(_4077, _4077, 1.0);
    float _4089 = trunc(_4061);
    float _4091 = precise::max(_4089, 0.0);
    uint _4093 = uint(_4091);
    float _4095 = float(uint(_4063));
    int _4097 = as_type<int>(_4043) + (-2);
    float _4099 = as_type<float>(_4075) * _4095;
    float _4101 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4065);
    int _4103 = _4085 * int(_4071);
    int _4105 = _4103 + _3999;
    float _4107 = float(uint(_4079));
    float _4109 = rsqrt(_4087);
    int _4111 = ~_3909;
    int _4113 = _4111 + 1;
    float _4115 = float(uint(_4105));
    float _4117 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4073);
    float _4119 = as_type<float>(_4097) * _4107;
    int _4121 = _4113 * int(_4093);
    int _4123 = _4121 + _4027;
    int _4125 = ~_3983;
    int _4127 = _4125 + 1;
    float _4129 = trunc(_4099);
    float _4131 = precise::max(_4129, 0.0);
    uint _4133 = uint(_4131);
    int _4135 = ~_4015;
    int _4137 = _4135 + 1;
    float _4139 = float(uint(_4123));
    float _4141 = as_type<float>(_4019) * _4115;
    float _4143 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4039);
    float _4145 = -_201;
    int _4147 = _3911 ? as_type<int>(_4145) : as_type<int>(_201);
    float _4149 = trunc(_4119);
    float _4151 = precise::max(_4149, 0.0);
    uint _4153 = uint(_4151);
    float _4155 = as_type<float>(_4041) * _4139;
    float _4157 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4013);
    float _4159 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4037);
    bool _4161 = !_3771;
    float _4163 = _4161 ? _201 : as_type<float>(_4147);
    int _4165 = _4127 * int(_4133);
    int _4167 = _4165 + _4063;
    float _4169 = -_201;
    int _4171 = _3875 ? as_type<int>(_4169) : as_type<int>(_201);
    float _4173 = trunc(_4141);
    float _4175 = precise::max(_4173, 0.0);
    uint _4177 = uint(_4175);
    int _4179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _4181 = _4179 != 0;
    out.m_86.x = _4157;
    out.m_86.y = _4159;
    out.m_86.z = _4143;
    float _4183 = float(uint(_4167));
    bool _4185 = !_4181;
    float _4187 = _4185 ? _201 : as_type<float>(_4171);
    int _4189 = _4137 * int(_4153);
    int _4191 = _4189 + _4079;
    float _4193 = _4077 * _3945;
    float _4195 = as_type<float>(_4075) * _4183;
    float _4197 = _4077 * _4109;
    float _4199 = trunc(_4155);
    float _4201 = precise::max(_4199, 0.0);
    uint _4203 = uint(_4201);
    float _4205 = float(uint(_4191));
    float _4207 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4209 = -_4081;
    float _4211 = _4197 * _4209;
    float _4213 = -_4101;
    float _4215 = _4197 * _4213;
    bool _4217 = _3909 == 0;
    float _4219 = as_type<float>(_4097) * _4205;
    float _4221 = -_4117;
    float _4223 = _4197 * _4221;
    float _4225 = fma(_4109, _3945, _4211);
    float _4227 = fma(_4109, _3927, _4215);
    float _4229 = _4077 * _3927;
    float _4231 = fma(_4109, _3955, _4223);
    float _4233 = trunc(_4195);
    float _4235 = precise::max(_4233, 0.0);
    uint _4237 = uint(_4235);
    float _4239 = fma(_4207, _4157, _4193);
    float _4241 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4243 = _4077 * _3955;
    out.m_88.x = _4225;
    out.m_88.y = _4227;
    out.m_88.z = _4231;
    float _4245 = fma(_4207, _4159, _4229);
    float _4247 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4241);
    int _4249 = ~_3983;
    int _4251 = _4249 + 1;
    float _4253 = trunc(_4219);
    float _4255 = precise::max(_4253, 0.0);
    uint _4257 = uint(_4255);
    int _4259 = int(_4071) + int(_4177);
    float _4261 = fma(_4207, _4143, _4243);
    int _4263 = ~_3549;
    int _4265 = _4263 + 1;
    float _4267 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4247);
    int _4269 = int(_4093) + int(_4203);
    float _4271 = _4117 + _4261;
    int _4273 = ~_3909;
    int _4275 = _4273 + 1;
    int _4277 = _4265 * _4259;
    int _4279 = _4277 + _3999;
    int _4281 = ~_4015;
    int _4283 = _4281 + 1;
    float _4285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4287 = int(_4133) + int(_4237);
    float _4289 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4267);
    int _4291 = _4027 ^ _3909;
    bool _4293 = uint(_4279) >= uint(_3549);
    int _4295 = _4251 * _4287;
    int _4297 = _4295 + _4063;
    int _4299 = int(_4153) + int(_4257);
    int _4301 = _4275 * _4269;
    int _4303 = _4301 + _4027;
    uint _4305 = uint(int(uint(_4291) >> uint(31)));
    float _4307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4309 = uint(_4297) >= uint(_3983);
    int _4311 = _4283 * _4299;
    int _4313 = _4311 + _4079;
    bool _4315 = uint(_4303) >= uint(_3909);
    out.gl_Position.x = _2554;
    out.gl_Position.y = _2568;
    out.gl_Position.z = _4289;
    out.gl_Position.w = _2516;
    bool _4317 = !_4293;
    int _4319 = _4317 ? 0 : (-1);
    float _4321 = _4285 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4323 = uint(_4313) >= uint(_4015);
    float _4325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4327 = !_4315;
    int _4329 = _4327 ? 0 : (-1);
    bool _4331 = !_4323;
    int _4333 = _4331 ? 0 : (-1);
    int _4335 = ~_4259;
    int _4337 = _4335 + _4319;
    int _4339 = _4337 + 1;
    int _4341 = ~_4333;
    int _4343 = _4299 + _4341;
    int _4345 = _4343 + 1;
    float _4347 = _4307 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _4349 = ~int(_4305);
    int _4351 = _4349 + 1;
    int _4353 = _3999 ^ _3549;
    int _4355 = _4345 ^ _4351;
    int _4357 = ~_4269;
    int _4359 = _4357 + _4329;
    int _4361 = _4359 + 1;
    int _4363 = _3549 * _4339;
    int _4365 = _4363 + _3999;
    int _4367 = ~_4351;
    int _4369 = _4367 + _4355;
    int _4371 = _4369 + 1;
    bool _4373 = !_4309;
    int _4375 = _4373 ? 0 : (-1);
    float _4377 = abs(_1827);
    float _4379 = log2(_4377);
    uint _4381 = uint(int(uint(_4353) >> uint(31)));
    int _4383 = _3909 * _4361;
    int _4385 = _4383 + _4027;
    bool _4387 = _3549 == 0;
    int _4389 = ~_4375;
    int _4391 = _4287 + _4389;
    int _4393 = _4391 + 1;
    int _4395 = ~int(_4381);
    int _4397 = _4395 + 1;
    bool _4399 = _3909 == 0;
    bool _4401 = !_4387;
    int _4403 = _4401 ? _4365 : (-1);
    float _4405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4407 = _4393 ^ _4397;
    float _4409 = float(_4403);
    float _4411 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _4413 = _3549 == 0;
    float _4415 = _2516 * 0.5;
    bool _4417 = !_4217;
    int _4419 = _4417 ? _4385 : (-1);
    float _4421 = fma(_4347, _4409, _1049);
    int _4423 = ~_4397;
    int _4425 = _4423 + _4407;
    int _4427 = _4425 + 1;
    float _4429 = _4187 + 0.5;
    float _4431 = float(_4419);
    float _4433 = exp2(_4411);
    bool _4435 = !_4413;
    int _4437 = _4435 ? _4427 : (-1);
    float _4439 = fma(_4347, _4429, _4421);
    bool _4441 = !_4399;
    int _4443 = _4441 ? _4371 : (-1);
    float _4445 = fma(_4321, _4431, _1503);
    float _4447 = float(_4437);
    float _4449 = _4405 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4451 = float(_4443);
    float _4453 = _4325 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _4455 = _4163 + 0.5;
    bool _4457 = _1827 <= 8000.0;
    bool _4459 = isnan(_1827);
    bool _4461 = _4457 || _4459;
    bool _4463 = isnan(8000.0);
    bool _4465 = _4461 || _4463;
    float _4467 = float(_4465);
    float _4469 = -_1505;
    float _4471 = fma(_4449, _4451, _4469);
    float _4473 = -_1307;
    float _4475 = fma(_4453, _4447, _4473);
    float _4477 = _3641 + (-0.5);
    float _4479 = _4053 + (-0.5);
    float _4481 = fma(_4321, _4455, _4445);
    float _4483 = -_4449;
    float _4485 = fma(_4483, _4477, _4471);
    float _4487 = -_4453;
    float _4489 = fma(_4487, _4479, _4475);
    float _4491 = -_1495;
    float _4493 = _4491 + 1.0;
    float _4495 = -_1497;
    float _4497 = _4495 + 1.0;
    float _4499 = fma(_3641, _3499, _4485);
    float _4501 = -_4493;
    float _4503 = fma(_4163, _4501, _4481);
    float _4505 = -_4497;
    float _4507 = fma(_4187, _4505, _4439);
    float _4509 = fma(_2568, -0.5, _4415);
    float _4511 = fma(_4053, _3533, _4489);
    float _4513 = fma(_4433, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4515 = precise::clamp(_4513, 0.0, 1.0);
    float _4517 = _4289 + _2516;
    float _4519 = _2554 + _2516;
    float _4521 = _4101 + _4245;
    out.m_90.x = _4507;
    out.m_90.y = _4511;
    out.m_90.z = _4503;
    out.m_90.w = _4499;
    float _4523 = fma(_4515, -2.0, 3.0);
    float _4525 = _4515 * _4515;
    float _4527 = _4517 * 0.5;
    float _4529 = _4519 * 0.5;
    float _4531 = _4081 + _4239;
    float _4533 = _4525 * _4523;
    out.m_92.x = _4529;
    out.m_92.y = _4509;
    out.m_92.z = _4527;
    out.m_92.w = _2516;
    out.m_94.x = _4531;
    out.m_94.y = _4521;
    out.m_94.z = _4271;
    float _4535 = -_3521;
    float _4537 = _4535 + 1.0;
    float _4539 = _4511;
    float _4541 = _4509;
    if (!_2500)
    {
        _4539 = 1.0;
    }
    float _4543 = _4539;
    float _4545 = _4543;
    if (_2500)
    {
        bool _4547 = _2606 >= _2572;
        bool _4549 = isnan(_2606);
        bool _4551 = _4547 || _4549;
        bool _4553 = isnan(_2572);
        bool _4555 = _4551 || _4553;
        float _4557 = float(_4555);
        _4545 = _4557;
    }
    float _4559 = _4545;
    float _4561 = _4537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _4563 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4565 = isnan(_3245);
    bool _4567 = _4563 || _4565;
    bool _4569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4571 = _4567 || _4569;
    float _4573 = _4561 * _2608;
    float _4575 = -_4533;
    float _4577 = _4575 + 1.0;
    float _4579 = -_4561;
    float _4581 = _4579 + 1.0;
    float _4583 = _4559 * _3223;
    float _4585 = _2619 * _4573;
    float _4587 = fma(_4577, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4533);
    float _4589 = _3469 * _4573;
    float _4591 = _2619 * _4581;
    float _4593 = fma(_3465, _4585, _2613);
    float _4595 = _4467 * _4587;
    float _4597 = fma(_3467, _4585, _2615);
    float _4599 = fma(_2619, _4589, _2617);
    float _4601 = _3161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4603 = _4595 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4605 = _4577;
    float _4607 = _4561;
    float _4609 = _4581;
    if (!_4571)
    {
        _4541 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4611 = _4541;
    out.m_96.x = _4593;
    out.m_96.y = _4597;
    out.m_96.z = _4599;
    out.m_96.w = _4591;
    float _4613 = _3541 * _4603;
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = _4611;
    float _4619 = _4611;
    if (!_4571)
    {
        _4605 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4621 = _4605;
    float _4623 = _4621;
    float _4625 = _4621;
    if (!_4571)
    {
        _4607 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4627 = _4607;
    float _4629 = -_4615;
    float _4631 = fma(_4629, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4633 = _4627;
    float _4635 = _4627;
    if (!_4571)
    {
        _4609 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4637 = _4609;
    float _4639 = -_4583;
    float _4641 = fma(_4639, _4631, 1.0);
    float _4643 = precise::clamp(_4641, 0.0, 1.0);
    float _4645 = _4643 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4647 = _4643;
    float _4649 = _4645;
    float _4651 = _4637;
    float _4653 = _4637;
    if (!_4571)
    {
        _4647 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4655 = _4647;
    out.m_98.x = _4645;
    float _4657 = _4655;
    float _4659 = _4655;
    if (!_4571)
    {
        _4649 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4661 = _4649;
    bool _4663 = !_4571;
    float _4665 = _4661;
    float _4667 = _4661;
    if (!_4663)
    {
        bool _4669 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4671 = isnan(_3245);
        bool _4673 = _4669 || _4671;
        bool _4675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4677 = _4673 || _4675;
        if (!_4677)
        {
            float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4681 = _3245 + _4679;
            float _4683 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4685 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4683;
            float _4687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4689 = _4687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4691 = 1.0 / _4685;
            float _4693 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4695 = _4693 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4697 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4699 = _4697 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4701 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4703 = _4701 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4705 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4707 = _4705 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4709 = _4681 * _4691;
            float _4711 = precise::clamp(_4709, 0.0, 1.0);
            float _4713 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4715 = _4713 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4717 = fma(_4711, _4689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4719 = fma(_4711, _4715, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4721 = fma(_4711, _4695, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4723 = fma(_4711, _4699, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4725 = fma(_4711, _4703, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4727 = fma(_4711, _4707, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4625 = _4721;
            _4659 = _4725;
            _4619 = _4717;
            _4653 = _4723;
            _4635 = _4719;
            _4667 = _4727;
            _4729 = true;
        }
        else
        {
            bool _4731 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4733 = isnan(_3245);
            bool _4735 = _4731 || _4733;
            bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4739 = _4735 || _4737;
            if (!_4739)
            {
                _4617 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4741 = _4617;
            _4619 = _4741;
            if (!_4739)
            {
                _4623 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4743 = _4623;
            _4625 = _4743;
            if (!_4739)
            {
                _4633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4745 = _4633;
            _4635 = _4745;
            if (!_4739)
            {
                _4651 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4747 = _4651;
            _4653 = _4747;
            if (!_4739)
            {
                _4657 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4749 = _4657;
            _4659 = _4749;
            if (!_4739)
            {
                _4665 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4751 = _4665;
            bool _4753 = !_4739;
            _4667 = _4751;
            if (!_4753)
            {
                bool _4755 = _3245 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4757 = isnan(_3245);
                bool _4759 = _4755 || _4757;
                bool _4761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4763 = _4759 || _4761;
                if (!_4763)
                {
                    float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4767 = _3245 + _4765;
                    float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4771 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4769;
                    float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4777 = 1.0 / _4771;
                    float _4779 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4781 = _4779 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4783 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4785 = _4783 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4787 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4789 = _4787 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4793 = _4791 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4795 = _4767 * _4777;
                    float _4797 = precise::clamp(_4795, 0.0, 1.0);
                    float _4799 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4801 = _4799 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4803 = fma(_4797, _4775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4805 = fma(_4797, _4801, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4807 = fma(_4797, _4781, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4809 = fma(_4797, _4785, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4811 = fma(_4797, _4789, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4813 = fma(_4797, _4793, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4625 = _4807;
                    _4659 = _4811;
                    _4619 = _4803;
                    _4653 = _4809;
                    _4635 = _4805;
                    _4667 = _4813;
                    _4729 = true;
                }
                else
                {
                    _4625 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4659 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4619 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4653 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4667 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4729 = false;
    float _4815 = _4625;
    float _4817 = _4659;
    float _4819 = _4619;
    float _4821 = _4653;
    float _4823 = _4635;
    float _4825 = _4667;
    float _4827 = _4601 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4829 = fma(_4521, -0.5, 0.5);
    float _4831 = precise::clamp(_4829, 0.0, 1.0);
    float _4833 = -_4815;
    float _4835 = _4833 + _4817;
    float _4837 = -_4819;
    float _4839 = _4837 + _4821;
    out.m_100.x = 0.0;
    float _4841 = fma(_4831, _4835, _4815);
    float _4843 = -_4823;
    float _4845 = _4843 + _4825;
    float _4847 = fma(_4831, _4839, _4819);
    float _4849 = _4841 * 0.586610972881317138671875;
    bool _4851 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4853 = fma(_4831, _4845, _4823);
    out.m_59.x = _4827;
    float _4855 = fma(_4847, 0.298911988735198974609375, _4849);
    bool _4857 = _3161 > 0.0;
    bool _4859 = isnan(_3161);
    bool _4861 = _4857 || _4859;
    bool _4863 = isnan(0.0);
    bool _4865 = _4861 || _4863;
    float _4867 = fma(_4853, 0.114477999508380889892578125, _4855);
    float _4869 = -_4867;
    float _4871 = _4847 + _4869;
    float _4873 = -_4867;
    float _4875 = _4841 + _4873;
    float _4877 = -_4867;
    float _4879 = _4853 + _4877;
    float _4881 = fma(_4871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    float _4883 = fma(_4875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    float _4885 = fma(_4879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4867);
    bool _4887 = !_4851;
    if (!_4887)
    {
        float _4889 = -_2440;
        float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4893 = -_2442;
        float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4897 = -_2444;
        float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4901 = _4891 * _4891;
        float _4903 = fma(_4895, _4895, _4901);
        float _4905 = fma(_4899, _4899, _4903);
        float _4907 = sqrt(_4905);
        float _4909 = rsqrt(_4905);
        float _4911 = -_4907;
        float _4913 = _4911 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4915 = _4913 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4917 = precise::clamp(_4915, 0.0, 1.0);
        float _4919 = _4895 * _4909;
        float _4921 = _4891 * _4909;
        float _4923 = abs(_4917);
        float _4925 = log2(_4923);
        float _4927 = _4899 * _4909;
        float _4929 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4931 = _4521 * _4921;
        float _4933 = -_4921;
        float _4935 = -_4929;
        float _4937 = fma(_4933, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4935);
        float _4939 = fma(_4531, _4919, _4931);
        float _4941 = -_4927;
        float _4943 = fma(_4941, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4937);
        float _4945 = fma(_4271, _4927, _4939);
        float _4947 = precise::clamp(_4945, 0.0, 1.0);
        float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4951 = _4943 + _4949;
        float _4953 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4955 = _4951 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4957 = precise::clamp(_4955, 0.0, 1.0);
        float _4959 = exp2(_4953);
        float _4961 = _4959 * _4957;
        float _4963 = _4947 * _4961;
        float _4965 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4967 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4969 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4965;
        out.m_100.y = _4967;
        out.m_100.z = _4969;
    }
    out.m_80.x = _4881;
    out.m_80.y = _4883;
    out.m_80.z = _4885;
    if (_4865)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _4971 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4971;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

