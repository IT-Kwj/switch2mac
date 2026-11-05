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
    float4 m_88 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_96 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_86 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_76 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3841 = false;
    bool _959 = false;
    bool _767 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4146 = as_type<float>(_133);
        out.gl_Position.z = _4146;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_61.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4216 = as_type<float>(_171);
        out.gl_Position.z = _4216;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = in.m_63.x;
    float _177 = _151 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = in.m_68.x;
    float _185 = in.m_68.y;
    float _187 = in.m_68.z;
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    float _195 = _177 * _173;
    float _197 = _151 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _199 = in.m_72.x;
    float _201 = in.m_72.y;
    float _203 = in.m_72.z;
    float _205 = in.m_74.x;
    float _207 = in.m_74.y;
    float _209 = in.m_74.z;
    float _211 = _197 * _181;
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _195);
    float _215 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _211);
    float _217 = _213 * 6.283185482025146484375;
    int _219 = as_type<int>(_179) & 1;
    bool _221 = _219 != 0;
    int _223 = as_type<int>(_179) & 2;
    bool _225 = _223 != 0;
    float _227 = floor(_213);
    int _229 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _231 = _229 != 0;
    float _233 = _217 * 0.15915493667125701904296875;
    float _235 = _215 * 6.283185482025146484375;
    float _237 = _185 * _191;
    float _239 = floor(_215);
    float _241 = fma(_183, _189, _237);
    float _243 = _185 * _201;
    float _245 = fma(_187, _193, _241);
    float _247 = _185 * _207;
    float _249 = fma(_183, _199, _243);
    float _251 = _233 * 6.283185482025146484375;
    float _253 = cos(_251);
    float _255 = -_227;
    float _257 = _213 + _255;
    float _259 = fma(_183, _205, _247);
    float _261 = -_239;
    float _263 = _215 + _261;
    float _265 = _235 * 0.15915493667125701904296875;
    bool _267 = !_225;
    float _269 = _267 ? (-0.5) : 0.5;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = -_263;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _283 = _257 < 0.5;
    float _285 = float(_283);
    float _287 = _265 * 6.283185482025146484375;
    float _289 = cos(_287);
    bool _291 = !_231;
    int _293 = _291 ? 0 : 1;
    float _295 = fma(_253, 0.5, 0.5);
    bool _297 = !_273;
    int _299 = _297 ? 0 : 1;
    float _301 = -_257;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_293);
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _311 = abs(_299);
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = float(_311);
    bool _321 = !_277;
    int _323 = _321 ? 0 : 1;
    bool _325 = _263 < 0.5;
    float _327 = float(_325);
    float _329 = fma(_289, 0.5, 0.5);
    float _331 = float(_305);
    float _333 = abs(_303);
    float _335 = _319 * _333;
    float _337 = abs(_281);
    float _339 = _319 * _337;
    float _341 = -_329;
    float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _345 = abs(_323);
    float _347 = fma(_331, _315, _335);
    float _349 = -_327;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = fma(_331, _343, _339);
    float _355 = float(_345);
    float _357 = fma(_187, _203, _249);
    float _359 = fma(_187, _209, _259);
    bool _361 = !_221;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = abs(_309);
    float _367 = fma(_355, _365, _347);
    float _369 = abs(_351);
    float _371 = fma(_355, _369, _353);
    bool _373 = !_317;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_117);
        float _395 = 1.0 / _393;
        float _397 = _151 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = 1.0 / _411;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _435 = 1.0 / _415;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _399 + _437;
    bool _441 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_399);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _455 = -_451;
    float _457 = _455 + 1.0;
    float _459 = 1.0 / _419;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _461;
    float _465 = _439 * _425;
    bool _467 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _469 = isnan(_399);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _481 = _399 + _479;
    float _483 = 1.0 / _429;
    float _485 = _403 * _435;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _489 = _399 + _487;
    float _491 = -_477;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _423;
    float _497 = _407 * _459;
    bool _499 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _501 = isnan(_399);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    bool _511 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _513 = isnan(_399);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = 1.0 / _433;
    float _525 = _489 * _483;
    float _527 = -_509;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _463;
    float _533 = _481 * _495;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _537 = _399 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _541 = _399 + _539;
    float _543 = _537 * _523;
    float _545 = _509 * _493;
    bool _547 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _549 = isnan(_399);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _521 * _529;
    float _561 = -_521;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _569;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = _541 * _531;
    bool _579 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_399);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _557 * _563;
    float _593 = _451 * _575;
    float _595 = fma(_567, _465, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = fma(_571, _465, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _599 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_399);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_589;
    float _613 = _611 + 1.0;
    bool _615 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _617 = isnan(_399);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _589 * _457;
    float _629 = -_609;
    float _631 = _629 + 1.0;
    float _633 = _609 * _613;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _643;
    float _647 = _625 * _631;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _649;
    float _653 = fma(_637, _485, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = fma(_641, _485, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _657 = fma(_645, _497, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _659 = _595 * _647;
    float _661 = -_625;
    float _663 = _661 + 1.0;
    float _665 = _597 * _647;
    float _667 = fma(_651, _497, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _659);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _681 = fma(_671, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _683 = fma(_675, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _689;
    float _693 = fma(_653, _633, _677);
    float _695 = fma(_655, _633, _679);
    float _697 = fma(_687, _525, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _699 = fma(_691, _525, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _701 = fma(_657, _627, _693);
    float _703 = fma(_667, _627, _695);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _713 = fma(_681, _593, _701);
    float _715 = fma(_707, _543, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _717 = fma(_711, _543, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _719 = fma(_683, _593, _703);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _721;
    float _725 = fma(_697, _591, _713);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _727;
    float _731 = fma(_699, _591, _719);
    float _733 = fma(_723, _577, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _735 = fma(_715, _559, _725);
    float _737 = fma(_729, _577, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _739 = fma(_717, _559, _731);
    float _741 = fma(_733, _545, _735);
    float _743 = fma(_737, _545, _739);
    float _745 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[150].x, _741);
    float _747 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[150].y, _743);
    bool _749 = !_453;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _753 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_117);
        float _771 = 1.0 / _769;
        float _773 = _151 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _795 = _775 + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _805 = 1.0 / _799;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _809 = 1.0 / _803;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _811;
    float _815 = _779 * _805;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    bool _833 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _835 = isnan(_775);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = fma(_813, _815, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _847 = _843 * _831;
    float _849 = -_843;
    float _851 = _849 + 1.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _857;
    float _861 = _795 * _809;
    float _863 = _827 * _851;
    float _865 = fma(_855, _815, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _867 = fma(_859, _815, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _869 = -_827;
    float _871 = _869 + 1.0;
    float _873 = _845 * _863;
    float _875 = _865 * _863;
    float _877 = _867 * _863;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _891 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].x, _875);
    float _893 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].y, _873);
    float _895 = fma(_881, _861, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_885, _861, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_889, _861, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].z, _877);
    float _903 = fma(_895, _847, _891);
    float _905 = fma(_897, _847, _893);
    float _907 = fma(_899, _847, _901);
    float _909 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].x, _903);
    float _911 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].y, _905);
    float _913 = in.m_76.x;
    float _915 = in.m_76.y;
    float _917 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].z, _907);
    float _919 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _921 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _927;
    out.m_78.y = _929;
    out.m_78.z = _931;
    out.m_78.w = _925;
    float _933 = _747 * _915;
    float _935 = _745 * _913;
    bool _937 = !_807;
    float _955;
    float _957;
    if (!_937)
    {
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _941 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _943 = float(_117);
        float _945 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _947 = _945 * _939;
        float _949 = floor(_947);
        float _951 = -_949;
        float _953 = _947 + _951;
        _955 = _943;
        _957 = _953;
        _959 = true;
    }
    else
    {
        float _961 = float(_117);
        float _963 = 1.0 / _961;
        float _965 = _151 * _963;
        _955 = _961;
        _957 = _965;
    }
    _959 = false;
    float _967 = _955;
    float _969 = _957;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _973 = int(_971);
    float _975 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _977 = int(_975);
    float _979 = float(_973);
    float _981 = 1.0 / _967;
    float _983 = float(uint(_977));
    float _985 = 1.0 / _979;
    int _987 = ~_977;
    int _989 = _987 + 1;
    int _991 = ~_977;
    int _993 = _991 + 1;
    float _995 = 1.0 / _983;
    float _997 = _985 * _151;
    float _999 = trunc(_997);
    int _1001 = int(_999);
    int _1003 = as_type<int>(_995) + (-2);
    float _1005 = float(uint(_1001));
    float _1007 = as_type<float>(_1003) * _1005;
    float _1009 = trunc(_1007);
    float _1011 = precise::max(_1009, 0.0);
    uint _1014 = uint(_1011);
    float _1016 = float(_977);
    int _1018 = _989 * int(_1014);
    int _1020 = _1018 + _1001;
    float _1022 = float(uint(_1020));
    float _1024 = as_type<float>(_1003) * _1022;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1028 = _1026 != 0;
    bool _1030 = !_1028;
    float _1032 = _1030 ? 7.345489978790283203125 : 1.0;
    float _1034 = trunc(_1024);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = _1032 * _175;
    float _1042 = floor(_1040);
    int _1044 = int(_1014) + int(_1038);
    float _1046 = float(_1001);
    int _1048 = _993 * _1044;
    int _1050 = _1048 + _1001;
    bool _1052 = _1046 >= _1016;
    bool _1054 = isnan(_1046);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(_1016);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = -_1042;
    float _1066 = _1040 + _1064;
    bool _1068 = uint(_1050) >= uint(_977);
    float _1070 = trunc(_1062);
    int _1072 = int(_1070);
    float _1074 = _1066 * _1016;
    bool _1076 = !_1068;
    int _1078 = _1076 ? 0 : (-1);
    float _1080 = _1016 * _151;
    bool _1082 = _977 == 0;
    int _1084 = ~_1044;
    int _1086 = _1084 + _1078;
    int _1088 = _1086 + 1;
    float _1090 = _1080 * _981;
    int _1092 = _977 + (-1);
    float _1094 = trunc(_1074);
    int _1096 = int(_1094);
    int _1098 = _977 * _1088;
    int _1100 = _1098 + _1001;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1116 = _1114 != 0;
    int _1118 = ~_1072;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = trunc(_1090);
    int _1126 = int(_1124);
    bool _1128 = !_1082;
    int _1130 = _1128 ? _1100 : (-1);
    bool _1132 = !_1104;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1138 = _1136 != 0;
    int _1140 = _1130 * _1122;
    int _1142 = abs(_1134);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1146 = _1144 != 0;
    int _1148 = _1072 * _1092;
    int _1150 = _1148 + _1140;
    bool _1152 = !_1108;
    int _1154 = _1152 ? 0 : 1;
    bool _1156 = !_1116;
    int _1158 = _1156 ? 0 : 1;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    int _1164 = abs(_1154);
    bool _1166 = !_1112;
    int _1168 = _1166 ? 0 : 1;
    bool _1170 = !_1162;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1158);
    int _1176 = abs(_1168);
    int _1178 = _1150 * _1164;
    int _1180 = abs(_1172);
    int _1182 = _1096 * _1174;
    int _1184 = _1182 + _1001;
    int _1186 = _1126 * _1142;
    int _1188 = _1186 + _1178;
    int _1190 = ~_977;
    int _1192 = _1190 + 1;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1196 = _1194 != 0;
    int _1198 = _1184 * _1176;
    int _1200 = _1198 + _1188;
    int _1202 = _1096 * _1180;
    int _1204 = _1202 + _1200;
    float _1206 = float(uint(_1204));
    float _1208 = as_type<float>(_1003) * _1206;
    float _1210 = in.m_56.x;
    float _1212 = in.m_56.y;
    float _1214 = in.m_56.z;
    float _1216 = trunc(_1208);
    float _1218 = precise::max(_1216, 0.0);
    uint _1220 = uint(_1218);
    int _1222 = ~_977;
    int _1224 = _1222 + 1;
    int _1226 = _1192 * int(_1220);
    int _1228 = _1226 + _1204;
    float _1230 = float(uint(_1228));
    float _1232 = _201 * _1212;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1234;
    float _1238 = _207 * _1212;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1244 = as_type<float>(_1003) * _1230;
    float _1246 = _191 * _1212;
    float _1248 = in.m_63.y;
    float _1250 = 1.0 / _1236;
    float _1252 = fma(_205, _1210, _1238);
    float _1254 = fma(_189, _1210, _1246);
    float _1256 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1260 = _969 + _1258;
    float _1262 = trunc(_1244);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1270 = _1260 * _1250;
    float _1272 = fma(_199, _1210, _1232);
    float _1274 = fma(_193, _1214, _1254);
    float _1276 = fma(_203, _1214, _1272);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1280 = int(_1220) + int(_1266);
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1284 = 1.0 / _1242;
    float _1286 = -_1278;
    float _1288 = fma(_1256, 2.0, _1286);
    float _1290 = in.m_70.w;
    int _1292 = _1224 * _1280;
    int _1294 = _1292 + _1204;
    float _1296 = fma(_1282, -2.0, _1268);
    float _1298 = float(uint(_1184));
    float _1300 = -_151;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1288);
    bool _1304 = uint(_1294) >= uint(_977);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1308 = _969 + _1306;
    float _1310 = fma(_209, _1214, _1252);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1312;
    bool _1316 = !_1304;
    int _1318 = _1316 ? 0 : (-1);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1324 = _175 > 0.5;
    float _1326 = _1308 * _1284;
    int _1328 = ~_1280;
    int _1330 = _1328 + _1318;
    int _1332 = _1330 + 1;
    float _1334 = in.m_72.w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1340;
    float _1344 = fma(_1314, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1346 = -_363;
    int _1348 = _1324 ? as_type<int>(_1346) : as_type<int>(_363);
    float _1350 = fma(_1338, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1352 = fma(_1342, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1354 = _977 * _1332;
    int _1356 = _1354 + _1204;
    float _1358 = as_type<float>(_1003) * _1298;
    bool _1360 = !_1146;
    float _1362 = _1360 ? _363 : as_type<float>(_1348);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1372 = !_1082;
    int _1374 = _1372 ? _1356 : (-1);
    float _1376 = _1274 + _1290;
    float _1378 = trunc(_1358);
    float _1380 = precise::max(_1378, 0.0);
    uint _1382 = uint(_1380);
    float _1384 = _1362 + 0.5;
    float _1386 = fma(_1322, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1388 = fma(_1366, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1390 = fma(_1370, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1392 = ~_977;
    int _1394 = _1392 + 1;
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1302);
    bool _1398 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1400 = isnan(_969);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = in.m_74.w;
    bool _1412 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1414 = isnan(_969);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = _1276 + _1334;
    int _1426 = _1374 >> 31;
    bool _1428 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1430 = isnan(_969);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    int _1440 = _1426 & 3;
    int _1442 = _1394 * int(_1382);
    int _1444 = _1442 + _1184;
    float _1446 = -_1408;
    float _1448 = _1446 + 1.0;
    bool _1450 = _1248 > 0.5;
    int _1452 = _1374 + _1440;
    float _1454 = float(uint(_1444));
    float _1456 = _1422 * _1448;
    int _1458 = _1452 >> 2;
    float _1460 = -_1422;
    float _1462 = _1460 + 1.0;
    float _1464 = -_269;
    int _1466 = _1450 ? as_type<int>(_1464) : as_type<int>(_269);
    float _1468 = as_type<float>(_1003) * _1454;
    int _1470 = _1458 << 4;
    int _1472 = _1470 + 368;
    float _1474 = _1438 * _1462;
    bool _1476 = !_1196;
    float _1478 = _1476 ? _269 : as_type<float>(_1466);
    float _1480 = trunc(_1468);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    uint _1486 = uint(int(uint(_1472) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[int(_1496)][_1498];
    float _1502 = _1310 + _1410;
    float _1504 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1296);
    float _1506 = -_1438;
    float _1508 = _1506 + 1.0;
    float _1510 = _1350 * _1474;
    float _1512 = _1478 + (-0.5);
    float _1514 = _1344 * _1474;
    float _1516 = _1352 * _1474;
    float _1518 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1510);
    float _1520 = -_1512;
    float _1522 = -_1504;
    float _1524 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1522);
    int _1526 = _1374 & 3;
    bool _1528 = _1526 != 0;
    float _1530 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1514);
    float _1532 = fma(_1388, _1456, _1518);
    float _1534 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1516);
    bool _1536 = uint(_1526) > 1u;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1540 = _1424 + _1538;
    int _1542 = int(_1382) + int(_1484);
    float _1544 = fma(_1386, _1456, _1530);
    int _1546 = _1472 + 8;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = _1374 & 3;
    bool _1566 = _1564 != 0;
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1570 = _1376 + _1568;
    float _1572 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1574 = fma(_1390, _1456, _1534);
    int _1576 = _1566 ? 0 : 1;
    float _1578 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1544);
    float _1580 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1572);
    int _1582 = ~_977;
    int _1584 = _1582 + 1;
    float _1586 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1532);
    int _1588 = ~_1576;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    float _1594 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1574);
    int _1596 = _1592;
    float _1598 = _1478;
    if (!_1536)
    {
        int _1600 = ~_1576;
        int _1602 = _1600 + 1;
        _1596 = _1602;
    }
    int _1604 = _1596;
    int _1606 = _1584 * _1542;
    int _1608 = _1606 + _1184;
    bool _1610 = _1526 != 3;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1614 = _1502 + _1612;
    bool _1616 = !_1528;
    int _1618 = _1616 ? 0 : 1;
    int _1620 = abs(_1604);
    float _1622 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1580);
    bool _1624 = uint(_1526) >= 2u;
    int _1626 = abs(_1618);
    int _1628 = ~_1620;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    bool _1634 = uint(_1608) >= uint(_977);
    int _1636 = _1624 ? 0 : 1;
    int _1638 = ~_1626;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    int _1644 = _1632 * as_type<int>(_1500);
    bool _1646 = !_1634;
    int _1648 = _1646 ? 0 : (-1);
    int _1650 = ~_1636;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1642 * as_type<int>(_1492);
    int _1658 = _1656 + _1644;
    bool _1660 = _1526 != 3;
    int _1662 = _1654;
    if (_1610)
    {
        int _1664 = ~_1636;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    bool _1670 = !_1660;
    int _1672 = _1670 ? 0 : (-1);
    int _1674 = abs(_1668);
    bool _1676 = !_1138;
    int _1678 = _1676 ? 0 : 1;
    int _1680 = abs(_1672);
    int _1682 = ~_1542;
    int _1684 = _1682 + _1648;
    int _1686 = _1684 + 1;
    int _1688 = abs(_1678);
    int _1690 = _977 * _1686;
    int _1692 = _1690 + _1184;
    int _1694 = ~_1674;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    int _1700 = ~_1680;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    int _1706 = _1698 * as_type<int>(_1554);
    int _1708 = _1706 + _1658;
    bool _1710 = _1622 >= 0.0;
    int _1712 = _1704 * as_type<int>(_1562);
    int _1714 = _1712 + _1708;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1718 = _1540 * _1540;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1722 = !_1082;
    int _1724 = _1722 ? _1692 : (-1);
    float _1726 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1716);
    float _1728 = fma(_1570, _1570, _1718);
    float _1730 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1720);
    int _1732 = ~_1688;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1726);
    float _1740 = fma(_1614, _1614, _1728);
    float _1742 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1730);
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1746 = _1744 != 0;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1750 = _1748 != 0;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1754 = _1752 != 0;
    float _1756 = -_1738;
    float _1758 = _1756 + 1.0;
    int _1760 = _1714 * _1736;
    float _1762 = -_1742;
    float _1764 = _1762 + 1.0;
    float _1766 = rsqrt(_1740);
    float _1768 = fma(_1478, _1758, _1524);
    int _1770 = _1724 * _1688;
    int _1772 = _1770 + _1760;
    float _1774 = -_1764;
    float _1776 = fma(_1362, _1774, _1396);
    if (_1710)
    {
        _1598 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1778 = _1598;
    float _1780 = _1578 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1784 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1792 = as_type<int>(_1778);
    float _1794 = _1790;
    if (_1710)
    {
        float _1796 = _1778 * 5.0;
        _1792 = as_type<int>(_1796);
    }
    int _1798 = _1792;
    float _1800 = float(_1772);
    out.m_80.x = _1776;
    out.m_80.y = _1768;
    bool _1802 = !_1750;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = _1540 * _1766;
    bool _1808 = !_1754;
    int _1810 = _1808 ? 0 : 1;
    out.m_82.x = _1786;
    out.m_82.y = _1788;
    out.m_82.z = _1790;
    bool _1812 = !_1746;
    int _1814 = _1812 ? 0 : 1;
    float _1816 = _1570 * _1766;
    float _1818 = _1806;
    if (_1710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6727 = as_type<float>(_1798);
        out.gl_Position.z = _6727;
    }
    out.m_84.x = _1800;
    if (_1710)
    {
        out.m_59.x = 0.0;
    }
    if (_1710)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1820 = -_1806;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1824 = _1614 * _1766;
    float _1826 = -_1816;
    float _1828 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1832 = _1822 + _1830;
    float _1834 = -_1824;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1502);
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = _1828 + _1838;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1836 + _1844;
    float _1848 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1842);
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1848);
    bool _1852 = _1850 >= 0.0;
    float _1854 = _1840;
    float _1856 = _1822;
    float _1858 = _1846;
    if (_1852)
    {
        _1794 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1860 = _1794;
    int _1862 = as_type<int>(_1860);
    if (_1852)
    {
        out.m_59.x = 0.0;
    }
    if (_1852)
    {
        float _1864 = _1860 * 5.0;
        _1862 = as_type<int>(_1864);
    }
    int _1866 = _1862;
    if (_1852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6826 = as_type<float>(_1866);
        out.gl_Position.z = _6826;
    }
    if (_1852)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1870 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1872 = floor(_1868);
    float _1874 = floor(_1870);
    float _1876 = -_1872;
    float _1878 = _1868 + _1876;
    float _1880 = -_1874;
    float _1882 = _1870 + _1880;
    float2 _6862 = float2(_1878, _1882);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6862, float2(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6862, float2(0.0), isnan(_6862)), level(0.0)).x;
    float _1886 = in.m_63.z;
    float _1888 = _175 * 2.0;
    float _1890 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1892 = log2(_1890);
    float _1894 = _175 + _1248;
    float _1896 = _1248 * 2.0;
    float _1898 = _1894 + (-1.0);
    int _1900 = abs(_1804);
    float _1902 = -_1806;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1906 = floor(_1888);
    int _1908 = abs(_1814);
    float _1910 = -_1816;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1570);
    float _1914 = float(_1900);
    float _1916 = _1904 * _1904;
    float _1918 = float(_1908);
    float _1920 = -_1824;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1924 = _371 * _933;
    float _1926 = _367 * _935;
    float _1928 = _1886 * 2.0;
    float _1930 = _1248 + _1886;
    bool _1932 = _1906 > 0.0;
    float _1934 = _1892 * _151;
    float _1936 = floor(_1928);
    float _1938 = _1930 + (-1.0);
    bool _1940 = _1906 >= 0.0;
    bool _1942 = isnan(_1906);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = _1248 + (-0.5);
    float _1952 = fma(_1912, _1912, _1916);
    float _1954 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1956 = exp2(_1934);
    float _1958 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1960 = _1948 ? 0 : 1;
    float _1962 = in.m_86.x;
    float _1964 = in.m_86.y;
    float _1966 = in.m_86.z;
    float _1968 = fma(_1922, _1922, _1952);
    int _1970 = ~_1960;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    float _1976 = floor(_1896);
    bool _1978 = _1936 > 0.0;
    bool _1980 = _1936 >= 0.0;
    bool _1982 = isnan(_1936);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan(0.0);
    bool _1988 = _1984 || _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1992 = 1.0 + _1990;
    int _1994 = _1974;
    int _1996 = 2;
    if (!_1932)
    {
        int _1998 = ~_1960;
        int _2000 = _1998 + 1;
        _1994 = _2000;
    }
    int _2002 = _1994;
    bool _2004 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2006 = isnan(0.0);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2012 = _2008 || _2010;
    float _2014 = 1.0 / _1992;
    float _2016 = float(_2002);
    float _2018 = -_1956;
    float _2020 = _2018 + 1.0;
    int _2022 = _1988 ? 0 : 1;
    bool _2024 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2026 = isnan(1.0);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2032 = _2028 || _2030;
    float _2034 = _1914 * _2016;
    int _2036 = ~_2022;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2040;
    if (!_1978)
    {
        int _2044 = ~_2022;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = _2034 * (-2.0);
    bool _2052 = _1976 > 0.0;
    float _2054 = _2012 ? _2020 : 0.0;
    float _2056 = fma(_2050, _1964, _1964);
    bool _2058 = _1976 >= 0.0;
    bool _2060 = isnan(_1976);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan(0.0);
    bool _2066 = _2062 || _2064;
    float _2068 = fma(_1954, _2050, _1954);
    float _2070 = float(_2048);
    if (_2032)
    {
        float _2072 = _2054 * _2014;
        _153 = _2072;
    }
    float _2074 = _153;
    int _2076 = _2066 ? 0 : 1;
    float _2078 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2056);
    int _2080 = abs(_1810);
    float _2082 = _1918 * _2070;
    int _2084 = ~_2076;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_2068, _2074, _2078);
    int _2092 = _2088;
    if (!_2052)
    {
        int _2094 = ~_2076;
        int _2096 = _2094 + 1;
        _2092 = _2096;
    }
    int _2098 = _2092;
    float _2100 = _2082 * (-2.0);
    float _2102 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2104 = _2090 * 0.15915493667125701904296875;
    float _2106 = float(_2080);
    float _2108 = fma(_1958, _2100, _1958);
    float _2110 = float(_2098);
    float _2112 = fma(_2100, _1962, _1962);
    float _2114 = _175 + (-0.5);
    float _2116 = _175 + _1886;
    float _2118 = _1886 + (-0.5);
    float _2120 = _2106 * _2110;
    float _2122 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2112);
    float _2124 = _2116 + (-1.0);
    float _2126 = _2120 * (-2.0);
    float _2128 = fma(_2108, _2074, _2122);
    float _2130 = _2104 * 6.283185482025146484375;
    float _2132 = sin(_2130);
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = fma(_2126, _1966, _1966);
    float _2138 = _2128 * 0.15915493667125701904296875;
    float _2140 = _1822 + _2102;
    float _2142 = fma(_2134, _2126, _2134);
    float _2144 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2136);
    float _2146 = _2104 * 6.283185482025146484375;
    float _2148 = cos(_2146);
    float _2150 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2152 = fma(_2142, _2074, _2144);
    float _2154 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2150);
    float _2156 = _2152 * 0.15915493667125701904296875;
    float _2158 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2160 = _2138 * 6.283185482025146484375;
    float _2162 = sin(_2160);
    float _2164 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2154);
    float _2166 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2158);
    float _2168 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2170 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2166);
    float _2172 = _2138 * 6.283185482025146484375;
    float _2174 = cos(_2172);
    float _2176 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2178 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2180 = _2156 * 6.283185482025146484375;
    float _2182 = sin(_2180);
    float _2184 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2178);
    float _2186 = _2162 * _2148;
    float _2188 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2184);
    float _2190 = 1.0 / _2176;
    float _2192 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2194 = _2162 * _2132;
    float _2196 = _2174 * _2148;
    float _2198 = _2192 + _2176;
    float _2200 = _2156 * 6.283185482025146484375;
    float _2202 = cos(_2200);
    float _2204 = fma(_2182, _2196, _2194);
    float _2206 = fma(_2182, _2194, _2196);
    float _2208 = _2174 * _2132;
    float _2210 = -_2208;
    float _2212 = fma(_2182, _2186, _2210);
    float _2214 = sqrt(_1968);
    float _2216 = _2198 * _2190;
    float _2218 = _2216 * 0.5;
    float _2220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _269);
    float _2222 = -_2186;
    float _2224 = fma(_2182, _2208, _2222);
    float _2226 = _2174 * _2202;
    float _2228 = _2148 * _2202;
    float _2230 = _2162 * _2202;
    float _2232 = _2132 * _2202;
    float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2236 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2234);
    float _2238 = trunc(_2168);
    int _2240 = int(_2238);
    float _2242 = _1766 * _2214;
    float _2244 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2246 = 1.0 / _2236;
    float _2248 = _2242 * _2244;
    float _2250 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2252 = _2220 * _2248;
    float _2254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _363);
    float _2256 = _2242 * _2250;
    int _2258 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2260 = _2240 + _2258;
    int _2262 = _2260 + 1;
    float _2264 = _2226 * _2252;
    float _2266 = -_2252;
    float _2268 = _2182 * _2266;
    float _2270 = _2254 * _2256;
    float _2272 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2274 = _2230 * _2252;
    float _2276 = fma(_2204, _2270, _2264);
    float _2278 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2272);
    float _2280 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2282 = _2280 * 0.5;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2286 = _2246 * _2284;
    float _2288 = fma(_2228, _2270, _2268);
    float _2290 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2278);
    float _2292 = fma(_2224, _2282, _2276);
    float _2294 = fma(_2212, _2270, _2274);
    bool _2296 = _2286 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2298 = fma(_2232, _2282, _2288);
    bool _2300 = _2286 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2302 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2304 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2306 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2308 = fma(_2206, _2282, _2294);
    float _2310 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2302);
    float _2312 = trunc(_2304);
    int _2314 = int(_2312);
    float _2316 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    bool _2318 = !_2296;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    float _2324 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2326 = as_type<int>(_2324);
    int _2328 = as_type<int>(_2308);
    float _2330 = _2304;
    if (!_2296)
    {
        _1996 = 1;
    }
    int _2332 = _1996;
    float _2334 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    int _2336 = _2332;
    if (!_2300)
    {
        _2336 = _2320;
    }
    int _2338 = _2336;
    float _2340 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2342 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2324);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2346 = _2338 << 6;
    float _2348 = _1502 + _2340;
    float _2350 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2342);
    float _2352 = _1376 + _2344;
    int _2354 = _2346 + 48;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c15)._m0[int(_2358)][_2360];
    int _2364 = int(_2356) + 1;
    uint _2366 = uint(int(uint(_2364) >> uint(2)));
    int _2368 = _2364 & 3;
    float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2374 = _2348 + _2372;
    int _2376 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2378 = _2314 + _2376;
    int _2380 = _2378 + 1;
    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2384 = _2352 + _2382;
    float _2386 = _2350 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2388 = _2374 * _2374;
    int _2390 = _2380 | _2262;
    int _2392 = _2346 + 56;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    uint _2396 = uint(int(uint(int(_2394)) >> uint(2)));
    int _2398 = int(_2394) & 3;
    float _2400 = (*spvDescriptorSet0.vp_c15)._m0[int(_2396)][_2398];
    int _2402 = int(_2394) + 1;
    uint _2404 = uint(int(uint(_2402) >> uint(2)));
    int _2406 = _2402 & 3;
    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
    bool _2410 = _2380 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2412 = fma(_2384, _2384, _2388);
    bool _2414 = _2390 < 0;
    bool _2416 = _2414 || _2410;
    float _2418 = sqrt(_2412);
    int _2420 = _2346 + 64;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    uint _2424 = uint(int(uint(int(_2422)) >> uint(2)));
    int _2426 = int(_2422) & 3;
    float _2428 = (*spvDescriptorSet0.vp_c15)._m0[int(_2424)][_2426];
    int _2430 = int(_2422) + 1;
    uint _2432 = uint(int(uint(_2430) >> uint(2)));
    int _2434 = _2430 & 3;
    float _2436 = (*spvDescriptorSet0.vp_c15)._m0[int(_2432)][_2434];
    bool _2438 = _2262 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2440 = _2438 || _2416;
    int _2442 = _2346 + 72;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    uint _2446 = uint(int(uint(int(_2444)) >> uint(2)));
    int _2448 = int(_2444) & 3;
    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[int(_2446)][_2448];
    int _2452 = int(_2444) + 1;
    uint _2454 = uint(int(uint(_2452) >> uint(2)));
    int _2456 = _2452 & 3;
    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[int(_2454)][_2456];
    int _2460 = as_type<int>(_2388);
    float _2462 = _2352;
    float _2464 = _2348;
    if (!_2440)
    {
        int _2466 = _2262 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2468 = _2466 + _2380;
        _2326 = _2468;
    }
    int _2470 = _2326;
    bool _2472 = _2418 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2474 = _2346 + 96;
    uint _2476 = uint(int(uint(_2474) >> uint(2)));
    uint _2478 = uint(int(uint(int(_2476)) >> uint(2)));
    int _2480 = int(_2476) & 3;
    float _2482 = (*spvDescriptorSet0.vp_c15)._m0[int(_2478)][_2480];
    int _2484 = int(_2476) + 1;
    uint _2486 = uint(int(uint(_2484) >> uint(2)));
    int _2488 = _2484 & 3;
    float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
    float _2492 = _1424 + _2386;
    float _2494 = _2492;
    float _2496 = _2418;
    if (!_2440)
    {
        int _2498 = _2470 << 2;
        _2328 = _2498;
    }
    int _2500 = _2328;
    int _2502 = _2500;
    if (!_2440)
    {
        uint _2504 = uint(int(uint(_2470) >> uint(2)));
        _2460 = int(_2504);
    }
    int _2506 = _2460;
    float _2508 = as_type<float>(_2506);
    if (!_2440)
    {
        int _2510 = 12 & _2500;
        _2502 = _2510;
    }
    int _2512 = _2502;
    int _2514 = _2346 + 104;
    uint _2516 = uint(int(uint(_2514) >> uint(2)));
    uint _2518 = uint(int(uint(int(_2516)) >> uint(2)));
    int _2520 = int(_2516) & 3;
    float _2522 = (*spvDescriptorSet0.vp_c15)._m0[int(_2518)][_2520];
    int _2524 = int(_2516) + 1;
    uint _2526 = uint(int(uint(_2524) >> uint(2)));
    int _2528 = _2524 & 3;
    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[int(_2526)][_2528];
    float _2532 = as_type<float>(_2512);
    if (!_2440)
    {
        int _2534 = _2506 << 4;
        int _2536 = _2534 + _2512;
        _2508 = as_type<float>(_2536);
    }
    float _2538 = _2508;
    bool _2540 = !_2472;
    if (!_2540)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2546 = _2418 + _2544;
        float _2548 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = rsqrt(_2412);
        float _2552 = _2546 * _2542;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = _2554 * 6.283185482025146484375;
        float _2558 = cos(_2556);
        float _2560 = _2554 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = _2558 + (-1.0);
        float _2566 = fma(_2562, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2570 = _2550 * _2566;
        float _2572 = fma(_2492, _2558, _2568);
        float _2574 = fma(_2384, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2576 = fma(_2374, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2494 = _2572;
        _2462 = _2574;
        _2464 = _2576;
        _2496 = _2564;
        _2532 = _2562;
    }
    float _2578 = _2494;
    float _2580 = _2462;
    float _2582 = _2464;
    float _2584 = _2496;
    float _2586 = _2532;
    float _2588 = -_1424;
    float _2590 = _2588 + _2578;
    int _2592 = _2346 + 80;
    uint _2594 = uint(int(uint(_2592) >> uint(2)));
    uint _2596 = uint(int(uint(int(_2594)) >> uint(2)));
    int _2598 = int(_2594) & 3;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
    int _2602 = int(_2594) + 1;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    int _2606 = _2602 & 3;
    float _2608 = (*spvDescriptorSet0.vp_c15)._m0[int(_2604)][_2606];
    float _2610 = -_1376;
    float _2612 = _2610 + _2580;
    float _2614 = -_1502;
    float _2616 = _2614 + _2582;
    float _2618 = _2590 * _2590;
    float _2620 = _2140 * _2490;
    float _2622 = _2586;
    float _2624 = _2584;
    float _2626 = _2580;
    float _2628 = _2578;
    float _2630 = _2582;
    if (!_2440)
    {
        float _2632 = floor(_2304);
        _2622 = _2632;
    }
    float _2634 = _2622;
    float _2636 = _2140 * _2436;
    float _2638 = fma(_2612, _2612, _2618);
    int _2640 = _2346 + 88;
    uint _2642 = uint(int(uint(_2640) >> uint(2)));
    uint _2644 = uint(int(uint(int(_2642)) >> uint(2)));
    int _2646 = int(_2642) & 3;
    float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
    int _2650 = int(_2642) + 1;
    uint _2652 = uint(int(uint(_2650) >> uint(2)));
    int _2654 = _2650 & 3;
    float _2656 = (*spvDescriptorSet0.vp_c15)._m0[int(_2652)][_2654];
    float _2658 = fma(_1828, _2482, _2620);
    float _2660 = fma(_1828, _2428, _2636);
    float _2662 = fma(_2616, _2616, _2638);
    float _2664 = fma(_1836, _2522, _2658);
    if (!_2440)
    {
        float _2666 = floor(_2168);
        _2624 = _2666;
    }
    float _2668 = _2624;
    bool _2670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2672 = isnan(0.5);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2678 = _2674 || _2676;
    float _2680 = _2538;
    if (!_2440)
    {
        int _2682 = as_type<int>(_2538) + 400;
        uint _2684 = uint(int(uint(_2682) >> uint(2)));
        uint _2686 = uint(int(uint(int(_2684)) >> uint(2)));
        int _2688 = int(_2684) & 3;
        float _2690 = (*spvDescriptorSet0.vp_c15)._m0[int(_2686)][_2688];
        _2680 = _2690;
    }
    float _2692 = _2680;
    float _2694 = _2664 + _2530;
    float _2696 = _2140 * _2370;
    float _2698 = fma(_1836, _2450, _2660);
    float _2700 = sqrt(_2662);
    float _2702 = fma(_1828, _2362, _2696);
    float _2704 = fma(_1836, _2400, _2702);
    float _2706 = 1.0 / _2694;
    bool _2708 = _2700 > 0.0;
    bool _2710 = !_2708;
    if (!_2710)
    {
        float _2712 = _357 * _357;
        float _2714 = rsqrt(_2662);
        float _2716 = fma(_245, _245, _2712);
        float _2718 = fma(_359, _359, _2716);
        float _2720 = sqrt(_2718);
        float _2722 = _2612 * _2714;
        float _2724 = _2590 * _2714;
        float _2726 = _2616 * _2714;
        bool _2728 = _2720 > 0.0;
        bool _2730 = !_2728;
        if (!_2730)
        {
            float _2732 = rsqrt(_2718);
            float _2734 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2736 = _357 * _2732;
            float _2738 = _245 * _2732;
            float _2740 = _2724 * _2736;
            float _2742 = _359 * _2732;
            float _2744 = fma(_2722, _2738, _2740);
            float _2746 = _2734 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2748 = fma(_2726, _2742, _2744);
            float _2750 = _2748 * _2746;
            float _2752 = fma(_245, _2750, _2580);
            float _2754 = fma(_357, _2750, _2578);
            float _2756 = fma(_359, _2750, _2582);
            _2626 = _2752;
            _2628 = _2754;
            _2630 = _2756;
        }
    }
    float _2758 = _2626;
    float _2760 = _2628;
    float _2762 = _2630;
    float _2764 = -_1816;
    float _2766 = fma(_2764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2758);
    float _2768 = -_1806;
    float _2770 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2760);
    float _2772 = -_1824;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2762);
    float _2776 = _2704 + _2408;
    float _2778 = _2698 + _2458;
    float _2780 = _2770;
    float _2782 = _2766;
    float _2784 = _2774;
    if (!_2678)
    {
        float _2786 = _1832 * _1832;
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2790 = -_1376;
        float _2792 = _2790 + _2758;
        float _2794 = -_1424;
        float _2796 = _2794 + _2760;
        float _2798 = fma(_1840, _1840, _2786);
        float _2800 = -_1502;
        float _2802 = _2800 + _2762;
        float _2804 = fma(_1846, _1846, _2798);
        float _2806 = 1.0 / _2242;
        float _2808 = sqrt(_2804);
        float _2810 = _2792 * _2806;
        float _2812 = _2796 * _2806;
        float _2814 = _2802 * _2806;
        bool _2816 = _2808 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2818 = isnan(_2808);
        bool _2820 = _2816 || _2818;
        bool _2822 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2824 = _2820 || _2822;
        float _2826 = precise::min(_2808, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2828 = _2826 * _2788;
        float _2830 = fma(_2810, _2828, _1828);
        float _2832 = fma(_2812, _2828, _1822);
        float _2834 = _2766;
        float _2836 = _2808;
        float _2838 = _2828;
        float _2840 = _2832;
        if (_2824)
        {
            float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2834 = _2842;
        }
        float _2844 = _2834;
        if (_2824)
        {
            float _2846 = precise::max(_2808, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2836 = _2846;
        }
        float _2848 = _2836;
        float _2850 = fma(_2814, _2828, _1836);
        float _2852 = _2844;
        _2784 = _2850;
        _1854 = _2848;
        if (_2824)
        {
            float _2854 = _2848 * _2844;
            _2838 = _2854;
        }
        float _2856 = _2838;
        if (!_2824)
        {
            _2852 = _2830;
        }
        float _2858 = _2852;
        float _2860 = _2858;
        if (_2824)
        {
            float _2862 = fma(_2812, _2856, _1822);
            _2840 = _2862;
        }
        float _2864 = _2840;
        _2780 = _2864;
        if (_2824)
        {
            float _2866 = fma(_2810, _2856, _1828);
            _2860 = _2866;
        }
        float _2868 = _2860;
        _2782 = _2868;
        if (_2824)
        {
            float _2870 = fma(_2814, _2856, _1836);
            _2784 = _2870;
        }
    }
    float _2872 = _2780;
    float _2874 = _2782;
    float _2876 = _2784;
    float _2878 = _1854;
    float _2880 = _2776 * _2706;
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2884 = _2778 * _2706;
    float _2886 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2888 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2890 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2882);
    bool _2892 = _2880 >= 0.0;
    float _2894 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2886);
    float _2896 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2888);
    float _2898 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2890);
    float _2900 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2902 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2894);
    float _2904 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2896);
    float _2906 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2908 = _2880 <= 1.0;
    bool _2910 = _2908 && _2892;
    float _2912 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2914 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2900);
    float _2916 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2918 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2920 = _2884 >= 0.0;
    bool _2922 = _2920 && _2910;
    float _2924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2926 = _2912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2928 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2914);
    float _2930 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2918);
    bool _2932 = _2884 <= 1.0;
    bool _2934 = _2932 && _2922;
    float _2936 = -_2926;
    float _2938 = fma(_2936, _2924, 1.0);
    float _2940 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2942 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2930);
    float _2944 = _2140 * _2608;
    float _2946 = log2(_2938);
    float _2948 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2950 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2942);
    float _2952 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2954 = fma(_1828, _2600, _2944);
    float _2956 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2948);
    float _2958 = _2944;
    float _2960 = _2938;
    float _2962 = _2878;
    if (!_2440)
    {
        float _2964 = -_2668;
        float _2966 = _2168 + _2964;
        _1818 = _2966;
    }
    float _2968 = _1818;
    float _2970 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2952);
    float _2972 = 1.0 / _2950;
    if (_2934)
    {
        float _2974 = float(_2338);
        _2958 = _2974;
    }
    float _2976 = _2958;
    float _2978 = fma(_1836, _2648, _2954);
    float _2980 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2956);
    float _2982 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2970);
    if (!_2440)
    {
        float _2984 = -_2634;
        float _2986 = _2304 + _2984;
        _2960 = _2986;
    }
    float _2988 = _2960;
    float _2990 = _2978 + _2656;
    float _2992 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2980);
    float _2994 = _2698;
    float _2996 = _2992;
    if (!_2440)
    {
        float _2998 = rint(_2692);
        float _3000 = precise::max(_2998, 0.0);
        uint _3002 = uint(_3000);
        uint _3004 = clamp(_3002, 0u, 65535u);
        _2994 = as_type<float>(_3004);
    }
    float _3006 = _2994;
    float _3008 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2982);
    float _3010 = _2946 * 0.693147182464599609375;
    float _3012 = _2990 * _2706;
    float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = _2976;
    if (_2934)
    {
        float _3018 = rint(_2976);
        float _3020 = precise::max(_3018, 0.0);
        uint _3022 = uint(_3020);
        uint _3024 = clamp(_3022, 0u, 65535u);
        _3016 = as_type<float>(_3024);
    }
    float _3026 = _3016;
    float _3028 = _2992 * _2972;
    float _3030 = _3008 * _2972;
    float _3032 = fma(_3028, 0.5, 0.5);
    float _3034 = fma(_3030, -0.5, 0.5);
    float _3036 = _2968;
    float _3038 = _3034;
    float _3040 = _3032;
    if (!_2440)
    {
        float3 _8696 = float3(_2988, _2968, float(as_type<int>(_3006)));
        float3 _8700 = select(_8696, float3(0.0), isnan(_8696));
        float _3042 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8700.xy, uint(rint(_8700.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8700.xy, uint(rint(_8700.z)), level(0.0)).x;
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = _2884;
    if (_2934)
    {
        float3 _8715 = float3(_2880, _2884, float(as_type<int>(_3026)));
        float3 _8717 = select(_8715, float3(0.0), isnan(_8715));
        float _3048 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8717.xy, uint(rint(_8717.z)), _3012, level(0.0));
        _3046 = _3048;
    }
    float _3050 = _3046;
    float3 _8727 = float3(_3032, _3034, _3014);
    float _3052 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8727, float3(0.0), isnan(_8727)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8727, float3(0.0), isnan(_8727)), level(0.0)).x;
    float3 _8736 = float3(_3032, _3034, _3014);
    float4 _3055 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8736, float3(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8736, float3(0.0), isnan(_8736)), level(0.0)).xyzw;
    float _3057 = _3055.x;
    float _3059 = _3055.y;
    float _3061 = _3055.z;
    float _3063 = _3055.w;
    bool _3065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3067 = isnan(0.5);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3073 = _3069 || _3071;
    if (_2440)
    {
        _1856 = 1.0;
    }
    float _3075 = _1856;
    float _3077 = _3075;
    if (_3073)
    {
        _1858 = 1.0;
    }
    float _3079 = _1858;
    float _3081 = _3079;
    if (_3073)
    {
        _2962 = 1.0;
    }
    float _3083 = _2962;
    float _3085 = _3083;
    float _3087 = _3057;
    if (!_3073)
    {
        float _3089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3091 = _3089 * 0.15915493667125701904296875;
        float _3093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3095 = _3091 * 6.283185482025146484375;
        float _3097 = cos(_3095);
        float _3099 = _3093 * 0.15915493667125701904296875;
        float _3101 = _3091 * 6.283185482025146484375;
        float _3103 = sin(_3101);
        float _3105 = 1.0 / _3097;
        float _3107 = _3099 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = _3103 * _3105;
        float _3113 = _3099 * 6.283185482025146484375;
        float _3115 = sin(_3113);
        float _3117 = _3109 * _3111;
        float _3119 = 1.0 / _3117;
        float _3121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3121;
        float _3125 = 1.0 / _3123;
        float _3127 = _3115 * _3119;
        float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3131 = fma(_2286, _3127, _3129);
        float _3133 = _3131 * _3125;
        float _3135 = precise::clamp(_3133, 0.0, 1.0);
        _3038 = _3091;
        _3040 = _3099;
        _3085 = _3135;
    }
    float _3137 = _3038;
    float _3139 = _3040;
    float _3141 = _3085;
    float _3143 = _3137;
    float _3145 = _3139;
    if (!_3073)
    {
        float _3147 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3149 = _3147 * 0.15915493667125701904296875;
        float _3151 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3153 = _3149 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        float _3157 = _3151 * 0.15915493667125701904296875;
        float _3159 = _3149 * 6.283185482025146484375;
        float _3161 = sin(_3159);
        float _3163 = 1.0 / _3155;
        float _3165 = _3157 * 6.283185482025146484375;
        float _3167 = cos(_3165);
        float _3169 = _3161 * _3163;
        float _3171 = _3157 * 6.283185482025146484375;
        float _3173 = sin(_3171);
        float _3175 = _3167 * _3169;
        float _3177 = 1.0 / _3175;
        float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3181 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3179;
        float _3183 = 1.0 / _3181;
        float _3185 = _3173 * _3177;
        float _3187 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3189 = fma(_2286, _3185, _3187);
        float _3191 = _3189 * _3183;
        float _3193 = precise::clamp(_3191, 0.0, 1.0);
        float _3195 = -_3193;
        float _3197 = _3195 + 1.0;
        _3143 = _3163;
        _3145 = _3175;
        _3081 = _3197;
    }
    float _3199 = _3143;
    float _3201 = _3145;
    float _3203 = _3081;
    float _3205 = _3201;
    float _3207 = _3199;
    if (!_2440)
    {
        int _3209 = _2470 << 4;
        int _3211 = _3209 + 2048;
        uint _3213 = uint(int(uint(_3211) >> uint(2)));
        uint _3215 = uint(int(uint(int(_3213)) >> uint(2)));
        int _3217 = int(_3213) & 3;
        float _3219 = (*spvDescriptorSet0.vp_c15)._m0[int(_3215)][_3217];
        int _3221 = int(_3213) + 1;
        uint _3223 = uint(int(uint(_3221) >> uint(2)));
        int _3225 = _3221 & 3;
        float _3227 = (*spvDescriptorSet0.vp_c15)._m0[int(_3223)][_3225];
        int _3229 = _3211 + 8;
        uint _3231 = uint(int(uint(_3229) >> uint(2)));
        uint _3233 = uint(int(uint(int(_3231)) >> uint(2)));
        int _3235 = int(_3231) & 3;
        float _3237 = (*spvDescriptorSet0.vp_c15)._m0[int(_3233)][_3235];
        int _3239 = int(_3231) + 1;
        uint _3241 = uint(int(uint(_3239) >> uint(2)));
        int _3243 = _3239 & 3;
        float _3245 = (*spvDescriptorSet0.vp_c15)._m0[int(_3241)][_3243];
        float _3247 = _2140 * _3227;
        float _3249 = fma(_1828, _3219, _3247);
        float _3251 = fma(_1836, _3237, _3249);
        float _3253 = _3251 + _3245;
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        float _3257 = -_3255;
        float _3259 = _3257 + _3044;
        float _3261 = fma(_3259, 500.0, 1.5);
        float _3263 = exp2(_3261);
        float _3265 = 0.0 + _3263;
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        _3077 = _3267;
    }
    float _3269 = _3077;
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3273 = _2872 + _3271;
    float _3275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3277 = _2874 + _3275;
    float _3279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3281 = _2876 + _3279;
    float _3283 = _3273 * _3273;
    float _3285 = fma(_3277, _3277, _3283);
    float _3287 = fma(_3281, _3281, _3285);
    float _3289 = rsqrt(_3287);
    float _3291 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3293 = _3277 * _3291;
    float _3295 = _3281 * _3291;
    float _3297 = _3293 * _3293;
    float _3299 = _3295 * _3295;
    float _3301 = _3297 + _3299;
    float _3303 = sqrt(_3301);
    bool _3305 = _3303 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3309 = _3303 + _3307;
    float _3311 = _3289;
    float _3313 = _3309;
    if (_3305)
    {
        float _3315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3315;
    }
    float _3317 = _3311;
    if (_3305)
    {
        float _3319 = rsqrt(_3301);
        _3205 = _3319;
    }
    float _3321 = _3205;
    float _3323 = _3321;
    if (_3305)
    {
        float _3325 = _3309 * _3317;
        _3313 = _3325;
    }
    float _3327 = _3313;
    if (_3305)
    {
        float _3329 = _3327 * 0.15915493667125701904296875;
        _3207 = _3329;
    }
    float _3331 = _3207;
    float _3333 = _3317;
    float _3335 = _3331;
    if (_3305)
    {
        float _3337 = _3331 * 6.283185482025146484375;
        float _3339 = sin(_3337);
        _3333 = _3339;
    }
    float _3341 = _3333;
    float _3343 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3345 = precise::max(0.0, _3343);
    float _3347 = _3281;
    float _3349 = _3345;
    if (_3305)
    {
        float _3351 = _3331 * 6.283185482025146484375;
        float _3353 = cos(_3351);
        _3347 = _3353;
    }
    float _3355 = _3347;
    float _3357 = -_3291;
    float _3359 = -_3345;
    float _3361 = fma(_3273, _3357, _3359);
    float _3363 = _3361;
    if (_3305)
    {
        float _3365 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3349 = _3365;
    }
    float _3367 = _3349;
    float _3369 = _3341;
    float _3371 = _3367;
    if (_3305)
    {
        float _3373 = fma(_3341, _3367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3369 = _3373;
    }
    float _3375 = _3369;
    float _3377 = _3375;
    if (_3305)
    {
        float _3379 = _3355 + (-1.0);
        _3371 = _3379;
    }
    float _3381 = _3371;
    float _3383 = _3381;
    if (_3305)
    {
        float _3385 = _3321 * _3375;
        _2330 = _3385;
    }
    float _3387 = _2330;
    if (!_3305)
    {
        _3377 = _3293;
    }
    float _3389 = _3377;
    float _3391 = _3389;
    if (_3305)
    {
        float _3393 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3335 = _3393;
    }
    float _3395 = _3335;
    float _3397 = _3395;
    if (_3305)
    {
        float _3399 = _3293 * _3387;
        _3391 = _3399;
    }
    float _3401 = _3391;
    if (!_3305)
    {
        _3383 = _3295;
    }
    float _3403 = _3383;
    float _3405 = _3403;
    if (_3305)
    {
        float _3407 = _3295 * _3387;
        _3405 = _3407;
    }
    float _3409 = _3405;
    if (!_3305)
    {
        _3323 = _3297;
    }
    float _3411 = _3323;
    float _3413 = _3411;
    if (_3305)
    {
        float _3415 = fma(_3361, _3355, _3395);
        _3363 = _3415;
    }
    float _3417 = _3363;
    if (_3305)
    {
        float _3419 = _3401 * _3401;
        _3413 = _3419;
    }
    float _3421 = _3413;
    float _3423 = sqrt(_3287);
    if (!_3305)
    {
        _3397 = _3299;
    }
    float _3425 = _3397;
    float _3427 = _3425;
    if (_3305)
    {
        float _3429 = _3409 * _3409;
        _3427 = _3429;
    }
    float _3431 = _3427;
    float _3433 = fma(_3417, _3417, _3421);
    float _3435 = _3433 + _3431;
    float _3437 = rsqrt(_3435);
    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3441 = fma(_3423, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3439);
    float _3443 = precise::clamp(_3441, 0.0, 1.0);
    float _3445 = -_3443;
    float _3447 = _3445 + 1.0;
    float _3449 = abs(_3447);
    float _3451 = log2(_3449);
    float _3453 = _3437 * _3401;
    float _3455 = _3437 * _3417;
    float _3457 = _3437 * _3409;
    float _3459 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3461 = -_3459;
    float _3463 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3461);
    float _3465 = -_3457;
    float _3467 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3463);
    float _3469 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3471 = fma(_3467, -0.5, 0.5);
    float _3473 = fma(_3467, 0.5, 0.5);
    float _3475 = _3455 + 1.0;
    float _3477 = exp2(_3469);
    float _3479 = fma(_3473, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3481 = fma(_3473, _3479, -0.212114393711090087890625);
    float _3483 = sqrt(_3471);
    float _3485 = fma(_3473, _3481, 1.570728778839111328125);
    float _3487 = -_3455;
    float _3489 = fma(_3477, _3475, _3487);
    float _3491 = fma(_3489, 0.5, 0.5);
    float _3493 = _3483 * 0.636619746685028076171875;
    float _3495 = -_3485;
    float _3497 = fma(_3493, _3495, 1.0);
    float2 _9380 = float2(_3497, _3491);
    float3 _3501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9380, float2(0.0), isnan(_9380)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9380, float2(0.0), isnan(_9380)), level(0.0)).xyz;
    float _3503 = _3501.x;
    float _3505 = _3501.y;
    float _3507 = _3501.z;
    float _3509 = abs(_2286);
    float _3511 = log2(_3509);
    float _3513 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3515 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3517 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3519 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3521 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3513);
    float _3523 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3525 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3515);
    float _3527 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3529 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3531 = -_2182;
    float _3533 = fma(_3531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3523);
    float _3535 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3537 = -_2182;
    float _3539 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3527);
    float _3541 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3543 = -_2182;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3529);
    float _3547 = _269 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3549 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3551 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3535);
    float _3553 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3555 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3533);
    float _3557 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3541);
    float _3559 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3539);
    float _3561 = exp2(_3549);
    float _3563 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3519);
    float _3565 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3567 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3545);
    float _3569 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3553);
    float _3571 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3521);
    float _3573 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3575 = _3547 * _3555;
    float _3577 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3565);
    float _3579 = _3547 * _3559;
    float _3581 = _3547 * _3567;
    float _3583 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3569);
    float _3585 = fma(_3573, _3571, _3575);
    float _3587 = _2950 * 0.5;
    float _3589 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3525);
    float _3591 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3551);
    float _3593 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3557);
    float _3595 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3577);
    float _3597 = fma(_3008, -0.5, _3587);
    float _3599 = fma(_3573, _3589, _3579);
    float _3601 = fma(_3561, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3603 = precise::clamp(_3601, 0.0, 1.0);
    float _3605 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3607 = _3593 + _3599;
    out.gl_Position.x = _2992;
    out.gl_Position.y = _3008;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _2950;
    float _3609 = fma(_3603, -2.0, 3.0);
    float _3611 = _3603 * _3603;
    bool _3613 = _2286 <= 8000.0;
    bool _3615 = isnan(_2286);
    bool _3617 = _3613 || _3615;
    bool _3619 = isnan(8000.0);
    bool _3621 = _3617 || _3619;
    float _3623 = float(_3621);
    float _3625 = exp2(_3605);
    float _3627 = _3583 + _2950;
    float _3629 = _3611 * _3609;
    float _3631 = -_1884;
    float _3633 = _3631 + 1.0;
    float _3635 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3563);
    float _3637 = _2992 + _2950;
    float _3639 = _3627 * 0.5;
    float _3641 = fma(_3573, _3635, _3581);
    float _3643 = _3591 + _3585;
    float _3645 = -_3629;
    float _3647 = _3645 + 1.0;
    float _3649 = _3641;
    if (!_2934)
    {
        _2996 = 1.0;
    }
    float _3651 = _2996;
    float _3653 = _3637 * 0.5;
    float _3655 = _3651;
    if (_2934)
    {
        bool _3657 = _3050 >= _3012;
        bool _3659 = isnan(_3050);
        bool _3661 = _3657 || _3659;
        bool _3663 = isnan(_3012);
        bool _3665 = _3661 || _3663;
        float _3667 = float(_3665);
        _3655 = _3667;
    }
    float _3669 = _3655;
    float _3671 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3629);
    float _3673 = _3595 + _3641;
    float _3675 = -_3625;
    float _3677 = _3675 + 1.0;
    out.m_88.x = _3653;
    out.m_88.y = _3597;
    out.m_88.z = _3639;
    out.m_88.w = _2950;
    float _3679 = _3623 * _3671;
    float _3681 = _3669 * _3269;
    float _3683 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_90.x = _3643;
    out.m_90.y = _3607;
    out.m_90.z = _3673;
    float _3685 = _3679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3687 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3689 = isnan(_3423);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3695 = _3691 || _3693;
    float _3697 = _3683 * _3052;
    float _3699 = -_3683;
    float _3701 = _3699 + 1.0;
    float _3703 = _3633 * _3685;
    float _3705 = precise::clamp(_3703, 0.0, 1.0);
    float _3707 = _3063 * _3697;
    float _3709 = _3063 * _3701;
    float _3711 = -_3705;
    float _3713 = fma(_3711, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3715 = -_3681;
    float _3717 = fma(_3715, _3713, 1.0);
    float _3719 = precise::clamp(_3717, 0.0, 1.0);
    float _3721 = _3683;
    float _3723 = _3701;
    float _3725 = _3713;
    if (!_3695)
    {
        _3649 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3727 = _3649;
    float _3729 = _3719 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3731 = _3141 * _3203;
    float _3733 = _3731;
    float _3735 = _3727;
    float _3737 = _3727;
    if (!_3695)
    {
        _3721 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3739 = _3721;
    float _3741 = _3739;
    float _3743 = _3739;
    if (!_3695)
    {
        _3723 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3745 = _3723;
    out.m_92.x = _3729;
    float _3747 = _3731 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3749 = _3745;
    float _3751 = _3745;
    if (!_3695)
    {
        _3725 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3753 = _3725;
    float _3755 = _3753;
    float _3757 = _3753;
    if (!_3695)
    {
        _3733 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3759 = _3733;
    float _3761 = _3507 * _3697;
    float _3763 = fma(_3503, _3707, _3057);
    float _3765 = fma(_3505, _3707, _3059);
    float _3767 = _3759;
    float _3769 = _3759;
    if (!_3695)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3771 = _3087;
    float _3773 = fma(_3063, _3761, _3061);
    out.m_94.x = _3763;
    out.m_94.y = _3765;
    out.m_94.z = _3773;
    out.m_94.w = _3709;
    bool _3775 = !_3695;
    float _3777 = _3771;
    float _3779 = _3771;
    if (!_3775)
    {
        bool _3781 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3783 = isnan(_3423);
        bool _3785 = _3781 || _3783;
        bool _3787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3789 = _3785 || _3787;
        if (!_3789)
        {
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3793 = _3423 + _3791;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3797 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3795;
            float _3799 = 1.0 / _3797;
            float _3801 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3805 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3807 = _3805 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3815 = _3813 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3821 = _3793 * _3799;
            float _3823 = precise::clamp(_3821, 0.0, 1.0);
            float _3825 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3829 = fma(_3823, _3803, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3831 = fma(_3823, _3827, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3833 = fma(_3823, _3807, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3835 = fma(_3823, _3811, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3837 = fma(_3823, _3815, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3839 = fma(_3823, _3819, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3779 = _3831;
            _3757 = _3837;
            _3737 = _3829;
            _3751 = _3835;
            _3743 = _3833;
            _3769 = _3839;
            _3841 = true;
        }
        else
        {
            bool _3843 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3845 = isnan(_3423);
            bool _3847 = _3843 || _3845;
            bool _3849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3851 = _3847 || _3849;
            if (!_3851)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3853 = _3735;
            _3737 = _3853;
            if (!_3851)
            {
                _3777 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3855 = _3777;
            _3779 = _3855;
            if (!_3851)
            {
                _3741 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3857 = _3741;
            _3743 = _3857;
            if (!_3851)
            {
                _3749 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3859 = _3749;
            _3751 = _3859;
            if (!_3851)
            {
                _3755 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3861 = _3755;
            _3757 = _3861;
            if (!_3851)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3863 = _3767;
            bool _3865 = !_3851;
            _3769 = _3863;
            if (!_3865)
            {
                bool _3867 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3869 = isnan(_3423);
                bool _3871 = _3867 || _3869;
                bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3875 = _3871 || _3873;
                if (!_3875)
                {
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3879 = _3423 + _3877;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3883 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3881;
                    float _3885 = 1.0 / _3883;
                    float _3887 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3893 = _3891 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3907 = _3879 * _3885;
                    float _3909 = precise::clamp(_3907, 0.0, 1.0);
                    float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3915 = fma(_3909, _3889, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3917 = fma(_3909, _3913, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3919 = fma(_3909, _3893, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3921 = fma(_3909, _3897, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3923 = fma(_3909, _3901, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3925 = fma(_3909, _3905, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3779 = _3917;
                    _3757 = _3923;
                    _3737 = _3915;
                    _3751 = _3921;
                    _3743 = _3919;
                    _3769 = _3925;
                    _3841 = true;
                }
                else
                {
                    _3779 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3757 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3751 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3743 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3841 = false;
    float _3927 = _3779;
    float _3929 = _3757;
    float _3931 = _3737;
    float _3933 = _3751;
    float _3935 = _3743;
    float _3937 = _3769;
    float _3939 = fma(_3607, -0.5, 0.5);
    float _3941 = precise::clamp(_3939, 0.0, 1.0);
    float _3943 = -_3927;
    float _3945 = _3943 + _3929;
    float _3947 = _3747 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3949 = -_3931;
    float _3951 = _3949 + _3933;
    float _3953 = fma(_3941, _3945, _3927);
    out.m_96.x = 0.0;
    float _3955 = -_3935;
    float _3957 = _3955 + _3937;
    float _3959 = fma(_3941, _3951, _3931);
    float _3961 = _3953 * 0.586610972881317138671875;
    out.m_59.x = _3947;
    bool _3963 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3965 = fma(_3941, _3957, _3935);
    float _3967 = fma(_3959, 0.298911988735198974609375, _3961);
    bool _3969 = _3141 > 0.0;
    bool _3971 = isnan(_3141);
    bool _3973 = _3969 || _3971;
    bool _3975 = isnan(0.0);
    bool _3977 = _3973 || _3975;
    float _3979 = fma(_3965, 0.114477999508380889892578125, _3967);
    bool _3981 = _3203 <= 0.0;
    bool _3983 = !_3977;
    bool _3985 = _3981 || _3983;
    float _3987 = -_3979;
    float _3989 = _3959 + _3987;
    float _3991 = -_3979;
    float _3993 = _3953 + _3991;
    float _3995 = -_3979;
    float _3997 = _3965 + _3995;
    float _3999 = fma(_3989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    float _4001 = fma(_3993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    float _4003 = fma(_3997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    bool _4005 = !_3963;
    if (!_4005)
    {
        float _4007 = -_2872;
        float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4011 = -_2874;
        float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4015 = -_2876;
        float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4019 = _4009 * _4009;
        float _4021 = fma(_4013, _4013, _4019);
        float _4023 = fma(_4017, _4017, _4021);
        float _4025 = sqrt(_4023);
        float _4027 = rsqrt(_4023);
        float _4029 = -_4025;
        float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4033 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4035 = precise::clamp(_4033, 0.0, 1.0);
        float _4037 = _4013 * _4027;
        float _4039 = _4009 * _4027;
        float _4041 = abs(_4035);
        float _4043 = log2(_4041);
        float _4045 = _4017 * _4027;
        float _4047 = _4037 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4049 = _3607 * _4039;
        float _4051 = -_4039;
        float _4053 = -_4047;
        float _4055 = fma(_4051, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4053);
        float _4057 = fma(_3643, _4037, _4049);
        float _4059 = -_4045;
        float _4061 = fma(_4059, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4055);
        float _4063 = fma(_3673, _4045, _4057);
        float _4065 = precise::clamp(_4063, 0.0, 1.0);
        float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4069 = _4061 + _4067;
        float _4071 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4073 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4075 = precise::clamp(_4073, 0.0, 1.0);
        float _4077 = exp2(_4071);
        float _4079 = _4077 * _4075;
        float _4081 = _4065 * _4079;
        float _4083 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4085 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4087 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _4083;
        out.m_96.y = _4085;
        out.m_96.z = _4087;
    }
    out.m_98.x = _3999;
    out.m_98.y = _4001;
    out.m_98.z = _4003;
    if (!_3985)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4089;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3841 = false;
    bool _959 = false;
    bool _767 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4146 = as_type<float>(_133);
        out.gl_Position.z = _4146;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_61.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4216 = as_type<float>(_171);
        out.gl_Position.z = _4216;
    }
    if (_163)
    {
        return out;
    }
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = in.m_63.x;
    float _177 = _151 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = in.m_68.x;
    float _185 = in.m_68.y;
    float _187 = in.m_68.z;
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    float _195 = _177 * _173;
    float _197 = _151 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _199 = in.m_72.x;
    float _201 = in.m_72.y;
    float _203 = in.m_72.z;
    float _205 = in.m_74.x;
    float _207 = in.m_74.y;
    float _209 = in.m_74.z;
    float _211 = _197 * _181;
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _195);
    float _215 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _211);
    float _217 = _213 * 6.283185482025146484375;
    int _219 = as_type<int>(_179) & 1;
    bool _221 = _219 != 0;
    int _223 = as_type<int>(_179) & 2;
    bool _225 = _223 != 0;
    float _227 = floor(_213);
    int _229 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _231 = _229 != 0;
    float _233 = _217 * 0.15915493667125701904296875;
    float _235 = _215 * 6.283185482025146484375;
    float _237 = _185 * _191;
    float _239 = floor(_215);
    float _241 = fma(_183, _189, _237);
    float _243 = _185 * _201;
    float _245 = fma(_187, _193, _241);
    float _247 = _185 * _207;
    float _249 = fma(_183, _199, _243);
    float _251 = _233 * 6.283185482025146484375;
    float _253 = cos(_251);
    float _255 = -_227;
    float _257 = _213 + _255;
    float _259 = fma(_183, _205, _247);
    float _261 = -_239;
    float _263 = _215 + _261;
    float _265 = _235 * 0.15915493667125701904296875;
    bool _267 = !_225;
    float _269 = _267 ? (-0.5) : 0.5;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = -_263;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _283 = _257 < 0.5;
    float _285 = float(_283);
    float _287 = _265 * 6.283185482025146484375;
    float _289 = cos(_287);
    bool _291 = !_231;
    int _293 = _291 ? 0 : 1;
    float _295 = fma(_253, 0.5, 0.5);
    bool _297 = !_273;
    int _299 = _297 ? 0 : 1;
    float _301 = -_257;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_293);
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _311 = abs(_299);
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = float(_311);
    bool _321 = !_277;
    int _323 = _321 ? 0 : 1;
    bool _325 = _263 < 0.5;
    float _327 = float(_325);
    float _329 = fma(_289, 0.5, 0.5);
    float _331 = float(_305);
    float _333 = abs(_303);
    float _335 = _319 * _333;
    float _337 = abs(_281);
    float _339 = _319 * _337;
    float _341 = -_329;
    float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _345 = abs(_323);
    float _347 = fma(_331, _315, _335);
    float _349 = -_327;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = fma(_331, _343, _339);
    float _355 = float(_345);
    float _357 = fma(_187, _203, _249);
    float _359 = fma(_187, _209, _259);
    bool _361 = !_221;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = abs(_309);
    float _367 = fma(_355, _365, _347);
    float _369 = abs(_351);
    float _371 = fma(_355, _369, _353);
    bool _373 = !_317;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_117);
        float _395 = 1.0 / _393;
        float _397 = _151 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = 1.0 / _411;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _435 = 1.0 / _415;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _399 + _437;
    bool _441 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_399);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _455 = -_451;
    float _457 = _455 + 1.0;
    float _459 = 1.0 / _419;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _461;
    float _465 = _439 * _425;
    bool _467 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _469 = isnan(_399);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _481 = _399 + _479;
    float _483 = 1.0 / _429;
    float _485 = _403 * _435;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _489 = _399 + _487;
    float _491 = -_477;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _423;
    float _497 = _407 * _459;
    bool _499 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _501 = isnan(_399);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    bool _511 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _513 = isnan(_399);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = 1.0 / _433;
    float _525 = _489 * _483;
    float _527 = -_509;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _463;
    float _533 = _481 * _495;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _537 = _399 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _541 = _399 + _539;
    float _543 = _537 * _523;
    float _545 = _509 * _493;
    bool _547 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _549 = isnan(_399);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _521 * _529;
    float _561 = -_521;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _569;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = _541 * _531;
    bool _579 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_399);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _557 * _563;
    float _593 = _451 * _575;
    float _595 = fma(_567, _465, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = fma(_571, _465, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _599 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_399);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_589;
    float _613 = _611 + 1.0;
    bool _615 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _617 = isnan(_399);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _589 * _457;
    float _629 = -_609;
    float _631 = _629 + 1.0;
    float _633 = _609 * _613;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _643;
    float _647 = _625 * _631;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _649;
    float _653 = fma(_637, _485, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = fma(_641, _485, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _657 = fma(_645, _497, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _659 = _595 * _647;
    float _661 = -_625;
    float _663 = _661 + 1.0;
    float _665 = _597 * _647;
    float _667 = fma(_651, _497, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _659);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _681 = fma(_671, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _683 = fma(_675, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _689;
    float _693 = fma(_653, _633, _677);
    float _695 = fma(_655, _633, _679);
    float _697 = fma(_687, _525, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _699 = fma(_691, _525, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _701 = fma(_657, _627, _693);
    float _703 = fma(_667, _627, _695);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _713 = fma(_681, _593, _701);
    float _715 = fma(_707, _543, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _717 = fma(_711, _543, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _719 = fma(_683, _593, _703);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _721;
    float _725 = fma(_697, _591, _713);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _727;
    float _731 = fma(_699, _591, _719);
    float _733 = fma(_723, _577, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _735 = fma(_715, _559, _725);
    float _737 = fma(_729, _577, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _739 = fma(_717, _559, _731);
    float _741 = fma(_733, _545, _735);
    float _743 = fma(_737, _545, _739);
    float _745 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[150].x, _741);
    float _747 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[150].y, _743);
    bool _749 = !_453;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _753 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_117);
        float _771 = 1.0 / _769;
        float _773 = _151 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _795 = _775 + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _805 = 1.0 / _799;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _809 = 1.0 / _803;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _811;
    float _815 = _779 * _805;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    bool _833 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _835 = isnan(_775);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = fma(_813, _815, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _847 = _843 * _831;
    float _849 = -_843;
    float _851 = _849 + 1.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _857;
    float _861 = _795 * _809;
    float _863 = _827 * _851;
    float _865 = fma(_855, _815, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _867 = fma(_859, _815, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _869 = -_827;
    float _871 = _869 + 1.0;
    float _873 = _845 * _863;
    float _875 = _865 * _863;
    float _877 = _867 * _863;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _891 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].x, _875);
    float _893 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].y, _873);
    float _895 = fma(_881, _861, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_885, _861, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_889, _861, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].z, _877);
    float _903 = fma(_895, _847, _891);
    float _905 = fma(_897, _847, _893);
    float _907 = fma(_899, _847, _901);
    float _909 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].x, _903);
    float _911 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].y, _905);
    float _913 = in.m_76.x;
    float _915 = in.m_76.y;
    float _917 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].z, _907);
    float _919 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _921 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _927;
    out.m_78.y = _929;
    out.m_78.z = _931;
    out.m_78.w = _925;
    float _933 = _747 * _915;
    float _935 = _745 * _913;
    bool _937 = !_807;
    float _955;
    float _957;
    if (!_937)
    {
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _941 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _943 = float(_117);
        float _945 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _947 = _945 * _939;
        float _949 = floor(_947);
        float _951 = -_949;
        float _953 = _947 + _951;
        _955 = _943;
        _957 = _953;
        _959 = true;
    }
    else
    {
        float _961 = float(_117);
        float _963 = 1.0 / _961;
        float _965 = _151 * _963;
        _955 = _961;
        _957 = _965;
    }
    _959 = false;
    float _967 = _955;
    float _969 = _957;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _973 = int(_971);
    float _975 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _977 = int(_975);
    float _979 = float(_973);
    float _981 = 1.0 / _967;
    float _983 = float(uint(_977));
    float _985 = 1.0 / _979;
    int _987 = ~_977;
    int _989 = _987 + 1;
    int _991 = ~_977;
    int _993 = _991 + 1;
    float _995 = 1.0 / _983;
    float _997 = _985 * _151;
    float _999 = trunc(_997);
    int _1001 = int(_999);
    int _1003 = as_type<int>(_995) + (-2);
    float _1005 = float(uint(_1001));
    float _1007 = as_type<float>(_1003) * _1005;
    float _1009 = trunc(_1007);
    float _1011 = precise::max(_1009, 0.0);
    uint _1014 = uint(_1011);
    float _1016 = float(_977);
    int _1018 = _989 * int(_1014);
    int _1020 = _1018 + _1001;
    float _1022 = float(uint(_1020));
    float _1024 = as_type<float>(_1003) * _1022;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1028 = _1026 != 0;
    bool _1030 = !_1028;
    float _1032 = _1030 ? 7.345489978790283203125 : 1.0;
    float _1034 = trunc(_1024);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = _1032 * _175;
    float _1042 = floor(_1040);
    int _1044 = int(_1014) + int(_1038);
    float _1046 = float(_1001);
    int _1048 = _993 * _1044;
    int _1050 = _1048 + _1001;
    bool _1052 = _1046 >= _1016;
    bool _1054 = isnan(_1046);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(_1016);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = -_1042;
    float _1066 = _1040 + _1064;
    bool _1068 = uint(_1050) >= uint(_977);
    float _1070 = trunc(_1062);
    int _1072 = int(_1070);
    float _1074 = _1066 * _1016;
    bool _1076 = !_1068;
    int _1078 = _1076 ? 0 : (-1);
    float _1080 = _1016 * _151;
    bool _1082 = _977 == 0;
    int _1084 = ~_1044;
    int _1086 = _1084 + _1078;
    int _1088 = _1086 + 1;
    float _1090 = _1080 * _981;
    int _1092 = _977 + (-1);
    float _1094 = trunc(_1074);
    int _1096 = int(_1094);
    int _1098 = _977 * _1088;
    int _1100 = _1098 + _1001;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1116 = _1114 != 0;
    int _1118 = ~_1072;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = trunc(_1090);
    int _1126 = int(_1124);
    bool _1128 = !_1082;
    int _1130 = _1128 ? _1100 : (-1);
    bool _1132 = !_1104;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1138 = _1136 != 0;
    int _1140 = _1130 * _1122;
    int _1142 = abs(_1134);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1146 = _1144 != 0;
    int _1148 = _1072 * _1092;
    int _1150 = _1148 + _1140;
    bool _1152 = !_1108;
    int _1154 = _1152 ? 0 : 1;
    bool _1156 = !_1116;
    int _1158 = _1156 ? 0 : 1;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    int _1164 = abs(_1154);
    bool _1166 = !_1112;
    int _1168 = _1166 ? 0 : 1;
    bool _1170 = !_1162;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1158);
    int _1176 = abs(_1168);
    int _1178 = _1150 * _1164;
    int _1180 = abs(_1172);
    int _1182 = _1096 * _1174;
    int _1184 = _1182 + _1001;
    int _1186 = _1126 * _1142;
    int _1188 = _1186 + _1178;
    int _1190 = ~_977;
    int _1192 = _1190 + 1;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1196 = _1194 != 0;
    int _1198 = _1184 * _1176;
    int _1200 = _1198 + _1188;
    int _1202 = _1096 * _1180;
    int _1204 = _1202 + _1200;
    float _1206 = float(uint(_1204));
    float _1208 = as_type<float>(_1003) * _1206;
    float _1210 = in.m_56.x;
    float _1212 = in.m_56.y;
    float _1214 = in.m_56.z;
    float _1216 = trunc(_1208);
    float _1218 = precise::max(_1216, 0.0);
    uint _1220 = uint(_1218);
    int _1222 = ~_977;
    int _1224 = _1222 + 1;
    int _1226 = _1192 * int(_1220);
    int _1228 = _1226 + _1204;
    float _1230 = float(uint(_1228));
    float _1232 = _201 * _1212;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1234;
    float _1238 = _207 * _1212;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1244 = as_type<float>(_1003) * _1230;
    float _1246 = _191 * _1212;
    float _1248 = in.m_63.y;
    float _1250 = 1.0 / _1236;
    float _1252 = fma(_205, _1210, _1238);
    float _1254 = fma(_189, _1210, _1246);
    float _1256 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1260 = _969 + _1258;
    float _1262 = trunc(_1244);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1270 = _1260 * _1250;
    float _1272 = fma(_199, _1210, _1232);
    float _1274 = fma(_193, _1214, _1254);
    float _1276 = fma(_203, _1214, _1272);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1280 = int(_1220) + int(_1266);
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1284 = 1.0 / _1242;
    float _1286 = -_1278;
    float _1288 = fma(_1256, 2.0, _1286);
    float _1290 = in.m_70.w;
    int _1292 = _1224 * _1280;
    int _1294 = _1292 + _1204;
    float _1296 = fma(_1282, -2.0, _1268);
    float _1298 = float(uint(_1184));
    float _1300 = -_151;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1288);
    bool _1304 = uint(_1294) >= uint(_977);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1308 = _969 + _1306;
    float _1310 = fma(_209, _1214, _1252);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1312;
    bool _1316 = !_1304;
    int _1318 = _1316 ? 0 : (-1);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1324 = _175 > 0.5;
    float _1326 = _1308 * _1284;
    int _1328 = ~_1280;
    int _1330 = _1328 + _1318;
    int _1332 = _1330 + 1;
    float _1334 = in.m_72.w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1340;
    float _1344 = fma(_1314, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1346 = -_363;
    int _1348 = _1324 ? as_type<int>(_1346) : as_type<int>(_363);
    float _1350 = fma(_1338, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1352 = fma(_1342, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1354 = _977 * _1332;
    int _1356 = _1354 + _1204;
    float _1358 = as_type<float>(_1003) * _1298;
    bool _1360 = !_1146;
    float _1362 = _1360 ? _363 : as_type<float>(_1348);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1372 = !_1082;
    int _1374 = _1372 ? _1356 : (-1);
    float _1376 = _1274 + _1290;
    float _1378 = trunc(_1358);
    float _1380 = precise::max(_1378, 0.0);
    uint _1382 = uint(_1380);
    float _1384 = _1362 + 0.5;
    float _1386 = fma(_1322, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1388 = fma(_1366, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1390 = fma(_1370, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1392 = ~_977;
    int _1394 = _1392 + 1;
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1302);
    bool _1398 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1400 = isnan(_969);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = in.m_74.w;
    bool _1412 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1414 = isnan(_969);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = _1276 + _1334;
    int _1426 = _1374 >> 31;
    bool _1428 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1430 = isnan(_969);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    int _1440 = _1426 & 3;
    int _1442 = _1394 * int(_1382);
    int _1444 = _1442 + _1184;
    float _1446 = -_1408;
    float _1448 = _1446 + 1.0;
    bool _1450 = _1248 > 0.5;
    int _1452 = _1374 + _1440;
    float _1454 = float(uint(_1444));
    float _1456 = _1422 * _1448;
    int _1458 = _1452 >> 2;
    float _1460 = -_1422;
    float _1462 = _1460 + 1.0;
    float _1464 = -_269;
    int _1466 = _1450 ? as_type<int>(_1464) : as_type<int>(_269);
    float _1468 = as_type<float>(_1003) * _1454;
    int _1470 = _1458 << 4;
    int _1472 = _1470 + 368;
    float _1474 = _1438 * _1462;
    bool _1476 = !_1196;
    float _1478 = _1476 ? _269 : as_type<float>(_1466);
    float _1480 = trunc(_1468);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    uint _1486 = uint(int(uint(_1472) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[int(_1496)][_1498];
    float _1502 = _1310 + _1410;
    float _1504 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1296);
    float _1506 = -_1438;
    float _1508 = _1506 + 1.0;
    float _1510 = _1350 * _1474;
    float _1512 = _1478 + (-0.5);
    float _1514 = _1344 * _1474;
    float _1516 = _1352 * _1474;
    float _1518 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1510);
    float _1520 = -_1512;
    float _1522 = -_1504;
    float _1524 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1522);
    int _1526 = _1374 & 3;
    bool _1528 = _1526 != 0;
    float _1530 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1514);
    float _1532 = fma(_1388, _1456, _1518);
    float _1534 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1516);
    bool _1536 = uint(_1526) > 1u;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1540 = _1424 + _1538;
    int _1542 = int(_1382) + int(_1484);
    float _1544 = fma(_1386, _1456, _1530);
    int _1546 = _1472 + 8;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = _1374 & 3;
    bool _1566 = _1564 != 0;
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1570 = _1376 + _1568;
    float _1572 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1574 = fma(_1390, _1456, _1534);
    int _1576 = _1566 ? 0 : 1;
    float _1578 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1544);
    float _1580 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1572);
    int _1582 = ~_977;
    int _1584 = _1582 + 1;
    float _1586 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1532);
    int _1588 = ~_1576;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    float _1594 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1574);
    int _1596 = _1592;
    float _1598 = _1478;
    if (!_1536)
    {
        int _1600 = ~_1576;
        int _1602 = _1600 + 1;
        _1596 = _1602;
    }
    int _1604 = _1596;
    int _1606 = _1584 * _1542;
    int _1608 = _1606 + _1184;
    bool _1610 = _1526 != 3;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1614 = _1502 + _1612;
    bool _1616 = !_1528;
    int _1618 = _1616 ? 0 : 1;
    int _1620 = abs(_1604);
    float _1622 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1580);
    bool _1624 = uint(_1526) >= 2u;
    int _1626 = abs(_1618);
    int _1628 = ~_1620;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    bool _1634 = uint(_1608) >= uint(_977);
    int _1636 = _1624 ? 0 : 1;
    int _1638 = ~_1626;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    int _1644 = _1632 * as_type<int>(_1500);
    bool _1646 = !_1634;
    int _1648 = _1646 ? 0 : (-1);
    int _1650 = ~_1636;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1642 * as_type<int>(_1492);
    int _1658 = _1656 + _1644;
    bool _1660 = _1526 != 3;
    int _1662 = _1654;
    if (_1610)
    {
        int _1664 = ~_1636;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    bool _1670 = !_1660;
    int _1672 = _1670 ? 0 : (-1);
    int _1674 = abs(_1668);
    bool _1676 = !_1138;
    int _1678 = _1676 ? 0 : 1;
    int _1680 = abs(_1672);
    int _1682 = ~_1542;
    int _1684 = _1682 + _1648;
    int _1686 = _1684 + 1;
    int _1688 = abs(_1678);
    int _1690 = _977 * _1686;
    int _1692 = _1690 + _1184;
    int _1694 = ~_1674;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    int _1700 = ~_1680;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    int _1706 = _1698 * as_type<int>(_1554);
    int _1708 = _1706 + _1658;
    bool _1710 = _1622 >= 0.0;
    int _1712 = _1704 * as_type<int>(_1562);
    int _1714 = _1712 + _1708;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1718 = _1540 * _1540;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1722 = !_1082;
    int _1724 = _1722 ? _1692 : (-1);
    float _1726 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1716);
    float _1728 = fma(_1570, _1570, _1718);
    float _1730 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1720);
    int _1732 = ~_1688;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1726);
    float _1740 = fma(_1614, _1614, _1728);
    float _1742 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1730);
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1746 = _1744 != 0;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1750 = _1748 != 0;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1754 = _1752 != 0;
    float _1756 = -_1738;
    float _1758 = _1756 + 1.0;
    int _1760 = _1714 * _1736;
    float _1762 = -_1742;
    float _1764 = _1762 + 1.0;
    float _1766 = rsqrt(_1740);
    float _1768 = fma(_1478, _1758, _1524);
    int _1770 = _1724 * _1688;
    int _1772 = _1770 + _1760;
    float _1774 = -_1764;
    float _1776 = fma(_1362, _1774, _1396);
    if (_1710)
    {
        _1598 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1778 = _1598;
    float _1780 = _1578 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1784 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1792 = as_type<int>(_1778);
    float _1794 = _1790;
    if (_1710)
    {
        float _1796 = _1778 * 5.0;
        _1792 = as_type<int>(_1796);
    }
    int _1798 = _1792;
    float _1800 = float(_1772);
    out.m_80.x = _1776;
    out.m_80.y = _1768;
    bool _1802 = !_1750;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = _1540 * _1766;
    bool _1808 = !_1754;
    int _1810 = _1808 ? 0 : 1;
    out.m_82.x = _1786;
    out.m_82.y = _1788;
    out.m_82.z = _1790;
    bool _1812 = !_1746;
    int _1814 = _1812 ? 0 : 1;
    float _1816 = _1570 * _1766;
    float _1818 = _1806;
    if (_1710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6727 = as_type<float>(_1798);
        out.gl_Position.z = _6727;
    }
    out.m_84.x = _1800;
    if (_1710)
    {
        out.m_59.x = 0.0;
    }
    if (_1710)
    {
        return out;
    }
    float _1820 = -_1806;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1824 = _1614 * _1766;
    float _1826 = -_1816;
    float _1828 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1832 = _1822 + _1830;
    float _1834 = -_1824;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1502);
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = _1828 + _1838;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1836 + _1844;
    float _1848 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1842);
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1848);
    bool _1852 = _1850 >= 0.0;
    float _1854 = _1840;
    float _1856 = _1822;
    float _1858 = _1846;
    if (_1852)
    {
        _1794 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1860 = _1794;
    int _1862 = as_type<int>(_1860);
    if (_1852)
    {
        out.m_59.x = 0.0;
    }
    if (_1852)
    {
        float _1864 = _1860 * 5.0;
        _1862 = as_type<int>(_1864);
    }
    int _1866 = _1862;
    if (_1852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6826 = as_type<float>(_1866);
        out.gl_Position.z = _6826;
    }
    if (_1852)
    {
        return out;
    }
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1870 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1872 = floor(_1868);
    float _1874 = floor(_1870);
    float _1876 = -_1872;
    float _1878 = _1868 + _1876;
    float _1880 = -_1874;
    float _1882 = _1870 + _1880;
    float2 _6862 = float2(_1878, _1882);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6862, float2(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6862, float2(0.0), isnan(_6862)), level(0.0)).x;
    float _1886 = in.m_63.z;
    float _1888 = _175 * 2.0;
    float _1890 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1892 = log2(_1890);
    float _1894 = _175 + _1248;
    float _1896 = _1248 * 2.0;
    float _1898 = _1894 + (-1.0);
    int _1900 = abs(_1804);
    float _1902 = -_1806;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1906 = floor(_1888);
    int _1908 = abs(_1814);
    float _1910 = -_1816;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1570);
    float _1914 = float(_1900);
    float _1916 = _1904 * _1904;
    float _1918 = float(_1908);
    float _1920 = -_1824;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1924 = _371 * _933;
    float _1926 = _367 * _935;
    float _1928 = _1886 * 2.0;
    float _1930 = _1248 + _1886;
    bool _1932 = _1906 > 0.0;
    float _1934 = _1892 * _151;
    float _1936 = floor(_1928);
    float _1938 = _1930 + (-1.0);
    bool _1940 = _1906 >= 0.0;
    bool _1942 = isnan(_1906);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = _1248 + (-0.5);
    float _1952 = fma(_1912, _1912, _1916);
    float _1954 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1956 = exp2(_1934);
    float _1958 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1960 = _1948 ? 0 : 1;
    float _1962 = in.m_86.x;
    float _1964 = in.m_86.y;
    float _1966 = in.m_86.z;
    float _1968 = fma(_1922, _1922, _1952);
    int _1970 = ~_1960;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    float _1976 = floor(_1896);
    bool _1978 = _1936 > 0.0;
    bool _1980 = _1936 >= 0.0;
    bool _1982 = isnan(_1936);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan(0.0);
    bool _1988 = _1984 || _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1992 = 1.0 + _1990;
    int _1994 = _1974;
    int _1996 = 2;
    if (!_1932)
    {
        int _1998 = ~_1960;
        int _2000 = _1998 + 1;
        _1994 = _2000;
    }
    int _2002 = _1994;
    bool _2004 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2006 = isnan(0.0);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2012 = _2008 || _2010;
    float _2014 = 1.0 / _1992;
    float _2016 = float(_2002);
    float _2018 = -_1956;
    float _2020 = _2018 + 1.0;
    int _2022 = _1988 ? 0 : 1;
    bool _2024 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2026 = isnan(1.0);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2032 = _2028 || _2030;
    float _2034 = _1914 * _2016;
    int _2036 = ~_2022;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2040;
    if (!_1978)
    {
        int _2044 = ~_2022;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = _2034 * (-2.0);
    bool _2052 = _1976 > 0.0;
    float _2054 = _2012 ? _2020 : 0.0;
    float _2056 = fma(_2050, _1964, _1964);
    bool _2058 = _1976 >= 0.0;
    bool _2060 = isnan(_1976);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan(0.0);
    bool _2066 = _2062 || _2064;
    float _2068 = fma(_1954, _2050, _1954);
    float _2070 = float(_2048);
    if (_2032)
    {
        float _2072 = _2054 * _2014;
        _153 = _2072;
    }
    float _2074 = _153;
    int _2076 = _2066 ? 0 : 1;
    float _2078 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2056);
    int _2080 = abs(_1810);
    float _2082 = _1918 * _2070;
    int _2084 = ~_2076;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_2068, _2074, _2078);
    int _2092 = _2088;
    if (!_2052)
    {
        int _2094 = ~_2076;
        int _2096 = _2094 + 1;
        _2092 = _2096;
    }
    int _2098 = _2092;
    float _2100 = _2082 * (-2.0);
    float _2102 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2104 = _2090 * 0.15915493667125701904296875;
    float _2106 = float(_2080);
    float _2108 = fma(_1958, _2100, _1958);
    float _2110 = float(_2098);
    float _2112 = fma(_2100, _1962, _1962);
    float _2114 = _175 + (-0.5);
    float _2116 = _175 + _1886;
    float _2118 = _1886 + (-0.5);
    float _2120 = _2106 * _2110;
    float _2122 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2112);
    float _2124 = _2116 + (-1.0);
    float _2126 = _2120 * (-2.0);
    float _2128 = fma(_2108, _2074, _2122);
    float _2130 = _2104 * 6.283185482025146484375;
    float _2132 = sin(_2130);
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = fma(_2126, _1966, _1966);
    float _2138 = _2128 * 0.15915493667125701904296875;
    float _2140 = _1822 + _2102;
    float _2142 = fma(_2134, _2126, _2134);
    float _2144 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2136);
    float _2146 = _2104 * 6.283185482025146484375;
    float _2148 = cos(_2146);
    float _2150 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2152 = fma(_2142, _2074, _2144);
    float _2154 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2150);
    float _2156 = _2152 * 0.15915493667125701904296875;
    float _2158 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2160 = _2138 * 6.283185482025146484375;
    float _2162 = sin(_2160);
    float _2164 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2154);
    float _2166 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2158);
    float _2168 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2170 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2166);
    float _2172 = _2138 * 6.283185482025146484375;
    float _2174 = cos(_2172);
    float _2176 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2178 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2180 = _2156 * 6.283185482025146484375;
    float _2182 = sin(_2180);
    float _2184 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2178);
    float _2186 = _2162 * _2148;
    float _2188 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2184);
    float _2190 = 1.0 / _2176;
    float _2192 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2194 = _2162 * _2132;
    float _2196 = _2174 * _2148;
    float _2198 = _2192 + _2176;
    float _2200 = _2156 * 6.283185482025146484375;
    float _2202 = cos(_2200);
    float _2204 = fma(_2182, _2196, _2194);
    float _2206 = fma(_2182, _2194, _2196);
    float _2208 = _2174 * _2132;
    float _2210 = -_2208;
    float _2212 = fma(_2182, _2186, _2210);
    float _2214 = sqrt(_1968);
    float _2216 = _2198 * _2190;
    float _2218 = _2216 * 0.5;
    float _2220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _269);
    float _2222 = -_2186;
    float _2224 = fma(_2182, _2208, _2222);
    float _2226 = _2174 * _2202;
    float _2228 = _2148 * _2202;
    float _2230 = _2162 * _2202;
    float _2232 = _2132 * _2202;
    float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2236 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2234);
    float _2238 = trunc(_2168);
    int _2240 = int(_2238);
    float _2242 = _1766 * _2214;
    float _2244 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2246 = 1.0 / _2236;
    float _2248 = _2242 * _2244;
    float _2250 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2252 = _2220 * _2248;
    float _2254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _363);
    float _2256 = _2242 * _2250;
    int _2258 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2260 = _2240 + _2258;
    int _2262 = _2260 + 1;
    float _2264 = _2226 * _2252;
    float _2266 = -_2252;
    float _2268 = _2182 * _2266;
    float _2270 = _2254 * _2256;
    float _2272 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2274 = _2230 * _2252;
    float _2276 = fma(_2204, _2270, _2264);
    float _2278 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2272);
    float _2280 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2282 = _2280 * 0.5;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2286 = _2246 * _2284;
    float _2288 = fma(_2228, _2270, _2268);
    float _2290 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2278);
    float _2292 = fma(_2224, _2282, _2276);
    float _2294 = fma(_2212, _2270, _2274);
    bool _2296 = _2286 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2298 = fma(_2232, _2282, _2288);
    bool _2300 = _2286 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2302 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2304 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2306 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2308 = fma(_2206, _2282, _2294);
    float _2310 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2302);
    float _2312 = trunc(_2304);
    int _2314 = int(_2312);
    float _2316 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    bool _2318 = !_2296;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    float _2324 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2326 = as_type<int>(_2324);
    int _2328 = as_type<int>(_2308);
    float _2330 = _2304;
    if (!_2296)
    {
        _1996 = 1;
    }
    int _2332 = _1996;
    float _2334 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    int _2336 = _2332;
    if (!_2300)
    {
        _2336 = _2320;
    }
    int _2338 = _2336;
    float _2340 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2342 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2324);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2346 = _2338 << 6;
    float _2348 = _1502 + _2340;
    float _2350 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2342);
    float _2352 = _1376 + _2344;
    int _2354 = _2346 + 48;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c15)._m0[int(_2358)][_2360];
    int _2364 = int(_2356) + 1;
    uint _2366 = uint(int(uint(_2364) >> uint(2)));
    int _2368 = _2364 & 3;
    float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2374 = _2348 + _2372;
    int _2376 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2378 = _2314 + _2376;
    int _2380 = _2378 + 1;
    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2384 = _2352 + _2382;
    float _2386 = _2350 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2388 = _2374 * _2374;
    int _2390 = _2380 | _2262;
    int _2392 = _2346 + 56;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    uint _2396 = uint(int(uint(int(_2394)) >> uint(2)));
    int _2398 = int(_2394) & 3;
    float _2400 = (*spvDescriptorSet0.vp_c15)._m0[int(_2396)][_2398];
    int _2402 = int(_2394) + 1;
    uint _2404 = uint(int(uint(_2402) >> uint(2)));
    int _2406 = _2402 & 3;
    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
    bool _2410 = _2380 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2412 = fma(_2384, _2384, _2388);
    bool _2414 = _2390 < 0;
    bool _2416 = _2414 || _2410;
    float _2418 = sqrt(_2412);
    int _2420 = _2346 + 64;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    uint _2424 = uint(int(uint(int(_2422)) >> uint(2)));
    int _2426 = int(_2422) & 3;
    float _2428 = (*spvDescriptorSet0.vp_c15)._m0[int(_2424)][_2426];
    int _2430 = int(_2422) + 1;
    uint _2432 = uint(int(uint(_2430) >> uint(2)));
    int _2434 = _2430 & 3;
    float _2436 = (*spvDescriptorSet0.vp_c15)._m0[int(_2432)][_2434];
    bool _2438 = _2262 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2440 = _2438 || _2416;
    int _2442 = _2346 + 72;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    uint _2446 = uint(int(uint(int(_2444)) >> uint(2)));
    int _2448 = int(_2444) & 3;
    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[int(_2446)][_2448];
    int _2452 = int(_2444) + 1;
    uint _2454 = uint(int(uint(_2452) >> uint(2)));
    int _2456 = _2452 & 3;
    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[int(_2454)][_2456];
    int _2460 = as_type<int>(_2388);
    float _2462 = _2352;
    float _2464 = _2348;
    if (!_2440)
    {
        int _2466 = _2262 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2468 = _2466 + _2380;
        _2326 = _2468;
    }
    int _2470 = _2326;
    bool _2472 = _2418 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2474 = _2346 + 96;
    uint _2476 = uint(int(uint(_2474) >> uint(2)));
    uint _2478 = uint(int(uint(int(_2476)) >> uint(2)));
    int _2480 = int(_2476) & 3;
    float _2482 = (*spvDescriptorSet0.vp_c15)._m0[int(_2478)][_2480];
    int _2484 = int(_2476) + 1;
    uint _2486 = uint(int(uint(_2484) >> uint(2)));
    int _2488 = _2484 & 3;
    float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
    float _2492 = _1424 + _2386;
    float _2494 = _2492;
    float _2496 = _2418;
    if (!_2440)
    {
        int _2498 = _2470 << 2;
        _2328 = _2498;
    }
    int _2500 = _2328;
    int _2502 = _2500;
    if (!_2440)
    {
        uint _2504 = uint(int(uint(_2470) >> uint(2)));
        _2460 = int(_2504);
    }
    int _2506 = _2460;
    float _2508 = as_type<float>(_2506);
    if (!_2440)
    {
        int _2510 = 12 & _2500;
        _2502 = _2510;
    }
    int _2512 = _2502;
    int _2514 = _2346 + 104;
    uint _2516 = uint(int(uint(_2514) >> uint(2)));
    uint _2518 = uint(int(uint(int(_2516)) >> uint(2)));
    int _2520 = int(_2516) & 3;
    float _2522 = (*spvDescriptorSet0.vp_c15)._m0[int(_2518)][_2520];
    int _2524 = int(_2516) + 1;
    uint _2526 = uint(int(uint(_2524) >> uint(2)));
    int _2528 = _2524 & 3;
    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[int(_2526)][_2528];
    float _2532 = as_type<float>(_2512);
    if (!_2440)
    {
        int _2534 = _2506 << 4;
        int _2536 = _2534 + _2512;
        _2508 = as_type<float>(_2536);
    }
    float _2538 = _2508;
    bool _2540 = !_2472;
    if (!_2540)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2546 = _2418 + _2544;
        float _2548 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = rsqrt(_2412);
        float _2552 = _2546 * _2542;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = _2554 * 6.283185482025146484375;
        float _2558 = cos(_2556);
        float _2560 = _2554 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = _2558 + (-1.0);
        float _2566 = fma(_2562, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2570 = _2550 * _2566;
        float _2572 = fma(_2492, _2558, _2568);
        float _2574 = fma(_2384, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2576 = fma(_2374, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2494 = _2572;
        _2462 = _2574;
        _2464 = _2576;
        _2496 = _2564;
        _2532 = _2562;
    }
    float _2578 = _2494;
    float _2580 = _2462;
    float _2582 = _2464;
    float _2584 = _2496;
    float _2586 = _2532;
    float _2588 = -_1424;
    float _2590 = _2588 + _2578;
    int _2592 = _2346 + 80;
    uint _2594 = uint(int(uint(_2592) >> uint(2)));
    uint _2596 = uint(int(uint(int(_2594)) >> uint(2)));
    int _2598 = int(_2594) & 3;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
    int _2602 = int(_2594) + 1;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    int _2606 = _2602 & 3;
    float _2608 = (*spvDescriptorSet0.vp_c15)._m0[int(_2604)][_2606];
    float _2610 = -_1376;
    float _2612 = _2610 + _2580;
    float _2614 = -_1502;
    float _2616 = _2614 + _2582;
    float _2618 = _2590 * _2590;
    float _2620 = _2140 * _2490;
    float _2622 = _2586;
    float _2624 = _2584;
    float _2626 = _2580;
    float _2628 = _2578;
    float _2630 = _2582;
    if (!_2440)
    {
        float _2632 = floor(_2304);
        _2622 = _2632;
    }
    float _2634 = _2622;
    float _2636 = _2140 * _2436;
    float _2638 = fma(_2612, _2612, _2618);
    int _2640 = _2346 + 88;
    uint _2642 = uint(int(uint(_2640) >> uint(2)));
    uint _2644 = uint(int(uint(int(_2642)) >> uint(2)));
    int _2646 = int(_2642) & 3;
    float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
    int _2650 = int(_2642) + 1;
    uint _2652 = uint(int(uint(_2650) >> uint(2)));
    int _2654 = _2650 & 3;
    float _2656 = (*spvDescriptorSet0.vp_c15)._m0[int(_2652)][_2654];
    float _2658 = fma(_1828, _2482, _2620);
    float _2660 = fma(_1828, _2428, _2636);
    float _2662 = fma(_2616, _2616, _2638);
    float _2664 = fma(_1836, _2522, _2658);
    if (!_2440)
    {
        float _2666 = floor(_2168);
        _2624 = _2666;
    }
    float _2668 = _2624;
    bool _2670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2672 = isnan(0.5);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2678 = _2674 || _2676;
    float _2680 = _2538;
    if (!_2440)
    {
        int _2682 = as_type<int>(_2538) + 400;
        uint _2684 = uint(int(uint(_2682) >> uint(2)));
        uint _2686 = uint(int(uint(int(_2684)) >> uint(2)));
        int _2688 = int(_2684) & 3;
        float _2690 = (*spvDescriptorSet0.vp_c15)._m0[int(_2686)][_2688];
        _2680 = _2690;
    }
    float _2692 = _2680;
    float _2694 = _2664 + _2530;
    float _2696 = _2140 * _2370;
    float _2698 = fma(_1836, _2450, _2660);
    float _2700 = sqrt(_2662);
    float _2702 = fma(_1828, _2362, _2696);
    float _2704 = fma(_1836, _2400, _2702);
    float _2706 = 1.0 / _2694;
    bool _2708 = _2700 > 0.0;
    bool _2710 = !_2708;
    if (!_2710)
    {
        float _2712 = _357 * _357;
        float _2714 = rsqrt(_2662);
        float _2716 = fma(_245, _245, _2712);
        float _2718 = fma(_359, _359, _2716);
        float _2720 = sqrt(_2718);
        float _2722 = _2612 * _2714;
        float _2724 = _2590 * _2714;
        float _2726 = _2616 * _2714;
        bool _2728 = _2720 > 0.0;
        bool _2730 = !_2728;
        if (!_2730)
        {
            float _2732 = rsqrt(_2718);
            float _2734 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2736 = _357 * _2732;
            float _2738 = _245 * _2732;
            float _2740 = _2724 * _2736;
            float _2742 = _359 * _2732;
            float _2744 = fma(_2722, _2738, _2740);
            float _2746 = _2734 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2748 = fma(_2726, _2742, _2744);
            float _2750 = _2748 * _2746;
            float _2752 = fma(_245, _2750, _2580);
            float _2754 = fma(_357, _2750, _2578);
            float _2756 = fma(_359, _2750, _2582);
            _2626 = _2752;
            _2628 = _2754;
            _2630 = _2756;
        }
    }
    float _2758 = _2626;
    float _2760 = _2628;
    float _2762 = _2630;
    float _2764 = -_1816;
    float _2766 = fma(_2764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2758);
    float _2768 = -_1806;
    float _2770 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2760);
    float _2772 = -_1824;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2762);
    float _2776 = _2704 + _2408;
    float _2778 = _2698 + _2458;
    float _2780 = _2770;
    float _2782 = _2766;
    float _2784 = _2774;
    if (!_2678)
    {
        float _2786 = _1832 * _1832;
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2790 = -_1376;
        float _2792 = _2790 + _2758;
        float _2794 = -_1424;
        float _2796 = _2794 + _2760;
        float _2798 = fma(_1840, _1840, _2786);
        float _2800 = -_1502;
        float _2802 = _2800 + _2762;
        float _2804 = fma(_1846, _1846, _2798);
        float _2806 = 1.0 / _2242;
        float _2808 = sqrt(_2804);
        float _2810 = _2792 * _2806;
        float _2812 = _2796 * _2806;
        float _2814 = _2802 * _2806;
        bool _2816 = _2808 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2818 = isnan(_2808);
        bool _2820 = _2816 || _2818;
        bool _2822 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2824 = _2820 || _2822;
        float _2826 = precise::min(_2808, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2828 = _2826 * _2788;
        float _2830 = fma(_2810, _2828, _1828);
        float _2832 = fma(_2812, _2828, _1822);
        float _2834 = _2766;
        float _2836 = _2808;
        float _2838 = _2828;
        float _2840 = _2832;
        if (_2824)
        {
            float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2834 = _2842;
        }
        float _2844 = _2834;
        if (_2824)
        {
            float _2846 = precise::max(_2808, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2836 = _2846;
        }
        float _2848 = _2836;
        float _2850 = fma(_2814, _2828, _1836);
        float _2852 = _2844;
        _2784 = _2850;
        _1854 = _2848;
        if (_2824)
        {
            float _2854 = _2848 * _2844;
            _2838 = _2854;
        }
        float _2856 = _2838;
        if (!_2824)
        {
            _2852 = _2830;
        }
        float _2858 = _2852;
        float _2860 = _2858;
        if (_2824)
        {
            float _2862 = fma(_2812, _2856, _1822);
            _2840 = _2862;
        }
        float _2864 = _2840;
        _2780 = _2864;
        if (_2824)
        {
            float _2866 = fma(_2810, _2856, _1828);
            _2860 = _2866;
        }
        float _2868 = _2860;
        _2782 = _2868;
        if (_2824)
        {
            float _2870 = fma(_2814, _2856, _1836);
            _2784 = _2870;
        }
    }
    float _2872 = _2780;
    float _2874 = _2782;
    float _2876 = _2784;
    float _2878 = _1854;
    float _2880 = _2776 * _2706;
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2884 = _2778 * _2706;
    float _2886 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2888 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2890 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2882);
    bool _2892 = _2880 >= 0.0;
    float _2894 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2886);
    float _2896 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2888);
    float _2898 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2890);
    float _2900 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2902 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2894);
    float _2904 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2896);
    float _2906 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2908 = _2880 <= 1.0;
    bool _2910 = _2908 && _2892;
    float _2912 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2914 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2900);
    float _2916 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2918 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2920 = _2884 >= 0.0;
    bool _2922 = _2920 && _2910;
    float _2924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2926 = _2912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2928 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2914);
    float _2930 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2918);
    bool _2932 = _2884 <= 1.0;
    bool _2934 = _2932 && _2922;
    float _2936 = -_2926;
    float _2938 = fma(_2936, _2924, 1.0);
    float _2940 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2942 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2930);
    float _2944 = _2140 * _2608;
    float _2946 = log2(_2938);
    float _2948 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2950 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2942);
    float _2952 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2954 = fma(_1828, _2600, _2944);
    float _2956 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2948);
    float _2958 = _2944;
    float _2960 = _2938;
    float _2962 = _2878;
    if (!_2440)
    {
        float _2964 = -_2668;
        float _2966 = _2168 + _2964;
        _1818 = _2966;
    }
    float _2968 = _1818;
    float _2970 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2952);
    float _2972 = 1.0 / _2950;
    if (_2934)
    {
        float _2974 = float(_2338);
        _2958 = _2974;
    }
    float _2976 = _2958;
    float _2978 = fma(_1836, _2648, _2954);
    float _2980 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2956);
    float _2982 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2970);
    if (!_2440)
    {
        float _2984 = -_2634;
        float _2986 = _2304 + _2984;
        _2960 = _2986;
    }
    float _2988 = _2960;
    float _2990 = _2978 + _2656;
    float _2992 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2980);
    float _2994 = _2698;
    float _2996 = _2992;
    if (!_2440)
    {
        float _2998 = rint(_2692);
        float _3000 = precise::max(_2998, 0.0);
        uint _3002 = uint(_3000);
        uint _3004 = clamp(_3002, 0u, 65535u);
        _2994 = as_type<float>(_3004);
    }
    float _3006 = _2994;
    float _3008 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2982);
    float _3010 = _2946 * 0.693147182464599609375;
    float _3012 = _2990 * _2706;
    float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = _2976;
    if (_2934)
    {
        float _3018 = rint(_2976);
        float _3020 = precise::max(_3018, 0.0);
        uint _3022 = uint(_3020);
        uint _3024 = clamp(_3022, 0u, 65535u);
        _3016 = as_type<float>(_3024);
    }
    float _3026 = _3016;
    float _3028 = _2992 * _2972;
    float _3030 = _3008 * _2972;
    float _3032 = fma(_3028, 0.5, 0.5);
    float _3034 = fma(_3030, -0.5, 0.5);
    float _3036 = _2968;
    float _3038 = _3034;
    float _3040 = _3032;
    if (!_2440)
    {
        float3 _8696 = float3(_2988, _2968, float(as_type<int>(_3006)));
        float3 _8700 = select(_8696, float3(0.0), isnan(_8696));
        float _3042 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8700.xy, uint(rint(_8700.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8700.xy, uint(rint(_8700.z)), level(0.0)).x;
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = _2884;
    if (_2934)
    {
        float3 _8715 = float3(_2880, _2884, float(as_type<int>(_3026)));
        float3 _8717 = select(_8715, float3(0.0), isnan(_8715));
        float _3048 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8717.xy, uint(rint(_8717.z)), _3012, level(0.0));
        _3046 = _3048;
    }
    float _3050 = _3046;
    float3 _8727 = float3(_3032, _3034, _3014);
    float _3052 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8727, float3(0.0), isnan(_8727)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8727, float3(0.0), isnan(_8727)), level(0.0)).x;
    float3 _8736 = float3(_3032, _3034, _3014);
    float4 _3055 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8736, float3(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8736, float3(0.0), isnan(_8736)), level(0.0)).xyzw;
    float _3057 = _3055.x;
    float _3059 = _3055.y;
    float _3061 = _3055.z;
    float _3063 = _3055.w;
    bool _3065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3067 = isnan(0.5);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3073 = _3069 || _3071;
    if (_2440)
    {
        _1856 = 1.0;
    }
    float _3075 = _1856;
    float _3077 = _3075;
    if (_3073)
    {
        _1858 = 1.0;
    }
    float _3079 = _1858;
    float _3081 = _3079;
    if (_3073)
    {
        _2962 = 1.0;
    }
    float _3083 = _2962;
    float _3085 = _3083;
    float _3087 = _3057;
    if (!_3073)
    {
        float _3089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3091 = _3089 * 0.15915493667125701904296875;
        float _3093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3095 = _3091 * 6.283185482025146484375;
        float _3097 = cos(_3095);
        float _3099 = _3093 * 0.15915493667125701904296875;
        float _3101 = _3091 * 6.283185482025146484375;
        float _3103 = sin(_3101);
        float _3105 = 1.0 / _3097;
        float _3107 = _3099 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = _3103 * _3105;
        float _3113 = _3099 * 6.283185482025146484375;
        float _3115 = sin(_3113);
        float _3117 = _3109 * _3111;
        float _3119 = 1.0 / _3117;
        float _3121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3121;
        float _3125 = 1.0 / _3123;
        float _3127 = _3115 * _3119;
        float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3131 = fma(_2286, _3127, _3129);
        float _3133 = _3131 * _3125;
        float _3135 = precise::clamp(_3133, 0.0, 1.0);
        _3038 = _3091;
        _3040 = _3099;
        _3085 = _3135;
    }
    float _3137 = _3038;
    float _3139 = _3040;
    float _3141 = _3085;
    float _3143 = _3137;
    float _3145 = _3139;
    if (!_3073)
    {
        float _3147 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3149 = _3147 * 0.15915493667125701904296875;
        float _3151 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3153 = _3149 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        float _3157 = _3151 * 0.15915493667125701904296875;
        float _3159 = _3149 * 6.283185482025146484375;
        float _3161 = sin(_3159);
        float _3163 = 1.0 / _3155;
        float _3165 = _3157 * 6.283185482025146484375;
        float _3167 = cos(_3165);
        float _3169 = _3161 * _3163;
        float _3171 = _3157 * 6.283185482025146484375;
        float _3173 = sin(_3171);
        float _3175 = _3167 * _3169;
        float _3177 = 1.0 / _3175;
        float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3181 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3179;
        float _3183 = 1.0 / _3181;
        float _3185 = _3173 * _3177;
        float _3187 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3189 = fma(_2286, _3185, _3187);
        float _3191 = _3189 * _3183;
        float _3193 = precise::clamp(_3191, 0.0, 1.0);
        float _3195 = -_3193;
        float _3197 = _3195 + 1.0;
        _3143 = _3163;
        _3145 = _3175;
        _3081 = _3197;
    }
    float _3199 = _3143;
    float _3201 = _3145;
    float _3203 = _3081;
    float _3205 = _3201;
    float _3207 = _3199;
    if (!_2440)
    {
        int _3209 = _2470 << 4;
        int _3211 = _3209 + 2048;
        uint _3213 = uint(int(uint(_3211) >> uint(2)));
        uint _3215 = uint(int(uint(int(_3213)) >> uint(2)));
        int _3217 = int(_3213) & 3;
        float _3219 = (*spvDescriptorSet0.vp_c15)._m0[int(_3215)][_3217];
        int _3221 = int(_3213) + 1;
        uint _3223 = uint(int(uint(_3221) >> uint(2)));
        int _3225 = _3221 & 3;
        float _3227 = (*spvDescriptorSet0.vp_c15)._m0[int(_3223)][_3225];
        int _3229 = _3211 + 8;
        uint _3231 = uint(int(uint(_3229) >> uint(2)));
        uint _3233 = uint(int(uint(int(_3231)) >> uint(2)));
        int _3235 = int(_3231) & 3;
        float _3237 = (*spvDescriptorSet0.vp_c15)._m0[int(_3233)][_3235];
        int _3239 = int(_3231) + 1;
        uint _3241 = uint(int(uint(_3239) >> uint(2)));
        int _3243 = _3239 & 3;
        float _3245 = (*spvDescriptorSet0.vp_c15)._m0[int(_3241)][_3243];
        float _3247 = _2140 * _3227;
        float _3249 = fma(_1828, _3219, _3247);
        float _3251 = fma(_1836, _3237, _3249);
        float _3253 = _3251 + _3245;
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        float _3257 = -_3255;
        float _3259 = _3257 + _3044;
        float _3261 = fma(_3259, 500.0, 1.5);
        float _3263 = exp2(_3261);
        float _3265 = 0.0 + _3263;
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        _3077 = _3267;
    }
    float _3269 = _3077;
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3273 = _2872 + _3271;
    float _3275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3277 = _2874 + _3275;
    float _3279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3281 = _2876 + _3279;
    float _3283 = _3273 * _3273;
    float _3285 = fma(_3277, _3277, _3283);
    float _3287 = fma(_3281, _3281, _3285);
    float _3289 = rsqrt(_3287);
    float _3291 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3293 = _3277 * _3291;
    float _3295 = _3281 * _3291;
    float _3297 = _3293 * _3293;
    float _3299 = _3295 * _3295;
    float _3301 = _3297 + _3299;
    float _3303 = sqrt(_3301);
    bool _3305 = _3303 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3309 = _3303 + _3307;
    float _3311 = _3289;
    float _3313 = _3309;
    if (_3305)
    {
        float _3315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3315;
    }
    float _3317 = _3311;
    if (_3305)
    {
        float _3319 = rsqrt(_3301);
        _3205 = _3319;
    }
    float _3321 = _3205;
    float _3323 = _3321;
    if (_3305)
    {
        float _3325 = _3309 * _3317;
        _3313 = _3325;
    }
    float _3327 = _3313;
    if (_3305)
    {
        float _3329 = _3327 * 0.15915493667125701904296875;
        _3207 = _3329;
    }
    float _3331 = _3207;
    float _3333 = _3317;
    float _3335 = _3331;
    if (_3305)
    {
        float _3337 = _3331 * 6.283185482025146484375;
        float _3339 = sin(_3337);
        _3333 = _3339;
    }
    float _3341 = _3333;
    float _3343 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3345 = precise::max(0.0, _3343);
    float _3347 = _3281;
    float _3349 = _3345;
    if (_3305)
    {
        float _3351 = _3331 * 6.283185482025146484375;
        float _3353 = cos(_3351);
        _3347 = _3353;
    }
    float _3355 = _3347;
    float _3357 = -_3291;
    float _3359 = -_3345;
    float _3361 = fma(_3273, _3357, _3359);
    float _3363 = _3361;
    if (_3305)
    {
        float _3365 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3349 = _3365;
    }
    float _3367 = _3349;
    float _3369 = _3341;
    float _3371 = _3367;
    if (_3305)
    {
        float _3373 = fma(_3341, _3367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3369 = _3373;
    }
    float _3375 = _3369;
    float _3377 = _3375;
    if (_3305)
    {
        float _3379 = _3355 + (-1.0);
        _3371 = _3379;
    }
    float _3381 = _3371;
    float _3383 = _3381;
    if (_3305)
    {
        float _3385 = _3321 * _3375;
        _2330 = _3385;
    }
    float _3387 = _2330;
    if (!_3305)
    {
        _3377 = _3293;
    }
    float _3389 = _3377;
    float _3391 = _3389;
    if (_3305)
    {
        float _3393 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3335 = _3393;
    }
    float _3395 = _3335;
    float _3397 = _3395;
    if (_3305)
    {
        float _3399 = _3293 * _3387;
        _3391 = _3399;
    }
    float _3401 = _3391;
    if (!_3305)
    {
        _3383 = _3295;
    }
    float _3403 = _3383;
    float _3405 = _3403;
    if (_3305)
    {
        float _3407 = _3295 * _3387;
        _3405 = _3407;
    }
    float _3409 = _3405;
    if (!_3305)
    {
        _3323 = _3297;
    }
    float _3411 = _3323;
    float _3413 = _3411;
    if (_3305)
    {
        float _3415 = fma(_3361, _3355, _3395);
        _3363 = _3415;
    }
    float _3417 = _3363;
    if (_3305)
    {
        float _3419 = _3401 * _3401;
        _3413 = _3419;
    }
    float _3421 = _3413;
    float _3423 = sqrt(_3287);
    if (!_3305)
    {
        _3397 = _3299;
    }
    float _3425 = _3397;
    float _3427 = _3425;
    if (_3305)
    {
        float _3429 = _3409 * _3409;
        _3427 = _3429;
    }
    float _3431 = _3427;
    float _3433 = fma(_3417, _3417, _3421);
    float _3435 = _3433 + _3431;
    float _3437 = rsqrt(_3435);
    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3441 = fma(_3423, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3439);
    float _3443 = precise::clamp(_3441, 0.0, 1.0);
    float _3445 = -_3443;
    float _3447 = _3445 + 1.0;
    float _3449 = abs(_3447);
    float _3451 = log2(_3449);
    float _3453 = _3437 * _3401;
    float _3455 = _3437 * _3417;
    float _3457 = _3437 * _3409;
    float _3459 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3461 = -_3459;
    float _3463 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3461);
    float _3465 = -_3457;
    float _3467 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3463);
    float _3469 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3471 = fma(_3467, -0.5, 0.5);
    float _3473 = fma(_3467, 0.5, 0.5);
    float _3475 = _3455 + 1.0;
    float _3477 = exp2(_3469);
    float _3479 = fma(_3473, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3481 = fma(_3473, _3479, -0.212114393711090087890625);
    float _3483 = sqrt(_3471);
    float _3485 = fma(_3473, _3481, 1.570728778839111328125);
    float _3487 = -_3455;
    float _3489 = fma(_3477, _3475, _3487);
    float _3491 = fma(_3489, 0.5, 0.5);
    float _3493 = _3483 * 0.636619746685028076171875;
    float _3495 = -_3485;
    float _3497 = fma(_3493, _3495, 1.0);
    float2 _9380 = float2(_3497, _3491);
    float3 _3501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9380, float2(0.0), isnan(_9380)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9380, float2(0.0), isnan(_9380)), level(0.0)).xyz;
    float _3503 = _3501.x;
    float _3505 = _3501.y;
    float _3507 = _3501.z;
    float _3509 = abs(_2286);
    float _3511 = log2(_3509);
    float _3513 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3515 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3517 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3519 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3521 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3513);
    float _3523 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3525 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3515);
    float _3527 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3529 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3531 = -_2182;
    float _3533 = fma(_3531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3523);
    float _3535 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3537 = -_2182;
    float _3539 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3527);
    float _3541 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3543 = -_2182;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3529);
    float _3547 = _269 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3549 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3551 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3535);
    float _3553 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3555 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3533);
    float _3557 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3541);
    float _3559 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3539);
    float _3561 = exp2(_3549);
    float _3563 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3519);
    float _3565 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3567 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3545);
    float _3569 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3553);
    float _3571 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3521);
    float _3573 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3575 = _3547 * _3555;
    float _3577 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3565);
    float _3579 = _3547 * _3559;
    float _3581 = _3547 * _3567;
    float _3583 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3569);
    float _3585 = fma(_3573, _3571, _3575);
    float _3587 = _2950 * 0.5;
    float _3589 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3525);
    float _3591 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3551);
    float _3593 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3557);
    float _3595 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3577);
    float _3597 = fma(_3008, -0.5, _3587);
    float _3599 = fma(_3573, _3589, _3579);
    float _3601 = fma(_3561, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3603 = precise::clamp(_3601, 0.0, 1.0);
    float _3605 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3607 = _3593 + _3599;
    out.gl_Position.x = _2992;
    out.gl_Position.y = _3008;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _2950;
    float _3609 = fma(_3603, -2.0, 3.0);
    float _3611 = _3603 * _3603;
    bool _3613 = _2286 <= 8000.0;
    bool _3615 = isnan(_2286);
    bool _3617 = _3613 || _3615;
    bool _3619 = isnan(8000.0);
    bool _3621 = _3617 || _3619;
    float _3623 = float(_3621);
    float _3625 = exp2(_3605);
    float _3627 = _3583 + _2950;
    float _3629 = _3611 * _3609;
    float _3631 = -_1884;
    float _3633 = _3631 + 1.0;
    float _3635 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3563);
    float _3637 = _2992 + _2950;
    float _3639 = _3627 * 0.5;
    float _3641 = fma(_3573, _3635, _3581);
    float _3643 = _3591 + _3585;
    float _3645 = -_3629;
    float _3647 = _3645 + 1.0;
    float _3649 = _3641;
    if (!_2934)
    {
        _2996 = 1.0;
    }
    float _3651 = _2996;
    float _3653 = _3637 * 0.5;
    float _3655 = _3651;
    if (_2934)
    {
        bool _3657 = _3050 >= _3012;
        bool _3659 = isnan(_3050);
        bool _3661 = _3657 || _3659;
        bool _3663 = isnan(_3012);
        bool _3665 = _3661 || _3663;
        float _3667 = float(_3665);
        _3655 = _3667;
    }
    float _3669 = _3655;
    float _3671 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3629);
    float _3673 = _3595 + _3641;
    float _3675 = -_3625;
    float _3677 = _3675 + 1.0;
    out.m_88.x = _3653;
    out.m_88.y = _3597;
    out.m_88.z = _3639;
    out.m_88.w = _2950;
    float _3679 = _3623 * _3671;
    float _3681 = _3669 * _3269;
    float _3683 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_90.x = _3643;
    out.m_90.y = _3607;
    out.m_90.z = _3673;
    float _3685 = _3679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3687 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3689 = isnan(_3423);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3695 = _3691 || _3693;
    float _3697 = _3683 * _3052;
    float _3699 = -_3683;
    float _3701 = _3699 + 1.0;
    float _3703 = _3633 * _3685;
    float _3705 = precise::clamp(_3703, 0.0, 1.0);
    float _3707 = _3063 * _3697;
    float _3709 = _3063 * _3701;
    float _3711 = -_3705;
    float _3713 = fma(_3711, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3715 = -_3681;
    float _3717 = fma(_3715, _3713, 1.0);
    float _3719 = precise::clamp(_3717, 0.0, 1.0);
    float _3721 = _3683;
    float _3723 = _3701;
    float _3725 = _3713;
    if (!_3695)
    {
        _3649 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3727 = _3649;
    float _3729 = _3719 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3731 = _3141 * _3203;
    float _3733 = _3731;
    float _3735 = _3727;
    float _3737 = _3727;
    if (!_3695)
    {
        _3721 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3739 = _3721;
    float _3741 = _3739;
    float _3743 = _3739;
    if (!_3695)
    {
        _3723 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3745 = _3723;
    out.m_92.x = _3729;
    float _3747 = _3731 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3749 = _3745;
    float _3751 = _3745;
    if (!_3695)
    {
        _3725 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3753 = _3725;
    float _3755 = _3753;
    float _3757 = _3753;
    if (!_3695)
    {
        _3733 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3759 = _3733;
    float _3761 = _3507 * _3697;
    float _3763 = fma(_3503, _3707, _3057);
    float _3765 = fma(_3505, _3707, _3059);
    float _3767 = _3759;
    float _3769 = _3759;
    if (!_3695)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3771 = _3087;
    float _3773 = fma(_3063, _3761, _3061);
    out.m_94.x = _3763;
    out.m_94.y = _3765;
    out.m_94.z = _3773;
    out.m_94.w = _3709;
    bool _3775 = !_3695;
    float _3777 = _3771;
    float _3779 = _3771;
    if (!_3775)
    {
        bool _3781 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3783 = isnan(_3423);
        bool _3785 = _3781 || _3783;
        bool _3787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3789 = _3785 || _3787;
        if (!_3789)
        {
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3793 = _3423 + _3791;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3797 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3795;
            float _3799 = 1.0 / _3797;
            float _3801 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3805 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3807 = _3805 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3815 = _3813 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3821 = _3793 * _3799;
            float _3823 = precise::clamp(_3821, 0.0, 1.0);
            float _3825 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3829 = fma(_3823, _3803, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3831 = fma(_3823, _3827, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3833 = fma(_3823, _3807, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3835 = fma(_3823, _3811, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3837 = fma(_3823, _3815, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3839 = fma(_3823, _3819, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3779 = _3831;
            _3757 = _3837;
            _3737 = _3829;
            _3751 = _3835;
            _3743 = _3833;
            _3769 = _3839;
            _3841 = true;
        }
        else
        {
            bool _3843 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3845 = isnan(_3423);
            bool _3847 = _3843 || _3845;
            bool _3849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3851 = _3847 || _3849;
            if (!_3851)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3853 = _3735;
            _3737 = _3853;
            if (!_3851)
            {
                _3777 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3855 = _3777;
            _3779 = _3855;
            if (!_3851)
            {
                _3741 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3857 = _3741;
            _3743 = _3857;
            if (!_3851)
            {
                _3749 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3859 = _3749;
            _3751 = _3859;
            if (!_3851)
            {
                _3755 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3861 = _3755;
            _3757 = _3861;
            if (!_3851)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3863 = _3767;
            bool _3865 = !_3851;
            _3769 = _3863;
            if (!_3865)
            {
                bool _3867 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3869 = isnan(_3423);
                bool _3871 = _3867 || _3869;
                bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3875 = _3871 || _3873;
                if (!_3875)
                {
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3879 = _3423 + _3877;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3883 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3881;
                    float _3885 = 1.0 / _3883;
                    float _3887 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3893 = _3891 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3907 = _3879 * _3885;
                    float _3909 = precise::clamp(_3907, 0.0, 1.0);
                    float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3915 = fma(_3909, _3889, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3917 = fma(_3909, _3913, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3919 = fma(_3909, _3893, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3921 = fma(_3909, _3897, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3923 = fma(_3909, _3901, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3925 = fma(_3909, _3905, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3779 = _3917;
                    _3757 = _3923;
                    _3737 = _3915;
                    _3751 = _3921;
                    _3743 = _3919;
                    _3769 = _3925;
                    _3841 = true;
                }
                else
                {
                    _3779 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3757 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3751 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3743 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3841 = false;
    float _3927 = _3779;
    float _3929 = _3757;
    float _3931 = _3737;
    float _3933 = _3751;
    float _3935 = _3743;
    float _3937 = _3769;
    float _3939 = fma(_3607, -0.5, 0.5);
    float _3941 = precise::clamp(_3939, 0.0, 1.0);
    float _3943 = -_3927;
    float _3945 = _3943 + _3929;
    float _3947 = _3747 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3949 = -_3931;
    float _3951 = _3949 + _3933;
    float _3953 = fma(_3941, _3945, _3927);
    out.m_96.x = 0.0;
    float _3955 = -_3935;
    float _3957 = _3955 + _3937;
    float _3959 = fma(_3941, _3951, _3931);
    float _3961 = _3953 * 0.586610972881317138671875;
    out.m_59.x = _3947;
    bool _3963 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3965 = fma(_3941, _3957, _3935);
    float _3967 = fma(_3959, 0.298911988735198974609375, _3961);
    bool _3969 = _3141 > 0.0;
    bool _3971 = isnan(_3141);
    bool _3973 = _3969 || _3971;
    bool _3975 = isnan(0.0);
    bool _3977 = _3973 || _3975;
    float _3979 = fma(_3965, 0.114477999508380889892578125, _3967);
    bool _3981 = _3203 <= 0.0;
    bool _3983 = !_3977;
    bool _3985 = _3981 || _3983;
    float _3987 = -_3979;
    float _3989 = _3959 + _3987;
    float _3991 = -_3979;
    float _3993 = _3953 + _3991;
    float _3995 = -_3979;
    float _3997 = _3965 + _3995;
    float _3999 = fma(_3989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    float _4001 = fma(_3993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    float _4003 = fma(_3997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    bool _4005 = !_3963;
    if (!_4005)
    {
        float _4007 = -_2872;
        float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4011 = -_2874;
        float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4015 = -_2876;
        float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4019 = _4009 * _4009;
        float _4021 = fma(_4013, _4013, _4019);
        float _4023 = fma(_4017, _4017, _4021);
        float _4025 = sqrt(_4023);
        float _4027 = rsqrt(_4023);
        float _4029 = -_4025;
        float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4033 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4035 = precise::clamp(_4033, 0.0, 1.0);
        float _4037 = _4013 * _4027;
        float _4039 = _4009 * _4027;
        float _4041 = abs(_4035);
        float _4043 = log2(_4041);
        float _4045 = _4017 * _4027;
        float _4047 = _4037 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4049 = _3607 * _4039;
        float _4051 = -_4039;
        float _4053 = -_4047;
        float _4055 = fma(_4051, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4053);
        float _4057 = fma(_3643, _4037, _4049);
        float _4059 = -_4045;
        float _4061 = fma(_4059, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4055);
        float _4063 = fma(_3673, _4045, _4057);
        float _4065 = precise::clamp(_4063, 0.0, 1.0);
        float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4069 = _4061 + _4067;
        float _4071 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4073 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4075 = precise::clamp(_4073, 0.0, 1.0);
        float _4077 = exp2(_4071);
        float _4079 = _4077 * _4075;
        float _4081 = _4065 * _4079;
        float _4083 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4085 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4087 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _4083;
        out.m_96.y = _4085;
        out.m_96.z = _4087;
    }
    out.m_98.x = _3999;
    out.m_98.y = _4001;
    out.m_98.z = _4003;
    if (!_3985)
    {
        return out;
    }
    float _4089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4089;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3841 = false;
    bool _959 = false;
    bool _767 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4146 = as_type<float>(_133);
        out.gl_Position.z = _4146;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_61.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = _151;
    if (_147)
    {
        float _155 = float(_117);
        _127 = _155;
    }
    float _157 = _127;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4216 = as_type<float>(_171);
        out.gl_Position.z = _4216;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _175 = in.m_63.x;
    float _177 = _151 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = in.m_68.x;
    float _185 = in.m_68.y;
    float _187 = in.m_68.z;
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    float _195 = _177 * _173;
    float _197 = _151 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _199 = in.m_72.x;
    float _201 = in.m_72.y;
    float _203 = in.m_72.z;
    float _205 = in.m_74.x;
    float _207 = in.m_74.y;
    float _209 = in.m_74.z;
    float _211 = _197 * _181;
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _195);
    float _215 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _211);
    float _217 = _213 * 6.283185482025146484375;
    int _219 = as_type<int>(_179) & 1;
    bool _221 = _219 != 0;
    int _223 = as_type<int>(_179) & 2;
    bool _225 = _223 != 0;
    float _227 = floor(_213);
    int _229 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _231 = _229 != 0;
    float _233 = _217 * 0.15915493667125701904296875;
    float _235 = _215 * 6.283185482025146484375;
    float _237 = _185 * _191;
    float _239 = floor(_215);
    float _241 = fma(_183, _189, _237);
    float _243 = _185 * _201;
    float _245 = fma(_187, _193, _241);
    float _247 = _185 * _207;
    float _249 = fma(_183, _199, _243);
    float _251 = _233 * 6.283185482025146484375;
    float _253 = cos(_251);
    float _255 = -_227;
    float _257 = _213 + _255;
    float _259 = fma(_183, _205, _247);
    float _261 = -_239;
    float _263 = _215 + _261;
    float _265 = _235 * 0.15915493667125701904296875;
    bool _267 = !_225;
    float _269 = _267 ? (-0.5) : 0.5;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = -_263;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _283 = _257 < 0.5;
    float _285 = float(_283);
    float _287 = _265 * 6.283185482025146484375;
    float _289 = cos(_287);
    bool _291 = !_231;
    int _293 = _291 ? 0 : 1;
    float _295 = fma(_253, 0.5, 0.5);
    bool _297 = !_273;
    int _299 = _297 ? 0 : 1;
    float _301 = -_257;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_293);
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _311 = abs(_299);
    float _313 = -_295;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = float(_311);
    bool _321 = !_277;
    int _323 = _321 ? 0 : 1;
    bool _325 = _263 < 0.5;
    float _327 = float(_325);
    float _329 = fma(_289, 0.5, 0.5);
    float _331 = float(_305);
    float _333 = abs(_303);
    float _335 = _319 * _333;
    float _337 = abs(_281);
    float _339 = _319 * _337;
    float _341 = -_329;
    float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _345 = abs(_323);
    float _347 = fma(_331, _315, _335);
    float _349 = -_327;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _353 = fma(_331, _343, _339);
    float _355 = float(_345);
    float _357 = fma(_187, _203, _249);
    float _359 = fma(_187, _209, _259);
    bool _361 = !_221;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = abs(_309);
    float _367 = fma(_355, _365, _347);
    float _369 = abs(_351);
    float _371 = fma(_355, _369, _353);
    bool _373 = !_317;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_117);
        float _395 = 1.0 / _393;
        float _397 = _151 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _425 = 1.0 / _411;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _435 = 1.0 / _415;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _399 + _437;
    bool _441 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _443 = isnan(_399);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _455 = -_451;
    float _457 = _455 + 1.0;
    float _459 = 1.0 / _419;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _461;
    float _465 = _439 * _425;
    bool _467 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _469 = isnan(_399);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _481 = _399 + _479;
    float _483 = 1.0 / _429;
    float _485 = _403 * _435;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _489 = _399 + _487;
    float _491 = -_477;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _423;
    float _497 = _407 * _459;
    bool _499 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _501 = isnan(_399);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    bool _511 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _513 = isnan(_399);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = 1.0 / _433;
    float _525 = _489 * _483;
    float _527 = -_509;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _463;
    float _533 = _481 * _495;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _537 = _399 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _541 = _399 + _539;
    float _543 = _537 * _523;
    float _545 = _509 * _493;
    bool _547 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _549 = isnan(_399);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _521 * _529;
    float _561 = -_521;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _569;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = _541 * _531;
    bool _579 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_399);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _557 * _563;
    float _593 = _451 * _575;
    float _595 = fma(_567, _465, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = fma(_571, _465, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _599 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_399);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_589;
    float _613 = _611 + 1.0;
    bool _615 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _617 = isnan(_399);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _589 * _457;
    float _629 = -_609;
    float _631 = _629 + 1.0;
    float _633 = _609 * _613;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _643;
    float _647 = _625 * _631;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _649;
    float _653 = fma(_637, _485, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = fma(_641, _485, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _657 = fma(_645, _497, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _659 = _595 * _647;
    float _661 = -_625;
    float _663 = _661 + 1.0;
    float _665 = _597 * _647;
    float _667 = fma(_651, _497, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _659);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _681 = fma(_671, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _683 = fma(_675, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _689;
    float _693 = fma(_653, _633, _677);
    float _695 = fma(_655, _633, _679);
    float _697 = fma(_687, _525, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _699 = fma(_691, _525, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _701 = fma(_657, _627, _693);
    float _703 = fma(_667, _627, _695);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _713 = fma(_681, _593, _701);
    float _715 = fma(_707, _543, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _717 = fma(_711, _543, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _719 = fma(_683, _593, _703);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _721;
    float _725 = fma(_697, _591, _713);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _727;
    float _731 = fma(_699, _591, _719);
    float _733 = fma(_723, _577, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _735 = fma(_715, _559, _725);
    float _737 = fma(_729, _577, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _739 = fma(_717, _559, _731);
    float _741 = fma(_733, _545, _735);
    float _743 = fma(_737, _545, _739);
    float _745 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[150].x, _741);
    float _747 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[150].y, _743);
    bool _749 = !_453;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _753 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].x, _151);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_117);
        float _771 = 1.0 / _769;
        float _773 = _151 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _795 = _775 + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _805 = 1.0 / _799;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _809 = 1.0 / _803;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _811;
    float _815 = _779 * _805;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    bool _833 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _835 = isnan(_775);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = fma(_813, _815, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _847 = _843 * _831;
    float _849 = -_843;
    float _851 = _849 + 1.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _857;
    float _861 = _795 * _809;
    float _863 = _827 * _851;
    float _865 = fma(_855, _815, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _867 = fma(_859, _815, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _869 = -_827;
    float _871 = _869 + 1.0;
    float _873 = _845 * _863;
    float _875 = _865 * _863;
    float _877 = _867 * _863;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _891 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].x, _875);
    float _893 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].y, _873);
    float _895 = fma(_881, _861, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_885, _861, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_889, _861, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[107].z, _877);
    float _903 = fma(_895, _847, _891);
    float _905 = fma(_897, _847, _893);
    float _907 = fma(_899, _847, _901);
    float _909 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].x, _903);
    float _911 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].y, _905);
    float _913 = in.m_76.x;
    float _915 = in.m_76.y;
    float _917 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[109].z, _907);
    float _919 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _921 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _923 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _927;
    out.m_78.y = _929;
    out.m_78.z = _931;
    out.m_78.w = _925;
    float _933 = _747 * _915;
    float _935 = _745 * _913;
    bool _937 = !_807;
    float _955;
    float _957;
    if (!_937)
    {
        float _939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _941 = _175 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _943 = float(_117);
        float _945 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[11].z, _151);
        float _947 = _945 * _939;
        float _949 = floor(_947);
        float _951 = -_949;
        float _953 = _947 + _951;
        _955 = _943;
        _957 = _953;
        _959 = true;
    }
    else
    {
        float _961 = float(_117);
        float _963 = 1.0 / _961;
        float _965 = _151 * _963;
        _955 = _961;
        _957 = _965;
    }
    _959 = false;
    float _967 = _955;
    float _969 = _957;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _973 = int(_971);
    float _975 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _977 = int(_975);
    float _979 = float(_973);
    float _981 = 1.0 / _967;
    float _983 = float(uint(_977));
    float _985 = 1.0 / _979;
    int _987 = ~_977;
    int _989 = _987 + 1;
    int _991 = ~_977;
    int _993 = _991 + 1;
    float _995 = 1.0 / _983;
    float _997 = _985 * _151;
    float _999 = trunc(_997);
    int _1001 = int(_999);
    int _1003 = as_type<int>(_995) + (-2);
    float _1005 = float(uint(_1001));
    float _1007 = as_type<float>(_1003) * _1005;
    float _1009 = trunc(_1007);
    float _1011 = precise::max(_1009, 0.0);
    uint _1014 = uint(_1011);
    float _1016 = float(_977);
    int _1018 = _989 * int(_1014);
    int _1020 = _1018 + _1001;
    float _1022 = float(uint(_1020));
    float _1024 = as_type<float>(_1003) * _1022;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1028 = _1026 != 0;
    bool _1030 = !_1028;
    float _1032 = _1030 ? 7.345489978790283203125 : 1.0;
    float _1034 = trunc(_1024);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    float _1040 = _1032 * _175;
    float _1042 = floor(_1040);
    int _1044 = int(_1014) + int(_1038);
    float _1046 = float(_1001);
    int _1048 = _993 * _1044;
    int _1050 = _1048 + _1001;
    bool _1052 = _1046 >= _1016;
    bool _1054 = isnan(_1046);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(_1016);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = -_1042;
    float _1066 = _1040 + _1064;
    bool _1068 = uint(_1050) >= uint(_977);
    float _1070 = trunc(_1062);
    int _1072 = int(_1070);
    float _1074 = _1066 * _1016;
    bool _1076 = !_1068;
    int _1078 = _1076 ? 0 : (-1);
    float _1080 = _1016 * _151;
    bool _1082 = _977 == 0;
    int _1084 = ~_1044;
    int _1086 = _1084 + _1078;
    int _1088 = _1086 + 1;
    float _1090 = _1080 * _981;
    int _1092 = _977 + (-1);
    float _1094 = trunc(_1074);
    int _1096 = int(_1094);
    int _1098 = _977 * _1088;
    int _1100 = _1098 + _1001;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1104 = _1102 != 0;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1108 = _1106 != 0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1116 = _1114 != 0;
    int _1118 = ~_1072;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = trunc(_1090);
    int _1126 = int(_1124);
    bool _1128 = !_1082;
    int _1130 = _1128 ? _1100 : (-1);
    bool _1132 = !_1104;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1138 = _1136 != 0;
    int _1140 = _1130 * _1122;
    int _1142 = abs(_1134);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1146 = _1144 != 0;
    int _1148 = _1072 * _1092;
    int _1150 = _1148 + _1140;
    bool _1152 = !_1108;
    int _1154 = _1152 ? 0 : 1;
    bool _1156 = !_1116;
    int _1158 = _1156 ? 0 : 1;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    int _1164 = abs(_1154);
    bool _1166 = !_1112;
    int _1168 = _1166 ? 0 : 1;
    bool _1170 = !_1162;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1158);
    int _1176 = abs(_1168);
    int _1178 = _1150 * _1164;
    int _1180 = abs(_1172);
    int _1182 = _1096 * _1174;
    int _1184 = _1182 + _1001;
    int _1186 = _1126 * _1142;
    int _1188 = _1186 + _1178;
    int _1190 = ~_977;
    int _1192 = _1190 + 1;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1196 = _1194 != 0;
    int _1198 = _1184 * _1176;
    int _1200 = _1198 + _1188;
    int _1202 = _1096 * _1180;
    int _1204 = _1202 + _1200;
    float _1206 = float(uint(_1204));
    float _1208 = as_type<float>(_1003) * _1206;
    float _1210 = in.m_56.x;
    float _1212 = in.m_56.y;
    float _1214 = in.m_56.z;
    float _1216 = trunc(_1208);
    float _1218 = precise::max(_1216, 0.0);
    uint _1220 = uint(_1218);
    int _1222 = ~_977;
    int _1224 = _1222 + 1;
    int _1226 = _1192 * int(_1220);
    int _1228 = _1226 + _1204;
    float _1230 = float(uint(_1228));
    float _1232 = _201 * _1212;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1234;
    float _1238 = _207 * _1212;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1244 = as_type<float>(_1003) * _1230;
    float _1246 = _191 * _1212;
    float _1248 = in.m_63.y;
    float _1250 = 1.0 / _1236;
    float _1252 = fma(_205, _1210, _1238);
    float _1254 = fma(_189, _1210, _1246);
    float _1256 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1260 = _969 + _1258;
    float _1262 = trunc(_1244);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1270 = _1260 * _1250;
    float _1272 = fma(_199, _1210, _1232);
    float _1274 = fma(_193, _1214, _1254);
    float _1276 = fma(_203, _1214, _1272);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1280 = int(_1220) + int(_1266);
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1284 = 1.0 / _1242;
    float _1286 = -_1278;
    float _1288 = fma(_1256, 2.0, _1286);
    float _1290 = in.m_70.w;
    int _1292 = _1224 * _1280;
    int _1294 = _1292 + _1204;
    float _1296 = fma(_1282, -2.0, _1268);
    float _1298 = float(uint(_1184));
    float _1300 = -_151;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1288);
    bool _1304 = uint(_1294) >= uint(_977);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1308 = _969 + _1306;
    float _1310 = fma(_209, _1214, _1252);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1312;
    bool _1316 = !_1304;
    int _1318 = _1316 ? 0 : (-1);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1324 = _175 > 0.5;
    float _1326 = _1308 * _1284;
    int _1328 = ~_1280;
    int _1330 = _1328 + _1318;
    int _1332 = _1330 + 1;
    float _1334 = in.m_72.w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1340;
    float _1344 = fma(_1314, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1346 = -_363;
    int _1348 = _1324 ? as_type<int>(_1346) : as_type<int>(_363);
    float _1350 = fma(_1338, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1352 = fma(_1342, _1270, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1354 = _977 * _1332;
    int _1356 = _1354 + _1204;
    float _1358 = as_type<float>(_1003) * _1298;
    bool _1360 = !_1146;
    float _1362 = _1360 ? _363 : as_type<float>(_1348);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1372 = !_1082;
    int _1374 = _1372 ? _1356 : (-1);
    float _1376 = _1274 + _1290;
    float _1378 = trunc(_1358);
    float _1380 = precise::max(_1378, 0.0);
    uint _1382 = uint(_1380);
    float _1384 = _1362 + 0.5;
    float _1386 = fma(_1322, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1388 = fma(_1366, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1390 = fma(_1370, _1326, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1392 = ~_977;
    int _1394 = _1392 + 1;
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1302);
    bool _1398 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1400 = isnan(_969);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = in.m_74.w;
    bool _1412 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1414 = isnan(_969);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = _1276 + _1334;
    int _1426 = _1374 >> 31;
    bool _1428 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1430 = isnan(_969);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    int _1440 = _1426 & 3;
    int _1442 = _1394 * int(_1382);
    int _1444 = _1442 + _1184;
    float _1446 = -_1408;
    float _1448 = _1446 + 1.0;
    bool _1450 = _1248 > 0.5;
    int _1452 = _1374 + _1440;
    float _1454 = float(uint(_1444));
    float _1456 = _1422 * _1448;
    int _1458 = _1452 >> 2;
    float _1460 = -_1422;
    float _1462 = _1460 + 1.0;
    float _1464 = -_269;
    int _1466 = _1450 ? as_type<int>(_1464) : as_type<int>(_269);
    float _1468 = as_type<float>(_1003) * _1454;
    int _1470 = _1458 << 4;
    int _1472 = _1470 + 368;
    float _1474 = _1438 * _1462;
    bool _1476 = !_1196;
    float _1478 = _1476 ? _269 : as_type<float>(_1466);
    float _1480 = trunc(_1468);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    uint _1486 = uint(int(uint(_1472) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[int(_1496)][_1498];
    float _1502 = _1310 + _1410;
    float _1504 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1296);
    float _1506 = -_1438;
    float _1508 = _1506 + 1.0;
    float _1510 = _1350 * _1474;
    float _1512 = _1478 + (-0.5);
    float _1514 = _1344 * _1474;
    float _1516 = _1352 * _1474;
    float _1518 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1510);
    float _1520 = -_1512;
    float _1522 = -_1504;
    float _1524 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1522);
    int _1526 = _1374 & 3;
    bool _1528 = _1526 != 0;
    float _1530 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1514);
    float _1532 = fma(_1388, _1456, _1518);
    float _1534 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1516);
    bool _1536 = uint(_1526) > 1u;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1540 = _1424 + _1538;
    int _1542 = int(_1382) + int(_1484);
    float _1544 = fma(_1386, _1456, _1530);
    int _1546 = _1472 + 8;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = _1374 & 3;
    bool _1566 = _1564 != 0;
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1570 = _1376 + _1568;
    float _1572 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1574 = fma(_1390, _1456, _1534);
    int _1576 = _1566 ? 0 : 1;
    float _1578 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1544);
    float _1580 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1572);
    int _1582 = ~_977;
    int _1584 = _1582 + 1;
    float _1586 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1532);
    int _1588 = ~_1576;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    float _1594 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1574);
    int _1596 = _1592;
    float _1598 = _1478;
    if (!_1536)
    {
        int _1600 = ~_1576;
        int _1602 = _1600 + 1;
        _1596 = _1602;
    }
    int _1604 = _1596;
    int _1606 = _1584 * _1542;
    int _1608 = _1606 + _1184;
    bool _1610 = _1526 != 3;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1614 = _1502 + _1612;
    bool _1616 = !_1528;
    int _1618 = _1616 ? 0 : 1;
    int _1620 = abs(_1604);
    float _1622 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1580);
    bool _1624 = uint(_1526) >= 2u;
    int _1626 = abs(_1618);
    int _1628 = ~_1620;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    bool _1634 = uint(_1608) >= uint(_977);
    int _1636 = _1624 ? 0 : 1;
    int _1638 = ~_1626;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    int _1644 = _1632 * as_type<int>(_1500);
    bool _1646 = !_1634;
    int _1648 = _1646 ? 0 : (-1);
    int _1650 = ~_1636;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1642 * as_type<int>(_1492);
    int _1658 = _1656 + _1644;
    bool _1660 = _1526 != 3;
    int _1662 = _1654;
    if (_1610)
    {
        int _1664 = ~_1636;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    bool _1670 = !_1660;
    int _1672 = _1670 ? 0 : (-1);
    int _1674 = abs(_1668);
    bool _1676 = !_1138;
    int _1678 = _1676 ? 0 : 1;
    int _1680 = abs(_1672);
    int _1682 = ~_1542;
    int _1684 = _1682 + _1648;
    int _1686 = _1684 + 1;
    int _1688 = abs(_1678);
    int _1690 = _977 * _1686;
    int _1692 = _1690 + _1184;
    int _1694 = ~_1674;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    int _1700 = ~_1680;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    int _1706 = _1698 * as_type<int>(_1554);
    int _1708 = _1706 + _1658;
    bool _1710 = _1622 >= 0.0;
    int _1712 = _1704 * as_type<int>(_1562);
    int _1714 = _1712 + _1708;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1718 = _1540 * _1540;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1722 = !_1082;
    int _1724 = _1722 ? _1692 : (-1);
    float _1726 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1716);
    float _1728 = fma(_1570, _1570, _1718);
    float _1730 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1720);
    int _1732 = ~_1688;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1726);
    float _1740 = fma(_1614, _1614, _1728);
    float _1742 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1730);
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1746 = _1744 != 0;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1750 = _1748 != 0;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1754 = _1752 != 0;
    float _1756 = -_1738;
    float _1758 = _1756 + 1.0;
    int _1760 = _1714 * _1736;
    float _1762 = -_1742;
    float _1764 = _1762 + 1.0;
    float _1766 = rsqrt(_1740);
    float _1768 = fma(_1478, _1758, _1524);
    int _1770 = _1724 * _1688;
    int _1772 = _1770 + _1760;
    float _1774 = -_1764;
    float _1776 = fma(_1362, _1774, _1396);
    if (_1710)
    {
        _1598 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1778 = _1598;
    float _1780 = _1578 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1784 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1786 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1782 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1792 = as_type<int>(_1778);
    float _1794 = _1790;
    if (_1710)
    {
        float _1796 = _1778 * 5.0;
        _1792 = as_type<int>(_1796);
    }
    int _1798 = _1792;
    float _1800 = float(_1772);
    out.m_80.x = _1776;
    out.m_80.y = _1768;
    bool _1802 = !_1750;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = _1540 * _1766;
    bool _1808 = !_1754;
    int _1810 = _1808 ? 0 : 1;
    out.m_82.x = _1786;
    out.m_82.y = _1788;
    out.m_82.z = _1790;
    bool _1812 = !_1746;
    int _1814 = _1812 ? 0 : 1;
    float _1816 = _1570 * _1766;
    float _1818 = _1806;
    if (_1710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6727 = as_type<float>(_1798);
        out.gl_Position.z = _6727;
    }
    out.m_84.x = _1800;
    if (_1710)
    {
        out.m_59.x = 0.0;
    }
    if (_1710)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1820 = -_1806;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1824 = _1614 * _1766;
    float _1826 = -_1816;
    float _1828 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1832 = _1822 + _1830;
    float _1834 = -_1824;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1502);
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = _1828 + _1838;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1846 = _1836 + _1844;
    float _1848 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1842);
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1848);
    bool _1852 = _1850 >= 0.0;
    float _1854 = _1840;
    float _1856 = _1822;
    float _1858 = _1846;
    if (_1852)
    {
        _1794 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1860 = _1794;
    int _1862 = as_type<int>(_1860);
    if (_1852)
    {
        out.m_59.x = 0.0;
    }
    if (_1852)
    {
        float _1864 = _1860 * 5.0;
        _1862 = as_type<int>(_1864);
    }
    int _1866 = _1862;
    if (_1852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6826 = as_type<float>(_1866);
        out.gl_Position.z = _6826;
    }
    if (_1852)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1870 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1872 = floor(_1868);
    float _1874 = floor(_1870);
    float _1876 = -_1872;
    float _1878 = _1868 + _1876;
    float _1880 = -_1874;
    float _1882 = _1870 + _1880;
    float2 _6862 = float2(_1878, _1882);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6862, float2(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6862, float2(0.0), isnan(_6862)), level(0.0)).x;
    float _1886 = in.m_63.z;
    float _1888 = _175 * 2.0;
    float _1890 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1892 = log2(_1890);
    float _1894 = _175 + _1248;
    float _1896 = _1248 * 2.0;
    float _1898 = _1894 + (-1.0);
    int _1900 = abs(_1804);
    float _1902 = -_1806;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1906 = floor(_1888);
    int _1908 = abs(_1814);
    float _1910 = -_1816;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1570);
    float _1914 = float(_1900);
    float _1916 = _1904 * _1904;
    float _1918 = float(_1908);
    float _1920 = -_1824;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1924 = _371 * _933;
    float _1926 = _367 * _935;
    float _1928 = _1886 * 2.0;
    float _1930 = _1248 + _1886;
    bool _1932 = _1906 > 0.0;
    float _1934 = _1892 * _151;
    float _1936 = floor(_1928);
    float _1938 = _1930 + (-1.0);
    bool _1940 = _1906 >= 0.0;
    bool _1942 = isnan(_1906);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(0.0);
    bool _1948 = _1944 || _1946;
    float _1950 = _1248 + (-0.5);
    float _1952 = fma(_1912, _1912, _1916);
    float _1954 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1956 = exp2(_1934);
    float _1958 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1960 = _1948 ? 0 : 1;
    float _1962 = in.m_86.x;
    float _1964 = in.m_86.y;
    float _1966 = in.m_86.z;
    float _1968 = fma(_1922, _1922, _1952);
    int _1970 = ~_1960;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    float _1976 = floor(_1896);
    bool _1978 = _1936 > 0.0;
    bool _1980 = _1936 >= 0.0;
    bool _1982 = isnan(_1936);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan(0.0);
    bool _1988 = _1984 || _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1992 = 1.0 + _1990;
    int _1994 = _1974;
    int _1996 = 2;
    if (!_1932)
    {
        int _1998 = ~_1960;
        int _2000 = _1998 + 1;
        _1994 = _2000;
    }
    int _2002 = _1994;
    bool _2004 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2006 = isnan(0.0);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2012 = _2008 || _2010;
    float _2014 = 1.0 / _1992;
    float _2016 = float(_2002);
    float _2018 = -_1956;
    float _2020 = _2018 + 1.0;
    int _2022 = _1988 ? 0 : 1;
    bool _2024 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2026 = isnan(1.0);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2032 = _2028 || _2030;
    float _2034 = _1914 * _2016;
    int _2036 = ~_2022;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2040;
    if (!_1978)
    {
        int _2044 = ~_2022;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = _2034 * (-2.0);
    bool _2052 = _1976 > 0.0;
    float _2054 = _2012 ? _2020 : 0.0;
    float _2056 = fma(_2050, _1964, _1964);
    bool _2058 = _1976 >= 0.0;
    bool _2060 = isnan(_1976);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan(0.0);
    bool _2066 = _2062 || _2064;
    float _2068 = fma(_1954, _2050, _1954);
    float _2070 = float(_2048);
    if (_2032)
    {
        float _2072 = _2054 * _2014;
        _153 = _2072;
    }
    float _2074 = _153;
    int _2076 = _2066 ? 0 : 1;
    float _2078 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2056);
    int _2080 = abs(_1810);
    float _2082 = _1918 * _2070;
    int _2084 = ~_2076;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_2068, _2074, _2078);
    int _2092 = _2088;
    if (!_2052)
    {
        int _2094 = ~_2076;
        int _2096 = _2094 + 1;
        _2092 = _2096;
    }
    int _2098 = _2092;
    float _2100 = _2082 * (-2.0);
    float _2102 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2104 = _2090 * 0.15915493667125701904296875;
    float _2106 = float(_2080);
    float _2108 = fma(_1958, _2100, _1958);
    float _2110 = float(_2098);
    float _2112 = fma(_2100, _1962, _1962);
    float _2114 = _175 + (-0.5);
    float _2116 = _175 + _1886;
    float _2118 = _1886 + (-0.5);
    float _2120 = _2106 * _2110;
    float _2122 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2112);
    float _2124 = _2116 + (-1.0);
    float _2126 = _2120 * (-2.0);
    float _2128 = fma(_2108, _2074, _2122);
    float _2130 = _2104 * 6.283185482025146484375;
    float _2132 = sin(_2130);
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = fma(_2126, _1966, _1966);
    float _2138 = _2128 * 0.15915493667125701904296875;
    float _2140 = _1822 + _2102;
    float _2142 = fma(_2134, _2126, _2134);
    float _2144 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2136);
    float _2146 = _2104 * 6.283185482025146484375;
    float _2148 = cos(_2146);
    float _2150 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2152 = fma(_2142, _2074, _2144);
    float _2154 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2150);
    float _2156 = _2152 * 0.15915493667125701904296875;
    float _2158 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2160 = _2138 * 6.283185482025146484375;
    float _2162 = sin(_2160);
    float _2164 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2154);
    float _2166 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2158);
    float _2168 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2170 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2166);
    float _2172 = _2138 * 6.283185482025146484375;
    float _2174 = cos(_2172);
    float _2176 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2178 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2180 = _2156 * 6.283185482025146484375;
    float _2182 = sin(_2180);
    float _2184 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2178);
    float _2186 = _2162 * _2148;
    float _2188 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2184);
    float _2190 = 1.0 / _2176;
    float _2192 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2194 = _2162 * _2132;
    float _2196 = _2174 * _2148;
    float _2198 = _2192 + _2176;
    float _2200 = _2156 * 6.283185482025146484375;
    float _2202 = cos(_2200);
    float _2204 = fma(_2182, _2196, _2194);
    float _2206 = fma(_2182, _2194, _2196);
    float _2208 = _2174 * _2132;
    float _2210 = -_2208;
    float _2212 = fma(_2182, _2186, _2210);
    float _2214 = sqrt(_1968);
    float _2216 = _2198 * _2190;
    float _2218 = _2216 * 0.5;
    float _2220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _269);
    float _2222 = -_2186;
    float _2224 = fma(_2182, _2208, _2222);
    float _2226 = _2174 * _2202;
    float _2228 = _2148 * _2202;
    float _2230 = _2162 * _2202;
    float _2232 = _2132 * _2202;
    float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2236 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2234);
    float _2238 = trunc(_2168);
    int _2240 = int(_2238);
    float _2242 = _1766 * _2214;
    float _2244 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2246 = 1.0 / _2236;
    float _2248 = _2242 * _2244;
    float _2250 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2252 = _2220 * _2248;
    float _2254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _363);
    float _2256 = _2242 * _2250;
    int _2258 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2260 = _2240 + _2258;
    int _2262 = _2260 + 1;
    float _2264 = _2226 * _2252;
    float _2266 = -_2252;
    float _2268 = _2182 * _2266;
    float _2270 = _2254 * _2256;
    float _2272 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2274 = _2230 * _2252;
    float _2276 = fma(_2204, _2270, _2264);
    float _2278 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2272);
    float _2280 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2282 = _2280 * 0.5;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2286 = _2246 * _2284;
    float _2288 = fma(_2228, _2270, _2268);
    float _2290 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2278);
    float _2292 = fma(_2224, _2282, _2276);
    float _2294 = fma(_2212, _2270, _2274);
    bool _2296 = _2286 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2298 = fma(_2232, _2282, _2288);
    bool _2300 = _2286 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2302 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2304 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2306 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2308 = fma(_2206, _2282, _2294);
    float _2310 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2302);
    float _2312 = trunc(_2304);
    int _2314 = int(_2312);
    float _2316 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    bool _2318 = !_2296;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    float _2324 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2326 = as_type<int>(_2324);
    int _2328 = as_type<int>(_2308);
    float _2330 = _2304;
    if (!_2296)
    {
        _1996 = 1;
    }
    int _2332 = _1996;
    float _2334 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    int _2336 = _2332;
    if (!_2300)
    {
        _2336 = _2320;
    }
    int _2338 = _2336;
    float _2340 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2342 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2324);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2346 = _2338 << 6;
    float _2348 = _1502 + _2340;
    float _2350 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2342);
    float _2352 = _1376 + _2344;
    int _2354 = _2346 + 48;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c15)._m0[int(_2358)][_2360];
    int _2364 = int(_2356) + 1;
    uint _2366 = uint(int(uint(_2364) >> uint(2)));
    int _2368 = _2364 & 3;
    float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2374 = _2348 + _2372;
    int _2376 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2378 = _2314 + _2376;
    int _2380 = _2378 + 1;
    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2384 = _2352 + _2382;
    float _2386 = _2350 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2388 = _2374 * _2374;
    int _2390 = _2380 | _2262;
    int _2392 = _2346 + 56;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    uint _2396 = uint(int(uint(int(_2394)) >> uint(2)));
    int _2398 = int(_2394) & 3;
    float _2400 = (*spvDescriptorSet0.vp_c15)._m0[int(_2396)][_2398];
    int _2402 = int(_2394) + 1;
    uint _2404 = uint(int(uint(_2402) >> uint(2)));
    int _2406 = _2402 & 3;
    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
    bool _2410 = _2380 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2412 = fma(_2384, _2384, _2388);
    bool _2414 = _2390 < 0;
    bool _2416 = _2414 || _2410;
    float _2418 = sqrt(_2412);
    int _2420 = _2346 + 64;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    uint _2424 = uint(int(uint(int(_2422)) >> uint(2)));
    int _2426 = int(_2422) & 3;
    float _2428 = (*spvDescriptorSet0.vp_c15)._m0[int(_2424)][_2426];
    int _2430 = int(_2422) + 1;
    uint _2432 = uint(int(uint(_2430) >> uint(2)));
    int _2434 = _2430 & 3;
    float _2436 = (*spvDescriptorSet0.vp_c15)._m0[int(_2432)][_2434];
    bool _2438 = _2262 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2440 = _2438 || _2416;
    int _2442 = _2346 + 72;
    uint _2444 = uint(int(uint(_2442) >> uint(2)));
    uint _2446 = uint(int(uint(int(_2444)) >> uint(2)));
    int _2448 = int(_2444) & 3;
    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[int(_2446)][_2448];
    int _2452 = int(_2444) + 1;
    uint _2454 = uint(int(uint(_2452) >> uint(2)));
    int _2456 = _2452 & 3;
    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[int(_2454)][_2456];
    int _2460 = as_type<int>(_2388);
    float _2462 = _2352;
    float _2464 = _2348;
    if (!_2440)
    {
        int _2466 = _2262 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2468 = _2466 + _2380;
        _2326 = _2468;
    }
    int _2470 = _2326;
    bool _2472 = _2418 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2474 = _2346 + 96;
    uint _2476 = uint(int(uint(_2474) >> uint(2)));
    uint _2478 = uint(int(uint(int(_2476)) >> uint(2)));
    int _2480 = int(_2476) & 3;
    float _2482 = (*spvDescriptorSet0.vp_c15)._m0[int(_2478)][_2480];
    int _2484 = int(_2476) + 1;
    uint _2486 = uint(int(uint(_2484) >> uint(2)));
    int _2488 = _2484 & 3;
    float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
    float _2492 = _1424 + _2386;
    float _2494 = _2492;
    float _2496 = _2418;
    if (!_2440)
    {
        int _2498 = _2470 << 2;
        _2328 = _2498;
    }
    int _2500 = _2328;
    int _2502 = _2500;
    if (!_2440)
    {
        uint _2504 = uint(int(uint(_2470) >> uint(2)));
        _2460 = int(_2504);
    }
    int _2506 = _2460;
    float _2508 = as_type<float>(_2506);
    if (!_2440)
    {
        int _2510 = 12 & _2500;
        _2502 = _2510;
    }
    int _2512 = _2502;
    int _2514 = _2346 + 104;
    uint _2516 = uint(int(uint(_2514) >> uint(2)));
    uint _2518 = uint(int(uint(int(_2516)) >> uint(2)));
    int _2520 = int(_2516) & 3;
    float _2522 = (*spvDescriptorSet0.vp_c15)._m0[int(_2518)][_2520];
    int _2524 = int(_2516) + 1;
    uint _2526 = uint(int(uint(_2524) >> uint(2)));
    int _2528 = _2524 & 3;
    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[int(_2526)][_2528];
    float _2532 = as_type<float>(_2512);
    if (!_2440)
    {
        int _2534 = _2506 << 4;
        int _2536 = _2534 + _2512;
        _2508 = as_type<float>(_2536);
    }
    float _2538 = _2508;
    bool _2540 = !_2472;
    if (!_2540)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2546 = _2418 + _2544;
        float _2548 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = rsqrt(_2412);
        float _2552 = _2546 * _2542;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = _2554 * 6.283185482025146484375;
        float _2558 = cos(_2556);
        float _2560 = _2554 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = _2558 + (-1.0);
        float _2566 = fma(_2562, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2570 = _2550 * _2566;
        float _2572 = fma(_2492, _2558, _2568);
        float _2574 = fma(_2384, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2576 = fma(_2374, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2494 = _2572;
        _2462 = _2574;
        _2464 = _2576;
        _2496 = _2564;
        _2532 = _2562;
    }
    float _2578 = _2494;
    float _2580 = _2462;
    float _2582 = _2464;
    float _2584 = _2496;
    float _2586 = _2532;
    float _2588 = -_1424;
    float _2590 = _2588 + _2578;
    int _2592 = _2346 + 80;
    uint _2594 = uint(int(uint(_2592) >> uint(2)));
    uint _2596 = uint(int(uint(int(_2594)) >> uint(2)));
    int _2598 = int(_2594) & 3;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
    int _2602 = int(_2594) + 1;
    uint _2604 = uint(int(uint(_2602) >> uint(2)));
    int _2606 = _2602 & 3;
    float _2608 = (*spvDescriptorSet0.vp_c15)._m0[int(_2604)][_2606];
    float _2610 = -_1376;
    float _2612 = _2610 + _2580;
    float _2614 = -_1502;
    float _2616 = _2614 + _2582;
    float _2618 = _2590 * _2590;
    float _2620 = _2140 * _2490;
    float _2622 = _2586;
    float _2624 = _2584;
    float _2626 = _2580;
    float _2628 = _2578;
    float _2630 = _2582;
    if (!_2440)
    {
        float _2632 = floor(_2304);
        _2622 = _2632;
    }
    float _2634 = _2622;
    float _2636 = _2140 * _2436;
    float _2638 = fma(_2612, _2612, _2618);
    int _2640 = _2346 + 88;
    uint _2642 = uint(int(uint(_2640) >> uint(2)));
    uint _2644 = uint(int(uint(int(_2642)) >> uint(2)));
    int _2646 = int(_2642) & 3;
    float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
    int _2650 = int(_2642) + 1;
    uint _2652 = uint(int(uint(_2650) >> uint(2)));
    int _2654 = _2650 & 3;
    float _2656 = (*spvDescriptorSet0.vp_c15)._m0[int(_2652)][_2654];
    float _2658 = fma(_1828, _2482, _2620);
    float _2660 = fma(_1828, _2428, _2636);
    float _2662 = fma(_2616, _2616, _2638);
    float _2664 = fma(_1836, _2522, _2658);
    if (!_2440)
    {
        float _2666 = floor(_2168);
        _2624 = _2666;
    }
    float _2668 = _2624;
    bool _2670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2672 = isnan(0.5);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2678 = _2674 || _2676;
    float _2680 = _2538;
    if (!_2440)
    {
        int _2682 = as_type<int>(_2538) + 400;
        uint _2684 = uint(int(uint(_2682) >> uint(2)));
        uint _2686 = uint(int(uint(int(_2684)) >> uint(2)));
        int _2688 = int(_2684) & 3;
        float _2690 = (*spvDescriptorSet0.vp_c15)._m0[int(_2686)][_2688];
        _2680 = _2690;
    }
    float _2692 = _2680;
    float _2694 = _2664 + _2530;
    float _2696 = _2140 * _2370;
    float _2698 = fma(_1836, _2450, _2660);
    float _2700 = sqrt(_2662);
    float _2702 = fma(_1828, _2362, _2696);
    float _2704 = fma(_1836, _2400, _2702);
    float _2706 = 1.0 / _2694;
    bool _2708 = _2700 > 0.0;
    bool _2710 = !_2708;
    if (!_2710)
    {
        float _2712 = _357 * _357;
        float _2714 = rsqrt(_2662);
        float _2716 = fma(_245, _245, _2712);
        float _2718 = fma(_359, _359, _2716);
        float _2720 = sqrt(_2718);
        float _2722 = _2612 * _2714;
        float _2724 = _2590 * _2714;
        float _2726 = _2616 * _2714;
        bool _2728 = _2720 > 0.0;
        bool _2730 = !_2728;
        if (!_2730)
        {
            float _2732 = rsqrt(_2718);
            float _2734 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2736 = _357 * _2732;
            float _2738 = _245 * _2732;
            float _2740 = _2724 * _2736;
            float _2742 = _359 * _2732;
            float _2744 = fma(_2722, _2738, _2740);
            float _2746 = _2734 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2748 = fma(_2726, _2742, _2744);
            float _2750 = _2748 * _2746;
            float _2752 = fma(_245, _2750, _2580);
            float _2754 = fma(_357, _2750, _2578);
            float _2756 = fma(_359, _2750, _2582);
            _2626 = _2752;
            _2628 = _2754;
            _2630 = _2756;
        }
    }
    float _2758 = _2626;
    float _2760 = _2628;
    float _2762 = _2630;
    float _2764 = -_1816;
    float _2766 = fma(_2764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2758);
    float _2768 = -_1806;
    float _2770 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2760);
    float _2772 = -_1824;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2762);
    float _2776 = _2704 + _2408;
    float _2778 = _2698 + _2458;
    float _2780 = _2770;
    float _2782 = _2766;
    float _2784 = _2774;
    if (!_2678)
    {
        float _2786 = _1832 * _1832;
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2790 = -_1376;
        float _2792 = _2790 + _2758;
        float _2794 = -_1424;
        float _2796 = _2794 + _2760;
        float _2798 = fma(_1840, _1840, _2786);
        float _2800 = -_1502;
        float _2802 = _2800 + _2762;
        float _2804 = fma(_1846, _1846, _2798);
        float _2806 = 1.0 / _2242;
        float _2808 = sqrt(_2804);
        float _2810 = _2792 * _2806;
        float _2812 = _2796 * _2806;
        float _2814 = _2802 * _2806;
        bool _2816 = _2808 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2818 = isnan(_2808);
        bool _2820 = _2816 || _2818;
        bool _2822 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2824 = _2820 || _2822;
        float _2826 = precise::min(_2808, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2828 = _2826 * _2788;
        float _2830 = fma(_2810, _2828, _1828);
        float _2832 = fma(_2812, _2828, _1822);
        float _2834 = _2766;
        float _2836 = _2808;
        float _2838 = _2828;
        float _2840 = _2832;
        if (_2824)
        {
            float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2834 = _2842;
        }
        float _2844 = _2834;
        if (_2824)
        {
            float _2846 = precise::max(_2808, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2836 = _2846;
        }
        float _2848 = _2836;
        float _2850 = fma(_2814, _2828, _1836);
        float _2852 = _2844;
        _2784 = _2850;
        _1854 = _2848;
        if (_2824)
        {
            float _2854 = _2848 * _2844;
            _2838 = _2854;
        }
        float _2856 = _2838;
        if (!_2824)
        {
            _2852 = _2830;
        }
        float _2858 = _2852;
        float _2860 = _2858;
        if (_2824)
        {
            float _2862 = fma(_2812, _2856, _1822);
            _2840 = _2862;
        }
        float _2864 = _2840;
        _2780 = _2864;
        if (_2824)
        {
            float _2866 = fma(_2810, _2856, _1828);
            _2860 = _2866;
        }
        float _2868 = _2860;
        _2782 = _2868;
        if (_2824)
        {
            float _2870 = fma(_2814, _2856, _1836);
            _2784 = _2870;
        }
    }
    float _2872 = _2780;
    float _2874 = _2782;
    float _2876 = _2784;
    float _2878 = _1854;
    float _2880 = _2776 * _2706;
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2884 = _2778 * _2706;
    float _2886 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2888 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2890 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2882);
    bool _2892 = _2880 >= 0.0;
    float _2894 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2886);
    float _2896 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2888);
    float _2898 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2890);
    float _2900 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2902 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2894);
    float _2904 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2896);
    float _2906 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2908 = _2880 <= 1.0;
    bool _2910 = _2908 && _2892;
    float _2912 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2914 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2900);
    float _2916 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2918 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2920 = _2884 >= 0.0;
    bool _2922 = _2920 && _2910;
    float _2924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2926 = _2912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2928 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2914);
    float _2930 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2918);
    bool _2932 = _2884 <= 1.0;
    bool _2934 = _2932 && _2922;
    float _2936 = -_2926;
    float _2938 = fma(_2936, _2924, 1.0);
    float _2940 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2942 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2930);
    float _2944 = _2140 * _2608;
    float _2946 = log2(_2938);
    float _2948 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2950 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2942);
    float _2952 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2954 = fma(_1828, _2600, _2944);
    float _2956 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2948);
    float _2958 = _2944;
    float _2960 = _2938;
    float _2962 = _2878;
    if (!_2440)
    {
        float _2964 = -_2668;
        float _2966 = _2168 + _2964;
        _1818 = _2966;
    }
    float _2968 = _1818;
    float _2970 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2952);
    float _2972 = 1.0 / _2950;
    if (_2934)
    {
        float _2974 = float(_2338);
        _2958 = _2974;
    }
    float _2976 = _2958;
    float _2978 = fma(_1836, _2648, _2954);
    float _2980 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2956);
    float _2982 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2970);
    if (!_2440)
    {
        float _2984 = -_2634;
        float _2986 = _2304 + _2984;
        _2960 = _2986;
    }
    float _2988 = _2960;
    float _2990 = _2978 + _2656;
    float _2992 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2980);
    float _2994 = _2698;
    float _2996 = _2992;
    if (!_2440)
    {
        float _2998 = rint(_2692);
        float _3000 = precise::max(_2998, 0.0);
        uint _3002 = uint(_3000);
        uint _3004 = clamp(_3002, 0u, 65535u);
        _2994 = as_type<float>(_3004);
    }
    float _3006 = _2994;
    float _3008 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2982);
    float _3010 = _2946 * 0.693147182464599609375;
    float _3012 = _2990 * _2706;
    float _3014 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = _2976;
    if (_2934)
    {
        float _3018 = rint(_2976);
        float _3020 = precise::max(_3018, 0.0);
        uint _3022 = uint(_3020);
        uint _3024 = clamp(_3022, 0u, 65535u);
        _3016 = as_type<float>(_3024);
    }
    float _3026 = _3016;
    float _3028 = _2992 * _2972;
    float _3030 = _3008 * _2972;
    float _3032 = fma(_3028, 0.5, 0.5);
    float _3034 = fma(_3030, -0.5, 0.5);
    float _3036 = _2968;
    float _3038 = _3034;
    float _3040 = _3032;
    if (!_2440)
    {
        float3 _8696 = float3(_2988, _2968, float(as_type<int>(_3006)));
        float3 _8700 = select(_8696, float3(0.0), isnan(_8696));
        float _3042 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8700.xy, uint(rint(_8700.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8700.xy, uint(rint(_8700.z)), level(0.0)).x;
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = _2884;
    if (_2934)
    {
        float3 _8715 = float3(_2880, _2884, float(as_type<int>(_3026)));
        float3 _8717 = select(_8715, float3(0.0), isnan(_8715));
        float _3048 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8717.xy, uint(rint(_8717.z)), _3012, level(0.0));
        _3046 = _3048;
    }
    float _3050 = _3046;
    float3 _8727 = float3(_3032, _3034, _3014);
    float _3052 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8727, float3(0.0), isnan(_8727)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8727, float3(0.0), isnan(_8727)), level(0.0)).x;
    float3 _8736 = float3(_3032, _3034, _3014);
    float4 _3055 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8736, float3(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8736, float3(0.0), isnan(_8736)), level(0.0)).xyzw;
    float _3057 = _3055.x;
    float _3059 = _3055.y;
    float _3061 = _3055.z;
    float _3063 = _3055.w;
    bool _3065 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3067 = isnan(0.5);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3073 = _3069 || _3071;
    if (_2440)
    {
        _1856 = 1.0;
    }
    float _3075 = _1856;
    float _3077 = _3075;
    if (_3073)
    {
        _1858 = 1.0;
    }
    float _3079 = _1858;
    float _3081 = _3079;
    if (_3073)
    {
        _2962 = 1.0;
    }
    float _3083 = _2962;
    float _3085 = _3083;
    float _3087 = _3057;
    if (!_3073)
    {
        float _3089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3091 = _3089 * 0.15915493667125701904296875;
        float _3093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3095 = _3091 * 6.283185482025146484375;
        float _3097 = cos(_3095);
        float _3099 = _3093 * 0.15915493667125701904296875;
        float _3101 = _3091 * 6.283185482025146484375;
        float _3103 = sin(_3101);
        float _3105 = 1.0 / _3097;
        float _3107 = _3099 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = _3103 * _3105;
        float _3113 = _3099 * 6.283185482025146484375;
        float _3115 = sin(_3113);
        float _3117 = _3109 * _3111;
        float _3119 = 1.0 / _3117;
        float _3121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3121;
        float _3125 = 1.0 / _3123;
        float _3127 = _3115 * _3119;
        float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3131 = fma(_2286, _3127, _3129);
        float _3133 = _3131 * _3125;
        float _3135 = precise::clamp(_3133, 0.0, 1.0);
        _3038 = _3091;
        _3040 = _3099;
        _3085 = _3135;
    }
    float _3137 = _3038;
    float _3139 = _3040;
    float _3141 = _3085;
    float _3143 = _3137;
    float _3145 = _3139;
    if (!_3073)
    {
        float _3147 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3149 = _3147 * 0.15915493667125701904296875;
        float _3151 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3153 = _3149 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        float _3157 = _3151 * 0.15915493667125701904296875;
        float _3159 = _3149 * 6.283185482025146484375;
        float _3161 = sin(_3159);
        float _3163 = 1.0 / _3155;
        float _3165 = _3157 * 6.283185482025146484375;
        float _3167 = cos(_3165);
        float _3169 = _3161 * _3163;
        float _3171 = _3157 * 6.283185482025146484375;
        float _3173 = sin(_3171);
        float _3175 = _3167 * _3169;
        float _3177 = 1.0 / _3175;
        float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3181 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3179;
        float _3183 = 1.0 / _3181;
        float _3185 = _3173 * _3177;
        float _3187 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3189 = fma(_2286, _3185, _3187);
        float _3191 = _3189 * _3183;
        float _3193 = precise::clamp(_3191, 0.0, 1.0);
        float _3195 = -_3193;
        float _3197 = _3195 + 1.0;
        _3143 = _3163;
        _3145 = _3175;
        _3081 = _3197;
    }
    float _3199 = _3143;
    float _3201 = _3145;
    float _3203 = _3081;
    float _3205 = _3201;
    float _3207 = _3199;
    if (!_2440)
    {
        int _3209 = _2470 << 4;
        int _3211 = _3209 + 2048;
        uint _3213 = uint(int(uint(_3211) >> uint(2)));
        uint _3215 = uint(int(uint(int(_3213)) >> uint(2)));
        int _3217 = int(_3213) & 3;
        float _3219 = (*spvDescriptorSet0.vp_c15)._m0[int(_3215)][_3217];
        int _3221 = int(_3213) + 1;
        uint _3223 = uint(int(uint(_3221) >> uint(2)));
        int _3225 = _3221 & 3;
        float _3227 = (*spvDescriptorSet0.vp_c15)._m0[int(_3223)][_3225];
        int _3229 = _3211 + 8;
        uint _3231 = uint(int(uint(_3229) >> uint(2)));
        uint _3233 = uint(int(uint(int(_3231)) >> uint(2)));
        int _3235 = int(_3231) & 3;
        float _3237 = (*spvDescriptorSet0.vp_c15)._m0[int(_3233)][_3235];
        int _3239 = int(_3231) + 1;
        uint _3241 = uint(int(uint(_3239) >> uint(2)));
        int _3243 = _3239 & 3;
        float _3245 = (*spvDescriptorSet0.vp_c15)._m0[int(_3241)][_3243];
        float _3247 = _2140 * _3227;
        float _3249 = fma(_1828, _3219, _3247);
        float _3251 = fma(_1836, _3237, _3249);
        float _3253 = _3251 + _3245;
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        float _3257 = -_3255;
        float _3259 = _3257 + _3044;
        float _3261 = fma(_3259, 500.0, 1.5);
        float _3263 = exp2(_3261);
        float _3265 = 0.0 + _3263;
        float _3267 = precise::clamp(_3265, 0.0, 1.0);
        _3077 = _3267;
    }
    float _3269 = _3077;
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3273 = _2872 + _3271;
    float _3275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3277 = _2874 + _3275;
    float _3279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3281 = _2876 + _3279;
    float _3283 = _3273 * _3273;
    float _3285 = fma(_3277, _3277, _3283);
    float _3287 = fma(_3281, _3281, _3285);
    float _3289 = rsqrt(_3287);
    float _3291 = _3289 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3293 = _3277 * _3291;
    float _3295 = _3281 * _3291;
    float _3297 = _3293 * _3293;
    float _3299 = _3295 * _3295;
    float _3301 = _3297 + _3299;
    float _3303 = sqrt(_3301);
    bool _3305 = _3303 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3309 = _3303 + _3307;
    float _3311 = _3289;
    float _3313 = _3309;
    if (_3305)
    {
        float _3315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3311 = _3315;
    }
    float _3317 = _3311;
    if (_3305)
    {
        float _3319 = rsqrt(_3301);
        _3205 = _3319;
    }
    float _3321 = _3205;
    float _3323 = _3321;
    if (_3305)
    {
        float _3325 = _3309 * _3317;
        _3313 = _3325;
    }
    float _3327 = _3313;
    if (_3305)
    {
        float _3329 = _3327 * 0.15915493667125701904296875;
        _3207 = _3329;
    }
    float _3331 = _3207;
    float _3333 = _3317;
    float _3335 = _3331;
    if (_3305)
    {
        float _3337 = _3331 * 6.283185482025146484375;
        float _3339 = sin(_3337);
        _3333 = _3339;
    }
    float _3341 = _3333;
    float _3343 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3345 = precise::max(0.0, _3343);
    float _3347 = _3281;
    float _3349 = _3345;
    if (_3305)
    {
        float _3351 = _3331 * 6.283185482025146484375;
        float _3353 = cos(_3351);
        _3347 = _3353;
    }
    float _3355 = _3347;
    float _3357 = -_3291;
    float _3359 = -_3345;
    float _3361 = fma(_3273, _3357, _3359);
    float _3363 = _3361;
    if (_3305)
    {
        float _3365 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3349 = _3365;
    }
    float _3367 = _3349;
    float _3369 = _3341;
    float _3371 = _3367;
    if (_3305)
    {
        float _3373 = fma(_3341, _3367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3369 = _3373;
    }
    float _3375 = _3369;
    float _3377 = _3375;
    if (_3305)
    {
        float _3379 = _3355 + (-1.0);
        _3371 = _3379;
    }
    float _3381 = _3371;
    float _3383 = _3381;
    if (_3305)
    {
        float _3385 = _3321 * _3375;
        _2330 = _3385;
    }
    float _3387 = _2330;
    if (!_3305)
    {
        _3377 = _3293;
    }
    float _3389 = _3377;
    float _3391 = _3389;
    if (_3305)
    {
        float _3393 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3335 = _3393;
    }
    float _3395 = _3335;
    float _3397 = _3395;
    if (_3305)
    {
        float _3399 = _3293 * _3387;
        _3391 = _3399;
    }
    float _3401 = _3391;
    if (!_3305)
    {
        _3383 = _3295;
    }
    float _3403 = _3383;
    float _3405 = _3403;
    if (_3305)
    {
        float _3407 = _3295 * _3387;
        _3405 = _3407;
    }
    float _3409 = _3405;
    if (!_3305)
    {
        _3323 = _3297;
    }
    float _3411 = _3323;
    float _3413 = _3411;
    if (_3305)
    {
        float _3415 = fma(_3361, _3355, _3395);
        _3363 = _3415;
    }
    float _3417 = _3363;
    if (_3305)
    {
        float _3419 = _3401 * _3401;
        _3413 = _3419;
    }
    float _3421 = _3413;
    float _3423 = sqrt(_3287);
    if (!_3305)
    {
        _3397 = _3299;
    }
    float _3425 = _3397;
    float _3427 = _3425;
    if (_3305)
    {
        float _3429 = _3409 * _3409;
        _3427 = _3429;
    }
    float _3431 = _3427;
    float _3433 = fma(_3417, _3417, _3421);
    float _3435 = _3433 + _3431;
    float _3437 = rsqrt(_3435);
    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3441 = fma(_3423, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3439);
    float _3443 = precise::clamp(_3441, 0.0, 1.0);
    float _3445 = -_3443;
    float _3447 = _3445 + 1.0;
    float _3449 = abs(_3447);
    float _3451 = log2(_3449);
    float _3453 = _3437 * _3401;
    float _3455 = _3437 * _3417;
    float _3457 = _3437 * _3409;
    float _3459 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3461 = -_3459;
    float _3463 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3461);
    float _3465 = -_3457;
    float _3467 = fma(_3465, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3463);
    float _3469 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3471 = fma(_3467, -0.5, 0.5);
    float _3473 = fma(_3467, 0.5, 0.5);
    float _3475 = _3455 + 1.0;
    float _3477 = exp2(_3469);
    float _3479 = fma(_3473, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3481 = fma(_3473, _3479, -0.212114393711090087890625);
    float _3483 = sqrt(_3471);
    float _3485 = fma(_3473, _3481, 1.570728778839111328125);
    float _3487 = -_3455;
    float _3489 = fma(_3477, _3475, _3487);
    float _3491 = fma(_3489, 0.5, 0.5);
    float _3493 = _3483 * 0.636619746685028076171875;
    float _3495 = -_3485;
    float _3497 = fma(_3493, _3495, 1.0);
    float2 _9380 = float2(_3497, _3491);
    float3 _3501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9380, float2(0.0), isnan(_9380)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9380, float2(0.0), isnan(_9380)), level(0.0)).xyz;
    float _3503 = _3501.x;
    float _3505 = _3501.y;
    float _3507 = _3501.z;
    float _3509 = abs(_2286);
    float _3511 = log2(_3509);
    float _3513 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3515 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3517 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3519 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3521 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3513);
    float _3523 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3525 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3515);
    float _3527 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3529 = _2226 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3531 = -_2182;
    float _3533 = fma(_3531, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3523);
    float _3535 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3537 = -_2182;
    float _3539 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3527);
    float _3541 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3543 = -_2182;
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3529);
    float _3547 = _269 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3549 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3551 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3535);
    float _3553 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3555 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3533);
    float _3557 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3541);
    float _3559 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3539);
    float _3561 = exp2(_3549);
    float _3563 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3519);
    float _3565 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3567 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3545);
    float _3569 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3553);
    float _3571 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3521);
    float _3573 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3575 = _3547 * _3555;
    float _3577 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3565);
    float _3579 = _3547 * _3559;
    float _3581 = _3547 * _3567;
    float _3583 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3569);
    float _3585 = fma(_3573, _3571, _3575);
    float _3587 = _2950 * 0.5;
    float _3589 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3525);
    float _3591 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3551);
    float _3593 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3557);
    float _3595 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3577);
    float _3597 = fma(_3008, -0.5, _3587);
    float _3599 = fma(_3573, _3589, _3579);
    float _3601 = fma(_3561, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3603 = precise::clamp(_3601, 0.0, 1.0);
    float _3605 = _3451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3607 = _3593 + _3599;
    out.gl_Position.x = _2992;
    out.gl_Position.y = _3008;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _2950;
    float _3609 = fma(_3603, -2.0, 3.0);
    float _3611 = _3603 * _3603;
    bool _3613 = _2286 <= 8000.0;
    bool _3615 = isnan(_2286);
    bool _3617 = _3613 || _3615;
    bool _3619 = isnan(8000.0);
    bool _3621 = _3617 || _3619;
    float _3623 = float(_3621);
    float _3625 = exp2(_3605);
    float _3627 = _3583 + _2950;
    float _3629 = _3611 * _3609;
    float _3631 = -_1884;
    float _3633 = _3631 + 1.0;
    float _3635 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3563);
    float _3637 = _2992 + _2950;
    float _3639 = _3627 * 0.5;
    float _3641 = fma(_3573, _3635, _3581);
    float _3643 = _3591 + _3585;
    float _3645 = -_3629;
    float _3647 = _3645 + 1.0;
    float _3649 = _3641;
    if (!_2934)
    {
        _2996 = 1.0;
    }
    float _3651 = _2996;
    float _3653 = _3637 * 0.5;
    float _3655 = _3651;
    if (_2934)
    {
        bool _3657 = _3050 >= _3012;
        bool _3659 = isnan(_3050);
        bool _3661 = _3657 || _3659;
        bool _3663 = isnan(_3012);
        bool _3665 = _3661 || _3663;
        float _3667 = float(_3665);
        _3655 = _3667;
    }
    float _3669 = _3655;
    float _3671 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3629);
    float _3673 = _3595 + _3641;
    float _3675 = -_3625;
    float _3677 = _3675 + 1.0;
    out.m_88.x = _3653;
    out.m_88.y = _3597;
    out.m_88.z = _3639;
    out.m_88.w = _2950;
    float _3679 = _3623 * _3671;
    float _3681 = _3669 * _3269;
    float _3683 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_90.x = _3643;
    out.m_90.y = _3607;
    out.m_90.z = _3673;
    float _3685 = _3679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3687 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3689 = isnan(_3423);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3695 = _3691 || _3693;
    float _3697 = _3683 * _3052;
    float _3699 = -_3683;
    float _3701 = _3699 + 1.0;
    float _3703 = _3633 * _3685;
    float _3705 = precise::clamp(_3703, 0.0, 1.0);
    float _3707 = _3063 * _3697;
    float _3709 = _3063 * _3701;
    float _3711 = -_3705;
    float _3713 = fma(_3711, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3715 = -_3681;
    float _3717 = fma(_3715, _3713, 1.0);
    float _3719 = precise::clamp(_3717, 0.0, 1.0);
    float _3721 = _3683;
    float _3723 = _3701;
    float _3725 = _3713;
    if (!_3695)
    {
        _3649 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3727 = _3649;
    float _3729 = _3719 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3731 = _3141 * _3203;
    float _3733 = _3731;
    float _3735 = _3727;
    float _3737 = _3727;
    if (!_3695)
    {
        _3721 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3739 = _3721;
    float _3741 = _3739;
    float _3743 = _3739;
    if (!_3695)
    {
        _3723 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3745 = _3723;
    out.m_92.x = _3729;
    float _3747 = _3731 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3749 = _3745;
    float _3751 = _3745;
    if (!_3695)
    {
        _3725 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3753 = _3725;
    float _3755 = _3753;
    float _3757 = _3753;
    if (!_3695)
    {
        _3733 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3759 = _3733;
    float _3761 = _3507 * _3697;
    float _3763 = fma(_3503, _3707, _3057);
    float _3765 = fma(_3505, _3707, _3059);
    float _3767 = _3759;
    float _3769 = _3759;
    if (!_3695)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3771 = _3087;
    float _3773 = fma(_3063, _3761, _3061);
    out.m_94.x = _3763;
    out.m_94.y = _3765;
    out.m_94.z = _3773;
    out.m_94.w = _3709;
    bool _3775 = !_3695;
    float _3777 = _3771;
    float _3779 = _3771;
    if (!_3775)
    {
        bool _3781 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3783 = isnan(_3423);
        bool _3785 = _3781 || _3783;
        bool _3787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3789 = _3785 || _3787;
        if (!_3789)
        {
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3793 = _3423 + _3791;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3797 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3795;
            float _3799 = 1.0 / _3797;
            float _3801 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3805 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3807 = _3805 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3815 = _3813 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3821 = _3793 * _3799;
            float _3823 = precise::clamp(_3821, 0.0, 1.0);
            float _3825 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3829 = fma(_3823, _3803, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3831 = fma(_3823, _3827, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3833 = fma(_3823, _3807, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3835 = fma(_3823, _3811, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3837 = fma(_3823, _3815, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3839 = fma(_3823, _3819, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3779 = _3831;
            _3757 = _3837;
            _3737 = _3829;
            _3751 = _3835;
            _3743 = _3833;
            _3769 = _3839;
            _3841 = true;
        }
        else
        {
            bool _3843 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3845 = isnan(_3423);
            bool _3847 = _3843 || _3845;
            bool _3849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3851 = _3847 || _3849;
            if (!_3851)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3853 = _3735;
            _3737 = _3853;
            if (!_3851)
            {
                _3777 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3855 = _3777;
            _3779 = _3855;
            if (!_3851)
            {
                _3741 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3857 = _3741;
            _3743 = _3857;
            if (!_3851)
            {
                _3749 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3859 = _3749;
            _3751 = _3859;
            if (!_3851)
            {
                _3755 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3861 = _3755;
            _3757 = _3861;
            if (!_3851)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3863 = _3767;
            bool _3865 = !_3851;
            _3769 = _3863;
            if (!_3865)
            {
                bool _3867 = _3423 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3869 = isnan(_3423);
                bool _3871 = _3867 || _3869;
                bool _3873 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3875 = _3871 || _3873;
                if (!_3875)
                {
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3879 = _3423 + _3877;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3883 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3881;
                    float _3885 = 1.0 / _3883;
                    float _3887 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3893 = _3891 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3907 = _3879 * _3885;
                    float _3909 = precise::clamp(_3907, 0.0, 1.0);
                    float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3915 = fma(_3909, _3889, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3917 = fma(_3909, _3913, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3919 = fma(_3909, _3893, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3921 = fma(_3909, _3897, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3923 = fma(_3909, _3901, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3925 = fma(_3909, _3905, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3779 = _3917;
                    _3757 = _3923;
                    _3737 = _3915;
                    _3751 = _3921;
                    _3743 = _3919;
                    _3769 = _3925;
                    _3841 = true;
                }
                else
                {
                    _3779 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3757 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3751 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3743 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3841 = false;
    float _3927 = _3779;
    float _3929 = _3757;
    float _3931 = _3737;
    float _3933 = _3751;
    float _3935 = _3743;
    float _3937 = _3769;
    float _3939 = fma(_3607, -0.5, 0.5);
    float _3941 = precise::clamp(_3939, 0.0, 1.0);
    float _3943 = -_3927;
    float _3945 = _3943 + _3929;
    float _3947 = _3747 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3949 = -_3931;
    float _3951 = _3949 + _3933;
    float _3953 = fma(_3941, _3945, _3927);
    out.m_96.x = 0.0;
    float _3955 = -_3935;
    float _3957 = _3955 + _3937;
    float _3959 = fma(_3941, _3951, _3931);
    float _3961 = _3953 * 0.586610972881317138671875;
    out.m_59.x = _3947;
    bool _3963 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3965 = fma(_3941, _3957, _3935);
    float _3967 = fma(_3959, 0.298911988735198974609375, _3961);
    bool _3969 = _3141 > 0.0;
    bool _3971 = isnan(_3141);
    bool _3973 = _3969 || _3971;
    bool _3975 = isnan(0.0);
    bool _3977 = _3973 || _3975;
    float _3979 = fma(_3965, 0.114477999508380889892578125, _3967);
    bool _3981 = _3203 <= 0.0;
    bool _3983 = !_3977;
    bool _3985 = _3981 || _3983;
    float _3987 = -_3979;
    float _3989 = _3959 + _3987;
    float _3991 = -_3979;
    float _3993 = _3953 + _3991;
    float _3995 = -_3979;
    float _3997 = _3965 + _3995;
    float _3999 = fma(_3989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    float _4001 = fma(_3993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    float _4003 = fma(_3997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3979);
    bool _4005 = !_3963;
    if (!_4005)
    {
        float _4007 = -_2872;
        float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4011 = -_2874;
        float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4015 = -_2876;
        float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4019 = _4009 * _4009;
        float _4021 = fma(_4013, _4013, _4019);
        float _4023 = fma(_4017, _4017, _4021);
        float _4025 = sqrt(_4023);
        float _4027 = rsqrt(_4023);
        float _4029 = -_4025;
        float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4033 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4035 = precise::clamp(_4033, 0.0, 1.0);
        float _4037 = _4013 * _4027;
        float _4039 = _4009 * _4027;
        float _4041 = abs(_4035);
        float _4043 = log2(_4041);
        float _4045 = _4017 * _4027;
        float _4047 = _4037 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4049 = _3607 * _4039;
        float _4051 = -_4039;
        float _4053 = -_4047;
        float _4055 = fma(_4051, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4053);
        float _4057 = fma(_3643, _4037, _4049);
        float _4059 = -_4045;
        float _4061 = fma(_4059, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4055);
        float _4063 = fma(_3673, _4045, _4057);
        float _4065 = precise::clamp(_4063, 0.0, 1.0);
        float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4069 = _4061 + _4067;
        float _4071 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4073 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4075 = precise::clamp(_4073, 0.0, 1.0);
        float _4077 = exp2(_4071);
        float _4079 = _4077 * _4075;
        float _4081 = _4065 * _4079;
        float _4083 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4085 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4087 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _4083;
        out.m_96.y = _4085;
        out.m_96.z = _4087;
    }
    out.m_98.x = _3999;
    out.m_98.y = _4001;
    out.m_98.z = _4003;
    if (!_3985)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4089;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

