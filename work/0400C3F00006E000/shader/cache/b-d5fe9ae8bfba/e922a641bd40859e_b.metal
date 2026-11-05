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
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2501 = false;
    bool _1371 = false;
    bool _461 = false;
    bool _313 = false;
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
        float _2786 = as_type<float>(_131);
        out.gl_Position.z = _2786;
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
        out.m_61.x = 0.0;
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
        float _2856 = as_type<float>(_169);
        out.gl_Position.z = _2856;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_65.w;
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _173;
    if (!_183)
    {
        float _201 = _173 * _173;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    bool _213 = !_183;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _173 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _173);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_183;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _173 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _199 = _269;
    }
    float _271 = _199;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = fma(_271, _185, _275);
    float _283 = fma(_271, _187, _277);
    float _285 = fma(_271, _189, _279);
    float _287 = fma(_281, _171, _191);
    float _289 = fma(_283, _171, _193);
    float _291 = fma(_285, _171, _195);
    bool _293 = !_273;
    float _311;
    if (!_293)
    {
        float _295 = in.m_67.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    bool _339 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _341 = isnan(_321);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -_337;
    float _361 = _359 + 1.0;
    float _363 = 1.0 / _357;
    bool _365 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_321);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _349 * _361;
    float _379 = -_349;
    float _381 = _379 + 1.0;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = _375 * _381;
    float _387 = 1.0 / _353;
    float _389 = -_375;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _325 * _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _321 + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = _401 * _363;
    float _413 = fma(_405, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_409, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = fma(_395, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _423 = _413 * _385;
    float _425 = _415 * _385;
    float _427 = fma(_419, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _431 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _433 = fma(_427, _377, _429);
    float _435 = fma(_421, _377, _431);
    float _437 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[145].x, _433);
    float _439 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[145].y, _435);
    bool _441 = !_383;
    float _459;
    if (!_441)
    {
        float _443 = in.m_67.x;
        float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _447 = _443 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _451 = _449 * _445;
        float _453 = floor(_451);
        float _455 = -_453;
        float _457 = _451 + _455;
        _459 = _457;
        _461 = true;
    }
    else
    {
        float _463 = float(_115);
        float _465 = 1.0 / _463;
        float _467 = _149 * _465;
        _459 = _467;
    }
    _461 = false;
    float _469 = _459;
    float _471 = in.m_67.x;
    float _473 = in.m_67.y;
    float _475 = in.m_67.z;
    float _477 = in.m_67.w;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = as_type<float>(int(gl_VertexIndex));
    float _485 = _481 * _149;
    float _487 = exp2(_485);
    float _489 = _475 * 2.0;
    float _491 = _471 * 2.0;
    float _493 = _473 * 2.0;
    float _495 = floor(_489);
    float _497 = floor(_491);
    float _499 = -_487;
    float _501 = _499 + 1.0;
    float _503 = floor(_493);
    bool _505 = _495 > 0.0;
    bool _507 = _495 >= 0.0;
    bool _509 = isnan(_495);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    int _517 = as_type<int>(_483) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_483) & 2;
    bool _523 = _521 != 0;
    bool _525 = _497 > 0.0;
    int _527 = _515 ? 0 : 1;
    bool _529 = _497 >= 0.0;
    bool _531 = isnan(_497);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    bool _539 = _503 > 0.0;
    bool _541 = _503 >= 0.0;
    bool _543 = isnan(_503);
    bool _545 = _541 || _543;
    bool _547 = isnan(0.0);
    bool _549 = _545 || _547;
    int _551 = ~_527;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    int _557 = _537 ? 0 : 1;
    int _559 = _549 ? 0 : 1;
    int _561 = _555;
    if (!_505)
    {
        int _563 = ~_527;
        int _565 = _563 + 1;
        _561 = _565;
    }
    int _567 = _561;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _579 = _577 != 0;
    int _581 = ~_557;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    bool _587 = !_571;
    int _589 = _587 ? 0 : 1;
    int _591 = ~_559;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    int _597 = _585;
    int _599 = _595;
    if (!_525)
    {
        int _601 = ~_557;
        int _603 = _601 + 1;
        _597 = _603;
    }
    int _605 = _597;
    bool _607 = _477 > 0.5;
    if (!_539)
    {
        int _609 = ~_559;
        int _611 = _609 + 1;
        _599 = _611;
    }
    int _613 = _599;
    int _615 = abs(_589);
    float _617 = in.m_72.x;
    float _619 = in.m_72.y;
    float _621 = in.m_72.z;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _625 = 1.0 + _623;
    bool _627 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _635 = _631 || _633;
    float _637 = float(_567);
    float _639 = 1.0 / _625;
    float _641 = _635 ? _501 : 0.0;
    float _643 = _473 + _471;
    bool _645 = !_575;
    int _647 = _645 ? 0 : 1;
    bool _649 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _651 = isnan(1.0);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _657 = _653 || _655;
    float _659 = _643 + (-1.0);
    float _661 = float(_615);
    int _663 = abs(_647);
    float _665 = _661 * _637;
    float _667 = float(_663);
    float _669 = _473 + _475;
    float _671 = float(_605);
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _675 = _665 * (-2.0);
    if (_657)
    {
        float _677 = _641 * _639;
        _151 = _677;
    }
    float _679 = _151;
    float _681 = _667 * _671;
    float _683 = fma(_673, _675, _673);
    float _685 = fma(_675, _617, _617);
    float _687 = _471 + (-0.5);
    float _689 = _681 * (-2.0);
    bool _691 = !_579;
    int _693 = _691 ? 0 : 1;
    float _695 = _669 + (-1.0);
    float _697 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].x, _685);
    float _699 = fma(_689, _619, _619);
    bool _701 = _473 > 0.5;
    float _703 = _473 + (-0.5);
    float _705 = in.m_65.x;
    float _707 = in.m_65.y;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _713 = abs(_693);
    float _715 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _699);
    float _719 = 1.0 / _711;
    float _721 = float(_713);
    float _723 = fma(_715, _689, _715);
    float _725 = float(_613);
    float _727 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _729 = fma(_683, _679, _697);
    float _731 = fma(_723, _679, _717);
    float _733 = _721 * _725;
    float _735 = _475 + _471;
    float _737 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _727);
    float _739 = _729 * 0.15915493667125701904296875;
    bool _741 = !_523;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _735 + (-1.0);
    bool _747 = _471 > 0.5;
    float _749 = _733 * (-2.0);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _751;
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _757 = fma(_749, _621, _621);
    float _759 = _753 * _719;
    float _761 = _475 + (-0.5);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _469 + _763;
    float _767 = fma(_755, _749, _755);
    float _769 = _437 * _705;
    float _771 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].z, _757);
    float _775 = fma(_759, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _783 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _785 = isnan(_469);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_767, _679, _773);
    float _797 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _771);
    bool _799 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _801 = isnan(_469);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _781);
    float _813 = -_793;
    float _815 = _813 + 1.0;
    float _817 = 1.0 / _779;
    float _819 = _731 * 0.15915493667125701904296875;
    bool _821 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _823 = isnan(_469);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _809 * _815;
    bool _835 = !_519;
    float _837 = _835 ? (-0.5) : 0.5;
    float _839 = _439 * _707;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _845 = _775 * _833;
    float _847 = _739 * 6.283185482025146484375;
    float _849 = sin(_847);
    float _851 = -_831;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _857 = _469 + _855;
    float _859 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _837);
    float _865 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _867 = _793 * _853;
    float _869 = _739 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _843 * _817;
    float _875 = _859 * _863;
    float _877 = _861 * _865;
    float _879 = -_809;
    float _881 = _879 + 1.0;
    float _883 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _885 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _811);
    float _889 = _819 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = _795 * 0.15915493667125701904296875;
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[115].x, _845);
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _901 = _899 != 0;
    float _903 = fma(_883, _867, _895);
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _907 = _905 != 0;
    float _909 = _819 * 6.283185482025146484375;
    float _911 = cos(_909);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _915 = _913 != 0;
    float _917 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[117].x, _903);
    float _919 = _893 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _871 * _891;
    float _925 = _849 * _891;
    float _927 = _893 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _849 * _911;
    float _933 = _871 * _911;
    float _935 = _891 * _921;
    float _937 = _871 * _921;
    float _939 = _849 * _921;
    float _941 = _911 * _921;
    float _943 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = -_923;
    float _949 = fma(_929, _931, _947);
    float _951 = -_931;
    float _953 = fma(_929, _923, _951);
    float _955 = -_877;
    float _957 = _929 * _955;
    float _959 = _937 * _877;
    float _961 = fma(_929, _933, _925);
    float _963 = fma(_929, _925, _933);
    float _965 = fma(_941, _875, _957);
    float _967 = fma(_961, _875, _959);
    float _969 = _939 * _877;
    float _971 = fma(_935, _885, _965);
    float _973 = fma(_953, _885, _967);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _979 = fma(_949, _875, _969);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _985 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_963, _885, _979);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _991 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].x, _983);
    float _993 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _995 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    float _997 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _991);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _993);
    float _1003 = _995 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1005 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _999 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1011 = _989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1015 = _1003 + _1007;
    float _1017 = _897 + _1009;
    float _1019 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _1021 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1015 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1029 = _1017 + _1027;
    out.m_74.x = _1005;
    out.m_74.y = _997;
    out.m_74.z = _1011;
    out.m_74.w = _981;
    float _1031 = -_929;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1021);
    float _1035 = _1025 * _1025;
    float _1037 = _1029 * _1029;
    float _1039 = -_929;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _1043 = -_929;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _1047 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1049 = _1035 + _1037;
    float _1051 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1053 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1033);
    float _1055 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1041);
    float _1057 = sqrt(_1049);
    float _1059 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    float _1061 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1013);
    float _1063 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1065 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1069 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1047);
    float _1071 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1063);
    float _1073 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1075 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1077 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1061);
    float _1079 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1073);
    float _1083 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1067);
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1087 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1081);
    float _1091 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1093 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1095 = -_743;
    int _1097 = _607 ? as_type<int>(_1095) : as_type<int>(_743);
    float _1099 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1083);
    float _1101 = _1051 + _1091;
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1105 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1093);
    bool _1107 = _475 > 0.5;
    float _1109 = _937;
    float _1111 = _1035;
    float _1113 = _1037;
    float _1115 = _1015;
    float _1117 = _1017;
    float _1119 = _897;
    if (!_1087)
    {
        _1109 = _1101;
    }
    float _1121 = _1109;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_1087;
    float _1127 = _1121;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1057 + _1131;
        float _1135 = rsqrt(_1049);
        float _1137 = _1133 * _1129;
        float _1139 = _1101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = _1137 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = fma(_1145, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1153 = _1135 * _1151;
        float _1155 = _1149 + (-1.0);
        float _1157 = fma(_1025, _1153, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1159 = fma(_1029, _1153, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1161 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1165 = _1157 + _1163;
        float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1169 = _1159 + _1167;
        float _1171 = fma(_1101, _1149, _1161);
        float _1173 = _1165 * _1165;
        float _1175 = _1169 * _1169;
        _1127 = _1171;
        _1111 = _1173;
        _1113 = _1175;
        _1115 = _1157;
        _1117 = _1159;
    }
    float _1177 = _1127;
    float _1179 = _1111;
    float _1181 = _1113;
    float _1183 = _1115;
    float _1185 = _1117;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1189 = _1177 + _1187;
    float _1191 = _743 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1195 = _1193 != 0;
    float _1197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1199 = fma(_1189, _1189, _1179);
    float _1201 = fma(_1191, _1191, 1.0);
    float _1203 = -_837;
    int _1205 = _1107 ? as_type<int>(_1203) : as_type<int>(_837);
    float _1207 = _1191 * _1055;
    float _1209 = -_743;
    int _1211 = _701 ? as_type<int>(_1209) : as_type<int>(_743);
    float _1213 = _1191 * _1059;
    bool _1215 = !_915;
    float _1217 = _1215 ? _743 : as_type<float>(_1097);
    float _1219 = rsqrt(_1201);
    float _1221 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1071);
    bool _1223 = !_907;
    float _1225 = _1223 ? _837 : as_type<float>(_1205);
    float _1227 = _1191 * _1053;
    float _1229 = -_837;
    int _1231 = _747 ? as_type<int>(_1229) : as_type<int>(_837);
    float _1233 = -_1217;
    float _1235 = _1233 + 0.5;
    bool _1237 = !_901;
    float _1239 = _1237 ? _743 : as_type<float>(_1211);
    float _1241 = _1225 + 0.5;
    bool _1243 = !_1195;
    float _1245 = _1243 ? _837 : as_type<float>(_1231);
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1249 = _1199 + _1181;
    float _1251 = -_1239;
    float _1253 = _1251 + 0.5;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1257 = _1245 + 0.5;
    float _1259 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1069);
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = _1191 * _1219;
    float _1265 = _1255 * _1123;
    float _1267 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1269 = _1261 * _1103;
    float _1271 = _1247 * _1197;
    float _1273 = _837 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1275 = -_1099;
    float _1277 = _1263 * _1275;
    float _1279 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1075);
    float _1281 = _1267 * _1085;
    float _1283 = sqrt(_1249);
    float _1285 = fma(_1273, _1221, _1227);
    float _1287 = -_1089;
    float _1289 = _1263 * _1287;
    float _1291 = fma(_1219, _1055, _1277);
    float _1293 = fma(_1273, _1259, _1207);
    float _1295 = fma(_1273, _1279, _1213);
    float _1297 = -_1105;
    float _1299 = _1263 * _1297;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1307 = fma(_1219, _1053, _1289);
    float _1309 = fma(_1219, _1059, _1299);
    float _1311 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1317 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _1089 + _1285;
    float _1321 = _1099 + _1293;
    float _1323 = _1105 + _1295;
    out.m_76.x = _1281;
    out.m_76.y = _1269;
    out.m_76.z = _1265;
    out.m_76.w = _1271;
    bool _1325 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1327 = isnan(_1283);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1333 = _1329 || _1331;
    out.m_78.x = _1311;
    out.m_78.y = _1313;
    out.m_78.z = _1315;
    out.m_78.w = _1317;
    out.m_80.x = _1221;
    out.m_80.y = _1259;
    out.m_80.z = _1279;
    out.m_82.x = _1307;
    out.m_82.y = _1291;
    out.m_82.z = _1309;
    float _1335 = _1285;
    if (!_1333)
    {
        _1335 = 1.0;
    }
    float _1337 = _1335;
    out.m_84.x = _1319;
    out.m_84.y = _1321;
    out.m_84.z = _1323;
    bool _1339 = !_1333;
    float _1341 = _1337;
    if (!_1339)
    {
        bool _1343 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1345 = isnan(_1283);
        bool _1347 = _1343 || _1345;
        bool _1349 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1351 = _1347 || _1349;
        if (!_1351)
        {
            float _1353 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1355 = _1283 + _1353;
            float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1359 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1357;
            float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1365 = 1.0 / _1359;
            float _1367 = _1355 * _1365;
            float _1369 = fma(_1367, _1363, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1341 = _1369;
            _1371 = true;
        }
        else
        {
            bool _1373 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1375 = isnan(_1283);
            bool _1377 = _1373 || _1375;
            bool _1379 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1381 = _1377 || _1379;
            if (!_1381)
            {
                float _1383 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1385 = _1283 + _1383;
                float _1387 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1389 = _1387 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1391 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1393 = _1391 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1395 = 1.0 / _1389;
                float _1397 = _1385 * _1395;
                float _1399 = fma(_1397, _1393, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1341 = _1399;
                _1371 = true;
            }
            else
            {
                _1341 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1371 = false;
    float _1401 = _1341;
    float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1405 = _1177 + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1409 = _1183 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1413 = _1185 + _1411;
    float _1415 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1417 = fma(_1405, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1419 = fma(_1409, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1421 = fma(_1413, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1423 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1415);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1427 = _1417 + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1431 = _1419 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1435 = _1421 + _1433;
    float _1437 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1423);
    float _1439 = _1427 * _1427;
    float _1441 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1443 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1445 = fma(_1431, _1431, _1439);
    float _1447 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1441);
    float _1449 = 1.0 / _1443;
    float _1451 = fma(_1435, _1435, _1445);
    float _1453 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1447);
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1457 = rsqrt(_1451);
    float _1459 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1461 = _1455 + _1443;
    float _1463 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1465 = _1051 + _1463;
    float _1467 = _1461 * _1449;
    float _1469 = _1467 * 0.5;
    float _1471 = floor(_1459);
    float _1473 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1477 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1475);
    float _1479 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1481 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1473);
    float _1483 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1485 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1479);
    float _1487 = 1.0 / _1477;
    float _1489 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1481);
    float _1491 = _1431 * _1483;
    float _1493 = _1435 * _1483;
    float _1495 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1485);
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1499 = _1491 * _1491;
    float _1501 = _1493 * _1493;
    float _1503 = _1495 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1505 = trunc(_1497);
    int _1507 = int(_1505);
    float _1509 = -_1471;
    float _1511 = _1459 + _1509;
    float _1513 = _1499 + _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1487 * _1515;
    float _1519 = sqrt(_1513);
    bool _1521 = _1517 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1523 = _1517 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1525 = trunc(_1503);
    int _1527 = int(_1525);
    int _1529 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1531 = _1507 + _1529;
    int _1533 = _1531 + 1;
    bool _1535 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1539 = _1519 + _1537;
    int _1541 = 2;
    float _1543 = _1513;
    float _1545 = _1539;
    float _1547 = _1483;
    float _1549 = _1491;
    float _1551 = _1499;
    if (!_1521)
    {
        _1541 = 1;
    }
    int _1553 = _1541;
    float _1555 = sqrt(_1451);
    int _1557 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1559 = _1527 + _1557;
    int _1561 = _1559 + 1;
    float _1563 = _1463;
    int _1565 = _1553;
    if (_1535)
    {
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1567;
    }
    float _1569 = _1563;
    if (_1535)
    {
        float _1571 = rsqrt(_1513);
        _1543 = _1571;
    }
    float _1573 = _1543;
    float _1575 = _1573;
    if (_1535)
    {
        float _1577 = _1539 * _1569;
        _1545 = _1577;
    }
    float _1579 = _1545;
    float _1581 = 0.0;
    if (_1535)
    {
        float _1583 = _1579 * 0.15915493667125701904296875;
        _1581 = _1583;
    }
    float _1585 = _1581;
    bool _1587 = !_1521;
    int _1589 = _1587 ? 0 : 1;
    float _1591 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1593 = _1489;
    if (_1535)
    {
        float _1595 = _1585 * 6.283185482025146484375;
        float _1597 = sin(_1595);
        _1593 = _1597;
    }
    float _1599 = _1593;
    if (!_1523)
    {
        _1565 = _1589;
    }
    int _1601 = _1565;
    float _1603 = precise::max(0.0, _1591);
    int _1605 = _1601 << 6;
    bool _1607 = _1533 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1609 = -_1483;
    float _1611 = -_1603;
    float _1613 = fma(_1427, _1609, _1611);
    int _1615 = _1605 + 96;
    uint _1618 = uint(int(uint(_1615) >> uint(2)));
    uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
    int _1622 = int(_1618) & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    int _1626 = int(_1618) + 1;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    int _1630 = _1626 & 3;
    float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
    int _1634 = _1533 | _1561;
    float _1636 = _1585;
    float _1638 = as_type<float>(_1634);
    float _1640 = _1613;
    if (_1535)
    {
        float _1642 = _1585 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1636 = _1644;
    }
    float _1646 = _1636;
    if (_1535)
    {
        float _1648 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1547 = _1648;
    }
    float _1650 = _1547;
    bool _1652 = _1634 < 0;
    bool _1654 = _1652 || _1607;
    if (_1535)
    {
        float _1656 = fma(_1599, _1650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1638 = _1656;
    }
    float _1658 = _1638;
    int _1660 = _1605 + 48;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    uint _1664 = uint(int(uint(int(_1662)) >> uint(2)));
    int _1666 = int(_1662) & 3;
    float _1668 = (*spvDescriptorSet0.vp_c15)._m0[int(_1664)][_1666];
    int _1670 = int(_1662) + 1;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    int _1674 = _1670 & 3;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
    float _1678 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = 0.0;
    if (_1535)
    {
        float _1684 = _1573 * _1658;
        _1682 = _1684;
    }
    float _1686 = _1682;
    bool _1688 = _1561 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1690 = _1688 || _1654;
    float _1692 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1694 = floor(_1680);
    if (_1535)
    {
        float _1696 = _1491 * _1686;
        _1549 = _1696;
    }
    float _1698 = _1549;
    int _1700 = _1605 + 104;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    float _1718 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1720 = _1646;
    if (_1535)
    {
        float _1722 = _1646 + (-1.0);
        _1575 = _1722;
    }
    float _1724 = _1575;
    float _1726 = _1724;
    if (_1535)
    {
        float _1728 = _1698 * _1698;
        _1551 = _1728;
    }
    float _1730 = _1551;
    float _1732 = 0.0;
    if (_1535)
    {
        float _1734 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1734;
    }
    float _1736 = _1732;
    if (!_1535)
    {
        _1726 = _1493;
    }
    float _1738 = _1726;
    int _1740 = _1605 + 64;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    float _1758 = _1738;
    if (_1535)
    {
        float _1760 = _1493 * _1686;
        _1758 = _1760;
    }
    float _1762 = _1758;
    if (_1535)
    {
        float _1764 = fma(_1613, _1646, _1736);
        _1640 = _1764;
    }
    float _1766 = _1640;
    float _1768 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1770 = 0.0;
    if (!_1690)
    {
        float _1772 = floor(_1503);
        _1770 = _1772;
    }
    float _1774 = _1770;
    if (!_1535)
    {
        _1720 = _1501;
    }
    float _1776 = _1720;
    float _1778 = _1776;
    if (_1535)
    {
        float _1780 = _1762 * _1762;
        _1778 = _1780;
    }
    float _1782 = _1778;
    float _1784 = fma(_1766, _1766, _1730);
    int _1786 = _1605 + 80;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[int(_1798)][_1800];
    float _1804 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1806 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1808 = _1784 + _1782;
    float _1810 = -_1694;
    float _1812 = _1680 + _1810;
    float _1814 = -_1806;
    float _1816 = fma(_1814, _1804, 1.0);
    int _1818 = as_type<int>(_1806);
    if (!_1690)
    {
        int _1820 = _1561 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1822 = _1820 + _1533;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1605 + 56;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c15)._m0[int(_1838)][_1840];
    float _1844 = log2(_1816);
    int _1846 = _1605 + 88;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    float _1864 = _1465 * _1632;
    float _1866 = fma(_1003, _1624, _1864);
    int _1868 = _1605 + 72;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    float _1886 = _1465 * _1676;
    float _1888 = rsqrt(_1808);
    float _1890 = _1844 * 0.693147182464599609375;
    float _1892 = fma(_1003, _1668, _1886);
    int _1894 = as_type<int>(_1886);
    int _1896 = as_type<int>(_1624);
    if (!_1690)
    {
        int _1898 = _1824 << 2;
        _1894 = _1898;
    }
    int _1900 = _1894;
    float _1902 = fma(_897, _1708, _1866);
    int _1904 = _1900;
    float _1906 = _1756;
    int _1908 = as_type<int>(_1802);
    if (!_1690)
    {
        int _1910 = 12 & _1900;
        _1904 = _1910;
    }
    int _1912 = _1904;
    float _1914 = _1902 + _1716;
    float2 _5685 = float2(_1511, _1812);
    float _1916 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5685, float2(0.0), isnan(_5685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5685, float2(0.0), isnan(_5685)), level(0.0)).x;
    float _1918 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1920 = _1465 * _1756;
    if (!_1690)
    {
        float _1922 = -_1774;
        float _1924 = _1503 + _1922;
        _1906 = _1924;
    }
    float _1926 = _1906;
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1930 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1928);
    float _1932 = precise::clamp(_1930, 0.0, 1.0);
    float _1934 = _1888 * _1698;
    float _1936 = fma(_1003, _1748, _1920);
    float _1938 = _1888 * _1766;
    float _1940 = _1888 * _1762;
    float _1942 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1944 = _1465 * _1802;
    if (!_1690)
    {
        uint _1946 = uint(int(uint(_1824) >> uint(2)));
        _1908 = int(_1946);
    }
    int _1948 = _1908;
    float _1950 = fma(_1003, _1794, _1944);
    float _1952 = -_1932;
    float _1954 = _1952 + 1.0;
    if (!_1690)
    {
        int _1956 = _1948 << 4;
        int _1958 = _1956 + _1912;
        _1896 = _1958;
    }
    int _1960 = _1896;
    float _1962 = fma(_897, _1834, _1892);
    float _1964 = 1.0 / _1914;
    float _1966 = _1932;
    if (!_1690)
    {
        int _1968 = _1960 + 400;
        uint _1970 = uint(int(uint(_1968) >> uint(2)));
        uint _1972 = uint(int(uint(int(_1970)) >> uint(2)));
        int _1974 = int(_1970) & 3;
        float _1976 = (*spvDescriptorSet0.vp_c15)._m0[int(_1972)][_1974];
        _1966 = _1976;
    }
    float _1978 = _1966;
    float _1980 = _1962 + _1842;
    float _1982 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1984 = fma(_897, _1854, _1950);
    float _1986 = -_1942;
    float _1988 = fma(_1938, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1986);
    float _1990 = abs(_1954);
    float _1992 = log2(_1990);
    float _1994 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _1998 = -_1940;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1988);
    float _2002 = _1938 + 1.0;
    float _2004 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2006 = fma(_897, _1876, _1936);
    float _2008 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1996);
    float _2010 = _1980 * _1964;
    float _2012 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2004);
    float _2014 = _2006 + _1884;
    float _2016 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2018 = fma(_2000, -0.5, 0.5);
    bool _2020 = _2010 >= 0.0;
    float _2022 = _2014 * _1964;
    float _2024 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2016);
    float _2026 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2028 = _2010 <= 1.0;
    bool _2030 = _2028 && _2020;
    float _2032 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2034 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2024);
    float _2036 = exp2(_2026);
    bool _2038 = _2022 >= 0.0;
    bool _2040 = _2038 && _2030;
    float _2042 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2044 = _2034 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = fma(_2000, 0.5, 0.5);
    bool _2048 = _2022 <= 1.0;
    bool _2050 = _2048 && _2040;
    float _2052 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2042);
    float _2056 = sqrt(_2018);
    float _2058 = _1984 + _1862;
    float _2060 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2062 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2064 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2060);
    float _2068 = -_1938;
    float _2070 = fma(_2036, _2002, _2068);
    float _2072 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2062);
    float _2074 = _2002;
    if (_2050)
    {
        float _2076 = float(_1601);
        _2074 = _2076;
    }
    float _2078 = _2074;
    float _2080 = fma(_2046, _2064, -0.212114393711090087890625);
    float _2082 = 1.0 / _2066;
    float _2084 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2070, 0.5, 0.5);
    float _2088 = fma(_2046, _2080, 1.570728778839111328125);
    float _2090 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2072);
    float _2092 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = _2056 * 0.636619746685028076171875;
    float _2096 = _2058 * _1964;
    float _2098 = _2078;
    if (_2050)
    {
        float _2100 = rint(_2078);
        float _2102 = precise::max(_2100, 0.0);
        uint _2104 = uint(_2102);
        uint _2106 = clamp(_2104, 0u, 65535u);
        _2098 = as_type<float>(_2106);
    }
    float _2108 = _2098;
    float _2110 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2112 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2090);
    float _2114 = -_2088;
    float _2116 = fma(_2094, _2114, 1.0);
    float _2118 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2110);
    float _2120 = _2008;
    if (!_1690)
    {
        float _2122 = floor(_1497);
        _2120 = _2122;
    }
    float _2124 = _2120;
    float _2126 = _2112 * _2082;
    float _2128 = _2118 * _2082;
    float _2130 = fma(_2126, 0.5, 0.5);
    float _2132 = fma(_2128, -0.5, 0.5);
    float _2134 = _2108;
    if (_2050)
    {
        float3 _6071 = float3(_2010, _2022, float(as_type<int>(_2108)));
        float3 _6075 = select(_6071, float3(0.0), isnan(_6071));
        float _2136 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6075.xy, uint(rint(_6075.z)), _2096, level(0.0));
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = _1964;
    if (!_1690)
    {
        float _2142 = rint(_1978);
        float _2144 = precise::max(_2142, 0.0);
        uint _2146 = uint(_2144);
        uint _2148 = clamp(_2146, 0u, 65535u);
        _2140 = as_type<float>(_2148);
    }
    float _2150 = _2140;
    float3 _6101 = float3(_2130, _2132, _1918);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6101, float3(0.0), isnan(_6101)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6101, float3(0.0), isnan(_6101)), level(0.0)).x;
    float _2154 = _2124;
    if (!_1690)
    {
        float _2156 = -_2124;
        float _2158 = _1497 + _2156;
        _2154 = _2158;
    }
    float _2160 = _2154;
    float3 _6122 = float3(_2130, _2132, _1918);
    float4 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6122, float3(0.0), isnan(_6122)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6122, float3(0.0), isnan(_6122)), level(0.0)).xyzw;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = _2163.w;
    float2 _6138 = float2(_2116, _2086);
    float3 _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6138, float2(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6138, float2(0.0), isnan(_6138)), level(0.0)).xyz;
    float _2177 = _2175.x;
    float _2179 = _2175.y;
    float _2181 = _2175.z;
    float _2183 = _2150;
    float _2185 = _2160;
    if (!_1690)
    {
        float3 _6160 = float3(_2160, _1926, float(as_type<int>(_2150)));
        float3 _6162 = select(_6160, float3(0.0), isnan(_6160));
        float _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6162.xy, uint(rint(_6162.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6162.xy, uint(rint(_6162.z)), level(0.0)).x;
        _2183 = _2187;
    }
    float _2189 = _2183;
    float _2191 = abs(_1517);
    float _2193 = log2(_2191);
    float _2195 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2199 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2197);
    bool _2201 = _1517 <= 8000.0;
    bool _2203 = isnan(_1517);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(8000.0);
    bool _2209 = _2205 || _2207;
    float _2211 = float(_2209);
    float _2213 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2199);
    float _2215 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2219 = _2112;
    float _2221 = _2213;
    if (!_2050)
    {
        _2185 = 1.0;
    }
    float _2223 = _2185;
    out.gl_Position.x = _2112;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _2066;
    float _2225 = exp2(_2215);
    float _2227 = exp2(_2217);
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = fma(_2231, -2.0, 3.0);
    float _2235 = _2231 * _2231;
    float _2237 = _2235 * _2233;
    float _2239 = _2213 + _2066;
    float _2241 = _2239 * 0.5;
    float _2243 = -_2237;
    float _2245 = _2243 + 1.0;
    out.m_86.z = _2241;
    out.m_86.w = _2066;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2237);
    float _2249 = -_2225;
    float _2251 = _2249 + 1.0;
    float _2253 = _2211 * _2247;
    float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2257 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2259 = -_1916;
    float _2261 = _2259 + 1.0;
    float _2263 = _2223;
    float _2265 = _2257;
    if (_2050)
    {
        bool _2267 = _2138 >= _2096;
        bool _2269 = isnan(_2138);
        bool _2271 = _2267 || _2269;
        bool _2273 = isnan(_2096);
        bool _2275 = _2271 || _2273;
        float _2277 = float(_2275);
        _2263 = _2277;
    }
    float _2279 = _2263;
    float _2281 = _2261 * _2257;
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    if (_1690)
    {
        _2265 = 1.0;
    }
    float _2285 = _2265;
    float _2287 = _2285;
    if (!_1690)
    {
        int _2289 = _1824 << 4;
        int _2291 = _2289 + 2048;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
        int _2297 = int(_2293) & 3;
        float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
        int _2301 = int(_2293) + 1;
        uint _2303 = uint(int(uint(_2301) >> uint(2)));
        int _2305 = _2301 & 3;
        float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
        int _2309 = _2291 + 8;
        uint _2311 = uint(int(uint(_2309) >> uint(2)));
        uint _2313 = uint(int(uint(int(_2311)) >> uint(2)));
        int _2315 = int(_2311) & 3;
        float _2317 = (*spvDescriptorSet0.vp_c15)._m0[int(_2313)][_2315];
        int _2319 = int(_2311) + 1;
        uint _2321 = uint(int(uint(_2319) >> uint(2)));
        int _2323 = _2319 & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        float _2327 = _1465 * _2307;
        float _2329 = fma(_1003, _2299, _2327);
        float _2331 = fma(_897, _2317, _2329);
        float _2333 = _2331 + _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        float _2337 = -_2335;
        float _2339 = _2337 + _2189;
        float _2341 = fma(_2339, 500.0, 1.5);
        float _2343 = exp2(_2341);
        float _2345 = 0.0 + _2343;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        _2287 = _2347;
        _2219 = _2317;
    }
    float _2349 = _2287;
    float _2351 = _2219;
    float _2353 = _2279 * _2349;
    float _2355 = -_2283;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2359 = _2255 * _2152;
    out.m_88.x = _1419;
    out.m_88.y = _1417;
    out.m_88.z = _1421;
    bool _2361 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2363 = isnan(_1555);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2369 = _2365 || _2367;
    float _2371 = -_2353;
    float _2373 = fma(_2371, _2357, 1.0);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = _2171 * _2359;
    float _2379 = -_2255;
    float _2381 = _2379 + 1.0;
    float _2383 = _2181 * _2359;
    float _2385 = _2375 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2387 = fma(_2177, _2377, _2165);
    float _2389 = fma(_2179, _2377, _2167);
    float _2391 = _2171 * _2381;
    float _2393 = fma(_2171, _2383, _2169);
    out.m_90.x = _2385;
    float _2395 = _2351;
    float _2397 = _2381;
    float _2399 = _2377;
    float _2401 = _2375;
    if (!_2369)
    {
        _2221 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2403 = _2221;
    out.m_92.x = _2387;
    out.m_92.y = _2389;
    out.m_92.z = _2393;
    out.m_92.w = _2391;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2369)
    {
        _2395 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2409 = _2395;
    float _2411 = _2409;
    float _2413 = _2409;
    if (!_2369)
    {
        _2397 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2415 = _2397;
    float _2417 = _2415;
    float _2419 = _2415;
    if (!_2369)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2421 = _1119;
    float _2423 = _2421;
    float _2425 = _2421;
    if (!_2369)
    {
        _2399 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2427 = _2399;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2369)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2433 = _2401;
    bool _2435 = !_2369;
    float _2437 = _2433;
    float _2439 = _2433;
    if (!_2435)
    {
        bool _2441 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2443 = isnan(_1555);
        bool _2445 = _2441 || _2443;
        bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2449 = _2445 || _2447;
        if (!_2449)
        {
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2453 = _1555 + _2451;
            float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2457 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2455;
            float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2463 = 1.0 / _2457;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2481 = _2453 * _2463;
            float _2483 = precise::clamp(_2481, 0.0, 1.0);
            float _2485 = fma(_2483, _2461, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2487 = fma(_2483, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2493 = fma(_2483, _2471, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2495 = fma(_2483, _2475, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2497 = fma(_2483, _2479, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2499 = fma(_2483, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2413 = _2487;
            _2431 = _2495;
            _2407 = _2485;
            _2425 = _2493;
            _2419 = _2499;
            _2439 = _2497;
            _2501 = true;
        }
        else
        {
            bool _2503 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2505 = isnan(_1555);
            bool _2507 = _2503 || _2505;
            bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2511 = _2507 || _2509;
            if (!_2511)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2513 = _2405;
            _2407 = _2513;
            if (!_2511)
            {
                _2411 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2515 = _2411;
            _2413 = _2515;
            if (!_2511)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2517 = _2417;
            _2419 = _2517;
            if (!_2511)
            {
                _2423 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2519 = _2423;
            _2425 = _2519;
            if (!_2511)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2521 = _2429;
            _2431 = _2521;
            if (!_2511)
            {
                _2437 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2523 = _2437;
            bool _2525 = !_2511;
            _2439 = _2523;
            if (!_2525)
            {
                bool _2527 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2529 = isnan(_1555);
                bool _2531 = _2527 || _2529;
                bool _2533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2535 = _2531 || _2533;
                if (!_2535)
                {
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2539 = _1555 + _2537;
                    float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2543 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2541;
                    float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2549 = 1.0 / _2543;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2567 = _2539 * _2549;
                    float _2569 = precise::clamp(_2567, 0.0, 1.0);
                    float _2571 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2573 = fma(_2569, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2579 = fma(_2569, _2557, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2581 = fma(_2569, _2561, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2583 = fma(_2569, _2565, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2585 = fma(_2569, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2413 = _2573;
                    _2431 = _2581;
                    _2407 = _2571;
                    _2425 = _2579;
                    _2419 = _2585;
                    _2439 = _2583;
                    _2501 = true;
                }
                else
                {
                    _2413 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2425 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2439 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2501 = false;
    float _2587 = _2413;
    float _2589 = _2431;
    float _2591 = _2407;
    float _2593 = _2425;
    float _2595 = _2419;
    float _2597 = _2439;
    float _2599 = fma(_1321, -0.5, 0.5);
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2587;
    float _2605 = _2603 + _2589;
    float _2607 = -_2591;
    float _2609 = _2607 + _2593;
    float _2611 = -_2595;
    float _2613 = _2611 + _2597;
    bool _2615 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2617 = fma(_2601, _2605, _2587);
    float _2619 = fma(_2601, _2609, _2591);
    float _2621 = fma(_2601, _2613, _2595);
    float _2623 = _2617 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _2625 = fma(_2619, 0.298911988735198974609375, _2623);
    float _2627 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2629 = fma(_2621, 0.114477999508380889892578125, _2625);
    out.m_61.x = _2627;
    float _2631 = -_2629;
    float _2633 = _2619 + _2631;
    float _2635 = -_2629;
    float _2637 = _2617 + _2635;
    float _2639 = -_2629;
    float _2641 = _2621 + _2639;
    float _2643 = fma(_2633, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    float _2645 = fma(_2637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    float _2647 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    out.m_96.x = _2643;
    out.m_96.y = _2645;
    out.m_96.z = _2647;
    if (!_2615)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2649 = -_1417;
    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2653 = -_1419;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2657 = -_1421;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2661 = _2651 * _2651;
    float _2663 = fma(_2655, _2655, _2661);
    float _2665 = fma(_2659, _2659, _2663);
    float _2667 = sqrt(_2665);
    float _2669 = rsqrt(_2665);
    float _2671 = -_2667;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2675 = _2673 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2655 * _2669;
    float _2681 = _2651 * _2669;
    float _2683 = abs(_2677);
    float _2685 = log2(_2683);
    float _2687 = _2659 * _2669;
    float _2689 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2691 = _1321 * _2681;
    float _2693 = -_2681;
    float _2695 = -_2689;
    float _2697 = fma(_2693, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2695);
    float _2699 = fma(_1319, _2679, _2691);
    float _2701 = -_2687;
    float _2703 = fma(_2701, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2697);
    float _2705 = fma(_1323, _2687, _2699);
    float _2707 = precise::clamp(_2705, 0.0, 1.0);
    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2711 = _2703 + _2709;
    float _2713 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2715 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2717 = precise::clamp(_2715, 0.0, 1.0);
    float _2719 = exp2(_2713);
    float _2721 = _2719 * _2717;
    float _2723 = _2707 * _2721;
    float _2725 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2727 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2729 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2725;
    out.m_94.y = _2727;
    out.m_94.z = _2729;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2501 = false;
    bool _1371 = false;
    bool _461 = false;
    bool _313 = false;
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
        float _2786 = as_type<float>(_131);
        out.gl_Position.z = _2786;
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
        out.m_61.x = 0.0;
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
        float _2856 = as_type<float>(_169);
        out.gl_Position.z = _2856;
    }
    if (_161)
    {
        return out;
    }
    float _171 = in.m_65.w;
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _173;
    if (!_183)
    {
        float _201 = _173 * _173;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    bool _213 = !_183;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _173 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _173);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_183;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _173 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _199 = _269;
    }
    float _271 = _199;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = fma(_271, _185, _275);
    float _283 = fma(_271, _187, _277);
    float _285 = fma(_271, _189, _279);
    float _287 = fma(_281, _171, _191);
    float _289 = fma(_283, _171, _193);
    float _291 = fma(_285, _171, _195);
    bool _293 = !_273;
    float _311;
    if (!_293)
    {
        float _295 = in.m_67.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    bool _339 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _341 = isnan(_321);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -_337;
    float _361 = _359 + 1.0;
    float _363 = 1.0 / _357;
    bool _365 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_321);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _349 * _361;
    float _379 = -_349;
    float _381 = _379 + 1.0;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = _375 * _381;
    float _387 = 1.0 / _353;
    float _389 = -_375;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _325 * _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _321 + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = _401 * _363;
    float _413 = fma(_405, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_409, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = fma(_395, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _423 = _413 * _385;
    float _425 = _415 * _385;
    float _427 = fma(_419, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _431 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _433 = fma(_427, _377, _429);
    float _435 = fma(_421, _377, _431);
    float _437 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[145].x, _433);
    float _439 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[145].y, _435);
    bool _441 = !_383;
    float _459;
    if (!_441)
    {
        float _443 = in.m_67.x;
        float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _447 = _443 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _451 = _449 * _445;
        float _453 = floor(_451);
        float _455 = -_453;
        float _457 = _451 + _455;
        _459 = _457;
        _461 = true;
    }
    else
    {
        float _463 = float(_115);
        float _465 = 1.0 / _463;
        float _467 = _149 * _465;
        _459 = _467;
    }
    _461 = false;
    float _469 = _459;
    float _471 = in.m_67.x;
    float _473 = in.m_67.y;
    float _475 = in.m_67.z;
    float _477 = in.m_67.w;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = as_type<float>(int(gl_VertexIndex));
    float _485 = _481 * _149;
    float _487 = exp2(_485);
    float _489 = _475 * 2.0;
    float _491 = _471 * 2.0;
    float _493 = _473 * 2.0;
    float _495 = floor(_489);
    float _497 = floor(_491);
    float _499 = -_487;
    float _501 = _499 + 1.0;
    float _503 = floor(_493);
    bool _505 = _495 > 0.0;
    bool _507 = _495 >= 0.0;
    bool _509 = isnan(_495);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    int _517 = as_type<int>(_483) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_483) & 2;
    bool _523 = _521 != 0;
    bool _525 = _497 > 0.0;
    int _527 = _515 ? 0 : 1;
    bool _529 = _497 >= 0.0;
    bool _531 = isnan(_497);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    bool _539 = _503 > 0.0;
    bool _541 = _503 >= 0.0;
    bool _543 = isnan(_503);
    bool _545 = _541 || _543;
    bool _547 = isnan(0.0);
    bool _549 = _545 || _547;
    int _551 = ~_527;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    int _557 = _537 ? 0 : 1;
    int _559 = _549 ? 0 : 1;
    int _561 = _555;
    if (!_505)
    {
        int _563 = ~_527;
        int _565 = _563 + 1;
        _561 = _565;
    }
    int _567 = _561;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _579 = _577 != 0;
    int _581 = ~_557;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    bool _587 = !_571;
    int _589 = _587 ? 0 : 1;
    int _591 = ~_559;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    int _597 = _585;
    int _599 = _595;
    if (!_525)
    {
        int _601 = ~_557;
        int _603 = _601 + 1;
        _597 = _603;
    }
    int _605 = _597;
    bool _607 = _477 > 0.5;
    if (!_539)
    {
        int _609 = ~_559;
        int _611 = _609 + 1;
        _599 = _611;
    }
    int _613 = _599;
    int _615 = abs(_589);
    float _617 = in.m_72.x;
    float _619 = in.m_72.y;
    float _621 = in.m_72.z;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _625 = 1.0 + _623;
    bool _627 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _635 = _631 || _633;
    float _637 = float(_567);
    float _639 = 1.0 / _625;
    float _641 = _635 ? _501 : 0.0;
    float _643 = _473 + _471;
    bool _645 = !_575;
    int _647 = _645 ? 0 : 1;
    bool _649 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _651 = isnan(1.0);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _657 = _653 || _655;
    float _659 = _643 + (-1.0);
    float _661 = float(_615);
    int _663 = abs(_647);
    float _665 = _661 * _637;
    float _667 = float(_663);
    float _669 = _473 + _475;
    float _671 = float(_605);
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _675 = _665 * (-2.0);
    if (_657)
    {
        float _677 = _641 * _639;
        _151 = _677;
    }
    float _679 = _151;
    float _681 = _667 * _671;
    float _683 = fma(_673, _675, _673);
    float _685 = fma(_675, _617, _617);
    float _687 = _471 + (-0.5);
    float _689 = _681 * (-2.0);
    bool _691 = !_579;
    int _693 = _691 ? 0 : 1;
    float _695 = _669 + (-1.0);
    float _697 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].x, _685);
    float _699 = fma(_689, _619, _619);
    bool _701 = _473 > 0.5;
    float _703 = _473 + (-0.5);
    float _705 = in.m_65.x;
    float _707 = in.m_65.y;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _713 = abs(_693);
    float _715 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _699);
    float _719 = 1.0 / _711;
    float _721 = float(_713);
    float _723 = fma(_715, _689, _715);
    float _725 = float(_613);
    float _727 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _729 = fma(_683, _679, _697);
    float _731 = fma(_723, _679, _717);
    float _733 = _721 * _725;
    float _735 = _475 + _471;
    float _737 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _727);
    float _739 = _729 * 0.15915493667125701904296875;
    bool _741 = !_523;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _735 + (-1.0);
    bool _747 = _471 > 0.5;
    float _749 = _733 * (-2.0);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _751;
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _757 = fma(_749, _621, _621);
    float _759 = _753 * _719;
    float _761 = _475 + (-0.5);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _469 + _763;
    float _767 = fma(_755, _749, _755);
    float _769 = _437 * _705;
    float _771 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].z, _757);
    float _775 = fma(_759, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _783 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _785 = isnan(_469);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_767, _679, _773);
    float _797 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _771);
    bool _799 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _801 = isnan(_469);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _781);
    float _813 = -_793;
    float _815 = _813 + 1.0;
    float _817 = 1.0 / _779;
    float _819 = _731 * 0.15915493667125701904296875;
    bool _821 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _823 = isnan(_469);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _809 * _815;
    bool _835 = !_519;
    float _837 = _835 ? (-0.5) : 0.5;
    float _839 = _439 * _707;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _845 = _775 * _833;
    float _847 = _739 * 6.283185482025146484375;
    float _849 = sin(_847);
    float _851 = -_831;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _857 = _469 + _855;
    float _859 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _837);
    float _865 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _867 = _793 * _853;
    float _869 = _739 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _843 * _817;
    float _875 = _859 * _863;
    float _877 = _861 * _865;
    float _879 = -_809;
    float _881 = _879 + 1.0;
    float _883 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _885 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _811);
    float _889 = _819 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = _795 * 0.15915493667125701904296875;
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[115].x, _845);
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _901 = _899 != 0;
    float _903 = fma(_883, _867, _895);
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _907 = _905 != 0;
    float _909 = _819 * 6.283185482025146484375;
    float _911 = cos(_909);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _915 = _913 != 0;
    float _917 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[117].x, _903);
    float _919 = _893 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _871 * _891;
    float _925 = _849 * _891;
    float _927 = _893 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _849 * _911;
    float _933 = _871 * _911;
    float _935 = _891 * _921;
    float _937 = _871 * _921;
    float _939 = _849 * _921;
    float _941 = _911 * _921;
    float _943 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = -_923;
    float _949 = fma(_929, _931, _947);
    float _951 = -_931;
    float _953 = fma(_929, _923, _951);
    float _955 = -_877;
    float _957 = _929 * _955;
    float _959 = _937 * _877;
    float _961 = fma(_929, _933, _925);
    float _963 = fma(_929, _925, _933);
    float _965 = fma(_941, _875, _957);
    float _967 = fma(_961, _875, _959);
    float _969 = _939 * _877;
    float _971 = fma(_935, _885, _965);
    float _973 = fma(_953, _885, _967);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _979 = fma(_949, _875, _969);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _985 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_963, _885, _979);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _991 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].x, _983);
    float _993 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _995 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    float _997 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _991);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _993);
    float _1003 = _995 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1005 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _999 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1011 = _989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1015 = _1003 + _1007;
    float _1017 = _897 + _1009;
    float _1019 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _1021 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1015 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1029 = _1017 + _1027;
    out.m_74.x = _1005;
    out.m_74.y = _997;
    out.m_74.z = _1011;
    out.m_74.w = _981;
    float _1031 = -_929;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1021);
    float _1035 = _1025 * _1025;
    float _1037 = _1029 * _1029;
    float _1039 = -_929;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _1043 = -_929;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _1047 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1049 = _1035 + _1037;
    float _1051 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1053 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1033);
    float _1055 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1041);
    float _1057 = sqrt(_1049);
    float _1059 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    float _1061 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1013);
    float _1063 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1065 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1069 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1047);
    float _1071 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1063);
    float _1073 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1075 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1077 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1061);
    float _1079 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1073);
    float _1083 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1067);
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1087 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1081);
    float _1091 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1093 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1095 = -_743;
    int _1097 = _607 ? as_type<int>(_1095) : as_type<int>(_743);
    float _1099 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1083);
    float _1101 = _1051 + _1091;
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1105 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1093);
    bool _1107 = _475 > 0.5;
    float _1109 = _937;
    float _1111 = _1035;
    float _1113 = _1037;
    float _1115 = _1015;
    float _1117 = _1017;
    float _1119 = _897;
    if (!_1087)
    {
        _1109 = _1101;
    }
    float _1121 = _1109;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_1087;
    float _1127 = _1121;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1057 + _1131;
        float _1135 = rsqrt(_1049);
        float _1137 = _1133 * _1129;
        float _1139 = _1101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = _1137 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = fma(_1145, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1153 = _1135 * _1151;
        float _1155 = _1149 + (-1.0);
        float _1157 = fma(_1025, _1153, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1159 = fma(_1029, _1153, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1161 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1165 = _1157 + _1163;
        float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1169 = _1159 + _1167;
        float _1171 = fma(_1101, _1149, _1161);
        float _1173 = _1165 * _1165;
        float _1175 = _1169 * _1169;
        _1127 = _1171;
        _1111 = _1173;
        _1113 = _1175;
        _1115 = _1157;
        _1117 = _1159;
    }
    float _1177 = _1127;
    float _1179 = _1111;
    float _1181 = _1113;
    float _1183 = _1115;
    float _1185 = _1117;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1189 = _1177 + _1187;
    float _1191 = _743 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1195 = _1193 != 0;
    float _1197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1199 = fma(_1189, _1189, _1179);
    float _1201 = fma(_1191, _1191, 1.0);
    float _1203 = -_837;
    int _1205 = _1107 ? as_type<int>(_1203) : as_type<int>(_837);
    float _1207 = _1191 * _1055;
    float _1209 = -_743;
    int _1211 = _701 ? as_type<int>(_1209) : as_type<int>(_743);
    float _1213 = _1191 * _1059;
    bool _1215 = !_915;
    float _1217 = _1215 ? _743 : as_type<float>(_1097);
    float _1219 = rsqrt(_1201);
    float _1221 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1071);
    bool _1223 = !_907;
    float _1225 = _1223 ? _837 : as_type<float>(_1205);
    float _1227 = _1191 * _1053;
    float _1229 = -_837;
    int _1231 = _747 ? as_type<int>(_1229) : as_type<int>(_837);
    float _1233 = -_1217;
    float _1235 = _1233 + 0.5;
    bool _1237 = !_901;
    float _1239 = _1237 ? _743 : as_type<float>(_1211);
    float _1241 = _1225 + 0.5;
    bool _1243 = !_1195;
    float _1245 = _1243 ? _837 : as_type<float>(_1231);
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1249 = _1199 + _1181;
    float _1251 = -_1239;
    float _1253 = _1251 + 0.5;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1257 = _1245 + 0.5;
    float _1259 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1069);
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = _1191 * _1219;
    float _1265 = _1255 * _1123;
    float _1267 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1269 = _1261 * _1103;
    float _1271 = _1247 * _1197;
    float _1273 = _837 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1275 = -_1099;
    float _1277 = _1263 * _1275;
    float _1279 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1075);
    float _1281 = _1267 * _1085;
    float _1283 = sqrt(_1249);
    float _1285 = fma(_1273, _1221, _1227);
    float _1287 = -_1089;
    float _1289 = _1263 * _1287;
    float _1291 = fma(_1219, _1055, _1277);
    float _1293 = fma(_1273, _1259, _1207);
    float _1295 = fma(_1273, _1279, _1213);
    float _1297 = -_1105;
    float _1299 = _1263 * _1297;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1307 = fma(_1219, _1053, _1289);
    float _1309 = fma(_1219, _1059, _1299);
    float _1311 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1317 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _1089 + _1285;
    float _1321 = _1099 + _1293;
    float _1323 = _1105 + _1295;
    out.m_76.x = _1281;
    out.m_76.y = _1269;
    out.m_76.z = _1265;
    out.m_76.w = _1271;
    bool _1325 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1327 = isnan(_1283);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1333 = _1329 || _1331;
    out.m_78.x = _1311;
    out.m_78.y = _1313;
    out.m_78.z = _1315;
    out.m_78.w = _1317;
    out.m_80.x = _1221;
    out.m_80.y = _1259;
    out.m_80.z = _1279;
    out.m_82.x = _1307;
    out.m_82.y = _1291;
    out.m_82.z = _1309;
    float _1335 = _1285;
    if (!_1333)
    {
        _1335 = 1.0;
    }
    float _1337 = _1335;
    out.m_84.x = _1319;
    out.m_84.y = _1321;
    out.m_84.z = _1323;
    bool _1339 = !_1333;
    float _1341 = _1337;
    if (!_1339)
    {
        bool _1343 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1345 = isnan(_1283);
        bool _1347 = _1343 || _1345;
        bool _1349 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1351 = _1347 || _1349;
        if (!_1351)
        {
            float _1353 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1355 = _1283 + _1353;
            float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1359 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1357;
            float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1365 = 1.0 / _1359;
            float _1367 = _1355 * _1365;
            float _1369 = fma(_1367, _1363, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1341 = _1369;
            _1371 = true;
        }
        else
        {
            bool _1373 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1375 = isnan(_1283);
            bool _1377 = _1373 || _1375;
            bool _1379 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1381 = _1377 || _1379;
            if (!_1381)
            {
                float _1383 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1385 = _1283 + _1383;
                float _1387 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1389 = _1387 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1391 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1393 = _1391 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1395 = 1.0 / _1389;
                float _1397 = _1385 * _1395;
                float _1399 = fma(_1397, _1393, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1341 = _1399;
                _1371 = true;
            }
            else
            {
                _1341 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1371 = false;
    float _1401 = _1341;
    float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1405 = _1177 + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1409 = _1183 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1413 = _1185 + _1411;
    float _1415 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1417 = fma(_1405, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1419 = fma(_1409, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1421 = fma(_1413, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1423 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1415);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1427 = _1417 + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1431 = _1419 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1435 = _1421 + _1433;
    float _1437 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1423);
    float _1439 = _1427 * _1427;
    float _1441 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1443 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1445 = fma(_1431, _1431, _1439);
    float _1447 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1441);
    float _1449 = 1.0 / _1443;
    float _1451 = fma(_1435, _1435, _1445);
    float _1453 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1447);
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1457 = rsqrt(_1451);
    float _1459 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1461 = _1455 + _1443;
    float _1463 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1465 = _1051 + _1463;
    float _1467 = _1461 * _1449;
    float _1469 = _1467 * 0.5;
    float _1471 = floor(_1459);
    float _1473 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1477 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1475);
    float _1479 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1481 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1473);
    float _1483 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1485 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1479);
    float _1487 = 1.0 / _1477;
    float _1489 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1481);
    float _1491 = _1431 * _1483;
    float _1493 = _1435 * _1483;
    float _1495 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1485);
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1499 = _1491 * _1491;
    float _1501 = _1493 * _1493;
    float _1503 = _1495 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1505 = trunc(_1497);
    int _1507 = int(_1505);
    float _1509 = -_1471;
    float _1511 = _1459 + _1509;
    float _1513 = _1499 + _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1487 * _1515;
    float _1519 = sqrt(_1513);
    bool _1521 = _1517 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1523 = _1517 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1525 = trunc(_1503);
    int _1527 = int(_1525);
    int _1529 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1531 = _1507 + _1529;
    int _1533 = _1531 + 1;
    bool _1535 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1539 = _1519 + _1537;
    int _1541 = 2;
    float _1543 = _1513;
    float _1545 = _1539;
    float _1547 = _1483;
    float _1549 = _1491;
    float _1551 = _1499;
    if (!_1521)
    {
        _1541 = 1;
    }
    int _1553 = _1541;
    float _1555 = sqrt(_1451);
    int _1557 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1559 = _1527 + _1557;
    int _1561 = _1559 + 1;
    float _1563 = _1463;
    int _1565 = _1553;
    if (_1535)
    {
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1567;
    }
    float _1569 = _1563;
    if (_1535)
    {
        float _1571 = rsqrt(_1513);
        _1543 = _1571;
    }
    float _1573 = _1543;
    float _1575 = _1573;
    if (_1535)
    {
        float _1577 = _1539 * _1569;
        _1545 = _1577;
    }
    float _1579 = _1545;
    float _1581 = 0.0;
    if (_1535)
    {
        float _1583 = _1579 * 0.15915493667125701904296875;
        _1581 = _1583;
    }
    float _1585 = _1581;
    bool _1587 = !_1521;
    int _1589 = _1587 ? 0 : 1;
    float _1591 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1593 = _1489;
    if (_1535)
    {
        float _1595 = _1585 * 6.283185482025146484375;
        float _1597 = sin(_1595);
        _1593 = _1597;
    }
    float _1599 = _1593;
    if (!_1523)
    {
        _1565 = _1589;
    }
    int _1601 = _1565;
    float _1603 = precise::max(0.0, _1591);
    int _1605 = _1601 << 6;
    bool _1607 = _1533 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1609 = -_1483;
    float _1611 = -_1603;
    float _1613 = fma(_1427, _1609, _1611);
    int _1615 = _1605 + 96;
    uint _1618 = uint(int(uint(_1615) >> uint(2)));
    uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
    int _1622 = int(_1618) & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    int _1626 = int(_1618) + 1;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    int _1630 = _1626 & 3;
    float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
    int _1634 = _1533 | _1561;
    float _1636 = _1585;
    float _1638 = as_type<float>(_1634);
    float _1640 = _1613;
    if (_1535)
    {
        float _1642 = _1585 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1636 = _1644;
    }
    float _1646 = _1636;
    if (_1535)
    {
        float _1648 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1547 = _1648;
    }
    float _1650 = _1547;
    bool _1652 = _1634 < 0;
    bool _1654 = _1652 || _1607;
    if (_1535)
    {
        float _1656 = fma(_1599, _1650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1638 = _1656;
    }
    float _1658 = _1638;
    int _1660 = _1605 + 48;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    uint _1664 = uint(int(uint(int(_1662)) >> uint(2)));
    int _1666 = int(_1662) & 3;
    float _1668 = (*spvDescriptorSet0.vp_c15)._m0[int(_1664)][_1666];
    int _1670 = int(_1662) + 1;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    int _1674 = _1670 & 3;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
    float _1678 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = 0.0;
    if (_1535)
    {
        float _1684 = _1573 * _1658;
        _1682 = _1684;
    }
    float _1686 = _1682;
    bool _1688 = _1561 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1690 = _1688 || _1654;
    float _1692 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1694 = floor(_1680);
    if (_1535)
    {
        float _1696 = _1491 * _1686;
        _1549 = _1696;
    }
    float _1698 = _1549;
    int _1700 = _1605 + 104;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    float _1718 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1720 = _1646;
    if (_1535)
    {
        float _1722 = _1646 + (-1.0);
        _1575 = _1722;
    }
    float _1724 = _1575;
    float _1726 = _1724;
    if (_1535)
    {
        float _1728 = _1698 * _1698;
        _1551 = _1728;
    }
    float _1730 = _1551;
    float _1732 = 0.0;
    if (_1535)
    {
        float _1734 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1734;
    }
    float _1736 = _1732;
    if (!_1535)
    {
        _1726 = _1493;
    }
    float _1738 = _1726;
    int _1740 = _1605 + 64;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    float _1758 = _1738;
    if (_1535)
    {
        float _1760 = _1493 * _1686;
        _1758 = _1760;
    }
    float _1762 = _1758;
    if (_1535)
    {
        float _1764 = fma(_1613, _1646, _1736);
        _1640 = _1764;
    }
    float _1766 = _1640;
    float _1768 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1770 = 0.0;
    if (!_1690)
    {
        float _1772 = floor(_1503);
        _1770 = _1772;
    }
    float _1774 = _1770;
    if (!_1535)
    {
        _1720 = _1501;
    }
    float _1776 = _1720;
    float _1778 = _1776;
    if (_1535)
    {
        float _1780 = _1762 * _1762;
        _1778 = _1780;
    }
    float _1782 = _1778;
    float _1784 = fma(_1766, _1766, _1730);
    int _1786 = _1605 + 80;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[int(_1798)][_1800];
    float _1804 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1806 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1808 = _1784 + _1782;
    float _1810 = -_1694;
    float _1812 = _1680 + _1810;
    float _1814 = -_1806;
    float _1816 = fma(_1814, _1804, 1.0);
    int _1818 = as_type<int>(_1806);
    if (!_1690)
    {
        int _1820 = _1561 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1822 = _1820 + _1533;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1605 + 56;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c15)._m0[int(_1838)][_1840];
    float _1844 = log2(_1816);
    int _1846 = _1605 + 88;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    float _1864 = _1465 * _1632;
    float _1866 = fma(_1003, _1624, _1864);
    int _1868 = _1605 + 72;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    float _1886 = _1465 * _1676;
    float _1888 = rsqrt(_1808);
    float _1890 = _1844 * 0.693147182464599609375;
    float _1892 = fma(_1003, _1668, _1886);
    int _1894 = as_type<int>(_1886);
    int _1896 = as_type<int>(_1624);
    if (!_1690)
    {
        int _1898 = _1824 << 2;
        _1894 = _1898;
    }
    int _1900 = _1894;
    float _1902 = fma(_897, _1708, _1866);
    int _1904 = _1900;
    float _1906 = _1756;
    int _1908 = as_type<int>(_1802);
    if (!_1690)
    {
        int _1910 = 12 & _1900;
        _1904 = _1910;
    }
    int _1912 = _1904;
    float _1914 = _1902 + _1716;
    float2 _5685 = float2(_1511, _1812);
    float _1916 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5685, float2(0.0), isnan(_5685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5685, float2(0.0), isnan(_5685)), level(0.0)).x;
    float _1918 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1920 = _1465 * _1756;
    if (!_1690)
    {
        float _1922 = -_1774;
        float _1924 = _1503 + _1922;
        _1906 = _1924;
    }
    float _1926 = _1906;
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1930 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1928);
    float _1932 = precise::clamp(_1930, 0.0, 1.0);
    float _1934 = _1888 * _1698;
    float _1936 = fma(_1003, _1748, _1920);
    float _1938 = _1888 * _1766;
    float _1940 = _1888 * _1762;
    float _1942 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1944 = _1465 * _1802;
    if (!_1690)
    {
        uint _1946 = uint(int(uint(_1824) >> uint(2)));
        _1908 = int(_1946);
    }
    int _1948 = _1908;
    float _1950 = fma(_1003, _1794, _1944);
    float _1952 = -_1932;
    float _1954 = _1952 + 1.0;
    if (!_1690)
    {
        int _1956 = _1948 << 4;
        int _1958 = _1956 + _1912;
        _1896 = _1958;
    }
    int _1960 = _1896;
    float _1962 = fma(_897, _1834, _1892);
    float _1964 = 1.0 / _1914;
    float _1966 = _1932;
    if (!_1690)
    {
        int _1968 = _1960 + 400;
        uint _1970 = uint(int(uint(_1968) >> uint(2)));
        uint _1972 = uint(int(uint(int(_1970)) >> uint(2)));
        int _1974 = int(_1970) & 3;
        float _1976 = (*spvDescriptorSet0.vp_c15)._m0[int(_1972)][_1974];
        _1966 = _1976;
    }
    float _1978 = _1966;
    float _1980 = _1962 + _1842;
    float _1982 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1984 = fma(_897, _1854, _1950);
    float _1986 = -_1942;
    float _1988 = fma(_1938, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1986);
    float _1990 = abs(_1954);
    float _1992 = log2(_1990);
    float _1994 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _1998 = -_1940;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1988);
    float _2002 = _1938 + 1.0;
    float _2004 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2006 = fma(_897, _1876, _1936);
    float _2008 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1996);
    float _2010 = _1980 * _1964;
    float _2012 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2004);
    float _2014 = _2006 + _1884;
    float _2016 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2018 = fma(_2000, -0.5, 0.5);
    bool _2020 = _2010 >= 0.0;
    float _2022 = _2014 * _1964;
    float _2024 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2016);
    float _2026 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2028 = _2010 <= 1.0;
    bool _2030 = _2028 && _2020;
    float _2032 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2034 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2024);
    float _2036 = exp2(_2026);
    bool _2038 = _2022 >= 0.0;
    bool _2040 = _2038 && _2030;
    float _2042 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2044 = _2034 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = fma(_2000, 0.5, 0.5);
    bool _2048 = _2022 <= 1.0;
    bool _2050 = _2048 && _2040;
    float _2052 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2042);
    float _2056 = sqrt(_2018);
    float _2058 = _1984 + _1862;
    float _2060 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2062 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2064 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2060);
    float _2068 = -_1938;
    float _2070 = fma(_2036, _2002, _2068);
    float _2072 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2062);
    float _2074 = _2002;
    if (_2050)
    {
        float _2076 = float(_1601);
        _2074 = _2076;
    }
    float _2078 = _2074;
    float _2080 = fma(_2046, _2064, -0.212114393711090087890625);
    float _2082 = 1.0 / _2066;
    float _2084 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2070, 0.5, 0.5);
    float _2088 = fma(_2046, _2080, 1.570728778839111328125);
    float _2090 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2072);
    float _2092 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = _2056 * 0.636619746685028076171875;
    float _2096 = _2058 * _1964;
    float _2098 = _2078;
    if (_2050)
    {
        float _2100 = rint(_2078);
        float _2102 = precise::max(_2100, 0.0);
        uint _2104 = uint(_2102);
        uint _2106 = clamp(_2104, 0u, 65535u);
        _2098 = as_type<float>(_2106);
    }
    float _2108 = _2098;
    float _2110 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2112 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2090);
    float _2114 = -_2088;
    float _2116 = fma(_2094, _2114, 1.0);
    float _2118 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2110);
    float _2120 = _2008;
    if (!_1690)
    {
        float _2122 = floor(_1497);
        _2120 = _2122;
    }
    float _2124 = _2120;
    float _2126 = _2112 * _2082;
    float _2128 = _2118 * _2082;
    float _2130 = fma(_2126, 0.5, 0.5);
    float _2132 = fma(_2128, -0.5, 0.5);
    float _2134 = _2108;
    if (_2050)
    {
        float3 _6071 = float3(_2010, _2022, float(as_type<int>(_2108)));
        float3 _6075 = select(_6071, float3(0.0), isnan(_6071));
        float _2136 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6075.xy, uint(rint(_6075.z)), _2096, level(0.0));
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = _1964;
    if (!_1690)
    {
        float _2142 = rint(_1978);
        float _2144 = precise::max(_2142, 0.0);
        uint _2146 = uint(_2144);
        uint _2148 = clamp(_2146, 0u, 65535u);
        _2140 = as_type<float>(_2148);
    }
    float _2150 = _2140;
    float3 _6101 = float3(_2130, _2132, _1918);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6101, float3(0.0), isnan(_6101)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6101, float3(0.0), isnan(_6101)), level(0.0)).x;
    float _2154 = _2124;
    if (!_1690)
    {
        float _2156 = -_2124;
        float _2158 = _1497 + _2156;
        _2154 = _2158;
    }
    float _2160 = _2154;
    float3 _6122 = float3(_2130, _2132, _1918);
    float4 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6122, float3(0.0), isnan(_6122)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6122, float3(0.0), isnan(_6122)), level(0.0)).xyzw;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = _2163.w;
    float2 _6138 = float2(_2116, _2086);
    float3 _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6138, float2(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6138, float2(0.0), isnan(_6138)), level(0.0)).xyz;
    float _2177 = _2175.x;
    float _2179 = _2175.y;
    float _2181 = _2175.z;
    float _2183 = _2150;
    float _2185 = _2160;
    if (!_1690)
    {
        float3 _6160 = float3(_2160, _1926, float(as_type<int>(_2150)));
        float3 _6162 = select(_6160, float3(0.0), isnan(_6160));
        float _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6162.xy, uint(rint(_6162.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6162.xy, uint(rint(_6162.z)), level(0.0)).x;
        _2183 = _2187;
    }
    float _2189 = _2183;
    float _2191 = abs(_1517);
    float _2193 = log2(_2191);
    float _2195 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2199 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2197);
    bool _2201 = _1517 <= 8000.0;
    bool _2203 = isnan(_1517);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(8000.0);
    bool _2209 = _2205 || _2207;
    float _2211 = float(_2209);
    float _2213 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2199);
    float _2215 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2219 = _2112;
    float _2221 = _2213;
    if (!_2050)
    {
        _2185 = 1.0;
    }
    float _2223 = _2185;
    out.gl_Position.x = _2112;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _2066;
    float _2225 = exp2(_2215);
    float _2227 = exp2(_2217);
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = fma(_2231, -2.0, 3.0);
    float _2235 = _2231 * _2231;
    float _2237 = _2235 * _2233;
    float _2239 = _2213 + _2066;
    float _2241 = _2239 * 0.5;
    float _2243 = -_2237;
    float _2245 = _2243 + 1.0;
    out.m_86.z = _2241;
    out.m_86.w = _2066;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2237);
    float _2249 = -_2225;
    float _2251 = _2249 + 1.0;
    float _2253 = _2211 * _2247;
    float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2257 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2259 = -_1916;
    float _2261 = _2259 + 1.0;
    float _2263 = _2223;
    float _2265 = _2257;
    if (_2050)
    {
        bool _2267 = _2138 >= _2096;
        bool _2269 = isnan(_2138);
        bool _2271 = _2267 || _2269;
        bool _2273 = isnan(_2096);
        bool _2275 = _2271 || _2273;
        float _2277 = float(_2275);
        _2263 = _2277;
    }
    float _2279 = _2263;
    float _2281 = _2261 * _2257;
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    if (_1690)
    {
        _2265 = 1.0;
    }
    float _2285 = _2265;
    float _2287 = _2285;
    if (!_1690)
    {
        int _2289 = _1824 << 4;
        int _2291 = _2289 + 2048;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
        int _2297 = int(_2293) & 3;
        float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
        int _2301 = int(_2293) + 1;
        uint _2303 = uint(int(uint(_2301) >> uint(2)));
        int _2305 = _2301 & 3;
        float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
        int _2309 = _2291 + 8;
        uint _2311 = uint(int(uint(_2309) >> uint(2)));
        uint _2313 = uint(int(uint(int(_2311)) >> uint(2)));
        int _2315 = int(_2311) & 3;
        float _2317 = (*spvDescriptorSet0.vp_c15)._m0[int(_2313)][_2315];
        int _2319 = int(_2311) + 1;
        uint _2321 = uint(int(uint(_2319) >> uint(2)));
        int _2323 = _2319 & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        float _2327 = _1465 * _2307;
        float _2329 = fma(_1003, _2299, _2327);
        float _2331 = fma(_897, _2317, _2329);
        float _2333 = _2331 + _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        float _2337 = -_2335;
        float _2339 = _2337 + _2189;
        float _2341 = fma(_2339, 500.0, 1.5);
        float _2343 = exp2(_2341);
        float _2345 = 0.0 + _2343;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        _2287 = _2347;
        _2219 = _2317;
    }
    float _2349 = _2287;
    float _2351 = _2219;
    float _2353 = _2279 * _2349;
    float _2355 = -_2283;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2359 = _2255 * _2152;
    out.m_88.x = _1419;
    out.m_88.y = _1417;
    out.m_88.z = _1421;
    bool _2361 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2363 = isnan(_1555);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2369 = _2365 || _2367;
    float _2371 = -_2353;
    float _2373 = fma(_2371, _2357, 1.0);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = _2171 * _2359;
    float _2379 = -_2255;
    float _2381 = _2379 + 1.0;
    float _2383 = _2181 * _2359;
    float _2385 = _2375 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2387 = fma(_2177, _2377, _2165);
    float _2389 = fma(_2179, _2377, _2167);
    float _2391 = _2171 * _2381;
    float _2393 = fma(_2171, _2383, _2169);
    out.m_90.x = _2385;
    float _2395 = _2351;
    float _2397 = _2381;
    float _2399 = _2377;
    float _2401 = _2375;
    if (!_2369)
    {
        _2221 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2403 = _2221;
    out.m_92.x = _2387;
    out.m_92.y = _2389;
    out.m_92.z = _2393;
    out.m_92.w = _2391;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2369)
    {
        _2395 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2409 = _2395;
    float _2411 = _2409;
    float _2413 = _2409;
    if (!_2369)
    {
        _2397 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2415 = _2397;
    float _2417 = _2415;
    float _2419 = _2415;
    if (!_2369)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2421 = _1119;
    float _2423 = _2421;
    float _2425 = _2421;
    if (!_2369)
    {
        _2399 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2427 = _2399;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2369)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2433 = _2401;
    bool _2435 = !_2369;
    float _2437 = _2433;
    float _2439 = _2433;
    if (!_2435)
    {
        bool _2441 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2443 = isnan(_1555);
        bool _2445 = _2441 || _2443;
        bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2449 = _2445 || _2447;
        if (!_2449)
        {
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2453 = _1555 + _2451;
            float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2457 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2455;
            float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2463 = 1.0 / _2457;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2481 = _2453 * _2463;
            float _2483 = precise::clamp(_2481, 0.0, 1.0);
            float _2485 = fma(_2483, _2461, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2487 = fma(_2483, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2493 = fma(_2483, _2471, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2495 = fma(_2483, _2475, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2497 = fma(_2483, _2479, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2499 = fma(_2483, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2413 = _2487;
            _2431 = _2495;
            _2407 = _2485;
            _2425 = _2493;
            _2419 = _2499;
            _2439 = _2497;
            _2501 = true;
        }
        else
        {
            bool _2503 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2505 = isnan(_1555);
            bool _2507 = _2503 || _2505;
            bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2511 = _2507 || _2509;
            if (!_2511)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2513 = _2405;
            _2407 = _2513;
            if (!_2511)
            {
                _2411 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2515 = _2411;
            _2413 = _2515;
            if (!_2511)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2517 = _2417;
            _2419 = _2517;
            if (!_2511)
            {
                _2423 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2519 = _2423;
            _2425 = _2519;
            if (!_2511)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2521 = _2429;
            _2431 = _2521;
            if (!_2511)
            {
                _2437 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2523 = _2437;
            bool _2525 = !_2511;
            _2439 = _2523;
            if (!_2525)
            {
                bool _2527 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2529 = isnan(_1555);
                bool _2531 = _2527 || _2529;
                bool _2533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2535 = _2531 || _2533;
                if (!_2535)
                {
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2539 = _1555 + _2537;
                    float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2543 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2541;
                    float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2549 = 1.0 / _2543;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2567 = _2539 * _2549;
                    float _2569 = precise::clamp(_2567, 0.0, 1.0);
                    float _2571 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2573 = fma(_2569, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2579 = fma(_2569, _2557, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2581 = fma(_2569, _2561, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2583 = fma(_2569, _2565, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2585 = fma(_2569, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2413 = _2573;
                    _2431 = _2581;
                    _2407 = _2571;
                    _2425 = _2579;
                    _2419 = _2585;
                    _2439 = _2583;
                    _2501 = true;
                }
                else
                {
                    _2413 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2425 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2439 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2501 = false;
    float _2587 = _2413;
    float _2589 = _2431;
    float _2591 = _2407;
    float _2593 = _2425;
    float _2595 = _2419;
    float _2597 = _2439;
    float _2599 = fma(_1321, -0.5, 0.5);
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2587;
    float _2605 = _2603 + _2589;
    float _2607 = -_2591;
    float _2609 = _2607 + _2593;
    float _2611 = -_2595;
    float _2613 = _2611 + _2597;
    bool _2615 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2617 = fma(_2601, _2605, _2587);
    float _2619 = fma(_2601, _2609, _2591);
    float _2621 = fma(_2601, _2613, _2595);
    float _2623 = _2617 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _2625 = fma(_2619, 0.298911988735198974609375, _2623);
    float _2627 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2629 = fma(_2621, 0.114477999508380889892578125, _2625);
    out.m_61.x = _2627;
    float _2631 = -_2629;
    float _2633 = _2619 + _2631;
    float _2635 = -_2629;
    float _2637 = _2617 + _2635;
    float _2639 = -_2629;
    float _2641 = _2621 + _2639;
    float _2643 = fma(_2633, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    float _2645 = fma(_2637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    float _2647 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    out.m_96.x = _2643;
    out.m_96.y = _2645;
    out.m_96.z = _2647;
    if (!_2615)
    {
        return out;
    }
    float _2649 = -_1417;
    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2653 = -_1419;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2657 = -_1421;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2661 = _2651 * _2651;
    float _2663 = fma(_2655, _2655, _2661);
    float _2665 = fma(_2659, _2659, _2663);
    float _2667 = sqrt(_2665);
    float _2669 = rsqrt(_2665);
    float _2671 = -_2667;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2675 = _2673 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2655 * _2669;
    float _2681 = _2651 * _2669;
    float _2683 = abs(_2677);
    float _2685 = log2(_2683);
    float _2687 = _2659 * _2669;
    float _2689 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2691 = _1321 * _2681;
    float _2693 = -_2681;
    float _2695 = -_2689;
    float _2697 = fma(_2693, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2695);
    float _2699 = fma(_1319, _2679, _2691);
    float _2701 = -_2687;
    float _2703 = fma(_2701, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2697);
    float _2705 = fma(_1323, _2687, _2699);
    float _2707 = precise::clamp(_2705, 0.0, 1.0);
    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2711 = _2703 + _2709;
    float _2713 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2715 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2717 = precise::clamp(_2715, 0.0, 1.0);
    float _2719 = exp2(_2713);
    float _2721 = _2719 * _2717;
    float _2723 = _2707 * _2721;
    float _2725 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2727 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2729 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2725;
    out.m_94.y = _2727;
    out.m_94.z = _2729;
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
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2501 = false;
    bool _1371 = false;
    bool _461 = false;
    bool _313 = false;
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
        float _2786 = as_type<float>(_131);
        out.gl_Position.z = _2786;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_63.w;
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
        out.m_61.x = 0.0;
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
        float _2856 = as_type<float>(_169);
        out.gl_Position.z = _2856;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_65.w;
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _173;
    if (!_183)
    {
        float _201 = _173 * _173;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    bool _213 = !_183;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _173 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _173);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_183;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _173 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _199 = _269;
    }
    float _271 = _199;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = fma(_271, _185, _275);
    float _283 = fma(_271, _187, _277);
    float _285 = fma(_271, _189, _279);
    float _287 = fma(_281, _171, _191);
    float _289 = fma(_283, _171, _193);
    float _291 = fma(_285, _171, _195);
    bool _293 = !_273;
    float _311;
    if (!_293)
    {
        float _295 = in.m_67.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_115);
        float _317 = 1.0 / _315;
        float _319 = _149 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    bool _339 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _341 = isnan(_321);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -_337;
    float _361 = _359 + 1.0;
    float _363 = 1.0 / _357;
    bool _365 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_321);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _349 * _361;
    float _379 = -_349;
    float _381 = _379 + 1.0;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = _375 * _381;
    float _387 = 1.0 / _353;
    float _389 = -_375;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = _325 * _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _321 + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = _401 * _363;
    float _413 = fma(_405, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_409, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = fma(_395, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _423 = _413 * _385;
    float _425 = _415 * _385;
    float _427 = fma(_419, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _429 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _431 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _433 = fma(_427, _377, _429);
    float _435 = fma(_421, _377, _431);
    float _437 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[145].x, _433);
    float _439 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[145].y, _435);
    bool _441 = !_383;
    float _459;
    if (!_441)
    {
        float _443 = in.m_67.x;
        float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _447 = _443 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _451 = _449 * _445;
        float _453 = floor(_451);
        float _455 = -_453;
        float _457 = _451 + _455;
        _459 = _457;
        _461 = true;
    }
    else
    {
        float _463 = float(_115);
        float _465 = 1.0 / _463;
        float _467 = _149 * _465;
        _459 = _467;
    }
    _461 = false;
    float _469 = _459;
    float _471 = in.m_67.x;
    float _473 = in.m_67.y;
    float _475 = in.m_67.z;
    float _477 = in.m_67.w;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = as_type<float>(int(gl_VertexIndex));
    float _485 = _481 * _149;
    float _487 = exp2(_485);
    float _489 = _475 * 2.0;
    float _491 = _471 * 2.0;
    float _493 = _473 * 2.0;
    float _495 = floor(_489);
    float _497 = floor(_491);
    float _499 = -_487;
    float _501 = _499 + 1.0;
    float _503 = floor(_493);
    bool _505 = _495 > 0.0;
    bool _507 = _495 >= 0.0;
    bool _509 = isnan(_495);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    int _517 = as_type<int>(_483) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_483) & 2;
    bool _523 = _521 != 0;
    bool _525 = _497 > 0.0;
    int _527 = _515 ? 0 : 1;
    bool _529 = _497 >= 0.0;
    bool _531 = isnan(_497);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    bool _539 = _503 > 0.0;
    bool _541 = _503 >= 0.0;
    bool _543 = isnan(_503);
    bool _545 = _541 || _543;
    bool _547 = isnan(0.0);
    bool _549 = _545 || _547;
    int _551 = ~_527;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    int _557 = _537 ? 0 : 1;
    int _559 = _549 ? 0 : 1;
    int _561 = _555;
    if (!_505)
    {
        int _563 = ~_527;
        int _565 = _563 + 1;
        _561 = _565;
    }
    int _567 = _561;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _579 = _577 != 0;
    int _581 = ~_557;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    bool _587 = !_571;
    int _589 = _587 ? 0 : 1;
    int _591 = ~_559;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    int _597 = _585;
    int _599 = _595;
    if (!_525)
    {
        int _601 = ~_557;
        int _603 = _601 + 1;
        _597 = _603;
    }
    int _605 = _597;
    bool _607 = _477 > 0.5;
    if (!_539)
    {
        int _609 = ~_559;
        int _611 = _609 + 1;
        _599 = _611;
    }
    int _613 = _599;
    int _615 = abs(_589);
    float _617 = in.m_72.x;
    float _619 = in.m_72.y;
    float _621 = in.m_72.z;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _625 = 1.0 + _623;
    bool _627 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _635 = _631 || _633;
    float _637 = float(_567);
    float _639 = 1.0 / _625;
    float _641 = _635 ? _501 : 0.0;
    float _643 = _473 + _471;
    bool _645 = !_575;
    int _647 = _645 ? 0 : 1;
    bool _649 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _651 = isnan(1.0);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _657 = _653 || _655;
    float _659 = _643 + (-1.0);
    float _661 = float(_615);
    int _663 = abs(_647);
    float _665 = _661 * _637;
    float _667 = float(_663);
    float _669 = _473 + _475;
    float _671 = float(_605);
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _675 = _665 * (-2.0);
    if (_657)
    {
        float _677 = _641 * _639;
        _151 = _677;
    }
    float _679 = _151;
    float _681 = _667 * _671;
    float _683 = fma(_673, _675, _673);
    float _685 = fma(_675, _617, _617);
    float _687 = _471 + (-0.5);
    float _689 = _681 * (-2.0);
    bool _691 = !_579;
    int _693 = _691 ? 0 : 1;
    float _695 = _669 + (-1.0);
    float _697 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].x, _685);
    float _699 = fma(_689, _619, _619);
    bool _701 = _473 > 0.5;
    float _703 = _473 + (-0.5);
    float _705 = in.m_65.x;
    float _707 = in.m_65.y;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _713 = abs(_693);
    float _715 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _717 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[196].y, _699);
    float _719 = 1.0 / _711;
    float _721 = float(_713);
    float _723 = fma(_715, _689, _715);
    float _725 = float(_613);
    float _727 = _289 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _729 = fma(_683, _679, _697);
    float _731 = fma(_723, _679, _717);
    float _733 = _721 * _725;
    float _735 = _475 + _471;
    float _737 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[5].x, _727);
    float _739 = _729 * 0.15915493667125701904296875;
    bool _741 = !_523;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _735 + (-1.0);
    bool _747 = _471 > 0.5;
    float _749 = _733 * (-2.0);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _751;
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _757 = fma(_749, _621, _621);
    float _759 = _753 * _719;
    float _761 = _475 + (-0.5);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _469 + _763;
    float _767 = fma(_755, _749, _755);
    float _769 = _437 * _705;
    float _771 = _289 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].z, _757);
    float _775 = fma(_759, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = _289 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _783 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _785 = isnan(_469);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_767, _679, _773);
    float _797 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[4].x, _771);
    bool _799 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _801 = isnan(_469);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = fma(_287, (*spvDescriptorSet0.vp_c10)._m0[6].x, _781);
    float _813 = -_793;
    float _815 = _813 + 1.0;
    float _817 = 1.0 / _779;
    float _819 = _731 * 0.15915493667125701904296875;
    bool _821 = _469 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _823 = isnan(_469);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _809 * _815;
    bool _835 = !_519;
    float _837 = _835 ? (-0.5) : 0.5;
    float _839 = _439 * _707;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _845 = _775 * _833;
    float _847 = _739 * 6.283185482025146484375;
    float _849 = sin(_847);
    float _851 = -_831;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _857 = _469 + _855;
    float _859 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _861 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _837);
    float _865 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _867 = _793 * _853;
    float _869 = _739 * 6.283185482025146484375;
    float _871 = cos(_869);
    float _873 = _843 * _817;
    float _875 = _859 * _863;
    float _877 = _861 * _865;
    float _879 = -_809;
    float _881 = _879 + 1.0;
    float _883 = fma(_873, _857, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _885 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[6].z, _811);
    float _889 = _819 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = _795 * 0.15915493667125701904296875;
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[115].x, _845);
    float _897 = _887 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _901 = _899 != 0;
    float _903 = fma(_883, _867, _895);
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _907 = _905 != 0;
    float _909 = _819 * 6.283185482025146484375;
    float _911 = cos(_909);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _915 = _913 != 0;
    float _917 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[117].x, _903);
    float _919 = _893 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _871 * _891;
    float _925 = _849 * _891;
    float _927 = _893 * 6.283185482025146484375;
    float _929 = sin(_927);
    float _931 = _849 * _911;
    float _933 = _871 * _911;
    float _935 = _891 * _921;
    float _937 = _871 * _921;
    float _939 = _849 * _921;
    float _941 = _911 * _921;
    float _943 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = -_923;
    float _949 = fma(_929, _931, _947);
    float _951 = -_931;
    float _953 = fma(_929, _923, _951);
    float _955 = -_877;
    float _957 = _929 * _955;
    float _959 = _937 * _877;
    float _961 = fma(_929, _933, _925);
    float _963 = fma(_929, _925, _933);
    float _965 = fma(_941, _875, _957);
    float _967 = fma(_961, _875, _959);
    float _969 = _939 * _877;
    float _971 = fma(_935, _885, _965);
    float _973 = fma(_953, _885, _967);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _979 = fma(_949, _875, _969);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _983 = _973 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _985 = _973 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _987 = fma(_963, _885, _979);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _991 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[24].x, _983);
    float _993 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[26].x, _985);
    float _995 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    float _997 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].z, _991);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].z, _993);
    float _1003 = _995 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1005 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _999 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1011 = _989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _973 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1015 = _1003 + _1007;
    float _1017 = _897 + _1009;
    float _1019 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    float _1021 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1015 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1029 = _1017 + _1027;
    out.m_74.x = _1005;
    out.m_74.y = _997;
    out.m_74.z = _1011;
    out.m_74.w = _981;
    float _1031 = -_929;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1021);
    float _1035 = _1025 * _1025;
    float _1037 = _1029 * _1029;
    float _1039 = -_929;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _1043 = -_929;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _1047 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1049 = _1035 + _1037;
    float _1051 = _1019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1053 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1033);
    float _1055 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1041);
    float _1057 = sqrt(_1049);
    float _1059 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    float _1061 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1013);
    float _1063 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1065 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _953 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1069 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1047);
    float _1071 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1063);
    float _1073 = _953 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1075 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1077 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1061);
    float _1079 = _953 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1073);
    float _1083 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1067);
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1087 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1081);
    float _1091 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1093 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1095 = -_743;
    int _1097 = _607 ? as_type<int>(_1095) : as_type<int>(_743);
    float _1099 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1083);
    float _1101 = _1051 + _1091;
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1105 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1093);
    bool _1107 = _475 > 0.5;
    float _1109 = _937;
    float _1111 = _1035;
    float _1113 = _1037;
    float _1115 = _1015;
    float _1117 = _1017;
    float _1119 = _897;
    if (!_1087)
    {
        _1109 = _1101;
    }
    float _1121 = _1109;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_1087;
    float _1127 = _1121;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1057 + _1131;
        float _1135 = rsqrt(_1049);
        float _1137 = _1133 * _1129;
        float _1139 = _1101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = _1137 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = fma(_1145, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1153 = _1135 * _1151;
        float _1155 = _1149 + (-1.0);
        float _1157 = fma(_1025, _1153, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1159 = fma(_1029, _1153, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1161 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1165 = _1157 + _1163;
        float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1169 = _1159 + _1167;
        float _1171 = fma(_1101, _1149, _1161);
        float _1173 = _1165 * _1165;
        float _1175 = _1169 * _1169;
        _1127 = _1171;
        _1111 = _1173;
        _1113 = _1175;
        _1115 = _1157;
        _1117 = _1159;
    }
    float _1177 = _1127;
    float _1179 = _1111;
    float _1181 = _1113;
    float _1183 = _1115;
    float _1185 = _1117;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1189 = _1177 + _1187;
    float _1191 = _743 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1195 = _1193 != 0;
    float _1197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1199 = fma(_1189, _1189, _1179);
    float _1201 = fma(_1191, _1191, 1.0);
    float _1203 = -_837;
    int _1205 = _1107 ? as_type<int>(_1203) : as_type<int>(_837);
    float _1207 = _1191 * _1055;
    float _1209 = -_743;
    int _1211 = _701 ? as_type<int>(_1209) : as_type<int>(_743);
    float _1213 = _1191 * _1059;
    bool _1215 = !_915;
    float _1217 = _1215 ? _743 : as_type<float>(_1097);
    float _1219 = rsqrt(_1201);
    float _1221 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1071);
    bool _1223 = !_907;
    float _1225 = _1223 ? _837 : as_type<float>(_1205);
    float _1227 = _1191 * _1053;
    float _1229 = -_837;
    int _1231 = _747 ? as_type<int>(_1229) : as_type<int>(_837);
    float _1233 = -_1217;
    float _1235 = _1233 + 0.5;
    bool _1237 = !_901;
    float _1239 = _1237 ? _743 : as_type<float>(_1211);
    float _1241 = _1225 + 0.5;
    bool _1243 = !_1195;
    float _1245 = _1243 ? _837 : as_type<float>(_1231);
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1249 = _1199 + _1181;
    float _1251 = -_1239;
    float _1253 = _1251 + 0.5;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1257 = _1245 + 0.5;
    float _1259 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1069);
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = _1191 * _1219;
    float _1265 = _1255 * _1123;
    float _1267 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1269 = _1261 * _1103;
    float _1271 = _1247 * _1197;
    float _1273 = _837 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1275 = -_1099;
    float _1277 = _1263 * _1275;
    float _1279 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1075);
    float _1281 = _1267 * _1085;
    float _1283 = sqrt(_1249);
    float _1285 = fma(_1273, _1221, _1227);
    float _1287 = -_1089;
    float _1289 = _1263 * _1287;
    float _1291 = fma(_1219, _1055, _1277);
    float _1293 = fma(_1273, _1259, _1207);
    float _1295 = fma(_1273, _1279, _1213);
    float _1297 = -_1105;
    float _1299 = _1263 * _1297;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1307 = fma(_1219, _1053, _1289);
    float _1309 = fma(_1219, _1059, _1299);
    float _1311 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1317 = _917 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _1089 + _1285;
    float _1321 = _1099 + _1293;
    float _1323 = _1105 + _1295;
    out.m_76.x = _1281;
    out.m_76.y = _1269;
    out.m_76.z = _1265;
    out.m_76.w = _1271;
    bool _1325 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1327 = isnan(_1283);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1333 = _1329 || _1331;
    out.m_78.x = _1311;
    out.m_78.y = _1313;
    out.m_78.z = _1315;
    out.m_78.w = _1317;
    out.m_80.x = _1221;
    out.m_80.y = _1259;
    out.m_80.z = _1279;
    out.m_82.x = _1307;
    out.m_82.y = _1291;
    out.m_82.z = _1309;
    float _1335 = _1285;
    if (!_1333)
    {
        _1335 = 1.0;
    }
    float _1337 = _1335;
    out.m_84.x = _1319;
    out.m_84.y = _1321;
    out.m_84.z = _1323;
    bool _1339 = !_1333;
    float _1341 = _1337;
    if (!_1339)
    {
        bool _1343 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1345 = isnan(_1283);
        bool _1347 = _1343 || _1345;
        bool _1349 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1351 = _1347 || _1349;
        if (!_1351)
        {
            float _1353 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1355 = _1283 + _1353;
            float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1359 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1357;
            float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1365 = 1.0 / _1359;
            float _1367 = _1355 * _1365;
            float _1369 = fma(_1367, _1363, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1341 = _1369;
            _1371 = true;
        }
        else
        {
            bool _1373 = _1283 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1375 = isnan(_1283);
            bool _1377 = _1373 || _1375;
            bool _1379 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1381 = _1377 || _1379;
            if (!_1381)
            {
                float _1383 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1385 = _1283 + _1383;
                float _1387 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1389 = _1387 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1391 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1393 = _1391 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1395 = 1.0 / _1389;
                float _1397 = _1385 * _1395;
                float _1399 = fma(_1397, _1393, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1341 = _1399;
                _1371 = true;
            }
            else
            {
                _1341 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1371 = false;
    float _1401 = _1341;
    float _1403 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1405 = _1177 + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1409 = _1183 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1413 = _1185 + _1411;
    float _1415 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1417 = fma(_1405, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1419 = fma(_1409, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1421 = fma(_1413, _1401, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1423 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1415);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1427 = _1417 + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1431 = _1419 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1435 = _1421 + _1433;
    float _1437 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1423);
    float _1439 = _1427 * _1427;
    float _1441 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1443 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1445 = fma(_1431, _1431, _1439);
    float _1447 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1441);
    float _1449 = 1.0 / _1443;
    float _1451 = fma(_1435, _1435, _1445);
    float _1453 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1447);
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1457 = rsqrt(_1451);
    float _1459 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1461 = _1455 + _1443;
    float _1463 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1465 = _1051 + _1463;
    float _1467 = _1461 * _1449;
    float _1469 = _1467 * 0.5;
    float _1471 = floor(_1459);
    float _1473 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1477 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1475);
    float _1479 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1481 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1473);
    float _1483 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1485 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1479);
    float _1487 = 1.0 / _1477;
    float _1489 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1481);
    float _1491 = _1431 * _1483;
    float _1493 = _1435 * _1483;
    float _1495 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1485);
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1499 = _1491 * _1491;
    float _1501 = _1493 * _1493;
    float _1503 = _1495 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1505 = trunc(_1497);
    int _1507 = int(_1505);
    float _1509 = -_1471;
    float _1511 = _1459 + _1509;
    float _1513 = _1499 + _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1487 * _1515;
    float _1519 = sqrt(_1513);
    bool _1521 = _1517 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1523 = _1517 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1525 = trunc(_1503);
    int _1527 = int(_1525);
    int _1529 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1531 = _1507 + _1529;
    int _1533 = _1531 + 1;
    bool _1535 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1539 = _1519 + _1537;
    int _1541 = 2;
    float _1543 = _1513;
    float _1545 = _1539;
    float _1547 = _1483;
    float _1549 = _1491;
    float _1551 = _1499;
    if (!_1521)
    {
        _1541 = 1;
    }
    int _1553 = _1541;
    float _1555 = sqrt(_1451);
    int _1557 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1559 = _1527 + _1557;
    int _1561 = _1559 + 1;
    float _1563 = _1463;
    int _1565 = _1553;
    if (_1535)
    {
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1563 = _1567;
    }
    float _1569 = _1563;
    if (_1535)
    {
        float _1571 = rsqrt(_1513);
        _1543 = _1571;
    }
    float _1573 = _1543;
    float _1575 = _1573;
    if (_1535)
    {
        float _1577 = _1539 * _1569;
        _1545 = _1577;
    }
    float _1579 = _1545;
    float _1581 = 0.0;
    if (_1535)
    {
        float _1583 = _1579 * 0.15915493667125701904296875;
        _1581 = _1583;
    }
    float _1585 = _1581;
    bool _1587 = !_1521;
    int _1589 = _1587 ? 0 : 1;
    float _1591 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1593 = _1489;
    if (_1535)
    {
        float _1595 = _1585 * 6.283185482025146484375;
        float _1597 = sin(_1595);
        _1593 = _1597;
    }
    float _1599 = _1593;
    if (!_1523)
    {
        _1565 = _1589;
    }
    int _1601 = _1565;
    float _1603 = precise::max(0.0, _1591);
    int _1605 = _1601 << 6;
    bool _1607 = _1533 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1609 = -_1483;
    float _1611 = -_1603;
    float _1613 = fma(_1427, _1609, _1611);
    int _1615 = _1605 + 96;
    uint _1618 = uint(int(uint(_1615) >> uint(2)));
    uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
    int _1622 = int(_1618) & 3;
    float _1624 = (*spvDescriptorSet0.vp_c15)._m0[int(_1620)][_1622];
    int _1626 = int(_1618) + 1;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    int _1630 = _1626 & 3;
    float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
    int _1634 = _1533 | _1561;
    float _1636 = _1585;
    float _1638 = as_type<float>(_1634);
    float _1640 = _1613;
    if (_1535)
    {
        float _1642 = _1585 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        _1636 = _1644;
    }
    float _1646 = _1636;
    if (_1535)
    {
        float _1648 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1547 = _1648;
    }
    float _1650 = _1547;
    bool _1652 = _1634 < 0;
    bool _1654 = _1652 || _1607;
    if (_1535)
    {
        float _1656 = fma(_1599, _1650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1638 = _1656;
    }
    float _1658 = _1638;
    int _1660 = _1605 + 48;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    uint _1664 = uint(int(uint(int(_1662)) >> uint(2)));
    int _1666 = int(_1662) & 3;
    float _1668 = (*spvDescriptorSet0.vp_c15)._m0[int(_1664)][_1666];
    int _1670 = int(_1662) + 1;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    int _1674 = _1670 & 3;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
    float _1678 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = 0.0;
    if (_1535)
    {
        float _1684 = _1573 * _1658;
        _1682 = _1684;
    }
    float _1686 = _1682;
    bool _1688 = _1561 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1690 = _1688 || _1654;
    float _1692 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1694 = floor(_1680);
    if (_1535)
    {
        float _1696 = _1491 * _1686;
        _1549 = _1696;
    }
    float _1698 = _1549;
    int _1700 = _1605 + 104;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
    float _1718 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1720 = _1646;
    if (_1535)
    {
        float _1722 = _1646 + (-1.0);
        _1575 = _1722;
    }
    float _1724 = _1575;
    float _1726 = _1724;
    if (_1535)
    {
        float _1728 = _1698 * _1698;
        _1551 = _1728;
    }
    float _1730 = _1551;
    float _1732 = 0.0;
    if (_1535)
    {
        float _1734 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1734;
    }
    float _1736 = _1732;
    if (!_1535)
    {
        _1726 = _1493;
    }
    float _1738 = _1726;
    int _1740 = _1605 + 64;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[int(_1752)][_1754];
    float _1758 = _1738;
    if (_1535)
    {
        float _1760 = _1493 * _1686;
        _1758 = _1760;
    }
    float _1762 = _1758;
    if (_1535)
    {
        float _1764 = fma(_1613, _1646, _1736);
        _1640 = _1764;
    }
    float _1766 = _1640;
    float _1768 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1770 = 0.0;
    if (!_1690)
    {
        float _1772 = floor(_1503);
        _1770 = _1772;
    }
    float _1774 = _1770;
    if (!_1535)
    {
        _1720 = _1501;
    }
    float _1776 = _1720;
    float _1778 = _1776;
    if (_1535)
    {
        float _1780 = _1762 * _1762;
        _1778 = _1780;
    }
    float _1782 = _1778;
    float _1784 = fma(_1766, _1766, _1730);
    int _1786 = _1605 + 80;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[int(_1798)][_1800];
    float _1804 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1806 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1808 = _1784 + _1782;
    float _1810 = -_1694;
    float _1812 = _1680 + _1810;
    float _1814 = -_1806;
    float _1816 = fma(_1814, _1804, 1.0);
    int _1818 = as_type<int>(_1806);
    if (!_1690)
    {
        int _1820 = _1561 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1822 = _1820 + _1533;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1605 + 56;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c15)._m0[int(_1838)][_1840];
    float _1844 = log2(_1816);
    int _1846 = _1605 + 88;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    float _1864 = _1465 * _1632;
    float _1866 = fma(_1003, _1624, _1864);
    int _1868 = _1605 + 72;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    float _1886 = _1465 * _1676;
    float _1888 = rsqrt(_1808);
    float _1890 = _1844 * 0.693147182464599609375;
    float _1892 = fma(_1003, _1668, _1886);
    int _1894 = as_type<int>(_1886);
    int _1896 = as_type<int>(_1624);
    if (!_1690)
    {
        int _1898 = _1824 << 2;
        _1894 = _1898;
    }
    int _1900 = _1894;
    float _1902 = fma(_897, _1708, _1866);
    int _1904 = _1900;
    float _1906 = _1756;
    int _1908 = as_type<int>(_1802);
    if (!_1690)
    {
        int _1910 = 12 & _1900;
        _1904 = _1910;
    }
    int _1912 = _1904;
    float _1914 = _1902 + _1716;
    float2 _5685 = float2(_1511, _1812);
    float _1916 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5685, float2(0.0), isnan(_5685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5685, float2(0.0), isnan(_5685)), level(0.0)).x;
    float _1918 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1920 = _1465 * _1756;
    if (!_1690)
    {
        float _1922 = -_1774;
        float _1924 = _1503 + _1922;
        _1906 = _1924;
    }
    float _1926 = _1906;
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1930 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1928);
    float _1932 = precise::clamp(_1930, 0.0, 1.0);
    float _1934 = _1888 * _1698;
    float _1936 = fma(_1003, _1748, _1920);
    float _1938 = _1888 * _1766;
    float _1940 = _1888 * _1762;
    float _1942 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1944 = _1465 * _1802;
    if (!_1690)
    {
        uint _1946 = uint(int(uint(_1824) >> uint(2)));
        _1908 = int(_1946);
    }
    int _1948 = _1908;
    float _1950 = fma(_1003, _1794, _1944);
    float _1952 = -_1932;
    float _1954 = _1952 + 1.0;
    if (!_1690)
    {
        int _1956 = _1948 << 4;
        int _1958 = _1956 + _1912;
        _1896 = _1958;
    }
    int _1960 = _1896;
    float _1962 = fma(_897, _1834, _1892);
    float _1964 = 1.0 / _1914;
    float _1966 = _1932;
    if (!_1690)
    {
        int _1968 = _1960 + 400;
        uint _1970 = uint(int(uint(_1968) >> uint(2)));
        uint _1972 = uint(int(uint(int(_1970)) >> uint(2)));
        int _1974 = int(_1970) & 3;
        float _1976 = (*spvDescriptorSet0.vp_c15)._m0[int(_1972)][_1974];
        _1966 = _1976;
    }
    float _1978 = _1966;
    float _1980 = _1962 + _1842;
    float _1982 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1984 = fma(_897, _1854, _1950);
    float _1986 = -_1942;
    float _1988 = fma(_1938, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1986);
    float _1990 = abs(_1954);
    float _1992 = log2(_1990);
    float _1994 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1996 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1982);
    float _1998 = -_1940;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1988);
    float _2002 = _1938 + 1.0;
    float _2004 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1994);
    float _2006 = fma(_897, _1876, _1936);
    float _2008 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1996);
    float _2010 = _1980 * _1964;
    float _2012 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2004);
    float _2014 = _2006 + _1884;
    float _2016 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2018 = fma(_2000, -0.5, 0.5);
    bool _2020 = _2010 >= 0.0;
    float _2022 = _2014 * _1964;
    float _2024 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2016);
    float _2026 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2028 = _2010 <= 1.0;
    bool _2030 = _2028 && _2020;
    float _2032 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2034 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2024);
    float _2036 = exp2(_2026);
    bool _2038 = _2022 >= 0.0;
    bool _2040 = _2038 && _2030;
    float _2042 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2044 = _2034 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = fma(_2000, 0.5, 0.5);
    bool _2048 = _2022 <= 1.0;
    bool _2050 = _2048 && _2040;
    float _2052 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2042);
    float _2056 = sqrt(_2018);
    float _2058 = _1984 + _1862;
    float _2060 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2062 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2064 = fma(_2046, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2060);
    float _2068 = -_1938;
    float _2070 = fma(_2036, _2002, _2068);
    float _2072 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2062);
    float _2074 = _2002;
    if (_2050)
    {
        float _2076 = float(_1601);
        _2074 = _2076;
    }
    float _2078 = _2074;
    float _2080 = fma(_2046, _2064, -0.212114393711090087890625);
    float _2082 = 1.0 / _2066;
    float _2084 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2070, 0.5, 0.5);
    float _2088 = fma(_2046, _2080, 1.570728778839111328125);
    float _2090 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2072);
    float _2092 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = _2056 * 0.636619746685028076171875;
    float _2096 = _2058 * _1964;
    float _2098 = _2078;
    if (_2050)
    {
        float _2100 = rint(_2078);
        float _2102 = precise::max(_2100, 0.0);
        uint _2104 = uint(_2102);
        uint _2106 = clamp(_2104, 0u, 65535u);
        _2098 = as_type<float>(_2106);
    }
    float _2108 = _2098;
    float _2110 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2112 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2090);
    float _2114 = -_2088;
    float _2116 = fma(_2094, _2114, 1.0);
    float _2118 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2110);
    float _2120 = _2008;
    if (!_1690)
    {
        float _2122 = floor(_1497);
        _2120 = _2122;
    }
    float _2124 = _2120;
    float _2126 = _2112 * _2082;
    float _2128 = _2118 * _2082;
    float _2130 = fma(_2126, 0.5, 0.5);
    float _2132 = fma(_2128, -0.5, 0.5);
    float _2134 = _2108;
    if (_2050)
    {
        float3 _6071 = float3(_2010, _2022, float(as_type<int>(_2108)));
        float3 _6075 = select(_6071, float3(0.0), isnan(_6071));
        float _2136 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6075.xy, uint(rint(_6075.z)), _2096, level(0.0));
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = _1964;
    if (!_1690)
    {
        float _2142 = rint(_1978);
        float _2144 = precise::max(_2142, 0.0);
        uint _2146 = uint(_2144);
        uint _2148 = clamp(_2146, 0u, 65535u);
        _2140 = as_type<float>(_2148);
    }
    float _2150 = _2140;
    float3 _6101 = float3(_2130, _2132, _1918);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6101, float3(0.0), isnan(_6101)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6101, float3(0.0), isnan(_6101)), level(0.0)).x;
    float _2154 = _2124;
    if (!_1690)
    {
        float _2156 = -_2124;
        float _2158 = _1497 + _2156;
        _2154 = _2158;
    }
    float _2160 = _2154;
    float3 _6122 = float3(_2130, _2132, _1918);
    float4 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6122, float3(0.0), isnan(_6122)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6122, float3(0.0), isnan(_6122)), level(0.0)).xyzw;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = _2163.w;
    float2 _6138 = float2(_2116, _2086);
    float3 _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6138, float2(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6138, float2(0.0), isnan(_6138)), level(0.0)).xyz;
    float _2177 = _2175.x;
    float _2179 = _2175.y;
    float _2181 = _2175.z;
    float _2183 = _2150;
    float _2185 = _2160;
    if (!_1690)
    {
        float3 _6160 = float3(_2160, _1926, float(as_type<int>(_2150)));
        float3 _6162 = select(_6160, float3(0.0), isnan(_6160));
        float _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6162.xy, uint(rint(_6162.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6162.xy, uint(rint(_6162.z)), level(0.0)).x;
        _2183 = _2187;
    }
    float _2189 = _2183;
    float _2191 = abs(_1517);
    float _2193 = log2(_2191);
    float _2195 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2197 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2195);
    float _2199 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2197);
    bool _2201 = _1517 <= 8000.0;
    bool _2203 = isnan(_1517);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(8000.0);
    bool _2209 = _2205 || _2207;
    float _2211 = float(_2209);
    float _2213 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2199);
    float _2215 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2219 = _2112;
    float _2221 = _2213;
    if (!_2050)
    {
        _2185 = 1.0;
    }
    float _2223 = _2185;
    out.gl_Position.x = _2112;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _2066;
    float _2225 = exp2(_2215);
    float _2227 = exp2(_2217);
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = fma(_2231, -2.0, 3.0);
    float _2235 = _2231 * _2231;
    float _2237 = _2235 * _2233;
    float _2239 = _2213 + _2066;
    float _2241 = _2239 * 0.5;
    float _2243 = -_2237;
    float _2245 = _2243 + 1.0;
    out.m_86.z = _2241;
    out.m_86.w = _2066;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2237);
    float _2249 = -_2225;
    float _2251 = _2249 + 1.0;
    float _2253 = _2211 * _2247;
    float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2257 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2259 = -_1916;
    float _2261 = _2259 + 1.0;
    float _2263 = _2223;
    float _2265 = _2257;
    if (_2050)
    {
        bool _2267 = _2138 >= _2096;
        bool _2269 = isnan(_2138);
        bool _2271 = _2267 || _2269;
        bool _2273 = isnan(_2096);
        bool _2275 = _2271 || _2273;
        float _2277 = float(_2275);
        _2263 = _2277;
    }
    float _2279 = _2263;
    float _2281 = _2261 * _2257;
    float _2283 = precise::clamp(_2281, 0.0, 1.0);
    if (_1690)
    {
        _2265 = 1.0;
    }
    float _2285 = _2265;
    float _2287 = _2285;
    if (!_1690)
    {
        int _2289 = _1824 << 4;
        int _2291 = _2289 + 2048;
        uint _2293 = uint(int(uint(_2291) >> uint(2)));
        uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
        int _2297 = int(_2293) & 3;
        float _2299 = (*spvDescriptorSet0.vp_c15)._m0[int(_2295)][_2297];
        int _2301 = int(_2293) + 1;
        uint _2303 = uint(int(uint(_2301) >> uint(2)));
        int _2305 = _2301 & 3;
        float _2307 = (*spvDescriptorSet0.vp_c15)._m0[int(_2303)][_2305];
        int _2309 = _2291 + 8;
        uint _2311 = uint(int(uint(_2309) >> uint(2)));
        uint _2313 = uint(int(uint(int(_2311)) >> uint(2)));
        int _2315 = int(_2311) & 3;
        float _2317 = (*spvDescriptorSet0.vp_c15)._m0[int(_2313)][_2315];
        int _2319 = int(_2311) + 1;
        uint _2321 = uint(int(uint(_2319) >> uint(2)));
        int _2323 = _2319 & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        float _2327 = _1465 * _2307;
        float _2329 = fma(_1003, _2299, _2327);
        float _2331 = fma(_897, _2317, _2329);
        float _2333 = _2331 + _2325;
        float _2335 = precise::clamp(_2333, 0.0, 1.0);
        float _2337 = -_2335;
        float _2339 = _2337 + _2189;
        float _2341 = fma(_2339, 500.0, 1.5);
        float _2343 = exp2(_2341);
        float _2345 = 0.0 + _2343;
        float _2347 = precise::clamp(_2345, 0.0, 1.0);
        _2287 = _2347;
        _2219 = _2317;
    }
    float _2349 = _2287;
    float _2351 = _2219;
    float _2353 = _2279 * _2349;
    float _2355 = -_2283;
    float _2357 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2359 = _2255 * _2152;
    out.m_88.x = _1419;
    out.m_88.y = _1417;
    out.m_88.z = _1421;
    bool _2361 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2363 = isnan(_1555);
    bool _2365 = _2361 || _2363;
    bool _2367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2369 = _2365 || _2367;
    float _2371 = -_2353;
    float _2373 = fma(_2371, _2357, 1.0);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = _2171 * _2359;
    float _2379 = -_2255;
    float _2381 = _2379 + 1.0;
    float _2383 = _2181 * _2359;
    float _2385 = _2375 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2387 = fma(_2177, _2377, _2165);
    float _2389 = fma(_2179, _2377, _2167);
    float _2391 = _2171 * _2381;
    float _2393 = fma(_2171, _2383, _2169);
    out.m_90.x = _2385;
    float _2395 = _2351;
    float _2397 = _2381;
    float _2399 = _2377;
    float _2401 = _2375;
    if (!_2369)
    {
        _2221 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2403 = _2221;
    out.m_92.x = _2387;
    out.m_92.y = _2389;
    out.m_92.z = _2393;
    out.m_92.w = _2391;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2369)
    {
        _2395 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2409 = _2395;
    float _2411 = _2409;
    float _2413 = _2409;
    if (!_2369)
    {
        _2397 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2415 = _2397;
    float _2417 = _2415;
    float _2419 = _2415;
    if (!_2369)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2421 = _1119;
    float _2423 = _2421;
    float _2425 = _2421;
    if (!_2369)
    {
        _2399 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2427 = _2399;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2369)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2433 = _2401;
    bool _2435 = !_2369;
    float _2437 = _2433;
    float _2439 = _2433;
    if (!_2435)
    {
        bool _2441 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2443 = isnan(_1555);
        bool _2445 = _2441 || _2443;
        bool _2447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2449 = _2445 || _2447;
        if (!_2449)
        {
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2453 = _1555 + _2451;
            float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2457 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2455;
            float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2463 = 1.0 / _2457;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2471 = _2469 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2481 = _2453 * _2463;
            float _2483 = precise::clamp(_2481, 0.0, 1.0);
            float _2485 = fma(_2483, _2461, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2487 = fma(_2483, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2493 = fma(_2483, _2471, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2495 = fma(_2483, _2475, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2497 = fma(_2483, _2479, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2499 = fma(_2483, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2413 = _2487;
            _2431 = _2495;
            _2407 = _2485;
            _2425 = _2493;
            _2419 = _2499;
            _2439 = _2497;
            _2501 = true;
        }
        else
        {
            bool _2503 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2505 = isnan(_1555);
            bool _2507 = _2503 || _2505;
            bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2511 = _2507 || _2509;
            if (!_2511)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2513 = _2405;
            _2407 = _2513;
            if (!_2511)
            {
                _2411 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2515 = _2411;
            _2413 = _2515;
            if (!_2511)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2517 = _2417;
            _2419 = _2517;
            if (!_2511)
            {
                _2423 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2519 = _2423;
            _2425 = _2519;
            if (!_2511)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2521 = _2429;
            _2431 = _2521;
            if (!_2511)
            {
                _2437 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2523 = _2437;
            bool _2525 = !_2511;
            _2439 = _2523;
            if (!_2525)
            {
                bool _2527 = _1555 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2529 = isnan(_1555);
                bool _2531 = _2527 || _2529;
                bool _2533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2535 = _2531 || _2533;
                if (!_2535)
                {
                    float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2539 = _1555 + _2537;
                    float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2543 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2541;
                    float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2549 = 1.0 / _2543;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2567 = _2539 * _2549;
                    float _2569 = precise::clamp(_2567, 0.0, 1.0);
                    float _2571 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2573 = fma(_2569, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2579 = fma(_2569, _2557, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2581 = fma(_2569, _2561, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2583 = fma(_2569, _2565, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2585 = fma(_2569, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2413 = _2573;
                    _2431 = _2581;
                    _2407 = _2571;
                    _2425 = _2579;
                    _2419 = _2585;
                    _2439 = _2583;
                    _2501 = true;
                }
                else
                {
                    _2413 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2425 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2439 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2501 = false;
    float _2587 = _2413;
    float _2589 = _2431;
    float _2591 = _2407;
    float _2593 = _2425;
    float _2595 = _2419;
    float _2597 = _2439;
    float _2599 = fma(_1321, -0.5, 0.5);
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = -_2587;
    float _2605 = _2603 + _2589;
    float _2607 = -_2591;
    float _2609 = _2607 + _2593;
    float _2611 = -_2595;
    float _2613 = _2611 + _2597;
    bool _2615 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2617 = fma(_2601, _2605, _2587);
    float _2619 = fma(_2601, _2609, _2591);
    float _2621 = fma(_2601, _2613, _2595);
    float _2623 = _2617 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _2625 = fma(_2619, 0.298911988735198974609375, _2623);
    float _2627 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2629 = fma(_2621, 0.114477999508380889892578125, _2625);
    out.m_61.x = _2627;
    float _2631 = -_2629;
    float _2633 = _2619 + _2631;
    float _2635 = -_2629;
    float _2637 = _2617 + _2635;
    float _2639 = -_2629;
    float _2641 = _2621 + _2639;
    float _2643 = fma(_2633, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    float _2645 = fma(_2637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    float _2647 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2629);
    out.m_96.x = _2643;
    out.m_96.y = _2645;
    out.m_96.z = _2647;
    if (!_2615)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2649 = -_1417;
    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2653 = -_1419;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2657 = -_1421;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2661 = _2651 * _2651;
    float _2663 = fma(_2655, _2655, _2661);
    float _2665 = fma(_2659, _2659, _2663);
    float _2667 = sqrt(_2665);
    float _2669 = rsqrt(_2665);
    float _2671 = -_2667;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2675 = _2673 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = _2655 * _2669;
    float _2681 = _2651 * _2669;
    float _2683 = abs(_2677);
    float _2685 = log2(_2683);
    float _2687 = _2659 * _2669;
    float _2689 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2691 = _1321 * _2681;
    float _2693 = -_2681;
    float _2695 = -_2689;
    float _2697 = fma(_2693, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2695);
    float _2699 = fma(_1319, _2679, _2691);
    float _2701 = -_2687;
    float _2703 = fma(_2701, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2697);
    float _2705 = fma(_1323, _2687, _2699);
    float _2707 = precise::clamp(_2705, 0.0, 1.0);
    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2711 = _2703 + _2709;
    float _2713 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2715 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2717 = precise::clamp(_2715, 0.0, 1.0);
    float _2719 = exp2(_2713);
    float _2721 = _2719 * _2717;
    float _2723 = _2707 * _2721;
    float _2725 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2727 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2729 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2725;
    out.m_94.y = _2727;
    out.m_94.z = _2729;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

