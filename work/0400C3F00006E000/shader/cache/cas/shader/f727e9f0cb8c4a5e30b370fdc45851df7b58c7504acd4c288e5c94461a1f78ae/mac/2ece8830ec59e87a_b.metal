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
    float4 m_76 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_74 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4011 = false;
    bool _999 = false;
    bool _815 = false;
    bool _659 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _4264 = as_type<float>(_131);
        out.gl_Position.z = _4264;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4334 = as_type<float>(_169);
        out.gl_Position.z = _4334;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_63.x;
    float _173 = in.m_63.y;
    float _175 = in.m_63.z;
    float _177 = in.m_65.x;
    float _179 = in.m_65.y;
    float _181 = in.m_65.z;
    float _183 = in.m_67.x;
    float _185 = in.m_67.y;
    float _187 = in.m_67.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_72.w;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    float _199 = _171 * _171;
    float _201 = _173 * _173;
    float _203 = fma(_177, _177, _199);
    float _205 = fma(_179, _179, _201);
    float _207 = fma(_183, _183, _203);
    float _209 = _175 * _175;
    float _211 = fma(_185, _185, _205);
    float _213 = sqrt(_207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_187, _187, _215);
    float _219 = sqrt(_211);
    float _221 = sqrt(_217);
    bool _223 = _213 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = 0.0;
    float _229 = _213;
    float _231 = _207;
    float _233 = _211;
    if (_223)
    {
        float _235 = rsqrt(_207);
        _227 = _235;
    }
    float _237 = _227;
    if (!_223)
    {
        _229 = 0.0;
    }
    float _239 = _229;
    bool _241 = _221 > 0.0;
    float _243 = 0.0;
    float _245 = _239;
    if (!_223)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    int _249 = as_type<int>(_189) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_189) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    float _259 = _247;
    if (_225)
    {
        float _261 = rsqrt(_211);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = in.m_61.x;
    float _267 = in.m_61.y;
    float _269 = in.m_61.z;
    bool _271 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _275 = _271 || _273;
    bool _277 = isnan(1.0);
    bool _279 = _275 || _277;
    float _281 = 0.0;
    float _283 = 0.0;
    if (!_225)
    {
        _281 = 0.0;
        _283 = 0.0;
    }
    float _285 = _281;
    float _287 = _283;
    float _289 = _285;
    float _291 = _287;
    if (!_223)
    {
        _231 = 0.0;
    }
    float _293 = _231;
    float _295 = 0.0;
    float _297 = _293;
    if (!_225)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = 0.0;
    float _303 = _299;
    if (_241)
    {
        float _305 = rsqrt(_217);
        _301 = _305;
    }
    float _307 = _301;
    float _309 = 0.0;
    float _311 = 0.0;
    if (!_241)
    {
        _309 = 0.0;
        _311 = 0.0;
    }
    float _313 = _309;
    float _315 = _311;
    float _317 = 0.0;
    float _319 = _315;
    float _321 = _313;
    if (!_241)
    {
        _317 = 0.0;
    }
    float _323 = _317;
    float _325 = _323;
    if (_223)
    {
        float _327 = _237 * _177;
        _245 = _327;
    }
    float _329 = _245;
    if (_223)
    {
        float _331 = _237 * _171;
        _297 = _331;
    }
    float _333 = _297;
    if (_223)
    {
        float _335 = _237 * _183;
        _259 = _335;
    }
    float _337 = _259;
    bool _339 = !_251;
    float _341 = _339 ? (-0.5) : 0.5;
    if (_225)
    {
        float _343 = _263 * _179;
        _303 = _343;
    }
    float _345 = _303;
    float _347 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _349 = _347;
    if (_225)
    {
        float _351 = _263 * _173;
        _289 = _351;
    }
    float _353 = _289;
    if (_225)
    {
        float _355 = _263 * _185;
        _291 = _355;
    }
    float _357 = _291;
    bool _359 = !_255;
    float _361 = _359 ? (-0.5) : 0.5;
    if (!_279)
    {
        float _363 = _347 * _347;
        float _365 = _363 * 0.5;
        _233 = _365;
    }
    float _367 = _233;
    float _369 = _367;
    if (_241)
    {
        float _371 = _307 * _181;
        _319 = _371;
    }
    float _373 = _319;
    if (_241)
    {
        float _375 = _307 * _175;
        _321 = _375;
    }
    float _377 = _321;
    if (_241)
    {
        float _379 = _307 * _187;
        _325 = _379;
    }
    float _381 = _325;
    if (!_279)
    {
        float _383 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _383;
    }
    float _385 = _369;
    bool _387 = !_279;
    float _389 = _385;
    if (!_387)
    {
        float _391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = log2(_391);
        float _395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _397 = _395 + 1.0;
        float _399 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = _347 * _393;
        float _403 = 1.0 / _397;
        float _405 = _399 * 0.693147182464599609375;
        float _407 = exp2(_401);
        float _409 = 1.0 / _405;
        float _411 = _407 + (-1.0);
        float _413 = -_411;
        float _415 = fma(_413, _409, _347);
        float _417 = _415 * _403;
        float _419 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _389 = _419;
    }
    float _421 = _389;
    float _423 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _425 = !_279;
    float _427 = _423;
    float _429 = _421;
    if (!_425)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _347 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _349 = _449;
    }
    float _451 = _349;
    float _453 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _455 = _423 * _333;
    float _457 = _423 * _353;
    float _459 = _423 * _377;
    float _461 = _451;
    if (!_279)
    {
        float _463 = _149 * _149;
        float _465 = _463 * 0.5;
        _427 = _465;
    }
    float _467 = _427;
    float _469 = fma(_453, _329, _455);
    float _471 = fma(_453, _345, _457);
    float _473 = fma(_453, _373, _459);
    float _475 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_279)
    {
        float _477 = _467 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _429 = _477;
    }
    float _479 = _429;
    bool _481 = !_279;
    float _483 = _479;
    if (!_481)
    {
        float _485 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _487 = log2(_485);
        float _489 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _491 = _489 + 1.0;
        float _493 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _495 = _149 * _487;
        float _497 = 1.0 / _491;
        float _499 = _493 * 0.693147182464599609375;
        float _501 = exp2(_495);
        float _503 = 1.0 / _499;
        float _505 = _501 + (-1.0);
        float _507 = -_505;
        float _509 = fma(_507, _503, _149);
        float _511 = _509 * _497;
        float _513 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _483 = _513;
    }
    float _515 = _483;
    float _517 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _519 = fma(_475, _337, _469);
    float _521 = fma(_475, _357, _471);
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _525 = _517 * _333;
    float _527 = _517 * _353;
    float _529 = _517 * _377;
    float _531 = fma(_475, _381, _473);
    float _533 = fma(_523, _329, _525);
    float _535 = fma(_523, _345, _527);
    float _537 = fma(_523, _373, _529);
    float _539 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_451, _265, _519);
    float _543 = fma(_451, _267, _521);
    float _545 = fma(_451, _269, _531);
    float _547 = fma(_539, _337, _533);
    float _549 = fma(_539, _357, _535);
    float _551 = fma(_539, _381, _537);
    if (!_279)
    {
        _461 = _149;
    }
    float _553 = _461;
    bool _555 = !_279;
    float _557 = _553;
    if (!_555)
    {
        float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _561 = log2(_559);
        float _563 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _565 = _563 + 1.0;
        float _567 = 1.0 / _565;
        float _569 = _149 * _561;
        float _571 = exp2(_569);
        float _573 = -_571;
        float _575 = _573 + 1.0;
        float _577 = _575 * _567;
        _557 = _577;
    }
    float _579 = _557;
    float _581 = fma(_579, _267, _549);
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _585 = fma(_543, _191, _195);
    float _587 = fma(_579, _265, _547);
    float _589 = -_581;
    float _591 = _543 + _589;
    float _593 = fma(_579, _269, _551);
    float _595 = fma(_541, _191, _193);
    float _597 = -_587;
    float _599 = _541 + _597;
    float _601 = _591 * _179;
    float _603 = _591 * _173;
    float _605 = _591 * _185;
    float _607 = -_593;
    float _609 = _545 + _607;
    float _611 = fma(_599, _177, _601);
    float _613 = fma(_599, _171, _603);
    float _615 = fma(_599, _183, _605);
    float _617 = fma(_545, _191, _197);
    float _619 = fma(_609, _181, _611);
    float _621 = fma(_609, _175, _613);
    float _623 = fma(_609, _187, _615);
    bool _625 = !_583;
    float _627 = _617;
    float _629 = _621;
    float _631 = _619;
    float _633 = _623;
    float _635 = _581;
    float _637 = _581;
    float _639 = _593;
    float _657;
    if (!_625)
    {
        float _641 = in.m_74.x;
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _645 = _641 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _649 = _647 * _643;
        float _651 = floor(_649);
        float _653 = -_651;
        float _655 = _649 + _653;
        _657 = _655;
        _659 = true;
    }
    else
    {
        float _661 = float(_115);
        float _663 = 1.0 / _661;
        float _665 = _149 * _663;
        _657 = _665;
    }
    _659 = false;
    float _667 = _657;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _671 = _667 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _667 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _685 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _687 = isnan(_667);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = in.m_72.x;
    float _699 = in.m_72.y;
    bool _701 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _703 = isnan(_667);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = 1.0 / _683;
    bool _715 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _717 = -_695;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _679;
    float _723 = _675 * _713;
    float _725 = _671 * _721;
    bool _727 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _729 = isnan(_667);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _743;
    float _747 = -_737;
    float _749 = _747 + 1.0;
    float _751 = fma(_741, _725, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _753 = fma(_745, _725, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _755 = _737 * _719;
    float _757 = _711 * _749;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _763 = -_711;
    float _765 = _763 + 1.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _771 = _751 * _757;
    float _773 = _753 * _757;
    float _775 = fma(_761, _723, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_769, _723, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[143].x, _771);
    float _781 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[143].y, _773);
    float _783 = fma(_775, _755, _779);
    float _785 = fma(_777, _755, _781);
    float _787 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[145].x, _783);
    float _789 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[145].y, _785);
    float _791 = _787 * _697;
    float _793 = _789 * _699;
    bool _795 = !_715;
    float _813;
    if (!_795)
    {
        float _797 = in.m_74.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_115);
        float _819 = 1.0 / _817;
        float _821 = _149 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _827 = _823 + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _837 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _839 = isnan(_823);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _853 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_823);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = 1.0 / _831;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    float _871 = -_847;
    float _873 = _871 + 1.0;
    bool _875 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _877 = isnan(_823);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = 1.0 / _835;
    float _891 = 1.0 / _851;
    float _893 = _869 * _865;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _899 = _863 * _873;
    float _901 = -_863;
    float _903 = _901 + 1.0;
    float _905 = fma(_893, _827, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _907 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _909 = isnan(_823);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _885 * _903;
    float _921 = _897 * _889;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _823 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _927;
    float _931 = _905 * _919;
    float _933 = -_885;
    float _935 = _933 + 1.0;
    float _937 = fma(_921, _925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _939 = -_917;
    float _941 = _939 + 1.0;
    float _943 = _929 * _891;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _947 = _823 + _945;
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _951 = _847 * _941;
    float _953 = fma(_943, _947, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _955 = fma(_937, _899, _949);
    float _957 = fma(_953, _951, _955);
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _965 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[118].x, _957);
    float _967 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _965 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_76.x = _967;
    out.m_76.y = _969;
    out.m_76.z = _971;
    out.m_76.w = _973;
    bool _975 = !_887;
    float _995;
    float _997;
    if (!_975)
    {
        float _977 = in.m_74.x;
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _981 = float(_115);
        float _983 = _977 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _987 = _985 * _979;
        float _989 = floor(_987);
        float _991 = -_989;
        float _993 = _987 + _991;
        _995 = _993;
        _997 = _981;
        _999 = true;
    }
    else
    {
        float _1001 = float(_115);
        float _1003 = 1.0 / _1001;
        float _1005 = _149 * _1003;
        _995 = _1005;
        _997 = _1001;
    }
    _999 = false;
    float _1007 = _995;
    float _1009 = _997;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1013 = int(_1011);
    float _1015 = in.m_65.w;
    float _1017 = _585 * _185;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1021 = _1019 != 0;
    float _1023 = in.m_67.w;
    float _1025 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1027 = int(_1025);
    float _1029 = fma(_595, _183, _1017);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1033 = _1007 + _1031;
    float _1035 = in.m_63.w;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1039 = 1.0 / _1009;
    float _1041 = float(_1013);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1045 = 1.0 / _1041;
    float _1047 = float(uint(_1027));
    float _1049 = float(_1027);
    bool _1051 = _1027 == 0;
    float _1053 = 1.0 / _1047;
    float _1055 = _149 * _1045;
    float _1057 = trunc(_1055);
    int _1059 = int(_1057);
    int _1061 = as_type<int>(_1053) + (-2);
    float _1063 = float(uint(_1059));
    float _1065 = as_type<float>(_1061) * _1063;
    int _1067 = ~_1027;
    int _1069 = _1067 + 1;
    float _1071 = trunc(_1065);
    float _1073 = precise::max(_1071, 0.0);
    uint _1076 = uint(_1073);
    int _1078 = ~_1027;
    int _1080 = _1078 + 1;
    int _1082 = _1069 * int(_1076);
    int _1084 = _1082 + _1059;
    float _1086 = float(uint(_1084));
    float _1088 = as_type<float>(_1061) * _1086;
    float _1090 = in.m_74.x;
    float _1092 = in.m_74.y;
    float _1094 = in.m_74.z;
    float _1096 = in.m_74.w;
    float _1098 = trunc(_1088);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = int(_1076) + int(_1102);
    float _1106 = float(_1059);
    int _1108 = _1080 * _1104;
    int _1110 = _1108 + _1059;
    bool _1112 = _1106 >= _1049;
    bool _1114 = isnan(_1106);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1049);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = !_1021;
    float _1126 = _1124 ? 7.345489978790283203125 : 1.0;
    bool _1128 = uint(_1110) >= uint(_1027);
    float _1130 = trunc(_1122);
    int _1132 = int(_1130);
    float _1134 = _1126 * _1090;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    int _1140 = ~_1104;
    int _1142 = _1140 + _1138;
    int _1144 = _1142 + 1;
    float _1146 = floor(_1134);
    int _1148 = _1027 * _1144;
    int _1150 = _1148 + _1059;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1162 = _1160 != 0;
    int _1164 = ~_1132;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    bool _1170 = !_1051;
    int _1172 = _1170 ? _1150 : (-1);
    bool _1174 = !_1154;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _1172 * _1168;
    float _1180 = -_1146;
    float _1182 = _1134 + _1180;
    int _1184 = _1027 + (-1);
    float _1186 = _1182 * _1049;
    float _1188 = _149 * _1049;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1192 = _1190 != 0;
    bool _1194 = !_1158;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = _1188 * _1039;
    float _1200 = trunc(_1186);
    int _1202 = int(_1200);
    int _1204 = _1132 * _1184;
    int _1206 = _1204 + _1178;
    bool _1208 = !_1192;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = abs(_1196);
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1216 = _1214 != 0;
    float _1218 = trunc(_1198);
    int _1220 = int(_1218);
    bool _1222 = !_1162;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = _1206 * _1212;
    int _1228 = abs(_1176);
    int _1230 = abs(_1210);
    bool _1232 = !_1216;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = abs(_1224);
    int _1238 = _1202 * _1230;
    int _1240 = _1238 + _1059;
    int _1242 = abs(_1234);
    int _1244 = _1220 * _1228;
    int _1246 = _1244 + _1226;
    float _1248 = _585 * _173;
    int _1250 = ~_1027;
    int _1252 = _1250 + 1;
    int _1254 = _1240 * _1236;
    int _1256 = _1254 + _1246;
    int _1258 = ~_1027;
    int _1260 = _1258 + 1;
    float _1262 = fma(_595, _171, _1248);
    float _1264 = float(uint(_1240));
    int _1266 = _1202 * _1242;
    int _1268 = _1266 + _1256;
    float _1270 = as_type<float>(_1061) * _1264;
    float _1272 = float(uint(_1268));
    float _1274 = trunc(_1270);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    float _1280 = as_type<float>(_1061) * _1272;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    bool _1288 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1290 = isnan(_1007);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    bool _1300 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1302 = isnan(_1007);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    int _1312 = _1252 * int(_1286);
    int _1314 = _1312 + _1268;
    float _1316 = float(uint(_1314));
    float _1318 = as_type<float>(_1061) * _1316;
    float _1320 = trunc(_1318);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    int _1326 = int(_1286) + int(_1324);
    int _1328 = _1260 * _1326;
    int _1330 = _1328 + _1268;
    bool _1332 = uint(_1330) >= uint(_1027);
    float _1334 = _1090 * 2.0;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = floor(_1334);
    int _1342 = ~_1326;
    int _1344 = _1342 + _1338;
    int _1346 = _1344 + 1;
    int _1348 = _1027 * _1346;
    int _1350 = _1348 + _1268;
    bool _1352 = !_1051;
    int _1354 = _1352 ? _1350 : (-1);
    int _1356 = _1354 & 3;
    bool _1358 = _1356 != 0;
    int _1360 = _1354 & 3;
    bool _1362 = _1360 != 0;
    bool _1364 = uint(_1356) > 1u;
    int _1366 = _1362 ? 0 : 1;
    bool _1368 = _1096 > 0.5;
    float _1370 = _1092 * 2.0;
    int _1372 = ~_1366;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = _1340 >= 0.0;
    bool _1380 = isnan(_1340);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan(0.0);
    bool _1386 = _1382 || _1384;
    float _1388 = floor(_1370);
    float _1390 = -_361;
    int _1392 = _1368 ? as_type<int>(_1390) : as_type<int>(_361);
    bool _1394 = _1092 > 0.5;
    int _1396 = _1376;
    float _1398 = _1029;
    if (!_1364)
    {
        int _1400 = ~_1366;
        int _1402 = _1400 + 1;
        _1396 = _1402;
    }
    int _1404 = _1396;
    bool _1406 = _1090 > 0.5;
    int _1408 = _1386 ? 0 : 1;
    float _1410 = -_341;
    int _1412 = _1406 ? as_type<int>(_1410) : as_type<int>(_341);
    bool _1414 = _1340 > 0.0;
    int _1416 = ~_1408;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = -_361;
    int _1424 = _1394 ? as_type<int>(_1422) : as_type<int>(_361);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1428 = _1426 != 0;
    bool _1430 = !_1428;
    float _1432 = _1430 ? _361 : as_type<float>(_1392);
    bool _1434 = _1094 > 0.5;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1440 = _1420;
    if (!_1414)
    {
        int _1442 = ~_1408;
        int _1444 = _1442 + 1;
        _1440 = _1444;
    }
    int _1446 = _1440;
    bool _1448 = _1388 >= 0.0;
    bool _1450 = isnan(_1388);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    int _1466 = _1456 ? 0 : 1;
    bool _1468 = _1388 > 0.0;
    float _1470 = _585 * _179;
    float _1472 = -_341;
    int _1474 = _1434 ? as_type<int>(_1472) : as_type<int>(_341);
    float _1476 = 1.0 / _1438;
    bool _1478 = !_1464;
    float _1480 = _1478 ? _341 : as_type<float>(_1412);
    float _1482 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1486 = _1484 != 0;
    float _1488 = fma(_595, _177, _1470);
    float _1490 = _1094 * 2.0;
    float _1492 = -_1037;
    float _1494 = fma(_1482, 2.0, _1492);
    bool _1496 = !_1486;
    float _1498 = _1496 ? _361 : as_type<float>(_1424);
    float _1500 = fma(_617, _181, _1488);
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1504 = _1502 != 0;
    float _1506 = fma(_617, _175, _1262);
    int _1508 = ~_1466;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    float _1514 = _1500 + _1015;
    int _1516 = _1512;
    if (!_1468)
    {
        int _1518 = ~_1466;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = _149 * _1460;
    float _1526 = fma(_617, _187, _1029);
    bool _1528 = !_1504;
    float _1530 = _1528 ? _341 : as_type<float>(_1474);
    float _1532 = _1092 + _1090;
    int _1534 = ~_1027;
    int _1536 = _1534 + 1;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1538;
    float _1542 = floor(_1490);
    float _1544 = _1532 + (-1.0);
    float _1546 = _1526 + _1023;
    float _1548 = -_1310;
    float _1550 = _1548 + 1.0;
    int _1552 = _1536 * int(_1278);
    int _1554 = _1552 + _1240;
    float _1556 = _1540 * _1476;
    float _1558 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1560 = _1298 * _1550;
    float _1562 = exp2(_1524);
    float _1564 = -_149;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1494);
    float _1568 = _1480 + 0.5;
    float _1570 = float(uint(_1554));
    float _1572 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1574 = _1572;
    if (!_1021)
    {
        _627 = _1092;
    }
    float _1576 = _627;
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1566);
    float _1580 = _1576;
    if (!_1021)
    {
        _1398 = _1094;
    }
    float _1582 = _1398;
    float _1584 = as_type<float>(_1061) * _1570;
    float _1586 = fma(_1572, -2.0, _1043);
    float _1588 = _1582;
    if (!_1021)
    {
        _1574 = _1094;
    }
    float _1590 = _1574;
    float _1592 = fma(_1556, _1033, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1594 = _1590;
    if (_1021)
    {
        _1580 = _1090;
    }
    float _1596 = _1580;
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1021)
    {
        _1594 = _1092;
    }
    float _1600 = _1594;
    float _1602 = _1506 + _1035;
    if (_1021)
    {
        _1588 = _1092;
    }
    float _1604 = _1588;
    float _1606 = -_1562;
    float _1608 = _1606 + 1.0;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1620 = _1618 != 0;
    float _1622 = _1092 + _1094;
    bool _1624 = _1542 >= 0.0;
    bool _1626 = isnan(_1542);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    float _1634 = trunc(_1584);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1642 = _1354 >> 31;
    float _1644 = _1622 + (-1.0);
    int _1646 = _1632 ? 0 : 1;
    float _1648 = _1592 * _1560;
    bool _1650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1658 = _1654 || _1656;
    float _1660 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1662 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1586);
    float _1664 = _1658 ? _1608 : 0.0;
    float _1666 = _1498 + (-0.5);
    bool _1668 = _1542 > 0.0;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1674 = _1642 & 3;
    float _1676 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1670);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1680 = _1354 + _1674;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1684 = 1.0 + _1682;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1688 = int(_1278) + int(_1638);
    float _1690 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1692 = _1680 >> 2;
    float _1694 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1678);
    float _1696 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1700 = -_1666;
    float _1702 = -_1662;
    float _1704 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1702);
    float _1706 = -_1298;
    float _1708 = _1706 + 1.0;
    int _1710 = _1692 << 4;
    int _1712 = _1710 + 368;
    float _1714 = 1.0 / _1684;
    float _1716 = fma(_1640, -2.0, _1698);
    float _1718 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1720 = -_1686;
    float _1722 = fma(_1696, 2.0, _1720);
    float _1724 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1648);
    uint _1726 = uint(int(uint(_1712) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    int _1742 = ~_1027;
    int _1744 = _1742 + 1;
    float _1746 = _1530 + 0.5;
    float _1748 = -_149;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1722);
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _1432 + (-0.5);
    int _1760 = _1744 * _1688;
    int _1762 = _1760 + _1240;
    int _1764 = _1756;
    int _1766 = as_type<int>(_1660);
    if (!_1668)
    {
        int _1768 = ~_1646;
        int _1770 = _1768 + 1;
        _1764 = _1770;
    }
    int _1772 = _1764;
    float _1774 = fma(_1718, _1746, _1750);
    bool _1776 = !_1616;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = _1712 + 8;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    uint _1784 = uint(int(uint(int(_1782)) >> uint(2)));
    int _1786 = int(_1782) & 3;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[int(_1784)][_1786];
    int _1790 = int(_1782) + 1;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    int _1794 = _1790 & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    bool _1798 = uint(_1762) >= uint(_1027);
    float _1800 = _1664 * _1714;
    float _1802 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1716);
    bool _1804 = !_1612;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1694);
    bool _1810 = !_1798;
    int _1812 = _1810 ? 0 : (-1);
    float _1814 = -_1690;
    float _1816 = -_1802;
    float _1818 = fma(_1814, _1758, _1816);
    bool _1820 = uint(_1356) >= 2u;
    float _1822 = -_1808;
    float _1824 = _1822 + 1.0;
    int _1826 = abs(_1778);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1602 + _1828;
    int _1832 = abs(_1806);
    float _1834 = -_1824;
    float _1836 = fma(_1530, _1834, _1774);
    int _1838 = _1820 ? 0 : 1;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1514 + _1840;
    bool _1844 = _1356 != 3;
    float _1846 = _1830 * _1830;
    float _1848 = float(_1832);
    float _1850 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    float _1852 = float(_1772);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1546 + _1854;
    int _1858 = ~_1838;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1866 = ~_1688;
    int _1868 = _1866 + _1812;
    int _1870 = _1868 + 1;
    float _1872 = _1848 * _1852;
    float _1874 = -_1850;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1864);
    int _1880 = _1862;
    float _1882 = _1836;
    if (_1844)
    {
        int _1884 = ~_1838;
        int _1886 = _1884 + 1;
        _1880 = _1886;
    }
    int _1888 = _1880;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1892 = !_1358;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1878);
    int _1898 = abs(_1404);
    float _1900 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1890);
    int _1902 = abs(_1894);
    int _1904 = _1027 * _1870;
    int _1906 = _1904 + _1240;
    bool _1908 = _1356 != 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1912 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1900);
    int _1914 = ~_1898;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1910);
    int _1922 = abs(_1888);
    float _1924 = -_1912;
    float _1926 = _1924 + 1.0;
    int _1928 = ~_1902;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1918 * as_type<int>(_1740);
    float _1936 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1920);
    float _1938 = fma(_1498, _1926, _1704);
    int _1940 = _1932 * as_type<int>(_1732);
    int _1942 = _1940 + _1934;
    int _1944 = ~_1922;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = -_1936;
    float _1952 = _1950 + 1.0;
    bool _1954 = !_1908;
    int _1956 = _1954 ? 0 : (-1);
    float _1958 = _1872 * (-2.0);
    int _1960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1962 = _1960 != 0;
    int _1964 = _1948 * as_type<int>(_1788);
    int _1966 = _1964 + _1942;
    int _1968 = abs(_1956);
    float _1970 = in.m_78.x;
    float _1972 = in.m_78.y;
    float _1974 = in.m_78.z;
    float _1976 = fma(_1842, _1842, _1846);
    bool _1978 = !_1962;
    int _1980 = _1978 ? 0 : 1;
    float _1982 = -_1952;
    float _1984 = fma(_1480, _1982, _1578);
    float _1986 = fma(_1856, _1856, _1976);
    int _1988 = abs(_1980);
    float _1990 = fma(_1432, _1876, _1818);
    int _1992 = ~_1968;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = rsqrt(_1986);
    float _2000 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1724);
    bool _2002 = _1896 >= 0.0;
    int _2004 = _1996 * as_type<int>(_1796);
    int _2006 = _2004 + _1966;
    int _2008 = ~_1988;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    out.m_80.x = _1984;
    out.m_80.y = _1938;
    out.m_80.z = _1836;
    out.m_80.w = _1990;
    float _2014 = float(_1446);
    float _2016 = _2000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2018 = float(_1826);
    int _2020 = _2006 * _2012;
    bool _2022 = !_1051;
    int _2024 = _2022 ? _1906 : (-1);
    float _2026 = fma(_1558, _1958, _1558);
    out.m_82.w = _2016;
    float _2028 = _2018 * _2014;
    float _2030 = fma(_1958, _1970, _1970);
    float _2032 = _1830 * _1998;
    int _2034 = _2024 * _1988;
    int _2036 = _2034 + _2020;
    float _2038 = _2028 * (-2.0);
    float _2040 = _1842 * _1998;
    int _2042 = as_type<int>(_2040);
    if (_2002)
    {
        _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2044 = _1882;
    float _2046 = -_2032;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1830);
    float _2050 = fma(_1660, _2038, _1660);
    float _2052 = _1090 + (-0.5);
    float _2054 = _2048 * _2048;
    if (_2002)
    {
        float _2056 = _2044 * 5.0;
        _1766 = as_type<int>(_2056);
    }
    int _2058 = _1766;
    float _2060 = float(_2036);
    float _2062 = -_2040;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1842);
    if (_2002)
    {
        out.m_59.x = 0.0;
    }
    float _2066 = fma(_2038, _1972, _1972);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2070 = fma(_2064, _2064, _2054);
    if (_2002)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7135 = as_type<float>(_2058);
        out.gl_Position.z = _7135;
    }
    bool _2072 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2074 = isnan(1.0);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2080 = _2076 || _2078;
    bool _2082 = !_1620;
    int _2084 = _2082 ? 0 : 1;
    out.m_84.x = _2060;
    if (_2002)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2086 = -_2032;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1602);
    float _2090 = _1856 * _1998;
    float _2092 = -_2040;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1514);
    bool _2096 = !_2080;
    float _2098 = _2096 ? _149 : _1800;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2102 = _2088 + _2100;
    float _2104 = -_2090;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2108 = -_2090;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2114 = _2094 + _2112;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2118 = fma(_2106, _2106, _2070);
    int _2120 = abs(_2084);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2124 = _2110 + _2122;
    float _2126 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2116);
    float _2128 = fma(_2098, _2026, _2068);
    float _2130 = _1092 + (-0.5);
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2126);
    float _2134 = float(_1522);
    float _2136 = _1094 + _1090;
    float _2138 = float(_2120);
    float _2140 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2066);
    bool _2142 = _2132 >= 0.0;
    float _2144 = _2128 * 0.15915493667125701904296875;
    float _2146 = _2138 * _2134;
    float _2148 = fma(_2098, _2050, _2140);
    float _2150 = _2136 + (-1.0);
    float _2152 = _1094 + (-0.5);
    float _2154 = _2146 * (-2.0);
    float _2156 = _2148 * 0.15915493667125701904296875;
    float _2158 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2160 = sqrt(_2118);
    float _2162 = fma(_2154, _1974, _1974);
    float _2164 = _2134;
    int _2166 = as_type<int>(_2152);
    int _2168 = as_type<int>(_2114);
    if (_2142)
    {
        _2164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2170 = _2164;
    float _2172 = fma(_2158, _2154, _2158);
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2162);
    if (_2142)
    {
        out.m_59.x = 0.0;
    }
    float _2176 = _2144 * 6.283185482025146484375;
    float _2178 = sin(_2176);
    if (_2142)
    {
        float _2180 = _2170 * 5.0;
        _2166 = as_type<int>(_2180);
    }
    int _2182 = _2166;
    float _2184 = fma(_2098, _2172, _2174);
    if (_2142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7331 = as_type<float>(_2182);
        out.gl_Position.z = _7331;
    }
    float _2186 = _2184 * 0.15915493667125701904296875;
    float _2188 = _2144 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    float _2192 = _2156 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    float _2196 = _2156 * 6.283185482025146484375;
    float _2198 = cos(_2196);
    if (_2142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2200 = _793 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2202 = _1998 * _2160;
    float _2204 = _2186 * 6.283185482025146484375;
    float _2206 = cos(_2204);
    float _2208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _361);
    float _2210 = _2190 * _2198;
    float _2212 = _2202 * _2200;
    float _2214 = _2190 * _2194;
    float _2216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _341);
    float _2218 = _2178 * _2194;
    float _2220 = _2208 * _2212;
    float _2222 = _2186 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2228 = _2178 * _2198;
    float _2230 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2232 = _2230 * 0.5;
    float _2234 = _2202 * _2226;
    float _2236 = _2190 * _2206;
    float _2238 = _2178 * _2206;
    float _2240 = _2216 * _2234;
    float _2242 = _2194 * _2206;
    float _2244 = _2236 * _2220;
    float _2246 = _2198 * _2206;
    float _2248 = _2238 * _2220;
    float _2250 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_2224, _2210, _2218);
    float _2254 = -_2228;
    float _2256 = fma(_2224, _2214, _2254);
    float _2258 = -_2220;
    float _2260 = _2224 * _2258;
    float _2262 = fma(_2224, _2218, _2210);
    float _2264 = fma(_2252, _2240, _2244);
    float _2266 = -_2214;
    float _2268 = fma(_2224, _2228, _2266);
    float _2270 = fma(_2246, _2240, _2260);
    float _2272 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = fma(_2256, _2232, _2264);
    float _2276 = fma(_2268, _2240, _2248);
    float _2278 = fma(_2242, _2232, _2270);
    float _2280 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2284 = fma(_2262, _2232, _2276);
    float _2286 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2288 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2282);
    float _2292 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2286);
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2290);
    float _2300 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2302 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    float _2304 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2296);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2308 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2280);
    float _2310 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2312 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2314 = _1546 + _2306;
    float _2316 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2318 = _1514 + _2310;
    float _2320 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2324 = _2314 + _2322;
    float _2326 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2330 = _2318 + _2328;
    float _2332 = _1602 + _2312;
    float _2334 = _2324 * _2324;
    float _2336 = -_2224;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2320);
    float _2340 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2300);
    float _2342 = -_2224;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2346 = fma(_2330, _2330, _2334);
    float _2348 = -_2224;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2352 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2354 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2316);
    float _2356 = sqrt(_2346);
    float _2358 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2360 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2362 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = _2268;
    float _2366 = _2224;
    float _2368 = _2318;
    float _2370 = _2340;
    if (!_2362)
    {
        _2364 = _2314;
    }
    float _2372 = _2364;
    float _2374 = _2372;
    if (!_2362)
    {
        _2366 = _2332;
    }
    float _2376 = _2366;
    bool _2378 = !_2362;
    float _2380 = _2376;
    if (!_2378)
    {
        float _2382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2386 = _2356 + _2384;
        float _2388 = rsqrt(_2346);
        float _2390 = _2386 * _2382;
        float _2392 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2394 = _2390 * 0.15915493667125701904296875;
        float _2396 = _2394 * 6.283185482025146484375;
        float _2398 = sin(_2396);
        float _2400 = _2394 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        float _2404 = fma(_2398, _2392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2406 = _2388 * _2404;
        float _2408 = _2402 + (-1.0);
        float _2410 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2412 = fma(_2330, _2406, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2414 = fma(_2324, _2406, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2416 = fma(_2332, _2402, _2410);
        _2380 = _2416;
        _2368 = _2412;
        _2374 = _2414;
    }
    float _2418 = _2380;
    float _2420 = _2368;
    float _2422 = _2374;
    float _2424 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2426 = -_1602;
    float _2428 = _2426 + _2418;
    float _2430 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2432 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    float _2434 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2424);
    float _2436 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2438 = -_1514;
    float _2440 = _2438 + _2420;
    float _2442 = _2428 * _2428;
    float _2444 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2338);
    float _2446 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2344);
    float _2448 = -_1546;
    float _2450 = _2448 + _2422;
    float _2452 = fma(_2440, _2440, _2442);
    float _2454 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2350);
    float _2456 = _2436 * _2444;
    float _2458 = _2436 * _2446;
    float _2460 = fma(_2450, _2450, _2452);
    float _2462 = _2436 * _2454;
    float _2464 = _341 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2466 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    float _2468 = sqrt(_2460);
    float _2470 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2432);
    float _2472 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2434);
    float _2474 = fma(_2464, _2340, _2456);
    float _2476 = fma(_2464, _2352, _2458);
    float _2478 = fma(_2464, _2354, _2462);
    float _2480 = _2466 + _2474;
    float _2482 = _2470 + _2476;
    float _2484 = _2472 + _2478;
    out.m_86.x = _2480;
    out.m_86.y = _2482;
    out.m_86.z = _2484;
    bool _2486 = _2468 > 0.0;
    float _2488 = _2468;
    float _2490 = _2476;
    float _2492 = _2418;
    float _2494 = _2422;
    if (!_2486)
    {
        _2488 = _2420;
    }
    float _2496 = _2488;
    bool _2498 = !_2486;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2498)
    {
        bool _2504 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2506 = _2354;
        if (_2504)
        {
            float _2508 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2506 = _2508;
        }
        float _2510 = _2506;
        float _2512 = _2510;
        if (_2504)
        {
            float _2514 = _619 * _2510;
            _2370 = _2514;
        }
        float _2516 = _2370;
        float _2518 = _2516;
        if (_2504)
        {
            float _2520 = _621 * _2510;
            _2490 = _2520;
        }
        float _2522 = _2490;
        float _2524 = _2522;
        if (_2504)
        {
            float _2526 = _623 * _2510;
            _2512 = _2526;
        }
        float _2528 = _2512;
        float _2530 = _2528;
        if (!_2504)
        {
            float _2532 = _149 + 1.0;
            if (!_279)
            {
                float _2534 = _2532 * _2532;
                float _2536 = _2534 * 0.5;
                _151 = _2536;
            }
            float _2538 = _151;
            float _2540 = _2538;
            if (!_279)
            {
                float _2542 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2540 = _2542;
            }
            float _2544 = _2540;
            bool _2546 = !_279;
            float _2548 = _2544;
            if (!_2546)
            {
                float _2550 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2552 = log2(_2550);
                float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2556 = 1.0 + _2554;
                float _2558 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2560 = _2552 * _2532;
                float _2562 = 1.0 / _2556;
                float _2564 = _2558 * 0.693147182464599609375;
                float _2566 = exp2(_2560);
                float _2568 = 1.0 / _2564;
                float _2570 = _2566 + (-1.0);
                float _2572 = -_2570;
                float _2574 = fma(_2572, _2568, _2532);
                float _2576 = _2574 * _2562;
                float _2578 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2548 = _2578;
            }
            float _2580 = _2548;
            float _2582 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2584 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2586 = _2582 * _353;
            float _2588 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2590 = _2582 * _333;
            float _2592 = _2582 * _377;
            float _2594 = fma(_2584, _345, _2586);
            float _2596 = _2580;
            _2500 = _2584;
            if (!_279)
            {
                _2596 = _2532;
            }
            float _2598 = _2596;
            float _2600 = fma(_2584, _329, _2590);
            float _2602 = fma(_2588, _357, _2594);
            bool _2604 = !_279;
            float _2606 = _2598;
            if (!_2604)
            {
                float _2608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2610 = log2(_2608);
                float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2614 = 1.0 + _2612;
                float _2616 = 1.0 / _2614;
                float _2618 = _2610 * _2532;
                float _2620 = exp2(_2618);
                float _2622 = -_2620;
                float _2624 = _2622 + 1.0;
                float _2626 = _2624 * _2616;
                _2606 = _2626;
            }
            float _2628 = _2606;
            float _2630 = fma(_2588, _337, _2600);
            float _2632 = fma(_2584, _373, _2592);
            float _2634 = fma(_2628, _267, _2602);
            float _2636 = fma(_2628, _265, _2630);
            float _2638 = fma(_2588, _381, _2632);
            float _2640 = -_581;
            float _2642 = _2640 + _2634;
            float _2644 = -_587;
            float _2646 = _2644 + _2636;
            float _2648 = fma(_2628, _269, _2638);
            float _2650 = _2642 * _179;
            float _2652 = _2642 * _173;
            float _2654 = _2642 * _185;
            float _2656 = -_593;
            float _2658 = _2656 + _2648;
            float _2660 = fma(_2646, _177, _2650);
            float _2662 = fma(_2646, _171, _2652);
            float _2664 = fma(_2646, _183, _2654);
            float _2666 = fma(_2658, _181, _2660);
            float _2668 = fma(_2658, _175, _2662);
            float _2670 = fma(_2658, _187, _2664);
            _629 = _2668;
            _631 = _2666;
            _633 = _2670;
            _2518 = _2666;
            _2524 = _2668;
            _2530 = _2670;
            _635 = _2642;
        }
        float _2672 = _629;
        float _2674 = _631;
        float _2676 = _633;
        float _2678 = _2518;
        float _2680 = _2524;
        float _2682 = _2530;
        float _2684 = _2500;
        float _2686 = _635;
        float _2688 = _2672 * _2672;
        float _2690 = rsqrt(_2460);
        float _2692 = fma(_2674, _2674, _2688);
        float _2694 = fma(_2676, _2676, _2692);
        float _2696 = sqrt(_2694);
        float _2698 = _2440 * _2690;
        float _2700 = _2428 * _2690;
        float _2702 = _2450 * _2690;
        bool _2704 = _2696 > 0.0;
        float _2706 = _2684;
        _637 = _2686;
        if (!_2704)
        {
            _2706 = _2420;
        }
        float _2708 = _2706;
        bool _2710 = !_2704;
        _2502 = _2708;
        if (!_2710)
        {
            float _2712 = rsqrt(_2694);
            float _2714 = _2712 * _2672;
            float _2716 = _2712 * _2674;
            float _2718 = _2712 * _2676;
            float _2720 = _2700 * _2714;
            float _2722 = fma(_2698, _2716, _2720);
            float _2724 = fma(_2702, _2718, _2722);
            float _2726 = _2724 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2728 = fma(_2678, _2726, _2420);
            float _2730 = fma(_2680, _2726, _2418);
            float _2732 = fma(_2682, _2726, _2422);
            _2492 = _2730;
            _2502 = _2728;
            _2494 = _2732;
        }
    }
    float _2734 = _2492;
    float _2736 = _2502;
    float _2738 = _2494;
    float _2740 = _637;
    float _2742 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2744 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2746 = floor(_2742);
    float _2748 = floor(_2744);
    float _2750 = -_2746;
    float _2752 = _2742 + _2750;
    float _2754 = -_2748;
    float _2756 = _2744 + _2754;
    float2 _8270 = float2(_2752, _2756);
    float _2758 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8270, float2(0.0), isnan(_8270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8270, float2(0.0), isnan(_8270)), level(0.0)).x;
    float _2760 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2762 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2764 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2760);
    float _2766 = -_2032;
    float _2768 = fma(_2766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2734);
    float _2770 = _2088 + _2762;
    float _2772 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2764);
    float _2774 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2776 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2778 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2780 = _2772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2782 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2774);
    float _2784 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2776);
    float _2786 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2778);
    float _2788 = 1.0 / _2780;
    float _2790 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2782);
    float _2792 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2784);
    float _2794 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2786);
    float _2796 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2798 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2802 = _2796 + _2780;
    float _2804 = trunc(_2798);
    int _2806 = int(_2804);
    float _2808 = _2802 * _2788;
    float _2810 = _2808 * 0.5;
    float _2812 = trunc(_2800);
    int _2814 = int(_2812);
    float _2816 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2818 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2816);
    float _2820 = 1.0 / _2818;
    int _2822 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2824 = _2806 + _2822;
    int _2826 = _2824 + 1;
    int _2828 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2830 = _2814 + _2828;
    int _2832 = _2830 + 1;
    float _2834 = -_2040;
    float _2836 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2736);
    int _2838 = _2826 | _2832;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2842 = _2820 * _2840;
    bool _2844 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2846 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2848 = !_2844;
    int _2850 = _2848 ? 0 : 1;
    int _2852 = 2;
    float _2854 = _2768;
    float _2856 = _2836;
    int _2858 = as_type<int>(_2738);
    float _2860 = as_type<float>(_2832);
    float _2862 = _2798;
    float _2864 = _2736;
    if (!_2844)
    {
        _2852 = 1;
    }
    int _2866 = _2852;
    int _2868 = _2866;
    if (!_2846)
    {
        _2868 = _2850;
    }
    int _2870 = _2868;
    bool _2872 = _2826 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2874 = _2870 << 6;
    bool _2876 = _2838 < 0;
    bool _2878 = _2876 || _2872;
    float _2880 = -_2090;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2738);
    int _2884 = _2874 + 48;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    uint _2888 = uint(int(uint(int(_2886)) >> uint(2)));
    int _2890 = int(_2886) & 3;
    float _2892 = (*spvDescriptorSet0.vp_c15)._m0[int(_2888)][_2890];
    int _2894 = int(_2886) + 1;
    uint _2896 = uint(int(uint(_2894) >> uint(2)));
    int _2898 = _2894 & 3;
    float _2900 = (*spvDescriptorSet0.vp_c15)._m0[int(_2896)][_2898];
    bool _2902 = _2832 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2904 = _2902 || _2878;
    bool _2906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2908 = isnan(0.5);
    bool _2910 = _2906 || _2908;
    bool _2912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2914 = _2910 || _2912;
    int _2916 = _2874 + 56;
    uint _2918 = uint(int(uint(_2916) >> uint(2)));
    uint _2920 = uint(int(uint(int(_2918)) >> uint(2)));
    int _2922 = int(_2918) & 3;
    float _2924 = (*spvDescriptorSet0.vp_c15)._m0[int(_2920)][_2922];
    int _2926 = int(_2918) + 1;
    uint _2928 = uint(int(uint(_2926) >> uint(2)));
    int _2930 = _2926 & 3;
    float _2932 = (*spvDescriptorSet0.vp_c15)._m0[int(_2928)][_2930];
    float _2934 = _2882;
    float _2936 = as_type<float>(_2870);
    if (!_2904)
    {
        int _2938 = _2832 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2940 = _2938 + _2826;
        _2042 = _2940;
    }
    int _2942 = _2042;
    int _2944 = _2874 + 64;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c15)._m0[int(_2956)][_2958];
    int _2962 = _2874 + 72;
    uint _2964 = uint(int(uint(_2962) >> uint(2)));
    uint _2966 = uint(int(uint(int(_2964)) >> uint(2)));
    int _2968 = int(_2964) & 3;
    float _2970 = (*spvDescriptorSet0.vp_c15)._m0[int(_2966)][_2968];
    int _2972 = int(_2964) + 1;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    int _2976 = _2972 & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = _2874 + 96;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    uint _2984 = uint(int(uint(int(_2982)) >> uint(2)));
    int _2986 = int(_2982) & 3;
    float _2988 = (*spvDescriptorSet0.vp_c15)._m0[int(_2984)][_2986];
    int _2990 = int(_2982) + 1;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    int _2994 = _2990 & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = _2874 + 104;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    uint _3002 = uint(int(uint(int(_3000)) >> uint(2)));
    int _3004 = int(_3000) & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    int _3008 = int(_3000) + 1;
    uint _3010 = uint(int(uint(_3008) >> uint(2)));
    int _3012 = _3008 & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = as_type<int>(_2996);
    float _3018 = as_type<float>(_2942);
    if (!_2914)
    {
        float _3020 = _2102 * _2102;
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3024 = -_1602;
        float _3026 = _3024 + _2734;
        float _3028 = -_1514;
        float _3030 = _3028 + _2736;
        float _3032 = fma(_2114, _2114, _3020);
        float _3034 = -_1546;
        float _3036 = _3034 + _2738;
        float _3038 = fma(_2124, _2124, _3032);
        float _3040 = 1.0 / _2202;
        float _3042 = sqrt(_3038);
        float _3044 = precise::min(_3042, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3046 = _3044 * _3022;
        float _3048 = _3046 * _3040;
        float _3050 = fma(_3026, _3048, _2088);
        float _3052 = fma(_3030, _3048, _2094);
        float _3054 = fma(_3036, _3048, _2110);
        _2854 = _3050;
        _2168 = as_type<int>(_3042);
        _2856 = _3052;
        _2934 = _3054;
    }
    float _3056 = _2854;
    int _3058 = _2168;
    float _3060 = _2856;
    float _3062 = _2934;
    float _3064 = _2770 * _2996;
    int _3066 = _3058;
    int _3068 = as_type<int>(_3064);
    if (!_2904)
    {
        int _3070 = _2942 << 2;
        _3066 = _3070;
    }
    int _3072 = _3066;
    float _3074 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2904)
    {
        uint _3076 = uint(int(uint(_2942) >> uint(2)));
        _3016 = int(_3076);
    }
    int _3078 = _3016;
    float _3080 = fma(_2094, _2988, _3064);
    if (!_2904)
    {
        int _3082 = 12 & _3072;
        _3068 = _3082;
    }
    int _3084 = _3068;
    float _3086 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3074);
    float _3088 = _2770 * _2900;
    float _3090 = fma(_2110, _3006, _3080);
    if (!_2904)
    {
        int _3092 = _3078 << 4;
        int _3094 = _3092 + _3084;
        _2858 = _3094;
    }
    int _3096 = _2858;
    float _3098 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3086);
    int _3100 = _2874 + 80;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    uint _3104 = uint(int(uint(int(_3102)) >> uint(2)));
    int _3106 = int(_3102) & 3;
    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[int(_3104)][_3106];
    int _3110 = int(_3102) + 1;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    int _3114 = _3110 & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    float _3118 = _3090 + _3014;
    float _3120 = fma(_2094, _2892, _3088);
    float _3122 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3124 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3126 = _2770 * _2960;
    float _3128 = fma(_2110, _2924, _3120);
    float _3130 = 1.0 / _3118;
    float _3132 = _2740;
    if (!_2904)
    {
        int _3134 = _3096 + 400;
        uint _3136 = uint(int(uint(_3134) >> uint(2)));
        uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
        int _3140 = int(_3136) & 3;
        float _3142 = (*spvDescriptorSet0.vp_c15)._m0[int(_3138)][_3140];
        _3132 = _3142;
    }
    float _3144 = _3132;
    float _3146 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3148 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3150 = _3128 + _2932;
    float _3152 = -_3146;
    float _3154 = fma(_3152, _3124, 1.0);
    float _3156 = fma(_2094, _2952, _3126);
    float _3158 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3148);
    int _3160 = _2874 + 88;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    float _3178 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3180 = fma(_2110, _2970, _3156);
    float _3182 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3158);
    float _3184 = log2(_3154);
    float _3186 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3178);
    float _3188 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3190 = _3150 * _3130;
    float _3192 = _3180 + _2978;
    float _3194 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3186);
    float _3196 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3198 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3188);
    bool _3200 = _3190 >= 0.0;
    float _3202 = _3192 * _3130;
    float _3204 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3206 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3208 = _3190 <= 1.0;
    bool _3210 = _3208 && _3200;
    float _3212 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3198);
    float _3214 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3216 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3206);
    bool _3218 = _3202 >= 0.0;
    bool _3220 = _3218 && _3210;
    float _3222 = _3212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3224 = _3088;
    float _3226 = _3212;
    if (!_2904)
    {
        float _3228 = floor(_2798);
        _3224 = _3228;
    }
    float _3230 = _3224;
    float _3232 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3216);
    bool _3234 = _3202 <= 1.0;
    bool _3236 = _3234 && _3220;
    float _3238 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3240 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3214);
    float _3242 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3232);
    float _3244 = _3184 * 0.693147182464599609375;
    float _3246 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3238);
    float _3248 = _3154;
    if (!_2904)
    {
        float _3250 = floor(_2800);
        _3248 = _3250;
    }
    float _3252 = _3248;
    float _3254 = _2770 * _3116;
    float _3256 = _3244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3258 = fma(_2094, _3108, _3254);
    if (_3236)
    {
        float _3260 = float(_2870);
        _3226 = _3260;
    }
    float _3262 = _3226;
    float _3264 = 1.0 / _3242;
    if (!_2904)
    {
        float _3266 = -_3230;
        float _3268 = _2798 + _3266;
        _2860 = _3268;
    }
    float _3270 = _2860;
    float _3272 = _3144;
    if (!_2904)
    {
        float _3274 = rint(_3144);
        float _3276 = precise::max(_3274, 0.0);
        uint _3278 = uint(_3276);
        uint _3280 = clamp(_3278, 0u, 65535u);
        _3272 = as_type<float>(_3280);
    }
    float _3282 = _3272;
    float _3284 = _3252;
    if (!_2904)
    {
        float _3286 = -_3252;
        float _3288 = _2800 + _3286;
        _3284 = _3288;
    }
    float _3290 = _3284;
    float _3292 = fma(_2110, _3168, _3258);
    float _3294 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3246);
    float _3296 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3240);
    float _3298 = _3292 + _3176;
    float _3300 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3294);
    float _3302 = _3262;
    if (_3236)
    {
        float _3304 = rint(_3262);
        float _3306 = precise::max(_3304, 0.0);
        uint _3308 = uint(_3306);
        uint _3310 = clamp(_3308, 0u, 65535u);
        _3302 = as_type<float>(_3310);
    }
    float _3312 = _3302;
    float _3314 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3296);
    float _3316 = _3298 * _3130;
    float _3318 = _3300 * _3264;
    float _3320 = _3314 * _3264;
    float _3322 = fma(_3318, 0.5, 0.5);
    float _3324 = fma(_3320, -0.5, 0.5);
    float _3326 = _3282;
    float _3328 = _3320;
    float _3330 = _3314;
    if (!_2904)
    {
        float3 _9246 = float3(_3270, _3290, float(as_type<int>(_3282)));
        float3 _9250 = select(_9246, float3(0.0), isnan(_9246));
        float _3332 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9250.xy, uint(rint(_9250.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9250.xy, uint(rint(_9250.z)), level(0.0)).x;
        _3326 = _3332;
    }
    float _3334 = _3326;
    float _3336 = _3312;
    if (_3236)
    {
        float3 _9265 = float3(_3190, _3202, float(as_type<int>(_3312)));
        float3 _9267 = select(_9265, float3(0.0), isnan(_9265));
        float _3338 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9267.xy, uint(rint(_9267.z)), _3316, level(0.0));
        _3336 = _3338;
    }
    float _3340 = _3336;
    float3 _9277 = float3(_3322, _3324, _3256);
    float _3342 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9277, float3(0.0), isnan(_9277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9277, float3(0.0), isnan(_9277)), level(0.0)).x;
    float3 _9286 = float3(_3322, _3324, _3256);
    float4 _3345 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9286, float3(0.0), isnan(_9286)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9286, float3(0.0), isnan(_9286)), level(0.0)).xyzw;
    float _3347 = _3345.x;
    float _3349 = _3345.y;
    float _3351 = _3345.z;
    float _3353 = _3345.w;
    bool _3355 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3357 = isnan(0.5);
    bool _3359 = _3355 || _3357;
    bool _3361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3363 = _3359 || _3361;
    if (_2904)
    {
        _639 = 1.0;
    }
    float _3365 = _639;
    float _3367 = _3365;
    if (_3363)
    {
        _2862 = 1.0;
    }
    float _3369 = _2862;
    float _3371 = _3369;
    if (_3363)
    {
        _2936 = 1.0;
    }
    float _3373 = _2936;
    float _3375 = _3373;
    if (!_3363)
    {
        float _3377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3379 = _3377 * 0.15915493667125701904296875;
        float _3381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3383 = _3379 * 6.283185482025146484375;
        float _3385 = cos(_3383);
        float _3387 = _3381 * 0.15915493667125701904296875;
        float _3389 = _3379 * 6.283185482025146484375;
        float _3391 = sin(_3389);
        float _3393 = 1.0 / _3385;
        float _3395 = _3387 * 6.283185482025146484375;
        float _3397 = cos(_3395);
        float _3399 = _3391 * _3393;
        float _3401 = _3387 * 6.283185482025146484375;
        float _3403 = sin(_3401);
        float _3405 = _3397 * _3399;
        float _3407 = 1.0 / _3405;
        float _3409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3409;
        float _3413 = 1.0 / _3411;
        float _3415 = _3403 * _3407;
        float _3417 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3419 = fma(_2842, _3415, _3417);
        float _3421 = _3419 * _3413;
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        _3328 = _3387;
        _3375 = _3423;
    }
    float _3425 = _3328;
    float _3427 = _3375;
    float _3429 = _3425;
    if (!_3363)
    {
        float _3431 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3433 = _3431 * 0.15915493667125701904296875;
        float _3435 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3437 = _3433 * 6.283185482025146484375;
        float _3439 = cos(_3437);
        float _3441 = _3435 * 0.15915493667125701904296875;
        float _3443 = _3433 * 6.283185482025146484375;
        float _3445 = sin(_3443);
        float _3447 = 1.0 / _3439;
        float _3449 = _3441 * 6.283185482025146484375;
        float _3451 = cos(_3449);
        float _3453 = _3445 * _3447;
        float _3455 = _3441 * 6.283185482025146484375;
        float _3457 = sin(_3455);
        float _3459 = _3451 * _3453;
        float _3461 = 1.0 / _3459;
        float _3463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3465 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3463;
        float _3467 = 1.0 / _3465;
        float _3469 = _3457 * _3461;
        float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3473 = fma(_2842, _3469, _3471);
        float _3475 = _3473 * _3467;
        float _3477 = precise::clamp(_3475, 0.0, 1.0);
        float _3479 = -_3477;
        float _3481 = _3479 + 1.0;
        _3429 = _3459;
        _3371 = _3481;
    }
    float _3483 = _3429;
    float _3485 = _3371;
    float _3487 = _3483;
    if (!_2904)
    {
        int _3489 = _2942 << 4;
        int _3491 = _3489 + 2048;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        uint _3495 = uint(int(uint(int(_3493)) >> uint(2)));
        int _3497 = int(_3493) & 3;
        float _3499 = (*spvDescriptorSet0.vp_c15)._m0[int(_3495)][_3497];
        int _3501 = int(_3493) + 1;
        uint _3503 = uint(int(uint(_3501) >> uint(2)));
        int _3505 = _3501 & 3;
        float _3507 = (*spvDescriptorSet0.vp_c15)._m0[int(_3503)][_3505];
        int _3509 = _3491 + 8;
        uint _3511 = uint(int(uint(_3509) >> uint(2)));
        uint _3513 = uint(int(uint(int(_3511)) >> uint(2)));
        int _3515 = int(_3511) & 3;
        float _3517 = (*spvDescriptorSet0.vp_c15)._m0[int(_3513)][_3515];
        int _3519 = int(_3511) + 1;
        uint _3521 = uint(int(uint(_3519) >> uint(2)));
        int _3523 = _3519 & 3;
        float _3525 = (*spvDescriptorSet0.vp_c15)._m0[int(_3521)][_3523];
        float _3527 = _2770 * _3507;
        float _3529 = fma(_2094, _3499, _3527);
        float _3531 = fma(_2110, _3517, _3529);
        float _3533 = _3531 + _3525;
        float _3535 = precise::clamp(_3533, 0.0, 1.0);
        float _3537 = -_3535;
        float _3539 = _3537 + _3334;
        float _3541 = fma(_3539, 500.0, 1.5);
        float _3543 = exp2(_3541);
        float _3545 = 0.0 + _3543;
        float _3547 = precise::clamp(_3545, 0.0, 1.0);
        _3018 = as_type<float>(_3491);
        _3487 = _3517;
        _3367 = _3547;
    }
    float _3549 = _3018;
    float _3551 = _3487;
    float _3553 = _3367;
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3557 = _3056 + _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3561 = _3060 + _3559;
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3565 = _3062 + _3563;
    float _3567 = _3557 * _3557;
    float _3569 = fma(_3561, _3561, _3567);
    float _3571 = fma(_3565, _3565, _3569);
    float _3573 = rsqrt(_3571);
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3577 = _3561 * _3575;
    float _3579 = _3565 * _3575;
    float _3581 = _3577 * _3577;
    float _3583 = _3579 * _3579;
    float _3585 = _3581 + _3583;
    float _3587 = sqrt(_3585);
    bool _3589 = _3587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3593 = _3587 + _3591;
    float _3595 = _3573;
    float _3597 = _3593;
    float _3599 = _3549;
    float _3601 = _3557;
    float _3603 = _3575;
    if (_3589)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3595 = _3605;
    }
    float _3607 = _3595;
    float _3609 = _3607;
    if (_3589)
    {
        float _3611 = _3593 * _3607;
        _3597 = _3611;
    }
    float _3613 = _3597;
    if (_3589)
    {
        float _3615 = rsqrt(_3585);
        _3609 = _3615;
    }
    float _3617 = _3609;
    float _3619 = _3617;
    if (_3589)
    {
        float _3621 = _3613 * 0.15915493667125701904296875;
        _3599 = _3621;
    }
    float _3623 = _3599;
    float _3625 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3627 = _3565;
    if (_3589)
    {
        float _3629 = _3623 * 6.283185482025146484375;
        float _3631 = sin(_3629);
        _3627 = _3631;
    }
    float _3633 = _3627;
    float _3635 = precise::max(0.0, _3625);
    float _3637 = _3551;
    float _3639 = _3635;
    if (_3589)
    {
        float _3641 = _3623 * 6.283185482025146484375;
        float _3643 = cos(_3641);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = -_3575;
    float _3649 = -_3635;
    float _3651 = fma(_3557, _3647, _3649);
    if (_3589)
    {
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3601 = _3653;
    }
    float _3655 = _3601;
    float _3657 = _3633;
    float _3659 = _3655;
    if (_3589)
    {
        float _3661 = fma(_3633, _3655, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3657 = _3661;
    }
    float _3663 = _3657;
    float _3665 = _3663;
    if (!_3589)
    {
        _3659 = _3579;
    }
    float _3667 = _3659;
    float _3669 = _3667;
    if (_3589)
    {
        float _3671 = _3617 * _3663;
        _2864 = _3671;
    }
    float _3673 = _2864;
    if (!_3589)
    {
        _3619 = _3577;
    }
    float _3675 = _3619;
    float _3677 = _3675;
    float _3679 = _3645;
    if (_3589)
    {
        float _3681 = _3645 + (-1.0);
        _3639 = _3681;
    }
    float _3683 = _3639;
    if (_3589)
    {
        float _3685 = _3577 * _3673;
        _3677 = _3685;
    }
    float _3687 = _3677;
    if (!_3589)
    {
        _3665 = _3651;
    }
    float _3689 = _3665;
    float _3691 = _3689;
    if (_3589)
    {
        float _3693 = _3579 * _3673;
        _3669 = _3693;
    }
    float _3695 = _3669;
    if (_3589)
    {
        float _3697 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3603 = _3697;
    }
    float _3699 = _3603;
    float _3701 = sqrt(_3571);
    float _3703 = _3699;
    if (_3589)
    {
        float _3705 = fma(_3651, _3645, _3699);
        _3691 = _3705;
    }
    float _3707 = _3691;
    if (!_3589)
    {
        _3703 = _3581;
    }
    float _3709 = _3703;
    float _3711 = _3709;
    if (_3589)
    {
        float _3713 = _3687 * _3687;
        _3711 = _3713;
    }
    float _3715 = _3711;
    if (!_3589)
    {
        _3679 = _3583;
    }
    float _3717 = _3679;
    float _3719 = _3717;
    if (_3589)
    {
        float _3721 = _3695 * _3695;
        _3719 = _3721;
    }
    float _3723 = _3719;
    float _3725 = fma(_3707, _3707, _3715);
    float _3727 = _3725 + _3723;
    float _3729 = rsqrt(_3727);
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3733 = fma(_3701, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3731);
    float _3735 = precise::clamp(_3733, 0.0, 1.0);
    float _3737 = -_3735;
    float _3739 = _3737 + 1.0;
    float _3741 = abs(_3739);
    float _3743 = log2(_3741);
    float _3745 = _3729 * _3687;
    float _3747 = _3729 * _3707;
    float _3749 = _3729 * _3695;
    float _3751 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3753 = -_3751;
    float _3755 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3753);
    float _3757 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3759 = -_3749;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3755);
    float _3763 = _3747 + 1.0;
    float _3765 = exp2(_3757);
    float _3767 = fma(_3761, -0.5, 0.5);
    float _3769 = fma(_3761, 0.5, 0.5);
    float _3771 = fma(_3769, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3773 = sqrt(_3767);
    float _3775 = fma(_3769, _3771, -0.212114393711090087890625);
    float _3777 = fma(_3769, _3775, 1.570728778839111328125);
    float _3779 = -_3747;
    float _3781 = fma(_3765, _3763, _3779);
    float _3783 = fma(_3781, 0.5, 0.5);
    float _3785 = _3773 * 0.636619746685028076171875;
    float _3787 = -_3777;
    float _3789 = fma(_3785, _3787, 1.0);
    float2 _9937 = float2(_3789, _3783);
    float3 _3793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9937, float2(0.0), isnan(_9937)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9937, float2(0.0), isnan(_9937)), level(0.0)).xyz;
    float _3795 = _3793.x;
    float _3797 = _3793.y;
    float _3799 = _3793.z;
    float _3801 = abs(_2842);
    float _3803 = log2(_3801);
    float _3805 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3807 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = -_2758;
    float _3811 = _3809 + 1.0;
    float _3813 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3805);
    float _3815 = exp2(_3807);
    float _3817 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3813);
    float _3819 = _3242 * 0.5;
    bool _3821 = _2842 <= 8000.0;
    bool _3823 = isnan(_2842);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(8000.0);
    bool _3829 = _3825 || _3827;
    float _3831 = float(_3829);
    float _3833 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3817);
    float _3835 = fma(_3314, -0.5, _3819);
    float _3837 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3839 = _3833 + _3242;
    float _3841 = _3300 + _3242;
    out.gl_Position.x = _3300;
    out.gl_Position.y = _3314;
    out.gl_Position.z = _3833;
    out.gl_Position.w = _3242;
    float _3843 = _3839 * 0.5;
    float _3845 = exp2(_3837);
    float _3847 = _3841 * 0.5;
    out.m_88.x = _3847;
    out.m_88.y = _3835;
    out.m_88.z = _3843;
    out.m_88.w = _3242;
    float _3849 = -_3815;
    float _3851 = _3849 + 1.0;
    if (!_3236)
    {
        _3330 = 1.0;
    }
    float _3853 = _3330;
    float _3855 = _3853;
    if (_3236)
    {
        bool _3857 = _3340 >= _3316;
        bool _3859 = isnan(_3340);
        bool _3861 = _3857 || _3859;
        bool _3863 = isnan(_3316);
        bool _3865 = _3861 || _3863;
        float _3867 = float(_3865);
        _3855 = _3867;
    }
    float _3869 = _3855;
    float _3871 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3873 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    bool _3877 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3879 = isnan(_3701);
    bool _3881 = _3877 || _3879;
    bool _3883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3885 = _3881 || _3883;
    float _3887 = _3869 * _3553;
    float _3889 = fma(_3875, -2.0, 3.0);
    float _3891 = _3875 * _3875;
    float _3893 = _3871 * _3342;
    float _3895 = -_3871;
    float _3897 = _3895 + 1.0;
    float _3899 = _3891 * _3889;
    float _3901 = _3353 * _3893;
    float _3903 = _3353 * _3897;
    float _3905 = _3427 * _3485;
    float _3907 = -_3899;
    float _3909 = _3907 + 1.0;
    float _3911 = _3905 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3913 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3899);
    float _3915 = _3905;
    float _3917 = _3901;
    if (!_3885)
    {
        _3915 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3919 = _3915;
    float _3921 = _3831 * _3913;
    float _3923 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _3811 * _3923;
    float _3927 = precise::clamp(_3925, 0.0, 1.0);
    float _3929 = -_3927;
    float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3933 = -_3887;
    float _3935 = fma(_3933, _3931, 1.0);
    float _3937 = precise::clamp(_3935, 0.0, 1.0);
    float _3939 = _3937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3941 = _3937;
    float _3943 = _3919;
    float _3945 = _3919;
    if (!_3885)
    {
        _3941 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3947 = _3941;
    out.m_90.x = _3939;
    float _3949 = _3799 * _3893;
    float _3951 = fma(_3795, _3901, _3347);
    float _3953 = fma(_3797, _3901, _3349);
    float _3955 = _3947;
    float _3957 = _3947;
    if (!_3885)
    {
        _3917 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3959 = _3917;
    float _3961 = fma(_3353, _3949, _3351);
    out.m_92.x = _3951;
    out.m_92.y = _3953;
    out.m_92.z = _3961;
    out.m_92.w = _3903;
    bool _3963 = !_3885;
    float _3965 = _3959;
    float _3967 = _3959;
    if (!_3963)
    {
        bool _3969 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3971 = isnan(_3701);
        bool _3973 = _3969 || _3971;
        bool _3975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3977 = _3973 || _3975;
        if (!_3977)
        {
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3981 = _3701 + _3979;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3985 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3983;
            float _3987 = 1.0 / _3985;
            float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3995 = _3993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3997 = _3981 * _3987;
            float _3999 = precise::clamp(_3997, 0.0, 1.0);
            float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4005 = fma(_3999, _3995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4007 = fma(_3999, _4003, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4009 = fma(_3999, _3991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3957 = _4009;
            _3967 = _4007;
            _3945 = _4005;
            _4011 = true;
        }
        else
        {
            bool _4013 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4015 = isnan(_3701);
            bool _4017 = _4013 || _4015;
            bool _4019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4021 = _4017 || _4019;
            if (!_4021)
            {
                _3965 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4023 = _3965;
            _3967 = _4023;
            if (!_4021)
            {
                _3955 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4025 = _3955;
            _3957 = _4025;
            if (!_4021)
            {
                _3943 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4027 = _3943;
            bool _4029 = !_4021;
            _3945 = _4027;
            if (!_4029)
            {
                bool _4031 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4033 = isnan(_3701);
                bool _4035 = _4031 || _4033;
                bool _4037 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4039 = _4035 || _4037;
                if (!_4039)
                {
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4043 = _3701 + _4041;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4047 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4045;
                    float _4049 = 1.0 / _4047;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4059 = _4043 * _4049;
                    float _4061 = precise::clamp(_4059, 0.0, 1.0);
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4067 = fma(_4061, _4057, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4069 = fma(_4061, _4065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4071 = fma(_4061, _4053, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3957 = _4071;
                    _3967 = _4069;
                    _3945 = _4067;
                    _4011 = true;
                }
                else
                {
                    _3957 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3967 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3945 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4011 = false;
    float _4073 = _3957;
    float _4075 = _3967;
    float _4077 = _3945;
    float _4079 = _3911 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_94.x = 0.0;
    float _4081 = _4073 * 0.586610972881317138671875;
    bool _4083 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _4079;
    float _4085 = fma(_4075, 0.298911988735198974609375, _4081);
    bool _4087 = _3427 > 0.0;
    bool _4089 = isnan(_3427);
    bool _4091 = _4087 || _4089;
    bool _4093 = isnan(0.0);
    bool _4095 = _4091 || _4093;
    float _4097 = fma(_4077, 0.114477999508380889892578125, _4085);
    bool _4099 = _3485 <= 0.0;
    bool _4101 = !_4095;
    bool _4103 = _4099 || _4101;
    float _4105 = -_4097;
    float _4107 = _4105 + _4075;
    float _4109 = -_4097;
    float _4111 = _4109 + _4073;
    float _4113 = -_4097;
    float _4115 = _4113 + _4077;
    float _4117 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    float _4119 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    float _4121 = fma(_4115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    bool _4123 = !_4083;
    if (!_4123)
    {
        float _4125 = -_3056;
        float _4127 = _4125 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4129 = -_3060;
        float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4133 = -_3062;
        float _4135 = _4133 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4137 = _4127 * _4127;
        float _4139 = fma(_4131, _4131, _4137);
        float _4141 = fma(_4135, _4135, _4139);
        float _4143 = sqrt(_4141);
        float _4145 = rsqrt(_4141);
        float _4147 = -_4143;
        float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4151 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4153 = precise::clamp(_4151, 0.0, 1.0);
        float _4155 = _4131 * _4145;
        float _4157 = _4127 * _4145;
        float _4159 = abs(_4153);
        float _4161 = log2(_4159);
        float _4163 = _4135 * _4145;
        float _4165 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4167 = _2482 * _4157;
        float _4169 = -_4157;
        float _4171 = -_4165;
        float _4173 = fma(_4169, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4171);
        float _4175 = fma(_2480, _4155, _4167);
        float _4177 = -_4163;
        float _4179 = fma(_4177, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4173);
        float _4181 = fma(_2484, _4163, _4175);
        float _4183 = precise::clamp(_4181, 0.0, 1.0);
        float _4185 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4187 = _4179 + _4185;
        float _4189 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4191 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4193 = precise::clamp(_4191, 0.0, 1.0);
        float _4195 = exp2(_4189);
        float _4197 = _4195 * _4193;
        float _4199 = _4183 * _4197;
        float _4201 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4203 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4205 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4201;
        out.m_94.y = _4203;
        out.m_94.z = _4205;
    }
    out.m_96.x = _4117;
    out.m_96.y = _4119;
    out.m_96.z = _4121;
    if (!_4103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4207 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4207;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4011 = false;
    bool _999 = false;
    bool _815 = false;
    bool _659 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _4264 = as_type<float>(_131);
        out.gl_Position.z = _4264;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4334 = as_type<float>(_169);
        out.gl_Position.z = _4334;
    }
    if (_161)
    {
        return out;
    }
    float _171 = in.m_63.x;
    float _173 = in.m_63.y;
    float _175 = in.m_63.z;
    float _177 = in.m_65.x;
    float _179 = in.m_65.y;
    float _181 = in.m_65.z;
    float _183 = in.m_67.x;
    float _185 = in.m_67.y;
    float _187 = in.m_67.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_72.w;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    float _199 = _171 * _171;
    float _201 = _173 * _173;
    float _203 = fma(_177, _177, _199);
    float _205 = fma(_179, _179, _201);
    float _207 = fma(_183, _183, _203);
    float _209 = _175 * _175;
    float _211 = fma(_185, _185, _205);
    float _213 = sqrt(_207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_187, _187, _215);
    float _219 = sqrt(_211);
    float _221 = sqrt(_217);
    bool _223 = _213 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = 0.0;
    float _229 = _213;
    float _231 = _207;
    float _233 = _211;
    if (_223)
    {
        float _235 = rsqrt(_207);
        _227 = _235;
    }
    float _237 = _227;
    if (!_223)
    {
        _229 = 0.0;
    }
    float _239 = _229;
    bool _241 = _221 > 0.0;
    float _243 = 0.0;
    float _245 = _239;
    if (!_223)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    int _249 = as_type<int>(_189) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_189) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    float _259 = _247;
    if (_225)
    {
        float _261 = rsqrt(_211);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = in.m_61.x;
    float _267 = in.m_61.y;
    float _269 = in.m_61.z;
    bool _271 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _275 = _271 || _273;
    bool _277 = isnan(1.0);
    bool _279 = _275 || _277;
    float _281 = 0.0;
    float _283 = 0.0;
    if (!_225)
    {
        _281 = 0.0;
        _283 = 0.0;
    }
    float _285 = _281;
    float _287 = _283;
    float _289 = _285;
    float _291 = _287;
    if (!_223)
    {
        _231 = 0.0;
    }
    float _293 = _231;
    float _295 = 0.0;
    float _297 = _293;
    if (!_225)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = 0.0;
    float _303 = _299;
    if (_241)
    {
        float _305 = rsqrt(_217);
        _301 = _305;
    }
    float _307 = _301;
    float _309 = 0.0;
    float _311 = 0.0;
    if (!_241)
    {
        _309 = 0.0;
        _311 = 0.0;
    }
    float _313 = _309;
    float _315 = _311;
    float _317 = 0.0;
    float _319 = _315;
    float _321 = _313;
    if (!_241)
    {
        _317 = 0.0;
    }
    float _323 = _317;
    float _325 = _323;
    if (_223)
    {
        float _327 = _237 * _177;
        _245 = _327;
    }
    float _329 = _245;
    if (_223)
    {
        float _331 = _237 * _171;
        _297 = _331;
    }
    float _333 = _297;
    if (_223)
    {
        float _335 = _237 * _183;
        _259 = _335;
    }
    float _337 = _259;
    bool _339 = !_251;
    float _341 = _339 ? (-0.5) : 0.5;
    if (_225)
    {
        float _343 = _263 * _179;
        _303 = _343;
    }
    float _345 = _303;
    float _347 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _349 = _347;
    if (_225)
    {
        float _351 = _263 * _173;
        _289 = _351;
    }
    float _353 = _289;
    if (_225)
    {
        float _355 = _263 * _185;
        _291 = _355;
    }
    float _357 = _291;
    bool _359 = !_255;
    float _361 = _359 ? (-0.5) : 0.5;
    if (!_279)
    {
        float _363 = _347 * _347;
        float _365 = _363 * 0.5;
        _233 = _365;
    }
    float _367 = _233;
    float _369 = _367;
    if (_241)
    {
        float _371 = _307 * _181;
        _319 = _371;
    }
    float _373 = _319;
    if (_241)
    {
        float _375 = _307 * _175;
        _321 = _375;
    }
    float _377 = _321;
    if (_241)
    {
        float _379 = _307 * _187;
        _325 = _379;
    }
    float _381 = _325;
    if (!_279)
    {
        float _383 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _383;
    }
    float _385 = _369;
    bool _387 = !_279;
    float _389 = _385;
    if (!_387)
    {
        float _391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = log2(_391);
        float _395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _397 = _395 + 1.0;
        float _399 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = _347 * _393;
        float _403 = 1.0 / _397;
        float _405 = _399 * 0.693147182464599609375;
        float _407 = exp2(_401);
        float _409 = 1.0 / _405;
        float _411 = _407 + (-1.0);
        float _413 = -_411;
        float _415 = fma(_413, _409, _347);
        float _417 = _415 * _403;
        float _419 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _389 = _419;
    }
    float _421 = _389;
    float _423 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _425 = !_279;
    float _427 = _423;
    float _429 = _421;
    if (!_425)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _347 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _349 = _449;
    }
    float _451 = _349;
    float _453 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _455 = _423 * _333;
    float _457 = _423 * _353;
    float _459 = _423 * _377;
    float _461 = _451;
    if (!_279)
    {
        float _463 = _149 * _149;
        float _465 = _463 * 0.5;
        _427 = _465;
    }
    float _467 = _427;
    float _469 = fma(_453, _329, _455);
    float _471 = fma(_453, _345, _457);
    float _473 = fma(_453, _373, _459);
    float _475 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_279)
    {
        float _477 = _467 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _429 = _477;
    }
    float _479 = _429;
    bool _481 = !_279;
    float _483 = _479;
    if (!_481)
    {
        float _485 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _487 = log2(_485);
        float _489 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _491 = _489 + 1.0;
        float _493 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _495 = _149 * _487;
        float _497 = 1.0 / _491;
        float _499 = _493 * 0.693147182464599609375;
        float _501 = exp2(_495);
        float _503 = 1.0 / _499;
        float _505 = _501 + (-1.0);
        float _507 = -_505;
        float _509 = fma(_507, _503, _149);
        float _511 = _509 * _497;
        float _513 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _483 = _513;
    }
    float _515 = _483;
    float _517 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _519 = fma(_475, _337, _469);
    float _521 = fma(_475, _357, _471);
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _525 = _517 * _333;
    float _527 = _517 * _353;
    float _529 = _517 * _377;
    float _531 = fma(_475, _381, _473);
    float _533 = fma(_523, _329, _525);
    float _535 = fma(_523, _345, _527);
    float _537 = fma(_523, _373, _529);
    float _539 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_451, _265, _519);
    float _543 = fma(_451, _267, _521);
    float _545 = fma(_451, _269, _531);
    float _547 = fma(_539, _337, _533);
    float _549 = fma(_539, _357, _535);
    float _551 = fma(_539, _381, _537);
    if (!_279)
    {
        _461 = _149;
    }
    float _553 = _461;
    bool _555 = !_279;
    float _557 = _553;
    if (!_555)
    {
        float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _561 = log2(_559);
        float _563 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _565 = _563 + 1.0;
        float _567 = 1.0 / _565;
        float _569 = _149 * _561;
        float _571 = exp2(_569);
        float _573 = -_571;
        float _575 = _573 + 1.0;
        float _577 = _575 * _567;
        _557 = _577;
    }
    float _579 = _557;
    float _581 = fma(_579, _267, _549);
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _585 = fma(_543, _191, _195);
    float _587 = fma(_579, _265, _547);
    float _589 = -_581;
    float _591 = _543 + _589;
    float _593 = fma(_579, _269, _551);
    float _595 = fma(_541, _191, _193);
    float _597 = -_587;
    float _599 = _541 + _597;
    float _601 = _591 * _179;
    float _603 = _591 * _173;
    float _605 = _591 * _185;
    float _607 = -_593;
    float _609 = _545 + _607;
    float _611 = fma(_599, _177, _601);
    float _613 = fma(_599, _171, _603);
    float _615 = fma(_599, _183, _605);
    float _617 = fma(_545, _191, _197);
    float _619 = fma(_609, _181, _611);
    float _621 = fma(_609, _175, _613);
    float _623 = fma(_609, _187, _615);
    bool _625 = !_583;
    float _627 = _617;
    float _629 = _621;
    float _631 = _619;
    float _633 = _623;
    float _635 = _581;
    float _637 = _581;
    float _639 = _593;
    float _657;
    if (!_625)
    {
        float _641 = in.m_74.x;
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _645 = _641 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _649 = _647 * _643;
        float _651 = floor(_649);
        float _653 = -_651;
        float _655 = _649 + _653;
        _657 = _655;
        _659 = true;
    }
    else
    {
        float _661 = float(_115);
        float _663 = 1.0 / _661;
        float _665 = _149 * _663;
        _657 = _665;
    }
    _659 = false;
    float _667 = _657;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _671 = _667 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _667 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _685 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _687 = isnan(_667);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = in.m_72.x;
    float _699 = in.m_72.y;
    bool _701 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _703 = isnan(_667);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = 1.0 / _683;
    bool _715 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _717 = -_695;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _679;
    float _723 = _675 * _713;
    float _725 = _671 * _721;
    bool _727 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _729 = isnan(_667);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _743;
    float _747 = -_737;
    float _749 = _747 + 1.0;
    float _751 = fma(_741, _725, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _753 = fma(_745, _725, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _755 = _737 * _719;
    float _757 = _711 * _749;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _763 = -_711;
    float _765 = _763 + 1.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _771 = _751 * _757;
    float _773 = _753 * _757;
    float _775 = fma(_761, _723, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_769, _723, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[143].x, _771);
    float _781 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[143].y, _773);
    float _783 = fma(_775, _755, _779);
    float _785 = fma(_777, _755, _781);
    float _787 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[145].x, _783);
    float _789 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[145].y, _785);
    float _791 = _787 * _697;
    float _793 = _789 * _699;
    bool _795 = !_715;
    float _813;
    if (!_795)
    {
        float _797 = in.m_74.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_115);
        float _819 = 1.0 / _817;
        float _821 = _149 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _827 = _823 + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _837 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _839 = isnan(_823);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _853 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_823);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = 1.0 / _831;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    float _871 = -_847;
    float _873 = _871 + 1.0;
    bool _875 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _877 = isnan(_823);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = 1.0 / _835;
    float _891 = 1.0 / _851;
    float _893 = _869 * _865;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _899 = _863 * _873;
    float _901 = -_863;
    float _903 = _901 + 1.0;
    float _905 = fma(_893, _827, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _907 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _909 = isnan(_823);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _885 * _903;
    float _921 = _897 * _889;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _823 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _927;
    float _931 = _905 * _919;
    float _933 = -_885;
    float _935 = _933 + 1.0;
    float _937 = fma(_921, _925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _939 = -_917;
    float _941 = _939 + 1.0;
    float _943 = _929 * _891;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _947 = _823 + _945;
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _951 = _847 * _941;
    float _953 = fma(_943, _947, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _955 = fma(_937, _899, _949);
    float _957 = fma(_953, _951, _955);
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _965 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[118].x, _957);
    float _967 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _965 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_76.x = _967;
    out.m_76.y = _969;
    out.m_76.z = _971;
    out.m_76.w = _973;
    bool _975 = !_887;
    float _995;
    float _997;
    if (!_975)
    {
        float _977 = in.m_74.x;
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _981 = float(_115);
        float _983 = _977 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _987 = _985 * _979;
        float _989 = floor(_987);
        float _991 = -_989;
        float _993 = _987 + _991;
        _995 = _993;
        _997 = _981;
        _999 = true;
    }
    else
    {
        float _1001 = float(_115);
        float _1003 = 1.0 / _1001;
        float _1005 = _149 * _1003;
        _995 = _1005;
        _997 = _1001;
    }
    _999 = false;
    float _1007 = _995;
    float _1009 = _997;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1013 = int(_1011);
    float _1015 = in.m_65.w;
    float _1017 = _585 * _185;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1021 = _1019 != 0;
    float _1023 = in.m_67.w;
    float _1025 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1027 = int(_1025);
    float _1029 = fma(_595, _183, _1017);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1033 = _1007 + _1031;
    float _1035 = in.m_63.w;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1039 = 1.0 / _1009;
    float _1041 = float(_1013);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1045 = 1.0 / _1041;
    float _1047 = float(uint(_1027));
    float _1049 = float(_1027);
    bool _1051 = _1027 == 0;
    float _1053 = 1.0 / _1047;
    float _1055 = _149 * _1045;
    float _1057 = trunc(_1055);
    int _1059 = int(_1057);
    int _1061 = as_type<int>(_1053) + (-2);
    float _1063 = float(uint(_1059));
    float _1065 = as_type<float>(_1061) * _1063;
    int _1067 = ~_1027;
    int _1069 = _1067 + 1;
    float _1071 = trunc(_1065);
    float _1073 = precise::max(_1071, 0.0);
    uint _1076 = uint(_1073);
    int _1078 = ~_1027;
    int _1080 = _1078 + 1;
    int _1082 = _1069 * int(_1076);
    int _1084 = _1082 + _1059;
    float _1086 = float(uint(_1084));
    float _1088 = as_type<float>(_1061) * _1086;
    float _1090 = in.m_74.x;
    float _1092 = in.m_74.y;
    float _1094 = in.m_74.z;
    float _1096 = in.m_74.w;
    float _1098 = trunc(_1088);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = int(_1076) + int(_1102);
    float _1106 = float(_1059);
    int _1108 = _1080 * _1104;
    int _1110 = _1108 + _1059;
    bool _1112 = _1106 >= _1049;
    bool _1114 = isnan(_1106);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1049);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = !_1021;
    float _1126 = _1124 ? 7.345489978790283203125 : 1.0;
    bool _1128 = uint(_1110) >= uint(_1027);
    float _1130 = trunc(_1122);
    int _1132 = int(_1130);
    float _1134 = _1126 * _1090;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    int _1140 = ~_1104;
    int _1142 = _1140 + _1138;
    int _1144 = _1142 + 1;
    float _1146 = floor(_1134);
    int _1148 = _1027 * _1144;
    int _1150 = _1148 + _1059;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1162 = _1160 != 0;
    int _1164 = ~_1132;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    bool _1170 = !_1051;
    int _1172 = _1170 ? _1150 : (-1);
    bool _1174 = !_1154;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _1172 * _1168;
    float _1180 = -_1146;
    float _1182 = _1134 + _1180;
    int _1184 = _1027 + (-1);
    float _1186 = _1182 * _1049;
    float _1188 = _149 * _1049;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1192 = _1190 != 0;
    bool _1194 = !_1158;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = _1188 * _1039;
    float _1200 = trunc(_1186);
    int _1202 = int(_1200);
    int _1204 = _1132 * _1184;
    int _1206 = _1204 + _1178;
    bool _1208 = !_1192;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = abs(_1196);
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1216 = _1214 != 0;
    float _1218 = trunc(_1198);
    int _1220 = int(_1218);
    bool _1222 = !_1162;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = _1206 * _1212;
    int _1228 = abs(_1176);
    int _1230 = abs(_1210);
    bool _1232 = !_1216;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = abs(_1224);
    int _1238 = _1202 * _1230;
    int _1240 = _1238 + _1059;
    int _1242 = abs(_1234);
    int _1244 = _1220 * _1228;
    int _1246 = _1244 + _1226;
    float _1248 = _585 * _173;
    int _1250 = ~_1027;
    int _1252 = _1250 + 1;
    int _1254 = _1240 * _1236;
    int _1256 = _1254 + _1246;
    int _1258 = ~_1027;
    int _1260 = _1258 + 1;
    float _1262 = fma(_595, _171, _1248);
    float _1264 = float(uint(_1240));
    int _1266 = _1202 * _1242;
    int _1268 = _1266 + _1256;
    float _1270 = as_type<float>(_1061) * _1264;
    float _1272 = float(uint(_1268));
    float _1274 = trunc(_1270);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    float _1280 = as_type<float>(_1061) * _1272;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    bool _1288 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1290 = isnan(_1007);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    bool _1300 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1302 = isnan(_1007);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    int _1312 = _1252 * int(_1286);
    int _1314 = _1312 + _1268;
    float _1316 = float(uint(_1314));
    float _1318 = as_type<float>(_1061) * _1316;
    float _1320 = trunc(_1318);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    int _1326 = int(_1286) + int(_1324);
    int _1328 = _1260 * _1326;
    int _1330 = _1328 + _1268;
    bool _1332 = uint(_1330) >= uint(_1027);
    float _1334 = _1090 * 2.0;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = floor(_1334);
    int _1342 = ~_1326;
    int _1344 = _1342 + _1338;
    int _1346 = _1344 + 1;
    int _1348 = _1027 * _1346;
    int _1350 = _1348 + _1268;
    bool _1352 = !_1051;
    int _1354 = _1352 ? _1350 : (-1);
    int _1356 = _1354 & 3;
    bool _1358 = _1356 != 0;
    int _1360 = _1354 & 3;
    bool _1362 = _1360 != 0;
    bool _1364 = uint(_1356) > 1u;
    int _1366 = _1362 ? 0 : 1;
    bool _1368 = _1096 > 0.5;
    float _1370 = _1092 * 2.0;
    int _1372 = ~_1366;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = _1340 >= 0.0;
    bool _1380 = isnan(_1340);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan(0.0);
    bool _1386 = _1382 || _1384;
    float _1388 = floor(_1370);
    float _1390 = -_361;
    int _1392 = _1368 ? as_type<int>(_1390) : as_type<int>(_361);
    bool _1394 = _1092 > 0.5;
    int _1396 = _1376;
    float _1398 = _1029;
    if (!_1364)
    {
        int _1400 = ~_1366;
        int _1402 = _1400 + 1;
        _1396 = _1402;
    }
    int _1404 = _1396;
    bool _1406 = _1090 > 0.5;
    int _1408 = _1386 ? 0 : 1;
    float _1410 = -_341;
    int _1412 = _1406 ? as_type<int>(_1410) : as_type<int>(_341);
    bool _1414 = _1340 > 0.0;
    int _1416 = ~_1408;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = -_361;
    int _1424 = _1394 ? as_type<int>(_1422) : as_type<int>(_361);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1428 = _1426 != 0;
    bool _1430 = !_1428;
    float _1432 = _1430 ? _361 : as_type<float>(_1392);
    bool _1434 = _1094 > 0.5;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1440 = _1420;
    if (!_1414)
    {
        int _1442 = ~_1408;
        int _1444 = _1442 + 1;
        _1440 = _1444;
    }
    int _1446 = _1440;
    bool _1448 = _1388 >= 0.0;
    bool _1450 = isnan(_1388);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    int _1466 = _1456 ? 0 : 1;
    bool _1468 = _1388 > 0.0;
    float _1470 = _585 * _179;
    float _1472 = -_341;
    int _1474 = _1434 ? as_type<int>(_1472) : as_type<int>(_341);
    float _1476 = 1.0 / _1438;
    bool _1478 = !_1464;
    float _1480 = _1478 ? _341 : as_type<float>(_1412);
    float _1482 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1486 = _1484 != 0;
    float _1488 = fma(_595, _177, _1470);
    float _1490 = _1094 * 2.0;
    float _1492 = -_1037;
    float _1494 = fma(_1482, 2.0, _1492);
    bool _1496 = !_1486;
    float _1498 = _1496 ? _361 : as_type<float>(_1424);
    float _1500 = fma(_617, _181, _1488);
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1504 = _1502 != 0;
    float _1506 = fma(_617, _175, _1262);
    int _1508 = ~_1466;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    float _1514 = _1500 + _1015;
    int _1516 = _1512;
    if (!_1468)
    {
        int _1518 = ~_1466;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = _149 * _1460;
    float _1526 = fma(_617, _187, _1029);
    bool _1528 = !_1504;
    float _1530 = _1528 ? _341 : as_type<float>(_1474);
    float _1532 = _1092 + _1090;
    int _1534 = ~_1027;
    int _1536 = _1534 + 1;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1538;
    float _1542 = floor(_1490);
    float _1544 = _1532 + (-1.0);
    float _1546 = _1526 + _1023;
    float _1548 = -_1310;
    float _1550 = _1548 + 1.0;
    int _1552 = _1536 * int(_1278);
    int _1554 = _1552 + _1240;
    float _1556 = _1540 * _1476;
    float _1558 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1560 = _1298 * _1550;
    float _1562 = exp2(_1524);
    float _1564 = -_149;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1494);
    float _1568 = _1480 + 0.5;
    float _1570 = float(uint(_1554));
    float _1572 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1574 = _1572;
    if (!_1021)
    {
        _627 = _1092;
    }
    float _1576 = _627;
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1566);
    float _1580 = _1576;
    if (!_1021)
    {
        _1398 = _1094;
    }
    float _1582 = _1398;
    float _1584 = as_type<float>(_1061) * _1570;
    float _1586 = fma(_1572, -2.0, _1043);
    float _1588 = _1582;
    if (!_1021)
    {
        _1574 = _1094;
    }
    float _1590 = _1574;
    float _1592 = fma(_1556, _1033, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1594 = _1590;
    if (_1021)
    {
        _1580 = _1090;
    }
    float _1596 = _1580;
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1021)
    {
        _1594 = _1092;
    }
    float _1600 = _1594;
    float _1602 = _1506 + _1035;
    if (_1021)
    {
        _1588 = _1092;
    }
    float _1604 = _1588;
    float _1606 = -_1562;
    float _1608 = _1606 + 1.0;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1620 = _1618 != 0;
    float _1622 = _1092 + _1094;
    bool _1624 = _1542 >= 0.0;
    bool _1626 = isnan(_1542);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    float _1634 = trunc(_1584);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1642 = _1354 >> 31;
    float _1644 = _1622 + (-1.0);
    int _1646 = _1632 ? 0 : 1;
    float _1648 = _1592 * _1560;
    bool _1650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1658 = _1654 || _1656;
    float _1660 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1662 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1586);
    float _1664 = _1658 ? _1608 : 0.0;
    float _1666 = _1498 + (-0.5);
    bool _1668 = _1542 > 0.0;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1674 = _1642 & 3;
    float _1676 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1670);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1680 = _1354 + _1674;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1684 = 1.0 + _1682;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1688 = int(_1278) + int(_1638);
    float _1690 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1692 = _1680 >> 2;
    float _1694 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1678);
    float _1696 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1700 = -_1666;
    float _1702 = -_1662;
    float _1704 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1702);
    float _1706 = -_1298;
    float _1708 = _1706 + 1.0;
    int _1710 = _1692 << 4;
    int _1712 = _1710 + 368;
    float _1714 = 1.0 / _1684;
    float _1716 = fma(_1640, -2.0, _1698);
    float _1718 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1720 = -_1686;
    float _1722 = fma(_1696, 2.0, _1720);
    float _1724 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1648);
    uint _1726 = uint(int(uint(_1712) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    int _1742 = ~_1027;
    int _1744 = _1742 + 1;
    float _1746 = _1530 + 0.5;
    float _1748 = -_149;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1722);
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _1432 + (-0.5);
    int _1760 = _1744 * _1688;
    int _1762 = _1760 + _1240;
    int _1764 = _1756;
    int _1766 = as_type<int>(_1660);
    if (!_1668)
    {
        int _1768 = ~_1646;
        int _1770 = _1768 + 1;
        _1764 = _1770;
    }
    int _1772 = _1764;
    float _1774 = fma(_1718, _1746, _1750);
    bool _1776 = !_1616;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = _1712 + 8;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    uint _1784 = uint(int(uint(int(_1782)) >> uint(2)));
    int _1786 = int(_1782) & 3;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[int(_1784)][_1786];
    int _1790 = int(_1782) + 1;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    int _1794 = _1790 & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    bool _1798 = uint(_1762) >= uint(_1027);
    float _1800 = _1664 * _1714;
    float _1802 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1716);
    bool _1804 = !_1612;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1694);
    bool _1810 = !_1798;
    int _1812 = _1810 ? 0 : (-1);
    float _1814 = -_1690;
    float _1816 = -_1802;
    float _1818 = fma(_1814, _1758, _1816);
    bool _1820 = uint(_1356) >= 2u;
    float _1822 = -_1808;
    float _1824 = _1822 + 1.0;
    int _1826 = abs(_1778);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1602 + _1828;
    int _1832 = abs(_1806);
    float _1834 = -_1824;
    float _1836 = fma(_1530, _1834, _1774);
    int _1838 = _1820 ? 0 : 1;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1514 + _1840;
    bool _1844 = _1356 != 3;
    float _1846 = _1830 * _1830;
    float _1848 = float(_1832);
    float _1850 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    float _1852 = float(_1772);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1546 + _1854;
    int _1858 = ~_1838;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1866 = ~_1688;
    int _1868 = _1866 + _1812;
    int _1870 = _1868 + 1;
    float _1872 = _1848 * _1852;
    float _1874 = -_1850;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1864);
    int _1880 = _1862;
    float _1882 = _1836;
    if (_1844)
    {
        int _1884 = ~_1838;
        int _1886 = _1884 + 1;
        _1880 = _1886;
    }
    int _1888 = _1880;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1892 = !_1358;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1878);
    int _1898 = abs(_1404);
    float _1900 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1890);
    int _1902 = abs(_1894);
    int _1904 = _1027 * _1870;
    int _1906 = _1904 + _1240;
    bool _1908 = _1356 != 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1912 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1900);
    int _1914 = ~_1898;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1910);
    int _1922 = abs(_1888);
    float _1924 = -_1912;
    float _1926 = _1924 + 1.0;
    int _1928 = ~_1902;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1918 * as_type<int>(_1740);
    float _1936 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1920);
    float _1938 = fma(_1498, _1926, _1704);
    int _1940 = _1932 * as_type<int>(_1732);
    int _1942 = _1940 + _1934;
    int _1944 = ~_1922;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = -_1936;
    float _1952 = _1950 + 1.0;
    bool _1954 = !_1908;
    int _1956 = _1954 ? 0 : (-1);
    float _1958 = _1872 * (-2.0);
    int _1960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1962 = _1960 != 0;
    int _1964 = _1948 * as_type<int>(_1788);
    int _1966 = _1964 + _1942;
    int _1968 = abs(_1956);
    float _1970 = in.m_78.x;
    float _1972 = in.m_78.y;
    float _1974 = in.m_78.z;
    float _1976 = fma(_1842, _1842, _1846);
    bool _1978 = !_1962;
    int _1980 = _1978 ? 0 : 1;
    float _1982 = -_1952;
    float _1984 = fma(_1480, _1982, _1578);
    float _1986 = fma(_1856, _1856, _1976);
    int _1988 = abs(_1980);
    float _1990 = fma(_1432, _1876, _1818);
    int _1992 = ~_1968;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = rsqrt(_1986);
    float _2000 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1724);
    bool _2002 = _1896 >= 0.0;
    int _2004 = _1996 * as_type<int>(_1796);
    int _2006 = _2004 + _1966;
    int _2008 = ~_1988;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    out.m_80.x = _1984;
    out.m_80.y = _1938;
    out.m_80.z = _1836;
    out.m_80.w = _1990;
    float _2014 = float(_1446);
    float _2016 = _2000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2018 = float(_1826);
    int _2020 = _2006 * _2012;
    bool _2022 = !_1051;
    int _2024 = _2022 ? _1906 : (-1);
    float _2026 = fma(_1558, _1958, _1558);
    out.m_82.w = _2016;
    float _2028 = _2018 * _2014;
    float _2030 = fma(_1958, _1970, _1970);
    float _2032 = _1830 * _1998;
    int _2034 = _2024 * _1988;
    int _2036 = _2034 + _2020;
    float _2038 = _2028 * (-2.0);
    float _2040 = _1842 * _1998;
    int _2042 = as_type<int>(_2040);
    if (_2002)
    {
        _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2044 = _1882;
    float _2046 = -_2032;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1830);
    float _2050 = fma(_1660, _2038, _1660);
    float _2052 = _1090 + (-0.5);
    float _2054 = _2048 * _2048;
    if (_2002)
    {
        float _2056 = _2044 * 5.0;
        _1766 = as_type<int>(_2056);
    }
    int _2058 = _1766;
    float _2060 = float(_2036);
    float _2062 = -_2040;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1842);
    if (_2002)
    {
        out.m_59.x = 0.0;
    }
    float _2066 = fma(_2038, _1972, _1972);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2070 = fma(_2064, _2064, _2054);
    if (_2002)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7135 = as_type<float>(_2058);
        out.gl_Position.z = _7135;
    }
    bool _2072 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2074 = isnan(1.0);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2080 = _2076 || _2078;
    bool _2082 = !_1620;
    int _2084 = _2082 ? 0 : 1;
    out.m_84.x = _2060;
    if (_2002)
    {
        return out;
    }
    float _2086 = -_2032;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1602);
    float _2090 = _1856 * _1998;
    float _2092 = -_2040;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1514);
    bool _2096 = !_2080;
    float _2098 = _2096 ? _149 : _1800;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2102 = _2088 + _2100;
    float _2104 = -_2090;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2108 = -_2090;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2114 = _2094 + _2112;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2118 = fma(_2106, _2106, _2070);
    int _2120 = abs(_2084);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2124 = _2110 + _2122;
    float _2126 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2116);
    float _2128 = fma(_2098, _2026, _2068);
    float _2130 = _1092 + (-0.5);
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2126);
    float _2134 = float(_1522);
    float _2136 = _1094 + _1090;
    float _2138 = float(_2120);
    float _2140 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2066);
    bool _2142 = _2132 >= 0.0;
    float _2144 = _2128 * 0.15915493667125701904296875;
    float _2146 = _2138 * _2134;
    float _2148 = fma(_2098, _2050, _2140);
    float _2150 = _2136 + (-1.0);
    float _2152 = _1094 + (-0.5);
    float _2154 = _2146 * (-2.0);
    float _2156 = _2148 * 0.15915493667125701904296875;
    float _2158 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2160 = sqrt(_2118);
    float _2162 = fma(_2154, _1974, _1974);
    float _2164 = _2134;
    int _2166 = as_type<int>(_2152);
    int _2168 = as_type<int>(_2114);
    if (_2142)
    {
        _2164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2170 = _2164;
    float _2172 = fma(_2158, _2154, _2158);
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2162);
    if (_2142)
    {
        out.m_59.x = 0.0;
    }
    float _2176 = _2144 * 6.283185482025146484375;
    float _2178 = sin(_2176);
    if (_2142)
    {
        float _2180 = _2170 * 5.0;
        _2166 = as_type<int>(_2180);
    }
    int _2182 = _2166;
    float _2184 = fma(_2098, _2172, _2174);
    if (_2142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7331 = as_type<float>(_2182);
        out.gl_Position.z = _7331;
    }
    float _2186 = _2184 * 0.15915493667125701904296875;
    float _2188 = _2144 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    float _2192 = _2156 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    float _2196 = _2156 * 6.283185482025146484375;
    float _2198 = cos(_2196);
    if (_2142)
    {
        return out;
    }
    float _2200 = _793 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2202 = _1998 * _2160;
    float _2204 = _2186 * 6.283185482025146484375;
    float _2206 = cos(_2204);
    float _2208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _361);
    float _2210 = _2190 * _2198;
    float _2212 = _2202 * _2200;
    float _2214 = _2190 * _2194;
    float _2216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _341);
    float _2218 = _2178 * _2194;
    float _2220 = _2208 * _2212;
    float _2222 = _2186 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2228 = _2178 * _2198;
    float _2230 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2232 = _2230 * 0.5;
    float _2234 = _2202 * _2226;
    float _2236 = _2190 * _2206;
    float _2238 = _2178 * _2206;
    float _2240 = _2216 * _2234;
    float _2242 = _2194 * _2206;
    float _2244 = _2236 * _2220;
    float _2246 = _2198 * _2206;
    float _2248 = _2238 * _2220;
    float _2250 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_2224, _2210, _2218);
    float _2254 = -_2228;
    float _2256 = fma(_2224, _2214, _2254);
    float _2258 = -_2220;
    float _2260 = _2224 * _2258;
    float _2262 = fma(_2224, _2218, _2210);
    float _2264 = fma(_2252, _2240, _2244);
    float _2266 = -_2214;
    float _2268 = fma(_2224, _2228, _2266);
    float _2270 = fma(_2246, _2240, _2260);
    float _2272 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = fma(_2256, _2232, _2264);
    float _2276 = fma(_2268, _2240, _2248);
    float _2278 = fma(_2242, _2232, _2270);
    float _2280 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2284 = fma(_2262, _2232, _2276);
    float _2286 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2288 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2282);
    float _2292 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2286);
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2290);
    float _2300 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2302 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    float _2304 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2296);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2308 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2280);
    float _2310 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2312 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2314 = _1546 + _2306;
    float _2316 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2318 = _1514 + _2310;
    float _2320 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2324 = _2314 + _2322;
    float _2326 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2330 = _2318 + _2328;
    float _2332 = _1602 + _2312;
    float _2334 = _2324 * _2324;
    float _2336 = -_2224;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2320);
    float _2340 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2300);
    float _2342 = -_2224;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2346 = fma(_2330, _2330, _2334);
    float _2348 = -_2224;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2352 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2354 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2316);
    float _2356 = sqrt(_2346);
    float _2358 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2360 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2362 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = _2268;
    float _2366 = _2224;
    float _2368 = _2318;
    float _2370 = _2340;
    if (!_2362)
    {
        _2364 = _2314;
    }
    float _2372 = _2364;
    float _2374 = _2372;
    if (!_2362)
    {
        _2366 = _2332;
    }
    float _2376 = _2366;
    bool _2378 = !_2362;
    float _2380 = _2376;
    if (!_2378)
    {
        float _2382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2386 = _2356 + _2384;
        float _2388 = rsqrt(_2346);
        float _2390 = _2386 * _2382;
        float _2392 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2394 = _2390 * 0.15915493667125701904296875;
        float _2396 = _2394 * 6.283185482025146484375;
        float _2398 = sin(_2396);
        float _2400 = _2394 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        float _2404 = fma(_2398, _2392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2406 = _2388 * _2404;
        float _2408 = _2402 + (-1.0);
        float _2410 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2412 = fma(_2330, _2406, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2414 = fma(_2324, _2406, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2416 = fma(_2332, _2402, _2410);
        _2380 = _2416;
        _2368 = _2412;
        _2374 = _2414;
    }
    float _2418 = _2380;
    float _2420 = _2368;
    float _2422 = _2374;
    float _2424 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2426 = -_1602;
    float _2428 = _2426 + _2418;
    float _2430 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2432 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    float _2434 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2424);
    float _2436 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2438 = -_1514;
    float _2440 = _2438 + _2420;
    float _2442 = _2428 * _2428;
    float _2444 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2338);
    float _2446 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2344);
    float _2448 = -_1546;
    float _2450 = _2448 + _2422;
    float _2452 = fma(_2440, _2440, _2442);
    float _2454 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2350);
    float _2456 = _2436 * _2444;
    float _2458 = _2436 * _2446;
    float _2460 = fma(_2450, _2450, _2452);
    float _2462 = _2436 * _2454;
    float _2464 = _341 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2466 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    float _2468 = sqrt(_2460);
    float _2470 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2432);
    float _2472 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2434);
    float _2474 = fma(_2464, _2340, _2456);
    float _2476 = fma(_2464, _2352, _2458);
    float _2478 = fma(_2464, _2354, _2462);
    float _2480 = _2466 + _2474;
    float _2482 = _2470 + _2476;
    float _2484 = _2472 + _2478;
    out.m_86.x = _2480;
    out.m_86.y = _2482;
    out.m_86.z = _2484;
    bool _2486 = _2468 > 0.0;
    float _2488 = _2468;
    float _2490 = _2476;
    float _2492 = _2418;
    float _2494 = _2422;
    if (!_2486)
    {
        _2488 = _2420;
    }
    float _2496 = _2488;
    bool _2498 = !_2486;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2498)
    {
        bool _2504 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2506 = _2354;
        if (_2504)
        {
            float _2508 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2506 = _2508;
        }
        float _2510 = _2506;
        float _2512 = _2510;
        if (_2504)
        {
            float _2514 = _619 * _2510;
            _2370 = _2514;
        }
        float _2516 = _2370;
        float _2518 = _2516;
        if (_2504)
        {
            float _2520 = _621 * _2510;
            _2490 = _2520;
        }
        float _2522 = _2490;
        float _2524 = _2522;
        if (_2504)
        {
            float _2526 = _623 * _2510;
            _2512 = _2526;
        }
        float _2528 = _2512;
        float _2530 = _2528;
        if (!_2504)
        {
            float _2532 = _149 + 1.0;
            if (!_279)
            {
                float _2534 = _2532 * _2532;
                float _2536 = _2534 * 0.5;
                _151 = _2536;
            }
            float _2538 = _151;
            float _2540 = _2538;
            if (!_279)
            {
                float _2542 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2540 = _2542;
            }
            float _2544 = _2540;
            bool _2546 = !_279;
            float _2548 = _2544;
            if (!_2546)
            {
                float _2550 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2552 = log2(_2550);
                float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2556 = 1.0 + _2554;
                float _2558 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2560 = _2552 * _2532;
                float _2562 = 1.0 / _2556;
                float _2564 = _2558 * 0.693147182464599609375;
                float _2566 = exp2(_2560);
                float _2568 = 1.0 / _2564;
                float _2570 = _2566 + (-1.0);
                float _2572 = -_2570;
                float _2574 = fma(_2572, _2568, _2532);
                float _2576 = _2574 * _2562;
                float _2578 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2548 = _2578;
            }
            float _2580 = _2548;
            float _2582 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2584 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2586 = _2582 * _353;
            float _2588 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2590 = _2582 * _333;
            float _2592 = _2582 * _377;
            float _2594 = fma(_2584, _345, _2586);
            float _2596 = _2580;
            _2500 = _2584;
            if (!_279)
            {
                _2596 = _2532;
            }
            float _2598 = _2596;
            float _2600 = fma(_2584, _329, _2590);
            float _2602 = fma(_2588, _357, _2594);
            bool _2604 = !_279;
            float _2606 = _2598;
            if (!_2604)
            {
                float _2608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2610 = log2(_2608);
                float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2614 = 1.0 + _2612;
                float _2616 = 1.0 / _2614;
                float _2618 = _2610 * _2532;
                float _2620 = exp2(_2618);
                float _2622 = -_2620;
                float _2624 = _2622 + 1.0;
                float _2626 = _2624 * _2616;
                _2606 = _2626;
            }
            float _2628 = _2606;
            float _2630 = fma(_2588, _337, _2600);
            float _2632 = fma(_2584, _373, _2592);
            float _2634 = fma(_2628, _267, _2602);
            float _2636 = fma(_2628, _265, _2630);
            float _2638 = fma(_2588, _381, _2632);
            float _2640 = -_581;
            float _2642 = _2640 + _2634;
            float _2644 = -_587;
            float _2646 = _2644 + _2636;
            float _2648 = fma(_2628, _269, _2638);
            float _2650 = _2642 * _179;
            float _2652 = _2642 * _173;
            float _2654 = _2642 * _185;
            float _2656 = -_593;
            float _2658 = _2656 + _2648;
            float _2660 = fma(_2646, _177, _2650);
            float _2662 = fma(_2646, _171, _2652);
            float _2664 = fma(_2646, _183, _2654);
            float _2666 = fma(_2658, _181, _2660);
            float _2668 = fma(_2658, _175, _2662);
            float _2670 = fma(_2658, _187, _2664);
            _629 = _2668;
            _631 = _2666;
            _633 = _2670;
            _2518 = _2666;
            _2524 = _2668;
            _2530 = _2670;
            _635 = _2642;
        }
        float _2672 = _629;
        float _2674 = _631;
        float _2676 = _633;
        float _2678 = _2518;
        float _2680 = _2524;
        float _2682 = _2530;
        float _2684 = _2500;
        float _2686 = _635;
        float _2688 = _2672 * _2672;
        float _2690 = rsqrt(_2460);
        float _2692 = fma(_2674, _2674, _2688);
        float _2694 = fma(_2676, _2676, _2692);
        float _2696 = sqrt(_2694);
        float _2698 = _2440 * _2690;
        float _2700 = _2428 * _2690;
        float _2702 = _2450 * _2690;
        bool _2704 = _2696 > 0.0;
        float _2706 = _2684;
        _637 = _2686;
        if (!_2704)
        {
            _2706 = _2420;
        }
        float _2708 = _2706;
        bool _2710 = !_2704;
        _2502 = _2708;
        if (!_2710)
        {
            float _2712 = rsqrt(_2694);
            float _2714 = _2712 * _2672;
            float _2716 = _2712 * _2674;
            float _2718 = _2712 * _2676;
            float _2720 = _2700 * _2714;
            float _2722 = fma(_2698, _2716, _2720);
            float _2724 = fma(_2702, _2718, _2722);
            float _2726 = _2724 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2728 = fma(_2678, _2726, _2420);
            float _2730 = fma(_2680, _2726, _2418);
            float _2732 = fma(_2682, _2726, _2422);
            _2492 = _2730;
            _2502 = _2728;
            _2494 = _2732;
        }
    }
    float _2734 = _2492;
    float _2736 = _2502;
    float _2738 = _2494;
    float _2740 = _637;
    float _2742 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2744 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2746 = floor(_2742);
    float _2748 = floor(_2744);
    float _2750 = -_2746;
    float _2752 = _2742 + _2750;
    float _2754 = -_2748;
    float _2756 = _2744 + _2754;
    float2 _8270 = float2(_2752, _2756);
    float _2758 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8270, float2(0.0), isnan(_8270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8270, float2(0.0), isnan(_8270)), level(0.0)).x;
    float _2760 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2762 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2764 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2760);
    float _2766 = -_2032;
    float _2768 = fma(_2766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2734);
    float _2770 = _2088 + _2762;
    float _2772 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2764);
    float _2774 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2776 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2778 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2780 = _2772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2782 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2774);
    float _2784 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2776);
    float _2786 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2778);
    float _2788 = 1.0 / _2780;
    float _2790 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2782);
    float _2792 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2784);
    float _2794 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2786);
    float _2796 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2798 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2802 = _2796 + _2780;
    float _2804 = trunc(_2798);
    int _2806 = int(_2804);
    float _2808 = _2802 * _2788;
    float _2810 = _2808 * 0.5;
    float _2812 = trunc(_2800);
    int _2814 = int(_2812);
    float _2816 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2818 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2816);
    float _2820 = 1.0 / _2818;
    int _2822 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2824 = _2806 + _2822;
    int _2826 = _2824 + 1;
    int _2828 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2830 = _2814 + _2828;
    int _2832 = _2830 + 1;
    float _2834 = -_2040;
    float _2836 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2736);
    int _2838 = _2826 | _2832;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2842 = _2820 * _2840;
    bool _2844 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2846 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2848 = !_2844;
    int _2850 = _2848 ? 0 : 1;
    int _2852 = 2;
    float _2854 = _2768;
    float _2856 = _2836;
    int _2858 = as_type<int>(_2738);
    float _2860 = as_type<float>(_2832);
    float _2862 = _2798;
    float _2864 = _2736;
    if (!_2844)
    {
        _2852 = 1;
    }
    int _2866 = _2852;
    int _2868 = _2866;
    if (!_2846)
    {
        _2868 = _2850;
    }
    int _2870 = _2868;
    bool _2872 = _2826 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2874 = _2870 << 6;
    bool _2876 = _2838 < 0;
    bool _2878 = _2876 || _2872;
    float _2880 = -_2090;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2738);
    int _2884 = _2874 + 48;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    uint _2888 = uint(int(uint(int(_2886)) >> uint(2)));
    int _2890 = int(_2886) & 3;
    float _2892 = (*spvDescriptorSet0.vp_c15)._m0[int(_2888)][_2890];
    int _2894 = int(_2886) + 1;
    uint _2896 = uint(int(uint(_2894) >> uint(2)));
    int _2898 = _2894 & 3;
    float _2900 = (*spvDescriptorSet0.vp_c15)._m0[int(_2896)][_2898];
    bool _2902 = _2832 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2904 = _2902 || _2878;
    bool _2906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2908 = isnan(0.5);
    bool _2910 = _2906 || _2908;
    bool _2912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2914 = _2910 || _2912;
    int _2916 = _2874 + 56;
    uint _2918 = uint(int(uint(_2916) >> uint(2)));
    uint _2920 = uint(int(uint(int(_2918)) >> uint(2)));
    int _2922 = int(_2918) & 3;
    float _2924 = (*spvDescriptorSet0.vp_c15)._m0[int(_2920)][_2922];
    int _2926 = int(_2918) + 1;
    uint _2928 = uint(int(uint(_2926) >> uint(2)));
    int _2930 = _2926 & 3;
    float _2932 = (*spvDescriptorSet0.vp_c15)._m0[int(_2928)][_2930];
    float _2934 = _2882;
    float _2936 = as_type<float>(_2870);
    if (!_2904)
    {
        int _2938 = _2832 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2940 = _2938 + _2826;
        _2042 = _2940;
    }
    int _2942 = _2042;
    int _2944 = _2874 + 64;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c15)._m0[int(_2956)][_2958];
    int _2962 = _2874 + 72;
    uint _2964 = uint(int(uint(_2962) >> uint(2)));
    uint _2966 = uint(int(uint(int(_2964)) >> uint(2)));
    int _2968 = int(_2964) & 3;
    float _2970 = (*spvDescriptorSet0.vp_c15)._m0[int(_2966)][_2968];
    int _2972 = int(_2964) + 1;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    int _2976 = _2972 & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = _2874 + 96;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    uint _2984 = uint(int(uint(int(_2982)) >> uint(2)));
    int _2986 = int(_2982) & 3;
    float _2988 = (*spvDescriptorSet0.vp_c15)._m0[int(_2984)][_2986];
    int _2990 = int(_2982) + 1;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    int _2994 = _2990 & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = _2874 + 104;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    uint _3002 = uint(int(uint(int(_3000)) >> uint(2)));
    int _3004 = int(_3000) & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    int _3008 = int(_3000) + 1;
    uint _3010 = uint(int(uint(_3008) >> uint(2)));
    int _3012 = _3008 & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = as_type<int>(_2996);
    float _3018 = as_type<float>(_2942);
    if (!_2914)
    {
        float _3020 = _2102 * _2102;
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3024 = -_1602;
        float _3026 = _3024 + _2734;
        float _3028 = -_1514;
        float _3030 = _3028 + _2736;
        float _3032 = fma(_2114, _2114, _3020);
        float _3034 = -_1546;
        float _3036 = _3034 + _2738;
        float _3038 = fma(_2124, _2124, _3032);
        float _3040 = 1.0 / _2202;
        float _3042 = sqrt(_3038);
        float _3044 = precise::min(_3042, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3046 = _3044 * _3022;
        float _3048 = _3046 * _3040;
        float _3050 = fma(_3026, _3048, _2088);
        float _3052 = fma(_3030, _3048, _2094);
        float _3054 = fma(_3036, _3048, _2110);
        _2854 = _3050;
        _2168 = as_type<int>(_3042);
        _2856 = _3052;
        _2934 = _3054;
    }
    float _3056 = _2854;
    int _3058 = _2168;
    float _3060 = _2856;
    float _3062 = _2934;
    float _3064 = _2770 * _2996;
    int _3066 = _3058;
    int _3068 = as_type<int>(_3064);
    if (!_2904)
    {
        int _3070 = _2942 << 2;
        _3066 = _3070;
    }
    int _3072 = _3066;
    float _3074 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2904)
    {
        uint _3076 = uint(int(uint(_2942) >> uint(2)));
        _3016 = int(_3076);
    }
    int _3078 = _3016;
    float _3080 = fma(_2094, _2988, _3064);
    if (!_2904)
    {
        int _3082 = 12 & _3072;
        _3068 = _3082;
    }
    int _3084 = _3068;
    float _3086 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3074);
    float _3088 = _2770 * _2900;
    float _3090 = fma(_2110, _3006, _3080);
    if (!_2904)
    {
        int _3092 = _3078 << 4;
        int _3094 = _3092 + _3084;
        _2858 = _3094;
    }
    int _3096 = _2858;
    float _3098 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3086);
    int _3100 = _2874 + 80;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    uint _3104 = uint(int(uint(int(_3102)) >> uint(2)));
    int _3106 = int(_3102) & 3;
    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[int(_3104)][_3106];
    int _3110 = int(_3102) + 1;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    int _3114 = _3110 & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    float _3118 = _3090 + _3014;
    float _3120 = fma(_2094, _2892, _3088);
    float _3122 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3124 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3126 = _2770 * _2960;
    float _3128 = fma(_2110, _2924, _3120);
    float _3130 = 1.0 / _3118;
    float _3132 = _2740;
    if (!_2904)
    {
        int _3134 = _3096 + 400;
        uint _3136 = uint(int(uint(_3134) >> uint(2)));
        uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
        int _3140 = int(_3136) & 3;
        float _3142 = (*spvDescriptorSet0.vp_c15)._m0[int(_3138)][_3140];
        _3132 = _3142;
    }
    float _3144 = _3132;
    float _3146 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3148 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3150 = _3128 + _2932;
    float _3152 = -_3146;
    float _3154 = fma(_3152, _3124, 1.0);
    float _3156 = fma(_2094, _2952, _3126);
    float _3158 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3148);
    int _3160 = _2874 + 88;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    float _3178 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3180 = fma(_2110, _2970, _3156);
    float _3182 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3158);
    float _3184 = log2(_3154);
    float _3186 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3178);
    float _3188 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3190 = _3150 * _3130;
    float _3192 = _3180 + _2978;
    float _3194 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3186);
    float _3196 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3198 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3188);
    bool _3200 = _3190 >= 0.0;
    float _3202 = _3192 * _3130;
    float _3204 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3206 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3208 = _3190 <= 1.0;
    bool _3210 = _3208 && _3200;
    float _3212 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3198);
    float _3214 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3216 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3206);
    bool _3218 = _3202 >= 0.0;
    bool _3220 = _3218 && _3210;
    float _3222 = _3212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3224 = _3088;
    float _3226 = _3212;
    if (!_2904)
    {
        float _3228 = floor(_2798);
        _3224 = _3228;
    }
    float _3230 = _3224;
    float _3232 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3216);
    bool _3234 = _3202 <= 1.0;
    bool _3236 = _3234 && _3220;
    float _3238 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3240 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3214);
    float _3242 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3232);
    float _3244 = _3184 * 0.693147182464599609375;
    float _3246 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3238);
    float _3248 = _3154;
    if (!_2904)
    {
        float _3250 = floor(_2800);
        _3248 = _3250;
    }
    float _3252 = _3248;
    float _3254 = _2770 * _3116;
    float _3256 = _3244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3258 = fma(_2094, _3108, _3254);
    if (_3236)
    {
        float _3260 = float(_2870);
        _3226 = _3260;
    }
    float _3262 = _3226;
    float _3264 = 1.0 / _3242;
    if (!_2904)
    {
        float _3266 = -_3230;
        float _3268 = _2798 + _3266;
        _2860 = _3268;
    }
    float _3270 = _2860;
    float _3272 = _3144;
    if (!_2904)
    {
        float _3274 = rint(_3144);
        float _3276 = precise::max(_3274, 0.0);
        uint _3278 = uint(_3276);
        uint _3280 = clamp(_3278, 0u, 65535u);
        _3272 = as_type<float>(_3280);
    }
    float _3282 = _3272;
    float _3284 = _3252;
    if (!_2904)
    {
        float _3286 = -_3252;
        float _3288 = _2800 + _3286;
        _3284 = _3288;
    }
    float _3290 = _3284;
    float _3292 = fma(_2110, _3168, _3258);
    float _3294 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3246);
    float _3296 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3240);
    float _3298 = _3292 + _3176;
    float _3300 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3294);
    float _3302 = _3262;
    if (_3236)
    {
        float _3304 = rint(_3262);
        float _3306 = precise::max(_3304, 0.0);
        uint _3308 = uint(_3306);
        uint _3310 = clamp(_3308, 0u, 65535u);
        _3302 = as_type<float>(_3310);
    }
    float _3312 = _3302;
    float _3314 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3296);
    float _3316 = _3298 * _3130;
    float _3318 = _3300 * _3264;
    float _3320 = _3314 * _3264;
    float _3322 = fma(_3318, 0.5, 0.5);
    float _3324 = fma(_3320, -0.5, 0.5);
    float _3326 = _3282;
    float _3328 = _3320;
    float _3330 = _3314;
    if (!_2904)
    {
        float3 _9246 = float3(_3270, _3290, float(as_type<int>(_3282)));
        float3 _9250 = select(_9246, float3(0.0), isnan(_9246));
        float _3332 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9250.xy, uint(rint(_9250.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9250.xy, uint(rint(_9250.z)), level(0.0)).x;
        _3326 = _3332;
    }
    float _3334 = _3326;
    float _3336 = _3312;
    if (_3236)
    {
        float3 _9265 = float3(_3190, _3202, float(as_type<int>(_3312)));
        float3 _9267 = select(_9265, float3(0.0), isnan(_9265));
        float _3338 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9267.xy, uint(rint(_9267.z)), _3316, level(0.0));
        _3336 = _3338;
    }
    float _3340 = _3336;
    float3 _9277 = float3(_3322, _3324, _3256);
    float _3342 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9277, float3(0.0), isnan(_9277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9277, float3(0.0), isnan(_9277)), level(0.0)).x;
    float3 _9286 = float3(_3322, _3324, _3256);
    float4 _3345 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9286, float3(0.0), isnan(_9286)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9286, float3(0.0), isnan(_9286)), level(0.0)).xyzw;
    float _3347 = _3345.x;
    float _3349 = _3345.y;
    float _3351 = _3345.z;
    float _3353 = _3345.w;
    bool _3355 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3357 = isnan(0.5);
    bool _3359 = _3355 || _3357;
    bool _3361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3363 = _3359 || _3361;
    if (_2904)
    {
        _639 = 1.0;
    }
    float _3365 = _639;
    float _3367 = _3365;
    if (_3363)
    {
        _2862 = 1.0;
    }
    float _3369 = _2862;
    float _3371 = _3369;
    if (_3363)
    {
        _2936 = 1.0;
    }
    float _3373 = _2936;
    float _3375 = _3373;
    if (!_3363)
    {
        float _3377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3379 = _3377 * 0.15915493667125701904296875;
        float _3381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3383 = _3379 * 6.283185482025146484375;
        float _3385 = cos(_3383);
        float _3387 = _3381 * 0.15915493667125701904296875;
        float _3389 = _3379 * 6.283185482025146484375;
        float _3391 = sin(_3389);
        float _3393 = 1.0 / _3385;
        float _3395 = _3387 * 6.283185482025146484375;
        float _3397 = cos(_3395);
        float _3399 = _3391 * _3393;
        float _3401 = _3387 * 6.283185482025146484375;
        float _3403 = sin(_3401);
        float _3405 = _3397 * _3399;
        float _3407 = 1.0 / _3405;
        float _3409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3409;
        float _3413 = 1.0 / _3411;
        float _3415 = _3403 * _3407;
        float _3417 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3419 = fma(_2842, _3415, _3417);
        float _3421 = _3419 * _3413;
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        _3328 = _3387;
        _3375 = _3423;
    }
    float _3425 = _3328;
    float _3427 = _3375;
    float _3429 = _3425;
    if (!_3363)
    {
        float _3431 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3433 = _3431 * 0.15915493667125701904296875;
        float _3435 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3437 = _3433 * 6.283185482025146484375;
        float _3439 = cos(_3437);
        float _3441 = _3435 * 0.15915493667125701904296875;
        float _3443 = _3433 * 6.283185482025146484375;
        float _3445 = sin(_3443);
        float _3447 = 1.0 / _3439;
        float _3449 = _3441 * 6.283185482025146484375;
        float _3451 = cos(_3449);
        float _3453 = _3445 * _3447;
        float _3455 = _3441 * 6.283185482025146484375;
        float _3457 = sin(_3455);
        float _3459 = _3451 * _3453;
        float _3461 = 1.0 / _3459;
        float _3463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3465 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3463;
        float _3467 = 1.0 / _3465;
        float _3469 = _3457 * _3461;
        float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3473 = fma(_2842, _3469, _3471);
        float _3475 = _3473 * _3467;
        float _3477 = precise::clamp(_3475, 0.0, 1.0);
        float _3479 = -_3477;
        float _3481 = _3479 + 1.0;
        _3429 = _3459;
        _3371 = _3481;
    }
    float _3483 = _3429;
    float _3485 = _3371;
    float _3487 = _3483;
    if (!_2904)
    {
        int _3489 = _2942 << 4;
        int _3491 = _3489 + 2048;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        uint _3495 = uint(int(uint(int(_3493)) >> uint(2)));
        int _3497 = int(_3493) & 3;
        float _3499 = (*spvDescriptorSet0.vp_c15)._m0[int(_3495)][_3497];
        int _3501 = int(_3493) + 1;
        uint _3503 = uint(int(uint(_3501) >> uint(2)));
        int _3505 = _3501 & 3;
        float _3507 = (*spvDescriptorSet0.vp_c15)._m0[int(_3503)][_3505];
        int _3509 = _3491 + 8;
        uint _3511 = uint(int(uint(_3509) >> uint(2)));
        uint _3513 = uint(int(uint(int(_3511)) >> uint(2)));
        int _3515 = int(_3511) & 3;
        float _3517 = (*spvDescriptorSet0.vp_c15)._m0[int(_3513)][_3515];
        int _3519 = int(_3511) + 1;
        uint _3521 = uint(int(uint(_3519) >> uint(2)));
        int _3523 = _3519 & 3;
        float _3525 = (*spvDescriptorSet0.vp_c15)._m0[int(_3521)][_3523];
        float _3527 = _2770 * _3507;
        float _3529 = fma(_2094, _3499, _3527);
        float _3531 = fma(_2110, _3517, _3529);
        float _3533 = _3531 + _3525;
        float _3535 = precise::clamp(_3533, 0.0, 1.0);
        float _3537 = -_3535;
        float _3539 = _3537 + _3334;
        float _3541 = fma(_3539, 500.0, 1.5);
        float _3543 = exp2(_3541);
        float _3545 = 0.0 + _3543;
        float _3547 = precise::clamp(_3545, 0.0, 1.0);
        _3018 = as_type<float>(_3491);
        _3487 = _3517;
        _3367 = _3547;
    }
    float _3549 = _3018;
    float _3551 = _3487;
    float _3553 = _3367;
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3557 = _3056 + _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3561 = _3060 + _3559;
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3565 = _3062 + _3563;
    float _3567 = _3557 * _3557;
    float _3569 = fma(_3561, _3561, _3567);
    float _3571 = fma(_3565, _3565, _3569);
    float _3573 = rsqrt(_3571);
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3577 = _3561 * _3575;
    float _3579 = _3565 * _3575;
    float _3581 = _3577 * _3577;
    float _3583 = _3579 * _3579;
    float _3585 = _3581 + _3583;
    float _3587 = sqrt(_3585);
    bool _3589 = _3587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3593 = _3587 + _3591;
    float _3595 = _3573;
    float _3597 = _3593;
    float _3599 = _3549;
    float _3601 = _3557;
    float _3603 = _3575;
    if (_3589)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3595 = _3605;
    }
    float _3607 = _3595;
    float _3609 = _3607;
    if (_3589)
    {
        float _3611 = _3593 * _3607;
        _3597 = _3611;
    }
    float _3613 = _3597;
    if (_3589)
    {
        float _3615 = rsqrt(_3585);
        _3609 = _3615;
    }
    float _3617 = _3609;
    float _3619 = _3617;
    if (_3589)
    {
        float _3621 = _3613 * 0.15915493667125701904296875;
        _3599 = _3621;
    }
    float _3623 = _3599;
    float _3625 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3627 = _3565;
    if (_3589)
    {
        float _3629 = _3623 * 6.283185482025146484375;
        float _3631 = sin(_3629);
        _3627 = _3631;
    }
    float _3633 = _3627;
    float _3635 = precise::max(0.0, _3625);
    float _3637 = _3551;
    float _3639 = _3635;
    if (_3589)
    {
        float _3641 = _3623 * 6.283185482025146484375;
        float _3643 = cos(_3641);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = -_3575;
    float _3649 = -_3635;
    float _3651 = fma(_3557, _3647, _3649);
    if (_3589)
    {
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3601 = _3653;
    }
    float _3655 = _3601;
    float _3657 = _3633;
    float _3659 = _3655;
    if (_3589)
    {
        float _3661 = fma(_3633, _3655, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3657 = _3661;
    }
    float _3663 = _3657;
    float _3665 = _3663;
    if (!_3589)
    {
        _3659 = _3579;
    }
    float _3667 = _3659;
    float _3669 = _3667;
    if (_3589)
    {
        float _3671 = _3617 * _3663;
        _2864 = _3671;
    }
    float _3673 = _2864;
    if (!_3589)
    {
        _3619 = _3577;
    }
    float _3675 = _3619;
    float _3677 = _3675;
    float _3679 = _3645;
    if (_3589)
    {
        float _3681 = _3645 + (-1.0);
        _3639 = _3681;
    }
    float _3683 = _3639;
    if (_3589)
    {
        float _3685 = _3577 * _3673;
        _3677 = _3685;
    }
    float _3687 = _3677;
    if (!_3589)
    {
        _3665 = _3651;
    }
    float _3689 = _3665;
    float _3691 = _3689;
    if (_3589)
    {
        float _3693 = _3579 * _3673;
        _3669 = _3693;
    }
    float _3695 = _3669;
    if (_3589)
    {
        float _3697 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3603 = _3697;
    }
    float _3699 = _3603;
    float _3701 = sqrt(_3571);
    float _3703 = _3699;
    if (_3589)
    {
        float _3705 = fma(_3651, _3645, _3699);
        _3691 = _3705;
    }
    float _3707 = _3691;
    if (!_3589)
    {
        _3703 = _3581;
    }
    float _3709 = _3703;
    float _3711 = _3709;
    if (_3589)
    {
        float _3713 = _3687 * _3687;
        _3711 = _3713;
    }
    float _3715 = _3711;
    if (!_3589)
    {
        _3679 = _3583;
    }
    float _3717 = _3679;
    float _3719 = _3717;
    if (_3589)
    {
        float _3721 = _3695 * _3695;
        _3719 = _3721;
    }
    float _3723 = _3719;
    float _3725 = fma(_3707, _3707, _3715);
    float _3727 = _3725 + _3723;
    float _3729 = rsqrt(_3727);
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3733 = fma(_3701, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3731);
    float _3735 = precise::clamp(_3733, 0.0, 1.0);
    float _3737 = -_3735;
    float _3739 = _3737 + 1.0;
    float _3741 = abs(_3739);
    float _3743 = log2(_3741);
    float _3745 = _3729 * _3687;
    float _3747 = _3729 * _3707;
    float _3749 = _3729 * _3695;
    float _3751 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3753 = -_3751;
    float _3755 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3753);
    float _3757 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3759 = -_3749;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3755);
    float _3763 = _3747 + 1.0;
    float _3765 = exp2(_3757);
    float _3767 = fma(_3761, -0.5, 0.5);
    float _3769 = fma(_3761, 0.5, 0.5);
    float _3771 = fma(_3769, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3773 = sqrt(_3767);
    float _3775 = fma(_3769, _3771, -0.212114393711090087890625);
    float _3777 = fma(_3769, _3775, 1.570728778839111328125);
    float _3779 = -_3747;
    float _3781 = fma(_3765, _3763, _3779);
    float _3783 = fma(_3781, 0.5, 0.5);
    float _3785 = _3773 * 0.636619746685028076171875;
    float _3787 = -_3777;
    float _3789 = fma(_3785, _3787, 1.0);
    float2 _9937 = float2(_3789, _3783);
    float3 _3793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9937, float2(0.0), isnan(_9937)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9937, float2(0.0), isnan(_9937)), level(0.0)).xyz;
    float _3795 = _3793.x;
    float _3797 = _3793.y;
    float _3799 = _3793.z;
    float _3801 = abs(_2842);
    float _3803 = log2(_3801);
    float _3805 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3807 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = -_2758;
    float _3811 = _3809 + 1.0;
    float _3813 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3805);
    float _3815 = exp2(_3807);
    float _3817 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3813);
    float _3819 = _3242 * 0.5;
    bool _3821 = _2842 <= 8000.0;
    bool _3823 = isnan(_2842);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(8000.0);
    bool _3829 = _3825 || _3827;
    float _3831 = float(_3829);
    float _3833 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3817);
    float _3835 = fma(_3314, -0.5, _3819);
    float _3837 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3839 = _3833 + _3242;
    float _3841 = _3300 + _3242;
    out.gl_Position.x = _3300;
    out.gl_Position.y = _3314;
    out.gl_Position.z = _3833;
    out.gl_Position.w = _3242;
    float _3843 = _3839 * 0.5;
    float _3845 = exp2(_3837);
    float _3847 = _3841 * 0.5;
    out.m_88.x = _3847;
    out.m_88.y = _3835;
    out.m_88.z = _3843;
    out.m_88.w = _3242;
    float _3849 = -_3815;
    float _3851 = _3849 + 1.0;
    if (!_3236)
    {
        _3330 = 1.0;
    }
    float _3853 = _3330;
    float _3855 = _3853;
    if (_3236)
    {
        bool _3857 = _3340 >= _3316;
        bool _3859 = isnan(_3340);
        bool _3861 = _3857 || _3859;
        bool _3863 = isnan(_3316);
        bool _3865 = _3861 || _3863;
        float _3867 = float(_3865);
        _3855 = _3867;
    }
    float _3869 = _3855;
    float _3871 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3873 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    bool _3877 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3879 = isnan(_3701);
    bool _3881 = _3877 || _3879;
    bool _3883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3885 = _3881 || _3883;
    float _3887 = _3869 * _3553;
    float _3889 = fma(_3875, -2.0, 3.0);
    float _3891 = _3875 * _3875;
    float _3893 = _3871 * _3342;
    float _3895 = -_3871;
    float _3897 = _3895 + 1.0;
    float _3899 = _3891 * _3889;
    float _3901 = _3353 * _3893;
    float _3903 = _3353 * _3897;
    float _3905 = _3427 * _3485;
    float _3907 = -_3899;
    float _3909 = _3907 + 1.0;
    float _3911 = _3905 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3913 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3899);
    float _3915 = _3905;
    float _3917 = _3901;
    if (!_3885)
    {
        _3915 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3919 = _3915;
    float _3921 = _3831 * _3913;
    float _3923 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _3811 * _3923;
    float _3927 = precise::clamp(_3925, 0.0, 1.0);
    float _3929 = -_3927;
    float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3933 = -_3887;
    float _3935 = fma(_3933, _3931, 1.0);
    float _3937 = precise::clamp(_3935, 0.0, 1.0);
    float _3939 = _3937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3941 = _3937;
    float _3943 = _3919;
    float _3945 = _3919;
    if (!_3885)
    {
        _3941 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3947 = _3941;
    out.m_90.x = _3939;
    float _3949 = _3799 * _3893;
    float _3951 = fma(_3795, _3901, _3347);
    float _3953 = fma(_3797, _3901, _3349);
    float _3955 = _3947;
    float _3957 = _3947;
    if (!_3885)
    {
        _3917 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3959 = _3917;
    float _3961 = fma(_3353, _3949, _3351);
    out.m_92.x = _3951;
    out.m_92.y = _3953;
    out.m_92.z = _3961;
    out.m_92.w = _3903;
    bool _3963 = !_3885;
    float _3965 = _3959;
    float _3967 = _3959;
    if (!_3963)
    {
        bool _3969 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3971 = isnan(_3701);
        bool _3973 = _3969 || _3971;
        bool _3975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3977 = _3973 || _3975;
        if (!_3977)
        {
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3981 = _3701 + _3979;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3985 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3983;
            float _3987 = 1.0 / _3985;
            float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3995 = _3993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3997 = _3981 * _3987;
            float _3999 = precise::clamp(_3997, 0.0, 1.0);
            float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4005 = fma(_3999, _3995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4007 = fma(_3999, _4003, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4009 = fma(_3999, _3991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3957 = _4009;
            _3967 = _4007;
            _3945 = _4005;
            _4011 = true;
        }
        else
        {
            bool _4013 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4015 = isnan(_3701);
            bool _4017 = _4013 || _4015;
            bool _4019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4021 = _4017 || _4019;
            if (!_4021)
            {
                _3965 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4023 = _3965;
            _3967 = _4023;
            if (!_4021)
            {
                _3955 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4025 = _3955;
            _3957 = _4025;
            if (!_4021)
            {
                _3943 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4027 = _3943;
            bool _4029 = !_4021;
            _3945 = _4027;
            if (!_4029)
            {
                bool _4031 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4033 = isnan(_3701);
                bool _4035 = _4031 || _4033;
                bool _4037 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4039 = _4035 || _4037;
                if (!_4039)
                {
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4043 = _3701 + _4041;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4047 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4045;
                    float _4049 = 1.0 / _4047;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4059 = _4043 * _4049;
                    float _4061 = precise::clamp(_4059, 0.0, 1.0);
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4067 = fma(_4061, _4057, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4069 = fma(_4061, _4065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4071 = fma(_4061, _4053, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3957 = _4071;
                    _3967 = _4069;
                    _3945 = _4067;
                    _4011 = true;
                }
                else
                {
                    _3957 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3967 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3945 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4011 = false;
    float _4073 = _3957;
    float _4075 = _3967;
    float _4077 = _3945;
    float _4079 = _3911 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_94.x = 0.0;
    float _4081 = _4073 * 0.586610972881317138671875;
    bool _4083 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _4079;
    float _4085 = fma(_4075, 0.298911988735198974609375, _4081);
    bool _4087 = _3427 > 0.0;
    bool _4089 = isnan(_3427);
    bool _4091 = _4087 || _4089;
    bool _4093 = isnan(0.0);
    bool _4095 = _4091 || _4093;
    float _4097 = fma(_4077, 0.114477999508380889892578125, _4085);
    bool _4099 = _3485 <= 0.0;
    bool _4101 = !_4095;
    bool _4103 = _4099 || _4101;
    float _4105 = -_4097;
    float _4107 = _4105 + _4075;
    float _4109 = -_4097;
    float _4111 = _4109 + _4073;
    float _4113 = -_4097;
    float _4115 = _4113 + _4077;
    float _4117 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    float _4119 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    float _4121 = fma(_4115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    bool _4123 = !_4083;
    if (!_4123)
    {
        float _4125 = -_3056;
        float _4127 = _4125 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4129 = -_3060;
        float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4133 = -_3062;
        float _4135 = _4133 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4137 = _4127 * _4127;
        float _4139 = fma(_4131, _4131, _4137);
        float _4141 = fma(_4135, _4135, _4139);
        float _4143 = sqrt(_4141);
        float _4145 = rsqrt(_4141);
        float _4147 = -_4143;
        float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4151 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4153 = precise::clamp(_4151, 0.0, 1.0);
        float _4155 = _4131 * _4145;
        float _4157 = _4127 * _4145;
        float _4159 = abs(_4153);
        float _4161 = log2(_4159);
        float _4163 = _4135 * _4145;
        float _4165 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4167 = _2482 * _4157;
        float _4169 = -_4157;
        float _4171 = -_4165;
        float _4173 = fma(_4169, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4171);
        float _4175 = fma(_2480, _4155, _4167);
        float _4177 = -_4163;
        float _4179 = fma(_4177, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4173);
        float _4181 = fma(_2484, _4163, _4175);
        float _4183 = precise::clamp(_4181, 0.0, 1.0);
        float _4185 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4187 = _4179 + _4185;
        float _4189 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4191 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4193 = precise::clamp(_4191, 0.0, 1.0);
        float _4195 = exp2(_4189);
        float _4197 = _4195 * _4193;
        float _4199 = _4183 * _4197;
        float _4201 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4203 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4205 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4201;
        out.m_94.y = _4203;
        out.m_94.z = _4205;
    }
    out.m_96.x = _4117;
    out.m_96.y = _4119;
    out.m_96.z = _4121;
    if (!_4103)
    {
        return out;
    }
    float _4207 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4207;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4011 = false;
    bool _999 = false;
    bool _815 = false;
    bool _659 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _4264 = as_type<float>(_131);
        out.gl_Position.z = _4264;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4334 = as_type<float>(_169);
        out.gl_Position.z = _4334;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_63.x;
    float _173 = in.m_63.y;
    float _175 = in.m_63.z;
    float _177 = in.m_65.x;
    float _179 = in.m_65.y;
    float _181 = in.m_65.z;
    float _183 = in.m_67.x;
    float _185 = in.m_67.y;
    float _187 = in.m_67.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_72.w;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    float _199 = _171 * _171;
    float _201 = _173 * _173;
    float _203 = fma(_177, _177, _199);
    float _205 = fma(_179, _179, _201);
    float _207 = fma(_183, _183, _203);
    float _209 = _175 * _175;
    float _211 = fma(_185, _185, _205);
    float _213 = sqrt(_207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_187, _187, _215);
    float _219 = sqrt(_211);
    float _221 = sqrt(_217);
    bool _223 = _213 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = 0.0;
    float _229 = _213;
    float _231 = _207;
    float _233 = _211;
    if (_223)
    {
        float _235 = rsqrt(_207);
        _227 = _235;
    }
    float _237 = _227;
    if (!_223)
    {
        _229 = 0.0;
    }
    float _239 = _229;
    bool _241 = _221 > 0.0;
    float _243 = 0.0;
    float _245 = _239;
    if (!_223)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    int _249 = as_type<int>(_189) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_189) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    float _259 = _247;
    if (_225)
    {
        float _261 = rsqrt(_211);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = in.m_61.x;
    float _267 = in.m_61.y;
    float _269 = in.m_61.z;
    bool _271 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _275 = _271 || _273;
    bool _277 = isnan(1.0);
    bool _279 = _275 || _277;
    float _281 = 0.0;
    float _283 = 0.0;
    if (!_225)
    {
        _281 = 0.0;
        _283 = 0.0;
    }
    float _285 = _281;
    float _287 = _283;
    float _289 = _285;
    float _291 = _287;
    if (!_223)
    {
        _231 = 0.0;
    }
    float _293 = _231;
    float _295 = 0.0;
    float _297 = _293;
    if (!_225)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = 0.0;
    float _303 = _299;
    if (_241)
    {
        float _305 = rsqrt(_217);
        _301 = _305;
    }
    float _307 = _301;
    float _309 = 0.0;
    float _311 = 0.0;
    if (!_241)
    {
        _309 = 0.0;
        _311 = 0.0;
    }
    float _313 = _309;
    float _315 = _311;
    float _317 = 0.0;
    float _319 = _315;
    float _321 = _313;
    if (!_241)
    {
        _317 = 0.0;
    }
    float _323 = _317;
    float _325 = _323;
    if (_223)
    {
        float _327 = _237 * _177;
        _245 = _327;
    }
    float _329 = _245;
    if (_223)
    {
        float _331 = _237 * _171;
        _297 = _331;
    }
    float _333 = _297;
    if (_223)
    {
        float _335 = _237 * _183;
        _259 = _335;
    }
    float _337 = _259;
    bool _339 = !_251;
    float _341 = _339 ? (-0.5) : 0.5;
    if (_225)
    {
        float _343 = _263 * _179;
        _303 = _343;
    }
    float _345 = _303;
    float _347 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _349 = _347;
    if (_225)
    {
        float _351 = _263 * _173;
        _289 = _351;
    }
    float _353 = _289;
    if (_225)
    {
        float _355 = _263 * _185;
        _291 = _355;
    }
    float _357 = _291;
    bool _359 = !_255;
    float _361 = _359 ? (-0.5) : 0.5;
    if (!_279)
    {
        float _363 = _347 * _347;
        float _365 = _363 * 0.5;
        _233 = _365;
    }
    float _367 = _233;
    float _369 = _367;
    if (_241)
    {
        float _371 = _307 * _181;
        _319 = _371;
    }
    float _373 = _319;
    if (_241)
    {
        float _375 = _307 * _175;
        _321 = _375;
    }
    float _377 = _321;
    if (_241)
    {
        float _379 = _307 * _187;
        _325 = _379;
    }
    float _381 = _325;
    if (!_279)
    {
        float _383 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _383;
    }
    float _385 = _369;
    bool _387 = !_279;
    float _389 = _385;
    if (!_387)
    {
        float _391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = log2(_391);
        float _395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _397 = _395 + 1.0;
        float _399 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = _347 * _393;
        float _403 = 1.0 / _397;
        float _405 = _399 * 0.693147182464599609375;
        float _407 = exp2(_401);
        float _409 = 1.0 / _405;
        float _411 = _407 + (-1.0);
        float _413 = -_411;
        float _415 = fma(_413, _409, _347);
        float _417 = _415 * _403;
        float _419 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _389 = _419;
    }
    float _421 = _389;
    float _423 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _425 = !_279;
    float _427 = _423;
    float _429 = _421;
    if (!_425)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _347 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _349 = _449;
    }
    float _451 = _349;
    float _453 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _455 = _423 * _333;
    float _457 = _423 * _353;
    float _459 = _423 * _377;
    float _461 = _451;
    if (!_279)
    {
        float _463 = _149 * _149;
        float _465 = _463 * 0.5;
        _427 = _465;
    }
    float _467 = _427;
    float _469 = fma(_453, _329, _455);
    float _471 = fma(_453, _345, _457);
    float _473 = fma(_453, _373, _459);
    float _475 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_279)
    {
        float _477 = _467 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _429 = _477;
    }
    float _479 = _429;
    bool _481 = !_279;
    float _483 = _479;
    if (!_481)
    {
        float _485 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _487 = log2(_485);
        float _489 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _491 = _489 + 1.0;
        float _493 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _495 = _149 * _487;
        float _497 = 1.0 / _491;
        float _499 = _493 * 0.693147182464599609375;
        float _501 = exp2(_495);
        float _503 = 1.0 / _499;
        float _505 = _501 + (-1.0);
        float _507 = -_505;
        float _509 = fma(_507, _503, _149);
        float _511 = _509 * _497;
        float _513 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _483 = _513;
    }
    float _515 = _483;
    float _517 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _519 = fma(_475, _337, _469);
    float _521 = fma(_475, _357, _471);
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _525 = _517 * _333;
    float _527 = _517 * _353;
    float _529 = _517 * _377;
    float _531 = fma(_475, _381, _473);
    float _533 = fma(_523, _329, _525);
    float _535 = fma(_523, _345, _527);
    float _537 = fma(_523, _373, _529);
    float _539 = _515 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_451, _265, _519);
    float _543 = fma(_451, _267, _521);
    float _545 = fma(_451, _269, _531);
    float _547 = fma(_539, _337, _533);
    float _549 = fma(_539, _357, _535);
    float _551 = fma(_539, _381, _537);
    if (!_279)
    {
        _461 = _149;
    }
    float _553 = _461;
    bool _555 = !_279;
    float _557 = _553;
    if (!_555)
    {
        float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _561 = log2(_559);
        float _563 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _565 = _563 + 1.0;
        float _567 = 1.0 / _565;
        float _569 = _149 * _561;
        float _571 = exp2(_569);
        float _573 = -_571;
        float _575 = _573 + 1.0;
        float _577 = _575 * _567;
        _557 = _577;
    }
    float _579 = _557;
    float _581 = fma(_579, _267, _549);
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _585 = fma(_543, _191, _195);
    float _587 = fma(_579, _265, _547);
    float _589 = -_581;
    float _591 = _543 + _589;
    float _593 = fma(_579, _269, _551);
    float _595 = fma(_541, _191, _193);
    float _597 = -_587;
    float _599 = _541 + _597;
    float _601 = _591 * _179;
    float _603 = _591 * _173;
    float _605 = _591 * _185;
    float _607 = -_593;
    float _609 = _545 + _607;
    float _611 = fma(_599, _177, _601);
    float _613 = fma(_599, _171, _603);
    float _615 = fma(_599, _183, _605);
    float _617 = fma(_545, _191, _197);
    float _619 = fma(_609, _181, _611);
    float _621 = fma(_609, _175, _613);
    float _623 = fma(_609, _187, _615);
    bool _625 = !_583;
    float _627 = _617;
    float _629 = _621;
    float _631 = _619;
    float _633 = _623;
    float _635 = _581;
    float _637 = _581;
    float _639 = _593;
    float _657;
    if (!_625)
    {
        float _641 = in.m_74.x;
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _645 = _641 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _649 = _647 * _643;
        float _651 = floor(_649);
        float _653 = -_651;
        float _655 = _649 + _653;
        _657 = _655;
        _659 = true;
    }
    else
    {
        float _661 = float(_115);
        float _663 = 1.0 / _661;
        float _665 = _149 * _663;
        _657 = _665;
    }
    _659 = false;
    float _667 = _657;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _671 = _667 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _667 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _685 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _687 = isnan(_667);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = in.m_72.x;
    float _699 = in.m_72.y;
    bool _701 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _703 = isnan(_667);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = 1.0 / _683;
    bool _715 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _717 = -_695;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _679;
    float _723 = _675 * _713;
    float _725 = _671 * _721;
    bool _727 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _729 = isnan(_667);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _743;
    float _747 = -_737;
    float _749 = _747 + 1.0;
    float _751 = fma(_741, _725, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _753 = fma(_745, _725, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _755 = _737 * _719;
    float _757 = _711 * _749;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _763 = -_711;
    float _765 = _763 + 1.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _771 = _751 * _757;
    float _773 = _753 * _757;
    float _775 = fma(_761, _723, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_769, _723, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[143].x, _771);
    float _781 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[143].y, _773);
    float _783 = fma(_775, _755, _779);
    float _785 = fma(_777, _755, _781);
    float _787 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[145].x, _783);
    float _789 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[145].y, _785);
    float _791 = _787 * _697;
    float _793 = _789 * _699;
    bool _795 = !_715;
    float _813;
    if (!_795)
    {
        float _797 = in.m_74.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_115);
        float _819 = 1.0 / _817;
        float _821 = _149 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _827 = _823 + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _837 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _839 = isnan(_823);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _853 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_823);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = 1.0 / _831;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    float _871 = -_847;
    float _873 = _871 + 1.0;
    bool _875 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _877 = isnan(_823);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = 1.0 / _835;
    float _891 = 1.0 / _851;
    float _893 = _869 * _865;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _899 = _863 * _873;
    float _901 = -_863;
    float _903 = _901 + 1.0;
    float _905 = fma(_893, _827, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _907 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _909 = isnan(_823);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _885 * _903;
    float _921 = _897 * _889;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _823 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _927;
    float _931 = _905 * _919;
    float _933 = -_885;
    float _935 = _933 + 1.0;
    float _937 = fma(_921, _925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _939 = -_917;
    float _941 = _939 + 1.0;
    float _943 = _929 * _891;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _947 = _823 + _945;
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _951 = _847 * _941;
    float _953 = fma(_943, _947, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _955 = fma(_937, _899, _949);
    float _957 = fma(_953, _951, _955);
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _965 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[118].x, _957);
    float _967 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _965 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_76.x = _967;
    out.m_76.y = _969;
    out.m_76.z = _971;
    out.m_76.w = _973;
    bool _975 = !_887;
    float _995;
    float _997;
    if (!_975)
    {
        float _977 = in.m_74.x;
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _981 = float(_115);
        float _983 = _977 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _987 = _985 * _979;
        float _989 = floor(_987);
        float _991 = -_989;
        float _993 = _987 + _991;
        _995 = _993;
        _997 = _981;
        _999 = true;
    }
    else
    {
        float _1001 = float(_115);
        float _1003 = 1.0 / _1001;
        float _1005 = _149 * _1003;
        _995 = _1005;
        _997 = _1001;
    }
    _999 = false;
    float _1007 = _995;
    float _1009 = _997;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1013 = int(_1011);
    float _1015 = in.m_65.w;
    float _1017 = _585 * _185;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1021 = _1019 != 0;
    float _1023 = in.m_67.w;
    float _1025 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1027 = int(_1025);
    float _1029 = fma(_595, _183, _1017);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1033 = _1007 + _1031;
    float _1035 = in.m_63.w;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1039 = 1.0 / _1009;
    float _1041 = float(_1013);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1045 = 1.0 / _1041;
    float _1047 = float(uint(_1027));
    float _1049 = float(_1027);
    bool _1051 = _1027 == 0;
    float _1053 = 1.0 / _1047;
    float _1055 = _149 * _1045;
    float _1057 = trunc(_1055);
    int _1059 = int(_1057);
    int _1061 = as_type<int>(_1053) + (-2);
    float _1063 = float(uint(_1059));
    float _1065 = as_type<float>(_1061) * _1063;
    int _1067 = ~_1027;
    int _1069 = _1067 + 1;
    float _1071 = trunc(_1065);
    float _1073 = precise::max(_1071, 0.0);
    uint _1076 = uint(_1073);
    int _1078 = ~_1027;
    int _1080 = _1078 + 1;
    int _1082 = _1069 * int(_1076);
    int _1084 = _1082 + _1059;
    float _1086 = float(uint(_1084));
    float _1088 = as_type<float>(_1061) * _1086;
    float _1090 = in.m_74.x;
    float _1092 = in.m_74.y;
    float _1094 = in.m_74.z;
    float _1096 = in.m_74.w;
    float _1098 = trunc(_1088);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    int _1104 = int(_1076) + int(_1102);
    float _1106 = float(_1059);
    int _1108 = _1080 * _1104;
    int _1110 = _1108 + _1059;
    bool _1112 = _1106 >= _1049;
    bool _1114 = isnan(_1106);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1049);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = !_1021;
    float _1126 = _1124 ? 7.345489978790283203125 : 1.0;
    bool _1128 = uint(_1110) >= uint(_1027);
    float _1130 = trunc(_1122);
    int _1132 = int(_1130);
    float _1134 = _1126 * _1090;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    int _1140 = ~_1104;
    int _1142 = _1140 + _1138;
    int _1144 = _1142 + 1;
    float _1146 = floor(_1134);
    int _1148 = _1027 * _1144;
    int _1150 = _1148 + _1059;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1162 = _1160 != 0;
    int _1164 = ~_1132;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    bool _1170 = !_1051;
    int _1172 = _1170 ? _1150 : (-1);
    bool _1174 = !_1154;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _1172 * _1168;
    float _1180 = -_1146;
    float _1182 = _1134 + _1180;
    int _1184 = _1027 + (-1);
    float _1186 = _1182 * _1049;
    float _1188 = _149 * _1049;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1192 = _1190 != 0;
    bool _1194 = !_1158;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = _1188 * _1039;
    float _1200 = trunc(_1186);
    int _1202 = int(_1200);
    int _1204 = _1132 * _1184;
    int _1206 = _1204 + _1178;
    bool _1208 = !_1192;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = abs(_1196);
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1216 = _1214 != 0;
    float _1218 = trunc(_1198);
    int _1220 = int(_1218);
    bool _1222 = !_1162;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = _1206 * _1212;
    int _1228 = abs(_1176);
    int _1230 = abs(_1210);
    bool _1232 = !_1216;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = abs(_1224);
    int _1238 = _1202 * _1230;
    int _1240 = _1238 + _1059;
    int _1242 = abs(_1234);
    int _1244 = _1220 * _1228;
    int _1246 = _1244 + _1226;
    float _1248 = _585 * _173;
    int _1250 = ~_1027;
    int _1252 = _1250 + 1;
    int _1254 = _1240 * _1236;
    int _1256 = _1254 + _1246;
    int _1258 = ~_1027;
    int _1260 = _1258 + 1;
    float _1262 = fma(_595, _171, _1248);
    float _1264 = float(uint(_1240));
    int _1266 = _1202 * _1242;
    int _1268 = _1266 + _1256;
    float _1270 = as_type<float>(_1061) * _1264;
    float _1272 = float(uint(_1268));
    float _1274 = trunc(_1270);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    float _1280 = as_type<float>(_1061) * _1272;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    bool _1288 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1290 = isnan(_1007);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    bool _1300 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1302 = isnan(_1007);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    int _1312 = _1252 * int(_1286);
    int _1314 = _1312 + _1268;
    float _1316 = float(uint(_1314));
    float _1318 = as_type<float>(_1061) * _1316;
    float _1320 = trunc(_1318);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    int _1326 = int(_1286) + int(_1324);
    int _1328 = _1260 * _1326;
    int _1330 = _1328 + _1268;
    bool _1332 = uint(_1330) >= uint(_1027);
    float _1334 = _1090 * 2.0;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = floor(_1334);
    int _1342 = ~_1326;
    int _1344 = _1342 + _1338;
    int _1346 = _1344 + 1;
    int _1348 = _1027 * _1346;
    int _1350 = _1348 + _1268;
    bool _1352 = !_1051;
    int _1354 = _1352 ? _1350 : (-1);
    int _1356 = _1354 & 3;
    bool _1358 = _1356 != 0;
    int _1360 = _1354 & 3;
    bool _1362 = _1360 != 0;
    bool _1364 = uint(_1356) > 1u;
    int _1366 = _1362 ? 0 : 1;
    bool _1368 = _1096 > 0.5;
    float _1370 = _1092 * 2.0;
    int _1372 = ~_1366;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = _1340 >= 0.0;
    bool _1380 = isnan(_1340);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan(0.0);
    bool _1386 = _1382 || _1384;
    float _1388 = floor(_1370);
    float _1390 = -_361;
    int _1392 = _1368 ? as_type<int>(_1390) : as_type<int>(_361);
    bool _1394 = _1092 > 0.5;
    int _1396 = _1376;
    float _1398 = _1029;
    if (!_1364)
    {
        int _1400 = ~_1366;
        int _1402 = _1400 + 1;
        _1396 = _1402;
    }
    int _1404 = _1396;
    bool _1406 = _1090 > 0.5;
    int _1408 = _1386 ? 0 : 1;
    float _1410 = -_341;
    int _1412 = _1406 ? as_type<int>(_1410) : as_type<int>(_341);
    bool _1414 = _1340 > 0.0;
    int _1416 = ~_1408;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = -_361;
    int _1424 = _1394 ? as_type<int>(_1422) : as_type<int>(_361);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1428 = _1426 != 0;
    bool _1430 = !_1428;
    float _1432 = _1430 ? _361 : as_type<float>(_1392);
    bool _1434 = _1094 > 0.5;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1440 = _1420;
    if (!_1414)
    {
        int _1442 = ~_1408;
        int _1444 = _1442 + 1;
        _1440 = _1444;
    }
    int _1446 = _1440;
    bool _1448 = _1388 >= 0.0;
    bool _1450 = isnan(_1388);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    int _1466 = _1456 ? 0 : 1;
    bool _1468 = _1388 > 0.0;
    float _1470 = _585 * _179;
    float _1472 = -_341;
    int _1474 = _1434 ? as_type<int>(_1472) : as_type<int>(_341);
    float _1476 = 1.0 / _1438;
    bool _1478 = !_1464;
    float _1480 = _1478 ? _341 : as_type<float>(_1412);
    float _1482 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1486 = _1484 != 0;
    float _1488 = fma(_595, _177, _1470);
    float _1490 = _1094 * 2.0;
    float _1492 = -_1037;
    float _1494 = fma(_1482, 2.0, _1492);
    bool _1496 = !_1486;
    float _1498 = _1496 ? _361 : as_type<float>(_1424);
    float _1500 = fma(_617, _181, _1488);
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1504 = _1502 != 0;
    float _1506 = fma(_617, _175, _1262);
    int _1508 = ~_1466;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    float _1514 = _1500 + _1015;
    int _1516 = _1512;
    if (!_1468)
    {
        int _1518 = ~_1466;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = _149 * _1460;
    float _1526 = fma(_617, _187, _1029);
    bool _1528 = !_1504;
    float _1530 = _1528 ? _341 : as_type<float>(_1474);
    float _1532 = _1092 + _1090;
    int _1534 = ~_1027;
    int _1536 = _1534 + 1;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1538;
    float _1542 = floor(_1490);
    float _1544 = _1532 + (-1.0);
    float _1546 = _1526 + _1023;
    float _1548 = -_1310;
    float _1550 = _1548 + 1.0;
    int _1552 = _1536 * int(_1278);
    int _1554 = _1552 + _1240;
    float _1556 = _1540 * _1476;
    float _1558 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1560 = _1298 * _1550;
    float _1562 = exp2(_1524);
    float _1564 = -_149;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1494);
    float _1568 = _1480 + 0.5;
    float _1570 = float(uint(_1554));
    float _1572 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1574 = _1572;
    if (!_1021)
    {
        _627 = _1092;
    }
    float _1576 = _627;
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1566);
    float _1580 = _1576;
    if (!_1021)
    {
        _1398 = _1094;
    }
    float _1582 = _1398;
    float _1584 = as_type<float>(_1061) * _1570;
    float _1586 = fma(_1572, -2.0, _1043);
    float _1588 = _1582;
    if (!_1021)
    {
        _1574 = _1094;
    }
    float _1590 = _1574;
    float _1592 = fma(_1556, _1033, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1594 = _1590;
    if (_1021)
    {
        _1580 = _1090;
    }
    float _1596 = _1580;
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1021)
    {
        _1594 = _1092;
    }
    float _1600 = _1594;
    float _1602 = _1506 + _1035;
    if (_1021)
    {
        _1588 = _1092;
    }
    float _1604 = _1588;
    float _1606 = -_1562;
    float _1608 = _1606 + 1.0;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1620 = _1618 != 0;
    float _1622 = _1092 + _1094;
    bool _1624 = _1542 >= 0.0;
    bool _1626 = isnan(_1542);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    float _1634 = trunc(_1584);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1642 = _1354 >> 31;
    float _1644 = _1622 + (-1.0);
    int _1646 = _1632 ? 0 : 1;
    float _1648 = _1592 * _1560;
    bool _1650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1658 = _1654 || _1656;
    float _1660 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1662 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1586);
    float _1664 = _1658 ? _1608 : 0.0;
    float _1666 = _1498 + (-0.5);
    bool _1668 = _1542 > 0.0;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1674 = _1642 & 3;
    float _1676 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1670);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1680 = _1354 + _1674;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1684 = 1.0 + _1682;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1688 = int(_1278) + int(_1638);
    float _1690 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1692 = _1680 >> 2;
    float _1694 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1678);
    float _1696 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1700 = -_1666;
    float _1702 = -_1662;
    float _1704 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1702);
    float _1706 = -_1298;
    float _1708 = _1706 + 1.0;
    int _1710 = _1692 << 4;
    int _1712 = _1710 + 368;
    float _1714 = 1.0 / _1684;
    float _1716 = fma(_1640, -2.0, _1698);
    float _1718 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1720 = -_1686;
    float _1722 = fma(_1696, 2.0, _1720);
    float _1724 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1648);
    uint _1726 = uint(int(uint(_1712) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    int _1742 = ~_1027;
    int _1744 = _1742 + 1;
    float _1746 = _1530 + 0.5;
    float _1748 = -_149;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1722);
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _1432 + (-0.5);
    int _1760 = _1744 * _1688;
    int _1762 = _1760 + _1240;
    int _1764 = _1756;
    int _1766 = as_type<int>(_1660);
    if (!_1668)
    {
        int _1768 = ~_1646;
        int _1770 = _1768 + 1;
        _1764 = _1770;
    }
    int _1772 = _1764;
    float _1774 = fma(_1718, _1746, _1750);
    bool _1776 = !_1616;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = _1712 + 8;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    uint _1784 = uint(int(uint(int(_1782)) >> uint(2)));
    int _1786 = int(_1782) & 3;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[int(_1784)][_1786];
    int _1790 = int(_1782) + 1;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    int _1794 = _1790 & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    bool _1798 = uint(_1762) >= uint(_1027);
    float _1800 = _1664 * _1714;
    float _1802 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1716);
    bool _1804 = !_1612;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1694);
    bool _1810 = !_1798;
    int _1812 = _1810 ? 0 : (-1);
    float _1814 = -_1690;
    float _1816 = -_1802;
    float _1818 = fma(_1814, _1758, _1816);
    bool _1820 = uint(_1356) >= 2u;
    float _1822 = -_1808;
    float _1824 = _1822 + 1.0;
    int _1826 = abs(_1778);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1602 + _1828;
    int _1832 = abs(_1806);
    float _1834 = -_1824;
    float _1836 = fma(_1530, _1834, _1774);
    int _1838 = _1820 ? 0 : 1;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1514 + _1840;
    bool _1844 = _1356 != 3;
    float _1846 = _1830 * _1830;
    float _1848 = float(_1832);
    float _1850 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    float _1852 = float(_1772);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1546 + _1854;
    int _1858 = ~_1838;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1866 = ~_1688;
    int _1868 = _1866 + _1812;
    int _1870 = _1868 + 1;
    float _1872 = _1848 * _1852;
    float _1874 = -_1850;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1864);
    int _1880 = _1862;
    float _1882 = _1836;
    if (_1844)
    {
        int _1884 = ~_1838;
        int _1886 = _1884 + 1;
        _1880 = _1886;
    }
    int _1888 = _1880;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1892 = !_1358;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1878);
    int _1898 = abs(_1404);
    float _1900 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1890);
    int _1902 = abs(_1894);
    int _1904 = _1027 * _1870;
    int _1906 = _1904 + _1240;
    bool _1908 = _1356 != 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1912 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1900);
    int _1914 = ~_1898;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1910);
    int _1922 = abs(_1888);
    float _1924 = -_1912;
    float _1926 = _1924 + 1.0;
    int _1928 = ~_1902;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1918 * as_type<int>(_1740);
    float _1936 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1920);
    float _1938 = fma(_1498, _1926, _1704);
    int _1940 = _1932 * as_type<int>(_1732);
    int _1942 = _1940 + _1934;
    int _1944 = ~_1922;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = -_1936;
    float _1952 = _1950 + 1.0;
    bool _1954 = !_1908;
    int _1956 = _1954 ? 0 : (-1);
    float _1958 = _1872 * (-2.0);
    int _1960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1962 = _1960 != 0;
    int _1964 = _1948 * as_type<int>(_1788);
    int _1966 = _1964 + _1942;
    int _1968 = abs(_1956);
    float _1970 = in.m_78.x;
    float _1972 = in.m_78.y;
    float _1974 = in.m_78.z;
    float _1976 = fma(_1842, _1842, _1846);
    bool _1978 = !_1962;
    int _1980 = _1978 ? 0 : 1;
    float _1982 = -_1952;
    float _1984 = fma(_1480, _1982, _1578);
    float _1986 = fma(_1856, _1856, _1976);
    int _1988 = abs(_1980);
    float _1990 = fma(_1432, _1876, _1818);
    int _1992 = ~_1968;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = rsqrt(_1986);
    float _2000 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1724);
    bool _2002 = _1896 >= 0.0;
    int _2004 = _1996 * as_type<int>(_1796);
    int _2006 = _2004 + _1966;
    int _2008 = ~_1988;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    out.m_80.x = _1984;
    out.m_80.y = _1938;
    out.m_80.z = _1836;
    out.m_80.w = _1990;
    float _2014 = float(_1446);
    float _2016 = _2000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2018 = float(_1826);
    int _2020 = _2006 * _2012;
    bool _2022 = !_1051;
    int _2024 = _2022 ? _1906 : (-1);
    float _2026 = fma(_1558, _1958, _1558);
    out.m_82.w = _2016;
    float _2028 = _2018 * _2014;
    float _2030 = fma(_1958, _1970, _1970);
    float _2032 = _1830 * _1998;
    int _2034 = _2024 * _1988;
    int _2036 = _2034 + _2020;
    float _2038 = _2028 * (-2.0);
    float _2040 = _1842 * _1998;
    int _2042 = as_type<int>(_2040);
    if (_2002)
    {
        _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2044 = _1882;
    float _2046 = -_2032;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1830);
    float _2050 = fma(_1660, _2038, _1660);
    float _2052 = _1090 + (-0.5);
    float _2054 = _2048 * _2048;
    if (_2002)
    {
        float _2056 = _2044 * 5.0;
        _1766 = as_type<int>(_2056);
    }
    int _2058 = _1766;
    float _2060 = float(_2036);
    float _2062 = -_2040;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1842);
    if (_2002)
    {
        out.m_59.x = 0.0;
    }
    float _2066 = fma(_2038, _1972, _1972);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2070 = fma(_2064, _2064, _2054);
    if (_2002)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7135 = as_type<float>(_2058);
        out.gl_Position.z = _7135;
    }
    bool _2072 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2074 = isnan(1.0);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2080 = _2076 || _2078;
    bool _2082 = !_1620;
    int _2084 = _2082 ? 0 : 1;
    out.m_84.x = _2060;
    if (_2002)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2086 = -_2032;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1602);
    float _2090 = _1856 * _1998;
    float _2092 = -_2040;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1514);
    bool _2096 = !_2080;
    float _2098 = _2096 ? _149 : _1800;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2102 = _2088 + _2100;
    float _2104 = -_2090;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2108 = -_2090;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2114 = _2094 + _2112;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2118 = fma(_2106, _2106, _2070);
    int _2120 = abs(_2084);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2124 = _2110 + _2122;
    float _2126 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2116);
    float _2128 = fma(_2098, _2026, _2068);
    float _2130 = _1092 + (-0.5);
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2126);
    float _2134 = float(_1522);
    float _2136 = _1094 + _1090;
    float _2138 = float(_2120);
    float _2140 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2066);
    bool _2142 = _2132 >= 0.0;
    float _2144 = _2128 * 0.15915493667125701904296875;
    float _2146 = _2138 * _2134;
    float _2148 = fma(_2098, _2050, _2140);
    float _2150 = _2136 + (-1.0);
    float _2152 = _1094 + (-0.5);
    float _2154 = _2146 * (-2.0);
    float _2156 = _2148 * 0.15915493667125701904296875;
    float _2158 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2160 = sqrt(_2118);
    float _2162 = fma(_2154, _1974, _1974);
    float _2164 = _2134;
    int _2166 = as_type<int>(_2152);
    int _2168 = as_type<int>(_2114);
    if (_2142)
    {
        _2164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2170 = _2164;
    float _2172 = fma(_2158, _2154, _2158);
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2162);
    if (_2142)
    {
        out.m_59.x = 0.0;
    }
    float _2176 = _2144 * 6.283185482025146484375;
    float _2178 = sin(_2176);
    if (_2142)
    {
        float _2180 = _2170 * 5.0;
        _2166 = as_type<int>(_2180);
    }
    int _2182 = _2166;
    float _2184 = fma(_2098, _2172, _2174);
    if (_2142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7331 = as_type<float>(_2182);
        out.gl_Position.z = _7331;
    }
    float _2186 = _2184 * 0.15915493667125701904296875;
    float _2188 = _2144 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    float _2192 = _2156 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    float _2196 = _2156 * 6.283185482025146484375;
    float _2198 = cos(_2196);
    if (_2142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2200 = _793 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2202 = _1998 * _2160;
    float _2204 = _2186 * 6.283185482025146484375;
    float _2206 = cos(_2204);
    float _2208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _361);
    float _2210 = _2190 * _2198;
    float _2212 = _2202 * _2200;
    float _2214 = _2190 * _2194;
    float _2216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _341);
    float _2218 = _2178 * _2194;
    float _2220 = _2208 * _2212;
    float _2222 = _2186 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2228 = _2178 * _2198;
    float _2230 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2232 = _2230 * 0.5;
    float _2234 = _2202 * _2226;
    float _2236 = _2190 * _2206;
    float _2238 = _2178 * _2206;
    float _2240 = _2216 * _2234;
    float _2242 = _2194 * _2206;
    float _2244 = _2236 * _2220;
    float _2246 = _2198 * _2206;
    float _2248 = _2238 * _2220;
    float _2250 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_2224, _2210, _2218);
    float _2254 = -_2228;
    float _2256 = fma(_2224, _2214, _2254);
    float _2258 = -_2220;
    float _2260 = _2224 * _2258;
    float _2262 = fma(_2224, _2218, _2210);
    float _2264 = fma(_2252, _2240, _2244);
    float _2266 = -_2214;
    float _2268 = fma(_2224, _2228, _2266);
    float _2270 = fma(_2246, _2240, _2260);
    float _2272 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = fma(_2256, _2232, _2264);
    float _2276 = fma(_2268, _2240, _2248);
    float _2278 = fma(_2242, _2232, _2270);
    float _2280 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2284 = fma(_2262, _2232, _2276);
    float _2286 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2288 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2282);
    float _2292 = _2252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2286);
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2290);
    float _2300 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2302 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    float _2304 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2296);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2308 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2280);
    float _2310 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2312 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2314 = _1546 + _2306;
    float _2316 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2318 = _1514 + _2310;
    float _2320 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2324 = _2314 + _2322;
    float _2326 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2330 = _2318 + _2328;
    float _2332 = _1602 + _2312;
    float _2334 = _2324 * _2324;
    float _2336 = -_2224;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2320);
    float _2340 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2300);
    float _2342 = -_2224;
    float _2344 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2346 = fma(_2330, _2330, _2334);
    float _2348 = -_2224;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2352 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2354 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2316);
    float _2356 = sqrt(_2346);
    float _2358 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2360 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2362 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = _2268;
    float _2366 = _2224;
    float _2368 = _2318;
    float _2370 = _2340;
    if (!_2362)
    {
        _2364 = _2314;
    }
    float _2372 = _2364;
    float _2374 = _2372;
    if (!_2362)
    {
        _2366 = _2332;
    }
    float _2376 = _2366;
    bool _2378 = !_2362;
    float _2380 = _2376;
    if (!_2378)
    {
        float _2382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2386 = _2356 + _2384;
        float _2388 = rsqrt(_2346);
        float _2390 = _2386 * _2382;
        float _2392 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2394 = _2390 * 0.15915493667125701904296875;
        float _2396 = _2394 * 6.283185482025146484375;
        float _2398 = sin(_2396);
        float _2400 = _2394 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        float _2404 = fma(_2398, _2392, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2406 = _2388 * _2404;
        float _2408 = _2402 + (-1.0);
        float _2410 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2412 = fma(_2330, _2406, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2414 = fma(_2324, _2406, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2416 = fma(_2332, _2402, _2410);
        _2380 = _2416;
        _2368 = _2412;
        _2374 = _2414;
    }
    float _2418 = _2380;
    float _2420 = _2368;
    float _2422 = _2374;
    float _2424 = _2256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2426 = -_1602;
    float _2428 = _2426 + _2418;
    float _2430 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2358);
    float _2432 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2360);
    float _2434 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2424);
    float _2436 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2438 = -_1514;
    float _2440 = _2438 + _2420;
    float _2442 = _2428 * _2428;
    float _2444 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2338);
    float _2446 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2344);
    float _2448 = -_1546;
    float _2450 = _2448 + _2422;
    float _2452 = fma(_2440, _2440, _2442);
    float _2454 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2350);
    float _2456 = _2436 * _2444;
    float _2458 = _2436 * _2446;
    float _2460 = fma(_2450, _2450, _2452);
    float _2462 = _2436 * _2454;
    float _2464 = _341 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2466 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    float _2468 = sqrt(_2460);
    float _2470 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2432);
    float _2472 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2434);
    float _2474 = fma(_2464, _2340, _2456);
    float _2476 = fma(_2464, _2352, _2458);
    float _2478 = fma(_2464, _2354, _2462);
    float _2480 = _2466 + _2474;
    float _2482 = _2470 + _2476;
    float _2484 = _2472 + _2478;
    out.m_86.x = _2480;
    out.m_86.y = _2482;
    out.m_86.z = _2484;
    bool _2486 = _2468 > 0.0;
    float _2488 = _2468;
    float _2490 = _2476;
    float _2492 = _2418;
    float _2494 = _2422;
    if (!_2486)
    {
        _2488 = _2420;
    }
    float _2496 = _2488;
    bool _2498 = !_2486;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2498)
    {
        bool _2504 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2506 = _2354;
        if (_2504)
        {
            float _2508 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2506 = _2508;
        }
        float _2510 = _2506;
        float _2512 = _2510;
        if (_2504)
        {
            float _2514 = _619 * _2510;
            _2370 = _2514;
        }
        float _2516 = _2370;
        float _2518 = _2516;
        if (_2504)
        {
            float _2520 = _621 * _2510;
            _2490 = _2520;
        }
        float _2522 = _2490;
        float _2524 = _2522;
        if (_2504)
        {
            float _2526 = _623 * _2510;
            _2512 = _2526;
        }
        float _2528 = _2512;
        float _2530 = _2528;
        if (!_2504)
        {
            float _2532 = _149 + 1.0;
            if (!_279)
            {
                float _2534 = _2532 * _2532;
                float _2536 = _2534 * 0.5;
                _151 = _2536;
            }
            float _2538 = _151;
            float _2540 = _2538;
            if (!_279)
            {
                float _2542 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2540 = _2542;
            }
            float _2544 = _2540;
            bool _2546 = !_279;
            float _2548 = _2544;
            if (!_2546)
            {
                float _2550 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2552 = log2(_2550);
                float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2556 = 1.0 + _2554;
                float _2558 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2560 = _2552 * _2532;
                float _2562 = 1.0 / _2556;
                float _2564 = _2558 * 0.693147182464599609375;
                float _2566 = exp2(_2560);
                float _2568 = 1.0 / _2564;
                float _2570 = _2566 + (-1.0);
                float _2572 = -_2570;
                float _2574 = fma(_2572, _2568, _2532);
                float _2576 = _2574 * _2562;
                float _2578 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2548 = _2578;
            }
            float _2580 = _2548;
            float _2582 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2584 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2586 = _2582 * _353;
            float _2588 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2590 = _2582 * _333;
            float _2592 = _2582 * _377;
            float _2594 = fma(_2584, _345, _2586);
            float _2596 = _2580;
            _2500 = _2584;
            if (!_279)
            {
                _2596 = _2532;
            }
            float _2598 = _2596;
            float _2600 = fma(_2584, _329, _2590);
            float _2602 = fma(_2588, _357, _2594);
            bool _2604 = !_279;
            float _2606 = _2598;
            if (!_2604)
            {
                float _2608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2610 = log2(_2608);
                float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2614 = 1.0 + _2612;
                float _2616 = 1.0 / _2614;
                float _2618 = _2610 * _2532;
                float _2620 = exp2(_2618);
                float _2622 = -_2620;
                float _2624 = _2622 + 1.0;
                float _2626 = _2624 * _2616;
                _2606 = _2626;
            }
            float _2628 = _2606;
            float _2630 = fma(_2588, _337, _2600);
            float _2632 = fma(_2584, _373, _2592);
            float _2634 = fma(_2628, _267, _2602);
            float _2636 = fma(_2628, _265, _2630);
            float _2638 = fma(_2588, _381, _2632);
            float _2640 = -_581;
            float _2642 = _2640 + _2634;
            float _2644 = -_587;
            float _2646 = _2644 + _2636;
            float _2648 = fma(_2628, _269, _2638);
            float _2650 = _2642 * _179;
            float _2652 = _2642 * _173;
            float _2654 = _2642 * _185;
            float _2656 = -_593;
            float _2658 = _2656 + _2648;
            float _2660 = fma(_2646, _177, _2650);
            float _2662 = fma(_2646, _171, _2652);
            float _2664 = fma(_2646, _183, _2654);
            float _2666 = fma(_2658, _181, _2660);
            float _2668 = fma(_2658, _175, _2662);
            float _2670 = fma(_2658, _187, _2664);
            _629 = _2668;
            _631 = _2666;
            _633 = _2670;
            _2518 = _2666;
            _2524 = _2668;
            _2530 = _2670;
            _635 = _2642;
        }
        float _2672 = _629;
        float _2674 = _631;
        float _2676 = _633;
        float _2678 = _2518;
        float _2680 = _2524;
        float _2682 = _2530;
        float _2684 = _2500;
        float _2686 = _635;
        float _2688 = _2672 * _2672;
        float _2690 = rsqrt(_2460);
        float _2692 = fma(_2674, _2674, _2688);
        float _2694 = fma(_2676, _2676, _2692);
        float _2696 = sqrt(_2694);
        float _2698 = _2440 * _2690;
        float _2700 = _2428 * _2690;
        float _2702 = _2450 * _2690;
        bool _2704 = _2696 > 0.0;
        float _2706 = _2684;
        _637 = _2686;
        if (!_2704)
        {
            _2706 = _2420;
        }
        float _2708 = _2706;
        bool _2710 = !_2704;
        _2502 = _2708;
        if (!_2710)
        {
            float _2712 = rsqrt(_2694);
            float _2714 = _2712 * _2672;
            float _2716 = _2712 * _2674;
            float _2718 = _2712 * _2676;
            float _2720 = _2700 * _2714;
            float _2722 = fma(_2698, _2716, _2720);
            float _2724 = fma(_2702, _2718, _2722);
            float _2726 = _2724 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2728 = fma(_2678, _2726, _2420);
            float _2730 = fma(_2680, _2726, _2418);
            float _2732 = fma(_2682, _2726, _2422);
            _2492 = _2730;
            _2502 = _2728;
            _2494 = _2732;
        }
    }
    float _2734 = _2492;
    float _2736 = _2502;
    float _2738 = _2494;
    float _2740 = _637;
    float _2742 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2744 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2746 = floor(_2742);
    float _2748 = floor(_2744);
    float _2750 = -_2746;
    float _2752 = _2742 + _2750;
    float _2754 = -_2748;
    float _2756 = _2744 + _2754;
    float2 _8270 = float2(_2752, _2756);
    float _2758 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8270, float2(0.0), isnan(_8270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8270, float2(0.0), isnan(_8270)), level(0.0)).x;
    float _2760 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2762 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2764 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2760);
    float _2766 = -_2032;
    float _2768 = fma(_2766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2734);
    float _2770 = _2088 + _2762;
    float _2772 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2764);
    float _2774 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2776 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2778 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2780 = _2772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2782 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2774);
    float _2784 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2776);
    float _2786 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2778);
    float _2788 = 1.0 / _2780;
    float _2790 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2782);
    float _2792 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2784);
    float _2794 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2786);
    float _2796 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2798 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2802 = _2796 + _2780;
    float _2804 = trunc(_2798);
    int _2806 = int(_2804);
    float _2808 = _2802 * _2788;
    float _2810 = _2808 * 0.5;
    float _2812 = trunc(_2800);
    int _2814 = int(_2812);
    float _2816 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2818 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2816);
    float _2820 = 1.0 / _2818;
    int _2822 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2824 = _2806 + _2822;
    int _2826 = _2824 + 1;
    int _2828 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2830 = _2814 + _2828;
    int _2832 = _2830 + 1;
    float _2834 = -_2040;
    float _2836 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2736);
    int _2838 = _2826 | _2832;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2842 = _2820 * _2840;
    bool _2844 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2846 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2848 = !_2844;
    int _2850 = _2848 ? 0 : 1;
    int _2852 = 2;
    float _2854 = _2768;
    float _2856 = _2836;
    int _2858 = as_type<int>(_2738);
    float _2860 = as_type<float>(_2832);
    float _2862 = _2798;
    float _2864 = _2736;
    if (!_2844)
    {
        _2852 = 1;
    }
    int _2866 = _2852;
    int _2868 = _2866;
    if (!_2846)
    {
        _2868 = _2850;
    }
    int _2870 = _2868;
    bool _2872 = _2826 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2874 = _2870 << 6;
    bool _2876 = _2838 < 0;
    bool _2878 = _2876 || _2872;
    float _2880 = -_2090;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2738);
    int _2884 = _2874 + 48;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    uint _2888 = uint(int(uint(int(_2886)) >> uint(2)));
    int _2890 = int(_2886) & 3;
    float _2892 = (*spvDescriptorSet0.vp_c15)._m0[int(_2888)][_2890];
    int _2894 = int(_2886) + 1;
    uint _2896 = uint(int(uint(_2894) >> uint(2)));
    int _2898 = _2894 & 3;
    float _2900 = (*spvDescriptorSet0.vp_c15)._m0[int(_2896)][_2898];
    bool _2902 = _2832 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2904 = _2902 || _2878;
    bool _2906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2908 = isnan(0.5);
    bool _2910 = _2906 || _2908;
    bool _2912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2914 = _2910 || _2912;
    int _2916 = _2874 + 56;
    uint _2918 = uint(int(uint(_2916) >> uint(2)));
    uint _2920 = uint(int(uint(int(_2918)) >> uint(2)));
    int _2922 = int(_2918) & 3;
    float _2924 = (*spvDescriptorSet0.vp_c15)._m0[int(_2920)][_2922];
    int _2926 = int(_2918) + 1;
    uint _2928 = uint(int(uint(_2926) >> uint(2)));
    int _2930 = _2926 & 3;
    float _2932 = (*spvDescriptorSet0.vp_c15)._m0[int(_2928)][_2930];
    float _2934 = _2882;
    float _2936 = as_type<float>(_2870);
    if (!_2904)
    {
        int _2938 = _2832 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2940 = _2938 + _2826;
        _2042 = _2940;
    }
    int _2942 = _2042;
    int _2944 = _2874 + 64;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c15)._m0[int(_2956)][_2958];
    int _2962 = _2874 + 72;
    uint _2964 = uint(int(uint(_2962) >> uint(2)));
    uint _2966 = uint(int(uint(int(_2964)) >> uint(2)));
    int _2968 = int(_2964) & 3;
    float _2970 = (*spvDescriptorSet0.vp_c15)._m0[int(_2966)][_2968];
    int _2972 = int(_2964) + 1;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    int _2976 = _2972 & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = _2874 + 96;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    uint _2984 = uint(int(uint(int(_2982)) >> uint(2)));
    int _2986 = int(_2982) & 3;
    float _2988 = (*spvDescriptorSet0.vp_c15)._m0[int(_2984)][_2986];
    int _2990 = int(_2982) + 1;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    int _2994 = _2990 & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = _2874 + 104;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    uint _3002 = uint(int(uint(int(_3000)) >> uint(2)));
    int _3004 = int(_3000) & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    int _3008 = int(_3000) + 1;
    uint _3010 = uint(int(uint(_3008) >> uint(2)));
    int _3012 = _3008 & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = as_type<int>(_2996);
    float _3018 = as_type<float>(_2942);
    if (!_2914)
    {
        float _3020 = _2102 * _2102;
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3024 = -_1602;
        float _3026 = _3024 + _2734;
        float _3028 = -_1514;
        float _3030 = _3028 + _2736;
        float _3032 = fma(_2114, _2114, _3020);
        float _3034 = -_1546;
        float _3036 = _3034 + _2738;
        float _3038 = fma(_2124, _2124, _3032);
        float _3040 = 1.0 / _2202;
        float _3042 = sqrt(_3038);
        float _3044 = precise::min(_3042, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3046 = _3044 * _3022;
        float _3048 = _3046 * _3040;
        float _3050 = fma(_3026, _3048, _2088);
        float _3052 = fma(_3030, _3048, _2094);
        float _3054 = fma(_3036, _3048, _2110);
        _2854 = _3050;
        _2168 = as_type<int>(_3042);
        _2856 = _3052;
        _2934 = _3054;
    }
    float _3056 = _2854;
    int _3058 = _2168;
    float _3060 = _2856;
    float _3062 = _2934;
    float _3064 = _2770 * _2996;
    int _3066 = _3058;
    int _3068 = as_type<int>(_3064);
    if (!_2904)
    {
        int _3070 = _2942 << 2;
        _3066 = _3070;
    }
    int _3072 = _3066;
    float _3074 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2904)
    {
        uint _3076 = uint(int(uint(_2942) >> uint(2)));
        _3016 = int(_3076);
    }
    int _3078 = _3016;
    float _3080 = fma(_2094, _2988, _3064);
    if (!_2904)
    {
        int _3082 = 12 & _3072;
        _3068 = _3082;
    }
    int _3084 = _3068;
    float _3086 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3074);
    float _3088 = _2770 * _2900;
    float _3090 = fma(_2110, _3006, _3080);
    if (!_2904)
    {
        int _3092 = _3078 << 4;
        int _3094 = _3092 + _3084;
        _2858 = _3094;
    }
    int _3096 = _2858;
    float _3098 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3086);
    int _3100 = _2874 + 80;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    uint _3104 = uint(int(uint(int(_3102)) >> uint(2)));
    int _3106 = int(_3102) & 3;
    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[int(_3104)][_3106];
    int _3110 = int(_3102) + 1;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    int _3114 = _3110 & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    float _3118 = _3090 + _3014;
    float _3120 = fma(_2094, _2892, _3088);
    float _3122 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3124 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3126 = _2770 * _2960;
    float _3128 = fma(_2110, _2924, _3120);
    float _3130 = 1.0 / _3118;
    float _3132 = _2740;
    if (!_2904)
    {
        int _3134 = _3096 + 400;
        uint _3136 = uint(int(uint(_3134) >> uint(2)));
        uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
        int _3140 = int(_3136) & 3;
        float _3142 = (*spvDescriptorSet0.vp_c15)._m0[int(_3138)][_3140];
        _3132 = _3142;
    }
    float _3144 = _3132;
    float _3146 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3148 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3150 = _3128 + _2932;
    float _3152 = -_3146;
    float _3154 = fma(_3152, _3124, 1.0);
    float _3156 = fma(_2094, _2952, _3126);
    float _3158 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3148);
    int _3160 = _2874 + 88;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    float _3178 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3180 = fma(_2110, _2970, _3156);
    float _3182 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3158);
    float _3184 = log2(_3154);
    float _3186 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3178);
    float _3188 = _3056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3190 = _3150 * _3130;
    float _3192 = _3180 + _2978;
    float _3194 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3186);
    float _3196 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3198 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3188);
    bool _3200 = _3190 >= 0.0;
    float _3202 = _3192 * _3130;
    float _3204 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3206 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3208 = _3190 <= 1.0;
    bool _3210 = _3208 && _3200;
    float _3212 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3198);
    float _3214 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3216 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3206);
    bool _3218 = _3202 >= 0.0;
    bool _3220 = _3218 && _3210;
    float _3222 = _3212 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3224 = _3088;
    float _3226 = _3212;
    if (!_2904)
    {
        float _3228 = floor(_2798);
        _3224 = _3228;
    }
    float _3230 = _3224;
    float _3232 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3216);
    bool _3234 = _3202 <= 1.0;
    bool _3236 = _3234 && _3220;
    float _3238 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3240 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3214);
    float _3242 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3232);
    float _3244 = _3184 * 0.693147182464599609375;
    float _3246 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3238);
    float _3248 = _3154;
    if (!_2904)
    {
        float _3250 = floor(_2800);
        _3248 = _3250;
    }
    float _3252 = _3248;
    float _3254 = _2770 * _3116;
    float _3256 = _3244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3258 = fma(_2094, _3108, _3254);
    if (_3236)
    {
        float _3260 = float(_2870);
        _3226 = _3260;
    }
    float _3262 = _3226;
    float _3264 = 1.0 / _3242;
    if (!_2904)
    {
        float _3266 = -_3230;
        float _3268 = _2798 + _3266;
        _2860 = _3268;
    }
    float _3270 = _2860;
    float _3272 = _3144;
    if (!_2904)
    {
        float _3274 = rint(_3144);
        float _3276 = precise::max(_3274, 0.0);
        uint _3278 = uint(_3276);
        uint _3280 = clamp(_3278, 0u, 65535u);
        _3272 = as_type<float>(_3280);
    }
    float _3282 = _3272;
    float _3284 = _3252;
    if (!_2904)
    {
        float _3286 = -_3252;
        float _3288 = _2800 + _3286;
        _3284 = _3288;
    }
    float _3290 = _3284;
    float _3292 = fma(_2110, _3168, _3258);
    float _3294 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3246);
    float _3296 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3240);
    float _3298 = _3292 + _3176;
    float _3300 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3294);
    float _3302 = _3262;
    if (_3236)
    {
        float _3304 = rint(_3262);
        float _3306 = precise::max(_3304, 0.0);
        uint _3308 = uint(_3306);
        uint _3310 = clamp(_3308, 0u, 65535u);
        _3302 = as_type<float>(_3310);
    }
    float _3312 = _3302;
    float _3314 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3296);
    float _3316 = _3298 * _3130;
    float _3318 = _3300 * _3264;
    float _3320 = _3314 * _3264;
    float _3322 = fma(_3318, 0.5, 0.5);
    float _3324 = fma(_3320, -0.5, 0.5);
    float _3326 = _3282;
    float _3328 = _3320;
    float _3330 = _3314;
    if (!_2904)
    {
        float3 _9246 = float3(_3270, _3290, float(as_type<int>(_3282)));
        float3 _9250 = select(_9246, float3(0.0), isnan(_9246));
        float _3332 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9250.xy, uint(rint(_9250.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9250.xy, uint(rint(_9250.z)), level(0.0)).x;
        _3326 = _3332;
    }
    float _3334 = _3326;
    float _3336 = _3312;
    if (_3236)
    {
        float3 _9265 = float3(_3190, _3202, float(as_type<int>(_3312)));
        float3 _9267 = select(_9265, float3(0.0), isnan(_9265));
        float _3338 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9267.xy, uint(rint(_9267.z)), _3316, level(0.0));
        _3336 = _3338;
    }
    float _3340 = _3336;
    float3 _9277 = float3(_3322, _3324, _3256);
    float _3342 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9277, float3(0.0), isnan(_9277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9277, float3(0.0), isnan(_9277)), level(0.0)).x;
    float3 _9286 = float3(_3322, _3324, _3256);
    float4 _3345 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9286, float3(0.0), isnan(_9286)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9286, float3(0.0), isnan(_9286)), level(0.0)).xyzw;
    float _3347 = _3345.x;
    float _3349 = _3345.y;
    float _3351 = _3345.z;
    float _3353 = _3345.w;
    bool _3355 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3357 = isnan(0.5);
    bool _3359 = _3355 || _3357;
    bool _3361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3363 = _3359 || _3361;
    if (_2904)
    {
        _639 = 1.0;
    }
    float _3365 = _639;
    float _3367 = _3365;
    if (_3363)
    {
        _2862 = 1.0;
    }
    float _3369 = _2862;
    float _3371 = _3369;
    if (_3363)
    {
        _2936 = 1.0;
    }
    float _3373 = _2936;
    float _3375 = _3373;
    if (!_3363)
    {
        float _3377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3379 = _3377 * 0.15915493667125701904296875;
        float _3381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3383 = _3379 * 6.283185482025146484375;
        float _3385 = cos(_3383);
        float _3387 = _3381 * 0.15915493667125701904296875;
        float _3389 = _3379 * 6.283185482025146484375;
        float _3391 = sin(_3389);
        float _3393 = 1.0 / _3385;
        float _3395 = _3387 * 6.283185482025146484375;
        float _3397 = cos(_3395);
        float _3399 = _3391 * _3393;
        float _3401 = _3387 * 6.283185482025146484375;
        float _3403 = sin(_3401);
        float _3405 = _3397 * _3399;
        float _3407 = 1.0 / _3405;
        float _3409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3409;
        float _3413 = 1.0 / _3411;
        float _3415 = _3403 * _3407;
        float _3417 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3419 = fma(_2842, _3415, _3417);
        float _3421 = _3419 * _3413;
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        _3328 = _3387;
        _3375 = _3423;
    }
    float _3425 = _3328;
    float _3427 = _3375;
    float _3429 = _3425;
    if (!_3363)
    {
        float _3431 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3433 = _3431 * 0.15915493667125701904296875;
        float _3435 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3437 = _3433 * 6.283185482025146484375;
        float _3439 = cos(_3437);
        float _3441 = _3435 * 0.15915493667125701904296875;
        float _3443 = _3433 * 6.283185482025146484375;
        float _3445 = sin(_3443);
        float _3447 = 1.0 / _3439;
        float _3449 = _3441 * 6.283185482025146484375;
        float _3451 = cos(_3449);
        float _3453 = _3445 * _3447;
        float _3455 = _3441 * 6.283185482025146484375;
        float _3457 = sin(_3455);
        float _3459 = _3451 * _3453;
        float _3461 = 1.0 / _3459;
        float _3463 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3465 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3463;
        float _3467 = 1.0 / _3465;
        float _3469 = _3457 * _3461;
        float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3473 = fma(_2842, _3469, _3471);
        float _3475 = _3473 * _3467;
        float _3477 = precise::clamp(_3475, 0.0, 1.0);
        float _3479 = -_3477;
        float _3481 = _3479 + 1.0;
        _3429 = _3459;
        _3371 = _3481;
    }
    float _3483 = _3429;
    float _3485 = _3371;
    float _3487 = _3483;
    if (!_2904)
    {
        int _3489 = _2942 << 4;
        int _3491 = _3489 + 2048;
        uint _3493 = uint(int(uint(_3491) >> uint(2)));
        uint _3495 = uint(int(uint(int(_3493)) >> uint(2)));
        int _3497 = int(_3493) & 3;
        float _3499 = (*spvDescriptorSet0.vp_c15)._m0[int(_3495)][_3497];
        int _3501 = int(_3493) + 1;
        uint _3503 = uint(int(uint(_3501) >> uint(2)));
        int _3505 = _3501 & 3;
        float _3507 = (*spvDescriptorSet0.vp_c15)._m0[int(_3503)][_3505];
        int _3509 = _3491 + 8;
        uint _3511 = uint(int(uint(_3509) >> uint(2)));
        uint _3513 = uint(int(uint(int(_3511)) >> uint(2)));
        int _3515 = int(_3511) & 3;
        float _3517 = (*spvDescriptorSet0.vp_c15)._m0[int(_3513)][_3515];
        int _3519 = int(_3511) + 1;
        uint _3521 = uint(int(uint(_3519) >> uint(2)));
        int _3523 = _3519 & 3;
        float _3525 = (*spvDescriptorSet0.vp_c15)._m0[int(_3521)][_3523];
        float _3527 = _2770 * _3507;
        float _3529 = fma(_2094, _3499, _3527);
        float _3531 = fma(_2110, _3517, _3529);
        float _3533 = _3531 + _3525;
        float _3535 = precise::clamp(_3533, 0.0, 1.0);
        float _3537 = -_3535;
        float _3539 = _3537 + _3334;
        float _3541 = fma(_3539, 500.0, 1.5);
        float _3543 = exp2(_3541);
        float _3545 = 0.0 + _3543;
        float _3547 = precise::clamp(_3545, 0.0, 1.0);
        _3018 = as_type<float>(_3491);
        _3487 = _3517;
        _3367 = _3547;
    }
    float _3549 = _3018;
    float _3551 = _3487;
    float _3553 = _3367;
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3557 = _3056 + _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3561 = _3060 + _3559;
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3565 = _3062 + _3563;
    float _3567 = _3557 * _3557;
    float _3569 = fma(_3561, _3561, _3567);
    float _3571 = fma(_3565, _3565, _3569);
    float _3573 = rsqrt(_3571);
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3577 = _3561 * _3575;
    float _3579 = _3565 * _3575;
    float _3581 = _3577 * _3577;
    float _3583 = _3579 * _3579;
    float _3585 = _3581 + _3583;
    float _3587 = sqrt(_3585);
    bool _3589 = _3587 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3593 = _3587 + _3591;
    float _3595 = _3573;
    float _3597 = _3593;
    float _3599 = _3549;
    float _3601 = _3557;
    float _3603 = _3575;
    if (_3589)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3595 = _3605;
    }
    float _3607 = _3595;
    float _3609 = _3607;
    if (_3589)
    {
        float _3611 = _3593 * _3607;
        _3597 = _3611;
    }
    float _3613 = _3597;
    if (_3589)
    {
        float _3615 = rsqrt(_3585);
        _3609 = _3615;
    }
    float _3617 = _3609;
    float _3619 = _3617;
    if (_3589)
    {
        float _3621 = _3613 * 0.15915493667125701904296875;
        _3599 = _3621;
    }
    float _3623 = _3599;
    float _3625 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3627 = _3565;
    if (_3589)
    {
        float _3629 = _3623 * 6.283185482025146484375;
        float _3631 = sin(_3629);
        _3627 = _3631;
    }
    float _3633 = _3627;
    float _3635 = precise::max(0.0, _3625);
    float _3637 = _3551;
    float _3639 = _3635;
    if (_3589)
    {
        float _3641 = _3623 * 6.283185482025146484375;
        float _3643 = cos(_3641);
        _3637 = _3643;
    }
    float _3645 = _3637;
    float _3647 = -_3575;
    float _3649 = -_3635;
    float _3651 = fma(_3557, _3647, _3649);
    if (_3589)
    {
        float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3601 = _3653;
    }
    float _3655 = _3601;
    float _3657 = _3633;
    float _3659 = _3655;
    if (_3589)
    {
        float _3661 = fma(_3633, _3655, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3657 = _3661;
    }
    float _3663 = _3657;
    float _3665 = _3663;
    if (!_3589)
    {
        _3659 = _3579;
    }
    float _3667 = _3659;
    float _3669 = _3667;
    if (_3589)
    {
        float _3671 = _3617 * _3663;
        _2864 = _3671;
    }
    float _3673 = _2864;
    if (!_3589)
    {
        _3619 = _3577;
    }
    float _3675 = _3619;
    float _3677 = _3675;
    float _3679 = _3645;
    if (_3589)
    {
        float _3681 = _3645 + (-1.0);
        _3639 = _3681;
    }
    float _3683 = _3639;
    if (_3589)
    {
        float _3685 = _3577 * _3673;
        _3677 = _3685;
    }
    float _3687 = _3677;
    if (!_3589)
    {
        _3665 = _3651;
    }
    float _3689 = _3665;
    float _3691 = _3689;
    if (_3589)
    {
        float _3693 = _3579 * _3673;
        _3669 = _3693;
    }
    float _3695 = _3669;
    if (_3589)
    {
        float _3697 = _3683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3603 = _3697;
    }
    float _3699 = _3603;
    float _3701 = sqrt(_3571);
    float _3703 = _3699;
    if (_3589)
    {
        float _3705 = fma(_3651, _3645, _3699);
        _3691 = _3705;
    }
    float _3707 = _3691;
    if (!_3589)
    {
        _3703 = _3581;
    }
    float _3709 = _3703;
    float _3711 = _3709;
    if (_3589)
    {
        float _3713 = _3687 * _3687;
        _3711 = _3713;
    }
    float _3715 = _3711;
    if (!_3589)
    {
        _3679 = _3583;
    }
    float _3717 = _3679;
    float _3719 = _3717;
    if (_3589)
    {
        float _3721 = _3695 * _3695;
        _3719 = _3721;
    }
    float _3723 = _3719;
    float _3725 = fma(_3707, _3707, _3715);
    float _3727 = _3725 + _3723;
    float _3729 = rsqrt(_3727);
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3733 = fma(_3701, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3731);
    float _3735 = precise::clamp(_3733, 0.0, 1.0);
    float _3737 = -_3735;
    float _3739 = _3737 + 1.0;
    float _3741 = abs(_3739);
    float _3743 = log2(_3741);
    float _3745 = _3729 * _3687;
    float _3747 = _3729 * _3707;
    float _3749 = _3729 * _3695;
    float _3751 = _3745 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3753 = -_3751;
    float _3755 = fma(_3747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3753);
    float _3757 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3759 = -_3749;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3755);
    float _3763 = _3747 + 1.0;
    float _3765 = exp2(_3757);
    float _3767 = fma(_3761, -0.5, 0.5);
    float _3769 = fma(_3761, 0.5, 0.5);
    float _3771 = fma(_3769, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3773 = sqrt(_3767);
    float _3775 = fma(_3769, _3771, -0.212114393711090087890625);
    float _3777 = fma(_3769, _3775, 1.570728778839111328125);
    float _3779 = -_3747;
    float _3781 = fma(_3765, _3763, _3779);
    float _3783 = fma(_3781, 0.5, 0.5);
    float _3785 = _3773 * 0.636619746685028076171875;
    float _3787 = -_3777;
    float _3789 = fma(_3785, _3787, 1.0);
    float2 _9937 = float2(_3789, _3783);
    float3 _3793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9937, float2(0.0), isnan(_9937)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9937, float2(0.0), isnan(_9937)), level(0.0)).xyz;
    float _3795 = _3793.x;
    float _3797 = _3793.y;
    float _3799 = _3793.z;
    float _3801 = abs(_2842);
    float _3803 = log2(_3801);
    float _3805 = _3196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3807 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = -_2758;
    float _3811 = _3809 + 1.0;
    float _3813 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3805);
    float _3815 = exp2(_3807);
    float _3817 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3813);
    float _3819 = _3242 * 0.5;
    bool _3821 = _2842 <= 8000.0;
    bool _3823 = isnan(_2842);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(8000.0);
    bool _3829 = _3825 || _3827;
    float _3831 = float(_3829);
    float _3833 = fma(_3222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3817);
    float _3835 = fma(_3314, -0.5, _3819);
    float _3837 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3839 = _3833 + _3242;
    float _3841 = _3300 + _3242;
    out.gl_Position.x = _3300;
    out.gl_Position.y = _3314;
    out.gl_Position.z = _3833;
    out.gl_Position.w = _3242;
    float _3843 = _3839 * 0.5;
    float _3845 = exp2(_3837);
    float _3847 = _3841 * 0.5;
    out.m_88.x = _3847;
    out.m_88.y = _3835;
    out.m_88.z = _3843;
    out.m_88.w = _3242;
    float _3849 = -_3815;
    float _3851 = _3849 + 1.0;
    if (!_3236)
    {
        _3330 = 1.0;
    }
    float _3853 = _3330;
    float _3855 = _3853;
    if (_3236)
    {
        bool _3857 = _3340 >= _3316;
        bool _3859 = isnan(_3340);
        bool _3861 = _3857 || _3859;
        bool _3863 = isnan(_3316);
        bool _3865 = _3861 || _3863;
        float _3867 = float(_3865);
        _3855 = _3867;
    }
    float _3869 = _3855;
    float _3871 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3873 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3875 = precise::clamp(_3873, 0.0, 1.0);
    bool _3877 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3879 = isnan(_3701);
    bool _3881 = _3877 || _3879;
    bool _3883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3885 = _3881 || _3883;
    float _3887 = _3869 * _3553;
    float _3889 = fma(_3875, -2.0, 3.0);
    float _3891 = _3875 * _3875;
    float _3893 = _3871 * _3342;
    float _3895 = -_3871;
    float _3897 = _3895 + 1.0;
    float _3899 = _3891 * _3889;
    float _3901 = _3353 * _3893;
    float _3903 = _3353 * _3897;
    float _3905 = _3427 * _3485;
    float _3907 = -_3899;
    float _3909 = _3907 + 1.0;
    float _3911 = _3905 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3913 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3899);
    float _3915 = _3905;
    float _3917 = _3901;
    if (!_3885)
    {
        _3915 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3919 = _3915;
    float _3921 = _3831 * _3913;
    float _3923 = _3921 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _3811 * _3923;
    float _3927 = precise::clamp(_3925, 0.0, 1.0);
    float _3929 = -_3927;
    float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3933 = -_3887;
    float _3935 = fma(_3933, _3931, 1.0);
    float _3937 = precise::clamp(_3935, 0.0, 1.0);
    float _3939 = _3937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3941 = _3937;
    float _3943 = _3919;
    float _3945 = _3919;
    if (!_3885)
    {
        _3941 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3947 = _3941;
    out.m_90.x = _3939;
    float _3949 = _3799 * _3893;
    float _3951 = fma(_3795, _3901, _3347);
    float _3953 = fma(_3797, _3901, _3349);
    float _3955 = _3947;
    float _3957 = _3947;
    if (!_3885)
    {
        _3917 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3959 = _3917;
    float _3961 = fma(_3353, _3949, _3351);
    out.m_92.x = _3951;
    out.m_92.y = _3953;
    out.m_92.z = _3961;
    out.m_92.w = _3903;
    bool _3963 = !_3885;
    float _3965 = _3959;
    float _3967 = _3959;
    if (!_3963)
    {
        bool _3969 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3971 = isnan(_3701);
        bool _3973 = _3969 || _3971;
        bool _3975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3977 = _3973 || _3975;
        if (!_3977)
        {
            float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3981 = _3701 + _3979;
            float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3985 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3983;
            float _3987 = 1.0 / _3985;
            float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3995 = _3993 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3997 = _3981 * _3987;
            float _3999 = precise::clamp(_3997, 0.0, 1.0);
            float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4003 = _4001 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4005 = fma(_3999, _3995, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4007 = fma(_3999, _4003, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4009 = fma(_3999, _3991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3957 = _4009;
            _3967 = _4007;
            _3945 = _4005;
            _4011 = true;
        }
        else
        {
            bool _4013 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4015 = isnan(_3701);
            bool _4017 = _4013 || _4015;
            bool _4019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4021 = _4017 || _4019;
            if (!_4021)
            {
                _3965 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4023 = _3965;
            _3967 = _4023;
            if (!_4021)
            {
                _3955 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4025 = _3955;
            _3957 = _4025;
            if (!_4021)
            {
                _3943 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4027 = _3943;
            bool _4029 = !_4021;
            _3945 = _4027;
            if (!_4029)
            {
                bool _4031 = _3701 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4033 = isnan(_3701);
                bool _4035 = _4031 || _4033;
                bool _4037 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4039 = _4035 || _4037;
                if (!_4039)
                {
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4043 = _3701 + _4041;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4047 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4045;
                    float _4049 = 1.0 / _4047;
                    float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4059 = _4043 * _4049;
                    float _4061 = precise::clamp(_4059, 0.0, 1.0);
                    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4067 = fma(_4061, _4057, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4069 = fma(_4061, _4065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4071 = fma(_4061, _4053, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3957 = _4071;
                    _3967 = _4069;
                    _3945 = _4067;
                    _4011 = true;
                }
                else
                {
                    _3957 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3967 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3945 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4011 = false;
    float _4073 = _3957;
    float _4075 = _3967;
    float _4077 = _3945;
    float _4079 = _3911 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_94.x = 0.0;
    float _4081 = _4073 * 0.586610972881317138671875;
    bool _4083 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _4079;
    float _4085 = fma(_4075, 0.298911988735198974609375, _4081);
    bool _4087 = _3427 > 0.0;
    bool _4089 = isnan(_3427);
    bool _4091 = _4087 || _4089;
    bool _4093 = isnan(0.0);
    bool _4095 = _4091 || _4093;
    float _4097 = fma(_4077, 0.114477999508380889892578125, _4085);
    bool _4099 = _3485 <= 0.0;
    bool _4101 = !_4095;
    bool _4103 = _4099 || _4101;
    float _4105 = -_4097;
    float _4107 = _4105 + _4075;
    float _4109 = -_4097;
    float _4111 = _4109 + _4073;
    float _4113 = -_4097;
    float _4115 = _4113 + _4077;
    float _4117 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    float _4119 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    float _4121 = fma(_4115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4097);
    bool _4123 = !_4083;
    if (!_4123)
    {
        float _4125 = -_3056;
        float _4127 = _4125 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4129 = -_3060;
        float _4131 = _4129 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4133 = -_3062;
        float _4135 = _4133 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4137 = _4127 * _4127;
        float _4139 = fma(_4131, _4131, _4137);
        float _4141 = fma(_4135, _4135, _4139);
        float _4143 = sqrt(_4141);
        float _4145 = rsqrt(_4141);
        float _4147 = -_4143;
        float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4151 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4153 = precise::clamp(_4151, 0.0, 1.0);
        float _4155 = _4131 * _4145;
        float _4157 = _4127 * _4145;
        float _4159 = abs(_4153);
        float _4161 = log2(_4159);
        float _4163 = _4135 * _4145;
        float _4165 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4167 = _2482 * _4157;
        float _4169 = -_4157;
        float _4171 = -_4165;
        float _4173 = fma(_4169, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4171);
        float _4175 = fma(_2480, _4155, _4167);
        float _4177 = -_4163;
        float _4179 = fma(_4177, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4173);
        float _4181 = fma(_2484, _4163, _4175);
        float _4183 = precise::clamp(_4181, 0.0, 1.0);
        float _4185 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4187 = _4179 + _4185;
        float _4189 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4191 = _4187 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4193 = precise::clamp(_4191, 0.0, 1.0);
        float _4195 = exp2(_4189);
        float _4197 = _4195 * _4193;
        float _4199 = _4183 * _4197;
        float _4201 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4203 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4205 = _4199 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4201;
        out.m_94.y = _4203;
        out.m_94.z = _4205;
    }
    out.m_96.x = _4117;
    out.m_96.y = _4119;
    out.m_96.z = _4121;
    if (!_4103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4207 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4207;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

