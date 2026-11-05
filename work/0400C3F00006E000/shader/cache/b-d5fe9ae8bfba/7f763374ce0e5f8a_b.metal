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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1647 = as_type<float>(_107);
        out.gl_Position.z = _1647;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1717 = as_type<float>(_145);
        out.gl_Position.z = _1717;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _167 * 0.15915493667125701904296875;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_179;
    int _195 = _193 ? 0 : 1;
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_195);
    float _203 = -_169;
    float _205 = _157 + _203;
    int _207 = abs(_199);
    float _209 = -_205;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = !_183;
    int _215 = _213 ? 0 : 1;
    float _217 = float(_201);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_191, 0.5, 0.5);
    float _223 = abs(_211);
    float _225 = _217 * _223;
    int _227 = abs(_215);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_207);
    bool _235 = _205 < 0.5;
    float _237 = float(_235);
    float _239 = fma(_233, _231, _225);
    bool _241 = !_161;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = -_237;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = float(_227);
    float _251 = abs(_247);
    float _253 = fma(_249, _251, _239);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_91);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_49.y;
    float _285 = _147 * 2.0;
    float _287 = in.m_49.z;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _299 = _297 != 0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = floor(_285);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _281 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _281 + _319;
    float _323 = 1.0 / _303;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _281 + _325;
    bool _329 = !_295;
    int _331 = _329 ? 0 : 1;
    bool _333 = !_299;
    int _335 = _333 ? 0 : 1;
    float _337 = 1.0 / _309;
    float _339 = _283 * 2.0;
    bool _341 = _305 > 0.0;
    bool _343 = _305 >= 0.0;
    bool _345 = isnan(_305);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _287 * 2.0;
    bool _355 = !_291;
    int _357 = _355 ? 0 : 1;
    float _359 = 1.0 / _313;
    float _361 = _327 * _323;
    float _363 = _283 + _287;
    float _365 = _147 + _283;
    int _367 = abs(_331);
    float _369 = _363 + (-1.0);
    float _371 = _365 + (-1.0);
    float _373 = floor(_339);
    float _375 = _317 * _337;
    float _377 = _147 + _287;
    int _379 = abs(_335);
    float _381 = _377 + (-1.0);
    int _383 = abs(_357);
    float _385 = floor(_353);
    float _387 = _321 * _359;
    float _389 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _395 = _351 ? 0 : 1;
    float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _399 = log2(_397);
    bool _401 = _373 >= 0.0;
    bool _403 = isnan(_373);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    bool _415 = _373 > 0.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _421 = _409 ? 0 : 1;
    float _423 = fma(_413, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _425 = ~_395;
    int _427 = _425 + 1;
    int _429 = _427 + 1;
    float _431 = fma(_419, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _433 = _385 > 0.0;
    bool _435 = _385 >= 0.0;
    bool _437 = isnan(_385);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    int _449 = ~_421;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _459 = _443 ? 0 : 1;
    float _461 = fma(_447, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = _399 * _125;
    int _465 = _453;
    int _467 = _429;
    if (!_415)
    {
        int _469 = ~_421;
        int _471 = _469 + 1;
        _465 = _471;
    }
    int _473 = _465;
    float _475 = fma(_457, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _477 = ~_459;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = exp2(_463);
    int _485 = _481;
    if (!_341)
    {
        int _487 = ~_395;
        int _489 = _487 + 1;
        _467 = _489;
    }
    int _491 = _467;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    if (!_433)
    {
        int _497 = ~_459;
        int _499 = _497 + 1;
        _485 = _499;
    }
    int _501 = _485;
    float _503 = in.m_54.x;
    float _505 = in.m_54.y;
    float _507 = in.m_54.z;
    bool _509 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _511 = isnan(1.0);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _517 = _513 || _515;
    float _519 = 1.0 / _495;
    float _521 = float(_367);
    float _523 = float(_491);
    bool _525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = float(_379);
    float _537 = -_483;
    float _539 = _537 + 1.0;
    float _541 = _521 * _523;
    float _543 = float(_473);
    float _545 = float(_383);
    float _547 = _541 * (-2.0);
    float _549 = _533 ? _539 : 0.0;
    float _551 = _535 * _543;
    float _553 = float(_501);
    float _555 = _283 + (-0.5);
    float _557 = fma(_389, _547, _389);
    if (_517)
    {
        float _559 = _549 * _519;
        _127 = _559;
    }
    float _561 = _127;
    bool _563 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _565 = isnan(_281);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = fma(_547, _505, _505);
    float _577 = _545 * _553;
    bool _579 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_281);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _551 * (-2.0);
    float _593 = -_573;
    float _595 = _593 + 1.0;
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[196].y, _575);
    bool _599 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_281);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_393, _591, _393);
    float _613 = _589 * _595;
    float _615 = -_589;
    float _617 = _615 + 1.0;
    float _619 = fma(_557, _561, _597);
    float _621 = _577 * (-2.0);
    bool _623 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_281);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _609 * _617;
    float _637 = -_609;
    float _639 = _637 + 1.0;
    float _641 = _147 + (-0.5);
    float _643 = fma(_621, _503, _503);
    float _645 = fma(_391, _621, _391);
    float _647 = _633 * _639;
    float _649 = fma(_591, _507, _507);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[196].x, _643);
    float _653 = _423 * _647;
    float _655 = fma(_645, _561, _651);
    float _657 = _461 * _647;
    float _659 = in.m_56.x;
    float _661 = in.m_56.y;
    float _663 = -_633;
    float _665 = _663 + 1.0;
    float _667 = _655 * 0.15915493667125701904296875;
    float _669 = _287 + (-0.5);
    float _671 = in.m_42.x;
    float _673 = in.m_42.y;
    float _675 = in.m_42.z;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _681;
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _657);
    float _687 = in.m_58.x;
    float _689 = in.m_58.y;
    float _691 = in.m_58.z;
    float _693 = in.m_58.w;
    float _695 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].z, _649);
    float _697 = fma(_679, _387, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _699 = fma(_683, _387, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _701 = fma(_475, _635, _685);
    float _703 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _705 = fma(_611, _561, _695);
    float _707 = _619 * 0.15915493667125701904296875;
    float _709 = fma(_699, _613, _701);
    float _711 = fma(_431, _635, _703);
    float _713 = _705 * 0.15915493667125701904296875;
    float _715 = _707 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].y, _709);
    float _721 = fma(_697, _613, _711);
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    bool _725 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _727 = isnan(0.5);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _733 = _729 || _731;
    float _735 = _719 * _661;
    float _737 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].x, _721);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _173);
    float _741 = _707 * 6.283185482025146484375;
    float _743 = cos(_741);
    float _745 = _253 * _735;
    float _747 = _737 * _659;
    float _749 = _673 * _689;
    float _751 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _753 = _667 * 6.283185482025146484375;
    float _755 = sin(_753);
    float _757 = fma(_671, _687, _749);
    float _759 = _253 * _747;
    float _761 = _751 * _739;
    float _763 = in.m_60.x;
    float _765 = in.m_60.y;
    float _767 = in.m_60.z;
    float _769 = in.m_60.w;
    float _771 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = fma(_675, _691, _757);
    float _775 = _667 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _771 * _723;
    float _781 = _713 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _755 * _717;
    float _787 = _713 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _777 * _743;
    float _793 = _777 * _717;
    float _795 = _673 * _765;
    float _797 = _783 * _761;
    float _799 = _717 * _783;
    float _801 = _743 * _783;
    float _803 = _755 * _743;
    float _805 = _777 * _797;
    float _807 = _755 * _797;
    float _809 = fma(_671, _763, _795);
    float _811 = fma(_789, _791, _785);
    float _813 = -_761;
    float _815 = _789 * _813;
    float _817 = fma(_675, _767, _809);
    float _819 = fma(_811, _779, _805);
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = -_803;
    float _825 = fma(_789, _793, _823);
    float _827 = -_793;
    float _829 = fma(_789, _803, _827);
    float _831 = fma(_801, _779, _815);
    float _833 = fma(_789, _785, _791);
    float _835 = fma(_825, _821, _819);
    float _837 = fma(_829, _779, _807);
    float _839 = fma(_799, _821, _831);
    float _841 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _843 = fma(_833, _821, _837);
    float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _847 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _849 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _845);
    float _853 = _817 + _769;
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _849);
    float _857 = _773 + _693;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _851);
    float _861 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _847);
    float _863 = _855 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _865 = _859 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _867 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _861);
    float _869 = _857 + _863;
    float _871 = in.m_62.x;
    float _873 = in.m_62.y;
    float _875 = in.m_62.z;
    float _877 = in.m_62.w;
    float _879 = _853 + _865;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _883 = _869 + _881;
    float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _887 = _879 + _885;
    float _889 = _883 * _883;
    float _891 = fma(_887, _887, _889);
    float _893 = sqrt(_891);
    float _895 = _673 * _873;
    float _897 = _867 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _899 = fma(_671, _871, _895);
    bool _901 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = fma(_675, _875, _899);
    float _905 = _903 + _877;
    float _907 = _905 + _897;
    float _909 = _897;
    float _911 = _671;
    float _913 = _899;
    float _915 = _907;
    float _917 = _843;
    float _919 = _779;
    if (!_901)
    {
        _909 = _879;
    }
    float _921 = _909;
    float _923 = _921;
    if (!_901)
    {
        _911 = _869;
    }
    float _925 = _911;
    float _927 = _925;
    if (!_901)
    {
        _913 = _907;
    }
    float _929 = _913;
    bool _931 = !_901;
    float _933 = _929;
    if (!_931)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _939 = _893 + _937;
        float _941 = rsqrt(_891);
        float _943 = _939 * _935;
        float _945 = _907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _947 = _943 * 0.15915493667125701904296875;
        float _949 = _947 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = _947 * 6.283185482025146484375;
        float _955 = sin(_953);
        float _957 = _951 + (-1.0);
        float _959 = _957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _961 = fma(_955, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _963 = fma(_907, _951, _959);
        float _965 = _941 * _961;
        float _967 = fma(_887, _965, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _969 = fma(_883, _965, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _933 = _963;
        _923 = _967;
        _927 = _969;
    }
    float _971 = _933;
    float _973 = _923;
    float _975 = _927;
    float _977 = _971;
    float _979 = _973;
    float _981 = _975;
    if (!_733)
    {
        float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _985 = _905 + _983;
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _989 = _853 + _987;
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _993 = -_905;
        float _995 = _993 + _971;
        float _997 = _985 * _985;
        float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1001 = _857 + _999;
        float _1003 = fma(_989, _989, _997);
        float _1005 = -_853;
        float _1007 = _1005 + _973;
        float _1009 = fma(_1001, _1001, _1003);
        float _1011 = sqrt(_1009);
        float _1013 = precise::min(_1011, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1015 = _1013 * _991;
        float _1017 = -_857;
        float _1019 = _1017 + _975;
        float _1021 = fma(_1007, _1015, _853);
        float _1023 = fma(_995, _1015, _905);
        float _1025 = fma(_1019, _1015, _857);
        _977 = _1023;
        _979 = _1021;
        _981 = _1025;
    }
    float _1027 = _977;
    float _1029 = _979;
    float _1031 = _981;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = _1027 + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = _1029 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1043 = _1031 + _1041;
    float _1045 = _1035 * _1035;
    float _1047 = fma(_1039, _1039, _1045);
    float _1049 = fma(_1043, _1043, _1047);
    float _1051 = rsqrt(_1049);
    float _1053 = sqrt(_1049);
    float _1055 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1057 = _1039 * _1055;
    float _1059 = _1043 * _1055;
    float _1061 = _1057 * _1057;
    float _1063 = _1059 * _1059;
    float _1065 = _1061 + _1063;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1067 + _1071;
    float _1075 = _1043;
    float _1077 = _1045;
    float _1079 = _1073;
    float _1081 = _1055;
    if (_1069)
    {
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1075 = _1083;
    }
    float _1085 = _1075;
    if (_1069)
    {
        float _1087 = rsqrt(_1065);
        _1077 = _1087;
    }
    float _1089 = _1077;
    float _1091 = _1089;
    if (_1069)
    {
        float _1093 = _1073 * _1085;
        _1079 = _1093;
    }
    float _1095 = _1079;
    if (_1069)
    {
        float _1097 = _1095 * 0.15915493667125701904296875;
        _915 = _1097;
    }
    float _1099 = _915;
    float _1101 = _1051;
    float _1103 = _1099;
    if (_1069)
    {
        float _1105 = _1099 * 6.283185482025146484375;
        float _1107 = sin(_1105);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1113 = precise::max(0.0, _1111);
    float _1115 = _869;
    float _1117 = _1113;
    float _1119 = _1111;
    if (_1069)
    {
        float _1121 = _1099 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        _1115 = _1123;
    }
    float _1125 = _1115;
    float _1127 = -_1055;
    float _1129 = -_1113;
    float _1131 = fma(_1035, _1127, _1129);
    if (_1069)
    {
        float _1133 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1117 = _1133;
    }
    float _1135 = _1117;
    float _1137 = _1135;
    if (!_1069)
    {
        _1103 = _1061;
    }
    float _1139 = _1103;
    float _1141 = _1109;
    float _1143 = _1139;
    if (_1069)
    {
        float _1145 = fma(_1109, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    float _1149 = _1147;
    if (!_1069)
    {
        _1137 = _1059;
    }
    float _1151 = _1137;
    float _1153 = _1151;
    if (_1069)
    {
        float _1155 = _1125 + (-1.0);
        _1119 = _1155;
    }
    float _1157 = _1119;
    float _1159 = _1157;
    if (_1069)
    {
        float _1161 = _1089 * _1147;
        _917 = _1161;
    }
    float _1163 = _917;
    if (!_1069)
    {
        _1091 = _1057;
    }
    float _1165 = _1091;
    float _1167 = _1165;
    if (_1069)
    {
        float _1169 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1081 = _1169;
    }
    float _1171 = _1081;
    if (_1069)
    {
        float _1173 = _1057 * _1163;
        _1167 = _1173;
    }
    float _1175 = _1167;
    if (!_1069)
    {
        _1149 = _1131;
    }
    float _1177 = _1149;
    float _1179 = _1177;
    if (_1069)
    {
        float _1181 = _1059 * _1163;
        _1153 = _1181;
    }
    float _1183 = _1153;
    if (_1069)
    {
        float _1185 = fma(_1131, _1125, _1171);
        _1179 = _1185;
    }
    float _1187 = _1179;
    if (_1069)
    {
        float _1189 = _1175 * _1175;
        _1143 = _1189;
    }
    float _1191 = _1143;
    if (!_1069)
    {
        _1159 = _1063;
    }
    float _1193 = _1159;
    float _1195 = _1193;
    if (_1069)
    {
        float _1197 = _1183 * _1183;
        _1195 = _1197;
    }
    float _1199 = _1195;
    float _1201 = fma(_1187, _1187, _1191);
    float _1203 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1205 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1207 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1209 = _1201 + _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1213 = fma(_1053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1211);
    float _1215 = precise::clamp(_1213, 0.0, 1.0);
    float _1217 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1219 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1221 = rsqrt(_1209);
    float _1223 = -_1215;
    float _1225 = _1223 + 1.0;
    float _1227 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1217);
    float _1229 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1219);
    float _1231 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1233 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1207);
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1237 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1239 = abs(_1225);
    float _1241 = log2(_1239);
    float _1243 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1231);
    float _1247 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1249 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1251 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1253 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1245);
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1257 = _1221 * _1175;
    float _1259 = _1221 * _1187;
    float _1261 = _1221 * _1183;
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1255);
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1267 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1269 = -_1249;
    float _1271 = fma(_1269, _1205, 1.0);
    float _1273 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1263);
    float _1275 = -_1265;
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1275);
    float _1279 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1281 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1283 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1273);
    float _1285 = -_1261;
    float _1287 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1277);
    float _1289 = log2(_1271);
    float _1291 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1293 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1281);
    float _1295 = fma(_1287, -0.5, 0.5);
    float _1297 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1291);
    float _1299 = fma(_1287, 0.5, 0.5);
    float _1301 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1293);
    float _1303 = exp2(_1279);
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1297);
    float _1307 = fma(_1299, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1309 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1301);
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1305);
    float _1313 = fma(_1299, _1307, -0.212114393711090087890625);
    float _1315 = 1.0 / _1283;
    float _1317 = _1259 + 1.0;
    float _1319 = _1289 * 0.693147182464599609375;
    float _1321 = fma(_1299, _1313, 1.570728778839111328125);
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1325 = sqrt(_1295);
    float _1327 = -_1259;
    float _1329 = fma(_1303, _1317, _1327);
    float _1331 = _1309 * _1315;
    float _1333 = _1311 * _1315;
    float _1335 = fma(_1329, 0.5, 0.5);
    float _1337 = fma(_1331, 0.5, 0.5);
    float _1339 = fma(_1333, -0.5, 0.5);
    float _1341 = _1325 * 0.636619746685028076171875;
    float3 _3533 = float3(_1337, _1339, _1323);
    float _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3533, float3(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3533, float3(0.0), isnan(_3533)), level(0.0)).x;
    float _1345 = -_1321;
    float _1347 = fma(_1341, _1345, 1.0);
    float3 _3549 = float3(_1337, _1339, _1323);
    float4 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3549, float3(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3549, float3(0.0), isnan(_3549)), level(0.0)).xyzw;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = _1350.w;
    float2 _3566 = float2(_1347, _1335);
    float3 _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).xyz;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1372 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1376 = isnan(0.5);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1386 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1370);
    float _1388 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1372);
    bool _1390 = _147 > 0.5;
    float _1392 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1394 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1386);
    float _1396 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1388);
    float _1398 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1402 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1406 = 1.0 / _1400;
    float _1408 = _1402 + _1400;
    float _1410 = _1337;
    float _1412 = _1394;
    float _1414 = _1339;
    float _1416 = _1241;
    if (!_1382)
    {
        _1410 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1418;
    float _1426 = _1422;
    if (!_1382)
    {
        _919 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1428 = _919;
    float _1430 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1398);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1382)
    {
        float _1434 = -_1428;
        float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1412 = _1436;
    }
    float _1438 = _1412;
    bool _1440 = _283 > 0.5;
    float _1442 = -_243;
    int _1444 = _1390 ? as_type<int>(_1442) : as_type<int>(_243);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1448 = _1408 * _1406;
    float _1450 = _1448 * 0.5;
    if (!_1382)
    {
        float _1452 = 1.0 / _1438;
        _1414 = _1452;
    }
    float _1454 = _1414;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1458 = _1456 != 0;
    float _1460 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1382)
    {
        float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1464 = fma(_1450, _1418, _1462);
        _1424 = _1464;
    }
    float _1466 = _1424;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1470 = _1468 != 0;
    float _1472 = -_173;
    int _1474 = _1440 ? as_type<int>(_1472) : as_type<int>(_173);
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1478 = _1466;
    if (!_1382)
    {
        float _1480 = 1.0 / _1466;
        _1478 = _1480;
    }
    float _1482 = _1478;
    bool _1484 = !_1458;
    float _1486 = _1484 ? _243 : as_type<float>(_1444);
    bool _1488 = !_1470;
    float _1490 = _1488 ? _173 : as_type<float>(_1474);
    out.m_64.x = _1422;
    out.m_64.y = _1432;
    out.m_64.z = _1460;
    out.m_64.w = _1476;
    float _1492 = _1486 + 0.5;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1500 = -_1490;
    float _1502 = _1500 + 0.5;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1510 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1382)
    {
        float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1516 = -_1428;
        float _1518 = fma(_1482, _1514, _1516);
        _1416 = _1518;
    }
    float _1520 = _1416;
    if (_1382)
    {
        _1426 = 1.0;
    }
    float _1522 = _1426;
    float _1524 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1528 = _1522;
    if (!_1382)
    {
        float _1530 = _1520 * _1454;
        float _1532 = precise::clamp(_1530, 0.0, 1.0);
        _1528 = _1532;
    }
    float _1534 = _1528;
    float _1536 = exp2(_1512);
    float _1538 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1540 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1430);
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1544 = _1534 > 0.0;
    bool _1546 = isnan(_1534);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    float _1554 = _1526 * _1494;
    out.m_66.x = _1506;
    out.m_66.y = _1510;
    out.m_66.z = _1524;
    out.m_66.w = _1508;
    float _1556 = _253 * _1542;
    float _1558 = _1538 * _1384;
    out.m_68.x = _1554;
    out.m_68.y = _1558;
    float _1560 = -_1536;
    float _1562 = _1560 + 1.0;
    out.gl_Position.x = _1309;
    out.gl_Position.y = _1311;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1283;
    float _1564 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1566 = _1540 + _1283;
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1570 = _1566 * 0.5;
    out.m_45.x = _1568;
    out.m_70.z = _1570;
    out.m_70.w = _1283;
    float _1572 = _1564 * _1343;
    float _1574 = -_1564;
    float _1576 = _1574 + 1.0;
    float _1578 = _1358 * _1572;
    float _1580 = _1358 * _1576;
    float _1582 = _1368 * _1572;
    float _1584 = fma(_1364, _1578, _1352);
    float _1586 = fma(_1366, _1578, _1354);
    float _1588 = fma(_1358, _1582, _1356);
    out.m_72.x = _1584;
    out.m_72.y = _1586;
    out.m_72.z = _1588;
    out.m_72.w = _1580;
    if (_1552)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1590 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1590;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1647 = as_type<float>(_107);
        out.gl_Position.z = _1647;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1717 = as_type<float>(_145);
        out.gl_Position.z = _1717;
    }
    if (_137)
    {
        return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _167 * 0.15915493667125701904296875;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_179;
    int _195 = _193 ? 0 : 1;
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_195);
    float _203 = -_169;
    float _205 = _157 + _203;
    int _207 = abs(_199);
    float _209 = -_205;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = !_183;
    int _215 = _213 ? 0 : 1;
    float _217 = float(_201);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_191, 0.5, 0.5);
    float _223 = abs(_211);
    float _225 = _217 * _223;
    int _227 = abs(_215);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_207);
    bool _235 = _205 < 0.5;
    float _237 = float(_235);
    float _239 = fma(_233, _231, _225);
    bool _241 = !_161;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = -_237;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = float(_227);
    float _251 = abs(_247);
    float _253 = fma(_249, _251, _239);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_91);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_49.y;
    float _285 = _147 * 2.0;
    float _287 = in.m_49.z;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _299 = _297 != 0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = floor(_285);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _281 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _281 + _319;
    float _323 = 1.0 / _303;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _281 + _325;
    bool _329 = !_295;
    int _331 = _329 ? 0 : 1;
    bool _333 = !_299;
    int _335 = _333 ? 0 : 1;
    float _337 = 1.0 / _309;
    float _339 = _283 * 2.0;
    bool _341 = _305 > 0.0;
    bool _343 = _305 >= 0.0;
    bool _345 = isnan(_305);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _287 * 2.0;
    bool _355 = !_291;
    int _357 = _355 ? 0 : 1;
    float _359 = 1.0 / _313;
    float _361 = _327 * _323;
    float _363 = _283 + _287;
    float _365 = _147 + _283;
    int _367 = abs(_331);
    float _369 = _363 + (-1.0);
    float _371 = _365 + (-1.0);
    float _373 = floor(_339);
    float _375 = _317 * _337;
    float _377 = _147 + _287;
    int _379 = abs(_335);
    float _381 = _377 + (-1.0);
    int _383 = abs(_357);
    float _385 = floor(_353);
    float _387 = _321 * _359;
    float _389 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _395 = _351 ? 0 : 1;
    float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _399 = log2(_397);
    bool _401 = _373 >= 0.0;
    bool _403 = isnan(_373);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    bool _415 = _373 > 0.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _421 = _409 ? 0 : 1;
    float _423 = fma(_413, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _425 = ~_395;
    int _427 = _425 + 1;
    int _429 = _427 + 1;
    float _431 = fma(_419, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _433 = _385 > 0.0;
    bool _435 = _385 >= 0.0;
    bool _437 = isnan(_385);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    int _449 = ~_421;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _459 = _443 ? 0 : 1;
    float _461 = fma(_447, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = _399 * _125;
    int _465 = _453;
    int _467 = _429;
    if (!_415)
    {
        int _469 = ~_421;
        int _471 = _469 + 1;
        _465 = _471;
    }
    int _473 = _465;
    float _475 = fma(_457, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _477 = ~_459;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = exp2(_463);
    int _485 = _481;
    if (!_341)
    {
        int _487 = ~_395;
        int _489 = _487 + 1;
        _467 = _489;
    }
    int _491 = _467;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    if (!_433)
    {
        int _497 = ~_459;
        int _499 = _497 + 1;
        _485 = _499;
    }
    int _501 = _485;
    float _503 = in.m_54.x;
    float _505 = in.m_54.y;
    float _507 = in.m_54.z;
    bool _509 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _511 = isnan(1.0);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _517 = _513 || _515;
    float _519 = 1.0 / _495;
    float _521 = float(_367);
    float _523 = float(_491);
    bool _525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = float(_379);
    float _537 = -_483;
    float _539 = _537 + 1.0;
    float _541 = _521 * _523;
    float _543 = float(_473);
    float _545 = float(_383);
    float _547 = _541 * (-2.0);
    float _549 = _533 ? _539 : 0.0;
    float _551 = _535 * _543;
    float _553 = float(_501);
    float _555 = _283 + (-0.5);
    float _557 = fma(_389, _547, _389);
    if (_517)
    {
        float _559 = _549 * _519;
        _127 = _559;
    }
    float _561 = _127;
    bool _563 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _565 = isnan(_281);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = fma(_547, _505, _505);
    float _577 = _545 * _553;
    bool _579 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_281);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _551 * (-2.0);
    float _593 = -_573;
    float _595 = _593 + 1.0;
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[196].y, _575);
    bool _599 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_281);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_393, _591, _393);
    float _613 = _589 * _595;
    float _615 = -_589;
    float _617 = _615 + 1.0;
    float _619 = fma(_557, _561, _597);
    float _621 = _577 * (-2.0);
    bool _623 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_281);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _609 * _617;
    float _637 = -_609;
    float _639 = _637 + 1.0;
    float _641 = _147 + (-0.5);
    float _643 = fma(_621, _503, _503);
    float _645 = fma(_391, _621, _391);
    float _647 = _633 * _639;
    float _649 = fma(_591, _507, _507);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[196].x, _643);
    float _653 = _423 * _647;
    float _655 = fma(_645, _561, _651);
    float _657 = _461 * _647;
    float _659 = in.m_56.x;
    float _661 = in.m_56.y;
    float _663 = -_633;
    float _665 = _663 + 1.0;
    float _667 = _655 * 0.15915493667125701904296875;
    float _669 = _287 + (-0.5);
    float _671 = in.m_42.x;
    float _673 = in.m_42.y;
    float _675 = in.m_42.z;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _681;
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _657);
    float _687 = in.m_58.x;
    float _689 = in.m_58.y;
    float _691 = in.m_58.z;
    float _693 = in.m_58.w;
    float _695 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].z, _649);
    float _697 = fma(_679, _387, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _699 = fma(_683, _387, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _701 = fma(_475, _635, _685);
    float _703 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _705 = fma(_611, _561, _695);
    float _707 = _619 * 0.15915493667125701904296875;
    float _709 = fma(_699, _613, _701);
    float _711 = fma(_431, _635, _703);
    float _713 = _705 * 0.15915493667125701904296875;
    float _715 = _707 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].y, _709);
    float _721 = fma(_697, _613, _711);
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    bool _725 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _727 = isnan(0.5);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _733 = _729 || _731;
    float _735 = _719 * _661;
    float _737 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].x, _721);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _173);
    float _741 = _707 * 6.283185482025146484375;
    float _743 = cos(_741);
    float _745 = _253 * _735;
    float _747 = _737 * _659;
    float _749 = _673 * _689;
    float _751 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _753 = _667 * 6.283185482025146484375;
    float _755 = sin(_753);
    float _757 = fma(_671, _687, _749);
    float _759 = _253 * _747;
    float _761 = _751 * _739;
    float _763 = in.m_60.x;
    float _765 = in.m_60.y;
    float _767 = in.m_60.z;
    float _769 = in.m_60.w;
    float _771 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = fma(_675, _691, _757);
    float _775 = _667 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _771 * _723;
    float _781 = _713 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _755 * _717;
    float _787 = _713 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _777 * _743;
    float _793 = _777 * _717;
    float _795 = _673 * _765;
    float _797 = _783 * _761;
    float _799 = _717 * _783;
    float _801 = _743 * _783;
    float _803 = _755 * _743;
    float _805 = _777 * _797;
    float _807 = _755 * _797;
    float _809 = fma(_671, _763, _795);
    float _811 = fma(_789, _791, _785);
    float _813 = -_761;
    float _815 = _789 * _813;
    float _817 = fma(_675, _767, _809);
    float _819 = fma(_811, _779, _805);
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = -_803;
    float _825 = fma(_789, _793, _823);
    float _827 = -_793;
    float _829 = fma(_789, _803, _827);
    float _831 = fma(_801, _779, _815);
    float _833 = fma(_789, _785, _791);
    float _835 = fma(_825, _821, _819);
    float _837 = fma(_829, _779, _807);
    float _839 = fma(_799, _821, _831);
    float _841 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _843 = fma(_833, _821, _837);
    float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _847 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _849 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _845);
    float _853 = _817 + _769;
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _849);
    float _857 = _773 + _693;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _851);
    float _861 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _847);
    float _863 = _855 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _865 = _859 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _867 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _861);
    float _869 = _857 + _863;
    float _871 = in.m_62.x;
    float _873 = in.m_62.y;
    float _875 = in.m_62.z;
    float _877 = in.m_62.w;
    float _879 = _853 + _865;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _883 = _869 + _881;
    float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _887 = _879 + _885;
    float _889 = _883 * _883;
    float _891 = fma(_887, _887, _889);
    float _893 = sqrt(_891);
    float _895 = _673 * _873;
    float _897 = _867 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _899 = fma(_671, _871, _895);
    bool _901 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = fma(_675, _875, _899);
    float _905 = _903 + _877;
    float _907 = _905 + _897;
    float _909 = _897;
    float _911 = _671;
    float _913 = _899;
    float _915 = _907;
    float _917 = _843;
    float _919 = _779;
    if (!_901)
    {
        _909 = _879;
    }
    float _921 = _909;
    float _923 = _921;
    if (!_901)
    {
        _911 = _869;
    }
    float _925 = _911;
    float _927 = _925;
    if (!_901)
    {
        _913 = _907;
    }
    float _929 = _913;
    bool _931 = !_901;
    float _933 = _929;
    if (!_931)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _939 = _893 + _937;
        float _941 = rsqrt(_891);
        float _943 = _939 * _935;
        float _945 = _907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _947 = _943 * 0.15915493667125701904296875;
        float _949 = _947 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = _947 * 6.283185482025146484375;
        float _955 = sin(_953);
        float _957 = _951 + (-1.0);
        float _959 = _957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _961 = fma(_955, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _963 = fma(_907, _951, _959);
        float _965 = _941 * _961;
        float _967 = fma(_887, _965, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _969 = fma(_883, _965, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _933 = _963;
        _923 = _967;
        _927 = _969;
    }
    float _971 = _933;
    float _973 = _923;
    float _975 = _927;
    float _977 = _971;
    float _979 = _973;
    float _981 = _975;
    if (!_733)
    {
        float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _985 = _905 + _983;
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _989 = _853 + _987;
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _993 = -_905;
        float _995 = _993 + _971;
        float _997 = _985 * _985;
        float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1001 = _857 + _999;
        float _1003 = fma(_989, _989, _997);
        float _1005 = -_853;
        float _1007 = _1005 + _973;
        float _1009 = fma(_1001, _1001, _1003);
        float _1011 = sqrt(_1009);
        float _1013 = precise::min(_1011, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1015 = _1013 * _991;
        float _1017 = -_857;
        float _1019 = _1017 + _975;
        float _1021 = fma(_1007, _1015, _853);
        float _1023 = fma(_995, _1015, _905);
        float _1025 = fma(_1019, _1015, _857);
        _977 = _1023;
        _979 = _1021;
        _981 = _1025;
    }
    float _1027 = _977;
    float _1029 = _979;
    float _1031 = _981;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = _1027 + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = _1029 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1043 = _1031 + _1041;
    float _1045 = _1035 * _1035;
    float _1047 = fma(_1039, _1039, _1045);
    float _1049 = fma(_1043, _1043, _1047);
    float _1051 = rsqrt(_1049);
    float _1053 = sqrt(_1049);
    float _1055 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1057 = _1039 * _1055;
    float _1059 = _1043 * _1055;
    float _1061 = _1057 * _1057;
    float _1063 = _1059 * _1059;
    float _1065 = _1061 + _1063;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1067 + _1071;
    float _1075 = _1043;
    float _1077 = _1045;
    float _1079 = _1073;
    float _1081 = _1055;
    if (_1069)
    {
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1075 = _1083;
    }
    float _1085 = _1075;
    if (_1069)
    {
        float _1087 = rsqrt(_1065);
        _1077 = _1087;
    }
    float _1089 = _1077;
    float _1091 = _1089;
    if (_1069)
    {
        float _1093 = _1073 * _1085;
        _1079 = _1093;
    }
    float _1095 = _1079;
    if (_1069)
    {
        float _1097 = _1095 * 0.15915493667125701904296875;
        _915 = _1097;
    }
    float _1099 = _915;
    float _1101 = _1051;
    float _1103 = _1099;
    if (_1069)
    {
        float _1105 = _1099 * 6.283185482025146484375;
        float _1107 = sin(_1105);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1113 = precise::max(0.0, _1111);
    float _1115 = _869;
    float _1117 = _1113;
    float _1119 = _1111;
    if (_1069)
    {
        float _1121 = _1099 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        _1115 = _1123;
    }
    float _1125 = _1115;
    float _1127 = -_1055;
    float _1129 = -_1113;
    float _1131 = fma(_1035, _1127, _1129);
    if (_1069)
    {
        float _1133 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1117 = _1133;
    }
    float _1135 = _1117;
    float _1137 = _1135;
    if (!_1069)
    {
        _1103 = _1061;
    }
    float _1139 = _1103;
    float _1141 = _1109;
    float _1143 = _1139;
    if (_1069)
    {
        float _1145 = fma(_1109, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    float _1149 = _1147;
    if (!_1069)
    {
        _1137 = _1059;
    }
    float _1151 = _1137;
    float _1153 = _1151;
    if (_1069)
    {
        float _1155 = _1125 + (-1.0);
        _1119 = _1155;
    }
    float _1157 = _1119;
    float _1159 = _1157;
    if (_1069)
    {
        float _1161 = _1089 * _1147;
        _917 = _1161;
    }
    float _1163 = _917;
    if (!_1069)
    {
        _1091 = _1057;
    }
    float _1165 = _1091;
    float _1167 = _1165;
    if (_1069)
    {
        float _1169 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1081 = _1169;
    }
    float _1171 = _1081;
    if (_1069)
    {
        float _1173 = _1057 * _1163;
        _1167 = _1173;
    }
    float _1175 = _1167;
    if (!_1069)
    {
        _1149 = _1131;
    }
    float _1177 = _1149;
    float _1179 = _1177;
    if (_1069)
    {
        float _1181 = _1059 * _1163;
        _1153 = _1181;
    }
    float _1183 = _1153;
    if (_1069)
    {
        float _1185 = fma(_1131, _1125, _1171);
        _1179 = _1185;
    }
    float _1187 = _1179;
    if (_1069)
    {
        float _1189 = _1175 * _1175;
        _1143 = _1189;
    }
    float _1191 = _1143;
    if (!_1069)
    {
        _1159 = _1063;
    }
    float _1193 = _1159;
    float _1195 = _1193;
    if (_1069)
    {
        float _1197 = _1183 * _1183;
        _1195 = _1197;
    }
    float _1199 = _1195;
    float _1201 = fma(_1187, _1187, _1191);
    float _1203 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1205 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1207 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1209 = _1201 + _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1213 = fma(_1053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1211);
    float _1215 = precise::clamp(_1213, 0.0, 1.0);
    float _1217 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1219 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1221 = rsqrt(_1209);
    float _1223 = -_1215;
    float _1225 = _1223 + 1.0;
    float _1227 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1217);
    float _1229 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1219);
    float _1231 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1233 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1207);
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1237 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1239 = abs(_1225);
    float _1241 = log2(_1239);
    float _1243 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1231);
    float _1247 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1249 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1251 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1253 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1245);
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1257 = _1221 * _1175;
    float _1259 = _1221 * _1187;
    float _1261 = _1221 * _1183;
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1255);
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1267 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1269 = -_1249;
    float _1271 = fma(_1269, _1205, 1.0);
    float _1273 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1263);
    float _1275 = -_1265;
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1275);
    float _1279 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1281 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1283 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1273);
    float _1285 = -_1261;
    float _1287 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1277);
    float _1289 = log2(_1271);
    float _1291 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1293 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1281);
    float _1295 = fma(_1287, -0.5, 0.5);
    float _1297 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1291);
    float _1299 = fma(_1287, 0.5, 0.5);
    float _1301 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1293);
    float _1303 = exp2(_1279);
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1297);
    float _1307 = fma(_1299, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1309 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1301);
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1305);
    float _1313 = fma(_1299, _1307, -0.212114393711090087890625);
    float _1315 = 1.0 / _1283;
    float _1317 = _1259 + 1.0;
    float _1319 = _1289 * 0.693147182464599609375;
    float _1321 = fma(_1299, _1313, 1.570728778839111328125);
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1325 = sqrt(_1295);
    float _1327 = -_1259;
    float _1329 = fma(_1303, _1317, _1327);
    float _1331 = _1309 * _1315;
    float _1333 = _1311 * _1315;
    float _1335 = fma(_1329, 0.5, 0.5);
    float _1337 = fma(_1331, 0.5, 0.5);
    float _1339 = fma(_1333, -0.5, 0.5);
    float _1341 = _1325 * 0.636619746685028076171875;
    float3 _3533 = float3(_1337, _1339, _1323);
    float _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3533, float3(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3533, float3(0.0), isnan(_3533)), level(0.0)).x;
    float _1345 = -_1321;
    float _1347 = fma(_1341, _1345, 1.0);
    float3 _3549 = float3(_1337, _1339, _1323);
    float4 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3549, float3(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3549, float3(0.0), isnan(_3549)), level(0.0)).xyzw;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = _1350.w;
    float2 _3566 = float2(_1347, _1335);
    float3 _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).xyz;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1372 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1376 = isnan(0.5);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1386 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1370);
    float _1388 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1372);
    bool _1390 = _147 > 0.5;
    float _1392 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1394 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1386);
    float _1396 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1388);
    float _1398 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1402 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1406 = 1.0 / _1400;
    float _1408 = _1402 + _1400;
    float _1410 = _1337;
    float _1412 = _1394;
    float _1414 = _1339;
    float _1416 = _1241;
    if (!_1382)
    {
        _1410 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1418;
    float _1426 = _1422;
    if (!_1382)
    {
        _919 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1428 = _919;
    float _1430 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1398);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1382)
    {
        float _1434 = -_1428;
        float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1412 = _1436;
    }
    float _1438 = _1412;
    bool _1440 = _283 > 0.5;
    float _1442 = -_243;
    int _1444 = _1390 ? as_type<int>(_1442) : as_type<int>(_243);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1448 = _1408 * _1406;
    float _1450 = _1448 * 0.5;
    if (!_1382)
    {
        float _1452 = 1.0 / _1438;
        _1414 = _1452;
    }
    float _1454 = _1414;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1458 = _1456 != 0;
    float _1460 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1382)
    {
        float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1464 = fma(_1450, _1418, _1462);
        _1424 = _1464;
    }
    float _1466 = _1424;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1470 = _1468 != 0;
    float _1472 = -_173;
    int _1474 = _1440 ? as_type<int>(_1472) : as_type<int>(_173);
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1478 = _1466;
    if (!_1382)
    {
        float _1480 = 1.0 / _1466;
        _1478 = _1480;
    }
    float _1482 = _1478;
    bool _1484 = !_1458;
    float _1486 = _1484 ? _243 : as_type<float>(_1444);
    bool _1488 = !_1470;
    float _1490 = _1488 ? _173 : as_type<float>(_1474);
    out.m_64.x = _1422;
    out.m_64.y = _1432;
    out.m_64.z = _1460;
    out.m_64.w = _1476;
    float _1492 = _1486 + 0.5;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1500 = -_1490;
    float _1502 = _1500 + 0.5;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1510 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1382)
    {
        float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1516 = -_1428;
        float _1518 = fma(_1482, _1514, _1516);
        _1416 = _1518;
    }
    float _1520 = _1416;
    if (_1382)
    {
        _1426 = 1.0;
    }
    float _1522 = _1426;
    float _1524 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1528 = _1522;
    if (!_1382)
    {
        float _1530 = _1520 * _1454;
        float _1532 = precise::clamp(_1530, 0.0, 1.0);
        _1528 = _1532;
    }
    float _1534 = _1528;
    float _1536 = exp2(_1512);
    float _1538 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1540 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1430);
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1544 = _1534 > 0.0;
    bool _1546 = isnan(_1534);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    float _1554 = _1526 * _1494;
    out.m_66.x = _1506;
    out.m_66.y = _1510;
    out.m_66.z = _1524;
    out.m_66.w = _1508;
    float _1556 = _253 * _1542;
    float _1558 = _1538 * _1384;
    out.m_68.x = _1554;
    out.m_68.y = _1558;
    float _1560 = -_1536;
    float _1562 = _1560 + 1.0;
    out.gl_Position.x = _1309;
    out.gl_Position.y = _1311;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1283;
    float _1564 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1566 = _1540 + _1283;
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1570 = _1566 * 0.5;
    out.m_45.x = _1568;
    out.m_70.z = _1570;
    out.m_70.w = _1283;
    float _1572 = _1564 * _1343;
    float _1574 = -_1564;
    float _1576 = _1574 + 1.0;
    float _1578 = _1358 * _1572;
    float _1580 = _1358 * _1576;
    float _1582 = _1368 * _1572;
    float _1584 = fma(_1364, _1578, _1352);
    float _1586 = fma(_1366, _1578, _1354);
    float _1588 = fma(_1358, _1582, _1356);
    out.m_72.x = _1584;
    out.m_72.y = _1586;
    out.m_72.z = _1588;
    out.m_72.w = _1580;
    if (_1552)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1590 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1590;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1647 = as_type<float>(_107);
        out.gl_Position.z = _1647;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1717 = as_type<float>(_145);
        out.gl_Position.z = _1717;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _167 * 0.15915493667125701904296875;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_179;
    int _195 = _193 ? 0 : 1;
    bool _197 = !_187;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_195);
    float _203 = -_169;
    float _205 = _157 + _203;
    int _207 = abs(_199);
    float _209 = -_205;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = !_183;
    int _215 = _213 ? 0 : 1;
    float _217 = float(_201);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_191, 0.5, 0.5);
    float _223 = abs(_211);
    float _225 = _217 * _223;
    int _227 = abs(_215);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_207);
    bool _235 = _205 < 0.5;
    float _237 = float(_235);
    float _239 = fma(_233, _231, _225);
    bool _241 = !_161;
    float _243 = _241 ? (-0.5) : 0.5;
    float _245 = -_237;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = float(_227);
    float _251 = abs(_247);
    float _253 = fma(_249, _251, _239);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_91);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_49.y;
    float _285 = _147 * 2.0;
    float _287 = in.m_49.z;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _299 = _297 != 0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = floor(_285);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _281 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _281 + _319;
    float _323 = 1.0 / _303;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = _281 + _325;
    bool _329 = !_295;
    int _331 = _329 ? 0 : 1;
    bool _333 = !_299;
    int _335 = _333 ? 0 : 1;
    float _337 = 1.0 / _309;
    float _339 = _283 * 2.0;
    bool _341 = _305 > 0.0;
    bool _343 = _305 >= 0.0;
    bool _345 = isnan(_305);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _287 * 2.0;
    bool _355 = !_291;
    int _357 = _355 ? 0 : 1;
    float _359 = 1.0 / _313;
    float _361 = _327 * _323;
    float _363 = _283 + _287;
    float _365 = _147 + _283;
    int _367 = abs(_331);
    float _369 = _363 + (-1.0);
    float _371 = _365 + (-1.0);
    float _373 = floor(_339);
    float _375 = _317 * _337;
    float _377 = _147 + _287;
    int _379 = abs(_335);
    float _381 = _377 + (-1.0);
    int _383 = abs(_357);
    float _385 = floor(_353);
    float _387 = _321 * _359;
    float _389 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _395 = _351 ? 0 : 1;
    float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _399 = log2(_397);
    bool _401 = _373 >= 0.0;
    bool _403 = isnan(_373);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    bool _415 = _373 > 0.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _421 = _409 ? 0 : 1;
    float _423 = fma(_413, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _425 = ~_395;
    int _427 = _425 + 1;
    int _429 = _427 + 1;
    float _431 = fma(_419, _375, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _433 = _385 > 0.0;
    bool _435 = _385 >= 0.0;
    bool _437 = isnan(_385);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _445;
    int _449 = ~_421;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _459 = _443 ? 0 : 1;
    float _461 = fma(_447, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = _399 * _125;
    int _465 = _453;
    int _467 = _429;
    if (!_415)
    {
        int _469 = ~_421;
        int _471 = _469 + 1;
        _465 = _471;
    }
    int _473 = _465;
    float _475 = fma(_457, _375, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _477 = ~_459;
    int _479 = _477 + 1;
    int _481 = _479 + 1;
    float _483 = exp2(_463);
    int _485 = _481;
    if (!_341)
    {
        int _487 = ~_395;
        int _489 = _487 + 1;
        _467 = _489;
    }
    int _491 = _467;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _495 = 1.0 + _493;
    if (!_433)
    {
        int _497 = ~_459;
        int _499 = _497 + 1;
        _485 = _499;
    }
    int _501 = _485;
    float _503 = in.m_54.x;
    float _505 = in.m_54.y;
    float _507 = in.m_54.z;
    bool _509 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _511 = isnan(1.0);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _517 = _513 || _515;
    float _519 = 1.0 / _495;
    float _521 = float(_367);
    float _523 = float(_491);
    bool _525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = float(_379);
    float _537 = -_483;
    float _539 = _537 + 1.0;
    float _541 = _521 * _523;
    float _543 = float(_473);
    float _545 = float(_383);
    float _547 = _541 * (-2.0);
    float _549 = _533 ? _539 : 0.0;
    float _551 = _535 * _543;
    float _553 = float(_501);
    float _555 = _283 + (-0.5);
    float _557 = fma(_389, _547, _389);
    if (_517)
    {
        float _559 = _549 * _519;
        _127 = _559;
    }
    float _561 = _127;
    bool _563 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _565 = isnan(_281);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = fma(_547, _505, _505);
    float _577 = _545 * _553;
    bool _579 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_281);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _551 * (-2.0);
    float _593 = -_573;
    float _595 = _593 + 1.0;
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[196].y, _575);
    bool _599 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_281);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_393, _591, _393);
    float _613 = _589 * _595;
    float _615 = -_589;
    float _617 = _615 + 1.0;
    float _619 = fma(_557, _561, _597);
    float _621 = _577 * (-2.0);
    bool _623 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_281);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _609 * _617;
    float _637 = -_609;
    float _639 = _637 + 1.0;
    float _641 = _147 + (-0.5);
    float _643 = fma(_621, _503, _503);
    float _645 = fma(_391, _621, _391);
    float _647 = _633 * _639;
    float _649 = fma(_591, _507, _507);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[196].x, _643);
    float _653 = _423 * _647;
    float _655 = fma(_645, _561, _651);
    float _657 = _461 * _647;
    float _659 = in.m_56.x;
    float _661 = in.m_56.y;
    float _663 = -_633;
    float _665 = _663 + 1.0;
    float _667 = _655 * 0.15915493667125701904296875;
    float _669 = _287 + (-0.5);
    float _671 = in.m_42.x;
    float _673 = in.m_42.y;
    float _675 = in.m_42.z;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _681;
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _657);
    float _687 = in.m_58.x;
    float _689 = in.m_58.y;
    float _691 = in.m_58.z;
    float _693 = in.m_58.w;
    float _695 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].z, _649);
    float _697 = fma(_679, _387, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _699 = fma(_683, _387, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _701 = fma(_475, _635, _685);
    float _703 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _705 = fma(_611, _561, _695);
    float _707 = _619 * 0.15915493667125701904296875;
    float _709 = fma(_699, _613, _701);
    float _711 = fma(_431, _635, _703);
    float _713 = _705 * 0.15915493667125701904296875;
    float _715 = _707 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].y, _709);
    float _721 = fma(_697, _613, _711);
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _243);
    bool _725 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _727 = isnan(0.5);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _733 = _729 || _731;
    float _735 = _719 * _661;
    float _737 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[146].x, _721);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _173);
    float _741 = _707 * 6.283185482025146484375;
    float _743 = cos(_741);
    float _745 = _253 * _735;
    float _747 = _737 * _659;
    float _749 = _673 * _689;
    float _751 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _753 = _667 * 6.283185482025146484375;
    float _755 = sin(_753);
    float _757 = fma(_671, _687, _749);
    float _759 = _253 * _747;
    float _761 = _751 * _739;
    float _763 = in.m_60.x;
    float _765 = in.m_60.y;
    float _767 = in.m_60.z;
    float _769 = in.m_60.w;
    float _771 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = fma(_675, _691, _757);
    float _775 = _667 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _771 * _723;
    float _781 = _713 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _755 * _717;
    float _787 = _713 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _777 * _743;
    float _793 = _777 * _717;
    float _795 = _673 * _765;
    float _797 = _783 * _761;
    float _799 = _717 * _783;
    float _801 = _743 * _783;
    float _803 = _755 * _743;
    float _805 = _777 * _797;
    float _807 = _755 * _797;
    float _809 = fma(_671, _763, _795);
    float _811 = fma(_789, _791, _785);
    float _813 = -_761;
    float _815 = _789 * _813;
    float _817 = fma(_675, _767, _809);
    float _819 = fma(_811, _779, _805);
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = -_803;
    float _825 = fma(_789, _793, _823);
    float _827 = -_793;
    float _829 = fma(_789, _803, _827);
    float _831 = fma(_801, _779, _815);
    float _833 = fma(_789, _785, _791);
    float _835 = fma(_825, _821, _819);
    float _837 = fma(_829, _779, _807);
    float _839 = fma(_799, _821, _831);
    float _841 = _835 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _843 = fma(_833, _821, _837);
    float _845 = _835 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _847 = _835 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _849 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _841);
    float _851 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _845);
    float _853 = _817 + _769;
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].z, _849);
    float _857 = _773 + _693;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].z, _851);
    float _861 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _847);
    float _863 = _855 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _865 = _859 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _867 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].z, _861);
    float _869 = _857 + _863;
    float _871 = in.m_62.x;
    float _873 = in.m_62.y;
    float _875 = in.m_62.z;
    float _877 = in.m_62.w;
    float _879 = _853 + _865;
    float _881 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _883 = _869 + _881;
    float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _887 = _879 + _885;
    float _889 = _883 * _883;
    float _891 = fma(_887, _887, _889);
    float _893 = sqrt(_891);
    float _895 = _673 * _873;
    float _897 = _867 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _899 = fma(_671, _871, _895);
    bool _901 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = fma(_675, _875, _899);
    float _905 = _903 + _877;
    float _907 = _905 + _897;
    float _909 = _897;
    float _911 = _671;
    float _913 = _899;
    float _915 = _907;
    float _917 = _843;
    float _919 = _779;
    if (!_901)
    {
        _909 = _879;
    }
    float _921 = _909;
    float _923 = _921;
    if (!_901)
    {
        _911 = _869;
    }
    float _925 = _911;
    float _927 = _925;
    if (!_901)
    {
        _913 = _907;
    }
    float _929 = _913;
    bool _931 = !_901;
    float _933 = _929;
    if (!_931)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _939 = _893 + _937;
        float _941 = rsqrt(_891);
        float _943 = _939 * _935;
        float _945 = _907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _947 = _943 * 0.15915493667125701904296875;
        float _949 = _947 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = _947 * 6.283185482025146484375;
        float _955 = sin(_953);
        float _957 = _951 + (-1.0);
        float _959 = _957 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _961 = fma(_955, _945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _963 = fma(_907, _951, _959);
        float _965 = _941 * _961;
        float _967 = fma(_887, _965, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _969 = fma(_883, _965, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _933 = _963;
        _923 = _967;
        _927 = _969;
    }
    float _971 = _933;
    float _973 = _923;
    float _975 = _927;
    float _977 = _971;
    float _979 = _973;
    float _981 = _975;
    if (!_733)
    {
        float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _985 = _905 + _983;
        float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _989 = _853 + _987;
        float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _993 = -_905;
        float _995 = _993 + _971;
        float _997 = _985 * _985;
        float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1001 = _857 + _999;
        float _1003 = fma(_989, _989, _997);
        float _1005 = -_853;
        float _1007 = _1005 + _973;
        float _1009 = fma(_1001, _1001, _1003);
        float _1011 = sqrt(_1009);
        float _1013 = precise::min(_1011, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1015 = _1013 * _991;
        float _1017 = -_857;
        float _1019 = _1017 + _975;
        float _1021 = fma(_1007, _1015, _853);
        float _1023 = fma(_995, _1015, _905);
        float _1025 = fma(_1019, _1015, _857);
        _977 = _1023;
        _979 = _1021;
        _981 = _1025;
    }
    float _1027 = _977;
    float _1029 = _979;
    float _1031 = _981;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = _1027 + _1033;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = _1029 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1043 = _1031 + _1041;
    float _1045 = _1035 * _1035;
    float _1047 = fma(_1039, _1039, _1045);
    float _1049 = fma(_1043, _1043, _1047);
    float _1051 = rsqrt(_1049);
    float _1053 = sqrt(_1049);
    float _1055 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1057 = _1039 * _1055;
    float _1059 = _1043 * _1055;
    float _1061 = _1057 * _1057;
    float _1063 = _1059 * _1059;
    float _1065 = _1061 + _1063;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1073 = _1067 + _1071;
    float _1075 = _1043;
    float _1077 = _1045;
    float _1079 = _1073;
    float _1081 = _1055;
    if (_1069)
    {
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1075 = _1083;
    }
    float _1085 = _1075;
    if (_1069)
    {
        float _1087 = rsqrt(_1065);
        _1077 = _1087;
    }
    float _1089 = _1077;
    float _1091 = _1089;
    if (_1069)
    {
        float _1093 = _1073 * _1085;
        _1079 = _1093;
    }
    float _1095 = _1079;
    if (_1069)
    {
        float _1097 = _1095 * 0.15915493667125701904296875;
        _915 = _1097;
    }
    float _1099 = _915;
    float _1101 = _1051;
    float _1103 = _1099;
    if (_1069)
    {
        float _1105 = _1099 * 6.283185482025146484375;
        float _1107 = sin(_1105);
        _1101 = _1107;
    }
    float _1109 = _1101;
    float _1111 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1113 = precise::max(0.0, _1111);
    float _1115 = _869;
    float _1117 = _1113;
    float _1119 = _1111;
    if (_1069)
    {
        float _1121 = _1099 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        _1115 = _1123;
    }
    float _1125 = _1115;
    float _1127 = -_1055;
    float _1129 = -_1113;
    float _1131 = fma(_1035, _1127, _1129);
    if (_1069)
    {
        float _1133 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1117 = _1133;
    }
    float _1135 = _1117;
    float _1137 = _1135;
    if (!_1069)
    {
        _1103 = _1061;
    }
    float _1139 = _1103;
    float _1141 = _1109;
    float _1143 = _1139;
    if (_1069)
    {
        float _1145 = fma(_1109, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    float _1149 = _1147;
    if (!_1069)
    {
        _1137 = _1059;
    }
    float _1151 = _1137;
    float _1153 = _1151;
    if (_1069)
    {
        float _1155 = _1125 + (-1.0);
        _1119 = _1155;
    }
    float _1157 = _1119;
    float _1159 = _1157;
    if (_1069)
    {
        float _1161 = _1089 * _1147;
        _917 = _1161;
    }
    float _1163 = _917;
    if (!_1069)
    {
        _1091 = _1057;
    }
    float _1165 = _1091;
    float _1167 = _1165;
    if (_1069)
    {
        float _1169 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1081 = _1169;
    }
    float _1171 = _1081;
    if (_1069)
    {
        float _1173 = _1057 * _1163;
        _1167 = _1173;
    }
    float _1175 = _1167;
    if (!_1069)
    {
        _1149 = _1131;
    }
    float _1177 = _1149;
    float _1179 = _1177;
    if (_1069)
    {
        float _1181 = _1059 * _1163;
        _1153 = _1181;
    }
    float _1183 = _1153;
    if (_1069)
    {
        float _1185 = fma(_1131, _1125, _1171);
        _1179 = _1185;
    }
    float _1187 = _1179;
    if (_1069)
    {
        float _1189 = _1175 * _1175;
        _1143 = _1189;
    }
    float _1191 = _1143;
    if (!_1069)
    {
        _1159 = _1063;
    }
    float _1193 = _1159;
    float _1195 = _1193;
    if (_1069)
    {
        float _1197 = _1183 * _1183;
        _1195 = _1197;
    }
    float _1199 = _1195;
    float _1201 = fma(_1187, _1187, _1191);
    float _1203 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1205 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1207 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1209 = _1201 + _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1213 = fma(_1053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1211);
    float _1215 = precise::clamp(_1213, 0.0, 1.0);
    float _1217 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1219 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1221 = rsqrt(_1209);
    float _1223 = -_1215;
    float _1225 = _1223 + 1.0;
    float _1227 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1217);
    float _1229 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1219);
    float _1231 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1233 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1207);
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1237 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1229);
    float _1239 = abs(_1225);
    float _1241 = log2(_1239);
    float _1243 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1233);
    float _1245 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1231);
    float _1247 = _1237 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1249 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1251 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1253 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1245);
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1257 = _1221 * _1175;
    float _1259 = _1221 * _1187;
    float _1261 = _1221 * _1183;
    float _1263 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1255);
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1267 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1269 = -_1249;
    float _1271 = fma(_1269, _1205, 1.0);
    float _1273 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1263);
    float _1275 = -_1265;
    float _1277 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1275);
    float _1279 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1281 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1283 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1273);
    float _1285 = -_1261;
    float _1287 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1277);
    float _1289 = log2(_1271);
    float _1291 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1293 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1281);
    float _1295 = fma(_1287, -0.5, 0.5);
    float _1297 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1291);
    float _1299 = fma(_1287, 0.5, 0.5);
    float _1301 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1293);
    float _1303 = exp2(_1279);
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1297);
    float _1307 = fma(_1299, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1309 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1301);
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1305);
    float _1313 = fma(_1299, _1307, -0.212114393711090087890625);
    float _1315 = 1.0 / _1283;
    float _1317 = _1259 + 1.0;
    float _1319 = _1289 * 0.693147182464599609375;
    float _1321 = fma(_1299, _1313, 1.570728778839111328125);
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1325 = sqrt(_1295);
    float _1327 = -_1259;
    float _1329 = fma(_1303, _1317, _1327);
    float _1331 = _1309 * _1315;
    float _1333 = _1311 * _1315;
    float _1335 = fma(_1329, 0.5, 0.5);
    float _1337 = fma(_1331, 0.5, 0.5);
    float _1339 = fma(_1333, -0.5, 0.5);
    float _1341 = _1325 * 0.636619746685028076171875;
    float3 _3533 = float3(_1337, _1339, _1323);
    float _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3533, float3(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3533, float3(0.0), isnan(_3533)), level(0.0)).x;
    float _1345 = -_1321;
    float _1347 = fma(_1341, _1345, 1.0);
    float3 _3549 = float3(_1337, _1339, _1323);
    float4 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3549, float3(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3549, float3(0.0), isnan(_3549)), level(0.0)).xyzw;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = _1350.w;
    float2 _3566 = float2(_1347, _1335);
    float3 _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).xyz;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1372 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1376 = isnan(0.5);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1386 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1370);
    float _1388 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1372);
    bool _1390 = _147 > 0.5;
    float _1392 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1394 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1386);
    float _1396 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1388);
    float _1398 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1402 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1406 = 1.0 / _1400;
    float _1408 = _1402 + _1400;
    float _1410 = _1337;
    float _1412 = _1394;
    float _1414 = _1339;
    float _1416 = _1241;
    if (!_1382)
    {
        _1410 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1418;
    float _1426 = _1422;
    if (!_1382)
    {
        _919 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1428 = _919;
    float _1430 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1398);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1382)
    {
        float _1434 = -_1428;
        float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1412 = _1436;
    }
    float _1438 = _1412;
    bool _1440 = _283 > 0.5;
    float _1442 = -_243;
    int _1444 = _1390 ? as_type<int>(_1442) : as_type<int>(_243);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1448 = _1408 * _1406;
    float _1450 = _1448 * 0.5;
    if (!_1382)
    {
        float _1452 = 1.0 / _1438;
        _1414 = _1452;
    }
    float _1454 = _1414;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1458 = _1456 != 0;
    float _1460 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1382)
    {
        float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1464 = fma(_1450, _1418, _1462);
        _1424 = _1464;
    }
    float _1466 = _1424;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1470 = _1468 != 0;
    float _1472 = -_173;
    int _1474 = _1440 ? as_type<int>(_1472) : as_type<int>(_173);
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1478 = _1466;
    if (!_1382)
    {
        float _1480 = 1.0 / _1466;
        _1478 = _1480;
    }
    float _1482 = _1478;
    bool _1484 = !_1458;
    float _1486 = _1484 ? _243 : as_type<float>(_1444);
    bool _1488 = !_1470;
    float _1490 = _1488 ? _173 : as_type<float>(_1474);
    out.m_64.x = _1422;
    out.m_64.y = _1432;
    out.m_64.z = _1460;
    out.m_64.w = _1476;
    float _1492 = _1486 + 0.5;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1500 = -_1490;
    float _1502 = _1500 + 0.5;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1510 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1382)
    {
        float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1516 = -_1428;
        float _1518 = fma(_1482, _1514, _1516);
        _1416 = _1518;
    }
    float _1520 = _1416;
    if (_1382)
    {
        _1426 = 1.0;
    }
    float _1522 = _1426;
    float _1524 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1528 = _1522;
    if (!_1382)
    {
        float _1530 = _1520 * _1454;
        float _1532 = precise::clamp(_1530, 0.0, 1.0);
        _1528 = _1532;
    }
    float _1534 = _1528;
    float _1536 = exp2(_1512);
    float _1538 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1540 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1430);
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1544 = _1534 > 0.0;
    bool _1546 = isnan(_1534);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    float _1554 = _1526 * _1494;
    out.m_66.x = _1506;
    out.m_66.y = _1510;
    out.m_66.z = _1524;
    out.m_66.w = _1508;
    float _1556 = _253 * _1542;
    float _1558 = _1538 * _1384;
    out.m_68.x = _1554;
    out.m_68.y = _1558;
    float _1560 = -_1536;
    float _1562 = _1560 + 1.0;
    out.gl_Position.x = _1309;
    out.gl_Position.y = _1311;
    out.gl_Position.z = _1540;
    out.gl_Position.w = _1283;
    float _1564 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1566 = _1540 + _1283;
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1570 = _1566 * 0.5;
    out.m_45.x = _1568;
    out.m_70.z = _1570;
    out.m_70.w = _1283;
    float _1572 = _1564 * _1343;
    float _1574 = -_1564;
    float _1576 = _1574 + 1.0;
    float _1578 = _1358 * _1572;
    float _1580 = _1358 * _1576;
    float _1582 = _1368 * _1572;
    float _1584 = fma(_1364, _1578, _1352);
    float _1586 = fma(_1366, _1578, _1354);
    float _1588 = fma(_1358, _1582, _1356);
    out.m_72.x = _1584;
    out.m_72.y = _1586;
    out.m_72.z = _1588;
    out.m_72.w = _1580;
    if (_1552)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1590 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1590;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

