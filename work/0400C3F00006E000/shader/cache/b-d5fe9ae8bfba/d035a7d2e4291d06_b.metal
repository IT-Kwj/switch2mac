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
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_2A [[id(7)]];
    sampler vp_t_tcb_2ASmplr [[id(8)]];
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
    sampler vp_t_tcb_2ASmplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_88 [[user(locn1)]];
    float4 m_92 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_100 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_84 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_78 [[attribute(8)]];
    float4 m_80 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3487 = false;
    bool _3273 = false;
    bool _1615 = false;
    bool _1603 = false;
    bool _603 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
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
        out.m_63.x = 0.0;
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
        float _3786 = as_type<float>(_137);
        out.gl_Position.z = _3786;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    float _159 = _155;
    if (_151)
    {
        float _161 = float(_121);
        _157 = _161;
    }
    float _163 = _157;
    bool _165 = _155 >= _163;
    bool _167 = !_151;
    bool _169 = _165 || _167;
    if (_169)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3855 = as_type<float>(_175);
        out.gl_Position.z = _3855;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = in.m_70.x;
    float _181 = in.m_70.y;
    float _183 = in.m_70.z;
    float _185 = in.m_72.x;
    float _187 = in.m_72.y;
    float _189 = in.m_72.z;
    float _191 = in.m_74.x;
    float _193 = in.m_74.y;
    float _195 = in.m_74.z;
    float _197 = in.m_76.x;
    float _199 = in.m_76.y;
    float _201 = in.m_76.z;
    int _203 = as_type<int>(_177) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_177) & 2;
    bool _209 = _207 != 0;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = _181 * _187;
    float _215 = _181 * _193;
    float _217 = fma(_179, _185, _213);
    float _219 = _181 * _199;
    float _221 = fma(_179, _191, _215);
    float _223 = fma(_183, _189, _217);
    float _225 = fma(_179, _197, _219);
    float _227 = fma(_183, _195, _221);
    float _229 = fma(_183, _201, _225);
    bool _231 = !_205;
    float _233 = _231 ? (-0.5) : 0.5;
    bool _235 = !_209;
    float _237 = _235 ? (-0.5) : 0.5;
    bool _239 = !_211;
    float _257;
    if (!_239)
    {
        float _241 = in.m_78.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_121);
        float _263 = 1.0 / _261;
        float _265 = _155 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _267 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    bool _293 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_267);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = 1.0 / _283;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _287;
    float _313 = _271 * _305;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _325 * _329;
    float _333 = _275 * _309;
    bool _335 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_267);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _349;
    float _357 = -_345;
    float _359 = _357 + 1.0;
    float _361 = _279 * _311;
    bool _363 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_267);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_353, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_377, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _373 * _359;
    float _393 = fma(_383, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_387, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = _389 * _391;
    float _403 = _393 * _391;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _417 = fma(_407, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_379, _355, _409);
    float _421 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_395, _355, _415);
    float _425 = fma(_417, _331, _419);
    float _427 = fma(_421, _331, _423);
    float _429 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_307;
    float _451;
    if (!_433)
    {
        float _435 = in.m_78.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_121);
        float _457 = 1.0 / _455;
        float _459 = _155 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_461);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _487 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _489 = isnan(_461);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _499;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _469;
    float _517 = -_481;
    float _519 = _517 + 1.0;
    float _521 = _497 * _519;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = 1.0 / _485;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _501 * _515;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _545 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = _543 * _529;
    float _551 = _545 * _521;
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _461 + _557;
    float _561 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _551);
    float _565 = _481 * _555;
    float _567 = fma(_549, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _569 = fma(_567, _565, _563);
    float _571 = in.m_80.x;
    float _573 = in.m_80.y;
    float _575 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[117].x, _569);
    float _577 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_82.x = _561;
    out.m_82.y = _535;
    out.m_82.z = _537;
    out.m_82.w = _577;
    float _579 = _431 * _573;
    float _581 = _429 * _571;
    bool _583 = !_533;
    float _601;
    if (!_583)
    {
        float _585 = in.m_78.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_121);
        float _607 = 1.0 / _605;
        float _609 = _155 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = in.m_78.x;
    float _615 = in.m_78.y;
    float _617 = in.m_78.z;
    float _619 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _621 = in.m_60.x;
    float _623 = in.m_60.y;
    float _625 = in.m_60.z;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _629 = _627 != 0;
    float _631 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _635 = _633 != 0;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _639 = in.m_74.w;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _643 = _641 != 0;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _651 = _649 != 0;
    float _653 = in.m_72.w;
    bool _655 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _657 = isnan(_611);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = in.m_76.w;
    float _669 = _617 * 2.0;
    bool _671 = _613 > 0.5;
    float _673 = _613 * 2.0;
    float _675 = _193 * _623;
    float _677 = -_233;
    int _679 = _671 ? as_type<int>(_677) : as_type<int>(_233);
    float _681 = floor(_669);
    float _683 = _187 * _623;
    float _685 = _199 * _623;
    float _687 = fma(_191, _621, _675);
    float _689 = _615 + _617;
    float _691 = fma(_185, _621, _683);
    float _693 = fma(_197, _621, _685);
    float _695 = fma(_195, _625, _687);
    float _697 = floor(_673);
    float _699 = fma(_201, _625, _693);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _705 = fma(_189, _625, _691);
    float _707 = _613 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _709 = _681 > 0.0;
    float _711 = 1.0 / _703;
    bool _713 = _681 >= 0.0;
    bool _715 = isnan(_681);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = _617 + _613;
    float _725 = _617 + (-0.5);
    float _727 = -_637;
    float _729 = fma(_707, 2.0, _727);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _733 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _735 = log2(_733);
    float _737 = _615 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[79].z, _731);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _749 = _721 ? 0 : 1;
    float _751 = _615 + _613;
    float _753 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[78].z, _745);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _761 = fma(_737, -2.0, _747);
    float _763 = 1.0 / _741;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _769 = _613 + (-0.5);
    float _771 = _615 * 2.0;
    int _773 = ~_749;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = _735 * _155;
    int _781 = _777;
    if (!_709)
    {
        int _783 = ~_749;
        int _785 = _783 + 1;
        _781 = _785;
    }
    int _787 = _781;
    float _789 = 1.0 / _757;
    bool _791 = _697 >= 0.0;
    bool _793 = isnan(_697);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _767 * _711;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _803;
    bool _807 = _615 > 0.5;
    float _809 = _615 + (-0.5);
    int _811 = _799 ? 0 : 1;
    float _813 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[78].w, _759);
    float _815 = floor(_771);
    bool _817 = _697 > 0.0;
    float _819 = _689 + (-1.0);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _821;
    float _825 = _751 + (-1.0);
    int _827 = ~_811;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _835 = _611 + _833;
    float _837 = _823 * _763;
    float _839 = _805 * _789;
    float _841 = exp2(_779);
    float _843 = _723 + (-1.0);
    float _845 = -_237;
    int _847 = _807 ? as_type<int>(_845) : as_type<int>(_237);
    float _849 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _853 = _611 + _851;
    int _855 = _831;
    if (!_817)
    {
        int _857 = ~_811;
        int _859 = _857 + 1;
        _855 = _859;
    }
    int _861 = _855;
    float _863 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[79].x, _743);
    bool _865 = _815 > 0.0;
    float _867 = fma(_837, _853, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _869 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _871 = isnan(_611);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = fma(_839, _835, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _883 = _815 >= 0.0;
    bool _885 = isnan(_815);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _895 = _611 + _893;
    bool _897 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _899 = isnan(_611);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = -_879;
    float _911 = _909 + 1.0;
    float _913 = _863 * (-0.15915493667125701904296875);
    float _915 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _917 = fma(_801, _895, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _919 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _921 = isnan(_611);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _907 * _911;
    float _933 = _913 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = -_841;
    float _939 = _937 + 1.0;
    float _941 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _943 = -_907;
    float _945 = _943 + 1.0;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _949 = 1.0 + _947;
    float _951 = -_929;
    float _953 = _951 + 1.0;
    int _955 = _891 ? 0 : 1;
    float _957 = _929 * _945;
    float _959 = _913 * 6.283185482025146484375;
    float _961 = cos(_959);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = _665 * _953;
    float _975 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _977 = -_665;
    float _979 = _977 + 1.0;
    float _981 = _971 ? _939 : 0.0;
    float _983 = _867 * _973;
    bool _985 = !_635;
    float _987 = _985 ? _237 : as_type<float>(_847);
    float _989 = 1.0 / _949;
    bool _991 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _993 = isnan(1.0);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _999 = _995 || _997;
    float _1001 = _695 + _639;
    float _1003 = -_155;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[76].x, _729);
    float _1007 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[131].x, _983);
    bool _1009 = !_643;
    int _1011 = _1009 ? 0 : 1;
    float _1013 = _987 * _935;
    bool _1015 = !_629;
    float _1017 = _1015 ? _233 : as_type<float>(_679);
    float _1019 = _987 * _961;
    float _1021 = fma(_917, _957, _1007);
    int _1023 = abs(_1011);
    float _1025 = _705 + _653;
    float _1027 = -_1013;
    float _1029 = fma(_1017, _961, _1027);
    float _1031 = fma(_1017, _935, _1019);
    bool _1033 = !_647;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _753);
    float _1039 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    float _1041 = _1001 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    if (_999)
    {
        float _1043 = _981 * _989;
        _159 = _1043;
    }
    float _1045 = _159;
    int _1047 = abs(_1035);
    float _1049 = _1025 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1051 = float(_1023);
    float _1053 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1055 = float(_787);
    float _1057 = _699 + _667;
    float _1059 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1061 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1053);
    float _1063 = fma(_881, _931, _1021);
    float _1065 = _1051 * _1055;
    int _1067 = ~_955;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = in.m_84.x;
    float _1075 = in.m_84.y;
    float _1077 = in.m_84.z;
    int _1079 = _1071;
    if (!_865)
    {
        int _1081 = ~_955;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = _1057 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1089 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1093 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1061);
    float _1097 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1089);
    float _1099 = -_1057;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1093);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1107 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1097);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1111 = -_1001;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = float(_861);
    float _1117 = _1105 * _1059;
    bool _1119 = !_651;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1107 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1125 = -_1025;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1129 = _1113 * _1113;
    int _1131 = abs(_1121);
    float _1133 = _1123 * _1091;
    float _1135 = _1065 * (-2.0);
    float _1137 = float(_1047);
    float _1139 = fma(_1127, _1127, _1129);
    float _1141 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1103);
    float _1143 = fma(_1117, 0.5, 0.5);
    float _1145 = float(_1085);
    float _1147 = fma(_1135, _1073, _1073);
    float _1149 = _1137 * _1115;
    float _1151 = fma(_1101, _1101, _1139);
    float _1153 = float(_1131);
    float _1155 = fma(_941, _1135, _941);
    float _1157 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1147);
    float _1159 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1161 = _1029 + 0.5;
    float _1163 = rsqrt(_1151);
    float _1165 = _1149 * (-2.0);
    float _1167 = _1153 * _1145;
    float _1169 = fma(_1159, _1161, _1005);
    float _1171 = -_1037;
    float _1173 = _1171 + 1.0;
    float _1175 = fma(_1165, _1075, _1075);
    float _1177 = fma(_849, _1165, _849);
    float _1179 = _1167 * (-2.0);
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1183 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1175);
    float _1185 = fma(_1155, _1045, _1157);
    float _1187 = fma(_915, _1179, _915);
    float _1189 = fma(_1179, _1077, _1077);
    float _1191 = fma(_1177, _1045, _1183);
    float _1193 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1063);
    float _1195 = -_1173;
    float _1197 = fma(_1029, _1195, _1169);
    float _1199 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1189);
    float _1201 = _1127 * _1163;
    float _1203 = _1101 * _1163;
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1207 = fma(_1187, _1045, _1199);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1211 = _1201 * _1209;
    float _1213 = _1031 + (-0.5);
    float _1215 = _1113 * _1163;
    float _1217 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1219 = _1207 * 0.15915493667125701904296875;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1223 = _1203 * _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1227 = -_1211;
    float _1229 = fma(_1203, _1225, _1227);
    float _1231 = -_1217;
    float _1233 = -_975;
    float _1235 = fma(_1231, _1213, _1233);
    float _1237 = fma(_1133, 0.5, 0.5);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1241 = _1215 * _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1245 = -_1223;
    float _1247 = fma(_1215, _1243, _1245);
    float _1249 = _1229 * _1229;
    float _1251 = _1185 * 0.15915493667125701904296875;
    float _1253 = _1191 * 0.15915493667125701904296875;
    float _1255 = -_1039;
    float _1257 = _1255 + 1.0;
    float _1259 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1261 = floor(_1237);
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1265 = -_1241;
    float _1267 = fma(_1201, _1263, _1265);
    float _1269 = fma(_1247, _1247, _1249);
    float _1271 = _1141 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1273 = fma(_1031, _1257, _1235);
    float _1275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _237);
    float _1277 = floor(_1143);
    float _1279 = _1271 * _1205;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1285 = _619 * _1275;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1289 = fma(_1279, 0.5, 0.5);
    float _1291 = _1251 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_86.x = _1197;
    out.m_86.y = _1273;
    bool _1301 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1303 = isnan(1.0);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1309 = _1305 || _1307;
    float _1311 = _1251 * 6.283185482025146484375;
    float _1313 = cos(_1311);
    out.m_88.x = _1295;
    out.m_88.y = _1297;
    out.m_88.z = _1299;
    out.m_88.w = _1259;
    float _1315 = -_1277;
    float _1317 = _1143 + _1315;
    float _1319 = _1253 * 6.283185482025146484375;
    float _1321 = sin(_1319);
    float _1323 = -_1261;
    float _1325 = _1237 + _1323;
    float _1327 = _1253 * 6.283185482025146484375;
    float _1329 = cos(_1327);
    float _1331 = _1219 * 6.283185482025146484375;
    float _1333 = cos(_1331);
    float _1335 = fma(_1267, _1267, _1269);
    float _1337 = _1293 * _1321;
    float _1339 = _1313 * _1321;
    float _1341 = _1219 * 6.283185482025146484375;
    float _1343 = sin(_1341);
    float _1345 = _1313 * _1329;
    float _1347 = _1293 * _1329;
    float _1349 = rsqrt(_1335);
    float _1351 = _1321 * _1333;
    float _1353 = fma(_1325, 2.0, -1.0);
    float _1355 = _1293 * _1333;
    float _1357 = _1329 * _1333;
    float _1359 = _1313 * _1333;
    float _1361 = fma(_1317, 2.0, -1.0);
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1365 = floor(_1289);
    float _1367 = fma(_1343, _1345, _1337);
    float _1369 = fma(_1343, _1337, _1345);
    float _1371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _1373 = -_1339;
    float _1375 = fma(_1343, _1347, _1373);
    float _1377 = -_1347;
    float _1379 = fma(_1343, _1339, _1377);
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1383 = _631 * _1371;
    float _1385 = _1229 * _1349;
    float _1387 = _1267 * _1349;
    float _1389 = _1247 * _1349;
    float _1391 = -_1285;
    float _1393 = _1343 * _1391;
    float _1395 = _1359 * _1285;
    float _1397 = _1355 * _1285;
    float _1399 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1403 = -_1365;
    float _1405 = _1289 + _1403;
    float _1407 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1409 = fma(_1357, _1383, _1393);
    float _1411 = fma(_1367, _1383, _1395);
    float _1413 = fma(_1375, _1383, _1397);
    float _1415 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1399);
    float _1417 = _1203 * _1385;
    float _1419 = _1201 * _1387;
    float _1421 = _1215 * _1389;
    float _1423 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1401);
    float _1425 = -_1417;
    float _1427 = fma(_1215, _1387, _1425);
    float _1429 = -_1419;
    float _1431 = fma(_1203, _1389, _1429);
    float _1433 = -_1421;
    float _1435 = fma(_1201, _1385, _1433);
    float _1437 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1407);
    float _1439 = _1359 * _1427;
    float _1441 = _1359 * _1431;
    float _1443 = _1359 * _1435;
    float _1445 = _1367 * _1427;
    float _1447 = -_1343;
    float _1449 = fma(_1447, _1389, _1439);
    float _1451 = -_1343;
    float _1453 = fma(_1451, _1385, _1441);
    float _1455 = -_1343;
    float _1457 = fma(_1455, _1387, _1443);
    float _1459 = _1367 * _1435;
    float _1461 = fma(_1355, _1201, _1449);
    float _1463 = fma(_1355, _1215, _1453);
    float _1465 = fma(_1355, _1203, _1457);
    float _1467 = _237 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1469 = _1367 * _1431;
    float _1471 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1473 = fma(_1357, _1389, _1445);
    float _1475 = fma(_1357, _1387, _1459);
    float _1477 = _1467 * _1461;
    float _1479 = _1467 * _1463;
    float _1481 = _1467 * _1465;
    float _1483 = fma(_1357, _1385, _1469);
    float _1485 = fma(_1379, _1471, _1411);
    float _1487 = _1379 * _1427;
    float _1489 = _1379 * _1431;
    float _1491 = _1379 * _1435;
    float _1493 = fma(_1375, _1201, _1473);
    float _1495 = fma(_1375, _1215, _1483);
    float _1497 = fma(_1375, _1203, _1475);
    float _1499 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1501 = fma(_1351, _1389, _1487);
    float _1503 = fma(_1351, _1385, _1489);
    float _1505 = fma(_1351, _1387, _1491);
    float _1507 = fma(_1351, _1471, _1409);
    float _1509 = fma(_1499, _1493, _1477);
    float _1511 = fma(_1499, _1495, _1479);
    float _1513 = fma(_1499, _1497, _1481);
    float _1515 = fma(_1369, _1201, _1501);
    float _1517 = fma(_1369, _1215, _1503);
    float _1519 = fma(_1369, _1203, _1505);
    float _1521 = fma(_1369, _1471, _1413);
    float _1523 = _1515 + _1509;
    float _1525 = _1517 + _1511;
    float _1527 = _1519 + _1513;
    float _1529 = fma(_1405, 2.0, -1.0);
    float _1531 = _1427 * _1485;
    float _1533 = _1431 * _1485;
    float _1535 = _1435 * _1485;
    out.m_90.x = _1523;
    out.m_90.y = _1525;
    out.m_90.z = _1527;
    float _1537 = _1529 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1539 = fma(_1389, _1507, _1531);
    float _1541 = fma(_1385, _1507, _1533);
    float _1543 = fma(_1387, _1507, _1535);
    float _1545 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1415);
    float _1547 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1423);
    float _1549 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1437);
    float _1551 = fma(_1201, _1521, _1539);
    float _1553 = fma(_1215, _1521, _1541);
    float _1555 = fma(_1203, _1521, _1543);
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1559 = _1547 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1561 = _1549 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1563 = _1551 + _1557;
    float _1565 = _1553 + _1559;
    float _1567 = _1555 + _1561;
    float _1569 = _1389;
    float _1571 = _1533;
    float _1573 = _1555;
    float _1575 = _1405;
    float _1577 = _1389;
    float _1579 = _1555;
    float _1581 = _1551;
    float _1583 = _1405;
    float _1585 = _1361;
    float _1587 = _1353;
    float _1589 = _1201;
    float _1591 = _1529;
    int _1593 = as_type<int>(_1483);
    int _1595 = as_type<int>(_1507);
    float _1597 = _1141;
    float _1607;
    float _1609;
    float _1611;
    float _1613;
    if (!_1309)
    {
        bool _1599 = _1559 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1601 = !_1599;
        _1603 = _1601;
        if (!_1603)
        {
            float _1605 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1607 = _1605;
            _1609 = 0.0;
            _1611 = 0.0;
            _1613 = 0.0;
            _1615 = true;
        }
    }
    if ((!_1615) || _1603)
    {
        bool _1651;
        if (!_1603)
        {
            bool _1617 = _1559 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1619 = isnan(_1559);
            bool _1621 = _1617 || _1619;
            bool _1623 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1625 = _1621 || _1623;
            bool _1627 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1629 = !_1625;
            bool _1631 = _1627 && _1629;
            bool _1633 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1581 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1631)
            {
                _1569 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1635 = _1569;
            float _1637 = _1635;
            if (_1631)
            {
                _1571 = 0.0;
            }
            float _1639 = _1571;
            _1609 = _1639;
            if (_1631)
            {
                _1573 = 0.0;
            }
            float _1641 = _1573;
            _1579 = _1641;
            _1611 = _1641;
            if (_1631)
            {
                float _1643 = _1635 * 5.0;
                _1637 = _1643;
            }
            float _1645 = _1637;
            _1577 = _1645;
            _1607 = _1645;
            if (_1631)
            {
                _1575 = 0.0;
            }
            float _1647 = _1575;
            bool _1649 = !_1625;
            _1651 = _1649 && _1633;
            _1583 = _1647;
            _1613 = _1647;
        }
        if ((!_1651) || _1603)
        {
            _1603 = false;
            float _1653 = _1577;
            float _1655 = _1579;
            float _1657 = _1581;
            float _1659 = _1583;
            bool _1661 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1663 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1665 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1667 = _1653;
            float _1669 = _1657;
            float _1671 = _1659;
            _1609 = _1563;
            if (_1661)
            {
                float _1673 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1667 = _1673;
            }
            float _1675 = _1667;
            if (_1661)
            {
                float _1677 = abs(_1361);
                float _1679 = -_1677;
                float _1681 = _1679 + 1.0;
                _1585 = _1681;
            }
            float _1683 = _1585;
            if (_1663)
            {
                float _1685 = abs(_1353);
                float _1687 = -_1685;
                float _1689 = _1687 + 1.0;
                _1587 = _1689;
            }
            float _1691 = _1587;
            if (!_1661)
            {
                _1589 = 1.0;
            }
            float _1693 = _1589;
            float _1695 = _1693;
            if (_1665)
            {
                float _1697 = abs(_1529);
                float _1699 = -_1697;
                float _1701 = _1699 + 1.0;
                _1591 = _1701;
            }
            float _1703 = _1591;
            if (!_1663)
            {
                _1669 = 1.0;
            }
            float _1705 = _1669;
            float _1707 = _1705;
            if (!_1665)
            {
                _1671 = 1.0;
            }
            float _1709 = _1671;
            float _1711 = _1553;
            float _1713 = _1709;
            if (_1663)
            {
                float _1715 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1711 = _1715;
            }
            float _1717 = _1711;
            float _1719 = _1655;
            if (_1665)
            {
                float _1721 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1719 = _1721;
            }
            float _1723 = _1719;
            if (_1661)
            {
                float _1725 = _1683 * _1675;
                float _1727 = precise::clamp(_1725, 0.0, 1.0);
                _1695 = _1727;
            }
            float _1729 = _1695;
            _1607 = _1567;
            if (_1663)
            {
                float _1731 = _1691 * _1717;
                float _1733 = precise::clamp(_1731, 0.0, 1.0);
                _1707 = _1733;
            }
            float _1735 = _1707;
            float _1737 = _1729 * _1735;
            if (_1665)
            {
                float _1739 = _1703 * _1723;
                float _1741 = precise::clamp(_1739, 0.0, 1.0);
                _1713 = _1741;
            }
            float _1743 = _1713;
            float _1745 = _1737 * _1743;
            _1611 = _1565;
            _1613 = _1745;
        }
    }
    _1615 = false;
    float _1747 = _1607;
    float _1749 = _1609;
    float _1751 = _1611;
    float _1753 = _1613;
    float _1755 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1757 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1759 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1761 = _1559 + _1757;
    float _1763 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1759);
    float _1765 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1767 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1769 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1773 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1765);
    float _1775 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1767);
    float _1777 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1769);
    float _1779 = 1.0 / _1771;
    float _1781 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1773);
    float _1783 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1775);
    float _1785 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1777);
    float _1787 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1789 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1791 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1793 = _1787 + _1771;
    float _1795 = trunc(_1789);
    int _1797 = int(_1795);
    float _1799 = _1793 * _1779;
    float _1801 = _1799 * 0.5;
    float _1803 = trunc(_1791);
    int _1805 = int(_1803);
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1809 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1807);
    float _1811 = 1.0 / _1809;
    int _1813 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1815 = _1797 + _1813;
    int _1817 = _1815 + 1;
    int _1819 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1821 = _1805 + _1819;
    int _1823 = _1821 + 1;
    int _1825 = _1817 | _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1829 = _1811 * _1827;
    bool _1831 = _1829 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1833 = _1829 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1835 = !_1831;
    int _1837 = _1835 ? 0 : 1;
    int _1839 = 2;
    int _1841 = _1817;
    float _1843 = _1789;
    float _1845 = _1751;
    float _1847 = _1749;
    float _1849 = _1747;
    float _1851 = _1753;
    if (!_1831)
    {
        _1839 = 1;
    }
    int _1853 = _1839;
    int _1855 = _1853;
    if (!_1833)
    {
        _1855 = _1837;
    }
    int _1857 = _1855;
    bool _1859 = _1817 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1861 = _1857 << 6;
    bool _1863 = _1825 < 0;
    bool _1865 = _1863 || _1859;
    int _1867 = _1861 + 96;
    uint _1870 = uint(int(uint(_1867) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    bool _1886 = _1823 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1888 = _1886 || _1865;
    int _1890 = _1861 + 104;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
    if (!_1888)
    {
        int _1908 = _1823 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1910 = _1908 + _1817;
        _1841 = _1910;
    }
    int _1912 = _1841;
    int _1914 = _1861 + 48;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    if (!_1888)
    {
        int _1932 = _1912 << 2;
        _1593 = _1932;
    }
    int _1934 = _1593;
    int _1936 = _1861 + 64;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    uint _1940 = uint(int(uint(int(_1938)) >> uint(2)));
    int _1942 = int(_1938) & 3;
    float _1944 = (*spvDescriptorSet0.vp_c15)._m0[int(_1940)][_1942];
    int _1946 = int(_1938) + 1;
    uint _1948 = uint(int(uint(_1946) >> uint(2)));
    int _1950 = _1946 & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = _1861 + 56;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = _1861 + 72;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
    float _1990 = _1761 * _1884;
    int _1992 = as_type<int>(_1884);
    int _1994 = as_type<int>(_1990);
    if (!_1888)
    {
        uint _1996 = uint(int(uint(_1912) >> uint(2)));
        _1992 = int(_1996);
    }
    int _1998 = _1992;
    float _2000 = fma(_1557, _1876, _1990);
    if (!_1888)
    {
        int _2002 = 12 & _1934;
        _1994 = _2002;
    }
    int _2004 = _1994;
    float _2006 = fma(_1561, _1898, _2000);
    if (!_1888)
    {
        int _2008 = _1998 << 4;
        int _2010 = _2008 + _2004;
        _1595 = _2010;
    }
    int _2012 = _1595;
    float _2014 = _2006 + _1906;
    float _2016 = _1475;
    if (!_1888)
    {
        int _2018 = _2012 + 400;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
        int _2024 = int(_2020) & 3;
        float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
        _2016 = _2026;
    }
    float _2028 = _2016;
    float _2030 = _1761 * _1930;
    float _2032 = 1.0 / _2014;
    float _2034 = fma(_1557, _1922, _2030);
    int _2036 = _1861 + 80;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c15)._m0[int(_2040)][_2042];
    int _2046 = int(_2038) + 1;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    int _2050 = _2046 & 3;
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[int(_2048)][_2050];
    float _2054 = _1761 * _1952;
    float _2056 = fma(_1557, _1944, _2054);
    int _2058 = _1861 + 88;
    uint _2060 = uint(int(uint(_2058) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c15)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[int(_2070)][_2072];
    float _2076 = fma(_1561, _1962, _2034);
    float _2078 = _2076 + _1970;
    float _2080 = fma(_1561, _1980, _2056);
    float _2082 = _2078 * _2032;
    float _2084 = _2078;
    if (!_1888)
    {
        float _2086 = floor(_1791);
        _2084 = _2086;
    }
    float _2088 = _2084;
    float _2090 = _2080 + _1988;
    float _2092 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _2094 = _2082 >= 0.0;
    float _2096 = _2090 * _2032;
    bool _2098 = _2082 <= 1.0;
    bool _2100 = _2098 && _2094;
    float _2102 = floor(_2092);
    float _2104 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _2106 = _2096 >= 0.0;
    bool _2108 = _2106 && _2100;
    bool _2110 = _2096 <= 1.0;
    bool _2112 = _2110 && _2108;
    float _2114 = floor(_2104);
    float _2116 = _2088;
    if (!_1888)
    {
        float _2118 = -_2088;
        float _2120 = _1791 + _2118;
        _2116 = _2120;
    }
    float _2122 = _2116;
    float _2124 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1888)
    {
        float _2126 = floor(_1789);
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = _1761 * _2052;
    float _2132 = fma(_1557, 6.2500002968590706586837768554688e-05, 0.5);
    float _2134 = -_2102;
    float _2136 = _2092 + _2134;
    float _2138 = _2136;
    float _2140 = _2028;
    if (_2112)
    {
        float _2142 = float(_1857);
        _1597 = _2142;
    }
    float _2144 = _1597;
    float _2146 = fma(_1557, _2044, _2130);
    float _2148 = fma(_1561, 6.2500002968590706586837768554688e-05, 0.5);
    float _2150 = as_type<float>(_1861);
    float _2152 = _2074;
    if (!_1888)
    {
        float _2154 = rint(_2028);
        float _2156 = precise::max(_2154, 0.0);
        uint _2158 = uint(_2156);
        uint _2160 = clamp(_2158, 0u, 65535u);
        _2150 = as_type<float>(_2160);
    }
    float _2162 = _2150;
    float _2164 = fma(_1561, _2066, _2146);
    float _2166 = -_2114;
    float _2168 = _2104 + _2166;
    float _2170 = _2164 + _2074;
    float _2172 = _2144;
    float _2174 = _2114;
    if (_2112)
    {
        float _2176 = rint(_2144);
        float _2178 = precise::max(_2176, 0.0);
        uint _2180 = uint(_2178);
        uint _2182 = clamp(_2180, 0u, 65535u);
        _2172 = as_type<float>(_2182);
    }
    float _2184 = _2172;
    if (!_1888)
    {
        float _2186 = -_2128;
        float _2188 = _1789 + _2186;
        _1843 = _2188;
    }
    float _2190 = _1843;
    float _2192 = _2170 * _2032;
    float2 _7038 = float2(_2132, _2148);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_7038, float2(0.0), isnan(_7038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_7038, float2(0.0), isnan(_7038)), level(0.0)).x;
    float2 _7048 = float2(_2136, _2168);
    float _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7048, float2(0.0), isnan(_7048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7048, float2(0.0), isnan(_7048)), level(0.0)).x;
    float _2198 = _2162;
    if (!_1888)
    {
        float3 _7063 = float3(_2190, _2122, float(as_type<int>(_2162)));
        float3 _7067 = select(_7063, float3(0.0), isnan(_7063));
        float _2200 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7067.xy, uint(rint(_7067.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7067.xy, uint(rint(_7067.z)), level(0.0)).x;
        _2198 = _2200;
    }
    float _2202 = _2198;
    float _2204 = _2184;
    if (_2112)
    {
        float3 _7082 = float3(_2082, _2096, float(as_type<int>(_2184)));
        float3 _7084 = select(_7082, float3(0.0), isnan(_7082));
        float _2206 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7084.xy, uint(rint(_7084.z)), _2192, level(0.0));
        _2204 = _2206;
    }
    float _2208 = _2204;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2212 = _1747 + _2210;
    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2216 = _1749 + _2214;
    float _2218 = _2212 * _2212;
    float _2220 = fma(_2216, _2216, _2218);
    float _2222 = sqrt(_2220);
    bool _2224 = _2222 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2226 = !_2224;
    if (!_2226)
    {
        float _2228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2232 = _2222 + _2230;
        float _2234 = _1751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = rsqrt(_2220);
        float _2238 = _2232 * _2228;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2240 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = _2240 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2244 + (-1.0);
        float _2252 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2254 = fma(_2248, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2256 = fma(_2244, _1751, _2252);
        float _2258 = _2236 * _2254;
        float _2260 = fma(_2216, _2258, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2262 = fma(_2212, _2258, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1845 = _2256;
        _1847 = _2260;
        _1849 = _2262;
    }
    float _2264 = _1845;
    float _2266 = _1847;
    float _2268 = _1849;
    float _2270 = _2194 * 2000.0;
    bool _2272 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2274 = isnan(0.5);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2280 = _2276 || _2278;
    bool _2282 = _1559 >= _2270;
    bool _2284 = isnan(_1559);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(_2270);
    bool _2290 = _2286 || _2288;
    float _2292 = _2270;
    float _2294 = _2266;
    if (_2290)
    {
        _2174 = _2264;
    }
    float _2296 = _2174;
    float _2298 = _2296;
    if (!_2290)
    {
        _2298 = 0.0;
    }
    float _2300 = _2298;
    float _2302 = _2300;
    if (_2290)
    {
        _2138 = _2266;
    }
    float _2304 = _2138;
    float _2306 = _2304;
    if (!_2290)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2308 = _2292;
    float _2310 = -_1559;
    float _2312 = _2310 + _2300;
    if (!_2290)
    {
        _2306 = 0.0;
    }
    float _2314 = _2306;
    float _2316 = _2314;
    if (_2290)
    {
        _2140 = _2268;
    }
    float _2318 = _2140;
    float _2320 = _2318;
    if (!_2290)
    {
        float _2322 = _2308 * 5.0;
        _2320 = _2322;
    }
    float _2324 = _2320;
    float _2326 = _2312 * _2312;
    float _2328 = -_1557;
    float _2330 = _2328 + _2314;
    float _2332 = -_1561;
    float _2334 = _2332 + _2324;
    float _2336 = fma(_2330, _2330, _2326);
    float _2338 = fma(_2334, _2334, _2336);
    float _2340 = sqrt(_2338);
    bool _2342 = _2340 > 0.0;
    bool _2344 = !_2342;
    float _2346 = _2324;
    float _2348 = _2338;
    float _2350 = _2330;
    if (!_2344)
    {
        float _2352 = _227 * _227;
        float _2354 = fma(_223, _223, _2352);
        float _2356 = rsqrt(_2338);
        float _2358 = fma(_229, _229, _2354);
        float _2360 = sqrt(_2358);
        float _2362 = _2330 * _2356;
        float _2364 = _2312 * _2356;
        float _2366 = _2334 * _2356;
        bool _2368 = _2360 > 0.0;
        bool _2370 = !_2368;
        _2294 = _2364;
        if (!_2370)
        {
            float _2372 = rsqrt(_2358);
            float _2374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2376 = _227 * _2372;
            float _2378 = _223 * _2372;
            float _2380 = _229 * _2372;
            float _2382 = _2364 * _2376;
            float _2384 = fma(_2362, _2378, _2382);
            float _2386 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2388 = fma(_2366, _2380, _2384);
            float _2390 = _2388 * _2386;
            float _2392 = fma(_223, _2390, _2314);
            float _2394 = fma(_227, _2390, _2300);
            float _2396 = fma(_229, _2390, _2324);
            _2316 = _2392;
            _2302 = _2394;
            _2346 = _2396;
            _2348 = _2378;
            _2350 = _2384;
        }
    }
    float _2398 = _2316;
    float _2400 = _2302;
    float _2402 = _2346;
    float _2404 = _2294;
    float _2406 = _2348;
    float _2408 = _2350;
    float _2410 = _2400;
    float _2412 = _2398;
    float _2414 = _2402;
    float _2416 = _2406;
    float _2418 = _2408;
    float _2420 = _2404;
    if (!_2280)
    {
        float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2424 = _1559 + _2422;
        float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2428 = _1557 + _2426;
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2432 = -_1557;
        float _2434 = _2432 + _2398;
        float _2436 = _2424 * _2424;
        float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2440 = _1561 + _2438;
        float _2442 = -_1559;
        float _2444 = _2442 + _2400;
        float _2446 = fma(_2428, _2428, _2436);
        float _2448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2450 = fma(_2440, _2440, _2446);
        float _2452 = sqrt(_2450);
        float _2454 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2456 = precise::min(_2452, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2458 = _2456 * _2448;
        float _2460 = _2454 * _2458;
        float _2462 = -_1561;
        float _2464 = _2462 + _2402;
        float _2466 = fma(_2434, _2460, _1557);
        float _2468 = fma(_2444, _2460, _1559);
        float _2470 = fma(_2464, _2460, _1561);
        _2410 = _2468;
        _2412 = _2466;
        _2414 = _2470;
        _2416 = _2464;
        _2418 = _2448;
    }
    float _2472 = _2410;
    float _2474 = _2412;
    float _2476 = _2414;
    float _2478 = _2416;
    float _2480 = _2418;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2484 = _2472 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2488 = _2474 + _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2492 = _2476 + _2490;
    float _2494 = _2484 * _2484;
    float _2496 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2498 = fma(_2488, _2488, _2494);
    float _2500 = fma(_2492, _2492, _2498);
    float _2502 = rsqrt(_2500);
    float _2504 = sqrt(_2500);
    float _2506 = _2502 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2508 = _2488 * _2506;
    float _2510 = _2492 * _2506;
    float _2512 = _2508 * _2508;
    float _2514 = _2510 * _2510;
    float _2516 = _2512 + _2514;
    float _2518 = sqrt(_2516);
    bool _2520 = _2518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2524 = _2518 + _2522;
    float _2526 = _2498;
    float _2528 = _2480;
    float _2530 = _2524;
    float _2532 = _2506;
    float _2534 = _2512;
    if (_2520)
    {
        float _2536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2526 = _2536;
    }
    float _2538 = _2526;
    if (_2520)
    {
        float _2540 = rsqrt(_2516);
        _2528 = _2540;
    }
    float _2542 = _2528;
    float _2544 = _2542;
    if (_2520)
    {
        float _2546 = _2524 * _2538;
        _2530 = _2546;
    }
    float _2548 = _2530;
    float _2550 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2520)
    {
        float _2552 = _2548 * 0.15915493667125701904296875;
        _2420 = _2552;
    }
    float _2554 = _2420;
    float _2556 = _2538;
    if (_2520)
    {
        float _2558 = _2554 * 6.283185482025146484375;
        float _2560 = sin(_2558);
        _2556 = _2560;
    }
    float _2562 = _2556;
    float _2564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2566 = precise::max(0.0, _2564);
    float _2568 = _2478;
    float _2570 = _2566;
    if (_2520)
    {
        float _2572 = _2554 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2568 = _2574;
    }
    float _2576 = _2568;
    float _2578 = -_2506;
    float _2580 = -_2566;
    float _2582 = fma(_2484, _2578, _2580);
    if (_2520)
    {
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2570 = _2584;
    }
    float _2586 = _2570;
    float _2588 = _2586;
    float _2590 = _2562;
    if (_2520)
    {
        float _2592 = fma(_2562, _2586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2588 = _2592;
    }
    float _2594 = _2588;
    float _2596 = _2594;
    float _2598 = _2576;
    if (_2520)
    {
        float _2600 = _2576 + (-1.0);
        _2590 = _2600;
    }
    float _2602 = _2590;
    float _2604 = _2602;
    if (_2520)
    {
        float _2606 = _2542 * _2594;
        _2152 = _2606;
    }
    float _2608 = _2152;
    if (!_2520)
    {
        _2544 = _2508;
    }
    float _2610 = _2544;
    float _2612 = _2610;
    if (_2520)
    {
        float _2614 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2532 = _2614;
    }
    float _2616 = _2532;
    if (_2520)
    {
        float _2618 = _2508 * _2608;
        _2612 = _2618;
    }
    float _2620 = _2612;
    if (!_2520)
    {
        _2596 = _2582;
    }
    float _2622 = _2596;
    float _2624 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2550);
    float _2626 = _2622;
    if (!_2520)
    {
        _2604 = _2510;
    }
    float _2628 = _2604;
    float _2630 = _2628;
    if (_2520)
    {
        float _2632 = fma(_2582, _2576, _2616);
        _2626 = _2632;
    }
    float _2634 = _2626;
    if (_2520)
    {
        float _2636 = _2510 * _2608;
        _2630 = _2636;
    }
    float _2638 = _2630;
    if (_2520)
    {
        float _2640 = _2620 * _2620;
        _2534 = _2640;
    }
    float _2642 = _2534;
    if (!_2520)
    {
        _2598 = _2514;
    }
    float _2644 = _2598;
    float _2646 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = _2644;
    if (_2520)
    {
        float _2650 = _2638 * _2638;
        _2648 = _2650;
    }
    float _2652 = _2648;
    float _2654 = fma(_2634, _2634, _2642);
    float _2656 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2624);
    float _2658 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2660 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2662 = _2654 + _2652;
    float _2664 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2666 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2658);
    float _2668 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2660);
    float _2670 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2664);
    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2674 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2672);
    float _2676 = precise::clamp(_2674, 0.0, 1.0);
    float _2678 = rsqrt(_2662);
    float _2680 = _2666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2682 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2670);
    float _2684 = -_2676;
    float _2686 = _2684 + 1.0;
    float _2688 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2690 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2692 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2694 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2668);
    float _2696 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = abs(_2686);
    float _2700 = log2(_2698);
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2690);
    float _2704 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2706 = -_2696;
    float _2708 = fma(_2706, _2496, 1.0);
    float _2710 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2702);
    float _2712 = _2678 * _2620;
    float _2714 = _2678 * _2634;
    float _2716 = _2678 * _2638;
    float _2718 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2710);
    float _2720 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2722 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2724 = log2(_2708);
    float _2726 = -_2720;
    float _2728 = fma(_2714, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2726);
    float _2730 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2732 = -_2716;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2728);
    float _2736 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2738 = 1.0 / _2718;
    float _2740 = fma(_2734, -0.5, 0.5);
    float _2742 = fma(_2734, 0.5, 0.5);
    float _2744 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2722);
    float _2746 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2736);
    float _2748 = _2714 + 1.0;
    float _2750 = fma(_2742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2752 = exp2(_2730);
    float _2754 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2744);
    float _2756 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2746);
    float _2758 = fma(_2742, _2750, -0.212114393711090087890625);
    float _2760 = _2724 * 0.693147182464599609375;
    float _2762 = fma(_2742, _2758, 1.570728778839111328125);
    float _2764 = sqrt(_2740);
    float _2766 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2768 = -_2714;
    float _2770 = fma(_2752, _2748, _2768);
    float _2772 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2754);
    float _2774 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2756);
    float _2776 = fma(_2770, 0.5, 0.5);
    float _2778 = _2772 * _2738;
    float _2780 = _2774 * _2738;
    float _2782 = _2764 * 0.636619746685028076171875;
    float _2784 = fma(_2778, 0.5, 0.5);
    float _2786 = fma(_2780, -0.5, 0.5);
    float _2788 = -_2762;
    float _2790 = fma(_2782, _2788, 1.0);
    float3 _8007 = float3(_2784, _2786, _2766);
    float _2792 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8007, float3(0.0), isnan(_8007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8007, float3(0.0), isnan(_8007)), level(0.0)).x;
    float3 _8016 = float3(_2784, _2786, _2766);
    float4 _2795 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8016, float3(0.0), isnan(_8016)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8016, float3(0.0), isnan(_8016)), level(0.0)).xyzw;
    float _2797 = _2795.x;
    float _2799 = _2795.y;
    float _2801 = _2795.z;
    float _2803 = _2795.w;
    float2 _8032 = float2(_2790, _2776);
    float3 _2807 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8032, float2(0.0), isnan(_8032)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8032, float2(0.0), isnan(_8032)), level(0.0)).xyz;
    float _2809 = _2807.x;
    float _2811 = _2807.y;
    float _2813 = _2807.z;
    float _2815 = abs(_1829);
    float _2817 = log2(_2815);
    out.m_92.x = _2488;
    out.m_92.y = _2484;
    out.m_92.z = _2492;
    bool _2819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2821 = isnan(0.5);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2827 = _2823 || _2825;
    float _2829 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2831 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2829);
    float _2833 = _2772 + _2718;
    float _2835 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2837 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2839 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2831);
    float _2841 = _2833 * 0.5;
    float _2843 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2837);
    float _2845 = exp2(_2835);
    float _2847 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2849 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2843);
    float _2851 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2847);
    float _2853 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2849);
    float _2855 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2851);
    float _2857 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2859 = _2853 + _2718;
    out.gl_Position.x = _2772;
    out.gl_Position.y = _2774;
    out.gl_Position.z = _2853;
    out.gl_Position.w = _2718;
    float _2861 = _2855 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2863 = _2859 * 0.5;
    float _2865 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2871 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2873 = fma(_2867, -2.0, 3.0);
    float _2875 = _2867 * _2867;
    float _2877 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2879 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2881 = _2875 * _2873;
    float _2883 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2877);
    float _2885 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2883);
    float _2887 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2857);
    float _2889 = _2839 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2891 = _2718 * 0.5;
    float _2893 = _2885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2895 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2887);
    float _2897 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2869);
    float _2899 = fma(_2774, -0.5, _2891);
    float _2901 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2903 = _2895 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2905 = -_2881;
    float _2907 = _2905 + 1.0;
    float _2909 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2871);
    float _2911 = _2901 + _2897;
    float _2913 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    out.m_94.x = _2841;
    out.m_94.y = _2899;
    out.m_94.z = _2863;
    out.m_94.w = _2718;
    float _2915 = fma(_2907, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2881);
    float _2917 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2911);
    float _2919 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2913);
    float _2921 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2923 = 1.0 / _2917;
    bool _2925 = _1829 <= 8000.0;
    bool _2927 = isnan(_1829);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan(8000.0);
    bool _2933 = _2929 || _2931;
    float _2935 = float(_2933);
    float _2937 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2879);
    float _2939 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2909);
    float _2941 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2943 = _2921 + _2919;
    float _2945 = _2935 * _2915;
    float _2947 = _2915;
    float _2949 = _2919;
    float _2951 = _2774;
    float _2953 = _2921;
    float _2955 = _2772;
    float _2957 = _2718;
    if (_2827)
    {
        _2947 = 1.0;
    }
    float _2959 = _2947;
    float _2961 = _2959;
    if (!_2827)
    {
        float _2963 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2965 = _2963 * 0.15915493667125701904296875;
        float _2967 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2969 = _2965 * 6.283185482025146484375;
        float _2971 = cos(_2969);
        float _2973 = _2967 * 0.15915493667125701904296875;
        float _2975 = _2965 * 6.283185482025146484375;
        float _2977 = sin(_2975);
        float _2979 = 1.0 / _2971;
        float _2981 = _2973 * 6.283185482025146484375;
        float _2983 = cos(_2981);
        float _2985 = _2977 * _2979;
        float _2987 = _2973 * 6.283185482025146484375;
        float _2989 = sin(_2987);
        float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2993 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2991;
        float _2995 = _2983 * _2985;
        float _2997 = 1.0 / _2993;
        float _2999 = 1.0 / _2995;
        float _3001 = _2989 * _2999;
        float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3005 = fma(_1829, _3001, _3003);
        float _3007 = _3005 * _2997;
        float _3009 = precise::clamp(_3007, 0.0, 1.0);
        _2949 = _2993;
        _2961 = _3009;
    }
    float _3011 = _2949;
    float _3013 = _2961;
    float _3015 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3017 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2943);
    float _3019 = _2941 + _2937;
    float _3021 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3023 = exp2(_3015);
    float _3025 = -_2196;
    float _3027 = _3025 + 1.0;
    float _3029 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3019);
    float _3031 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2939);
    float _3033 = _3011;
    float _3035 = _3021;
    if (!_2112)
    {
        _3033 = 1.0;
    }
    float _3037 = _3033;
    float _3039 = _3037;
    if (_2112)
    {
        bool _3041 = _2208 >= _2192;
        bool _3043 = isnan(_2208);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan(_2192);
        bool _3049 = _3045 || _3047;
        float _3051 = float(_3049);
        _3039 = _3051;
    }
    float _3053 = _3039;
    float _3055 = _3017 * _2923;
    float _3057 = _3029 * _2923;
    float _3059 = _3027 * _3021;
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = _3031 * _2923;
    if (_1888)
    {
        _3035 = 1.0;
    }
    float _3065 = _3035;
    float _3067 = _3065;
    if (!_1888)
    {
        int _3069 = _1912 << 4;
        int _3071 = _3069 + 2048;
        uint _3073 = uint(int(uint(_3071) >> uint(2)));
        uint _3075 = uint(int(uint(int(_3073)) >> uint(2)));
        int _3077 = int(_3073) & 3;
        float _3079 = (*spvDescriptorSet0.vp_c15)._m0[int(_3075)][_3077];
        int _3081 = int(_3073) + 1;
        uint _3083 = uint(int(uint(_3081) >> uint(2)));
        int _3085 = _3081 & 3;
        float _3087 = (*spvDescriptorSet0.vp_c15)._m0[int(_3083)][_3085];
        int _3089 = _3071 + 8;
        uint _3091 = uint(int(uint(_3089) >> uint(2)));
        uint _3093 = uint(int(uint(int(_3091)) >> uint(2)));
        int _3095 = int(_3091) & 3;
        float _3097 = (*spvDescriptorSet0.vp_c15)._m0[int(_3093)][_3095];
        int _3099 = int(_3091) + 1;
        uint _3101 = uint(int(uint(_3099) >> uint(2)));
        int _3103 = _3099 & 3;
        float _3105 = (*spvDescriptorSet0.vp_c15)._m0[int(_3101)][_3103];
        float _3107 = _1761 * _3087;
        float _3109 = fma(_1557, _3079, _3107);
        float _3111 = fma(_1561, _3097, _3109);
        float _3113 = _3111 + _3105;
        float _3115 = precise::clamp(_3113, 0.0, 1.0);
        float _3117 = -_3115;
        float _3119 = _3117 + _2202;
        float _3121 = fma(_3119, 500.0, 1.5);
        float _3123 = exp2(_3121);
        float _3125 = 0.0 + _3123;
        float _3127 = precise::clamp(_3125, 0.0, 1.0);
        _3067 = _3127;
    }
    float _3129 = _3067;
    float _3131 = _3053 * _3129;
    float _3133 = -_3061;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3137 = -_3023;
    float _3139 = _3137 + 1.0;
    float _3141 = -_227;
    float _3143 = _3141 + _2472;
    bool _3145 = _3063 > 0.0;
    float _3147 = -_3131;
    float _3149 = fma(_3147, _3135, 1.0);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3155 = -_223;
    float _3157 = _3155 + _2474;
    float _3159 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    out.m_96.y = 1.0;
    float _3161 = _3153 * _2792;
    bool _3163 = _3063 < 1.0;
    bool _3165 = _3163 && _3145;
    float _3167 = -_229;
    float _3169 = _3167 + _2476;
    float _3171 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3159);
    float _3173 = -_3153;
    float _3175 = _3173 + 1.0;
    bool _3177 = _2778 > (-1.0);
    bool _3179 = _3177 && _3165;
    float _3181 = _3151 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3183 = _2803 * _3161;
    float _3185 = _2813 * _3161;
    float _3187 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3171);
    float _3189 = _2803 * _3175;
    float _3191 = fma(_2809, _3183, _2797);
    float _3193 = fma(_2811, _3183, _2799);
    float _3195 = fma(_2803, _3185, _2801);
    bool _3197 = _2780 > (-1.0);
    bool _3199 = _3197 && _3179;
    float _3201 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    out.m_96.x = _3181;
    float _3203 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    bool _3205 = _2778 < 1.0;
    bool _3207 = _3205 && _3199;
    out.m_98.x = _3191;
    out.m_98.y = _3193;
    out.m_98.z = _3195;
    out.m_98.w = _3189;
    float _3209 = 1.0 / _3201;
    bool _3211 = _2780 < 1.0;
    bool _3213 = _3211 && _3207;
    float _3215 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    if (!_2290)
    {
        _1851 = 0.0;
    }
    float _3217 = _1851;
    float _3219 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3215);
    float _3221 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3203);
    float _3223 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3219);
    float _3225 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3221);
    float _3227 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3229 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3231 = _3217 * _3013;
    float _3233 = _3227 * _3209;
    float _3235 = _3229 * _3209;
    float _3237 = _3231 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3239 = !_3213;
    float _3241 = _3229;
    float _3243 = _3227;
    float _3245 = _3237;
    if (!_3239)
    {
        float _3247 = -_3057;
        float _3249 = _2780 + _3247;
        float _3251 = -_3055;
        float _3253 = _2778 + _3251;
        float _3255 = -_3233;
        float _3257 = _2778 + _3255;
        float _3259 = -_3235;
        float _3261 = _2780 + _3259;
        float _3263 = _3249 * _3249;
        float _3265 = fma(_3253, _3253, _3263);
        float _3267 = sqrt(_3265);
        bool _3269 = _3267 > 0.0;
        bool _3271 = !_3269;
        _3241 = _3267;
        _3243 = _3253;
        _3273 = _3271;
        if (!_3273)
        {
            float _3275 = _3261 * _3261;
            float _3277 = fma(_3257, _3257, _3275);
            float _3279 = rsqrt(_3265);
            float _3281 = sqrt(_3277);
            float _3283 = _3253 * _3279;
            float _3285 = _3249 * _3279;
            bool _3287 = _3281 > 0.0;
            bool _3289 = !_3287;
            _3241 = _3279;
            _3273 = _3289;
            if (!_3273)
            {
                float _3291 = _631 * _2903;
                float _3293 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3295 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2901);
                float _3297 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2941);
                float _3299 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2921);
                float _3301 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3295);
                float _3303 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3297);
                float _3305 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3299);
                float _3307 = rsqrt(_3277);
                float _3309 = _3293 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3311 = 1.0 / _3301;
                float _3313 = _3261 * _3309;
                float _3315 = _3257 * _3309;
                float _3317 = _3313 * _3313;
                float _3319 = fma(_3315, _3315, _3317);
                float _3321 = _3261 * _3307;
                float _3323 = _3257 * _3307;
                float _3325 = _3303 * _3311;
                float _3327 = _3305 * _3311;
                float _3329 = sqrt(_3319);
                float _3331 = _3325 * _3325;
                float _3333 = fma(_3327, _3327, _3331);
                float _3335 = _3285 * _3321;
                float _3337 = fma(_3283, _3323, _3335);
                float _3339 = sqrt(_3333);
                float _3341 = precise::min(0.0, _3337);
                float _3343 = _2718 * _3341;
                float _3345 = fma(_3315, _3343, _2772);
                float _3347 = fma(_3313, _3343, _2774);
                float _3349 = fma(_3329, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3339);
                out.gl_Position.x = _3345;
                out.gl_Position.y = _3347;
                float _3351 = 1.0 / _3349;
                float _3353 = _3339 * _3351;
                out.m_96.y = _3353;
                _2951 = _3347;
                _3241 = _3349;
                _3243 = _3351;
                _2953 = _3343;
                _2955 = _3345;
                _3273 = true;
            }
        }
    }
    else
    {
        float _3355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3355;
        _2951 = 0.0;
        _2953 = _3355;
        _3245 = 0.0;
        _2955 = 0.0;
    }
    _3273 = false;
    float _3357 = _2951;
    float _3359 = _3241;
    float _3361 = _3243;
    float _3363 = _2953;
    float _3365 = _3245;
    float _3367 = _2955;
    bool _3369 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3371 = isnan(_2504);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3377 = _3373 || _3375;
    float _3379 = _3361;
    float _3381 = _3359;
    float _3383 = _3363;
    float _3385 = _3357;
    float _3387 = _3367;
    if (!_3377)
    {
        _3379 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3389 = _3379;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3377)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3395 = _3381;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3377)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3401 = _2957;
    float _3403 = _3401;
    float _3405 = _3401;
    if (!_3377)
    {
        _3383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3407 = _3383;
    float _3409 = _3407;
    float _3411 = _3407;
    if (!_3377)
    {
        _3385 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3413 = _3385;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3377)
    {
        _3387 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3419 = _3387;
    bool _3421 = !_3377;
    float _3423 = _3419;
    float _3425 = _3419;
    if (!_3421)
    {
        bool _3427 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3429 = isnan(_2504);
        bool _3431 = _3427 || _3429;
        bool _3433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3435 = _3431 || _3433;
        if (!_3435)
        {
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3439 = _2504 + _3437;
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3443 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3441;
            float _3445 = 1.0 / _3443;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3467 = _3439 * _3445;
            float _3469 = precise::clamp(_3467, 0.0, 1.0);
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3475 = fma(_3469, _3449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3477 = fma(_3469, _3473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3479 = fma(_3469, _3453, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3481 = fma(_3469, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3483 = fma(_3469, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3485 = fma(_3469, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3399 = _3477;
            _3417 = _3483;
            _3393 = _3475;
            _3411 = _3481;
            _3405 = _3479;
            _3425 = _3485;
            _3487 = true;
        }
        else
        {
            bool _3489 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3491 = isnan(_2504);
            bool _3493 = _3489 || _3491;
            bool _3495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3497 = _3493 || _3495;
            if (!_3497)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3499 = _3391;
            _3393 = _3499;
            if (!_3497)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3501 = _3397;
            _3399 = _3501;
            if (!_3497)
            {
                _3403 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3503 = _3403;
            _3405 = _3503;
            if (!_3497)
            {
                _3409 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3505 = _3409;
            _3411 = _3505;
            if (!_3497)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3507 = _3415;
            _3417 = _3507;
            if (!_3497)
            {
                _3423 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3509 = _3423;
            bool _3511 = !_3497;
            _3425 = _3509;
            if (!_3511)
            {
                bool _3513 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3515 = isnan(_2504);
                bool _3517 = _3513 || _3515;
                bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3521 = _3517 || _3519;
                if (!_3521)
                {
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3525 = _2504 + _3523;
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3529 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3527;
                    float _3531 = 1.0 / _3529;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3553 = _3525 * _3531;
                    float _3555 = precise::clamp(_3553, 0.0, 1.0);
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3561 = fma(_3555, _3535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3563 = fma(_3555, _3559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3565 = fma(_3555, _3539, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3567 = fma(_3555, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3569 = fma(_3555, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3571 = fma(_3555, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3399 = _3563;
                    _3417 = _3569;
                    _3393 = _3561;
                    _3411 = _3567;
                    _3405 = _3565;
                    _3425 = _3571;
                    _3487 = true;
                }
                else
                {
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3411 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3405 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3425 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3487 = false;
    float _3573 = _3399;
    float _3575 = _3417;
    float _3577 = _3393;
    float _3579 = _3411;
    float _3581 = _3405;
    float _3583 = _3425;
    float _3585 = fma(_1525, -0.5, 0.5);
    float _3587 = precise::clamp(_3585, 0.0, 1.0);
    float _3589 = -_3573;
    float _3591 = _3589 + _3575;
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    out.m_100.x = 0.0;
    float _3597 = fma(_3587, _3591, _3573);
    float _3599 = _3365 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3601 = fma(_3587, _3595, _3577);
    float _3603 = -_3581;
    float _3605 = _3603 + _3583;
    float _3607 = _3597 * 0.586610972881317138671875;
    bool _3609 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_63.x = _3599;
    float _3611 = fma(_3587, _3605, _3581);
    float _3613 = fma(_3601, 0.298911988735198974609375, _3607);
    bool _3615 = _3013 > 0.0;
    bool _3617 = isnan(_3013);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(0.0);
    bool _3623 = _3619 || _3621;
    float _3625 = fma(_3611, 0.114477999508380889892578125, _3613);
    float _3627 = -_3625;
    float _3629 = _3601 + _3627;
    float _3631 = -_3625;
    float _3633 = _3597 + _3631;
    float _3635 = -_3625;
    float _3637 = _3611 + _3635;
    float _3639 = fma(_3629, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    float _3641 = fma(_3633, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    float _3643 = fma(_3637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    bool _3645 = !_3609;
    if (!_3645)
    {
        float _3647 = -_2472;
        float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3651 = -_2474;
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3655 = -_2476;
        float _3657 = _3655 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3659 = _3649 * _3649;
        float _3661 = fma(_3653, _3653, _3659);
        float _3663 = fma(_3657, _3657, _3661);
        float _3665 = sqrt(_3663);
        float _3667 = rsqrt(_3663);
        float _3669 = -_3665;
        float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3673 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3675 = precise::clamp(_3673, 0.0, 1.0);
        float _3677 = _3653 * _3667;
        float _3679 = _3649 * _3667;
        float _3681 = abs(_3675);
        float _3683 = log2(_3681);
        float _3685 = _3657 * _3667;
        float _3687 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3689 = _1525 * _3679;
        float _3691 = -_3679;
        float _3693 = -_3687;
        float _3695 = fma(_3691, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3693);
        float _3697 = fma(_1523, _3677, _3689);
        float _3699 = -_3685;
        float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3695);
        float _3703 = fma(_1527, _3685, _3697);
        float _3705 = precise::clamp(_3703, 0.0, 1.0);
        float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3709 = _3701 + _3707;
        float _3711 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3713 = _3709 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = exp2(_3711);
        float _3719 = _3717 * _3715;
        float _3721 = _3705 * _3719;
        float _3723 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3725 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3727 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3723;
        out.m_100.y = _3725;
        out.m_100.z = _3727;
    }
    out.m_102.x = _3639;
    out.m_102.y = _3641;
    out.m_102.z = _3643;
    if (_3623)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3729 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3729;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3487 = false;
    bool _3273 = false;
    bool _1615 = false;
    bool _1603 = false;
    bool _603 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
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
        out.m_63.x = 0.0;
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
        float _3786 = as_type<float>(_137);
        out.gl_Position.z = _3786;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    float _159 = _155;
    if (_151)
    {
        float _161 = float(_121);
        _157 = _161;
    }
    float _163 = _157;
    bool _165 = _155 >= _163;
    bool _167 = !_151;
    bool _169 = _165 || _167;
    if (_169)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3855 = as_type<float>(_175);
        out.gl_Position.z = _3855;
    }
    if (_169)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = in.m_70.x;
    float _181 = in.m_70.y;
    float _183 = in.m_70.z;
    float _185 = in.m_72.x;
    float _187 = in.m_72.y;
    float _189 = in.m_72.z;
    float _191 = in.m_74.x;
    float _193 = in.m_74.y;
    float _195 = in.m_74.z;
    float _197 = in.m_76.x;
    float _199 = in.m_76.y;
    float _201 = in.m_76.z;
    int _203 = as_type<int>(_177) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_177) & 2;
    bool _209 = _207 != 0;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = _181 * _187;
    float _215 = _181 * _193;
    float _217 = fma(_179, _185, _213);
    float _219 = _181 * _199;
    float _221 = fma(_179, _191, _215);
    float _223 = fma(_183, _189, _217);
    float _225 = fma(_179, _197, _219);
    float _227 = fma(_183, _195, _221);
    float _229 = fma(_183, _201, _225);
    bool _231 = !_205;
    float _233 = _231 ? (-0.5) : 0.5;
    bool _235 = !_209;
    float _237 = _235 ? (-0.5) : 0.5;
    bool _239 = !_211;
    float _257;
    if (!_239)
    {
        float _241 = in.m_78.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_121);
        float _263 = 1.0 / _261;
        float _265 = _155 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _267 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    bool _293 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_267);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = 1.0 / _283;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _287;
    float _313 = _271 * _305;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _325 * _329;
    float _333 = _275 * _309;
    bool _335 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_267);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _349;
    float _357 = -_345;
    float _359 = _357 + 1.0;
    float _361 = _279 * _311;
    bool _363 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_267);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_353, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_377, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _373 * _359;
    float _393 = fma(_383, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_387, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = _389 * _391;
    float _403 = _393 * _391;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _417 = fma(_407, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_379, _355, _409);
    float _421 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_395, _355, _415);
    float _425 = fma(_417, _331, _419);
    float _427 = fma(_421, _331, _423);
    float _429 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_307;
    float _451;
    if (!_433)
    {
        float _435 = in.m_78.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_121);
        float _457 = 1.0 / _455;
        float _459 = _155 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_461);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _487 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _489 = isnan(_461);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _499;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _469;
    float _517 = -_481;
    float _519 = _517 + 1.0;
    float _521 = _497 * _519;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = 1.0 / _485;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _501 * _515;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _545 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = _543 * _529;
    float _551 = _545 * _521;
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _461 + _557;
    float _561 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _551);
    float _565 = _481 * _555;
    float _567 = fma(_549, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _569 = fma(_567, _565, _563);
    float _571 = in.m_80.x;
    float _573 = in.m_80.y;
    float _575 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[117].x, _569);
    float _577 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_82.x = _561;
    out.m_82.y = _535;
    out.m_82.z = _537;
    out.m_82.w = _577;
    float _579 = _431 * _573;
    float _581 = _429 * _571;
    bool _583 = !_533;
    float _601;
    if (!_583)
    {
        float _585 = in.m_78.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_121);
        float _607 = 1.0 / _605;
        float _609 = _155 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = in.m_78.x;
    float _615 = in.m_78.y;
    float _617 = in.m_78.z;
    float _619 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _621 = in.m_60.x;
    float _623 = in.m_60.y;
    float _625 = in.m_60.z;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _629 = _627 != 0;
    float _631 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _635 = _633 != 0;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _639 = in.m_74.w;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _643 = _641 != 0;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _651 = _649 != 0;
    float _653 = in.m_72.w;
    bool _655 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _657 = isnan(_611);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = in.m_76.w;
    float _669 = _617 * 2.0;
    bool _671 = _613 > 0.5;
    float _673 = _613 * 2.0;
    float _675 = _193 * _623;
    float _677 = -_233;
    int _679 = _671 ? as_type<int>(_677) : as_type<int>(_233);
    float _681 = floor(_669);
    float _683 = _187 * _623;
    float _685 = _199 * _623;
    float _687 = fma(_191, _621, _675);
    float _689 = _615 + _617;
    float _691 = fma(_185, _621, _683);
    float _693 = fma(_197, _621, _685);
    float _695 = fma(_195, _625, _687);
    float _697 = floor(_673);
    float _699 = fma(_201, _625, _693);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _705 = fma(_189, _625, _691);
    float _707 = _613 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _709 = _681 > 0.0;
    float _711 = 1.0 / _703;
    bool _713 = _681 >= 0.0;
    bool _715 = isnan(_681);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = _617 + _613;
    float _725 = _617 + (-0.5);
    float _727 = -_637;
    float _729 = fma(_707, 2.0, _727);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _733 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _735 = log2(_733);
    float _737 = _615 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[79].z, _731);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _749 = _721 ? 0 : 1;
    float _751 = _615 + _613;
    float _753 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[78].z, _745);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _761 = fma(_737, -2.0, _747);
    float _763 = 1.0 / _741;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _769 = _613 + (-0.5);
    float _771 = _615 * 2.0;
    int _773 = ~_749;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = _735 * _155;
    int _781 = _777;
    if (!_709)
    {
        int _783 = ~_749;
        int _785 = _783 + 1;
        _781 = _785;
    }
    int _787 = _781;
    float _789 = 1.0 / _757;
    bool _791 = _697 >= 0.0;
    bool _793 = isnan(_697);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _767 * _711;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _803;
    bool _807 = _615 > 0.5;
    float _809 = _615 + (-0.5);
    int _811 = _799 ? 0 : 1;
    float _813 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[78].w, _759);
    float _815 = floor(_771);
    bool _817 = _697 > 0.0;
    float _819 = _689 + (-1.0);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _821;
    float _825 = _751 + (-1.0);
    int _827 = ~_811;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _835 = _611 + _833;
    float _837 = _823 * _763;
    float _839 = _805 * _789;
    float _841 = exp2(_779);
    float _843 = _723 + (-1.0);
    float _845 = -_237;
    int _847 = _807 ? as_type<int>(_845) : as_type<int>(_237);
    float _849 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _853 = _611 + _851;
    int _855 = _831;
    if (!_817)
    {
        int _857 = ~_811;
        int _859 = _857 + 1;
        _855 = _859;
    }
    int _861 = _855;
    float _863 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[79].x, _743);
    bool _865 = _815 > 0.0;
    float _867 = fma(_837, _853, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _869 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _871 = isnan(_611);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = fma(_839, _835, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _883 = _815 >= 0.0;
    bool _885 = isnan(_815);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _895 = _611 + _893;
    bool _897 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _899 = isnan(_611);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = -_879;
    float _911 = _909 + 1.0;
    float _913 = _863 * (-0.15915493667125701904296875);
    float _915 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _917 = fma(_801, _895, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _919 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _921 = isnan(_611);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _907 * _911;
    float _933 = _913 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = -_841;
    float _939 = _937 + 1.0;
    float _941 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _943 = -_907;
    float _945 = _943 + 1.0;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _949 = 1.0 + _947;
    float _951 = -_929;
    float _953 = _951 + 1.0;
    int _955 = _891 ? 0 : 1;
    float _957 = _929 * _945;
    float _959 = _913 * 6.283185482025146484375;
    float _961 = cos(_959);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = _665 * _953;
    float _975 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _977 = -_665;
    float _979 = _977 + 1.0;
    float _981 = _971 ? _939 : 0.0;
    float _983 = _867 * _973;
    bool _985 = !_635;
    float _987 = _985 ? _237 : as_type<float>(_847);
    float _989 = 1.0 / _949;
    bool _991 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _993 = isnan(1.0);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _999 = _995 || _997;
    float _1001 = _695 + _639;
    float _1003 = -_155;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[76].x, _729);
    float _1007 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[131].x, _983);
    bool _1009 = !_643;
    int _1011 = _1009 ? 0 : 1;
    float _1013 = _987 * _935;
    bool _1015 = !_629;
    float _1017 = _1015 ? _233 : as_type<float>(_679);
    float _1019 = _987 * _961;
    float _1021 = fma(_917, _957, _1007);
    int _1023 = abs(_1011);
    float _1025 = _705 + _653;
    float _1027 = -_1013;
    float _1029 = fma(_1017, _961, _1027);
    float _1031 = fma(_1017, _935, _1019);
    bool _1033 = !_647;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _753);
    float _1039 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    float _1041 = _1001 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    if (_999)
    {
        float _1043 = _981 * _989;
        _159 = _1043;
    }
    float _1045 = _159;
    int _1047 = abs(_1035);
    float _1049 = _1025 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1051 = float(_1023);
    float _1053 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1055 = float(_787);
    float _1057 = _699 + _667;
    float _1059 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1061 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1053);
    float _1063 = fma(_881, _931, _1021);
    float _1065 = _1051 * _1055;
    int _1067 = ~_955;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = in.m_84.x;
    float _1075 = in.m_84.y;
    float _1077 = in.m_84.z;
    int _1079 = _1071;
    if (!_865)
    {
        int _1081 = ~_955;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = _1057 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1089 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1093 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1061);
    float _1097 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1089);
    float _1099 = -_1057;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1093);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1107 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1097);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1111 = -_1001;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = float(_861);
    float _1117 = _1105 * _1059;
    bool _1119 = !_651;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1107 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1125 = -_1025;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1129 = _1113 * _1113;
    int _1131 = abs(_1121);
    float _1133 = _1123 * _1091;
    float _1135 = _1065 * (-2.0);
    float _1137 = float(_1047);
    float _1139 = fma(_1127, _1127, _1129);
    float _1141 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1103);
    float _1143 = fma(_1117, 0.5, 0.5);
    float _1145 = float(_1085);
    float _1147 = fma(_1135, _1073, _1073);
    float _1149 = _1137 * _1115;
    float _1151 = fma(_1101, _1101, _1139);
    float _1153 = float(_1131);
    float _1155 = fma(_941, _1135, _941);
    float _1157 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1147);
    float _1159 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1161 = _1029 + 0.5;
    float _1163 = rsqrt(_1151);
    float _1165 = _1149 * (-2.0);
    float _1167 = _1153 * _1145;
    float _1169 = fma(_1159, _1161, _1005);
    float _1171 = -_1037;
    float _1173 = _1171 + 1.0;
    float _1175 = fma(_1165, _1075, _1075);
    float _1177 = fma(_849, _1165, _849);
    float _1179 = _1167 * (-2.0);
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1183 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1175);
    float _1185 = fma(_1155, _1045, _1157);
    float _1187 = fma(_915, _1179, _915);
    float _1189 = fma(_1179, _1077, _1077);
    float _1191 = fma(_1177, _1045, _1183);
    float _1193 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1063);
    float _1195 = -_1173;
    float _1197 = fma(_1029, _1195, _1169);
    float _1199 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1189);
    float _1201 = _1127 * _1163;
    float _1203 = _1101 * _1163;
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1207 = fma(_1187, _1045, _1199);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1211 = _1201 * _1209;
    float _1213 = _1031 + (-0.5);
    float _1215 = _1113 * _1163;
    float _1217 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1219 = _1207 * 0.15915493667125701904296875;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1223 = _1203 * _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1227 = -_1211;
    float _1229 = fma(_1203, _1225, _1227);
    float _1231 = -_1217;
    float _1233 = -_975;
    float _1235 = fma(_1231, _1213, _1233);
    float _1237 = fma(_1133, 0.5, 0.5);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1241 = _1215 * _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1245 = -_1223;
    float _1247 = fma(_1215, _1243, _1245);
    float _1249 = _1229 * _1229;
    float _1251 = _1185 * 0.15915493667125701904296875;
    float _1253 = _1191 * 0.15915493667125701904296875;
    float _1255 = -_1039;
    float _1257 = _1255 + 1.0;
    float _1259 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1261 = floor(_1237);
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1265 = -_1241;
    float _1267 = fma(_1201, _1263, _1265);
    float _1269 = fma(_1247, _1247, _1249);
    float _1271 = _1141 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1273 = fma(_1031, _1257, _1235);
    float _1275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _237);
    float _1277 = floor(_1143);
    float _1279 = _1271 * _1205;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1285 = _619 * _1275;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1289 = fma(_1279, 0.5, 0.5);
    float _1291 = _1251 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_86.x = _1197;
    out.m_86.y = _1273;
    bool _1301 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1303 = isnan(1.0);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1309 = _1305 || _1307;
    float _1311 = _1251 * 6.283185482025146484375;
    float _1313 = cos(_1311);
    out.m_88.x = _1295;
    out.m_88.y = _1297;
    out.m_88.z = _1299;
    out.m_88.w = _1259;
    float _1315 = -_1277;
    float _1317 = _1143 + _1315;
    float _1319 = _1253 * 6.283185482025146484375;
    float _1321 = sin(_1319);
    float _1323 = -_1261;
    float _1325 = _1237 + _1323;
    float _1327 = _1253 * 6.283185482025146484375;
    float _1329 = cos(_1327);
    float _1331 = _1219 * 6.283185482025146484375;
    float _1333 = cos(_1331);
    float _1335 = fma(_1267, _1267, _1269);
    float _1337 = _1293 * _1321;
    float _1339 = _1313 * _1321;
    float _1341 = _1219 * 6.283185482025146484375;
    float _1343 = sin(_1341);
    float _1345 = _1313 * _1329;
    float _1347 = _1293 * _1329;
    float _1349 = rsqrt(_1335);
    float _1351 = _1321 * _1333;
    float _1353 = fma(_1325, 2.0, -1.0);
    float _1355 = _1293 * _1333;
    float _1357 = _1329 * _1333;
    float _1359 = _1313 * _1333;
    float _1361 = fma(_1317, 2.0, -1.0);
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1365 = floor(_1289);
    float _1367 = fma(_1343, _1345, _1337);
    float _1369 = fma(_1343, _1337, _1345);
    float _1371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _1373 = -_1339;
    float _1375 = fma(_1343, _1347, _1373);
    float _1377 = -_1347;
    float _1379 = fma(_1343, _1339, _1377);
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1383 = _631 * _1371;
    float _1385 = _1229 * _1349;
    float _1387 = _1267 * _1349;
    float _1389 = _1247 * _1349;
    float _1391 = -_1285;
    float _1393 = _1343 * _1391;
    float _1395 = _1359 * _1285;
    float _1397 = _1355 * _1285;
    float _1399 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1403 = -_1365;
    float _1405 = _1289 + _1403;
    float _1407 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1409 = fma(_1357, _1383, _1393);
    float _1411 = fma(_1367, _1383, _1395);
    float _1413 = fma(_1375, _1383, _1397);
    float _1415 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1399);
    float _1417 = _1203 * _1385;
    float _1419 = _1201 * _1387;
    float _1421 = _1215 * _1389;
    float _1423 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1401);
    float _1425 = -_1417;
    float _1427 = fma(_1215, _1387, _1425);
    float _1429 = -_1419;
    float _1431 = fma(_1203, _1389, _1429);
    float _1433 = -_1421;
    float _1435 = fma(_1201, _1385, _1433);
    float _1437 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1407);
    float _1439 = _1359 * _1427;
    float _1441 = _1359 * _1431;
    float _1443 = _1359 * _1435;
    float _1445 = _1367 * _1427;
    float _1447 = -_1343;
    float _1449 = fma(_1447, _1389, _1439);
    float _1451 = -_1343;
    float _1453 = fma(_1451, _1385, _1441);
    float _1455 = -_1343;
    float _1457 = fma(_1455, _1387, _1443);
    float _1459 = _1367 * _1435;
    float _1461 = fma(_1355, _1201, _1449);
    float _1463 = fma(_1355, _1215, _1453);
    float _1465 = fma(_1355, _1203, _1457);
    float _1467 = _237 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1469 = _1367 * _1431;
    float _1471 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1473 = fma(_1357, _1389, _1445);
    float _1475 = fma(_1357, _1387, _1459);
    float _1477 = _1467 * _1461;
    float _1479 = _1467 * _1463;
    float _1481 = _1467 * _1465;
    float _1483 = fma(_1357, _1385, _1469);
    float _1485 = fma(_1379, _1471, _1411);
    float _1487 = _1379 * _1427;
    float _1489 = _1379 * _1431;
    float _1491 = _1379 * _1435;
    float _1493 = fma(_1375, _1201, _1473);
    float _1495 = fma(_1375, _1215, _1483);
    float _1497 = fma(_1375, _1203, _1475);
    float _1499 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1501 = fma(_1351, _1389, _1487);
    float _1503 = fma(_1351, _1385, _1489);
    float _1505 = fma(_1351, _1387, _1491);
    float _1507 = fma(_1351, _1471, _1409);
    float _1509 = fma(_1499, _1493, _1477);
    float _1511 = fma(_1499, _1495, _1479);
    float _1513 = fma(_1499, _1497, _1481);
    float _1515 = fma(_1369, _1201, _1501);
    float _1517 = fma(_1369, _1215, _1503);
    float _1519 = fma(_1369, _1203, _1505);
    float _1521 = fma(_1369, _1471, _1413);
    float _1523 = _1515 + _1509;
    float _1525 = _1517 + _1511;
    float _1527 = _1519 + _1513;
    float _1529 = fma(_1405, 2.0, -1.0);
    float _1531 = _1427 * _1485;
    float _1533 = _1431 * _1485;
    float _1535 = _1435 * _1485;
    out.m_90.x = _1523;
    out.m_90.y = _1525;
    out.m_90.z = _1527;
    float _1537 = _1529 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1539 = fma(_1389, _1507, _1531);
    float _1541 = fma(_1385, _1507, _1533);
    float _1543 = fma(_1387, _1507, _1535);
    float _1545 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1415);
    float _1547 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1423);
    float _1549 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1437);
    float _1551 = fma(_1201, _1521, _1539);
    float _1553 = fma(_1215, _1521, _1541);
    float _1555 = fma(_1203, _1521, _1543);
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1559 = _1547 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1561 = _1549 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1563 = _1551 + _1557;
    float _1565 = _1553 + _1559;
    float _1567 = _1555 + _1561;
    float _1569 = _1389;
    float _1571 = _1533;
    float _1573 = _1555;
    float _1575 = _1405;
    float _1577 = _1389;
    float _1579 = _1555;
    float _1581 = _1551;
    float _1583 = _1405;
    float _1585 = _1361;
    float _1587 = _1353;
    float _1589 = _1201;
    float _1591 = _1529;
    int _1593 = as_type<int>(_1483);
    int _1595 = as_type<int>(_1507);
    float _1597 = _1141;
    float _1607;
    float _1609;
    float _1611;
    float _1613;
    if (!_1309)
    {
        bool _1599 = _1559 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1601 = !_1599;
        _1603 = _1601;
        if (!_1603)
        {
            float _1605 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1607 = _1605;
            _1609 = 0.0;
            _1611 = 0.0;
            _1613 = 0.0;
            _1615 = true;
        }
    }
    if ((!_1615) || _1603)
    {
        bool _1651;
        if (!_1603)
        {
            bool _1617 = _1559 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1619 = isnan(_1559);
            bool _1621 = _1617 || _1619;
            bool _1623 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1625 = _1621 || _1623;
            bool _1627 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1629 = !_1625;
            bool _1631 = _1627 && _1629;
            bool _1633 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1581 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1631)
            {
                _1569 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1635 = _1569;
            float _1637 = _1635;
            if (_1631)
            {
                _1571 = 0.0;
            }
            float _1639 = _1571;
            _1609 = _1639;
            if (_1631)
            {
                _1573 = 0.0;
            }
            float _1641 = _1573;
            _1579 = _1641;
            _1611 = _1641;
            if (_1631)
            {
                float _1643 = _1635 * 5.0;
                _1637 = _1643;
            }
            float _1645 = _1637;
            _1577 = _1645;
            _1607 = _1645;
            if (_1631)
            {
                _1575 = 0.0;
            }
            float _1647 = _1575;
            bool _1649 = !_1625;
            _1651 = _1649 && _1633;
            _1583 = _1647;
            _1613 = _1647;
        }
        if ((!_1651) || _1603)
        {
            _1603 = false;
            float _1653 = _1577;
            float _1655 = _1579;
            float _1657 = _1581;
            float _1659 = _1583;
            bool _1661 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1663 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1665 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1667 = _1653;
            float _1669 = _1657;
            float _1671 = _1659;
            _1609 = _1563;
            if (_1661)
            {
                float _1673 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1667 = _1673;
            }
            float _1675 = _1667;
            if (_1661)
            {
                float _1677 = abs(_1361);
                float _1679 = -_1677;
                float _1681 = _1679 + 1.0;
                _1585 = _1681;
            }
            float _1683 = _1585;
            if (_1663)
            {
                float _1685 = abs(_1353);
                float _1687 = -_1685;
                float _1689 = _1687 + 1.0;
                _1587 = _1689;
            }
            float _1691 = _1587;
            if (!_1661)
            {
                _1589 = 1.0;
            }
            float _1693 = _1589;
            float _1695 = _1693;
            if (_1665)
            {
                float _1697 = abs(_1529);
                float _1699 = -_1697;
                float _1701 = _1699 + 1.0;
                _1591 = _1701;
            }
            float _1703 = _1591;
            if (!_1663)
            {
                _1669 = 1.0;
            }
            float _1705 = _1669;
            float _1707 = _1705;
            if (!_1665)
            {
                _1671 = 1.0;
            }
            float _1709 = _1671;
            float _1711 = _1553;
            float _1713 = _1709;
            if (_1663)
            {
                float _1715 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1711 = _1715;
            }
            float _1717 = _1711;
            float _1719 = _1655;
            if (_1665)
            {
                float _1721 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1719 = _1721;
            }
            float _1723 = _1719;
            if (_1661)
            {
                float _1725 = _1683 * _1675;
                float _1727 = precise::clamp(_1725, 0.0, 1.0);
                _1695 = _1727;
            }
            float _1729 = _1695;
            _1607 = _1567;
            if (_1663)
            {
                float _1731 = _1691 * _1717;
                float _1733 = precise::clamp(_1731, 0.0, 1.0);
                _1707 = _1733;
            }
            float _1735 = _1707;
            float _1737 = _1729 * _1735;
            if (_1665)
            {
                float _1739 = _1703 * _1723;
                float _1741 = precise::clamp(_1739, 0.0, 1.0);
                _1713 = _1741;
            }
            float _1743 = _1713;
            float _1745 = _1737 * _1743;
            _1611 = _1565;
            _1613 = _1745;
        }
    }
    _1615 = false;
    float _1747 = _1607;
    float _1749 = _1609;
    float _1751 = _1611;
    float _1753 = _1613;
    float _1755 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1757 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1759 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1761 = _1559 + _1757;
    float _1763 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1759);
    float _1765 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1767 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1769 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1773 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1765);
    float _1775 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1767);
    float _1777 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1769);
    float _1779 = 1.0 / _1771;
    float _1781 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1773);
    float _1783 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1775);
    float _1785 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1777);
    float _1787 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1789 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1791 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1793 = _1787 + _1771;
    float _1795 = trunc(_1789);
    int _1797 = int(_1795);
    float _1799 = _1793 * _1779;
    float _1801 = _1799 * 0.5;
    float _1803 = trunc(_1791);
    int _1805 = int(_1803);
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1809 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1807);
    float _1811 = 1.0 / _1809;
    int _1813 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1815 = _1797 + _1813;
    int _1817 = _1815 + 1;
    int _1819 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1821 = _1805 + _1819;
    int _1823 = _1821 + 1;
    int _1825 = _1817 | _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1829 = _1811 * _1827;
    bool _1831 = _1829 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1833 = _1829 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1835 = !_1831;
    int _1837 = _1835 ? 0 : 1;
    int _1839 = 2;
    int _1841 = _1817;
    float _1843 = _1789;
    float _1845 = _1751;
    float _1847 = _1749;
    float _1849 = _1747;
    float _1851 = _1753;
    if (!_1831)
    {
        _1839 = 1;
    }
    int _1853 = _1839;
    int _1855 = _1853;
    if (!_1833)
    {
        _1855 = _1837;
    }
    int _1857 = _1855;
    bool _1859 = _1817 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1861 = _1857 << 6;
    bool _1863 = _1825 < 0;
    bool _1865 = _1863 || _1859;
    int _1867 = _1861 + 96;
    uint _1870 = uint(int(uint(_1867) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    bool _1886 = _1823 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1888 = _1886 || _1865;
    int _1890 = _1861 + 104;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
    if (!_1888)
    {
        int _1908 = _1823 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1910 = _1908 + _1817;
        _1841 = _1910;
    }
    int _1912 = _1841;
    int _1914 = _1861 + 48;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    if (!_1888)
    {
        int _1932 = _1912 << 2;
        _1593 = _1932;
    }
    int _1934 = _1593;
    int _1936 = _1861 + 64;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    uint _1940 = uint(int(uint(int(_1938)) >> uint(2)));
    int _1942 = int(_1938) & 3;
    float _1944 = (*spvDescriptorSet0.vp_c15)._m0[int(_1940)][_1942];
    int _1946 = int(_1938) + 1;
    uint _1948 = uint(int(uint(_1946) >> uint(2)));
    int _1950 = _1946 & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = _1861 + 56;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = _1861 + 72;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
    float _1990 = _1761 * _1884;
    int _1992 = as_type<int>(_1884);
    int _1994 = as_type<int>(_1990);
    if (!_1888)
    {
        uint _1996 = uint(int(uint(_1912) >> uint(2)));
        _1992 = int(_1996);
    }
    int _1998 = _1992;
    float _2000 = fma(_1557, _1876, _1990);
    if (!_1888)
    {
        int _2002 = 12 & _1934;
        _1994 = _2002;
    }
    int _2004 = _1994;
    float _2006 = fma(_1561, _1898, _2000);
    if (!_1888)
    {
        int _2008 = _1998 << 4;
        int _2010 = _2008 + _2004;
        _1595 = _2010;
    }
    int _2012 = _1595;
    float _2014 = _2006 + _1906;
    float _2016 = _1475;
    if (!_1888)
    {
        int _2018 = _2012 + 400;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
        int _2024 = int(_2020) & 3;
        float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
        _2016 = _2026;
    }
    float _2028 = _2016;
    float _2030 = _1761 * _1930;
    float _2032 = 1.0 / _2014;
    float _2034 = fma(_1557, _1922, _2030);
    int _2036 = _1861 + 80;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c15)._m0[int(_2040)][_2042];
    int _2046 = int(_2038) + 1;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    int _2050 = _2046 & 3;
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[int(_2048)][_2050];
    float _2054 = _1761 * _1952;
    float _2056 = fma(_1557, _1944, _2054);
    int _2058 = _1861 + 88;
    uint _2060 = uint(int(uint(_2058) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c15)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[int(_2070)][_2072];
    float _2076 = fma(_1561, _1962, _2034);
    float _2078 = _2076 + _1970;
    float _2080 = fma(_1561, _1980, _2056);
    float _2082 = _2078 * _2032;
    float _2084 = _2078;
    if (!_1888)
    {
        float _2086 = floor(_1791);
        _2084 = _2086;
    }
    float _2088 = _2084;
    float _2090 = _2080 + _1988;
    float _2092 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _2094 = _2082 >= 0.0;
    float _2096 = _2090 * _2032;
    bool _2098 = _2082 <= 1.0;
    bool _2100 = _2098 && _2094;
    float _2102 = floor(_2092);
    float _2104 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _2106 = _2096 >= 0.0;
    bool _2108 = _2106 && _2100;
    bool _2110 = _2096 <= 1.0;
    bool _2112 = _2110 && _2108;
    float _2114 = floor(_2104);
    float _2116 = _2088;
    if (!_1888)
    {
        float _2118 = -_2088;
        float _2120 = _1791 + _2118;
        _2116 = _2120;
    }
    float _2122 = _2116;
    float _2124 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1888)
    {
        float _2126 = floor(_1789);
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = _1761 * _2052;
    float _2132 = fma(_1557, 6.2500002968590706586837768554688e-05, 0.5);
    float _2134 = -_2102;
    float _2136 = _2092 + _2134;
    float _2138 = _2136;
    float _2140 = _2028;
    if (_2112)
    {
        float _2142 = float(_1857);
        _1597 = _2142;
    }
    float _2144 = _1597;
    float _2146 = fma(_1557, _2044, _2130);
    float _2148 = fma(_1561, 6.2500002968590706586837768554688e-05, 0.5);
    float _2150 = as_type<float>(_1861);
    float _2152 = _2074;
    if (!_1888)
    {
        float _2154 = rint(_2028);
        float _2156 = precise::max(_2154, 0.0);
        uint _2158 = uint(_2156);
        uint _2160 = clamp(_2158, 0u, 65535u);
        _2150 = as_type<float>(_2160);
    }
    float _2162 = _2150;
    float _2164 = fma(_1561, _2066, _2146);
    float _2166 = -_2114;
    float _2168 = _2104 + _2166;
    float _2170 = _2164 + _2074;
    float _2172 = _2144;
    float _2174 = _2114;
    if (_2112)
    {
        float _2176 = rint(_2144);
        float _2178 = precise::max(_2176, 0.0);
        uint _2180 = uint(_2178);
        uint _2182 = clamp(_2180, 0u, 65535u);
        _2172 = as_type<float>(_2182);
    }
    float _2184 = _2172;
    if (!_1888)
    {
        float _2186 = -_2128;
        float _2188 = _1789 + _2186;
        _1843 = _2188;
    }
    float _2190 = _1843;
    float _2192 = _2170 * _2032;
    float2 _7038 = float2(_2132, _2148);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_7038, float2(0.0), isnan(_7038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_7038, float2(0.0), isnan(_7038)), level(0.0)).x;
    float2 _7048 = float2(_2136, _2168);
    float _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7048, float2(0.0), isnan(_7048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7048, float2(0.0), isnan(_7048)), level(0.0)).x;
    float _2198 = _2162;
    if (!_1888)
    {
        float3 _7063 = float3(_2190, _2122, float(as_type<int>(_2162)));
        float3 _7067 = select(_7063, float3(0.0), isnan(_7063));
        float _2200 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7067.xy, uint(rint(_7067.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7067.xy, uint(rint(_7067.z)), level(0.0)).x;
        _2198 = _2200;
    }
    float _2202 = _2198;
    float _2204 = _2184;
    if (_2112)
    {
        float3 _7082 = float3(_2082, _2096, float(as_type<int>(_2184)));
        float3 _7084 = select(_7082, float3(0.0), isnan(_7082));
        float _2206 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7084.xy, uint(rint(_7084.z)), _2192, level(0.0));
        _2204 = _2206;
    }
    float _2208 = _2204;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2212 = _1747 + _2210;
    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2216 = _1749 + _2214;
    float _2218 = _2212 * _2212;
    float _2220 = fma(_2216, _2216, _2218);
    float _2222 = sqrt(_2220);
    bool _2224 = _2222 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2226 = !_2224;
    if (!_2226)
    {
        float _2228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2232 = _2222 + _2230;
        float _2234 = _1751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = rsqrt(_2220);
        float _2238 = _2232 * _2228;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2240 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = _2240 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2244 + (-1.0);
        float _2252 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2254 = fma(_2248, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2256 = fma(_2244, _1751, _2252);
        float _2258 = _2236 * _2254;
        float _2260 = fma(_2216, _2258, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2262 = fma(_2212, _2258, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1845 = _2256;
        _1847 = _2260;
        _1849 = _2262;
    }
    float _2264 = _1845;
    float _2266 = _1847;
    float _2268 = _1849;
    float _2270 = _2194 * 2000.0;
    bool _2272 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2274 = isnan(0.5);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2280 = _2276 || _2278;
    bool _2282 = _1559 >= _2270;
    bool _2284 = isnan(_1559);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(_2270);
    bool _2290 = _2286 || _2288;
    float _2292 = _2270;
    float _2294 = _2266;
    if (_2290)
    {
        _2174 = _2264;
    }
    float _2296 = _2174;
    float _2298 = _2296;
    if (!_2290)
    {
        _2298 = 0.0;
    }
    float _2300 = _2298;
    float _2302 = _2300;
    if (_2290)
    {
        _2138 = _2266;
    }
    float _2304 = _2138;
    float _2306 = _2304;
    if (!_2290)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2308 = _2292;
    float _2310 = -_1559;
    float _2312 = _2310 + _2300;
    if (!_2290)
    {
        _2306 = 0.0;
    }
    float _2314 = _2306;
    float _2316 = _2314;
    if (_2290)
    {
        _2140 = _2268;
    }
    float _2318 = _2140;
    float _2320 = _2318;
    if (!_2290)
    {
        float _2322 = _2308 * 5.0;
        _2320 = _2322;
    }
    float _2324 = _2320;
    float _2326 = _2312 * _2312;
    float _2328 = -_1557;
    float _2330 = _2328 + _2314;
    float _2332 = -_1561;
    float _2334 = _2332 + _2324;
    float _2336 = fma(_2330, _2330, _2326);
    float _2338 = fma(_2334, _2334, _2336);
    float _2340 = sqrt(_2338);
    bool _2342 = _2340 > 0.0;
    bool _2344 = !_2342;
    float _2346 = _2324;
    float _2348 = _2338;
    float _2350 = _2330;
    if (!_2344)
    {
        float _2352 = _227 * _227;
        float _2354 = fma(_223, _223, _2352);
        float _2356 = rsqrt(_2338);
        float _2358 = fma(_229, _229, _2354);
        float _2360 = sqrt(_2358);
        float _2362 = _2330 * _2356;
        float _2364 = _2312 * _2356;
        float _2366 = _2334 * _2356;
        bool _2368 = _2360 > 0.0;
        bool _2370 = !_2368;
        _2294 = _2364;
        if (!_2370)
        {
            float _2372 = rsqrt(_2358);
            float _2374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2376 = _227 * _2372;
            float _2378 = _223 * _2372;
            float _2380 = _229 * _2372;
            float _2382 = _2364 * _2376;
            float _2384 = fma(_2362, _2378, _2382);
            float _2386 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2388 = fma(_2366, _2380, _2384);
            float _2390 = _2388 * _2386;
            float _2392 = fma(_223, _2390, _2314);
            float _2394 = fma(_227, _2390, _2300);
            float _2396 = fma(_229, _2390, _2324);
            _2316 = _2392;
            _2302 = _2394;
            _2346 = _2396;
            _2348 = _2378;
            _2350 = _2384;
        }
    }
    float _2398 = _2316;
    float _2400 = _2302;
    float _2402 = _2346;
    float _2404 = _2294;
    float _2406 = _2348;
    float _2408 = _2350;
    float _2410 = _2400;
    float _2412 = _2398;
    float _2414 = _2402;
    float _2416 = _2406;
    float _2418 = _2408;
    float _2420 = _2404;
    if (!_2280)
    {
        float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2424 = _1559 + _2422;
        float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2428 = _1557 + _2426;
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2432 = -_1557;
        float _2434 = _2432 + _2398;
        float _2436 = _2424 * _2424;
        float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2440 = _1561 + _2438;
        float _2442 = -_1559;
        float _2444 = _2442 + _2400;
        float _2446 = fma(_2428, _2428, _2436);
        float _2448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2450 = fma(_2440, _2440, _2446);
        float _2452 = sqrt(_2450);
        float _2454 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2456 = precise::min(_2452, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2458 = _2456 * _2448;
        float _2460 = _2454 * _2458;
        float _2462 = -_1561;
        float _2464 = _2462 + _2402;
        float _2466 = fma(_2434, _2460, _1557);
        float _2468 = fma(_2444, _2460, _1559);
        float _2470 = fma(_2464, _2460, _1561);
        _2410 = _2468;
        _2412 = _2466;
        _2414 = _2470;
        _2416 = _2464;
        _2418 = _2448;
    }
    float _2472 = _2410;
    float _2474 = _2412;
    float _2476 = _2414;
    float _2478 = _2416;
    float _2480 = _2418;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2484 = _2472 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2488 = _2474 + _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2492 = _2476 + _2490;
    float _2494 = _2484 * _2484;
    float _2496 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2498 = fma(_2488, _2488, _2494);
    float _2500 = fma(_2492, _2492, _2498);
    float _2502 = rsqrt(_2500);
    float _2504 = sqrt(_2500);
    float _2506 = _2502 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2508 = _2488 * _2506;
    float _2510 = _2492 * _2506;
    float _2512 = _2508 * _2508;
    float _2514 = _2510 * _2510;
    float _2516 = _2512 + _2514;
    float _2518 = sqrt(_2516);
    bool _2520 = _2518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2524 = _2518 + _2522;
    float _2526 = _2498;
    float _2528 = _2480;
    float _2530 = _2524;
    float _2532 = _2506;
    float _2534 = _2512;
    if (_2520)
    {
        float _2536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2526 = _2536;
    }
    float _2538 = _2526;
    if (_2520)
    {
        float _2540 = rsqrt(_2516);
        _2528 = _2540;
    }
    float _2542 = _2528;
    float _2544 = _2542;
    if (_2520)
    {
        float _2546 = _2524 * _2538;
        _2530 = _2546;
    }
    float _2548 = _2530;
    float _2550 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2520)
    {
        float _2552 = _2548 * 0.15915493667125701904296875;
        _2420 = _2552;
    }
    float _2554 = _2420;
    float _2556 = _2538;
    if (_2520)
    {
        float _2558 = _2554 * 6.283185482025146484375;
        float _2560 = sin(_2558);
        _2556 = _2560;
    }
    float _2562 = _2556;
    float _2564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2566 = precise::max(0.0, _2564);
    float _2568 = _2478;
    float _2570 = _2566;
    if (_2520)
    {
        float _2572 = _2554 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2568 = _2574;
    }
    float _2576 = _2568;
    float _2578 = -_2506;
    float _2580 = -_2566;
    float _2582 = fma(_2484, _2578, _2580);
    if (_2520)
    {
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2570 = _2584;
    }
    float _2586 = _2570;
    float _2588 = _2586;
    float _2590 = _2562;
    if (_2520)
    {
        float _2592 = fma(_2562, _2586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2588 = _2592;
    }
    float _2594 = _2588;
    float _2596 = _2594;
    float _2598 = _2576;
    if (_2520)
    {
        float _2600 = _2576 + (-1.0);
        _2590 = _2600;
    }
    float _2602 = _2590;
    float _2604 = _2602;
    if (_2520)
    {
        float _2606 = _2542 * _2594;
        _2152 = _2606;
    }
    float _2608 = _2152;
    if (!_2520)
    {
        _2544 = _2508;
    }
    float _2610 = _2544;
    float _2612 = _2610;
    if (_2520)
    {
        float _2614 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2532 = _2614;
    }
    float _2616 = _2532;
    if (_2520)
    {
        float _2618 = _2508 * _2608;
        _2612 = _2618;
    }
    float _2620 = _2612;
    if (!_2520)
    {
        _2596 = _2582;
    }
    float _2622 = _2596;
    float _2624 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2550);
    float _2626 = _2622;
    if (!_2520)
    {
        _2604 = _2510;
    }
    float _2628 = _2604;
    float _2630 = _2628;
    if (_2520)
    {
        float _2632 = fma(_2582, _2576, _2616);
        _2626 = _2632;
    }
    float _2634 = _2626;
    if (_2520)
    {
        float _2636 = _2510 * _2608;
        _2630 = _2636;
    }
    float _2638 = _2630;
    if (_2520)
    {
        float _2640 = _2620 * _2620;
        _2534 = _2640;
    }
    float _2642 = _2534;
    if (!_2520)
    {
        _2598 = _2514;
    }
    float _2644 = _2598;
    float _2646 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = _2644;
    if (_2520)
    {
        float _2650 = _2638 * _2638;
        _2648 = _2650;
    }
    float _2652 = _2648;
    float _2654 = fma(_2634, _2634, _2642);
    float _2656 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2624);
    float _2658 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2660 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2662 = _2654 + _2652;
    float _2664 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2666 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2658);
    float _2668 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2660);
    float _2670 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2664);
    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2674 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2672);
    float _2676 = precise::clamp(_2674, 0.0, 1.0);
    float _2678 = rsqrt(_2662);
    float _2680 = _2666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2682 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2670);
    float _2684 = -_2676;
    float _2686 = _2684 + 1.0;
    float _2688 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2690 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2692 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2694 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2668);
    float _2696 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = abs(_2686);
    float _2700 = log2(_2698);
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2690);
    float _2704 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2706 = -_2696;
    float _2708 = fma(_2706, _2496, 1.0);
    float _2710 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2702);
    float _2712 = _2678 * _2620;
    float _2714 = _2678 * _2634;
    float _2716 = _2678 * _2638;
    float _2718 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2710);
    float _2720 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2722 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2724 = log2(_2708);
    float _2726 = -_2720;
    float _2728 = fma(_2714, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2726);
    float _2730 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2732 = -_2716;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2728);
    float _2736 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2738 = 1.0 / _2718;
    float _2740 = fma(_2734, -0.5, 0.5);
    float _2742 = fma(_2734, 0.5, 0.5);
    float _2744 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2722);
    float _2746 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2736);
    float _2748 = _2714 + 1.0;
    float _2750 = fma(_2742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2752 = exp2(_2730);
    float _2754 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2744);
    float _2756 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2746);
    float _2758 = fma(_2742, _2750, -0.212114393711090087890625);
    float _2760 = _2724 * 0.693147182464599609375;
    float _2762 = fma(_2742, _2758, 1.570728778839111328125);
    float _2764 = sqrt(_2740);
    float _2766 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2768 = -_2714;
    float _2770 = fma(_2752, _2748, _2768);
    float _2772 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2754);
    float _2774 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2756);
    float _2776 = fma(_2770, 0.5, 0.5);
    float _2778 = _2772 * _2738;
    float _2780 = _2774 * _2738;
    float _2782 = _2764 * 0.636619746685028076171875;
    float _2784 = fma(_2778, 0.5, 0.5);
    float _2786 = fma(_2780, -0.5, 0.5);
    float _2788 = -_2762;
    float _2790 = fma(_2782, _2788, 1.0);
    float3 _8007 = float3(_2784, _2786, _2766);
    float _2792 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8007, float3(0.0), isnan(_8007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8007, float3(0.0), isnan(_8007)), level(0.0)).x;
    float3 _8016 = float3(_2784, _2786, _2766);
    float4 _2795 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8016, float3(0.0), isnan(_8016)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8016, float3(0.0), isnan(_8016)), level(0.0)).xyzw;
    float _2797 = _2795.x;
    float _2799 = _2795.y;
    float _2801 = _2795.z;
    float _2803 = _2795.w;
    float2 _8032 = float2(_2790, _2776);
    float3 _2807 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8032, float2(0.0), isnan(_8032)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8032, float2(0.0), isnan(_8032)), level(0.0)).xyz;
    float _2809 = _2807.x;
    float _2811 = _2807.y;
    float _2813 = _2807.z;
    float _2815 = abs(_1829);
    float _2817 = log2(_2815);
    out.m_92.x = _2488;
    out.m_92.y = _2484;
    out.m_92.z = _2492;
    bool _2819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2821 = isnan(0.5);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2827 = _2823 || _2825;
    float _2829 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2831 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2829);
    float _2833 = _2772 + _2718;
    float _2835 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2837 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2839 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2831);
    float _2841 = _2833 * 0.5;
    float _2843 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2837);
    float _2845 = exp2(_2835);
    float _2847 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2849 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2843);
    float _2851 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2847);
    float _2853 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2849);
    float _2855 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2851);
    float _2857 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2859 = _2853 + _2718;
    out.gl_Position.x = _2772;
    out.gl_Position.y = _2774;
    out.gl_Position.z = _2853;
    out.gl_Position.w = _2718;
    float _2861 = _2855 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2863 = _2859 * 0.5;
    float _2865 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2871 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2873 = fma(_2867, -2.0, 3.0);
    float _2875 = _2867 * _2867;
    float _2877 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2879 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2881 = _2875 * _2873;
    float _2883 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2877);
    float _2885 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2883);
    float _2887 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2857);
    float _2889 = _2839 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2891 = _2718 * 0.5;
    float _2893 = _2885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2895 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2887);
    float _2897 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2869);
    float _2899 = fma(_2774, -0.5, _2891);
    float _2901 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2903 = _2895 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2905 = -_2881;
    float _2907 = _2905 + 1.0;
    float _2909 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2871);
    float _2911 = _2901 + _2897;
    float _2913 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    out.m_94.x = _2841;
    out.m_94.y = _2899;
    out.m_94.z = _2863;
    out.m_94.w = _2718;
    float _2915 = fma(_2907, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2881);
    float _2917 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2911);
    float _2919 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2913);
    float _2921 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2923 = 1.0 / _2917;
    bool _2925 = _1829 <= 8000.0;
    bool _2927 = isnan(_1829);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan(8000.0);
    bool _2933 = _2929 || _2931;
    float _2935 = float(_2933);
    float _2937 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2879);
    float _2939 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2909);
    float _2941 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2943 = _2921 + _2919;
    float _2945 = _2935 * _2915;
    float _2947 = _2915;
    float _2949 = _2919;
    float _2951 = _2774;
    float _2953 = _2921;
    float _2955 = _2772;
    float _2957 = _2718;
    if (_2827)
    {
        _2947 = 1.0;
    }
    float _2959 = _2947;
    float _2961 = _2959;
    if (!_2827)
    {
        float _2963 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2965 = _2963 * 0.15915493667125701904296875;
        float _2967 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2969 = _2965 * 6.283185482025146484375;
        float _2971 = cos(_2969);
        float _2973 = _2967 * 0.15915493667125701904296875;
        float _2975 = _2965 * 6.283185482025146484375;
        float _2977 = sin(_2975);
        float _2979 = 1.0 / _2971;
        float _2981 = _2973 * 6.283185482025146484375;
        float _2983 = cos(_2981);
        float _2985 = _2977 * _2979;
        float _2987 = _2973 * 6.283185482025146484375;
        float _2989 = sin(_2987);
        float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2993 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2991;
        float _2995 = _2983 * _2985;
        float _2997 = 1.0 / _2993;
        float _2999 = 1.0 / _2995;
        float _3001 = _2989 * _2999;
        float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3005 = fma(_1829, _3001, _3003);
        float _3007 = _3005 * _2997;
        float _3009 = precise::clamp(_3007, 0.0, 1.0);
        _2949 = _2993;
        _2961 = _3009;
    }
    float _3011 = _2949;
    float _3013 = _2961;
    float _3015 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3017 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2943);
    float _3019 = _2941 + _2937;
    float _3021 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3023 = exp2(_3015);
    float _3025 = -_2196;
    float _3027 = _3025 + 1.0;
    float _3029 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3019);
    float _3031 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2939);
    float _3033 = _3011;
    float _3035 = _3021;
    if (!_2112)
    {
        _3033 = 1.0;
    }
    float _3037 = _3033;
    float _3039 = _3037;
    if (_2112)
    {
        bool _3041 = _2208 >= _2192;
        bool _3043 = isnan(_2208);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan(_2192);
        bool _3049 = _3045 || _3047;
        float _3051 = float(_3049);
        _3039 = _3051;
    }
    float _3053 = _3039;
    float _3055 = _3017 * _2923;
    float _3057 = _3029 * _2923;
    float _3059 = _3027 * _3021;
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = _3031 * _2923;
    if (_1888)
    {
        _3035 = 1.0;
    }
    float _3065 = _3035;
    float _3067 = _3065;
    if (!_1888)
    {
        int _3069 = _1912 << 4;
        int _3071 = _3069 + 2048;
        uint _3073 = uint(int(uint(_3071) >> uint(2)));
        uint _3075 = uint(int(uint(int(_3073)) >> uint(2)));
        int _3077 = int(_3073) & 3;
        float _3079 = (*spvDescriptorSet0.vp_c15)._m0[int(_3075)][_3077];
        int _3081 = int(_3073) + 1;
        uint _3083 = uint(int(uint(_3081) >> uint(2)));
        int _3085 = _3081 & 3;
        float _3087 = (*spvDescriptorSet0.vp_c15)._m0[int(_3083)][_3085];
        int _3089 = _3071 + 8;
        uint _3091 = uint(int(uint(_3089) >> uint(2)));
        uint _3093 = uint(int(uint(int(_3091)) >> uint(2)));
        int _3095 = int(_3091) & 3;
        float _3097 = (*spvDescriptorSet0.vp_c15)._m0[int(_3093)][_3095];
        int _3099 = int(_3091) + 1;
        uint _3101 = uint(int(uint(_3099) >> uint(2)));
        int _3103 = _3099 & 3;
        float _3105 = (*spvDescriptorSet0.vp_c15)._m0[int(_3101)][_3103];
        float _3107 = _1761 * _3087;
        float _3109 = fma(_1557, _3079, _3107);
        float _3111 = fma(_1561, _3097, _3109);
        float _3113 = _3111 + _3105;
        float _3115 = precise::clamp(_3113, 0.0, 1.0);
        float _3117 = -_3115;
        float _3119 = _3117 + _2202;
        float _3121 = fma(_3119, 500.0, 1.5);
        float _3123 = exp2(_3121);
        float _3125 = 0.0 + _3123;
        float _3127 = precise::clamp(_3125, 0.0, 1.0);
        _3067 = _3127;
    }
    float _3129 = _3067;
    float _3131 = _3053 * _3129;
    float _3133 = -_3061;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3137 = -_3023;
    float _3139 = _3137 + 1.0;
    float _3141 = -_227;
    float _3143 = _3141 + _2472;
    bool _3145 = _3063 > 0.0;
    float _3147 = -_3131;
    float _3149 = fma(_3147, _3135, 1.0);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3155 = -_223;
    float _3157 = _3155 + _2474;
    float _3159 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    out.m_96.y = 1.0;
    float _3161 = _3153 * _2792;
    bool _3163 = _3063 < 1.0;
    bool _3165 = _3163 && _3145;
    float _3167 = -_229;
    float _3169 = _3167 + _2476;
    float _3171 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3159);
    float _3173 = -_3153;
    float _3175 = _3173 + 1.0;
    bool _3177 = _2778 > (-1.0);
    bool _3179 = _3177 && _3165;
    float _3181 = _3151 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3183 = _2803 * _3161;
    float _3185 = _2813 * _3161;
    float _3187 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3171);
    float _3189 = _2803 * _3175;
    float _3191 = fma(_2809, _3183, _2797);
    float _3193 = fma(_2811, _3183, _2799);
    float _3195 = fma(_2803, _3185, _2801);
    bool _3197 = _2780 > (-1.0);
    bool _3199 = _3197 && _3179;
    float _3201 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    out.m_96.x = _3181;
    float _3203 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    bool _3205 = _2778 < 1.0;
    bool _3207 = _3205 && _3199;
    out.m_98.x = _3191;
    out.m_98.y = _3193;
    out.m_98.z = _3195;
    out.m_98.w = _3189;
    float _3209 = 1.0 / _3201;
    bool _3211 = _2780 < 1.0;
    bool _3213 = _3211 && _3207;
    float _3215 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    if (!_2290)
    {
        _1851 = 0.0;
    }
    float _3217 = _1851;
    float _3219 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3215);
    float _3221 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3203);
    float _3223 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3219);
    float _3225 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3221);
    float _3227 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3229 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3231 = _3217 * _3013;
    float _3233 = _3227 * _3209;
    float _3235 = _3229 * _3209;
    float _3237 = _3231 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3239 = !_3213;
    float _3241 = _3229;
    float _3243 = _3227;
    float _3245 = _3237;
    if (!_3239)
    {
        float _3247 = -_3057;
        float _3249 = _2780 + _3247;
        float _3251 = -_3055;
        float _3253 = _2778 + _3251;
        float _3255 = -_3233;
        float _3257 = _2778 + _3255;
        float _3259 = -_3235;
        float _3261 = _2780 + _3259;
        float _3263 = _3249 * _3249;
        float _3265 = fma(_3253, _3253, _3263);
        float _3267 = sqrt(_3265);
        bool _3269 = _3267 > 0.0;
        bool _3271 = !_3269;
        _3241 = _3267;
        _3243 = _3253;
        _3273 = _3271;
        if (!_3273)
        {
            float _3275 = _3261 * _3261;
            float _3277 = fma(_3257, _3257, _3275);
            float _3279 = rsqrt(_3265);
            float _3281 = sqrt(_3277);
            float _3283 = _3253 * _3279;
            float _3285 = _3249 * _3279;
            bool _3287 = _3281 > 0.0;
            bool _3289 = !_3287;
            _3241 = _3279;
            _3273 = _3289;
            if (!_3273)
            {
                float _3291 = _631 * _2903;
                float _3293 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3295 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2901);
                float _3297 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2941);
                float _3299 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2921);
                float _3301 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3295);
                float _3303 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3297);
                float _3305 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3299);
                float _3307 = rsqrt(_3277);
                float _3309 = _3293 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3311 = 1.0 / _3301;
                float _3313 = _3261 * _3309;
                float _3315 = _3257 * _3309;
                float _3317 = _3313 * _3313;
                float _3319 = fma(_3315, _3315, _3317);
                float _3321 = _3261 * _3307;
                float _3323 = _3257 * _3307;
                float _3325 = _3303 * _3311;
                float _3327 = _3305 * _3311;
                float _3329 = sqrt(_3319);
                float _3331 = _3325 * _3325;
                float _3333 = fma(_3327, _3327, _3331);
                float _3335 = _3285 * _3321;
                float _3337 = fma(_3283, _3323, _3335);
                float _3339 = sqrt(_3333);
                float _3341 = precise::min(0.0, _3337);
                float _3343 = _2718 * _3341;
                float _3345 = fma(_3315, _3343, _2772);
                float _3347 = fma(_3313, _3343, _2774);
                float _3349 = fma(_3329, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3339);
                out.gl_Position.x = _3345;
                out.gl_Position.y = _3347;
                float _3351 = 1.0 / _3349;
                float _3353 = _3339 * _3351;
                out.m_96.y = _3353;
                _2951 = _3347;
                _3241 = _3349;
                _3243 = _3351;
                _2953 = _3343;
                _2955 = _3345;
                _3273 = true;
            }
        }
    }
    else
    {
        float _3355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3355;
        _2951 = 0.0;
        _2953 = _3355;
        _3245 = 0.0;
        _2955 = 0.0;
    }
    _3273 = false;
    float _3357 = _2951;
    float _3359 = _3241;
    float _3361 = _3243;
    float _3363 = _2953;
    float _3365 = _3245;
    float _3367 = _2955;
    bool _3369 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3371 = isnan(_2504);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3377 = _3373 || _3375;
    float _3379 = _3361;
    float _3381 = _3359;
    float _3383 = _3363;
    float _3385 = _3357;
    float _3387 = _3367;
    if (!_3377)
    {
        _3379 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3389 = _3379;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3377)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3395 = _3381;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3377)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3401 = _2957;
    float _3403 = _3401;
    float _3405 = _3401;
    if (!_3377)
    {
        _3383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3407 = _3383;
    float _3409 = _3407;
    float _3411 = _3407;
    if (!_3377)
    {
        _3385 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3413 = _3385;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3377)
    {
        _3387 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3419 = _3387;
    bool _3421 = !_3377;
    float _3423 = _3419;
    float _3425 = _3419;
    if (!_3421)
    {
        bool _3427 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3429 = isnan(_2504);
        bool _3431 = _3427 || _3429;
        bool _3433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3435 = _3431 || _3433;
        if (!_3435)
        {
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3439 = _2504 + _3437;
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3443 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3441;
            float _3445 = 1.0 / _3443;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3467 = _3439 * _3445;
            float _3469 = precise::clamp(_3467, 0.0, 1.0);
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3475 = fma(_3469, _3449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3477 = fma(_3469, _3473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3479 = fma(_3469, _3453, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3481 = fma(_3469, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3483 = fma(_3469, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3485 = fma(_3469, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3399 = _3477;
            _3417 = _3483;
            _3393 = _3475;
            _3411 = _3481;
            _3405 = _3479;
            _3425 = _3485;
            _3487 = true;
        }
        else
        {
            bool _3489 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3491 = isnan(_2504);
            bool _3493 = _3489 || _3491;
            bool _3495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3497 = _3493 || _3495;
            if (!_3497)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3499 = _3391;
            _3393 = _3499;
            if (!_3497)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3501 = _3397;
            _3399 = _3501;
            if (!_3497)
            {
                _3403 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3503 = _3403;
            _3405 = _3503;
            if (!_3497)
            {
                _3409 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3505 = _3409;
            _3411 = _3505;
            if (!_3497)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3507 = _3415;
            _3417 = _3507;
            if (!_3497)
            {
                _3423 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3509 = _3423;
            bool _3511 = !_3497;
            _3425 = _3509;
            if (!_3511)
            {
                bool _3513 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3515 = isnan(_2504);
                bool _3517 = _3513 || _3515;
                bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3521 = _3517 || _3519;
                if (!_3521)
                {
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3525 = _2504 + _3523;
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3529 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3527;
                    float _3531 = 1.0 / _3529;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3553 = _3525 * _3531;
                    float _3555 = precise::clamp(_3553, 0.0, 1.0);
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3561 = fma(_3555, _3535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3563 = fma(_3555, _3559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3565 = fma(_3555, _3539, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3567 = fma(_3555, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3569 = fma(_3555, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3571 = fma(_3555, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3399 = _3563;
                    _3417 = _3569;
                    _3393 = _3561;
                    _3411 = _3567;
                    _3405 = _3565;
                    _3425 = _3571;
                    _3487 = true;
                }
                else
                {
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3411 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3405 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3425 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3487 = false;
    float _3573 = _3399;
    float _3575 = _3417;
    float _3577 = _3393;
    float _3579 = _3411;
    float _3581 = _3405;
    float _3583 = _3425;
    float _3585 = fma(_1525, -0.5, 0.5);
    float _3587 = precise::clamp(_3585, 0.0, 1.0);
    float _3589 = -_3573;
    float _3591 = _3589 + _3575;
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    out.m_100.x = 0.0;
    float _3597 = fma(_3587, _3591, _3573);
    float _3599 = _3365 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3601 = fma(_3587, _3595, _3577);
    float _3603 = -_3581;
    float _3605 = _3603 + _3583;
    float _3607 = _3597 * 0.586610972881317138671875;
    bool _3609 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_63.x = _3599;
    float _3611 = fma(_3587, _3605, _3581);
    float _3613 = fma(_3601, 0.298911988735198974609375, _3607);
    bool _3615 = _3013 > 0.0;
    bool _3617 = isnan(_3013);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(0.0);
    bool _3623 = _3619 || _3621;
    float _3625 = fma(_3611, 0.114477999508380889892578125, _3613);
    float _3627 = -_3625;
    float _3629 = _3601 + _3627;
    float _3631 = -_3625;
    float _3633 = _3597 + _3631;
    float _3635 = -_3625;
    float _3637 = _3611 + _3635;
    float _3639 = fma(_3629, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    float _3641 = fma(_3633, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    float _3643 = fma(_3637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    bool _3645 = !_3609;
    if (!_3645)
    {
        float _3647 = -_2472;
        float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3651 = -_2474;
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3655 = -_2476;
        float _3657 = _3655 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3659 = _3649 * _3649;
        float _3661 = fma(_3653, _3653, _3659);
        float _3663 = fma(_3657, _3657, _3661);
        float _3665 = sqrt(_3663);
        float _3667 = rsqrt(_3663);
        float _3669 = -_3665;
        float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3673 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3675 = precise::clamp(_3673, 0.0, 1.0);
        float _3677 = _3653 * _3667;
        float _3679 = _3649 * _3667;
        float _3681 = abs(_3675);
        float _3683 = log2(_3681);
        float _3685 = _3657 * _3667;
        float _3687 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3689 = _1525 * _3679;
        float _3691 = -_3679;
        float _3693 = -_3687;
        float _3695 = fma(_3691, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3693);
        float _3697 = fma(_1523, _3677, _3689);
        float _3699 = -_3685;
        float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3695);
        float _3703 = fma(_1527, _3685, _3697);
        float _3705 = precise::clamp(_3703, 0.0, 1.0);
        float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3709 = _3701 + _3707;
        float _3711 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3713 = _3709 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = exp2(_3711);
        float _3719 = _3717 * _3715;
        float _3721 = _3705 * _3719;
        float _3723 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3725 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3727 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3723;
        out.m_100.y = _3725;
        out.m_100.z = _3727;
    }
    out.m_102.x = _3639;
    out.m_102.y = _3641;
    out.m_102.z = _3643;
    if (_3623)
    {
        return out;
    }
    float _3729 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3729;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3487 = false;
    bool _3273 = false;
    bool _1615 = false;
    bool _1603 = false;
    bool _603 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
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
        out.m_63.x = 0.0;
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
        float _3786 = as_type<float>(_137);
        out.gl_Position.z = _3786;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    float _159 = _155;
    if (_151)
    {
        float _161 = float(_121);
        _157 = _161;
    }
    float _163 = _157;
    bool _165 = _155 >= _163;
    bool _167 = !_151;
    bool _169 = _165 || _167;
    if (_169)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3855 = as_type<float>(_175);
        out.gl_Position.z = _3855;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = in.m_70.x;
    float _181 = in.m_70.y;
    float _183 = in.m_70.z;
    float _185 = in.m_72.x;
    float _187 = in.m_72.y;
    float _189 = in.m_72.z;
    float _191 = in.m_74.x;
    float _193 = in.m_74.y;
    float _195 = in.m_74.z;
    float _197 = in.m_76.x;
    float _199 = in.m_76.y;
    float _201 = in.m_76.z;
    int _203 = as_type<int>(_177) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_177) & 2;
    bool _209 = _207 != 0;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = _181 * _187;
    float _215 = _181 * _193;
    float _217 = fma(_179, _185, _213);
    float _219 = _181 * _199;
    float _221 = fma(_179, _191, _215);
    float _223 = fma(_183, _189, _217);
    float _225 = fma(_179, _197, _219);
    float _227 = fma(_183, _195, _221);
    float _229 = fma(_183, _201, _225);
    bool _231 = !_205;
    float _233 = _231 ? (-0.5) : 0.5;
    bool _235 = !_209;
    float _237 = _235 ? (-0.5) : 0.5;
    bool _239 = !_211;
    float _257;
    if (!_239)
    {
        float _241 = in.m_78.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_121);
        float _263 = 1.0 / _261;
        float _265 = _155 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _267 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    bool _293 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_267);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = 1.0 / _283;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _287;
    float _313 = _271 * _305;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _325 * _329;
    float _333 = _275 * _309;
    bool _335 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_267);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _349;
    float _357 = -_345;
    float _359 = _357 + 1.0;
    float _361 = _279 * _311;
    bool _363 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_267);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_353, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_377, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _373 * _359;
    float _393 = fma(_383, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_387, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = _389 * _391;
    float _403 = _393 * _391;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _417 = fma(_407, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_379, _355, _409);
    float _421 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_395, _355, _415);
    float _425 = fma(_417, _331, _419);
    float _427 = fma(_421, _331, _423);
    float _429 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_307;
    float _451;
    if (!_433)
    {
        float _435 = in.m_78.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_121);
        float _457 = 1.0 / _455;
        float _459 = _155 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_461);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _487 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _489 = isnan(_461);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _499;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _469;
    float _517 = -_481;
    float _519 = _517 + 1.0;
    float _521 = _497 * _519;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = 1.0 / _485;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _501 * _515;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _545 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _549 = _543 * _529;
    float _551 = _545 * _521;
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _461 + _557;
    float _561 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _551);
    float _565 = _481 * _555;
    float _567 = fma(_549, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _569 = fma(_567, _565, _563);
    float _571 = in.m_80.x;
    float _573 = in.m_80.y;
    float _575 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[117].x, _569);
    float _577 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_82.x = _561;
    out.m_82.y = _535;
    out.m_82.z = _537;
    out.m_82.w = _577;
    float _579 = _431 * _573;
    float _581 = _429 * _571;
    bool _583 = !_533;
    float _601;
    if (!_583)
    {
        float _585 = in.m_78.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].w, _155);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_121);
        float _607 = 1.0 / _605;
        float _609 = _155 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = in.m_78.x;
    float _615 = in.m_78.y;
    float _617 = in.m_78.z;
    float _619 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _621 = in.m_60.x;
    float _623 = in.m_60.y;
    float _625 = in.m_60.z;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _629 = _627 != 0;
    float _631 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _635 = _633 != 0;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _639 = in.m_74.w;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _643 = _641 != 0;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _651 = _649 != 0;
    float _653 = in.m_72.w;
    bool _655 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _657 = isnan(_611);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = in.m_76.w;
    float _669 = _617 * 2.0;
    bool _671 = _613 > 0.5;
    float _673 = _613 * 2.0;
    float _675 = _193 * _623;
    float _677 = -_233;
    int _679 = _671 ? as_type<int>(_677) : as_type<int>(_233);
    float _681 = floor(_669);
    float _683 = _187 * _623;
    float _685 = _199 * _623;
    float _687 = fma(_191, _621, _675);
    float _689 = _615 + _617;
    float _691 = fma(_185, _621, _683);
    float _693 = fma(_197, _621, _685);
    float _695 = fma(_195, _625, _687);
    float _697 = floor(_673);
    float _699 = fma(_201, _625, _693);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _705 = fma(_189, _625, _691);
    float _707 = _613 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _709 = _681 > 0.0;
    float _711 = 1.0 / _703;
    bool _713 = _681 >= 0.0;
    bool _715 = isnan(_681);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = _617 + _613;
    float _725 = _617 + (-0.5);
    float _727 = -_637;
    float _729 = fma(_707, 2.0, _727);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _733 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _735 = log2(_733);
    float _737 = _615 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[79].z, _731);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _749 = _721 ? 0 : 1;
    float _751 = _615 + _613;
    float _753 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[78].z, _745);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _761 = fma(_737, -2.0, _747);
    float _763 = 1.0 / _741;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _769 = _613 + (-0.5);
    float _771 = _615 * 2.0;
    int _773 = ~_749;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = _735 * _155;
    int _781 = _777;
    if (!_709)
    {
        int _783 = ~_749;
        int _785 = _783 + 1;
        _781 = _785;
    }
    int _787 = _781;
    float _789 = 1.0 / _757;
    bool _791 = _697 >= 0.0;
    bool _793 = isnan(_697);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _767 * _711;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _803;
    bool _807 = _615 > 0.5;
    float _809 = _615 + (-0.5);
    int _811 = _799 ? 0 : 1;
    float _813 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[78].w, _759);
    float _815 = floor(_771);
    bool _817 = _697 > 0.0;
    float _819 = _689 + (-1.0);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _821;
    float _825 = _751 + (-1.0);
    int _827 = ~_811;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _835 = _611 + _833;
    float _837 = _823 * _763;
    float _839 = _805 * _789;
    float _841 = exp2(_779);
    float _843 = _723 + (-1.0);
    float _845 = -_237;
    int _847 = _807 ? as_type<int>(_845) : as_type<int>(_237);
    float _849 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _853 = _611 + _851;
    int _855 = _831;
    if (!_817)
    {
        int _857 = ~_811;
        int _859 = _857 + 1;
        _855 = _859;
    }
    int _861 = _855;
    float _863 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[79].x, _743);
    bool _865 = _815 > 0.0;
    float _867 = fma(_837, _853, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _869 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _871 = isnan(_611);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = fma(_839, _835, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _883 = _815 >= 0.0;
    bool _885 = isnan(_815);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _895 = _611 + _893;
    bool _897 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _899 = isnan(_611);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = -_879;
    float _911 = _909 + 1.0;
    float _913 = _863 * (-0.15915493667125701904296875);
    float _915 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _917 = fma(_801, _895, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _919 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _921 = isnan(_611);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _907 * _911;
    float _933 = _913 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = -_841;
    float _939 = _937 + 1.0;
    float _941 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _943 = -_907;
    float _945 = _943 + 1.0;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _949 = 1.0 + _947;
    float _951 = -_929;
    float _953 = _951 + 1.0;
    int _955 = _891 ? 0 : 1;
    float _957 = _929 * _945;
    float _959 = _913 * 6.283185482025146484375;
    float _961 = cos(_959);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = _665 * _953;
    float _975 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _977 = -_665;
    float _979 = _977 + 1.0;
    float _981 = _971 ? _939 : 0.0;
    float _983 = _867 * _973;
    bool _985 = !_635;
    float _987 = _985 ? _237 : as_type<float>(_847);
    float _989 = 1.0 / _949;
    bool _991 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _993 = isnan(1.0);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _999 = _995 || _997;
    float _1001 = _695 + _639;
    float _1003 = -_155;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[76].x, _729);
    float _1007 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[131].x, _983);
    bool _1009 = !_643;
    int _1011 = _1009 ? 0 : 1;
    float _1013 = _987 * _935;
    bool _1015 = !_629;
    float _1017 = _1015 ? _233 : as_type<float>(_679);
    float _1019 = _987 * _961;
    float _1021 = fma(_917, _957, _1007);
    int _1023 = abs(_1011);
    float _1025 = _705 + _653;
    float _1027 = -_1013;
    float _1029 = fma(_1017, _961, _1027);
    float _1031 = fma(_1017, _935, _1019);
    bool _1033 = !_647;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _753);
    float _1039 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    float _1041 = _1001 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    if (_999)
    {
        float _1043 = _981 * _989;
        _159 = _1043;
    }
    float _1045 = _159;
    int _1047 = abs(_1035);
    float _1049 = _1025 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1051 = float(_1023);
    float _1053 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1055 = float(_787);
    float _1057 = _699 + _667;
    float _1059 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1061 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1053);
    float _1063 = fma(_881, _931, _1021);
    float _1065 = _1051 * _1055;
    int _1067 = ~_955;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    float _1073 = in.m_84.x;
    float _1075 = in.m_84.y;
    float _1077 = in.m_84.z;
    int _1079 = _1071;
    if (!_865)
    {
        int _1081 = ~_955;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = _1057 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1089 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1093 = _1041 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1061);
    float _1097 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1089);
    float _1099 = -_1057;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = fma(_1049, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1093);
    float _1105 = _1095 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1107 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1097);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1111 = -_1001;
    float _1113 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = float(_861);
    float _1117 = _1105 * _1059;
    bool _1119 = !_651;
    int _1121 = _1119 ? 0 : 1;
    float _1123 = _1107 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1125 = -_1025;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1129 = _1113 * _1113;
    int _1131 = abs(_1121);
    float _1133 = _1123 * _1091;
    float _1135 = _1065 * (-2.0);
    float _1137 = float(_1047);
    float _1139 = fma(_1127, _1127, _1129);
    float _1141 = fma(_1087, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1103);
    float _1143 = fma(_1117, 0.5, 0.5);
    float _1145 = float(_1085);
    float _1147 = fma(_1135, _1073, _1073);
    float _1149 = _1137 * _1115;
    float _1151 = fma(_1101, _1101, _1139);
    float _1153 = float(_1131);
    float _1155 = fma(_941, _1135, _941);
    float _1157 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1147);
    float _1159 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1161 = _1029 + 0.5;
    float _1163 = rsqrt(_1151);
    float _1165 = _1149 * (-2.0);
    float _1167 = _1153 * _1145;
    float _1169 = fma(_1159, _1161, _1005);
    float _1171 = -_1037;
    float _1173 = _1171 + 1.0;
    float _1175 = fma(_1165, _1075, _1075);
    float _1177 = fma(_849, _1165, _849);
    float _1179 = _1167 * (-2.0);
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1183 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1175);
    float _1185 = fma(_1155, _1045, _1157);
    float _1187 = fma(_915, _1179, _915);
    float _1189 = fma(_1179, _1077, _1077);
    float _1191 = fma(_1177, _1045, _1183);
    float _1193 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1063);
    float _1195 = -_1173;
    float _1197 = fma(_1029, _1195, _1169);
    float _1199 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1189);
    float _1201 = _1127 * _1163;
    float _1203 = _1101 * _1163;
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1207 = fma(_1187, _1045, _1199);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1211 = _1201 * _1209;
    float _1213 = _1031 + (-0.5);
    float _1215 = _1113 * _1163;
    float _1217 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1219 = _1207 * 0.15915493667125701904296875;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1223 = _1203 * _1221;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1227 = -_1211;
    float _1229 = fma(_1203, _1225, _1227);
    float _1231 = -_1217;
    float _1233 = -_975;
    float _1235 = fma(_1231, _1213, _1233);
    float _1237 = fma(_1133, 0.5, 0.5);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1241 = _1215 * _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1245 = -_1223;
    float _1247 = fma(_1215, _1243, _1245);
    float _1249 = _1229 * _1229;
    float _1251 = _1185 * 0.15915493667125701904296875;
    float _1253 = _1191 * 0.15915493667125701904296875;
    float _1255 = -_1039;
    float _1257 = _1255 + 1.0;
    float _1259 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1261 = floor(_1237);
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1265 = -_1241;
    float _1267 = fma(_1201, _1263, _1265);
    float _1269 = fma(_1247, _1247, _1249);
    float _1271 = _1141 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1273 = fma(_1031, _1257, _1235);
    float _1275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _237);
    float _1277 = floor(_1143);
    float _1279 = _1271 * _1205;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1285 = _619 * _1275;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1289 = fma(_1279, 0.5, 0.5);
    float _1291 = _1251 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_86.x = _1197;
    out.m_86.y = _1273;
    bool _1301 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1303 = isnan(1.0);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1309 = _1305 || _1307;
    float _1311 = _1251 * 6.283185482025146484375;
    float _1313 = cos(_1311);
    out.m_88.x = _1295;
    out.m_88.y = _1297;
    out.m_88.z = _1299;
    out.m_88.w = _1259;
    float _1315 = -_1277;
    float _1317 = _1143 + _1315;
    float _1319 = _1253 * 6.283185482025146484375;
    float _1321 = sin(_1319);
    float _1323 = -_1261;
    float _1325 = _1237 + _1323;
    float _1327 = _1253 * 6.283185482025146484375;
    float _1329 = cos(_1327);
    float _1331 = _1219 * 6.283185482025146484375;
    float _1333 = cos(_1331);
    float _1335 = fma(_1267, _1267, _1269);
    float _1337 = _1293 * _1321;
    float _1339 = _1313 * _1321;
    float _1341 = _1219 * 6.283185482025146484375;
    float _1343 = sin(_1341);
    float _1345 = _1313 * _1329;
    float _1347 = _1293 * _1329;
    float _1349 = rsqrt(_1335);
    float _1351 = _1321 * _1333;
    float _1353 = fma(_1325, 2.0, -1.0);
    float _1355 = _1293 * _1333;
    float _1357 = _1329 * _1333;
    float _1359 = _1313 * _1333;
    float _1361 = fma(_1317, 2.0, -1.0);
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1365 = floor(_1289);
    float _1367 = fma(_1343, _1345, _1337);
    float _1369 = fma(_1343, _1337, _1345);
    float _1371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _1373 = -_1339;
    float _1375 = fma(_1343, _1347, _1373);
    float _1377 = -_1347;
    float _1379 = fma(_1343, _1339, _1377);
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1383 = _631 * _1371;
    float _1385 = _1229 * _1349;
    float _1387 = _1267 * _1349;
    float _1389 = _1247 * _1349;
    float _1391 = -_1285;
    float _1393 = _1343 * _1391;
    float _1395 = _1359 * _1285;
    float _1397 = _1355 * _1285;
    float _1399 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1403 = -_1365;
    float _1405 = _1289 + _1403;
    float _1407 = _1363 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1409 = fma(_1357, _1383, _1393);
    float _1411 = fma(_1367, _1383, _1395);
    float _1413 = fma(_1375, _1383, _1397);
    float _1415 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1399);
    float _1417 = _1203 * _1385;
    float _1419 = _1201 * _1387;
    float _1421 = _1215 * _1389;
    float _1423 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1401);
    float _1425 = -_1417;
    float _1427 = fma(_1215, _1387, _1425);
    float _1429 = -_1419;
    float _1431 = fma(_1203, _1389, _1429);
    float _1433 = -_1421;
    float _1435 = fma(_1201, _1385, _1433);
    float _1437 = fma(_1381, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1407);
    float _1439 = _1359 * _1427;
    float _1441 = _1359 * _1431;
    float _1443 = _1359 * _1435;
    float _1445 = _1367 * _1427;
    float _1447 = -_1343;
    float _1449 = fma(_1447, _1389, _1439);
    float _1451 = -_1343;
    float _1453 = fma(_1451, _1385, _1441);
    float _1455 = -_1343;
    float _1457 = fma(_1455, _1387, _1443);
    float _1459 = _1367 * _1435;
    float _1461 = fma(_1355, _1201, _1449);
    float _1463 = fma(_1355, _1215, _1453);
    float _1465 = fma(_1355, _1203, _1457);
    float _1467 = _237 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1469 = _1367 * _1431;
    float _1471 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1473 = fma(_1357, _1389, _1445);
    float _1475 = fma(_1357, _1387, _1459);
    float _1477 = _1467 * _1461;
    float _1479 = _1467 * _1463;
    float _1481 = _1467 * _1465;
    float _1483 = fma(_1357, _1385, _1469);
    float _1485 = fma(_1379, _1471, _1411);
    float _1487 = _1379 * _1427;
    float _1489 = _1379 * _1431;
    float _1491 = _1379 * _1435;
    float _1493 = fma(_1375, _1201, _1473);
    float _1495 = fma(_1375, _1215, _1483);
    float _1497 = fma(_1375, _1203, _1475);
    float _1499 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1501 = fma(_1351, _1389, _1487);
    float _1503 = fma(_1351, _1385, _1489);
    float _1505 = fma(_1351, _1387, _1491);
    float _1507 = fma(_1351, _1471, _1409);
    float _1509 = fma(_1499, _1493, _1477);
    float _1511 = fma(_1499, _1495, _1479);
    float _1513 = fma(_1499, _1497, _1481);
    float _1515 = fma(_1369, _1201, _1501);
    float _1517 = fma(_1369, _1215, _1503);
    float _1519 = fma(_1369, _1203, _1505);
    float _1521 = fma(_1369, _1471, _1413);
    float _1523 = _1515 + _1509;
    float _1525 = _1517 + _1511;
    float _1527 = _1519 + _1513;
    float _1529 = fma(_1405, 2.0, -1.0);
    float _1531 = _1427 * _1485;
    float _1533 = _1431 * _1485;
    float _1535 = _1435 * _1485;
    out.m_90.x = _1523;
    out.m_90.y = _1525;
    out.m_90.z = _1527;
    float _1537 = _1529 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1539 = fma(_1389, _1507, _1531);
    float _1541 = fma(_1385, _1507, _1533);
    float _1543 = fma(_1387, _1507, _1535);
    float _1545 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1415);
    float _1547 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1423);
    float _1549 = fma(_1537, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1437);
    float _1551 = fma(_1201, _1521, _1539);
    float _1553 = fma(_1215, _1521, _1541);
    float _1555 = fma(_1203, _1521, _1543);
    float _1557 = _1545 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1559 = _1547 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1561 = _1549 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1563 = _1551 + _1557;
    float _1565 = _1553 + _1559;
    float _1567 = _1555 + _1561;
    float _1569 = _1389;
    float _1571 = _1533;
    float _1573 = _1555;
    float _1575 = _1405;
    float _1577 = _1389;
    float _1579 = _1555;
    float _1581 = _1551;
    float _1583 = _1405;
    float _1585 = _1361;
    float _1587 = _1353;
    float _1589 = _1201;
    float _1591 = _1529;
    int _1593 = as_type<int>(_1483);
    int _1595 = as_type<int>(_1507);
    float _1597 = _1141;
    float _1607;
    float _1609;
    float _1611;
    float _1613;
    if (!_1309)
    {
        bool _1599 = _1559 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1601 = !_1599;
        _1603 = _1601;
        if (!_1603)
        {
            float _1605 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1607 = _1605;
            _1609 = 0.0;
            _1611 = 0.0;
            _1613 = 0.0;
            _1615 = true;
        }
    }
    if ((!_1615) || _1603)
    {
        bool _1651;
        if (!_1603)
        {
            bool _1617 = _1559 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1619 = isnan(_1559);
            bool _1621 = _1617 || _1619;
            bool _1623 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1625 = _1621 || _1623;
            bool _1627 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1629 = !_1625;
            bool _1631 = _1627 && _1629;
            bool _1633 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1581 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1631)
            {
                _1569 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1635 = _1569;
            float _1637 = _1635;
            if (_1631)
            {
                _1571 = 0.0;
            }
            float _1639 = _1571;
            _1609 = _1639;
            if (_1631)
            {
                _1573 = 0.0;
            }
            float _1641 = _1573;
            _1579 = _1641;
            _1611 = _1641;
            if (_1631)
            {
                float _1643 = _1635 * 5.0;
                _1637 = _1643;
            }
            float _1645 = _1637;
            _1577 = _1645;
            _1607 = _1645;
            if (_1631)
            {
                _1575 = 0.0;
            }
            float _1647 = _1575;
            bool _1649 = !_1625;
            _1651 = _1649 && _1633;
            _1583 = _1647;
            _1613 = _1647;
        }
        if ((!_1651) || _1603)
        {
            _1603 = false;
            float _1653 = _1577;
            float _1655 = _1579;
            float _1657 = _1581;
            float _1659 = _1583;
            bool _1661 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1663 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1665 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1667 = _1653;
            float _1669 = _1657;
            float _1671 = _1659;
            _1609 = _1563;
            if (_1661)
            {
                float _1673 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1667 = _1673;
            }
            float _1675 = _1667;
            if (_1661)
            {
                float _1677 = abs(_1361);
                float _1679 = -_1677;
                float _1681 = _1679 + 1.0;
                _1585 = _1681;
            }
            float _1683 = _1585;
            if (_1663)
            {
                float _1685 = abs(_1353);
                float _1687 = -_1685;
                float _1689 = _1687 + 1.0;
                _1587 = _1689;
            }
            float _1691 = _1587;
            if (!_1661)
            {
                _1589 = 1.0;
            }
            float _1693 = _1589;
            float _1695 = _1693;
            if (_1665)
            {
                float _1697 = abs(_1529);
                float _1699 = -_1697;
                float _1701 = _1699 + 1.0;
                _1591 = _1701;
            }
            float _1703 = _1591;
            if (!_1663)
            {
                _1669 = 1.0;
            }
            float _1705 = _1669;
            float _1707 = _1705;
            if (!_1665)
            {
                _1671 = 1.0;
            }
            float _1709 = _1671;
            float _1711 = _1553;
            float _1713 = _1709;
            if (_1663)
            {
                float _1715 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1711 = _1715;
            }
            float _1717 = _1711;
            float _1719 = _1655;
            if (_1665)
            {
                float _1721 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1719 = _1721;
            }
            float _1723 = _1719;
            if (_1661)
            {
                float _1725 = _1683 * _1675;
                float _1727 = precise::clamp(_1725, 0.0, 1.0);
                _1695 = _1727;
            }
            float _1729 = _1695;
            _1607 = _1567;
            if (_1663)
            {
                float _1731 = _1691 * _1717;
                float _1733 = precise::clamp(_1731, 0.0, 1.0);
                _1707 = _1733;
            }
            float _1735 = _1707;
            float _1737 = _1729 * _1735;
            if (_1665)
            {
                float _1739 = _1703 * _1723;
                float _1741 = precise::clamp(_1739, 0.0, 1.0);
                _1713 = _1741;
            }
            float _1743 = _1713;
            float _1745 = _1737 * _1743;
            _1611 = _1565;
            _1613 = _1745;
        }
    }
    _1615 = false;
    float _1747 = _1607;
    float _1749 = _1609;
    float _1751 = _1611;
    float _1753 = _1613;
    float _1755 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1757 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1759 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1761 = _1559 + _1757;
    float _1763 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1759);
    float _1765 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1767 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1769 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1773 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1765);
    float _1775 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1767);
    float _1777 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1769);
    float _1779 = 1.0 / _1771;
    float _1781 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1773);
    float _1783 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1775);
    float _1785 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1777);
    float _1787 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1789 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1791 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1793 = _1787 + _1771;
    float _1795 = trunc(_1789);
    int _1797 = int(_1795);
    float _1799 = _1793 * _1779;
    float _1801 = _1799 * 0.5;
    float _1803 = trunc(_1791);
    int _1805 = int(_1803);
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1809 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1807);
    float _1811 = 1.0 / _1809;
    int _1813 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1815 = _1797 + _1813;
    int _1817 = _1815 + 1;
    int _1819 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1821 = _1805 + _1819;
    int _1823 = _1821 + 1;
    int _1825 = _1817 | _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1829 = _1811 * _1827;
    bool _1831 = _1829 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1833 = _1829 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1835 = !_1831;
    int _1837 = _1835 ? 0 : 1;
    int _1839 = 2;
    int _1841 = _1817;
    float _1843 = _1789;
    float _1845 = _1751;
    float _1847 = _1749;
    float _1849 = _1747;
    float _1851 = _1753;
    if (!_1831)
    {
        _1839 = 1;
    }
    int _1853 = _1839;
    int _1855 = _1853;
    if (!_1833)
    {
        _1855 = _1837;
    }
    int _1857 = _1855;
    bool _1859 = _1817 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1861 = _1857 << 6;
    bool _1863 = _1825 < 0;
    bool _1865 = _1863 || _1859;
    int _1867 = _1861 + 96;
    uint _1870 = uint(int(uint(_1867) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    bool _1886 = _1823 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1888 = _1886 || _1865;
    int _1890 = _1861 + 104;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
    if (!_1888)
    {
        int _1908 = _1823 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1910 = _1908 + _1817;
        _1841 = _1910;
    }
    int _1912 = _1841;
    int _1914 = _1861 + 48;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c15)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    if (!_1888)
    {
        int _1932 = _1912 << 2;
        _1593 = _1932;
    }
    int _1934 = _1593;
    int _1936 = _1861 + 64;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    uint _1940 = uint(int(uint(int(_1938)) >> uint(2)));
    int _1942 = int(_1938) & 3;
    float _1944 = (*spvDescriptorSet0.vp_c15)._m0[int(_1940)][_1942];
    int _1946 = int(_1938) + 1;
    uint _1948 = uint(int(uint(_1946) >> uint(2)));
    int _1950 = _1946 & 3;
    float _1952 = (*spvDescriptorSet0.vp_c15)._m0[int(_1948)][_1950];
    int _1954 = _1861 + 56;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = _1861 + 72;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[int(_1984)][_1986];
    float _1990 = _1761 * _1884;
    int _1992 = as_type<int>(_1884);
    int _1994 = as_type<int>(_1990);
    if (!_1888)
    {
        uint _1996 = uint(int(uint(_1912) >> uint(2)));
        _1992 = int(_1996);
    }
    int _1998 = _1992;
    float _2000 = fma(_1557, _1876, _1990);
    if (!_1888)
    {
        int _2002 = 12 & _1934;
        _1994 = _2002;
    }
    int _2004 = _1994;
    float _2006 = fma(_1561, _1898, _2000);
    if (!_1888)
    {
        int _2008 = _1998 << 4;
        int _2010 = _2008 + _2004;
        _1595 = _2010;
    }
    int _2012 = _1595;
    float _2014 = _2006 + _1906;
    float _2016 = _1475;
    if (!_1888)
    {
        int _2018 = _2012 + 400;
        uint _2020 = uint(int(uint(_2018) >> uint(2)));
        uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
        int _2024 = int(_2020) & 3;
        float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
        _2016 = _2026;
    }
    float _2028 = _2016;
    float _2030 = _1761 * _1930;
    float _2032 = 1.0 / _2014;
    float _2034 = fma(_1557, _1922, _2030);
    int _2036 = _1861 + 80;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c15)._m0[int(_2040)][_2042];
    int _2046 = int(_2038) + 1;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    int _2050 = _2046 & 3;
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[int(_2048)][_2050];
    float _2054 = _1761 * _1952;
    float _2056 = fma(_1557, _1944, _2054);
    int _2058 = _1861 + 88;
    uint _2060 = uint(int(uint(_2058) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c15)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c15)._m0[int(_2070)][_2072];
    float _2076 = fma(_1561, _1962, _2034);
    float _2078 = _2076 + _1970;
    float _2080 = fma(_1561, _1980, _2056);
    float _2082 = _2078 * _2032;
    float _2084 = _2078;
    if (!_1888)
    {
        float _2086 = floor(_1791);
        _2084 = _2086;
    }
    float _2088 = _2084;
    float _2090 = _2080 + _1988;
    float _2092 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _2094 = _2082 >= 0.0;
    float _2096 = _2090 * _2032;
    bool _2098 = _2082 <= 1.0;
    bool _2100 = _2098 && _2094;
    float _2102 = floor(_2092);
    float _2104 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _2106 = _2096 >= 0.0;
    bool _2108 = _2106 && _2100;
    bool _2110 = _2096 <= 1.0;
    bool _2112 = _2110 && _2108;
    float _2114 = floor(_2104);
    float _2116 = _2088;
    if (!_1888)
    {
        float _2118 = -_2088;
        float _2120 = _1791 + _2118;
        _2116 = _2120;
    }
    float _2122 = _2116;
    float _2124 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1888)
    {
        float _2126 = floor(_1789);
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = _1761 * _2052;
    float _2132 = fma(_1557, 6.2500002968590706586837768554688e-05, 0.5);
    float _2134 = -_2102;
    float _2136 = _2092 + _2134;
    float _2138 = _2136;
    float _2140 = _2028;
    if (_2112)
    {
        float _2142 = float(_1857);
        _1597 = _2142;
    }
    float _2144 = _1597;
    float _2146 = fma(_1557, _2044, _2130);
    float _2148 = fma(_1561, 6.2500002968590706586837768554688e-05, 0.5);
    float _2150 = as_type<float>(_1861);
    float _2152 = _2074;
    if (!_1888)
    {
        float _2154 = rint(_2028);
        float _2156 = precise::max(_2154, 0.0);
        uint _2158 = uint(_2156);
        uint _2160 = clamp(_2158, 0u, 65535u);
        _2150 = as_type<float>(_2160);
    }
    float _2162 = _2150;
    float _2164 = fma(_1561, _2066, _2146);
    float _2166 = -_2114;
    float _2168 = _2104 + _2166;
    float _2170 = _2164 + _2074;
    float _2172 = _2144;
    float _2174 = _2114;
    if (_2112)
    {
        float _2176 = rint(_2144);
        float _2178 = precise::max(_2176, 0.0);
        uint _2180 = uint(_2178);
        uint _2182 = clamp(_2180, 0u, 65535u);
        _2172 = as_type<float>(_2182);
    }
    float _2184 = _2172;
    if (!_1888)
    {
        float _2186 = -_2128;
        float _2188 = _1789 + _2186;
        _1843 = _2188;
    }
    float _2190 = _1843;
    float _2192 = _2170 * _2032;
    float2 _7038 = float2(_2132, _2148);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_7038, float2(0.0), isnan(_7038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_7038, float2(0.0), isnan(_7038)), level(0.0)).x;
    float2 _7048 = float2(_2136, _2168);
    float _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7048, float2(0.0), isnan(_7048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7048, float2(0.0), isnan(_7048)), level(0.0)).x;
    float _2198 = _2162;
    if (!_1888)
    {
        float3 _7063 = float3(_2190, _2122, float(as_type<int>(_2162)));
        float3 _7067 = select(_7063, float3(0.0), isnan(_7063));
        float _2200 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7067.xy, uint(rint(_7067.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7067.xy, uint(rint(_7067.z)), level(0.0)).x;
        _2198 = _2200;
    }
    float _2202 = _2198;
    float _2204 = _2184;
    if (_2112)
    {
        float3 _7082 = float3(_2082, _2096, float(as_type<int>(_2184)));
        float3 _7084 = select(_7082, float3(0.0), isnan(_7082));
        float _2206 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7084.xy, uint(rint(_7084.z)), _2192, level(0.0));
        _2204 = _2206;
    }
    float _2208 = _2204;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2212 = _1747 + _2210;
    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2216 = _1749 + _2214;
    float _2218 = _2212 * _2212;
    float _2220 = fma(_2216, _2216, _2218);
    float _2222 = sqrt(_2220);
    bool _2224 = _2222 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2226 = !_2224;
    if (!_2226)
    {
        float _2228 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2232 = _2222 + _2230;
        float _2234 = _1751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = rsqrt(_2220);
        float _2238 = _2232 * _2228;
        float _2240 = _2238 * 0.15915493667125701904296875;
        float _2242 = _2240 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = _2240 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2244 + (-1.0);
        float _2252 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2254 = fma(_2248, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2256 = fma(_2244, _1751, _2252);
        float _2258 = _2236 * _2254;
        float _2260 = fma(_2216, _2258, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2262 = fma(_2212, _2258, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1845 = _2256;
        _1847 = _2260;
        _1849 = _2262;
    }
    float _2264 = _1845;
    float _2266 = _1847;
    float _2268 = _1849;
    float _2270 = _2194 * 2000.0;
    bool _2272 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2274 = isnan(0.5);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2280 = _2276 || _2278;
    bool _2282 = _1559 >= _2270;
    bool _2284 = isnan(_1559);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(_2270);
    bool _2290 = _2286 || _2288;
    float _2292 = _2270;
    float _2294 = _2266;
    if (_2290)
    {
        _2174 = _2264;
    }
    float _2296 = _2174;
    float _2298 = _2296;
    if (!_2290)
    {
        _2298 = 0.0;
    }
    float _2300 = _2298;
    float _2302 = _2300;
    if (_2290)
    {
        _2138 = _2266;
    }
    float _2304 = _2138;
    float _2306 = _2304;
    if (!_2290)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2308 = _2292;
    float _2310 = -_1559;
    float _2312 = _2310 + _2300;
    if (!_2290)
    {
        _2306 = 0.0;
    }
    float _2314 = _2306;
    float _2316 = _2314;
    if (_2290)
    {
        _2140 = _2268;
    }
    float _2318 = _2140;
    float _2320 = _2318;
    if (!_2290)
    {
        float _2322 = _2308 * 5.0;
        _2320 = _2322;
    }
    float _2324 = _2320;
    float _2326 = _2312 * _2312;
    float _2328 = -_1557;
    float _2330 = _2328 + _2314;
    float _2332 = -_1561;
    float _2334 = _2332 + _2324;
    float _2336 = fma(_2330, _2330, _2326);
    float _2338 = fma(_2334, _2334, _2336);
    float _2340 = sqrt(_2338);
    bool _2342 = _2340 > 0.0;
    bool _2344 = !_2342;
    float _2346 = _2324;
    float _2348 = _2338;
    float _2350 = _2330;
    if (!_2344)
    {
        float _2352 = _227 * _227;
        float _2354 = fma(_223, _223, _2352);
        float _2356 = rsqrt(_2338);
        float _2358 = fma(_229, _229, _2354);
        float _2360 = sqrt(_2358);
        float _2362 = _2330 * _2356;
        float _2364 = _2312 * _2356;
        float _2366 = _2334 * _2356;
        bool _2368 = _2360 > 0.0;
        bool _2370 = !_2368;
        _2294 = _2364;
        if (!_2370)
        {
            float _2372 = rsqrt(_2358);
            float _2374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2376 = _227 * _2372;
            float _2378 = _223 * _2372;
            float _2380 = _229 * _2372;
            float _2382 = _2364 * _2376;
            float _2384 = fma(_2362, _2378, _2382);
            float _2386 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2388 = fma(_2366, _2380, _2384);
            float _2390 = _2388 * _2386;
            float _2392 = fma(_223, _2390, _2314);
            float _2394 = fma(_227, _2390, _2300);
            float _2396 = fma(_229, _2390, _2324);
            _2316 = _2392;
            _2302 = _2394;
            _2346 = _2396;
            _2348 = _2378;
            _2350 = _2384;
        }
    }
    float _2398 = _2316;
    float _2400 = _2302;
    float _2402 = _2346;
    float _2404 = _2294;
    float _2406 = _2348;
    float _2408 = _2350;
    float _2410 = _2400;
    float _2412 = _2398;
    float _2414 = _2402;
    float _2416 = _2406;
    float _2418 = _2408;
    float _2420 = _2404;
    if (!_2280)
    {
        float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2424 = _1559 + _2422;
        float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2428 = _1557 + _2426;
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2432 = -_1557;
        float _2434 = _2432 + _2398;
        float _2436 = _2424 * _2424;
        float _2438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2440 = _1561 + _2438;
        float _2442 = -_1559;
        float _2444 = _2442 + _2400;
        float _2446 = fma(_2428, _2428, _2436);
        float _2448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2450 = fma(_2440, _2440, _2446);
        float _2452 = sqrt(_2450);
        float _2454 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2456 = precise::min(_2452, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2458 = _2456 * _2448;
        float _2460 = _2454 * _2458;
        float _2462 = -_1561;
        float _2464 = _2462 + _2402;
        float _2466 = fma(_2434, _2460, _1557);
        float _2468 = fma(_2444, _2460, _1559);
        float _2470 = fma(_2464, _2460, _1561);
        _2410 = _2468;
        _2412 = _2466;
        _2414 = _2470;
        _2416 = _2464;
        _2418 = _2448;
    }
    float _2472 = _2410;
    float _2474 = _2412;
    float _2476 = _2414;
    float _2478 = _2416;
    float _2480 = _2418;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2484 = _2472 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2488 = _2474 + _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2492 = _2476 + _2490;
    float _2494 = _2484 * _2484;
    float _2496 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2498 = fma(_2488, _2488, _2494);
    float _2500 = fma(_2492, _2492, _2498);
    float _2502 = rsqrt(_2500);
    float _2504 = sqrt(_2500);
    float _2506 = _2502 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2508 = _2488 * _2506;
    float _2510 = _2492 * _2506;
    float _2512 = _2508 * _2508;
    float _2514 = _2510 * _2510;
    float _2516 = _2512 + _2514;
    float _2518 = sqrt(_2516);
    bool _2520 = _2518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2524 = _2518 + _2522;
    float _2526 = _2498;
    float _2528 = _2480;
    float _2530 = _2524;
    float _2532 = _2506;
    float _2534 = _2512;
    if (_2520)
    {
        float _2536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2526 = _2536;
    }
    float _2538 = _2526;
    if (_2520)
    {
        float _2540 = rsqrt(_2516);
        _2528 = _2540;
    }
    float _2542 = _2528;
    float _2544 = _2542;
    if (_2520)
    {
        float _2546 = _2524 * _2538;
        _2530 = _2546;
    }
    float _2548 = _2530;
    float _2550 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2520)
    {
        float _2552 = _2548 * 0.15915493667125701904296875;
        _2420 = _2552;
    }
    float _2554 = _2420;
    float _2556 = _2538;
    if (_2520)
    {
        float _2558 = _2554 * 6.283185482025146484375;
        float _2560 = sin(_2558);
        _2556 = _2560;
    }
    float _2562 = _2556;
    float _2564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2566 = precise::max(0.0, _2564);
    float _2568 = _2478;
    float _2570 = _2566;
    if (_2520)
    {
        float _2572 = _2554 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2568 = _2574;
    }
    float _2576 = _2568;
    float _2578 = -_2506;
    float _2580 = -_2566;
    float _2582 = fma(_2484, _2578, _2580);
    if (_2520)
    {
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2570 = _2584;
    }
    float _2586 = _2570;
    float _2588 = _2586;
    float _2590 = _2562;
    if (_2520)
    {
        float _2592 = fma(_2562, _2586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2588 = _2592;
    }
    float _2594 = _2588;
    float _2596 = _2594;
    float _2598 = _2576;
    if (_2520)
    {
        float _2600 = _2576 + (-1.0);
        _2590 = _2600;
    }
    float _2602 = _2590;
    float _2604 = _2602;
    if (_2520)
    {
        float _2606 = _2542 * _2594;
        _2152 = _2606;
    }
    float _2608 = _2152;
    if (!_2520)
    {
        _2544 = _2508;
    }
    float _2610 = _2544;
    float _2612 = _2610;
    if (_2520)
    {
        float _2614 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2532 = _2614;
    }
    float _2616 = _2532;
    if (_2520)
    {
        float _2618 = _2508 * _2608;
        _2612 = _2618;
    }
    float _2620 = _2612;
    if (!_2520)
    {
        _2596 = _2582;
    }
    float _2622 = _2596;
    float _2624 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2550);
    float _2626 = _2622;
    if (!_2520)
    {
        _2604 = _2510;
    }
    float _2628 = _2604;
    float _2630 = _2628;
    if (_2520)
    {
        float _2632 = fma(_2582, _2576, _2616);
        _2626 = _2632;
    }
    float _2634 = _2626;
    if (_2520)
    {
        float _2636 = _2510 * _2608;
        _2630 = _2636;
    }
    float _2638 = _2630;
    if (_2520)
    {
        float _2640 = _2620 * _2620;
        _2534 = _2640;
    }
    float _2642 = _2534;
    if (!_2520)
    {
        _2598 = _2514;
    }
    float _2644 = _2598;
    float _2646 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = _2644;
    if (_2520)
    {
        float _2650 = _2638 * _2638;
        _2648 = _2650;
    }
    float _2652 = _2648;
    float _2654 = fma(_2634, _2634, _2642);
    float _2656 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2624);
    float _2658 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2660 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2662 = _2654 + _2652;
    float _2664 = _2472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2666 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2658);
    float _2668 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2660);
    float _2670 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2664);
    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2674 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2672);
    float _2676 = precise::clamp(_2674, 0.0, 1.0);
    float _2678 = rsqrt(_2662);
    float _2680 = _2666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2682 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2670);
    float _2684 = -_2676;
    float _2686 = _2684 + 1.0;
    float _2688 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2690 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2692 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2694 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2668);
    float _2696 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = abs(_2686);
    float _2700 = log2(_2698);
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2690);
    float _2704 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2706 = -_2696;
    float _2708 = fma(_2706, _2496, 1.0);
    float _2710 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2702);
    float _2712 = _2678 * _2620;
    float _2714 = _2678 * _2634;
    float _2716 = _2678 * _2638;
    float _2718 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2710);
    float _2720 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2722 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2724 = log2(_2708);
    float _2726 = -_2720;
    float _2728 = fma(_2714, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2726);
    float _2730 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2732 = -_2716;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2728);
    float _2736 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2738 = 1.0 / _2718;
    float _2740 = fma(_2734, -0.5, 0.5);
    float _2742 = fma(_2734, 0.5, 0.5);
    float _2744 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2722);
    float _2746 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2736);
    float _2748 = _2714 + 1.0;
    float _2750 = fma(_2742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2752 = exp2(_2730);
    float _2754 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2744);
    float _2756 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2746);
    float _2758 = fma(_2742, _2750, -0.212114393711090087890625);
    float _2760 = _2724 * 0.693147182464599609375;
    float _2762 = fma(_2742, _2758, 1.570728778839111328125);
    float _2764 = sqrt(_2740);
    float _2766 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2768 = -_2714;
    float _2770 = fma(_2752, _2748, _2768);
    float _2772 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2754);
    float _2774 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2756);
    float _2776 = fma(_2770, 0.5, 0.5);
    float _2778 = _2772 * _2738;
    float _2780 = _2774 * _2738;
    float _2782 = _2764 * 0.636619746685028076171875;
    float _2784 = fma(_2778, 0.5, 0.5);
    float _2786 = fma(_2780, -0.5, 0.5);
    float _2788 = -_2762;
    float _2790 = fma(_2782, _2788, 1.0);
    float3 _8007 = float3(_2784, _2786, _2766);
    float _2792 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8007, float3(0.0), isnan(_8007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8007, float3(0.0), isnan(_8007)), level(0.0)).x;
    float3 _8016 = float3(_2784, _2786, _2766);
    float4 _2795 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8016, float3(0.0), isnan(_8016)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8016, float3(0.0), isnan(_8016)), level(0.0)).xyzw;
    float _2797 = _2795.x;
    float _2799 = _2795.y;
    float _2801 = _2795.z;
    float _2803 = _2795.w;
    float2 _8032 = float2(_2790, _2776);
    float3 _2807 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8032, float2(0.0), isnan(_8032)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8032, float2(0.0), isnan(_8032)), level(0.0)).xyz;
    float _2809 = _2807.x;
    float _2811 = _2807.y;
    float _2813 = _2807.z;
    float _2815 = abs(_1829);
    float _2817 = log2(_2815);
    out.m_92.x = _2488;
    out.m_92.y = _2484;
    out.m_92.z = _2492;
    bool _2819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2821 = isnan(0.5);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2827 = _2823 || _2825;
    float _2829 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2831 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2829);
    float _2833 = _2772 + _2718;
    float _2835 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2837 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2839 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2831);
    float _2841 = _2833 * 0.5;
    float _2843 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2837);
    float _2845 = exp2(_2835);
    float _2847 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2849 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2843);
    float _2851 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2847);
    float _2853 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2849);
    float _2855 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2851);
    float _2857 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2859 = _2853 + _2718;
    out.gl_Position.x = _2772;
    out.gl_Position.y = _2774;
    out.gl_Position.z = _2853;
    out.gl_Position.w = _2718;
    float _2861 = _2855 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2863 = _2859 * 0.5;
    float _2865 = fma(_2845, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2871 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2873 = fma(_2867, -2.0, 3.0);
    float _2875 = _2867 * _2867;
    float _2877 = _1559 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2879 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2881 = _2875 * _2873;
    float _2883 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2877);
    float _2885 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2883);
    float _2887 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2857);
    float _2889 = _2839 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2891 = _2718 * 0.5;
    float _2893 = _2885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2895 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2887);
    float _2897 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2869);
    float _2899 = fma(_2774, -0.5, _2891);
    float _2901 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2903 = _2895 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2905 = -_2881;
    float _2907 = _2905 + 1.0;
    float _2909 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2871);
    float _2911 = _2901 + _2897;
    float _2913 = _2861 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    out.m_94.x = _2841;
    out.m_94.y = _2899;
    out.m_94.z = _2863;
    out.m_94.w = _2718;
    float _2915 = fma(_2907, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2881);
    float _2917 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2911);
    float _2919 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2913);
    float _2921 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2923 = 1.0 / _2917;
    bool _2925 = _1829 <= 8000.0;
    bool _2927 = isnan(_1829);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan(8000.0);
    bool _2933 = _2929 || _2931;
    float _2935 = float(_2933);
    float _2937 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2879);
    float _2939 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2909);
    float _2941 = _2893 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2943 = _2921 + _2919;
    float _2945 = _2935 * _2915;
    float _2947 = _2915;
    float _2949 = _2919;
    float _2951 = _2774;
    float _2953 = _2921;
    float _2955 = _2772;
    float _2957 = _2718;
    if (_2827)
    {
        _2947 = 1.0;
    }
    float _2959 = _2947;
    float _2961 = _2959;
    if (!_2827)
    {
        float _2963 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2965 = _2963 * 0.15915493667125701904296875;
        float _2967 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2969 = _2965 * 6.283185482025146484375;
        float _2971 = cos(_2969);
        float _2973 = _2967 * 0.15915493667125701904296875;
        float _2975 = _2965 * 6.283185482025146484375;
        float _2977 = sin(_2975);
        float _2979 = 1.0 / _2971;
        float _2981 = _2973 * 6.283185482025146484375;
        float _2983 = cos(_2981);
        float _2985 = _2977 * _2979;
        float _2987 = _2973 * 6.283185482025146484375;
        float _2989 = sin(_2987);
        float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2993 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2991;
        float _2995 = _2983 * _2985;
        float _2997 = 1.0 / _2993;
        float _2999 = 1.0 / _2995;
        float _3001 = _2989 * _2999;
        float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3005 = fma(_1829, _3001, _3003);
        float _3007 = _3005 * _2997;
        float _3009 = precise::clamp(_3007, 0.0, 1.0);
        _2949 = _2993;
        _2961 = _3009;
    }
    float _3011 = _2949;
    float _3013 = _2961;
    float _3015 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3017 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2943);
    float _3019 = _2941 + _2937;
    float _3021 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3023 = exp2(_3015);
    float _3025 = -_2196;
    float _3027 = _3025 + 1.0;
    float _3029 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3019);
    float _3031 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2939);
    float _3033 = _3011;
    float _3035 = _3021;
    if (!_2112)
    {
        _3033 = 1.0;
    }
    float _3037 = _3033;
    float _3039 = _3037;
    if (_2112)
    {
        bool _3041 = _2208 >= _2192;
        bool _3043 = isnan(_2208);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan(_2192);
        bool _3049 = _3045 || _3047;
        float _3051 = float(_3049);
        _3039 = _3051;
    }
    float _3053 = _3039;
    float _3055 = _3017 * _2923;
    float _3057 = _3029 * _2923;
    float _3059 = _3027 * _3021;
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = _3031 * _2923;
    if (_1888)
    {
        _3035 = 1.0;
    }
    float _3065 = _3035;
    float _3067 = _3065;
    if (!_1888)
    {
        int _3069 = _1912 << 4;
        int _3071 = _3069 + 2048;
        uint _3073 = uint(int(uint(_3071) >> uint(2)));
        uint _3075 = uint(int(uint(int(_3073)) >> uint(2)));
        int _3077 = int(_3073) & 3;
        float _3079 = (*spvDescriptorSet0.vp_c15)._m0[int(_3075)][_3077];
        int _3081 = int(_3073) + 1;
        uint _3083 = uint(int(uint(_3081) >> uint(2)));
        int _3085 = _3081 & 3;
        float _3087 = (*spvDescriptorSet0.vp_c15)._m0[int(_3083)][_3085];
        int _3089 = _3071 + 8;
        uint _3091 = uint(int(uint(_3089) >> uint(2)));
        uint _3093 = uint(int(uint(int(_3091)) >> uint(2)));
        int _3095 = int(_3091) & 3;
        float _3097 = (*spvDescriptorSet0.vp_c15)._m0[int(_3093)][_3095];
        int _3099 = int(_3091) + 1;
        uint _3101 = uint(int(uint(_3099) >> uint(2)));
        int _3103 = _3099 & 3;
        float _3105 = (*spvDescriptorSet0.vp_c15)._m0[int(_3101)][_3103];
        float _3107 = _1761 * _3087;
        float _3109 = fma(_1557, _3079, _3107);
        float _3111 = fma(_1561, _3097, _3109);
        float _3113 = _3111 + _3105;
        float _3115 = precise::clamp(_3113, 0.0, 1.0);
        float _3117 = -_3115;
        float _3119 = _3117 + _2202;
        float _3121 = fma(_3119, 500.0, 1.5);
        float _3123 = exp2(_3121);
        float _3125 = 0.0 + _3123;
        float _3127 = precise::clamp(_3125, 0.0, 1.0);
        _3067 = _3127;
    }
    float _3129 = _3067;
    float _3131 = _3053 * _3129;
    float _3133 = -_3061;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3137 = -_3023;
    float _3139 = _3137 + 1.0;
    float _3141 = -_227;
    float _3143 = _3141 + _2472;
    bool _3145 = _3063 > 0.0;
    float _3147 = -_3131;
    float _3149 = fma(_3147, _3135, 1.0);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3155 = -_223;
    float _3157 = _3155 + _2474;
    float _3159 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    out.m_96.y = 1.0;
    float _3161 = _3153 * _2792;
    bool _3163 = _3063 < 1.0;
    bool _3165 = _3163 && _3145;
    float _3167 = -_229;
    float _3169 = _3167 + _2476;
    float _3171 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3159);
    float _3173 = -_3153;
    float _3175 = _3173 + 1.0;
    bool _3177 = _2778 > (-1.0);
    bool _3179 = _3177 && _3165;
    float _3181 = _3151 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3183 = _2803 * _3161;
    float _3185 = _2813 * _3161;
    float _3187 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3171);
    float _3189 = _2803 * _3175;
    float _3191 = fma(_2809, _3183, _2797);
    float _3193 = fma(_2811, _3183, _2799);
    float _3195 = fma(_2803, _3185, _2801);
    bool _3197 = _2780 > (-1.0);
    bool _3199 = _3197 && _3179;
    float _3201 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    out.m_96.x = _3181;
    float _3203 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    bool _3205 = _2778 < 1.0;
    bool _3207 = _3205 && _3199;
    out.m_98.x = _3191;
    out.m_98.y = _3193;
    out.m_98.z = _3195;
    out.m_98.w = _3189;
    float _3209 = 1.0 / _3201;
    bool _3211 = _2780 < 1.0;
    bool _3213 = _3211 && _3207;
    float _3215 = _3143 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    if (!_2290)
    {
        _1851 = 0.0;
    }
    float _3217 = _1851;
    float _3219 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3215);
    float _3221 = fma(_3157, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3203);
    float _3223 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3219);
    float _3225 = fma(_3169, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3221);
    float _3227 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3229 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3231 = _3217 * _3013;
    float _3233 = _3227 * _3209;
    float _3235 = _3229 * _3209;
    float _3237 = _3231 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3239 = !_3213;
    float _3241 = _3229;
    float _3243 = _3227;
    float _3245 = _3237;
    if (!_3239)
    {
        float _3247 = -_3057;
        float _3249 = _2780 + _3247;
        float _3251 = -_3055;
        float _3253 = _2778 + _3251;
        float _3255 = -_3233;
        float _3257 = _2778 + _3255;
        float _3259 = -_3235;
        float _3261 = _2780 + _3259;
        float _3263 = _3249 * _3249;
        float _3265 = fma(_3253, _3253, _3263);
        float _3267 = sqrt(_3265);
        bool _3269 = _3267 > 0.0;
        bool _3271 = !_3269;
        _3241 = _3267;
        _3243 = _3253;
        _3273 = _3271;
        if (!_3273)
        {
            float _3275 = _3261 * _3261;
            float _3277 = fma(_3257, _3257, _3275);
            float _3279 = rsqrt(_3265);
            float _3281 = sqrt(_3277);
            float _3283 = _3253 * _3279;
            float _3285 = _3249 * _3279;
            bool _3287 = _3281 > 0.0;
            bool _3289 = !_3287;
            _3241 = _3279;
            _3273 = _3289;
            if (!_3273)
            {
                float _3291 = _631 * _2903;
                float _3293 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _3295 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2901);
                float _3297 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2941);
                float _3299 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2921);
                float _3301 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3295);
                float _3303 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3297);
                float _3305 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3299);
                float _3307 = rsqrt(_3277);
                float _3309 = _3293 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3311 = 1.0 / _3301;
                float _3313 = _3261 * _3309;
                float _3315 = _3257 * _3309;
                float _3317 = _3313 * _3313;
                float _3319 = fma(_3315, _3315, _3317);
                float _3321 = _3261 * _3307;
                float _3323 = _3257 * _3307;
                float _3325 = _3303 * _3311;
                float _3327 = _3305 * _3311;
                float _3329 = sqrt(_3319);
                float _3331 = _3325 * _3325;
                float _3333 = fma(_3327, _3327, _3331);
                float _3335 = _3285 * _3321;
                float _3337 = fma(_3283, _3323, _3335);
                float _3339 = sqrt(_3333);
                float _3341 = precise::min(0.0, _3337);
                float _3343 = _2718 * _3341;
                float _3345 = fma(_3315, _3343, _2772);
                float _3347 = fma(_3313, _3343, _2774);
                float _3349 = fma(_3329, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3339);
                out.gl_Position.x = _3345;
                out.gl_Position.y = _3347;
                float _3351 = 1.0 / _3349;
                float _3353 = _3339 * _3351;
                out.m_96.y = _3353;
                _2951 = _3347;
                _3241 = _3349;
                _3243 = _3351;
                _2953 = _3343;
                _2955 = _3345;
                _3273 = true;
            }
        }
    }
    else
    {
        float _3355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3355;
        _2951 = 0.0;
        _2953 = _3355;
        _3245 = 0.0;
        _2955 = 0.0;
    }
    _3273 = false;
    float _3357 = _2951;
    float _3359 = _3241;
    float _3361 = _3243;
    float _3363 = _2953;
    float _3365 = _3245;
    float _3367 = _2955;
    bool _3369 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3371 = isnan(_2504);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3377 = _3373 || _3375;
    float _3379 = _3361;
    float _3381 = _3359;
    float _3383 = _3363;
    float _3385 = _3357;
    float _3387 = _3367;
    if (!_3377)
    {
        _3379 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3389 = _3379;
    float _3391 = _3389;
    float _3393 = _3389;
    if (!_3377)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3395 = _3381;
    float _3397 = _3395;
    float _3399 = _3395;
    if (!_3377)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3401 = _2957;
    float _3403 = _3401;
    float _3405 = _3401;
    if (!_3377)
    {
        _3383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3407 = _3383;
    float _3409 = _3407;
    float _3411 = _3407;
    if (!_3377)
    {
        _3385 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3413 = _3385;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3377)
    {
        _3387 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3419 = _3387;
    bool _3421 = !_3377;
    float _3423 = _3419;
    float _3425 = _3419;
    if (!_3421)
    {
        bool _3427 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3429 = isnan(_2504);
        bool _3431 = _3427 || _3429;
        bool _3433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3435 = _3431 || _3433;
        if (!_3435)
        {
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3439 = _2504 + _3437;
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3443 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3441;
            float _3445 = 1.0 / _3443;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3467 = _3439 * _3445;
            float _3469 = precise::clamp(_3467, 0.0, 1.0);
            float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3475 = fma(_3469, _3449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3477 = fma(_3469, _3473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3479 = fma(_3469, _3453, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3481 = fma(_3469, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3483 = fma(_3469, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3485 = fma(_3469, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3399 = _3477;
            _3417 = _3483;
            _3393 = _3475;
            _3411 = _3481;
            _3405 = _3479;
            _3425 = _3485;
            _3487 = true;
        }
        else
        {
            bool _3489 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3491 = isnan(_2504);
            bool _3493 = _3489 || _3491;
            bool _3495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3497 = _3493 || _3495;
            if (!_3497)
            {
                _3391 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3499 = _3391;
            _3393 = _3499;
            if (!_3497)
            {
                _3397 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3501 = _3397;
            _3399 = _3501;
            if (!_3497)
            {
                _3403 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3503 = _3403;
            _3405 = _3503;
            if (!_3497)
            {
                _3409 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3505 = _3409;
            _3411 = _3505;
            if (!_3497)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3507 = _3415;
            _3417 = _3507;
            if (!_3497)
            {
                _3423 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3509 = _3423;
            bool _3511 = !_3497;
            _3425 = _3509;
            if (!_3511)
            {
                bool _3513 = _2504 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3515 = isnan(_2504);
                bool _3517 = _3513 || _3515;
                bool _3519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3521 = _3517 || _3519;
                if (!_3521)
                {
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3525 = _2504 + _3523;
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3529 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3527;
                    float _3531 = 1.0 / _3529;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3553 = _3525 * _3531;
                    float _3555 = precise::clamp(_3553, 0.0, 1.0);
                    float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3561 = fma(_3555, _3535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3563 = fma(_3555, _3559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3565 = fma(_3555, _3539, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3567 = fma(_3555, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3569 = fma(_3555, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3571 = fma(_3555, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3399 = _3563;
                    _3417 = _3569;
                    _3393 = _3561;
                    _3411 = _3567;
                    _3405 = _3565;
                    _3425 = _3571;
                    _3487 = true;
                }
                else
                {
                    _3399 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3393 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3411 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3405 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3425 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3487 = false;
    float _3573 = _3399;
    float _3575 = _3417;
    float _3577 = _3393;
    float _3579 = _3411;
    float _3581 = _3405;
    float _3583 = _3425;
    float _3585 = fma(_1525, -0.5, 0.5);
    float _3587 = precise::clamp(_3585, 0.0, 1.0);
    float _3589 = -_3573;
    float _3591 = _3589 + _3575;
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    out.m_100.x = 0.0;
    float _3597 = fma(_3587, _3591, _3573);
    float _3599 = _3365 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3601 = fma(_3587, _3595, _3577);
    float _3603 = -_3581;
    float _3605 = _3603 + _3583;
    float _3607 = _3597 * 0.586610972881317138671875;
    bool _3609 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_63.x = _3599;
    float _3611 = fma(_3587, _3605, _3581);
    float _3613 = fma(_3601, 0.298911988735198974609375, _3607);
    bool _3615 = _3013 > 0.0;
    bool _3617 = isnan(_3013);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan(0.0);
    bool _3623 = _3619 || _3621;
    float _3625 = fma(_3611, 0.114477999508380889892578125, _3613);
    float _3627 = -_3625;
    float _3629 = _3601 + _3627;
    float _3631 = -_3625;
    float _3633 = _3597 + _3631;
    float _3635 = -_3625;
    float _3637 = _3611 + _3635;
    float _3639 = fma(_3629, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    float _3641 = fma(_3633, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    float _3643 = fma(_3637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3625);
    bool _3645 = !_3609;
    if (!_3645)
    {
        float _3647 = -_2472;
        float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3651 = -_2474;
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3655 = -_2476;
        float _3657 = _3655 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3659 = _3649 * _3649;
        float _3661 = fma(_3653, _3653, _3659);
        float _3663 = fma(_3657, _3657, _3661);
        float _3665 = sqrt(_3663);
        float _3667 = rsqrt(_3663);
        float _3669 = -_3665;
        float _3671 = _3669 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3673 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3675 = precise::clamp(_3673, 0.0, 1.0);
        float _3677 = _3653 * _3667;
        float _3679 = _3649 * _3667;
        float _3681 = abs(_3675);
        float _3683 = log2(_3681);
        float _3685 = _3657 * _3667;
        float _3687 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3689 = _1525 * _3679;
        float _3691 = -_3679;
        float _3693 = -_3687;
        float _3695 = fma(_3691, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3693);
        float _3697 = fma(_1523, _3677, _3689);
        float _3699 = -_3685;
        float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3695);
        float _3703 = fma(_1527, _3685, _3697);
        float _3705 = precise::clamp(_3703, 0.0, 1.0);
        float _3707 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3709 = _3701 + _3707;
        float _3711 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3713 = _3709 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = exp2(_3711);
        float _3719 = _3717 * _3715;
        float _3721 = _3705 * _3719;
        float _3723 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3725 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3727 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3723;
        out.m_100.y = _3725;
        out.m_100.z = _3727;
    }
    out.m_102.x = _3639;
    out.m_102.y = _3641;
    out.m_102.z = _3643;
    if (_3623)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3729 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_63.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3729;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

