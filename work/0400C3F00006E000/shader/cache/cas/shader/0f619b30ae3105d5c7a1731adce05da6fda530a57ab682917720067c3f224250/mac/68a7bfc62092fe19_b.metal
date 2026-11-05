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
    float4 m_62 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _539 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_105);
        out.gl_Position.z = _1781;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1850 = as_type<float>(_141);
        out.gl_Position.z = _1850;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _153 = in.m_54.w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_47.x;
    float _167 = in.m_47.y;
    float _169 = in.m_47.z;
    float _171 = in.m_42.x;
    float _173 = in.m_42.y;
    float _175 = in.m_42.z;
    float _177 = _147 * _145;
    float _179 = 0.0;
    float _181 = _151;
    if (!_163)
    {
        float _183 = _151 * _151;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _191 = _187;
    if (!_163)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = _189 * 6.283185482025146484375;
    float _199 = floor(_189);
    int _201 = as_type<int>(_149) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_149) & 2;
    bool _207 = _205 != 0;
    float _209 = _197 * 0.15915493667125701904296875;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = _209 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_203;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_207;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = -_199;
    float _229 = _189 + _227;
    bool _231 = !_163;
    float _233 = _195;
    float _235 = _153;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _151 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _151);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _265;
    }
    float _267 = _233;
    bool _269 = !_163;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _151 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _181 = _289;
    }
    float _291 = _181;
    float _293 = in.m_56.x;
    float _295 = in.m_56.y;
    float _297 = in.m_56.z;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _303 = in.m_58.x;
    float _305 = in.m_58.y;
    float _307 = in.m_58.z;
    bool _309 = _229 < 0.5;
    float _311 = float(_309);
    float _313 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _315 = fma(_291, _165, _299);
    float _317 = in.m_60.x;
    float _319 = in.m_60.y;
    float _321 = in.m_60.z;
    float _323 = fma(_291, _167, _301);
    float _325 = fma(_291, _169, _313);
    float _327 = -_311;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_315, _153, _171);
    float _333 = fma(_323, _153, _173);
    float _335 = fma(_325, _153, _175);
    float _337 = fma(_217, 0.5, 0.5);
    if (!_163)
    {
        float _339 = _123 * _123;
        float _341 = _339 * 0.5;
        _235 = _341;
    }
    float _343 = _235;
    float _345 = -_229;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _349 = -_337;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _353 = 0.0;
    float _355 = _343;
    if (!_163)
    {
        _353 = _123;
    }
    float _357 = _353;
    float _359 = _357;
    if (!_163)
    {
        float _361 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _361;
    }
    float _363 = _355;
    bool _365 = !_213;
    int _367 = _365 ? 0 : 1;
    bool _369 = !_163;
    float _371 = _363;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _123 * _375;
        float _385 = exp2(_383);
        float _387 = _381 * 0.693147182464599609375;
        float _389 = 1.0 / _387;
        float _391 = 1.0 / _379;
        float _393 = _385 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _389, _123);
        float _399 = _397 * _391;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_163;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _123 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _359 = _425;
    }
    float _427 = _359;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _435 = _433 != 0;
    float _437 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _441 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _443 = abs(_367);
    float _445 = fma(_427, _165, _437);
    bool _447 = !_431;
    int _449 = _447 ? 0 : 1;
    float _451 = fma(_427, _167, _439);
    bool _453 = !_435;
    int _455 = _453 ? 0 : 1;
    float _457 = fma(_427, _169, _441);
    int _459 = abs(_449);
    float _461 = -_451;
    float _463 = _323 + _461;
    int _465 = abs(_455);
    float _467 = -_445;
    float _469 = _315 + _467;
    float _471 = _463 * _295;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _475 = _463 * _305;
    float _477 = _463 * _319;
    float _479 = float(_459);
    float _481 = fma(_469, _293, _471);
    float _483 = fma(_469, _303, _475);
    float _485 = fma(_469, _317, _477);
    float _487 = float(_443);
    float _489 = abs(_347);
    float _491 = _479 * _489;
    float _493 = -_457;
    float _495 = _325 + _493;
    float _497 = fma(_487, _351, _491);
    float _499 = float(_465);
    float _501 = fma(_495, _297, _481);
    float _503 = fma(_495, _307, _483);
    float _505 = fma(_495, _321, _485);
    float _507 = abs(_329);
    float _509 = fma(_499, _507, _497);
    bool _511 = !_473;
    float _513 = _503;
    float _515 = _501;
    float _517 = _505;
    float _519 = _445;
    float _521 = _445;
    float _537;
    if (!_511)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _525 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_89);
        float _543 = 1.0 / _541;
        float _545 = _123 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _551 = _547 + _549;
    bool _553 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _555 = isnan(_547);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _567 = _547 + _565;
    bool _569 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _571 = isnan(_547);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _589 = -_563;
    float _591 = _589 + 1.0;
    float _593 = 1.0 / _583;
    bool _595 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _597 = isnan(_547);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _579 * _591;
    float _609 = -_579;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _613;
    bool _617 = _143 > 0.5;
    float _619 = _605 * _611;
    float _621 = 1.0 / _587;
    float _623 = -_605;
    float _625 = _623 + 1.0;
    float _627 = -_221;
    int _629 = _617 ? as_type<int>(_627) : as_type<int>(_221);
    float _631 = _551 * _593;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    float _637 = in.m_54.x;
    float _639 = in.m_54.y;
    float _641 = fma(_615, _631, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _643 = fma(_635, _631, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _645 = in.m_49.y;
    float _647 = _567 * _621;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = _643 * _619;
    float _655 = _641 * _619;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _661 = fma(_651, _647, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _663 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _653);
    float _665 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _655);
    float _667 = fma(_659, _647, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _669 = in.m_60.w;
    float _671 = fma(_661, _607, _663);
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _675 = fma(_667, _607, _665);
    float _677 = in.m_56.w;
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[145].y, _671);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[145].x, _675);
    float _683 = _679 * _639;
    float _685 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _687 = _681 * _637;
    float _689 = _509 * _683;
    bool _691 = _645 > 0.5;
    float _693 = _509 * _687;
    float _695 = _333 * _319;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _699 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _701 = fma(_331, _317, _695);
    float _703 = _697 * _685;
    float _705 = _333 * _295;
    float _707 = _699 * _673;
    float _709 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _711 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _715 = fma(_331, _293, _705);
    float _717 = fma(_335, _321, _701);
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[26].x, _711);
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[24].x, _713);
    float _723 = fma(_335, _297, _715);
    float _725 = _333 * _305;
    float _727 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _729 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[24].z, _721);
    float _731 = _717 + _669;
    float _733 = _723 + _677;
    float _735 = _727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _737 = _729 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _739 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _741 = fma(_331, _303, _725);
    float _743 = _731 + _735;
    float _745 = _733 + _737;
    float _747 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[25].x, _739);
    float _749 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _751 = _743 + _749;
    float _753 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _755 = _745 + _753;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _759 = _757 != 0;
    float _761 = fma(_335, _307, _741);
    float _763 = _751 * _751;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _767 = _765 != 0;
    float _769 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[25].z, _747);
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _773 = fma(_755, _755, _763);
    bool _775 = !_759;
    float _777 = _775 ? _221 : as_type<float>(_629);
    float _779 = in.m_58.w;
    float _781 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = -_225;
    int _785 = _691 ? as_type<int>(_783) : as_type<int>(_225);
    float _787 = _777 + 0.5;
    float _789 = sqrt(_773);
    bool _791 = !_767;
    float _793 = _791 ? _225 : as_type<float>(_785);
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _797 = _795 * _771;
    bool _799 = _789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _801 = _761 + _779;
    float _803 = _801 + _781;
    float _805 = _781;
    float _807 = _771;
    float _809 = _779;
    if (!_799)
    {
        _805 = _745;
    }
    float _811 = _805;
    float _813 = _811;
    if (!_799)
    {
        _807 = _743;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_799)
    {
        _809 = _803;
    }
    float _819 = _809;
    bool _821 = !_799;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _789 + _827;
        float _831 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = rsqrt(_773);
        float _835 = _829 * _825;
        float _837 = _835 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = fma(_845, _831, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = _833 * _849;
        float _855 = fma(_803, _841, _851);
        float _857 = fma(_755, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_751, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _823 = _855;
        _813 = _857;
        _817 = _859;
    }
    float _861 = _823;
    float _863 = _813;
    float _865 = _817;
    float _867 = -_801;
    float _869 = _867 + _861;
    float _871 = -_733;
    float _873 = _871 + _863;
    float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _877 = -_731;
    float _879 = _877 + _865;
    float _881 = _869 * _869;
    float _883 = -_793;
    float _885 = _883 + 0.5;
    float _887 = fma(_873, _873, _881);
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _891 = fma(_879, _879, _887);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = sqrt(_891);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _907 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _909 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _907 * _875;
    out.m_62.x = _909;
    out.m_62.y = _911;
    out.m_62.z = _913;
    bool _923 = _897 > 0.0;
    out.m_64.x = _915;
    out.m_64.y = _917;
    out.m_64.z = _919;
    out.m_64.w = _901;
    out.m_66.x = _797;
    out.m_66.y = _921;
    bool _925 = !_923;
    float _927 = _919;
    float _929 = _915;
    float _931 = _917;
    float _933 = _863;
    float _935 = _865;
    float _937 = _861;
    if (!_925)
    {
        bool _939 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _941 = _909;
        if (_939)
        {
            float _943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _941 = _943;
        }
        float _945 = _941;
        if (_939)
        {
            float _947 = _501 * _945;
            _927 = _947;
        }
        float _949 = _927;
        float _951 = _949;
        if (_939)
        {
            float _953 = _503 * _945;
            _929 = _953;
        }
        float _955 = _929;
        float _957 = _955;
        float _959 = _955;
        if (_939)
        {
            float _961 = _505 * _945;
            _931 = _961;
        }
        float _963 = _931;
        float _965 = _963;
        if (!_939)
        {
            float _967 = _123 + 1.0;
            float _969 = _967;
            if (!_163)
            {
                float _971 = _967 * _967;
                float _973 = _971 * 0.5;
                _957 = _973;
            }
            float _975 = _957;
            float _977 = _975;
            if (!_163)
            {
                float _979 = _975 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _977 = _979;
            }
            float _981 = _977;
            bool _983 = !_163;
            float _985 = _981;
            if (!_983)
            {
                float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _989 = log2(_987);
                float _991 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _993 = _991 + 1.0;
                float _995 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _997 = _989 * _967;
                float _999 = 1.0 / _993;
                float _1001 = _995 * 0.693147182464599609375;
                float _1003 = exp2(_997);
                float _1005 = 1.0 / _1001;
                float _1007 = _1003 + (-1.0);
                float _1009 = -_1007;
                float _1011 = fma(_1009, _1005, _967);
                float _1013 = _1011 * _999;
                float _1015 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _985 = _1015;
            }
            float _1017 = _985;
            float _1019 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1021 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1023 = !_163;
            if (!_1023)
            {
                float _1025 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1027 = log2(_1025);
                float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1031 = _1029 + 1.0;
                float _1033 = 1.0 / _1031;
                float _1035 = _1027 * _967;
                float _1037 = exp2(_1035);
                float _1039 = -_1037;
                float _1041 = _1039 + 1.0;
                float _1043 = _1041 * _1033;
                _969 = _1043;
            }
            float _1045 = _969;
            float _1047 = fma(_1045, _167, _1021);
            float _1049 = fma(_1045, _165, _1019);
            float _1051 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1053 = -_451;
            float _1055 = _1053 + _1047;
            float _1057 = -_445;
            float _1059 = _1057 + _1049;
            float _1061 = fma(_1045, _169, _1051);
            float _1063 = _1055 * _295;
            float _1065 = _1055 * _305;
            float _1067 = _1055 * _319;
            float _1069 = -_457;
            float _1071 = _1069 + _1061;
            float _1073 = fma(_1059, _293, _1063);
            float _1075 = fma(_1059, _303, _1065);
            float _1077 = fma(_1059, _317, _1067);
            float _1079 = fma(_1071, _297, _1073);
            float _1081 = fma(_1071, _307, _1075);
            float _1083 = fma(_1071, _321, _1077);
            _513 = _1081;
            _515 = _1079;
            _517 = _1083;
            _951 = _1079;
            _959 = _1081;
            _965 = _1083;
            _519 = _1059;
        }
        float _1085 = _513;
        float _1087 = _515;
        float _1089 = _517;
        float _1091 = _951;
        float _1093 = _959;
        float _1095 = _965;
        float _1097 = _519;
        float _1099 = _1085 * _1085;
        float _1101 = rsqrt(_891);
        float _1103 = fma(_1087, _1087, _1099);
        float _1105 = fma(_1089, _1089, _1103);
        float _1107 = sqrt(_1105);
        float _1109 = _873 * _1101;
        float _1111 = _869 * _1101;
        float _1113 = _879 * _1101;
        bool _1115 = _1107 > 0.0;
        bool _1117 = !_1115;
        _521 = _1097;
        if (!_1117)
        {
            float _1119 = rsqrt(_1105);
            float _1121 = _1119 * _1085;
            float _1123 = _1119 * _1087;
            float _1125 = _1119 * _1089;
            float _1127 = _1111 * _1121;
            float _1129 = fma(_1109, _1123, _1127);
            float _1131 = fma(_1113, _1125, _1129);
            float _1133 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1135 = fma(_1091, _1133, _863);
            float _1137 = fma(_1093, _1133, _861);
            float _1139 = fma(_1095, _1133, _865);
            _933 = _1135;
            _935 = _1139;
            _937 = _1137;
        }
    }
    float _1141 = _933;
    float _1143 = _935;
    float _1145 = _937;
    float _1147 = _521;
    float _1149 = _801 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1151 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1153 = isnan(0.5);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1159 = _1155 || _1157;
    bool _1161 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1163 = isnan(0.5);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1169 = _1165 || _1167;
    float _1171 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1149);
    float _1173 = _801 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1175 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1171);
    float _1177 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1173);
    float _1179 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1181 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1177);
    float _1183 = _1175;
    float _1185 = _1173;
    float _1187 = _1145;
    float _1189 = _1147;
    if (_1159)
    {
        _1183 = _1141;
    }
    float _1191 = _1183;
    float _1193 = 1.0 / _1179;
    float _1195 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = _1191;
    float _1199 = _1195;
    if (_1159)
    {
        _1185 = _1143;
    }
    float _1201 = _1185;
    float _1203 = _1195 + _1179;
    float _1205 = _1201;
    if (!_1159)
    {
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1209 = _801 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1213 = _733 + _1211;
        float _1215 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = -_733;
        float _1219 = _1217 + _1141;
        float _1221 = _1209 * _1209;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1225 = _731 + _1223;
        float _1227 = -_801;
        float _1229 = _1227 + _1145;
        float _1231 = -_731;
        float _1233 = _1231 + _1143;
        float _1235 = fma(_1213, _1213, _1221);
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1239 = fma(_1225, _1225, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1245 = precise::min(_1241, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1237;
        float _1249 = _1243 * _1247;
        float _1251 = fma(_1219, _1249, _733);
        float _1253 = fma(_1229, _1249, _801);
        float _1255 = fma(_1233, _1249, _731);
        _1187 = _1253;
        _1197 = _1251;
        _1205 = _1255;
        _1199 = _1241;
    }
    float _1257 = _1187;
    float _1259 = _1197;
    float _1261 = _1205;
    float _1263 = _1199;
    float _1265 = _1263;
    if (_1169)
    {
        _1265 = 1.0;
    }
    float _1267 = _1265;
    float _1269 = _1203 * _1193;
    float _1271 = _1269 * 0.5;
    float _1273 = _1267;
    float _1275 = _1271;
    if (!_1169)
    {
        float _1277 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1283);
        float _1287 = _1279 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1281 * 0.15915493667125701904296875;
        float _1293 = _1279 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        float _1297 = 1.0 / _1289;
        float _1299 = _1291 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = _1295 * _1297;
        float _1305 = _1291 * 6.283185482025146484375;
        float _1307 = sin(_1305);
        float _1309 = _1301 * _1303;
        float _1311 = 1.0 / _1285;
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1313;
        float _1317 = 1.0 / _1309;
        float _1319 = 1.0 / _1315;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1323 = _1311 * _1321;
        float _1325 = _1307 * _1317;
        float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1329 = fma(_1325, _1323, _1327);
        float _1331 = _1329 * _1319;
        float _1333 = precise::clamp(_1331, 0.0, 1.0);
        _1273 = _1333;
    }
    float _1335 = _1273;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1257 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1343 = _1259 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1347 = _1261 + _1345;
    float _1349 = _1339 * _1339;
    float _1351 = fma(_1343, _1343, _1349);
    float _1353 = fma(_1347, _1347, _1351);
    float _1355 = rsqrt(_1353);
    float _1357 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1359 = _1343 * _1357;
    float _1361 = _1347 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 * _1361;
    float _1367 = _1363 + _1365;
    float _1369 = sqrt(_1367);
    bool _1371 = _1369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1369 + _1373;
    float _1377 = _1355;
    float _1379 = _1367;
    float _1381 = _1375;
    float _1383 = _1339;
    float _1385 = _1357;
    float _1387 = _1359;
    if (_1371)
    {
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1389;
    }
    float _1391 = _1377;
    if (_1371)
    {
        float _1393 = rsqrt(_1367);
        _1379 = _1393;
    }
    float _1395 = _1379;
    if (_1371)
    {
        float _1397 = _1375 * _1391;
        _1381 = _1397;
    }
    float _1399 = _1381;
    if (_1371)
    {
        float _1401 = _1399 * 0.15915493667125701904296875;
        _1275 = _1401;
    }
    float _1403 = _1275;
    float _1405 = _1391;
    if (_1371)
    {
        float _1407 = _1403 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1415 = precise::max(0.0, _1413);
    float _1417 = _1347;
    float _1419 = _1415;
    if (_1371)
    {
        float _1421 = _1403 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        _1417 = _1423;
    }
    float _1425 = _1417;
    float _1427 = -_1357;
    float _1429 = -_1415;
    float _1431 = fma(_1339, _1427, _1429);
    if (!_1371)
    {
        _1383 = _1361;
    }
    float _1433 = _1383;
    float _1435 = _1433;
    if (_1371)
    {
        float _1437 = _1431 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1419 = _1437;
    }
    float _1439 = _1419;
    float _1441 = _1411;
    float _1443 = _1439;
    if (_1371)
    {
        float _1445 = fma(_1411, _1439, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = _1447;
    float _1451 = _1425;
    if (_1371)
    {
        float _1453 = _1425 + (-1.0);
        _1443 = _1453;
    }
    float _1455 = _1443;
    float _1457 = _1455;
    if (_1371)
    {
        float _1459 = _1395 * _1447;
        _1189 = _1459;
    }
    float _1461 = _1189;
    if (!_1371)
    {
        _1449 = _1431;
    }
    float _1463 = _1449;
    float _1465 = sqrt(_1353);
    float _1467 = _1463;
    if (_1371)
    {
        float _1469 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1469;
    }
    float _1471 = _1385;
    if (_1371)
    {
        float _1473 = _1359 * _1461;
        _1387 = _1473;
    }
    float _1475 = _1387;
    if (!_1371)
    {
        _1457 = _1363;
    }
    float _1477 = _1457;
    float _1479 = _1477;
    if (_1371)
    {
        float _1481 = _1361 * _1461;
        _1435 = _1481;
    }
    float _1483 = _1435;
    if (_1371)
    {
        float _1485 = fma(_1431, _1425, _1471);
        _1467 = _1485;
    }
    float _1487 = _1467;
    if (_1371)
    {
        float _1489 = _1475 * _1475;
        _1479 = _1489;
    }
    float _1491 = _1479;
    if (!_1371)
    {
        _1451 = _1365;
    }
    float _1493 = _1451;
    float _1495 = _1493;
    if (_1371)
    {
        float _1497 = _1483 * _1483;
        _1495 = _1497;
    }
    float _1499 = _1495;
    float _1501 = fma(_1487, _1487, _1491);
    float _1503 = _1501 + _1499;
    float _1505 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1509 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1507);
    float _1511 = precise::clamp(_1509, 0.0, 1.0);
    float _1513 = rsqrt(_1503);
    float _1515 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1505);
    float _1517 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1519 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1521 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1523 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1525 = -_1511;
    float _1527 = _1525 + 1.0;
    float _1529 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1519);
    float _1531 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1517);
    float _1533 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1521);
    float _1535 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1515);
    float _1537 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1529);
    float _1539 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1531);
    float _1541 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1533);
    float _1543 = abs(_1527);
    float _1545 = log2(_1543);
    float _1547 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1551 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1553 = _1513 * _1475;
    float _1555 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1559 = _1513 * _1487;
    float _1561 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1565 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1557);
    float _1567 = _1513 * _1483;
    float _1569 = -_1561;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1569);
    float _1573 = -_1563;
    float _1575 = fma(_1573, _1523, 1.0);
    float _1577 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1579 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1581 = -_1567;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1571);
    float _1585 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1587 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1589 = log2(_1575);
    float _1591 = fma(_1583, -0.5, 0.5);
    float _1593 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1595 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1579);
    float _1597 = fma(_1583, 0.5, 0.5);
    float _1599 = _1559 + 1.0;
    float _1601 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1593);
    float _1603 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1595);
    float _1605 = exp2(_1585);
    float _1607 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1601);
    float _1609 = 1.0 / _1587;
    float _1611 = fma(_1597, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1613 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1603);
    float _1615 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1607);
    float _1617 = _1589 * 0.693147182464599609375;
    float _1619 = fma(_1597, _1611, -0.212114393711090087890625);
    float _1621 = sqrt(_1591);
    float _1623 = -_1559;
    float _1625 = fma(_1605, _1599, _1623);
    float _1627 = fma(_1597, _1619, 1.570728778839111328125);
    float _1629 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1631 = fma(_1625, 0.5, 0.5);
    float _1633 = _1613 * _1609;
    float _1635 = _1615 * _1609;
    float _1637 = fma(_1633, 0.5, 0.5);
    float _1639 = fma(_1635, -0.5, 0.5);
    float _1641 = _1621 * 0.636619746685028076171875;
    float3 _4182 = float3(_1637, _1639, _1629);
    float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4182, float3(0.0), isnan(_4182)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4182, float3(0.0), isnan(_4182)), level(0.0)).x;
    float3 _4193 = float3(_1637, _1639, _1629);
    float4 _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4193, float3(0.0), isnan(_4193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4193, float3(0.0), isnan(_4193)), level(0.0)).xyzw;
    float _1648 = _1646.x;
    float _1650 = _1646.y;
    float _1652 = _1646.z;
    float _1654 = _1646.w;
    float _1656 = -_1627;
    float _1658 = fma(_1641, _1656, 1.0);
    float2 _4215 = float2(_1658, _1631);
    float3 _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4215, float2(0.0), isnan(_4215)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4215, float2(0.0), isnan(_4215)), level(0.0)).xyz;
    float _1664 = _1662.x;
    float _1666 = _1662.y;
    float _1668 = _1662.z;
    float _1670 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1672 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1674 = _1335 > 0.0;
    bool _1676 = isnan(_1335);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(0.0);
    bool _1682 = _1678 || _1680;
    float _1684 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1686 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1672);
    float _1688 = exp2(_1670);
    float _1690 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1686);
    float _1692 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1690);
    float _1694 = _1692 + _1587;
    out.gl_Position.x = _1613;
    out.gl_Position.y = _1615;
    out.gl_Position.z = _1692;
    out.gl_Position.w = _1587;
    float _1696 = _1694 * 0.5;
    float _1698 = -_1688;
    float _1700 = _1698 + 1.0;
    float _1702 = _1684 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1704 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1696;
    out.m_68.w = _1587;
    out.m_45.x = _1702;
    float _1706 = _1704 * _1643;
    float _1708 = -_1704;
    float _1710 = _1708 + 1.0;
    float _1712 = _1654 * _1706;
    float _1714 = _1654 * _1710;
    float _1716 = _1668 * _1706;
    float _1718 = fma(_1664, _1712, _1648);
    float _1720 = fma(_1666, _1712, _1650);
    float _1722 = fma(_1654, _1716, _1652);
    out.m_70.x = _1718;
    out.m_70.y = _1720;
    out.m_70.z = _1722;
    out.m_70.w = _1714;
    if (_1682)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1724;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _539 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_105);
        out.gl_Position.z = _1781;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1850 = as_type<float>(_141);
        out.gl_Position.z = _1850;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _153 = in.m_54.w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_47.x;
    float _167 = in.m_47.y;
    float _169 = in.m_47.z;
    float _171 = in.m_42.x;
    float _173 = in.m_42.y;
    float _175 = in.m_42.z;
    float _177 = _147 * _145;
    float _179 = 0.0;
    float _181 = _151;
    if (!_163)
    {
        float _183 = _151 * _151;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _191 = _187;
    if (!_163)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = _189 * 6.283185482025146484375;
    float _199 = floor(_189);
    int _201 = as_type<int>(_149) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_149) & 2;
    bool _207 = _205 != 0;
    float _209 = _197 * 0.15915493667125701904296875;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = _209 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_203;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_207;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = -_199;
    float _229 = _189 + _227;
    bool _231 = !_163;
    float _233 = _195;
    float _235 = _153;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _151 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _151);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _265;
    }
    float _267 = _233;
    bool _269 = !_163;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _151 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _181 = _289;
    }
    float _291 = _181;
    float _293 = in.m_56.x;
    float _295 = in.m_56.y;
    float _297 = in.m_56.z;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _303 = in.m_58.x;
    float _305 = in.m_58.y;
    float _307 = in.m_58.z;
    bool _309 = _229 < 0.5;
    float _311 = float(_309);
    float _313 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _315 = fma(_291, _165, _299);
    float _317 = in.m_60.x;
    float _319 = in.m_60.y;
    float _321 = in.m_60.z;
    float _323 = fma(_291, _167, _301);
    float _325 = fma(_291, _169, _313);
    float _327 = -_311;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_315, _153, _171);
    float _333 = fma(_323, _153, _173);
    float _335 = fma(_325, _153, _175);
    float _337 = fma(_217, 0.5, 0.5);
    if (!_163)
    {
        float _339 = _123 * _123;
        float _341 = _339 * 0.5;
        _235 = _341;
    }
    float _343 = _235;
    float _345 = -_229;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _349 = -_337;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _353 = 0.0;
    float _355 = _343;
    if (!_163)
    {
        _353 = _123;
    }
    float _357 = _353;
    float _359 = _357;
    if (!_163)
    {
        float _361 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _361;
    }
    float _363 = _355;
    bool _365 = !_213;
    int _367 = _365 ? 0 : 1;
    bool _369 = !_163;
    float _371 = _363;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _123 * _375;
        float _385 = exp2(_383);
        float _387 = _381 * 0.693147182464599609375;
        float _389 = 1.0 / _387;
        float _391 = 1.0 / _379;
        float _393 = _385 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _389, _123);
        float _399 = _397 * _391;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_163;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _123 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _359 = _425;
    }
    float _427 = _359;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _435 = _433 != 0;
    float _437 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _441 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _443 = abs(_367);
    float _445 = fma(_427, _165, _437);
    bool _447 = !_431;
    int _449 = _447 ? 0 : 1;
    float _451 = fma(_427, _167, _439);
    bool _453 = !_435;
    int _455 = _453 ? 0 : 1;
    float _457 = fma(_427, _169, _441);
    int _459 = abs(_449);
    float _461 = -_451;
    float _463 = _323 + _461;
    int _465 = abs(_455);
    float _467 = -_445;
    float _469 = _315 + _467;
    float _471 = _463 * _295;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _475 = _463 * _305;
    float _477 = _463 * _319;
    float _479 = float(_459);
    float _481 = fma(_469, _293, _471);
    float _483 = fma(_469, _303, _475);
    float _485 = fma(_469, _317, _477);
    float _487 = float(_443);
    float _489 = abs(_347);
    float _491 = _479 * _489;
    float _493 = -_457;
    float _495 = _325 + _493;
    float _497 = fma(_487, _351, _491);
    float _499 = float(_465);
    float _501 = fma(_495, _297, _481);
    float _503 = fma(_495, _307, _483);
    float _505 = fma(_495, _321, _485);
    float _507 = abs(_329);
    float _509 = fma(_499, _507, _497);
    bool _511 = !_473;
    float _513 = _503;
    float _515 = _501;
    float _517 = _505;
    float _519 = _445;
    float _521 = _445;
    float _537;
    if (!_511)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _525 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_89);
        float _543 = 1.0 / _541;
        float _545 = _123 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _551 = _547 + _549;
    bool _553 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _555 = isnan(_547);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _567 = _547 + _565;
    bool _569 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _571 = isnan(_547);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _589 = -_563;
    float _591 = _589 + 1.0;
    float _593 = 1.0 / _583;
    bool _595 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _597 = isnan(_547);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _579 * _591;
    float _609 = -_579;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _613;
    bool _617 = _143 > 0.5;
    float _619 = _605 * _611;
    float _621 = 1.0 / _587;
    float _623 = -_605;
    float _625 = _623 + 1.0;
    float _627 = -_221;
    int _629 = _617 ? as_type<int>(_627) : as_type<int>(_221);
    float _631 = _551 * _593;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    float _637 = in.m_54.x;
    float _639 = in.m_54.y;
    float _641 = fma(_615, _631, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _643 = fma(_635, _631, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _645 = in.m_49.y;
    float _647 = _567 * _621;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = _643 * _619;
    float _655 = _641 * _619;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _661 = fma(_651, _647, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _663 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _653);
    float _665 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _655);
    float _667 = fma(_659, _647, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _669 = in.m_60.w;
    float _671 = fma(_661, _607, _663);
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _675 = fma(_667, _607, _665);
    float _677 = in.m_56.w;
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[145].y, _671);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[145].x, _675);
    float _683 = _679 * _639;
    float _685 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _687 = _681 * _637;
    float _689 = _509 * _683;
    bool _691 = _645 > 0.5;
    float _693 = _509 * _687;
    float _695 = _333 * _319;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _699 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _701 = fma(_331, _317, _695);
    float _703 = _697 * _685;
    float _705 = _333 * _295;
    float _707 = _699 * _673;
    float _709 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _711 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _715 = fma(_331, _293, _705);
    float _717 = fma(_335, _321, _701);
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[26].x, _711);
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[24].x, _713);
    float _723 = fma(_335, _297, _715);
    float _725 = _333 * _305;
    float _727 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _729 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[24].z, _721);
    float _731 = _717 + _669;
    float _733 = _723 + _677;
    float _735 = _727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _737 = _729 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _739 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _741 = fma(_331, _303, _725);
    float _743 = _731 + _735;
    float _745 = _733 + _737;
    float _747 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[25].x, _739);
    float _749 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _751 = _743 + _749;
    float _753 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _755 = _745 + _753;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _759 = _757 != 0;
    float _761 = fma(_335, _307, _741);
    float _763 = _751 * _751;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _767 = _765 != 0;
    float _769 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[25].z, _747);
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _773 = fma(_755, _755, _763);
    bool _775 = !_759;
    float _777 = _775 ? _221 : as_type<float>(_629);
    float _779 = in.m_58.w;
    float _781 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = -_225;
    int _785 = _691 ? as_type<int>(_783) : as_type<int>(_225);
    float _787 = _777 + 0.5;
    float _789 = sqrt(_773);
    bool _791 = !_767;
    float _793 = _791 ? _225 : as_type<float>(_785);
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _797 = _795 * _771;
    bool _799 = _789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _801 = _761 + _779;
    float _803 = _801 + _781;
    float _805 = _781;
    float _807 = _771;
    float _809 = _779;
    if (!_799)
    {
        _805 = _745;
    }
    float _811 = _805;
    float _813 = _811;
    if (!_799)
    {
        _807 = _743;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_799)
    {
        _809 = _803;
    }
    float _819 = _809;
    bool _821 = !_799;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _789 + _827;
        float _831 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = rsqrt(_773);
        float _835 = _829 * _825;
        float _837 = _835 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = fma(_845, _831, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = _833 * _849;
        float _855 = fma(_803, _841, _851);
        float _857 = fma(_755, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_751, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _823 = _855;
        _813 = _857;
        _817 = _859;
    }
    float _861 = _823;
    float _863 = _813;
    float _865 = _817;
    float _867 = -_801;
    float _869 = _867 + _861;
    float _871 = -_733;
    float _873 = _871 + _863;
    float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _877 = -_731;
    float _879 = _877 + _865;
    float _881 = _869 * _869;
    float _883 = -_793;
    float _885 = _883 + 0.5;
    float _887 = fma(_873, _873, _881);
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _891 = fma(_879, _879, _887);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = sqrt(_891);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _907 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _909 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _907 * _875;
    out.m_62.x = _909;
    out.m_62.y = _911;
    out.m_62.z = _913;
    bool _923 = _897 > 0.0;
    out.m_64.x = _915;
    out.m_64.y = _917;
    out.m_64.z = _919;
    out.m_64.w = _901;
    out.m_66.x = _797;
    out.m_66.y = _921;
    bool _925 = !_923;
    float _927 = _919;
    float _929 = _915;
    float _931 = _917;
    float _933 = _863;
    float _935 = _865;
    float _937 = _861;
    if (!_925)
    {
        bool _939 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _941 = _909;
        if (_939)
        {
            float _943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _941 = _943;
        }
        float _945 = _941;
        if (_939)
        {
            float _947 = _501 * _945;
            _927 = _947;
        }
        float _949 = _927;
        float _951 = _949;
        if (_939)
        {
            float _953 = _503 * _945;
            _929 = _953;
        }
        float _955 = _929;
        float _957 = _955;
        float _959 = _955;
        if (_939)
        {
            float _961 = _505 * _945;
            _931 = _961;
        }
        float _963 = _931;
        float _965 = _963;
        if (!_939)
        {
            float _967 = _123 + 1.0;
            float _969 = _967;
            if (!_163)
            {
                float _971 = _967 * _967;
                float _973 = _971 * 0.5;
                _957 = _973;
            }
            float _975 = _957;
            float _977 = _975;
            if (!_163)
            {
                float _979 = _975 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _977 = _979;
            }
            float _981 = _977;
            bool _983 = !_163;
            float _985 = _981;
            if (!_983)
            {
                float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _989 = log2(_987);
                float _991 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _993 = _991 + 1.0;
                float _995 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _997 = _989 * _967;
                float _999 = 1.0 / _993;
                float _1001 = _995 * 0.693147182464599609375;
                float _1003 = exp2(_997);
                float _1005 = 1.0 / _1001;
                float _1007 = _1003 + (-1.0);
                float _1009 = -_1007;
                float _1011 = fma(_1009, _1005, _967);
                float _1013 = _1011 * _999;
                float _1015 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _985 = _1015;
            }
            float _1017 = _985;
            float _1019 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1021 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1023 = !_163;
            if (!_1023)
            {
                float _1025 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1027 = log2(_1025);
                float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1031 = _1029 + 1.0;
                float _1033 = 1.0 / _1031;
                float _1035 = _1027 * _967;
                float _1037 = exp2(_1035);
                float _1039 = -_1037;
                float _1041 = _1039 + 1.0;
                float _1043 = _1041 * _1033;
                _969 = _1043;
            }
            float _1045 = _969;
            float _1047 = fma(_1045, _167, _1021);
            float _1049 = fma(_1045, _165, _1019);
            float _1051 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1053 = -_451;
            float _1055 = _1053 + _1047;
            float _1057 = -_445;
            float _1059 = _1057 + _1049;
            float _1061 = fma(_1045, _169, _1051);
            float _1063 = _1055 * _295;
            float _1065 = _1055 * _305;
            float _1067 = _1055 * _319;
            float _1069 = -_457;
            float _1071 = _1069 + _1061;
            float _1073 = fma(_1059, _293, _1063);
            float _1075 = fma(_1059, _303, _1065);
            float _1077 = fma(_1059, _317, _1067);
            float _1079 = fma(_1071, _297, _1073);
            float _1081 = fma(_1071, _307, _1075);
            float _1083 = fma(_1071, _321, _1077);
            _513 = _1081;
            _515 = _1079;
            _517 = _1083;
            _951 = _1079;
            _959 = _1081;
            _965 = _1083;
            _519 = _1059;
        }
        float _1085 = _513;
        float _1087 = _515;
        float _1089 = _517;
        float _1091 = _951;
        float _1093 = _959;
        float _1095 = _965;
        float _1097 = _519;
        float _1099 = _1085 * _1085;
        float _1101 = rsqrt(_891);
        float _1103 = fma(_1087, _1087, _1099);
        float _1105 = fma(_1089, _1089, _1103);
        float _1107 = sqrt(_1105);
        float _1109 = _873 * _1101;
        float _1111 = _869 * _1101;
        float _1113 = _879 * _1101;
        bool _1115 = _1107 > 0.0;
        bool _1117 = !_1115;
        _521 = _1097;
        if (!_1117)
        {
            float _1119 = rsqrt(_1105);
            float _1121 = _1119 * _1085;
            float _1123 = _1119 * _1087;
            float _1125 = _1119 * _1089;
            float _1127 = _1111 * _1121;
            float _1129 = fma(_1109, _1123, _1127);
            float _1131 = fma(_1113, _1125, _1129);
            float _1133 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1135 = fma(_1091, _1133, _863);
            float _1137 = fma(_1093, _1133, _861);
            float _1139 = fma(_1095, _1133, _865);
            _933 = _1135;
            _935 = _1139;
            _937 = _1137;
        }
    }
    float _1141 = _933;
    float _1143 = _935;
    float _1145 = _937;
    float _1147 = _521;
    float _1149 = _801 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1151 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1153 = isnan(0.5);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1159 = _1155 || _1157;
    bool _1161 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1163 = isnan(0.5);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1169 = _1165 || _1167;
    float _1171 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1149);
    float _1173 = _801 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1175 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1171);
    float _1177 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1173);
    float _1179 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1181 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1177);
    float _1183 = _1175;
    float _1185 = _1173;
    float _1187 = _1145;
    float _1189 = _1147;
    if (_1159)
    {
        _1183 = _1141;
    }
    float _1191 = _1183;
    float _1193 = 1.0 / _1179;
    float _1195 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = _1191;
    float _1199 = _1195;
    if (_1159)
    {
        _1185 = _1143;
    }
    float _1201 = _1185;
    float _1203 = _1195 + _1179;
    float _1205 = _1201;
    if (!_1159)
    {
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1209 = _801 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1213 = _733 + _1211;
        float _1215 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = -_733;
        float _1219 = _1217 + _1141;
        float _1221 = _1209 * _1209;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1225 = _731 + _1223;
        float _1227 = -_801;
        float _1229 = _1227 + _1145;
        float _1231 = -_731;
        float _1233 = _1231 + _1143;
        float _1235 = fma(_1213, _1213, _1221);
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1239 = fma(_1225, _1225, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1245 = precise::min(_1241, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1237;
        float _1249 = _1243 * _1247;
        float _1251 = fma(_1219, _1249, _733);
        float _1253 = fma(_1229, _1249, _801);
        float _1255 = fma(_1233, _1249, _731);
        _1187 = _1253;
        _1197 = _1251;
        _1205 = _1255;
        _1199 = _1241;
    }
    float _1257 = _1187;
    float _1259 = _1197;
    float _1261 = _1205;
    float _1263 = _1199;
    float _1265 = _1263;
    if (_1169)
    {
        _1265 = 1.0;
    }
    float _1267 = _1265;
    float _1269 = _1203 * _1193;
    float _1271 = _1269 * 0.5;
    float _1273 = _1267;
    float _1275 = _1271;
    if (!_1169)
    {
        float _1277 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1283);
        float _1287 = _1279 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1281 * 0.15915493667125701904296875;
        float _1293 = _1279 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        float _1297 = 1.0 / _1289;
        float _1299 = _1291 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = _1295 * _1297;
        float _1305 = _1291 * 6.283185482025146484375;
        float _1307 = sin(_1305);
        float _1309 = _1301 * _1303;
        float _1311 = 1.0 / _1285;
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1313;
        float _1317 = 1.0 / _1309;
        float _1319 = 1.0 / _1315;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1323 = _1311 * _1321;
        float _1325 = _1307 * _1317;
        float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1329 = fma(_1325, _1323, _1327);
        float _1331 = _1329 * _1319;
        float _1333 = precise::clamp(_1331, 0.0, 1.0);
        _1273 = _1333;
    }
    float _1335 = _1273;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1257 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1343 = _1259 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1347 = _1261 + _1345;
    float _1349 = _1339 * _1339;
    float _1351 = fma(_1343, _1343, _1349);
    float _1353 = fma(_1347, _1347, _1351);
    float _1355 = rsqrt(_1353);
    float _1357 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1359 = _1343 * _1357;
    float _1361 = _1347 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 * _1361;
    float _1367 = _1363 + _1365;
    float _1369 = sqrt(_1367);
    bool _1371 = _1369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1369 + _1373;
    float _1377 = _1355;
    float _1379 = _1367;
    float _1381 = _1375;
    float _1383 = _1339;
    float _1385 = _1357;
    float _1387 = _1359;
    if (_1371)
    {
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1389;
    }
    float _1391 = _1377;
    if (_1371)
    {
        float _1393 = rsqrt(_1367);
        _1379 = _1393;
    }
    float _1395 = _1379;
    if (_1371)
    {
        float _1397 = _1375 * _1391;
        _1381 = _1397;
    }
    float _1399 = _1381;
    if (_1371)
    {
        float _1401 = _1399 * 0.15915493667125701904296875;
        _1275 = _1401;
    }
    float _1403 = _1275;
    float _1405 = _1391;
    if (_1371)
    {
        float _1407 = _1403 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1415 = precise::max(0.0, _1413);
    float _1417 = _1347;
    float _1419 = _1415;
    if (_1371)
    {
        float _1421 = _1403 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        _1417 = _1423;
    }
    float _1425 = _1417;
    float _1427 = -_1357;
    float _1429 = -_1415;
    float _1431 = fma(_1339, _1427, _1429);
    if (!_1371)
    {
        _1383 = _1361;
    }
    float _1433 = _1383;
    float _1435 = _1433;
    if (_1371)
    {
        float _1437 = _1431 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1419 = _1437;
    }
    float _1439 = _1419;
    float _1441 = _1411;
    float _1443 = _1439;
    if (_1371)
    {
        float _1445 = fma(_1411, _1439, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = _1447;
    float _1451 = _1425;
    if (_1371)
    {
        float _1453 = _1425 + (-1.0);
        _1443 = _1453;
    }
    float _1455 = _1443;
    float _1457 = _1455;
    if (_1371)
    {
        float _1459 = _1395 * _1447;
        _1189 = _1459;
    }
    float _1461 = _1189;
    if (!_1371)
    {
        _1449 = _1431;
    }
    float _1463 = _1449;
    float _1465 = sqrt(_1353);
    float _1467 = _1463;
    if (_1371)
    {
        float _1469 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1469;
    }
    float _1471 = _1385;
    if (_1371)
    {
        float _1473 = _1359 * _1461;
        _1387 = _1473;
    }
    float _1475 = _1387;
    if (!_1371)
    {
        _1457 = _1363;
    }
    float _1477 = _1457;
    float _1479 = _1477;
    if (_1371)
    {
        float _1481 = _1361 * _1461;
        _1435 = _1481;
    }
    float _1483 = _1435;
    if (_1371)
    {
        float _1485 = fma(_1431, _1425, _1471);
        _1467 = _1485;
    }
    float _1487 = _1467;
    if (_1371)
    {
        float _1489 = _1475 * _1475;
        _1479 = _1489;
    }
    float _1491 = _1479;
    if (!_1371)
    {
        _1451 = _1365;
    }
    float _1493 = _1451;
    float _1495 = _1493;
    if (_1371)
    {
        float _1497 = _1483 * _1483;
        _1495 = _1497;
    }
    float _1499 = _1495;
    float _1501 = fma(_1487, _1487, _1491);
    float _1503 = _1501 + _1499;
    float _1505 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1509 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1507);
    float _1511 = precise::clamp(_1509, 0.0, 1.0);
    float _1513 = rsqrt(_1503);
    float _1515 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1505);
    float _1517 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1519 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1521 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1523 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1525 = -_1511;
    float _1527 = _1525 + 1.0;
    float _1529 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1519);
    float _1531 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1517);
    float _1533 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1521);
    float _1535 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1515);
    float _1537 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1529);
    float _1539 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1531);
    float _1541 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1533);
    float _1543 = abs(_1527);
    float _1545 = log2(_1543);
    float _1547 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1551 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1553 = _1513 * _1475;
    float _1555 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1559 = _1513 * _1487;
    float _1561 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1565 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1557);
    float _1567 = _1513 * _1483;
    float _1569 = -_1561;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1569);
    float _1573 = -_1563;
    float _1575 = fma(_1573, _1523, 1.0);
    float _1577 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1579 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1581 = -_1567;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1571);
    float _1585 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1587 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1589 = log2(_1575);
    float _1591 = fma(_1583, -0.5, 0.5);
    float _1593 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1595 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1579);
    float _1597 = fma(_1583, 0.5, 0.5);
    float _1599 = _1559 + 1.0;
    float _1601 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1593);
    float _1603 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1595);
    float _1605 = exp2(_1585);
    float _1607 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1601);
    float _1609 = 1.0 / _1587;
    float _1611 = fma(_1597, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1613 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1603);
    float _1615 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1607);
    float _1617 = _1589 * 0.693147182464599609375;
    float _1619 = fma(_1597, _1611, -0.212114393711090087890625);
    float _1621 = sqrt(_1591);
    float _1623 = -_1559;
    float _1625 = fma(_1605, _1599, _1623);
    float _1627 = fma(_1597, _1619, 1.570728778839111328125);
    float _1629 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1631 = fma(_1625, 0.5, 0.5);
    float _1633 = _1613 * _1609;
    float _1635 = _1615 * _1609;
    float _1637 = fma(_1633, 0.5, 0.5);
    float _1639 = fma(_1635, -0.5, 0.5);
    float _1641 = _1621 * 0.636619746685028076171875;
    float3 _4182 = float3(_1637, _1639, _1629);
    float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4182, float3(0.0), isnan(_4182)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4182, float3(0.0), isnan(_4182)), level(0.0)).x;
    float3 _4193 = float3(_1637, _1639, _1629);
    float4 _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4193, float3(0.0), isnan(_4193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4193, float3(0.0), isnan(_4193)), level(0.0)).xyzw;
    float _1648 = _1646.x;
    float _1650 = _1646.y;
    float _1652 = _1646.z;
    float _1654 = _1646.w;
    float _1656 = -_1627;
    float _1658 = fma(_1641, _1656, 1.0);
    float2 _4215 = float2(_1658, _1631);
    float3 _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4215, float2(0.0), isnan(_4215)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4215, float2(0.0), isnan(_4215)), level(0.0)).xyz;
    float _1664 = _1662.x;
    float _1666 = _1662.y;
    float _1668 = _1662.z;
    float _1670 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1672 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1674 = _1335 > 0.0;
    bool _1676 = isnan(_1335);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(0.0);
    bool _1682 = _1678 || _1680;
    float _1684 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1686 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1672);
    float _1688 = exp2(_1670);
    float _1690 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1686);
    float _1692 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1690);
    float _1694 = _1692 + _1587;
    out.gl_Position.x = _1613;
    out.gl_Position.y = _1615;
    out.gl_Position.z = _1692;
    out.gl_Position.w = _1587;
    float _1696 = _1694 * 0.5;
    float _1698 = -_1688;
    float _1700 = _1698 + 1.0;
    float _1702 = _1684 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1704 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1696;
    out.m_68.w = _1587;
    out.m_45.x = _1702;
    float _1706 = _1704 * _1643;
    float _1708 = -_1704;
    float _1710 = _1708 + 1.0;
    float _1712 = _1654 * _1706;
    float _1714 = _1654 * _1710;
    float _1716 = _1668 * _1706;
    float _1718 = fma(_1664, _1712, _1648);
    float _1720 = fma(_1666, _1712, _1650);
    float _1722 = fma(_1654, _1716, _1652);
    out.m_70.x = _1718;
    out.m_70.y = _1720;
    out.m_70.z = _1722;
    out.m_70.w = _1714;
    if (_1682)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1724;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _539 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1781 = as_type<float>(_105);
        out.gl_Position.z = _1781;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1850 = as_type<float>(_141);
        out.gl_Position.z = _1850;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _153 = in.m_54.w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_47.x;
    float _167 = in.m_47.y;
    float _169 = in.m_47.z;
    float _171 = in.m_42.x;
    float _173 = in.m_42.y;
    float _175 = in.m_42.z;
    float _177 = _147 * _145;
    float _179 = 0.0;
    float _181 = _151;
    if (!_163)
    {
        float _183 = _151 * _151;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _191 = _187;
    if (!_163)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = _189 * 6.283185482025146484375;
    float _199 = floor(_189);
    int _201 = as_type<int>(_149) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_149) & 2;
    bool _207 = _205 != 0;
    float _209 = _197 * 0.15915493667125701904296875;
    int _211 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _213 = _211 != 0;
    float _215 = _209 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_203;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_207;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = -_199;
    float _229 = _189 + _227;
    bool _231 = !_163;
    float _233 = _195;
    float _235 = _153;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _151 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _151);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _265;
    }
    float _267 = _233;
    bool _269 = !_163;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _151 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _181 = _289;
    }
    float _291 = _181;
    float _293 = in.m_56.x;
    float _295 = in.m_56.y;
    float _297 = in.m_56.z;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _303 = in.m_58.x;
    float _305 = in.m_58.y;
    float _307 = in.m_58.z;
    bool _309 = _229 < 0.5;
    float _311 = float(_309);
    float _313 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _315 = fma(_291, _165, _299);
    float _317 = in.m_60.x;
    float _319 = in.m_60.y;
    float _321 = in.m_60.z;
    float _323 = fma(_291, _167, _301);
    float _325 = fma(_291, _169, _313);
    float _327 = -_311;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_315, _153, _171);
    float _333 = fma(_323, _153, _173);
    float _335 = fma(_325, _153, _175);
    float _337 = fma(_217, 0.5, 0.5);
    if (!_163)
    {
        float _339 = _123 * _123;
        float _341 = _339 * 0.5;
        _235 = _341;
    }
    float _343 = _235;
    float _345 = -_229;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _349 = -_337;
    float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _353 = 0.0;
    float _355 = _343;
    if (!_163)
    {
        _353 = _123;
    }
    float _357 = _353;
    float _359 = _357;
    if (!_163)
    {
        float _361 = _343 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _361;
    }
    float _363 = _355;
    bool _365 = !_213;
    int _367 = _365 ? 0 : 1;
    bool _369 = !_163;
    float _371 = _363;
    if (!_369)
    {
        float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = log2(_373);
        float _377 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _379 = _377 + 1.0;
        float _381 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = _123 * _375;
        float _385 = exp2(_383);
        float _387 = _381 * 0.693147182464599609375;
        float _389 = 1.0 / _387;
        float _391 = 1.0 / _379;
        float _393 = _385 + (-1.0);
        float _395 = -_393;
        float _397 = fma(_395, _389, _123);
        float _399 = _397 * _391;
        float _401 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _371 = _401;
    }
    float _403 = _371;
    bool _405 = !_163;
    if (!_405)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _123 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _359 = _425;
    }
    float _427 = _359;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _431 = _429 != 0;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _435 = _433 != 0;
    float _437 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _441 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _443 = abs(_367);
    float _445 = fma(_427, _165, _437);
    bool _447 = !_431;
    int _449 = _447 ? 0 : 1;
    float _451 = fma(_427, _167, _439);
    bool _453 = !_435;
    int _455 = _453 ? 0 : 1;
    float _457 = fma(_427, _169, _441);
    int _459 = abs(_449);
    float _461 = -_451;
    float _463 = _323 + _461;
    int _465 = abs(_455);
    float _467 = -_445;
    float _469 = _315 + _467;
    float _471 = _463 * _295;
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _475 = _463 * _305;
    float _477 = _463 * _319;
    float _479 = float(_459);
    float _481 = fma(_469, _293, _471);
    float _483 = fma(_469, _303, _475);
    float _485 = fma(_469, _317, _477);
    float _487 = float(_443);
    float _489 = abs(_347);
    float _491 = _479 * _489;
    float _493 = -_457;
    float _495 = _325 + _493;
    float _497 = fma(_487, _351, _491);
    float _499 = float(_465);
    float _501 = fma(_495, _297, _481);
    float _503 = fma(_495, _307, _483);
    float _505 = fma(_495, _321, _485);
    float _507 = abs(_329);
    float _509 = fma(_499, _507, _497);
    bool _511 = !_473;
    float _513 = _503;
    float _515 = _501;
    float _517 = _505;
    float _519 = _445;
    float _521 = _445;
    float _537;
    if (!_511)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _525 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_89);
        float _543 = 1.0 / _541;
        float _545 = _123 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _551 = _547 + _549;
    bool _553 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _555 = isnan(_547);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _567 = _547 + _565;
    bool _569 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _571 = isnan(_547);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _589 = -_563;
    float _591 = _589 + 1.0;
    float _593 = 1.0 / _583;
    bool _595 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _597 = isnan(_547);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _579 * _591;
    float _609 = -_579;
    float _611 = _609 + 1.0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _613;
    bool _617 = _143 > 0.5;
    float _619 = _605 * _611;
    float _621 = 1.0 / _587;
    float _623 = -_605;
    float _625 = _623 + 1.0;
    float _627 = -_221;
    int _629 = _617 ? as_type<int>(_627) : as_type<int>(_221);
    float _631 = _551 * _593;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _633;
    float _637 = in.m_54.x;
    float _639 = in.m_54.y;
    float _641 = fma(_615, _631, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _643 = fma(_635, _631, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _645 = in.m_49.y;
    float _647 = _567 * _621;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = _643 * _619;
    float _655 = _641 * _619;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _661 = fma(_651, _647, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _663 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].y, _653);
    float _665 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[143].x, _655);
    float _667 = fma(_659, _647, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _669 = in.m_60.w;
    float _671 = fma(_661, _607, _663);
    float _673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _675 = fma(_667, _607, _665);
    float _677 = in.m_56.w;
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[145].y, _671);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[145].x, _675);
    float _683 = _679 * _639;
    float _685 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _687 = _681 * _637;
    float _689 = _509 * _683;
    bool _691 = _645 > 0.5;
    float _693 = _509 * _687;
    float _695 = _333 * _319;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _699 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _701 = fma(_331, _317, _695);
    float _703 = _697 * _685;
    float _705 = _333 * _295;
    float _707 = _699 * _673;
    float _709 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _711 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _713 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _715 = fma(_331, _293, _705);
    float _717 = fma(_335, _321, _701);
    float _719 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[26].x, _711);
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[24].x, _713);
    float _723 = fma(_335, _297, _715);
    float _725 = _333 * _305;
    float _727 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _729 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[24].z, _721);
    float _731 = _717 + _669;
    float _733 = _723 + _677;
    float _735 = _727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _737 = _729 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _739 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _741 = fma(_331, _303, _725);
    float _743 = _731 + _735;
    float _745 = _733 + _737;
    float _747 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[25].x, _739);
    float _749 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _751 = _743 + _749;
    float _753 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _755 = _745 + _753;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _759 = _757 != 0;
    float _761 = fma(_335, _307, _741);
    float _763 = _751 * _751;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _767 = _765 != 0;
    float _769 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[25].z, _747);
    float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _773 = fma(_755, _755, _763);
    bool _775 = !_759;
    float _777 = _775 ? _221 : as_type<float>(_629);
    float _779 = in.m_58.w;
    float _781 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = -_225;
    int _785 = _691 ? as_type<int>(_783) : as_type<int>(_225);
    float _787 = _777 + 0.5;
    float _789 = sqrt(_773);
    bool _791 = !_767;
    float _793 = _791 ? _225 : as_type<float>(_785);
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _797 = _795 * _771;
    bool _799 = _789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _801 = _761 + _779;
    float _803 = _801 + _781;
    float _805 = _781;
    float _807 = _771;
    float _809 = _779;
    if (!_799)
    {
        _805 = _745;
    }
    float _811 = _805;
    float _813 = _811;
    if (!_799)
    {
        _807 = _743;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_799)
    {
        _809 = _803;
    }
    float _819 = _809;
    bool _821 = !_799;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _789 + _827;
        float _831 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _833 = rsqrt(_773);
        float _835 = _829 * _825;
        float _837 = _835 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = fma(_845, _831, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = _833 * _849;
        float _855 = fma(_803, _841, _851);
        float _857 = fma(_755, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_751, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _823 = _855;
        _813 = _857;
        _817 = _859;
    }
    float _861 = _823;
    float _863 = _813;
    float _865 = _817;
    float _867 = -_801;
    float _869 = _867 + _861;
    float _871 = -_733;
    float _873 = _871 + _863;
    float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _877 = -_731;
    float _879 = _877 + _865;
    float _881 = _869 * _869;
    float _883 = -_793;
    float _885 = _883 + 0.5;
    float _887 = fma(_873, _873, _881);
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _891 = fma(_879, _879, _887);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = sqrt(_891);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _907 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _909 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _907 * _875;
    out.m_62.x = _909;
    out.m_62.y = _911;
    out.m_62.z = _913;
    bool _923 = _897 > 0.0;
    out.m_64.x = _915;
    out.m_64.y = _917;
    out.m_64.z = _919;
    out.m_64.w = _901;
    out.m_66.x = _797;
    out.m_66.y = _921;
    bool _925 = !_923;
    float _927 = _919;
    float _929 = _915;
    float _931 = _917;
    float _933 = _863;
    float _935 = _865;
    float _937 = _861;
    if (!_925)
    {
        bool _939 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _941 = _909;
        if (_939)
        {
            float _943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _941 = _943;
        }
        float _945 = _941;
        if (_939)
        {
            float _947 = _501 * _945;
            _927 = _947;
        }
        float _949 = _927;
        float _951 = _949;
        if (_939)
        {
            float _953 = _503 * _945;
            _929 = _953;
        }
        float _955 = _929;
        float _957 = _955;
        float _959 = _955;
        if (_939)
        {
            float _961 = _505 * _945;
            _931 = _961;
        }
        float _963 = _931;
        float _965 = _963;
        if (!_939)
        {
            float _967 = _123 + 1.0;
            float _969 = _967;
            if (!_163)
            {
                float _971 = _967 * _967;
                float _973 = _971 * 0.5;
                _957 = _973;
            }
            float _975 = _957;
            float _977 = _975;
            if (!_163)
            {
                float _979 = _975 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _977 = _979;
            }
            float _981 = _977;
            bool _983 = !_163;
            float _985 = _981;
            if (!_983)
            {
                float _987 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _989 = log2(_987);
                float _991 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _993 = _991 + 1.0;
                float _995 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _997 = _989 * _967;
                float _999 = 1.0 / _993;
                float _1001 = _995 * 0.693147182464599609375;
                float _1003 = exp2(_997);
                float _1005 = 1.0 / _1001;
                float _1007 = _1003 + (-1.0);
                float _1009 = -_1007;
                float _1011 = fma(_1009, _1005, _967);
                float _1013 = _1011 * _999;
                float _1015 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _985 = _1015;
            }
            float _1017 = _985;
            float _1019 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1021 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1023 = !_163;
            if (!_1023)
            {
                float _1025 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1027 = log2(_1025);
                float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1031 = _1029 + 1.0;
                float _1033 = 1.0 / _1031;
                float _1035 = _1027 * _967;
                float _1037 = exp2(_1035);
                float _1039 = -_1037;
                float _1041 = _1039 + 1.0;
                float _1043 = _1041 * _1033;
                _969 = _1043;
            }
            float _1045 = _969;
            float _1047 = fma(_1045, _167, _1021);
            float _1049 = fma(_1045, _165, _1019);
            float _1051 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1053 = -_451;
            float _1055 = _1053 + _1047;
            float _1057 = -_445;
            float _1059 = _1057 + _1049;
            float _1061 = fma(_1045, _169, _1051);
            float _1063 = _1055 * _295;
            float _1065 = _1055 * _305;
            float _1067 = _1055 * _319;
            float _1069 = -_457;
            float _1071 = _1069 + _1061;
            float _1073 = fma(_1059, _293, _1063);
            float _1075 = fma(_1059, _303, _1065);
            float _1077 = fma(_1059, _317, _1067);
            float _1079 = fma(_1071, _297, _1073);
            float _1081 = fma(_1071, _307, _1075);
            float _1083 = fma(_1071, _321, _1077);
            _513 = _1081;
            _515 = _1079;
            _517 = _1083;
            _951 = _1079;
            _959 = _1081;
            _965 = _1083;
            _519 = _1059;
        }
        float _1085 = _513;
        float _1087 = _515;
        float _1089 = _517;
        float _1091 = _951;
        float _1093 = _959;
        float _1095 = _965;
        float _1097 = _519;
        float _1099 = _1085 * _1085;
        float _1101 = rsqrt(_891);
        float _1103 = fma(_1087, _1087, _1099);
        float _1105 = fma(_1089, _1089, _1103);
        float _1107 = sqrt(_1105);
        float _1109 = _873 * _1101;
        float _1111 = _869 * _1101;
        float _1113 = _879 * _1101;
        bool _1115 = _1107 > 0.0;
        bool _1117 = !_1115;
        _521 = _1097;
        if (!_1117)
        {
            float _1119 = rsqrt(_1105);
            float _1121 = _1119 * _1085;
            float _1123 = _1119 * _1087;
            float _1125 = _1119 * _1089;
            float _1127 = _1111 * _1121;
            float _1129 = fma(_1109, _1123, _1127);
            float _1131 = fma(_1113, _1125, _1129);
            float _1133 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1135 = fma(_1091, _1133, _863);
            float _1137 = fma(_1093, _1133, _861);
            float _1139 = fma(_1095, _1133, _865);
            _933 = _1135;
            _935 = _1139;
            _937 = _1137;
        }
    }
    float _1141 = _933;
    float _1143 = _935;
    float _1145 = _937;
    float _1147 = _521;
    float _1149 = _801 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1151 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1153 = isnan(0.5);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1159 = _1155 || _1157;
    bool _1161 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1163 = isnan(0.5);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1169 = _1165 || _1167;
    float _1171 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1149);
    float _1173 = _801 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1175 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1171);
    float _1177 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1173);
    float _1179 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1181 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1177);
    float _1183 = _1175;
    float _1185 = _1173;
    float _1187 = _1145;
    float _1189 = _1147;
    if (_1159)
    {
        _1183 = _1141;
    }
    float _1191 = _1183;
    float _1193 = 1.0 / _1179;
    float _1195 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = _1191;
    float _1199 = _1195;
    if (_1159)
    {
        _1185 = _1143;
    }
    float _1201 = _1185;
    float _1203 = _1195 + _1179;
    float _1205 = _1201;
    if (!_1159)
    {
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1209 = _801 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1213 = _733 + _1211;
        float _1215 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = -_733;
        float _1219 = _1217 + _1141;
        float _1221 = _1209 * _1209;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1225 = _731 + _1223;
        float _1227 = -_801;
        float _1229 = _1227 + _1145;
        float _1231 = -_731;
        float _1233 = _1231 + _1143;
        float _1235 = fma(_1213, _1213, _1221);
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1239 = fma(_1225, _1225, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1245 = precise::min(_1241, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1237;
        float _1249 = _1243 * _1247;
        float _1251 = fma(_1219, _1249, _733);
        float _1253 = fma(_1229, _1249, _801);
        float _1255 = fma(_1233, _1249, _731);
        _1187 = _1253;
        _1197 = _1251;
        _1205 = _1255;
        _1199 = _1241;
    }
    float _1257 = _1187;
    float _1259 = _1197;
    float _1261 = _1205;
    float _1263 = _1199;
    float _1265 = _1263;
    if (_1169)
    {
        _1265 = 1.0;
    }
    float _1267 = _1265;
    float _1269 = _1203 * _1193;
    float _1271 = _1269 * 0.5;
    float _1273 = _1267;
    float _1275 = _1271;
    if (!_1169)
    {
        float _1277 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1285 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1283);
        float _1287 = _1279 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1281 * 0.15915493667125701904296875;
        float _1293 = _1279 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        float _1297 = 1.0 / _1289;
        float _1299 = _1291 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = _1295 * _1297;
        float _1305 = _1291 * 6.283185482025146484375;
        float _1307 = sin(_1305);
        float _1309 = _1301 * _1303;
        float _1311 = 1.0 / _1285;
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1313;
        float _1317 = 1.0 / _1309;
        float _1319 = 1.0 / _1315;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1323 = _1311 * _1321;
        float _1325 = _1307 * _1317;
        float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1329 = fma(_1325, _1323, _1327);
        float _1331 = _1329 * _1319;
        float _1333 = precise::clamp(_1331, 0.0, 1.0);
        _1273 = _1333;
    }
    float _1335 = _1273;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1257 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1343 = _1259 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1347 = _1261 + _1345;
    float _1349 = _1339 * _1339;
    float _1351 = fma(_1343, _1343, _1349);
    float _1353 = fma(_1347, _1347, _1351);
    float _1355 = rsqrt(_1353);
    float _1357 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1359 = _1343 * _1357;
    float _1361 = _1347 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 * _1361;
    float _1367 = _1363 + _1365;
    float _1369 = sqrt(_1367);
    bool _1371 = _1369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1375 = _1369 + _1373;
    float _1377 = _1355;
    float _1379 = _1367;
    float _1381 = _1375;
    float _1383 = _1339;
    float _1385 = _1357;
    float _1387 = _1359;
    if (_1371)
    {
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1389;
    }
    float _1391 = _1377;
    if (_1371)
    {
        float _1393 = rsqrt(_1367);
        _1379 = _1393;
    }
    float _1395 = _1379;
    if (_1371)
    {
        float _1397 = _1375 * _1391;
        _1381 = _1397;
    }
    float _1399 = _1381;
    if (_1371)
    {
        float _1401 = _1399 * 0.15915493667125701904296875;
        _1275 = _1401;
    }
    float _1403 = _1275;
    float _1405 = _1391;
    if (_1371)
    {
        float _1407 = _1403 * 6.283185482025146484375;
        float _1409 = sin(_1407);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1415 = precise::max(0.0, _1413);
    float _1417 = _1347;
    float _1419 = _1415;
    if (_1371)
    {
        float _1421 = _1403 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        _1417 = _1423;
    }
    float _1425 = _1417;
    float _1427 = -_1357;
    float _1429 = -_1415;
    float _1431 = fma(_1339, _1427, _1429);
    if (!_1371)
    {
        _1383 = _1361;
    }
    float _1433 = _1383;
    float _1435 = _1433;
    if (_1371)
    {
        float _1437 = _1431 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1419 = _1437;
    }
    float _1439 = _1419;
    float _1441 = _1411;
    float _1443 = _1439;
    if (_1371)
    {
        float _1445 = fma(_1411, _1439, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = _1447;
    float _1451 = _1425;
    if (_1371)
    {
        float _1453 = _1425 + (-1.0);
        _1443 = _1453;
    }
    float _1455 = _1443;
    float _1457 = _1455;
    if (_1371)
    {
        float _1459 = _1395 * _1447;
        _1189 = _1459;
    }
    float _1461 = _1189;
    if (!_1371)
    {
        _1449 = _1431;
    }
    float _1463 = _1449;
    float _1465 = sqrt(_1353);
    float _1467 = _1463;
    if (_1371)
    {
        float _1469 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1469;
    }
    float _1471 = _1385;
    if (_1371)
    {
        float _1473 = _1359 * _1461;
        _1387 = _1473;
    }
    float _1475 = _1387;
    if (!_1371)
    {
        _1457 = _1363;
    }
    float _1477 = _1457;
    float _1479 = _1477;
    if (_1371)
    {
        float _1481 = _1361 * _1461;
        _1435 = _1481;
    }
    float _1483 = _1435;
    if (_1371)
    {
        float _1485 = fma(_1431, _1425, _1471);
        _1467 = _1485;
    }
    float _1487 = _1467;
    if (_1371)
    {
        float _1489 = _1475 * _1475;
        _1479 = _1489;
    }
    float _1491 = _1479;
    if (!_1371)
    {
        _1451 = _1365;
    }
    float _1493 = _1451;
    float _1495 = _1493;
    if (_1371)
    {
        float _1497 = _1483 * _1483;
        _1495 = _1497;
    }
    float _1499 = _1495;
    float _1501 = fma(_1487, _1487, _1491);
    float _1503 = _1501 + _1499;
    float _1505 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1509 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1507);
    float _1511 = precise::clamp(_1509, 0.0, 1.0);
    float _1513 = rsqrt(_1503);
    float _1515 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1505);
    float _1517 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1519 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1521 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1523 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1525 = -_1511;
    float _1527 = _1525 + 1.0;
    float _1529 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1519);
    float _1531 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1517);
    float _1533 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1521);
    float _1535 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1515);
    float _1537 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1529);
    float _1539 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1531);
    float _1541 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1533);
    float _1543 = abs(_1527);
    float _1545 = log2(_1543);
    float _1547 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1549 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1551 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1553 = _1513 * _1475;
    float _1555 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1559 = _1513 * _1487;
    float _1561 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1563 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1565 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1557);
    float _1567 = _1513 * _1483;
    float _1569 = -_1561;
    float _1571 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1569);
    float _1573 = -_1563;
    float _1575 = fma(_1573, _1523, 1.0);
    float _1577 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1579 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1581 = -_1567;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1571);
    float _1585 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1587 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1589 = log2(_1575);
    float _1591 = fma(_1583, -0.5, 0.5);
    float _1593 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1595 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1579);
    float _1597 = fma(_1583, 0.5, 0.5);
    float _1599 = _1559 + 1.0;
    float _1601 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1593);
    float _1603 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1595);
    float _1605 = exp2(_1585);
    float _1607 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1601);
    float _1609 = 1.0 / _1587;
    float _1611 = fma(_1597, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1613 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1603);
    float _1615 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1607);
    float _1617 = _1589 * 0.693147182464599609375;
    float _1619 = fma(_1597, _1611, -0.212114393711090087890625);
    float _1621 = sqrt(_1591);
    float _1623 = -_1559;
    float _1625 = fma(_1605, _1599, _1623);
    float _1627 = fma(_1597, _1619, 1.570728778839111328125);
    float _1629 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1631 = fma(_1625, 0.5, 0.5);
    float _1633 = _1613 * _1609;
    float _1635 = _1615 * _1609;
    float _1637 = fma(_1633, 0.5, 0.5);
    float _1639 = fma(_1635, -0.5, 0.5);
    float _1641 = _1621 * 0.636619746685028076171875;
    float3 _4182 = float3(_1637, _1639, _1629);
    float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4182, float3(0.0), isnan(_4182)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4182, float3(0.0), isnan(_4182)), level(0.0)).x;
    float3 _4193 = float3(_1637, _1639, _1629);
    float4 _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4193, float3(0.0), isnan(_4193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4193, float3(0.0), isnan(_4193)), level(0.0)).xyzw;
    float _1648 = _1646.x;
    float _1650 = _1646.y;
    float _1652 = _1646.z;
    float _1654 = _1646.w;
    float _1656 = -_1627;
    float _1658 = fma(_1641, _1656, 1.0);
    float2 _4215 = float2(_1658, _1631);
    float3 _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4215, float2(0.0), isnan(_4215)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4215, float2(0.0), isnan(_4215)), level(0.0)).xyz;
    float _1664 = _1662.x;
    float _1666 = _1662.y;
    float _1668 = _1662.z;
    float _1670 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1672 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1674 = _1335 > 0.0;
    bool _1676 = isnan(_1335);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(0.0);
    bool _1682 = _1678 || _1680;
    float _1684 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1686 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1672);
    float _1688 = exp2(_1670);
    float _1690 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1686);
    float _1692 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1690);
    float _1694 = _1692 + _1587;
    out.gl_Position.x = _1613;
    out.gl_Position.y = _1615;
    out.gl_Position.z = _1692;
    out.gl_Position.w = _1587;
    float _1696 = _1694 * 0.5;
    float _1698 = -_1688;
    float _1700 = _1698 + 1.0;
    float _1702 = _1684 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1704 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _1696;
    out.m_68.w = _1587;
    out.m_45.x = _1702;
    float _1706 = _1704 * _1643;
    float _1708 = -_1704;
    float _1710 = _1708 + 1.0;
    float _1712 = _1654 * _1706;
    float _1714 = _1654 * _1710;
    float _1716 = _1668 * _1706;
    float _1718 = fma(_1664, _1712, _1648);
    float _1720 = fma(_1666, _1712, _1650);
    float _1722 = fma(_1654, _1716, _1652);
    out.m_70.x = _1718;
    out.m_70.y = _1720;
    out.m_70.z = _1722;
    out.m_70.w = _1714;
    if (_1682)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1724 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1724;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

