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
    float4 m_78 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_96 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_72 [[attribute(3)]];
    float4 m_66 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_74 [[attribute(8)]];
    float4 m_76 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4113 = false;
    bool _969 = false;
    bool _801 = false;
    bool _581 = false;
    bool _405 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4412 = as_type<float>(_137);
        out.gl_Position.z = _4412;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_61.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_151)
    {
        float _157 = float(_121);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _155 >= _159;
    bool _163 = !_151;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_59.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _139 = as_type<int>(_171);
    }
    int _173 = _139;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4481 = as_type<float>(_173);
        out.gl_Position.z = _4481;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_66.x;
    float _179 = in.m_66.y;
    float _181 = in.m_66.z;
    float _183 = in.m_68.x;
    float _185 = in.m_68.y;
    float _187 = in.m_68.z;
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    float _195 = in.m_72.x;
    float _197 = in.m_72.y;
    float _199 = in.m_72.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = _179 * _185;
    float _213 = _179 * _191;
    float _215 = fma(_177, _183, _211);
    float _217 = _179 * _197;
    float _219 = fma(_177, _189, _213);
    float _221 = fma(_181, _187, _215);
    float _223 = fma(_177, _195, _217);
    float _225 = fma(_181, _193, _219);
    float _227 = fma(_181, _199, _223);
    bool _229 = !_203;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_207;
    float _235 = _233 ? (-0.5) : 0.5;
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_74.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_121);
        float _261 = 1.0 / _259;
        float _263 = _155 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    bool _271 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_265);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _285;
    bool _305 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_265);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _289;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = _269 * _303;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _265 + _327;
    float _331 = -_281;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = fma(_323, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _301 * _333;
    float _347 = fma(_337, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = _315 * _341;
    float _351 = _329 * _319;
    float _353 = -_315;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _347 * _349;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = _343 * _349;
    float _369 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _361);
    float _373 = fma(_365, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _377 = fma(_369, _345, _371);
    float _379 = fma(_373, _345, _375);
    float _381 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].x, _377);
    float _383 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].y, _379);
    bool _385 = !_317;
    float _403;
    if (!_385)
    {
        float _387 = in.m_74.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].x, _155);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_121);
        float _409 = 1.0 / _407;
        float _411 = _155 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_76.x;
    float _417 = in.m_76.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _413 + _419;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = 1.0 / _437;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _447 = 1.0 / _441;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _449;
    float _453 = _421 * _443;
    bool _455 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_413);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _413 + _467;
    float _471 = _383 * _417;
    bool _473 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _475 = isnan(_413);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -_465;
    float _491 = _489 + 1.0;
    float _493 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _495 = _469 * _447;
    float _497 = fma(_487, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = _483 * _491;
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _505;
    float _509 = _381 * _415;
    float _511 = _433 * _503;
    float _513 = fma(_507, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _515 = -_433;
    float _517 = _515 + 1.0;
    float _519 = _497 * _511;
    float _521 = _513 * _511;
    float _523 = _493 * _511;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].y, _519);
    float _539 = fma(_527, _495, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _541 = fma(_531, _495, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].x, _521);
    float _545 = fma(_535, _495, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _549 = fma(_539, _499, _537);
    float _551 = fma(_541, _499, _543);
    float _553 = fma(_545, _499, _547);
    float _555 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _549);
    float _557 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _551);
    float _559 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _553);
    bool _561 = !_445;
    float _579;
    if (!_561)
    {
        float _563 = in.m_74.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_121);
        float _585 = 1.0 / _583;
        float _587 = _155 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _593 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    float _603 = 1.0 / _597;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = isnan(_589);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _627 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _629 = isnan(_589);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _607;
    bool _641 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _643 = isnan(_589);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_623;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = -_651;
    float _661 = _659 + 1.0;
    float _663 = _651 * _655;
    float _665 = _601 * _603;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _589 + _667;
    float _671 = 1.0 / _611;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = _637 * _661;
    float _679 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _685 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _687 = isnan(_589);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _697;
    float _701 = _675 * _639;
    float _703 = 1.0 / _683;
    float _705 = _679 * _677;
    float _707 = -_695;
    float _709 = _707 + 1.0;
    float _711 = -_637;
    float _713 = _711 + 1.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _719 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _623 * _709;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _725 = _589 + _723;
    float _727 = _699 * _671;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _589 + _729;
    bool _733 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _735 = isnan(_589);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _747 = fma(_727, _725, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _749 = fma(_701, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _753 = _589 + _751;
    float _755 = -_743;
    float _757 = _755 + 1.0;
    float _759 = _717 * _703;
    float _761 = fma(_749, _663, _745);
    float _763 = _695 * _757;
    float _765 = fma(_759, _753, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _767 = fma(_747, _721, _761);
    float _769 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = fma(_765, _763, _767);
    float _773 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[119].x, _771);
    float _777 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_78.x = _773;
    out.m_78.y = _769;
    out.m_78.z = _719;
    out.m_78.w = _777;
    bool _779 = !_657;
    float _781 = _639;
    float _799;
    if (!_779)
    {
        float _783 = in.m_74.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _155);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_121);
        float _805 = 1.0 / _803;
        float _807 = _155 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _809 + _811;
    bool _815 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = isnan(_809);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _809 + _827;
    bool _831 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _833 = isnan(_809);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _851 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _853 = isnan(_809);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_825;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _849;
    float _869 = _861 * _865;
    float _871 = -_861;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _875;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _881 = 1.0 / _845;
    float _883 = _841 * _873;
    float _885 = -_841;
    float _887 = _885 + 1.0;
    float _889 = _829 * _867;
    float _891 = _813 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = fma(_877, _891, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _903 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _905 = fma(_899, _891, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _907 = _901 * _883;
    float _909 = _903 * _883;
    float _911 = _905 * _883;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].x, _907);
    float _927 = fma(_915, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_919, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _931 = fma(_923, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _933 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].y, _909);
    float _935 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].z, _911);
    float _937 = fma(_927, _869, _925);
    float _939 = fma(_929, _869, _933);
    float _941 = fma(_931, _869, _935);
    float _943 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].x, _937);
    float _945 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].y, _939);
    float _947 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].z, _941);
    bool _949 = !_879;
    float _967;
    if (!_949)
    {
        float _951 = in.m_74.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        float _971 = float(_121);
        float _973 = 1.0 / _971;
        float _975 = _155 * _973;
        _967 = _975;
    }
    _969 = false;
    float _977 = _967;
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _981 = int(_979);
    float _983 = float(_121);
    float _985 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _989 = _987 != 0;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _993 = int(_991);
    float _995 = float(_981);
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _999 = int(_997);
    if (_989)
    {
        float _1001 = in.m_74.x;
        _781 = _1001;
    }
    float _1003 = _781;
    float _1005 = float(uint(_993));
    float _1007 = 1.0 / _995;
    int _1009 = ~_993;
    int _1011 = _1009 + 1;
    float _1013 = _1003;
    if (!_989)
    {
        float _1015 = in.m_74.y;
        _1013 = _1015;
    }
    float _1017 = _1013;
    bool _1019 = _993 == 0;
    float _1021 = 1.0 / _1005;
    int _1023 = ~_993;
    int _1025 = _1023 + 1;
    float _1027 = float(uint(_999));
    int _1029 = ~_999;
    int _1031 = _1029 + 1;
    float _1033 = _155 * _1007;
    float _1035 = 1.0 / _983;
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = trunc(_1033);
    int _1041 = int(_1039);
    float _1043 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1045 = int(_1043);
    float _1047 = float(uint(_1041));
    float _1049 = 1.0 / _1027;
    float _1051 = as_type<float>(_1037) * _1047;
    float _1053 = float(_1045);
    float _1055 = trunc(_1051);
    float _1057 = precise::max(_1055, 0.0);
    uint _1060 = uint(_1057);
    float _1062 = 1.0 / _1053;
    float _1064 = _1051;
    if (_989)
    {
        _1064 = 1.0;
    }
    float _1066 = _1064;
    float _1068 = _1066;
    if (!_989)
    {
        _1068 = 7.345489978790283203125;
    }
    float _1070 = _1068;
    int _1072 = _1025 * int(_1060);
    int _1074 = _1072 + _1041;
    float _1076 = float(uint(_1074));
    float _1078 = in.m_74.x;
    float _1080 = in.m_74.y;
    float _1082 = in.m_74.z;
    float _1084 = in.m_74.w;
    float _1086 = _155 * _1062;
    float _1088 = as_type<float>(_1037) * _1076;
    float _1090 = trunc(_1086);
    int _1092 = int(_1090);
    float _1094 = trunc(_1088);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = float(uint(_1092));
    float _1102 = _1070 * _1078;
    float _1104 = float(_1041);
    float _1106 = floor(_1102);
    int _1108 = int(_1060) + int(_1098);
    float _1110 = float(_993);
    int _1112 = _1011 * _1108;
    int _1114 = _1112 + _1041;
    bool _1116 = _1104 >= _1110;
    bool _1118 = isnan(_1104);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(_1110);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    int _1128 = as_type<int>(_1049) + (-2);
    bool _1130 = uint(_1114) >= uint(_993);
    float _1132 = trunc(_1126);
    int _1134 = int(_1132);
    float _1136 = as_type<float>(_1128) * _1100;
    bool _1138 = !_1130;
    int _1140 = _1138 ? 0 : (-1);
    float _1142 = -_1106;
    float _1144 = _1102 + _1142;
    float _1146 = _155 * _1035;
    int _1148 = ~_1108;
    int _1150 = _1148 + _1140;
    int _1152 = _1150 + 1;
    float _1154 = _1144 * _1110;
    float _1156 = trunc(_1136);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    float _1162 = _1146 * _1110;
    int _1164 = _993 * _1152;
    int _1166 = _1164 + _1041;
    float _1168 = _1144;
    float _1170 = _1082;
    if (_989)
    {
        _1168 = 1.0;
    }
    float _1172 = _1168;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1176 = _1174 != 0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1180 = _1178 != 0;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1184 = _1182 != 0;
    int _1186 = ~_1134;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    bool _1192 = !_1019;
    int _1194 = _1192 ? _1166 : (-1);
    int _1196 = _993 + (-1);
    float _1198 = trunc(_1162);
    int _1200 = int(_1198);
    float _1202 = _1172;
    if (!_989)
    {
        _1202 = 1.2345600128173828125;
    }
    float _1204 = _1202;
    int _1206 = _1194 * _1190;
    int _1208 = _1031 * int(_1160);
    int _1210 = _1208 + _1092;
    int _1212 = _1134 * _1196;
    int _1214 = _1212 + _1206;
    float _1216 = _1017 * _1204;
    bool _1218 = !_1176;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = float(uint(_1210));
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1226 = _1224 != 0;
    float _1228 = trunc(_1154);
    int _1230 = int(_1228);
    bool _1232 = !_1180;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = as_type<float>(_1128) * _1222;
    bool _1238 = !_1226;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = abs(_1234);
    int _1244 = abs(_1240);
    float _1246 = trunc(_1236);
    float _1248 = precise::max(_1246, 0.0);
    uint _1250 = uint(_1248);
    int _1252 = abs(_1220);
    bool _1254 = !_1184;
    int _1256 = _1254 ? 0 : 1;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1260 = _1258 != 0;
    int _1262 = abs(_1256);
    int _1264 = _1214 * _1242;
    int _1266 = _1230 * _1244;
    int _1268 = _1266 + _1041;
    bool _1270 = !_1260;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = _1200 * _1252;
    int _1276 = _1274 + _1264;
    int _1278 = abs(_1272);
    int _1280 = int(_1160) + int(_1250);
    int _1282 = _1268 * _1262;
    int _1284 = _1282 + _1276;
    int _1286 = ~_999;
    int _1288 = _1286 + 1;
    float _1290 = float(_999);
    float _1292 = floor(_1216);
    float _1294 = float(_1092);
    int _1296 = _1288 * _1280;
    int _1298 = _1296 + _1092;
    bool _1300 = _999 == 0;
    int _1302 = _1230 * _1278;
    int _1304 = _1302 + _1284;
    bool _1306 = _1294 >= _1290;
    bool _1308 = isnan(_1294);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(_1290);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    bool _1318 = uint(_1298) >= uint(_999);
    float _1320 = float(uint(_1304));
    float _1322 = trunc(_1316);
    int _1324 = int(_1322);
    bool _1326 = !_1318;
    int _1328 = _1326 ? 0 : (-1);
    float _1330 = as_type<float>(_1037) * _1320;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1334 = _1332 != 0;
    float _1336 = -_1292;
    float _1338 = _1216 + _1336;
    int _1340 = ~_1280;
    int _1342 = _1340 + _1328;
    int _1344 = _1342 + 1;
    float _1346 = trunc(_1330);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    float _1352 = _1338 * _1290;
    int _1354 = ~_993;
    int _1356 = _1354 + 1;
    int _1358 = _999 * _1344;
    int _1360 = _1358 + _1092;
    float _1362 = _1146 * _1290;
    bool _1364 = !_1334;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1352);
    int _1370 = int(_1368);
    int _1372 = ~_1324;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1300;
    int _1380 = _1378 ? _1360 : (-1);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1396 = _1394 != 0;
    int _1398 = abs(_1366);
    int _1400 = _1380 * _1376;
    int _1402 = _999 + (-1);
    int _1404 = _1356 * int(_1350);
    int _1406 = _1404 + _1304;
    bool _1408 = !_1384;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = trunc(_1362);
    int _1414 = int(_1412);
    bool _1416 = !_1388;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = _1324 * _1402;
    int _1422 = _1420 + _1400;
    int _1424 = abs(_1410);
    int _1426 = _1370 * _1398;
    int _1428 = _1426 + _1092;
    bool _1430 = !_1392;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = float(uint(_1268));
    int _1436 = abs(_1418);
    float _1438 = float(uint(_1406));
    int _1440 = abs(_1432);
    float _1442 = as_type<float>(_1037) * _1434;
    int _1444 = _1422 * _1436;
    float _1446 = as_type<float>(_1037) * _1438;
    bool _1448 = !_1396;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = _1414 * _1424;
    int _1454 = _1452 + _1444;
    float _1456 = trunc(_1442);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = abs(_1450);
    float _1464 = float(uint(_1428));
    int _1466 = _1428 * _1440;
    int _1468 = _1466 + _1454;
    int _1470 = ~_993;
    int _1472 = _1470 + 1;
    int _1474 = ~_993;
    int _1476 = _1474 + 1;
    float _1478 = trunc(_1446);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    float _1484 = as_type<float>(_1128) * _1464;
    int _1486 = _1370 * _1462;
    int _1488 = _1486 + _1468;
    int _1490 = ~_999;
    int _1492 = _1490 + 1;
    float _1494 = float(uint(_1488));
    float _1496 = trunc(_1484);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = _1472 * int(_1460);
    int _1504 = _1502 + _1268;
    bool _1506 = _993 == 0;
    float _1508 = as_type<float>(_1128) * _1494;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1512 = _1510 != 0;
    float _1514 = trunc(_1508);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    int _1520 = int(_1350) + int(_1482);
    float _1522 = float(uint(_1504));
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1528 = ~_999;
    int _1530 = _1528 + 1;
    int _1532 = _1476 * _1520;
    int _1534 = _1532 + _1304;
    float _1536 = as_type<float>(_1037) * _1522;
    int _1538 = _1492 * int(_1500);
    int _1540 = _1538 + _1428;
    int _1542 = ~_999;
    int _1544 = _1542 + 1;
    bool _1546 = uint(_1534) >= uint(_993);
    float _1548 = trunc(_1536);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    float _1554 = float(uint(_1540));
    bool _1556 = !_1546;
    int _1558 = _1556 ? 0 : (-1);
    int _1560 = 0;
    if (_1512)
    {
        _1560 = 0;
    }
    int _1562 = _1560;
    float _1564 = as_type<float>(_1128) * _1554;
    int _1566 = ~_1520;
    int _1568 = _1566 + _1558;
    int _1570 = _1568 + 1;
    int _1572 = _1530 * int(_1518);
    int _1574 = _1572 + _1488;
    int _1576 = _1562;
    if (!_1512)
    {
        _1576 = 1;
    }
    int _1578 = _1576;
    int _1580 = _993 * _1570;
    int _1582 = _1580 + _1304;
    float _1584 = float(uint(_1574));
    float _1586 = trunc(_1564);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    int _1592 = int(_1460) + int(_1552);
    bool _1594 = !_1506;
    int _1596 = _1594 ? _1582 : (-1);
    float _1598 = as_type<float>(_1128) * _1584;
    int _1600 = ~_993;
    int _1602 = _1600 + 1;
    int _1604 = _1596 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1596 & 3;
    bool _1610 = _1608 != 0;
    float _1612 = trunc(_1598);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    bool _1618 = uint(_1604) > 1u;
    int _1620 = _1602 * _1592;
    int _1622 = _1620 + _1268;
    bool _1624 = _1604 != 3;
    int _1626 = _1610 ? 0 : 1;
    bool _1628 = uint(_1604) >= 2u;
    int _1630 = int(_1500) + int(_1590);
    int _1632 = _1628 ? 0 : 1;
    int _1634 = ~_1626;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    int _1640 = _1544 * _1630;
    int _1642 = _1640 + _1428;
    int _1644 = _1638;
    if (!_1618)
    {
        int _1646 = ~_1626;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    int _1652 = ~_1632;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = _1084 > 0.5;
    bool _1660 = uint(_1622) >= uint(_993);
    int _1662 = _1656;
    if (_1624)
    {
        int _1664 = ~_1632;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    int _1670 = int(_1518) + int(_1616);
    float _1672 = in.m_56.x;
    float _1674 = in.m_56.y;
    float _1676 = in.m_56.z;
    bool _1678 = !_1660;
    int _1680 = _1678 ? 0 : (-1);
    bool _1682 = uint(_1642) >= uint(_999);
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1686 = _1684 != 0;
    int _1688 = ~_999;
    int _1690 = _1688 + 1;
    bool _1692 = !_1686;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = _1078 > 0.5;
    int _1698 = _1690 * _1670;
    int _1700 = _1698 + _1488;
    float _1702 = -_231;
    int _1704 = _1696 ? as_type<int>(_1702) : as_type<int>(_231);
    int _1706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1708 = _1706 != 0;
    bool _1710 = _1080 > 0.5;
    bool _1712 = !_1682;
    int _1714 = _1712 ? 0 : (-1);
    float _1716 = _197 * _1674;
    bool _1718 = !_1708;
    float _1720 = _1718 ? _231 : as_type<float>(_1704);
    float _1722 = -_235;
    int _1724 = _1710 ? as_type<int>(_1722) : as_type<int>(_235);
    float _1726 = fma(_195, _1672, _1716);
    bool _1728 = uint(_1700) >= uint(_999);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    float _1734 = fma(_199, _1676, _1726);
    bool _1736 = _1082 > 0.5;
    bool _1738 = !_1728;
    int _1740 = _1738 ? 0 : (-1);
    bool _1742 = !_1732;
    float _1744 = _1742 ? _235 : as_type<float>(_1724);
    float _1746 = _185 * _1674;
    float _1748 = -_231;
    int _1750 = _1736 ? as_type<int>(_1748) : as_type<int>(_231);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1758 = _1756 != 0;
    float _1760 = fma(_183, _1672, _1746);
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1764 = _1762 != 0;
    float _1766 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1770 = _1768 != 0;
    float _1772 = _191 * _1674;
    float _1774 = 1.0 / _1526;
    float _1776 = fma(_189, _1672, _1772);
    float _1778 = fma(_187, _1676, _1760);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1782 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1784 = isnan(_977);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1800 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1802 = 1.0 / _1754;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1806 = _977 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1810 = _977 + _1808;
    float _1812 = -_1798;
    float _1814 = fma(_1800, 2.0, _1812);
    float _1816 = fma(_1766, -2.0, _1780);
    float _1818 = fma(_193, _1676, _1776);
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1820;
    float _1824 = 1.0 / _1796;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1826;
    float _1830 = in.m_68.w;
    float _1832 = _1822 * _1774;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1836 = _1834 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1838 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1840 = isnan(_977);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -_155;
    float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1814);
    bool _1854 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1856 = isnan(_977);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = _1836 * _1802;
    bool _1868 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1870 = isnan(_977);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = fma(_1832, _1806, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1882 = !_1770;
    float _1884 = _1882 ? _231 : as_type<float>(_1750);
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1888 = _977 + _1886;
    bool _1890 = _1578 != 1;
    float _1892 = -_1878;
    float _1894 = _1892 + 1.0;
    float _1896 = _1828 * _1824;
    float _1898 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1816);
    float _1900 = in.m_72.w;
    float _1902 = _1848 * _1894;
    float _1904 = -_1864;
    float _1906 = _1904 + 1.0;
    float _1908 = -_1848;
    float _1910 = _1908 + 1.0;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1914 = ~_1670;
    int _1916 = _1914 + _1740;
    int _1918 = _1916 + 1;
    float _1920 = _1792 * _1906;
    float _1922 = _1864 * _1910;
    float _1924 = fma(_1866, _1810, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1926 = _1778 + _1830;
    float _1928 = _1880 * _1920;
    float _1930 = fma(_1896, _1888, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1932 = _1720 + 0.5;
    float _1934 = _1744 + (-0.5);
    float _1936 = -_1792;
    float _1938 = _1936 + 1.0;
    float _1940 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1912);
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1852);
    float _1944 = -_1934;
    float _1946 = -_1898;
    float _1948 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1946);
    float _1950 = _1852;
    float _1952 = _1898;
    float _1954 = as_type<float>(_1670);
    float _1956 = _1884;
    if (!_1890)
    {
        _1950 = _1080;
    }
    float _1958 = _1950;
    int _1960 = _999 * _1918;
    int _1962 = _1960 + _1488;
    float _1964 = _1958;
    if (!_1890)
    {
        _1952 = _1080;
    }
    float _1966 = _1952;
    float _1968 = in.m_70.w;
    float _1970 = _1966;
    if (_1890)
    {
        _1964 = _1078;
    }
    float _1972 = _1964;
    float _1974 = _1884 + 0.5;
    float _1976 = _1734 + _1900;
    float _1978 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1928);
    if (_1890)
    {
        _1970 = _1078;
    }
    float _1980 = _1970;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1890)
    {
        _1954 = _1082;
    }
    float _1984 = _1954;
    float _1986 = fma(_1924, _1922, _1978);
    float _1988 = _1984;
    if (_1890)
    {
        _1988 = _1080;
    }
    float _1990 = _1988;
    float _1992 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1982);
    if (_1890)
    {
        _1170 = _1080;
    }
    float _1994 = _1170;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1998 = _1596 >> 31;
    float _2000 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2002 = !_1300;
    int _2004 = _2002 ? _1962 : (-1);
    float _2006 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1996);
    int _2008 = _1998 & 3;
    float _2010 = fma(_1930, _1902, _1986);
    int _2012 = _2004 >> 31;
    float _2014 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2016 = _1596 + _2008;
    float _2018 = _1818 + _1968;
    int _2020 = _2012 & 3;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2024 = _1926 + _2022;
    int _2026 = _2016 >> 2;
    float _2028 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1940);
    int _2030 = _2004 + _2020;
    float _2032 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2034 = _2026 << 4;
    int _2036 = _2034 + 368;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2040 = _1976 + _2038;
    int _2042 = _2030 >> 2;
    int _2044 = _2042 << 4;
    int _2046 = _2044 + 512;
    uint _2048 = uint(int(uint(_2036) >> uint(2)));
    uint _2050 = uint(int(uint(int(_2048)) >> uint(2)));
    int _2052 = int(_2048) & 3;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[int(_2050)][_2052];
    int _2056 = int(_2048) + 1;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    int _2060 = _2056 & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2066 = !_1606;
    int _2068 = _2066 ? 0 : 1;
    float _2070 = -_2064;
    float _2072 = fma(_2000, 2.0, _2070);
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2076 = uint(int(uint(_2046) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[int(_2086)][_2088];
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2094 = _2004 & 3;
    bool _2096 = _2094 != 0;
    float _2098 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2010);
    int _2100 = _2004 & 3;
    bool _2102 = _2100 != 0;
    float _2104 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2092);
    int _2106 = _2096 ? 0 : 1;
    float _2108 = fma(_2014, -2.0, _2074);
    int _2110 = _2046 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    bool _2128 = uint(_2100) > 1u;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2132 = _2018 + _2130;
    int _2134 = ~_2106;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = -_155;
    float _2142 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2072);
    bool _2144 = !_2102;
    int _2146 = _2144 ? 0 : 1;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2032);
    bool _2150 = _1604 != 3;
    int _2152 = _2036 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1992);
    float _2172 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2006);
    float _2174 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2104);
    bool _2176 = !_2150;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2148);
    int _2182 = _2138;
    if (!_2128)
    {
        int _2184 = ~_2106;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2108);
    bool _2192 = _2100 != 3;
    float _2194 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2142);
    int _2196 = abs(_2188);
    bool _2198 = uint(_2100) >= 2u;
    int _2200 = ~_1592;
    int _2202 = _2200 + _1680;
    int _2204 = _2202 + 1;
    int _2206 = abs(_1650);
    int _2208 = ~_2196;
    int _2210 = _2208 + 1;
    int _2212 = _2210 + 1;
    int _2214 = _993 * _2204;
    int _2216 = _2214 + _1268;
    int _2218 = _2198 ? 0 : 1;
    int _2220 = ~_2206;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    int _2226 = abs(_2146);
    int _2228 = abs(_2068);
    int _2230 = _2224 * as_type<int>(_2062);
    int _2232 = ~_2218;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2212 * as_type<int>(_2090);
    int _2240 = _2236;
    if (_2192)
    {
        int _2242 = ~_2218;
        int _2244 = _2242 + 1;
        _2240 = _2244;
    }
    int _2246 = _2240;
    int _2248 = abs(_2246);
    int _2250 = ~_2226;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    bool _2256 = _2100 != 3;
    int _2258 = ~_2228;
    int _2260 = _2258 + 1;
    int _2262 = _2260 + 1;
    int _2264 = _2254 * as_type<int>(_2082);
    int _2266 = _2264 + _2238;
    int _2268 = abs(_1668);
    int _2270 = ~_2248;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = _2262 * as_type<int>(_2054);
    int _2278 = _2276 + _2230;
    int _2280 = abs(_2178);
    bool _2282 = !_2256;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2274 * as_type<int>(_2118);
    int _2288 = _2286 + _2266;
    int _2290 = ~_2268;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2284);
    int _2298 = _2294 * as_type<int>(_2160);
    int _2300 = _2298 + _2278;
    bool _2302 = !_1764;
    int _2304 = _2302 ? 0 : 1;
    int _2306 = ~_1630;
    int _2308 = _2306 + _1714;
    int _2310 = _2308 + 1;
    int _2312 = ~_2280;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = abs(_1694);
    int _2320 = _999 * _2310;
    int _2322 = _2320 + _1428;
    int _2324 = abs(_2304);
    int _2326 = _2316 * as_type<int>(_2168);
    int _2328 = _2326 + _2300;
    int _2330 = ~_2296;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2318;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = ~_2324;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    int _2348 = _2334 * as_type<int>(_2126);
    int _2350 = _2348 + _2288;
    bool _2352 = !_1506;
    int _2354 = _2352 ? _2216 : (-1);
    int _2356 = _2328 * _2340;
    bool _2358 = !_1300;
    int _2360 = _2358 ? _2322 : (-1);
    int _2362 = _2350 * _2346;
    bool _2364 = _2180 >= 0.0;
    int _2366 = _2354 * _2318;
    int _2368 = _2366 + _2356;
    float _2370 = -_2170;
    float _2372 = _2370 + 1.0;
    int _2374 = _2360 * _2324;
    int _2376 = _2374 + _2362;
    float _2378 = _2024 * _2024;
    float _2380 = -_235;
    int _2382 = _1658 ? as_type<int>(_2380) : as_type<int>(_235);
    float _2384 = fma(_1744, _2372, _1948);
    float _2386 = -_2172;
    float _2388 = _2386 + 1.0;
    float _2390 = fma(_2132, _2132, _2378);
    bool _2392 = !_1758;
    float _2394 = _2392 ? _235 : as_type<float>(_2382);
    float _2396 = -_2174;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2388;
    float _2402 = fma(_1884, _2400, _2194);
    float _2404 = fma(_2040, _2040, _2390);
    if (_2364)
    {
        _1956 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2406 = _1956;
    float _2408 = _2394 + (-0.5);
    float _2410 = -_2028;
    float _2412 = _2410 + 1.0;
    float _2414 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2416 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2418 = rsqrt(_2404);
    float _2420 = -_2408;
    float _2422 = -_2190;
    float _2424 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2422);
    float _2426 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = _2098 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2430 = -_2412;
    float _2432 = fma(_1720, _2430, _1942);
    float _2434 = fma(_2394, _2398, _2424);
    float _2436 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2440 = as_type<int>(_2406);
    if (_2364)
    {
        float _2442 = _2406 * 5.0;
        _2440 = as_type<int>(_2442);
    }
    int _2444 = _2440;
    float _2446 = float(_2368);
    out.m_80.x = _2432;
    out.m_80.y = _2384;
    out.m_80.z = _2402;
    out.m_80.w = _2434;
    float _2448 = float(_2376);
    out.m_82.x = _2436;
    out.m_82.y = _2438;
    out.m_82.z = _2416;
    out.m_82.w = _2428;
    float _2450 = _2024 * _2418;
    float _2452 = _2132 * _2418;
    float _2454 = as_type<float>(_2444);
    if (_2364)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7879 = as_type<float>(_2444);
        out.gl_Position.z = _7879;
    }
    out.m_84.x = _2446;
    out.m_84.y = _2448;
    if (_2364)
    {
        out.m_59.x = 0.0;
    }
    if (_2364)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2456 = -_2450;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2460 = _2040 * _2418;
    float _2462 = -_2452;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2018);
    float _2466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2468 = _2458 + _2466;
    float _2470 = -_2460;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _2464 + _2474;
    float _2478 = _2468 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2472 + _2480;
    float _2484 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2478);
    float _2486 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2484);
    bool _2488 = _2486 >= 0.0;
    float _2490 = _2476;
    float _2492 = _2464;
    if (_2488)
    {
        _2454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2494 = _2454;
    int _2496 = as_type<int>(_2494);
    if (_2488)
    {
        out.m_59.x = 0.0;
    }
    if (_2488)
    {
        float _2498 = _2494 * 5.0;
        _2496 = as_type<int>(_2498);
    }
    int _2500 = _2496;
    if (_2488)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7979 = as_type<float>(_2500);
        out.gl_Position.z = _7979;
    }
    if (_2488)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2502 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2504 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2506 = floor(_2502);
    float _2508 = floor(_2504);
    float _2510 = -_2506;
    float _2512 = _2502 + _2510;
    float _2514 = -_2508;
    float _2516 = _2504 + _2514;
    float2 _8015 = float2(_2512, _2516);
    float _2518 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8015, float2(0.0), isnan(_8015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8015, float2(0.0), isnan(_8015)), level(0.0)).x;
    float _2520 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2522 = -_1926;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2526 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2520);
    float _2528 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _2530 = -_2018;
    float _2532 = _2530 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2534 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2526);
    float _2536 = _2524 * _2524;
    float _2538 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2528);
    float _2540 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2542 = -_1976;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = fma(_2532, _2532, _2536);
    float _2548 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2538);
    float _2550 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2552 = fma(_2544, _2544, _2546);
    float _2554 = rsqrt(_2548);
    float _2556 = -_2450;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2024);
    float _2560 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2550);
    float _2562 = -_2452;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2566 = _2558 * _2558;
    float _2568 = -_2460;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2572 = 1.0 / _2540;
    float _2574 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2576 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2560);
    float _2578 = fma(_2564, _2564, _2566);
    float _2580 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2574);
    float _2582 = _471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2584 = fma(_2570, _2570, _2578);
    float _2586 = rsqrt(_2552);
    float _2588 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2580);
    float _2590 = _231 * _2554;
    float _2592 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2594 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2596 = _2458 + _2592;
    float _2598 = rsqrt(_2576);
    float _2600 = _2594 + _2540;
    float _2602 = _2600 * _2572;
    float _2604 = _2602 * 0.5;
    float _2606 = _2532 * _2586;
    float _2608 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2610 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2608);
    float _2612 = _2544 * _2586;
    float _2614 = sqrt(_2584);
    float _2616 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2618 = _2606 * _2616;
    float _2620 = _2524 * _2586;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2624 = _2612 * _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2628 = -_2618;
    float _2630 = fma(_2612, _2626, _2628);
    float _2632 = _235 * _2598;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2636 = _2620 * _2634;
    float _2638 = 1.0 / _2610;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2642 = -_2624;
    float _2644 = fma(_2620, _2640, _2642);
    float _2646 = _2630 * _2630;
    float _2648 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2632);
    float _2652 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2654 = fma(_2644, _2644, _2646);
    float _2656 = _2418 * _2614;
    float _2658 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2660 = -_2636;
    float _2662 = fma(_2606, _2658, _2660);
    float _2664 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2652);
    float _2666 = _2656 * _2648;
    float _2668 = fma(_2662, _2662, _2654);
    float _2670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2590);
    float _2672 = _2656 * _2582;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = _2638 * _2674;
    float _2678 = rsqrt(_2668);
    float _2680 = _2670 * _2666;
    float _2682 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2684 = _2650 * _2672;
    bool _2686 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2688 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2664);
    bool _2690 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2692 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2682);
    float _2694 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2696 = _2694 * 0.5;
    bool _2698 = !_2686;
    int _2700 = _2698 ? 0 : 1;
    float _2702 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2704 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2692);
    float _2706 = trunc(_2702);
    int _2708 = int(_2706);
    float _2710 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2712 = _2644 * _2678;
    int _2714 = 2;
    int _2716 = as_type<int>(_2684);
    float _2718 = _2696;
    float _2720 = _2710;
    float _2722 = _2702;
    float _2724 = _2596;
    if (!_2686)
    {
        _2714 = 1;
    }
    int _2726 = _2714;
    float _2728 = _2662 * _2678;
    int _2730 = _2726;
    if (!_2690)
    {
        _2730 = _2700;
    }
    int _2732 = _2730;
    float _2734 = _2630 * _2678;
    float _2736 = _2620 * _2712;
    float _2738 = trunc(_2710);
    int _2740 = int(_2738);
    int _2742 = _2732 << 6;
    float _2744 = _2612 * _2734;
    float _2746 = -_2736;
    float _2748 = fma(_2606, _2734, _2746);
    int _2750 = _2742 + 96;
    uint _2752 = uint(int(uint(_2750) >> uint(2)));
    uint _2754 = uint(int(uint(int(_2752)) >> uint(2)));
    int _2756 = int(_2752) & 3;
    float _2758 = (*spvDescriptorSet0.vp_c15)._m0[int(_2754)][_2756];
    int _2760 = int(_2752) + 1;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    int _2764 = _2760 & 3;
    float _2766 = (*spvDescriptorSet0.vp_c15)._m0[int(_2762)][_2764];
    float _2768 = -_2744;
    float _2770 = fma(_2620, _2728, _2768);
    float _2772 = _2684 * _2748;
    int _2774 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2776 = _2708 + _2774;
    int _2778 = _2776 + 1;
    float _2780 = _2684 * _2770;
    float _2782 = fma(_2680, _2728, _2772);
    bool _2784 = _2778 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2786 = _2742 + 48;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    uint _2790 = uint(int(uint(int(_2788)) >> uint(2)));
    int _2792 = int(_2788) & 3;
    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[int(_2790)][_2792];
    int _2796 = int(_2788) + 1;
    uint _2798 = uint(int(uint(_2796) >> uint(2)));
    int _2800 = _2796 & 3;
    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[int(_2798)][_2800];
    float _2804 = fma(_2680, _2712, _2780);
    float _2806 = fma(_2696, _2612, _2782);
    int _2808 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2810 = _2740 + _2808;
    int _2812 = _2810 + 1;
    float _2814 = fma(_2696, _2606, _2804);
    float _2816 = _1976 + _2806;
    int _2818 = _2778 | _2812;
    int _2820 = _2742 + 56;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    uint _2824 = uint(int(uint(int(_2822)) >> uint(2)));
    int _2826 = int(_2822) & 3;
    float _2828 = (*spvDescriptorSet0.vp_c15)._m0[int(_2824)][_2826];
    int _2830 = int(_2822) + 1;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    int _2834 = _2830 & 3;
    float _2836 = (*spvDescriptorSet0.vp_c15)._m0[int(_2832)][_2834];
    float _2838 = _2018 + _2814;
    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2842 = _2816 + _2840;
    bool _2844 = _2818 < 0;
    bool _2846 = _2844 || _2784;
    float _2848 = _2606 * _2728;
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2852 = _2838 + _2850;
    float _2854 = _2842 * _2842;
    bool _2856 = _2812 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2858 = _2856 || _2846;
    int _2860 = _2742 + 64;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    uint _2864 = uint(int(uint(int(_2862)) >> uint(2)));
    int _2866 = int(_2862) & 3;
    float _2868 = (*spvDescriptorSet0.vp_c15)._m0[int(_2864)][_2866];
    int _2870 = int(_2862) + 1;
    uint _2872 = uint(int(uint(_2870) >> uint(2)));
    int _2874 = _2870 & 3;
    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[int(_2872)][_2874];
    float _2878 = -_2848;
    float _2880 = fma(_2612, _2712, _2878);
    float _2882 = fma(_2852, _2852, _2854);
    float _2884 = _2684 * _2880;
    float _2886 = sqrt(_2882);
    int _2888 = _2742 + 72;
    uint _2890 = uint(int(uint(_2888) >> uint(2)));
    uint _2892 = uint(int(uint(int(_2890)) >> uint(2)));
    int _2894 = int(_2890) & 3;
    float _2896 = (*spvDescriptorSet0.vp_c15)._m0[int(_2892)][_2894];
    int _2898 = int(_2890) + 1;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    int _2902 = _2898 & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    float _2906 = fma(_2680, _2734, _2884);
    int _2908 = as_type<int>(_2854);
    int _2910 = as_type<int>(_2884);
    float _2912 = _2838;
    float _2914 = _2816;
    float _2916 = _2882;
    float _2918 = as_type<float>(_2732);
    if (!_2858)
    {
        int _2920 = _2812 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2922 = _2920 + _2778;
        _2908 = _2922;
    }
    int _2924 = _2908;
    float _2926 = fma(_2696, _2620, _2906);
    int _2928 = _2742 + 104;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
    int _2934 = int(_2930) & 3;
    float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
    int _2938 = int(_2930) + 1;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    int _2942 = _2938 & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    if (!_2858)
    {
        int _2946 = _2924 << 2;
        _2716 = _2946;
    }
    int _2948 = _2716;
    float _2950 = _1926 + _2926;
    int _2952 = _2948;
    if (!_2858)
    {
        uint _2954 = uint(int(uint(_2924) >> uint(2)));
        _2910 = int(_2954);
    }
    int _2956 = _2910;
    float _2958 = as_type<float>(_2956);
    if (!_2858)
    {
        int _2960 = 12 & _2948;
        _2952 = _2960;
    }
    int _2962 = _2952;
    bool _2964 = _2886 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2858)
    {
        int _2966 = _2956 << 4;
        int _2968 = _2966 + _2962;
        _2958 = as_type<float>(_2968);
    }
    float _2970 = _2958;
    if (!_2964)
    {
        _2718 = _2838;
    }
    float _2972 = _2718;
    float _2974 = _2972;
    if (!_2964)
    {
        _2912 = _2950;
    }
    float _2976 = _2912;
    bool _2978 = !_2964;
    float _2980 = _2976;
    if (!_2978)
    {
        float _2982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2986 = _2886 + _2984;
        float _2988 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2990 = rsqrt(_2882);
        float _2992 = _2986 * _2982;
        float _2994 = _2992 * 0.15915493667125701904296875;
        float _2996 = _2994 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        float _3000 = _2994 * 6.283185482025146484375;
        float _3002 = sin(_3000);
        float _3004 = _2998 + (-1.0);
        float _3006 = fma(_3002, _2988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3008 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3010 = _2990 * _3006;
        float _3012 = fma(_2950, _2998, _3008);
        float _3014 = fma(_2852, _3010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3016 = fma(_2842, _3010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2980 = _3012;
        _2974 = _3014;
        _2914 = _3016;
        _2916 = _2990;
    }
    float _3018 = _2980;
    float _3020 = _2974;
    float _3022 = _2914;
    float _3024 = _2916;
    float _3026 = -_1926;
    float _3028 = _3026 + _3018;
    int _3030 = _2742 + 80;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    float _3048 = -_2018;
    float _3050 = _3048 + _3020;
    float _3052 = -_1976;
    float _3054 = _3052 + _3022;
    float _3056 = _3028 * _3028;
    float _3058 = _2596 * _2766;
    float _3060 = _3024;
    float _3062 = _3020;
    float _3064 = _3018;
    float _3066 = _3022;
    if (!_2858)
    {
        float _3068 = floor(_2702);
        _3060 = _3068;
    }
    float _3070 = _3060;
    float _3072 = _2596 * _2876;
    float _3074 = fma(_3050, _3050, _3056);
    int _3076 = _2742 + 88;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c15)._m0[int(_3088)][_3090];
    float _3094 = fma(_2464, _2758, _3058);
    float _3096 = fma(_2464, _2868, _3072);
    float _3098 = fma(_3054, _3054, _3074);
    float _3100 = fma(_2472, _2936, _3094);
    bool _3102 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3104 = isnan(0.5);
    bool _3106 = _3102 || _3104;
    bool _3108 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3110 = _3106 || _3108;
    float _3112 = sqrt(_3098);
    float _3114 = _2970;
    if (!_2858)
    {
        int _3116 = as_type<int>(_2970) + 400;
        uint _3118 = uint(int(uint(_3116) >> uint(2)));
        uint _3120 = uint(int(uint(int(_3118)) >> uint(2)));
        int _3122 = int(_3118) & 3;
        float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
        _3114 = _3124;
    }
    float _3126 = _3114;
    float _3128 = _3100 + _2944;
    float _3130 = _2596 * _2802;
    float _3132 = fma(_2472, _2896, _3096);
    float _3134 = fma(_2464, _2794, _3130);
    float _3136 = _3094;
    if (!_2858)
    {
        float _3138 = floor(_2710);
        _3136 = _3138;
    }
    float _3140 = _3136;
    float _3142 = fma(_2472, _2828, _3134);
    bool _3144 = _3112 > 0.0;
    float _3146 = 1.0 / _3128;
    bool _3148 = !_3144;
    float _3150 = _3146;
    if (!_3148)
    {
        float _3152 = _221 * _221;
        float _3154 = rsqrt(_3098);
        float _3156 = fma(_225, _225, _3152);
        float _3158 = fma(_227, _227, _3156);
        float _3160 = sqrt(_3158);
        float _3162 = _3050 * _3154;
        float _3164 = _3028 * _3154;
        float _3166 = _3054 * _3154;
        bool _3168 = _3160 > 0.0;
        bool _3170 = !_3168;
        if (!_3170)
        {
            float _3172 = rsqrt(_3158);
            float _3174 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3176 = _221 * _3172;
            float _3178 = _225 * _3172;
            float _3180 = _3164 * _3176;
            float _3182 = _227 * _3172;
            float _3184 = fma(_3162, _3178, _3180);
            float _3186 = _3174 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3188 = fma(_3166, _3182, _3184);
            float _3190 = _3188 * _3186;
            float _3192 = fma(_225, _3190, _3020);
            float _3194 = fma(_221, _3190, _3018);
            float _3196 = fma(_227, _3190, _3022);
            _3062 = _3192;
            _3064 = _3194;
            _3066 = _3196;
        }
    }
    float _3198 = _3062;
    float _3200 = _3064;
    float _3202 = _3066;
    float _3204 = -_2452;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3198);
    float _3208 = -_2450;
    float _3210 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3200);
    float _3212 = -_2460;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3202);
    float _3216 = _3142 + _2836;
    float _3218 = _3132 + _2904;
    float _3220 = _3210;
    float _3222 = _3206;
    float _3224 = _3214;
    if (!_3110)
    {
        float _3226 = _2468 * _2468;
        float _3228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3230 = -_1926;
        float _3232 = _3230 + _3200;
        float _3234 = fma(_2476, _2476, _3226);
        float _3236 = fma(_2482, _2482, _3234);
        float _3238 = 1.0 / _2656;
        float _3240 = sqrt(_3236);
        float _3242 = precise::min(_3240, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3244 = _3242 * _3228;
        float _3246 = -_1976;
        float _3248 = _3246 + _3202;
        float _3250 = _3244 * _3238;
        float _3252 = -_2018;
        float _3254 = _3252 + _3198;
        float _3256 = fma(_3232, _3250, _2458);
        float _3258 = fma(_3254, _3250, _2464);
        float _3260 = fma(_3248, _3250, _2472);
        _3220 = _3256;
        _3222 = _3258;
        _3224 = _3260;
        _2490 = _3240;
    }
    float _3262 = _3220;
    float _3264 = _3222;
    float _3266 = _3224;
    float _3268 = _2490;
    float _3270 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3272 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3274 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3276 = _3216 * _3146;
    float _3278 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3270);
    float _3280 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3272);
    float _3282 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3274);
    float _3284 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3278);
    bool _3288 = _3276 >= 0.0;
    float _3290 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3280);
    float _3292 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3282);
    float _3294 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3296 = _3218 * _3146;
    bool _3298 = _3276 <= 1.0;
    bool _3300 = _3298 && _3288;
    float _3302 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3304 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3310 = _3296 >= 0.0;
    bool _3312 = _3310 && _3300;
    float _3314 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3302);
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3320 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3322 = _3296 <= 1.0;
    bool _3324 = _3322 && _3312;
    float _3326 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3328 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3330 = -_3320;
    float _3332 = fma(_3330, _3318, 1.0);
    float _3334 = _2596 * _3046;
    float _3336 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3338 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3328);
    float _3340 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3342 = fma(_2464, _3038, _3334);
    float _3344 = log2(_3332);
    float _3346 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3336);
    float _3348 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3340);
    float _3350 = fma(_2472, _3084, _3342);
    float _3352 = _3268;
    float _3354 = _3338;
    if (_3324)
    {
        float _3356 = float(_2732);
        _2918 = _3356;
    }
    float _3358 = _2918;
    float _3360 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3346);
    float _3362 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3348);
    float _3364 = _3350 + _3092;
    float _3366 = 1.0 / _3338;
    float _3368 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3360);
    float _3370 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3362);
    if (!_2858)
    {
        float _3372 = -_3140;
        float _3374 = _2710 + _3372;
        _2720 = _3374;
    }
    float _3376 = _2720;
    if (!_2858)
    {
        float _3378 = -_3070;
        float _3380 = _2702 + _3378;
        _2722 = _3380;
    }
    float _3382 = _2722;
    float _3384 = _3364 * _3146;
    float _3386 = _2452;
    float _3388 = _3382;
    if (!_2858)
    {
        float _3390 = rint(_3126);
        float _3392 = precise::max(_3390, 0.0);
        uint _3394 = uint(_3392);
        uint _3396 = clamp(_3394, 0u, 65535u);
        _3386 = as_type<float>(_3396);
    }
    float _3398 = _3386;
    float _3400 = _3344 * 0.693147182464599609375;
    float _3402 = _3400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3404 = _3342;
    if (_3324)
    {
        float _3406 = rint(_3358);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3404 = as_type<float>(_3412);
    }
    float _3414 = _3404;
    float _3416 = _3368 * _3366;
    float _3418 = _3370 * _3366;
    float _3420 = fma(_3416, 0.5, 0.5);
    float _3422 = fma(_3418, -0.5, 0.5);
    float _3424 = _3398;
    if (!_2858)
    {
        float3 _9520 = float3(_3382, _3376, float(as_type<int>(_3398)));
        float3 _9524 = select(_9520, float3(0.0), isnan(_9520));
        float _3426 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9524.xy, uint(rint(_9524.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9524.xy, uint(rint(_9524.z)), level(0.0)).x;
        _3424 = _3426;
    }
    float _3428 = _3424;
    float _3430 = _2482;
    if (_3324)
    {
        float3 _9539 = float3(_3276, _3296, float(as_type<int>(_3414)));
        float3 _9541 = select(_9539, float3(0.0), isnan(_9539));
        float _3432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9541.xy, uint(rint(_9541.z)), _3384, level(0.0));
        _3430 = _3432;
    }
    float _3434 = _3430;
    float3 _9551 = float3(_3420, _3422, _3402);
    float _3436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9551, float3(0.0), isnan(_9551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9551, float3(0.0), isnan(_9551)), level(0.0)).x;
    float3 _9560 = float3(_3420, _3422, _3402);
    float4 _3439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9560, float3(0.0), isnan(_9560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9560, float3(0.0), isnan(_9560)), level(0.0)).xyzw;
    float _3441 = _3439.x;
    float _3443 = _3439.y;
    float _3445 = _3439.z;
    float _3447 = _3439.w;
    bool _3449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3451 = isnan(0.5);
    bool _3453 = _3449 || _3451;
    bool _3455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3457 = _3453 || _3455;
    if (_2858)
    {
        _3352 = 1.0;
    }
    float _3459 = _3352;
    float _3461 = _3459;
    if (_3457)
    {
        _3150 = 1.0;
    }
    float _3463 = _3150;
    float _3465 = _3463;
    float _3467 = _3441;
    if (!_3457)
    {
        float _3469 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3471 = _3469 * 0.15915493667125701904296875;
        float _3473 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3475 = _3471 * 6.283185482025146484375;
        float _3477 = cos(_3475);
        float _3479 = _3473 * 0.15915493667125701904296875;
        float _3481 = _3471 * 6.283185482025146484375;
        float _3483 = sin(_3481);
        float _3485 = 1.0 / _3477;
        float _3487 = _3479 * 6.283185482025146484375;
        float _3489 = cos(_3487);
        float _3491 = _3483 * _3485;
        float _3493 = _3479 * 6.283185482025146484375;
        float _3495 = sin(_3493);
        float _3497 = _3489 * _3491;
        float _3499 = 1.0 / _3497;
        float _3501 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3503 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3501;
        float _3505 = 1.0 / _3503;
        float _3507 = _3495 * _3499;
        float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3511 = fma(_2676, _3507, _3509);
        float _3513 = _3511 * _3505;
        float _3515 = precise::clamp(_3513, 0.0, 1.0);
        _3465 = _3515;
    }
    float _3517 = _3465;
    if (!_2858)
    {
        int _3519 = _2924 << 4;
        int _3521 = _3519 + 2048;
        uint _3523 = uint(int(uint(_3521) >> uint(2)));
        uint _3525 = uint(int(uint(int(_3523)) >> uint(2)));
        int _3527 = int(_3523) & 3;
        float _3529 = (*spvDescriptorSet0.vp_c15)._m0[int(_3525)][_3527];
        int _3531 = int(_3523) + 1;
        uint _3533 = uint(int(uint(_3531) >> uint(2)));
        int _3535 = _3531 & 3;
        float _3537 = (*spvDescriptorSet0.vp_c15)._m0[int(_3533)][_3535];
        int _3539 = _3521 + 8;
        uint _3541 = uint(int(uint(_3539) >> uint(2)));
        uint _3543 = uint(int(uint(int(_3541)) >> uint(2)));
        int _3545 = int(_3541) & 3;
        float _3547 = (*spvDescriptorSet0.vp_c15)._m0[int(_3543)][_3545];
        int _3549 = int(_3541) + 1;
        uint _3551 = uint(int(uint(_3549) >> uint(2)));
        int _3553 = _3549 & 3;
        float _3555 = (*spvDescriptorSet0.vp_c15)._m0[int(_3551)][_3553];
        float _3557 = _2596 * _3537;
        float _3559 = fma(_2464, _3529, _3557);
        float _3561 = fma(_2472, _3547, _3559);
        float _3563 = _3561 + _3555;
        float _3565 = precise::clamp(_3563, 0.0, 1.0);
        float _3567 = -_3565;
        float _3569 = _3567 + _3428;
        float _3571 = fma(_3569, 500.0, 1.5);
        float _3573 = exp2(_3571);
        float _3575 = 0.0 + _3573;
        float _3577 = precise::clamp(_3575, 0.0, 1.0);
        _2724 = _3557;
        _3461 = _3577;
    }
    float _3579 = _2724;
    float _3581 = _3461;
    float _3583 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3585 = _3262 + _3583;
    float _3587 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3589 = _3264 + _3587;
    float _3591 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3593 = _3266 + _3591;
    float _3595 = _3585 * _3585;
    float _3597 = fma(_3589, _3589, _3595);
    float _3599 = fma(_3593, _3593, _3597);
    float _3601 = rsqrt(_3599);
    float _3603 = sqrt(_3599);
    float _3605 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3607 = _3589 * _3605;
    float _3609 = _3593 * _3605;
    float _3611 = _3607 * _3607;
    float _3613 = _3609 * _3609;
    float _3615 = _3611 + _3613;
    float _3617 = sqrt(_3615);
    bool _3619 = _3617 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3623 = _3617 + _3621;
    float _3625 = _3597;
    float _3627 = _3601;
    float _3629 = _3623;
    float _3631 = _3585;
    float _3633 = _3579;
    if (_3619)
    {
        float _3635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3625 = _3635;
    }
    float _3637 = _3625;
    if (_3619)
    {
        float _3639 = rsqrt(_3615);
        _3627 = _3639;
    }
    float _3641 = _3627;
    float _3643 = _3641;
    if (_3619)
    {
        float _3645 = _3623 * _3637;
        _3629 = _3645;
    }
    float _3647 = _3629;
    if (_3619)
    {
        float _3649 = _3647 * 0.15915493667125701904296875;
        _2492 = _3649;
    }
    float _3651 = _2492;
    float _3653 = _3593;
    if (_3619)
    {
        float _3655 = _3651 * 6.283185482025146484375;
        float _3657 = sin(_3655);
        _3653 = _3657;
    }
    float _3659 = _3653;
    float _3661 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3663 = precise::max(0.0, _3661);
    float _3665 = _3637;
    float _3667 = _3663;
    if (_3619)
    {
        float _3669 = _3651 * 6.283185482025146484375;
        float _3671 = cos(_3669);
        _3665 = _3671;
    }
    float _3673 = _3665;
    float _3675 = -_3605;
    float _3677 = -_3663;
    float _3679 = fma(_3585, _3675, _3677);
    if (_3619)
    {
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3631 = _3681;
    }
    float _3683 = _3631;
    float _3685 = _3683;
    float _3687 = _3659;
    if (_3619)
    {
        float _3689 = fma(_3659, _3683, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3685 = _3689;
    }
    float _3691 = _3685;
    float _3693 = _3691;
    if (!_3619)
    {
        _3687 = _3607;
    }
    float _3695 = _3687;
    float _3697 = _3695;
    float _3699 = _3673;
    if (_3619)
    {
        float _3701 = _3673 + (-1.0);
        _3667 = _3701;
    }
    float _3703 = _3667;
    float _3705 = _3703;
    if (_3619)
    {
        float _3707 = _3641 * _3691;
        _3388 = _3707;
    }
    float _3709 = _3388;
    if (!_3619)
    {
        _3693 = _3679;
    }
    float _3711 = _3693;
    float _3713 = _3711;
    if (_3619)
    {
        float _3715 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3633 = _3715;
    }
    float _3717 = _3633;
    if (_3619)
    {
        float _3719 = _3607 * _3709;
        _3697 = _3719;
    }
    float _3721 = _3697;
    if (!_3619)
    {
        _3705 = _3609;
    }
    float _3723 = _3705;
    float _3725 = _3723;
    if (_3619)
    {
        float _3727 = _3609 * _3709;
        _3725 = _3727;
    }
    float _3729 = _3725;
    if (!_3619)
    {
        _3643 = _3611;
    }
    float _3731 = _3643;
    float _3733 = _3731;
    if (_3619)
    {
        float _3735 = fma(_3679, _3673, _3717);
        _3713 = _3735;
    }
    float _3737 = _3713;
    if (_3619)
    {
        float _3739 = _3721 * _3721;
        _3733 = _3739;
    }
    float _3741 = _3733;
    if (!_3619)
    {
        _3699 = _3613;
    }
    float _3743 = _3699;
    float _3745 = _3743;
    if (_3619)
    {
        float _3747 = _3729 * _3729;
        _3745 = _3747;
    }
    float _3749 = _3745;
    float _3751 = fma(_3737, _3737, _3741);
    float _3753 = _3751 + _3749;
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3757 = fma(_3603, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3755);
    float _3759 = precise::clamp(_3757, 0.0, 1.0);
    float _3761 = rsqrt(_3753);
    float _3763 = -_3759;
    float _3765 = _3763 + 1.0;
    float _3767 = abs(_3765);
    float _3769 = log2(_3767);
    float _3771 = _3761 * _3721;
    float _3773 = _3761 * _3737;
    float _3775 = _3761 * _3729;
    float _3777 = _3771 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3779 = -_3777;
    float _3781 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3779);
    float _3783 = -_3775;
    float _3785 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3781);
    float _3787 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3789 = fma(_3785, -0.5, 0.5);
    float _3791 = fma(_3785, 0.5, 0.5);
    float _3793 = exp2(_3787);
    float _3795 = fma(_3791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3797 = fma(_3791, _3795, -0.212114393711090087890625);
    float _3799 = _3773 + 1.0;
    float _3801 = sqrt(_3789);
    float _3803 = fma(_3791, _3797, 1.570728778839111328125);
    float _3805 = -_3773;
    float _3807 = fma(_3793, _3799, _3805);
    float _3809 = _3801 * 0.636619746685028076171875;
    float _3811 = fma(_3807, 0.5, 0.5);
    float _3813 = -_3803;
    float _3815 = fma(_3809, _3813, 1.0);
    float2 _10127 = float2(_3815, _3811);
    float3 _3819 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10127, float2(0.0), isnan(_10127)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10127, float2(0.0), isnan(_10127)), level(0.0)).xyz;
    float _3821 = _3819.x;
    float _3823 = _3819.y;
    float _3825 = _3819.z;
    float _3827 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3829 = abs(_2676);
    float _3831 = log2(_3829);
    float _3833 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3835 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3837 = fma(_3827, _3827, 1.0);
    float _3839 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3833);
    float _3841 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_86.x = _2712;
    out.m_86.y = _2734;
    out.m_86.z = _2728;
    float _3843 = rsqrt(_3837);
    float _3845 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3839);
    bool _3847 = _2676 <= 8000.0;
    bool _3849 = isnan(_2676);
    bool _3851 = _3847 || _3849;
    bool _3853 = isnan(8000.0);
    bool _3855 = _3851 || _3853;
    float _3857 = float(_3855);
    float _3859 = -_2518;
    float _3861 = _3859 + 1.0;
    out.m_88.x = _3264;
    out.m_88.y = _3262;
    out.m_88.z = _3266;
    float _3863 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3845);
    bool _3865 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3867 = isnan(_3603);
    bool _3869 = _3865 || _3867;
    bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3873 = _3869 || _3871;
    float _3875 = _3831 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3877 = exp2(_3835);
    out.gl_Position.x = _3368;
    out.gl_Position.y = _3370;
    out.gl_Position.z = _3863;
    out.gl_Position.w = _3338;
    float _3879 = _3827 * _3843;
    float _3881 = exp2(_3875);
    float _3883 = -_2612;
    float _3885 = _3879 * _3883;
    float _3887 = -_2606;
    float _3889 = _3879 * _3887;
    float _3891 = -_2620;
    float _3893 = _3879 * _3891;
    float _3895 = fma(_3843, _2748, _3885);
    float _3897 = fma(_3843, _2770, _3889);
    float _3899 = _3863 + _3338;
    float _3901 = _3827 * _2770;
    float _3903 = -_3877;
    float _3905 = _3903 + 1.0;
    float _3907 = fma(_3843, _2880, _3893);
    float _3909 = _3899 * 0.5;
    float _3911 = fma(_3841, _2712, _3901);
    float _3913 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = _3905 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3919 = _2606 + _3911;
    out.m_90.x = _3897;
    out.m_90.y = _3907;
    out.m_90.z = _3895;
    float _3921 = fma(_3915, -2.0, 3.0);
    float _3923 = _3915 * _3915;
    float _3925 = _3827 * _2880;
    float _3927 = _3827 * _2748;
    float _3929 = _3923 * _3921;
    float _3931 = fma(_3841, _2734, _3925);
    float _3933 = fma(_3841, _2728, _3927);
    float _3935 = _3905;
    if (!_3873)
    {
        _3354 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3937 = _3354;
    float _3939 = -_3929;
    float _3941 = _3939 + 1.0;
    float _3943 = _2620 + _3931;
    float _3945 = _3917 * _3436;
    float _3947 = -_3917;
    float _3949 = _3947 + 1.0;
    float _3951 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3929);
    float _3953 = _3941;
    float _3955 = _3949;
    float _3957 = _3937;
    float _3959 = _3937;
    if (!_3324)
    {
        _3953 = 1.0;
    }
    float _3961 = _3953;
    float _3963 = _3447 * _3945;
    float _3965 = _3961;
    if (_3324)
    {
        bool _3967 = _3434 >= _3384;
        bool _3969 = isnan(_3434);
        bool _3971 = _3967 || _3969;
        bool _3973 = isnan(_3384);
        bool _3975 = _3971 || _3973;
        float _3977 = float(_3975);
        _3965 = _3977;
    }
    float _3979 = _3965;
    float _3981 = _3857 * _3951;
    float _3983 = _2612 + _3933;
    float _3985 = _3447 * _3949;
    out.m_92.z = _3909;
    out.m_92.w = _3338;
    float _3987 = _3981 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3989 = _3979 * _3581;
    float _3991 = _3989;
    if (!_3873)
    {
        _3955 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3993 = _3955;
    out.m_94.x = _3919;
    out.m_94.y = _3943;
    out.m_94.z = _3983;
    float _3995 = _3861 * _3987;
    float _3997 = precise::clamp(_3995, 0.0, 1.0);
    float _3999 = _3993;
    float _4001 = _3993;
    if (!_3873)
    {
        _3935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4003 = _3935;
    float _4005 = -_3997;
    float _4007 = fma(_4005, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4009 = -_3989;
    float _4011 = fma(_4009, _4007, 1.0);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = _4003;
    float _4017 = _4003;
    if (!_3873)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4019 = _3991;
    float _4021 = _4013 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4021;
    float _4023 = _4021;
    float _4025 = _4019;
    float _4027 = _4019;
    if (!_3873)
    {
        _4023 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4029 = _4023;
    float _4031 = _3825 * _3945;
    float _4033 = fma(_3821, _3963, _3441);
    float _4035 = fma(_3823, _3963, _3443);
    float _4037 = _3517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4039 = fma(_3447, _4031, _3445);
    float _4041 = _4029;
    float _4043 = _4029;
    if (!_3873)
    {
        _3467 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4045 = _3467;
    out.m_98.x = _4033;
    out.m_98.y = _4035;
    out.m_98.z = _4039;
    out.m_98.w = _3985;
    bool _4047 = !_3873;
    float _4049 = _4045;
    float _4051 = _4045;
    if (!_4047)
    {
        bool _4053 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4055 = isnan(_3603);
        bool _4057 = _4053 || _4055;
        bool _4059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4061 = _4057 || _4059;
        if (!_4061)
        {
            float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4065 = _3603 + _4063;
            float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4067;
            float _4071 = 1.0 / _4069;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4087 = _4085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4093 = _4065 * _4071;
            float _4095 = precise::clamp(_4093, 0.0, 1.0);
            float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4099 = _4097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4101 = fma(_4095, _4075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4103 = fma(_4095, _4099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4105 = fma(_4095, _4079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4107 = fma(_4095, _4083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4109 = fma(_4095, _4087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4111 = fma(_4095, _4091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3959 = _4103;
            _4027 = _4109;
            _4051 = _4101;
            _4017 = _4107;
            _4001 = _4105;
            _4043 = _4111;
            _4113 = true;
        }
        else
        {
            bool _4115 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4117 = isnan(_3603);
            bool _4119 = _4115 || _4117;
            bool _4121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4123 = _4119 || _4121;
            if (!_4123)
            {
                _4049 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4125 = _4049;
            _4051 = _4125;
            if (!_4123)
            {
                _3957 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4127 = _3957;
            _3959 = _4127;
            if (!_4123)
            {
                _3999 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4129 = _3999;
            _4001 = _4129;
            if (!_4123)
            {
                _4015 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4131 = _4015;
            _4017 = _4131;
            if (!_4123)
            {
                _4025 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4133 = _4025;
            _4027 = _4133;
            if (!_4123)
            {
                _4041 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4135 = _4041;
            bool _4137 = !_4123;
            _4043 = _4135;
            if (!_4137)
            {
                bool _4139 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4141 = isnan(_3603);
                bool _4143 = _4139 || _4141;
                bool _4145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4147 = _4143 || _4145;
                if (!_4147)
                {
                    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4151 = _3603 + _4149;
                    float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4153;
                    float _4157 = 1.0 / _4155;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4179 = _4151 * _4157;
                    float _4181 = precise::clamp(_4179, 0.0, 1.0);
                    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4187 = fma(_4181, _4161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4189 = fma(_4181, _4185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4191 = fma(_4181, _4165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4193 = fma(_4181, _4169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4195 = fma(_4181, _4173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4197 = fma(_4181, _4177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3959 = _4189;
                    _4027 = _4195;
                    _4051 = _4187;
                    _4017 = _4193;
                    _4001 = _4191;
                    _4043 = _4197;
                    _4113 = true;
                }
                else
                {
                    _3959 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4027 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4051 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4017 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4001 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4043 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4113 = false;
    float _4199 = _3959;
    float _4201 = _4027;
    float _4203 = _4051;
    float _4205 = _4017;
    float _4207 = _4001;
    float _4209 = _4043;
    float _4211 = fma(_3943, -0.5, 0.5);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -_4199;
    float _4217 = _4215 + _4201;
    float _4219 = _4037 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4221 = -_4203;
    float _4223 = _4221 + _4205;
    out.m_100.x = 0.0;
    float _4225 = fma(_4213, _4217, _4199);
    float _4227 = fma(_4213, _4223, _4203);
    out.m_59.x = _4219;
    float _4229 = -_4207;
    float _4231 = _4229 + _4209;
    float _4233 = _4225 * 0.586610972881317138671875;
    bool _4235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4237 = fma(_4213, _4231, _4207);
    float _4239 = fma(_4227, 0.298911988735198974609375, _4233);
    bool _4241 = _3517 > 0.0;
    bool _4243 = isnan(_3517);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan(0.0);
    bool _4249 = _4245 || _4247;
    float _4251 = fma(_4237, 0.114477999508380889892578125, _4239);
    float _4253 = -_4251;
    float _4255 = _4227 + _4253;
    float _4257 = -_4251;
    float _4259 = _4225 + _4257;
    float _4261 = -_4251;
    float _4263 = _4237 + _4261;
    float _4265 = fma(_4255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    float _4267 = fma(_4259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    float _4269 = fma(_4263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    bool _4271 = !_4235;
    if (!_4271)
    {
        float _4273 = -_3262;
        float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4277 = -_3264;
        float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4281 = -_3266;
        float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4285 = _4275 * _4275;
        float _4287 = fma(_4279, _4279, _4285);
        float _4289 = fma(_4283, _4283, _4287);
        float _4291 = sqrt(_4289);
        float _4293 = rsqrt(_4289);
        float _4295 = -_4291;
        float _4297 = _4295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4299 = _4297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4301 = precise::clamp(_4299, 0.0, 1.0);
        float _4303 = _4279 * _4293;
        float _4305 = _4275 * _4293;
        float _4307 = abs(_4301);
        float _4309 = log2(_4307);
        float _4311 = _4283 * _4293;
        float _4313 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4315 = _3943 * _4305;
        float _4317 = -_4305;
        float _4319 = -_4313;
        float _4321 = fma(_4317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4319);
        float _4323 = fma(_3919, _4303, _4315);
        float _4325 = -_4311;
        float _4327 = fma(_4325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4321);
        float _4329 = fma(_3983, _4311, _4323);
        float _4331 = precise::clamp(_4329, 0.0, 1.0);
        float _4333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4335 = _4327 + _4333;
        float _4337 = _4309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4339 = _4335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4341 = precise::clamp(_4339, 0.0, 1.0);
        float _4343 = exp2(_4337);
        float _4345 = _4343 * _4341;
        float _4347 = _4331 * _4345;
        float _4349 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4351 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4353 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4349;
        out.m_100.y = _4351;
        out.m_100.z = _4353;
    }
    out.m_102.x = _4265;
    out.m_102.y = _4267;
    out.m_102.z = _4269;
    if (_4249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4355;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4113 = false;
    bool _969 = false;
    bool _801 = false;
    bool _581 = false;
    bool _405 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4412 = as_type<float>(_137);
        out.gl_Position.z = _4412;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_61.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_151)
    {
        float _157 = float(_121);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _155 >= _159;
    bool _163 = !_151;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_59.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _139 = as_type<int>(_171);
    }
    int _173 = _139;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4481 = as_type<float>(_173);
        out.gl_Position.z = _4481;
    }
    if (_165)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_66.x;
    float _179 = in.m_66.y;
    float _181 = in.m_66.z;
    float _183 = in.m_68.x;
    float _185 = in.m_68.y;
    float _187 = in.m_68.z;
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    float _195 = in.m_72.x;
    float _197 = in.m_72.y;
    float _199 = in.m_72.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = _179 * _185;
    float _213 = _179 * _191;
    float _215 = fma(_177, _183, _211);
    float _217 = _179 * _197;
    float _219 = fma(_177, _189, _213);
    float _221 = fma(_181, _187, _215);
    float _223 = fma(_177, _195, _217);
    float _225 = fma(_181, _193, _219);
    float _227 = fma(_181, _199, _223);
    bool _229 = !_203;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_207;
    float _235 = _233 ? (-0.5) : 0.5;
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_74.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_121);
        float _261 = 1.0 / _259;
        float _263 = _155 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    bool _271 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_265);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _285;
    bool _305 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_265);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _289;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = _269 * _303;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _265 + _327;
    float _331 = -_281;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = fma(_323, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _301 * _333;
    float _347 = fma(_337, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = _315 * _341;
    float _351 = _329 * _319;
    float _353 = -_315;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _347 * _349;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = _343 * _349;
    float _369 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _361);
    float _373 = fma(_365, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _377 = fma(_369, _345, _371);
    float _379 = fma(_373, _345, _375);
    float _381 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].x, _377);
    float _383 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].y, _379);
    bool _385 = !_317;
    float _403;
    if (!_385)
    {
        float _387 = in.m_74.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].x, _155);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_121);
        float _409 = 1.0 / _407;
        float _411 = _155 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_76.x;
    float _417 = in.m_76.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _413 + _419;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = 1.0 / _437;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _447 = 1.0 / _441;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _449;
    float _453 = _421 * _443;
    bool _455 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_413);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _413 + _467;
    float _471 = _383 * _417;
    bool _473 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _475 = isnan(_413);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -_465;
    float _491 = _489 + 1.0;
    float _493 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _495 = _469 * _447;
    float _497 = fma(_487, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = _483 * _491;
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _505;
    float _509 = _381 * _415;
    float _511 = _433 * _503;
    float _513 = fma(_507, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _515 = -_433;
    float _517 = _515 + 1.0;
    float _519 = _497 * _511;
    float _521 = _513 * _511;
    float _523 = _493 * _511;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].y, _519);
    float _539 = fma(_527, _495, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _541 = fma(_531, _495, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].x, _521);
    float _545 = fma(_535, _495, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _549 = fma(_539, _499, _537);
    float _551 = fma(_541, _499, _543);
    float _553 = fma(_545, _499, _547);
    float _555 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _549);
    float _557 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _551);
    float _559 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _553);
    bool _561 = !_445;
    float _579;
    if (!_561)
    {
        float _563 = in.m_74.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_121);
        float _585 = 1.0 / _583;
        float _587 = _155 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _593 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    float _603 = 1.0 / _597;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = isnan(_589);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _627 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _629 = isnan(_589);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _607;
    bool _641 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _643 = isnan(_589);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_623;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = -_651;
    float _661 = _659 + 1.0;
    float _663 = _651 * _655;
    float _665 = _601 * _603;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _589 + _667;
    float _671 = 1.0 / _611;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = _637 * _661;
    float _679 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _685 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _687 = isnan(_589);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _697;
    float _701 = _675 * _639;
    float _703 = 1.0 / _683;
    float _705 = _679 * _677;
    float _707 = -_695;
    float _709 = _707 + 1.0;
    float _711 = -_637;
    float _713 = _711 + 1.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _719 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _623 * _709;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _725 = _589 + _723;
    float _727 = _699 * _671;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _589 + _729;
    bool _733 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _735 = isnan(_589);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _747 = fma(_727, _725, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _749 = fma(_701, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _753 = _589 + _751;
    float _755 = -_743;
    float _757 = _755 + 1.0;
    float _759 = _717 * _703;
    float _761 = fma(_749, _663, _745);
    float _763 = _695 * _757;
    float _765 = fma(_759, _753, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _767 = fma(_747, _721, _761);
    float _769 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = fma(_765, _763, _767);
    float _773 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[119].x, _771);
    float _777 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_78.x = _773;
    out.m_78.y = _769;
    out.m_78.z = _719;
    out.m_78.w = _777;
    bool _779 = !_657;
    float _781 = _639;
    float _799;
    if (!_779)
    {
        float _783 = in.m_74.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _155);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_121);
        float _805 = 1.0 / _803;
        float _807 = _155 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _809 + _811;
    bool _815 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = isnan(_809);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _809 + _827;
    bool _831 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _833 = isnan(_809);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _851 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _853 = isnan(_809);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_825;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _849;
    float _869 = _861 * _865;
    float _871 = -_861;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _875;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _881 = 1.0 / _845;
    float _883 = _841 * _873;
    float _885 = -_841;
    float _887 = _885 + 1.0;
    float _889 = _829 * _867;
    float _891 = _813 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = fma(_877, _891, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _903 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _905 = fma(_899, _891, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _907 = _901 * _883;
    float _909 = _903 * _883;
    float _911 = _905 * _883;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].x, _907);
    float _927 = fma(_915, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_919, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _931 = fma(_923, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _933 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].y, _909);
    float _935 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].z, _911);
    float _937 = fma(_927, _869, _925);
    float _939 = fma(_929, _869, _933);
    float _941 = fma(_931, _869, _935);
    float _943 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].x, _937);
    float _945 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].y, _939);
    float _947 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].z, _941);
    bool _949 = !_879;
    float _967;
    if (!_949)
    {
        float _951 = in.m_74.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        float _971 = float(_121);
        float _973 = 1.0 / _971;
        float _975 = _155 * _973;
        _967 = _975;
    }
    _969 = false;
    float _977 = _967;
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _981 = int(_979);
    float _983 = float(_121);
    float _985 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _989 = _987 != 0;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _993 = int(_991);
    float _995 = float(_981);
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _999 = int(_997);
    if (_989)
    {
        float _1001 = in.m_74.x;
        _781 = _1001;
    }
    float _1003 = _781;
    float _1005 = float(uint(_993));
    float _1007 = 1.0 / _995;
    int _1009 = ~_993;
    int _1011 = _1009 + 1;
    float _1013 = _1003;
    if (!_989)
    {
        float _1015 = in.m_74.y;
        _1013 = _1015;
    }
    float _1017 = _1013;
    bool _1019 = _993 == 0;
    float _1021 = 1.0 / _1005;
    int _1023 = ~_993;
    int _1025 = _1023 + 1;
    float _1027 = float(uint(_999));
    int _1029 = ~_999;
    int _1031 = _1029 + 1;
    float _1033 = _155 * _1007;
    float _1035 = 1.0 / _983;
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = trunc(_1033);
    int _1041 = int(_1039);
    float _1043 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1045 = int(_1043);
    float _1047 = float(uint(_1041));
    float _1049 = 1.0 / _1027;
    float _1051 = as_type<float>(_1037) * _1047;
    float _1053 = float(_1045);
    float _1055 = trunc(_1051);
    float _1057 = precise::max(_1055, 0.0);
    uint _1060 = uint(_1057);
    float _1062 = 1.0 / _1053;
    float _1064 = _1051;
    if (_989)
    {
        _1064 = 1.0;
    }
    float _1066 = _1064;
    float _1068 = _1066;
    if (!_989)
    {
        _1068 = 7.345489978790283203125;
    }
    float _1070 = _1068;
    int _1072 = _1025 * int(_1060);
    int _1074 = _1072 + _1041;
    float _1076 = float(uint(_1074));
    float _1078 = in.m_74.x;
    float _1080 = in.m_74.y;
    float _1082 = in.m_74.z;
    float _1084 = in.m_74.w;
    float _1086 = _155 * _1062;
    float _1088 = as_type<float>(_1037) * _1076;
    float _1090 = trunc(_1086);
    int _1092 = int(_1090);
    float _1094 = trunc(_1088);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = float(uint(_1092));
    float _1102 = _1070 * _1078;
    float _1104 = float(_1041);
    float _1106 = floor(_1102);
    int _1108 = int(_1060) + int(_1098);
    float _1110 = float(_993);
    int _1112 = _1011 * _1108;
    int _1114 = _1112 + _1041;
    bool _1116 = _1104 >= _1110;
    bool _1118 = isnan(_1104);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(_1110);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    int _1128 = as_type<int>(_1049) + (-2);
    bool _1130 = uint(_1114) >= uint(_993);
    float _1132 = trunc(_1126);
    int _1134 = int(_1132);
    float _1136 = as_type<float>(_1128) * _1100;
    bool _1138 = !_1130;
    int _1140 = _1138 ? 0 : (-1);
    float _1142 = -_1106;
    float _1144 = _1102 + _1142;
    float _1146 = _155 * _1035;
    int _1148 = ~_1108;
    int _1150 = _1148 + _1140;
    int _1152 = _1150 + 1;
    float _1154 = _1144 * _1110;
    float _1156 = trunc(_1136);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    float _1162 = _1146 * _1110;
    int _1164 = _993 * _1152;
    int _1166 = _1164 + _1041;
    float _1168 = _1144;
    float _1170 = _1082;
    if (_989)
    {
        _1168 = 1.0;
    }
    float _1172 = _1168;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1176 = _1174 != 0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1180 = _1178 != 0;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1184 = _1182 != 0;
    int _1186 = ~_1134;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    bool _1192 = !_1019;
    int _1194 = _1192 ? _1166 : (-1);
    int _1196 = _993 + (-1);
    float _1198 = trunc(_1162);
    int _1200 = int(_1198);
    float _1202 = _1172;
    if (!_989)
    {
        _1202 = 1.2345600128173828125;
    }
    float _1204 = _1202;
    int _1206 = _1194 * _1190;
    int _1208 = _1031 * int(_1160);
    int _1210 = _1208 + _1092;
    int _1212 = _1134 * _1196;
    int _1214 = _1212 + _1206;
    float _1216 = _1017 * _1204;
    bool _1218 = !_1176;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = float(uint(_1210));
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1226 = _1224 != 0;
    float _1228 = trunc(_1154);
    int _1230 = int(_1228);
    bool _1232 = !_1180;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = as_type<float>(_1128) * _1222;
    bool _1238 = !_1226;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = abs(_1234);
    int _1244 = abs(_1240);
    float _1246 = trunc(_1236);
    float _1248 = precise::max(_1246, 0.0);
    uint _1250 = uint(_1248);
    int _1252 = abs(_1220);
    bool _1254 = !_1184;
    int _1256 = _1254 ? 0 : 1;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1260 = _1258 != 0;
    int _1262 = abs(_1256);
    int _1264 = _1214 * _1242;
    int _1266 = _1230 * _1244;
    int _1268 = _1266 + _1041;
    bool _1270 = !_1260;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = _1200 * _1252;
    int _1276 = _1274 + _1264;
    int _1278 = abs(_1272);
    int _1280 = int(_1160) + int(_1250);
    int _1282 = _1268 * _1262;
    int _1284 = _1282 + _1276;
    int _1286 = ~_999;
    int _1288 = _1286 + 1;
    float _1290 = float(_999);
    float _1292 = floor(_1216);
    float _1294 = float(_1092);
    int _1296 = _1288 * _1280;
    int _1298 = _1296 + _1092;
    bool _1300 = _999 == 0;
    int _1302 = _1230 * _1278;
    int _1304 = _1302 + _1284;
    bool _1306 = _1294 >= _1290;
    bool _1308 = isnan(_1294);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(_1290);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    bool _1318 = uint(_1298) >= uint(_999);
    float _1320 = float(uint(_1304));
    float _1322 = trunc(_1316);
    int _1324 = int(_1322);
    bool _1326 = !_1318;
    int _1328 = _1326 ? 0 : (-1);
    float _1330 = as_type<float>(_1037) * _1320;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1334 = _1332 != 0;
    float _1336 = -_1292;
    float _1338 = _1216 + _1336;
    int _1340 = ~_1280;
    int _1342 = _1340 + _1328;
    int _1344 = _1342 + 1;
    float _1346 = trunc(_1330);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    float _1352 = _1338 * _1290;
    int _1354 = ~_993;
    int _1356 = _1354 + 1;
    int _1358 = _999 * _1344;
    int _1360 = _1358 + _1092;
    float _1362 = _1146 * _1290;
    bool _1364 = !_1334;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1352);
    int _1370 = int(_1368);
    int _1372 = ~_1324;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1300;
    int _1380 = _1378 ? _1360 : (-1);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1396 = _1394 != 0;
    int _1398 = abs(_1366);
    int _1400 = _1380 * _1376;
    int _1402 = _999 + (-1);
    int _1404 = _1356 * int(_1350);
    int _1406 = _1404 + _1304;
    bool _1408 = !_1384;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = trunc(_1362);
    int _1414 = int(_1412);
    bool _1416 = !_1388;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = _1324 * _1402;
    int _1422 = _1420 + _1400;
    int _1424 = abs(_1410);
    int _1426 = _1370 * _1398;
    int _1428 = _1426 + _1092;
    bool _1430 = !_1392;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = float(uint(_1268));
    int _1436 = abs(_1418);
    float _1438 = float(uint(_1406));
    int _1440 = abs(_1432);
    float _1442 = as_type<float>(_1037) * _1434;
    int _1444 = _1422 * _1436;
    float _1446 = as_type<float>(_1037) * _1438;
    bool _1448 = !_1396;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = _1414 * _1424;
    int _1454 = _1452 + _1444;
    float _1456 = trunc(_1442);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = abs(_1450);
    float _1464 = float(uint(_1428));
    int _1466 = _1428 * _1440;
    int _1468 = _1466 + _1454;
    int _1470 = ~_993;
    int _1472 = _1470 + 1;
    int _1474 = ~_993;
    int _1476 = _1474 + 1;
    float _1478 = trunc(_1446);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    float _1484 = as_type<float>(_1128) * _1464;
    int _1486 = _1370 * _1462;
    int _1488 = _1486 + _1468;
    int _1490 = ~_999;
    int _1492 = _1490 + 1;
    float _1494 = float(uint(_1488));
    float _1496 = trunc(_1484);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = _1472 * int(_1460);
    int _1504 = _1502 + _1268;
    bool _1506 = _993 == 0;
    float _1508 = as_type<float>(_1128) * _1494;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1512 = _1510 != 0;
    float _1514 = trunc(_1508);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    int _1520 = int(_1350) + int(_1482);
    float _1522 = float(uint(_1504));
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1528 = ~_999;
    int _1530 = _1528 + 1;
    int _1532 = _1476 * _1520;
    int _1534 = _1532 + _1304;
    float _1536 = as_type<float>(_1037) * _1522;
    int _1538 = _1492 * int(_1500);
    int _1540 = _1538 + _1428;
    int _1542 = ~_999;
    int _1544 = _1542 + 1;
    bool _1546 = uint(_1534) >= uint(_993);
    float _1548 = trunc(_1536);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    float _1554 = float(uint(_1540));
    bool _1556 = !_1546;
    int _1558 = _1556 ? 0 : (-1);
    int _1560 = 0;
    if (_1512)
    {
        _1560 = 0;
    }
    int _1562 = _1560;
    float _1564 = as_type<float>(_1128) * _1554;
    int _1566 = ~_1520;
    int _1568 = _1566 + _1558;
    int _1570 = _1568 + 1;
    int _1572 = _1530 * int(_1518);
    int _1574 = _1572 + _1488;
    int _1576 = _1562;
    if (!_1512)
    {
        _1576 = 1;
    }
    int _1578 = _1576;
    int _1580 = _993 * _1570;
    int _1582 = _1580 + _1304;
    float _1584 = float(uint(_1574));
    float _1586 = trunc(_1564);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    int _1592 = int(_1460) + int(_1552);
    bool _1594 = !_1506;
    int _1596 = _1594 ? _1582 : (-1);
    float _1598 = as_type<float>(_1128) * _1584;
    int _1600 = ~_993;
    int _1602 = _1600 + 1;
    int _1604 = _1596 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1596 & 3;
    bool _1610 = _1608 != 0;
    float _1612 = trunc(_1598);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    bool _1618 = uint(_1604) > 1u;
    int _1620 = _1602 * _1592;
    int _1622 = _1620 + _1268;
    bool _1624 = _1604 != 3;
    int _1626 = _1610 ? 0 : 1;
    bool _1628 = uint(_1604) >= 2u;
    int _1630 = int(_1500) + int(_1590);
    int _1632 = _1628 ? 0 : 1;
    int _1634 = ~_1626;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    int _1640 = _1544 * _1630;
    int _1642 = _1640 + _1428;
    int _1644 = _1638;
    if (!_1618)
    {
        int _1646 = ~_1626;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    int _1652 = ~_1632;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = _1084 > 0.5;
    bool _1660 = uint(_1622) >= uint(_993);
    int _1662 = _1656;
    if (_1624)
    {
        int _1664 = ~_1632;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    int _1670 = int(_1518) + int(_1616);
    float _1672 = in.m_56.x;
    float _1674 = in.m_56.y;
    float _1676 = in.m_56.z;
    bool _1678 = !_1660;
    int _1680 = _1678 ? 0 : (-1);
    bool _1682 = uint(_1642) >= uint(_999);
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1686 = _1684 != 0;
    int _1688 = ~_999;
    int _1690 = _1688 + 1;
    bool _1692 = !_1686;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = _1078 > 0.5;
    int _1698 = _1690 * _1670;
    int _1700 = _1698 + _1488;
    float _1702 = -_231;
    int _1704 = _1696 ? as_type<int>(_1702) : as_type<int>(_231);
    int _1706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1708 = _1706 != 0;
    bool _1710 = _1080 > 0.5;
    bool _1712 = !_1682;
    int _1714 = _1712 ? 0 : (-1);
    float _1716 = _197 * _1674;
    bool _1718 = !_1708;
    float _1720 = _1718 ? _231 : as_type<float>(_1704);
    float _1722 = -_235;
    int _1724 = _1710 ? as_type<int>(_1722) : as_type<int>(_235);
    float _1726 = fma(_195, _1672, _1716);
    bool _1728 = uint(_1700) >= uint(_999);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    float _1734 = fma(_199, _1676, _1726);
    bool _1736 = _1082 > 0.5;
    bool _1738 = !_1728;
    int _1740 = _1738 ? 0 : (-1);
    bool _1742 = !_1732;
    float _1744 = _1742 ? _235 : as_type<float>(_1724);
    float _1746 = _185 * _1674;
    float _1748 = -_231;
    int _1750 = _1736 ? as_type<int>(_1748) : as_type<int>(_231);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1758 = _1756 != 0;
    float _1760 = fma(_183, _1672, _1746);
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1764 = _1762 != 0;
    float _1766 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1770 = _1768 != 0;
    float _1772 = _191 * _1674;
    float _1774 = 1.0 / _1526;
    float _1776 = fma(_189, _1672, _1772);
    float _1778 = fma(_187, _1676, _1760);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1782 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1784 = isnan(_977);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1800 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1802 = 1.0 / _1754;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1806 = _977 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1810 = _977 + _1808;
    float _1812 = -_1798;
    float _1814 = fma(_1800, 2.0, _1812);
    float _1816 = fma(_1766, -2.0, _1780);
    float _1818 = fma(_193, _1676, _1776);
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1820;
    float _1824 = 1.0 / _1796;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1826;
    float _1830 = in.m_68.w;
    float _1832 = _1822 * _1774;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1836 = _1834 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1838 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1840 = isnan(_977);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -_155;
    float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1814);
    bool _1854 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1856 = isnan(_977);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = _1836 * _1802;
    bool _1868 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1870 = isnan(_977);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = fma(_1832, _1806, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1882 = !_1770;
    float _1884 = _1882 ? _231 : as_type<float>(_1750);
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1888 = _977 + _1886;
    bool _1890 = _1578 != 1;
    float _1892 = -_1878;
    float _1894 = _1892 + 1.0;
    float _1896 = _1828 * _1824;
    float _1898 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1816);
    float _1900 = in.m_72.w;
    float _1902 = _1848 * _1894;
    float _1904 = -_1864;
    float _1906 = _1904 + 1.0;
    float _1908 = -_1848;
    float _1910 = _1908 + 1.0;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1914 = ~_1670;
    int _1916 = _1914 + _1740;
    int _1918 = _1916 + 1;
    float _1920 = _1792 * _1906;
    float _1922 = _1864 * _1910;
    float _1924 = fma(_1866, _1810, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1926 = _1778 + _1830;
    float _1928 = _1880 * _1920;
    float _1930 = fma(_1896, _1888, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1932 = _1720 + 0.5;
    float _1934 = _1744 + (-0.5);
    float _1936 = -_1792;
    float _1938 = _1936 + 1.0;
    float _1940 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1912);
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1852);
    float _1944 = -_1934;
    float _1946 = -_1898;
    float _1948 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1946);
    float _1950 = _1852;
    float _1952 = _1898;
    float _1954 = as_type<float>(_1670);
    float _1956 = _1884;
    if (!_1890)
    {
        _1950 = _1080;
    }
    float _1958 = _1950;
    int _1960 = _999 * _1918;
    int _1962 = _1960 + _1488;
    float _1964 = _1958;
    if (!_1890)
    {
        _1952 = _1080;
    }
    float _1966 = _1952;
    float _1968 = in.m_70.w;
    float _1970 = _1966;
    if (_1890)
    {
        _1964 = _1078;
    }
    float _1972 = _1964;
    float _1974 = _1884 + 0.5;
    float _1976 = _1734 + _1900;
    float _1978 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1928);
    if (_1890)
    {
        _1970 = _1078;
    }
    float _1980 = _1970;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1890)
    {
        _1954 = _1082;
    }
    float _1984 = _1954;
    float _1986 = fma(_1924, _1922, _1978);
    float _1988 = _1984;
    if (_1890)
    {
        _1988 = _1080;
    }
    float _1990 = _1988;
    float _1992 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1982);
    if (_1890)
    {
        _1170 = _1080;
    }
    float _1994 = _1170;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1998 = _1596 >> 31;
    float _2000 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2002 = !_1300;
    int _2004 = _2002 ? _1962 : (-1);
    float _2006 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1996);
    int _2008 = _1998 & 3;
    float _2010 = fma(_1930, _1902, _1986);
    int _2012 = _2004 >> 31;
    float _2014 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2016 = _1596 + _2008;
    float _2018 = _1818 + _1968;
    int _2020 = _2012 & 3;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2024 = _1926 + _2022;
    int _2026 = _2016 >> 2;
    float _2028 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1940);
    int _2030 = _2004 + _2020;
    float _2032 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2034 = _2026 << 4;
    int _2036 = _2034 + 368;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2040 = _1976 + _2038;
    int _2042 = _2030 >> 2;
    int _2044 = _2042 << 4;
    int _2046 = _2044 + 512;
    uint _2048 = uint(int(uint(_2036) >> uint(2)));
    uint _2050 = uint(int(uint(int(_2048)) >> uint(2)));
    int _2052 = int(_2048) & 3;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[int(_2050)][_2052];
    int _2056 = int(_2048) + 1;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    int _2060 = _2056 & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2066 = !_1606;
    int _2068 = _2066 ? 0 : 1;
    float _2070 = -_2064;
    float _2072 = fma(_2000, 2.0, _2070);
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2076 = uint(int(uint(_2046) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[int(_2086)][_2088];
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2094 = _2004 & 3;
    bool _2096 = _2094 != 0;
    float _2098 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2010);
    int _2100 = _2004 & 3;
    bool _2102 = _2100 != 0;
    float _2104 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2092);
    int _2106 = _2096 ? 0 : 1;
    float _2108 = fma(_2014, -2.0, _2074);
    int _2110 = _2046 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    bool _2128 = uint(_2100) > 1u;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2132 = _2018 + _2130;
    int _2134 = ~_2106;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = -_155;
    float _2142 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2072);
    bool _2144 = !_2102;
    int _2146 = _2144 ? 0 : 1;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2032);
    bool _2150 = _1604 != 3;
    int _2152 = _2036 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1992);
    float _2172 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2006);
    float _2174 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2104);
    bool _2176 = !_2150;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2148);
    int _2182 = _2138;
    if (!_2128)
    {
        int _2184 = ~_2106;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2108);
    bool _2192 = _2100 != 3;
    float _2194 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2142);
    int _2196 = abs(_2188);
    bool _2198 = uint(_2100) >= 2u;
    int _2200 = ~_1592;
    int _2202 = _2200 + _1680;
    int _2204 = _2202 + 1;
    int _2206 = abs(_1650);
    int _2208 = ~_2196;
    int _2210 = _2208 + 1;
    int _2212 = _2210 + 1;
    int _2214 = _993 * _2204;
    int _2216 = _2214 + _1268;
    int _2218 = _2198 ? 0 : 1;
    int _2220 = ~_2206;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    int _2226 = abs(_2146);
    int _2228 = abs(_2068);
    int _2230 = _2224 * as_type<int>(_2062);
    int _2232 = ~_2218;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2212 * as_type<int>(_2090);
    int _2240 = _2236;
    if (_2192)
    {
        int _2242 = ~_2218;
        int _2244 = _2242 + 1;
        _2240 = _2244;
    }
    int _2246 = _2240;
    int _2248 = abs(_2246);
    int _2250 = ~_2226;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    bool _2256 = _2100 != 3;
    int _2258 = ~_2228;
    int _2260 = _2258 + 1;
    int _2262 = _2260 + 1;
    int _2264 = _2254 * as_type<int>(_2082);
    int _2266 = _2264 + _2238;
    int _2268 = abs(_1668);
    int _2270 = ~_2248;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = _2262 * as_type<int>(_2054);
    int _2278 = _2276 + _2230;
    int _2280 = abs(_2178);
    bool _2282 = !_2256;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2274 * as_type<int>(_2118);
    int _2288 = _2286 + _2266;
    int _2290 = ~_2268;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2284);
    int _2298 = _2294 * as_type<int>(_2160);
    int _2300 = _2298 + _2278;
    bool _2302 = !_1764;
    int _2304 = _2302 ? 0 : 1;
    int _2306 = ~_1630;
    int _2308 = _2306 + _1714;
    int _2310 = _2308 + 1;
    int _2312 = ~_2280;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = abs(_1694);
    int _2320 = _999 * _2310;
    int _2322 = _2320 + _1428;
    int _2324 = abs(_2304);
    int _2326 = _2316 * as_type<int>(_2168);
    int _2328 = _2326 + _2300;
    int _2330 = ~_2296;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2318;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = ~_2324;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    int _2348 = _2334 * as_type<int>(_2126);
    int _2350 = _2348 + _2288;
    bool _2352 = !_1506;
    int _2354 = _2352 ? _2216 : (-1);
    int _2356 = _2328 * _2340;
    bool _2358 = !_1300;
    int _2360 = _2358 ? _2322 : (-1);
    int _2362 = _2350 * _2346;
    bool _2364 = _2180 >= 0.0;
    int _2366 = _2354 * _2318;
    int _2368 = _2366 + _2356;
    float _2370 = -_2170;
    float _2372 = _2370 + 1.0;
    int _2374 = _2360 * _2324;
    int _2376 = _2374 + _2362;
    float _2378 = _2024 * _2024;
    float _2380 = -_235;
    int _2382 = _1658 ? as_type<int>(_2380) : as_type<int>(_235);
    float _2384 = fma(_1744, _2372, _1948);
    float _2386 = -_2172;
    float _2388 = _2386 + 1.0;
    float _2390 = fma(_2132, _2132, _2378);
    bool _2392 = !_1758;
    float _2394 = _2392 ? _235 : as_type<float>(_2382);
    float _2396 = -_2174;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2388;
    float _2402 = fma(_1884, _2400, _2194);
    float _2404 = fma(_2040, _2040, _2390);
    if (_2364)
    {
        _1956 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2406 = _1956;
    float _2408 = _2394 + (-0.5);
    float _2410 = -_2028;
    float _2412 = _2410 + 1.0;
    float _2414 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2416 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2418 = rsqrt(_2404);
    float _2420 = -_2408;
    float _2422 = -_2190;
    float _2424 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2422);
    float _2426 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = _2098 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2430 = -_2412;
    float _2432 = fma(_1720, _2430, _1942);
    float _2434 = fma(_2394, _2398, _2424);
    float _2436 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2440 = as_type<int>(_2406);
    if (_2364)
    {
        float _2442 = _2406 * 5.0;
        _2440 = as_type<int>(_2442);
    }
    int _2444 = _2440;
    float _2446 = float(_2368);
    out.m_80.x = _2432;
    out.m_80.y = _2384;
    out.m_80.z = _2402;
    out.m_80.w = _2434;
    float _2448 = float(_2376);
    out.m_82.x = _2436;
    out.m_82.y = _2438;
    out.m_82.z = _2416;
    out.m_82.w = _2428;
    float _2450 = _2024 * _2418;
    float _2452 = _2132 * _2418;
    float _2454 = as_type<float>(_2444);
    if (_2364)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7879 = as_type<float>(_2444);
        out.gl_Position.z = _7879;
    }
    out.m_84.x = _2446;
    out.m_84.y = _2448;
    if (_2364)
    {
        out.m_59.x = 0.0;
    }
    if (_2364)
    {
        return out;
    }
    float _2456 = -_2450;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2460 = _2040 * _2418;
    float _2462 = -_2452;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2018);
    float _2466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2468 = _2458 + _2466;
    float _2470 = -_2460;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _2464 + _2474;
    float _2478 = _2468 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2472 + _2480;
    float _2484 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2478);
    float _2486 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2484);
    bool _2488 = _2486 >= 0.0;
    float _2490 = _2476;
    float _2492 = _2464;
    if (_2488)
    {
        _2454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2494 = _2454;
    int _2496 = as_type<int>(_2494);
    if (_2488)
    {
        out.m_59.x = 0.0;
    }
    if (_2488)
    {
        float _2498 = _2494 * 5.0;
        _2496 = as_type<int>(_2498);
    }
    int _2500 = _2496;
    if (_2488)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7979 = as_type<float>(_2500);
        out.gl_Position.z = _7979;
    }
    if (_2488)
    {
        return out;
    }
    float _2502 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2504 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2506 = floor(_2502);
    float _2508 = floor(_2504);
    float _2510 = -_2506;
    float _2512 = _2502 + _2510;
    float _2514 = -_2508;
    float _2516 = _2504 + _2514;
    float2 _8015 = float2(_2512, _2516);
    float _2518 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8015, float2(0.0), isnan(_8015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8015, float2(0.0), isnan(_8015)), level(0.0)).x;
    float _2520 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2522 = -_1926;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2526 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2520);
    float _2528 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _2530 = -_2018;
    float _2532 = _2530 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2534 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2526);
    float _2536 = _2524 * _2524;
    float _2538 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2528);
    float _2540 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2542 = -_1976;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = fma(_2532, _2532, _2536);
    float _2548 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2538);
    float _2550 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2552 = fma(_2544, _2544, _2546);
    float _2554 = rsqrt(_2548);
    float _2556 = -_2450;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2024);
    float _2560 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2550);
    float _2562 = -_2452;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2566 = _2558 * _2558;
    float _2568 = -_2460;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2572 = 1.0 / _2540;
    float _2574 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2576 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2560);
    float _2578 = fma(_2564, _2564, _2566);
    float _2580 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2574);
    float _2582 = _471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2584 = fma(_2570, _2570, _2578);
    float _2586 = rsqrt(_2552);
    float _2588 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2580);
    float _2590 = _231 * _2554;
    float _2592 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2594 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2596 = _2458 + _2592;
    float _2598 = rsqrt(_2576);
    float _2600 = _2594 + _2540;
    float _2602 = _2600 * _2572;
    float _2604 = _2602 * 0.5;
    float _2606 = _2532 * _2586;
    float _2608 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2610 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2608);
    float _2612 = _2544 * _2586;
    float _2614 = sqrt(_2584);
    float _2616 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2618 = _2606 * _2616;
    float _2620 = _2524 * _2586;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2624 = _2612 * _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2628 = -_2618;
    float _2630 = fma(_2612, _2626, _2628);
    float _2632 = _235 * _2598;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2636 = _2620 * _2634;
    float _2638 = 1.0 / _2610;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2642 = -_2624;
    float _2644 = fma(_2620, _2640, _2642);
    float _2646 = _2630 * _2630;
    float _2648 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2632);
    float _2652 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2654 = fma(_2644, _2644, _2646);
    float _2656 = _2418 * _2614;
    float _2658 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2660 = -_2636;
    float _2662 = fma(_2606, _2658, _2660);
    float _2664 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2652);
    float _2666 = _2656 * _2648;
    float _2668 = fma(_2662, _2662, _2654);
    float _2670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2590);
    float _2672 = _2656 * _2582;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = _2638 * _2674;
    float _2678 = rsqrt(_2668);
    float _2680 = _2670 * _2666;
    float _2682 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2684 = _2650 * _2672;
    bool _2686 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2688 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2664);
    bool _2690 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2692 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2682);
    float _2694 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2696 = _2694 * 0.5;
    bool _2698 = !_2686;
    int _2700 = _2698 ? 0 : 1;
    float _2702 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2704 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2692);
    float _2706 = trunc(_2702);
    int _2708 = int(_2706);
    float _2710 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2712 = _2644 * _2678;
    int _2714 = 2;
    int _2716 = as_type<int>(_2684);
    float _2718 = _2696;
    float _2720 = _2710;
    float _2722 = _2702;
    float _2724 = _2596;
    if (!_2686)
    {
        _2714 = 1;
    }
    int _2726 = _2714;
    float _2728 = _2662 * _2678;
    int _2730 = _2726;
    if (!_2690)
    {
        _2730 = _2700;
    }
    int _2732 = _2730;
    float _2734 = _2630 * _2678;
    float _2736 = _2620 * _2712;
    float _2738 = trunc(_2710);
    int _2740 = int(_2738);
    int _2742 = _2732 << 6;
    float _2744 = _2612 * _2734;
    float _2746 = -_2736;
    float _2748 = fma(_2606, _2734, _2746);
    int _2750 = _2742 + 96;
    uint _2752 = uint(int(uint(_2750) >> uint(2)));
    uint _2754 = uint(int(uint(int(_2752)) >> uint(2)));
    int _2756 = int(_2752) & 3;
    float _2758 = (*spvDescriptorSet0.vp_c15)._m0[int(_2754)][_2756];
    int _2760 = int(_2752) + 1;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    int _2764 = _2760 & 3;
    float _2766 = (*spvDescriptorSet0.vp_c15)._m0[int(_2762)][_2764];
    float _2768 = -_2744;
    float _2770 = fma(_2620, _2728, _2768);
    float _2772 = _2684 * _2748;
    int _2774 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2776 = _2708 + _2774;
    int _2778 = _2776 + 1;
    float _2780 = _2684 * _2770;
    float _2782 = fma(_2680, _2728, _2772);
    bool _2784 = _2778 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2786 = _2742 + 48;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    uint _2790 = uint(int(uint(int(_2788)) >> uint(2)));
    int _2792 = int(_2788) & 3;
    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[int(_2790)][_2792];
    int _2796 = int(_2788) + 1;
    uint _2798 = uint(int(uint(_2796) >> uint(2)));
    int _2800 = _2796 & 3;
    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[int(_2798)][_2800];
    float _2804 = fma(_2680, _2712, _2780);
    float _2806 = fma(_2696, _2612, _2782);
    int _2808 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2810 = _2740 + _2808;
    int _2812 = _2810 + 1;
    float _2814 = fma(_2696, _2606, _2804);
    float _2816 = _1976 + _2806;
    int _2818 = _2778 | _2812;
    int _2820 = _2742 + 56;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    uint _2824 = uint(int(uint(int(_2822)) >> uint(2)));
    int _2826 = int(_2822) & 3;
    float _2828 = (*spvDescriptorSet0.vp_c15)._m0[int(_2824)][_2826];
    int _2830 = int(_2822) + 1;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    int _2834 = _2830 & 3;
    float _2836 = (*spvDescriptorSet0.vp_c15)._m0[int(_2832)][_2834];
    float _2838 = _2018 + _2814;
    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2842 = _2816 + _2840;
    bool _2844 = _2818 < 0;
    bool _2846 = _2844 || _2784;
    float _2848 = _2606 * _2728;
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2852 = _2838 + _2850;
    float _2854 = _2842 * _2842;
    bool _2856 = _2812 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2858 = _2856 || _2846;
    int _2860 = _2742 + 64;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    uint _2864 = uint(int(uint(int(_2862)) >> uint(2)));
    int _2866 = int(_2862) & 3;
    float _2868 = (*spvDescriptorSet0.vp_c15)._m0[int(_2864)][_2866];
    int _2870 = int(_2862) + 1;
    uint _2872 = uint(int(uint(_2870) >> uint(2)));
    int _2874 = _2870 & 3;
    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[int(_2872)][_2874];
    float _2878 = -_2848;
    float _2880 = fma(_2612, _2712, _2878);
    float _2882 = fma(_2852, _2852, _2854);
    float _2884 = _2684 * _2880;
    float _2886 = sqrt(_2882);
    int _2888 = _2742 + 72;
    uint _2890 = uint(int(uint(_2888) >> uint(2)));
    uint _2892 = uint(int(uint(int(_2890)) >> uint(2)));
    int _2894 = int(_2890) & 3;
    float _2896 = (*spvDescriptorSet0.vp_c15)._m0[int(_2892)][_2894];
    int _2898 = int(_2890) + 1;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    int _2902 = _2898 & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    float _2906 = fma(_2680, _2734, _2884);
    int _2908 = as_type<int>(_2854);
    int _2910 = as_type<int>(_2884);
    float _2912 = _2838;
    float _2914 = _2816;
    float _2916 = _2882;
    float _2918 = as_type<float>(_2732);
    if (!_2858)
    {
        int _2920 = _2812 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2922 = _2920 + _2778;
        _2908 = _2922;
    }
    int _2924 = _2908;
    float _2926 = fma(_2696, _2620, _2906);
    int _2928 = _2742 + 104;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
    int _2934 = int(_2930) & 3;
    float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
    int _2938 = int(_2930) + 1;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    int _2942 = _2938 & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    if (!_2858)
    {
        int _2946 = _2924 << 2;
        _2716 = _2946;
    }
    int _2948 = _2716;
    float _2950 = _1926 + _2926;
    int _2952 = _2948;
    if (!_2858)
    {
        uint _2954 = uint(int(uint(_2924) >> uint(2)));
        _2910 = int(_2954);
    }
    int _2956 = _2910;
    float _2958 = as_type<float>(_2956);
    if (!_2858)
    {
        int _2960 = 12 & _2948;
        _2952 = _2960;
    }
    int _2962 = _2952;
    bool _2964 = _2886 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2858)
    {
        int _2966 = _2956 << 4;
        int _2968 = _2966 + _2962;
        _2958 = as_type<float>(_2968);
    }
    float _2970 = _2958;
    if (!_2964)
    {
        _2718 = _2838;
    }
    float _2972 = _2718;
    float _2974 = _2972;
    if (!_2964)
    {
        _2912 = _2950;
    }
    float _2976 = _2912;
    bool _2978 = !_2964;
    float _2980 = _2976;
    if (!_2978)
    {
        float _2982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2986 = _2886 + _2984;
        float _2988 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2990 = rsqrt(_2882);
        float _2992 = _2986 * _2982;
        float _2994 = _2992 * 0.15915493667125701904296875;
        float _2996 = _2994 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        float _3000 = _2994 * 6.283185482025146484375;
        float _3002 = sin(_3000);
        float _3004 = _2998 + (-1.0);
        float _3006 = fma(_3002, _2988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3008 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3010 = _2990 * _3006;
        float _3012 = fma(_2950, _2998, _3008);
        float _3014 = fma(_2852, _3010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3016 = fma(_2842, _3010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2980 = _3012;
        _2974 = _3014;
        _2914 = _3016;
        _2916 = _2990;
    }
    float _3018 = _2980;
    float _3020 = _2974;
    float _3022 = _2914;
    float _3024 = _2916;
    float _3026 = -_1926;
    float _3028 = _3026 + _3018;
    int _3030 = _2742 + 80;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    float _3048 = -_2018;
    float _3050 = _3048 + _3020;
    float _3052 = -_1976;
    float _3054 = _3052 + _3022;
    float _3056 = _3028 * _3028;
    float _3058 = _2596 * _2766;
    float _3060 = _3024;
    float _3062 = _3020;
    float _3064 = _3018;
    float _3066 = _3022;
    if (!_2858)
    {
        float _3068 = floor(_2702);
        _3060 = _3068;
    }
    float _3070 = _3060;
    float _3072 = _2596 * _2876;
    float _3074 = fma(_3050, _3050, _3056);
    int _3076 = _2742 + 88;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c15)._m0[int(_3088)][_3090];
    float _3094 = fma(_2464, _2758, _3058);
    float _3096 = fma(_2464, _2868, _3072);
    float _3098 = fma(_3054, _3054, _3074);
    float _3100 = fma(_2472, _2936, _3094);
    bool _3102 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3104 = isnan(0.5);
    bool _3106 = _3102 || _3104;
    bool _3108 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3110 = _3106 || _3108;
    float _3112 = sqrt(_3098);
    float _3114 = _2970;
    if (!_2858)
    {
        int _3116 = as_type<int>(_2970) + 400;
        uint _3118 = uint(int(uint(_3116) >> uint(2)));
        uint _3120 = uint(int(uint(int(_3118)) >> uint(2)));
        int _3122 = int(_3118) & 3;
        float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
        _3114 = _3124;
    }
    float _3126 = _3114;
    float _3128 = _3100 + _2944;
    float _3130 = _2596 * _2802;
    float _3132 = fma(_2472, _2896, _3096);
    float _3134 = fma(_2464, _2794, _3130);
    float _3136 = _3094;
    if (!_2858)
    {
        float _3138 = floor(_2710);
        _3136 = _3138;
    }
    float _3140 = _3136;
    float _3142 = fma(_2472, _2828, _3134);
    bool _3144 = _3112 > 0.0;
    float _3146 = 1.0 / _3128;
    bool _3148 = !_3144;
    float _3150 = _3146;
    if (!_3148)
    {
        float _3152 = _221 * _221;
        float _3154 = rsqrt(_3098);
        float _3156 = fma(_225, _225, _3152);
        float _3158 = fma(_227, _227, _3156);
        float _3160 = sqrt(_3158);
        float _3162 = _3050 * _3154;
        float _3164 = _3028 * _3154;
        float _3166 = _3054 * _3154;
        bool _3168 = _3160 > 0.0;
        bool _3170 = !_3168;
        if (!_3170)
        {
            float _3172 = rsqrt(_3158);
            float _3174 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3176 = _221 * _3172;
            float _3178 = _225 * _3172;
            float _3180 = _3164 * _3176;
            float _3182 = _227 * _3172;
            float _3184 = fma(_3162, _3178, _3180);
            float _3186 = _3174 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3188 = fma(_3166, _3182, _3184);
            float _3190 = _3188 * _3186;
            float _3192 = fma(_225, _3190, _3020);
            float _3194 = fma(_221, _3190, _3018);
            float _3196 = fma(_227, _3190, _3022);
            _3062 = _3192;
            _3064 = _3194;
            _3066 = _3196;
        }
    }
    float _3198 = _3062;
    float _3200 = _3064;
    float _3202 = _3066;
    float _3204 = -_2452;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3198);
    float _3208 = -_2450;
    float _3210 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3200);
    float _3212 = -_2460;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3202);
    float _3216 = _3142 + _2836;
    float _3218 = _3132 + _2904;
    float _3220 = _3210;
    float _3222 = _3206;
    float _3224 = _3214;
    if (!_3110)
    {
        float _3226 = _2468 * _2468;
        float _3228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3230 = -_1926;
        float _3232 = _3230 + _3200;
        float _3234 = fma(_2476, _2476, _3226);
        float _3236 = fma(_2482, _2482, _3234);
        float _3238 = 1.0 / _2656;
        float _3240 = sqrt(_3236);
        float _3242 = precise::min(_3240, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3244 = _3242 * _3228;
        float _3246 = -_1976;
        float _3248 = _3246 + _3202;
        float _3250 = _3244 * _3238;
        float _3252 = -_2018;
        float _3254 = _3252 + _3198;
        float _3256 = fma(_3232, _3250, _2458);
        float _3258 = fma(_3254, _3250, _2464);
        float _3260 = fma(_3248, _3250, _2472);
        _3220 = _3256;
        _3222 = _3258;
        _3224 = _3260;
        _2490 = _3240;
    }
    float _3262 = _3220;
    float _3264 = _3222;
    float _3266 = _3224;
    float _3268 = _2490;
    float _3270 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3272 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3274 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3276 = _3216 * _3146;
    float _3278 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3270);
    float _3280 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3272);
    float _3282 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3274);
    float _3284 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3278);
    bool _3288 = _3276 >= 0.0;
    float _3290 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3280);
    float _3292 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3282);
    float _3294 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3296 = _3218 * _3146;
    bool _3298 = _3276 <= 1.0;
    bool _3300 = _3298 && _3288;
    float _3302 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3304 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3310 = _3296 >= 0.0;
    bool _3312 = _3310 && _3300;
    float _3314 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3302);
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3320 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3322 = _3296 <= 1.0;
    bool _3324 = _3322 && _3312;
    float _3326 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3328 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3330 = -_3320;
    float _3332 = fma(_3330, _3318, 1.0);
    float _3334 = _2596 * _3046;
    float _3336 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3338 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3328);
    float _3340 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3342 = fma(_2464, _3038, _3334);
    float _3344 = log2(_3332);
    float _3346 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3336);
    float _3348 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3340);
    float _3350 = fma(_2472, _3084, _3342);
    float _3352 = _3268;
    float _3354 = _3338;
    if (_3324)
    {
        float _3356 = float(_2732);
        _2918 = _3356;
    }
    float _3358 = _2918;
    float _3360 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3346);
    float _3362 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3348);
    float _3364 = _3350 + _3092;
    float _3366 = 1.0 / _3338;
    float _3368 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3360);
    float _3370 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3362);
    if (!_2858)
    {
        float _3372 = -_3140;
        float _3374 = _2710 + _3372;
        _2720 = _3374;
    }
    float _3376 = _2720;
    if (!_2858)
    {
        float _3378 = -_3070;
        float _3380 = _2702 + _3378;
        _2722 = _3380;
    }
    float _3382 = _2722;
    float _3384 = _3364 * _3146;
    float _3386 = _2452;
    float _3388 = _3382;
    if (!_2858)
    {
        float _3390 = rint(_3126);
        float _3392 = precise::max(_3390, 0.0);
        uint _3394 = uint(_3392);
        uint _3396 = clamp(_3394, 0u, 65535u);
        _3386 = as_type<float>(_3396);
    }
    float _3398 = _3386;
    float _3400 = _3344 * 0.693147182464599609375;
    float _3402 = _3400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3404 = _3342;
    if (_3324)
    {
        float _3406 = rint(_3358);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3404 = as_type<float>(_3412);
    }
    float _3414 = _3404;
    float _3416 = _3368 * _3366;
    float _3418 = _3370 * _3366;
    float _3420 = fma(_3416, 0.5, 0.5);
    float _3422 = fma(_3418, -0.5, 0.5);
    float _3424 = _3398;
    if (!_2858)
    {
        float3 _9520 = float3(_3382, _3376, float(as_type<int>(_3398)));
        float3 _9524 = select(_9520, float3(0.0), isnan(_9520));
        float _3426 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9524.xy, uint(rint(_9524.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9524.xy, uint(rint(_9524.z)), level(0.0)).x;
        _3424 = _3426;
    }
    float _3428 = _3424;
    float _3430 = _2482;
    if (_3324)
    {
        float3 _9539 = float3(_3276, _3296, float(as_type<int>(_3414)));
        float3 _9541 = select(_9539, float3(0.0), isnan(_9539));
        float _3432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9541.xy, uint(rint(_9541.z)), _3384, level(0.0));
        _3430 = _3432;
    }
    float _3434 = _3430;
    float3 _9551 = float3(_3420, _3422, _3402);
    float _3436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9551, float3(0.0), isnan(_9551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9551, float3(0.0), isnan(_9551)), level(0.0)).x;
    float3 _9560 = float3(_3420, _3422, _3402);
    float4 _3439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9560, float3(0.0), isnan(_9560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9560, float3(0.0), isnan(_9560)), level(0.0)).xyzw;
    float _3441 = _3439.x;
    float _3443 = _3439.y;
    float _3445 = _3439.z;
    float _3447 = _3439.w;
    bool _3449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3451 = isnan(0.5);
    bool _3453 = _3449 || _3451;
    bool _3455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3457 = _3453 || _3455;
    if (_2858)
    {
        _3352 = 1.0;
    }
    float _3459 = _3352;
    float _3461 = _3459;
    if (_3457)
    {
        _3150 = 1.0;
    }
    float _3463 = _3150;
    float _3465 = _3463;
    float _3467 = _3441;
    if (!_3457)
    {
        float _3469 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3471 = _3469 * 0.15915493667125701904296875;
        float _3473 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3475 = _3471 * 6.283185482025146484375;
        float _3477 = cos(_3475);
        float _3479 = _3473 * 0.15915493667125701904296875;
        float _3481 = _3471 * 6.283185482025146484375;
        float _3483 = sin(_3481);
        float _3485 = 1.0 / _3477;
        float _3487 = _3479 * 6.283185482025146484375;
        float _3489 = cos(_3487);
        float _3491 = _3483 * _3485;
        float _3493 = _3479 * 6.283185482025146484375;
        float _3495 = sin(_3493);
        float _3497 = _3489 * _3491;
        float _3499 = 1.0 / _3497;
        float _3501 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3503 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3501;
        float _3505 = 1.0 / _3503;
        float _3507 = _3495 * _3499;
        float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3511 = fma(_2676, _3507, _3509);
        float _3513 = _3511 * _3505;
        float _3515 = precise::clamp(_3513, 0.0, 1.0);
        _3465 = _3515;
    }
    float _3517 = _3465;
    if (!_2858)
    {
        int _3519 = _2924 << 4;
        int _3521 = _3519 + 2048;
        uint _3523 = uint(int(uint(_3521) >> uint(2)));
        uint _3525 = uint(int(uint(int(_3523)) >> uint(2)));
        int _3527 = int(_3523) & 3;
        float _3529 = (*spvDescriptorSet0.vp_c15)._m0[int(_3525)][_3527];
        int _3531 = int(_3523) + 1;
        uint _3533 = uint(int(uint(_3531) >> uint(2)));
        int _3535 = _3531 & 3;
        float _3537 = (*spvDescriptorSet0.vp_c15)._m0[int(_3533)][_3535];
        int _3539 = _3521 + 8;
        uint _3541 = uint(int(uint(_3539) >> uint(2)));
        uint _3543 = uint(int(uint(int(_3541)) >> uint(2)));
        int _3545 = int(_3541) & 3;
        float _3547 = (*spvDescriptorSet0.vp_c15)._m0[int(_3543)][_3545];
        int _3549 = int(_3541) + 1;
        uint _3551 = uint(int(uint(_3549) >> uint(2)));
        int _3553 = _3549 & 3;
        float _3555 = (*spvDescriptorSet0.vp_c15)._m0[int(_3551)][_3553];
        float _3557 = _2596 * _3537;
        float _3559 = fma(_2464, _3529, _3557);
        float _3561 = fma(_2472, _3547, _3559);
        float _3563 = _3561 + _3555;
        float _3565 = precise::clamp(_3563, 0.0, 1.0);
        float _3567 = -_3565;
        float _3569 = _3567 + _3428;
        float _3571 = fma(_3569, 500.0, 1.5);
        float _3573 = exp2(_3571);
        float _3575 = 0.0 + _3573;
        float _3577 = precise::clamp(_3575, 0.0, 1.0);
        _2724 = _3557;
        _3461 = _3577;
    }
    float _3579 = _2724;
    float _3581 = _3461;
    float _3583 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3585 = _3262 + _3583;
    float _3587 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3589 = _3264 + _3587;
    float _3591 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3593 = _3266 + _3591;
    float _3595 = _3585 * _3585;
    float _3597 = fma(_3589, _3589, _3595);
    float _3599 = fma(_3593, _3593, _3597);
    float _3601 = rsqrt(_3599);
    float _3603 = sqrt(_3599);
    float _3605 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3607 = _3589 * _3605;
    float _3609 = _3593 * _3605;
    float _3611 = _3607 * _3607;
    float _3613 = _3609 * _3609;
    float _3615 = _3611 + _3613;
    float _3617 = sqrt(_3615);
    bool _3619 = _3617 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3623 = _3617 + _3621;
    float _3625 = _3597;
    float _3627 = _3601;
    float _3629 = _3623;
    float _3631 = _3585;
    float _3633 = _3579;
    if (_3619)
    {
        float _3635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3625 = _3635;
    }
    float _3637 = _3625;
    if (_3619)
    {
        float _3639 = rsqrt(_3615);
        _3627 = _3639;
    }
    float _3641 = _3627;
    float _3643 = _3641;
    if (_3619)
    {
        float _3645 = _3623 * _3637;
        _3629 = _3645;
    }
    float _3647 = _3629;
    if (_3619)
    {
        float _3649 = _3647 * 0.15915493667125701904296875;
        _2492 = _3649;
    }
    float _3651 = _2492;
    float _3653 = _3593;
    if (_3619)
    {
        float _3655 = _3651 * 6.283185482025146484375;
        float _3657 = sin(_3655);
        _3653 = _3657;
    }
    float _3659 = _3653;
    float _3661 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3663 = precise::max(0.0, _3661);
    float _3665 = _3637;
    float _3667 = _3663;
    if (_3619)
    {
        float _3669 = _3651 * 6.283185482025146484375;
        float _3671 = cos(_3669);
        _3665 = _3671;
    }
    float _3673 = _3665;
    float _3675 = -_3605;
    float _3677 = -_3663;
    float _3679 = fma(_3585, _3675, _3677);
    if (_3619)
    {
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3631 = _3681;
    }
    float _3683 = _3631;
    float _3685 = _3683;
    float _3687 = _3659;
    if (_3619)
    {
        float _3689 = fma(_3659, _3683, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3685 = _3689;
    }
    float _3691 = _3685;
    float _3693 = _3691;
    if (!_3619)
    {
        _3687 = _3607;
    }
    float _3695 = _3687;
    float _3697 = _3695;
    float _3699 = _3673;
    if (_3619)
    {
        float _3701 = _3673 + (-1.0);
        _3667 = _3701;
    }
    float _3703 = _3667;
    float _3705 = _3703;
    if (_3619)
    {
        float _3707 = _3641 * _3691;
        _3388 = _3707;
    }
    float _3709 = _3388;
    if (!_3619)
    {
        _3693 = _3679;
    }
    float _3711 = _3693;
    float _3713 = _3711;
    if (_3619)
    {
        float _3715 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3633 = _3715;
    }
    float _3717 = _3633;
    if (_3619)
    {
        float _3719 = _3607 * _3709;
        _3697 = _3719;
    }
    float _3721 = _3697;
    if (!_3619)
    {
        _3705 = _3609;
    }
    float _3723 = _3705;
    float _3725 = _3723;
    if (_3619)
    {
        float _3727 = _3609 * _3709;
        _3725 = _3727;
    }
    float _3729 = _3725;
    if (!_3619)
    {
        _3643 = _3611;
    }
    float _3731 = _3643;
    float _3733 = _3731;
    if (_3619)
    {
        float _3735 = fma(_3679, _3673, _3717);
        _3713 = _3735;
    }
    float _3737 = _3713;
    if (_3619)
    {
        float _3739 = _3721 * _3721;
        _3733 = _3739;
    }
    float _3741 = _3733;
    if (!_3619)
    {
        _3699 = _3613;
    }
    float _3743 = _3699;
    float _3745 = _3743;
    if (_3619)
    {
        float _3747 = _3729 * _3729;
        _3745 = _3747;
    }
    float _3749 = _3745;
    float _3751 = fma(_3737, _3737, _3741);
    float _3753 = _3751 + _3749;
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3757 = fma(_3603, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3755);
    float _3759 = precise::clamp(_3757, 0.0, 1.0);
    float _3761 = rsqrt(_3753);
    float _3763 = -_3759;
    float _3765 = _3763 + 1.0;
    float _3767 = abs(_3765);
    float _3769 = log2(_3767);
    float _3771 = _3761 * _3721;
    float _3773 = _3761 * _3737;
    float _3775 = _3761 * _3729;
    float _3777 = _3771 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3779 = -_3777;
    float _3781 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3779);
    float _3783 = -_3775;
    float _3785 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3781);
    float _3787 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3789 = fma(_3785, -0.5, 0.5);
    float _3791 = fma(_3785, 0.5, 0.5);
    float _3793 = exp2(_3787);
    float _3795 = fma(_3791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3797 = fma(_3791, _3795, -0.212114393711090087890625);
    float _3799 = _3773 + 1.0;
    float _3801 = sqrt(_3789);
    float _3803 = fma(_3791, _3797, 1.570728778839111328125);
    float _3805 = -_3773;
    float _3807 = fma(_3793, _3799, _3805);
    float _3809 = _3801 * 0.636619746685028076171875;
    float _3811 = fma(_3807, 0.5, 0.5);
    float _3813 = -_3803;
    float _3815 = fma(_3809, _3813, 1.0);
    float2 _10127 = float2(_3815, _3811);
    float3 _3819 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10127, float2(0.0), isnan(_10127)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10127, float2(0.0), isnan(_10127)), level(0.0)).xyz;
    float _3821 = _3819.x;
    float _3823 = _3819.y;
    float _3825 = _3819.z;
    float _3827 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3829 = abs(_2676);
    float _3831 = log2(_3829);
    float _3833 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3835 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3837 = fma(_3827, _3827, 1.0);
    float _3839 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3833);
    float _3841 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_86.x = _2712;
    out.m_86.y = _2734;
    out.m_86.z = _2728;
    float _3843 = rsqrt(_3837);
    float _3845 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3839);
    bool _3847 = _2676 <= 8000.0;
    bool _3849 = isnan(_2676);
    bool _3851 = _3847 || _3849;
    bool _3853 = isnan(8000.0);
    bool _3855 = _3851 || _3853;
    float _3857 = float(_3855);
    float _3859 = -_2518;
    float _3861 = _3859 + 1.0;
    out.m_88.x = _3264;
    out.m_88.y = _3262;
    out.m_88.z = _3266;
    float _3863 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3845);
    bool _3865 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3867 = isnan(_3603);
    bool _3869 = _3865 || _3867;
    bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3873 = _3869 || _3871;
    float _3875 = _3831 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3877 = exp2(_3835);
    out.gl_Position.x = _3368;
    out.gl_Position.y = _3370;
    out.gl_Position.z = _3863;
    out.gl_Position.w = _3338;
    float _3879 = _3827 * _3843;
    float _3881 = exp2(_3875);
    float _3883 = -_2612;
    float _3885 = _3879 * _3883;
    float _3887 = -_2606;
    float _3889 = _3879 * _3887;
    float _3891 = -_2620;
    float _3893 = _3879 * _3891;
    float _3895 = fma(_3843, _2748, _3885);
    float _3897 = fma(_3843, _2770, _3889);
    float _3899 = _3863 + _3338;
    float _3901 = _3827 * _2770;
    float _3903 = -_3877;
    float _3905 = _3903 + 1.0;
    float _3907 = fma(_3843, _2880, _3893);
    float _3909 = _3899 * 0.5;
    float _3911 = fma(_3841, _2712, _3901);
    float _3913 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = _3905 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3919 = _2606 + _3911;
    out.m_90.x = _3897;
    out.m_90.y = _3907;
    out.m_90.z = _3895;
    float _3921 = fma(_3915, -2.0, 3.0);
    float _3923 = _3915 * _3915;
    float _3925 = _3827 * _2880;
    float _3927 = _3827 * _2748;
    float _3929 = _3923 * _3921;
    float _3931 = fma(_3841, _2734, _3925);
    float _3933 = fma(_3841, _2728, _3927);
    float _3935 = _3905;
    if (!_3873)
    {
        _3354 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3937 = _3354;
    float _3939 = -_3929;
    float _3941 = _3939 + 1.0;
    float _3943 = _2620 + _3931;
    float _3945 = _3917 * _3436;
    float _3947 = -_3917;
    float _3949 = _3947 + 1.0;
    float _3951 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3929);
    float _3953 = _3941;
    float _3955 = _3949;
    float _3957 = _3937;
    float _3959 = _3937;
    if (!_3324)
    {
        _3953 = 1.0;
    }
    float _3961 = _3953;
    float _3963 = _3447 * _3945;
    float _3965 = _3961;
    if (_3324)
    {
        bool _3967 = _3434 >= _3384;
        bool _3969 = isnan(_3434);
        bool _3971 = _3967 || _3969;
        bool _3973 = isnan(_3384);
        bool _3975 = _3971 || _3973;
        float _3977 = float(_3975);
        _3965 = _3977;
    }
    float _3979 = _3965;
    float _3981 = _3857 * _3951;
    float _3983 = _2612 + _3933;
    float _3985 = _3447 * _3949;
    out.m_92.z = _3909;
    out.m_92.w = _3338;
    float _3987 = _3981 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3989 = _3979 * _3581;
    float _3991 = _3989;
    if (!_3873)
    {
        _3955 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3993 = _3955;
    out.m_94.x = _3919;
    out.m_94.y = _3943;
    out.m_94.z = _3983;
    float _3995 = _3861 * _3987;
    float _3997 = precise::clamp(_3995, 0.0, 1.0);
    float _3999 = _3993;
    float _4001 = _3993;
    if (!_3873)
    {
        _3935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4003 = _3935;
    float _4005 = -_3997;
    float _4007 = fma(_4005, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4009 = -_3989;
    float _4011 = fma(_4009, _4007, 1.0);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = _4003;
    float _4017 = _4003;
    if (!_3873)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4019 = _3991;
    float _4021 = _4013 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4021;
    float _4023 = _4021;
    float _4025 = _4019;
    float _4027 = _4019;
    if (!_3873)
    {
        _4023 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4029 = _4023;
    float _4031 = _3825 * _3945;
    float _4033 = fma(_3821, _3963, _3441);
    float _4035 = fma(_3823, _3963, _3443);
    float _4037 = _3517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4039 = fma(_3447, _4031, _3445);
    float _4041 = _4029;
    float _4043 = _4029;
    if (!_3873)
    {
        _3467 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4045 = _3467;
    out.m_98.x = _4033;
    out.m_98.y = _4035;
    out.m_98.z = _4039;
    out.m_98.w = _3985;
    bool _4047 = !_3873;
    float _4049 = _4045;
    float _4051 = _4045;
    if (!_4047)
    {
        bool _4053 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4055 = isnan(_3603);
        bool _4057 = _4053 || _4055;
        bool _4059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4061 = _4057 || _4059;
        if (!_4061)
        {
            float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4065 = _3603 + _4063;
            float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4067;
            float _4071 = 1.0 / _4069;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4087 = _4085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4093 = _4065 * _4071;
            float _4095 = precise::clamp(_4093, 0.0, 1.0);
            float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4099 = _4097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4101 = fma(_4095, _4075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4103 = fma(_4095, _4099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4105 = fma(_4095, _4079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4107 = fma(_4095, _4083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4109 = fma(_4095, _4087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4111 = fma(_4095, _4091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3959 = _4103;
            _4027 = _4109;
            _4051 = _4101;
            _4017 = _4107;
            _4001 = _4105;
            _4043 = _4111;
            _4113 = true;
        }
        else
        {
            bool _4115 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4117 = isnan(_3603);
            bool _4119 = _4115 || _4117;
            bool _4121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4123 = _4119 || _4121;
            if (!_4123)
            {
                _4049 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4125 = _4049;
            _4051 = _4125;
            if (!_4123)
            {
                _3957 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4127 = _3957;
            _3959 = _4127;
            if (!_4123)
            {
                _3999 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4129 = _3999;
            _4001 = _4129;
            if (!_4123)
            {
                _4015 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4131 = _4015;
            _4017 = _4131;
            if (!_4123)
            {
                _4025 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4133 = _4025;
            _4027 = _4133;
            if (!_4123)
            {
                _4041 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4135 = _4041;
            bool _4137 = !_4123;
            _4043 = _4135;
            if (!_4137)
            {
                bool _4139 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4141 = isnan(_3603);
                bool _4143 = _4139 || _4141;
                bool _4145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4147 = _4143 || _4145;
                if (!_4147)
                {
                    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4151 = _3603 + _4149;
                    float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4153;
                    float _4157 = 1.0 / _4155;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4179 = _4151 * _4157;
                    float _4181 = precise::clamp(_4179, 0.0, 1.0);
                    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4187 = fma(_4181, _4161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4189 = fma(_4181, _4185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4191 = fma(_4181, _4165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4193 = fma(_4181, _4169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4195 = fma(_4181, _4173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4197 = fma(_4181, _4177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3959 = _4189;
                    _4027 = _4195;
                    _4051 = _4187;
                    _4017 = _4193;
                    _4001 = _4191;
                    _4043 = _4197;
                    _4113 = true;
                }
                else
                {
                    _3959 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4027 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4051 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4017 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4001 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4043 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4113 = false;
    float _4199 = _3959;
    float _4201 = _4027;
    float _4203 = _4051;
    float _4205 = _4017;
    float _4207 = _4001;
    float _4209 = _4043;
    float _4211 = fma(_3943, -0.5, 0.5);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -_4199;
    float _4217 = _4215 + _4201;
    float _4219 = _4037 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4221 = -_4203;
    float _4223 = _4221 + _4205;
    out.m_100.x = 0.0;
    float _4225 = fma(_4213, _4217, _4199);
    float _4227 = fma(_4213, _4223, _4203);
    out.m_59.x = _4219;
    float _4229 = -_4207;
    float _4231 = _4229 + _4209;
    float _4233 = _4225 * 0.586610972881317138671875;
    bool _4235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4237 = fma(_4213, _4231, _4207);
    float _4239 = fma(_4227, 0.298911988735198974609375, _4233);
    bool _4241 = _3517 > 0.0;
    bool _4243 = isnan(_3517);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan(0.0);
    bool _4249 = _4245 || _4247;
    float _4251 = fma(_4237, 0.114477999508380889892578125, _4239);
    float _4253 = -_4251;
    float _4255 = _4227 + _4253;
    float _4257 = -_4251;
    float _4259 = _4225 + _4257;
    float _4261 = -_4251;
    float _4263 = _4237 + _4261;
    float _4265 = fma(_4255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    float _4267 = fma(_4259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    float _4269 = fma(_4263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    bool _4271 = !_4235;
    if (!_4271)
    {
        float _4273 = -_3262;
        float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4277 = -_3264;
        float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4281 = -_3266;
        float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4285 = _4275 * _4275;
        float _4287 = fma(_4279, _4279, _4285);
        float _4289 = fma(_4283, _4283, _4287);
        float _4291 = sqrt(_4289);
        float _4293 = rsqrt(_4289);
        float _4295 = -_4291;
        float _4297 = _4295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4299 = _4297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4301 = precise::clamp(_4299, 0.0, 1.0);
        float _4303 = _4279 * _4293;
        float _4305 = _4275 * _4293;
        float _4307 = abs(_4301);
        float _4309 = log2(_4307);
        float _4311 = _4283 * _4293;
        float _4313 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4315 = _3943 * _4305;
        float _4317 = -_4305;
        float _4319 = -_4313;
        float _4321 = fma(_4317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4319);
        float _4323 = fma(_3919, _4303, _4315);
        float _4325 = -_4311;
        float _4327 = fma(_4325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4321);
        float _4329 = fma(_3983, _4311, _4323);
        float _4331 = precise::clamp(_4329, 0.0, 1.0);
        float _4333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4335 = _4327 + _4333;
        float _4337 = _4309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4339 = _4335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4341 = precise::clamp(_4339, 0.0, 1.0);
        float _4343 = exp2(_4337);
        float _4345 = _4343 * _4341;
        float _4347 = _4331 * _4345;
        float _4349 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4351 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4353 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4349;
        out.m_100.y = _4351;
        out.m_100.z = _4353;
    }
    out.m_102.x = _4265;
    out.m_102.y = _4267;
    out.m_102.z = _4269;
    if (_4249)
    {
        return out;
    }
    float _4355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4355;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4113 = false;
    bool _969 = false;
    bool _801 = false;
    bool _581 = false;
    bool _405 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4412 = as_type<float>(_137);
        out.gl_Position.z = _4412;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_61.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_151)
    {
        float _157 = float(_121);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _155 >= _159;
    bool _163 = !_151;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_59.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _139 = as_type<int>(_171);
    }
    int _173 = _139;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4481 = as_type<float>(_173);
        out.gl_Position.z = _4481;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_66.x;
    float _179 = in.m_66.y;
    float _181 = in.m_66.z;
    float _183 = in.m_68.x;
    float _185 = in.m_68.y;
    float _187 = in.m_68.z;
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    float _195 = in.m_72.x;
    float _197 = in.m_72.y;
    float _199 = in.m_72.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = _179 * _185;
    float _213 = _179 * _191;
    float _215 = fma(_177, _183, _211);
    float _217 = _179 * _197;
    float _219 = fma(_177, _189, _213);
    float _221 = fma(_181, _187, _215);
    float _223 = fma(_177, _195, _217);
    float _225 = fma(_181, _193, _219);
    float _227 = fma(_181, _199, _223);
    bool _229 = !_203;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_207;
    float _235 = _233 ? (-0.5) : 0.5;
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_74.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_121);
        float _261 = 1.0 / _259;
        float _263 = _155 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    bool _271 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_265);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _285;
    bool _305 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_265);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _319 = 1.0 / _289;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = _269 * _303;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _265 + _327;
    float _331 = -_281;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = fma(_323, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = _301 * _333;
    float _347 = fma(_337, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = _315 * _341;
    float _351 = _329 * _319;
    float _353 = -_315;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _347 * _349;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = _343 * _349;
    float _369 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _361);
    float _373 = fma(_365, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _377 = fma(_369, _345, _371);
    float _379 = fma(_373, _345, _375);
    float _381 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].x, _377);
    float _383 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[145].y, _379);
    bool _385 = !_317;
    float _403;
    if (!_385)
    {
        float _387 = in.m_74.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].x, _155);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_121);
        float _409 = 1.0 / _407;
        float _411 = _155 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_76.x;
    float _417 = in.m_76.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _413 + _419;
    bool _423 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_413);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = 1.0 / _437;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _447 = 1.0 / _441;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _449;
    float _453 = _421 * _443;
    bool _455 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _457 = isnan(_413);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _469 = _413 + _467;
    float _471 = _383 * _417;
    bool _473 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _475 = isnan(_413);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -_465;
    float _491 = _489 + 1.0;
    float _493 = fma(_451, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _495 = _469 * _447;
    float _497 = fma(_487, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = _483 * _491;
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _505;
    float _509 = _381 * _415;
    float _511 = _433 * _503;
    float _513 = fma(_507, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _515 = -_433;
    float _517 = _515 + 1.0;
    float _519 = _497 * _511;
    float _521 = _513 * _511;
    float _523 = _493 * _511;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _537 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].y, _519);
    float _539 = fma(_527, _495, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _541 = fma(_531, _495, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].x, _521);
    float _545 = fma(_535, _495, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _549 = fma(_539, _499, _537);
    float _551 = fma(_541, _499, _543);
    float _553 = fma(_545, _499, _547);
    float _555 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].y, _549);
    float _557 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].x, _551);
    float _559 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[109].z, _553);
    bool _561 = !_445;
    float _579;
    if (!_561)
    {
        float _563 = in.m_74.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_121);
        float _585 = 1.0 / _583;
        float _587 = _155 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = _557 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _593 = _555 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    float _603 = 1.0 / _597;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _615 = isnan(_589);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _627 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _629 = isnan(_589);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = 1.0 / _607;
    bool _641 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _643 = isnan(_589);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_623;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = -_651;
    float _661 = _659 + 1.0;
    float _663 = _651 * _655;
    float _665 = _601 * _603;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _589 + _667;
    float _671 = 1.0 / _611;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = _637 * _661;
    float _679 = fma(_665, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _685 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _687 = isnan(_589);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _697;
    float _701 = _675 * _639;
    float _703 = 1.0 / _683;
    float _705 = _679 * _677;
    float _707 = -_695;
    float _709 = _707 + 1.0;
    float _711 = -_637;
    float _713 = _711 + 1.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _719 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _623 * _709;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _725 = _589 + _723;
    float _727 = _699 * _671;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _589 + _729;
    bool _733 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _735 = isnan(_589);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _747 = fma(_727, _725, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _749 = fma(_701, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _753 = _589 + _751;
    float _755 = -_743;
    float _757 = _755 + 1.0;
    float _759 = _717 * _703;
    float _761 = fma(_749, _663, _745);
    float _763 = _695 * _757;
    float _765 = fma(_759, _753, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _767 = fma(_747, _721, _761);
    float _769 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = fma(_765, _763, _767);
    float _773 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[119].x, _771);
    float _777 = _775 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_78.x = _773;
    out.m_78.y = _769;
    out.m_78.z = _719;
    out.m_78.w = _777;
    bool _779 = !_657;
    float _781 = _639;
    float _799;
    if (!_779)
    {
        float _783 = in.m_74.x;
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[11].z, _155);
        float _791 = _789 * _785;
        float _793 = floor(_791);
        float _795 = -_793;
        float _797 = _791 + _795;
        _799 = _797;
        _801 = true;
    }
    else
    {
        float _803 = float(_121);
        float _805 = 1.0 / _803;
        float _807 = _155 * _805;
        _799 = _807;
    }
    _801 = false;
    float _809 = _799;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _809 + _811;
    bool _815 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = isnan(_809);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _829 = _809 + _827;
    bool _831 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _833 = isnan(_809);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _851 = _809 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _853 = isnan(_809);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_825;
    float _865 = _863 + 1.0;
    float _867 = 1.0 / _849;
    float _869 = _861 * _865;
    float _871 = -_861;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _875;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _881 = 1.0 / _845;
    float _883 = _841 * _873;
    float _885 = -_841;
    float _887 = _885 + 1.0;
    float _889 = _829 * _867;
    float _891 = _813 * _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = fma(_877, _891, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _903 = fma(_895, _891, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _905 = fma(_899, _891, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _907 = _901 * _883;
    float _909 = _903 * _883;
    float _911 = _905 * _883;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _925 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].x, _907);
    float _927 = fma(_915, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _929 = fma(_919, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _931 = fma(_923, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _933 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].y, _909);
    float _935 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[123].z, _911);
    float _937 = fma(_927, _869, _925);
    float _939 = fma(_929, _869, _933);
    float _941 = fma(_931, _869, _935);
    float _943 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].x, _937);
    float _945 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].y, _939);
    float _947 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[125].z, _941);
    bool _949 = !_879;
    float _967;
    if (!_949)
    {
        float _951 = in.m_74.x;
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _959 = _957 * _953;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _965;
        _969 = true;
    }
    else
    {
        float _971 = float(_121);
        float _973 = 1.0 / _971;
        float _975 = _155 * _973;
        _967 = _975;
    }
    _969 = false;
    float _977 = _967;
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _981 = int(_979);
    float _983 = float(_121);
    float _985 = _947 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _989 = _987 != 0;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _993 = int(_991);
    float _995 = float(_981);
    float _997 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _999 = int(_997);
    if (_989)
    {
        float _1001 = in.m_74.x;
        _781 = _1001;
    }
    float _1003 = _781;
    float _1005 = float(uint(_993));
    float _1007 = 1.0 / _995;
    int _1009 = ~_993;
    int _1011 = _1009 + 1;
    float _1013 = _1003;
    if (!_989)
    {
        float _1015 = in.m_74.y;
        _1013 = _1015;
    }
    float _1017 = _1013;
    bool _1019 = _993 == 0;
    float _1021 = 1.0 / _1005;
    int _1023 = ~_993;
    int _1025 = _1023 + 1;
    float _1027 = float(uint(_999));
    int _1029 = ~_999;
    int _1031 = _1029 + 1;
    float _1033 = _155 * _1007;
    float _1035 = 1.0 / _983;
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = trunc(_1033);
    int _1041 = int(_1039);
    float _1043 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1045 = int(_1043);
    float _1047 = float(uint(_1041));
    float _1049 = 1.0 / _1027;
    float _1051 = as_type<float>(_1037) * _1047;
    float _1053 = float(_1045);
    float _1055 = trunc(_1051);
    float _1057 = precise::max(_1055, 0.0);
    uint _1060 = uint(_1057);
    float _1062 = 1.0 / _1053;
    float _1064 = _1051;
    if (_989)
    {
        _1064 = 1.0;
    }
    float _1066 = _1064;
    float _1068 = _1066;
    if (!_989)
    {
        _1068 = 7.345489978790283203125;
    }
    float _1070 = _1068;
    int _1072 = _1025 * int(_1060);
    int _1074 = _1072 + _1041;
    float _1076 = float(uint(_1074));
    float _1078 = in.m_74.x;
    float _1080 = in.m_74.y;
    float _1082 = in.m_74.z;
    float _1084 = in.m_74.w;
    float _1086 = _155 * _1062;
    float _1088 = as_type<float>(_1037) * _1076;
    float _1090 = trunc(_1086);
    int _1092 = int(_1090);
    float _1094 = trunc(_1088);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = float(uint(_1092));
    float _1102 = _1070 * _1078;
    float _1104 = float(_1041);
    float _1106 = floor(_1102);
    int _1108 = int(_1060) + int(_1098);
    float _1110 = float(_993);
    int _1112 = _1011 * _1108;
    int _1114 = _1112 + _1041;
    bool _1116 = _1104 >= _1110;
    bool _1118 = isnan(_1104);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(_1110);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    int _1128 = as_type<int>(_1049) + (-2);
    bool _1130 = uint(_1114) >= uint(_993);
    float _1132 = trunc(_1126);
    int _1134 = int(_1132);
    float _1136 = as_type<float>(_1128) * _1100;
    bool _1138 = !_1130;
    int _1140 = _1138 ? 0 : (-1);
    float _1142 = -_1106;
    float _1144 = _1102 + _1142;
    float _1146 = _155 * _1035;
    int _1148 = ~_1108;
    int _1150 = _1148 + _1140;
    int _1152 = _1150 + 1;
    float _1154 = _1144 * _1110;
    float _1156 = trunc(_1136);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    float _1162 = _1146 * _1110;
    int _1164 = _993 * _1152;
    int _1166 = _1164 + _1041;
    float _1168 = _1144;
    float _1170 = _1082;
    if (_989)
    {
        _1168 = 1.0;
    }
    float _1172 = _1168;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1176 = _1174 != 0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1180 = _1178 != 0;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1184 = _1182 != 0;
    int _1186 = ~_1134;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    bool _1192 = !_1019;
    int _1194 = _1192 ? _1166 : (-1);
    int _1196 = _993 + (-1);
    float _1198 = trunc(_1162);
    int _1200 = int(_1198);
    float _1202 = _1172;
    if (!_989)
    {
        _1202 = 1.2345600128173828125;
    }
    float _1204 = _1202;
    int _1206 = _1194 * _1190;
    int _1208 = _1031 * int(_1160);
    int _1210 = _1208 + _1092;
    int _1212 = _1134 * _1196;
    int _1214 = _1212 + _1206;
    float _1216 = _1017 * _1204;
    bool _1218 = !_1176;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = float(uint(_1210));
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1226 = _1224 != 0;
    float _1228 = trunc(_1154);
    int _1230 = int(_1228);
    bool _1232 = !_1180;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = as_type<float>(_1128) * _1222;
    bool _1238 = !_1226;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = abs(_1234);
    int _1244 = abs(_1240);
    float _1246 = trunc(_1236);
    float _1248 = precise::max(_1246, 0.0);
    uint _1250 = uint(_1248);
    int _1252 = abs(_1220);
    bool _1254 = !_1184;
    int _1256 = _1254 ? 0 : 1;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1260 = _1258 != 0;
    int _1262 = abs(_1256);
    int _1264 = _1214 * _1242;
    int _1266 = _1230 * _1244;
    int _1268 = _1266 + _1041;
    bool _1270 = !_1260;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = _1200 * _1252;
    int _1276 = _1274 + _1264;
    int _1278 = abs(_1272);
    int _1280 = int(_1160) + int(_1250);
    int _1282 = _1268 * _1262;
    int _1284 = _1282 + _1276;
    int _1286 = ~_999;
    int _1288 = _1286 + 1;
    float _1290 = float(_999);
    float _1292 = floor(_1216);
    float _1294 = float(_1092);
    int _1296 = _1288 * _1280;
    int _1298 = _1296 + _1092;
    bool _1300 = _999 == 0;
    int _1302 = _1230 * _1278;
    int _1304 = _1302 + _1284;
    bool _1306 = _1294 >= _1290;
    bool _1308 = isnan(_1294);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(_1290);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    bool _1318 = uint(_1298) >= uint(_999);
    float _1320 = float(uint(_1304));
    float _1322 = trunc(_1316);
    int _1324 = int(_1322);
    bool _1326 = !_1318;
    int _1328 = _1326 ? 0 : (-1);
    float _1330 = as_type<float>(_1037) * _1320;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1334 = _1332 != 0;
    float _1336 = -_1292;
    float _1338 = _1216 + _1336;
    int _1340 = ~_1280;
    int _1342 = _1340 + _1328;
    int _1344 = _1342 + 1;
    float _1346 = trunc(_1330);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    float _1352 = _1338 * _1290;
    int _1354 = ~_993;
    int _1356 = _1354 + 1;
    int _1358 = _999 * _1344;
    int _1360 = _1358 + _1092;
    float _1362 = _1146 * _1290;
    bool _1364 = !_1334;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1352);
    int _1370 = int(_1368);
    int _1372 = ~_1324;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1300;
    int _1380 = _1378 ? _1360 : (-1);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1396 = _1394 != 0;
    int _1398 = abs(_1366);
    int _1400 = _1380 * _1376;
    int _1402 = _999 + (-1);
    int _1404 = _1356 * int(_1350);
    int _1406 = _1404 + _1304;
    bool _1408 = !_1384;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = trunc(_1362);
    int _1414 = int(_1412);
    bool _1416 = !_1388;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = _1324 * _1402;
    int _1422 = _1420 + _1400;
    int _1424 = abs(_1410);
    int _1426 = _1370 * _1398;
    int _1428 = _1426 + _1092;
    bool _1430 = !_1392;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = float(uint(_1268));
    int _1436 = abs(_1418);
    float _1438 = float(uint(_1406));
    int _1440 = abs(_1432);
    float _1442 = as_type<float>(_1037) * _1434;
    int _1444 = _1422 * _1436;
    float _1446 = as_type<float>(_1037) * _1438;
    bool _1448 = !_1396;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = _1414 * _1424;
    int _1454 = _1452 + _1444;
    float _1456 = trunc(_1442);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = abs(_1450);
    float _1464 = float(uint(_1428));
    int _1466 = _1428 * _1440;
    int _1468 = _1466 + _1454;
    int _1470 = ~_993;
    int _1472 = _1470 + 1;
    int _1474 = ~_993;
    int _1476 = _1474 + 1;
    float _1478 = trunc(_1446);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    float _1484 = as_type<float>(_1128) * _1464;
    int _1486 = _1370 * _1462;
    int _1488 = _1486 + _1468;
    int _1490 = ~_999;
    int _1492 = _1490 + 1;
    float _1494 = float(uint(_1488));
    float _1496 = trunc(_1484);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = _1472 * int(_1460);
    int _1504 = _1502 + _1268;
    bool _1506 = _993 == 0;
    float _1508 = as_type<float>(_1128) * _1494;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1512 = _1510 != 0;
    float _1514 = trunc(_1508);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    int _1520 = int(_1350) + int(_1482);
    float _1522 = float(uint(_1504));
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1528 = ~_999;
    int _1530 = _1528 + 1;
    int _1532 = _1476 * _1520;
    int _1534 = _1532 + _1304;
    float _1536 = as_type<float>(_1037) * _1522;
    int _1538 = _1492 * int(_1500);
    int _1540 = _1538 + _1428;
    int _1542 = ~_999;
    int _1544 = _1542 + 1;
    bool _1546 = uint(_1534) >= uint(_993);
    float _1548 = trunc(_1536);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    float _1554 = float(uint(_1540));
    bool _1556 = !_1546;
    int _1558 = _1556 ? 0 : (-1);
    int _1560 = 0;
    if (_1512)
    {
        _1560 = 0;
    }
    int _1562 = _1560;
    float _1564 = as_type<float>(_1128) * _1554;
    int _1566 = ~_1520;
    int _1568 = _1566 + _1558;
    int _1570 = _1568 + 1;
    int _1572 = _1530 * int(_1518);
    int _1574 = _1572 + _1488;
    int _1576 = _1562;
    if (!_1512)
    {
        _1576 = 1;
    }
    int _1578 = _1576;
    int _1580 = _993 * _1570;
    int _1582 = _1580 + _1304;
    float _1584 = float(uint(_1574));
    float _1586 = trunc(_1564);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    int _1592 = int(_1460) + int(_1552);
    bool _1594 = !_1506;
    int _1596 = _1594 ? _1582 : (-1);
    float _1598 = as_type<float>(_1128) * _1584;
    int _1600 = ~_993;
    int _1602 = _1600 + 1;
    int _1604 = _1596 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1596 & 3;
    bool _1610 = _1608 != 0;
    float _1612 = trunc(_1598);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    bool _1618 = uint(_1604) > 1u;
    int _1620 = _1602 * _1592;
    int _1622 = _1620 + _1268;
    bool _1624 = _1604 != 3;
    int _1626 = _1610 ? 0 : 1;
    bool _1628 = uint(_1604) >= 2u;
    int _1630 = int(_1500) + int(_1590);
    int _1632 = _1628 ? 0 : 1;
    int _1634 = ~_1626;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    int _1640 = _1544 * _1630;
    int _1642 = _1640 + _1428;
    int _1644 = _1638;
    if (!_1618)
    {
        int _1646 = ~_1626;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    int _1652 = ~_1632;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    bool _1658 = _1084 > 0.5;
    bool _1660 = uint(_1622) >= uint(_993);
    int _1662 = _1656;
    if (_1624)
    {
        int _1664 = ~_1632;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    int _1670 = int(_1518) + int(_1616);
    float _1672 = in.m_56.x;
    float _1674 = in.m_56.y;
    float _1676 = in.m_56.z;
    bool _1678 = !_1660;
    int _1680 = _1678 ? 0 : (-1);
    bool _1682 = uint(_1642) >= uint(_999);
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1686 = _1684 != 0;
    int _1688 = ~_999;
    int _1690 = _1688 + 1;
    bool _1692 = !_1686;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = _1078 > 0.5;
    int _1698 = _1690 * _1670;
    int _1700 = _1698 + _1488;
    float _1702 = -_231;
    int _1704 = _1696 ? as_type<int>(_1702) : as_type<int>(_231);
    int _1706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1708 = _1706 != 0;
    bool _1710 = _1080 > 0.5;
    bool _1712 = !_1682;
    int _1714 = _1712 ? 0 : (-1);
    float _1716 = _197 * _1674;
    bool _1718 = !_1708;
    float _1720 = _1718 ? _231 : as_type<float>(_1704);
    float _1722 = -_235;
    int _1724 = _1710 ? as_type<int>(_1722) : as_type<int>(_235);
    float _1726 = fma(_195, _1672, _1716);
    bool _1728 = uint(_1700) >= uint(_999);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    float _1734 = fma(_199, _1676, _1726);
    bool _1736 = _1082 > 0.5;
    bool _1738 = !_1728;
    int _1740 = _1738 ? 0 : (-1);
    bool _1742 = !_1732;
    float _1744 = _1742 ? _235 : as_type<float>(_1724);
    float _1746 = _185 * _1674;
    float _1748 = -_231;
    int _1750 = _1736 ? as_type<int>(_1748) : as_type<int>(_231);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1758 = _1756 != 0;
    float _1760 = fma(_183, _1672, _1746);
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1764 = _1762 != 0;
    float _1766 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1770 = _1768 != 0;
    float _1772 = _191 * _1674;
    float _1774 = 1.0 / _1526;
    float _1776 = fma(_189, _1672, _1772);
    float _1778 = fma(_187, _1676, _1760);
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1782 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1784 = isnan(_977);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1800 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1802 = 1.0 / _1754;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1806 = _977 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1810 = _977 + _1808;
    float _1812 = -_1798;
    float _1814 = fma(_1800, 2.0, _1812);
    float _1816 = fma(_1766, -2.0, _1780);
    float _1818 = fma(_193, _1676, _1776);
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1820;
    float _1824 = 1.0 / _1796;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1826;
    float _1830 = in.m_68.w;
    float _1832 = _1822 * _1774;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1836 = _1834 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1838 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1840 = isnan(_977);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -_155;
    float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1814);
    bool _1854 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1856 = isnan(_977);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = _1836 * _1802;
    bool _1868 = _977 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1870 = isnan(_977);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = fma(_1832, _1806, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1882 = !_1770;
    float _1884 = _1882 ? _231 : as_type<float>(_1750);
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1888 = _977 + _1886;
    bool _1890 = _1578 != 1;
    float _1892 = -_1878;
    float _1894 = _1892 + 1.0;
    float _1896 = _1828 * _1824;
    float _1898 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1816);
    float _1900 = in.m_72.w;
    float _1902 = _1848 * _1894;
    float _1904 = -_1864;
    float _1906 = _1904 + 1.0;
    float _1908 = -_1848;
    float _1910 = _1908 + 1.0;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1914 = ~_1670;
    int _1916 = _1914 + _1740;
    int _1918 = _1916 + 1;
    float _1920 = _1792 * _1906;
    float _1922 = _1864 * _1910;
    float _1924 = fma(_1866, _1810, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1926 = _1778 + _1830;
    float _1928 = _1880 * _1920;
    float _1930 = fma(_1896, _1888, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1932 = _1720 + 0.5;
    float _1934 = _1744 + (-0.5);
    float _1936 = -_1792;
    float _1938 = _1936 + 1.0;
    float _1940 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1912);
    float _1942 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1852);
    float _1944 = -_1934;
    float _1946 = -_1898;
    float _1948 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1946);
    float _1950 = _1852;
    float _1952 = _1898;
    float _1954 = as_type<float>(_1670);
    float _1956 = _1884;
    if (!_1890)
    {
        _1950 = _1080;
    }
    float _1958 = _1950;
    int _1960 = _999 * _1918;
    int _1962 = _1960 + _1488;
    float _1964 = _1958;
    if (!_1890)
    {
        _1952 = _1080;
    }
    float _1966 = _1952;
    float _1968 = in.m_70.w;
    float _1970 = _1966;
    if (_1890)
    {
        _1964 = _1078;
    }
    float _1972 = _1964;
    float _1974 = _1884 + 0.5;
    float _1976 = _1734 + _1900;
    float _1978 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1928);
    if (_1890)
    {
        _1970 = _1078;
    }
    float _1980 = _1970;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1890)
    {
        _1954 = _1082;
    }
    float _1984 = _1954;
    float _1986 = fma(_1924, _1922, _1978);
    float _1988 = _1984;
    if (_1890)
    {
        _1988 = _1080;
    }
    float _1990 = _1988;
    float _1992 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1982);
    if (_1890)
    {
        _1170 = _1080;
    }
    float _1994 = _1170;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1998 = _1596 >> 31;
    float _2000 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2002 = !_1300;
    int _2004 = _2002 ? _1962 : (-1);
    float _2006 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1996);
    int _2008 = _1998 & 3;
    float _2010 = fma(_1930, _1902, _1986);
    int _2012 = _2004 >> 31;
    float _2014 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2016 = _1596 + _2008;
    float _2018 = _1818 + _1968;
    int _2020 = _2012 & 3;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2024 = _1926 + _2022;
    int _2026 = _2016 >> 2;
    float _2028 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1940);
    int _2030 = _2004 + _2020;
    float _2032 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2034 = _2026 << 4;
    int _2036 = _2034 + 368;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2040 = _1976 + _2038;
    int _2042 = _2030 >> 2;
    int _2044 = _2042 << 4;
    int _2046 = _2044 + 512;
    uint _2048 = uint(int(uint(_2036) >> uint(2)));
    uint _2050 = uint(int(uint(int(_2048)) >> uint(2)));
    int _2052 = int(_2048) & 3;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[int(_2050)][_2052];
    int _2056 = int(_2048) + 1;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    int _2060 = _2056 & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2066 = !_1606;
    int _2068 = _2066 ? 0 : 1;
    float _2070 = -_2064;
    float _2072 = fma(_2000, 2.0, _2070);
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2076 = uint(int(uint(_2046) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[int(_2086)][_2088];
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2094 = _2004 & 3;
    bool _2096 = _2094 != 0;
    float _2098 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2010);
    int _2100 = _2004 & 3;
    bool _2102 = _2100 != 0;
    float _2104 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2092);
    int _2106 = _2096 ? 0 : 1;
    float _2108 = fma(_2014, -2.0, _2074);
    int _2110 = _2046 + 8;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    bool _2128 = uint(_2100) > 1u;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2132 = _2018 + _2130;
    int _2134 = ~_2106;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    float _2140 = -_155;
    float _2142 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2072);
    bool _2144 = !_2102;
    int _2146 = _2144 ? 0 : 1;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2032);
    bool _2150 = _1604 != 3;
    int _2152 = _2036 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1992);
    float _2172 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2006);
    float _2174 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2104);
    bool _2176 = !_2150;
    int _2178 = _2176 ? 0 : (-1);
    float _2180 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2148);
    int _2182 = _2138;
    if (!_2128)
    {
        int _2184 = ~_2106;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2108);
    bool _2192 = _2100 != 3;
    float _2194 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2142);
    int _2196 = abs(_2188);
    bool _2198 = uint(_2100) >= 2u;
    int _2200 = ~_1592;
    int _2202 = _2200 + _1680;
    int _2204 = _2202 + 1;
    int _2206 = abs(_1650);
    int _2208 = ~_2196;
    int _2210 = _2208 + 1;
    int _2212 = _2210 + 1;
    int _2214 = _993 * _2204;
    int _2216 = _2214 + _1268;
    int _2218 = _2198 ? 0 : 1;
    int _2220 = ~_2206;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    int _2226 = abs(_2146);
    int _2228 = abs(_2068);
    int _2230 = _2224 * as_type<int>(_2062);
    int _2232 = ~_2218;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2212 * as_type<int>(_2090);
    int _2240 = _2236;
    if (_2192)
    {
        int _2242 = ~_2218;
        int _2244 = _2242 + 1;
        _2240 = _2244;
    }
    int _2246 = _2240;
    int _2248 = abs(_2246);
    int _2250 = ~_2226;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    bool _2256 = _2100 != 3;
    int _2258 = ~_2228;
    int _2260 = _2258 + 1;
    int _2262 = _2260 + 1;
    int _2264 = _2254 * as_type<int>(_2082);
    int _2266 = _2264 + _2238;
    int _2268 = abs(_1668);
    int _2270 = ~_2248;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = _2262 * as_type<int>(_2054);
    int _2278 = _2276 + _2230;
    int _2280 = abs(_2178);
    bool _2282 = !_2256;
    int _2284 = _2282 ? 0 : (-1);
    int _2286 = _2274 * as_type<int>(_2118);
    int _2288 = _2286 + _2266;
    int _2290 = ~_2268;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2284);
    int _2298 = _2294 * as_type<int>(_2160);
    int _2300 = _2298 + _2278;
    bool _2302 = !_1764;
    int _2304 = _2302 ? 0 : 1;
    int _2306 = ~_1630;
    int _2308 = _2306 + _1714;
    int _2310 = _2308 + 1;
    int _2312 = ~_2280;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = abs(_1694);
    int _2320 = _999 * _2310;
    int _2322 = _2320 + _1428;
    int _2324 = abs(_2304);
    int _2326 = _2316 * as_type<int>(_2168);
    int _2328 = _2326 + _2300;
    int _2330 = ~_2296;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2318;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = ~_2324;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    int _2348 = _2334 * as_type<int>(_2126);
    int _2350 = _2348 + _2288;
    bool _2352 = !_1506;
    int _2354 = _2352 ? _2216 : (-1);
    int _2356 = _2328 * _2340;
    bool _2358 = !_1300;
    int _2360 = _2358 ? _2322 : (-1);
    int _2362 = _2350 * _2346;
    bool _2364 = _2180 >= 0.0;
    int _2366 = _2354 * _2318;
    int _2368 = _2366 + _2356;
    float _2370 = -_2170;
    float _2372 = _2370 + 1.0;
    int _2374 = _2360 * _2324;
    int _2376 = _2374 + _2362;
    float _2378 = _2024 * _2024;
    float _2380 = -_235;
    int _2382 = _1658 ? as_type<int>(_2380) : as_type<int>(_235);
    float _2384 = fma(_1744, _2372, _1948);
    float _2386 = -_2172;
    float _2388 = _2386 + 1.0;
    float _2390 = fma(_2132, _2132, _2378);
    bool _2392 = !_1758;
    float _2394 = _2392 ? _235 : as_type<float>(_2382);
    float _2396 = -_2174;
    float _2398 = _2396 + 1.0;
    float _2400 = -_2388;
    float _2402 = fma(_1884, _2400, _2194);
    float _2404 = fma(_2040, _2040, _2390);
    if (_2364)
    {
        _1956 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2406 = _1956;
    float _2408 = _2394 + (-0.5);
    float _2410 = -_2028;
    float _2412 = _2410 + 1.0;
    float _2414 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2416 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2418 = rsqrt(_2404);
    float _2420 = -_2408;
    float _2422 = -_2190;
    float _2424 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2422);
    float _2426 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = _2098 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2430 = -_2412;
    float _2432 = fma(_1720, _2430, _1942);
    float _2434 = fma(_2394, _2398, _2424);
    float _2436 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2440 = as_type<int>(_2406);
    if (_2364)
    {
        float _2442 = _2406 * 5.0;
        _2440 = as_type<int>(_2442);
    }
    int _2444 = _2440;
    float _2446 = float(_2368);
    out.m_80.x = _2432;
    out.m_80.y = _2384;
    out.m_80.z = _2402;
    out.m_80.w = _2434;
    float _2448 = float(_2376);
    out.m_82.x = _2436;
    out.m_82.y = _2438;
    out.m_82.z = _2416;
    out.m_82.w = _2428;
    float _2450 = _2024 * _2418;
    float _2452 = _2132 * _2418;
    float _2454 = as_type<float>(_2444);
    if (_2364)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7879 = as_type<float>(_2444);
        out.gl_Position.z = _7879;
    }
    out.m_84.x = _2446;
    out.m_84.y = _2448;
    if (_2364)
    {
        out.m_59.x = 0.0;
    }
    if (_2364)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2456 = -_2450;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2460 = _2040 * _2418;
    float _2462 = -_2452;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2018);
    float _2466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2468 = _2458 + _2466;
    float _2470 = -_2460;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _2464 + _2474;
    float _2478 = _2468 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2472 + _2480;
    float _2484 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2478);
    float _2486 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2484);
    bool _2488 = _2486 >= 0.0;
    float _2490 = _2476;
    float _2492 = _2464;
    if (_2488)
    {
        _2454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2494 = _2454;
    int _2496 = as_type<int>(_2494);
    if (_2488)
    {
        out.m_59.x = 0.0;
    }
    if (_2488)
    {
        float _2498 = _2494 * 5.0;
        _2496 = as_type<int>(_2498);
    }
    int _2500 = _2496;
    if (_2488)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7979 = as_type<float>(_2500);
        out.gl_Position.z = _7979;
    }
    if (_2488)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2502 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2504 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2506 = floor(_2502);
    float _2508 = floor(_2504);
    float _2510 = -_2506;
    float _2512 = _2502 + _2510;
    float _2514 = -_2508;
    float _2516 = _2504 + _2514;
    float2 _8015 = float2(_2512, _2516);
    float _2518 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8015, float2(0.0), isnan(_8015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8015, float2(0.0), isnan(_8015)), level(0.0)).x;
    float _2520 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2522 = -_1926;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2526 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2520);
    float _2528 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _2530 = -_2018;
    float _2532 = _2530 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2534 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2526);
    float _2536 = _2524 * _2524;
    float _2538 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2528);
    float _2540 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2542 = -_1976;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = fma(_2532, _2532, _2536);
    float _2548 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2538);
    float _2550 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2552 = fma(_2544, _2544, _2546);
    float _2554 = rsqrt(_2548);
    float _2556 = -_2450;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2024);
    float _2560 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2550);
    float _2562 = -_2452;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2132);
    float _2566 = _2558 * _2558;
    float _2568 = -_2460;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2572 = 1.0 / _2540;
    float _2574 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2576 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2560);
    float _2578 = fma(_2564, _2564, _2566);
    float _2580 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2574);
    float _2582 = _471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2584 = fma(_2570, _2570, _2578);
    float _2586 = rsqrt(_2552);
    float _2588 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2580);
    float _2590 = _231 * _2554;
    float _2592 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2594 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2596 = _2458 + _2592;
    float _2598 = rsqrt(_2576);
    float _2600 = _2594 + _2540;
    float _2602 = _2600 * _2572;
    float _2604 = _2602 * 0.5;
    float _2606 = _2532 * _2586;
    float _2608 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2610 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2608);
    float _2612 = _2544 * _2586;
    float _2614 = sqrt(_2584);
    float _2616 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2618 = _2606 * _2616;
    float _2620 = _2524 * _2586;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2624 = _2612 * _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2628 = -_2618;
    float _2630 = fma(_2612, _2626, _2628);
    float _2632 = _235 * _2598;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2636 = _2620 * _2634;
    float _2638 = 1.0 / _2610;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2642 = -_2624;
    float _2644 = fma(_2620, _2640, _2642);
    float _2646 = _2630 * _2630;
    float _2648 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2632);
    float _2652 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2654 = fma(_2644, _2644, _2646);
    float _2656 = _2418 * _2614;
    float _2658 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2660 = -_2636;
    float _2662 = fma(_2606, _2658, _2660);
    float _2664 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2652);
    float _2666 = _2656 * _2648;
    float _2668 = fma(_2662, _2662, _2654);
    float _2670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2590);
    float _2672 = _2656 * _2582;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = _2638 * _2674;
    float _2678 = rsqrt(_2668);
    float _2680 = _2670 * _2666;
    float _2682 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2684 = _2650 * _2672;
    bool _2686 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2688 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2664);
    bool _2690 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2692 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2682);
    float _2694 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2696 = _2694 * 0.5;
    bool _2698 = !_2686;
    int _2700 = _2698 ? 0 : 1;
    float _2702 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2704 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2692);
    float _2706 = trunc(_2702);
    int _2708 = int(_2706);
    float _2710 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2712 = _2644 * _2678;
    int _2714 = 2;
    int _2716 = as_type<int>(_2684);
    float _2718 = _2696;
    float _2720 = _2710;
    float _2722 = _2702;
    float _2724 = _2596;
    if (!_2686)
    {
        _2714 = 1;
    }
    int _2726 = _2714;
    float _2728 = _2662 * _2678;
    int _2730 = _2726;
    if (!_2690)
    {
        _2730 = _2700;
    }
    int _2732 = _2730;
    float _2734 = _2630 * _2678;
    float _2736 = _2620 * _2712;
    float _2738 = trunc(_2710);
    int _2740 = int(_2738);
    int _2742 = _2732 << 6;
    float _2744 = _2612 * _2734;
    float _2746 = -_2736;
    float _2748 = fma(_2606, _2734, _2746);
    int _2750 = _2742 + 96;
    uint _2752 = uint(int(uint(_2750) >> uint(2)));
    uint _2754 = uint(int(uint(int(_2752)) >> uint(2)));
    int _2756 = int(_2752) & 3;
    float _2758 = (*spvDescriptorSet0.vp_c15)._m0[int(_2754)][_2756];
    int _2760 = int(_2752) + 1;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    int _2764 = _2760 & 3;
    float _2766 = (*spvDescriptorSet0.vp_c15)._m0[int(_2762)][_2764];
    float _2768 = -_2744;
    float _2770 = fma(_2620, _2728, _2768);
    float _2772 = _2684 * _2748;
    int _2774 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2776 = _2708 + _2774;
    int _2778 = _2776 + 1;
    float _2780 = _2684 * _2770;
    float _2782 = fma(_2680, _2728, _2772);
    bool _2784 = _2778 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2786 = _2742 + 48;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    uint _2790 = uint(int(uint(int(_2788)) >> uint(2)));
    int _2792 = int(_2788) & 3;
    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[int(_2790)][_2792];
    int _2796 = int(_2788) + 1;
    uint _2798 = uint(int(uint(_2796) >> uint(2)));
    int _2800 = _2796 & 3;
    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[int(_2798)][_2800];
    float _2804 = fma(_2680, _2712, _2780);
    float _2806 = fma(_2696, _2612, _2782);
    int _2808 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2810 = _2740 + _2808;
    int _2812 = _2810 + 1;
    float _2814 = fma(_2696, _2606, _2804);
    float _2816 = _1976 + _2806;
    int _2818 = _2778 | _2812;
    int _2820 = _2742 + 56;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    uint _2824 = uint(int(uint(int(_2822)) >> uint(2)));
    int _2826 = int(_2822) & 3;
    float _2828 = (*spvDescriptorSet0.vp_c15)._m0[int(_2824)][_2826];
    int _2830 = int(_2822) + 1;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    int _2834 = _2830 & 3;
    float _2836 = (*spvDescriptorSet0.vp_c15)._m0[int(_2832)][_2834];
    float _2838 = _2018 + _2814;
    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2842 = _2816 + _2840;
    bool _2844 = _2818 < 0;
    bool _2846 = _2844 || _2784;
    float _2848 = _2606 * _2728;
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2852 = _2838 + _2850;
    float _2854 = _2842 * _2842;
    bool _2856 = _2812 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2858 = _2856 || _2846;
    int _2860 = _2742 + 64;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    uint _2864 = uint(int(uint(int(_2862)) >> uint(2)));
    int _2866 = int(_2862) & 3;
    float _2868 = (*spvDescriptorSet0.vp_c15)._m0[int(_2864)][_2866];
    int _2870 = int(_2862) + 1;
    uint _2872 = uint(int(uint(_2870) >> uint(2)));
    int _2874 = _2870 & 3;
    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[int(_2872)][_2874];
    float _2878 = -_2848;
    float _2880 = fma(_2612, _2712, _2878);
    float _2882 = fma(_2852, _2852, _2854);
    float _2884 = _2684 * _2880;
    float _2886 = sqrt(_2882);
    int _2888 = _2742 + 72;
    uint _2890 = uint(int(uint(_2888) >> uint(2)));
    uint _2892 = uint(int(uint(int(_2890)) >> uint(2)));
    int _2894 = int(_2890) & 3;
    float _2896 = (*spvDescriptorSet0.vp_c15)._m0[int(_2892)][_2894];
    int _2898 = int(_2890) + 1;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    int _2902 = _2898 & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    float _2906 = fma(_2680, _2734, _2884);
    int _2908 = as_type<int>(_2854);
    int _2910 = as_type<int>(_2884);
    float _2912 = _2838;
    float _2914 = _2816;
    float _2916 = _2882;
    float _2918 = as_type<float>(_2732);
    if (!_2858)
    {
        int _2920 = _2812 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2922 = _2920 + _2778;
        _2908 = _2922;
    }
    int _2924 = _2908;
    float _2926 = fma(_2696, _2620, _2906);
    int _2928 = _2742 + 104;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
    int _2934 = int(_2930) & 3;
    float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
    int _2938 = int(_2930) + 1;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    int _2942 = _2938 & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    if (!_2858)
    {
        int _2946 = _2924 << 2;
        _2716 = _2946;
    }
    int _2948 = _2716;
    float _2950 = _1926 + _2926;
    int _2952 = _2948;
    if (!_2858)
    {
        uint _2954 = uint(int(uint(_2924) >> uint(2)));
        _2910 = int(_2954);
    }
    int _2956 = _2910;
    float _2958 = as_type<float>(_2956);
    if (!_2858)
    {
        int _2960 = 12 & _2948;
        _2952 = _2960;
    }
    int _2962 = _2952;
    bool _2964 = _2886 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2858)
    {
        int _2966 = _2956 << 4;
        int _2968 = _2966 + _2962;
        _2958 = as_type<float>(_2968);
    }
    float _2970 = _2958;
    if (!_2964)
    {
        _2718 = _2838;
    }
    float _2972 = _2718;
    float _2974 = _2972;
    if (!_2964)
    {
        _2912 = _2950;
    }
    float _2976 = _2912;
    bool _2978 = !_2964;
    float _2980 = _2976;
    if (!_2978)
    {
        float _2982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2986 = _2886 + _2984;
        float _2988 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2990 = rsqrt(_2882);
        float _2992 = _2986 * _2982;
        float _2994 = _2992 * 0.15915493667125701904296875;
        float _2996 = _2994 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        float _3000 = _2994 * 6.283185482025146484375;
        float _3002 = sin(_3000);
        float _3004 = _2998 + (-1.0);
        float _3006 = fma(_3002, _2988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3008 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3010 = _2990 * _3006;
        float _3012 = fma(_2950, _2998, _3008);
        float _3014 = fma(_2852, _3010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3016 = fma(_2842, _3010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2980 = _3012;
        _2974 = _3014;
        _2914 = _3016;
        _2916 = _2990;
    }
    float _3018 = _2980;
    float _3020 = _2974;
    float _3022 = _2914;
    float _3024 = _2916;
    float _3026 = -_1926;
    float _3028 = _3026 + _3018;
    int _3030 = _2742 + 80;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    uint _3034 = uint(int(uint(int(_3032)) >> uint(2)));
    int _3036 = int(_3032) & 3;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[int(_3034)][_3036];
    int _3040 = int(_3032) + 1;
    uint _3042 = uint(int(uint(_3040) >> uint(2)));
    int _3044 = _3040 & 3;
    float _3046 = (*spvDescriptorSet0.vp_c15)._m0[int(_3042)][_3044];
    float _3048 = -_2018;
    float _3050 = _3048 + _3020;
    float _3052 = -_1976;
    float _3054 = _3052 + _3022;
    float _3056 = _3028 * _3028;
    float _3058 = _2596 * _2766;
    float _3060 = _3024;
    float _3062 = _3020;
    float _3064 = _3018;
    float _3066 = _3022;
    if (!_2858)
    {
        float _3068 = floor(_2702);
        _3060 = _3068;
    }
    float _3070 = _3060;
    float _3072 = _2596 * _2876;
    float _3074 = fma(_3050, _3050, _3056);
    int _3076 = _2742 + 88;
    uint _3078 = uint(int(uint(_3076) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c15)._m0[int(_3088)][_3090];
    float _3094 = fma(_2464, _2758, _3058);
    float _3096 = fma(_2464, _2868, _3072);
    float _3098 = fma(_3054, _3054, _3074);
    float _3100 = fma(_2472, _2936, _3094);
    bool _3102 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3104 = isnan(0.5);
    bool _3106 = _3102 || _3104;
    bool _3108 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3110 = _3106 || _3108;
    float _3112 = sqrt(_3098);
    float _3114 = _2970;
    if (!_2858)
    {
        int _3116 = as_type<int>(_2970) + 400;
        uint _3118 = uint(int(uint(_3116) >> uint(2)));
        uint _3120 = uint(int(uint(int(_3118)) >> uint(2)));
        int _3122 = int(_3118) & 3;
        float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
        _3114 = _3124;
    }
    float _3126 = _3114;
    float _3128 = _3100 + _2944;
    float _3130 = _2596 * _2802;
    float _3132 = fma(_2472, _2896, _3096);
    float _3134 = fma(_2464, _2794, _3130);
    float _3136 = _3094;
    if (!_2858)
    {
        float _3138 = floor(_2710);
        _3136 = _3138;
    }
    float _3140 = _3136;
    float _3142 = fma(_2472, _2828, _3134);
    bool _3144 = _3112 > 0.0;
    float _3146 = 1.0 / _3128;
    bool _3148 = !_3144;
    float _3150 = _3146;
    if (!_3148)
    {
        float _3152 = _221 * _221;
        float _3154 = rsqrt(_3098);
        float _3156 = fma(_225, _225, _3152);
        float _3158 = fma(_227, _227, _3156);
        float _3160 = sqrt(_3158);
        float _3162 = _3050 * _3154;
        float _3164 = _3028 * _3154;
        float _3166 = _3054 * _3154;
        bool _3168 = _3160 > 0.0;
        bool _3170 = !_3168;
        if (!_3170)
        {
            float _3172 = rsqrt(_3158);
            float _3174 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3176 = _221 * _3172;
            float _3178 = _225 * _3172;
            float _3180 = _3164 * _3176;
            float _3182 = _227 * _3172;
            float _3184 = fma(_3162, _3178, _3180);
            float _3186 = _3174 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3188 = fma(_3166, _3182, _3184);
            float _3190 = _3188 * _3186;
            float _3192 = fma(_225, _3190, _3020);
            float _3194 = fma(_221, _3190, _3018);
            float _3196 = fma(_227, _3190, _3022);
            _3062 = _3192;
            _3064 = _3194;
            _3066 = _3196;
        }
    }
    float _3198 = _3062;
    float _3200 = _3064;
    float _3202 = _3066;
    float _3204 = -_2452;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3198);
    float _3208 = -_2450;
    float _3210 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3200);
    float _3212 = -_2460;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3202);
    float _3216 = _3142 + _2836;
    float _3218 = _3132 + _2904;
    float _3220 = _3210;
    float _3222 = _3206;
    float _3224 = _3214;
    if (!_3110)
    {
        float _3226 = _2468 * _2468;
        float _3228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3230 = -_1926;
        float _3232 = _3230 + _3200;
        float _3234 = fma(_2476, _2476, _3226);
        float _3236 = fma(_2482, _2482, _3234);
        float _3238 = 1.0 / _2656;
        float _3240 = sqrt(_3236);
        float _3242 = precise::min(_3240, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3244 = _3242 * _3228;
        float _3246 = -_1976;
        float _3248 = _3246 + _3202;
        float _3250 = _3244 * _3238;
        float _3252 = -_2018;
        float _3254 = _3252 + _3198;
        float _3256 = fma(_3232, _3250, _2458);
        float _3258 = fma(_3254, _3250, _2464);
        float _3260 = fma(_3248, _3250, _2472);
        _3220 = _3256;
        _3222 = _3258;
        _3224 = _3260;
        _2490 = _3240;
    }
    float _3262 = _3220;
    float _3264 = _3222;
    float _3266 = _3224;
    float _3268 = _2490;
    float _3270 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3272 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3274 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3276 = _3216 * _3146;
    float _3278 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3270);
    float _3280 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3272);
    float _3282 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3274);
    float _3284 = _3262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3278);
    bool _3288 = _3276 >= 0.0;
    float _3290 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3280);
    float _3292 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3282);
    float _3294 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3296 = _3218 * _3146;
    bool _3298 = _3276 <= 1.0;
    bool _3300 = _3298 && _3288;
    float _3302 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3304 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3310 = _3296 >= 0.0;
    bool _3312 = _3310 && _3300;
    float _3314 = fma(_3266, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3302);
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3320 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3322 = _3296 <= 1.0;
    bool _3324 = _3322 && _3312;
    float _3326 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3328 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3330 = -_3320;
    float _3332 = fma(_3330, _3318, 1.0);
    float _3334 = _2596 * _3046;
    float _3336 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3338 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3328);
    float _3340 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3342 = fma(_2464, _3038, _3334);
    float _3344 = log2(_3332);
    float _3346 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3336);
    float _3348 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3340);
    float _3350 = fma(_2472, _3084, _3342);
    float _3352 = _3268;
    float _3354 = _3338;
    if (_3324)
    {
        float _3356 = float(_2732);
        _2918 = _3356;
    }
    float _3358 = _2918;
    float _3360 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3346);
    float _3362 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3348);
    float _3364 = _3350 + _3092;
    float _3366 = 1.0 / _3338;
    float _3368 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3360);
    float _3370 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3362);
    if (!_2858)
    {
        float _3372 = -_3140;
        float _3374 = _2710 + _3372;
        _2720 = _3374;
    }
    float _3376 = _2720;
    if (!_2858)
    {
        float _3378 = -_3070;
        float _3380 = _2702 + _3378;
        _2722 = _3380;
    }
    float _3382 = _2722;
    float _3384 = _3364 * _3146;
    float _3386 = _2452;
    float _3388 = _3382;
    if (!_2858)
    {
        float _3390 = rint(_3126);
        float _3392 = precise::max(_3390, 0.0);
        uint _3394 = uint(_3392);
        uint _3396 = clamp(_3394, 0u, 65535u);
        _3386 = as_type<float>(_3396);
    }
    float _3398 = _3386;
    float _3400 = _3344 * 0.693147182464599609375;
    float _3402 = _3400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3404 = _3342;
    if (_3324)
    {
        float _3406 = rint(_3358);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3404 = as_type<float>(_3412);
    }
    float _3414 = _3404;
    float _3416 = _3368 * _3366;
    float _3418 = _3370 * _3366;
    float _3420 = fma(_3416, 0.5, 0.5);
    float _3422 = fma(_3418, -0.5, 0.5);
    float _3424 = _3398;
    if (!_2858)
    {
        float3 _9520 = float3(_3382, _3376, float(as_type<int>(_3398)));
        float3 _9524 = select(_9520, float3(0.0), isnan(_9520));
        float _3426 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9524.xy, uint(rint(_9524.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9524.xy, uint(rint(_9524.z)), level(0.0)).x;
        _3424 = _3426;
    }
    float _3428 = _3424;
    float _3430 = _2482;
    if (_3324)
    {
        float3 _9539 = float3(_3276, _3296, float(as_type<int>(_3414)));
        float3 _9541 = select(_9539, float3(0.0), isnan(_9539));
        float _3432 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9541.xy, uint(rint(_9541.z)), _3384, level(0.0));
        _3430 = _3432;
    }
    float _3434 = _3430;
    float3 _9551 = float3(_3420, _3422, _3402);
    float _3436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9551, float3(0.0), isnan(_9551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9551, float3(0.0), isnan(_9551)), level(0.0)).x;
    float3 _9560 = float3(_3420, _3422, _3402);
    float4 _3439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9560, float3(0.0), isnan(_9560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9560, float3(0.0), isnan(_9560)), level(0.0)).xyzw;
    float _3441 = _3439.x;
    float _3443 = _3439.y;
    float _3445 = _3439.z;
    float _3447 = _3439.w;
    bool _3449 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3451 = isnan(0.5);
    bool _3453 = _3449 || _3451;
    bool _3455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3457 = _3453 || _3455;
    if (_2858)
    {
        _3352 = 1.0;
    }
    float _3459 = _3352;
    float _3461 = _3459;
    if (_3457)
    {
        _3150 = 1.0;
    }
    float _3463 = _3150;
    float _3465 = _3463;
    float _3467 = _3441;
    if (!_3457)
    {
        float _3469 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3471 = _3469 * 0.15915493667125701904296875;
        float _3473 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3475 = _3471 * 6.283185482025146484375;
        float _3477 = cos(_3475);
        float _3479 = _3473 * 0.15915493667125701904296875;
        float _3481 = _3471 * 6.283185482025146484375;
        float _3483 = sin(_3481);
        float _3485 = 1.0 / _3477;
        float _3487 = _3479 * 6.283185482025146484375;
        float _3489 = cos(_3487);
        float _3491 = _3483 * _3485;
        float _3493 = _3479 * 6.283185482025146484375;
        float _3495 = sin(_3493);
        float _3497 = _3489 * _3491;
        float _3499 = 1.0 / _3497;
        float _3501 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3503 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3501;
        float _3505 = 1.0 / _3503;
        float _3507 = _3495 * _3499;
        float _3509 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3511 = fma(_2676, _3507, _3509);
        float _3513 = _3511 * _3505;
        float _3515 = precise::clamp(_3513, 0.0, 1.0);
        _3465 = _3515;
    }
    float _3517 = _3465;
    if (!_2858)
    {
        int _3519 = _2924 << 4;
        int _3521 = _3519 + 2048;
        uint _3523 = uint(int(uint(_3521) >> uint(2)));
        uint _3525 = uint(int(uint(int(_3523)) >> uint(2)));
        int _3527 = int(_3523) & 3;
        float _3529 = (*spvDescriptorSet0.vp_c15)._m0[int(_3525)][_3527];
        int _3531 = int(_3523) + 1;
        uint _3533 = uint(int(uint(_3531) >> uint(2)));
        int _3535 = _3531 & 3;
        float _3537 = (*spvDescriptorSet0.vp_c15)._m0[int(_3533)][_3535];
        int _3539 = _3521 + 8;
        uint _3541 = uint(int(uint(_3539) >> uint(2)));
        uint _3543 = uint(int(uint(int(_3541)) >> uint(2)));
        int _3545 = int(_3541) & 3;
        float _3547 = (*spvDescriptorSet0.vp_c15)._m0[int(_3543)][_3545];
        int _3549 = int(_3541) + 1;
        uint _3551 = uint(int(uint(_3549) >> uint(2)));
        int _3553 = _3549 & 3;
        float _3555 = (*spvDescriptorSet0.vp_c15)._m0[int(_3551)][_3553];
        float _3557 = _2596 * _3537;
        float _3559 = fma(_2464, _3529, _3557);
        float _3561 = fma(_2472, _3547, _3559);
        float _3563 = _3561 + _3555;
        float _3565 = precise::clamp(_3563, 0.0, 1.0);
        float _3567 = -_3565;
        float _3569 = _3567 + _3428;
        float _3571 = fma(_3569, 500.0, 1.5);
        float _3573 = exp2(_3571);
        float _3575 = 0.0 + _3573;
        float _3577 = precise::clamp(_3575, 0.0, 1.0);
        _2724 = _3557;
        _3461 = _3577;
    }
    float _3579 = _2724;
    float _3581 = _3461;
    float _3583 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3585 = _3262 + _3583;
    float _3587 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3589 = _3264 + _3587;
    float _3591 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3593 = _3266 + _3591;
    float _3595 = _3585 * _3585;
    float _3597 = fma(_3589, _3589, _3595);
    float _3599 = fma(_3593, _3593, _3597);
    float _3601 = rsqrt(_3599);
    float _3603 = sqrt(_3599);
    float _3605 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3607 = _3589 * _3605;
    float _3609 = _3593 * _3605;
    float _3611 = _3607 * _3607;
    float _3613 = _3609 * _3609;
    float _3615 = _3611 + _3613;
    float _3617 = sqrt(_3615);
    bool _3619 = _3617 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3623 = _3617 + _3621;
    float _3625 = _3597;
    float _3627 = _3601;
    float _3629 = _3623;
    float _3631 = _3585;
    float _3633 = _3579;
    if (_3619)
    {
        float _3635 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3625 = _3635;
    }
    float _3637 = _3625;
    if (_3619)
    {
        float _3639 = rsqrt(_3615);
        _3627 = _3639;
    }
    float _3641 = _3627;
    float _3643 = _3641;
    if (_3619)
    {
        float _3645 = _3623 * _3637;
        _3629 = _3645;
    }
    float _3647 = _3629;
    if (_3619)
    {
        float _3649 = _3647 * 0.15915493667125701904296875;
        _2492 = _3649;
    }
    float _3651 = _2492;
    float _3653 = _3593;
    if (_3619)
    {
        float _3655 = _3651 * 6.283185482025146484375;
        float _3657 = sin(_3655);
        _3653 = _3657;
    }
    float _3659 = _3653;
    float _3661 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3663 = precise::max(0.0, _3661);
    float _3665 = _3637;
    float _3667 = _3663;
    if (_3619)
    {
        float _3669 = _3651 * 6.283185482025146484375;
        float _3671 = cos(_3669);
        _3665 = _3671;
    }
    float _3673 = _3665;
    float _3675 = -_3605;
    float _3677 = -_3663;
    float _3679 = fma(_3585, _3675, _3677);
    if (_3619)
    {
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3631 = _3681;
    }
    float _3683 = _3631;
    float _3685 = _3683;
    float _3687 = _3659;
    if (_3619)
    {
        float _3689 = fma(_3659, _3683, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3685 = _3689;
    }
    float _3691 = _3685;
    float _3693 = _3691;
    if (!_3619)
    {
        _3687 = _3607;
    }
    float _3695 = _3687;
    float _3697 = _3695;
    float _3699 = _3673;
    if (_3619)
    {
        float _3701 = _3673 + (-1.0);
        _3667 = _3701;
    }
    float _3703 = _3667;
    float _3705 = _3703;
    if (_3619)
    {
        float _3707 = _3641 * _3691;
        _3388 = _3707;
    }
    float _3709 = _3388;
    if (!_3619)
    {
        _3693 = _3679;
    }
    float _3711 = _3693;
    float _3713 = _3711;
    if (_3619)
    {
        float _3715 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3633 = _3715;
    }
    float _3717 = _3633;
    if (_3619)
    {
        float _3719 = _3607 * _3709;
        _3697 = _3719;
    }
    float _3721 = _3697;
    if (!_3619)
    {
        _3705 = _3609;
    }
    float _3723 = _3705;
    float _3725 = _3723;
    if (_3619)
    {
        float _3727 = _3609 * _3709;
        _3725 = _3727;
    }
    float _3729 = _3725;
    if (!_3619)
    {
        _3643 = _3611;
    }
    float _3731 = _3643;
    float _3733 = _3731;
    if (_3619)
    {
        float _3735 = fma(_3679, _3673, _3717);
        _3713 = _3735;
    }
    float _3737 = _3713;
    if (_3619)
    {
        float _3739 = _3721 * _3721;
        _3733 = _3739;
    }
    float _3741 = _3733;
    if (!_3619)
    {
        _3699 = _3613;
    }
    float _3743 = _3699;
    float _3745 = _3743;
    if (_3619)
    {
        float _3747 = _3729 * _3729;
        _3745 = _3747;
    }
    float _3749 = _3745;
    float _3751 = fma(_3737, _3737, _3741);
    float _3753 = _3751 + _3749;
    float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3757 = fma(_3603, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3755);
    float _3759 = precise::clamp(_3757, 0.0, 1.0);
    float _3761 = rsqrt(_3753);
    float _3763 = -_3759;
    float _3765 = _3763 + 1.0;
    float _3767 = abs(_3765);
    float _3769 = log2(_3767);
    float _3771 = _3761 * _3721;
    float _3773 = _3761 * _3737;
    float _3775 = _3761 * _3729;
    float _3777 = _3771 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3779 = -_3777;
    float _3781 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3779);
    float _3783 = -_3775;
    float _3785 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3781);
    float _3787 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3789 = fma(_3785, -0.5, 0.5);
    float _3791 = fma(_3785, 0.5, 0.5);
    float _3793 = exp2(_3787);
    float _3795 = fma(_3791, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3797 = fma(_3791, _3795, -0.212114393711090087890625);
    float _3799 = _3773 + 1.0;
    float _3801 = sqrt(_3789);
    float _3803 = fma(_3791, _3797, 1.570728778839111328125);
    float _3805 = -_3773;
    float _3807 = fma(_3793, _3799, _3805);
    float _3809 = _3801 * 0.636619746685028076171875;
    float _3811 = fma(_3807, 0.5, 0.5);
    float _3813 = -_3803;
    float _3815 = fma(_3809, _3813, 1.0);
    float2 _10127 = float2(_3815, _3811);
    float3 _3819 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10127, float2(0.0), isnan(_10127)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10127, float2(0.0), isnan(_10127)), level(0.0)).xyz;
    float _3821 = _3819.x;
    float _3823 = _3819.y;
    float _3825 = _3819.z;
    float _3827 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3829 = abs(_2676);
    float _3831 = log2(_3829);
    float _3833 = _3294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3835 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3837 = fma(_3827, _3827, 1.0);
    float _3839 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3833);
    float _3841 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_86.x = _2712;
    out.m_86.y = _2734;
    out.m_86.z = _2728;
    float _3843 = rsqrt(_3837);
    float _3845 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3839);
    bool _3847 = _2676 <= 8000.0;
    bool _3849 = isnan(_2676);
    bool _3851 = _3847 || _3849;
    bool _3853 = isnan(8000.0);
    bool _3855 = _3851 || _3853;
    float _3857 = float(_3855);
    float _3859 = -_2518;
    float _3861 = _3859 + 1.0;
    out.m_88.x = _3264;
    out.m_88.y = _3262;
    out.m_88.z = _3266;
    float _3863 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3845);
    bool _3865 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3867 = isnan(_3603);
    bool _3869 = _3865 || _3867;
    bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3873 = _3869 || _3871;
    float _3875 = _3831 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3877 = exp2(_3835);
    out.gl_Position.x = _3368;
    out.gl_Position.y = _3370;
    out.gl_Position.z = _3863;
    out.gl_Position.w = _3338;
    float _3879 = _3827 * _3843;
    float _3881 = exp2(_3875);
    float _3883 = -_2612;
    float _3885 = _3879 * _3883;
    float _3887 = -_2606;
    float _3889 = _3879 * _3887;
    float _3891 = -_2620;
    float _3893 = _3879 * _3891;
    float _3895 = fma(_3843, _2748, _3885);
    float _3897 = fma(_3843, _2770, _3889);
    float _3899 = _3863 + _3338;
    float _3901 = _3827 * _2770;
    float _3903 = -_3877;
    float _3905 = _3903 + 1.0;
    float _3907 = fma(_3843, _2880, _3893);
    float _3909 = _3899 * 0.5;
    float _3911 = fma(_3841, _2712, _3901);
    float _3913 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3915 = precise::clamp(_3913, 0.0, 1.0);
    float _3917 = _3905 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3919 = _2606 + _3911;
    out.m_90.x = _3897;
    out.m_90.y = _3907;
    out.m_90.z = _3895;
    float _3921 = fma(_3915, -2.0, 3.0);
    float _3923 = _3915 * _3915;
    float _3925 = _3827 * _2880;
    float _3927 = _3827 * _2748;
    float _3929 = _3923 * _3921;
    float _3931 = fma(_3841, _2734, _3925);
    float _3933 = fma(_3841, _2728, _3927);
    float _3935 = _3905;
    if (!_3873)
    {
        _3354 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3937 = _3354;
    float _3939 = -_3929;
    float _3941 = _3939 + 1.0;
    float _3943 = _2620 + _3931;
    float _3945 = _3917 * _3436;
    float _3947 = -_3917;
    float _3949 = _3947 + 1.0;
    float _3951 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3929);
    float _3953 = _3941;
    float _3955 = _3949;
    float _3957 = _3937;
    float _3959 = _3937;
    if (!_3324)
    {
        _3953 = 1.0;
    }
    float _3961 = _3953;
    float _3963 = _3447 * _3945;
    float _3965 = _3961;
    if (_3324)
    {
        bool _3967 = _3434 >= _3384;
        bool _3969 = isnan(_3434);
        bool _3971 = _3967 || _3969;
        bool _3973 = isnan(_3384);
        bool _3975 = _3971 || _3973;
        float _3977 = float(_3975);
        _3965 = _3977;
    }
    float _3979 = _3965;
    float _3981 = _3857 * _3951;
    float _3983 = _2612 + _3933;
    float _3985 = _3447 * _3949;
    out.m_92.z = _3909;
    out.m_92.w = _3338;
    float _3987 = _3981 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3989 = _3979 * _3581;
    float _3991 = _3989;
    if (!_3873)
    {
        _3955 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3993 = _3955;
    out.m_94.x = _3919;
    out.m_94.y = _3943;
    out.m_94.z = _3983;
    float _3995 = _3861 * _3987;
    float _3997 = precise::clamp(_3995, 0.0, 1.0);
    float _3999 = _3993;
    float _4001 = _3993;
    if (!_3873)
    {
        _3935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4003 = _3935;
    float _4005 = -_3997;
    float _4007 = fma(_4005, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4009 = -_3989;
    float _4011 = fma(_4009, _4007, 1.0);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = _4003;
    float _4017 = _4003;
    if (!_3873)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4019 = _3991;
    float _4021 = _4013 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4021;
    float _4023 = _4021;
    float _4025 = _4019;
    float _4027 = _4019;
    if (!_3873)
    {
        _4023 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4029 = _4023;
    float _4031 = _3825 * _3945;
    float _4033 = fma(_3821, _3963, _3441);
    float _4035 = fma(_3823, _3963, _3443);
    float _4037 = _3517 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4039 = fma(_3447, _4031, _3445);
    float _4041 = _4029;
    float _4043 = _4029;
    if (!_3873)
    {
        _3467 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4045 = _3467;
    out.m_98.x = _4033;
    out.m_98.y = _4035;
    out.m_98.z = _4039;
    out.m_98.w = _3985;
    bool _4047 = !_3873;
    float _4049 = _4045;
    float _4051 = _4045;
    if (!_4047)
    {
        bool _4053 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4055 = isnan(_3603);
        bool _4057 = _4053 || _4055;
        bool _4059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4061 = _4057 || _4059;
        if (!_4061)
        {
            float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4065 = _3603 + _4063;
            float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4067;
            float _4071 = 1.0 / _4069;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4087 = _4085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4093 = _4065 * _4071;
            float _4095 = precise::clamp(_4093, 0.0, 1.0);
            float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4099 = _4097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4101 = fma(_4095, _4075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4103 = fma(_4095, _4099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4105 = fma(_4095, _4079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4107 = fma(_4095, _4083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4109 = fma(_4095, _4087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4111 = fma(_4095, _4091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3959 = _4103;
            _4027 = _4109;
            _4051 = _4101;
            _4017 = _4107;
            _4001 = _4105;
            _4043 = _4111;
            _4113 = true;
        }
        else
        {
            bool _4115 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4117 = isnan(_3603);
            bool _4119 = _4115 || _4117;
            bool _4121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4123 = _4119 || _4121;
            if (!_4123)
            {
                _4049 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4125 = _4049;
            _4051 = _4125;
            if (!_4123)
            {
                _3957 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4127 = _3957;
            _3959 = _4127;
            if (!_4123)
            {
                _3999 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4129 = _3999;
            _4001 = _4129;
            if (!_4123)
            {
                _4015 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4131 = _4015;
            _4017 = _4131;
            if (!_4123)
            {
                _4025 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4133 = _4025;
            _4027 = _4133;
            if (!_4123)
            {
                _4041 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4135 = _4041;
            bool _4137 = !_4123;
            _4043 = _4135;
            if (!_4137)
            {
                bool _4139 = _3603 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4141 = isnan(_3603);
                bool _4143 = _4139 || _4141;
                bool _4145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4147 = _4143 || _4145;
                if (!_4147)
                {
                    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4151 = _3603 + _4149;
                    float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4153;
                    float _4157 = 1.0 / _4155;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4179 = _4151 * _4157;
                    float _4181 = precise::clamp(_4179, 0.0, 1.0);
                    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4187 = fma(_4181, _4161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4189 = fma(_4181, _4185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4191 = fma(_4181, _4165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4193 = fma(_4181, _4169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4195 = fma(_4181, _4173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4197 = fma(_4181, _4177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3959 = _4189;
                    _4027 = _4195;
                    _4051 = _4187;
                    _4017 = _4193;
                    _4001 = _4191;
                    _4043 = _4197;
                    _4113 = true;
                }
                else
                {
                    _3959 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4027 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4051 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4017 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4001 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4043 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4113 = false;
    float _4199 = _3959;
    float _4201 = _4027;
    float _4203 = _4051;
    float _4205 = _4017;
    float _4207 = _4001;
    float _4209 = _4043;
    float _4211 = fma(_3943, -0.5, 0.5);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -_4199;
    float _4217 = _4215 + _4201;
    float _4219 = _4037 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4221 = -_4203;
    float _4223 = _4221 + _4205;
    out.m_100.x = 0.0;
    float _4225 = fma(_4213, _4217, _4199);
    float _4227 = fma(_4213, _4223, _4203);
    out.m_59.x = _4219;
    float _4229 = -_4207;
    float _4231 = _4229 + _4209;
    float _4233 = _4225 * 0.586610972881317138671875;
    bool _4235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4237 = fma(_4213, _4231, _4207);
    float _4239 = fma(_4227, 0.298911988735198974609375, _4233);
    bool _4241 = _3517 > 0.0;
    bool _4243 = isnan(_3517);
    bool _4245 = _4241 || _4243;
    bool _4247 = isnan(0.0);
    bool _4249 = _4245 || _4247;
    float _4251 = fma(_4237, 0.114477999508380889892578125, _4239);
    float _4253 = -_4251;
    float _4255 = _4227 + _4253;
    float _4257 = -_4251;
    float _4259 = _4225 + _4257;
    float _4261 = -_4251;
    float _4263 = _4237 + _4261;
    float _4265 = fma(_4255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    float _4267 = fma(_4259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    float _4269 = fma(_4263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4251);
    bool _4271 = !_4235;
    if (!_4271)
    {
        float _4273 = -_3262;
        float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4277 = -_3264;
        float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4281 = -_3266;
        float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4285 = _4275 * _4275;
        float _4287 = fma(_4279, _4279, _4285);
        float _4289 = fma(_4283, _4283, _4287);
        float _4291 = sqrt(_4289);
        float _4293 = rsqrt(_4289);
        float _4295 = -_4291;
        float _4297 = _4295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4299 = _4297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4301 = precise::clamp(_4299, 0.0, 1.0);
        float _4303 = _4279 * _4293;
        float _4305 = _4275 * _4293;
        float _4307 = abs(_4301);
        float _4309 = log2(_4307);
        float _4311 = _4283 * _4293;
        float _4313 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4315 = _3943 * _4305;
        float _4317 = -_4305;
        float _4319 = -_4313;
        float _4321 = fma(_4317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4319);
        float _4323 = fma(_3919, _4303, _4315);
        float _4325 = -_4311;
        float _4327 = fma(_4325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4321);
        float _4329 = fma(_3983, _4311, _4323);
        float _4331 = precise::clamp(_4329, 0.0, 1.0);
        float _4333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4335 = _4327 + _4333;
        float _4337 = _4309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4339 = _4335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4341 = precise::clamp(_4339, 0.0, 1.0);
        float _4343 = exp2(_4337);
        float _4345 = _4343 * _4341;
        float _4347 = _4331 * _4345;
        float _4349 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4351 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4353 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4349;
        out.m_100.y = _4351;
        out.m_100.z = _4353;
    }
    out.m_102.x = _4265;
    out.m_102.y = _4267;
    out.m_102.z = _4269;
    if (_4249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4355;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

