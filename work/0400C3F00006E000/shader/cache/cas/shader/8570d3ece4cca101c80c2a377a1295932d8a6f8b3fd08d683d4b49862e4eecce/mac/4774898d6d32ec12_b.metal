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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2489 = false;
    bool _407 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2774 = as_type<float>(_125);
        out.gl_Position.z = _2774;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_163);
        out.gl_Position.z = _2843;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    int _191 = as_type<int>(_165) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_165) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _201 = !_193;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _169 * _175;
    float _211 = _169 * _181;
    float _213 = fma(_167, _173, _209);
    float _215 = _169 * _187;
    float _217 = fma(_167, _179, _211);
    float _219 = fma(_171, _177, _213);
    float _221 = fma(_167, _185, _215);
    float _223 = fma(_171, _183, _217);
    float _225 = fma(_171, _189, _221);
    bool _227 = !_199;
    float _229 = _179;
    float _231 = _183;
    float _233 = _225;
    float _235 = _223;
    float _253;
    if (!_227)
    {
        float _237 = in.m_64.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_109);
        float _259 = 1.0 / _257;
        float _261 = _143 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _287;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _299 * _303;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _323 = 1.0 / _283;
    float _325 = -_299;
    float _327 = _325 + 1.0;
    float _329 = _317 * _327;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = _267 * _323;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _263 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _305;
    float _355 = fma(_347, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = fma(_337, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = _355 * _329;
    float _367 = _357 * _329;
    float _369 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _375 = fma(_369, _319, _371);
    float _377 = fma(_363, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_321;
    float _403;
    float _405;
    if (!_383)
    {
        float _385 = in.m_64.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _389 = float(_109);
        float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _395 = _393 * _387;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _389;
        _405 = _401;
        _407 = true;
    }
    else
    {
        float _409 = float(_109);
        float _411 = 1.0 / _409;
        float _413 = _143 * _411;
        _403 = _409;
        _405 = _413;
    }
    _407 = false;
    float _415 = _403;
    float _417 = _405;
    float _419 = in.m_64.z;
    float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _423 = log2(_421);
    float _425 = in.m_64.x;
    float _427 = in.m_64.y;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _439 = _437 != 0;
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _443 = int(_441);
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _447 = !_431;
    int _449 = _447 ? 0 : 1;
    float _451 = _423 * _143;
    bool _453 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _461 = _457 || _459;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _465 = exp2(_451);
    float _467 = _419 * 2.0;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = _427 + _425;
    float _473 = _427 * 2.0;
    float _475 = _425 * 2.0;
    float _477 = floor(_467);
    float _479 = _471 + (-1.0);
    float _481 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _483 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _485 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _487 = _427 + _419;
    float _489 = -_445;
    float _491 = fma(_481, 2.0, _489);
    float _493 = floor(_473);
    float _495 = _487 + (-1.0);
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _483);
    float _503 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _505 = !_435;
    int _507 = _505 ? 0 : 1;
    float _509 = floor(_475);
    bool _511 = _477 > 0.0;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _515 = _477 >= 0.0;
    bool _517 = isnan(_477);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = -_143;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _491);
    float _529 = _461 ? _499 : 0.0;
    float _531 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[78].w, _513);
    int _533 = _523 ? 0 : 1;
    bool _535 = _493 > 0.0;
    float _537 = _427 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _539 = _493 >= 0.0;
    bool _541 = isnan(_493);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _531);
    int _551 = ~_533;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    float _557 = fma(_537, -2.0, _463);
    int _559 = _555;
    if (!_511)
    {
        int _561 = ~_533;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    bool _567 = _509 > 0.0;
    float _569 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _557);
    bool _571 = _509 >= 0.0;
    bool _573 = isnan(_509);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = float(_443);
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _585 = int(_583);
    bool _587 = !_439;
    int _589 = _587 ? 0 : 1;
    int _591 = _579 ? 0 : 1;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _595 = _593 != 0;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _603 = _601 != 0;
    bool _605 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(1.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    float _619 = 1.0 / _581;
    bool _621 = !_595;
    int _623 = _621 ? 0 : 1;
    float _625 = float(_565);
    int _627 = abs(_623);
    float _629 = float(_585);
    float _631 = 1.0 / _617;
    float _633 = in.m_66.x;
    float _635 = in.m_66.y;
    float _637 = in.m_66.z;
    float _639 = float(_627);
    bool _641 = !_599;
    int _643 = _641 ? 0 : 1;
    float _645 = _629 * _143;
    int _647 = ~_591;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = _639 * _625;
    float _655 = _619 * _143;
    int _657 = _651;
    if (!_567)
    {
        int _659 = ~_591;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _425 + (-0.5);
    int _667 = _547 ? 0 : 1;
    float _669 = float(_663);
    if (_613)
    {
        float _671 = _529 * _631;
        _147 = _671;
    }
    float _673 = _147;
    int _675 = abs(_643);
    float _677 = _653 * (-2.0);
    float _679 = float(_675);
    float _681 = fma(_677, _633, _633);
    float _683 = _679 * _669;
    bool _685 = !_603;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_485, _677, _485);
    int _691 = ~_667;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    float _697 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[196].x, _681);
    float _699 = _683 * (-2.0);
    int _701 = _695;
    if (!_535)
    {
        int _703 = ~_667;
        int _705 = _703 + 1;
        _701 = _705;
    }
    int _707 = _701;
    int _709 = abs(_687);
    float _711 = fma(_689, _673, _697);
    float _713 = fma(_699, _635, _635);
    float _715 = _427 + (-0.5);
    float _717 = float(_707);
    float _719 = fma(_503, _699, _503);
    float _721 = float(_709);
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _725 = _419 + _425;
    float _727 = _711 * 0.15915493667125701904296875;
    float _729 = _419 + (-0.5);
    float _731 = _721 * _717;
    float _733 = _725 + (-1.0);
    float _735 = fma(_719, _673, _723);
    float _737 = _727 * 6.283185482025146484375;
    float _739 = cos(_737);
    float _741 = _731 * (-2.0);
    float _743 = in.m_68.x;
    float _745 = in.m_68.y;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _749 = _735 * 0.15915493667125701904296875;
    float _751 = fma(_741, _637, _637);
    float _753 = fma(_747, _741, _747);
    float _755 = in.m_46.x;
    float _757 = in.m_46.y;
    float _759 = in.m_46.z;
    float _761 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _751);
    float _763 = _749 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_753, _673, _761);
    float _769 = _767 * 0.15915493667125701904296875;
    float _771 = _749 * 6.283185482025146484375;
    float _773 = cos(_771);
    float _775 = _727 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = _381 * _745;
    float _781 = _379 * _743;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _787 = _779 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = _187 * _757;
    float _793 = _769 * 6.283185482025146484375;
    float _795 = cos(_793);
    float _797 = _787 * _783;
    float _799 = _789 * _785;
    float _801 = _739 * _773;
    float _803 = _739 * _765;
    float _805 = in.m_62.w;
    float _807 = fma(_185, _755, _791);
    float _809 = _175 * _757;
    float _811 = _769 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _777 * _765;
    float _817 = _777 * _773;
    float _819 = in.m_58.w;
    float _821 = fma(_173, _755, _809);
    float _823 = fma(_189, _759, _807);
    float _825 = _181 * _757;
    float _827 = _739 * _795;
    float _829 = _777 * _795;
    float _831 = _773 * _795;
    float _833 = _765 * _795;
    float _835 = _827 * _797;
    float _837 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = fma(_177, _759, _821);
    float _841 = fma(_179, _755, _825);
    float _843 = fma(_813, _801, _815);
    float _845 = -_797;
    float _847 = _813 * _845;
    float _849 = -_817;
    float _851 = fma(_813, _803, _849);
    float _853 = -_803;
    float _855 = fma(_813, _817, _853);
    float _857 = fma(_843, _799, _835);
    float _859 = _829 * _797;
    float _861 = fma(_831, _799, _847);
    float _863 = fma(_813, _815, _801);
    float _865 = fma(_851, _837, _857);
    float _867 = fma(_855, _799, _859);
    float _869 = fma(_833, _837, _861);
    float _871 = _823 + _805;
    float _873 = _865 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _875 = fma(_863, _837, _867);
    float _877 = _865 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _879 = _839 + _819;
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].x, _873);
    float _883 = _865 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].x, _877);
    float _887 = fma(_183, _759, _841);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _881);
    float _891 = in.m_60.w;
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _885);
    float _895 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].x, _883);
    float _897 = _889 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _899 = _893 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _895);
    float _903 = _871 + _897;
    float _905 = _879 + _899;
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _911 = _903 + _909;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _915 = _905 + _913;
    float _917 = _911 * _911;
    float _919 = fma(_915, _915, _917);
    float _921 = sqrt(_919);
    float _923 = _887 + _891;
    float _925 = _923 + _907;
    bool _927 = _921 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = _887;
    float _931 = _925;
    if (!_927)
    {
        _229 = _905;
    }
    float _933 = _229;
    float _935 = _933;
    if (!_927)
    {
        _929 = _903;
    }
    float _937 = _929;
    float _939 = _937;
    if (!_927)
    {
        _231 = _925;
    }
    float _941 = _231;
    bool _943 = !_927;
    float _945 = _941;
    if (!_943)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _951 = _921 + _949;
        float _953 = rsqrt(_919);
        float _955 = _951 * _947;
        float _957 = _925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _959 = _955 * 0.15915493667125701904296875;
        float _961 = _959 * 6.283185482025146484375;
        float _963 = cos(_961);
        float _965 = _959 * 6.283185482025146484375;
        float _967 = sin(_965);
        float _969 = _963 + (-1.0);
        float _971 = fma(_967, _957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _973 = _969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _975 = _953 * _971;
        float _977 = fma(_925, _963, _973);
        float _979 = fma(_915, _975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _981 = fma(_911, _975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _945 = _977;
        _935 = _979;
        _939 = _981;
    }
    float _983 = _945;
    float _985 = _935;
    float _987 = _939;
    float _989 = -_923;
    float _991 = _989 + _983;
    float _993 = -_879;
    float _995 = _993 + _985;
    float _997 = -_871;
    float _999 = _997 + _987;
    float _1001 = _991 * _991;
    bool _1003 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1005 = isnan(0.5);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_995, _995, _1001);
    float _1015 = fma(_999, _999, _1013);
    float _1017 = sqrt(_1015);
    bool _1019 = _1017 > 0.0;
    bool _1021 = !_1019;
    float _1023 = _985;
    float _1025 = _983;
    float _1027 = _987;
    float _1029 = _991;
    float _1031 = _999;
    if (!_1021)
    {
        float _1033 = _223 * _223;
        float _1035 = fma(_219, _219, _1033);
        float _1037 = rsqrt(_1015);
        float _1039 = fma(_225, _225, _1035);
        float _1041 = sqrt(_1039);
        float _1043 = _995 * _1037;
        float _1045 = _991 * _1037;
        float _1047 = _999 * _1037;
        bool _1049 = _1041 > 0.0;
        bool _1051 = !_1049;
        _931 = _1047;
        if (!_1051)
        {
            float _1053 = rsqrt(_1039);
            float _1055 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1057 = _223 * _1053;
            float _1059 = _219 * _1053;
            float _1061 = _225 * _1053;
            float _1063 = _1045 * _1057;
            float _1065 = fma(_1043, _1059, _1063);
            float _1067 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1069 = fma(_1047, _1061, _1065);
            float _1071 = _1069 * _1067;
            float _1073 = fma(_219, _1071, _985);
            float _1075 = fma(_223, _1071, _983);
            float _1077 = fma(_225, _1071, _987);
            _1023 = _1073;
            _1025 = _1075;
            _1027 = _1077;
            _1029 = _1067;
        }
    }
    float _1079 = _1023;
    float _1081 = _1025;
    float _1083 = _1027;
    float _1085 = _931;
    float _1087 = _1029;
    float _1089 = _1085;
    float _1091 = _1083;
    float _1093 = _1087;
    if (_1011)
    {
        _233 = _1079;
    }
    float _1095 = _233;
    float _1097 = _1095;
    if (_1011)
    {
        _1031 = _1081;
    }
    float _1099 = _1031;
    float _1101 = _1099;
    if (_1011)
    {
        _1089 = _1083;
    }
    float _1103 = _1089;
    float _1105 = _1103;
    if (!_1011)
    {
        float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1109 = _923 + _1107;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1113 = _879 + _1111;
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1117 = -_879;
        float _1119 = _1117 + _1079;
        float _1121 = _1109 * _1109;
        float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1125 = _871 + _1123;
        float _1127 = -_923;
        float _1129 = _1127 + _1081;
        float _1131 = -_871;
        float _1133 = _1131 + _1083;
        float _1135 = fma(_1113, _1113, _1121);
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1139 = fma(_1125, _1125, _1135);
        float _1141 = sqrt(_1139);
        float _1143 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1147 = _1145 * _1137;
        float _1149 = _1143 * _1147;
        float _1151 = fma(_1119, _1149, _879);
        float _1153 = fma(_1129, _1149, _923);
        float _1155 = fma(_1133, _1149, _871);
        _1101 = _1153;
        _1097 = _1151;
        _1105 = _1155;
        _1091 = _1133;
    }
    float _1157 = _1101;
    float _1159 = _1097;
    float _1161 = _1105;
    float _1163 = _1091;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1167 = _1157 + _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1175 = _1161 + _1173;
    float _1177 = _1167 * _1167;
    float _1179 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1181 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1183 = fma(_1171, _1171, _1177);
    float _1185 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1179);
    float _1187 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1181);
    float _1189 = fma(_1175, _1175, _1183);
    float _1191 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1185);
    float _1193 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1187);
    float _1195 = rsqrt(_1189);
    float _1197 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1199 = sqrt(_1189);
    float _1201 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1203 = _1171 * _1201;
    float _1205 = _1175 * _1201;
    float _1207 = _1203 * _1203;
    float _1209 = _1205 * _1205;
    float _1211 = _1207 + _1209;
    float _1213 = sqrt(_1211);
    bool _1215 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = _1213 + _1217;
    float _1221 = _1081;
    float _1223 = _1211;
    float _1225 = _1219;
    float _1227 = _1167;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1231 = _1203;
    float _1233 = _1205;
    float _1235 = _1207;
    float _1237 = _1209;
    if (_1215)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1221 = _1239;
    }
    float _1241 = _1221;
    if (_1215)
    {
        float _1243 = rsqrt(_1211);
        _1223 = _1243;
    }
    float _1245 = _1223;
    if (_1215)
    {
        float _1247 = _1219 * _1241;
        _1225 = _1247;
    }
    float _1249 = _1225;
    if (_1215)
    {
        float _1251 = _1249 * 0.15915493667125701904296875;
        _235 = _1251;
    }
    float _1253 = _235;
    float _1255 = _1163;
    float _1257 = _1253;
    if (_1215)
    {
        float _1259 = _1253 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        _1255 = _1261;
    }
    float _1263 = _1255;
    float _1265 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1267 = precise::max(0.0, _1265);
    float _1269 = _1241;
    if (_1215)
    {
        float _1271 = _1253 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = -_1201;
    float _1279 = -_1267;
    float _1281 = fma(_1167, _1277, _1279);
    float _1283 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1215)
    {
        float _1285 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1285;
    }
    float _1287 = _1227;
    float _1289 = _1263;
    if (_1215)
    {
        float _1291 = fma(_1263, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1289 = _1291;
    }
    float _1293 = _1289;
    float _1295 = floor(_1283);
    float _1297 = _1293;
    if (_1215)
    {
        float _1299 = _1275 + (-1.0);
        _1229 = _1299;
    }
    float _1301 = _1229;
    if (_1215)
    {
        float _1303 = _1245 * _1293;
        _1093 = _1303;
    }
    float _1305 = _1093;
    if (!_1215)
    {
        _1297 = _1281;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (_1215)
    {
        float _1311 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1257 = _1311;
    }
    float _1313 = _1257;
    if (_1215)
    {
        float _1315 = _1203 * _1305;
        _1231 = _1315;
    }
    float _1317 = _1231;
    if (_1215)
    {
        float _1319 = _1205 * _1305;
        _1233 = _1319;
    }
    float _1321 = _1233;
    float _1323 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1215)
    {
        float _1325 = fma(_1281, _1275, _1313);
        _1309 = _1325;
    }
    float _1327 = _1309;
    if (_1215)
    {
        float _1329 = _1317 * _1317;
        _1235 = _1329;
    }
    float _1331 = _1235;
    if (_1215)
    {
        float _1333 = _1321 * _1321;
        _1237 = _1333;
    }
    float _1335 = _1237;
    float _1337 = fma(_1327, _1327, _1331);
    float _1339 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1341 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1343 = _1337 + _1335;
    float _1345 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1323);
    float _1347 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1349 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1341);
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1353 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1351);
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1345);
    float _1359 = rsqrt(_1343);
    float _1361 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1349);
    float _1363 = -_1355;
    float _1365 = _1363 + 1.0;
    float _1367 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = _1197 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1371 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1373 = -_1295;
    float _1375 = _1283 + _1373;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = abs(_1365);
    float _1381 = log2(_1379);
    float _1383 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1385 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1389 = -_1369;
    float _1391 = fma(_1389, _1347, 1.0);
    float _1393 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1397 = _1359 * _1317;
    float _1399 = _1359 * _1321;
    float _1401 = floor(_1339);
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1405 = _1359 * _1327;
    float _1407 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1383);
    float _1411 = _1405 + 1.0;
    float _1413 = -_1407;
    float _1415 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1413);
    float _1417 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1419 = 1.0 / _1403;
    float _1421 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1423 = -_1399;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1415);
    float _1427 = fma(_1425, -0.5, 0.5);
    float _1429 = -_1401;
    float _1431 = _1339 + _1429;
    float _1433 = exp2(_1417);
    float _1435 = fma(_1425, 0.5, 0.5);
    float _1437 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1385);
    float _1439 = fma(_1435, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1441 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1437);
    float _1443 = log2(_1391);
    float _1445 = fma(_1435, _1439, -0.212114393711090087890625);
    float _1447 = fma(_1435, _1445, 1.570728778839111328125);
    float _1449 = sqrt(_1427);
    float _1451 = -_1405;
    float _1453 = fma(_1433, _1411, _1451);
    float _1455 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1421);
    float _1457 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1441);
    float _1459 = fma(_1453, 0.5, 0.5);
    float _1461 = _1455 * _1419;
    float _1463 = _1457 * _1419;
    float _1465 = _1443 * 0.693147182464599609375;
    float _1467 = fma(_1463, -0.5, 0.5);
    float _1469 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1471 = _1449 * 0.636619746685028076171875;
    float _1473 = fma(_1461, 0.5, 0.5);
    float _1475 = -_1447;
    float _1477 = fma(_1471, _1475, 1.0);
    float2 _4852 = float2(_1375, _1431);
    float _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4852, float2(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4852, float2(0.0), isnan(_4852)), level(0.0)).x;
    float3 _4863 = float3(_1473, _1467, _1469);
    float _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).x;
    float3 _4874 = float3(_1473, _1467, _1469);
    float4 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).xyzw;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    float _1492 = _1484.w;
    float2 _4890 = float2(_1477, _1459);
    float3 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4890, float2(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4890, float2(0.0), isnan(_4890)), level(0.0)).xyz;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = float(uint(_585));
    float _1506 = trunc(_655);
    int _1508 = int(_1506);
    int _1510 = abs(_449);
    float _1512 = -_549;
    float _1514 = _1512 + 1.0;
    bool _1516 = _425 > 0.5;
    float _1518 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1520 = _427 > 0.5;
    float _1522 = 1.0 / _1504;
    float _1524 = float(uint(_1508));
    float _1526 = 1.0 / _415;
    int _1528 = as_type<int>(_1522) + (-2);
    float _1530 = exp2(_1518);
    float _1532 = as_type<float>(_1528) * _1524;
    int _1534 = ~_585;
    int _1536 = _1534 + 1;
    int _1538 = ~_585;
    int _1540 = _1538 + 1;
    float _1542 = trunc(_1532);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    float _1549 = -_1530;
    float _1551 = _1549 + 1.0;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1555 = _1536 * int(_1547);
    int _1557 = _1555 + _1508;
    float _1559 = float(uint(_1557));
    float _1561 = as_type<float>(_1528) * _1559;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1565 = _1563 != 0;
    float _1567 = float(_1508);
    float _1569 = trunc(_1561);
    float _1571 = precise::max(_1569, 0.0);
    uint _1573 = uint(_1571);
    bool _1575 = !_1565;
    float _1577 = _1575 ? 7.345489978790283203125 : 1.0;
    bool _1579 = _1567 >= _629;
    bool _1581 = isnan(_1567);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan(_629);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1577 * _425;
    float _1593 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1597 = trunc(_1589);
    int _1599 = int(_1597);
    float _1601 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1603 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1601);
    int _1605 = int(_1547) + int(_1573);
    float _1607 = floor(_1591);
    float _1609 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1611 = _1540 * _1605;
    int _1613 = _1611 + _1508;
    bool _1615 = uint(_1613) >= uint(_585);
    bool _1617 = !_1615;
    int _1619 = _1617 ? 0 : (-1);
    bool _1621 = _585 == 0;
    float _1623 = -_1607;
    float _1625 = _1591 + _1623;
    int _1627 = ~_1605;
    int _1629 = _1627 + _1619;
    int _1631 = _1629 + 1;
    float _1633 = _645 * _1526;
    int _1635 = ~_1599;
    int _1637 = _1635 + 1;
    int _1639 = _1637 + 1;
    float _1641 = _1625 * _629;
    int _1643 = _585 * _1631;
    int _1645 = _1643 + _1508;
    int _1647 = _585 + (-1);
    float _1649 = trunc(_1633);
    int _1651 = int(_1649);
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1655 = _1653 != 0;
    bool _1657 = !_1621;
    int _1659 = _1657 ? _1645 : (-1);
    bool _1661 = !_1655;
    int _1663 = _1661 ? 0 : 1;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1667 = _1665 != 0;
    float _1669 = trunc(_1641);
    int _1671 = int(_1669);
    int _1673 = _1659 * _1639;
    int _1675 = abs(_507);
    int _1677 = abs(_1663);
    int _1679 = _1599 * _1647;
    int _1681 = _1679 + _1673;
    bool _1683 = !_1667;
    int _1685 = _1683 ? 0 : 1;
    float _1687 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1595);
    int _1689 = abs(_589);
    int _1691 = _1681 * _1675;
    float _1693 = 1.0 / _1609;
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1701 = _1699 != 0;
    int _1703 = _1651 * _1510;
    int _1705 = _1703 + _1691;
    int _1707 = _1671 * _1677;
    int _1709 = _1707 + _1508;
    int _1711 = abs(_1685);
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1719 = _1717 != 0;
    int _1721 = _1709 * _1689;
    int _1723 = _1721 + _1705;
    int _1725 = ~_585;
    int _1727 = _1725 + 1;
    float _1729 = 1.0 / _1715;
    int _1731 = _1671 * _1711;
    int _1733 = _1731 + _1723;
    float _1735 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    bool _1737 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1739 = isnan(_417);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1751 = _1749 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1753 = float(uint(_1733));
    float _1755 = float(uint(_1709));
    float _1757 = 1.0 / _1751;
    float _1759 = as_type<float>(_1528) * _1753;
    float _1761 = trunc(_1759);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1775 = _1769 * _1729;
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1779 = _417 + _1777;
    float _1781 = _1773 * _1757;
    float _1783 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1785 = fma(_1775, _1779, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1787 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1789 = isnan(_417);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1795 = _1791 || _1793;
    float _1797 = float(_1795);
    float _1799 = _1783 + _1609;
    int _1801 = _1727 * int(_1765);
    int _1803 = _1801 + _1733;
    float _1805 = -_1797;
    float _1807 = _1805 + 1.0;
    float _1809 = _1799 * _1693;
    float _1811 = _1809 * 0.5;
    float _1813 = -_1747;
    float _1815 = _1813 + 1.0;
    float _1817 = float(uint(_1803));
    bool _1819 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1821 = isnan(_417);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1833 = _417 + _1831;
    float _1835 = as_type<float>(_1528) * _1817;
    float _1837 = _1829 * _1807;
    float _1839 = -_1829;
    float _1841 = _1839 + 1.0;
    float _1843 = trunc(_1835);
    float _1845 = precise::max(_1843, 0.0);
    uint _1847 = uint(_1845);
    float _1849 = -_203;
    int _1851 = _1516 ? as_type<int>(_1849) : as_type<int>(_203);
    float _1853 = fma(_1781, _1833, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1855 = _1747 * _1841;
    bool _1857 = !_1701;
    float _1859 = _1857 ? _203 : as_type<float>(_1851);
    float _1861 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1863 = _1785 * _1855;
    float _1865 = as_type<float>(_1528) * _1755;
    int _1867 = ~_585;
    int _1869 = _1867 + 1;
    float _1871 = _1859 + 0.5;
    int _1873 = ~_585;
    int _1875 = _1873 + 1;
    float _1877 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1863);
    float _1879 = trunc(_1865);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    float _1885 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[80].x, _527);
    int _1887 = int(_1765) + int(_1847);
    float _1889 = fma(_1853, _1837, _1877);
    float _1891 = -_207;
    int _1893 = _1520 ? as_type<int>(_1891) : as_type<int>(_207);
    int _1895 = _1869 * _1887;
    int _1897 = _1895 + _1733;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1901 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1899);
    bool _1903 = !_1719;
    float _1905 = _1903 ? _207 : as_type<float>(_1893);
    float _1907 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1889);
    bool _1909 = uint(_1897) >= uint(_585);
    float _1911 = 1.0 / _1901;
    float _1913 = _1905 + (-0.5);
    int _1915 = _1875 * int(_1883);
    int _1917 = _1915 + _1709;
    bool _1919 = !_1909;
    int _1921 = _1919 ? 0 : (-1);
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1925 = -_1913;
    float _1927 = -_569;
    float _1929 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1927);
    float _1931 = _1907 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1933 = ~_1887;
    int _1935 = _1933 + _1921;
    int _1937 = _1935 + 1;
    float _1939 = -_501;
    float _1941 = _1939 + 1.0;
    float _1943 = float(uint(_1917));
    float _1945 = fma(_1905, _1514, _1929);
    float _1947 = -_1941;
    float _1949 = fma(_1859, _1947, _1885);
    int _1951 = _585 * _1937;
    int _1953 = _1951 + _1733;
    float _1955 = as_type<float>(_1528) * _1943;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1911 * _1957;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1963 = trunc(_1955);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1973 = !_1621;
    int _1975 = _1973 ? _1953 : (-1);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1979 = abs(_1959);
    float _1981 = log2(_1979);
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1985 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1987 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1991 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1997 = int(_1883) + int(_1967);
    float _1999 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _1985;
    out.m_70.y = _1987;
    out.m_70.z = _1991;
    out.m_70.w = _1923;
    int _2001 = ~_585;
    int _2003 = _2001 + 1;
    out.m_72.x = _1993;
    out.m_72.y = _1999;
    out.m_72.z = _1995;
    out.m_72.w = _1931;
    int _2005 = _1975 & 3;
    bool _2007 = _2005 != 0;
    float _2009 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2011 = _1975 >> 31;
    out.m_74.x = _1949;
    out.m_74.y = _1945;
    bool _2013 = _1959 <= 8000.0;
    bool _2015 = isnan(_1959);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(8000.0);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    int _2025 = _2011 & 3;
    float _2027 = exp2(_2009);
    float _2029 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2031 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2033 = _1975 + _2025;
    float _2035 = -_813;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2029);
    float _2039 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2041 = _2003 * _1997;
    int _2043 = _2041 + _1709;
    int _2045 = _2033 >> 2;
    float _2047 = -_813;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2031);
    float _2051 = -_813;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2039);
    float _2055 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2057 = _2045 << 4;
    int _2059 = _2057 + 368;
    float _2061 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2063 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2065 = uint(_2043) >= uint(_585);
    uint _2067 = uint(int(uint(_2059) >> uint(2)));
    uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
    int _2071 = int(_2067) & 3;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[int(_2069)][_2071];
    int _2075 = int(_2067) + 1;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    int _2079 = _2075 & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    float _2083 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2085 = precise::clamp(_2083, 0.0, 1.0);
    float _2087 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2053);
    float _2089 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2055);
    float _2091 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2093 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2061);
    float _2095 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2063);
    float _2097 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2049);
    float _2099 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2091);
    int _2101 = _1975 & 3;
    bool _2103 = _2101 != 0;
    int _2105 = _2059 + 8;
    uint _2107 = uint(int(uint(_2105) >> uint(2)));
    uint _2109 = uint(int(uint(int(_2107)) >> uint(2)));
    int _2111 = int(_2107) & 3;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[int(_2109)][_2111];
    int _2115 = int(_2107) + 1;
    uint _2117 = uint(int(uint(_2115) >> uint(2)));
    int _2119 = _2115 & 3;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[int(_2117)][_2119];
    float _2123 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2125 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2127 = uint(_2101) > 1u;
    float _2129 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2131 = _2123 * _2097;
    int _2133 = _2007 ? 0 : 1;
    float _2135 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2037);
    float _2137 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2125);
    float _2139 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2129);
    int _2141 = ~_2133;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    float _2147 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2089);
    float _2149 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2093);
    bool _2151 = uint(_2101) >= 2u;
    float _2153 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2095);
    int _2155 = _2145;
    float _2157 = _1403;
    float _2159 = _1457;
    if (!_2127)
    {
        int _2161 = ~_2133;
        int _2163 = _2161 + 1;
        _2155 = _2163;
    }
    int _2165 = _2155;
    float _2167 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2099);
    bool _2169 = _2101 != 3;
    float _2171 = fma(_2085, -2.0, 3.0);
    float _2173 = _2085 * _2085;
    int _2175 = abs(_2165);
    float _2177 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    bool _2179 = !_2103;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = _2173 * _2171;
    int _2185 = _2151 ? 0 : 1;
    float _2187 = fma(_1861, _2147, _2131);
    bool _2189 = _2101 != 3;
    float _2191 = _2123 * _2135;
    int _2193 = ~_2175;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = _2123 * _2087;
    bool _2201 = !_2065;
    int _2203 = _2201 ? 0 : (-1);
    float _2205 = fma(_1861, _2149, _2191);
    int _2207 = abs(_2181);
    float _2209 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2139);
    int _2211 = ~_2185;
    int _2213 = _2211 + 1;
    int _2215 = _2213 + 1;
    float _2217 = -_1479;
    float _2219 = _2217 + 1.0;
    bool _2221 = !_2189;
    int _2223 = _2221 ? 0 : (-1);
    int _2225 = _2197 * as_type<int>(_2081);
    int _2227 = _2215;
    if (_2169)
    {
        int _2229 = ~_2185;
        int _2231 = _2229 + 1;
        _2227 = _2231;
    }
    int _2233 = _2227;
    float _2235 = _1553 * _1481;
    int _2237 = ~_1997;
    int _2239 = _2237 + _2203;
    int _2241 = _2239 + 1;
    bool _2243 = !_1697;
    int _2245 = _2243 ? 0 : 1;
    int _2247 = abs(_2223);
    int _2249 = _585 * _2241;
    int _2251 = _2249 + _1709;
    int _2253 = abs(_2233);
    float _2255 = _1403 * 0.5;
    int _2257 = ~_2207;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    int _2263 = abs(_2245);
    int _2265 = _2261 * as_type<int>(_2073);
    int _2267 = _2265 + _2225;
    int _2269 = ~_2253;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    int _2275 = ~_2247;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    int _2281 = _2273 * as_type<int>(_2113);
    int _2283 = _2281 + _2267;
    int _2285 = ~_2263;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    float _2291 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2293 = _2279 * as_type<int>(_2121);
    int _2295 = _2293 + _2283;
    bool _2297 = !_1621;
    int _2299 = _2297 ? _2251 : (-1);
    float _2301 = -_2183;
    float _2303 = _2301 + 1.0;
    float _2305 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    int _2307 = _2295 * _2289;
    float _2309 = _1502 * _2235;
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2183);
    float _2313 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2305);
    int _2315 = _2299 * _2263;
    int _2317 = _2315 + _2307;
    float _2319 = fma(_1457, -0.5, _2255);
    float _2321 = in.m_76.x;
    float _2323 = _2023 * _2311;
    float _2325 = fma(_1861, _2153, _2199);
    float _2327 = _2167 + _2187;
    float _2329 = _2177 + _2205;
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2333 = _2209 + _2325;
    float _2335 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2313);
    float _2337 = _2219 * _2331;
    float _2339 = precise::clamp(_2337, 0.0, 1.0);
    float _2341 = float(_2317);
    float _2343 = _1455 + _1403;
    float _2345 = _1492 * _2235;
    float _2347 = -_2339;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1455;
    out.gl_Position.y = _1457;
    out.gl_Position.z = _2335;
    out.gl_Position.w = _1403;
    float _2351 = fma(_1492, _2309, _1490);
    float _2353 = fma(_1498, _2345, _1486);
    float _2355 = fma(_1500, _2345, _1488);
    out.m_78.x = _2341;
    bool _2357 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2359 = isnan(_1199);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2365 = _2361 || _2363;
    float _2367 = _2335 + _1403;
    out.m_80.x = _2327;
    out.m_80.y = _2329;
    out.m_80.z = _2333;
    float _2369 = _2343 * 0.5;
    float _2371 = _2349 * _2321;
    float _2373 = _2367 * 0.5;
    float _2375 = -_1553;
    float _2377 = _2375 + 1.0;
    float _2379 = _2371 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2369;
    out.m_82.y = _2319;
    out.m_82.z = _2373;
    out.m_82.w = _1403;
    float _2381 = _1492 * _2377;
    float _2383 = _2335;
    float _2385 = _2377;
    float _2387 = _2319;
    float _2389 = _2369;
    if (!_2365)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2391 = _2157;
    out.m_84.x = _2379;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2365)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2397 = _2383;
    float _2399 = _2397;
    float _2401 = _2397;
    if (!_2365)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _2159;
    out.m_86.x = _2353;
    out.m_86.y = _2355;
    out.m_86.z = _2351;
    out.m_86.w = _2381;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2365)
    {
        _2385 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2409 = _2385;
    float _2411 = _2409;
    float _2413 = _2409;
    if (!_2365)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2415 = _2387;
    float _2417 = _2415;
    float _2419 = _2415;
    if (!_2365)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2421 = _2389;
    bool _2423 = !_2365;
    float _2425 = _2421;
    float _2427 = _2421;
    if (!_2423)
    {
        bool _2429 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2431 = isnan(_1199);
        bool _2433 = _2429 || _2431;
        bool _2435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2437 = _2433 || _2435;
        if (!_2437)
        {
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2441 = _1199 + _2439;
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2445 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2443;
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2451 = 1.0 / _2445;
            float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2469 = _2441 * _2451;
            float _2471 = precise::clamp(_2469, 0.0, 1.0);
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2477 = fma(_2471, _2449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2479 = fma(_2471, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2481 = fma(_2471, _2455, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2483 = fma(_2471, _2459, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2485 = fma(_2471, _2463, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2487 = fma(_2471, _2467, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2427 = _2481;
            _2407 = _2485;
            _2419 = _2477;
            _2401 = _2483;
            _2395 = _2479;
            _2413 = _2487;
            _2489 = true;
        }
        else
        {
            bool _2491 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2493 = isnan(_1199);
            bool _2495 = _2491 || _2493;
            bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2499 = _2495 || _2497;
            if (!_2499)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2501 = _2417;
            _2419 = _2501;
            if (!_2499)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2503 = _2425;
            _2427 = _2503;
            if (!_2499)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2505 = _2393;
            _2395 = _2505;
            if (!_2499)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2507 = _2399;
            _2401 = _2507;
            if (!_2499)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2509 = _2405;
            _2407 = _2509;
            if (!_2499)
            {
                _2411 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2511 = _2411;
            bool _2513 = !_2499;
            _2413 = _2511;
            if (!_2513)
            {
                bool _2515 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2517 = isnan(_1199);
                bool _2519 = _2515 || _2517;
                bool _2521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2523 = _2519 || _2521;
                if (!_2523)
                {
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2527 = _1199 + _2525;
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2529;
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2537 = 1.0 / _2531;
                    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2555 = _2527 * _2537;
                    float _2557 = precise::clamp(_2555, 0.0, 1.0);
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2563 = fma(_2557, _2535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2565 = fma(_2557, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2567 = fma(_2557, _2541, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2569 = fma(_2557, _2545, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2571 = fma(_2557, _2549, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2573 = fma(_2557, _2553, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2427 = _2567;
                    _2407 = _2571;
                    _2419 = _2563;
                    _2401 = _2569;
                    _2395 = _2565;
                    _2413 = _2573;
                    _2489 = true;
                }
                else
                {
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2413 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2489 = false;
    float _2575 = _2427;
    float _2577 = _2407;
    float _2579 = _2419;
    float _2581 = _2401;
    float _2583 = _2395;
    float _2585 = _2413;
    float _2587 = fma(_2329, -0.5, 0.5);
    float _2589 = precise::clamp(_2587, 0.0, 1.0);
    float _2591 = -_2575;
    float _2593 = _2591 + _2577;
    float _2595 = -_2579;
    float _2597 = _2595 + _2581;
    float _2599 = -_2583;
    float _2601 = _2599 + _2585;
    bool _2603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2605 = fma(_2589, _2593, _2575);
    float _2607 = fma(_2589, _2597, _2579);
    float _2609 = fma(_2589, _2601, _2583);
    float _2611 = _2605 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _2613 = fma(_2607, 0.298911988735198974609375, _2611);
    float _2615 = fma(_2609, 0.114477999508380889892578125, _2613);
    float _2617 = -_2615;
    float _2619 = _2607 + _2617;
    float _2621 = -_2615;
    float _2623 = _2605 + _2621;
    float _2625 = -_2615;
    float _2627 = _2609 + _2625;
    float _2629 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2631 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    float _2635 = fma(_2627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    out.m_49.x = _2629;
    out.m_90.x = _2631;
    out.m_90.y = _2633;
    out.m_90.z = _2635;
    if (!_2603)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2637 = -_1157;
    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2641 = -_1159;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2645 = -_1161;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2649 = _2639 * _2639;
    float _2651 = fma(_2643, _2643, _2649);
    float _2653 = fma(_2647, _2647, _2651);
    float _2655 = sqrt(_2653);
    float _2657 = rsqrt(_2653);
    float _2659 = -_2655;
    float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2663 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = _2643 * _2657;
    float _2669 = _2639 * _2657;
    float _2671 = abs(_2665);
    float _2673 = log2(_2671);
    float _2675 = _2647 * _2657;
    float _2677 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2679 = _2329 * _2669;
    float _2681 = -_2669;
    float _2683 = -_2677;
    float _2685 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2683);
    float _2687 = fma(_2327, _2667, _2679);
    float _2689 = -_2675;
    float _2691 = fma(_2689, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2685);
    float _2693 = fma(_2333, _2675, _2687);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2699 = _2691 + _2697;
    float _2701 = _2673 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2703 = _2699 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2705 = precise::clamp(_2703, 0.0, 1.0);
    float _2707 = exp2(_2701);
    float _2709 = _2707 * _2705;
    float _2711 = _2695 * _2709;
    float _2713 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2715 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2717 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _2713;
    out.m_88.y = _2715;
    out.m_88.z = _2717;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2489 = false;
    bool _407 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2774 = as_type<float>(_125);
        out.gl_Position.z = _2774;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_163);
        out.gl_Position.z = _2843;
    }
    if (_157)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    int _191 = as_type<int>(_165) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_165) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _201 = !_193;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _169 * _175;
    float _211 = _169 * _181;
    float _213 = fma(_167, _173, _209);
    float _215 = _169 * _187;
    float _217 = fma(_167, _179, _211);
    float _219 = fma(_171, _177, _213);
    float _221 = fma(_167, _185, _215);
    float _223 = fma(_171, _183, _217);
    float _225 = fma(_171, _189, _221);
    bool _227 = !_199;
    float _229 = _179;
    float _231 = _183;
    float _233 = _225;
    float _235 = _223;
    float _253;
    if (!_227)
    {
        float _237 = in.m_64.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_109);
        float _259 = 1.0 / _257;
        float _261 = _143 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _287;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _299 * _303;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _323 = 1.0 / _283;
    float _325 = -_299;
    float _327 = _325 + 1.0;
    float _329 = _317 * _327;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = _267 * _323;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _263 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _305;
    float _355 = fma(_347, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = fma(_337, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = _355 * _329;
    float _367 = _357 * _329;
    float _369 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _375 = fma(_369, _319, _371);
    float _377 = fma(_363, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_321;
    float _403;
    float _405;
    if (!_383)
    {
        float _385 = in.m_64.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _389 = float(_109);
        float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _395 = _393 * _387;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _389;
        _405 = _401;
        _407 = true;
    }
    else
    {
        float _409 = float(_109);
        float _411 = 1.0 / _409;
        float _413 = _143 * _411;
        _403 = _409;
        _405 = _413;
    }
    _407 = false;
    float _415 = _403;
    float _417 = _405;
    float _419 = in.m_64.z;
    float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _423 = log2(_421);
    float _425 = in.m_64.x;
    float _427 = in.m_64.y;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _439 = _437 != 0;
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _443 = int(_441);
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _447 = !_431;
    int _449 = _447 ? 0 : 1;
    float _451 = _423 * _143;
    bool _453 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _461 = _457 || _459;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _465 = exp2(_451);
    float _467 = _419 * 2.0;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = _427 + _425;
    float _473 = _427 * 2.0;
    float _475 = _425 * 2.0;
    float _477 = floor(_467);
    float _479 = _471 + (-1.0);
    float _481 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _483 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _485 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _487 = _427 + _419;
    float _489 = -_445;
    float _491 = fma(_481, 2.0, _489);
    float _493 = floor(_473);
    float _495 = _487 + (-1.0);
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _483);
    float _503 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _505 = !_435;
    int _507 = _505 ? 0 : 1;
    float _509 = floor(_475);
    bool _511 = _477 > 0.0;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _515 = _477 >= 0.0;
    bool _517 = isnan(_477);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = -_143;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _491);
    float _529 = _461 ? _499 : 0.0;
    float _531 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[78].w, _513);
    int _533 = _523 ? 0 : 1;
    bool _535 = _493 > 0.0;
    float _537 = _427 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _539 = _493 >= 0.0;
    bool _541 = isnan(_493);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _531);
    int _551 = ~_533;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    float _557 = fma(_537, -2.0, _463);
    int _559 = _555;
    if (!_511)
    {
        int _561 = ~_533;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    bool _567 = _509 > 0.0;
    float _569 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _557);
    bool _571 = _509 >= 0.0;
    bool _573 = isnan(_509);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = float(_443);
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _585 = int(_583);
    bool _587 = !_439;
    int _589 = _587 ? 0 : 1;
    int _591 = _579 ? 0 : 1;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _595 = _593 != 0;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _603 = _601 != 0;
    bool _605 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(1.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    float _619 = 1.0 / _581;
    bool _621 = !_595;
    int _623 = _621 ? 0 : 1;
    float _625 = float(_565);
    int _627 = abs(_623);
    float _629 = float(_585);
    float _631 = 1.0 / _617;
    float _633 = in.m_66.x;
    float _635 = in.m_66.y;
    float _637 = in.m_66.z;
    float _639 = float(_627);
    bool _641 = !_599;
    int _643 = _641 ? 0 : 1;
    float _645 = _629 * _143;
    int _647 = ~_591;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = _639 * _625;
    float _655 = _619 * _143;
    int _657 = _651;
    if (!_567)
    {
        int _659 = ~_591;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _425 + (-0.5);
    int _667 = _547 ? 0 : 1;
    float _669 = float(_663);
    if (_613)
    {
        float _671 = _529 * _631;
        _147 = _671;
    }
    float _673 = _147;
    int _675 = abs(_643);
    float _677 = _653 * (-2.0);
    float _679 = float(_675);
    float _681 = fma(_677, _633, _633);
    float _683 = _679 * _669;
    bool _685 = !_603;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_485, _677, _485);
    int _691 = ~_667;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    float _697 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[196].x, _681);
    float _699 = _683 * (-2.0);
    int _701 = _695;
    if (!_535)
    {
        int _703 = ~_667;
        int _705 = _703 + 1;
        _701 = _705;
    }
    int _707 = _701;
    int _709 = abs(_687);
    float _711 = fma(_689, _673, _697);
    float _713 = fma(_699, _635, _635);
    float _715 = _427 + (-0.5);
    float _717 = float(_707);
    float _719 = fma(_503, _699, _503);
    float _721 = float(_709);
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _725 = _419 + _425;
    float _727 = _711 * 0.15915493667125701904296875;
    float _729 = _419 + (-0.5);
    float _731 = _721 * _717;
    float _733 = _725 + (-1.0);
    float _735 = fma(_719, _673, _723);
    float _737 = _727 * 6.283185482025146484375;
    float _739 = cos(_737);
    float _741 = _731 * (-2.0);
    float _743 = in.m_68.x;
    float _745 = in.m_68.y;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _749 = _735 * 0.15915493667125701904296875;
    float _751 = fma(_741, _637, _637);
    float _753 = fma(_747, _741, _747);
    float _755 = in.m_46.x;
    float _757 = in.m_46.y;
    float _759 = in.m_46.z;
    float _761 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _751);
    float _763 = _749 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_753, _673, _761);
    float _769 = _767 * 0.15915493667125701904296875;
    float _771 = _749 * 6.283185482025146484375;
    float _773 = cos(_771);
    float _775 = _727 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = _381 * _745;
    float _781 = _379 * _743;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _787 = _779 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = _187 * _757;
    float _793 = _769 * 6.283185482025146484375;
    float _795 = cos(_793);
    float _797 = _787 * _783;
    float _799 = _789 * _785;
    float _801 = _739 * _773;
    float _803 = _739 * _765;
    float _805 = in.m_62.w;
    float _807 = fma(_185, _755, _791);
    float _809 = _175 * _757;
    float _811 = _769 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _777 * _765;
    float _817 = _777 * _773;
    float _819 = in.m_58.w;
    float _821 = fma(_173, _755, _809);
    float _823 = fma(_189, _759, _807);
    float _825 = _181 * _757;
    float _827 = _739 * _795;
    float _829 = _777 * _795;
    float _831 = _773 * _795;
    float _833 = _765 * _795;
    float _835 = _827 * _797;
    float _837 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = fma(_177, _759, _821);
    float _841 = fma(_179, _755, _825);
    float _843 = fma(_813, _801, _815);
    float _845 = -_797;
    float _847 = _813 * _845;
    float _849 = -_817;
    float _851 = fma(_813, _803, _849);
    float _853 = -_803;
    float _855 = fma(_813, _817, _853);
    float _857 = fma(_843, _799, _835);
    float _859 = _829 * _797;
    float _861 = fma(_831, _799, _847);
    float _863 = fma(_813, _815, _801);
    float _865 = fma(_851, _837, _857);
    float _867 = fma(_855, _799, _859);
    float _869 = fma(_833, _837, _861);
    float _871 = _823 + _805;
    float _873 = _865 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _875 = fma(_863, _837, _867);
    float _877 = _865 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _879 = _839 + _819;
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].x, _873);
    float _883 = _865 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].x, _877);
    float _887 = fma(_183, _759, _841);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _881);
    float _891 = in.m_60.w;
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _885);
    float _895 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].x, _883);
    float _897 = _889 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _899 = _893 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _895);
    float _903 = _871 + _897;
    float _905 = _879 + _899;
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _911 = _903 + _909;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _915 = _905 + _913;
    float _917 = _911 * _911;
    float _919 = fma(_915, _915, _917);
    float _921 = sqrt(_919);
    float _923 = _887 + _891;
    float _925 = _923 + _907;
    bool _927 = _921 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = _887;
    float _931 = _925;
    if (!_927)
    {
        _229 = _905;
    }
    float _933 = _229;
    float _935 = _933;
    if (!_927)
    {
        _929 = _903;
    }
    float _937 = _929;
    float _939 = _937;
    if (!_927)
    {
        _231 = _925;
    }
    float _941 = _231;
    bool _943 = !_927;
    float _945 = _941;
    if (!_943)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _951 = _921 + _949;
        float _953 = rsqrt(_919);
        float _955 = _951 * _947;
        float _957 = _925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _959 = _955 * 0.15915493667125701904296875;
        float _961 = _959 * 6.283185482025146484375;
        float _963 = cos(_961);
        float _965 = _959 * 6.283185482025146484375;
        float _967 = sin(_965);
        float _969 = _963 + (-1.0);
        float _971 = fma(_967, _957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _973 = _969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _975 = _953 * _971;
        float _977 = fma(_925, _963, _973);
        float _979 = fma(_915, _975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _981 = fma(_911, _975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _945 = _977;
        _935 = _979;
        _939 = _981;
    }
    float _983 = _945;
    float _985 = _935;
    float _987 = _939;
    float _989 = -_923;
    float _991 = _989 + _983;
    float _993 = -_879;
    float _995 = _993 + _985;
    float _997 = -_871;
    float _999 = _997 + _987;
    float _1001 = _991 * _991;
    bool _1003 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1005 = isnan(0.5);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_995, _995, _1001);
    float _1015 = fma(_999, _999, _1013);
    float _1017 = sqrt(_1015);
    bool _1019 = _1017 > 0.0;
    bool _1021 = !_1019;
    float _1023 = _985;
    float _1025 = _983;
    float _1027 = _987;
    float _1029 = _991;
    float _1031 = _999;
    if (!_1021)
    {
        float _1033 = _223 * _223;
        float _1035 = fma(_219, _219, _1033);
        float _1037 = rsqrt(_1015);
        float _1039 = fma(_225, _225, _1035);
        float _1041 = sqrt(_1039);
        float _1043 = _995 * _1037;
        float _1045 = _991 * _1037;
        float _1047 = _999 * _1037;
        bool _1049 = _1041 > 0.0;
        bool _1051 = !_1049;
        _931 = _1047;
        if (!_1051)
        {
            float _1053 = rsqrt(_1039);
            float _1055 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1057 = _223 * _1053;
            float _1059 = _219 * _1053;
            float _1061 = _225 * _1053;
            float _1063 = _1045 * _1057;
            float _1065 = fma(_1043, _1059, _1063);
            float _1067 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1069 = fma(_1047, _1061, _1065);
            float _1071 = _1069 * _1067;
            float _1073 = fma(_219, _1071, _985);
            float _1075 = fma(_223, _1071, _983);
            float _1077 = fma(_225, _1071, _987);
            _1023 = _1073;
            _1025 = _1075;
            _1027 = _1077;
            _1029 = _1067;
        }
    }
    float _1079 = _1023;
    float _1081 = _1025;
    float _1083 = _1027;
    float _1085 = _931;
    float _1087 = _1029;
    float _1089 = _1085;
    float _1091 = _1083;
    float _1093 = _1087;
    if (_1011)
    {
        _233 = _1079;
    }
    float _1095 = _233;
    float _1097 = _1095;
    if (_1011)
    {
        _1031 = _1081;
    }
    float _1099 = _1031;
    float _1101 = _1099;
    if (_1011)
    {
        _1089 = _1083;
    }
    float _1103 = _1089;
    float _1105 = _1103;
    if (!_1011)
    {
        float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1109 = _923 + _1107;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1113 = _879 + _1111;
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1117 = -_879;
        float _1119 = _1117 + _1079;
        float _1121 = _1109 * _1109;
        float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1125 = _871 + _1123;
        float _1127 = -_923;
        float _1129 = _1127 + _1081;
        float _1131 = -_871;
        float _1133 = _1131 + _1083;
        float _1135 = fma(_1113, _1113, _1121);
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1139 = fma(_1125, _1125, _1135);
        float _1141 = sqrt(_1139);
        float _1143 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1147 = _1145 * _1137;
        float _1149 = _1143 * _1147;
        float _1151 = fma(_1119, _1149, _879);
        float _1153 = fma(_1129, _1149, _923);
        float _1155 = fma(_1133, _1149, _871);
        _1101 = _1153;
        _1097 = _1151;
        _1105 = _1155;
        _1091 = _1133;
    }
    float _1157 = _1101;
    float _1159 = _1097;
    float _1161 = _1105;
    float _1163 = _1091;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1167 = _1157 + _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1175 = _1161 + _1173;
    float _1177 = _1167 * _1167;
    float _1179 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1181 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1183 = fma(_1171, _1171, _1177);
    float _1185 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1179);
    float _1187 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1181);
    float _1189 = fma(_1175, _1175, _1183);
    float _1191 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1185);
    float _1193 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1187);
    float _1195 = rsqrt(_1189);
    float _1197 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1199 = sqrt(_1189);
    float _1201 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1203 = _1171 * _1201;
    float _1205 = _1175 * _1201;
    float _1207 = _1203 * _1203;
    float _1209 = _1205 * _1205;
    float _1211 = _1207 + _1209;
    float _1213 = sqrt(_1211);
    bool _1215 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = _1213 + _1217;
    float _1221 = _1081;
    float _1223 = _1211;
    float _1225 = _1219;
    float _1227 = _1167;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1231 = _1203;
    float _1233 = _1205;
    float _1235 = _1207;
    float _1237 = _1209;
    if (_1215)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1221 = _1239;
    }
    float _1241 = _1221;
    if (_1215)
    {
        float _1243 = rsqrt(_1211);
        _1223 = _1243;
    }
    float _1245 = _1223;
    if (_1215)
    {
        float _1247 = _1219 * _1241;
        _1225 = _1247;
    }
    float _1249 = _1225;
    if (_1215)
    {
        float _1251 = _1249 * 0.15915493667125701904296875;
        _235 = _1251;
    }
    float _1253 = _235;
    float _1255 = _1163;
    float _1257 = _1253;
    if (_1215)
    {
        float _1259 = _1253 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        _1255 = _1261;
    }
    float _1263 = _1255;
    float _1265 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1267 = precise::max(0.0, _1265);
    float _1269 = _1241;
    if (_1215)
    {
        float _1271 = _1253 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = -_1201;
    float _1279 = -_1267;
    float _1281 = fma(_1167, _1277, _1279);
    float _1283 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1215)
    {
        float _1285 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1285;
    }
    float _1287 = _1227;
    float _1289 = _1263;
    if (_1215)
    {
        float _1291 = fma(_1263, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1289 = _1291;
    }
    float _1293 = _1289;
    float _1295 = floor(_1283);
    float _1297 = _1293;
    if (_1215)
    {
        float _1299 = _1275 + (-1.0);
        _1229 = _1299;
    }
    float _1301 = _1229;
    if (_1215)
    {
        float _1303 = _1245 * _1293;
        _1093 = _1303;
    }
    float _1305 = _1093;
    if (!_1215)
    {
        _1297 = _1281;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (_1215)
    {
        float _1311 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1257 = _1311;
    }
    float _1313 = _1257;
    if (_1215)
    {
        float _1315 = _1203 * _1305;
        _1231 = _1315;
    }
    float _1317 = _1231;
    if (_1215)
    {
        float _1319 = _1205 * _1305;
        _1233 = _1319;
    }
    float _1321 = _1233;
    float _1323 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1215)
    {
        float _1325 = fma(_1281, _1275, _1313);
        _1309 = _1325;
    }
    float _1327 = _1309;
    if (_1215)
    {
        float _1329 = _1317 * _1317;
        _1235 = _1329;
    }
    float _1331 = _1235;
    if (_1215)
    {
        float _1333 = _1321 * _1321;
        _1237 = _1333;
    }
    float _1335 = _1237;
    float _1337 = fma(_1327, _1327, _1331);
    float _1339 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1341 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1343 = _1337 + _1335;
    float _1345 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1323);
    float _1347 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1349 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1341);
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1353 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1351);
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1345);
    float _1359 = rsqrt(_1343);
    float _1361 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1349);
    float _1363 = -_1355;
    float _1365 = _1363 + 1.0;
    float _1367 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = _1197 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1371 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1373 = -_1295;
    float _1375 = _1283 + _1373;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = abs(_1365);
    float _1381 = log2(_1379);
    float _1383 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1385 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1389 = -_1369;
    float _1391 = fma(_1389, _1347, 1.0);
    float _1393 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1397 = _1359 * _1317;
    float _1399 = _1359 * _1321;
    float _1401 = floor(_1339);
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1405 = _1359 * _1327;
    float _1407 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1383);
    float _1411 = _1405 + 1.0;
    float _1413 = -_1407;
    float _1415 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1413);
    float _1417 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1419 = 1.0 / _1403;
    float _1421 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1423 = -_1399;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1415);
    float _1427 = fma(_1425, -0.5, 0.5);
    float _1429 = -_1401;
    float _1431 = _1339 + _1429;
    float _1433 = exp2(_1417);
    float _1435 = fma(_1425, 0.5, 0.5);
    float _1437 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1385);
    float _1439 = fma(_1435, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1441 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1437);
    float _1443 = log2(_1391);
    float _1445 = fma(_1435, _1439, -0.212114393711090087890625);
    float _1447 = fma(_1435, _1445, 1.570728778839111328125);
    float _1449 = sqrt(_1427);
    float _1451 = -_1405;
    float _1453 = fma(_1433, _1411, _1451);
    float _1455 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1421);
    float _1457 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1441);
    float _1459 = fma(_1453, 0.5, 0.5);
    float _1461 = _1455 * _1419;
    float _1463 = _1457 * _1419;
    float _1465 = _1443 * 0.693147182464599609375;
    float _1467 = fma(_1463, -0.5, 0.5);
    float _1469 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1471 = _1449 * 0.636619746685028076171875;
    float _1473 = fma(_1461, 0.5, 0.5);
    float _1475 = -_1447;
    float _1477 = fma(_1471, _1475, 1.0);
    float2 _4852 = float2(_1375, _1431);
    float _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4852, float2(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4852, float2(0.0), isnan(_4852)), level(0.0)).x;
    float3 _4863 = float3(_1473, _1467, _1469);
    float _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).x;
    float3 _4874 = float3(_1473, _1467, _1469);
    float4 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).xyzw;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    float _1492 = _1484.w;
    float2 _4890 = float2(_1477, _1459);
    float3 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4890, float2(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4890, float2(0.0), isnan(_4890)), level(0.0)).xyz;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = float(uint(_585));
    float _1506 = trunc(_655);
    int _1508 = int(_1506);
    int _1510 = abs(_449);
    float _1512 = -_549;
    float _1514 = _1512 + 1.0;
    bool _1516 = _425 > 0.5;
    float _1518 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1520 = _427 > 0.5;
    float _1522 = 1.0 / _1504;
    float _1524 = float(uint(_1508));
    float _1526 = 1.0 / _415;
    int _1528 = as_type<int>(_1522) + (-2);
    float _1530 = exp2(_1518);
    float _1532 = as_type<float>(_1528) * _1524;
    int _1534 = ~_585;
    int _1536 = _1534 + 1;
    int _1538 = ~_585;
    int _1540 = _1538 + 1;
    float _1542 = trunc(_1532);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    float _1549 = -_1530;
    float _1551 = _1549 + 1.0;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1555 = _1536 * int(_1547);
    int _1557 = _1555 + _1508;
    float _1559 = float(uint(_1557));
    float _1561 = as_type<float>(_1528) * _1559;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1565 = _1563 != 0;
    float _1567 = float(_1508);
    float _1569 = trunc(_1561);
    float _1571 = precise::max(_1569, 0.0);
    uint _1573 = uint(_1571);
    bool _1575 = !_1565;
    float _1577 = _1575 ? 7.345489978790283203125 : 1.0;
    bool _1579 = _1567 >= _629;
    bool _1581 = isnan(_1567);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan(_629);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1577 * _425;
    float _1593 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1597 = trunc(_1589);
    int _1599 = int(_1597);
    float _1601 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1603 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1601);
    int _1605 = int(_1547) + int(_1573);
    float _1607 = floor(_1591);
    float _1609 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1611 = _1540 * _1605;
    int _1613 = _1611 + _1508;
    bool _1615 = uint(_1613) >= uint(_585);
    bool _1617 = !_1615;
    int _1619 = _1617 ? 0 : (-1);
    bool _1621 = _585 == 0;
    float _1623 = -_1607;
    float _1625 = _1591 + _1623;
    int _1627 = ~_1605;
    int _1629 = _1627 + _1619;
    int _1631 = _1629 + 1;
    float _1633 = _645 * _1526;
    int _1635 = ~_1599;
    int _1637 = _1635 + 1;
    int _1639 = _1637 + 1;
    float _1641 = _1625 * _629;
    int _1643 = _585 * _1631;
    int _1645 = _1643 + _1508;
    int _1647 = _585 + (-1);
    float _1649 = trunc(_1633);
    int _1651 = int(_1649);
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1655 = _1653 != 0;
    bool _1657 = !_1621;
    int _1659 = _1657 ? _1645 : (-1);
    bool _1661 = !_1655;
    int _1663 = _1661 ? 0 : 1;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1667 = _1665 != 0;
    float _1669 = trunc(_1641);
    int _1671 = int(_1669);
    int _1673 = _1659 * _1639;
    int _1675 = abs(_507);
    int _1677 = abs(_1663);
    int _1679 = _1599 * _1647;
    int _1681 = _1679 + _1673;
    bool _1683 = !_1667;
    int _1685 = _1683 ? 0 : 1;
    float _1687 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1595);
    int _1689 = abs(_589);
    int _1691 = _1681 * _1675;
    float _1693 = 1.0 / _1609;
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1701 = _1699 != 0;
    int _1703 = _1651 * _1510;
    int _1705 = _1703 + _1691;
    int _1707 = _1671 * _1677;
    int _1709 = _1707 + _1508;
    int _1711 = abs(_1685);
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1719 = _1717 != 0;
    int _1721 = _1709 * _1689;
    int _1723 = _1721 + _1705;
    int _1725 = ~_585;
    int _1727 = _1725 + 1;
    float _1729 = 1.0 / _1715;
    int _1731 = _1671 * _1711;
    int _1733 = _1731 + _1723;
    float _1735 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    bool _1737 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1739 = isnan(_417);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1751 = _1749 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1753 = float(uint(_1733));
    float _1755 = float(uint(_1709));
    float _1757 = 1.0 / _1751;
    float _1759 = as_type<float>(_1528) * _1753;
    float _1761 = trunc(_1759);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1775 = _1769 * _1729;
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1779 = _417 + _1777;
    float _1781 = _1773 * _1757;
    float _1783 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1785 = fma(_1775, _1779, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1787 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1789 = isnan(_417);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1795 = _1791 || _1793;
    float _1797 = float(_1795);
    float _1799 = _1783 + _1609;
    int _1801 = _1727 * int(_1765);
    int _1803 = _1801 + _1733;
    float _1805 = -_1797;
    float _1807 = _1805 + 1.0;
    float _1809 = _1799 * _1693;
    float _1811 = _1809 * 0.5;
    float _1813 = -_1747;
    float _1815 = _1813 + 1.0;
    float _1817 = float(uint(_1803));
    bool _1819 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1821 = isnan(_417);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1833 = _417 + _1831;
    float _1835 = as_type<float>(_1528) * _1817;
    float _1837 = _1829 * _1807;
    float _1839 = -_1829;
    float _1841 = _1839 + 1.0;
    float _1843 = trunc(_1835);
    float _1845 = precise::max(_1843, 0.0);
    uint _1847 = uint(_1845);
    float _1849 = -_203;
    int _1851 = _1516 ? as_type<int>(_1849) : as_type<int>(_203);
    float _1853 = fma(_1781, _1833, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1855 = _1747 * _1841;
    bool _1857 = !_1701;
    float _1859 = _1857 ? _203 : as_type<float>(_1851);
    float _1861 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1863 = _1785 * _1855;
    float _1865 = as_type<float>(_1528) * _1755;
    int _1867 = ~_585;
    int _1869 = _1867 + 1;
    float _1871 = _1859 + 0.5;
    int _1873 = ~_585;
    int _1875 = _1873 + 1;
    float _1877 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1863);
    float _1879 = trunc(_1865);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    float _1885 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[80].x, _527);
    int _1887 = int(_1765) + int(_1847);
    float _1889 = fma(_1853, _1837, _1877);
    float _1891 = -_207;
    int _1893 = _1520 ? as_type<int>(_1891) : as_type<int>(_207);
    int _1895 = _1869 * _1887;
    int _1897 = _1895 + _1733;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1901 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1899);
    bool _1903 = !_1719;
    float _1905 = _1903 ? _207 : as_type<float>(_1893);
    float _1907 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1889);
    bool _1909 = uint(_1897) >= uint(_585);
    float _1911 = 1.0 / _1901;
    float _1913 = _1905 + (-0.5);
    int _1915 = _1875 * int(_1883);
    int _1917 = _1915 + _1709;
    bool _1919 = !_1909;
    int _1921 = _1919 ? 0 : (-1);
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1925 = -_1913;
    float _1927 = -_569;
    float _1929 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1927);
    float _1931 = _1907 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1933 = ~_1887;
    int _1935 = _1933 + _1921;
    int _1937 = _1935 + 1;
    float _1939 = -_501;
    float _1941 = _1939 + 1.0;
    float _1943 = float(uint(_1917));
    float _1945 = fma(_1905, _1514, _1929);
    float _1947 = -_1941;
    float _1949 = fma(_1859, _1947, _1885);
    int _1951 = _585 * _1937;
    int _1953 = _1951 + _1733;
    float _1955 = as_type<float>(_1528) * _1943;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1911 * _1957;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1963 = trunc(_1955);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1973 = !_1621;
    int _1975 = _1973 ? _1953 : (-1);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1979 = abs(_1959);
    float _1981 = log2(_1979);
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1985 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1987 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1991 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1997 = int(_1883) + int(_1967);
    float _1999 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _1985;
    out.m_70.y = _1987;
    out.m_70.z = _1991;
    out.m_70.w = _1923;
    int _2001 = ~_585;
    int _2003 = _2001 + 1;
    out.m_72.x = _1993;
    out.m_72.y = _1999;
    out.m_72.z = _1995;
    out.m_72.w = _1931;
    int _2005 = _1975 & 3;
    bool _2007 = _2005 != 0;
    float _2009 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2011 = _1975 >> 31;
    out.m_74.x = _1949;
    out.m_74.y = _1945;
    bool _2013 = _1959 <= 8000.0;
    bool _2015 = isnan(_1959);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(8000.0);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    int _2025 = _2011 & 3;
    float _2027 = exp2(_2009);
    float _2029 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2031 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2033 = _1975 + _2025;
    float _2035 = -_813;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2029);
    float _2039 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2041 = _2003 * _1997;
    int _2043 = _2041 + _1709;
    int _2045 = _2033 >> 2;
    float _2047 = -_813;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2031);
    float _2051 = -_813;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2039);
    float _2055 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2057 = _2045 << 4;
    int _2059 = _2057 + 368;
    float _2061 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2063 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2065 = uint(_2043) >= uint(_585);
    uint _2067 = uint(int(uint(_2059) >> uint(2)));
    uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
    int _2071 = int(_2067) & 3;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[int(_2069)][_2071];
    int _2075 = int(_2067) + 1;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    int _2079 = _2075 & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    float _2083 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2085 = precise::clamp(_2083, 0.0, 1.0);
    float _2087 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2053);
    float _2089 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2055);
    float _2091 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2093 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2061);
    float _2095 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2063);
    float _2097 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2049);
    float _2099 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2091);
    int _2101 = _1975 & 3;
    bool _2103 = _2101 != 0;
    int _2105 = _2059 + 8;
    uint _2107 = uint(int(uint(_2105) >> uint(2)));
    uint _2109 = uint(int(uint(int(_2107)) >> uint(2)));
    int _2111 = int(_2107) & 3;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[int(_2109)][_2111];
    int _2115 = int(_2107) + 1;
    uint _2117 = uint(int(uint(_2115) >> uint(2)));
    int _2119 = _2115 & 3;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[int(_2117)][_2119];
    float _2123 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2125 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2127 = uint(_2101) > 1u;
    float _2129 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2131 = _2123 * _2097;
    int _2133 = _2007 ? 0 : 1;
    float _2135 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2037);
    float _2137 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2125);
    float _2139 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2129);
    int _2141 = ~_2133;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    float _2147 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2089);
    float _2149 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2093);
    bool _2151 = uint(_2101) >= 2u;
    float _2153 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2095);
    int _2155 = _2145;
    float _2157 = _1403;
    float _2159 = _1457;
    if (!_2127)
    {
        int _2161 = ~_2133;
        int _2163 = _2161 + 1;
        _2155 = _2163;
    }
    int _2165 = _2155;
    float _2167 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2099);
    bool _2169 = _2101 != 3;
    float _2171 = fma(_2085, -2.0, 3.0);
    float _2173 = _2085 * _2085;
    int _2175 = abs(_2165);
    float _2177 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    bool _2179 = !_2103;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = _2173 * _2171;
    int _2185 = _2151 ? 0 : 1;
    float _2187 = fma(_1861, _2147, _2131);
    bool _2189 = _2101 != 3;
    float _2191 = _2123 * _2135;
    int _2193 = ~_2175;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = _2123 * _2087;
    bool _2201 = !_2065;
    int _2203 = _2201 ? 0 : (-1);
    float _2205 = fma(_1861, _2149, _2191);
    int _2207 = abs(_2181);
    float _2209 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2139);
    int _2211 = ~_2185;
    int _2213 = _2211 + 1;
    int _2215 = _2213 + 1;
    float _2217 = -_1479;
    float _2219 = _2217 + 1.0;
    bool _2221 = !_2189;
    int _2223 = _2221 ? 0 : (-1);
    int _2225 = _2197 * as_type<int>(_2081);
    int _2227 = _2215;
    if (_2169)
    {
        int _2229 = ~_2185;
        int _2231 = _2229 + 1;
        _2227 = _2231;
    }
    int _2233 = _2227;
    float _2235 = _1553 * _1481;
    int _2237 = ~_1997;
    int _2239 = _2237 + _2203;
    int _2241 = _2239 + 1;
    bool _2243 = !_1697;
    int _2245 = _2243 ? 0 : 1;
    int _2247 = abs(_2223);
    int _2249 = _585 * _2241;
    int _2251 = _2249 + _1709;
    int _2253 = abs(_2233);
    float _2255 = _1403 * 0.5;
    int _2257 = ~_2207;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    int _2263 = abs(_2245);
    int _2265 = _2261 * as_type<int>(_2073);
    int _2267 = _2265 + _2225;
    int _2269 = ~_2253;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    int _2275 = ~_2247;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    int _2281 = _2273 * as_type<int>(_2113);
    int _2283 = _2281 + _2267;
    int _2285 = ~_2263;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    float _2291 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2293 = _2279 * as_type<int>(_2121);
    int _2295 = _2293 + _2283;
    bool _2297 = !_1621;
    int _2299 = _2297 ? _2251 : (-1);
    float _2301 = -_2183;
    float _2303 = _2301 + 1.0;
    float _2305 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    int _2307 = _2295 * _2289;
    float _2309 = _1502 * _2235;
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2183);
    float _2313 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2305);
    int _2315 = _2299 * _2263;
    int _2317 = _2315 + _2307;
    float _2319 = fma(_1457, -0.5, _2255);
    float _2321 = in.m_76.x;
    float _2323 = _2023 * _2311;
    float _2325 = fma(_1861, _2153, _2199);
    float _2327 = _2167 + _2187;
    float _2329 = _2177 + _2205;
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2333 = _2209 + _2325;
    float _2335 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2313);
    float _2337 = _2219 * _2331;
    float _2339 = precise::clamp(_2337, 0.0, 1.0);
    float _2341 = float(_2317);
    float _2343 = _1455 + _1403;
    float _2345 = _1492 * _2235;
    float _2347 = -_2339;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1455;
    out.gl_Position.y = _1457;
    out.gl_Position.z = _2335;
    out.gl_Position.w = _1403;
    float _2351 = fma(_1492, _2309, _1490);
    float _2353 = fma(_1498, _2345, _1486);
    float _2355 = fma(_1500, _2345, _1488);
    out.m_78.x = _2341;
    bool _2357 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2359 = isnan(_1199);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2365 = _2361 || _2363;
    float _2367 = _2335 + _1403;
    out.m_80.x = _2327;
    out.m_80.y = _2329;
    out.m_80.z = _2333;
    float _2369 = _2343 * 0.5;
    float _2371 = _2349 * _2321;
    float _2373 = _2367 * 0.5;
    float _2375 = -_1553;
    float _2377 = _2375 + 1.0;
    float _2379 = _2371 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2369;
    out.m_82.y = _2319;
    out.m_82.z = _2373;
    out.m_82.w = _1403;
    float _2381 = _1492 * _2377;
    float _2383 = _2335;
    float _2385 = _2377;
    float _2387 = _2319;
    float _2389 = _2369;
    if (!_2365)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2391 = _2157;
    out.m_84.x = _2379;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2365)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2397 = _2383;
    float _2399 = _2397;
    float _2401 = _2397;
    if (!_2365)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _2159;
    out.m_86.x = _2353;
    out.m_86.y = _2355;
    out.m_86.z = _2351;
    out.m_86.w = _2381;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2365)
    {
        _2385 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2409 = _2385;
    float _2411 = _2409;
    float _2413 = _2409;
    if (!_2365)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2415 = _2387;
    float _2417 = _2415;
    float _2419 = _2415;
    if (!_2365)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2421 = _2389;
    bool _2423 = !_2365;
    float _2425 = _2421;
    float _2427 = _2421;
    if (!_2423)
    {
        bool _2429 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2431 = isnan(_1199);
        bool _2433 = _2429 || _2431;
        bool _2435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2437 = _2433 || _2435;
        if (!_2437)
        {
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2441 = _1199 + _2439;
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2445 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2443;
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2451 = 1.0 / _2445;
            float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2469 = _2441 * _2451;
            float _2471 = precise::clamp(_2469, 0.0, 1.0);
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2477 = fma(_2471, _2449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2479 = fma(_2471, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2481 = fma(_2471, _2455, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2483 = fma(_2471, _2459, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2485 = fma(_2471, _2463, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2487 = fma(_2471, _2467, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2427 = _2481;
            _2407 = _2485;
            _2419 = _2477;
            _2401 = _2483;
            _2395 = _2479;
            _2413 = _2487;
            _2489 = true;
        }
        else
        {
            bool _2491 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2493 = isnan(_1199);
            bool _2495 = _2491 || _2493;
            bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2499 = _2495 || _2497;
            if (!_2499)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2501 = _2417;
            _2419 = _2501;
            if (!_2499)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2503 = _2425;
            _2427 = _2503;
            if (!_2499)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2505 = _2393;
            _2395 = _2505;
            if (!_2499)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2507 = _2399;
            _2401 = _2507;
            if (!_2499)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2509 = _2405;
            _2407 = _2509;
            if (!_2499)
            {
                _2411 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2511 = _2411;
            bool _2513 = !_2499;
            _2413 = _2511;
            if (!_2513)
            {
                bool _2515 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2517 = isnan(_1199);
                bool _2519 = _2515 || _2517;
                bool _2521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2523 = _2519 || _2521;
                if (!_2523)
                {
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2527 = _1199 + _2525;
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2529;
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2537 = 1.0 / _2531;
                    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2555 = _2527 * _2537;
                    float _2557 = precise::clamp(_2555, 0.0, 1.0);
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2563 = fma(_2557, _2535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2565 = fma(_2557, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2567 = fma(_2557, _2541, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2569 = fma(_2557, _2545, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2571 = fma(_2557, _2549, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2573 = fma(_2557, _2553, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2427 = _2567;
                    _2407 = _2571;
                    _2419 = _2563;
                    _2401 = _2569;
                    _2395 = _2565;
                    _2413 = _2573;
                    _2489 = true;
                }
                else
                {
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2413 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2489 = false;
    float _2575 = _2427;
    float _2577 = _2407;
    float _2579 = _2419;
    float _2581 = _2401;
    float _2583 = _2395;
    float _2585 = _2413;
    float _2587 = fma(_2329, -0.5, 0.5);
    float _2589 = precise::clamp(_2587, 0.0, 1.0);
    float _2591 = -_2575;
    float _2593 = _2591 + _2577;
    float _2595 = -_2579;
    float _2597 = _2595 + _2581;
    float _2599 = -_2583;
    float _2601 = _2599 + _2585;
    bool _2603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2605 = fma(_2589, _2593, _2575);
    float _2607 = fma(_2589, _2597, _2579);
    float _2609 = fma(_2589, _2601, _2583);
    float _2611 = _2605 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _2613 = fma(_2607, 0.298911988735198974609375, _2611);
    float _2615 = fma(_2609, 0.114477999508380889892578125, _2613);
    float _2617 = -_2615;
    float _2619 = _2607 + _2617;
    float _2621 = -_2615;
    float _2623 = _2605 + _2621;
    float _2625 = -_2615;
    float _2627 = _2609 + _2625;
    float _2629 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2631 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    float _2635 = fma(_2627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    out.m_49.x = _2629;
    out.m_90.x = _2631;
    out.m_90.y = _2633;
    out.m_90.z = _2635;
    if (!_2603)
    {
        return out;
    }
    float _2637 = -_1157;
    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2641 = -_1159;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2645 = -_1161;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2649 = _2639 * _2639;
    float _2651 = fma(_2643, _2643, _2649);
    float _2653 = fma(_2647, _2647, _2651);
    float _2655 = sqrt(_2653);
    float _2657 = rsqrt(_2653);
    float _2659 = -_2655;
    float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2663 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = _2643 * _2657;
    float _2669 = _2639 * _2657;
    float _2671 = abs(_2665);
    float _2673 = log2(_2671);
    float _2675 = _2647 * _2657;
    float _2677 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2679 = _2329 * _2669;
    float _2681 = -_2669;
    float _2683 = -_2677;
    float _2685 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2683);
    float _2687 = fma(_2327, _2667, _2679);
    float _2689 = -_2675;
    float _2691 = fma(_2689, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2685);
    float _2693 = fma(_2333, _2675, _2687);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2699 = _2691 + _2697;
    float _2701 = _2673 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2703 = _2699 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2705 = precise::clamp(_2703, 0.0, 1.0);
    float _2707 = exp2(_2701);
    float _2709 = _2707 * _2705;
    float _2711 = _2695 * _2709;
    float _2713 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2715 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2717 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _2713;
    out.m_88.y = _2715;
    out.m_88.z = _2717;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2489 = false;
    bool _407 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2774 = as_type<float>(_125);
        out.gl_Position.z = _2774;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_163);
        out.gl_Position.z = _2843;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = in.m_62.x;
    float _187 = in.m_62.y;
    float _189 = in.m_62.z;
    int _191 = as_type<int>(_165) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_165) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _201 = !_193;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _169 * _175;
    float _211 = _169 * _181;
    float _213 = fma(_167, _173, _209);
    float _215 = _169 * _187;
    float _217 = fma(_167, _179, _211);
    float _219 = fma(_171, _177, _213);
    float _221 = fma(_167, _185, _215);
    float _223 = fma(_171, _183, _217);
    float _225 = fma(_171, _189, _221);
    bool _227 = !_199;
    float _229 = _179;
    float _231 = _183;
    float _233 = _225;
    float _235 = _223;
    float _253;
    if (!_227)
    {
        float _237 = in.m_64.x;
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_109);
        float _259 = 1.0 / _257;
        float _261 = _143 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _287;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _299 * _303;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _323 = 1.0 / _283;
    float _325 = -_299;
    float _327 = _325 + 1.0;
    float _329 = _317 * _327;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = _267 * _323;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _263 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _305;
    float _355 = fma(_347, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = fma(_337, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = _355 * _329;
    float _367 = _357 * _329;
    float _369 = fma(_361, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _375 = fma(_369, _319, _371);
    float _377 = fma(_363, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_321;
    float _403;
    float _405;
    if (!_383)
    {
        float _385 = in.m_64.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _389 = float(_109);
        float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _395 = _393 * _387;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _389;
        _405 = _401;
        _407 = true;
    }
    else
    {
        float _409 = float(_109);
        float _411 = 1.0 / _409;
        float _413 = _143 * _411;
        _403 = _409;
        _405 = _413;
    }
    _407 = false;
    float _415 = _403;
    float _417 = _405;
    float _419 = in.m_64.z;
    float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _423 = log2(_421);
    float _425 = in.m_64.x;
    float _427 = in.m_64.y;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _439 = _437 != 0;
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _443 = int(_441);
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _447 = !_431;
    int _449 = _447 ? 0 : 1;
    float _451 = _423 * _143;
    bool _453 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _461 = _457 || _459;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _465 = exp2(_451);
    float _467 = _419 * 2.0;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = _427 + _425;
    float _473 = _427 * 2.0;
    float _475 = _425 * 2.0;
    float _477 = floor(_467);
    float _479 = _471 + (-1.0);
    float _481 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _483 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _485 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _487 = _427 + _419;
    float _489 = -_445;
    float _491 = fma(_481, 2.0, _489);
    float _493 = floor(_473);
    float _495 = _487 + (-1.0);
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _483);
    float _503 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _505 = !_435;
    int _507 = _505 ? 0 : 1;
    float _509 = floor(_475);
    bool _511 = _477 > 0.0;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _515 = _477 >= 0.0;
    bool _517 = isnan(_477);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = -_143;
    float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _491);
    float _529 = _461 ? _499 : 0.0;
    float _531 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[78].w, _513);
    int _533 = _523 ? 0 : 1;
    bool _535 = _493 > 0.0;
    float _537 = _427 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _539 = _493 >= 0.0;
    bool _541 = isnan(_493);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _531);
    int _551 = ~_533;
    int _553 = _551 + 1;
    int _555 = _553 + 1;
    float _557 = fma(_537, -2.0, _463);
    int _559 = _555;
    if (!_511)
    {
        int _561 = ~_533;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    bool _567 = _509 > 0.0;
    float _569 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _557);
    bool _571 = _509 >= 0.0;
    bool _573 = isnan(_509);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = float(_443);
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _585 = int(_583);
    bool _587 = !_439;
    int _589 = _587 ? 0 : 1;
    int _591 = _579 ? 0 : 1;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _595 = _593 != 0;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _603 = _601 != 0;
    bool _605 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(1.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    float _619 = 1.0 / _581;
    bool _621 = !_595;
    int _623 = _621 ? 0 : 1;
    float _625 = float(_565);
    int _627 = abs(_623);
    float _629 = float(_585);
    float _631 = 1.0 / _617;
    float _633 = in.m_66.x;
    float _635 = in.m_66.y;
    float _637 = in.m_66.z;
    float _639 = float(_627);
    bool _641 = !_599;
    int _643 = _641 ? 0 : 1;
    float _645 = _629 * _143;
    int _647 = ~_591;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = _639 * _625;
    float _655 = _619 * _143;
    int _657 = _651;
    if (!_567)
    {
        int _659 = ~_591;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _425 + (-0.5);
    int _667 = _547 ? 0 : 1;
    float _669 = float(_663);
    if (_613)
    {
        float _671 = _529 * _631;
        _147 = _671;
    }
    float _673 = _147;
    int _675 = abs(_643);
    float _677 = _653 * (-2.0);
    float _679 = float(_675);
    float _681 = fma(_677, _633, _633);
    float _683 = _679 * _669;
    bool _685 = !_603;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_485, _677, _485);
    int _691 = ~_667;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    float _697 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[196].x, _681);
    float _699 = _683 * (-2.0);
    int _701 = _695;
    if (!_535)
    {
        int _703 = ~_667;
        int _705 = _703 + 1;
        _701 = _705;
    }
    int _707 = _701;
    int _709 = abs(_687);
    float _711 = fma(_689, _673, _697);
    float _713 = fma(_699, _635, _635);
    float _715 = _427 + (-0.5);
    float _717 = float(_707);
    float _719 = fma(_503, _699, _503);
    float _721 = float(_709);
    float _723 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _725 = _419 + _425;
    float _727 = _711 * 0.15915493667125701904296875;
    float _729 = _419 + (-0.5);
    float _731 = _721 * _717;
    float _733 = _725 + (-1.0);
    float _735 = fma(_719, _673, _723);
    float _737 = _727 * 6.283185482025146484375;
    float _739 = cos(_737);
    float _741 = _731 * (-2.0);
    float _743 = in.m_68.x;
    float _745 = in.m_68.y;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _749 = _735 * 0.15915493667125701904296875;
    float _751 = fma(_741, _637, _637);
    float _753 = fma(_747, _741, _747);
    float _755 = in.m_46.x;
    float _757 = in.m_46.y;
    float _759 = in.m_46.z;
    float _761 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _751);
    float _763 = _749 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_753, _673, _761);
    float _769 = _767 * 0.15915493667125701904296875;
    float _771 = _749 * 6.283185482025146484375;
    float _773 = cos(_771);
    float _775 = _727 * 6.283185482025146484375;
    float _777 = sin(_775);
    float _779 = _381 * _745;
    float _781 = _379 * _743;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _787 = _779 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = _781 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = _187 * _757;
    float _793 = _769 * 6.283185482025146484375;
    float _795 = cos(_793);
    float _797 = _787 * _783;
    float _799 = _789 * _785;
    float _801 = _739 * _773;
    float _803 = _739 * _765;
    float _805 = in.m_62.w;
    float _807 = fma(_185, _755, _791);
    float _809 = _175 * _757;
    float _811 = _769 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _777 * _765;
    float _817 = _777 * _773;
    float _819 = in.m_58.w;
    float _821 = fma(_173, _755, _809);
    float _823 = fma(_189, _759, _807);
    float _825 = _181 * _757;
    float _827 = _739 * _795;
    float _829 = _777 * _795;
    float _831 = _773 * _795;
    float _833 = _765 * _795;
    float _835 = _827 * _797;
    float _837 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = fma(_177, _759, _821);
    float _841 = fma(_179, _755, _825);
    float _843 = fma(_813, _801, _815);
    float _845 = -_797;
    float _847 = _813 * _845;
    float _849 = -_817;
    float _851 = fma(_813, _803, _849);
    float _853 = -_803;
    float _855 = fma(_813, _817, _853);
    float _857 = fma(_843, _799, _835);
    float _859 = _829 * _797;
    float _861 = fma(_831, _799, _847);
    float _863 = fma(_813, _815, _801);
    float _865 = fma(_851, _837, _857);
    float _867 = fma(_855, _799, _859);
    float _869 = fma(_833, _837, _861);
    float _871 = _823 + _805;
    float _873 = _865 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _875 = fma(_863, _837, _867);
    float _877 = _865 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _879 = _839 + _819;
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].x, _873);
    float _883 = _865 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].x, _877);
    float _887 = fma(_183, _759, _841);
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _881);
    float _891 = in.m_60.w;
    float _893 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _885);
    float _895 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].x, _883);
    float _897 = _889 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _899 = _893 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _895);
    float _903 = _871 + _897;
    float _905 = _879 + _899;
    float _907 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _911 = _903 + _909;
    float _913 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _915 = _905 + _913;
    float _917 = _911 * _911;
    float _919 = fma(_915, _915, _917);
    float _921 = sqrt(_919);
    float _923 = _887 + _891;
    float _925 = _923 + _907;
    bool _927 = _921 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _929 = _887;
    float _931 = _925;
    if (!_927)
    {
        _229 = _905;
    }
    float _933 = _229;
    float _935 = _933;
    if (!_927)
    {
        _929 = _903;
    }
    float _937 = _929;
    float _939 = _937;
    if (!_927)
    {
        _231 = _925;
    }
    float _941 = _231;
    bool _943 = !_927;
    float _945 = _941;
    if (!_943)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _951 = _921 + _949;
        float _953 = rsqrt(_919);
        float _955 = _951 * _947;
        float _957 = _925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _959 = _955 * 0.15915493667125701904296875;
        float _961 = _959 * 6.283185482025146484375;
        float _963 = cos(_961);
        float _965 = _959 * 6.283185482025146484375;
        float _967 = sin(_965);
        float _969 = _963 + (-1.0);
        float _971 = fma(_967, _957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _973 = _969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _975 = _953 * _971;
        float _977 = fma(_925, _963, _973);
        float _979 = fma(_915, _975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _981 = fma(_911, _975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _945 = _977;
        _935 = _979;
        _939 = _981;
    }
    float _983 = _945;
    float _985 = _935;
    float _987 = _939;
    float _989 = -_923;
    float _991 = _989 + _983;
    float _993 = -_879;
    float _995 = _993 + _985;
    float _997 = -_871;
    float _999 = _997 + _987;
    float _1001 = _991 * _991;
    bool _1003 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1005 = isnan(0.5);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1011 = _1007 || _1009;
    float _1013 = fma(_995, _995, _1001);
    float _1015 = fma(_999, _999, _1013);
    float _1017 = sqrt(_1015);
    bool _1019 = _1017 > 0.0;
    bool _1021 = !_1019;
    float _1023 = _985;
    float _1025 = _983;
    float _1027 = _987;
    float _1029 = _991;
    float _1031 = _999;
    if (!_1021)
    {
        float _1033 = _223 * _223;
        float _1035 = fma(_219, _219, _1033);
        float _1037 = rsqrt(_1015);
        float _1039 = fma(_225, _225, _1035);
        float _1041 = sqrt(_1039);
        float _1043 = _995 * _1037;
        float _1045 = _991 * _1037;
        float _1047 = _999 * _1037;
        bool _1049 = _1041 > 0.0;
        bool _1051 = !_1049;
        _931 = _1047;
        if (!_1051)
        {
            float _1053 = rsqrt(_1039);
            float _1055 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1057 = _223 * _1053;
            float _1059 = _219 * _1053;
            float _1061 = _225 * _1053;
            float _1063 = _1045 * _1057;
            float _1065 = fma(_1043, _1059, _1063);
            float _1067 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1069 = fma(_1047, _1061, _1065);
            float _1071 = _1069 * _1067;
            float _1073 = fma(_219, _1071, _985);
            float _1075 = fma(_223, _1071, _983);
            float _1077 = fma(_225, _1071, _987);
            _1023 = _1073;
            _1025 = _1075;
            _1027 = _1077;
            _1029 = _1067;
        }
    }
    float _1079 = _1023;
    float _1081 = _1025;
    float _1083 = _1027;
    float _1085 = _931;
    float _1087 = _1029;
    float _1089 = _1085;
    float _1091 = _1083;
    float _1093 = _1087;
    if (_1011)
    {
        _233 = _1079;
    }
    float _1095 = _233;
    float _1097 = _1095;
    if (_1011)
    {
        _1031 = _1081;
    }
    float _1099 = _1031;
    float _1101 = _1099;
    if (_1011)
    {
        _1089 = _1083;
    }
    float _1103 = _1089;
    float _1105 = _1103;
    if (!_1011)
    {
        float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1109 = _923 + _1107;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1113 = _879 + _1111;
        float _1115 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1117 = -_879;
        float _1119 = _1117 + _1079;
        float _1121 = _1109 * _1109;
        float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1125 = _871 + _1123;
        float _1127 = -_923;
        float _1129 = _1127 + _1081;
        float _1131 = -_871;
        float _1133 = _1131 + _1083;
        float _1135 = fma(_1113, _1113, _1121);
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1139 = fma(_1125, _1125, _1135);
        float _1141 = sqrt(_1139);
        float _1143 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1147 = _1145 * _1137;
        float _1149 = _1143 * _1147;
        float _1151 = fma(_1119, _1149, _879);
        float _1153 = fma(_1129, _1149, _923);
        float _1155 = fma(_1133, _1149, _871);
        _1101 = _1153;
        _1097 = _1151;
        _1105 = _1155;
        _1091 = _1133;
    }
    float _1157 = _1101;
    float _1159 = _1097;
    float _1161 = _1105;
    float _1163 = _1091;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1167 = _1157 + _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1175 = _1161 + _1173;
    float _1177 = _1167 * _1167;
    float _1179 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1181 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1183 = fma(_1171, _1171, _1177);
    float _1185 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1179);
    float _1187 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1181);
    float _1189 = fma(_1175, _1175, _1183);
    float _1191 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1185);
    float _1193 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1187);
    float _1195 = rsqrt(_1189);
    float _1197 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1199 = sqrt(_1189);
    float _1201 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1203 = _1171 * _1201;
    float _1205 = _1175 * _1201;
    float _1207 = _1203 * _1203;
    float _1209 = _1205 * _1205;
    float _1211 = _1207 + _1209;
    float _1213 = sqrt(_1211);
    bool _1215 = _1213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = _1213 + _1217;
    float _1221 = _1081;
    float _1223 = _1211;
    float _1225 = _1219;
    float _1227 = _1167;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1231 = _1203;
    float _1233 = _1205;
    float _1235 = _1207;
    float _1237 = _1209;
    if (_1215)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1221 = _1239;
    }
    float _1241 = _1221;
    if (_1215)
    {
        float _1243 = rsqrt(_1211);
        _1223 = _1243;
    }
    float _1245 = _1223;
    if (_1215)
    {
        float _1247 = _1219 * _1241;
        _1225 = _1247;
    }
    float _1249 = _1225;
    if (_1215)
    {
        float _1251 = _1249 * 0.15915493667125701904296875;
        _235 = _1251;
    }
    float _1253 = _235;
    float _1255 = _1163;
    float _1257 = _1253;
    if (_1215)
    {
        float _1259 = _1253 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        _1255 = _1261;
    }
    float _1263 = _1255;
    float _1265 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1267 = precise::max(0.0, _1265);
    float _1269 = _1241;
    if (_1215)
    {
        float _1271 = _1253 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = -_1201;
    float _1279 = -_1267;
    float _1281 = fma(_1167, _1277, _1279);
    float _1283 = fma(_879, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1215)
    {
        float _1285 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1285;
    }
    float _1287 = _1227;
    float _1289 = _1263;
    if (_1215)
    {
        float _1291 = fma(_1263, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1289 = _1291;
    }
    float _1293 = _1289;
    float _1295 = floor(_1283);
    float _1297 = _1293;
    if (_1215)
    {
        float _1299 = _1275 + (-1.0);
        _1229 = _1299;
    }
    float _1301 = _1229;
    if (_1215)
    {
        float _1303 = _1245 * _1293;
        _1093 = _1303;
    }
    float _1305 = _1093;
    if (!_1215)
    {
        _1297 = _1281;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (_1215)
    {
        float _1311 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1257 = _1311;
    }
    float _1313 = _1257;
    if (_1215)
    {
        float _1315 = _1203 * _1305;
        _1231 = _1315;
    }
    float _1317 = _1231;
    if (_1215)
    {
        float _1319 = _1205 * _1305;
        _1233 = _1319;
    }
    float _1321 = _1233;
    float _1323 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1215)
    {
        float _1325 = fma(_1281, _1275, _1313);
        _1309 = _1325;
    }
    float _1327 = _1309;
    if (_1215)
    {
        float _1329 = _1317 * _1317;
        _1235 = _1329;
    }
    float _1331 = _1235;
    if (_1215)
    {
        float _1333 = _1321 * _1321;
        _1237 = _1333;
    }
    float _1335 = _1237;
    float _1337 = fma(_1327, _1327, _1331);
    float _1339 = fma(_871, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1341 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1343 = _1337 + _1335;
    float _1345 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1323);
    float _1347 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1349 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1341);
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1353 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1351);
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1345);
    float _1359 = rsqrt(_1343);
    float _1361 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1349);
    float _1363 = -_1355;
    float _1365 = _1363 + 1.0;
    float _1367 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = _1197 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1371 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1373 = -_1295;
    float _1375 = _1283 + _1373;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = abs(_1365);
    float _1381 = log2(_1379);
    float _1383 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1385 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1389 = -_1369;
    float _1391 = fma(_1389, _1347, 1.0);
    float _1393 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1397 = _1359 * _1317;
    float _1399 = _1359 * _1321;
    float _1401 = floor(_1339);
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1405 = _1359 * _1327;
    float _1407 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1383);
    float _1411 = _1405 + 1.0;
    float _1413 = -_1407;
    float _1415 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1413);
    float _1417 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1419 = 1.0 / _1403;
    float _1421 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1423 = -_1399;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1415);
    float _1427 = fma(_1425, -0.5, 0.5);
    float _1429 = -_1401;
    float _1431 = _1339 + _1429;
    float _1433 = exp2(_1417);
    float _1435 = fma(_1425, 0.5, 0.5);
    float _1437 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1385);
    float _1439 = fma(_1435, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1441 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1437);
    float _1443 = log2(_1391);
    float _1445 = fma(_1435, _1439, -0.212114393711090087890625);
    float _1447 = fma(_1435, _1445, 1.570728778839111328125);
    float _1449 = sqrt(_1427);
    float _1451 = -_1405;
    float _1453 = fma(_1433, _1411, _1451);
    float _1455 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1421);
    float _1457 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1441);
    float _1459 = fma(_1453, 0.5, 0.5);
    float _1461 = _1455 * _1419;
    float _1463 = _1457 * _1419;
    float _1465 = _1443 * 0.693147182464599609375;
    float _1467 = fma(_1463, -0.5, 0.5);
    float _1469 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1471 = _1449 * 0.636619746685028076171875;
    float _1473 = fma(_1461, 0.5, 0.5);
    float _1475 = -_1447;
    float _1477 = fma(_1471, _1475, 1.0);
    float2 _4852 = float2(_1375, _1431);
    float _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4852, float2(0.0), isnan(_4852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4852, float2(0.0), isnan(_4852)), level(0.0)).x;
    float3 _4863 = float3(_1473, _1467, _1469);
    float _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).x;
    float3 _4874 = float3(_1473, _1467, _1469);
    float4 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).xyzw;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    float _1492 = _1484.w;
    float2 _4890 = float2(_1477, _1459);
    float3 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4890, float2(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4890, float2(0.0), isnan(_4890)), level(0.0)).xyz;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = float(uint(_585));
    float _1506 = trunc(_655);
    int _1508 = int(_1506);
    int _1510 = abs(_449);
    float _1512 = -_549;
    float _1514 = _1512 + 1.0;
    bool _1516 = _425 > 0.5;
    float _1518 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1520 = _427 > 0.5;
    float _1522 = 1.0 / _1504;
    float _1524 = float(uint(_1508));
    float _1526 = 1.0 / _415;
    int _1528 = as_type<int>(_1522) + (-2);
    float _1530 = exp2(_1518);
    float _1532 = as_type<float>(_1528) * _1524;
    int _1534 = ~_585;
    int _1536 = _1534 + 1;
    int _1538 = ~_585;
    int _1540 = _1538 + 1;
    float _1542 = trunc(_1532);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    float _1549 = -_1530;
    float _1551 = _1549 + 1.0;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1555 = _1536 * int(_1547);
    int _1557 = _1555 + _1508;
    float _1559 = float(uint(_1557));
    float _1561 = as_type<float>(_1528) * _1559;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1565 = _1563 != 0;
    float _1567 = float(_1508);
    float _1569 = trunc(_1561);
    float _1571 = precise::max(_1569, 0.0);
    uint _1573 = uint(_1571);
    bool _1575 = !_1565;
    float _1577 = _1575 ? 7.345489978790283203125 : 1.0;
    bool _1579 = _1567 >= _629;
    bool _1581 = isnan(_1567);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan(_629);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1577 * _425;
    float _1593 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1597 = trunc(_1589);
    int _1599 = int(_1597);
    float _1601 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1603 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1601);
    int _1605 = int(_1547) + int(_1573);
    float _1607 = floor(_1591);
    float _1609 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1611 = _1540 * _1605;
    int _1613 = _1611 + _1508;
    bool _1615 = uint(_1613) >= uint(_585);
    bool _1617 = !_1615;
    int _1619 = _1617 ? 0 : (-1);
    bool _1621 = _585 == 0;
    float _1623 = -_1607;
    float _1625 = _1591 + _1623;
    int _1627 = ~_1605;
    int _1629 = _1627 + _1619;
    int _1631 = _1629 + 1;
    float _1633 = _645 * _1526;
    int _1635 = ~_1599;
    int _1637 = _1635 + 1;
    int _1639 = _1637 + 1;
    float _1641 = _1625 * _629;
    int _1643 = _585 * _1631;
    int _1645 = _1643 + _1508;
    int _1647 = _585 + (-1);
    float _1649 = trunc(_1633);
    int _1651 = int(_1649);
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1655 = _1653 != 0;
    bool _1657 = !_1621;
    int _1659 = _1657 ? _1645 : (-1);
    bool _1661 = !_1655;
    int _1663 = _1661 ? 0 : 1;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1667 = _1665 != 0;
    float _1669 = trunc(_1641);
    int _1671 = int(_1669);
    int _1673 = _1659 * _1639;
    int _1675 = abs(_507);
    int _1677 = abs(_1663);
    int _1679 = _1599 * _1647;
    int _1681 = _1679 + _1673;
    bool _1683 = !_1667;
    int _1685 = _1683 ? 0 : 1;
    float _1687 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1595);
    int _1689 = abs(_589);
    int _1691 = _1681 * _1675;
    float _1693 = 1.0 / _1609;
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1701 = _1699 != 0;
    int _1703 = _1651 * _1510;
    int _1705 = _1703 + _1691;
    int _1707 = _1671 * _1677;
    int _1709 = _1707 + _1508;
    int _1711 = abs(_1685);
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1719 = _1717 != 0;
    int _1721 = _1709 * _1689;
    int _1723 = _1721 + _1705;
    int _1725 = ~_585;
    int _1727 = _1725 + 1;
    float _1729 = 1.0 / _1715;
    int _1731 = _1671 * _1711;
    int _1733 = _1731 + _1723;
    float _1735 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    bool _1737 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1739 = isnan(_417);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1751 = _1749 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1753 = float(uint(_1733));
    float _1755 = float(uint(_1709));
    float _1757 = 1.0 / _1751;
    float _1759 = as_type<float>(_1528) * _1753;
    float _1761 = trunc(_1759);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1775 = _1769 * _1729;
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1779 = _417 + _1777;
    float _1781 = _1773 * _1757;
    float _1783 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1785 = fma(_1775, _1779, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1787 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1789 = isnan(_417);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1795 = _1791 || _1793;
    float _1797 = float(_1795);
    float _1799 = _1783 + _1609;
    int _1801 = _1727 * int(_1765);
    int _1803 = _1801 + _1733;
    float _1805 = -_1797;
    float _1807 = _1805 + 1.0;
    float _1809 = _1799 * _1693;
    float _1811 = _1809 * 0.5;
    float _1813 = -_1747;
    float _1815 = _1813 + 1.0;
    float _1817 = float(uint(_1803));
    bool _1819 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1821 = isnan(_417);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1833 = _417 + _1831;
    float _1835 = as_type<float>(_1528) * _1817;
    float _1837 = _1829 * _1807;
    float _1839 = -_1829;
    float _1841 = _1839 + 1.0;
    float _1843 = trunc(_1835);
    float _1845 = precise::max(_1843, 0.0);
    uint _1847 = uint(_1845);
    float _1849 = -_203;
    int _1851 = _1516 ? as_type<int>(_1849) : as_type<int>(_203);
    float _1853 = fma(_1781, _1833, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1855 = _1747 * _1841;
    bool _1857 = !_1701;
    float _1859 = _1857 ? _203 : as_type<float>(_1851);
    float _1861 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1863 = _1785 * _1855;
    float _1865 = as_type<float>(_1528) * _1755;
    int _1867 = ~_585;
    int _1869 = _1867 + 1;
    float _1871 = _1859 + 0.5;
    int _1873 = ~_585;
    int _1875 = _1873 + 1;
    float _1877 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1863);
    float _1879 = trunc(_1865);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    float _1885 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[80].x, _527);
    int _1887 = int(_1765) + int(_1847);
    float _1889 = fma(_1853, _1837, _1877);
    float _1891 = -_207;
    int _1893 = _1520 ? as_type<int>(_1891) : as_type<int>(_207);
    int _1895 = _1869 * _1887;
    int _1897 = _1895 + _1733;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1901 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1899);
    bool _1903 = !_1719;
    float _1905 = _1903 ? _207 : as_type<float>(_1893);
    float _1907 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1889);
    bool _1909 = uint(_1897) >= uint(_585);
    float _1911 = 1.0 / _1901;
    float _1913 = _1905 + (-0.5);
    int _1915 = _1875 * int(_1883);
    int _1917 = _1915 + _1709;
    bool _1919 = !_1909;
    int _1921 = _1919 ? 0 : (-1);
    float _1923 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1925 = -_1913;
    float _1927 = -_569;
    float _1929 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1927);
    float _1931 = _1907 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1933 = ~_1887;
    int _1935 = _1933 + _1921;
    int _1937 = _1935 + 1;
    float _1939 = -_501;
    float _1941 = _1939 + 1.0;
    float _1943 = float(uint(_1917));
    float _1945 = fma(_1905, _1514, _1929);
    float _1947 = -_1941;
    float _1949 = fma(_1859, _1947, _1885);
    int _1951 = _585 * _1937;
    int _1953 = _1951 + _1733;
    float _1955 = as_type<float>(_1528) * _1943;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1911 * _1957;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1963 = trunc(_1955);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1973 = !_1621;
    int _1975 = _1973 ? _1953 : (-1);
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1979 = abs(_1959);
    float _1981 = log2(_1979);
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1985 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1987 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1991 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1997 = int(_1883) + int(_1967);
    float _1999 = _1989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _1985;
    out.m_70.y = _1987;
    out.m_70.z = _1991;
    out.m_70.w = _1923;
    int _2001 = ~_585;
    int _2003 = _2001 + 1;
    out.m_72.x = _1993;
    out.m_72.y = _1999;
    out.m_72.z = _1995;
    out.m_72.w = _1931;
    int _2005 = _1975 & 3;
    bool _2007 = _2005 != 0;
    float _2009 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2011 = _1975 >> 31;
    out.m_74.x = _1949;
    out.m_74.y = _1945;
    bool _2013 = _1959 <= 8000.0;
    bool _2015 = isnan(_1959);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(8000.0);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    int _2025 = _2011 & 3;
    float _2027 = exp2(_2009);
    float _2029 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2031 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2033 = _1975 + _2025;
    float _2035 = -_813;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2029);
    float _2039 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2041 = _2003 * _1997;
    int _2043 = _2041 + _1709;
    int _2045 = _2033 >> 2;
    float _2047 = -_813;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2031);
    float _2051 = -_813;
    float _2053 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2039);
    float _2055 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2057 = _2045 << 4;
    int _2059 = _2057 + 368;
    float _2061 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2063 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2065 = uint(_2043) >= uint(_585);
    uint _2067 = uint(int(uint(_2059) >> uint(2)));
    uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
    int _2071 = int(_2067) & 3;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[int(_2069)][_2071];
    int _2075 = int(_2067) + 1;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    int _2079 = _2075 & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    float _2083 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2085 = precise::clamp(_2083, 0.0, 1.0);
    float _2087 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2053);
    float _2089 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2055);
    float _2091 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2093 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2061);
    float _2095 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2063);
    float _2097 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2049);
    float _2099 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2091);
    int _2101 = _1975 & 3;
    bool _2103 = _2101 != 0;
    int _2105 = _2059 + 8;
    uint _2107 = uint(int(uint(_2105) >> uint(2)));
    uint _2109 = uint(int(uint(int(_2107)) >> uint(2)));
    int _2111 = int(_2107) & 3;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[int(_2109)][_2111];
    int _2115 = int(_2107) + 1;
    uint _2117 = uint(int(uint(_2115) >> uint(2)));
    int _2119 = _2115 & 3;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[int(_2117)][_2119];
    float _2123 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2125 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2127 = uint(_2101) > 1u;
    float _2129 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2131 = _2123 * _2097;
    int _2133 = _2007 ? 0 : 1;
    float _2135 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2037);
    float _2137 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2125);
    float _2139 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2129);
    int _2141 = ~_2133;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    float _2147 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2089);
    float _2149 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2093);
    bool _2151 = uint(_2101) >= 2u;
    float _2153 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2095);
    int _2155 = _2145;
    float _2157 = _1403;
    float _2159 = _1457;
    if (!_2127)
    {
        int _2161 = ~_2133;
        int _2163 = _2161 + 1;
        _2155 = _2163;
    }
    int _2165 = _2155;
    float _2167 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2099);
    bool _2169 = _2101 != 3;
    float _2171 = fma(_2085, -2.0, 3.0);
    float _2173 = _2085 * _2085;
    int _2175 = abs(_2165);
    float _2177 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    bool _2179 = !_2103;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = _2173 * _2171;
    int _2185 = _2151 ? 0 : 1;
    float _2187 = fma(_1861, _2147, _2131);
    bool _2189 = _2101 != 3;
    float _2191 = _2123 * _2135;
    int _2193 = ~_2175;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = _2123 * _2087;
    bool _2201 = !_2065;
    int _2203 = _2201 ? 0 : (-1);
    float _2205 = fma(_1861, _2149, _2191);
    int _2207 = abs(_2181);
    float _2209 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2139);
    int _2211 = ~_2185;
    int _2213 = _2211 + 1;
    int _2215 = _2213 + 1;
    float _2217 = -_1479;
    float _2219 = _2217 + 1.0;
    bool _2221 = !_2189;
    int _2223 = _2221 ? 0 : (-1);
    int _2225 = _2197 * as_type<int>(_2081);
    int _2227 = _2215;
    if (_2169)
    {
        int _2229 = ~_2185;
        int _2231 = _2229 + 1;
        _2227 = _2231;
    }
    int _2233 = _2227;
    float _2235 = _1553 * _1481;
    int _2237 = ~_1997;
    int _2239 = _2237 + _2203;
    int _2241 = _2239 + 1;
    bool _2243 = !_1697;
    int _2245 = _2243 ? 0 : 1;
    int _2247 = abs(_2223);
    int _2249 = _585 * _2241;
    int _2251 = _2249 + _1709;
    int _2253 = abs(_2233);
    float _2255 = _1403 * 0.5;
    int _2257 = ~_2207;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    int _2263 = abs(_2245);
    int _2265 = _2261 * as_type<int>(_2073);
    int _2267 = _2265 + _2225;
    int _2269 = ~_2253;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    int _2275 = ~_2247;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    int _2281 = _2273 * as_type<int>(_2113);
    int _2283 = _2281 + _2267;
    int _2285 = ~_2263;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    float _2291 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2293 = _2279 * as_type<int>(_2121);
    int _2295 = _2293 + _2283;
    bool _2297 = !_1621;
    int _2299 = _2297 ? _2251 : (-1);
    float _2301 = -_2183;
    float _2303 = _2301 + 1.0;
    float _2305 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2291);
    int _2307 = _2295 * _2289;
    float _2309 = _1502 * _2235;
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2183);
    float _2313 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2305);
    int _2315 = _2299 * _2263;
    int _2317 = _2315 + _2307;
    float _2319 = fma(_1457, -0.5, _2255);
    float _2321 = in.m_76.x;
    float _2323 = _2023 * _2311;
    float _2325 = fma(_1861, _2153, _2199);
    float _2327 = _2167 + _2187;
    float _2329 = _2177 + _2205;
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2333 = _2209 + _2325;
    float _2335 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2313);
    float _2337 = _2219 * _2331;
    float _2339 = precise::clamp(_2337, 0.0, 1.0);
    float _2341 = float(_2317);
    float _2343 = _1455 + _1403;
    float _2345 = _1492 * _2235;
    float _2347 = -_2339;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1455;
    out.gl_Position.y = _1457;
    out.gl_Position.z = _2335;
    out.gl_Position.w = _1403;
    float _2351 = fma(_1492, _2309, _1490);
    float _2353 = fma(_1498, _2345, _1486);
    float _2355 = fma(_1500, _2345, _1488);
    out.m_78.x = _2341;
    bool _2357 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2359 = isnan(_1199);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2365 = _2361 || _2363;
    float _2367 = _2335 + _1403;
    out.m_80.x = _2327;
    out.m_80.y = _2329;
    out.m_80.z = _2333;
    float _2369 = _2343 * 0.5;
    float _2371 = _2349 * _2321;
    float _2373 = _2367 * 0.5;
    float _2375 = -_1553;
    float _2377 = _2375 + 1.0;
    float _2379 = _2371 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2369;
    out.m_82.y = _2319;
    out.m_82.z = _2373;
    out.m_82.w = _1403;
    float _2381 = _1492 * _2377;
    float _2383 = _2335;
    float _2385 = _2377;
    float _2387 = _2319;
    float _2389 = _2369;
    if (!_2365)
    {
        _2157 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2391 = _2157;
    out.m_84.x = _2379;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2365)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2397 = _2383;
    float _2399 = _2397;
    float _2401 = _2397;
    if (!_2365)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _2159;
    out.m_86.x = _2353;
    out.m_86.y = _2355;
    out.m_86.z = _2351;
    out.m_86.w = _2381;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2365)
    {
        _2385 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2409 = _2385;
    float _2411 = _2409;
    float _2413 = _2409;
    if (!_2365)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2415 = _2387;
    float _2417 = _2415;
    float _2419 = _2415;
    if (!_2365)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2421 = _2389;
    bool _2423 = !_2365;
    float _2425 = _2421;
    float _2427 = _2421;
    if (!_2423)
    {
        bool _2429 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2431 = isnan(_1199);
        bool _2433 = _2429 || _2431;
        bool _2435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2437 = _2433 || _2435;
        if (!_2437)
        {
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2441 = _1199 + _2439;
            float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2445 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2443;
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2451 = 1.0 / _2445;
            float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2469 = _2441 * _2451;
            float _2471 = precise::clamp(_2469, 0.0, 1.0);
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2477 = fma(_2471, _2449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2479 = fma(_2471, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2481 = fma(_2471, _2455, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2483 = fma(_2471, _2459, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2485 = fma(_2471, _2463, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2487 = fma(_2471, _2467, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2427 = _2481;
            _2407 = _2485;
            _2419 = _2477;
            _2401 = _2483;
            _2395 = _2479;
            _2413 = _2487;
            _2489 = true;
        }
        else
        {
            bool _2491 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2493 = isnan(_1199);
            bool _2495 = _2491 || _2493;
            bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2499 = _2495 || _2497;
            if (!_2499)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2501 = _2417;
            _2419 = _2501;
            if (!_2499)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2503 = _2425;
            _2427 = _2503;
            if (!_2499)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2505 = _2393;
            _2395 = _2505;
            if (!_2499)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2507 = _2399;
            _2401 = _2507;
            if (!_2499)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2509 = _2405;
            _2407 = _2509;
            if (!_2499)
            {
                _2411 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2511 = _2411;
            bool _2513 = !_2499;
            _2413 = _2511;
            if (!_2513)
            {
                bool _2515 = _1199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2517 = isnan(_1199);
                bool _2519 = _2515 || _2517;
                bool _2521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2523 = _2519 || _2521;
                if (!_2523)
                {
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2527 = _1199 + _2525;
                    float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2529;
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2537 = 1.0 / _2531;
                    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2555 = _2527 * _2537;
                    float _2557 = precise::clamp(_2555, 0.0, 1.0);
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2563 = fma(_2557, _2535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2565 = fma(_2557, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2567 = fma(_2557, _2541, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2569 = fma(_2557, _2545, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2571 = fma(_2557, _2549, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2573 = fma(_2557, _2553, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2427 = _2567;
                    _2407 = _2571;
                    _2419 = _2563;
                    _2401 = _2569;
                    _2395 = _2565;
                    _2413 = _2573;
                    _2489 = true;
                }
                else
                {
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2413 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2489 = false;
    float _2575 = _2427;
    float _2577 = _2407;
    float _2579 = _2419;
    float _2581 = _2401;
    float _2583 = _2395;
    float _2585 = _2413;
    float _2587 = fma(_2329, -0.5, 0.5);
    float _2589 = precise::clamp(_2587, 0.0, 1.0);
    float _2591 = -_2575;
    float _2593 = _2591 + _2577;
    float _2595 = -_2579;
    float _2597 = _2595 + _2581;
    float _2599 = -_2583;
    float _2601 = _2599 + _2585;
    bool _2603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2605 = fma(_2589, _2593, _2575);
    float _2607 = fma(_2589, _2597, _2579);
    float _2609 = fma(_2589, _2601, _2583);
    float _2611 = _2605 * 0.586610972881317138671875;
    out.m_88.x = 0.0;
    float _2613 = fma(_2607, 0.298911988735198974609375, _2611);
    float _2615 = fma(_2609, 0.114477999508380889892578125, _2613);
    float _2617 = -_2615;
    float _2619 = _2607 + _2617;
    float _2621 = -_2615;
    float _2623 = _2605 + _2621;
    float _2625 = -_2615;
    float _2627 = _2609 + _2625;
    float _2629 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2631 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    float _2635 = fma(_2627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2615);
    out.m_49.x = _2629;
    out.m_90.x = _2631;
    out.m_90.y = _2633;
    out.m_90.z = _2635;
    if (!_2603)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2637 = -_1157;
    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2641 = -_1159;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2645 = -_1161;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2649 = _2639 * _2639;
    float _2651 = fma(_2643, _2643, _2649);
    float _2653 = fma(_2647, _2647, _2651);
    float _2655 = sqrt(_2653);
    float _2657 = rsqrt(_2653);
    float _2659 = -_2655;
    float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2663 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = _2643 * _2657;
    float _2669 = _2639 * _2657;
    float _2671 = abs(_2665);
    float _2673 = log2(_2671);
    float _2675 = _2647 * _2657;
    float _2677 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2679 = _2329 * _2669;
    float _2681 = -_2669;
    float _2683 = -_2677;
    float _2685 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2683);
    float _2687 = fma(_2327, _2667, _2679);
    float _2689 = -_2675;
    float _2691 = fma(_2689, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2685);
    float _2693 = fma(_2333, _2675, _2687);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2699 = _2691 + _2697;
    float _2701 = _2673 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2703 = _2699 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2705 = precise::clamp(_2703, 0.0, 1.0);
    float _2707 = exp2(_2701);
    float _2709 = _2707 * _2705;
    float _2711 = _2695 * _2709;
    float _2713 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2715 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2717 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _2713;
    out.m_88.y = _2715;
    out.m_88.z = _2717;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

