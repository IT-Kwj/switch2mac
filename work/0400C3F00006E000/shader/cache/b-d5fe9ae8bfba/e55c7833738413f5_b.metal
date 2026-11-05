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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    texture2d_array<float> vp_t_tcb_14 [[id(16)]];
    sampler vp_t_tcb_14Smplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2461 = false;
    bool _489 = false;
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
        float _2760 = as_type<float>(_137);
        out.gl_Position.z = _2760;
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
        out.m_59.x = 0.0;
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
        float _2829 = as_type<float>(_175);
        out.gl_Position.z = _2829;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = in.m_63.x;
    float _179 = in.m_63.y;
    float _181 = in.m_63.z;
    float _183 = in.m_65.x;
    float _185 = in.m_65.y;
    float _187 = in.m_65.z;
    float _189 = in.m_67.x;
    float _191 = in.m_67.y;
    float _193 = in.m_67.z;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = _177 * _177;
    float _203 = _179 * _179;
    float _205 = _181 * _181;
    float _207 = fma(_183, _183, _201);
    float _209 = fma(_185, _185, _203);
    float _211 = fma(_187, _187, _205);
    float _213 = fma(_189, _189, _207);
    float _215 = fma(_191, _191, _209);
    float _217 = fma(_193, _193, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _219 > 0.0;
    float _225 = sqrt(_217);
    bool _227 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _231 = _227 || _229;
    bool _233 = isnan(1.0);
    bool _235 = _231 || _233;
    bool _237 = _221 > 0.0;
    float _239 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _241 = 0.0;
    float _243 = _211;
    float _245 = _213;
    float _247 = _239;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (_223)
    {
        float _251 = rsqrt(_213);
        _241 = _251;
    }
    float _253 = _241;
    bool _255 = _225 > 0.0;
    float _257 = _225;
    if (!_235)
    {
        float _259 = _239 * _239;
        float _261 = _259 * 0.5;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _263;
    if (_237)
    {
        float _269 = rsqrt(_215);
        _265 = _269;
    }
    float _271 = _265;
    if (!_235)
    {
        float _273 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _273;
    }
    float _275 = _267;
    bool _277 = !_235;
    float _279 = _275;
    float _281 = _253;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = _239 * _285;
        float _295 = 1.0 / _289;
        float _297 = _291 * 0.693147182464599609375;
        float _299 = exp2(_293);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _239);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _311;
        _243 = _295;
        _245 = _301;
    }
    float _313 = _279;
    float _315 = _243;
    float _317 = _245;
    bool _319 = !_235;
    float _321 = _315;
    float _323 = _313;
    float _325 = _317;
    if (!_319)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _239 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _247 = _345;
        _249 = _335;
    }
    float _347 = _247;
    float _349 = _249;
    float _351 = in.m_69.w;
    float _353 = 0.0;
    float _355 = _349;
    if (!_223)
    {
        _353 = 0.0;
        _355 = 0.0;
    }
    float _357 = _353;
    float _359 = _355;
    float _361 = _357;
    float _363 = _359;
    if (!_223)
    {
        _321 = 0.0;
    }
    float _365 = _321;
    float _367 = _365;
    if (_223)
    {
        float _369 = _253 * _183;
        _361 = _369;
    }
    float _371 = _361;
    float _373 = in.m_56.x;
    float _375 = in.m_56.y;
    float _377 = in.m_56.z;
    if (_223)
    {
        float _379 = _253 * _177;
        _363 = _379;
    }
    float _381 = _363;
    if (_223)
    {
        float _383 = _253 * _189;
        _367 = _383;
    }
    float _385 = _367;
    float _387 = _217;
    if (_255)
    {
        float _389 = rsqrt(_217);
        _387 = _389;
    }
    float _391 = _387;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _395 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _397 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = 0.0;
    float _401 = _395;
    if (!_237)
    {
        _281 = 0.0;
        _399 = 0.0;
    }
    float _403 = _281;
    float _405 = _399;
    float _407 = 0.0;
    float _409 = _405;
    float _411 = _403;
    if (!_237)
    {
        _407 = 0.0;
    }
    float _413 = _407;
    float _415 = fma(_347, _195, _395);
    float _417 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _419 = fma(_347, _197, _397);
    float _421 = _413;
    if (!_255)
    {
        _323 = 0.0;
        _325 = 0.0;
    }
    float _423 = _323;
    float _425 = _325;
    float _427 = _425;
    float _429 = _423;
    if (!_255)
    {
        _401 = 0.0;
    }
    float _431 = _401;
    float _433 = fma(_347, _199, _417);
    float _435 = _431;
    if (_237)
    {
        float _437 = _271 * _185;
        _421 = _437;
    }
    float _439 = _421;
    if (_237)
    {
        float _441 = _271 * _179;
        _409 = _441;
    }
    float _443 = _409;
    if (_237)
    {
        float _445 = _271 * _191;
        _411 = _445;
    }
    float _447 = _411;
    if (_255)
    {
        float _449 = _391 * _187;
        _435 = _449;
    }
    float _451 = _435;
    if (_255)
    {
        float _453 = _391 * _181;
        _427 = _453;
    }
    float _455 = _427;
    float _457 = _455;
    if (_255)
    {
        float _459 = _391 * _193;
        _429 = _459;
    }
    float _461 = _429;
    float _463 = fma(_415, _351, _373);
    float _465 = fma(_419, _351, _375);
    float _467 = fma(_433, _351, _377);
    bool _469 = !_393;
    float _487;
    if (!_469)
    {
        float _471 = in.m_71.x;
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _475 = _471 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        float _491 = float(_121);
        float _493 = 1.0 / _491;
        float _495 = _155 * _493;
        _487 = _495;
    }
    _489 = false;
    float _497 = _487;
    float _499 = in.m_71.x;
    float _501 = in.m_71.y;
    float _503 = in.m_71.z;
    float _505 = in.m_71.w;
    float _507 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _509 = log2(_507);
    float _511 = as_type<float>(int(gl_VertexIndex));
    float _513 = _509 * _155;
    float _515 = exp2(_513);
    float _517 = _503 * 2.0;
    float _519 = _499 * 2.0;
    float _521 = _501 * 2.0;
    float _523 = _501 + _499;
    int _525 = as_type<int>(_511) & 1;
    bool _527 = _525 != 0;
    int _529 = as_type<int>(_511) & 2;
    bool _531 = _529 != 0;
    bool _533 = _501 > 0.5;
    float _535 = floor(_517);
    float _537 = _523 + (-1.0);
    int _539 = int(_527);
    int _541 = _531 ? 2 : 0;
    int _543 = _539 | _541;
    int _545 = _255 ? 4 : 0;
    int _547 = _543 | _545;
    int _549 = _235 ? 8 : 0;
    int _551 = _547 | _549;
    int _553 = false ? 16 : 0;
    int _555 = _551 | _553;
    int _557 = _533 ? 32 : 0;
    int _559 = _555 | _557;
    int _561 = false ? 64 : 0;
    int _563 = _559 | _561;
    int _565 = _563 & 32;
    bool _567 = !_531;
    float _569 = _567 ? (-0.5) : 0.5;
    bool _571 = _565 != 0;
    float _573 = floor(_519);
    float _575 = floor(_521);
    bool _577 = _535 > 0.0;
    bool _579 = _535 >= 0.0;
    bool _581 = isnan(_535);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    int _589 = _587 ? 0 : 1;
    bool _591 = _573 > 0.0;
    bool _593 = _573 >= 0.0;
    bool _595 = isnan(_573);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = !_527;
    float _605 = _603 ? (-0.5) : 0.5;
    bool _607 = _503 > 0.5;
    float _609 = -_605;
    int _611 = _571 ? as_type<int>(_609) : as_type<int>(_605);
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _619 = _617 != 0;
    float _621 = -_569;
    int _623 = _607 ? as_type<int>(_621) : as_type<int>(_569);
    int _625 = _601 ? 0 : 1;
    bool _627 = !_615;
    float _629 = _627 ? _605 : as_type<float>(_611);
    int _631 = ~_589;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    bool _637 = !_619;
    float _639 = _637 ? _569 : as_type<float>(_623);
    int _641 = ~_625;
    int _643 = _641 + 1;
    int _645 = _643 + 1;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _649 = _647 != 0;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _653 = _651 != 0;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _657 = _655 != 0;
    int _659 = _635;
    int _661 = _645;
    if (!_577)
    {
        int _663 = ~_589;
        int _665 = _663 + 1;
        _659 = _665;
    }
    int _667 = _659;
    if (!_591)
    {
        int _669 = ~_625;
        int _671 = _669 + 1;
        _661 = _671;
    }
    int _673 = _661;
    bool _675 = _575 > 0.0;
    bool _677 = _575 >= 0.0;
    bool _679 = isnan(_575);
    bool _681 = _677 || _679;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _689 = 1.0 + _687;
    float _691 = in.m_76.x;
    float _693 = in.m_76.y;
    float _695 = in.m_76.z;
    bool _697 = !_649;
    int _699 = _697 ? 0 : 1;
    bool _701 = !_653;
    int _703 = _701 ? 0 : 1;
    float _705 = 1.0 / _689;
    int _707 = abs(_699);
    float _709 = -_515;
    float _711 = _709 + 1.0;
    int _713 = abs(_703);
    float _715 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _717 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _719 = isnan(1.0);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _725 = _721 || _723;
    float _727 = float(_667);
    float _729 = float(_707);
    bool _731 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _733 = isnan(0.0);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _739 = _735 || _737;
    float _741 = _729 * _727;
    int _743 = _685 ? 0 : 1;
    float _745 = float(_673);
    float _747 = _741 * (-2.0);
    float _749 = float(_713);
    float _751 = _739 ? _711 : 0.0;
    float _753 = fma(_715, _747, _715);
    int _755 = ~_743;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _749 * _745;
    int _763 = _759;
    if (!_675)
    {
        int _765 = ~_743;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    if (_725)
    {
        float _771 = _751 * _705;
        _159 = _771;
    }
    float _773 = _159;
    float _775 = _499 + (-0.5);
    float _777 = fma(_747, _691, _691);
    bool _779 = !_657;
    int _781 = _779 ? 0 : 1;
    float _783 = _501 + _503;
    float _785 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].x, _777);
    int _787 = abs(_781);
    float _789 = _783 + (-1.0);
    float _791 = _761 * (-2.0);
    float _793 = fma(_753, _773, _785);
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _797 = _501 + (-0.5);
    float _799 = fma(_791, _693, _693);
    float _801 = float(_769);
    float _803 = fma(_795, _791, _795);
    float _805 = float(_787);
    float _807 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _799);
    float _809 = _503 + _499;
    float _811 = in.m_69.x;
    float _813 = in.m_69.y;
    float _815 = _805 * _801;
    float _817 = _809 + (-1.0);
    float _819 = fma(_803, _773, _807);
    float _821 = _503 + (-0.5);
    float _823 = _815 * (-2.0);
    float _825 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _827 = _793 * 0.15915493667125701904296875;
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = fma(_823, _695, _695);
    float _833 = fma(_825, _823, _825);
    float _835 = _827 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = in.m_67.w;
    float _841 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[196].z, _831);
    float _843 = _465 * _185;
    float _845 = _465 * _191;
    float _847 = _465 * _179;
    float _849 = fma(_833, _773, _841);
    float _851 = fma(_463, _183, _843);
    float _853 = _829 * 6.283185482025146484375;
    float _855 = sin(_853);
    float _857 = fma(_463, _189, _845);
    float _859 = _849 * 0.15915493667125701904296875;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _605);
    float _863 = _811 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _865 = _813 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _867 = fma(_467, _193, _857);
    float _869 = fma(_463, _177, _847);
    float _871 = _829 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _877 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _879 = _827 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = _875 * _861;
    float _885 = _859 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _569);
    float _891 = _837 * _873;
    float _893 = _877 * _889;
    float _895 = _837 * _855;
    float _897 = in.m_65.w;
    float _899 = _859 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _881 * _855;
    float _905 = _881 * _873;
    float _907 = _837 * _887;
    float _909 = _881 * _887;
    float _911 = _873 * _887;
    float _913 = _855 * _887;
    float _915 = _907 * _893;
    float _917 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _919 = fma(_901, _891, _903);
    float _921 = -_893;
    float _923 = _901 * _921;
    float _925 = -_905;
    float _927 = fma(_901, _895, _925);
    float _929 = -_895;
    float _931 = fma(_901, _905, _929);
    float _933 = fma(_919, _883, _915);
    float _935 = _909 * _893;
    float _937 = fma(_911, _883, _923);
    float _939 = fma(_901, _903, _891);
    float _941 = fma(_927, _917, _933);
    float _943 = fma(_931, _883, _935);
    float _945 = fma(_913, _917, _937);
    float _947 = fma(_467, _187, _851);
    float _949 = _941 * _447;
    float _951 = fma(_939, _917, _943);
    float _953 = _941 * _439;
    float _955 = _867 + _839;
    float _957 = fma(_945, _385, _949);
    float _959 = _947 + _897;
    float _961 = fma(_945, _371, _953);
    float _963 = in.m_63.w;
    float _965 = fma(_951, _461, _957);
    float _967 = fma(_467, _181, _869);
    float _969 = fma(_951, _451, _961);
    float _971 = _941 * _443;
    float _973 = _955 + _965;
    float _975 = _959 + _969;
    float _977 = fma(_945, _381, _971);
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _981 = _973 + _979;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _985 = _975 + _983;
    float _987 = fma(_951, _455, _977);
    float _989 = _981 * _981;
    float _991 = fma(_985, _985, _989);
    float _993 = sqrt(_991);
    float _995 = _967 + _963;
    float _997 = _995 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _999 = _995 + _987;
    float _1001 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].x, _997);
    float _1003 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1001);
    bool _1005 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001;
    float _1009 = _975;
    float _1011 = _987;
    if (!_1005)
    {
        _1007 = _975;
    }
    float _1013 = _1007;
    float _1015 = _1013;
    if (!_1005)
    {
        _1009 = _973;
    }
    float _1017 = _1009;
    float _1019 = _1017;
    if (!_1005)
    {
        _1011 = _999;
    }
    float _1021 = _1011;
    bool _1023 = !_1005;
    float _1025 = _1021;
    if (!_1023)
    {
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1031 = _993 + _1029;
        float _1033 = rsqrt(_991);
        float _1035 = _1031 * _1027;
        float _1037 = _999 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1035 * 0.15915493667125701904296875;
        float _1041 = _1039 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = _1043 + (-1.0);
        float _1051 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = fma(_1047, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1055 = fma(_999, _1043, _1051);
        float _1057 = _1033 * _1053;
        float _1059 = fma(_985, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1061 = fma(_981, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1025 = _1055;
        _1015 = _1059;
        _1019 = _1061;
    }
    float _1063 = _1025;
    float _1065 = _1015;
    float _1067 = _1019;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1071 = _1063 + _1069;
    float _1073 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1077 = _1065 + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1081 = _1067 + _1079;
    float _1083 = _1071 * _1071;
    float _1085 = _995 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1087 = 1.0 / _1073;
    bool _1089 = _565 != 0;
    float _1091 = fma(_1077, _1077, _1083);
    float _1093 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1085);
    float _1095 = fma(_1081, _1081, _1091);
    float _1097 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1093);
    float _1099 = rsqrt(_1095);
    float _1101 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1103 = _1101 + _1073;
    float _1105 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1107 = sqrt(_1095);
    float _1109 = _1103 * _1087;
    float _1111 = _1109 * 0.5;
    float _1113 = _995 + _1105;
    float _1115 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1119 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1117);
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1123 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1125 = floor(_1115);
    float _1127 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1121);
    float _1129 = _1077 * _1123;
    float _1131 = _1081 * _1123;
    float _1133 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1127);
    float _1135 = _1129 * _1129;
    float _1137 = _1131 * _1131;
    float _1139 = 1.0 / _1119;
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1143 = _1135 + _1137;
    float _1145 = -_1125;
    float _1147 = _1115 + _1145;
    float _1149 = sqrt(_1143);
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1153 = _1139 * _1151;
    float _1155 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1157 = trunc(_1141);
    int _1159 = int(_1157);
    bool _1161 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1163 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1155);
    bool _1165 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1167 = _1149 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1169 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1163);
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1177 = _1149 + _1175;
    float _1179 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1181 = 2;
    float _1183 = _1143;
    float _1185 = _1115;
    float _1187 = _1129;
    float _1189 = _1131;
    float _1191 = _1135;
    float _1193 = _1137;
    float _1195 = _1179;
    if (!_1161)
    {
        _1181 = 1;
    }
    int _1197 = _1181;
    float _1199 = trunc(_1179);
    int _1201 = int(_1199);
    int _1203 = _1197;
    if (!_1165)
    {
        _1203 = _1173;
    }
    int _1205 = _1203;
    int _1207 = _1205 << 6;
    int _1209 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1211 = _1159 + _1209;
    int _1213 = _1211 + 1;
    float _1215 = as_type<float>(_565);
    float _1217 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    int _1219 = _1213;
    float _1221 = as_type<float>(_1205);
    if (_1167)
    {
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1215 = _1223;
    }
    float _1225 = _1215;
    int _1227 = _1207 + 96;
    uint _1230 = uint(int(uint(_1227) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1248 = _1213 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1252 = _1201 + _1250;
    int _1254 = _1252 + 1;
    float _1256 = _1246;
    if (_1167)
    {
        float _1258 = rsqrt(_1143);
        _1183 = _1258;
    }
    float _1260 = _1183;
    int _1262 = _1207 + 80;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = _1213 | _1254;
    float _1282 = _1260;
    if (_1167)
    {
        float _1284 = _1177 * _1225;
        _1217 = _1284;
    }
    float _1286 = _1217;
    bool _1288 = _1280 < 0;
    bool _1290 = _1288 || _1248;
    int _1292 = _1207 + 48;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c15)._m0[int(_1304)][_1306];
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = 0.0;
    if (_1167)
    {
        float _1314 = _1286 * 0.15915493667125701904296875;
        _1312 = _1314;
    }
    float _1316 = _1312;
    bool _1318 = _1254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1320 = _1318 || _1290;
    float _1322 = floor(_1246);
    float _1324 = precise::max(0.0, _1310);
    int _1326 = _1207 + 104;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
    int _1332 = int(_1328) & 3;
    float _1334 = (*spvDescriptorSet0.vp_c15)._m0[int(_1330)][_1332];
    int _1336 = int(_1328) + 1;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    int _1340 = _1336 & 3;
    float _1342 = (*spvDescriptorSet0.vp_c15)._m0[int(_1338)][_1340];
    float _1344 = -_1123;
    float _1346 = -_1324;
    float _1348 = fma(_1071, _1344, _1346);
    float _1350 = 0.0;
    float _1352 = _1348;
    if (_1167)
    {
        float _1354 = _1316 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        _1350 = _1356;
    }
    float _1358 = _1350;
    float _1360 = 0.0;
    if (_1167)
    {
        float _1362 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1362;
    }
    float _1364 = _1360;
    int _1366 = _1207 + 64;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c15)._m0[int(_1378)][_1380];
    float _1384 = _1364;
    if (!_1320)
    {
        int _1386 = _1254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1213;
        _1219 = _1388;
    }
    int _1390 = _1219;
    float _1392 = 0.0;
    if (_1167)
    {
        float _1394 = _1316 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        _1392 = _1396;
    }
    float _1398 = _1392;
    float _1400 = -_1322;
    float _1402 = _1246 + _1400;
    int _1404 = _1207 + 56;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
    int _1422 = as_type<int>(_1244);
    int _1424 = as_type<int>(_1236);
    if (_1167)
    {
        float _1426 = fma(_1358, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1384 = _1426;
    }
    float _1428 = _1384;
    if (!_1320)
    {
        float _1430 = floor(_1179);
        _1256 = _1430;
    }
    float _1432 = _1256;
    float _1434 = _1113 * _1244;
    if (_1167)
    {
        float _1436 = _1260 * _1428;
        _1282 = _1436;
    }
    float _1438 = _1282;
    int _1440 = _1207 + 72;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    uint _1444 = uint(int(uint(int(_1442)) >> uint(2)));
    int _1446 = int(_1442) & 3;
    float _1448 = (*spvDescriptorSet0.vp_c15)._m0[int(_1444)][_1446];
    int _1450 = int(_1442) + 1;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    int _1454 = _1450 & 3;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[int(_1452)][_1454];
    if (!_1320)
    {
        int _1458 = _1390 << 2;
        _1422 = _1458;
    }
    int _1460 = _1422;
    float _1462 = fma(_959, _1236, _1434);
    int _1464 = _1460;
    if (_1167)
    {
        float _1466 = _1398 + (-1.0);
        _1185 = _1466;
    }
    float _1468 = _1185;
    float _1470 = _1468;
    if (_1167)
    {
        float _1472 = _1129 * _1438;
        _1187 = _1472;
    }
    float _1474 = _1187;
    if (_1167)
    {
        float _1476 = _1131 * _1438;
        _1189 = _1476;
    }
    float _1478 = _1189;
    if (!_1320)
    {
        uint _1480 = uint(int(uint(_1390) >> uint(2)));
        _1424 = int(_1480);
    }
    int _1482 = _1424;
    int _1484 = _1482;
    if (_1167)
    {
        float _1486 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1470 = _1486;
    }
    float _1488 = _1470;
    if (_1167)
    {
        float _1490 = _1474 * _1474;
        _1191 = _1490;
    }
    float _1492 = _1191;
    if (_1167)
    {
        float _1494 = _1478 * _1478;
        _1193 = _1494;
    }
    float _1496 = _1193;
    int _1498 = _1207 + 88;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    uint _1502 = uint(int(uint(int(_1500)) >> uint(2)));
    int _1504 = int(_1500) & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    int _1508 = int(_1500) + 1;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    int _1512 = _1508 & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    if (_1167)
    {
        float _1516 = fma(_1348, _1398, _1488);
        _1352 = _1516;
    }
    float _1518 = _1352;
    float _1520 = _1113 * _1278;
    if (!_1320)
    {
        int _1522 = 12 & _1460;
        _1464 = _1522;
    }
    int _1524 = _1464;
    float _1526 = _1113 * _1382;
    float _1528 = fma(_1518, _1518, _1492);
    float _1530 = fma(_955, _1334, _1462);
    float _1532 = fma(_959, _1270, _1520);
    float _1534 = fma(_959, _1374, _1526);
    float _1536 = _1528 + _1496;
    float _1538 = _1113 * _1308;
    float _1540 = _1530 + _1342;
    float _1542 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1546 = fma(_959, _1300, _1538);
    float _1548 = rsqrt(_1536);
    float _1550 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1552 = fma(_955, _1412, _1546);
    if (!_1320)
    {
        int _1554 = _1482 << 4;
        int _1556 = _1554 + _1524;
        _1484 = _1556;
    }
    int _1558 = _1484;
    float _1560 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1544);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = _1552 + _1420;
    float _1570 = 1.0 / _1540;
    float _1572 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    float _1574 = -_1566;
    float _1576 = _1574 + 1.0;
    float _1578 = fma(_955, _1448, _1534);
    float _1580 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1560);
    float2 _4936 = float2(_1147, _1402);
    float _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4936, float2(0.0), isnan(_4936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4936, float2(0.0), isnan(_4936)), level(0.0)).x;
    float _1584 = _1578 + _1456;
    float _1586 = _1548 * _1474;
    float _1588 = _1548 * _1518;
    float _1590 = _1548 * _1478;
    float _1592 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1594 = abs(_1576);
    float _1596 = log2(_1594);
    float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1604 = _1568 * _1570;
    float _1606 = -_1598;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1584 * _1570;
    float _1612 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1614 = -_1602;
    float _1616 = fma(_1614, _1600, 1.0);
    float _1618 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1620 = -_1590;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    bool _1624 = _1604 >= 0.0;
    float _1626 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1628 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1618);
    float _1630 = fma(_1622, -0.5, 0.5);
    bool _1632 = _1604 <= 1.0;
    bool _1634 = _1632 && _1624;
    float _1636 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1638 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1640 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1612);
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1644 = _1610 >= 0.0;
    bool _1646 = _1644 && _1634;
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = exp2(_1636);
    float _1652 = fma(_1622, 0.5, 0.5);
    float _1654 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1640);
    float _1656 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1642);
    float _1658 = fma(_955, _1506, _1532);
    bool _1660 = _1610 <= 1.0;
    bool _1662 = _1660 && _1646;
    float _1664 = _1506;
    float _1666 = _1514;
    if (!_1320)
    {
        int _1668 = _1558 + 400;
        uint _1670 = uint(int(uint(_1668) >> uint(2)));
        uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
        int _1674 = int(_1670) & 3;
        float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
        _1664 = _1676;
    }
    float _1678 = _1664;
    float _1680 = _1588 + 1.0;
    float _1682 = sqrt(_1630);
    float _1684 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1686 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1656);
    float _1688 = _1658 + _1514;
    float _1690 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1320)
    {
        float _1692 = -_1432;
        float _1694 = _1179 + _1692;
        _1195 = _1694;
    }
    float _1696 = _1195;
    float _1698 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1700 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1686);
    float _1702 = _1608;
    if (!_1320)
    {
        float _1704 = floor(_1141);
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = -_1588;
    float _1710 = fma(_1650, _1680, _1708);
    float _1712 = fma(_1652, _1698, -0.212114393711090087890625);
    float _1714 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1662)
    {
        float _1716 = float(_1205);
        _1221 = _1716;
    }
    float _1718 = _1221;
    float _1720 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1722 = fma(_1652, _1712, 1.570728778839111328125);
    float _1724 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = log2(_1616);
    float _1728 = _1682 * 0.636619746685028076171875;
    float _1730 = _1688 * _1570;
    float _1732 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1734 = fma(_1710, 0.5, 0.5);
    float _1736 = -_1722;
    float _1738 = fma(_1728, _1736, 1.0);
    float _1740 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1720);
    float _1742 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1732);
    float _1744 = 1.0 / _1700;
    if (!_1320)
    {
        float _1746 = -_1706;
        float _1748 = _1141 + _1746;
        _1666 = _1748;
    }
    float _1750 = _1666;
    float _1752 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1754 = _1724;
    if (_1662)
    {
        float _1756 = rint(_1718);
        float _1758 = precise::max(_1756, 0.0);
        uint _1760 = uint(_1758);
        uint _1762 = clamp(_1760, 0u, 65535u);
        _1754 = as_type<float>(_1762);
    }
    float _1764 = _1754;
    float _1766 = _1726 * 0.693147182464599609375;
    float _1768 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1770 = _1742 * _1744;
    float _1772 = _1752 * _1744;
    float _1774 = fma(_1770, 0.5, 0.5);
    float _1776 = fma(_1772, -0.5, 0.5);
    float _1778 = _1678;
    if (!_1320)
    {
        float _1780 = rint(_1678);
        float _1782 = precise::max(_1780, 0.0);
        uint _1784 = uint(_1782);
        uint _1786 = clamp(_1784, 0u, 65535u);
        _1778 = as_type<float>(_1786);
    }
    float _1788 = _1778;
    float _1790 = _1764;
    if (_1662)
    {
        float3 _5295 = float3(_1604, _1610, float(as_type<int>(_1764)));
        float3 _5299 = select(_5295, float3(0.0), isnan(_5295));
        float _1792 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5299.xy, uint(rint(_5299.z)), _1730, level(0.0));
        _1790 = _1792;
    }
    float _1794 = _1790;
    float3 _5309 = float3(_1774, _1776, _1768);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5309, float3(0.0), isnan(_5309)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5309, float3(0.0), isnan(_5309)), level(0.0)).x;
    float3 _5318 = float3(_1774, _1776, _1768);
    float4 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5318, float3(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5318, float3(0.0), isnan(_5318)), level(0.0)).xyzw;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1799.w;
    float2 _5334 = float2(_1738, _1734);
    float3 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5334, float2(0.0), isnan(_5334)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5334, float2(0.0), isnan(_5334)), level(0.0)).xyz;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = _1696;
    if (!_1320)
    {
        float3 _5355 = float3(_1750, _1696, float(as_type<int>(_1788)));
        float3 _5357 = select(_5355, float3(0.0), isnan(_5355));
        float _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5357.xy, uint(rint(_5357.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5357.xy, uint(rint(_5357.z)), level(0.0)).x;
        _1819 = _1821;
    }
    float _1823 = _1819;
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1827 = -_639;
    float _1829 = _1827 + 0.5;
    bool _1831 = _505 > 0.5;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1837 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1839 = isnan(_497);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1845 = _1841 || _1843;
    float _1847 = float(_1845);
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1855 = _497 + _1853;
    float _1857 = 1.0 / _1835;
    bool _1859 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1861 = isnan(_497);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    float _1871 = -_1847;
    float _1873 = _1871 + 1.0;
    bool _1875 = _499 > 0.5;
    float _1877 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1879 = -_569;
    int _1881 = _1831 ? as_type<int>(_1879) : as_type<int>(_569);
    float _1883 = _1869 * _1873;
    float _1885 = -_1869;
    float _1887 = _1885 + 1.0;
    float _1889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1893 = _1891 != 0;
    float _1895 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1897 = -_605;
    int _1899 = _1875 ? as_type<int>(_1897) : as_type<int>(_605);
    out.m_78.x = _1077;
    out.m_78.y = _1071;
    out.m_78.z = _1081;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1903 = _1901 != 0;
    float _1905 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1895);
    bool _1907 = !_1893;
    float _1909 = _1907 ? _605 : as_type<float>(_1899);
    float _1911 = _1851 * _1857;
    float _1913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1917 = _1915 != 0;
    float _1919 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1905);
    float _1921 = fma(_1911, _1855, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1923 = _1909 + 0.5;
    bool _1925 = !_1917;
    float _1927 = _1925 ? _569 : as_type<float>(_1881);
    float _1929 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1931 = _1921 * _1883;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1943 = _1939 || _1941;
    float _1945 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1931);
    float _1947 = -_569;
    int _1949 = _1089 ? as_type<int>(_1947) : as_type<int>(_569);
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1953 = _1951 != 0;
    float _1955 = _629 + 0.5;
    float _1957 = abs(_1153);
    float _1959 = log2(_1957);
    float _1961 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1945);
    float _1963 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1967 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1969 = !_1903;
    float _1971 = _1969 ? _569 : as_type<float>(_1949);
    float _1973 = _1963 * _1889;
    float _1975 = _1965 * _1913;
    float _1977 = -_605;
    int _1979 = _607 ? as_type<int>(_1977) : as_type<int>(_605);
    float _1981 = fma(_1877, _1877, 1.0);
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1985 = _1967 * _1825;
    float _1987 = -_1971;
    float _1989 = _1987 + 0.5;
    float _1991 = -_1927;
    float _1993 = _1991 + 0.5;
    bool _1995 = !_1953;
    float _1997 = _1995 ? _605 : as_type<float>(_1979);
    out.m_80.x = _1975;
    out.m_80.y = _1973;
    float _1999 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2001 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2005 = _1997 + 0.5;
    float _2007 = _1993 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2009 = _2001 * _1933;
    float _2011 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2013 = _1857;
    float _2015 = _2005;
    float _2017 = _2007;
    if (!_1943)
    {
        _2013 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2019 = _2013;
    float _2021 = _1961 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2023 = exp2(_1999);
    float _2025 = _2011 * _1983;
    float _2027 = _2019;
    if (!_1943)
    {
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2031 = _2019 + _2029;
        _2015 = _2031;
    }
    float _2033 = _2015;
    out.m_82.w = _2021;
    float _2035 = rsqrt(_1981);
    float _2037 = _2007 * _2003;
    if (!_1943)
    {
        float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2041 = _1153 + _2039;
        _2017 = _2041;
    }
    float _2043 = _2017;
    bool _2045 = _1153 <= 8000.0;
    bool _2047 = isnan(_1153);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(8000.0);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    out.m_84.x = _1985;
    out.m_84.y = _2009;
    out.m_84.z = _2025;
    out.m_84.w = _2037;
    float _2057 = fma(_2023, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = _605 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2063 = -_1877;
    float _2065 = _901 * _2063;
    float _2067 = _2023;
    if (!_1943)
    {
        float _2069 = 1.0 / _2033;
        _2027 = _2069;
    }
    float _2071 = _2027;
    if (_1943)
    {
        _2067 = 1.0;
    }
    float _2073 = _2067;
    float _2075 = _1877 * _2035;
    float _2077 = fma(_911, _2061, _2065);
    float _2079 = _907 * _1877;
    float _2081 = -_2075;
    float _2083 = _927 * _2081;
    float _2085 = -_2075;
    float _2087 = _913 * _2085;
    float _2089 = -_2075;
    float _2091 = _939 * _2089;
    float _2093 = _913 + _2077;
    float _2095 = fma(_919, _2061, _2079);
    float _2097 = _909 * _1877;
    float _2099 = fma(_907, _2035, _2083);
    float _2101 = _919 * _439;
    float _2103 = -_901;
    float _2105 = fma(_2103, _2035, _2087);
    float _2107 = fma(_909, _2035, _2091);
    float _2109 = _919 * _443;
    float _2111 = _927 + _2095;
    float _2113 = _919 * _447;
    float _2115 = fma(_931, _2061, _2097);
    float _2117 = fma(_911, _371, _2101);
    float _2119 = _2099 * _443;
    float _2121 = _2099 * _439;
    float _2123 = _2099 * _447;
    float _2125 = fma(_911, _381, _2109);
    float _2127 = fma(_911, _385, _2113);
    float _2129 = fma(_2105, _381, _2119);
    float _2131 = fma(_2105, _371, _2121);
    float _2133 = fma(_2105, _385, _2123);
    float _2135 = fma(_931, _455, _2125);
    float _2137 = fma(_931, _451, _2117);
    float _2139 = fma(_931, _461, _2127);
    float _2141 = fma(_2107, _455, _2129);
    float _2143 = fma(_2107, _461, _2133);
    float _2145 = fma(_2059, -2.0, 3.0);
    float _2147 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2149 = _2059 * _2059;
    float _2151 = fma(_2107, _451, _2131);
    out.m_86.x = _2137;
    out.m_86.y = _2135;
    out.m_86.z = _2139;
    float _2153 = _2149 * _2145;
    float _2155 = exp2(_2147);
    float _2157 = _2111 * _439;
    out.m_88.x = _2151;
    out.m_88.y = _2141;
    out.m_88.z = _2143;
    float _2159 = -_2153;
    float _2161 = _2159 + 1.0;
    float _2163 = _2111 * _443;
    float _2165 = _2111 * _447;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1929;
    out.gl_Position.w = _1700;
    float _2167 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2153);
    float _2169 = _939 + _2115;
    float _2171 = _1929 + _1700;
    float _2173 = fma(_2093, _371, _2157);
    float _2175 = fma(_2093, _381, _2163);
    float _2177 = fma(_2093, _385, _2165);
    float _2179 = _2055 * _2167;
    float _2181 = _2171 * 0.5;
    float _2183 = fma(_2169, _455, _2175);
    float _2185 = fma(_2169, _461, _2177);
    float _2187 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2189 = -_2155;
    float _2191 = _2189 + 1.0;
    out.m_90.z = _2181;
    out.m_90.w = _1700;
    float _2193 = _2073;
    float _2195 = _2187;
    float _2197 = _2177;
    float _2199 = _2173;
    if (!_1662)
    {
        _457 = 1.0;
    }
    float _2201 = _457;
    float _2203 = _2201;
    if (!_1943)
    {
        float _2205 = _2043 * _2071;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        _2193 = _2207;
    }
    float _2209 = _2193;
    float _2211 = fma(_2169, _451, _2173);
    float _2213 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2215 = -_1582;
    float _2217 = _2215 + 1.0;
    float _2219 = _2217 * _2187;
    float _2221 = precise::clamp(_2219, 0.0, 1.0);
    float _2223 = _2221;
    if (_1320)
    {
        _2195 = 1.0;
    }
    float _2225 = _2195;
    float _2227 = _2225;
    if (_1662)
    {
        bool _2229 = _1794 >= _1730;
        bool _2231 = isnan(_1794);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan(_1730);
        bool _2237 = _2233 || _2235;
        float _2239 = float(_2237);
        _2203 = _2239;
    }
    float _2241 = _2203;
    float _2243 = _2241;
    if (!_1320)
    {
        int _2245 = _1390 << 4;
        int _2247 = _2245 + 2048;
        uint _2249 = uint(int(uint(_2247) >> uint(2)));
        uint _2251 = uint(int(uint(int(_2249)) >> uint(2)));
        int _2253 = int(_2249) & 3;
        float _2255 = (*spvDescriptorSet0.vp_c15)._m0[int(_2251)][_2253];
        int _2257 = int(_2249) + 1;
        uint _2259 = uint(int(uint(_2257) >> uint(2)));
        int _2261 = _2257 & 3;
        float _2263 = (*spvDescriptorSet0.vp_c15)._m0[int(_2259)][_2261];
        int _2265 = _2247 + 8;
        uint _2267 = uint(int(uint(_2265) >> uint(2)));
        uint _2269 = uint(int(uint(int(_2267)) >> uint(2)));
        int _2271 = int(_2267) & 3;
        float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
        int _2275 = int(_2267) + 1;
        uint _2277 = uint(int(uint(_2275) >> uint(2)));
        int _2279 = _2275 & 3;
        float _2281 = (*spvDescriptorSet0.vp_c15)._m0[int(_2277)][_2279];
        float _2283 = _1113 * _2263;
        float _2285 = fma(_959, _2255, _2283);
        float _2287 = fma(_955, _2273, _2285);
        float _2289 = _2287 + _2281;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = -_2291;
        float _2295 = _2293 + _1823;
        float _2297 = fma(_2295, 500.0, 1.5);
        float _2299 = exp2(_2297);
        float _2301 = 0.0 + _2299;
        float _2303 = precise::clamp(_2301, 0.0, 1.0);
        _2227 = _2303;
        _2197 = _2299;
        _2199 = _2255;
    }
    float _2305 = _2227;
    float _2307 = _2197;
    float _2309 = _2199;
    float _2311 = _2241 * _2305;
    float _2313 = _2213 * _1796;
    float _2315 = -_2221;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.x = _2211;
    out.m_92.y = _2183;
    out.m_92.z = _2185;
    bool _2319 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2321 = isnan(_1107);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2327 = _2323 || _2325;
    float _2329 = _1807 * _2313;
    float _2331 = -_2311;
    float _2333 = fma(_2331, _2317, 1.0);
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = _1817 * _2313;
    float _2339 = -_2213;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_1813, _2329, _1801);
    float _2345 = fma(_1815, _2329, _1803);
    float _2347 = fma(_1807, _2337, _1805);
    float _2349 = _1807 * _2341;
    out.m_94.x = _1065;
    out.m_94.y = _1063;
    out.m_94.z = _1067;
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2353 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _2343;
    out.m_96.y = _2345;
    out.m_96.z = _2347;
    out.m_96.w = _2349;
    float _2355 = _2309;
    float _2357 = _2307;
    float _2359 = _2341;
    float _2361 = _2351;
    if (!_2327)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2363 = _2355;
    float _2365 = _2363;
    float _2367 = _2363;
    if (!_2327)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2369 = _2357;
    out.m_98.x = _2351;
    float _2371 = _2369;
    float _2373 = _2369;
    if (!_2327)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2375 = _2223;
    float _2377 = _2375;
    float _2379 = _2375;
    if (!_2327)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2381 = _2243;
    float _2383 = _2381;
    float _2385 = _2381;
    if (!_2327)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2387 = _2359;
    float _2389 = _2387;
    float _2391 = _2387;
    if (!_2327)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2393 = _2361;
    bool _2395 = !_2327;
    float _2397 = _2393;
    float _2399 = _2393;
    if (!_2395)
    {
        bool _2401 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2403 = isnan(_1107);
        bool _2405 = _2401 || _2403;
        bool _2407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2409 = _2405 || _2407;
        if (!_2409)
        {
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2413 = _1107 + _2411;
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2417 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2415;
            float _2419 = 1.0 / _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2441 = _2413 * _2419;
            float _2443 = precise::clamp(_2441, 0.0, 1.0);
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2449 = fma(_2443, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2451 = fma(_2443, _2447, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2453 = fma(_2443, _2427, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2455 = fma(_2443, _2431, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2457 = fma(_2443, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2459 = fma(_2443, _2439, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2373 = _2451;
            _2391 = _2457;
            _2367 = _2449;
            _2385 = _2455;
            _2379 = _2453;
            _2399 = _2459;
            _2461 = true;
        }
        else
        {
            bool _2463 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2465 = isnan(_1107);
            bool _2467 = _2463 || _2465;
            bool _2469 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2471 = _2467 || _2469;
            if (!_2471)
            {
                _2365 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2473 = _2365;
            _2367 = _2473;
            if (!_2471)
            {
                _2371 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2475 = _2371;
            _2373 = _2475;
            if (!_2471)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2477 = _2377;
            _2379 = _2477;
            if (!_2471)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2479 = _2383;
            _2385 = _2479;
            if (!_2471)
            {
                _2389 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2481 = _2389;
            _2391 = _2481;
            if (!_2471)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2483 = _2397;
            bool _2485 = !_2471;
            _2399 = _2483;
            if (!_2485)
            {
                bool _2487 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2489 = isnan(_1107);
                bool _2491 = _2487 || _2489;
                bool _2493 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2495 = _2491 || _2493;
                if (!_2495)
                {
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2499 = _1107 + _2497;
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2503 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2501;
                    float _2505 = 1.0 / _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2527 = _2499 * _2505;
                    float _2529 = precise::clamp(_2527, 0.0, 1.0);
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2535 = fma(_2529, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2537 = fma(_2529, _2533, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2539 = fma(_2529, _2513, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2541 = fma(_2529, _2517, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2543 = fma(_2529, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2545 = fma(_2529, _2525, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2373 = _2537;
                    _2391 = _2543;
                    _2367 = _2535;
                    _2385 = _2541;
                    _2379 = _2539;
                    _2399 = _2545;
                    _2461 = true;
                }
                else
                {
                    _2373 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2391 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2367 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2461 = false;
    float _2547 = _2373;
    float _2549 = _2391;
    float _2551 = _2367;
    float _2553 = _2385;
    float _2555 = _2379;
    float _2557 = _2399;
    float _2559 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2561 = fma(_2183, -0.5, 0.5);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = -_2547;
    float _2567 = _2565 + _2549;
    float _2569 = -_2551;
    float _2571 = _2569 + _2553;
    out.m_59.x = _2559;
    float _2573 = -_2555;
    float _2575 = _2573 + _2557;
    float _2577 = fma(_2563, _2567, _2547);
    float _2579 = fma(_2563, _2571, _2551);
    bool _2581 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2583 = _2577 * 0.586610972881317138671875;
    float _2585 = fma(_2563, _2575, _2555);
    out.m_100.x = 0.0;
    bool _2587 = _2209 > 0.0;
    bool _2589 = isnan(_2209);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = fma(_2579, 0.298911988735198974609375, _2583);
    float _2599 = fma(_2585, 0.114477999508380889892578125, _2597);
    float _2601 = -_2599;
    float _2603 = _2579 + _2601;
    float _2605 = -_2599;
    float _2607 = _2577 + _2605;
    float _2609 = -_2599;
    float _2611 = _2585 + _2609;
    float _2613 = fma(_2603, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    float _2615 = fma(_2607, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    float _2617 = fma(_2611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    bool _2619 = !_2581;
    if (!_2619)
    {
        float _2621 = -_1063;
        float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2625 = -_1065;
        float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2629 = -_1067;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2633 = _2623 * _2623;
        float _2635 = fma(_2627, _2627, _2633);
        float _2637 = fma(_2631, _2631, _2635);
        float _2639 = sqrt(_2637);
        float _2641 = rsqrt(_2637);
        float _2643 = -_2639;
        float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2647 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = _2627 * _2641;
        float _2653 = _2623 * _2641;
        float _2655 = abs(_2649);
        float _2657 = log2(_2655);
        float _2659 = _2631 * _2641;
        float _2661 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2663 = _2183 * _2653;
        float _2665 = -_2653;
        float _2667 = -_2661;
        float _2669 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2667);
        float _2671 = fma(_2211, _2651, _2663);
        float _2673 = -_2659;
        float _2675 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2669);
        float _2677 = fma(_2185, _2659, _2671);
        float _2679 = precise::clamp(_2677, 0.0, 1.0);
        float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2683 = _2675 + _2681;
        float _2685 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        float _2691 = exp2(_2685);
        float _2693 = _2691 * _2689;
        float _2695 = _2679 * _2693;
        float _2697 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2701 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2697;
        out.m_100.y = _2699;
        out.m_100.z = _2701;
    }
    out.m_102.x = _2613;
    out.m_102.y = _2615;
    out.m_102.z = _2617;
    if (_2595)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2703 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2703;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2461 = false;
    bool _489 = false;
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
        float _2760 = as_type<float>(_137);
        out.gl_Position.z = _2760;
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
        out.m_59.x = 0.0;
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
        float _2829 = as_type<float>(_175);
        out.gl_Position.z = _2829;
    }
    if (_169)
    {
        return out;
    }
    float _177 = in.m_63.x;
    float _179 = in.m_63.y;
    float _181 = in.m_63.z;
    float _183 = in.m_65.x;
    float _185 = in.m_65.y;
    float _187 = in.m_65.z;
    float _189 = in.m_67.x;
    float _191 = in.m_67.y;
    float _193 = in.m_67.z;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = _177 * _177;
    float _203 = _179 * _179;
    float _205 = _181 * _181;
    float _207 = fma(_183, _183, _201);
    float _209 = fma(_185, _185, _203);
    float _211 = fma(_187, _187, _205);
    float _213 = fma(_189, _189, _207);
    float _215 = fma(_191, _191, _209);
    float _217 = fma(_193, _193, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _219 > 0.0;
    float _225 = sqrt(_217);
    bool _227 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _231 = _227 || _229;
    bool _233 = isnan(1.0);
    bool _235 = _231 || _233;
    bool _237 = _221 > 0.0;
    float _239 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _241 = 0.0;
    float _243 = _211;
    float _245 = _213;
    float _247 = _239;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (_223)
    {
        float _251 = rsqrt(_213);
        _241 = _251;
    }
    float _253 = _241;
    bool _255 = _225 > 0.0;
    float _257 = _225;
    if (!_235)
    {
        float _259 = _239 * _239;
        float _261 = _259 * 0.5;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _263;
    if (_237)
    {
        float _269 = rsqrt(_215);
        _265 = _269;
    }
    float _271 = _265;
    if (!_235)
    {
        float _273 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _273;
    }
    float _275 = _267;
    bool _277 = !_235;
    float _279 = _275;
    float _281 = _253;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = _239 * _285;
        float _295 = 1.0 / _289;
        float _297 = _291 * 0.693147182464599609375;
        float _299 = exp2(_293);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _239);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _311;
        _243 = _295;
        _245 = _301;
    }
    float _313 = _279;
    float _315 = _243;
    float _317 = _245;
    bool _319 = !_235;
    float _321 = _315;
    float _323 = _313;
    float _325 = _317;
    if (!_319)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _239 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _247 = _345;
        _249 = _335;
    }
    float _347 = _247;
    float _349 = _249;
    float _351 = in.m_69.w;
    float _353 = 0.0;
    float _355 = _349;
    if (!_223)
    {
        _353 = 0.0;
        _355 = 0.0;
    }
    float _357 = _353;
    float _359 = _355;
    float _361 = _357;
    float _363 = _359;
    if (!_223)
    {
        _321 = 0.0;
    }
    float _365 = _321;
    float _367 = _365;
    if (_223)
    {
        float _369 = _253 * _183;
        _361 = _369;
    }
    float _371 = _361;
    float _373 = in.m_56.x;
    float _375 = in.m_56.y;
    float _377 = in.m_56.z;
    if (_223)
    {
        float _379 = _253 * _177;
        _363 = _379;
    }
    float _381 = _363;
    if (_223)
    {
        float _383 = _253 * _189;
        _367 = _383;
    }
    float _385 = _367;
    float _387 = _217;
    if (_255)
    {
        float _389 = rsqrt(_217);
        _387 = _389;
    }
    float _391 = _387;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _395 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _397 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = 0.0;
    float _401 = _395;
    if (!_237)
    {
        _281 = 0.0;
        _399 = 0.0;
    }
    float _403 = _281;
    float _405 = _399;
    float _407 = 0.0;
    float _409 = _405;
    float _411 = _403;
    if (!_237)
    {
        _407 = 0.0;
    }
    float _413 = _407;
    float _415 = fma(_347, _195, _395);
    float _417 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _419 = fma(_347, _197, _397);
    float _421 = _413;
    if (!_255)
    {
        _323 = 0.0;
        _325 = 0.0;
    }
    float _423 = _323;
    float _425 = _325;
    float _427 = _425;
    float _429 = _423;
    if (!_255)
    {
        _401 = 0.0;
    }
    float _431 = _401;
    float _433 = fma(_347, _199, _417);
    float _435 = _431;
    if (_237)
    {
        float _437 = _271 * _185;
        _421 = _437;
    }
    float _439 = _421;
    if (_237)
    {
        float _441 = _271 * _179;
        _409 = _441;
    }
    float _443 = _409;
    if (_237)
    {
        float _445 = _271 * _191;
        _411 = _445;
    }
    float _447 = _411;
    if (_255)
    {
        float _449 = _391 * _187;
        _435 = _449;
    }
    float _451 = _435;
    if (_255)
    {
        float _453 = _391 * _181;
        _427 = _453;
    }
    float _455 = _427;
    float _457 = _455;
    if (_255)
    {
        float _459 = _391 * _193;
        _429 = _459;
    }
    float _461 = _429;
    float _463 = fma(_415, _351, _373);
    float _465 = fma(_419, _351, _375);
    float _467 = fma(_433, _351, _377);
    bool _469 = !_393;
    float _487;
    if (!_469)
    {
        float _471 = in.m_71.x;
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _475 = _471 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        float _491 = float(_121);
        float _493 = 1.0 / _491;
        float _495 = _155 * _493;
        _487 = _495;
    }
    _489 = false;
    float _497 = _487;
    float _499 = in.m_71.x;
    float _501 = in.m_71.y;
    float _503 = in.m_71.z;
    float _505 = in.m_71.w;
    float _507 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _509 = log2(_507);
    float _511 = as_type<float>(int(gl_VertexIndex));
    float _513 = _509 * _155;
    float _515 = exp2(_513);
    float _517 = _503 * 2.0;
    float _519 = _499 * 2.0;
    float _521 = _501 * 2.0;
    float _523 = _501 + _499;
    int _525 = as_type<int>(_511) & 1;
    bool _527 = _525 != 0;
    int _529 = as_type<int>(_511) & 2;
    bool _531 = _529 != 0;
    bool _533 = _501 > 0.5;
    float _535 = floor(_517);
    float _537 = _523 + (-1.0);
    int _539 = int(_527);
    int _541 = _531 ? 2 : 0;
    int _543 = _539 | _541;
    int _545 = _255 ? 4 : 0;
    int _547 = _543 | _545;
    int _549 = _235 ? 8 : 0;
    int _551 = _547 | _549;
    int _553 = false ? 16 : 0;
    int _555 = _551 | _553;
    int _557 = _533 ? 32 : 0;
    int _559 = _555 | _557;
    int _561 = false ? 64 : 0;
    int _563 = _559 | _561;
    int _565 = _563 & 32;
    bool _567 = !_531;
    float _569 = _567 ? (-0.5) : 0.5;
    bool _571 = _565 != 0;
    float _573 = floor(_519);
    float _575 = floor(_521);
    bool _577 = _535 > 0.0;
    bool _579 = _535 >= 0.0;
    bool _581 = isnan(_535);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    int _589 = _587 ? 0 : 1;
    bool _591 = _573 > 0.0;
    bool _593 = _573 >= 0.0;
    bool _595 = isnan(_573);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = !_527;
    float _605 = _603 ? (-0.5) : 0.5;
    bool _607 = _503 > 0.5;
    float _609 = -_605;
    int _611 = _571 ? as_type<int>(_609) : as_type<int>(_605);
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _619 = _617 != 0;
    float _621 = -_569;
    int _623 = _607 ? as_type<int>(_621) : as_type<int>(_569);
    int _625 = _601 ? 0 : 1;
    bool _627 = !_615;
    float _629 = _627 ? _605 : as_type<float>(_611);
    int _631 = ~_589;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    bool _637 = !_619;
    float _639 = _637 ? _569 : as_type<float>(_623);
    int _641 = ~_625;
    int _643 = _641 + 1;
    int _645 = _643 + 1;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _649 = _647 != 0;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _653 = _651 != 0;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _657 = _655 != 0;
    int _659 = _635;
    int _661 = _645;
    if (!_577)
    {
        int _663 = ~_589;
        int _665 = _663 + 1;
        _659 = _665;
    }
    int _667 = _659;
    if (!_591)
    {
        int _669 = ~_625;
        int _671 = _669 + 1;
        _661 = _671;
    }
    int _673 = _661;
    bool _675 = _575 > 0.0;
    bool _677 = _575 >= 0.0;
    bool _679 = isnan(_575);
    bool _681 = _677 || _679;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _689 = 1.0 + _687;
    float _691 = in.m_76.x;
    float _693 = in.m_76.y;
    float _695 = in.m_76.z;
    bool _697 = !_649;
    int _699 = _697 ? 0 : 1;
    bool _701 = !_653;
    int _703 = _701 ? 0 : 1;
    float _705 = 1.0 / _689;
    int _707 = abs(_699);
    float _709 = -_515;
    float _711 = _709 + 1.0;
    int _713 = abs(_703);
    float _715 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _717 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _719 = isnan(1.0);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _725 = _721 || _723;
    float _727 = float(_667);
    float _729 = float(_707);
    bool _731 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _733 = isnan(0.0);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _739 = _735 || _737;
    float _741 = _729 * _727;
    int _743 = _685 ? 0 : 1;
    float _745 = float(_673);
    float _747 = _741 * (-2.0);
    float _749 = float(_713);
    float _751 = _739 ? _711 : 0.0;
    float _753 = fma(_715, _747, _715);
    int _755 = ~_743;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _749 * _745;
    int _763 = _759;
    if (!_675)
    {
        int _765 = ~_743;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    if (_725)
    {
        float _771 = _751 * _705;
        _159 = _771;
    }
    float _773 = _159;
    float _775 = _499 + (-0.5);
    float _777 = fma(_747, _691, _691);
    bool _779 = !_657;
    int _781 = _779 ? 0 : 1;
    float _783 = _501 + _503;
    float _785 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].x, _777);
    int _787 = abs(_781);
    float _789 = _783 + (-1.0);
    float _791 = _761 * (-2.0);
    float _793 = fma(_753, _773, _785);
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _797 = _501 + (-0.5);
    float _799 = fma(_791, _693, _693);
    float _801 = float(_769);
    float _803 = fma(_795, _791, _795);
    float _805 = float(_787);
    float _807 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _799);
    float _809 = _503 + _499;
    float _811 = in.m_69.x;
    float _813 = in.m_69.y;
    float _815 = _805 * _801;
    float _817 = _809 + (-1.0);
    float _819 = fma(_803, _773, _807);
    float _821 = _503 + (-0.5);
    float _823 = _815 * (-2.0);
    float _825 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _827 = _793 * 0.15915493667125701904296875;
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = fma(_823, _695, _695);
    float _833 = fma(_825, _823, _825);
    float _835 = _827 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = in.m_67.w;
    float _841 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[196].z, _831);
    float _843 = _465 * _185;
    float _845 = _465 * _191;
    float _847 = _465 * _179;
    float _849 = fma(_833, _773, _841);
    float _851 = fma(_463, _183, _843);
    float _853 = _829 * 6.283185482025146484375;
    float _855 = sin(_853);
    float _857 = fma(_463, _189, _845);
    float _859 = _849 * 0.15915493667125701904296875;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _605);
    float _863 = _811 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _865 = _813 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _867 = fma(_467, _193, _857);
    float _869 = fma(_463, _177, _847);
    float _871 = _829 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _877 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _879 = _827 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = _875 * _861;
    float _885 = _859 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _569);
    float _891 = _837 * _873;
    float _893 = _877 * _889;
    float _895 = _837 * _855;
    float _897 = in.m_65.w;
    float _899 = _859 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _881 * _855;
    float _905 = _881 * _873;
    float _907 = _837 * _887;
    float _909 = _881 * _887;
    float _911 = _873 * _887;
    float _913 = _855 * _887;
    float _915 = _907 * _893;
    float _917 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _919 = fma(_901, _891, _903);
    float _921 = -_893;
    float _923 = _901 * _921;
    float _925 = -_905;
    float _927 = fma(_901, _895, _925);
    float _929 = -_895;
    float _931 = fma(_901, _905, _929);
    float _933 = fma(_919, _883, _915);
    float _935 = _909 * _893;
    float _937 = fma(_911, _883, _923);
    float _939 = fma(_901, _903, _891);
    float _941 = fma(_927, _917, _933);
    float _943 = fma(_931, _883, _935);
    float _945 = fma(_913, _917, _937);
    float _947 = fma(_467, _187, _851);
    float _949 = _941 * _447;
    float _951 = fma(_939, _917, _943);
    float _953 = _941 * _439;
    float _955 = _867 + _839;
    float _957 = fma(_945, _385, _949);
    float _959 = _947 + _897;
    float _961 = fma(_945, _371, _953);
    float _963 = in.m_63.w;
    float _965 = fma(_951, _461, _957);
    float _967 = fma(_467, _181, _869);
    float _969 = fma(_951, _451, _961);
    float _971 = _941 * _443;
    float _973 = _955 + _965;
    float _975 = _959 + _969;
    float _977 = fma(_945, _381, _971);
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _981 = _973 + _979;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _985 = _975 + _983;
    float _987 = fma(_951, _455, _977);
    float _989 = _981 * _981;
    float _991 = fma(_985, _985, _989);
    float _993 = sqrt(_991);
    float _995 = _967 + _963;
    float _997 = _995 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _999 = _995 + _987;
    float _1001 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].x, _997);
    float _1003 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1001);
    bool _1005 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001;
    float _1009 = _975;
    float _1011 = _987;
    if (!_1005)
    {
        _1007 = _975;
    }
    float _1013 = _1007;
    float _1015 = _1013;
    if (!_1005)
    {
        _1009 = _973;
    }
    float _1017 = _1009;
    float _1019 = _1017;
    if (!_1005)
    {
        _1011 = _999;
    }
    float _1021 = _1011;
    bool _1023 = !_1005;
    float _1025 = _1021;
    if (!_1023)
    {
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1031 = _993 + _1029;
        float _1033 = rsqrt(_991);
        float _1035 = _1031 * _1027;
        float _1037 = _999 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1035 * 0.15915493667125701904296875;
        float _1041 = _1039 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = _1043 + (-1.0);
        float _1051 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = fma(_1047, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1055 = fma(_999, _1043, _1051);
        float _1057 = _1033 * _1053;
        float _1059 = fma(_985, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1061 = fma(_981, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1025 = _1055;
        _1015 = _1059;
        _1019 = _1061;
    }
    float _1063 = _1025;
    float _1065 = _1015;
    float _1067 = _1019;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1071 = _1063 + _1069;
    float _1073 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1077 = _1065 + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1081 = _1067 + _1079;
    float _1083 = _1071 * _1071;
    float _1085 = _995 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1087 = 1.0 / _1073;
    bool _1089 = _565 != 0;
    float _1091 = fma(_1077, _1077, _1083);
    float _1093 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1085);
    float _1095 = fma(_1081, _1081, _1091);
    float _1097 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1093);
    float _1099 = rsqrt(_1095);
    float _1101 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1103 = _1101 + _1073;
    float _1105 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1107 = sqrt(_1095);
    float _1109 = _1103 * _1087;
    float _1111 = _1109 * 0.5;
    float _1113 = _995 + _1105;
    float _1115 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1119 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1117);
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1123 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1125 = floor(_1115);
    float _1127 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1121);
    float _1129 = _1077 * _1123;
    float _1131 = _1081 * _1123;
    float _1133 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1127);
    float _1135 = _1129 * _1129;
    float _1137 = _1131 * _1131;
    float _1139 = 1.0 / _1119;
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1143 = _1135 + _1137;
    float _1145 = -_1125;
    float _1147 = _1115 + _1145;
    float _1149 = sqrt(_1143);
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1153 = _1139 * _1151;
    float _1155 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1157 = trunc(_1141);
    int _1159 = int(_1157);
    bool _1161 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1163 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1155);
    bool _1165 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1167 = _1149 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1169 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1163);
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1177 = _1149 + _1175;
    float _1179 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1181 = 2;
    float _1183 = _1143;
    float _1185 = _1115;
    float _1187 = _1129;
    float _1189 = _1131;
    float _1191 = _1135;
    float _1193 = _1137;
    float _1195 = _1179;
    if (!_1161)
    {
        _1181 = 1;
    }
    int _1197 = _1181;
    float _1199 = trunc(_1179);
    int _1201 = int(_1199);
    int _1203 = _1197;
    if (!_1165)
    {
        _1203 = _1173;
    }
    int _1205 = _1203;
    int _1207 = _1205 << 6;
    int _1209 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1211 = _1159 + _1209;
    int _1213 = _1211 + 1;
    float _1215 = as_type<float>(_565);
    float _1217 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    int _1219 = _1213;
    float _1221 = as_type<float>(_1205);
    if (_1167)
    {
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1215 = _1223;
    }
    float _1225 = _1215;
    int _1227 = _1207 + 96;
    uint _1230 = uint(int(uint(_1227) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1248 = _1213 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1252 = _1201 + _1250;
    int _1254 = _1252 + 1;
    float _1256 = _1246;
    if (_1167)
    {
        float _1258 = rsqrt(_1143);
        _1183 = _1258;
    }
    float _1260 = _1183;
    int _1262 = _1207 + 80;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = _1213 | _1254;
    float _1282 = _1260;
    if (_1167)
    {
        float _1284 = _1177 * _1225;
        _1217 = _1284;
    }
    float _1286 = _1217;
    bool _1288 = _1280 < 0;
    bool _1290 = _1288 || _1248;
    int _1292 = _1207 + 48;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c15)._m0[int(_1304)][_1306];
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = 0.0;
    if (_1167)
    {
        float _1314 = _1286 * 0.15915493667125701904296875;
        _1312 = _1314;
    }
    float _1316 = _1312;
    bool _1318 = _1254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1320 = _1318 || _1290;
    float _1322 = floor(_1246);
    float _1324 = precise::max(0.0, _1310);
    int _1326 = _1207 + 104;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
    int _1332 = int(_1328) & 3;
    float _1334 = (*spvDescriptorSet0.vp_c15)._m0[int(_1330)][_1332];
    int _1336 = int(_1328) + 1;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    int _1340 = _1336 & 3;
    float _1342 = (*spvDescriptorSet0.vp_c15)._m0[int(_1338)][_1340];
    float _1344 = -_1123;
    float _1346 = -_1324;
    float _1348 = fma(_1071, _1344, _1346);
    float _1350 = 0.0;
    float _1352 = _1348;
    if (_1167)
    {
        float _1354 = _1316 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        _1350 = _1356;
    }
    float _1358 = _1350;
    float _1360 = 0.0;
    if (_1167)
    {
        float _1362 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1362;
    }
    float _1364 = _1360;
    int _1366 = _1207 + 64;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c15)._m0[int(_1378)][_1380];
    float _1384 = _1364;
    if (!_1320)
    {
        int _1386 = _1254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1213;
        _1219 = _1388;
    }
    int _1390 = _1219;
    float _1392 = 0.0;
    if (_1167)
    {
        float _1394 = _1316 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        _1392 = _1396;
    }
    float _1398 = _1392;
    float _1400 = -_1322;
    float _1402 = _1246 + _1400;
    int _1404 = _1207 + 56;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
    int _1422 = as_type<int>(_1244);
    int _1424 = as_type<int>(_1236);
    if (_1167)
    {
        float _1426 = fma(_1358, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1384 = _1426;
    }
    float _1428 = _1384;
    if (!_1320)
    {
        float _1430 = floor(_1179);
        _1256 = _1430;
    }
    float _1432 = _1256;
    float _1434 = _1113 * _1244;
    if (_1167)
    {
        float _1436 = _1260 * _1428;
        _1282 = _1436;
    }
    float _1438 = _1282;
    int _1440 = _1207 + 72;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    uint _1444 = uint(int(uint(int(_1442)) >> uint(2)));
    int _1446 = int(_1442) & 3;
    float _1448 = (*spvDescriptorSet0.vp_c15)._m0[int(_1444)][_1446];
    int _1450 = int(_1442) + 1;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    int _1454 = _1450 & 3;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[int(_1452)][_1454];
    if (!_1320)
    {
        int _1458 = _1390 << 2;
        _1422 = _1458;
    }
    int _1460 = _1422;
    float _1462 = fma(_959, _1236, _1434);
    int _1464 = _1460;
    if (_1167)
    {
        float _1466 = _1398 + (-1.0);
        _1185 = _1466;
    }
    float _1468 = _1185;
    float _1470 = _1468;
    if (_1167)
    {
        float _1472 = _1129 * _1438;
        _1187 = _1472;
    }
    float _1474 = _1187;
    if (_1167)
    {
        float _1476 = _1131 * _1438;
        _1189 = _1476;
    }
    float _1478 = _1189;
    if (!_1320)
    {
        uint _1480 = uint(int(uint(_1390) >> uint(2)));
        _1424 = int(_1480);
    }
    int _1482 = _1424;
    int _1484 = _1482;
    if (_1167)
    {
        float _1486 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1470 = _1486;
    }
    float _1488 = _1470;
    if (_1167)
    {
        float _1490 = _1474 * _1474;
        _1191 = _1490;
    }
    float _1492 = _1191;
    if (_1167)
    {
        float _1494 = _1478 * _1478;
        _1193 = _1494;
    }
    float _1496 = _1193;
    int _1498 = _1207 + 88;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    uint _1502 = uint(int(uint(int(_1500)) >> uint(2)));
    int _1504 = int(_1500) & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    int _1508 = int(_1500) + 1;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    int _1512 = _1508 & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    if (_1167)
    {
        float _1516 = fma(_1348, _1398, _1488);
        _1352 = _1516;
    }
    float _1518 = _1352;
    float _1520 = _1113 * _1278;
    if (!_1320)
    {
        int _1522 = 12 & _1460;
        _1464 = _1522;
    }
    int _1524 = _1464;
    float _1526 = _1113 * _1382;
    float _1528 = fma(_1518, _1518, _1492);
    float _1530 = fma(_955, _1334, _1462);
    float _1532 = fma(_959, _1270, _1520);
    float _1534 = fma(_959, _1374, _1526);
    float _1536 = _1528 + _1496;
    float _1538 = _1113 * _1308;
    float _1540 = _1530 + _1342;
    float _1542 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1546 = fma(_959, _1300, _1538);
    float _1548 = rsqrt(_1536);
    float _1550 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1552 = fma(_955, _1412, _1546);
    if (!_1320)
    {
        int _1554 = _1482 << 4;
        int _1556 = _1554 + _1524;
        _1484 = _1556;
    }
    int _1558 = _1484;
    float _1560 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1544);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = _1552 + _1420;
    float _1570 = 1.0 / _1540;
    float _1572 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    float _1574 = -_1566;
    float _1576 = _1574 + 1.0;
    float _1578 = fma(_955, _1448, _1534);
    float _1580 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1560);
    float2 _4936 = float2(_1147, _1402);
    float _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4936, float2(0.0), isnan(_4936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4936, float2(0.0), isnan(_4936)), level(0.0)).x;
    float _1584 = _1578 + _1456;
    float _1586 = _1548 * _1474;
    float _1588 = _1548 * _1518;
    float _1590 = _1548 * _1478;
    float _1592 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1594 = abs(_1576);
    float _1596 = log2(_1594);
    float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1604 = _1568 * _1570;
    float _1606 = -_1598;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1584 * _1570;
    float _1612 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1614 = -_1602;
    float _1616 = fma(_1614, _1600, 1.0);
    float _1618 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1620 = -_1590;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    bool _1624 = _1604 >= 0.0;
    float _1626 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1628 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1618);
    float _1630 = fma(_1622, -0.5, 0.5);
    bool _1632 = _1604 <= 1.0;
    bool _1634 = _1632 && _1624;
    float _1636 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1638 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1640 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1612);
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1644 = _1610 >= 0.0;
    bool _1646 = _1644 && _1634;
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = exp2(_1636);
    float _1652 = fma(_1622, 0.5, 0.5);
    float _1654 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1640);
    float _1656 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1642);
    float _1658 = fma(_955, _1506, _1532);
    bool _1660 = _1610 <= 1.0;
    bool _1662 = _1660 && _1646;
    float _1664 = _1506;
    float _1666 = _1514;
    if (!_1320)
    {
        int _1668 = _1558 + 400;
        uint _1670 = uint(int(uint(_1668) >> uint(2)));
        uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
        int _1674 = int(_1670) & 3;
        float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
        _1664 = _1676;
    }
    float _1678 = _1664;
    float _1680 = _1588 + 1.0;
    float _1682 = sqrt(_1630);
    float _1684 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1686 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1656);
    float _1688 = _1658 + _1514;
    float _1690 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1320)
    {
        float _1692 = -_1432;
        float _1694 = _1179 + _1692;
        _1195 = _1694;
    }
    float _1696 = _1195;
    float _1698 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1700 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1686);
    float _1702 = _1608;
    if (!_1320)
    {
        float _1704 = floor(_1141);
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = -_1588;
    float _1710 = fma(_1650, _1680, _1708);
    float _1712 = fma(_1652, _1698, -0.212114393711090087890625);
    float _1714 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1662)
    {
        float _1716 = float(_1205);
        _1221 = _1716;
    }
    float _1718 = _1221;
    float _1720 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1722 = fma(_1652, _1712, 1.570728778839111328125);
    float _1724 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = log2(_1616);
    float _1728 = _1682 * 0.636619746685028076171875;
    float _1730 = _1688 * _1570;
    float _1732 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1734 = fma(_1710, 0.5, 0.5);
    float _1736 = -_1722;
    float _1738 = fma(_1728, _1736, 1.0);
    float _1740 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1720);
    float _1742 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1732);
    float _1744 = 1.0 / _1700;
    if (!_1320)
    {
        float _1746 = -_1706;
        float _1748 = _1141 + _1746;
        _1666 = _1748;
    }
    float _1750 = _1666;
    float _1752 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1754 = _1724;
    if (_1662)
    {
        float _1756 = rint(_1718);
        float _1758 = precise::max(_1756, 0.0);
        uint _1760 = uint(_1758);
        uint _1762 = clamp(_1760, 0u, 65535u);
        _1754 = as_type<float>(_1762);
    }
    float _1764 = _1754;
    float _1766 = _1726 * 0.693147182464599609375;
    float _1768 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1770 = _1742 * _1744;
    float _1772 = _1752 * _1744;
    float _1774 = fma(_1770, 0.5, 0.5);
    float _1776 = fma(_1772, -0.5, 0.5);
    float _1778 = _1678;
    if (!_1320)
    {
        float _1780 = rint(_1678);
        float _1782 = precise::max(_1780, 0.0);
        uint _1784 = uint(_1782);
        uint _1786 = clamp(_1784, 0u, 65535u);
        _1778 = as_type<float>(_1786);
    }
    float _1788 = _1778;
    float _1790 = _1764;
    if (_1662)
    {
        float3 _5295 = float3(_1604, _1610, float(as_type<int>(_1764)));
        float3 _5299 = select(_5295, float3(0.0), isnan(_5295));
        float _1792 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5299.xy, uint(rint(_5299.z)), _1730, level(0.0));
        _1790 = _1792;
    }
    float _1794 = _1790;
    float3 _5309 = float3(_1774, _1776, _1768);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5309, float3(0.0), isnan(_5309)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5309, float3(0.0), isnan(_5309)), level(0.0)).x;
    float3 _5318 = float3(_1774, _1776, _1768);
    float4 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5318, float3(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5318, float3(0.0), isnan(_5318)), level(0.0)).xyzw;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1799.w;
    float2 _5334 = float2(_1738, _1734);
    float3 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5334, float2(0.0), isnan(_5334)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5334, float2(0.0), isnan(_5334)), level(0.0)).xyz;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = _1696;
    if (!_1320)
    {
        float3 _5355 = float3(_1750, _1696, float(as_type<int>(_1788)));
        float3 _5357 = select(_5355, float3(0.0), isnan(_5355));
        float _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5357.xy, uint(rint(_5357.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5357.xy, uint(rint(_5357.z)), level(0.0)).x;
        _1819 = _1821;
    }
    float _1823 = _1819;
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1827 = -_639;
    float _1829 = _1827 + 0.5;
    bool _1831 = _505 > 0.5;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1837 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1839 = isnan(_497);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1845 = _1841 || _1843;
    float _1847 = float(_1845);
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1855 = _497 + _1853;
    float _1857 = 1.0 / _1835;
    bool _1859 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1861 = isnan(_497);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    float _1871 = -_1847;
    float _1873 = _1871 + 1.0;
    bool _1875 = _499 > 0.5;
    float _1877 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1879 = -_569;
    int _1881 = _1831 ? as_type<int>(_1879) : as_type<int>(_569);
    float _1883 = _1869 * _1873;
    float _1885 = -_1869;
    float _1887 = _1885 + 1.0;
    float _1889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1893 = _1891 != 0;
    float _1895 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1897 = -_605;
    int _1899 = _1875 ? as_type<int>(_1897) : as_type<int>(_605);
    out.m_78.x = _1077;
    out.m_78.y = _1071;
    out.m_78.z = _1081;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1903 = _1901 != 0;
    float _1905 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1895);
    bool _1907 = !_1893;
    float _1909 = _1907 ? _605 : as_type<float>(_1899);
    float _1911 = _1851 * _1857;
    float _1913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1917 = _1915 != 0;
    float _1919 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1905);
    float _1921 = fma(_1911, _1855, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1923 = _1909 + 0.5;
    bool _1925 = !_1917;
    float _1927 = _1925 ? _569 : as_type<float>(_1881);
    float _1929 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1931 = _1921 * _1883;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1943 = _1939 || _1941;
    float _1945 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1931);
    float _1947 = -_569;
    int _1949 = _1089 ? as_type<int>(_1947) : as_type<int>(_569);
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1953 = _1951 != 0;
    float _1955 = _629 + 0.5;
    float _1957 = abs(_1153);
    float _1959 = log2(_1957);
    float _1961 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1945);
    float _1963 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1967 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1969 = !_1903;
    float _1971 = _1969 ? _569 : as_type<float>(_1949);
    float _1973 = _1963 * _1889;
    float _1975 = _1965 * _1913;
    float _1977 = -_605;
    int _1979 = _607 ? as_type<int>(_1977) : as_type<int>(_605);
    float _1981 = fma(_1877, _1877, 1.0);
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1985 = _1967 * _1825;
    float _1987 = -_1971;
    float _1989 = _1987 + 0.5;
    float _1991 = -_1927;
    float _1993 = _1991 + 0.5;
    bool _1995 = !_1953;
    float _1997 = _1995 ? _605 : as_type<float>(_1979);
    out.m_80.x = _1975;
    out.m_80.y = _1973;
    float _1999 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2001 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2005 = _1997 + 0.5;
    float _2007 = _1993 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2009 = _2001 * _1933;
    float _2011 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2013 = _1857;
    float _2015 = _2005;
    float _2017 = _2007;
    if (!_1943)
    {
        _2013 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2019 = _2013;
    float _2021 = _1961 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2023 = exp2(_1999);
    float _2025 = _2011 * _1983;
    float _2027 = _2019;
    if (!_1943)
    {
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2031 = _2019 + _2029;
        _2015 = _2031;
    }
    float _2033 = _2015;
    out.m_82.w = _2021;
    float _2035 = rsqrt(_1981);
    float _2037 = _2007 * _2003;
    if (!_1943)
    {
        float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2041 = _1153 + _2039;
        _2017 = _2041;
    }
    float _2043 = _2017;
    bool _2045 = _1153 <= 8000.0;
    bool _2047 = isnan(_1153);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(8000.0);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    out.m_84.x = _1985;
    out.m_84.y = _2009;
    out.m_84.z = _2025;
    out.m_84.w = _2037;
    float _2057 = fma(_2023, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = _605 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2063 = -_1877;
    float _2065 = _901 * _2063;
    float _2067 = _2023;
    if (!_1943)
    {
        float _2069 = 1.0 / _2033;
        _2027 = _2069;
    }
    float _2071 = _2027;
    if (_1943)
    {
        _2067 = 1.0;
    }
    float _2073 = _2067;
    float _2075 = _1877 * _2035;
    float _2077 = fma(_911, _2061, _2065);
    float _2079 = _907 * _1877;
    float _2081 = -_2075;
    float _2083 = _927 * _2081;
    float _2085 = -_2075;
    float _2087 = _913 * _2085;
    float _2089 = -_2075;
    float _2091 = _939 * _2089;
    float _2093 = _913 + _2077;
    float _2095 = fma(_919, _2061, _2079);
    float _2097 = _909 * _1877;
    float _2099 = fma(_907, _2035, _2083);
    float _2101 = _919 * _439;
    float _2103 = -_901;
    float _2105 = fma(_2103, _2035, _2087);
    float _2107 = fma(_909, _2035, _2091);
    float _2109 = _919 * _443;
    float _2111 = _927 + _2095;
    float _2113 = _919 * _447;
    float _2115 = fma(_931, _2061, _2097);
    float _2117 = fma(_911, _371, _2101);
    float _2119 = _2099 * _443;
    float _2121 = _2099 * _439;
    float _2123 = _2099 * _447;
    float _2125 = fma(_911, _381, _2109);
    float _2127 = fma(_911, _385, _2113);
    float _2129 = fma(_2105, _381, _2119);
    float _2131 = fma(_2105, _371, _2121);
    float _2133 = fma(_2105, _385, _2123);
    float _2135 = fma(_931, _455, _2125);
    float _2137 = fma(_931, _451, _2117);
    float _2139 = fma(_931, _461, _2127);
    float _2141 = fma(_2107, _455, _2129);
    float _2143 = fma(_2107, _461, _2133);
    float _2145 = fma(_2059, -2.0, 3.0);
    float _2147 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2149 = _2059 * _2059;
    float _2151 = fma(_2107, _451, _2131);
    out.m_86.x = _2137;
    out.m_86.y = _2135;
    out.m_86.z = _2139;
    float _2153 = _2149 * _2145;
    float _2155 = exp2(_2147);
    float _2157 = _2111 * _439;
    out.m_88.x = _2151;
    out.m_88.y = _2141;
    out.m_88.z = _2143;
    float _2159 = -_2153;
    float _2161 = _2159 + 1.0;
    float _2163 = _2111 * _443;
    float _2165 = _2111 * _447;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1929;
    out.gl_Position.w = _1700;
    float _2167 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2153);
    float _2169 = _939 + _2115;
    float _2171 = _1929 + _1700;
    float _2173 = fma(_2093, _371, _2157);
    float _2175 = fma(_2093, _381, _2163);
    float _2177 = fma(_2093, _385, _2165);
    float _2179 = _2055 * _2167;
    float _2181 = _2171 * 0.5;
    float _2183 = fma(_2169, _455, _2175);
    float _2185 = fma(_2169, _461, _2177);
    float _2187 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2189 = -_2155;
    float _2191 = _2189 + 1.0;
    out.m_90.z = _2181;
    out.m_90.w = _1700;
    float _2193 = _2073;
    float _2195 = _2187;
    float _2197 = _2177;
    float _2199 = _2173;
    if (!_1662)
    {
        _457 = 1.0;
    }
    float _2201 = _457;
    float _2203 = _2201;
    if (!_1943)
    {
        float _2205 = _2043 * _2071;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        _2193 = _2207;
    }
    float _2209 = _2193;
    float _2211 = fma(_2169, _451, _2173);
    float _2213 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2215 = -_1582;
    float _2217 = _2215 + 1.0;
    float _2219 = _2217 * _2187;
    float _2221 = precise::clamp(_2219, 0.0, 1.0);
    float _2223 = _2221;
    if (_1320)
    {
        _2195 = 1.0;
    }
    float _2225 = _2195;
    float _2227 = _2225;
    if (_1662)
    {
        bool _2229 = _1794 >= _1730;
        bool _2231 = isnan(_1794);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan(_1730);
        bool _2237 = _2233 || _2235;
        float _2239 = float(_2237);
        _2203 = _2239;
    }
    float _2241 = _2203;
    float _2243 = _2241;
    if (!_1320)
    {
        int _2245 = _1390 << 4;
        int _2247 = _2245 + 2048;
        uint _2249 = uint(int(uint(_2247) >> uint(2)));
        uint _2251 = uint(int(uint(int(_2249)) >> uint(2)));
        int _2253 = int(_2249) & 3;
        float _2255 = (*spvDescriptorSet0.vp_c15)._m0[int(_2251)][_2253];
        int _2257 = int(_2249) + 1;
        uint _2259 = uint(int(uint(_2257) >> uint(2)));
        int _2261 = _2257 & 3;
        float _2263 = (*spvDescriptorSet0.vp_c15)._m0[int(_2259)][_2261];
        int _2265 = _2247 + 8;
        uint _2267 = uint(int(uint(_2265) >> uint(2)));
        uint _2269 = uint(int(uint(int(_2267)) >> uint(2)));
        int _2271 = int(_2267) & 3;
        float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
        int _2275 = int(_2267) + 1;
        uint _2277 = uint(int(uint(_2275) >> uint(2)));
        int _2279 = _2275 & 3;
        float _2281 = (*spvDescriptorSet0.vp_c15)._m0[int(_2277)][_2279];
        float _2283 = _1113 * _2263;
        float _2285 = fma(_959, _2255, _2283);
        float _2287 = fma(_955, _2273, _2285);
        float _2289 = _2287 + _2281;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = -_2291;
        float _2295 = _2293 + _1823;
        float _2297 = fma(_2295, 500.0, 1.5);
        float _2299 = exp2(_2297);
        float _2301 = 0.0 + _2299;
        float _2303 = precise::clamp(_2301, 0.0, 1.0);
        _2227 = _2303;
        _2197 = _2299;
        _2199 = _2255;
    }
    float _2305 = _2227;
    float _2307 = _2197;
    float _2309 = _2199;
    float _2311 = _2241 * _2305;
    float _2313 = _2213 * _1796;
    float _2315 = -_2221;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.x = _2211;
    out.m_92.y = _2183;
    out.m_92.z = _2185;
    bool _2319 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2321 = isnan(_1107);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2327 = _2323 || _2325;
    float _2329 = _1807 * _2313;
    float _2331 = -_2311;
    float _2333 = fma(_2331, _2317, 1.0);
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = _1817 * _2313;
    float _2339 = -_2213;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_1813, _2329, _1801);
    float _2345 = fma(_1815, _2329, _1803);
    float _2347 = fma(_1807, _2337, _1805);
    float _2349 = _1807 * _2341;
    out.m_94.x = _1065;
    out.m_94.y = _1063;
    out.m_94.z = _1067;
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2353 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _2343;
    out.m_96.y = _2345;
    out.m_96.z = _2347;
    out.m_96.w = _2349;
    float _2355 = _2309;
    float _2357 = _2307;
    float _2359 = _2341;
    float _2361 = _2351;
    if (!_2327)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2363 = _2355;
    float _2365 = _2363;
    float _2367 = _2363;
    if (!_2327)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2369 = _2357;
    out.m_98.x = _2351;
    float _2371 = _2369;
    float _2373 = _2369;
    if (!_2327)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2375 = _2223;
    float _2377 = _2375;
    float _2379 = _2375;
    if (!_2327)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2381 = _2243;
    float _2383 = _2381;
    float _2385 = _2381;
    if (!_2327)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2387 = _2359;
    float _2389 = _2387;
    float _2391 = _2387;
    if (!_2327)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2393 = _2361;
    bool _2395 = !_2327;
    float _2397 = _2393;
    float _2399 = _2393;
    if (!_2395)
    {
        bool _2401 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2403 = isnan(_1107);
        bool _2405 = _2401 || _2403;
        bool _2407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2409 = _2405 || _2407;
        if (!_2409)
        {
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2413 = _1107 + _2411;
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2417 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2415;
            float _2419 = 1.0 / _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2441 = _2413 * _2419;
            float _2443 = precise::clamp(_2441, 0.0, 1.0);
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2449 = fma(_2443, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2451 = fma(_2443, _2447, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2453 = fma(_2443, _2427, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2455 = fma(_2443, _2431, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2457 = fma(_2443, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2459 = fma(_2443, _2439, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2373 = _2451;
            _2391 = _2457;
            _2367 = _2449;
            _2385 = _2455;
            _2379 = _2453;
            _2399 = _2459;
            _2461 = true;
        }
        else
        {
            bool _2463 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2465 = isnan(_1107);
            bool _2467 = _2463 || _2465;
            bool _2469 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2471 = _2467 || _2469;
            if (!_2471)
            {
                _2365 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2473 = _2365;
            _2367 = _2473;
            if (!_2471)
            {
                _2371 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2475 = _2371;
            _2373 = _2475;
            if (!_2471)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2477 = _2377;
            _2379 = _2477;
            if (!_2471)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2479 = _2383;
            _2385 = _2479;
            if (!_2471)
            {
                _2389 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2481 = _2389;
            _2391 = _2481;
            if (!_2471)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2483 = _2397;
            bool _2485 = !_2471;
            _2399 = _2483;
            if (!_2485)
            {
                bool _2487 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2489 = isnan(_1107);
                bool _2491 = _2487 || _2489;
                bool _2493 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2495 = _2491 || _2493;
                if (!_2495)
                {
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2499 = _1107 + _2497;
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2503 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2501;
                    float _2505 = 1.0 / _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2527 = _2499 * _2505;
                    float _2529 = precise::clamp(_2527, 0.0, 1.0);
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2535 = fma(_2529, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2537 = fma(_2529, _2533, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2539 = fma(_2529, _2513, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2541 = fma(_2529, _2517, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2543 = fma(_2529, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2545 = fma(_2529, _2525, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2373 = _2537;
                    _2391 = _2543;
                    _2367 = _2535;
                    _2385 = _2541;
                    _2379 = _2539;
                    _2399 = _2545;
                    _2461 = true;
                }
                else
                {
                    _2373 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2391 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2367 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2461 = false;
    float _2547 = _2373;
    float _2549 = _2391;
    float _2551 = _2367;
    float _2553 = _2385;
    float _2555 = _2379;
    float _2557 = _2399;
    float _2559 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2561 = fma(_2183, -0.5, 0.5);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = -_2547;
    float _2567 = _2565 + _2549;
    float _2569 = -_2551;
    float _2571 = _2569 + _2553;
    out.m_59.x = _2559;
    float _2573 = -_2555;
    float _2575 = _2573 + _2557;
    float _2577 = fma(_2563, _2567, _2547);
    float _2579 = fma(_2563, _2571, _2551);
    bool _2581 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2583 = _2577 * 0.586610972881317138671875;
    float _2585 = fma(_2563, _2575, _2555);
    out.m_100.x = 0.0;
    bool _2587 = _2209 > 0.0;
    bool _2589 = isnan(_2209);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = fma(_2579, 0.298911988735198974609375, _2583);
    float _2599 = fma(_2585, 0.114477999508380889892578125, _2597);
    float _2601 = -_2599;
    float _2603 = _2579 + _2601;
    float _2605 = -_2599;
    float _2607 = _2577 + _2605;
    float _2609 = -_2599;
    float _2611 = _2585 + _2609;
    float _2613 = fma(_2603, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    float _2615 = fma(_2607, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    float _2617 = fma(_2611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    bool _2619 = !_2581;
    if (!_2619)
    {
        float _2621 = -_1063;
        float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2625 = -_1065;
        float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2629 = -_1067;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2633 = _2623 * _2623;
        float _2635 = fma(_2627, _2627, _2633);
        float _2637 = fma(_2631, _2631, _2635);
        float _2639 = sqrt(_2637);
        float _2641 = rsqrt(_2637);
        float _2643 = -_2639;
        float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2647 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = _2627 * _2641;
        float _2653 = _2623 * _2641;
        float _2655 = abs(_2649);
        float _2657 = log2(_2655);
        float _2659 = _2631 * _2641;
        float _2661 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2663 = _2183 * _2653;
        float _2665 = -_2653;
        float _2667 = -_2661;
        float _2669 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2667);
        float _2671 = fma(_2211, _2651, _2663);
        float _2673 = -_2659;
        float _2675 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2669);
        float _2677 = fma(_2185, _2659, _2671);
        float _2679 = precise::clamp(_2677, 0.0, 1.0);
        float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2683 = _2675 + _2681;
        float _2685 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        float _2691 = exp2(_2685);
        float _2693 = _2691 * _2689;
        float _2695 = _2679 * _2693;
        float _2697 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2701 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2697;
        out.m_100.y = _2699;
        out.m_100.z = _2701;
    }
    out.m_102.x = _2613;
    out.m_102.y = _2615;
    out.m_102.z = _2617;
    if (_2595)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2703 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2703;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2461 = false;
    bool _489 = false;
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
        float _2760 = as_type<float>(_137);
        out.gl_Position.z = _2760;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _2829 = as_type<float>(_175);
        out.gl_Position.z = _2829;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = in.m_63.x;
    float _179 = in.m_63.y;
    float _181 = in.m_63.z;
    float _183 = in.m_65.x;
    float _185 = in.m_65.y;
    float _187 = in.m_65.z;
    float _189 = in.m_67.x;
    float _191 = in.m_67.y;
    float _193 = in.m_67.z;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = in.m_61.z;
    float _201 = _177 * _177;
    float _203 = _179 * _179;
    float _205 = _181 * _181;
    float _207 = fma(_183, _183, _201);
    float _209 = fma(_185, _185, _203);
    float _211 = fma(_187, _187, _205);
    float _213 = fma(_189, _189, _207);
    float _215 = fma(_191, _191, _209);
    float _217 = fma(_193, _193, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _219 > 0.0;
    float _225 = sqrt(_217);
    bool _227 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _231 = _227 || _229;
    bool _233 = isnan(1.0);
    bool _235 = _231 || _233;
    bool _237 = _221 > 0.0;
    float _239 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _241 = 0.0;
    float _243 = _211;
    float _245 = _213;
    float _247 = _239;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (_223)
    {
        float _251 = rsqrt(_213);
        _241 = _251;
    }
    float _253 = _241;
    bool _255 = _225 > 0.0;
    float _257 = _225;
    if (!_235)
    {
        float _259 = _239 * _239;
        float _261 = _259 * 0.5;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _263;
    if (_237)
    {
        float _269 = rsqrt(_215);
        _265 = _269;
    }
    float _271 = _265;
    if (!_235)
    {
        float _273 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _273;
    }
    float _275 = _267;
    bool _277 = !_235;
    float _279 = _275;
    float _281 = _253;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = _239 * _285;
        float _295 = 1.0 / _289;
        float _297 = _291 * 0.693147182464599609375;
        float _299 = exp2(_293);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _239);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _311;
        _243 = _295;
        _245 = _301;
    }
    float _313 = _279;
    float _315 = _243;
    float _317 = _245;
    bool _319 = !_235;
    float _321 = _315;
    float _323 = _313;
    float _325 = _317;
    if (!_319)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _239 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _247 = _345;
        _249 = _335;
    }
    float _347 = _247;
    float _349 = _249;
    float _351 = in.m_69.w;
    float _353 = 0.0;
    float _355 = _349;
    if (!_223)
    {
        _353 = 0.0;
        _355 = 0.0;
    }
    float _357 = _353;
    float _359 = _355;
    float _361 = _357;
    float _363 = _359;
    if (!_223)
    {
        _321 = 0.0;
    }
    float _365 = _321;
    float _367 = _365;
    if (_223)
    {
        float _369 = _253 * _183;
        _361 = _369;
    }
    float _371 = _361;
    float _373 = in.m_56.x;
    float _375 = in.m_56.y;
    float _377 = in.m_56.z;
    if (_223)
    {
        float _379 = _253 * _177;
        _363 = _379;
    }
    float _381 = _363;
    if (_223)
    {
        float _383 = _253 * _189;
        _367 = _383;
    }
    float _385 = _367;
    float _387 = _217;
    if (_255)
    {
        float _389 = rsqrt(_217);
        _387 = _389;
    }
    float _391 = _387;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _395 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _397 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = 0.0;
    float _401 = _395;
    if (!_237)
    {
        _281 = 0.0;
        _399 = 0.0;
    }
    float _403 = _281;
    float _405 = _399;
    float _407 = 0.0;
    float _409 = _405;
    float _411 = _403;
    if (!_237)
    {
        _407 = 0.0;
    }
    float _413 = _407;
    float _415 = fma(_347, _195, _395);
    float _417 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _419 = fma(_347, _197, _397);
    float _421 = _413;
    if (!_255)
    {
        _323 = 0.0;
        _325 = 0.0;
    }
    float _423 = _323;
    float _425 = _325;
    float _427 = _425;
    float _429 = _423;
    if (!_255)
    {
        _401 = 0.0;
    }
    float _431 = _401;
    float _433 = fma(_347, _199, _417);
    float _435 = _431;
    if (_237)
    {
        float _437 = _271 * _185;
        _421 = _437;
    }
    float _439 = _421;
    if (_237)
    {
        float _441 = _271 * _179;
        _409 = _441;
    }
    float _443 = _409;
    if (_237)
    {
        float _445 = _271 * _191;
        _411 = _445;
    }
    float _447 = _411;
    if (_255)
    {
        float _449 = _391 * _187;
        _435 = _449;
    }
    float _451 = _435;
    if (_255)
    {
        float _453 = _391 * _181;
        _427 = _453;
    }
    float _455 = _427;
    float _457 = _455;
    if (_255)
    {
        float _459 = _391 * _193;
        _429 = _459;
    }
    float _461 = _429;
    float _463 = fma(_415, _351, _373);
    float _465 = fma(_419, _351, _375);
    float _467 = fma(_433, _351, _377);
    bool _469 = !_393;
    float _487;
    if (!_469)
    {
        float _471 = in.m_71.x;
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _475 = _471 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        float _491 = float(_121);
        float _493 = 1.0 / _491;
        float _495 = _155 * _493;
        _487 = _495;
    }
    _489 = false;
    float _497 = _487;
    float _499 = in.m_71.x;
    float _501 = in.m_71.y;
    float _503 = in.m_71.z;
    float _505 = in.m_71.w;
    float _507 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _509 = log2(_507);
    float _511 = as_type<float>(int(gl_VertexIndex));
    float _513 = _509 * _155;
    float _515 = exp2(_513);
    float _517 = _503 * 2.0;
    float _519 = _499 * 2.0;
    float _521 = _501 * 2.0;
    float _523 = _501 + _499;
    int _525 = as_type<int>(_511) & 1;
    bool _527 = _525 != 0;
    int _529 = as_type<int>(_511) & 2;
    bool _531 = _529 != 0;
    bool _533 = _501 > 0.5;
    float _535 = floor(_517);
    float _537 = _523 + (-1.0);
    int _539 = int(_527);
    int _541 = _531 ? 2 : 0;
    int _543 = _539 | _541;
    int _545 = _255 ? 4 : 0;
    int _547 = _543 | _545;
    int _549 = _235 ? 8 : 0;
    int _551 = _547 | _549;
    int _553 = false ? 16 : 0;
    int _555 = _551 | _553;
    int _557 = _533 ? 32 : 0;
    int _559 = _555 | _557;
    int _561 = false ? 64 : 0;
    int _563 = _559 | _561;
    int _565 = _563 & 32;
    bool _567 = !_531;
    float _569 = _567 ? (-0.5) : 0.5;
    bool _571 = _565 != 0;
    float _573 = floor(_519);
    float _575 = floor(_521);
    bool _577 = _535 > 0.0;
    bool _579 = _535 >= 0.0;
    bool _581 = isnan(_535);
    bool _583 = _579 || _581;
    bool _585 = isnan(0.0);
    bool _587 = _583 || _585;
    int _589 = _587 ? 0 : 1;
    bool _591 = _573 > 0.0;
    bool _593 = _573 >= 0.0;
    bool _595 = isnan(_573);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = !_527;
    float _605 = _603 ? (-0.5) : 0.5;
    bool _607 = _503 > 0.5;
    float _609 = -_605;
    int _611 = _571 ? as_type<int>(_609) : as_type<int>(_605);
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _619 = _617 != 0;
    float _621 = -_569;
    int _623 = _607 ? as_type<int>(_621) : as_type<int>(_569);
    int _625 = _601 ? 0 : 1;
    bool _627 = !_615;
    float _629 = _627 ? _605 : as_type<float>(_611);
    int _631 = ~_589;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    bool _637 = !_619;
    float _639 = _637 ? _569 : as_type<float>(_623);
    int _641 = ~_625;
    int _643 = _641 + 1;
    int _645 = _643 + 1;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _649 = _647 != 0;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _653 = _651 != 0;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _657 = _655 != 0;
    int _659 = _635;
    int _661 = _645;
    if (!_577)
    {
        int _663 = ~_589;
        int _665 = _663 + 1;
        _659 = _665;
    }
    int _667 = _659;
    if (!_591)
    {
        int _669 = ~_625;
        int _671 = _669 + 1;
        _661 = _671;
    }
    int _673 = _661;
    bool _675 = _575 > 0.0;
    bool _677 = _575 >= 0.0;
    bool _679 = isnan(_575);
    bool _681 = _677 || _679;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _689 = 1.0 + _687;
    float _691 = in.m_76.x;
    float _693 = in.m_76.y;
    float _695 = in.m_76.z;
    bool _697 = !_649;
    int _699 = _697 ? 0 : 1;
    bool _701 = !_653;
    int _703 = _701 ? 0 : 1;
    float _705 = 1.0 / _689;
    int _707 = abs(_699);
    float _709 = -_515;
    float _711 = _709 + 1.0;
    int _713 = abs(_703);
    float _715 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _717 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _719 = isnan(1.0);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _725 = _721 || _723;
    float _727 = float(_667);
    float _729 = float(_707);
    bool _731 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _733 = isnan(0.0);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _739 = _735 || _737;
    float _741 = _729 * _727;
    int _743 = _685 ? 0 : 1;
    float _745 = float(_673);
    float _747 = _741 * (-2.0);
    float _749 = float(_713);
    float _751 = _739 ? _711 : 0.0;
    float _753 = fma(_715, _747, _715);
    int _755 = ~_743;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    float _761 = _749 * _745;
    int _763 = _759;
    if (!_675)
    {
        int _765 = ~_743;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    if (_725)
    {
        float _771 = _751 * _705;
        _159 = _771;
    }
    float _773 = _159;
    float _775 = _499 + (-0.5);
    float _777 = fma(_747, _691, _691);
    bool _779 = !_657;
    int _781 = _779 ? 0 : 1;
    float _783 = _501 + _503;
    float _785 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].x, _777);
    int _787 = abs(_781);
    float _789 = _783 + (-1.0);
    float _791 = _761 * (-2.0);
    float _793 = fma(_753, _773, _785);
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _797 = _501 + (-0.5);
    float _799 = fma(_791, _693, _693);
    float _801 = float(_769);
    float _803 = fma(_795, _791, _795);
    float _805 = float(_787);
    float _807 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[196].y, _799);
    float _809 = _503 + _499;
    float _811 = in.m_69.x;
    float _813 = in.m_69.y;
    float _815 = _805 * _801;
    float _817 = _809 + (-1.0);
    float _819 = fma(_803, _773, _807);
    float _821 = _503 + (-0.5);
    float _823 = _815 * (-2.0);
    float _825 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _827 = _793 * 0.15915493667125701904296875;
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = fma(_823, _695, _695);
    float _833 = fma(_825, _823, _825);
    float _835 = _827 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = in.m_67.w;
    float _841 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[196].z, _831);
    float _843 = _465 * _185;
    float _845 = _465 * _191;
    float _847 = _465 * _179;
    float _849 = fma(_833, _773, _841);
    float _851 = fma(_463, _183, _843);
    float _853 = _829 * 6.283185482025146484375;
    float _855 = sin(_853);
    float _857 = fma(_463, _189, _845);
    float _859 = _849 * 0.15915493667125701904296875;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _605);
    float _863 = _811 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _865 = _813 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _867 = fma(_467, _193, _857);
    float _869 = fma(_463, _177, _847);
    float _871 = _829 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _877 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _879 = _827 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = _875 * _861;
    float _885 = _859 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _569);
    float _891 = _837 * _873;
    float _893 = _877 * _889;
    float _895 = _837 * _855;
    float _897 = in.m_65.w;
    float _899 = _859 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _881 * _855;
    float _905 = _881 * _873;
    float _907 = _837 * _887;
    float _909 = _881 * _887;
    float _911 = _873 * _887;
    float _913 = _855 * _887;
    float _915 = _907 * _893;
    float _917 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _919 = fma(_901, _891, _903);
    float _921 = -_893;
    float _923 = _901 * _921;
    float _925 = -_905;
    float _927 = fma(_901, _895, _925);
    float _929 = -_895;
    float _931 = fma(_901, _905, _929);
    float _933 = fma(_919, _883, _915);
    float _935 = _909 * _893;
    float _937 = fma(_911, _883, _923);
    float _939 = fma(_901, _903, _891);
    float _941 = fma(_927, _917, _933);
    float _943 = fma(_931, _883, _935);
    float _945 = fma(_913, _917, _937);
    float _947 = fma(_467, _187, _851);
    float _949 = _941 * _447;
    float _951 = fma(_939, _917, _943);
    float _953 = _941 * _439;
    float _955 = _867 + _839;
    float _957 = fma(_945, _385, _949);
    float _959 = _947 + _897;
    float _961 = fma(_945, _371, _953);
    float _963 = in.m_63.w;
    float _965 = fma(_951, _461, _957);
    float _967 = fma(_467, _181, _869);
    float _969 = fma(_951, _451, _961);
    float _971 = _941 * _443;
    float _973 = _955 + _965;
    float _975 = _959 + _969;
    float _977 = fma(_945, _381, _971);
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _981 = _973 + _979;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _985 = _975 + _983;
    float _987 = fma(_951, _455, _977);
    float _989 = _981 * _981;
    float _991 = fma(_985, _985, _989);
    float _993 = sqrt(_991);
    float _995 = _967 + _963;
    float _997 = _995 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _999 = _995 + _987;
    float _1001 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].x, _997);
    float _1003 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1001);
    bool _1005 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001;
    float _1009 = _975;
    float _1011 = _987;
    if (!_1005)
    {
        _1007 = _975;
    }
    float _1013 = _1007;
    float _1015 = _1013;
    if (!_1005)
    {
        _1009 = _973;
    }
    float _1017 = _1009;
    float _1019 = _1017;
    if (!_1005)
    {
        _1011 = _999;
    }
    float _1021 = _1011;
    bool _1023 = !_1005;
    float _1025 = _1021;
    if (!_1023)
    {
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1031 = _993 + _1029;
        float _1033 = rsqrt(_991);
        float _1035 = _1031 * _1027;
        float _1037 = _999 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1039 = _1035 * 0.15915493667125701904296875;
        float _1041 = _1039 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = _1039 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = _1043 + (-1.0);
        float _1051 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = fma(_1047, _1037, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1055 = fma(_999, _1043, _1051);
        float _1057 = _1033 * _1053;
        float _1059 = fma(_985, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1061 = fma(_981, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1025 = _1055;
        _1015 = _1059;
        _1019 = _1061;
    }
    float _1063 = _1025;
    float _1065 = _1015;
    float _1067 = _1019;
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1071 = _1063 + _1069;
    float _1073 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1077 = _1065 + _1075;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1081 = _1067 + _1079;
    float _1083 = _1071 * _1071;
    float _1085 = _995 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1087 = 1.0 / _1073;
    bool _1089 = _565 != 0;
    float _1091 = fma(_1077, _1077, _1083);
    float _1093 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1085);
    float _1095 = fma(_1081, _1081, _1091);
    float _1097 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1093);
    float _1099 = rsqrt(_1095);
    float _1101 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1103 = _1101 + _1073;
    float _1105 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1107 = sqrt(_1095);
    float _1109 = _1103 * _1087;
    float _1111 = _1109 * 0.5;
    float _1113 = _995 + _1105;
    float _1115 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1119 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1117);
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1123 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1125 = floor(_1115);
    float _1127 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1121);
    float _1129 = _1077 * _1123;
    float _1131 = _1081 * _1123;
    float _1133 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1127);
    float _1135 = _1129 * _1129;
    float _1137 = _1131 * _1131;
    float _1139 = 1.0 / _1119;
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1143 = _1135 + _1137;
    float _1145 = -_1125;
    float _1147 = _1115 + _1145;
    float _1149 = sqrt(_1143);
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1153 = _1139 * _1151;
    float _1155 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1157 = trunc(_1141);
    int _1159 = int(_1157);
    bool _1161 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1163 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1155);
    bool _1165 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1167 = _1149 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1169 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1163);
    bool _1171 = !_1161;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1177 = _1149 + _1175;
    float _1179 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1181 = 2;
    float _1183 = _1143;
    float _1185 = _1115;
    float _1187 = _1129;
    float _1189 = _1131;
    float _1191 = _1135;
    float _1193 = _1137;
    float _1195 = _1179;
    if (!_1161)
    {
        _1181 = 1;
    }
    int _1197 = _1181;
    float _1199 = trunc(_1179);
    int _1201 = int(_1199);
    int _1203 = _1197;
    if (!_1165)
    {
        _1203 = _1173;
    }
    int _1205 = _1203;
    int _1207 = _1205 << 6;
    int _1209 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1211 = _1159 + _1209;
    int _1213 = _1211 + 1;
    float _1215 = as_type<float>(_565);
    float _1217 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    int _1219 = _1213;
    float _1221 = as_type<float>(_1205);
    if (_1167)
    {
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1215 = _1223;
    }
    float _1225 = _1215;
    int _1227 = _1207 + 96;
    uint _1230 = uint(int(uint(_1227) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    float _1246 = fma(_955, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1248 = _1213 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1252 = _1201 + _1250;
    int _1254 = _1252 + 1;
    float _1256 = _1246;
    if (_1167)
    {
        float _1258 = rsqrt(_1143);
        _1183 = _1258;
    }
    float _1260 = _1183;
    int _1262 = _1207 + 80;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = _1213 | _1254;
    float _1282 = _1260;
    if (_1167)
    {
        float _1284 = _1177 * _1225;
        _1217 = _1284;
    }
    float _1286 = _1217;
    bool _1288 = _1280 < 0;
    bool _1290 = _1288 || _1248;
    int _1292 = _1207 + 48;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c15)._m0[int(_1304)][_1306];
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = 0.0;
    if (_1167)
    {
        float _1314 = _1286 * 0.15915493667125701904296875;
        _1312 = _1314;
    }
    float _1316 = _1312;
    bool _1318 = _1254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1320 = _1318 || _1290;
    float _1322 = floor(_1246);
    float _1324 = precise::max(0.0, _1310);
    int _1326 = _1207 + 104;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
    int _1332 = int(_1328) & 3;
    float _1334 = (*spvDescriptorSet0.vp_c15)._m0[int(_1330)][_1332];
    int _1336 = int(_1328) + 1;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    int _1340 = _1336 & 3;
    float _1342 = (*spvDescriptorSet0.vp_c15)._m0[int(_1338)][_1340];
    float _1344 = -_1123;
    float _1346 = -_1324;
    float _1348 = fma(_1071, _1344, _1346);
    float _1350 = 0.0;
    float _1352 = _1348;
    if (_1167)
    {
        float _1354 = _1316 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        _1350 = _1356;
    }
    float _1358 = _1350;
    float _1360 = 0.0;
    if (_1167)
    {
        float _1362 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1362;
    }
    float _1364 = _1360;
    int _1366 = _1207 + 64;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c15)._m0[int(_1378)][_1380];
    float _1384 = _1364;
    if (!_1320)
    {
        int _1386 = _1254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1213;
        _1219 = _1388;
    }
    int _1390 = _1219;
    float _1392 = 0.0;
    if (_1167)
    {
        float _1394 = _1316 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        _1392 = _1396;
    }
    float _1398 = _1392;
    float _1400 = -_1322;
    float _1402 = _1246 + _1400;
    int _1404 = _1207 + 56;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[int(_1416)][_1418];
    int _1422 = as_type<int>(_1244);
    int _1424 = as_type<int>(_1236);
    if (_1167)
    {
        float _1426 = fma(_1358, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1384 = _1426;
    }
    float _1428 = _1384;
    if (!_1320)
    {
        float _1430 = floor(_1179);
        _1256 = _1430;
    }
    float _1432 = _1256;
    float _1434 = _1113 * _1244;
    if (_1167)
    {
        float _1436 = _1260 * _1428;
        _1282 = _1436;
    }
    float _1438 = _1282;
    int _1440 = _1207 + 72;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    uint _1444 = uint(int(uint(int(_1442)) >> uint(2)));
    int _1446 = int(_1442) & 3;
    float _1448 = (*spvDescriptorSet0.vp_c15)._m0[int(_1444)][_1446];
    int _1450 = int(_1442) + 1;
    uint _1452 = uint(int(uint(_1450) >> uint(2)));
    int _1454 = _1450 & 3;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[int(_1452)][_1454];
    if (!_1320)
    {
        int _1458 = _1390 << 2;
        _1422 = _1458;
    }
    int _1460 = _1422;
    float _1462 = fma(_959, _1236, _1434);
    int _1464 = _1460;
    if (_1167)
    {
        float _1466 = _1398 + (-1.0);
        _1185 = _1466;
    }
    float _1468 = _1185;
    float _1470 = _1468;
    if (_1167)
    {
        float _1472 = _1129 * _1438;
        _1187 = _1472;
    }
    float _1474 = _1187;
    if (_1167)
    {
        float _1476 = _1131 * _1438;
        _1189 = _1476;
    }
    float _1478 = _1189;
    if (!_1320)
    {
        uint _1480 = uint(int(uint(_1390) >> uint(2)));
        _1424 = int(_1480);
    }
    int _1482 = _1424;
    int _1484 = _1482;
    if (_1167)
    {
        float _1486 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1470 = _1486;
    }
    float _1488 = _1470;
    if (_1167)
    {
        float _1490 = _1474 * _1474;
        _1191 = _1490;
    }
    float _1492 = _1191;
    if (_1167)
    {
        float _1494 = _1478 * _1478;
        _1193 = _1494;
    }
    float _1496 = _1193;
    int _1498 = _1207 + 88;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    uint _1502 = uint(int(uint(int(_1500)) >> uint(2)));
    int _1504 = int(_1500) & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    int _1508 = int(_1500) + 1;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    int _1512 = _1508 & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    if (_1167)
    {
        float _1516 = fma(_1348, _1398, _1488);
        _1352 = _1516;
    }
    float _1518 = _1352;
    float _1520 = _1113 * _1278;
    if (!_1320)
    {
        int _1522 = 12 & _1460;
        _1464 = _1522;
    }
    int _1524 = _1464;
    float _1526 = _1113 * _1382;
    float _1528 = fma(_1518, _1518, _1492);
    float _1530 = fma(_955, _1334, _1462);
    float _1532 = fma(_959, _1270, _1520);
    float _1534 = fma(_959, _1374, _1526);
    float _1536 = _1528 + _1496;
    float _1538 = _1113 * _1308;
    float _1540 = _1530 + _1342;
    float _1542 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1546 = fma(_959, _1300, _1538);
    float _1548 = rsqrt(_1536);
    float _1550 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1552 = fma(_955, _1412, _1546);
    if (!_1320)
    {
        int _1554 = _1482 << 4;
        int _1556 = _1554 + _1524;
        _1484 = _1556;
    }
    int _1558 = _1484;
    float _1560 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1544);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1107, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = _1552 + _1420;
    float _1570 = 1.0 / _1540;
    float _1572 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    float _1574 = -_1566;
    float _1576 = _1574 + 1.0;
    float _1578 = fma(_955, _1448, _1534);
    float _1580 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1560);
    float2 _4936 = float2(_1147, _1402);
    float _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4936, float2(0.0), isnan(_4936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4936, float2(0.0), isnan(_4936)), level(0.0)).x;
    float _1584 = _1578 + _1456;
    float _1586 = _1548 * _1474;
    float _1588 = _1548 * _1518;
    float _1590 = _1548 * _1478;
    float _1592 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1594 = abs(_1576);
    float _1596 = log2(_1594);
    float _1598 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1604 = _1568 * _1570;
    float _1606 = -_1598;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1584 * _1570;
    float _1612 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1614 = -_1602;
    float _1616 = fma(_1614, _1600, 1.0);
    float _1618 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1620 = -_1590;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    bool _1624 = _1604 >= 0.0;
    float _1626 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1628 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1618);
    float _1630 = fma(_1622, -0.5, 0.5);
    bool _1632 = _1604 <= 1.0;
    bool _1634 = _1632 && _1624;
    float _1636 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1638 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1640 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1612);
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1644 = _1610 >= 0.0;
    bool _1646 = _1644 && _1634;
    float _1648 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = exp2(_1636);
    float _1652 = fma(_1622, 0.5, 0.5);
    float _1654 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1640);
    float _1656 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1642);
    float _1658 = fma(_955, _1506, _1532);
    bool _1660 = _1610 <= 1.0;
    bool _1662 = _1660 && _1646;
    float _1664 = _1506;
    float _1666 = _1514;
    if (!_1320)
    {
        int _1668 = _1558 + 400;
        uint _1670 = uint(int(uint(_1668) >> uint(2)));
        uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
        int _1674 = int(_1670) & 3;
        float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
        _1664 = _1676;
    }
    float _1678 = _1664;
    float _1680 = _1588 + 1.0;
    float _1682 = sqrt(_1630);
    float _1684 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1686 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1656);
    float _1688 = _1658 + _1514;
    float _1690 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1320)
    {
        float _1692 = -_1432;
        float _1694 = _1179 + _1692;
        _1195 = _1694;
    }
    float _1696 = _1195;
    float _1698 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1700 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1686);
    float _1702 = _1608;
    if (!_1320)
    {
        float _1704 = floor(_1141);
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = -_1588;
    float _1710 = fma(_1650, _1680, _1708);
    float _1712 = fma(_1652, _1698, -0.212114393711090087890625);
    float _1714 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    if (_1662)
    {
        float _1716 = float(_1205);
        _1221 = _1716;
    }
    float _1718 = _1221;
    float _1720 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1722 = fma(_1652, _1712, 1.570728778839111328125);
    float _1724 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = log2(_1616);
    float _1728 = _1682 * 0.636619746685028076171875;
    float _1730 = _1688 * _1570;
    float _1732 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1734 = fma(_1710, 0.5, 0.5);
    float _1736 = -_1722;
    float _1738 = fma(_1728, _1736, 1.0);
    float _1740 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1720);
    float _1742 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1732);
    float _1744 = 1.0 / _1700;
    if (!_1320)
    {
        float _1746 = -_1706;
        float _1748 = _1141 + _1746;
        _1666 = _1748;
    }
    float _1750 = _1666;
    float _1752 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1754 = _1724;
    if (_1662)
    {
        float _1756 = rint(_1718);
        float _1758 = precise::max(_1756, 0.0);
        uint _1760 = uint(_1758);
        uint _1762 = clamp(_1760, 0u, 65535u);
        _1754 = as_type<float>(_1762);
    }
    float _1764 = _1754;
    float _1766 = _1726 * 0.693147182464599609375;
    float _1768 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1770 = _1742 * _1744;
    float _1772 = _1752 * _1744;
    float _1774 = fma(_1770, 0.5, 0.5);
    float _1776 = fma(_1772, -0.5, 0.5);
    float _1778 = _1678;
    if (!_1320)
    {
        float _1780 = rint(_1678);
        float _1782 = precise::max(_1780, 0.0);
        uint _1784 = uint(_1782);
        uint _1786 = clamp(_1784, 0u, 65535u);
        _1778 = as_type<float>(_1786);
    }
    float _1788 = _1778;
    float _1790 = _1764;
    if (_1662)
    {
        float3 _5295 = float3(_1604, _1610, float(as_type<int>(_1764)));
        float3 _5299 = select(_5295, float3(0.0), isnan(_5295));
        float _1792 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5299.xy, uint(rint(_5299.z)), _1730, level(0.0));
        _1790 = _1792;
    }
    float _1794 = _1790;
    float3 _5309 = float3(_1774, _1776, _1768);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5309, float3(0.0), isnan(_5309)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5309, float3(0.0), isnan(_5309)), level(0.0)).x;
    float3 _5318 = float3(_1774, _1776, _1768);
    float4 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5318, float3(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5318, float3(0.0), isnan(_5318)), level(0.0)).xyzw;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1799.w;
    float2 _5334 = float2(_1738, _1734);
    float3 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5334, float2(0.0), isnan(_5334)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5334, float2(0.0), isnan(_5334)), level(0.0)).xyz;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = _1696;
    if (!_1320)
    {
        float3 _5355 = float3(_1750, _1696, float(as_type<int>(_1788)));
        float3 _5357 = select(_5355, float3(0.0), isnan(_5355));
        float _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5357.xy, uint(rint(_5357.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5357.xy, uint(rint(_5357.z)), level(0.0)).x;
        _1819 = _1821;
    }
    float _1823 = _1819;
    float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1827 = -_639;
    float _1829 = _1827 + 0.5;
    bool _1831 = _505 > 0.5;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1837 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1839 = isnan(_497);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1845 = _1841 || _1843;
    float _1847 = float(_1845);
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1855 = _497 + _1853;
    float _1857 = 1.0 / _1835;
    bool _1859 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1861 = isnan(_497);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    float _1871 = -_1847;
    float _1873 = _1871 + 1.0;
    bool _1875 = _499 > 0.5;
    float _1877 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1879 = -_569;
    int _1881 = _1831 ? as_type<int>(_1879) : as_type<int>(_569);
    float _1883 = _1869 * _1873;
    float _1885 = -_1869;
    float _1887 = _1885 + 1.0;
    float _1889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1893 = _1891 != 0;
    float _1895 = _1626 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1897 = -_605;
    int _1899 = _1875 ? as_type<int>(_1897) : as_type<int>(_605);
    out.m_78.x = _1077;
    out.m_78.y = _1071;
    out.m_78.z = _1081;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1903 = _1901 != 0;
    float _1905 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1895);
    bool _1907 = !_1893;
    float _1909 = _1907 ? _605 : as_type<float>(_1899);
    float _1911 = _1851 * _1857;
    float _1913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1917 = _1915 != 0;
    float _1919 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1905);
    float _1921 = fma(_1911, _1855, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1923 = _1909 + 0.5;
    bool _1925 = !_1917;
    float _1927 = _1925 ? _569 : as_type<float>(_1881);
    float _1929 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1931 = _1921 * _1883;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1937 = isnan(0.5);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1943 = _1939 || _1941;
    float _1945 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1931);
    float _1947 = -_569;
    int _1949 = _1089 ? as_type<int>(_1947) : as_type<int>(_569);
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1953 = _1951 != 0;
    float _1955 = _629 + 0.5;
    float _1957 = abs(_1153);
    float _1959 = log2(_1957);
    float _1961 = fma(_1847, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1945);
    float _1963 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1965 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1967 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1969 = !_1903;
    float _1971 = _1969 ? _569 : as_type<float>(_1949);
    float _1973 = _1963 * _1889;
    float _1975 = _1965 * _1913;
    float _1977 = -_605;
    int _1979 = _607 ? as_type<int>(_1977) : as_type<int>(_605);
    float _1981 = fma(_1877, _1877, 1.0);
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1985 = _1967 * _1825;
    float _1987 = -_1971;
    float _1989 = _1987 + 0.5;
    float _1991 = -_1927;
    float _1993 = _1991 + 0.5;
    bool _1995 = !_1953;
    float _1997 = _1995 ? _605 : as_type<float>(_1979);
    out.m_80.x = _1975;
    out.m_80.y = _1973;
    float _1999 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2001 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2005 = _1997 + 0.5;
    float _2007 = _1993 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2009 = _2001 * _1933;
    float _2011 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2013 = _1857;
    float _2015 = _2005;
    float _2017 = _2007;
    if (!_1943)
    {
        _2013 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2019 = _2013;
    float _2021 = _1961 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2023 = exp2(_1999);
    float _2025 = _2011 * _1983;
    float _2027 = _2019;
    if (!_1943)
    {
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2031 = _2019 + _2029;
        _2015 = _2031;
    }
    float _2033 = _2015;
    out.m_82.w = _2021;
    float _2035 = rsqrt(_1981);
    float _2037 = _2007 * _2003;
    if (!_1943)
    {
        float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2041 = _1153 + _2039;
        _2017 = _2041;
    }
    float _2043 = _2017;
    bool _2045 = _1153 <= 8000.0;
    bool _2047 = isnan(_1153);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(8000.0);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    out.m_84.x = _1985;
    out.m_84.y = _2009;
    out.m_84.z = _2025;
    out.m_84.w = _2037;
    float _2057 = fma(_2023, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = _605 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2063 = -_1877;
    float _2065 = _901 * _2063;
    float _2067 = _2023;
    if (!_1943)
    {
        float _2069 = 1.0 / _2033;
        _2027 = _2069;
    }
    float _2071 = _2027;
    if (_1943)
    {
        _2067 = 1.0;
    }
    float _2073 = _2067;
    float _2075 = _1877 * _2035;
    float _2077 = fma(_911, _2061, _2065);
    float _2079 = _907 * _1877;
    float _2081 = -_2075;
    float _2083 = _927 * _2081;
    float _2085 = -_2075;
    float _2087 = _913 * _2085;
    float _2089 = -_2075;
    float _2091 = _939 * _2089;
    float _2093 = _913 + _2077;
    float _2095 = fma(_919, _2061, _2079);
    float _2097 = _909 * _1877;
    float _2099 = fma(_907, _2035, _2083);
    float _2101 = _919 * _439;
    float _2103 = -_901;
    float _2105 = fma(_2103, _2035, _2087);
    float _2107 = fma(_909, _2035, _2091);
    float _2109 = _919 * _443;
    float _2111 = _927 + _2095;
    float _2113 = _919 * _447;
    float _2115 = fma(_931, _2061, _2097);
    float _2117 = fma(_911, _371, _2101);
    float _2119 = _2099 * _443;
    float _2121 = _2099 * _439;
    float _2123 = _2099 * _447;
    float _2125 = fma(_911, _381, _2109);
    float _2127 = fma(_911, _385, _2113);
    float _2129 = fma(_2105, _381, _2119);
    float _2131 = fma(_2105, _371, _2121);
    float _2133 = fma(_2105, _385, _2123);
    float _2135 = fma(_931, _455, _2125);
    float _2137 = fma(_931, _451, _2117);
    float _2139 = fma(_931, _461, _2127);
    float _2141 = fma(_2107, _455, _2129);
    float _2143 = fma(_2107, _461, _2133);
    float _2145 = fma(_2059, -2.0, 3.0);
    float _2147 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2149 = _2059 * _2059;
    float _2151 = fma(_2107, _451, _2131);
    out.m_86.x = _2137;
    out.m_86.y = _2135;
    out.m_86.z = _2139;
    float _2153 = _2149 * _2145;
    float _2155 = exp2(_2147);
    float _2157 = _2111 * _439;
    out.m_88.x = _2151;
    out.m_88.y = _2141;
    out.m_88.z = _2143;
    float _2159 = -_2153;
    float _2161 = _2159 + 1.0;
    float _2163 = _2111 * _443;
    float _2165 = _2111 * _447;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1929;
    out.gl_Position.w = _1700;
    float _2167 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2153);
    float _2169 = _939 + _2115;
    float _2171 = _1929 + _1700;
    float _2173 = fma(_2093, _371, _2157);
    float _2175 = fma(_2093, _381, _2163);
    float _2177 = fma(_2093, _385, _2165);
    float _2179 = _2055 * _2167;
    float _2181 = _2171 * 0.5;
    float _2183 = fma(_2169, _455, _2175);
    float _2185 = fma(_2169, _461, _2177);
    float _2187 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2189 = -_2155;
    float _2191 = _2189 + 1.0;
    out.m_90.z = _2181;
    out.m_90.w = _1700;
    float _2193 = _2073;
    float _2195 = _2187;
    float _2197 = _2177;
    float _2199 = _2173;
    if (!_1662)
    {
        _457 = 1.0;
    }
    float _2201 = _457;
    float _2203 = _2201;
    if (!_1943)
    {
        float _2205 = _2043 * _2071;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        _2193 = _2207;
    }
    float _2209 = _2193;
    float _2211 = fma(_2169, _451, _2173);
    float _2213 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2215 = -_1582;
    float _2217 = _2215 + 1.0;
    float _2219 = _2217 * _2187;
    float _2221 = precise::clamp(_2219, 0.0, 1.0);
    float _2223 = _2221;
    if (_1320)
    {
        _2195 = 1.0;
    }
    float _2225 = _2195;
    float _2227 = _2225;
    if (_1662)
    {
        bool _2229 = _1794 >= _1730;
        bool _2231 = isnan(_1794);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan(_1730);
        bool _2237 = _2233 || _2235;
        float _2239 = float(_2237);
        _2203 = _2239;
    }
    float _2241 = _2203;
    float _2243 = _2241;
    if (!_1320)
    {
        int _2245 = _1390 << 4;
        int _2247 = _2245 + 2048;
        uint _2249 = uint(int(uint(_2247) >> uint(2)));
        uint _2251 = uint(int(uint(int(_2249)) >> uint(2)));
        int _2253 = int(_2249) & 3;
        float _2255 = (*spvDescriptorSet0.vp_c15)._m0[int(_2251)][_2253];
        int _2257 = int(_2249) + 1;
        uint _2259 = uint(int(uint(_2257) >> uint(2)));
        int _2261 = _2257 & 3;
        float _2263 = (*spvDescriptorSet0.vp_c15)._m0[int(_2259)][_2261];
        int _2265 = _2247 + 8;
        uint _2267 = uint(int(uint(_2265) >> uint(2)));
        uint _2269 = uint(int(uint(int(_2267)) >> uint(2)));
        int _2271 = int(_2267) & 3;
        float _2273 = (*spvDescriptorSet0.vp_c15)._m0[int(_2269)][_2271];
        int _2275 = int(_2267) + 1;
        uint _2277 = uint(int(uint(_2275) >> uint(2)));
        int _2279 = _2275 & 3;
        float _2281 = (*spvDescriptorSet0.vp_c15)._m0[int(_2277)][_2279];
        float _2283 = _1113 * _2263;
        float _2285 = fma(_959, _2255, _2283);
        float _2287 = fma(_955, _2273, _2285);
        float _2289 = _2287 + _2281;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        float _2293 = -_2291;
        float _2295 = _2293 + _1823;
        float _2297 = fma(_2295, 500.0, 1.5);
        float _2299 = exp2(_2297);
        float _2301 = 0.0 + _2299;
        float _2303 = precise::clamp(_2301, 0.0, 1.0);
        _2227 = _2303;
        _2197 = _2299;
        _2199 = _2255;
    }
    float _2305 = _2227;
    float _2307 = _2197;
    float _2309 = _2199;
    float _2311 = _2241 * _2305;
    float _2313 = _2213 * _1796;
    float _2315 = -_2221;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.x = _2211;
    out.m_92.y = _2183;
    out.m_92.z = _2185;
    bool _2319 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2321 = isnan(_1107);
    bool _2323 = _2319 || _2321;
    bool _2325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2327 = _2323 || _2325;
    float _2329 = _1807 * _2313;
    float _2331 = -_2311;
    float _2333 = fma(_2331, _2317, 1.0);
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = _1817 * _2313;
    float _2339 = -_2213;
    float _2341 = _2339 + 1.0;
    float _2343 = fma(_1813, _2329, _1801);
    float _2345 = fma(_1815, _2329, _1803);
    float _2347 = fma(_1807, _2337, _1805);
    float _2349 = _1807 * _2341;
    out.m_94.x = _1065;
    out.m_94.y = _1063;
    out.m_94.z = _1067;
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2353 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _2343;
    out.m_96.y = _2345;
    out.m_96.z = _2347;
    out.m_96.w = _2349;
    float _2355 = _2309;
    float _2357 = _2307;
    float _2359 = _2341;
    float _2361 = _2351;
    if (!_2327)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2363 = _2355;
    float _2365 = _2363;
    float _2367 = _2363;
    if (!_2327)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2369 = _2357;
    out.m_98.x = _2351;
    float _2371 = _2369;
    float _2373 = _2369;
    if (!_2327)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2375 = _2223;
    float _2377 = _2375;
    float _2379 = _2375;
    if (!_2327)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2381 = _2243;
    float _2383 = _2381;
    float _2385 = _2381;
    if (!_2327)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2387 = _2359;
    float _2389 = _2387;
    float _2391 = _2387;
    if (!_2327)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2393 = _2361;
    bool _2395 = !_2327;
    float _2397 = _2393;
    float _2399 = _2393;
    if (!_2395)
    {
        bool _2401 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2403 = isnan(_1107);
        bool _2405 = _2401 || _2403;
        bool _2407 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2409 = _2405 || _2407;
        if (!_2409)
        {
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2413 = _1107 + _2411;
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2417 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2415;
            float _2419 = 1.0 / _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2441 = _2413 * _2419;
            float _2443 = precise::clamp(_2441, 0.0, 1.0);
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2449 = fma(_2443, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2451 = fma(_2443, _2447, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2453 = fma(_2443, _2427, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2455 = fma(_2443, _2431, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2457 = fma(_2443, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2459 = fma(_2443, _2439, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2373 = _2451;
            _2391 = _2457;
            _2367 = _2449;
            _2385 = _2455;
            _2379 = _2453;
            _2399 = _2459;
            _2461 = true;
        }
        else
        {
            bool _2463 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2465 = isnan(_1107);
            bool _2467 = _2463 || _2465;
            bool _2469 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2471 = _2467 || _2469;
            if (!_2471)
            {
                _2365 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2473 = _2365;
            _2367 = _2473;
            if (!_2471)
            {
                _2371 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2475 = _2371;
            _2373 = _2475;
            if (!_2471)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2477 = _2377;
            _2379 = _2477;
            if (!_2471)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2479 = _2383;
            _2385 = _2479;
            if (!_2471)
            {
                _2389 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2481 = _2389;
            _2391 = _2481;
            if (!_2471)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2483 = _2397;
            bool _2485 = !_2471;
            _2399 = _2483;
            if (!_2485)
            {
                bool _2487 = _1107 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2489 = isnan(_1107);
                bool _2491 = _2487 || _2489;
                bool _2493 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2495 = _2491 || _2493;
                if (!_2495)
                {
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2499 = _1107 + _2497;
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2503 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2501;
                    float _2505 = 1.0 / _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2527 = _2499 * _2505;
                    float _2529 = precise::clamp(_2527, 0.0, 1.0);
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2535 = fma(_2529, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2537 = fma(_2529, _2533, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2539 = fma(_2529, _2513, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2541 = fma(_2529, _2517, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2543 = fma(_2529, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2545 = fma(_2529, _2525, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2373 = _2537;
                    _2391 = _2543;
                    _2367 = _2535;
                    _2385 = _2541;
                    _2379 = _2539;
                    _2399 = _2545;
                    _2461 = true;
                }
                else
                {
                    _2373 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2391 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2367 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2461 = false;
    float _2547 = _2373;
    float _2549 = _2391;
    float _2551 = _2367;
    float _2553 = _2385;
    float _2555 = _2379;
    float _2557 = _2399;
    float _2559 = _2353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2561 = fma(_2183, -0.5, 0.5);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = -_2547;
    float _2567 = _2565 + _2549;
    float _2569 = -_2551;
    float _2571 = _2569 + _2553;
    out.m_59.x = _2559;
    float _2573 = -_2555;
    float _2575 = _2573 + _2557;
    float _2577 = fma(_2563, _2567, _2547);
    float _2579 = fma(_2563, _2571, _2551);
    bool _2581 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2583 = _2577 * 0.586610972881317138671875;
    float _2585 = fma(_2563, _2575, _2555);
    out.m_100.x = 0.0;
    bool _2587 = _2209 > 0.0;
    bool _2589 = isnan(_2209);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = fma(_2579, 0.298911988735198974609375, _2583);
    float _2599 = fma(_2585, 0.114477999508380889892578125, _2597);
    float _2601 = -_2599;
    float _2603 = _2579 + _2601;
    float _2605 = -_2599;
    float _2607 = _2577 + _2605;
    float _2609 = -_2599;
    float _2611 = _2585 + _2609;
    float _2613 = fma(_2603, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    float _2615 = fma(_2607, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    float _2617 = fma(_2611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2599);
    bool _2619 = !_2581;
    if (!_2619)
    {
        float _2621 = -_1063;
        float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2625 = -_1065;
        float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2629 = -_1067;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2633 = _2623 * _2623;
        float _2635 = fma(_2627, _2627, _2633);
        float _2637 = fma(_2631, _2631, _2635);
        float _2639 = sqrt(_2637);
        float _2641 = rsqrt(_2637);
        float _2643 = -_2639;
        float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2647 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = _2627 * _2641;
        float _2653 = _2623 * _2641;
        float _2655 = abs(_2649);
        float _2657 = log2(_2655);
        float _2659 = _2631 * _2641;
        float _2661 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2663 = _2183 * _2653;
        float _2665 = -_2653;
        float _2667 = -_2661;
        float _2669 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2667);
        float _2671 = fma(_2211, _2651, _2663);
        float _2673 = -_2659;
        float _2675 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2669);
        float _2677 = fma(_2185, _2659, _2671);
        float _2679 = precise::clamp(_2677, 0.0, 1.0);
        float _2681 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2683 = _2675 + _2681;
        float _2685 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        float _2691 = exp2(_2685);
        float _2693 = _2691 * _2689;
        float _2695 = _2679 * _2693;
        float _2697 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2701 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2697;
        out.m_100.y = _2699;
        out.m_100.z = _2701;
    }
    out.m_102.x = _2613;
    out.m_102.y = _2615;
    out.m_102.z = _2617;
    if (_2595)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2703 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2703;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

