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
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_80 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_90 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_104 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_96 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_102 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_100 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_82 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4809 = false;
    bool _4639 = false;
    bool _3122 = false;
    bool _3110 = false;
    bool _725 = false;
    bool _539 = false;
    bool _347 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _5042 = as_type<float>(_139);
        out.gl_Position.z = _5042;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5112 = as_type<float>(_177);
        out.gl_Position.z = _5112;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = in.m_65.x;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _183 = _157 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_70.x;
    float _189 = in.m_70.y;
    float _191 = in.m_70.z;
    float _193 = in.m_72.x;
    float _195 = in.m_72.y;
    float _197 = in.m_72.z;
    float _199 = in.m_74.x;
    float _201 = in.m_74.y;
    float _203 = in.m_74.z;
    float _205 = _183 * _181;
    float _207 = in.m_76.x;
    float _209 = in.m_76.y;
    float _211 = in.m_76.z;
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[20].x, _205);
    int _215 = as_type<int>(_185) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_185) & 2;
    bool _221 = _219 != 0;
    float _223 = _213 * 6.283185482025146484375;
    float _225 = floor(_213);
    float _227 = _223 * 0.15915493667125701904296875;
    bool _229 = !_221;
    float _231 = _229 ? (-0.5) : 0.5;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = _189 * _195;
    int _243 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _245 = _243 != 0;
    float _247 = _227 * 6.283185482025146484375;
    float _249 = cos(_247);
    float _251 = _189 * _201;
    bool _253 = !_235;
    int _255 = _253 ? 0 : 1;
    float _257 = fma(_187, _193, _241);
    bool _259 = !_245;
    int _261 = _259 ? 0 : 1;
    float _263 = _189 * _209;
    int _265 = abs(_255);
    float _267 = fma(_187, _199, _251);
    float _269 = -_225;
    float _271 = _213 + _269;
    float _273 = fma(_187, _207, _263);
    float _275 = fma(_191, _197, _257);
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _279 = -_271;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = float(_265);
    int _285 = abs(_261);
    float _287 = fma(_249, 0.5, 0.5);
    bool _289 = !_239;
    int _291 = _289 ? 0 : 1;
    float _293 = abs(_281);
    float _295 = _283 * _293;
    bool _297 = _271 < 0.5;
    float _299 = float(_297);
    float _301 = -_287;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_291);
    float _307 = float(_285);
    float _309 = -_299;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = float(_305);
    float _315 = fma(_191, _203, _267);
    float _317 = fma(_191, _211, _273);
    float _319 = fma(_307, _303, _295);
    bool _321 = !_217;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = abs(_311);
    float _327 = fma(_313, _325, _319);
    bool _329 = !_277;
    float _345;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_123);
        float _351 = 1.0 / _349;
        float _353 = _157 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _359 = _355 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = _355 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _355 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    bool _381 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _383 = isnan(_355);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = 1.0 / _375;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _397 = 1.0 / _371;
    float _399 = 1.0 / _379;
    float _401 = _367 * _393;
    bool _403 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_355);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _359 * _397;
    bool _417 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _419 = isnan(_355);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_391;
    float _431 = _429 + 1.0;
    float _433 = _427 * _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = _363 * _399;
    bool _441 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_355);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_427;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _451 * _455;
    float _471 = -_451;
    float _473 = _471 + 1.0;
    float _475 = fma(_459, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = fma(_463, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = _413 * _473;
    float _481 = -_413;
    float _483 = _481 + 1.0;
    float _485 = fma(_437, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = _475 * _479;
    float _489 = _477 * _479;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _491;
    float _495 = fma(_467, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _487);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _489);
    float _505 = fma(_493, _439, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = fma(_485, _469, _497);
    float _509 = fma(_501, _439, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_495, _469, _503);
    float _513 = fma(_505, _433, _507);
    float _515 = fma(_509, _433, _511);
    float _517 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[146].x, _513);
    float _519 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[146].y, _515);
    bool _521 = !_395;
    float _537;
    if (!_521)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _179 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_123);
        float _543 = 1.0 / _541;
        float _545 = _157 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _547 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_547);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _555;
    float _591 = -_567;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    bool _599 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_547);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _587 * _593;
    float _613 = -_587;
    float _615 = _613 + 1.0;
    bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _619 = 1.0 / _571;
    float _621 = _609 * _615;
    float _623 = -_609;
    float _625 = _623 + 1.0;
    float _627 = 1.0 / _575;
    float _629 = _597 * _589;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _635 = fma(_629, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = _633 * _619;
    bool _639 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _641 = isnan(_547);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _657 = _547 + _655;
    float _659 = _635 * _621;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _547 + _661;
    float _665 = -_649;
    float _667 = _665 + 1.0;
    float _669 = fma(_637, _657, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _671 = _653 * _627;
    float _673 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _675 = _567 * _667;
    float _677 = fma(_671, _663, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _679 = fma(_669, _611, _673);
    float _681 = fma(_677, _675, _679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _687 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[118].x, _681);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _691 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = in.m_78.x;
    float _701 = in.m_78.y;
    out.m_80.x = _691;
    out.m_80.y = _693;
    out.m_80.z = _697;
    out.m_80.w = _695;
    float _703 = _519 * _701;
    float _705 = _517 * _699;
    bool _707 = !_617;
    float _723;
    if (!_707)
    {
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _711 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        float _727 = float(_123);
        float _729 = 1.0 / _727;
        float _731 = _157 * _729;
        _723 = _731;
    }
    _725 = false;
    float _733 = _723;
    float _735 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _737 = int(_735);
    float _739 = in.m_72.w;
    bool _741 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _743 = isnan(_733);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _755 = _733 + _753;
    float _757 = _327 * _703;
    float _759 = -_751;
    float _761 = _759 + 1.0;
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _765 = int(_763);
    float _767 = float(_737);
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _771 = int(_769);
    float _773 = float(uint(_765));
    float _775 = 1.0 / _767;
    int _777 = ~_765;
    int _779 = _777 + 1;
    int _781 = ~_765;
    int _783 = _781 + 1;
    bool _785 = _765 == 0;
    int _787 = ~_765;
    int _789 = _787 + 1;
    float _791 = 1.0 / _773;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _795 = _793 != 0;
    float _797 = _775 * _157;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _801 = int(_799);
    int _803 = as_type<int>(_791) + (-2);
    float _805 = trunc(_797);
    int _807 = int(_805);
    float _809 = float(uint(_801));
    int _811 = ~_801;
    int _813 = _811 + 1;
    float _815 = 1.0 / _809;
    int _817 = ~_801;
    int _819 = _817 + 1;
    float _821 = float(uint(_807));
    float _823 = as_type<float>(_803) * _821;
    float _825 = trunc(_823);
    float _827 = precise::max(_825, 0.0);
    uint _830 = uint(_827);
    int _832 = as_type<int>(_815) + (-2);
    int _834 = _779 * int(_830);
    int _836 = _834 + _807;
    float _838 = float(uint(_836));
    float _840 = as_type<float>(_803) * _838;
    float _842 = float(_771);
    float _844 = as_type<float>(_771);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_795)
    {
        _844 = 1.0;
    }
    float _848 = _844;
    float _850 = 1.0 / _842;
    float _852 = _848;
    if (!_795)
    {
        _852 = 7.345489978790283203125;
    }
    float _854 = _852;
    float _856 = _854 * _179;
    float _858 = trunc(_840);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    float _864 = floor(_856);
    float _866 = _850 * _157;
    int _868 = int(_830) + int(_862);
    float _870 = trunc(_866);
    int _872 = int(_870);
    float _874 = float(_765);
    float _876 = float(_807);
    bool _878 = _876 >= _874;
    bool _880 = isnan(_876);
    bool _882 = _878 || _880;
    bool _884 = isnan(_874);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    int _890 = _783 * _868;
    int _892 = _890 + _807;
    float _894 = float(_123);
    float _896 = -_864;
    float _898 = _856 + _896;
    bool _900 = uint(_892) >= uint(_765);
    float _902 = trunc(_888);
    int _904 = int(_902);
    float _906 = _898 * _874;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _914 = _912 != 0;
    int _916 = ~_868;
    int _918 = _916 + _910;
    int _920 = _918 + 1;
    float _922 = 1.0 / _894;
    bool _924 = !_914;
    int _926 = _924 ? 0 : 1;
    float _928 = float(uint(_872));
    int _930 = _765 * _920;
    int _932 = _930 + _807;
    int _934 = abs(_926);
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _938 = _936 != 0;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _942 = _940 != 0;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _946 = _944 != 0;
    float _948 = trunc(_906);
    int _950 = int(_948);
    int _952 = ~_904;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = as_type<float>(_832) * _928;
    bool _960 = !_785;
    int _962 = _960 ? _932 : (-1);
    int _964 = _765 + (-1);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _968 = _966 != 0;
    int _970 = _962 * _956;
    float _972 = _922 * _157;
    float _974 = trunc(_958);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    float _980 = float(_872);
    int _982 = _904 * _964;
    int _984 = _982 + _970;
    float _986 = _874 * _972;
    bool _988 = !_942;
    int _990 = _988 ? 0 : 1;
    int _992 = _950 * _934;
    int _994 = _992 + _807;
    int _996 = ~_801;
    int _998 = _996 + 1;
    float _1000 = trunc(_986);
    int _1002 = int(_1000);
    bool _1004 = !_938;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = abs(_990);
    bool _1010 = !_946;
    int _1012 = _1010 ? 0 : 1;
    int _1014 = _998 * int(_978);
    int _1016 = _1014 + _872;
    int _1018 = abs(_1006);
    int _1020 = _984 * _1008;
    bool _1022 = !_968;
    int _1024 = _1022 ? 0 : 1;
    int _1026 = abs(_1012);
    float _1028 = float(uint(_1016));
    int _1030 = abs(_1024);
    int _1032 = _1002 * _1018;
    int _1034 = _1032 + _1020;
    float _1036 = as_type<float>(_832) * _1028;
    float _1038 = in.m_65.y;
    int _1040 = _994 * _1026;
    int _1042 = _1040 + _1034;
    float _1044 = trunc(_1036);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1052 = _1050 != 0;
    int _1054 = _950 * _1030;
    int _1056 = _1054 + _1042;
    bool _1058 = _801 == 0;
    float _1060 = float(uint(_1056));
    float _1062 = as_type<float>(_803) * _1060;
    float _1064 = float(_801);
    int _1066 = int(_978) + int(_1048);
    float _1068 = trunc(_1062);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = as_type<float>(_1048);
    if (_1052)
    {
        _1074 = _179;
    }
    float _1076 = _1074;
    float _1078 = _1076;
    if (_1052)
    {
        _846 = 1.0;
    }
    float _1080 = _846;
    int _1082 = _813 * _1066;
    int _1084 = _1082 + _872;
    float _1086 = _1080;
    if (!_1052)
    {
        _1078 = _1038;
    }
    float _1088 = _1078;
    float _1090 = _1038 + (-0.5);
    if (!_1052)
    {
        _1086 = 1.2345600128173828125;
    }
    float _1092 = _1086;
    bool _1094 = _980 >= _1064;
    bool _1096 = isnan(_980);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(_1064);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    int _1106 = ~_765;
    int _1108 = _1106 + 1;
    float _1110 = _1088 * _1092;
    bool _1112 = uint(_1084) >= uint(_801);
    float _1114 = trunc(_1104);
    int _1116 = int(_1114);
    int _1118 = _1108 * int(_1072);
    int _1120 = _1118 + _1056;
    bool _1122 = !_1112;
    int _1124 = _1122 ? 0 : (-1);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1128 = _1126 != 0;
    float _1130 = float(uint(_1120));
    float _1132 = floor(_1110);
    int _1134 = ~_1066;
    int _1136 = _1134 + _1124;
    int _1138 = _1136 + 1;
    float _1140 = as_type<float>(_803) * _1130;
    bool _1142 = !_1128;
    int _1144 = _1142 ? 0 : 1;
    int _1146 = _801 * _1138;
    int _1148 = _1146 + _872;
    int _1150 = _801 + (-1);
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = ~_1116;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    bool _1164 = !_1058;
    int _1166 = _1164 ? _1148 : (-1);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1182 = _1180 != 0;
    bool _1184 = _765 == 0;
    float _1186 = -_1132;
    float _1188 = _1110 + _1186;
    int _1190 = _1166 * _1162;
    float _1192 = _1064 * _972;
    bool _1194 = !_1174;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = _1188 * _1064;
    float _1200 = float(uint(_994));
    int _1202 = _1116 * _1150;
    int _1204 = _1202 + _1190;
    int _1206 = abs(_1196);
    float _1208 = trunc(_1192);
    int _1210 = int(_1208);
    bool _1212 = !_1170;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = as_type<float>(_803) * _1200;
    int _1218 = int(_1072) + int(_1156);
    int _1220 = _1204 * _1206;
    int _1222 = ~_765;
    int _1224 = _1222 + 1;
    int _1226 = abs(_1214);
    float _1228 = trunc(_1198);
    int _1230 = int(_1228);
    int _1232 = abs(_1144);
    int _1234 = _1224 * _1218;
    int _1236 = _1234 + _1056;
    bool _1238 = !_1178;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = ~_765;
    int _1244 = _1242 + 1;
    int _1246 = abs(_1240);
    float _1248 = trunc(_1216);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    int _1254 = _1210 * _1226;
    int _1256 = _1254 + _1220;
    bool _1258 = uint(_1236) >= uint(_765);
    float _1260 = _179 * 2.0;
    bool _1262 = !_1258;
    int _1264 = _1262 ? 0 : (-1);
    int _1266 = _1230 * _1232;
    int _1268 = _1266 + _872;
    bool _1270 = !_1182;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = ~_1218;
    int _1276 = _1274 + _1264;
    int _1278 = _1276 + 1;
    int _1280 = _1268 * _1246;
    int _1282 = _1280 + _1256;
    int _1284 = abs(_1272);
    float _1286 = in.m_65.z;
    float _1288 = floor(_1260);
    int _1290 = _1244 * int(_1252);
    int _1292 = _1290 + _994;
    float _1294 = _1038 * 2.0;
    int _1296 = _1230 * _1284;
    int _1298 = _1296 + _1282;
    int _1300 = _765 * _1278;
    int _1302 = _1300 + _1056;
    float _1304 = float(uint(_1292));
    float _1306 = floor(_1294);
    bool _1308 = !_1184;
    int _1310 = _1308 ? _1302 : (-1);
    float _1312 = as_type<float>(_803) * _1304;
    float _1314 = float(uint(_1298));
    int _1316 = _1310 & 3;
    bool _1318 = _1316 != 0;
    float _1320 = trunc(_1312);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = as_type<float>(_832) * _1314;
    bool _1328 = uint(_1316) > 1u;
    int _1330 = _1310 & 3;
    bool _1332 = _1330 != 0;
    bool _1334 = uint(_1316) >= 2u;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = _1332 ? 0 : 1;
    bool _1344 = _1316 != 3;
    int _1346 = ~_1342;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _1350;
    float _1354 = as_type<float>(_1156);
    if (!_1328)
    {
        int _1356 = ~_1342;
        int _1358 = _1356 + 1;
        _1352 = _1358;
    }
    int _1360 = _1352;
    int _1362 = int(_1252) + int(_1324);
    int _1364 = _1334 ? 0 : 1;
    bool _1366 = _1288 > 0.0;
    int _1368 = _819 * int(_1340);
    int _1370 = _1368 + _1298;
    bool _1372 = _1288 >= 0.0;
    bool _1374 = isnan(_1288);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    float _1382 = _1286 * 2.0;
    int _1384 = ~_1364;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    int _1390 = _1388;
    if (_1344)
    {
        int _1392 = ~_1364;
        int _1394 = _1392 + 1;
        _1390 = _1394;
    }
    int _1396 = _1390;
    float _1398 = float(uint(_1370));
    float _1400 = floor(_1382);
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1404 = _1402 != 0;
    int _1406 = _789 * _1362;
    int _1408 = _1406 + _994;
    int _1410 = _1380 ? 0 : 1;
    float _1412 = as_type<float>(_832) * _1398;
    bool _1414 = !_1404;
    int _1416 = _1414 ? 0 : 1;
    bool _1418 = _1306 > 0.0;
    float _1420 = trunc(_1412);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1410;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    bool _1432 = _1306 >= 0.0;
    bool _1434 = isnan(_1306);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    int _1442 = _1430;
    int _1444 = _1410;
    if (!_1366)
    {
        int _1446 = ~_1410;
        int _1448 = _1446 + 1;
        _1442 = _1448;
    }
    int _1450 = _1442;
    bool _1452 = uint(_1408) >= uint(_765);
    if (_1052)
    {
        _1444 = 0;
    }
    int _1454 = _1444;
    int _1456 = _1440 ? 0 : 1;
    int _1458 = _1454;
    if (!_1052)
    {
        _1458 = 1;
    }
    int _1460 = _1458;
    bool _1462 = !_1452;
    int _1464 = _1462 ? 0 : (-1);
    int _1466 = ~_1456;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1478 = _1476 != 0;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1482 = _1480 != 0;
    int _1484 = _1470;
    if (!_1418)
    {
        int _1486 = ~_1456;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    bool _1492 = _1400 > 0.0;
    bool _1494 = _1400 >= 0.0;
    bool _1496 = isnan(_1400);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    bool _1504 = _1460 != 1;
    int _1506 = ~_1362;
    int _1508 = _1506 + _1464;
    int _1510 = _1508 + 1;
    float _1512 = in.m_58.x;
    float _1514 = in.m_58.y;
    float _1516 = in.m_58.z;
    int _1518 = ~_801;
    int _1520 = _1518 + 1;
    int _1522 = int(_1340) + int(_1424);
    int _1524 = _765 * _1510;
    int _1526 = _1524 + _994;
    int _1528 = _1502 ? 0 : 1;
    int _1530 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1532 = _1530 != 0;
    int _1534 = _1520 * _1522;
    int _1536 = _1534 + _1298;
    bool _1538 = !_1478;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = ~_1528;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _1546;
    float _1550 = as_type<float>(_1536);
    if (!_1492)
    {
        int _1552 = ~_1528;
        int _1554 = _1552 + 1;
        _1548 = _1554;
    }
    int _1556 = _1548;
    bool _1558 = _765 == 0;
    bool _1560 = uint(_1536) >= uint(_801);
    if (!_1504)
    {
        _1354 = _1038;
    }
    float _1562 = _1354;
    float _1564 = 0.0;
    float _1566 = _1562;
    if (!_1504)
    {
        _1564 = _1038;
    }
    float _1568 = _1564;
    float _1570 = _1568;
    if (!_1504)
    {
        _1550 = _1286;
    }
    float _1572 = _1550;
    float _1574 = _209 * _1514;
    float _1576 = 0.0;
    float _1578 = _1572;
    if (!_1504)
    {
        _1576 = _1286;
    }
    float _1580 = _1576;
    float _1582 = _201 * _1514;
    bool _1584 = !_1558;
    int _1586 = _1584 ? _1526 : (-1);
    float _1588 = fma(_207, _1512, _1574);
    bool _1590 = !_1474;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = fma(_199, _1512, _1582);
    float _1596 = _1580;
    if (_1504)
    {
        _1566 = _179;
    }
    float _1598 = _1566;
    float _1600 = fma(_211, _1516, _1588);
    if (_1504)
    {
        _1570 = _179;
    }
    float _1602 = _1570;
    float _1604 = fma(_203, _1516, _1594);
    if (_1504)
    {
        _1578 = _1038;
    }
    float _1606 = _1578;
    float _1608 = in.m_76.w;
    if (_1504)
    {
        _1596 = _1038;
    }
    float _1610 = _1596;
    bool _1612 = !_1560;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1632 = _1630 != 0;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1642 = _195 * _1514;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1652 = 1.0 / _1636;
    float _1654 = fma(_193, _1512, _1642);
    float _1656 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1658 = fma(_197, _1516, _1654);
    float _1660 = _179 + _1038;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1666 = 1.0 / _1640;
    float _1668 = _1658 + _739;
    float _1670 = float(_1450);
    float _1672 = _1600 + _1608;
    bool _1674 = !_1482;
    int _1676 = _1674 ? 0 : 1;
    float _1678 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1680 = _1668 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1682 = 1.0 / _1664;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1688 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1690 = abs(_1676);
    float _1692 = -_1684;
    float _1694 = fma(_1656, 2.0, _1692);
    float _1696 = fma(_1688, -2.0, _1686);
    float _1698 = _1660 + (-1.0);
    float _1700 = _1650 * _1652;
    float _1702 = _179 + _1286;
    float _1704 = in.m_74.w;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1706;
    float _1710 = _1286 + _1038;
    float _1712 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1714 = _1708 * _1682;
    float _1716 = _1702 + (-1.0);
    float _1718 = _1710 + (-1.0);
    bool _1720 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1722 = isnan(_733);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1646 * _1666;
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1740 = _733 + _1738;
    bool _1742 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1744 = isnan(_733);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1730;
    float _1756 = _1754 + 1.0;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1760 = _733 + _1758;
    float _1762 = fma(_1732, _1740, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1764 = fma(_1714, _755, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1766 = _1752 * _1756;
    float _1768 = fma(_1700, _1760, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1770 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1772 = isnan(_733);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = -_1752;
    float _1784 = _1782 + 1.0;
    float _1786 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1788 = log2(_1786);
    float _1790 = _1604 + _1704;
    float _1792 = _751 * _1784;
    int _1794 = abs(_1540);
    float _1796 = _1780 * _761;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1800 = _1762 * _1796;
    float _1802 = float(_1794);
    float _1804 = _1790 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1806 = -_1780;
    float _1808 = _1806 + 1.0;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1812 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1798);
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1816 = _1802 * _1670;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1820 = in.m_82.x;
    float _1822 = in.m_82.y;
    float _1824 = in.m_82.z;
    float _1826 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1800);
    float _1828 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1810);
    float _1830 = -_1814;
    float _1832 = fma(_1678, 2.0, _1830);
    float _1834 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1836 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1838 = float(_1490);
    float _1840 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1818);
    float _1842 = _1788 * _157;
    int _1844 = abs(_1592);
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1848 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1834);
    float _1850 = _1672 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1852 = exp2(_1842);
    float _1854 = float(_1690);
    float _1856 = fma(_1616, -2.0, _1846);
    float _1858 = _1816 * (-2.0);
    float _1860 = float(_1556);
    float _1862 = _1854 * _1838;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1848);
    float _1866 = float(_1844);
    float _1868 = fma(_1736, _1858, _1736);
    float _1870 = fma(_1858, _1822, _1822);
    float _1872 = float(uint(_1268));
    float _1874 = _1866 * _1860;
    float _1876 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1836);
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1880 = 1.0 + _1878;
    bool _1882 = !_1620;
    int _1884 = _1882 ? 0 : 1;
    float _1886 = -_1852;
    float _1888 = _1886 + 1.0;
    bool _1890 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1892 = isnan(0.0);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1898 = _1894 || _1896;
    float _1900 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1840);
    float _1902 = as_type<float>(_832) * _1872;
    float _1904 = 1.0 / _1880;
    float _1906 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1876);
    int _1908 = ~_1522;
    int _1910 = _1908 + _1614;
    int _1912 = _1910 + 1;
    float _1914 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1696);
    float _1916 = -_157;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1832);
    float _1920 = _1874 * (-2.0);
    float _1922 = _1898 ? _1888 : 0.0;
    float _1924 = trunc(_1902);
    float _1926 = precise::max(_1924, 0.0);
    uint _1928 = uint(_1926);
    bool _1930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1932 = isnan(1.0);
    bool _1934 = _1930 || _1932;
    bool _1936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1938 = _1934 || _1936;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1944 = -_157;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1694);
    float _1948 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1856);
    float _1950 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1940);
    float _1952 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1942);
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1956 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1812);
    float _1958 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1950);
    float _1960 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1952);
    float _1962 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1828);
    int _1964 = _801 * _1912;
    int _1966 = _1964 + _1298;
    if (_1938)
    {
        float _1968 = _1922 * _1904;
        _159 = _1968;
    }
    float _1970 = _159;
    int _1972 = ~_801;
    int _1974 = _1972 + 1;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1978 = _801 == 0;
    float _1980 = _1900 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1982 = fma(_1920, _1820, _1820);
    int _1984 = _1974 * int(_1928);
    int _1986 = _1984 + _1268;
    bool _1988 = !_1978;
    int _1990 = _1988 ? _1966 : (-1);
    float _1992 = fma(_1712, _1920, _1712);
    bool _1994 = !_1318;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2000 = _1980 * _1954;
    int _2002 = _1990 & 3;
    bool _2004 = _2002 != 0;
    float _2006 = _1864 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _2008 = float(uint(_1986));
    float _2010 = fma(_2000, 0.5, 0.5);
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : 1;
    float _2016 = _1862 * (-2.0);
    int _2018 = _1990 & 3;
    bool _2020 = _2018 != 0;
    float _2022 = as_type<float>(_832) * _2008;
    float _2024 = _1906 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _2026 = _2006 * _1976;
    int _2028 = _2020 ? 0 : 1;
    float _2030 = fma(_1734, _2016, _1734);
    bool _2032 = _1316 != 3;
    float _2034 = trunc(_2022);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = fma(_2016, _1824, _1824);
    float _2042 = _2024 * _1998;
    bool _2044 = !_2032;
    int _2046 = _2044 ? 0 : (-1);
    float _2048 = fma(_2026, 0.5, 0.5);
    bool _2050 = uint(_2002) > 1u;
    float _2052 = _179 + (-0.5);
    float _2054 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1870);
    bool _2056 = _179 > 0.5;
    float _2058 = _1286 + (-0.5);
    float _2060 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1982);
    float _2062 = fma(_1868, _1970, _2054);
    float _2064 = fma(_1768, _1792, _1826);
    float _2066 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2040);
    float _2068 = fma(_1992, _1970, _2060);
    int _2070 = ~_801;
    int _2072 = _2070 + 1;
    float _2074 = fma(_1764, _1766, _2064);
    int _2076 = ~_2028;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    float _2082 = fma(_2030, _1970, _2066);
    int _2084 = int(_1928) + int(_2038);
    float _2086 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2074);
    int _2088 = _2080;
    if (!_2050)
    {
        int _2090 = ~_2028;
        int _2092 = _2090 + 1;
        _2088 = _2092;
    }
    int _2094 = _2088;
    float _2096 = _2062 * 0.15915493667125701904296875;
    float _2098 = fma(_2042, 0.5, 0.5);
    bool _2100 = uint(_2002) >= 2u;
    float _2102 = floor(_2010);
    int _2104 = _1310 >> 31;
    int _2106 = _2072 * _2084;
    int _2108 = _2106 + _1268;
    int _2110 = _1990 >> 31;
    float _2112 = -_1958;
    float _2114 = _2112 + 1.0;
    int _2116 = _2100 ? 0 : 1;
    float _2118 = -_1962;
    float _2120 = _2118 + 1.0;
    bool _2122 = _2002 != 3;
    float _2124 = floor(_2098);
    int _2126 = _2104 & 3;
    int _2128 = _2110 & 3;
    bool _2130 = !_2122;
    int _2132 = _2130 ? 0 : (-1);
    int _2134 = _1310 + _2126;
    float _2136 = _2096 * 6.283185482025146484375;
    float _2138 = sin(_2136);
    bool _2140 = uint(_2108) >= uint(_801);
    float _2142 = _2068 * 0.15915493667125701904296875;
    int _2144 = _1990 + _2128;
    float _2146 = -_2102;
    float _2148 = _2010 + _2146;
    int _2150 = _2134 >> 2;
    float _2152 = in.m_65.w;
    bool _2154 = !_2140;
    int _2156 = _2154 ? 0 : (-1);
    float _2158 = _2096 * 6.283185482025146484375;
    float _2160 = cos(_2158);
    int _2162 = _2144 >> 2;
    int _2164 = _2150 << 4;
    int _2166 = _2164 + 368;
    int _2168 = ~_2084;
    int _2170 = _2168 + _2156;
    int _2172 = _2170 + 1;
    bool _2174 = _2002 != 3;
    uint _2176 = uint(int(uint(_2166) >> uint(2)));
    uint _2178 = uint(int(uint(int(_2176)) >> uint(2)));
    int _2180 = int(_2176) & 3;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[int(_2178)][_2180];
    int _2184 = int(_2176) + 1;
    uint _2186 = uint(int(uint(_2184) >> uint(2)));
    int _2188 = _2184 & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = _2162 << 4;
    int _2194 = _2192 + 512;
    int _2196 = _801 * _2172;
    int _2198 = _2196 + _1268;
    int _2200 = ~_2116;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    float _2206 = _2082 * 0.15915493667125701904296875;
    float _2208 = _2142 * 6.283185482025146484375;
    float _2210 = sin(_2208);
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _2214 = -_323;
    int _2216 = _2056 ? as_type<int>(_2214) : as_type<int>(_323);
    uint _2218 = uint(int(uint(_2194) >> uint(2)));
    uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
    int _2222 = int(_2218) & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    int _2226 = int(_2218) + 1;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    int _2230 = _2226 & 3;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[int(_2228)][_2230];
    int _2234 = abs(_1360);
    int _2236 = abs(_1996);
    int _2238 = _2204;
    if (_2174)
    {
        int _2240 = ~_2116;
        int _2242 = _2240 + 1;
        _2238 = _2242;
    }
    int _2244 = _2238;
    float _2246 = _2206 * 6.283185482025146484375;
    float _2248 = cos(_2246);
    bool _2250 = !_1978;
    int _2252 = _2250 ? _2198 : (-1);
    int _2254 = _2194 + 8;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
    int _2260 = int(_2256) & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = int(_2256) + 1;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    int _2268 = _2264 & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    bool _2272 = _1286 > 0.5;
    float _2274 = _757 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2276 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2278 = _1038 > 0.5;
    float _2280 = _2210 * _2138;
    float _2282 = _2142 * 6.283185482025146484375;
    float _2284 = cos(_2282);
    bool _2286 = _2152 > 0.5;
    int _2288 = _2166 + 8;
    uint _2290 = uint(int(uint(_2288) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    float _2306 = _2274 * _2212;
    float _2308 = -_2124;
    float _2310 = _2098 + _2308;
    float _2312 = _2210 * _2160;
    out.m_84.w = _2276;
    int _2314 = ~_2236;
    int _2316 = _2314 + 1;
    int _2318 = _2316 + 1;
    float _2320 = floor(_2048);
    float _2322 = _2160 * _2248;
    int _2324 = abs(_1396);
    float _2326 = _2210 * _2248;
    int _2328 = abs(_2244);
    bool _2330 = !_1532;
    float _2332 = _2330 ? _323 : as_type<float>(_2216);
    float _2334 = _2206 * 6.283185482025146484375;
    float _2336 = sin(_2334);
    float _2338 = _2284 * _2160;
    float _2340 = _2284 * _2138;
    float _2342 = _2284 * _2248;
    float _2344 = _2138 * _2248;
    int _2346 = ~_2234;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    float _2352 = -_2320;
    float _2354 = _2048 + _2352;
    int _2356 = abs(_2094);
    float _2358 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2360 = abs(_2014);
    int _2362 = _2350 * as_type<int>(_2190);
    int _2364 = ~_2356;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = _2342 * _2306;
    int _2372 = ~_2360;
    int _2374 = _2372 + 1;
    int _2376 = _2374 + 1;
    int _2378 = _2318 * as_type<int>(_2182);
    int _2380 = _2378 + _2362;
    float _2382 = -_2340;
    float _2384 = fma(_2336, _2312, _2382);
    int _2386 = _2368 * as_type<int>(_2232);
    float _2388 = -_2312;
    float _2390 = fma(_2336, _2340, _2388);
    int _2392 = abs(_2046);
    float _2394 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2396 = int(_2394);
    int _2398 = _2376 * as_type<int>(_2224);
    int _2400 = _2398 + _2386;
    float _2402 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2404 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2406 = ~_2324;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2336, _2338, _2280);
    int _2414 = ~_2328;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    float _2420 = fma(_2336, _2280, _2338);
    int _2422 = ~_2392;
    int _2424 = _2422 + 1;
    int _2426 = _2424 + 1;
    float _2428 = -_2336;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2432 = -_2336;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2402);
    int _2436 = _2410 * as_type<int>(_2296);
    int _2438 = _2436 + _2380;
    int _2440 = abs(_1416);
    int _2442 = _2418 * as_type<int>(_2262);
    int _2444 = _2442 + _2400;
    float _2446 = _327 * _705;
    int _2448 = _2426 * as_type<int>(_2304);
    int _2450 = _2448 + _2438;
    float _2452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    float _2454 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2456 = int(_2454);
    float _2458 = _2446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2460 = float(uint(_2396));
    float _2462 = -_2336;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2404);
    int _2466 = ~_2440;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = _2458 * _2452;
    int _2474 = abs(_2132);
    float _2476 = -_2306;
    float _2478 = _2336 * _2476;
    float _2480 = 1.0 / _2460;
    int _2482 = _2450 * _2470;
    int _2484 = ~_2474;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2354, 2.0, -1.0);
    float _2492 = _2326 * _2306;
    int _2494 = _1586 * _2440;
    int _2496 = _2494 + _2482;
    float _2498 = fma(_2148, 2.0, -1.0);
    int _2500 = _2488 * as_type<int>(_2270);
    int _2502 = _2500 + _2444;
    float _2504 = _2490 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2506 = fma(_2322, _2472, _2478);
    float _2508 = fma(_2412, _2472, _2370);
    int _2510 = abs(_2396);
    float _2512 = fma(_2384, _2472, _2492);
    float _2514 = float(uint(_2456));
    float _2516 = _2498 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2518 = abs(_1884);
    float _2520 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2522 = 1.0 / _2514;
    float _2524 = float(uint(_2510));
    float _2526 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2434);
    int _2528 = ~_2518;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2536 = float(uint(_2496));
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _2540 = abs(_2456);
    float _2542 = 1.0 / _2524;
    float _2544 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2520);
    int _2546 = as_type<int>(_2480) + (-2);
    int _2548 = _2502 * _2532;
    float _2550 = float(uint(_2540));
    float _2552 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    int _2554 = abs(_2496);
    float _2556 = as_type<float>(_2546) * _2536;
    int _2558 = _2252 * _2518;
    int _2560 = _2558 + _2548;
    int _2562 = as_type<int>(_2522) + (-2);
    float _2564 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2464);
    float _2566 = 1.0 / _2550;
    float _2568 = float(uint(_2560));
    float _2570 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2534);
    float _2572 = float(uint(_2554));
    float _2574 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2576 = ~_2396;
    int _2578 = _2576 + 1;
    float _2580 = as_type<float>(_2562) * _2568;
    int _2582 = as_type<int>(_2542) + (-2);
    float _2584 = trunc(_2556);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    int _2590 = abs(_2560);
    float _2592 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2538);
    float _2594 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = as_type<float>(_2582) * _2572;
    float _2598 = float(uint(_2590));
    float _2600 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    float _2604 = trunc(_2580);
    float _2606 = precise::max(_2604, 0.0);
    uint _2608 = uint(_2606);
    int _2610 = as_type<int>(_2566) + (-2);
    int _2612 = ~_2510;
    int _2614 = _2612 + 1;
    int _2616 = ~_2540;
    int _2618 = _2616 + 1;
    float _2620 = as_type<float>(_2610) * _2598;
    float _2622 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    int _2624 = _2578 * int(_2588);
    int _2626 = _2624 + _2496;
    float _2628 = trunc(_2596);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2636 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2622);
    float _2638 = float(uint(_2626));
    float _2640 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2574);
    int _2642 = ~_2456;
    int _2644 = _2642 + 1;
    float _2646 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2634);
    float _2648 = trunc(_2620);
    float _2650 = precise::max(_2648, 0.0);
    uint _2652 = uint(_2650);
    float _2654 = as_type<float>(_2546) * _2638;
    float _2656 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2658 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2660 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2662 = _2644 * int(_2608);
    int _2664 = _2662 + _2560;
    float _2666 = trunc(_2654);
    float _2668 = precise::max(_2666, 0.0);
    uint _2670 = uint(_2668);
    int _2672 = _2614 * int(_2632);
    int _2674 = _2672 + _2554;
    float _2676 = fma(_2344, _2656, _2506);
    float _2678 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2658);
    float _2680 = float(uint(_2664));
    float _2682 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2660);
    float _2684 = float(uint(_2674));
    float _2686 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    int _2688 = _2618 * int(_2652);
    int _2690 = _2688 + _2590;
    float _2692 = as_type<float>(_2562) * _2680;
    float _2694 = fma(_2390, _2656, _2508);
    float _2696 = as_type<float>(_2582) * _2684;
    float _2698 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2640);
    float _2700 = float(uint(_2690));
    float _2702 = fma(_2420, _2656, _2512);
    float _2704 = trunc(_2696);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    float _2712 = -_231;
    int _2714 = _2278 ? as_type<int>(_2712) : as_type<int>(_231);
    float _2716 = as_type<float>(_2610) * _2700;
    float _2718 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2602);
    float _2720 = -_231;
    int _2722 = _2286 ? as_type<int>(_2720) : as_type<int>(_231);
    float _2724 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2726 = -_323;
    int _2728 = _2272 ? as_type<int>(_2726) : as_type<int>(_323);
    float _2730 = trunc(_2692);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = !_1624;
    float _2738 = _2736 ? _231 : as_type<float>(_2714);
    float _2740 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2742 = !_1632;
    float _2744 = _2742 ? _231 : as_type<float>(_2722);
    float _2746 = _323 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2748 = !_1628;
    float _2750 = _2748 ? _323 : as_type<float>(_2728);
    float _2752 = _2740 * _2552;
    int _2754 = int(_2588) + int(_2670);
    float _2756 = trunc(_2716);
    float _2758 = precise::max(_2756, 0.0);
    uint _2760 = uint(_2758);
    float _2762 = _2740 * _2526;
    int _2764 = int(_2632) + int(_2708);
    float _2766 = fma(_2746, _2718, _2752);
    int _2768 = ~_2396;
    int _2770 = _2768 + 1;
    out.m_86.x = _2718;
    out.m_86.y = _2698;
    out.m_86.z = _2710;
    int _2772 = ~_2456;
    int _2774 = _2772 + 1;
    float _2776 = fma(_2746, _2698, _2762);
    int _2778 = ~_2510;
    int _2780 = _2778 + 1;
    int _2782 = _2770 * _2754;
    int _2784 = _2782 + _2496;
    int _2786 = int(_2608) + int(_2734);
    int _2788 = ~_2540;
    int _2790 = _2788 + 1;
    int _2792 = _2780 * _2764;
    int _2794 = _2792 + _2554;
    bool _2796 = uint(_2784) >= uint(_2396);
    int _2798 = int(_2652) + int(_2760);
    float _2800 = _2740 * _2564;
    bool _2802 = !_2796;
    int _2804 = _2802 ? 0 : (-1);
    float _2806 = fma(_2746, _2710, _2800);
    bool _2808 = uint(_2794) >= uint(_2510);
    int _2810 = _2774 * _2786;
    int _2812 = _2810 + _2560;
    int _2814 = ~_2754;
    int _2816 = _2814 + _2804;
    int _2818 = _2816 + 1;
    float _2820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2822 = _2790 * _2798;
    int _2824 = _2822 + _2590;
    int _2826 = _2496 ^ _2396;
    bool _2828 = uint(_2812) >= uint(_2456);
    int _2830 = _2396 * _2818;
    int _2832 = _2830 + _2496;
    bool _2834 = _2396 == 0;
    bool _2836 = !_2828;
    int _2838 = _2836 ? 0 : (-1);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2842 = _2396 == 0;
    int _2844 = ~_2786;
    int _2846 = _2844 + _2838;
    int _2848 = _2846 + 1;
    int _2850 = _2560 ^ _2456;
    bool _2852 = !_2808;
    int _2854 = _2852 ? 0 : (-1);
    float _2856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2858 = uint(int(uint(_2826) >> uint(31)));
    bool _2860 = uint(_2824) >= uint(_2540);
    int _2862 = ~_2854;
    int _2864 = _2764 + _2862;
    int _2866 = _2864 + 1;
    uint _2868 = uint(int(uint(_2850) >> uint(31)));
    bool _2870 = !_2834;
    int _2872 = _2870 ? _2832 : (-1);
    int _2874 = ~int(_2858);
    int _2876 = _2874 + 1;
    bool _2878 = !_2860;
    int _2880 = _2878 ? 0 : (-1);
    float _2882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2884 = _2456 == 0;
    float _2886 = _2856 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2888 = _2456 == 0;
    int _2890 = _2456 * _2848;
    int _2892 = _2890 + _2560;
    int _2894 = ~int(_2868);
    int _2896 = _2894 + 1;
    float _2898 = _2820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2900 = float(_2872);
    int _2902 = _2866 ^ _2876;
    int _2904 = ~_2880;
    int _2906 = _2798 + _2904;
    int _2908 = _2906 + 1;
    float _2910 = fma(_2898, _2900, _1946);
    int _2912 = ~_2876;
    int _2914 = _2912 + _2902;
    int _2916 = _2914 + 1;
    int _2918 = _2908 ^ _2896;
    float _2920 = fma(_2740, _2740, 1.0);
    bool _2922 = !_2884;
    int _2924 = _2922 ? _2892 : (-1);
    int _2926 = ~_2896;
    int _2928 = _2926 + _2918;
    int _2930 = _2928 + 1;
    float _2932 = rsqrt(_2920);
    bool _2934 = !_2842;
    int _2936 = _2934 ? _2916 : (-1);
    float _2938 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2940 = float(_2924);
    float _2942 = _2332 + 0.5;
    float _2944 = float(_2936);
    bool _2946 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2948 = isnan(1.0);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2954 = _2950 || _2952;
    float _2956 = fma(_2938, _2940, _1918);
    bool _2958 = !_2888;
    int _2960 = _2958 ? _2930 : (-1);
    float _2962 = -_1914;
    float _2964 = fma(_2886, _2944, _2962);
    float _2966 = fma(_2898, _2942, _2910);
    float _2968 = _2738 + (-0.5);
    float _2970 = float(_2960);
    float _2972 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2974 = _2750 + 0.5;
    float _2976 = -_2886;
    float _2978 = fma(_2976, _2968, _2964);
    float _2980 = _2744 + (-0.5);
    float _2982 = -_1948;
    float _2984 = fma(_2972, _2970, _2982);
    float _2986 = _2740 * _2932;
    float _2988 = fma(_2938, _2974, _2956);
    float _2990 = -_2972;
    float _2992 = fma(_2990, _2980, _2984);
    float _2994 = _2686 + _2766;
    float _2996 = -_2686;
    float _2998 = _2986 * _2996;
    float _3000 = -_2724;
    float _3002 = _2986 * _3000;
    float _3004 = -_1956;
    float _3006 = _3004 + 1.0;
    float _3008 = -_1960;
    float _3010 = _3008 + 1.0;
    float _3012 = fma(_2932, _2552, _2998);
    float _3014 = fma(_2932, _2526, _3002);
    float _3016 = -_2114;
    float _3018 = fma(_2332, _3016, _2966);
    float _3020 = _2724 + _2776;
    float _3022 = _2636 + _2806;
    float _3024 = -_3006;
    float _3026 = fma(_2750, _3024, _2988);
    float _3028 = fma(_2738, _3010, _2978);
    float _3030 = fma(_2744, _2120, _2992);
    float _3032 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_88.x = _2994;
    out.m_88.y = _3020;
    out.m_88.z = _3022;
    float _3034 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3036 = fma(_2310, 2.0, -1.0);
    float _3038 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_90.x = _3018;
    out.m_90.y = _3028;
    out.m_90.z = _3026;
    out.m_90.w = _3030;
    float _3040 = -_2636;
    float _3042 = _2986 * _3040;
    float _3044 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3032);
    float _3046 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3034);
    float _3048 = _3036 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _3050 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3038);
    float _3052 = fma(_2932, _2564, _3042);
    float _3054 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3044);
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2570);
    float _3058 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2544);
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2592);
    float _3062 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3046);
    float _3064 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3050);
    out.m_92.x = _3012;
    out.m_92.y = _3014;
    out.m_92.z = _3052;
    float _3066 = _3058 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _3068 = _3060 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _3070 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3072 = _3062 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3074 = _3070 + _3066;
    float _3076 = _3056 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _3078 = _3064 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3080 = _3072 + _3076;
    float _3082 = _3078 + _3068;
    float _3084 = _2956;
    float _3086 = _3070;
    float _3088 = _2920;
    float _3090 = _3064;
    float _3092 = _3070;
    float _3094 = _3060;
    float _3096 = _3064;
    float _3098 = _2490;
    float _3100 = _3036;
    float _3102 = _2498;
    float _3104 = _2458;
    float _3114;
    float _3116;
    float _3118;
    float _3120;
    if (!_2954)
    {
        bool _3106 = _3076 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _3108 = !_3106;
        _3110 = _3108;
        if (!_3110)
        {
            float _3112 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _3114 = 0.0;
            _3116 = _3112;
            _3118 = 0.0;
            _3120 = 0.0;
            _3122 = true;
        }
    }
    if ((!_3122) || _3110)
    {
        bool _3158;
        if (!_3110)
        {
            bool _3124 = _3076 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _3126 = isnan(_3076);
            bool _3128 = _3124 || _3126;
            bool _3130 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _3132 = _3128 || _3130;
            bool _3134 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _3136 = !_3132;
            bool _3138 = _3134 && _3136;
            bool _3140 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _3094 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_3138)
            {
                _3084 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _3142 = _3084;
            float _3144 = _3142;
            if (_3138)
            {
                _3086 = 0.0;
            }
            float _3146 = _3086;
            _3092 = _3146;
            _3114 = _3146;
            if (_3138)
            {
                _3088 = 0.0;
            }
            float _3148 = _3088;
            _3118 = _3148;
            if (_3138)
            {
                float _3150 = _3142 * 5.0;
                _3144 = _3150;
            }
            float _3152 = _3144;
            _3116 = _3152;
            if (_3138)
            {
                _3090 = 0.0;
            }
            float _3154 = _3090;
            bool _3156 = !_3132;
            _3158 = _3156 && _3140;
            _3096 = _3154;
            _3120 = _3154;
        }
        if ((!_3158) || _3110)
        {
            _3110 = false;
            float _3160 = _3092;
            float _3162 = _3094;
            float _3164 = _3096;
            bool _3166 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _3168 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _3170 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _3172 = _3058;
            float _3174 = _3160;
            float _3176 = _3162;
            float _3178 = _3164;
            _3116 = _3082;
            _3118 = _3080;
            if (_3166)
            {
                float _3180 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _3172 = _3180;
            }
            float _3182 = _3172;
            if (_3166)
            {
                float _3184 = abs(_2498);
                float _3186 = -_3184;
                float _3188 = _3186 + 1.0;
                _3174 = _3188;
            }
            float _3190 = _3174;
            if (_3168)
            {
                float _3192 = abs(_2490);
                float _3194 = -_3192;
                float _3196 = _3194 + 1.0;
                _3098 = _3196;
            }
            float _3198 = _3098;
            if (!_3166)
            {
                _3176 = 1.0;
            }
            float _3200 = _3176;
            float _3202 = _3200;
            if (_3170)
            {
                float _3204 = abs(_3036);
                float _3206 = -_3204;
                float _3208 = _3206 + 1.0;
                _3100 = _3208;
            }
            float _3210 = _3100;
            if (!_3168)
            {
                _3102 = 1.0;
            }
            float _3212 = _3102;
            float _3214 = _3212;
            if (!_3170)
            {
                _3178 = 1.0;
            }
            float _3216 = _3178;
            float _3218 = _3078;
            float _3220 = _3216;
            if (_3168)
            {
                float _3222 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _3218 = _3222;
            }
            float _3224 = _3218;
            float _3226 = _3054;
            if (_3170)
            {
                float _3228 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _3226 = _3228;
            }
            float _3230 = _3226;
            if (_3166)
            {
                float _3232 = _3190 * _3182;
                float _3234 = precise::clamp(_3232, 0.0, 1.0);
                _3202 = _3234;
            }
            float _3236 = _3202;
            _3114 = _3074;
            if (_3168)
            {
                float _3238 = _3198 * _3224;
                float _3240 = precise::clamp(_3238, 0.0, 1.0);
                _3214 = _3240;
            }
            float _3242 = _3214;
            float _3244 = _3236 * _3242;
            if (_3170)
            {
                float _3246 = _3210 * _3230;
                float _3248 = precise::clamp(_3246, 0.0, 1.0);
                _3220 = _3248;
            }
            float _3250 = _3220;
            float _3252 = _3244 * _3250;
            _3120 = _3252;
        }
    }
    _3122 = false;
    float _3254 = _3114;
    float _3256 = _3116;
    float _3258 = _3118;
    float _3260 = _3120;
    float _3262 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3264 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3266 = floor(_3262);
    float _3268 = floor(_3264);
    float _3270 = -_3266;
    float _3272 = _3262 + _3270;
    float _3274 = -_3268;
    float _3276 = _3264 + _3274;
    float2 _9679 = float2(_3272, _3276);
    float _3278 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9679, float2(0.0), isnan(_9679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9679, float2(0.0), isnan(_9679)), level(0.0)).x;
    float _3280 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3282 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3286 = _3254 + _3284;
    float _3288 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3280);
    float _3290 = _3076 + _3282;
    float _3292 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3288);
    float _3294 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3298 = _3256 + _3296;
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3302 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3304 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3294);
    float _3306 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3300);
    float _3308 = 1.0 / _3302;
    float _3310 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3304);
    float _3312 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3314 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3306);
    float _3316 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3318 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3312);
    float _3320 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3322 = _3316 + _3302;
    float _3324 = trunc(_3320);
    int _3326 = int(_3324);
    float _3328 = _3322 * _3308;
    float _3330 = _3328 * 0.5;
    float _3332 = _3298 * _3298;
    float _3334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3336 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3334);
    float _3338 = fma(_3286, _3286, _3332);
    float _3340 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3318);
    float _3342 = sqrt(_3338);
    float _3344 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3346 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3348 = _3326 + _3346;
    int _3350 = _3348 + 1;
    float _3352 = 1.0 / _3336;
    float _3354 = trunc(_3344);
    int _3356 = int(_3354);
    float _3358 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3360 = _3352 * _3358;
    bool _3362 = _3360 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _3364 = _3360 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3366 = !_3362;
    int _3368 = _3366 ? 0 : 1;
    int _3370 = 2;
    float _3372 = _3258;
    float _3374 = _3254;
    float _3376 = _3256;
    int _3378 = _3350;
    float _3380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    if (!_3362)
    {
        _3370 = 1;
    }
    int _3382 = _3370;
    int _3384 = _3382;
    if (!_3364)
    {
        _3384 = _3368;
    }
    int _3386 = _3384;
    bool _3388 = _3342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3390 = _3386 << 6;
    int _3392 = _3390 + 48;
    uint _3394 = uint(int(uint(_3392) >> uint(2)));
    uint _3396 = uint(int(uint(int(_3394)) >> uint(2)));
    int _3398 = int(_3394) & 3;
    float _3400 = (*spvDescriptorSet0.vp_c15)._m0[int(_3396)][_3398];
    int _3402 = int(_3394) + 1;
    uint _3404 = uint(int(uint(_3402) >> uint(2)));
    int _3406 = _3402 & 3;
    float _3408 = (*spvDescriptorSet0.vp_c15)._m0[int(_3404)][_3406];
    int _3410 = _3390 + 56;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    uint _3414 = uint(int(uint(int(_3412)) >> uint(2)));
    int _3416 = int(_3412) & 3;
    float _3418 = (*spvDescriptorSet0.vp_c15)._m0[int(_3414)][_3416];
    int _3420 = int(_3412) + 1;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    int _3424 = _3420 & 3;
    float _3426 = (*spvDescriptorSet0.vp_c15)._m0[int(_3422)][_3424];
    int _3428 = _3390 + 64;
    uint _3430 = uint(int(uint(_3428) >> uint(2)));
    uint _3432 = uint(int(uint(int(_3430)) >> uint(2)));
    int _3434 = int(_3430) & 3;
    float _3436 = (*spvDescriptorSet0.vp_c15)._m0[int(_3432)][_3434];
    int _3438 = int(_3430) + 1;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    int _3442 = _3438 & 3;
    float _3444 = (*spvDescriptorSet0.vp_c15)._m0[int(_3440)][_3442];
    int _3446 = _3390 + 72;
    uint _3448 = uint(int(uint(_3446) >> uint(2)));
    uint _3450 = uint(int(uint(int(_3448)) >> uint(2)));
    int _3452 = int(_3448) & 3;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[int(_3450)][_3452];
    int _3456 = int(_3448) + 1;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    int _3460 = _3456 & 3;
    float _3462 = (*spvDescriptorSet0.vp_c15)._m0[int(_3458)][_3460];
    int _3464 = _3390 + 96;
    uint _3466 = uint(int(uint(_3464) >> uint(2)));
    uint _3468 = uint(int(uint(int(_3466)) >> uint(2)));
    int _3470 = int(_3466) & 3;
    float _3472 = (*spvDescriptorSet0.vp_c15)._m0[int(_3468)][_3470];
    int _3474 = int(_3466) + 1;
    uint _3476 = uint(int(uint(_3474) >> uint(2)));
    int _3478 = _3474 & 3;
    float _3480 = (*spvDescriptorSet0.vp_c15)._m0[int(_3476)][_3478];
    int _3482 = _3390 + 104;
    uint _3484 = uint(int(uint(_3482) >> uint(2)));
    uint _3486 = uint(int(uint(int(_3484)) >> uint(2)));
    int _3488 = int(_3484) & 3;
    float _3490 = (*spvDescriptorSet0.vp_c15)._m0[int(_3486)][_3488];
    int _3492 = int(_3484) + 1;
    uint _3494 = uint(int(uint(_3492) >> uint(2)));
    int _3496 = _3492 & 3;
    float _3498 = (*spvDescriptorSet0.vp_c15)._m0[int(_3494)][_3496];
    bool _3500 = !_3388;
    int _3502 = as_type<int>(_3480);
    float _3504 = _3454;
    float _3506 = _3462;
    if (!_3500)
    {
        float _3508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3512 = _3342 + _3510;
        float _3514 = rsqrt(_3338);
        float _3516 = _3512 * _3508;
        float _3518 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3520 = _3516 * 0.15915493667125701904296875;
        float _3522 = _3520 * 6.283185482025146484375;
        float _3524 = cos(_3522);
        float _3526 = _3520 * 6.283185482025146484375;
        float _3528 = sin(_3526);
        float _3530 = _3524 + (-1.0);
        float _3532 = fma(_3528, _3518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3534 = _3530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3536 = _3514 * _3532;
        float _3538 = fma(_3524, _3258, _3534);
        float _3540 = fma(_3286, _3536, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3542 = fma(_3298, _3536, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3372 = _3538;
        _3374 = _3540;
        _3376 = _3542;
    }
    float _3544 = _3372;
    float _3546 = _3374;
    float _3548 = _3376;
    float _3550 = -_3076;
    float _3552 = _3550 + _3544;
    int _3554 = _3390 + 80;
    uint _3556 = uint(int(uint(_3554) >> uint(2)));
    uint _3558 = uint(int(uint(int(_3556)) >> uint(2)));
    int _3560 = int(_3556) & 3;
    float _3562 = (*spvDescriptorSet0.vp_c15)._m0[int(_3558)][_3560];
    int _3564 = int(_3556) + 1;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    int _3568 = _3564 & 3;
    float _3570 = (*spvDescriptorSet0.vp_c15)._m0[int(_3566)][_3568];
    float _3572 = -_3066;
    float _3574 = _3572 + _3546;
    int _3576 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3578 = _3356 + _3576;
    int _3580 = _3578 + 1;
    float _3582 = _3552 * _3552;
    float _3584 = -_3068;
    float _3586 = _3584 + _3548;
    bool _3588 = _3350 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3590 = fma(_3574, _3574, _3582);
    int _3592 = _3350 | _3580;
    float _3594 = _3290 * _3480;
    bool _3596 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3598 = isnan(0.5);
    bool _3600 = _3596 || _3598;
    bool _3602 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3604 = _3600 || _3602;
    float _3606 = fma(_3586, _3586, _3590);
    bool _3608 = _3592 < 0;
    bool _3610 = _3608 || _3588;
    float _3612 = fma(_3066, _3472, _3594);
    float _3614 = _3290 * _3408;
    float _3616 = sqrt(_3606);
    bool _3618 = _3580 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3620 = _3618 || _3610;
    float _3622 = fma(_3068, _3490, _3612);
    float _3624 = fma(_3066, _3400, _3614);
    float _3626 = _3622 + _3498;
    float _3628 = _3290 * _3444;
    float _3630 = fma(_3068, _3418, _3624);
    float _3632 = 1.0 / _3626;
    float _3634 = fma(_3066, _3436, _3628);
    int _3636 = as_type<int>(_3614);
    int _3638 = as_type<int>(_3628);
    float _3640 = _3544;
    float _3642 = _3548;
    float _3644 = _3546;
    if (!_3620)
    {
        int _3646 = _3580 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3648 = _3646 + _3350;
        _3378 = _3648;
    }
    int _3650 = _3378;
    bool _3652 = _3616 > 0.0;
    float _3654 = _3612;
    float _3656 = _3616;
    if (!_3620)
    {
        float _3658 = floor(_3320);
        _3654 = _3658;
    }
    float _3660 = _3654;
    if (!_3620)
    {
        int _3662 = _3650 << 2;
        _3502 = _3662;
    }
    int _3664 = _3502;
    int _3666 = _3664;
    if (!_3620)
    {
        uint _3668 = uint(int(uint(_3650) >> uint(2)));
        _3636 = int(_3668);
    }
    int _3670 = _3636;
    if (!_3620)
    {
        int _3672 = 12 & _3664;
        _3666 = _3672;
    }
    int _3674 = _3666;
    if (!_3620)
    {
        int _3676 = _3670 << 4;
        int _3678 = _3676 + _3674;
        _3638 = _3678;
    }
    int _3680 = _3638;
    float _3682 = fma(_3068, _3454, _3634);
    if (!_3652)
    {
        _3504 = _3546;
    }
    float _3684 = _3504;
    bool _3686 = !_3652;
    float _3688 = _3684;
    float _3690 = _3660;
    if (!_3686)
    {
        float _3692 = _315 * _315;
        float _3694 = rsqrt(_3606);
        float _3696 = fma(_275, _275, _3692);
        float _3698 = fma(_317, _317, _3696);
        float _3700 = sqrt(_3698);
        float _3702 = _3574 * _3694;
        float _3704 = _3552 * _3694;
        float _3706 = _3586 * _3694;
        bool _3708 = _3700 > 0.0;
        float _3710 = _3700;
        if (!_3708)
        {
            _3710 = _3546;
        }
        float _3712 = _3710;
        bool _3714 = !_3708;
        _3688 = _3712;
        if (!_3714)
        {
            float _3716 = rsqrt(_3698);
            float _3718 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3720 = _315 * _3716;
            float _3722 = _275 * _3716;
            float _3724 = _3704 * _3720;
            float _3726 = _317 * _3716;
            float _3728 = fma(_3702, _3722, _3724);
            float _3730 = _3718 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3732 = fma(_3706, _3726, _3728);
            float _3734 = _3732 * _3730;
            float _3736 = fma(_275, _3734, _3546);
            float _3738 = fma(_315, _3734, _3544);
            float _3740 = fma(_317, _3734, _3548);
            _3640 = _3738;
            _3642 = _3740;
            _3688 = _3736;
        }
    }
    float _3742 = _3640;
    float _3744 = _3642;
    float _3746 = _3688;
    float _3748 = _3682 + _3462;
    float _3750 = _3630 + _3426;
    float _3752 = _3746;
    if (_3604)
    {
        _3506 = _3742;
    }
    float _3754 = _3506;
    float _3756 = _3754;
    if (_3604)
    {
        _3644 = _3744;
    }
    float _3758 = _3644;
    float _3760 = _3758;
    if (!_3604)
    {
        float _3762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3764 = _3076 + _3762;
        float _3766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3768 = _3066 + _3766;
        float _3770 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3772 = -_3066;
        float _3774 = _3772 + _3746;
        float _3776 = _3764 * _3764;
        float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3780 = _3068 + _3778;
        float _3782 = -_3068;
        float _3784 = _3782 + _3744;
        float _3786 = fma(_3768, _3768, _3776);
        float _3788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3790 = fma(_3780, _3780, _3786);
        float _3792 = sqrt(_3790);
        float _3794 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3796 = precise::min(_3792, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3798 = _3796 * _3788;
        float _3800 = _3794 * _3798;
        float _3802 = -_3076;
        float _3804 = _3802 + _3742;
        float _3806 = fma(_3774, _3800, _3066);
        float _3808 = fma(_3804, _3800, _3076);
        float _3810 = fma(_3784, _3800, _3068);
        _3756 = _3808;
        _3752 = _3806;
        _3760 = _3810;
    }
    float _3812 = _3756;
    float _3814 = _3752;
    float _3816 = _3760;
    float _3818 = _3750 * _3632;
    int _3820 = _3390 + 88;
    uint _3822 = uint(int(uint(_3820) >> uint(2)));
    uint _3824 = uint(int(uint(int(_3822)) >> uint(2)));
    int _3826 = int(_3822) & 3;
    float _3828 = (*spvDescriptorSet0.vp_c15)._m0[int(_3824)][_3826];
    int _3830 = int(_3822) + 1;
    uint _3832 = uint(int(uint(_3830) >> uint(2)));
    int _3834 = _3830 & 3;
    float _3836 = (*spvDescriptorSet0.vp_c15)._m0[int(_3832)][_3834];
    float _3838 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3840 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3842 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3844 = _3818 >= 0.0;
    float _3846 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3838);
    float _3848 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3840);
    float _3850 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3852 = _3750;
    if (!_3620)
    {
        int _3854 = _3680 + 400;
        uint _3856 = uint(int(uint(_3854) >> uint(2)));
        uint _3858 = uint(int(uint(int(_3856)) >> uint(2)));
        int _3860 = int(_3856) & 3;
        float _3862 = (*spvDescriptorSet0.vp_c15)._m0[int(_3858)][_3860];
        _3852 = _3862;
    }
    float _3864 = _3852;
    float _3866 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3846);
    float _3868 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3842);
    float _3870 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3848);
    float _3872 = _3748 * _3632;
    float _3874 = _3866 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3876 = _3818 <= 1.0;
    bool _3878 = _3876 && _3844;
    float _3880 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3850);
    float _3882 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3868);
    float _3884 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3886 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3888 = _3872 >= 0.0;
    bool _3890 = _3888 && _3878;
    float _3892 = _3882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3894 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3880);
    float _3896 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3886);
    bool _3898 = _3872 <= 1.0;
    bool _3900 = _3898 && _3890;
    float _3902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3904 = _3892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3906 = _3894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3908 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3896);
    float _3910 = _3682;
    float _3912 = _3894;
    if (!_3620)
    {
        float _3914 = floor(_3344);
        _3910 = _3914;
    }
    float _3916 = _3910;
    float _3918 = -_3904;
    float _3920 = fma(_3918, _3902, 1.0);
    float _3922 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3924 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3908);
    float _3926 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3928 = _3290 * _3570;
    float _3930 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3922);
    float _3932 = log2(_3920);
    float _3934 = _3928;
    if (_3900)
    {
        float _3936 = float(_3386);
        _3912 = _3936;
    }
    float _3938 = _3912;
    float _3940 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3926);
    float _3942 = fma(_3066, _3562, _3928);
    float _3944 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3930);
    float _3946 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3940);
    float _3948 = 1.0 / _3924;
    float _3950 = _3946;
    if (!_3620)
    {
        float _3952 = -_3916;
        float _3954 = _3344 + _3952;
        _3656 = _3954;
    }
    float _3956 = _3656;
    float _3958 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3944);
    float _3960 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3946);
    float _3962 = fma(_3068, _3828, _3942);
    if (!_3620)
    {
        float _3964 = -_3660;
        float _3966 = _3320 + _3964;
        _3950 = _3966;
    }
    float _3968 = _3950;
    float _3970 = _3922;
    if (_3900)
    {
        float _3972 = rint(_3938);
        float _3974 = precise::max(_3972, 0.0);
        uint _3976 = uint(_3974);
        uint _3978 = clamp(_3976, 0u, 65535u);
        _3970 = as_type<float>(_3978);
    }
    float _3980 = _3970;
    float _3982 = _3962 + _3836;
    float _3984 = _3932 * 0.693147182464599609375;
    float _3986 = _3982 * _3632;
    float _3988 = _3984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3990 = _3864;
    float _3992 = _3988;
    if (!_3620)
    {
        float _3994 = rint(_3864);
        float _3996 = precise::max(_3994, 0.0);
        uint _3998 = uint(_3996);
        uint _4000 = clamp(_3998, 0u, 65535u);
        _3990 = as_type<float>(_4000);
    }
    float _4002 = _3990;
    float _4004 = _3958 * _3948;
    float _4006 = _3960 * _3948;
    float _4008 = fma(_4004, 0.5, 0.5);
    float _4010 = fma(_4006, -0.5, 0.5);
    float _4012 = _3872;
    if (_3900)
    {
        float3 _10892 = float3(_3818, _3872, float(as_type<int>(_3980)));
        float3 _10896 = select(_10892, float3(0.0), isnan(_10892));
        float _4014 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10896.xy, uint(rint(_10896.z)), _3986, level(0.0));
        _4012 = _4014;
    }
    float _4016 = _4012;
    float3 _10906 = float3(_4008, _4010, _3988);
    float _4018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10906, float3(0.0), isnan(_10906)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10906, float3(0.0), isnan(_10906)), level(0.0)).x;
    float3 _10915 = float3(_4008, _4010, _3988);
    float4 _4021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10915, float3(0.0), isnan(_10915)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10915, float3(0.0), isnan(_10915)), level(0.0)).xyzw;
    float _4023 = _4021.x;
    float _4025 = _4021.y;
    float _4027 = _4021.z;
    float _4029 = _4021.w;
    float _4031 = _3956;
    if (!_3620)
    {
        float3 _10938 = float3(_3968, _3956, float(as_type<int>(_4002)));
        float3 _10940 = select(_10938, float3(0.0), isnan(_10938));
        float _4033 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10940.xy, uint(rint(_10940.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10940.xy, uint(rint(_10940.z)), level(0.0)).x;
        _4031 = _4033;
    }
    float _4035 = _4031;
    if (_3620)
    {
        _3690 = 1.0;
    }
    float _4037 = _3690;
    float _4039 = _4037;
    if (!_3620)
    {
        int _4041 = _3650 << 4;
        int _4043 = _4041 + 2048;
        uint _4045 = uint(int(uint(_4043) >> uint(2)));
        uint _4047 = uint(int(uint(int(_4045)) >> uint(2)));
        int _4049 = int(_4045) & 3;
        float _4051 = (*spvDescriptorSet0.vp_c15)._m0[int(_4047)][_4049];
        int _4053 = int(_4045) + 1;
        uint _4055 = uint(int(uint(_4053) >> uint(2)));
        int _4057 = _4053 & 3;
        float _4059 = (*spvDescriptorSet0.vp_c15)._m0[int(_4055)][_4057];
        int _4061 = _4043 + 8;
        uint _4063 = uint(int(uint(_4061) >> uint(2)));
        uint _4065 = uint(int(uint(int(_4063)) >> uint(2)));
        int _4067 = int(_4063) & 3;
        float _4069 = (*spvDescriptorSet0.vp_c15)._m0[int(_4065)][_4067];
        int _4071 = int(_4063) + 1;
        uint _4073 = uint(int(uint(_4071) >> uint(2)));
        int _4075 = _4071 & 3;
        float _4077 = (*spvDescriptorSet0.vp_c15)._m0[int(_4073)][_4075];
        float _4079 = _3290 * _4059;
        float _4081 = fma(_3066, _4051, _4079);
        float _4083 = fma(_3068, _4069, _4081);
        float _4085 = _4083 + _4077;
        float _4087 = precise::clamp(_4085, 0.0, 1.0);
        float _4089 = -_4087;
        float _4091 = _4089 + _4035;
        float _4093 = fma(_4091, 500.0, 1.5);
        float _4095 = exp2(_4093);
        float _4097 = 0.0 + _4095;
        float _4099 = precise::clamp(_4097, 0.0, 1.0);
        _4039 = _4099;
    }
    float _4101 = _4039;
    float _4103 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4105 = _3812 + _4103;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4109 = _3814 + _4107;
    float _4111 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4113 = _3816 + _4111;
    float _4115 = _4105 * _4105;
    float _4117 = fma(_4109, _4109, _4115);
    float _4119 = fma(_4113, _4113, _4117);
    float _4121 = rsqrt(_4119);
    float _4123 = sqrt(_4119);
    float _4125 = _4121 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4127 = _4109 * _4125;
    float _4129 = _4113 * _4125;
    float _4131 = _4127 * _4127;
    float _4133 = _4129 * _4129;
    float _4135 = _4131 + _4133;
    float _4137 = sqrt(_4135);
    bool _4139 = _4137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4143 = _4137 + _4141;
    float _4145 = _4010;
    float _4147 = _4143;
    float _4149 = _4105;
    float _4151 = _4127;
    float _4153 = _4131;
    float _4155 = _4133;
    if (_4139)
    {
        float _4157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4145 = _4157;
    }
    float _4159 = _4145;
    if (_4139)
    {
        float _4161 = rsqrt(_4135);
        _3934 = _4161;
    }
    float _4163 = _3934;
    float _4165 = _4163;
    if (_4139)
    {
        float _4167 = _4143 * _4159;
        _4147 = _4167;
    }
    float _4169 = _4147;
    if (_4139)
    {
        float _4171 = _4169 * 0.15915493667125701904296875;
        _3992 = _4171;
    }
    float _4173 = _3992;
    float _4175 = _4035;
    if (_4139)
    {
        float _4177 = _4173 * 6.283185482025146484375;
        float _4179 = sin(_4177);
        _4175 = _4179;
    }
    float _4181 = _4175;
    float _4183 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4185 = precise::max(0.0, _4183);
    float _4187 = _4159;
    float _4189 = _4185;
    if (_4139)
    {
        float _4191 = _4173 * 6.283185482025146484375;
        float _4193 = cos(_4191);
        _4187 = _4193;
    }
    float _4195 = _4187;
    float _4197 = -_4125;
    float _4199 = -_4185;
    float _4201 = fma(_4105, _4197, _4199);
    if (_4139)
    {
        float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4189 = _4203;
    }
    float _4205 = _4189;
    float _4207 = _4181;
    float _4209 = _4205;
    if (_4139)
    {
        float _4211 = fma(_4181, _4205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4207 = _4211;
    }
    float _4213 = _4207;
    float _4215 = _4213;
    if (!_4139)
    {
        _4209 = _4201;
    }
    float _4217 = _4209;
    float _4219 = _4217;
    if (_4139)
    {
        float _4221 = _4195 + (-1.0);
        _4149 = _4221;
    }
    float _4223 = _4149;
    float _4225 = _4223;
    if (_4139)
    {
        float _4227 = _4163 * _4213;
        _4215 = _4227;
    }
    float _4229 = _4215;
    if (_4139)
    {
        float _4231 = _4223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4165 = _4231;
    }
    float _4233 = _4165;
    if (_4139)
    {
        float _4235 = _4127 * _4229;
        _4151 = _4235;
    }
    float _4237 = _4151;
    if (!_4139)
    {
        _4225 = _4129;
    }
    float _4239 = _4225;
    float _4241 = _4239;
    if (_4139)
    {
        float _4243 = _4129 * _4229;
        _4241 = _4243;
    }
    float _4245 = _4241;
    if (_4139)
    {
        float _4247 = fma(_4201, _4195, _4233);
        _4219 = _4247;
    }
    float _4249 = _4219;
    if (_4139)
    {
        float _4251 = _4237 * _4237;
        _4153 = _4251;
    }
    float _4253 = _4153;
    if (_4139)
    {
        float _4255 = _4245 * _4245;
        _4155 = _4255;
    }
    float _4257 = _4155;
    float _4259 = fma(_4249, _4249, _4253);
    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4263 = fma(_4123, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4261);
    float _4265 = precise::clamp(_4263, 0.0, 1.0);
    float _4267 = _4259 + _4257;
    float _4269 = -_4265;
    float _4271 = _4269 + 1.0;
    float _4273 = rsqrt(_4267);
    float _4275 = abs(_4271);
    float _4277 = log2(_4275);
    float _4279 = _4273 * _4237;
    float _4281 = _4273 * _4249;
    float _4283 = _4273 * _4245;
    float _4285 = _4279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4287 = -_4285;
    float _4289 = fma(_4281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4287);
    float _4291 = _4277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4293 = -_4283;
    float _4295 = fma(_4293, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4289);
    float _4297 = exp2(_4291);
    float _4299 = fma(_4295, -0.5, 0.5);
    float _4301 = fma(_4295, 0.5, 0.5);
    float _4303 = _4281 + 1.0;
    float _4305 = fma(_4301, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4307 = sqrt(_4299);
    float _4309 = fma(_4301, _4305, -0.212114393711090087890625);
    float _4311 = -_4281;
    float _4313 = fma(_4297, _4303, _4311);
    float _4315 = fma(_4301, _4309, 1.570728778839111328125);
    float _4317 = fma(_4313, 0.5, 0.5);
    float _4319 = _4307 * 0.636619746685028076171875;
    float _4321 = -_4315;
    float _4323 = fma(_4319, _4321, 1.0);
    float2 _11389 = float2(_4323, _4317);
    float3 _4327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11389, float2(0.0), isnan(_11389)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11389, float2(0.0), isnan(_11389)), level(0.0)).xyz;
    float _4329 = _4327.x;
    float _4331 = _4327.y;
    float _4333 = _4327.z;
    float _4335 = abs(_3360);
    float _4337 = log2(_4335);
    float _4339 = _3260 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4341 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4343 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4345 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4347 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4341);
    float _4349 = -_3278;
    float _4351 = _4349 + 1.0;
    float _4353 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4343);
    float _4355 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4345);
    float _4357 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4347);
    out.m_94.y = 1.0;
    float _4359 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4353);
    float _4361 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4355);
    float _4363 = _4357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4365 = _4337 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4367 = _327 * _4339;
    float _4369 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4371 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4373 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4375 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4377 = exp2(_4365);
    float _4379 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4371);
    float _4381 = _4359 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4383 = -_315;
    float _4385 = _4383 + _3812;
    float _4387 = -_275;
    float _4389 = _4387 + _3814;
    float _4391 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4379);
    float _4393 = -_317;
    float _4395 = _4393 + _3816;
    out.m_96.x = _3814;
    out.m_96.y = _3812;
    out.m_96.z = _3816;
    float _4397 = fma(_4377, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4399 = precise::clamp(_4397, 0.0, 1.0);
    float _4401 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4369);
    float _4403 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _4405 = fma(_4399, -2.0, 3.0);
    float _4407 = _4399 * _4399;
    float _4409 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4401);
    float _4411 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4413 = _4407 * _4405;
    float _4415 = _4409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4417 = -_4413;
    float _4419 = _4417 + 1.0;
    float _4421 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4375);
    float _4423 = fma(_4419, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4413);
    float _4425 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4427 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4425);
    float _4429 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4373);
    bool _4431 = _3360 <= 8000.0;
    bool _4433 = isnan(_3360);
    bool _4435 = _4431 || _4433;
    bool _4437 = isnan(8000.0);
    bool _4439 = _4435 || _4437;
    float _4441 = float(_4439);
    float _4443 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4391);
    float _4445 = _4277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4447 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4411);
    float _4449 = _4441 * _4423;
    float _4451 = _4361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4453 = _4403 + _4447;
    float _4455 = exp2(_4445);
    float _4457 = _4443 + _3924;
    float _4459 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4453);
    float _4461 = _4457 * 0.5;
    float _4463 = _4457;
    float _4465 = _4367;
    if (!_3900)
    {
        _4463 = 1.0;
    }
    float _4467 = _4463;
    out.gl_Position.x = _3958;
    out.gl_Position.y = _3960;
    out.gl_Position.z = _4443;
    out.gl_Position.w = _3924;
    float _4469 = 1.0 / _4459;
    float _4471 = _4467;
    if (_3900)
    {
        bool _4473 = _4016 >= _3986;
        bool _4475 = isnan(_4016);
        bool _4477 = _4473 || _4475;
        bool _4479 = isnan(_3986);
        bool _4481 = _4477 || _4479;
        float _4483 = float(_4481);
        _4471 = _4483;
    }
    float _4485 = _4471;
    float _4487 = _4449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4489 = fma(_4381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4421);
    out.m_98.z = _4461;
    out.m_98.w = _3924;
    float _4491 = _4351 * _4487;
    float _4493 = precise::clamp(_4491, 0.0, 1.0);
    float _4495 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4489);
    float _4497 = -_4455;
    float _4499 = _4497 + 1.0;
    float _4501 = _4485 * _4101;
    float _4503 = -_4493;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4507 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _4509 = _4499 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4511 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _4513 = -_4501;
    float _4515 = fma(_4513, _4505, 1.0);
    float _4517 = precise::clamp(_4515, 0.0, 1.0);
    float _4519 = _4507 + _4427;
    float _4521 = _4509 * _4018;
    float _4523 = _4511 + _4429;
    float _4525 = _4495 * _4469;
    float _4527 = -_4509;
    float _4529 = _4527 + 1.0;
    float _4531 = _4029 * _4521;
    float _4533 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4523);
    float _4535 = _4517 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _4537 = _4525 > 0.0;
    float _4539 = _4029 * _4529;
    float _4541 = _4533 * _4469;
    float _4543 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4519);
    bool _4545 = _4525 < 1.0;
    bool _4547 = _4545 && _4537;
    out.m_94.x = _4535;
    float _4549 = _4543 * _4469;
    bool _4551 = _4004 > (-1.0);
    bool _4553 = _4551 && _4547;
    bool _4555 = _4006 > (-1.0);
    bool _4557 = _4555 && _4553;
    bool _4559 = _4004 < 1.0;
    bool _4561 = _4559 && _4557;
    bool _4563 = _4006 < 1.0;
    bool _4565 = _4563 && _4561;
    float _4567 = fma(_4329, _4531, _4023);
    float _4569 = fma(_4331, _4531, _4025);
    float _4571 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _4573 = _4333 * _4521;
    float _4575 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[638].x, _4571);
    float _4577 = fma(_4029, _4573, _4027);
    float _4579 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[638].z, _4575);
    out.m_100.x = _4567;
    out.m_100.y = _4569;
    out.m_100.z = _4577;
    out.m_100.w = _4539;
    float _4581 = _4579 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _4583 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _4585 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _4587 = 1.0 / _4581;
    float _4589 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[635].x, _4583);
    float _4591 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[636].x, _4585);
    float _4593 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[635].z, _4589);
    float _4595 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[636].z, _4591);
    float _4597 = _4593 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _4599 = _4595 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _4601 = _4597 * _4587;
    float _4603 = _4599 * _4587;
    bool _4605 = !_4565;
    float _4607 = _4597;
    float _4637;
    if (!_4605)
    {
        float _4609 = -_4541;
        float _4611 = _4006 + _4609;
        float _4613 = -_4549;
        float _4615 = _4004 + _4613;
        float _4617 = -_4601;
        float _4619 = _4004 + _4617;
        float _4621 = -_4603;
        float _4623 = _4006 + _4621;
        float _4625 = _4611 * _4611;
        float _4627 = fma(_4615, _4615, _4625);
        float _4629 = sqrt(_4627);
        bool _4631 = _4629 > 0.0;
        _3380 = _4629;
        if (!_4631)
        {
            _4607 = _4367;
        }
        float _4633 = _4607;
        bool _4635 = !_4631;
        _4637 = _4633;
        _4639 = _4635;
        if (!_4639)
        {
            float _4641 = _4623 * _4623;
            float _4643 = fma(_4619, _4619, _4641);
            float _4645 = rsqrt(_4627);
            float _4647 = sqrt(_4643);
            float _4649 = _4615 * _4645;
            float _4651 = _4611 * _4645;
            bool _4653 = _4647 > 0.0;
            float _4655 = _4647;
            _3380 = _4645;
            if (!_4653)
            {
                _4655 = _4367;
            }
            float _4657 = _4655;
            bool _4659 = !_4653;
            _4637 = _4657;
            _4639 = _4659;
            if (!_4639)
            {
                float _4661 = _2458 * _4451;
                float _4663 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _4665 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4403);
                float _4667 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4511);
                float _4669 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4507);
                float _4671 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4665);
                float _4673 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4667);
                float _4675 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4669);
                float _4677 = rsqrt(_4643);
                float _4679 = _4663 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4681 = 1.0 / _4671;
                float _4683 = _4623 * _4679;
                float _4685 = _4619 * _4679;
                float _4687 = _4683 * _4683;
                float _4689 = fma(_4685, _4685, _4687);
                float _4691 = _4673 * _4681;
                float _4693 = _4675 * _4681;
                float _4695 = sqrt(_4689);
                float _4697 = _4691 * _4691;
                float _4699 = fma(_4693, _4693, _4697);
                float _4701 = _4623 * _4677;
                float _4703 = _4619 * _4677;
                float _4705 = _4651 * _4701;
                float _4707 = sqrt(_4699);
                float _4709 = fma(_4649, _4703, _4705);
                float _4711 = precise::min(0.0, _4709);
                float _4713 = _3924 * _4711;
                float _4715 = fma(_4695, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4707);
                float _4717 = fma(_4685, _4713, _3958);
                float _4719 = fma(_4683, _4713, _3960);
                float _4721 = 1.0 / _4715;
                out.gl_Position.x = _4717;
                out.gl_Position.y = _4719;
                float _4723 = _4707 * _4721;
                out.m_94.y = _4723;
                _3104 = _4713;
                _4637 = _4367;
                _3380 = _4705;
                _4639 = true;
            }
        }
    }
    else
    {
        float _4725 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4725;
        _4637 = 0.0;
    }
    _4639 = false;
    float _4727 = _3104;
    float _4729 = _4637;
    float _4731 = _3380;
    bool _4733 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4735 = isnan(_4123);
    bool _4737 = _4733 || _4735;
    bool _4739 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4741 = _4737 || _4739;
    float _4743 = _4731;
    float _4745 = _4727;
    if (!_4741)
    {
        _4743 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4747 = _4743;
    float _4749 = _4747;
    float _4751 = _4747;
    if (!_4741)
    {
        _4745 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4753 = _4745;
    float _4755 = _4753;
    float _4757 = _4753;
    if (!_4741)
    {
        _4465 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4759 = _4465;
    bool _4761 = !_4741;
    float _4763 = _4759;
    float _4765 = _4759;
    if (!_4761)
    {
        bool _4767 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4769 = isnan(_4123);
        bool _4771 = _4767 || _4769;
        bool _4773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4775 = _4771 || _4773;
        if (!_4775)
        {
            float _4777 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4779 = _4123 + _4777;
            float _4781 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4783 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4781;
            float _4785 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4787 = _4785 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4789 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4791 = _4789 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4793 = 1.0 / _4783;
            float _4795 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4797 = _4795 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4799 = _4779 * _4793;
            float _4801 = precise::clamp(_4799, 0.0, 1.0);
            float _4803 = fma(_4801, _4787, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4805 = fma(_4801, _4791, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4807 = fma(_4801, _4797, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4757 = _4805;
            _4751 = _4803;
            _4765 = _4807;
            _4809 = true;
        }
        else
        {
            bool _4811 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4813 = isnan(_4123);
            bool _4815 = _4811 || _4813;
            bool _4817 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4819 = _4815 || _4817;
            if (!_4819)
            {
                _4749 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4821 = _4749;
            _4751 = _4821;
            if (!_4819)
            {
                _4755 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4823 = _4755;
            _4757 = _4823;
            if (!_4819)
            {
                _4763 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4825 = _4763;
            bool _4827 = !_4819;
            _4765 = _4825;
            if (!_4827)
            {
                bool _4829 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4831 = isnan(_4123);
                bool _4833 = _4829 || _4831;
                bool _4835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4837 = _4833 || _4835;
                if (!_4837)
                {
                    float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4841 = _4123 + _4839;
                    float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4843;
                    float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4855 = 1.0 / _4845;
                    float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4859 = _4857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4861 = _4841 * _4855;
                    float _4863 = precise::clamp(_4861, 0.0, 1.0);
                    float _4865 = fma(_4863, _4849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4867 = fma(_4863, _4853, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4869 = fma(_4863, _4859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4757 = _4867;
                    _4751 = _4865;
                    _4765 = _4869;
                    _4809 = true;
                }
                else
                {
                    _4757 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4751 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4765 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4809 = false;
    float _4871 = _4757;
    float _4873 = _4751;
    float _4875 = _4765;
    float _4877 = _4871 * 0.586610972881317138671875;
    bool _4879 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4881 = _4729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4883 = fma(_4873, 0.298911988735198974609375, _4877);
    out.m_102.x = 0.0;
    float _4885 = fma(_4875, 0.114477999508380889892578125, _4883);
    out.m_61.x = _4881;
    float _4887 = -_4885;
    float _4889 = _4887 + _4873;
    float _4891 = -_4885;
    float _4893 = _4891 + _4871;
    float _4895 = -_4885;
    float _4897 = _4895 + _4875;
    float _4899 = fma(_4889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    float _4901 = fma(_4893, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    float _4903 = fma(_4897, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    out.m_104.x = _4899;
    out.m_104.y = _4901;
    out.m_104.z = _4903;
    if (!_4879)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4905 = -_3812;
    float _4907 = _4905 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4909 = -_3814;
    float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4913 = -_3816;
    float _4915 = _4913 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4917 = _4907 * _4907;
    float _4919 = fma(_4911, _4911, _4917);
    float _4921 = fma(_4915, _4915, _4919);
    float _4923 = sqrt(_4921);
    float _4925 = rsqrt(_4921);
    float _4927 = -_4923;
    float _4929 = _4927 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4931 = _4929 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4933 = precise::clamp(_4931, 0.0, 1.0);
    float _4935 = _4911 * _4925;
    float _4937 = _4907 * _4925;
    float _4939 = abs(_4933);
    float _4941 = log2(_4939);
    float _4943 = _4915 * _4925;
    float _4945 = _4935 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4947 = _3020 * _4937;
    float _4949 = -_4937;
    float _4951 = -_4945;
    float _4953 = fma(_4949, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4951);
    float _4955 = fma(_2994, _4935, _4947);
    float _4957 = -_4943;
    float _4959 = fma(_4957, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4953);
    float _4961 = fma(_3022, _4943, _4955);
    float _4963 = precise::clamp(_4961, 0.0, 1.0);
    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4967 = _4959 + _4965;
    float _4969 = _4941 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4971 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4973 = precise::clamp(_4971, 0.0, 1.0);
    float _4975 = exp2(_4969);
    float _4977 = _4975 * _4973;
    float _4979 = _4963 * _4977;
    float _4981 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4983 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4985 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4981;
    out.m_102.y = _4983;
    out.m_102.z = _4985;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4809 = false;
    bool _4639 = false;
    bool _3122 = false;
    bool _3110 = false;
    bool _725 = false;
    bool _539 = false;
    bool _347 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _5042 = as_type<float>(_139);
        out.gl_Position.z = _5042;
    }
    if (!_127)
    {
        return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5112 = as_type<float>(_177);
        out.gl_Position.z = _5112;
    }
    if (_169)
    {
        return out;
    }
    float _179 = in.m_65.x;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _183 = _157 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_70.x;
    float _189 = in.m_70.y;
    float _191 = in.m_70.z;
    float _193 = in.m_72.x;
    float _195 = in.m_72.y;
    float _197 = in.m_72.z;
    float _199 = in.m_74.x;
    float _201 = in.m_74.y;
    float _203 = in.m_74.z;
    float _205 = _183 * _181;
    float _207 = in.m_76.x;
    float _209 = in.m_76.y;
    float _211 = in.m_76.z;
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[20].x, _205);
    int _215 = as_type<int>(_185) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_185) & 2;
    bool _221 = _219 != 0;
    float _223 = _213 * 6.283185482025146484375;
    float _225 = floor(_213);
    float _227 = _223 * 0.15915493667125701904296875;
    bool _229 = !_221;
    float _231 = _229 ? (-0.5) : 0.5;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = _189 * _195;
    int _243 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _245 = _243 != 0;
    float _247 = _227 * 6.283185482025146484375;
    float _249 = cos(_247);
    float _251 = _189 * _201;
    bool _253 = !_235;
    int _255 = _253 ? 0 : 1;
    float _257 = fma(_187, _193, _241);
    bool _259 = !_245;
    int _261 = _259 ? 0 : 1;
    float _263 = _189 * _209;
    int _265 = abs(_255);
    float _267 = fma(_187, _199, _251);
    float _269 = -_225;
    float _271 = _213 + _269;
    float _273 = fma(_187, _207, _263);
    float _275 = fma(_191, _197, _257);
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _279 = -_271;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = float(_265);
    int _285 = abs(_261);
    float _287 = fma(_249, 0.5, 0.5);
    bool _289 = !_239;
    int _291 = _289 ? 0 : 1;
    float _293 = abs(_281);
    float _295 = _283 * _293;
    bool _297 = _271 < 0.5;
    float _299 = float(_297);
    float _301 = -_287;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_291);
    float _307 = float(_285);
    float _309 = -_299;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = float(_305);
    float _315 = fma(_191, _203, _267);
    float _317 = fma(_191, _211, _273);
    float _319 = fma(_307, _303, _295);
    bool _321 = !_217;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = abs(_311);
    float _327 = fma(_313, _325, _319);
    bool _329 = !_277;
    float _345;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_123);
        float _351 = 1.0 / _349;
        float _353 = _157 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _359 = _355 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = _355 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _355 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    bool _381 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _383 = isnan(_355);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = 1.0 / _375;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _397 = 1.0 / _371;
    float _399 = 1.0 / _379;
    float _401 = _367 * _393;
    bool _403 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_355);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _359 * _397;
    bool _417 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _419 = isnan(_355);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_391;
    float _431 = _429 + 1.0;
    float _433 = _427 * _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = _363 * _399;
    bool _441 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_355);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_427;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _451 * _455;
    float _471 = -_451;
    float _473 = _471 + 1.0;
    float _475 = fma(_459, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = fma(_463, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = _413 * _473;
    float _481 = -_413;
    float _483 = _481 + 1.0;
    float _485 = fma(_437, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = _475 * _479;
    float _489 = _477 * _479;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _491;
    float _495 = fma(_467, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _487);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _489);
    float _505 = fma(_493, _439, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = fma(_485, _469, _497);
    float _509 = fma(_501, _439, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_495, _469, _503);
    float _513 = fma(_505, _433, _507);
    float _515 = fma(_509, _433, _511);
    float _517 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[146].x, _513);
    float _519 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[146].y, _515);
    bool _521 = !_395;
    float _537;
    if (!_521)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _179 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_123);
        float _543 = 1.0 / _541;
        float _545 = _157 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _547 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_547);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _555;
    float _591 = -_567;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    bool _599 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_547);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _587 * _593;
    float _613 = -_587;
    float _615 = _613 + 1.0;
    bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _619 = 1.0 / _571;
    float _621 = _609 * _615;
    float _623 = -_609;
    float _625 = _623 + 1.0;
    float _627 = 1.0 / _575;
    float _629 = _597 * _589;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _635 = fma(_629, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = _633 * _619;
    bool _639 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _641 = isnan(_547);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _657 = _547 + _655;
    float _659 = _635 * _621;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _547 + _661;
    float _665 = -_649;
    float _667 = _665 + 1.0;
    float _669 = fma(_637, _657, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _671 = _653 * _627;
    float _673 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _675 = _567 * _667;
    float _677 = fma(_671, _663, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _679 = fma(_669, _611, _673);
    float _681 = fma(_677, _675, _679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _687 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[118].x, _681);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _691 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = in.m_78.x;
    float _701 = in.m_78.y;
    out.m_80.x = _691;
    out.m_80.y = _693;
    out.m_80.z = _697;
    out.m_80.w = _695;
    float _703 = _519 * _701;
    float _705 = _517 * _699;
    bool _707 = !_617;
    float _723;
    if (!_707)
    {
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _711 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        float _727 = float(_123);
        float _729 = 1.0 / _727;
        float _731 = _157 * _729;
        _723 = _731;
    }
    _725 = false;
    float _733 = _723;
    float _735 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _737 = int(_735);
    float _739 = in.m_72.w;
    bool _741 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _743 = isnan(_733);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _755 = _733 + _753;
    float _757 = _327 * _703;
    float _759 = -_751;
    float _761 = _759 + 1.0;
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _765 = int(_763);
    float _767 = float(_737);
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _771 = int(_769);
    float _773 = float(uint(_765));
    float _775 = 1.0 / _767;
    int _777 = ~_765;
    int _779 = _777 + 1;
    int _781 = ~_765;
    int _783 = _781 + 1;
    bool _785 = _765 == 0;
    int _787 = ~_765;
    int _789 = _787 + 1;
    float _791 = 1.0 / _773;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _795 = _793 != 0;
    float _797 = _775 * _157;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _801 = int(_799);
    int _803 = as_type<int>(_791) + (-2);
    float _805 = trunc(_797);
    int _807 = int(_805);
    float _809 = float(uint(_801));
    int _811 = ~_801;
    int _813 = _811 + 1;
    float _815 = 1.0 / _809;
    int _817 = ~_801;
    int _819 = _817 + 1;
    float _821 = float(uint(_807));
    float _823 = as_type<float>(_803) * _821;
    float _825 = trunc(_823);
    float _827 = precise::max(_825, 0.0);
    uint _830 = uint(_827);
    int _832 = as_type<int>(_815) + (-2);
    int _834 = _779 * int(_830);
    int _836 = _834 + _807;
    float _838 = float(uint(_836));
    float _840 = as_type<float>(_803) * _838;
    float _842 = float(_771);
    float _844 = as_type<float>(_771);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_795)
    {
        _844 = 1.0;
    }
    float _848 = _844;
    float _850 = 1.0 / _842;
    float _852 = _848;
    if (!_795)
    {
        _852 = 7.345489978790283203125;
    }
    float _854 = _852;
    float _856 = _854 * _179;
    float _858 = trunc(_840);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    float _864 = floor(_856);
    float _866 = _850 * _157;
    int _868 = int(_830) + int(_862);
    float _870 = trunc(_866);
    int _872 = int(_870);
    float _874 = float(_765);
    float _876 = float(_807);
    bool _878 = _876 >= _874;
    bool _880 = isnan(_876);
    bool _882 = _878 || _880;
    bool _884 = isnan(_874);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    int _890 = _783 * _868;
    int _892 = _890 + _807;
    float _894 = float(_123);
    float _896 = -_864;
    float _898 = _856 + _896;
    bool _900 = uint(_892) >= uint(_765);
    float _902 = trunc(_888);
    int _904 = int(_902);
    float _906 = _898 * _874;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _914 = _912 != 0;
    int _916 = ~_868;
    int _918 = _916 + _910;
    int _920 = _918 + 1;
    float _922 = 1.0 / _894;
    bool _924 = !_914;
    int _926 = _924 ? 0 : 1;
    float _928 = float(uint(_872));
    int _930 = _765 * _920;
    int _932 = _930 + _807;
    int _934 = abs(_926);
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _938 = _936 != 0;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _942 = _940 != 0;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _946 = _944 != 0;
    float _948 = trunc(_906);
    int _950 = int(_948);
    int _952 = ~_904;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = as_type<float>(_832) * _928;
    bool _960 = !_785;
    int _962 = _960 ? _932 : (-1);
    int _964 = _765 + (-1);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _968 = _966 != 0;
    int _970 = _962 * _956;
    float _972 = _922 * _157;
    float _974 = trunc(_958);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    float _980 = float(_872);
    int _982 = _904 * _964;
    int _984 = _982 + _970;
    float _986 = _874 * _972;
    bool _988 = !_942;
    int _990 = _988 ? 0 : 1;
    int _992 = _950 * _934;
    int _994 = _992 + _807;
    int _996 = ~_801;
    int _998 = _996 + 1;
    float _1000 = trunc(_986);
    int _1002 = int(_1000);
    bool _1004 = !_938;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = abs(_990);
    bool _1010 = !_946;
    int _1012 = _1010 ? 0 : 1;
    int _1014 = _998 * int(_978);
    int _1016 = _1014 + _872;
    int _1018 = abs(_1006);
    int _1020 = _984 * _1008;
    bool _1022 = !_968;
    int _1024 = _1022 ? 0 : 1;
    int _1026 = abs(_1012);
    float _1028 = float(uint(_1016));
    int _1030 = abs(_1024);
    int _1032 = _1002 * _1018;
    int _1034 = _1032 + _1020;
    float _1036 = as_type<float>(_832) * _1028;
    float _1038 = in.m_65.y;
    int _1040 = _994 * _1026;
    int _1042 = _1040 + _1034;
    float _1044 = trunc(_1036);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1052 = _1050 != 0;
    int _1054 = _950 * _1030;
    int _1056 = _1054 + _1042;
    bool _1058 = _801 == 0;
    float _1060 = float(uint(_1056));
    float _1062 = as_type<float>(_803) * _1060;
    float _1064 = float(_801);
    int _1066 = int(_978) + int(_1048);
    float _1068 = trunc(_1062);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = as_type<float>(_1048);
    if (_1052)
    {
        _1074 = _179;
    }
    float _1076 = _1074;
    float _1078 = _1076;
    if (_1052)
    {
        _846 = 1.0;
    }
    float _1080 = _846;
    int _1082 = _813 * _1066;
    int _1084 = _1082 + _872;
    float _1086 = _1080;
    if (!_1052)
    {
        _1078 = _1038;
    }
    float _1088 = _1078;
    float _1090 = _1038 + (-0.5);
    if (!_1052)
    {
        _1086 = 1.2345600128173828125;
    }
    float _1092 = _1086;
    bool _1094 = _980 >= _1064;
    bool _1096 = isnan(_980);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(_1064);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    int _1106 = ~_765;
    int _1108 = _1106 + 1;
    float _1110 = _1088 * _1092;
    bool _1112 = uint(_1084) >= uint(_801);
    float _1114 = trunc(_1104);
    int _1116 = int(_1114);
    int _1118 = _1108 * int(_1072);
    int _1120 = _1118 + _1056;
    bool _1122 = !_1112;
    int _1124 = _1122 ? 0 : (-1);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1128 = _1126 != 0;
    float _1130 = float(uint(_1120));
    float _1132 = floor(_1110);
    int _1134 = ~_1066;
    int _1136 = _1134 + _1124;
    int _1138 = _1136 + 1;
    float _1140 = as_type<float>(_803) * _1130;
    bool _1142 = !_1128;
    int _1144 = _1142 ? 0 : 1;
    int _1146 = _801 * _1138;
    int _1148 = _1146 + _872;
    int _1150 = _801 + (-1);
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = ~_1116;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    bool _1164 = !_1058;
    int _1166 = _1164 ? _1148 : (-1);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1182 = _1180 != 0;
    bool _1184 = _765 == 0;
    float _1186 = -_1132;
    float _1188 = _1110 + _1186;
    int _1190 = _1166 * _1162;
    float _1192 = _1064 * _972;
    bool _1194 = !_1174;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = _1188 * _1064;
    float _1200 = float(uint(_994));
    int _1202 = _1116 * _1150;
    int _1204 = _1202 + _1190;
    int _1206 = abs(_1196);
    float _1208 = trunc(_1192);
    int _1210 = int(_1208);
    bool _1212 = !_1170;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = as_type<float>(_803) * _1200;
    int _1218 = int(_1072) + int(_1156);
    int _1220 = _1204 * _1206;
    int _1222 = ~_765;
    int _1224 = _1222 + 1;
    int _1226 = abs(_1214);
    float _1228 = trunc(_1198);
    int _1230 = int(_1228);
    int _1232 = abs(_1144);
    int _1234 = _1224 * _1218;
    int _1236 = _1234 + _1056;
    bool _1238 = !_1178;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = ~_765;
    int _1244 = _1242 + 1;
    int _1246 = abs(_1240);
    float _1248 = trunc(_1216);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    int _1254 = _1210 * _1226;
    int _1256 = _1254 + _1220;
    bool _1258 = uint(_1236) >= uint(_765);
    float _1260 = _179 * 2.0;
    bool _1262 = !_1258;
    int _1264 = _1262 ? 0 : (-1);
    int _1266 = _1230 * _1232;
    int _1268 = _1266 + _872;
    bool _1270 = !_1182;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = ~_1218;
    int _1276 = _1274 + _1264;
    int _1278 = _1276 + 1;
    int _1280 = _1268 * _1246;
    int _1282 = _1280 + _1256;
    int _1284 = abs(_1272);
    float _1286 = in.m_65.z;
    float _1288 = floor(_1260);
    int _1290 = _1244 * int(_1252);
    int _1292 = _1290 + _994;
    float _1294 = _1038 * 2.0;
    int _1296 = _1230 * _1284;
    int _1298 = _1296 + _1282;
    int _1300 = _765 * _1278;
    int _1302 = _1300 + _1056;
    float _1304 = float(uint(_1292));
    float _1306 = floor(_1294);
    bool _1308 = !_1184;
    int _1310 = _1308 ? _1302 : (-1);
    float _1312 = as_type<float>(_803) * _1304;
    float _1314 = float(uint(_1298));
    int _1316 = _1310 & 3;
    bool _1318 = _1316 != 0;
    float _1320 = trunc(_1312);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = as_type<float>(_832) * _1314;
    bool _1328 = uint(_1316) > 1u;
    int _1330 = _1310 & 3;
    bool _1332 = _1330 != 0;
    bool _1334 = uint(_1316) >= 2u;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = _1332 ? 0 : 1;
    bool _1344 = _1316 != 3;
    int _1346 = ~_1342;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _1350;
    float _1354 = as_type<float>(_1156);
    if (!_1328)
    {
        int _1356 = ~_1342;
        int _1358 = _1356 + 1;
        _1352 = _1358;
    }
    int _1360 = _1352;
    int _1362 = int(_1252) + int(_1324);
    int _1364 = _1334 ? 0 : 1;
    bool _1366 = _1288 > 0.0;
    int _1368 = _819 * int(_1340);
    int _1370 = _1368 + _1298;
    bool _1372 = _1288 >= 0.0;
    bool _1374 = isnan(_1288);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    float _1382 = _1286 * 2.0;
    int _1384 = ~_1364;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    int _1390 = _1388;
    if (_1344)
    {
        int _1392 = ~_1364;
        int _1394 = _1392 + 1;
        _1390 = _1394;
    }
    int _1396 = _1390;
    float _1398 = float(uint(_1370));
    float _1400 = floor(_1382);
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1404 = _1402 != 0;
    int _1406 = _789 * _1362;
    int _1408 = _1406 + _994;
    int _1410 = _1380 ? 0 : 1;
    float _1412 = as_type<float>(_832) * _1398;
    bool _1414 = !_1404;
    int _1416 = _1414 ? 0 : 1;
    bool _1418 = _1306 > 0.0;
    float _1420 = trunc(_1412);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1410;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    bool _1432 = _1306 >= 0.0;
    bool _1434 = isnan(_1306);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    int _1442 = _1430;
    int _1444 = _1410;
    if (!_1366)
    {
        int _1446 = ~_1410;
        int _1448 = _1446 + 1;
        _1442 = _1448;
    }
    int _1450 = _1442;
    bool _1452 = uint(_1408) >= uint(_765);
    if (_1052)
    {
        _1444 = 0;
    }
    int _1454 = _1444;
    int _1456 = _1440 ? 0 : 1;
    int _1458 = _1454;
    if (!_1052)
    {
        _1458 = 1;
    }
    int _1460 = _1458;
    bool _1462 = !_1452;
    int _1464 = _1462 ? 0 : (-1);
    int _1466 = ~_1456;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1478 = _1476 != 0;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1482 = _1480 != 0;
    int _1484 = _1470;
    if (!_1418)
    {
        int _1486 = ~_1456;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    bool _1492 = _1400 > 0.0;
    bool _1494 = _1400 >= 0.0;
    bool _1496 = isnan(_1400);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    bool _1504 = _1460 != 1;
    int _1506 = ~_1362;
    int _1508 = _1506 + _1464;
    int _1510 = _1508 + 1;
    float _1512 = in.m_58.x;
    float _1514 = in.m_58.y;
    float _1516 = in.m_58.z;
    int _1518 = ~_801;
    int _1520 = _1518 + 1;
    int _1522 = int(_1340) + int(_1424);
    int _1524 = _765 * _1510;
    int _1526 = _1524 + _994;
    int _1528 = _1502 ? 0 : 1;
    int _1530 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1532 = _1530 != 0;
    int _1534 = _1520 * _1522;
    int _1536 = _1534 + _1298;
    bool _1538 = !_1478;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = ~_1528;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _1546;
    float _1550 = as_type<float>(_1536);
    if (!_1492)
    {
        int _1552 = ~_1528;
        int _1554 = _1552 + 1;
        _1548 = _1554;
    }
    int _1556 = _1548;
    bool _1558 = _765 == 0;
    bool _1560 = uint(_1536) >= uint(_801);
    if (!_1504)
    {
        _1354 = _1038;
    }
    float _1562 = _1354;
    float _1564 = 0.0;
    float _1566 = _1562;
    if (!_1504)
    {
        _1564 = _1038;
    }
    float _1568 = _1564;
    float _1570 = _1568;
    if (!_1504)
    {
        _1550 = _1286;
    }
    float _1572 = _1550;
    float _1574 = _209 * _1514;
    float _1576 = 0.0;
    float _1578 = _1572;
    if (!_1504)
    {
        _1576 = _1286;
    }
    float _1580 = _1576;
    float _1582 = _201 * _1514;
    bool _1584 = !_1558;
    int _1586 = _1584 ? _1526 : (-1);
    float _1588 = fma(_207, _1512, _1574);
    bool _1590 = !_1474;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = fma(_199, _1512, _1582);
    float _1596 = _1580;
    if (_1504)
    {
        _1566 = _179;
    }
    float _1598 = _1566;
    float _1600 = fma(_211, _1516, _1588);
    if (_1504)
    {
        _1570 = _179;
    }
    float _1602 = _1570;
    float _1604 = fma(_203, _1516, _1594);
    if (_1504)
    {
        _1578 = _1038;
    }
    float _1606 = _1578;
    float _1608 = in.m_76.w;
    if (_1504)
    {
        _1596 = _1038;
    }
    float _1610 = _1596;
    bool _1612 = !_1560;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1632 = _1630 != 0;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1642 = _195 * _1514;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1652 = 1.0 / _1636;
    float _1654 = fma(_193, _1512, _1642);
    float _1656 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1658 = fma(_197, _1516, _1654);
    float _1660 = _179 + _1038;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1666 = 1.0 / _1640;
    float _1668 = _1658 + _739;
    float _1670 = float(_1450);
    float _1672 = _1600 + _1608;
    bool _1674 = !_1482;
    int _1676 = _1674 ? 0 : 1;
    float _1678 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1680 = _1668 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1682 = 1.0 / _1664;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1688 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1690 = abs(_1676);
    float _1692 = -_1684;
    float _1694 = fma(_1656, 2.0, _1692);
    float _1696 = fma(_1688, -2.0, _1686);
    float _1698 = _1660 + (-1.0);
    float _1700 = _1650 * _1652;
    float _1702 = _179 + _1286;
    float _1704 = in.m_74.w;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1706;
    float _1710 = _1286 + _1038;
    float _1712 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1714 = _1708 * _1682;
    float _1716 = _1702 + (-1.0);
    float _1718 = _1710 + (-1.0);
    bool _1720 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1722 = isnan(_733);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1646 * _1666;
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1740 = _733 + _1738;
    bool _1742 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1744 = isnan(_733);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1730;
    float _1756 = _1754 + 1.0;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1760 = _733 + _1758;
    float _1762 = fma(_1732, _1740, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1764 = fma(_1714, _755, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1766 = _1752 * _1756;
    float _1768 = fma(_1700, _1760, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1770 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1772 = isnan(_733);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = -_1752;
    float _1784 = _1782 + 1.0;
    float _1786 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1788 = log2(_1786);
    float _1790 = _1604 + _1704;
    float _1792 = _751 * _1784;
    int _1794 = abs(_1540);
    float _1796 = _1780 * _761;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1800 = _1762 * _1796;
    float _1802 = float(_1794);
    float _1804 = _1790 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1806 = -_1780;
    float _1808 = _1806 + 1.0;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1812 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1798);
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1816 = _1802 * _1670;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1820 = in.m_82.x;
    float _1822 = in.m_82.y;
    float _1824 = in.m_82.z;
    float _1826 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1800);
    float _1828 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1810);
    float _1830 = -_1814;
    float _1832 = fma(_1678, 2.0, _1830);
    float _1834 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1836 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1838 = float(_1490);
    float _1840 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1818);
    float _1842 = _1788 * _157;
    int _1844 = abs(_1592);
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1848 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1834);
    float _1850 = _1672 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1852 = exp2(_1842);
    float _1854 = float(_1690);
    float _1856 = fma(_1616, -2.0, _1846);
    float _1858 = _1816 * (-2.0);
    float _1860 = float(_1556);
    float _1862 = _1854 * _1838;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1848);
    float _1866 = float(_1844);
    float _1868 = fma(_1736, _1858, _1736);
    float _1870 = fma(_1858, _1822, _1822);
    float _1872 = float(uint(_1268));
    float _1874 = _1866 * _1860;
    float _1876 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1836);
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1880 = 1.0 + _1878;
    bool _1882 = !_1620;
    int _1884 = _1882 ? 0 : 1;
    float _1886 = -_1852;
    float _1888 = _1886 + 1.0;
    bool _1890 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1892 = isnan(0.0);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1898 = _1894 || _1896;
    float _1900 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1840);
    float _1902 = as_type<float>(_832) * _1872;
    float _1904 = 1.0 / _1880;
    float _1906 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1876);
    int _1908 = ~_1522;
    int _1910 = _1908 + _1614;
    int _1912 = _1910 + 1;
    float _1914 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1696);
    float _1916 = -_157;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1832);
    float _1920 = _1874 * (-2.0);
    float _1922 = _1898 ? _1888 : 0.0;
    float _1924 = trunc(_1902);
    float _1926 = precise::max(_1924, 0.0);
    uint _1928 = uint(_1926);
    bool _1930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1932 = isnan(1.0);
    bool _1934 = _1930 || _1932;
    bool _1936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1938 = _1934 || _1936;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1944 = -_157;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1694);
    float _1948 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1856);
    float _1950 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1940);
    float _1952 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1942);
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1956 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1812);
    float _1958 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1950);
    float _1960 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1952);
    float _1962 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1828);
    int _1964 = _801 * _1912;
    int _1966 = _1964 + _1298;
    if (_1938)
    {
        float _1968 = _1922 * _1904;
        _159 = _1968;
    }
    float _1970 = _159;
    int _1972 = ~_801;
    int _1974 = _1972 + 1;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1978 = _801 == 0;
    float _1980 = _1900 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1982 = fma(_1920, _1820, _1820);
    int _1984 = _1974 * int(_1928);
    int _1986 = _1984 + _1268;
    bool _1988 = !_1978;
    int _1990 = _1988 ? _1966 : (-1);
    float _1992 = fma(_1712, _1920, _1712);
    bool _1994 = !_1318;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2000 = _1980 * _1954;
    int _2002 = _1990 & 3;
    bool _2004 = _2002 != 0;
    float _2006 = _1864 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _2008 = float(uint(_1986));
    float _2010 = fma(_2000, 0.5, 0.5);
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : 1;
    float _2016 = _1862 * (-2.0);
    int _2018 = _1990 & 3;
    bool _2020 = _2018 != 0;
    float _2022 = as_type<float>(_832) * _2008;
    float _2024 = _1906 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _2026 = _2006 * _1976;
    int _2028 = _2020 ? 0 : 1;
    float _2030 = fma(_1734, _2016, _1734);
    bool _2032 = _1316 != 3;
    float _2034 = trunc(_2022);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = fma(_2016, _1824, _1824);
    float _2042 = _2024 * _1998;
    bool _2044 = !_2032;
    int _2046 = _2044 ? 0 : (-1);
    float _2048 = fma(_2026, 0.5, 0.5);
    bool _2050 = uint(_2002) > 1u;
    float _2052 = _179 + (-0.5);
    float _2054 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1870);
    bool _2056 = _179 > 0.5;
    float _2058 = _1286 + (-0.5);
    float _2060 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1982);
    float _2062 = fma(_1868, _1970, _2054);
    float _2064 = fma(_1768, _1792, _1826);
    float _2066 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2040);
    float _2068 = fma(_1992, _1970, _2060);
    int _2070 = ~_801;
    int _2072 = _2070 + 1;
    float _2074 = fma(_1764, _1766, _2064);
    int _2076 = ~_2028;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    float _2082 = fma(_2030, _1970, _2066);
    int _2084 = int(_1928) + int(_2038);
    float _2086 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2074);
    int _2088 = _2080;
    if (!_2050)
    {
        int _2090 = ~_2028;
        int _2092 = _2090 + 1;
        _2088 = _2092;
    }
    int _2094 = _2088;
    float _2096 = _2062 * 0.15915493667125701904296875;
    float _2098 = fma(_2042, 0.5, 0.5);
    bool _2100 = uint(_2002) >= 2u;
    float _2102 = floor(_2010);
    int _2104 = _1310 >> 31;
    int _2106 = _2072 * _2084;
    int _2108 = _2106 + _1268;
    int _2110 = _1990 >> 31;
    float _2112 = -_1958;
    float _2114 = _2112 + 1.0;
    int _2116 = _2100 ? 0 : 1;
    float _2118 = -_1962;
    float _2120 = _2118 + 1.0;
    bool _2122 = _2002 != 3;
    float _2124 = floor(_2098);
    int _2126 = _2104 & 3;
    int _2128 = _2110 & 3;
    bool _2130 = !_2122;
    int _2132 = _2130 ? 0 : (-1);
    int _2134 = _1310 + _2126;
    float _2136 = _2096 * 6.283185482025146484375;
    float _2138 = sin(_2136);
    bool _2140 = uint(_2108) >= uint(_801);
    float _2142 = _2068 * 0.15915493667125701904296875;
    int _2144 = _1990 + _2128;
    float _2146 = -_2102;
    float _2148 = _2010 + _2146;
    int _2150 = _2134 >> 2;
    float _2152 = in.m_65.w;
    bool _2154 = !_2140;
    int _2156 = _2154 ? 0 : (-1);
    float _2158 = _2096 * 6.283185482025146484375;
    float _2160 = cos(_2158);
    int _2162 = _2144 >> 2;
    int _2164 = _2150 << 4;
    int _2166 = _2164 + 368;
    int _2168 = ~_2084;
    int _2170 = _2168 + _2156;
    int _2172 = _2170 + 1;
    bool _2174 = _2002 != 3;
    uint _2176 = uint(int(uint(_2166) >> uint(2)));
    uint _2178 = uint(int(uint(int(_2176)) >> uint(2)));
    int _2180 = int(_2176) & 3;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[int(_2178)][_2180];
    int _2184 = int(_2176) + 1;
    uint _2186 = uint(int(uint(_2184) >> uint(2)));
    int _2188 = _2184 & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = _2162 << 4;
    int _2194 = _2192 + 512;
    int _2196 = _801 * _2172;
    int _2198 = _2196 + _1268;
    int _2200 = ~_2116;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    float _2206 = _2082 * 0.15915493667125701904296875;
    float _2208 = _2142 * 6.283185482025146484375;
    float _2210 = sin(_2208);
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _2214 = -_323;
    int _2216 = _2056 ? as_type<int>(_2214) : as_type<int>(_323);
    uint _2218 = uint(int(uint(_2194) >> uint(2)));
    uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
    int _2222 = int(_2218) & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    int _2226 = int(_2218) + 1;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    int _2230 = _2226 & 3;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[int(_2228)][_2230];
    int _2234 = abs(_1360);
    int _2236 = abs(_1996);
    int _2238 = _2204;
    if (_2174)
    {
        int _2240 = ~_2116;
        int _2242 = _2240 + 1;
        _2238 = _2242;
    }
    int _2244 = _2238;
    float _2246 = _2206 * 6.283185482025146484375;
    float _2248 = cos(_2246);
    bool _2250 = !_1978;
    int _2252 = _2250 ? _2198 : (-1);
    int _2254 = _2194 + 8;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
    int _2260 = int(_2256) & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = int(_2256) + 1;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    int _2268 = _2264 & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    bool _2272 = _1286 > 0.5;
    float _2274 = _757 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2276 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2278 = _1038 > 0.5;
    float _2280 = _2210 * _2138;
    float _2282 = _2142 * 6.283185482025146484375;
    float _2284 = cos(_2282);
    bool _2286 = _2152 > 0.5;
    int _2288 = _2166 + 8;
    uint _2290 = uint(int(uint(_2288) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    float _2306 = _2274 * _2212;
    float _2308 = -_2124;
    float _2310 = _2098 + _2308;
    float _2312 = _2210 * _2160;
    out.m_84.w = _2276;
    int _2314 = ~_2236;
    int _2316 = _2314 + 1;
    int _2318 = _2316 + 1;
    float _2320 = floor(_2048);
    float _2322 = _2160 * _2248;
    int _2324 = abs(_1396);
    float _2326 = _2210 * _2248;
    int _2328 = abs(_2244);
    bool _2330 = !_1532;
    float _2332 = _2330 ? _323 : as_type<float>(_2216);
    float _2334 = _2206 * 6.283185482025146484375;
    float _2336 = sin(_2334);
    float _2338 = _2284 * _2160;
    float _2340 = _2284 * _2138;
    float _2342 = _2284 * _2248;
    float _2344 = _2138 * _2248;
    int _2346 = ~_2234;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    float _2352 = -_2320;
    float _2354 = _2048 + _2352;
    int _2356 = abs(_2094);
    float _2358 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2360 = abs(_2014);
    int _2362 = _2350 * as_type<int>(_2190);
    int _2364 = ~_2356;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = _2342 * _2306;
    int _2372 = ~_2360;
    int _2374 = _2372 + 1;
    int _2376 = _2374 + 1;
    int _2378 = _2318 * as_type<int>(_2182);
    int _2380 = _2378 + _2362;
    float _2382 = -_2340;
    float _2384 = fma(_2336, _2312, _2382);
    int _2386 = _2368 * as_type<int>(_2232);
    float _2388 = -_2312;
    float _2390 = fma(_2336, _2340, _2388);
    int _2392 = abs(_2046);
    float _2394 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2396 = int(_2394);
    int _2398 = _2376 * as_type<int>(_2224);
    int _2400 = _2398 + _2386;
    float _2402 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2404 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2406 = ~_2324;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2336, _2338, _2280);
    int _2414 = ~_2328;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    float _2420 = fma(_2336, _2280, _2338);
    int _2422 = ~_2392;
    int _2424 = _2422 + 1;
    int _2426 = _2424 + 1;
    float _2428 = -_2336;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2432 = -_2336;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2402);
    int _2436 = _2410 * as_type<int>(_2296);
    int _2438 = _2436 + _2380;
    int _2440 = abs(_1416);
    int _2442 = _2418 * as_type<int>(_2262);
    int _2444 = _2442 + _2400;
    float _2446 = _327 * _705;
    int _2448 = _2426 * as_type<int>(_2304);
    int _2450 = _2448 + _2438;
    float _2452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    float _2454 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2456 = int(_2454);
    float _2458 = _2446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2460 = float(uint(_2396));
    float _2462 = -_2336;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2404);
    int _2466 = ~_2440;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = _2458 * _2452;
    int _2474 = abs(_2132);
    float _2476 = -_2306;
    float _2478 = _2336 * _2476;
    float _2480 = 1.0 / _2460;
    int _2482 = _2450 * _2470;
    int _2484 = ~_2474;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2354, 2.0, -1.0);
    float _2492 = _2326 * _2306;
    int _2494 = _1586 * _2440;
    int _2496 = _2494 + _2482;
    float _2498 = fma(_2148, 2.0, -1.0);
    int _2500 = _2488 * as_type<int>(_2270);
    int _2502 = _2500 + _2444;
    float _2504 = _2490 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2506 = fma(_2322, _2472, _2478);
    float _2508 = fma(_2412, _2472, _2370);
    int _2510 = abs(_2396);
    float _2512 = fma(_2384, _2472, _2492);
    float _2514 = float(uint(_2456));
    float _2516 = _2498 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2518 = abs(_1884);
    float _2520 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2522 = 1.0 / _2514;
    float _2524 = float(uint(_2510));
    float _2526 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2434);
    int _2528 = ~_2518;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2536 = float(uint(_2496));
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _2540 = abs(_2456);
    float _2542 = 1.0 / _2524;
    float _2544 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2520);
    int _2546 = as_type<int>(_2480) + (-2);
    int _2548 = _2502 * _2532;
    float _2550 = float(uint(_2540));
    float _2552 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    int _2554 = abs(_2496);
    float _2556 = as_type<float>(_2546) * _2536;
    int _2558 = _2252 * _2518;
    int _2560 = _2558 + _2548;
    int _2562 = as_type<int>(_2522) + (-2);
    float _2564 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2464);
    float _2566 = 1.0 / _2550;
    float _2568 = float(uint(_2560));
    float _2570 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2534);
    float _2572 = float(uint(_2554));
    float _2574 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2576 = ~_2396;
    int _2578 = _2576 + 1;
    float _2580 = as_type<float>(_2562) * _2568;
    int _2582 = as_type<int>(_2542) + (-2);
    float _2584 = trunc(_2556);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    int _2590 = abs(_2560);
    float _2592 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2538);
    float _2594 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = as_type<float>(_2582) * _2572;
    float _2598 = float(uint(_2590));
    float _2600 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    float _2604 = trunc(_2580);
    float _2606 = precise::max(_2604, 0.0);
    uint _2608 = uint(_2606);
    int _2610 = as_type<int>(_2566) + (-2);
    int _2612 = ~_2510;
    int _2614 = _2612 + 1;
    int _2616 = ~_2540;
    int _2618 = _2616 + 1;
    float _2620 = as_type<float>(_2610) * _2598;
    float _2622 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    int _2624 = _2578 * int(_2588);
    int _2626 = _2624 + _2496;
    float _2628 = trunc(_2596);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2636 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2622);
    float _2638 = float(uint(_2626));
    float _2640 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2574);
    int _2642 = ~_2456;
    int _2644 = _2642 + 1;
    float _2646 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2634);
    float _2648 = trunc(_2620);
    float _2650 = precise::max(_2648, 0.0);
    uint _2652 = uint(_2650);
    float _2654 = as_type<float>(_2546) * _2638;
    float _2656 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2658 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2660 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2662 = _2644 * int(_2608);
    int _2664 = _2662 + _2560;
    float _2666 = trunc(_2654);
    float _2668 = precise::max(_2666, 0.0);
    uint _2670 = uint(_2668);
    int _2672 = _2614 * int(_2632);
    int _2674 = _2672 + _2554;
    float _2676 = fma(_2344, _2656, _2506);
    float _2678 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2658);
    float _2680 = float(uint(_2664));
    float _2682 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2660);
    float _2684 = float(uint(_2674));
    float _2686 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    int _2688 = _2618 * int(_2652);
    int _2690 = _2688 + _2590;
    float _2692 = as_type<float>(_2562) * _2680;
    float _2694 = fma(_2390, _2656, _2508);
    float _2696 = as_type<float>(_2582) * _2684;
    float _2698 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2640);
    float _2700 = float(uint(_2690));
    float _2702 = fma(_2420, _2656, _2512);
    float _2704 = trunc(_2696);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    float _2712 = -_231;
    int _2714 = _2278 ? as_type<int>(_2712) : as_type<int>(_231);
    float _2716 = as_type<float>(_2610) * _2700;
    float _2718 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2602);
    float _2720 = -_231;
    int _2722 = _2286 ? as_type<int>(_2720) : as_type<int>(_231);
    float _2724 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2726 = -_323;
    int _2728 = _2272 ? as_type<int>(_2726) : as_type<int>(_323);
    float _2730 = trunc(_2692);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = !_1624;
    float _2738 = _2736 ? _231 : as_type<float>(_2714);
    float _2740 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2742 = !_1632;
    float _2744 = _2742 ? _231 : as_type<float>(_2722);
    float _2746 = _323 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2748 = !_1628;
    float _2750 = _2748 ? _323 : as_type<float>(_2728);
    float _2752 = _2740 * _2552;
    int _2754 = int(_2588) + int(_2670);
    float _2756 = trunc(_2716);
    float _2758 = precise::max(_2756, 0.0);
    uint _2760 = uint(_2758);
    float _2762 = _2740 * _2526;
    int _2764 = int(_2632) + int(_2708);
    float _2766 = fma(_2746, _2718, _2752);
    int _2768 = ~_2396;
    int _2770 = _2768 + 1;
    out.m_86.x = _2718;
    out.m_86.y = _2698;
    out.m_86.z = _2710;
    int _2772 = ~_2456;
    int _2774 = _2772 + 1;
    float _2776 = fma(_2746, _2698, _2762);
    int _2778 = ~_2510;
    int _2780 = _2778 + 1;
    int _2782 = _2770 * _2754;
    int _2784 = _2782 + _2496;
    int _2786 = int(_2608) + int(_2734);
    int _2788 = ~_2540;
    int _2790 = _2788 + 1;
    int _2792 = _2780 * _2764;
    int _2794 = _2792 + _2554;
    bool _2796 = uint(_2784) >= uint(_2396);
    int _2798 = int(_2652) + int(_2760);
    float _2800 = _2740 * _2564;
    bool _2802 = !_2796;
    int _2804 = _2802 ? 0 : (-1);
    float _2806 = fma(_2746, _2710, _2800);
    bool _2808 = uint(_2794) >= uint(_2510);
    int _2810 = _2774 * _2786;
    int _2812 = _2810 + _2560;
    int _2814 = ~_2754;
    int _2816 = _2814 + _2804;
    int _2818 = _2816 + 1;
    float _2820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2822 = _2790 * _2798;
    int _2824 = _2822 + _2590;
    int _2826 = _2496 ^ _2396;
    bool _2828 = uint(_2812) >= uint(_2456);
    int _2830 = _2396 * _2818;
    int _2832 = _2830 + _2496;
    bool _2834 = _2396 == 0;
    bool _2836 = !_2828;
    int _2838 = _2836 ? 0 : (-1);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2842 = _2396 == 0;
    int _2844 = ~_2786;
    int _2846 = _2844 + _2838;
    int _2848 = _2846 + 1;
    int _2850 = _2560 ^ _2456;
    bool _2852 = !_2808;
    int _2854 = _2852 ? 0 : (-1);
    float _2856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2858 = uint(int(uint(_2826) >> uint(31)));
    bool _2860 = uint(_2824) >= uint(_2540);
    int _2862 = ~_2854;
    int _2864 = _2764 + _2862;
    int _2866 = _2864 + 1;
    uint _2868 = uint(int(uint(_2850) >> uint(31)));
    bool _2870 = !_2834;
    int _2872 = _2870 ? _2832 : (-1);
    int _2874 = ~int(_2858);
    int _2876 = _2874 + 1;
    bool _2878 = !_2860;
    int _2880 = _2878 ? 0 : (-1);
    float _2882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2884 = _2456 == 0;
    float _2886 = _2856 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2888 = _2456 == 0;
    int _2890 = _2456 * _2848;
    int _2892 = _2890 + _2560;
    int _2894 = ~int(_2868);
    int _2896 = _2894 + 1;
    float _2898 = _2820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2900 = float(_2872);
    int _2902 = _2866 ^ _2876;
    int _2904 = ~_2880;
    int _2906 = _2798 + _2904;
    int _2908 = _2906 + 1;
    float _2910 = fma(_2898, _2900, _1946);
    int _2912 = ~_2876;
    int _2914 = _2912 + _2902;
    int _2916 = _2914 + 1;
    int _2918 = _2908 ^ _2896;
    float _2920 = fma(_2740, _2740, 1.0);
    bool _2922 = !_2884;
    int _2924 = _2922 ? _2892 : (-1);
    int _2926 = ~_2896;
    int _2928 = _2926 + _2918;
    int _2930 = _2928 + 1;
    float _2932 = rsqrt(_2920);
    bool _2934 = !_2842;
    int _2936 = _2934 ? _2916 : (-1);
    float _2938 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2940 = float(_2924);
    float _2942 = _2332 + 0.5;
    float _2944 = float(_2936);
    bool _2946 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2948 = isnan(1.0);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2954 = _2950 || _2952;
    float _2956 = fma(_2938, _2940, _1918);
    bool _2958 = !_2888;
    int _2960 = _2958 ? _2930 : (-1);
    float _2962 = -_1914;
    float _2964 = fma(_2886, _2944, _2962);
    float _2966 = fma(_2898, _2942, _2910);
    float _2968 = _2738 + (-0.5);
    float _2970 = float(_2960);
    float _2972 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2974 = _2750 + 0.5;
    float _2976 = -_2886;
    float _2978 = fma(_2976, _2968, _2964);
    float _2980 = _2744 + (-0.5);
    float _2982 = -_1948;
    float _2984 = fma(_2972, _2970, _2982);
    float _2986 = _2740 * _2932;
    float _2988 = fma(_2938, _2974, _2956);
    float _2990 = -_2972;
    float _2992 = fma(_2990, _2980, _2984);
    float _2994 = _2686 + _2766;
    float _2996 = -_2686;
    float _2998 = _2986 * _2996;
    float _3000 = -_2724;
    float _3002 = _2986 * _3000;
    float _3004 = -_1956;
    float _3006 = _3004 + 1.0;
    float _3008 = -_1960;
    float _3010 = _3008 + 1.0;
    float _3012 = fma(_2932, _2552, _2998);
    float _3014 = fma(_2932, _2526, _3002);
    float _3016 = -_2114;
    float _3018 = fma(_2332, _3016, _2966);
    float _3020 = _2724 + _2776;
    float _3022 = _2636 + _2806;
    float _3024 = -_3006;
    float _3026 = fma(_2750, _3024, _2988);
    float _3028 = fma(_2738, _3010, _2978);
    float _3030 = fma(_2744, _2120, _2992);
    float _3032 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_88.x = _2994;
    out.m_88.y = _3020;
    out.m_88.z = _3022;
    float _3034 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3036 = fma(_2310, 2.0, -1.0);
    float _3038 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_90.x = _3018;
    out.m_90.y = _3028;
    out.m_90.z = _3026;
    out.m_90.w = _3030;
    float _3040 = -_2636;
    float _3042 = _2986 * _3040;
    float _3044 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3032);
    float _3046 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3034);
    float _3048 = _3036 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _3050 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3038);
    float _3052 = fma(_2932, _2564, _3042);
    float _3054 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3044);
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2570);
    float _3058 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2544);
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2592);
    float _3062 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3046);
    float _3064 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3050);
    out.m_92.x = _3012;
    out.m_92.y = _3014;
    out.m_92.z = _3052;
    float _3066 = _3058 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _3068 = _3060 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _3070 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3072 = _3062 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3074 = _3070 + _3066;
    float _3076 = _3056 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _3078 = _3064 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3080 = _3072 + _3076;
    float _3082 = _3078 + _3068;
    float _3084 = _2956;
    float _3086 = _3070;
    float _3088 = _2920;
    float _3090 = _3064;
    float _3092 = _3070;
    float _3094 = _3060;
    float _3096 = _3064;
    float _3098 = _2490;
    float _3100 = _3036;
    float _3102 = _2498;
    float _3104 = _2458;
    float _3114;
    float _3116;
    float _3118;
    float _3120;
    if (!_2954)
    {
        bool _3106 = _3076 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _3108 = !_3106;
        _3110 = _3108;
        if (!_3110)
        {
            float _3112 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _3114 = 0.0;
            _3116 = _3112;
            _3118 = 0.0;
            _3120 = 0.0;
            _3122 = true;
        }
    }
    if ((!_3122) || _3110)
    {
        bool _3158;
        if (!_3110)
        {
            bool _3124 = _3076 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _3126 = isnan(_3076);
            bool _3128 = _3124 || _3126;
            bool _3130 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _3132 = _3128 || _3130;
            bool _3134 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _3136 = !_3132;
            bool _3138 = _3134 && _3136;
            bool _3140 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _3094 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_3138)
            {
                _3084 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _3142 = _3084;
            float _3144 = _3142;
            if (_3138)
            {
                _3086 = 0.0;
            }
            float _3146 = _3086;
            _3092 = _3146;
            _3114 = _3146;
            if (_3138)
            {
                _3088 = 0.0;
            }
            float _3148 = _3088;
            _3118 = _3148;
            if (_3138)
            {
                float _3150 = _3142 * 5.0;
                _3144 = _3150;
            }
            float _3152 = _3144;
            _3116 = _3152;
            if (_3138)
            {
                _3090 = 0.0;
            }
            float _3154 = _3090;
            bool _3156 = !_3132;
            _3158 = _3156 && _3140;
            _3096 = _3154;
            _3120 = _3154;
        }
        if ((!_3158) || _3110)
        {
            _3110 = false;
            float _3160 = _3092;
            float _3162 = _3094;
            float _3164 = _3096;
            bool _3166 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _3168 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _3170 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _3172 = _3058;
            float _3174 = _3160;
            float _3176 = _3162;
            float _3178 = _3164;
            _3116 = _3082;
            _3118 = _3080;
            if (_3166)
            {
                float _3180 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _3172 = _3180;
            }
            float _3182 = _3172;
            if (_3166)
            {
                float _3184 = abs(_2498);
                float _3186 = -_3184;
                float _3188 = _3186 + 1.0;
                _3174 = _3188;
            }
            float _3190 = _3174;
            if (_3168)
            {
                float _3192 = abs(_2490);
                float _3194 = -_3192;
                float _3196 = _3194 + 1.0;
                _3098 = _3196;
            }
            float _3198 = _3098;
            if (!_3166)
            {
                _3176 = 1.0;
            }
            float _3200 = _3176;
            float _3202 = _3200;
            if (_3170)
            {
                float _3204 = abs(_3036);
                float _3206 = -_3204;
                float _3208 = _3206 + 1.0;
                _3100 = _3208;
            }
            float _3210 = _3100;
            if (!_3168)
            {
                _3102 = 1.0;
            }
            float _3212 = _3102;
            float _3214 = _3212;
            if (!_3170)
            {
                _3178 = 1.0;
            }
            float _3216 = _3178;
            float _3218 = _3078;
            float _3220 = _3216;
            if (_3168)
            {
                float _3222 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _3218 = _3222;
            }
            float _3224 = _3218;
            float _3226 = _3054;
            if (_3170)
            {
                float _3228 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _3226 = _3228;
            }
            float _3230 = _3226;
            if (_3166)
            {
                float _3232 = _3190 * _3182;
                float _3234 = precise::clamp(_3232, 0.0, 1.0);
                _3202 = _3234;
            }
            float _3236 = _3202;
            _3114 = _3074;
            if (_3168)
            {
                float _3238 = _3198 * _3224;
                float _3240 = precise::clamp(_3238, 0.0, 1.0);
                _3214 = _3240;
            }
            float _3242 = _3214;
            float _3244 = _3236 * _3242;
            if (_3170)
            {
                float _3246 = _3210 * _3230;
                float _3248 = precise::clamp(_3246, 0.0, 1.0);
                _3220 = _3248;
            }
            float _3250 = _3220;
            float _3252 = _3244 * _3250;
            _3120 = _3252;
        }
    }
    _3122 = false;
    float _3254 = _3114;
    float _3256 = _3116;
    float _3258 = _3118;
    float _3260 = _3120;
    float _3262 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3264 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3266 = floor(_3262);
    float _3268 = floor(_3264);
    float _3270 = -_3266;
    float _3272 = _3262 + _3270;
    float _3274 = -_3268;
    float _3276 = _3264 + _3274;
    float2 _9679 = float2(_3272, _3276);
    float _3278 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9679, float2(0.0), isnan(_9679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9679, float2(0.0), isnan(_9679)), level(0.0)).x;
    float _3280 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3282 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3286 = _3254 + _3284;
    float _3288 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3280);
    float _3290 = _3076 + _3282;
    float _3292 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3288);
    float _3294 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3298 = _3256 + _3296;
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3302 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3304 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3294);
    float _3306 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3300);
    float _3308 = 1.0 / _3302;
    float _3310 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3304);
    float _3312 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3314 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3306);
    float _3316 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3318 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3312);
    float _3320 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3322 = _3316 + _3302;
    float _3324 = trunc(_3320);
    int _3326 = int(_3324);
    float _3328 = _3322 * _3308;
    float _3330 = _3328 * 0.5;
    float _3332 = _3298 * _3298;
    float _3334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3336 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3334);
    float _3338 = fma(_3286, _3286, _3332);
    float _3340 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3318);
    float _3342 = sqrt(_3338);
    float _3344 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3346 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3348 = _3326 + _3346;
    int _3350 = _3348 + 1;
    float _3352 = 1.0 / _3336;
    float _3354 = trunc(_3344);
    int _3356 = int(_3354);
    float _3358 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3360 = _3352 * _3358;
    bool _3362 = _3360 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _3364 = _3360 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3366 = !_3362;
    int _3368 = _3366 ? 0 : 1;
    int _3370 = 2;
    float _3372 = _3258;
    float _3374 = _3254;
    float _3376 = _3256;
    int _3378 = _3350;
    float _3380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    if (!_3362)
    {
        _3370 = 1;
    }
    int _3382 = _3370;
    int _3384 = _3382;
    if (!_3364)
    {
        _3384 = _3368;
    }
    int _3386 = _3384;
    bool _3388 = _3342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3390 = _3386 << 6;
    int _3392 = _3390 + 48;
    uint _3394 = uint(int(uint(_3392) >> uint(2)));
    uint _3396 = uint(int(uint(int(_3394)) >> uint(2)));
    int _3398 = int(_3394) & 3;
    float _3400 = (*spvDescriptorSet0.vp_c15)._m0[int(_3396)][_3398];
    int _3402 = int(_3394) + 1;
    uint _3404 = uint(int(uint(_3402) >> uint(2)));
    int _3406 = _3402 & 3;
    float _3408 = (*spvDescriptorSet0.vp_c15)._m0[int(_3404)][_3406];
    int _3410 = _3390 + 56;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    uint _3414 = uint(int(uint(int(_3412)) >> uint(2)));
    int _3416 = int(_3412) & 3;
    float _3418 = (*spvDescriptorSet0.vp_c15)._m0[int(_3414)][_3416];
    int _3420 = int(_3412) + 1;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    int _3424 = _3420 & 3;
    float _3426 = (*spvDescriptorSet0.vp_c15)._m0[int(_3422)][_3424];
    int _3428 = _3390 + 64;
    uint _3430 = uint(int(uint(_3428) >> uint(2)));
    uint _3432 = uint(int(uint(int(_3430)) >> uint(2)));
    int _3434 = int(_3430) & 3;
    float _3436 = (*spvDescriptorSet0.vp_c15)._m0[int(_3432)][_3434];
    int _3438 = int(_3430) + 1;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    int _3442 = _3438 & 3;
    float _3444 = (*spvDescriptorSet0.vp_c15)._m0[int(_3440)][_3442];
    int _3446 = _3390 + 72;
    uint _3448 = uint(int(uint(_3446) >> uint(2)));
    uint _3450 = uint(int(uint(int(_3448)) >> uint(2)));
    int _3452 = int(_3448) & 3;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[int(_3450)][_3452];
    int _3456 = int(_3448) + 1;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    int _3460 = _3456 & 3;
    float _3462 = (*spvDescriptorSet0.vp_c15)._m0[int(_3458)][_3460];
    int _3464 = _3390 + 96;
    uint _3466 = uint(int(uint(_3464) >> uint(2)));
    uint _3468 = uint(int(uint(int(_3466)) >> uint(2)));
    int _3470 = int(_3466) & 3;
    float _3472 = (*spvDescriptorSet0.vp_c15)._m0[int(_3468)][_3470];
    int _3474 = int(_3466) + 1;
    uint _3476 = uint(int(uint(_3474) >> uint(2)));
    int _3478 = _3474 & 3;
    float _3480 = (*spvDescriptorSet0.vp_c15)._m0[int(_3476)][_3478];
    int _3482 = _3390 + 104;
    uint _3484 = uint(int(uint(_3482) >> uint(2)));
    uint _3486 = uint(int(uint(int(_3484)) >> uint(2)));
    int _3488 = int(_3484) & 3;
    float _3490 = (*spvDescriptorSet0.vp_c15)._m0[int(_3486)][_3488];
    int _3492 = int(_3484) + 1;
    uint _3494 = uint(int(uint(_3492) >> uint(2)));
    int _3496 = _3492 & 3;
    float _3498 = (*spvDescriptorSet0.vp_c15)._m0[int(_3494)][_3496];
    bool _3500 = !_3388;
    int _3502 = as_type<int>(_3480);
    float _3504 = _3454;
    float _3506 = _3462;
    if (!_3500)
    {
        float _3508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3512 = _3342 + _3510;
        float _3514 = rsqrt(_3338);
        float _3516 = _3512 * _3508;
        float _3518 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3520 = _3516 * 0.15915493667125701904296875;
        float _3522 = _3520 * 6.283185482025146484375;
        float _3524 = cos(_3522);
        float _3526 = _3520 * 6.283185482025146484375;
        float _3528 = sin(_3526);
        float _3530 = _3524 + (-1.0);
        float _3532 = fma(_3528, _3518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3534 = _3530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3536 = _3514 * _3532;
        float _3538 = fma(_3524, _3258, _3534);
        float _3540 = fma(_3286, _3536, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3542 = fma(_3298, _3536, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3372 = _3538;
        _3374 = _3540;
        _3376 = _3542;
    }
    float _3544 = _3372;
    float _3546 = _3374;
    float _3548 = _3376;
    float _3550 = -_3076;
    float _3552 = _3550 + _3544;
    int _3554 = _3390 + 80;
    uint _3556 = uint(int(uint(_3554) >> uint(2)));
    uint _3558 = uint(int(uint(int(_3556)) >> uint(2)));
    int _3560 = int(_3556) & 3;
    float _3562 = (*spvDescriptorSet0.vp_c15)._m0[int(_3558)][_3560];
    int _3564 = int(_3556) + 1;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    int _3568 = _3564 & 3;
    float _3570 = (*spvDescriptorSet0.vp_c15)._m0[int(_3566)][_3568];
    float _3572 = -_3066;
    float _3574 = _3572 + _3546;
    int _3576 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3578 = _3356 + _3576;
    int _3580 = _3578 + 1;
    float _3582 = _3552 * _3552;
    float _3584 = -_3068;
    float _3586 = _3584 + _3548;
    bool _3588 = _3350 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3590 = fma(_3574, _3574, _3582);
    int _3592 = _3350 | _3580;
    float _3594 = _3290 * _3480;
    bool _3596 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3598 = isnan(0.5);
    bool _3600 = _3596 || _3598;
    bool _3602 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3604 = _3600 || _3602;
    float _3606 = fma(_3586, _3586, _3590);
    bool _3608 = _3592 < 0;
    bool _3610 = _3608 || _3588;
    float _3612 = fma(_3066, _3472, _3594);
    float _3614 = _3290 * _3408;
    float _3616 = sqrt(_3606);
    bool _3618 = _3580 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3620 = _3618 || _3610;
    float _3622 = fma(_3068, _3490, _3612);
    float _3624 = fma(_3066, _3400, _3614);
    float _3626 = _3622 + _3498;
    float _3628 = _3290 * _3444;
    float _3630 = fma(_3068, _3418, _3624);
    float _3632 = 1.0 / _3626;
    float _3634 = fma(_3066, _3436, _3628);
    int _3636 = as_type<int>(_3614);
    int _3638 = as_type<int>(_3628);
    float _3640 = _3544;
    float _3642 = _3548;
    float _3644 = _3546;
    if (!_3620)
    {
        int _3646 = _3580 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3648 = _3646 + _3350;
        _3378 = _3648;
    }
    int _3650 = _3378;
    bool _3652 = _3616 > 0.0;
    float _3654 = _3612;
    float _3656 = _3616;
    if (!_3620)
    {
        float _3658 = floor(_3320);
        _3654 = _3658;
    }
    float _3660 = _3654;
    if (!_3620)
    {
        int _3662 = _3650 << 2;
        _3502 = _3662;
    }
    int _3664 = _3502;
    int _3666 = _3664;
    if (!_3620)
    {
        uint _3668 = uint(int(uint(_3650) >> uint(2)));
        _3636 = int(_3668);
    }
    int _3670 = _3636;
    if (!_3620)
    {
        int _3672 = 12 & _3664;
        _3666 = _3672;
    }
    int _3674 = _3666;
    if (!_3620)
    {
        int _3676 = _3670 << 4;
        int _3678 = _3676 + _3674;
        _3638 = _3678;
    }
    int _3680 = _3638;
    float _3682 = fma(_3068, _3454, _3634);
    if (!_3652)
    {
        _3504 = _3546;
    }
    float _3684 = _3504;
    bool _3686 = !_3652;
    float _3688 = _3684;
    float _3690 = _3660;
    if (!_3686)
    {
        float _3692 = _315 * _315;
        float _3694 = rsqrt(_3606);
        float _3696 = fma(_275, _275, _3692);
        float _3698 = fma(_317, _317, _3696);
        float _3700 = sqrt(_3698);
        float _3702 = _3574 * _3694;
        float _3704 = _3552 * _3694;
        float _3706 = _3586 * _3694;
        bool _3708 = _3700 > 0.0;
        float _3710 = _3700;
        if (!_3708)
        {
            _3710 = _3546;
        }
        float _3712 = _3710;
        bool _3714 = !_3708;
        _3688 = _3712;
        if (!_3714)
        {
            float _3716 = rsqrt(_3698);
            float _3718 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3720 = _315 * _3716;
            float _3722 = _275 * _3716;
            float _3724 = _3704 * _3720;
            float _3726 = _317 * _3716;
            float _3728 = fma(_3702, _3722, _3724);
            float _3730 = _3718 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3732 = fma(_3706, _3726, _3728);
            float _3734 = _3732 * _3730;
            float _3736 = fma(_275, _3734, _3546);
            float _3738 = fma(_315, _3734, _3544);
            float _3740 = fma(_317, _3734, _3548);
            _3640 = _3738;
            _3642 = _3740;
            _3688 = _3736;
        }
    }
    float _3742 = _3640;
    float _3744 = _3642;
    float _3746 = _3688;
    float _3748 = _3682 + _3462;
    float _3750 = _3630 + _3426;
    float _3752 = _3746;
    if (_3604)
    {
        _3506 = _3742;
    }
    float _3754 = _3506;
    float _3756 = _3754;
    if (_3604)
    {
        _3644 = _3744;
    }
    float _3758 = _3644;
    float _3760 = _3758;
    if (!_3604)
    {
        float _3762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3764 = _3076 + _3762;
        float _3766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3768 = _3066 + _3766;
        float _3770 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3772 = -_3066;
        float _3774 = _3772 + _3746;
        float _3776 = _3764 * _3764;
        float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3780 = _3068 + _3778;
        float _3782 = -_3068;
        float _3784 = _3782 + _3744;
        float _3786 = fma(_3768, _3768, _3776);
        float _3788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3790 = fma(_3780, _3780, _3786);
        float _3792 = sqrt(_3790);
        float _3794 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3796 = precise::min(_3792, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3798 = _3796 * _3788;
        float _3800 = _3794 * _3798;
        float _3802 = -_3076;
        float _3804 = _3802 + _3742;
        float _3806 = fma(_3774, _3800, _3066);
        float _3808 = fma(_3804, _3800, _3076);
        float _3810 = fma(_3784, _3800, _3068);
        _3756 = _3808;
        _3752 = _3806;
        _3760 = _3810;
    }
    float _3812 = _3756;
    float _3814 = _3752;
    float _3816 = _3760;
    float _3818 = _3750 * _3632;
    int _3820 = _3390 + 88;
    uint _3822 = uint(int(uint(_3820) >> uint(2)));
    uint _3824 = uint(int(uint(int(_3822)) >> uint(2)));
    int _3826 = int(_3822) & 3;
    float _3828 = (*spvDescriptorSet0.vp_c15)._m0[int(_3824)][_3826];
    int _3830 = int(_3822) + 1;
    uint _3832 = uint(int(uint(_3830) >> uint(2)));
    int _3834 = _3830 & 3;
    float _3836 = (*spvDescriptorSet0.vp_c15)._m0[int(_3832)][_3834];
    float _3838 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3840 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3842 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3844 = _3818 >= 0.0;
    float _3846 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3838);
    float _3848 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3840);
    float _3850 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3852 = _3750;
    if (!_3620)
    {
        int _3854 = _3680 + 400;
        uint _3856 = uint(int(uint(_3854) >> uint(2)));
        uint _3858 = uint(int(uint(int(_3856)) >> uint(2)));
        int _3860 = int(_3856) & 3;
        float _3862 = (*spvDescriptorSet0.vp_c15)._m0[int(_3858)][_3860];
        _3852 = _3862;
    }
    float _3864 = _3852;
    float _3866 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3846);
    float _3868 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3842);
    float _3870 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3848);
    float _3872 = _3748 * _3632;
    float _3874 = _3866 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3876 = _3818 <= 1.0;
    bool _3878 = _3876 && _3844;
    float _3880 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3850);
    float _3882 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3868);
    float _3884 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3886 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3888 = _3872 >= 0.0;
    bool _3890 = _3888 && _3878;
    float _3892 = _3882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3894 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3880);
    float _3896 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3886);
    bool _3898 = _3872 <= 1.0;
    bool _3900 = _3898 && _3890;
    float _3902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3904 = _3892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3906 = _3894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3908 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3896);
    float _3910 = _3682;
    float _3912 = _3894;
    if (!_3620)
    {
        float _3914 = floor(_3344);
        _3910 = _3914;
    }
    float _3916 = _3910;
    float _3918 = -_3904;
    float _3920 = fma(_3918, _3902, 1.0);
    float _3922 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3924 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3908);
    float _3926 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3928 = _3290 * _3570;
    float _3930 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3922);
    float _3932 = log2(_3920);
    float _3934 = _3928;
    if (_3900)
    {
        float _3936 = float(_3386);
        _3912 = _3936;
    }
    float _3938 = _3912;
    float _3940 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3926);
    float _3942 = fma(_3066, _3562, _3928);
    float _3944 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3930);
    float _3946 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3940);
    float _3948 = 1.0 / _3924;
    float _3950 = _3946;
    if (!_3620)
    {
        float _3952 = -_3916;
        float _3954 = _3344 + _3952;
        _3656 = _3954;
    }
    float _3956 = _3656;
    float _3958 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3944);
    float _3960 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3946);
    float _3962 = fma(_3068, _3828, _3942);
    if (!_3620)
    {
        float _3964 = -_3660;
        float _3966 = _3320 + _3964;
        _3950 = _3966;
    }
    float _3968 = _3950;
    float _3970 = _3922;
    if (_3900)
    {
        float _3972 = rint(_3938);
        float _3974 = precise::max(_3972, 0.0);
        uint _3976 = uint(_3974);
        uint _3978 = clamp(_3976, 0u, 65535u);
        _3970 = as_type<float>(_3978);
    }
    float _3980 = _3970;
    float _3982 = _3962 + _3836;
    float _3984 = _3932 * 0.693147182464599609375;
    float _3986 = _3982 * _3632;
    float _3988 = _3984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3990 = _3864;
    float _3992 = _3988;
    if (!_3620)
    {
        float _3994 = rint(_3864);
        float _3996 = precise::max(_3994, 0.0);
        uint _3998 = uint(_3996);
        uint _4000 = clamp(_3998, 0u, 65535u);
        _3990 = as_type<float>(_4000);
    }
    float _4002 = _3990;
    float _4004 = _3958 * _3948;
    float _4006 = _3960 * _3948;
    float _4008 = fma(_4004, 0.5, 0.5);
    float _4010 = fma(_4006, -0.5, 0.5);
    float _4012 = _3872;
    if (_3900)
    {
        float3 _10892 = float3(_3818, _3872, float(as_type<int>(_3980)));
        float3 _10896 = select(_10892, float3(0.0), isnan(_10892));
        float _4014 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10896.xy, uint(rint(_10896.z)), _3986, level(0.0));
        _4012 = _4014;
    }
    float _4016 = _4012;
    float3 _10906 = float3(_4008, _4010, _3988);
    float _4018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10906, float3(0.0), isnan(_10906)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10906, float3(0.0), isnan(_10906)), level(0.0)).x;
    float3 _10915 = float3(_4008, _4010, _3988);
    float4 _4021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10915, float3(0.0), isnan(_10915)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10915, float3(0.0), isnan(_10915)), level(0.0)).xyzw;
    float _4023 = _4021.x;
    float _4025 = _4021.y;
    float _4027 = _4021.z;
    float _4029 = _4021.w;
    float _4031 = _3956;
    if (!_3620)
    {
        float3 _10938 = float3(_3968, _3956, float(as_type<int>(_4002)));
        float3 _10940 = select(_10938, float3(0.0), isnan(_10938));
        float _4033 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10940.xy, uint(rint(_10940.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10940.xy, uint(rint(_10940.z)), level(0.0)).x;
        _4031 = _4033;
    }
    float _4035 = _4031;
    if (_3620)
    {
        _3690 = 1.0;
    }
    float _4037 = _3690;
    float _4039 = _4037;
    if (!_3620)
    {
        int _4041 = _3650 << 4;
        int _4043 = _4041 + 2048;
        uint _4045 = uint(int(uint(_4043) >> uint(2)));
        uint _4047 = uint(int(uint(int(_4045)) >> uint(2)));
        int _4049 = int(_4045) & 3;
        float _4051 = (*spvDescriptorSet0.vp_c15)._m0[int(_4047)][_4049];
        int _4053 = int(_4045) + 1;
        uint _4055 = uint(int(uint(_4053) >> uint(2)));
        int _4057 = _4053 & 3;
        float _4059 = (*spvDescriptorSet0.vp_c15)._m0[int(_4055)][_4057];
        int _4061 = _4043 + 8;
        uint _4063 = uint(int(uint(_4061) >> uint(2)));
        uint _4065 = uint(int(uint(int(_4063)) >> uint(2)));
        int _4067 = int(_4063) & 3;
        float _4069 = (*spvDescriptorSet0.vp_c15)._m0[int(_4065)][_4067];
        int _4071 = int(_4063) + 1;
        uint _4073 = uint(int(uint(_4071) >> uint(2)));
        int _4075 = _4071 & 3;
        float _4077 = (*spvDescriptorSet0.vp_c15)._m0[int(_4073)][_4075];
        float _4079 = _3290 * _4059;
        float _4081 = fma(_3066, _4051, _4079);
        float _4083 = fma(_3068, _4069, _4081);
        float _4085 = _4083 + _4077;
        float _4087 = precise::clamp(_4085, 0.0, 1.0);
        float _4089 = -_4087;
        float _4091 = _4089 + _4035;
        float _4093 = fma(_4091, 500.0, 1.5);
        float _4095 = exp2(_4093);
        float _4097 = 0.0 + _4095;
        float _4099 = precise::clamp(_4097, 0.0, 1.0);
        _4039 = _4099;
    }
    float _4101 = _4039;
    float _4103 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4105 = _3812 + _4103;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4109 = _3814 + _4107;
    float _4111 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4113 = _3816 + _4111;
    float _4115 = _4105 * _4105;
    float _4117 = fma(_4109, _4109, _4115);
    float _4119 = fma(_4113, _4113, _4117);
    float _4121 = rsqrt(_4119);
    float _4123 = sqrt(_4119);
    float _4125 = _4121 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4127 = _4109 * _4125;
    float _4129 = _4113 * _4125;
    float _4131 = _4127 * _4127;
    float _4133 = _4129 * _4129;
    float _4135 = _4131 + _4133;
    float _4137 = sqrt(_4135);
    bool _4139 = _4137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4143 = _4137 + _4141;
    float _4145 = _4010;
    float _4147 = _4143;
    float _4149 = _4105;
    float _4151 = _4127;
    float _4153 = _4131;
    float _4155 = _4133;
    if (_4139)
    {
        float _4157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4145 = _4157;
    }
    float _4159 = _4145;
    if (_4139)
    {
        float _4161 = rsqrt(_4135);
        _3934 = _4161;
    }
    float _4163 = _3934;
    float _4165 = _4163;
    if (_4139)
    {
        float _4167 = _4143 * _4159;
        _4147 = _4167;
    }
    float _4169 = _4147;
    if (_4139)
    {
        float _4171 = _4169 * 0.15915493667125701904296875;
        _3992 = _4171;
    }
    float _4173 = _3992;
    float _4175 = _4035;
    if (_4139)
    {
        float _4177 = _4173 * 6.283185482025146484375;
        float _4179 = sin(_4177);
        _4175 = _4179;
    }
    float _4181 = _4175;
    float _4183 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4185 = precise::max(0.0, _4183);
    float _4187 = _4159;
    float _4189 = _4185;
    if (_4139)
    {
        float _4191 = _4173 * 6.283185482025146484375;
        float _4193 = cos(_4191);
        _4187 = _4193;
    }
    float _4195 = _4187;
    float _4197 = -_4125;
    float _4199 = -_4185;
    float _4201 = fma(_4105, _4197, _4199);
    if (_4139)
    {
        float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4189 = _4203;
    }
    float _4205 = _4189;
    float _4207 = _4181;
    float _4209 = _4205;
    if (_4139)
    {
        float _4211 = fma(_4181, _4205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4207 = _4211;
    }
    float _4213 = _4207;
    float _4215 = _4213;
    if (!_4139)
    {
        _4209 = _4201;
    }
    float _4217 = _4209;
    float _4219 = _4217;
    if (_4139)
    {
        float _4221 = _4195 + (-1.0);
        _4149 = _4221;
    }
    float _4223 = _4149;
    float _4225 = _4223;
    if (_4139)
    {
        float _4227 = _4163 * _4213;
        _4215 = _4227;
    }
    float _4229 = _4215;
    if (_4139)
    {
        float _4231 = _4223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4165 = _4231;
    }
    float _4233 = _4165;
    if (_4139)
    {
        float _4235 = _4127 * _4229;
        _4151 = _4235;
    }
    float _4237 = _4151;
    if (!_4139)
    {
        _4225 = _4129;
    }
    float _4239 = _4225;
    float _4241 = _4239;
    if (_4139)
    {
        float _4243 = _4129 * _4229;
        _4241 = _4243;
    }
    float _4245 = _4241;
    if (_4139)
    {
        float _4247 = fma(_4201, _4195, _4233);
        _4219 = _4247;
    }
    float _4249 = _4219;
    if (_4139)
    {
        float _4251 = _4237 * _4237;
        _4153 = _4251;
    }
    float _4253 = _4153;
    if (_4139)
    {
        float _4255 = _4245 * _4245;
        _4155 = _4255;
    }
    float _4257 = _4155;
    float _4259 = fma(_4249, _4249, _4253);
    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4263 = fma(_4123, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4261);
    float _4265 = precise::clamp(_4263, 0.0, 1.0);
    float _4267 = _4259 + _4257;
    float _4269 = -_4265;
    float _4271 = _4269 + 1.0;
    float _4273 = rsqrt(_4267);
    float _4275 = abs(_4271);
    float _4277 = log2(_4275);
    float _4279 = _4273 * _4237;
    float _4281 = _4273 * _4249;
    float _4283 = _4273 * _4245;
    float _4285 = _4279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4287 = -_4285;
    float _4289 = fma(_4281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4287);
    float _4291 = _4277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4293 = -_4283;
    float _4295 = fma(_4293, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4289);
    float _4297 = exp2(_4291);
    float _4299 = fma(_4295, -0.5, 0.5);
    float _4301 = fma(_4295, 0.5, 0.5);
    float _4303 = _4281 + 1.0;
    float _4305 = fma(_4301, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4307 = sqrt(_4299);
    float _4309 = fma(_4301, _4305, -0.212114393711090087890625);
    float _4311 = -_4281;
    float _4313 = fma(_4297, _4303, _4311);
    float _4315 = fma(_4301, _4309, 1.570728778839111328125);
    float _4317 = fma(_4313, 0.5, 0.5);
    float _4319 = _4307 * 0.636619746685028076171875;
    float _4321 = -_4315;
    float _4323 = fma(_4319, _4321, 1.0);
    float2 _11389 = float2(_4323, _4317);
    float3 _4327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11389, float2(0.0), isnan(_11389)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11389, float2(0.0), isnan(_11389)), level(0.0)).xyz;
    float _4329 = _4327.x;
    float _4331 = _4327.y;
    float _4333 = _4327.z;
    float _4335 = abs(_3360);
    float _4337 = log2(_4335);
    float _4339 = _3260 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4341 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4343 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4345 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4347 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4341);
    float _4349 = -_3278;
    float _4351 = _4349 + 1.0;
    float _4353 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4343);
    float _4355 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4345);
    float _4357 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4347);
    out.m_94.y = 1.0;
    float _4359 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4353);
    float _4361 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4355);
    float _4363 = _4357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4365 = _4337 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4367 = _327 * _4339;
    float _4369 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4371 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4373 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4375 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4377 = exp2(_4365);
    float _4379 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4371);
    float _4381 = _4359 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4383 = -_315;
    float _4385 = _4383 + _3812;
    float _4387 = -_275;
    float _4389 = _4387 + _3814;
    float _4391 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4379);
    float _4393 = -_317;
    float _4395 = _4393 + _3816;
    out.m_96.x = _3814;
    out.m_96.y = _3812;
    out.m_96.z = _3816;
    float _4397 = fma(_4377, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4399 = precise::clamp(_4397, 0.0, 1.0);
    float _4401 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4369);
    float _4403 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _4405 = fma(_4399, -2.0, 3.0);
    float _4407 = _4399 * _4399;
    float _4409 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4401);
    float _4411 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4413 = _4407 * _4405;
    float _4415 = _4409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4417 = -_4413;
    float _4419 = _4417 + 1.0;
    float _4421 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4375);
    float _4423 = fma(_4419, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4413);
    float _4425 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4427 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4425);
    float _4429 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4373);
    bool _4431 = _3360 <= 8000.0;
    bool _4433 = isnan(_3360);
    bool _4435 = _4431 || _4433;
    bool _4437 = isnan(8000.0);
    bool _4439 = _4435 || _4437;
    float _4441 = float(_4439);
    float _4443 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4391);
    float _4445 = _4277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4447 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4411);
    float _4449 = _4441 * _4423;
    float _4451 = _4361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4453 = _4403 + _4447;
    float _4455 = exp2(_4445);
    float _4457 = _4443 + _3924;
    float _4459 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4453);
    float _4461 = _4457 * 0.5;
    float _4463 = _4457;
    float _4465 = _4367;
    if (!_3900)
    {
        _4463 = 1.0;
    }
    float _4467 = _4463;
    out.gl_Position.x = _3958;
    out.gl_Position.y = _3960;
    out.gl_Position.z = _4443;
    out.gl_Position.w = _3924;
    float _4469 = 1.0 / _4459;
    float _4471 = _4467;
    if (_3900)
    {
        bool _4473 = _4016 >= _3986;
        bool _4475 = isnan(_4016);
        bool _4477 = _4473 || _4475;
        bool _4479 = isnan(_3986);
        bool _4481 = _4477 || _4479;
        float _4483 = float(_4481);
        _4471 = _4483;
    }
    float _4485 = _4471;
    float _4487 = _4449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4489 = fma(_4381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4421);
    out.m_98.z = _4461;
    out.m_98.w = _3924;
    float _4491 = _4351 * _4487;
    float _4493 = precise::clamp(_4491, 0.0, 1.0);
    float _4495 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4489);
    float _4497 = -_4455;
    float _4499 = _4497 + 1.0;
    float _4501 = _4485 * _4101;
    float _4503 = -_4493;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4507 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _4509 = _4499 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4511 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _4513 = -_4501;
    float _4515 = fma(_4513, _4505, 1.0);
    float _4517 = precise::clamp(_4515, 0.0, 1.0);
    float _4519 = _4507 + _4427;
    float _4521 = _4509 * _4018;
    float _4523 = _4511 + _4429;
    float _4525 = _4495 * _4469;
    float _4527 = -_4509;
    float _4529 = _4527 + 1.0;
    float _4531 = _4029 * _4521;
    float _4533 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4523);
    float _4535 = _4517 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _4537 = _4525 > 0.0;
    float _4539 = _4029 * _4529;
    float _4541 = _4533 * _4469;
    float _4543 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4519);
    bool _4545 = _4525 < 1.0;
    bool _4547 = _4545 && _4537;
    out.m_94.x = _4535;
    float _4549 = _4543 * _4469;
    bool _4551 = _4004 > (-1.0);
    bool _4553 = _4551 && _4547;
    bool _4555 = _4006 > (-1.0);
    bool _4557 = _4555 && _4553;
    bool _4559 = _4004 < 1.0;
    bool _4561 = _4559 && _4557;
    bool _4563 = _4006 < 1.0;
    bool _4565 = _4563 && _4561;
    float _4567 = fma(_4329, _4531, _4023);
    float _4569 = fma(_4331, _4531, _4025);
    float _4571 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _4573 = _4333 * _4521;
    float _4575 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[638].x, _4571);
    float _4577 = fma(_4029, _4573, _4027);
    float _4579 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[638].z, _4575);
    out.m_100.x = _4567;
    out.m_100.y = _4569;
    out.m_100.z = _4577;
    out.m_100.w = _4539;
    float _4581 = _4579 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _4583 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _4585 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _4587 = 1.0 / _4581;
    float _4589 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[635].x, _4583);
    float _4591 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[636].x, _4585);
    float _4593 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[635].z, _4589);
    float _4595 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[636].z, _4591);
    float _4597 = _4593 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _4599 = _4595 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _4601 = _4597 * _4587;
    float _4603 = _4599 * _4587;
    bool _4605 = !_4565;
    float _4607 = _4597;
    float _4637;
    if (!_4605)
    {
        float _4609 = -_4541;
        float _4611 = _4006 + _4609;
        float _4613 = -_4549;
        float _4615 = _4004 + _4613;
        float _4617 = -_4601;
        float _4619 = _4004 + _4617;
        float _4621 = -_4603;
        float _4623 = _4006 + _4621;
        float _4625 = _4611 * _4611;
        float _4627 = fma(_4615, _4615, _4625);
        float _4629 = sqrt(_4627);
        bool _4631 = _4629 > 0.0;
        _3380 = _4629;
        if (!_4631)
        {
            _4607 = _4367;
        }
        float _4633 = _4607;
        bool _4635 = !_4631;
        _4637 = _4633;
        _4639 = _4635;
        if (!_4639)
        {
            float _4641 = _4623 * _4623;
            float _4643 = fma(_4619, _4619, _4641);
            float _4645 = rsqrt(_4627);
            float _4647 = sqrt(_4643);
            float _4649 = _4615 * _4645;
            float _4651 = _4611 * _4645;
            bool _4653 = _4647 > 0.0;
            float _4655 = _4647;
            _3380 = _4645;
            if (!_4653)
            {
                _4655 = _4367;
            }
            float _4657 = _4655;
            bool _4659 = !_4653;
            _4637 = _4657;
            _4639 = _4659;
            if (!_4639)
            {
                float _4661 = _2458 * _4451;
                float _4663 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _4665 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4403);
                float _4667 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4511);
                float _4669 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4507);
                float _4671 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4665);
                float _4673 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4667);
                float _4675 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4669);
                float _4677 = rsqrt(_4643);
                float _4679 = _4663 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4681 = 1.0 / _4671;
                float _4683 = _4623 * _4679;
                float _4685 = _4619 * _4679;
                float _4687 = _4683 * _4683;
                float _4689 = fma(_4685, _4685, _4687);
                float _4691 = _4673 * _4681;
                float _4693 = _4675 * _4681;
                float _4695 = sqrt(_4689);
                float _4697 = _4691 * _4691;
                float _4699 = fma(_4693, _4693, _4697);
                float _4701 = _4623 * _4677;
                float _4703 = _4619 * _4677;
                float _4705 = _4651 * _4701;
                float _4707 = sqrt(_4699);
                float _4709 = fma(_4649, _4703, _4705);
                float _4711 = precise::min(0.0, _4709);
                float _4713 = _3924 * _4711;
                float _4715 = fma(_4695, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4707);
                float _4717 = fma(_4685, _4713, _3958);
                float _4719 = fma(_4683, _4713, _3960);
                float _4721 = 1.0 / _4715;
                out.gl_Position.x = _4717;
                out.gl_Position.y = _4719;
                float _4723 = _4707 * _4721;
                out.m_94.y = _4723;
                _3104 = _4713;
                _4637 = _4367;
                _3380 = _4705;
                _4639 = true;
            }
        }
    }
    else
    {
        float _4725 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4725;
        _4637 = 0.0;
    }
    _4639 = false;
    float _4727 = _3104;
    float _4729 = _4637;
    float _4731 = _3380;
    bool _4733 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4735 = isnan(_4123);
    bool _4737 = _4733 || _4735;
    bool _4739 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4741 = _4737 || _4739;
    float _4743 = _4731;
    float _4745 = _4727;
    if (!_4741)
    {
        _4743 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4747 = _4743;
    float _4749 = _4747;
    float _4751 = _4747;
    if (!_4741)
    {
        _4745 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4753 = _4745;
    float _4755 = _4753;
    float _4757 = _4753;
    if (!_4741)
    {
        _4465 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4759 = _4465;
    bool _4761 = !_4741;
    float _4763 = _4759;
    float _4765 = _4759;
    if (!_4761)
    {
        bool _4767 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4769 = isnan(_4123);
        bool _4771 = _4767 || _4769;
        bool _4773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4775 = _4771 || _4773;
        if (!_4775)
        {
            float _4777 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4779 = _4123 + _4777;
            float _4781 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4783 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4781;
            float _4785 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4787 = _4785 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4789 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4791 = _4789 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4793 = 1.0 / _4783;
            float _4795 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4797 = _4795 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4799 = _4779 * _4793;
            float _4801 = precise::clamp(_4799, 0.0, 1.0);
            float _4803 = fma(_4801, _4787, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4805 = fma(_4801, _4791, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4807 = fma(_4801, _4797, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4757 = _4805;
            _4751 = _4803;
            _4765 = _4807;
            _4809 = true;
        }
        else
        {
            bool _4811 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4813 = isnan(_4123);
            bool _4815 = _4811 || _4813;
            bool _4817 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4819 = _4815 || _4817;
            if (!_4819)
            {
                _4749 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4821 = _4749;
            _4751 = _4821;
            if (!_4819)
            {
                _4755 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4823 = _4755;
            _4757 = _4823;
            if (!_4819)
            {
                _4763 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4825 = _4763;
            bool _4827 = !_4819;
            _4765 = _4825;
            if (!_4827)
            {
                bool _4829 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4831 = isnan(_4123);
                bool _4833 = _4829 || _4831;
                bool _4835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4837 = _4833 || _4835;
                if (!_4837)
                {
                    float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4841 = _4123 + _4839;
                    float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4843;
                    float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4855 = 1.0 / _4845;
                    float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4859 = _4857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4861 = _4841 * _4855;
                    float _4863 = precise::clamp(_4861, 0.0, 1.0);
                    float _4865 = fma(_4863, _4849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4867 = fma(_4863, _4853, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4869 = fma(_4863, _4859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4757 = _4867;
                    _4751 = _4865;
                    _4765 = _4869;
                    _4809 = true;
                }
                else
                {
                    _4757 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4751 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4765 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4809 = false;
    float _4871 = _4757;
    float _4873 = _4751;
    float _4875 = _4765;
    float _4877 = _4871 * 0.586610972881317138671875;
    bool _4879 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4881 = _4729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4883 = fma(_4873, 0.298911988735198974609375, _4877);
    out.m_102.x = 0.0;
    float _4885 = fma(_4875, 0.114477999508380889892578125, _4883);
    out.m_61.x = _4881;
    float _4887 = -_4885;
    float _4889 = _4887 + _4873;
    float _4891 = -_4885;
    float _4893 = _4891 + _4871;
    float _4895 = -_4885;
    float _4897 = _4895 + _4875;
    float _4899 = fma(_4889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    float _4901 = fma(_4893, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    float _4903 = fma(_4897, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    out.m_104.x = _4899;
    out.m_104.y = _4901;
    out.m_104.z = _4903;
    if (!_4879)
    {
        return out;
    }
    float _4905 = -_3812;
    float _4907 = _4905 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4909 = -_3814;
    float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4913 = -_3816;
    float _4915 = _4913 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4917 = _4907 * _4907;
    float _4919 = fma(_4911, _4911, _4917);
    float _4921 = fma(_4915, _4915, _4919);
    float _4923 = sqrt(_4921);
    float _4925 = rsqrt(_4921);
    float _4927 = -_4923;
    float _4929 = _4927 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4931 = _4929 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4933 = precise::clamp(_4931, 0.0, 1.0);
    float _4935 = _4911 * _4925;
    float _4937 = _4907 * _4925;
    float _4939 = abs(_4933);
    float _4941 = log2(_4939);
    float _4943 = _4915 * _4925;
    float _4945 = _4935 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4947 = _3020 * _4937;
    float _4949 = -_4937;
    float _4951 = -_4945;
    float _4953 = fma(_4949, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4951);
    float _4955 = fma(_2994, _4935, _4947);
    float _4957 = -_4943;
    float _4959 = fma(_4957, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4953);
    float _4961 = fma(_3022, _4943, _4955);
    float _4963 = precise::clamp(_4961, 0.0, 1.0);
    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4967 = _4959 + _4965;
    float _4969 = _4941 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4971 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4973 = precise::clamp(_4971, 0.0, 1.0);
    float _4975 = exp2(_4969);
    float _4977 = _4975 * _4973;
    float _4979 = _4963 * _4977;
    float _4981 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4983 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4985 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4981;
    out.m_102.y = _4983;
    out.m_102.z = _4985;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4809 = false;
    bool _4639 = false;
    bool _3122 = false;
    bool _3110 = false;
    bool _725 = false;
    bool _539 = false;
    bool _347 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _5042 = as_type<float>(_139);
        out.gl_Position.z = _5042;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5112 = as_type<float>(_177);
        out.gl_Position.z = _5112;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = in.m_65.x;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _183 = _157 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_70.x;
    float _189 = in.m_70.y;
    float _191 = in.m_70.z;
    float _193 = in.m_72.x;
    float _195 = in.m_72.y;
    float _197 = in.m_72.z;
    float _199 = in.m_74.x;
    float _201 = in.m_74.y;
    float _203 = in.m_74.z;
    float _205 = _183 * _181;
    float _207 = in.m_76.x;
    float _209 = in.m_76.y;
    float _211 = in.m_76.z;
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[20].x, _205);
    int _215 = as_type<int>(_185) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_185) & 2;
    bool _221 = _219 != 0;
    float _223 = _213 * 6.283185482025146484375;
    float _225 = floor(_213);
    float _227 = _223 * 0.15915493667125701904296875;
    bool _229 = !_221;
    float _231 = _229 ? (-0.5) : 0.5;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = _189 * _195;
    int _243 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _245 = _243 != 0;
    float _247 = _227 * 6.283185482025146484375;
    float _249 = cos(_247);
    float _251 = _189 * _201;
    bool _253 = !_235;
    int _255 = _253 ? 0 : 1;
    float _257 = fma(_187, _193, _241);
    bool _259 = !_245;
    int _261 = _259 ? 0 : 1;
    float _263 = _189 * _209;
    int _265 = abs(_255);
    float _267 = fma(_187, _199, _251);
    float _269 = -_225;
    float _271 = _213 + _269;
    float _273 = fma(_187, _207, _263);
    float _275 = fma(_191, _197, _257);
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _279 = -_271;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = float(_265);
    int _285 = abs(_261);
    float _287 = fma(_249, 0.5, 0.5);
    bool _289 = !_239;
    int _291 = _289 ? 0 : 1;
    float _293 = abs(_281);
    float _295 = _283 * _293;
    bool _297 = _271 < 0.5;
    float _299 = float(_297);
    float _301 = -_287;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_291);
    float _307 = float(_285);
    float _309 = -_299;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = float(_305);
    float _315 = fma(_191, _203, _267);
    float _317 = fma(_191, _211, _273);
    float _319 = fma(_307, _303, _295);
    bool _321 = !_217;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = abs(_311);
    float _327 = fma(_313, _325, _319);
    bool _329 = !_277;
    float _345;
    if (!_329)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_123);
        float _351 = 1.0 / _349;
        float _353 = _157 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _359 = _355 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = _355 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _355 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    bool _381 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _383 = isnan(_355);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = 1.0 / _375;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _397 = 1.0 / _371;
    float _399 = 1.0 / _379;
    float _401 = _367 * _393;
    bool _403 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_355);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _359 * _397;
    bool _417 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _419 = isnan(_355);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_391;
    float _431 = _429 + 1.0;
    float _433 = _427 * _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _439 = _363 * _399;
    bool _441 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _443 = isnan(_355);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_427;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _451 * _455;
    float _471 = -_451;
    float _473 = _471 + 1.0;
    float _475 = fma(_459, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = fma(_463, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = _413 * _473;
    float _481 = -_413;
    float _483 = _481 + 1.0;
    float _485 = fma(_437, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = _475 * _479;
    float _489 = _477 * _479;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _491;
    float _495 = fma(_467, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _487);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _489);
    float _505 = fma(_493, _439, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = fma(_485, _469, _497);
    float _509 = fma(_501, _439, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_495, _469, _503);
    float _513 = fma(_505, _433, _507);
    float _515 = fma(_509, _433, _511);
    float _517 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[146].x, _513);
    float _519 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[146].y, _515);
    bool _521 = !_395;
    float _537;
    if (!_521)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _179 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_123);
        float _543 = 1.0 / _541;
        float _545 = _157 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _547 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_547);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _555;
    float _591 = -_567;
    float _593 = _591 + 1.0;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    bool _599 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_547);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _587 * _593;
    float _613 = -_587;
    float _615 = _613 + 1.0;
    bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _619 = 1.0 / _571;
    float _621 = _609 * _615;
    float _623 = -_609;
    float _625 = _623 + 1.0;
    float _627 = 1.0 / _575;
    float _629 = _597 * _589;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _635 = fma(_629, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = _633 * _619;
    bool _639 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _641 = isnan(_547);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _657 = _547 + _655;
    float _659 = _635 * _621;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _547 + _661;
    float _665 = -_649;
    float _667 = _665 + 1.0;
    float _669 = fma(_637, _657, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _671 = _653 * _627;
    float _673 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _675 = _567 * _667;
    float _677 = fma(_671, _663, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _679 = fma(_669, _611, _673);
    float _681 = fma(_677, _675, _679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _687 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[118].x, _681);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _691 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = in.m_78.x;
    float _701 = in.m_78.y;
    out.m_80.x = _691;
    out.m_80.y = _693;
    out.m_80.z = _697;
    out.m_80.w = _695;
    float _703 = _519 * _701;
    float _705 = _517 * _699;
    bool _707 = !_617;
    float _723;
    if (!_707)
    {
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _711 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].w, _157);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        float _727 = float(_123);
        float _729 = 1.0 / _727;
        float _731 = _157 * _729;
        _723 = _731;
    }
    _725 = false;
    float _733 = _723;
    float _735 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _737 = int(_735);
    float _739 = in.m_72.w;
    bool _741 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _743 = isnan(_733);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _755 = _733 + _753;
    float _757 = _327 * _703;
    float _759 = -_751;
    float _761 = _759 + 1.0;
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _765 = int(_763);
    float _767 = float(_737);
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _771 = int(_769);
    float _773 = float(uint(_765));
    float _775 = 1.0 / _767;
    int _777 = ~_765;
    int _779 = _777 + 1;
    int _781 = ~_765;
    int _783 = _781 + 1;
    bool _785 = _765 == 0;
    int _787 = ~_765;
    int _789 = _787 + 1;
    float _791 = 1.0 / _773;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _795 = _793 != 0;
    float _797 = _775 * _157;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _801 = int(_799);
    int _803 = as_type<int>(_791) + (-2);
    float _805 = trunc(_797);
    int _807 = int(_805);
    float _809 = float(uint(_801));
    int _811 = ~_801;
    int _813 = _811 + 1;
    float _815 = 1.0 / _809;
    int _817 = ~_801;
    int _819 = _817 + 1;
    float _821 = float(uint(_807));
    float _823 = as_type<float>(_803) * _821;
    float _825 = trunc(_823);
    float _827 = precise::max(_825, 0.0);
    uint _830 = uint(_827);
    int _832 = as_type<int>(_815) + (-2);
    int _834 = _779 * int(_830);
    int _836 = _834 + _807;
    float _838 = float(uint(_836));
    float _840 = as_type<float>(_803) * _838;
    float _842 = float(_771);
    float _844 = as_type<float>(_771);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_795)
    {
        _844 = 1.0;
    }
    float _848 = _844;
    float _850 = 1.0 / _842;
    float _852 = _848;
    if (!_795)
    {
        _852 = 7.345489978790283203125;
    }
    float _854 = _852;
    float _856 = _854 * _179;
    float _858 = trunc(_840);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    float _864 = floor(_856);
    float _866 = _850 * _157;
    int _868 = int(_830) + int(_862);
    float _870 = trunc(_866);
    int _872 = int(_870);
    float _874 = float(_765);
    float _876 = float(_807);
    bool _878 = _876 >= _874;
    bool _880 = isnan(_876);
    bool _882 = _878 || _880;
    bool _884 = isnan(_874);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    int _890 = _783 * _868;
    int _892 = _890 + _807;
    float _894 = float(_123);
    float _896 = -_864;
    float _898 = _856 + _896;
    bool _900 = uint(_892) >= uint(_765);
    float _902 = trunc(_888);
    int _904 = int(_902);
    float _906 = _898 * _874;
    bool _908 = !_900;
    int _910 = _908 ? 0 : (-1);
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _914 = _912 != 0;
    int _916 = ~_868;
    int _918 = _916 + _910;
    int _920 = _918 + 1;
    float _922 = 1.0 / _894;
    bool _924 = !_914;
    int _926 = _924 ? 0 : 1;
    float _928 = float(uint(_872));
    int _930 = _765 * _920;
    int _932 = _930 + _807;
    int _934 = abs(_926);
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _938 = _936 != 0;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _942 = _940 != 0;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _946 = _944 != 0;
    float _948 = trunc(_906);
    int _950 = int(_948);
    int _952 = ~_904;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = as_type<float>(_832) * _928;
    bool _960 = !_785;
    int _962 = _960 ? _932 : (-1);
    int _964 = _765 + (-1);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _968 = _966 != 0;
    int _970 = _962 * _956;
    float _972 = _922 * _157;
    float _974 = trunc(_958);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    float _980 = float(_872);
    int _982 = _904 * _964;
    int _984 = _982 + _970;
    float _986 = _874 * _972;
    bool _988 = !_942;
    int _990 = _988 ? 0 : 1;
    int _992 = _950 * _934;
    int _994 = _992 + _807;
    int _996 = ~_801;
    int _998 = _996 + 1;
    float _1000 = trunc(_986);
    int _1002 = int(_1000);
    bool _1004 = !_938;
    int _1006 = _1004 ? 0 : 1;
    int _1008 = abs(_990);
    bool _1010 = !_946;
    int _1012 = _1010 ? 0 : 1;
    int _1014 = _998 * int(_978);
    int _1016 = _1014 + _872;
    int _1018 = abs(_1006);
    int _1020 = _984 * _1008;
    bool _1022 = !_968;
    int _1024 = _1022 ? 0 : 1;
    int _1026 = abs(_1012);
    float _1028 = float(uint(_1016));
    int _1030 = abs(_1024);
    int _1032 = _1002 * _1018;
    int _1034 = _1032 + _1020;
    float _1036 = as_type<float>(_832) * _1028;
    float _1038 = in.m_65.y;
    int _1040 = _994 * _1026;
    int _1042 = _1040 + _1034;
    float _1044 = trunc(_1036);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1052 = _1050 != 0;
    int _1054 = _950 * _1030;
    int _1056 = _1054 + _1042;
    bool _1058 = _801 == 0;
    float _1060 = float(uint(_1056));
    float _1062 = as_type<float>(_803) * _1060;
    float _1064 = float(_801);
    int _1066 = int(_978) + int(_1048);
    float _1068 = trunc(_1062);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = as_type<float>(_1048);
    if (_1052)
    {
        _1074 = _179;
    }
    float _1076 = _1074;
    float _1078 = _1076;
    if (_1052)
    {
        _846 = 1.0;
    }
    float _1080 = _846;
    int _1082 = _813 * _1066;
    int _1084 = _1082 + _872;
    float _1086 = _1080;
    if (!_1052)
    {
        _1078 = _1038;
    }
    float _1088 = _1078;
    float _1090 = _1038 + (-0.5);
    if (!_1052)
    {
        _1086 = 1.2345600128173828125;
    }
    float _1092 = _1086;
    bool _1094 = _980 >= _1064;
    bool _1096 = isnan(_980);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(_1064);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    int _1106 = ~_765;
    int _1108 = _1106 + 1;
    float _1110 = _1088 * _1092;
    bool _1112 = uint(_1084) >= uint(_801);
    float _1114 = trunc(_1104);
    int _1116 = int(_1114);
    int _1118 = _1108 * int(_1072);
    int _1120 = _1118 + _1056;
    bool _1122 = !_1112;
    int _1124 = _1122 ? 0 : (-1);
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1128 = _1126 != 0;
    float _1130 = float(uint(_1120));
    float _1132 = floor(_1110);
    int _1134 = ~_1066;
    int _1136 = _1134 + _1124;
    int _1138 = _1136 + 1;
    float _1140 = as_type<float>(_803) * _1130;
    bool _1142 = !_1128;
    int _1144 = _1142 ? 0 : 1;
    int _1146 = _801 * _1138;
    int _1148 = _1146 + _872;
    int _1150 = _801 + (-1);
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = ~_1116;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    bool _1164 = !_1058;
    int _1166 = _1164 ? _1148 : (-1);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1182 = _1180 != 0;
    bool _1184 = _765 == 0;
    float _1186 = -_1132;
    float _1188 = _1110 + _1186;
    int _1190 = _1166 * _1162;
    float _1192 = _1064 * _972;
    bool _1194 = !_1174;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = _1188 * _1064;
    float _1200 = float(uint(_994));
    int _1202 = _1116 * _1150;
    int _1204 = _1202 + _1190;
    int _1206 = abs(_1196);
    float _1208 = trunc(_1192);
    int _1210 = int(_1208);
    bool _1212 = !_1170;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = as_type<float>(_803) * _1200;
    int _1218 = int(_1072) + int(_1156);
    int _1220 = _1204 * _1206;
    int _1222 = ~_765;
    int _1224 = _1222 + 1;
    int _1226 = abs(_1214);
    float _1228 = trunc(_1198);
    int _1230 = int(_1228);
    int _1232 = abs(_1144);
    int _1234 = _1224 * _1218;
    int _1236 = _1234 + _1056;
    bool _1238 = !_1178;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = ~_765;
    int _1244 = _1242 + 1;
    int _1246 = abs(_1240);
    float _1248 = trunc(_1216);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    int _1254 = _1210 * _1226;
    int _1256 = _1254 + _1220;
    bool _1258 = uint(_1236) >= uint(_765);
    float _1260 = _179 * 2.0;
    bool _1262 = !_1258;
    int _1264 = _1262 ? 0 : (-1);
    int _1266 = _1230 * _1232;
    int _1268 = _1266 + _872;
    bool _1270 = !_1182;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = ~_1218;
    int _1276 = _1274 + _1264;
    int _1278 = _1276 + 1;
    int _1280 = _1268 * _1246;
    int _1282 = _1280 + _1256;
    int _1284 = abs(_1272);
    float _1286 = in.m_65.z;
    float _1288 = floor(_1260);
    int _1290 = _1244 * int(_1252);
    int _1292 = _1290 + _994;
    float _1294 = _1038 * 2.0;
    int _1296 = _1230 * _1284;
    int _1298 = _1296 + _1282;
    int _1300 = _765 * _1278;
    int _1302 = _1300 + _1056;
    float _1304 = float(uint(_1292));
    float _1306 = floor(_1294);
    bool _1308 = !_1184;
    int _1310 = _1308 ? _1302 : (-1);
    float _1312 = as_type<float>(_803) * _1304;
    float _1314 = float(uint(_1298));
    int _1316 = _1310 & 3;
    bool _1318 = _1316 != 0;
    float _1320 = trunc(_1312);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = as_type<float>(_832) * _1314;
    bool _1328 = uint(_1316) > 1u;
    int _1330 = _1310 & 3;
    bool _1332 = _1330 != 0;
    bool _1334 = uint(_1316) >= 2u;
    float _1336 = trunc(_1326);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = _1332 ? 0 : 1;
    bool _1344 = _1316 != 3;
    int _1346 = ~_1342;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _1350;
    float _1354 = as_type<float>(_1156);
    if (!_1328)
    {
        int _1356 = ~_1342;
        int _1358 = _1356 + 1;
        _1352 = _1358;
    }
    int _1360 = _1352;
    int _1362 = int(_1252) + int(_1324);
    int _1364 = _1334 ? 0 : 1;
    bool _1366 = _1288 > 0.0;
    int _1368 = _819 * int(_1340);
    int _1370 = _1368 + _1298;
    bool _1372 = _1288 >= 0.0;
    bool _1374 = isnan(_1288);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan(0.0);
    bool _1380 = _1376 || _1378;
    float _1382 = _1286 * 2.0;
    int _1384 = ~_1364;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    int _1390 = _1388;
    if (_1344)
    {
        int _1392 = ~_1364;
        int _1394 = _1392 + 1;
        _1390 = _1394;
    }
    int _1396 = _1390;
    float _1398 = float(uint(_1370));
    float _1400 = floor(_1382);
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1404 = _1402 != 0;
    int _1406 = _789 * _1362;
    int _1408 = _1406 + _994;
    int _1410 = _1380 ? 0 : 1;
    float _1412 = as_type<float>(_832) * _1398;
    bool _1414 = !_1404;
    int _1416 = _1414 ? 0 : 1;
    bool _1418 = _1306 > 0.0;
    float _1420 = trunc(_1412);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1410;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    bool _1432 = _1306 >= 0.0;
    bool _1434 = isnan(_1306);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    int _1442 = _1430;
    int _1444 = _1410;
    if (!_1366)
    {
        int _1446 = ~_1410;
        int _1448 = _1446 + 1;
        _1442 = _1448;
    }
    int _1450 = _1442;
    bool _1452 = uint(_1408) >= uint(_765);
    if (_1052)
    {
        _1444 = 0;
    }
    int _1454 = _1444;
    int _1456 = _1440 ? 0 : 1;
    int _1458 = _1454;
    if (!_1052)
    {
        _1458 = 1;
    }
    int _1460 = _1458;
    bool _1462 = !_1452;
    int _1464 = _1462 ? 0 : (-1);
    int _1466 = ~_1456;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1474 = _1472 != 0;
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1478 = _1476 != 0;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1482 = _1480 != 0;
    int _1484 = _1470;
    if (!_1418)
    {
        int _1486 = ~_1456;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    bool _1492 = _1400 > 0.0;
    bool _1494 = _1400 >= 0.0;
    bool _1496 = isnan(_1400);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    bool _1504 = _1460 != 1;
    int _1506 = ~_1362;
    int _1508 = _1506 + _1464;
    int _1510 = _1508 + 1;
    float _1512 = in.m_58.x;
    float _1514 = in.m_58.y;
    float _1516 = in.m_58.z;
    int _1518 = ~_801;
    int _1520 = _1518 + 1;
    int _1522 = int(_1340) + int(_1424);
    int _1524 = _765 * _1510;
    int _1526 = _1524 + _994;
    int _1528 = _1502 ? 0 : 1;
    int _1530 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1532 = _1530 != 0;
    int _1534 = _1520 * _1522;
    int _1536 = _1534 + _1298;
    bool _1538 = !_1478;
    int _1540 = _1538 ? 0 : 1;
    int _1542 = ~_1528;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = _1546;
    float _1550 = as_type<float>(_1536);
    if (!_1492)
    {
        int _1552 = ~_1528;
        int _1554 = _1552 + 1;
        _1548 = _1554;
    }
    int _1556 = _1548;
    bool _1558 = _765 == 0;
    bool _1560 = uint(_1536) >= uint(_801);
    if (!_1504)
    {
        _1354 = _1038;
    }
    float _1562 = _1354;
    float _1564 = 0.0;
    float _1566 = _1562;
    if (!_1504)
    {
        _1564 = _1038;
    }
    float _1568 = _1564;
    float _1570 = _1568;
    if (!_1504)
    {
        _1550 = _1286;
    }
    float _1572 = _1550;
    float _1574 = _209 * _1514;
    float _1576 = 0.0;
    float _1578 = _1572;
    if (!_1504)
    {
        _1576 = _1286;
    }
    float _1580 = _1576;
    float _1582 = _201 * _1514;
    bool _1584 = !_1558;
    int _1586 = _1584 ? _1526 : (-1);
    float _1588 = fma(_207, _1512, _1574);
    bool _1590 = !_1474;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = fma(_199, _1512, _1582);
    float _1596 = _1580;
    if (_1504)
    {
        _1566 = _179;
    }
    float _1598 = _1566;
    float _1600 = fma(_211, _1516, _1588);
    if (_1504)
    {
        _1570 = _179;
    }
    float _1602 = _1570;
    float _1604 = fma(_203, _1516, _1594);
    if (_1504)
    {
        _1578 = _1038;
    }
    float _1606 = _1578;
    float _1608 = in.m_76.w;
    if (_1504)
    {
        _1596 = _1038;
    }
    float _1610 = _1596;
    bool _1612 = !_1560;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1632 = _1630 != 0;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1642 = _195 * _1514;
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1652 = 1.0 / _1636;
    float _1654 = fma(_193, _1512, _1642);
    float _1656 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1658 = fma(_197, _1516, _1654);
    float _1660 = _179 + _1038;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1666 = 1.0 / _1640;
    float _1668 = _1658 + _739;
    float _1670 = float(_1450);
    float _1672 = _1600 + _1608;
    bool _1674 = !_1482;
    int _1676 = _1674 ? 0 : 1;
    float _1678 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1680 = _1668 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1682 = 1.0 / _1664;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1688 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1690 = abs(_1676);
    float _1692 = -_1684;
    float _1694 = fma(_1656, 2.0, _1692);
    float _1696 = fma(_1688, -2.0, _1686);
    float _1698 = _1660 + (-1.0);
    float _1700 = _1650 * _1652;
    float _1702 = _179 + _1286;
    float _1704 = in.m_74.w;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1706;
    float _1710 = _1286 + _1038;
    float _1712 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1714 = _1708 * _1682;
    float _1716 = _1702 + (-1.0);
    float _1718 = _1710 + (-1.0);
    bool _1720 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1722 = isnan(_733);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1646 * _1666;
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1740 = _733 + _1738;
    bool _1742 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1744 = isnan(_733);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1730;
    float _1756 = _1754 + 1.0;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1760 = _733 + _1758;
    float _1762 = fma(_1732, _1740, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1764 = fma(_1714, _755, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1766 = _1752 * _1756;
    float _1768 = fma(_1700, _1760, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1770 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1772 = isnan(_733);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = -_1752;
    float _1784 = _1782 + 1.0;
    float _1786 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1788 = log2(_1786);
    float _1790 = _1604 + _1704;
    float _1792 = _751 * _1784;
    int _1794 = abs(_1540);
    float _1796 = _1780 * _761;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1800 = _1762 * _1796;
    float _1802 = float(_1794);
    float _1804 = _1790 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1806 = -_1780;
    float _1808 = _1806 + 1.0;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1812 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1798);
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1816 = _1802 * _1670;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1820 = in.m_82.x;
    float _1822 = in.m_82.y;
    float _1824 = in.m_82.z;
    float _1826 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1800);
    float _1828 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1810);
    float _1830 = -_1814;
    float _1832 = fma(_1678, 2.0, _1830);
    float _1834 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1836 = _1804 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1838 = float(_1490);
    float _1840 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1818);
    float _1842 = _1788 * _157;
    int _1844 = abs(_1592);
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1848 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1834);
    float _1850 = _1672 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1852 = exp2(_1842);
    float _1854 = float(_1690);
    float _1856 = fma(_1616, -2.0, _1846);
    float _1858 = _1816 * (-2.0);
    float _1860 = float(_1556);
    float _1862 = _1854 * _1838;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1848);
    float _1866 = float(_1844);
    float _1868 = fma(_1736, _1858, _1736);
    float _1870 = fma(_1858, _1822, _1822);
    float _1872 = float(uint(_1268));
    float _1874 = _1866 * _1860;
    float _1876 = fma(_1680, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1836);
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1880 = 1.0 + _1878;
    bool _1882 = !_1620;
    int _1884 = _1882 ? 0 : 1;
    float _1886 = -_1852;
    float _1888 = _1886 + 1.0;
    bool _1890 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1892 = isnan(0.0);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1898 = _1894 || _1896;
    float _1900 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1840);
    float _1902 = as_type<float>(_832) * _1872;
    float _1904 = 1.0 / _1880;
    float _1906 = fma(_1850, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1876);
    int _1908 = ~_1522;
    int _1910 = _1908 + _1614;
    int _1912 = _1910 + 1;
    float _1914 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1696);
    float _1916 = -_157;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1832);
    float _1920 = _1874 * (-2.0);
    float _1922 = _1898 ? _1888 : 0.0;
    float _1924 = trunc(_1902);
    float _1926 = precise::max(_1924, 0.0);
    uint _1928 = uint(_1926);
    bool _1930 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1932 = isnan(1.0);
    bool _1934 = _1930 || _1932;
    bool _1936 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1938 = _1934 || _1936;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1944 = -_157;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1694);
    float _1948 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1856);
    float _1950 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1940);
    float _1952 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1942);
    float _1954 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1956 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1812);
    float _1958 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1950);
    float _1960 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1952);
    float _1962 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1828);
    int _1964 = _801 * _1912;
    int _1966 = _1964 + _1298;
    if (_1938)
    {
        float _1968 = _1922 * _1904;
        _159 = _1968;
    }
    float _1970 = _159;
    int _1972 = ~_801;
    int _1974 = _1972 + 1;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1978 = _801 == 0;
    float _1980 = _1900 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1982 = fma(_1920, _1820, _1820);
    int _1984 = _1974 * int(_1928);
    int _1986 = _1984 + _1268;
    bool _1988 = !_1978;
    int _1990 = _1988 ? _1966 : (-1);
    float _1992 = fma(_1712, _1920, _1712);
    bool _1994 = !_1318;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2000 = _1980 * _1954;
    int _2002 = _1990 & 3;
    bool _2004 = _2002 != 0;
    float _2006 = _1864 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _2008 = float(uint(_1986));
    float _2010 = fma(_2000, 0.5, 0.5);
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : 1;
    float _2016 = _1862 * (-2.0);
    int _2018 = _1990 & 3;
    bool _2020 = _2018 != 0;
    float _2022 = as_type<float>(_832) * _2008;
    float _2024 = _1906 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _2026 = _2006 * _1976;
    int _2028 = _2020 ? 0 : 1;
    float _2030 = fma(_1734, _2016, _1734);
    bool _2032 = _1316 != 3;
    float _2034 = trunc(_2022);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = fma(_2016, _1824, _1824);
    float _2042 = _2024 * _1998;
    bool _2044 = !_2032;
    int _2046 = _2044 ? 0 : (-1);
    float _2048 = fma(_2026, 0.5, 0.5);
    bool _2050 = uint(_2002) > 1u;
    float _2052 = _179 + (-0.5);
    float _2054 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1870);
    bool _2056 = _179 > 0.5;
    float _2058 = _1286 + (-0.5);
    float _2060 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1982);
    float _2062 = fma(_1868, _1970, _2054);
    float _2064 = fma(_1768, _1792, _1826);
    float _2066 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2040);
    float _2068 = fma(_1992, _1970, _2060);
    int _2070 = ~_801;
    int _2072 = _2070 + 1;
    float _2074 = fma(_1764, _1766, _2064);
    int _2076 = ~_2028;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    float _2082 = fma(_2030, _1970, _2066);
    int _2084 = int(_1928) + int(_2038);
    float _2086 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2074);
    int _2088 = _2080;
    if (!_2050)
    {
        int _2090 = ~_2028;
        int _2092 = _2090 + 1;
        _2088 = _2092;
    }
    int _2094 = _2088;
    float _2096 = _2062 * 0.15915493667125701904296875;
    float _2098 = fma(_2042, 0.5, 0.5);
    bool _2100 = uint(_2002) >= 2u;
    float _2102 = floor(_2010);
    int _2104 = _1310 >> 31;
    int _2106 = _2072 * _2084;
    int _2108 = _2106 + _1268;
    int _2110 = _1990 >> 31;
    float _2112 = -_1958;
    float _2114 = _2112 + 1.0;
    int _2116 = _2100 ? 0 : 1;
    float _2118 = -_1962;
    float _2120 = _2118 + 1.0;
    bool _2122 = _2002 != 3;
    float _2124 = floor(_2098);
    int _2126 = _2104 & 3;
    int _2128 = _2110 & 3;
    bool _2130 = !_2122;
    int _2132 = _2130 ? 0 : (-1);
    int _2134 = _1310 + _2126;
    float _2136 = _2096 * 6.283185482025146484375;
    float _2138 = sin(_2136);
    bool _2140 = uint(_2108) >= uint(_801);
    float _2142 = _2068 * 0.15915493667125701904296875;
    int _2144 = _1990 + _2128;
    float _2146 = -_2102;
    float _2148 = _2010 + _2146;
    int _2150 = _2134 >> 2;
    float _2152 = in.m_65.w;
    bool _2154 = !_2140;
    int _2156 = _2154 ? 0 : (-1);
    float _2158 = _2096 * 6.283185482025146484375;
    float _2160 = cos(_2158);
    int _2162 = _2144 >> 2;
    int _2164 = _2150 << 4;
    int _2166 = _2164 + 368;
    int _2168 = ~_2084;
    int _2170 = _2168 + _2156;
    int _2172 = _2170 + 1;
    bool _2174 = _2002 != 3;
    uint _2176 = uint(int(uint(_2166) >> uint(2)));
    uint _2178 = uint(int(uint(int(_2176)) >> uint(2)));
    int _2180 = int(_2176) & 3;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[int(_2178)][_2180];
    int _2184 = int(_2176) + 1;
    uint _2186 = uint(int(uint(_2184) >> uint(2)));
    int _2188 = _2184 & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = _2162 << 4;
    int _2194 = _2192 + 512;
    int _2196 = _801 * _2172;
    int _2198 = _2196 + _1268;
    int _2200 = ~_2116;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    float _2206 = _2082 * 0.15915493667125701904296875;
    float _2208 = _2142 * 6.283185482025146484375;
    float _2210 = sin(_2208);
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _2214 = -_323;
    int _2216 = _2056 ? as_type<int>(_2214) : as_type<int>(_323);
    uint _2218 = uint(int(uint(_2194) >> uint(2)));
    uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
    int _2222 = int(_2218) & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    int _2226 = int(_2218) + 1;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    int _2230 = _2226 & 3;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[int(_2228)][_2230];
    int _2234 = abs(_1360);
    int _2236 = abs(_1996);
    int _2238 = _2204;
    if (_2174)
    {
        int _2240 = ~_2116;
        int _2242 = _2240 + 1;
        _2238 = _2242;
    }
    int _2244 = _2238;
    float _2246 = _2206 * 6.283185482025146484375;
    float _2248 = cos(_2246);
    bool _2250 = !_1978;
    int _2252 = _2250 ? _2198 : (-1);
    int _2254 = _2194 + 8;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
    int _2260 = int(_2256) & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = int(_2256) + 1;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    int _2268 = _2264 & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    bool _2272 = _1286 > 0.5;
    float _2274 = _757 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2276 = _2086 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2278 = _1038 > 0.5;
    float _2280 = _2210 * _2138;
    float _2282 = _2142 * 6.283185482025146484375;
    float _2284 = cos(_2282);
    bool _2286 = _2152 > 0.5;
    int _2288 = _2166 + 8;
    uint _2290 = uint(int(uint(_2288) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    float _2306 = _2274 * _2212;
    float _2308 = -_2124;
    float _2310 = _2098 + _2308;
    float _2312 = _2210 * _2160;
    out.m_84.w = _2276;
    int _2314 = ~_2236;
    int _2316 = _2314 + 1;
    int _2318 = _2316 + 1;
    float _2320 = floor(_2048);
    float _2322 = _2160 * _2248;
    int _2324 = abs(_1396);
    float _2326 = _2210 * _2248;
    int _2328 = abs(_2244);
    bool _2330 = !_1532;
    float _2332 = _2330 ? _323 : as_type<float>(_2216);
    float _2334 = _2206 * 6.283185482025146484375;
    float _2336 = sin(_2334);
    float _2338 = _2284 * _2160;
    float _2340 = _2284 * _2138;
    float _2342 = _2284 * _2248;
    float _2344 = _2138 * _2248;
    int _2346 = ~_2234;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    float _2352 = -_2320;
    float _2354 = _2048 + _2352;
    int _2356 = abs(_2094);
    float _2358 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2360 = abs(_2014);
    int _2362 = _2350 * as_type<int>(_2190);
    int _2364 = ~_2356;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = _2342 * _2306;
    int _2372 = ~_2360;
    int _2374 = _2372 + 1;
    int _2376 = _2374 + 1;
    int _2378 = _2318 * as_type<int>(_2182);
    int _2380 = _2378 + _2362;
    float _2382 = -_2340;
    float _2384 = fma(_2336, _2312, _2382);
    int _2386 = _2368 * as_type<int>(_2232);
    float _2388 = -_2312;
    float _2390 = fma(_2336, _2340, _2388);
    int _2392 = abs(_2046);
    float _2394 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2396 = int(_2394);
    int _2398 = _2376 * as_type<int>(_2224);
    int _2400 = _2398 + _2386;
    float _2402 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2404 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2406 = ~_2324;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2336, _2338, _2280);
    int _2414 = ~_2328;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    float _2420 = fma(_2336, _2280, _2338);
    int _2422 = ~_2392;
    int _2424 = _2422 + 1;
    int _2426 = _2424 + 1;
    float _2428 = -_2336;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2432 = -_2336;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2402);
    int _2436 = _2410 * as_type<int>(_2296);
    int _2438 = _2436 + _2380;
    int _2440 = abs(_1416);
    int _2442 = _2418 * as_type<int>(_2262);
    int _2444 = _2442 + _2400;
    float _2446 = _327 * _705;
    int _2448 = _2426 * as_type<int>(_2304);
    int _2450 = _2448 + _2438;
    float _2452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    float _2454 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2456 = int(_2454);
    float _2458 = _2446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2460 = float(uint(_2396));
    float _2462 = -_2336;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2404);
    int _2466 = ~_2440;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = _2458 * _2452;
    int _2474 = abs(_2132);
    float _2476 = -_2306;
    float _2478 = _2336 * _2476;
    float _2480 = 1.0 / _2460;
    int _2482 = _2450 * _2470;
    int _2484 = ~_2474;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2354, 2.0, -1.0);
    float _2492 = _2326 * _2306;
    int _2494 = _1586 * _2440;
    int _2496 = _2494 + _2482;
    float _2498 = fma(_2148, 2.0, -1.0);
    int _2500 = _2488 * as_type<int>(_2270);
    int _2502 = _2500 + _2444;
    float _2504 = _2490 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2506 = fma(_2322, _2472, _2478);
    float _2508 = fma(_2412, _2472, _2370);
    int _2510 = abs(_2396);
    float _2512 = fma(_2384, _2472, _2492);
    float _2514 = float(uint(_2456));
    float _2516 = _2498 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2518 = abs(_1884);
    float _2520 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2522 = 1.0 / _2514;
    float _2524 = float(uint(_2510));
    float _2526 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2434);
    int _2528 = ~_2518;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2536 = float(uint(_2496));
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _2540 = abs(_2456);
    float _2542 = 1.0 / _2524;
    float _2544 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2520);
    int _2546 = as_type<int>(_2480) + (-2);
    int _2548 = _2502 * _2532;
    float _2550 = float(uint(_2540));
    float _2552 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    int _2554 = abs(_2496);
    float _2556 = as_type<float>(_2546) * _2536;
    int _2558 = _2252 * _2518;
    int _2560 = _2558 + _2548;
    int _2562 = as_type<int>(_2522) + (-2);
    float _2564 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2464);
    float _2566 = 1.0 / _2550;
    float _2568 = float(uint(_2560));
    float _2570 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2534);
    float _2572 = float(uint(_2554));
    float _2574 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2576 = ~_2396;
    int _2578 = _2576 + 1;
    float _2580 = as_type<float>(_2562) * _2568;
    int _2582 = as_type<int>(_2542) + (-2);
    float _2584 = trunc(_2556);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    int _2590 = abs(_2560);
    float _2592 = fma(_2516, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2538);
    float _2594 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2596 = as_type<float>(_2582) * _2572;
    float _2598 = float(uint(_2590));
    float _2600 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2594);
    float _2604 = trunc(_2580);
    float _2606 = precise::max(_2604, 0.0);
    uint _2608 = uint(_2606);
    int _2610 = as_type<int>(_2566) + (-2);
    int _2612 = ~_2510;
    int _2614 = _2612 + 1;
    int _2616 = ~_2540;
    int _2618 = _2616 + 1;
    float _2620 = as_type<float>(_2610) * _2598;
    float _2622 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    int _2624 = _2578 * int(_2588);
    int _2626 = _2624 + _2496;
    float _2628 = trunc(_2596);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2636 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2622);
    float _2638 = float(uint(_2626));
    float _2640 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2574);
    int _2642 = ~_2456;
    int _2644 = _2642 + 1;
    float _2646 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2634);
    float _2648 = trunc(_2620);
    float _2650 = precise::max(_2648, 0.0);
    uint _2652 = uint(_2650);
    float _2654 = as_type<float>(_2546) * _2638;
    float _2656 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2658 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2660 = _2390 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2662 = _2644 * int(_2608);
    int _2664 = _2662 + _2560;
    float _2666 = trunc(_2654);
    float _2668 = precise::max(_2666, 0.0);
    uint _2670 = uint(_2668);
    int _2672 = _2614 * int(_2632);
    int _2674 = _2672 + _2554;
    float _2676 = fma(_2344, _2656, _2506);
    float _2678 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2658);
    float _2680 = float(uint(_2664));
    float _2682 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2660);
    float _2684 = float(uint(_2674));
    float _2686 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    int _2688 = _2618 * int(_2652);
    int _2690 = _2688 + _2590;
    float _2692 = as_type<float>(_2562) * _2680;
    float _2694 = fma(_2390, _2656, _2508);
    float _2696 = as_type<float>(_2582) * _2684;
    float _2698 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2640);
    float _2700 = float(uint(_2690));
    float _2702 = fma(_2420, _2656, _2512);
    float _2704 = trunc(_2696);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    float _2712 = -_231;
    int _2714 = _2278 ? as_type<int>(_2712) : as_type<int>(_231);
    float _2716 = as_type<float>(_2610) * _2700;
    float _2718 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2602);
    float _2720 = -_231;
    int _2722 = _2286 ? as_type<int>(_2720) : as_type<int>(_231);
    float _2724 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2726 = -_323;
    int _2728 = _2272 ? as_type<int>(_2726) : as_type<int>(_323);
    float _2730 = trunc(_2692);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = !_1624;
    float _2738 = _2736 ? _231 : as_type<float>(_2714);
    float _2740 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2742 = !_1632;
    float _2744 = _2742 ? _231 : as_type<float>(_2722);
    float _2746 = _323 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2748 = !_1628;
    float _2750 = _2748 ? _323 : as_type<float>(_2728);
    float _2752 = _2740 * _2552;
    int _2754 = int(_2588) + int(_2670);
    float _2756 = trunc(_2716);
    float _2758 = precise::max(_2756, 0.0);
    uint _2760 = uint(_2758);
    float _2762 = _2740 * _2526;
    int _2764 = int(_2632) + int(_2708);
    float _2766 = fma(_2746, _2718, _2752);
    int _2768 = ~_2396;
    int _2770 = _2768 + 1;
    out.m_86.x = _2718;
    out.m_86.y = _2698;
    out.m_86.z = _2710;
    int _2772 = ~_2456;
    int _2774 = _2772 + 1;
    float _2776 = fma(_2746, _2698, _2762);
    int _2778 = ~_2510;
    int _2780 = _2778 + 1;
    int _2782 = _2770 * _2754;
    int _2784 = _2782 + _2496;
    int _2786 = int(_2608) + int(_2734);
    int _2788 = ~_2540;
    int _2790 = _2788 + 1;
    int _2792 = _2780 * _2764;
    int _2794 = _2792 + _2554;
    bool _2796 = uint(_2784) >= uint(_2396);
    int _2798 = int(_2652) + int(_2760);
    float _2800 = _2740 * _2564;
    bool _2802 = !_2796;
    int _2804 = _2802 ? 0 : (-1);
    float _2806 = fma(_2746, _2710, _2800);
    bool _2808 = uint(_2794) >= uint(_2510);
    int _2810 = _2774 * _2786;
    int _2812 = _2810 + _2560;
    int _2814 = ~_2754;
    int _2816 = _2814 + _2804;
    int _2818 = _2816 + 1;
    float _2820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2822 = _2790 * _2798;
    int _2824 = _2822 + _2590;
    int _2826 = _2496 ^ _2396;
    bool _2828 = uint(_2812) >= uint(_2456);
    int _2830 = _2396 * _2818;
    int _2832 = _2830 + _2496;
    bool _2834 = _2396 == 0;
    bool _2836 = !_2828;
    int _2838 = _2836 ? 0 : (-1);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2842 = _2396 == 0;
    int _2844 = ~_2786;
    int _2846 = _2844 + _2838;
    int _2848 = _2846 + 1;
    int _2850 = _2560 ^ _2456;
    bool _2852 = !_2808;
    int _2854 = _2852 ? 0 : (-1);
    float _2856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2858 = uint(int(uint(_2826) >> uint(31)));
    bool _2860 = uint(_2824) >= uint(_2540);
    int _2862 = ~_2854;
    int _2864 = _2764 + _2862;
    int _2866 = _2864 + 1;
    uint _2868 = uint(int(uint(_2850) >> uint(31)));
    bool _2870 = !_2834;
    int _2872 = _2870 ? _2832 : (-1);
    int _2874 = ~int(_2858);
    int _2876 = _2874 + 1;
    bool _2878 = !_2860;
    int _2880 = _2878 ? 0 : (-1);
    float _2882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2884 = _2456 == 0;
    float _2886 = _2856 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2888 = _2456 == 0;
    int _2890 = _2456 * _2848;
    int _2892 = _2890 + _2560;
    int _2894 = ~int(_2868);
    int _2896 = _2894 + 1;
    float _2898 = _2820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2900 = float(_2872);
    int _2902 = _2866 ^ _2876;
    int _2904 = ~_2880;
    int _2906 = _2798 + _2904;
    int _2908 = _2906 + 1;
    float _2910 = fma(_2898, _2900, _1946);
    int _2912 = ~_2876;
    int _2914 = _2912 + _2902;
    int _2916 = _2914 + 1;
    int _2918 = _2908 ^ _2896;
    float _2920 = fma(_2740, _2740, 1.0);
    bool _2922 = !_2884;
    int _2924 = _2922 ? _2892 : (-1);
    int _2926 = ~_2896;
    int _2928 = _2926 + _2918;
    int _2930 = _2928 + 1;
    float _2932 = rsqrt(_2920);
    bool _2934 = !_2842;
    int _2936 = _2934 ? _2916 : (-1);
    float _2938 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2940 = float(_2924);
    float _2942 = _2332 + 0.5;
    float _2944 = float(_2936);
    bool _2946 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2948 = isnan(1.0);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2954 = _2950 || _2952;
    float _2956 = fma(_2938, _2940, _1918);
    bool _2958 = !_2888;
    int _2960 = _2958 ? _2930 : (-1);
    float _2962 = -_1914;
    float _2964 = fma(_2886, _2944, _2962);
    float _2966 = fma(_2898, _2942, _2910);
    float _2968 = _2738 + (-0.5);
    float _2970 = float(_2960);
    float _2972 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2974 = _2750 + 0.5;
    float _2976 = -_2886;
    float _2978 = fma(_2976, _2968, _2964);
    float _2980 = _2744 + (-0.5);
    float _2982 = -_1948;
    float _2984 = fma(_2972, _2970, _2982);
    float _2986 = _2740 * _2932;
    float _2988 = fma(_2938, _2974, _2956);
    float _2990 = -_2972;
    float _2992 = fma(_2990, _2980, _2984);
    float _2994 = _2686 + _2766;
    float _2996 = -_2686;
    float _2998 = _2986 * _2996;
    float _3000 = -_2724;
    float _3002 = _2986 * _3000;
    float _3004 = -_1956;
    float _3006 = _3004 + 1.0;
    float _3008 = -_1960;
    float _3010 = _3008 + 1.0;
    float _3012 = fma(_2932, _2552, _2998);
    float _3014 = fma(_2932, _2526, _3002);
    float _3016 = -_2114;
    float _3018 = fma(_2332, _3016, _2966);
    float _3020 = _2724 + _2776;
    float _3022 = _2636 + _2806;
    float _3024 = -_3006;
    float _3026 = fma(_2750, _3024, _2988);
    float _3028 = fma(_2738, _3010, _2978);
    float _3030 = fma(_2744, _2120, _2992);
    float _3032 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_88.x = _2994;
    out.m_88.y = _3020;
    out.m_88.z = _3022;
    float _3034 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3036 = fma(_2310, 2.0, -1.0);
    float _3038 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_90.x = _3018;
    out.m_90.y = _3028;
    out.m_90.z = _3026;
    out.m_90.w = _3030;
    float _3040 = -_2636;
    float _3042 = _2986 * _3040;
    float _3044 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3032);
    float _3046 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3034);
    float _3048 = _3036 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _3050 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3038);
    float _3052 = fma(_2932, _2564, _3042);
    float _3054 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3044);
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2570);
    float _3058 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2544);
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2592);
    float _3062 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3046);
    float _3064 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3050);
    out.m_92.x = _3012;
    out.m_92.y = _3014;
    out.m_92.z = _3052;
    float _3066 = _3058 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _3068 = _3060 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _3070 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3072 = _3062 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3074 = _3070 + _3066;
    float _3076 = _3056 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _3078 = _3064 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3080 = _3072 + _3076;
    float _3082 = _3078 + _3068;
    float _3084 = _2956;
    float _3086 = _3070;
    float _3088 = _2920;
    float _3090 = _3064;
    float _3092 = _3070;
    float _3094 = _3060;
    float _3096 = _3064;
    float _3098 = _2490;
    float _3100 = _3036;
    float _3102 = _2498;
    float _3104 = _2458;
    float _3114;
    float _3116;
    float _3118;
    float _3120;
    if (!_2954)
    {
        bool _3106 = _3076 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _3108 = !_3106;
        _3110 = _3108;
        if (!_3110)
        {
            float _3112 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _3114 = 0.0;
            _3116 = _3112;
            _3118 = 0.0;
            _3120 = 0.0;
            _3122 = true;
        }
    }
    if ((!_3122) || _3110)
    {
        bool _3158;
        if (!_3110)
        {
            bool _3124 = _3076 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _3126 = isnan(_3076);
            bool _3128 = _3124 || _3126;
            bool _3130 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _3132 = _3128 || _3130;
            bool _3134 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _3136 = !_3132;
            bool _3138 = _3134 && _3136;
            bool _3140 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _3094 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_3138)
            {
                _3084 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _3142 = _3084;
            float _3144 = _3142;
            if (_3138)
            {
                _3086 = 0.0;
            }
            float _3146 = _3086;
            _3092 = _3146;
            _3114 = _3146;
            if (_3138)
            {
                _3088 = 0.0;
            }
            float _3148 = _3088;
            _3118 = _3148;
            if (_3138)
            {
                float _3150 = _3142 * 5.0;
                _3144 = _3150;
            }
            float _3152 = _3144;
            _3116 = _3152;
            if (_3138)
            {
                _3090 = 0.0;
            }
            float _3154 = _3090;
            bool _3156 = !_3132;
            _3158 = _3156 && _3140;
            _3096 = _3154;
            _3120 = _3154;
        }
        if ((!_3158) || _3110)
        {
            _3110 = false;
            float _3160 = _3092;
            float _3162 = _3094;
            float _3164 = _3096;
            bool _3166 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _3168 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _3170 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _3172 = _3058;
            float _3174 = _3160;
            float _3176 = _3162;
            float _3178 = _3164;
            _3116 = _3082;
            _3118 = _3080;
            if (_3166)
            {
                float _3180 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _3172 = _3180;
            }
            float _3182 = _3172;
            if (_3166)
            {
                float _3184 = abs(_2498);
                float _3186 = -_3184;
                float _3188 = _3186 + 1.0;
                _3174 = _3188;
            }
            float _3190 = _3174;
            if (_3168)
            {
                float _3192 = abs(_2490);
                float _3194 = -_3192;
                float _3196 = _3194 + 1.0;
                _3098 = _3196;
            }
            float _3198 = _3098;
            if (!_3166)
            {
                _3176 = 1.0;
            }
            float _3200 = _3176;
            float _3202 = _3200;
            if (_3170)
            {
                float _3204 = abs(_3036);
                float _3206 = -_3204;
                float _3208 = _3206 + 1.0;
                _3100 = _3208;
            }
            float _3210 = _3100;
            if (!_3168)
            {
                _3102 = 1.0;
            }
            float _3212 = _3102;
            float _3214 = _3212;
            if (!_3170)
            {
                _3178 = 1.0;
            }
            float _3216 = _3178;
            float _3218 = _3078;
            float _3220 = _3216;
            if (_3168)
            {
                float _3222 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _3218 = _3222;
            }
            float _3224 = _3218;
            float _3226 = _3054;
            if (_3170)
            {
                float _3228 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _3226 = _3228;
            }
            float _3230 = _3226;
            if (_3166)
            {
                float _3232 = _3190 * _3182;
                float _3234 = precise::clamp(_3232, 0.0, 1.0);
                _3202 = _3234;
            }
            float _3236 = _3202;
            _3114 = _3074;
            if (_3168)
            {
                float _3238 = _3198 * _3224;
                float _3240 = precise::clamp(_3238, 0.0, 1.0);
                _3214 = _3240;
            }
            float _3242 = _3214;
            float _3244 = _3236 * _3242;
            if (_3170)
            {
                float _3246 = _3210 * _3230;
                float _3248 = precise::clamp(_3246, 0.0, 1.0);
                _3220 = _3248;
            }
            float _3250 = _3220;
            float _3252 = _3244 * _3250;
            _3120 = _3252;
        }
    }
    _3122 = false;
    float _3254 = _3114;
    float _3256 = _3116;
    float _3258 = _3118;
    float _3260 = _3120;
    float _3262 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3264 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3266 = floor(_3262);
    float _3268 = floor(_3264);
    float _3270 = -_3266;
    float _3272 = _3262 + _3270;
    float _3274 = -_3268;
    float _3276 = _3264 + _3274;
    float2 _9679 = float2(_3272, _3276);
    float _3278 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9679, float2(0.0), isnan(_9679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9679, float2(0.0), isnan(_9679)), level(0.0)).x;
    float _3280 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3282 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3286 = _3254 + _3284;
    float _3288 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3280);
    float _3290 = _3076 + _3282;
    float _3292 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3288);
    float _3294 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3298 = _3256 + _3296;
    float _3300 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3302 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3304 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3294);
    float _3306 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3300);
    float _3308 = 1.0 / _3302;
    float _3310 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3304);
    float _3312 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3314 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3306);
    float _3316 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3318 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3312);
    float _3320 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3322 = _3316 + _3302;
    float _3324 = trunc(_3320);
    int _3326 = int(_3324);
    float _3328 = _3322 * _3308;
    float _3330 = _3328 * 0.5;
    float _3332 = _3298 * _3298;
    float _3334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3336 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3334);
    float _3338 = fma(_3286, _3286, _3332);
    float _3340 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3318);
    float _3342 = sqrt(_3338);
    float _3344 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3346 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3348 = _3326 + _3346;
    int _3350 = _3348 + 1;
    float _3352 = 1.0 / _3336;
    float _3354 = trunc(_3344);
    int _3356 = int(_3354);
    float _3358 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3360 = _3352 * _3358;
    bool _3362 = _3360 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _3364 = _3360 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3366 = !_3362;
    int _3368 = _3366 ? 0 : 1;
    int _3370 = 2;
    float _3372 = _3258;
    float _3374 = _3254;
    float _3376 = _3256;
    int _3378 = _3350;
    float _3380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    if (!_3362)
    {
        _3370 = 1;
    }
    int _3382 = _3370;
    int _3384 = _3382;
    if (!_3364)
    {
        _3384 = _3368;
    }
    int _3386 = _3384;
    bool _3388 = _3342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3390 = _3386 << 6;
    int _3392 = _3390 + 48;
    uint _3394 = uint(int(uint(_3392) >> uint(2)));
    uint _3396 = uint(int(uint(int(_3394)) >> uint(2)));
    int _3398 = int(_3394) & 3;
    float _3400 = (*spvDescriptorSet0.vp_c15)._m0[int(_3396)][_3398];
    int _3402 = int(_3394) + 1;
    uint _3404 = uint(int(uint(_3402) >> uint(2)));
    int _3406 = _3402 & 3;
    float _3408 = (*spvDescriptorSet0.vp_c15)._m0[int(_3404)][_3406];
    int _3410 = _3390 + 56;
    uint _3412 = uint(int(uint(_3410) >> uint(2)));
    uint _3414 = uint(int(uint(int(_3412)) >> uint(2)));
    int _3416 = int(_3412) & 3;
    float _3418 = (*spvDescriptorSet0.vp_c15)._m0[int(_3414)][_3416];
    int _3420 = int(_3412) + 1;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    int _3424 = _3420 & 3;
    float _3426 = (*spvDescriptorSet0.vp_c15)._m0[int(_3422)][_3424];
    int _3428 = _3390 + 64;
    uint _3430 = uint(int(uint(_3428) >> uint(2)));
    uint _3432 = uint(int(uint(int(_3430)) >> uint(2)));
    int _3434 = int(_3430) & 3;
    float _3436 = (*spvDescriptorSet0.vp_c15)._m0[int(_3432)][_3434];
    int _3438 = int(_3430) + 1;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    int _3442 = _3438 & 3;
    float _3444 = (*spvDescriptorSet0.vp_c15)._m0[int(_3440)][_3442];
    int _3446 = _3390 + 72;
    uint _3448 = uint(int(uint(_3446) >> uint(2)));
    uint _3450 = uint(int(uint(int(_3448)) >> uint(2)));
    int _3452 = int(_3448) & 3;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[int(_3450)][_3452];
    int _3456 = int(_3448) + 1;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    int _3460 = _3456 & 3;
    float _3462 = (*spvDescriptorSet0.vp_c15)._m0[int(_3458)][_3460];
    int _3464 = _3390 + 96;
    uint _3466 = uint(int(uint(_3464) >> uint(2)));
    uint _3468 = uint(int(uint(int(_3466)) >> uint(2)));
    int _3470 = int(_3466) & 3;
    float _3472 = (*spvDescriptorSet0.vp_c15)._m0[int(_3468)][_3470];
    int _3474 = int(_3466) + 1;
    uint _3476 = uint(int(uint(_3474) >> uint(2)));
    int _3478 = _3474 & 3;
    float _3480 = (*spvDescriptorSet0.vp_c15)._m0[int(_3476)][_3478];
    int _3482 = _3390 + 104;
    uint _3484 = uint(int(uint(_3482) >> uint(2)));
    uint _3486 = uint(int(uint(int(_3484)) >> uint(2)));
    int _3488 = int(_3484) & 3;
    float _3490 = (*spvDescriptorSet0.vp_c15)._m0[int(_3486)][_3488];
    int _3492 = int(_3484) + 1;
    uint _3494 = uint(int(uint(_3492) >> uint(2)));
    int _3496 = _3492 & 3;
    float _3498 = (*spvDescriptorSet0.vp_c15)._m0[int(_3494)][_3496];
    bool _3500 = !_3388;
    int _3502 = as_type<int>(_3480);
    float _3504 = _3454;
    float _3506 = _3462;
    if (!_3500)
    {
        float _3508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3510 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3512 = _3342 + _3510;
        float _3514 = rsqrt(_3338);
        float _3516 = _3512 * _3508;
        float _3518 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3520 = _3516 * 0.15915493667125701904296875;
        float _3522 = _3520 * 6.283185482025146484375;
        float _3524 = cos(_3522);
        float _3526 = _3520 * 6.283185482025146484375;
        float _3528 = sin(_3526);
        float _3530 = _3524 + (-1.0);
        float _3532 = fma(_3528, _3518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3534 = _3530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3536 = _3514 * _3532;
        float _3538 = fma(_3524, _3258, _3534);
        float _3540 = fma(_3286, _3536, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3542 = fma(_3298, _3536, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3372 = _3538;
        _3374 = _3540;
        _3376 = _3542;
    }
    float _3544 = _3372;
    float _3546 = _3374;
    float _3548 = _3376;
    float _3550 = -_3076;
    float _3552 = _3550 + _3544;
    int _3554 = _3390 + 80;
    uint _3556 = uint(int(uint(_3554) >> uint(2)));
    uint _3558 = uint(int(uint(int(_3556)) >> uint(2)));
    int _3560 = int(_3556) & 3;
    float _3562 = (*spvDescriptorSet0.vp_c15)._m0[int(_3558)][_3560];
    int _3564 = int(_3556) + 1;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    int _3568 = _3564 & 3;
    float _3570 = (*spvDescriptorSet0.vp_c15)._m0[int(_3566)][_3568];
    float _3572 = -_3066;
    float _3574 = _3572 + _3546;
    int _3576 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3578 = _3356 + _3576;
    int _3580 = _3578 + 1;
    float _3582 = _3552 * _3552;
    float _3584 = -_3068;
    float _3586 = _3584 + _3548;
    bool _3588 = _3350 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3590 = fma(_3574, _3574, _3582);
    int _3592 = _3350 | _3580;
    float _3594 = _3290 * _3480;
    bool _3596 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3598 = isnan(0.5);
    bool _3600 = _3596 || _3598;
    bool _3602 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3604 = _3600 || _3602;
    float _3606 = fma(_3586, _3586, _3590);
    bool _3608 = _3592 < 0;
    bool _3610 = _3608 || _3588;
    float _3612 = fma(_3066, _3472, _3594);
    float _3614 = _3290 * _3408;
    float _3616 = sqrt(_3606);
    bool _3618 = _3580 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3620 = _3618 || _3610;
    float _3622 = fma(_3068, _3490, _3612);
    float _3624 = fma(_3066, _3400, _3614);
    float _3626 = _3622 + _3498;
    float _3628 = _3290 * _3444;
    float _3630 = fma(_3068, _3418, _3624);
    float _3632 = 1.0 / _3626;
    float _3634 = fma(_3066, _3436, _3628);
    int _3636 = as_type<int>(_3614);
    int _3638 = as_type<int>(_3628);
    float _3640 = _3544;
    float _3642 = _3548;
    float _3644 = _3546;
    if (!_3620)
    {
        int _3646 = _3580 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3648 = _3646 + _3350;
        _3378 = _3648;
    }
    int _3650 = _3378;
    bool _3652 = _3616 > 0.0;
    float _3654 = _3612;
    float _3656 = _3616;
    if (!_3620)
    {
        float _3658 = floor(_3320);
        _3654 = _3658;
    }
    float _3660 = _3654;
    if (!_3620)
    {
        int _3662 = _3650 << 2;
        _3502 = _3662;
    }
    int _3664 = _3502;
    int _3666 = _3664;
    if (!_3620)
    {
        uint _3668 = uint(int(uint(_3650) >> uint(2)));
        _3636 = int(_3668);
    }
    int _3670 = _3636;
    if (!_3620)
    {
        int _3672 = 12 & _3664;
        _3666 = _3672;
    }
    int _3674 = _3666;
    if (!_3620)
    {
        int _3676 = _3670 << 4;
        int _3678 = _3676 + _3674;
        _3638 = _3678;
    }
    int _3680 = _3638;
    float _3682 = fma(_3068, _3454, _3634);
    if (!_3652)
    {
        _3504 = _3546;
    }
    float _3684 = _3504;
    bool _3686 = !_3652;
    float _3688 = _3684;
    float _3690 = _3660;
    if (!_3686)
    {
        float _3692 = _315 * _315;
        float _3694 = rsqrt(_3606);
        float _3696 = fma(_275, _275, _3692);
        float _3698 = fma(_317, _317, _3696);
        float _3700 = sqrt(_3698);
        float _3702 = _3574 * _3694;
        float _3704 = _3552 * _3694;
        float _3706 = _3586 * _3694;
        bool _3708 = _3700 > 0.0;
        float _3710 = _3700;
        if (!_3708)
        {
            _3710 = _3546;
        }
        float _3712 = _3710;
        bool _3714 = !_3708;
        _3688 = _3712;
        if (!_3714)
        {
            float _3716 = rsqrt(_3698);
            float _3718 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3720 = _315 * _3716;
            float _3722 = _275 * _3716;
            float _3724 = _3704 * _3720;
            float _3726 = _317 * _3716;
            float _3728 = fma(_3702, _3722, _3724);
            float _3730 = _3718 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3732 = fma(_3706, _3726, _3728);
            float _3734 = _3732 * _3730;
            float _3736 = fma(_275, _3734, _3546);
            float _3738 = fma(_315, _3734, _3544);
            float _3740 = fma(_317, _3734, _3548);
            _3640 = _3738;
            _3642 = _3740;
            _3688 = _3736;
        }
    }
    float _3742 = _3640;
    float _3744 = _3642;
    float _3746 = _3688;
    float _3748 = _3682 + _3462;
    float _3750 = _3630 + _3426;
    float _3752 = _3746;
    if (_3604)
    {
        _3506 = _3742;
    }
    float _3754 = _3506;
    float _3756 = _3754;
    if (_3604)
    {
        _3644 = _3744;
    }
    float _3758 = _3644;
    float _3760 = _3758;
    if (!_3604)
    {
        float _3762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3764 = _3076 + _3762;
        float _3766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3768 = _3066 + _3766;
        float _3770 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3772 = -_3066;
        float _3774 = _3772 + _3746;
        float _3776 = _3764 * _3764;
        float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3780 = _3068 + _3778;
        float _3782 = -_3068;
        float _3784 = _3782 + _3744;
        float _3786 = fma(_3768, _3768, _3776);
        float _3788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3790 = fma(_3780, _3780, _3786);
        float _3792 = sqrt(_3790);
        float _3794 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3796 = precise::min(_3792, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3798 = _3796 * _3788;
        float _3800 = _3794 * _3798;
        float _3802 = -_3076;
        float _3804 = _3802 + _3742;
        float _3806 = fma(_3774, _3800, _3066);
        float _3808 = fma(_3804, _3800, _3076);
        float _3810 = fma(_3784, _3800, _3068);
        _3756 = _3808;
        _3752 = _3806;
        _3760 = _3810;
    }
    float _3812 = _3756;
    float _3814 = _3752;
    float _3816 = _3760;
    float _3818 = _3750 * _3632;
    int _3820 = _3390 + 88;
    uint _3822 = uint(int(uint(_3820) >> uint(2)));
    uint _3824 = uint(int(uint(int(_3822)) >> uint(2)));
    int _3826 = int(_3822) & 3;
    float _3828 = (*spvDescriptorSet0.vp_c15)._m0[int(_3824)][_3826];
    int _3830 = int(_3822) + 1;
    uint _3832 = uint(int(uint(_3830) >> uint(2)));
    int _3834 = _3830 & 3;
    float _3836 = (*spvDescriptorSet0.vp_c15)._m0[int(_3832)][_3834];
    float _3838 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3840 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3842 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3844 = _3818 >= 0.0;
    float _3846 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3838);
    float _3848 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3840);
    float _3850 = _3812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3852 = _3750;
    if (!_3620)
    {
        int _3854 = _3680 + 400;
        uint _3856 = uint(int(uint(_3854) >> uint(2)));
        uint _3858 = uint(int(uint(int(_3856)) >> uint(2)));
        int _3860 = int(_3856) & 3;
        float _3862 = (*spvDescriptorSet0.vp_c15)._m0[int(_3858)][_3860];
        _3852 = _3862;
    }
    float _3864 = _3852;
    float _3866 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3846);
    float _3868 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3842);
    float _3870 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3848);
    float _3872 = _3748 * _3632;
    float _3874 = _3866 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3876 = _3818 <= 1.0;
    bool _3878 = _3876 && _3844;
    float _3880 = fma(_3814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3850);
    float _3882 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3868);
    float _3884 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3886 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3888 = _3872 >= 0.0;
    bool _3890 = _3888 && _3878;
    float _3892 = _3882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3894 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3880);
    float _3896 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3886);
    bool _3898 = _3872 <= 1.0;
    bool _3900 = _3898 && _3890;
    float _3902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3904 = _3892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3906 = _3894 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3908 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3896);
    float _3910 = _3682;
    float _3912 = _3894;
    if (!_3620)
    {
        float _3914 = floor(_3344);
        _3910 = _3914;
    }
    float _3916 = _3910;
    float _3918 = -_3904;
    float _3920 = fma(_3918, _3902, 1.0);
    float _3922 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3924 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3908);
    float _3926 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3928 = _3290 * _3570;
    float _3930 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3922);
    float _3932 = log2(_3920);
    float _3934 = _3928;
    if (_3900)
    {
        float _3936 = float(_3386);
        _3912 = _3936;
    }
    float _3938 = _3912;
    float _3940 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3926);
    float _3942 = fma(_3066, _3562, _3928);
    float _3944 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3930);
    float _3946 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3940);
    float _3948 = 1.0 / _3924;
    float _3950 = _3946;
    if (!_3620)
    {
        float _3952 = -_3916;
        float _3954 = _3344 + _3952;
        _3656 = _3954;
    }
    float _3956 = _3656;
    float _3958 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3944);
    float _3960 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3946);
    float _3962 = fma(_3068, _3828, _3942);
    if (!_3620)
    {
        float _3964 = -_3660;
        float _3966 = _3320 + _3964;
        _3950 = _3966;
    }
    float _3968 = _3950;
    float _3970 = _3922;
    if (_3900)
    {
        float _3972 = rint(_3938);
        float _3974 = precise::max(_3972, 0.0);
        uint _3976 = uint(_3974);
        uint _3978 = clamp(_3976, 0u, 65535u);
        _3970 = as_type<float>(_3978);
    }
    float _3980 = _3970;
    float _3982 = _3962 + _3836;
    float _3984 = _3932 * 0.693147182464599609375;
    float _3986 = _3982 * _3632;
    float _3988 = _3984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3990 = _3864;
    float _3992 = _3988;
    if (!_3620)
    {
        float _3994 = rint(_3864);
        float _3996 = precise::max(_3994, 0.0);
        uint _3998 = uint(_3996);
        uint _4000 = clamp(_3998, 0u, 65535u);
        _3990 = as_type<float>(_4000);
    }
    float _4002 = _3990;
    float _4004 = _3958 * _3948;
    float _4006 = _3960 * _3948;
    float _4008 = fma(_4004, 0.5, 0.5);
    float _4010 = fma(_4006, -0.5, 0.5);
    float _4012 = _3872;
    if (_3900)
    {
        float3 _10892 = float3(_3818, _3872, float(as_type<int>(_3980)));
        float3 _10896 = select(_10892, float3(0.0), isnan(_10892));
        float _4014 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10896.xy, uint(rint(_10896.z)), _3986, level(0.0));
        _4012 = _4014;
    }
    float _4016 = _4012;
    float3 _10906 = float3(_4008, _4010, _3988);
    float _4018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10906, float3(0.0), isnan(_10906)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10906, float3(0.0), isnan(_10906)), level(0.0)).x;
    float3 _10915 = float3(_4008, _4010, _3988);
    float4 _4021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10915, float3(0.0), isnan(_10915)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10915, float3(0.0), isnan(_10915)), level(0.0)).xyzw;
    float _4023 = _4021.x;
    float _4025 = _4021.y;
    float _4027 = _4021.z;
    float _4029 = _4021.w;
    float _4031 = _3956;
    if (!_3620)
    {
        float3 _10938 = float3(_3968, _3956, float(as_type<int>(_4002)));
        float3 _10940 = select(_10938, float3(0.0), isnan(_10938));
        float _4033 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10940.xy, uint(rint(_10940.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10940.xy, uint(rint(_10940.z)), level(0.0)).x;
        _4031 = _4033;
    }
    float _4035 = _4031;
    if (_3620)
    {
        _3690 = 1.0;
    }
    float _4037 = _3690;
    float _4039 = _4037;
    if (!_3620)
    {
        int _4041 = _3650 << 4;
        int _4043 = _4041 + 2048;
        uint _4045 = uint(int(uint(_4043) >> uint(2)));
        uint _4047 = uint(int(uint(int(_4045)) >> uint(2)));
        int _4049 = int(_4045) & 3;
        float _4051 = (*spvDescriptorSet0.vp_c15)._m0[int(_4047)][_4049];
        int _4053 = int(_4045) + 1;
        uint _4055 = uint(int(uint(_4053) >> uint(2)));
        int _4057 = _4053 & 3;
        float _4059 = (*spvDescriptorSet0.vp_c15)._m0[int(_4055)][_4057];
        int _4061 = _4043 + 8;
        uint _4063 = uint(int(uint(_4061) >> uint(2)));
        uint _4065 = uint(int(uint(int(_4063)) >> uint(2)));
        int _4067 = int(_4063) & 3;
        float _4069 = (*spvDescriptorSet0.vp_c15)._m0[int(_4065)][_4067];
        int _4071 = int(_4063) + 1;
        uint _4073 = uint(int(uint(_4071) >> uint(2)));
        int _4075 = _4071 & 3;
        float _4077 = (*spvDescriptorSet0.vp_c15)._m0[int(_4073)][_4075];
        float _4079 = _3290 * _4059;
        float _4081 = fma(_3066, _4051, _4079);
        float _4083 = fma(_3068, _4069, _4081);
        float _4085 = _4083 + _4077;
        float _4087 = precise::clamp(_4085, 0.0, 1.0);
        float _4089 = -_4087;
        float _4091 = _4089 + _4035;
        float _4093 = fma(_4091, 500.0, 1.5);
        float _4095 = exp2(_4093);
        float _4097 = 0.0 + _4095;
        float _4099 = precise::clamp(_4097, 0.0, 1.0);
        _4039 = _4099;
    }
    float _4101 = _4039;
    float _4103 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4105 = _3812 + _4103;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4109 = _3814 + _4107;
    float _4111 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4113 = _3816 + _4111;
    float _4115 = _4105 * _4105;
    float _4117 = fma(_4109, _4109, _4115);
    float _4119 = fma(_4113, _4113, _4117);
    float _4121 = rsqrt(_4119);
    float _4123 = sqrt(_4119);
    float _4125 = _4121 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4127 = _4109 * _4125;
    float _4129 = _4113 * _4125;
    float _4131 = _4127 * _4127;
    float _4133 = _4129 * _4129;
    float _4135 = _4131 + _4133;
    float _4137 = sqrt(_4135);
    bool _4139 = _4137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4143 = _4137 + _4141;
    float _4145 = _4010;
    float _4147 = _4143;
    float _4149 = _4105;
    float _4151 = _4127;
    float _4153 = _4131;
    float _4155 = _4133;
    if (_4139)
    {
        float _4157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4145 = _4157;
    }
    float _4159 = _4145;
    if (_4139)
    {
        float _4161 = rsqrt(_4135);
        _3934 = _4161;
    }
    float _4163 = _3934;
    float _4165 = _4163;
    if (_4139)
    {
        float _4167 = _4143 * _4159;
        _4147 = _4167;
    }
    float _4169 = _4147;
    if (_4139)
    {
        float _4171 = _4169 * 0.15915493667125701904296875;
        _3992 = _4171;
    }
    float _4173 = _3992;
    float _4175 = _4035;
    if (_4139)
    {
        float _4177 = _4173 * 6.283185482025146484375;
        float _4179 = sin(_4177);
        _4175 = _4179;
    }
    float _4181 = _4175;
    float _4183 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4185 = precise::max(0.0, _4183);
    float _4187 = _4159;
    float _4189 = _4185;
    if (_4139)
    {
        float _4191 = _4173 * 6.283185482025146484375;
        float _4193 = cos(_4191);
        _4187 = _4193;
    }
    float _4195 = _4187;
    float _4197 = -_4125;
    float _4199 = -_4185;
    float _4201 = fma(_4105, _4197, _4199);
    if (_4139)
    {
        float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4189 = _4203;
    }
    float _4205 = _4189;
    float _4207 = _4181;
    float _4209 = _4205;
    if (_4139)
    {
        float _4211 = fma(_4181, _4205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4207 = _4211;
    }
    float _4213 = _4207;
    float _4215 = _4213;
    if (!_4139)
    {
        _4209 = _4201;
    }
    float _4217 = _4209;
    float _4219 = _4217;
    if (_4139)
    {
        float _4221 = _4195 + (-1.0);
        _4149 = _4221;
    }
    float _4223 = _4149;
    float _4225 = _4223;
    if (_4139)
    {
        float _4227 = _4163 * _4213;
        _4215 = _4227;
    }
    float _4229 = _4215;
    if (_4139)
    {
        float _4231 = _4223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4165 = _4231;
    }
    float _4233 = _4165;
    if (_4139)
    {
        float _4235 = _4127 * _4229;
        _4151 = _4235;
    }
    float _4237 = _4151;
    if (!_4139)
    {
        _4225 = _4129;
    }
    float _4239 = _4225;
    float _4241 = _4239;
    if (_4139)
    {
        float _4243 = _4129 * _4229;
        _4241 = _4243;
    }
    float _4245 = _4241;
    if (_4139)
    {
        float _4247 = fma(_4201, _4195, _4233);
        _4219 = _4247;
    }
    float _4249 = _4219;
    if (_4139)
    {
        float _4251 = _4237 * _4237;
        _4153 = _4251;
    }
    float _4253 = _4153;
    if (_4139)
    {
        float _4255 = _4245 * _4245;
        _4155 = _4255;
    }
    float _4257 = _4155;
    float _4259 = fma(_4249, _4249, _4253);
    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4263 = fma(_4123, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4261);
    float _4265 = precise::clamp(_4263, 0.0, 1.0);
    float _4267 = _4259 + _4257;
    float _4269 = -_4265;
    float _4271 = _4269 + 1.0;
    float _4273 = rsqrt(_4267);
    float _4275 = abs(_4271);
    float _4277 = log2(_4275);
    float _4279 = _4273 * _4237;
    float _4281 = _4273 * _4249;
    float _4283 = _4273 * _4245;
    float _4285 = _4279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4287 = -_4285;
    float _4289 = fma(_4281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4287);
    float _4291 = _4277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4293 = -_4283;
    float _4295 = fma(_4293, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4289);
    float _4297 = exp2(_4291);
    float _4299 = fma(_4295, -0.5, 0.5);
    float _4301 = fma(_4295, 0.5, 0.5);
    float _4303 = _4281 + 1.0;
    float _4305 = fma(_4301, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4307 = sqrt(_4299);
    float _4309 = fma(_4301, _4305, -0.212114393711090087890625);
    float _4311 = -_4281;
    float _4313 = fma(_4297, _4303, _4311);
    float _4315 = fma(_4301, _4309, 1.570728778839111328125);
    float _4317 = fma(_4313, 0.5, 0.5);
    float _4319 = _4307 * 0.636619746685028076171875;
    float _4321 = -_4315;
    float _4323 = fma(_4319, _4321, 1.0);
    float2 _11389 = float2(_4323, _4317);
    float3 _4327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11389, float2(0.0), isnan(_11389)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11389, float2(0.0), isnan(_11389)), level(0.0)).xyz;
    float _4329 = _4327.x;
    float _4331 = _4327.y;
    float _4333 = _4327.z;
    float _4335 = abs(_3360);
    float _4337 = log2(_4335);
    float _4339 = _3260 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4341 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4343 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4345 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4347 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4341);
    float _4349 = -_3278;
    float _4351 = _4349 + 1.0;
    float _4353 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4343);
    float _4355 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4345);
    float _4357 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4347);
    out.m_94.y = 1.0;
    float _4359 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4353);
    float _4361 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4355);
    float _4363 = _4357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4365 = _4337 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4367 = _327 * _4339;
    float _4369 = _3076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4371 = _3874 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4373 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4375 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4377 = exp2(_4365);
    float _4379 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4371);
    float _4381 = _4359 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4383 = -_315;
    float _4385 = _4383 + _3812;
    float _4387 = -_275;
    float _4389 = _4387 + _3814;
    float _4391 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4379);
    float _4393 = -_317;
    float _4395 = _4393 + _3816;
    out.m_96.x = _3814;
    out.m_96.y = _3812;
    out.m_96.z = _3816;
    float _4397 = fma(_4377, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4399 = precise::clamp(_4397, 0.0, 1.0);
    float _4401 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4369);
    float _4403 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _4405 = fma(_4399, -2.0, 3.0);
    float _4407 = _4399 * _4399;
    float _4409 = fma(_3068, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4401);
    float _4411 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4413 = _4407 * _4405;
    float _4415 = _4409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4417 = -_4413;
    float _4419 = _4417 + 1.0;
    float _4421 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4375);
    float _4423 = fma(_4419, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4413);
    float _4425 = _4363 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4427 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4425);
    float _4429 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4373);
    bool _4431 = _3360 <= 8000.0;
    bool _4433 = isnan(_3360);
    bool _4435 = _4431 || _4433;
    bool _4437 = isnan(8000.0);
    bool _4439 = _4435 || _4437;
    float _4441 = float(_4439);
    float _4443 = fma(_3906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4391);
    float _4445 = _4277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4447 = fma(_4415, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4411);
    float _4449 = _4441 * _4423;
    float _4451 = _4361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4453 = _4403 + _4447;
    float _4455 = exp2(_4445);
    float _4457 = _4443 + _3924;
    float _4459 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4453);
    float _4461 = _4457 * 0.5;
    float _4463 = _4457;
    float _4465 = _4367;
    if (!_3900)
    {
        _4463 = 1.0;
    }
    float _4467 = _4463;
    out.gl_Position.x = _3958;
    out.gl_Position.y = _3960;
    out.gl_Position.z = _4443;
    out.gl_Position.w = _3924;
    float _4469 = 1.0 / _4459;
    float _4471 = _4467;
    if (_3900)
    {
        bool _4473 = _4016 >= _3986;
        bool _4475 = isnan(_4016);
        bool _4477 = _4473 || _4475;
        bool _4479 = isnan(_3986);
        bool _4481 = _4477 || _4479;
        float _4483 = float(_4481);
        _4471 = _4483;
    }
    float _4485 = _4471;
    float _4487 = _4449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4489 = fma(_4381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4421);
    out.m_98.z = _4461;
    out.m_98.w = _3924;
    float _4491 = _4351 * _4487;
    float _4493 = precise::clamp(_4491, 0.0, 1.0);
    float _4495 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4489);
    float _4497 = -_4455;
    float _4499 = _4497 + 1.0;
    float _4501 = _4485 * _4101;
    float _4503 = -_4493;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4507 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _4509 = _4499 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4511 = _4381 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _4513 = -_4501;
    float _4515 = fma(_4513, _4505, 1.0);
    float _4517 = precise::clamp(_4515, 0.0, 1.0);
    float _4519 = _4507 + _4427;
    float _4521 = _4509 * _4018;
    float _4523 = _4511 + _4429;
    float _4525 = _4495 * _4469;
    float _4527 = -_4509;
    float _4529 = _4527 + 1.0;
    float _4531 = _4029 * _4521;
    float _4533 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4523);
    float _4535 = _4517 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _4537 = _4525 > 0.0;
    float _4539 = _4029 * _4529;
    float _4541 = _4533 * _4469;
    float _4543 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4519);
    bool _4545 = _4525 < 1.0;
    bool _4547 = _4545 && _4537;
    out.m_94.x = _4535;
    float _4549 = _4543 * _4469;
    bool _4551 = _4004 > (-1.0);
    bool _4553 = _4551 && _4547;
    bool _4555 = _4006 > (-1.0);
    bool _4557 = _4555 && _4553;
    bool _4559 = _4004 < 1.0;
    bool _4561 = _4559 && _4557;
    bool _4563 = _4006 < 1.0;
    bool _4565 = _4563 && _4561;
    float _4567 = fma(_4329, _4531, _4023);
    float _4569 = fma(_4331, _4531, _4025);
    float _4571 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _4573 = _4333 * _4521;
    float _4575 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[638].x, _4571);
    float _4577 = fma(_4029, _4573, _4027);
    float _4579 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[638].z, _4575);
    out.m_100.x = _4567;
    out.m_100.y = _4569;
    out.m_100.z = _4577;
    out.m_100.w = _4539;
    float _4581 = _4579 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _4583 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _4585 = _4385 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _4587 = 1.0 / _4581;
    float _4589 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[635].x, _4583);
    float _4591 = fma(_4389, (*spvDescriptorSet0.vp_c15)._m0[636].x, _4585);
    float _4593 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[635].z, _4589);
    float _4595 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[636].z, _4591);
    float _4597 = _4593 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _4599 = _4595 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _4601 = _4597 * _4587;
    float _4603 = _4599 * _4587;
    bool _4605 = !_4565;
    float _4607 = _4597;
    float _4637;
    if (!_4605)
    {
        float _4609 = -_4541;
        float _4611 = _4006 + _4609;
        float _4613 = -_4549;
        float _4615 = _4004 + _4613;
        float _4617 = -_4601;
        float _4619 = _4004 + _4617;
        float _4621 = -_4603;
        float _4623 = _4006 + _4621;
        float _4625 = _4611 * _4611;
        float _4627 = fma(_4615, _4615, _4625);
        float _4629 = sqrt(_4627);
        bool _4631 = _4629 > 0.0;
        _3380 = _4629;
        if (!_4631)
        {
            _4607 = _4367;
        }
        float _4633 = _4607;
        bool _4635 = !_4631;
        _4637 = _4633;
        _4639 = _4635;
        if (!_4639)
        {
            float _4641 = _4623 * _4623;
            float _4643 = fma(_4619, _4619, _4641);
            float _4645 = rsqrt(_4627);
            float _4647 = sqrt(_4643);
            float _4649 = _4615 * _4645;
            float _4651 = _4611 * _4645;
            bool _4653 = _4647 > 0.0;
            float _4655 = _4647;
            _3380 = _4645;
            if (!_4653)
            {
                _4655 = _4367;
            }
            float _4657 = _4655;
            bool _4659 = !_4653;
            _4637 = _4657;
            _4639 = _4659;
            if (!_4639)
            {
                float _4661 = _2458 * _4451;
                float _4663 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _4665 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4403);
                float _4667 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4511);
                float _4669 = fma(_4661, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4507);
                float _4671 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4665);
                float _4673 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4667);
                float _4675 = fma(_4451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4669);
                float _4677 = rsqrt(_4643);
                float _4679 = _4663 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4681 = 1.0 / _4671;
                float _4683 = _4623 * _4679;
                float _4685 = _4619 * _4679;
                float _4687 = _4683 * _4683;
                float _4689 = fma(_4685, _4685, _4687);
                float _4691 = _4673 * _4681;
                float _4693 = _4675 * _4681;
                float _4695 = sqrt(_4689);
                float _4697 = _4691 * _4691;
                float _4699 = fma(_4693, _4693, _4697);
                float _4701 = _4623 * _4677;
                float _4703 = _4619 * _4677;
                float _4705 = _4651 * _4701;
                float _4707 = sqrt(_4699);
                float _4709 = fma(_4649, _4703, _4705);
                float _4711 = precise::min(0.0, _4709);
                float _4713 = _3924 * _4711;
                float _4715 = fma(_4695, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4707);
                float _4717 = fma(_4685, _4713, _3958);
                float _4719 = fma(_4683, _4713, _3960);
                float _4721 = 1.0 / _4715;
                out.gl_Position.x = _4717;
                out.gl_Position.y = _4719;
                float _4723 = _4707 * _4721;
                out.m_94.y = _4723;
                _3104 = _4713;
                _4637 = _4367;
                _3380 = _4705;
                _4639 = true;
            }
        }
    }
    else
    {
        float _4725 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4725;
        _4637 = 0.0;
    }
    _4639 = false;
    float _4727 = _3104;
    float _4729 = _4637;
    float _4731 = _3380;
    bool _4733 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4735 = isnan(_4123);
    bool _4737 = _4733 || _4735;
    bool _4739 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4741 = _4737 || _4739;
    float _4743 = _4731;
    float _4745 = _4727;
    if (!_4741)
    {
        _4743 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4747 = _4743;
    float _4749 = _4747;
    float _4751 = _4747;
    if (!_4741)
    {
        _4745 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4753 = _4745;
    float _4755 = _4753;
    float _4757 = _4753;
    if (!_4741)
    {
        _4465 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4759 = _4465;
    bool _4761 = !_4741;
    float _4763 = _4759;
    float _4765 = _4759;
    if (!_4761)
    {
        bool _4767 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4769 = isnan(_4123);
        bool _4771 = _4767 || _4769;
        bool _4773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4775 = _4771 || _4773;
        if (!_4775)
        {
            float _4777 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4779 = _4123 + _4777;
            float _4781 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4783 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4781;
            float _4785 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4787 = _4785 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4789 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4791 = _4789 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4793 = 1.0 / _4783;
            float _4795 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4797 = _4795 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4799 = _4779 * _4793;
            float _4801 = precise::clamp(_4799, 0.0, 1.0);
            float _4803 = fma(_4801, _4787, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4805 = fma(_4801, _4791, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4807 = fma(_4801, _4797, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4757 = _4805;
            _4751 = _4803;
            _4765 = _4807;
            _4809 = true;
        }
        else
        {
            bool _4811 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4813 = isnan(_4123);
            bool _4815 = _4811 || _4813;
            bool _4817 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4819 = _4815 || _4817;
            if (!_4819)
            {
                _4749 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4821 = _4749;
            _4751 = _4821;
            if (!_4819)
            {
                _4755 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4823 = _4755;
            _4757 = _4823;
            if (!_4819)
            {
                _4763 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4825 = _4763;
            bool _4827 = !_4819;
            _4765 = _4825;
            if (!_4827)
            {
                bool _4829 = _4123 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4831 = isnan(_4123);
                bool _4833 = _4829 || _4831;
                bool _4835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4837 = _4833 || _4835;
                if (!_4837)
                {
                    float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4841 = _4123 + _4839;
                    float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4843;
                    float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4855 = 1.0 / _4845;
                    float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4859 = _4857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4861 = _4841 * _4855;
                    float _4863 = precise::clamp(_4861, 0.0, 1.0);
                    float _4865 = fma(_4863, _4849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4867 = fma(_4863, _4853, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4869 = fma(_4863, _4859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4757 = _4867;
                    _4751 = _4865;
                    _4765 = _4869;
                    _4809 = true;
                }
                else
                {
                    _4757 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4751 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4765 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4809 = false;
    float _4871 = _4757;
    float _4873 = _4751;
    float _4875 = _4765;
    float _4877 = _4871 * 0.586610972881317138671875;
    bool _4879 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4881 = _4729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4883 = fma(_4873, 0.298911988735198974609375, _4877);
    out.m_102.x = 0.0;
    float _4885 = fma(_4875, 0.114477999508380889892578125, _4883);
    out.m_61.x = _4881;
    float _4887 = -_4885;
    float _4889 = _4887 + _4873;
    float _4891 = -_4885;
    float _4893 = _4891 + _4871;
    float _4895 = -_4885;
    float _4897 = _4895 + _4875;
    float _4899 = fma(_4889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    float _4901 = fma(_4893, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    float _4903 = fma(_4897, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4885);
    out.m_104.x = _4899;
    out.m_104.y = _4901;
    out.m_104.z = _4903;
    if (!_4879)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4905 = -_3812;
    float _4907 = _4905 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4909 = -_3814;
    float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4913 = -_3816;
    float _4915 = _4913 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4917 = _4907 * _4907;
    float _4919 = fma(_4911, _4911, _4917);
    float _4921 = fma(_4915, _4915, _4919);
    float _4923 = sqrt(_4921);
    float _4925 = rsqrt(_4921);
    float _4927 = -_4923;
    float _4929 = _4927 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4931 = _4929 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4933 = precise::clamp(_4931, 0.0, 1.0);
    float _4935 = _4911 * _4925;
    float _4937 = _4907 * _4925;
    float _4939 = abs(_4933);
    float _4941 = log2(_4939);
    float _4943 = _4915 * _4925;
    float _4945 = _4935 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4947 = _3020 * _4937;
    float _4949 = -_4937;
    float _4951 = -_4945;
    float _4953 = fma(_4949, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4951);
    float _4955 = fma(_2994, _4935, _4947);
    float _4957 = -_4943;
    float _4959 = fma(_4957, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4953);
    float _4961 = fma(_3022, _4943, _4955);
    float _4963 = precise::clamp(_4961, 0.0, 1.0);
    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4967 = _4959 + _4965;
    float _4969 = _4941 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4971 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4973 = precise::clamp(_4971, 0.0, 1.0);
    float _4975 = exp2(_4969);
    float _4977 = _4975 * _4973;
    float _4979 = _4963 * _4977;
    float _4981 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4983 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4985 = _4979 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4981;
    out.m_102.y = _4983;
    out.m_102.z = _4985;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

