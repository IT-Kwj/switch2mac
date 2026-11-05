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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2430 = as_type<float>(_101);
        out.gl_Position.z = _2430;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
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
        _103 = as_type<int>(_139);
    }
    int _141 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2500 = as_type<float>(_141);
        out.gl_Position.z = _2500;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _147 * _145;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _121 = _165;
    }
    float _167 = _121;
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _171 = _167;
    if (!_159)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    float _187 = _183 * 0.15915493667125701904296875;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _187 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = 1.4012984643248170709237295832899e-45;
    float _199 = _175;
    if (!_159)
    {
        _197 = _149;
    }
    float _201 = _197;
    float _203 = -_185;
    float _205 = _169 + _203;
    bool _207 = !_159;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _239;
    }
    float _241 = _199;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _149 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _209 = _263;
    }
    float _265 = _209;
    float _267 = in.m_51.w;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = in.m_42.x;
    float _281 = in.m_42.y;
    float _283 = in.m_42.z;
    float _285 = fma(_195, 0.5, 0.5);
    bool _287 = _205 < 0.5;
    float _289 = float(_287);
    bool _291 = !_273;
    int _293 = _291 ? 0 : 1;
    float _295 = -_205;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_191;
    int _301 = _299 ? 0 : 1;
    float _303 = -_289;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = abs(_293);
    float _309 = -_285;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_265, _177, _269);
    int _315 = abs(_301);
    float _317 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = !_277;
    int _321 = _319 ? 0 : 1;
    float _323 = fma(_265, _179, _317);
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _327 = abs(_321);
    float _329 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = float(_307);
    float _333 = float(_315);
    float _335 = fma(_265, _181, _329);
    float _337 = abs(_297);
    float _339 = _331 * _337;
    float _341 = fma(_313, _267, _279);
    float _343 = fma(_323, _267, _281);
    float _345 = float(_327);
    float _347 = fma(_333, _311, _339);
    float _349 = fma(_335, _267, _283);
    float _351 = abs(_305);
    float _353 = fma(_345, _351, _347);
    bool _355 = !_325;
    float _373;
    float _375;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _359 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _361 = float(_85);
        float _363 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _365 = _363 * _357;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = _361;
        _377 = true;
    }
    else
    {
        float _379 = float(_85);
        float _381 = 1.0 / _379;
        float _383 = _119 * _381;
        _373 = _383;
        _375 = _379;
    }
    _377 = false;
    float _385 = _373;
    float _387 = _375;
    float _389 = in.m_49.y;
    float _391 = _143 * 2.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = _385 + _393;
    float _397 = in.m_49.z;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _399;
    float _403 = floor(_391);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _385 + _413;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _419 = 1.0 / _401;
    float _421 = -_411;
    float _423 = fma(_409, 2.0, _421);
    float _425 = 1.0 / _407;
    float _427 = _389 * 2.0;
    bool _429 = _403 > 0.0;
    float _431 = _389 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _433 = _403 >= 0.0;
    bool _435 = isnan(_403);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = _397 * 2.0;
    float _445 = fma(_431, -2.0, _417);
    float _447 = floor(_427);
    float _449 = _143 + _397;
    float _451 = _395 * _419;
    float _453 = _143 + _389;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _465 = _463 != 0;
    float _467 = _449 + (-1.0);
    float _469 = _453 + (-1.0);
    float _471 = floor(_443);
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _475 = _441 ? 0 : 1;
    float _477 = _415 * _425;
    bool _479 = !_461;
    int _481 = _479 ? 0 : 1;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _485 = ~_475;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _493 = int(_491);
    bool _495 = _447 > 0.0;
    bool _497 = _447 >= 0.0;
    bool _499 = isnan(_447);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_457;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_465;
    int _513 = _511 ? 0 : 1;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _517 = int(_515);
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    int _531 = _489;
    if (!_429)
    {
        int _533 = ~_475;
        int _535 = _533 + 1;
        _531 = _535;
    }
    int _537 = _531;
    bool _539 = _471 > 0.0;
    bool _541 = _471 >= 0.0;
    bool _543 = isnan(_471);
    bool _545 = _541 || _543;
    bool _547 = isnan(0.0);
    bool _549 = _545 || _547;
    float _551 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _553 = log2(_551);
    float _555 = float(_493);
    float _557 = _389 + _397;
    bool _559 = !_525;
    int _561 = _559 ? 0 : 1;
    float _563 = _397 + (-0.5);
    float _565 = _557 + (-1.0);
    int _567 = abs(_561);
    float _569 = 1.0 / _555;
    int _571 = _549 ? 0 : 1;
    float _573 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _575 = float(_537);
    int _577 = ~_571;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = _553 * _119;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _587 = _581;
    if (!_539)
    {
        int _589 = ~_571;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = exp2(_583);
    float _597 = float(_567);
    float _599 = in.m_53.x;
    float _601 = in.m_53.y;
    float _603 = in.m_53.z;
    int _605 = _505 ? 0 : 1;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _609 = 1.0 + _607;
    bool _611 = !_529;
    int _613 = _611 ? 0 : 1;
    float _615 = _597 * _575;
    bool _617 = !_521;
    int _619 = _617 ? 0 : 1;
    float _621 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _585);
    float _623 = 1.0 / _609;
    int _625 = ~_605;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = -_119;
    float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[76].x, _423);
    int _635 = abs(_613);
    float _637 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _621);
    int _639 = _629;
    if (!_495)
    {
        int _641 = ~_605;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _649 = abs(_619);
    float _651 = -_595;
    float _653 = _651 + 1.0;
    bool _655 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(1.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[78].w, _647);
    float _667 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _445);
    float _669 = float(_645);
    float _671 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _665);
    float _673 = float(_649);
    float _675 = _615 * (-2.0);
    bool _677 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _679 = isnan(0.0);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _685 = _681 || _683;
    float _687 = _569 * _119;
    float _689 = float(_593);
    float _691 = fma(_573, _675, _573);
    float _693 = float(_517);
    float _695 = _389 + (-0.5);
    float _697 = _685 ? _653 : 0.0;
    float _699 = _673 * _689;
    float _701 = float(_635);
    float _703 = _693 * _119;
    if (_663)
    {
        float _705 = _697 * _623;
        _123 = _705;
    }
    float _707 = _123;
    float _709 = _701 * _669;
    float _711 = fma(_675, _601, _601);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _713;
    float _717 = _699 * (-2.0);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _719;
    float _723 = _709 * (-2.0);
    float _725 = fma(_715, _451, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[196].y, _711);
    float _729 = fma(_721, _451, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _731 = fma(_483, _717, _483);
    float _733 = fma(_717, _599, _599);
    float _735 = _143 + (-0.5);
    float _737 = fma(_473, _723, _473);
    bool _739 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _741 = isnan(_385);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = fma(_691, _707, _727);
    float _753 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    bool _755 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_385);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = as_type<float>(int(gl_VertexIndex));
    float _769 = _751 * 0.15915493667125701904296875;
    float _771 = fma(_731, _707, _753);
    float _773 = -_749;
    float _775 = _773 + 1.0;
    bool _777 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _779 = isnan(_385);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = in.m_51.x;
    float _791 = in.m_51.y;
    float _793 = fma(_723, _603, _603);
    float _795 = _765 * _775;
    float _797 = -_765;
    float _799 = _797 + 1.0;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _809 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[196].z, _793);
    float _811 = _787 * _799;
    float _813 = -_787;
    float _815 = _813 + 1.0;
    float _817 = fma(_803, _477, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _819 = fma(_807, _477, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _821 = _725 * _811;
    float _823 = _729 * _811;
    float _825 = _771 * 0.15915493667125701904296875;
    float _827 = fma(_737, _707, _809);
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[143].x, _821);
    float _831 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[143].y, _823);
    float _833 = _769 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = _827 * 0.15915493667125701904296875;
    float _839 = fma(_817, _795, _829);
    float _841 = fma(_819, _795, _831);
    int _843 = as_type<int>(_767) & 1;
    bool _845 = _843 != 0;
    int _847 = as_type<int>(_767) & 2;
    bool _849 = _847 != 0;
    float _851 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[145].x, _839);
    float _853 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[145].y, _841);
    float _855 = _769 * 6.283185482025146484375;
    float _857 = cos(_855);
    bool _859 = !_849;
    float _861 = _859 ? (-0.5) : 0.5;
    float _863 = _851 * _789;
    float _865 = _853 * _791;
    bool _867 = !_845;
    float _869 = _867 ? (-0.5) : 0.5;
    float _871 = _353 * _863;
    float _873 = _353 * _865;
    float _875 = _825 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _861);
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _869);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _885 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _895 = _891 || _893;
    float _897 = _883 * _879;
    float _899 = _825 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = _885 * _881;
    bool _905 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _907 = isnan(0.5);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _913 = _909 || _911;
    float _915 = _837 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = _877 * _857;
    float _921 = _837 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _901 * _835;
    float _927 = _901 * _857;
    float _929 = -_925;
    float _931 = fma(_917, _919, _929);
    float _933 = -_919;
    float _935 = fma(_917, _925, _933);
    float _937 = _877 * _835;
    float _939 = _923 * _897;
    float _941 = _835 * _923;
    float _943 = _857 * _923;
    float _945 = fma(_917, _927, _937);
    float _947 = fma(_917, _937, _927);
    float _949 = _901 * _939;
    float _951 = -_897;
    float _953 = _917 * _951;
    float _955 = _877 * _939;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = fma(_945, _903, _949);
    float _961 = fma(_943, _903, _953);
    float _963 = fma(_931, _903, _955);
    float _965 = fma(_935, _957, _959);
    float _967 = fma(_941, _957, _961);
    float _969 = fma(_947, _957, _963);
    float _971 = _343 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _975 = _343 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _977 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _973);
    float _983 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].x, _975);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _987 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].z, _979);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _981);
    float _991 = _343 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _993 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].z, _983);
    float _995 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _997 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _985);
    float _999 = _989 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1001 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].x, _991);
    float _1003 = _993 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1005 = _997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _995 + _999;
    float _1009 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1001);
    float _1011 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1013 = _1003 + _1005;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1017 = _1007 + _1015;
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1021 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1011);
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1013 + _1023;
    float _1027 = _1017 * _1017;
    float _1029 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1031 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1033 = fma(_1025, _1025, _1027);
    float _1035 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1029);
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1041 = sqrt(_1033);
    float _1043 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1035);
    float _1045 = _1019 + _1039;
    float _1047 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1049 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1037);
    float _1051 = 1.0 / _1047;
    float _1053 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1049);
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1057 = _1041 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1059 = _1055 + _1047;
    float _1061 = _1059 * _1051;
    float _1063 = _1061 * 0.5;
    float _1065 = _1047;
    float _1067 = _1039;
    float _1069 = _969;
    float _1071 = _1013;
    float _1073 = _1041;
    float _1075 = _1017;
    float _1077 = _1033;
    if (!_1057)
    {
        _1065 = _1013;
    }
    float _1079 = _1065;
    float _1081 = _1079;
    if (!_1057)
    {
        _1067 = _1007;
    }
    float _1083 = _1067;
    float _1085 = _1083;
    if (!_1057)
    {
        _1069 = _1045;
    }
    float _1087 = _1069;
    bool _1089 = !_1057;
    float _1091 = _1087;
    if (!_1089)
    {
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1097 = _1041 + _1095;
        float _1099 = rsqrt(_1033);
        float _1101 = _1097 * _1093;
        float _1103 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = _1101 * 0.15915493667125701904296875;
        float _1107 = _1105 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1105 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = _1109 + (-1.0);
        float _1117 = _1115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = fma(_1113, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1121 = fma(_1045, _1109, _1117);
        float _1123 = _1099 * _1119;
        float _1125 = fma(_1025, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1127 = fma(_1017, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1081 = _1125;
        _1071 = _1099;
        _1091 = _1121;
        _1085 = _1127;
        _1073 = _1103;
    }
    float _1129 = _1081;
    float _1131 = _1071;
    float _1133 = _1091;
    float _1135 = _1085;
    float _1137 = _1073;
    float _1139 = _1137;
    float _1141 = _1133;
    float _1143 = _1135;
    float _1145 = _1131;
    if (_913)
    {
        _1139 = 1.0;
    }
    float _1147 = _1139;
    float _1149 = _1147;
    if (_895)
    {
        _1075 = _1129;
    }
    float _1151 = _1075;
    float _1153 = _1151;
    if (!_895)
    {
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1157 = _1019 + _1155;
        float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1161 = _1003 + _1159;
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1165 = -_1019;
        float _1167 = _1165 + _1133;
        float _1169 = _1157 * _1157;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1173 = _995 + _1171;
        float _1175 = -_995;
        float _1177 = _1175 + _1135;
        float _1179 = fma(_1161, _1161, _1169);
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1183 = fma(_1173, _1173, _1179);
        float _1185 = sqrt(_1183);
        float _1187 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1189 = precise::min(_1185, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1191 = _1189 * _1181;
        float _1193 = -_1003;
        float _1195 = _1193 + _1129;
        float _1197 = _1187 * _1191;
        float _1199 = fma(_1195, _1197, _1003);
        float _1201 = fma(_1167, _1197, _1019);
        float _1203 = fma(_1177, _1197, _995);
        _1141 = _1201;
        _1153 = _1199;
        _1143 = _1203;
        _1145 = _1197;
    }
    float _1205 = _1141;
    float _1207 = _1153;
    float _1209 = _1143;
    float _1211 = _1145;
    float _1213 = _1211;
    if (!_913)
    {
        float _1215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1223 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
        float _1225 = _1217 * 6.283185482025146484375;
        float _1227 = cos(_1225);
        float _1229 = _1219 * 0.15915493667125701904296875;
        float _1231 = _1217 * 6.283185482025146484375;
        float _1233 = sin(_1231);
        float _1235 = 1.0 / _1227;
        float _1237 = _1229 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1233 * _1235;
        float _1243 = _1229 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1239 * _1241;
        float _1249 = 1.0 / _1223;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1253 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1251;
        float _1255 = 1.0 / _1247;
        float _1257 = 1.0 / _1253;
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1261 = _1249 * _1259;
        float _1263 = _1245 * _1255;
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1267 = fma(_1263, _1261, _1265);
        float _1269 = _1267 * _1257;
        float _1271 = precise::clamp(_1269, 0.0, 1.0);
        float _1273 = -_1271;
        float _1275 = _1273 + 1.0;
        _1149 = _1275;
    }
    float _1277 = _1149;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = _1205 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1207 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1289 = _1209 + _1287;
    float _1291 = _1281 * _1281;
    float _1293 = fma(_1285, _1285, _1291);
    float _1295 = fma(_1289, _1289, _1293);
    float _1297 = rsqrt(_1295);
    float _1299 = sqrt(_1295);
    float _1301 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1303 = _1285 * _1301;
    float _1305 = _1289 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 * _1305;
    float _1311 = _1307 + _1309;
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1313 + _1317;
    float _1321 = _1293;
    float _1323 = _1319;
    float _1325 = _1281;
    float _1327 = _1301;
    float _1329 = _1307;
    if (_1315)
    {
        float _1331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1331;
    }
    float _1333 = _1321;
    float _1335 = _1333;
    if (_1315)
    {
        float _1337 = _1319 * _1333;
        _1323 = _1337;
    }
    float _1339 = _1323;
    if (_1315)
    {
        float _1341 = rsqrt(_1311);
        _1335 = _1341;
    }
    float _1343 = _1335;
    float _1345 = _1343;
    if (_1315)
    {
        float _1347 = _1339 * 0.15915493667125701904296875;
        _1213 = _1347;
    }
    float _1349 = _1213;
    float _1351 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1353 = _1297;
    if (_1315)
    {
        float _1355 = _1349 * 6.283185482025146484375;
        float _1357 = sin(_1355);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = precise::max(0.0, _1351);
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1365 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1363);
    float _1367 = precise::clamp(_1365, 0.0, 1.0);
    float _1369 = _1289;
    float _1371 = _1361;
    if (_1315)
    {
        float _1373 = _1349 * 6.283185482025146484375;
        float _1375 = cos(_1373);
        _1369 = _1375;
    }
    float _1377 = _1369;
    float _1379 = -_1301;
    float _1381 = -_1361;
    float _1383 = fma(_1281, _1379, _1381);
    float _1385 = -_1367;
    float _1387 = _1385 + 1.0;
    if (_1315)
    {
        float _1389 = _1383 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1389;
    }
    float _1391 = _1325;
    float _1393 = _1359;
    float _1395 = _1391;
    if (_1315)
    {
        float _1397 = fma(_1359, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = _1399;
    if (!_1315)
    {
        _1395 = _1305;
    }
    float _1403 = _1395;
    float _1405 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1407 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1409 = _1403;
    if (_1315)
    {
        float _1411 = _1343 * _1399;
        _1077 = _1411;
    }
    float _1413 = _1077;
    if (!_1315)
    {
        _1345 = _1303;
    }
    float _1415 = _1345;
    float _1417 = _1415;
    if (_1315)
    {
        float _1419 = _1377 + (-1.0);
        _1371 = _1419;
    }
    float _1421 = _1371;
    float _1423 = _1421;
    if (_1315)
    {
        float _1425 = _1303 * _1413;
        _1417 = _1425;
    }
    float _1427 = _1417;
    if (!_1315)
    {
        _1401 = _1383;
    }
    float _1429 = _1401;
    float _1431 = _1429;
    if (_1315)
    {
        float _1433 = _1305 * _1413;
        _1409 = _1433;
    }
    float _1435 = _1409;
    if (_1315)
    {
        float _1437 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1437;
    }
    float _1439 = _1327;
    if (_1315)
    {
        float _1441 = _1427 * _1427;
        _1329 = _1441;
    }
    float _1443 = _1329;
    if (!_1315)
    {
        _1423 = _1309;
    }
    float _1445 = _1423;
    float _1447 = _1445;
    if (_1315)
    {
        float _1449 = _1435 * _1435;
        _1447 = _1449;
    }
    float _1451 = _1447;
    if (_1315)
    {
        float _1453 = fma(_1383, _1377, _1439);
        _1431 = _1453;
    }
    float _1455 = _1431;
    float _1457 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1407);
    float _1459 = fma(_1455, _1455, _1443);
    float _1461 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1463 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1457);
    float _1465 = _1459 + _1451;
    float _1467 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1461);
    float _1469 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1471 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1473 = rsqrt(_1465);
    float _1475 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1467);
    float _1477 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1479 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1471);
    float _1481 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1477);
    float _1485 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1487 = abs(_1387);
    float _1489 = log2(_1487);
    float _1491 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = _1473 * _1427;
    float _1503 = _1473 * _1455;
    float _1505 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1507 = _1473 * _1435;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1511 = -_1497;
    float _1513 = fma(_1511, _1405, 1.0);
    float _1515 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1517 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1519 = -_1509;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1519);
    float _1523 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1525 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1515);
    float _1527 = log2(_1513);
    float _1529 = -_1507;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1521);
    float _1533 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1517);
    float _1537 = _1503 + 1.0;
    float _1539 = fma(_1531, -0.5, 0.5);
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1543 = fma(_1531, 0.5, 0.5);
    float _1545 = exp2(_1523);
    float _1547 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1541);
    float _1549 = fma(_1543, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1551 = fma(_1543, _1549, -0.212114393711090087890625);
    float _1553 = 1.0 / _1525;
    float _1555 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1557 = _1527 * 0.693147182464599609375;
    float _1559 = fma(_1543, _1551, 1.570728778839111328125);
    float _1561 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = sqrt(_1539);
    float _1565 = -_1503;
    float _1567 = fma(_1545, _1537, _1565);
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1571 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1555);
    float _1573 = _1569 * _1553;
    float _1575 = _1571 * _1553;
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1575, -0.5, 0.5);
    float _1581 = fma(_1567, 0.5, 0.5);
    float _1583 = _1563 * 0.636619746685028076171875;
    float _1585 = -_1559;
    float _1587 = fma(_1583, _1585, 1.0);
    float3 _4712 = float3(_1577, _1579, _1561);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).x;
    float3 _4723 = float3(_1577, _1579, _1561);
    float4 _1592 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4723, float3(0.0), isnan(_4723)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4723, float3(0.0), isnan(_4723)), level(0.0)).xyzw;
    float _1594 = _1592.x;
    float _1596 = _1592.y;
    float _1598 = _1592.z;
    float _1600 = _1592.w;
    float2 _4740 = float2(_1587, _1581);
    float3 _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4740, float2(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4740, float2(0.0), isnan(_4740)), level(0.0)).xyz;
    float _1606 = _1604.x;
    float _1608 = _1604.y;
    float _1610 = _1604.z;
    float _1612 = float(uint(_517));
    float _1614 = trunc(_687);
    int _1616 = int(_1614);
    int _1618 = ~_517;
    int _1620 = _1618 + 1;
    float _1622 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1624 = ~_517;
    int _1626 = _1624 + 1;
    float _1628 = -_637;
    float _1630 = _1628 + 1.0;
    float _1632 = -_671;
    float _1634 = _1632 + 1.0;
    float _1636 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1622);
    float _1638 = 1.0 / _1612;
    float _1640 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1636);
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1644 = _1642 != 0;
    float _1646 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1648 = float(uint(_1616));
    float _1650 = 1.0 / _387;
    float _1652 = float(_1616);
    bool _1654 = !_1644;
    float _1656 = _1654 ? 7.345489978790283203125 : 1.0;
    int _1658 = as_type<int>(_1638) + (-2);
    bool _1660 = _1652 >= _693;
    bool _1662 = isnan(_1652);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_693);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = _1656 * _143;
    float _1674 = as_type<float>(_1658) * _1648;
    float _1676 = trunc(_1670);
    int _1678 = int(_1676);
    float _1680 = _703 * _1650;
    float _1682 = trunc(_1674);
    float _1684 = precise::max(_1682, 0.0);
    uint _1687 = uint(_1684);
    float _1689 = trunc(_1680);
    int _1691 = int(_1689);
    int _1693 = _1620 * int(_1687);
    int _1695 = _1693 + _1616;
    float _1697 = float(uint(_1695));
    float _1699 = as_type<float>(_1658) * _1697;
    float _1701 = floor(_1672);
    float _1703 = trunc(_1699);
    float _1705 = precise::max(_1703, 0.0);
    uint _1707 = uint(_1705);
    float _1709 = -_1701;
    float _1711 = _1672 + _1709;
    int _1713 = _517 + (-1);
    int _1715 = int(_1687) + int(_1707);
    int _1717 = _1626 * _1715;
    int _1719 = _1717 + _1616;
    bool _1721 = uint(_1719) >= uint(_517);
    bool _1723 = !_1721;
    int _1725 = _1723 ? 0 : (-1);
    bool _1727 = _517 == 0;
    int _1729 = ~_1715;
    int _1731 = _1729 + _1725;
    int _1733 = _1731 + 1;
    float _1735 = _1711 * _693;
    int _1737 = _517 * _1733;
    int _1739 = _1737 + _1616;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1743 = _1741 != 0;
    float _1745 = trunc(_1735);
    int _1747 = int(_1745);
    int _1749 = ~_1678;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    bool _1755 = !_1727;
    int _1757 = _1755 ? _1739 : (-1);
    bool _1759 = !_1743;
    int _1761 = _1759 ? 0 : 1;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1765 = _1763 != 0;
    int _1767 = _1757 * _1753;
    int _1769 = abs(_1761);
    int _1771 = abs(_481);
    int _1773 = _1678 * _1713;
    int _1775 = _1773 + _1767;
    int _1777 = abs(_509);
    int _1779 = _1775 * _1771;
    bool _1781 = !_1765;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = abs(_513);
    int _1787 = _1747 * _1769;
    int _1789 = _1787 + _1616;
    int _1791 = abs(_1783);
    int _1793 = _1691 * _1777;
    int _1795 = _1793 + _1779;
    int _1797 = ~_517;
    int _1799 = _1797 + 1;
    int _1801 = ~_517;
    int _1803 = _1801 + 1;
    int _1805 = _1789 * _1785;
    int _1807 = _1805 + _1795;
    int _1809 = ~_517;
    int _1811 = _1809 + 1;
    int _1813 = _1747 * _1791;
    int _1815 = _1813 + _1807;
    float _1817 = float(uint(_1815));
    float _1819 = as_type<float>(_1658) * _1817;
    float _1821 = trunc(_1819);
    float _1823 = precise::max(_1821, 0.0);
    uint _1825 = uint(_1823);
    int _1827 = _1799 * int(_1825);
    int _1829 = _1827 + _1815;
    float _1831 = float(uint(_1829));
    float _1833 = as_type<float>(_1658) * _1831;
    float _1835 = trunc(_1833);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = int(_1825) + int(_1839);
    float _1843 = float(uint(_1789));
    int _1845 = _1803 * _1841;
    int _1847 = _1845 + _1815;
    float _1849 = as_type<float>(_1658) * _1843;
    bool _1851 = uint(_1847) >= uint(_517);
    float _1853 = trunc(_1849);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    bool _1859 = !_1851;
    int _1861 = _1859 ? 0 : (-1);
    int _1863 = ~_1841;
    int _1865 = _1863 + _1861;
    int _1867 = _1865 + 1;
    int _1869 = _517 * _1867;
    int _1871 = _1869 + _1815;
    int _1873 = _1803 * int(_1857);
    int _1875 = _1873 + _1789;
    bool _1877 = !_1727;
    int _1879 = _1877 ? _1871 : (-1);
    int _1881 = _1879 >> 31;
    float _1883 = float(uint(_1875));
    int _1885 = _1881 & 3;
    int _1887 = _1879 & 3;
    bool _1889 = _1887 != 0;
    float _1891 = as_type<float>(_1658) * _1883;
    int _1893 = _1879 + _1885;
    int _1895 = _1879 & 3;
    bool _1897 = _1895 != 0;
    float _1899 = trunc(_1891);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = _1893 >> 2;
    bool _1907 = uint(_1895) > 1u;
    int _1909 = _1905 << 4;
    int _1911 = _1909 + 368;
    int _1913 = _1889 ? 0 : 1;
    uint _1915 = uint(int(uint(_1911) >> uint(2)));
    uint _1917 = uint(int(uint(int(_1915)) >> uint(2)));
    int _1919 = int(_1915) & 3;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[int(_1917)][_1919];
    int _1923 = int(_1915) + 1;
    uint _1925 = uint(int(uint(_1923) >> uint(2)));
    int _1927 = _1923 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[int(_1925)][_1927];
    bool _1931 = _1895 != 3;
    int _1933 = ~_1913;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    int _1939 = _1937;
    if (!_1907)
    {
        int _1941 = ~_1913;
        int _1943 = _1941 + 1;
        _1939 = _1943;
    }
    int _1945 = _1939;
    int _1947 = _1911 + 8;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    uint _1951 = uint(int(uint(int(_1949)) >> uint(2)));
    int _1953 = int(_1949) & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = int(_1949) + 1;
    uint _1959 = uint(int(uint(_1957) >> uint(2)));
    int _1961 = _1957 & 3;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[int(_1959)][_1961];
    int _1965 = int(_1857) + int(_1903);
    int _1967 = abs(_1945);
    bool _1969 = uint(_1895) >= 2u;
    int _1971 = _1811 * _1965;
    int _1973 = _1971 + _1789;
    int _1975 = ~_1967;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    int _1981 = _1969 ? 0 : 1;
    bool _1983 = !_1897;
    int _1985 = _1983 ? 0 : 1;
    bool _1987 = _1895 != 3;
    int _1989 = ~_1981;
    int _1991 = _1989 + 1;
    int _1993 = _1991 + 1;
    int _1995 = abs(_1985);
    int _1997 = _1993;
    if (_1931)
    {
        int _1999 = ~_1981;
        int _2001 = _1999 + 1;
        _1997 = _2001;
    }
    int _2003 = _1997;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2007 = _2005 != 0;
    bool _2009 = !_1987;
    int _2011 = _2009 ? 0 : (-1);
    int _2013 = ~_1995;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = abs(_2003);
    bool _2021 = !_2007;
    int _2023 = _2021 ? 0 : 1;
    int _2025 = abs(_2011);
    int _2027 = ~_2019;
    int _2029 = _2027 + 1;
    int _2031 = _2029 + 1;
    bool _2033 = uint(_1973) >= uint(_517);
    bool _2035 = _143 > 0.5;
    bool _2037 = !_2033;
    int _2039 = _2037 ? 0 : (-1);
    int _2041 = _1979 * as_type<int>(_1929);
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2045 = _2043 != 0;
    float _2047 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2049 = int(_2047);
    int _2051 = ~_1965;
    int _2053 = _2051 + _2039;
    int _2055 = _2053 + 1;
    int _2057 = _2017 * as_type<int>(_1921);
    int _2059 = _2057 + _2041;
    int _2061 = abs(_2023);
    int _2063 = _2031 * as_type<int>(_1955);
    int _2065 = _2063 + _2059;
    int _2067 = _517 * _2055;
    int _2069 = _2067 + _1789;
    int _2071 = ~_2025;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = ~_2061;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    bool _2083 = !_1727;
    int _2085 = _2083 ? _2069 : (-1);
    int _2087 = _2075 * as_type<int>(_1963);
    int _2089 = _2087 + _2065;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2093 = _2091 != 0;
    float _2095 = float(uint(_2049));
    int _2097 = _2089 * _2081;
    int _2099 = abs(_2049);
    int _2101 = ~_2049;
    int _2103 = _2101 + 1;
    int _2105 = _2085 * _2061;
    int _2107 = _2105 + _2097;
    float _2109 = 1.0 / _2095;
    bool _2111 = _389 > 0.5;
    float _2113 = float(uint(_2099));
    float _2115 = float(uint(_2107));
    int _2117 = abs(_2107);
    float _2119 = 1.0 / _2113;
    int _2121 = ~_2099;
    int _2123 = _2121 + 1;
    float _2125 = float(uint(_2117));
    int _2127 = as_type<int>(_2109) + (-2);
    int _2129 = ~_2099;
    int _2131 = _2129 + 1;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2135 = as_type<float>(_2127) * _2115;
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2139 = as_type<int>(_2119) + (-2);
    float _2141 = trunc(_2135);
    float _2143 = precise::max(_2141, 0.0);
    uint _2145 = uint(_2143);
    int _2147 = ~_2049;
    int _2149 = _2147 + 1;
    float _2151 = as_type<float>(_2139) * _2125;
    float _2153 = trunc(_2151);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    int _2159 = _2149 * int(_2145);
    int _2161 = _2159 + _2107;
    float _2163 = float(uint(_2161));
    int _2165 = _2131 * int(_2157);
    int _2167 = _2165 + _2117;
    float _2169 = as_type<float>(_2127) * _2163;
    float _2171 = trunc(_2169);
    float _2173 = precise::max(_2171, 0.0);
    uint _2175 = uint(_2173);
    float _2177 = float(uint(_2167));
    float _2179 = as_type<float>(_2139) * _2177;
    float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2183 = trunc(_2179);
    float _2185 = precise::max(_2183, 0.0);
    uint _2187 = uint(_2185);
    int _2189 = int(_2145) + int(_2175);
    int _2191 = _2103 * _2189;
    int _2193 = _2191 + _2107;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2197 = uint(_2193) >= uint(_2049);
    float _2199 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2201 = int(_2157) + int(_2187);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2207 = _2123 * _2201;
    int _2209 = _2207 + _2117;
    bool _2211 = !_2197;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2217 = ~_2189;
    int _2219 = _2217 + _2213;
    int _2221 = _2219 + 1;
    float _2223 = -_869;
    int _2225 = _2035 ? as_type<int>(_2223) : as_type<int>(_869);
    out.m_58.x = _2215;
    out.m_58.y = _2137;
    out.m_58.z = _2203;
    out.m_58.w = _2195;
    bool _2227 = uint(_2209) >= uint(_2099);
    int _2229 = _2049 * _2221;
    int _2231 = _2229 + _2107;
    bool _2233 = !_2045;
    float _2235 = _2233 ? _869 : as_type<float>(_2225);
    bool _2237 = !_2227;
    int _2239 = _2237 ? 0 : (-1);
    bool _2241 = _2049 == 0;
    int _2243 = _2107 ^ _2049;
    bool _2245 = !_2241;
    int _2247 = _2245 ? _2231 : (-1);
    uint _2249 = uint(int(uint(_2243) >> uint(31)));
    float _2251 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2253 = _2049 == 0;
    int _2255 = ~_2239;
    int _2257 = _2201 + _2255;
    int _2259 = _2257 + 1;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2263 = -_861;
    int _2265 = _2111 ? as_type<int>(_2263) : as_type<int>(_861);
    float _2267 = float(_2247);
    int _2269 = ~int(_2249);
    int _2271 = _2269 + 1;
    bool _2273 = !_2093;
    float _2275 = _2273 ? _861 : as_type<float>(_2265);
    float _2277 = fma(_2251, _2267, _633);
    int _2279 = _2259 ^ _2271;
    float _2281 = _2235 + 0.5;
    int _2283 = ~_2271;
    int _2285 = _2283 + _2279;
    int _2287 = _2285 + 1;
    float _2289 = fma(_2251, _2281, _2277);
    float _2291 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2295 = !_2253;
    int _2297 = _2295 ? _2287 : (-1);
    float _2299 = -_1630;
    float _2301 = fma(_2235, _2299, _2289);
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2305 = float(_2297);
    float _2307 = exp2(_2291);
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2313 = -_667;
    float _2315 = fma(_2293, _2305, _2313);
    float _2317 = _2275 + (-0.5);
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2321 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2323 = _1277 > 0.0;
    bool _2325 = isnan(_1277);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan(0.0);
    bool _2331 = _2327 || _2329;
    float _2333 = -_2293;
    float _2335 = fma(_2333, _2317, _2315);
    float _2337 = _1646 + _1525;
    float _2339 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2341 = _2337 * 0.5;
    float _2343 = -_2307;
    float _2345 = _2343 + 1.0;
    out.m_60.x = _2311;
    out.m_60.y = _2321;
    out.m_60.z = _2339;
    float _2347 = fma(_2275, _1634, _2335);
    float _2349 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1569;
    out.gl_Position.y = _1571;
    out.gl_Position.z = _1646;
    out.gl_Position.w = _1525;
    float _2353 = _2351 * _1589;
    out.m_62.z = _2341;
    out.m_62.w = _1525;
    float _2355 = _1610 * _2353;
    float _2357 = _1600 * _2353;
    float _2359 = -_2351;
    float _2361 = _2359 + 1.0;
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2301;
    out.m_64.y = _2347;
    float _2365 = fma(_1606, _2357, _1594);
    float _2367 = fma(_1608, _2357, _1596);
    float _2369 = _1600 * _2361;
    float _2371 = fma(_1600, _2355, _1598);
    out.m_45.x = _2363;
    out.m_66.x = _2365;
    out.m_66.y = _2367;
    out.m_66.z = _2371;
    out.m_66.w = _2369;
    if (_2331)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2430 = as_type<float>(_101);
        out.gl_Position.z = _2430;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
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
        _103 = as_type<int>(_139);
    }
    int _141 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2500 = as_type<float>(_141);
        out.gl_Position.z = _2500;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _147 * _145;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _121 = _165;
    }
    float _167 = _121;
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _171 = _167;
    if (!_159)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    float _187 = _183 * 0.15915493667125701904296875;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _187 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = 1.4012984643248170709237295832899e-45;
    float _199 = _175;
    if (!_159)
    {
        _197 = _149;
    }
    float _201 = _197;
    float _203 = -_185;
    float _205 = _169 + _203;
    bool _207 = !_159;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _239;
    }
    float _241 = _199;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _149 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _209 = _263;
    }
    float _265 = _209;
    float _267 = in.m_51.w;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = in.m_42.x;
    float _281 = in.m_42.y;
    float _283 = in.m_42.z;
    float _285 = fma(_195, 0.5, 0.5);
    bool _287 = _205 < 0.5;
    float _289 = float(_287);
    bool _291 = !_273;
    int _293 = _291 ? 0 : 1;
    float _295 = -_205;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_191;
    int _301 = _299 ? 0 : 1;
    float _303 = -_289;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = abs(_293);
    float _309 = -_285;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_265, _177, _269);
    int _315 = abs(_301);
    float _317 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = !_277;
    int _321 = _319 ? 0 : 1;
    float _323 = fma(_265, _179, _317);
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _327 = abs(_321);
    float _329 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = float(_307);
    float _333 = float(_315);
    float _335 = fma(_265, _181, _329);
    float _337 = abs(_297);
    float _339 = _331 * _337;
    float _341 = fma(_313, _267, _279);
    float _343 = fma(_323, _267, _281);
    float _345 = float(_327);
    float _347 = fma(_333, _311, _339);
    float _349 = fma(_335, _267, _283);
    float _351 = abs(_305);
    float _353 = fma(_345, _351, _347);
    bool _355 = !_325;
    float _373;
    float _375;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _359 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _361 = float(_85);
        float _363 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _365 = _363 * _357;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = _361;
        _377 = true;
    }
    else
    {
        float _379 = float(_85);
        float _381 = 1.0 / _379;
        float _383 = _119 * _381;
        _373 = _383;
        _375 = _379;
    }
    _377 = false;
    float _385 = _373;
    float _387 = _375;
    float _389 = in.m_49.y;
    float _391 = _143 * 2.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = _385 + _393;
    float _397 = in.m_49.z;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _399;
    float _403 = floor(_391);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _385 + _413;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _419 = 1.0 / _401;
    float _421 = -_411;
    float _423 = fma(_409, 2.0, _421);
    float _425 = 1.0 / _407;
    float _427 = _389 * 2.0;
    bool _429 = _403 > 0.0;
    float _431 = _389 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _433 = _403 >= 0.0;
    bool _435 = isnan(_403);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = _397 * 2.0;
    float _445 = fma(_431, -2.0, _417);
    float _447 = floor(_427);
    float _449 = _143 + _397;
    float _451 = _395 * _419;
    float _453 = _143 + _389;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _465 = _463 != 0;
    float _467 = _449 + (-1.0);
    float _469 = _453 + (-1.0);
    float _471 = floor(_443);
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _475 = _441 ? 0 : 1;
    float _477 = _415 * _425;
    bool _479 = !_461;
    int _481 = _479 ? 0 : 1;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _485 = ~_475;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _493 = int(_491);
    bool _495 = _447 > 0.0;
    bool _497 = _447 >= 0.0;
    bool _499 = isnan(_447);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_457;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_465;
    int _513 = _511 ? 0 : 1;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _517 = int(_515);
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    int _531 = _489;
    if (!_429)
    {
        int _533 = ~_475;
        int _535 = _533 + 1;
        _531 = _535;
    }
    int _537 = _531;
    bool _539 = _471 > 0.0;
    bool _541 = _471 >= 0.0;
    bool _543 = isnan(_471);
    bool _545 = _541 || _543;
    bool _547 = isnan(0.0);
    bool _549 = _545 || _547;
    float _551 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _553 = log2(_551);
    float _555 = float(_493);
    float _557 = _389 + _397;
    bool _559 = !_525;
    int _561 = _559 ? 0 : 1;
    float _563 = _397 + (-0.5);
    float _565 = _557 + (-1.0);
    int _567 = abs(_561);
    float _569 = 1.0 / _555;
    int _571 = _549 ? 0 : 1;
    float _573 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _575 = float(_537);
    int _577 = ~_571;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = _553 * _119;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _587 = _581;
    if (!_539)
    {
        int _589 = ~_571;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = exp2(_583);
    float _597 = float(_567);
    float _599 = in.m_53.x;
    float _601 = in.m_53.y;
    float _603 = in.m_53.z;
    int _605 = _505 ? 0 : 1;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _609 = 1.0 + _607;
    bool _611 = !_529;
    int _613 = _611 ? 0 : 1;
    float _615 = _597 * _575;
    bool _617 = !_521;
    int _619 = _617 ? 0 : 1;
    float _621 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _585);
    float _623 = 1.0 / _609;
    int _625 = ~_605;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = -_119;
    float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[76].x, _423);
    int _635 = abs(_613);
    float _637 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _621);
    int _639 = _629;
    if (!_495)
    {
        int _641 = ~_605;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _649 = abs(_619);
    float _651 = -_595;
    float _653 = _651 + 1.0;
    bool _655 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(1.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[78].w, _647);
    float _667 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _445);
    float _669 = float(_645);
    float _671 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _665);
    float _673 = float(_649);
    float _675 = _615 * (-2.0);
    bool _677 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _679 = isnan(0.0);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _685 = _681 || _683;
    float _687 = _569 * _119;
    float _689 = float(_593);
    float _691 = fma(_573, _675, _573);
    float _693 = float(_517);
    float _695 = _389 + (-0.5);
    float _697 = _685 ? _653 : 0.0;
    float _699 = _673 * _689;
    float _701 = float(_635);
    float _703 = _693 * _119;
    if (_663)
    {
        float _705 = _697 * _623;
        _123 = _705;
    }
    float _707 = _123;
    float _709 = _701 * _669;
    float _711 = fma(_675, _601, _601);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _713;
    float _717 = _699 * (-2.0);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _719;
    float _723 = _709 * (-2.0);
    float _725 = fma(_715, _451, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[196].y, _711);
    float _729 = fma(_721, _451, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _731 = fma(_483, _717, _483);
    float _733 = fma(_717, _599, _599);
    float _735 = _143 + (-0.5);
    float _737 = fma(_473, _723, _473);
    bool _739 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _741 = isnan(_385);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = fma(_691, _707, _727);
    float _753 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    bool _755 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_385);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = as_type<float>(int(gl_VertexIndex));
    float _769 = _751 * 0.15915493667125701904296875;
    float _771 = fma(_731, _707, _753);
    float _773 = -_749;
    float _775 = _773 + 1.0;
    bool _777 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _779 = isnan(_385);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = in.m_51.x;
    float _791 = in.m_51.y;
    float _793 = fma(_723, _603, _603);
    float _795 = _765 * _775;
    float _797 = -_765;
    float _799 = _797 + 1.0;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _809 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[196].z, _793);
    float _811 = _787 * _799;
    float _813 = -_787;
    float _815 = _813 + 1.0;
    float _817 = fma(_803, _477, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _819 = fma(_807, _477, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _821 = _725 * _811;
    float _823 = _729 * _811;
    float _825 = _771 * 0.15915493667125701904296875;
    float _827 = fma(_737, _707, _809);
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[143].x, _821);
    float _831 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[143].y, _823);
    float _833 = _769 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = _827 * 0.15915493667125701904296875;
    float _839 = fma(_817, _795, _829);
    float _841 = fma(_819, _795, _831);
    int _843 = as_type<int>(_767) & 1;
    bool _845 = _843 != 0;
    int _847 = as_type<int>(_767) & 2;
    bool _849 = _847 != 0;
    float _851 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[145].x, _839);
    float _853 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[145].y, _841);
    float _855 = _769 * 6.283185482025146484375;
    float _857 = cos(_855);
    bool _859 = !_849;
    float _861 = _859 ? (-0.5) : 0.5;
    float _863 = _851 * _789;
    float _865 = _853 * _791;
    bool _867 = !_845;
    float _869 = _867 ? (-0.5) : 0.5;
    float _871 = _353 * _863;
    float _873 = _353 * _865;
    float _875 = _825 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _861);
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _869);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _885 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _895 = _891 || _893;
    float _897 = _883 * _879;
    float _899 = _825 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = _885 * _881;
    bool _905 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _907 = isnan(0.5);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _913 = _909 || _911;
    float _915 = _837 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = _877 * _857;
    float _921 = _837 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _901 * _835;
    float _927 = _901 * _857;
    float _929 = -_925;
    float _931 = fma(_917, _919, _929);
    float _933 = -_919;
    float _935 = fma(_917, _925, _933);
    float _937 = _877 * _835;
    float _939 = _923 * _897;
    float _941 = _835 * _923;
    float _943 = _857 * _923;
    float _945 = fma(_917, _927, _937);
    float _947 = fma(_917, _937, _927);
    float _949 = _901 * _939;
    float _951 = -_897;
    float _953 = _917 * _951;
    float _955 = _877 * _939;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = fma(_945, _903, _949);
    float _961 = fma(_943, _903, _953);
    float _963 = fma(_931, _903, _955);
    float _965 = fma(_935, _957, _959);
    float _967 = fma(_941, _957, _961);
    float _969 = fma(_947, _957, _963);
    float _971 = _343 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _975 = _343 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _977 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _973);
    float _983 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].x, _975);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _987 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].z, _979);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _981);
    float _991 = _343 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _993 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].z, _983);
    float _995 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _997 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _985);
    float _999 = _989 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1001 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].x, _991);
    float _1003 = _993 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1005 = _997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _995 + _999;
    float _1009 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1001);
    float _1011 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1013 = _1003 + _1005;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1017 = _1007 + _1015;
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1021 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1011);
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1013 + _1023;
    float _1027 = _1017 * _1017;
    float _1029 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1031 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1033 = fma(_1025, _1025, _1027);
    float _1035 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1029);
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1041 = sqrt(_1033);
    float _1043 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1035);
    float _1045 = _1019 + _1039;
    float _1047 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1049 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1037);
    float _1051 = 1.0 / _1047;
    float _1053 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1049);
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1057 = _1041 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1059 = _1055 + _1047;
    float _1061 = _1059 * _1051;
    float _1063 = _1061 * 0.5;
    float _1065 = _1047;
    float _1067 = _1039;
    float _1069 = _969;
    float _1071 = _1013;
    float _1073 = _1041;
    float _1075 = _1017;
    float _1077 = _1033;
    if (!_1057)
    {
        _1065 = _1013;
    }
    float _1079 = _1065;
    float _1081 = _1079;
    if (!_1057)
    {
        _1067 = _1007;
    }
    float _1083 = _1067;
    float _1085 = _1083;
    if (!_1057)
    {
        _1069 = _1045;
    }
    float _1087 = _1069;
    bool _1089 = !_1057;
    float _1091 = _1087;
    if (!_1089)
    {
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1097 = _1041 + _1095;
        float _1099 = rsqrt(_1033);
        float _1101 = _1097 * _1093;
        float _1103 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = _1101 * 0.15915493667125701904296875;
        float _1107 = _1105 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1105 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = _1109 + (-1.0);
        float _1117 = _1115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = fma(_1113, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1121 = fma(_1045, _1109, _1117);
        float _1123 = _1099 * _1119;
        float _1125 = fma(_1025, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1127 = fma(_1017, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1081 = _1125;
        _1071 = _1099;
        _1091 = _1121;
        _1085 = _1127;
        _1073 = _1103;
    }
    float _1129 = _1081;
    float _1131 = _1071;
    float _1133 = _1091;
    float _1135 = _1085;
    float _1137 = _1073;
    float _1139 = _1137;
    float _1141 = _1133;
    float _1143 = _1135;
    float _1145 = _1131;
    if (_913)
    {
        _1139 = 1.0;
    }
    float _1147 = _1139;
    float _1149 = _1147;
    if (_895)
    {
        _1075 = _1129;
    }
    float _1151 = _1075;
    float _1153 = _1151;
    if (!_895)
    {
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1157 = _1019 + _1155;
        float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1161 = _1003 + _1159;
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1165 = -_1019;
        float _1167 = _1165 + _1133;
        float _1169 = _1157 * _1157;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1173 = _995 + _1171;
        float _1175 = -_995;
        float _1177 = _1175 + _1135;
        float _1179 = fma(_1161, _1161, _1169);
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1183 = fma(_1173, _1173, _1179);
        float _1185 = sqrt(_1183);
        float _1187 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1189 = precise::min(_1185, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1191 = _1189 * _1181;
        float _1193 = -_1003;
        float _1195 = _1193 + _1129;
        float _1197 = _1187 * _1191;
        float _1199 = fma(_1195, _1197, _1003);
        float _1201 = fma(_1167, _1197, _1019);
        float _1203 = fma(_1177, _1197, _995);
        _1141 = _1201;
        _1153 = _1199;
        _1143 = _1203;
        _1145 = _1197;
    }
    float _1205 = _1141;
    float _1207 = _1153;
    float _1209 = _1143;
    float _1211 = _1145;
    float _1213 = _1211;
    if (!_913)
    {
        float _1215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1223 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
        float _1225 = _1217 * 6.283185482025146484375;
        float _1227 = cos(_1225);
        float _1229 = _1219 * 0.15915493667125701904296875;
        float _1231 = _1217 * 6.283185482025146484375;
        float _1233 = sin(_1231);
        float _1235 = 1.0 / _1227;
        float _1237 = _1229 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1233 * _1235;
        float _1243 = _1229 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1239 * _1241;
        float _1249 = 1.0 / _1223;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1253 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1251;
        float _1255 = 1.0 / _1247;
        float _1257 = 1.0 / _1253;
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1261 = _1249 * _1259;
        float _1263 = _1245 * _1255;
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1267 = fma(_1263, _1261, _1265);
        float _1269 = _1267 * _1257;
        float _1271 = precise::clamp(_1269, 0.0, 1.0);
        float _1273 = -_1271;
        float _1275 = _1273 + 1.0;
        _1149 = _1275;
    }
    float _1277 = _1149;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = _1205 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1207 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1289 = _1209 + _1287;
    float _1291 = _1281 * _1281;
    float _1293 = fma(_1285, _1285, _1291);
    float _1295 = fma(_1289, _1289, _1293);
    float _1297 = rsqrt(_1295);
    float _1299 = sqrt(_1295);
    float _1301 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1303 = _1285 * _1301;
    float _1305 = _1289 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 * _1305;
    float _1311 = _1307 + _1309;
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1313 + _1317;
    float _1321 = _1293;
    float _1323 = _1319;
    float _1325 = _1281;
    float _1327 = _1301;
    float _1329 = _1307;
    if (_1315)
    {
        float _1331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1331;
    }
    float _1333 = _1321;
    float _1335 = _1333;
    if (_1315)
    {
        float _1337 = _1319 * _1333;
        _1323 = _1337;
    }
    float _1339 = _1323;
    if (_1315)
    {
        float _1341 = rsqrt(_1311);
        _1335 = _1341;
    }
    float _1343 = _1335;
    float _1345 = _1343;
    if (_1315)
    {
        float _1347 = _1339 * 0.15915493667125701904296875;
        _1213 = _1347;
    }
    float _1349 = _1213;
    float _1351 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1353 = _1297;
    if (_1315)
    {
        float _1355 = _1349 * 6.283185482025146484375;
        float _1357 = sin(_1355);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = precise::max(0.0, _1351);
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1365 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1363);
    float _1367 = precise::clamp(_1365, 0.0, 1.0);
    float _1369 = _1289;
    float _1371 = _1361;
    if (_1315)
    {
        float _1373 = _1349 * 6.283185482025146484375;
        float _1375 = cos(_1373);
        _1369 = _1375;
    }
    float _1377 = _1369;
    float _1379 = -_1301;
    float _1381 = -_1361;
    float _1383 = fma(_1281, _1379, _1381);
    float _1385 = -_1367;
    float _1387 = _1385 + 1.0;
    if (_1315)
    {
        float _1389 = _1383 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1389;
    }
    float _1391 = _1325;
    float _1393 = _1359;
    float _1395 = _1391;
    if (_1315)
    {
        float _1397 = fma(_1359, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = _1399;
    if (!_1315)
    {
        _1395 = _1305;
    }
    float _1403 = _1395;
    float _1405 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1407 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1409 = _1403;
    if (_1315)
    {
        float _1411 = _1343 * _1399;
        _1077 = _1411;
    }
    float _1413 = _1077;
    if (!_1315)
    {
        _1345 = _1303;
    }
    float _1415 = _1345;
    float _1417 = _1415;
    if (_1315)
    {
        float _1419 = _1377 + (-1.0);
        _1371 = _1419;
    }
    float _1421 = _1371;
    float _1423 = _1421;
    if (_1315)
    {
        float _1425 = _1303 * _1413;
        _1417 = _1425;
    }
    float _1427 = _1417;
    if (!_1315)
    {
        _1401 = _1383;
    }
    float _1429 = _1401;
    float _1431 = _1429;
    if (_1315)
    {
        float _1433 = _1305 * _1413;
        _1409 = _1433;
    }
    float _1435 = _1409;
    if (_1315)
    {
        float _1437 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1437;
    }
    float _1439 = _1327;
    if (_1315)
    {
        float _1441 = _1427 * _1427;
        _1329 = _1441;
    }
    float _1443 = _1329;
    if (!_1315)
    {
        _1423 = _1309;
    }
    float _1445 = _1423;
    float _1447 = _1445;
    if (_1315)
    {
        float _1449 = _1435 * _1435;
        _1447 = _1449;
    }
    float _1451 = _1447;
    if (_1315)
    {
        float _1453 = fma(_1383, _1377, _1439);
        _1431 = _1453;
    }
    float _1455 = _1431;
    float _1457 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1407);
    float _1459 = fma(_1455, _1455, _1443);
    float _1461 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1463 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1457);
    float _1465 = _1459 + _1451;
    float _1467 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1461);
    float _1469 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1471 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1473 = rsqrt(_1465);
    float _1475 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1467);
    float _1477 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1479 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1471);
    float _1481 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1477);
    float _1485 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1487 = abs(_1387);
    float _1489 = log2(_1487);
    float _1491 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = _1473 * _1427;
    float _1503 = _1473 * _1455;
    float _1505 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1507 = _1473 * _1435;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1511 = -_1497;
    float _1513 = fma(_1511, _1405, 1.0);
    float _1515 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1517 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1519 = -_1509;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1519);
    float _1523 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1525 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1515);
    float _1527 = log2(_1513);
    float _1529 = -_1507;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1521);
    float _1533 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1517);
    float _1537 = _1503 + 1.0;
    float _1539 = fma(_1531, -0.5, 0.5);
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1543 = fma(_1531, 0.5, 0.5);
    float _1545 = exp2(_1523);
    float _1547 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1541);
    float _1549 = fma(_1543, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1551 = fma(_1543, _1549, -0.212114393711090087890625);
    float _1553 = 1.0 / _1525;
    float _1555 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1557 = _1527 * 0.693147182464599609375;
    float _1559 = fma(_1543, _1551, 1.570728778839111328125);
    float _1561 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = sqrt(_1539);
    float _1565 = -_1503;
    float _1567 = fma(_1545, _1537, _1565);
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1571 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1555);
    float _1573 = _1569 * _1553;
    float _1575 = _1571 * _1553;
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1575, -0.5, 0.5);
    float _1581 = fma(_1567, 0.5, 0.5);
    float _1583 = _1563 * 0.636619746685028076171875;
    float _1585 = -_1559;
    float _1587 = fma(_1583, _1585, 1.0);
    float3 _4712 = float3(_1577, _1579, _1561);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).x;
    float3 _4723 = float3(_1577, _1579, _1561);
    float4 _1592 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4723, float3(0.0), isnan(_4723)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4723, float3(0.0), isnan(_4723)), level(0.0)).xyzw;
    float _1594 = _1592.x;
    float _1596 = _1592.y;
    float _1598 = _1592.z;
    float _1600 = _1592.w;
    float2 _4740 = float2(_1587, _1581);
    float3 _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4740, float2(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4740, float2(0.0), isnan(_4740)), level(0.0)).xyz;
    float _1606 = _1604.x;
    float _1608 = _1604.y;
    float _1610 = _1604.z;
    float _1612 = float(uint(_517));
    float _1614 = trunc(_687);
    int _1616 = int(_1614);
    int _1618 = ~_517;
    int _1620 = _1618 + 1;
    float _1622 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1624 = ~_517;
    int _1626 = _1624 + 1;
    float _1628 = -_637;
    float _1630 = _1628 + 1.0;
    float _1632 = -_671;
    float _1634 = _1632 + 1.0;
    float _1636 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1622);
    float _1638 = 1.0 / _1612;
    float _1640 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1636);
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1644 = _1642 != 0;
    float _1646 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1648 = float(uint(_1616));
    float _1650 = 1.0 / _387;
    float _1652 = float(_1616);
    bool _1654 = !_1644;
    float _1656 = _1654 ? 7.345489978790283203125 : 1.0;
    int _1658 = as_type<int>(_1638) + (-2);
    bool _1660 = _1652 >= _693;
    bool _1662 = isnan(_1652);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_693);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = _1656 * _143;
    float _1674 = as_type<float>(_1658) * _1648;
    float _1676 = trunc(_1670);
    int _1678 = int(_1676);
    float _1680 = _703 * _1650;
    float _1682 = trunc(_1674);
    float _1684 = precise::max(_1682, 0.0);
    uint _1687 = uint(_1684);
    float _1689 = trunc(_1680);
    int _1691 = int(_1689);
    int _1693 = _1620 * int(_1687);
    int _1695 = _1693 + _1616;
    float _1697 = float(uint(_1695));
    float _1699 = as_type<float>(_1658) * _1697;
    float _1701 = floor(_1672);
    float _1703 = trunc(_1699);
    float _1705 = precise::max(_1703, 0.0);
    uint _1707 = uint(_1705);
    float _1709 = -_1701;
    float _1711 = _1672 + _1709;
    int _1713 = _517 + (-1);
    int _1715 = int(_1687) + int(_1707);
    int _1717 = _1626 * _1715;
    int _1719 = _1717 + _1616;
    bool _1721 = uint(_1719) >= uint(_517);
    bool _1723 = !_1721;
    int _1725 = _1723 ? 0 : (-1);
    bool _1727 = _517 == 0;
    int _1729 = ~_1715;
    int _1731 = _1729 + _1725;
    int _1733 = _1731 + 1;
    float _1735 = _1711 * _693;
    int _1737 = _517 * _1733;
    int _1739 = _1737 + _1616;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1743 = _1741 != 0;
    float _1745 = trunc(_1735);
    int _1747 = int(_1745);
    int _1749 = ~_1678;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    bool _1755 = !_1727;
    int _1757 = _1755 ? _1739 : (-1);
    bool _1759 = !_1743;
    int _1761 = _1759 ? 0 : 1;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1765 = _1763 != 0;
    int _1767 = _1757 * _1753;
    int _1769 = abs(_1761);
    int _1771 = abs(_481);
    int _1773 = _1678 * _1713;
    int _1775 = _1773 + _1767;
    int _1777 = abs(_509);
    int _1779 = _1775 * _1771;
    bool _1781 = !_1765;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = abs(_513);
    int _1787 = _1747 * _1769;
    int _1789 = _1787 + _1616;
    int _1791 = abs(_1783);
    int _1793 = _1691 * _1777;
    int _1795 = _1793 + _1779;
    int _1797 = ~_517;
    int _1799 = _1797 + 1;
    int _1801 = ~_517;
    int _1803 = _1801 + 1;
    int _1805 = _1789 * _1785;
    int _1807 = _1805 + _1795;
    int _1809 = ~_517;
    int _1811 = _1809 + 1;
    int _1813 = _1747 * _1791;
    int _1815 = _1813 + _1807;
    float _1817 = float(uint(_1815));
    float _1819 = as_type<float>(_1658) * _1817;
    float _1821 = trunc(_1819);
    float _1823 = precise::max(_1821, 0.0);
    uint _1825 = uint(_1823);
    int _1827 = _1799 * int(_1825);
    int _1829 = _1827 + _1815;
    float _1831 = float(uint(_1829));
    float _1833 = as_type<float>(_1658) * _1831;
    float _1835 = trunc(_1833);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = int(_1825) + int(_1839);
    float _1843 = float(uint(_1789));
    int _1845 = _1803 * _1841;
    int _1847 = _1845 + _1815;
    float _1849 = as_type<float>(_1658) * _1843;
    bool _1851 = uint(_1847) >= uint(_517);
    float _1853 = trunc(_1849);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    bool _1859 = !_1851;
    int _1861 = _1859 ? 0 : (-1);
    int _1863 = ~_1841;
    int _1865 = _1863 + _1861;
    int _1867 = _1865 + 1;
    int _1869 = _517 * _1867;
    int _1871 = _1869 + _1815;
    int _1873 = _1803 * int(_1857);
    int _1875 = _1873 + _1789;
    bool _1877 = !_1727;
    int _1879 = _1877 ? _1871 : (-1);
    int _1881 = _1879 >> 31;
    float _1883 = float(uint(_1875));
    int _1885 = _1881 & 3;
    int _1887 = _1879 & 3;
    bool _1889 = _1887 != 0;
    float _1891 = as_type<float>(_1658) * _1883;
    int _1893 = _1879 + _1885;
    int _1895 = _1879 & 3;
    bool _1897 = _1895 != 0;
    float _1899 = trunc(_1891);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = _1893 >> 2;
    bool _1907 = uint(_1895) > 1u;
    int _1909 = _1905 << 4;
    int _1911 = _1909 + 368;
    int _1913 = _1889 ? 0 : 1;
    uint _1915 = uint(int(uint(_1911) >> uint(2)));
    uint _1917 = uint(int(uint(int(_1915)) >> uint(2)));
    int _1919 = int(_1915) & 3;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[int(_1917)][_1919];
    int _1923 = int(_1915) + 1;
    uint _1925 = uint(int(uint(_1923) >> uint(2)));
    int _1927 = _1923 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[int(_1925)][_1927];
    bool _1931 = _1895 != 3;
    int _1933 = ~_1913;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    int _1939 = _1937;
    if (!_1907)
    {
        int _1941 = ~_1913;
        int _1943 = _1941 + 1;
        _1939 = _1943;
    }
    int _1945 = _1939;
    int _1947 = _1911 + 8;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    uint _1951 = uint(int(uint(int(_1949)) >> uint(2)));
    int _1953 = int(_1949) & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = int(_1949) + 1;
    uint _1959 = uint(int(uint(_1957) >> uint(2)));
    int _1961 = _1957 & 3;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[int(_1959)][_1961];
    int _1965 = int(_1857) + int(_1903);
    int _1967 = abs(_1945);
    bool _1969 = uint(_1895) >= 2u;
    int _1971 = _1811 * _1965;
    int _1973 = _1971 + _1789;
    int _1975 = ~_1967;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    int _1981 = _1969 ? 0 : 1;
    bool _1983 = !_1897;
    int _1985 = _1983 ? 0 : 1;
    bool _1987 = _1895 != 3;
    int _1989 = ~_1981;
    int _1991 = _1989 + 1;
    int _1993 = _1991 + 1;
    int _1995 = abs(_1985);
    int _1997 = _1993;
    if (_1931)
    {
        int _1999 = ~_1981;
        int _2001 = _1999 + 1;
        _1997 = _2001;
    }
    int _2003 = _1997;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2007 = _2005 != 0;
    bool _2009 = !_1987;
    int _2011 = _2009 ? 0 : (-1);
    int _2013 = ~_1995;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = abs(_2003);
    bool _2021 = !_2007;
    int _2023 = _2021 ? 0 : 1;
    int _2025 = abs(_2011);
    int _2027 = ~_2019;
    int _2029 = _2027 + 1;
    int _2031 = _2029 + 1;
    bool _2033 = uint(_1973) >= uint(_517);
    bool _2035 = _143 > 0.5;
    bool _2037 = !_2033;
    int _2039 = _2037 ? 0 : (-1);
    int _2041 = _1979 * as_type<int>(_1929);
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2045 = _2043 != 0;
    float _2047 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2049 = int(_2047);
    int _2051 = ~_1965;
    int _2053 = _2051 + _2039;
    int _2055 = _2053 + 1;
    int _2057 = _2017 * as_type<int>(_1921);
    int _2059 = _2057 + _2041;
    int _2061 = abs(_2023);
    int _2063 = _2031 * as_type<int>(_1955);
    int _2065 = _2063 + _2059;
    int _2067 = _517 * _2055;
    int _2069 = _2067 + _1789;
    int _2071 = ~_2025;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = ~_2061;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    bool _2083 = !_1727;
    int _2085 = _2083 ? _2069 : (-1);
    int _2087 = _2075 * as_type<int>(_1963);
    int _2089 = _2087 + _2065;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2093 = _2091 != 0;
    float _2095 = float(uint(_2049));
    int _2097 = _2089 * _2081;
    int _2099 = abs(_2049);
    int _2101 = ~_2049;
    int _2103 = _2101 + 1;
    int _2105 = _2085 * _2061;
    int _2107 = _2105 + _2097;
    float _2109 = 1.0 / _2095;
    bool _2111 = _389 > 0.5;
    float _2113 = float(uint(_2099));
    float _2115 = float(uint(_2107));
    int _2117 = abs(_2107);
    float _2119 = 1.0 / _2113;
    int _2121 = ~_2099;
    int _2123 = _2121 + 1;
    float _2125 = float(uint(_2117));
    int _2127 = as_type<int>(_2109) + (-2);
    int _2129 = ~_2099;
    int _2131 = _2129 + 1;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2135 = as_type<float>(_2127) * _2115;
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2139 = as_type<int>(_2119) + (-2);
    float _2141 = trunc(_2135);
    float _2143 = precise::max(_2141, 0.0);
    uint _2145 = uint(_2143);
    int _2147 = ~_2049;
    int _2149 = _2147 + 1;
    float _2151 = as_type<float>(_2139) * _2125;
    float _2153 = trunc(_2151);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    int _2159 = _2149 * int(_2145);
    int _2161 = _2159 + _2107;
    float _2163 = float(uint(_2161));
    int _2165 = _2131 * int(_2157);
    int _2167 = _2165 + _2117;
    float _2169 = as_type<float>(_2127) * _2163;
    float _2171 = trunc(_2169);
    float _2173 = precise::max(_2171, 0.0);
    uint _2175 = uint(_2173);
    float _2177 = float(uint(_2167));
    float _2179 = as_type<float>(_2139) * _2177;
    float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2183 = trunc(_2179);
    float _2185 = precise::max(_2183, 0.0);
    uint _2187 = uint(_2185);
    int _2189 = int(_2145) + int(_2175);
    int _2191 = _2103 * _2189;
    int _2193 = _2191 + _2107;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2197 = uint(_2193) >= uint(_2049);
    float _2199 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2201 = int(_2157) + int(_2187);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2207 = _2123 * _2201;
    int _2209 = _2207 + _2117;
    bool _2211 = !_2197;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2217 = ~_2189;
    int _2219 = _2217 + _2213;
    int _2221 = _2219 + 1;
    float _2223 = -_869;
    int _2225 = _2035 ? as_type<int>(_2223) : as_type<int>(_869);
    out.m_58.x = _2215;
    out.m_58.y = _2137;
    out.m_58.z = _2203;
    out.m_58.w = _2195;
    bool _2227 = uint(_2209) >= uint(_2099);
    int _2229 = _2049 * _2221;
    int _2231 = _2229 + _2107;
    bool _2233 = !_2045;
    float _2235 = _2233 ? _869 : as_type<float>(_2225);
    bool _2237 = !_2227;
    int _2239 = _2237 ? 0 : (-1);
    bool _2241 = _2049 == 0;
    int _2243 = _2107 ^ _2049;
    bool _2245 = !_2241;
    int _2247 = _2245 ? _2231 : (-1);
    uint _2249 = uint(int(uint(_2243) >> uint(31)));
    float _2251 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2253 = _2049 == 0;
    int _2255 = ~_2239;
    int _2257 = _2201 + _2255;
    int _2259 = _2257 + 1;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2263 = -_861;
    int _2265 = _2111 ? as_type<int>(_2263) : as_type<int>(_861);
    float _2267 = float(_2247);
    int _2269 = ~int(_2249);
    int _2271 = _2269 + 1;
    bool _2273 = !_2093;
    float _2275 = _2273 ? _861 : as_type<float>(_2265);
    float _2277 = fma(_2251, _2267, _633);
    int _2279 = _2259 ^ _2271;
    float _2281 = _2235 + 0.5;
    int _2283 = ~_2271;
    int _2285 = _2283 + _2279;
    int _2287 = _2285 + 1;
    float _2289 = fma(_2251, _2281, _2277);
    float _2291 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2295 = !_2253;
    int _2297 = _2295 ? _2287 : (-1);
    float _2299 = -_1630;
    float _2301 = fma(_2235, _2299, _2289);
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2305 = float(_2297);
    float _2307 = exp2(_2291);
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2313 = -_667;
    float _2315 = fma(_2293, _2305, _2313);
    float _2317 = _2275 + (-0.5);
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2321 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2323 = _1277 > 0.0;
    bool _2325 = isnan(_1277);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan(0.0);
    bool _2331 = _2327 || _2329;
    float _2333 = -_2293;
    float _2335 = fma(_2333, _2317, _2315);
    float _2337 = _1646 + _1525;
    float _2339 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2341 = _2337 * 0.5;
    float _2343 = -_2307;
    float _2345 = _2343 + 1.0;
    out.m_60.x = _2311;
    out.m_60.y = _2321;
    out.m_60.z = _2339;
    float _2347 = fma(_2275, _1634, _2335);
    float _2349 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1569;
    out.gl_Position.y = _1571;
    out.gl_Position.z = _1646;
    out.gl_Position.w = _1525;
    float _2353 = _2351 * _1589;
    out.m_62.z = _2341;
    out.m_62.w = _1525;
    float _2355 = _1610 * _2353;
    float _2357 = _1600 * _2353;
    float _2359 = -_2351;
    float _2361 = _2359 + 1.0;
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2301;
    out.m_64.y = _2347;
    float _2365 = fma(_1606, _2357, _1594);
    float _2367 = fma(_1608, _2357, _1596);
    float _2369 = _1600 * _2361;
    float _2371 = fma(_1600, _2355, _1598);
    out.m_45.x = _2363;
    out.m_66.x = _2365;
    out.m_66.y = _2367;
    out.m_66.z = _2371;
    out.m_66.w = _2369;
    if (_2331)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2430 = as_type<float>(_101);
        out.gl_Position.z = _2430;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
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
        _103 = as_type<int>(_139);
    }
    int _141 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2500 = as_type<float>(_141);
        out.gl_Position.z = _2500;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _147 * _145;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _121 = _165;
    }
    float _167 = _121;
    float _169 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _171 = _167;
    if (!_159)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    float _187 = _183 * 0.15915493667125701904296875;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _187 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = 1.4012984643248170709237295832899e-45;
    float _199 = _175;
    if (!_159)
    {
        _197 = _149;
    }
    float _201 = _197;
    float _203 = -_185;
    float _205 = _169 + _203;
    bool _207 = !_159;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _239;
    }
    float _241 = _199;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _149 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _209 = _263;
    }
    float _265 = _209;
    float _267 = in.m_51.w;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = in.m_42.x;
    float _281 = in.m_42.y;
    float _283 = in.m_42.z;
    float _285 = fma(_195, 0.5, 0.5);
    bool _287 = _205 < 0.5;
    float _289 = float(_287);
    bool _291 = !_273;
    int _293 = _291 ? 0 : 1;
    float _295 = -_205;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _299 = !_191;
    int _301 = _299 ? 0 : 1;
    float _303 = -_289;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = abs(_293);
    float _309 = -_285;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_265, _177, _269);
    int _315 = abs(_301);
    float _317 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = !_277;
    int _321 = _319 ? 0 : 1;
    float _323 = fma(_265, _179, _317);
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _327 = abs(_321);
    float _329 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = float(_307);
    float _333 = float(_315);
    float _335 = fma(_265, _181, _329);
    float _337 = abs(_297);
    float _339 = _331 * _337;
    float _341 = fma(_313, _267, _279);
    float _343 = fma(_323, _267, _281);
    float _345 = float(_327);
    float _347 = fma(_333, _311, _339);
    float _349 = fma(_335, _267, _283);
    float _351 = abs(_305);
    float _353 = fma(_345, _351, _347);
    bool _355 = !_325;
    float _373;
    float _375;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _359 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _361 = float(_85);
        float _363 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _365 = _363 * _357;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = _361;
        _377 = true;
    }
    else
    {
        float _379 = float(_85);
        float _381 = 1.0 / _379;
        float _383 = _119 * _381;
        _373 = _383;
        _375 = _379;
    }
    _377 = false;
    float _385 = _373;
    float _387 = _375;
    float _389 = in.m_49.y;
    float _391 = _143 * 2.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = _385 + _393;
    float _397 = in.m_49.z;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _399;
    float _403 = floor(_391);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _415 = _385 + _413;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _419 = 1.0 / _401;
    float _421 = -_411;
    float _423 = fma(_409, 2.0, _421);
    float _425 = 1.0 / _407;
    float _427 = _389 * 2.0;
    bool _429 = _403 > 0.0;
    float _431 = _389 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _433 = _403 >= 0.0;
    bool _435 = isnan(_403);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = _397 * 2.0;
    float _445 = fma(_431, -2.0, _417);
    float _447 = floor(_427);
    float _449 = _143 + _397;
    float _451 = _395 * _419;
    float _453 = _143 + _389;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _465 = _463 != 0;
    float _467 = _449 + (-1.0);
    float _469 = _453 + (-1.0);
    float _471 = floor(_443);
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _475 = _441 ? 0 : 1;
    float _477 = _415 * _425;
    bool _479 = !_461;
    int _481 = _479 ? 0 : 1;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _485 = ~_475;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _493 = int(_491);
    bool _495 = _447 > 0.0;
    bool _497 = _447 >= 0.0;
    bool _499 = isnan(_447);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = !_457;
    int _509 = _507 ? 0 : 1;
    bool _511 = !_465;
    int _513 = _511 ? 0 : 1;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _517 = int(_515);
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    int _531 = _489;
    if (!_429)
    {
        int _533 = ~_475;
        int _535 = _533 + 1;
        _531 = _535;
    }
    int _537 = _531;
    bool _539 = _471 > 0.0;
    bool _541 = _471 >= 0.0;
    bool _543 = isnan(_471);
    bool _545 = _541 || _543;
    bool _547 = isnan(0.0);
    bool _549 = _545 || _547;
    float _551 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _553 = log2(_551);
    float _555 = float(_493);
    float _557 = _389 + _397;
    bool _559 = !_525;
    int _561 = _559 ? 0 : 1;
    float _563 = _397 + (-0.5);
    float _565 = _557 + (-1.0);
    int _567 = abs(_561);
    float _569 = 1.0 / _555;
    int _571 = _549 ? 0 : 1;
    float _573 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _575 = float(_537);
    int _577 = ~_571;
    int _579 = _577 + 1;
    int _581 = _579 + 1;
    float _583 = _553 * _119;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _587 = _581;
    if (!_539)
    {
        int _589 = ~_571;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = exp2(_583);
    float _597 = float(_567);
    float _599 = in.m_53.x;
    float _601 = in.m_53.y;
    float _603 = in.m_53.z;
    int _605 = _505 ? 0 : 1;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _609 = 1.0 + _607;
    bool _611 = !_529;
    int _613 = _611 ? 0 : 1;
    float _615 = _597 * _575;
    bool _617 = !_521;
    int _619 = _617 ? 0 : 1;
    float _621 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _585);
    float _623 = 1.0 / _609;
    int _625 = ~_605;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = -_119;
    float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[76].x, _423);
    int _635 = abs(_613);
    float _637 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _621);
    int _639 = _629;
    if (!_495)
    {
        int _641 = ~_605;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _649 = abs(_619);
    float _651 = -_595;
    float _653 = _651 + 1.0;
    bool _655 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(1.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[78].w, _647);
    float _667 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _445);
    float _669 = float(_645);
    float _671 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _665);
    float _673 = float(_649);
    float _675 = _615 * (-2.0);
    bool _677 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _679 = isnan(0.0);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _685 = _681 || _683;
    float _687 = _569 * _119;
    float _689 = float(_593);
    float _691 = fma(_573, _675, _573);
    float _693 = float(_517);
    float _695 = _389 + (-0.5);
    float _697 = _685 ? _653 : 0.0;
    float _699 = _673 * _689;
    float _701 = float(_635);
    float _703 = _693 * _119;
    if (_663)
    {
        float _705 = _697 * _623;
        _123 = _705;
    }
    float _707 = _123;
    float _709 = _701 * _669;
    float _711 = fma(_675, _601, _601);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _713;
    float _717 = _699 * (-2.0);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _719;
    float _723 = _709 * (-2.0);
    float _725 = fma(_715, _451, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[196].y, _711);
    float _729 = fma(_721, _451, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _731 = fma(_483, _717, _483);
    float _733 = fma(_717, _599, _599);
    float _735 = _143 + (-0.5);
    float _737 = fma(_473, _723, _473);
    bool _739 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _741 = isnan(_385);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = fma(_691, _707, _727);
    float _753 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    bool _755 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_385);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = as_type<float>(int(gl_VertexIndex));
    float _769 = _751 * 0.15915493667125701904296875;
    float _771 = fma(_731, _707, _753);
    float _773 = -_749;
    float _775 = _773 + 1.0;
    bool _777 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _779 = isnan(_385);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = in.m_51.x;
    float _791 = in.m_51.y;
    float _793 = fma(_723, _603, _603);
    float _795 = _765 * _775;
    float _797 = -_765;
    float _799 = _797 + 1.0;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _809 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[196].z, _793);
    float _811 = _787 * _799;
    float _813 = -_787;
    float _815 = _813 + 1.0;
    float _817 = fma(_803, _477, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _819 = fma(_807, _477, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _821 = _725 * _811;
    float _823 = _729 * _811;
    float _825 = _771 * 0.15915493667125701904296875;
    float _827 = fma(_737, _707, _809);
    float _829 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[143].x, _821);
    float _831 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[143].y, _823);
    float _833 = _769 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = _827 * 0.15915493667125701904296875;
    float _839 = fma(_817, _795, _829);
    float _841 = fma(_819, _795, _831);
    int _843 = as_type<int>(_767) & 1;
    bool _845 = _843 != 0;
    int _847 = as_type<int>(_767) & 2;
    bool _849 = _847 != 0;
    float _851 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[145].x, _839);
    float _853 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[145].y, _841);
    float _855 = _769 * 6.283185482025146484375;
    float _857 = cos(_855);
    bool _859 = !_849;
    float _861 = _859 ? (-0.5) : 0.5;
    float _863 = _851 * _789;
    float _865 = _853 * _791;
    bool _867 = !_845;
    float _869 = _867 ? (-0.5) : 0.5;
    float _871 = _353 * _863;
    float _873 = _353 * _865;
    float _875 = _825 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _861);
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _869);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _885 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _889 = isnan(0.5);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _895 = _891 || _893;
    float _897 = _883 * _879;
    float _899 = _825 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = _885 * _881;
    bool _905 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _907 = isnan(0.5);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _913 = _909 || _911;
    float _915 = _837 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = _877 * _857;
    float _921 = _837 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _901 * _835;
    float _927 = _901 * _857;
    float _929 = -_925;
    float _931 = fma(_917, _919, _929);
    float _933 = -_919;
    float _935 = fma(_917, _925, _933);
    float _937 = _877 * _835;
    float _939 = _923 * _897;
    float _941 = _835 * _923;
    float _943 = _857 * _923;
    float _945 = fma(_917, _927, _937);
    float _947 = fma(_917, _937, _927);
    float _949 = _901 * _939;
    float _951 = -_897;
    float _953 = _917 * _951;
    float _955 = _877 * _939;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = fma(_945, _903, _949);
    float _961 = fma(_943, _903, _953);
    float _963 = fma(_931, _903, _955);
    float _965 = fma(_935, _957, _959);
    float _967 = fma(_941, _957, _961);
    float _969 = fma(_947, _957, _963);
    float _971 = _343 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _973 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _975 = _343 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _977 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _979 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].x, _971);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _973);
    float _983 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].x, _975);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].x, _977);
    float _987 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].z, _979);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _981);
    float _991 = _343 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _993 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].z, _983);
    float _995 = _987 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _997 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _985);
    float _999 = _989 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1001 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].x, _991);
    float _1003 = _993 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1005 = _997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1007 = _995 + _999;
    float _1009 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1001);
    float _1011 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1013 = _1003 + _1005;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1017 = _1007 + _1015;
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1021 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1011);
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1025 = _1013 + _1023;
    float _1027 = _1017 * _1017;
    float _1029 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1031 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1033 = fma(_1025, _1025, _1027);
    float _1035 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1029);
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1039 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1041 = sqrt(_1033);
    float _1043 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1035);
    float _1045 = _1019 + _1039;
    float _1047 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1049 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1037);
    float _1051 = 1.0 / _1047;
    float _1053 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1049);
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1057 = _1041 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1059 = _1055 + _1047;
    float _1061 = _1059 * _1051;
    float _1063 = _1061 * 0.5;
    float _1065 = _1047;
    float _1067 = _1039;
    float _1069 = _969;
    float _1071 = _1013;
    float _1073 = _1041;
    float _1075 = _1017;
    float _1077 = _1033;
    if (!_1057)
    {
        _1065 = _1013;
    }
    float _1079 = _1065;
    float _1081 = _1079;
    if (!_1057)
    {
        _1067 = _1007;
    }
    float _1083 = _1067;
    float _1085 = _1083;
    if (!_1057)
    {
        _1069 = _1045;
    }
    float _1087 = _1069;
    bool _1089 = !_1057;
    float _1091 = _1087;
    if (!_1089)
    {
        float _1093 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1097 = _1041 + _1095;
        float _1099 = rsqrt(_1033);
        float _1101 = _1097 * _1093;
        float _1103 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = _1101 * 0.15915493667125701904296875;
        float _1107 = _1105 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1105 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = _1109 + (-1.0);
        float _1117 = _1115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = fma(_1113, _1103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1121 = fma(_1045, _1109, _1117);
        float _1123 = _1099 * _1119;
        float _1125 = fma(_1025, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1127 = fma(_1017, _1123, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1081 = _1125;
        _1071 = _1099;
        _1091 = _1121;
        _1085 = _1127;
        _1073 = _1103;
    }
    float _1129 = _1081;
    float _1131 = _1071;
    float _1133 = _1091;
    float _1135 = _1085;
    float _1137 = _1073;
    float _1139 = _1137;
    float _1141 = _1133;
    float _1143 = _1135;
    float _1145 = _1131;
    if (_913)
    {
        _1139 = 1.0;
    }
    float _1147 = _1139;
    float _1149 = _1147;
    if (_895)
    {
        _1075 = _1129;
    }
    float _1151 = _1075;
    float _1153 = _1151;
    if (!_895)
    {
        float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1157 = _1019 + _1155;
        float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1161 = _1003 + _1159;
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1165 = -_1019;
        float _1167 = _1165 + _1133;
        float _1169 = _1157 * _1157;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1173 = _995 + _1171;
        float _1175 = -_995;
        float _1177 = _1175 + _1135;
        float _1179 = fma(_1161, _1161, _1169);
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1183 = fma(_1173, _1173, _1179);
        float _1185 = sqrt(_1183);
        float _1187 = _1163 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1189 = precise::min(_1185, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1191 = _1189 * _1181;
        float _1193 = -_1003;
        float _1195 = _1193 + _1129;
        float _1197 = _1187 * _1191;
        float _1199 = fma(_1195, _1197, _1003);
        float _1201 = fma(_1167, _1197, _1019);
        float _1203 = fma(_1177, _1197, _995);
        _1141 = _1201;
        _1153 = _1199;
        _1143 = _1203;
        _1145 = _1197;
    }
    float _1205 = _1141;
    float _1207 = _1153;
    float _1209 = _1143;
    float _1211 = _1145;
    float _1213 = _1211;
    if (!_913)
    {
        float _1215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1223 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
        float _1225 = _1217 * 6.283185482025146484375;
        float _1227 = cos(_1225);
        float _1229 = _1219 * 0.15915493667125701904296875;
        float _1231 = _1217 * 6.283185482025146484375;
        float _1233 = sin(_1231);
        float _1235 = 1.0 / _1227;
        float _1237 = _1229 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1233 * _1235;
        float _1243 = _1229 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1239 * _1241;
        float _1249 = 1.0 / _1223;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1253 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1251;
        float _1255 = 1.0 / _1247;
        float _1257 = 1.0 / _1253;
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1261 = _1249 * _1259;
        float _1263 = _1245 * _1255;
        float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1267 = fma(_1263, _1261, _1265);
        float _1269 = _1267 * _1257;
        float _1271 = precise::clamp(_1269, 0.0, 1.0);
        float _1273 = -_1271;
        float _1275 = _1273 + 1.0;
        _1149 = _1275;
    }
    float _1277 = _1149;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = _1205 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1207 + _1283;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1289 = _1209 + _1287;
    float _1291 = _1281 * _1281;
    float _1293 = fma(_1285, _1285, _1291);
    float _1295 = fma(_1289, _1289, _1293);
    float _1297 = rsqrt(_1295);
    float _1299 = sqrt(_1295);
    float _1301 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1303 = _1285 * _1301;
    float _1305 = _1289 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 * _1305;
    float _1311 = _1307 + _1309;
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1313 + _1317;
    float _1321 = _1293;
    float _1323 = _1319;
    float _1325 = _1281;
    float _1327 = _1301;
    float _1329 = _1307;
    if (_1315)
    {
        float _1331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1331;
    }
    float _1333 = _1321;
    float _1335 = _1333;
    if (_1315)
    {
        float _1337 = _1319 * _1333;
        _1323 = _1337;
    }
    float _1339 = _1323;
    if (_1315)
    {
        float _1341 = rsqrt(_1311);
        _1335 = _1341;
    }
    float _1343 = _1335;
    float _1345 = _1343;
    if (_1315)
    {
        float _1347 = _1339 * 0.15915493667125701904296875;
        _1213 = _1347;
    }
    float _1349 = _1213;
    float _1351 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1353 = _1297;
    if (_1315)
    {
        float _1355 = _1349 * 6.283185482025146484375;
        float _1357 = sin(_1355);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = precise::max(0.0, _1351);
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1365 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1363);
    float _1367 = precise::clamp(_1365, 0.0, 1.0);
    float _1369 = _1289;
    float _1371 = _1361;
    if (_1315)
    {
        float _1373 = _1349 * 6.283185482025146484375;
        float _1375 = cos(_1373);
        _1369 = _1375;
    }
    float _1377 = _1369;
    float _1379 = -_1301;
    float _1381 = -_1361;
    float _1383 = fma(_1281, _1379, _1381);
    float _1385 = -_1367;
    float _1387 = _1385 + 1.0;
    if (_1315)
    {
        float _1389 = _1383 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1389;
    }
    float _1391 = _1325;
    float _1393 = _1359;
    float _1395 = _1391;
    if (_1315)
    {
        float _1397 = fma(_1359, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = _1399;
    if (!_1315)
    {
        _1395 = _1305;
    }
    float _1403 = _1395;
    float _1405 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1407 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1409 = _1403;
    if (_1315)
    {
        float _1411 = _1343 * _1399;
        _1077 = _1411;
    }
    float _1413 = _1077;
    if (!_1315)
    {
        _1345 = _1303;
    }
    float _1415 = _1345;
    float _1417 = _1415;
    if (_1315)
    {
        float _1419 = _1377 + (-1.0);
        _1371 = _1419;
    }
    float _1421 = _1371;
    float _1423 = _1421;
    if (_1315)
    {
        float _1425 = _1303 * _1413;
        _1417 = _1425;
    }
    float _1427 = _1417;
    if (!_1315)
    {
        _1401 = _1383;
    }
    float _1429 = _1401;
    float _1431 = _1429;
    if (_1315)
    {
        float _1433 = _1305 * _1413;
        _1409 = _1433;
    }
    float _1435 = _1409;
    if (_1315)
    {
        float _1437 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1437;
    }
    float _1439 = _1327;
    if (_1315)
    {
        float _1441 = _1427 * _1427;
        _1329 = _1441;
    }
    float _1443 = _1329;
    if (!_1315)
    {
        _1423 = _1309;
    }
    float _1445 = _1423;
    float _1447 = _1445;
    if (_1315)
    {
        float _1449 = _1435 * _1435;
        _1447 = _1449;
    }
    float _1451 = _1447;
    if (_1315)
    {
        float _1453 = fma(_1383, _1377, _1439);
        _1431 = _1453;
    }
    float _1455 = _1431;
    float _1457 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1407);
    float _1459 = fma(_1455, _1455, _1443);
    float _1461 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1463 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1457);
    float _1465 = _1459 + _1451;
    float _1467 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1461);
    float _1469 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1471 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1473 = rsqrt(_1465);
    float _1475 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1467);
    float _1477 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1469);
    float _1479 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1471);
    float _1481 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1477);
    float _1485 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1487 = abs(_1387);
    float _1489 = log2(_1487);
    float _1491 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1501 = _1473 * _1427;
    float _1503 = _1473 * _1455;
    float _1505 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1499);
    float _1507 = _1473 * _1435;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1511 = -_1497;
    float _1513 = fma(_1511, _1405, 1.0);
    float _1515 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1517 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1519 = -_1509;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1519);
    float _1523 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1525 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1515);
    float _1527 = log2(_1513);
    float _1529 = -_1507;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1521);
    float _1533 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1517);
    float _1537 = _1503 + 1.0;
    float _1539 = fma(_1531, -0.5, 0.5);
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1543 = fma(_1531, 0.5, 0.5);
    float _1545 = exp2(_1523);
    float _1547 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1541);
    float _1549 = fma(_1543, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1551 = fma(_1543, _1549, -0.212114393711090087890625);
    float _1553 = 1.0 / _1525;
    float _1555 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1557 = _1527 * 0.693147182464599609375;
    float _1559 = fma(_1543, _1551, 1.570728778839111328125);
    float _1561 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = sqrt(_1539);
    float _1565 = -_1503;
    float _1567 = fma(_1545, _1537, _1565);
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1571 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1555);
    float _1573 = _1569 * _1553;
    float _1575 = _1571 * _1553;
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1575, -0.5, 0.5);
    float _1581 = fma(_1567, 0.5, 0.5);
    float _1583 = _1563 * 0.636619746685028076171875;
    float _1585 = -_1559;
    float _1587 = fma(_1583, _1585, 1.0);
    float3 _4712 = float3(_1577, _1579, _1561);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).x;
    float3 _4723 = float3(_1577, _1579, _1561);
    float4 _1592 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4723, float3(0.0), isnan(_4723)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4723, float3(0.0), isnan(_4723)), level(0.0)).xyzw;
    float _1594 = _1592.x;
    float _1596 = _1592.y;
    float _1598 = _1592.z;
    float _1600 = _1592.w;
    float2 _4740 = float2(_1587, _1581);
    float3 _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4740, float2(0.0), isnan(_4740)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4740, float2(0.0), isnan(_4740)), level(0.0)).xyz;
    float _1606 = _1604.x;
    float _1608 = _1604.y;
    float _1610 = _1604.z;
    float _1612 = float(uint(_517));
    float _1614 = trunc(_687);
    int _1616 = int(_1614);
    int _1618 = ~_517;
    int _1620 = _1618 + 1;
    float _1622 = _1493 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1624 = ~_517;
    int _1626 = _1624 + 1;
    float _1628 = -_637;
    float _1630 = _1628 + 1.0;
    float _1632 = -_671;
    float _1634 = _1632 + 1.0;
    float _1636 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1622);
    float _1638 = 1.0 / _1612;
    float _1640 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1636);
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1644 = _1642 != 0;
    float _1646 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1648 = float(uint(_1616));
    float _1650 = 1.0 / _387;
    float _1652 = float(_1616);
    bool _1654 = !_1644;
    float _1656 = _1654 ? 7.345489978790283203125 : 1.0;
    int _1658 = as_type<int>(_1638) + (-2);
    bool _1660 = _1652 >= _693;
    bool _1662 = isnan(_1652);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_693);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = _1656 * _143;
    float _1674 = as_type<float>(_1658) * _1648;
    float _1676 = trunc(_1670);
    int _1678 = int(_1676);
    float _1680 = _703 * _1650;
    float _1682 = trunc(_1674);
    float _1684 = precise::max(_1682, 0.0);
    uint _1687 = uint(_1684);
    float _1689 = trunc(_1680);
    int _1691 = int(_1689);
    int _1693 = _1620 * int(_1687);
    int _1695 = _1693 + _1616;
    float _1697 = float(uint(_1695));
    float _1699 = as_type<float>(_1658) * _1697;
    float _1701 = floor(_1672);
    float _1703 = trunc(_1699);
    float _1705 = precise::max(_1703, 0.0);
    uint _1707 = uint(_1705);
    float _1709 = -_1701;
    float _1711 = _1672 + _1709;
    int _1713 = _517 + (-1);
    int _1715 = int(_1687) + int(_1707);
    int _1717 = _1626 * _1715;
    int _1719 = _1717 + _1616;
    bool _1721 = uint(_1719) >= uint(_517);
    bool _1723 = !_1721;
    int _1725 = _1723 ? 0 : (-1);
    bool _1727 = _517 == 0;
    int _1729 = ~_1715;
    int _1731 = _1729 + _1725;
    int _1733 = _1731 + 1;
    float _1735 = _1711 * _693;
    int _1737 = _517 * _1733;
    int _1739 = _1737 + _1616;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1743 = _1741 != 0;
    float _1745 = trunc(_1735);
    int _1747 = int(_1745);
    int _1749 = ~_1678;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    bool _1755 = !_1727;
    int _1757 = _1755 ? _1739 : (-1);
    bool _1759 = !_1743;
    int _1761 = _1759 ? 0 : 1;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1765 = _1763 != 0;
    int _1767 = _1757 * _1753;
    int _1769 = abs(_1761);
    int _1771 = abs(_481);
    int _1773 = _1678 * _1713;
    int _1775 = _1773 + _1767;
    int _1777 = abs(_509);
    int _1779 = _1775 * _1771;
    bool _1781 = !_1765;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = abs(_513);
    int _1787 = _1747 * _1769;
    int _1789 = _1787 + _1616;
    int _1791 = abs(_1783);
    int _1793 = _1691 * _1777;
    int _1795 = _1793 + _1779;
    int _1797 = ~_517;
    int _1799 = _1797 + 1;
    int _1801 = ~_517;
    int _1803 = _1801 + 1;
    int _1805 = _1789 * _1785;
    int _1807 = _1805 + _1795;
    int _1809 = ~_517;
    int _1811 = _1809 + 1;
    int _1813 = _1747 * _1791;
    int _1815 = _1813 + _1807;
    float _1817 = float(uint(_1815));
    float _1819 = as_type<float>(_1658) * _1817;
    float _1821 = trunc(_1819);
    float _1823 = precise::max(_1821, 0.0);
    uint _1825 = uint(_1823);
    int _1827 = _1799 * int(_1825);
    int _1829 = _1827 + _1815;
    float _1831 = float(uint(_1829));
    float _1833 = as_type<float>(_1658) * _1831;
    float _1835 = trunc(_1833);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = int(_1825) + int(_1839);
    float _1843 = float(uint(_1789));
    int _1845 = _1803 * _1841;
    int _1847 = _1845 + _1815;
    float _1849 = as_type<float>(_1658) * _1843;
    bool _1851 = uint(_1847) >= uint(_517);
    float _1853 = trunc(_1849);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    bool _1859 = !_1851;
    int _1861 = _1859 ? 0 : (-1);
    int _1863 = ~_1841;
    int _1865 = _1863 + _1861;
    int _1867 = _1865 + 1;
    int _1869 = _517 * _1867;
    int _1871 = _1869 + _1815;
    int _1873 = _1803 * int(_1857);
    int _1875 = _1873 + _1789;
    bool _1877 = !_1727;
    int _1879 = _1877 ? _1871 : (-1);
    int _1881 = _1879 >> 31;
    float _1883 = float(uint(_1875));
    int _1885 = _1881 & 3;
    int _1887 = _1879 & 3;
    bool _1889 = _1887 != 0;
    float _1891 = as_type<float>(_1658) * _1883;
    int _1893 = _1879 + _1885;
    int _1895 = _1879 & 3;
    bool _1897 = _1895 != 0;
    float _1899 = trunc(_1891);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = _1893 >> 2;
    bool _1907 = uint(_1895) > 1u;
    int _1909 = _1905 << 4;
    int _1911 = _1909 + 368;
    int _1913 = _1889 ? 0 : 1;
    uint _1915 = uint(int(uint(_1911) >> uint(2)));
    uint _1917 = uint(int(uint(int(_1915)) >> uint(2)));
    int _1919 = int(_1915) & 3;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[int(_1917)][_1919];
    int _1923 = int(_1915) + 1;
    uint _1925 = uint(int(uint(_1923) >> uint(2)));
    int _1927 = _1923 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[int(_1925)][_1927];
    bool _1931 = _1895 != 3;
    int _1933 = ~_1913;
    int _1935 = _1933 + 1;
    int _1937 = _1935 + 1;
    int _1939 = _1937;
    if (!_1907)
    {
        int _1941 = ~_1913;
        int _1943 = _1941 + 1;
        _1939 = _1943;
    }
    int _1945 = _1939;
    int _1947 = _1911 + 8;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    uint _1951 = uint(int(uint(int(_1949)) >> uint(2)));
    int _1953 = int(_1949) & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = int(_1949) + 1;
    uint _1959 = uint(int(uint(_1957) >> uint(2)));
    int _1961 = _1957 & 3;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[int(_1959)][_1961];
    int _1965 = int(_1857) + int(_1903);
    int _1967 = abs(_1945);
    bool _1969 = uint(_1895) >= 2u;
    int _1971 = _1811 * _1965;
    int _1973 = _1971 + _1789;
    int _1975 = ~_1967;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    int _1981 = _1969 ? 0 : 1;
    bool _1983 = !_1897;
    int _1985 = _1983 ? 0 : 1;
    bool _1987 = _1895 != 3;
    int _1989 = ~_1981;
    int _1991 = _1989 + 1;
    int _1993 = _1991 + 1;
    int _1995 = abs(_1985);
    int _1997 = _1993;
    if (_1931)
    {
        int _1999 = ~_1981;
        int _2001 = _1999 + 1;
        _1997 = _2001;
    }
    int _2003 = _1997;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2007 = _2005 != 0;
    bool _2009 = !_1987;
    int _2011 = _2009 ? 0 : (-1);
    int _2013 = ~_1995;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = abs(_2003);
    bool _2021 = !_2007;
    int _2023 = _2021 ? 0 : 1;
    int _2025 = abs(_2011);
    int _2027 = ~_2019;
    int _2029 = _2027 + 1;
    int _2031 = _2029 + 1;
    bool _2033 = uint(_1973) >= uint(_517);
    bool _2035 = _143 > 0.5;
    bool _2037 = !_2033;
    int _2039 = _2037 ? 0 : (-1);
    int _2041 = _1979 * as_type<int>(_1929);
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2045 = _2043 != 0;
    float _2047 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2049 = int(_2047);
    int _2051 = ~_1965;
    int _2053 = _2051 + _2039;
    int _2055 = _2053 + 1;
    int _2057 = _2017 * as_type<int>(_1921);
    int _2059 = _2057 + _2041;
    int _2061 = abs(_2023);
    int _2063 = _2031 * as_type<int>(_1955);
    int _2065 = _2063 + _2059;
    int _2067 = _517 * _2055;
    int _2069 = _2067 + _1789;
    int _2071 = ~_2025;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = ~_2061;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    bool _2083 = !_1727;
    int _2085 = _2083 ? _2069 : (-1);
    int _2087 = _2075 * as_type<int>(_1963);
    int _2089 = _2087 + _2065;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2093 = _2091 != 0;
    float _2095 = float(uint(_2049));
    int _2097 = _2089 * _2081;
    int _2099 = abs(_2049);
    int _2101 = ~_2049;
    int _2103 = _2101 + 1;
    int _2105 = _2085 * _2061;
    int _2107 = _2105 + _2097;
    float _2109 = 1.0 / _2095;
    bool _2111 = _389 > 0.5;
    float _2113 = float(uint(_2099));
    float _2115 = float(uint(_2107));
    int _2117 = abs(_2107);
    float _2119 = 1.0 / _2113;
    int _2121 = ~_2099;
    int _2123 = _2121 + 1;
    float _2125 = float(uint(_2117));
    int _2127 = as_type<int>(_2109) + (-2);
    int _2129 = ~_2099;
    int _2131 = _2129 + 1;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2135 = as_type<float>(_2127) * _2115;
    float _2137 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2139 = as_type<int>(_2119) + (-2);
    float _2141 = trunc(_2135);
    float _2143 = precise::max(_2141, 0.0);
    uint _2145 = uint(_2143);
    int _2147 = ~_2049;
    int _2149 = _2147 + 1;
    float _2151 = as_type<float>(_2139) * _2125;
    float _2153 = trunc(_2151);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    int _2159 = _2149 * int(_2145);
    int _2161 = _2159 + _2107;
    float _2163 = float(uint(_2161));
    int _2165 = _2131 * int(_2157);
    int _2167 = _2165 + _2117;
    float _2169 = as_type<float>(_2127) * _2163;
    float _2171 = trunc(_2169);
    float _2173 = precise::max(_2171, 0.0);
    uint _2175 = uint(_2173);
    float _2177 = float(uint(_2167));
    float _2179 = as_type<float>(_2139) * _2177;
    float _2181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2183 = trunc(_2179);
    float _2185 = precise::max(_2183, 0.0);
    uint _2187 = uint(_2185);
    int _2189 = int(_2145) + int(_2175);
    int _2191 = _2103 * _2189;
    int _2193 = _2191 + _2107;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2197 = uint(_2193) >= uint(_2049);
    float _2199 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2201 = int(_2157) + int(_2187);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2207 = _2123 * _2201;
    int _2209 = _2207 + _2117;
    bool _2211 = !_2197;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2217 = ~_2189;
    int _2219 = _2217 + _2213;
    int _2221 = _2219 + 1;
    float _2223 = -_869;
    int _2225 = _2035 ? as_type<int>(_2223) : as_type<int>(_869);
    out.m_58.x = _2215;
    out.m_58.y = _2137;
    out.m_58.z = _2203;
    out.m_58.w = _2195;
    bool _2227 = uint(_2209) >= uint(_2099);
    int _2229 = _2049 * _2221;
    int _2231 = _2229 + _2107;
    bool _2233 = !_2045;
    float _2235 = _2233 ? _869 : as_type<float>(_2225);
    bool _2237 = !_2227;
    int _2239 = _2237 ? 0 : (-1);
    bool _2241 = _2049 == 0;
    int _2243 = _2107 ^ _2049;
    bool _2245 = !_2241;
    int _2247 = _2245 ? _2231 : (-1);
    uint _2249 = uint(int(uint(_2243) >> uint(31)));
    float _2251 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2253 = _2049 == 0;
    int _2255 = ~_2239;
    int _2257 = _2201 + _2255;
    int _2259 = _2257 + 1;
    float _2261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2263 = -_861;
    int _2265 = _2111 ? as_type<int>(_2263) : as_type<int>(_861);
    float _2267 = float(_2247);
    int _2269 = ~int(_2249);
    int _2271 = _2269 + 1;
    bool _2273 = !_2093;
    float _2275 = _2273 ? _861 : as_type<float>(_2265);
    float _2277 = fma(_2251, _2267, _633);
    int _2279 = _2259 ^ _2271;
    float _2281 = _2235 + 0.5;
    int _2283 = ~_2271;
    int _2285 = _2283 + _2279;
    int _2287 = _2285 + 1;
    float _2289 = fma(_2251, _2281, _2277);
    float _2291 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = _2261 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2295 = !_2253;
    int _2297 = _2295 ? _2287 : (-1);
    float _2299 = -_1630;
    float _2301 = fma(_2235, _2299, _2289);
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2305 = float(_2297);
    float _2307 = exp2(_2291);
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2313 = -_667;
    float _2315 = fma(_2293, _2305, _2313);
    float _2317 = _2275 + (-0.5);
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2321 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2323 = _1277 > 0.0;
    bool _2325 = isnan(_1277);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan(0.0);
    bool _2331 = _2327 || _2329;
    float _2333 = -_2293;
    float _2335 = fma(_2333, _2317, _2315);
    float _2337 = _1646 + _1525;
    float _2339 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2341 = _2337 * 0.5;
    float _2343 = -_2307;
    float _2345 = _2343 + 1.0;
    out.m_60.x = _2311;
    out.m_60.y = _2321;
    out.m_60.z = _2339;
    float _2347 = fma(_2275, _1634, _2335);
    float _2349 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1569;
    out.gl_Position.y = _1571;
    out.gl_Position.z = _1646;
    out.gl_Position.w = _1525;
    float _2353 = _2351 * _1589;
    out.m_62.z = _2341;
    out.m_62.w = _1525;
    float _2355 = _1610 * _2353;
    float _2357 = _1600 * _2353;
    float _2359 = -_2351;
    float _2361 = _2359 + 1.0;
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2301;
    out.m_64.y = _2347;
    float _2365 = fma(_1606, _2357, _1594);
    float _2367 = fma(_1608, _2357, _1596);
    float _2369 = _1600 * _2361;
    float _2371 = fma(_1600, _2355, _1598);
    out.m_45.x = _2363;
    out.m_66.x = _2365;
    out.m_66.y = _2367;
    out.m_66.z = _2371;
    out.m_66.w = _2369;
    if (_2331)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

