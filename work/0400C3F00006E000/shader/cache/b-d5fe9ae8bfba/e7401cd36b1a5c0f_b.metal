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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2649 = false;
    bool _2431 = false;
    bool _1324 = false;
    bool _1312 = false;
    bool _441 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2954 = as_type<float>(_121);
        out.gl_Position.z = _2954;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3024 = as_type<float>(_159);
        out.gl_Position.z = _3024;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_53.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = _165 * _163;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _187);
    int _197 = as_type<int>(_167) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_167) & 2;
    bool _203 = _201 != 0;
    float _205 = _195 * 6.283185482025146484375;
    int _207 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _209 = _207 != 0;
    float _211 = floor(_195);
    float _213 = _205 * 0.15915493667125701904296875;
    bool _215 = !_209;
    int _217 = _215 ? 0 : 1;
    bool _219 = !_203;
    int _221 = _219 ? (-1090519040) : 1056964608;
    float _223 = _171 * _177;
    int _225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _227 = _225 != 0;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _231 = _229 != 0;
    float _233 = _213 * 6.283185482025146484375;
    float _235 = cos(_233);
    float _237 = _171 * _183;
    bool _239 = !_199;
    int _241 = _239 ? (-1090519040) : 1056964608;
    float _243 = fma(_169, _175, _223);
    bool _245 = !_227;
    int _247 = _245 ? 0 : 1;
    float _249 = _171 * _191;
    float _251 = fma(_169, _181, _237);
    out.m_66.x = as_type<float>(_241);
    out.m_66.y = as_type<float>(_221);
    int _253 = abs(_247);
    float _255 = fma(_169, _189, _249);
    int _257 = abs(_217);
    float _259 = -_211;
    float _261 = _195 + _259;
    bool _263 = !_231;
    int _265 = _263 ? 0 : 1;
    float _267 = -_261;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_253);
    float _273 = fma(_235, 0.5, 0.5);
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _277 = abs(_265);
    float _279 = abs(_269);
    float _281 = _271 * _279;
    bool _283 = _261 < 0.5;
    float _285 = float(_283);
    float _287 = -_273;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _291 = float(_257);
    float _293 = -_285;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = fma(_291, _289, _281);
    float _299 = float(_277);
    float _301 = fma(_173, _179, _243);
    float _303 = fma(_173, _185, _251);
    float _305 = fma(_173, _193, _255);
    float _307 = abs(_295);
    float _309 = fma(_299, _307, _297);
    bool _311 = !_275;
    float _327;
    if (!_311)
    {
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_105);
        float _333 = 1.0 / _331;
        float _335 = _139 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = _337 + _339;
    float _343 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _345 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _347 = isnan(_337);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _357;
    float _361 = _343 * _161;
    float _363 = -_355;
    float _365 = _363 + 1.0;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = 1.0 / _359;
    float _371 = trunc(_361);
    int _373 = int(_371);
    float _375 = _341 * _369;
    bool _377 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_337);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = _387 * _365;
    float _399 = fma(_391, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_395, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -_387;
    float _405 = _403 + 1.0;
    int _407 = _373 << 4;
    int _409 = _407 + 1712;
    float _411 = _399 * _397;
    float _413 = _401 * _397;
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _419 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[144].x, _415);
    float _421 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[144].y, _417);
    bool _423 = !_367;
    float _439;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _161 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_105);
        float _445 = 1.0 / _443;
        float _447 = _139 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_46.x;
    float _453 = in.m_46.y;
    float _455 = in.m_46.z;
    float _457 = _161 * 2.0;
    float _459 = in.m_53.y;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = in.m_53.z;
    float _479 = floor(_457);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = in.m_62.w;
    bool _491 = !_471;
    int _493 = _491 ? 0 : 1;
    float _495 = 1.0 / _463;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _497;
    float _501 = in.m_60.w;
    bool _503 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _511 = _507 || _509;
    int _513 = abs(_493);
    float _515 = in.m_64.w;
    float _517 = _177 * _453;
    float _519 = _183 * _453;
    float _521 = _191 * _453;
    float _523 = 1.0 / _483;
    float _525 = fma(_175, _451, _517);
    float _527 = fma(_181, _451, _519);
    float _529 = fma(_189, _451, _521);
    float _531 = fma(_179, _455, _525);
    float _533 = fma(_185, _455, _527);
    float _535 = _459 * 2.0;
    float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _539 = log2(_537);
    float _541 = _477 * 2.0;
    float _543 = fma(_193, _455, _529);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _553 = _161 + _477;
    bool _555 = _479 > 0.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _449 + _557;
    float _561 = floor(_535);
    float _563 = _551 * _495;
    float _565 = _161 + _459;
    bool _567 = _479 >= 0.0;
    bool _569 = isnan(_479);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _553 + (-1.0);
    float _579 = _565 + (-1.0);
    float _581 = _499 * _523;
    float _583 = _539 * _139;
    float _585 = 1.0 / _487;
    float _587 = _459 + _477;
    float _589 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _591 = _587 + (-1.0);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _595 = _561 >= 0.0;
    bool _597 = isnan(_561);
    bool _599 = _595 || _597;
    bool _601 = isnan(0.0);
    bool _603 = _599 || _601;
    float _605 = floor(_541);
    bool _607 = _561 > 0.0;
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _611 = _575 ? 0 : 1;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _615 = 1.0 + _613;
    int _617 = _603 ? 0 : 1;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _449 + _619;
    float _623 = float(_513);
    float _625 = exp2(_583);
    float _627 = _547 * _585;
    float _629 = fma(_563, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _459 + (-0.5);
    float _633 = _477 + (-0.5);
    float _635 = fma(_627, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _637 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _639 = isnan(_449);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = _605 > 0.0;
    float _651 = 1.0 / _615;
    bool _653 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = isnan(_449);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _605 >= 0.0;
    bool _667 = isnan(_605);
    bool _669 = _665 || _667;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_449);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_663;
    float _689 = _687 + 1.0;
    float _691 = -_625;
    float _693 = _691 + 1.0;
    bool _695 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _697 = isnan(_449);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _533 + _489;
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _711 = _511 ? _693 : 0.0;
    float _713 = _685 * _689;
    float _715 = -_685;
    float _717 = _715 + 1.0;
    bool _719 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _721 = isnan(1.0);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _727 = _723 || _725;
    float _729 = _531 + _501;
    float _731 = _543 + _515;
    float _733 = _705 * _717;
    float _735 = -_705;
    float _737 = _735 + 1.0;
    int _739 = ~_611;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = _707 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _747 = _743;
    if (!_555)
    {
        int _749 = ~_611;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _647 * _737;
    float _757 = _729 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _761 = float(_753);
    float _763 = _635 * _755;
    int _765 = _673 ? 0 : 1;
    if (_727)
    {
        float _767 = _711 * _651;
        _141 = _767;
    }
    float _769 = _141;
    bool _771 = !_467;
    int _773 = _771 ? 0 : 1;
    float _775 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _777 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _779 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _781 = ~_765;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _731 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _789 = abs(_773);
    float _791 = _777 * _161;
    int _793 = _785;
    if (!_649)
    {
        int _795 = ~_765;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _803 = in.m_68.x;
    float _805 = in.m_68.y;
    float _807 = in.m_68.z;
    int _809 = ~_617;
    int _811 = _809 + 1;
    int _813 = _811 + 1;
    float _815 = _161 + (-0.5);
    int _817 = _813;
    if (!_607)
    {
        int _819 = ~_617;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = _623 * _761;
    float _827 = float(_789);
    float _829 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _831 = trunc(_791);
    int _833 = int(_831);
    float _835 = float(_799);
    float _837 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].y, _775);
    float _839 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].x, _829);
    float _841 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].z, _779);
    float _843 = _825 * (-2.0);
    float _845 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].y, _837);
    float _847 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].x, _839);
    float _849 = _827 * _835;
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].z, _841);
    float _853 = _845 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _855 = _847 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _857 = fma(_609, _843, _609);
    float _859 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _861 = _853 * _709;
    float _863 = _849 * (-2.0);
    int _865 = _833 << 4;
    int _867 = _865 + 1968;
    float _869 = fma(_843, _805, _805);
    float _871 = _855 * _759;
    bool _873 = !_475;
    int _875 = _873 ? 0 : 1;
    uint _878 = uint(int(uint(_409) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[int(_880)][_882];
    int _886 = int(_878) + 1;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    int _890 = _886 & 3;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[int(_888)][_890];
    float _894 = _859 * _801;
    float _896 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[196].y, _869);
    int _898 = abs(_875);
    float _900 = fma(_861, 0.5, 0.5);
    float _902 = -_647;
    float _904 = _902 + 1.0;
    float _906 = fma(_589, _863, _589);
    uint _908 = uint(int(uint(_867) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    float _924 = float(_823);
    float _926 = in.m_70.x;
    float _928 = in.m_70.y;
    float _930 = float(_898);
    float _932 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[115].x, _763);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _936 = _449 + _934;
    float _938 = fma(_857, _769, _896);
    float _940 = fma(_871, 0.5, 0.5);
    int _942 = _867 + 8;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[int(_946)][_948];
    float _952 = _930 * _924;
    float _954 = fma(_581, _936, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = fma(_629, _733, _932);
    float _958 = _938 * 0.15915493667125701904296875;
    float _960 = _952 * (-2.0);
    float _962 = floor(_940);
    float _964 = fma(_954, _713, _956);
    int _966 = _409 + 8;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[int(_970)][_972];
    float _976 = fma(_894, 0.5, 0.5);
    bool _978 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _980 = isnan(1.0);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _986 = _982 || _984;
    float _988 = floor(_900);
    float _990 = fma(_863, _803, _803);
    float _992 = _419 * _926;
    float _994 = _421 * _928;
    float _996 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _998 = fma(_960, _807, _807);
    float _1000 = _958 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_221));
    float _1006 = fma(_906, _769, _996);
    float _1008 = fma(_593, _960, _593);
    float _1010 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].z, _998);
    float _1012 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[118].x, _964);
    float _1014 = _1006 * 0.15915493667125701904296875;
    float _1016 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = fma(_1008, _769, _1010);
    float _1020 = _958 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _884 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1026 = _892 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1028 = _1018 * 0.15915493667125701904296875;
    float _1030 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1036 = _1014 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _914 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1042 = _922 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1046 = -_988;
    float _1048 = _900 + _1046;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = as_type<float>(_221) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1056 = _1014 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1062 = -_962;
    float _1064 = _940 + _1062;
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1028 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1074 = _1016 * _1004;
    float _1076 = _1038 * _1022;
    float _1078 = _1038 * _1002;
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _1050;
    out.m_72.y = _1052;
    out.m_72.z = _1066;
    out.m_72.w = _1044;
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_241));
    float _1084 = _1028 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _1058 * _1022;
    out.m_74.x = _1030;
    out.m_74.y = _1032;
    out.m_74.z = _1080;
    out.m_74.w = _1034;
    float _1090 = as_type<float>(_241) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1092 = _1022 * _1070;
    float _1094 = _1058 * _1002;
    float _1096 = _1058 * _1070;
    float _1098 = _1038 * _1070;
    float _1100 = _1002 * _1070;
    float _1102 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1106 = floor(_976);
    float _1108 = fma(_1086, _1088, _1078);
    float _1110 = fma(_1086, _1078, _1088);
    float _1112 = -_1094;
    float _1114 = fma(_1086, _1076, _1112);
    float _1116 = -_1076;
    float _1118 = fma(_1086, _1094, _1116);
    float _1120 = fma(_1048, 2.0, -1.0);
    float _1122 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1124 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1126 = -_1086;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1104);
    float _1130 = _1102 * _1082;
    float _1132 = -_1074;
    float _1134 = _1086 * _1132;
    float _1136 = fma(_1064, 2.0, -1.0);
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1140 = -_1086;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1122);
    float _1144 = -_1086;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    float _1148 = _1096 * _1074;
    float _1150 = fma(_1092, _1130, _1134);
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1154 = _1098 * _1074;
    float _1156 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1158 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1160 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1162 = fma(_1108, _1130, _1148);
    float _1164 = fma(_1114, _1130, _1154);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1156);
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1158);
    float _1170 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1160);
    float _1172 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1174 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1178 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1182 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1184 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1176);
    float _1186 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1188 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1172);
    float _1190 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1142);
    float _1194 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    float _1196 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1198 = fma(_1100, _1186, _1150);
    float _1200 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1202 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1180);
    float _1204 = _1054 * _1182;
    float _1206 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1188);
    float _1208 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1190);
    float _1210 = _1054 * _1194;
    float _1212 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1184);
    float _1214 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1196);
    float _1216 = _1054 * _1192;
    float _1218 = fma(_1090, _1206, _1204);
    float _1220 = fma(_1118, _1186, _1162);
    float _1222 = fma(_1090, _1212, _1210);
    float _1224 = fma(_1090, _1208, _1216);
    float _1226 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1200);
    float _1228 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1202);
    float _1230 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1214);
    float _1232 = fma(_1110, _1186, _1164);
    float _1234 = _1226 + _1218;
    float _1236 = _1228 + _1224;
    float _1238 = _1230 + _1222;
    float _1240 = -_1106;
    float _1242 = _976 + _1240;
    float _1244 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1246 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_76.x = _1234;
    out.m_76.y = _1236;
    out.m_76.z = _1238;
    float _1250 = fma(_1242, 2.0, -1.0);
    float _1252 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1244);
    float _1254 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1256 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1260 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1252);
    float _1262 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1254);
    float _1264 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1256);
    float _1266 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1166);
    float _1268 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1168);
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1170);
    float _1272 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1280 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1282 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1284 = _1272 + _1274;
    float _1286 = _1280 + _1276;
    float _1288 = _1282 + _1278;
    float _1290 = _1184;
    float _1292 = _1268;
    float _1294 = _1054;
    float _1296 = _1270;
    float _1298 = _1268;
    float _1300 = _1120;
    float _1302 = _1250;
    float _1304 = _1136;
    float _1306 = _1226;
    float _1316;
    float _1318;
    float _1320;
    float _1322;
    if (!_986)
    {
        bool _1308 = _1276 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1310 = !_1308;
        _1312 = _1310;
        if (!_1312)
        {
            float _1314 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1316 = _1314;
            _1318 = 0.0;
            _1320 = 0.0;
            _1322 = 0.0;
            _1324 = true;
        }
    }
    if ((!_1324) || _1312)
    {
        bool _1362;
        if (!_1312)
        {
            bool _1326 = _1276 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1328 = isnan(_1276);
            bool _1330 = _1326 || _1328;
            bool _1332 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1334 = _1330 || _1332;
            bool _1336 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1338 = !_1334;
            bool _1340 = _1336 && _1338;
            bool _1342 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1344 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1340)
            {
                _1290 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1346 = _1290;
            float _1348 = _1346;
            if (_1340)
            {
                _1292 = 0.0;
            }
            float _1350 = _1292;
            _1298 = _1350;
            _1318 = _1350;
            if (_1340)
            {
                _1294 = 0.0;
            }
            float _1352 = _1294;
            _1320 = _1352;
            if (_1340)
            {
                float _1354 = _1346 * 5.0;
                _1348 = _1354;
            }
            float _1356 = _1348;
            _1316 = _1356;
            if (_1340)
            {
                _1344 = 0.0;
            }
            float _1358 = _1344;
            bool _1360 = !_1334;
            _1362 = _1360 && _1342;
            _1296 = _1358;
            _1322 = _1358;
        }
        if ((!_1362) || _1312)
        {
            _1312 = false;
            float _1364 = _1296;
            float _1366 = _1298;
            bool _1368 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1370 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1372 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1374 = _1282;
            float _1376 = _1364;
            float _1378 = _1366;
            _1316 = _1288;
            _1320 = _1286;
            if (_1368)
            {
                float _1380 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1374 = _1380;
            }
            float _1382 = _1374;
            if (_1368)
            {
                float _1384 = abs(_1136);
                float _1386 = -_1384;
                float _1388 = _1386 + 1.0;
                _1376 = _1388;
            }
            float _1390 = _1376;
            float _1392 = _1390;
            if (_1370)
            {
                float _1394 = abs(_1120);
                float _1396 = -_1394;
                float _1398 = _1396 + 1.0;
                _1300 = _1398;
            }
            float _1400 = _1300;
            if (!_1368)
            {
                _1378 = 1.0;
            }
            float _1402 = _1378;
            float _1404 = _1402;
            if (_1372)
            {
                float _1406 = abs(_1250);
                float _1408 = -_1406;
                float _1410 = _1408 + 1.0;
                _1302 = _1410;
            }
            float _1412 = _1302;
            if (!_1370)
            {
                _1304 = 1.0;
            }
            float _1414 = _1304;
            float _1416 = _1272;
            float _1418 = _1414;
            if (_1370)
            {
                float _1420 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1416 = _1420;
            }
            float _1422 = _1416;
            float _1424 = _1280;
            if (_1372)
            {
                float _1426 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1424 = _1426;
            }
            float _1428 = _1424;
            if (_1368)
            {
                float _1430 = _1390 * _1382;
                float _1432 = precise::clamp(_1430, 0.0, 1.0);
                _1404 = _1432;
            }
            float _1434 = _1404;
            if (!_1372)
            {
                _1392 = 1.0;
            }
            float _1436 = _1392;
            float _1438 = _1436;
            if (_1370)
            {
                float _1440 = _1400 * _1422;
                float _1442 = precise::clamp(_1440, 0.0, 1.0);
                _1418 = _1442;
            }
            float _1444 = _1418;
            float _1446 = _1434 * _1444;
            _1318 = _1284;
            if (_1372)
            {
                float _1448 = _1412 * _1428;
                float _1450 = precise::clamp(_1448, 0.0, 1.0);
                _1438 = _1450;
            }
            float _1452 = _1438;
            float _1454 = _1446 * _1452;
            _1322 = _1454;
        }
    }
    _1324 = false;
    float _1456 = _1316;
    float _1458 = _1318;
    float _1460 = _1320;
    float _1462 = _1322;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1466 = _1456 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1458 + _1468;
    float _1472 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1474 = _1466 * _1466;
    float _1476 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1472);
    float _1478 = fma(_1470, _1470, _1474);
    float _1480 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1476);
    float _1482 = sqrt(_1478);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1486 = !_1484;
    float _1488 = _1460;
    float _1490 = _1458;
    float _1492 = _1456;
    if (!_1486)
    {
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1498 = _1482 + _1496;
        float _1500 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1502 = rsqrt(_1478);
        float _1504 = _1498 * _1494;
        float _1506 = _1504 * 0.15915493667125701904296875;
        float _1508 = _1506 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1506 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = _1510 + (-1.0);
        float _1518 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1520 = fma(_1514, _1500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = fma(_1510, _1460, _1518);
        float _1524 = _1502 * _1520;
        float _1526 = fma(_1470, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1528 = fma(_1466, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1488 = _1522;
        _1490 = _1526;
        _1492 = _1528;
    }
    float _1530 = _1488;
    float _1532 = _1490;
    float _1534 = _1492;
    float _1536 = -_1276;
    float _1538 = _1536 + _1530;
    float _1540 = -_1274;
    float _1542 = _1540 + _1532;
    float _1544 = -_1278;
    float _1546 = _1544 + _1534;
    float _1548 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1550 = _1538 * _1538;
    float _1552 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1554 = 1.0 / _1548;
    float _1556 = fma(_1542, _1542, _1550);
    float _1558 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1552);
    bool _1560 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1562 = isnan(0.5);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1568 = _1564 || _1566;
    float _1570 = fma(_1546, _1546, _1556);
    float _1572 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1558);
    bool _1574 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1576 = isnan(0.5);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1582 = _1578 || _1580;
    float _1584 = sqrt(_1570);
    float _1586 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1588 = _1586 + _1548;
    float _1590 = _1588 * _1554;
    float _1592 = _1590 * 0.5;
    bool _1594 = _1584 > 0.0;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1598 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1596);
    float _1600 = 1.0 / _1598;
    bool _1602 = !_1594;
    float _1604 = _1532;
    float _1606 = _1530;
    float _1608 = _1534;
    float _1610 = _1548;
    float _1612 = _1538;
    float _1614 = _1542;
    if (!_1602)
    {
        float _1616 = _303 * _303;
        float _1618 = rsqrt(_1570);
        float _1620 = fma(_301, _301, _1616);
        float _1622 = fma(_305, _305, _1620);
        float _1624 = sqrt(_1622);
        float _1626 = _1542 * _1618;
        float _1628 = _1538 * _1618;
        float _1630 = _1546 * _1618;
        bool _1632 = _1624 > 0.0;
        bool _1634 = !_1632;
        _1610 = _1628;
        if (!_1634)
        {
            float _1636 = rsqrt(_1622);
            float _1638 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1640 = _303 * _1636;
            float _1642 = _301 * _1636;
            float _1644 = _1628 * _1640;
            float _1646 = _305 * _1636;
            float _1648 = fma(_1626, _1642, _1644);
            float _1650 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1652 = fma(_1630, _1646, _1648);
            float _1654 = _1652 * _1650;
            float _1656 = fma(_301, _1654, _1532);
            float _1658 = fma(_303, _1654, _1530);
            float _1660 = fma(_305, _1654, _1534);
            _1604 = _1656;
            _1606 = _1658;
            _1608 = _1660;
            _1610 = _1648;
        }
    }
    float _1662 = _1604;
    float _1664 = _1606;
    float _1666 = _1608;
    float _1668 = _1610;
    float _1670 = _1668;
    float _1672 = _1664;
    float _1674 = _1666;
    if (_1582)
    {
        _1612 = 1.0;
    }
    float _1676 = _1612;
    float _1678 = _1676;
    if (_1568)
    {
        _1614 = _1662;
    }
    float _1680 = _1614;
    float _1682 = _1680;
    if (!_1568)
    {
        float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1686 = _1276 + _1684;
        float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1690 = _1274 + _1688;
        float _1692 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1694 = -_1274;
        float _1696 = _1694 + _1662;
        float _1698 = _1686 * _1686;
        float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1702 = _1278 + _1700;
        float _1704 = fma(_1690, _1690, _1698);
        float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1708 = fma(_1702, _1702, _1704);
        float _1710 = sqrt(_1708);
        float _1712 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1714 = precise::min(_1710, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1716 = _1714 * _1706;
        float _1718 = _1712 * _1716;
        float _1720 = -_1276;
        float _1722 = _1720 + _1664;
        float _1724 = -_1278;
        float _1726 = _1724 + _1666;
        float _1728 = fma(_1696, _1718, _1274);
        float _1730 = fma(_1722, _1718, _1276);
        float _1732 = fma(_1726, _1718, _1278);
        _1670 = _1722;
        _1672 = _1730;
        _1682 = _1728;
        _1674 = _1732;
    }
    float _1734 = _1670;
    float _1736 = _1672;
    float _1738 = _1682;
    float _1740 = _1674;
    float _1742 = _1734;
    if (_1582)
    {
        _1306 = 1.0;
    }
    float _1744 = _1306;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1748 = _1600 * _1746;
    float _1750 = _1744;
    if (!_1582)
    {
        float _1752 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1754 = _1752 * 0.15915493667125701904296875;
        float _1756 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1758 = _1754 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1756 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1760;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = _1762 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1772 * _1774;
        float _1782 = 1.0 / _1780;
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1786 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1784;
        float _1788 = 1.0 / _1786;
        float _1790 = _1778 * _1782;
        float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1794 = fma(_1748, _1790, _1792);
        float _1796 = _1794 * _1788;
        float _1798 = precise::clamp(_1796, 0.0, 1.0);
        _1742 = _1794;
        _1678 = _1798;
    }
    float _1800 = _1742;
    float _1802 = _1678;
    float _1804 = _1800;
    if (!_1582)
    {
        float _1806 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1812 = _1808 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1810 * 0.15915493667125701904296875;
        float _1818 = _1808 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = 1.0 / _1814;
        float _1824 = _1816 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        float _1828 = _1820 * _1822;
        float _1830 = _1816 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        float _1834 = _1826 * _1828;
        float _1836 = 1.0 / _1834;
        float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1840 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1838;
        float _1842 = 1.0 / _1840;
        float _1844 = _1832 * _1836;
        float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1848 = fma(_1748, _1844, _1846);
        float _1850 = _1848 * _1842;
        float _1852 = precise::clamp(_1850, 0.0, 1.0);
        float _1854 = -_1852;
        float _1856 = _1854 + 1.0;
        _1804 = _1822;
        _1750 = _1856;
    }
    float _1858 = _1804;
    float _1860 = _1750;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1864 = _1736 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1868 = _1738 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1872 = _1740 + _1870;
    float _1874 = _1864 * _1864;
    float _1876 = fma(_1868, _1868, _1874);
    float _1878 = fma(_1872, _1872, _1876);
    float _1880 = rsqrt(_1878);
    float _1882 = sqrt(_1878);
    float _1884 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1886 = _1868 * _1884;
    float _1888 = _1872 * _1884;
    float _1890 = _1886 * _1886;
    float _1892 = _1888 * _1888;
    float _1894 = _1890 + _1892;
    float _1896 = sqrt(_1894);
    bool _1898 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1896 + _1900;
    float _1904 = _1872;
    float _1906 = _1894;
    float _1908 = _1902;
    float _1910 = _1858;
    float _1912 = _1884;
    if (_1898)
    {
        float _1914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1904 = _1914;
    }
    float _1916 = _1904;
    if (_1898)
    {
        float _1918 = rsqrt(_1894);
        _1906 = _1918;
    }
    float _1920 = _1906;
    if (_1898)
    {
        float _1922 = _1902 * _1916;
        _1908 = _1922;
    }
    float _1924 = _1908;
    if (_1898)
    {
        float _1926 = _1924 * 0.15915493667125701904296875;
        _1910 = _1926;
    }
    float _1928 = _1910;
    float _1930 = _1874;
    float _1932 = _1928;
    if (_1898)
    {
        float _1934 = _1928 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1930 = _1936;
    }
    float _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1880;
    float _1946 = _1942;
    float _1948 = _1940;
    if (_1898)
    {
        float _1950 = _1928 * 6.283185482025146484375;
        float _1952 = cos(_1950);
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = -_1884;
    float _1958 = -_1942;
    float _1960 = fma(_1864, _1956, _1958);
    float _1962 = _1960;
    if (!_1898)
    {
        _1946 = _1886;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (_1898)
    {
        float _1968 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1948 = _1968;
    }
    float _1970 = _1948;
    float _1972 = _1938;
    float _1974 = _1970;
    if (_1898)
    {
        float _1976 = fma(_1938, _1970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = _1978;
    float _1982 = _1954;
    if (_1898)
    {
        float _1984 = _1954 + (-1.0);
        _1974 = _1984;
    }
    float _1986 = _1974;
    float _1988 = _1986;
    if (_1898)
    {
        float _1990 = _1920 * _1978;
        _1912 = _1990;
    }
    float _1992 = _1912;
    if (!_1898)
    {
        _1980 = _1890;
    }
    float _1994 = _1980;
    float _1996 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1998 = _1994;
    if (_1898)
    {
        float _2000 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _2000;
    }
    float _2002 = _1932;
    if (_1898)
    {
        float _2004 = _1886 * _1992;
        _1966 = _2004;
    }
    float _2006 = _1966;
    if (!_1898)
    {
        _1988 = _1888;
    }
    float _2008 = _1988;
    float _2010 = _2008;
    if (_1898)
    {
        float _2012 = _1888 * _1992;
        _2010 = _2012;
    }
    float _2014 = _2010;
    if (_1898)
    {
        float _2016 = fma(_1960, _1954, _2002);
        _1962 = _2016;
    }
    float _2018 = _1962;
    if (_1898)
    {
        float _2020 = _2006 * _2006;
        _1998 = _2020;
    }
    float _2022 = _1998;
    if (!_1898)
    {
        _1982 = _1892;
    }
    float _2024 = _1982;
    float _2026 = _2024;
    if (_1898)
    {
        float _2028 = _2014 * _2014;
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = fma(_2018, _2018, _2022);
    float _2034 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2036 = _2032 + _2030;
    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2040 = fma(_1882, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2038);
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1996);
    float _2046 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2048 = rsqrt(_2036);
    float _2050 = -_2042;
    float _2052 = _2050 + 1.0;
    float _2054 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2044);
    float _2056 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2058 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2046);
    float _2060 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2056);
    float _2066 = abs(_2052);
    float _2068 = log2(_2066);
    float _2070 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2058);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2074 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2076 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2060);
    float _2078 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2080 = -_2072;
    float _2082 = fma(_2080, _2034, 1.0);
    float _2084 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2086 = _2048 * _2006;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2090 = _2048 * _2018;
    float _2092 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2094 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2096 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2088);
    float _2098 = _2048 * _2014;
    float _2100 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2102 = -_2094;
    float _2104 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2102);
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2110 = log2(_2082);
    float _2112 = -_2098;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2104);
    float _2116 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2118 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2108);
    float _2120 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2122 = fma(_2114, -0.5, 0.5);
    float _2124 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2116);
    float _2126 = fma(_2114, 0.5, 0.5);
    float _2128 = exp2(_2106);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2120);
    float _2132 = _2090 + 1.0;
    float _2134 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2124);
    float _2136 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2130);
    float _2138 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2134);
    float _2140 = 1.0 / _2118;
    float _2142 = fma(_2126, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2144 = _2110 * 0.693147182464599609375;
    float _2146 = fma(_2126, _2142, -0.212114393711090087890625);
    float _2148 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = sqrt(_2122);
    float _2152 = -_2090;
    float _2154 = fma(_2128, _2132, _2152);
    float _2156 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2136);
    float _2158 = fma(_2126, _2146, 1.570728778839111328125);
    float _2160 = _2138 * _2140;
    float _2162 = _2156 * _2140;
    float _2164 = fma(_2160, 0.5, 0.5);
    float _2166 = fma(_2162, -0.5, 0.5);
    float _2168 = _2150 * 0.636619746685028076171875;
    float3 _6153 = float3(_2164, _2166, _2148);
    float _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6153, float3(0.0), isnan(_6153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6153, float3(0.0), isnan(_6153)), level(0.0)).x;
    float _2172 = -_2158;
    float _2174 = fma(_2168, _2172, 1.0);
    float _2176 = fma(_2154, 0.5, 0.5);
    float3 _6171 = float3(_2164, _2166, _2148);
    float4 _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _2181 = _2179.x;
    float _2183 = _2179.y;
    float _2185 = _2179.z;
    float _2187 = _2179.w;
    float2 _6188 = float2(_2174, _2176);
    float3 _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _2193 = _2191.x;
    float _2195 = _2191.y;
    float _2197 = _2191.z;
    float _2199 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2201 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2203 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2205 = -_303;
    float _2207 = _2205 + _1736;
    float _2209 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2199);
    float _2211 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2201);
    float _2213 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2203);
    float _2215 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2217 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2209);
    float _2219 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2211);
    float _2221 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2213);
    float _2223 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2215);
    float _2225 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2227 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2229 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2231 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2223);
    float _2233 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2237 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2239 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2241 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2233);
    float _2243 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2235);
    float _2245 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2249 = _2237 + _2241;
    float _2251 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2243);
    float _2253 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2255 = -_305;
    float _2257 = _2255 + _1740;
    float _2259 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2249);
    float _2261 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2263 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2265 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2267 = exp2(_2253);
    float _2269 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2261);
    float _2271 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2251);
    float _2273 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2275 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2265);
    float _2277 = _2247 + _2269;
    float _2279 = -_301;
    float _2281 = _2279 + _1738;
    float _2283 = _1802 * _1860;
    float _2285 = 1.0 / _2259;
    float _2287 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2289 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2273);
    float _2291 = _2283 * _1462;
    out.m_78.y = 1.0;
    float _2293 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2275);
    float _2295 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2289);
    float _2297 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2299 = _2287 + _2263;
    float _2301 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2303 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2305 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2297);
    float _2307 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2309 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2299);
    float _2311 = -_2267;
    float _2313 = _2311 + 1.0;
    float _2315 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2305);
    float _2317 = 1.0 / _2303;
    float _2319 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2307);
    float _2321 = _2301 * _2285;
    float _2323 = _2271 * _2285;
    float _2325 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2293);
    float _2327 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2319);
    float _2329 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2331 = _2291 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2333 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2335 = _2323 > 0.0;
    float _2337 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _2339 = _309 * _2331;
    out.gl_Position.x = _2138;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2325;
    out.gl_Position.w = _2118;
    bool _2341 = _2323 < 1.0;
    bool _2343 = _2341 && _2335;
    float _2345 = _2325 + _2118;
    float _2347 = _2333 * _2317;
    bool _2349 = _2160 > (-1.0);
    bool _2351 = _2349 && _2343;
    float _2353 = _2345 * 0.5;
    float _2355 = _2309 * _2285;
    float _2357 = _2337 * _2317;
    bool _2359 = _2162 > (-1.0);
    bool _2361 = _2359 && _2351;
    out.m_80.z = _2353;
    out.m_80.w = _2118;
    float _2363 = -_2329;
    float _2365 = _2363 + 1.0;
    bool _2367 = _2160 < 1.0;
    bool _2369 = _2367 && _2361;
    bool _2371 = _2162 < 1.0;
    bool _2373 = _2371 && _2369;
    float _2375 = _2329 * _2170;
    float _2377 = _2187 * _2375;
    float _2379 = _2197 * _2375;
    float _2381 = fma(_2193, _2377, _2181);
    float _2383 = fma(_2195, _2377, _2183);
    float _2385 = _2187 * _2365;
    float _2387 = fma(_2187, _2379, _2185);
    out.m_82.x = _2381;
    out.m_82.y = _2383;
    out.m_82.z = _2387;
    out.m_82.w = _2385;
    bool _2389 = !_2373;
    float _2391 = _2353;
    float _2393 = _2156;
    float _2395 = _2325;
    float _2397 = _2118;
    float _2399 = _2365;
    float _2401 = _2329;
    float _2403 = _2339;
    if (!_2389)
    {
        float _2405 = -_2355;
        float _2407 = _2162 + _2405;
        float _2409 = -_2321;
        float _2411 = _2160 + _2409;
        float _2413 = -_2347;
        float _2415 = _2160 + _2413;
        float _2417 = -_2357;
        float _2419 = _2162 + _2417;
        float _2421 = _2407 * _2407;
        float _2423 = fma(_2411, _2411, _2421);
        float _2425 = sqrt(_2423);
        bool _2427 = _2425 > 0.0;
        bool _2429 = !_2427;
        _2391 = _2423;
        _2401 = _2425;
        _2431 = _2429;
        if (!_2431)
        {
            float _2433 = _2419 * _2419;
            float _2435 = fma(_2415, _2415, _2433);
            float _2437 = rsqrt(_2423);
            float _2439 = sqrt(_2435);
            float _2441 = _2411 * _2437;
            float _2443 = _2407 * _2437;
            bool _2445 = _2439 > 0.0;
            bool _2447 = !_2445;
            _2397 = _2439;
            _2401 = _2437;
            _2431 = _2447;
            if (!_2431)
            {
                float _2449 = _1102 * _2239;
                float _2451 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2237);
                float _2455 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2287);
                float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2247);
                float _2459 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2453);
                float _2461 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2455);
                float _2463 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2457);
                float _2465 = rsqrt(_2435);
                float _2467 = _2451 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2469 = 1.0 / _2459;
                float _2471 = _2419 * _2467;
                float _2473 = _2415 * _2467;
                float _2475 = _2471 * _2471;
                float _2477 = fma(_2473, _2473, _2475);
                float _2479 = _2419 * _2465;
                float _2481 = _2415 * _2465;
                float _2483 = _2443 * _2479;
                float _2485 = _2461 * _2469;
                float _2487 = _2463 * _2469;
                float _2489 = sqrt(_2477);
                float _2491 = fma(_2441, _2481, _2483);
                float _2493 = _2485 * _2485;
                float _2495 = fma(_2487, _2487, _2493);
                float _2497 = precise::min(0.0, _2491);
                float _2499 = sqrt(_2495);
                float _2501 = _2118 * _2497;
                float _2503 = fma(_2473, _2501, _2138);
                float _2505 = fma(_2471, _2501, _2156);
                out.gl_Position.x = _2503;
                out.gl_Position.y = _2505;
                float _2507 = fma(_2489, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2499);
                float _2509 = 1.0 / _2507;
                float _2511 = _2499 * _2509;
                out.m_78.y = _2511;
                _2391 = _2501;
                _2395 = _2489;
                _2397 = _2473;
                _2399 = _2471;
                _2401 = _2491;
                _2431 = true;
            }
        }
    }
    else
    {
        float _2513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2513;
        _2393 = 0.0;
        _2395 = _2513;
        _2399 = 0.0;
        _2403 = 0.0;
    }
    _2431 = false;
    float _2515 = _2391;
    float _2517 = _2393;
    float _2519 = _2395;
    float _2521 = _2397;
    float _2523 = _2399;
    float _2525 = _2401;
    float _2527 = _2403;
    bool _2529 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2531 = isnan(_1882);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2537 = _2533 || _2535;
    float _2539 = _2519;
    float _2541 = _2517;
    float _2543 = _2523;
    float _2545 = _2521;
    float _2547 = _2515;
    float _2549 = _2525;
    if (!_2537)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2551 = _2539;
    float _2553 = _2551;
    float _2555 = _2551;
    if (!_2537)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2557 = _2541;
    float _2559 = _2557;
    float _2561 = _2557;
    if (!_2537)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2563 = _2543;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2537)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2569 = _2545;
    float _2571 = _2569;
    float _2573 = _2569;
    if (!_2537)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2575 = _2547;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2537)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2549;
    bool _2583 = !_2537;
    float _2585 = _2581;
    float _2587 = _2581;
    if (!_2583)
    {
        bool _2589 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2591 = isnan(_1882);
        bool _2593 = _2589 || _2591;
        bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2597 = _2593 || _2595;
        if (!_2597)
        {
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2601 = _1882 + _2599;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2605 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2603;
            float _2607 = 1.0 / _2605;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2629 = _2601 * _2607;
            float _2631 = precise::clamp(_2629, 0.0, 1.0);
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2637 = fma(_2631, _2611, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2639 = fma(_2631, _2635, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2631, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2643 = fma(_2631, _2619, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2645 = fma(_2631, _2623, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2647 = fma(_2631, _2627, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2561 = _2639;
            _2579 = _2645;
            _2555 = _2637;
            _2573 = _2643;
            _2567 = _2641;
            _2587 = _2647;
            _2649 = true;
        }
        else
        {
            bool _2651 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2653 = isnan(_1882);
            bool _2655 = _2651 || _2653;
            bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2659 = _2655 || _2657;
            if (!_2659)
            {
                _2553 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2661 = _2553;
            _2555 = _2661;
            if (!_2659)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2663 = _2559;
            _2561 = _2663;
            if (!_2659)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2665 = _2565;
            _2567 = _2665;
            if (!_2659)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2667 = _2571;
            _2573 = _2667;
            if (!_2659)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2669 = _2577;
            _2579 = _2669;
            if (!_2659)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2671 = _2585;
            bool _2673 = !_2659;
            _2587 = _2671;
            if (!_2673)
            {
                bool _2675 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2677 = isnan(_1882);
                bool _2679 = _2675 || _2677;
                bool _2681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2683 = _2679 || _2681;
                if (!_2683)
                {
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2687 = _1882 + _2685;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2691 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2689;
                    float _2693 = 1.0 / _2691;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2715 = _2687 * _2693;
                    float _2717 = precise::clamp(_2715, 0.0, 1.0);
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2723 = fma(_2717, _2697, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2725 = fma(_2717, _2721, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2717, _2701, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2729 = fma(_2717, _2705, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2731 = fma(_2717, _2709, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2733 = fma(_2717, _2713, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2561 = _2725;
                    _2579 = _2731;
                    _2555 = _2723;
                    _2573 = _2729;
                    _2567 = _2727;
                    _2587 = _2733;
                    _2649 = true;
                }
                else
                {
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2555 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2649 = false;
    float _2735 = _2561;
    float _2737 = _2579;
    float _2739 = _2555;
    float _2741 = _2573;
    float _2743 = _2567;
    float _2745 = _2587;
    float _2747 = fma(_1236, -0.5, 0.5);
    float _2749 = precise::clamp(_2747, 0.0, 1.0);
    float _2751 = -_2735;
    float _2753 = _2751 + _2737;
    float _2755 = -_2739;
    float _2757 = _2755 + _2741;
    out.m_84.x = 0.0;
    float _2759 = -_2743;
    float _2761 = _2759 + _2745;
    float _2763 = fma(_2749, _2753, _2735);
    float _2765 = fma(_2749, _2757, _2739);
    bool _2767 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2769 = _2763 * 0.586610972881317138671875;
    float _2771 = fma(_2749, _2761, _2743);
    float _2773 = _2527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2775 = _1802 > 0.0;
    bool _2777 = isnan(_1802);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2765, 0.298911988735198974609375, _2769);
    out.m_49.x = _2773;
    float _2787 = fma(_2771, 0.114477999508380889892578125, _2785);
    bool _2789 = _1860 <= 0.0;
    bool _2791 = !_2783;
    bool _2793 = _2789 || _2791;
    float _2795 = -_2787;
    float _2797 = _2765 + _2795;
    float _2799 = -_2787;
    float _2801 = _2771 + _2799;
    float _2803 = -_2787;
    float _2805 = _2763 + _2803;
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    float _2809 = fma(_2801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    float _2811 = fma(_2805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    bool _2813 = !_2767;
    if (!_2813)
    {
        float _2815 = -_1736;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2819 = -_1738;
        float _2821 = _2819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2823 = -_1740;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2827 = _2817 * _2817;
        float _2829 = fma(_2821, _2821, _2827);
        float _2831 = fma(_2825, _2825, _2829);
        float _2833 = sqrt(_2831);
        float _2835 = rsqrt(_2831);
        float _2837 = -_2833;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2841 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = _2821 * _2835;
        float _2847 = _2817 * _2835;
        float _2849 = abs(_2843);
        float _2851 = log2(_2849);
        float _2853 = _2825 * _2835;
        float _2855 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2857 = _1236 * _2847;
        float _2859 = -_2847;
        float _2861 = -_2855;
        float _2863 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2861);
        float _2865 = fma(_1234, _2845, _2857);
        float _2867 = -_2853;
        float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2863);
        float _2871 = fma(_1238, _2853, _2865);
        float _2873 = precise::clamp(_2871, 0.0, 1.0);
        float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2877 = _2869 + _2875;
        float _2879 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2881 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = exp2(_2879);
        float _2887 = _2885 * _2883;
        float _2889 = _2873 * _2887;
        float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2895 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2891;
        out.m_84.y = _2893;
        out.m_84.z = _2895;
    }
    out.m_86.x = _2807;
    out.m_86.y = _2811;
    out.m_86.z = _2809;
    if (!_2793)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2897;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2649 = false;
    bool _2431 = false;
    bool _1324 = false;
    bool _1312 = false;
    bool _441 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2954 = as_type<float>(_121);
        out.gl_Position.z = _2954;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3024 = as_type<float>(_159);
        out.gl_Position.z = _3024;
    }
    if (_151)
    {
        return out;
    }
    float _161 = in.m_53.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = _165 * _163;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _187);
    int _197 = as_type<int>(_167) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_167) & 2;
    bool _203 = _201 != 0;
    float _205 = _195 * 6.283185482025146484375;
    int _207 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _209 = _207 != 0;
    float _211 = floor(_195);
    float _213 = _205 * 0.15915493667125701904296875;
    bool _215 = !_209;
    int _217 = _215 ? 0 : 1;
    bool _219 = !_203;
    int _221 = _219 ? (-1090519040) : 1056964608;
    float _223 = _171 * _177;
    int _225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _227 = _225 != 0;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _231 = _229 != 0;
    float _233 = _213 * 6.283185482025146484375;
    float _235 = cos(_233);
    float _237 = _171 * _183;
    bool _239 = !_199;
    int _241 = _239 ? (-1090519040) : 1056964608;
    float _243 = fma(_169, _175, _223);
    bool _245 = !_227;
    int _247 = _245 ? 0 : 1;
    float _249 = _171 * _191;
    float _251 = fma(_169, _181, _237);
    out.m_66.x = as_type<float>(_241);
    out.m_66.y = as_type<float>(_221);
    int _253 = abs(_247);
    float _255 = fma(_169, _189, _249);
    int _257 = abs(_217);
    float _259 = -_211;
    float _261 = _195 + _259;
    bool _263 = !_231;
    int _265 = _263 ? 0 : 1;
    float _267 = -_261;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_253);
    float _273 = fma(_235, 0.5, 0.5);
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _277 = abs(_265);
    float _279 = abs(_269);
    float _281 = _271 * _279;
    bool _283 = _261 < 0.5;
    float _285 = float(_283);
    float _287 = -_273;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _291 = float(_257);
    float _293 = -_285;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = fma(_291, _289, _281);
    float _299 = float(_277);
    float _301 = fma(_173, _179, _243);
    float _303 = fma(_173, _185, _251);
    float _305 = fma(_173, _193, _255);
    float _307 = abs(_295);
    float _309 = fma(_299, _307, _297);
    bool _311 = !_275;
    float _327;
    if (!_311)
    {
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_105);
        float _333 = 1.0 / _331;
        float _335 = _139 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = _337 + _339;
    float _343 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _345 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _347 = isnan(_337);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _357;
    float _361 = _343 * _161;
    float _363 = -_355;
    float _365 = _363 + 1.0;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = 1.0 / _359;
    float _371 = trunc(_361);
    int _373 = int(_371);
    float _375 = _341 * _369;
    bool _377 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_337);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = _387 * _365;
    float _399 = fma(_391, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_395, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -_387;
    float _405 = _403 + 1.0;
    int _407 = _373 << 4;
    int _409 = _407 + 1712;
    float _411 = _399 * _397;
    float _413 = _401 * _397;
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _419 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[144].x, _415);
    float _421 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[144].y, _417);
    bool _423 = !_367;
    float _439;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _161 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_105);
        float _445 = 1.0 / _443;
        float _447 = _139 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_46.x;
    float _453 = in.m_46.y;
    float _455 = in.m_46.z;
    float _457 = _161 * 2.0;
    float _459 = in.m_53.y;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = in.m_53.z;
    float _479 = floor(_457);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = in.m_62.w;
    bool _491 = !_471;
    int _493 = _491 ? 0 : 1;
    float _495 = 1.0 / _463;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _497;
    float _501 = in.m_60.w;
    bool _503 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _511 = _507 || _509;
    int _513 = abs(_493);
    float _515 = in.m_64.w;
    float _517 = _177 * _453;
    float _519 = _183 * _453;
    float _521 = _191 * _453;
    float _523 = 1.0 / _483;
    float _525 = fma(_175, _451, _517);
    float _527 = fma(_181, _451, _519);
    float _529 = fma(_189, _451, _521);
    float _531 = fma(_179, _455, _525);
    float _533 = fma(_185, _455, _527);
    float _535 = _459 * 2.0;
    float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _539 = log2(_537);
    float _541 = _477 * 2.0;
    float _543 = fma(_193, _455, _529);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _553 = _161 + _477;
    bool _555 = _479 > 0.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _449 + _557;
    float _561 = floor(_535);
    float _563 = _551 * _495;
    float _565 = _161 + _459;
    bool _567 = _479 >= 0.0;
    bool _569 = isnan(_479);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _553 + (-1.0);
    float _579 = _565 + (-1.0);
    float _581 = _499 * _523;
    float _583 = _539 * _139;
    float _585 = 1.0 / _487;
    float _587 = _459 + _477;
    float _589 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _591 = _587 + (-1.0);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _595 = _561 >= 0.0;
    bool _597 = isnan(_561);
    bool _599 = _595 || _597;
    bool _601 = isnan(0.0);
    bool _603 = _599 || _601;
    float _605 = floor(_541);
    bool _607 = _561 > 0.0;
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _611 = _575 ? 0 : 1;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _615 = 1.0 + _613;
    int _617 = _603 ? 0 : 1;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _449 + _619;
    float _623 = float(_513);
    float _625 = exp2(_583);
    float _627 = _547 * _585;
    float _629 = fma(_563, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _459 + (-0.5);
    float _633 = _477 + (-0.5);
    float _635 = fma(_627, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _637 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _639 = isnan(_449);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = _605 > 0.0;
    float _651 = 1.0 / _615;
    bool _653 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = isnan(_449);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _605 >= 0.0;
    bool _667 = isnan(_605);
    bool _669 = _665 || _667;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_449);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_663;
    float _689 = _687 + 1.0;
    float _691 = -_625;
    float _693 = _691 + 1.0;
    bool _695 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _697 = isnan(_449);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _533 + _489;
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _711 = _511 ? _693 : 0.0;
    float _713 = _685 * _689;
    float _715 = -_685;
    float _717 = _715 + 1.0;
    bool _719 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _721 = isnan(1.0);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _727 = _723 || _725;
    float _729 = _531 + _501;
    float _731 = _543 + _515;
    float _733 = _705 * _717;
    float _735 = -_705;
    float _737 = _735 + 1.0;
    int _739 = ~_611;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = _707 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _747 = _743;
    if (!_555)
    {
        int _749 = ~_611;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _647 * _737;
    float _757 = _729 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _761 = float(_753);
    float _763 = _635 * _755;
    int _765 = _673 ? 0 : 1;
    if (_727)
    {
        float _767 = _711 * _651;
        _141 = _767;
    }
    float _769 = _141;
    bool _771 = !_467;
    int _773 = _771 ? 0 : 1;
    float _775 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _777 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _779 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _781 = ~_765;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _731 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _789 = abs(_773);
    float _791 = _777 * _161;
    int _793 = _785;
    if (!_649)
    {
        int _795 = ~_765;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _803 = in.m_68.x;
    float _805 = in.m_68.y;
    float _807 = in.m_68.z;
    int _809 = ~_617;
    int _811 = _809 + 1;
    int _813 = _811 + 1;
    float _815 = _161 + (-0.5);
    int _817 = _813;
    if (!_607)
    {
        int _819 = ~_617;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = _623 * _761;
    float _827 = float(_789);
    float _829 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _831 = trunc(_791);
    int _833 = int(_831);
    float _835 = float(_799);
    float _837 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].y, _775);
    float _839 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].x, _829);
    float _841 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].z, _779);
    float _843 = _825 * (-2.0);
    float _845 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].y, _837);
    float _847 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].x, _839);
    float _849 = _827 * _835;
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].z, _841);
    float _853 = _845 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _855 = _847 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _857 = fma(_609, _843, _609);
    float _859 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _861 = _853 * _709;
    float _863 = _849 * (-2.0);
    int _865 = _833 << 4;
    int _867 = _865 + 1968;
    float _869 = fma(_843, _805, _805);
    float _871 = _855 * _759;
    bool _873 = !_475;
    int _875 = _873 ? 0 : 1;
    uint _878 = uint(int(uint(_409) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[int(_880)][_882];
    int _886 = int(_878) + 1;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    int _890 = _886 & 3;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[int(_888)][_890];
    float _894 = _859 * _801;
    float _896 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[196].y, _869);
    int _898 = abs(_875);
    float _900 = fma(_861, 0.5, 0.5);
    float _902 = -_647;
    float _904 = _902 + 1.0;
    float _906 = fma(_589, _863, _589);
    uint _908 = uint(int(uint(_867) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    float _924 = float(_823);
    float _926 = in.m_70.x;
    float _928 = in.m_70.y;
    float _930 = float(_898);
    float _932 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[115].x, _763);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _936 = _449 + _934;
    float _938 = fma(_857, _769, _896);
    float _940 = fma(_871, 0.5, 0.5);
    int _942 = _867 + 8;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[int(_946)][_948];
    float _952 = _930 * _924;
    float _954 = fma(_581, _936, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = fma(_629, _733, _932);
    float _958 = _938 * 0.15915493667125701904296875;
    float _960 = _952 * (-2.0);
    float _962 = floor(_940);
    float _964 = fma(_954, _713, _956);
    int _966 = _409 + 8;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[int(_970)][_972];
    float _976 = fma(_894, 0.5, 0.5);
    bool _978 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _980 = isnan(1.0);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _986 = _982 || _984;
    float _988 = floor(_900);
    float _990 = fma(_863, _803, _803);
    float _992 = _419 * _926;
    float _994 = _421 * _928;
    float _996 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _998 = fma(_960, _807, _807);
    float _1000 = _958 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_221));
    float _1006 = fma(_906, _769, _996);
    float _1008 = fma(_593, _960, _593);
    float _1010 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].z, _998);
    float _1012 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[118].x, _964);
    float _1014 = _1006 * 0.15915493667125701904296875;
    float _1016 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = fma(_1008, _769, _1010);
    float _1020 = _958 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _884 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1026 = _892 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1028 = _1018 * 0.15915493667125701904296875;
    float _1030 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1036 = _1014 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _914 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1042 = _922 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1046 = -_988;
    float _1048 = _900 + _1046;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = as_type<float>(_221) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1056 = _1014 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1062 = -_962;
    float _1064 = _940 + _1062;
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1028 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1074 = _1016 * _1004;
    float _1076 = _1038 * _1022;
    float _1078 = _1038 * _1002;
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _1050;
    out.m_72.y = _1052;
    out.m_72.z = _1066;
    out.m_72.w = _1044;
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_241));
    float _1084 = _1028 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _1058 * _1022;
    out.m_74.x = _1030;
    out.m_74.y = _1032;
    out.m_74.z = _1080;
    out.m_74.w = _1034;
    float _1090 = as_type<float>(_241) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1092 = _1022 * _1070;
    float _1094 = _1058 * _1002;
    float _1096 = _1058 * _1070;
    float _1098 = _1038 * _1070;
    float _1100 = _1002 * _1070;
    float _1102 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1106 = floor(_976);
    float _1108 = fma(_1086, _1088, _1078);
    float _1110 = fma(_1086, _1078, _1088);
    float _1112 = -_1094;
    float _1114 = fma(_1086, _1076, _1112);
    float _1116 = -_1076;
    float _1118 = fma(_1086, _1094, _1116);
    float _1120 = fma(_1048, 2.0, -1.0);
    float _1122 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1124 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1126 = -_1086;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1104);
    float _1130 = _1102 * _1082;
    float _1132 = -_1074;
    float _1134 = _1086 * _1132;
    float _1136 = fma(_1064, 2.0, -1.0);
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1140 = -_1086;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1122);
    float _1144 = -_1086;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    float _1148 = _1096 * _1074;
    float _1150 = fma(_1092, _1130, _1134);
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1154 = _1098 * _1074;
    float _1156 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1158 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1160 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1162 = fma(_1108, _1130, _1148);
    float _1164 = fma(_1114, _1130, _1154);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1156);
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1158);
    float _1170 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1160);
    float _1172 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1174 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1178 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1182 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1184 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1176);
    float _1186 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1188 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1172);
    float _1190 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1142);
    float _1194 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    float _1196 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1198 = fma(_1100, _1186, _1150);
    float _1200 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1202 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1180);
    float _1204 = _1054 * _1182;
    float _1206 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1188);
    float _1208 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1190);
    float _1210 = _1054 * _1194;
    float _1212 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1184);
    float _1214 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1196);
    float _1216 = _1054 * _1192;
    float _1218 = fma(_1090, _1206, _1204);
    float _1220 = fma(_1118, _1186, _1162);
    float _1222 = fma(_1090, _1212, _1210);
    float _1224 = fma(_1090, _1208, _1216);
    float _1226 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1200);
    float _1228 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1202);
    float _1230 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1214);
    float _1232 = fma(_1110, _1186, _1164);
    float _1234 = _1226 + _1218;
    float _1236 = _1228 + _1224;
    float _1238 = _1230 + _1222;
    float _1240 = -_1106;
    float _1242 = _976 + _1240;
    float _1244 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1246 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_76.x = _1234;
    out.m_76.y = _1236;
    out.m_76.z = _1238;
    float _1250 = fma(_1242, 2.0, -1.0);
    float _1252 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1244);
    float _1254 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1256 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1260 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1252);
    float _1262 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1254);
    float _1264 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1256);
    float _1266 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1166);
    float _1268 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1168);
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1170);
    float _1272 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1280 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1282 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1284 = _1272 + _1274;
    float _1286 = _1280 + _1276;
    float _1288 = _1282 + _1278;
    float _1290 = _1184;
    float _1292 = _1268;
    float _1294 = _1054;
    float _1296 = _1270;
    float _1298 = _1268;
    float _1300 = _1120;
    float _1302 = _1250;
    float _1304 = _1136;
    float _1306 = _1226;
    float _1316;
    float _1318;
    float _1320;
    float _1322;
    if (!_986)
    {
        bool _1308 = _1276 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1310 = !_1308;
        _1312 = _1310;
        if (!_1312)
        {
            float _1314 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1316 = _1314;
            _1318 = 0.0;
            _1320 = 0.0;
            _1322 = 0.0;
            _1324 = true;
        }
    }
    if ((!_1324) || _1312)
    {
        bool _1362;
        if (!_1312)
        {
            bool _1326 = _1276 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1328 = isnan(_1276);
            bool _1330 = _1326 || _1328;
            bool _1332 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1334 = _1330 || _1332;
            bool _1336 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1338 = !_1334;
            bool _1340 = _1336 && _1338;
            bool _1342 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1344 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1340)
            {
                _1290 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1346 = _1290;
            float _1348 = _1346;
            if (_1340)
            {
                _1292 = 0.0;
            }
            float _1350 = _1292;
            _1298 = _1350;
            _1318 = _1350;
            if (_1340)
            {
                _1294 = 0.0;
            }
            float _1352 = _1294;
            _1320 = _1352;
            if (_1340)
            {
                float _1354 = _1346 * 5.0;
                _1348 = _1354;
            }
            float _1356 = _1348;
            _1316 = _1356;
            if (_1340)
            {
                _1344 = 0.0;
            }
            float _1358 = _1344;
            bool _1360 = !_1334;
            _1362 = _1360 && _1342;
            _1296 = _1358;
            _1322 = _1358;
        }
        if ((!_1362) || _1312)
        {
            _1312 = false;
            float _1364 = _1296;
            float _1366 = _1298;
            bool _1368 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1370 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1372 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1374 = _1282;
            float _1376 = _1364;
            float _1378 = _1366;
            _1316 = _1288;
            _1320 = _1286;
            if (_1368)
            {
                float _1380 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1374 = _1380;
            }
            float _1382 = _1374;
            if (_1368)
            {
                float _1384 = abs(_1136);
                float _1386 = -_1384;
                float _1388 = _1386 + 1.0;
                _1376 = _1388;
            }
            float _1390 = _1376;
            float _1392 = _1390;
            if (_1370)
            {
                float _1394 = abs(_1120);
                float _1396 = -_1394;
                float _1398 = _1396 + 1.0;
                _1300 = _1398;
            }
            float _1400 = _1300;
            if (!_1368)
            {
                _1378 = 1.0;
            }
            float _1402 = _1378;
            float _1404 = _1402;
            if (_1372)
            {
                float _1406 = abs(_1250);
                float _1408 = -_1406;
                float _1410 = _1408 + 1.0;
                _1302 = _1410;
            }
            float _1412 = _1302;
            if (!_1370)
            {
                _1304 = 1.0;
            }
            float _1414 = _1304;
            float _1416 = _1272;
            float _1418 = _1414;
            if (_1370)
            {
                float _1420 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1416 = _1420;
            }
            float _1422 = _1416;
            float _1424 = _1280;
            if (_1372)
            {
                float _1426 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1424 = _1426;
            }
            float _1428 = _1424;
            if (_1368)
            {
                float _1430 = _1390 * _1382;
                float _1432 = precise::clamp(_1430, 0.0, 1.0);
                _1404 = _1432;
            }
            float _1434 = _1404;
            if (!_1372)
            {
                _1392 = 1.0;
            }
            float _1436 = _1392;
            float _1438 = _1436;
            if (_1370)
            {
                float _1440 = _1400 * _1422;
                float _1442 = precise::clamp(_1440, 0.0, 1.0);
                _1418 = _1442;
            }
            float _1444 = _1418;
            float _1446 = _1434 * _1444;
            _1318 = _1284;
            if (_1372)
            {
                float _1448 = _1412 * _1428;
                float _1450 = precise::clamp(_1448, 0.0, 1.0);
                _1438 = _1450;
            }
            float _1452 = _1438;
            float _1454 = _1446 * _1452;
            _1322 = _1454;
        }
    }
    _1324 = false;
    float _1456 = _1316;
    float _1458 = _1318;
    float _1460 = _1320;
    float _1462 = _1322;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1466 = _1456 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1458 + _1468;
    float _1472 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1474 = _1466 * _1466;
    float _1476 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1472);
    float _1478 = fma(_1470, _1470, _1474);
    float _1480 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1476);
    float _1482 = sqrt(_1478);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1486 = !_1484;
    float _1488 = _1460;
    float _1490 = _1458;
    float _1492 = _1456;
    if (!_1486)
    {
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1498 = _1482 + _1496;
        float _1500 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1502 = rsqrt(_1478);
        float _1504 = _1498 * _1494;
        float _1506 = _1504 * 0.15915493667125701904296875;
        float _1508 = _1506 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1506 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = _1510 + (-1.0);
        float _1518 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1520 = fma(_1514, _1500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = fma(_1510, _1460, _1518);
        float _1524 = _1502 * _1520;
        float _1526 = fma(_1470, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1528 = fma(_1466, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1488 = _1522;
        _1490 = _1526;
        _1492 = _1528;
    }
    float _1530 = _1488;
    float _1532 = _1490;
    float _1534 = _1492;
    float _1536 = -_1276;
    float _1538 = _1536 + _1530;
    float _1540 = -_1274;
    float _1542 = _1540 + _1532;
    float _1544 = -_1278;
    float _1546 = _1544 + _1534;
    float _1548 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1550 = _1538 * _1538;
    float _1552 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1554 = 1.0 / _1548;
    float _1556 = fma(_1542, _1542, _1550);
    float _1558 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1552);
    bool _1560 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1562 = isnan(0.5);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1568 = _1564 || _1566;
    float _1570 = fma(_1546, _1546, _1556);
    float _1572 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1558);
    bool _1574 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1576 = isnan(0.5);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1582 = _1578 || _1580;
    float _1584 = sqrt(_1570);
    float _1586 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1588 = _1586 + _1548;
    float _1590 = _1588 * _1554;
    float _1592 = _1590 * 0.5;
    bool _1594 = _1584 > 0.0;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1598 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1596);
    float _1600 = 1.0 / _1598;
    bool _1602 = !_1594;
    float _1604 = _1532;
    float _1606 = _1530;
    float _1608 = _1534;
    float _1610 = _1548;
    float _1612 = _1538;
    float _1614 = _1542;
    if (!_1602)
    {
        float _1616 = _303 * _303;
        float _1618 = rsqrt(_1570);
        float _1620 = fma(_301, _301, _1616);
        float _1622 = fma(_305, _305, _1620);
        float _1624 = sqrt(_1622);
        float _1626 = _1542 * _1618;
        float _1628 = _1538 * _1618;
        float _1630 = _1546 * _1618;
        bool _1632 = _1624 > 0.0;
        bool _1634 = !_1632;
        _1610 = _1628;
        if (!_1634)
        {
            float _1636 = rsqrt(_1622);
            float _1638 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1640 = _303 * _1636;
            float _1642 = _301 * _1636;
            float _1644 = _1628 * _1640;
            float _1646 = _305 * _1636;
            float _1648 = fma(_1626, _1642, _1644);
            float _1650 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1652 = fma(_1630, _1646, _1648);
            float _1654 = _1652 * _1650;
            float _1656 = fma(_301, _1654, _1532);
            float _1658 = fma(_303, _1654, _1530);
            float _1660 = fma(_305, _1654, _1534);
            _1604 = _1656;
            _1606 = _1658;
            _1608 = _1660;
            _1610 = _1648;
        }
    }
    float _1662 = _1604;
    float _1664 = _1606;
    float _1666 = _1608;
    float _1668 = _1610;
    float _1670 = _1668;
    float _1672 = _1664;
    float _1674 = _1666;
    if (_1582)
    {
        _1612 = 1.0;
    }
    float _1676 = _1612;
    float _1678 = _1676;
    if (_1568)
    {
        _1614 = _1662;
    }
    float _1680 = _1614;
    float _1682 = _1680;
    if (!_1568)
    {
        float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1686 = _1276 + _1684;
        float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1690 = _1274 + _1688;
        float _1692 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1694 = -_1274;
        float _1696 = _1694 + _1662;
        float _1698 = _1686 * _1686;
        float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1702 = _1278 + _1700;
        float _1704 = fma(_1690, _1690, _1698);
        float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1708 = fma(_1702, _1702, _1704);
        float _1710 = sqrt(_1708);
        float _1712 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1714 = precise::min(_1710, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1716 = _1714 * _1706;
        float _1718 = _1712 * _1716;
        float _1720 = -_1276;
        float _1722 = _1720 + _1664;
        float _1724 = -_1278;
        float _1726 = _1724 + _1666;
        float _1728 = fma(_1696, _1718, _1274);
        float _1730 = fma(_1722, _1718, _1276);
        float _1732 = fma(_1726, _1718, _1278);
        _1670 = _1722;
        _1672 = _1730;
        _1682 = _1728;
        _1674 = _1732;
    }
    float _1734 = _1670;
    float _1736 = _1672;
    float _1738 = _1682;
    float _1740 = _1674;
    float _1742 = _1734;
    if (_1582)
    {
        _1306 = 1.0;
    }
    float _1744 = _1306;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1748 = _1600 * _1746;
    float _1750 = _1744;
    if (!_1582)
    {
        float _1752 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1754 = _1752 * 0.15915493667125701904296875;
        float _1756 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1758 = _1754 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1756 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1760;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = _1762 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1772 * _1774;
        float _1782 = 1.0 / _1780;
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1786 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1784;
        float _1788 = 1.0 / _1786;
        float _1790 = _1778 * _1782;
        float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1794 = fma(_1748, _1790, _1792);
        float _1796 = _1794 * _1788;
        float _1798 = precise::clamp(_1796, 0.0, 1.0);
        _1742 = _1794;
        _1678 = _1798;
    }
    float _1800 = _1742;
    float _1802 = _1678;
    float _1804 = _1800;
    if (!_1582)
    {
        float _1806 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1812 = _1808 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1810 * 0.15915493667125701904296875;
        float _1818 = _1808 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = 1.0 / _1814;
        float _1824 = _1816 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        float _1828 = _1820 * _1822;
        float _1830 = _1816 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        float _1834 = _1826 * _1828;
        float _1836 = 1.0 / _1834;
        float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1840 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1838;
        float _1842 = 1.0 / _1840;
        float _1844 = _1832 * _1836;
        float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1848 = fma(_1748, _1844, _1846);
        float _1850 = _1848 * _1842;
        float _1852 = precise::clamp(_1850, 0.0, 1.0);
        float _1854 = -_1852;
        float _1856 = _1854 + 1.0;
        _1804 = _1822;
        _1750 = _1856;
    }
    float _1858 = _1804;
    float _1860 = _1750;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1864 = _1736 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1868 = _1738 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1872 = _1740 + _1870;
    float _1874 = _1864 * _1864;
    float _1876 = fma(_1868, _1868, _1874);
    float _1878 = fma(_1872, _1872, _1876);
    float _1880 = rsqrt(_1878);
    float _1882 = sqrt(_1878);
    float _1884 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1886 = _1868 * _1884;
    float _1888 = _1872 * _1884;
    float _1890 = _1886 * _1886;
    float _1892 = _1888 * _1888;
    float _1894 = _1890 + _1892;
    float _1896 = sqrt(_1894);
    bool _1898 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1896 + _1900;
    float _1904 = _1872;
    float _1906 = _1894;
    float _1908 = _1902;
    float _1910 = _1858;
    float _1912 = _1884;
    if (_1898)
    {
        float _1914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1904 = _1914;
    }
    float _1916 = _1904;
    if (_1898)
    {
        float _1918 = rsqrt(_1894);
        _1906 = _1918;
    }
    float _1920 = _1906;
    if (_1898)
    {
        float _1922 = _1902 * _1916;
        _1908 = _1922;
    }
    float _1924 = _1908;
    if (_1898)
    {
        float _1926 = _1924 * 0.15915493667125701904296875;
        _1910 = _1926;
    }
    float _1928 = _1910;
    float _1930 = _1874;
    float _1932 = _1928;
    if (_1898)
    {
        float _1934 = _1928 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1930 = _1936;
    }
    float _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1880;
    float _1946 = _1942;
    float _1948 = _1940;
    if (_1898)
    {
        float _1950 = _1928 * 6.283185482025146484375;
        float _1952 = cos(_1950);
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = -_1884;
    float _1958 = -_1942;
    float _1960 = fma(_1864, _1956, _1958);
    float _1962 = _1960;
    if (!_1898)
    {
        _1946 = _1886;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (_1898)
    {
        float _1968 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1948 = _1968;
    }
    float _1970 = _1948;
    float _1972 = _1938;
    float _1974 = _1970;
    if (_1898)
    {
        float _1976 = fma(_1938, _1970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = _1978;
    float _1982 = _1954;
    if (_1898)
    {
        float _1984 = _1954 + (-1.0);
        _1974 = _1984;
    }
    float _1986 = _1974;
    float _1988 = _1986;
    if (_1898)
    {
        float _1990 = _1920 * _1978;
        _1912 = _1990;
    }
    float _1992 = _1912;
    if (!_1898)
    {
        _1980 = _1890;
    }
    float _1994 = _1980;
    float _1996 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1998 = _1994;
    if (_1898)
    {
        float _2000 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _2000;
    }
    float _2002 = _1932;
    if (_1898)
    {
        float _2004 = _1886 * _1992;
        _1966 = _2004;
    }
    float _2006 = _1966;
    if (!_1898)
    {
        _1988 = _1888;
    }
    float _2008 = _1988;
    float _2010 = _2008;
    if (_1898)
    {
        float _2012 = _1888 * _1992;
        _2010 = _2012;
    }
    float _2014 = _2010;
    if (_1898)
    {
        float _2016 = fma(_1960, _1954, _2002);
        _1962 = _2016;
    }
    float _2018 = _1962;
    if (_1898)
    {
        float _2020 = _2006 * _2006;
        _1998 = _2020;
    }
    float _2022 = _1998;
    if (!_1898)
    {
        _1982 = _1892;
    }
    float _2024 = _1982;
    float _2026 = _2024;
    if (_1898)
    {
        float _2028 = _2014 * _2014;
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = fma(_2018, _2018, _2022);
    float _2034 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2036 = _2032 + _2030;
    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2040 = fma(_1882, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2038);
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1996);
    float _2046 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2048 = rsqrt(_2036);
    float _2050 = -_2042;
    float _2052 = _2050 + 1.0;
    float _2054 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2044);
    float _2056 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2058 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2046);
    float _2060 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2056);
    float _2066 = abs(_2052);
    float _2068 = log2(_2066);
    float _2070 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2058);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2074 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2076 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2060);
    float _2078 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2080 = -_2072;
    float _2082 = fma(_2080, _2034, 1.0);
    float _2084 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2086 = _2048 * _2006;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2090 = _2048 * _2018;
    float _2092 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2094 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2096 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2088);
    float _2098 = _2048 * _2014;
    float _2100 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2102 = -_2094;
    float _2104 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2102);
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2110 = log2(_2082);
    float _2112 = -_2098;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2104);
    float _2116 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2118 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2108);
    float _2120 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2122 = fma(_2114, -0.5, 0.5);
    float _2124 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2116);
    float _2126 = fma(_2114, 0.5, 0.5);
    float _2128 = exp2(_2106);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2120);
    float _2132 = _2090 + 1.0;
    float _2134 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2124);
    float _2136 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2130);
    float _2138 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2134);
    float _2140 = 1.0 / _2118;
    float _2142 = fma(_2126, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2144 = _2110 * 0.693147182464599609375;
    float _2146 = fma(_2126, _2142, -0.212114393711090087890625);
    float _2148 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = sqrt(_2122);
    float _2152 = -_2090;
    float _2154 = fma(_2128, _2132, _2152);
    float _2156 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2136);
    float _2158 = fma(_2126, _2146, 1.570728778839111328125);
    float _2160 = _2138 * _2140;
    float _2162 = _2156 * _2140;
    float _2164 = fma(_2160, 0.5, 0.5);
    float _2166 = fma(_2162, -0.5, 0.5);
    float _2168 = _2150 * 0.636619746685028076171875;
    float3 _6153 = float3(_2164, _2166, _2148);
    float _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6153, float3(0.0), isnan(_6153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6153, float3(0.0), isnan(_6153)), level(0.0)).x;
    float _2172 = -_2158;
    float _2174 = fma(_2168, _2172, 1.0);
    float _2176 = fma(_2154, 0.5, 0.5);
    float3 _6171 = float3(_2164, _2166, _2148);
    float4 _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _2181 = _2179.x;
    float _2183 = _2179.y;
    float _2185 = _2179.z;
    float _2187 = _2179.w;
    float2 _6188 = float2(_2174, _2176);
    float3 _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _2193 = _2191.x;
    float _2195 = _2191.y;
    float _2197 = _2191.z;
    float _2199 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2201 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2203 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2205 = -_303;
    float _2207 = _2205 + _1736;
    float _2209 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2199);
    float _2211 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2201);
    float _2213 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2203);
    float _2215 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2217 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2209);
    float _2219 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2211);
    float _2221 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2213);
    float _2223 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2215);
    float _2225 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2227 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2229 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2231 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2223);
    float _2233 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2237 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2239 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2241 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2233);
    float _2243 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2235);
    float _2245 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2249 = _2237 + _2241;
    float _2251 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2243);
    float _2253 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2255 = -_305;
    float _2257 = _2255 + _1740;
    float _2259 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2249);
    float _2261 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2263 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2265 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2267 = exp2(_2253);
    float _2269 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2261);
    float _2271 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2251);
    float _2273 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2275 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2265);
    float _2277 = _2247 + _2269;
    float _2279 = -_301;
    float _2281 = _2279 + _1738;
    float _2283 = _1802 * _1860;
    float _2285 = 1.0 / _2259;
    float _2287 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2289 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2273);
    float _2291 = _2283 * _1462;
    out.m_78.y = 1.0;
    float _2293 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2275);
    float _2295 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2289);
    float _2297 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2299 = _2287 + _2263;
    float _2301 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2303 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2305 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2297);
    float _2307 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2309 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2299);
    float _2311 = -_2267;
    float _2313 = _2311 + 1.0;
    float _2315 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2305);
    float _2317 = 1.0 / _2303;
    float _2319 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2307);
    float _2321 = _2301 * _2285;
    float _2323 = _2271 * _2285;
    float _2325 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2293);
    float _2327 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2319);
    float _2329 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2331 = _2291 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2333 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2335 = _2323 > 0.0;
    float _2337 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _2339 = _309 * _2331;
    out.gl_Position.x = _2138;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2325;
    out.gl_Position.w = _2118;
    bool _2341 = _2323 < 1.0;
    bool _2343 = _2341 && _2335;
    float _2345 = _2325 + _2118;
    float _2347 = _2333 * _2317;
    bool _2349 = _2160 > (-1.0);
    bool _2351 = _2349 && _2343;
    float _2353 = _2345 * 0.5;
    float _2355 = _2309 * _2285;
    float _2357 = _2337 * _2317;
    bool _2359 = _2162 > (-1.0);
    bool _2361 = _2359 && _2351;
    out.m_80.z = _2353;
    out.m_80.w = _2118;
    float _2363 = -_2329;
    float _2365 = _2363 + 1.0;
    bool _2367 = _2160 < 1.0;
    bool _2369 = _2367 && _2361;
    bool _2371 = _2162 < 1.0;
    bool _2373 = _2371 && _2369;
    float _2375 = _2329 * _2170;
    float _2377 = _2187 * _2375;
    float _2379 = _2197 * _2375;
    float _2381 = fma(_2193, _2377, _2181);
    float _2383 = fma(_2195, _2377, _2183);
    float _2385 = _2187 * _2365;
    float _2387 = fma(_2187, _2379, _2185);
    out.m_82.x = _2381;
    out.m_82.y = _2383;
    out.m_82.z = _2387;
    out.m_82.w = _2385;
    bool _2389 = !_2373;
    float _2391 = _2353;
    float _2393 = _2156;
    float _2395 = _2325;
    float _2397 = _2118;
    float _2399 = _2365;
    float _2401 = _2329;
    float _2403 = _2339;
    if (!_2389)
    {
        float _2405 = -_2355;
        float _2407 = _2162 + _2405;
        float _2409 = -_2321;
        float _2411 = _2160 + _2409;
        float _2413 = -_2347;
        float _2415 = _2160 + _2413;
        float _2417 = -_2357;
        float _2419 = _2162 + _2417;
        float _2421 = _2407 * _2407;
        float _2423 = fma(_2411, _2411, _2421);
        float _2425 = sqrt(_2423);
        bool _2427 = _2425 > 0.0;
        bool _2429 = !_2427;
        _2391 = _2423;
        _2401 = _2425;
        _2431 = _2429;
        if (!_2431)
        {
            float _2433 = _2419 * _2419;
            float _2435 = fma(_2415, _2415, _2433);
            float _2437 = rsqrt(_2423);
            float _2439 = sqrt(_2435);
            float _2441 = _2411 * _2437;
            float _2443 = _2407 * _2437;
            bool _2445 = _2439 > 0.0;
            bool _2447 = !_2445;
            _2397 = _2439;
            _2401 = _2437;
            _2431 = _2447;
            if (!_2431)
            {
                float _2449 = _1102 * _2239;
                float _2451 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2237);
                float _2455 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2287);
                float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2247);
                float _2459 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2453);
                float _2461 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2455);
                float _2463 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2457);
                float _2465 = rsqrt(_2435);
                float _2467 = _2451 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2469 = 1.0 / _2459;
                float _2471 = _2419 * _2467;
                float _2473 = _2415 * _2467;
                float _2475 = _2471 * _2471;
                float _2477 = fma(_2473, _2473, _2475);
                float _2479 = _2419 * _2465;
                float _2481 = _2415 * _2465;
                float _2483 = _2443 * _2479;
                float _2485 = _2461 * _2469;
                float _2487 = _2463 * _2469;
                float _2489 = sqrt(_2477);
                float _2491 = fma(_2441, _2481, _2483);
                float _2493 = _2485 * _2485;
                float _2495 = fma(_2487, _2487, _2493);
                float _2497 = precise::min(0.0, _2491);
                float _2499 = sqrt(_2495);
                float _2501 = _2118 * _2497;
                float _2503 = fma(_2473, _2501, _2138);
                float _2505 = fma(_2471, _2501, _2156);
                out.gl_Position.x = _2503;
                out.gl_Position.y = _2505;
                float _2507 = fma(_2489, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2499);
                float _2509 = 1.0 / _2507;
                float _2511 = _2499 * _2509;
                out.m_78.y = _2511;
                _2391 = _2501;
                _2395 = _2489;
                _2397 = _2473;
                _2399 = _2471;
                _2401 = _2491;
                _2431 = true;
            }
        }
    }
    else
    {
        float _2513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2513;
        _2393 = 0.0;
        _2395 = _2513;
        _2399 = 0.0;
        _2403 = 0.0;
    }
    _2431 = false;
    float _2515 = _2391;
    float _2517 = _2393;
    float _2519 = _2395;
    float _2521 = _2397;
    float _2523 = _2399;
    float _2525 = _2401;
    float _2527 = _2403;
    bool _2529 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2531 = isnan(_1882);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2537 = _2533 || _2535;
    float _2539 = _2519;
    float _2541 = _2517;
    float _2543 = _2523;
    float _2545 = _2521;
    float _2547 = _2515;
    float _2549 = _2525;
    if (!_2537)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2551 = _2539;
    float _2553 = _2551;
    float _2555 = _2551;
    if (!_2537)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2557 = _2541;
    float _2559 = _2557;
    float _2561 = _2557;
    if (!_2537)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2563 = _2543;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2537)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2569 = _2545;
    float _2571 = _2569;
    float _2573 = _2569;
    if (!_2537)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2575 = _2547;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2537)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2549;
    bool _2583 = !_2537;
    float _2585 = _2581;
    float _2587 = _2581;
    if (!_2583)
    {
        bool _2589 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2591 = isnan(_1882);
        bool _2593 = _2589 || _2591;
        bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2597 = _2593 || _2595;
        if (!_2597)
        {
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2601 = _1882 + _2599;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2605 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2603;
            float _2607 = 1.0 / _2605;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2629 = _2601 * _2607;
            float _2631 = precise::clamp(_2629, 0.0, 1.0);
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2637 = fma(_2631, _2611, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2639 = fma(_2631, _2635, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2631, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2643 = fma(_2631, _2619, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2645 = fma(_2631, _2623, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2647 = fma(_2631, _2627, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2561 = _2639;
            _2579 = _2645;
            _2555 = _2637;
            _2573 = _2643;
            _2567 = _2641;
            _2587 = _2647;
            _2649 = true;
        }
        else
        {
            bool _2651 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2653 = isnan(_1882);
            bool _2655 = _2651 || _2653;
            bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2659 = _2655 || _2657;
            if (!_2659)
            {
                _2553 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2661 = _2553;
            _2555 = _2661;
            if (!_2659)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2663 = _2559;
            _2561 = _2663;
            if (!_2659)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2665 = _2565;
            _2567 = _2665;
            if (!_2659)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2667 = _2571;
            _2573 = _2667;
            if (!_2659)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2669 = _2577;
            _2579 = _2669;
            if (!_2659)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2671 = _2585;
            bool _2673 = !_2659;
            _2587 = _2671;
            if (!_2673)
            {
                bool _2675 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2677 = isnan(_1882);
                bool _2679 = _2675 || _2677;
                bool _2681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2683 = _2679 || _2681;
                if (!_2683)
                {
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2687 = _1882 + _2685;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2691 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2689;
                    float _2693 = 1.0 / _2691;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2715 = _2687 * _2693;
                    float _2717 = precise::clamp(_2715, 0.0, 1.0);
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2723 = fma(_2717, _2697, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2725 = fma(_2717, _2721, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2717, _2701, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2729 = fma(_2717, _2705, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2731 = fma(_2717, _2709, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2733 = fma(_2717, _2713, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2561 = _2725;
                    _2579 = _2731;
                    _2555 = _2723;
                    _2573 = _2729;
                    _2567 = _2727;
                    _2587 = _2733;
                    _2649 = true;
                }
                else
                {
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2555 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2649 = false;
    float _2735 = _2561;
    float _2737 = _2579;
    float _2739 = _2555;
    float _2741 = _2573;
    float _2743 = _2567;
    float _2745 = _2587;
    float _2747 = fma(_1236, -0.5, 0.5);
    float _2749 = precise::clamp(_2747, 0.0, 1.0);
    float _2751 = -_2735;
    float _2753 = _2751 + _2737;
    float _2755 = -_2739;
    float _2757 = _2755 + _2741;
    out.m_84.x = 0.0;
    float _2759 = -_2743;
    float _2761 = _2759 + _2745;
    float _2763 = fma(_2749, _2753, _2735);
    float _2765 = fma(_2749, _2757, _2739);
    bool _2767 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2769 = _2763 * 0.586610972881317138671875;
    float _2771 = fma(_2749, _2761, _2743);
    float _2773 = _2527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2775 = _1802 > 0.0;
    bool _2777 = isnan(_1802);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2765, 0.298911988735198974609375, _2769);
    out.m_49.x = _2773;
    float _2787 = fma(_2771, 0.114477999508380889892578125, _2785);
    bool _2789 = _1860 <= 0.0;
    bool _2791 = !_2783;
    bool _2793 = _2789 || _2791;
    float _2795 = -_2787;
    float _2797 = _2765 + _2795;
    float _2799 = -_2787;
    float _2801 = _2771 + _2799;
    float _2803 = -_2787;
    float _2805 = _2763 + _2803;
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    float _2809 = fma(_2801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    float _2811 = fma(_2805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    bool _2813 = !_2767;
    if (!_2813)
    {
        float _2815 = -_1736;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2819 = -_1738;
        float _2821 = _2819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2823 = -_1740;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2827 = _2817 * _2817;
        float _2829 = fma(_2821, _2821, _2827);
        float _2831 = fma(_2825, _2825, _2829);
        float _2833 = sqrt(_2831);
        float _2835 = rsqrt(_2831);
        float _2837 = -_2833;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2841 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = _2821 * _2835;
        float _2847 = _2817 * _2835;
        float _2849 = abs(_2843);
        float _2851 = log2(_2849);
        float _2853 = _2825 * _2835;
        float _2855 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2857 = _1236 * _2847;
        float _2859 = -_2847;
        float _2861 = -_2855;
        float _2863 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2861);
        float _2865 = fma(_1234, _2845, _2857);
        float _2867 = -_2853;
        float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2863);
        float _2871 = fma(_1238, _2853, _2865);
        float _2873 = precise::clamp(_2871, 0.0, 1.0);
        float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2877 = _2869 + _2875;
        float _2879 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2881 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = exp2(_2879);
        float _2887 = _2885 * _2883;
        float _2889 = _2873 * _2887;
        float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2895 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2891;
        out.m_84.y = _2893;
        out.m_84.z = _2895;
    }
    out.m_86.x = _2807;
    out.m_86.y = _2811;
    out.m_86.z = _2809;
    if (!_2793)
    {
        return out;
    }
    float _2897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2897;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2649 = false;
    bool _2431 = false;
    bool _1324 = false;
    bool _1312 = false;
    bool _441 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2954 = as_type<float>(_121);
        out.gl_Position.z = _2954;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3024 = as_type<float>(_159);
        out.gl_Position.z = _3024;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_53.x;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = _165 * _163;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _187);
    int _197 = as_type<int>(_167) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_167) & 2;
    bool _203 = _201 != 0;
    float _205 = _195 * 6.283185482025146484375;
    int _207 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _209 = _207 != 0;
    float _211 = floor(_195);
    float _213 = _205 * 0.15915493667125701904296875;
    bool _215 = !_209;
    int _217 = _215 ? 0 : 1;
    bool _219 = !_203;
    int _221 = _219 ? (-1090519040) : 1056964608;
    float _223 = _171 * _177;
    int _225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _227 = _225 != 0;
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _231 = _229 != 0;
    float _233 = _213 * 6.283185482025146484375;
    float _235 = cos(_233);
    float _237 = _171 * _183;
    bool _239 = !_199;
    int _241 = _239 ? (-1090519040) : 1056964608;
    float _243 = fma(_169, _175, _223);
    bool _245 = !_227;
    int _247 = _245 ? 0 : 1;
    float _249 = _171 * _191;
    float _251 = fma(_169, _181, _237);
    out.m_66.x = as_type<float>(_241);
    out.m_66.y = as_type<float>(_221);
    int _253 = abs(_247);
    float _255 = fma(_169, _189, _249);
    int _257 = abs(_217);
    float _259 = -_211;
    float _261 = _195 + _259;
    bool _263 = !_231;
    int _265 = _263 ? 0 : 1;
    float _267 = -_261;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_253);
    float _273 = fma(_235, 0.5, 0.5);
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _277 = abs(_265);
    float _279 = abs(_269);
    float _281 = _271 * _279;
    bool _283 = _261 < 0.5;
    float _285 = float(_283);
    float _287 = -_273;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _291 = float(_257);
    float _293 = -_285;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = fma(_291, _289, _281);
    float _299 = float(_277);
    float _301 = fma(_173, _179, _243);
    float _303 = fma(_173, _185, _251);
    float _305 = fma(_173, _193, _255);
    float _307 = abs(_295);
    float _309 = fma(_299, _307, _297);
    bool _311 = !_275;
    float _327;
    if (!_311)
    {
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_105);
        float _333 = 1.0 / _331;
        float _335 = _139 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = _337 + _339;
    float _343 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _345 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _347 = isnan(_337);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _357;
    float _361 = _343 * _161;
    float _363 = -_355;
    float _365 = _363 + 1.0;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = 1.0 / _359;
    float _371 = trunc(_361);
    int _373 = int(_371);
    float _375 = _341 * _369;
    bool _377 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_337);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = _387 * _365;
    float _399 = fma(_391, _375, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_395, _375, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -_387;
    float _405 = _403 + 1.0;
    int _407 = _373 << 4;
    int _409 = _407 + 1712;
    float _411 = _399 * _397;
    float _413 = _401 * _397;
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _419 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[144].x, _415);
    float _421 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[144].y, _417);
    bool _423 = !_367;
    float _439;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _161 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_105);
        float _445 = 1.0 / _443;
        float _447 = _139 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_46.x;
    float _453 = in.m_46.y;
    float _455 = in.m_46.z;
    float _457 = _161 * 2.0;
    float _459 = in.m_53.y;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = in.m_53.z;
    float _479 = floor(_457);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _489 = in.m_62.w;
    bool _491 = !_471;
    int _493 = _491 ? 0 : 1;
    float _495 = 1.0 / _463;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _497;
    float _501 = in.m_60.w;
    bool _503 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _511 = _507 || _509;
    int _513 = abs(_493);
    float _515 = in.m_64.w;
    float _517 = _177 * _453;
    float _519 = _183 * _453;
    float _521 = _191 * _453;
    float _523 = 1.0 / _483;
    float _525 = fma(_175, _451, _517);
    float _527 = fma(_181, _451, _519);
    float _529 = fma(_189, _451, _521);
    float _531 = fma(_179, _455, _525);
    float _533 = fma(_185, _455, _527);
    float _535 = _459 * 2.0;
    float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _539 = log2(_537);
    float _541 = _477 * 2.0;
    float _543 = fma(_193, _455, _529);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _553 = _161 + _477;
    bool _555 = _479 > 0.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _449 + _557;
    float _561 = floor(_535);
    float _563 = _551 * _495;
    float _565 = _161 + _459;
    bool _567 = _479 >= 0.0;
    bool _569 = isnan(_479);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _553 + (-1.0);
    float _579 = _565 + (-1.0);
    float _581 = _499 * _523;
    float _583 = _539 * _139;
    float _585 = 1.0 / _487;
    float _587 = _459 + _477;
    float _589 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _591 = _587 + (-1.0);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _595 = _561 >= 0.0;
    bool _597 = isnan(_561);
    bool _599 = _595 || _597;
    bool _601 = isnan(0.0);
    bool _603 = _599 || _601;
    float _605 = floor(_541);
    bool _607 = _561 > 0.0;
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _611 = _575 ? 0 : 1;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _615 = 1.0 + _613;
    int _617 = _603 ? 0 : 1;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _449 + _619;
    float _623 = float(_513);
    float _625 = exp2(_583);
    float _627 = _547 * _585;
    float _629 = fma(_563, _559, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _459 + (-0.5);
    float _633 = _477 + (-0.5);
    float _635 = fma(_627, _621, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _637 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _639 = isnan(_449);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    bool _649 = _605 > 0.0;
    float _651 = 1.0 / _615;
    bool _653 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _655 = isnan(_449);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _605 >= 0.0;
    bool _667 = isnan(_605);
    bool _669 = _665 || _667;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _677 = isnan(_449);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_663;
    float _689 = _687 + 1.0;
    float _691 = -_625;
    float _693 = _691 + 1.0;
    bool _695 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _697 = isnan(_449);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _533 + _489;
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _711 = _511 ? _693 : 0.0;
    float _713 = _685 * _689;
    float _715 = -_685;
    float _717 = _715 + 1.0;
    bool _719 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _721 = isnan(1.0);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _727 = _723 || _725;
    float _729 = _531 + _501;
    float _731 = _543 + _515;
    float _733 = _705 * _717;
    float _735 = -_705;
    float _737 = _735 + 1.0;
    int _739 = ~_611;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = _707 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _747 = _743;
    if (!_555)
    {
        int _749 = ~_611;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _647 * _737;
    float _757 = _729 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _759 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _761 = float(_753);
    float _763 = _635 * _755;
    int _765 = _673 ? 0 : 1;
    if (_727)
    {
        float _767 = _711 * _651;
        _141 = _767;
    }
    float _769 = _141;
    bool _771 = !_467;
    int _773 = _771 ? 0 : 1;
    float _775 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _777 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _779 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _781 = ~_765;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _731 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _789 = abs(_773);
    float _791 = _777 * _161;
    int _793 = _785;
    if (!_649)
    {
        int _795 = ~_765;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _803 = in.m_68.x;
    float _805 = in.m_68.y;
    float _807 = in.m_68.z;
    int _809 = ~_617;
    int _811 = _809 + 1;
    int _813 = _811 + 1;
    float _815 = _161 + (-0.5);
    int _817 = _813;
    if (!_607)
    {
        int _819 = ~_617;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = _623 * _761;
    float _827 = float(_789);
    float _829 = _745 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _831 = trunc(_791);
    int _833 = int(_831);
    float _835 = float(_799);
    float _837 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].y, _775);
    float _839 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].x, _829);
    float _841 = fma(_757, (*spvDescriptorSet0.vp_c12)._m0[6].z, _779);
    float _843 = _825 * (-2.0);
    float _845 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].y, _837);
    float _847 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].x, _839);
    float _849 = _827 * _835;
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c12)._m0[8].z, _841);
    float _853 = _845 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _855 = _847 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _857 = fma(_609, _843, _609);
    float _859 = _851 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _861 = _853 * _709;
    float _863 = _849 * (-2.0);
    int _865 = _833 << 4;
    int _867 = _865 + 1968;
    float _869 = fma(_843, _805, _805);
    float _871 = _855 * _759;
    bool _873 = !_475;
    int _875 = _873 ? 0 : 1;
    uint _878 = uint(int(uint(_409) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[int(_880)][_882];
    int _886 = int(_878) + 1;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    int _890 = _886 & 3;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[int(_888)][_890];
    float _894 = _859 * _801;
    float _896 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[196].y, _869);
    int _898 = abs(_875);
    float _900 = fma(_861, 0.5, 0.5);
    float _902 = -_647;
    float _904 = _902 + 1.0;
    float _906 = fma(_589, _863, _589);
    uint _908 = uint(int(uint(_867) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    float _924 = float(_823);
    float _926 = in.m_70.x;
    float _928 = in.m_70.y;
    float _930 = float(_898);
    float _932 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[115].x, _763);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _936 = _449 + _934;
    float _938 = fma(_857, _769, _896);
    float _940 = fma(_871, 0.5, 0.5);
    int _942 = _867 + 8;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[int(_946)][_948];
    float _952 = _930 * _924;
    float _954 = fma(_581, _936, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = fma(_629, _733, _932);
    float _958 = _938 * 0.15915493667125701904296875;
    float _960 = _952 * (-2.0);
    float _962 = floor(_940);
    float _964 = fma(_954, _713, _956);
    int _966 = _409 + 8;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    uint _970 = uint(int(uint(int(_968)) >> uint(2)));
    int _972 = int(_968) & 3;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[int(_970)][_972];
    float _976 = fma(_894, 0.5, 0.5);
    bool _978 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _980 = isnan(1.0);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _986 = _982 || _984;
    float _988 = floor(_900);
    float _990 = fma(_863, _803, _803);
    float _992 = _419 * _926;
    float _994 = _421 * _928;
    float _996 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _998 = fma(_960, _807, _807);
    float _1000 = _958 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_221));
    float _1006 = fma(_906, _769, _996);
    float _1008 = fma(_593, _960, _593);
    float _1010 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].z, _998);
    float _1012 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[118].x, _964);
    float _1014 = _1006 * 0.15915493667125701904296875;
    float _1016 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = fma(_1008, _769, _1010);
    float _1020 = _958 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _884 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1026 = _892 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1028 = _1018 * 0.15915493667125701904296875;
    float _1030 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1032 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1036 = _1014 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _914 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1042 = _922 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1046 = -_988;
    float _1048 = _900 + _1046;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = as_type<float>(_221) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1056 = _1014 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1062 = -_962;
    float _1064 = _940 + _1062;
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1028 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1074 = _1016 * _1004;
    float _1076 = _1038 * _1022;
    float _1078 = _1038 * _1002;
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _1050;
    out.m_72.y = _1052;
    out.m_72.z = _1066;
    out.m_72.w = _1044;
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_241));
    float _1084 = _1028 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _1058 * _1022;
    out.m_74.x = _1030;
    out.m_74.y = _1032;
    out.m_74.z = _1080;
    out.m_74.w = _1034;
    float _1090 = as_type<float>(_241) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1092 = _1022 * _1070;
    float _1094 = _1058 * _1002;
    float _1096 = _1058 * _1070;
    float _1098 = _1038 * _1070;
    float _1100 = _1002 * _1070;
    float _1102 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1106 = floor(_976);
    float _1108 = fma(_1086, _1088, _1078);
    float _1110 = fma(_1086, _1078, _1088);
    float _1112 = -_1094;
    float _1114 = fma(_1086, _1076, _1112);
    float _1116 = -_1076;
    float _1118 = fma(_1086, _1094, _1116);
    float _1120 = fma(_1048, 2.0, -1.0);
    float _1122 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1124 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1126 = -_1086;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1104);
    float _1130 = _1102 * _1082;
    float _1132 = -_1074;
    float _1134 = _1086 * _1132;
    float _1136 = fma(_1064, 2.0, -1.0);
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1140 = -_1086;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1122);
    float _1144 = -_1086;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    float _1148 = _1096 * _1074;
    float _1150 = fma(_1092, _1130, _1134);
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1154 = _1098 * _1074;
    float _1156 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1158 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1160 = _1138 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1162 = fma(_1108, _1130, _1148);
    float _1164 = fma(_1114, _1130, _1154);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1156);
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1158);
    float _1170 = fma(_1152, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1160);
    float _1172 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1174 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1178 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1182 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1128);
    float _1184 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1176);
    float _1186 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1188 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1172);
    float _1190 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1192 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1142);
    float _1194 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    float _1196 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1198 = fma(_1100, _1186, _1150);
    float _1200 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1202 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1180);
    float _1204 = _1054 * _1182;
    float _1206 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1188);
    float _1208 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1190);
    float _1210 = _1054 * _1194;
    float _1212 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1184);
    float _1214 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1196);
    float _1216 = _1054 * _1192;
    float _1218 = fma(_1090, _1206, _1204);
    float _1220 = fma(_1118, _1186, _1162);
    float _1222 = fma(_1090, _1212, _1210);
    float _1224 = fma(_1090, _1208, _1216);
    float _1226 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1200);
    float _1228 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1202);
    float _1230 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1214);
    float _1232 = fma(_1110, _1186, _1164);
    float _1234 = _1226 + _1218;
    float _1236 = _1228 + _1224;
    float _1238 = _1230 + _1222;
    float _1240 = -_1106;
    float _1242 = _976 + _1240;
    float _1244 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1246 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_76.x = _1234;
    out.m_76.y = _1236;
    out.m_76.z = _1238;
    float _1250 = fma(_1242, 2.0, -1.0);
    float _1252 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1244);
    float _1254 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1256 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1260 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1252);
    float _1262 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1254);
    float _1264 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1256);
    float _1266 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1166);
    float _1268 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1168);
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1170);
    float _1272 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1274 = _1266 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1276 = _1268 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1280 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1282 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1284 = _1272 + _1274;
    float _1286 = _1280 + _1276;
    float _1288 = _1282 + _1278;
    float _1290 = _1184;
    float _1292 = _1268;
    float _1294 = _1054;
    float _1296 = _1270;
    float _1298 = _1268;
    float _1300 = _1120;
    float _1302 = _1250;
    float _1304 = _1136;
    float _1306 = _1226;
    float _1316;
    float _1318;
    float _1320;
    float _1322;
    if (!_986)
    {
        bool _1308 = _1276 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1310 = !_1308;
        _1312 = _1310;
        if (!_1312)
        {
            float _1314 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1316 = _1314;
            _1318 = 0.0;
            _1320 = 0.0;
            _1322 = 0.0;
            _1324 = true;
        }
    }
    if ((!_1324) || _1312)
    {
        bool _1362;
        if (!_1312)
        {
            bool _1326 = _1276 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1328 = isnan(_1276);
            bool _1330 = _1326 || _1328;
            bool _1332 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1334 = _1330 || _1332;
            bool _1336 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1338 = !_1334;
            bool _1340 = _1336 && _1338;
            bool _1342 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1344 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1340)
            {
                _1290 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1346 = _1290;
            float _1348 = _1346;
            if (_1340)
            {
                _1292 = 0.0;
            }
            float _1350 = _1292;
            _1298 = _1350;
            _1318 = _1350;
            if (_1340)
            {
                _1294 = 0.0;
            }
            float _1352 = _1294;
            _1320 = _1352;
            if (_1340)
            {
                float _1354 = _1346 * 5.0;
                _1348 = _1354;
            }
            float _1356 = _1348;
            _1316 = _1356;
            if (_1340)
            {
                _1344 = 0.0;
            }
            float _1358 = _1344;
            bool _1360 = !_1334;
            _1362 = _1360 && _1342;
            _1296 = _1358;
            _1322 = _1358;
        }
        if ((!_1362) || _1312)
        {
            _1312 = false;
            float _1364 = _1296;
            float _1366 = _1298;
            bool _1368 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1370 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1372 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1374 = _1282;
            float _1376 = _1364;
            float _1378 = _1366;
            _1316 = _1288;
            _1320 = _1286;
            if (_1368)
            {
                float _1380 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1374 = _1380;
            }
            float _1382 = _1374;
            if (_1368)
            {
                float _1384 = abs(_1136);
                float _1386 = -_1384;
                float _1388 = _1386 + 1.0;
                _1376 = _1388;
            }
            float _1390 = _1376;
            float _1392 = _1390;
            if (_1370)
            {
                float _1394 = abs(_1120);
                float _1396 = -_1394;
                float _1398 = _1396 + 1.0;
                _1300 = _1398;
            }
            float _1400 = _1300;
            if (!_1368)
            {
                _1378 = 1.0;
            }
            float _1402 = _1378;
            float _1404 = _1402;
            if (_1372)
            {
                float _1406 = abs(_1250);
                float _1408 = -_1406;
                float _1410 = _1408 + 1.0;
                _1302 = _1410;
            }
            float _1412 = _1302;
            if (!_1370)
            {
                _1304 = 1.0;
            }
            float _1414 = _1304;
            float _1416 = _1272;
            float _1418 = _1414;
            if (_1370)
            {
                float _1420 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1416 = _1420;
            }
            float _1422 = _1416;
            float _1424 = _1280;
            if (_1372)
            {
                float _1426 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1424 = _1426;
            }
            float _1428 = _1424;
            if (_1368)
            {
                float _1430 = _1390 * _1382;
                float _1432 = precise::clamp(_1430, 0.0, 1.0);
                _1404 = _1432;
            }
            float _1434 = _1404;
            if (!_1372)
            {
                _1392 = 1.0;
            }
            float _1436 = _1392;
            float _1438 = _1436;
            if (_1370)
            {
                float _1440 = _1400 * _1422;
                float _1442 = precise::clamp(_1440, 0.0, 1.0);
                _1418 = _1442;
            }
            float _1444 = _1418;
            float _1446 = _1434 * _1444;
            _1318 = _1284;
            if (_1372)
            {
                float _1448 = _1412 * _1428;
                float _1450 = precise::clamp(_1448, 0.0, 1.0);
                _1438 = _1450;
            }
            float _1452 = _1438;
            float _1454 = _1446 * _1452;
            _1322 = _1454;
        }
    }
    _1324 = false;
    float _1456 = _1316;
    float _1458 = _1318;
    float _1460 = _1320;
    float _1462 = _1322;
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1466 = _1456 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1458 + _1468;
    float _1472 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1474 = _1466 * _1466;
    float _1476 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1472);
    float _1478 = fma(_1470, _1470, _1474);
    float _1480 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1476);
    float _1482 = sqrt(_1478);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1486 = !_1484;
    float _1488 = _1460;
    float _1490 = _1458;
    float _1492 = _1456;
    if (!_1486)
    {
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1498 = _1482 + _1496;
        float _1500 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1502 = rsqrt(_1478);
        float _1504 = _1498 * _1494;
        float _1506 = _1504 * 0.15915493667125701904296875;
        float _1508 = _1506 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        float _1512 = _1506 * 6.283185482025146484375;
        float _1514 = sin(_1512);
        float _1516 = _1510 + (-1.0);
        float _1518 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1520 = fma(_1514, _1500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1522 = fma(_1510, _1460, _1518);
        float _1524 = _1502 * _1520;
        float _1526 = fma(_1470, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1528 = fma(_1466, _1524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1488 = _1522;
        _1490 = _1526;
        _1492 = _1528;
    }
    float _1530 = _1488;
    float _1532 = _1490;
    float _1534 = _1492;
    float _1536 = -_1276;
    float _1538 = _1536 + _1530;
    float _1540 = -_1274;
    float _1542 = _1540 + _1532;
    float _1544 = -_1278;
    float _1546 = _1544 + _1534;
    float _1548 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1550 = _1538 * _1538;
    float _1552 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1554 = 1.0 / _1548;
    float _1556 = fma(_1542, _1542, _1550);
    float _1558 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1552);
    bool _1560 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1562 = isnan(0.5);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1568 = _1564 || _1566;
    float _1570 = fma(_1546, _1546, _1556);
    float _1572 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1558);
    bool _1574 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1576 = isnan(0.5);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1582 = _1578 || _1580;
    float _1584 = sqrt(_1570);
    float _1586 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1588 = _1586 + _1548;
    float _1590 = _1588 * _1554;
    float _1592 = _1590 * 0.5;
    bool _1594 = _1584 > 0.0;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1598 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1596);
    float _1600 = 1.0 / _1598;
    bool _1602 = !_1594;
    float _1604 = _1532;
    float _1606 = _1530;
    float _1608 = _1534;
    float _1610 = _1548;
    float _1612 = _1538;
    float _1614 = _1542;
    if (!_1602)
    {
        float _1616 = _303 * _303;
        float _1618 = rsqrt(_1570);
        float _1620 = fma(_301, _301, _1616);
        float _1622 = fma(_305, _305, _1620);
        float _1624 = sqrt(_1622);
        float _1626 = _1542 * _1618;
        float _1628 = _1538 * _1618;
        float _1630 = _1546 * _1618;
        bool _1632 = _1624 > 0.0;
        bool _1634 = !_1632;
        _1610 = _1628;
        if (!_1634)
        {
            float _1636 = rsqrt(_1622);
            float _1638 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1640 = _303 * _1636;
            float _1642 = _301 * _1636;
            float _1644 = _1628 * _1640;
            float _1646 = _305 * _1636;
            float _1648 = fma(_1626, _1642, _1644);
            float _1650 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1652 = fma(_1630, _1646, _1648);
            float _1654 = _1652 * _1650;
            float _1656 = fma(_301, _1654, _1532);
            float _1658 = fma(_303, _1654, _1530);
            float _1660 = fma(_305, _1654, _1534);
            _1604 = _1656;
            _1606 = _1658;
            _1608 = _1660;
            _1610 = _1648;
        }
    }
    float _1662 = _1604;
    float _1664 = _1606;
    float _1666 = _1608;
    float _1668 = _1610;
    float _1670 = _1668;
    float _1672 = _1664;
    float _1674 = _1666;
    if (_1582)
    {
        _1612 = 1.0;
    }
    float _1676 = _1612;
    float _1678 = _1676;
    if (_1568)
    {
        _1614 = _1662;
    }
    float _1680 = _1614;
    float _1682 = _1680;
    if (!_1568)
    {
        float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1686 = _1276 + _1684;
        float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1690 = _1274 + _1688;
        float _1692 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1694 = -_1274;
        float _1696 = _1694 + _1662;
        float _1698 = _1686 * _1686;
        float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1702 = _1278 + _1700;
        float _1704 = fma(_1690, _1690, _1698);
        float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1708 = fma(_1702, _1702, _1704);
        float _1710 = sqrt(_1708);
        float _1712 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1714 = precise::min(_1710, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1716 = _1714 * _1706;
        float _1718 = _1712 * _1716;
        float _1720 = -_1276;
        float _1722 = _1720 + _1664;
        float _1724 = -_1278;
        float _1726 = _1724 + _1666;
        float _1728 = fma(_1696, _1718, _1274);
        float _1730 = fma(_1722, _1718, _1276);
        float _1732 = fma(_1726, _1718, _1278);
        _1670 = _1722;
        _1672 = _1730;
        _1682 = _1728;
        _1674 = _1732;
    }
    float _1734 = _1670;
    float _1736 = _1672;
    float _1738 = _1682;
    float _1740 = _1674;
    float _1742 = _1734;
    if (_1582)
    {
        _1306 = 1.0;
    }
    float _1744 = _1306;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1748 = _1600 * _1746;
    float _1750 = _1744;
    if (!_1582)
    {
        float _1752 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1754 = _1752 * 0.15915493667125701904296875;
        float _1756 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1758 = _1754 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1756 * 0.15915493667125701904296875;
        float _1764 = _1754 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = 1.0 / _1760;
        float _1770 = _1762 * 6.283185482025146484375;
        float _1772 = cos(_1770);
        float _1774 = _1766 * _1768;
        float _1776 = _1762 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1772 * _1774;
        float _1782 = 1.0 / _1780;
        float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1786 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1784;
        float _1788 = 1.0 / _1786;
        float _1790 = _1778 * _1782;
        float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1794 = fma(_1748, _1790, _1792);
        float _1796 = _1794 * _1788;
        float _1798 = precise::clamp(_1796, 0.0, 1.0);
        _1742 = _1794;
        _1678 = _1798;
    }
    float _1800 = _1742;
    float _1802 = _1678;
    float _1804 = _1800;
    if (!_1582)
    {
        float _1806 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1808 = _1806 * 0.15915493667125701904296875;
        float _1810 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1812 = _1808 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1810 * 0.15915493667125701904296875;
        float _1818 = _1808 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = 1.0 / _1814;
        float _1824 = _1816 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        float _1828 = _1820 * _1822;
        float _1830 = _1816 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        float _1834 = _1826 * _1828;
        float _1836 = 1.0 / _1834;
        float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1840 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1838;
        float _1842 = 1.0 / _1840;
        float _1844 = _1832 * _1836;
        float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1848 = fma(_1748, _1844, _1846);
        float _1850 = _1848 * _1842;
        float _1852 = precise::clamp(_1850, 0.0, 1.0);
        float _1854 = -_1852;
        float _1856 = _1854 + 1.0;
        _1804 = _1822;
        _1750 = _1856;
    }
    float _1858 = _1804;
    float _1860 = _1750;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1864 = _1736 + _1862;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1868 = _1738 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1872 = _1740 + _1870;
    float _1874 = _1864 * _1864;
    float _1876 = fma(_1868, _1868, _1874);
    float _1878 = fma(_1872, _1872, _1876);
    float _1880 = rsqrt(_1878);
    float _1882 = sqrt(_1878);
    float _1884 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1886 = _1868 * _1884;
    float _1888 = _1872 * _1884;
    float _1890 = _1886 * _1886;
    float _1892 = _1888 * _1888;
    float _1894 = _1890 + _1892;
    float _1896 = sqrt(_1894);
    bool _1898 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1896 + _1900;
    float _1904 = _1872;
    float _1906 = _1894;
    float _1908 = _1902;
    float _1910 = _1858;
    float _1912 = _1884;
    if (_1898)
    {
        float _1914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1904 = _1914;
    }
    float _1916 = _1904;
    if (_1898)
    {
        float _1918 = rsqrt(_1894);
        _1906 = _1918;
    }
    float _1920 = _1906;
    if (_1898)
    {
        float _1922 = _1902 * _1916;
        _1908 = _1922;
    }
    float _1924 = _1908;
    if (_1898)
    {
        float _1926 = _1924 * 0.15915493667125701904296875;
        _1910 = _1926;
    }
    float _1928 = _1910;
    float _1930 = _1874;
    float _1932 = _1928;
    if (_1898)
    {
        float _1934 = _1928 * 6.283185482025146484375;
        float _1936 = sin(_1934);
        _1930 = _1936;
    }
    float _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1942 = precise::max(0.0, _1940);
    float _1944 = _1880;
    float _1946 = _1942;
    float _1948 = _1940;
    if (_1898)
    {
        float _1950 = _1928 * 6.283185482025146484375;
        float _1952 = cos(_1950);
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = -_1884;
    float _1958 = -_1942;
    float _1960 = fma(_1864, _1956, _1958);
    float _1962 = _1960;
    if (!_1898)
    {
        _1946 = _1886;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (_1898)
    {
        float _1968 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1948 = _1968;
    }
    float _1970 = _1948;
    float _1972 = _1938;
    float _1974 = _1970;
    if (_1898)
    {
        float _1976 = fma(_1938, _1970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = _1978;
    float _1982 = _1954;
    if (_1898)
    {
        float _1984 = _1954 + (-1.0);
        _1974 = _1984;
    }
    float _1986 = _1974;
    float _1988 = _1986;
    if (_1898)
    {
        float _1990 = _1920 * _1978;
        _1912 = _1990;
    }
    float _1992 = _1912;
    if (!_1898)
    {
        _1980 = _1890;
    }
    float _1994 = _1980;
    float _1996 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1998 = _1994;
    if (_1898)
    {
        float _2000 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _2000;
    }
    float _2002 = _1932;
    if (_1898)
    {
        float _2004 = _1886 * _1992;
        _1966 = _2004;
    }
    float _2006 = _1966;
    if (!_1898)
    {
        _1988 = _1888;
    }
    float _2008 = _1988;
    float _2010 = _2008;
    if (_1898)
    {
        float _2012 = _1888 * _1992;
        _2010 = _2012;
    }
    float _2014 = _2010;
    if (_1898)
    {
        float _2016 = fma(_1960, _1954, _2002);
        _1962 = _2016;
    }
    float _2018 = _1962;
    if (_1898)
    {
        float _2020 = _2006 * _2006;
        _1998 = _2020;
    }
    float _2022 = _1998;
    if (!_1898)
    {
        _1982 = _1892;
    }
    float _2024 = _1982;
    float _2026 = _2024;
    if (_1898)
    {
        float _2028 = _2014 * _2014;
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = fma(_2018, _2018, _2022);
    float _2034 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2036 = _2032 + _2030;
    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2040 = fma(_1882, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2038);
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1996);
    float _2046 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2048 = rsqrt(_2036);
    float _2050 = -_2042;
    float _2052 = _2050 + 1.0;
    float _2054 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2044);
    float _2056 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2058 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2046);
    float _2060 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2056);
    float _2066 = abs(_2052);
    float _2068 = log2(_2066);
    float _2070 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2058);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2074 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2076 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2060);
    float _2078 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2080 = -_2072;
    float _2082 = fma(_2080, _2034, 1.0);
    float _2084 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2086 = _2048 * _2006;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2090 = _2048 * _2018;
    float _2092 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2094 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2096 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2088);
    float _2098 = _2048 * _2014;
    float _2100 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2102 = -_2094;
    float _2104 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2102);
    float _2106 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2110 = log2(_2082);
    float _2112 = -_2098;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2104);
    float _2116 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2118 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2108);
    float _2120 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2122 = fma(_2114, -0.5, 0.5);
    float _2124 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2116);
    float _2126 = fma(_2114, 0.5, 0.5);
    float _2128 = exp2(_2106);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2120);
    float _2132 = _2090 + 1.0;
    float _2134 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2124);
    float _2136 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2130);
    float _2138 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2134);
    float _2140 = 1.0 / _2118;
    float _2142 = fma(_2126, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2144 = _2110 * 0.693147182464599609375;
    float _2146 = fma(_2126, _2142, -0.212114393711090087890625);
    float _2148 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = sqrt(_2122);
    float _2152 = -_2090;
    float _2154 = fma(_2128, _2132, _2152);
    float _2156 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2136);
    float _2158 = fma(_2126, _2146, 1.570728778839111328125);
    float _2160 = _2138 * _2140;
    float _2162 = _2156 * _2140;
    float _2164 = fma(_2160, 0.5, 0.5);
    float _2166 = fma(_2162, -0.5, 0.5);
    float _2168 = _2150 * 0.636619746685028076171875;
    float3 _6153 = float3(_2164, _2166, _2148);
    float _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6153, float3(0.0), isnan(_6153)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6153, float3(0.0), isnan(_6153)), level(0.0)).x;
    float _2172 = -_2158;
    float _2174 = fma(_2168, _2172, 1.0);
    float _2176 = fma(_2154, 0.5, 0.5);
    float3 _6171 = float3(_2164, _2166, _2148);
    float4 _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6171, float3(0.0), isnan(_6171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6171, float3(0.0), isnan(_6171)), level(0.0)).xyzw;
    float _2181 = _2179.x;
    float _2183 = _2179.y;
    float _2185 = _2179.z;
    float _2187 = _2179.w;
    float2 _6188 = float2(_2174, _2176);
    float3 _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _2193 = _2191.x;
    float _2195 = _2191.y;
    float _2197 = _2191.z;
    float _2199 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2201 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2203 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2205 = -_303;
    float _2207 = _2205 + _1736;
    float _2209 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2199);
    float _2211 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2201);
    float _2213 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2203);
    float _2215 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2217 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2209);
    float _2219 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2211);
    float _2221 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2213);
    float _2223 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2215);
    float _2225 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2227 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2229 = _2221 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2231 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2223);
    float _2233 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2235 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2237 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2239 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2241 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2233);
    float _2243 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2235);
    float _2245 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2249 = _2237 + _2241;
    float _2251 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2243);
    float _2253 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2255 = -_305;
    float _2257 = _2255 + _1740;
    float _2259 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2249);
    float _2261 = _2225 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2263 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2265 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2267 = exp2(_2253);
    float _2269 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2261);
    float _2271 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2251);
    float _2273 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2275 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2265);
    float _2277 = _2247 + _2269;
    float _2279 = -_301;
    float _2281 = _2279 + _1738;
    float _2283 = _1802 * _1860;
    float _2285 = 1.0 / _2259;
    float _2287 = _2229 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2289 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2273);
    float _2291 = _2283 * _1462;
    out.m_78.y = 1.0;
    float _2293 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2275);
    float _2295 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2289);
    float _2297 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2299 = _2287 + _2263;
    float _2301 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2303 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2305 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2297);
    float _2307 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2309 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2299);
    float _2311 = -_2267;
    float _2313 = _2311 + 1.0;
    float _2315 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2305);
    float _2317 = 1.0 / _2303;
    float _2319 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2307);
    float _2321 = _2301 * _2285;
    float _2323 = _2271 * _2285;
    float _2325 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2293);
    float _2327 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2319);
    float _2329 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2331 = _2291 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2333 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2335 = _2323 > 0.0;
    float _2337 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _2339 = _309 * _2331;
    out.gl_Position.x = _2138;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _2325;
    out.gl_Position.w = _2118;
    bool _2341 = _2323 < 1.0;
    bool _2343 = _2341 && _2335;
    float _2345 = _2325 + _2118;
    float _2347 = _2333 * _2317;
    bool _2349 = _2160 > (-1.0);
    bool _2351 = _2349 && _2343;
    float _2353 = _2345 * 0.5;
    float _2355 = _2309 * _2285;
    float _2357 = _2337 * _2317;
    bool _2359 = _2162 > (-1.0);
    bool _2361 = _2359 && _2351;
    out.m_80.z = _2353;
    out.m_80.w = _2118;
    float _2363 = -_2329;
    float _2365 = _2363 + 1.0;
    bool _2367 = _2160 < 1.0;
    bool _2369 = _2367 && _2361;
    bool _2371 = _2162 < 1.0;
    bool _2373 = _2371 && _2369;
    float _2375 = _2329 * _2170;
    float _2377 = _2187 * _2375;
    float _2379 = _2197 * _2375;
    float _2381 = fma(_2193, _2377, _2181);
    float _2383 = fma(_2195, _2377, _2183);
    float _2385 = _2187 * _2365;
    float _2387 = fma(_2187, _2379, _2185);
    out.m_82.x = _2381;
    out.m_82.y = _2383;
    out.m_82.z = _2387;
    out.m_82.w = _2385;
    bool _2389 = !_2373;
    float _2391 = _2353;
    float _2393 = _2156;
    float _2395 = _2325;
    float _2397 = _2118;
    float _2399 = _2365;
    float _2401 = _2329;
    float _2403 = _2339;
    if (!_2389)
    {
        float _2405 = -_2355;
        float _2407 = _2162 + _2405;
        float _2409 = -_2321;
        float _2411 = _2160 + _2409;
        float _2413 = -_2347;
        float _2415 = _2160 + _2413;
        float _2417 = -_2357;
        float _2419 = _2162 + _2417;
        float _2421 = _2407 * _2407;
        float _2423 = fma(_2411, _2411, _2421);
        float _2425 = sqrt(_2423);
        bool _2427 = _2425 > 0.0;
        bool _2429 = !_2427;
        _2391 = _2423;
        _2401 = _2425;
        _2431 = _2429;
        if (!_2431)
        {
            float _2433 = _2419 * _2419;
            float _2435 = fma(_2415, _2415, _2433);
            float _2437 = rsqrt(_2423);
            float _2439 = sqrt(_2435);
            float _2441 = _2411 * _2437;
            float _2443 = _2407 * _2437;
            bool _2445 = _2439 > 0.0;
            bool _2447 = !_2445;
            _2397 = _2439;
            _2401 = _2437;
            _2431 = _2447;
            if (!_2431)
            {
                float _2449 = _1102 * _2239;
                float _2451 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2237);
                float _2455 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2287);
                float _2457 = fma(_2449, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2247);
                float _2459 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2453);
                float _2461 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2455);
                float _2463 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2457);
                float _2465 = rsqrt(_2435);
                float _2467 = _2451 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2469 = 1.0 / _2459;
                float _2471 = _2419 * _2467;
                float _2473 = _2415 * _2467;
                float _2475 = _2471 * _2471;
                float _2477 = fma(_2473, _2473, _2475);
                float _2479 = _2419 * _2465;
                float _2481 = _2415 * _2465;
                float _2483 = _2443 * _2479;
                float _2485 = _2461 * _2469;
                float _2487 = _2463 * _2469;
                float _2489 = sqrt(_2477);
                float _2491 = fma(_2441, _2481, _2483);
                float _2493 = _2485 * _2485;
                float _2495 = fma(_2487, _2487, _2493);
                float _2497 = precise::min(0.0, _2491);
                float _2499 = sqrt(_2495);
                float _2501 = _2118 * _2497;
                float _2503 = fma(_2473, _2501, _2138);
                float _2505 = fma(_2471, _2501, _2156);
                out.gl_Position.x = _2503;
                out.gl_Position.y = _2505;
                float _2507 = fma(_2489, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2499);
                float _2509 = 1.0 / _2507;
                float _2511 = _2499 * _2509;
                out.m_78.y = _2511;
                _2391 = _2501;
                _2395 = _2489;
                _2397 = _2473;
                _2399 = _2471;
                _2401 = _2491;
                _2431 = true;
            }
        }
    }
    else
    {
        float _2513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2513;
        _2393 = 0.0;
        _2395 = _2513;
        _2399 = 0.0;
        _2403 = 0.0;
    }
    _2431 = false;
    float _2515 = _2391;
    float _2517 = _2393;
    float _2519 = _2395;
    float _2521 = _2397;
    float _2523 = _2399;
    float _2525 = _2401;
    float _2527 = _2403;
    bool _2529 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2531 = isnan(_1882);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2537 = _2533 || _2535;
    float _2539 = _2519;
    float _2541 = _2517;
    float _2543 = _2523;
    float _2545 = _2521;
    float _2547 = _2515;
    float _2549 = _2525;
    if (!_2537)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2551 = _2539;
    float _2553 = _2551;
    float _2555 = _2551;
    if (!_2537)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2557 = _2541;
    float _2559 = _2557;
    float _2561 = _2557;
    if (!_2537)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2563 = _2543;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2537)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2569 = _2545;
    float _2571 = _2569;
    float _2573 = _2569;
    if (!_2537)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2575 = _2547;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2537)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2549;
    bool _2583 = !_2537;
    float _2585 = _2581;
    float _2587 = _2581;
    if (!_2583)
    {
        bool _2589 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2591 = isnan(_1882);
        bool _2593 = _2589 || _2591;
        bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2597 = _2593 || _2595;
        if (!_2597)
        {
            float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2601 = _1882 + _2599;
            float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2605 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2603;
            float _2607 = 1.0 / _2605;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2629 = _2601 * _2607;
            float _2631 = precise::clamp(_2629, 0.0, 1.0);
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2637 = fma(_2631, _2611, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2639 = fma(_2631, _2635, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2631, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2643 = fma(_2631, _2619, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2645 = fma(_2631, _2623, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2647 = fma(_2631, _2627, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2561 = _2639;
            _2579 = _2645;
            _2555 = _2637;
            _2573 = _2643;
            _2567 = _2641;
            _2587 = _2647;
            _2649 = true;
        }
        else
        {
            bool _2651 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2653 = isnan(_1882);
            bool _2655 = _2651 || _2653;
            bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2659 = _2655 || _2657;
            if (!_2659)
            {
                _2553 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2661 = _2553;
            _2555 = _2661;
            if (!_2659)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2663 = _2559;
            _2561 = _2663;
            if (!_2659)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2665 = _2565;
            _2567 = _2665;
            if (!_2659)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2667 = _2571;
            _2573 = _2667;
            if (!_2659)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2669 = _2577;
            _2579 = _2669;
            if (!_2659)
            {
                _2585 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2671 = _2585;
            bool _2673 = !_2659;
            _2587 = _2671;
            if (!_2673)
            {
                bool _2675 = _1882 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2677 = isnan(_1882);
                bool _2679 = _2675 || _2677;
                bool _2681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2683 = _2679 || _2681;
                if (!_2683)
                {
                    float _2685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2687 = _1882 + _2685;
                    float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2691 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2689;
                    float _2693 = 1.0 / _2691;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2697 = _2695 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2705 = _2703 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2715 = _2687 * _2693;
                    float _2717 = precise::clamp(_2715, 0.0, 1.0);
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2723 = fma(_2717, _2697, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2725 = fma(_2717, _2721, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2717, _2701, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2729 = fma(_2717, _2705, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2731 = fma(_2717, _2709, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2733 = fma(_2717, _2713, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2561 = _2725;
                    _2579 = _2731;
                    _2555 = _2723;
                    _2573 = _2729;
                    _2567 = _2727;
                    _2587 = _2733;
                    _2649 = true;
                }
                else
                {
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2555 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2587 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2649 = false;
    float _2735 = _2561;
    float _2737 = _2579;
    float _2739 = _2555;
    float _2741 = _2573;
    float _2743 = _2567;
    float _2745 = _2587;
    float _2747 = fma(_1236, -0.5, 0.5);
    float _2749 = precise::clamp(_2747, 0.0, 1.0);
    float _2751 = -_2735;
    float _2753 = _2751 + _2737;
    float _2755 = -_2739;
    float _2757 = _2755 + _2741;
    out.m_84.x = 0.0;
    float _2759 = -_2743;
    float _2761 = _2759 + _2745;
    float _2763 = fma(_2749, _2753, _2735);
    float _2765 = fma(_2749, _2757, _2739);
    bool _2767 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2769 = _2763 * 0.586610972881317138671875;
    float _2771 = fma(_2749, _2761, _2743);
    float _2773 = _2527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2775 = _1802 > 0.0;
    bool _2777 = isnan(_1802);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2765, 0.298911988735198974609375, _2769);
    out.m_49.x = _2773;
    float _2787 = fma(_2771, 0.114477999508380889892578125, _2785);
    bool _2789 = _1860 <= 0.0;
    bool _2791 = !_2783;
    bool _2793 = _2789 || _2791;
    float _2795 = -_2787;
    float _2797 = _2765 + _2795;
    float _2799 = -_2787;
    float _2801 = _2771 + _2799;
    float _2803 = -_2787;
    float _2805 = _2763 + _2803;
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    float _2809 = fma(_2801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    float _2811 = fma(_2805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2787);
    bool _2813 = !_2767;
    if (!_2813)
    {
        float _2815 = -_1736;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2819 = -_1738;
        float _2821 = _2819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2823 = -_1740;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2827 = _2817 * _2817;
        float _2829 = fma(_2821, _2821, _2827);
        float _2831 = fma(_2825, _2825, _2829);
        float _2833 = sqrt(_2831);
        float _2835 = rsqrt(_2831);
        float _2837 = -_2833;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2841 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = _2821 * _2835;
        float _2847 = _2817 * _2835;
        float _2849 = abs(_2843);
        float _2851 = log2(_2849);
        float _2853 = _2825 * _2835;
        float _2855 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2857 = _1236 * _2847;
        float _2859 = -_2847;
        float _2861 = -_2855;
        float _2863 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2861);
        float _2865 = fma(_1234, _2845, _2857);
        float _2867 = -_2853;
        float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2863);
        float _2871 = fma(_1238, _2853, _2865);
        float _2873 = precise::clamp(_2871, 0.0, 1.0);
        float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2877 = _2869 + _2875;
        float _2879 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2881 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = exp2(_2879);
        float _2887 = _2885 * _2883;
        float _2889 = _2873 * _2887;
        float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2895 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2891;
        out.m_84.y = _2893;
        out.m_84.z = _2895;
    }
    out.m_86.x = _2807;
    out.m_86.y = _2811;
    out.m_86.z = _2809;
    if (!_2793)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2897;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

