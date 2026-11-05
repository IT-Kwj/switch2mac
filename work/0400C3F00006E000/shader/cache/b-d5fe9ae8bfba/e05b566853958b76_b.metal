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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_14 [[id(11)]];
    sampler vp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_16 [[id(13)]];
    sampler vp_t_tcb_16Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_88 [[user(locn1)]];
    float4 m_90 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_104 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_102 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 m_100 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_80 [[attribute(2)]];
    float4 m_78 [[attribute(3)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_70 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2593 = false;
    bool _1397 = false;
    bool _569 = false;
    bool _457 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_60.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2892 = as_type<float>(_139);
        out.gl_Position.z = _2892;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2960 = as_type<float>(_175);
        out.gl_Position.z = _2960;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_70.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_123);
        float _221 = 1.0 / _219;
        float _223 = _157 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _249;
    float _261 = 1.0 / _245;
    float _263 = _233 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _225 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_271, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = 1.0 / _253;
    float _277 = _229 * _259;
    bool _279 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _281 = isnan(_225);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_289;
    float _293 = _291 + 1.0;
    float _295 = _237 * _261;
    bool _297 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_225);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _311 = isnan(_225);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _307 * _293;
    bool _323 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_225);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _267 * _275;
    float _337 = -_307;
    float _339 = _337 + 1.0;
    bool _341 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_225);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _319 * _339;
    float _363 = -_319;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = fma(_355, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = _333 * _365;
    float _377 = -_333;
    float _379 = _377 + 1.0;
    float _381 = -_351;
    float _383 = _381 + 1.0;
    float _385 = fma(_369, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = _351 * _379;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = _371 * _387;
    float _399 = _273 * _387;
    float _401 = fma(_391, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = fma(_373, _375, _405);
    float _419 = fma(_385, _375, _407);
    float _421 = fma(_411, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _423 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _425 = fma(_401, _361, _417);
    float _427 = fma(_403, _361, _419);
    float _429 = fma(_421, _321, _425);
    float _431 = fma(_423, _321, _427);
    float _433 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[147].x, _429);
    float _435 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[147].y, _431);
    bool _437 = !_257;
    float _455;
    if (!_437)
    {
        float _439 = in.m_70.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        float _459 = float(_123);
        float _461 = 1.0 / _459;
        float _463 = _157 * _461;
        _455 = _463;
    }
    _457 = false;
    float _465 = _455;
    bool _467 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_465);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_465);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _465 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = 1.0 / _481;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _497 * _509;
    float _519 = fma(_517, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _519 * _511;
    float _523 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _523);
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _541 = in.m_72.x;
    float _543 = in.m_72.y;
    out.m_74.x = _533;
    out.m_74.y = _535;
    out.m_74.z = _537;
    out.m_74.w = _539;
    float _545 = _435 * _543;
    float _547 = _433 * _541;
    bool _549 = !_507;
    float _567;
    if (!_549)
    {
        float _551 = in.m_70.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _567 = _565;
        _569 = true;
    }
    else
    {
        float _571 = float(_123);
        float _573 = 1.0 / _571;
        float _575 = _157 * _573;
        _567 = _575;
    }
    _569 = false;
    float _577 = _567;
    float _579 = in.m_60.x;
    float _581 = in.m_60.y;
    float _583 = in.m_60.z;
    float _585 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _589 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = in.m_76.x;
    float _593 = in.m_76.y;
    float _595 = in.m_76.z;
    float _597 = in.m_76.w;
    float _599 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _601 = _585 * _587;
    float _603 = in.m_78.x;
    float _605 = in.m_78.y;
    float _607 = in.m_78.z;
    float _609 = in.m_78.w;
    float _611 = _589 * _599;
    float _613 = _601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _615 = _601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _617 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _619 = _601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _621 = _581 * _593;
    float _623 = _581 * _605;
    float _625 = fma(_579, _591, _621);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
    float _629 = fma(_579, _603, _623);
    float _631 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
    float _633 = fma(_583, _595, _625);
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
    float _637 = fma(_583, _607, _629);
    float _639 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _631);
    float _641 = _633 + _597;
    float _643 = _635 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _645 = _637 + _609;
    float _647 = _639 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _649 = _641 + _643;
    float _651 = _645 + _647;
    float _653 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _655 = _649 + _653;
    float _657 = in.m_80.x;
    float _659 = in.m_80.y;
    float _661 = in.m_80.z;
    float _663 = in.m_80.w;
    float _665 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _667 = _651 + _665;
    float _669 = _655 * _655;
    float _671 = _667 * _667;
    float _673 = _669 + _671;
    float _675 = sqrt(_673);
    float _677 = _581 * _659;
    float _679 = fma(_579, _657, _677);
    bool _681 = _675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _685 = _675 + _683;
    float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
    float _689 = fma(_583, _661, _679);
    float _691 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _687);
    float _693 = _689 + _663;
    float _695 = _691 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _697 = _335;
    float _699 = _619;
    float _701 = _663;
    float _703 = _695;
    float _705 = _691;
    float _707 = _685;
    float _709 = _669;
    float _711 = _671;
    float _713 = _645;
    float _715 = _641;
    if (_681)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _697 = _717;
    }
    float _719 = _697;
    float _721 = _693 + _695;
    float _723 = _721;
    if (!_681)
    {
        _699 = _649;
    }
    float _725 = _699;
    float _727 = _725;
    if (!_681)
    {
        _701 = _651;
    }
    float _729 = _701;
    float _731 = _729;
    if (_681)
    {
        float _733 = _721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _703 = _733;
    }
    float _735 = _703;
    float _737 = _735;
    if (_681)
    {
        float _739 = rsqrt(_673);
        _705 = _739;
    }
    float _741 = _705;
    float _743 = _719;
    float _745 = _741;
    if (_681)
    {
        float _747 = _685 * _719;
        _743 = _747;
    }
    float _749 = _743;
    float _751 = _749;
    if (_681)
    {
        float _753 = _749 * 0.15915493667125701904296875;
        _751 = _753;
    }
    float _755 = _751;
    float _757 = _675;
    if (_681)
    {
        float _759 = _755 * 6.283185482025146484375;
        float _761 = sin(_759);
        _757 = _761;
    }
    float _763 = _757;
    if (_681)
    {
        float _765 = fma(_763, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _737 = _765;
    }
    float _767 = _737;
    if (_681)
    {
        float _769 = _741 * _767;
        _745 = _769;
    }
    float _771 = _745;
    if (_681)
    {
        float _773 = fma(_655, _771, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _727 = _773;
    }
    float _775 = _727;
    if (_681)
    {
        float _777 = fma(_667, _771, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _731 = _777;
    }
    float _779 = _731;
    float _781 = fma(_775, 6.2500002968590706586837768554688e-05, 0.5);
    float _783 = fma(_779, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3928 = float2(_781, _783);
    float3 _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3928, float2(0.0), isnan(_3928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3928, float2(0.0), isnan(_3928)), level(0.0)).xyz;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float _795 = in.m_70.x;
    float _797 = in.m_70.y;
    float _799 = in.m_70.z;
    float _801 = in.m_70.w;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    out.m_82.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_82.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_82.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _815 = _813 != 0;
    float _817 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    bool _819 = _801 > 0.5;
    float _821 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _825 = _795 > 0.5;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _831 = -_191;
    int _833 = _825 ? as_type<int>(_831) : as_type<int>(_191);
    float _835 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _837 = 0.0;
    if (!_805)
    {
        _837 = _795;
    }
    float _839 = _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _845 = _799 > 0.5;
    float _847 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _823);
    float _849 = 0.0;
    float _851 = _839;
    if (!_805)
    {
        _849 = _799;
    }
    float _853 = _849;
    float _855 = 1.0 / _843;
    float _857 = _853;
    if (!_805)
    {
        _707 = _799;
    }
    float _859 = _707;
    float _861 = -_827;
    float _863 = fma(_821, 2.0, _861);
    float _865 = _859;
    if (_805)
    {
        _851 = _799;
    }
    float _867 = _851;
    float _869 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[79].z, _829);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _875 = _797 > 0.5;
    float _877 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _817);
    bool _879 = !_809;
    float _881 = _879 ? _191 : as_type<float>(_833);
    float _883 = 1.0 / _873;
    float _885 = -_195;
    int _887 = _875 ? as_type<int>(_885) : as_type<int>(_195);
    float _889 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[79].x, _869);
    float _891 = -_191;
    int _893 = _875 ? as_type<int>(_891) : as_type<int>(_191);
    float _895 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _897 = 0.0;
    if (!_805)
    {
        _897 = _797;
    }
    float _899 = _897;
    float _901 = _889 * (-0.15915493667125701904296875);
    float _903 = 0.0;
    float _905 = _899;
    if (!_805)
    {
        _903 = _797;
    }
    float _907 = _903;
    float _909 = -_895;
    float _911 = _909 + 1.0;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _919 = -_191;
    int _921 = _845 ? as_type<int>(_919) : as_type<int>(_191);
    float _923 = _907;
    if (_805)
    {
        _905 = _795;
    }
    float _925 = _905;
    if (_805)
    {
        _923 = _795;
    }
    float _927 = _923;
    float _929 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _933 = _931 != 0;
    float _935 = _929 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_805)
    {
        _857 = _797;
    }
    float _937 = _857;
    float _939 = _929 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_805)
    {
        _865 = _797;
    }
    float _941 = _865;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _943;
    bool _947 = !_915;
    float _949 = _947 ? _191 : as_type<float>(_921);
    float _951 = fma(_929, _929, 1.0);
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _955 = _953 != 0;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _959 = _957 != 0;
    float _961 = _929 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _967 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _935);
    float _969 = _945 * _883;
    float _971 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _973 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _939);
    float _975 = _965 * _855;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _979 = _577 + _977;
    float _981 = rsqrt(_951);
    float _983 = fma(_969, _979, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _985 = !_955;
    float _987 = _985 ? _191 : as_type<float>(_893);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _991 = _577 + _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _995 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _997 = isnan(_577);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1009 = -_195;
    int _1011 = _819 ? as_type<int>(_1009) : as_type<int>(_195);
    float _1013 = fma(_975, _991, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1015 = -_195;
    int _1017 = _845 ? as_type<int>(_1015) : as_type<int>(_195);
    float _1019 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[84].z, _993);
    bool _1021 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1023 = isnan(_577);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_1005;
    float _1035 = _1033 + 1.0;
    float _1037 = _929 * _981;
    bool _1039 = !_815;
    float _1041 = _1039 ? _195 : as_type<float>(_887);
    float _1043 = _1031 * _1035;
    bool _1045 = !_933;
    float _1047 = _1045 ? _195 : as_type<float>(_1011);
    float _1049 = -_1031;
    float _1051 = _1049 + 1.0;
    bool _1053 = !_959;
    float _1055 = _1053 ? _195 : as_type<float>(_1017);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1059 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1061 = isnan(_577);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1073 = _1037 * _1071;
    float _1075 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1079 = _1037 * _1077;
    float _1081 = _1069 * _1051;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1085 = _1037 * _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1089 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1079);
    float _1091 = _983 * _1081;
    float _1093 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1073);
    float _1095 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1085);
    float _1097 = fma(_835, -2.0, _1087);
    float _1099 = _901 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1019);
    float _1105 = -_1069;
    float _1107 = _1105 + 1.0;
    out.m_84.x = _1093;
    out.m_84.y = _1089;
    out.m_84.z = _1095;
    float _1109 = _1103 * (-0.15915493667125701904296875);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1113 = _901 * 6.283185482025146484375;
    float _1115 = cos(_1113);
    float _1117 = _925 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1119 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1091);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1123 = -_1111;
    float _1125 = fma(_1117, 2.0, _1123);
    float _1127 = _937 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1129 = fma(_1013, _1043, _1119);
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = _1041 * _1101;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1137 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1121);
    float _1139 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1097);
    float _1141 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1075);
    float _1143 = fma(_1127, -2.0, _1135);
    float _1145 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1137);
    float _1147 = _1041 * _1115;
    float _1149 = _1109 * 6.283185482025146484375;
    float _1151 = cos(_1149);
    float _1153 = -_1133;
    float _1155 = fma(_881, _1115, _1153);
    float _1157 = -_157;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[76].x, _863);
    float _1161 = -_157;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    float _1165 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1143);
    float _1167 = fma(_881, _1101, _1147);
    float _1169 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1129);
    float _1171 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1173 = _1109 * 6.283185482025146484375;
    float _1175 = sin(_1173);
    float _1177 = _1155 + 0.5;
    float _1179 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1181 = _987 + 0.5;
    float _1183 = -_1055;
    float _1185 = _1183 + 0.5;
    float _1187 = fma(_1171, _1177, _1159);
    float _1189 = -_1145;
    float _1191 = _1189 + 1.0;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1195 = _1131;
    float _1197 = _1179;
    float _1199 = _1097;
    float _1201 = _971;
    int _1203 = as_type<int>(_1109);
    if (_681)
    {
        float _1205 = _755 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        _1195 = _1207;
    }
    float _1209 = _1195;
    float _1211 = _1047 * _1151;
    float _1213 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1215 = _1169 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1219 = _1167 + (-0.5);
    float _1221 = _1047 * _1175;
    float _1223 = fma(_949, _1175, _1211);
    float _1225 = -_1179;
    float _1227 = -_1139;
    float _1229 = fma(_1225, _1219, _1227);
    float _1231 = _1211;
    if (!_681)
    {
        _1197 = _721;
    }
    float _1233 = _1197;
    float _1235 = _1223 + (-0.5);
    float _1237 = _1233;
    if (_681)
    {
        float _1239 = _1209 + (-1.0);
        _1199 = _1239;
    }
    float _1241 = _1199;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1245 = -_1221;
    float _1247 = fma(_949, _1151, _1245);
    float _1249 = fma(_1167, _911, _1229);
    if (_681)
    {
        float _1251 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1251;
    }
    float _1253 = _1231;
    float _1255 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1259 = _1255;
    if (_681)
    {
        float _1261 = fma(_721, _1209, _1253);
        _1237 = _1261;
    }
    float _1263 = _1237;
    if (_681)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1267 = _775 + _1265;
        _723 = _1267;
    }
    float _1269 = _723;
    float _1271 = -_1255;
    float _1273 = -_1165;
    float _1275 = fma(_1271, _1235, _1273);
    int _1277 = as_type<int>(_1275);
    if (_681)
    {
        float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1281 = _779 + _1279;
        _1259 = _1281;
    }
    float _1283 = _1259;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1287 = _1263 + _1285;
    if (_681)
    {
        float _1289 = _1269 * _1269;
        _709 = _1289;
    }
    float _1291 = _709;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_681)
    {
        float _1297 = _1283 * _1283;
        _711 = _1297;
    }
    float _1299 = _711;
    float _1301 = fma(_1287, _1287, _1291);
    float _1303 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1305 = _1247 + 0.5;
    float _1307 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1301 + _1299;
    float _1311 = -_877;
    float _1313 = _1311 + 1.0;
    float _1315 = fma(_1303, _1305, _1163);
    float _1317 = _1193 * _1257;
    float _1319 = -_1141;
    float _1321 = _1319 + 1.0;
    float _1323 = sqrt(_1309);
    float _1325 = -_1313;
    float _1327 = fma(_1155, _1325, _1187);
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1331 = fma(_1223, _1191, _1275);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1335 = -_1321;
    float _1337 = fma(_1247, _1335, _1315);
    float _1339 = _1213 * _1295;
    float _1341 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1345 = _967 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1347 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1349 = _973 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_86.x = _1317;
    out.m_86.y = _1339;
    out.m_88.x = _1307;
    out.m_88.y = _1341;
    out.m_88.z = _1343;
    out.m_88.w = _1215;
    bool _1351 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1353 = isnan(_1323);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1359 = _1355 || _1357;
    out.m_90.x = _1327;
    out.m_90.y = _1249;
    out.m_90.z = _1337;
    out.m_90.w = _1331;
    out.m_92.x = _1345;
    out.m_92.y = _1347;
    out.m_92.z = _1349;
    float _1361 = _1295;
    if (!_1359)
    {
        _1201 = 1.0;
    }
    float _1363 = _1201;
    out.m_94.x = _789;
    out.m_94.y = _791;
    out.m_94.z = _793;
    bool _1365 = !_1359;
    float _1367 = _1363;
    if (!_1365)
    {
        bool _1369 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1371 = isnan(_1323);
        bool _1373 = _1369 || _1371;
        bool _1375 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1377 = _1373 || _1375;
        if (!_1377)
        {
            float _1379 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1381 = _1323 + _1379;
            float _1383 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1385 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1383;
            float _1387 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1389 = _1387 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1391 = 1.0 / _1385;
            float _1393 = _1381 * _1391;
            float _1395 = fma(_1393, _1389, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1367 = _1395;
            _1397 = true;
        }
        else
        {
            bool _1399 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1401 = isnan(_1323);
            bool _1403 = _1399 || _1401;
            bool _1405 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1407 = _1403 || _1405;
            if (!_1407)
            {
                float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1411 = _1323 + _1409;
                float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1415 = _1413 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1419 = _1417 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1421 = 1.0 / _1415;
                float _1423 = _1411 * _1421;
                float _1425 = fma(_1423, _1419, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1367 = _1425;
                _1397 = true;
            }
            else
            {
                _1367 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1397 = false;
    float _1427 = _1367;
    float _1429 = _693 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1433 = _1263 + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1437 = _775 + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1441 = _779 + _1439;
    float _1443 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1429);
    float _1445 = fma(_1433, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1447 = fma(_1437, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1449 = fma(_1441, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1451 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1443);
    float _1453 = _693 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1457 = _1445 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1461 = _1447 + _1459;
    float _1463 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1465 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1453);
    float _1467 = _1457 * _1457;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1449 + _1469;
    float _1473 = 1.0 / _1463;
    float _1475 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1465);
    float _1477 = fma(_1461, _1461, _1467);
    float _1479 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1481 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1483 = fma(_1471, _1471, _1477);
    float _1485 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1479);
    float _1487 = _1481 + _1463;
    float _1489 = rsqrt(_1483);
    float _1491 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1493 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1495 = _1487 * _1473;
    float _1497 = _1495 * 0.5;
    float _1499 = _693 + _1491;
    float _1501 = sqrt(_1483);
    float _1503 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1493);
    float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1505);
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1511 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1513 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1509);
    float _1515 = 1.0 / _1507;
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1519 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1513);
    float _1521 = _1461 * _1517;
    float _1523 = _1471 * _1517;
    float _1525 = _1519 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1527 = floor(_1511);
    float _1529 = _1521 * _1521;
    float _1531 = _1523 * _1523;
    float _1533 = _1529 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1537 = _1515 * _1535;
    float _1539 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1541 = sqrt(_1533);
    bool _1543 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1545 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1539);
    bool _1547 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1549 = -_1527;
    float _1551 = _1511 + _1549;
    float _1553 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1545);
    float _1555 = trunc(_1525);
    int _1557 = int(_1555);
    float _1559 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1561 = !_1543;
    int _1563 = _1561 ? 0 : 1;
    int _1565 = 2;
    float _1567 = _1457;
    float _1569 = _1521;
    float _1571 = _1523;
    float _1573 = _1531;
    float _1575 = _1503;
    if (!_1543)
    {
        _1565 = 1;
    }
    int _1577 = _1565;
    float _1579 = trunc(_1559);
    int _1581 = int(_1579);
    bool _1583 = _1541 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1541 + _1585;
    int _1589 = _1577;
    float _1591 = _1587;
    if (!_1547)
    {
        _1589 = _1563;
    }
    int _1593 = _1589;
    int _1595 = _1593 << 6;
    int _1597 = _1595 + 96;
    uint _1600 = uint(int(uint(_1597) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    float _1616 = _1249;
    float _1618 = as_type<float>(_1593);
    if (_1583)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1620;
    }
    float _1622 = _1616;
    int _1624 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1626 = _1581 + _1624;
    int _1628 = _1626 + 1;
    float _1630 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1632 = _1595 + 104;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    bool _1650 = _1628 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1652 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1630);
    float _1654 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1652);
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1658 = _1654;
    int _1660 = _1628;
    if (_1583)
    {
        float _1662 = _1587 * _1622;
        _1591 = _1662;
    }
    float _1664 = _1591;
    int _1666 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1668 = _1557 + _1666;
    int _1670 = _1668 + 1;
    if (_1583)
    {
        float _1672 = rsqrt(_1533);
        _1658 = _1672;
    }
    float _1674 = _1658;
    float _1676 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (_1583)
    {
        float _1678 = _1664 * 0.15915493667125701904296875;
        _1361 = _1678;
    }
    float _1680 = _1361;
    int _1682 = _1628 | _1670;
    bool _1684 = _1682 < 0;
    bool _1686 = _1684 || _1650;
    float _1688 = _1337;
    if (_1583)
    {
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        _1688 = _1692;
    }
    float _1694 = _1688;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1698 = _1670 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1700 = _1698 || _1686;
    float _1702 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1704 = precise::max(0.0, _1696);
    float _1706 = _1341;
    if (_1583)
    {
        float _1708 = _1680 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        _1706 = _1710;
    }
    float _1712 = _1706;
    float _1714 = -_1676;
    float _1716 = fma(_1714, _1702, 1.0);
    float _1718 = -_1517;
    float _1720 = -_1704;
    float _1722 = fma(_1457, _1718, _1720);
    float _1724 = _1722;
    if (_1583)
    {
        float _1726 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1567 = _1726;
    }
    float _1728 = _1567;
    float _1730 = _1728;
    if (!_1700)
    {
        int _1732 = _1670 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1734 = _1732 + _1628;
        _1660 = _1734;
    }
    int _1736 = _1660;
    float _1738 = log2(_1716);
    float _1740 = _1499 * _1614;
    float _1742 = _1614;
    if (_1583)
    {
        float _1744 = _1694 + (-1.0);
        _1742 = _1744;
    }
    float _1746 = _1742;
    int _1748 = _1595 + 48;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    float _1766 = _1746;
    if (!_1700)
    {
        int _1768 = _1736 << 2;
        _1203 = _1768;
    }
    int _1770 = _1203;
    float _1772 = fma(_641, _1606, _1740);
    int _1774 = _1770;
    if (_1583)
    {
        float _1776 = fma(_1712, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1776;
    }
    float _1778 = _1730;
    float _1780 = _1778;
    if (_1583)
    {
        float _1782 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1766 = _1782;
    }
    float _1784 = _1766;
    float _1786 = _1784;
    if (!_1700)
    {
        uint _1788 = uint(int(uint(_1736) >> uint(2)));
        _1277 = int(_1788);
    }
    int _1790 = _1277;
    float _1792 = fma(_645, _1640, _1772);
    if (_1583)
    {
        float _1794 = _1674 * _1778;
        _1780 = _1794;
    }
    float _1796 = _1780;
    if (_1583)
    {
        float _1798 = fma(_1722, _1694, _1784);
        _1724 = _1798;
    }
    float _1800 = _1724;
    if (!_1583)
    {
        _1786 = _1529;
    }
    float _1802 = _1786;
    int _1804 = _1595 + 64;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    uint _1808 = uint(int(uint(int(_1806)) >> uint(2)));
    int _1810 = int(_1806) & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    int _1814 = int(_1806) + 1;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    int _1818 = _1814 & 3;
    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[int(_1816)][_1818];
    float _1822 = _1802;
    if (_1583)
    {
        float _1824 = _1521 * _1796;
        _1569 = _1824;
    }
    float _1826 = _1569;
    if (_1583)
    {
        float _1828 = _1523 * _1796;
        _1571 = _1828;
    }
    float _1830 = _1571;
    float _1832 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1583)
    {
        float _1834 = _1826 * _1826;
        _1822 = _1834;
    }
    float _1836 = _1822;
    float _1838 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1840 = _1595 + 56;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c15)._m0[int(_1844)][_1846];
    int _1850 = int(_1842) + 1;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    int _1854 = _1850 & 3;
    float _1856 = (*spvDescriptorSet0.vp_c15)._m0[int(_1852)][_1854];
    float _1858 = fma(_1800, _1800, _1836);
    float _1860 = _1838;
    if (_1583)
    {
        float _1862 = _1830 * _1830;
        _1573 = _1862;
    }
    float _1864 = _1573;
    float _1866 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1832);
    float _1868 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1485);
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1858 + _1864;
    float _1878 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1866);
    int _1880 = _1595 + 72;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    uint _1884 = uint(int(uint(int(_1882)) >> uint(2)));
    int _1886 = int(_1882) & 3;
    float _1888 = (*spvDescriptorSet0.vp_c15)._m0[int(_1884)][_1886];
    int _1890 = int(_1882) + 1;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    int _1894 = _1890 & 3;
    float _1896 = (*spvDescriptorSet0.vp_c15)._m0[int(_1892)][_1894];
    float _1898 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = -_1874;
    float _1902 = _1900 + 1.0;
    float _1904 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (!_1700)
    {
        int _1906 = 12 & _1770;
        _1774 = _1906;
    }
    int _1908 = _1774;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1912 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1503);
    float _1914 = rsqrt(_1876);
    int _1916 = _1595 + 80;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
    int _1922 = int(_1918) & 3;
    float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
    int _1926 = int(_1918) + 1;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    int _1930 = _1926 & 3;
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
    float _1934 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1910);
    float _1936 = _1792 + _1648;
    if (!_1700)
    {
        int _1938 = _1790 << 4;
        int _1940 = _1938 + _1908;
        _1575 = as_type<float>(_1940);
    }
    float _1942 = _1575;
    float _1944 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1946 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1934);
    float _1948 = floor(_1838);
    int _1950 = _1595 + 88;
    uint _1952 = uint(int(uint(_1950) >> uint(2)));
    uint _1954 = uint(int(uint(int(_1952)) >> uint(2)));
    int _1956 = int(_1952) & 3;
    float _1958 = (*spvDescriptorSet0.vp_c15)._m0[int(_1954)][_1956];
    int _1960 = int(_1952) + 1;
    uint _1962 = uint(int(uint(_1960) >> uint(2)));
    int _1964 = _1960 & 3;
    float _1966 = (*spvDescriptorSet0.vp_c15)._m0[int(_1962)][_1964];
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1946);
    float _1970 = _1499 * _1764;
    float _1972 = 1.0 / _1936;
    float _1974 = _1942;
    if (!_1700)
    {
        int _1976 = as_type<int>(_1942) + 400;
        uint _1978 = uint(int(uint(_1976) >> uint(2)));
        uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
        int _1982 = int(_1978) & 3;
        float _1984 = (*spvDescriptorSet0.vp_c15)._m0[int(_1980)][_1982];
        _1974 = _1984;
    }
    float _1986 = _1974;
    float _1988 = _1914 * _1826;
    float _1990 = fma(_641, _1756, _1970);
    float _1992 = _1914 * _1800;
    float _1994 = _1914 * _1830;
    float _1996 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1998 = abs(_1902);
    float _2000 = log2(_1998);
    float _2002 = _1499 * _1820;
    float _2004 = -_1948;
    float _2006 = _1838 + _2004;
    float _2008 = fma(_641, _1812, _2002);
    float _2010 = 1.0 / _1968;
    float _2012 = fma(_645, _1848, _1990);
    float _2014 = _2012 + _1856;
    float _2016 = -_1996;
    float _2018 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2016);
    float _2020 = _1856;
    if (!_1700)
    {
        float _2022 = floor(_1525);
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = fma(_645, _1888, _2008);
    float _2028 = _2014 * _1972;
    float _2030 = -_1994;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2018);
    float _2034 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = _2026 + _1896;
    bool _2038 = _2028 >= 0.0;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = _2036 * _1972;
    float _2044 = _1499 * _1932;
    bool _2046 = _2028 <= 1.0;
    bool _2048 = _2046 && _2038;
    float _2050 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2052 = fma(_641, _1924, _2044);
    bool _2054 = _2042 >= 0.0;
    bool _2056 = _2054 && _2048;
    float _2058 = fma(_2032, 0.5, 0.5);
    float _2060 = sqrt(_2040);
    float _2062 = fma(_645, _1958, _2052);
    bool _2064 = _2042 <= 1.0;
    bool _2066 = _2064 && _2056;
    float _2068 = fma(_2058, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1700)
    {
        float _2070 = -_2024;
        float _2072 = _1525 + _2070;
        _1860 = _2072;
    }
    float _2074 = _1860;
    float _2076 = _2062 + _1966;
    float _2078 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2050);
    float _2080 = fma(_2058, _2068, -0.212114393711090087890625);
    float _2082 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2084 = exp2(_2034);
    float _2086 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2088 = fma(_2058, _2080, 1.570728778839111328125);
    float _2090 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2082);
    float _2092 = _1992 + 1.0;
    float _2094 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2096 = _2094;
    if (_2066)
    {
        float _2098 = float(_1593);
        _1618 = _2098;
    }
    float _2100 = _1618;
    float _2102 = _2060 * 0.636619746685028076171875;
    float _2104 = _2032;
    float _2106 = _2102;
    if (!_1700)
    {
        float _2108 = floor(_1559);
        _2104 = _2108;
    }
    float _2110 = _2104;
    float _2112 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2090);
    float _2114 = -_2088;
    float _2116 = fma(_2102, _2114, 1.0);
    float _2118 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2112);
    float _2120 = _1738 * 0.693147182464599609375;
    float _2122 = _2094 * _2010;
    float _2124 = _2062;
    float _2126 = _2118;
    if (!_1700)
    {
        float _2128 = rint(_1986);
        float _2130 = precise::max(_2128, 0.0);
        uint _2132 = uint(_2130);
        uint _2134 = clamp(_2132, 0u, 65535u);
        _2124 = as_type<float>(_2134);
    }
    float _2136 = _2124;
    float _2138 = -_1992;
    float _2140 = fma(_2084, _2092, _2138);
    float _2142 = _2118 * _2010;
    float _2144 = _2076 * _1972;
    float _2146 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2148 = fma(_2122, 0.5, 0.5);
    float _2150 = fma(_2142, -0.5, 0.5);
    float _2152 = fma(_2140, 0.5, 0.5);
    float _2154 = _2090;
    if (_2066)
    {
        float _2156 = rint(_2100);
        float _2158 = precise::max(_2156, 0.0);
        uint _2160 = uint(_2158);
        uint _2162 = clamp(_2160, 0u, 65535u);
        _2154 = as_type<float>(_2162);
    }
    float _2164 = _2154;
    if (!_1700)
    {
        float _2166 = -_2110;
        float _2168 = _1559 + _2166;
        _2106 = _2168;
    }
    float _2170 = _2106;
    float2 _6303 = float2(_2006, _1551);
    float _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6303, float2(0.0), isnan(_6303)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6303, float2(0.0), isnan(_6303)), level(0.0)).x;
    float _2174 = _2136;
    if (!_1700)
    {
        float3 _6318 = float3(_2170, _2074, float(as_type<int>(_2136)));
        float3 _6322 = select(_6318, float3(0.0), isnan(_6318));
        float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6322.xy, uint(rint(_6322.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6322.xy, uint(rint(_6322.z)), level(0.0)).x;
        _2174 = _2176;
    }
    float _2178 = _2174;
    float _2180 = _2042;
    if (_2066)
    {
        float3 _6337 = float3(_2028, _2042, float(as_type<int>(_2164)));
        float3 _6339 = select(_6337, float3(0.0), isnan(_6337));
        float _2182 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6339.xy, uint(rint(_6339.z)), _2144, level(0.0));
        _2180 = _2182;
    }
    float _2184 = _2180;
    float3 _6349 = float3(_2148, _2150, _2146);
    float _2186 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).x;
    float3 _6358 = float3(_2148, _2150, _2146);
    float4 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6358, float3(0.0), isnan(_6358)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6358, float3(0.0), isnan(_6358)), level(0.0)).xyzw;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = _2189.w;
    float2 _6374 = float2(_2116, _2152);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6374, float2(0.0), isnan(_6374)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6374, float2(0.0), isnan(_6374)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = abs(_1537);
    float _2209 = log2(_2207);
    float _2211 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2213 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2215 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2211);
    float _2217 = exp2(_2213);
    float _2219 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    float _2221 = _1968 * 0.5;
    float _2223 = _2094 + _1968;
    float _2225 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2227 = _2223 * 0.5;
    float _2229 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2231 = _2225 + _1968;
    float _2233 = fma(_2118, -0.5, _2221);
    out.gl_Position.x = _2094;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _2225;
    out.gl_Position.w = _1968;
    float _2235 = _2231 * 0.5;
    float _2237 = exp2(_2229);
    out.m_96.x = _2227;
    out.m_96.y = _2233;
    out.m_96.z = _2235;
    out.m_96.w = _1968;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = fma(_2241, -2.0, 3.0);
    float _2245 = _2241 * _2241;
    bool _2247 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan(0.5);
    bool _2255 = _2251 || _2253;
    float _2257 = _2245 * _2243;
    bool _2259 = _1537 <= 8000.0;
    bool _2261 = isnan(_1537);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(8000.0);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = -_2257;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2257);
    float _2277 = _2269 * _2275;
    float _2279 = _2269;
    if (_2255)
    {
        _2279 = 1.0;
    }
    float _2281 = _2279;
    float _2283 = _2281;
    float _2285 = _2184;
    float _2287 = _2178;
    if (!_2255)
    {
        float _2289 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2291 = _2289 * 0.15915493667125701904296875;
        float _2293 = _2291 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        float _2297 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2299 = _2297 * 0.15915493667125701904296875;
        float _2301 = _2291 * 6.283185482025146484375;
        float _2303 = sin(_2301);
        float _2305 = 1.0 / _2295;
        float _2307 = _2299 * 6.283185482025146484375;
        float _2309 = cos(_2307);
        float _2311 = _2303 * _2305;
        float _2313 = _2299 * 6.283185482025146484375;
        float _2315 = sin(_2313);
        float _2317 = _2309 * _2311;
        float _2319 = 1.0 / _2317;
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2321;
        float _2325 = 1.0 / _2323;
        float _2327 = _2315 * _2319;
        float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2331 = fma(_1537, _2327, _2329);
        float _2333 = _2331 * _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        _2126 = _2325;
        _2283 = _2335;
        _2096 = _2319;
    }
    float _2337 = _2126;
    float _2339 = _2283;
    float _2341 = _2096;
    float _2343 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2345 = -_2172;
    float _2347 = _2345 + 1.0;
    float _2349 = -_2217;
    float _2351 = _2349 + 1.0;
    float _2353 = _2337;
    float _2355 = _2341;
    if (!_2066)
    {
        _2353 = 1.0;
    }
    float _2357 = _2353;
    float _2359 = _2347 * _2343;
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = _2357;
    if (_2066)
    {
        bool _2365 = _2184 >= _2144;
        bool _2367 = isnan(_2184);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan(_2144);
        bool _2373 = _2369 || _2371;
        float _2375 = float(_2373);
        _2363 = _2375;
    }
    float _2377 = _2363;
    float _2379 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1700)
    {
        _2285 = 1.0;
    }
    float _2381 = _2285;
    float _2383 = _2381;
    if (!_1700)
    {
        int _2385 = _1736 << 4;
        int _2387 = _2385 + 2048;
        uint _2389 = uint(int(uint(_2387) >> uint(2)));
        uint _2391 = uint(int(uint(int(_2389)) >> uint(2)));
        int _2393 = int(_2389) & 3;
        float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
        int _2397 = int(_2389) + 1;
        uint _2399 = uint(int(uint(_2397) >> uint(2)));
        int _2401 = _2397 & 3;
        float _2403 = (*spvDescriptorSet0.vp_c15)._m0[int(_2399)][_2401];
        int _2405 = _2387 + 8;
        uint _2407 = uint(int(uint(_2405) >> uint(2)));
        uint _2409 = uint(int(uint(int(_2407)) >> uint(2)));
        int _2411 = int(_2407) & 3;
        float _2413 = (*spvDescriptorSet0.vp_c15)._m0[int(_2409)][_2411];
        int _2415 = int(_2407) + 1;
        uint _2417 = uint(int(uint(_2415) >> uint(2)));
        int _2419 = _2415 & 3;
        float _2421 = (*spvDescriptorSet0.vp_c15)._m0[int(_2417)][_2419];
        float _2423 = _1499 * _2403;
        float _2425 = fma(_641, _2395, _2423);
        float _2427 = fma(_645, _2413, _2425);
        float _2429 = _2427 + _2421;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        float _2433 = -_2431;
        float _2435 = _2433 + _2178;
        float _2437 = fma(_2435, 500.0, 1.5);
        float _2439 = exp2(_2437);
        float _2441 = 0.0 + _2439;
        float _2443 = precise::clamp(_2441, 0.0, 1.0);
        _2383 = _2443;
    }
    float _2445 = _2383;
    float _2447 = _2377 * _2445;
    float _2449 = _2379 * _2186;
    float _2451 = -_2361;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2455 = -_2379;
    float _2457 = _2455 + 1.0;
    bool _2459 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2461 = isnan(_1501);
    bool _2463 = _2459 || _2461;
    bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2467 = _2463 || _2465;
    float _2469 = _2197 * _2449;
    float _2471 = -_2447;
    float _2473 = fma(_2471, _2453, 1.0);
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = _2205 * _2449;
    float _2479 = _2197 * _2457;
    float _2481 = fma(_2201, _2469, _2191);
    float _2483 = fma(_2203, _2469, _2193);
    float _2485 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2487 = fma(_2197, _2477, _2195);
    float _2489 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_98.x = _2485;
    float _2491 = _2469;
    float _2493 = _2475;
    if (!_2467)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2495 = _2355;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2467)
    {
        _2287 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2501 = _2287;
    out.m_100.x = _2481;
    out.m_100.y = _2483;
    out.m_100.z = _2487;
    out.m_100.w = _2479;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2467)
    {
        _713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2507 = _713;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2467)
    {
        _715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2513 = _715;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2467)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2519 = _2491;
    float _2521 = _2519;
    float _2523 = _2519;
    if (!_2467)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2525 = _2493;
    bool _2527 = !_2467;
    float _2529 = _2525;
    float _2531 = _2525;
    if (!_2527)
    {
        bool _2533 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2535 = isnan(_1501);
        bool _2537 = _2533 || _2535;
        bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2541 = _2537 || _2539;
        if (!_2541)
        {
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2545 = _1501 + _2543;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2547;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2555 = 1.0 / _2549;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2573 = _2545 * _2555;
            float _2575 = precise::clamp(_2573, 0.0, 1.0);
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2505 = _2585;
            _2523 = _2589;
            _2499 = _2581;
            _2517 = _2587;
            _2511 = _2583;
            _2531 = _2591;
            _2593 = true;
        }
        else
        {
            bool _2595 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2597 = isnan(_1501);
            bool _2599 = _2595 || _2597;
            bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2603 = _2599 || _2601;
            if (!_2603)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2605 = _2497;
            _2499 = _2605;
            if (!_2603)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2607 = _2503;
            _2505 = _2607;
            if (!_2603)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2609 = _2509;
            _2511 = _2609;
            if (!_2603)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2611 = _2515;
            _2517 = _2611;
            if (!_2603)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2613 = _2521;
            _2523 = _2613;
            if (!_2603)
            {
                _2529 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2615 = _2529;
            bool _2617 = !_2603;
            _2531 = _2615;
            if (!_2617)
            {
                bool _2619 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2621 = isnan(_1501);
                bool _2623 = _2619 || _2621;
                bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2627 = _2623 || _2625;
                if (!_2627)
                {
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2631 = _1501 + _2629;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2633;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2641 = 1.0 / _2635;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2659 = _2631 * _2641;
                    float _2661 = precise::clamp(_2659, 0.0, 1.0);
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2667 = fma(_2661, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2669 = fma(_2661, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2671 = fma(_2661, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2673 = fma(_2661, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2675 = fma(_2661, _2653, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2677 = fma(_2661, _2657, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2505 = _2671;
                    _2523 = _2675;
                    _2499 = _2667;
                    _2517 = _2673;
                    _2511 = _2669;
                    _2531 = _2677;
                    _2593 = true;
                }
                else
                {
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2531 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2593 = false;
    float _2679 = _2505;
    float _2681 = _2523;
    float _2683 = _2499;
    float _2685 = _2517;
    float _2687 = _2511;
    float _2689 = _2531;
    float _2691 = _2489 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2693 = fma(_1347, -0.5, 0.5);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = -_2679;
    float _2699 = _2697 + _2681;
    float _2701 = -_2683;
    float _2703 = _2701 + _2685;
    out.m_63.x = _2691;
    float _2705 = fma(_2695, _2699, _2679);
    float _2707 = -_2687;
    float _2709 = _2707 + _2689;
    float _2711 = fma(_2695, _2703, _2683);
    float _2713 = _2705 * 0.586610972881317138671875;
    bool _2715 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2717 = fma(_2695, _2709, _2687);
    out.m_102.x = 0.0;
    float _2719 = fma(_2711, 0.298911988735198974609375, _2713);
    bool _2721 = _2339 > 0.0;
    bool _2723 = isnan(_2339);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(0.0);
    bool _2729 = _2725 || _2727;
    float _2731 = fma(_2717, 0.114477999508380889892578125, _2719);
    float _2733 = -_2731;
    float _2735 = _2711 + _2733;
    float _2737 = -_2731;
    float _2739 = _2705 + _2737;
    float _2741 = -_2731;
    float _2743 = _2717 + _2741;
    float _2745 = fma(_2735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2747 = fma(_2739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2749 = fma(_2743, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    bool _2751 = !_2715;
    if (!_2751)
    {
        float _2753 = -_1445;
        float _2755 = _2753 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2757 = -_1447;
        float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2761 = -_1449;
        float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2765 = _2755 * _2755;
        float _2767 = fma(_2759, _2759, _2765);
        float _2769 = fma(_2763, _2763, _2767);
        float _2771 = sqrt(_2769);
        float _2773 = rsqrt(_2769);
        float _2775 = -_2771;
        float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2779 = _2777 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = _2759 * _2773;
        float _2785 = _2755 * _2773;
        float _2787 = abs(_2781);
        float _2789 = log2(_2787);
        float _2791 = _2763 * _2773;
        float _2793 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2795 = _1347 * _2785;
        float _2797 = -_2785;
        float _2799 = -_2793;
        float _2801 = fma(_2797, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2799);
        float _2803 = fma(_1345, _2783, _2795);
        float _2805 = -_2791;
        float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2801);
        float _2809 = fma(_1349, _2791, _2803);
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2815 = _2807 + _2813;
        float _2817 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2819 = _2815 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2821 = precise::clamp(_2819, 0.0, 1.0);
        float _2823 = exp2(_2817);
        float _2825 = _2823 * _2821;
        float _2827 = _2811 * _2825;
        float _2829 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2831 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2833 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _2829;
        out.m_102.y = _2831;
        out.m_102.z = _2833;
    }
    out.m_104.x = _2745;
    out.m_104.y = _2747;
    out.m_104.z = _2749;
    if (_2729)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _2835 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2835;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2593 = false;
    bool _1397 = false;
    bool _569 = false;
    bool _457 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_60.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2892 = as_type<float>(_139);
        out.gl_Position.z = _2892;
    }
    if (!_127)
    {
        return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2960 = as_type<float>(_175);
        out.gl_Position.z = _2960;
    }
    if (_169)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_70.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_123);
        float _221 = 1.0 / _219;
        float _223 = _157 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _249;
    float _261 = 1.0 / _245;
    float _263 = _233 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _225 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_271, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = 1.0 / _253;
    float _277 = _229 * _259;
    bool _279 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _281 = isnan(_225);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_289;
    float _293 = _291 + 1.0;
    float _295 = _237 * _261;
    bool _297 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_225);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _311 = isnan(_225);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _307 * _293;
    bool _323 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_225);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _267 * _275;
    float _337 = -_307;
    float _339 = _337 + 1.0;
    bool _341 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_225);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _319 * _339;
    float _363 = -_319;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = fma(_355, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = _333 * _365;
    float _377 = -_333;
    float _379 = _377 + 1.0;
    float _381 = -_351;
    float _383 = _381 + 1.0;
    float _385 = fma(_369, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = _351 * _379;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = _371 * _387;
    float _399 = _273 * _387;
    float _401 = fma(_391, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = fma(_373, _375, _405);
    float _419 = fma(_385, _375, _407);
    float _421 = fma(_411, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _423 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _425 = fma(_401, _361, _417);
    float _427 = fma(_403, _361, _419);
    float _429 = fma(_421, _321, _425);
    float _431 = fma(_423, _321, _427);
    float _433 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[147].x, _429);
    float _435 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[147].y, _431);
    bool _437 = !_257;
    float _455;
    if (!_437)
    {
        float _439 = in.m_70.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        float _459 = float(_123);
        float _461 = 1.0 / _459;
        float _463 = _157 * _461;
        _455 = _463;
    }
    _457 = false;
    float _465 = _455;
    bool _467 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_465);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_465);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _465 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = 1.0 / _481;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _497 * _509;
    float _519 = fma(_517, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _519 * _511;
    float _523 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _523);
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _541 = in.m_72.x;
    float _543 = in.m_72.y;
    out.m_74.x = _533;
    out.m_74.y = _535;
    out.m_74.z = _537;
    out.m_74.w = _539;
    float _545 = _435 * _543;
    float _547 = _433 * _541;
    bool _549 = !_507;
    float _567;
    if (!_549)
    {
        float _551 = in.m_70.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _567 = _565;
        _569 = true;
    }
    else
    {
        float _571 = float(_123);
        float _573 = 1.0 / _571;
        float _575 = _157 * _573;
        _567 = _575;
    }
    _569 = false;
    float _577 = _567;
    float _579 = in.m_60.x;
    float _581 = in.m_60.y;
    float _583 = in.m_60.z;
    float _585 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _589 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = in.m_76.x;
    float _593 = in.m_76.y;
    float _595 = in.m_76.z;
    float _597 = in.m_76.w;
    float _599 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _601 = _585 * _587;
    float _603 = in.m_78.x;
    float _605 = in.m_78.y;
    float _607 = in.m_78.z;
    float _609 = in.m_78.w;
    float _611 = _589 * _599;
    float _613 = _601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _615 = _601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _617 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _619 = _601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _621 = _581 * _593;
    float _623 = _581 * _605;
    float _625 = fma(_579, _591, _621);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
    float _629 = fma(_579, _603, _623);
    float _631 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
    float _633 = fma(_583, _595, _625);
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
    float _637 = fma(_583, _607, _629);
    float _639 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _631);
    float _641 = _633 + _597;
    float _643 = _635 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _645 = _637 + _609;
    float _647 = _639 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _649 = _641 + _643;
    float _651 = _645 + _647;
    float _653 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _655 = _649 + _653;
    float _657 = in.m_80.x;
    float _659 = in.m_80.y;
    float _661 = in.m_80.z;
    float _663 = in.m_80.w;
    float _665 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _667 = _651 + _665;
    float _669 = _655 * _655;
    float _671 = _667 * _667;
    float _673 = _669 + _671;
    float _675 = sqrt(_673);
    float _677 = _581 * _659;
    float _679 = fma(_579, _657, _677);
    bool _681 = _675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _685 = _675 + _683;
    float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
    float _689 = fma(_583, _661, _679);
    float _691 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _687);
    float _693 = _689 + _663;
    float _695 = _691 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _697 = _335;
    float _699 = _619;
    float _701 = _663;
    float _703 = _695;
    float _705 = _691;
    float _707 = _685;
    float _709 = _669;
    float _711 = _671;
    float _713 = _645;
    float _715 = _641;
    if (_681)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _697 = _717;
    }
    float _719 = _697;
    float _721 = _693 + _695;
    float _723 = _721;
    if (!_681)
    {
        _699 = _649;
    }
    float _725 = _699;
    float _727 = _725;
    if (!_681)
    {
        _701 = _651;
    }
    float _729 = _701;
    float _731 = _729;
    if (_681)
    {
        float _733 = _721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _703 = _733;
    }
    float _735 = _703;
    float _737 = _735;
    if (_681)
    {
        float _739 = rsqrt(_673);
        _705 = _739;
    }
    float _741 = _705;
    float _743 = _719;
    float _745 = _741;
    if (_681)
    {
        float _747 = _685 * _719;
        _743 = _747;
    }
    float _749 = _743;
    float _751 = _749;
    if (_681)
    {
        float _753 = _749 * 0.15915493667125701904296875;
        _751 = _753;
    }
    float _755 = _751;
    float _757 = _675;
    if (_681)
    {
        float _759 = _755 * 6.283185482025146484375;
        float _761 = sin(_759);
        _757 = _761;
    }
    float _763 = _757;
    if (_681)
    {
        float _765 = fma(_763, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _737 = _765;
    }
    float _767 = _737;
    if (_681)
    {
        float _769 = _741 * _767;
        _745 = _769;
    }
    float _771 = _745;
    if (_681)
    {
        float _773 = fma(_655, _771, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _727 = _773;
    }
    float _775 = _727;
    if (_681)
    {
        float _777 = fma(_667, _771, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _731 = _777;
    }
    float _779 = _731;
    float _781 = fma(_775, 6.2500002968590706586837768554688e-05, 0.5);
    float _783 = fma(_779, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3928 = float2(_781, _783);
    float3 _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3928, float2(0.0), isnan(_3928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3928, float2(0.0), isnan(_3928)), level(0.0)).xyz;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float _795 = in.m_70.x;
    float _797 = in.m_70.y;
    float _799 = in.m_70.z;
    float _801 = in.m_70.w;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    out.m_82.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_82.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_82.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _815 = _813 != 0;
    float _817 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    bool _819 = _801 > 0.5;
    float _821 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _825 = _795 > 0.5;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _831 = -_191;
    int _833 = _825 ? as_type<int>(_831) : as_type<int>(_191);
    float _835 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _837 = 0.0;
    if (!_805)
    {
        _837 = _795;
    }
    float _839 = _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _845 = _799 > 0.5;
    float _847 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _823);
    float _849 = 0.0;
    float _851 = _839;
    if (!_805)
    {
        _849 = _799;
    }
    float _853 = _849;
    float _855 = 1.0 / _843;
    float _857 = _853;
    if (!_805)
    {
        _707 = _799;
    }
    float _859 = _707;
    float _861 = -_827;
    float _863 = fma(_821, 2.0, _861);
    float _865 = _859;
    if (_805)
    {
        _851 = _799;
    }
    float _867 = _851;
    float _869 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[79].z, _829);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _875 = _797 > 0.5;
    float _877 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _817);
    bool _879 = !_809;
    float _881 = _879 ? _191 : as_type<float>(_833);
    float _883 = 1.0 / _873;
    float _885 = -_195;
    int _887 = _875 ? as_type<int>(_885) : as_type<int>(_195);
    float _889 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[79].x, _869);
    float _891 = -_191;
    int _893 = _875 ? as_type<int>(_891) : as_type<int>(_191);
    float _895 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _897 = 0.0;
    if (!_805)
    {
        _897 = _797;
    }
    float _899 = _897;
    float _901 = _889 * (-0.15915493667125701904296875);
    float _903 = 0.0;
    float _905 = _899;
    if (!_805)
    {
        _903 = _797;
    }
    float _907 = _903;
    float _909 = -_895;
    float _911 = _909 + 1.0;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _919 = -_191;
    int _921 = _845 ? as_type<int>(_919) : as_type<int>(_191);
    float _923 = _907;
    if (_805)
    {
        _905 = _795;
    }
    float _925 = _905;
    if (_805)
    {
        _923 = _795;
    }
    float _927 = _923;
    float _929 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _933 = _931 != 0;
    float _935 = _929 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_805)
    {
        _857 = _797;
    }
    float _937 = _857;
    float _939 = _929 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_805)
    {
        _865 = _797;
    }
    float _941 = _865;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _943;
    bool _947 = !_915;
    float _949 = _947 ? _191 : as_type<float>(_921);
    float _951 = fma(_929, _929, 1.0);
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _955 = _953 != 0;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _959 = _957 != 0;
    float _961 = _929 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _967 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _935);
    float _969 = _945 * _883;
    float _971 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _973 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _939);
    float _975 = _965 * _855;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _979 = _577 + _977;
    float _981 = rsqrt(_951);
    float _983 = fma(_969, _979, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _985 = !_955;
    float _987 = _985 ? _191 : as_type<float>(_893);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _991 = _577 + _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _995 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _997 = isnan(_577);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1009 = -_195;
    int _1011 = _819 ? as_type<int>(_1009) : as_type<int>(_195);
    float _1013 = fma(_975, _991, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1015 = -_195;
    int _1017 = _845 ? as_type<int>(_1015) : as_type<int>(_195);
    float _1019 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[84].z, _993);
    bool _1021 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1023 = isnan(_577);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_1005;
    float _1035 = _1033 + 1.0;
    float _1037 = _929 * _981;
    bool _1039 = !_815;
    float _1041 = _1039 ? _195 : as_type<float>(_887);
    float _1043 = _1031 * _1035;
    bool _1045 = !_933;
    float _1047 = _1045 ? _195 : as_type<float>(_1011);
    float _1049 = -_1031;
    float _1051 = _1049 + 1.0;
    bool _1053 = !_959;
    float _1055 = _1053 ? _195 : as_type<float>(_1017);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1059 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1061 = isnan(_577);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1073 = _1037 * _1071;
    float _1075 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1079 = _1037 * _1077;
    float _1081 = _1069 * _1051;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1085 = _1037 * _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1089 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1079);
    float _1091 = _983 * _1081;
    float _1093 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1073);
    float _1095 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1085);
    float _1097 = fma(_835, -2.0, _1087);
    float _1099 = _901 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1019);
    float _1105 = -_1069;
    float _1107 = _1105 + 1.0;
    out.m_84.x = _1093;
    out.m_84.y = _1089;
    out.m_84.z = _1095;
    float _1109 = _1103 * (-0.15915493667125701904296875);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1113 = _901 * 6.283185482025146484375;
    float _1115 = cos(_1113);
    float _1117 = _925 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1119 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1091);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1123 = -_1111;
    float _1125 = fma(_1117, 2.0, _1123);
    float _1127 = _937 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1129 = fma(_1013, _1043, _1119);
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = _1041 * _1101;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1137 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1121);
    float _1139 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1097);
    float _1141 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1075);
    float _1143 = fma(_1127, -2.0, _1135);
    float _1145 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1137);
    float _1147 = _1041 * _1115;
    float _1149 = _1109 * 6.283185482025146484375;
    float _1151 = cos(_1149);
    float _1153 = -_1133;
    float _1155 = fma(_881, _1115, _1153);
    float _1157 = -_157;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[76].x, _863);
    float _1161 = -_157;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    float _1165 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1143);
    float _1167 = fma(_881, _1101, _1147);
    float _1169 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1129);
    float _1171 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1173 = _1109 * 6.283185482025146484375;
    float _1175 = sin(_1173);
    float _1177 = _1155 + 0.5;
    float _1179 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1181 = _987 + 0.5;
    float _1183 = -_1055;
    float _1185 = _1183 + 0.5;
    float _1187 = fma(_1171, _1177, _1159);
    float _1189 = -_1145;
    float _1191 = _1189 + 1.0;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1195 = _1131;
    float _1197 = _1179;
    float _1199 = _1097;
    float _1201 = _971;
    int _1203 = as_type<int>(_1109);
    if (_681)
    {
        float _1205 = _755 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        _1195 = _1207;
    }
    float _1209 = _1195;
    float _1211 = _1047 * _1151;
    float _1213 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1215 = _1169 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1219 = _1167 + (-0.5);
    float _1221 = _1047 * _1175;
    float _1223 = fma(_949, _1175, _1211);
    float _1225 = -_1179;
    float _1227 = -_1139;
    float _1229 = fma(_1225, _1219, _1227);
    float _1231 = _1211;
    if (!_681)
    {
        _1197 = _721;
    }
    float _1233 = _1197;
    float _1235 = _1223 + (-0.5);
    float _1237 = _1233;
    if (_681)
    {
        float _1239 = _1209 + (-1.0);
        _1199 = _1239;
    }
    float _1241 = _1199;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1245 = -_1221;
    float _1247 = fma(_949, _1151, _1245);
    float _1249 = fma(_1167, _911, _1229);
    if (_681)
    {
        float _1251 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1251;
    }
    float _1253 = _1231;
    float _1255 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1259 = _1255;
    if (_681)
    {
        float _1261 = fma(_721, _1209, _1253);
        _1237 = _1261;
    }
    float _1263 = _1237;
    if (_681)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1267 = _775 + _1265;
        _723 = _1267;
    }
    float _1269 = _723;
    float _1271 = -_1255;
    float _1273 = -_1165;
    float _1275 = fma(_1271, _1235, _1273);
    int _1277 = as_type<int>(_1275);
    if (_681)
    {
        float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1281 = _779 + _1279;
        _1259 = _1281;
    }
    float _1283 = _1259;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1287 = _1263 + _1285;
    if (_681)
    {
        float _1289 = _1269 * _1269;
        _709 = _1289;
    }
    float _1291 = _709;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_681)
    {
        float _1297 = _1283 * _1283;
        _711 = _1297;
    }
    float _1299 = _711;
    float _1301 = fma(_1287, _1287, _1291);
    float _1303 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1305 = _1247 + 0.5;
    float _1307 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1301 + _1299;
    float _1311 = -_877;
    float _1313 = _1311 + 1.0;
    float _1315 = fma(_1303, _1305, _1163);
    float _1317 = _1193 * _1257;
    float _1319 = -_1141;
    float _1321 = _1319 + 1.0;
    float _1323 = sqrt(_1309);
    float _1325 = -_1313;
    float _1327 = fma(_1155, _1325, _1187);
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1331 = fma(_1223, _1191, _1275);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1335 = -_1321;
    float _1337 = fma(_1247, _1335, _1315);
    float _1339 = _1213 * _1295;
    float _1341 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1345 = _967 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1347 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1349 = _973 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_86.x = _1317;
    out.m_86.y = _1339;
    out.m_88.x = _1307;
    out.m_88.y = _1341;
    out.m_88.z = _1343;
    out.m_88.w = _1215;
    bool _1351 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1353 = isnan(_1323);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1359 = _1355 || _1357;
    out.m_90.x = _1327;
    out.m_90.y = _1249;
    out.m_90.z = _1337;
    out.m_90.w = _1331;
    out.m_92.x = _1345;
    out.m_92.y = _1347;
    out.m_92.z = _1349;
    float _1361 = _1295;
    if (!_1359)
    {
        _1201 = 1.0;
    }
    float _1363 = _1201;
    out.m_94.x = _789;
    out.m_94.y = _791;
    out.m_94.z = _793;
    bool _1365 = !_1359;
    float _1367 = _1363;
    if (!_1365)
    {
        bool _1369 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1371 = isnan(_1323);
        bool _1373 = _1369 || _1371;
        bool _1375 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1377 = _1373 || _1375;
        if (!_1377)
        {
            float _1379 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1381 = _1323 + _1379;
            float _1383 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1385 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1383;
            float _1387 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1389 = _1387 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1391 = 1.0 / _1385;
            float _1393 = _1381 * _1391;
            float _1395 = fma(_1393, _1389, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1367 = _1395;
            _1397 = true;
        }
        else
        {
            bool _1399 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1401 = isnan(_1323);
            bool _1403 = _1399 || _1401;
            bool _1405 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1407 = _1403 || _1405;
            if (!_1407)
            {
                float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1411 = _1323 + _1409;
                float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1415 = _1413 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1419 = _1417 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1421 = 1.0 / _1415;
                float _1423 = _1411 * _1421;
                float _1425 = fma(_1423, _1419, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1367 = _1425;
                _1397 = true;
            }
            else
            {
                _1367 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1397 = false;
    float _1427 = _1367;
    float _1429 = _693 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1433 = _1263 + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1437 = _775 + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1441 = _779 + _1439;
    float _1443 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1429);
    float _1445 = fma(_1433, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1447 = fma(_1437, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1449 = fma(_1441, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1451 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1443);
    float _1453 = _693 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1457 = _1445 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1461 = _1447 + _1459;
    float _1463 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1465 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1453);
    float _1467 = _1457 * _1457;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1449 + _1469;
    float _1473 = 1.0 / _1463;
    float _1475 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1465);
    float _1477 = fma(_1461, _1461, _1467);
    float _1479 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1481 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1483 = fma(_1471, _1471, _1477);
    float _1485 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1479);
    float _1487 = _1481 + _1463;
    float _1489 = rsqrt(_1483);
    float _1491 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1493 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1495 = _1487 * _1473;
    float _1497 = _1495 * 0.5;
    float _1499 = _693 + _1491;
    float _1501 = sqrt(_1483);
    float _1503 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1493);
    float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1505);
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1511 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1513 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1509);
    float _1515 = 1.0 / _1507;
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1519 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1513);
    float _1521 = _1461 * _1517;
    float _1523 = _1471 * _1517;
    float _1525 = _1519 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1527 = floor(_1511);
    float _1529 = _1521 * _1521;
    float _1531 = _1523 * _1523;
    float _1533 = _1529 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1537 = _1515 * _1535;
    float _1539 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1541 = sqrt(_1533);
    bool _1543 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1545 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1539);
    bool _1547 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1549 = -_1527;
    float _1551 = _1511 + _1549;
    float _1553 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1545);
    float _1555 = trunc(_1525);
    int _1557 = int(_1555);
    float _1559 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1561 = !_1543;
    int _1563 = _1561 ? 0 : 1;
    int _1565 = 2;
    float _1567 = _1457;
    float _1569 = _1521;
    float _1571 = _1523;
    float _1573 = _1531;
    float _1575 = _1503;
    if (!_1543)
    {
        _1565 = 1;
    }
    int _1577 = _1565;
    float _1579 = trunc(_1559);
    int _1581 = int(_1579);
    bool _1583 = _1541 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1541 + _1585;
    int _1589 = _1577;
    float _1591 = _1587;
    if (!_1547)
    {
        _1589 = _1563;
    }
    int _1593 = _1589;
    int _1595 = _1593 << 6;
    int _1597 = _1595 + 96;
    uint _1600 = uint(int(uint(_1597) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    float _1616 = _1249;
    float _1618 = as_type<float>(_1593);
    if (_1583)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1620;
    }
    float _1622 = _1616;
    int _1624 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1626 = _1581 + _1624;
    int _1628 = _1626 + 1;
    float _1630 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1632 = _1595 + 104;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    bool _1650 = _1628 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1652 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1630);
    float _1654 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1652);
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1658 = _1654;
    int _1660 = _1628;
    if (_1583)
    {
        float _1662 = _1587 * _1622;
        _1591 = _1662;
    }
    float _1664 = _1591;
    int _1666 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1668 = _1557 + _1666;
    int _1670 = _1668 + 1;
    if (_1583)
    {
        float _1672 = rsqrt(_1533);
        _1658 = _1672;
    }
    float _1674 = _1658;
    float _1676 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (_1583)
    {
        float _1678 = _1664 * 0.15915493667125701904296875;
        _1361 = _1678;
    }
    float _1680 = _1361;
    int _1682 = _1628 | _1670;
    bool _1684 = _1682 < 0;
    bool _1686 = _1684 || _1650;
    float _1688 = _1337;
    if (_1583)
    {
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        _1688 = _1692;
    }
    float _1694 = _1688;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1698 = _1670 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1700 = _1698 || _1686;
    float _1702 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1704 = precise::max(0.0, _1696);
    float _1706 = _1341;
    if (_1583)
    {
        float _1708 = _1680 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        _1706 = _1710;
    }
    float _1712 = _1706;
    float _1714 = -_1676;
    float _1716 = fma(_1714, _1702, 1.0);
    float _1718 = -_1517;
    float _1720 = -_1704;
    float _1722 = fma(_1457, _1718, _1720);
    float _1724 = _1722;
    if (_1583)
    {
        float _1726 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1567 = _1726;
    }
    float _1728 = _1567;
    float _1730 = _1728;
    if (!_1700)
    {
        int _1732 = _1670 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1734 = _1732 + _1628;
        _1660 = _1734;
    }
    int _1736 = _1660;
    float _1738 = log2(_1716);
    float _1740 = _1499 * _1614;
    float _1742 = _1614;
    if (_1583)
    {
        float _1744 = _1694 + (-1.0);
        _1742 = _1744;
    }
    float _1746 = _1742;
    int _1748 = _1595 + 48;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    float _1766 = _1746;
    if (!_1700)
    {
        int _1768 = _1736 << 2;
        _1203 = _1768;
    }
    int _1770 = _1203;
    float _1772 = fma(_641, _1606, _1740);
    int _1774 = _1770;
    if (_1583)
    {
        float _1776 = fma(_1712, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1776;
    }
    float _1778 = _1730;
    float _1780 = _1778;
    if (_1583)
    {
        float _1782 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1766 = _1782;
    }
    float _1784 = _1766;
    float _1786 = _1784;
    if (!_1700)
    {
        uint _1788 = uint(int(uint(_1736) >> uint(2)));
        _1277 = int(_1788);
    }
    int _1790 = _1277;
    float _1792 = fma(_645, _1640, _1772);
    if (_1583)
    {
        float _1794 = _1674 * _1778;
        _1780 = _1794;
    }
    float _1796 = _1780;
    if (_1583)
    {
        float _1798 = fma(_1722, _1694, _1784);
        _1724 = _1798;
    }
    float _1800 = _1724;
    if (!_1583)
    {
        _1786 = _1529;
    }
    float _1802 = _1786;
    int _1804 = _1595 + 64;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    uint _1808 = uint(int(uint(int(_1806)) >> uint(2)));
    int _1810 = int(_1806) & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    int _1814 = int(_1806) + 1;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    int _1818 = _1814 & 3;
    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[int(_1816)][_1818];
    float _1822 = _1802;
    if (_1583)
    {
        float _1824 = _1521 * _1796;
        _1569 = _1824;
    }
    float _1826 = _1569;
    if (_1583)
    {
        float _1828 = _1523 * _1796;
        _1571 = _1828;
    }
    float _1830 = _1571;
    float _1832 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1583)
    {
        float _1834 = _1826 * _1826;
        _1822 = _1834;
    }
    float _1836 = _1822;
    float _1838 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1840 = _1595 + 56;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c15)._m0[int(_1844)][_1846];
    int _1850 = int(_1842) + 1;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    int _1854 = _1850 & 3;
    float _1856 = (*spvDescriptorSet0.vp_c15)._m0[int(_1852)][_1854];
    float _1858 = fma(_1800, _1800, _1836);
    float _1860 = _1838;
    if (_1583)
    {
        float _1862 = _1830 * _1830;
        _1573 = _1862;
    }
    float _1864 = _1573;
    float _1866 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1832);
    float _1868 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1485);
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1858 + _1864;
    float _1878 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1866);
    int _1880 = _1595 + 72;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    uint _1884 = uint(int(uint(int(_1882)) >> uint(2)));
    int _1886 = int(_1882) & 3;
    float _1888 = (*spvDescriptorSet0.vp_c15)._m0[int(_1884)][_1886];
    int _1890 = int(_1882) + 1;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    int _1894 = _1890 & 3;
    float _1896 = (*spvDescriptorSet0.vp_c15)._m0[int(_1892)][_1894];
    float _1898 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = -_1874;
    float _1902 = _1900 + 1.0;
    float _1904 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (!_1700)
    {
        int _1906 = 12 & _1770;
        _1774 = _1906;
    }
    int _1908 = _1774;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1912 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1503);
    float _1914 = rsqrt(_1876);
    int _1916 = _1595 + 80;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
    int _1922 = int(_1918) & 3;
    float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
    int _1926 = int(_1918) + 1;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    int _1930 = _1926 & 3;
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
    float _1934 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1910);
    float _1936 = _1792 + _1648;
    if (!_1700)
    {
        int _1938 = _1790 << 4;
        int _1940 = _1938 + _1908;
        _1575 = as_type<float>(_1940);
    }
    float _1942 = _1575;
    float _1944 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1946 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1934);
    float _1948 = floor(_1838);
    int _1950 = _1595 + 88;
    uint _1952 = uint(int(uint(_1950) >> uint(2)));
    uint _1954 = uint(int(uint(int(_1952)) >> uint(2)));
    int _1956 = int(_1952) & 3;
    float _1958 = (*spvDescriptorSet0.vp_c15)._m0[int(_1954)][_1956];
    int _1960 = int(_1952) + 1;
    uint _1962 = uint(int(uint(_1960) >> uint(2)));
    int _1964 = _1960 & 3;
    float _1966 = (*spvDescriptorSet0.vp_c15)._m0[int(_1962)][_1964];
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1946);
    float _1970 = _1499 * _1764;
    float _1972 = 1.0 / _1936;
    float _1974 = _1942;
    if (!_1700)
    {
        int _1976 = as_type<int>(_1942) + 400;
        uint _1978 = uint(int(uint(_1976) >> uint(2)));
        uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
        int _1982 = int(_1978) & 3;
        float _1984 = (*spvDescriptorSet0.vp_c15)._m0[int(_1980)][_1982];
        _1974 = _1984;
    }
    float _1986 = _1974;
    float _1988 = _1914 * _1826;
    float _1990 = fma(_641, _1756, _1970);
    float _1992 = _1914 * _1800;
    float _1994 = _1914 * _1830;
    float _1996 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1998 = abs(_1902);
    float _2000 = log2(_1998);
    float _2002 = _1499 * _1820;
    float _2004 = -_1948;
    float _2006 = _1838 + _2004;
    float _2008 = fma(_641, _1812, _2002);
    float _2010 = 1.0 / _1968;
    float _2012 = fma(_645, _1848, _1990);
    float _2014 = _2012 + _1856;
    float _2016 = -_1996;
    float _2018 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2016);
    float _2020 = _1856;
    if (!_1700)
    {
        float _2022 = floor(_1525);
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = fma(_645, _1888, _2008);
    float _2028 = _2014 * _1972;
    float _2030 = -_1994;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2018);
    float _2034 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = _2026 + _1896;
    bool _2038 = _2028 >= 0.0;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = _2036 * _1972;
    float _2044 = _1499 * _1932;
    bool _2046 = _2028 <= 1.0;
    bool _2048 = _2046 && _2038;
    float _2050 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2052 = fma(_641, _1924, _2044);
    bool _2054 = _2042 >= 0.0;
    bool _2056 = _2054 && _2048;
    float _2058 = fma(_2032, 0.5, 0.5);
    float _2060 = sqrt(_2040);
    float _2062 = fma(_645, _1958, _2052);
    bool _2064 = _2042 <= 1.0;
    bool _2066 = _2064 && _2056;
    float _2068 = fma(_2058, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1700)
    {
        float _2070 = -_2024;
        float _2072 = _1525 + _2070;
        _1860 = _2072;
    }
    float _2074 = _1860;
    float _2076 = _2062 + _1966;
    float _2078 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2050);
    float _2080 = fma(_2058, _2068, -0.212114393711090087890625);
    float _2082 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2084 = exp2(_2034);
    float _2086 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2088 = fma(_2058, _2080, 1.570728778839111328125);
    float _2090 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2082);
    float _2092 = _1992 + 1.0;
    float _2094 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2096 = _2094;
    if (_2066)
    {
        float _2098 = float(_1593);
        _1618 = _2098;
    }
    float _2100 = _1618;
    float _2102 = _2060 * 0.636619746685028076171875;
    float _2104 = _2032;
    float _2106 = _2102;
    if (!_1700)
    {
        float _2108 = floor(_1559);
        _2104 = _2108;
    }
    float _2110 = _2104;
    float _2112 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2090);
    float _2114 = -_2088;
    float _2116 = fma(_2102, _2114, 1.0);
    float _2118 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2112);
    float _2120 = _1738 * 0.693147182464599609375;
    float _2122 = _2094 * _2010;
    float _2124 = _2062;
    float _2126 = _2118;
    if (!_1700)
    {
        float _2128 = rint(_1986);
        float _2130 = precise::max(_2128, 0.0);
        uint _2132 = uint(_2130);
        uint _2134 = clamp(_2132, 0u, 65535u);
        _2124 = as_type<float>(_2134);
    }
    float _2136 = _2124;
    float _2138 = -_1992;
    float _2140 = fma(_2084, _2092, _2138);
    float _2142 = _2118 * _2010;
    float _2144 = _2076 * _1972;
    float _2146 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2148 = fma(_2122, 0.5, 0.5);
    float _2150 = fma(_2142, -0.5, 0.5);
    float _2152 = fma(_2140, 0.5, 0.5);
    float _2154 = _2090;
    if (_2066)
    {
        float _2156 = rint(_2100);
        float _2158 = precise::max(_2156, 0.0);
        uint _2160 = uint(_2158);
        uint _2162 = clamp(_2160, 0u, 65535u);
        _2154 = as_type<float>(_2162);
    }
    float _2164 = _2154;
    if (!_1700)
    {
        float _2166 = -_2110;
        float _2168 = _1559 + _2166;
        _2106 = _2168;
    }
    float _2170 = _2106;
    float2 _6303 = float2(_2006, _1551);
    float _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6303, float2(0.0), isnan(_6303)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6303, float2(0.0), isnan(_6303)), level(0.0)).x;
    float _2174 = _2136;
    if (!_1700)
    {
        float3 _6318 = float3(_2170, _2074, float(as_type<int>(_2136)));
        float3 _6322 = select(_6318, float3(0.0), isnan(_6318));
        float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6322.xy, uint(rint(_6322.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6322.xy, uint(rint(_6322.z)), level(0.0)).x;
        _2174 = _2176;
    }
    float _2178 = _2174;
    float _2180 = _2042;
    if (_2066)
    {
        float3 _6337 = float3(_2028, _2042, float(as_type<int>(_2164)));
        float3 _6339 = select(_6337, float3(0.0), isnan(_6337));
        float _2182 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6339.xy, uint(rint(_6339.z)), _2144, level(0.0));
        _2180 = _2182;
    }
    float _2184 = _2180;
    float3 _6349 = float3(_2148, _2150, _2146);
    float _2186 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).x;
    float3 _6358 = float3(_2148, _2150, _2146);
    float4 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6358, float3(0.0), isnan(_6358)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6358, float3(0.0), isnan(_6358)), level(0.0)).xyzw;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = _2189.w;
    float2 _6374 = float2(_2116, _2152);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6374, float2(0.0), isnan(_6374)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6374, float2(0.0), isnan(_6374)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = abs(_1537);
    float _2209 = log2(_2207);
    float _2211 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2213 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2215 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2211);
    float _2217 = exp2(_2213);
    float _2219 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    float _2221 = _1968 * 0.5;
    float _2223 = _2094 + _1968;
    float _2225 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2227 = _2223 * 0.5;
    float _2229 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2231 = _2225 + _1968;
    float _2233 = fma(_2118, -0.5, _2221);
    out.gl_Position.x = _2094;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _2225;
    out.gl_Position.w = _1968;
    float _2235 = _2231 * 0.5;
    float _2237 = exp2(_2229);
    out.m_96.x = _2227;
    out.m_96.y = _2233;
    out.m_96.z = _2235;
    out.m_96.w = _1968;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = fma(_2241, -2.0, 3.0);
    float _2245 = _2241 * _2241;
    bool _2247 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan(0.5);
    bool _2255 = _2251 || _2253;
    float _2257 = _2245 * _2243;
    bool _2259 = _1537 <= 8000.0;
    bool _2261 = isnan(_1537);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(8000.0);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = -_2257;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2257);
    float _2277 = _2269 * _2275;
    float _2279 = _2269;
    if (_2255)
    {
        _2279 = 1.0;
    }
    float _2281 = _2279;
    float _2283 = _2281;
    float _2285 = _2184;
    float _2287 = _2178;
    if (!_2255)
    {
        float _2289 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2291 = _2289 * 0.15915493667125701904296875;
        float _2293 = _2291 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        float _2297 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2299 = _2297 * 0.15915493667125701904296875;
        float _2301 = _2291 * 6.283185482025146484375;
        float _2303 = sin(_2301);
        float _2305 = 1.0 / _2295;
        float _2307 = _2299 * 6.283185482025146484375;
        float _2309 = cos(_2307);
        float _2311 = _2303 * _2305;
        float _2313 = _2299 * 6.283185482025146484375;
        float _2315 = sin(_2313);
        float _2317 = _2309 * _2311;
        float _2319 = 1.0 / _2317;
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2321;
        float _2325 = 1.0 / _2323;
        float _2327 = _2315 * _2319;
        float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2331 = fma(_1537, _2327, _2329);
        float _2333 = _2331 * _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        _2126 = _2325;
        _2283 = _2335;
        _2096 = _2319;
    }
    float _2337 = _2126;
    float _2339 = _2283;
    float _2341 = _2096;
    float _2343 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2345 = -_2172;
    float _2347 = _2345 + 1.0;
    float _2349 = -_2217;
    float _2351 = _2349 + 1.0;
    float _2353 = _2337;
    float _2355 = _2341;
    if (!_2066)
    {
        _2353 = 1.0;
    }
    float _2357 = _2353;
    float _2359 = _2347 * _2343;
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = _2357;
    if (_2066)
    {
        bool _2365 = _2184 >= _2144;
        bool _2367 = isnan(_2184);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan(_2144);
        bool _2373 = _2369 || _2371;
        float _2375 = float(_2373);
        _2363 = _2375;
    }
    float _2377 = _2363;
    float _2379 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1700)
    {
        _2285 = 1.0;
    }
    float _2381 = _2285;
    float _2383 = _2381;
    if (!_1700)
    {
        int _2385 = _1736 << 4;
        int _2387 = _2385 + 2048;
        uint _2389 = uint(int(uint(_2387) >> uint(2)));
        uint _2391 = uint(int(uint(int(_2389)) >> uint(2)));
        int _2393 = int(_2389) & 3;
        float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
        int _2397 = int(_2389) + 1;
        uint _2399 = uint(int(uint(_2397) >> uint(2)));
        int _2401 = _2397 & 3;
        float _2403 = (*spvDescriptorSet0.vp_c15)._m0[int(_2399)][_2401];
        int _2405 = _2387 + 8;
        uint _2407 = uint(int(uint(_2405) >> uint(2)));
        uint _2409 = uint(int(uint(int(_2407)) >> uint(2)));
        int _2411 = int(_2407) & 3;
        float _2413 = (*spvDescriptorSet0.vp_c15)._m0[int(_2409)][_2411];
        int _2415 = int(_2407) + 1;
        uint _2417 = uint(int(uint(_2415) >> uint(2)));
        int _2419 = _2415 & 3;
        float _2421 = (*spvDescriptorSet0.vp_c15)._m0[int(_2417)][_2419];
        float _2423 = _1499 * _2403;
        float _2425 = fma(_641, _2395, _2423);
        float _2427 = fma(_645, _2413, _2425);
        float _2429 = _2427 + _2421;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        float _2433 = -_2431;
        float _2435 = _2433 + _2178;
        float _2437 = fma(_2435, 500.0, 1.5);
        float _2439 = exp2(_2437);
        float _2441 = 0.0 + _2439;
        float _2443 = precise::clamp(_2441, 0.0, 1.0);
        _2383 = _2443;
    }
    float _2445 = _2383;
    float _2447 = _2377 * _2445;
    float _2449 = _2379 * _2186;
    float _2451 = -_2361;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2455 = -_2379;
    float _2457 = _2455 + 1.0;
    bool _2459 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2461 = isnan(_1501);
    bool _2463 = _2459 || _2461;
    bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2467 = _2463 || _2465;
    float _2469 = _2197 * _2449;
    float _2471 = -_2447;
    float _2473 = fma(_2471, _2453, 1.0);
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = _2205 * _2449;
    float _2479 = _2197 * _2457;
    float _2481 = fma(_2201, _2469, _2191);
    float _2483 = fma(_2203, _2469, _2193);
    float _2485 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2487 = fma(_2197, _2477, _2195);
    float _2489 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_98.x = _2485;
    float _2491 = _2469;
    float _2493 = _2475;
    if (!_2467)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2495 = _2355;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2467)
    {
        _2287 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2501 = _2287;
    out.m_100.x = _2481;
    out.m_100.y = _2483;
    out.m_100.z = _2487;
    out.m_100.w = _2479;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2467)
    {
        _713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2507 = _713;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2467)
    {
        _715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2513 = _715;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2467)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2519 = _2491;
    float _2521 = _2519;
    float _2523 = _2519;
    if (!_2467)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2525 = _2493;
    bool _2527 = !_2467;
    float _2529 = _2525;
    float _2531 = _2525;
    if (!_2527)
    {
        bool _2533 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2535 = isnan(_1501);
        bool _2537 = _2533 || _2535;
        bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2541 = _2537 || _2539;
        if (!_2541)
        {
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2545 = _1501 + _2543;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2547;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2555 = 1.0 / _2549;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2573 = _2545 * _2555;
            float _2575 = precise::clamp(_2573, 0.0, 1.0);
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2505 = _2585;
            _2523 = _2589;
            _2499 = _2581;
            _2517 = _2587;
            _2511 = _2583;
            _2531 = _2591;
            _2593 = true;
        }
        else
        {
            bool _2595 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2597 = isnan(_1501);
            bool _2599 = _2595 || _2597;
            bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2603 = _2599 || _2601;
            if (!_2603)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2605 = _2497;
            _2499 = _2605;
            if (!_2603)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2607 = _2503;
            _2505 = _2607;
            if (!_2603)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2609 = _2509;
            _2511 = _2609;
            if (!_2603)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2611 = _2515;
            _2517 = _2611;
            if (!_2603)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2613 = _2521;
            _2523 = _2613;
            if (!_2603)
            {
                _2529 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2615 = _2529;
            bool _2617 = !_2603;
            _2531 = _2615;
            if (!_2617)
            {
                bool _2619 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2621 = isnan(_1501);
                bool _2623 = _2619 || _2621;
                bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2627 = _2623 || _2625;
                if (!_2627)
                {
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2631 = _1501 + _2629;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2633;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2641 = 1.0 / _2635;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2659 = _2631 * _2641;
                    float _2661 = precise::clamp(_2659, 0.0, 1.0);
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2667 = fma(_2661, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2669 = fma(_2661, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2671 = fma(_2661, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2673 = fma(_2661, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2675 = fma(_2661, _2653, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2677 = fma(_2661, _2657, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2505 = _2671;
                    _2523 = _2675;
                    _2499 = _2667;
                    _2517 = _2673;
                    _2511 = _2669;
                    _2531 = _2677;
                    _2593 = true;
                }
                else
                {
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2531 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2593 = false;
    float _2679 = _2505;
    float _2681 = _2523;
    float _2683 = _2499;
    float _2685 = _2517;
    float _2687 = _2511;
    float _2689 = _2531;
    float _2691 = _2489 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2693 = fma(_1347, -0.5, 0.5);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = -_2679;
    float _2699 = _2697 + _2681;
    float _2701 = -_2683;
    float _2703 = _2701 + _2685;
    out.m_63.x = _2691;
    float _2705 = fma(_2695, _2699, _2679);
    float _2707 = -_2687;
    float _2709 = _2707 + _2689;
    float _2711 = fma(_2695, _2703, _2683);
    float _2713 = _2705 * 0.586610972881317138671875;
    bool _2715 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2717 = fma(_2695, _2709, _2687);
    out.m_102.x = 0.0;
    float _2719 = fma(_2711, 0.298911988735198974609375, _2713);
    bool _2721 = _2339 > 0.0;
    bool _2723 = isnan(_2339);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(0.0);
    bool _2729 = _2725 || _2727;
    float _2731 = fma(_2717, 0.114477999508380889892578125, _2719);
    float _2733 = -_2731;
    float _2735 = _2711 + _2733;
    float _2737 = -_2731;
    float _2739 = _2705 + _2737;
    float _2741 = -_2731;
    float _2743 = _2717 + _2741;
    float _2745 = fma(_2735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2747 = fma(_2739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2749 = fma(_2743, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    bool _2751 = !_2715;
    if (!_2751)
    {
        float _2753 = -_1445;
        float _2755 = _2753 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2757 = -_1447;
        float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2761 = -_1449;
        float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2765 = _2755 * _2755;
        float _2767 = fma(_2759, _2759, _2765);
        float _2769 = fma(_2763, _2763, _2767);
        float _2771 = sqrt(_2769);
        float _2773 = rsqrt(_2769);
        float _2775 = -_2771;
        float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2779 = _2777 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = _2759 * _2773;
        float _2785 = _2755 * _2773;
        float _2787 = abs(_2781);
        float _2789 = log2(_2787);
        float _2791 = _2763 * _2773;
        float _2793 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2795 = _1347 * _2785;
        float _2797 = -_2785;
        float _2799 = -_2793;
        float _2801 = fma(_2797, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2799);
        float _2803 = fma(_1345, _2783, _2795);
        float _2805 = -_2791;
        float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2801);
        float _2809 = fma(_1349, _2791, _2803);
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2815 = _2807 + _2813;
        float _2817 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2819 = _2815 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2821 = precise::clamp(_2819, 0.0, 1.0);
        float _2823 = exp2(_2817);
        float _2825 = _2823 * _2821;
        float _2827 = _2811 * _2825;
        float _2829 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2831 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2833 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _2829;
        out.m_102.y = _2831;
        out.m_102.z = _2833;
    }
    out.m_104.x = _2745;
    out.m_104.y = _2747;
    out.m_104.z = _2749;
    if (_2729)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _2835 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2835;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2593 = false;
    bool _1397 = false;
    bool _569 = false;
    bool _457 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_60.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2892 = as_type<float>(_139);
        out.gl_Position.z = _2892;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2960 = as_type<float>(_175);
        out.gl_Position.z = _2960;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_70.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_123);
        float _221 = 1.0 / _219;
        float _223 = _157 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _249;
    float _261 = 1.0 / _245;
    float _263 = _233 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _225 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_271, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = 1.0 / _253;
    float _277 = _229 * _259;
    bool _279 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _281 = isnan(_225);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_289;
    float _293 = _291 + 1.0;
    float _295 = _237 * _261;
    bool _297 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_225);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _311 = isnan(_225);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _307 * _293;
    bool _323 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_225);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _267 * _275;
    float _337 = -_307;
    float _339 = _337 + 1.0;
    bool _341 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_225);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _319 * _339;
    float _363 = -_319;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _371 = fma(_355, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _373 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _375 = _333 * _365;
    float _377 = -_333;
    float _379 = _377 + 1.0;
    float _381 = -_351;
    float _383 = _381 + 1.0;
    float _385 = fma(_369, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = _351 * _379;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = _371 * _387;
    float _399 = _273 * _387;
    float _401 = fma(_391, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = fma(_373, _375, _405);
    float _419 = fma(_385, _375, _407);
    float _421 = fma(_411, _335, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _423 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _425 = fma(_401, _361, _417);
    float _427 = fma(_403, _361, _419);
    float _429 = fma(_421, _321, _425);
    float _431 = fma(_423, _321, _427);
    float _433 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[147].x, _429);
    float _435 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[147].y, _431);
    bool _437 = !_257;
    float _455;
    if (!_437)
    {
        float _439 = in.m_70.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        float _459 = float(_123);
        float _461 = 1.0 / _459;
        float _463 = _157 * _461;
        _455 = _463;
    }
    _457 = false;
    float _465 = _455;
    bool _467 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_465);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_465);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _465 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = 1.0 / _481;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _497 * _509;
    float _519 = fma(_517, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _519 * _511;
    float _523 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _523);
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _541 = in.m_72.x;
    float _543 = in.m_72.y;
    out.m_74.x = _533;
    out.m_74.y = _535;
    out.m_74.z = _537;
    out.m_74.w = _539;
    float _545 = _435 * _543;
    float _547 = _433 * _541;
    bool _549 = !_507;
    float _567;
    if (!_549)
    {
        float _551 = in.m_70.x;
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _555 = _551 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _559 = _557 * _553;
        float _561 = floor(_559);
        float _563 = -_561;
        float _565 = _559 + _563;
        _567 = _565;
        _569 = true;
    }
    else
    {
        float _571 = float(_123);
        float _573 = 1.0 / _571;
        float _575 = _157 * _573;
        _567 = _575;
    }
    _569 = false;
    float _577 = _567;
    float _579 = in.m_60.x;
    float _581 = in.m_60.y;
    float _583 = in.m_60.z;
    float _585 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _589 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = in.m_76.x;
    float _593 = in.m_76.y;
    float _595 = in.m_76.z;
    float _597 = in.m_76.w;
    float _599 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _601 = _585 * _587;
    float _603 = in.m_78.x;
    float _605 = in.m_78.y;
    float _607 = in.m_78.z;
    float _609 = in.m_78.w;
    float _611 = _589 * _599;
    float _613 = _601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _615 = _601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _617 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _619 = _601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _621 = _581 * _593;
    float _623 = _581 * _605;
    float _625 = fma(_579, _591, _621);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
    float _629 = fma(_579, _603, _623);
    float _631 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
    float _633 = fma(_583, _595, _625);
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
    float _637 = fma(_583, _607, _629);
    float _639 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _631);
    float _641 = _633 + _597;
    float _643 = _635 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _645 = _637 + _609;
    float _647 = _639 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _649 = _641 + _643;
    float _651 = _645 + _647;
    float _653 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _655 = _649 + _653;
    float _657 = in.m_80.x;
    float _659 = in.m_80.y;
    float _661 = in.m_80.z;
    float _663 = in.m_80.w;
    float _665 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _667 = _651 + _665;
    float _669 = _655 * _655;
    float _671 = _667 * _667;
    float _673 = _669 + _671;
    float _675 = sqrt(_673);
    float _677 = _581 * _659;
    float _679 = fma(_579, _657, _677);
    bool _681 = _675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _685 = _675 + _683;
    float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
    float _689 = fma(_583, _661, _679);
    float _691 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _687);
    float _693 = _689 + _663;
    float _695 = _691 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _697 = _335;
    float _699 = _619;
    float _701 = _663;
    float _703 = _695;
    float _705 = _691;
    float _707 = _685;
    float _709 = _669;
    float _711 = _671;
    float _713 = _645;
    float _715 = _641;
    if (_681)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _697 = _717;
    }
    float _719 = _697;
    float _721 = _693 + _695;
    float _723 = _721;
    if (!_681)
    {
        _699 = _649;
    }
    float _725 = _699;
    float _727 = _725;
    if (!_681)
    {
        _701 = _651;
    }
    float _729 = _701;
    float _731 = _729;
    if (_681)
    {
        float _733 = _721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _703 = _733;
    }
    float _735 = _703;
    float _737 = _735;
    if (_681)
    {
        float _739 = rsqrt(_673);
        _705 = _739;
    }
    float _741 = _705;
    float _743 = _719;
    float _745 = _741;
    if (_681)
    {
        float _747 = _685 * _719;
        _743 = _747;
    }
    float _749 = _743;
    float _751 = _749;
    if (_681)
    {
        float _753 = _749 * 0.15915493667125701904296875;
        _751 = _753;
    }
    float _755 = _751;
    float _757 = _675;
    if (_681)
    {
        float _759 = _755 * 6.283185482025146484375;
        float _761 = sin(_759);
        _757 = _761;
    }
    float _763 = _757;
    if (_681)
    {
        float _765 = fma(_763, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _737 = _765;
    }
    float _767 = _737;
    if (_681)
    {
        float _769 = _741 * _767;
        _745 = _769;
    }
    float _771 = _745;
    if (_681)
    {
        float _773 = fma(_655, _771, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _727 = _773;
    }
    float _775 = _727;
    if (_681)
    {
        float _777 = fma(_667, _771, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _731 = _777;
    }
    float _779 = _731;
    float _781 = fma(_775, 6.2500002968590706586837768554688e-05, 0.5);
    float _783 = fma(_779, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3928 = float2(_781, _783);
    float3 _787 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3928, float2(0.0), isnan(_3928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3928, float2(0.0), isnan(_3928)), level(0.0)).xyz;
    float _789 = _787.x;
    float _791 = _787.y;
    float _793 = _787.z;
    float _795 = in.m_70.x;
    float _797 = in.m_70.y;
    float _799 = in.m_70.z;
    float _801 = in.m_70.w;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    out.m_82.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_82.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_82.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _815 = _813 != 0;
    float _817 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    bool _819 = _801 > 0.5;
    float _821 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _825 = _795 > 0.5;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _831 = -_191;
    int _833 = _825 ? as_type<int>(_831) : as_type<int>(_191);
    float _835 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _837 = 0.0;
    if (!_805)
    {
        _837 = _795;
    }
    float _839 = _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _845 = _799 > 0.5;
    float _847 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _823);
    float _849 = 0.0;
    float _851 = _839;
    if (!_805)
    {
        _849 = _799;
    }
    float _853 = _849;
    float _855 = 1.0 / _843;
    float _857 = _853;
    if (!_805)
    {
        _707 = _799;
    }
    float _859 = _707;
    float _861 = -_827;
    float _863 = fma(_821, 2.0, _861);
    float _865 = _859;
    if (_805)
    {
        _851 = _799;
    }
    float _867 = _851;
    float _869 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[79].z, _829);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _875 = _797 > 0.5;
    float _877 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _817);
    bool _879 = !_809;
    float _881 = _879 ? _191 : as_type<float>(_833);
    float _883 = 1.0 / _873;
    float _885 = -_195;
    int _887 = _875 ? as_type<int>(_885) : as_type<int>(_195);
    float _889 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[79].x, _869);
    float _891 = -_191;
    int _893 = _875 ? as_type<int>(_891) : as_type<int>(_191);
    float _895 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _897 = 0.0;
    if (!_805)
    {
        _897 = _797;
    }
    float _899 = _897;
    float _901 = _889 * (-0.15915493667125701904296875);
    float _903 = 0.0;
    float _905 = _899;
    if (!_805)
    {
        _903 = _797;
    }
    float _907 = _903;
    float _909 = -_895;
    float _911 = _909 + 1.0;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _919 = -_191;
    int _921 = _845 ? as_type<int>(_919) : as_type<int>(_191);
    float _923 = _907;
    if (_805)
    {
        _905 = _795;
    }
    float _925 = _905;
    if (_805)
    {
        _923 = _795;
    }
    float _927 = _923;
    float _929 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _933 = _931 != 0;
    float _935 = _929 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_805)
    {
        _857 = _797;
    }
    float _937 = _857;
    float _939 = _929 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_805)
    {
        _865 = _797;
    }
    float _941 = _865;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _943;
    bool _947 = !_915;
    float _949 = _947 ? _191 : as_type<float>(_921);
    float _951 = fma(_929, _929, 1.0);
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _955 = _953 != 0;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _959 = _957 != 0;
    float _961 = _929 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _967 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _935);
    float _969 = _945 * _883;
    float _971 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _973 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _939);
    float _975 = _965 * _855;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _979 = _577 + _977;
    float _981 = rsqrt(_951);
    float _983 = fma(_969, _979, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _985 = !_955;
    float _987 = _985 ? _191 : as_type<float>(_893);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _991 = _577 + _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _995 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _997 = isnan(_577);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1009 = -_195;
    int _1011 = _819 ? as_type<int>(_1009) : as_type<int>(_195);
    float _1013 = fma(_975, _991, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1015 = -_195;
    int _1017 = _845 ? as_type<int>(_1015) : as_type<int>(_195);
    float _1019 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[84].z, _993);
    bool _1021 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1023 = isnan(_577);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_1005;
    float _1035 = _1033 + 1.0;
    float _1037 = _929 * _981;
    bool _1039 = !_815;
    float _1041 = _1039 ? _195 : as_type<float>(_887);
    float _1043 = _1031 * _1035;
    bool _1045 = !_933;
    float _1047 = _1045 ? _195 : as_type<float>(_1011);
    float _1049 = -_1031;
    float _1051 = _1049 + 1.0;
    bool _1053 = !_959;
    float _1055 = _1053 ? _195 : as_type<float>(_1017);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1059 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1061 = isnan(_577);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1073 = _1037 * _1071;
    float _1075 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1057);
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1079 = _1037 * _1077;
    float _1081 = _1069 * _1051;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1085 = _1037 * _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1089 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1079);
    float _1091 = _983 * _1081;
    float _1093 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1073);
    float _1095 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1085);
    float _1097 = fma(_835, -2.0, _1087);
    float _1099 = _901 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1019);
    float _1105 = -_1069;
    float _1107 = _1105 + 1.0;
    out.m_84.x = _1093;
    out.m_84.y = _1089;
    out.m_84.z = _1095;
    float _1109 = _1103 * (-0.15915493667125701904296875);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1113 = _901 * 6.283185482025146484375;
    float _1115 = cos(_1113);
    float _1117 = _925 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1119 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1091);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1123 = -_1111;
    float _1125 = fma(_1117, 2.0, _1123);
    float _1127 = _937 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1129 = fma(_1013, _1043, _1119);
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = _1041 * _1101;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1137 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1121);
    float _1139 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1097);
    float _1141 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1075);
    float _1143 = fma(_1127, -2.0, _1135);
    float _1145 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1137);
    float _1147 = _1041 * _1115;
    float _1149 = _1109 * 6.283185482025146484375;
    float _1151 = cos(_1149);
    float _1153 = -_1133;
    float _1155 = fma(_881, _1115, _1153);
    float _1157 = -_157;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[76].x, _863);
    float _1161 = -_157;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    float _1165 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1143);
    float _1167 = fma(_881, _1101, _1147);
    float _1169 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1129);
    float _1171 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1173 = _1109 * 6.283185482025146484375;
    float _1175 = sin(_1173);
    float _1177 = _1155 + 0.5;
    float _1179 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1181 = _987 + 0.5;
    float _1183 = -_1055;
    float _1185 = _1183 + 0.5;
    float _1187 = fma(_1171, _1177, _1159);
    float _1189 = -_1145;
    float _1191 = _1189 + 1.0;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1195 = _1131;
    float _1197 = _1179;
    float _1199 = _1097;
    float _1201 = _971;
    int _1203 = as_type<int>(_1109);
    if (_681)
    {
        float _1205 = _755 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        _1195 = _1207;
    }
    float _1209 = _1195;
    float _1211 = _1047 * _1151;
    float _1213 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1215 = _1169 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1219 = _1167 + (-0.5);
    float _1221 = _1047 * _1175;
    float _1223 = fma(_949, _1175, _1211);
    float _1225 = -_1179;
    float _1227 = -_1139;
    float _1229 = fma(_1225, _1219, _1227);
    float _1231 = _1211;
    if (!_681)
    {
        _1197 = _721;
    }
    float _1233 = _1197;
    float _1235 = _1223 + (-0.5);
    float _1237 = _1233;
    if (_681)
    {
        float _1239 = _1209 + (-1.0);
        _1199 = _1239;
    }
    float _1241 = _1199;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1245 = -_1221;
    float _1247 = fma(_949, _1151, _1245);
    float _1249 = fma(_1167, _911, _1229);
    if (_681)
    {
        float _1251 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1251;
    }
    float _1253 = _1231;
    float _1255 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1259 = _1255;
    if (_681)
    {
        float _1261 = fma(_721, _1209, _1253);
        _1237 = _1261;
    }
    float _1263 = _1237;
    if (_681)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1267 = _775 + _1265;
        _723 = _1267;
    }
    float _1269 = _723;
    float _1271 = -_1255;
    float _1273 = -_1165;
    float _1275 = fma(_1271, _1235, _1273);
    int _1277 = as_type<int>(_1275);
    if (_681)
    {
        float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1281 = _779 + _1279;
        _1259 = _1281;
    }
    float _1283 = _1259;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1287 = _1263 + _1285;
    if (_681)
    {
        float _1289 = _1269 * _1269;
        _709 = _1289;
    }
    float _1291 = _709;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_681)
    {
        float _1297 = _1283 * _1283;
        _711 = _1297;
    }
    float _1299 = _711;
    float _1301 = fma(_1287, _1287, _1291);
    float _1303 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1305 = _1247 + 0.5;
    float _1307 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1301 + _1299;
    float _1311 = -_877;
    float _1313 = _1311 + 1.0;
    float _1315 = fma(_1303, _1305, _1163);
    float _1317 = _1193 * _1257;
    float _1319 = -_1141;
    float _1321 = _1319 + 1.0;
    float _1323 = sqrt(_1309);
    float _1325 = -_1313;
    float _1327 = fma(_1155, _1325, _1187);
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1331 = fma(_1223, _1191, _1275);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1335 = -_1321;
    float _1337 = fma(_1247, _1335, _1315);
    float _1339 = _1213 * _1295;
    float _1341 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1345 = _967 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1347 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1349 = _973 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_86.x = _1317;
    out.m_86.y = _1339;
    out.m_88.x = _1307;
    out.m_88.y = _1341;
    out.m_88.z = _1343;
    out.m_88.w = _1215;
    bool _1351 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1353 = isnan(_1323);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1359 = _1355 || _1357;
    out.m_90.x = _1327;
    out.m_90.y = _1249;
    out.m_90.z = _1337;
    out.m_90.w = _1331;
    out.m_92.x = _1345;
    out.m_92.y = _1347;
    out.m_92.z = _1349;
    float _1361 = _1295;
    if (!_1359)
    {
        _1201 = 1.0;
    }
    float _1363 = _1201;
    out.m_94.x = _789;
    out.m_94.y = _791;
    out.m_94.z = _793;
    bool _1365 = !_1359;
    float _1367 = _1363;
    if (!_1365)
    {
        bool _1369 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1371 = isnan(_1323);
        bool _1373 = _1369 || _1371;
        bool _1375 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1377 = _1373 || _1375;
        if (!_1377)
        {
            float _1379 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1381 = _1323 + _1379;
            float _1383 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1385 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1383;
            float _1387 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1389 = _1387 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1391 = 1.0 / _1385;
            float _1393 = _1381 * _1391;
            float _1395 = fma(_1393, _1389, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1367 = _1395;
            _1397 = true;
        }
        else
        {
            bool _1399 = _1323 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1401 = isnan(_1323);
            bool _1403 = _1399 || _1401;
            bool _1405 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1407 = _1403 || _1405;
            if (!_1407)
            {
                float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1411 = _1323 + _1409;
                float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1415 = _1413 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1419 = _1417 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1421 = 1.0 / _1415;
                float _1423 = _1411 * _1421;
                float _1425 = fma(_1423, _1419, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1367 = _1425;
                _1397 = true;
            }
            else
            {
                _1367 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1397 = false;
    float _1427 = _1367;
    float _1429 = _693 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1433 = _1263 + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1437 = _775 + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1441 = _779 + _1439;
    float _1443 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1429);
    float _1445 = fma(_1433, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1447 = fma(_1437, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1449 = fma(_1441, _1427, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1451 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1443);
    float _1453 = _693 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1457 = _1445 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1461 = _1447 + _1459;
    float _1463 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1465 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1453);
    float _1467 = _1457 * _1457;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1449 + _1469;
    float _1473 = 1.0 / _1463;
    float _1475 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1465);
    float _1477 = fma(_1461, _1461, _1467);
    float _1479 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1481 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1483 = fma(_1471, _1471, _1477);
    float _1485 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1479);
    float _1487 = _1481 + _1463;
    float _1489 = rsqrt(_1483);
    float _1491 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1493 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1495 = _1487 * _1473;
    float _1497 = _1495 * 0.5;
    float _1499 = _693 + _1491;
    float _1501 = sqrt(_1483);
    float _1503 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1493);
    float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1505);
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1511 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1513 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1509);
    float _1515 = 1.0 / _1507;
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1519 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1513);
    float _1521 = _1461 * _1517;
    float _1523 = _1471 * _1517;
    float _1525 = _1519 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1527 = floor(_1511);
    float _1529 = _1521 * _1521;
    float _1531 = _1523 * _1523;
    float _1533 = _1529 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1537 = _1515 * _1535;
    float _1539 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1541 = sqrt(_1533);
    bool _1543 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1545 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1539);
    bool _1547 = _1537 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1549 = -_1527;
    float _1551 = _1511 + _1549;
    float _1553 = fma(_645, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1545);
    float _1555 = trunc(_1525);
    int _1557 = int(_1555);
    float _1559 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1561 = !_1543;
    int _1563 = _1561 ? 0 : 1;
    int _1565 = 2;
    float _1567 = _1457;
    float _1569 = _1521;
    float _1571 = _1523;
    float _1573 = _1531;
    float _1575 = _1503;
    if (!_1543)
    {
        _1565 = 1;
    }
    int _1577 = _1565;
    float _1579 = trunc(_1559);
    int _1581 = int(_1579);
    bool _1583 = _1541 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1541 + _1585;
    int _1589 = _1577;
    float _1591 = _1587;
    if (!_1547)
    {
        _1589 = _1563;
    }
    int _1593 = _1589;
    int _1595 = _1593 << 6;
    int _1597 = _1595 + 96;
    uint _1600 = uint(int(uint(_1597) >> uint(2)));
    uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
    int _1604 = int(_1600) & 3;
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[int(_1602)][_1604];
    int _1608 = int(_1600) + 1;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    int _1612 = _1608 & 3;
    float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
    float _1616 = _1249;
    float _1618 = as_type<float>(_1593);
    if (_1583)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1620;
    }
    float _1622 = _1616;
    int _1624 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1626 = _1581 + _1624;
    int _1628 = _1626 + 1;
    float _1630 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1632 = _1595 + 104;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    bool _1650 = _1628 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1652 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1630);
    float _1654 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1652);
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1658 = _1654;
    int _1660 = _1628;
    if (_1583)
    {
        float _1662 = _1587 * _1622;
        _1591 = _1662;
    }
    float _1664 = _1591;
    int _1666 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1668 = _1557 + _1666;
    int _1670 = _1668 + 1;
    if (_1583)
    {
        float _1672 = rsqrt(_1533);
        _1658 = _1672;
    }
    float _1674 = _1658;
    float _1676 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (_1583)
    {
        float _1678 = _1664 * 0.15915493667125701904296875;
        _1361 = _1678;
    }
    float _1680 = _1361;
    int _1682 = _1628 | _1670;
    bool _1684 = _1682 < 0;
    bool _1686 = _1684 || _1650;
    float _1688 = _1337;
    if (_1583)
    {
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        _1688 = _1692;
    }
    float _1694 = _1688;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1698 = _1670 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1700 = _1698 || _1686;
    float _1702 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1704 = precise::max(0.0, _1696);
    float _1706 = _1341;
    if (_1583)
    {
        float _1708 = _1680 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        _1706 = _1710;
    }
    float _1712 = _1706;
    float _1714 = -_1676;
    float _1716 = fma(_1714, _1702, 1.0);
    float _1718 = -_1517;
    float _1720 = -_1704;
    float _1722 = fma(_1457, _1718, _1720);
    float _1724 = _1722;
    if (_1583)
    {
        float _1726 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1567 = _1726;
    }
    float _1728 = _1567;
    float _1730 = _1728;
    if (!_1700)
    {
        int _1732 = _1670 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1734 = _1732 + _1628;
        _1660 = _1734;
    }
    int _1736 = _1660;
    float _1738 = log2(_1716);
    float _1740 = _1499 * _1614;
    float _1742 = _1614;
    if (_1583)
    {
        float _1744 = _1694 + (-1.0);
        _1742 = _1744;
    }
    float _1746 = _1742;
    int _1748 = _1595 + 48;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    float _1766 = _1746;
    if (!_1700)
    {
        int _1768 = _1736 << 2;
        _1203 = _1768;
    }
    int _1770 = _1203;
    float _1772 = fma(_641, _1606, _1740);
    int _1774 = _1770;
    if (_1583)
    {
        float _1776 = fma(_1712, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1776;
    }
    float _1778 = _1730;
    float _1780 = _1778;
    if (_1583)
    {
        float _1782 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1766 = _1782;
    }
    float _1784 = _1766;
    float _1786 = _1784;
    if (!_1700)
    {
        uint _1788 = uint(int(uint(_1736) >> uint(2)));
        _1277 = int(_1788);
    }
    int _1790 = _1277;
    float _1792 = fma(_645, _1640, _1772);
    if (_1583)
    {
        float _1794 = _1674 * _1778;
        _1780 = _1794;
    }
    float _1796 = _1780;
    if (_1583)
    {
        float _1798 = fma(_1722, _1694, _1784);
        _1724 = _1798;
    }
    float _1800 = _1724;
    if (!_1583)
    {
        _1786 = _1529;
    }
    float _1802 = _1786;
    int _1804 = _1595 + 64;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    uint _1808 = uint(int(uint(int(_1806)) >> uint(2)));
    int _1810 = int(_1806) & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    int _1814 = int(_1806) + 1;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    int _1818 = _1814 & 3;
    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[int(_1816)][_1818];
    float _1822 = _1802;
    if (_1583)
    {
        float _1824 = _1521 * _1796;
        _1569 = _1824;
    }
    float _1826 = _1569;
    if (_1583)
    {
        float _1828 = _1523 * _1796;
        _1571 = _1828;
    }
    float _1830 = _1571;
    float _1832 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1583)
    {
        float _1834 = _1826 * _1826;
        _1822 = _1834;
    }
    float _1836 = _1822;
    float _1838 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1840 = _1595 + 56;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c15)._m0[int(_1844)][_1846];
    int _1850 = int(_1842) + 1;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    int _1854 = _1850 & 3;
    float _1856 = (*spvDescriptorSet0.vp_c15)._m0[int(_1852)][_1854];
    float _1858 = fma(_1800, _1800, _1836);
    float _1860 = _1838;
    if (_1583)
    {
        float _1862 = _1830 * _1830;
        _1573 = _1862;
    }
    float _1864 = _1573;
    float _1866 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1832);
    float _1868 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1485);
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1858 + _1864;
    float _1878 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1866);
    int _1880 = _1595 + 72;
    uint _1882 = uint(int(uint(_1880) >> uint(2)));
    uint _1884 = uint(int(uint(int(_1882)) >> uint(2)));
    int _1886 = int(_1882) & 3;
    float _1888 = (*spvDescriptorSet0.vp_c15)._m0[int(_1884)][_1886];
    int _1890 = int(_1882) + 1;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    int _1894 = _1890 & 3;
    float _1896 = (*spvDescriptorSet0.vp_c15)._m0[int(_1892)][_1894];
    float _1898 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = -_1874;
    float _1902 = _1900 + 1.0;
    float _1904 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (!_1700)
    {
        int _1906 = 12 & _1770;
        _1774 = _1906;
    }
    int _1908 = _1774;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1912 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1503);
    float _1914 = rsqrt(_1876);
    int _1916 = _1595 + 80;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
    int _1922 = int(_1918) & 3;
    float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
    int _1926 = int(_1918) + 1;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    int _1930 = _1926 & 3;
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
    float _1934 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1910);
    float _1936 = _1792 + _1648;
    if (!_1700)
    {
        int _1938 = _1790 << 4;
        int _1940 = _1938 + _1908;
        _1575 = as_type<float>(_1940);
    }
    float _1942 = _1575;
    float _1944 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1946 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1934);
    float _1948 = floor(_1838);
    int _1950 = _1595 + 88;
    uint _1952 = uint(int(uint(_1950) >> uint(2)));
    uint _1954 = uint(int(uint(int(_1952)) >> uint(2)));
    int _1956 = int(_1952) & 3;
    float _1958 = (*spvDescriptorSet0.vp_c15)._m0[int(_1954)][_1956];
    int _1960 = int(_1952) + 1;
    uint _1962 = uint(int(uint(_1960) >> uint(2)));
    int _1964 = _1960 & 3;
    float _1966 = (*spvDescriptorSet0.vp_c15)._m0[int(_1962)][_1964];
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1946);
    float _1970 = _1499 * _1764;
    float _1972 = 1.0 / _1936;
    float _1974 = _1942;
    if (!_1700)
    {
        int _1976 = as_type<int>(_1942) + 400;
        uint _1978 = uint(int(uint(_1976) >> uint(2)));
        uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
        int _1982 = int(_1978) & 3;
        float _1984 = (*spvDescriptorSet0.vp_c15)._m0[int(_1980)][_1982];
        _1974 = _1984;
    }
    float _1986 = _1974;
    float _1988 = _1914 * _1826;
    float _1990 = fma(_641, _1756, _1970);
    float _1992 = _1914 * _1800;
    float _1994 = _1914 * _1830;
    float _1996 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1998 = abs(_1902);
    float _2000 = log2(_1998);
    float _2002 = _1499 * _1820;
    float _2004 = -_1948;
    float _2006 = _1838 + _2004;
    float _2008 = fma(_641, _1812, _2002);
    float _2010 = 1.0 / _1968;
    float _2012 = fma(_645, _1848, _1990);
    float _2014 = _2012 + _1856;
    float _2016 = -_1996;
    float _2018 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2016);
    float _2020 = _1856;
    if (!_1700)
    {
        float _2022 = floor(_1525);
        _2020 = _2022;
    }
    float _2024 = _2020;
    float _2026 = fma(_645, _1888, _2008);
    float _2028 = _2014 * _1972;
    float _2030 = -_1994;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2018);
    float _2034 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = _2026 + _1896;
    bool _2038 = _2028 >= 0.0;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = _2036 * _1972;
    float _2044 = _1499 * _1932;
    bool _2046 = _2028 <= 1.0;
    bool _2048 = _2046 && _2038;
    float _2050 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2052 = fma(_641, _1924, _2044);
    bool _2054 = _2042 >= 0.0;
    bool _2056 = _2054 && _2048;
    float _2058 = fma(_2032, 0.5, 0.5);
    float _2060 = sqrt(_2040);
    float _2062 = fma(_645, _1958, _2052);
    bool _2064 = _2042 <= 1.0;
    bool _2066 = _2064 && _2056;
    float _2068 = fma(_2058, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1700)
    {
        float _2070 = -_2024;
        float _2072 = _1525 + _2070;
        _1860 = _2072;
    }
    float _2074 = _1860;
    float _2076 = _2062 + _1966;
    float _2078 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2050);
    float _2080 = fma(_2058, _2068, -0.212114393711090087890625);
    float _2082 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2084 = exp2(_2034);
    float _2086 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2088 = fma(_2058, _2080, 1.570728778839111328125);
    float _2090 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2082);
    float _2092 = _1992 + 1.0;
    float _2094 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2086);
    float _2096 = _2094;
    if (_2066)
    {
        float _2098 = float(_1593);
        _1618 = _2098;
    }
    float _2100 = _1618;
    float _2102 = _2060 * 0.636619746685028076171875;
    float _2104 = _2032;
    float _2106 = _2102;
    if (!_1700)
    {
        float _2108 = floor(_1559);
        _2104 = _2108;
    }
    float _2110 = _2104;
    float _2112 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2090);
    float _2114 = -_2088;
    float _2116 = fma(_2102, _2114, 1.0);
    float _2118 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2112);
    float _2120 = _1738 * 0.693147182464599609375;
    float _2122 = _2094 * _2010;
    float _2124 = _2062;
    float _2126 = _2118;
    if (!_1700)
    {
        float _2128 = rint(_1986);
        float _2130 = precise::max(_2128, 0.0);
        uint _2132 = uint(_2130);
        uint _2134 = clamp(_2132, 0u, 65535u);
        _2124 = as_type<float>(_2134);
    }
    float _2136 = _2124;
    float _2138 = -_1992;
    float _2140 = fma(_2084, _2092, _2138);
    float _2142 = _2118 * _2010;
    float _2144 = _2076 * _1972;
    float _2146 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2148 = fma(_2122, 0.5, 0.5);
    float _2150 = fma(_2142, -0.5, 0.5);
    float _2152 = fma(_2140, 0.5, 0.5);
    float _2154 = _2090;
    if (_2066)
    {
        float _2156 = rint(_2100);
        float _2158 = precise::max(_2156, 0.0);
        uint _2160 = uint(_2158);
        uint _2162 = clamp(_2160, 0u, 65535u);
        _2154 = as_type<float>(_2162);
    }
    float _2164 = _2154;
    if (!_1700)
    {
        float _2166 = -_2110;
        float _2168 = _1559 + _2166;
        _2106 = _2168;
    }
    float _2170 = _2106;
    float2 _6303 = float2(_2006, _1551);
    float _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6303, float2(0.0), isnan(_6303)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6303, float2(0.0), isnan(_6303)), level(0.0)).x;
    float _2174 = _2136;
    if (!_1700)
    {
        float3 _6318 = float3(_2170, _2074, float(as_type<int>(_2136)));
        float3 _6322 = select(_6318, float3(0.0), isnan(_6318));
        float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6322.xy, uint(rint(_6322.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6322.xy, uint(rint(_6322.z)), level(0.0)).x;
        _2174 = _2176;
    }
    float _2178 = _2174;
    float _2180 = _2042;
    if (_2066)
    {
        float3 _6337 = float3(_2028, _2042, float(as_type<int>(_2164)));
        float3 _6339 = select(_6337, float3(0.0), isnan(_6337));
        float _2182 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6339.xy, uint(rint(_6339.z)), _2144, level(0.0));
        _2180 = _2182;
    }
    float _2184 = _2180;
    float3 _6349 = float3(_2148, _2150, _2146);
    float _2186 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).x;
    float3 _6358 = float3(_2148, _2150, _2146);
    float4 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6358, float3(0.0), isnan(_6358)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6358, float3(0.0), isnan(_6358)), level(0.0)).xyzw;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = _2189.w;
    float2 _6374 = float2(_2116, _2152);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6374, float2(0.0), isnan(_6374)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6374, float2(0.0), isnan(_6374)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = abs(_1537);
    float _2209 = log2(_2207);
    float _2211 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2213 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2215 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2211);
    float _2217 = exp2(_2213);
    float _2219 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    float _2221 = _1968 * 0.5;
    float _2223 = _2094 + _1968;
    float _2225 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2227 = _2223 * 0.5;
    float _2229 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2231 = _2225 + _1968;
    float _2233 = fma(_2118, -0.5, _2221);
    out.gl_Position.x = _2094;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _2225;
    out.gl_Position.w = _1968;
    float _2235 = _2231 * 0.5;
    float _2237 = exp2(_2229);
    out.m_96.x = _2227;
    out.m_96.y = _2233;
    out.m_96.z = _2235;
    out.m_96.w = _1968;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = fma(_2241, -2.0, 3.0);
    float _2245 = _2241 * _2241;
    bool _2247 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan(0.5);
    bool _2255 = _2251 || _2253;
    float _2257 = _2245 * _2243;
    bool _2259 = _1537 <= 8000.0;
    bool _2261 = isnan(_1537);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(8000.0);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = -_2257;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2257);
    float _2277 = _2269 * _2275;
    float _2279 = _2269;
    if (_2255)
    {
        _2279 = 1.0;
    }
    float _2281 = _2279;
    float _2283 = _2281;
    float _2285 = _2184;
    float _2287 = _2178;
    if (!_2255)
    {
        float _2289 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2291 = _2289 * 0.15915493667125701904296875;
        float _2293 = _2291 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        float _2297 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2299 = _2297 * 0.15915493667125701904296875;
        float _2301 = _2291 * 6.283185482025146484375;
        float _2303 = sin(_2301);
        float _2305 = 1.0 / _2295;
        float _2307 = _2299 * 6.283185482025146484375;
        float _2309 = cos(_2307);
        float _2311 = _2303 * _2305;
        float _2313 = _2299 * 6.283185482025146484375;
        float _2315 = sin(_2313);
        float _2317 = _2309 * _2311;
        float _2319 = 1.0 / _2317;
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2321;
        float _2325 = 1.0 / _2323;
        float _2327 = _2315 * _2319;
        float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2331 = fma(_1537, _2327, _2329);
        float _2333 = _2331 * _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        _2126 = _2325;
        _2283 = _2335;
        _2096 = _2319;
    }
    float _2337 = _2126;
    float _2339 = _2283;
    float _2341 = _2096;
    float _2343 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2345 = -_2172;
    float _2347 = _2345 + 1.0;
    float _2349 = -_2217;
    float _2351 = _2349 + 1.0;
    float _2353 = _2337;
    float _2355 = _2341;
    if (!_2066)
    {
        _2353 = 1.0;
    }
    float _2357 = _2353;
    float _2359 = _2347 * _2343;
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = _2357;
    if (_2066)
    {
        bool _2365 = _2184 >= _2144;
        bool _2367 = isnan(_2184);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan(_2144);
        bool _2373 = _2369 || _2371;
        float _2375 = float(_2373);
        _2363 = _2375;
    }
    float _2377 = _2363;
    float _2379 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1700)
    {
        _2285 = 1.0;
    }
    float _2381 = _2285;
    float _2383 = _2381;
    if (!_1700)
    {
        int _2385 = _1736 << 4;
        int _2387 = _2385 + 2048;
        uint _2389 = uint(int(uint(_2387) >> uint(2)));
        uint _2391 = uint(int(uint(int(_2389)) >> uint(2)));
        int _2393 = int(_2389) & 3;
        float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
        int _2397 = int(_2389) + 1;
        uint _2399 = uint(int(uint(_2397) >> uint(2)));
        int _2401 = _2397 & 3;
        float _2403 = (*spvDescriptorSet0.vp_c15)._m0[int(_2399)][_2401];
        int _2405 = _2387 + 8;
        uint _2407 = uint(int(uint(_2405) >> uint(2)));
        uint _2409 = uint(int(uint(int(_2407)) >> uint(2)));
        int _2411 = int(_2407) & 3;
        float _2413 = (*spvDescriptorSet0.vp_c15)._m0[int(_2409)][_2411];
        int _2415 = int(_2407) + 1;
        uint _2417 = uint(int(uint(_2415) >> uint(2)));
        int _2419 = _2415 & 3;
        float _2421 = (*spvDescriptorSet0.vp_c15)._m0[int(_2417)][_2419];
        float _2423 = _1499 * _2403;
        float _2425 = fma(_641, _2395, _2423);
        float _2427 = fma(_645, _2413, _2425);
        float _2429 = _2427 + _2421;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        float _2433 = -_2431;
        float _2435 = _2433 + _2178;
        float _2437 = fma(_2435, 500.0, 1.5);
        float _2439 = exp2(_2437);
        float _2441 = 0.0 + _2439;
        float _2443 = precise::clamp(_2441, 0.0, 1.0);
        _2383 = _2443;
    }
    float _2445 = _2383;
    float _2447 = _2377 * _2445;
    float _2449 = _2379 * _2186;
    float _2451 = -_2361;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2455 = -_2379;
    float _2457 = _2455 + 1.0;
    bool _2459 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2461 = isnan(_1501);
    bool _2463 = _2459 || _2461;
    bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2467 = _2463 || _2465;
    float _2469 = _2197 * _2449;
    float _2471 = -_2447;
    float _2473 = fma(_2471, _2453, 1.0);
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = _2205 * _2449;
    float _2479 = _2197 * _2457;
    float _2481 = fma(_2201, _2469, _2191);
    float _2483 = fma(_2203, _2469, _2193);
    float _2485 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2487 = fma(_2197, _2477, _2195);
    float _2489 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_98.x = _2485;
    float _2491 = _2469;
    float _2493 = _2475;
    if (!_2467)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2495 = _2355;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2467)
    {
        _2287 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2501 = _2287;
    out.m_100.x = _2481;
    out.m_100.y = _2483;
    out.m_100.z = _2487;
    out.m_100.w = _2479;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2467)
    {
        _713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2507 = _713;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2467)
    {
        _715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2513 = _715;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2467)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2519 = _2491;
    float _2521 = _2519;
    float _2523 = _2519;
    if (!_2467)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2525 = _2493;
    bool _2527 = !_2467;
    float _2529 = _2525;
    float _2531 = _2525;
    if (!_2527)
    {
        bool _2533 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2535 = isnan(_1501);
        bool _2537 = _2533 || _2535;
        bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2541 = _2537 || _2539;
        if (!_2541)
        {
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2545 = _1501 + _2543;
            float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2547;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2555 = 1.0 / _2549;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2573 = _2545 * _2555;
            float _2575 = precise::clamp(_2573, 0.0, 1.0);
            float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2505 = _2585;
            _2523 = _2589;
            _2499 = _2581;
            _2517 = _2587;
            _2511 = _2583;
            _2531 = _2591;
            _2593 = true;
        }
        else
        {
            bool _2595 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2597 = isnan(_1501);
            bool _2599 = _2595 || _2597;
            bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2603 = _2599 || _2601;
            if (!_2603)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2605 = _2497;
            _2499 = _2605;
            if (!_2603)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2607 = _2503;
            _2505 = _2607;
            if (!_2603)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2609 = _2509;
            _2511 = _2609;
            if (!_2603)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2611 = _2515;
            _2517 = _2611;
            if (!_2603)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2613 = _2521;
            _2523 = _2613;
            if (!_2603)
            {
                _2529 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2615 = _2529;
            bool _2617 = !_2603;
            _2531 = _2615;
            if (!_2617)
            {
                bool _2619 = _1501 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2621 = isnan(_1501);
                bool _2623 = _2619 || _2621;
                bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2627 = _2623 || _2625;
                if (!_2627)
                {
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2631 = _1501 + _2629;
                    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2635 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2633;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2641 = 1.0 / _2635;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2659 = _2631 * _2641;
                    float _2661 = precise::clamp(_2659, 0.0, 1.0);
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2667 = fma(_2661, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2669 = fma(_2661, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2671 = fma(_2661, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2673 = fma(_2661, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2675 = fma(_2661, _2653, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2677 = fma(_2661, _2657, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2505 = _2671;
                    _2523 = _2675;
                    _2499 = _2667;
                    _2517 = _2673;
                    _2511 = _2669;
                    _2531 = _2677;
                    _2593 = true;
                }
                else
                {
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2531 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2593 = false;
    float _2679 = _2505;
    float _2681 = _2523;
    float _2683 = _2499;
    float _2685 = _2517;
    float _2687 = _2511;
    float _2689 = _2531;
    float _2691 = _2489 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2693 = fma(_1347, -0.5, 0.5);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = -_2679;
    float _2699 = _2697 + _2681;
    float _2701 = -_2683;
    float _2703 = _2701 + _2685;
    out.m_63.x = _2691;
    float _2705 = fma(_2695, _2699, _2679);
    float _2707 = -_2687;
    float _2709 = _2707 + _2689;
    float _2711 = fma(_2695, _2703, _2683);
    float _2713 = _2705 * 0.586610972881317138671875;
    bool _2715 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2717 = fma(_2695, _2709, _2687);
    out.m_102.x = 0.0;
    float _2719 = fma(_2711, 0.298911988735198974609375, _2713);
    bool _2721 = _2339 > 0.0;
    bool _2723 = isnan(_2339);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan(0.0);
    bool _2729 = _2725 || _2727;
    float _2731 = fma(_2717, 0.114477999508380889892578125, _2719);
    float _2733 = -_2731;
    float _2735 = _2711 + _2733;
    float _2737 = -_2731;
    float _2739 = _2705 + _2737;
    float _2741 = -_2731;
    float _2743 = _2717 + _2741;
    float _2745 = fma(_2735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2747 = fma(_2739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    float _2749 = fma(_2743, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2731);
    bool _2751 = !_2715;
    if (!_2751)
    {
        float _2753 = -_1445;
        float _2755 = _2753 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2757 = -_1447;
        float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2761 = -_1449;
        float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2765 = _2755 * _2755;
        float _2767 = fma(_2759, _2759, _2765);
        float _2769 = fma(_2763, _2763, _2767);
        float _2771 = sqrt(_2769);
        float _2773 = rsqrt(_2769);
        float _2775 = -_2771;
        float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2779 = _2777 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = _2759 * _2773;
        float _2785 = _2755 * _2773;
        float _2787 = abs(_2781);
        float _2789 = log2(_2787);
        float _2791 = _2763 * _2773;
        float _2793 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2795 = _1347 * _2785;
        float _2797 = -_2785;
        float _2799 = -_2793;
        float _2801 = fma(_2797, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2799);
        float _2803 = fma(_1345, _2783, _2795);
        float _2805 = -_2791;
        float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2801);
        float _2809 = fma(_1349, _2791, _2803);
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2815 = _2807 + _2813;
        float _2817 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2819 = _2815 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2821 = precise::clamp(_2819, 0.0, 1.0);
        float _2823 = exp2(_2817);
        float _2825 = _2823 * _2821;
        float _2827 = _2811 * _2825;
        float _2829 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2831 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2833 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _2829;
        out.m_102.y = _2831;
        out.m_102.z = _2833;
    }
    out.m_104.x = _2745;
    out.m_104.y = _2747;
    out.m_104.z = _2749;
    if (_2729)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _2835 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2835;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

