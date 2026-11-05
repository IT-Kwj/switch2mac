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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2671 = false;
    bool _1311 = false;
    bool _387 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2976 = as_type<float>(_131);
        out.gl_Position.z = _2976;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3045 = as_type<float>(_169);
        out.gl_Position.z = _3045;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _173 = !_171;
    float _191;
    if (!_173)
    {
        float _175 = in.m_65.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_115);
        float _197 = 1.0 / _195;
        float _199 = _149 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _201 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _219 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _223;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _241 = 1.0 / _217;
    float _243 = 1.0 / _225;
    float _245 = 1.0 / _221;
    float _247 = _205 * _241;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -_237;
    float _263 = _261 + 1.0;
    bool _265 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_201);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _259 * _263;
    float _279 = _209 * _243;
    float _281 = -_259;
    float _283 = _281 + 1.0;
    float _285 = _275 * _283;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _213 * _245;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _297 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _299 = isnan(_201);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = fma(_311, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _307 * _289;
    float _325 = fma(_315, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = fma(_319, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = -_307;
    float _333 = _331 + 1.0;
    float _335 = _321 * _323;
    float _337 = _325 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_327, _285, _343);
    float _355 = fma(_347, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = fma(_329, _285, _349);
    float _359 = fma(_351, _277, _353);
    float _361 = fma(_355, _277, _357);
    float _363 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_239;
    float _385;
    if (!_367)
    {
        float _369 = in.m_65.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_115);
        float _391 = 1.0 / _389;
        float _393 = _149 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_65.x;
    float _399 = in.m_65.y;
    float _401 = in.m_65.z;
    float _403 = in.m_65.w;
    float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _407 = log2(_405);
    float _409 = as_type<float>(int(gl_VertexIndex));
    float _411 = _407 * _149;
    float _413 = _401 * 2.0;
    float _415 = _397 * 2.0;
    float _417 = _399 * 2.0;
    float _419 = floor(_413);
    float _421 = floor(_415);
    bool _423 = _419 > 0.0;
    float _425 = floor(_417);
    bool _427 = _419 >= 0.0;
    bool _429 = isnan(_419);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    int _437 = _435 ? 0 : 1;
    bool _439 = _421 > 0.0;
    bool _441 = _421 >= 0.0;
    bool _443 = isnan(_421);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    int _451 = ~_437;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    int _457 = as_type<int>(_409) & 1;
    bool _459 = _457 != 0;
    int _461 = as_type<int>(_409) & 2;
    bool _463 = _461 != 0;
    int _465 = _449 ? 0 : 1;
    int _467 = _455;
    if (!_423)
    {
        int _469 = ~_437;
        int _471 = _469 + 1;
        _467 = _471;
    }
    int _473 = _467;
    float _475 = exp2(_411);
    int _477 = ~_465;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    int _483 = _481;
    if (!_439)
    {
        int _485 = ~_465;
        int _487 = _485 + 1;
        _483 = _487;
    }
    int _489 = _483;
    bool _491 = _403 > 0.5;
    float _493 = _399 + _401;
    bool _495 = _425 >= 0.0;
    bool _497 = isnan(_425);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _401 + _397;
    float _507 = _493 + (-1.0);
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = _505 + (-1.0);
    int _523 = _503 ? 0 : 1;
    float _525 = -_475;
    float _527 = _525 + 1.0;
    float _529 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _531 = !_511;
    int _533 = _531 ? 0 : 1;
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _537 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _549 = 1.0 + _547;
    int _551 = abs(_533);
    float _553 = _399 + _397;
    float _555 = _545 ? _527 : 0.0;
    float _557 = 1.0 / _549;
    bool _559 = _425 > 0.0;
    float _561 = _553 + (-1.0);
    float _563 = in.m_70.x;
    float _565 = in.m_70.y;
    float _567 = in.m_70.z;
    bool _569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _571 = isnan(1.0);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _577 = _573 || _575;
    float _579 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _581 = float(_473);
    float _583 = float(_551);
    int _585 = ~_523;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    int _591 = _589;
    if (!_559)
    {
        int _593 = ~_523;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _583 * _581;
    bool _601 = !_519;
    int _603 = _601 ? 0 : 1;
    float _605 = float(_597);
    if (_577)
    {
        float _607 = _555 * _557;
        _153 = _607;
    }
    float _609 = _153;
    bool _611 = !_515;
    int _613 = _611 ? 0 : 1;
    float _615 = _599 * (-2.0);
    bool _617 = _397 > 0.5;
    float _619 = _397 + (-0.5);
    float _621 = float(_489);
    float _623 = fma(_579, _615, _579);
    int _625 = abs(_613);
    float _627 = fma(_615, _563, _563);
    float _629 = float(_625);
    int _631 = abs(_603);
    float _633 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[196].x, _627);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _629 * _621;
    float _641 = float(_631);
    float _643 = fma(_623, _609, _633);
    bool _645 = _399 > 0.5;
    float _647 = in.m_72.x;
    float _649 = in.m_72.y;
    float _651 = _639 * (-2.0);
    float _653 = _641 * _605;
    float _655 = _643 * 0.15915493667125701904296875;
    float _657 = in.m_58.x;
    float _659 = in.m_58.y;
    float _661 = in.m_58.z;
    float _663 = _399 + (-0.5);
    float _665 = fma(_651, _565, _565);
    float _667 = _653 * (-2.0);
    float _669 = fma(_529, _651, _529);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].y, _665);
    float _677 = fma(_667, _567, _567);
    float _679 = _401 + (-0.5);
    float _681 = fma(_535, _667, _535);
    float _683 = fma(_669, _609, _675);
    float _685 = 1.0 / _637;
    float _687 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].z, _677);
    float _689 = _683 * 0.15915493667125701904296875;
    float _691 = fma(_681, _609, _687);
    bool _693 = !_463;
    float _695 = _693 ? (-0.5) : 0.5;
    float _697 = 1.0 / _673;
    float _699 = _363 * _647;
    float _701 = _691 * 0.15915493667125701904296875;
    float _703 = _365 * _649;
    float _705 = _659 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _707 = _659 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _709 = _659 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _711 = _655 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    float _725 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    float _727 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[6].x, _709);
    float _729 = _655 * 6.283185482025146484375;
    float _731 = cos(_729);
    float _733 = _717 * _685;
    bool _735 = !_459;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = _395 + _739;
    float _743 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _695);
    float _749 = _689 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _755 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[4].z, _723);
    float _757 = _745 * _747;
    bool _759 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _761 = isnan(_395);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = _743 * _753;
    bool _773 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _775 = isnan(_395);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _689 * 6.283185482025146484375;
    float _787 = cos(_785);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = -_783;
    float _795 = _793 + 1.0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _803 = _801 != 0;
    float _805 = _769 * _795;
    float _807 = _701 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _721 * _697;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _815 = _395 + _813;
    float _817 = _731 * _751;
    bool _819 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _821 = isnan(_395);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_811, _741, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _833 = _713 * _751;
    float _835 = fma(_733, _815, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _837 = _701 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _731 * _787;
    float _843 = _713 * _787;
    float _845 = _731 * _809;
    float _847 = _751 * _809;
    float _849 = _713 * _809;
    float _851 = _787 * _809;
    float _853 = _845 * _757;
    float _855 = -_829;
    float _857 = _855 + 1.0;
    float _859 = fma(_839, _841, _833);
    float _861 = fma(_839, _833, _841);
    float _863 = -_769;
    float _865 = _863 + 1.0;
    float _867 = -_817;
    float _869 = fma(_839, _843, _867);
    float _871 = -_757;
    float _873 = _839 * _871;
    float _875 = -_843;
    float _877 = fma(_839, _817, _875);
    float _879 = _849 * _757;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = fma(_859, _771, _853);
    float _885 = _829 * _865;
    float _887 = fma(_851, _771, _873);
    float _889 = fma(_869, _771, _879);
    float _891 = fma(_877, _881, _883);
    float _893 = _835 * _885;
    float _895 = fma(_847, _881, _887);
    float _897 = fma(_861, _881, _889);
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _909 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].x, _901);
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _915 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[6].z, _727);
    float _917 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _907);
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _909);
    float _921 = _755 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = _915 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _927 = _919 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _929 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _931 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[5].z, _725);
    float _933 = _921 + _925;
    float _935 = _923 + _927;
    float _937 = fma(_831, _805, _929);
    float _939 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _943 = _933 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _947 = _935 + _945;
    float _949 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _943 * _943;
    float _955 = _947 * _947;
    float _957 = _845 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _845 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_74.x = _939;
    out.m_74.y = _949;
    out.m_74.z = _951;
    out.m_74.w = _913;
    float _961 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[117].x, _937);
    float _963 = -_839;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _967 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _965);
    float _971 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _973 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _971);
    float _975 = _953 + _955;
    float _977 = _845 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _979 = _859 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _859 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _983 = sqrt(_975);
    float _985 = -_839;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _977);
    float _989 = -_839;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _959);
    float _993 = _859 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _995 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _981);
    float _997 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _987);
    float _999 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _991);
    float _1001 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _1003 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1005 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1007 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1009 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _993);
    float _1011 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1003);
    float _1013 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1005);
    float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1017 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1007);
    bool _1019 = _983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = _931 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1023 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1025 = _973 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1027 = -_695;
    int _1029 = _491 ? as_type<int>(_1027) : as_type<int>(_695);
    float _1031 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1013);
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _1021 + _1025;
    float _1037 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1017);
    bool _1039 = _401 > 0.5;
    float _1041 = _1025;
    float _1043 = _897;
    float _1045 = _1005;
    float _1047 = _953;
    float _1049 = _955;
    if (!_1019)
    {
        _1041 = _933;
    }
    float _1051 = _1041;
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1055 = _1051;
    if (!_1019)
    {
        _1043 = _935;
    }
    float _1057 = _1043;
    float _1059 = _1057;
    if (!_1019)
    {
        _1045 = _1035;
    }
    float _1061 = _1045;
    bool _1063 = !_1019;
    float _1065 = _1061;
    if (!_1063)
    {
        float _1067 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1071 = _983 + _1069;
        float _1073 = rsqrt(_975);
        float _1075 = _1071 * _1067;
        float _1077 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = _1075 * 0.15915493667125701904296875;
        float _1081 = _1079 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1079 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = fma(_1083, _1077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1091 = _1073 * _1089;
        float _1093 = fma(_943, _1091, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1095 = _1087 + (-1.0);
        float _1097 = fma(_947, _1091, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1093 + _1099;
        float _1103 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1107 = _1097 + _1105;
        float _1109 = _1101 * _1101;
        float _1111 = fma(_1035, _1087, _1103);
        float _1113 = _1107 * _1107;
        _1065 = _1111;
        _1047 = _1109;
        _1049 = _1113;
        _1055 = _1093;
        _1059 = _1097;
    }
    float _1115 = _1065;
    float _1117 = _1047;
    float _1119 = _1049;
    float _1121 = _1055;
    float _1123 = _1059;
    float _1125 = _695 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1127 = -_737;
    int _1129 = _617 ? as_type<int>(_1127) : as_type<int>(_737);
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1133 = _1115 + _1131;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1137 = _1135 != 0;
    float _1139 = fma(_1125, _1125, 1.0);
    float _1141 = -_695;
    int _1143 = _645 ? as_type<int>(_1141) : as_type<int>(_695);
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1147 = !_1137;
    float _1149 = _1147 ? _737 : as_type<float>(_1129);
    float _1151 = fma(_1133, _1133, _1117);
    float _1153 = -_737;
    int _1155 = _1039 ? as_type<int>(_1153) : as_type<int>(_737);
    float _1157 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _995);
    bool _1159 = !_791;
    float _1161 = _1159 ? _695 : as_type<float>(_1143);
    float _1163 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    bool _1165 = !_803;
    float _1167 = _1165 ? _695 : as_type<float>(_1029);
    float _1169 = rsqrt(_1139);
    float _1171 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1009);
    bool _1173 = !_799;
    float _1175 = _1173 ? _737 : as_type<float>(_1155);
    float _1177 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1179 = _1149 + 0.5;
    float _1181 = _1125 * _969;
    float _1183 = _1125 * _997;
    float _1185 = _1125 * _999;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1189 = fma(_1177, _1163, _1181);
    float _1191 = -_1161;
    float _1193 = _1191 + 0.5;
    float _1195 = _1175 + 0.5;
    float _1197 = -_1167;
    float _1199 = _1197 + 0.5;
    float _1201 = _1187 * _1015;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1207 = _1125 * _1169;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1211 = _1151 + _1119;
    float _1213 = _1203 * _1033;
    float _1215 = -_1023;
    float _1217 = _1207 * _1215;
    float _1219 = _1205 * _1053;
    float _1221 = _1209 * _1145;
    float _1223 = -_1031;
    float _1225 = _1207 * _1223;
    float _1227 = fma(_1169, _969, _1217);
    float _1229 = sqrt(_1211);
    float _1231 = fma(_1177, _1157, _1183);
    float _1233 = fma(_1169, _997, _1225);
    float _1235 = fma(_1177, _1171, _1185);
    float _1237 = -_1037;
    float _1239 = _1207 * _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1247 = _1023 + _1189;
    float _1249 = _1031 + _1231;
    float _1251 = fma(_1169, _999, _1239);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = _961 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1261 = _1037 + _1235;
    out.m_76.x = _1201;
    out.m_76.y = _1213;
    out.m_76.z = _1219;
    out.m_76.w = _1221;
    bool _1263 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1265 = isnan(_1229);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1271 = _1267 || _1269;
    out.m_78.x = _1253;
    out.m_78.y = _1255;
    out.m_78.z = _1257;
    out.m_78.w = _1259;
    out.m_80.x = _1163;
    out.m_80.y = _1157;
    out.m_80.z = _1171;
    out.m_82.x = _1227;
    out.m_82.y = _1233;
    out.m_82.z = _1251;
    float _1273 = _1169;
    float _1275 = _1229;
    if (!_1271)
    {
        _1273 = 1.0;
    }
    float _1277 = _1273;
    out.m_84.x = _1247;
    out.m_84.y = _1249;
    out.m_84.z = _1261;
    bool _1279 = !_1271;
    float _1281 = _1277;
    if (!_1279)
    {
        bool _1283 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1285 = isnan(_1229);
        bool _1287 = _1283 || _1285;
        bool _1289 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1291 = _1287 || _1289;
        if (!_1291)
        {
            float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1295 = _1229 + _1293;
            float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1299 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1297;
            float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1303 = _1301 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1305 = 1.0 / _1299;
            float _1307 = _1295 * _1305;
            float _1309 = fma(_1307, _1303, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1281 = _1309;
            _1311 = true;
        }
        else
        {
            bool _1313 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1315 = isnan(_1229);
            bool _1317 = _1313 || _1315;
            bool _1319 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1321 = _1317 || _1319;
            if (!_1321)
            {
                float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1325 = _1229 + _1323;
                float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1329 = _1327 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1333 = _1331 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1335 = 1.0 / _1329;
                float _1337 = _1325 * _1335;
                float _1339 = fma(_1337, _1333, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1281 = _1339;
                _1311 = true;
            }
            else
            {
                _1281 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1311 = false;
    float _1341 = _1281;
    float _1343 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1345 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1347 = floor(_1343);
    float _1349 = floor(_1345);
    float _1351 = -_1347;
    float _1353 = _1343 + _1351;
    float _1355 = -_1349;
    float _1357 = _1345 + _1355;
    float2 _4982 = float2(_1353, _1357);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4982, float2(0.0), isnan(_4982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4982, float2(0.0), isnan(_4982)), level(0.0)).x;
    float _1361 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1365 = _1121 + _1363;
    float _1367 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1361);
    float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1371 = _1123 + _1369;
    float _1373 = fma(_1365, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1375 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1367);
    float _1377 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1379 = fma(_1371, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1381 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1383 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1377);
    float _1385 = 1.0 / _1381;
    float _1387 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1383);
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1391 = _1389 + _1381;
    float _1393 = _1391 * _1385;
    float _1395 = _1393 * 0.5;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1399 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1397);
    float _1401 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1403 = _1021 + _1401;
    float _1405 = 1.0 / _1399;
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1409 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1411 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1407);
    float _1413 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1409);
    float _1415 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1411);
    float _1417 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1413);
    float _1419 = _1415 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1423 = _1405 * _1421;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1427 = trunc(_1419);
    int _1429 = int(_1427);
    bool _1431 = _1423 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1433 = _1423 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1435 = !_1431;
    int _1437 = _1435 ? 0 : 1;
    int _1439 = 2;
    int _1441 = as_type<int>(_1341);
    float _1443 = _1415;
    if (!_1431)
    {
        _1439 = 1;
    }
    int _1445 = _1439;
    int _1447 = _1445;
    if (!_1433)
    {
        _1447 = _1437;
    }
    int _1449 = _1447;
    float _1451 = trunc(_1425);
    int _1453 = int(_1451);
    int _1455 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1457 = _1429 + _1455;
    int _1459 = _1457 + 1;
    int _1461 = _1449 << 6;
    bool _1463 = _1459 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1465 = _1461 + 48;
    uint _1468 = uint(int(uint(_1465) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    int _1484 = _1461 + 56;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
    int _1502 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1504 = _1453 + _1502;
    int _1506 = _1504 + 1;
    int _1508 = _1459 | _1506;
    int _1510 = _1461 + 64;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    bool _1528 = _1508 < 0;
    bool _1530 = _1528 || _1463;
    bool _1532 = _1506 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1534 = _1532 || _1530;
    bool _1536 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    int _1546 = _1461 + 72;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1566 = _1115 + _1564;
    float _1568 = fma(_1566, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _1570 = _1461 + 96;
    uint _1572 = uint(int(uint(_1570) >> uint(2)));
    uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
    int _1576 = int(_1572) & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    int _1580 = int(_1572) + 1;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    int _1584 = _1580 & 3;
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
    float _1588 = as_type<float>(_1459);
    float _1590 = _1566;
    float _1592 = as_type<float>(_1461);
    if (!_1534)
    {
        int _1594 = _1506 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1596 = _1594 + _1459;
        _1441 = _1596;
    }
    int _1598 = _1441;
    float _1600 = as_type<float>(_1598);
    if (_1544)
    {
        _1588 = _1373;
    }
    float _1602 = _1588;
    float _1604 = _1602;
    if (_1544)
    {
        _1590 = _1568;
    }
    float _1606 = _1590;
    int _1608 = _1461 + 104;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
    int _1614 = int(_1610) & 3;
    float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
    int _1618 = int(_1610) + 1;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    int _1622 = _1618 & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    float _1626 = _1606;
    if (_1544)
    {
        _1443 = _1379;
    }
    float _1628 = _1443;
    float _1630 = _1628;
    int _1632 = as_type<int>(_1586);
    int _1634 = as_type<int>(_1578);
    if (!_1544)
    {
        float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1638 = _1021 + _1636;
        float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1642 = _921 + _1640;
        float _1644 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1646 = _1638 * _1638;
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1650 = _923 + _1648;
        float _1652 = fma(_1642, _1642, _1646);
        float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1656 = fma(_1650, _1650, _1652);
        float _1658 = sqrt(_1656);
        float _1660 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1662 = -_923;
        float _1664 = _1662 + _1379;
        float _1666 = precise::min(_1658, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1668 = _1666 * _1654;
        float _1670 = -_1021;
        float _1672 = _1670 + _1568;
        float _1674 = _1660 * _1668;
        float _1676 = -_921;
        float _1678 = _1676 + _1373;
        float _1680 = fma(_1672, _1674, _1021);
        float _1682 = fma(_1678, _1674, _921);
        float _1684 = fma(_1664, _1674, _923);
        _1626 = _1680;
        _1604 = _1682;
        _1630 = _1684;
        _1275 = _1654;
    }
    float _1686 = _1626;
    float _1688 = _1604;
    float _1690 = _1630;
    float _1692 = _1275;
    float _1694 = _1403 * _1586;
    float _1696 = _1692;
    if (!_1534)
    {
        int _1698 = _1598 << 2;
        _1632 = _1698;
    }
    int _1700 = _1632;
    float _1702 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1704 = _1461 + 88;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[int(_1708)][_1710];
    int _1714 = int(_1706) + 1;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    int _1718 = _1714 & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    float _1722 = fma(_921, _1578, _1694);
    int _1724 = _1700;
    if (!_1534)
    {
        uint _1726 = uint(int(uint(_1598) >> uint(2)));
        _1634 = int(_1726);
    }
    int _1728 = _1634;
    float _1730 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    if (!_1534)
    {
        int _1732 = 12 & _1700;
        _1724 = _1732;
    }
    int _1734 = _1724;
    float _1736 = fma(_923, _1616, _1722);
    float _1738 = _1403 * _1526;
    float _1740 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1730);
    if (!_1534)
    {
        int _1742 = _1728 << 4;
        int _1744 = _1742 + _1734;
        _1696 = as_type<float>(_1744);
    }
    float _1746 = _1696;
    float _1748 = _1736 + _1624;
    int _1750 = _1461 + 80;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    uint _1754 = uint(int(uint(int(_1752)) >> uint(2)));
    int _1756 = int(_1752) & 3;
    float _1758 = (*spvDescriptorSet0.vp_c15)._m0[int(_1754)][_1756];
    int _1760 = int(_1752) + 1;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    int _1764 = _1760 & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    float _1768 = _1403 * _1482;
    float _1770 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1772 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1774 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1776 = 1.0 / _1748;
    float _1778 = fma(_921, _1474, _1768);
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1782 = _1746;
    if (!_1534)
    {
        int _1784 = as_type<int>(_1746) + 400;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
        int _1790 = int(_1786) & 3;
        float _1792 = (*spvDescriptorSet0.vp_c15)._m0[int(_1788)][_1790];
        _1782 = _1792;
    }
    float _1794 = _1782;
    float _1796 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1774);
    float _1798 = fma(_923, _1492, _1778);
    float _1800 = -_1780;
    float _1802 = fma(_1800, _1772, 1.0);
    float _1804 = fma(_921, _1518, _1738);
    float _1806 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = _1798 + _1500;
    float _1810 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1796);
    float _1812 = fma(_923, _1554, _1804);
    float _1814 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1816 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1820 = log2(_1802);
    float _1822 = _1808 * _1776;
    float _1824 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1814);
    float _1826 = _1812 + _1562;
    float _1828 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    bool _1830 = _1822 >= 0.0;
    float _1832 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1834 = _1826 * _1776;
    float _1836 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1828);
    bool _1838 = _1822 <= 1.0;
    bool _1840 = _1838 && _1830;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1844 = _1373;
    float _1846 = _1814;
    float _1848 = _1776;
    float _1850 = _1794;
    if (!_1534)
    {
        float _1852 = floor(_1419);
        _1844 = _1852;
    }
    float _1854 = _1844;
    float _1856 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1858 = _1834 >= 0.0;
    bool _1860 = _1858 && _1840;
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1842);
    float _1864 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1866 = _1820 * 0.693147182464599609375;
    bool _1868 = _1834 <= 1.0;
    bool _1870 = _1868 && _1860;
    float _1872 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1862);
    float _1874 = _1379;
    if (!_1534)
    {
        float _1876 = floor(_1425);
        _1874 = _1876;
    }
    float _1878 = _1874;
    float _1880 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1872);
    float _1882 = _1403 * _1766;
    float _1884 = 1.0 / _1880;
    float _1886 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1870)
    {
        float _1888 = float(_1449);
        _1592 = _1888;
    }
    float _1890 = _1592;
    float _1892 = fma(_921, _1758, _1882);
    float _1894 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1864);
    float _1896 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1886);
    if (!_1534)
    {
        float _1898 = -_1854;
        float _1900 = _1419 + _1898;
        _1846 = _1900;
    }
    float _1902 = _1846;
    float _1904 = fma(_923, _1712, _1892);
    float _1906 = _1518;
    if (!_1534)
    {
        float _1908 = rint(_1794);
        float _1910 = precise::max(_1908, 0.0);
        uint _1912 = uint(_1910);
        uint _1914 = clamp(_1912, 0u, 65535u);
        _1906 = as_type<float>(_1914);
    }
    float _1916 = _1906;
    float _1918 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1896);
    float _1920 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1894);
    float _1922 = _1904 + _1720;
    float _1924 = _1878;
    if (!_1534)
    {
        float _1926 = -_1878;
        float _1928 = _1425 + _1926;
        _1924 = _1928;
    }
    float _1930 = _1924;
    float _1932 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1934 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1936 = _1922 * _1776;
    float _1938 = _1892;
    float _1940 = _1932;
    float _1942 = _1936;
    if (_1870)
    {
        float _1944 = rint(_1890);
        float _1946 = precise::max(_1944, 0.0);
        uint _1948 = uint(_1946);
        uint _1950 = clamp(_1948, 0u, 65535u);
        _1938 = as_type<float>(_1950);
    }
    float _1952 = _1938;
    float _1954 = _1932 * _1884;
    float _1956 = _1934 * _1884;
    float _1958 = fma(_1954, 0.5, 0.5);
    float _1960 = fma(_1956, -0.5, 0.5);
    float _1962 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1964 = _1916;
    if (!_1534)
    {
        float3 _6014 = float3(_1902, _1930, float(as_type<int>(_1916)));
        float3 _6018 = select(_6014, float3(0.0), isnan(_6014));
        float _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6018.xy, uint(rint(_6018.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6018.xy, uint(rint(_6018.z)), level(0.0)).x;
        _1964 = _1966;
    }
    float _1968 = _1964;
    float _1970 = _1834;
    if (_1870)
    {
        float3 _6033 = float3(_1822, _1834, float(as_type<int>(_1952)));
        float3 _6035 = select(_6033, float3(0.0), isnan(_6033));
        float _1972 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6035.xy, uint(rint(_6035.z)), _1936, level(0.0));
        _1970 = _1972;
    }
    float _1974 = _1970;
    float3 _6045 = float3(_1958, _1960, _1962);
    float _1976 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6045, float3(0.0), isnan(_6045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6045, float3(0.0), isnan(_6045)), level(0.0)).x;
    float3 _6054 = float3(_1958, _1960, _1962);
    float4 _1979 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6054, float3(0.0), isnan(_6054)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6054, float3(0.0), isnan(_6054)), level(0.0)).xyzw;
    float _1981 = _1979.x;
    float _1983 = _1979.y;
    float _1985 = _1979.z;
    float _1987 = _1979.w;
    float _1989 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1534)
    {
        _1848 = 1.0;
    }
    float _1991 = _1848;
    bool _1993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    float _2003 = _1991;
    if (_2001)
    {
        _1989 = 1.0;
    }
    float _2005 = _1989;
    float _2007 = _2005;
    if (_2001)
    {
        _1850 = 1.0;
    }
    float _2009 = _1850;
    float _2011 = _2009;
    float _2013 = _1968;
    if (!_2001)
    {
        float _2015 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2017 = _2015 * 0.15915493667125701904296875;
        float _2019 = _2017 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2025 = _2023 * 0.15915493667125701904296875;
        float _2027 = _2017 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = 1.0 / _2021;
        float _2033 = _2025 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        float _2037 = _2029 * _2031;
        float _2039 = _2025 * 6.283185482025146484375;
        float _2041 = sin(_2039);
        float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2045 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2043;
        float _2047 = _2035 * _2037;
        float _2049 = 1.0 / _2045;
        float _2051 = 1.0 / _2047;
        float _2053 = _2041 * _2051;
        float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2057 = fma(_1423, _2053, _2055);
        float _2059 = _2057 * _2049;
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        _2011 = _2061;
    }
    float _2063 = _2011;
    if (!_2001)
    {
        float _2065 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2067 * 6.283185482025146484375;
        float _2071 = cos(_2069);
        float _2073 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = _2067 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = 1.0 / _2071;
        float _2083 = _2075 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = _2075 * 6.283185482025146484375;
        float _2091 = sin(_2089);
        float _2093 = _2085 * _2087;
        float _2095 = 1.0 / _2093;
        float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2099 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2097;
        float _2101 = 1.0 / _2099;
        float _2103 = _2091 * _2095;
        float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2107 = fma(_1423, _2103, _2105);
        float _2109 = _2107 * _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + 1.0;
        _2007 = _2115;
    }
    float _2117 = _2007;
    if (!_1534)
    {
        int _2119 = _1598 << 4;
        int _2121 = _2119 + 2048;
        uint _2123 = uint(int(uint(_2121) >> uint(2)));
        uint _2125 = uint(int(uint(int(_2123)) >> uint(2)));
        int _2127 = int(_2123) & 3;
        float _2129 = (*spvDescriptorSet0.vp_c15)._m0[int(_2125)][_2127];
        int _2131 = int(_2123) + 1;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        int _2135 = _2131 & 3;
        float _2137 = (*spvDescriptorSet0.vp_c15)._m0[int(_2133)][_2135];
        int _2139 = _2121 + 8;
        uint _2141 = uint(int(uint(_2139) >> uint(2)));
        uint _2143 = uint(int(uint(int(_2141)) >> uint(2)));
        int _2145 = int(_2141) & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        int _2149 = int(_2141) + 1;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        int _2153 = _2149 & 3;
        float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
        float _2157 = _1403 * _2137;
        float _2159 = fma(_921, _2129, _2157);
        float _2161 = fma(_923, _2147, _2159);
        float _2163 = _2161 + _2155;
        float _2165 = precise::clamp(_2163, 0.0, 1.0);
        float _2167 = -_2165;
        float _2169 = _2167 + _1968;
        float _2171 = fma(_2169, 500.0, 1.5);
        float _2173 = exp2(_2171);
        float _2175 = 0.0 + _2173;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        _1600 = as_type<float>(_2121);
        _2003 = _2177;
    }
    float _2179 = _1600;
    float _2181 = _2003;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2185 = _1686 + _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2189 = _1688 + _2187;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2193 = _1690 + _2191;
    float _2195 = _2185 * _2185;
    float _2197 = fma(_2189, _2189, _2195);
    float _2199 = fma(_2193, _2193, _2197);
    float _2201 = rsqrt(_2199);
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2205 = _2189 * _2203;
    float _2207 = _2193 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 * _2207;
    float _2213 = _2209 + _2211;
    float _2215 = sqrt(_2213);
    bool _2217 = _2215 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2221 = _2215 + _2219;
    float _2223 = _2193;
    float _2225 = _2221;
    float _2227 = _2179;
    float _2229 = _2185;
    if (_2217)
    {
        float _2231 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2231;
    }
    float _2233 = _2223;
    if (_2217)
    {
        float _2235 = rsqrt(_2213);
        _2013 = _2235;
    }
    float _2237 = _2013;
    float _2239 = _2237;
    if (_2217)
    {
        float _2241 = _2221 * _2233;
        _2225 = _2241;
    }
    float _2243 = _2225;
    if (_2217)
    {
        float _2245 = _2243 * 0.15915493667125701904296875;
        _2227 = _2245;
    }
    float _2247 = _2227;
    float _2249 = _2201;
    float _2251 = _2247;
    if (_2217)
    {
        float _2253 = _2247 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        _2249 = _2255;
    }
    float _2257 = _2249;
    float _2259 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2261 = precise::max(0.0, _2259);
    float _2263 = _2197;
    float _2265 = _2261;
    float _2267 = _2259;
    if (_2217)
    {
        float _2269 = _2247 * 6.283185482025146484375;
        float _2271 = cos(_2269);
        _2263 = _2271;
    }
    float _2273 = _2263;
    float _2275 = -_2203;
    float _2277 = -_2261;
    float _2279 = fma(_2185, _2275, _2277);
    if (!_2217)
    {
        _2265 = _2207;
    }
    float _2281 = _2265;
    float _2283 = _2281;
    if (_2217)
    {
        float _2285 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2285;
    }
    float _2287 = _2267;
    float _2289 = _2257;
    float _2291 = _2287;
    if (_2217)
    {
        float _2293 = fma(_2257, _2287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2229 = _2293;
    }
    float _2295 = _2229;
    float _2297 = _2295;
    if (!_2217)
    {
        _2289 = _2205;
    }
    float _2299 = _2289;
    float _2301 = _2299;
    float _2303 = _2273;
    if (_2217)
    {
        float _2305 = _2273 + (-1.0);
        _2291 = _2305;
    }
    float _2307 = _2291;
    float _2309 = 0.0;
    if (_2217)
    {
        float _2311 = _2237 * _2295;
        _2309 = _2311;
    }
    float _2313 = _2309;
    if (!_2217)
    {
        _2297 = _2279;
    }
    float _2315 = _2297;
    float _2317 = _2315;
    if (_2217)
    {
        float _2319 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2251 = _2319;
    }
    float _2321 = _2251;
    if (_2217)
    {
        float _2323 = _2205 * _2313;
        _2301 = _2323;
    }
    float _2325 = _2301;
    if (!_2217)
    {
        _2239 = _2209;
    }
    float _2327 = _2239;
    float _2329 = _2327;
    if (_2217)
    {
        float _2331 = _2207 * _2313;
        _2283 = _2331;
    }
    float _2333 = _2283;
    if (_2217)
    {
        float _2335 = fma(_2279, _2273, _2321);
        _2317 = _2335;
    }
    float _2337 = _2317;
    if (_2217)
    {
        float _2339 = _2325 * _2325;
        _2329 = _2339;
    }
    float _2341 = _2329;
    if (!_2217)
    {
        _2303 = _2211;
    }
    float _2343 = _2303;
    float _2345 = _2343;
    if (_2217)
    {
        float _2347 = _2333 * _2333;
        _2345 = _2347;
    }
    float _2349 = _2345;
    float _2351 = sqrt(_2199);
    float _2353 = fma(_2337, _2337, _2341);
    float _2355 = _2353 + _2349;
    float _2357 = rsqrt(_2355);
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2359);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = -_2363;
    float _2367 = _2365 + 1.0;
    float _2369 = _2357 * _2325;
    float _2371 = _2357 * _2337;
    float _2373 = _2357 * _2333;
    float _2375 = abs(_2367);
    float _2377 = log2(_2375);
    float _2379 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2381 = -_2379;
    float _2383 = fma(_2371, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2381);
    float _2385 = -_2373;
    float _2387 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2383);
    float _2389 = fma(_2387, -0.5, 0.5);
    float _2391 = fma(_2387, 0.5, 0.5);
    float _2393 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2395 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2397 = sqrt(_2389);
    float _2399 = fma(_2391, _2395, -0.212114393711090087890625);
    float _2401 = _2371 + 1.0;
    float _2403 = fma(_2391, _2399, 1.570728778839111328125);
    float _2405 = exp2(_2393);
    float _2407 = _2397 * 0.636619746685028076171875;
    float _2409 = -_2371;
    float _2411 = fma(_2405, _2401, _2409);
    float _2413 = -_2403;
    float _2415 = fma(_2407, _2413, 1.0);
    float _2417 = fma(_2411, 0.5, 0.5);
    float2 _6699 = float2(_2415, _2417);
    float3 _2421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6699, float2(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6699, float2(0.0), isnan(_6699)), level(0.0)).xyz;
    float _2423 = _2421.x;
    float _2425 = _2421.y;
    float _2427 = _2421.z;
    float _2429 = abs(_1423);
    float _2431 = log2(_2429);
    float _2433 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2435 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2437 = -_1359;
    float _2439 = _2437 + 1.0;
    out.m_86.x = _1688;
    out.m_86.y = _1686;
    out.m_86.z = _1690;
    float _2441 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2433);
    float _2443 = exp2(_2435);
    float _2445 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2441);
    bool _2447 = _1423 <= 8000.0;
    bool _2449 = isnan(_1423);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan(8000.0);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2445);
    float _2461 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2463 = _2459 + _1880;
    out.gl_Position.x = _1932;
    out.gl_Position.y = _1934;
    out.gl_Position.z = _2459;
    out.gl_Position.w = _1880;
    float _2465 = _2463 * 0.5;
    float _2467 = exp2(_2461);
    out.m_88.z = _2465;
    out.m_88.w = _1880;
    float _2469 = -_2443;
    float _2471 = _2469 + 1.0;
    float _2473 = _2459;
    if (!_1870)
    {
        _1940 = 1.0;
    }
    float _2475 = _1940;
    float _2477 = _2475;
    if (_1870)
    {
        bool _2479 = _1974 >= _1936;
        bool _2481 = isnan(_1974);
        bool _2483 = _2479 || _2481;
        bool _2485 = isnan(_1936);
        bool _2487 = _2483 || _2485;
        float _2489 = float(_2487);
        _2477 = _2489;
    }
    float _2491 = _2477;
    float _2493 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2495 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2497 = isnan(_2351);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2503 = _2499 || _2501;
    float _2505 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = _2493 * _1976;
    float _2511 = _2491 * _2181;
    float _2513 = fma(_2507, -2.0, 3.0);
    float _2515 = _2507 * _2507;
    float _2517 = _1987 * _2509;
    float _2519 = -_2493;
    float _2521 = _2519 + 1.0;
    float _2523 = _2515 * _2513;
    float _2525 = _2511;
    float _2527 = _2521;
    float _2529 = _2517;
    if (!_2503)
    {
        _1942 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2531 = _1942;
    float _2533 = -_2523;
    float _2535 = _2533 + 1.0;
    float _2537 = _2531;
    float _2539 = _2531;
    if (!_2503)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2541 = _2473;
    float _2543 = fma(_2535, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2523);
    float _2545 = _2457 * _2543;
    float _2547 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2549 = _2439 * _2547;
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2551;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2557 = -_2511;
    float _2559 = fma(_2557, _2555, 1.0);
    float _2561 = precise::clamp(_2559, 0.0, 1.0);
    float _2563 = _2541;
    float _2565 = _2541;
    if (!_2503)
    {
        _2525 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2567 = _2525;
    float _2569 = _2561 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2571 = _2063 * _2117;
    out.m_90.x = _2569;
    float _2573 = _2571 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2575 = _2571;
    float _2577 = _2567;
    float _2579 = _2567;
    if (!_2503)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2575;
    float _2583 = _2427 * _2509;
    float _2585 = fma(_2423, _2517, _1981);
    float _2587 = fma(_2425, _2517, _1983);
    float _2589 = _1987 * _2521;
    float _2591 = fma(_1987, _2583, _1985);
    float _2593 = _2581;
    float _2595 = _2581;
    if (!_2503)
    {
        _2527 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2597 = _2527;
    float _2599 = _2597;
    float _2601 = _2597;
    if (!_2503)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2603 = _2529;
    out.m_92.x = _2585;
    out.m_92.y = _2587;
    out.m_92.z = _2591;
    out.m_92.w = _2589;
    bool _2605 = !_2503;
    float _2607 = _2603;
    float _2609 = _2603;
    if (!_2605)
    {
        bool _2611 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2613 = isnan(_2351);
        bool _2615 = _2611 || _2613;
        bool _2617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2619 = _2615 || _2617;
        if (!_2619)
        {
            float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2623 = _2351 + _2621;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2627 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2625;
            float _2629 = 1.0 / _2627;
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2651 = _2623 * _2629;
            float _2653 = precise::clamp(_2651, 0.0, 1.0);
            float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2659 = fma(_2653, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2661 = fma(_2653, _2657, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2663 = fma(_2653, _2637, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2665 = fma(_2653, _2641, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2667 = fma(_2653, _2645, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2669 = fma(_2653, _2649, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2659;
            _2609 = _2667;
            _2539 = _2661;
            _2601 = _2665;
            _2579 = _2663;
            _2595 = _2669;
            _2671 = true;
        }
        else
        {
            bool _2673 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2675 = isnan(_2351);
            bool _2677 = _2673 || _2675;
            bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2681 = _2677 || _2679;
            if (!_2681)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2683 = _2537;
            _2539 = _2683;
            if (!_2681)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2685 = _2563;
            _2565 = _2685;
            if (!_2681)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2687 = _2577;
            _2579 = _2687;
            if (!_2681)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2689 = _2599;
            _2601 = _2689;
            if (!_2681)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2691 = _2607;
            _2609 = _2691;
            if (!_2681)
            {
                _2593 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2693 = _2593;
            bool _2695 = !_2681;
            _2595 = _2693;
            if (!_2695)
            {
                bool _2697 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2699 = isnan(_2351);
                bool _2701 = _2697 || _2699;
                bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2705 = _2701 || _2703;
                if (!_2705)
                {
                    float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2709 = _2351 + _2707;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2713 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2711;
                    float _2715 = 1.0 / _2713;
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2737 = _2709 * _2715;
                    float _2739 = precise::clamp(_2737, 0.0, 1.0);
                    float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2745 = fma(_2739, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2747 = fma(_2739, _2743, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2749 = fma(_2739, _2723, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2751 = fma(_2739, _2727, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2753 = fma(_2739, _2731, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2755 = fma(_2739, _2735, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2745;
                    _2609 = _2753;
                    _2539 = _2747;
                    _2601 = _2751;
                    _2579 = _2749;
                    _2595 = _2755;
                    _2671 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2595 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2671 = false;
    float _2757 = _2565;
    float _2759 = _2609;
    float _2761 = _2539;
    float _2763 = _2601;
    float _2765 = _2579;
    float _2767 = _2595;
    float _2769 = fma(_1249, -0.5, 0.5);
    float _2771 = precise::clamp(_2769, 0.0, 1.0);
    float _2773 = -_2757;
    float _2775 = _2773 + _2759;
    float _2777 = _2573 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2779 = -_2761;
    float _2781 = _2779 + _2763;
    out.m_94.x = 0.0;
    float _2783 = fma(_2771, _2775, _2757);
    float _2785 = fma(_2771, _2781, _2761);
    out.m_61.x = _2777;
    float _2787 = -_2765;
    float _2789 = _2787 + _2767;
    float _2791 = _2783 * 0.586610972881317138671875;
    bool _2793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2795 = fma(_2771, _2789, _2765);
    float _2797 = fma(_2785, 0.298911988735198974609375, _2791);
    bool _2799 = _2063 > 0.0;
    bool _2801 = isnan(_2063);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan(0.0);
    bool _2807 = _2803 || _2805;
    float _2809 = fma(_2795, 0.114477999508380889892578125, _2797);
    bool _2811 = _2117 <= 0.0;
    bool _2813 = !_2807;
    bool _2815 = _2811 || _2813;
    float _2817 = -_2809;
    float _2819 = _2785 + _2817;
    float _2821 = -_2809;
    float _2823 = _2783 + _2821;
    float _2825 = -_2809;
    float _2827 = _2795 + _2825;
    float _2829 = fma(_2819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    float _2831 = fma(_2823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    float _2833 = fma(_2827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    bool _2835 = !_2793;
    if (!_2835)
    {
        float _2837 = -_1686;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2841 = -_1688;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2845 = -_1690;
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2849 = _2839 * _2839;
        float _2851 = fma(_2843, _2843, _2849);
        float _2853 = fma(_2847, _2847, _2851);
        float _2855 = sqrt(_2853);
        float _2857 = rsqrt(_2853);
        float _2859 = -_2855;
        float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2863 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2865 = precise::clamp(_2863, 0.0, 1.0);
        float _2867 = _2843 * _2857;
        float _2869 = _2839 * _2857;
        float _2871 = abs(_2865);
        float _2873 = log2(_2871);
        float _2875 = _2847 * _2857;
        float _2877 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2879 = _1249 * _2869;
        float _2881 = -_2869;
        float _2883 = -_2877;
        float _2885 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2883);
        float _2887 = fma(_1247, _2867, _2879);
        float _2889 = -_2875;
        float _2891 = fma(_2889, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2885);
        float _2893 = fma(_1261, _2875, _2887);
        float _2895 = precise::clamp(_2893, 0.0, 1.0);
        float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2899 = _2891 + _2897;
        float _2901 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2903 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        float _2907 = exp2(_2901);
        float _2909 = _2907 * _2905;
        float _2911 = _2895 * _2909;
        float _2913 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2915 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2917 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2913;
        out.m_94.y = _2915;
        out.m_94.z = _2917;
    }
    out.m_96.x = _2829;
    out.m_96.y = _2831;
    out.m_96.z = _2833;
    if (!_2815)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2919 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2919;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2671 = false;
    bool _1311 = false;
    bool _387 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2976 = as_type<float>(_131);
        out.gl_Position.z = _2976;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3045 = as_type<float>(_169);
        out.gl_Position.z = _3045;
    }
    if (_163)
    {
        return out;
    }
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _173 = !_171;
    float _191;
    if (!_173)
    {
        float _175 = in.m_65.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_115);
        float _197 = 1.0 / _195;
        float _199 = _149 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _201 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _219 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _223;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _241 = 1.0 / _217;
    float _243 = 1.0 / _225;
    float _245 = 1.0 / _221;
    float _247 = _205 * _241;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -_237;
    float _263 = _261 + 1.0;
    bool _265 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_201);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _259 * _263;
    float _279 = _209 * _243;
    float _281 = -_259;
    float _283 = _281 + 1.0;
    float _285 = _275 * _283;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _213 * _245;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _297 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _299 = isnan(_201);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = fma(_311, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _307 * _289;
    float _325 = fma(_315, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = fma(_319, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = -_307;
    float _333 = _331 + 1.0;
    float _335 = _321 * _323;
    float _337 = _325 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_327, _285, _343);
    float _355 = fma(_347, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = fma(_329, _285, _349);
    float _359 = fma(_351, _277, _353);
    float _361 = fma(_355, _277, _357);
    float _363 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_239;
    float _385;
    if (!_367)
    {
        float _369 = in.m_65.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_115);
        float _391 = 1.0 / _389;
        float _393 = _149 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_65.x;
    float _399 = in.m_65.y;
    float _401 = in.m_65.z;
    float _403 = in.m_65.w;
    float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _407 = log2(_405);
    float _409 = as_type<float>(int(gl_VertexIndex));
    float _411 = _407 * _149;
    float _413 = _401 * 2.0;
    float _415 = _397 * 2.0;
    float _417 = _399 * 2.0;
    float _419 = floor(_413);
    float _421 = floor(_415);
    bool _423 = _419 > 0.0;
    float _425 = floor(_417);
    bool _427 = _419 >= 0.0;
    bool _429 = isnan(_419);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    int _437 = _435 ? 0 : 1;
    bool _439 = _421 > 0.0;
    bool _441 = _421 >= 0.0;
    bool _443 = isnan(_421);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    int _451 = ~_437;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    int _457 = as_type<int>(_409) & 1;
    bool _459 = _457 != 0;
    int _461 = as_type<int>(_409) & 2;
    bool _463 = _461 != 0;
    int _465 = _449 ? 0 : 1;
    int _467 = _455;
    if (!_423)
    {
        int _469 = ~_437;
        int _471 = _469 + 1;
        _467 = _471;
    }
    int _473 = _467;
    float _475 = exp2(_411);
    int _477 = ~_465;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    int _483 = _481;
    if (!_439)
    {
        int _485 = ~_465;
        int _487 = _485 + 1;
        _483 = _487;
    }
    int _489 = _483;
    bool _491 = _403 > 0.5;
    float _493 = _399 + _401;
    bool _495 = _425 >= 0.0;
    bool _497 = isnan(_425);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _401 + _397;
    float _507 = _493 + (-1.0);
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = _505 + (-1.0);
    int _523 = _503 ? 0 : 1;
    float _525 = -_475;
    float _527 = _525 + 1.0;
    float _529 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _531 = !_511;
    int _533 = _531 ? 0 : 1;
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _537 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _549 = 1.0 + _547;
    int _551 = abs(_533);
    float _553 = _399 + _397;
    float _555 = _545 ? _527 : 0.0;
    float _557 = 1.0 / _549;
    bool _559 = _425 > 0.0;
    float _561 = _553 + (-1.0);
    float _563 = in.m_70.x;
    float _565 = in.m_70.y;
    float _567 = in.m_70.z;
    bool _569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _571 = isnan(1.0);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _577 = _573 || _575;
    float _579 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _581 = float(_473);
    float _583 = float(_551);
    int _585 = ~_523;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    int _591 = _589;
    if (!_559)
    {
        int _593 = ~_523;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _583 * _581;
    bool _601 = !_519;
    int _603 = _601 ? 0 : 1;
    float _605 = float(_597);
    if (_577)
    {
        float _607 = _555 * _557;
        _153 = _607;
    }
    float _609 = _153;
    bool _611 = !_515;
    int _613 = _611 ? 0 : 1;
    float _615 = _599 * (-2.0);
    bool _617 = _397 > 0.5;
    float _619 = _397 + (-0.5);
    float _621 = float(_489);
    float _623 = fma(_579, _615, _579);
    int _625 = abs(_613);
    float _627 = fma(_615, _563, _563);
    float _629 = float(_625);
    int _631 = abs(_603);
    float _633 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[196].x, _627);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _629 * _621;
    float _641 = float(_631);
    float _643 = fma(_623, _609, _633);
    bool _645 = _399 > 0.5;
    float _647 = in.m_72.x;
    float _649 = in.m_72.y;
    float _651 = _639 * (-2.0);
    float _653 = _641 * _605;
    float _655 = _643 * 0.15915493667125701904296875;
    float _657 = in.m_58.x;
    float _659 = in.m_58.y;
    float _661 = in.m_58.z;
    float _663 = _399 + (-0.5);
    float _665 = fma(_651, _565, _565);
    float _667 = _653 * (-2.0);
    float _669 = fma(_529, _651, _529);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].y, _665);
    float _677 = fma(_667, _567, _567);
    float _679 = _401 + (-0.5);
    float _681 = fma(_535, _667, _535);
    float _683 = fma(_669, _609, _675);
    float _685 = 1.0 / _637;
    float _687 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].z, _677);
    float _689 = _683 * 0.15915493667125701904296875;
    float _691 = fma(_681, _609, _687);
    bool _693 = !_463;
    float _695 = _693 ? (-0.5) : 0.5;
    float _697 = 1.0 / _673;
    float _699 = _363 * _647;
    float _701 = _691 * 0.15915493667125701904296875;
    float _703 = _365 * _649;
    float _705 = _659 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _707 = _659 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _709 = _659 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _711 = _655 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    float _725 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    float _727 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[6].x, _709);
    float _729 = _655 * 6.283185482025146484375;
    float _731 = cos(_729);
    float _733 = _717 * _685;
    bool _735 = !_459;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = _395 + _739;
    float _743 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _695);
    float _749 = _689 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _755 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[4].z, _723);
    float _757 = _745 * _747;
    bool _759 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _761 = isnan(_395);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = _743 * _753;
    bool _773 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _775 = isnan(_395);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _689 * 6.283185482025146484375;
    float _787 = cos(_785);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = -_783;
    float _795 = _793 + 1.0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _803 = _801 != 0;
    float _805 = _769 * _795;
    float _807 = _701 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _721 * _697;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _815 = _395 + _813;
    float _817 = _731 * _751;
    bool _819 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _821 = isnan(_395);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_811, _741, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _833 = _713 * _751;
    float _835 = fma(_733, _815, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _837 = _701 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _731 * _787;
    float _843 = _713 * _787;
    float _845 = _731 * _809;
    float _847 = _751 * _809;
    float _849 = _713 * _809;
    float _851 = _787 * _809;
    float _853 = _845 * _757;
    float _855 = -_829;
    float _857 = _855 + 1.0;
    float _859 = fma(_839, _841, _833);
    float _861 = fma(_839, _833, _841);
    float _863 = -_769;
    float _865 = _863 + 1.0;
    float _867 = -_817;
    float _869 = fma(_839, _843, _867);
    float _871 = -_757;
    float _873 = _839 * _871;
    float _875 = -_843;
    float _877 = fma(_839, _817, _875);
    float _879 = _849 * _757;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = fma(_859, _771, _853);
    float _885 = _829 * _865;
    float _887 = fma(_851, _771, _873);
    float _889 = fma(_869, _771, _879);
    float _891 = fma(_877, _881, _883);
    float _893 = _835 * _885;
    float _895 = fma(_847, _881, _887);
    float _897 = fma(_861, _881, _889);
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _909 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].x, _901);
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _915 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[6].z, _727);
    float _917 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _907);
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _909);
    float _921 = _755 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = _915 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _927 = _919 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _929 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _931 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[5].z, _725);
    float _933 = _921 + _925;
    float _935 = _923 + _927;
    float _937 = fma(_831, _805, _929);
    float _939 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _943 = _933 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _947 = _935 + _945;
    float _949 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _943 * _943;
    float _955 = _947 * _947;
    float _957 = _845 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _845 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_74.x = _939;
    out.m_74.y = _949;
    out.m_74.z = _951;
    out.m_74.w = _913;
    float _961 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[117].x, _937);
    float _963 = -_839;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _967 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _965);
    float _971 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _973 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _971);
    float _975 = _953 + _955;
    float _977 = _845 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _979 = _859 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _859 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _983 = sqrt(_975);
    float _985 = -_839;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _977);
    float _989 = -_839;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _959);
    float _993 = _859 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _995 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _981);
    float _997 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _987);
    float _999 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _991);
    float _1001 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _1003 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1005 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1007 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1009 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _993);
    float _1011 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1003);
    float _1013 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1005);
    float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1017 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1007);
    bool _1019 = _983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = _931 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1023 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1025 = _973 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1027 = -_695;
    int _1029 = _491 ? as_type<int>(_1027) : as_type<int>(_695);
    float _1031 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1013);
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _1021 + _1025;
    float _1037 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1017);
    bool _1039 = _401 > 0.5;
    float _1041 = _1025;
    float _1043 = _897;
    float _1045 = _1005;
    float _1047 = _953;
    float _1049 = _955;
    if (!_1019)
    {
        _1041 = _933;
    }
    float _1051 = _1041;
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1055 = _1051;
    if (!_1019)
    {
        _1043 = _935;
    }
    float _1057 = _1043;
    float _1059 = _1057;
    if (!_1019)
    {
        _1045 = _1035;
    }
    float _1061 = _1045;
    bool _1063 = !_1019;
    float _1065 = _1061;
    if (!_1063)
    {
        float _1067 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1071 = _983 + _1069;
        float _1073 = rsqrt(_975);
        float _1075 = _1071 * _1067;
        float _1077 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = _1075 * 0.15915493667125701904296875;
        float _1081 = _1079 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1079 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = fma(_1083, _1077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1091 = _1073 * _1089;
        float _1093 = fma(_943, _1091, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1095 = _1087 + (-1.0);
        float _1097 = fma(_947, _1091, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1093 + _1099;
        float _1103 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1107 = _1097 + _1105;
        float _1109 = _1101 * _1101;
        float _1111 = fma(_1035, _1087, _1103);
        float _1113 = _1107 * _1107;
        _1065 = _1111;
        _1047 = _1109;
        _1049 = _1113;
        _1055 = _1093;
        _1059 = _1097;
    }
    float _1115 = _1065;
    float _1117 = _1047;
    float _1119 = _1049;
    float _1121 = _1055;
    float _1123 = _1059;
    float _1125 = _695 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1127 = -_737;
    int _1129 = _617 ? as_type<int>(_1127) : as_type<int>(_737);
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1133 = _1115 + _1131;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1137 = _1135 != 0;
    float _1139 = fma(_1125, _1125, 1.0);
    float _1141 = -_695;
    int _1143 = _645 ? as_type<int>(_1141) : as_type<int>(_695);
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1147 = !_1137;
    float _1149 = _1147 ? _737 : as_type<float>(_1129);
    float _1151 = fma(_1133, _1133, _1117);
    float _1153 = -_737;
    int _1155 = _1039 ? as_type<int>(_1153) : as_type<int>(_737);
    float _1157 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _995);
    bool _1159 = !_791;
    float _1161 = _1159 ? _695 : as_type<float>(_1143);
    float _1163 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    bool _1165 = !_803;
    float _1167 = _1165 ? _695 : as_type<float>(_1029);
    float _1169 = rsqrt(_1139);
    float _1171 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1009);
    bool _1173 = !_799;
    float _1175 = _1173 ? _737 : as_type<float>(_1155);
    float _1177 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1179 = _1149 + 0.5;
    float _1181 = _1125 * _969;
    float _1183 = _1125 * _997;
    float _1185 = _1125 * _999;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1189 = fma(_1177, _1163, _1181);
    float _1191 = -_1161;
    float _1193 = _1191 + 0.5;
    float _1195 = _1175 + 0.5;
    float _1197 = -_1167;
    float _1199 = _1197 + 0.5;
    float _1201 = _1187 * _1015;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1207 = _1125 * _1169;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1211 = _1151 + _1119;
    float _1213 = _1203 * _1033;
    float _1215 = -_1023;
    float _1217 = _1207 * _1215;
    float _1219 = _1205 * _1053;
    float _1221 = _1209 * _1145;
    float _1223 = -_1031;
    float _1225 = _1207 * _1223;
    float _1227 = fma(_1169, _969, _1217);
    float _1229 = sqrt(_1211);
    float _1231 = fma(_1177, _1157, _1183);
    float _1233 = fma(_1169, _997, _1225);
    float _1235 = fma(_1177, _1171, _1185);
    float _1237 = -_1037;
    float _1239 = _1207 * _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1247 = _1023 + _1189;
    float _1249 = _1031 + _1231;
    float _1251 = fma(_1169, _999, _1239);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = _961 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1261 = _1037 + _1235;
    out.m_76.x = _1201;
    out.m_76.y = _1213;
    out.m_76.z = _1219;
    out.m_76.w = _1221;
    bool _1263 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1265 = isnan(_1229);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1271 = _1267 || _1269;
    out.m_78.x = _1253;
    out.m_78.y = _1255;
    out.m_78.z = _1257;
    out.m_78.w = _1259;
    out.m_80.x = _1163;
    out.m_80.y = _1157;
    out.m_80.z = _1171;
    out.m_82.x = _1227;
    out.m_82.y = _1233;
    out.m_82.z = _1251;
    float _1273 = _1169;
    float _1275 = _1229;
    if (!_1271)
    {
        _1273 = 1.0;
    }
    float _1277 = _1273;
    out.m_84.x = _1247;
    out.m_84.y = _1249;
    out.m_84.z = _1261;
    bool _1279 = !_1271;
    float _1281 = _1277;
    if (!_1279)
    {
        bool _1283 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1285 = isnan(_1229);
        bool _1287 = _1283 || _1285;
        bool _1289 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1291 = _1287 || _1289;
        if (!_1291)
        {
            float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1295 = _1229 + _1293;
            float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1299 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1297;
            float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1303 = _1301 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1305 = 1.0 / _1299;
            float _1307 = _1295 * _1305;
            float _1309 = fma(_1307, _1303, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1281 = _1309;
            _1311 = true;
        }
        else
        {
            bool _1313 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1315 = isnan(_1229);
            bool _1317 = _1313 || _1315;
            bool _1319 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1321 = _1317 || _1319;
            if (!_1321)
            {
                float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1325 = _1229 + _1323;
                float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1329 = _1327 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1333 = _1331 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1335 = 1.0 / _1329;
                float _1337 = _1325 * _1335;
                float _1339 = fma(_1337, _1333, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1281 = _1339;
                _1311 = true;
            }
            else
            {
                _1281 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1311 = false;
    float _1341 = _1281;
    float _1343 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1345 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1347 = floor(_1343);
    float _1349 = floor(_1345);
    float _1351 = -_1347;
    float _1353 = _1343 + _1351;
    float _1355 = -_1349;
    float _1357 = _1345 + _1355;
    float2 _4982 = float2(_1353, _1357);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4982, float2(0.0), isnan(_4982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4982, float2(0.0), isnan(_4982)), level(0.0)).x;
    float _1361 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1365 = _1121 + _1363;
    float _1367 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1361);
    float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1371 = _1123 + _1369;
    float _1373 = fma(_1365, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1375 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1367);
    float _1377 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1379 = fma(_1371, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1381 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1383 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1377);
    float _1385 = 1.0 / _1381;
    float _1387 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1383);
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1391 = _1389 + _1381;
    float _1393 = _1391 * _1385;
    float _1395 = _1393 * 0.5;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1399 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1397);
    float _1401 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1403 = _1021 + _1401;
    float _1405 = 1.0 / _1399;
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1409 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1411 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1407);
    float _1413 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1409);
    float _1415 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1411);
    float _1417 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1413);
    float _1419 = _1415 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1423 = _1405 * _1421;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1427 = trunc(_1419);
    int _1429 = int(_1427);
    bool _1431 = _1423 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1433 = _1423 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1435 = !_1431;
    int _1437 = _1435 ? 0 : 1;
    int _1439 = 2;
    int _1441 = as_type<int>(_1341);
    float _1443 = _1415;
    if (!_1431)
    {
        _1439 = 1;
    }
    int _1445 = _1439;
    int _1447 = _1445;
    if (!_1433)
    {
        _1447 = _1437;
    }
    int _1449 = _1447;
    float _1451 = trunc(_1425);
    int _1453 = int(_1451);
    int _1455 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1457 = _1429 + _1455;
    int _1459 = _1457 + 1;
    int _1461 = _1449 << 6;
    bool _1463 = _1459 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1465 = _1461 + 48;
    uint _1468 = uint(int(uint(_1465) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    int _1484 = _1461 + 56;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
    int _1502 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1504 = _1453 + _1502;
    int _1506 = _1504 + 1;
    int _1508 = _1459 | _1506;
    int _1510 = _1461 + 64;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    bool _1528 = _1508 < 0;
    bool _1530 = _1528 || _1463;
    bool _1532 = _1506 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1534 = _1532 || _1530;
    bool _1536 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    int _1546 = _1461 + 72;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1566 = _1115 + _1564;
    float _1568 = fma(_1566, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _1570 = _1461 + 96;
    uint _1572 = uint(int(uint(_1570) >> uint(2)));
    uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
    int _1576 = int(_1572) & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    int _1580 = int(_1572) + 1;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    int _1584 = _1580 & 3;
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
    float _1588 = as_type<float>(_1459);
    float _1590 = _1566;
    float _1592 = as_type<float>(_1461);
    if (!_1534)
    {
        int _1594 = _1506 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1596 = _1594 + _1459;
        _1441 = _1596;
    }
    int _1598 = _1441;
    float _1600 = as_type<float>(_1598);
    if (_1544)
    {
        _1588 = _1373;
    }
    float _1602 = _1588;
    float _1604 = _1602;
    if (_1544)
    {
        _1590 = _1568;
    }
    float _1606 = _1590;
    int _1608 = _1461 + 104;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
    int _1614 = int(_1610) & 3;
    float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
    int _1618 = int(_1610) + 1;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    int _1622 = _1618 & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    float _1626 = _1606;
    if (_1544)
    {
        _1443 = _1379;
    }
    float _1628 = _1443;
    float _1630 = _1628;
    int _1632 = as_type<int>(_1586);
    int _1634 = as_type<int>(_1578);
    if (!_1544)
    {
        float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1638 = _1021 + _1636;
        float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1642 = _921 + _1640;
        float _1644 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1646 = _1638 * _1638;
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1650 = _923 + _1648;
        float _1652 = fma(_1642, _1642, _1646);
        float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1656 = fma(_1650, _1650, _1652);
        float _1658 = sqrt(_1656);
        float _1660 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1662 = -_923;
        float _1664 = _1662 + _1379;
        float _1666 = precise::min(_1658, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1668 = _1666 * _1654;
        float _1670 = -_1021;
        float _1672 = _1670 + _1568;
        float _1674 = _1660 * _1668;
        float _1676 = -_921;
        float _1678 = _1676 + _1373;
        float _1680 = fma(_1672, _1674, _1021);
        float _1682 = fma(_1678, _1674, _921);
        float _1684 = fma(_1664, _1674, _923);
        _1626 = _1680;
        _1604 = _1682;
        _1630 = _1684;
        _1275 = _1654;
    }
    float _1686 = _1626;
    float _1688 = _1604;
    float _1690 = _1630;
    float _1692 = _1275;
    float _1694 = _1403 * _1586;
    float _1696 = _1692;
    if (!_1534)
    {
        int _1698 = _1598 << 2;
        _1632 = _1698;
    }
    int _1700 = _1632;
    float _1702 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1704 = _1461 + 88;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[int(_1708)][_1710];
    int _1714 = int(_1706) + 1;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    int _1718 = _1714 & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    float _1722 = fma(_921, _1578, _1694);
    int _1724 = _1700;
    if (!_1534)
    {
        uint _1726 = uint(int(uint(_1598) >> uint(2)));
        _1634 = int(_1726);
    }
    int _1728 = _1634;
    float _1730 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    if (!_1534)
    {
        int _1732 = 12 & _1700;
        _1724 = _1732;
    }
    int _1734 = _1724;
    float _1736 = fma(_923, _1616, _1722);
    float _1738 = _1403 * _1526;
    float _1740 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1730);
    if (!_1534)
    {
        int _1742 = _1728 << 4;
        int _1744 = _1742 + _1734;
        _1696 = as_type<float>(_1744);
    }
    float _1746 = _1696;
    float _1748 = _1736 + _1624;
    int _1750 = _1461 + 80;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    uint _1754 = uint(int(uint(int(_1752)) >> uint(2)));
    int _1756 = int(_1752) & 3;
    float _1758 = (*spvDescriptorSet0.vp_c15)._m0[int(_1754)][_1756];
    int _1760 = int(_1752) + 1;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    int _1764 = _1760 & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    float _1768 = _1403 * _1482;
    float _1770 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1772 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1774 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1776 = 1.0 / _1748;
    float _1778 = fma(_921, _1474, _1768);
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1782 = _1746;
    if (!_1534)
    {
        int _1784 = as_type<int>(_1746) + 400;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
        int _1790 = int(_1786) & 3;
        float _1792 = (*spvDescriptorSet0.vp_c15)._m0[int(_1788)][_1790];
        _1782 = _1792;
    }
    float _1794 = _1782;
    float _1796 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1774);
    float _1798 = fma(_923, _1492, _1778);
    float _1800 = -_1780;
    float _1802 = fma(_1800, _1772, 1.0);
    float _1804 = fma(_921, _1518, _1738);
    float _1806 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = _1798 + _1500;
    float _1810 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1796);
    float _1812 = fma(_923, _1554, _1804);
    float _1814 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1816 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1820 = log2(_1802);
    float _1822 = _1808 * _1776;
    float _1824 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1814);
    float _1826 = _1812 + _1562;
    float _1828 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    bool _1830 = _1822 >= 0.0;
    float _1832 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1834 = _1826 * _1776;
    float _1836 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1828);
    bool _1838 = _1822 <= 1.0;
    bool _1840 = _1838 && _1830;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1844 = _1373;
    float _1846 = _1814;
    float _1848 = _1776;
    float _1850 = _1794;
    if (!_1534)
    {
        float _1852 = floor(_1419);
        _1844 = _1852;
    }
    float _1854 = _1844;
    float _1856 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1858 = _1834 >= 0.0;
    bool _1860 = _1858 && _1840;
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1842);
    float _1864 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1866 = _1820 * 0.693147182464599609375;
    bool _1868 = _1834 <= 1.0;
    bool _1870 = _1868 && _1860;
    float _1872 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1862);
    float _1874 = _1379;
    if (!_1534)
    {
        float _1876 = floor(_1425);
        _1874 = _1876;
    }
    float _1878 = _1874;
    float _1880 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1872);
    float _1882 = _1403 * _1766;
    float _1884 = 1.0 / _1880;
    float _1886 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1870)
    {
        float _1888 = float(_1449);
        _1592 = _1888;
    }
    float _1890 = _1592;
    float _1892 = fma(_921, _1758, _1882);
    float _1894 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1864);
    float _1896 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1886);
    if (!_1534)
    {
        float _1898 = -_1854;
        float _1900 = _1419 + _1898;
        _1846 = _1900;
    }
    float _1902 = _1846;
    float _1904 = fma(_923, _1712, _1892);
    float _1906 = _1518;
    if (!_1534)
    {
        float _1908 = rint(_1794);
        float _1910 = precise::max(_1908, 0.0);
        uint _1912 = uint(_1910);
        uint _1914 = clamp(_1912, 0u, 65535u);
        _1906 = as_type<float>(_1914);
    }
    float _1916 = _1906;
    float _1918 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1896);
    float _1920 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1894);
    float _1922 = _1904 + _1720;
    float _1924 = _1878;
    if (!_1534)
    {
        float _1926 = -_1878;
        float _1928 = _1425 + _1926;
        _1924 = _1928;
    }
    float _1930 = _1924;
    float _1932 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1934 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1936 = _1922 * _1776;
    float _1938 = _1892;
    float _1940 = _1932;
    float _1942 = _1936;
    if (_1870)
    {
        float _1944 = rint(_1890);
        float _1946 = precise::max(_1944, 0.0);
        uint _1948 = uint(_1946);
        uint _1950 = clamp(_1948, 0u, 65535u);
        _1938 = as_type<float>(_1950);
    }
    float _1952 = _1938;
    float _1954 = _1932 * _1884;
    float _1956 = _1934 * _1884;
    float _1958 = fma(_1954, 0.5, 0.5);
    float _1960 = fma(_1956, -0.5, 0.5);
    float _1962 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1964 = _1916;
    if (!_1534)
    {
        float3 _6014 = float3(_1902, _1930, float(as_type<int>(_1916)));
        float3 _6018 = select(_6014, float3(0.0), isnan(_6014));
        float _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6018.xy, uint(rint(_6018.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6018.xy, uint(rint(_6018.z)), level(0.0)).x;
        _1964 = _1966;
    }
    float _1968 = _1964;
    float _1970 = _1834;
    if (_1870)
    {
        float3 _6033 = float3(_1822, _1834, float(as_type<int>(_1952)));
        float3 _6035 = select(_6033, float3(0.0), isnan(_6033));
        float _1972 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6035.xy, uint(rint(_6035.z)), _1936, level(0.0));
        _1970 = _1972;
    }
    float _1974 = _1970;
    float3 _6045 = float3(_1958, _1960, _1962);
    float _1976 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6045, float3(0.0), isnan(_6045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6045, float3(0.0), isnan(_6045)), level(0.0)).x;
    float3 _6054 = float3(_1958, _1960, _1962);
    float4 _1979 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6054, float3(0.0), isnan(_6054)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6054, float3(0.0), isnan(_6054)), level(0.0)).xyzw;
    float _1981 = _1979.x;
    float _1983 = _1979.y;
    float _1985 = _1979.z;
    float _1987 = _1979.w;
    float _1989 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1534)
    {
        _1848 = 1.0;
    }
    float _1991 = _1848;
    bool _1993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    float _2003 = _1991;
    if (_2001)
    {
        _1989 = 1.0;
    }
    float _2005 = _1989;
    float _2007 = _2005;
    if (_2001)
    {
        _1850 = 1.0;
    }
    float _2009 = _1850;
    float _2011 = _2009;
    float _2013 = _1968;
    if (!_2001)
    {
        float _2015 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2017 = _2015 * 0.15915493667125701904296875;
        float _2019 = _2017 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2025 = _2023 * 0.15915493667125701904296875;
        float _2027 = _2017 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = 1.0 / _2021;
        float _2033 = _2025 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        float _2037 = _2029 * _2031;
        float _2039 = _2025 * 6.283185482025146484375;
        float _2041 = sin(_2039);
        float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2045 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2043;
        float _2047 = _2035 * _2037;
        float _2049 = 1.0 / _2045;
        float _2051 = 1.0 / _2047;
        float _2053 = _2041 * _2051;
        float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2057 = fma(_1423, _2053, _2055);
        float _2059 = _2057 * _2049;
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        _2011 = _2061;
    }
    float _2063 = _2011;
    if (!_2001)
    {
        float _2065 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2067 * 6.283185482025146484375;
        float _2071 = cos(_2069);
        float _2073 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = _2067 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = 1.0 / _2071;
        float _2083 = _2075 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = _2075 * 6.283185482025146484375;
        float _2091 = sin(_2089);
        float _2093 = _2085 * _2087;
        float _2095 = 1.0 / _2093;
        float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2099 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2097;
        float _2101 = 1.0 / _2099;
        float _2103 = _2091 * _2095;
        float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2107 = fma(_1423, _2103, _2105);
        float _2109 = _2107 * _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + 1.0;
        _2007 = _2115;
    }
    float _2117 = _2007;
    if (!_1534)
    {
        int _2119 = _1598 << 4;
        int _2121 = _2119 + 2048;
        uint _2123 = uint(int(uint(_2121) >> uint(2)));
        uint _2125 = uint(int(uint(int(_2123)) >> uint(2)));
        int _2127 = int(_2123) & 3;
        float _2129 = (*spvDescriptorSet0.vp_c15)._m0[int(_2125)][_2127];
        int _2131 = int(_2123) + 1;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        int _2135 = _2131 & 3;
        float _2137 = (*spvDescriptorSet0.vp_c15)._m0[int(_2133)][_2135];
        int _2139 = _2121 + 8;
        uint _2141 = uint(int(uint(_2139) >> uint(2)));
        uint _2143 = uint(int(uint(int(_2141)) >> uint(2)));
        int _2145 = int(_2141) & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        int _2149 = int(_2141) + 1;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        int _2153 = _2149 & 3;
        float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
        float _2157 = _1403 * _2137;
        float _2159 = fma(_921, _2129, _2157);
        float _2161 = fma(_923, _2147, _2159);
        float _2163 = _2161 + _2155;
        float _2165 = precise::clamp(_2163, 0.0, 1.0);
        float _2167 = -_2165;
        float _2169 = _2167 + _1968;
        float _2171 = fma(_2169, 500.0, 1.5);
        float _2173 = exp2(_2171);
        float _2175 = 0.0 + _2173;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        _1600 = as_type<float>(_2121);
        _2003 = _2177;
    }
    float _2179 = _1600;
    float _2181 = _2003;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2185 = _1686 + _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2189 = _1688 + _2187;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2193 = _1690 + _2191;
    float _2195 = _2185 * _2185;
    float _2197 = fma(_2189, _2189, _2195);
    float _2199 = fma(_2193, _2193, _2197);
    float _2201 = rsqrt(_2199);
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2205 = _2189 * _2203;
    float _2207 = _2193 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 * _2207;
    float _2213 = _2209 + _2211;
    float _2215 = sqrt(_2213);
    bool _2217 = _2215 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2221 = _2215 + _2219;
    float _2223 = _2193;
    float _2225 = _2221;
    float _2227 = _2179;
    float _2229 = _2185;
    if (_2217)
    {
        float _2231 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2231;
    }
    float _2233 = _2223;
    if (_2217)
    {
        float _2235 = rsqrt(_2213);
        _2013 = _2235;
    }
    float _2237 = _2013;
    float _2239 = _2237;
    if (_2217)
    {
        float _2241 = _2221 * _2233;
        _2225 = _2241;
    }
    float _2243 = _2225;
    if (_2217)
    {
        float _2245 = _2243 * 0.15915493667125701904296875;
        _2227 = _2245;
    }
    float _2247 = _2227;
    float _2249 = _2201;
    float _2251 = _2247;
    if (_2217)
    {
        float _2253 = _2247 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        _2249 = _2255;
    }
    float _2257 = _2249;
    float _2259 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2261 = precise::max(0.0, _2259);
    float _2263 = _2197;
    float _2265 = _2261;
    float _2267 = _2259;
    if (_2217)
    {
        float _2269 = _2247 * 6.283185482025146484375;
        float _2271 = cos(_2269);
        _2263 = _2271;
    }
    float _2273 = _2263;
    float _2275 = -_2203;
    float _2277 = -_2261;
    float _2279 = fma(_2185, _2275, _2277);
    if (!_2217)
    {
        _2265 = _2207;
    }
    float _2281 = _2265;
    float _2283 = _2281;
    if (_2217)
    {
        float _2285 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2285;
    }
    float _2287 = _2267;
    float _2289 = _2257;
    float _2291 = _2287;
    if (_2217)
    {
        float _2293 = fma(_2257, _2287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2229 = _2293;
    }
    float _2295 = _2229;
    float _2297 = _2295;
    if (!_2217)
    {
        _2289 = _2205;
    }
    float _2299 = _2289;
    float _2301 = _2299;
    float _2303 = _2273;
    if (_2217)
    {
        float _2305 = _2273 + (-1.0);
        _2291 = _2305;
    }
    float _2307 = _2291;
    float _2309 = 0.0;
    if (_2217)
    {
        float _2311 = _2237 * _2295;
        _2309 = _2311;
    }
    float _2313 = _2309;
    if (!_2217)
    {
        _2297 = _2279;
    }
    float _2315 = _2297;
    float _2317 = _2315;
    if (_2217)
    {
        float _2319 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2251 = _2319;
    }
    float _2321 = _2251;
    if (_2217)
    {
        float _2323 = _2205 * _2313;
        _2301 = _2323;
    }
    float _2325 = _2301;
    if (!_2217)
    {
        _2239 = _2209;
    }
    float _2327 = _2239;
    float _2329 = _2327;
    if (_2217)
    {
        float _2331 = _2207 * _2313;
        _2283 = _2331;
    }
    float _2333 = _2283;
    if (_2217)
    {
        float _2335 = fma(_2279, _2273, _2321);
        _2317 = _2335;
    }
    float _2337 = _2317;
    if (_2217)
    {
        float _2339 = _2325 * _2325;
        _2329 = _2339;
    }
    float _2341 = _2329;
    if (!_2217)
    {
        _2303 = _2211;
    }
    float _2343 = _2303;
    float _2345 = _2343;
    if (_2217)
    {
        float _2347 = _2333 * _2333;
        _2345 = _2347;
    }
    float _2349 = _2345;
    float _2351 = sqrt(_2199);
    float _2353 = fma(_2337, _2337, _2341);
    float _2355 = _2353 + _2349;
    float _2357 = rsqrt(_2355);
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2359);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = -_2363;
    float _2367 = _2365 + 1.0;
    float _2369 = _2357 * _2325;
    float _2371 = _2357 * _2337;
    float _2373 = _2357 * _2333;
    float _2375 = abs(_2367);
    float _2377 = log2(_2375);
    float _2379 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2381 = -_2379;
    float _2383 = fma(_2371, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2381);
    float _2385 = -_2373;
    float _2387 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2383);
    float _2389 = fma(_2387, -0.5, 0.5);
    float _2391 = fma(_2387, 0.5, 0.5);
    float _2393 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2395 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2397 = sqrt(_2389);
    float _2399 = fma(_2391, _2395, -0.212114393711090087890625);
    float _2401 = _2371 + 1.0;
    float _2403 = fma(_2391, _2399, 1.570728778839111328125);
    float _2405 = exp2(_2393);
    float _2407 = _2397 * 0.636619746685028076171875;
    float _2409 = -_2371;
    float _2411 = fma(_2405, _2401, _2409);
    float _2413 = -_2403;
    float _2415 = fma(_2407, _2413, 1.0);
    float _2417 = fma(_2411, 0.5, 0.5);
    float2 _6699 = float2(_2415, _2417);
    float3 _2421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6699, float2(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6699, float2(0.0), isnan(_6699)), level(0.0)).xyz;
    float _2423 = _2421.x;
    float _2425 = _2421.y;
    float _2427 = _2421.z;
    float _2429 = abs(_1423);
    float _2431 = log2(_2429);
    float _2433 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2435 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2437 = -_1359;
    float _2439 = _2437 + 1.0;
    out.m_86.x = _1688;
    out.m_86.y = _1686;
    out.m_86.z = _1690;
    float _2441 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2433);
    float _2443 = exp2(_2435);
    float _2445 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2441);
    bool _2447 = _1423 <= 8000.0;
    bool _2449 = isnan(_1423);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan(8000.0);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2445);
    float _2461 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2463 = _2459 + _1880;
    out.gl_Position.x = _1932;
    out.gl_Position.y = _1934;
    out.gl_Position.z = _2459;
    out.gl_Position.w = _1880;
    float _2465 = _2463 * 0.5;
    float _2467 = exp2(_2461);
    out.m_88.z = _2465;
    out.m_88.w = _1880;
    float _2469 = -_2443;
    float _2471 = _2469 + 1.0;
    float _2473 = _2459;
    if (!_1870)
    {
        _1940 = 1.0;
    }
    float _2475 = _1940;
    float _2477 = _2475;
    if (_1870)
    {
        bool _2479 = _1974 >= _1936;
        bool _2481 = isnan(_1974);
        bool _2483 = _2479 || _2481;
        bool _2485 = isnan(_1936);
        bool _2487 = _2483 || _2485;
        float _2489 = float(_2487);
        _2477 = _2489;
    }
    float _2491 = _2477;
    float _2493 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2495 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2497 = isnan(_2351);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2503 = _2499 || _2501;
    float _2505 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = _2493 * _1976;
    float _2511 = _2491 * _2181;
    float _2513 = fma(_2507, -2.0, 3.0);
    float _2515 = _2507 * _2507;
    float _2517 = _1987 * _2509;
    float _2519 = -_2493;
    float _2521 = _2519 + 1.0;
    float _2523 = _2515 * _2513;
    float _2525 = _2511;
    float _2527 = _2521;
    float _2529 = _2517;
    if (!_2503)
    {
        _1942 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2531 = _1942;
    float _2533 = -_2523;
    float _2535 = _2533 + 1.0;
    float _2537 = _2531;
    float _2539 = _2531;
    if (!_2503)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2541 = _2473;
    float _2543 = fma(_2535, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2523);
    float _2545 = _2457 * _2543;
    float _2547 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2549 = _2439 * _2547;
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2551;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2557 = -_2511;
    float _2559 = fma(_2557, _2555, 1.0);
    float _2561 = precise::clamp(_2559, 0.0, 1.0);
    float _2563 = _2541;
    float _2565 = _2541;
    if (!_2503)
    {
        _2525 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2567 = _2525;
    float _2569 = _2561 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2571 = _2063 * _2117;
    out.m_90.x = _2569;
    float _2573 = _2571 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2575 = _2571;
    float _2577 = _2567;
    float _2579 = _2567;
    if (!_2503)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2575;
    float _2583 = _2427 * _2509;
    float _2585 = fma(_2423, _2517, _1981);
    float _2587 = fma(_2425, _2517, _1983);
    float _2589 = _1987 * _2521;
    float _2591 = fma(_1987, _2583, _1985);
    float _2593 = _2581;
    float _2595 = _2581;
    if (!_2503)
    {
        _2527 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2597 = _2527;
    float _2599 = _2597;
    float _2601 = _2597;
    if (!_2503)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2603 = _2529;
    out.m_92.x = _2585;
    out.m_92.y = _2587;
    out.m_92.z = _2591;
    out.m_92.w = _2589;
    bool _2605 = !_2503;
    float _2607 = _2603;
    float _2609 = _2603;
    if (!_2605)
    {
        bool _2611 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2613 = isnan(_2351);
        bool _2615 = _2611 || _2613;
        bool _2617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2619 = _2615 || _2617;
        if (!_2619)
        {
            float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2623 = _2351 + _2621;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2627 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2625;
            float _2629 = 1.0 / _2627;
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2651 = _2623 * _2629;
            float _2653 = precise::clamp(_2651, 0.0, 1.0);
            float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2659 = fma(_2653, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2661 = fma(_2653, _2657, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2663 = fma(_2653, _2637, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2665 = fma(_2653, _2641, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2667 = fma(_2653, _2645, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2669 = fma(_2653, _2649, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2659;
            _2609 = _2667;
            _2539 = _2661;
            _2601 = _2665;
            _2579 = _2663;
            _2595 = _2669;
            _2671 = true;
        }
        else
        {
            bool _2673 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2675 = isnan(_2351);
            bool _2677 = _2673 || _2675;
            bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2681 = _2677 || _2679;
            if (!_2681)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2683 = _2537;
            _2539 = _2683;
            if (!_2681)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2685 = _2563;
            _2565 = _2685;
            if (!_2681)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2687 = _2577;
            _2579 = _2687;
            if (!_2681)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2689 = _2599;
            _2601 = _2689;
            if (!_2681)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2691 = _2607;
            _2609 = _2691;
            if (!_2681)
            {
                _2593 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2693 = _2593;
            bool _2695 = !_2681;
            _2595 = _2693;
            if (!_2695)
            {
                bool _2697 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2699 = isnan(_2351);
                bool _2701 = _2697 || _2699;
                bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2705 = _2701 || _2703;
                if (!_2705)
                {
                    float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2709 = _2351 + _2707;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2713 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2711;
                    float _2715 = 1.0 / _2713;
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2737 = _2709 * _2715;
                    float _2739 = precise::clamp(_2737, 0.0, 1.0);
                    float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2745 = fma(_2739, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2747 = fma(_2739, _2743, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2749 = fma(_2739, _2723, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2751 = fma(_2739, _2727, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2753 = fma(_2739, _2731, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2755 = fma(_2739, _2735, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2745;
                    _2609 = _2753;
                    _2539 = _2747;
                    _2601 = _2751;
                    _2579 = _2749;
                    _2595 = _2755;
                    _2671 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2595 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2671 = false;
    float _2757 = _2565;
    float _2759 = _2609;
    float _2761 = _2539;
    float _2763 = _2601;
    float _2765 = _2579;
    float _2767 = _2595;
    float _2769 = fma(_1249, -0.5, 0.5);
    float _2771 = precise::clamp(_2769, 0.0, 1.0);
    float _2773 = -_2757;
    float _2775 = _2773 + _2759;
    float _2777 = _2573 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2779 = -_2761;
    float _2781 = _2779 + _2763;
    out.m_94.x = 0.0;
    float _2783 = fma(_2771, _2775, _2757);
    float _2785 = fma(_2771, _2781, _2761);
    out.m_61.x = _2777;
    float _2787 = -_2765;
    float _2789 = _2787 + _2767;
    float _2791 = _2783 * 0.586610972881317138671875;
    bool _2793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2795 = fma(_2771, _2789, _2765);
    float _2797 = fma(_2785, 0.298911988735198974609375, _2791);
    bool _2799 = _2063 > 0.0;
    bool _2801 = isnan(_2063);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan(0.0);
    bool _2807 = _2803 || _2805;
    float _2809 = fma(_2795, 0.114477999508380889892578125, _2797);
    bool _2811 = _2117 <= 0.0;
    bool _2813 = !_2807;
    bool _2815 = _2811 || _2813;
    float _2817 = -_2809;
    float _2819 = _2785 + _2817;
    float _2821 = -_2809;
    float _2823 = _2783 + _2821;
    float _2825 = -_2809;
    float _2827 = _2795 + _2825;
    float _2829 = fma(_2819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    float _2831 = fma(_2823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    float _2833 = fma(_2827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    bool _2835 = !_2793;
    if (!_2835)
    {
        float _2837 = -_1686;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2841 = -_1688;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2845 = -_1690;
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2849 = _2839 * _2839;
        float _2851 = fma(_2843, _2843, _2849);
        float _2853 = fma(_2847, _2847, _2851);
        float _2855 = sqrt(_2853);
        float _2857 = rsqrt(_2853);
        float _2859 = -_2855;
        float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2863 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2865 = precise::clamp(_2863, 0.0, 1.0);
        float _2867 = _2843 * _2857;
        float _2869 = _2839 * _2857;
        float _2871 = abs(_2865);
        float _2873 = log2(_2871);
        float _2875 = _2847 * _2857;
        float _2877 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2879 = _1249 * _2869;
        float _2881 = -_2869;
        float _2883 = -_2877;
        float _2885 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2883);
        float _2887 = fma(_1247, _2867, _2879);
        float _2889 = -_2875;
        float _2891 = fma(_2889, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2885);
        float _2893 = fma(_1261, _2875, _2887);
        float _2895 = precise::clamp(_2893, 0.0, 1.0);
        float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2899 = _2891 + _2897;
        float _2901 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2903 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        float _2907 = exp2(_2901);
        float _2909 = _2907 * _2905;
        float _2911 = _2895 * _2909;
        float _2913 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2915 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2917 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2913;
        out.m_94.y = _2915;
        out.m_94.z = _2917;
    }
    out.m_96.x = _2829;
    out.m_96.y = _2831;
    out.m_96.z = _2833;
    if (!_2815)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2919 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2919;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2671 = false;
    bool _1311 = false;
    bool _387 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2976 = as_type<float>(_131);
        out.gl_Position.z = _2976;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3045 = as_type<float>(_169);
        out.gl_Position.z = _3045;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _173 = !_171;
    float _191;
    if (!_173)
    {
        float _175 = in.m_65.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_115);
        float _197 = 1.0 / _195;
        float _199 = _149 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _201 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _219 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _223;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _241 = 1.0 / _217;
    float _243 = 1.0 / _225;
    float _245 = 1.0 / _221;
    float _247 = _205 * _241;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -_237;
    float _263 = _261 + 1.0;
    bool _265 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _267 = isnan(_201);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _259 * _263;
    float _279 = _209 * _243;
    float _281 = -_259;
    float _283 = _281 + 1.0;
    float _285 = _275 * _283;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _213 * _245;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _297 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _299 = isnan(_201);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = fma(_311, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _307 * _289;
    float _325 = fma(_315, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = fma(_319, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = -_307;
    float _333 = _331 + 1.0;
    float _335 = _321 * _323;
    float _337 = _325 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_327, _285, _343);
    float _355 = fma(_347, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = fma(_329, _285, _349);
    float _359 = fma(_351, _277, _353);
    float _361 = fma(_355, _277, _357);
    float _363 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_239;
    float _385;
    if (!_367)
    {
        float _369 = in.m_65.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_115);
        float _391 = 1.0 / _389;
        float _393 = _149 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_65.x;
    float _399 = in.m_65.y;
    float _401 = in.m_65.z;
    float _403 = in.m_65.w;
    float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _407 = log2(_405);
    float _409 = as_type<float>(int(gl_VertexIndex));
    float _411 = _407 * _149;
    float _413 = _401 * 2.0;
    float _415 = _397 * 2.0;
    float _417 = _399 * 2.0;
    float _419 = floor(_413);
    float _421 = floor(_415);
    bool _423 = _419 > 0.0;
    float _425 = floor(_417);
    bool _427 = _419 >= 0.0;
    bool _429 = isnan(_419);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    int _437 = _435 ? 0 : 1;
    bool _439 = _421 > 0.0;
    bool _441 = _421 >= 0.0;
    bool _443 = isnan(_421);
    bool _445 = _441 || _443;
    bool _447 = isnan(0.0);
    bool _449 = _445 || _447;
    int _451 = ~_437;
    int _453 = _451 + 1;
    int _455 = _453 + 1;
    int _457 = as_type<int>(_409) & 1;
    bool _459 = _457 != 0;
    int _461 = as_type<int>(_409) & 2;
    bool _463 = _461 != 0;
    int _465 = _449 ? 0 : 1;
    int _467 = _455;
    if (!_423)
    {
        int _469 = ~_437;
        int _471 = _469 + 1;
        _467 = _471;
    }
    int _473 = _467;
    float _475 = exp2(_411);
    int _477 = ~_465;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    int _483 = _481;
    if (!_439)
    {
        int _485 = ~_465;
        int _487 = _485 + 1;
        _483 = _487;
    }
    int _489 = _483;
    bool _491 = _403 > 0.5;
    float _493 = _399 + _401;
    bool _495 = _425 >= 0.0;
    bool _497 = isnan(_425);
    bool _499 = _495 || _497;
    bool _501 = isnan(0.0);
    bool _503 = _499 || _501;
    float _505 = _401 + _397;
    float _507 = _493 + (-1.0);
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = _505 + (-1.0);
    int _523 = _503 ? 0 : 1;
    float _525 = -_475;
    float _527 = _525 + 1.0;
    float _529 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _531 = !_511;
    int _533 = _531 ? 0 : 1;
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _537 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _549 = 1.0 + _547;
    int _551 = abs(_533);
    float _553 = _399 + _397;
    float _555 = _545 ? _527 : 0.0;
    float _557 = 1.0 / _549;
    bool _559 = _425 > 0.0;
    float _561 = _553 + (-1.0);
    float _563 = in.m_70.x;
    float _565 = in.m_70.y;
    float _567 = in.m_70.z;
    bool _569 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _571 = isnan(1.0);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _577 = _573 || _575;
    float _579 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _581 = float(_473);
    float _583 = float(_551);
    int _585 = ~_523;
    int _587 = _585 + 1;
    int _589 = _587 + 1;
    int _591 = _589;
    if (!_559)
    {
        int _593 = ~_523;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _583 * _581;
    bool _601 = !_519;
    int _603 = _601 ? 0 : 1;
    float _605 = float(_597);
    if (_577)
    {
        float _607 = _555 * _557;
        _153 = _607;
    }
    float _609 = _153;
    bool _611 = !_515;
    int _613 = _611 ? 0 : 1;
    float _615 = _599 * (-2.0);
    bool _617 = _397 > 0.5;
    float _619 = _397 + (-0.5);
    float _621 = float(_489);
    float _623 = fma(_579, _615, _579);
    int _625 = abs(_613);
    float _627 = fma(_615, _563, _563);
    float _629 = float(_625);
    int _631 = abs(_603);
    float _633 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[196].x, _627);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _629 * _621;
    float _641 = float(_631);
    float _643 = fma(_623, _609, _633);
    bool _645 = _399 > 0.5;
    float _647 = in.m_72.x;
    float _649 = in.m_72.y;
    float _651 = _639 * (-2.0);
    float _653 = _641 * _605;
    float _655 = _643 * 0.15915493667125701904296875;
    float _657 = in.m_58.x;
    float _659 = in.m_58.y;
    float _661 = in.m_58.z;
    float _663 = _399 + (-0.5);
    float _665 = fma(_651, _565, _565);
    float _667 = _653 * (-2.0);
    float _669 = fma(_529, _651, _529);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].y, _665);
    float _677 = fma(_667, _567, _567);
    float _679 = _401 + (-0.5);
    float _681 = fma(_535, _667, _535);
    float _683 = fma(_669, _609, _675);
    float _685 = 1.0 / _637;
    float _687 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[196].z, _677);
    float _689 = _683 * 0.15915493667125701904296875;
    float _691 = fma(_681, _609, _687);
    bool _693 = !_463;
    float _695 = _693 ? (-0.5) : 0.5;
    float _697 = 1.0 / _673;
    float _699 = _363 * _647;
    float _701 = _691 * 0.15915493667125701904296875;
    float _703 = _365 * _649;
    float _705 = _659 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _707 = _659 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _709 = _659 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _711 = _655 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    float _725 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    float _727 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[6].x, _709);
    float _729 = _655 * 6.283185482025146484375;
    float _731 = cos(_729);
    float _733 = _717 * _685;
    bool _735 = !_459;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = _395 + _739;
    float _743 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _695);
    float _749 = _689 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _737);
    float _755 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[4].z, _723);
    float _757 = _745 * _747;
    bool _759 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _761 = isnan(_395);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = _743 * _753;
    bool _773 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _775 = isnan(_395);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _689 * 6.283185482025146484375;
    float _787 = cos(_785);
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = -_783;
    float _795 = _793 + 1.0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _803 = _801 != 0;
    float _805 = _769 * _795;
    float _807 = _701 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _721 * _697;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _815 = _395 + _813;
    float _817 = _731 * _751;
    bool _819 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _821 = isnan(_395);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = fma(_811, _741, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _833 = _713 * _751;
    float _835 = fma(_733, _815, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _837 = _701 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _731 * _787;
    float _843 = _713 * _787;
    float _845 = _731 * _809;
    float _847 = _751 * _809;
    float _849 = _713 * _809;
    float _851 = _787 * _809;
    float _853 = _845 * _757;
    float _855 = -_829;
    float _857 = _855 + 1.0;
    float _859 = fma(_839, _841, _833);
    float _861 = fma(_839, _833, _841);
    float _863 = -_769;
    float _865 = _863 + 1.0;
    float _867 = -_817;
    float _869 = fma(_839, _843, _867);
    float _871 = -_757;
    float _873 = _839 * _871;
    float _875 = -_843;
    float _877 = fma(_839, _817, _875);
    float _879 = _849 * _757;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = fma(_859, _771, _853);
    float _885 = _829 * _865;
    float _887 = fma(_851, _771, _873);
    float _889 = fma(_869, _771, _879);
    float _891 = fma(_877, _881, _883);
    float _893 = _835 * _885;
    float _895 = fma(_847, _881, _887);
    float _897 = fma(_861, _881, _889);
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _901 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].x, _899);
    float _909 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].x, _901);
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _915 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[6].z, _727);
    float _917 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _907);
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _909);
    float _921 = _755 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = _915 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _927 = _919 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _929 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[115].x, _893);
    float _931 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[5].z, _725);
    float _933 = _921 + _925;
    float _935 = _923 + _927;
    float _937 = fma(_831, _805, _929);
    float _939 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _943 = _933 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _947 = _935 + _945;
    float _949 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _943 * _943;
    float _955 = _947 * _947;
    float _957 = _845 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _845 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_74.x = _939;
    out.m_74.y = _949;
    out.m_74.z = _951;
    out.m_74.w = _913;
    float _961 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[117].x, _937);
    float _963 = -_839;
    float _965 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _967 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _969 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _965);
    float _971 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].x, _967);
    float _973 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _971);
    float _975 = _953 + _955;
    float _977 = _845 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _979 = _859 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _859 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _983 = sqrt(_975);
    float _985 = -_839;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _977);
    float _989 = -_839;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[26].x, _959);
    float _993 = _859 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _995 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _981);
    float _997 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _987);
    float _999 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _991);
    float _1001 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _1003 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1005 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1007 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1009 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _993);
    float _1011 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1003);
    float _1013 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1005);
    float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1017 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1007);
    bool _1019 = _983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = _931 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1023 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1011);
    float _1025 = _973 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1027 = -_695;
    int _1029 = _491 ? as_type<int>(_1027) : as_type<int>(_695);
    float _1031 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1013);
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _1021 + _1025;
    float _1037 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1017);
    bool _1039 = _401 > 0.5;
    float _1041 = _1025;
    float _1043 = _897;
    float _1045 = _1005;
    float _1047 = _953;
    float _1049 = _955;
    if (!_1019)
    {
        _1041 = _933;
    }
    float _1051 = _1041;
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1055 = _1051;
    if (!_1019)
    {
        _1043 = _935;
    }
    float _1057 = _1043;
    float _1059 = _1057;
    if (!_1019)
    {
        _1045 = _1035;
    }
    float _1061 = _1045;
    bool _1063 = !_1019;
    float _1065 = _1061;
    if (!_1063)
    {
        float _1067 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1071 = _983 + _1069;
        float _1073 = rsqrt(_975);
        float _1075 = _1071 * _1067;
        float _1077 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = _1075 * 0.15915493667125701904296875;
        float _1081 = _1079 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1079 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = fma(_1083, _1077, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1091 = _1073 * _1089;
        float _1093 = fma(_943, _1091, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1095 = _1087 + (-1.0);
        float _1097 = fma(_947, _1091, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1093 + _1099;
        float _1103 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1107 = _1097 + _1105;
        float _1109 = _1101 * _1101;
        float _1111 = fma(_1035, _1087, _1103);
        float _1113 = _1107 * _1107;
        _1065 = _1111;
        _1047 = _1109;
        _1049 = _1113;
        _1055 = _1093;
        _1059 = _1097;
    }
    float _1115 = _1065;
    float _1117 = _1047;
    float _1119 = _1049;
    float _1121 = _1055;
    float _1123 = _1059;
    float _1125 = _695 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1127 = -_737;
    int _1129 = _617 ? as_type<int>(_1127) : as_type<int>(_737);
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1133 = _1115 + _1131;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1137 = _1135 != 0;
    float _1139 = fma(_1125, _1125, 1.0);
    float _1141 = -_695;
    int _1143 = _645 ? as_type<int>(_1141) : as_type<int>(_695);
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1147 = !_1137;
    float _1149 = _1147 ? _737 : as_type<float>(_1129);
    float _1151 = fma(_1133, _1133, _1117);
    float _1153 = -_737;
    int _1155 = _1039 ? as_type<int>(_1153) : as_type<int>(_737);
    float _1157 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _995);
    bool _1159 = !_791;
    float _1161 = _1159 ? _695 : as_type<float>(_1143);
    float _1163 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    bool _1165 = !_803;
    float _1167 = _1165 ? _695 : as_type<float>(_1029);
    float _1169 = rsqrt(_1139);
    float _1171 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1009);
    bool _1173 = !_799;
    float _1175 = _1173 ? _737 : as_type<float>(_1155);
    float _1177 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1179 = _1149 + 0.5;
    float _1181 = _1125 * _969;
    float _1183 = _1125 * _997;
    float _1185 = _1125 * _999;
    float _1187 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1189 = fma(_1177, _1163, _1181);
    float _1191 = -_1161;
    float _1193 = _1191 + 0.5;
    float _1195 = _1175 + 0.5;
    float _1197 = -_1167;
    float _1199 = _1197 + 0.5;
    float _1201 = _1187 * _1015;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1207 = _1125 * _1169;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1211 = _1151 + _1119;
    float _1213 = _1203 * _1033;
    float _1215 = -_1023;
    float _1217 = _1207 * _1215;
    float _1219 = _1205 * _1053;
    float _1221 = _1209 * _1145;
    float _1223 = -_1031;
    float _1225 = _1207 * _1223;
    float _1227 = fma(_1169, _969, _1217);
    float _1229 = sqrt(_1211);
    float _1231 = fma(_1177, _1157, _1183);
    float _1233 = fma(_1169, _997, _1225);
    float _1235 = fma(_1177, _1171, _1185);
    float _1237 = -_1037;
    float _1239 = _1207 * _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1247 = _1023 + _1189;
    float _1249 = _1031 + _1231;
    float _1251 = fma(_1169, _999, _1239);
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = _961 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1261 = _1037 + _1235;
    out.m_76.x = _1201;
    out.m_76.y = _1213;
    out.m_76.z = _1219;
    out.m_76.w = _1221;
    bool _1263 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1265 = isnan(_1229);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1271 = _1267 || _1269;
    out.m_78.x = _1253;
    out.m_78.y = _1255;
    out.m_78.z = _1257;
    out.m_78.w = _1259;
    out.m_80.x = _1163;
    out.m_80.y = _1157;
    out.m_80.z = _1171;
    out.m_82.x = _1227;
    out.m_82.y = _1233;
    out.m_82.z = _1251;
    float _1273 = _1169;
    float _1275 = _1229;
    if (!_1271)
    {
        _1273 = 1.0;
    }
    float _1277 = _1273;
    out.m_84.x = _1247;
    out.m_84.y = _1249;
    out.m_84.z = _1261;
    bool _1279 = !_1271;
    float _1281 = _1277;
    if (!_1279)
    {
        bool _1283 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1285 = isnan(_1229);
        bool _1287 = _1283 || _1285;
        bool _1289 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1291 = _1287 || _1289;
        if (!_1291)
        {
            float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1295 = _1229 + _1293;
            float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1299 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1297;
            float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1303 = _1301 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1305 = 1.0 / _1299;
            float _1307 = _1295 * _1305;
            float _1309 = fma(_1307, _1303, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1281 = _1309;
            _1311 = true;
        }
        else
        {
            bool _1313 = _1229 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1315 = isnan(_1229);
            bool _1317 = _1313 || _1315;
            bool _1319 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1321 = _1317 || _1319;
            if (!_1321)
            {
                float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1325 = _1229 + _1323;
                float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1329 = _1327 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1333 = _1331 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1335 = 1.0 / _1329;
                float _1337 = _1325 * _1335;
                float _1339 = fma(_1337, _1333, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1281 = _1339;
                _1311 = true;
            }
            else
            {
                _1281 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1311 = false;
    float _1341 = _1281;
    float _1343 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1345 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1347 = floor(_1343);
    float _1349 = floor(_1345);
    float _1351 = -_1347;
    float _1353 = _1343 + _1351;
    float _1355 = -_1349;
    float _1357 = _1345 + _1355;
    float2 _4982 = float2(_1353, _1357);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4982, float2(0.0), isnan(_4982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4982, float2(0.0), isnan(_4982)), level(0.0)).x;
    float _1361 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1365 = _1121 + _1363;
    float _1367 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1361);
    float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1371 = _1123 + _1369;
    float _1373 = fma(_1365, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1375 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1367);
    float _1377 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1379 = fma(_1371, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1381 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1383 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1377);
    float _1385 = 1.0 / _1381;
    float _1387 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1383);
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1391 = _1389 + _1381;
    float _1393 = _1391 * _1385;
    float _1395 = _1393 * 0.5;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1399 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1397);
    float _1401 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1403 = _1021 + _1401;
    float _1405 = 1.0 / _1399;
    float _1407 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1409 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1411 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1407);
    float _1413 = fma(_921, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1409);
    float _1415 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1411);
    float _1417 = fma(_923, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1413);
    float _1419 = _1415 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1423 = _1405 * _1421;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1427 = trunc(_1419);
    int _1429 = int(_1427);
    bool _1431 = _1423 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1433 = _1423 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1435 = !_1431;
    int _1437 = _1435 ? 0 : 1;
    int _1439 = 2;
    int _1441 = as_type<int>(_1341);
    float _1443 = _1415;
    if (!_1431)
    {
        _1439 = 1;
    }
    int _1445 = _1439;
    int _1447 = _1445;
    if (!_1433)
    {
        _1447 = _1437;
    }
    int _1449 = _1447;
    float _1451 = trunc(_1425);
    int _1453 = int(_1451);
    int _1455 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1457 = _1429 + _1455;
    int _1459 = _1457 + 1;
    int _1461 = _1449 << 6;
    bool _1463 = _1459 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1465 = _1461 + 48;
    uint _1468 = uint(int(uint(_1465) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c15)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    int _1484 = _1461 + 56;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.vp_c15)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[int(_1496)][_1498];
    int _1502 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1504 = _1453 + _1502;
    int _1506 = _1504 + 1;
    int _1508 = _1459 | _1506;
    int _1510 = _1461 + 64;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c15)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    bool _1528 = _1508 < 0;
    bool _1530 = _1528 || _1463;
    bool _1532 = _1506 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1534 = _1532 || _1530;
    bool _1536 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    int _1546 = _1461 + 72;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
    float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1566 = _1115 + _1564;
    float _1568 = fma(_1566, _1341, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _1570 = _1461 + 96;
    uint _1572 = uint(int(uint(_1570) >> uint(2)));
    uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
    int _1576 = int(_1572) & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    int _1580 = int(_1572) + 1;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    int _1584 = _1580 & 3;
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
    float _1588 = as_type<float>(_1459);
    float _1590 = _1566;
    float _1592 = as_type<float>(_1461);
    if (!_1534)
    {
        int _1594 = _1506 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1596 = _1594 + _1459;
        _1441 = _1596;
    }
    int _1598 = _1441;
    float _1600 = as_type<float>(_1598);
    if (_1544)
    {
        _1588 = _1373;
    }
    float _1602 = _1588;
    float _1604 = _1602;
    if (_1544)
    {
        _1590 = _1568;
    }
    float _1606 = _1590;
    int _1608 = _1461 + 104;
    uint _1610 = uint(int(uint(_1608) >> uint(2)));
    uint _1612 = uint(int(uint(int(_1610)) >> uint(2)));
    int _1614 = int(_1610) & 3;
    float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
    int _1618 = int(_1610) + 1;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    int _1622 = _1618 & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    float _1626 = _1606;
    if (_1544)
    {
        _1443 = _1379;
    }
    float _1628 = _1443;
    float _1630 = _1628;
    int _1632 = as_type<int>(_1586);
    int _1634 = as_type<int>(_1578);
    if (!_1544)
    {
        float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1638 = _1021 + _1636;
        float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1642 = _921 + _1640;
        float _1644 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1646 = _1638 * _1638;
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1650 = _923 + _1648;
        float _1652 = fma(_1642, _1642, _1646);
        float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1656 = fma(_1650, _1650, _1652);
        float _1658 = sqrt(_1656);
        float _1660 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1662 = -_923;
        float _1664 = _1662 + _1379;
        float _1666 = precise::min(_1658, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1668 = _1666 * _1654;
        float _1670 = -_1021;
        float _1672 = _1670 + _1568;
        float _1674 = _1660 * _1668;
        float _1676 = -_921;
        float _1678 = _1676 + _1373;
        float _1680 = fma(_1672, _1674, _1021);
        float _1682 = fma(_1678, _1674, _921);
        float _1684 = fma(_1664, _1674, _923);
        _1626 = _1680;
        _1604 = _1682;
        _1630 = _1684;
        _1275 = _1654;
    }
    float _1686 = _1626;
    float _1688 = _1604;
    float _1690 = _1630;
    float _1692 = _1275;
    float _1694 = _1403 * _1586;
    float _1696 = _1692;
    if (!_1534)
    {
        int _1698 = _1598 << 2;
        _1632 = _1698;
    }
    int _1700 = _1632;
    float _1702 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1704 = _1461 + 88;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[int(_1708)][_1710];
    int _1714 = int(_1706) + 1;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    int _1718 = _1714 & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    float _1722 = fma(_921, _1578, _1694);
    int _1724 = _1700;
    if (!_1534)
    {
        uint _1726 = uint(int(uint(_1598) >> uint(2)));
        _1634 = int(_1726);
    }
    int _1728 = _1634;
    float _1730 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    if (!_1534)
    {
        int _1732 = 12 & _1700;
        _1724 = _1732;
    }
    int _1734 = _1724;
    float _1736 = fma(_923, _1616, _1722);
    float _1738 = _1403 * _1526;
    float _1740 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1730);
    if (!_1534)
    {
        int _1742 = _1728 << 4;
        int _1744 = _1742 + _1734;
        _1696 = as_type<float>(_1744);
    }
    float _1746 = _1696;
    float _1748 = _1736 + _1624;
    int _1750 = _1461 + 80;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    uint _1754 = uint(int(uint(int(_1752)) >> uint(2)));
    int _1756 = int(_1752) & 3;
    float _1758 = (*spvDescriptorSet0.vp_c15)._m0[int(_1754)][_1756];
    int _1760 = int(_1752) + 1;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    int _1764 = _1760 & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    float _1768 = _1403 * _1482;
    float _1770 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1772 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1774 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1776 = 1.0 / _1748;
    float _1778 = fma(_921, _1474, _1768);
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1782 = _1746;
    if (!_1534)
    {
        int _1784 = as_type<int>(_1746) + 400;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
        int _1790 = int(_1786) & 3;
        float _1792 = (*spvDescriptorSet0.vp_c15)._m0[int(_1788)][_1790];
        _1782 = _1792;
    }
    float _1794 = _1782;
    float _1796 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1774);
    float _1798 = fma(_923, _1492, _1778);
    float _1800 = -_1780;
    float _1802 = fma(_1800, _1772, 1.0);
    float _1804 = fma(_921, _1518, _1738);
    float _1806 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = _1798 + _1500;
    float _1810 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1796);
    float _1812 = fma(_923, _1554, _1804);
    float _1814 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1816 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1820 = log2(_1802);
    float _1822 = _1808 * _1776;
    float _1824 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1814);
    float _1826 = _1812 + _1562;
    float _1828 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    bool _1830 = _1822 >= 0.0;
    float _1832 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1834 = _1826 * _1776;
    float _1836 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1828);
    bool _1838 = _1822 <= 1.0;
    bool _1840 = _1838 && _1830;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1844 = _1373;
    float _1846 = _1814;
    float _1848 = _1776;
    float _1850 = _1794;
    if (!_1534)
    {
        float _1852 = floor(_1419);
        _1844 = _1852;
    }
    float _1854 = _1844;
    float _1856 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1858 = _1834 >= 0.0;
    bool _1860 = _1858 && _1840;
    float _1862 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1842);
    float _1864 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1866 = _1820 * 0.693147182464599609375;
    bool _1868 = _1834 <= 1.0;
    bool _1870 = _1868 && _1860;
    float _1872 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1862);
    float _1874 = _1379;
    if (!_1534)
    {
        float _1876 = floor(_1425);
        _1874 = _1876;
    }
    float _1878 = _1874;
    float _1880 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1872);
    float _1882 = _1403 * _1766;
    float _1884 = 1.0 / _1880;
    float _1886 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1870)
    {
        float _1888 = float(_1449);
        _1592 = _1888;
    }
    float _1890 = _1592;
    float _1892 = fma(_921, _1758, _1882);
    float _1894 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1864);
    float _1896 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1886);
    if (!_1534)
    {
        float _1898 = -_1854;
        float _1900 = _1419 + _1898;
        _1846 = _1900;
    }
    float _1902 = _1846;
    float _1904 = fma(_923, _1712, _1892);
    float _1906 = _1518;
    if (!_1534)
    {
        float _1908 = rint(_1794);
        float _1910 = precise::max(_1908, 0.0);
        uint _1912 = uint(_1910);
        uint _1914 = clamp(_1912, 0u, 65535u);
        _1906 = as_type<float>(_1914);
    }
    float _1916 = _1906;
    float _1918 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1896);
    float _1920 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1894);
    float _1922 = _1904 + _1720;
    float _1924 = _1878;
    if (!_1534)
    {
        float _1926 = -_1878;
        float _1928 = _1425 + _1926;
        _1924 = _1928;
    }
    float _1930 = _1924;
    float _1932 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1934 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1936 = _1922 * _1776;
    float _1938 = _1892;
    float _1940 = _1932;
    float _1942 = _1936;
    if (_1870)
    {
        float _1944 = rint(_1890);
        float _1946 = precise::max(_1944, 0.0);
        uint _1948 = uint(_1946);
        uint _1950 = clamp(_1948, 0u, 65535u);
        _1938 = as_type<float>(_1950);
    }
    float _1952 = _1938;
    float _1954 = _1932 * _1884;
    float _1956 = _1934 * _1884;
    float _1958 = fma(_1954, 0.5, 0.5);
    float _1960 = fma(_1956, -0.5, 0.5);
    float _1962 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1964 = _1916;
    if (!_1534)
    {
        float3 _6014 = float3(_1902, _1930, float(as_type<int>(_1916)));
        float3 _6018 = select(_6014, float3(0.0), isnan(_6014));
        float _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6018.xy, uint(rint(_6018.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6018.xy, uint(rint(_6018.z)), level(0.0)).x;
        _1964 = _1966;
    }
    float _1968 = _1964;
    float _1970 = _1834;
    if (_1870)
    {
        float3 _6033 = float3(_1822, _1834, float(as_type<int>(_1952)));
        float3 _6035 = select(_6033, float3(0.0), isnan(_6033));
        float _1972 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6035.xy, uint(rint(_6035.z)), _1936, level(0.0));
        _1970 = _1972;
    }
    float _1974 = _1970;
    float3 _6045 = float3(_1958, _1960, _1962);
    float _1976 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6045, float3(0.0), isnan(_6045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6045, float3(0.0), isnan(_6045)), level(0.0)).x;
    float3 _6054 = float3(_1958, _1960, _1962);
    float4 _1979 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6054, float3(0.0), isnan(_6054)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6054, float3(0.0), isnan(_6054)), level(0.0)).xyzw;
    float _1981 = _1979.x;
    float _1983 = _1979.y;
    float _1985 = _1979.z;
    float _1987 = _1979.w;
    float _1989 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1534)
    {
        _1848 = 1.0;
    }
    float _1991 = _1848;
    bool _1993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    float _2003 = _1991;
    if (_2001)
    {
        _1989 = 1.0;
    }
    float _2005 = _1989;
    float _2007 = _2005;
    if (_2001)
    {
        _1850 = 1.0;
    }
    float _2009 = _1850;
    float _2011 = _2009;
    float _2013 = _1968;
    if (!_2001)
    {
        float _2015 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2017 = _2015 * 0.15915493667125701904296875;
        float _2019 = _2017 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2025 = _2023 * 0.15915493667125701904296875;
        float _2027 = _2017 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = 1.0 / _2021;
        float _2033 = _2025 * 6.283185482025146484375;
        float _2035 = cos(_2033);
        float _2037 = _2029 * _2031;
        float _2039 = _2025 * 6.283185482025146484375;
        float _2041 = sin(_2039);
        float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2045 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2043;
        float _2047 = _2035 * _2037;
        float _2049 = 1.0 / _2045;
        float _2051 = 1.0 / _2047;
        float _2053 = _2041 * _2051;
        float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2057 = fma(_1423, _2053, _2055);
        float _2059 = _2057 * _2049;
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        _2011 = _2061;
    }
    float _2063 = _2011;
    if (!_2001)
    {
        float _2065 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2067 = _2065 * 0.15915493667125701904296875;
        float _2069 = _2067 * 6.283185482025146484375;
        float _2071 = cos(_2069);
        float _2073 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = _2067 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = 1.0 / _2071;
        float _2083 = _2075 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = _2075 * 6.283185482025146484375;
        float _2091 = sin(_2089);
        float _2093 = _2085 * _2087;
        float _2095 = 1.0 / _2093;
        float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2099 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2097;
        float _2101 = 1.0 / _2099;
        float _2103 = _2091 * _2095;
        float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2107 = fma(_1423, _2103, _2105);
        float _2109 = _2107 * _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + 1.0;
        _2007 = _2115;
    }
    float _2117 = _2007;
    if (!_1534)
    {
        int _2119 = _1598 << 4;
        int _2121 = _2119 + 2048;
        uint _2123 = uint(int(uint(_2121) >> uint(2)));
        uint _2125 = uint(int(uint(int(_2123)) >> uint(2)));
        int _2127 = int(_2123) & 3;
        float _2129 = (*spvDescriptorSet0.vp_c15)._m0[int(_2125)][_2127];
        int _2131 = int(_2123) + 1;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        int _2135 = _2131 & 3;
        float _2137 = (*spvDescriptorSet0.vp_c15)._m0[int(_2133)][_2135];
        int _2139 = _2121 + 8;
        uint _2141 = uint(int(uint(_2139) >> uint(2)));
        uint _2143 = uint(int(uint(int(_2141)) >> uint(2)));
        int _2145 = int(_2141) & 3;
        float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
        int _2149 = int(_2141) + 1;
        uint _2151 = uint(int(uint(_2149) >> uint(2)));
        int _2153 = _2149 & 3;
        float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
        float _2157 = _1403 * _2137;
        float _2159 = fma(_921, _2129, _2157);
        float _2161 = fma(_923, _2147, _2159);
        float _2163 = _2161 + _2155;
        float _2165 = precise::clamp(_2163, 0.0, 1.0);
        float _2167 = -_2165;
        float _2169 = _2167 + _1968;
        float _2171 = fma(_2169, 500.0, 1.5);
        float _2173 = exp2(_2171);
        float _2175 = 0.0 + _2173;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        _1600 = as_type<float>(_2121);
        _2003 = _2177;
    }
    float _2179 = _1600;
    float _2181 = _2003;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2185 = _1686 + _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2189 = _1688 + _2187;
    float _2191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2193 = _1690 + _2191;
    float _2195 = _2185 * _2185;
    float _2197 = fma(_2189, _2189, _2195);
    float _2199 = fma(_2193, _2193, _2197);
    float _2201 = rsqrt(_2199);
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2205 = _2189 * _2203;
    float _2207 = _2193 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 * _2207;
    float _2213 = _2209 + _2211;
    float _2215 = sqrt(_2213);
    bool _2217 = _2215 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2221 = _2215 + _2219;
    float _2223 = _2193;
    float _2225 = _2221;
    float _2227 = _2179;
    float _2229 = _2185;
    if (_2217)
    {
        float _2231 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2231;
    }
    float _2233 = _2223;
    if (_2217)
    {
        float _2235 = rsqrt(_2213);
        _2013 = _2235;
    }
    float _2237 = _2013;
    float _2239 = _2237;
    if (_2217)
    {
        float _2241 = _2221 * _2233;
        _2225 = _2241;
    }
    float _2243 = _2225;
    if (_2217)
    {
        float _2245 = _2243 * 0.15915493667125701904296875;
        _2227 = _2245;
    }
    float _2247 = _2227;
    float _2249 = _2201;
    float _2251 = _2247;
    if (_2217)
    {
        float _2253 = _2247 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        _2249 = _2255;
    }
    float _2257 = _2249;
    float _2259 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2261 = precise::max(0.0, _2259);
    float _2263 = _2197;
    float _2265 = _2261;
    float _2267 = _2259;
    if (_2217)
    {
        float _2269 = _2247 * 6.283185482025146484375;
        float _2271 = cos(_2269);
        _2263 = _2271;
    }
    float _2273 = _2263;
    float _2275 = -_2203;
    float _2277 = -_2261;
    float _2279 = fma(_2185, _2275, _2277);
    if (!_2217)
    {
        _2265 = _2207;
    }
    float _2281 = _2265;
    float _2283 = _2281;
    if (_2217)
    {
        float _2285 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2285;
    }
    float _2287 = _2267;
    float _2289 = _2257;
    float _2291 = _2287;
    if (_2217)
    {
        float _2293 = fma(_2257, _2287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2229 = _2293;
    }
    float _2295 = _2229;
    float _2297 = _2295;
    if (!_2217)
    {
        _2289 = _2205;
    }
    float _2299 = _2289;
    float _2301 = _2299;
    float _2303 = _2273;
    if (_2217)
    {
        float _2305 = _2273 + (-1.0);
        _2291 = _2305;
    }
    float _2307 = _2291;
    float _2309 = 0.0;
    if (_2217)
    {
        float _2311 = _2237 * _2295;
        _2309 = _2311;
    }
    float _2313 = _2309;
    if (!_2217)
    {
        _2297 = _2279;
    }
    float _2315 = _2297;
    float _2317 = _2315;
    if (_2217)
    {
        float _2319 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2251 = _2319;
    }
    float _2321 = _2251;
    if (_2217)
    {
        float _2323 = _2205 * _2313;
        _2301 = _2323;
    }
    float _2325 = _2301;
    if (!_2217)
    {
        _2239 = _2209;
    }
    float _2327 = _2239;
    float _2329 = _2327;
    if (_2217)
    {
        float _2331 = _2207 * _2313;
        _2283 = _2331;
    }
    float _2333 = _2283;
    if (_2217)
    {
        float _2335 = fma(_2279, _2273, _2321);
        _2317 = _2335;
    }
    float _2337 = _2317;
    if (_2217)
    {
        float _2339 = _2325 * _2325;
        _2329 = _2339;
    }
    float _2341 = _2329;
    if (!_2217)
    {
        _2303 = _2211;
    }
    float _2343 = _2303;
    float _2345 = _2343;
    if (_2217)
    {
        float _2347 = _2333 * _2333;
        _2345 = _2347;
    }
    float _2349 = _2345;
    float _2351 = sqrt(_2199);
    float _2353 = fma(_2337, _2337, _2341);
    float _2355 = _2353 + _2349;
    float _2357 = rsqrt(_2355);
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2359);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = -_2363;
    float _2367 = _2365 + 1.0;
    float _2369 = _2357 * _2325;
    float _2371 = _2357 * _2337;
    float _2373 = _2357 * _2333;
    float _2375 = abs(_2367);
    float _2377 = log2(_2375);
    float _2379 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2381 = -_2379;
    float _2383 = fma(_2371, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2381);
    float _2385 = -_2373;
    float _2387 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2383);
    float _2389 = fma(_2387, -0.5, 0.5);
    float _2391 = fma(_2387, 0.5, 0.5);
    float _2393 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2395 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2397 = sqrt(_2389);
    float _2399 = fma(_2391, _2395, -0.212114393711090087890625);
    float _2401 = _2371 + 1.0;
    float _2403 = fma(_2391, _2399, 1.570728778839111328125);
    float _2405 = exp2(_2393);
    float _2407 = _2397 * 0.636619746685028076171875;
    float _2409 = -_2371;
    float _2411 = fma(_2405, _2401, _2409);
    float _2413 = -_2403;
    float _2415 = fma(_2407, _2413, 1.0);
    float _2417 = fma(_2411, 0.5, 0.5);
    float2 _6699 = float2(_2415, _2417);
    float3 _2421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6699, float2(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6699, float2(0.0), isnan(_6699)), level(0.0)).xyz;
    float _2423 = _2421.x;
    float _2425 = _2421.y;
    float _2427 = _2421.z;
    float _2429 = abs(_1423);
    float _2431 = log2(_2429);
    float _2433 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2435 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2437 = -_1359;
    float _2439 = _2437 + 1.0;
    out.m_86.x = _1688;
    out.m_86.y = _1686;
    out.m_86.z = _1690;
    float _2441 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2433);
    float _2443 = exp2(_2435);
    float _2445 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2441);
    bool _2447 = _1423 <= 8000.0;
    bool _2449 = isnan(_1423);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan(8000.0);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2445);
    float _2461 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2463 = _2459 + _1880;
    out.gl_Position.x = _1932;
    out.gl_Position.y = _1934;
    out.gl_Position.z = _2459;
    out.gl_Position.w = _1880;
    float _2465 = _2463 * 0.5;
    float _2467 = exp2(_2461);
    out.m_88.z = _2465;
    out.m_88.w = _1880;
    float _2469 = -_2443;
    float _2471 = _2469 + 1.0;
    float _2473 = _2459;
    if (!_1870)
    {
        _1940 = 1.0;
    }
    float _2475 = _1940;
    float _2477 = _2475;
    if (_1870)
    {
        bool _2479 = _1974 >= _1936;
        bool _2481 = isnan(_1974);
        bool _2483 = _2479 || _2481;
        bool _2485 = isnan(_1936);
        bool _2487 = _2483 || _2485;
        float _2489 = float(_2487);
        _2477 = _2489;
    }
    float _2491 = _2477;
    float _2493 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2495 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2497 = isnan(_2351);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2503 = _2499 || _2501;
    float _2505 = fma(_2467, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = _2493 * _1976;
    float _2511 = _2491 * _2181;
    float _2513 = fma(_2507, -2.0, 3.0);
    float _2515 = _2507 * _2507;
    float _2517 = _1987 * _2509;
    float _2519 = -_2493;
    float _2521 = _2519 + 1.0;
    float _2523 = _2515 * _2513;
    float _2525 = _2511;
    float _2527 = _2521;
    float _2529 = _2517;
    if (!_2503)
    {
        _1942 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2531 = _1942;
    float _2533 = -_2523;
    float _2535 = _2533 + 1.0;
    float _2537 = _2531;
    float _2539 = _2531;
    if (!_2503)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2541 = _2473;
    float _2543 = fma(_2535, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2523);
    float _2545 = _2457 * _2543;
    float _2547 = _2545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2549 = _2439 * _2547;
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2551;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2557 = -_2511;
    float _2559 = fma(_2557, _2555, 1.0);
    float _2561 = precise::clamp(_2559, 0.0, 1.0);
    float _2563 = _2541;
    float _2565 = _2541;
    if (!_2503)
    {
        _2525 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2567 = _2525;
    float _2569 = _2561 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2571 = _2063 * _2117;
    out.m_90.x = _2569;
    float _2573 = _2571 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2575 = _2571;
    float _2577 = _2567;
    float _2579 = _2567;
    if (!_2503)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2575;
    float _2583 = _2427 * _2509;
    float _2585 = fma(_2423, _2517, _1981);
    float _2587 = fma(_2425, _2517, _1983);
    float _2589 = _1987 * _2521;
    float _2591 = fma(_1987, _2583, _1985);
    float _2593 = _2581;
    float _2595 = _2581;
    if (!_2503)
    {
        _2527 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2597 = _2527;
    float _2599 = _2597;
    float _2601 = _2597;
    if (!_2503)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2603 = _2529;
    out.m_92.x = _2585;
    out.m_92.y = _2587;
    out.m_92.z = _2591;
    out.m_92.w = _2589;
    bool _2605 = !_2503;
    float _2607 = _2603;
    float _2609 = _2603;
    if (!_2605)
    {
        bool _2611 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2613 = isnan(_2351);
        bool _2615 = _2611 || _2613;
        bool _2617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2619 = _2615 || _2617;
        if (!_2619)
        {
            float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2623 = _2351 + _2621;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2627 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2625;
            float _2629 = 1.0 / _2627;
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2651 = _2623 * _2629;
            float _2653 = precise::clamp(_2651, 0.0, 1.0);
            float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2659 = fma(_2653, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2661 = fma(_2653, _2657, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2663 = fma(_2653, _2637, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2665 = fma(_2653, _2641, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2667 = fma(_2653, _2645, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2669 = fma(_2653, _2649, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2659;
            _2609 = _2667;
            _2539 = _2661;
            _2601 = _2665;
            _2579 = _2663;
            _2595 = _2669;
            _2671 = true;
        }
        else
        {
            bool _2673 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2675 = isnan(_2351);
            bool _2677 = _2673 || _2675;
            bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2681 = _2677 || _2679;
            if (!_2681)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2683 = _2537;
            _2539 = _2683;
            if (!_2681)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2685 = _2563;
            _2565 = _2685;
            if (!_2681)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2687 = _2577;
            _2579 = _2687;
            if (!_2681)
            {
                _2599 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2689 = _2599;
            _2601 = _2689;
            if (!_2681)
            {
                _2607 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2691 = _2607;
            _2609 = _2691;
            if (!_2681)
            {
                _2593 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2693 = _2593;
            bool _2695 = !_2681;
            _2595 = _2693;
            if (!_2695)
            {
                bool _2697 = _2351 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2699 = isnan(_2351);
                bool _2701 = _2697 || _2699;
                bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2705 = _2701 || _2703;
                if (!_2705)
                {
                    float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2709 = _2351 + _2707;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2713 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2711;
                    float _2715 = 1.0 / _2713;
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2737 = _2709 * _2715;
                    float _2739 = precise::clamp(_2737, 0.0, 1.0);
                    float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2745 = fma(_2739, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2747 = fma(_2739, _2743, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2749 = fma(_2739, _2723, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2751 = fma(_2739, _2727, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2753 = fma(_2739, _2731, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2755 = fma(_2739, _2735, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2745;
                    _2609 = _2753;
                    _2539 = _2747;
                    _2601 = _2751;
                    _2579 = _2749;
                    _2595 = _2755;
                    _2671 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2609 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2601 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2595 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2671 = false;
    float _2757 = _2565;
    float _2759 = _2609;
    float _2761 = _2539;
    float _2763 = _2601;
    float _2765 = _2579;
    float _2767 = _2595;
    float _2769 = fma(_1249, -0.5, 0.5);
    float _2771 = precise::clamp(_2769, 0.0, 1.0);
    float _2773 = -_2757;
    float _2775 = _2773 + _2759;
    float _2777 = _2573 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2779 = -_2761;
    float _2781 = _2779 + _2763;
    out.m_94.x = 0.0;
    float _2783 = fma(_2771, _2775, _2757);
    float _2785 = fma(_2771, _2781, _2761);
    out.m_61.x = _2777;
    float _2787 = -_2765;
    float _2789 = _2787 + _2767;
    float _2791 = _2783 * 0.586610972881317138671875;
    bool _2793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2795 = fma(_2771, _2789, _2765);
    float _2797 = fma(_2785, 0.298911988735198974609375, _2791);
    bool _2799 = _2063 > 0.0;
    bool _2801 = isnan(_2063);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan(0.0);
    bool _2807 = _2803 || _2805;
    float _2809 = fma(_2795, 0.114477999508380889892578125, _2797);
    bool _2811 = _2117 <= 0.0;
    bool _2813 = !_2807;
    bool _2815 = _2811 || _2813;
    float _2817 = -_2809;
    float _2819 = _2785 + _2817;
    float _2821 = -_2809;
    float _2823 = _2783 + _2821;
    float _2825 = -_2809;
    float _2827 = _2795 + _2825;
    float _2829 = fma(_2819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    float _2831 = fma(_2823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    float _2833 = fma(_2827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2809);
    bool _2835 = !_2793;
    if (!_2835)
    {
        float _2837 = -_1686;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2841 = -_1688;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2845 = -_1690;
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2849 = _2839 * _2839;
        float _2851 = fma(_2843, _2843, _2849);
        float _2853 = fma(_2847, _2847, _2851);
        float _2855 = sqrt(_2853);
        float _2857 = rsqrt(_2853);
        float _2859 = -_2855;
        float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2863 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2865 = precise::clamp(_2863, 0.0, 1.0);
        float _2867 = _2843 * _2857;
        float _2869 = _2839 * _2857;
        float _2871 = abs(_2865);
        float _2873 = log2(_2871);
        float _2875 = _2847 * _2857;
        float _2877 = _2867 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2879 = _1249 * _2869;
        float _2881 = -_2869;
        float _2883 = -_2877;
        float _2885 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2883);
        float _2887 = fma(_1247, _2867, _2879);
        float _2889 = -_2875;
        float _2891 = fma(_2889, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2885);
        float _2893 = fma(_1261, _2875, _2887);
        float _2895 = precise::clamp(_2893, 0.0, 1.0);
        float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2899 = _2891 + _2897;
        float _2901 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2903 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        float _2907 = exp2(_2901);
        float _2909 = _2907 * _2905;
        float _2911 = _2895 * _2909;
        float _2913 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2915 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2917 = _2911 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2913;
        out.m_94.y = _2915;
        out.m_94.z = _2917;
    }
    out.m_96.x = _2829;
    out.m_96.y = _2831;
    out.m_96.z = _2833;
    if (!_2815)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2919 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2919;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

