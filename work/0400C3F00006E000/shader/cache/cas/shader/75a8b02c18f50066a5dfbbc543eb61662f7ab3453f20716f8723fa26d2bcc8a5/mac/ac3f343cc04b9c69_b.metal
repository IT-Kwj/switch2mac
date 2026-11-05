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
    float4 m_84 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_78 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2529 = false;
    bool _1170 = false;
    bool _211 = false;
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
        float _2834 = as_type<float>(_131);
        out.gl_Position.z = _2834;
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
        float _2903 = as_type<float>(_169);
        out.gl_Position.z = _2903;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_68.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_68.z;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _219 + _223;
    float _227 = in.m_68.x;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = in.m_68.y;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _231;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _251 = _249 != 0;
    float _253 = 1.0 / _235;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = _219 + _255;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _261 = _259 != 0;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _269 = _267 != 0;
    float _271 = _221 * 2.0;
    float _273 = 1.0 / _241;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _219 + _275;
    float _279 = _227 * 2.0;
    float _281 = _257 * _243;
    float _283 = _237 * 2.0;
    float _285 = _227 + _237;
    float _287 = _277 * _253;
    float _289 = floor(_271);
    float _291 = _237 + _221;
    float _293 = _291 + (-1.0);
    float _295 = _225 * _273;
    float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _299 = log2(_297);
    float _301 = _227 + _221;
    float _303 = _301 + (-1.0);
    float _305 = _285 + (-1.0);
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _309 = floor(_279);
    bool _311 = _289 > 0.0;
    float _313 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _315 = _289 >= 0.0;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan(0.0);
    bool _323 = _319 || _321;
    float _325 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _327 = _323 ? 0 : 1;
    float _329 = floor(_283);
    float _331 = _299 * _149;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    int _337 = ~_327;
    int _339 = _337 + 1;
    int _341 = _339 + 1;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _345 = 1.0 + _343;
    bool _347 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_219);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = fma(_335, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _361 = _341;
    if (!_311)
    {
        int _363 = ~_327;
        int _365 = _363 + 1;
        _361 = _365;
    }
    int _367 = _361;
    float _369 = exp2(_331);
    bool _371 = _309 >= 0.0;
    bool _373 = isnan(_309);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    bool _385 = !_261;
    int _387 = _385 ? 0 : 1;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    int _393 = _379 ? 0 : 1;
    float _395 = fma(_383, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _397 = _309 > 0.0;
    float _399 = 1.0 / _345;
    bool _401 = _329 > 0.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _407 = _329 >= 0.0;
    bool _409 = isnan(_329);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _421 = !_265;
    int _423 = _421 ? 0 : 1;
    float _425 = fma(_405, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _427 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _429 = isnan(_219);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -_369;
    float _441 = _439 + 1.0;
    bool _443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _451 = _447 || _449;
    float _453 = fma(_419, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _455 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _457 = isnan(_219);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _437 * _391;
    float _469 = _451 ? _441 : 0.0;
    float _471 = -_437;
    float _473 = _471 + 1.0;
    bool _475 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _477 = isnan(1.0);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _483 = _479 || _481;
    float _485 = in.m_70.x;
    float _487 = in.m_70.y;
    float _489 = in.m_70.z;
    bool _491 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _493 = isnan(_219);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _465 * _473;
    float _505 = -_465;
    float _507 = _505 + 1.0;
    int _509 = abs(_387);
    int _511 = abs(_423);
    float _513 = _501 * _507;
    int _515 = _415 ? 0 : 1;
    float _517 = -_501;
    float _519 = _517 + 1.0;
    float _521 = _395 * _513;
    if (_483)
    {
        float _523 = _469 * _399;
        _153 = _523;
    }
    float _525 = _153;
    float _527 = float(_509);
    float _529 = float(_367);
    float _531 = _359 * _513;
    int _533 = ~_393;
    int _535 = _533 + 1;
    int _537 = _535 + 1;
    int _539 = _537;
    if (!_397)
    {
        int _541 = ~_393;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    float _547 = _527 * _529;
    float _549 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].y, _531);
    bool _551 = !_269;
    int _553 = _551 ? 0 : 1;
    float _555 = float(_511);
    float _557 = fma(_453, _503, _549);
    float _559 = float(_545);
    float _561 = _547 * (-2.0);
    float _563 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _565 = abs(_553);
    float _567 = fma(_325, _561, _325);
    int _569 = ~_515;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = fma(_561, _485, _485);
    int _577 = _573;
    if (!_401)
    {
        int _579 = ~_515;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = _563 * _227;
    float _587 = _555 * _559;
    bool _589 = _227 > 0.5;
    float _591 = _227 + (-0.5);
    float _593 = float(_565);
    float _595 = _587 * (-2.0);
    float _597 = float(_583);
    float _599 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[196].x, _575);
    bool _601 = _237 > 0.5;
    float _603 = _237 + (-0.5);
    float _605 = fma(_595, _487, _487);
    float _607 = _593 * _597;
    float _609 = fma(_567, _525, _599);
    float _611 = fma(_307, _595, _307);
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _605);
    float _615 = _607 * (-2.0);
    float _617 = _609 * 0.15915493667125701904296875;
    float _619 = in.m_58.x;
    float _621 = in.m_58.y;
    float _623 = in.m_58.z;
    float _625 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _627 = fma(_313, _615, _313);
    float _629 = in.m_72.x;
    float _631 = in.m_72.y;
    float _633 = in.m_72.z;
    float _635 = fma(_615, _489, _489);
    float _637 = fma(_611, _525, _613);
    float _639 = _221 + (-0.5);
    float _641 = in.m_74.x;
    float _643 = in.m_74.y;
    float _645 = in.m_74.z;
    float _647 = _637 * 0.15915493667125701904296875;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _649;
    float _653 = in.m_76.x;
    float _655 = in.m_76.y;
    float _657 = in.m_76.z;
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].z, _635);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _661;
    float _665 = fma(_651, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _667 = in.m_78.x;
    float _669 = in.m_78.y;
    float _671 = fma(_425, _503, _625);
    float _673 = fma(_627, _525, _659);
    float _675 = fma(_663, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _677 = _617 * 6.283185482025146484375;
    float _679 = sin(_677);
    float _681 = fma(_665, _467, _671);
    float _683 = _673 * 0.15915493667125701904296875;
    float _685 = fma(_675, _467, _557);
    float _687 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _685);
    float _689 = _621 * _631;
    float _691 = _617 * 6.283185482025146484375;
    float _693 = cos(_691);
    float _695 = _621 * _643;
    float _697 = fma(_619, _629, _689);
    float _699 = _621 * _655;
    float _701 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _681);
    float _703 = _647 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = fma(_619, _641, _695);
    float _709 = _687 * _669;
    float _711 = _701 * _667;
    float _713 = fma(_619, _653, _699);
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = _647 * 6.283185482025146484375;
    float _723 = cos(_721);
    float _725 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _727 = fma(_623, _645, _707);
    float _729 = _719 * _715;
    float _731 = fma(_623, _633, _697);
    float _733 = _725 * _717;
    float _735 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _737 = _727 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _739 = _683 * 6.283185482025146484375;
    float _741 = cos(_739);
    float _743 = _679 * _705;
    float _745 = _693 * _705;
    float _747 = _731 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _749 = _683 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _693 * _723;
    float _755 = _679 * _723;
    float _757 = _693 * _741;
    float _759 = _679 * _741;
    float _761 = _723 * _741;
    float _763 = _705 * _741;
    float _765 = _757 * _729;
    float _767 = _759 * _729;
    float _769 = trunc(_585);
    int _771 = int(_769);
    float _773 = _757 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _775 = fma(_751, _753, _743);
    float _777 = -_729;
    float _779 = _751 * _777;
    float _781 = -_755;
    float _783 = fma(_751, _745, _781);
    float _785 = -_745;
    float _787 = fma(_751, _755, _785);
    float _789 = fma(_775, _733, _765);
    float _791 = fma(_761, _733, _779);
    float _793 = fma(_751, _743, _753);
    float _795 = fma(_787, _733, _767);
    float _797 = fma(_783, _735, _789);
    float _799 = fma(_763, _735, _791);
    float _801 = fma(_623, _657, _713);
    float _803 = fma(_793, _735, _795);
    float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _807 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _809 = _801 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _811 = _757 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _805);
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _807);
    float _817 = _757 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _819 = -_751;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].x, _811);
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _825 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _827 = -_751;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _773);
    float _831 = -_751;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _817);
    float _835 = _823 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _837 = _825 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _839 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _821);
    float _841 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _843 = _747 + _835;
    float _845 = _809 + _837;
    float _847 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _833);
    float _849 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _853 = _843 + _851;
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _857 = _845 + _855;
    float _859 = _775 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _775 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _863 = _853 * _853;
    float _865 = _857 * _857;
    float _867 = _775 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _869 = -_189;
    int _871 = _601 ? as_type<int>(_869) : as_type<int>(_189);
    float _873 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _875 = _863 + _865;
    float _877 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _879 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _881 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _849);
    float _883 = sqrt(_875);
    bool _885 = !_251;
    float _887 = _885 ? _189 : as_type<float>(_871);
    float _889 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _891 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _881);
    float _893 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    int _895 = _771 << 4;
    int _897 = _895 + 1712;
    float _899 = _889 * _839;
    float _901 = _889 * _841;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _905 = _889 * _847;
    float _907 = _891 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].x, _861);
    float _911 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _867);
    int _913 = _897 + 8;
    uint _916 = uint(int(uint(_913) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    float _924 = _737 + _907;
    float _926 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _873);
    bool _928 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _893);
    float _932 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _909);
    float _934 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _911);
    float _936 = -_185;
    int _938 = _589 ? as_type<int>(_936) : as_type<int>(_185);
    uint _940 = uint(int(uint(_897) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    float _956 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _877);
    float _958 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _879);
    float _960 = _787;
    float _962 = _907;
    float _964 = _911;
    float _966 = _863;
    float _968 = _865;
    float _970 = _617;
    if (!_928)
    {
        _960 = _843;
    }
    float _972 = _960;
    float _974 = _972;
    if (!_928)
    {
        _962 = _845;
    }
    float _976 = _962;
    float _978 = _976;
    if (!_928)
    {
        _964 = _924;
    }
    float _980 = _964;
    bool _982 = !_928;
    float _984 = _980;
    float _986 = _903;
    if (!_982)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _883 + _990;
        float _994 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = rsqrt(_875);
        float _998 = _992 * _988;
        float _1000 = _998 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _996 * _1010;
        float _1014 = fma(_853, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = _1008 + (-1.0);
        float _1018 = fma(_857, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1022 = _1014 + _1020;
        float _1024 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1028 = _1018 + _1026;
        float _1030 = _1022 * _1022;
        float _1032 = fma(_924, _1008, _1024);
        float _1034 = _1028 * _1028;
        _984 = _1032;
        _966 = _1030;
        _968 = _1034;
        _978 = _1018;
        _974 = _1014;
    }
    float _1036 = _984;
    float _1038 = _966;
    float _1040 = _968;
    float _1042 = _978;
    float _1044 = _974;
    float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1048 = !_247;
    float _1050 = _1048 ? _185 : as_type<float>(_938);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1054 = _1036 + _1052;
    float _1056 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1058 = -_887;
    float _1060 = _1058 + 0.5;
    float _1062 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[26].z, _958);
    float _1064 = fma(_1054, _1054, _1038);
    float _1066 = fma(_1056, _930, _899);
    float _1068 = fma(_1056, _932, _901);
    float _1070 = fma(_1056, _934, _905);
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1074 = _1064 + _1040;
    float _1076 = _1050 + 0.5;
    float _1078 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[24].z, _926);
    float _1080 = _1072 * _1046;
    float _1082 = sqrt(_1074);
    float _1084 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[25].z, _956);
    float _1086 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1088 = _922 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1092 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1090 * _903;
    float _1106 = _1078 + _1066;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1110 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1084 + _1068;
    float _1120 = _1062 + _1070;
    out.m_80.x = _1104;
    out.m_80.y = _1080;
    bool _1122 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1124 = isnan(_1082);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1130 = _1126 || _1128;
    out.m_82.x = _1110;
    out.m_82.y = _1112;
    out.m_82.z = _1114;
    out.m_84.x = _1116;
    out.m_84.y = _1100;
    out.m_84.z = _1102;
    out.m_84.w = _1108;
    out.m_86.x = _1106;
    out.m_86.y = _1118;
    out.m_86.z = _1120;
    float _1132 = _1042;
    int _1134 = as_type<int>(_1044);
    if (!_1130)
    {
        _986 = 1.0;
    }
    float _1136 = _986;
    bool _1138 = !_1130;
    float _1140 = _1136;
    if (!_1138)
    {
        bool _1142 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1144 = isnan(_1082);
        bool _1146 = _1142 || _1144;
        bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1150 = _1146 || _1148;
        if (!_1150)
        {
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = _1082 + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1158 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1156;
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1162 = _1160 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1164 = 1.0 / _1158;
            float _1166 = _1154 * _1164;
            float _1168 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1140 = _1168;
            _1170 = true;
        }
        else
        {
            bool _1172 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1174 = isnan(_1082);
            bool _1176 = _1172 || _1174;
            bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1180 = _1176 || _1178;
            if (!_1180)
            {
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1082 + _1182;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1194 = 1.0 / _1188;
                float _1196 = _1184 * _1194;
                float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1140 = _1198;
                _1170 = true;
            }
            else
            {
                _1140 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1170 = false;
    float _1200 = _1140;
    float _1202 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1204 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1206 = floor(_1202);
    float _1208 = floor(_1204);
    float _1210 = -_1206;
    float _1212 = _1202 + _1210;
    float _1214 = -_1208;
    float _1216 = _1204 + _1214;
    float2 _4583 = float2(_1212, _1216);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4583, float2(0.0), isnan(_4583)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4583, float2(0.0), isnan(_4583)), level(0.0)).x;
    float _1220 = _737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1036 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1228 = _1042 + _1226;
    float _1230 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1220);
    float _1232 = fma(_1228, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1234 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1230);
    float _1236 = _737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1240 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1242 = 1.0 / _1238;
    float _1244 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1240);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _1246 + _1238;
    float _1250 = _1248 * _1242;
    float _1252 = _1250 * 0.5;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1256 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1254);
    float _1258 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1260 = _737 + _1258;
    float _1262 = 1.0 / _1256;
    float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1268 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1264);
    float _1270 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1266);
    float _1272 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1268);
    float _1274 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1270);
    float _1276 = _1272 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1280 = _1262 * _1278;
    float _1282 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1284 = trunc(_1276);
    int _1286 = int(_1284);
    bool _1288 = _1280 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1290 = _1280 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1292 = !_1288;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = trunc(_1282);
    int _1298 = int(_1296);
    int _1300 = 2;
    int _1302 = as_type<int>(_1228);
    int _1304 = as_type<int>(_1200);
    if (!_1288)
    {
        _1300 = 1;
    }
    int _1306 = _1300;
    int _1308 = _1306;
    if (!_1290)
    {
        _1308 = _1294;
    }
    int _1310 = _1308;
    int _1312 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1314 = _1286 + _1312;
    int _1316 = _1314 + 1;
    int _1318 = _1310 << 6;
    bool _1320 = _1316 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1322 = _1318 + 48;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    int _1340 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1342 = _1298 + _1340;
    int _1344 = _1342 + 1;
    float _1346 = fma(_1224, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _1348 = _1316 | _1344;
    int _1350 = _1318 + 56;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    bool _1368 = _1348 < 0;
    bool _1370 = _1368 || _1320;
    bool _1372 = _1344 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1374 = _1372 || _1370;
    bool _1376 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.5);
    bool _1384 = _1380 || _1382;
    int _1386 = _1318 + 64;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
    int _1392 = int(_1388) & 3;
    float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
    int _1396 = int(_1388) + 1;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    int _1400 = _1396 & 3;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1406 = _1044 + _1404;
    float _1408 = fma(_1406, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1410 = _1318 + 72;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c15)._m0[int(_1422)][_1424];
    float _1428 = _1406;
    float _1430 = as_type<float>(_1316);
    float _1432 = _1408;
    float _1434 = as_type<float>(_1310);
    if (!_1374)
    {
        int _1436 = _1344 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1438 = _1436 + _1316;
        _1302 = _1438;
    }
    int _1440 = _1302;
    float _1442 = as_type<float>(_1440);
    if (_1384)
    {
        _1132 = _1408;
    }
    float _1444 = _1132;
    float _1446 = _1444;
    if (_1384)
    {
        _1428 = _1346;
    }
    float _1448 = _1428;
    int _1450 = _1318 + 96;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
    int _1456 = int(_1452) & 3;
    float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
    int _1460 = int(_1452) + 1;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    int _1464 = _1460 & 3;
    float _1466 = (*spvDescriptorSet0.vp_c15)._m0[int(_1462)][_1464];
    float _1468 = _1448;
    if (_1384)
    {
        _1430 = _1232;
    }
    float _1470 = _1430;
    int _1472 = _1318 + 104;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
    int _1478 = int(_1474) & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = int(_1474) + 1;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    int _1486 = _1482 & 3;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
    float _1490 = _1470;
    int _1492 = as_type<int>(_1458);
    if (!_1384)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1496 = _737 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1500 = _747 + _1498;
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = -_747;
        float _1506 = _1504 + _1408;
        float _1508 = _1496 * _1496;
        float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1512 = _809 + _1510;
        float _1514 = -_809;
        float _1516 = _1514 + _1232;
        float _1518 = fma(_1500, _1500, _1508);
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1522 = fma(_1512, _1512, _1518);
        float _1524 = sqrt(_1522);
        float _1526 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1528 = precise::min(_1524, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1530 = _1528 * _1520;
        float _1532 = -_737;
        float _1534 = _1532 + _1346;
        float _1536 = _1526 * _1530;
        float _1538 = fma(_1534, _1536, _737);
        float _1540 = fma(_1506, _1536, _747);
        float _1542 = fma(_1516, _1536, _809);
        _1468 = _1538;
        _1446 = _1540;
        _1490 = _1542;
        _1304 = as_type<int>(_1502);
        _1134 = as_type<int>(_1534);
        _1432 = _1516;
    }
    float _1544 = _1468;
    float _1546 = _1446;
    float _1548 = _1490;
    int _1550 = _1304;
    int _1552 = _1134;
    float _1554 = _1432;
    float _1556 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1260 * _1466;
    int _1560 = _1550;
    int _1562 = _1552;
    if (!_1374)
    {
        int _1564 = _1440 << 2;
        _1560 = _1564;
    }
    int _1566 = _1560;
    float _1568 = _1260 * _1402;
    float _1570 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    float _1572 = fma(_747, _1458, _1558);
    if (!_1374)
    {
        uint _1574 = uint(int(uint(_1440) >> uint(2)));
        _1562 = int(_1574);
    }
    int _1576 = _1562;
    float _1578 = fma(_747, _1394, _1568);
    float _1580 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1570);
    if (!_1374)
    {
        int _1582 = 12 & _1566;
        _1492 = _1582;
    }
    int _1584 = _1492;
    float _1586 = fma(_809, _1480, _1572);
    float _1588 = _1260 * _1338;
    float _1590 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = as_type<float>(_1584);
    if (!_1374)
    {
        int _1594 = _1576 << 4;
        int _1596 = _1594 + _1584;
        _1592 = as_type<float>(_1596);
    }
    float _1598 = _1592;
    float _1600 = _1586 + _1488;
    int _1602 = _1318 + 80;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    uint _1606 = uint(int(uint(int(_1604)) >> uint(2)));
    int _1608 = int(_1604) & 3;
    float _1610 = (*spvDescriptorSet0.vp_c15)._m0[int(_1606)][_1608];
    int _1612 = int(_1604) + 1;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    int _1616 = _1612 & 3;
    float _1618 = (*spvDescriptorSet0.vp_c15)._m0[int(_1614)][_1616];
    float _1620 = fma(_747, _1330, _1588);
    float _1622 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1624 = 1.0 / _1600;
    float _1626 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = fma(_809, _1358, _1620);
    float _1630 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1632 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1634 = _1598;
    if (!_1374)
    {
        int _1636 = as_type<int>(_1598) + 400;
        uint _1638 = uint(int(uint(_1636) >> uint(2)));
        uint _1640 = uint(int(uint(int(_1638)) >> uint(2)));
        int _1642 = int(_1638) & 3;
        float _1644 = (*spvDescriptorSet0.vp_c15)._m0[int(_1640)][_1642];
        _1634 = _1644;
    }
    float _1646 = _1634;
    float _1648 = _1628 + _1366;
    float _1650 = -_1626;
    float _1652 = fma(_1650, _1622, 1.0);
    float _1654 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1630);
    float _1656 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1632);
    float _1658 = fma(_809, _1418, _1578);
    float _1660 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1654);
    int _1664 = _1318 + 88;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    uint _1668 = uint(int(uint(int(_1666)) >> uint(2)));
    int _1670 = int(_1666) & 3;
    float _1672 = (*spvDescriptorSet0.vp_c15)._m0[int(_1668)][_1670];
    int _1674 = int(_1666) + 1;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    int _1678 = _1674 & 3;
    float _1680 = (*spvDescriptorSet0.vp_c15)._m0[int(_1676)][_1678];
    float _1682 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1684 = _1658 + _1426;
    float _1686 = _1648 * _1624;
    float _1688 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1692 = _1684 * _1624;
    float _1694 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    bool _1696 = _1686 >= 0.0;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = log2(_1652);
    float _1702 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1694);
    bool _1704 = _1686 <= 1.0;
    bool _1706 = _1704 && _1696;
    float _1708 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1710 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1712 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1714 = _1692 >= 0.0;
    bool _1716 = _1714 && _1706;
    float _1718 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = _1652;
    if (!_1374)
    {
        float _1722 = floor(_1282);
        _1720 = _1722;
    }
    float _1724 = _1720;
    bool _1726 = _1692 <= 1.0;
    bool _1728 = _1726 && _1716;
    float _1730 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1732 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1710);
    float _1734 = 1.0 / _1730;
    float _1736 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1738 = _1700 * 0.693147182464599609375;
    float _1740 = _1260 * _1618;
    float _1742 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1554;
    float _1746 = _1736;
    if (!_1374)
    {
        float _1748 = floor(_1276);
        _1744 = _1748;
    }
    float _1750 = _1744;
    if (_1728)
    {
        float _1752 = float(_1310);
        _1434 = _1752;
    }
    float _1754 = _1434;
    float _1756 = fma(_747, _1610, _1740);
    float _1758 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1760 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1736);
    float _1762 = _1724;
    float _1764 = _1754;
    if (!_1374)
    {
        float _1766 = -_1724;
        float _1768 = _1282 + _1766;
        _970 = _1768;
    }
    float _1770 = _970;
    float _1772 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1758);
    float _1774 = _1646;
    if (!_1374)
    {
        float _1776 = rint(_1646);
        float _1778 = precise::max(_1776, 0.0);
        uint _1780 = uint(_1778);
        uint _1782 = clamp(_1780, 0u, 65535u);
        _1774 = as_type<float>(_1782);
    }
    float _1784 = _1774;
    float _1786 = _1760 * _1734;
    float _1788 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1772);
    float _1790 = fma(_1786, -0.5, 0.5);
    float _1792 = fma(_809, _1672, _1756);
    float _1794 = _1756;
    float _1796 = _1788;
    if (_1728)
    {
        float _1798 = rint(_1754);
        float _1800 = precise::max(_1798, 0.0);
        uint _1802 = uint(_1800);
        uint _1804 = clamp(_1802, 0u, 65535u);
        _1794 = as_type<float>(_1804);
    }
    float _1806 = _1794;
    if (!_1374)
    {
        float _1808 = -_1750;
        float _1810 = _1276 + _1808;
        _1762 = _1810;
    }
    float _1812 = _1762;
    float _1814 = _1792 + _1680;
    float _1816 = _1788 * _1734;
    float _1818 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = _1814 * _1624;
    float _1822 = fma(_1816, 0.5, 0.5);
    float _1824 = _1784;
    if (!_1374)
    {
        float3 _5622 = float3(_1812, _1770, float(as_type<int>(_1784)));
        float3 _5626 = select(_5622, float3(0.0), isnan(_5622));
        float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5626.xy, uint(rint(_5626.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5626.xy, uint(rint(_5626.z)), level(0.0)).x;
        _1824 = _1826;
    }
    float _1828 = _1824;
    float _1830 = _1692;
    if (_1728)
    {
        float3 _5641 = float3(_1686, _1692, float(as_type<int>(_1806)));
        float3 _5643 = select(_5641, float3(0.0), isnan(_5641));
        float _1832 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5643.xy, uint(rint(_5643.z)), _1820, level(0.0));
        _1830 = _1832;
    }
    float _1834 = _1830;
    float3 _5653 = float3(_1822, _1790, _1818);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5653, float3(0.0), isnan(_5653)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5653, float3(0.0), isnan(_5653)), level(0.0)).x;
    float3 _5662 = float3(_1822, _1790, _1818);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5662, float3(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5662, float3(0.0), isnan(_5662)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1374)
    {
        _1764 = 1.0;
    }
    float _1851 = _1764;
    bool _1853 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.5);
    bool _1861 = _1857 || _1859;
    float _1863 = _1851;
    if (_1861)
    {
        _1849 = 1.0;
    }
    float _1865 = _1849;
    float _1867 = _1865;
    if (_1861)
    {
        _1746 = 1.0;
    }
    float _1869 = _1746;
    float _1871 = _1869;
    if (!_1861)
    {
        float _1873 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1877 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1875;
        float _1879 = _1873 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = cos(_1881);
        float _1885 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1887 = _1885 * 0.15915493667125701904296875;
        float _1889 = _1879 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        float _1893 = 1.0 / _1883;
        float _1895 = _1887 * 6.283185482025146484375;
        float _1897 = cos(_1895);
        float _1899 = _1891 * _1893;
        float _1901 = _1887 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1897 * _1899;
        float _1907 = 1.0 / _1877;
        float _1909 = 1.0 / _1905;
        float _1911 = _1903 * _1909;
        float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1915 = fma(_1280, _1911, _1913);
        float _1917 = _1915 * _1907;
        float _1919 = precise::clamp(_1917, 0.0, 1.0);
        _1871 = _1919;
    }
    float _1921 = _1871;
    if (!_1861)
    {
        float _1923 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1925 = _1923 * 0.15915493667125701904296875;
        float _1927 = _1925 * 6.283185482025146484375;
        float _1929 = cos(_1927);
        float _1931 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1933 = _1931 * 0.15915493667125701904296875;
        float _1935 = _1925 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = 1.0 / _1929;
        float _1941 = _1933 * 6.283185482025146484375;
        float _1943 = cos(_1941);
        float _1945 = _1937 * _1939;
        float _1947 = _1933 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = _1943 * _1945;
        float _1953 = 1.0 / _1951;
        float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1957 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1955;
        float _1959 = 1.0 / _1957;
        float _1961 = _1949 * _1953;
        float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1965 = fma(_1280, _1961, _1963);
        float _1967 = _1965 * _1959;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        float _1971 = -_1969;
        float _1973 = _1971 + 1.0;
        _1867 = _1973;
    }
    float _1975 = _1867;
    if (!_1374)
    {
        int _1977 = _1440 << 4;
        int _1979 = _1977 + 2048;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
        int _1985 = int(_1981) & 3;
        float _1987 = (*spvDescriptorSet0.vp_c15)._m0[int(_1983)][_1985];
        int _1989 = int(_1981) + 1;
        uint _1991 = uint(int(uint(_1989) >> uint(2)));
        int _1993 = _1989 & 3;
        float _1995 = (*spvDescriptorSet0.vp_c15)._m0[int(_1991)][_1993];
        int _1997 = _1979 + 8;
        uint _1999 = uint(int(uint(_1997) >> uint(2)));
        uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
        int _2003 = int(_1999) & 3;
        float _2005 = (*spvDescriptorSet0.vp_c15)._m0[int(_2001)][_2003];
        int _2007 = int(_1999) + 1;
        uint _2009 = uint(int(uint(_2007) >> uint(2)));
        int _2011 = _2007 & 3;
        float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
        float _2015 = _1260 * _1995;
        float _2017 = fma(_747, _1987, _2015);
        float _2019 = fma(_809, _2005, _2017);
        float _2021 = _2019 + _2013;
        float _2023 = precise::clamp(_2021, 0.0, 1.0);
        float _2025 = -_2023;
        float _2027 = _2025 + _1828;
        float _2029 = fma(_2027, 500.0, 1.5);
        float _2031 = exp2(_2029);
        float _2033 = 0.0 + _2031;
        float _2035 = precise::clamp(_2033, 0.0, 1.0);
        _1442 = as_type<float>(_1979);
        _1863 = _2035;
    }
    float _2037 = _1442;
    float _2039 = _1863;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2043 = _1544 + _2041;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2047 = _1546 + _2045;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2051 = _1548 + _2049;
    float _2053 = _2043 * _2043;
    float _2055 = fma(_2047, _2047, _2053);
    float _2057 = fma(_2051, _2051, _2055);
    float _2059 = rsqrt(_2057);
    float _2061 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2063 = _2047 * _2061;
    float _2065 = _2051 * _2061;
    float _2067 = _2063 * _2063;
    float _2069 = _2065 * _2065;
    float _2071 = _2067 + _2069;
    float _2073 = sqrt(_2071);
    bool _2075 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2079 = _2073 + _2077;
    float _2081 = _2051;
    float _2083 = _2053;
    float _2085 = _2079;
    float _2087 = _2037;
    float _2089 = _2061;
    if (_2075)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2081 = _2091;
    }
    float _2093 = _2081;
    if (_2075)
    {
        float _2095 = rsqrt(_2071);
        _2083 = _2095;
    }
    float _2097 = _2083;
    float _2099 = _2097;
    if (_2075)
    {
        float _2101 = _2079 * _2093;
        _2085 = _2101;
    }
    float _2103 = _2085;
    if (_2075)
    {
        float _2105 = _2103 * 0.15915493667125701904296875;
        _2087 = _2105;
    }
    float _2107 = _2087;
    float _2109 = _2059;
    if (_2075)
    {
        float _2111 = _2107 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        _2109 = _2113;
    }
    float _2115 = _2109;
    float _2117 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2119 = precise::max(0.0, _2117);
    float _2121 = _1828;
    float _2123 = _2119;
    float _2125 = _2115;
    float _2127 = _2117;
    if (_2075)
    {
        float _2129 = _2107 * 6.283185482025146484375;
        float _2131 = cos(_2129);
        _2121 = _2131;
    }
    float _2133 = _2121;
    float _2135 = -_2061;
    float _2137 = -_2119;
    float _2139 = fma(_2043, _2135, _2137);
    float _2141 = _2139;
    if (_2075)
    {
        float _2143 = _2139 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2143;
    }
    float _2145 = _2123;
    float _2147 = _2145;
    if (_2075)
    {
        float _2149 = fma(_2115, _2145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2125 = _2149;
    }
    float _2151 = _2125;
    float _2153 = _2151;
    if (!_2075)
    {
        _2147 = _2065;
    }
    float _2155 = _2147;
    float _2157 = _2155;
    float _2159 = _2133;
    if (_2075)
    {
        float _2161 = _2133 + (-1.0);
        _2127 = _2161;
    }
    float _2163 = _2127;
    float _2165 = _2163;
    if (_2075)
    {
        float _2167 = _2097 * _2151;
        _2089 = _2167;
    }
    float _2169 = _2089;
    if (!_2075)
    {
        _2153 = _2063;
    }
    float _2171 = _2153;
    float _2173 = _2171;
    if (_2075)
    {
        float _2175 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2165 = _2175;
    }
    float _2177 = _2165;
    if (_2075)
    {
        float _2179 = _2063 * _2169;
        _2173 = _2179;
    }
    float _2181 = _2173;
    if (!_2075)
    {
        _2099 = _2067;
    }
    float _2183 = _2099;
    float _2185 = _2183;
    if (_2075)
    {
        float _2187 = _2065 * _2169;
        _2157 = _2187;
    }
    float _2189 = _2157;
    if (_2075)
    {
        float _2191 = fma(_2139, _2133, _2177);
        _2141 = _2191;
    }
    float _2193 = _2141;
    if (_2075)
    {
        float _2195 = _2181 * _2181;
        _2185 = _2195;
    }
    float _2197 = _2185;
    if (!_2075)
    {
        _2159 = _2069;
    }
    float _2199 = _2159;
    float _2201 = _2199;
    if (_2075)
    {
        float _2203 = _2189 * _2189;
        _2201 = _2203;
    }
    float _2205 = _2201;
    float _2207 = sqrt(_2057);
    float _2209 = fma(_2193, _2193, _2197);
    float _2211 = _2209 + _2205;
    float _2213 = rsqrt(_2211);
    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2217 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2215);
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = -_2219;
    float _2223 = _2221 + 1.0;
    float _2225 = _2213 * _2181;
    float _2227 = _2213 * _2193;
    float _2229 = _2213 * _2189;
    float _2231 = abs(_2223);
    float _2233 = log2(_2231);
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2237 = -_2235;
    float _2239 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2237);
    float _2241 = -_2229;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2239);
    float _2245 = fma(_2243, -0.5, 0.5);
    float _2247 = fma(_2243, 0.5, 0.5);
    float _2249 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2251 = fma(_2247, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2253 = sqrt(_2245);
    float _2255 = fma(_2247, _2251, -0.212114393711090087890625);
    float _2257 = _2227 + 1.0;
    float _2259 = fma(_2247, _2255, 1.570728778839111328125);
    float _2261 = exp2(_2249);
    float _2263 = _2253 * 0.636619746685028076171875;
    float _2265 = -_2227;
    float _2267 = fma(_2261, _2257, _2265);
    float _2269 = -_2259;
    float _2271 = fma(_2263, _2269, 1.0);
    float _2273 = fma(_2267, 0.5, 0.5);
    float2 _6301 = float2(_2271, _2273);
    float3 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6301, float2(0.0), isnan(_6301)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6301, float2(0.0), isnan(_6301)), level(0.0)).xyz;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = abs(_1280);
    float _2287 = log2(_2285);
    float _2289 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2291 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = -_1218;
    float _2295 = _2293 + 1.0;
    float _2297 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2289);
    float _2299 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2297);
    float _2301 = exp2(_2291);
    bool _2303 = _1280 <= 8000.0;
    bool _2305 = isnan(_1280);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(8000.0);
    bool _2311 = _2307 || _2309;
    float _2313 = float(_2311);
    float _2315 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2299);
    float _2317 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2319 = _2315 + _1730;
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1760;
    out.gl_Position.z = _2315;
    out.gl_Position.w = _1730;
    float _2321 = _2319 * 0.5;
    float _2323 = exp2(_2317);
    out.m_88.z = _2321;
    out.m_88.w = _1730;
    float _2325 = -_2301;
    float _2327 = _2325 + 1.0;
    float _2329 = _2327;
    if (!_1728)
    {
        _1796 = 1.0;
    }
    float _2331 = _1796;
    float _2333 = _2331;
    if (_1728)
    {
        bool _2335 = _1834 >= _1820;
        bool _2337 = isnan(_1834);
        bool _2339 = _2335 || _2337;
        bool _2341 = isnan(_1820);
        bool _2343 = _2339 || _2341;
        float _2345 = float(_2343);
        _2333 = _2345;
    }
    float _2347 = _2333;
    float _2349 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2351 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2353 = isnan(_2207);
    bool _2355 = _2351 || _2353;
    bool _2357 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2359 = _2355 || _2357;
    float _2361 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = _2347 * _2039;
    float _2367 = _2349 * _1836;
    float _2369 = fma(_2363, -2.0, 3.0);
    float _2371 = _2363 * _2363;
    float _2373 = _2371 * _2369;
    float _2375 = _2349;
    if (!_2359)
    {
        _2329 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2377 = _2329;
    float _2379 = -_2373;
    float _2381 = _2379 + 1.0;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2373);
    float _2385 = _2313 * _2383;
    float _2387 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2389 = _2385;
    float _2391 = _2377;
    float _2393 = _2377;
    if (!_2359)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2395 = _2389;
    float _2397 = _2295 * _2387;
    float _2399 = precise::clamp(_2397, 0.0, 1.0);
    float _2401 = _1847 * _2367;
    float _2403 = -_2399;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2407 = -_2365;
    float _2409 = fma(_2407, _2405, 1.0);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = -_2349;
    float _2415 = _2413 + 1.0;
    float _2417 = _2401;
    float _2419 = _2415;
    float _2421 = _2395;
    float _2423 = _2395;
    if (!_2359)
    {
        _2375 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2425 = _2375;
    float _2427 = _2411 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2429 = _1921 * _1975;
    out.m_90.x = _2427;
    float _2431 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2433 = _2429;
    float _2435 = _2425;
    float _2437 = _2425;
    if (!_2359)
    {
        _2433 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2439 = _2433;
    float _2441 = _2283 * _2367;
    float _2443 = fma(_2279, _2401, _1841);
    float _2445 = fma(_2281, _2401, _1843);
    float _2447 = _1847 * _2415;
    float _2449 = fma(_1847, _2441, _1845);
    float _2451 = _2439;
    float _2453 = _2439;
    if (!_2359)
    {
        _2417 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _2417;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2359)
    {
        _2419 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2461 = _2419;
    out.m_92.x = _2443;
    out.m_92.y = _2445;
    out.m_92.z = _2449;
    out.m_92.w = _2447;
    bool _2463 = !_2359;
    float _2465 = _2461;
    float _2467 = _2461;
    if (!_2463)
    {
        bool _2469 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2471 = isnan(_2207);
        bool _2473 = _2469 || _2471;
        bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2477 = _2473 || _2475;
        if (!_2477)
        {
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2481 = _2207 + _2479;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2483;
            float _2487 = 1.0 / _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2509 = _2481 * _2487;
            float _2511 = precise::clamp(_2509, 0.0, 1.0);
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2517 = fma(_2511, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2519 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2521 = fma(_2511, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2523 = fma(_2511, _2499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2525 = fma(_2511, _2503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2527 = fma(_2511, _2507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2437 = _2519;
            _2467 = _2525;
            _2423 = _2517;
            _2459 = _2523;
            _2393 = _2521;
            _2453 = _2527;
            _2529 = true;
        }
        else
        {
            bool _2531 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2533 = isnan(_2207);
            bool _2535 = _2531 || _2533;
            bool _2537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2539 = _2535 || _2537;
            if (!_2539)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2541 = _2421;
            _2423 = _2541;
            if (!_2539)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2543 = _2435;
            _2437 = _2543;
            if (!_2539)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2545 = _2391;
            _2393 = _2545;
            if (!_2539)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2547 = _2457;
            _2459 = _2547;
            if (!_2539)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2549 = _2465;
            _2467 = _2549;
            if (!_2539)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2551 = _2451;
            bool _2553 = !_2539;
            _2453 = _2551;
            if (!_2553)
            {
                bool _2555 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2557 = isnan(_2207);
                bool _2559 = _2555 || _2557;
                bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2563 = _2559 || _2561;
                if (!_2563)
                {
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2567 = _2207 + _2565;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2569;
                    float _2573 = 1.0 / _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2595 = _2567 * _2573;
                    float _2597 = precise::clamp(_2595, 0.0, 1.0);
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2603 = fma(_2597, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2605 = fma(_2597, _2601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2607 = fma(_2597, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2609 = fma(_2597, _2585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2611 = fma(_2597, _2589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2613 = fma(_2597, _2593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2437 = _2605;
                    _2467 = _2611;
                    _2423 = _2603;
                    _2459 = _2609;
                    _2393 = _2607;
                    _2453 = _2613;
                    _2529 = true;
                }
                else
                {
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2529 = false;
    float _2615 = _2437;
    float _2617 = _2467;
    float _2619 = _2423;
    float _2621 = _2459;
    float _2623 = _2393;
    float _2625 = _2453;
    float _2627 = fma(_1118, -0.5, 0.5);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = -_2615;
    float _2633 = _2631 + _2617;
    float _2635 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2637 = -_2619;
    float _2639 = _2637 + _2621;
    float _2641 = fma(_2629, _2633, _2615);
    out.m_94.x = 0.0;
    float _2643 = -_2623;
    float _2645 = _2643 + _2625;
    float _2647 = fma(_2629, _2639, _2619);
    float _2649 = _2641 * 0.586610972881317138671875;
    out.m_61.x = _2635;
    bool _2651 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2653 = fma(_2629, _2645, _2623);
    float _2655 = fma(_2647, 0.298911988735198974609375, _2649);
    bool _2657 = _1921 > 0.0;
    bool _2659 = isnan(_1921);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan(0.0);
    bool _2665 = _2661 || _2663;
    float _2667 = fma(_2653, 0.114477999508380889892578125, _2655);
    bool _2669 = _1975 <= 0.0;
    bool _2671 = !_2665;
    bool _2673 = _2669 || _2671;
    float _2675 = -_2667;
    float _2677 = _2647 + _2675;
    float _2679 = -_2667;
    float _2681 = _2641 + _2679;
    float _2683 = -_2667;
    float _2685 = _2653 + _2683;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2689 = fma(_2681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    bool _2693 = !_2651;
    if (!_2693)
    {
        float _2695 = -_1544;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2699 = -_1546;
        float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2703 = -_1548;
        float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2707 = _2697 * _2697;
        float _2709 = fma(_2701, _2701, _2707);
        float _2711 = fma(_2705, _2705, _2709);
        float _2713 = sqrt(_2711);
        float _2715 = rsqrt(_2711);
        float _2717 = -_2713;
        float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2721 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = _2701 * _2715;
        float _2727 = _2697 * _2715;
        float _2729 = abs(_2723);
        float _2731 = log2(_2729);
        float _2733 = _2705 * _2715;
        float _2735 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2737 = _1118 * _2727;
        float _2739 = -_2727;
        float _2741 = -_2735;
        float _2743 = fma(_2739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2741);
        float _2745 = fma(_1106, _2725, _2737);
        float _2747 = -_2733;
        float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2743);
        float _2751 = fma(_1120, _2733, _2745);
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2757 = _2749 + _2755;
        float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = exp2(_2759);
        float _2767 = _2765 * _2763;
        float _2769 = _2753 * _2767;
        float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2771;
        out.m_94.y = _2773;
        out.m_94.z = _2775;
    }
    out.m_96.x = _2687;
    out.m_96.y = _2689;
    out.m_96.z = _2691;
    if (!_2673)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2777 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2777;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2529 = false;
    bool _1170 = false;
    bool _211 = false;
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
        float _2834 = as_type<float>(_131);
        out.gl_Position.z = _2834;
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
        float _2903 = as_type<float>(_169);
        out.gl_Position.z = _2903;
    }
    if (_163)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_68.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_68.z;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _219 + _223;
    float _227 = in.m_68.x;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = in.m_68.y;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _231;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _251 = _249 != 0;
    float _253 = 1.0 / _235;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = _219 + _255;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _261 = _259 != 0;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _269 = _267 != 0;
    float _271 = _221 * 2.0;
    float _273 = 1.0 / _241;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _219 + _275;
    float _279 = _227 * 2.0;
    float _281 = _257 * _243;
    float _283 = _237 * 2.0;
    float _285 = _227 + _237;
    float _287 = _277 * _253;
    float _289 = floor(_271);
    float _291 = _237 + _221;
    float _293 = _291 + (-1.0);
    float _295 = _225 * _273;
    float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _299 = log2(_297);
    float _301 = _227 + _221;
    float _303 = _301 + (-1.0);
    float _305 = _285 + (-1.0);
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _309 = floor(_279);
    bool _311 = _289 > 0.0;
    float _313 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _315 = _289 >= 0.0;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan(0.0);
    bool _323 = _319 || _321;
    float _325 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _327 = _323 ? 0 : 1;
    float _329 = floor(_283);
    float _331 = _299 * _149;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    int _337 = ~_327;
    int _339 = _337 + 1;
    int _341 = _339 + 1;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _345 = 1.0 + _343;
    bool _347 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_219);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = fma(_335, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _361 = _341;
    if (!_311)
    {
        int _363 = ~_327;
        int _365 = _363 + 1;
        _361 = _365;
    }
    int _367 = _361;
    float _369 = exp2(_331);
    bool _371 = _309 >= 0.0;
    bool _373 = isnan(_309);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    bool _385 = !_261;
    int _387 = _385 ? 0 : 1;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    int _393 = _379 ? 0 : 1;
    float _395 = fma(_383, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _397 = _309 > 0.0;
    float _399 = 1.0 / _345;
    bool _401 = _329 > 0.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _407 = _329 >= 0.0;
    bool _409 = isnan(_329);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _421 = !_265;
    int _423 = _421 ? 0 : 1;
    float _425 = fma(_405, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _427 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _429 = isnan(_219);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -_369;
    float _441 = _439 + 1.0;
    bool _443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _451 = _447 || _449;
    float _453 = fma(_419, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _455 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _457 = isnan(_219);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _437 * _391;
    float _469 = _451 ? _441 : 0.0;
    float _471 = -_437;
    float _473 = _471 + 1.0;
    bool _475 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _477 = isnan(1.0);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _483 = _479 || _481;
    float _485 = in.m_70.x;
    float _487 = in.m_70.y;
    float _489 = in.m_70.z;
    bool _491 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _493 = isnan(_219);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _465 * _473;
    float _505 = -_465;
    float _507 = _505 + 1.0;
    int _509 = abs(_387);
    int _511 = abs(_423);
    float _513 = _501 * _507;
    int _515 = _415 ? 0 : 1;
    float _517 = -_501;
    float _519 = _517 + 1.0;
    float _521 = _395 * _513;
    if (_483)
    {
        float _523 = _469 * _399;
        _153 = _523;
    }
    float _525 = _153;
    float _527 = float(_509);
    float _529 = float(_367);
    float _531 = _359 * _513;
    int _533 = ~_393;
    int _535 = _533 + 1;
    int _537 = _535 + 1;
    int _539 = _537;
    if (!_397)
    {
        int _541 = ~_393;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    float _547 = _527 * _529;
    float _549 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].y, _531);
    bool _551 = !_269;
    int _553 = _551 ? 0 : 1;
    float _555 = float(_511);
    float _557 = fma(_453, _503, _549);
    float _559 = float(_545);
    float _561 = _547 * (-2.0);
    float _563 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _565 = abs(_553);
    float _567 = fma(_325, _561, _325);
    int _569 = ~_515;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = fma(_561, _485, _485);
    int _577 = _573;
    if (!_401)
    {
        int _579 = ~_515;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = _563 * _227;
    float _587 = _555 * _559;
    bool _589 = _227 > 0.5;
    float _591 = _227 + (-0.5);
    float _593 = float(_565);
    float _595 = _587 * (-2.0);
    float _597 = float(_583);
    float _599 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[196].x, _575);
    bool _601 = _237 > 0.5;
    float _603 = _237 + (-0.5);
    float _605 = fma(_595, _487, _487);
    float _607 = _593 * _597;
    float _609 = fma(_567, _525, _599);
    float _611 = fma(_307, _595, _307);
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _605);
    float _615 = _607 * (-2.0);
    float _617 = _609 * 0.15915493667125701904296875;
    float _619 = in.m_58.x;
    float _621 = in.m_58.y;
    float _623 = in.m_58.z;
    float _625 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _627 = fma(_313, _615, _313);
    float _629 = in.m_72.x;
    float _631 = in.m_72.y;
    float _633 = in.m_72.z;
    float _635 = fma(_615, _489, _489);
    float _637 = fma(_611, _525, _613);
    float _639 = _221 + (-0.5);
    float _641 = in.m_74.x;
    float _643 = in.m_74.y;
    float _645 = in.m_74.z;
    float _647 = _637 * 0.15915493667125701904296875;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _649;
    float _653 = in.m_76.x;
    float _655 = in.m_76.y;
    float _657 = in.m_76.z;
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].z, _635);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _661;
    float _665 = fma(_651, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _667 = in.m_78.x;
    float _669 = in.m_78.y;
    float _671 = fma(_425, _503, _625);
    float _673 = fma(_627, _525, _659);
    float _675 = fma(_663, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _677 = _617 * 6.283185482025146484375;
    float _679 = sin(_677);
    float _681 = fma(_665, _467, _671);
    float _683 = _673 * 0.15915493667125701904296875;
    float _685 = fma(_675, _467, _557);
    float _687 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _685);
    float _689 = _621 * _631;
    float _691 = _617 * 6.283185482025146484375;
    float _693 = cos(_691);
    float _695 = _621 * _643;
    float _697 = fma(_619, _629, _689);
    float _699 = _621 * _655;
    float _701 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _681);
    float _703 = _647 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = fma(_619, _641, _695);
    float _709 = _687 * _669;
    float _711 = _701 * _667;
    float _713 = fma(_619, _653, _699);
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = _647 * 6.283185482025146484375;
    float _723 = cos(_721);
    float _725 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _727 = fma(_623, _645, _707);
    float _729 = _719 * _715;
    float _731 = fma(_623, _633, _697);
    float _733 = _725 * _717;
    float _735 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _737 = _727 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _739 = _683 * 6.283185482025146484375;
    float _741 = cos(_739);
    float _743 = _679 * _705;
    float _745 = _693 * _705;
    float _747 = _731 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _749 = _683 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _693 * _723;
    float _755 = _679 * _723;
    float _757 = _693 * _741;
    float _759 = _679 * _741;
    float _761 = _723 * _741;
    float _763 = _705 * _741;
    float _765 = _757 * _729;
    float _767 = _759 * _729;
    float _769 = trunc(_585);
    int _771 = int(_769);
    float _773 = _757 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _775 = fma(_751, _753, _743);
    float _777 = -_729;
    float _779 = _751 * _777;
    float _781 = -_755;
    float _783 = fma(_751, _745, _781);
    float _785 = -_745;
    float _787 = fma(_751, _755, _785);
    float _789 = fma(_775, _733, _765);
    float _791 = fma(_761, _733, _779);
    float _793 = fma(_751, _743, _753);
    float _795 = fma(_787, _733, _767);
    float _797 = fma(_783, _735, _789);
    float _799 = fma(_763, _735, _791);
    float _801 = fma(_623, _657, _713);
    float _803 = fma(_793, _735, _795);
    float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _807 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _809 = _801 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _811 = _757 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _805);
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _807);
    float _817 = _757 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _819 = -_751;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].x, _811);
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _825 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _827 = -_751;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _773);
    float _831 = -_751;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _817);
    float _835 = _823 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _837 = _825 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _839 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _821);
    float _841 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _843 = _747 + _835;
    float _845 = _809 + _837;
    float _847 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _833);
    float _849 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _853 = _843 + _851;
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _857 = _845 + _855;
    float _859 = _775 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _775 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _863 = _853 * _853;
    float _865 = _857 * _857;
    float _867 = _775 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _869 = -_189;
    int _871 = _601 ? as_type<int>(_869) : as_type<int>(_189);
    float _873 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _875 = _863 + _865;
    float _877 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _879 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _881 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _849);
    float _883 = sqrt(_875);
    bool _885 = !_251;
    float _887 = _885 ? _189 : as_type<float>(_871);
    float _889 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _891 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _881);
    float _893 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    int _895 = _771 << 4;
    int _897 = _895 + 1712;
    float _899 = _889 * _839;
    float _901 = _889 * _841;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _905 = _889 * _847;
    float _907 = _891 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].x, _861);
    float _911 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _867);
    int _913 = _897 + 8;
    uint _916 = uint(int(uint(_913) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    float _924 = _737 + _907;
    float _926 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _873);
    bool _928 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _893);
    float _932 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _909);
    float _934 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _911);
    float _936 = -_185;
    int _938 = _589 ? as_type<int>(_936) : as_type<int>(_185);
    uint _940 = uint(int(uint(_897) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    float _956 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _877);
    float _958 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _879);
    float _960 = _787;
    float _962 = _907;
    float _964 = _911;
    float _966 = _863;
    float _968 = _865;
    float _970 = _617;
    if (!_928)
    {
        _960 = _843;
    }
    float _972 = _960;
    float _974 = _972;
    if (!_928)
    {
        _962 = _845;
    }
    float _976 = _962;
    float _978 = _976;
    if (!_928)
    {
        _964 = _924;
    }
    float _980 = _964;
    bool _982 = !_928;
    float _984 = _980;
    float _986 = _903;
    if (!_982)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _883 + _990;
        float _994 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = rsqrt(_875);
        float _998 = _992 * _988;
        float _1000 = _998 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _996 * _1010;
        float _1014 = fma(_853, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = _1008 + (-1.0);
        float _1018 = fma(_857, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1022 = _1014 + _1020;
        float _1024 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1028 = _1018 + _1026;
        float _1030 = _1022 * _1022;
        float _1032 = fma(_924, _1008, _1024);
        float _1034 = _1028 * _1028;
        _984 = _1032;
        _966 = _1030;
        _968 = _1034;
        _978 = _1018;
        _974 = _1014;
    }
    float _1036 = _984;
    float _1038 = _966;
    float _1040 = _968;
    float _1042 = _978;
    float _1044 = _974;
    float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1048 = !_247;
    float _1050 = _1048 ? _185 : as_type<float>(_938);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1054 = _1036 + _1052;
    float _1056 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1058 = -_887;
    float _1060 = _1058 + 0.5;
    float _1062 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[26].z, _958);
    float _1064 = fma(_1054, _1054, _1038);
    float _1066 = fma(_1056, _930, _899);
    float _1068 = fma(_1056, _932, _901);
    float _1070 = fma(_1056, _934, _905);
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1074 = _1064 + _1040;
    float _1076 = _1050 + 0.5;
    float _1078 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[24].z, _926);
    float _1080 = _1072 * _1046;
    float _1082 = sqrt(_1074);
    float _1084 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[25].z, _956);
    float _1086 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1088 = _922 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1092 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1090 * _903;
    float _1106 = _1078 + _1066;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1110 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1084 + _1068;
    float _1120 = _1062 + _1070;
    out.m_80.x = _1104;
    out.m_80.y = _1080;
    bool _1122 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1124 = isnan(_1082);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1130 = _1126 || _1128;
    out.m_82.x = _1110;
    out.m_82.y = _1112;
    out.m_82.z = _1114;
    out.m_84.x = _1116;
    out.m_84.y = _1100;
    out.m_84.z = _1102;
    out.m_84.w = _1108;
    out.m_86.x = _1106;
    out.m_86.y = _1118;
    out.m_86.z = _1120;
    float _1132 = _1042;
    int _1134 = as_type<int>(_1044);
    if (!_1130)
    {
        _986 = 1.0;
    }
    float _1136 = _986;
    bool _1138 = !_1130;
    float _1140 = _1136;
    if (!_1138)
    {
        bool _1142 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1144 = isnan(_1082);
        bool _1146 = _1142 || _1144;
        bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1150 = _1146 || _1148;
        if (!_1150)
        {
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = _1082 + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1158 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1156;
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1162 = _1160 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1164 = 1.0 / _1158;
            float _1166 = _1154 * _1164;
            float _1168 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1140 = _1168;
            _1170 = true;
        }
        else
        {
            bool _1172 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1174 = isnan(_1082);
            bool _1176 = _1172 || _1174;
            bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1180 = _1176 || _1178;
            if (!_1180)
            {
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1082 + _1182;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1194 = 1.0 / _1188;
                float _1196 = _1184 * _1194;
                float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1140 = _1198;
                _1170 = true;
            }
            else
            {
                _1140 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1170 = false;
    float _1200 = _1140;
    float _1202 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1204 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1206 = floor(_1202);
    float _1208 = floor(_1204);
    float _1210 = -_1206;
    float _1212 = _1202 + _1210;
    float _1214 = -_1208;
    float _1216 = _1204 + _1214;
    float2 _4583 = float2(_1212, _1216);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4583, float2(0.0), isnan(_4583)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4583, float2(0.0), isnan(_4583)), level(0.0)).x;
    float _1220 = _737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1036 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1228 = _1042 + _1226;
    float _1230 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1220);
    float _1232 = fma(_1228, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1234 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1230);
    float _1236 = _737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1240 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1242 = 1.0 / _1238;
    float _1244 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1240);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _1246 + _1238;
    float _1250 = _1248 * _1242;
    float _1252 = _1250 * 0.5;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1256 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1254);
    float _1258 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1260 = _737 + _1258;
    float _1262 = 1.0 / _1256;
    float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1268 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1264);
    float _1270 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1266);
    float _1272 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1268);
    float _1274 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1270);
    float _1276 = _1272 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1280 = _1262 * _1278;
    float _1282 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1284 = trunc(_1276);
    int _1286 = int(_1284);
    bool _1288 = _1280 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1290 = _1280 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1292 = !_1288;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = trunc(_1282);
    int _1298 = int(_1296);
    int _1300 = 2;
    int _1302 = as_type<int>(_1228);
    int _1304 = as_type<int>(_1200);
    if (!_1288)
    {
        _1300 = 1;
    }
    int _1306 = _1300;
    int _1308 = _1306;
    if (!_1290)
    {
        _1308 = _1294;
    }
    int _1310 = _1308;
    int _1312 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1314 = _1286 + _1312;
    int _1316 = _1314 + 1;
    int _1318 = _1310 << 6;
    bool _1320 = _1316 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1322 = _1318 + 48;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    int _1340 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1342 = _1298 + _1340;
    int _1344 = _1342 + 1;
    float _1346 = fma(_1224, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _1348 = _1316 | _1344;
    int _1350 = _1318 + 56;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    bool _1368 = _1348 < 0;
    bool _1370 = _1368 || _1320;
    bool _1372 = _1344 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1374 = _1372 || _1370;
    bool _1376 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.5);
    bool _1384 = _1380 || _1382;
    int _1386 = _1318 + 64;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
    int _1392 = int(_1388) & 3;
    float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
    int _1396 = int(_1388) + 1;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    int _1400 = _1396 & 3;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1406 = _1044 + _1404;
    float _1408 = fma(_1406, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1410 = _1318 + 72;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c15)._m0[int(_1422)][_1424];
    float _1428 = _1406;
    float _1430 = as_type<float>(_1316);
    float _1432 = _1408;
    float _1434 = as_type<float>(_1310);
    if (!_1374)
    {
        int _1436 = _1344 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1438 = _1436 + _1316;
        _1302 = _1438;
    }
    int _1440 = _1302;
    float _1442 = as_type<float>(_1440);
    if (_1384)
    {
        _1132 = _1408;
    }
    float _1444 = _1132;
    float _1446 = _1444;
    if (_1384)
    {
        _1428 = _1346;
    }
    float _1448 = _1428;
    int _1450 = _1318 + 96;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
    int _1456 = int(_1452) & 3;
    float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
    int _1460 = int(_1452) + 1;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    int _1464 = _1460 & 3;
    float _1466 = (*spvDescriptorSet0.vp_c15)._m0[int(_1462)][_1464];
    float _1468 = _1448;
    if (_1384)
    {
        _1430 = _1232;
    }
    float _1470 = _1430;
    int _1472 = _1318 + 104;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
    int _1478 = int(_1474) & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = int(_1474) + 1;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    int _1486 = _1482 & 3;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
    float _1490 = _1470;
    int _1492 = as_type<int>(_1458);
    if (!_1384)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1496 = _737 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1500 = _747 + _1498;
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = -_747;
        float _1506 = _1504 + _1408;
        float _1508 = _1496 * _1496;
        float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1512 = _809 + _1510;
        float _1514 = -_809;
        float _1516 = _1514 + _1232;
        float _1518 = fma(_1500, _1500, _1508);
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1522 = fma(_1512, _1512, _1518);
        float _1524 = sqrt(_1522);
        float _1526 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1528 = precise::min(_1524, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1530 = _1528 * _1520;
        float _1532 = -_737;
        float _1534 = _1532 + _1346;
        float _1536 = _1526 * _1530;
        float _1538 = fma(_1534, _1536, _737);
        float _1540 = fma(_1506, _1536, _747);
        float _1542 = fma(_1516, _1536, _809);
        _1468 = _1538;
        _1446 = _1540;
        _1490 = _1542;
        _1304 = as_type<int>(_1502);
        _1134 = as_type<int>(_1534);
        _1432 = _1516;
    }
    float _1544 = _1468;
    float _1546 = _1446;
    float _1548 = _1490;
    int _1550 = _1304;
    int _1552 = _1134;
    float _1554 = _1432;
    float _1556 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1260 * _1466;
    int _1560 = _1550;
    int _1562 = _1552;
    if (!_1374)
    {
        int _1564 = _1440 << 2;
        _1560 = _1564;
    }
    int _1566 = _1560;
    float _1568 = _1260 * _1402;
    float _1570 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    float _1572 = fma(_747, _1458, _1558);
    if (!_1374)
    {
        uint _1574 = uint(int(uint(_1440) >> uint(2)));
        _1562 = int(_1574);
    }
    int _1576 = _1562;
    float _1578 = fma(_747, _1394, _1568);
    float _1580 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1570);
    if (!_1374)
    {
        int _1582 = 12 & _1566;
        _1492 = _1582;
    }
    int _1584 = _1492;
    float _1586 = fma(_809, _1480, _1572);
    float _1588 = _1260 * _1338;
    float _1590 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = as_type<float>(_1584);
    if (!_1374)
    {
        int _1594 = _1576 << 4;
        int _1596 = _1594 + _1584;
        _1592 = as_type<float>(_1596);
    }
    float _1598 = _1592;
    float _1600 = _1586 + _1488;
    int _1602 = _1318 + 80;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    uint _1606 = uint(int(uint(int(_1604)) >> uint(2)));
    int _1608 = int(_1604) & 3;
    float _1610 = (*spvDescriptorSet0.vp_c15)._m0[int(_1606)][_1608];
    int _1612 = int(_1604) + 1;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    int _1616 = _1612 & 3;
    float _1618 = (*spvDescriptorSet0.vp_c15)._m0[int(_1614)][_1616];
    float _1620 = fma(_747, _1330, _1588);
    float _1622 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1624 = 1.0 / _1600;
    float _1626 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = fma(_809, _1358, _1620);
    float _1630 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1632 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1634 = _1598;
    if (!_1374)
    {
        int _1636 = as_type<int>(_1598) + 400;
        uint _1638 = uint(int(uint(_1636) >> uint(2)));
        uint _1640 = uint(int(uint(int(_1638)) >> uint(2)));
        int _1642 = int(_1638) & 3;
        float _1644 = (*spvDescriptorSet0.vp_c15)._m0[int(_1640)][_1642];
        _1634 = _1644;
    }
    float _1646 = _1634;
    float _1648 = _1628 + _1366;
    float _1650 = -_1626;
    float _1652 = fma(_1650, _1622, 1.0);
    float _1654 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1630);
    float _1656 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1632);
    float _1658 = fma(_809, _1418, _1578);
    float _1660 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1654);
    int _1664 = _1318 + 88;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    uint _1668 = uint(int(uint(int(_1666)) >> uint(2)));
    int _1670 = int(_1666) & 3;
    float _1672 = (*spvDescriptorSet0.vp_c15)._m0[int(_1668)][_1670];
    int _1674 = int(_1666) + 1;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    int _1678 = _1674 & 3;
    float _1680 = (*spvDescriptorSet0.vp_c15)._m0[int(_1676)][_1678];
    float _1682 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1684 = _1658 + _1426;
    float _1686 = _1648 * _1624;
    float _1688 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1692 = _1684 * _1624;
    float _1694 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    bool _1696 = _1686 >= 0.0;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = log2(_1652);
    float _1702 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1694);
    bool _1704 = _1686 <= 1.0;
    bool _1706 = _1704 && _1696;
    float _1708 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1710 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1712 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1714 = _1692 >= 0.0;
    bool _1716 = _1714 && _1706;
    float _1718 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = _1652;
    if (!_1374)
    {
        float _1722 = floor(_1282);
        _1720 = _1722;
    }
    float _1724 = _1720;
    bool _1726 = _1692 <= 1.0;
    bool _1728 = _1726 && _1716;
    float _1730 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1732 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1710);
    float _1734 = 1.0 / _1730;
    float _1736 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1738 = _1700 * 0.693147182464599609375;
    float _1740 = _1260 * _1618;
    float _1742 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1554;
    float _1746 = _1736;
    if (!_1374)
    {
        float _1748 = floor(_1276);
        _1744 = _1748;
    }
    float _1750 = _1744;
    if (_1728)
    {
        float _1752 = float(_1310);
        _1434 = _1752;
    }
    float _1754 = _1434;
    float _1756 = fma(_747, _1610, _1740);
    float _1758 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1760 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1736);
    float _1762 = _1724;
    float _1764 = _1754;
    if (!_1374)
    {
        float _1766 = -_1724;
        float _1768 = _1282 + _1766;
        _970 = _1768;
    }
    float _1770 = _970;
    float _1772 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1758);
    float _1774 = _1646;
    if (!_1374)
    {
        float _1776 = rint(_1646);
        float _1778 = precise::max(_1776, 0.0);
        uint _1780 = uint(_1778);
        uint _1782 = clamp(_1780, 0u, 65535u);
        _1774 = as_type<float>(_1782);
    }
    float _1784 = _1774;
    float _1786 = _1760 * _1734;
    float _1788 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1772);
    float _1790 = fma(_1786, -0.5, 0.5);
    float _1792 = fma(_809, _1672, _1756);
    float _1794 = _1756;
    float _1796 = _1788;
    if (_1728)
    {
        float _1798 = rint(_1754);
        float _1800 = precise::max(_1798, 0.0);
        uint _1802 = uint(_1800);
        uint _1804 = clamp(_1802, 0u, 65535u);
        _1794 = as_type<float>(_1804);
    }
    float _1806 = _1794;
    if (!_1374)
    {
        float _1808 = -_1750;
        float _1810 = _1276 + _1808;
        _1762 = _1810;
    }
    float _1812 = _1762;
    float _1814 = _1792 + _1680;
    float _1816 = _1788 * _1734;
    float _1818 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = _1814 * _1624;
    float _1822 = fma(_1816, 0.5, 0.5);
    float _1824 = _1784;
    if (!_1374)
    {
        float3 _5622 = float3(_1812, _1770, float(as_type<int>(_1784)));
        float3 _5626 = select(_5622, float3(0.0), isnan(_5622));
        float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5626.xy, uint(rint(_5626.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5626.xy, uint(rint(_5626.z)), level(0.0)).x;
        _1824 = _1826;
    }
    float _1828 = _1824;
    float _1830 = _1692;
    if (_1728)
    {
        float3 _5641 = float3(_1686, _1692, float(as_type<int>(_1806)));
        float3 _5643 = select(_5641, float3(0.0), isnan(_5641));
        float _1832 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5643.xy, uint(rint(_5643.z)), _1820, level(0.0));
        _1830 = _1832;
    }
    float _1834 = _1830;
    float3 _5653 = float3(_1822, _1790, _1818);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5653, float3(0.0), isnan(_5653)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5653, float3(0.0), isnan(_5653)), level(0.0)).x;
    float3 _5662 = float3(_1822, _1790, _1818);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5662, float3(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5662, float3(0.0), isnan(_5662)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1374)
    {
        _1764 = 1.0;
    }
    float _1851 = _1764;
    bool _1853 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.5);
    bool _1861 = _1857 || _1859;
    float _1863 = _1851;
    if (_1861)
    {
        _1849 = 1.0;
    }
    float _1865 = _1849;
    float _1867 = _1865;
    if (_1861)
    {
        _1746 = 1.0;
    }
    float _1869 = _1746;
    float _1871 = _1869;
    if (!_1861)
    {
        float _1873 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1877 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1875;
        float _1879 = _1873 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = cos(_1881);
        float _1885 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1887 = _1885 * 0.15915493667125701904296875;
        float _1889 = _1879 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        float _1893 = 1.0 / _1883;
        float _1895 = _1887 * 6.283185482025146484375;
        float _1897 = cos(_1895);
        float _1899 = _1891 * _1893;
        float _1901 = _1887 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1897 * _1899;
        float _1907 = 1.0 / _1877;
        float _1909 = 1.0 / _1905;
        float _1911 = _1903 * _1909;
        float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1915 = fma(_1280, _1911, _1913);
        float _1917 = _1915 * _1907;
        float _1919 = precise::clamp(_1917, 0.0, 1.0);
        _1871 = _1919;
    }
    float _1921 = _1871;
    if (!_1861)
    {
        float _1923 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1925 = _1923 * 0.15915493667125701904296875;
        float _1927 = _1925 * 6.283185482025146484375;
        float _1929 = cos(_1927);
        float _1931 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1933 = _1931 * 0.15915493667125701904296875;
        float _1935 = _1925 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = 1.0 / _1929;
        float _1941 = _1933 * 6.283185482025146484375;
        float _1943 = cos(_1941);
        float _1945 = _1937 * _1939;
        float _1947 = _1933 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = _1943 * _1945;
        float _1953 = 1.0 / _1951;
        float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1957 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1955;
        float _1959 = 1.0 / _1957;
        float _1961 = _1949 * _1953;
        float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1965 = fma(_1280, _1961, _1963);
        float _1967 = _1965 * _1959;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        float _1971 = -_1969;
        float _1973 = _1971 + 1.0;
        _1867 = _1973;
    }
    float _1975 = _1867;
    if (!_1374)
    {
        int _1977 = _1440 << 4;
        int _1979 = _1977 + 2048;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
        int _1985 = int(_1981) & 3;
        float _1987 = (*spvDescriptorSet0.vp_c15)._m0[int(_1983)][_1985];
        int _1989 = int(_1981) + 1;
        uint _1991 = uint(int(uint(_1989) >> uint(2)));
        int _1993 = _1989 & 3;
        float _1995 = (*spvDescriptorSet0.vp_c15)._m0[int(_1991)][_1993];
        int _1997 = _1979 + 8;
        uint _1999 = uint(int(uint(_1997) >> uint(2)));
        uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
        int _2003 = int(_1999) & 3;
        float _2005 = (*spvDescriptorSet0.vp_c15)._m0[int(_2001)][_2003];
        int _2007 = int(_1999) + 1;
        uint _2009 = uint(int(uint(_2007) >> uint(2)));
        int _2011 = _2007 & 3;
        float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
        float _2015 = _1260 * _1995;
        float _2017 = fma(_747, _1987, _2015);
        float _2019 = fma(_809, _2005, _2017);
        float _2021 = _2019 + _2013;
        float _2023 = precise::clamp(_2021, 0.0, 1.0);
        float _2025 = -_2023;
        float _2027 = _2025 + _1828;
        float _2029 = fma(_2027, 500.0, 1.5);
        float _2031 = exp2(_2029);
        float _2033 = 0.0 + _2031;
        float _2035 = precise::clamp(_2033, 0.0, 1.0);
        _1442 = as_type<float>(_1979);
        _1863 = _2035;
    }
    float _2037 = _1442;
    float _2039 = _1863;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2043 = _1544 + _2041;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2047 = _1546 + _2045;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2051 = _1548 + _2049;
    float _2053 = _2043 * _2043;
    float _2055 = fma(_2047, _2047, _2053);
    float _2057 = fma(_2051, _2051, _2055);
    float _2059 = rsqrt(_2057);
    float _2061 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2063 = _2047 * _2061;
    float _2065 = _2051 * _2061;
    float _2067 = _2063 * _2063;
    float _2069 = _2065 * _2065;
    float _2071 = _2067 + _2069;
    float _2073 = sqrt(_2071);
    bool _2075 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2079 = _2073 + _2077;
    float _2081 = _2051;
    float _2083 = _2053;
    float _2085 = _2079;
    float _2087 = _2037;
    float _2089 = _2061;
    if (_2075)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2081 = _2091;
    }
    float _2093 = _2081;
    if (_2075)
    {
        float _2095 = rsqrt(_2071);
        _2083 = _2095;
    }
    float _2097 = _2083;
    float _2099 = _2097;
    if (_2075)
    {
        float _2101 = _2079 * _2093;
        _2085 = _2101;
    }
    float _2103 = _2085;
    if (_2075)
    {
        float _2105 = _2103 * 0.15915493667125701904296875;
        _2087 = _2105;
    }
    float _2107 = _2087;
    float _2109 = _2059;
    if (_2075)
    {
        float _2111 = _2107 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        _2109 = _2113;
    }
    float _2115 = _2109;
    float _2117 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2119 = precise::max(0.0, _2117);
    float _2121 = _1828;
    float _2123 = _2119;
    float _2125 = _2115;
    float _2127 = _2117;
    if (_2075)
    {
        float _2129 = _2107 * 6.283185482025146484375;
        float _2131 = cos(_2129);
        _2121 = _2131;
    }
    float _2133 = _2121;
    float _2135 = -_2061;
    float _2137 = -_2119;
    float _2139 = fma(_2043, _2135, _2137);
    float _2141 = _2139;
    if (_2075)
    {
        float _2143 = _2139 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2143;
    }
    float _2145 = _2123;
    float _2147 = _2145;
    if (_2075)
    {
        float _2149 = fma(_2115, _2145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2125 = _2149;
    }
    float _2151 = _2125;
    float _2153 = _2151;
    if (!_2075)
    {
        _2147 = _2065;
    }
    float _2155 = _2147;
    float _2157 = _2155;
    float _2159 = _2133;
    if (_2075)
    {
        float _2161 = _2133 + (-1.0);
        _2127 = _2161;
    }
    float _2163 = _2127;
    float _2165 = _2163;
    if (_2075)
    {
        float _2167 = _2097 * _2151;
        _2089 = _2167;
    }
    float _2169 = _2089;
    if (!_2075)
    {
        _2153 = _2063;
    }
    float _2171 = _2153;
    float _2173 = _2171;
    if (_2075)
    {
        float _2175 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2165 = _2175;
    }
    float _2177 = _2165;
    if (_2075)
    {
        float _2179 = _2063 * _2169;
        _2173 = _2179;
    }
    float _2181 = _2173;
    if (!_2075)
    {
        _2099 = _2067;
    }
    float _2183 = _2099;
    float _2185 = _2183;
    if (_2075)
    {
        float _2187 = _2065 * _2169;
        _2157 = _2187;
    }
    float _2189 = _2157;
    if (_2075)
    {
        float _2191 = fma(_2139, _2133, _2177);
        _2141 = _2191;
    }
    float _2193 = _2141;
    if (_2075)
    {
        float _2195 = _2181 * _2181;
        _2185 = _2195;
    }
    float _2197 = _2185;
    if (!_2075)
    {
        _2159 = _2069;
    }
    float _2199 = _2159;
    float _2201 = _2199;
    if (_2075)
    {
        float _2203 = _2189 * _2189;
        _2201 = _2203;
    }
    float _2205 = _2201;
    float _2207 = sqrt(_2057);
    float _2209 = fma(_2193, _2193, _2197);
    float _2211 = _2209 + _2205;
    float _2213 = rsqrt(_2211);
    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2217 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2215);
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = -_2219;
    float _2223 = _2221 + 1.0;
    float _2225 = _2213 * _2181;
    float _2227 = _2213 * _2193;
    float _2229 = _2213 * _2189;
    float _2231 = abs(_2223);
    float _2233 = log2(_2231);
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2237 = -_2235;
    float _2239 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2237);
    float _2241 = -_2229;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2239);
    float _2245 = fma(_2243, -0.5, 0.5);
    float _2247 = fma(_2243, 0.5, 0.5);
    float _2249 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2251 = fma(_2247, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2253 = sqrt(_2245);
    float _2255 = fma(_2247, _2251, -0.212114393711090087890625);
    float _2257 = _2227 + 1.0;
    float _2259 = fma(_2247, _2255, 1.570728778839111328125);
    float _2261 = exp2(_2249);
    float _2263 = _2253 * 0.636619746685028076171875;
    float _2265 = -_2227;
    float _2267 = fma(_2261, _2257, _2265);
    float _2269 = -_2259;
    float _2271 = fma(_2263, _2269, 1.0);
    float _2273 = fma(_2267, 0.5, 0.5);
    float2 _6301 = float2(_2271, _2273);
    float3 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6301, float2(0.0), isnan(_6301)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6301, float2(0.0), isnan(_6301)), level(0.0)).xyz;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = abs(_1280);
    float _2287 = log2(_2285);
    float _2289 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2291 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = -_1218;
    float _2295 = _2293 + 1.0;
    float _2297 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2289);
    float _2299 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2297);
    float _2301 = exp2(_2291);
    bool _2303 = _1280 <= 8000.0;
    bool _2305 = isnan(_1280);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(8000.0);
    bool _2311 = _2307 || _2309;
    float _2313 = float(_2311);
    float _2315 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2299);
    float _2317 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2319 = _2315 + _1730;
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1760;
    out.gl_Position.z = _2315;
    out.gl_Position.w = _1730;
    float _2321 = _2319 * 0.5;
    float _2323 = exp2(_2317);
    out.m_88.z = _2321;
    out.m_88.w = _1730;
    float _2325 = -_2301;
    float _2327 = _2325 + 1.0;
    float _2329 = _2327;
    if (!_1728)
    {
        _1796 = 1.0;
    }
    float _2331 = _1796;
    float _2333 = _2331;
    if (_1728)
    {
        bool _2335 = _1834 >= _1820;
        bool _2337 = isnan(_1834);
        bool _2339 = _2335 || _2337;
        bool _2341 = isnan(_1820);
        bool _2343 = _2339 || _2341;
        float _2345 = float(_2343);
        _2333 = _2345;
    }
    float _2347 = _2333;
    float _2349 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2351 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2353 = isnan(_2207);
    bool _2355 = _2351 || _2353;
    bool _2357 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2359 = _2355 || _2357;
    float _2361 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = _2347 * _2039;
    float _2367 = _2349 * _1836;
    float _2369 = fma(_2363, -2.0, 3.0);
    float _2371 = _2363 * _2363;
    float _2373 = _2371 * _2369;
    float _2375 = _2349;
    if (!_2359)
    {
        _2329 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2377 = _2329;
    float _2379 = -_2373;
    float _2381 = _2379 + 1.0;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2373);
    float _2385 = _2313 * _2383;
    float _2387 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2389 = _2385;
    float _2391 = _2377;
    float _2393 = _2377;
    if (!_2359)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2395 = _2389;
    float _2397 = _2295 * _2387;
    float _2399 = precise::clamp(_2397, 0.0, 1.0);
    float _2401 = _1847 * _2367;
    float _2403 = -_2399;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2407 = -_2365;
    float _2409 = fma(_2407, _2405, 1.0);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = -_2349;
    float _2415 = _2413 + 1.0;
    float _2417 = _2401;
    float _2419 = _2415;
    float _2421 = _2395;
    float _2423 = _2395;
    if (!_2359)
    {
        _2375 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2425 = _2375;
    float _2427 = _2411 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2429 = _1921 * _1975;
    out.m_90.x = _2427;
    float _2431 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2433 = _2429;
    float _2435 = _2425;
    float _2437 = _2425;
    if (!_2359)
    {
        _2433 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2439 = _2433;
    float _2441 = _2283 * _2367;
    float _2443 = fma(_2279, _2401, _1841);
    float _2445 = fma(_2281, _2401, _1843);
    float _2447 = _1847 * _2415;
    float _2449 = fma(_1847, _2441, _1845);
    float _2451 = _2439;
    float _2453 = _2439;
    if (!_2359)
    {
        _2417 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _2417;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2359)
    {
        _2419 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2461 = _2419;
    out.m_92.x = _2443;
    out.m_92.y = _2445;
    out.m_92.z = _2449;
    out.m_92.w = _2447;
    bool _2463 = !_2359;
    float _2465 = _2461;
    float _2467 = _2461;
    if (!_2463)
    {
        bool _2469 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2471 = isnan(_2207);
        bool _2473 = _2469 || _2471;
        bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2477 = _2473 || _2475;
        if (!_2477)
        {
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2481 = _2207 + _2479;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2483;
            float _2487 = 1.0 / _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2509 = _2481 * _2487;
            float _2511 = precise::clamp(_2509, 0.0, 1.0);
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2517 = fma(_2511, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2519 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2521 = fma(_2511, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2523 = fma(_2511, _2499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2525 = fma(_2511, _2503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2527 = fma(_2511, _2507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2437 = _2519;
            _2467 = _2525;
            _2423 = _2517;
            _2459 = _2523;
            _2393 = _2521;
            _2453 = _2527;
            _2529 = true;
        }
        else
        {
            bool _2531 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2533 = isnan(_2207);
            bool _2535 = _2531 || _2533;
            bool _2537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2539 = _2535 || _2537;
            if (!_2539)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2541 = _2421;
            _2423 = _2541;
            if (!_2539)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2543 = _2435;
            _2437 = _2543;
            if (!_2539)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2545 = _2391;
            _2393 = _2545;
            if (!_2539)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2547 = _2457;
            _2459 = _2547;
            if (!_2539)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2549 = _2465;
            _2467 = _2549;
            if (!_2539)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2551 = _2451;
            bool _2553 = !_2539;
            _2453 = _2551;
            if (!_2553)
            {
                bool _2555 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2557 = isnan(_2207);
                bool _2559 = _2555 || _2557;
                bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2563 = _2559 || _2561;
                if (!_2563)
                {
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2567 = _2207 + _2565;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2569;
                    float _2573 = 1.0 / _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2595 = _2567 * _2573;
                    float _2597 = precise::clamp(_2595, 0.0, 1.0);
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2603 = fma(_2597, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2605 = fma(_2597, _2601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2607 = fma(_2597, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2609 = fma(_2597, _2585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2611 = fma(_2597, _2589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2613 = fma(_2597, _2593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2437 = _2605;
                    _2467 = _2611;
                    _2423 = _2603;
                    _2459 = _2609;
                    _2393 = _2607;
                    _2453 = _2613;
                    _2529 = true;
                }
                else
                {
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2529 = false;
    float _2615 = _2437;
    float _2617 = _2467;
    float _2619 = _2423;
    float _2621 = _2459;
    float _2623 = _2393;
    float _2625 = _2453;
    float _2627 = fma(_1118, -0.5, 0.5);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = -_2615;
    float _2633 = _2631 + _2617;
    float _2635 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2637 = -_2619;
    float _2639 = _2637 + _2621;
    float _2641 = fma(_2629, _2633, _2615);
    out.m_94.x = 0.0;
    float _2643 = -_2623;
    float _2645 = _2643 + _2625;
    float _2647 = fma(_2629, _2639, _2619);
    float _2649 = _2641 * 0.586610972881317138671875;
    out.m_61.x = _2635;
    bool _2651 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2653 = fma(_2629, _2645, _2623);
    float _2655 = fma(_2647, 0.298911988735198974609375, _2649);
    bool _2657 = _1921 > 0.0;
    bool _2659 = isnan(_1921);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan(0.0);
    bool _2665 = _2661 || _2663;
    float _2667 = fma(_2653, 0.114477999508380889892578125, _2655);
    bool _2669 = _1975 <= 0.0;
    bool _2671 = !_2665;
    bool _2673 = _2669 || _2671;
    float _2675 = -_2667;
    float _2677 = _2647 + _2675;
    float _2679 = -_2667;
    float _2681 = _2641 + _2679;
    float _2683 = -_2667;
    float _2685 = _2653 + _2683;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2689 = fma(_2681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    bool _2693 = !_2651;
    if (!_2693)
    {
        float _2695 = -_1544;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2699 = -_1546;
        float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2703 = -_1548;
        float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2707 = _2697 * _2697;
        float _2709 = fma(_2701, _2701, _2707);
        float _2711 = fma(_2705, _2705, _2709);
        float _2713 = sqrt(_2711);
        float _2715 = rsqrt(_2711);
        float _2717 = -_2713;
        float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2721 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = _2701 * _2715;
        float _2727 = _2697 * _2715;
        float _2729 = abs(_2723);
        float _2731 = log2(_2729);
        float _2733 = _2705 * _2715;
        float _2735 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2737 = _1118 * _2727;
        float _2739 = -_2727;
        float _2741 = -_2735;
        float _2743 = fma(_2739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2741);
        float _2745 = fma(_1106, _2725, _2737);
        float _2747 = -_2733;
        float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2743);
        float _2751 = fma(_1120, _2733, _2745);
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2757 = _2749 + _2755;
        float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = exp2(_2759);
        float _2767 = _2765 * _2763;
        float _2769 = _2753 * _2767;
        float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2771;
        out.m_94.y = _2773;
        out.m_94.z = _2775;
    }
    out.m_96.x = _2687;
    out.m_96.y = _2689;
    out.m_96.z = _2691;
    if (!_2673)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2777 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2777;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2529 = false;
    bool _1170 = false;
    bool _211 = false;
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
        float _2834 = as_type<float>(_131);
        out.gl_Position.z = _2834;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2903 = as_type<float>(_169);
        out.gl_Position.z = _2903;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _175 = as_type<int>(_171) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_171) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    float _209;
    if (!_191)
    {
        float _193 = in.m_68.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_115);
        float _215 = 1.0 / _213;
        float _217 = _149 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = in.m_68.z;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _219 + _223;
    float _227 = in.m_68.x;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = in.m_68.y;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = 1.0 / _231;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _251 = _249 != 0;
    float _253 = 1.0 / _235;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = _219 + _255;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _261 = _259 != 0;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _269 = _267 != 0;
    float _271 = _221 * 2.0;
    float _273 = 1.0 / _241;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _219 + _275;
    float _279 = _227 * 2.0;
    float _281 = _257 * _243;
    float _283 = _237 * 2.0;
    float _285 = _227 + _237;
    float _287 = _277 * _253;
    float _289 = floor(_271);
    float _291 = _237 + _221;
    float _293 = _291 + (-1.0);
    float _295 = _225 * _273;
    float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _299 = log2(_297);
    float _301 = _227 + _221;
    float _303 = _301 + (-1.0);
    float _305 = _285 + (-1.0);
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _309 = floor(_279);
    bool _311 = _289 > 0.0;
    float _313 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _315 = _289 >= 0.0;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan(0.0);
    bool _323 = _319 || _321;
    float _325 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _327 = _323 ? 0 : 1;
    float _329 = floor(_283);
    float _331 = _299 * _149;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    int _337 = ~_327;
    int _339 = _337 + 1;
    int _341 = _339 + 1;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _345 = 1.0 + _343;
    bool _347 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_219);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = fma(_335, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _361 = _341;
    if (!_311)
    {
        int _363 = ~_327;
        int _365 = _363 + 1;
        _361 = _365;
    }
    int _367 = _361;
    float _369 = exp2(_331);
    bool _371 = _309 >= 0.0;
    bool _373 = isnan(_309);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    bool _385 = !_261;
    int _387 = _385 ? 0 : 1;
    float _389 = -_357;
    float _391 = _389 + 1.0;
    int _393 = _379 ? 0 : 1;
    float _395 = fma(_383, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _397 = _309 > 0.0;
    float _399 = 1.0 / _345;
    bool _401 = _329 > 0.0;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _407 = _329 >= 0.0;
    bool _409 = isnan(_329);
    bool _411 = _407 || _409;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _421 = !_265;
    int _423 = _421 ? 0 : 1;
    float _425 = fma(_405, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _427 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _429 = isnan(_219);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -_369;
    float _441 = _439 + 1.0;
    bool _443 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _451 = _447 || _449;
    float _453 = fma(_419, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _455 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _457 = isnan(_219);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _437 * _391;
    float _469 = _451 ? _441 : 0.0;
    float _471 = -_437;
    float _473 = _471 + 1.0;
    bool _475 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _477 = isnan(1.0);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _483 = _479 || _481;
    float _485 = in.m_70.x;
    float _487 = in.m_70.y;
    float _489 = in.m_70.z;
    bool _491 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _493 = isnan(_219);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _465 * _473;
    float _505 = -_465;
    float _507 = _505 + 1.0;
    int _509 = abs(_387);
    int _511 = abs(_423);
    float _513 = _501 * _507;
    int _515 = _415 ? 0 : 1;
    float _517 = -_501;
    float _519 = _517 + 1.0;
    float _521 = _395 * _513;
    if (_483)
    {
        float _523 = _469 * _399;
        _153 = _523;
    }
    float _525 = _153;
    float _527 = float(_509);
    float _529 = float(_367);
    float _531 = _359 * _513;
    int _533 = ~_393;
    int _535 = _533 + 1;
    int _537 = _535 + 1;
    int _539 = _537;
    if (!_397)
    {
        int _541 = ~_393;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    float _547 = _527 * _529;
    float _549 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].y, _531);
    bool _551 = !_269;
    int _553 = _551 ? 0 : 1;
    float _555 = float(_511);
    float _557 = fma(_453, _503, _549);
    float _559 = float(_545);
    float _561 = _547 * (-2.0);
    float _563 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _565 = abs(_553);
    float _567 = fma(_325, _561, _325);
    int _569 = ~_515;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = fma(_561, _485, _485);
    int _577 = _573;
    if (!_401)
    {
        int _579 = ~_515;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = _563 * _227;
    float _587 = _555 * _559;
    bool _589 = _227 > 0.5;
    float _591 = _227 + (-0.5);
    float _593 = float(_565);
    float _595 = _587 * (-2.0);
    float _597 = float(_583);
    float _599 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[196].x, _575);
    bool _601 = _237 > 0.5;
    float _603 = _237 + (-0.5);
    float _605 = fma(_595, _487, _487);
    float _607 = _593 * _597;
    float _609 = fma(_567, _525, _599);
    float _611 = fma(_307, _595, _307);
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _605);
    float _615 = _607 * (-2.0);
    float _617 = _609 * 0.15915493667125701904296875;
    float _619 = in.m_58.x;
    float _621 = in.m_58.y;
    float _623 = in.m_58.z;
    float _625 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[143].x, _521);
    float _627 = fma(_313, _615, _313);
    float _629 = in.m_72.x;
    float _631 = in.m_72.y;
    float _633 = in.m_72.z;
    float _635 = fma(_615, _489, _489);
    float _637 = fma(_611, _525, _613);
    float _639 = _221 + (-0.5);
    float _641 = in.m_74.x;
    float _643 = in.m_74.y;
    float _645 = in.m_74.z;
    float _647 = _637 * 0.15915493667125701904296875;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _649;
    float _653 = in.m_76.x;
    float _655 = in.m_76.y;
    float _657 = in.m_76.z;
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].z, _635);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _661;
    float _665 = fma(_651, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _667 = in.m_78.x;
    float _669 = in.m_78.y;
    float _671 = fma(_425, _503, _625);
    float _673 = fma(_627, _525, _659);
    float _675 = fma(_663, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _677 = _617 * 6.283185482025146484375;
    float _679 = sin(_677);
    float _681 = fma(_665, _467, _671);
    float _683 = _673 * 0.15915493667125701904296875;
    float _685 = fma(_675, _467, _557);
    float _687 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _685);
    float _689 = _621 * _631;
    float _691 = _617 * 6.283185482025146484375;
    float _693 = cos(_691);
    float _695 = _621 * _643;
    float _697 = fma(_619, _629, _689);
    float _699 = _621 * _655;
    float _701 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _681);
    float _703 = _647 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = fma(_619, _641, _695);
    float _709 = _687 * _669;
    float _711 = _701 * _667;
    float _713 = fma(_619, _653, _699);
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = _647 * 6.283185482025146484375;
    float _723 = cos(_721);
    float _725 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _727 = fma(_623, _645, _707);
    float _729 = _719 * _715;
    float _731 = fma(_623, _633, _697);
    float _733 = _725 * _717;
    float _735 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _737 = _727 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _739 = _683 * 6.283185482025146484375;
    float _741 = cos(_739);
    float _743 = _679 * _705;
    float _745 = _693 * _705;
    float _747 = _731 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _749 = _683 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _693 * _723;
    float _755 = _679 * _723;
    float _757 = _693 * _741;
    float _759 = _679 * _741;
    float _761 = _723 * _741;
    float _763 = _705 * _741;
    float _765 = _757 * _729;
    float _767 = _759 * _729;
    float _769 = trunc(_585);
    int _771 = int(_769);
    float _773 = _757 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _775 = fma(_751, _753, _743);
    float _777 = -_729;
    float _779 = _751 * _777;
    float _781 = -_755;
    float _783 = fma(_751, _745, _781);
    float _785 = -_745;
    float _787 = fma(_751, _755, _785);
    float _789 = fma(_775, _733, _765);
    float _791 = fma(_761, _733, _779);
    float _793 = fma(_751, _743, _753);
    float _795 = fma(_787, _733, _767);
    float _797 = fma(_783, _735, _789);
    float _799 = fma(_763, _735, _791);
    float _801 = fma(_623, _657, _713);
    float _803 = fma(_793, _735, _795);
    float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _807 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _809 = _801 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _811 = _757 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _805);
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _807);
    float _817 = _757 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _819 = -_751;
    float _821 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[24].x, _811);
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _825 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _827 = -_751;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _773);
    float _831 = -_751;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _817);
    float _835 = _823 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _837 = _825 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _839 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _821);
    float _841 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _843 = _747 + _835;
    float _845 = _809 + _837;
    float _847 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _833);
    float _849 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _853 = _843 + _851;
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _857 = _845 + _855;
    float _859 = _775 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _775 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _863 = _853 * _853;
    float _865 = _857 * _857;
    float _867 = _775 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _869 = -_189;
    int _871 = _601 ? as_type<int>(_869) : as_type<int>(_189);
    float _873 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _875 = _863 + _865;
    float _877 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _879 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _881 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _849);
    float _883 = sqrt(_875);
    bool _885 = !_251;
    float _887 = _885 ? _189 : as_type<float>(_871);
    float _889 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _891 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _881);
    float _893 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    int _895 = _771 << 4;
    int _897 = _895 + 1712;
    float _899 = _889 * _839;
    float _901 = _889 * _841;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _905 = _889 * _847;
    float _907 = _891 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].x, _861);
    float _911 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _867);
    int _913 = _897 + 8;
    uint _916 = uint(int(uint(_913) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    float _924 = _737 + _907;
    float _926 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _873);
    bool _928 = _883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].z, _893);
    float _932 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].z, _909);
    float _934 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].z, _911);
    float _936 = -_185;
    int _938 = _589 ? as_type<int>(_936) : as_type<int>(_185);
    uint _940 = uint(int(uint(_897) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[int(_950)][_952];
    float _956 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _877);
    float _958 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _879);
    float _960 = _787;
    float _962 = _907;
    float _964 = _911;
    float _966 = _863;
    float _968 = _865;
    float _970 = _617;
    if (!_928)
    {
        _960 = _843;
    }
    float _972 = _960;
    float _974 = _972;
    if (!_928)
    {
        _962 = _845;
    }
    float _976 = _962;
    float _978 = _976;
    if (!_928)
    {
        _964 = _924;
    }
    float _980 = _964;
    bool _982 = !_928;
    float _984 = _980;
    float _986 = _903;
    if (!_982)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _992 = _883 + _990;
        float _994 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = rsqrt(_875);
        float _998 = _992 * _988;
        float _1000 = _998 * 0.15915493667125701904296875;
        float _1002 = _1000 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = cos(_1006);
        float _1010 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _996 * _1010;
        float _1014 = fma(_853, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1016 = _1008 + (-1.0);
        float _1018 = fma(_857, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1022 = _1014 + _1020;
        float _1024 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1028 = _1018 + _1026;
        float _1030 = _1022 * _1022;
        float _1032 = fma(_924, _1008, _1024);
        float _1034 = _1028 * _1028;
        _984 = _1032;
        _966 = _1030;
        _968 = _1034;
        _978 = _1018;
        _974 = _1014;
    }
    float _1036 = _984;
    float _1038 = _966;
    float _1040 = _968;
    float _1042 = _978;
    float _1044 = _974;
    float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1048 = !_247;
    float _1050 = _1048 ? _185 : as_type<float>(_938);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1054 = _1036 + _1052;
    float _1056 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1058 = -_887;
    float _1060 = _1058 + 0.5;
    float _1062 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[26].z, _958);
    float _1064 = fma(_1054, _1054, _1038);
    float _1066 = fma(_1056, _930, _899);
    float _1068 = fma(_1056, _932, _901);
    float _1070 = fma(_1056, _934, _905);
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1074 = _1064 + _1040;
    float _1076 = _1050 + 0.5;
    float _1078 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[24].z, _926);
    float _1080 = _1072 * _1046;
    float _1082 = sqrt(_1074);
    float _1084 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[25].z, _956);
    float _1086 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1088 = _922 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1092 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1090 * _903;
    float _1106 = _1078 + _1066;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1110 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1084 + _1068;
    float _1120 = _1062 + _1070;
    out.m_80.x = _1104;
    out.m_80.y = _1080;
    bool _1122 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1124 = isnan(_1082);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1130 = _1126 || _1128;
    out.m_82.x = _1110;
    out.m_82.y = _1112;
    out.m_82.z = _1114;
    out.m_84.x = _1116;
    out.m_84.y = _1100;
    out.m_84.z = _1102;
    out.m_84.w = _1108;
    out.m_86.x = _1106;
    out.m_86.y = _1118;
    out.m_86.z = _1120;
    float _1132 = _1042;
    int _1134 = as_type<int>(_1044);
    if (!_1130)
    {
        _986 = 1.0;
    }
    float _1136 = _986;
    bool _1138 = !_1130;
    float _1140 = _1136;
    if (!_1138)
    {
        bool _1142 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1144 = isnan(_1082);
        bool _1146 = _1142 || _1144;
        bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1150 = _1146 || _1148;
        if (!_1150)
        {
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = _1082 + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1158 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1156;
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1162 = _1160 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1164 = 1.0 / _1158;
            float _1166 = _1154 * _1164;
            float _1168 = fma(_1166, _1162, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1140 = _1168;
            _1170 = true;
        }
        else
        {
            bool _1172 = _1082 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1174 = isnan(_1082);
            bool _1176 = _1172 || _1174;
            bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1180 = _1176 || _1178;
            if (!_1180)
            {
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1082 + _1182;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1194 = 1.0 / _1188;
                float _1196 = _1184 * _1194;
                float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1140 = _1198;
                _1170 = true;
            }
            else
            {
                _1140 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1170 = false;
    float _1200 = _1140;
    float _1202 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1204 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1206 = floor(_1202);
    float _1208 = floor(_1204);
    float _1210 = -_1206;
    float _1212 = _1202 + _1210;
    float _1214 = -_1208;
    float _1216 = _1204 + _1214;
    float2 _4583 = float2(_1212, _1216);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4583, float2(0.0), isnan(_4583)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4583, float2(0.0), isnan(_4583)), level(0.0)).x;
    float _1220 = _737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1036 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1228 = _1042 + _1226;
    float _1230 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1220);
    float _1232 = fma(_1228, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1234 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1230);
    float _1236 = _737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1240 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1242 = 1.0 / _1238;
    float _1244 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1240);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _1246 + _1238;
    float _1250 = _1248 * _1242;
    float _1252 = _1250 * 0.5;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1256 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1254);
    float _1258 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1260 = _737 + _1258;
    float _1262 = 1.0 / _1256;
    float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1268 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1264);
    float _1270 = fma(_747, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1266);
    float _1272 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1268);
    float _1274 = fma(_809, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1270);
    float _1276 = _1272 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1280 = _1262 * _1278;
    float _1282 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1284 = trunc(_1276);
    int _1286 = int(_1284);
    bool _1288 = _1280 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1290 = _1280 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1292 = !_1288;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = trunc(_1282);
    int _1298 = int(_1296);
    int _1300 = 2;
    int _1302 = as_type<int>(_1228);
    int _1304 = as_type<int>(_1200);
    if (!_1288)
    {
        _1300 = 1;
    }
    int _1306 = _1300;
    int _1308 = _1306;
    if (!_1290)
    {
        _1308 = _1294;
    }
    int _1310 = _1308;
    int _1312 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1314 = _1286 + _1312;
    int _1316 = _1314 + 1;
    int _1318 = _1310 << 6;
    bool _1320 = _1316 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1322 = _1318 + 48;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[int(_1334)][_1336];
    int _1340 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1342 = _1298 + _1340;
    int _1344 = _1342 + 1;
    float _1346 = fma(_1224, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _1348 = _1316 | _1344;
    int _1350 = _1318 + 56;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    uint _1354 = uint(int(uint(int(_1352)) >> uint(2)));
    int _1356 = int(_1352) & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    int _1360 = int(_1352) + 1;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    int _1364 = _1360 & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    bool _1368 = _1348 < 0;
    bool _1370 = _1368 || _1320;
    bool _1372 = _1344 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1374 = _1372 || _1370;
    bool _1376 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.5);
    bool _1384 = _1380 || _1382;
    int _1386 = _1318 + 64;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
    int _1392 = int(_1388) & 3;
    float _1394 = (*spvDescriptorSet0.vp_c15)._m0[int(_1390)][_1392];
    int _1396 = int(_1388) + 1;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    int _1400 = _1396 & 3;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[int(_1398)][_1400];
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1406 = _1044 + _1404;
    float _1408 = fma(_1406, _1200, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1410 = _1318 + 72;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c15)._m0[int(_1422)][_1424];
    float _1428 = _1406;
    float _1430 = as_type<float>(_1316);
    float _1432 = _1408;
    float _1434 = as_type<float>(_1310);
    if (!_1374)
    {
        int _1436 = _1344 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1438 = _1436 + _1316;
        _1302 = _1438;
    }
    int _1440 = _1302;
    float _1442 = as_type<float>(_1440);
    if (_1384)
    {
        _1132 = _1408;
    }
    float _1444 = _1132;
    float _1446 = _1444;
    if (_1384)
    {
        _1428 = _1346;
    }
    float _1448 = _1428;
    int _1450 = _1318 + 96;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    uint _1454 = uint(int(uint(int(_1452)) >> uint(2)));
    int _1456 = int(_1452) & 3;
    float _1458 = (*spvDescriptorSet0.vp_c15)._m0[int(_1454)][_1456];
    int _1460 = int(_1452) + 1;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    int _1464 = _1460 & 3;
    float _1466 = (*spvDescriptorSet0.vp_c15)._m0[int(_1462)][_1464];
    float _1468 = _1448;
    if (_1384)
    {
        _1430 = _1232;
    }
    float _1470 = _1430;
    int _1472 = _1318 + 104;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
    int _1478 = int(_1474) & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = int(_1474) + 1;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    int _1486 = _1482 & 3;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
    float _1490 = _1470;
    int _1492 = as_type<int>(_1458);
    if (!_1384)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1496 = _737 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1500 = _747 + _1498;
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = -_747;
        float _1506 = _1504 + _1408;
        float _1508 = _1496 * _1496;
        float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1512 = _809 + _1510;
        float _1514 = -_809;
        float _1516 = _1514 + _1232;
        float _1518 = fma(_1500, _1500, _1508);
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1522 = fma(_1512, _1512, _1518);
        float _1524 = sqrt(_1522);
        float _1526 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1528 = precise::min(_1524, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1530 = _1528 * _1520;
        float _1532 = -_737;
        float _1534 = _1532 + _1346;
        float _1536 = _1526 * _1530;
        float _1538 = fma(_1534, _1536, _737);
        float _1540 = fma(_1506, _1536, _747);
        float _1542 = fma(_1516, _1536, _809);
        _1468 = _1538;
        _1446 = _1540;
        _1490 = _1542;
        _1304 = as_type<int>(_1502);
        _1134 = as_type<int>(_1534);
        _1432 = _1516;
    }
    float _1544 = _1468;
    float _1546 = _1446;
    float _1548 = _1490;
    int _1550 = _1304;
    int _1552 = _1134;
    float _1554 = _1432;
    float _1556 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1260 * _1466;
    int _1560 = _1550;
    int _1562 = _1552;
    if (!_1374)
    {
        int _1564 = _1440 << 2;
        _1560 = _1564;
    }
    int _1566 = _1560;
    float _1568 = _1260 * _1402;
    float _1570 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    float _1572 = fma(_747, _1458, _1558);
    if (!_1374)
    {
        uint _1574 = uint(int(uint(_1440) >> uint(2)));
        _1562 = int(_1574);
    }
    int _1576 = _1562;
    float _1578 = fma(_747, _1394, _1568);
    float _1580 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1570);
    if (!_1374)
    {
        int _1582 = 12 & _1566;
        _1492 = _1582;
    }
    int _1584 = _1492;
    float _1586 = fma(_809, _1480, _1572);
    float _1588 = _1260 * _1338;
    float _1590 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = as_type<float>(_1584);
    if (!_1374)
    {
        int _1594 = _1576 << 4;
        int _1596 = _1594 + _1584;
        _1592 = as_type<float>(_1596);
    }
    float _1598 = _1592;
    float _1600 = _1586 + _1488;
    int _1602 = _1318 + 80;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    uint _1606 = uint(int(uint(int(_1604)) >> uint(2)));
    int _1608 = int(_1604) & 3;
    float _1610 = (*spvDescriptorSet0.vp_c15)._m0[int(_1606)][_1608];
    int _1612 = int(_1604) + 1;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    int _1616 = _1612 & 3;
    float _1618 = (*spvDescriptorSet0.vp_c15)._m0[int(_1614)][_1616];
    float _1620 = fma(_747, _1330, _1588);
    float _1622 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1624 = 1.0 / _1600;
    float _1626 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = fma(_809, _1358, _1620);
    float _1630 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1632 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1634 = _1598;
    if (!_1374)
    {
        int _1636 = as_type<int>(_1598) + 400;
        uint _1638 = uint(int(uint(_1636) >> uint(2)));
        uint _1640 = uint(int(uint(int(_1638)) >> uint(2)));
        int _1642 = int(_1638) & 3;
        float _1644 = (*spvDescriptorSet0.vp_c15)._m0[int(_1640)][_1642];
        _1634 = _1644;
    }
    float _1646 = _1634;
    float _1648 = _1628 + _1366;
    float _1650 = -_1626;
    float _1652 = fma(_1650, _1622, 1.0);
    float _1654 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1630);
    float _1656 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1632);
    float _1658 = fma(_809, _1418, _1578);
    float _1660 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1654);
    int _1664 = _1318 + 88;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    uint _1668 = uint(int(uint(int(_1666)) >> uint(2)));
    int _1670 = int(_1666) & 3;
    float _1672 = (*spvDescriptorSet0.vp_c15)._m0[int(_1668)][_1670];
    int _1674 = int(_1666) + 1;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    int _1678 = _1674 & 3;
    float _1680 = (*spvDescriptorSet0.vp_c15)._m0[int(_1676)][_1678];
    float _1682 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1684 = _1658 + _1426;
    float _1686 = _1648 * _1624;
    float _1688 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1692 = _1684 * _1624;
    float _1694 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    bool _1696 = _1686 >= 0.0;
    float _1698 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = log2(_1652);
    float _1702 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1694);
    bool _1704 = _1686 <= 1.0;
    bool _1706 = _1704 && _1696;
    float _1708 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1710 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1712 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1714 = _1692 >= 0.0;
    bool _1716 = _1714 && _1706;
    float _1718 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = _1652;
    if (!_1374)
    {
        float _1722 = floor(_1282);
        _1720 = _1722;
    }
    float _1724 = _1720;
    bool _1726 = _1692 <= 1.0;
    bool _1728 = _1726 && _1716;
    float _1730 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1732 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1710);
    float _1734 = 1.0 / _1730;
    float _1736 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1738 = _1700 * 0.693147182464599609375;
    float _1740 = _1260 * _1618;
    float _1742 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1554;
    float _1746 = _1736;
    if (!_1374)
    {
        float _1748 = floor(_1276);
        _1744 = _1748;
    }
    float _1750 = _1744;
    if (_1728)
    {
        float _1752 = float(_1310);
        _1434 = _1752;
    }
    float _1754 = _1434;
    float _1756 = fma(_747, _1610, _1740);
    float _1758 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1760 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1736);
    float _1762 = _1724;
    float _1764 = _1754;
    if (!_1374)
    {
        float _1766 = -_1724;
        float _1768 = _1282 + _1766;
        _970 = _1768;
    }
    float _1770 = _970;
    float _1772 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1758);
    float _1774 = _1646;
    if (!_1374)
    {
        float _1776 = rint(_1646);
        float _1778 = precise::max(_1776, 0.0);
        uint _1780 = uint(_1778);
        uint _1782 = clamp(_1780, 0u, 65535u);
        _1774 = as_type<float>(_1782);
    }
    float _1784 = _1774;
    float _1786 = _1760 * _1734;
    float _1788 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1772);
    float _1790 = fma(_1786, -0.5, 0.5);
    float _1792 = fma(_809, _1672, _1756);
    float _1794 = _1756;
    float _1796 = _1788;
    if (_1728)
    {
        float _1798 = rint(_1754);
        float _1800 = precise::max(_1798, 0.0);
        uint _1802 = uint(_1800);
        uint _1804 = clamp(_1802, 0u, 65535u);
        _1794 = as_type<float>(_1804);
    }
    float _1806 = _1794;
    if (!_1374)
    {
        float _1808 = -_1750;
        float _1810 = _1276 + _1808;
        _1762 = _1810;
    }
    float _1812 = _1762;
    float _1814 = _1792 + _1680;
    float _1816 = _1788 * _1734;
    float _1818 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = _1814 * _1624;
    float _1822 = fma(_1816, 0.5, 0.5);
    float _1824 = _1784;
    if (!_1374)
    {
        float3 _5622 = float3(_1812, _1770, float(as_type<int>(_1784)));
        float3 _5626 = select(_5622, float3(0.0), isnan(_5622));
        float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5626.xy, uint(rint(_5626.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5626.xy, uint(rint(_5626.z)), level(0.0)).x;
        _1824 = _1826;
    }
    float _1828 = _1824;
    float _1830 = _1692;
    if (_1728)
    {
        float3 _5641 = float3(_1686, _1692, float(as_type<int>(_1806)));
        float3 _5643 = select(_5641, float3(0.0), isnan(_5641));
        float _1832 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5643.xy, uint(rint(_5643.z)), _1820, level(0.0));
        _1830 = _1832;
    }
    float _1834 = _1830;
    float3 _5653 = float3(_1822, _1790, _1818);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5653, float3(0.0), isnan(_5653)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5653, float3(0.0), isnan(_5653)), level(0.0)).x;
    float3 _5662 = float3(_1822, _1790, _1818);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5662, float3(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5662, float3(0.0), isnan(_5662)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1374)
    {
        _1764 = 1.0;
    }
    float _1851 = _1764;
    bool _1853 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.5);
    bool _1861 = _1857 || _1859;
    float _1863 = _1851;
    if (_1861)
    {
        _1849 = 1.0;
    }
    float _1865 = _1849;
    float _1867 = _1865;
    if (_1861)
    {
        _1746 = 1.0;
    }
    float _1869 = _1746;
    float _1871 = _1869;
    if (!_1861)
    {
        float _1873 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1877 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1875;
        float _1879 = _1873 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = cos(_1881);
        float _1885 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1887 = _1885 * 0.15915493667125701904296875;
        float _1889 = _1879 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        float _1893 = 1.0 / _1883;
        float _1895 = _1887 * 6.283185482025146484375;
        float _1897 = cos(_1895);
        float _1899 = _1891 * _1893;
        float _1901 = _1887 * 6.283185482025146484375;
        float _1903 = sin(_1901);
        float _1905 = _1897 * _1899;
        float _1907 = 1.0 / _1877;
        float _1909 = 1.0 / _1905;
        float _1911 = _1903 * _1909;
        float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1915 = fma(_1280, _1911, _1913);
        float _1917 = _1915 * _1907;
        float _1919 = precise::clamp(_1917, 0.0, 1.0);
        _1871 = _1919;
    }
    float _1921 = _1871;
    if (!_1861)
    {
        float _1923 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1925 = _1923 * 0.15915493667125701904296875;
        float _1927 = _1925 * 6.283185482025146484375;
        float _1929 = cos(_1927);
        float _1931 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1933 = _1931 * 0.15915493667125701904296875;
        float _1935 = _1925 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = 1.0 / _1929;
        float _1941 = _1933 * 6.283185482025146484375;
        float _1943 = cos(_1941);
        float _1945 = _1937 * _1939;
        float _1947 = _1933 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = _1943 * _1945;
        float _1953 = 1.0 / _1951;
        float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1957 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1955;
        float _1959 = 1.0 / _1957;
        float _1961 = _1949 * _1953;
        float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1965 = fma(_1280, _1961, _1963);
        float _1967 = _1965 * _1959;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        float _1971 = -_1969;
        float _1973 = _1971 + 1.0;
        _1867 = _1973;
    }
    float _1975 = _1867;
    if (!_1374)
    {
        int _1977 = _1440 << 4;
        int _1979 = _1977 + 2048;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
        int _1985 = int(_1981) & 3;
        float _1987 = (*spvDescriptorSet0.vp_c15)._m0[int(_1983)][_1985];
        int _1989 = int(_1981) + 1;
        uint _1991 = uint(int(uint(_1989) >> uint(2)));
        int _1993 = _1989 & 3;
        float _1995 = (*spvDescriptorSet0.vp_c15)._m0[int(_1991)][_1993];
        int _1997 = _1979 + 8;
        uint _1999 = uint(int(uint(_1997) >> uint(2)));
        uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
        int _2003 = int(_1999) & 3;
        float _2005 = (*spvDescriptorSet0.vp_c15)._m0[int(_2001)][_2003];
        int _2007 = int(_1999) + 1;
        uint _2009 = uint(int(uint(_2007) >> uint(2)));
        int _2011 = _2007 & 3;
        float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
        float _2015 = _1260 * _1995;
        float _2017 = fma(_747, _1987, _2015);
        float _2019 = fma(_809, _2005, _2017);
        float _2021 = _2019 + _2013;
        float _2023 = precise::clamp(_2021, 0.0, 1.0);
        float _2025 = -_2023;
        float _2027 = _2025 + _1828;
        float _2029 = fma(_2027, 500.0, 1.5);
        float _2031 = exp2(_2029);
        float _2033 = 0.0 + _2031;
        float _2035 = precise::clamp(_2033, 0.0, 1.0);
        _1442 = as_type<float>(_1979);
        _1863 = _2035;
    }
    float _2037 = _1442;
    float _2039 = _1863;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2043 = _1544 + _2041;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2047 = _1546 + _2045;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2051 = _1548 + _2049;
    float _2053 = _2043 * _2043;
    float _2055 = fma(_2047, _2047, _2053);
    float _2057 = fma(_2051, _2051, _2055);
    float _2059 = rsqrt(_2057);
    float _2061 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2063 = _2047 * _2061;
    float _2065 = _2051 * _2061;
    float _2067 = _2063 * _2063;
    float _2069 = _2065 * _2065;
    float _2071 = _2067 + _2069;
    float _2073 = sqrt(_2071);
    bool _2075 = _2073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2079 = _2073 + _2077;
    float _2081 = _2051;
    float _2083 = _2053;
    float _2085 = _2079;
    float _2087 = _2037;
    float _2089 = _2061;
    if (_2075)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2081 = _2091;
    }
    float _2093 = _2081;
    if (_2075)
    {
        float _2095 = rsqrt(_2071);
        _2083 = _2095;
    }
    float _2097 = _2083;
    float _2099 = _2097;
    if (_2075)
    {
        float _2101 = _2079 * _2093;
        _2085 = _2101;
    }
    float _2103 = _2085;
    if (_2075)
    {
        float _2105 = _2103 * 0.15915493667125701904296875;
        _2087 = _2105;
    }
    float _2107 = _2087;
    float _2109 = _2059;
    if (_2075)
    {
        float _2111 = _2107 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        _2109 = _2113;
    }
    float _2115 = _2109;
    float _2117 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2119 = precise::max(0.0, _2117);
    float _2121 = _1828;
    float _2123 = _2119;
    float _2125 = _2115;
    float _2127 = _2117;
    if (_2075)
    {
        float _2129 = _2107 * 6.283185482025146484375;
        float _2131 = cos(_2129);
        _2121 = _2131;
    }
    float _2133 = _2121;
    float _2135 = -_2061;
    float _2137 = -_2119;
    float _2139 = fma(_2043, _2135, _2137);
    float _2141 = _2139;
    if (_2075)
    {
        float _2143 = _2139 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2143;
    }
    float _2145 = _2123;
    float _2147 = _2145;
    if (_2075)
    {
        float _2149 = fma(_2115, _2145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2125 = _2149;
    }
    float _2151 = _2125;
    float _2153 = _2151;
    if (!_2075)
    {
        _2147 = _2065;
    }
    float _2155 = _2147;
    float _2157 = _2155;
    float _2159 = _2133;
    if (_2075)
    {
        float _2161 = _2133 + (-1.0);
        _2127 = _2161;
    }
    float _2163 = _2127;
    float _2165 = _2163;
    if (_2075)
    {
        float _2167 = _2097 * _2151;
        _2089 = _2167;
    }
    float _2169 = _2089;
    if (!_2075)
    {
        _2153 = _2063;
    }
    float _2171 = _2153;
    float _2173 = _2171;
    if (_2075)
    {
        float _2175 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2165 = _2175;
    }
    float _2177 = _2165;
    if (_2075)
    {
        float _2179 = _2063 * _2169;
        _2173 = _2179;
    }
    float _2181 = _2173;
    if (!_2075)
    {
        _2099 = _2067;
    }
    float _2183 = _2099;
    float _2185 = _2183;
    if (_2075)
    {
        float _2187 = _2065 * _2169;
        _2157 = _2187;
    }
    float _2189 = _2157;
    if (_2075)
    {
        float _2191 = fma(_2139, _2133, _2177);
        _2141 = _2191;
    }
    float _2193 = _2141;
    if (_2075)
    {
        float _2195 = _2181 * _2181;
        _2185 = _2195;
    }
    float _2197 = _2185;
    if (!_2075)
    {
        _2159 = _2069;
    }
    float _2199 = _2159;
    float _2201 = _2199;
    if (_2075)
    {
        float _2203 = _2189 * _2189;
        _2201 = _2203;
    }
    float _2205 = _2201;
    float _2207 = sqrt(_2057);
    float _2209 = fma(_2193, _2193, _2197);
    float _2211 = _2209 + _2205;
    float _2213 = rsqrt(_2211);
    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2217 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2215);
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = -_2219;
    float _2223 = _2221 + 1.0;
    float _2225 = _2213 * _2181;
    float _2227 = _2213 * _2193;
    float _2229 = _2213 * _2189;
    float _2231 = abs(_2223);
    float _2233 = log2(_2231);
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2237 = -_2235;
    float _2239 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2237);
    float _2241 = -_2229;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2239);
    float _2245 = fma(_2243, -0.5, 0.5);
    float _2247 = fma(_2243, 0.5, 0.5);
    float _2249 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2251 = fma(_2247, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2253 = sqrt(_2245);
    float _2255 = fma(_2247, _2251, -0.212114393711090087890625);
    float _2257 = _2227 + 1.0;
    float _2259 = fma(_2247, _2255, 1.570728778839111328125);
    float _2261 = exp2(_2249);
    float _2263 = _2253 * 0.636619746685028076171875;
    float _2265 = -_2227;
    float _2267 = fma(_2261, _2257, _2265);
    float _2269 = -_2259;
    float _2271 = fma(_2263, _2269, 1.0);
    float _2273 = fma(_2267, 0.5, 0.5);
    float2 _6301 = float2(_2271, _2273);
    float3 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6301, float2(0.0), isnan(_6301)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6301, float2(0.0), isnan(_6301)), level(0.0)).xyz;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = abs(_1280);
    float _2287 = log2(_2285);
    float _2289 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2291 = _2233 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = -_1218;
    float _2295 = _2293 + 1.0;
    float _2297 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2289);
    float _2299 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2297);
    float _2301 = exp2(_2291);
    bool _2303 = _1280 <= 8000.0;
    bool _2305 = isnan(_1280);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(8000.0);
    bool _2311 = _2307 || _2309;
    float _2313 = float(_2311);
    float _2315 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2299);
    float _2317 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2319 = _2315 + _1730;
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1760;
    out.gl_Position.z = _2315;
    out.gl_Position.w = _1730;
    float _2321 = _2319 * 0.5;
    float _2323 = exp2(_2317);
    out.m_88.z = _2321;
    out.m_88.w = _1730;
    float _2325 = -_2301;
    float _2327 = _2325 + 1.0;
    float _2329 = _2327;
    if (!_1728)
    {
        _1796 = 1.0;
    }
    float _2331 = _1796;
    float _2333 = _2331;
    if (_1728)
    {
        bool _2335 = _1834 >= _1820;
        bool _2337 = isnan(_1834);
        bool _2339 = _2335 || _2337;
        bool _2341 = isnan(_1820);
        bool _2343 = _2339 || _2341;
        float _2345 = float(_2343);
        _2333 = _2345;
    }
    float _2347 = _2333;
    float _2349 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2351 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2353 = isnan(_2207);
    bool _2355 = _2351 || _2353;
    bool _2357 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2359 = _2355 || _2357;
    float _2361 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = _2347 * _2039;
    float _2367 = _2349 * _1836;
    float _2369 = fma(_2363, -2.0, 3.0);
    float _2371 = _2363 * _2363;
    float _2373 = _2371 * _2369;
    float _2375 = _2349;
    if (!_2359)
    {
        _2329 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2377 = _2329;
    float _2379 = -_2373;
    float _2381 = _2379 + 1.0;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2373);
    float _2385 = _2313 * _2383;
    float _2387 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2389 = _2385;
    float _2391 = _2377;
    float _2393 = _2377;
    if (!_2359)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2395 = _2389;
    float _2397 = _2295 * _2387;
    float _2399 = precise::clamp(_2397, 0.0, 1.0);
    float _2401 = _1847 * _2367;
    float _2403 = -_2399;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2407 = -_2365;
    float _2409 = fma(_2407, _2405, 1.0);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = -_2349;
    float _2415 = _2413 + 1.0;
    float _2417 = _2401;
    float _2419 = _2415;
    float _2421 = _2395;
    float _2423 = _2395;
    if (!_2359)
    {
        _2375 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2425 = _2375;
    float _2427 = _2411 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2429 = _1921 * _1975;
    out.m_90.x = _2427;
    float _2431 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2433 = _2429;
    float _2435 = _2425;
    float _2437 = _2425;
    if (!_2359)
    {
        _2433 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2439 = _2433;
    float _2441 = _2283 * _2367;
    float _2443 = fma(_2279, _2401, _1841);
    float _2445 = fma(_2281, _2401, _1843);
    float _2447 = _1847 * _2415;
    float _2449 = fma(_1847, _2441, _1845);
    float _2451 = _2439;
    float _2453 = _2439;
    if (!_2359)
    {
        _2417 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2455 = _2417;
    float _2457 = _2455;
    float _2459 = _2455;
    if (!_2359)
    {
        _2419 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2461 = _2419;
    out.m_92.x = _2443;
    out.m_92.y = _2445;
    out.m_92.z = _2449;
    out.m_92.w = _2447;
    bool _2463 = !_2359;
    float _2465 = _2461;
    float _2467 = _2461;
    if (!_2463)
    {
        bool _2469 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2471 = isnan(_2207);
        bool _2473 = _2469 || _2471;
        bool _2475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2477 = _2473 || _2475;
        if (!_2477)
        {
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2481 = _2207 + _2479;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2483;
            float _2487 = 1.0 / _2485;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2509 = _2481 * _2487;
            float _2511 = precise::clamp(_2509, 0.0, 1.0);
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2517 = fma(_2511, _2491, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2519 = fma(_2511, _2515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2521 = fma(_2511, _2495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2523 = fma(_2511, _2499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2525 = fma(_2511, _2503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2527 = fma(_2511, _2507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2437 = _2519;
            _2467 = _2525;
            _2423 = _2517;
            _2459 = _2523;
            _2393 = _2521;
            _2453 = _2527;
            _2529 = true;
        }
        else
        {
            bool _2531 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2533 = isnan(_2207);
            bool _2535 = _2531 || _2533;
            bool _2537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2539 = _2535 || _2537;
            if (!_2539)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2541 = _2421;
            _2423 = _2541;
            if (!_2539)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2543 = _2435;
            _2437 = _2543;
            if (!_2539)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2545 = _2391;
            _2393 = _2545;
            if (!_2539)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2547 = _2457;
            _2459 = _2547;
            if (!_2539)
            {
                _2465 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2549 = _2465;
            _2467 = _2549;
            if (!_2539)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2551 = _2451;
            bool _2553 = !_2539;
            _2453 = _2551;
            if (!_2553)
            {
                bool _2555 = _2207 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2557 = isnan(_2207);
                bool _2559 = _2555 || _2557;
                bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2563 = _2559 || _2561;
                if (!_2563)
                {
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2567 = _2207 + _2565;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2569;
                    float _2573 = 1.0 / _2571;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2595 = _2567 * _2573;
                    float _2597 = precise::clamp(_2595, 0.0, 1.0);
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2603 = fma(_2597, _2577, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2605 = fma(_2597, _2601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2607 = fma(_2597, _2581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2609 = fma(_2597, _2585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2611 = fma(_2597, _2589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2613 = fma(_2597, _2593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2437 = _2605;
                    _2467 = _2611;
                    _2423 = _2603;
                    _2459 = _2609;
                    _2393 = _2607;
                    _2453 = _2613;
                    _2529 = true;
                }
                else
                {
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2467 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2529 = false;
    float _2615 = _2437;
    float _2617 = _2467;
    float _2619 = _2423;
    float _2621 = _2459;
    float _2623 = _2393;
    float _2625 = _2453;
    float _2627 = fma(_1118, -0.5, 0.5);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = -_2615;
    float _2633 = _2631 + _2617;
    float _2635 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2637 = -_2619;
    float _2639 = _2637 + _2621;
    float _2641 = fma(_2629, _2633, _2615);
    out.m_94.x = 0.0;
    float _2643 = -_2623;
    float _2645 = _2643 + _2625;
    float _2647 = fma(_2629, _2639, _2619);
    float _2649 = _2641 * 0.586610972881317138671875;
    out.m_61.x = _2635;
    bool _2651 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2653 = fma(_2629, _2645, _2623);
    float _2655 = fma(_2647, 0.298911988735198974609375, _2649);
    bool _2657 = _1921 > 0.0;
    bool _2659 = isnan(_1921);
    bool _2661 = _2657 || _2659;
    bool _2663 = isnan(0.0);
    bool _2665 = _2661 || _2663;
    float _2667 = fma(_2653, 0.114477999508380889892578125, _2655);
    bool _2669 = _1975 <= 0.0;
    bool _2671 = !_2665;
    bool _2673 = _2669 || _2671;
    float _2675 = -_2667;
    float _2677 = _2647 + _2675;
    float _2679 = -_2667;
    float _2681 = _2641 + _2679;
    float _2683 = -_2667;
    float _2685 = _2653 + _2683;
    float _2687 = fma(_2677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2689 = fma(_2681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2667);
    bool _2693 = !_2651;
    if (!_2693)
    {
        float _2695 = -_1544;
        float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2699 = -_1546;
        float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2703 = -_1548;
        float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2707 = _2697 * _2697;
        float _2709 = fma(_2701, _2701, _2707);
        float _2711 = fma(_2705, _2705, _2709);
        float _2713 = sqrt(_2711);
        float _2715 = rsqrt(_2711);
        float _2717 = -_2713;
        float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2721 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2723 = precise::clamp(_2721, 0.0, 1.0);
        float _2725 = _2701 * _2715;
        float _2727 = _2697 * _2715;
        float _2729 = abs(_2723);
        float _2731 = log2(_2729);
        float _2733 = _2705 * _2715;
        float _2735 = _2725 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2737 = _1118 * _2727;
        float _2739 = -_2727;
        float _2741 = -_2735;
        float _2743 = fma(_2739, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2741);
        float _2745 = fma(_1106, _2725, _2737);
        float _2747 = -_2733;
        float _2749 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2743);
        float _2751 = fma(_1120, _2733, _2745);
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2757 = _2749 + _2755;
        float _2759 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = exp2(_2759);
        float _2767 = _2765 * _2763;
        float _2769 = _2753 * _2767;
        float _2771 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _2771;
        out.m_94.y = _2773;
        out.m_94.z = _2775;
    }
    out.m_96.x = _2687;
    out.m_96.y = _2689;
    out.m_96.z = _2691;
    if (!_2673)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2777 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2777;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

